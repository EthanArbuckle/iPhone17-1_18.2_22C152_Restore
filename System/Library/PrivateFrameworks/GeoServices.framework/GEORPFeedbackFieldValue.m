@interface GEORPFeedbackFieldValue
+ (BOOL)isValid:(id)a3;
+ (Class)hoursFieldType;
+ (Class)photoMetadataType;
- (BOOL)hasAmenitiesField;
- (BOOL)hasAnnotations;
- (BOOL)hasBooleanField;
- (BOOL)hasDateTimeField;
- (BOOL)hasDoubleField;
- (BOOL)hasFieldValueType;
- (BOOL)hasFloatField;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIntField;
- (BOOL)hasLocationField;
- (BOOL)hasLongField;
- (BOOL)hasMultiSelectField;
- (BOOL)hasRouteStepField;
- (BOOL)hasSingleSelectField;
- (BOOL)hasTextField;
- (BOOL)hasTextListField;
- (BOOL)hasTileFeatureInfoField;
- (BOOL)hasTransitLineField;
- (BOOL)hasUintField;
- (BOOL)hasUlongField;
- (BOOL)hasUlongListField;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAmenityCorrections)amenitiesField;
- (GEORPFeedbackBooleanField)BOOLeanField;
- (GEORPFeedbackCoordinateField)locationField;
- (GEORPFeedbackDoubleField)doubleField;
- (GEORPFeedbackFieldAnnotations)annotations;
- (GEORPFeedbackFieldValue)init;
- (GEORPFeedbackFieldValue)initWithData:(id)a3;
- (GEORPFeedbackFieldValue)initWithDictionary:(id)a3;
- (GEORPFeedbackFieldValue)initWithJSON:(id)a3;
- (GEORPFeedbackFloatField)floatField;
- (GEORPFeedbackIntField)intField;
- (GEORPFeedbackLongField)longField;
- (GEORPFeedbackMultiSelectField)multiSelectField;
- (GEORPFeedbackRouteStep)routeStepField;
- (GEORPFeedbackSingleSelectField)singleSelectField;
- (GEORPFeedbackTextField)textField;
- (GEORPFeedbackTextListField)textListField;
- (GEORPFeedbackTileFeatureInfo)tileFeatureInfoField;
- (GEORPFeedbackTimestamp)dateTimeField;
- (GEORPFeedbackTransitLine)transitLineField;
- (GEORPFeedbackUIntField)uintField;
- (GEORPFeedbackULongField)ulongField;
- (GEORPFeedbackULongListField)ulongListField;
- (NSMutableArray)hoursFields;
- (NSMutableArray)photoMetadatas;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldValueTypeAsString:(int)a3;
- (id)hoursFieldAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)photoMetadataAtIndex:(unint64_t)a3;
- (int)StringAsFieldValueType:(id)a3;
- (int)fieldValueType;
- (unint64_t)hash;
- (unint64_t)hoursFieldsCount;
- (unint64_t)photoMetadatasCount;
- (void)_addNoFlagsHoursField:(uint64_t)a1;
- (void)_addNoFlagsPhotoMetadata:(uint64_t)a1;
- (void)_readAmenitiesField;
- (void)_readAnnotations;
- (void)_readBooleanField;
- (void)_readDateTimeField;
- (void)_readDoubleField;
- (void)_readFloatField;
- (void)_readHoursFields;
- (void)_readIntField;
- (void)_readLocationField;
- (void)_readLongField;
- (void)_readMultiSelectField;
- (void)_readPhotoMetadatas;
- (void)_readRouteStepField;
- (void)_readSingleSelectField;
- (void)_readTextField;
- (void)_readTextListField;
- (void)_readTileFeatureInfoField;
- (void)_readTransitLineField;
- (void)_readUintField;
- (void)_readUlongField;
- (void)_readUlongListField;
- (void)addHoursField:(id)a3;
- (void)addPhotoMetadata:(id)a3;
- (void)clearHoursFields;
- (void)clearPhotoMetadatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAmenitiesField:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setBooleanField:(id)a3;
- (void)setDateTimeField:(id)a3;
- (void)setDoubleField:(id)a3;
- (void)setFieldValueType:(int)a3;
- (void)setFloatField:(id)a3;
- (void)setHasFieldValueType:(BOOL)a3;
- (void)setHoursFields:(id)a3;
- (void)setIntField:(id)a3;
- (void)setLocationField:(id)a3;
- (void)setLongField:(id)a3;
- (void)setMultiSelectField:(id)a3;
- (void)setPhotoMetadatas:(id)a3;
- (void)setRouteStepField:(id)a3;
- (void)setSingleSelectField:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextListField:(id)a3;
- (void)setTileFeatureInfoField:(id)a3;
- (void)setTransitLineField:(id)a3;
- (void)setUintField:(id)a3;
- (void)setUlongField:(id)a3;
- (void)setUlongListField:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFieldValue

- (GEORPFeedbackFieldValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFieldValue;
  v2 = [(GEORPFeedbackFieldValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFieldValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFieldValue;
  v3 = [(GEORPFeedbackFieldValue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)fieldValueType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $DFFB4F96B55397D28D7190630BF467E9 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_fieldValueType;
  }
  else {
    return 0;
  }
}

- (void)setFieldValueType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_fieldValueType = a3;
}

- (void)setHasFieldValueType:(BOOL)a3
{
  self->_$DFFB4F96B55397D28D7190630BF467E9 flags = ($DFFB4F96B55397D28D7190630BF467E9)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasFieldValueType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)fieldValueTypeAsString:(int)a3
{
  if a3 < 0x16 && ((0x3FFEFFu >> a3))
  {
    v3 = off_1E53E6908[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsFieldValueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FIELD_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FIELD_SINGLE_SELECT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FIELD_MULTI_SELECT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FIELD_TEXT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FIELD_TEXT_LIST"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FIELD_DATE_TIME"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FIELD_COORDINATE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FIELD_BOOLEAN"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FIELD_LONG"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FIELD_ULONG"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FIELD_INT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FIELD_UINT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FIELD_DOUBLE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FIELD_FLOAT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FIELD_HOURS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FIELD_TILE_FEATURE_INFO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FIELD_AMENITIES"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FIELD_ULONG_LIST"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FIELD_ROUTE_STEP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FIELD_TRANSIT_LINE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FIELD_PHOTOS"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSingleSelectField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSingleSelectField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasSingleSelectField
{
  return self->_singleSelectField != 0;
}

- (GEORPFeedbackSingleSelectField)singleSelectField
{
  -[GEORPFeedbackFieldValue _readSingleSelectField]((uint64_t)self);
  singleSelectField = self->_singleSelectField;

  return singleSelectField;
}

- (void)setSingleSelectField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_singleSelectField, a3);
}

- (void)_readMultiSelectField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiSelectField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasMultiSelectField
{
  return self->_multiSelectField != 0;
}

- (GEORPFeedbackMultiSelectField)multiSelectField
{
  -[GEORPFeedbackFieldValue _readMultiSelectField]((uint64_t)self);
  multiSelectField = self->_multiSelectField;

  return multiSelectField;
}

- (void)setMultiSelectField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_multiSelectField, a3);
}

