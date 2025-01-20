@interface NMMessageLogger
+ (id)descriptionForLocationUpdateRelativeMessage:(id)a3;
+ (id)descriptionForSetWantsAllNavStatusUpdatesMessage:(id)a3;
+ (id)descriptionForUpdateNavRouteDetailsMessage:(id)a3;
+ (id)descriptionForUpdateNavRouteStatusMessage:(id)a3;
+ (id)shortDebugDescriptionForMessage:(id)a3;
@end

@implementation NMMessageLogger

+ (id)descriptionForSetWantsAllNavStatusUpdatesMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 argumentForTag:5];
  if ([v4 BOOLValue])
  {
    v5 = [v3 argumentForTag:401];

    v6 = [v5 dataValue];
    id v7 = [v3 type];
    if ((int)v7 <= 199)
    {
      switch((int)v7)
      {
        case '2':
          v8 = @"START_INITIAL_SYNC";
          break;
        case '3':
          v8 = @"FETCH_CURRENT_COUNTRY_CODE";
          break;
        case '4':
          v8 = @"FETCH_EXPERIMENTS_CONFIG";
          break;
        case '5':
          v8 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
          break;
        case '6':
          v8 = @"SYNC_UP_NEXT_ITEMS";
          break;
        case '7':
          v8 = @"REQUEST_UP_NEXT_ITEMS";
          break;
        case '8':
          v8 = @"SYNC_CONFIG_STORE";
          break;
        case '9':
          v8 = @"CHECKIN_WITH_CONFIG_STORE";
          break;
        case ':':
          v8 = @"REQUEST_ANALYTIC_IDENTIFIERS";
          break;
        case ';':
          v8 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
          break;
        case '<':
          v8 = @"SYNC_SUBSCRIPTION_INFO";
          break;
        case '=':
          v8 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case '>':
          goto LABEL_151;
        case '?':
          v8 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        case '@':
          v8 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'A':
          v8 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'B':
          v8 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'C':
          v8 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
          break;
        default:
          if (v7 <= 0xC7)
          {
            v8 = @"FETCH_TILES";
            switch((int)v7)
            {
              case 1:
                goto LABEL_152;
              case 2:
                v8 = @"CANCEL_TILES";
                goto LABEL_152;
              case 3:
                v8 = @"REPORT_CORRUPT_TILE";
                goto LABEL_152;
              case 4:
                v8 = @"FETCHED_TILE";
                goto LABEL_152;
              default:
                goto LABEL_159;
            }
          }
          switch((int)v7)
          {
            case 'd':
              v8 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              v8 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              v8 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              v8 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_151;
          }
          break;
      }
      goto LABEL_152;
    }
    if ((int)v7 <= 400)
    {
      switch((int)v7)
      {
        case 300:
          v8 = @"UPDATE_NAV_ROUTE_DETAILS";
          break;
        case 301:
          v8 = @"UPDATE_NAV_ROUTE_STATUS";
          break;
        case 302:
          v8 = @"START_NAV";
          break;
        case 303:
          v8 = @"STOP_NAV";
          break;
        case 304:
          v8 = @"PREVIEW_NAV";
          break;
        case 305:
          v8 = @"CLEAR_NAV_PREVIEW";
          break;
        case 306:
          v8 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
          break;
        case 307:
          v8 = @"DISMISS_NAV_SAFETY_ALERT";
          break;
        case 308:
          v8 = @"AVAILABLE_ROUTE";
          break;
        case 309:
          v8 = @"SELECTED_ROUTE";
          break;
        case 310:
          v8 = @"REQUEST_NAVIGATION_UPDATE";
          break;
        case 311:
          v8 = @"UPDATE_NAV_ROUTE_UPDATE";
          break;
        case 312:
          v8 = @"AVAILABLE_ROUTE_UPDATE";
          break;
        case 313:
          v8 = @"PAUSE_NAV";
          break;
        case 314:
          v8 = @"RESUME_NAV";
          break;
        case 315:
          v8 = @"SET_DISPLAYED_STEP";
          break;
        default:
          switch((int)v7)
          {
            case 200:
              v8 = @"START_LOCATION_UPDATE";
              break;
            case 201:
              v8 = @"STOP_LOCATION_UPDATE";
              break;
            case 202:
              v8 = @"UPDATED_LOCATION";
              break;
            case 203:
              v8 = @"FAILED_TO_UPDATE_LOCATION";
              break;
            case 204:
              v8 = @"DID_PAUSE_LOCATION_UPDATES";
              break;
            case 205:
              v8 = @"DID_RESUME_LOCATION_UPDATES";
              break;
            case 206:
              v8 = @"APPLY_LOCATION_AUTHORIZATION";
              break;
            default:
              goto LABEL_151;
          }
          break;
      }
      goto LABEL_152;
    }
    if ((int)v7 > 599)
    {
      if ((int)v7 > 1499)
      {
        if (v7 == 1500)
        {
          v8 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_152;
        }
        if (v7 == 1501)
        {
          v8 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_152;
        }
      }
      else
      {
        if (v7 == 600)
        {
          v8 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_152;
        }
        if (v7 == 1000)
        {
          v8 = @"PING";
          goto LABEL_152;
        }
      }
    }
    else if ((int)v7 > 500)
    {
      if (v7 == 501)
      {
        v8 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_152;
      }
      if (v7 == 502)
      {
        v8 = @"SERVICE_REQUEST";
        goto LABEL_152;
      }
    }
    else
    {
      if (v7 == 401)
      {
        v8 = @"OPEN_URL";
        goto LABEL_152;
      }
      if (v7 == 500)
      {
        v8 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_152:
        v10 = +[NSString stringWithFormat:@"%@ YES routeID:%@", v8, v6];

        v4 = v5;
        goto LABEL_156;
      }
    }
LABEL_151:
    v8 = +[NSString stringWithFormat:@"(unknown: %i)", v7];
    goto LABEL_152;
  }
  id v9 = [v3 type];
  if ((int)v9 <= 199)
  {
    switch((int)v9)
    {
      case '2':
        v6 = @"START_INITIAL_SYNC";
        break;
      case '3':
        v6 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        v6 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        v6 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        v6 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        v6 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        v6 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        v6 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        v6 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        v6 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        v6 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        v6 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_154;
      case '?':
        v6 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        v6 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        v6 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        v6 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        v6 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        if (v9 > 0xC7)
        {
          switch((int)v9)
          {
            case 'd':
              v6 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              v6 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              v6 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              v6 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_154;
          }
        }
        else
        {
          v6 = @"FETCH_TILES";
          switch((int)v9)
          {
            case 1:
              goto LABEL_155;
            case 2:
              v6 = @"CANCEL_TILES";
              break;
            case 3:
              v6 = @"REPORT_CORRUPT_TILE";
              break;
            case 4:
              v6 = @"FETCHED_TILE";
              break;
            default:
LABEL_159:
              JUMPOUT(0);
          }
        }
        return result;
    }
    goto LABEL_155;
  }
  if ((int)v9 <= 400)
  {
    switch((int)v9)
    {
      case 300:
        v6 = @"UPDATE_NAV_ROUTE_DETAILS";
        break;
      case 301:
        v6 = @"UPDATE_NAV_ROUTE_STATUS";
        break;
      case 302:
        v6 = @"START_NAV";
        break;
      case 303:
        v6 = @"STOP_NAV";
        break;
      case 304:
        v6 = @"PREVIEW_NAV";
        break;
      case 305:
        v6 = @"CLEAR_NAV_PREVIEW";
        break;
      case 306:
        v6 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
        break;
      case 307:
        v6 = @"DISMISS_NAV_SAFETY_ALERT";
        break;
      case 308:
        v6 = @"AVAILABLE_ROUTE";
        break;
      case 309:
        v6 = @"SELECTED_ROUTE";
        break;
      case 310:
        v6 = @"REQUEST_NAVIGATION_UPDATE";
        break;
      case 311:
        v6 = @"UPDATE_NAV_ROUTE_UPDATE";
        break;
      case 312:
        v6 = @"AVAILABLE_ROUTE_UPDATE";
        break;
      case 313:
        v6 = @"PAUSE_NAV";
        break;
      case 314:
        v6 = @"RESUME_NAV";
        break;
      case 315:
        v6 = @"SET_DISPLAYED_STEP";
        break;
      default:
        switch((int)v9)
        {
          case 200:
            v6 = @"START_LOCATION_UPDATE";
            break;
          case 201:
            v6 = @"STOP_LOCATION_UPDATE";
            break;
          case 202:
            v6 = @"UPDATED_LOCATION";
            break;
          case 203:
            v6 = @"FAILED_TO_UPDATE_LOCATION";
            break;
          case 204:
            v6 = @"DID_PAUSE_LOCATION_UPDATES";
            break;
          case 205:
            v6 = @"DID_RESUME_LOCATION_UPDATES";
            break;
          case 206:
            v6 = @"APPLY_LOCATION_AUTHORIZATION";
            break;
          default:
            goto LABEL_154;
        }
        break;
    }
    goto LABEL_155;
  }
  if ((int)v9 > 599)
  {
    if ((int)v9 > 1499)
    {
      if (v9 == 1500)
      {
        v6 = @"DEBUG_FETCH_CONFIGURATION_INFO";
        goto LABEL_155;
      }
      if (v9 == 1501)
      {
        v6 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
        goto LABEL_155;
      }
    }
    else
    {
      if (v9 == 600)
      {
        v6 = @"FETCH_ROUTE_GENIUS";
        goto LABEL_155;
      }
      if (v9 == 1000)
      {
        v6 = @"PING";
        goto LABEL_155;
      }
    }
LABEL_154:
    v6 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
    goto LABEL_155;
  }
  if ((int)v9 > 500)
  {
    if (v9 == 501)
    {
      v6 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
      goto LABEL_155;
    }
    if (v9 == 502)
    {
      v6 = @"SERVICE_REQUEST";
      goto LABEL_155;
    }
    goto LABEL_154;
  }
  if (v9 == 401)
  {
    v6 = @"OPEN_URL";
    goto LABEL_155;
  }
  if (v9 != 500) {
    goto LABEL_154;
  }
  v6 = @"PLACE_DATA_MUID_LOOKUP";
