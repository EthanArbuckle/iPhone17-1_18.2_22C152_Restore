@interface GEORPFeedbackFieldOption
+ (BOOL)isValid:(id)a3;
+ (Class)tagType;
- (BOOL)hasAnnotations;
- (BOOL)hasDefaultText;
- (BOOL)hasKey;
- (BOOL)hasLocalizedText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFieldOption)init;
- (GEORPFeedbackFieldOption)initWithData:(id)a3;
- (GEORPFeedbackFieldOption)initWithDictionary:(id)a3;
- (GEORPFeedbackFieldOption)initWithJSON:(id)a3;
- (GEORPFeedbackFieldOptionAnnotations)annotations;
- (NSMutableArray)tags;
- (NSString)defaultText;
- (NSString)localizedText;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)keyAsString:(int)a3;
- (id)tagAtIndex:(unint64_t)a3;
- (int)StringAsKey:(id)a3;
- (int)key;
- (unint64_t)hash;
- (unint64_t)tagsCount;
- (void)_addNoFlagsTag:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnnotations;
- (void)_readDefaultText;
- (void)_readLocalizedText;
- (void)_readTags;
- (void)addTag:(id)a3;
- (void)clearTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnnotations:(id)a3;
- (void)setDefaultText:(id)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setKey:(int)a3;
- (void)setLocalizedText:(id)a3;
- (void)setTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFieldOption

- (GEORPFeedbackFieldOption)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFieldOption;
  v2 = [(GEORPFeedbackFieldOption *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFieldOption)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFieldOption;
  v3 = [(GEORPFeedbackFieldOption *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)key
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_key;
  }
  else {
    return 0;
  }
}

