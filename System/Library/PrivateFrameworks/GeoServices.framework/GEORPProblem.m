@interface GEORPProblem
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasProblemContext;
- (BOOL)hasProblemCorrections;
- (BOOL)hasProblemType;
- (BOOL)hasProtocolVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPProblem)init;
- (GEORPProblem)initWithData:(id)a3;
- (GEORPProblem)initWithDictionary:(id)a3;
- (GEORPProblem)initWithJSON:(id)a3;
- (GEORPProblemContext)problemContext;
- (GEORPProblemCorrections)problemCorrections;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)problemTypeAsString:(int)a3;
- (id)userPathsAsString:(int)a3;
- (int)StringAsProblemType:(id)a3;
- (int)StringAsUserPaths:(id)a3;
- (int)problemType;
- (int)userPathAtIndex:(unint64_t)a3;
- (int)userPaths;
- (unint64_t)hash;
- (unint64_t)userPathsCount;
- (unsigned)protocolVersion;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readProblemContext;
- (void)_readProblemCorrections;
- (void)_readUserPaths;
- (void)addUserPath:(int)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUserPaths;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasProblemType:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setProblemContext:(id)a3;
- (void)setProblemCorrections:(id)a3;
- (void)setProblemType:(int)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setUserPaths:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblem

- (GEORPProblem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblem;
  v2 = [(GEORPProblem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblem;
  v3 = [(GEORPProblem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPProblem;
  [(GEORPProblem *)&v3 dealloc];
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readUserPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserPaths_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)userPathsCount
{
  return self->_userPaths.count;
}

- (int)userPaths
{
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addUserPath:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)userPathAtIndex:(unint64_t)a3
{
  -[GEORPProblem _readUserPaths]((uint64_t)self);
  p_userPaths = &self->_userPaths;
  unint64_t count = self->_userPaths.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_userPaths->list[a3];
}

- (void)setUserPaths:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_userPaths, a3, a4);
}

- (id)userPathsAsString:(int)a3
{
  if a3 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> a3))
  {
    id v3 = off_1E53E6BF0[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsUserPaths:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_PATH_ITEM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_PROBLEM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_PROBLEM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADDRESS_EDIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ADDRESS_EDIT_LABEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CORRECT_COORDINATE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_FEATURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_REGION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LOCATION_CLOSED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"COMMENTS_AND_PHOTO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SATELLITE_IMAGE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEPS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GUIDANCE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ROUTE_PLANNING"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_PICKER"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MAP_PROBLEM"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TRANSIT_DIRECTIONS_PROBLEM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_PROBLEM"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TRANSFER_PICKER"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_PICKER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_DISPLAY_PROBLEM"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_PICKER"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SERVICE_CHANGE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SCHEDULES"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"TRANSIT_BAD_ROUTE_SUGGESTIONS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ACCESS_POINT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SUBCATEGORY_PICKER"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"LOCATION_ADD"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"IM_LOST"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_NAME_INCORRECT"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_SHAPE_INCORRECT"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_ROUTE_WRONG"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_ETA"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ACCESS_POINT_PICKER"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_MAP_CORRECTION"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"WHICH_PERSONALIZED_MAP_ADDRESS"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_MAP_PLACE_PROBLEM"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ADD_A_PLACE_TYPE_SELECTION"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PLACE_CATEGORY_SELECTION"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TAKE_PHOTO"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"BRAND_PROBLEM"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"BRAND_CORRECTIONS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"ADDRESS_INFO"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"ADDRESS_SEARCH"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_PROBLEM"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)problemType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_problemType;
  }
  else {
    return -1;
  }
}

- (void)setProblemType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_problemType = a3;
}