LABEL_155:
  v10 = +[NSString stringWithFormat:@"%@ NO", v6];
LABEL_156:

  return v10;
}

+ (id)descriptionForUpdateNavRouteDetailsMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 argumentForTag:401];
  uint64_t v5 = [v4 dataValue];
  if (v5) {
    id v6 = [objc_alloc((Class)GEOCompanionRouteDetails) initWithData:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = [v3 argumentForTag:402];

  uint64_t v8 = [v7 dataValue];
  if (v8) {
    id v9 = [objc_alloc((Class)GEOCompanionRouteStatus) initWithData:v8];
  }
  else {
    id v9 = 0;
  }
  v10 = [v3 argumentForTag:406];

  v11 = [v10 dataValue];
  if (v11) {
    id v12 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v11];
  }
  else {
    id v12 = 0;
  }
  id v13 = [v3 type];
  v25 = v10;
  v26 = (void *)v5;
  v24 = (void *)v8;
  if ((int)v13 <= 199)
  {
    switch((int)v13)
    {
      case '2':
        v14 = v12;
        v15 = @"START_INITIAL_SYNC";
        break;
      case '3':
        v14 = v12;
        v15 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        v14 = v12;
        v15 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        v14 = v12;
        v15 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        v14 = v12;
        v15 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        v14 = v12;
        v15 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        v14 = v12;
        v15 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        v14 = v12;
        v15 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        v14 = v12;
        v15 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        v14 = v12;
        v15 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        v14 = v12;
        v15 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        v14 = v12;
        v15 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_85;
      case '?':
        v14 = v12;
        v15 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        v14 = v12;
        v15 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        v14 = v12;
        v15 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        v14 = v12;
        v15 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        v14 = v12;
        v15 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        if (v13 > 0xC7)
        {
          v14 = v12;
          switch((int)v13)
          {
            case 'd':
              v15 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              v15 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              v15 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              v15 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_85;
          }
        }
        else
        {
          v14 = v12;
          v15 = @"FETCH_TILES";
          switch((int)v13)
          {
            case 1:
              goto LABEL_86;
            case 2:
              v15 = @"CANCEL_TILES";
              break;
            case 3:
              v15 = @"REPORT_CORRUPT_TILE";
              break;
            case 4:
              v15 = @"FETCHED_TILE";
              break;
            default:
              JUMPOUT(0);
          }
        }
        return result;
    }
  }
  else if ((int)v13 > 400)
  {
    if ((int)v13 > 599)
    {
      if ((int)v13 > 1499)
      {
        if (v13 == 1500)
        {
          v14 = v12;
          v15 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_86;
        }
        if (v13 == 1501)
        {
          v14 = v12;
          v15 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_86;
        }
      }
      else
      {
        if (v13 == 600)
        {
          v14 = v12;
          v15 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_86;
        }
        if (v13 == 1000)
        {
          v14 = v12;
          v15 = @"PING";
          goto LABEL_86;
        }
      }
    }
    else if ((int)v13 > 500)
    {
      if (v13 == 501)
      {
        v14 = v12;
        v15 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_86;
      }
      if (v13 == 502)
      {
        v14 = v12;
        v15 = @"SERVICE_REQUEST";
        goto LABEL_86;
      }
    }
    else
    {
      if (v13 == 401)
      {
        v14 = v12;
        v15 = @"OPEN_URL";
        goto LABEL_86;
      }
      if (v13 == 500)
      {
        v14 = v12;
        v15 = @"PLACE_DATA_MUID_LOOKUP";
        goto LABEL_86;
      }
    }
LABEL_85:
    v14 = v12;
    v15 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
  }
  else
  {
    switch((int)v13)
    {
      case 300:
        v14 = v12;
        v15 = @"UPDATE_NAV_ROUTE_DETAILS";
        break;
      case 301:
        v14 = v12;
        v15 = @"UPDATE_NAV_ROUTE_STATUS";
        break;
      case 302:
        v14 = v12;
        v15 = @"START_NAV";
        break;
      case 303:
        v14 = v12;
        v15 = @"STOP_NAV";
        break;
      case 304:
        v14 = v12;
        v15 = @"PREVIEW_NAV";
        break;
      case 305:
        v14 = v12;
        v15 = @"CLEAR_NAV_PREVIEW";
        break;
      case 306:
        v14 = v12;
        v15 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
        break;
      case 307:
        v14 = v12;
        v15 = @"DISMISS_NAV_SAFETY_ALERT";
        break;
      case 308:
        v14 = v12;
        v15 = @"AVAILABLE_ROUTE";
        break;
      case 309:
        v14 = v12;
        v15 = @"SELECTED_ROUTE";
        break;
      case 310:
        v14 = v12;
        v15 = @"REQUEST_NAVIGATION_UPDATE";
        break;
      case 311:
        v14 = v12;
        v15 = @"UPDATE_NAV_ROUTE_UPDATE";
        break;
      case 312:
        v14 = v12;
        v15 = @"AVAILABLE_ROUTE_UPDATE";
        break;
      case 313:
        v14 = v12;
        v15 = @"PAUSE_NAV";
        break;
      case 314:
        v14 = v12;
        v15 = @"RESUME_NAV";
        break;
      case 315:
        v14 = v12;
        v15 = @"SET_DISPLAYED_STEP";
        break;
      default:
        switch((int)v13)
        {
          case 200:
            v14 = v12;
            v15 = @"START_LOCATION_UPDATE";
            break;
          case 201:
            v14 = v12;
            v15 = @"STOP_LOCATION_UPDATE";
            break;
          case 202:
            v14 = v12;
            v15 = @"UPDATED_LOCATION";
            break;
          case 203:
            v14 = v12;
            v15 = @"FAILED_TO_UPDATE_LOCATION";
            break;
          case 204:
            v14 = v12;
            v15 = @"DID_PAUSE_LOCATION_UPDATES";
            break;
          case 205:
            v14 = v12;
            v15 = @"DID_RESUME_LOCATION_UPDATES";
            break;
          case 206:
            v14 = v12;
            v15 = @"APPLY_LOCATION_AUTHORIZATION";
            break;
          default:
            goto LABEL_85;
        }
        break;
    }
  }
LABEL_86:
  v16 = [v6 routeID];
  id v17 = [v9 stepID];
  id v18 = [v9 feedbackType];
  v19 = v6;
  if (v18 >= 0xB)
  {
    v20 = +[NSString stringWithFormat:@"(unknown: %i)", v18];
  }
  else
  {
    v20 = off_100082638[(int)v18];
  }
  v21 = [v14 simpleDescription];
  v22 = +[NSString stringWithFormat:@"%@ routeID:%@ stepID:%i feedbackType:%@ routeContext:%@", v15, v16, v17, v20, v21];

  return v22;
}

