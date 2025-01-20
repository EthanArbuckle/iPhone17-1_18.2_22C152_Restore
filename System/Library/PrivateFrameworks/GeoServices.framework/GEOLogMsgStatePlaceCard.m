@interface GEOLogMsgStatePlaceCard
+ (BOOL)isValid:(id)a3;
+ (Class)commingledRichProviderIdsType;
+ (Class)modulesType;
+ (Class)revealedModulesType;
- (BOOL)hasIsPersonAddressAvailable;
- (BOOL)hasIsPersonLocationShared;
- (BOOL)hasIsPersonPlacecard;
- (BOOL)hasPlaceActionDetails;
- (BOOL)hasPlacecardCategory;
- (BOOL)hasPlacecardType;
- (BOOL)hasTransitAdvisoryBanner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonAddressAvailable;
- (BOOL)isPersonLocationShared;
- (BOOL)isPersonPlacecard;
- (BOOL)readFrom:(id)a3;
- (BOOL)transitAdvisoryBanner;
- (GEOLogMsgStatePlaceCard)init;
- (GEOLogMsgStatePlaceCard)initWithData:(id)a3;
- (GEOLogMsgStatePlaceCard)initWithDictionary:(id)a3;
- (GEOLogMsgStatePlaceCard)initWithJSON:(id)a3;
- (GEOPlaceActionDetails)placeActionDetails;
- (NSMutableArray)commingledRichProviderIds;
- (NSMutableArray)modules;
- (NSMutableArray)revealedModules;
- (NSString)placecardCategory;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)commingledRichProviderIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)modulesAtIndex:(unint64_t)a3;
- (id)placecardTypeAsString:(int)a3;
- (id)possibleActionsAsString:(int)a3;
- (id)revealedModulesAtIndex:(unint64_t)a3;
- (id)unactionableUiElementsAsString:(int)a3;
- (int)StringAsPlacecardType:(id)a3;
- (int)StringAsUnactionableUiElements:(id)a3;
- (int)placecardType;
- (int)possibleActionAtIndex:(unint64_t)a3;
- (int)possibleActions;
- (int)unactionableUiElementAtIndex:(unint64_t)a3;
- (int)unactionableUiElements;
- (unint64_t)commingledRichProviderIdsCount;
- (unint64_t)containedChildrenPois;
- (unint64_t)containedChildrenPoisAtIndex:(unint64_t)a3;
- (unint64_t)containedChildrenPoisCount;
- (unint64_t)hash;
- (unint64_t)modulesCount;
- (unint64_t)possibleActionsCount;
- (unint64_t)revealedModulesCount;
- (unint64_t)unactionableUiElementsCount;
- (void)_addNoFlagsCommingledRichProviderIds:(uint64_t)a1;
- (void)_addNoFlagsModules:(uint64_t)a1;
- (void)_addNoFlagsRevealedModules:(uint64_t)a1;
- (void)_readCommingledRichProviderIds;
- (void)_readContainedChildrenPois;
- (void)_readModules;
- (void)_readPlaceActionDetails;
- (void)_readPlacecardCategory;
- (void)_readPossibleActions;
- (void)_readRevealedModules;
- (void)_readUnactionableUiElements;
- (void)addCommingledRichProviderIds:(id)a3;
- (void)addContainedChildrenPois:(unint64_t)a3;
- (void)addModules:(id)a3;
- (void)addPossibleAction:(int)a3;
- (void)addRevealedModules:(id)a3;
- (void)addUnactionableUiElement:(int)a3;
- (void)clearCommingledRichProviderIds;
- (void)clearContainedChildrenPois;
- (void)clearModules;
- (void)clearPossibleActions;
- (void)clearRevealedModules;
- (void)clearUnactionableUiElements;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCommingledRichProviderIds:(id)a3;
- (void)setContainedChildrenPois:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setHasIsPersonAddressAvailable:(BOOL)a3;
- (void)setHasIsPersonLocationShared:(BOOL)a3;
- (void)setHasIsPersonPlacecard:(BOOL)a3;
- (void)setHasPlacecardType:(BOOL)a3;
- (void)setHasTransitAdvisoryBanner:(BOOL)a3;
- (void)setIsPersonAddressAvailable:(BOOL)a3;
- (void)setIsPersonLocationShared:(BOOL)a3;
- (void)setIsPersonPlacecard:(BOOL)a3;
- (void)setModules:(id)a3;
- (void)setPlaceActionDetails:(id)a3;
- (void)setPlacecardCategory:(id)a3;
- (void)setPlacecardType:(int)a3;
- (void)setPossibleActions:(int *)a3 count:(unint64_t)a4;
- (void)setRevealedModules:(id)a3;
- (void)setTransitAdvisoryBanner:(BOOL)a3;
- (void)setUnactionableUiElements:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStatePlaceCard

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    v31 = 0;
    goto LABEL_1426;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 placeActionDetails];
  v6 = v5;
  if (v5)
  {
    if (a2)
    {
      v7 = [v5 jsonRepresentation];
      v8 = @"placeActionDetails";
    }
    else
    {
      v7 = [v5 dictionaryRepresentation];
      v8 = @"place_action_details";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if (*(void *)(a1 + 48))
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v10 = (void *)(a1 + 40);
    if (*(void *)(a1 + 48))
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = *(unsigned int *)(*v10 + 4 * v11);
        if ((int)v12 > 4000)
        {
          if ((int)v12 <= 10100)
          {
            if ((int)v12 > 7000)
            {
              switch((int)v12)
              {
                case 9001:
                  v13 = @"TAP_WIDGET_ITEM";
                  break;
                case 9002:
                  v13 = @"DISPLAY_NOTIFICATION";
                  break;
                case 9003:
                  v13 = @"TAP_NOTIFICATION";
                  break;
                case 9004:
                  v13 = @"EXPAND_NOTIFICATION";
                  break;
                case 9005:
                  v13 = @"DISMISS_NOTIFICATION";
                  break;
                case 9006:
                  v13 = @"OPEN_SEARCH";
                  break;
                case 9007:
                  v13 = @"OPEN_PAN_VIEW";
                  break;
                case 9008:
                  v13 = @"PAN_LEFT";
                  break;
                case 9009:
                  v13 = @"PAN_UP";
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
                  goto LABEL_55;
                case 9011:
                  v13 = @"PAN_DOWN";
                  break;
                case 9012:
                  v13 = @"TAP_RECENT_DESTINATIONS";
                  break;
                case 9013:
                  v13 = @"OPEN_DESTINATIONS";
                  break;
                case 9014:
                  v13 = @"OPEN_FAVORITES";
                  break;
                case 9015:
                  v13 = @"VIEW_NAV_OPTIONS";
                  break;
                case 9016:
                  v13 = @"START_NAV_NO_GUIDANCE";
                  break;
                case 9017:
                  v13 = @"TURN_OFF_GUIDANCE";
                  break;
                case 9018:
                  v13 = @"TURN_ON_GUIDANCE";
                  break;
                case 9019:
                  v13 = @"OPEN_KEYBOARD";
                  break;
                case 9020:
                  v13 = @"SHARE_DESTINATION";
                  break;
                case 9021:
                  v13 = @"START_NAV_AUTOMATED";
                  break;
                case 9022:
                  v13 = @"SHARE_ETA";
                  break;
                case 9023:
                  v13 = @"SELECT_GROUP";
                  break;
                case 9024:
                  v13 = @"DESELECT_GROUP";
                  break;
                case 9025:
                  v13 = @"SELECT_CONTACT";
                  break;
                case 9026:
                  v13 = @"DESELECT_CONTACT";
                  break;
                case 9027:
                  v13 = @"TAP_VIEW_CONTACTS";
                  break;
                case 9028:
                  v13 = @"STOP_RECEIVING_ETA";
                  break;
                case 9029:
                  v13 = @"DISPLAY_ANNOUNCEMENT";
                  break;
                case 9030:
                  v13 = @"TAP_ANNOUNCEMENT";
                  break;
                case 9031:
                  v13 = @"DISPLAY_CYCLING_NOTIFICATION";
                  break;
                case 9032:
                  v13 = @"TAP_CYCLING_NOTIFICATION";
                  break;
                case 9033:
                  v13 = @"SHARE_CYCLING_ETA";
                  break;
                case 9034:
                  v13 = @"MANAGE_NOTIFICATIONS";
                  break;
                case 9035:
                  v13 = @"PUNCH_OUT_PUBLISHER_REVIEW";
                  break;
                case 9036:
                  v13 = @"SCROLL_FORWARD";
                  break;
                case 9037:
                  v13 = @"SCROLL_BACKWARD";
                  break;
                case 9038:
                  v13 = @"SHOW_ALL_CURATED_COLLECTIONS";
                  break;
                case 9039:
                  v13 = @"TAP_LESS";
                  break;
                case 9040:
                  v13 = @"TAP_MORE";
                  break;
                case 9101:
                  v13 = @"DISPLAY_ADD_HOME_AND_WORK";
                  break;
                case 9102:
                  v13 = @"TAP_ADD_HOME_AND_WORK";
                  break;
                case 9103:
                  v13 = @"DISPLAY_ALLOW_FREQUENTS";
                  break;
                case 9104:
                  v13 = @"TAP_ALLOW_FREQUENTS";
                  break;
                case 9105:
                  v13 = @"DISPLAY_ALLOW_LOCATION";
                  break;
                case 9106:
                  v13 = @"TAP_ALLOW_LOCATION";
                  break;
                default:
                  switch((int)v12)
                  {
                    case 7001:
                      v13 = @"EXPAND_TRANSIT_SYSTEM";
                      break;
                    case 7002:
                      v13 = @"COLLAPSE_TRANSIT_SYSTEM";
                      break;
                    case 7003:
                      v13 = @"SHOW_MORE_DEPARTURES";
                      break;
                    case 7004:
                      v13 = @"VIEW_TRANSIT_LINE";
                      break;
                    case 7005:
                      v13 = @"CANCEL_VIEW_TRANSIT_LINE";
                      break;
                    case 7006:
                      v13 = @"TAP_TRANSIT_ATTRIBUTION";
                      break;
                    case 7007:
                      v13 = @"TAP_TRANSIT_ADVISORY";
                      break;
                    case 7008:
                      v13 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                      break;
                    case 7009:
                      v13 = @"SUBSCRIBE_LINE_INCIDENT";
                      break;
                    case 7010:
                      v13 = @"UNSUBSCRIBE_LINE_INCIDENT";
                      break;
                    case 7011:
                      v13 = @"TAP_NEAREST_STATION";
                      break;
                    case 7012:
                      v13 = @"TAP_NEAREST_STOP";
                      break;
                    case 7013:
                      v13 = @"TAP_CONNECTION";
                      break;
                    case 7014:
                      v13 = @"GET_TICKETS";
                      break;
                    case 7015:
                      v13 = @"OPEN_SCHEDULECARD_DATETIME";
                      break;
                    case 7016:
                      v13 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                      break;
                    case 7017:
                      v13 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                      break;
                    case 7018:
                      v13 = @"VIEW_ON_MAP";
                      break;
                    case 7019:
                      v13 = @"FORCE_UPDATE_DEPARTURE_INFO";
                      break;
                    case 7020:
                      v13 = @"TAP_TRANSIT_LINE_INFO";
                      break;
                    case 7021:
                      v13 = @"TAP_ATTRIBUTION_CELL";
                      break;
                    case 7022:
                      v13 = @"TAP_NEXT_DEPARTURES";
                      break;
                    case 7023:
                      v13 = @"VIEW_BANNER";
                      break;
                    case 7024:
                      v13 = @"GET_SHOWTIMES";
                      break;
                    case 7025:
                      v13 = @"MAKE_APPOINTMENT";
                      break;
                    case 7026:
                      v13 = @"RESERVE_PARKING";
                      break;
                    case 7027:
                      v13 = @"RESERVE_ROOM";
                      break;
                    case 7028:
                      v13 = @"WAITLIST";
                      break;
                    case 7029:
                      v13 = @"ORDER_TAKEOUT";
                      break;
                    case 7030:
                      v13 = @"RESERVE";
                      break;
                    default:
                      switch((int)v12)
                      {
                        case 8001:
                          v13 = @"INVOKE_SIRI_SNIPPET";
                          break;
                        case 8002:
                          v13 = @"INVOKE_SIRI_DISAMBIGUATION";
                          break;
                        case 8003:
                          v13 = @"SHOW_PLACE_DETAILS";
                          break;
                        case 8004:
                          v13 = @"ANSWER_REROUTE_SUGGESTION";
                          break;
                        case 8005:
                          v13 = @"SUGGEST_NAV_REROUTE";
                          break;
                        case 8006:
                          v13 = @"GET_NAV_STATUS";
                          break;
                        case 8007:
                          v13 = @"REPEAT_NAV_STATUS";
                          break;
                        case 8008:
                          v13 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                          break;
                        case 8009:
                          v13 = @"INVOKE_SIRI";
                          break;
                        case 8010:
                          v13 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                          break;
                        case 8011:
                          v13 = @"DISPLAY_NO_RESULTS_MESSAGE";
                          break;
                        default:
                          goto LABEL_55;
                      }
                      break;
                  }
                  break;
              }
            }
            else
            {
              switch((int)v12)
              {
                case 6003:
                  v13 = @"GET_DIRECTIONS";
                  break;
                case 6004:
                  v13 = @"TAP_FLYOVER_TOUR";
                  break;
                case 6005:
                  v13 = @"REMOVE_PIN";
                  break;
                case 6006:
                  v13 = @"TAP_PHOTO";
                  break;
                case 6007:
                  v13 = @"TAP_MAPS_VIEW";
                  break;
                case 6008:
                  v13 = @"TAP_ADDRESS";
                  break;
                case 6009:
                  v13 = @"CALL";
                  break;
                case 6010:
                  v13 = @"TAP_URL";
                  break;
                case 6011:
                  v13 = @"SHOW_TODAY_HOURS";
                  break;
                case 6012:
                  v13 = @"SHOW_ALL_HOURS";
                  break;
                case 6013:
                  v13 = @"SHARE";
                  break;
                case 6014:
                case 6017:
                case 6028:
                case 6030:
                case 6035:
                  goto LABEL_55;
                case 6015:
                  v13 = @"ADD_TO_FAVORITES";
                  break;
                case 6016:
                  v13 = @"ADD_CONTACT";
                  break;
                case 6018:
                  v13 = @"PUNCH_OUT_PHOTO";
                  break;
                case 6019:
                  v13 = @"PUNCH_OUT_USEFUL_TO_KNOW";
                  break;
                case 6020:
                  v13 = @"PUNCH_OUT_OPEN_APP";
                  break;
                case 6021:
                  v13 = @"PUNCH_OUT_SINGLE_REVIEW";
                  break;
                case 6022:
                  v13 = @"PUNCH_OUT_CHECK_IN";
                  break;
                case 6023:
                  v13 = @"PUNCH_OUT_MORE_INFO";
                  break;
                case 6024:
                  v13 = @"PUNCH_OUT_WRITE_REVIEW";
                  break;
                case 6025:
                  v13 = @"PUNCH_OUT_ADD_PHOTO";
                  break;
                case 6026:
                  v13 = @"TAP_GRID_VIEW";
                  break;
                case 6027:
                  v13 = @"EDIT_LOCATION";
                  break;
                case 6029:
                  v13 = @"ADD_PHOTO";
                  break;
                case 6031:
                  v13 = @"RETAKE";
                  break;
                case 6032:
                  v13 = @"ADD_NOTE";
                  break;
                case 6033:
                  v13 = @"REMOVE_CAR";
                  break;
                case 6034:
                  v13 = @"EDIT_NAME";
                  break;
                case 6036:
                  v13 = @"RESERVE_TABLE";
                  break;
                case 6037:
                  v13 = @"ADD_TO_QUEUE";
                  break;
                case 6038:
                  v13 = @"VIEW_BOOKED_TABLE";
                  break;
                case 6039:
                  v13 = @"VIEW_QUEUED_TABLE";
                  break;
                case 6040:
                  v13 = @"PUNCH_OUT_THIRD_PARTY_APP";
                  break;
                case 6041:
                  v13 = @"PUNCH_OUT_LEGAL_LINK";
                  break;
                case 6042:
                  v13 = @"TAP_PLACECARD_HEADER";
                  break;
                case 6043:
                  v13 = @"REMOVE_FROM_FAVORITES";
                  break;
                case 6044:
                  v13 = @"VIEW_CONTACT";
                  break;
                case 6045:
                  v13 = @"CHAT";
                  break;
                case 6046:
                  v13 = @"FIND_STORES";
                  break;
                case 6047:
                  v13 = @"TAP_PARENT";
                  break;
                case 6048:
                  v13 = @"SCROLL_LEFT_PHOTOS";
                  break;
                case 6049:
                  v13 = @"SCROLL_RIGHT_PHOTOS";
                  break;
                case 6050:
                  v13 = @"PUNCH_OUT";
                  break;
                case 6051:
                  v13 = @"TAP_ENTER_MUNIN";
                  break;
                case 6052:
                  v13 = @"TAP_RECOMMENDED_DISHES_PHOTO";
                  break;
                case 6053:
                  v13 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
                  break;
                case 6054:
                  v13 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
                  break;
                case 6055:
                  v13 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
                  break;
                case 6056:
                  v13 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
                  break;
                case 6057:
                  v13 = @"SHOW_LINKED_SERVICE_HOURS";
                  break;
                case 6058:
                  v13 = @"ENTER_LOOK_AROUND";
                  break;
                case 6059:
                  v13 = @"EXIT_LOOK_AROUND";
                  break;
                case 6060:
                  v13 = @"TAP_ENTER_LOOK_AROUND_VIEW";
                  break;
                case 6061:
                  v13 = @"TAP_ENTER_LOOK_AROUND_PIP";
                  break;
                case 6062:
                  v13 = @"EXPAND_LOOK_AROUND_VIEW";
                  break;
                case 6063:
                  v13 = @"CLOSE_LOOK_AROUND";
                  break;
                case 6064:
                  v13 = @"COLLAPSE_LOOK_AROUND_VIEW";
                  break;
                case 6065:
                  v13 = @"TAP_SHOW_ACTIONS";
                  break;
                case 6066:
                  v13 = @"TAP_HIDE_LABELS";
                  break;
                case 6067:
                  v13 = @"TAP_SHOW_LABELS";
                  break;
                case 6068:
                  v13 = @"TAP_SHOW_DETAILS";
                  break;
                case 6069:
                  v13 = @"PAN_LOOK_AROUND";
                  break;
                case 6070:
                  v13 = @"TAP_LOOK_AROUND_THUMBNAIL";
                  break;
                case 6071:
                  v13 = @"TAP_LANDMARK";
                  break;
                case 6072:
                  v13 = @"TAP_SCENE";
                  break;
                case 6073:
                  v13 = @"SHOW_LINKED_BUSINESS_HOURS";
                  break;
                case 6074:
                  v13 = @"TAP_PLACECARD_SHORTCUT";
                  break;
                case 6075:
                  v13 = @"SHOW_ALL_LOCATIONS_INSIDE";
                  break;
                case 6076:
                  v13 = @"SHOW_ALL_SIMILAR_LOCATIONS";
                  break;
                case 6077:
                  v13 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
                  break;
                case 6078:
                  v13 = @"TAP_PARENT_LOCATION";
                  break;
                case 6079:
                  v13 = @"TAP_SIMILAR_LOCATION";
                  break;
                case 6080:
                  v13 = @"TAP_LOCATION_INSIDE";
                  break;
                case 6081:
                  v13 = @"TAP_LOCATION_AT_ADDRESS";
                  break;
                case 6082:
                  v13 = @"CLOSE_ROUTE_GENIUS";
                  break;
                case 6083:
                  v13 = @"LOAD_WEB_CONTENT";
                  break;
                case 6084:
                  v13 = @"SCROLL_FORWARD_WEB_CONTENT";
                  break;
                case 6085:
                  v13 = @"SCROLL_BACKWARD_WEB_CONTENT";
                  break;
                case 6086:
                  v13 = @"TAP_WEB_CONTENT";
                  break;
                case 6087:
                  v13 = @"SHOW_PHOTO_VIEWER";
                  break;
                case 6088:
                  v13 = @"SHOW_LAST_PAGE";
                  break;
                case 6089:
                  v13 = @"TAP_VIEW_APP";
                  break;
                case 6090:
                  v13 = @"TAP_APP_CLIP";
                  break;
                case 6091:
                  v13 = @"DEAD_BATTERY";
                  break;
                case 6092:
                  v13 = @"DISMISS_LOW_BATTERY_ALERT";
                  break;
                case 6093:
                  v13 = @"DISMISS_OUT_OF_RANGE_ALERT";
                  break;
                case 6094:
                  v13 = @"FAILED_TO_LOAD_EV_STATUS";
                  break;
                case 6095:
                  v13 = @"LOW_BATTERY_ALERT";
                  break;
                case 6096:
                  v13 = @"PAUSE_ROUTE";
                  break;
                case 6097:
                  v13 = @"TAP_ADD_STOP";
                  break;
                case 6098:
                  v13 = @"TAP_CHARGE_POINT";
                  break;
                case 6099:
                  v13 = @"TAP_OUT_OF_RANGE_ALERT";
                  break;
                case 6100:
                  v13 = @"SCROLL_DOWN_PHOTOS";
                  break;
                case 6101:
                  v13 = @"SCROLL_UP_PHOTOS";
                  break;
                case 6102:
                  v13 = @"TAP_MORE_PHOTOS";
                  break;
                case 6103:
                  v13 = @"TAP_TO_CONFIRM_INCIDENT";
                  break;
                case 6104:
                  v13 = @"SHOW_INCIDENT";
                  break;
                case 6105:
                  v13 = @"REVEAL_APP_CLIP";
                  break;
                case 6106:
                  v13 = @"ORDER_DELIVERY";
                  break;
                case 6107:
                  v13 = @"VIEW_MENU";
                  break;
                case 6108:
                  v13 = @"TAP_EDIT_STOPS";
                  break;
                case 6109:
                  v13 = @"LEARN_MORE_WEB_CONTENT";
                  break;
                case 6110:
                  v13 = @"MAKE_APPOINTMENT_WEB_CONTENT";
                  break;
                case 6111:
                  v13 = @"REVEAL_SHOWCASE";
                  break;
                default:
                  switch((int)v12)
                  {
                    case 5001:
                      v13 = @"SHOW_MAPS_SETTINGS";
                      break;
                    case 5002:
                      v13 = @"TAP_STANDARD_MODE";
                      break;
                    case 5003:
                      v13 = @"TAP_TRANSIT_MODE";
                      break;
                    case 5004:
                      v13 = @"TAP_SATELLITE_MODE";
                      break;
                    case 5005:
                      v13 = @"SWITCH_ON_TRAFFIC";
                      break;
                    case 5006:
                      v13 = @"SWITCH_OFF_TRAFFIC";
                      break;
                    case 5007:
                      v13 = @"SWITCH_ON_LABELS";
                      break;
                    case 5008:
                      v13 = @"SWITCH_OFF_LABELS";
                      break;
                    case 5009:
                      v13 = @"SWITCH_ON_3D_MAP";
                      break;
                    case 5010:
                      v13 = @"SWITCH_OFF_3D_MAP";
                      break;
                    case 5011:
                      v13 = @"SWITCH_ON_WEATHER";
                      break;
                    case 5012:
                      v13 = @"SWITCH_OFF_WEATHER";
                      break;
                    case 5013:
                      v13 = @"REPORT_A_PROBLEM";
                      break;
                    case 5014:
                      v13 = @"ADD_PLACE";
                      break;
                    case 5015:
                      goto LABEL_55;
                    case 5016:
                      v13 = @"TAP_PREFERENCES";
                      break;
                    case 5017:
                      v13 = @"SWITCH_ON_TOLLS";
                      break;
                    case 5018:
                      v13 = @"SWITCH_OFF_TOLLS";
                      break;
                    case 5019:
                      v13 = @"SWITCH_ON_HIGHWAYS";
                      break;
                    case 5020:
                      v13 = @"SWITCH_OFF_HIGHWAYS";
                      break;
                    case 5021:
                      v13 = @"SWITCH_ON_HEADING";
                      break;
                    case 5022:
                      v13 = @"SWITCH_OFF_HEADING";
                      break;
                    case 5023:
                      v13 = @"SWITCH_ON_SPEED_LIMIT";
                      break;
                    case 5024:
                      v13 = @"SWITCH_OFF_SPEED_LIMIT";
                      break;
                    case 5025:
                      v13 = @"ELECT_DRIVING_MODE";
                      break;
                    case 5026:
                      v13 = @"ELECT_WALKING_MODE";
                      break;
                    case 5027:
                      v13 = @"ELECT_TRANSIT_MODE";
                      break;
                    case 5028:
                      v13 = @"ELECT_RIDESHARE_MODE";
                      break;
                    case 5029:
                      v13 = @"SWITCH_ON_FIND_MY_CAR";
                      break;
                    case 5030:
                      v13 = @"SWITCH_OFF_FIND_MY_CAR";
                      break;
                    case 5031:
                      v13 = @"MARK_MY_LOCATION";
                      break;
                    case 5032:
                      v13 = @"TAP_HYBRID_MODE";
                      break;
                    case 5033:
                      v13 = @"CHECK_AVOID_BUSY_ROADS";
                      break;
                    case 5034:
                      v13 = @"UNCHECK_AVOID_BUSY_ROADS";
                      break;
                    case 5035:
                      v13 = @"CHECK_AVOID_HILLS";
                      break;
                    case 5036:
                      v13 = @"UNCHECK_AVOID_HILLS";
                      break;
                    case 5037:
                      v13 = @"CHECK_AVOID_STAIRS";
                      break;
                    case 5038:
                      v13 = @"UNCHECK_AVOID_STAIRS";
                      break;
                    case 5039:
                      v13 = @"ELECT_CYCLING_MODE";
                      break;
                    default:
                      switch((int)v12)
                      {
                        case 4001:
                          v13 = @"RECENTER_CURRENT_LOCATION";
                          break;
                        case 4002:
                          v13 = @"TAP_HEADING_ON";
                          break;
                        case 4003:
                          v13 = @"TAP_HEADING_OFF";
                          break;
                        case 4004:
                          v13 = @"PUCK_DRIFT";
                          break;
                        case 4005:
                          v13 = @"PUCK_SNAP";
                          break;
                        case 4006:
                          v13 = @"SELECT_FLOOR";
                          break;
                        default:
                          goto LABEL_55;
                      }
                      break;
                  }
                  break;
              }
            }
          }
          else if ((int)v12 > 13000)
          {
            if ((int)v12 <= 16000)
            {
              if ((int)v12 <= 15000)
              {
                switch((int)v12)
                {
                  case 14001:
                    v13 = @"VIEW_APP";
                    break;
                  case 14002:
                    v13 = @"ENABLE";
                    break;
                  case 14003:
                    v13 = @"BOOK_RIDE";
                    break;
                  case 14004:
                    v13 = @"REQUEST_RIDE";
                    break;
                  case 14005:
                    v13 = @"CONTACT_DRIVER";
                    break;
                  case 14006:
                    v13 = @"CHANGE_PAYMENT";
                    break;
                  case 14007:
                    v13 = @"ENABLE_ALL_RIDESHARE_APPS";
                    break;
                  case 14008:
                    v13 = @"TAP_FOR_MORE_RIDES";
                    break;
                  case 14009:
                    v13 = @"SUBMIT_TRIP_FEEDBACK";
                    break;
                  default:
                    switch((int)v12)
                    {
                      case 13001:
                        v13 = @"SELECT_ADDRESS";
                        break;
                      case 13002:
                        v13 = @"ADD_ADDRESS";
                        break;
                      case 13003:
                        v13 = @"SELECT_LABEL";
                        break;
                      case 13004:
                        v13 = @"DELETE_ADDRESS";
                        break;
                      case 13005:
                        v13 = @"EDIT_ITEMS";
                        break;
                      case 13006:
                        v13 = @"RAP_FAVORITES";
                        break;
                      case 13007:
                        v13 = @"SORT_LIST_ITEM";
                        break;
                      default:
                        goto LABEL_55;
                    }
                    break;
                }
              }
              else
              {
                switch(v12)
                {
                  case 0x3A99:
                    v13 = @"ORB_PEEK";
                    break;
                  case 0x3A9A:
                    v13 = @"ORB_POP";
                    break;
                  case 0x3A9B:
                    v13 = @"ORB_DISMISS";
                    break;
                  default:
LABEL_55:
                    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
                    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    break;
                }
              }
            }
            else
            {
              switch((int)v12)
              {
                case 17001:
                  v13 = @"START_DRAG";
                  break;
                case 17002:
                  v13 = @"CANCEL_DRAG";
                  break;
                case 17003:
                  v13 = @"COMPLETE_DRAG";
                  break;
                case 17004:
                  v13 = @"START_DROP";
                  break;
                case 17005:
                  v13 = @"CANCEL_DROP";
                  break;
                case 17006:
                  v13 = @"COMPLETE_DROP";
                  break;
                case 17007:
                  v13 = @"ANNOTATION_SELECT";
                  break;
                case 17008:
                  v13 = @"ANNOTATION_SELECT_AUTO";
                  break;
                case 17009:
                  v13 = @"ANNOTATION_SELECT_LIST";
                  break;
                case 17010:
                  v13 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
                  break;
                case 17011:
                  v13 = @"CALLOUT_FLYOVER_TOUR";
                  break;
                case 17012:
                  v13 = @"CALLOUT_INFO";
                  break;
                case 17013:
                  v13 = @"CALLOUT_NAV_TRANSIT";
                  break;
                case 17014:
                  v13 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
                  break;
                case 17015:
                  v13 = @"CALLOUT_VIEW_TRANSIT_LINE";
                  break;
                case 17016:
                  v13 = @"DIRECTIONS_SELECT";
                  break;
                case 17017:
                  v13 = @"DIRECTIONS_TRANSIT_CUSTOM";
                  break;
                case 17018:
                  v13 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
                  break;
                case 17019:
                  v13 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
                  break;
                case 17020:
                  v13 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
                  break;
                case 17021:
                  v13 = @"DIRECTIONS_TRANSIT_LATER";
                  break;
                case 17022:
                  v13 = @"DIRECTIONS_TRANSIT_NOW";
                  break;
                case 17023:
                  v13 = @"FLYOVER_NOTIFICATION_DISMISS";
                  break;
                case 17024:
                  v13 = @"FLYOVER_NOTIFICATION_START";
                  break;
                case 17025:
                  v13 = @"FLYOVER_TOUR_COMPLETED";
                  break;
                case 17026:
                  v13 = @"FLYOVER_TOUR_END";
                  break;
                case 17027:
                  v13 = @"FLYOVER_TOUR_NOTIFICATION";
                  break;
                case 17028:
                  v13 = @"FLYOVER_TOUR_START";
                  break;
                case 17029:
                  v13 = @"INFO_BOOKMARKS";
                  break;
                case 17030:
                  v13 = @"INFO_CARD_DETACHED";
                  break;
                case 17031:
                  v13 = @"INFO_CONTACTS";
                  break;
                case 17032:
                  v13 = @"INFO_DIRECTIONS";
                  break;
                case 17033:
                  v13 = @"INFO_DIRECTIONS_FROM";
                  break;
                case 17034:
                  v13 = @"INFO_DIRECTIONS_TO";
                  break;
                case 17035:
                  v13 = @"INFO_DISMISS";
                  break;
                case 17036:
                  v13 = @"INFO_INFO";
                  break;
                case 17037:
                  v13 = @"INFO_PHOTOS";
                  break;
                case 17038:
                  v13 = @"INFO_REVIEWS";
                  break;
                case 17039:
                  v13 = @"INFO_SHARE";
                  break;
                case 17040:
                  v13 = @"INFO_SHARE_AIRDROP";
                  break;
                case 17041:
                  v13 = @"INFO_SHARE_FACEBOOK";
                  break;
                case 17042:
                  v13 = @"INFO_SHARE_MAIL";
                  break;
                case 17043:
                  v13 = @"INFO_SHARE_MESSAGE";
                  break;
                case 17044:
                  v13 = @"INFO_SHARE_TENCENTWEIBO";
                  break;
                case 17045:
                  v13 = @"INFO_SHARE_WEIBO";
                  break;
                case 17046:
                  v13 = @"INFO_YELP";
                  break;
                case 17047:
                  v13 = @"MAPS_APP_LAUNCH";
                  break;
                case 17048:
                  v13 = @"MAP_3D_OFF";
                  break;
                case 17049:
                  v13 = @"MAP_3D_ON";
                  break;
                case 17050:
                  v13 = @"MAP_OPTIONS_DROP_PIN";
                  break;
                case 17051:
                  v13 = @"MAP_OPTIONS_HYBRID";
                  break;
                case 17052:
                  v13 = @"MAP_OPTIONS_PRINT";
                  break;
                case 17053:
                  v13 = @"MAP_OPTIONS_REMOVE_PIN";
                  break;
                case 17054:
                  v13 = @"MAP_OPTIONS_SATELLITE";
                  break;
                case 17055:
                  v13 = @"MAP_OPTIONS_STANDARD";
                  break;
                case 17056:
                  v13 = @"MAP_OPTIONS_TRAFFIC_HIDE";
                  break;
                case 17057:
                  v13 = @"MAP_OPTIONS_TRAFFIC_SHOW";
                  break;
                case 17058:
                  v13 = @"MAP_OPTIONS_TRANSIT";
                  break;
                case 17059:
                  v13 = @"MAP_TAP_FLYOVER_CITY";
                  break;
                case 17060:
                  v13 = @"MAP_TAP_LINE";
                  break;
                case 17061:
                  v13 = @"MAP_TAP_POI_TRANSIT";
                  break;
                case 17062:
                  v13 = @"MAP_TAP_TRAFFIC_INCIDENT";
                  break;
                case 17063:
                  v13 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
                  break;
                case 17064:
                  v13 = @"MAP_USER_TRACKING_OFF";
                  break;
                case 17065:
                  v13 = @"MAP_USER_TRACKING_ON";
                  break;
                case 17066:
                  v13 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
                  break;
                case 17067:
                  v13 = @"NAV_CLEAR";
                  break;
                case 17068:
                  v13 = @"NAV_LIST";
                  break;
                case 17069:
                  v13 = @"NAV_ROUTE_STEP_NEXT";
                  break;
                case 17070:
                  v13 = @"NAV_ROUTE_STEP_PREV";
                  break;
                case 17071:
                  v13 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
                  break;
                case 17072:
                  v13 = @"ORB_DISPLAY_MENU";
                  break;
                case 17073:
                  v13 = @"ORB_MENU_CALL";
                  break;
                case 17074:
                  v13 = @"ORB_MENU_DIRECTIONS";
                  break;
                case 17075:
                  v13 = @"ORB_MENU_DISMISS";
                  break;
                case 17076:
                  v13 = @"ORB_MENU_SHARE";
                  break;
                case 17077:
                  v13 = @"ORB_MENU_SHOW_PLACECARD";
                  break;
                case 17078:
                  v13 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
                  break;
                case 17079:
                  v13 = @"ORB_MENU_URL";
                  break;
                case 17080:
                  v13 = @"ORB_PRESS";
                  break;
                case 17081:
                  v13 = @"ORB_SPRINGBOARD_MARK_LOCATION";
                  break;
                case 17082:
                  v13 = @"ORB_SPRINGBOARD_SEARCH";
                  break;
                case 17083:
                  v13 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
                  break;
                case 17084:
                  v13 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
                  break;
                case 17085:
                  v13 = @"RAP_PERMISSION_CANCEL";
                  break;
                case 17086:
                  v13 = @"RAP_PERMISSION_EMAIL_NA";
                  break;
                case 17087:
                  v13 = @"RAP_PERMISSION_EMAIL_OK";
                  break;
                case 17088:
                  v13 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
                  break;
                case 17089:
                  v13 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
                  break;
                case 17090:
                  v13 = @"RAP_PERMISSION_OK";
                  break;
                case 17091:
                  v13 = @"SEARCH_BEGIN";
                  break;
                case 17092:
                  v13 = @"SEARCH_CANCEL";
                  break;
                case 17093:
                  v13 = @"SEARCH_SELECT";
                  break;
                case 17094:
                  v13 = @"TRANSIT_LINE_SELECTION_DISMISS";
                  break;
                case 17095:
                  v13 = @"TRANSIT_LINE_SELECTION_VIEW";
                  break;
                case 17096:
                  v13 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
                  break;
                case 17097:
                  v13 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
                  break;
                case 17098:
                  v13 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
                  break;
                case 17099:
                  v13 = @"UNKNOWN_ACTION";
                  break;
                case 17100:
                  v13 = @"INFO_SHARE_TWITTER";
                  break;
                case 17101:
                  v13 = @"INFO_TAP_POPULAR_APP_NEARBY";
                  break;
                case 17102:
                  v13 = @"INFO_DIRECTIONS_WALK";
                  break;
                case 17103:
                  v13 = @"INFO_DIRECTIONS_TRANSIT";
                  break;
                case 17104:
                  v13 = @"INFO_DIRECTIONS_DRIVE";
                  break;
                case 17105:
                  v13 = @"INFO_REPORT_A_PROBLEM";
                  break;
                case 17106:
                  v13 = @"CALLOUT_NAV";
                  break;
                case 17107:
                  v13 = @"RAP_PERMISSION_EMAIL_CANCEL";
                  break;
                case 17108:
                  v13 = @"MAP_TAP_POI";
                  break;
                default:
                  if (v12 == 16001)
                  {
                    v13 = @"SEARCH_IN_MAPS";
                  }
                  else
                  {
                    if (v12 != 90010) {
                      goto LABEL_55;
                    }
                    v13 = @"PAN_RIGHT";
                  }
                  break;
              }
            }
          }
          else
          {
            switch((int)v12)
            {
              case 10101:
                v13 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
                break;
              case 10102:
                v13 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
                break;
              case 10103:
                v13 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
                break;
              case 10104:
                v13 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
                break;
              case 10105:
                v13 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
                break;
              case 10106:
                v13 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
                break;
              case 10107:
                v13 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
                break;
              case 10108:
                v13 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
                break;
              case 10109:
                v13 = @"RAP_CANCEL";
                break;
              case 10110:
                v13 = @"RAP_NEXT";
                break;
              case 10111:
                v13 = @"RAP_BACK";
                break;
              case 10112:
                v13 = @"RAP_SEND";
                break;
              case 10113:
                v13 = @"RAP_SKIP";
                break;
              case 10114:
                v13 = @"RAP_SHOW_MORE";
                break;
              case 10115:
                v13 = @"RAP_ADD_PHOTO";
                break;
              case 10116:
                v13 = @"RAP_MAP_INCORRECT";
                break;
              case 10117:
                v13 = @"RAP_BAD_DIRECTIONS";
                break;
              case 10118:
                v13 = @"RAP_TRANSIT_INFO_INCORRECT";
                break;
              case 10119:
                v13 = @"RAP_SATELLITE_IMAGE_PROBLEM";
                break;
              case 10120:
                v13 = @"RAP_SEARCH_RESULTS_INCORRECT";
                break;
              case 10121:
                v13 = @"RAP_ADD_A_PLACE";
                break;
              case 10122:
                v13 = @"RAP_HOME";
                break;
              case 10123:
                v13 = @"RAP_WORK";
                break;
              case 10124:
                v13 = @"RAP_OTHER";
                break;
              case 10125:
                v13 = @"RAP_LOCATION";
                break;
              case 10126:
                v13 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
                break;
              case 10127:
                v13 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
                break;
              case 10128:
                v13 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
                break;
              case 10129:
                v13 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
                break;
              case 10130:
                v13 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
                break;
              case 10131:
                v13 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
                break;
              case 10132:
                v13 = @"RAP_TRANSIT_DELAY";
                break;
              case 10133:
                v13 = @"RAP_LOCATION_CLOSED";
                break;
              case 10134:
                v13 = @"RAP_CLOSED_PERMANENTLY";
                break;
              case 10135:
                v13 = @"RAP_CLOSED_TEMPORARILY";
                break;
              case 10136:
                v13 = @"RAP_HOURS_HAVE_CHANGED";
                break;
              case 10137:
                v13 = @"RAP_SELECT_STATION";
                break;
              case 10138:
                v13 = @"RAP_SELECT_LINE";
                break;
              case 10139:
                v13 = @"RAP_SELECT_ACCESS_POINT";
                break;
              case 10140:
                v13 = @"RAP_SELECT_SEARCH";
                break;
              case 10141:
                v13 = @"RAP_PAN_MAP";
                break;
              case 10142:
                v13 = @"RAP_CENTER_MAP_ON_USER";
                break;
              case 10143:
                v13 = @"RAP_SEARCH_UNEXPECTED";
                break;
              case 10144:
                v13 = @"RAP_ADD_POI";
                break;
              case 10145:
                v13 = @"RAP_ADD_STREET_ADDRESS";
                break;
              case 10146:
                v13 = @"RAP_ADD_OTHER";
                break;
              case 10147:
                v13 = @"RAP_SELECT_CATEGORY";
                break;
              case 10148:
                v13 = @"RAP_TAKE_PHOTO";
                break;
              case 10149:
                v13 = @"RAP_RETAKE_PHOTO";
                break;
              case 10150:
                v13 = @"RAP_PLACE_DETAILS";
                break;
              case 10151:
                v13 = @"RAP_SATELLITE_IMAGE_OUTDATED";
                break;
              case 10152:
                v13 = @"RAP_SATELLITE_IMAGE_QUALITY";
                break;
              case 10153:
                v13 = @"RAP_SELECT_LABEL";
                break;
              case 10154:
                v13 = @"RAP_SELECT_ROUTE";
                break;
              case 10155:
                v13 = @"RAP_CLAIM_BUSINESS";
                break;
              case 10156:
                v13 = @"RAP_BRAND_DETAILS";
                break;
              case 10157:
                v13 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
                break;
              case 10158:
                v13 = @"RAP_LOOK_AROUND_LABELS_STREET";
                break;
              case 10159:
                v13 = @"RAP_LOOK_AROUND_BLURRING";
                break;
              case 10160:
                v13 = @"RAP_LOOK_AROUND_REMOVE_HOME";
                break;
              case 10161:
                v13 = @"RAP_LOOK_AROUND_LABELS_STORE";
                break;
              case 10162:
                v13 = @"RAP_LOOK_AROUND_PRIVACY";
                break;
              case 10163:
                v13 = @"RAP_INCORRECT_HOURS";
                break;
              case 10164:
                v13 = @"RAP_INCORRECT_ADDRESS";
                break;
              case 10165:
                v13 = @"RAP_EDIT_PLACE_DETAILS";
                break;
              case 10166:
                v13 = @"RAP_EDIT_PLACE_NAME";
                break;
              case 10167:
                v13 = @"RAP_EDIT_ADDRESS";
                break;
              case 10168:
                v13 = @"RAP_ADD_CATEGORY";
                break;
              case 10169:
                v13 = @"RAP_REMOVE_CATEGORY";
                break;
              case 10170:
                v13 = @"RAP_DESELECT_CATEGORY";
                break;
              case 10171:
                v13 = @"RAP_ADD_HOURS";
                break;
              case 10172:
                v13 = @"RAP_REMOVE_HOURS";
                break;
              case 10173:
                v13 = @"RAP_TAP_DAY_OF_WEEK";
                break;
              case 10174:
                v13 = @"RAP_TAP_24_HOURS_BUTTON";
                break;
              case 10175:
                v13 = @"RAP_TAP_OPEN_TIME";
                break;
              case 10176:
                v13 = @"RAP_TAP_CLOSED_TIME";
                break;
              case 10177:
                v13 = @"RAP_TAP_TEMPORARY_CLOSURE";
                break;
              case 10178:
                v13 = @"RAP_TAP_PERMANENTLY_CLOSED";
                break;
              case 10179:
                v13 = @"RAP_EDIT_WEBSITE";
                break;
              case 10180:
                v13 = @"RAP_EDIT_PHONE_NUMBER";
                break;
              case 10181:
                v13 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
                break;
              case 10182:
                v13 = @"RAP_ADD_COMMENTS";
                break;
              case 10183:
                v13 = @"RAP_EDIT_LOCATION";
                break;
              case 10184:
                v13 = @"RAP_VIEW_LOCATION";
                break;
              case 10185:
                v13 = @"RAP_ZOOM_IN";
                break;
              case 10186:
                v13 = @"RAP_ZOOM_OUT";
                break;
              case 10187:
                v13 = @"RAP_VIEW_ENTRY_POINTS";
                break;
              case 10188:
                v13 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
                break;
              case 10189:
                v13 = @"RAP_ADD_NEW_ENTRY_POINT";
                break;
              case 10190:
                v13 = @"RAP_REMOVE_ENTRY_POINT";
                break;
              case 10191:
                v13 = @"RAP_SELECT_ENTRY_POINT_TYPE";
                break;
              default:
                switch((int)v12)
                {
                  case 11001:
                    v13 = @"EXIT_MAPS_LOWER_WRIST";
                    break;
                  case 11002:
                    v13 = @"TASK_READY";
                    break;
                  case 11003:
                    v13 = @"TAP_SEARCH";
                    break;
                  case 11004:
                    v13 = @"TAP_MY_LOCATION";
                    break;
                  case 11005:
                    v13 = @"SHOW_NEARBY";
                    break;
                  case 11006:
                    v13 = @"TAP_NEARBY";
                    break;
                  case 11007:
                    v13 = @"TAP_PROACTIVE";
                    break;
                  case 11008:
                    v13 = @"FORCE_PRESS";
                    break;
                  case 11009:
                    v13 = @"TAP_CONTACTS";
                    break;
                  case 11010:
                    v13 = @"TAP_TRANSIT";
                    break;
                  case 11011:
                    v13 = @"TAP_DICTATION";
                    break;
                  case 11012:
                    v13 = @"GET_DIRECTIONS_DRIVING";
                    break;
                  case 11013:
                    v13 = @"GET_DIRECTIONS_WALKING";
                    break;
                  case 11014:
                    v13 = @"GET_DIRECTIONS_TRANSIT";
                    break;
                  case 11015:
                    v13 = @"OPEN_STANDARD_MAP";
                    break;
                  case 11016:
                    v13 = @"OPEN_TRANSIT_MAP";
                    break;
                  case 11017:
                    v13 = @"START_NAV_AUTO";
                    break;
                  case 11018:
                    v13 = @"TAP_RECENT";
                    break;
                  case 11019:
                    v13 = @"TAP_FAVORITE";
                    break;
                  case 11020:
                    v13 = @"TAP_SCRIBBLE";
                    break;
                  case 11021:
                    v13 = @"TAP_VIEW_MAP";
                    break;
                  case 11022:
                    v13 = @"TAP_VIEW_TBT";
                    break;
                  case 11023:
                    v13 = @"VIEW_ROUTE_INFO";
                    break;
                  case 11024:
                    v13 = @"NAV_UNMUTE";
                    break;
                  case 11025:
                    v13 = @"NAV_MUTE";
                    break;
                  case 11026:
                    v13 = @"GET_DIRECTIONS_CYCLING";
                    break;
                  case 11027:
                    v13 = @"TAP_SEARCH_HOME";
                    break;
                  case 11028:
                    v13 = @"ROUTE_PAUSED_ON_WATCH";
                    break;
                  case 11029:
                    v13 = @"NEXT_STOP_TAPPED_ON_WATCH";
                    break;
                  default:
                    switch((int)v12)
                    {
                      case 12001:
                        v13 = @"VIEW_MORE_OPTIONS";
                        break;
                      case 12002:
                        v13 = @"SELECT_TIME";
                        break;
                      case 12003:
                        v13 = @"SHOW_NEXT_AVAILABLE";
                        break;
                      case 12004:
                        v13 = @"DECREASE_TABLE_SIZE";
                        break;
                      case 12005:
                        v13 = @"INCREASE_TABLE_SIZE";
                        break;
                      case 12006:
                        v13 = @"EDIT_BOOKING";
                        break;
                      case 12007:
                        v13 = @"EDIT_PHONE";
                        break;
                      case 12008:
                        v13 = @"ADD_SPECIAL_REQUEST";
                        break;
                      case 12009:
                        v13 = @"CHANGE_RESERVATION";
                        break;
                      case 12010:
                        v13 = @"LEARN_MORE";
                        break;
                      default:
                        goto LABEL_55;
                    }
                    break;
                }
                break;
            }
          }
        }
        else
        {
          v13 = @"UI_ACTION_UNKNOWN";
          switch((int)v12)
          {
            case 0:
              break;
            case 1:
              v13 = @"PULL_UP";
              break;
            case 2:
              v13 = @"PULL_DOWN";
              break;
            case 3:
              v13 = @"TAP";
              break;
            case 4:
              v13 = @"CLOSE";
              break;
            case 5:
              v13 = @"SWIPE_PREV";
              break;
            case 6:
              v13 = @"SWIPE_NEXT";
              break;
            case 7:
              v13 = @"SCROLL_UP";
              break;
            case 8:
              v13 = @"SCROLL_DOWN";
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
              goto LABEL_55;
            case 10:
              v13 = @"SHOW_MORE";
              break;
            case 11:
              v13 = @"SHOW_LESS";
              break;
            case 12:
              v13 = @"SWIPE_LEFT";
              break;
            case 13:
              v13 = @"SWIPE_RIGHT";
              break;
            case 14:
              v13 = @"MINIMIZE";
              break;
            case 15:
              v13 = @"TAP_PREV";
              break;
            case 16:
              v13 = @"TAP_NEXT";
              break;
            case 17:
              v13 = @"SUBMIT";
              break;
            case 18:
              v13 = @"CANCEL";
              break;
            case 19:
              v13 = @"ENTER_MAPS";
              break;
            case 20:
              v13 = @"EXIT_MAPS";
              break;
            case 21:
              v13 = @"REVEAL";
              break;
            case 22:
              v13 = @"OPEN_NEW_TAB";
              break;
            case 25:
              v13 = @"BACK";
              break;
            case 26:
              v13 = @"ACTIVATE";
              break;
            case 27:
              v13 = @"DEACTIVATE";
              break;
            case 28:
              v13 = @"AGREE";
              break;
            case 29:
              v13 = @"DISAGREE";
              break;
            case 30:
              v13 = @"SKIP_ANSWER";
              break;
            case 31:
              v13 = @"EXPAND";
              break;
            case 32:
              v13 = @"COLLAPSE";
              break;
            case 33:
              v13 = @"ENTER";
              break;
            case 34:
              v13 = @"EXIT";
              break;
            case 35:
              v13 = @"SCROLL_UP_INDEX_BAR";
              break;
            case 36:
              v13 = @"SCROLL_DOWN_INDEX_BAR";
              break;
            case 37:
              v13 = @"TOGGLE_ON";
              break;
            case 38:
              v13 = @"TOGGLE_OFF";
              break;
            case 39:
              v13 = @"LONG_PRESS";
              break;
            case 40:
              v13 = @"CLICK";
              break;
            case 41:
              v13 = @"TAP_DONE";
              break;
            case 42:
              v13 = @"TAP_CLOSE";
              break;
            case 43:
              v13 = @"SCROLL_LEFT";
              break;
            case 44:
              v13 = @"SCROLL_RIGHT";
              break;
            case 45:
              v13 = @"DISPLAY";
              break;
            case 46:
              v13 = @"OPEN_IN_APP";
              break;
            case 47:
              v13 = @"CONCEAL";
              break;
            case 48:
              v13 = @"TAP_DELETE";
              break;
            case 49:
              v13 = @"TAP_FILTER";
              break;
            case 50:
              v13 = @"TAP_SECONDARY_BUTTON";
              break;
            case 51:
              v13 = @"TAP_WIDGET_FOOD";
              break;
            case 52:
              v13 = @"TAP_WIDGET_GAS";
              break;
            case 53:
              v13 = @"TAP_WIDGET_LOADING";
              break;
            case 54:
              v13 = @"TAP_WIDGET_SEARCH";
              break;
            case 55:
              v13 = @"TAP_WIDGET_STORES";
              break;
            case 56:
              v13 = @"DISPLAY_ALLOW_ONCE_PROMPT";
              break;
            case 57:
              v13 = @"SHARE_CURRENT_LOCATION";
              break;
            case 58:
              v13 = @"SHARE_PHOTO";
              break;
            case 59:
              v13 = @"TAP_KEEP_OFF";
              break;
            case 60:
              v13 = @"TAP_PHOTO_CATEGORY";
              break;
            case 61:
              v13 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
              break;
            case 62:
              v13 = @"TAP_TURN_ON";
              break;
            case 63:
              v13 = @"DISPLAY_CYCLING_ANNOTATION";
              break;
            case 64:
              v13 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
              break;
            case 65:
              v13 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
              break;
            case 66:
              v13 = @"DISPLAY_WALKING_DEFAULT_OPTION";
              break;
            case 67:
              v13 = @"TAP_CYCLING_ANNOTATION";
              break;
            case 68:
              v13 = @"TAP_DRIVING_DEFAULT_OPTION";
              break;
            case 69:
              v13 = @"TAP_TRANSIT_DEFAULT_OPTION";
              break;
            case 70:
              v13 = @"TAP_WALKING_DEFAULT_OPTION";
              break;
            case 71:
              v13 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
              break;
            case 72:
              v13 = @"TAP_RIDESHARE_DEFAULT_OPTION";
              break;
            case 73:
              v13 = @"TAP_PERSONAL_COLLECTION";
              break;
            case 74:
              v13 = @"RESUME_ROUTE";
              break;
            case 75:
              v13 = @"DISPLAY_OUT_OF_RANGE_ALERT";
              break;
            case 76:
              v13 = @"TAP_ALLOW_ONCE";
              break;
            case 77:
              v13 = @"TAP_DO_NOT_ALLOW";
              break;
            case 78:
              v13 = @"ADD_RECCOMENDED_FAVORITE";
              break;
            case 79:
              v13 = @"ADD_RECOMMENDED_HOME_FAVORITE";
              break;
            case 80:
              v13 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
              break;
            case 81:
              v13 = @"ADD_RECOMMENDED_WORK_FAVORITE";
              break;
            case 82:
              v13 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
              break;
            case 83:
              v13 = @"CREATE_SCHOOL_FAVORITE";
              break;
            case 84:
              v13 = @"TAP_SCHOOL_FAVORITE";
              break;
            case 85:
              v13 = @"SELECT_ROUTING_TYPE_CYCLING";
              break;
            case 86:
              v13 = @"REPORT_PHOTO";
              break;
            case 87:
              v13 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
              break;
            case 88:
              v13 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
              break;
            case 89:
              v13 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
              break;
            case 90:
              v13 = @"CREATE_RECOMMENDED_FAVORITE";
              break;
            case 91:
              v13 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
              break;
            case 92:
              v13 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
              break;
            case 93:
              v13 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
              break;
            case 94:
              v13 = @"TAP_SMALL_WIDGET_ITEM";
              break;
            case 95:
              v13 = @"TAP_MEDIUM_WIDGET_ITEM";
              break;
            case 96:
              v13 = @"TAP_LARGE_WIDGET_ITEM";
              break;
            case 97:
              v13 = @"DISPLAY_ARP_TIPKIT";
              break;
            case 98:
              v13 = @"NEXT";
              break;
            case 99:
              v13 = @"TAP_RATE_AND_ADD_PHOTOS";
              break;
            case 100:
              v13 = @"TAP_TO_ADD_POSITIVE_RATING";
              break;
            case 101:
              v13 = @"TAP_TO_ADD_NEGATIVE_RATING";
              break;
            case 102:
              v13 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
              break;
            case 103:
              v13 = @"INVOKE_SIRI_PROMPT";
              break;
            case 104:
              v13 = @"ETA_SHARED_SUCCESSFULLY";
              break;
            case 105:
              v13 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
              break;
            case 106:
              v13 = @"CLEAR_INCIDENT";
              break;
            case 107:
              v13 = @"CONFIRM_INCIDENT";
              break;
            case 108:
              v13 = @"DISMISS_INCIDENT";
              break;
            case 109:
              v13 = @"INCIDENT_ALERT_TIMEOUT";
              break;
            case 110:
              v13 = @"INCIDENT_ALERT_TRAY_SHOWN";
              break;
            case 111:
              v13 = @"INCIDENT_CARD_SHOWN";
              break;
            case 112:
              v13 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
              break;
            case 113:
              v13 = @"INCIDENT_REPORT_TRAY_SHOWN";
              break;
            case 114:
              v13 = @"NAV_TRAY_DISCOVERY_SHOWN";
              break;
            case 115:
              v13 = @"TAP_TO_REPORT_INCIDENT";
              break;
            case 116:
              v13 = @"TAP_SHORTCUT";
              break;
            case 117:
              v13 = @"BLOCK_CONTACT";
              break;
            case 118:
              v13 = @"TAP_TO_ADD_RATING";
              break;
            case 119:
              v13 = @"AR_WALKING_LOCALIZATION_FAILED";
              break;
            case 120:
              v13 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
              break;
            case 121:
              v13 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
              break;
            case 122:
              v13 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
              break;
            case 123:
              v13 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
              break;
            case 124:
              v13 = @"RAISE_TO_ENTER_AR_WALKING";
              break;
            case 125:
              v13 = @"TAP_DISMISS";
              break;
            case 126:
              v13 = @"TAP_ENTER_AR_WALKING";
              break;
            case 127:
              v13 = @"TAP_OK";
              break;
            case 128:
              v13 = @"TAP_TRY_AGAIN";
              break;
            case 129:
              v13 = @"TAP_TURN_ON_IN_SETTINGS";
              break;
            case 130:
              v13 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
              break;
            case 131:
              v13 = @"VLF_CORRECTION_USER_ABANDON";
              break;
            case 132:
              v13 = @"AREA_EVENTS_ALERT";
              break;
            case 133:
              v13 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
              break;
            case 134:
              v13 = @"ACCEPT_EVENT_REROUTE";
              break;
            case 135:
              v13 = @"DISPLAY_AREA_EVENTS_ADVISORY";
              break;
            case 136:
              v13 = @"DISMISS_EVENT_REROUTE";
              break;
            case 137:
              v13 = @"PUNCH_OUT_EVENTS_LINK";
              break;
            case 138:
              v13 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
              break;
            case 139:
              v13 = @"ADJUST_GUIDANCE_SETTINGS";
              break;
            case 140:
              v13 = @"HIDE_DETAILS";
              break;
            case 141:
              v13 = @"SELECT_VOICE_GUIDANCE_ON";
              break;
            case 142:
              v13 = @"SELECT_VOICE_GUIDANCE_OFF";
              break;
            case 143:
              v13 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
              break;
            case 144:
              v13 = @"TAP_TEXT_LABEL";
              break;
            case 145:
              v13 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
              break;
            case 146:
              v13 = @"TAP_EXIT";
              break;
            case 147:
              v13 = @"TAP_CITY_MENU";
              break;
            case 148:
              v13 = @"CHECK_AVOID_TOLLS";
              break;
            case 149:
              v13 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
              break;
            case 150:
              v13 = @"TAP_ICLOUD";
              break;
            case 151:
              v13 = @"CHECK_AVOID_HIGHWAYS";
              break;
            case 152:
              v13 = @"TAP_FAVORITES";
              break;
            case 153:
              v13 = @"SELECT_DISTANCE_IN_KM";
              break;
            case 154:
              v13 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
              break;
            case 155:
              v13 = @"OPEN_FULL_CARD_FILTER";
              break;
            case 156:
              v13 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
              break;
            case 157:
              v13 = @"OPEN_SINGLE_CARD_FILTER";
              break;
            case 158:
              v13 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
              break;
            case 159:
              v13 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
              break;
            case 160:
              v13 = @"SESSIONLESS_REVEAL";
              break;
            case 161:
              v13 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
              break;
            case 162:
              v13 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
              break;
            case 163:
              v13 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
              break;
            case 164:
              v13 = @"ENTER_RAP_REPORT_MENU";
              break;
            case 165:
              v13 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
              break;
            case 166:
              v13 = @"TAP_MY_VEHICLES";
              break;
            case 167:
              v13 = @"SUBMIT_SINGLE_CARD_FILTER";
              break;
            case 168:
              v13 = @"SUBMIT_FULL_CARD_FILTER";
              break;
            case 169:
              v13 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
              break;
            case 170:
              v13 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
              break;
            case 171:
              v13 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
              break;
            case 172:
              v13 = @"TAP_ACCOUNT";
              break;
            case 173:
              v13 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
              break;
            case 174:
              v13 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
              break;
            case 175:
              v13 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
              break;
            case 176:
              v13 = @"RESULT_REFINEMENT_TOGGLE_OFF";
              break;
            case 177:
              v13 = @"TAP_CITY_CURATED_COLLECTIONS";
              break;
            case 178:
              v13 = @"TAP_REPORTS";
              break;
            case 179:
              v13 = @"TAP_RATINGS";
              break;
            case 180:
              v13 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
              break;
            case 181:
              v13 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
              break;
            case 182:
              v13 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
              break;
            case 183:
              v13 = @"SELECT_DISTANCE_IN_MILES";
              break;
            case 184:
              v13 = @"TAP_PRIVACY_STATEMENT";
              break;
            case 185:
              v13 = @"TAP_MAPS_SETTINGS";
              break;
            case 186:
              v13 = @"CANCEL_FULL_CARD_FILTER";
              break;
            case 187:
              v13 = @"TAP_LATEST_CURATED_COLLECTION";
              break;
            case 188:
              v13 = @"TAP_TEMPORAL_CURATED_COLLECTION";
              break;
            case 189:
              v13 = @"UNCHECK_AVOID_TOLLS";
              break;
            case 190:
              v13 = @"UNSELECT_SEARCH_REFINEMENT";
              break;
            case 191:
              v13 = @"TAP_RATING";
              break;
            case 192:
              v13 = @"TAP_ICLOUD_SIGN_IN";
              break;
            case 193:
              v13 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
              break;
            case 194:
              v13 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
              break;
            case 195:
              v13 = @"UNCHECK_AVOID_HIGHWAYS";
              break;
            case 196:
              v13 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
              break;
            case 197:
              v13 = @"RESULT_REFINEMENT_TOGGLE_ON";
              break;
            case 198:
              v13 = @"TAP_CONTEXT_LINE_HYPERLINK";
              break;
            case 199:
              v13 = @"TAP_MY_GUIDES";
              break;
            case 200:
              v13 = @"SELECT_SEARCH_REFINEMENT";
              break;
            case 201:
              v13 = @"SESSIONLESS_TAP_ACCOUNT";
              break;
            case 202:
              v13 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
              break;
            case 203:
              v13 = @"TAP_TRAVEL_PREFERENCES";
              break;
            case 204:
              v13 = @"SHOW_CURATED_COLLECTION_LIST";
              break;
            case 205:
              v13 = @"CANCEL_SINGLE_CARD_FILTER";
              break;
            case 206:
              v13 = @"DISPLAY_HFP_OPTION";
              break;
            case 207:
              v13 = @"SWITCH_OFF_HFP";
              break;
            case 208:
              v13 = @"SWITCH_ON_HFP";
              break;
            case 209:
              v13 = @"TAP_QUICK_ACTION_TRAY";
              break;
            case 210:
              v13 = @"SHOW_ALL_CITIES";
              break;
            case 211:
              v13 = @"TAP_ADD_NEARBY_TRANSIT";
              break;
            case 212:
              v13 = @"RESUME";
              break;
            case 213:
              v13 = @"DISPLAY_TIPKIT_PROMPT";
              break;
            case 214:
              v13 = @"TAP_NEARBY_TRANSIT_FAVORITE";
              break;
            case 215:
              v13 = @"TAP_DRIVING_MODE";
              break;
            case 216:
              v13 = @"SWITCH_ON_VOICE_GUIDANCE";
              break;
            case 217:
              v13 = @"DISMISS_TIPKIT_PROMPT";
              break;
            case 218:
              v13 = @"TAP_EXPAND_EXIT_DETAILS";
              break;
            case 219:
              v13 = @"TAP_NEARBY_TRANSIT_FILTER";
              break;
            case 220:
              v13 = @"TAP_MORE_DEPARTURES";
              break;
            case 221:
              v13 = @"RAP_INDIVIDUAL_PLACE";
              break;
            case 222:
              v13 = @"RAP_ADD_MAP";
              break;
            case 223:
              v13 = @"TAP_SUGGESTED_RAP";
              break;
            case 224:
              v13 = @"RAP_STREET_ISSUE";
              break;
            case 225:
              v13 = @"SWIPE_PIN_REVEAL";
              break;
            case 226:
              v13 = @"TAP_ADD_TIPKIT_FAVORITE";
              break;
            case 227:
              v13 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
              break;
            case 228:
              v13 = @"RAP_BAD_TRIP";
              break;
            case 229:
              v13 = @"RAP_PLACE_ISSUE";
              break;
            case 230:
              v13 = @"TAP_OPEN_MAPS";
              break;
            case 231:
              v13 = @"TAP_NEARBY_TRANSIT_RESULT";
              break;
            case 232:
              v13 = @"RAP_GUIDE";
              break;
            case 233:
              v13 = @"SWITCH_OFF_VOICE_GUIDANCE";
              break;
            case 234:
              v13 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
              break;
            case 235:
              v13 = @"SELECT_TRANSIT_STEP";
              break;
            case 236:
              v13 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
              break;
            case 237:
              v13 = @"TAP_SEE_MORE";
              break;
            case 238:
              v13 = @"RAP_IN_REVIEW";
              break;
            case 239:
              v13 = @"TAP_OPEN_MENU";
              break;
            case 240:
              v13 = @"TAP_NEARBY_TRANSIT";
              break;
            case 241:
              v13 = @"TAP_PIN_LINE";
              break;
            case 242:
              v13 = @"SWITCH_OFF_TRIP_FEEDBACK";
              break;
            case 243:
              v13 = @"RAP_GOOD_TRIP";
              break;
            case 244:
              v13 = @"TAP_FILTERED_CURATED_COLLECTION";
              break;
            case 245:
              v13 = @"SHARE_MY_LOCATION";
              break;
            case 246:
              v13 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
              break;
            case 247:
              v13 = @"DISPLAY_GENERIC_ADVISORY";
              break;
            case 248:
              v13 = @"ADVISORY_ALERT";
              break;
            case 249:
              v13 = @"PUNCH_OUT_LINK";
              break;
            case 250:
              v13 = @"TAP_GENERIC_ADVISORY";
              break;
            case 251:
              v13 = @"TAP_EXPLORE_MODE";
              break;
            case 252:
              v13 = @"TAP_UNPIN_LINE";
              break;
            case 253:
              v13 = @"MENU_UNPIN";
              break;
            case 254:
              v13 = @"MENU_PIN";
              break;
            case 255:
              v13 = @"SWIPE_PIN";
              break;
            case 256:
              v13 = @"SWIPE_UNPIN";
              break;
            case 257:
              v13 = @"TAP_MEDIA_APP";
              break;
            case 258:
              v13 = @"TAP_GUIDES_SUBACTION";
              break;
            case 259:
              v13 = @"TAP_MEDIA";
              break;
            case 260:
              v13 = @"PUNCH_OUT_MEDIA";
              break;
            case 261:
              v13 = @"SHOW_MEDIA_APP_MENU";
              break;
            case 262:
              v13 = @"SCROLL_RIGHT_RIBBON";
              break;
            case 263:
              v13 = @"SCROLL_LEFT_RIBBON";
              break;
            case 264:
              v13 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
              break;
            case 265:
              v13 = @"TAP_SHOW_MORE_TEXT";
              break;
            case 266:
              v13 = @"SCROLL_LEFT_RATINGS";
              break;
            case 267:
              v13 = @"SCROLL_LEFT_TEMPLATE_PLACE";
              break;
            case 268:
              v13 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
              break;
            case 269:
              v13 = @"SCROLL_RIGHT_RATINGS";
              break;
            case 270:
              v13 = @"TAP_ALLOW";
              break;
            case 271:
              v13 = @"TAP_GO_TO_SETTING";
              break;
            case 272:
              v13 = @"START_SUBMIT_REPORT";
              break;
            case 273:
              v13 = @"AUTHENTICATION_INFO_FAILURE";
              break;
            case 274:
              v13 = @"SUCCESSFULLY_SUBMIT_REPORT";
              break;
            case 275:
              v13 = @"FAILED_SUBMIT_REPORT";
              break;
            case 276:
              v13 = @"AUTHENTICATION_INFO_SUCCESS";
              break;
            case 277:
              v13 = @"EDIT_WAYPOINT";
              break;
            case 278:
              v13 = @"CLEAR_TEXT";
              break;
            case 279:
              v13 = @"REORDER_WAYPOINT";
              break;
            case 280:
              v13 = @"REMOVE_WAYPOINT";
              break;
            case 281:
              v13 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
              break;
            case 282:
              v13 = @"TAP_SHOWCASE_MENU";
              break;
            case 283:
              v13 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
              break;
            case 284:
              v13 = @"TAP_PHOTO_ALBUM";
              break;
            case 285:
              v13 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
              break;
            case 286:
              v13 = @"RAP_INLINE_ADD";
              break;
            case 287:
              v13 = @"RAP_TAP_EDIT";
              break;
            case 288:
              v13 = @"CLAIM_BUSINESS";
              break;
            case 289:
              v13 = @"RAP_EDIT_OPTIONS";
              break;
            case 290:
              v13 = @"TAP_IN_REVIEW_RAP";
              break;
            case 291:
              v13 = @"ORB_MENU_ADD_STOP";
              break;
            case 292:
              v13 = @"NEXT_STOP";
              break;
            case 293:
              v13 = @"ARRIVE_AT_WAYPOINT";
              break;
            case 294:
              v13 = @"REMOVE_STOP";
              break;
            case 295:
              v13 = @"DISPLAY_PAUSE_BUTTON";
              break;
            case 296:
              v13 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
              break;
            case 297:
              v13 = @"AUTO_ADVANCE_NEXT_STOP";
              break;
            case 298:
              v13 = @"ADD_INLINE_NEGATIVE_RATING";
              break;
            case 299:
              v13 = @"ADD_INLINE_POSITIVE_RATING";
              break;
            case 300:
              v13 = @"TAP_TO_ADD_RATING_AND_PHOTO";
              break;
            case 301:
              v13 = @"SUBMIT_RATINGS_AND_PHOTOS";
              break;
            case 302:
              v13 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
              break;
            case 303:
              v13 = @"TAP_RECENTLY_VIEWED_ROUTE";
              break;
            case 304:
              v13 = @"SHOW_ALL_RECENTS";
              break;
            case 305:
              v13 = @"RESUME_MULTIPOINT_ROUTE";
              break;
            case 306:
              v13 = @"DISMISS_TRANSIT_TIPKIT";
              break;
            case 307:
              v13 = @"DISPLAY_TRANSIT_TIPKIT";
              break;
            case 308:
              v13 = @"TAP_TRANSIT_TIPKIT";
              break;
            case 309:
              v13 = @"FILTER_EV";
              break;
            case 310:
              v13 = @"FILTER_SURCHARGE";
              break;
            case 311:
              v13 = @"FILTER_PREFER";
              break;
            case 312:
              v13 = @"TAP_WALKING_ANNOTATION";
              break;
            case 313:
              v13 = @"FILTER_AVOID";
              break;
            case 314:
              v13 = @"FILTER_TRANSPORTATION_MODE";
              break;
            case 315:
              v13 = @"FILTER_RECOMMENDED_ROUTES";
              break;
            case 316:
              v13 = @"FILTER_IC_FARES";
              break;
            case 317:
              v13 = @"FILTER_TRANSIT_CARD_FARES";
              break;
            case 318:
              v13 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
              break;
            case 319:
              v13 = @"TAP_NOTIFICATION_SETTINGS";
              break;
            case 320:
              v13 = @"TAP_ENABLE_NOTIFICATION";
              break;
            case 321:
              v13 = @"ARP_SUGGESTIONS_TURN_OFF";
              break;
            case 322:
              v13 = @"ARP_SUGGESTIONS_TURN_ON";
              break;
            case 323:
              v13 = @"DISMISS_ARP_SUGGESTION";
              break;
            case 324:
              v13 = @"RATINGS_AND_PHOTOS_TURN_ON";
              break;
            case 325:
              v13 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
              break;
            case 326:
              v13 = @"UNSELECT_SUGGESTED_PHOTOS";
              break;
            case 327:
              v13 = @"SUGGESTED_PHOTOS_SHOWN";
              break;
            case 328:
              v13 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
              break;
            case 329:
              v13 = @"TAP_YOUR_PHOTOS_ALBUM";
              break;
            case 330:
              v13 = @"RATINGS_AND_PHOTOS_TURN_OFF";
              break;
            case 331:
              v13 = @"DELETE_PHOTO";
              break;
            case 332:
              v13 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
              break;
            case 333:
              v13 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
              break;
            case 334:
              v13 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
              break;
            case 335:
              v13 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
              break;
            case 336:
              v13 = @"SELECT_SUGGESTED_PHOTOS";
              break;
            case 337:
              v13 = @"ADD_STOP";
              break;
            case 338:
              v13 = @"SHOW_CREDIT_TURN_ON";
              break;
            case 339:
              v13 = @"DISPLAY_ARP_SUGGESTION";
              break;
            case 340:
              v13 = @"TAP_TO_ADD_PHOTO_CREDIT";
              break;
            case 341:
              v13 = @"SHOW_CREDIT_TURN_OFF";
              break;
            case 342:
              v13 = @"TAP_TO_EDIT_NICKNAME";
              break;
            case 343:
              v13 = @"SUBMIT_RATINGS";
              break;
            case 344:
              v13 = @"END_NAV_ON_WATCH";
              break;
            case 345:
              v13 = @"FILTER_EBIKE";
              break;
            case 356:
              v13 = @"ADD_STOP_SIRI";
              break;
            case 357:
              v13 = @"TAP_REVIEWED_RAP";
              break;
            case 358:
              v13 = @"TAP_OUTREACH_RAP";
              break;
            case 359:
              v13 = @"DISPLAY_SUGGESTED_ITEM";
              break;
            case 360:
              v13 = @"DISPLAY_HIKING_TIPKIT";
              break;
            case 361:
              v13 = @"DISMISS_HIKING_TIPKIT";
              break;
            case 362:
              v13 = @"TAP_HIKING_TIPKIT";
              break;
            case 363:
              v13 = @"SCROLL_LEFT_TRAILS";
              break;
            case 364:
              v13 = @"TAP_MORE_TRAILS";
              break;
            case 365:
              v13 = @"TAP_RELATED_TRAIL";
              break;
            case 366:
              v13 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
              break;
            case 367:
              v13 = @"SCROLL_RIGHT_TRAILS";
              break;
            case 368:
              v13 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
              break;
            case 369:
              v13 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
              break;
            case 370:
              v13 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
              break;
            case 371:
              v13 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
              break;
            case 372:
              v13 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
              break;
            case 373:
              v13 = @"EXPIRED_MAPS_REMOVED";
              break;
            case 374:
              v13 = @"UPDATE_ALL_DOWNLOAD_MAPS";
              break;
            case 375:
              v13 = @"TAP_EXPIRED_MAPS";
              break;
            case 376:
              v13 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
              break;
            case 377:
              v13 = @"MOVE_DOWNLOAD_MAPS";
              break;
            case 378:
              v13 = @"SAVE_RENAME_DOWNLOAD_MAPS";
              break;
            case 379:
              v13 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
              break;
            case 380:
              v13 = @"TAP_ENTER_OFFLINE_MAPS";
              break;
            case 381:
              v13 = @"TAP_DOWNLOAD_MAPS";
              break;
            case 382:
              v13 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
              break;
            case 383:
              v13 = @"DELETE_DOWNLOAD_MAPS";
              break;
            case 384:
              v13 = @"SLIDE_CLEAR_EXPIRED_MAPS";
              break;
            case 385:
              v13 = @"RENAME_DOWNLOAD_MAPS";
              break;
            case 386:
              v13 = @"RESIZE_DOWNLOAD_MAPS";
              break;
            case 387:
              v13 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
              break;
            case 388:
              v13 = @"RESTORE_EXPIRED_MAPS";
              break;
            case 389:
              v13 = @"CLEAR_EXPIRED_MAPS";
              break;
            case 390:
              v13 = @"TAP_USING_OFFLINE_BAR";
              break;
            case 391:
              v13 = @"UPDATE_DOWNLOAD_MAPS";
              break;
            case 392:
              v13 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
              break;
            case 393:
              v13 = @"DISPLAY_DOWNLOAD_MAPS";
              break;
            case 394:
              v13 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
              break;
            case 395:
              v13 = @"DISPLAY_EXPIRED_MAPS";
              break;
            case 396:
              v13 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
              break;
            case 397:
              v13 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
              break;
            case 398:
              v13 = @"SLIDE_RESTORE_EXPIRED_MAPS";
              break;
            case 399:
              v13 = @"ETA_SHARE_TRAY_TIMEOUT";
              break;
            case 400:
              v13 = @"START_ETA_SHARING";
              break;
            case 401:
              v13 = @"PERSON_LOCATION_UPDATE";
              break;
            case 402:
              v13 = @"STOP_ETA_SHARING";
              break;
            case 403:
              v13 = @"PUNCH_OUT_TO_FINDMY";
              break;
            case 404:
              v13 = @"TAP_PEOPLE_LOCATION";
              break;
            case 405:
              v13 = @"TAP_TO_REQUEST_LOCATION";
              break;
            case 406:
              v13 = @"ZOOM_OUT_CROWN";
              break;
            case 407:
              v13 = @"TAP_RESIZE_DOWNLOAD_MAPS";
              break;
            case 408:
              v13 = @"TAP_DELETE_DOWNLOAD_MAPS";
              break;
            case 409:
              v13 = @"SELECT_LIST_VIEW";
              break;
            case 410:
              v13 = @"SCROLL_RIGHT_TRAILHEADS";
              break;
            case 411:
              v13 = @"SWITCH_TO_ONLINE_MODE";
              break;
            case 412:
              v13 = @"TAP_RELATED_TRAILHEAD";
              break;
            case 413:
              v13 = @"SELECT_ELEVATION_VIEW";
              break;
            case 414:
              v13 = @"TOGGLE_PROXIMITY_RADIUS_ON";
              break;
            case 415:
              v13 = @"SEE_MORE_RECENTS";
              break;
            case 416:
              v13 = @"SEE_MORE_GUIDES";
              break;
            case 417:
              v13 = @"SELECT_CONTROLS";
              break;
            case 418:
              v13 = @"NO_SEARCH_RESULTS";
              break;
            case 419:
              v13 = @"TAP_VIEW_RESULTS_CAROUSEL";
              break;
            case 420:
              v13 = @"TAP_VIEW_RESULTS_LIST";
              break;
            case 421:
              v13 = @"SELECT_MAP_VIEW";
              break;
            case 422:
              v13 = @"SCROLL_LEFT_TRAILHEADS";
              break;
            case 423:
              v13 = @"SWITCH_TO_OFFLINE_MODE";
              break;
            case 424:
              v13 = @"ZOOM_IN_CROWN";
              break;
            case 425:
              v13 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
              break;
            case 426:
              v13 = @"TAP_MAP";
              break;
            case 427:
              v13 = @"SWIPE_DOWN";
              break;
            case 428:
              v13 = @"TAP_MORE_TRAILHEADS";
              break;
            case 429:
              v13 = @"TAP_ROUTE_OPTIONS";
              break;
            case 430:
              v13 = @"TAP_ROUTE_NAV_MAP";
              break;
            case 431:
              v13 = @"TAP_ROUTE_OVERVIEW_MAP";
              break;
            case 432:
              v13 = @"TAP_AUDIO";
              break;
            case 433:
              v13 = @"TAP_OPEN_PLACECARD";
              break;
            case 434:
              v13 = @"TAP_VIEW_STOPS";
              break;
            case 435:
              v13 = @"TAP_ROUTE_DETAILS";
              break;
            case 436:
              v13 = @"ADD_LPR_VEHICLE";
              break;
            case 437:
              v13 = @"TAP_ADD_VEHICLE";
              break;
            case 438:
              v13 = @"TAP_PLUG_TYPE";
              break;
            case 439:
              v13 = @"UNSELECT_SUGGESTED_NETWORK";
              break;
            case 440:
              v13 = @"TAP_SET_UP_LATER";
              break;
            case 441:
              v13 = @"ADD_EV_VEHICLE";
              break;
            case 442:
              v13 = @"UPDATE_COLOR";
              break;
            case 443:
              v13 = @"SELECT_OTHER_NETWORK";
              break;
            case 444:
              v13 = @"UNSELECT_NETWORK";
              break;
            case 445:
              v13 = @"TAP_BACK";
              break;
            case 446:
              v13 = @"TAP_CANCEL";
              break;
            case 447:
              v13 = @"UNSELECT_VEHICLE";
              break;
            case 448:
              v13 = @"UNSELECT_OTHER_NETWORK";
              break;
            case 449:
              v13 = @"DISPLAY_EV_TIPKIT";
              break;
            case 450:
              v13 = @"SELECT_NETWORK";
              break;
            case 451:
              v13 = @"TAP_EV_TIPKIT";
              break;
            case 452:
              v13 = @"TAP_CHOOSE_NETWORKS";
              break;
            case 453:
              v13 = @"TAP_ADD_NETWORK";
              break;
            case 454:
              v13 = @"FILTER_NETWORK";
              break;
            case 455:
              v13 = @"SELECT_SUGGESTED_NETWORK";
              break;
            case 456:
              v13 = @"TRANSIT_TO_WALKING";
              break;
            case 457:
              v13 = @"TRANSIT_TO_FINDMY";
              break;
            case 458:
              v13 = @"TAP_AC_KEYBOARD";
              break;
            case 459:
              v13 = @"REACH_PHOTO_STRIP_END";
              break;
            case 460:
              v13 = @"SEARCH_HERE_REVEAL";
              break;
            case 461:
              v13 = @"TAP_SEARCH_HERE";
              break;
            case 462:
              v13 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
              break;
            case 463:
              v13 = @"SAVE";
              break;
            case 464:
              v13 = @"TAP_MORE_CURATED_HIKES";
              break;
            case 465:
              v13 = @"CREATE_CUSTOM_ROUTE";
              break;
            case 466:
              v13 = @"TAP_TRY_NOW";
              break;
            case 467:
              v13 = @"TAP_CURATED_HIKE";
              break;
            case 468:
              v13 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
              break;
            case 469:
              v13 = @"ADD_TO_LIBRARY";
              break;
            case 470:
              v13 = @"START_HIKING";
              break;
            case 471:
              v13 = @"EDIT_NOTE";
              break;
            case 472:
              v13 = @"CREATE_NOTE";
              break;
            case 473:
              v13 = @"DELETE_PIN";
              break;
            case 474:
              v13 = @"ADD_ROUTE";
              break;
            case 475:
              v13 = @"ADD_PIN";
              break;
            case 476:
              v13 = @"REMOVE_FROM_COLLECTION";
              break;
            case 477:
              v13 = @"REMOVE_FROM_LIBRARY";
              break;
            case 478:
              v13 = @"TAP_ITEM";
              break;
            case 479:
              v13 = @"DELETE_ROUTE";
              break;
            case 480:
              v13 = @"TAP_ROUTE";
              break;
            case 481:
              v13 = @"TAP_DOWNLOAD_WATCH_MAPS";
              break;
            case 482:
              v13 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
              break;
            case 483:
              v13 = @"STOP_DOWNLOAD_ONTO_WATCH";
              break;
            case 484:
              v13 = @"TAP_DOWNLOAD_ONTO_WATCH";
              break;
            case 485:
              v13 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
              break;
            case 486:
              v13 = @"TAP_DOWNLOAD_NOW_WATCH";
              break;
            case 487:
              v13 = @"REVEAL_DETECTION_LIST";
              break;
            case 488:
              v13 = @"TAP_RECOMMENDATION";
              break;
            case 489:
              v13 = @"TAP_EXPAND";
              break;
            case 490:
              v13 = @"EXPAND_DETECTION_LIST";
              break;
            case 1001:
              v13 = @"PAN";
              break;
            case 1002:
              v13 = @"ZOOM_IN";
              break;
            case 1003:
              v13 = @"ZOOM_OUT";
              break;
            case 1004:
              v13 = @"ROTATE";
              break;
            case 1010:
              v13 = @"TAP_POI";
              break;
            case 1011:
              v13 = @"TAP_POI_TRANSIT";
              break;
            case 1017:
              v13 = @"TAP_POI_HIGHLIGHTED";
              break;
            case 1018:
              v13 = @"TAP_POI_CLUSTERED";
              break;
            case 1020:
              v13 = @"TAP_POI_DROPPED_PIN";
              break;
            case 1030:
              v13 = @"DROP_PIN";
              break;
            case 1031:
              v13 = @"TAP_INCIDENT";
              break;
            case 1032:
              v13 = @"TAP_TRANSIT_LINE";
              break;
            case 1033:
              v13 = @"TAP_POI_CALENDAR";
              break;
            case 1034:
              v13 = @"TAP_POI_CURRENT_LOCATION";
              break;
            case 1035:
              v13 = @"TAP_POI_TRANSIT_LINE";
              break;
            case 1036:
              v13 = @"TAP_POI_LANDMARK";
              break;
            case 1037:
              v13 = @"TAP_POI_FLYOVER";
              break;
            case 1038:
              v13 = @"TAP_TO_HIDE_TRAY";
              break;
            case 1039:
              v13 = @"TAP_TO_REVEAL_TRAY";
              break;
            case 1040:
              v13 = @"TAP_COMPASS";
              break;
            case 1041:
              v13 = @"PITCH_AWAY_FROM_GROUND";
              break;
            case 1042:
              v13 = @"PITCH_CLOSER_TO_GROUND";
              break;
            case 1043:
              v13 = @"ZOOM_IN_PINCH";
              break;
            case 1044:
              v13 = @"ZOOM_OUT_PINCH";
              break;
            case 1045:
              v13 = @"ZOOM_IN_DOUBLE_TAP";
              break;
            case 1046:
              v13 = @"ZOOM_OUT_TWO_FINGER_TAP";
              break;
            case 1047:
              v13 = @"ZOOM_IN_ONE_FINGER";
              break;
            case 1048:
              v13 = @"ZOOM_OUT_ONE_FINGER";
              break;
            case 1049:
              v13 = @"ZOOM_IN_BUTTON";
              break;
            case 1050:
              v13 = @"ZOOM_OUT_BUTTON";
              break;
            case 1051:
              v13 = @"TAP_TRAFFIC_CAMERA";
              break;
            case 1052:
              v13 = @"DISPLAY_INDOOR_MAP_BUTTON";
              break;
            case 1053:
              v13 = @"OPEN_INDOOR_MAP";
              break;
            case 1054:
              v13 = @"DISPLAY_VENUE_BROWSE_BUTTON";
              break;
            case 1055:
              v13 = @"TAP_VENUE_BROWSE_BUTTON";
              break;
            case 1056:
              v13 = @"ENTER_VENUE_EXPERIENCE";
              break;
            case 1057:
              v13 = @"EXIT_VENUE_EXPERIENCE";
              break;
            case 1058:
              v13 = @"ZOOM_IN_SCENE_PINCH";
              break;
            case 1059:
              v13 = @"ZOOM_OUT_SCENE_PINCH";
              break;
            case 1060:
              v13 = @"ZOOM_RESET";
              break;
            case 1061:
              v13 = @"TAP_SCENE_UNAVAILABLE_AREA";
              break;
            case 1062:
              v13 = @"TAP_TRANSIT_ACCESS_POINT";
              break;
            case 1063:
              v13 = @"TAP_SPEED_CAMERA";
              break;
            case 1064:
              v13 = @"TAP_RED_LIGHT_CAMERA";
              break;
            case 1065:
              v13 = @"TAP_GEO";
              break;
            default:
              switch((int)v12)
              {
                case 2001:
                  v13 = @"TAP_SEARCH_FIELD";
                  break;
                case 2002:
                  v13 = @"CLEAR_SEARCH";
                  break;
                case 2003:
                  v13 = @"CANCEL_SEARCH";
                  break;
                case 2004:
                  v13 = @"TAP_BROWSE_TOP_CATEGORY";
                  break;
                case 2005:
                  v13 = @"TAP_BROWSE_SUB_CATEGORY";
                  break;
                case 2006:
                  v13 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
                  break;
                case 2007:
                  v13 = @"TAP_LIST_ITEM";
                  break;
                case 2008:
                  v13 = @"SHARE_LIST_ITEM";
                  break;
                case 2009:
                  v13 = @"DELETE_LIST_ITEM";
                  break;
                case 2010:
                  v13 = @"EDIT_LIST_ITEM";
                  break;
                case 2011:
                  v13 = @"REFRESH_SEARCH";
                  break;
                case 2012:
                  v13 = @"REVEAL_LIST_ITEM_ACTIONS";
                  break;
                case 2013:
                  v13 = @"HIDE_LIST_ITEM_ACTIONS";
                  break;
                case 2014:
                  v13 = @"TAP_SEARCH_BUTTON";
                  break;
                case 2015:
                  v13 = @"SHOW_SEARCH_RESULTS";
                  break;
                case 2016:
                  v13 = @"SHOW_REFRESH_SEARCH";
                  break;
                case 2017:
                  v13 = @"PASTE_TEXT";
                  break;
                case 2018:
                  v13 = @"TAP_LIST_SUB_ITEM";
                  break;
                case 2019:
                  v13 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
                  break;
                case 2020:
                  v13 = @"TAP_DID_YOU_MEAN_MESSAGE";
                  break;
                case 2021:
                  v13 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
                  break;
                case 2022:
                  v13 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
                  break;
                case 2023:
                  v13 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
                  break;
                case 2024:
                  v13 = @"RETAINED_QUERY";
                  break;
                case 2025:
                  v13 = @"TAP_RECENT_AC_SUGGESTION";
                  break;
                case 2026:
                  v13 = @"CLEAR_RECENT_AC_SUGGESTION";
                  break;
                case 2027:
                  v13 = @"DELETE_RECENT_AC_SUGGESTION";
                  break;
                case 2028:
                case 2029:
                  goto LABEL_55;
                case 2030:
                  v13 = @"TAP_BROWSE_NEARBY_CATEGORY";
                  break;
                case 2031:
                  v13 = @"TAP_SUBACTION";
                  break;
                case 2032:
                  v13 = @"TAP_QUERY_BUILDING_ARROW";
                  break;
                case 2033:
                  v13 = @"CLICK_ON_EDIT_SEARCH";
                  break;
                case 2034:
                  v13 = @"REMOVE_CLIENT_AC_SUGGESTION";
                  break;
                case 2035:
                  v13 = @"SHARE_CLIENT_AC_SUGGESTION";
                  break;
                case 2036:
                  v13 = @"TAP_ON_MORE_RESULTS";
                  break;
                case 2037:
                  v13 = @"SHARE_ITEM";
                  break;
                case 2038:
                  v13 = @"HIDE_ITEM";
                  break;
                case 2039:
                  v13 = @"TAP_SUGGESTED_ITEM";
                  break;
                case 2040:
                  v13 = @"SHARE_SUGGESTED_ITEM";
                  break;
                case 2041:
                  v13 = @"HIDE_SUGGESTED_ITEM";
                  break;
                case 2042:
                  v13 = @"ADD_HOME_FAVORITE";
                  break;
                case 2043:
                  v13 = @"ADD_WORK_FAVORITE";
                  break;
                case 2044:
                  v13 = @"ADD_FAVORITE";
                  break;
                case 2045:
                  v13 = @"VIEW_FAVORITES_LIST";
                  break;
                case 2046:
                  v13 = @"TAP_HOME_FAVORITE";
                  break;
                case 2047:
                  v13 = @"TAP_WORK_FAVORITE";
                  break;
                case 2048:
                  v13 = @"TAP_CAR_FAVORITE";
                  break;
                case 2049:
                  v13 = @"TAP_FAVORITE_ITEM";
                  break;
                case 2050:
                  v13 = @"CREATE_HOME_FAVORITE";
                  break;
                case 2051:
                  v13 = @"CREATE_WORK_FAVORITE";
                  break;
                case 2052:
                  v13 = @"CREATE_FAVORITE";
                  break;
                case 2053:
                  v13 = @"SUBMIT_FAVORITE_EDIT";
                  break;
                case 2054:
                  v13 = @"ADD_RECOMMENDED_FAVORITE";
                  break;
                case 2055:
                  v13 = @"EDIT_FAVORITE";
                  break;
                case 2056:
                  v13 = @"REMOVE_FAVORITE";
                  break;
                case 2057:
                  v13 = @"SHARE_FAVORITE";
                  break;
                case 2058:
                  v13 = @"EDIT_FAVORITES";
                  break;
                case 2059:
                  v13 = @"ADD_FAVORITE_PLACE";
                  break;
                case 2060:
                  v13 = @"REMOVE_FAVORITE_PLACE";
                  break;
                case 2061:
                  v13 = @"CHANGE_HOME_ADDRESS";
                  break;
                case 2062:
                  v13 = @"CHANGE_WORK_ADDRESS";
                  break;
                case 2063:
                  v13 = @"REFINE_LOCATION";
                  break;
                case 2064:
                  v13 = @"TAP_RECENTLY_VIEWED_ITEM";
                  break;
                case 2065:
                  v13 = @"SHOW_COLLECTION_LIST";
                  break;
                case 2066:
                  v13 = @"SHOW_FAVORITES_COLLECTION";
                  break;
                case 2067:
                  v13 = @"SHOW_COLLECTION";
                  break;
                case 2068:
                  v13 = @"TAP_COLLECTION_ITEM";
                  break;
                case 2069:
                  v13 = @"SHARE_COLLECTION_ITEM";
                  break;
                case 2070:
                  v13 = @"REMOVE_COLLECTION_ITEM";
                  break;
                case 2071:
                  v13 = @"SAVE_SHARED_COLLECTION";
                  break;
                case 2072:
                  v13 = @"CREATE_NEW_COLLECTION";
                  break;
                case 2073:
                  v13 = @"SAVE_TO_COLLECTION";
                  break;
                case 2074:
                  v13 = @"EDIT_PHOTO";
                  break;
                case 2075:
                  v13 = @"SORT_BY_NAME";
                  break;
                case 2076:
                  v13 = @"SORT_BY_DISTANCE";
                  break;
                case 2077:
                  v13 = @"SORT_BY_RECENT";
                  break;
                case 2078:
                  v13 = @"AUTO_SHARE_ETA";
                  break;
                case 2079:
                  v13 = @"CANCEL_AUTO_SHARE_ETA";
                  break;
                case 2080:
                  v13 = @"MAP_SEARCH";
                  break;
                case 2081:
                  v13 = @"DELETE_COLLECTION";
                  break;
                case 2082:
                  v13 = @"SHARE_COLLECTION";
                  break;
                case 2083:
                  v13 = @"SHOW_TRANSIT_LINES_COLLECTION";
                  break;
                case 2084:
                  v13 = @"SHOW_MY_PLACES";
                  break;
                case 2085:
                  v13 = @"SHOW_ALL_PLACES";
                  break;
                case 2086:
                  v13 = @"TAP_RECENT_QUERY";
                  break;
                case 2087:
                  v13 = @"TAP_QUERY_SUGGESTION";
                  break;
                case 2088:
                  v13 = @"DELETE_CURATED_COLLECTION";
                  break;
                case 2089:
                  v13 = @"FOLLOW";
                  break;
                case 2090:
                  v13 = @"PUNCH_IN";
                  break;
                case 2091:
                  v13 = @"SAVE_CURATED_COLLECTION";
                  break;
                case 2092:
                  v13 = @"SCROLL_LEFT_COLLECTIONS";
                  break;
                case 2093:
                  v13 = @"SCROLL_RIGHT_COLLECTIONS";
                  break;
                case 2094:
                  v13 = @"SEE_ALL_CURATED_COLLECTION";
                  break;
                case 2095:
                  v13 = @"SEE_ALL_PUBLISHERS";
                  break;
                case 2096:
                  v13 = @"SHARE_CURATED_COLLECTION";
                  break;
                case 2097:
                  v13 = @"SHARE_PUBLISHER";
                  break;
                case 2098:
                  v13 = @"SHOW_MORE_COLLECTION";
                  break;
                case 2099:
                  v13 = @"TAP_CURATED_COLLECTION";
                  break;
                case 2100:
                  v13 = @"TAP_FEATURED_COLLECTIONS";
                  break;
                case 2101:
                  v13 = @"TAP_LOCATION";
                  break;
                case 2102:
                  v13 = @"TAP_PUBLISHER";
                  break;
                case 2103:
                  v13 = @"TAP_PUBLISHER_APP";
                  break;
                case 2104:
                  v13 = @"TAP_PUBLISHER_COLLECTIONS";
                  break;
                case 2105:
                  v13 = @"UNFOLLOW";
                  break;
                case 2106:
                  v13 = @"CHANGE_SCHOOL_ADDRESS";
                  break;
                case 2107:
                  v13 = @"ADD_VEHICLE";
                  break;
                case 2108:
                  v13 = @"DISPLAY_VIRTUAL_GARAGE";
                  break;
                case 2109:
                  v13 = @"ENTER_VIRTUAL_GARAGE";
                  break;
                case 2110:
                  v13 = @"PUNCH_OUT_MANUFACTURER_APP";
                  break;
                case 2111:
                  v13 = @"REMOVE_LICENSE_PLATE";
                  break;
                case 2112:
                  v13 = @"REMOVE_VEHICLE";
                  break;
                case 2113:
                  v13 = @"SELECT_VEHICLE";
                  break;
                case 2114:
                  v13 = @"SUBMIT_LICENSE_PLATE";
                  break;
                case 2115:
                  v13 = @"TAP_ADD_LICENSE_PLATE";
                  break;
                case 2116:
                  v13 = @"TAP_ADD_NEW_CAR";
                  break;
                case 2117:
                  v13 = @"TAP_BANNER";
                  break;
                case 2118:
                  v13 = @"TAP_CONNECT";
                  break;
                case 2119:
                  v13 = @"TAP_CONTINUE";
                  break;
                case 2120:
                  v13 = @"TAP_EDIT";
                  break;
                case 2121:
                  v13 = @"TAP_NAME";
                  break;
                case 2122:
                  v13 = @"TAP_NOT_NOW";
                  break;
                case 2123:
                  v13 = @"TAP_OTHER_VEHICLE";
                  break;
                case 2124:
                  v13 = @"TAP_REMOVE_LICENSE_PLATE";
                  break;
                case 2125:
                  v13 = @"TAP_UPDATE_PLATE_NUMBER";
                  break;
                case 2126:
                  v13 = @"TAP_VEHICLE";
                  break;
                case 2127:
                  v13 = @"TAP_VEHICLE_NAME";
                  break;
                case 2128:
                  v13 = @"UPDATE_NAME";
                  break;
                case 2129:
                  v13 = @"DONE_TAKING_PHOTO";
                  break;
                case 2130:
                  v13 = @"ENABLE_SHOW_PHOTO_NAME";
                  break;
                case 2131:
                  v13 = @"SUBMIT_PHOTO";
                  break;
                case 2132:
                  v13 = @"USE_PHOTO";
                  break;
                case 2133:
                  v13 = @"ADD_RECOMMENDATION_TO_MAPS";
                  break;
                case 2134:
                  v13 = @"CANCEL_PHOTO_SUBMISSION";
                  break;
                case 2135:
                  v13 = @"CLOSE_RECOMMENDATION_CARD";
                  break;
                case 2136:
                  v13 = @"EDIT_RATING";
                  break;
                case 2137:
                  v13 = @"PROMPTED_TO_ADD_PHOTO";
                  break;
                case 2138:
                  v13 = @"PROMPTED_TO_ADD_RATING";
                  break;
                case 2139:
                  v13 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
                  break;
                case 2140:
                  v13 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
                  break;
                case 2141:
                  v13 = @"RETAKE_PHOTO";
                  break;
                case 2142:
                  v13 = @"REVEAL_RECOMMENDATION_CARD";
                  break;
                case 2143:
                  v13 = @"SUBMIT_NEGATIVE_RATING";
                  break;
                case 2144:
                  v13 = @"SUBMIT_POSITIVE_RATING";
                  break;
                case 2145:
                  v13 = @"TAP_CHOOSING_PHOTO";
                  break;
                case 2146:
                  v13 = @"TAP_TAKE_NEW_PHOTO";
                  break;
                case 2147:
                  v13 = @"TAP_TO_ADD_PHOTO";
                  break;
                case 2148:
                  v13 = @"CANCEL_INCIDENT_REPORT";
                  break;
                case 2149:
                  v13 = @"INCIDENT_REPORT_SUBMITTED";
                  break;
                case 2150:
                  v13 = @"REPORTED_INCIDENT_NOT_RECEIVED";
                  break;
                case 2151:
                  v13 = @"REPORTED_INCIDENT_RECEIVED";
                  break;
                case 2152:
                  v13 = @"REPORT_INCIDENT";
                  break;
                case 2153:
                  v13 = @"SELECT_INCIDENT_TYPE";
                  break;
                case 2154:
                  v13 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
                  break;
                case 2155:
                  v13 = @"TAP_TO_START_REPORT_INCIDENT";
                  break;
                case 2156:
                  v13 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
                  break;
                case 2157:
                  v13 = @"ATTEMPT_VLF_CORRECTION";
                  break;
                case 2158:
                  v13 = @"DISMISS_VLF_PROMPT";
                  break;
                case 2159:
                  v13 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
                  break;
                case 2160:
                  v13 = @"VLF_CORRECTION_FAILED";
                  break;
                case 2161:
                  v13 = @"VLF_CORRECTION_SUCCESSFUL";
                  break;
                case 2162:
                  v13 = @"ENABLE_WIDGET_SUGGESTIONS";
                  break;
                case 2163:
                  v13 = @"DISPLAY_CZ_ADVISORY";
                  break;
                case 2164:
                  v13 = @"PUNCH_OUT_URL_PAY";
                  break;
                case 2165:
                  v13 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
                  break;
                case 2166:
                  v13 = @"DELETE_ITEM";
                  break;
                case 2167:
                  v13 = @"CANCEL_REMOVE";
                  break;
                case 2168:
                  v13 = @"DELETE_SUGGESTION";
                  break;
                case 2169:
                  v13 = @"ADD_SCHOOL_FAVORITE";
                  break;
                case 2170:
                  v13 = @"GO_TO_WEBSITE";
                  break;
                case 2171:
                  v13 = @"TRY_AGAIN";
                  break;
                case 2172:
                  v13 = @"CHECK_AUTO_RECORD_WORKOUT";
                  break;
                case 2173:
                  v13 = @"CHECK_EBIKE";
                  break;
                case 2174:
                  v13 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
                  break;
                case 2175:
                  v13 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
                  break;
                case 2176:
                  v13 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
                  break;
                case 2177:
                  v13 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
                  break;
                case 2178:
                  v13 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
                  break;
                case 2179:
                  v13 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
                  break;
                case 2180:
                  v13 = @"TAP_CYCLING_DEFAULT_OPTION";
                  break;
                case 2181:
                  v13 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
                  break;
                case 2182:
                  v13 = @"TAP_CYCLING_STAIRS_ADVISORY";
                  break;
                case 2183:
                  v13 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
                  break;
                case 2184:
                  v13 = @"UNCHECK_AUTO_RECORD_WORKOUT";
                  break;
                case 2185:
                  v13 = @"UNCHECK_EBIKE";
                  break;
                case 2186:
                  v13 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
                  break;
                case 2187:
                  v13 = @"DISPLAY_LPR_ADVISORY";
                  break;
                case 2188:
                  v13 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
                  break;
                case 2189:
                  v13 = @"CREATE_WIDGET";
                  break;
                case 2190:
                  v13 = @"REVEAL_WIDGET_TRAY";
                  break;
                case 2191:
                  v13 = @"LPR_ERROR_CODE";
                  break;
                case 2192:
                  v13 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
                  break;
                case 2193:
                  v13 = @"TAP_CLEAR_RECENTLY_VIEWED";
                  break;
                case 2194:
                  v13 = @"LPR_HARD_STOP";
                  break;
                case 2195:
                  v13 = @"TAP_PUBLISHER_SUBACTION";
                  break;
                case 2196:
                  v13 = @"CARPLAY_DISPLAY_ACTIVATED";
                  break;
                case 2197:
                  v13 = @"CARPLAY_DISPLAY_DEACTIVATED";
                  break;
                case 2198:
                  v13 = @"TAP_FEATURED_COLLECTION";
                  break;
                case 2199:
                  v13 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
                  break;
                case 2200:
                  v13 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
                  break;
                default:
                  switch((int)v12)
                  {
                    case 3001:
                      v13 = @"START_NAV";
                      break;
                    case 3002:
                      v13 = @"END_NAV";
                      break;
                    case 3003:
                      v13 = @"OPEN_NAV_AUDIO_SETTINGS";
                      break;
                    case 3004:
                      v13 = @"VIEW_DETAILS";
                      break;
                    case 3005:
                      v13 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                      break;
                    case 3006:
                      v13 = @"OPEN_ROUTING_EDITOR";
                      break;
                    case 3007:
                      v13 = @"EDIT_ORIGIN";
                      break;
                    case 3008:
                      v13 = @"EDIT_DESTINATION";
                      break;
                    case 3009:
                      v13 = @"SWAP_ORIGIN_DESTINATION";
                      break;
                    case 3010:
                      v13 = @"OPEN_MORE_ROUTES";
                      break;
                    case 3011:
                      v13 = @"SELECT_ROUTING_TYPE_DRIVING";
                      break;
                    case 3012:
                      v13 = @"SELECT_ROUTING_TYPE_WALKING";
                      break;
                    case 3013:
                      v13 = @"SELECT_ROUTING_TYPE_TRANSIT";
                      break;
                    case 3014:
                      v13 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                      break;
                    case 3015:
                      v13 = @"SELECT_ROUTE";
                      break;
                    case 3016:
                      v13 = @"COLLAPSE_STEP_DETAILS_WALK";
                      break;
                    case 3017:
                      v13 = @"EXPAND_STEP_DETAILS_WALK";
                      break;
                    case 3018:
                      v13 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                      break;
                    case 3019:
                      v13 = @"EXPAND_STEP_DETAILS_TRANSIT";
                      break;
                    case 3020:
                      v13 = @"UNCHECK_BUS";
                      break;
                    case 3021:
                      v13 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                      break;
                    case 3022:
                      v13 = @"UNCHECK_COMMUTER_RAIL";
                      break;
                    case 3023:
                      v13 = @"UNCHECK_FERRY";
                      break;
                    case 3024:
                      v13 = @"CHECK_BUS";
                      break;
                    case 3025:
                      v13 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                      break;
                    case 3026:
                      v13 = @"CHECK_COMMUTER_RAIL";
                      break;
                    case 3027:
                      v13 = @"CHECK_FERRY";
                      break;
                    case 3028:
                      v13 = @"SELECT_LEAVE_AT";
                      break;
                    case 3029:
                      v13 = @"SELECT_ARRIVE_BY";
                      break;
                    case 3030:
                      v13 = @"SELECT_LEAVE_NOW";
                      break;
                    case 3031:
                      v13 = @"SELECT_DATE_TIME";
                      break;
                    case 3032:
                      v13 = @"SWITCH_ON_IC_FARES";
                      break;
                    case 3033:
                      v13 = @"SWITCH_OFF_IC_FARES";
                      break;
                    case 3034:
                      v13 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                      break;
                    case 3035:
                      v13 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                      break;
                    case 3036:
                      v13 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                      break;
                    case 3037:
                      v13 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                      break;
                    case 3038:
                      v13 = @"REVEAL_FROM_ROUTING";
                      break;
                    case 3039:
                      v13 = @"DISPLAY_ROUTES";
                      break;
                    case 3040:
                      v13 = @"CHECK_RECOMMENDED_ROUTES";
                      break;
                    case 3041:
                      v13 = @"UNCHECK_RECOMMENDED_ROUTES";
                      break;
                    case 3042:
                      v13 = @"CHECK_FASTER_TRIPS";
                      break;
                    case 3043:
                      v13 = @"UNCHECK_FASTER_TRIPS";
                      break;
                    case 3044:
                      v13 = @"CHECK_FEWER_TRANSFERS";
                      break;
                    case 3045:
                      v13 = @"UNCHECK_FEWER_TRANSFERS";
                      break;
                    case 3046:
                      v13 = @"CHECK_LESS_WALKING";
                      break;
                    case 3047:
                      v13 = @"UNCHECK_LESS_WALKING";
                      break;
                    case 3048:
                      v13 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                      break;
                    case 3049:
                      v13 = @"TAP_MORE_ROUTES";
                      break;
                    case 3050:
                      v13 = @"OPEN_NAV_OVERVIEW";
                      break;
                    case 3051:
                      v13 = @"RESUME_NAV_MANEUVER_VIEW";
                      break;
                    case 3052:
                      v13 = @"SELECT_AUDIO_VOLUME_SILENT";
                      break;
                    case 3053:
                      v13 = @"SELECT_AUDIO_VOLUME_LOW";
                      break;
                    case 3054:
                      v13 = @"SELECT_AUDIO_VOLUME_NORMAL";
                      break;
                    case 3055:
                      v13 = @"SELECT_AUDIO_VOLUME_LOUD";
                      break;
                    case 3056:
                      v13 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                      break;
                    case 3057:
                      v13 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                      break;
                    case 3058:
                      v13 = @"RESUME_PREV_NAV";
                      break;
                    case 3059:
                      v13 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                      break;
                    case 3060:
                      v13 = @"ACCEPT_REROUTE";
                      break;
                    case 3061:
                      v13 = @"DISMISS_REROUTE";
                      break;
                    case 3062:
                      v13 = @"ATTEMPT_END_NAV";
                      break;
                    case 3063:
                      v13 = @"DISPLAY_BANNER";
                      break;
                    case 3064:
                      v13 = @"VIEW_BANNER_DETAILS";
                      break;
                    case 3065:
                      v13 = @"ENTER_GUIDANCE";
                      break;
                    case 3066:
                      v13 = @"AUTO_ADVANCE_GUIDANCE";
                      break;
                    case 3067:
                      v13 = @"TAP_OPEN_WALLET";
                      break;
                    case 3068:
                      v13 = @"SELECT_VOICE_GUIDANCE_ALL";
                      break;
                    case 3069:
                      v13 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                      break;
                    case 3070:
                      v13 = @"SELECT_VOICE_GUIDANCE_NONE";
                      break;
                    case 3071:
                      v13 = @"DISPLAY_CARD";
                      break;
                    case 3072:
                      v13 = @"RENDER_ROUTE";
                      break;
                    case 3073:
                      v13 = @"DISPLAY_JUNCTION_VIEW";
                      break;
                    case 3074:
                      v13 = @"SELECT_DEPARTURE";
                      break;
                    case 3075:
                      v13 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                      break;
                    case 3076:
                      v13 = @"DEVICE_RAISE";
                      break;
                    case 3077:
                      v13 = @"ENTER_AR_NAV_VIEW";
                      break;
                    case 3078:
                      v13 = @"EXIT_AR_NAV_VIEW";
                      break;
                    case 3079:
                      v13 = @"AR_CALIBRATION_START";
                      break;
                    case 3080:
                      v13 = @"AR_CALIBRATION_FAILURE";
                      break;
                    case 3081:
                      v13 = @"AR_CALIBRATION_SUCCESS";
                      break;
                    case 3082:
                      v13 = @"DISPLAY_AR_NAV_ARROW";
                      break;
                    case 3083:
                      v13 = @"DISPLAY_AR_NAV_TURN_AROUND";
                      break;
                    case 3084:
                      v13 = @"DISPLAY_GO_OUTSIDE_BANNER";
                      break;
                    case 3085:
                      v13 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                      break;
                    case 3086:
                      v13 = @"DISPLAY_AR_NAV_ENDPOINT";
                      break;
                    case 3087:
                      v13 = @"DISPLAY_ADVISORY_BANNER";
                      break;
                    case 3088:
                      v13 = @"TAP_SHOW_ADVISORY_DETAILS";
                      break;
                    default:
                      goto LABEL_55;
                  }
                  break;
              }
              break;
          }
        }
        [v9 addObject:v13];

        ++v11;
        v10 = (void *)(a1 + 40);
      }
      while (v11 < *(void *)(a1 + 48));
    }
    if (a2) {
      v14 = @"possibleAction";
    }
    else {
      v14 = @"possible_action";
    }
    [v4 setObject:v9 forKey:v14];
  }
  if (*(void *)(a1 + 72))
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v16 = (void *)(a1 + 64);
    if (*(void *)(a1 + 72))
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = *(int *)(*v16 + 4 * v17);
        if (v18 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E53F8280[v18];
        }
        [v15 addObject:v19];

        ++v17;
        v16 = (void *)(a1 + 64);
      }
      while (v17 < *(void *)(a1 + 72));
    }
    if (a2) {
      v20 = @"unactionableUiElement";
    }
    else {
      v20 = @"unactionable_ui_element";
    }
    [v4 setObject:v15 forKey:v20];
  }
  v21 = [(id)a1 placecardCategory];
  if (v21)
  {
    if (a2) {
      v22 = @"placecardCategory";
    }
    else {
      v22 = @"placecard_category";
    }
    [v4 setObject:v21 forKey:v22];
  }

  __int16 v23 = *(_WORD *)(a1 + 148);
  if (v23)
  {
    uint64_t v24 = *(int *)(a1 + 140);
    if v24 < 0x12 && ((0x2FFFFu >> v24))
    {
      v25 = off_1E53F82C0[v24];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2) {
      v26 = @"placecardType";
    }
    else {
      v26 = @"placecard_type";
    }
    [v4 setObject:v25 forKey:v26];

    __int16 v23 = *(_WORD *)(a1 + 148);
  }
  if ((v23 & 0x10) != 0)
  {
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 147)];
    if (a2) {
      v28 = @"transitAdvisoryBanner";
    }
    else {
      v28 = @"transit_advisory_banner";
    }
    [v4 setObject:v27 forKey:v28];
  }
  if (*(void *)(a1 + 24))
  {
    v29 = PBRepeatedUInt64NSArray();
    if (a2) {
      v30 = @"containedChildrenPois";
    }
    else {
      v30 = @"contained_children_pois";
    }
    [v4 setObject:v29 forKey:v30];
  }
  v31 = v4;
  if ([*(id *)(a1 + 96) count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v33 = *(id *)(a1 + 96);
    uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v64 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if (a2) {
            [v38 jsonRepresentation];
          }
          else {
          v39 = [v38 dictionaryRepresentation];
          }
          [v32 addObject:v39];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v35);
    }

    [v31 setObject:v32 forKey:@"modules"];
  }
  if ([*(id *)(a1 + 120) count])
  {
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v41 = *(id *)(a1 + 120);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v60 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          if (a2) {
            [v46 jsonRepresentation];
          }
          else {
          v47 = [v46 dictionaryRepresentation];
          }
          [v40 addObject:v47];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v43);
    }

    if (a2) {
      v48 = @"revealedModules";
    }
    else {
      v48 = @"revealed_modules";
    }
    [v31 setObject:v40 forKey:v48];
  }
  if (*(void *)(a1 + 88))
  {
    v49 = [(id)a1 commingledRichProviderIds];
    if (a2) {
      v50 = @"commingledRichProviderIds";
    }
    else {
      v50 = @"commingled_rich_provider_ids";
    }
    [v31 setObject:v49 forKey:v50];
  }
  __int16 v51 = *(_WORD *)(a1 + 148);
  if ((v51 & 8) == 0)
  {
    if ((v51 & 2) == 0) {
      goto LABEL_1412;
    }
LABEL_1418:
    v54 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
    if (a2) {
      v55 = @"isPersonAddressAvailable";
    }
    else {
      v55 = @"is_person_address_available";
    }
    [v31 setObject:v54 forKey:v55];

    if ((*(_WORD *)(a1 + 148) & 4) == 0) {
      goto LABEL_1426;
    }
    goto LABEL_1422;
  }
  v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 146)];
  if (a2) {
    v53 = @"isPersonPlacecard";
  }
  else {
    v53 = @"is_person_placecard";
  }
  [v31 setObject:v52 forKey:v53];

  __int16 v51 = *(_WORD *)(a1 + 148);
  if ((v51 & 2) != 0) {
    goto LABEL_1418;
  }