- (void)setHasProblemType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasProblemType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)problemTypeAsString:(int)a3
{
  int v4 = @"PROBLEM_TYPE_UNKNOWN";
  switch(a3)
  {
    case -1:
      goto LABEL_57;
    case 0:
      int v4 = @"INCORRECT_INFO";
      break;
    case 1:
      int v4 = @"INCORRECT_MAP_LABEL";
      break;
    case 2:
      int v4 = @"MISSING_LOCATION";
      break;
    case 3:
      int v4 = @"INCORRECT_PIN_LOCATION";
      break;
    case 4:
      int v4 = @"CLOSED_PERMANENTLY";
      break;
    case 5:
      int v4 = @"DOES_NOT_EXIST_INCORRECT_PIN_LOCATION";
      break;
    case 6:
      int v4 = @"DOES_NOT_EXIST_NO_SUCH_PLACE";
      break;
    case 7:
      int v4 = @"DOES_NOT_EXIST_OTHER";
      break;
    case 8:
      int v4 = @"SEARCH_UNEXPECTED";
      break;
    case 9:
      int v4 = @"SEARCH_SELECTED_WRONG_PIN";
      break;
    case 10:
      int v4 = @"SEARCH_SHOULD_NOT_HAVE_MOVED_MAP";
      break;
    case 11:
      int v4 = @"SEARCH_SHOULD_HAVE_MOVED_MAP";
      break;
    case 12:
      int v4 = @"SEARCH_NOT_LISTED";
      break;
    case 13:
      int v4 = @"SATELLITE_OUTDATED";
      break;
    case 14:
      int v4 = @"SATELLITE_QUALITY";
      break;
    case 15:
      int v4 = @"SATELLITE_NOT_LISTED";
      break;
    case 16:
      int v4 = @"DIRECTIONS_PROBLEM_BASIC";
      break;
    case 17:
      int v4 = @"DIRECTIONS_DESTINATION_WRONG";
      break;
    case 20:
      int v4 = @"DIRECTIONS_THROUGH_TRAFFIC";
      break;
    case 21:
      int v4 = @"DIRECTIONS_THROUGH_CLOSURE";
      break;
    case 22:
      int v4 = @"DIRECTIONS_STEP_WRONG_WAY";
      break;
    case 23:
      int v4 = @"DIRECTIONS_STEP_PROHIBITED";
      break;
    case 24:
      int v4 = @"DIRECTIONS_STEP_CLOSED_ROAD";
      break;
    case 25:
      int v4 = @"DIRECTIONS_STEP_UNNEEDED";
      break;
    case 26:
      int v4 = @"DIRECTIONS_STEP_MISSING_BEFORE";
      break;
    case 27:
      int v4 = @"DIRECTIONS_STEP_MISSING_AFTER";
      break;
    case 28:
      int v4 = @"DIRECTIONS_STEP_NOT_LISTED";
      break;
    case 29:
      int v4 = @"DIRECTIONS_NOT_LISTED";
      break;
    case 30:
      int v4 = @"TRAFFIC_INCIDENT_INCORRECT";
      break;
    case 31:
      int v4 = @"TRAFFIC_INCIDENT_MISSING";
      break;
    case 32:
      int v4 = @"TRAFFIC_FLOW_INCORRECT";
      break;
    case 33:
      int v4 = @"TRAFFIC_FLOW_MISSING";
      break;
    case 34:
      int v4 = @"TRAFFIC_NOT_LISTED";
      break;
    case 35:
      int v4 = @"NOT_LISTED";
      break;
    case 36:
      int v4 = @"DIRECTIONS_INCORRECT_INSTRUCTIONS";
      break;
    case 37:
      int v4 = @"DIRECTIONS_ROUTE_WRONG";
      break;
    case 38:
      int v4 = @"DIRECTIONS_PROBLEM_WITH_TRANSFER";
      break;
    case 39:
      int v4 = @"DIRECTIONS_INCORRECT_ETA";
      break;
    case 40:
      int v4 = @"TRANSIT_DELAY";
      break;
    case 41:
      int v4 = @"TRANSIT_INCORRECT_SCHEDULE";
      break;
    case 43:
      int v4 = @"INCORRECT_ENTRY_OR_EXIT";
      break;
    case 45:
      int v4 = @"INCORRECT_SHAPE";
      break;
    case 46:
      int v4 = @"OTHER_FEEDBACK";
      break;
    case 47:
      int v4 = @"CLOSED_TEMPORARILY";
      break;
    case 48:
      int v4 = @"CLOSED_HOURS_CHANGED";
      break;
    case 49:
      int v4 = @"TRANSIT_CANCELATION";
      break;
    case 50:
      int v4 = @"TRANSIT_SERVICE_CHANGED";
      break;
    case 54:
      int v4 = @"SEARCH_AUTOCOMPLETE_POI";
      break;
    case 55:
      int v4 = @"SEARCH_AUTOCOMPLETE_POI_CATEGORY";
      break;
    case 56:
      int v4 = @"SEARCH_AUTOCOMPLETE_ADDRESS";
      break;
    case 57:
      int v4 = @"SEARCH_AUTOCOMPLETE_LOCALITY";
      break;
    case 58:
      int v4 = @"SEARCH_AUTOCOMPLETE_OTHER";
      break;
    case 59:
      int v4 = @"TRANSIT_LINE_INCORRECT_NAME";
      break;
    case 60:
      int v4 = @"DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
      break;
    case 61:
      int v4 = @"PERSONALIZED_MAP_LOCATION_INCORRECT";
      break;
    case 62:
      int v4 = @"MISSING_LOCATION_BUSINESS";
      break;
    case 63:
      int v4 = @"MISSING_LOCATION_STREET";
      break;
    case 64:
      int v4 = @"MISSING_LOCATION_OTHER";
      break;
    case 65:
      int v4 = @"MERCHANT_LOOKUP";
      break;
    case 66:
      int v4 = @"GROUND_VIEW_CENSOR_REQUEST";
      break;
    case 67:
      int v4 = @"GROUND_VIEW_IMAGE_QUALITY";
      break;
    case 68:
      int v4 = @"GROUND_VIEW_STOREFRONT";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_57:
      break;
  }
  return v4;
}

