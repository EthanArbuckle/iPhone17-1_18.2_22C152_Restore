@interface NMArgument
+ (Class)dataListValueType;
+ (Class)stringListValueType;
+ (Class)stringToObjectMapType;
+ (Class)tileRequestValueType;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDataValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasLocationValue;
- (BOOL)hasStringValue;
- (BOOL)hasTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NMLocation)locationValue;
- (NSData)dataValue;
- (NSMutableArray)dataListValues;
- (NSMutableArray)stringListValues;
- (NSMutableArray)stringToObjectMaps;
- (NSMutableArray)tileRequestValues;
- (NSString)stringValue;
- (double)doubleValue;
- (id)_nm_arrayValue;
- (id)_nm_compressedArgument:(int)a3;
- (id)_nm_dictionaryValue;
- (id)_nm_errorValue;
- (id)_nm_initWithArrayValue:(id)a3 tag:(int)a4;
- (id)_nm_initWithDictionaryValue:(id)a3 tag:(int)a4;
- (id)_nm_initWithErrorValue:(id)a3 tag:(int)a4;
- (id)_nm_initWithLocation:(id)a3 tag:(int)a4;
- (id)_nm_initWithSecureCodingValue:(id)a3 tag:(int)a4;
- (id)_nm_locationValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataListValueAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringListValueAtIndex:(unint64_t)a3;
- (id)stringToObjectMapAtIndex:(unint64_t)a3;
- (id)tagAsString:(int)a3;
- (id)tileRequestValueAtIndex:(unint64_t)a3;
- (int)StringAsTag:(id)a3;
- (int)tag;
- (unint64_t)dataListValuesCount;
- (unint64_t)hash;
- (unint64_t)intValue;
- (unint64_t)stringListValuesCount;
- (unint64_t)stringToObjectMapsCount;
- (unint64_t)tileRequestValuesCount;
- (unint64_t)unsignedIntListValueAtIndex:(unint64_t)a3;
- (unint64_t)unsignedIntListValues;
- (unint64_t)unsignedIntListValuesCount;
- (void)addDataListValue:(id)a3;
- (void)addStringListValue:(id)a3;
- (void)addStringToObjectMap:(id)a3;
- (void)addTileRequestValue:(id)a3;
- (void)addUnsignedIntListValue:(unint64_t)a3;
- (void)clearDataListValues;
- (void)clearStringListValues;
- (void)clearStringToObjectMaps;
- (void)clearTileRequestValues;
- (void)clearUnsignedIntListValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDataListValues:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setHasLocationValue:(BOOL)a3;
- (void)setHasTag:(BOOL)a3;
- (void)setIntValue:(unint64_t)a3;
- (void)setLocationValue:(NMLocation *)a3;
- (void)setStringListValues:(id)a3;
- (void)setStringToObjectMaps:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTag:(int)a3;
- (void)setTileRequestValues:(id)a3;
- (void)setUnsignedIntListValues:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NMArgument

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NMArgument;
  [(NMArgument *)&v3 dealloc];
}

- (int)tag
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_tag;
  }
  else {
    return 1;
  }
}

- (void)setTag:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tag = a3;
}