LABEL_1412:
  if ((v51 & 4) != 0)
  {
LABEL_1422:
    v56 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 145)];
    if (a2) {
      v57 = @"isPersonLocationShared";
    }
    else {
      v57 = @"is_person_location_shared";
    }
    [v31 setObject:v56 forKey:v57];
  }
LABEL_1426:

  return v31;
}

- (GEOLogMsgStatePlaceCard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStatePlaceCard;
  v2 = [(GEOLogMsgStatePlaceCard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStatePlaceCard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStatePlaceCard;
  v3 = [(GEOLogMsgStatePlaceCard *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgStatePlaceCard;
  [(GEOLogMsgStatePlaceCard *)&v3 dealloc];
}

- (void)_readPlaceActionDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceActionDetails_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasPlaceActionDetails
{
  return self->_placeActionDetails != 0;
}

- (GEOPlaceActionDetails)placeActionDetails
{
  -[GEOLogMsgStatePlaceCard _readPlaceActionDetails]((uint64_t)self);
  placeActionDetails = self->_placeActionDetails;

  return placeActionDetails;
}

- (void)setPlaceActionDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_placeActionDetails, a3);
}

- (void)_readPossibleActions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPossibleActions_tags_8844);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)possibleActionsCount
{
  return self->_possibleActions.count;
}