- (int)StringAsProblemType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PROBLEM_TYPE_UNKNOWN"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"INCORRECT_INFO"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INCORRECT_MAP_LABEL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MISSING_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INCORRECT_PIN_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SEARCH_UNEXPECTED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SEARCH_SELECTED_WRONG_PIN"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SEARCH_SHOULD_NOT_HAVE_MOVED_MAP"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SEARCH_SHOULD_HAVE_MOVED_MAP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SEARCH_NOT_LISTED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SATELLITE_OUTDATED"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SATELLITE_QUALITY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SATELLITE_NOT_LISTED"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_PROBLEM_BASIC"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_DESTINATION_WRONG"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_THROUGH_TRAFFIC"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_THROUGH_CLOSURE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_WRONG_WAY"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_PROHIBITED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_CLOSED_ROAD"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_UNNEEDED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_MISSING_BEFORE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_MISSING_AFTER"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_STEP_NOT_LISTED"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_NOT_LISTED"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_INCORRECT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_MISSING"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_FLOW_INCORRECT"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_FLOW_MISSING"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_NOT_LISTED"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"NOT_LISTED"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_INCORRECT_INSTRUCTIONS"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_WRONG"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_PROBLEM_WITH_TRANSFER"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_INCORRECT_ETA"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"TRANSIT_INCORRECT_SCHEDULE"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"INCORRECT_ENTRY_OR_EXIT"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"INCORRECT_SHAPE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"OTHER_FEEDBACK"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"CLOSED_PERMANENTLY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CLOSED_TEMPORARILY"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"CLOSED_HOURS_CHANGED"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"TRANSIT_DELAY"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"TRANSIT_CANCELATION"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SERVICE_CHANGED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE_POI"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE_POI_CATEGORY"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE_ADDRESS"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE_LOCALITY"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"SEARCH_AUTOCOMPLETE_OTHER"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_INCORRECT_NAME"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_MAP_LOCATION_INCORRECT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"DOES_NOT_EXIST_INCORRECT_PIN_LOCATION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DOES_NOT_EXIST_NO_SUCH_PLACE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOES_NOT_EXIST_OTHER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MISSING_LOCATION_BUSINESS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"MISSING_LOCATION_STREET"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"MISSING_LOCATION_OTHER"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"MERCHANT_LOOKUP"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_CENSOR_REQUEST"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_IMAGE_QUALITY"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_STOREFRONT"])
  {
    int v4 = 68;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)_readProblemCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemCorrections
{
  return self->_problemCorrections != 0;
}

- (GEORPProblemCorrections)problemCorrections
{
  -[GEORPProblem _readProblemCorrections]((uint64_t)self);
  problemCorrections = self->_problemCorrections;

  return problemCorrections;
}

- (void)setProblemCorrections:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_problemCorrections, a3);
}

- (void)_readProblemContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemContext
{
  return self->_problemContext != 0;
}

- (GEORPProblemContext)problemContext
{
  -[GEORPProblem _readProblemContext]((uint64_t)self);
  problemContext = self->_problemContext;

  return problemContext;
}

