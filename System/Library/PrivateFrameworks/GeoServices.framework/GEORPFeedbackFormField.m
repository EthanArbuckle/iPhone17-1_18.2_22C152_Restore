@interface GEORPFeedbackFormField
+ (BOOL)isValid:(id)a3;
+ (Class)tagType;
- (BOOL)hasAnnotations;
- (BOOL)hasFieldId;
- (BOOL)hasFormId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasName;
- (BOOL)hasParentFieldId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFieldValue)value;
- (GEORPFeedbackFormField)init;
- (GEORPFeedbackFormField)initWithData:(id)a3;
- (GEORPFeedbackFormField)initWithDictionary:(id)a3;
- (GEORPFeedbackFormField)initWithJSON:(id)a3;
- (GEORPFeedbackFormFieldAnnotations)annotations;
- (NSMutableArray)tags;
- (NSString)fieldId;
- (NSString)formId;
- (NSString)parentFieldId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)nameAsString:(int)a3;
- (id)tagAtIndex:(unint64_t)a3;
- (int)StringAsName:(id)a3;
- (int)name;
- (unint64_t)hash;
- (unint64_t)tagsCount;
- (void)_addNoFlagsTag:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnnotations;
- (void)_readFieldId;
- (void)_readFormId;
- (void)_readParentFieldId;
- (void)_readTags;
- (void)_readValue;
- (void)addTag:(id)a3;
- (void)clearTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnnotations:(id)a3;
- (void)setFieldId:(id)a3;
- (void)setFormId:(id)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(int)a3;
- (void)setParentFieldId:(id)a3;
- (void)setTags:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFormField

- (GEORPFeedbackFormField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFormField;
  v2 = [(GEORPFeedbackFormField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFormField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFormField;
  v3 = [(GEORPFeedbackFormField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)name
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_name;
  }
  else {
    return 0;
  }
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)nameAsString:(int)a3
{
  if (a3 <= 1200)
  {
    if (a3 <= 600)
    {
      switch(a3)
      {
        case 'e':
          v4 = @"FEEDBACK_FIELD_KEY_POI_NAME";
          break;
        case 'f':
          v4 = @"FEEDBACK_FIELD_KEY_POI_PHONE";
          break;
        case 'g':
          v4 = @"FEEDBACK_FIELD_KEY_POI_WEBSITE";
          break;
        case 'h':
          v4 = @"FEEDBACK_FIELD_KEY_POI_HOURS";
          break;
        case 'i':
          v4 = @"FEEDBACK_FIELD_KEY_POI_CATEGORY";
          break;
        case 'j':
          v4 = @"FEEDBACK_FIELD_KEY_POI_LOCATION";
          break;
        case 'k':
          v4 = @"FEEDBACK_FIELD_KEY_POI_AMENITIES";
          break;
        case 'l':
          v4 = @"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT";
          break;
        case 'm':
          v4 = @"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD";
          break;
        default:
          if (a3)
          {
            if (a3 != 1) {
              goto LABEL_146;
            }
            v4 = @"FEEDBACK_FIELD_KEY_COMMENTS";
          }
          else
          {
            v4 = @"FEEDBACK_FIELD_KEY_UNKNOWN";
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 601:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION";
          break;
        case 602:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT";
          break;
        case 603:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_BLDG";
          break;
        case 604:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE";
          break;
        case 605:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY";
          break;
        case 606:
          v4 = @"FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA";
          break;
        case 607:
          v4 = @"FEEDBACK_FIELD_KEY_POST_CODE";
          break;
        case 608:
          v4 = @"FEEDBACK_FIELD_KEY_ADDRESS_FULL";
          break;
        default:
          switch(a3)
          {
            case 1101:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME";
              break;
            case 1102:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION";
              break;
            case 1103:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE";
              break;
            case 1104:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT";
              break;
            case 1105:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS";
              break;
            case 1106:
              v4 = @"FEEDBACK_FIELD_KEY_TRANSIT_LINE";
              break;
            default:
              goto LABEL_146;
          }
          break;
      }
    }
    return v4;
  }
  if (a3 <= 1501)
  {
    if (a3 > 1301)
    {
      if (a3 > 1400)
      {
        if (a3 == 1401)
        {
          v4 = @"FEEDBACK_FIELD_KEY_TRAIL_NAME";
        }
        else
        {
          if (a3 != 1501) {
            goto LABEL_146;
          }
          v4 = @"FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE";
        }
      }
      else if (a3 == 1302)
      {
        v4 = @"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION";
      }
      else
      {
        if (a3 != 1303) {
          goto LABEL_146;
        }
        v4 = @"FEEDBACK_FIELD_KEY_LOCALITY_NAME";
      }
    }
    else
    {
      switch(a3)
      {
        case 1201:
          v4 = @"FEEDBACK_FIELD_KEY_STREET_NAME";
          break;
        case 1202:
          v4 = @"FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME";
          break;
        case 1203:
          v4 = @"FEEDBACK_FIELD_KEY_STREET_TILE_INFO";
          break;
        case 1204:
          v4 = @"FEEDBACK_FIELD_KEY_STREET_LOCATION";
          break;
        default:
          if (a3 != 1301) {
            goto LABEL_146;
          }
          v4 = @"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME";
          break;
      }
    }
  }
  else if (a3 > 2000)
  {
    switch(a3)
    {
      case 10001:
        v4 = @"FEEDBACK_FIELD_KEY_ISSUE_TYPE";
        break;
      case 10002:
        v4 = @"FEEDBACK_FIELD_KEY_OPTIONS_MENU";
        break;
      case 10003:
        v4 = @"FEEDBACK_FIELD_KEY_LOCATION";
        break;
      case 10004:
        v4 = @"FEEDBACK_FIELD_KEY_PHOTOS";
        break;
      default:
        if (a3 == 2001)
        {
          v4 = @"FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME";
        }
        else
        {
          if (a3 != 2002) {
            goto LABEL_146;
          }
          v4 = @"FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT";
        }
        break;
    }
  }
  else if (a3 > 1801)
  {
    if (a3 == 1802)
    {
      v4 = @"FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME";
    }
    else
    {
      if (a3 != 1901) {
        goto LABEL_146;
      }
      v4 = @"FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO";
    }
  }
  else
  {
    if (a3 != 1502)
    {
      if (a3 == 1801)
      {
        v4 = @"FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT";
        return v4;
      }
LABEL_146:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v4 = @"FEEDBACK_FIELD_KEY_ROUTE_STEP";
  }
  return v4;
}

- (int)StringAsName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_COMMENTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_NAME"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_PHONE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_WEBSITE"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_HOURS"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CATEGORY"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_LOCATION"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_AMENITIES"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_BLDG"])
  {
    int v4 = 603;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE"])
  {
    int v4 = 604;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY"])
  {
    int v4 = 605;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA"])
  {
    int v4 = 606;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_POST_CODE"])
  {
    int v4 = 607;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_FULL"])
  {
    int v4 = 608;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME"])
  {
    int v4 = 1101;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION"])
  {
    int v4 = 1102;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE"])
  {
    int v4 = 1103;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT"])
  {
    int v4 = 1104;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS"])
  {
    int v4 = 1105;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_LINE"])
  {
    int v4 = 1106;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_NAME"])
  {
    int v4 = 1201;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME"])
  {
    int v4 = 1202;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_TILE_INFO"])
  {
    int v4 = 1203;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_LOCATION"])
  {
    int v4 = 1204;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME"])
  {
    int v4 = 1301;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION"])
  {
    int v4 = 1302;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_LOCALITY_NAME"])
  {
    int v4 = 1303;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_TRAIL_NAME"])
  {
    int v4 = 1401;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE"])
  {
    int v4 = 1501;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ROUTE_STEP"])
  {
    int v4 = 1502;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT"])
  {
    int v4 = 1801;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME"])
  {
    int v4 = 1802;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO"])
  {
    int v4 = 1901;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME"])
  {
    int v4 = 2001;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT"])
  {
    int v4 = 2002;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_ISSUE_TYPE"])
  {
    int v4 = 10001;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_OPTIONS_MENU"])
  {
    int v4 = 10002;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_LOCATION"])
  {
    int v4 = 10003;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_FIELD_KEY_PHOTOS"])
  {
    int v4 = 10004;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValue_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (GEORPFeedbackFieldValue)value
{
  -[GEORPFeedbackFormField _readValue]((uint64_t)self);
  value = self->_value;

  return value;
}

- (void)setValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)_readFormId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFormId
{
  return self->_formId != 0;
}

- (NSString)formId
{
  -[GEORPFeedbackFormField _readFormId]((uint64_t)self);
  formId = self->_formId;

  return formId;
}

- (void)setFormId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_formId, a3);
}

- (void)_readFieldId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFieldId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFieldId
{
  return self->_fieldId != 0;
}

- (NSString)fieldId
{
  -[GEORPFeedbackFormField _readFieldId]((uint64_t)self);
  fieldId = self->_fieldId;

  return fieldId;
}

- (void)setFieldId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_fieldId, a3);
}

- (void)_readParentFieldId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentFieldId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasParentFieldId
{
  return self->_parentFieldId != 0;
}

- (NSString)parentFieldId
{
  -[GEORPFeedbackFormField _readParentFieldId]((uint64_t)self);
  parentFieldId = self->_parentFieldId;

  return parentFieldId;
}

- (void)setParentFieldId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_parentFieldId, a3);
}

- (void)_readTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTags_tags_670);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)tags
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  tags = self->_tags;

  return tags;
}

- (void)setTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  tags = self->_tags;
  self->_tags = v4;
}

- (void)clearTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  tags = self->_tags;

  [(NSMutableArray *)tags removeAllObjects];
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  -[GEORPFeedbackFormField _addNoFlagsTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)tagsCount
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  tags = self->_tags;

  return [(NSMutableArray *)tags count];
}

- (id)tagAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnotations_tags_671);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAnnotations
{
  return self->_annotations != 0;
}

- (GEORPFeedbackFormFieldAnnotations)annotations
{
  -[GEORPFeedbackFormField _readAnnotations]((uint64_t)self);
  annotations = self->_annotations;

  return annotations;
}

- (void)setAnnotations:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFormField;
  id v4 = [(GEORPFeedbackFormField *)&v8 description];
  id v5 = [(GEORPFeedbackFormField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFormField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_102;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 80))
  {
    int v5 = *(_DWORD *)(a1 + 76);
    if (v5 <= 1200)
    {
      if (v5 <= 600)
      {
        switch(v5)
        {
          case 'e':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_NAME";
            break;
          case 'f':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_PHONE";
            break;
          case 'g':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_WEBSITE";
            break;
          case 'h':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_HOURS";
            break;
          case 'i':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_CATEGORY";
            break;
          case 'j':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_LOCATION";
            break;
          case 'k':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_AMENITIES";
            break;
          case 'l':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT";
            break;
          case 'm':
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD";
            break;
          default:
            if (v5)
            {
              if (v5 != 1) {
                goto LABEL_42;
              }
              objc_super v6 = @"FEEDBACK_FIELD_KEY_COMMENTS";
            }
            else
            {
              objc_super v6 = @"FEEDBACK_FIELD_KEY_UNKNOWN";
            }
            break;
        }
      }
      else
      {
        switch(v5)
        {
          case 601:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION";
            break;
          case 602:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT";
            break;
          case 603:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_BLDG";
            break;
          case 604:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE";
            break;
          case 605:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY";
            break;
          case 606:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA";
            break;
          case 607:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_POST_CODE";
            break;
          case 608:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ADDRESS_FULL";
            break;
          default:
            switch(v5)
            {
              case 1101:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME";
                break;
              case 1102:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION";
                break;
              case 1103:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE";
                break;
              case 1104:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT";
                break;
              case 1105:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS";
                break;
              case 1106:
                objc_super v6 = @"FEEDBACK_FIELD_KEY_TRANSIT_LINE";
                break;
              default:
                goto LABEL_42;
            }
            break;
        }
      }
      goto LABEL_73;
    }
    if (v5 <= 1501)
    {
      if (v5 <= 1301)
      {
        switch(v5)
        {
          case 1201:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_STREET_NAME";
            break;
          case 1202:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME";
            break;
          case 1203:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_STREET_TILE_INFO";
            break;
          case 1204:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_STREET_LOCATION";
            break;
          default:
            if (v5 != 1301) {
              goto LABEL_42;
            }
            objc_super v6 = @"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME";
            break;
        }
        goto LABEL_73;
      }
      if (v5 > 1400)
      {
        if (v5 == 1401)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_TRAIL_NAME";
          goto LABEL_73;
        }
        if (v5 == 1501)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE";
          goto LABEL_73;
        }
      }
      else
      {
        if (v5 == 1302)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION";
          goto LABEL_73;
        }
        if (v5 == 1303)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_LOCALITY_NAME";
          goto LABEL_73;
        }
      }
    }
    else
    {
      if (v5 > 2000)
      {
        switch(v5)
        {
          case 10001:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_ISSUE_TYPE";
            break;
          case 10002:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_OPTIONS_MENU";
            break;
          case 10003:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_LOCATION";
            break;
          case 10004:
            objc_super v6 = @"FEEDBACK_FIELD_KEY_PHOTOS";
            break;
          default:
            if (v5 == 2001)
            {
              objc_super v6 = @"FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME";
            }
            else
            {
              if (v5 != 2002) {
                goto LABEL_42;
              }
              objc_super v6 = @"FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT";
            }
            break;
        }
        goto LABEL_73;
      }
      if (v5 > 1801)
      {
        if (v5 == 1802)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME";
          goto LABEL_73;
        }
        if (v5 == 1901)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO";
          goto LABEL_73;
        }
      }
      else
      {
        if (v5 == 1502)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_ROUTE_STEP";
          goto LABEL_73;
        }
        if (v5 == 1801)
        {
          objc_super v6 = @"FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT";
LABEL_73:
          [v4 setObject:v6 forKey:@"name"];

          goto LABEL_74;
        }
      }
    }
LABEL_42:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_73;
  }
LABEL_74:
  id v7 = [(id)a1 value];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    v9 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v9 forKey:@"value"];
  }
  v10 = [(id)a1 formId];
  if (v10)
  {
    if (a2) {
      v11 = @"formId";
    }
    else {
      v11 = @"form_id";
    }
    [v4 setObject:v10 forKey:v11];
  }

  v12 = [(id)a1 fieldId];
  if (v12)
  {
    if (a2) {
      v13 = @"fieldId";
    }
    else {
      v13 = @"field_id";
    }
    [v4 setObject:v12 forKey:v13];
  }

  v14 = [(id)a1 parentFieldId];
  if (v14)
  {
    if (a2) {
      v15 = @"parentFieldId";
    }
    else {
      v15 = @"parent_field_id";
    }
    [v4 setObject:v14 forKey:v15];
  }

  if (*(void *)(a1 + 48))
  {
    v16 = [(id)a1 tags];
    [v4 setObject:v16 forKey:@"tag"];
  }
  v17 = [(id)a1 annotations];
  v18 = v17;
  if (v17)
  {
    if (a2) {
      [v17 jsonRepresentation];
    }
    else {
    v19 = [v17 dictionaryRepresentation];
    }
    [v4 setObject:v19 forKey:@"annotations"];
  }
LABEL_102:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFormField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFormField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFormField *)-[GEORPFeedbackFormField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_134;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_134;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_COMMENTS"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_NAME"])
    {
      uint64_t v8 = 101;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_PHONE"])
    {
      uint64_t v8 = 102;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_WEBSITE"])
    {
      uint64_t v8 = 103;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_HOURS"])
    {
      uint64_t v8 = 104;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CATEGORY"])
    {
      uint64_t v8 = 105;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_LOCATION"])
    {
      uint64_t v8 = 106;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_AMENITIES"])
    {
      uint64_t v8 = 107;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT"])
    {
      uint64_t v8 = 108;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD"])
    {
      uint64_t v8 = 109;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION"])
    {
      uint64_t v8 = 601;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT"])
    {
      uint64_t v8 = 602;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_BLDG"])
    {
      uint64_t v8 = 603;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE"])
    {
      uint64_t v8 = 604;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY"])
    {
      uint64_t v8 = 605;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA"])
    {
      uint64_t v8 = 606;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_POST_CODE"])
    {
      uint64_t v8 = 607;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ADDRESS_FULL"])
    {
      uint64_t v8 = 608;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME"])
    {
      uint64_t v8 = 1101;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION"])
    {
      uint64_t v8 = 1102;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE"])
    {
      uint64_t v8 = 1103;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT"])
    {
      uint64_t v8 = 1104;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS"])
    {
      uint64_t v8 = 1105;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRANSIT_LINE"])
    {
      uint64_t v8 = 1106;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_NAME"])
    {
      uint64_t v8 = 1201;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME"])
    {
      uint64_t v8 = 1202;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_TILE_INFO"])
    {
      uint64_t v8 = 1203;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_STREET_LOCATION"])
    {
      uint64_t v8 = 1204;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME"])
    {
      uint64_t v8 = 1301;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION"])
    {
      uint64_t v8 = 1302;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_LOCALITY_NAME"])
    {
      uint64_t v8 = 1303;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_TRAIL_NAME"])
    {
      uint64_t v8 = 1401;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE"])
    {
      uint64_t v8 = 1501;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ROUTE_STEP"])
    {
      uint64_t v8 = 1502;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT"])
    {
      uint64_t v8 = 1801;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME"])
    {
      uint64_t v8 = 1802;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO"])
    {
      uint64_t v8 = 1901;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME"])
    {
      uint64_t v8 = 2001;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT"])
    {
      uint64_t v8 = 2002;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_ISSUE_TYPE"])
    {
      uint64_t v8 = 10001;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_OPTIONS_MENU"])
    {
      uint64_t v8 = 10002;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_LOCATION"])
    {
      uint64_t v8 = 10003;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_FIELD_KEY_PHOTOS"])
    {
      uint64_t v8 = 10004;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_96;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_96:
    [a1 setName:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEORPFeedbackFieldValue alloc];
    if (a3) {
      uint64_t v11 = [(GEORPFeedbackFieldValue *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEORPFeedbackFieldValue *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setValue:v11];
  }
  if (a3) {
    v13 = @"formId";
  }
  else {
    v13 = @"form_id";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setFormId:v15];
  }
  if (a3) {
    v16 = @"fieldId";
  }
  else {
    v16 = @"field_id";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    [a1 setFieldId:v18];
  }
  if (a3) {
    v19 = @"parentFieldId";
  }
  else {
    v19 = @"parent_field_id";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = (void *)[v20 copy];
    [a1 setParentFieldId:v21];
  }
  v22 = [v5 objectForKeyedSubscript:@"tag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = objc_msgSend(v28, "copy", (void)v35);
            [a1 addTag:v29];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v25);
    }
  }
  v30 = [v5 objectForKeyedSubscript:@"annotations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEORPFeedbackFormFieldAnnotations alloc];
    if (a3) {
      uint64_t v32 = [(GEORPFeedbackFormFieldAnnotations *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEORPFeedbackFormFieldAnnotations *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    objc_msgSend(a1, "setAnnotations:", v32, (void)v35);
  }
LABEL_134:

  return a1;
}

- (GEORPFeedbackFormField)initWithJSON:(id)a3
{
  return (GEORPFeedbackFormField *)-[GEORPFeedbackFormField _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_698;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_699;
    }
    GEORPFeedbackFormFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPFeedbackFieldValue *)self->_value readAll:1];
    [(GEORPFeedbackFormFieldAnnotations *)self->_annotations readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFormFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFormFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackFormFieldIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackFormField *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_value) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_formId) {
      PBDataWriterWriteStringField();
    }
    if (self->_fieldId) {
      PBDataWriterWriteStringField();
    }
    if (self->_parentFieldId) {
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

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackFormField _readValue]((uint64_t)self);
  value = self->_value;

  return [(GEORPFeedbackFieldValue *)value hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackFormField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 19) = self->_name;
    *((unsigned char *)v8 + 80) |= 1u;
  }
  if (self->_value) {
    objc_msgSend(v8, "setValue:");
  }
  if (self->_formId) {
    objc_msgSend(v8, "setFormId:");
  }
  if (self->_fieldId) {
    objc_msgSend(v8, "setFieldId:");
  }
  if (self->_parentFieldId) {
    objc_msgSend(v8, "setParentFieldId:");
  }
  if ([(GEORPFeedbackFormField *)self tagsCount])
  {
    [v8 clearTags];
    unint64_t v4 = [(GEORPFeedbackFormField *)self tagsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackFormField *)self tagAtIndex:i];
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackFormFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackFormField *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_name;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEORPFeedbackFieldValue *)self->_value copyWithZone:a3];
  v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_formId copyWithZone:a3];
  long long v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_fieldId copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_parentFieldId copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_tags;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addTag:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  id v22 = [(GEORPFeedbackFormFieldAnnotations *)self->_annotations copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPFeedbackFormField *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_name != *((_DWORD *)v4 + 19)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 7) && !-[GEORPFeedbackFieldValue isEqual:](value, "isEqual:")) {
    goto LABEL_19;
  }
  formId = self->_formId;
  if ((unint64_t)formId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](formId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  fieldId = self->_fieldId;
  if ((unint64_t)fieldId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](fieldId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  parentFieldId = self->_parentFieldId;
  if ((unint64_t)parentFieldId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentFieldId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  tags = self->_tags;
  if ((unint64_t)tags | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](tags, "isEqual:")) {
      goto LABEL_19;
    }
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((void *)v4 + 2)) {
    char v11 = -[GEORPFeedbackFormFieldAnnotations isEqual:](annotations, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  [(GEORPFeedbackFormField *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_name;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPFeedbackFieldValue *)self->_value hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_formId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_fieldId hash];
  NSUInteger v7 = [(NSString *)self->_parentFieldId hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_tags hash];
  return v6 ^ v8 ^ [(GEORPFeedbackFormFieldAnnotations *)self->_annotations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 80))
  {
    self->_name = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 7);
  if (value)
  {
    if (v6) {
      -[GEORPFeedbackFieldValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPFeedbackFormField setValue:](self, "setValue:");
  }
  if (*((void *)v4 + 4)) {
    -[GEORPFeedbackFormField setFormId:](self, "setFormId:");
  }
  if (*((void *)v4 + 3)) {
    -[GEORPFeedbackFormField setFieldId:](self, "setFieldId:");
  }
  if (*((void *)v4 + 5)) {
    -[GEORPFeedbackFormField setParentFieldId:](self, "setParentFieldId:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPFeedbackFormField addTag:](self, "addTag:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  annotations = self->_annotations;
  uint64_t v13 = *((void *)v4 + 2);
  if (annotations)
  {
    if (v13) {
      -[GEORPFeedbackFormFieldAnnotations mergeFrom:](annotations, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPFeedbackFormField setAnnotations:](self, "setAnnotations:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_parentFieldId, 0);
  objc_storeStrong((id *)&self->_formId, 0);
  objc_storeStrong((id *)&self->_fieldId, 0);
  objc_storeStrong((id *)&self->_annotations, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end