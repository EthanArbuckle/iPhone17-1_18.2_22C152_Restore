@interface MKSiriInteraction
+ (NSString)navigationHash;
+ (id)_siriIntentMurmurHash:(id)a3;
+ (void)generateHashForNavigationURL:(id)a3;
+ (void)removeRecentIntentWithPlacemark:(id)a3;
+ (void)removeRecentIntentWithSearchText:(id)a3;
+ (void)setNavigationHash:(id)a3;
- (BOOL)_isIntentDeletable;
- (BOOL)_isStartNavigationAction:(int)a3;
- (BOOL)_isValidTargetForNavUI:(int)a3;
- (GEOSearchCategory)searchCategory;
- (MKMapItem)mapItem;
- (MKSiriInteraction)initWithGEOUIAction:(int)a3 target:(int)a4 mapItem:(id)a5 resultIndex:(int)a6 searchCategory:(id)a7 searchQueryString:(id)a8;
- (NSString)searchQueryString;
- (id)_siriIntentHash:(id)a3;
- (id)_whiteListedBrowseCategoryActionAsString:(int)a3;
- (id)_whiteListedNavigationActionAsString:(int)a3;
- (id)_whiteListedPlaceCardActionAsString:(int)a3;
- (id)_whiteListedSearchActionAsString:(int)a3;
- (id)_whiteListedSiriListActionAsString:(int)a3;
- (id)intentIfWanted;
- (int)action;
- (int)resultIndex;
- (int)target;
- (void)_navTimerFired:(id)a3;
- (void)donateIfWanted;
- (void)setAction:(int)a3;
- (void)setMapItem:(id)a3;
- (void)setResultIndex:(int)a3;
- (void)setSearchCategory:(id)a3;
- (void)setSearchQueryString:(id)a3;
- (void)setTarget:(int)a3;
@end

@implementation MKSiriInteraction

- (MKSiriInteraction)initWithGEOUIAction:(int)a3 target:(int)a4 mapItem:(id)a5 resultIndex:(int)a6 searchCategory:(id)a7 searchQueryString:(id)a8
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MKSiriInteraction;
  v18 = [(MKSiriInteraction *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_action = a3;
    v18->_target = a4;
    objc_storeStrong((id *)&v18->_mapItem, a5);
    v19->_resultIndex = a6;
    objc_storeStrong((id *)&v19->_searchCategory, a7);
    objc_storeStrong((id *)&v19->_searchQueryString, a8);
  }

  return v19;
}

- (id)intentIfWanted
{
  v53[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  BOOL v5 = [(MKSiriInteraction *)self _isValidTargetForNavUI:self->_target];
  int target = self->_target;
  if ((target - 803) < 2)
  {
    v8 = [(MKSiriInteraction *)self _whiteListedSiriListActionAsString:self->_action];
    v9 = 0;
    v10 = 0;
    v7 = @"ResultListTap";
  }
  else if (target == 501 || target == 201)
  {
    if (self->_action == 21) {
      v7 = @"Show";
    }
    else {
      v7 = @"PlaceCardTap";
    }
    v8 = -[MKSiriInteraction _whiteListedPlaceCardActionAsString:](self, "_whiteListedPlaceCardActionAsString:");
    v9 = 0;
    v10 = 0;
  }
  else if (v5)
  {
    v8 = [(MKSiriInteraction *)self _whiteListedNavigationActionAsString:self->_action];
    v9 = +[MKSiriInteraction navigationHash];
    if ([(MKSiriInteraction *)self _isStartNavigationAction:self->_action])
    {
      if (self->_target == 104)
      {
        v7 = @"Navigation";
        v10 = @"Search Along the Route";
      }
      else
      {
        if (!s_navStartedTimer)
        {
          uint64_t v40 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__navTimerFired_ selector:0 userInfo:0 repeats:30.0];
          v41 = (void *)s_navStartedTimer;
          s_navStartedTimer = v40;
        }
        v7 = @"Navigation";
        v10 = @"New Request";
      }
    }
    else
    {
      if (self->_action == 3002)
      {
        +[MKSiriInteraction setNavigationHash:0];
        [(id)s_navStartedTimer invalidate];
        v39 = (void *)s_navStartedTimer;
        s_navStartedTimer = 0;
      }
      v10 = 0;
      v7 = @"Navigation";
    }
  }
  else if (target == 101)
  {
    v8 = [(MKSiriInteraction *)self _whiteListedSearchActionAsString:self->_action];
    v9 = 0;
    v10 = 0;
    v7 = @"Search";
  }
  else if (target == 9)
  {
    v8 = [(MKSiriInteraction *)self _whiteListedBrowseCategoryActionAsString:self->_action];
    v9 = 0;
    v10 = 0;
    v7 = @"SelectCategory";
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v8 = 0;
    v7 = 0;
  }
  if ([(MKMapItem *)self->_mapItem _muid]
    || ([(MKMapItem *)self->_mapItem _shortAddress],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    if ([(MKMapItem *)self->_mapItem _muid]) {
      objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[MKMapItem _muid](self->_mapItem, "_muid"));
    }
    else {
    v12 = [(MKMapItem *)self->_mapItem _shortAddress];
    }
  }
  else
  {
    v12 = &stru_1ED919588;
  }
  v13 = 0;
  if (v7 && v8 && v12)
  {
    v45 = v12;
    v46 = v10;
    v52[0] = @"element";
    v52[1] = @"poi_identifier";
    v53[0] = v8;
    v53[1] = v12;
    v52[2] = @"compatibilityVersion";
    v53[2] = &unk_1ED97DFF0;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
    id v15 = (void *)[v14 mutableCopy];

    if (v9) {
      [v15 setObject:v9 forKeyedSubscript:@"nav_identifier"];
    }
    id v16 = [(MKMapItem *)self->_mapItem name];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      v18 = NSString;
      v19 = _MKLocalizedStringFromThisBundle(@"[Siri Biomestream Donations] Directions to %@");
      v20 = [(MKMapItem *)self->_mapItem name];
      objc_super v21 = objc_msgSend(v18, "stringWithFormat:", v19, v20);
      [v15 setObject:v21 forKeyedSubscript:@"title"];
    }
    v22 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
    uint64_t v23 = [v22 length];

    if (v23)
    {
      v24 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
      [v15 setObject:v24 forKeyedSubscript:@"category_type"];
    }
    v25 = [(GEOSearchCategory *)self->_searchCategory popularTokenString];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      v27 = [(GEOSearchCategory *)self->_searchCategory popularTokenString];
      [v15 setObject:v27 forKeyedSubscript:@"category_type"];
    }
    if ([(NSString *)self->_searchQueryString length]) {
      [v15 setObject:self->_searchQueryString forKeyedSubscript:@"input"];
    }
    v28 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v29 = [v28 addressDictionary];

    if (v29)
    {
      v42 = v7;
      v43 = v9;
      v44 = v8;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v48 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v36 = [v30 objectForKeyedSubscript:v35];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v15 setObject:v36 forKeyedSubscript:v35];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v32);
      }

      v8 = v44;
      v7 = v42;
      v9 = v43;
    }
    if (self->_resultIndex != -1)
    {
      v37 = objc_msgSend(NSNumber, "numberWithInt:");
      [v15 setObject:v37 forKeyedSubscript:@"resultIndex"];
    }
    if ([v4 length]) {
      [v15 setObject:v4 forKeyedSubscript:@"source"];
    }
    if ([(__CFString *)v46 length]) {
      [v15 setObject:v46 forKeyedSubscript:@"navigationType"];
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F304D0]) initWithDomain:@"Maps" verb:v7 parametersByName:v15];

    v12 = v45;
  }

  return v13;
}

- (void)donateIfWanted
{
  v3 = [(MKSiriInteraction *)self intentIfWanted];
  if (v3)
  {
    id v6 = v3;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v3 response:0];
    if ([(MKSiriInteraction *)self _isIntentDeletable])
    {
      BOOL v5 = [(MKSiriInteraction *)self _siriIntentHash:v6];
      [v4 setGroupIdentifier:v5];
    }
    [v4 donateInteractionWithCompletion:0];

    v3 = v6;
  }
}