+ (id)descriptionForUpdateNavRouteStatusMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 argumentForTag:402];
  uint64_t v5 = [v4 dataValue];
  if (v5) {
    id v6 = [objc_alloc((Class)GEOCompanionRouteStatus) initWithData:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = [v3 argumentForTag:406];

  uint64_t v8 = [v7 dataValue];
  if (v8) {
    id v9 = [objc_alloc((Class)GEOCompanionRouteContext) initWithData:v8];
  }
  else {
    id v9 = 0;
  }
  id v10 = [v3 type];
  id v18 = v7;
  if ((int)v10 <= 199)
  {
    switch((int)v10)
    {
      case '2':
        v11 = @"START_INITIAL_SYNC";
        break;
      case '3':
        v11 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        v11 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        v11 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        v11 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        v11 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        v11 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        v11 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        v11 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        v11 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        v11 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        v11 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_82;
      case '?':
        v11 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        v11 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        v11 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        v11 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        v11 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        if (v10 > 0xC7)
        {
          switch((int)v10)
          {
            case 'd':
              v11 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              v11 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              v11 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              v11 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_82;
          }
        }
        else
        {
          v11 = @"FETCH_TILES";
          switch((int)v10)
          {
            case 1:
              goto LABEL_83;
            case 2:
              v11 = @"CANCEL_TILES";
              break;
            case 3:
              v11 = @"REPORT_CORRUPT_TILE";
              break;
            case 4:
              v11 = @"FETCHED_TILE";
              break;
            default:
              JUMPOUT(0);
          }
        }
        return result;
    }
  }
  else if ((int)v10 > 400)
  {
    if ((int)v10 > 599)
    {
      if ((int)v10 > 1499)
      {
        if (v10 == 1500)
        {
          v11 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_83;
        }
        if (v10 == 1501)
        {
          v11 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_83;
        }
      }
      else
      {
        if (v10 == 600)
        {
          v11 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_83;
        }
        if (v10 == 1000)
        {
          v11 = @"PING";
          goto LABEL_83;
        }
      }
    }
    else if ((int)v10 > 500)
    {
      if (v10 == 501)
      {
        v11 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_83;
      }
      if (v10 == 502)
      {
        v11 = @"SERVICE_REQUEST";
        goto LABEL_83;
      }
    }
    else
    {
      if (v10 == 401)
      {
        v11 = @"OPEN_URL";
        goto LABEL_83;
      }
      if (v10 == 500)
      {
        v11 = @"PLACE_DATA_MUID_LOOKUP";
        goto LABEL_83;
      }
    }
LABEL_82:
    v11 = +[NSString stringWithFormat:@"(unknown: %i)", v10];
  }
  else
  {
    switch((int)v10)
    {
      case 300:
        v11 = @"UPDATE_NAV_ROUTE_DETAILS";
        break;
      case 301:
        v11 = @"UPDATE_NAV_ROUTE_STATUS";
        break;
      case 302:
        v11 = @"START_NAV";
        break;
      case 303:
        v11 = @"STOP_NAV";
        break;
      case 304:
        v11 = @"PREVIEW_NAV";
        break;
      case 305:
        v11 = @"CLEAR_NAV_PREVIEW";
        break;
      case 306:
        v11 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
        break;
      case 307:
        v11 = @"DISMISS_NAV_SAFETY_ALERT";
        break;
      case 308:
        v11 = @"AVAILABLE_ROUTE";
        break;
      case 309:
        v11 = @"SELECTED_ROUTE";
        break;
      case 310:
        v11 = @"REQUEST_NAVIGATION_UPDATE";
        break;
      case 311:
        v11 = @"UPDATE_NAV_ROUTE_UPDATE";
        break;
      case 312:
        v11 = @"AVAILABLE_ROUTE_UPDATE";
        break;
      case 313:
        v11 = @"PAUSE_NAV";
        break;
      case 314:
        v11 = @"RESUME_NAV";
        break;
      case 315:
        v11 = @"SET_DISPLAYED_STEP";
        break;
      default:
        switch((int)v10)
        {
          case 200:
            v11 = @"START_LOCATION_UPDATE";
            break;
          case 201:
            v11 = @"STOP_LOCATION_UPDATE";
            break;
          case 202:
            v11 = @"UPDATED_LOCATION";
            break;
          case 203:
            v11 = @"FAILED_TO_UPDATE_LOCATION";
            break;
          case 204:
            v11 = @"DID_PAUSE_LOCATION_UPDATES";
            break;
          case 205:
            v11 = @"DID_RESUME_LOCATION_UPDATES";
            break;
          case 206:
            v11 = @"APPLY_LOCATION_AUTHORIZATION";
            break;
          default:
            goto LABEL_82;
        }
        break;
    }
  }
LABEL_83:
  id v12 = [v6 stepID];
  id v13 = [v6 feedbackType];
  if (v13 >= 0xB)
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
  }
  else
  {
    v14 = off_100082638[(int)v13];
  }
  v15 = [v9 simpleDescription];
  v16 = +[NSString stringWithFormat:@"%@ stepID:%i feedbackType:%@ routeContext:%@", v11, v12, v14, v15];

  return v16;
}