- (int)possibleActions
{
  return self->_possibleActions.list;
}

- (void)clearPossibleActions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedInt32Clear();
}

- (void)addPossibleAction:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (int)possibleActionAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readPossibleActions]((uint64_t)self);
  p_possibleActions = &self->_possibleActions;
  unint64_t count = self->_possibleActions.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_possibleActions->list[a3];
}

- (void)setPossibleActions:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147390](&self->_possibleActions, a3, a4);
}

- (id)possibleActionsAsString:(int)a3
{
  if (a3 > 4000)
  {
    if (a3 <= 10100)
    {
      if (a3 > 7000)
      {
        switch(a3)
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
            goto LABEL_84;
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
            switch(a3)
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
                switch(a3)
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
                    goto LABEL_84;
                }
                break;
            }
            break;
        }
      }
      else
      {
        switch(a3)
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
            goto LABEL_84;
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
            switch(a3)
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
                goto LABEL_84;
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
                switch(a3)
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
                    goto LABEL_84;
                }
                break;
            }
            break;
        }
      }
    }
    else if (a3 > 13000)
    {
      if (a3 <= 16000)
      {
        if (a3 <= 15000)
        {
          switch(a3)
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
              switch(a3)
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
                  goto LABEL_84;
              }
              break;
          }
        }
        else
        {
          switch(a3)
          {
            case 15001:
              v4 = @"ORB_PEEK";
              break;
            case 15002:
              v4 = @"ORB_POP";
              break;
            case 15003:
              v4 = @"ORB_DISMISS";
              break;
            default:
LABEL_84:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
              v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_85:
              break;
          }
        }
      }
      else
      {
        switch(a3)
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
            if (a3 == 16001)
            {
              v4 = @"SEARCH_IN_MAPS";
            }
            else
            {
              if (a3 != 90010) {
                goto LABEL_84;
              }
              v4 = @"PAN_RIGHT";
            }
            break;
        }
      }
    }
    else
    {
      switch(a3)
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
          switch(a3)
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
              switch(a3)
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
                  goto LABEL_84;
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
    switch(a3)
    {
      case 0:
        goto LABEL_85;
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
        goto LABEL_84;
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
        switch(a3)
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
            goto LABEL_84;
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
            switch(a3)
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
                goto LABEL_84;
            }
            break;
        }
        break;
    }
  }
  return v4;
}

