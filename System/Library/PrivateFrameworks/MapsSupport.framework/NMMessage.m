@interface NMMessage
+ (Class)argumentType;
+ (Class)compressedArgumentType;
- (BOOL)decompressArguments;
- (BOOL)hasEnqueuedTimeInterval;
- (BOOL)hasPriority;
- (BOOL)hasSenderUUID;
- (BOOL)hasSentTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)arguments;
- (NSMutableArray)compressedArguments;
- (NSString)senderUUID;
- (double)enqueuedTimeInterval;
- (double)sentTimestamp;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)argumentForTag:(int)a3;
- (id)compressedArgumentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)priorityAsString:(int)a3;
- (id)shortDebugDescription;
- (id)typeAsString:(int)a3;
- (int)StringAsPriority:(id)a3;
- (int)StringAsType:(id)a3;
- (int)priority;
- (int)type;
- (int64_t)IDSMessagePriority;
- (unint64_t)argumentsCount;
- (unint64_t)compressedArgumentsCount;
- (unint64_t)hash;
- (void)addArgument:(id)a3;
- (void)addArgument:(id)a3 withCompressionType:(int)a4;
- (void)addCompressedArgument:(id)a3;
- (void)clearArguments;
- (void)clearCompressedArguments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArguments:(id)a3;
- (void)setCompressedArguments:(id)a3;
- (void)setEnqueuedTimeInterval:(double)a3;
- (void)setHasEnqueuedTimeInterval:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSentTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPriority:(int)a3;
- (void)setSenderUUID:(id)a3;
- (void)setSentTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMMessage

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 <= 199)
  {
    switch(a3)
    {
      case '2':
        v4 = @"START_INITIAL_SYNC";
        break;
      case '3':
        v4 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        v4 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        v4 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        v4 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        v4 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        v4 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        v4 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        v4 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        v4 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        v4 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        v4 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_186;
      case '?':
        v4 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        v4 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        v4 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        v4 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        v4 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        if (a3 <= 0xC7)
        {
          v4 = @"FETCH_TILES";
          switch(a3)
          {
            case 1:
              goto LABEL_187;
            case 2:
              v4 = @"CANCEL_TILES";
              return v4;
            case 3:
              v4 = @"REPORT_CORRUPT_TILE";
              return v4;
            case 4:
              v4 = @"FETCHED_TILE";
              return v4;
            default:
              JUMPOUT(0);
          }
        }
        switch(a3)
        {
          case 'd':
            v4 = @"CHECKIN_WITH_TILE_GROUP";
            break;
          case 'e':
            v4 = @"FORCE_UPDATE_MANIFEST";
            break;
          case 'f':
            v4 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
            break;
          case 'g':
            v4 = @"FETCH_RESOURCE";
            break;
          default:
            goto LABEL_186;
        }
        break;
    }
  }
  else
  {
    if (a3 <= 400)
    {
      switch(a3)
      {
        case 300:
          v4 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          v4 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          v4 = @"START_NAV";
          break;
        case 303:
          v4 = @"STOP_NAV";
          break;
        case 304:
          v4 = @"PREVIEW_NAV";
          break;
        case 305:
          v4 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          v4 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          v4 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          v4 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          v4 = @"SELECTED_ROUTE";
          break;
        case 310:
          v4 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          v4 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          v4 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          v4 = @"PAUSE_NAV";
          break;
        case 314:
          v4 = @"RESUME_NAV";
          break;
        case 315:
          v4 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch(a3)
          {
            case 200:
              v4 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              v4 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              v4 = @"UPDATED_LOCATION";
              break;
            case 203:
              v4 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              v4 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              v4 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              v4 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_186;
          }
          break;
      }
      return v4;
    }
    if (a3 > 599)
    {
      if (a3 > 1499)
      {
        if (a3 == 1500)
        {
          v4 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          return v4;
        }
        if (a3 == 1501)
        {
          v4 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          return v4;
        }
      }
      else
      {
        if (a3 == 600)
        {
          v4 = @"FETCH_ROUTE_GENIUS";
          return v4;
        }
        if (a3 == 1000)
        {
          v4 = @"PING";
          return v4;
        }
      }
    }
    else if (a3 > 500)
    {
      if (a3 == 501)
      {
        v4 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        return v4;
      }
      if (a3 == 502)
      {
        v4 = @"SERVICE_REQUEST";
        return v4;
      }
    }
    else
    {
      if (a3 == 401)
      {
        v4 = @"OPEN_URL";
        return v4;
      }
      if (a3 == 500)
      {
        v4 = @"PLACE_DATA_MUID_LOOKUP";
        return v4;
      }
    }
LABEL_186:
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_187:
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FETCH_TILES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CANCEL_TILES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REPORT_CORRUPT_TILE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FETCHED_TILE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"START_INITIAL_SYNC"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"FETCH_CURRENT_COUNTRY_CODE"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"FETCH_EXPERIMENTS_CONFIG"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"DID_CHANGE_EXPERIMENTS_CONFIG"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"SYNC_UP_NEXT_ITEMS"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"REQUEST_UP_NEXT_ITEMS"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"SYNC_CONFIG_STORE"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"CHECKIN_WITH_CONFIG_STORE"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"REQUEST_ANALYTIC_IDENTIFIERS"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"CHECKIN_WITH_SUBSCRIPTION_INFO"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"SYNC_SUBSCRIPTION_INFO"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"UPDATE_SUBSCRIPTION_STATE"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"START_STOP_SUBSCRIPTION_DOWNLOAD"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"SET_SUBSCRIPTION_STATE_SUMMARY"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"SET_SUBSCRIPTION_SHOULD_SYNC"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"CHECKIN_WITH_TILE_GROUP"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"FORCE_UPDATE_MANIFEST"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"DID_CHANGE_ACTIVE_TILE_GROUP"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"FETCH_RESOURCE"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"START_LOCATION_UPDATE"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"STOP_LOCATION_UPDATE"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"UPDATED_LOCATION"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"FAILED_TO_UPDATE_LOCATION"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"DID_PAUSE_LOCATION_UPDATES"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"DID_RESUME_LOCATION_UPDATES"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"APPLY_LOCATION_AUTHORIZATION"])
  {
    int v4 = 206;
  }
  else if ([v3 isEqualToString:@"UPDATE_NAV_ROUTE_DETAILS"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"UPDATE_NAV_ROUTE_STATUS"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"START_NAV"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"STOP_NAV"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"PREVIEW_NAV"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"CLEAR_NAV_PREVIEW"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"SET_WANTS_ALL_NAV_STATUS_UPDATES"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"DISMISS_NAV_SAFETY_ALERT"])
  {
    int v4 = 307;
  }
  else if ([v3 isEqualToString:@"AVAILABLE_ROUTE"])
  {
    int v4 = 308;
  }
  else if ([v3 isEqualToString:@"SELECTED_ROUTE"])
  {
    int v4 = 309;
  }
  else if ([v3 isEqualToString:@"REQUEST_NAVIGATION_UPDATE"])
  {
    int v4 = 310;
  }
  else if ([v3 isEqualToString:@"UPDATE_NAV_ROUTE_UPDATE"])
  {
    int v4 = 311;
  }
  else if ([v3 isEqualToString:@"AVAILABLE_ROUTE_UPDATE"])
  {
    int v4 = 312;
  }
  else if ([v3 isEqualToString:@"PAUSE_NAV"])
  {
    int v4 = 313;
  }
  else if ([v3 isEqualToString:@"RESUME_NAV"])
  {
    int v4 = 314;
  }
  else if ([v3 isEqualToString:@"SET_DISPLAYED_STEP"])
  {
    int v4 = 315;
  }
  else if ([v3 isEqualToString:@"OPEN_URL"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"PLACE_DATA_MUID_LOOKUP"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"PLACE_DATA_IDENTIFIER_LOOKUP"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"SERVICE_REQUEST"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"FETCH_ROUTE_GENIUS"])
  {
    int v4 = 600;
  }
  else if ([v3 isEqualToString:@"PING"])
  {
    int v4 = 1000;
  }
  else if ([v3 isEqualToString:@"DEBUG_FETCH_CONFIGURATION_INFO"])
  {
    int v4 = 1500;
  }
  else if ([v3 isEqualToString:@"DEBUG_FETCH_DIAGNOSTICS_STRING"])
  {
    int v4 = 1501;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)clearArguments
{
}