+ (id)descriptionForLocationUpdateRelativeMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 argumentForTag:4];
  id v5 = [v3 type];

  if ((int)v5 <= 199)
  {
    switch((int)v5)
    {
      case '2':
        id v6 = @"START_INITIAL_SYNC";
        break;
      case '3':
        id v6 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        id v6 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        id v6 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        id v6 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        id v6 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        id v6 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        id v6 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        id v6 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        id v6 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        id v6 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        id v6 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_76;
      case '?':
        id v6 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        id v6 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        id v6 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        id v6 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        id v6 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        int v7 = v5 - 1;
        if (v5 > 0xC7)
        {
          switch((int)v5)
          {
            case 'd':
              id v6 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              id v6 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              id v6 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              id v6 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_76;
          }
        }
        else
        {
          id v6 = @"FETCH_TILES";
          switch(v7)
          {
            case 0:
              goto LABEL_77;
            case 1:
              id v6 = @"CANCEL_TILES";
              break;
            case 2:
              id v6 = @"REPORT_CORRUPT_TILE";
              break;
            case 3:
              id v6 = @"FETCHED_TILE";
              break;
            default:
              JUMPOUT(0);
          }
        }
        return result;
    }
  }
  else if ((int)v5 > 400)
  {
    if ((int)v5 > 599)
    {
      if ((int)v5 > 1499)
      {
        if (v5 == 1500)
        {
          id v6 = @"DEBUG_FETCH_CONFIGURATION_INFO";
          goto LABEL_77;
        }
        if (v5 == 1501)
        {
          id v6 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
          goto LABEL_77;
        }
      }
      else
      {
        if (v5 == 600)
        {
          id v6 = @"FETCH_ROUTE_GENIUS";
          goto LABEL_77;
        }
        if (v5 == 1000)
        {
          id v6 = @"PING";
          goto LABEL_77;
        }
      }
    }
    else if ((int)v5 > 500)
    {
      if (v5 == 501)
      {
        id v6 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
        goto LABEL_77;
      }
      if (v5 == 502)
      {
        id v6 = @"SERVICE_REQUEST";
        goto LABEL_77;
      }
    }
    else
    {
      if (v5 == 401)
      {
        id v6 = @"OPEN_URL";
        goto LABEL_77;
      }
      if (v5 == 500)
      {
        id v6 = @"PLACE_DATA_MUID_LOOKUP";
        goto LABEL_77;
      }
    }
LABEL_76:
    id v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
  }
  else
  {
    switch((int)v5)
    {
      case 300:
        id v6 = @"UPDATE_NAV_ROUTE_DETAILS";
        break;
      case 301:
        id v6 = @"UPDATE_NAV_ROUTE_STATUS";
        break;
      case 302:
        id v6 = @"START_NAV";
        break;
      case 303:
        id v6 = @"STOP_NAV";
        break;
      case 304:
        id v6 = @"PREVIEW_NAV";
        break;
      case 305:
        id v6 = @"CLEAR_NAV_PREVIEW";
        break;
      case 306:
        id v6 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
        break;
      case 307:
        id v6 = @"DISMISS_NAV_SAFETY_ALERT";
        break;
      case 308:
        id v6 = @"AVAILABLE_ROUTE";
        break;
      case 309:
        id v6 = @"SELECTED_ROUTE";
        break;
      case 310:
        id v6 = @"REQUEST_NAVIGATION_UPDATE";
        break;
      case 311:
        id v6 = @"UPDATE_NAV_ROUTE_UPDATE";
        break;
      case 312:
        id v6 = @"AVAILABLE_ROUTE_UPDATE";
        break;
      case 313:
        id v6 = @"PAUSE_NAV";
        break;
      case 314:
        id v6 = @"RESUME_NAV";
        break;
      case 315:
        id v6 = @"SET_DISPLAYED_STEP";
        break;
      default:
        switch((int)v5)
        {
          case 200:
            id v6 = @"START_LOCATION_UPDATE";
            break;
          case 201:
            id v6 = @"STOP_LOCATION_UPDATE";
            break;
          case 202:
            id v6 = @"UPDATED_LOCATION";
            break;
          case 203:
            id v6 = @"FAILED_TO_UPDATE_LOCATION";
            break;
          case 204:
            id v6 = @"DID_PAUSE_LOCATION_UPDATES";
            break;
          case 205:
            id v6 = @"DID_RESUME_LOCATION_UPDATES";
            break;
          case 206:
            id v6 = @"APPLY_LOCATION_AUTHORIZATION";
            break;
          default:
            goto LABEL_76;
        }
        break;
    }
  }