- (void)_readUnactionableUiElements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnactionableUiElements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)unactionableUiElementsCount
{
  return self->_unactionableUiElements.count;
}

- (int)unactionableUiElements
{
  return self->_unactionableUiElements.list;
}

- (void)clearUnactionableUiElements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedInt32Clear();
}

- (void)addUnactionableUiElement:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (int)unactionableUiElementAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readUnactionableUiElements]((uint64_t)self);
  p_unactionableUiElements = &self->_unactionableUiElements;
  unint64_t count = self->_unactionableUiElements.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_unactionableUiElements->list[a3];
}

- (void)setUnactionableUiElements:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147390](&self->_unactionableUiElements, a3, a4);
}

- (id)unactionableUiElementsAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8280[a3];
  }

  return v3;
}

- (int)StringAsUnactionableUiElements:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_UI_ELEMENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ETA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLOSED_NOW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"APPLE_PAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOURS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"USEFUL_TO_KNOW"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REVIEW_RATING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ADVISORY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPlacecardCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlacecardCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasPlacecardCategory
{
  return self->_placecardCategory != 0;
}

- (NSString)placecardCategory
{
  -[GEOLogMsgStatePlaceCard _readPlacecardCategory]((uint64_t)self);
  placecardCategory = self->_placecardCategory;

  return placecardCategory;
}