- (void)setKey:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasKey
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)keyAsString:(int)a3
{
  if (a3 <= 1300)
  {
    if (a3 > 1100)
    {
      switch(a3)
      {
        case 1101:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME";
          break;
        case 1102:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION";
          break;
        case 1103:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE";
          break;
        case 1104:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT";
          break;
        case 1105:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME";
          break;
        case 1106:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE";
          break;
        case 1107:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE";
          break;
        case 1108:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY";
          break;
        case 1109:
          goto LABEL_341;
        case 1110:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY";
          break;
        case 1111:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY";
          break;
        case 1112:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG";
          break;
        case 1113:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE";
          break;
        default:
          switch(a3)
          {
            case 1201:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG";
              break;
            case 1202:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_MISSING";
              break;
            case 1206:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY";
              break;
            case 1207:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY";
              break;
            case 1208:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE";
              break;
            case 1209:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_PRIVATE";
              break;
            case 1210:
              v4 = @"FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG";
              break;
            case 1211:
              v4 = @"FEEDBACK_FIELD_OPTION_FEATURE_WRONG";
              break;
            default:
              goto LABEL_341;
          }
          break;
      }
    }
    else
    {
      v4 = @"FEEDBACK_FIELD_OPTION_UNKNOWN";
      switch(a3)
      {
        case 0:
          goto LABEL_342;
        case 1:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_NAME";
          break;
        case 2:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS";
          break;
        case 3:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_LOCATION";
          break;
        case 4:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE";
          break;
        case 5:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_HOURS";
          break;
        case 6:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_PHONE";
          break;
        case 7:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY";
          break;
        case 8:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT";
          break;
        case 9:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_MULTIPLE";
          break;
        case 10:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE";
          break;
        case 11:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_CATEGORY";
          break;
        case 12:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE";
          break;
        case 13:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED";
          break;
        case 14:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE";
          break;
        case 15:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_REOPENING";
          break;
        case 16:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG";
          break;
        case 17:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG";
          break;
        case 18:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG";
          break;
        case 19:
          v4 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG";
          break;
        default:
          if (a3 <= 0x44C)
          {
            switch(a3)
            {
              case 501:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_NAME";
                break;
              case 502:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_PIN";
                break;
              case 503:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE";
                break;
              case 504:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY";
                break;
              case 505:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE";
                break;
              case 506:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL";
                break;
              case 507:
                v4 = @"FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          else
          {
            switch(a3)
            {
              case 1001:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION";
                break;
              case 1002:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_WRONG";
                break;
              case 1003:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE";
                break;
              case 1004:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT";
                break;
              case 1005:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING";
                break;
              case 1006:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING";
                break;
              case 1007:
                v4 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH";
                break;
              default:
                goto LABEL_341;
            }
          }
          break;
      }
    }
  }
  else
  {
    if (a3 <= 2100)
    {
      if (a3 <= 2000)
      {
        switch(a3)
        {
          case 1701:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET";
            break;
          case 1702:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_ADDRESS";
            break;
          case 1703:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN";
            break;
          case 1704:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN";
            break;
          case 1705:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT";
            break;
          case 1706:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA";
            break;
          case 1707:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER";
            break;
          case 1708:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_PLACE";
            break;
          case 1709:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD";
            break;
          case 1710:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP";
            break;
          case 1711:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH";
            break;
          case 1712:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE";
            break;
          case 1713:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE";
            break;
          case 1714:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT";
            break;
          case 1715:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES";
            break;
          case 1716:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE";
            break;
          case 1717:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_LANE";
            break;
          case 1718:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK";
            break;
          case 1719:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN";
            break;
          case 1720:
            v4 = @"FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL";
            break;
          default:
            switch(a3)
            {
              case 1301:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG";
                break;
              case 1302:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED";
                break;
              case 1303:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE";
                break;
              case 1304:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY";
                break;
              case 1305:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT";
                break;
              case 1306:
                v4 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE";
                break;
              default:
                goto LABEL_341;
            }
            break;
        }
        return v4;
      }
      if (a3 > 2050)
      {
        switch(a3)
        {
          case 2051:
            v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE";
            break;
          case 2052:
            v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE";
            break;
          case 2053:
            v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED";
            break;
          case 2054:
            v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE";
            break;
          default:
            goto LABEL_341;
        }
        return v4;
      }
      switch(a3)
      {
        case 2001:
          v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED";
          return v4;
        case 2002:
          v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG";
          return v4;
        case 2003:
          v4 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE";
          return v4;
      }
    }
    else
    {
      if (a3 > 2500)
      {
        if (a3 <= 2600)
        {
          switch(a3)
          {
            case 2501:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT";
              break;
            case 2502:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE";
              break;
            case 2503:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY";
              break;
            case 2504:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON";
              break;
            case 2505:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN";
              break;
            case 2506:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE";
              break;
            case 2507:
              v4 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE";
              break;
            default:
              goto LABEL_341;
          }
        }
        else
        {
          switch(a3)
          {
            case 5000:
              v4 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR";
              break;
            case 5001:
              v4 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR";
              break;
            case 5002:
              v4 = @"FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG";
              break;
            case 5003:
              v4 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING";
              break;
            case 5004:
              v4 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING";
              break;
            default:
              if (a3 != 10000) {
                goto LABEL_341;
              }
              v4 = @"FEEDBACK_FIELD_OPTION_CHOICE";
              break;
          }
        }
        return v4;
      }
      if (a3 <= 2300)
      {
        switch(a3)
        {
          case 2201:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED";
            break;
          case 2202:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE";
            break;
          case 2203:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING";
            break;
          case 2204:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD";
            break;
          case 2205:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE";
            break;
          case 2206:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT";
            break;
          case 2207:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD";
            break;
          case 2208:
            v4 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE";
            break;
          default:
            switch(a3)
            {
              case 2101:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG";
                break;
              case 2102:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE";
                break;
              case 2103:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING";
                break;
              case 2104:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING";
                break;
              case 2105:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH";
                break;
              case 2106:
                v4 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG";
                break;
              default:
                goto LABEL_341;
            }
            break;
        }
        return v4;
      }
      switch(a3)
      {
        case 2301:
          v4 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED";
          return v4;
        case 2302:
          v4 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE";
          return v4;
        case 2401:
          v4 = @"FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE";
          return v4;
      }
    }
LABEL_341:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_342:
  }
  return v4;
}

- (int)StringAsKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_ADDRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_WEBSITE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_HOURS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_MULTIPLE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CATEGORY"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_REOPENING"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_NAME"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_PIN"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE"])
  {
    int v4 = 505;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL"])
  {
    int v4 = 506;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE"])
  {
    int v4 = 507;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION"])
  {
    int v4 = 1001;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_WRONG"])
  {
    int v4 = 1002;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE"])
  {
    int v4 = 1003;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT"])
  {
    int v4 = 1004;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING"])
  {
    int v4 = 1006;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH"])
  {
    int v4 = 1007;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME"])
  {
    int v4 = 1101;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION"])
  {
    int v4 = 1102;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE"])
  {
    int v4 = 1103;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT"])
  {
    int v4 = 1104;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME"])
  {
    int v4 = 1105;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE"])
  {
    int v4 = 1106;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE"])
  {
    int v4 = 1107;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY"])
  {
    int v4 = 1108;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY"])
  {
    int v4 = 1110;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY"])
  {
    int v4 = 1111;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG"])
  {
    int v4 = 1112;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE"])
  {
    int v4 = 1113;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG"])
  {
    int v4 = 1201;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_MISSING"])
  {
    int v4 = 1202;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY"])
  {
    int v4 = 1206;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY"])
  {
    int v4 = 1207;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE"])
  {
    int v4 = 1208;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_PRIVATE"])
  {
    int v4 = 1209;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG"])
  {
    int v4 = 1210;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_WRONG"])
  {
    int v4 = 1211;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY"])
  {
    int v4 = 1251;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY"])
  {
    int v4 = 1252;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED"])
  {
    int v4 = 1253;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION"])
  {
    int v4 = 1254;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED"])
  {
    int v4 = 1255;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION"])
  {
    int v4 = 1256;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET"])
  {
    int v4 = 1257;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE"])
  {
    int v4 = 1258;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE"])
  {
    int v4 = 1259;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK"])
  {
    int v4 = 1260;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN"])
  {
    int v4 = 1261;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH"])
  {
    int v4 = 1262;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL"])
  {
    int v4 = 1263;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG"])
  {
    int v4 = 1301;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED"])
  {
    int v4 = 1302;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE"])
  {
    int v4 = 1303;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY"])
  {
    int v4 = 1304;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT"])
  {
    int v4 = 1305;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE"])
  {
    int v4 = 1306;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET"])
  {
    int v4 = 1701;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_ADDRESS"])
  {
    int v4 = 1702;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN"])
  {
    int v4 = 1703;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN"])
  {
    int v4 = 1704;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT"])
  {
    int v4 = 1705;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA"])
  {
    int v4 = 1706;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER"])
  {
    int v4 = 1707;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_PLACE"])
  {
    int v4 = 1708;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD"])
  {
    int v4 = 1709;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP"])
  {
    int v4 = 1710;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH"])
  {
    int v4 = 1711;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE"])
  {
    int v4 = 1712;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE"])
  {
    int v4 = 1713;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT"])
  {
    int v4 = 1714;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES"])
  {
    int v4 = 1715;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE"])
  {
    int v4 = 1716;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_LANE"])
  {
    int v4 = 1717;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK"])
  {
    int v4 = 1718;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN"])
  {
    int v4 = 1719;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL"])
  {
    int v4 = 1720;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED"])
  {
    int v4 = 2001;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG"])
  {
    int v4 = 2002;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE"])
  {
    int v4 = 2003;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE"])
  {
    int v4 = 2051;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE"])
  {
    int v4 = 2052;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED"])
  {
    int v4 = 2053;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE"])
  {
    int v4 = 2054;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG"])
  {
    int v4 = 2101;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE"])
  {
    int v4 = 2102;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING"])
  {
    int v4 = 2103;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING"])
  {
    int v4 = 2104;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH"])
  {
    int v4 = 2105;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG"])
  {
    int v4 = 2106;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED"])
  {
    int v4 = 2201;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE"])
  {
    int v4 = 2202;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING"])
  {
    int v4 = 2203;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD"])
  {
    int v4 = 2204;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE"])
  {
    int v4 = 2205;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT"])
  {
    int v4 = 2206;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD"])
  {
    int v4 = 2207;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE"])
  {
    int v4 = 2208;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED"])
  {
    int v4 = 2301;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE"])
  {
    int v4 = 2302;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE"])
  {
    int v4 = 2401;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT"])
  {
    int v4 = 2501;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE"])
  {
    int v4 = 2502;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY"])
  {
    int v4 = 2503;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON"])
  {
    int v4 = 2504;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN"])
  {
    int v4 = 2505;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE"])
  {
    int v4 = 2506;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE"])
  {
    int v4 = 2507;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING"])
  {
    int v4 = 2601;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL"])
  {
    int v4 = 2602;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG"])
  {
    int v4 = 2603;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG"])
  {
    int v4 = 2604;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG"])
  {
    int v4 = 2605;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR"])
  {
    int v4 = 5000;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR"])
  {
    int v4 = 5001;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG"])
  {
    int v4 = 5002;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING"])
  {
    int v4 = 5003;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING"])
  {
    int v4 = 5004;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_OPTION_CHOICE"])
  {
    int v4 = 10000;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLocalizedText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocalizedText
{
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  -[GEORPFeedbackFieldOption _readLocalizedText]((uint64_t)self);
  localizedText = self->_localizedText;

  return localizedText;
}

- (void)setLocalizedText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (void)_readDefaultText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDefaultText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDefaultText
{
  return self->_defaultText != 0;
}

- (NSString)defaultText
{
  -[GEORPFeedbackFieldOption _readDefaultText]((uint64_t)self);
  defaultText = self->_defaultText;

  return defaultText;
}

- (void)setDefaultText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_defaultText, a3);
}

- (void)_readTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTags_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)tags
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  tags = self->_tags;

  return tags;
}

- (void)setTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tags = self->_tags;
  self->_tags = v4;
}

- (void)clearTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tags = self->_tags;

  [(NSMutableArray *)tags removeAllObjects];
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  -[GEORPFeedbackFieldOption _addNoFlagsTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)tagsCount
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  tags = self->_tags;

  return [(NSMutableArray *)tags count];
}

- (id)tagAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldOption _readTags]((uint64_t)self);
  tags = self->_tags;

  return (id)[(NSMutableArray *)tags objectAtIndex:a3];
}

+ (Class)tagType
{
  return (Class)objc_opt_class();
}

- (void)_readAnnotations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldOptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnotations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAnnotations
{
  return self->_annotations != 0;
}

- (GEORPFeedbackFieldOptionAnnotations)annotations
{
  -[GEORPFeedbackFieldOption _readAnnotations]((uint64_t)self);
  annotations = self->_annotations;

  return annotations;
}

- (void)setAnnotations:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFieldOption;
  id v4 = [(GEORPFeedbackFieldOption *)&v8 description];
  id v5 = [(GEORPFeedbackFieldOption *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldOption _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_167;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 64))
  {
    int v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 1300)
    {
      if (v5 > 1100)
      {
        switch(v5)
        {
          case 1101:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME";
            break;
          case 1102:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION";
            break;
          case 1103:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE";
            break;
          case 1104:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT";
            break;
          case 1105:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME";
            break;
          case 1106:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE";
            break;
          case 1107:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE";
            break;
          case 1108:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY";
            break;
          case 1109:
            goto LABEL_48;
          case 1110:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY";
            break;
          case 1111:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY";
            break;
          case 1112:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG";
            break;
          case 1113:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE";
            break;
          default:
            switch(v5)
            {
              case 1201:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG";
                break;
              case 1202:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_MISSING";
                break;
              case 1206:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY";
                break;
              case 1207:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY";
                break;
              case 1208:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE";
                break;
              case 1209:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_PRIVATE";
                break;
              case 1210:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG";
                break;
              case 1211:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_FEATURE_WRONG";
                break;
              default:
                goto LABEL_48;
            }
            break;
        }
      }
      else
      {
        objc_super v6 = @"FEEDBACK_FIELD_OPTION_UNKNOWN";
        switch(v5)
        {
          case 0:
            goto LABEL_148;
          case 1:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_NAME";
            break;
          case 2:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS";
            break;
          case 3:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_LOCATION";
            break;
          case 4:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE";
            break;
          case 5:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_HOURS";
            break;
          case 6:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_PHONE";
            break;
          case 7:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY";
            break;
          case 8:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT";
            break;
          case 9:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_MULTIPLE";
            break;
          case 10:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE";
            break;
          case 11:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_CATEGORY";
            break;
          case 12:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE";
            break;
          case 13:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED";
            break;
          case 14:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE";
            break;
          case 15:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_REOPENING";
            break;
          case 16:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG";
            break;
          case 17:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG";
            break;
          case 18:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG";
            break;
          case 19:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG";
            break;
          default:
            if (v5 <= 0x44C)
            {
              switch(v5)
              {
                case 501:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_NAME";
                  break;
                case 502:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_PIN";
                  break;
                case 503:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE";
                  break;
                case 504:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY";
                  break;
                case 505:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE";
                  break;
                case 506:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL";
                  break;
                case 507:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE";
                  break;
                default:
                  JUMPOUT(0);
              }
            }
            else
            {
              switch(v5)
              {
                case 1001:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION";
                  break;
                case 1002:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_WRONG";
                  break;
                case 1003:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE";
                  break;
                case 1004:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT";
                  break;
                case 1005:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING";
                  break;
                case 1006:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING";
                  break;
                case 1007:
                  objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH";
                  break;
                default:
                  goto LABEL_48;
              }
            }
            break;
        }
      }
      goto LABEL_148;
    }
    if (v5 <= 2100)
    {
      if (v5 <= 2000)
      {
        switch(v5)
        {
          case 1701:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET";
            break;
          case 1702:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_ADDRESS";
            break;
          case 1703:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN";
            break;
          case 1704:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN";
            break;
          case 1705:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT";
            break;
          case 1706:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA";
            break;
          case 1707:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER";
            break;
          case 1708:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_PLACE";
            break;
          case 1709:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD";
            break;
          case 1710:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP";
            break;
          case 1711:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH";
            break;
          case 1712:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE";
            break;
          case 1713:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE";
            break;
          case 1714:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT";
            break;
          case 1715:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES";
            break;
          case 1716:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE";
            break;
          case 1717:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_LANE";
            break;
          case 1718:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK";
            break;
          case 1719:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN";
            break;
          case 1720:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL";
            break;
          default:
            switch(v5)
            {
              case 1301:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG";
                break;
              case 1302:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED";
                break;
              case 1303:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE";
                break;
              case 1304:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY";
                break;
              case 1305:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT";
                break;
              case 1306:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE";
                break;
              default:
                goto LABEL_48;
            }
            break;
        }
        goto LABEL_148;
      }
      if (v5 > 2050)
      {
        switch(v5)
        {
          case 2051:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE";
            break;
          case 2052:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE";
            break;
          case 2053:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED";
            break;
          case 2054:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE";
            break;
          default:
            goto LABEL_48;
        }
        goto LABEL_148;
      }
      switch(v5)
      {
        case 2001:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED";
          goto LABEL_148;
        case 2002:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG";
          goto LABEL_148;
        case 2003:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE";
          goto LABEL_148;
      }
    }
    else
    {
      if (v5 > 2500)
      {
        if (v5 <= 2600)
        {
          switch(v5)
          {
            case 2501:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT";
              break;
            case 2502:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE";
              break;
            case 2503:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY";
              break;
            case 2504:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON";
              break;
            case 2505:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN";
              break;
            case 2506:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE";
              break;
            case 2507:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE";
              break;
            default:
              goto LABEL_48;
          }
        }
        else
        {
          switch(v5)
          {
            case 5000:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR";
              break;
            case 5001:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR";
              break;
            case 5002:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG";
              break;
            case 5003:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING";
              break;
            case 5004:
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING";
              break;
            default:
              if (v5 != 10000) {
                goto LABEL_48;
              }
              objc_super v6 = @"FEEDBACK_FIELD_OPTION_CHOICE";
              break;
          }
        }
        goto LABEL_148;
      }
      if (v5 <= 2300)
      {
        switch(v5)
        {
          case 2201:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED";
            break;
          case 2202:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE";
            break;
          case 2203:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING";
            break;
          case 2204:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD";
            break;
          case 2205:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE";
            break;
          case 2206:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT";
            break;
          case 2207:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD";
            break;
          case 2208:
            objc_super v6 = @"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE";
            break;
          default:
            switch(v5)
            {
              case 2101:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG";
                break;
              case 2102:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE";
                break;
              case 2103:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING";
                break;
              case 2104:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING";
                break;
              case 2105:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH";
                break;
              case 2106:
                objc_super v6 = @"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG";
                break;
              default:
                goto LABEL_48;
            }
            break;
        }
        goto LABEL_148;
      }
      switch(v5)
      {
        case 2301:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED";
          goto LABEL_148;
        case 2302:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE";
          goto LABEL_148;
        case 2401:
          objc_super v6 = @"FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE";
LABEL_148:
          [v4 setObject:v6 forKey:@"key"];

          goto LABEL_149;
      }
    }
LABEL_48:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_148;
  }
LABEL_149:
  id v7 = [(id)a1 localizedText];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"localizedText";
    }
    else {
      objc_super v8 = @"localized_text";
    }
    [v4 setObject:v7 forKey:v8];
  }

  v9 = [(id)a1 defaultText];
  if (v9)
  {
    if (a2) {
      v10 = @"defaultText";
    }
    else {
      v10 = @"default_text";
    }
    [v4 setObject:v9 forKey:v10];
  }

  if (*(void *)(a1 + 40))
  {
    v11 = [(id)a1 tags];
    [v4 setObject:v11 forKey:@"tag"];
  }
  v12 = [(id)a1 annotations];
  v13 = v12;
  if (v12)
  {
    if (a2) {
      [v12 jsonRepresentation];
    }
    else {
    v14 = [v12 dictionaryRepresentation];
    }
    [v4 setObject:v14 forKey:@"annotations"];
  }
LABEL_167:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldOption _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFieldOption)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldOption *)-[GEORPFeedbackFieldOption _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_306;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_306;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"key"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_NAME"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_ADDRESS"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_LOCATION"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_WEBSITE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_HOURS"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_TEMPORARY"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_PERMANENT"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_MULTIPLE"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_SOMETHING_ELSE"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CATEGORY"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE_OR_WEBSITE"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_CLOSED_UNSURE"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_REOPENING"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_ADDRESS_WRONG"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_WEBSITE_WRONG"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_HOURS_WRONG"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_POI_PHONE_WRONG"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_NAME"])
    {
      uint64_t v8 = 501;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_PIN"])
    {
      uint64_t v8 = 502;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_ZIPCODE"])
    {
      uint64_t v8 = 503;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY"])
    {
      uint64_t v8 = 504;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_LARGE"])
    {
      uint64_t v8 = 505;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_BOUNDARY_TOO_SMALL"])
    {
      uint64_t v8 = 506;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LOCALITY_SOMETHING_ELSE"])
    {
      uint64_t v8 = 507;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_LOCATION"])
    {
      uint64_t v8 = 1001;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_WRONG"])
    {
      uint64_t v8 = 1002;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_SOMETHING_ELSE"])
    {
      uint64_t v8 = 1003;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT"])
    {
      uint64_t v8 = 1004;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_DRIVING"])
    {
      uint64_t v8 = 1005;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_WALKING"])
    {
      uint64_t v8 = 1006;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADDRESS_ENTRY_POINT_BOTH"])
    {
      uint64_t v8 = 1007;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_NAME"])
    {
      uint64_t v8 = 1101;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_LOCATION"])
    {
      uint64_t v8 = 1102;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_ENTRANCE"])
    {
      uint64_t v8 = 1103;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_EXIT"])
    {
      uint64_t v8 = 1104;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_NAME"])
    {
      uint64_t v8 = 1105;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SHAPE"])
    {
      uint64_t v8 = 1106;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_SCHEDULE"])
    {
      uint64_t v8 = 1107;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_DELAY"])
    {
      uint64_t v8 = 1108;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_TEMPORARILY"])
    {
      uint64_t v8 = 1110;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_CLOSED_PERMANENTLY"])
    {
      uint64_t v8 = 1111;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_LINE_INFO_WRONG"])
    {
      uint64_t v8 = 1112;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_POI_SOMETHING_ELSE"])
    {
      uint64_t v8 = 1113;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NAME_WRONG"])
    {
      uint64_t v8 = 1201;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_MISSING"])
    {
      uint64_t v8 = 1202;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY"])
    {
      uint64_t v8 = 1206;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY"])
    {
      uint64_t v8 = 1207;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_SOMETHING_ELSE"])
    {
      uint64_t v8 = 1208;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_PRIVATE"])
    {
      uint64_t v8 = 1209;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_SHAPE_WRONG"])
    {
      uint64_t v8 = 1210;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_WRONG"])
    {
      uint64_t v8 = 1211;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_ONE_WAY"])
    {
      uint64_t v8 = 1251;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_WRONG_WAY_NOT_ONE_WAY"])
    {
      uint64_t v8 = 1252;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_BLOCKED"])
    {
      uint64_t v8 = 1253;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_CONSTRUCTION"])
    {
      uint64_t v8 = 1254;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_TURN_NOT_ALLOWED"])
    {
      uint64_t v8 = 1255;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STREET_NO_ENTRY_RESTRICTION"])
    {
      uint64_t v8 = 1256;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET"])
    {
      uint64_t v8 = 1257;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_STREET_SURFACE"])
    {
      uint64_t v8 = 1258;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_LANE"])
    {
      uint64_t v8 = 1259;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_CROSSWALK"])
    {
      uint64_t v8 = 1260;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_MEDIAN"])
    {
      uint64_t v8 = 1261;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_WALK_PATH"])
    {
      uint64_t v8 = 1262;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_FEATURE_SHAPE_WRONG_TUNNEL"])
    {
      uint64_t v8 = 1263;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_NAME_WRONG"])
    {
      uint64_t v8 = 1301;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED"])
    {
      uint64_t v8 = 1302;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_SOMETHING_ELSE"])
    {
      uint64_t v8 = 1303;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_TEMPORARY"])
    {
      uint64_t v8 = 1304;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_PERMANENT"])
    {
      uint64_t v8 = 1305;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAIL_CLOSED_UNSURE"])
    {
      uint64_t v8 = 1306;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET"])
    {
      uint64_t v8 = 1701;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_ADDRESS"])
    {
      uint64_t v8 = 1702;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN"])
    {
      uint64_t v8 = 1703;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STOP_SIGN"])
    {
      uint64_t v8 = 1704;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_LIGHT"])
    {
      uint64_t v8 = 1705;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_CAMERA"])
    {
      uint64_t v8 = 1706;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_OTHER"])
    {
      uint64_t v8 = 1707;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_PLACE"])
    {
      uint64_t v8 = 1708;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_NEIGHBORHOOD"])
    {
      uint64_t v8 = 1709;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_STOP"])
    {
      uint64_t v8 = 1710;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_BIKE_WALK_PATH"])
    {
      uint64_t v8 = 1711;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_SOMETHING_ELSE"])
    {
      uint64_t v8 = 1712;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRANSIT_LINE"])
    {
      uint64_t v8 = 1713;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_TRAFFIC_SIGN_LIGHT"])
    {
      uint64_t v8 = 1714;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_FEATURES"])
    {
      uint64_t v8 = 1715;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_SURFACE"])
    {
      uint64_t v8 = 1716;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_LANE"])
    {
      uint64_t v8 = 1717;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_CROSSWALK"])
    {
      uint64_t v8 = 1718;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_STREET_MEDIAN"])
    {
      uint64_t v8 = 1719;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ADD_MISSING_PATH_OR_TRAIL"])
    {
      uint64_t v8 = 1720;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_ALLOWED"])
    {
      uint64_t v8 = 2001;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_WRONG"])
    {
      uint64_t v8 = 2002;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SOMETHING_ELSE"])
    {
      uint64_t v8 = 2003;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_LANE_GUIDANCE"])
    {
      uint64_t v8 = 2051;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_SPOKEN_TOO_LATE"])
    {
      uint64_t v8 = 2052;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_DRIVING_NOT_ALLOWED"])
    {
      uint64_t v8 = 2053;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_ROUTE_STEP_TURN_NOT_SAFE"])
    {
      uint64_t v8 = 2054;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_LOCATION_WRONG"])
    {
      uint64_t v8 = 2101;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE"])
    {
      uint64_t v8 = 2102;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_DRIVING"])
    {
      uint64_t v8 = 2103;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_WALKING"])
    {
      uint64_t v8 = 2104;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ENTRANCE_BOTH"])
    {
      uint64_t v8 = 2105;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_NAV_DESTINATION_ADDRESS_WRONG"])
    {
      uint64_t v8 = 2106;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_ALLOWED"])
    {
      uint64_t v8 = 2201;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_BIKING_NOT_SAFE"])
    {
      uint64_t v8 = 2202;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING"])
    {
      uint64_t v8 = 2203;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_ADD"])
    {
      uint64_t v8 = 2204;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_ELEVATION_WARNING_REMOVE"])
    {
      uint64_t v8 = 2205;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT"])
    {
      uint64_t v8 = 2206;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_ADD"])
    {
      uint64_t v8 = 2207;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CYCLING_STEP_DISMOUNT_REMOVE"])
    {
      uint64_t v8 = 2208;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_ALLOWED"])
    {
      uint64_t v8 = 2301;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_WALK_STEP_WALKING_NOT_SAFE"])
    {
      uint64_t v8 = 2302;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRANSIT_STEP_BETTER_ROUTE_AVAILABLE"])
    {
      uint64_t v8 = 2401;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_NOT_RELEVANT"])
    {
      uint64_t v8 = 2501;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_INAPPROPRIATE"])
    {
      uint64_t v8 = 2502;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_IMAGE_QUALITY"])
    {
      uint64_t v8 = 2503;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_BUTTON"])
    {
      uint64_t v8 = 2504;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_PRIVACY_CONCERN"])
    {
      uint64_t v8 = 2505;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_LEGAL_ISSUE"])
    {
      uint64_t v8 = 2506;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_BUSINESS_POI_ENRICHMENT_SOMETHING_ELSE"])
    {
      uint64_t v8 = 2507;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_MISSING"])
    {
      uint64_t v8 = 2601;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_REMOVAL"])
    {
      uint64_t v8 = 2602;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_NAME_WRONG"])
    {
      uint64_t v8 = 2603;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_LANE_COUNT_WRONG"])
    {
      uint64_t v8 = 2604;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_RUNNING_TRACK_SHAPE_WRONG"])
    {
      uint64_t v8 = 2605;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_ERROR"])
    {
      uint64_t v8 = 5000;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STOP_SIGN_ERROR"])
    {
      uint64_t v8 = 5001;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_LIGHT_SIGN_WRONG"])
    {
      uint64_t v8 = 5002;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_TRAFFIC_LIGHT_MISSING"])
    {
      uint64_t v8 = 5003;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_STOP_SIGN_MISSING"])
    {
      uint64_t v8 = 5004;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_OPTION_CHOICE"])
    {
      uint64_t v8 = 10000;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_278;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_278:
    [a1 setKey:v8];
  }

  if (a3) {
    v9 = @"localizedText";
  }
  else {
    v9 = @"localized_text";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setLocalizedText:v11];
  }
  if (a3) {
    v12 = @"defaultText";
  }
  else {
    v12 = @"default_text";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v13 copy];
    [a1 setDefaultText:v14];
  }
  v15 = [v5 objectForKeyedSubscript:@"tag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = objc_msgSend(v21, "copy", (void)v28);
            [a1 addTag:v22];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }
  }
  v23 = [v5 objectForKeyedSubscript:@"annotations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEORPFeedbackFieldOptionAnnotations alloc];
    if (a3) {
      uint64_t v25 = [(GEORPFeedbackFieldOptionAnnotations *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEORPFeedbackFieldOptionAnnotations *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    objc_msgSend(a1, "setAnnotations:", v25, (void)v28);
  }
LABEL_306:

  return a1;
}

- (GEORPFeedbackFieldOption)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldOption *)-[GEORPFeedbackFieldOption _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_263;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_264;
    }
    GEORPFeedbackFieldOptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPFeedbackFieldOptionAnnotations *)self->_annotations readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldOptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldOptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackFieldOption *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_localizedText) {
      PBDataWriterWriteStringField();
    }
    if (self->_defaultText) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_tags;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_annotations) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackFieldOption *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 15) = self->_key;
    *((unsigned char *)v8 + 64) |= 1u;
  }
  if (self->_localizedText) {
    objc_msgSend(v8, "setLocalizedText:");
  }
  if (self->_defaultText) {
    objc_msgSend(v8, "setDefaultText:");
  }
  if ([(GEORPFeedbackFieldOption *)self tagsCount])
  {
    [v8 clearTags];
    unint64_t v4 = [(GEORPFeedbackFieldOption *)self tagsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackFieldOption *)self tagAtIndex:i];
        [v8 addTag:v7];
      }
    }
  }
  if (self->_annotations) {
    objc_msgSend(v8, "setAnnotations:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackFieldOptionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackFieldOption *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_key;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_localizedText copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_defaultText copyWithZone:a3];
  long long v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_tags;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addTag:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = [(GEORPFeedbackFieldOptionAnnotations *)self->_annotations copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORPFeedbackFieldOption *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_key != *((_DWORD *)v4 + 15)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  localizedText = self->_localizedText;
  if ((unint64_t)localizedText | *((void *)v4 + 4)
    && !-[NSString isEqual:](localizedText, "isEqual:"))
  {
    goto LABEL_15;
  }
  defaultText = self->_defaultText;
  if ((unint64_t)defaultText | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](defaultText, "isEqual:")) {
      goto LABEL_15;
    }
  }
  tags = self->_tags;
  if ((unint64_t)tags | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](tags, "isEqual:")) {
      goto LABEL_15;
    }
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((void *)v4 + 2)) {
    char v9 = -[GEORPFeedbackFieldOptionAnnotations isEqual:](annotations, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPFeedbackFieldOption *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_key;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_localizedText hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_defaultText hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_tags hash];
  return v6 ^ [(GEORPFeedbackFieldOptionAnnotations *)self->_annotations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 64))
  {
    self->_key = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[GEORPFeedbackFieldOption setLocalizedText:](self, "setLocalizedText:");
  }
  if (*((void *)v4 + 3)) {
    -[GEORPFeedbackFieldOption setDefaultText:](self, "setDefaultText:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackFieldOption addTag:](self, "addTag:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  annotations = self->_annotations;
  uint64_t v11 = *((void *)v4 + 2);
  if (annotations)
  {
    if (v11) {
      -[GEORPFeedbackFieldOptionAnnotations mergeFrom:](annotations, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackFieldOption setAnnotations:](self, "setAnnotations:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_localizedText, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end