- (void)setHasTag:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTag
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)tagAsString:(int)a3
{
  if (a3 <= 399)
  {
    if (a3 <= 99)
    {
      v4 = @"DATA";
      switch(a3)
      {
        case 1:
          goto LABEL_154;
        case 2:
          v4 = @"USER_INFO";
          break;
        case 3:
          v4 = @"ERROR";
          break;
        case 4:
          v4 = @"BUNDLE_IDENTIFIER";
          break;
        case 5:
          v4 = @"FLAG";
          break;
        case 6:
          v4 = @"SHA256_HASH";
          break;
        case 7:
          v4 = @"OFFLINE_COHORT_ID";
          break;
        default:
LABEL_153:
          v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_154:
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 'd':
          v4 = @"TILE_KEY";
          break;
        case 'e':
          v4 = @"ETAG";
          break;
        case 'f':
          v4 = @"TILE_REQUESTS";
          break;
        case 'g':
          v4 = @"REQUEST_IDENTIFIER";
          break;
        case 'h':
          v4 = @"BASE_TILE_DATA";
          break;
        case 'i':
          v4 = @"BASE_TILE_ETAG";
          break;
        case 'j':
          v4 = @"LOCALIZATION_TILE_DATA";
          break;
        case 'k':
          v4 = @"LOCALIZATION_TILE_ETAG";
          break;
        default:
          switch(a3)
          {
            case 200:
              v4 = @"TILE_GROUP_IDENTIFIER";
              break;
            case 201:
              v4 = @"CURRENT_RESOURCES";
              break;
            case 202:
              v4 = @"BUNDLED_RESOURCES_IN_FRAMEWORK";
              break;
            case 203:
            case 204:
              goto LABEL_153;
            case 205:
              v4 = @"RESOURCE_NAME";
              break;
            case 206:
              v4 = @"RESOURCE_IS_REGIONAL";
              break;
            default:
              if (a3 != 302) {
                goto LABEL_153;
              }
              v4 = @"URL";
              break;
          }
          break;
      }
    }
  }
  else if (a3 > 499)
  {
    switch(a3)
    {
      case 500:
        v4 = @"MUIDs";
        break;
      case 501:
        v4 = @"TRAITS";
        break;
      case 502:
        v4 = @"IDENTIFIERS";
        break;
      case 503:
        v4 = @"REQUEST";
        break;
      case 504:
        v4 = @"REQUEST_TYPE";
        break;
      default:
        if (a3 == 600)
        {
          v4 = @"TRANSIENT_CL_AUTH_INFO";
        }
        else
        {
          if (a3 != 1000) {
            goto LABEL_153;
          }
          v4 = @"PING_REQUIRE_MAPS_RUNNING";
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 400:
        v4 = @"DIRECTIONS_TRANSPORT_TYPE";
        break;
      case 401:
        v4 = @"DIRECTIONS_ROUTE_DETAILS";
        break;
      case 402:
        v4 = @"DIRECTIONS_ROUTE_STATUS";
        break;
      case 403:
        v4 = @"DIRECTIONS_SAFETY_WARNING_TYPE";
        break;
      case 404:
        v4 = @"DIRECTIONS_SOURCE";
        break;
      case 405:
        v4 = @"DIRECTIONS_DESTINATION";
        break;
      case 406:
        v4 = @"DIRECTIONS_ROUTE_CONTEXT";
        break;
      case 407:
        v4 = @"DIRECTIONS_START_DATE";
        break;
      case 408:
        v4 = @"DIRECTIONS_END_DATE";
        break;
      case 409:
        v4 = @"DIRECTIONS_ROUTE_INDEX";
        break;
      case 410:
        v4 = @"DIRECTIONS_NUMBER_OF_ROUTES";
        break;
      case 411:
        v4 = @"DIRECTIONS_ROUTE_ID";
        break;
      case 412:
        v4 = @"DIRECTIONS_ROUTE_UPDATE";
        break;
      case 413:
        v4 = @"DIRECTIONS_AUTOMOBILE_OPTIONS";
        break;
      case 414:
        v4 = @"DIRECTIONS_TRANSIT_OPTIONS";
        break;
      case 415:
        v4 = @"DIRECTIONS_WALKING_OPTIONS";
        break;
      case 416:
        v4 = @"DIRECTIONS_CYCLING_OPTIONS";
        break;
      case 417:
        v4 = @"DIRECTIONS_WAYPOINTS";
        break;
      case 418:
        v4 = @"DIRECTIONS_DISPLAYED_STEP";
        break;
      case 419:
        v4 = @"DIRECTIONS_ROUTE_PERSISTENT_DATA";
        break;
      default:
        goto LABEL_153;
    }
  }
  return v4;
}

- (int)StringAsTag:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DATA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER_INFO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ERROR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BUNDLE_IDENTIFIER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FLAG"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SHA256_HASH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OFFLINE_COHORT_ID"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TILE_KEY"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"ETAG"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"TILE_REQUESTS"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"REQUEST_IDENTIFIER"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"BASE_TILE_DATA"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"BASE_TILE_ETAG"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"LOCALIZATION_TILE_DATA"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"LOCALIZATION_TILE_ETAG"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"TILE_GROUP_IDENTIFIER"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"CURRENT_RESOURCES"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"BUNDLED_RESOURCES_IN_FRAMEWORK"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"RESOURCE_NAME"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"RESOURCE_IS_REGIONAL"])
  {
    int v4 = 206;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_TRANSPORT_TYPE"])
  {
    int v4 = 400;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_DETAILS"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_STATUS"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SAFETY_WARNING_TYPE"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SOURCE"])
  {
    int v4 = 404;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_DESTINATION"])
  {
    int v4 = 405;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_CONTEXT"])
  {
    int v4 = 406;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_START_DATE"])
  {
    int v4 = 407;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_END_DATE"])
  {
    int v4 = 408;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_INDEX"])
  {
    int v4 = 409;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_NUMBER_OF_ROUTES"])
  {
    int v4 = 410;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_ID"])
  {
    int v4 = 411;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_UPDATE"])
  {
    int v4 = 412;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_AUTOMOBILE_OPTIONS"])
  {
    int v4 = 413;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_TRANSIT_OPTIONS"])
  {
    int v4 = 414;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_WALKING_OPTIONS"])
  {
    int v4 = 415;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_CYCLING_OPTIONS"])
  {
    int v4 = 416;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_WAYPOINTS"])
  {
    int v4 = 417;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_DISPLAYED_STEP"])
  {
    int v4 = 418;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_ROUTE_PERSISTENT_DATA"])
  {
    int v4 = 419;
  }
  else if ([v3 isEqualToString:@"MUIDs"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"TRAITS"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"IDENTIFIERS"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"REQUEST"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"TRANSIENT_CL_AUTH_INFO"])
  {
    int v4 = 600;
  }
  else if ([v3 isEqualToString:@"PING_REQUIRE_MAPS_RUNNING"])
  {
    int v4 = 1000;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setIntValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (void)clearStringToObjectMaps
{
}

- (void)addStringToObjectMap:(id)a3
{
  id v4 = a3;
  stringToObjectMaps = self->_stringToObjectMaps;
  id v8 = v4;
  if (!stringToObjectMaps)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stringToObjectMaps;
    self->_stringToObjectMaps = v6;

    id v4 = v8;
    stringToObjectMaps = self->_stringToObjectMaps;
  }
  [(NSMutableArray *)stringToObjectMaps addObject:v4];
}

- (unint64_t)stringToObjectMapsCount
{
  return (unint64_t)[(NSMutableArray *)self->_stringToObjectMaps count];
}

- (id)stringToObjectMapAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_stringToObjectMaps objectAtIndex:a3];
}

+ (Class)stringToObjectMapType
{
  return (Class)objc_opt_class();
}

- (void)clearStringListValues
{
}

- (void)addStringListValue:(id)a3
{
  id v4 = a3;
  stringListValues = self->_stringListValues;
  id v8 = v4;
  if (!stringListValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stringListValues;
    self->_stringListValues = v6;

    id v4 = v8;
    stringListValues = self->_stringListValues;
  }
  [(NSMutableArray *)stringListValues addObject:v4];
}

- (unint64_t)stringListValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_stringListValues count];
}

- (id)stringListValueAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_stringListValues objectAtIndex:a3];
}

+ (Class)stringListValueType
{
  return (Class)objc_opt_class();
}

- (void)setLocationValue:(NMLocation *)a3
{
  *(unsigned char *)&self->_has |= 1u;
  long long v3 = *(_OWORD *)&a3->_longitude;
  long long v5 = *(_OWORD *)&a3->_altitude;
  long long v4 = *(_OWORD *)&a3->_courseAccuracy;
  *(_OWORD *)&self->_locationValue._latitude = *(_OWORD *)&a3->_latitude;
  *(_OWORD *)&self->_locationValue._longitude = v3;
  *(_OWORD *)&self->_locationValue._altitude = v5;
  *(_OWORD *)&self->_locationValue._courseAccuracy = v4;
  long long v6 = *(_OWORD *)&a3->_confidence;
  long long v8 = *(_OWORD *)&a3->_rawLatitude;
  long long v7 = *(_OWORD *)&a3->_speed;
  *(_OWORD *)&self->_locationValue._timestamp = *(_OWORD *)&a3->_timestamp;
  *(_OWORD *)&self->_locationValue._confidence = v6;
  *(_OWORD *)&self->_locationValue._rawLatitude = v8;
  *(_OWORD *)&self->_locationValue._speed = v7;
}

- (void)setHasLocationValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocationValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)unsignedIntListValuesCount
{
  return self->_unsignedIntListValues.count;
}

- (unint64_t)unsignedIntListValues
{
  return self->_unsignedIntListValues.list;
}

- (void)clearUnsignedIntListValues
{
}

- (void)addUnsignedIntListValue:(unint64_t)a3
{
}

- (unint64_t)unsignedIntListValueAtIndex:(unint64_t)a3
{
  p_unsignedIntListValues = &self->_unsignedIntListValues;
  unint64_t count = self->_unsignedIntListValues.count;
  if (count <= a3)
  {
    long long v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    long long v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_unsignedIntListValues->list[a3];
}

- (void)setUnsignedIntListValues:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)clearDataListValues
{
}

- (void)addDataListValue:(id)a3
{
  id v4 = a3;
  dataListValues = self->_dataListValues;
  id v8 = v4;
  if (!dataListValues)
  {
    long long v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    long long v7 = self->_dataListValues;
    self->_dataListValues = v6;

    id v4 = v8;
    dataListValues = self->_dataListValues;
  }
  [(NSMutableArray *)dataListValues addObject:v4];
}

- (unint64_t)dataListValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_dataListValues count];
}

- (id)dataListValueAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_dataListValues objectAtIndex:a3];
}

+ (Class)dataListValueType
{
  return (Class)objc_opt_class();
}

- (void)clearTileRequestValues
{
}

- (void)addTileRequestValue:(id)a3
{
  id v4 = a3;
  tileRequestValues = self->_tileRequestValues;
  id v8 = v4;
  if (!tileRequestValues)
  {
    long long v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    long long v7 = self->_tileRequestValues;
    self->_tileRequestValues = v6;

    id v4 = v8;
    tileRequestValues = self->_tileRequestValues;
  }
  [(NSMutableArray *)tileRequestValues addObject:v4];
}

- (unint64_t)tileRequestValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_tileRequestValues count];
}

- (id)tileRequestValueAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tileRequestValues objectAtIndex:a3];
}

+ (Class)tileRequestValueType
{
  return (Class)objc_opt_class();
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMArgument;
  char v3 = [(NMArgument *)&v7 description];
  id v4 = [(NMArgument *)self dictionaryRepresentation];
  long long v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int tag = self->_tag;
    if (tag <= 399)
    {
      if (tag <= 99)
      {
        long long v5 = @"DATA";
        switch(tag)
        {
          case 1:
            break;
          case 2:
            long long v5 = @"USER_INFO";
            break;
          case 3:
            long long v5 = @"ERROR";
            break;
          case 4:
            long long v5 = @"BUNDLE_IDENTIFIER";
            break;
          case 5:
            long long v5 = @"FLAG";
            break;
          case 6:
            long long v5 = @"SHA256_HASH";
            break;
          case 7:
            long long v5 = @"OFFLINE_COHORT_ID";
            break;
          default:
LABEL_60:
            long long v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_tag];
            break;
        }
      }
      else
      {
        switch(tag)
        {
          case 'd':
            long long v5 = @"TILE_KEY";
            break;
          case 'e':
            long long v5 = @"ETAG";
            break;
          case 'f':
            long long v5 = @"TILE_REQUESTS";
            break;
          case 'g':
            long long v5 = @"REQUEST_IDENTIFIER";
            break;
          case 'h':
            long long v5 = @"BASE_TILE_DATA";
            break;
          case 'i':
            long long v5 = @"BASE_TILE_ETAG";
            break;
          case 'j':
            long long v5 = @"LOCALIZATION_TILE_DATA";
            break;
          case 'k':
            long long v5 = @"LOCALIZATION_TILE_ETAG";
            break;
          default:
            switch(tag)
            {
              case 200:
                long long v5 = @"TILE_GROUP_IDENTIFIER";
                break;
              case 201:
                long long v5 = @"CURRENT_RESOURCES";
                break;
              case 202:
                long long v5 = @"BUNDLED_RESOURCES_IN_FRAMEWORK";
                break;
              case 203:
              case 204:
                goto LABEL_60;
              case 205:
                long long v5 = @"RESOURCE_NAME";
                break;
              case 206:
                long long v5 = @"RESOURCE_IS_REGIONAL";
                break;
              default:
                if (tag != 302) {
                  goto LABEL_60;
                }
                long long v5 = @"URL";
                break;
            }
            break;
        }
      }
    }
    else if (tag > 499)
    {
      switch(tag)
      {
        case 500:
          long long v5 = @"MUIDs";
          break;
        case 501:
          long long v5 = @"TRAITS";
          break;
        case 502:
          long long v5 = @"IDENTIFIERS";
          break;
        case 503:
          long long v5 = @"REQUEST";
          break;
        case 504:
          long long v5 = @"REQUEST_TYPE";
          break;
        default:
          if (tag == 600)
          {
            long long v5 = @"TRANSIENT_CL_AUTH_INFO";
          }
          else
          {
            if (tag != 1000) {
              goto LABEL_60;
            }
            long long v5 = @"PING_REQUIRE_MAPS_RUNNING";
          }
          break;
      }
    }
    else
    {
      switch(tag)
      {
        case 400:
          long long v5 = @"DIRECTIONS_TRANSPORT_TYPE";
          break;
        case 401:
          long long v5 = @"DIRECTIONS_ROUTE_DETAILS";
          break;
        case 402:
          long long v5 = @"DIRECTIONS_ROUTE_STATUS";
          break;
        case 403:
          long long v5 = @"DIRECTIONS_SAFETY_WARNING_TYPE";
          break;
        case 404:
          long long v5 = @"DIRECTIONS_SOURCE";
          break;
        case 405:
          long long v5 = @"DIRECTIONS_DESTINATION";
          break;
        case 406:
          long long v5 = @"DIRECTIONS_ROUTE_CONTEXT";
          break;
        case 407:
          long long v5 = @"DIRECTIONS_START_DATE";
          break;
        case 408:
          long long v5 = @"DIRECTIONS_END_DATE";
          break;
        case 409:
          long long v5 = @"DIRECTIONS_ROUTE_INDEX";
          break;
        case 410:
          long long v5 = @"DIRECTIONS_NUMBER_OF_ROUTES";
          break;
        case 411:
          long long v5 = @"DIRECTIONS_ROUTE_ID";
          break;
        case 412:
          long long v5 = @"DIRECTIONS_ROUTE_UPDATE";
          break;
        case 413:
          long long v5 = @"DIRECTIONS_AUTOMOBILE_OPTIONS";
          break;
        case 414:
          long long v5 = @"DIRECTIONS_TRANSIT_OPTIONS";
          break;
        case 415:
          long long v5 = @"DIRECTIONS_WALKING_OPTIONS";
          break;
        case 416:
          long long v5 = @"DIRECTIONS_CYCLING_OPTIONS";
          break;
        case 417:
          long long v5 = @"DIRECTIONS_WAYPOINTS";
          break;
        case 418:
          long long v5 = @"DIRECTIONS_DISPLAYED_STEP";
          break;
        case 419:
          long long v5 = @"DIRECTIONS_ROUTE_PERSISTENT_DATA";
          break;
        default:
          goto LABEL_60;
      }
    }
    [v3 setObject:v5 forKey:@"tag"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:self->_intValue];
    [v3 setObject:v8 forKey:@"intValue"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_BOOLValue];
    [v3 setObject:v9 forKey:@"BOOLValue"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v3 setObject:dataValue forKey:@"dataValue"];
  }
  if ([(NSMutableArray *)self->_stringToObjectMaps count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_stringToObjectMaps, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v12 = self->_stringToObjectMaps;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"stringToObjectMap"];
  }
  stringListValues = self->_stringListValues;
  if (stringListValues) {
    [v3 setObject:stringListValues forKey:@"stringListValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v19 = NMLocationDictionaryRepresentation((uint64_t)&self->_locationValue);
    [v3 setObject:v19 forKey:@"locationValue"];
  }
  v20 = PBRepeatedUInt64NSArray();
  [v3 setObject:v20 forKey:@"unsignedIntListValue"];

  dataListValues = self->_dataListValues;
  if (dataListValues) {
    [v3 setObject:dataListValues forKey:@"dataListValue"];
  }
  if ([(NSMutableArray *)self->_tileRequestValues count])
  {
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_tileRequestValues, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v23 = self->_tileRequestValues;
    id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"tileRequestValue"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v29 = +[NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v29 forKey:@"doubleValue"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMArgumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dataValue) {
    PBDataWriterWriteDataField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v6 = self->_stringToObjectMaps;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v8);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = self->_stringListValues;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      id v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)&self->_has)
  {
    uint64_t v35 = 0;
    PBDataWriterPlaceMark();
    NMLocationWriteTo((uint64_t)&self->_locationValue, v4);
    PBDataWriterRecallMark();
  }
  if (self->_unsignedIntListValues.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v16;
    }
    while (v16 < self->_unsignedIntListValues.count);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = self->_dataListValues;
  v18 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v18)
  {
    v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteDataField();
      }
      v19 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = self->_tileRequestValues;
  v23 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v44 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      id v24 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v44 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[54] = self->_tag;
    *((unsigned char *)v4 + 236) |= 8u;
  }
  long long v31 = (char *)v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v31;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 21) = self->_intValue;
    *((unsigned char *)v4 + 236) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 232) = self->_BOOLValue;
    *((unsigned char *)v4 + 236) |= 0x10u;
  }
  if (self->_dataValue) {
    objc_msgSend(v31, "setDataValue:");
  }
  if ([(NMArgument *)self stringToObjectMapsCount])
  {
    [v31 clearStringToObjectMaps];
    unint64_t v6 = [(NMArgument *)self stringToObjectMapsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(NMArgument *)self stringToObjectMapAtIndex:i];
        [v31 addStringToObjectMap:v9];
      }
    }
  }
  if ([(NMArgument *)self stringListValuesCount])
  {
    [v31 clearStringListValues];
    unint64_t v10 = [(NMArgument *)self stringListValuesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v13 = [(NMArgument *)self stringListValueAtIndex:j];
        [v31 addStringListValue:v13];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v14 = *(_OWORD *)&self->_locationValue._longitude;
    long long v16 = *(_OWORD *)&self->_locationValue._altitude;
    long long v15 = *(_OWORD *)&self->_locationValue._courseAccuracy;
    *(_OWORD *)(v31 + 40) = *(_OWORD *)&self->_locationValue._latitude;
    *(_OWORD *)(v31 + 56) = v14;
    *(_OWORD *)(v31 + 8) = v16;
    *(_OWORD *)(v31 + 24) = v15;
    long long v17 = *(_OWORD *)&self->_locationValue._confidence;
    long long v19 = *(_OWORD *)&self->_locationValue._rawLatitude;
    long long v18 = *(_OWORD *)&self->_locationValue._speed;
    *(_OWORD *)(v31 + 104) = *(_OWORD *)&self->_locationValue._timestamp;
    *(_OWORD *)(v31 + 120) = v17;
    *(_OWORD *)(v31 + 72) = v19;
    *(_OWORD *)(v31 + 88) = v18;
    v31[236] |= 1u;
  }
  if ([(NMArgument *)self unsignedIntListValuesCount])
  {
    [v31 clearUnsignedIntListValues];
    unint64_t v20 = [(NMArgument *)self unsignedIntListValuesCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t k = 0; k != v21; ++k)
        objc_msgSend(v31, "addUnsignedIntListValue:", -[NMArgument unsignedIntListValueAtIndex:](self, "unsignedIntListValueAtIndex:", k));
    }
  }
  if ([(NMArgument *)self dataListValuesCount])
  {
    [v31 clearDataListValues];
    unint64_t v23 = [(NMArgument *)self dataListValuesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t m = 0; m != v24; ++m)
      {
        uint64_t v26 = [(NMArgument *)self dataListValueAtIndex:m];
        [v31 addDataListValue:v26];
      }
    }
  }
  if ([(NMArgument *)self tileRequestValuesCount])
  {
    [v31 clearTileRequestValues];
    unint64_t v27 = [(NMArgument *)self tileRequestValuesCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (uint64_t n = 0; n != v28; ++n)
      {
        long long v30 = [(NMArgument *)self tileRequestValueAtIndex:n];
        [v31 addTileRequestValue:v30];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v31 + 20) = *(void *)&self->_doubleValue;
    v31[236] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 54) = self->_tag;
    v5[236] |= 8u;
  }
  id v7 = [(NSString *)self->_stringValue copyWithZone:a3];
  id v8 = (void *)*((void *)v6 + 26);
  *((void *)v6 + 26) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v6 + 21) = self->_intValue;
    v6[236] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6[232] = self->_BOOLValue;
    v6[236] |= 0x10u;
  }
  id v10 = [(NSData *)self->_dataValue copyWithZone:a3];
  unint64_t v11 = (void *)*((void *)v6 + 23);
  *((void *)v6 + 23) = v10;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v12 = self->_stringToObjectMaps;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [v6 addStringToObjectMap:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v14);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v18 = self->_stringListValues;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addStringListValue:v23];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v20);
  }

  if (*(unsigned char *)&self->_has)
  {
    long long v24 = *(_OWORD *)&self->_locationValue._longitude;
    long long v26 = *(_OWORD *)&self->_locationValue._altitude;
    long long v25 = *(_OWORD *)&self->_locationValue._courseAccuracy;
    *(_OWORD *)(v6 + 40) = *(_OWORD *)&self->_locationValue._latitude;
    *(_OWORD *)(v6 + 56) = v24;
    *(_OWORD *)(v6 + 8) = v26;
    *(_OWORD *)(v6 + 24) = v25;
    long long v27 = *(_OWORD *)&self->_locationValue._confidence;
    long long v29 = *(_OWORD *)&self->_locationValue._rawLatitude;
    long long v28 = *(_OWORD *)&self->_locationValue._speed;
    *(_OWORD *)(v6 + 104) = *(_OWORD *)&self->_locationValue._timestamp;
    *(_OWORD *)(v6 + 120) = v27;
    *(_OWORD *)(v6 + 72) = v29;
    *(_OWORD *)(v6 + 88) = v28;
    v6[236] |= 1u;
  }
  PBRepeatedUInt64Copy();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v30 = self->_dataListValues;
  id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v32; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)k) copyWithZone:a3];
        [v6 addDataListValue:v35];
      }
      id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v32);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v36 = self->_tileRequestValues;
  id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v38; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)m), "copyWithZone:", a3, (void)v43);
        [v6 addTileRequestValue:v41];
      }
      id v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v38);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v6 + 20) = *(void *)&self->_doubleValue;
    v6[236] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  char has = (char)self->_has;
  char v6 = v4[236];
  if ((has & 8) != 0)
  {
    if ((v4[236] & 8) == 0 || self->_tag != *((_DWORD *)v4 + 54)) {
      goto LABEL_43;
    }
  }
  else if ((v4[236] & 8) != 0)
  {
    goto LABEL_43;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_43;
    }
    char has = (char)self->_has;
    char v6 = v4[236];
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_intValue != *((void *)v4 + 21)) {
      goto LABEL_43;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!v4[232]) {
          goto LABEL_43;
        }
        goto LABEL_23;
      }
      if (!v4[232]) {
        goto LABEL_23;
      }
    }