- (id)_siriIntentHash:(id)a3
{
  if ([(MKSiriInteraction *)self _isIntentDeletable])
  {
    if ([(NSString *)self->_searchQueryString length])
    {
      v4 = [NSString stringWithFormat:@"input=%@", self->_searchQueryString];
      BOOL v5 = +[MKSiriInteraction _siriIntentMurmurHash:v4];
    }
    else
    {
      id v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
      v4 = v6;
      if (v6)
      {
        if ([v6 _hasMUID])
        {
          v7 = objc_msgSend(NSString, "stringWithFormat:", @"muid=%llu", objc_msgSend(v4, "_muid"));
          BOOL v5 = +[MKSiriInteraction _siriIntentMurmurHash:v7];
        }
        else
        {
          v7 = [v4 addressObject];
          v8 = NSString;
          v9 = [v7 fullAddressWithMultiline:0];
          v10 = [v8 stringWithFormat:@"address=%@", v9];
          BOOL v5 = +[MKSiriInteraction _siriIntentMurmurHash:v10];
        }
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isIntentDeletable
{
  int target = self->_target;
  if (target == 501 || target == 201)
  {
    if (self->_action != 21) {
      return 0;
    }
  }
  else if (target != 101 || self->_action != 2014)
  {
    return 0;
  }
  return 1;
}

+ (void)removeRecentIntentWithPlacemark:(id)a3
{
  if (a3)
  {
    v3 = [a3 _geoMapItem];
    if (v3)
    {
      id v11 = v3;
      if ([v3 _hasMUID])
      {
        v4 = (void *)MEMORY[0x1E4F30508];
        BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"muid=%llu", objc_msgSend(v11, "_muid"));
        id v6 = +[MKSiriInteraction _siriIntentMurmurHash:v5];
        [v4 deleteInteractionsWithGroupIdentifier:v6 completion:0];
      }
      else
      {
        BOOL v5 = [v11 addressObject];
        v7 = (void *)MEMORY[0x1E4F30508];
        v8 = NSString;
        id v6 = [v5 fullAddressWithMultiline:0];
        v9 = [v8 stringWithFormat:@"address=%@", v6];
        v10 = +[MKSiriInteraction _siriIntentMurmurHash:v9];
        [v7 deleteInteractionsWithGroupIdentifier:v10 completion:0];
      }
      v3 = v11;
    }
  }
}

+ (void)removeRecentIntentWithSearchText:(id)a3
{
  v3 = (__CFString *)a3;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_1ED919588;
  }
  BOOL v5 = (void *)MEMORY[0x1E4F30508];
  v8 = v4;
  id v6 = [NSString stringWithFormat:@"input=%@", v4];
  v7 = +[MKSiriInteraction _siriIntentMurmurHash:v6];
  [v5 deleteInteractionsWithGroupIdentifier:v7 completion:0];
}

- (BOOL)_isValidTargetForNavUI:(int)a3
{
  BOOL result = 1;
  if (a3 > 400)
  {
    if ((a3 - 401) >= 3 && a3 != 802) {
      return 0;
    }
  }
  else if ((a3 - 301) >= 3 && a3 != 104)
  {
    return 0;
  }
  return result;
}

- (id)_whiteListedPlaceCardActionAsString:(int)a3
{
  BOOL v3 = (a3 - 6003) > 0x12 || ((1 << (a3 - 115)) & 0x607F1) == 0;
  if (!v3 || a3 == 3001 || a3 == 21)
  {
    uint64_t action = self->_action;
    if ((int)action > 4000)
    {
      if ((int)action <= 10100)
      {
        if ((int)action > 7000)
        {
          switch((int)action)
          {
            case 9001:
              BOOL v5 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              BOOL v5 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              BOOL v5 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              BOOL v5 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              BOOL v5 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              BOOL v5 = @"OPEN_SEARCH";
              break;
            case 9007:
              BOOL v5 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              BOOL v5 = @"PAN_LEFT";
              break;
            case 9009:
              BOOL v5 = @"PAN_UP";
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_56;
            case 9011:
              BOOL v5 = @"PAN_DOWN";
              break;
            case 9012:
              BOOL v5 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              BOOL v5 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              BOOL v5 = @"OPEN_FAVORITES";
              break;
            case 9015:
              BOOL v5 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              BOOL v5 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              BOOL v5 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              BOOL v5 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              BOOL v5 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              BOOL v5 = @"SHARE_DESTINATION";
              break;
            case 9021:
              BOOL v5 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              BOOL v5 = @"SHARE_ETA";
              break;
            case 9023:
              BOOL v5 = @"SELECT_GROUP";
              break;
            case 9024:
              BOOL v5 = @"DESELECT_GROUP";
              break;
            case 9025:
              BOOL v5 = @"SELECT_CONTACT";
              break;
            case 9026:
              BOOL v5 = @"DESELECT_CONTACT";
              break;
            case 9027:
              BOOL v5 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              BOOL v5 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              BOOL v5 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              BOOL v5 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              BOOL v5 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              BOOL v5 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              BOOL v5 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              BOOL v5 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              BOOL v5 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              BOOL v5 = @"SCROLL_FORWARD";
              break;
            case 9037:
              BOOL v5 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              BOOL v5 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              BOOL v5 = @"TAP_LESS";
              break;
            case 9040:
              BOOL v5 = @"TAP_MORE";
              break;
            case 9101:
              BOOL v5 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              BOOL v5 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              BOOL v5 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              BOOL v5 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              BOOL v5 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              BOOL v5 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)action)
              {
                case 7001:
                  BOOL v5 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  BOOL v5 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  BOOL v5 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  BOOL v5 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  BOOL v5 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  BOOL v5 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  BOOL v5 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  BOOL v5 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  BOOL v5 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  BOOL v5 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  BOOL v5 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  BOOL v5 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  BOOL v5 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  BOOL v5 = @"GET_TICKETS";
                  break;
                case 7015:
                  BOOL v5 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  BOOL v5 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  BOOL v5 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  BOOL v5 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  BOOL v5 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  BOOL v5 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  BOOL v5 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  BOOL v5 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  BOOL v5 = @"VIEW_BANNER";
                  break;
                case 7024:
                  BOOL v5 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  BOOL v5 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  BOOL v5 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  BOOL v5 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  BOOL v5 = @"WAITLIST";
                  break;
                case 7029:
                  BOOL v5 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  BOOL v5 = @"RESERVE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 8001:
                      BOOL v5 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      BOOL v5 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      BOOL v5 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      BOOL v5 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      BOOL v5 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      BOOL v5 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      BOOL v5 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      BOOL v5 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      BOOL v5 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      BOOL v5 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      BOOL v5 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_56;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)action)
          {
            case 6003:
              BOOL v5 = @"GET_DIRECTIONS";
              break;
            case 6004:
              BOOL v5 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              BOOL v5 = @"REMOVE_PIN";
              break;
            case 6006:
              BOOL v5 = @"TAP_PHOTO";
              break;
            case 6007:
              BOOL v5 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              BOOL v5 = @"TAP_ADDRESS";
              break;
            case 6009:
              BOOL v5 = @"CALL";
              break;
            case 6010:
              BOOL v5 = @"TAP_URL";
              break;
            case 6011:
              BOOL v5 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              BOOL v5 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              BOOL v5 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_56;
            case 6015:
              BOOL v5 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              BOOL v5 = @"ADD_CONTACT";
              break;
            case 6018:
              BOOL v5 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              BOOL v5 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              BOOL v5 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              BOOL v5 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              BOOL v5 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              BOOL v5 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              BOOL v5 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              BOOL v5 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              BOOL v5 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              BOOL v5 = @"EDIT_LOCATION";
              break;
            case 6029:
              BOOL v5 = @"ADD_PHOTO";
              break;
            case 6031:
              BOOL v5 = @"RETAKE";
              break;
            case 6032:
              BOOL v5 = @"ADD_NOTE";
              break;
            case 6033:
              BOOL v5 = @"REMOVE_CAR";
              break;
            case 6034:
              BOOL v5 = @"EDIT_NAME";
              break;
            case 6036:
              BOOL v5 = @"RESERVE_TABLE";
              break;
            case 6037:
              BOOL v5 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              BOOL v5 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              BOOL v5 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              BOOL v5 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              BOOL v5 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              BOOL v5 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              BOOL v5 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              BOOL v5 = @"VIEW_CONTACT";
              break;
            case 6045:
              BOOL v5 = @"CHAT";
              break;
            case 6046:
              BOOL v5 = @"FIND_STORES";
              break;
            case 6047:
              BOOL v5 = @"TAP_PARENT";
              break;
            case 6048:
              BOOL v5 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              BOOL v5 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              BOOL v5 = @"PUNCH_OUT";
              break;
            case 6051:
              BOOL v5 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              BOOL v5 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              BOOL v5 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              BOOL v5 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              BOOL v5 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              BOOL v5 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              BOOL v5 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              BOOL v5 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              BOOL v5 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              BOOL v5 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              BOOL v5 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              BOOL v5 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              BOOL v5 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              BOOL v5 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              BOOL v5 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              BOOL v5 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              BOOL v5 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              BOOL v5 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              BOOL v5 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              BOOL v5 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              BOOL v5 = @"TAP_LANDMARK";
              break;
            case 6072:
              BOOL v5 = @"TAP_SCENE";
              break;
            case 6073:
              BOOL v5 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              BOOL v5 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              BOOL v5 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              BOOL v5 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              BOOL v5 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              BOOL v5 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              BOOL v5 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              BOOL v5 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              BOOL v5 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              BOOL v5 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              BOOL v5 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              BOOL v5 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              BOOL v5 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              BOOL v5 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              BOOL v5 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              BOOL v5 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              BOOL v5 = @"TAP_VIEW_APP";
              break;
            case 6090:
              BOOL v5 = @"TAP_APP_CLIP";
              break;
            case 6091:
              BOOL v5 = @"DEAD_BATTERY";
              break;
            case 6092:
              BOOL v5 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              BOOL v5 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              BOOL v5 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              BOOL v5 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              BOOL v5 = @"PAUSE_ROUTE";
              break;
            case 6097:
              BOOL v5 = @"TAP_ADD_STOP";
              break;
            case 6098:
              BOOL v5 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              BOOL v5 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              BOOL v5 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              BOOL v5 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              BOOL v5 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              BOOL v5 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              BOOL v5 = @"SHOW_INCIDENT";
              break;
            case 6105:
              BOOL v5 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              BOOL v5 = @"ORDER_DELIVERY";
              break;
            case 6107:
              BOOL v5 = @"VIEW_MENU";
              break;
            case 6108:
              BOOL v5 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              BOOL v5 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              BOOL v5 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              BOOL v5 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)action)
              {
                case 5001:
                  BOOL v5 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  BOOL v5 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  BOOL v5 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  BOOL v5 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  BOOL v5 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  BOOL v5 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  BOOL v5 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  BOOL v5 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  BOOL v5 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  BOOL v5 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  BOOL v5 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  BOOL v5 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  BOOL v5 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  BOOL v5 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_56;
                case 5016:
                  BOOL v5 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  BOOL v5 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  BOOL v5 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  BOOL v5 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  BOOL v5 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  BOOL v5 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  BOOL v5 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  BOOL v5 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  BOOL v5 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  BOOL v5 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  BOOL v5 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  BOOL v5 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  BOOL v5 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  BOOL v5 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  BOOL v5 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  BOOL v5 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  BOOL v5 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  BOOL v5 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  BOOL v5 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  BOOL v5 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  BOOL v5 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  BOOL v5 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  BOOL v5 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  BOOL v5 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 4001:
                      BOOL v5 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      BOOL v5 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      BOOL v5 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      BOOL v5 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      BOOL v5 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      BOOL v5 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_56;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)action > 13000)
      {
        if ((int)action <= 16000)
        {
          if ((int)action <= 15000)
          {
            switch((int)action)
            {
              case 14001:
                BOOL v5 = @"VIEW_APP";
                break;
              case 14002:
                BOOL v5 = @"ENABLE";
                break;
              case 14003:
                BOOL v5 = @"BOOK_RIDE";
                break;
              case 14004:
                BOOL v5 = @"REQUEST_RIDE";
                break;
              case 14005:
                BOOL v5 = @"CONTACT_DRIVER";
                break;
              case 14006:
                BOOL v5 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                BOOL v5 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                BOOL v5 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                BOOL v5 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)action)
                {
                  case 13001:
                    BOOL v5 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    BOOL v5 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    BOOL v5 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    BOOL v5 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    BOOL v5 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    BOOL v5 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    BOOL v5 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_56;
                }
                break;
            }
          }
          else
          {
            switch(action)
            {
              case 0x3A99:
                BOOL v5 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                BOOL v5 = @"ORB_POP";
                break;
              case 0x3A9B:
                BOOL v5 = @"ORB_DISMISS";
                break;
              default:
LABEL_56:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", action);
                BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)action)
          {
            case 17001:
              BOOL v5 = @"START_DRAG";
              break;
            case 17002:
              BOOL v5 = @"CANCEL_DRAG";
              break;
            case 17003:
              BOOL v5 = @"COMPLETE_DRAG";
              break;
            case 17004:
              BOOL v5 = @"START_DROP";
              break;
            case 17005:
              BOOL v5 = @"CANCEL_DROP";
              break;
            case 17006:
              BOOL v5 = @"COMPLETE_DROP";
              break;
            case 17007:
              BOOL v5 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              BOOL v5 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              BOOL v5 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              BOOL v5 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              BOOL v5 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              BOOL v5 = @"CALLOUT_INFO";
              break;
            case 17013:
              BOOL v5 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              BOOL v5 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              BOOL v5 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              BOOL v5 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              BOOL v5 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              BOOL v5 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              BOOL v5 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              BOOL v5 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              BOOL v5 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              BOOL v5 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              BOOL v5 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              BOOL v5 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              BOOL v5 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              BOOL v5 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              BOOL v5 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              BOOL v5 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              BOOL v5 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              BOOL v5 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              BOOL v5 = @"INFO_CONTACTS";
              break;
            case 17032:
              BOOL v5 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              BOOL v5 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              BOOL v5 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              BOOL v5 = @"INFO_DISMISS";
              break;
            case 17036:
              BOOL v5 = @"INFO_INFO";
              break;
            case 17037:
              BOOL v5 = @"INFO_PHOTOS";
              break;
            case 17038:
              BOOL v5 = @"INFO_REVIEWS";
              break;
            case 17039:
              BOOL v5 = @"INFO_SHARE";
              break;
            case 17040:
              BOOL v5 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              BOOL v5 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              BOOL v5 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              BOOL v5 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              BOOL v5 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              BOOL v5 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              BOOL v5 = @"INFO_YELP";
              break;
            case 17047:
              BOOL v5 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              BOOL v5 = @"MAP_3D_OFF";
              break;
            case 17049:
              BOOL v5 = @"MAP_3D_ON";
              break;
            case 17050:
              BOOL v5 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              BOOL v5 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              BOOL v5 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              BOOL v5 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              BOOL v5 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              BOOL v5 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              BOOL v5 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              BOOL v5 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              BOOL v5 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              BOOL v5 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              BOOL v5 = @"MAP_TAP_LINE";
              break;
            case 17061:
              BOOL v5 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              BOOL v5 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              BOOL v5 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              BOOL v5 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              BOOL v5 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              BOOL v5 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              BOOL v5 = @"NAV_CLEAR";
              break;
            case 17068:
              BOOL v5 = @"NAV_LIST";
              break;
            case 17069:
              BOOL v5 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              BOOL v5 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              BOOL v5 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              BOOL v5 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              BOOL v5 = @"ORB_MENU_CALL";
              break;
            case 17074:
              BOOL v5 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              BOOL v5 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              BOOL v5 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              BOOL v5 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              BOOL v5 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              BOOL v5 = @"ORB_MENU_URL";
              break;
            case 17080:
              BOOL v5 = @"ORB_PRESS";
              break;
            case 17081:
              BOOL v5 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              BOOL v5 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              BOOL v5 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              BOOL v5 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              BOOL v5 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              BOOL v5 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              BOOL v5 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              BOOL v5 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              BOOL v5 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              BOOL v5 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              BOOL v5 = @"SEARCH_BEGIN";
              break;
            case 17092:
              BOOL v5 = @"SEARCH_CANCEL";
              break;
            case 17093:
              BOOL v5 = @"SEARCH_SELECT";
              break;
            case 17094:
              BOOL v5 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              BOOL v5 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              BOOL v5 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              BOOL v5 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              BOOL v5 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              BOOL v5 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              BOOL v5 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              BOOL v5 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              BOOL v5 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              BOOL v5 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              BOOL v5 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              BOOL v5 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              BOOL v5 = @"CALLOUT_NAV";
              break;
            case 17107:
              BOOL v5 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              BOOL v5 = @"MAP_TAP_POI";
              break;
            default:
              if (action == 16001)
              {
                BOOL v5 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (action != 90010) {
                  goto LABEL_56;
                }
                BOOL v5 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)action)
        {
          case 10101:
            BOOL v5 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            BOOL v5 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            BOOL v5 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            BOOL v5 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            BOOL v5 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            BOOL v5 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            BOOL v5 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            BOOL v5 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            BOOL v5 = @"RAP_CANCEL";
            break;
          case 10110:
            BOOL v5 = @"RAP_NEXT";
            break;
          case 10111:
            BOOL v5 = @"RAP_BACK";
            break;
          case 10112:
            BOOL v5 = @"RAP_SEND";
            break;
          case 10113:
            BOOL v5 = @"RAP_SKIP";
            break;
          case 10114:
            BOOL v5 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            BOOL v5 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            BOOL v5 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            BOOL v5 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            BOOL v5 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            BOOL v5 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            BOOL v5 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            BOOL v5 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            BOOL v5 = @"RAP_HOME";
            break;
          case 10123:
            BOOL v5 = @"RAP_WORK";
            break;
          case 10124:
            BOOL v5 = @"RAP_OTHER";
            break;
          case 10125:
            BOOL v5 = @"RAP_LOCATION";
            break;
          case 10126:
            BOOL v5 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            BOOL v5 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            BOOL v5 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            BOOL v5 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            BOOL v5 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            BOOL v5 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            BOOL v5 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            BOOL v5 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            BOOL v5 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            BOOL v5 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            BOOL v5 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            BOOL v5 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            BOOL v5 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            BOOL v5 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            BOOL v5 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            BOOL v5 = @"RAP_PAN_MAP";
            break;
          case 10142:
            BOOL v5 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            BOOL v5 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            BOOL v5 = @"RAP_ADD_POI";
            break;
          case 10145:
            BOOL v5 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            BOOL v5 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            BOOL v5 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            BOOL v5 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            BOOL v5 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            BOOL v5 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            BOOL v5 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            BOOL v5 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            BOOL v5 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            BOOL v5 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            BOOL v5 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            BOOL v5 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            BOOL v5 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            BOOL v5 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            BOOL v5 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            BOOL v5 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            BOOL v5 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            BOOL v5 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            BOOL v5 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            BOOL v5 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            BOOL v5 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            BOOL v5 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            BOOL v5 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            BOOL v5 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            BOOL v5 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            BOOL v5 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            BOOL v5 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            BOOL v5 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            BOOL v5 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            BOOL v5 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            BOOL v5 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            BOOL v5 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            BOOL v5 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            BOOL v5 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            BOOL v5 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            BOOL v5 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            BOOL v5 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            BOOL v5 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            BOOL v5 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            BOOL v5 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            BOOL v5 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            BOOL v5 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            BOOL v5 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            BOOL v5 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            BOOL v5 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            BOOL v5 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            BOOL v5 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)action)
            {
              case 11001:
                BOOL v5 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                BOOL v5 = @"TASK_READY";
                break;
              case 11003:
                BOOL v5 = @"TAP_SEARCH";
                break;
              case 11004:
                BOOL v5 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                BOOL v5 = @"SHOW_NEARBY";
                break;
              case 11006:
                BOOL v5 = @"TAP_NEARBY";
                break;
              case 11007:
                BOOL v5 = @"TAP_PROACTIVE";
                break;
              case 11008:
                BOOL v5 = @"FORCE_PRESS";
                break;
              case 11009:
                BOOL v5 = @"TAP_CONTACTS";
                break;
              case 11010:
                BOOL v5 = @"TAP_TRANSIT";
                break;
              case 11011:
                BOOL v5 = @"TAP_DICTATION";
                break;
              case 11012:
                BOOL v5 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                BOOL v5 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                BOOL v5 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                BOOL v5 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                BOOL v5 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                BOOL v5 = @"START_NAV_AUTO";
                break;
              case 11018:
                BOOL v5 = @"TAP_RECENT";
                break;
              case 11019:
                BOOL v5 = @"TAP_FAVORITE";
                break;
              case 11020:
                BOOL v5 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                BOOL v5 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                BOOL v5 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                BOOL v5 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                BOOL v5 = @"NAV_UNMUTE";
                break;
              case 11025:
                BOOL v5 = @"NAV_MUTE";
                break;
              case 11026:
                BOOL v5 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                BOOL v5 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                BOOL v5 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                BOOL v5 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)action)
                {
                  case 12001:
                    BOOL v5 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    BOOL v5 = @"SELECT_TIME";
                    break;
                  case 12003:
                    BOOL v5 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    BOOL v5 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    BOOL v5 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    BOOL v5 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    BOOL v5 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    BOOL v5 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    BOOL v5 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    BOOL v5 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_56;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      BOOL v5 = @"UI_ACTION_UNKNOWN";
      switch((int)action)
      {
        case 0:
          break;
        case 1:
          BOOL v5 = @"PULL_UP";
          break;
        case 2:
          BOOL v5 = @"PULL_DOWN";
          break;
        case 3:
          BOOL v5 = @"TAP";
          break;
        case 4:
          BOOL v5 = @"CLOSE";
          break;
        case 5:
          BOOL v5 = @"SWIPE_PREV";
          break;
        case 6:
          BOOL v5 = @"SWIPE_NEXT";
          break;
        case 7:
          BOOL v5 = @"SCROLL_UP";
          break;
        case 8:
          BOOL v5 = @"SCROLL_DOWN";
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_56;
        case 10:
          BOOL v5 = @"SHOW_MORE";
          break;
        case 11:
          BOOL v5 = @"SHOW_LESS";
          break;
        case 12:
          BOOL v5 = @"SWIPE_LEFT";
          break;
        case 13:
          BOOL v5 = @"SWIPE_RIGHT";
          break;
        case 14:
          BOOL v5 = @"MINIMIZE";
          break;
        case 15:
          BOOL v5 = @"TAP_PREV";
          break;
        case 16:
          BOOL v5 = @"TAP_NEXT";
          break;
        case 17:
          BOOL v5 = @"SUBMIT";
          break;
        case 18:
          BOOL v5 = @"CANCEL";
          break;
        case 19:
          BOOL v5 = @"ENTER_MAPS";
          break;
        case 20:
          BOOL v5 = @"EXIT_MAPS";
          break;
        case 21:
          BOOL v5 = @"REVEAL";
          break;
        case 22:
          BOOL v5 = @"OPEN_NEW_TAB";
          break;
        case 25:
          BOOL v5 = @"BACK";
          break;
        case 26:
          BOOL v5 = @"ACTIVATE";
          break;
        case 27:
          BOOL v5 = @"DEACTIVATE";
          break;
        case 28:
          BOOL v5 = @"AGREE";
          break;
        case 29:
          BOOL v5 = @"DISAGREE";
          break;
        case 30:
          BOOL v5 = @"SKIP_ANSWER";
          break;
        case 31:
          BOOL v5 = @"EXPAND";
          break;
        case 32:
          BOOL v5 = @"COLLAPSE";
          break;
        case 33:
          BOOL v5 = @"ENTER";
          break;
        case 34:
          BOOL v5 = @"EXIT";
          break;
        case 35:
          BOOL v5 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          BOOL v5 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          BOOL v5 = @"TOGGLE_ON";
          break;
        case 38:
          BOOL v5 = @"TOGGLE_OFF";
          break;
        case 39:
          BOOL v5 = @"LONG_PRESS";
          break;
        case 40:
          BOOL v5 = @"CLICK";
          break;
        case 41:
          BOOL v5 = @"TAP_DONE";
          break;
        case 42:
          BOOL v5 = @"TAP_CLOSE";
          break;
        case 43:
          BOOL v5 = @"SCROLL_LEFT";
          break;
        case 44:
          BOOL v5 = @"SCROLL_RIGHT";
          break;
        case 45:
          BOOL v5 = @"DISPLAY";
          break;
        case 46:
          BOOL v5 = @"OPEN_IN_APP";
          break;
        case 47:
          BOOL v5 = @"CONCEAL";
          break;
        case 48:
          BOOL v5 = @"TAP_DELETE";
          break;
        case 49:
          BOOL v5 = @"TAP_FILTER";
          break;
        case 50:
          BOOL v5 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          BOOL v5 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          BOOL v5 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          BOOL v5 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          BOOL v5 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          BOOL v5 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          BOOL v5 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          BOOL v5 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          BOOL v5 = @"SHARE_PHOTO";
          break;
        case 59:
          BOOL v5 = @"TAP_KEEP_OFF";
          break;
        case 60:
          BOOL v5 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          BOOL v5 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          BOOL v5 = @"TAP_TURN_ON";
          break;
        case 63:
          BOOL v5 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          BOOL v5 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          BOOL v5 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          BOOL v5 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          BOOL v5 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          BOOL v5 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          BOOL v5 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          BOOL v5 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          BOOL v5 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          BOOL v5 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          BOOL v5 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          BOOL v5 = @"RESUME_ROUTE";
          break;
        case 75:
          BOOL v5 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          BOOL v5 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          BOOL v5 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          BOOL v5 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          BOOL v5 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          BOOL v5 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          BOOL v5 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          BOOL v5 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          BOOL v5 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          BOOL v5 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          BOOL v5 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          BOOL v5 = @"REPORT_PHOTO";
          break;
        case 87:
          BOOL v5 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          BOOL v5 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          BOOL v5 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          BOOL v5 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          BOOL v5 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          BOOL v5 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          BOOL v5 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          BOOL v5 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          BOOL v5 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          BOOL v5 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          BOOL v5 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          BOOL v5 = @"NEXT";
          break;
        case 99:
          BOOL v5 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          BOOL v5 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          BOOL v5 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          BOOL v5 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          BOOL v5 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          BOOL v5 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          BOOL v5 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          BOOL v5 = @"CLEAR_INCIDENT";
          break;
        case 107:
          BOOL v5 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          BOOL v5 = @"DISMISS_INCIDENT";
          break;
        case 109:
          BOOL v5 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          BOOL v5 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          BOOL v5 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          BOOL v5 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          BOOL v5 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          BOOL v5 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          BOOL v5 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          BOOL v5 = @"TAP_SHORTCUT";
          break;
        case 117:
          BOOL v5 = @"BLOCK_CONTACT";
          break;
        case 118:
          BOOL v5 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          BOOL v5 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          BOOL v5 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          BOOL v5 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          BOOL v5 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          BOOL v5 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          BOOL v5 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          BOOL v5 = @"TAP_DISMISS";
          break;
        case 126:
          BOOL v5 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          BOOL v5 = @"TAP_OK";
          break;
        case 128:
          BOOL v5 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          BOOL v5 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          BOOL v5 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          BOOL v5 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          BOOL v5 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          BOOL v5 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          BOOL v5 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          BOOL v5 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          BOOL v5 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          BOOL v5 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          BOOL v5 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          BOOL v5 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          BOOL v5 = @"HIDE_DETAILS";
          break;
        case 141:
          BOOL v5 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          BOOL v5 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          BOOL v5 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          BOOL v5 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          BOOL v5 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          BOOL v5 = @"TAP_EXIT";
          break;
        case 147:
          BOOL v5 = @"TAP_CITY_MENU";
          break;
        case 148:
          BOOL v5 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          BOOL v5 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          BOOL v5 = @"TAP_ICLOUD";
          break;
        case 151:
          BOOL v5 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          BOOL v5 = @"TAP_FAVORITES";
          break;
        case 153:
          BOOL v5 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          BOOL v5 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          BOOL v5 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          BOOL v5 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          BOOL v5 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          BOOL v5 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          BOOL v5 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          BOOL v5 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          BOOL v5 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          BOOL v5 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          BOOL v5 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          BOOL v5 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          BOOL v5 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          BOOL v5 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          BOOL v5 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          BOOL v5 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          BOOL v5 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          BOOL v5 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          BOOL v5 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          BOOL v5 = @"TAP_ACCOUNT";
          break;
        case 173:
          BOOL v5 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          BOOL v5 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          BOOL v5 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          BOOL v5 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          BOOL v5 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          BOOL v5 = @"TAP_REPORTS";
          break;
        case 179:
          BOOL v5 = @"TAP_RATINGS";
          break;
        case 180:
          BOOL v5 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          BOOL v5 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          BOOL v5 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          BOOL v5 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          BOOL v5 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          BOOL v5 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          BOOL v5 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          BOOL v5 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          BOOL v5 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          BOOL v5 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          BOOL v5 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          BOOL v5 = @"TAP_RATING";
          break;
        case 192:
          BOOL v5 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          BOOL v5 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          BOOL v5 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          BOOL v5 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          BOOL v5 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          BOOL v5 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          BOOL v5 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          BOOL v5 = @"TAP_MY_GUIDES";
          break;
        case 200:
          BOOL v5 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          BOOL v5 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          BOOL v5 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          BOOL v5 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          BOOL v5 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          BOOL v5 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          BOOL v5 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          BOOL v5 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          BOOL v5 = @"SWITCH_ON_HFP";
          break;
        case 209:
          BOOL v5 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          BOOL v5 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          BOOL v5 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          BOOL v5 = @"RESUME";
          break;
        case 213:
          BOOL v5 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          BOOL v5 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          BOOL v5 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          BOOL v5 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          BOOL v5 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          BOOL v5 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          BOOL v5 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          BOOL v5 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          BOOL v5 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          BOOL v5 = @"RAP_ADD_MAP";
          break;
        case 223:
          BOOL v5 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          BOOL v5 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          BOOL v5 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          BOOL v5 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          BOOL v5 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          BOOL v5 = @"RAP_BAD_TRIP";
          break;
        case 229:
          BOOL v5 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          BOOL v5 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          BOOL v5 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          BOOL v5 = @"RAP_GUIDE";
          break;
        case 233:
          BOOL v5 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          BOOL v5 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          BOOL v5 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          BOOL v5 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          BOOL v5 = @"TAP_SEE_MORE";
          break;
        case 238:
          BOOL v5 = @"RAP_IN_REVIEW";
          break;
        case 239:
          BOOL v5 = @"TAP_OPEN_MENU";
          break;
        case 240:
          BOOL v5 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          BOOL v5 = @"TAP_PIN_LINE";
          break;
        case 242:
          BOOL v5 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          BOOL v5 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          BOOL v5 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          BOOL v5 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          BOOL v5 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          BOOL v5 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          BOOL v5 = @"ADVISORY_ALERT";
          break;
        case 249:
          BOOL v5 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          BOOL v5 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          BOOL v5 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          BOOL v5 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          BOOL v5 = @"MENU_UNPIN";
          break;
        case 254:
          BOOL v5 = @"MENU_PIN";
          break;
        case 255:
          BOOL v5 = @"SWIPE_PIN";
          break;
        case 256:
          BOOL v5 = @"SWIPE_UNPIN";
          break;
        case 257:
          BOOL v5 = @"TAP_MEDIA_APP";
          break;
        case 258:
          BOOL v5 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          BOOL v5 = @"TAP_MEDIA";
          break;
        case 260:
          BOOL v5 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          BOOL v5 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          BOOL v5 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          BOOL v5 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          BOOL v5 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          BOOL v5 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          BOOL v5 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          BOOL v5 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          BOOL v5 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          BOOL v5 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          BOOL v5 = @"TAP_ALLOW";
          break;
        case 271:
          BOOL v5 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          BOOL v5 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          BOOL v5 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          BOOL v5 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          BOOL v5 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          BOOL v5 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          BOOL v5 = @"EDIT_WAYPOINT";
          break;
        case 278:
          BOOL v5 = @"CLEAR_TEXT";
          break;
        case 279:
          BOOL v5 = @"REORDER_WAYPOINT";
          break;
        case 280:
          BOOL v5 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          BOOL v5 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          BOOL v5 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          BOOL v5 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          BOOL v5 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          BOOL v5 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          BOOL v5 = @"RAP_INLINE_ADD";
          break;
        case 287:
          BOOL v5 = @"RAP_TAP_EDIT";
          break;
        case 288:
          BOOL v5 = @"CLAIM_BUSINESS";
          break;
        case 289:
          BOOL v5 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          BOOL v5 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          BOOL v5 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          BOOL v5 = @"NEXT_STOP";
          break;
        case 293:
          BOOL v5 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          BOOL v5 = @"REMOVE_STOP";
          break;
        case 295:
          BOOL v5 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          BOOL v5 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          BOOL v5 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          BOOL v5 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          BOOL v5 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          BOOL v5 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          BOOL v5 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          BOOL v5 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          BOOL v5 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          BOOL v5 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          BOOL v5 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          BOOL v5 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          BOOL v5 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          BOOL v5 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          BOOL v5 = @"FILTER_EV";
          break;
        case 310:
          BOOL v5 = @"FILTER_SURCHARGE";
          break;
        case 311:
          BOOL v5 = @"FILTER_PREFER";
          break;
        case 312:
          BOOL v5 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          BOOL v5 = @"FILTER_AVOID";
          break;
        case 314:
          BOOL v5 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          BOOL v5 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          BOOL v5 = @"FILTER_IC_FARES";
          break;
        case 317:
          BOOL v5 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          BOOL v5 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          BOOL v5 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          BOOL v5 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          BOOL v5 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          BOOL v5 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          BOOL v5 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          BOOL v5 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          BOOL v5 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          BOOL v5 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          BOOL v5 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          BOOL v5 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          BOOL v5 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          BOOL v5 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          BOOL v5 = @"DELETE_PHOTO";
          break;
        case 332:
          BOOL v5 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          BOOL v5 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          BOOL v5 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          BOOL v5 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          BOOL v5 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          BOOL v5 = @"ADD_STOP";
          break;
        case 338:
          BOOL v5 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          BOOL v5 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          BOOL v5 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          BOOL v5 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          BOOL v5 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          BOOL v5 = @"SUBMIT_RATINGS";
          break;
        case 344:
          BOOL v5 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          BOOL v5 = @"FILTER_EBIKE";
          break;
        case 356:
          BOOL v5 = @"ADD_STOP_SIRI";
          break;
        case 357:
          BOOL v5 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          BOOL v5 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          BOOL v5 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          BOOL v5 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          BOOL v5 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          BOOL v5 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          BOOL v5 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          BOOL v5 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          BOOL v5 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          BOOL v5 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          BOOL v5 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          BOOL v5 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          BOOL v5 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          BOOL v5 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          BOOL v5 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          BOOL v5 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          BOOL v5 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          BOOL v5 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          BOOL v5 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          BOOL v5 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          BOOL v5 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          BOOL v5 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          BOOL v5 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          BOOL v5 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          BOOL v5 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          BOOL v5 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          BOOL v5 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          BOOL v5 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          BOOL v5 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          BOOL v5 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          BOOL v5 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          BOOL v5 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          BOOL v5 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          BOOL v5 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          BOOL v5 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          BOOL v5 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          BOOL v5 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          BOOL v5 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          BOOL v5 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          BOOL v5 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          BOOL v5 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          BOOL v5 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          BOOL v5 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          BOOL v5 = @"START_ETA_SHARING";
          break;
        case 401:
          BOOL v5 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          BOOL v5 = @"STOP_ETA_SHARING";
          break;
        case 403:
          BOOL v5 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          BOOL v5 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          BOOL v5 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          BOOL v5 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          BOOL v5 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          BOOL v5 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          BOOL v5 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          BOOL v5 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          BOOL v5 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          BOOL v5 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          BOOL v5 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          BOOL v5 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          BOOL v5 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          BOOL v5 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          BOOL v5 = @"SELECT_CONTROLS";
          break;
        case 418:
          BOOL v5 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          BOOL v5 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          BOOL v5 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          BOOL v5 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          BOOL v5 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          BOOL v5 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          BOOL v5 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          BOOL v5 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          BOOL v5 = @"TAP_MAP";
          break;
        case 427:
          BOOL v5 = @"SWIPE_DOWN";
          break;
        case 428:
          BOOL v5 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          BOOL v5 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          BOOL v5 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          BOOL v5 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          BOOL v5 = @"TAP_AUDIO";
          break;
        case 433:
          BOOL v5 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          BOOL v5 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          BOOL v5 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          BOOL v5 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          BOOL v5 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          BOOL v5 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          BOOL v5 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          BOOL v5 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          BOOL v5 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          BOOL v5 = @"UPDATE_COLOR";
          break;
        case 443:
          BOOL v5 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          BOOL v5 = @"UNSELECT_NETWORK";
          break;
        case 445:
          BOOL v5 = @"TAP_BACK";
          break;
        case 446:
          BOOL v5 = @"TAP_CANCEL";
          break;
        case 447:
          BOOL v5 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          BOOL v5 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          BOOL v5 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          BOOL v5 = @"SELECT_NETWORK";
          break;
        case 451:
          BOOL v5 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          BOOL v5 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          BOOL v5 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          BOOL v5 = @"FILTER_NETWORK";
          break;
        case 455:
          BOOL v5 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          BOOL v5 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          BOOL v5 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          BOOL v5 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          BOOL v5 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          BOOL v5 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          BOOL v5 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          BOOL v5 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          BOOL v5 = @"SAVE";
          break;
        case 464:
          BOOL v5 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          BOOL v5 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          BOOL v5 = @"TAP_TRY_NOW";
          break;
        case 467:
          BOOL v5 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          BOOL v5 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          BOOL v5 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          BOOL v5 = @"START_HIKING";
          break;
        case 471:
          BOOL v5 = @"EDIT_NOTE";
          break;
        case 472:
          BOOL v5 = @"CREATE_NOTE";
          break;
        case 473:
          BOOL v5 = @"DELETE_PIN";
          break;
        case 474:
          BOOL v5 = @"ADD_ROUTE";
          break;
        case 475:
          BOOL v5 = @"ADD_PIN";
          break;
        case 476:
          BOOL v5 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          BOOL v5 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          BOOL v5 = @"TAP_ITEM";
          break;
        case 479:
          BOOL v5 = @"DELETE_ROUTE";
          break;
        case 480:
          BOOL v5 = @"TAP_ROUTE";
          break;
        case 481:
          BOOL v5 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          BOOL v5 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          BOOL v5 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          BOOL v5 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          BOOL v5 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          BOOL v5 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          BOOL v5 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          BOOL v5 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          BOOL v5 = @"TAP_EXPAND";
          break;
        case 490:
          BOOL v5 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          BOOL v5 = @"PAN";
          break;
        case 1002:
          BOOL v5 = @"ZOOM_IN";
          break;
        case 1003:
          BOOL v5 = @"ZOOM_OUT";
          break;
        case 1004:
          BOOL v5 = @"ROTATE";
          break;
        case 1010:
          BOOL v5 = @"TAP_POI";
          break;
        case 1011:
          BOOL v5 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          BOOL v5 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          BOOL v5 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          BOOL v5 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          BOOL v5 = @"DROP_PIN";
          break;
        case 1031:
          BOOL v5 = @"TAP_INCIDENT";
          break;
        case 1032:
          BOOL v5 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          BOOL v5 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          BOOL v5 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          BOOL v5 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          BOOL v5 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          BOOL v5 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          BOOL v5 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          BOOL v5 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          BOOL v5 = @"TAP_COMPASS";
          break;
        case 1041:
          BOOL v5 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          BOOL v5 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          BOOL v5 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          BOOL v5 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          BOOL v5 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          BOOL v5 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          BOOL v5 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          BOOL v5 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          BOOL v5 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          BOOL v5 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          BOOL v5 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          BOOL v5 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          BOOL v5 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          BOOL v5 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          BOOL v5 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          BOOL v5 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          BOOL v5 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          BOOL v5 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          BOOL v5 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          BOOL v5 = @"ZOOM_RESET";
          break;
        case 1061:
          BOOL v5 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          BOOL v5 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          BOOL v5 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          BOOL v5 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          BOOL v5 = @"TAP_GEO";
          break;
        default:
          switch((int)action)
          {
            case 2001:
              BOOL v5 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              BOOL v5 = @"CLEAR_SEARCH";
              break;
            case 2003:
              BOOL v5 = @"CANCEL_SEARCH";
              break;
            case 2004:
              BOOL v5 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              BOOL v5 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              BOOL v5 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              BOOL v5 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              BOOL v5 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              BOOL v5 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              BOOL v5 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              BOOL v5 = @"REFRESH_SEARCH";
              break;
            case 2012:
              BOOL v5 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              BOOL v5 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              BOOL v5 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              BOOL v5 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              BOOL v5 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              BOOL v5 = @"PASTE_TEXT";
              break;
            case 2018:
              BOOL v5 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              BOOL v5 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              BOOL v5 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              BOOL v5 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              BOOL v5 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              BOOL v5 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              BOOL v5 = @"RETAINED_QUERY";
              break;
            case 2025:
              BOOL v5 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              BOOL v5 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              BOOL v5 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_56;
            case 2030:
              BOOL v5 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              BOOL v5 = @"TAP_SUBACTION";
              break;
            case 2032:
              BOOL v5 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              BOOL v5 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              BOOL v5 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              BOOL v5 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              BOOL v5 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              BOOL v5 = @"SHARE_ITEM";
              break;
            case 2038:
              BOOL v5 = @"HIDE_ITEM";
              break;
            case 2039:
              BOOL v5 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              BOOL v5 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              BOOL v5 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              BOOL v5 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              BOOL v5 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              BOOL v5 = @"ADD_FAVORITE";
              break;
            case 2045:
              BOOL v5 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              BOOL v5 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              BOOL v5 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              BOOL v5 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              BOOL v5 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              BOOL v5 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              BOOL v5 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              BOOL v5 = @"CREATE_FAVORITE";
              break;
            case 2053:
              BOOL v5 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              BOOL v5 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              BOOL v5 = @"EDIT_FAVORITE";
              break;
            case 2056:
              BOOL v5 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              BOOL v5 = @"SHARE_FAVORITE";
              break;
            case 2058:
              BOOL v5 = @"EDIT_FAVORITES";
              break;
            case 2059:
              BOOL v5 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              BOOL v5 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              BOOL v5 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              BOOL v5 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              BOOL v5 = @"REFINE_LOCATION";
              break;
            case 2064:
              BOOL v5 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              BOOL v5 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              BOOL v5 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              BOOL v5 = @"SHOW_COLLECTION";
              break;
            case 2068:
              BOOL v5 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              BOOL v5 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              BOOL v5 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              BOOL v5 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              BOOL v5 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              BOOL v5 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              BOOL v5 = @"EDIT_PHOTO";
              break;
            case 2075:
              BOOL v5 = @"SORT_BY_NAME";
              break;
            case 2076:
              BOOL v5 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              BOOL v5 = @"SORT_BY_RECENT";
              break;
            case 2078:
              BOOL v5 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              BOOL v5 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              BOOL v5 = @"MAP_SEARCH";
              break;
            case 2081:
              BOOL v5 = @"DELETE_COLLECTION";
              break;
            case 2082:
              BOOL v5 = @"SHARE_COLLECTION";
              break;
            case 2083:
              BOOL v5 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              BOOL v5 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              BOOL v5 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              BOOL v5 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              BOOL v5 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              BOOL v5 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              BOOL v5 = @"FOLLOW";
              break;
            case 2090:
              BOOL v5 = @"PUNCH_IN";
              break;
            case 2091:
              BOOL v5 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              BOOL v5 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              BOOL v5 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              BOOL v5 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              BOOL v5 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              BOOL v5 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              BOOL v5 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              BOOL v5 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              BOOL v5 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              BOOL v5 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              BOOL v5 = @"TAP_LOCATION";
              break;
            case 2102:
              BOOL v5 = @"TAP_PUBLISHER";
              break;
            case 2103:
              BOOL v5 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              BOOL v5 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              BOOL v5 = @"UNFOLLOW";
              break;
            case 2106:
              BOOL v5 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              BOOL v5 = @"ADD_VEHICLE";
              break;
            case 2108:
              BOOL v5 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              BOOL v5 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              BOOL v5 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              BOOL v5 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              BOOL v5 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              BOOL v5 = @"SELECT_VEHICLE";
              break;
            case 2114:
              BOOL v5 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              BOOL v5 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              BOOL v5 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              BOOL v5 = @"TAP_BANNER";
              break;
            case 2118:
              BOOL v5 = @"TAP_CONNECT";
              break;
            case 2119:
              BOOL v5 = @"TAP_CONTINUE";
              break;
            case 2120:
              BOOL v5 = @"TAP_EDIT";
              break;
            case 2121:
              BOOL v5 = @"TAP_NAME";
              break;
            case 2122:
              BOOL v5 = @"TAP_NOT_NOW";
              break;
            case 2123:
              BOOL v5 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              BOOL v5 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              BOOL v5 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              BOOL v5 = @"TAP_VEHICLE";
              break;
            case 2127:
              BOOL v5 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              BOOL v5 = @"UPDATE_NAME";
              break;
            case 2129:
              BOOL v5 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              BOOL v5 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              BOOL v5 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              BOOL v5 = @"USE_PHOTO";
              break;
            case 2133:
              BOOL v5 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              BOOL v5 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              BOOL v5 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              BOOL v5 = @"EDIT_RATING";
              break;
            case 2137:
              BOOL v5 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              BOOL v5 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              BOOL v5 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              BOOL v5 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              BOOL v5 = @"RETAKE_PHOTO";
              break;
            case 2142:
              BOOL v5 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              BOOL v5 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              BOOL v5 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              BOOL v5 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              BOOL v5 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              BOOL v5 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              BOOL v5 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              BOOL v5 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              BOOL v5 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              BOOL v5 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              BOOL v5 = @"REPORT_INCIDENT";
              break;
            case 2153:
              BOOL v5 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              BOOL v5 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              BOOL v5 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              BOOL v5 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              BOOL v5 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              BOOL v5 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              BOOL v5 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              BOOL v5 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              BOOL v5 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              BOOL v5 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              BOOL v5 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              BOOL v5 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              BOOL v5 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              BOOL v5 = @"DELETE_ITEM";
              break;
            case 2167:
              BOOL v5 = @"CANCEL_REMOVE";
              break;
            case 2168:
              BOOL v5 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              BOOL v5 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              BOOL v5 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              BOOL v5 = @"TRY_AGAIN";
              break;
            case 2172:
              BOOL v5 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              BOOL v5 = @"CHECK_EBIKE";
              break;
            case 2174:
              BOOL v5 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              BOOL v5 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              BOOL v5 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              BOOL v5 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              BOOL v5 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              BOOL v5 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              BOOL v5 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              BOOL v5 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              BOOL v5 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              BOOL v5 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              BOOL v5 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              BOOL v5 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              BOOL v5 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              BOOL v5 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              BOOL v5 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              BOOL v5 = @"CREATE_WIDGET";
              break;
            case 2190:
              BOOL v5 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              BOOL v5 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              BOOL v5 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              BOOL v5 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              BOOL v5 = @"LPR_HARD_STOP";
              break;
            case 2195:
              BOOL v5 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              BOOL v5 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              BOOL v5 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              BOOL v5 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              BOOL v5 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              BOOL v5 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)action)
              {
                case 3001:
                  BOOL v5 = @"START_NAV";
                  break;
                case 3002:
                  BOOL v5 = @"END_NAV";
                  break;
                case 3003:
                  BOOL v5 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  BOOL v5 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  BOOL v5 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  BOOL v5 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  BOOL v5 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  BOOL v5 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  BOOL v5 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  BOOL v5 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  BOOL v5 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  BOOL v5 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  BOOL v5 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  BOOL v5 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  BOOL v5 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  BOOL v5 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  BOOL v5 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  BOOL v5 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  BOOL v5 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  BOOL v5 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  BOOL v5 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  BOOL v5 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  BOOL v5 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  BOOL v5 = @"CHECK_BUS";
                  break;
                case 3025:
                  BOOL v5 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  BOOL v5 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  BOOL v5 = @"CHECK_FERRY";
                  break;
                case 3028:
                  BOOL v5 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  BOOL v5 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  BOOL v5 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  BOOL v5 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  BOOL v5 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  BOOL v5 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  BOOL v5 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  BOOL v5 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  BOOL v5 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  BOOL v5 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  BOOL v5 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  BOOL v5 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  BOOL v5 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  BOOL v5 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  BOOL v5 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  BOOL v5 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  BOOL v5 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  BOOL v5 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  BOOL v5 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  BOOL v5 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  BOOL v5 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  BOOL v5 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  BOOL v5 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  BOOL v5 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  BOOL v5 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  BOOL v5 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  BOOL v5 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  BOOL v5 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  BOOL v5 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  BOOL v5 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  BOOL v5 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  BOOL v5 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  BOOL v5 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  BOOL v5 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  BOOL v5 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  BOOL v5 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  BOOL v5 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  BOOL v5 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  BOOL v5 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  BOOL v5 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  BOOL v5 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  BOOL v5 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  BOOL v5 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  BOOL v5 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  BOOL v5 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  BOOL v5 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  BOOL v5 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  BOOL v5 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  BOOL v5 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  BOOL v5 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  BOOL v5 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  BOOL v5 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  BOOL v5 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  BOOL v5 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  BOOL v5 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  BOOL v5 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  BOOL v5 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  BOOL v5 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  BOOL v5 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  BOOL v5 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  BOOL v5 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_56;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_whiteListedSiriListActionAsString:(int)a3
{
  if (a3 == 2007)
  {
    uint64_t action = self->_action;
    if ((int)action > 4000)
    {
      if ((int)action <= 10100)
      {
        if ((int)action > 7000)
        {
          switch((int)action)
          {
            case 9001:
              v4 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              v4 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              v4 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              v4 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              v4 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              v4 = @"OPEN_SEARCH";
              break;
            case 9007:
              v4 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              v4 = @"PAN_LEFT";
              break;
            case 9009:
              v4 = @"PAN_UP";
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_51;
            case 9011:
              v4 = @"PAN_DOWN";
              break;
            case 9012:
              v4 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              v4 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              v4 = @"OPEN_FAVORITES";
              break;
            case 9015:
              v4 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              v4 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              v4 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              v4 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              v4 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              v4 = @"SHARE_DESTINATION";
              break;
            case 9021:
              v4 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              v4 = @"SHARE_ETA";
              break;
            case 9023:
              v4 = @"SELECT_GROUP";
              break;
            case 9024:
              v4 = @"DESELECT_GROUP";
              break;
            case 9025:
              v4 = @"SELECT_CONTACT";
              break;
            case 9026:
              v4 = @"DESELECT_CONTACT";
              break;
            case 9027:
              v4 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              v4 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              v4 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              v4 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              v4 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              v4 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              v4 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              v4 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              v4 = @"SCROLL_FORWARD";
              break;
            case 9037:
              v4 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              v4 = @"TAP_LESS";
              break;
            case 9040:
              v4 = @"TAP_MORE";
              break;
            case 9101:
              v4 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              v4 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              v4 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              v4 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              v4 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              v4 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)action)
              {
                case 7001:
                  v4 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  v4 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  v4 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  v4 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  v4 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  v4 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  v4 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  v4 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  v4 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  v4 = @"GET_TICKETS";
                  break;
                case 7015:
                  v4 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  v4 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  v4 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  v4 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  v4 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  v4 = @"VIEW_BANNER";
                  break;
                case 7024:
                  v4 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  v4 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  v4 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  v4 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  v4 = @"WAITLIST";
                  break;
                case 7029:
                  v4 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  v4 = @"RESERVE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 8001:
                      v4 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      v4 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      v4 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      v4 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      v4 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      v4 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      v4 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)action)
          {
            case 6003:
              v4 = @"GET_DIRECTIONS";
              break;
            case 6004:
              v4 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              v4 = @"REMOVE_PIN";
              break;
            case 6006:
              v4 = @"TAP_PHOTO";
              break;
            case 6007:
              v4 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              v4 = @"TAP_ADDRESS";
              break;
            case 6009:
              v4 = @"CALL";
              break;
            case 6010:
              v4 = @"TAP_URL";
              break;
            case 6011:
              v4 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              v4 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              v4 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_51;
            case 6015:
              v4 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              v4 = @"ADD_CONTACT";
              break;
            case 6018:
              v4 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              v4 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              v4 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              v4 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              v4 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              v4 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              v4 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              v4 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              v4 = @"EDIT_LOCATION";
              break;
            case 6029:
              v4 = @"ADD_PHOTO";
              break;
            case 6031:
              v4 = @"RETAKE";
              break;
            case 6032:
              v4 = @"ADD_NOTE";
              break;
            case 6033:
              v4 = @"REMOVE_CAR";
              break;
            case 6034:
              v4 = @"EDIT_NAME";
              break;
            case 6036:
              v4 = @"RESERVE_TABLE";
              break;
            case 6037:
              v4 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              v4 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              v4 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              v4 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              v4 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              v4 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              v4 = @"VIEW_CONTACT";
              break;
            case 6045:
              v4 = @"CHAT";
              break;
            case 6046:
              v4 = @"FIND_STORES";
              break;
            case 6047:
              v4 = @"TAP_PARENT";
              break;
            case 6048:
              v4 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              v4 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              v4 = @"PUNCH_OUT";
              break;
            case 6051:
              v4 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              v4 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              v4 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              v4 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              v4 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              v4 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              v4 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              v4 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              v4 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              v4 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              v4 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              v4 = @"TAP_LANDMARK";
              break;
            case 6072:
              v4 = @"TAP_SCENE";
              break;
            case 6073:
              v4 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              v4 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              v4 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              v4 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              v4 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              v4 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              v4 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              v4 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              v4 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              v4 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              v4 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              v4 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              v4 = @"TAP_VIEW_APP";
              break;
            case 6090:
              v4 = @"TAP_APP_CLIP";
              break;
            case 6091:
              v4 = @"DEAD_BATTERY";
              break;
            case 6092:
              v4 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              v4 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              v4 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              v4 = @"PAUSE_ROUTE";
              break;
            case 6097:
              v4 = @"TAP_ADD_STOP";
              break;
            case 6098:
              v4 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              v4 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              v4 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              v4 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              v4 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              v4 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              v4 = @"SHOW_INCIDENT";
              break;
            case 6105:
              v4 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              v4 = @"ORDER_DELIVERY";
              break;
            case 6107:
              v4 = @"VIEW_MENU";
              break;
            case 6108:
              v4 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              v4 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              v4 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)action)
              {
                case 5001:
                  v4 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  v4 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  v4 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  v4 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  v4 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  v4 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  v4 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  v4 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  v4 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  v4 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  v4 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  v4 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  v4 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  v4 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_51;
                case 5016:
                  v4 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  v4 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  v4 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  v4 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  v4 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  v4 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  v4 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  v4 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  v4 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  v4 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  v4 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  v4 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  v4 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  v4 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  v4 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  v4 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  v4 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  v4 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  v4 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  v4 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  v4 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  v4 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  v4 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 4001:
                      v4 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      v4 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      v4 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      v4 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      v4 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      v4 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)action > 13000)
      {
        if ((int)action <= 16000)
        {
          if ((int)action <= 15000)
          {
            switch((int)action)
            {
              case 14001:
                v4 = @"VIEW_APP";
                break;
              case 14002:
                v4 = @"ENABLE";
                break;
              case 14003:
                v4 = @"BOOK_RIDE";
                break;
              case 14004:
                v4 = @"REQUEST_RIDE";
                break;
              case 14005:
                v4 = @"CONTACT_DRIVER";
                break;
              case 14006:
                v4 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                v4 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                v4 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                v4 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)action)
                {
                  case 13001:
                    v4 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    v4 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    v4 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    v4 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    v4 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    v4 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    v4 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
          }
          else
          {
            switch(action)
            {
              case 0x3A99:
                v4 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                v4 = @"ORB_POP";
                break;
              case 0x3A9B:
                v4 = @"ORB_DISMISS";
                break;
              default:
LABEL_51:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", action);
                v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)action)
          {
            case 17001:
              v4 = @"START_DRAG";
              break;
            case 17002:
              v4 = @"CANCEL_DRAG";
              break;
            case 17003:
              v4 = @"COMPLETE_DRAG";
              break;
            case 17004:
              v4 = @"START_DROP";
              break;
            case 17005:
              v4 = @"CANCEL_DROP";
              break;
            case 17006:
              v4 = @"COMPLETE_DROP";
              break;
            case 17007:
              v4 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              v4 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              v4 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              v4 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              v4 = @"CALLOUT_INFO";
              break;
            case 17013:
              v4 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              v4 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              v4 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              v4 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              v4 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              v4 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              v4 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              v4 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              v4 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              v4 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              v4 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              v4 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              v4 = @"INFO_CONTACTS";
              break;
            case 17032:
              v4 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              v4 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              v4 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              v4 = @"INFO_DISMISS";
              break;
            case 17036:
              v4 = @"INFO_INFO";
              break;
            case 17037:
              v4 = @"INFO_PHOTOS";
              break;
            case 17038:
              v4 = @"INFO_REVIEWS";
              break;
            case 17039:
              v4 = @"INFO_SHARE";
              break;
            case 17040:
              v4 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              v4 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              v4 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              v4 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              v4 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              v4 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              v4 = @"INFO_YELP";
              break;
            case 17047:
              v4 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              v4 = @"MAP_3D_OFF";
              break;
            case 17049:
              v4 = @"MAP_3D_ON";
              break;
            case 17050:
              v4 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              v4 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              v4 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              v4 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              v4 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              v4 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              v4 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              v4 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              v4 = @"MAP_TAP_LINE";
              break;
            case 17061:
              v4 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              v4 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              v4 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              v4 = @"NAV_CLEAR";
              break;
            case 17068:
              v4 = @"NAV_LIST";
              break;
            case 17069:
              v4 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              v4 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              v4 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              v4 = @"ORB_MENU_CALL";
              break;
            case 17074:
              v4 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              v4 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              v4 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              v4 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              v4 = @"ORB_MENU_URL";
              break;
            case 17080:
              v4 = @"ORB_PRESS";
              break;
            case 17081:
              v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              v4 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              v4 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              v4 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              v4 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              v4 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              v4 = @"SEARCH_BEGIN";
              break;
            case 17092:
              v4 = @"SEARCH_CANCEL";
              break;
            case 17093:
              v4 = @"SEARCH_SELECT";
              break;
            case 17094:
              v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              v4 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              v4 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              v4 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              v4 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              v4 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              v4 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              v4 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              v4 = @"CALLOUT_NAV";
              break;
            case 17107:
              v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              v4 = @"MAP_TAP_POI";
              break;
            default:
              if (action == 16001)
              {
                v4 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (action != 90010) {
                  goto LABEL_51;
                }
                v4 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)action)
        {
          case 10101:
            v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            v4 = @"RAP_CANCEL";
            break;
          case 10110:
            v4 = @"RAP_NEXT";
            break;
          case 10111:
            v4 = @"RAP_BACK";
            break;
          case 10112:
            v4 = @"RAP_SEND";
            break;
          case 10113:
            v4 = @"RAP_SKIP";
            break;
          case 10114:
            v4 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            v4 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            v4 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            v4 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            v4 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            v4 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            v4 = @"RAP_HOME";
            break;
          case 10123:
            v4 = @"RAP_WORK";
            break;
          case 10124:
            v4 = @"RAP_OTHER";
            break;
          case 10125:
            v4 = @"RAP_LOCATION";
            break;
          case 10126:
            v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            v4 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            v4 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            v4 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            v4 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            v4 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            v4 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            v4 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            v4 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            v4 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            v4 = @"RAP_PAN_MAP";
            break;
          case 10142:
            v4 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            v4 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            v4 = @"RAP_ADD_POI";
            break;
          case 10145:
            v4 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            v4 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            v4 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            v4 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            v4 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            v4 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            v4 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            v4 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            v4 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            v4 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            v4 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            v4 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            v4 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            v4 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            v4 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            v4 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            v4 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            v4 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            v4 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            v4 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            v4 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            v4 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            v4 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            v4 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            v4 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            v4 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            v4 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            v4 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            v4 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            v4 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            v4 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            v4 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            v4 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            v4 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            v4 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            v4 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)action)
            {
              case 11001:
                v4 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                v4 = @"TASK_READY";
                break;
              case 11003:
                v4 = @"TAP_SEARCH";
                break;
              case 11004:
                v4 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                v4 = @"SHOW_NEARBY";
                break;
              case 11006:
                v4 = @"TAP_NEARBY";
                break;
              case 11007:
                v4 = @"TAP_PROACTIVE";
                break;
              case 11008:
                v4 = @"FORCE_PRESS";
                break;
              case 11009:
                v4 = @"TAP_CONTACTS";
                break;
              case 11010:
                v4 = @"TAP_TRANSIT";
                break;
              case 11011:
                v4 = @"TAP_DICTATION";
                break;
              case 11012:
                v4 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                v4 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                v4 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                v4 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                v4 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                v4 = @"START_NAV_AUTO";
                break;
              case 11018:
                v4 = @"TAP_RECENT";
                break;
              case 11019:
                v4 = @"TAP_FAVORITE";
                break;
              case 11020:
                v4 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                v4 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                v4 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                v4 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                v4 = @"NAV_UNMUTE";
                break;
              case 11025:
                v4 = @"NAV_MUTE";
                break;
              case 11026:
                v4 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                v4 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                v4 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)action)
                {
                  case 12001:
                    v4 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    v4 = @"SELECT_TIME";
                    break;
                  case 12003:
                    v4 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    v4 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    v4 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    v4 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    v4 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    v4 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    v4 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    v4 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v4 = @"UI_ACTION_UNKNOWN";
      switch((int)action)
      {
        case 0:
          break;
        case 1:
          v4 = @"PULL_UP";
          break;
        case 2:
          v4 = @"PULL_DOWN";
          break;
        case 3:
          v4 = @"TAP";
          break;
        case 4:
          v4 = @"CLOSE";
          break;
        case 5:
          v4 = @"SWIPE_PREV";
          break;
        case 6:
          v4 = @"SWIPE_NEXT";
          break;
        case 7:
          v4 = @"SCROLL_UP";
          break;
        case 8:
          v4 = @"SCROLL_DOWN";
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_51;
        case 10:
          v4 = @"SHOW_MORE";
          break;
        case 11:
          v4 = @"SHOW_LESS";
          break;
        case 12:
          v4 = @"SWIPE_LEFT";
          break;
        case 13:
          v4 = @"SWIPE_RIGHT";
          break;
        case 14:
          v4 = @"MINIMIZE";
          break;
        case 15:
          v4 = @"TAP_PREV";
          break;
        case 16:
          v4 = @"TAP_NEXT";
          break;
        case 17:
          v4 = @"SUBMIT";
          break;
        case 18:
          v4 = @"CANCEL";
          break;
        case 19:
          v4 = @"ENTER_MAPS";
          break;
        case 20:
          v4 = @"EXIT_MAPS";
          break;
        case 21:
          v4 = @"REVEAL";
          break;
        case 22:
          v4 = @"OPEN_NEW_TAB";
          break;
        case 25:
          v4 = @"BACK";
          break;
        case 26:
          v4 = @"ACTIVATE";
          break;
        case 27:
          v4 = @"DEACTIVATE";
          break;
        case 28:
          v4 = @"AGREE";
          break;
        case 29:
          v4 = @"DISAGREE";
          break;
        case 30:
          v4 = @"SKIP_ANSWER";
          break;
        case 31:
          v4 = @"EXPAND";
          break;
        case 32:
          v4 = @"COLLAPSE";
          break;
        case 33:
          v4 = @"ENTER";
          break;
        case 34:
          v4 = @"EXIT";
          break;
        case 35:
          v4 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          v4 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          v4 = @"TOGGLE_ON";
          break;
        case 38:
          v4 = @"TOGGLE_OFF";
          break;
        case 39:
          v4 = @"LONG_PRESS";
          break;
        case 40:
          v4 = @"CLICK";
          break;
        case 41:
          v4 = @"TAP_DONE";
          break;
        case 42:
          v4 = @"TAP_CLOSE";
          break;
        case 43:
          v4 = @"SCROLL_LEFT";
          break;
        case 44:
          v4 = @"SCROLL_RIGHT";
          break;
        case 45:
          v4 = @"DISPLAY";
          break;
        case 46:
          v4 = @"OPEN_IN_APP";
          break;
        case 47:
          v4 = @"CONCEAL";
          break;
        case 48:
          v4 = @"TAP_DELETE";
          break;
        case 49:
          v4 = @"TAP_FILTER";
          break;
        case 50:
          v4 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          v4 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          v4 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          v4 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          v4 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          v4 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          v4 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          v4 = @"SHARE_PHOTO";
          break;
        case 59:
          v4 = @"TAP_KEEP_OFF";
          break;
        case 60:
          v4 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          v4 = @"TAP_TURN_ON";
          break;
        case 63:
          v4 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          v4 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          v4 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          v4 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          v4 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          v4 = @"RESUME_ROUTE";
          break;
        case 75:
          v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          v4 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          v4 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          v4 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          v4 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          v4 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          v4 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          v4 = @"REPORT_PHOTO";
          break;
        case 87:
          v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          v4 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          v4 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          v4 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          v4 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          v4 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          v4 = @"NEXT";
          break;
        case 99:
          v4 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          v4 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          v4 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          v4 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          v4 = @"CLEAR_INCIDENT";
          break;
        case 107:
          v4 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          v4 = @"DISMISS_INCIDENT";
          break;
        case 109:
          v4 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          v4 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          v4 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          v4 = @"TAP_SHORTCUT";
          break;
        case 117:
          v4 = @"BLOCK_CONTACT";
          break;
        case 118:
          v4 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          v4 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          v4 = @"TAP_DISMISS";
          break;
        case 126:
          v4 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          v4 = @"TAP_OK";
          break;
        case 128:
          v4 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          v4 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          v4 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          v4 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          v4 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          v4 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          v4 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          v4 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          v4 = @"HIDE_DETAILS";
          break;
        case 141:
          v4 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          v4 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          v4 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          v4 = @"TAP_EXIT";
          break;
        case 147:
          v4 = @"TAP_CITY_MENU";
          break;
        case 148:
          v4 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          v4 = @"TAP_ICLOUD";
          break;
        case 151:
          v4 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          v4 = @"TAP_FAVORITES";
          break;
        case 153:
          v4 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          v4 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          v4 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          v4 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          v4 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          v4 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          v4 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          v4 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          v4 = @"TAP_ACCOUNT";
          break;
        case 173:
          v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          v4 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          v4 = @"TAP_REPORTS";
          break;
        case 179:
          v4 = @"TAP_RATINGS";
          break;
        case 180:
          v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          v4 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          v4 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          v4 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          v4 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          v4 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          v4 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          v4 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          v4 = @"TAP_RATING";
          break;
        case 192:
          v4 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          v4 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          v4 = @"TAP_MY_GUIDES";
          break;
        case 200:
          v4 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          v4 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          v4 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          v4 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          v4 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          v4 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          v4 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          v4 = @"SWITCH_ON_HFP";
          break;
        case 209:
          v4 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          v4 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          v4 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          v4 = @"RESUME";
          break;
        case 213:
          v4 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          v4 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          v4 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          v4 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          v4 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          v4 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          v4 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          v4 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          v4 = @"RAP_ADD_MAP";
          break;
        case 223:
          v4 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          v4 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          v4 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          v4 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          v4 = @"RAP_BAD_TRIP";
          break;
        case 229:
          v4 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          v4 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          v4 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          v4 = @"RAP_GUIDE";
          break;
        case 233:
          v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          v4 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          v4 = @"TAP_SEE_MORE";
          break;
        case 238:
          v4 = @"RAP_IN_REVIEW";
          break;
        case 239:
          v4 = @"TAP_OPEN_MENU";
          break;
        case 240:
          v4 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          v4 = @"TAP_PIN_LINE";
          break;
        case 242:
          v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          v4 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          v4 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          v4 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          v4 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          v4 = @"ADVISORY_ALERT";
          break;
        case 249:
          v4 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          v4 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          v4 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          v4 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          v4 = @"MENU_UNPIN";
          break;
        case 254:
          v4 = @"MENU_PIN";
          break;
        case 255:
          v4 = @"SWIPE_PIN";
          break;
        case 256:
          v4 = @"SWIPE_UNPIN";
          break;
        case 257:
          v4 = @"TAP_MEDIA_APP";
          break;
        case 258:
          v4 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          v4 = @"TAP_MEDIA";
          break;
        case 260:
          v4 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          v4 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          v4 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          v4 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          v4 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          v4 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          v4 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          v4 = @"TAP_ALLOW";
          break;
        case 271:
          v4 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          v4 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          v4 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          v4 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          v4 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          v4 = @"EDIT_WAYPOINT";
          break;
        case 278:
          v4 = @"CLEAR_TEXT";
          break;
        case 279:
          v4 = @"REORDER_WAYPOINT";
          break;
        case 280:
          v4 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          v4 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          v4 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          v4 = @"RAP_INLINE_ADD";
          break;
        case 287:
          v4 = @"RAP_TAP_EDIT";
          break;
        case 288:
          v4 = @"CLAIM_BUSINESS";
          break;
        case 289:
          v4 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          v4 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          v4 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          v4 = @"NEXT_STOP";
          break;
        case 293:
          v4 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          v4 = @"REMOVE_STOP";
          break;
        case 295:
          v4 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          v4 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          v4 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          v4 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          v4 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          v4 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          v4 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          v4 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          v4 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          v4 = @"FILTER_EV";
          break;
        case 310:
          v4 = @"FILTER_SURCHARGE";
          break;
        case 311:
          v4 = @"FILTER_PREFER";
          break;
        case 312:
          v4 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          v4 = @"FILTER_AVOID";
          break;
        case 314:
          v4 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          v4 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          v4 = @"FILTER_IC_FARES";
          break;
        case 317:
          v4 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          v4 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          v4 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          v4 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          v4 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          v4 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          v4 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          v4 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          v4 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          v4 = @"DELETE_PHOTO";
          break;
        case 332:
          v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          v4 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          v4 = @"ADD_STOP";
          break;
        case 338:
          v4 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          v4 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          v4 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          v4 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          v4 = @"SUBMIT_RATINGS";
          break;
        case 344:
          v4 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          v4 = @"FILTER_EBIKE";
          break;
        case 356:
          v4 = @"ADD_STOP_SIRI";
          break;
        case 357:
          v4 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          v4 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          v4 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          v4 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          v4 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          v4 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          v4 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          v4 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          v4 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          v4 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          v4 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          v4 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          v4 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          v4 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          v4 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          v4 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          v4 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          v4 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          v4 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          v4 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          v4 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          v4 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          v4 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          v4 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          v4 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          v4 = @"START_ETA_SHARING";
          break;
        case 401:
          v4 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          v4 = @"STOP_ETA_SHARING";
          break;
        case 403:
          v4 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          v4 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          v4 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          v4 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          v4 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          v4 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          v4 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          v4 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          v4 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          v4 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          v4 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          v4 = @"SELECT_CONTROLS";
          break;
        case 418:
          v4 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          v4 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          v4 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          v4 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          v4 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          v4 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          v4 = @"TAP_MAP";
          break;
        case 427:
          v4 = @"SWIPE_DOWN";
          break;
        case 428:
          v4 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          v4 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          v4 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          v4 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          v4 = @"TAP_AUDIO";
          break;
        case 433:
          v4 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          v4 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          v4 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          v4 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          v4 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          v4 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          v4 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          v4 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          v4 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          v4 = @"UPDATE_COLOR";
          break;
        case 443:
          v4 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          v4 = @"UNSELECT_NETWORK";
          break;
        case 445:
          v4 = @"TAP_BACK";
          break;
        case 446:
          v4 = @"TAP_CANCEL";
          break;
        case 447:
          v4 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          v4 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          v4 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          v4 = @"SELECT_NETWORK";
          break;
        case 451:
          v4 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          v4 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          v4 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          v4 = @"FILTER_NETWORK";
          break;
        case 455:
          v4 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          v4 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          v4 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          v4 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          v4 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          v4 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          v4 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          v4 = @"SAVE";
          break;
        case 464:
          v4 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          v4 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          v4 = @"TAP_TRY_NOW";
          break;
        case 467:
          v4 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          v4 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          v4 = @"START_HIKING";
          break;
        case 471:
          v4 = @"EDIT_NOTE";
          break;
        case 472:
          v4 = @"CREATE_NOTE";
          break;
        case 473:
          v4 = @"DELETE_PIN";
          break;
        case 474:
          v4 = @"ADD_ROUTE";
          break;
        case 475:
          v4 = @"ADD_PIN";
          break;
        case 476:
          v4 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          v4 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          v4 = @"TAP_ITEM";
          break;
        case 479:
          v4 = @"DELETE_ROUTE";
          break;
        case 480:
          v4 = @"TAP_ROUTE";
          break;
        case 481:
          v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          v4 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          v4 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          v4 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          v4 = @"TAP_EXPAND";
          break;
        case 490:
          v4 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          v4 = @"PAN";
          break;
        case 1002:
          v4 = @"ZOOM_IN";
          break;
        case 1003:
          v4 = @"ZOOM_OUT";
          break;
        case 1004:
          v4 = @"ROTATE";
          break;
        case 1010:
          v4 = @"TAP_POI";
          break;
        case 1011:
          v4 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          v4 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          v4 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          v4 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          v4 = @"DROP_PIN";
          break;
        case 1031:
          v4 = @"TAP_INCIDENT";
          break;
        case 1032:
          v4 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          v4 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          v4 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          v4 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          v4 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          v4 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          v4 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          v4 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          v4 = @"TAP_COMPASS";
          break;
        case 1041:
          v4 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          v4 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          v4 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          v4 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          v4 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          v4 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          v4 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          v4 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          v4 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          v4 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          v4 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          v4 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          v4 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          v4 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          v4 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          v4 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          v4 = @"ZOOM_RESET";
          break;
        case 1061:
          v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          v4 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          v4 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          v4 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          v4 = @"TAP_GEO";
          break;
        default:
          switch((int)action)
          {
            case 2001:
              v4 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              v4 = @"CLEAR_SEARCH";
              break;
            case 2003:
              v4 = @"CANCEL_SEARCH";
              break;
            case 2004:
              v4 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              v4 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              v4 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              v4 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              v4 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              v4 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              v4 = @"REFRESH_SEARCH";
              break;
            case 2012:
              v4 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              v4 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              v4 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              v4 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              v4 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              v4 = @"PASTE_TEXT";
              break;
            case 2018:
              v4 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              v4 = @"RETAINED_QUERY";
              break;
            case 2025:
              v4 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              v4 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              v4 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_51;
            case 2030:
              v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              v4 = @"TAP_SUBACTION";
              break;
            case 2032:
              v4 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              v4 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              v4 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              v4 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              v4 = @"SHARE_ITEM";
              break;
            case 2038:
              v4 = @"HIDE_ITEM";
              break;
            case 2039:
              v4 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              v4 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              v4 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              v4 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              v4 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              v4 = @"ADD_FAVORITE";
              break;
            case 2045:
              v4 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              v4 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              v4 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              v4 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              v4 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              v4 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              v4 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              v4 = @"CREATE_FAVORITE";
              break;
            case 2053:
              v4 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              v4 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              v4 = @"EDIT_FAVORITE";
              break;
            case 2056:
              v4 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              v4 = @"SHARE_FAVORITE";
              break;
            case 2058:
              v4 = @"EDIT_FAVORITES";
              break;
            case 2059:
              v4 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              v4 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              v4 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              v4 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              v4 = @"REFINE_LOCATION";
              break;
            case 2064:
              v4 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              v4 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              v4 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              v4 = @"SHOW_COLLECTION";
              break;
            case 2068:
              v4 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              v4 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              v4 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              v4 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              v4 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              v4 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              v4 = @"EDIT_PHOTO";
              break;
            case 2075:
              v4 = @"SORT_BY_NAME";
              break;
            case 2076:
              v4 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              v4 = @"SORT_BY_RECENT";
              break;
            case 2078:
              v4 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              v4 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              v4 = @"MAP_SEARCH";
              break;
            case 2081:
              v4 = @"DELETE_COLLECTION";
              break;
            case 2082:
              v4 = @"SHARE_COLLECTION";
              break;
            case 2083:
              v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              v4 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              v4 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              v4 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              v4 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              v4 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              v4 = @"FOLLOW";
              break;
            case 2090:
              v4 = @"PUNCH_IN";
              break;
            case 2091:
              v4 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              v4 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              v4 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              v4 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              v4 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              v4 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              v4 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              v4 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              v4 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              v4 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              v4 = @"TAP_LOCATION";
              break;
            case 2102:
              v4 = @"TAP_PUBLISHER";
              break;
            case 2103:
              v4 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              v4 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              v4 = @"UNFOLLOW";
              break;
            case 2106:
              v4 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              v4 = @"ADD_VEHICLE";
              break;
            case 2108:
              v4 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              v4 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              v4 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              v4 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              v4 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              v4 = @"SELECT_VEHICLE";
              break;
            case 2114:
              v4 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              v4 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              v4 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              v4 = @"TAP_BANNER";
              break;
            case 2118:
              v4 = @"TAP_CONNECT";
              break;
            case 2119:
              v4 = @"TAP_CONTINUE";
              break;
            case 2120:
              v4 = @"TAP_EDIT";
              break;
            case 2121:
              v4 = @"TAP_NAME";
              break;
            case 2122:
              v4 = @"TAP_NOT_NOW";
              break;
            case 2123:
              v4 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              v4 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              v4 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              v4 = @"TAP_VEHICLE";
              break;
            case 2127:
              v4 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              v4 = @"UPDATE_NAME";
              break;
            case 2129:
              v4 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              v4 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              v4 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              v4 = @"USE_PHOTO";
              break;
            case 2133:
              v4 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              v4 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              v4 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              v4 = @"EDIT_RATING";
              break;
            case 2137:
              v4 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              v4 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              v4 = @"RETAKE_PHOTO";
              break;
            case 2142:
              v4 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              v4 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              v4 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              v4 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              v4 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              v4 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              v4 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              v4 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              v4 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              v4 = @"REPORT_INCIDENT";
              break;
            case 2153:
              v4 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              v4 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              v4 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              v4 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              v4 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              v4 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              v4 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              v4 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              v4 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              v4 = @"DELETE_ITEM";
              break;
            case 2167:
              v4 = @"CANCEL_REMOVE";
              break;
            case 2168:
              v4 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              v4 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              v4 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              v4 = @"TRY_AGAIN";
              break;
            case 2172:
              v4 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              v4 = @"CHECK_EBIKE";
              break;
            case 2174:
              v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              v4 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              v4 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              v4 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              v4 = @"CREATE_WIDGET";
              break;
            case 2190:
              v4 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              v4 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              v4 = @"LPR_HARD_STOP";
              break;
            case 2195:
              v4 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              v4 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              v4 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)action)
              {
                case 3001:
                  v4 = @"START_NAV";
                  break;
                case 3002:
                  v4 = @"END_NAV";
                  break;
                case 3003:
                  v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  v4 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  v4 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  v4 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  v4 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  v4 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  v4 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  v4 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  v4 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  v4 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  v4 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  v4 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  v4 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  v4 = @"CHECK_BUS";
                  break;
                case 3025:
                  v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  v4 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  v4 = @"CHECK_FERRY";
                  break;
                case 3028:
                  v4 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  v4 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  v4 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  v4 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  v4 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  v4 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  v4 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  v4 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  v4 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  v4 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  v4 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  v4 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  v4 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  v4 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  v4 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  v4 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  v4 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  v4 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  v4 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  v4 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  v4 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  v4 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  v4 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  v4 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  v4 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  v4 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  v4 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  v4 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  v4 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  v4 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  v4 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  v4 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  v4 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  v4 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  v4 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  v4 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  v4 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  v4 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  v4 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  v4 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  v4 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_51;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_whiteListedBrowseCategoryActionAsString:(int)a3
{
  if (a3 == 2004)
  {
    uint64_t action = self->_action;
    if ((int)action > 4000)
    {
      if ((int)action <= 10100)
      {
        if ((int)action > 7000)
        {
          switch((int)action)
          {
            case 9001:
              v4 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              v4 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              v4 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              v4 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              v4 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              v4 = @"OPEN_SEARCH";
              break;
            case 9007:
              v4 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              v4 = @"PAN_LEFT";
              break;
            case 9009:
              v4 = @"PAN_UP";
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_51;
            case 9011:
              v4 = @"PAN_DOWN";
              break;
            case 9012:
              v4 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              v4 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              v4 = @"OPEN_FAVORITES";
              break;
            case 9015:
              v4 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              v4 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              v4 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              v4 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              v4 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              v4 = @"SHARE_DESTINATION";
              break;
            case 9021:
              v4 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              v4 = @"SHARE_ETA";
              break;
            case 9023:
              v4 = @"SELECT_GROUP";
              break;
            case 9024:
              v4 = @"DESELECT_GROUP";
              break;
            case 9025:
              v4 = @"SELECT_CONTACT";
              break;
            case 9026:
              v4 = @"DESELECT_CONTACT";
              break;
            case 9027:
              v4 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              v4 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              v4 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              v4 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              v4 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              v4 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              v4 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              v4 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              v4 = @"SCROLL_FORWARD";
              break;
            case 9037:
              v4 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              v4 = @"TAP_LESS";
              break;
            case 9040:
              v4 = @"TAP_MORE";
              break;
            case 9101:
              v4 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              v4 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              v4 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              v4 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              v4 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              v4 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)action)
              {
                case 7001:
                  v4 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  v4 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  v4 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  v4 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  v4 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  v4 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  v4 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  v4 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  v4 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  v4 = @"GET_TICKETS";
                  break;
                case 7015:
                  v4 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  v4 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  v4 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  v4 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  v4 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  v4 = @"VIEW_BANNER";
                  break;
                case 7024:
                  v4 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  v4 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  v4 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  v4 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  v4 = @"WAITLIST";
                  break;
                case 7029:
                  v4 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  v4 = @"RESERVE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 8001:
                      v4 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      v4 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      v4 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      v4 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      v4 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      v4 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      v4 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)action)
          {
            case 6003:
              v4 = @"GET_DIRECTIONS";
              break;
            case 6004:
              v4 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              v4 = @"REMOVE_PIN";
              break;
            case 6006:
              v4 = @"TAP_PHOTO";
              break;
            case 6007:
              v4 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              v4 = @"TAP_ADDRESS";
              break;
            case 6009:
              v4 = @"CALL";
              break;
            case 6010:
              v4 = @"TAP_URL";
              break;
            case 6011:
              v4 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              v4 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              v4 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_51;
            case 6015:
              v4 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              v4 = @"ADD_CONTACT";
              break;
            case 6018:
              v4 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              v4 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              v4 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              v4 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              v4 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              v4 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              v4 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              v4 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              v4 = @"EDIT_LOCATION";
              break;
            case 6029:
              v4 = @"ADD_PHOTO";
              break;
            case 6031:
              v4 = @"RETAKE";
              break;
            case 6032:
              v4 = @"ADD_NOTE";
              break;
            case 6033:
              v4 = @"REMOVE_CAR";
              break;
            case 6034:
              v4 = @"EDIT_NAME";
              break;
            case 6036:
              v4 = @"RESERVE_TABLE";
              break;
            case 6037:
              v4 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              v4 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              v4 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              v4 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              v4 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              v4 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              v4 = @"VIEW_CONTACT";
              break;
            case 6045:
              v4 = @"CHAT";
              break;
            case 6046:
              v4 = @"FIND_STORES";
              break;
            case 6047:
              v4 = @"TAP_PARENT";
              break;
            case 6048:
              v4 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              v4 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              v4 = @"PUNCH_OUT";
              break;
            case 6051:
              v4 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              v4 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              v4 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              v4 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              v4 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              v4 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              v4 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              v4 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              v4 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              v4 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              v4 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              v4 = @"TAP_LANDMARK";
              break;
            case 6072:
              v4 = @"TAP_SCENE";
              break;
            case 6073:
              v4 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              v4 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              v4 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              v4 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              v4 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              v4 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              v4 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              v4 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              v4 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              v4 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              v4 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              v4 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              v4 = @"TAP_VIEW_APP";
              break;
            case 6090:
              v4 = @"TAP_APP_CLIP";
              break;
            case 6091:
              v4 = @"DEAD_BATTERY";
              break;
            case 6092:
              v4 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              v4 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              v4 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              v4 = @"PAUSE_ROUTE";
              break;
            case 6097:
              v4 = @"TAP_ADD_STOP";
              break;
            case 6098:
              v4 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              v4 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              v4 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              v4 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              v4 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              v4 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              v4 = @"SHOW_INCIDENT";
              break;
            case 6105:
              v4 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              v4 = @"ORDER_DELIVERY";
              break;
            case 6107:
              v4 = @"VIEW_MENU";
              break;
            case 6108:
              v4 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              v4 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              v4 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)action)
              {
                case 5001:
                  v4 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  v4 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  v4 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  v4 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  v4 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  v4 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  v4 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  v4 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  v4 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  v4 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  v4 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  v4 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  v4 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  v4 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_51;
                case 5016:
                  v4 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  v4 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  v4 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  v4 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  v4 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  v4 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  v4 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  v4 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  v4 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  v4 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  v4 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  v4 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  v4 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  v4 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  v4 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  v4 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  v4 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  v4 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  v4 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  v4 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  v4 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  v4 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  v4 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 4001:
                      v4 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      v4 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      v4 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      v4 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      v4 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      v4 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)action > 13000)
      {
        if ((int)action <= 16000)
        {
          if ((int)action <= 15000)
          {
            switch((int)action)
            {
              case 14001:
                v4 = @"VIEW_APP";
                break;
              case 14002:
                v4 = @"ENABLE";
                break;
              case 14003:
                v4 = @"BOOK_RIDE";
                break;
              case 14004:
                v4 = @"REQUEST_RIDE";
                break;
              case 14005:
                v4 = @"CONTACT_DRIVER";
                break;
              case 14006:
                v4 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                v4 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                v4 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                v4 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)action)
                {
                  case 13001:
                    v4 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    v4 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    v4 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    v4 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    v4 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    v4 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    v4 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
          }
          else
          {
            switch(action)
            {
              case 0x3A99:
                v4 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                v4 = @"ORB_POP";
                break;
              case 0x3A9B:
                v4 = @"ORB_DISMISS";
                break;
              default:
LABEL_51:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", action);
                v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)action)
          {
            case 17001:
              v4 = @"START_DRAG";
              break;
            case 17002:
              v4 = @"CANCEL_DRAG";
              break;
            case 17003:
              v4 = @"COMPLETE_DRAG";
              break;
            case 17004:
              v4 = @"START_DROP";
              break;
            case 17005:
              v4 = @"CANCEL_DROP";
              break;
            case 17006:
              v4 = @"COMPLETE_DROP";
              break;
            case 17007:
              v4 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              v4 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              v4 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              v4 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              v4 = @"CALLOUT_INFO";
              break;
            case 17013:
              v4 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              v4 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              v4 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              v4 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              v4 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              v4 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              v4 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              v4 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              v4 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              v4 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              v4 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              v4 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              v4 = @"INFO_CONTACTS";
              break;
            case 17032:
              v4 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              v4 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              v4 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              v4 = @"INFO_DISMISS";
              break;
            case 17036:
              v4 = @"INFO_INFO";
              break;
            case 17037:
              v4 = @"INFO_PHOTOS";
              break;
            case 17038:
              v4 = @"INFO_REVIEWS";
              break;
            case 17039:
              v4 = @"INFO_SHARE";
              break;
            case 17040:
              v4 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              v4 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              v4 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              v4 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              v4 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              v4 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              v4 = @"INFO_YELP";
              break;
            case 17047:
              v4 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              v4 = @"MAP_3D_OFF";
              break;
            case 17049:
              v4 = @"MAP_3D_ON";
              break;
            case 17050:
              v4 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              v4 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              v4 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              v4 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              v4 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              v4 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              v4 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              v4 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              v4 = @"MAP_TAP_LINE";
              break;
            case 17061:
              v4 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              v4 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              v4 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              v4 = @"NAV_CLEAR";
              break;
            case 17068:
              v4 = @"NAV_LIST";
              break;
            case 17069:
              v4 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              v4 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              v4 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              v4 = @"ORB_MENU_CALL";
              break;
            case 17074:
              v4 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              v4 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              v4 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              v4 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              v4 = @"ORB_MENU_URL";
              break;
            case 17080:
              v4 = @"ORB_PRESS";
              break;
            case 17081:
              v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              v4 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              v4 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              v4 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              v4 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              v4 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              v4 = @"SEARCH_BEGIN";
              break;
            case 17092:
              v4 = @"SEARCH_CANCEL";
              break;
            case 17093:
              v4 = @"SEARCH_SELECT";
              break;
            case 17094:
              v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              v4 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              v4 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              v4 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              v4 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              v4 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              v4 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              v4 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              v4 = @"CALLOUT_NAV";
              break;
            case 17107:
              v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              v4 = @"MAP_TAP_POI";
              break;
            default:
              if (action == 16001)
              {
                v4 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (action != 90010) {
                  goto LABEL_51;
                }
                v4 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)action)
        {
          case 10101:
            v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            v4 = @"RAP_CANCEL";
            break;
          case 10110:
            v4 = @"RAP_NEXT";
            break;
          case 10111:
            v4 = @"RAP_BACK";
            break;
          case 10112:
            v4 = @"RAP_SEND";
            break;
          case 10113:
            v4 = @"RAP_SKIP";
            break;
          case 10114:
            v4 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            v4 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            v4 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            v4 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            v4 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            v4 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            v4 = @"RAP_HOME";
            break;
          case 10123:
            v4 = @"RAP_WORK";
            break;
          case 10124:
            v4 = @"RAP_OTHER";
            break;
          case 10125:
            v4 = @"RAP_LOCATION";
            break;
          case 10126:
            v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            v4 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            v4 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            v4 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            v4 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            v4 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            v4 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            v4 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            v4 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            v4 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            v4 = @"RAP_PAN_MAP";
            break;
          case 10142:
            v4 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            v4 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            v4 = @"RAP_ADD_POI";
            break;
          case 10145:
            v4 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            v4 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            v4 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            v4 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            v4 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            v4 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            v4 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            v4 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            v4 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            v4 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            v4 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            v4 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            v4 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            v4 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            v4 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            v4 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            v4 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            v4 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            v4 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            v4 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            v4 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            v4 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            v4 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            v4 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            v4 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            v4 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            v4 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            v4 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            v4 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            v4 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            v4 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            v4 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            v4 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            v4 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            v4 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            v4 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)action)
            {
              case 11001:
                v4 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                v4 = @"TASK_READY";
                break;
              case 11003:
                v4 = @"TAP_SEARCH";
                break;
              case 11004:
                v4 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                v4 = @"SHOW_NEARBY";
                break;
              case 11006:
                v4 = @"TAP_NEARBY";
                break;
              case 11007:
                v4 = @"TAP_PROACTIVE";
                break;
              case 11008:
                v4 = @"FORCE_PRESS";
                break;
              case 11009:
                v4 = @"TAP_CONTACTS";
                break;
              case 11010:
                v4 = @"TAP_TRANSIT";
                break;
              case 11011:
                v4 = @"TAP_DICTATION";
                break;
              case 11012:
                v4 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                v4 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                v4 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                v4 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                v4 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                v4 = @"START_NAV_AUTO";
                break;
              case 11018:
                v4 = @"TAP_RECENT";
                break;
              case 11019:
                v4 = @"TAP_FAVORITE";
                break;
              case 11020:
                v4 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                v4 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                v4 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                v4 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                v4 = @"NAV_UNMUTE";
                break;
              case 11025:
                v4 = @"NAV_MUTE";
                break;
              case 11026:
                v4 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                v4 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                v4 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)action)
                {
                  case 12001:
                    v4 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    v4 = @"SELECT_TIME";
                    break;
                  case 12003:
                    v4 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    v4 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    v4 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    v4 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    v4 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    v4 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    v4 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    v4 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v4 = @"UI_ACTION_UNKNOWN";
      switch((int)action)
      {
        case 0:
          break;
        case 1:
          v4 = @"PULL_UP";
          break;
        case 2:
          v4 = @"PULL_DOWN";
          break;
        case 3:
          v4 = @"TAP";
          break;
        case 4:
          v4 = @"CLOSE";
          break;
        case 5:
          v4 = @"SWIPE_PREV";
          break;
        case 6:
          v4 = @"SWIPE_NEXT";
          break;
        case 7:
          v4 = @"SCROLL_UP";
          break;
        case 8:
          v4 = @"SCROLL_DOWN";
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_51;
        case 10:
          v4 = @"SHOW_MORE";
          break;
        case 11:
          v4 = @"SHOW_LESS";
          break;
        case 12:
          v4 = @"SWIPE_LEFT";
          break;
        case 13:
          v4 = @"SWIPE_RIGHT";
          break;
        case 14:
          v4 = @"MINIMIZE";
          break;
        case 15:
          v4 = @"TAP_PREV";
          break;
        case 16:
          v4 = @"TAP_NEXT";
          break;
        case 17:
          v4 = @"SUBMIT";
          break;
        case 18:
          v4 = @"CANCEL";
          break;
        case 19:
          v4 = @"ENTER_MAPS";
          break;
        case 20:
          v4 = @"EXIT_MAPS";
          break;
        case 21:
          v4 = @"REVEAL";
          break;
        case 22:
          v4 = @"OPEN_NEW_TAB";
          break;
        case 25:
          v4 = @"BACK";
          break;
        case 26:
          v4 = @"ACTIVATE";
          break;
        case 27:
          v4 = @"DEACTIVATE";
          break;
        case 28:
          v4 = @"AGREE";
          break;
        case 29:
          v4 = @"DISAGREE";
          break;
        case 30:
          v4 = @"SKIP_ANSWER";
          break;
        case 31:
          v4 = @"EXPAND";
          break;
        case 32:
          v4 = @"COLLAPSE";
          break;
        case 33:
          v4 = @"ENTER";
          break;
        case 34:
          v4 = @"EXIT";
          break;
        case 35:
          v4 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          v4 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          v4 = @"TOGGLE_ON";
          break;
        case 38:
          v4 = @"TOGGLE_OFF";
          break;
        case 39:
          v4 = @"LONG_PRESS";
          break;
        case 40:
          v4 = @"CLICK";
          break;
        case 41:
          v4 = @"TAP_DONE";
          break;
        case 42:
          v4 = @"TAP_CLOSE";
          break;
        case 43:
          v4 = @"SCROLL_LEFT";
          break;
        case 44:
          v4 = @"SCROLL_RIGHT";
          break;
        case 45:
          v4 = @"DISPLAY";
          break;
        case 46:
          v4 = @"OPEN_IN_APP";
          break;
        case 47:
          v4 = @"CONCEAL";
          break;
        case 48:
          v4 = @"TAP_DELETE";
          break;
        case 49:
          v4 = @"TAP_FILTER";
          break;
        case 50:
          v4 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          v4 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          v4 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          v4 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          v4 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          v4 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          v4 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          v4 = @"SHARE_PHOTO";
          break;
        case 59:
          v4 = @"TAP_KEEP_OFF";
          break;
        case 60:
          v4 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          v4 = @"TAP_TURN_ON";
          break;
        case 63:
          v4 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          v4 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          v4 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          v4 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          v4 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          v4 = @"RESUME_ROUTE";
          break;
        case 75:
          v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          v4 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          v4 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          v4 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          v4 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          v4 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          v4 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          v4 = @"REPORT_PHOTO";
          break;
        case 87:
          v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          v4 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          v4 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          v4 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          v4 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          v4 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          v4 = @"NEXT";
          break;
        case 99:
          v4 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          v4 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          v4 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          v4 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          v4 = @"CLEAR_INCIDENT";
          break;
        case 107:
          v4 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          v4 = @"DISMISS_INCIDENT";
          break;
        case 109:
          v4 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          v4 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          v4 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          v4 = @"TAP_SHORTCUT";
          break;
        case 117:
          v4 = @"BLOCK_CONTACT";
          break;
        case 118:
          v4 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          v4 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          v4 = @"TAP_DISMISS";
          break;
        case 126:
          v4 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          v4 = @"TAP_OK";
          break;
        case 128:
          v4 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          v4 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          v4 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          v4 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          v4 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          v4 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          v4 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          v4 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          v4 = @"HIDE_DETAILS";
          break;
        case 141:
          v4 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          v4 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          v4 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          v4 = @"TAP_EXIT";
          break;
        case 147:
          v4 = @"TAP_CITY_MENU";
          break;
        case 148:
          v4 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          v4 = @"TAP_ICLOUD";
          break;
        case 151:
          v4 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          v4 = @"TAP_FAVORITES";
          break;
        case 153:
          v4 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          v4 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          v4 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          v4 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          v4 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          v4 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          v4 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          v4 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          v4 = @"TAP_ACCOUNT";
          break;
        case 173:
          v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          v4 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          v4 = @"TAP_REPORTS";
          break;
        case 179:
          v4 = @"TAP_RATINGS";
          break;
        case 180:
          v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          v4 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          v4 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          v4 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          v4 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          v4 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          v4 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          v4 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          v4 = @"TAP_RATING";
          break;
        case 192:
          v4 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          v4 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          v4 = @"TAP_MY_GUIDES";
          break;
        case 200:
          v4 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          v4 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          v4 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          v4 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          v4 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          v4 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          v4 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          v4 = @"SWITCH_ON_HFP";
          break;
        case 209:
          v4 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          v4 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          v4 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          v4 = @"RESUME";
          break;
        case 213:
          v4 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          v4 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          v4 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          v4 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          v4 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          v4 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          v4 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          v4 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          v4 = @"RAP_ADD_MAP";
          break;
        case 223:
          v4 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          v4 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          v4 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          v4 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          v4 = @"RAP_BAD_TRIP";
          break;
        case 229:
          v4 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          v4 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          v4 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          v4 = @"RAP_GUIDE";
          break;
        case 233:
          v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          v4 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          v4 = @"TAP_SEE_MORE";
          break;
        case 238:
          v4 = @"RAP_IN_REVIEW";
          break;
        case 239:
          v4 = @"TAP_OPEN_MENU";
          break;
        case 240:
          v4 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          v4 = @"TAP_PIN_LINE";
          break;
        case 242:
          v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          v4 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          v4 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          v4 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          v4 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          v4 = @"ADVISORY_ALERT";
          break;
        case 249:
          v4 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          v4 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          v4 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          v4 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          v4 = @"MENU_UNPIN";
          break;
        case 254:
          v4 = @"MENU_PIN";
          break;
        case 255:
          v4 = @"SWIPE_PIN";
          break;
        case 256:
          v4 = @"SWIPE_UNPIN";
          break;
        case 257:
          v4 = @"TAP_MEDIA_APP";
          break;
        case 258:
          v4 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          v4 = @"TAP_MEDIA";
          break;
        case 260:
          v4 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          v4 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          v4 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          v4 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          v4 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          v4 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          v4 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          v4 = @"TAP_ALLOW";
          break;
        case 271:
          v4 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          v4 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          v4 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          v4 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          v4 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          v4 = @"EDIT_WAYPOINT";
          break;
        case 278:
          v4 = @"CLEAR_TEXT";
          break;
        case 279:
          v4 = @"REORDER_WAYPOINT";
          break;
        case 280:
          v4 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          v4 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          v4 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          v4 = @"RAP_INLINE_ADD";
          break;
        case 287:
          v4 = @"RAP_TAP_EDIT";
          break;
        case 288:
          v4 = @"CLAIM_BUSINESS";
          break;
        case 289:
          v4 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          v4 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          v4 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          v4 = @"NEXT_STOP";
          break;
        case 293:
          v4 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          v4 = @"REMOVE_STOP";
          break;
        case 295:
          v4 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          v4 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          v4 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          v4 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          v4 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          v4 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          v4 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          v4 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          v4 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          v4 = @"FILTER_EV";
          break;
        case 310:
          v4 = @"FILTER_SURCHARGE";
          break;
        case 311:
          v4 = @"FILTER_PREFER";
          break;
        case 312:
          v4 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          v4 = @"FILTER_AVOID";
          break;
        case 314:
          v4 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          v4 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          v4 = @"FILTER_IC_FARES";
          break;
        case 317:
          v4 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          v4 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          v4 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          v4 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          v4 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          v4 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          v4 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          v4 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          v4 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          v4 = @"DELETE_PHOTO";
          break;
        case 332:
          v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          v4 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          v4 = @"ADD_STOP";
          break;
        case 338:
          v4 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          v4 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          v4 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          v4 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          v4 = @"SUBMIT_RATINGS";
          break;
        case 344:
          v4 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          v4 = @"FILTER_EBIKE";
          break;
        case 356:
          v4 = @"ADD_STOP_SIRI";
          break;
        case 357:
          v4 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          v4 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          v4 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          v4 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          v4 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          v4 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          v4 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          v4 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          v4 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          v4 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          v4 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          v4 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          v4 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          v4 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          v4 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          v4 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          v4 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          v4 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          v4 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          v4 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          v4 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          v4 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          v4 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          v4 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          v4 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          v4 = @"START_ETA_SHARING";
          break;
        case 401:
          v4 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          v4 = @"STOP_ETA_SHARING";
          break;
        case 403:
          v4 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          v4 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          v4 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          v4 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          v4 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          v4 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          v4 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          v4 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          v4 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          v4 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          v4 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          v4 = @"SELECT_CONTROLS";
          break;
        case 418:
          v4 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          v4 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          v4 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          v4 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          v4 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          v4 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          v4 = @"TAP_MAP";
          break;
        case 427:
          v4 = @"SWIPE_DOWN";
          break;
        case 428:
          v4 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          v4 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          v4 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          v4 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          v4 = @"TAP_AUDIO";
          break;
        case 433:
          v4 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          v4 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          v4 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          v4 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          v4 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          v4 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          v4 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          v4 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          v4 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          v4 = @"UPDATE_COLOR";
          break;
        case 443:
          v4 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          v4 = @"UNSELECT_NETWORK";
          break;
        case 445:
          v4 = @"TAP_BACK";
          break;
        case 446:
          v4 = @"TAP_CANCEL";
          break;
        case 447:
          v4 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          v4 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          v4 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          v4 = @"SELECT_NETWORK";
          break;
        case 451:
          v4 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          v4 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          v4 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          v4 = @"FILTER_NETWORK";
          break;
        case 455:
          v4 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          v4 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          v4 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          v4 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          v4 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          v4 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          v4 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          v4 = @"SAVE";
          break;
        case 464:
          v4 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          v4 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          v4 = @"TAP_TRY_NOW";
          break;
        case 467:
          v4 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          v4 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          v4 = @"START_HIKING";
          break;
        case 471:
          v4 = @"EDIT_NOTE";
          break;
        case 472:
          v4 = @"CREATE_NOTE";
          break;
        case 473:
          v4 = @"DELETE_PIN";
          break;
        case 474:
          v4 = @"ADD_ROUTE";
          break;
        case 475:
          v4 = @"ADD_PIN";
          break;
        case 476:
          v4 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          v4 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          v4 = @"TAP_ITEM";
          break;
        case 479:
          v4 = @"DELETE_ROUTE";
          break;
        case 480:
          v4 = @"TAP_ROUTE";
          break;
        case 481:
          v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          v4 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          v4 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          v4 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          v4 = @"TAP_EXPAND";
          break;
        case 490:
          v4 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          v4 = @"PAN";
          break;
        case 1002:
          v4 = @"ZOOM_IN";
          break;
        case 1003:
          v4 = @"ZOOM_OUT";
          break;
        case 1004:
          v4 = @"ROTATE";
          break;
        case 1010:
          v4 = @"TAP_POI";
          break;
        case 1011:
          v4 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          v4 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          v4 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          v4 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          v4 = @"DROP_PIN";
          break;
        case 1031:
          v4 = @"TAP_INCIDENT";
          break;
        case 1032:
          v4 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          v4 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          v4 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          v4 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          v4 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          v4 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          v4 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          v4 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          v4 = @"TAP_COMPASS";
          break;
        case 1041:
          v4 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          v4 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          v4 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          v4 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          v4 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          v4 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          v4 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          v4 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          v4 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          v4 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          v4 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          v4 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          v4 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          v4 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          v4 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          v4 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          v4 = @"ZOOM_RESET";
          break;
        case 1061:
          v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          v4 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          v4 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          v4 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          v4 = @"TAP_GEO";
          break;
        default:
          switch((int)action)
          {
            case 2001:
              v4 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              v4 = @"CLEAR_SEARCH";
              break;
            case 2003:
              v4 = @"CANCEL_SEARCH";
              break;
            case 2004:
              v4 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              v4 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              v4 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              v4 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              v4 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              v4 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              v4 = @"REFRESH_SEARCH";
              break;
            case 2012:
              v4 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              v4 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              v4 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              v4 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              v4 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              v4 = @"PASTE_TEXT";
              break;
            case 2018:
              v4 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              v4 = @"RETAINED_QUERY";
              break;
            case 2025:
              v4 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              v4 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              v4 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_51;
            case 2030:
              v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              v4 = @"TAP_SUBACTION";
              break;
            case 2032:
              v4 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              v4 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              v4 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              v4 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              v4 = @"SHARE_ITEM";
              break;
            case 2038:
              v4 = @"HIDE_ITEM";
              break;
            case 2039:
              v4 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              v4 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              v4 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              v4 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              v4 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              v4 = @"ADD_FAVORITE";
              break;
            case 2045:
              v4 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              v4 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              v4 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              v4 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              v4 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              v4 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              v4 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              v4 = @"CREATE_FAVORITE";
              break;
            case 2053:
              v4 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              v4 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              v4 = @"EDIT_FAVORITE";
              break;
            case 2056:
              v4 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              v4 = @"SHARE_FAVORITE";
              break;
            case 2058:
              v4 = @"EDIT_FAVORITES";
              break;
            case 2059:
              v4 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              v4 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              v4 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              v4 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              v4 = @"REFINE_LOCATION";
              break;
            case 2064:
              v4 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              v4 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              v4 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              v4 = @"SHOW_COLLECTION";
              break;
            case 2068:
              v4 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              v4 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              v4 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              v4 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              v4 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              v4 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              v4 = @"EDIT_PHOTO";
              break;
            case 2075:
              v4 = @"SORT_BY_NAME";
              break;
            case 2076:
              v4 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              v4 = @"SORT_BY_RECENT";
              break;
            case 2078:
              v4 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              v4 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              v4 = @"MAP_SEARCH";
              break;
            case 2081:
              v4 = @"DELETE_COLLECTION";
              break;
            case 2082:
              v4 = @"SHARE_COLLECTION";
              break;
            case 2083:
              v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              v4 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              v4 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              v4 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              v4 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              v4 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              v4 = @"FOLLOW";
              break;
            case 2090:
              v4 = @"PUNCH_IN";
              break;
            case 2091:
              v4 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              v4 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              v4 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              v4 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              v4 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              v4 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              v4 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              v4 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              v4 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              v4 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              v4 = @"TAP_LOCATION";
              break;
            case 2102:
              v4 = @"TAP_PUBLISHER";
              break;
            case 2103:
              v4 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              v4 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              v4 = @"UNFOLLOW";
              break;
            case 2106:
              v4 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              v4 = @"ADD_VEHICLE";
              break;
            case 2108:
              v4 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              v4 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              v4 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              v4 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              v4 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              v4 = @"SELECT_VEHICLE";
              break;
            case 2114:
              v4 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              v4 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              v4 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              v4 = @"TAP_BANNER";
              break;
            case 2118:
              v4 = @"TAP_CONNECT";
              break;
            case 2119:
              v4 = @"TAP_CONTINUE";
              break;
            case 2120:
              v4 = @"TAP_EDIT";
              break;
            case 2121:
              v4 = @"TAP_NAME";
              break;
            case 2122:
              v4 = @"TAP_NOT_NOW";
              break;
            case 2123:
              v4 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              v4 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              v4 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              v4 = @"TAP_VEHICLE";
              break;
            case 2127:
              v4 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              v4 = @"UPDATE_NAME";
              break;
            case 2129:
              v4 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              v4 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              v4 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              v4 = @"USE_PHOTO";
              break;
            case 2133:
              v4 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              v4 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              v4 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              v4 = @"EDIT_RATING";
              break;
            case 2137:
              v4 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              v4 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              v4 = @"RETAKE_PHOTO";
              break;
            case 2142:
              v4 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              v4 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              v4 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              v4 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              v4 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              v4 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              v4 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              v4 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              v4 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              v4 = @"REPORT_INCIDENT";
              break;
            case 2153:
              v4 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              v4 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              v4 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              v4 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              v4 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              v4 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              v4 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              v4 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              v4 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              v4 = @"DELETE_ITEM";
              break;
            case 2167:
              v4 = @"CANCEL_REMOVE";
              break;
            case 2168:
              v4 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              v4 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              v4 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              v4 = @"TRY_AGAIN";
              break;
            case 2172:
              v4 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              v4 = @"CHECK_EBIKE";
              break;
            case 2174:
              v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              v4 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              v4 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              v4 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              v4 = @"CREATE_WIDGET";
              break;
            case 2190:
              v4 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              v4 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              v4 = @"LPR_HARD_STOP";
              break;
            case 2195:
              v4 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              v4 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              v4 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)action)
              {
                case 3001:
                  v4 = @"START_NAV";
                  break;
                case 3002:
                  v4 = @"END_NAV";
                  break;
                case 3003:
                  v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  v4 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  v4 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  v4 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  v4 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  v4 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  v4 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  v4 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  v4 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  v4 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  v4 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  v4 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  v4 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  v4 = @"CHECK_BUS";
                  break;
                case 3025:
                  v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  v4 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  v4 = @"CHECK_FERRY";
                  break;
                case 3028:
                  v4 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  v4 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  v4 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  v4 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  v4 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  v4 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  v4 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  v4 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  v4 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  v4 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  v4 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  v4 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  v4 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  v4 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  v4 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  v4 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  v4 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  v4 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  v4 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  v4 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  v4 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  v4 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  v4 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  v4 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  v4 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  v4 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  v4 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  v4 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  v4 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  v4 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  v4 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  v4 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  v4 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  v4 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  v4 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  v4 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  v4 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  v4 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  v4 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  v4 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  v4 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_51;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_whiteListedSearchActionAsString:(int)a3
{
  if (a3 == 2014)
  {
    uint64_t action = self->_action;
    if ((int)action > 4000)
    {
      if ((int)action <= 10100)
      {
        if ((int)action > 7000)
        {
          switch((int)action)
          {
            case 9001:
              v4 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              v4 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              v4 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              v4 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              v4 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              v4 = @"OPEN_SEARCH";
              break;
            case 9007:
              v4 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              v4 = @"PAN_LEFT";
              break;
            case 9009:
              v4 = @"PAN_UP";
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_51;
            case 9011:
              v4 = @"PAN_DOWN";
              break;
            case 9012:
              v4 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              v4 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              v4 = @"OPEN_FAVORITES";
              break;
            case 9015:
              v4 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              v4 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              v4 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              v4 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              v4 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              v4 = @"SHARE_DESTINATION";
              break;
            case 9021:
              v4 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              v4 = @"SHARE_ETA";
              break;
            case 9023:
              v4 = @"SELECT_GROUP";
              break;
            case 9024:
              v4 = @"DESELECT_GROUP";
              break;
            case 9025:
              v4 = @"SELECT_CONTACT";
              break;
            case 9026:
              v4 = @"DESELECT_CONTACT";
              break;
            case 9027:
              v4 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              v4 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              v4 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              v4 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              v4 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              v4 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              v4 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              v4 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              v4 = @"SCROLL_FORWARD";
              break;
            case 9037:
              v4 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              v4 = @"TAP_LESS";
              break;
            case 9040:
              v4 = @"TAP_MORE";
              break;
            case 9101:
              v4 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              v4 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              v4 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              v4 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              v4 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              v4 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)action)
              {
                case 7001:
                  v4 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  v4 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  v4 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  v4 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  v4 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  v4 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  v4 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  v4 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  v4 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  v4 = @"GET_TICKETS";
                  break;
                case 7015:
                  v4 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  v4 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  v4 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  v4 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  v4 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  v4 = @"VIEW_BANNER";
                  break;
                case 7024:
                  v4 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  v4 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  v4 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  v4 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  v4 = @"WAITLIST";
                  break;
                case 7029:
                  v4 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  v4 = @"RESERVE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 8001:
                      v4 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      v4 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      v4 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      v4 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      v4 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      v4 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      v4 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)action)
          {
            case 6003:
              v4 = @"GET_DIRECTIONS";
              break;
            case 6004:
              v4 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              v4 = @"REMOVE_PIN";
              break;
            case 6006:
              v4 = @"TAP_PHOTO";
              break;
            case 6007:
              v4 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              v4 = @"TAP_ADDRESS";
              break;
            case 6009:
              v4 = @"CALL";
              break;
            case 6010:
              v4 = @"TAP_URL";
              break;
            case 6011:
              v4 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              v4 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              v4 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_51;
            case 6015:
              v4 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              v4 = @"ADD_CONTACT";
              break;
            case 6018:
              v4 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              v4 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              v4 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              v4 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              v4 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              v4 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              v4 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              v4 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              v4 = @"EDIT_LOCATION";
              break;
            case 6029:
              v4 = @"ADD_PHOTO";
              break;
            case 6031:
              v4 = @"RETAKE";
              break;
            case 6032:
              v4 = @"ADD_NOTE";
              break;
            case 6033:
              v4 = @"REMOVE_CAR";
              break;
            case 6034:
              v4 = @"EDIT_NAME";
              break;
            case 6036:
              v4 = @"RESERVE_TABLE";
              break;
            case 6037:
              v4 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              v4 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              v4 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              v4 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              v4 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              v4 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              v4 = @"VIEW_CONTACT";
              break;
            case 6045:
              v4 = @"CHAT";
              break;
            case 6046:
              v4 = @"FIND_STORES";
              break;
            case 6047:
              v4 = @"TAP_PARENT";
              break;
            case 6048:
              v4 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              v4 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              v4 = @"PUNCH_OUT";
              break;
            case 6051:
              v4 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              v4 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              v4 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              v4 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              v4 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              v4 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              v4 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              v4 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              v4 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              v4 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              v4 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              v4 = @"TAP_LANDMARK";
              break;
            case 6072:
              v4 = @"TAP_SCENE";
              break;
            case 6073:
              v4 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              v4 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              v4 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              v4 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              v4 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              v4 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              v4 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              v4 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              v4 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              v4 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              v4 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              v4 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              v4 = @"TAP_VIEW_APP";
              break;
            case 6090:
              v4 = @"TAP_APP_CLIP";
              break;
            case 6091:
              v4 = @"DEAD_BATTERY";
              break;
            case 6092:
              v4 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              v4 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              v4 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              v4 = @"PAUSE_ROUTE";
              break;
            case 6097:
              v4 = @"TAP_ADD_STOP";
              break;
            case 6098:
              v4 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              v4 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              v4 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              v4 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              v4 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              v4 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              v4 = @"SHOW_INCIDENT";
              break;
            case 6105:
              v4 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              v4 = @"ORDER_DELIVERY";
              break;
            case 6107:
              v4 = @"VIEW_MENU";
              break;
            case 6108:
              v4 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              v4 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              v4 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)action)
              {
                case 5001:
                  v4 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  v4 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  v4 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  v4 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  v4 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  v4 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  v4 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  v4 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  v4 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  v4 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  v4 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  v4 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  v4 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  v4 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_51;
                case 5016:
                  v4 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  v4 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  v4 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  v4 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  v4 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  v4 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  v4 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  v4 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  v4 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  v4 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  v4 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  v4 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  v4 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  v4 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  v4 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  v4 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  v4 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  v4 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  v4 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  v4 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  v4 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  v4 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  v4 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)action)
                  {
                    case 4001:
                      v4 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      v4 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      v4 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      v4 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      v4 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      v4 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_51;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)action > 13000)
      {
        if ((int)action <= 16000)
        {
          if ((int)action <= 15000)
          {
            switch((int)action)
            {
              case 14001:
                v4 = @"VIEW_APP";
                break;
              case 14002:
                v4 = @"ENABLE";
                break;
              case 14003:
                v4 = @"BOOK_RIDE";
                break;
              case 14004:
                v4 = @"REQUEST_RIDE";
                break;
              case 14005:
                v4 = @"CONTACT_DRIVER";
                break;
              case 14006:
                v4 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                v4 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                v4 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                v4 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)action)
                {
                  case 13001:
                    v4 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    v4 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    v4 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    v4 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    v4 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    v4 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    v4 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
          }
          else
          {
            switch(action)
            {
              case 0x3A99:
                v4 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                v4 = @"ORB_POP";
                break;
              case 0x3A9B:
                v4 = @"ORB_DISMISS";
                break;
              default:
LABEL_51:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", action);
                v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)action)
          {
            case 17001:
              v4 = @"START_DRAG";
              break;
            case 17002:
              v4 = @"CANCEL_DRAG";
              break;
            case 17003:
              v4 = @"COMPLETE_DRAG";
              break;
            case 17004:
              v4 = @"START_DROP";
              break;
            case 17005:
              v4 = @"CANCEL_DROP";
              break;
            case 17006:
              v4 = @"COMPLETE_DROP";
              break;
            case 17007:
              v4 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              v4 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              v4 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              v4 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              v4 = @"CALLOUT_INFO";
              break;
            case 17013:
              v4 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              v4 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              v4 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              v4 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              v4 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              v4 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              v4 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              v4 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              v4 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              v4 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              v4 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              v4 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              v4 = @"INFO_CONTACTS";
              break;
            case 17032:
              v4 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              v4 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              v4 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              v4 = @"INFO_DISMISS";
              break;
            case 17036:
              v4 = @"INFO_INFO";
              break;
            case 17037:
              v4 = @"INFO_PHOTOS";
              break;
            case 17038:
              v4 = @"INFO_REVIEWS";
              break;
            case 17039:
              v4 = @"INFO_SHARE";
              break;
            case 17040:
              v4 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              v4 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              v4 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              v4 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              v4 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              v4 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              v4 = @"INFO_YELP";
              break;
            case 17047:
              v4 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              v4 = @"MAP_3D_OFF";
              break;
            case 17049:
              v4 = @"MAP_3D_ON";
              break;
            case 17050:
              v4 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              v4 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              v4 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              v4 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              v4 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              v4 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              v4 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              v4 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              v4 = @"MAP_TAP_LINE";
              break;
            case 17061:
              v4 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              v4 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              v4 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              v4 = @"NAV_CLEAR";
              break;
            case 17068:
              v4 = @"NAV_LIST";
              break;
            case 17069:
              v4 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              v4 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              v4 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              v4 = @"ORB_MENU_CALL";
              break;
            case 17074:
              v4 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              v4 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              v4 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              v4 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              v4 = @"ORB_MENU_URL";
              break;
            case 17080:
              v4 = @"ORB_PRESS";
              break;
            case 17081:
              v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              v4 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              v4 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              v4 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              v4 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              v4 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              v4 = @"SEARCH_BEGIN";
              break;
            case 17092:
              v4 = @"SEARCH_CANCEL";
              break;
            case 17093:
              v4 = @"SEARCH_SELECT";
              break;
            case 17094:
              v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              v4 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              v4 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              v4 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              v4 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              v4 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              v4 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              v4 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              v4 = @"CALLOUT_NAV";
              break;
            case 17107:
              v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              v4 = @"MAP_TAP_POI";
              break;
            default:
              if (action == 16001)
              {
                v4 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (action != 90010) {
                  goto LABEL_51;
                }
                v4 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)action)
        {
          case 10101:
            v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            v4 = @"RAP_CANCEL";
            break;
          case 10110:
            v4 = @"RAP_NEXT";
            break;
          case 10111:
            v4 = @"RAP_BACK";
            break;
          case 10112:
            v4 = @"RAP_SEND";
            break;
          case 10113:
            v4 = @"RAP_SKIP";
            break;
          case 10114:
            v4 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            v4 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            v4 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            v4 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            v4 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            v4 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            v4 = @"RAP_HOME";
            break;
          case 10123:
            v4 = @"RAP_WORK";
            break;
          case 10124:
            v4 = @"RAP_OTHER";
            break;
          case 10125:
            v4 = @"RAP_LOCATION";
            break;
          case 10126:
            v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            v4 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            v4 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            v4 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            v4 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            v4 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            v4 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            v4 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            v4 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            v4 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            v4 = @"RAP_PAN_MAP";
            break;
          case 10142:
            v4 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            v4 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            v4 = @"RAP_ADD_POI";
            break;
          case 10145:
            v4 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            v4 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            v4 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            v4 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            v4 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            v4 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            v4 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            v4 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            v4 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            v4 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            v4 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            v4 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            v4 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            v4 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            v4 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            v4 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            v4 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            v4 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            v4 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            v4 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            v4 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            v4 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            v4 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            v4 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            v4 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            v4 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            v4 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            v4 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            v4 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            v4 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            v4 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            v4 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            v4 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            v4 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            v4 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            v4 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)action)
            {
              case 11001:
                v4 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                v4 = @"TASK_READY";
                break;
              case 11003:
                v4 = @"TAP_SEARCH";
                break;
              case 11004:
                v4 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                v4 = @"SHOW_NEARBY";
                break;
              case 11006:
                v4 = @"TAP_NEARBY";
                break;
              case 11007:
                v4 = @"TAP_PROACTIVE";
                break;
              case 11008:
                v4 = @"FORCE_PRESS";
                break;
              case 11009:
                v4 = @"TAP_CONTACTS";
                break;
              case 11010:
                v4 = @"TAP_TRANSIT";
                break;
              case 11011:
                v4 = @"TAP_DICTATION";
                break;
              case 11012:
                v4 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                v4 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                v4 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                v4 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                v4 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                v4 = @"START_NAV_AUTO";
                break;
              case 11018:
                v4 = @"TAP_RECENT";
                break;
              case 11019:
                v4 = @"TAP_FAVORITE";
                break;
              case 11020:
                v4 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                v4 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                v4 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                v4 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                v4 = @"NAV_UNMUTE";
                break;
              case 11025:
                v4 = @"NAV_MUTE";
                break;
              case 11026:
                v4 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                v4 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                v4 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)action)
                {
                  case 12001:
                    v4 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    v4 = @"SELECT_TIME";
                    break;
                  case 12003:
                    v4 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    v4 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    v4 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    v4 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    v4 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    v4 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    v4 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    v4 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_51;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v4 = @"UI_ACTION_UNKNOWN";
      switch((int)action)
      {
        case 0:
          break;
        case 1:
          v4 = @"PULL_UP";
          break;
        case 2:
          v4 = @"PULL_DOWN";
          break;
        case 3:
          v4 = @"TAP";
          break;
        case 4:
          v4 = @"CLOSE";
          break;
        case 5:
          v4 = @"SWIPE_PREV";
          break;
        case 6:
          v4 = @"SWIPE_NEXT";
          break;
        case 7:
          v4 = @"SCROLL_UP";
          break;
        case 8:
          v4 = @"SCROLL_DOWN";
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_51;
        case 10:
          v4 = @"SHOW_MORE";
          break;
        case 11:
          v4 = @"SHOW_LESS";
          break;
        case 12:
          v4 = @"SWIPE_LEFT";
          break;
        case 13:
          v4 = @"SWIPE_RIGHT";
          break;
        case 14:
          v4 = @"MINIMIZE";
          break;
        case 15:
          v4 = @"TAP_PREV";
          break;
        case 16:
          v4 = @"TAP_NEXT";
          break;
        case 17:
          v4 = @"SUBMIT";
          break;
        case 18:
          v4 = @"CANCEL";
          break;
        case 19:
          v4 = @"ENTER_MAPS";
          break;
        case 20:
          v4 = @"EXIT_MAPS";
          break;
        case 21:
          v4 = @"REVEAL";
          break;
        case 22:
          v4 = @"OPEN_NEW_TAB";
          break;
        case 25:
          v4 = @"BACK";
          break;
        case 26:
          v4 = @"ACTIVATE";
          break;
        case 27:
          v4 = @"DEACTIVATE";
          break;
        case 28:
          v4 = @"AGREE";
          break;
        case 29:
          v4 = @"DISAGREE";
          break;
        case 30:
          v4 = @"SKIP_ANSWER";
          break;
        case 31:
          v4 = @"EXPAND";
          break;
        case 32:
          v4 = @"COLLAPSE";
          break;
        case 33:
          v4 = @"ENTER";
          break;
        case 34:
          v4 = @"EXIT";
          break;
        case 35:
          v4 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          v4 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          v4 = @"TOGGLE_ON";
          break;
        case 38:
          v4 = @"TOGGLE_OFF";
          break;
        case 39:
          v4 = @"LONG_PRESS";
          break;
        case 40:
          v4 = @"CLICK";
          break;
        case 41:
          v4 = @"TAP_DONE";
          break;
        case 42:
          v4 = @"TAP_CLOSE";
          break;
        case 43:
          v4 = @"SCROLL_LEFT";
          break;
        case 44:
          v4 = @"SCROLL_RIGHT";
          break;
        case 45:
          v4 = @"DISPLAY";
          break;
        case 46:
          v4 = @"OPEN_IN_APP";
          break;
        case 47:
          v4 = @"CONCEAL";
          break;
        case 48:
          v4 = @"TAP_DELETE";
          break;
        case 49:
          v4 = @"TAP_FILTER";
          break;
        case 50:
          v4 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          v4 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          v4 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          v4 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          v4 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          v4 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          v4 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          v4 = @"SHARE_PHOTO";
          break;
        case 59:
          v4 = @"TAP_KEEP_OFF";
          break;
        case 60:
          v4 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          v4 = @"TAP_TURN_ON";
          break;
        case 63:
          v4 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          v4 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          v4 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          v4 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          v4 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          v4 = @"RESUME_ROUTE";
          break;
        case 75:
          v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          v4 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          v4 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          v4 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          v4 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          v4 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          v4 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          v4 = @"REPORT_PHOTO";
          break;
        case 87:
          v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          v4 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          v4 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          v4 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          v4 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          v4 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          v4 = @"NEXT";
          break;
        case 99:
          v4 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          v4 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          v4 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          v4 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          v4 = @"CLEAR_INCIDENT";
          break;
        case 107:
          v4 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          v4 = @"DISMISS_INCIDENT";
          break;
        case 109:
          v4 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          v4 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          v4 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          v4 = @"TAP_SHORTCUT";
          break;
        case 117:
          v4 = @"BLOCK_CONTACT";
          break;
        case 118:
          v4 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          v4 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          v4 = @"TAP_DISMISS";
          break;
        case 126:
          v4 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          v4 = @"TAP_OK";
          break;
        case 128:
          v4 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          v4 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          v4 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          v4 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          v4 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          v4 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          v4 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          v4 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          v4 = @"HIDE_DETAILS";
          break;
        case 141:
          v4 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          v4 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          v4 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          v4 = @"TAP_EXIT";
          break;
        case 147:
          v4 = @"TAP_CITY_MENU";
          break;
        case 148:
          v4 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          v4 = @"TAP_ICLOUD";
          break;
        case 151:
          v4 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          v4 = @"TAP_FAVORITES";
          break;
        case 153:
          v4 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          v4 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          v4 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          v4 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          v4 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          v4 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          v4 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          v4 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          v4 = @"TAP_ACCOUNT";
          break;
        case 173:
          v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          v4 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          v4 = @"TAP_REPORTS";
          break;
        case 179:
          v4 = @"TAP_RATINGS";
          break;
        case 180:
          v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          v4 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          v4 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          v4 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          v4 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          v4 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          v4 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          v4 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          v4 = @"TAP_RATING";
          break;
        case 192:
          v4 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          v4 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          v4 = @"TAP_MY_GUIDES";
          break;
        case 200:
          v4 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          v4 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          v4 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          v4 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          v4 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          v4 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          v4 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          v4 = @"SWITCH_ON_HFP";
          break;
        case 209:
          v4 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          v4 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          v4 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          v4 = @"RESUME";
          break;
        case 213:
          v4 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          v4 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          v4 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          v4 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          v4 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          v4 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          v4 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          v4 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          v4 = @"RAP_ADD_MAP";
          break;
        case 223:
          v4 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          v4 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          v4 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          v4 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          v4 = @"RAP_BAD_TRIP";
          break;
        case 229:
          v4 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          v4 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          v4 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          v4 = @"RAP_GUIDE";
          break;
        case 233:
          v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          v4 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          v4 = @"TAP_SEE_MORE";
          break;
        case 238:
          v4 = @"RAP_IN_REVIEW";
          break;
        case 239:
          v4 = @"TAP_OPEN_MENU";
          break;
        case 240:
          v4 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          v4 = @"TAP_PIN_LINE";
          break;
        case 242:
          v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          v4 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          v4 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          v4 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          v4 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          v4 = @"ADVISORY_ALERT";
          break;
        case 249:
          v4 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          v4 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          v4 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          v4 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          v4 = @"MENU_UNPIN";
          break;
        case 254:
          v4 = @"MENU_PIN";
          break;
        case 255:
          v4 = @"SWIPE_PIN";
          break;
        case 256:
          v4 = @"SWIPE_UNPIN";
          break;
        case 257:
          v4 = @"TAP_MEDIA_APP";
          break;
        case 258:
          v4 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          v4 = @"TAP_MEDIA";
          break;
        case 260:
          v4 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          v4 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          v4 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          v4 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          v4 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          v4 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          v4 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          v4 = @"TAP_ALLOW";
          break;
        case 271:
          v4 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          v4 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          v4 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          v4 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          v4 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          v4 = @"EDIT_WAYPOINT";
          break;
        case 278:
          v4 = @"CLEAR_TEXT";
          break;
        case 279:
          v4 = @"REORDER_WAYPOINT";
          break;
        case 280:
          v4 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          v4 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          v4 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          v4 = @"RAP_INLINE_ADD";
          break;
        case 287:
          v4 = @"RAP_TAP_EDIT";
          break;
        case 288:
          v4 = @"CLAIM_BUSINESS";
          break;
        case 289:
          v4 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          v4 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          v4 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          v4 = @"NEXT_STOP";
          break;
        case 293:
          v4 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          v4 = @"REMOVE_STOP";
          break;
        case 295:
          v4 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          v4 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          v4 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          v4 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          v4 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          v4 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          v4 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          v4 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          v4 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          v4 = @"FILTER_EV";
          break;
        case 310:
          v4 = @"FILTER_SURCHARGE";
          break;
        case 311:
          v4 = @"FILTER_PREFER";
          break;
        case 312:
          v4 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          v4 = @"FILTER_AVOID";
          break;
        case 314:
          v4 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          v4 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          v4 = @"FILTER_IC_FARES";
          break;
        case 317:
          v4 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          v4 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          v4 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          v4 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          v4 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          v4 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          v4 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          v4 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          v4 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          v4 = @"DELETE_PHOTO";
          break;
        case 332:
          v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          v4 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          v4 = @"ADD_STOP";
          break;
        case 338:
          v4 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          v4 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          v4 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          v4 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          v4 = @"SUBMIT_RATINGS";
          break;
        case 344:
          v4 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          v4 = @"FILTER_EBIKE";
          break;
        case 356:
          v4 = @"ADD_STOP_SIRI";
          break;
        case 357:
          v4 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          v4 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          v4 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          v4 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          v4 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          v4 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          v4 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          v4 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          v4 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          v4 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          v4 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          v4 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          v4 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          v4 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          v4 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          v4 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          v4 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          v4 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          v4 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          v4 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          v4 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          v4 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          v4 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          v4 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          v4 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          v4 = @"START_ETA_SHARING";
          break;
        case 401:
          v4 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          v4 = @"STOP_ETA_SHARING";
          break;
        case 403:
          v4 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          v4 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          v4 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          v4 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          v4 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          v4 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          v4 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          v4 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          v4 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          v4 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          v4 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          v4 = @"SELECT_CONTROLS";
          break;
        case 418:
          v4 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          v4 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          v4 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          v4 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          v4 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          v4 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          v4 = @"TAP_MAP";
          break;
        case 427:
          v4 = @"SWIPE_DOWN";
          break;
        case 428:
          v4 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          v4 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          v4 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          v4 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          v4 = @"TAP_AUDIO";
          break;
        case 433:
          v4 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          v4 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          v4 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          v4 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          v4 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          v4 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          v4 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          v4 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          v4 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          v4 = @"UPDATE_COLOR";
          break;
        case 443:
          v4 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          v4 = @"UNSELECT_NETWORK";
          break;
        case 445:
          v4 = @"TAP_BACK";
          break;
        case 446:
          v4 = @"TAP_CANCEL";
          break;
        case 447:
          v4 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          v4 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          v4 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          v4 = @"SELECT_NETWORK";
          break;
        case 451:
          v4 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          v4 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          v4 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          v4 = @"FILTER_NETWORK";
          break;
        case 455:
          v4 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          v4 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          v4 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          v4 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          v4 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          v4 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          v4 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          v4 = @"SAVE";
          break;
        case 464:
          v4 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          v4 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          v4 = @"TAP_TRY_NOW";
          break;
        case 467:
          v4 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          v4 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          v4 = @"START_HIKING";
          break;
        case 471:
          v4 = @"EDIT_NOTE";
          break;
        case 472:
          v4 = @"CREATE_NOTE";
          break;
        case 473:
          v4 = @"DELETE_PIN";
          break;
        case 474:
          v4 = @"ADD_ROUTE";
          break;
        case 475:
          v4 = @"ADD_PIN";
          break;
        case 476:
          v4 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          v4 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          v4 = @"TAP_ITEM";
          break;
        case 479:
          v4 = @"DELETE_ROUTE";
          break;
        case 480:
          v4 = @"TAP_ROUTE";
          break;
        case 481:
          v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          v4 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          v4 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          v4 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          v4 = @"TAP_EXPAND";
          break;
        case 490:
          v4 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          v4 = @"PAN";
          break;
        case 1002:
          v4 = @"ZOOM_IN";
          break;
        case 1003:
          v4 = @"ZOOM_OUT";
          break;
        case 1004:
          v4 = @"ROTATE";
          break;
        case 1010:
          v4 = @"TAP_POI";
          break;
        case 1011:
          v4 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          v4 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          v4 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          v4 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          v4 = @"DROP_PIN";
          break;
        case 1031:
          v4 = @"TAP_INCIDENT";
          break;
        case 1032:
          v4 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          v4 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          v4 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          v4 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          v4 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          v4 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          v4 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          v4 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          v4 = @"TAP_COMPASS";
          break;
        case 1041:
          v4 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          v4 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          v4 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          v4 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          v4 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          v4 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          v4 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          v4 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          v4 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          v4 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          v4 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          v4 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          v4 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          v4 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          v4 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          v4 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          v4 = @"ZOOM_RESET";
          break;
        case 1061:
          v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          v4 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          v4 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          v4 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          v4 = @"TAP_GEO";
          break;
        default:
          switch((int)action)
          {
            case 2001:
              v4 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              v4 = @"CLEAR_SEARCH";
              break;
            case 2003:
              v4 = @"CANCEL_SEARCH";
              break;
            case 2004:
              v4 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              v4 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              v4 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              v4 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              v4 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              v4 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              v4 = @"REFRESH_SEARCH";
              break;
            case 2012:
              v4 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              v4 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              v4 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              v4 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              v4 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              v4 = @"PASTE_TEXT";
              break;
            case 2018:
              v4 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              v4 = @"RETAINED_QUERY";
              break;
            case 2025:
              v4 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              v4 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              v4 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_51;
            case 2030:
              v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              v4 = @"TAP_SUBACTION";
              break;
            case 2032:
              v4 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              v4 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              v4 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              v4 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              v4 = @"SHARE_ITEM";
              break;
            case 2038:
              v4 = @"HIDE_ITEM";
              break;
            case 2039:
              v4 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              v4 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              v4 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              v4 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              v4 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              v4 = @"ADD_FAVORITE";
              break;
            case 2045:
              v4 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              v4 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              v4 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              v4 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              v4 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              v4 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              v4 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              v4 = @"CREATE_FAVORITE";
              break;
            case 2053:
              v4 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              v4 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              v4 = @"EDIT_FAVORITE";
              break;
            case 2056:
              v4 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              v4 = @"SHARE_FAVORITE";
              break;
            case 2058:
              v4 = @"EDIT_FAVORITES";
              break;
            case 2059:
              v4 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              v4 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              v4 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              v4 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              v4 = @"REFINE_LOCATION";
              break;
            case 2064:
              v4 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              v4 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              v4 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              v4 = @"SHOW_COLLECTION";
              break;
            case 2068:
              v4 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              v4 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              v4 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              v4 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              v4 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              v4 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              v4 = @"EDIT_PHOTO";
              break;
            case 2075:
              v4 = @"SORT_BY_NAME";
              break;
            case 2076:
              v4 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              v4 = @"SORT_BY_RECENT";
              break;
            case 2078:
              v4 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              v4 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              v4 = @"MAP_SEARCH";
              break;
            case 2081:
              v4 = @"DELETE_COLLECTION";
              break;
            case 2082:
              v4 = @"SHARE_COLLECTION";
              break;
            case 2083:
              v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              v4 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              v4 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              v4 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              v4 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              v4 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              v4 = @"FOLLOW";
              break;
            case 2090:
              v4 = @"PUNCH_IN";
              break;
            case 2091:
              v4 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              v4 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              v4 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              v4 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              v4 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              v4 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              v4 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              v4 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              v4 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              v4 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              v4 = @"TAP_LOCATION";
              break;
            case 2102:
              v4 = @"TAP_PUBLISHER";
              break;
            case 2103:
              v4 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              v4 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              v4 = @"UNFOLLOW";
              break;
            case 2106:
              v4 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              v4 = @"ADD_VEHICLE";
              break;
            case 2108:
              v4 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              v4 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              v4 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              v4 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              v4 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              v4 = @"SELECT_VEHICLE";
              break;
            case 2114:
              v4 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              v4 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              v4 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              v4 = @"TAP_BANNER";
              break;
            case 2118:
              v4 = @"TAP_CONNECT";
              break;
            case 2119:
              v4 = @"TAP_CONTINUE";
              break;
            case 2120:
              v4 = @"TAP_EDIT";
              break;
            case 2121:
              v4 = @"TAP_NAME";
              break;
            case 2122:
              v4 = @"TAP_NOT_NOW";
              break;
            case 2123:
              v4 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              v4 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              v4 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              v4 = @"TAP_VEHICLE";
              break;
            case 2127:
              v4 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              v4 = @"UPDATE_NAME";
              break;
            case 2129:
              v4 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              v4 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              v4 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              v4 = @"USE_PHOTO";
              break;
            case 2133:
              v4 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              v4 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              v4 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              v4 = @"EDIT_RATING";
              break;
            case 2137:
              v4 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              v4 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              v4 = @"RETAKE_PHOTO";
              break;
            case 2142:
              v4 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              v4 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              v4 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              v4 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              v4 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              v4 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              v4 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              v4 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              v4 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              v4 = @"REPORT_INCIDENT";
              break;
            case 2153:
              v4 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              v4 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              v4 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              v4 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              v4 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              v4 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              v4 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              v4 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              v4 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              v4 = @"DELETE_ITEM";
              break;
            case 2167:
              v4 = @"CANCEL_REMOVE";
              break;
            case 2168:
              v4 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              v4 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              v4 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              v4 = @"TRY_AGAIN";
              break;
            case 2172:
              v4 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              v4 = @"CHECK_EBIKE";
              break;
            case 2174:
              v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              v4 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              v4 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              v4 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              v4 = @"CREATE_WIDGET";
              break;
            case 2190:
              v4 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              v4 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              v4 = @"LPR_HARD_STOP";
              break;
            case 2195:
              v4 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              v4 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              v4 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)action)
              {
                case 3001:
                  v4 = @"START_NAV";
                  break;
                case 3002:
                  v4 = @"END_NAV";
                  break;
                case 3003:
                  v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  v4 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  v4 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  v4 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  v4 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  v4 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  v4 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  v4 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  v4 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  v4 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  v4 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  v4 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  v4 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  v4 = @"CHECK_BUS";
                  break;
                case 3025:
                  v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  v4 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  v4 = @"CHECK_FERRY";
                  break;
                case 3028:
                  v4 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  v4 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  v4 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  v4 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  v4 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  v4 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  v4 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  v4 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  v4 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  v4 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  v4 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  v4 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  v4 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  v4 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  v4 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  v4 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  v4 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  v4 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  v4 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  v4 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  v4 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  v4 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  v4 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  v4 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  v4 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  v4 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  v4 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  v4 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  v4 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  v4 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  v4 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  v4 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  v4 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  v4 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  v4 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  v4 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  v4 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  v4 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  v4 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  v4 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  v4 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_51;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_whiteListedNavigationActionAsString:(int)a3
{
  v4 = 0;
  if (a3 > 9015)
  {
    if (a3 != 9016 && a3 != 11017)
    {
      int v5 = 9021;
LABEL_7:
      if (a3 != v5) {
        goto LABEL_1336;
      }
    }
  }
  else if ((a3 - 3001) >= 2)
  {
    int v5 = 8006;
    goto LABEL_7;
  }
  uint64_t action = self->_action;
  if ((int)action > 4000)
  {
    if ((int)action <= 10100)
    {
      if ((int)action > 7000)
      {
        switch((int)action)
        {
          case 9001:
            v4 = @"TAP_WIDGET_ITEM";
            break;
          case 9002:
            v4 = @"DISPLAY_NOTIFICATION";
            break;
          case 9003:
            v4 = @"TAP_NOTIFICATION";
            break;
          case 9004:
            v4 = @"EXPAND_NOTIFICATION";
            break;
          case 9005:
            v4 = @"DISMISS_NOTIFICATION";
            break;
          case 9006:
            v4 = @"OPEN_SEARCH";
            break;
          case 9007:
            v4 = @"OPEN_PAN_VIEW";
            break;
          case 9008:
            v4 = @"PAN_LEFT";
            break;
          case 9009:
            v4 = @"PAN_UP";
            break;
          case 9010:
          case 9041:
          case 9042:
          case 9043:
          case 9044:
          case 9045:
          case 9046:
          case 9047:
          case 9048:
          case 9049:
          case 9050:
          case 9051:
          case 9052:
          case 9053:
          case 9054:
          case 9055:
          case 9056:
          case 9057:
          case 9058:
          case 9059:
          case 9060:
          case 9061:
          case 9062:
          case 9063:
          case 9064:
          case 9065:
          case 9066:
          case 9067:
          case 9068:
          case 9069:
          case 9070:
          case 9071:
          case 9072:
          case 9073:
          case 9074:
          case 9075:
          case 9076:
          case 9077:
          case 9078:
          case 9079:
          case 9080:
          case 9081:
          case 9082:
          case 9083:
          case 9084:
          case 9085:
          case 9086:
          case 9087:
          case 9088:
          case 9089:
          case 9090:
          case 9091:
          case 9092:
          case 9093:
          case 9094:
          case 9095:
          case 9096:
          case 9097:
          case 9098:
          case 9099:
          case 9100:
            goto LABEL_53;
          case 9011:
            v4 = @"PAN_DOWN";
            break;
          case 9012:
            v4 = @"TAP_RECENT_DESTINATIONS";
            break;
          case 9013:
            v4 = @"OPEN_DESTINATIONS";
            break;
          case 9014:
            v4 = @"OPEN_FAVORITES";
            break;
          case 9015:
            v4 = @"VIEW_NAV_OPTIONS";
            break;
          case 9016:
            v4 = @"START_NAV_NO_GUIDANCE";
            break;
          case 9017:
            v4 = @"TURN_OFF_GUIDANCE";
            break;
          case 9018:
            v4 = @"TURN_ON_GUIDANCE";
            break;
          case 9019:
            v4 = @"OPEN_KEYBOARD";
            break;
          case 9020:
            v4 = @"SHARE_DESTINATION";
            break;
          case 9021:
            v4 = @"START_NAV_AUTOMATED";
            break;
          case 9022:
            v4 = @"SHARE_ETA";
            break;
          case 9023:
            v4 = @"SELECT_GROUP";
            break;
          case 9024:
            v4 = @"DESELECT_GROUP";
            break;
          case 9025:
            v4 = @"SELECT_CONTACT";
            break;
          case 9026:
            v4 = @"DESELECT_CONTACT";
            break;
          case 9027:
            v4 = @"TAP_VIEW_CONTACTS";
            break;
          case 9028:
            v4 = @"STOP_RECEIVING_ETA";
            break;
          case 9029:
            v4 = @"DISPLAY_ANNOUNCEMENT";
            break;
          case 9030:
            v4 = @"TAP_ANNOUNCEMENT";
            break;
          case 9031:
            v4 = @"DISPLAY_CYCLING_NOTIFICATION";
            break;
          case 9032:
            v4 = @"TAP_CYCLING_NOTIFICATION";
            break;
          case 9033:
            v4 = @"SHARE_CYCLING_ETA";
            break;
          case 9034:
            v4 = @"MANAGE_NOTIFICATIONS";
            break;
          case 9035:
            v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
            break;
          case 9036:
            v4 = @"SCROLL_FORWARD";
            break;
          case 9037:
            v4 = @"SCROLL_BACKWARD";
            break;
          case 9038:
            v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
            break;
          case 9039:
            v4 = @"TAP_LESS";
            break;
          case 9040:
            v4 = @"TAP_MORE";
            break;
          case 9101:
            v4 = @"DISPLAY_ADD_HOME_AND_WORK";
            break;
          case 9102:
            v4 = @"TAP_ADD_HOME_AND_WORK";
            break;
          case 9103:
            v4 = @"DISPLAY_ALLOW_FREQUENTS";
            break;
          case 9104:
            v4 = @"TAP_ALLOW_FREQUENTS";
            break;
          case 9105:
            v4 = @"DISPLAY_ALLOW_LOCATION";
            break;
          case 9106:
            v4 = @"TAP_ALLOW_LOCATION";
            break;
          default:
            switch((int)action)
            {
              case 7001:
                v4 = @"EXPAND_TRANSIT_SYSTEM";
                break;
              case 7002:
                v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                break;
              case 7003:
                v4 = @"SHOW_MORE_DEPARTURES";
                break;
              case 7004:
                v4 = @"VIEW_TRANSIT_LINE";
                break;
              case 7005:
                v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                break;
              case 7006:
                v4 = @"TAP_TRANSIT_ATTRIBUTION";
                break;
              case 7007:
                v4 = @"TAP_TRANSIT_ADVISORY";
                break;
              case 7008:
                v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                break;
              case 7009:
                v4 = @"SUBSCRIBE_LINE_INCIDENT";
                break;
              case 7010:
                v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                break;
              case 7011:
                v4 = @"TAP_NEAREST_STATION";
                break;
              case 7012:
                v4 = @"TAP_NEAREST_STOP";
                break;
              case 7013:
                v4 = @"TAP_CONNECTION";
                break;
              case 7014:
                v4 = @"GET_TICKETS";
                break;
              case 7015:
                v4 = @"OPEN_SCHEDULECARD_DATETIME";
                break;
              case 7016:
                v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                break;
              case 7017:
                v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                break;
              case 7018:
                v4 = @"VIEW_ON_MAP";
                break;
              case 7019:
                v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                break;
              case 7020:
                v4 = @"TAP_TRANSIT_LINE_INFO";
                break;
              case 7021:
                v4 = @"TAP_ATTRIBUTION_CELL";
                break;
              case 7022:
                v4 = @"TAP_NEXT_DEPARTURES";
                break;
              case 7023:
                v4 = @"VIEW_BANNER";
                break;
              case 7024:
                v4 = @"GET_SHOWTIMES";
                break;
              case 7025:
                v4 = @"MAKE_APPOINTMENT";
                break;
              case 7026:
                v4 = @"RESERVE_PARKING";
                break;
              case 7027:
                v4 = @"RESERVE_ROOM";
                break;
              case 7028:
                v4 = @"WAITLIST";
                break;
              case 7029:
                v4 = @"ORDER_TAKEOUT";
                break;
              case 7030:
                v4 = @"RESERVE";
                break;
              default:
                switch((int)action)
                {
                  case 8001:
                    v4 = @"INVOKE_SIRI_SNIPPET";
                    break;
                  case 8002:
                    v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                    break;
                  case 8003:
                    v4 = @"SHOW_PLACE_DETAILS";
                    break;
                  case 8004:
                    v4 = @"ANSWER_REROUTE_SUGGESTION";
                    break;
                  case 8005:
                    v4 = @"SUGGEST_NAV_REROUTE";
                    break;
                  case 8006:
                    v4 = @"GET_NAV_STATUS";
                    break;
                  case 8007:
                    v4 = @"REPEAT_NAV_STATUS";
                    break;
                  case 8008:
                    v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                    break;
                  case 8009:
                    v4 = @"INVOKE_SIRI";
                    break;
                  case 8010:
                    v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                    break;
                  case 8011:
                    v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
                    break;
                  default:
                    goto LABEL_53;
                }
                break;
            }
            break;
        }
      }
      else
      {
        switch((int)action)
        {
          case 6003:
            v4 = @"GET_DIRECTIONS";
            break;
          case 6004:
            v4 = @"TAP_FLYOVER_TOUR";
            break;
          case 6005:
            v4 = @"REMOVE_PIN";
            break;
          case 6006:
            v4 = @"TAP_PHOTO";
            break;
          case 6007:
            v4 = @"TAP_MAPS_VIEW";
            break;
          case 6008:
            v4 = @"TAP_ADDRESS";
            break;
          case 6009:
            v4 = @"CALL";
            break;
          case 6010:
            v4 = @"TAP_URL";
            break;
          case 6011:
            v4 = @"SHOW_TODAY_HOURS";
            break;
          case 6012:
            v4 = @"SHOW_ALL_HOURS";
            break;
          case 6013:
            v4 = @"SHARE";
            break;
          case 6014:
          case 6017:
          case 6028:
          case 6030:
          case 6035:
            goto LABEL_53;
          case 6015:
            v4 = @"ADD_TO_FAVORITES";
            break;
          case 6016:
            v4 = @"ADD_CONTACT";
            break;
          case 6018:
            v4 = @"PUNCH_OUT_PHOTO";
            break;
          case 6019:
            v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
            break;
          case 6020:
            v4 = @"PUNCH_OUT_OPEN_APP";
            break;
          case 6021:
            v4 = @"PUNCH_OUT_SINGLE_REVIEW";
            break;
          case 6022:
            v4 = @"PUNCH_OUT_CHECK_IN";
            break;
          case 6023:
            v4 = @"PUNCH_OUT_MORE_INFO";
            break;
          case 6024:
            v4 = @"PUNCH_OUT_WRITE_REVIEW";
            break;
          case 6025:
            v4 = @"PUNCH_OUT_ADD_PHOTO";
            break;
          case 6026:
            v4 = @"TAP_GRID_VIEW";
            break;
          case 6027:
            v4 = @"EDIT_LOCATION";
            break;
          case 6029:
            v4 = @"ADD_PHOTO";
            break;
          case 6031:
            v4 = @"RETAKE";
            break;
          case 6032:
            v4 = @"ADD_NOTE";
            break;
          case 6033:
            v4 = @"REMOVE_CAR";
            break;
          case 6034:
            v4 = @"EDIT_NAME";
            break;
          case 6036:
            v4 = @"RESERVE_TABLE";
            break;
          case 6037:
            v4 = @"ADD_TO_QUEUE";
            break;
          case 6038:
            v4 = @"VIEW_BOOKED_TABLE";
            break;
          case 6039:
            v4 = @"VIEW_QUEUED_TABLE";
            break;
          case 6040:
            v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
            break;
          case 6041:
            v4 = @"PUNCH_OUT_LEGAL_LINK";
            break;
          case 6042:
            v4 = @"TAP_PLACECARD_HEADER";
            break;
          case 6043:
            v4 = @"REMOVE_FROM_FAVORITES";
            break;
          case 6044:
            v4 = @"VIEW_CONTACT";
            break;
          case 6045:
            v4 = @"CHAT";
            break;
          case 6046:
            v4 = @"FIND_STORES";
            break;
          case 6047:
            v4 = @"TAP_PARENT";
            break;
          case 6048:
            v4 = @"SCROLL_LEFT_PHOTOS";
            break;
          case 6049:
            v4 = @"SCROLL_RIGHT_PHOTOS";
            break;
          case 6050:
            v4 = @"PUNCH_OUT";
            break;
          case 6051:
            v4 = @"TAP_ENTER_MUNIN";
            break;
          case 6052:
            v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
            break;
          case 6053:
            v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
            break;
          case 6054:
            v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
            break;
          case 6055:
            v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6056:
            v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6057:
            v4 = @"SHOW_LINKED_SERVICE_HOURS";
            break;
          case 6058:
            v4 = @"ENTER_LOOK_AROUND";
            break;
          case 6059:
            v4 = @"EXIT_LOOK_AROUND";
            break;
          case 6060:
            v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
            break;
          case 6061:
            v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
            break;
          case 6062:
            v4 = @"EXPAND_LOOK_AROUND_VIEW";
            break;
          case 6063:
            v4 = @"CLOSE_LOOK_AROUND";
            break;
          case 6064:
            v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
            break;
          case 6065:
            v4 = @"TAP_SHOW_ACTIONS";
            break;
          case 6066:
            v4 = @"TAP_HIDE_LABELS";
            break;
          case 6067:
            v4 = @"TAP_SHOW_LABELS";
            break;
          case 6068:
            v4 = @"TAP_SHOW_DETAILS";
            break;
          case 6069:
            v4 = @"PAN_LOOK_AROUND";
            break;
          case 6070:
            v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
            break;
          case 6071:
            v4 = @"TAP_LANDMARK";
            break;
          case 6072:
            v4 = @"TAP_SCENE";
            break;
          case 6073:
            v4 = @"SHOW_LINKED_BUSINESS_HOURS";
            break;
          case 6074:
            v4 = @"TAP_PLACECARD_SHORTCUT";
            break;
          case 6075:
            v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
            break;
          case 6076:
            v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
            break;
          case 6077:
            v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
            break;
          case 6078:
            v4 = @"TAP_PARENT_LOCATION";
            break;
          case 6079:
            v4 = @"TAP_SIMILAR_LOCATION";
            break;
          case 6080:
            v4 = @"TAP_LOCATION_INSIDE";
            break;
          case 6081:
            v4 = @"TAP_LOCATION_AT_ADDRESS";
            break;
          case 6082:
            v4 = @"CLOSE_ROUTE_GENIUS";
            break;
          case 6083:
            v4 = @"LOAD_WEB_CONTENT";
            break;
          case 6084:
            v4 = @"SCROLL_FORWARD_WEB_CONTENT";
            break;
          case 6085:
            v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
            break;
          case 6086:
            v4 = @"TAP_WEB_CONTENT";
            break;
          case 6087:
            v4 = @"SHOW_PHOTO_VIEWER";
            break;
          case 6088:
            v4 = @"SHOW_LAST_PAGE";
            break;
          case 6089:
            v4 = @"TAP_VIEW_APP";
            break;
          case 6090:
            v4 = @"TAP_APP_CLIP";
            break;
          case 6091:
            v4 = @"DEAD_BATTERY";
            break;
          case 6092:
            v4 = @"DISMISS_LOW_BATTERY_ALERT";
            break;
          case 6093:
            v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
            break;
          case 6094:
            v4 = @"FAILED_TO_LOAD_EV_STATUS";
            break;
          case 6095:
            v4 = @"LOW_BATTERY_ALERT";
            break;
          case 6096:
            v4 = @"PAUSE_ROUTE";
            break;
          case 6097:
            v4 = @"TAP_ADD_STOP";
            break;
          case 6098:
            v4 = @"TAP_CHARGE_POINT";
            break;
          case 6099:
            v4 = @"TAP_OUT_OF_RANGE_ALERT";
            break;
          case 6100:
            v4 = @"SCROLL_DOWN_PHOTOS";
            break;
          case 6101:
            v4 = @"SCROLL_UP_PHOTOS";
            break;
          case 6102:
            v4 = @"TAP_MORE_PHOTOS";
            break;
          case 6103:
            v4 = @"TAP_TO_CONFIRM_INCIDENT";
            break;
          case 6104:
            v4 = @"SHOW_INCIDENT";
            break;
          case 6105:
            v4 = @"REVEAL_APP_CLIP";
            break;
          case 6106:
            v4 = @"ORDER_DELIVERY";
            break;
          case 6107:
            v4 = @"VIEW_MENU";
            break;
          case 6108:
            v4 = @"TAP_EDIT_STOPS";
            break;
          case 6109:
            v4 = @"LEARN_MORE_WEB_CONTENT";
            break;
          case 6110:
            v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
            break;
          case 6111:
            v4 = @"REVEAL_SHOWCASE";
            break;
          default:
            switch((int)action)
            {
              case 5001:
                v4 = @"SHOW_MAPS_SETTINGS";
                break;
              case 5002:
                v4 = @"TAP_STANDARD_MODE";
                break;
              case 5003:
                v4 = @"TAP_TRANSIT_MODE";
                break;
              case 5004:
                v4 = @"TAP_SATELLITE_MODE";
                break;
              case 5005:
                v4 = @"SWITCH_ON_TRAFFIC";
                break;
              case 5006:
                v4 = @"SWITCH_OFF_TRAFFIC";
                break;
              case 5007:
                v4 = @"SWITCH_ON_LABELS";
                break;
              case 5008:
                v4 = @"SWITCH_OFF_LABELS";
                break;
              case 5009:
                v4 = @"SWITCH_ON_3D_MAP";
                break;
              case 5010:
                v4 = @"SWITCH_OFF_3D_MAP";
                break;
              case 5011:
                v4 = @"SWITCH_ON_WEATHER";
                break;
              case 5012:
                v4 = @"SWITCH_OFF_WEATHER";
                break;
              case 5013:
                v4 = @"REPORT_A_PROBLEM";
                break;
              case 5014:
                v4 = @"ADD_PLACE";
                break;
              case 5015:
                goto LABEL_53;
              case 5016:
                v4 = @"TAP_PREFERENCES";
                break;
              case 5017:
                v4 = @"SWITCH_ON_TOLLS";
                break;
              case 5018:
                v4 = @"SWITCH_OFF_TOLLS";
                break;
              case 5019:
                v4 = @"SWITCH_ON_HIGHWAYS";
                break;
              case 5020:
                v4 = @"SWITCH_OFF_HIGHWAYS";
                break;
              case 5021:
                v4 = @"SWITCH_ON_HEADING";
                break;
              case 5022:
                v4 = @"SWITCH_OFF_HEADING";
                break;
              case 5023:
                v4 = @"SWITCH_ON_SPEED_LIMIT";
                break;
              case 5024:
                v4 = @"SWITCH_OFF_SPEED_LIMIT";
                break;
              case 5025:
                v4 = @"ELECT_DRIVING_MODE";
                break;
              case 5026:
                v4 = @"ELECT_WALKING_MODE";
                break;
              case 5027:
                v4 = @"ELECT_TRANSIT_MODE";
                break;
              case 5028:
                v4 = @"ELECT_RIDESHARE_MODE";
                break;
              case 5029:
                v4 = @"SWITCH_ON_FIND_MY_CAR";
                break;
              case 5030:
                v4 = @"SWITCH_OFF_FIND_MY_CAR";
                break;
              case 5031:
                v4 = @"MARK_MY_LOCATION";
                break;
              case 5032:
                v4 = @"TAP_HYBRID_MODE";
                break;
              case 5033:
                v4 = @"CHECK_AVOID_BUSY_ROADS";
                break;
              case 5034:
                v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                break;
              case 5035:
                v4 = @"CHECK_AVOID_HILLS";
                break;
              case 5036:
                v4 = @"UNCHECK_AVOID_HILLS";
                break;
              case 5037:
                v4 = @"CHECK_AVOID_STAIRS";
                break;
              case 5038:
                v4 = @"UNCHECK_AVOID_STAIRS";
                break;
              case 5039:
                v4 = @"ELECT_CYCLING_MODE";
                break;
              default:
                switch((int)action)
                {
                  case 4001:
                    v4 = @"RECENTER_CURRENT_LOCATION";
                    break;
                  case 4002:
                    v4 = @"TAP_HEADING_ON";
                    break;
                  case 4003:
                    v4 = @"TAP_HEADING_OFF";
                    break;
                  case 4004:
                    v4 = @"PUCK_DRIFT";
                    break;
                  case 4005:
                    v4 = @"PUCK_SNAP";
                    break;
                  case 4006:
                    v4 = @"SELECT_FLOOR";
                    break;
                  default:
                    goto LABEL_53;
                }
                break;
            }
            break;
        }
      }
    }
    else if ((int)action > 13000)
    {
      if ((int)action <= 16000)
      {
        if ((int)action <= 15000)
        {
          switch((int)action)
          {
            case 14001:
              v4 = @"VIEW_APP";
              break;
            case 14002:
              v4 = @"ENABLE";
              break;
            case 14003:
              v4 = @"BOOK_RIDE";
              break;
            case 14004:
              v4 = @"REQUEST_RIDE";
              break;
            case 14005:
              v4 = @"CONTACT_DRIVER";
              break;
            case 14006:
              v4 = @"CHANGE_PAYMENT";
              break;
            case 14007:
              v4 = @"ENABLE_ALL_RIDESHARE_APPS";
              break;
            case 14008:
              v4 = @"TAP_FOR_MORE_RIDES";
              break;
            case 14009:
              v4 = @"SUBMIT_TRIP_FEEDBACK";
              break;
            default:
              switch((int)action)
              {
                case 13001:
                  v4 = @"SELECT_ADDRESS";
                  break;
                case 13002:
                  v4 = @"ADD_ADDRESS";
                  break;
                case 13003:
                  v4 = @"SELECT_LABEL";
                  break;
                case 13004:
                  v4 = @"DELETE_ADDRESS";
                  break;
                case 13005:
                  v4 = @"EDIT_ITEMS";
                  break;
                case 13006:
                  v4 = @"RAP_FAVORITES";
                  break;
                case 13007:
                  v4 = @"SORT_LIST_ITEM";
                  break;
                default:
                  goto LABEL_53;
              }
              break;
          }
        }
        else
        {
          switch(action)
          {
            case 0x3A99:
              v4 = @"ORB_PEEK";
              break;
            case 0x3A9A:
              v4 = @"ORB_POP";
              break;
            case 0x3A9B:
              v4 = @"ORB_DISMISS";
              break;
            default:
LABEL_53:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", action);
              v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
      }
      else
      {
        switch((int)action)
        {
          case 17001:
            v4 = @"START_DRAG";
            break;
          case 17002:
            v4 = @"CANCEL_DRAG";
            break;
          case 17003:
            v4 = @"COMPLETE_DRAG";
            break;
          case 17004:
            v4 = @"START_DROP";
            break;
          case 17005:
            v4 = @"CANCEL_DROP";
            break;
          case 17006:
            v4 = @"COMPLETE_DROP";
            break;
          case 17007:
            v4 = @"ANNOTATION_SELECT";
            break;
          case 17008:
            v4 = @"ANNOTATION_SELECT_AUTO";
            break;
          case 17009:
            v4 = @"ANNOTATION_SELECT_LIST";
            break;
          case 17010:
            v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
            break;
          case 17011:
            v4 = @"CALLOUT_FLYOVER_TOUR";
            break;
          case 17012:
            v4 = @"CALLOUT_INFO";
            break;
          case 17013:
            v4 = @"CALLOUT_NAV_TRANSIT";
            break;
          case 17014:
            v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
            break;
          case 17015:
            v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
            break;
          case 17016:
            v4 = @"DIRECTIONS_SELECT";
            break;
          case 17017:
            v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
            break;
          case 17018:
            v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
            break;
          case 17019:
            v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
            break;
          case 17020:
            v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
            break;
          case 17021:
            v4 = @"DIRECTIONS_TRANSIT_LATER";
            break;
          case 17022:
            v4 = @"DIRECTIONS_TRANSIT_NOW";
            break;
          case 17023:
            v4 = @"FLYOVER_NOTIFICATION_DISMISS";
            break;
          case 17024:
            v4 = @"FLYOVER_NOTIFICATION_START";
            break;
          case 17025:
            v4 = @"FLYOVER_TOUR_COMPLETED";
            break;
          case 17026:
            v4 = @"FLYOVER_TOUR_END";
            break;
          case 17027:
            v4 = @"FLYOVER_TOUR_NOTIFICATION";
            break;
          case 17028:
            v4 = @"FLYOVER_TOUR_START";
            break;
          case 17029:
            v4 = @"INFO_BOOKMARKS";
            break;
          case 17030:
            v4 = @"INFO_CARD_DETACHED";
            break;
          case 17031:
            v4 = @"INFO_CONTACTS";
            break;
          case 17032:
            v4 = @"INFO_DIRECTIONS";
            break;
          case 17033:
            v4 = @"INFO_DIRECTIONS_FROM";
            break;
          case 17034:
            v4 = @"INFO_DIRECTIONS_TO";
            break;
          case 17035:
            v4 = @"INFO_DISMISS";
            break;
          case 17036:
            v4 = @"INFO_INFO";
            break;
          case 17037:
            v4 = @"INFO_PHOTOS";
            break;
          case 17038:
            v4 = @"INFO_REVIEWS";
            break;
          case 17039:
            v4 = @"INFO_SHARE";
            break;
          case 17040:
            v4 = @"INFO_SHARE_AIRDROP";
            break;
          case 17041:
            v4 = @"INFO_SHARE_FACEBOOK";
            break;
          case 17042:
            v4 = @"INFO_SHARE_MAIL";
            break;
          case 17043:
            v4 = @"INFO_SHARE_MESSAGE";
            break;
          case 17044:
            v4 = @"INFO_SHARE_TENCENTWEIBO";
            break;
          case 17045:
            v4 = @"INFO_SHARE_WEIBO";
            break;
          case 17046:
            v4 = @"INFO_YELP";
            break;
          case 17047:
            v4 = @"MAPS_APP_LAUNCH";
            break;
          case 17048:
            v4 = @"MAP_3D_OFF";
            break;
          case 17049:
            v4 = @"MAP_3D_ON";
            break;
          case 17050:
            v4 = @"MAP_OPTIONS_DROP_PIN";
            break;
          case 17051:
            v4 = @"MAP_OPTIONS_HYBRID";
            break;
          case 17052:
            v4 = @"MAP_OPTIONS_PRINT";
            break;
          case 17053:
            v4 = @"MAP_OPTIONS_REMOVE_PIN";
            break;
          case 17054:
            v4 = @"MAP_OPTIONS_SATELLITE";
            break;
          case 17055:
            v4 = @"MAP_OPTIONS_STANDARD";
            break;
          case 17056:
            v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
            break;
          case 17057:
            v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
            break;
          case 17058:
            v4 = @"MAP_OPTIONS_TRANSIT";
            break;
          case 17059:
            v4 = @"MAP_TAP_FLYOVER_CITY";
            break;
          case 17060:
            v4 = @"MAP_TAP_LINE";
            break;
          case 17061:
            v4 = @"MAP_TAP_POI_TRANSIT";
            break;
          case 17062:
            v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
            break;
          case 17063:
            v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
            break;
          case 17064:
            v4 = @"MAP_USER_TRACKING_OFF";
            break;
          case 17065:
            v4 = @"MAP_USER_TRACKING_ON";
            break;
          case 17066:
            v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
            break;
          case 17067:
            v4 = @"NAV_CLEAR";
            break;
          case 17068:
            v4 = @"NAV_LIST";
            break;
          case 17069:
            v4 = @"NAV_ROUTE_STEP_NEXT";
            break;
          case 17070:
            v4 = @"NAV_ROUTE_STEP_PREV";
            break;
          case 17071:
            v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
            break;
          case 17072:
            v4 = @"ORB_DISPLAY_MENU";
            break;
          case 17073:
            v4 = @"ORB_MENU_CALL";
            break;
          case 17074:
            v4 = @"ORB_MENU_DIRECTIONS";
            break;
          case 17075:
            v4 = @"ORB_MENU_DISMISS";
            break;
          case 17076:
            v4 = @"ORB_MENU_SHARE";
            break;
          case 17077:
            v4 = @"ORB_MENU_SHOW_PLACECARD";
            break;
          case 17078:
            v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
            break;
          case 17079:
            v4 = @"ORB_MENU_URL";
            break;
          case 17080:
            v4 = @"ORB_PRESS";
            break;
          case 17081:
            v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
            break;
          case 17082:
            v4 = @"ORB_SPRINGBOARD_SEARCH";
            break;
          case 17083:
            v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
            break;
          case 17084:
            v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
            break;
          case 17085:
            v4 = @"RAP_PERMISSION_CANCEL";
            break;
          case 17086:
            v4 = @"RAP_PERMISSION_EMAIL_NA";
            break;
          case 17087:
            v4 = @"RAP_PERMISSION_EMAIL_OK";
            break;
          case 17088:
            v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
            break;
          case 17089:
            v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
            break;
          case 17090:
            v4 = @"RAP_PERMISSION_OK";
            break;
          case 17091:
            v4 = @"SEARCH_BEGIN";
            break;
          case 17092:
            v4 = @"SEARCH_CANCEL";
            break;
          case 17093:
            v4 = @"SEARCH_SELECT";
            break;
          case 17094:
            v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
            break;
          case 17095:
            v4 = @"TRANSIT_LINE_SELECTION_VIEW";
            break;
          case 17096:
            v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
            break;
          case 17097:
            v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
            break;
          case 17098:
            v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
            break;
          case 17099:
            v4 = @"UNKNOWN_ACTION";
            break;
          case 17100:
            v4 = @"INFO_SHARE_TWITTER";
            break;
          case 17101:
            v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
            break;
          case 17102:
            v4 = @"INFO_DIRECTIONS_WALK";
            break;
          case 17103:
            v4 = @"INFO_DIRECTIONS_TRANSIT";
            break;
          case 17104:
            v4 = @"INFO_DIRECTIONS_DRIVE";
            break;
          case 17105:
            v4 = @"INFO_REPORT_A_PROBLEM";
            break;
          case 17106:
            v4 = @"CALLOUT_NAV";
            break;
          case 17107:
            v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
            break;
          case 17108:
            v4 = @"MAP_TAP_POI";
            break;
          default:
            if (action == 16001)
            {
              v4 = @"SEARCH_IN_MAPS";
            }
            else
            {
              if (action != 90010) {
                goto LABEL_53;
              }
              v4 = @"PAN_RIGHT";
            }
            break;
        }
      }
    }
    else
    {
      switch((int)action)
      {
        case 10101:
          v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
          break;
        case 10102:
          v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
          break;
        case 10103:
          v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
          break;
        case 10104:
          v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
          break;
        case 10105:
          v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
          break;
        case 10106:
          v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
          break;
        case 10107:
          v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
          break;
        case 10108:
          v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
          break;
        case 10109:
          v4 = @"RAP_CANCEL";
          break;
        case 10110:
          v4 = @"RAP_NEXT";
          break;
        case 10111:
          v4 = @"RAP_BACK";
          break;
        case 10112:
          v4 = @"RAP_SEND";
          break;
        case 10113:
          v4 = @"RAP_SKIP";
          break;
        case 10114:
          v4 = @"RAP_SHOW_MORE";
          break;
        case 10115:
          v4 = @"RAP_ADD_PHOTO";
          break;
        case 10116:
          v4 = @"RAP_MAP_INCORRECT";
          break;
        case 10117:
          v4 = @"RAP_BAD_DIRECTIONS";
          break;
        case 10118:
          v4 = @"RAP_TRANSIT_INFO_INCORRECT";
          break;
        case 10119:
          v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
          break;
        case 10120:
          v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
          break;
        case 10121:
          v4 = @"RAP_ADD_A_PLACE";
          break;
        case 10122:
          v4 = @"RAP_HOME";
          break;
        case 10123:
          v4 = @"RAP_WORK";
          break;
        case 10124:
          v4 = @"RAP_OTHER";
          break;
        case 10125:
          v4 = @"RAP_LOCATION";
          break;
        case 10126:
          v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
          break;
        case 10127:
          v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
          break;
        case 10128:
          v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
          break;
        case 10129:
          v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
          break;
        case 10130:
          v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
          break;
        case 10131:
          v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
          break;
        case 10132:
          v4 = @"RAP_TRANSIT_DELAY";
          break;
        case 10133:
          v4 = @"RAP_LOCATION_CLOSED";
          break;
        case 10134:
          v4 = @"RAP_CLOSED_PERMANENTLY";
          break;
        case 10135:
          v4 = @"RAP_CLOSED_TEMPORARILY";
          break;
        case 10136:
          v4 = @"RAP_HOURS_HAVE_CHANGED";
          break;
        case 10137:
          v4 = @"RAP_SELECT_STATION";
          break;
        case 10138:
          v4 = @"RAP_SELECT_LINE";
          break;
        case 10139:
          v4 = @"RAP_SELECT_ACCESS_POINT";
          break;
        case 10140:
          v4 = @"RAP_SELECT_SEARCH";
          break;
        case 10141:
          v4 = @"RAP_PAN_MAP";
          break;
        case 10142:
          v4 = @"RAP_CENTER_MAP_ON_USER";
          break;
        case 10143:
          v4 = @"RAP_SEARCH_UNEXPECTED";
          break;
        case 10144:
          v4 = @"RAP_ADD_POI";
          break;
        case 10145:
          v4 = @"RAP_ADD_STREET_ADDRESS";
          break;
        case 10146:
          v4 = @"RAP_ADD_OTHER";
          break;
        case 10147:
          v4 = @"RAP_SELECT_CATEGORY";
          break;
        case 10148:
          v4 = @"RAP_TAKE_PHOTO";
          break;
        case 10149:
          v4 = @"RAP_RETAKE_PHOTO";
          break;
        case 10150:
          v4 = @"RAP_PLACE_DETAILS";
          break;
        case 10151:
          v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
          break;
        case 10152:
          v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
          break;
        case 10153:
          v4 = @"RAP_SELECT_LABEL";
          break;
        case 10154:
          v4 = @"RAP_SELECT_ROUTE";
          break;
        case 10155:
          v4 = @"RAP_CLAIM_BUSINESS";
          break;
        case 10156:
          v4 = @"RAP_BRAND_DETAILS";
          break;
        case 10157:
          v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
          break;
        case 10158:
          v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
          break;
        case 10159:
          v4 = @"RAP_LOOK_AROUND_BLURRING";
          break;
        case 10160:
          v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
          break;
        case 10161:
          v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
          break;
        case 10162:
          v4 = @"RAP_LOOK_AROUND_PRIVACY";
          break;
        case 10163:
          v4 = @"RAP_INCORRECT_HOURS";
          break;
        case 10164:
          v4 = @"RAP_INCORRECT_ADDRESS";
          break;
        case 10165:
          v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 10166:
          v4 = @"RAP_EDIT_PLACE_NAME";
          break;
        case 10167:
          v4 = @"RAP_EDIT_ADDRESS";
          break;
        case 10168:
          v4 = @"RAP_ADD_CATEGORY";
          break;
        case 10169:
          v4 = @"RAP_REMOVE_CATEGORY";
          break;
        case 10170:
          v4 = @"RAP_DESELECT_CATEGORY";
          break;
        case 10171:
          v4 = @"RAP_ADD_HOURS";
          break;
        case 10172:
          v4 = @"RAP_REMOVE_HOURS";
          break;
        case 10173:
          v4 = @"RAP_TAP_DAY_OF_WEEK";
          break;
        case 10174:
          v4 = @"RAP_TAP_24_HOURS_BUTTON";
          break;
        case 10175:
          v4 = @"RAP_TAP_OPEN_TIME";
          break;
        case 10176:
          v4 = @"RAP_TAP_CLOSED_TIME";
          break;
        case 10177:
          v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
          break;
        case 10178:
          v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
          break;
        case 10179:
          v4 = @"RAP_EDIT_WEBSITE";
          break;
        case 10180:
          v4 = @"RAP_EDIT_PHONE_NUMBER";
          break;
        case 10181:
          v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
          break;
        case 10182:
          v4 = @"RAP_ADD_COMMENTS";
          break;
        case 10183:
          v4 = @"RAP_EDIT_LOCATION";
          break;
        case 10184:
          v4 = @"RAP_VIEW_LOCATION";
          break;
        case 10185:
          v4 = @"RAP_ZOOM_IN";
          break;
        case 10186:
          v4 = @"RAP_ZOOM_OUT";
          break;
        case 10187:
          v4 = @"RAP_VIEW_ENTRY_POINTS";
          break;
        case 10188:
          v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
          break;
        case 10189:
          v4 = @"RAP_ADD_NEW_ENTRY_POINT";
          break;
        case 10190:
          v4 = @"RAP_REMOVE_ENTRY_POINT";
          break;
        case 10191:
          v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
          break;
        default:
          switch((int)action)
          {
            case 11001:
              v4 = @"EXIT_MAPS_LOWER_WRIST";
              break;
            case 11002:
              v4 = @"TASK_READY";
              break;
            case 11003:
              v4 = @"TAP_SEARCH";
              break;
            case 11004:
              v4 = @"TAP_MY_LOCATION";
              break;
            case 11005:
              v4 = @"SHOW_NEARBY";
              break;
            case 11006:
              v4 = @"TAP_NEARBY";
              break;
            case 11007:
              v4 = @"TAP_PROACTIVE";
              break;
            case 11008:
              v4 = @"FORCE_PRESS";
              break;
            case 11009:
              v4 = @"TAP_CONTACTS";
              break;
            case 11010:
              v4 = @"TAP_TRANSIT";
              break;
            case 11011:
              v4 = @"TAP_DICTATION";
              break;
            case 11012:
              v4 = @"GET_DIRECTIONS_DRIVING";
              break;
            case 11013:
              v4 = @"GET_DIRECTIONS_WALKING";
              break;
            case 11014:
              v4 = @"GET_DIRECTIONS_TRANSIT";
              break;
            case 11015:
              v4 = @"OPEN_STANDARD_MAP";
              break;
            case 11016:
              v4 = @"OPEN_TRANSIT_MAP";
              break;
            case 11017:
              v4 = @"START_NAV_AUTO";
              break;
            case 11018:
              v4 = @"TAP_RECENT";
              break;
            case 11019:
              v4 = @"TAP_FAVORITE";
              break;
            case 11020:
              v4 = @"TAP_SCRIBBLE";
              break;
            case 11021:
              v4 = @"TAP_VIEW_MAP";
              break;
            case 11022:
              v4 = @"TAP_VIEW_TBT";
              break;
            case 11023:
              v4 = @"VIEW_ROUTE_INFO";
              break;
            case 11024:
              v4 = @"NAV_UNMUTE";
              break;
            case 11025:
              v4 = @"NAV_MUTE";
              break;
            case 11026:
              v4 = @"GET_DIRECTIONS_CYCLING";
              break;
            case 11027:
              v4 = @"TAP_SEARCH_HOME";
              break;
            case 11028:
              v4 = @"ROUTE_PAUSED_ON_WATCH";
              break;
            case 11029:
              v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
              break;
            default:
              switch((int)action)
              {
                case 12001:
                  v4 = @"VIEW_MORE_OPTIONS";
                  break;
                case 12002:
                  v4 = @"SELECT_TIME";
                  break;
                case 12003:
                  v4 = @"SHOW_NEXT_AVAILABLE";
                  break;
                case 12004:
                  v4 = @"DECREASE_TABLE_SIZE";
                  break;
                case 12005:
                  v4 = @"INCREASE_TABLE_SIZE";
                  break;
                case 12006:
                  v4 = @"EDIT_BOOKING";
                  break;
                case 12007:
                  v4 = @"EDIT_PHONE";
                  break;
                case 12008:
                  v4 = @"ADD_SPECIAL_REQUEST";
                  break;
                case 12009:
                  v4 = @"CHANGE_RESERVATION";
                  break;
                case 12010:
                  v4 = @"LEARN_MORE";
                  break;
                default:
                  goto LABEL_53;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v4 = @"UI_ACTION_UNKNOWN";
    switch((int)action)
    {
      case 0:
        break;
      case 1:
        v4 = @"PULL_UP";
        break;
      case 2:
        v4 = @"PULL_DOWN";
        break;
      case 3:
        v4 = @"TAP";
        break;
      case 4:
        v4 = @"CLOSE";
        break;
      case 5:
        v4 = @"SWIPE_PREV";
        break;
      case 6:
        v4 = @"SWIPE_NEXT";
        break;
      case 7:
        v4 = @"SCROLL_UP";
        break;
      case 8:
        v4 = @"SCROLL_DOWN";
        break;
      case 9:
      case 23:
      case 24:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
      case 506:
      case 507:
      case 508:
      case 509:
      case 510:
      case 511:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 613:
      case 614:
      case 615:
      case 616:
      case 617:
      case 618:
      case 619:
      case 620:
      case 621:
      case 622:
      case 623:
      case 624:
      case 625:
      case 626:
      case 627:
      case 628:
      case 629:
      case 630:
      case 631:
      case 632:
      case 633:
      case 634:
      case 635:
      case 636:
      case 637:
      case 638:
      case 639:
      case 640:
      case 641:
      case 642:
      case 643:
      case 644:
      case 645:
      case 646:
      case 647:
      case 648:
      case 649:
      case 650:
      case 651:
      case 652:
      case 653:
      case 654:
      case 655:
      case 656:
      case 657:
      case 658:
      case 659:
      case 660:
      case 661:
      case 662:
      case 663:
      case 664:
      case 665:
      case 666:
      case 667:
      case 668:
      case 669:
      case 670:
      case 671:
      case 672:
      case 673:
      case 674:
      case 675:
      case 676:
      case 677:
      case 678:
      case 679:
      case 680:
      case 681:
      case 682:
      case 683:
      case 684:
      case 685:
      case 686:
      case 687:
      case 688:
      case 689:
      case 690:
      case 691:
      case 692:
      case 693:
      case 694:
      case 695:
      case 696:
      case 697:
      case 698:
      case 699:
      case 700:
      case 701:
      case 702:
      case 703:
      case 704:
      case 705:
      case 706:
      case 707:
      case 708:
      case 709:
      case 710:
      case 711:
      case 712:
      case 713:
      case 714:
      case 715:
      case 716:
      case 717:
      case 718:
      case 719:
      case 720:
      case 721:
      case 722:
      case 723:
      case 724:
      case 725:
      case 726:
      case 727:
      case 728:
      case 729:
      case 730:
      case 731:
      case 732:
      case 733:
      case 734:
      case 735:
      case 736:
      case 737:
      case 738:
      case 739:
      case 740:
      case 741:
      case 742:
      case 743:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
      case 801:
      case 802:
      case 803:
      case 804:
      case 805:
      case 806:
      case 807:
      case 808:
      case 809:
      case 810:
      case 811:
      case 812:
      case 813:
      case 814:
      case 815:
      case 816:
      case 817:
      case 818:
      case 819:
      case 820:
      case 821:
      case 822:
      case 823:
      case 824:
      case 825:
      case 826:
      case 827:
      case 828:
      case 829:
      case 830:
      case 831:
      case 832:
      case 833:
      case 834:
      case 835:
      case 836:
      case 837:
      case 838:
      case 839:
      case 840:
      case 841:
      case 842:
      case 843:
      case 844:
      case 845:
      case 846:
      case 847:
      case 848:
      case 849:
      case 850:
      case 851:
      case 852:
      case 853:
      case 854:
      case 855:
      case 856:
      case 857:
      case 858:
      case 859:
      case 860:
      case 861:
      case 862:
      case 863:
      case 864:
      case 865:
      case 866:
      case 867:
      case 868:
      case 869:
      case 870:
      case 871:
      case 872:
      case 873:
      case 874:
      case 875:
      case 876:
      case 877:
      case 878:
      case 879:
      case 880:
      case 881:
      case 882:
      case 883:
      case 884:
      case 885:
      case 886:
      case 887:
      case 888:
      case 889:
      case 890:
      case 891:
      case 892:
      case 893:
      case 894:
      case 895:
      case 896:
      case 897:
      case 898:
      case 899:
      case 900:
      case 901:
      case 902:
      case 903:
      case 904:
      case 905:
      case 906:
      case 907:
      case 908:
      case 909:
      case 910:
      case 911:
      case 912:
      case 913:
      case 914:
      case 915:
      case 916:
      case 917:
      case 918:
      case 919:
      case 920:
      case 921:
      case 922:
      case 923:
      case 924:
      case 925:
      case 926:
      case 927:
      case 928:
      case 929:
      case 930:
      case 931:
      case 932:
      case 933:
      case 934:
      case 935:
      case 936:
      case 937:
      case 938:
      case 939:
      case 940:
      case 941:
      case 942:
      case 943:
      case 944:
      case 945:
      case 946:
      case 947:
      case 948:
      case 949:
      case 950:
      case 951:
      case 952:
      case 953:
      case 954:
      case 955:
      case 956:
      case 957:
      case 958:
      case 959:
      case 960:
      case 961:
      case 962:
      case 963:
      case 964:
      case 965:
      case 966:
      case 967:
      case 968:
      case 969:
      case 970:
      case 971:
      case 972:
      case 973:
      case 974:
      case 975:
      case 976:
      case 977:
      case 978:
      case 979:
      case 980:
      case 981:
      case 982:
      case 983:
      case 984:
      case 985:
      case 986:
      case 987:
      case 988:
      case 989:
      case 990:
      case 991:
      case 992:
      case 993:
      case 994:
      case 995:
      case 996:
      case 997:
      case 998:
      case 999:
      case 1000:
      case 1005:
      case 1006:
      case 1007:
      case 1008:
      case 1009:
      case 1012:
      case 1013:
      case 1014:
      case 1015:
      case 1016:
      case 1019:
      case 1021:
      case 1022:
      case 1023:
      case 1024:
      case 1025:
      case 1026:
      case 1027:
      case 1028:
      case 1029:
        goto LABEL_53;
      case 10:
        v4 = @"SHOW_MORE";
        break;
      case 11:
        v4 = @"SHOW_LESS";
        break;
      case 12:
        v4 = @"SWIPE_LEFT";
        break;
      case 13:
        v4 = @"SWIPE_RIGHT";
        break;
      case 14:
        v4 = @"MINIMIZE";
        break;
      case 15:
        v4 = @"TAP_PREV";
        break;
      case 16:
        v4 = @"TAP_NEXT";
        break;
      case 17:
        v4 = @"SUBMIT";
        break;
      case 18:
        v4 = @"CANCEL";
        break;
      case 19:
        v4 = @"ENTER_MAPS";
        break;
      case 20:
        v4 = @"EXIT_MAPS";
        break;
      case 21:
        v4 = @"REVEAL";
        break;
      case 22:
        v4 = @"OPEN_NEW_TAB";
        break;
      case 25:
        v4 = @"BACK";
        break;
      case 26:
        v4 = @"ACTIVATE";
        break;
      case 27:
        v4 = @"DEACTIVATE";
        break;
      case 28:
        v4 = @"AGREE";
        break;
      case 29:
        v4 = @"DISAGREE";
        break;
      case 30:
        v4 = @"SKIP_ANSWER";
        break;
      case 31:
        v4 = @"EXPAND";
        break;
      case 32:
        v4 = @"COLLAPSE";
        break;
      case 33:
        v4 = @"ENTER";
        break;
      case 34:
        v4 = @"EXIT";
        break;
      case 35:
        v4 = @"SCROLL_UP_INDEX_BAR";
        break;
      case 36:
        v4 = @"SCROLL_DOWN_INDEX_BAR";
        break;
      case 37:
        v4 = @"TOGGLE_ON";
        break;
      case 38:
        v4 = @"TOGGLE_OFF";
        break;
      case 39:
        v4 = @"LONG_PRESS";
        break;
      case 40:
        v4 = @"CLICK";
        break;
      case 41:
        v4 = @"TAP_DONE";
        break;
      case 42:
        v4 = @"TAP_CLOSE";
        break;
      case 43:
        v4 = @"SCROLL_LEFT";
        break;
      case 44:
        v4 = @"SCROLL_RIGHT";
        break;
      case 45:
        v4 = @"DISPLAY";
        break;
      case 46:
        v4 = @"OPEN_IN_APP";
        break;
      case 47:
        v4 = @"CONCEAL";
        break;
      case 48:
        v4 = @"TAP_DELETE";
        break;
      case 49:
        v4 = @"TAP_FILTER";
        break;
      case 50:
        v4 = @"TAP_SECONDARY_BUTTON";
        break;
      case 51:
        v4 = @"TAP_WIDGET_FOOD";
        break;
      case 52:
        v4 = @"TAP_WIDGET_GAS";
        break;
      case 53:
        v4 = @"TAP_WIDGET_LOADING";
        break;
      case 54:
        v4 = @"TAP_WIDGET_SEARCH";
        break;
      case 55:
        v4 = @"TAP_WIDGET_STORES";
        break;
      case 56:
        v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
        break;
      case 57:
        v4 = @"SHARE_CURRENT_LOCATION";
        break;
      case 58:
        v4 = @"SHARE_PHOTO";
        break;
      case 59:
        v4 = @"TAP_KEEP_OFF";
        break;
      case 60:
        v4 = @"TAP_PHOTO_CATEGORY";
        break;
      case 61:
        v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
        break;
      case 62:
        v4 = @"TAP_TURN_ON";
        break;
      case 63:
        v4 = @"DISPLAY_CYCLING_ANNOTATION";
        break;
      case 64:
        v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
        break;
      case 65:
        v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
        break;
      case 66:
        v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
        break;
      case 67:
        v4 = @"TAP_CYCLING_ANNOTATION";
        break;
      case 68:
        v4 = @"TAP_DRIVING_DEFAULT_OPTION";
        break;
      case 69:
        v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
        break;
      case 70:
        v4 = @"TAP_WALKING_DEFAULT_OPTION";
        break;
      case 71:
        v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
        break;
      case 72:
        v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
        break;
      case 73:
        v4 = @"TAP_PERSONAL_COLLECTION";
        break;
      case 74:
        v4 = @"RESUME_ROUTE";
        break;
      case 75:
        v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
        break;
      case 76:
        v4 = @"TAP_ALLOW_ONCE";
        break;
      case 77:
        v4 = @"TAP_DO_NOT_ALLOW";
        break;
      case 78:
        v4 = @"ADD_RECCOMENDED_FAVORITE";
        break;
      case 79:
        v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
        break;
      case 80:
        v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 81:
        v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
        break;
      case 82:
        v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
        break;
      case 83:
        v4 = @"CREATE_SCHOOL_FAVORITE";
        break;
      case 84:
        v4 = @"TAP_SCHOOL_FAVORITE";
        break;
      case 85:
        v4 = @"SELECT_ROUTING_TYPE_CYCLING";
        break;
      case 86:
        v4 = @"REPORT_PHOTO";
        break;
      case 87:
        v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
        break;
      case 88:
        v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
        break;
      case 89:
        v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
        break;
      case 90:
        v4 = @"CREATE_RECOMMENDED_FAVORITE";
        break;
      case 91:
        v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
        break;
      case 92:
        v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 93:
        v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
        break;
      case 94:
        v4 = @"TAP_SMALL_WIDGET_ITEM";
        break;
      case 95:
        v4 = @"TAP_MEDIUM_WIDGET_ITEM";
        break;
      case 96:
        v4 = @"TAP_LARGE_WIDGET_ITEM";
        break;
      case 97:
        v4 = @"DISPLAY_ARP_TIPKIT";
        break;
      case 98:
        v4 = @"NEXT";
        break;
      case 99:
        v4 = @"TAP_RATE_AND_ADD_PHOTOS";
        break;
      case 100:
        v4 = @"TAP_TO_ADD_POSITIVE_RATING";
        break;
      case 101:
        v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
        break;
      case 102:
        v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
        break;
      case 103:
        v4 = @"INVOKE_SIRI_PROMPT";
        break;
      case 104:
        v4 = @"ETA_SHARED_SUCCESSFULLY";
        break;
      case 105:
        v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
        break;
      case 106:
        v4 = @"CLEAR_INCIDENT";
        break;
      case 107:
        v4 = @"CONFIRM_INCIDENT";
        break;
      case 108:
        v4 = @"DISMISS_INCIDENT";
        break;
      case 109:
        v4 = @"INCIDENT_ALERT_TIMEOUT";
        break;
      case 110:
        v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
        break;
      case 111:
        v4 = @"INCIDENT_CARD_SHOWN";
        break;
      case 112:
        v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
        break;
      case 113:
        v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
        break;
      case 114:
        v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
        break;
      case 115:
        v4 = @"TAP_TO_REPORT_INCIDENT";
        break;
      case 116:
        v4 = @"TAP_SHORTCUT";
        break;
      case 117:
        v4 = @"BLOCK_CONTACT";
        break;
      case 118:
        v4 = @"TAP_TO_ADD_RATING";
        break;
      case 119:
        v4 = @"AR_WALKING_LOCALIZATION_FAILED";
        break;
      case 120:
        v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
        break;
      case 121:
        v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
        break;
      case 122:
        v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
        break;
      case 123:
        v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
        break;
      case 124:
        v4 = @"RAISE_TO_ENTER_AR_WALKING";
        break;
      case 125:
        v4 = @"TAP_DISMISS";
        break;
      case 126:
        v4 = @"TAP_ENTER_AR_WALKING";
        break;
      case 127:
        v4 = @"TAP_OK";
        break;
      case 128:
        v4 = @"TAP_TRY_AGAIN";
        break;
      case 129:
        v4 = @"TAP_TURN_ON_IN_SETTINGS";
        break;
      case 130:
        v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
        break;
      case 131:
        v4 = @"VLF_CORRECTION_USER_ABANDON";
        break;
      case 132:
        v4 = @"AREA_EVENTS_ALERT";
        break;
      case 133:
        v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
        break;
      case 134:
        v4 = @"ACCEPT_EVENT_REROUTE";
        break;
      case 135:
        v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
        break;
      case 136:
        v4 = @"DISMISS_EVENT_REROUTE";
        break;
      case 137:
        v4 = @"PUNCH_OUT_EVENTS_LINK";
        break;
      case 138:
        v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
        break;
      case 139:
        v4 = @"ADJUST_GUIDANCE_SETTINGS";
        break;
      case 140:
        v4 = @"HIDE_DETAILS";
        break;
      case 141:
        v4 = @"SELECT_VOICE_GUIDANCE_ON";
        break;
      case 142:
        v4 = @"SELECT_VOICE_GUIDANCE_OFF";
        break;
      case 143:
        v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
        break;
      case 144:
        v4 = @"TAP_TEXT_LABEL";
        break;
      case 145:
        v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
        break;
      case 146:
        v4 = @"TAP_EXIT";
        break;
      case 147:
        v4 = @"TAP_CITY_MENU";
        break;
      case 148:
        v4 = @"CHECK_AVOID_TOLLS";
        break;
      case 149:
        v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
        break;
      case 150:
        v4 = @"TAP_ICLOUD";
        break;
      case 151:
        v4 = @"CHECK_AVOID_HIGHWAYS";
        break;
      case 152:
        v4 = @"TAP_FAVORITES";
        break;
      case 153:
        v4 = @"SELECT_DISTANCE_IN_KM";
        break;
      case 154:
        v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
        break;
      case 155:
        v4 = @"OPEN_FULL_CARD_FILTER";
        break;
      case 156:
        v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
        break;
      case 157:
        v4 = @"OPEN_SINGLE_CARD_FILTER";
        break;
      case 158:
        v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 159:
        v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
        break;
      case 160:
        v4 = @"SESSIONLESS_REVEAL";
        break;
      case 161:
        v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
        break;
      case 162:
        v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
        break;
      case 163:
        v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
        break;
      case 164:
        v4 = @"ENTER_RAP_REPORT_MENU";
        break;
      case 165:
        v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
        break;
      case 166:
        v4 = @"TAP_MY_VEHICLES";
        break;
      case 167:
        v4 = @"SUBMIT_SINGLE_CARD_FILTER";
        break;
      case 168:
        v4 = @"SUBMIT_FULL_CARD_FILTER";
        break;
      case 169:
        v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
        break;
      case 170:
        v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
        break;
      case 171:
        v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
        break;
      case 172:
        v4 = @"TAP_ACCOUNT";
        break;
      case 173:
        v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
        break;
      case 174:
        v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
        break;
      case 175:
        v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
        break;
      case 176:
        v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
        break;
      case 177:
        v4 = @"TAP_CITY_CURATED_COLLECTIONS";
        break;
      case 178:
        v4 = @"TAP_REPORTS";
        break;
      case 179:
        v4 = @"TAP_RATINGS";
        break;
      case 180:
        v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
        break;
      case 181:
        v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
        break;
      case 182:
        v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
        break;
      case 183:
        v4 = @"SELECT_DISTANCE_IN_MILES";
        break;
      case 184:
        v4 = @"TAP_PRIVACY_STATEMENT";
        break;
      case 185:
        v4 = @"TAP_MAPS_SETTINGS";
        break;
      case 186:
        v4 = @"CANCEL_FULL_CARD_FILTER";
        break;
      case 187:
        v4 = @"TAP_LATEST_CURATED_COLLECTION";
        break;
      case 188:
        v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
        break;
      case 189:
        v4 = @"UNCHECK_AVOID_TOLLS";
        break;
      case 190:
        v4 = @"UNSELECT_SEARCH_REFINEMENT";
        break;
      case 191:
        v4 = @"TAP_RATING";
        break;
      case 192:
        v4 = @"TAP_ICLOUD_SIGN_IN";
        break;
      case 193:
        v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
        break;
      case 194:
        v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
        break;
      case 195:
        v4 = @"UNCHECK_AVOID_HIGHWAYS";
        break;
      case 196:
        v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
        break;
      case 197:
        v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
        break;
      case 198:
        v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
        break;
      case 199:
        v4 = @"TAP_MY_GUIDES";
        break;
      case 200:
        v4 = @"SELECT_SEARCH_REFINEMENT";
        break;
      case 201:
        v4 = @"SESSIONLESS_TAP_ACCOUNT";
        break;
      case 202:
        v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 203:
        v4 = @"TAP_TRAVEL_PREFERENCES";
        break;
      case 204:
        v4 = @"SHOW_CURATED_COLLECTION_LIST";
        break;
      case 205:
        v4 = @"CANCEL_SINGLE_CARD_FILTER";
        break;
      case 206:
        v4 = @"DISPLAY_HFP_OPTION";
        break;
      case 207:
        v4 = @"SWITCH_OFF_HFP";
        break;
      case 208:
        v4 = @"SWITCH_ON_HFP";
        break;
      case 209:
        v4 = @"TAP_QUICK_ACTION_TRAY";
        break;
      case 210:
        v4 = @"SHOW_ALL_CITIES";
        break;
      case 211:
        v4 = @"TAP_ADD_NEARBY_TRANSIT";
        break;
      case 212:
        v4 = @"RESUME";
        break;
      case 213:
        v4 = @"DISPLAY_TIPKIT_PROMPT";
        break;
      case 214:
        v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
        break;
      case 215:
        v4 = @"TAP_DRIVING_MODE";
        break;
      case 216:
        v4 = @"SWITCH_ON_VOICE_GUIDANCE";
        break;
      case 217:
        v4 = @"DISMISS_TIPKIT_PROMPT";
        break;
      case 218:
        v4 = @"TAP_EXPAND_EXIT_DETAILS";
        break;
      case 219:
        v4 = @"TAP_NEARBY_TRANSIT_FILTER";
        break;
      case 220:
        v4 = @"TAP_MORE_DEPARTURES";
        break;
      case 221:
        v4 = @"RAP_INDIVIDUAL_PLACE";
        break;
      case 222:
        v4 = @"RAP_ADD_MAP";
        break;
      case 223:
        v4 = @"TAP_SUGGESTED_RAP";
        break;
      case 224:
        v4 = @"RAP_STREET_ISSUE";
        break;
      case 225:
        v4 = @"SWIPE_PIN_REVEAL";
        break;
      case 226:
        v4 = @"TAP_ADD_TIPKIT_FAVORITE";
        break;
      case 227:
        v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
        break;
      case 228:
        v4 = @"RAP_BAD_TRIP";
        break;
      case 229:
        v4 = @"RAP_PLACE_ISSUE";
        break;
      case 230:
        v4 = @"TAP_OPEN_MAPS";
        break;
      case 231:
        v4 = @"TAP_NEARBY_TRANSIT_RESULT";
        break;
      case 232:
        v4 = @"RAP_GUIDE";
        break;
      case 233:
        v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
        break;
      case 234:
        v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
        break;
      case 235:
        v4 = @"SELECT_TRANSIT_STEP";
        break;
      case 236:
        v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
        break;
      case 237:
        v4 = @"TAP_SEE_MORE";
        break;
      case 238:
        v4 = @"RAP_IN_REVIEW";
        break;
      case 239:
        v4 = @"TAP_OPEN_MENU";
        break;
      case 240:
        v4 = @"TAP_NEARBY_TRANSIT";
        break;
      case 241:
        v4 = @"TAP_PIN_LINE";
        break;
      case 242:
        v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
        break;
      case 243:
        v4 = @"RAP_GOOD_TRIP";
        break;
      case 244:
        v4 = @"TAP_FILTERED_CURATED_COLLECTION";
        break;
      case 245:
        v4 = @"SHARE_MY_LOCATION";
        break;
      case 246:
        v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
        break;
      case 247:
        v4 = @"DISPLAY_GENERIC_ADVISORY";
        break;
      case 248:
        v4 = @"ADVISORY_ALERT";
        break;
      case 249:
        v4 = @"PUNCH_OUT_LINK";
        break;
      case 250:
        v4 = @"TAP_GENERIC_ADVISORY";
        break;
      case 251:
        v4 = @"TAP_EXPLORE_MODE";
        break;
      case 252:
        v4 = @"TAP_UNPIN_LINE";
        break;
      case 253:
        v4 = @"MENU_UNPIN";
        break;
      case 254:
        v4 = @"MENU_PIN";
        break;
      case 255:
        v4 = @"SWIPE_PIN";
        break;
      case 256:
        v4 = @"SWIPE_UNPIN";
        break;
      case 257:
        v4 = @"TAP_MEDIA_APP";
        break;
      case 258:
        v4 = @"TAP_GUIDES_SUBACTION";
        break;
      case 259:
        v4 = @"TAP_MEDIA";
        break;
      case 260:
        v4 = @"PUNCH_OUT_MEDIA";
        break;
      case 261:
        v4 = @"SHOW_MEDIA_APP_MENU";
        break;
      case 262:
        v4 = @"SCROLL_RIGHT_RIBBON";
        break;
      case 263:
        v4 = @"SCROLL_LEFT_RIBBON";
        break;
      case 264:
        v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
        break;
      case 265:
        v4 = @"TAP_SHOW_MORE_TEXT";
        break;
      case 266:
        v4 = @"SCROLL_LEFT_RATINGS";
        break;
      case 267:
        v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
        break;
      case 268:
        v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
        break;
      case 269:
        v4 = @"SCROLL_RIGHT_RATINGS";
        break;
      case 270:
        v4 = @"TAP_ALLOW";
        break;
      case 271:
        v4 = @"TAP_GO_TO_SETTING";
        break;
      case 272:
        v4 = @"START_SUBMIT_REPORT";
        break;
      case 273:
        v4 = @"AUTHENTICATION_INFO_FAILURE";
        break;
      case 274:
        v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
        break;
      case 275:
        v4 = @"FAILED_SUBMIT_REPORT";
        break;
      case 276:
        v4 = @"AUTHENTICATION_INFO_SUCCESS";
        break;
      case 277:
        v4 = @"EDIT_WAYPOINT";
        break;
      case 278:
        v4 = @"CLEAR_TEXT";
        break;
      case 279:
        v4 = @"REORDER_WAYPOINT";
        break;
      case 280:
        v4 = @"REMOVE_WAYPOINT";
        break;
      case 281:
        v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
        break;
      case 282:
        v4 = @"TAP_SHOWCASE_MENU";
        break;
      case 283:
        v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
        break;
      case 284:
        v4 = @"TAP_PHOTO_ALBUM";
        break;
      case 285:
        v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 286:
        v4 = @"RAP_INLINE_ADD";
        break;
      case 287:
        v4 = @"RAP_TAP_EDIT";
        break;
      case 288:
        v4 = @"CLAIM_BUSINESS";
        break;
      case 289:
        v4 = @"RAP_EDIT_OPTIONS";
        break;
      case 290:
        v4 = @"TAP_IN_REVIEW_RAP";
        break;
      case 291:
        v4 = @"ORB_MENU_ADD_STOP";
        break;
      case 292:
        v4 = @"NEXT_STOP";
        break;
      case 293:
        v4 = @"ARRIVE_AT_WAYPOINT";
        break;
      case 294:
        v4 = @"REMOVE_STOP";
        break;
      case 295:
        v4 = @"DISPLAY_PAUSE_BUTTON";
        break;
      case 296:
        v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
        break;
      case 297:
        v4 = @"AUTO_ADVANCE_NEXT_STOP";
        break;
      case 298:
        v4 = @"ADD_INLINE_NEGATIVE_RATING";
        break;
      case 299:
        v4 = @"ADD_INLINE_POSITIVE_RATING";
        break;
      case 300:
        v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
        break;
      case 301:
        v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
        break;
      case 302:
        v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
        break;
      case 303:
        v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
        break;
      case 304:
        v4 = @"SHOW_ALL_RECENTS";
        break;
      case 305:
        v4 = @"RESUME_MULTIPOINT_ROUTE";
        break;
      case 306:
        v4 = @"DISMISS_TRANSIT_TIPKIT";
        break;
      case 307:
        v4 = @"DISPLAY_TRANSIT_TIPKIT";
        break;
      case 308:
        v4 = @"TAP_TRANSIT_TIPKIT";
        break;
      case 309:
        v4 = @"FILTER_EV";
        break;
      case 310:
        v4 = @"FILTER_SURCHARGE";
        break;
      case 311:
        v4 = @"FILTER_PREFER";
        break;
      case 312:
        v4 = @"TAP_WALKING_ANNOTATION";
        break;
      case 313:
        v4 = @"FILTER_AVOID";
        break;
      case 314:
        v4 = @"FILTER_TRANSPORTATION_MODE";
        break;
      case 315:
        v4 = @"FILTER_RECOMMENDED_ROUTES";
        break;
      case 316:
        v4 = @"FILTER_IC_FARES";
        break;
      case 317:
        v4 = @"FILTER_TRANSIT_CARD_FARES";
        break;
      case 318:
        v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 319:
        v4 = @"TAP_NOTIFICATION_SETTINGS";
        break;
      case 320:
        v4 = @"TAP_ENABLE_NOTIFICATION";
        break;
      case 321:
        v4 = @"ARP_SUGGESTIONS_TURN_OFF";
        break;
      case 322:
        v4 = @"ARP_SUGGESTIONS_TURN_ON";
        break;
      case 323:
        v4 = @"DISMISS_ARP_SUGGESTION";
        break;
      case 324:
        v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
        break;
      case 325:
        v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
        break;
      case 326:
        v4 = @"UNSELECT_SUGGESTED_PHOTOS";
        break;
      case 327:
        v4 = @"SUGGESTED_PHOTOS_SHOWN";
        break;
      case 328:
        v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 329:
        v4 = @"TAP_YOUR_PHOTOS_ALBUM";
        break;
      case 330:
        v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
        break;
      case 331:
        v4 = @"DELETE_PHOTO";
        break;
      case 332:
        v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 333:
        v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
        break;
      case 334:
        v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 335:
        v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
        break;
      case 336:
        v4 = @"SELECT_SUGGESTED_PHOTOS";
        break;
      case 337:
        v4 = @"ADD_STOP";
        break;
      case 338:
        v4 = @"SHOW_CREDIT_TURN_ON";
        break;
      case 339:
        v4 = @"DISPLAY_ARP_SUGGESTION";
        break;
      case 340:
        v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
        break;
      case 341:
        v4 = @"SHOW_CREDIT_TURN_OFF";
        break;
      case 342:
        v4 = @"TAP_TO_EDIT_NICKNAME";
        break;
      case 343:
        v4 = @"SUBMIT_RATINGS";
        break;
      case 344:
        v4 = @"END_NAV_ON_WATCH";
        break;
      case 345:
        v4 = @"FILTER_EBIKE";
        break;
      case 356:
        v4 = @"ADD_STOP_SIRI";
        break;
      case 357:
        v4 = @"TAP_REVIEWED_RAP";
        break;
      case 358:
        v4 = @"TAP_OUTREACH_RAP";
        break;
      case 359:
        v4 = @"DISPLAY_SUGGESTED_ITEM";
        break;
      case 360:
        v4 = @"DISPLAY_HIKING_TIPKIT";
        break;
      case 361:
        v4 = @"DISMISS_HIKING_TIPKIT";
        break;
      case 362:
        v4 = @"TAP_HIKING_TIPKIT";
        break;
      case 363:
        v4 = @"SCROLL_LEFT_TRAILS";
        break;
      case 364:
        v4 = @"TAP_MORE_TRAILS";
        break;
      case 365:
        v4 = @"TAP_RELATED_TRAIL";
        break;
      case 366:
        v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
        break;
      case 367:
        v4 = @"SCROLL_RIGHT_TRAILS";
        break;
      case 368:
        v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 369:
        v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
        break;
      case 370:
        v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 371:
        v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 372:
        v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 373:
        v4 = @"EXPIRED_MAPS_REMOVED";
        break;
      case 374:
        v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
        break;
      case 375:
        v4 = @"TAP_EXPIRED_MAPS";
        break;
      case 376:
        v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 377:
        v4 = @"MOVE_DOWNLOAD_MAPS";
        break;
      case 378:
        v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
        break;
      case 379:
        v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 380:
        v4 = @"TAP_ENTER_OFFLINE_MAPS";
        break;
      case 381:
        v4 = @"TAP_DOWNLOAD_MAPS";
        break;
      case 382:
        v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
        break;
      case 383:
        v4 = @"DELETE_DOWNLOAD_MAPS";
        break;
      case 384:
        v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
        break;
      case 385:
        v4 = @"RENAME_DOWNLOAD_MAPS";
        break;
      case 386:
        v4 = @"RESIZE_DOWNLOAD_MAPS";
        break;
      case 387:
        v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
        break;
      case 388:
        v4 = @"RESTORE_EXPIRED_MAPS";
        break;
      case 389:
        v4 = @"CLEAR_EXPIRED_MAPS";
        break;
      case 390:
        v4 = @"TAP_USING_OFFLINE_BAR";
        break;
      case 391:
        v4 = @"UPDATE_DOWNLOAD_MAPS";
        break;
      case 392:
        v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 393:
        v4 = @"DISPLAY_DOWNLOAD_MAPS";
        break;
      case 394:
        v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
        break;
      case 395:
        v4 = @"DISPLAY_EXPIRED_MAPS";
        break;
      case 396:
        v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 397:
        v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
        break;
      case 398:
        v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
        break;
      case 399:
        v4 = @"ETA_SHARE_TRAY_TIMEOUT";
        break;
      case 400:
        v4 = @"START_ETA_SHARING";
        break;
      case 401:
        v4 = @"PERSON_LOCATION_UPDATE";
        break;
      case 402:
        v4 = @"STOP_ETA_SHARING";
        break;
      case 403:
        v4 = @"PUNCH_OUT_TO_FINDMY";
        break;
      case 404:
        v4 = @"TAP_PEOPLE_LOCATION";
        break;
      case 405:
        v4 = @"TAP_TO_REQUEST_LOCATION";
        break;
      case 406:
        v4 = @"ZOOM_OUT_CROWN";
        break;
      case 407:
        v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
        break;
      case 408:
        v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
        break;
      case 409:
        v4 = @"SELECT_LIST_VIEW";
        break;
      case 410:
        v4 = @"SCROLL_RIGHT_TRAILHEADS";
        break;
      case 411:
        v4 = @"SWITCH_TO_ONLINE_MODE";
        break;
      case 412:
        v4 = @"TAP_RELATED_TRAILHEAD";
        break;
      case 413:
        v4 = @"SELECT_ELEVATION_VIEW";
        break;
      case 414:
        v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
        break;
      case 415:
        v4 = @"SEE_MORE_RECENTS";
        break;
      case 416:
        v4 = @"SEE_MORE_GUIDES";
        break;
      case 417:
        v4 = @"SELECT_CONTROLS";
        break;
      case 418:
        v4 = @"NO_SEARCH_RESULTS";
        break;
      case 419:
        v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
        break;
      case 420:
        v4 = @"TAP_VIEW_RESULTS_LIST";
        break;
      case 421:
        v4 = @"SELECT_MAP_VIEW";
        break;
      case 422:
        v4 = @"SCROLL_LEFT_TRAILHEADS";
        break;
      case 423:
        v4 = @"SWITCH_TO_OFFLINE_MODE";
        break;
      case 424:
        v4 = @"ZOOM_IN_CROWN";
        break;
      case 425:
        v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
        break;
      case 426:
        v4 = @"TAP_MAP";
        break;
      case 427:
        v4 = @"SWIPE_DOWN";
        break;
      case 428:
        v4 = @"TAP_MORE_TRAILHEADS";
        break;
      case 429:
        v4 = @"TAP_ROUTE_OPTIONS";
        break;
      case 430:
        v4 = @"TAP_ROUTE_NAV_MAP";
        break;
      case 431:
        v4 = @"TAP_ROUTE_OVERVIEW_MAP";
        break;
      case 432:
        v4 = @"TAP_AUDIO";
        break;
      case 433:
        v4 = @"TAP_OPEN_PLACECARD";
        break;
      case 434:
        v4 = @"TAP_VIEW_STOPS";
        break;
      case 435:
        v4 = @"TAP_ROUTE_DETAILS";
        break;
      case 436:
        v4 = @"ADD_LPR_VEHICLE";
        break;
      case 437:
        v4 = @"TAP_ADD_VEHICLE";
        break;
      case 438:
        v4 = @"TAP_PLUG_TYPE";
        break;
      case 439:
        v4 = @"UNSELECT_SUGGESTED_NETWORK";
        break;
      case 440:
        v4 = @"TAP_SET_UP_LATER";
        break;
      case 441:
        v4 = @"ADD_EV_VEHICLE";
        break;
      case 442:
        v4 = @"UPDATE_COLOR";
        break;
      case 443:
        v4 = @"SELECT_OTHER_NETWORK";
        break;
      case 444:
        v4 = @"UNSELECT_NETWORK";
        break;
      case 445:
        v4 = @"TAP_BACK";
        break;
      case 446:
        v4 = @"TAP_CANCEL";
        break;
      case 447:
        v4 = @"UNSELECT_VEHICLE";
        break;
      case 448:
        v4 = @"UNSELECT_OTHER_NETWORK";
        break;
      case 449:
        v4 = @"DISPLAY_EV_TIPKIT";
        break;
      case 450:
        v4 = @"SELECT_NETWORK";
        break;
      case 451:
        v4 = @"TAP_EV_TIPKIT";
        break;
      case 452:
        v4 = @"TAP_CHOOSE_NETWORKS";
        break;
      case 453:
        v4 = @"TAP_ADD_NETWORK";
        break;
      case 454:
        v4 = @"FILTER_NETWORK";
        break;
      case 455:
        v4 = @"SELECT_SUGGESTED_NETWORK";
        break;
      case 456:
        v4 = @"TRANSIT_TO_WALKING";
        break;
      case 457:
        v4 = @"TRANSIT_TO_FINDMY";
        break;
      case 458:
        v4 = @"TAP_AC_KEYBOARD";
        break;
      case 459:
        v4 = @"REACH_PHOTO_STRIP_END";
        break;
      case 460:
        v4 = @"SEARCH_HERE_REVEAL";
        break;
      case 461:
        v4 = @"TAP_SEARCH_HERE";
        break;
      case 462:
        v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
        break;
      case 463:
        v4 = @"SAVE";
        break;
      case 464:
        v4 = @"TAP_MORE_CURATED_HIKES";
        break;
      case 465:
        v4 = @"CREATE_CUSTOM_ROUTE";
        break;
      case 466:
        v4 = @"TAP_TRY_NOW";
        break;
      case 467:
        v4 = @"TAP_CURATED_HIKE";
        break;
      case 468:
        v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
        break;
      case 469:
        v4 = @"ADD_TO_LIBRARY";
        break;
      case 470:
        v4 = @"START_HIKING";
        break;
      case 471:
        v4 = @"EDIT_NOTE";
        break;
      case 472:
        v4 = @"CREATE_NOTE";
        break;
      case 473:
        v4 = @"DELETE_PIN";
        break;
      case 474:
        v4 = @"ADD_ROUTE";
        break;
      case 475:
        v4 = @"ADD_PIN";
        break;
      case 476:
        v4 = @"REMOVE_FROM_COLLECTION";
        break;
      case 477:
        v4 = @"REMOVE_FROM_LIBRARY";
        break;
      case 478:
        v4 = @"TAP_ITEM";
        break;
      case 479:
        v4 = @"DELETE_ROUTE";
        break;
      case 480:
        v4 = @"TAP_ROUTE";
        break;
      case 481:
        v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
        break;
      case 482:
        v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 483:
        v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
        break;
      case 484:
        v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
        break;
      case 485:
        v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 486:
        v4 = @"TAP_DOWNLOAD_NOW_WATCH";
        break;
      case 487:
        v4 = @"REVEAL_DETECTION_LIST";
        break;
      case 488:
        v4 = @"TAP_RECOMMENDATION";
        break;
      case 489:
        v4 = @"TAP_EXPAND";
        break;
      case 490:
        v4 = @"EXPAND_DETECTION_LIST";
        break;
      case 1001:
        v4 = @"PAN";
        break;
      case 1002:
        v4 = @"ZOOM_IN";
        break;
      case 1003:
        v4 = @"ZOOM_OUT";
        break;
      case 1004:
        v4 = @"ROTATE";
        break;
      case 1010:
        v4 = @"TAP_POI";
        break;
      case 1011:
        v4 = @"TAP_POI_TRANSIT";
        break;
      case 1017:
        v4 = @"TAP_POI_HIGHLIGHTED";
        break;
      case 1018:
        v4 = @"TAP_POI_CLUSTERED";
        break;
      case 1020:
        v4 = @"TAP_POI_DROPPED_PIN";
        break;
      case 1030:
        v4 = @"DROP_PIN";
        break;
      case 1031:
        v4 = @"TAP_INCIDENT";
        break;
      case 1032:
        v4 = @"TAP_TRANSIT_LINE";
        break;
      case 1033:
        v4 = @"TAP_POI_CALENDAR";
        break;
      case 1034:
        v4 = @"TAP_POI_CURRENT_LOCATION";
        break;
      case 1035:
        v4 = @"TAP_POI_TRANSIT_LINE";
        break;
      case 1036:
        v4 = @"TAP_POI_LANDMARK";
        break;
      case 1037:
        v4 = @"TAP_POI_FLYOVER";
        break;
      case 1038:
        v4 = @"TAP_TO_HIDE_TRAY";
        break;
      case 1039:
        v4 = @"TAP_TO_REVEAL_TRAY";
        break;
      case 1040:
        v4 = @"TAP_COMPASS";
        break;
      case 1041:
        v4 = @"PITCH_AWAY_FROM_GROUND";
        break;
      case 1042:
        v4 = @"PITCH_CLOSER_TO_GROUND";
        break;
      case 1043:
        v4 = @"ZOOM_IN_PINCH";
        break;
      case 1044:
        v4 = @"ZOOM_OUT_PINCH";
        break;
      case 1045:
        v4 = @"ZOOM_IN_DOUBLE_TAP";
        break;
      case 1046:
        v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
        break;
      case 1047:
        v4 = @"ZOOM_IN_ONE_FINGER";
        break;
      case 1048:
        v4 = @"ZOOM_OUT_ONE_FINGER";
        break;
      case 1049:
        v4 = @"ZOOM_IN_BUTTON";
        break;
      case 1050:
        v4 = @"ZOOM_OUT_BUTTON";
        break;
      case 1051:
        v4 = @"TAP_TRAFFIC_CAMERA";
        break;
      case 1052:
        v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
        break;
      case 1053:
        v4 = @"OPEN_INDOOR_MAP";
        break;
      case 1054:
        v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
        break;
      case 1055:
        v4 = @"TAP_VENUE_BROWSE_BUTTON";
        break;
      case 1056:
        v4 = @"ENTER_VENUE_EXPERIENCE";
        break;
      case 1057:
        v4 = @"EXIT_VENUE_EXPERIENCE";
        break;
      case 1058:
        v4 = @"ZOOM_IN_SCENE_PINCH";
        break;
      case 1059:
        v4 = @"ZOOM_OUT_SCENE_PINCH";
        break;
      case 1060:
        v4 = @"ZOOM_RESET";
        break;
      case 1061:
        v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
        break;
      case 1062:
        v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 1063:
        v4 = @"TAP_SPEED_CAMERA";
        break;
      case 1064:
        v4 = @"TAP_RED_LIGHT_CAMERA";
        break;
      case 1065:
        v4 = @"TAP_GEO";
        break;
      default:
        switch((int)action)
        {
          case 2001:
            v4 = @"TAP_SEARCH_FIELD";
            break;
          case 2002:
            v4 = @"CLEAR_SEARCH";
            break;
          case 2003:
            v4 = @"CANCEL_SEARCH";
            break;
          case 2004:
            v4 = @"TAP_BROWSE_TOP_CATEGORY";
            break;
          case 2005:
            v4 = @"TAP_BROWSE_SUB_CATEGORY";
            break;
          case 2006:
            v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
            break;
          case 2007:
            v4 = @"TAP_LIST_ITEM";
            break;
          case 2008:
            v4 = @"SHARE_LIST_ITEM";
            break;
          case 2009:
            v4 = @"DELETE_LIST_ITEM";
            break;
          case 2010:
            v4 = @"EDIT_LIST_ITEM";
            break;
          case 2011:
            v4 = @"REFRESH_SEARCH";
            break;
          case 2012:
            v4 = @"REVEAL_LIST_ITEM_ACTIONS";
            break;
          case 2013:
            v4 = @"HIDE_LIST_ITEM_ACTIONS";
            break;
          case 2014:
            v4 = @"TAP_SEARCH_BUTTON";
            break;
          case 2015:
            v4 = @"SHOW_SEARCH_RESULTS";
            break;
          case 2016:
            v4 = @"SHOW_REFRESH_SEARCH";
            break;
          case 2017:
            v4 = @"PASTE_TEXT";
            break;
          case 2018:
            v4 = @"TAP_LIST_SUB_ITEM";
            break;
          case 2019:
            v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
            break;
          case 2020:
            v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
            break;
          case 2021:
            v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
            break;
          case 2022:
            v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2023:
            v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2024:
            v4 = @"RETAINED_QUERY";
            break;
          case 2025:
            v4 = @"TAP_RECENT_AC_SUGGESTION";
            break;
          case 2026:
            v4 = @"CLEAR_RECENT_AC_SUGGESTION";
            break;
          case 2027:
            v4 = @"DELETE_RECENT_AC_SUGGESTION";
            break;
          case 2028:
          case 2029:
            goto LABEL_53;
          case 2030:
            v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
            break;
          case 2031:
            v4 = @"TAP_SUBACTION";
            break;
          case 2032:
            v4 = @"TAP_QUERY_BUILDING_ARROW";
            break;
          case 2033:
            v4 = @"CLICK_ON_EDIT_SEARCH";
            break;
          case 2034:
            v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
            break;
          case 2035:
            v4 = @"SHARE_CLIENT_AC_SUGGESTION";
            break;
          case 2036:
            v4 = @"TAP_ON_MORE_RESULTS";
            break;
          case 2037:
            v4 = @"SHARE_ITEM";
            break;
          case 2038:
            v4 = @"HIDE_ITEM";
            break;
          case 2039:
            v4 = @"TAP_SUGGESTED_ITEM";
            break;
          case 2040:
            v4 = @"SHARE_SUGGESTED_ITEM";
            break;
          case 2041:
            v4 = @"HIDE_SUGGESTED_ITEM";
            break;
          case 2042:
            v4 = @"ADD_HOME_FAVORITE";
            break;
          case 2043:
            v4 = @"ADD_WORK_FAVORITE";
            break;
          case 2044:
            v4 = @"ADD_FAVORITE";
            break;
          case 2045:
            v4 = @"VIEW_FAVORITES_LIST";
            break;
          case 2046:
            v4 = @"TAP_HOME_FAVORITE";
            break;
          case 2047:
            v4 = @"TAP_WORK_FAVORITE";
            break;
          case 2048:
            v4 = @"TAP_CAR_FAVORITE";
            break;
          case 2049:
            v4 = @"TAP_FAVORITE_ITEM";
            break;
          case 2050:
            v4 = @"CREATE_HOME_FAVORITE";
            break;
          case 2051:
            v4 = @"CREATE_WORK_FAVORITE";
            break;
          case 2052:
            v4 = @"CREATE_FAVORITE";
            break;
          case 2053:
            v4 = @"SUBMIT_FAVORITE_EDIT";
            break;
          case 2054:
            v4 = @"ADD_RECOMMENDED_FAVORITE";
            break;
          case 2055:
            v4 = @"EDIT_FAVORITE";
            break;
          case 2056:
            v4 = @"REMOVE_FAVORITE";
            break;
          case 2057:
            v4 = @"SHARE_FAVORITE";
            break;
          case 2058:
            v4 = @"EDIT_FAVORITES";
            break;
          case 2059:
            v4 = @"ADD_FAVORITE_PLACE";
            break;
          case 2060:
            v4 = @"REMOVE_FAVORITE_PLACE";
            break;
          case 2061:
            v4 = @"CHANGE_HOME_ADDRESS";
            break;
          case 2062:
            v4 = @"CHANGE_WORK_ADDRESS";
            break;
          case 2063:
            v4 = @"REFINE_LOCATION";
            break;
          case 2064:
            v4 = @"TAP_RECENTLY_VIEWED_ITEM";
            break;
          case 2065:
            v4 = @"SHOW_COLLECTION_LIST";
            break;
          case 2066:
            v4 = @"SHOW_FAVORITES_COLLECTION";
            break;
          case 2067:
            v4 = @"SHOW_COLLECTION";
            break;
          case 2068:
            v4 = @"TAP_COLLECTION_ITEM";
            break;
          case 2069:
            v4 = @"SHARE_COLLECTION_ITEM";
            break;
          case 2070:
            v4 = @"REMOVE_COLLECTION_ITEM";
            break;
          case 2071:
            v4 = @"SAVE_SHARED_COLLECTION";
            break;
          case 2072:
            v4 = @"CREATE_NEW_COLLECTION";
            break;
          case 2073:
            v4 = @"SAVE_TO_COLLECTION";
            break;
          case 2074:
            v4 = @"EDIT_PHOTO";
            break;
          case 2075:
            v4 = @"SORT_BY_NAME";
            break;
          case 2076:
            v4 = @"SORT_BY_DISTANCE";
            break;
          case 2077:
            v4 = @"SORT_BY_RECENT";
            break;
          case 2078:
            v4 = @"AUTO_SHARE_ETA";
            break;
          case 2079:
            v4 = @"CANCEL_AUTO_SHARE_ETA";
            break;
          case 2080:
            v4 = @"MAP_SEARCH";
            break;
          case 2081:
            v4 = @"DELETE_COLLECTION";
            break;
          case 2082:
            v4 = @"SHARE_COLLECTION";
            break;
          case 2083:
            v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
            break;
          case 2084:
            v4 = @"SHOW_MY_PLACES";
            break;
          case 2085:
            v4 = @"SHOW_ALL_PLACES";
            break;
          case 2086:
            v4 = @"TAP_RECENT_QUERY";
            break;
          case 2087:
            v4 = @"TAP_QUERY_SUGGESTION";
            break;
          case 2088:
            v4 = @"DELETE_CURATED_COLLECTION";
            break;
          case 2089:
            v4 = @"FOLLOW";
            break;
          case 2090:
            v4 = @"PUNCH_IN";
            break;
          case 2091:
            v4 = @"SAVE_CURATED_COLLECTION";
            break;
          case 2092:
            v4 = @"SCROLL_LEFT_COLLECTIONS";
            break;
          case 2093:
            v4 = @"SCROLL_RIGHT_COLLECTIONS";
            break;
          case 2094:
            v4 = @"SEE_ALL_CURATED_COLLECTION";
            break;
          case 2095:
            v4 = @"SEE_ALL_PUBLISHERS";
            break;
          case 2096:
            v4 = @"SHARE_CURATED_COLLECTION";
            break;
          case 2097:
            v4 = @"SHARE_PUBLISHER";
            break;
          case 2098:
            v4 = @"SHOW_MORE_COLLECTION";
            break;
          case 2099:
            v4 = @"TAP_CURATED_COLLECTION";
            break;
          case 2100:
            v4 = @"TAP_FEATURED_COLLECTIONS";
            break;
          case 2101:
            v4 = @"TAP_LOCATION";
            break;
          case 2102:
            v4 = @"TAP_PUBLISHER";
            break;
          case 2103:
            v4 = @"TAP_PUBLISHER_APP";
            break;
          case 2104:
            v4 = @"TAP_PUBLISHER_COLLECTIONS";
            break;
          case 2105:
            v4 = @"UNFOLLOW";
            break;
          case 2106:
            v4 = @"CHANGE_SCHOOL_ADDRESS";
            break;
          case 2107:
            v4 = @"ADD_VEHICLE";
            break;
          case 2108:
            v4 = @"DISPLAY_VIRTUAL_GARAGE";
            break;
          case 2109:
            v4 = @"ENTER_VIRTUAL_GARAGE";
            break;
          case 2110:
            v4 = @"PUNCH_OUT_MANUFACTURER_APP";
            break;
          case 2111:
            v4 = @"REMOVE_LICENSE_PLATE";
            break;
          case 2112:
            v4 = @"REMOVE_VEHICLE";
            break;
          case 2113:
            v4 = @"SELECT_VEHICLE";
            break;
          case 2114:
            v4 = @"SUBMIT_LICENSE_PLATE";
            break;
          case 2115:
            v4 = @"TAP_ADD_LICENSE_PLATE";
            break;
          case 2116:
            v4 = @"TAP_ADD_NEW_CAR";
            break;
          case 2117:
            v4 = @"TAP_BANNER";
            break;
          case 2118:
            v4 = @"TAP_CONNECT";
            break;
          case 2119:
            v4 = @"TAP_CONTINUE";
            break;
          case 2120:
            v4 = @"TAP_EDIT";
            break;
          case 2121:
            v4 = @"TAP_NAME";
            break;
          case 2122:
            v4 = @"TAP_NOT_NOW";
            break;
          case 2123:
            v4 = @"TAP_OTHER_VEHICLE";
            break;
          case 2124:
            v4 = @"TAP_REMOVE_LICENSE_PLATE";
            break;
          case 2125:
            v4 = @"TAP_UPDATE_PLATE_NUMBER";
            break;
          case 2126:
            v4 = @"TAP_VEHICLE";
            break;
          case 2127:
            v4 = @"TAP_VEHICLE_NAME";
            break;
          case 2128:
            v4 = @"UPDATE_NAME";
            break;
          case 2129:
            v4 = @"DONE_TAKING_PHOTO";
            break;
          case 2130:
            v4 = @"ENABLE_SHOW_PHOTO_NAME";
            break;
          case 2131:
            v4 = @"SUBMIT_PHOTO";
            break;
          case 2132:
            v4 = @"USE_PHOTO";
            break;
          case 2133:
            v4 = @"ADD_RECOMMENDATION_TO_MAPS";
            break;
          case 2134:
            v4 = @"CANCEL_PHOTO_SUBMISSION";
            break;
          case 2135:
            v4 = @"CLOSE_RECOMMENDATION_CARD";
            break;
          case 2136:
            v4 = @"EDIT_RATING";
            break;
          case 2137:
            v4 = @"PROMPTED_TO_ADD_PHOTO";
            break;
          case 2138:
            v4 = @"PROMPTED_TO_ADD_RATING";
            break;
          case 2139:
            v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
            break;
          case 2140:
            v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
            break;
          case 2141:
            v4 = @"RETAKE_PHOTO";
            break;
          case 2142:
            v4 = @"REVEAL_RECOMMENDATION_CARD";
            break;
          case 2143:
            v4 = @"SUBMIT_NEGATIVE_RATING";
            break;
          case 2144:
            v4 = @"SUBMIT_POSITIVE_RATING";
            break;
          case 2145:
            v4 = @"TAP_CHOOSING_PHOTO";
            break;
          case 2146:
            v4 = @"TAP_TAKE_NEW_PHOTO";
            break;
          case 2147:
            v4 = @"TAP_TO_ADD_PHOTO";
            break;
          case 2148:
            v4 = @"CANCEL_INCIDENT_REPORT";
            break;
          case 2149:
            v4 = @"INCIDENT_REPORT_SUBMITTED";
            break;
          case 2150:
            v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
            break;
          case 2151:
            v4 = @"REPORTED_INCIDENT_RECEIVED";
            break;
          case 2152:
            v4 = @"REPORT_INCIDENT";
            break;
          case 2153:
            v4 = @"SELECT_INCIDENT_TYPE";
            break;
          case 2154:
            v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
            break;
          case 2155:
            v4 = @"TAP_TO_START_REPORT_INCIDENT";
            break;
          case 2156:
            v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2157:
            v4 = @"ATTEMPT_VLF_CORRECTION";
            break;
          case 2158:
            v4 = @"DISMISS_VLF_PROMPT";
            break;
          case 2159:
            v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2160:
            v4 = @"VLF_CORRECTION_FAILED";
            break;
          case 2161:
            v4 = @"VLF_CORRECTION_SUCCESSFUL";
            break;
          case 2162:
            v4 = @"ENABLE_WIDGET_SUGGESTIONS";
            break;
          case 2163:
            v4 = @"DISPLAY_CZ_ADVISORY";
            break;
          case 2164:
            v4 = @"PUNCH_OUT_URL_PAY";
            break;
          case 2165:
            v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
            break;
          case 2166:
            v4 = @"DELETE_ITEM";
            break;
          case 2167:
            v4 = @"CANCEL_REMOVE";
            break;
          case 2168:
            v4 = @"DELETE_SUGGESTION";
            break;
          case 2169:
            v4 = @"ADD_SCHOOL_FAVORITE";
            break;
          case 2170:
            v4 = @"GO_TO_WEBSITE";
            break;
          case 2171:
            v4 = @"TRY_AGAIN";
            break;
          case 2172:
            v4 = @"CHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2173:
            v4 = @"CHECK_EBIKE";
            break;
          case 2174:
            v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2175:
            v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
            break;
          case 2176:
            v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2177:
            v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
            break;
          case 2178:
            v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2179:
            v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2180:
            v4 = @"TAP_CYCLING_DEFAULT_OPTION";
            break;
          case 2181:
            v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2182:
            v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
            break;
          case 2183:
            v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2184:
            v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2185:
            v4 = @"UNCHECK_EBIKE";
            break;
          case 2186:
            v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
            break;
          case 2187:
            v4 = @"DISPLAY_LPR_ADVISORY";
            break;
          case 2188:
            v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
            break;
          case 2189:
            v4 = @"CREATE_WIDGET";
            break;
          case 2190:
            v4 = @"REVEAL_WIDGET_TRAY";
            break;
          case 2191:
            v4 = @"LPR_ERROR_CODE";
            break;
          case 2192:
            v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
            break;
          case 2193:
            v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
            break;
          case 2194:
            v4 = @"LPR_HARD_STOP";
            break;
          case 2195:
            v4 = @"TAP_PUBLISHER_SUBACTION";
            break;
          case 2196:
            v4 = @"CARPLAY_DISPLAY_ACTIVATED";
            break;
          case 2197:
            v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
            break;
          case 2198:
            v4 = @"TAP_FEATURED_COLLECTION";
            break;
          case 2199:
            v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
            break;
          case 2200:
            v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
            break;
          default:
            switch((int)action)
            {
              case 3001:
                v4 = @"START_NAV";
                break;
              case 3002:
                v4 = @"END_NAV";
                break;
              case 3003:
                v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                break;
              case 3004:
                v4 = @"VIEW_DETAILS";
                break;
              case 3005:
                v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                break;
              case 3006:
                v4 = @"OPEN_ROUTING_EDITOR";
                break;
              case 3007:
                v4 = @"EDIT_ORIGIN";
                break;
              case 3008:
                v4 = @"EDIT_DESTINATION";
                break;
              case 3009:
                v4 = @"SWAP_ORIGIN_DESTINATION";
                break;
              case 3010:
                v4 = @"OPEN_MORE_ROUTES";
                break;
              case 3011:
                v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                break;
              case 3012:
                v4 = @"SELECT_ROUTING_TYPE_WALKING";
                break;
              case 3013:
                v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                break;
              case 3014:
                v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                break;
              case 3015:
                v4 = @"SELECT_ROUTE";
                break;
              case 3016:
                v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                break;
              case 3017:
                v4 = @"EXPAND_STEP_DETAILS_WALK";
                break;
              case 3018:
                v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                break;
              case 3019:
                v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                break;
              case 3020:
                v4 = @"UNCHECK_BUS";
                break;
              case 3021:
                v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3022:
                v4 = @"UNCHECK_COMMUTER_RAIL";
                break;
              case 3023:
                v4 = @"UNCHECK_FERRY";
                break;
              case 3024:
                v4 = @"CHECK_BUS";
                break;
              case 3025:
                v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3026:
                v4 = @"CHECK_COMMUTER_RAIL";
                break;
              case 3027:
                v4 = @"CHECK_FERRY";
                break;
              case 3028:
                v4 = @"SELECT_LEAVE_AT";
                break;
              case 3029:
                v4 = @"SELECT_ARRIVE_BY";
                break;
              case 3030:
                v4 = @"SELECT_LEAVE_NOW";
                break;
              case 3031:
                v4 = @"SELECT_DATE_TIME";
                break;
              case 3032:
                v4 = @"SWITCH_ON_IC_FARES";
                break;
              case 3033:
                v4 = @"SWITCH_OFF_IC_FARES";
                break;
              case 3034:
                v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                break;
              case 3035:
                v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                break;
              case 3036:
                v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                break;
              case 3037:
                v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                break;
              case 3038:
                v4 = @"REVEAL_FROM_ROUTING";
                break;
              case 3039:
                v4 = @"DISPLAY_ROUTES";
                break;
              case 3040:
                v4 = @"CHECK_RECOMMENDED_ROUTES";
                break;
              case 3041:
                v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                break;
              case 3042:
                v4 = @"CHECK_FASTER_TRIPS";
                break;
              case 3043:
                v4 = @"UNCHECK_FASTER_TRIPS";
                break;
              case 3044:
                v4 = @"CHECK_FEWER_TRANSFERS";
                break;
              case 3045:
                v4 = @"UNCHECK_FEWER_TRANSFERS";
                break;
              case 3046:
                v4 = @"CHECK_LESS_WALKING";
                break;
              case 3047:
                v4 = @"UNCHECK_LESS_WALKING";
                break;
              case 3048:
                v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                break;
              case 3049:
                v4 = @"TAP_MORE_ROUTES";
                break;
              case 3050:
                v4 = @"OPEN_NAV_OVERVIEW";
                break;
              case 3051:
                v4 = @"RESUME_NAV_MANEUVER_VIEW";
                break;
              case 3052:
                v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                break;
              case 3053:
                v4 = @"SELECT_AUDIO_VOLUME_LOW";
                break;
              case 3054:
                v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                break;
              case 3055:
                v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                break;
              case 3056:
                v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                break;
              case 3057:
                v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                break;
              case 3058:
                v4 = @"RESUME_PREV_NAV";
                break;
              case 3059:
                v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                break;
              case 3060:
                v4 = @"ACCEPT_REROUTE";
                break;
              case 3061:
                v4 = @"DISMISS_REROUTE";
                break;
              case 3062:
                v4 = @"ATTEMPT_END_NAV";
                break;
              case 3063:
                v4 = @"DISPLAY_BANNER";
                break;
              case 3064:
                v4 = @"VIEW_BANNER_DETAILS";
                break;
              case 3065:
                v4 = @"ENTER_GUIDANCE";
                break;
              case 3066:
                v4 = @"AUTO_ADVANCE_GUIDANCE";
                break;
              case 3067:
                v4 = @"TAP_OPEN_WALLET";
                break;
              case 3068:
                v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                break;
              case 3069:
                v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                break;
              case 3070:
                v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                break;
              case 3071:
                v4 = @"DISPLAY_CARD";
                break;
              case 3072:
                v4 = @"RENDER_ROUTE";
                break;
              case 3073:
                v4 = @"DISPLAY_JUNCTION_VIEW";
                break;
              case 3074:
                v4 = @"SELECT_DEPARTURE";
                break;
              case 3075:
                v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                break;
              case 3076:
                v4 = @"DEVICE_RAISE";
                break;
              case 3077:
                v4 = @"ENTER_AR_NAV_VIEW";
                break;
              case 3078:
                v4 = @"EXIT_AR_NAV_VIEW";
                break;
              case 3079:
                v4 = @"AR_CALIBRATION_START";
                break;
              case 3080:
                v4 = @"AR_CALIBRATION_FAILURE";
                break;
              case 3081:
                v4 = @"AR_CALIBRATION_SUCCESS";
                break;
              case 3082:
                v4 = @"DISPLAY_AR_NAV_ARROW";
                break;
              case 3083:
                v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                break;
              case 3084:
                v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                break;
              case 3085:
                v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                break;
              case 3086:
                v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                break;
              case 3087:
                v4 = @"DISPLAY_ADVISORY_BANNER";
                break;
              case 3088:
                v4 = @"TAP_SHOW_ADVISORY_DETAILS";
                break;
              default:
                goto LABEL_53;
            }
            break;
        }
        break;
    }
  }
LABEL_1336:

  return v4;
}

- (BOOL)_isStartNavigationAction:(int)a3
{
  BOOL result = 1;
  if (a3 > 9020)
  {
    if (a3 == 9021) {
      return result;
    }
    int v4 = 11017;
  }
  else
  {
    if (a3 == 3001) {
      return result;
    }
    int v4 = 9016;
  }
  if (a3 != v4) {
    return 0;
  }
  return result;
}

- (void)_navTimerFired:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 && s_navStartedTimer)
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
    int v4 = [v3 bundleIdentifier];

    int v5 = +[MKSiriInteraction navigationHash];
    id v11 = @"nav_identifier";
    v12[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v7 = (void *)[v6 mutableCopy];

    [v7 setObject:@"Continue" forKeyedSubscript:@"navigationType"];
    if ([v4 length]) {
      [v7 setObject:v4 forKeyedSubscript:@"source"];
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F304D0]) initWithDomain:@"Maps" verb:@"Navigation" parametersByName:v7];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v8 response:0];
    [v9 donateInteractionWithCompletion:0];
    [(id)s_navStartedTimer invalidate];
    v10 = (void *)s_navStartedTimer;
    s_navStartedTimer = 0;
  }
}

+ (void)generateHashForNavigationURL:(id)a3
{
  if (a3)
  {
    id v5 = [a3 absoluteString];
    +[MKSiriInteraction _siriIntentMurmurHash:](MKSiriInteraction, "_siriIntentMurmurHash:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    [v5 UUIDString];
  uint64_t v3 = };
  int v4 = (void *)s_navigationHash;
  s_navigationHash = v3;
}

+ (id)_siriIntentMurmurHash:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLength:16];
  id v6 = v4;
  [v6 UTF8String];
  [v6 lengthOfBytesUsingEncoding:4];

  id v7 = v5;
  [v7 mutableBytes];
  _GEOMurmurHash3_128_realign();
  v8 = [v7 base64EncodedStringWithOptions:0];

  return v8;
}

+ (NSString)navigationHash
{
  v2 = (void *)s_navigationHash;
  if (!s_navigationHash)
  {
    [a1 generateHashForNavigationURL:0];
    v2 = (void *)s_navigationHash;
  }

  return (NSString *)v2;
}

+ (void)setNavigationHash:(id)a3
{
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_uint64_t action = a3;
}

- (int)target
{
  return self->_target;
}

- (void)setTarget:(int)a3
{
  self->_int target = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(int)a3
{
  self->_resultIndex = a3;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
}

- (NSString)searchQueryString
{
  return self->_searchQueryString;
}

- (void)setSearchQueryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryString, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end