- (void)_readTextField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTextField
{
  return self->_textField != 0;
}

- (GEORPFeedbackTextField)textField
{
  -[GEORPFeedbackFieldValue _readTextField]((uint64_t)self);
  textField = self->_textField;

  return textField;
}

- (void)setTextField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void)_readTextListField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextListField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTextListField
{
  return self->_textListField != 0;
}

- (GEORPFeedbackTextListField)textListField
{
  -[GEORPFeedbackFieldValue _readTextListField]((uint64_t)self);
  textListField = self->_textListField;

  return textListField;
}

- (void)setTextListField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_textListField, a3);
}

- (void)_readDateTimeField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDateTimeField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDateTimeField
{
  return self->_dateTimeField != 0;
}

- (GEORPFeedbackTimestamp)dateTimeField
{
  -[GEORPFeedbackFieldValue _readDateTimeField]((uint64_t)self);
  dateTimeField = self->_dateTimeField;

  return dateTimeField;
}

- (void)setDateTimeField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  objc_storeStrong((id *)&self->_dateTimeField, a3);
}

- (void)_readLocationField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLocationField
{
  return self->_locationField != 0;
}

- (GEORPFeedbackCoordinateField)locationField
{
  -[GEORPFeedbackFieldValue _readLocationField]((uint64_t)self);
  locationField = self->_locationField;

  return locationField;
}

- (void)setLocationField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_locationField, a3);
}

- (void)_readBooleanField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBooleanField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasBooleanField
{
  return self->_BOOLeanField != 0;
}

- (GEORPFeedbackBooleanField)BOOLeanField
{
  -[GEORPFeedbackFieldValue _readBooleanField]((uint64_t)self);
  BOOLeanField = self->_BOOLeanField;

  return BOOLeanField;
}

- (void)setBooleanField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  objc_storeStrong((id *)&self->_BOOLeanField, a3);
}

- (void)_readLongField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLongField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLongField
{
  return self->_longField != 0;
}

- (GEORPFeedbackLongField)longField
{
  -[GEORPFeedbackFieldValue _readLongField]((uint64_t)self);
  longField = self->_longField;

  return longField;
}

- (void)setLongField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_longField, a3);
}

- (void)_readUlongField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUlongField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUlongField
{
  return self->_ulongField != 0;
}

- (GEORPFeedbackULongField)ulongField
{
  -[GEORPFeedbackFieldValue _readUlongField]((uint64_t)self);
  ulongField = self->_ulongField;

  return ulongField;
}

- (void)setUlongField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_ulongField, a3);
}

- (void)_readIntField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasIntField
{
  return self->_intField != 0;
}

- (GEORPFeedbackIntField)intField
{
  -[GEORPFeedbackFieldValue _readIntField]((uint64_t)self);
  intField = self->_intField;

  return intField;
}

- (void)setIntField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400100u;
  objc_storeStrong((id *)&self->_intField, a3);
}

- (void)_readUintField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUintField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUintField
{
  return self->_uintField != 0;
}

- (GEORPFeedbackUIntField)uintField
{
  -[GEORPFeedbackFieldValue _readUintField]((uint64_t)self);
  uintField = self->_uintField;

  return uintField;
}

- (void)setUintField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_uintField, a3);
}

- (void)_readDoubleField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDoubleField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDoubleField
{
  return self->_doubleField != 0;
}

- (GEORPFeedbackDoubleField)doubleField
{
  -[GEORPFeedbackFieldValue _readDoubleField]((uint64_t)self);
  doubleField = self->_doubleField;

  return doubleField;
}

- (void)setDoubleField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400020u;
  objc_storeStrong((id *)&self->_doubleField, a3);
}

- (void)_readFloatField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFloatField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasFloatField
{
  return self->_floatField != 0;
}

- (GEORPFeedbackFloatField)floatField
{
  -[GEORPFeedbackFieldValue _readFloatField]((uint64_t)self);
  floatField = self->_floatField;

  return floatField;
}

- (void)setFloatField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  objc_storeStrong((id *)&self->_floatField, a3);
}

- (void)_readHoursFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (NSMutableArray)hoursFields
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  hoursFields = self->_hoursFields;

  return hoursFields;
}

- (void)setHoursFields:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  hoursFields = self->_hoursFields;
  self->_hoursFields = v4;
}

- (void)clearHoursFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  hoursFields = self->_hoursFields;

  [(NSMutableArray *)hoursFields removeAllObjects];
}

- (void)addHoursField:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  -[GEORPFeedbackFieldValue _addNoFlagsHoursField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
}

- (void)_addNoFlagsHoursField:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)hoursFieldsCount
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  hoursFields = self->_hoursFields;

  return [(NSMutableArray *)hoursFields count];
}

- (id)hoursFieldAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldValue _readHoursFields]((uint64_t)self);
  hoursFields = self->_hoursFields;

  return (id)[(NSMutableArray *)hoursFields objectAtIndex:a3];
}

+ (Class)hoursFieldType
{
  return (Class)objc_opt_class();
}

- (void)_readTileFeatureInfoField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileFeatureInfoField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTileFeatureInfoField
{
  return self->_tileFeatureInfoField != 0;
}

- (GEORPFeedbackTileFeatureInfo)tileFeatureInfoField
{
  -[GEORPFeedbackFieldValue _readTileFeatureInfoField]((uint64_t)self);
  tileFeatureInfoField = self->_tileFeatureInfoField;

  return tileFeatureInfoField;
}

- (void)setTileFeatureInfoField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_tileFeatureInfoField, a3);
}

- (void)_readAmenitiesField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAmenitiesField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAmenitiesField
{
  return self->_amenitiesField != 0;
}

- (GEORPAmenityCorrections)amenitiesField
{
  -[GEORPFeedbackFieldValue _readAmenitiesField]((uint64_t)self);
  amenitiesField = self->_amenitiesField;

  return amenitiesField;
}

- (void)setAmenitiesField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  objc_storeStrong((id *)&self->_amenitiesField, a3);
}

- (void)_readUlongListField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUlongListField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasUlongListField
{
  return self->_ulongListField != 0;
}

- (GEORPFeedbackULongListField)ulongListField
{
  -[GEORPFeedbackFieldValue _readUlongListField]((uint64_t)self);
  ulongListField = self->_ulongListField;

  return ulongListField;
}

- (void)setUlongListField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_ulongListField, a3);
}

- (void)_readRouteStepField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteStepField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRouteStepField
{
  return self->_routeStepField != 0;
}

- (GEORPFeedbackRouteStep)routeStepField
{
  -[GEORPFeedbackFieldValue _readRouteStepField]((uint64_t)self);
  routeStepField = self->_routeStepField;

  return routeStepField;
}

- (void)setRouteStepField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_routeStepField, a3);
}

- (void)_readTransitLineField
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 202) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineField_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTransitLineField
{
  return self->_transitLineField != 0;
}