LABEL_43:
    BOOL v13 = 0;
    goto LABEL_44;
  }
  if ((v6 & 0x10) != 0) {
    goto LABEL_43;
  }
LABEL_23:
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 23) && !-[NSData isEqual:](dataValue, "isEqual:")) {
    goto LABEL_43;
  }
  stringToObjectMaps = self->_stringToObjectMaps;
  if ((unint64_t)stringToObjectMaps | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](stringToObjectMaps, "isEqual:")) {
      goto LABEL_43;
    }
  }
  stringListValues = self->_stringListValues;
  if ((unint64_t)stringListValues | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](stringListValues, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[236] & 1) == 0 || memcmp(&self->_locationValue, v4 + 8, 0x80uLL)) {
      goto LABEL_43;
    }
  }
  else if (v4[236])
  {
    goto LABEL_43;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_43;
  }
  dataListValues = self->_dataListValues;
  if ((unint64_t)dataListValues | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](dataListValues, "isEqual:")) {
      goto LABEL_43;
    }
  }
  tileRequestValues = self->_tileRequestValues;
  if ((unint64_t)tileRequestValues | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](tileRequestValues, "isEqual:")) {
      goto LABEL_43;
    }
  }
  BOOL v13 = (v4[236] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[236] & 2) == 0 || self->_doubleValue != *((double *)v4 + 20)) {
      goto LABEL_43;
    }
    BOOL v13 = 1;
  }