- (void)addArgument:(id)a3
{
  id v4 = a3;
  arguments = self->_arguments;
  id v8 = v4;
  if (!arguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_arguments;
    self->_arguments = v6;

    id v4 = v8;
    arguments = self->_arguments;
  }
  [(NSMutableArray *)arguments addObject:v4];
}

- (unint64_t)argumentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_arguments count];
}

- (id)argumentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_arguments objectAtIndex:a3];
}

+ (Class)argumentType
{
  return (Class)objc_opt_class();
}

- (void)clearCompressedArguments
{
}

- (void)addCompressedArgument:(id)a3
{
  id v4 = a3;
  compressedArguments = self->_compressedArguments;
  id v8 = v4;
  if (!compressedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_compressedArguments;
    self->_compressedArguments = v6;

    id v4 = v8;
    compressedArguments = self->_compressedArguments;
  }
  [(NSMutableArray *)compressedArguments addObject:v4];
}

- (unint64_t)compressedArgumentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_compressedArguments count];
}

- (id)compressedArgumentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_compressedArguments objectAtIndex:a3];
}

+ (Class)compressedArgumentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSenderUUID
{
  return self->_senderUUID != 0;
}

- (int)priority
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_priority;
  }
  else {
    return 100;
  }
}

- (void)setPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)priorityAsString:(int)a3
{
  switch(a3)
  {
    case 100:
      id v4 = @"Sync";
      break;
    case 300:
      id v4 = @"Urgent";
      break;
    case 200:
      id v4 = @"Default";
      break;
    default:
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
      break;
  }
  return v4;
}