- (GEORPFeedbackTransitLine)transitLineField
{
  -[GEORPFeedbackFieldValue _readTransitLineField]((uint64_t)self);
  transitLineField = self->_transitLineField;

  return transitLineField;
}

- (void)setTransitLineField:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_transitLineField, a3);
}

- (void)_readPhotoMetadatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 201) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoMetadatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (NSMutableArray)photoMetadatas
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  photoMetadatas = self->_photoMetadatas;

  return photoMetadatas;
}

- (void)setPhotoMetadatas:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  photoMetadatas = self->_photoMetadatas;
  self->_photoMetadatas = v4;
}

- (void)clearPhotoMetadatas
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
  photoMetadatas = self->_photoMetadatas;

  [(NSMutableArray *)photoMetadatas removeAllObjects];
}

- (void)addPhotoMetadata:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  -[GEORPFeedbackFieldValue _addNoFlagsPhotoMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x400000u;
}

- (void)_addNoFlagsPhotoMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)photoMetadatasCount
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  photoMetadatas = self->_photoMetadatas;

  return [(NSMutableArray *)photoMetadatas count];
}

- (id)photoMetadataAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFieldValue _readPhotoMetadatas]((uint64_t)self);
  photoMetadatas = self->_photoMetadatas;

  return (id)[(NSMutableArray *)photoMetadatas objectAtIndex:a3];
}

+ (Class)photoMetadataType
{
  return (Class)objc_opt_class();
}

- (void)_readAnnotations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 200) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFieldValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnotations_tags_339);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAnnotations
{
  return self->_annotations != 0;
}

- (GEORPFeedbackFieldAnnotations)annotations
{
  -[GEORPFeedbackFieldValue _readAnnotations]((uint64_t)self);
  annotations = self->_annotations;

  return annotations;
}