LABEL_44:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_tag;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v17 = 2654435761u * self->_intValue;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v3 = 2654435761 * self->_BOOLValue;
      goto LABEL_9;
    }
  }
  uint64_t v3 = 0;
LABEL_9:
  unint64_t v4 = (unint64_t)[(NSData *)self->_dataValue hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_stringToObjectMaps hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_stringListValues hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = PBRepeatedUInt64Hash();
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_dataListValues hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_tileRequestValues hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double doubleValue = self->_doubleValue;
    double v13 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v13 = self->_doubleValue;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v18 ^ v19 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  unint64_t v5 = v4;
  if ((v4[236] & 8) != 0)
  {
    self->_int tag = *((_DWORD *)v4 + 54);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 26)) {
    -[NMArgument setStringValue:](self, "setStringValue:");
  }
  char v6 = v5[236];
  if ((v6 & 4) != 0)
  {
    self->_intValue = *((void *)v5 + 21);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = v5[236];
  }
  if ((v6 & 0x10) != 0)
  {
    self->_BOOLValue = v5[232];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 23)) {
    -[NMArgument setDataValue:](self, "setDataValue:");
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = *((id *)v5 + 25);
  id v8 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NMArgument *)self addStringToObjectMap:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = *((id *)v5 + 24);
  id v13 = [v12 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NMArgument *)self addStringListValue:*(void *)(*((void *)&v44 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v14);
  }

  if (v5[236])
  {
    long long v17 = *(_OWORD *)(v5 + 56);
    long long v19 = *(_OWORD *)(v5 + 8);
    long long v18 = *(_OWORD *)(v5 + 24);
    *(_OWORD *)&self->_locationValue._latitude = *(_OWORD *)(v5 + 40);
    *(_OWORD *)&self->_locationValue._longitude = v17;
    *(_OWORD *)&self->_locationValue._altitude = v19;
    *(_OWORD *)&self->_locationValue._courseAccuracy = v18;
    long long v20 = *(_OWORD *)(v5 + 120);
    long long v22 = *(_OWORD *)(v5 + 72);
    long long v21 = *(_OWORD *)(v5 + 88);
    *(_OWORD *)&self->_locationValue._timestamp = *(_OWORD *)(v5 + 104);
    *(_OWORD *)&self->_locationValue._confidence = v20;
    *(_OWORD *)&self->_locationValue._rawLatitude = v22;
    *(_OWORD *)&self->_locationValue._speed = v21;
    *(unsigned char *)&self->_has |= 1u;
  }
  id v23 = (char *)[v5 unsignedIntListValuesCount];
  if (v23)
  {
    long long v24 = v23;
    for (uint64_t k = 0; k != v24; ++k)
      -[NMArgument addUnsignedIntListValue:](self, "addUnsignedIntListValue:", [v5 unsignedIntListValueAtIndex:k]);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = *((id *)v5 + 22);
  id v27 = [v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t m = 0; m != v28; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        [(NMArgument *)self addDataListValue:*(void *)(*((void *)&v40 + 1) + 8 * (void)m)];
      }
      id v28 = [v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v28);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = *((id *)v5 + 28);
  id v32 = [v31 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t n = 0; n != v33; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        -[NMArgument addTileRequestValue:](self, "addTileRequestValue:", *(void *)(*((void *)&v36 + 1) + 8 * (void)n), (void)v36);
      }
      id v33 = [v31 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v33);
  }

  if ((v5[236] & 2) != 0)
  {
    self->_double doubleValue = *((double *)v5 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (unint64_t)intValue
{
  return self->_intValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSMutableArray)stringToObjectMaps
{
  return self->_stringToObjectMaps;
}

- (void)setStringToObjectMaps:(id)a3
{
}

- (NSMutableArray)stringListValues
{
  return self->_stringListValues;
}

- (void)setStringListValues:(id)a3
{
}

- (NMLocation)locationValue
{
  long long v3 = *(_OWORD *)&self->_speedAccuracy;
  *(_OWORD *)&retstr->_rawLatitude = *(_OWORD *)&self->_rawLongitude;
  *(_OWORD *)&retstr->_speed = v3;
  long long v4 = *(_OWORD *)&self->_has;
  *(_OWORD *)&retstr->_timestamp = *(_OWORD *)&self->_verticalAccuracy;
  *(_OWORD *)&retstr->_confidence = v4;
  long long v5 = *(_OWORD *)&self->_horizontalAccuracy;
  *(_OWORD *)&retstr->_altitude = *(_OWORD *)&self->_course;
  *(_OWORD *)&retstr->_courseAccuracy = v5;
  long long v6 = *(_OWORD *)&self->_rawCourse;
  *(_OWORD *)&retstr->_latitude = *(_OWORD *)&self->_lifespan;
  *(_OWORD *)&retstr->_longitude = v6;
  return self;
}

- (NSMutableArray)dataListValues
{
  return self->_dataListValues;
}

- (void)setDataListValues:(id)a3
{
}

- (NSMutableArray)tileRequestValues
{
  return self->_tileRequestValues;
}

- (void)setTileRequestValues:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileRequestValues, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_stringToObjectMaps, 0);
  objc_storeStrong((id *)&self->_stringListValues, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);

  objc_storeStrong((id *)&self->_dataListValues, 0);
}