- (void)setPlacecardCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_placecardCategory, a3);
}

- (int)placecardType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_placecardType;
  }
  else {
    return 0;
  }
}

- (void)setPlacecardType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_placecardType = a3;
}

- (void)setHasPlacecardType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasPlacecardType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)placecardTypeAsString:(int)a3
{
  if a3 < 0x12 && ((0x2FFFFu >> a3))
  {
    id v3 = off_1E53F82C0[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsPlacecardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLACECARD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADDRESS_PLACECARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUSINESS_PLACECARD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DROPPED_PIN_PLACECARD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CALENDAR_PLACECARD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CURRENT_LOCATION_PLACECARD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_PLACECARD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STATION_PLACECARD"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LANDMARK_PLACECARD"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FLYOVER_PLACECARD"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAR_PLACECARD"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BRAND_PLACECARD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VENUE_PLACECARD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VENUE_BUILDING_PLACECARD"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_PLACECARD"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PLACECARD"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)transitAdvisoryBanner
{
  return self->_transitAdvisoryBanner;
}

- (void)setTransitAdvisoryBanner:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_transitAdvisoryBanner = a3;
}

- (void)setHasTransitAdvisoryBanner:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTransitAdvisoryBanner
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readContainedChildrenPois
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainedChildrenPois_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)containedChildrenPoisCount
{
  return self->_containedChildrenPois.count;
}

- (unint64_t)containedChildrenPois
{
  return self->_containedChildrenPois.list;
}

- (void)clearContainedChildrenPois
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt64Clear();
}