- (void)setAnnotations:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackFieldValue;
  id v4 = [(GEORPFeedbackFieldValue *)&v8 description];
  id v5 = [(GEORPFeedbackFieldValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFieldValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 200))
    {
      uint64_t v5 = *(int *)(a1 + 196);
      if v5 < 0x16 && ((0x3FFEFFu >> v5))
      {
        objc_super v6 = off_1E53E6908[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 196));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        id v7 = @"fieldValueType";
      }
      else {
        id v7 = @"field_value_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 singleSelectField];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"singleSelectField";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"single_select_field";
      }
      id v12 = v10;

      [v4 setObject:v12 forKey:v11];
    }

    v13 = [(id)a1 multiSelectField];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"multiSelectField";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"multi_select_field";
      }
      id v17 = v15;

      [v4 setObject:v17 forKey:v16];
    }

    v18 = [(id)a1 textField];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"textField";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"text_field";
      }
      id v22 = v20;

      [v4 setObject:v22 forKey:v21];
    }

    v23 = [(id)a1 textListField];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"textListField";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"text_list_field";
      }
      id v27 = v25;

      [v4 setObject:v27 forKey:v26];
    }

    v28 = [(id)a1 dateTimeField];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"dateTimeField";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"date_time_field";
      }
      id v32 = v30;

      [v4 setObject:v32 forKey:v31];
    }

    v33 = [(id)a1 locationField];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"locationField";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"location_field";
      }
      id v37 = v35;

      [v4 setObject:v37 forKey:v36];
    }

    v38 = [(id)a1 BOOLeanField];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"BOOLeanField";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"BOOLean_field";
      }
      id v42 = v40;

      [v4 setObject:v42 forKey:v41];
    }

    v43 = [(id)a1 longField];
    v44 = v43;
    if (v43)
    {
      if (a2)
      {
        v45 = [v43 jsonRepresentation];
        v46 = @"longField";
      }
      else
      {
        v45 = [v43 dictionaryRepresentation];
        v46 = @"long_field";
      }
      id v47 = v45;

      [v4 setObject:v47 forKey:v46];
    }

    v48 = [(id)a1 ulongField];
    v49 = v48;
    if (v48)
    {
      if (a2)
      {
        v50 = [v48 jsonRepresentation];
        v51 = @"ulongField";
      }
      else
      {
        v50 = [v48 dictionaryRepresentation];
        v51 = @"ulong_field";
      }
      id v52 = v50;

      [v4 setObject:v52 forKey:v51];
    }

    v53 = [(id)a1 intField];
    v54 = v53;
    if (v53)
    {
      if (a2)
      {
        v55 = [v53 jsonRepresentation];
        v56 = @"intField";
      }
      else
      {
        v55 = [v53 dictionaryRepresentation];
        v56 = @"int_field";
      }
      id v57 = v55;

      [v4 setObject:v57 forKey:v56];
    }

    v58 = [(id)a1 uintField];
    v59 = v58;
    if (v58)
    {
      if (a2)
      {
        v60 = [v58 jsonRepresentation];
        v61 = @"uintField";
      }
      else
      {
        v60 = [v58 dictionaryRepresentation];
        v61 = @"uint_field";
      }
      id v62 = v60;

      [v4 setObject:v62 forKey:v61];
    }

    v63 = [(id)a1 doubleField];
    v64 = v63;
    if (v63)
    {
      if (a2)
      {
        v65 = [v63 jsonRepresentation];
        v66 = @"doubleField";
      }
      else
      {
        v65 = [v63 dictionaryRepresentation];
        v66 = @"double_field";
      }
      id v67 = v65;

      [v4 setObject:v67 forKey:v66];
    }

    v68 = [(id)a1 floatField];
    v69 = v68;
    if (v68)
    {
      if (a2)
      {
        v70 = [v68 jsonRepresentation];
        v71 = @"floatField";
      }
      else
      {
        v70 = [v68 dictionaryRepresentation];
        v71 = @"float_field";
      }
      id v72 = v70;

      [v4 setObject:v72 forKey:v71];
    }

    if ([*(id *)(a1 + 64) count])
    {
      v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v74 = *(id *)(a1 + 64);
      uint64_t v75 = [v74 countByEnumeratingWithState:&v125 objects:v130 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v76; ++i)
          {
            if (*(void *)v126 != v77) {
              objc_enumerationMutation(v74);
            }
            v79 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            if (a2) {
              [v79 jsonRepresentation];
            }
            else {
            id v80 = [v79 dictionaryRepresentation];
            }

            [v73 addObject:v80];
          }
          uint64_t v76 = [v74 countByEnumeratingWithState:&v125 objects:v130 count:16];
        }
        while (v76);
      }

      if (a2) {
        v81 = @"hoursField";
      }
      else {
        v81 = @"hours_field";
      }
      [v4 setObject:v73 forKey:v81];
    }
    v82 = [(id)a1 tileFeatureInfoField];
    v83 = v82;
    if (v82)
    {
      if (a2)
      {
        v84 = [v82 jsonRepresentation];
        v85 = @"tileFeatureInfoField";
      }
      else
      {
        v84 = [v82 dictionaryRepresentation];
        v85 = @"tile_feature_info_field";
      }
      id v86 = v84;

      [v4 setObject:v86 forKey:v85];
    }

    v87 = [(id)a1 amenitiesField];
    v88 = v87;
    if (v87)
    {
      if (a2)
      {
        v89 = [v87 jsonRepresentation];
        v90 = @"amenitiesField";
      }
      else
      {
        v89 = [v87 dictionaryRepresentation];
        v90 = @"amenities_field";
      }
      id v91 = v89;

      [v4 setObject:v91 forKey:v90];
    }

    v92 = [(id)a1 ulongListField];
    v93 = v92;
    if (v92)
    {
      if (a2)
      {
        v94 = [v92 jsonRepresentation];
        v95 = @"ulongListField";
      }
      else
      {
        v94 = [v92 dictionaryRepresentation];
        v95 = @"ulong_list_field";
      }
      id v96 = v94;

      [v4 setObject:v96 forKey:v95];
    }

    v97 = [(id)a1 routeStepField];
    v98 = v97;
    if (v97)
    {
      if (a2)
      {
        v99 = [v97 jsonRepresentation];
        v100 = @"routeStepField";
      }
      else
      {
        v99 = [v97 dictionaryRepresentation];
        v100 = @"route_step_field";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    v102 = [(id)a1 transitLineField];
    v103 = v102;
    if (v102)
    {
      if (a2)
      {
        v104 = [v102 jsonRepresentation];
        v105 = @"transitLineField";
      }
      else
      {
        v104 = [v102 dictionaryRepresentation];
        v105 = @"transit_line_field";
      }
      id v106 = v104;

      [v4 setObject:v106 forKey:v105];
    }

    if ([*(id *)(a1 + 104) count])
    {
      v107 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v108 = *(id *)(a1 + 104);
      uint64_t v109 = [v108 countByEnumeratingWithState:&v121 objects:v129 count:16];
      if (v109)
      {
        uint64_t v110 = v109;
        uint64_t v111 = *(void *)v122;
        do
        {
          for (uint64_t j = 0; j != v110; ++j)
          {
            if (*(void *)v122 != v111) {
              objc_enumerationMutation(v108);
            }
            v113 = *(void **)(*((void *)&v121 + 1) + 8 * j);
            if (a2) {
              [v113 jsonRepresentation];
            }
            else {
            id v114 = [v113 dictionaryRepresentation];
            }

            [v107 addObject:v114];
          }
          uint64_t v110 = [v108 countByEnumeratingWithState:&v121 objects:v129 count:16];
        }
        while (v110);
      }

      if (a2) {
        v115 = @"photoMetadata";
      }
      else {
        v115 = @"photo_metadata";
      }
      [v4 setObject:v107 forKey:v115];
    }
    v116 = [(id)a1 annotations];
    v117 = v116;
    if (v116)
    {
      if (a2) {
        [v116 jsonRepresentation];
      }
      else {
      id v118 = [v116 dictionaryRepresentation];
      }

      [v4 setObject:v118 forKey:@"annotations"];
    }

    id v119 = v4;
  }
  else
  {
    id v119 = 0;
  }

  return v119;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFieldValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFieldValue)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFieldValue *)-[GEORPFeedbackFieldValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_238;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_238;
  }
  if (a3) {
    objc_super v6 = @"fieldValueType";
  }
  else {
    objc_super v6 = @"field_value_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_FIELD_TYPE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"FIELD_SINGLE_SELECT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FIELD_MULTI_SELECT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"FIELD_TEXT"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FIELD_TEXT_LIST"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FIELD_DATE_TIME"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FIELD_COORDINATE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"FIELD_BOOLEAN"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"FIELD_LONG"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"FIELD_ULONG"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"FIELD_INT"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"FIELD_UINT"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"FIELD_DOUBLE"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"FIELD_FLOAT"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"FIELD_HOURS"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"FIELD_TILE_FEATURE_INFO"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"FIELD_AMENITIES"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"FIELD_ULONG_LIST"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"FIELD_ROUTE_STEP"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"FIELD_TRANSIT_LINE"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"FIELD_PHOTOS"])
    {
      uint64_t v9 = 21;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_53;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_53:
    [a1 setFieldValueType:v9];
  }

  if (a3) {
    v10 = @"singleSelectField";
  }
  else {
    v10 = @"single_select_field";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [GEORPFeedbackSingleSelectField alloc];
    if (a3) {
      uint64_t v13 = [(GEORPFeedbackSingleSelectField *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEORPFeedbackSingleSelectField *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setSingleSelectField:v13];
  }
  if (a3) {
    v15 = @"multiSelectField";
  }
  else {
    v15 = @"multi_select_field";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [GEORPFeedbackMultiSelectField alloc];
    if (a3) {
      uint64_t v18 = [(GEORPFeedbackMultiSelectField *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEORPFeedbackMultiSelectField *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setMultiSelectField:v18];
  }
  if (a3) {
    v20 = @"textField";
  }
  else {
    v20 = @"text_field";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = [GEORPFeedbackTextField alloc];
    if (a3) {
      uint64_t v23 = [(GEORPFeedbackTextField *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEORPFeedbackTextField *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setTextField:v23];
  }
  if (a3) {
    v25 = @"textListField";
  }
  else {
    v25 = @"text_list_field";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = [GEORPFeedbackTextListField alloc];
    if (a3) {
      uint64_t v28 = [(GEORPFeedbackTextListField *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEORPFeedbackTextListField *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setTextListField:v28];
  }
  if (a3) {
    v30 = @"dateTimeField";
  }
  else {
    v30 = @"date_time_field";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = [GEORPFeedbackTimestamp alloc];
    if (a3) {
      uint64_t v33 = [(GEORPFeedbackTimestamp *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEORPFeedbackTimestamp *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setDateTimeField:v33];
  }
  if (a3) {
    v35 = @"locationField";
  }
  else {
    v35 = @"location_field";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = [GEORPFeedbackCoordinateField alloc];
    if (a3) {
      uint64_t v38 = [(GEORPFeedbackCoordinateField *)v37 initWithJSON:v36];
    }
    else {
      uint64_t v38 = [(GEORPFeedbackCoordinateField *)v37 initWithDictionary:v36];
    }
    v39 = (void *)v38;
    [a1 setLocationField:v38];
  }
  if (a3) {
    v40 = @"BOOLeanField";
  }
  else {
    v40 = @"BOOLean_field";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = [GEORPFeedbackBooleanField alloc];
    if (a3) {
      uint64_t v43 = [(GEORPFeedbackBooleanField *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEORPFeedbackBooleanField *)v42 initWithDictionary:v41];
    }
    v44 = (void *)v43;
    [a1 setBooleanField:v43];
  }
  if (a3) {
    v45 = @"longField";
  }
  else {
    v45 = @"long_field";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = [GEORPFeedbackLongField alloc];
    if (a3) {
      uint64_t v48 = [(GEORPFeedbackLongField *)v47 initWithJSON:v46];
    }
    else {
      uint64_t v48 = [(GEORPFeedbackLongField *)v47 initWithDictionary:v46];
    }
    v49 = (void *)v48;
    [a1 setLongField:v48];
  }
  if (a3) {
    v50 = @"ulongField";
  }
  else {
    v50 = @"ulong_field";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = [GEORPFeedbackULongField alloc];
    if (a3) {
      uint64_t v53 = [(GEORPFeedbackULongField *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEORPFeedbackULongField *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [a1 setUlongField:v53];
  }
  if (a3) {
    v55 = @"intField";
  }
  else {
    v55 = @"int_field";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v57 = [GEORPFeedbackIntField alloc];
    if (a3) {
      uint64_t v58 = [(GEORPFeedbackIntField *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEORPFeedbackIntField *)v57 initWithDictionary:v56];
    }
    v59 = (void *)v58;
    [a1 setIntField:v58];
  }
  if (a3) {
    v60 = @"uintField";
  }
  else {
    v60 = @"uint_field";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v62 = [GEORPFeedbackUIntField alloc];
    if (a3) {
      uint64_t v63 = [(GEORPFeedbackUIntField *)v62 initWithJSON:v61];
    }
    else {
      uint64_t v63 = [(GEORPFeedbackUIntField *)v62 initWithDictionary:v61];
    }
    v64 = (void *)v63;
    [a1 setUintField:v63];
  }
  if (a3) {
    v65 = @"doubleField";
  }
  else {
    v65 = @"double_field";
  }
  v66 = [v5 objectForKeyedSubscript:v65];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v67 = [GEORPFeedbackDoubleField alloc];
    if (a3) {
      uint64_t v68 = [(GEORPFeedbackDoubleField *)v67 initWithJSON:v66];
    }
    else {
      uint64_t v68 = [(GEORPFeedbackDoubleField *)v67 initWithDictionary:v66];
    }
    v69 = (void *)v68;
    [a1 setDoubleField:v68];
  }
  if (a3) {
    v70 = @"floatField";
  }
  else {
    v70 = @"float_field";
  }
  v71 = [v5 objectForKeyedSubscript:v70];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v72 = [GEORPFeedbackFloatField alloc];
    if (a3) {
      uint64_t v73 = [(GEORPFeedbackFloatField *)v72 initWithJSON:v71];
    }
    else {
      uint64_t v73 = [(GEORPFeedbackFloatField *)v72 initWithDictionary:v71];
    }
    id v74 = (void *)v73;
    [a1 setFloatField:v73];
  }
  if (a3) {
    uint64_t v75 = @"hoursField";
  }
  else {
    uint64_t v75 = @"hours_field";
  }
  uint64_t v76 = [v5 objectForKeyedSubscript:v75];
  objc_opt_class();
  id v127 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v77 = v76;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v132 objects:v137 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v133;
      do
      {
        for (uint64_t i = 0; i != v79; ++i)
        {
          if (*(void *)v133 != v80) {
            objc_enumerationMutation(v77);
          }
          uint64_t v82 = *(void *)(*((void *)&v132 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v83 = [GEORPFeedbackBusinessHours alloc];
            if (a3) {
              uint64_t v84 = [(GEORPFeedbackBusinessHours *)v83 initWithJSON:v82];
            }
            else {
              uint64_t v84 = [(GEORPFeedbackBusinessHours *)v83 initWithDictionary:v82];
            }
            v85 = (void *)v84;
            [a1 addHoursField:v84];
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v132 objects:v137 count:16];
      }
      while (v79);
    }

    id v5 = v127;
  }

  if (a3) {
    id v86 = @"tileFeatureInfoField";
  }
  else {
    id v86 = @"tile_feature_info_field";
  }
  v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = [GEORPFeedbackTileFeatureInfo alloc];
    if (a3) {
      uint64_t v89 = [(GEORPFeedbackTileFeatureInfo *)v88 initWithJSON:v87];
    }
    else {
      uint64_t v89 = [(GEORPFeedbackTileFeatureInfo *)v88 initWithDictionary:v87];
    }
    v90 = (void *)v89;
    [a1 setTileFeatureInfoField:v89];
  }
  if (a3) {
    id v91 = @"amenitiesField";
  }
  else {
    id v91 = @"amenities_field";
  }
  v92 = [v5 objectForKeyedSubscript:v91];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v93 = [GEORPAmenityCorrections alloc];
    if (a3) {
      uint64_t v94 = [(GEORPAmenityCorrections *)v93 initWithJSON:v92];
    }
    else {
      uint64_t v94 = [(GEORPAmenityCorrections *)v93 initWithDictionary:v92];
    }
    v95 = (void *)v94;
    [a1 setAmenitiesField:v94];
  }
  if (a3) {
    id v96 = @"ulongListField";
  }
  else {
    id v96 = @"ulong_list_field";
  }
  v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v98 = [GEORPFeedbackULongListField alloc];
    if (a3) {
      uint64_t v99 = [(GEORPFeedbackULongListField *)v98 initWithJSON:v97];
    }
    else {
      uint64_t v99 = [(GEORPFeedbackULongListField *)v98 initWithDictionary:v97];
    }
    v100 = (void *)v99;
    [a1 setUlongListField:v99];
  }
  if (a3) {
    id v101 = @"routeStepField";
  }
  else {
    id v101 = @"route_step_field";
  }
  v102 = [v5 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v103 = [GEORPFeedbackRouteStep alloc];
    if (a3) {
      uint64_t v104 = [(GEORPFeedbackRouteStep *)v103 initWithJSON:v102];
    }
    else {
      uint64_t v104 = [(GEORPFeedbackRouteStep *)v103 initWithDictionary:v102];
    }
    v105 = (void *)v104;
    [a1 setRouteStepField:v104];
  }
  if (a3) {
    id v106 = @"transitLineField";
  }
  else {
    id v106 = @"transit_line_field";
  }
  v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v108 = [GEORPFeedbackTransitLine alloc];
    if (a3) {
      uint64_t v109 = [(GEORPFeedbackTransitLine *)v108 initWithJSON:v107];
    }
    else {
      uint64_t v109 = [(GEORPFeedbackTransitLine *)v108 initWithDictionary:v107];
    }
    uint64_t v110 = (void *)v109;
    [a1 setTransitLineField:v109];
  }
  if (a3) {
    uint64_t v111 = @"photoMetadata";
  }
  else {
    uint64_t v111 = @"photo_metadata";
  }
  v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v113 = v112;
    uint64_t v114 = [v113 countByEnumeratingWithState:&v128 objects:v136 count:16];
    if (v114)
    {
      uint64_t v115 = v114;
      uint64_t v116 = *(void *)v129;
      do
      {
        for (uint64_t j = 0; j != v115; ++j)
        {
          if (*(void *)v129 != v116) {
            objc_enumerationMutation(v113);
          }
          uint64_t v118 = *(void *)(*((void *)&v128 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v119 = [GEORPFeedbackPhotoMetadata alloc];
            if (a3) {
              uint64_t v120 = [(GEORPFeedbackPhotoMetadata *)v119 initWithJSON:v118];
            }
            else {
              uint64_t v120 = [(GEORPFeedbackPhotoMetadata *)v119 initWithDictionary:v118];
            }
            long long v121 = (void *)v120;
            [a1 addPhotoMetadata:v120];
          }
        }
        uint64_t v115 = [v113 countByEnumeratingWithState:&v128 objects:v136 count:16];
      }
      while (v115);
    }

    id v5 = v127;
  }

  long long v122 = [v5 objectForKeyedSubscript:@"annotations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v123 = [GEORPFeedbackFieldAnnotations alloc];
    if (a3) {
      uint64_t v124 = [(GEORPFeedbackFieldAnnotations *)v123 initWithJSON:v122];
    }
    else {
      uint64_t v124 = [(GEORPFeedbackFieldAnnotations *)v123 initWithDictionary:v122];
    }
    long long v125 = (void *)v124;
    [a1 setAnnotations:v124];
  }
  a1 = a1;

LABEL_238:
  return a1;
}

- (GEORPFeedbackFieldValue)initWithJSON:(id)a3
{
  return (GEORPFeedbackFieldValue *)-[GEORPFeedbackFieldValue _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_482;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_483;
    }
    GEORPFeedbackFieldValueReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackFieldValueCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFieldValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFieldValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackFieldValueIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackFieldValue *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_singleSelectField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_multiSelectField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_textField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_textListField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_dateTimeField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_locationField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_BOOLeanField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_longField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ulongField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_intField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_uintField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_doubleField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_floatField) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_hoursFields;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_tileFeatureInfoField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_amenitiesField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ulongListField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routeStepField) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitLineField) {
      PBDataWriterWriteSubmessage();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_photoMetadatas;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_annotations) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackFieldValue _readLocationField]((uint64_t)self);
  locationField = self->_locationField;

  return [(GEORPFeedbackCoordinateField *)locationField hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEORPFeedbackFieldValue *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 46) = self->_readerMarkPos;
  *((_DWORD *)v12 + 47) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 49) = self->_fieldValueType;
    *((_DWORD *)v12 + 50) |= 1u;
  }
  if (self->_singleSelectField) {
    objc_msgSend(v12, "setSingleSelectField:");
  }
  if (self->_multiSelectField) {
    objc_msgSend(v12, "setMultiSelectField:");
  }
  if (self->_textField) {
    objc_msgSend(v12, "setTextField:");
  }
  if (self->_textListField) {
    objc_msgSend(v12, "setTextListField:");
  }
  if (self->_dateTimeField) {
    objc_msgSend(v12, "setDateTimeField:");
  }
  if (self->_locationField) {
    objc_msgSend(v12, "setLocationField:");
  }
  if (self->_BOOLeanField) {
    objc_msgSend(v12, "setBooleanField:");
  }
  if (self->_longField) {
    objc_msgSend(v12, "setLongField:");
  }
  if (self->_ulongField) {
    objc_msgSend(v12, "setUlongField:");
  }
  if (self->_intField) {
    objc_msgSend(v12, "setIntField:");
  }
  if (self->_uintField) {
    objc_msgSend(v12, "setUintField:");
  }
  if (self->_doubleField) {
    objc_msgSend(v12, "setDoubleField:");
  }
  if (self->_floatField) {
    objc_msgSend(v12, "setFloatField:");
  }
  if ([(GEORPFeedbackFieldValue *)self hoursFieldsCount])
  {
    [v12 clearHoursFields];
    unint64_t v4 = [(GEORPFeedbackFieldValue *)self hoursFieldsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackFieldValue *)self hoursFieldAtIndex:i];
        [v12 addHoursField:v7];
      }
    }
  }
  if (self->_tileFeatureInfoField) {
    objc_msgSend(v12, "setTileFeatureInfoField:");
  }
  if (self->_amenitiesField) {
    objc_msgSend(v12, "setAmenitiesField:");
  }
  if (self->_ulongListField) {
    objc_msgSend(v12, "setUlongListField:");
  }
  if (self->_routeStepField) {
    objc_msgSend(v12, "setRouteStepField:");
  }
  if (self->_transitLineField) {
    objc_msgSend(v12, "setTransitLineField:");
  }
  if ([(GEORPFeedbackFieldValue *)self photoMetadatasCount])
  {
    [v12 clearPhotoMetadatas];
    unint64_t v8 = [(GEORPFeedbackFieldValue *)self photoMetadatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPFeedbackFieldValue *)self photoMetadataAtIndex:j];
        [v12 addPhotoMetadata:v11];
      }
    }
  }
  if (self->_annotations) {
    objc_msgSend(v12, "setAnnotations:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackFieldValueReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackFieldValue *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 196) = self->_fieldValueType;
    *(_DWORD *)(v5 + 200) |= 1u;
  }
  id v9 = [(GEORPFeedbackSingleSelectField *)self->_singleSelectField copyWithZone:a3];
  v10 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v9;

  id v11 = [(GEORPFeedbackMultiSelectField *)self->_multiSelectField copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v11;

  id v13 = [(GEORPFeedbackTextField *)self->_textField copyWithZone:a3];
  v14 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v13;

  id v15 = [(GEORPFeedbackTextListField *)self->_textListField copyWithZone:a3];
  long long v16 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v15;

  id v17 = [(GEORPFeedbackTimestamp *)self->_dateTimeField copyWithZone:a3];
  long long v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  id v19 = [(GEORPFeedbackCoordinateField *)self->_locationField copyWithZone:a3];
  long long v20 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v19;

  id v21 = [(GEORPFeedbackBooleanField *)self->_BOOLeanField copyWithZone:a3];
  long long v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  id v23 = [(GEORPFeedbackLongField *)self->_longField copyWithZone:a3];
  v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(GEORPFeedbackULongField *)self->_ulongField copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v25;

  id v27 = [(GEORPFeedbackIntField *)self->_intField copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v27;

  id v29 = [(GEORPFeedbackUIntField *)self->_uintField copyWithZone:a3];
  v30 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v29;

  id v31 = [(GEORPFeedbackDoubleField *)self->_doubleField copyWithZone:a3];
  id v32 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v31;

  id v33 = [(GEORPFeedbackFloatField *)self->_floatField copyWithZone:a3];
  v34 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v33;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v35 = self->_hoursFields;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addHoursField:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v36);
  }

  id v40 = [(GEORPFeedbackTileFeatureInfo *)self->_tileFeatureInfoField copyWithZone:a3];
  v41 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v40;

  id v42 = [(GEORPAmenityCorrections *)self->_amenitiesField copyWithZone:a3];
  uint64_t v43 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v42;

  id v44 = [(GEORPFeedbackULongListField *)self->_ulongListField copyWithZone:a3];
  v45 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v44;

  id v46 = [(GEORPFeedbackRouteStep *)self->_routeStepField copyWithZone:a3];
  id v47 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v46;

  id v48 = [(GEORPFeedbackTransitLine *)self->_transitLineField copyWithZone:a3];
  v49 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v48;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v50 = self->_photoMetadatas;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v58 != v52) {
          objc_enumerationMutation(v50);
        }
        v54 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * j), "copyWithZone:", a3, (void)v57);
        [(id)v5 addPhotoMetadata:v54];
      }
      uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v51);
  }

  id v55 = [(GEORPFeedbackFieldAnnotations *)self->_annotations copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v55;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  [(GEORPFeedbackFieldValue *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 50);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_fieldValueType != *((_DWORD *)v4 + 49)) {
      goto LABEL_49;
    }
  }
  else if (v5)
  {
LABEL_49:
    char v27 = 0;
    goto LABEL_50;
  }
  singleSelectField = self->_singleSelectField;
  if ((unint64_t)singleSelectField | *((void *)v4 + 15)
    && !-[GEORPFeedbackSingleSelectField isEqual:](singleSelectField, "isEqual:"))
  {
    goto LABEL_49;
  }
  multiSelectField = self->_multiSelectField;
  if ((unint64_t)multiSelectField | *((void *)v4 + 12))
  {
    if (!-[GEORPFeedbackMultiSelectField isEqual:](multiSelectField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  textField = self->_textField;
  if ((unint64_t)textField | *((void *)v4 + 16))
  {
    if (!-[GEORPFeedbackTextField isEqual:](textField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  textListField = self->_textListField;
  if ((unint64_t)textListField | *((void *)v4 + 17))
  {
    if (!-[GEORPFeedbackTextListField isEqual:](textListField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  dateTimeField = self->_dateTimeField;
  if ((unint64_t)dateTimeField | *((void *)v4 + 5))
  {
    if (!-[GEORPFeedbackTimestamp isEqual:](dateTimeField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  locationField = self->_locationField;
  if ((unint64_t)locationField | *((void *)v4 + 10))
  {
    if (!-[GEORPFeedbackCoordinateField isEqual:](locationField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  BOOLeanField = self->_BOOLeanField;
  if ((unint64_t)BOOLeanField | *((void *)v4 + 4))
  {
    if (!-[GEORPFeedbackBooleanField isEqual:](BOOLeanField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  longField = self->_longField;
  if ((unint64_t)longField | *((void *)v4 + 11))
  {
    if (!-[GEORPFeedbackLongField isEqual:](longField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  ulongField = self->_ulongField;
  if ((unint64_t)ulongField | *((void *)v4 + 21))
  {
    if (!-[GEORPFeedbackULongField isEqual:](ulongField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  intField = self->_intField;
  if ((unint64_t)intField | *((void *)v4 + 9))
  {
    if (!-[GEORPFeedbackIntField isEqual:](intField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  uintField = self->_uintField;
  if ((unint64_t)uintField | *((void *)v4 + 20))
  {
    if (!-[GEORPFeedbackUIntField isEqual:](uintField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  doubleField = self->_doubleField;
  if ((unint64_t)doubleField | *((void *)v4 + 6))
  {
    if (!-[GEORPFeedbackDoubleField isEqual:](doubleField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  floatField = self->_floatField;
  if ((unint64_t)floatField | *((void *)v4 + 7))
  {
    if (!-[GEORPFeedbackFloatField isEqual:](floatField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  hoursFields = self->_hoursFields;
  if ((unint64_t)hoursFields | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](hoursFields, "isEqual:")) {
      goto LABEL_49;
    }
  }
  tileFeatureInfoField = self->_tileFeatureInfoField;
  if ((unint64_t)tileFeatureInfoField | *((void *)v4 + 18))
  {
    if (!-[GEORPFeedbackTileFeatureInfo isEqual:](tileFeatureInfoField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  amenitiesField = self->_amenitiesField;
  if ((unint64_t)amenitiesField | *((void *)v4 + 2))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenitiesField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  ulongListField = self->_ulongListField;
  if ((unint64_t)ulongListField | *((void *)v4 + 22))
  {
    if (!-[GEORPFeedbackULongListField isEqual:](ulongListField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  routeStepField = self->_routeStepField;
  if ((unint64_t)routeStepField | *((void *)v4 + 14))
  {
    if (!-[GEORPFeedbackRouteStep isEqual:](routeStepField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  transitLineField = self->_transitLineField;
  if ((unint64_t)transitLineField | *((void *)v4 + 19))
  {
    if (!-[GEORPFeedbackTransitLine isEqual:](transitLineField, "isEqual:")) {
      goto LABEL_49;
    }
  }
  photoMetadatas = self->_photoMetadatas;
  if ((unint64_t)photoMetadatas | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](photoMetadatas, "isEqual:")) {
      goto LABEL_49;
    }
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((void *)v4 + 3)) {
    char v27 = -[GEORPFeedbackFieldAnnotations isEqual:](annotations, "isEqual:");
  }
  else {
    char v27 = 1;
  }
LABEL_50:

  return v27;
}

- (unint64_t)hash
{
  [(GEORPFeedbackFieldValue *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_fieldValueType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPFeedbackSingleSelectField *)self->_singleSelectField hash] ^ v3;
  unint64_t v5 = [(GEORPFeedbackMultiSelectField *)self->_multiSelectField hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPFeedbackTextField *)self->_textField hash];
  unint64_t v7 = [(GEORPFeedbackTextListField *)self->_textListField hash];
  unint64_t v8 = v7 ^ [(GEORPFeedbackTimestamp *)self->_dateTimeField hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEORPFeedbackCoordinateField *)self->_locationField hash];
  unint64_t v10 = [(GEORPFeedbackBooleanField *)self->_BOOLeanField hash];
  unint64_t v11 = v10 ^ [(GEORPFeedbackLongField *)self->_longField hash];
  unint64_t v12 = v11 ^ [(GEORPFeedbackULongField *)self->_ulongField hash];
  unint64_t v13 = v9 ^ v12 ^ [(GEORPFeedbackIntField *)self->_intField hash];
  unint64_t v14 = [(GEORPFeedbackUIntField *)self->_uintField hash];
  unint64_t v15 = v14 ^ [(GEORPFeedbackDoubleField *)self->_doubleField hash];
  unint64_t v16 = v15 ^ [(GEORPFeedbackFloatField *)self->_floatField hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_hoursFields hash];
  unint64_t v18 = v13 ^ v17 ^ [(GEORPFeedbackTileFeatureInfo *)self->_tileFeatureInfoField hash];
  unint64_t v19 = [(GEORPAmenityCorrections *)self->_amenitiesField hash];
  unint64_t v20 = v19 ^ [(GEORPFeedbackULongListField *)self->_ulongListField hash];
  unint64_t v21 = v20 ^ [(GEORPFeedbackRouteStep *)self->_routeStepField hash];
  unint64_t v22 = v21 ^ [(GEORPFeedbackTransitLine *)self->_transitLineField hash];
  uint64_t v23 = v22 ^ [(NSMutableArray *)self->_photoMetadatas hash];
  return v18 ^ v23 ^ [(GEORPFeedbackFieldAnnotations *)self->_annotations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 200))
  {
    self->_fieldValueType = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_flags |= 1u;
  }
  singleSelectField = self->_singleSelectField;
  uint64_t v6 = *((void *)v4 + 15);
  if (singleSelectField)
  {
    if (v6) {
      -[GEORPFeedbackSingleSelectField mergeFrom:](singleSelectField, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPFeedbackFieldValue setSingleSelectField:](self, "setSingleSelectField:");
  }
  multiSelectField = self->_multiSelectField;
  uint64_t v8 = *((void *)v4 + 12);
  if (multiSelectField)
  {
    if (v8) {
      -[GEORPFeedbackMultiSelectField mergeFrom:](multiSelectField, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPFeedbackFieldValue setMultiSelectField:](self, "setMultiSelectField:");
  }
  textField = self->_textField;
  uint64_t v10 = *((void *)v4 + 16);
  if (textField)
  {
    if (v10) {
      -[GEORPFeedbackTextField mergeFrom:](textField, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORPFeedbackFieldValue setTextField:](self, "setTextField:");
  }
  textListField = self->_textListField;
  uint64_t v12 = *((void *)v4 + 17);
  if (textListField)
  {
    if (v12) {
      -[GEORPFeedbackTextListField mergeFrom:](textListField, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEORPFeedbackFieldValue setTextListField:](self, "setTextListField:");
  }
  dateTimeField = self->_dateTimeField;
  uint64_t v14 = *((void *)v4 + 5);
  if (dateTimeField)
  {
    if (v14) {
      -[GEORPFeedbackTimestamp mergeFrom:](dateTimeField, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEORPFeedbackFieldValue setDateTimeField:](self, "setDateTimeField:");
  }
  locationField = self->_locationField;
  uint64_t v16 = *((void *)v4 + 10);
  if (locationField)
  {
    if (v16) {
      -[GEORPFeedbackCoordinateField mergeFrom:](locationField, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEORPFeedbackFieldValue setLocationField:](self, "setLocationField:");
  }
  BOOLeanField = self->_BOOLeanField;
  uint64_t v18 = *((void *)v4 + 4);
  if (BOOLeanField)
  {
    if (v18) {
      -[GEORPFeedbackBooleanField mergeFrom:](BOOLeanField, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEORPFeedbackFieldValue setBooleanField:](self, "setBooleanField:");
  }
  longField = self->_longField;
  uint64_t v20 = *((void *)v4 + 11);
  if (longField)
  {
    if (v20) {
      -[GEORPFeedbackLongField mergeFrom:](longField, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEORPFeedbackFieldValue setLongField:](self, "setLongField:");
  }
  ulongField = self->_ulongField;
  uint64_t v22 = *((void *)v4 + 21);
  if (ulongField)
  {
    if (v22) {
      -[GEORPFeedbackULongField mergeFrom:](ulongField, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEORPFeedbackFieldValue setUlongField:](self, "setUlongField:");
  }
  intField = self->_intField;
  uint64_t v24 = *((void *)v4 + 9);
  if (intField)
  {
    if (v24) {
      -[GEORPFeedbackIntField mergeFrom:](intField, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEORPFeedbackFieldValue setIntField:](self, "setIntField:");
  }
  uintField = self->_uintField;
  uint64_t v26 = *((void *)v4 + 20);
  if (uintField)
  {
    if (v26) {
      -[GEORPFeedbackUIntField mergeFrom:](uintField, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEORPFeedbackFieldValue setUintField:](self, "setUintField:");
  }
  doubleField = self->_doubleField;
  uint64_t v28 = *((void *)v4 + 6);
  if (doubleField)
  {
    if (v28) {
      -[GEORPFeedbackDoubleField mergeFrom:](doubleField, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEORPFeedbackFieldValue setDoubleField:](self, "setDoubleField:");
  }
  floatField = self->_floatField;
  uint64_t v30 = *((void *)v4 + 7);
  if (floatField)
  {
    if (v30) {
      -[GEORPFeedbackFloatField mergeFrom:](floatField, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEORPFeedbackFieldValue setFloatField:](self, "setFloatField:");
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v31 = *((id *)v4 + 8);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(v31);
        }
        [(GEORPFeedbackFieldValue *)self addHoursField:*(void *)(*((void *)&v57 + 1) + 8 * i)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v33);
  }

  tileFeatureInfoField = self->_tileFeatureInfoField;
  uint64_t v37 = *((void *)v4 + 18);
  if (tileFeatureInfoField)
  {
    if (v37) {
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](tileFeatureInfoField, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEORPFeedbackFieldValue setTileFeatureInfoField:](self, "setTileFeatureInfoField:");
  }
  amenitiesField = self->_amenitiesField;
  uint64_t v39 = *((void *)v4 + 2);
  if (amenitiesField)
  {
    if (v39) {
      -[GEORPAmenityCorrections mergeFrom:](amenitiesField, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[GEORPFeedbackFieldValue setAmenitiesField:](self, "setAmenitiesField:");
  }
  ulongListField = self->_ulongListField;
  uint64_t v41 = *((void *)v4 + 22);
  if (ulongListField)
  {
    if (v41) {
      -[GEORPFeedbackULongListField mergeFrom:](ulongListField, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEORPFeedbackFieldValue setUlongListField:](self, "setUlongListField:");
  }
  routeStepField = self->_routeStepField;
  uint64_t v43 = *((void *)v4 + 14);
  if (routeStepField)
  {
    if (v43) {
      -[GEORPFeedbackRouteStep mergeFrom:](routeStepField, "mergeFrom:");
    }
  }
  else if (v43)
  {
    [(GEORPFeedbackFieldValue *)self setRouteStepField:"setRouteStepField:"];
  }
  transitLineField = self->_transitLineField;
  uint64_t v45 = *((void *)v4 + 19);
  if (transitLineField)
  {
    if (v45) {
      -[GEORPFeedbackTransitLine mergeFrom:](transitLineField, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEORPFeedbackFieldValue setTransitLineField:](self, "setTransitLineField:");
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v46 = *((id *)v4 + 13);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v54 != v49) {
          objc_enumerationMutation(v46);
        }
        -[GEORPFeedbackFieldValue addPhotoMetadata:](self, "addPhotoMetadata:", *(void *)(*((void *)&v53 + 1) + 8 * j), (void)v53);
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v48);
  }

  annotations = self->_annotations;
  uint64_t v52 = *((void *)v4 + 3);
  if (annotations)
  {
    if (v52) {
      -[GEORPFeedbackFieldAnnotations mergeFrom:](annotations, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[GEORPFeedbackFieldValue setAnnotations:](self, "setAnnotations:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ulongListField, 0);
  objc_storeStrong((id *)&self->_ulongField, 0);
  objc_storeStrong((id *)&self->_uintField, 0);
  objc_storeStrong((id *)&self->_transitLineField, 0);
  objc_storeStrong((id *)&self->_tileFeatureInfoField, 0);
  objc_storeStrong((id *)&self->_textListField, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_singleSelectField, 0);
  objc_storeStrong((id *)&self->_routeStepField, 0);
  objc_storeStrong((id *)&self->_photoMetadatas, 0);
  objc_storeStrong((id *)&self->_multiSelectField, 0);
  objc_storeStrong((id *)&self->_longField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_intField, 0);
  objc_storeStrong((id *)&self->_hoursFields, 0);
  objc_storeStrong((id *)&self->_floatField, 0);
  objc_storeStrong((id *)&self->_doubleField, 0);
  objc_storeStrong((id *)&self->_dateTimeField, 0);
  objc_storeStrong((id *)&self->_BOOLeanField, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_amenitiesField, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end