- (id)_nm_compressedArgument:(int)a3
{
  long long v4 = [(NMArgument *)self data];
  long long v5 = v4;
  if (a3 == 1)
  {
    id v7 = v4;
    [v7 bytes];
    [v7 length];
    GEOZlibCompress();
  }
  else if (a3 == 2)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    GEOBZ2Compress();
  }

  return 0;
}

- (id)_nm_initWithSecureCodingValue:(id)a3 tag:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NMArgument;
  id v7 = [(NMArgument *)&v14 init];
  id v8 = v7;
  if (v7)
  {
    [(NMArgument *)v7 setTag:v4];
    if (v6)
    {
      id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
      [v9 encodeObject:v6 forKey:@"d"];
      uint64_t v10 = [v9 encodedData];
      [(NMArgument *)v8 setDataValue:v10];
      unint64_t v11 = v8;
    }
    else
    {
      id v12 = v8;
    }
  }

  return v8;
}

- (id)_nm_initWithArrayValue:(id)a3 tag:(int)a4
{
  return [(NMArgument *)self _nm_initWithSecureCodingValue:a3 tag:*(void *)&a4];
}

- (id)_nm_initWithDictionaryValue:(id)a3 tag:(int)a4
{
  return [(NMArgument *)self _nm_initWithSecureCodingValue:a3 tag:*(void *)&a4];
}