LABEL_77:
  uint64_t v8 = [v4 stringValue];
  id v9 = +[NSString stringWithFormat:@"%@ bundleID:%@", v6, v8];

  return v9;
}

+ (id)shortDebugDescriptionForMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 type];
  if (v5 > 299)
  {
    switch(v5)
    {
      case 300:
        uint64_t v6 = [a1 descriptionForUpdateNavRouteDetailsMessage:v4];
        goto LABEL_4;
      case 301:
        uint64_t v6 = [a1 descriptionForUpdateNavRouteStatusMessage:v4];
        goto LABEL_4;
      case 306:
        uint64_t v6 = [a1 descriptionForSetWantsAllNavStatusUpdatesMessage:v4];
        goto LABEL_4;
    }
  }
  else if ((v5 - 200) < 6)
  {
    uint64_t v6 = [a1 descriptionForLocationUpdateRelativeMessage:v4];
LABEL_4:
    int v7 = (__CFString *)v6;
    goto LABEL_5;
  }
  id v9 = [v4 type];
  if ((int)v9 <= 199)
  {
    switch((int)v9)
    {
      case '2':
        int v7 = @"START_INITIAL_SYNC";
        break;
      case '3':
        int v7 = @"FETCH_CURRENT_COUNTRY_CODE";
        break;
      case '4':
        int v7 = @"FETCH_EXPERIMENTS_CONFIG";
        break;
      case '5':
        int v7 = @"DID_CHANGE_EXPERIMENTS_CONFIG";
        break;
      case '6':
        int v7 = @"SYNC_UP_NEXT_ITEMS";
        break;
      case '7':
        int v7 = @"REQUEST_UP_NEXT_ITEMS";
        break;
      case '8':
        int v7 = @"SYNC_CONFIG_STORE";
        break;
      case '9':
        int v7 = @"CHECKIN_WITH_CONFIG_STORE";
        break;
      case ':':
        int v7 = @"REQUEST_ANALYTIC_IDENTIFIERS";
        break;
      case ';':
        int v7 = @"CHECKIN_WITH_SUBSCRIPTION_INFO";
        break;
      case '<':
        int v7 = @"SYNC_SUBSCRIPTION_INFO";
        break;
      case '=':
        int v7 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case '>':
        goto LABEL_89;
      case '?':
        int v7 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      case '@':
        int v7 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'A':
        int v7 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'B':
        int v7 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'C':
        int v7 = @"SET_SUBSCRIPTION_SHOULD_SYNC";
        break;
      default:
        if (v9 > 0xC7)
        {
          switch((int)v9)
          {
            case 'd':
              int v7 = @"CHECKIN_WITH_TILE_GROUP";
              break;
            case 'e':
              int v7 = @"FORCE_UPDATE_MANIFEST";
              break;
            case 'f':
              int v7 = @"DID_CHANGE_ACTIVE_TILE_GROUP";
              break;
            case 'g':
              int v7 = @"FETCH_RESOURCE";
              break;
            default:
              goto LABEL_89;
          }
        }
        else
        {
          int v7 = @"FETCH_TILES";
          switch((int)v9)
          {
            case 1:
              goto LABEL_5;
            case 2:
              int v7 = @"CANCEL_TILES";
              break;
            case 3:
              int v7 = @"REPORT_CORRUPT_TILE";
              break;
            case 4:
              int v7 = @"FETCHED_TILE";
              break;
            default:
              JUMPOUT(0);
          }
        }
        return result;
    }
  }
  else
  {
    if ((int)v9 > 400)
    {
      if ((int)v9 > 599)
      {
        if ((int)v9 > 1499)
        {
          if (v9 == 1500)
          {
            int v7 = @"DEBUG_FETCH_CONFIGURATION_INFO";
            goto LABEL_5;
          }
          if (v9 == 1501)
          {
            int v7 = @"DEBUG_FETCH_DIAGNOSTICS_STRING";
            goto LABEL_5;
          }
        }
        else
        {
          if (v9 == 600)
          {
            int v7 = @"FETCH_ROUTE_GENIUS";
            goto LABEL_5;
          }
          if (v9 == 1000)
          {
            int v7 = @"PING";
            goto LABEL_5;
          }
        }
      }
      else if ((int)v9 > 500)
      {
        if (v9 == 501)
        {
          int v7 = @"PLACE_DATA_IDENTIFIER_LOOKUP";
          goto LABEL_5;
        }
        if (v9 == 502)
        {
          int v7 = @"SERVICE_REQUEST";
          goto LABEL_5;
        }
      }
      else
      {
        if (v9 == 401)
        {
          int v7 = @"OPEN_URL";
          goto LABEL_5;
        }
        if (v9 == 500)
        {
          int v7 = @"PLACE_DATA_MUID_LOOKUP";
          goto LABEL_5;
        }
      }
LABEL_89:
      uint64_t v6 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
      goto LABEL_4;
    }
    switch((int)v9)
    {
      case 300:
        int v7 = @"UPDATE_NAV_ROUTE_DETAILS";
        break;
      case 301:
        int v7 = @"UPDATE_NAV_ROUTE_STATUS";
        break;
      case 302:
        int v7 = @"START_NAV";
        break;
      case 303:
        int v7 = @"STOP_NAV";
        break;
      case 304:
        int v7 = @"PREVIEW_NAV";
        break;
      case 305:
        int v7 = @"CLEAR_NAV_PREVIEW";
        break;
      case 306:
        int v7 = @"SET_WANTS_ALL_NAV_STATUS_UPDATES";
        break;
      case 307:
        int v7 = @"DISMISS_NAV_SAFETY_ALERT";
        break;
      case 308:
        int v7 = @"AVAILABLE_ROUTE";
        break;
      case 309:
        int v7 = @"SELECTED_ROUTE";
        break;
      case 310:
        int v7 = @"REQUEST_NAVIGATION_UPDATE";
        break;
      case 311:
        int v7 = @"UPDATE_NAV_ROUTE_UPDATE";
        break;
      case 312:
        int v7 = @"AVAILABLE_ROUTE_UPDATE";
        break;
      case 313:
        int v7 = @"PAUSE_NAV";
        break;
      case 314:
        int v7 = @"RESUME_NAV";
        break;
      case 315:
        int v7 = @"SET_DISPLAYED_STEP";
        break;
      default:
        switch((int)v9)
        {
          case 200:
            int v7 = @"START_LOCATION_UPDATE";
            break;
          case 201:
            int v7 = @"STOP_LOCATION_UPDATE";
            break;
          case 202:
            int v7 = @"UPDATED_LOCATION";
            break;
          case 203:
            int v7 = @"FAILED_TO_UPDATE_LOCATION";
            break;
          case 204:
            int v7 = @"DID_PAUSE_LOCATION_UPDATES";
            break;
          case 205:
            int v7 = @"DID_RESUME_LOCATION_UPDATES";
            break;
          case 206:
            int v7 = @"APPLY_LOCATION_AUTHORIZATION";
            break;
          default:
            goto LABEL_89;
        }
        break;
    }
  }
LABEL_5:

  return v7;
}

@end