- (void)addContainedChildrenPois:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)containedChildrenPoisAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readContainedChildrenPois]((uint64_t)self);
  p_containedChildrenPois = &self->_containedChildrenPois;
  unint64_t count = self->_containedChildrenPois.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_containedChildrenPois->list[a3];
}

- (void)setContainedChildrenPois:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147438](&self->_containedChildrenPois, a3, a4);
}

- (void)_readModules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModules_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)modules
{
  -[GEOLogMsgStatePlaceCard _readModules]((uint64_t)self);
  modules = self->_modules;

  return modules;
}

- (void)setModules:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  modules = self->_modules;
  self->_modules = v4;
}

- (void)clearModules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  modules = self->_modules;

  [(NSMutableArray *)modules removeAllObjects];
}

- (void)addModules:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStatePlaceCard _readModules]((uint64_t)self);
  -[GEOLogMsgStatePlaceCard _addNoFlagsModules:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsModules:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)modulesCount
{
  -[GEOLogMsgStatePlaceCard _readModules]((uint64_t)self);
  modules = self->_modules;

  return [(NSMutableArray *)modules count];
}

- (id)modulesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readModules]((uint64_t)self);
  modules = self->_modules;

  return (id)[(NSMutableArray *)modules objectAtIndex:a3];
}