- (id)_nm_initWithErrorValue:(id)a3 tag:(int)a4
{
  return [(NMArgument *)self _nm_initWithSecureCodingValue:a3 tag:*(void *)&a4];
}

- (id)_nm_initWithLocation:(id)a3 tag:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NMArgument;
  id v7 = [(NMArgument *)&v41 init];
  id v8 = v7;
  if (v7)
  {
    [(NMArgument *)v7 setTag:v4];
    long long v9 = 0uLL;
    memset(v40, 0, 156);
    if (v6)
    {
      [v6 clientLocation];
      uint64_t v10 = *(void *)((char *)v40 + 4);
      uint64_t v11 = *(void *)((char *)v40 + 12);
      uint64_t v12 = *(void *)((char *)&v40[1] + 4);
      uint64_t v13 = *(void *)((char *)&v40[1] + 12);
      uint64_t v14 = *(void *)((char *)&v40[2] + 4);
      long long v15 = *(_OWORD *)((char *)&v40[2] + 12);
      long long v9 = *(_OWORD *)((char *)&v40[3] + 12);
      uint64_t v16 = *(void *)((char *)&v40[4] + 12);
      int v17 = DWORD1(v40[5]);
      uint64_t v18 = *((void *)&v40[5] + 1);
      int v19 = v40[6];
      long long v20 = *(_OWORD *)((char *)&v40[6] + 4);
      uint64_t v21 = *(void *)((char *)&v40[7] + 4);
    }
    else
    {
      int v19 = 0;
      int v17 = 0;
      uint64_t v21 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = 0;
      uint64_t v14 = 0;
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      long long v20 = 0uLL;
      long long v15 = 0uLL;
    }
    __int16 v39 = 0;
    int v38 = 0;
    uint64_t v24 = v13;
    long long v25 = v9;
    uint64_t v26 = v12;
    uint64_t v27 = v10;
    uint64_t v28 = v18;
    uint64_t v29 = v11;
    uint64_t v30 = v21;
    long long v31 = v20;
    long long v32 = v15;
    uint64_t v33 = v16;
    uint64_t v34 = v14;
    int v35 = v17;
    int v36 = v19;
    __int16 v37 = -1;
    [(NMArgument *)v8 setLocationValue:&v24];
    long long v22 = v8;
  }

  return v8;
}