- (void)setProblemContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_problemContext, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblem;
  int v4 = [(GEORPProblem *)&v8 description];
  v5 = [(GEORPProblem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        objc_super v6 = @"protocolVersion";
      }
      else {
        objc_super v6 = @"protocol_version";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 24))
    {
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(unsigned int *)(*v8 + 4 * v9);
          if v10 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> v10))
          {
            v11 = off_1E53E6BF0[(int)v10];
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = (void *)(a1 + 16);
        }
        while (v9 < *(void *)(a1 + 24));
      }
      if (a2) {
        v12 = @"userPath";
      }
      else {
        v12 = @"user_path";
      }
      [v4 setObject:v7 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      v13 = @"PROBLEM_TYPE_UNKNOWN";
      switch(*(_DWORD *)(a1 + 68))
      {
        case 0xFFFFFFFF:
          break;
        case 0:
          v13 = @"INCORRECT_INFO";
          break;
        case 1:
          v13 = @"INCORRECT_MAP_LABEL";
          break;
        case 2:
          v13 = @"MISSING_LOCATION";
          break;
        case 3:
          v13 = @"INCORRECT_PIN_LOCATION";
          break;
        case 4:
          v13 = @"CLOSED_PERMANENTLY";
          break;
        case 5:
          v13 = @"DOES_NOT_EXIST_INCORRECT_PIN_LOCATION";
          break;
        case 6:
          v13 = @"DOES_NOT_EXIST_NO_SUCH_PLACE";
          break;
        case 7:
          v13 = @"DOES_NOT_EXIST_OTHER";
          break;
        case 8:
          v13 = @"SEARCH_UNEXPECTED";
          break;
        case 9:
          v13 = @"SEARCH_SELECTED_WRONG_PIN";
          break;
        case 0xA:
          v13 = @"SEARCH_SHOULD_NOT_HAVE_MOVED_MAP";
          break;
        case 0xB:
          v13 = @"SEARCH_SHOULD_HAVE_MOVED_MAP";
          break;
        case 0xC:
          v13 = @"SEARCH_NOT_LISTED";
          break;
        case 0xD:
          v13 = @"SATELLITE_OUTDATED";
          break;
        case 0xE:
          v13 = @"SATELLITE_QUALITY";
          break;
        case 0xF:
          v13 = @"SATELLITE_NOT_LISTED";
          break;
        case 0x10:
          v13 = @"DIRECTIONS_PROBLEM_BASIC";
          break;
        case 0x11:
          v13 = @"DIRECTIONS_DESTINATION_WRONG";
          break;
        case 0x14:
          v13 = @"DIRECTIONS_THROUGH_TRAFFIC";
          break;
        case 0x15:
          v13 = @"DIRECTIONS_THROUGH_CLOSURE";
          break;
        case 0x16:
          v13 = @"DIRECTIONS_STEP_WRONG_WAY";
          break;
        case 0x17:
          v13 = @"DIRECTIONS_STEP_PROHIBITED";
          break;
        case 0x18:
          v13 = @"DIRECTIONS_STEP_CLOSED_ROAD";
          break;
        case 0x19:
          v13 = @"DIRECTIONS_STEP_UNNEEDED";
          break;
        case 0x1A:
          v13 = @"DIRECTIONS_STEP_MISSING_BEFORE";
          break;
        case 0x1B:
          v13 = @"DIRECTIONS_STEP_MISSING_AFTER";
          break;
        case 0x1C:
          v13 = @"DIRECTIONS_STEP_NOT_LISTED";
          break;
        case 0x1D:
          v13 = @"DIRECTIONS_NOT_LISTED";
          break;
        case 0x1E:
          v13 = @"TRAFFIC_INCIDENT_INCORRECT";
          break;
        case 0x1F:
          v13 = @"TRAFFIC_INCIDENT_MISSING";
          break;
        case 0x20:
          v13 = @"TRAFFIC_FLOW_INCORRECT";
          break;
        case 0x21:
          v13 = @"TRAFFIC_FLOW_MISSING";
          break;
        case 0x22:
          v13 = @"TRAFFIC_NOT_LISTED";
          break;
        case 0x23:
          v13 = @"NOT_LISTED";
          break;
        case 0x24:
          v13 = @"DIRECTIONS_INCORRECT_INSTRUCTIONS";
          break;
        case 0x25:
          v13 = @"DIRECTIONS_ROUTE_WRONG";
          break;
        case 0x26:
          v13 = @"DIRECTIONS_PROBLEM_WITH_TRANSFER";
          break;
        case 0x27:
          v13 = @"DIRECTIONS_INCORRECT_ETA";
          break;
        case 0x28:
          v13 = @"TRANSIT_DELAY";
          break;
        case 0x29:
          v13 = @"TRANSIT_INCORRECT_SCHEDULE";
          break;
        case 0x2B:
          v13 = @"INCORRECT_ENTRY_OR_EXIT";
          break;
        case 0x2D:
          v13 = @"INCORRECT_SHAPE";
          break;
        case 0x2E:
          v13 = @"OTHER_FEEDBACK";
          break;
        case 0x2F:
          v13 = @"CLOSED_TEMPORARILY";
          break;
        case 0x30:
          v13 = @"CLOSED_HOURS_CHANGED";
          break;
        case 0x31:
          v13 = @"TRANSIT_CANCELATION";
          break;
        case 0x32:
          v13 = @"TRANSIT_SERVICE_CHANGED";
          break;
        case 0x36:
          v13 = @"SEARCH_AUTOCOMPLETE_POI";
          break;
        case 0x37:
          v13 = @"SEARCH_AUTOCOMPLETE_POI_CATEGORY";
          break;
        case 0x38:
          v13 = @"SEARCH_AUTOCOMPLETE_ADDRESS";
          break;
        case 0x39:
          v13 = @"SEARCH_AUTOCOMPLETE_LOCALITY";
          break;
        case 0x3A:
          v13 = @"SEARCH_AUTOCOMPLETE_OTHER";
          break;
        case 0x3B:
          v13 = @"TRANSIT_LINE_INCORRECT_NAME";
          break;
        case 0x3C:
          v13 = @"DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
          break;
        case 0x3D:
          v13 = @"PERSONALIZED_MAP_LOCATION_INCORRECT";
          break;
        case 0x3E:
          v13 = @"MISSING_LOCATION_BUSINESS";
          break;
        case 0x3F:
          v13 = @"MISSING_LOCATION_STREET";
          break;
        case 0x40:
          v13 = @"MISSING_LOCATION_OTHER";
          break;
        case 0x41:
          v13 = @"MERCHANT_LOOKUP";
          break;
        case 0x42:
          v13 = @"GROUND_VIEW_CENSOR_REQUEST";
          break;
        case 0x43:
          v13 = @"GROUND_VIEW_IMAGE_QUALITY";
          break;
        case 0x44:
          v13 = @"GROUND_VIEW_STOREFRONT";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v14 = @"problemType";
      }
      else {
        v14 = @"problem_type";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 problemCorrections];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"problemCorrections";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"problem_corrections";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 problemContext];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"problemContext";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"problem_context";
      }
      [v4 setObject:v21 forKey:v22];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblem)initWithDictionary:(id)a3
{
  return (GEORPProblem *)-[GEORPProblem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_289;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"protocolVersion";
    }
    else {
      objc_super v7 = @"protocol_version";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setProtocolVersion:", objc_msgSend(v8, "unsignedIntValue"));
    }

    if (a3) {
      unint64_t v9 = @"userPath";
    }
    else {
      unint64_t v9 = @"user_path";
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = a3;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v34 = v10;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v12) {
        goto LABEL_135;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            if ([v17 isEqualToString:@"USER_PATH_ITEM_UNKNOWN"])
            {
              uint64_t v18 = 0;
            }
            else if ([v17 isEqualToString:@"PLACE_PROBLEM"])
            {
              uint64_t v18 = 1;
            }
            else if ([v17 isEqualToString:@"MAP_PROBLEM"])
            {
              uint64_t v18 = 2;
            }
            else if ([v17 isEqualToString:@"ADDRESS_EDIT"])
            {
              uint64_t v18 = 3;
            }
            else if ([v17 isEqualToString:@"ADDRESS_EDIT_LABEL"])
            {
              uint64_t v18 = 4;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CORRECT_COORDINATE"])
            {
              uint64_t v18 = 5;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CHOOSE_FEATURE"])
            {
              uint64_t v18 = 6;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE"])
            {
              uint64_t v18 = 7;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CHOOSE_REGION"])
            {
              uint64_t v18 = 8;
            }
            else if ([v17 isEqualToString:@"LOCATION_CLOSED"])
            {
              uint64_t v18 = 9;
            }
            else if ([v17 isEqualToString:@"COMMENTS_AND_PHOTO"])
            {
              uint64_t v18 = 10;
            }
            else if ([v17 isEqualToString:@"SEARCH_RESULTS"])
            {
              uint64_t v18 = 11;
            }
            else if ([v17 isEqualToString:@"SATELLITE_IMAGE"])
            {
              uint64_t v18 = 12;
            }
            else if ([v17 isEqualToString:@"TRAFFIC"])
            {
              uint64_t v18 = 13;
            }
            else if ([v17 isEqualToString:@"DIRECTIONS"])
            {
              uint64_t v18 = 14;
            }
            else if ([v17 isEqualToString:@"DIRECTIONS_STEPS"])
            {
              uint64_t v18 = 15;
            }
            else if ([v17 isEqualToString:@"GUIDANCE"])
            {
              uint64_t v18 = 16;
            }
            else if ([v17 isEqualToString:@"ROUTE_PLANNING"])
            {
              uint64_t v18 = 17;
            }
            else if ([v17 isEqualToString:@"DIRECTIONS_ROUTE_PICKER"])
            {
              uint64_t v18 = 18;
            }
            else if ([v17 isEqualToString:@"TRANSIT_MAP_PROBLEM"])
            {
              uint64_t v18 = 19;
            }
            else if ([v17 isEqualToString:@"TRANSIT_DIRECTIONS_PROBLEM"])
            {
              uint64_t v18 = 20;
            }
            else if ([v17 isEqualToString:@"TRANSIT_STATION_PROBLEM"])
            {
              uint64_t v18 = 21;
            }
            else if ([v17 isEqualToString:@"TRANSIT_TRANSFER_PICKER"])
            {
              uint64_t v18 = 22;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_PICKER"])
            {
              uint64_t v18 = 23;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_DISPLAY_PROBLEM"])
            {
              uint64_t v18 = 24;
            }
            else if ([v17 isEqualToString:@"TRANSIT_STATION_PICKER"])
            {
              uint64_t v18 = 25;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_SERVICE_CHANGE"])
            {
              uint64_t v18 = 26;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_SCHEDULES"])
            {
              uint64_t v18 = 27;
            }
            else if ([v17 isEqualToString:@"TRANSIT_BAD_ROUTE_SUGGESTIONS"])
            {
              uint64_t v18 = 28;
            }
            else if ([v17 isEqualToString:@"TRANSIT_ACCESS_POINT"])
            {
              uint64_t v18 = 29;
            }
            else if ([v17 isEqualToString:@"TRANSIT_SUBCATEGORY_PICKER"])
            {
              uint64_t v18 = 30;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION"])
            {
              uint64_t v18 = 31;
            }
            else if ([v17 isEqualToString:@"LOCATION_ADD"])
            {
              uint64_t v18 = 32;
            }
            else if ([v17 isEqualToString:@"IM_LOST"])
            {
              uint64_t v18 = 33;
            }
            else if ([v17 isEqualToString:@"SEARCH_AUTOCOMPLETE"])
            {
              uint64_t v18 = 40;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_NAME_INCORRECT"])
            {
              uint64_t v18 = 41;
            }
            else if ([v17 isEqualToString:@"TRANSIT_LINE_SHAPE_INCORRECT"])
            {
              uint64_t v18 = 42;
            }
            else if ([v17 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS"])
            {
              uint64_t v18 = 43;
            }
            else if ([v17 isEqualToString:@"BAD_DIRECTIONS_ROUTE_WRONG"])
            {
              uint64_t v18 = 44;
            }
            else if ([v17 isEqualToString:@"BAD_DIRECTIONS_INCORRECT_ETA"])
            {
              uint64_t v18 = 45;
            }
            else if ([v17 isEqualToString:@"BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
            {
              uint64_t v18 = 46;
            }
            else if ([v17 isEqualToString:@"TRANSIT_ACCESS_POINT_PICKER"])
            {
              uint64_t v18 = 47;
            }
            else if ([v17 isEqualToString:@"PERSONALIZED_MAP_CORRECTION"])
            {
              uint64_t v18 = 48;
            }
            else if ([v17 isEqualToString:@"WHICH_PERSONALIZED_MAP_ADDRESS"])
            {
              uint64_t v18 = 49;
            }
            else if ([v17 isEqualToString:@"PERSONALIZED_MAP_PLACE_PROBLEM"])
            {
              uint64_t v18 = 50;
            }
            else if ([v17 isEqualToString:@"ADD_A_PLACE_TYPE_SELECTION"])
            {
              uint64_t v18 = 51;
            }
            else if ([v17 isEqualToString:@"LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME"])
            {
              uint64_t v18 = 52;
            }
            else if ([v17 isEqualToString:@"PLACE_CATEGORY_SELECTION"])
            {
              uint64_t v18 = 53;
            }
            else if ([v17 isEqualToString:@"TAKE_PHOTO"])
            {
              uint64_t v18 = 54;
            }
            else if ([v17 isEqualToString:@"ROUTING_TRAY"])
            {
              uint64_t v18 = 55;
            }
            else if ([v17 isEqualToString:@"BRAND_PROBLEM"])
            {
              uint64_t v18 = 56;
            }
            else if ([v17 isEqualToString:@"BRAND_CORRECTIONS"])
            {
              uint64_t v18 = 57;
            }
            else if ([v17 isEqualToString:@"ADDRESS_INFO"])
            {
              uint64_t v18 = 58;
            }
            else if ([v17 isEqualToString:@"ADDRESS_SEARCH"])
            {
              uint64_t v18 = 59;
            }
            else if ([v17 isEqualToString:@"CURATED_COLLECTION_PROBLEM"])
            {
              uint64_t v18 = 60;
            }
            else
            {
              uint64_t v18 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            uint64_t v18 = [v16 intValue];
          }
          [v6 addUserPath:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v13)
        {
LABEL_135:

          a3 = v35;
          uint64_t v10 = v34;
          break;
        }
      }
    }

    if (a3) {
      v19 = @"problemType";
    }
    else {
      v19 = @"problem_type";
    }
    v20 = [v5 objectForKeyedSubscript:v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v20;
      if ([v21 isEqualToString:@"PROBLEM_TYPE_UNKNOWN"])
      {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else if ([v21 isEqualToString:@"INCORRECT_INFO"])
      {
        uint64_t v22 = 0;
      }
      else if ([v21 isEqualToString:@"INCORRECT_MAP_LABEL"])
      {
        uint64_t v22 = 1;
      }
      else if ([v21 isEqualToString:@"MISSING_LOCATION"])
      {
        uint64_t v22 = 2;
      }
      else if ([v21 isEqualToString:@"INCORRECT_PIN_LOCATION"])
      {
        uint64_t v22 = 3;
      }
      else if ([v21 isEqualToString:@"SEARCH_UNEXPECTED"])
      {
        uint64_t v22 = 8;
      }
      else if ([v21 isEqualToString:@"SEARCH_SELECTED_WRONG_PIN"])
      {
        uint64_t v22 = 9;
      }
      else if ([v21 isEqualToString:@"SEARCH_SHOULD_NOT_HAVE_MOVED_MAP"])
      {
        uint64_t v22 = 10;
      }
      else if ([v21 isEqualToString:@"SEARCH_SHOULD_HAVE_MOVED_MAP"])
      {
        uint64_t v22 = 11;
      }
      else if ([v21 isEqualToString:@"SEARCH_NOT_LISTED"])
      {
        uint64_t v22 = 12;
      }
      else if ([v21 isEqualToString:@"SATELLITE_OUTDATED"])
      {
        uint64_t v22 = 13;
      }
      else if ([v21 isEqualToString:@"SATELLITE_QUALITY"])
      {
        uint64_t v22 = 14;
      }
      else if ([v21 isEqualToString:@"SATELLITE_NOT_LISTED"])
      {
        uint64_t v22 = 15;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_PROBLEM_BASIC"])
      {
        uint64_t v22 = 16;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_DESTINATION_WRONG"])
      {
        uint64_t v22 = 17;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_THROUGH_TRAFFIC"])
      {
        uint64_t v22 = 20;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_THROUGH_CLOSURE"])
      {
        uint64_t v22 = 21;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_WRONG_WAY"])
      {
        uint64_t v22 = 22;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_PROHIBITED"])
      {
        uint64_t v22 = 23;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_CLOSED_ROAD"])
      {
        uint64_t v22 = 24;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_UNNEEDED"])
      {
        uint64_t v22 = 25;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_MISSING_BEFORE"])
      {
        uint64_t v22 = 26;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_MISSING_AFTER"])
      {
        uint64_t v22 = 27;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_STEP_NOT_LISTED"])
      {
        uint64_t v22 = 28;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_NOT_LISTED"])
      {
        uint64_t v22 = 29;
      }
      else if ([v21 isEqualToString:@"TRAFFIC_INCIDENT_INCORRECT"])
      {
        uint64_t v22 = 30;
      }
      else if ([v21 isEqualToString:@"TRAFFIC_INCIDENT_MISSING"])
      {
        uint64_t v22 = 31;
      }
      else if ([v21 isEqualToString:@"TRAFFIC_FLOW_INCORRECT"])
      {
        uint64_t v22 = 32;
      }
      else if ([v21 isEqualToString:@"TRAFFIC_FLOW_MISSING"])
      {
        uint64_t v22 = 33;
      }
      else if ([v21 isEqualToString:@"TRAFFIC_NOT_LISTED"])
      {
        uint64_t v22 = 34;
      }
      else if ([v21 isEqualToString:@"NOT_LISTED"])
      {
        uint64_t v22 = 35;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_INCORRECT_INSTRUCTIONS"])
      {
        uint64_t v22 = 36;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_ROUTE_WRONG"])
      {
        uint64_t v22 = 37;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_PROBLEM_WITH_TRANSFER"])
      {
        uint64_t v22 = 38;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_INCORRECT_ETA"])
      {
        uint64_t v22 = 39;
      }
      else if ([v21 isEqualToString:@"TRANSIT_INCORRECT_SCHEDULE"])
      {
        uint64_t v22 = 41;
      }
      else if ([v21 isEqualToString:@"INCORRECT_ENTRY_OR_EXIT"])
      {
        uint64_t v22 = 43;
      }
      else if ([v21 isEqualToString:@"INCORRECT_SHAPE"])
      {
        uint64_t v22 = 45;
      }
      else if ([v21 isEqualToString:@"OTHER_FEEDBACK"])
      {
        uint64_t v22 = 46;
      }
      else if ([v21 isEqualToString:@"CLOSED_PERMANENTLY"])
      {
        uint64_t v22 = 4;
      }
      else if ([v21 isEqualToString:@"CLOSED_TEMPORARILY"])
      {
        uint64_t v22 = 47;
      }
      else if ([v21 isEqualToString:@"CLOSED_HOURS_CHANGED"])
      {
        uint64_t v22 = 48;
      }
      else if ([v21 isEqualToString:@"TRANSIT_DELAY"])
      {
        uint64_t v22 = 40;
      }
      else if ([v21 isEqualToString:@"TRANSIT_CANCELATION"])
      {
        uint64_t v22 = 49;
      }
      else if ([v21 isEqualToString:@"TRANSIT_SERVICE_CHANGED"])
      {
        uint64_t v22 = 50;
      }
      else if ([v21 isEqualToString:@"SEARCH_AUTOCOMPLETE_POI"])
      {
        uint64_t v22 = 54;
      }
      else if ([v21 isEqualToString:@"SEARCH_AUTOCOMPLETE_POI_CATEGORY"])
      {
        uint64_t v22 = 55;
      }
      else if ([v21 isEqualToString:@"SEARCH_AUTOCOMPLETE_ADDRESS"])
      {
        uint64_t v22 = 56;
      }
      else if ([v21 isEqualToString:@"SEARCH_AUTOCOMPLETE_LOCALITY"])
      {
        uint64_t v22 = 57;
      }
      else if ([v21 isEqualToString:@"SEARCH_AUTOCOMPLETE_OTHER"])
      {
        uint64_t v22 = 58;
      }
      else if ([v21 isEqualToString:@"TRANSIT_LINE_INCORRECT_NAME"])
      {
        uint64_t v22 = 59;
      }
      else if ([v21 isEqualToString:@"DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT"])
      {
        uint64_t v22 = 60;
      }
      else if ([v21 isEqualToString:@"PERSONALIZED_MAP_LOCATION_INCORRECT"])
      {
        uint64_t v22 = 61;
      }
      else if ([v21 isEqualToString:@"DOES_NOT_EXIST_INCORRECT_PIN_LOCATION"])
      {
        uint64_t v22 = 5;
      }
      else if ([v21 isEqualToString:@"DOES_NOT_EXIST_NO_SUCH_PLACE"])
      {
        uint64_t v22 = 6;
      }
      else if ([v21 isEqualToString:@"DOES_NOT_EXIST_OTHER"])
      {
        uint64_t v22 = 7;
      }
      else if ([v21 isEqualToString:@"MISSING_LOCATION_BUSINESS"])
      {
        uint64_t v22 = 62;
      }
      else if ([v21 isEqualToString:@"MISSING_LOCATION_STREET"])
      {
        uint64_t v22 = 63;
      }
      else if ([v21 isEqualToString:@"MISSING_LOCATION_OTHER"])
      {
        uint64_t v22 = 64;
      }
      else if ([v21 isEqualToString:@"MERCHANT_LOOKUP"])
      {
        uint64_t v22 = 65;
      }
      else if ([v21 isEqualToString:@"GROUND_VIEW_CENSOR_REQUEST"])
      {
        uint64_t v22 = 66;
      }
      else if ([v21 isEqualToString:@"GROUND_VIEW_IMAGE_QUALITY"])
      {
        uint64_t v22 = 67;
      }
      else if ([v21 isEqualToString:@"GROUND_VIEW_STOREFRONT"])
      {
        uint64_t v22 = 68;
      }
      else
      {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_272:

        if (a3) {
          v23 = @"problemCorrections";
        }
        else {
          v23 = @"problem_corrections";
        }
        v24 = [v5 objectForKeyedSubscript:v23];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = [GEORPProblemCorrections alloc];
          if (a3) {
            uint64_t v26 = [(GEORPProblemCorrections *)v25 initWithJSON:v24];
          }
          else {
            uint64_t v26 = [(GEORPProblemCorrections *)v25 initWithDictionary:v24];
          }
          v27 = (void *)v26;
          [v6 setProblemCorrections:v26];
        }
        if (a3) {
          v28 = @"problemContext";
        }
        else {
          v28 = @"problem_context";
        }
        v29 = [v5 objectForKeyedSubscript:v28];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v30 = [GEORPProblemContext alloc];
          if (a3) {
            uint64_t v31 = [(GEORPProblemContext *)v30 initWithJSON:v29];
          }
          else {
            uint64_t v31 = [(GEORPProblemContext *)v30 initWithDictionary:v29];
          }
          v32 = (void *)v31;
          [v6 setProblemContext:v31];
        }
        goto LABEL_289;
      }
      uint64_t v22 = [v20 intValue];
    }
    [v6 setProblemType:v22];
    goto LABEL_272;
  }
LABEL_289:

  return v6;
}

- (GEORPProblem)initWithJSON:(id)a3
{
  return (GEORPProblem *)-[GEORPProblem _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2021;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2022;
    }
    GEORPProblemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPProblemCorrections *)self->_problemCorrections readAll:1];
    [(GEORPProblemContext *)self->_problemContext readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_15;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblem *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  id v5 = v9;
  if (self->_userPaths.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      ++v6;
    }
    while (v6 < self->_userPaths.count);
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v9;
  }
  if (self->_problemCorrections)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if (self->_problemContext)
  {
    PBDataWriterWriteSubmessage();
LABEL_15:
    id v5 = v9;
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPProblem _readProblemContext]((uint64_t)self);
  if ([(GEORPProblemContext *)self->_problemContext hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPProblem _readProblemCorrections]((uint64_t)self);
  problemCorrections = self->_problemCorrections;

  return [(GEORPProblemCorrections *)problemCorrections hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v8 = (id *)a3;
  [(GEORPProblem *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 18) = self->_protocolVersion;
    *((unsigned char *)v8 + 76) |= 2u;
  }
  if ([(GEORPProblem *)self userPathsCount])
  {
    [v8 clearUserPaths];
    unint64_t v4 = [(GEORPProblem *)self userPathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addUserPath:", -[GEORPProblem userPathAtIndex:](self, "userPathAtIndex:", i));
    }
  }
  objc_super v7 = v8;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 17) = self->_problemType;
    *((unsigned char *)v8 + 76) |= 1u;
  }
  if (self->_problemCorrections)
  {
    objc_msgSend(v8, "setProblemCorrections:");
    objc_super v7 = v8;
  }
  if (self->_problemContext)
  {
    objc_msgSend(v8, "setProblemContext:");
    objc_super v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblem *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_protocolVersion;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_problemType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v9 = [(GEORPProblemCorrections *)self->_problemCorrections copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEORPProblemContext *)self->_problemContext copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEORPProblem *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 18)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_problemType != *((_DWORD *)v4 + 17)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_17;
  }
  problemCorrections = self->_problemCorrections;
  if ((unint64_t)problemCorrections | *((void *)v4 + 6)
    && !-[GEORPProblemCorrections isEqual:](problemCorrections, "isEqual:"))
  {
    goto LABEL_17;
  }
  problemContext = self->_problemContext;
  if ((unint64_t)problemContext | *((void *)v4 + 5)) {
    char v7 = -[GEORPProblemContext isEqual:](problemContext, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPProblem *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_protocolVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_problemType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEORPProblemCorrections *)self->_problemCorrections hash];
  return v6 ^ [(GEORPProblemContext *)self->_problemContext hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  if ((*((unsigned char *)v12 + 76) & 2) != 0)
  {
    self->_protocolVersion = *((_DWORD *)v12 + 18);
    *(unsigned char *)&self->_flags |= 2u;
  }
  uint64_t v4 = [v12 userPathsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPProblem addUserPath:](self, "addUserPath:", [v12 userPathAtIndex:i]);
  }
  char v7 = v12;
  if (*((unsigned char *)v12 + 76))
  {
    self->_problemType = *((_DWORD *)v12 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  problemCorrections = self->_problemCorrections;
  uint64_t v9 = *((void *)v12 + 6);
  if (problemCorrections)
  {
    if (!v9) {
      goto LABEL_14;
    }
    -[GEORPProblemCorrections mergeFrom:](problemCorrections, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_14;
    }
    -[GEORPProblem setProblemCorrections:](self, "setProblemCorrections:");
  }
  char v7 = v12;
LABEL_14:
  problemContext = self->_problemContext;
  uint64_t v11 = v7[5];
  if (problemContext)
  {
    if (!v11) {
      goto LABEL_20;
    }
    -[GEORPProblemContext mergeFrom:](problemContext, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_20;
    }
    -[GEORPProblem setProblemContext:](self, "setProblemContext:");
  }
  char v7 = v12;
LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemCorrections, 0);
  objc_storeStrong((id *)&self->_problemContext, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end