+ (Class)modulesType
{
  return (Class)objc_opt_class();
}

- (void)_readRevealedModules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRevealedModules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)revealedModules
{
  -[GEOLogMsgStatePlaceCard _readRevealedModules]((uint64_t)self);
  revealedModules = self->_revealedModules;

  return revealedModules;
}

- (void)setRevealedModules:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  revealedModules = self->_revealedModules;
  self->_revealedModules = v4;
}

- (void)clearRevealedModules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  revealedModules = self->_revealedModules;

  [(NSMutableArray *)revealedModules removeAllObjects];
}

- (void)addRevealedModules:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStatePlaceCard _readRevealedModules]((uint64_t)self);
  -[GEOLogMsgStatePlaceCard _addNoFlagsRevealedModules:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsRevealedModules:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)revealedModulesCount
{
  -[GEOLogMsgStatePlaceCard _readRevealedModules]((uint64_t)self);
  revealedModules = self->_revealedModules;

  return [(NSMutableArray *)revealedModules count];
}

- (id)revealedModulesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readRevealedModules]((uint64_t)self);
  revealedModules = self->_revealedModules;

  return (id)[(NSMutableArray *)revealedModules objectAtIndex:a3];
}

+ (Class)revealedModulesType
{
  return (Class)objc_opt_class();
}