- (id)_nm_dictionaryValue
{
  long long v3 = [(NMArgument *)self dataValue];
  if (v3)
  {

LABEL_4:
    if (![(NMArgument *)self stringToObjectMapsCount])
    {
      id v16 = objc_alloc((Class)NSKeyedUnarchiver);
      int v17 = [(NMArgument *)self dataValue];
      id v5 = [v16 initForReadingFromData:v17 error:0];

      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      long long v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
      uint64_t v4 = [v5 decodeObjectOfClasses:v22 forKey:@"d"];

      [v5 finishDecoding];
      goto LABEL_27;
    }
    uint64_t v4 = +[NSMutableDictionary dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = [(NMArgument *)self stringToObjectMaps];
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v6) {
      goto LABEL_27;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (1)
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v9);
        if ([v10 hasStringValue])
        {
          uint64_t v11 = [v10 stringValue];
        }
        else if ([v10 hasDataValue])
        {
          uint64_t v11 = [v10 dataValue];
        }
        else if ([v10 hasBoolValue])
        {
          uint64_t v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
        }
        else
        {
          if (![v10 hasIntValue])
          {
            uint64_t v12 = 0;
            goto LABEL_21;
          }
          uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 intValue]);
        }
        uint64_t v12 = (void *)v11;
        if (v11)
        {
          uint64_t v13 = [v10 key];

          if (v13)
          {
            uint64_t v14 = [v10 key];
            [v4 setObject:v12 forKey:v14];
          }
        }