- (int)StringAsPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Sync"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"Urgent"])
  {
    int v4 = 300;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (void)setSentTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSentTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnqueuedTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enqueuedTimeInterval = a3;
}

- (void)setHasEnqueuedTimeInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnqueuedTimeInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMMessage;
  char v3 = [(NMMessage *)&v7 description];
  int v4 = [(NMMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int type = self->_type;
    if (type <= 199)
    {
      switch(type)
      {
        case '2':
          v5 = @"START_INITIAL_SYNC";
          break;
        case '3':
          v5 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          v5 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          v5 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          v5 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          v5 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          v5 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          v5 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          v5 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          v5 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          v5 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          v5 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_31;
        case '?':
          v5 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          v5 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          v5 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          v5 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          v5 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          if (type > 0xC7)
          {
            switch(type)
            {
              case 'd':
                v5 = @"CHECKIN_WITH_TILE_GROUP";
                break;
              case 'e':
                v5 = @"FORCE_UPDATE_MANIFEST";
                break;
              case 'f':
                v5 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
                break;
              case 'g':
                v5 = @"FETCH_RESOURCE";
                break;
              default:
                goto LABEL_31;
            }
          }
          else
          {
            v5 = @"FETCH_TILES";
            switch(type)
            {
              case 1:
                goto LABEL_78;
              case 2:
                v5 = @"CANCEL_TILES";
                break;
              case 3:
                v5 = @"REPORT_CORRUPT_TILE";
                break;
              case 4:
                v5 = @"FETCHED_TILE";
                break;
              default:
                JUMPOUT(0);
            }
          }
          return result;
      }
      goto LABEL_78;
    }
    if (type <= 400)
    {
      switch(type)
      {
        case 300:
          v5 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          v5 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          v5 = @"START_NAV";
          break;
        case 303:
          v5 = @"STOP_NAV";
          break;
        case 304:
          v5 = @"PREVIEW_NAV";
          break;
        case 305:
          v5 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          v5 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          v5 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          v5 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          v5 = @"SELECTED_ROUTE";
          break;
        case 310:
          v5 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          v5 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          v5 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          v5 = @"PAUSE_NAV";
          break;
        case 314:
          v5 = @"RESUME_NAV";
          break;
        case 315:
          v5 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch(type)
          {
            case 200:
              v5 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              v5 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              v5 = @"UPDATED_LOCATION";
              break;
            case 203:
              v5 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              v5 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              v5 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              v5 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_31;
          }
          break;
      }
      goto LABEL_78;
    }
    if (type > 599)
    {
      if (type > 1499)
      {
        if (type == 1500)
        {
          v5 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_78;
        }
        if (type == 1501)
        {
          v5 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_78;
        }
      }
      else
      {
        if (type == 600)
        {
          v5 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_78;
        }
        if (type == 1000)
        {
          v5 = @"PING";
          goto LABEL_78;
        }
      }
    }
    else if (type > 500)
    {
      if (type == 501)
      {
        v5 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_78;
      }
      if (type == 502)
      {
        v5 = @"SERVICE_REQUEST";
        goto LABEL_78;
      }
    }
    else
    {
      if (type == 401)
      {
        v5 = @"OPEN_URL";
        goto LABEL_78;
      }
      if (type == 500)
      {
        v5 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_78:
        [v3 setObject:v5 forKey:@"type"];

        goto LABEL_79;
      }
    }
LABEL_31:
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    goto LABEL_78;
  }
LABEL_79:
  if ([(NSMutableArray *)self->_arguments count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_arguments, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    objc_super v7 = self->_arguments;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"argument"];
  }
  if ([(NSMutableArray *)self->_compressedArguments count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_compressedArguments, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = self->_compressedArguments;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"compressedArgument"];
  }
  senderUUID = self->_senderUUID;
  if (senderUUID) {
    [v3 setObject:senderUUID forKey:@"senderUUID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int priority = self->_priority;
    switch(priority)
    {
      case 100:
        v23 = @"Sync";
        break;
      case 300:
        v23 = @"Urgent";
        break;
      case 200:
        v23 = @"Default";
        break;
      default:
        v23 = +[NSString stringWithFormat:@"(unknown: %i)", self->_priority];
        break;
    }
    [v3 setObject:v23 forKey:@"priority"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v24 = +[NSNumber numberWithDouble:self->_sentTimestamp];
    [v3 setObject:v24 forKey:@"sentTimestamp"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v25 = +[NSNumber numberWithDouble:self->_enqueuedTimeInterval];
    [v3 setObject:v25 forKey:@"enqueuedTimeInterval"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v9 = v8 + 1;
        if (v8 == -1 || v9 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v10 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v9;
        v7 |= (unint64_t)(v10 & 0x7F) << v5;
        if ((v10 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v11 = v6++ >= 9;
        if (v11)
        {
          unint64_t v7 = 0;
          int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v12 || (v7 & 7) == 4) {
        break;
      }
      unint64_t v14 = v7 >> 3;
      switch((v7 >> 3))
      {
        case 1u:
          char v15 = 0;
          unsigned int v16 = 0;
          uint64_t v17 = 0;
          *(unsigned char *)&self->_has |= 8u;
          while (1)
          {
            uint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v19 = v18 + 1;
            if (v18 == -1 || v19 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19;
            v17 |= (unint64_t)(v20 & 0x7F) << v15;
            if ((v20 & 0x80) == 0) {
              goto LABEL_50;
            }
            v15 += 7;
            BOOL v11 = v16++ >= 9;
            if (v11)
            {
              LODWORD(v17) = 0;
              goto LABEL_52;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_50:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v17) = 0;
          }
LABEL_52:
          uint64_t v33 = 56;
          goto LABEL_57;
        case 2u:
          v23 = objc_alloc_init(NMArgument);
          [(NMMessage *)self addArgument:v23];
          if (!PBReaderPlaceMark() || (NMArgumentReadFrom((uint64_t)v23, (uint64_t)a3) & 1) == 0) {
            goto LABEL_65;
          }
          goto LABEL_35;
        case 3u:
          v23 = objc_alloc_init(NMCompressedArgument);
          [(NMMessage *)self addCompressedArgument:v23];
          if (!PBReaderPlaceMark() || (NMCompressedArgumentReadFrom((uint64_t)v23, (uint64_t)a3) & 1) == 0)
          {
LABEL_65:

            LOBYTE(v32) = 0;
            return v32;
          }
LABEL_35:
          PBReaderRecallMark();

          goto LABEL_63;
        case 4u:
          PBReaderReadString();
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          senderUUID = self->_senderUUID;
          self->_senderUUID = v24;

          goto LABEL_63;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v17 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            uint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29;
              v17 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v11 = v27++ >= 9;
                if (v11)
                {
                  LODWORD(v17) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v17) = 0;
          }
LABEL_56:
          uint64_t v33 = 40;
LABEL_57:
          *(_DWORD *)&self->PBCodable_opaque[v33] = v17;
          goto LABEL_63;
        default:
          if (v14 == 1024)
          {
            *(unsigned char *)&self->_has |= 2u;
            unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              uint64_t v22 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 8;
            }
            else
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
              uint64_t v22 = 0;
            }
            uint64_t v34 = 16;
            goto LABEL_62;
          }
          if (v14 == 1025)
          {
            *(unsigned char *)&self->_has |= 1u;
            unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              uint64_t v22 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 8;
            }
            else
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
              uint64_t v22 = 0;
            }
            uint64_t v34 = 8;
LABEL_62:
            *(void *)&self->PBCodable_opaque[v34] = v22;
            goto LABEL_63;
          }
          int v32 = PBReaderSkipValueWithTag();
          if (!v32) {
            return v32;
          }
LABEL_63:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_64;
          break;
      }
    }
  }
LABEL_64:
  LOBYTE(v32) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v32;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v5 = self->_arguments;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v10 = self->_compressedArguments;
  BOOL v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      int v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (self->_senderUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_21;
    }
LABEL_25:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_21:
  if (has) {
LABEL_22:
  }
    PBDataWriterWriteDoubleField();
LABEL_23:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[14] = self->_type;
    *((unsigned char *)v4 + 60) |= 8u;
  }
  id v14 = v4;
  if ([(NMMessage *)self argumentsCount])
  {
    [v14 clearArguments];
    unint64_t v5 = [(NMMessage *)self argumentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NMMessage *)self argumentAtIndex:i];
        [v14 addArgument:v8];
      }
    }
  }
  if ([(NMMessage *)self compressedArgumentsCount])
  {
    [v14 clearCompressedArguments];
    unint64_t v9 = [(NMMessage *)self compressedArgumentsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        int v12 = [(NMMessage *)self compressedArgumentAtIndex:j];
        [v14 addCompressedArgument:v12];
      }
    }
  }
  if (self->_senderUUID) {
    objc_msgSend(v14, "setSenderUUID:");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v14 + 10) = self->_priority;
    *((unsigned char *)v14 + 60) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v14 + 2) = *(void *)&self->_sentTimestamp;
  *((unsigned char *)v14 + 60) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_16:
    *((void *)v14 + 1) = *(void *)&self->_enqueuedTimeInterval;
    *((unsigned char *)v14 + 60) |= 1u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v5[14] = self->_type;
    *((unsigned char *)v5 + 60) |= 8u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v7 = self->_arguments;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v6 addArgument:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = self->_compressedArguments;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v23);
        [v6 addCompressedArgument:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  id v19 = [(NSString *)self->_senderUUID copyWithZone:a3];
  long long v20 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v19;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
LABEL_23:
    *((void *)v6 + 2) = *(void *)&self->_sentTimestamp;
    *((unsigned char *)v6 + 60) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v6;
    }
    goto LABEL_20;
  }
  *((_DWORD *)v6 + 10) = self->_priority;
  *((unsigned char *)v6 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  if (has)
  {
LABEL_20:
    *((void *)v6 + 1) = *(void *)&self->_enqueuedTimeInterval;
    *((unsigned char *)v6 + 60) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  arguments = self->_arguments;
  if ((unint64_t)arguments | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](arguments, "isEqual:"))
  {
    goto LABEL_27;
  }
  compressedArguments = self->_compressedArguments;
  if ((unint64_t)compressedArguments | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](compressedArguments, "isEqual:")) {
      goto LABEL_27;
    }
  }
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_priority != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_sentTimestamp != *((double *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  BOOL v8 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_enqueuedTimeInterval != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_arguments hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_compressedArguments hash];
  NSUInteger v6 = [(NSString *)self->_senderUUID hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_priority;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double sentTimestamp = self->_sentTimestamp;
  double v10 = -sentTimestamp;
  if (sentTimestamp >= 0.0) {
    double v10 = self->_sentTimestamp;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_14:
  if (has)
  {
    double enqueuedTimeInterval = self->_enqueuedTimeInterval;
    double v16 = -enqueuedTimeInterval;
    if (enqueuedTimeInterval >= 0.0) {
      double v16 = self->_enqueuedTimeInterval;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 3);
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NMMessage *)self addArgument:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v5 + 4);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[NMMessage addCompressedArgument:](self, "addCompressedArgument:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if (*((void *)v5 + 6)) {
    -[NMMessage setSenderUUID:](self, "setSenderUUID:");
  }
  char v16 = *((unsigned char *)v5 + 60);
  if ((v16 & 4) == 0)
  {
    if ((*((unsigned char *)v5 + 60) & 2) == 0) {
      goto LABEL_21;
    }
LABEL_25:
    self->_double sentTimestamp = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v5 + 60) & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  self->_int priority = *((_DWORD *)v5 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v16 = *((unsigned char *)v5 + 60);
  if ((v16 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_21:
  if (v16)
  {
LABEL_22:
    self->_double enqueuedTimeInterval = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_23:
}

- (NSMutableArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSMutableArray)compressedArguments
{
  return self->_compressedArguments;
}

- (void)setCompressedArguments:(id)a3
{
}

- (NSString)senderUUID
{
  return self->_senderUUID;
}

- (void)setSenderUUID:(id)a3
{
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (double)enqueuedTimeInterval
{
  return self->_enqueuedTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_compressedArguments, 0);

  objc_storeStrong((id *)&self->_arguments, 0);
}

- (int64_t)IDSMessagePriority
{
  if (![(NMMessage *)self hasPriority]) {
    return 200;
  }
  unsigned int v3 = [(NMMessage *)self priority];
  int64_t v4 = 200;
  if (v3 == 300) {
    int64_t v4 = 300;
  }
  if (v3 == 100) {
    return 100;
  }
  else {
    return v4;
  }
}

- (id)argumentForTag:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v4 = [(NMMessage *)self arguments];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 tag] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)addArgument:(id)a3 withCompressionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    uint64_t v7 = objc_msgSend(v6, "_nm_compressedArgument:", v4);
    if (v7) {
      [(NMMessage *)self addCompressedArgument:v7];
    }
    else {
      [(NMMessage *)self addArgument:v8];
    }

    id v6 = v8;
  }
}

- (BOOL)decompressArguments
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v3 = [(NMMessage *)self compressedArguments];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v7), "_nm_uncompressedArgument");
        if (!v8)
        {

          return 0;
        }
        uint64_t v9 = (void *)v8;
        [(NMMessage *)self addArgument:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [(NMMessage *)self clearCompressedArguments];
  return 1;
}

- (id)shortDebugDescription
{
  unsigned int v3 = +[NMMessageLogger shortDebugDescriptionForMessage:self];
  id v4 = +[NSString stringWithFormat:@"<%p: %@>", self, v3];

  return v4;
}

@end