- (void)_readCommingledRichProviderIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 148) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommingledRichProviderIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)commingledRichProviderIds
{
  -[GEOLogMsgStatePlaceCard _readCommingledRichProviderIds]((uint64_t)self);
  commingledRichProviderIds = self->_commingledRichProviderIds;

  return commingledRichProviderIds;
}

- (void)setCommingledRichProviderIds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  commingledRichProviderIds = self->_commingledRichProviderIds;
  self->_commingledRichProviderIds = v4;
}

- (void)clearCommingledRichProviderIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  commingledRichProviderIds = self->_commingledRichProviderIds;

  [(NSMutableArray *)commingledRichProviderIds removeAllObjects];
}

- (void)addCommingledRichProviderIds:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStatePlaceCard _readCommingledRichProviderIds]((uint64_t)self);
  -[GEOLogMsgStatePlaceCard _addNoFlagsCommingledRichProviderIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsCommingledRichProviderIds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)commingledRichProviderIdsCount
{
  -[GEOLogMsgStatePlaceCard _readCommingledRichProviderIds]((uint64_t)self);
  commingledRichProviderIds = self->_commingledRichProviderIds;

  return [(NSMutableArray *)commingledRichProviderIds count];
}

- (id)commingledRichProviderIdsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceCard _readCommingledRichProviderIds]((uint64_t)self);
  commingledRichProviderIds = self->_commingledRichProviderIds;

  return (id)[(NSMutableArray *)commingledRichProviderIds objectAtIndex:a3];
}

+ (Class)commingledRichProviderIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)isPersonPlacecard
{
  return self->_isPersonPlacecard;
}

- (void)setIsPersonPlacecard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_isPersonPlacecard = a3;
}

- (void)setHasIsPersonPlacecard:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasIsPersonPlacecard
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)isPersonAddressAvailable
{
  return self->_isPersonAddressAvailable;
}

- (void)setIsPersonAddressAvailable:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_isPersonAddressAvailable = a3;
}

- (void)setHasIsPersonAddressAvailable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasIsPersonAddressAvailable
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)isPersonLocationShared
{
  return self->_isPersonLocationShared;
}

- (void)setIsPersonLocationShared:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_isPersonLocationShared = a3;
}

- (void)setHasIsPersonLocationShared:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasIsPersonLocationShared
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStatePlaceCard;
  id v4 = [(GEOLogMsgStatePlaceCard *)&v8 description];
  id v5 = [(GEOLogMsgStatePlaceCard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePlaceCard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStatePlaceCard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePlaceCard)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePlaceCard *)-[GEOLogMsgStatePlaceCard _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgStatePlaceCard)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePlaceCard *)-[GEOLogMsgStatePlaceCard _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8911;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8912;
    }
    GEOLogMsgStatePlaceCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStatePlaceCardCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePlaceCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePlaceCardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStatePlaceCardIsDirty((uint64_t)self) & 1) == 0)
  {
    __int16 v23 = self->_reader;
    objc_sync_enter(v23);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v24 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v24];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStatePlaceCard *)self readAll:0];
    if (self->_placeActionDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_possibleActions.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_possibleActions.count);
    }
    if (self->_unactionableUiElements.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_unactionableUiElements.count);
    }
    if (self->_placecardCategory) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_containedChildrenPois.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v9;
      }
      while (v9 < self->_containedChildrenPois.count);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v10 = self->_modules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v34;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v11);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = self->_revealedModules;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v30;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v15);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v18 = self->_commingledRichProviderIds;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteStringField();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v19);
    }

    __int16 v22 = (__int16)self->_flags;
    if ((v22 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v22 = (__int16)self->_flags;
    }
    if ((v22 & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v22 = (__int16)self->_flags;
    }
    if ((v22 & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)copyTo:(id)a3
{
  long long v27 = (id *)a3;
  [(GEOLogMsgStatePlaceCard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v27 + 1, self->_reader);
  *((_DWORD *)v27 + 32) = self->_readerMarkPos;
  *((_DWORD *)v27 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeActionDetails) {
    objc_msgSend(v27, "setPlaceActionDetails:");
  }
  if ([(GEOLogMsgStatePlaceCard *)self possibleActionsCount])
  {
    [v27 clearPossibleActions];
    unint64_t v4 = [(GEOLogMsgStatePlaceCard *)self possibleActionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v27, "addPossibleAction:", -[GEOLogMsgStatePlaceCard possibleActionAtIndex:](self, "possibleActionAtIndex:", i));
    }
  }
  if ([(GEOLogMsgStatePlaceCard *)self unactionableUiElementsCount])
  {
    [v27 clearUnactionableUiElements];
    unint64_t v7 = [(GEOLogMsgStatePlaceCard *)self unactionableUiElementsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v27, "addUnactionableUiElement:", -[GEOLogMsgStatePlaceCard unactionableUiElementAtIndex:](self, "unactionableUiElementAtIndex:", j));
    }
  }
  if (self->_placecardCategory) {
    objc_msgSend(v27, "setPlacecardCategory:");
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v27 + 35) = self->_placecardType;
    *((_WORD *)v27 + 74) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x10) != 0)
  {
    *((unsigned char *)v27 + 147) = self->_transitAdvisoryBanner;
    *((_WORD *)v27 + 74) |= 0x10u;
  }
  if ([(GEOLogMsgStatePlaceCard *)self containedChildrenPoisCount])
  {
    [v27 clearContainedChildrenPois];
    unint64_t v11 = [(GEOLogMsgStatePlaceCard *)self containedChildrenPoisCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v27, "addContainedChildrenPois:", -[GEOLogMsgStatePlaceCard containedChildrenPoisAtIndex:](self, "containedChildrenPoisAtIndex:", k));
    }
  }
  if ([(GEOLogMsgStatePlaceCard *)self modulesCount])
  {
    [v27 clearModules];
    unint64_t v14 = [(GEOLogMsgStatePlaceCard *)self modulesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
      {
        uint64_t v17 = [(GEOLogMsgStatePlaceCard *)self modulesAtIndex:m];
        [v27 addModules:v17];
      }
    }
  }
  if ([(GEOLogMsgStatePlaceCard *)self revealedModulesCount])
  {
    [v27 clearRevealedModules];
    unint64_t v18 = [(GEOLogMsgStatePlaceCard *)self revealedModulesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
      {
        uint64_t v21 = [(GEOLogMsgStatePlaceCard *)self revealedModulesAtIndex:n];
        [v27 addRevealedModules:v21];
      }
    }
  }
  if ([(GEOLogMsgStatePlaceCard *)self commingledRichProviderIdsCount])
  {
    [v27 clearCommingledRichProviderIds];
    unint64_t v22 = [(GEOLogMsgStatePlaceCard *)self commingledRichProviderIdsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
      {
        long long v25 = [(GEOLogMsgStatePlaceCard *)self commingledRichProviderIdsAtIndex:ii];
        [v27 addCommingledRichProviderIds:v25];
      }
    }
  }
  __int16 v26 = (__int16)self->_flags;
  if ((v26 & 8) != 0)
  {
    *((unsigned char *)v27 + 146) = self->_isPersonPlacecard;
    *((_WORD *)v27 + 74) |= 8u;
    __int16 v26 = (__int16)self->_flags;
    if ((v26 & 2) == 0)
    {
LABEL_35:
      if ((v26 & 4) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v26 & 2) == 0)
  {
    goto LABEL_35;
  }
  *((unsigned char *)v27 + 144) = self->_isPersonAddressAvailable;
  *((_WORD *)v27 + 74) |= 2u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_36:
    *((unsigned char *)v27 + 145) = self->_isPersonLocationShared;
    *((_WORD *)v27 + 74) |= 4u;
  }
LABEL_37:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStatePlaceCard *)self readAll:0];
    id v9 = [(GEOPlaceActionDetails *)self->_placeActionDetails copyWithZone:a3];
    v10 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v9;

    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    uint64_t v11 = [(NSString *)self->_placecardCategory copyWithZone:a3];
    unint64_t v12 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v11;

    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      *(_DWORD *)(v5 + 140) = self->_placecardType;
      *(_WORD *)(v5 + 148) |= 1u;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      *(unsigned char *)(v5 + 147) = self->_transitAdvisoryBanner;
      *(_WORD *)(v5 + 148) |= 0x10u;
    }
    PBRepeatedUInt64Copy();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    unint64_t v14 = self->_modules;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          unint64_t v18 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addModules:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v15);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v19 = self->_revealedModules;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v19);
          }
          unint64_t v23 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * j) copyWithZone:a3];
          [(id)v5 addRevealedModules:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v20);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v24 = self->_commingledRichProviderIds;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v24);
          }
          long long v28 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "copyWithZone:", a3, (void)v31);
          [(id)v5 addCommingledRichProviderIds:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v25);
    }

    __int16 v29 = (__int16)self->_flags;
    if ((v29 & 8) != 0)
    {
      *(unsigned char *)(v5 + 146) = self->_isPersonPlacecard;
      *(_WORD *)(v5 + 148) |= 8u;
      __int16 v29 = (__int16)self->_flags;
      if ((v29 & 2) == 0)
      {
LABEL_32:
        if ((v29 & 4) == 0) {
          return (id)v5;
        }
LABEL_33:
        *(unsigned char *)(v5 + 145) = self->_isPersonLocationShared;
        *(_WORD *)(v5 + 148) |= 4u;
        return (id)v5;
      }
    }
    else if ((v29 & 2) == 0)
    {
      goto LABEL_32;
    }
    *(unsigned char *)(v5 + 144) = self->_isPersonAddressAvailable;
    *(_WORD *)(v5 + 148) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_33;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStatePlaceCardReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  [(GEOLogMsgStatePlaceCard *)self readAll:1];
  [v4 readAll:1];
  placeActionDetails = self->_placeActionDetails;
  if ((unint64_t)placeActionDetails | *((void *)v4 + 13))
  {
    if (!-[GEOPlaceActionDetails isEqual:](placeActionDetails, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_46;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_46;
  }
  placecardCategory = self->_placecardCategory;
  if ((unint64_t)placecardCategory | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](placecardCategory, "isEqual:")) {
      goto LABEL_46;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 74);
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_placecardType != *((_DWORD *)v4 + 35)) {
      goto LABEL_46;
    }
  }
  else if (v8)
  {
    goto LABEL_46;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_46;
    }
    if (self->_transitAdvisoryBanner)
    {
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 147))
    {
      goto LABEL_46;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_46;
  }
  modules = self->_modules;
  if ((unint64_t)modules | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](modules, "isEqual:")) {
      goto LABEL_46;
    }
  }
  revealedModules = self->_revealedModules;
  if ((unint64_t)revealedModules | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](revealedModules, "isEqual:")) {
      goto LABEL_46;
    }
  }
  commingledRichProviderIds = self->_commingledRichProviderIds;
  if ((unint64_t)commingledRichProviderIds | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](commingledRichProviderIds, "isEqual:")) {
      goto LABEL_46;
    }
  }
  __int16 v12 = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 74);
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) == 0) {
      goto LABEL_46;
    }
    if (self->_isPersonPlacecard)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_46;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0) {
      goto LABEL_46;
    }
    if (self->_isPersonAddressAvailable)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_46;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_46;
  }
  BOOL v14 = (v13 & 4) == 0;
  if ((v12 & 4) != 0)
  {
    if ((v13 & 4) != 0)
    {
      if (self->_isPersonLocationShared)
      {
        if (!*((unsigned char *)v4 + 145)) {
          goto LABEL_46;
        }
      }
      else if (*((unsigned char *)v4 + 145))
      {
        goto LABEL_46;
      }
      BOOL v14 = 1;
      goto LABEL_47;
    }
LABEL_46:
    BOOL v14 = 0;
  }
LABEL_47:

  return v14;
}

- (unint64_t)hash
{
  [(GEOLogMsgStatePlaceCard *)self readAll:1];
  unint64_t v18 = [(GEOPlaceActionDetails *)self->_placeActionDetails hash];
  uint64_t v17 = PBRepeatedInt32Hash();
  uint64_t v3 = PBRepeatedInt32Hash();
  NSUInteger v4 = [(NSString *)self->_placecardCategory hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v6 = 2654435761 * self->_placecardType;
    if ((flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_transitAdvisoryBanner;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v8 = PBRepeatedUInt64Hash();
  uint64_t v9 = [(NSMutableArray *)self->_modules hash];
  uint64_t v10 = [(NSMutableArray *)self->_revealedModules hash];
  uint64_t v11 = [(NSMutableArray *)self->_commingledRichProviderIds hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 8) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v14 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v15 = 0;
    return v17 ^ v18 ^ v3 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v13 = 2654435761 * self->_isPersonPlacecard;
  if ((v12 & 2) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v14 = 2654435761 * self->_isPersonAddressAvailable;
  if ((v12 & 4) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v15 = 2654435761 * self->_isPersonLocationShared;
  return v17 ^ v18 ^ v3 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  placeActionDetails = self->_placeActionDetails;
  uint64_t v6 = *((void *)v4 + 13);
  if (placeActionDetails)
  {
    if (v6) {
      -[GEOPlaceActionDetails mergeFrom:](placeActionDetails, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOLogMsgStatePlaceCard setPlaceActionDetails:](self, "setPlaceActionDetails:");
  }
  uint64_t v7 = [v4 possibleActionsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOLogMsgStatePlaceCard addPossibleAction:](self, "addPossibleAction:", [v4 possibleActionAtIndex:i]);
  }
  uint64_t v10 = [v4 unactionableUiElementsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOLogMsgStatePlaceCard addUnactionableUiElement:](self, "addUnactionableUiElement:", [v4 unactionableUiElementAtIndex:j]);
  }
  if (*((void *)v4 + 14)) {
    -[GEOLogMsgStatePlaceCard setPlacecardCategory:](self, "setPlacecardCategory:");
  }
  __int16 v13 = *((_WORD *)v4 + 74);
  if (v13)
  {
    self->_placecardType = *((_DWORD *)v4 + 35);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v13 = *((_WORD *)v4 + 74);
  }
  if ((v13 & 0x10) != 0)
  {
    self->_transitAdvisoryBanner = *((unsigned char *)v4 + 147);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  uint64_t v14 = [v4 containedChildrenPoisCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
      -[GEOLogMsgStatePlaceCard addContainedChildrenPois:](self, "addContainedChildrenPois:", [v4 containedChildrenPoisAtIndex:k]);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = *((id *)v4 + 12);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v19; ++m)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        [(GEOLogMsgStatePlaceCard *)self addModules:*(void *)(*((void *)&v41 + 1) + 8 * m)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v19);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = *((id *)v4 + 15);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t n = 0; n != v24; ++n)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        [(GEOLogMsgStatePlaceCard *)self addRevealedModules:*(void *)(*((void *)&v37 + 1) + 8 * n)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v24);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v27 = *((id *)v4 + 11);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (iuint64_t i = 0; ii != v29; ++ii)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        -[GEOLogMsgStatePlaceCard addCommingledRichProviderIds:](self, "addCommingledRichProviderIds:", *(void *)(*((void *)&v33 + 1) + 8 * ii), (void)v33);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v29);
  }

  __int16 v32 = *((_WORD *)v4 + 74);
  if ((v32 & 8) == 0)
  {
    if ((v32 & 2) == 0) {
      goto LABEL_44;
    }
LABEL_48:
    self->_isPersonAddressAvailable = *((unsigned char *)v4 + 144);
    *(_WORD *)&self->_flags |= 2u;
    if ((*((_WORD *)v4 + 74) & 4) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  self->_isPersonPlacecard = *((unsigned char *)v4 + 146);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v32 = *((_WORD *)v4 + 74);
  if ((v32 & 2) != 0) {
    goto LABEL_48;
  }
LABEL_44:
  if ((v32 & 4) != 0)
  {
LABEL_45:
    self->_isPersonLocationShared = *((unsigned char *)v4 + 145);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_46:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revealedModules, 0);
  objc_storeStrong((id *)&self->_placecardCategory, 0);
  objc_storeStrong((id *)&self->_placeActionDetails, 0);
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_commingledRichProviderIds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end