LABEL_21:

        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v15 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v7 = v15;
      if (!v15)
      {
LABEL_27:

        goto LABEL_28;
      }
    }
  }
  if ([(NMArgument *)self stringToObjectMapsCount]) {
    goto LABEL_4;
  }
  uint64_t v4 = 0;
LABEL_28:

  return v4;
}

- (id)_nm_arrayValue
{
  long long v3 = [(NMArgument *)self dataValue];
  if (v3)
  {
  }
  else if (![(NMArgument *)self stringListValuesCount])
  {
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  if ([(NMArgument *)self stringListValuesCount])
  {
    uint64_t v4 = [(NMArgument *)self stringListValues];
  }
  else
  {
    id v5 = objc_alloc((Class)NSKeyedUnarchiver);
    id v6 = [(NMArgument *)self dataValue];
    id v7 = [v5 initForReadingFromData:v6 error:0];

    uint64_t v4 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    [v7 finishDecoding];
  }
LABEL_8:

  return v4;
}

- (id)_nm_errorValue
{
  long long v3 = [(NMArgument *)self dataValue];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSKeyedUnarchiver);
    id v5 = [(NMArgument *)self dataValue];
    id v6 = [v4 initForReadingFromData:v5 error:0];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    long long v9 = [v6 decodeObjectOfClasses:v8 forKey:@"d"];

    [v6 finishDecoding];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)_nm_locationValue
{
  if ([(NMArgument *)self hasLocationValue])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    memset(v28, 0, sizeof(v28));
    [(NMArgument *)self locationValue];
    int32x2_t v3 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(WORD4(v34)), (int8x8_t)0x400000002));
    v4.i64[0] = v3.i32[0];
    v4.i64[1] = v3.i32[1];
    __asm { FMOV            V2.2D, #-1.0 }
    int v12 = 0;
    uint64_t v13 = v29;
    uint64_t v14 = v30;
    uint64_t v15 = v28[3];
    uint64_t v16 = v28[0];
    uint64_t v17 = *((void *)&v33 + 1);
    long long v18 = v32;
    int8x16_t v19 = vbslq_s8(v4, _Q2, *(int8x16_t *)&v28[1]);
    uint64_t v20 = v33;
    int v21 = v34;
    uint64_t v22 = *((void *)&v29 + 1);
    int v23 = DWORD1(v34);
    long long v24 = v31;
    uint64_t v25 = *((void *)&v30 + 1);
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [objc_alloc((Class)CLLocation) initWithClientLocation:&v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end