@interface GEOAPSequenceState
- (id)initWithAdmissionUserAction:(int)a3 target:;
- (uint64_t)processUserAction:(uint64_t)a3 target:(double)a4 atTime:;
- (void)addAbortingUserAction:(int)a3 target:;
- (void)addAdmissionUserAction:(int)a3 target:;
- (void)reset;
- (void)setName:(uint64_t)a1;
@end

@implementation GEOAPSequenceState

- (void)reset
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = GEOGetGEOAPSequenceStateAnalyticsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_24FE56000, v2, OS_LOG_TYPE_DEBUG, "reset state '%@'", (uint8_t *)&v4, 0xCu);
    }

    *(unsigned char *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

- (void)setName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)initWithAdmissionUserAction:(int)a3 target:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)GEOAPSequenceState;
  id v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    v7 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v6;

    v8 = [NSNumber numberWithUnsignedLongLong:a3 | (unint64_t)(a2 << 32)];
    [*((id *)v5 + 6) addObject:v8];
    *((unsigned char *)v5 + 8) = 0;
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 3) = 0;
    *((_DWORD *)v5 + 8) = 0;
  }
  return v5;
}

- (void)addAbortingUserAction:(int)a3 target:
{
  if (a1)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
      v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;
    }
    id v8 = [NSNumber numberWithUnsignedLongLong:a3 | (unint64_t)(a2 << 32)];
    [*(id *)(a1 + 56) addObject:v8];
  }
}

- (void)addAdmissionUserAction:(int)a3 target:
{
  if (a1)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:a3 | (unint64_t)(a2 << 32)];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

- (uint64_t)processUserAction:(uint64_t)a3 target:(double)a4 atTime:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  id v8 = GEOGetGEOAPSequenceStateAnalyticsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if ((int)a2 > 4000)
    {
      if ((int)a2 <= 10100)
      {
        if ((int)a2 > 7000)
        {
          switch((int)a2)
          {
            case 9001:
              objc_super v10 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              objc_super v10 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              objc_super v10 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              objc_super v10 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              objc_super v10 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              objc_super v10 = @"OPEN_SEARCH";
              break;
            case 9007:
              objc_super v10 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              objc_super v10 = @"PAN_LEFT";
              break;
            case 9009:
              objc_super v10 = @"PAN_UP";
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
              goto LABEL_48;
            case 9011:
              objc_super v10 = @"PAN_DOWN";
              break;
            case 9012:
              objc_super v10 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              objc_super v10 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              objc_super v10 = @"OPEN_FAVORITES";
              break;
            case 9015:
              objc_super v10 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              objc_super v10 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              objc_super v10 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              objc_super v10 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              objc_super v10 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              objc_super v10 = @"SHARE_DESTINATION";
              break;
            case 9021:
              objc_super v10 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              objc_super v10 = @"SHARE_ETA";
              break;
            case 9023:
              objc_super v10 = @"SELECT_GROUP";
              break;
            case 9024:
              objc_super v10 = @"DESELECT_GROUP";
              break;
            case 9025:
              objc_super v10 = @"SELECT_CONTACT";
              break;
            case 9026:
              objc_super v10 = @"DESELECT_CONTACT";
              break;
            case 9027:
              objc_super v10 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              objc_super v10 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              objc_super v10 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              objc_super v10 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              objc_super v10 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              objc_super v10 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              objc_super v10 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              objc_super v10 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              objc_super v10 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              objc_super v10 = @"SCROLL_FORWARD";
              break;
            case 9037:
              objc_super v10 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              objc_super v10 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              objc_super v10 = @"TAP_LESS";
              break;
            case 9040:
              objc_super v10 = @"TAP_MORE";
              break;
            case 9101:
              objc_super v10 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              objc_super v10 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              objc_super v10 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              objc_super v10 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              objc_super v10 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              objc_super v10 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)a2)
              {
                case 7001:
                  objc_super v10 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  objc_super v10 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  objc_super v10 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  objc_super v10 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  objc_super v10 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  objc_super v10 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  objc_super v10 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  objc_super v10 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  objc_super v10 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  objc_super v10 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  objc_super v10 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  objc_super v10 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  objc_super v10 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  objc_super v10 = @"GET_TICKETS";
                  break;
                case 7015:
                  objc_super v10 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  objc_super v10 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  objc_super v10 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  objc_super v10 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  objc_super v10 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  objc_super v10 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  objc_super v10 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  objc_super v10 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  objc_super v10 = @"VIEW_BANNER";
                  break;
                case 7024:
                  objc_super v10 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  objc_super v10 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  objc_super v10 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  objc_super v10 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  objc_super v10 = @"WAITLIST";
                  break;
                case 7029:
                  objc_super v10 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  objc_super v10 = @"RESERVE";
                  break;
                default:
                  switch((int)a2)
                  {
                    case 8001:
                      objc_super v10 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      objc_super v10 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      objc_super v10 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      objc_super v10 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      objc_super v10 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      objc_super v10 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      objc_super v10 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      objc_super v10 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      objc_super v10 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      objc_super v10 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      objc_super v10 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_48;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)a2)
          {
            case 6003:
              objc_super v10 = @"GET_DIRECTIONS";
              break;
            case 6004:
              objc_super v10 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              objc_super v10 = @"REMOVE_PIN";
              break;
            case 6006:
              objc_super v10 = @"TAP_PHOTO";
              break;
            case 6007:
              objc_super v10 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              objc_super v10 = @"TAP_ADDRESS";
              break;
            case 6009:
              objc_super v10 = @"CALL";
              break;
            case 6010:
              objc_super v10 = @"TAP_URL";
              break;
            case 6011:
              objc_super v10 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              objc_super v10 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              objc_super v10 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_48;
            case 6015:
              objc_super v10 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              objc_super v10 = @"ADD_CONTACT";
              break;
            case 6018:
              objc_super v10 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              objc_super v10 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              objc_super v10 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              objc_super v10 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              objc_super v10 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              objc_super v10 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              objc_super v10 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              objc_super v10 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              objc_super v10 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              objc_super v10 = @"EDIT_LOCATION";
              break;
            case 6029:
              objc_super v10 = @"ADD_PHOTO";
              break;
            case 6031:
              objc_super v10 = @"RETAKE";
              break;
            case 6032:
              objc_super v10 = @"ADD_NOTE";
              break;
            case 6033:
              objc_super v10 = @"REMOVE_CAR";
              break;
            case 6034:
              objc_super v10 = @"EDIT_NAME";
              break;
            case 6036:
              objc_super v10 = @"RESERVE_TABLE";
              break;
            case 6037:
              objc_super v10 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              objc_super v10 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              objc_super v10 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              objc_super v10 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              objc_super v10 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              objc_super v10 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              objc_super v10 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              objc_super v10 = @"VIEW_CONTACT";
              break;
            case 6045:
              objc_super v10 = @"CHAT";
              break;
            case 6046:
              objc_super v10 = @"FIND_STORES";
              break;
            case 6047:
              objc_super v10 = @"TAP_PARENT";
              break;
            case 6048:
              objc_super v10 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              objc_super v10 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              objc_super v10 = @"PUNCH_OUT";
              break;
            case 6051:
              objc_super v10 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              objc_super v10 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              objc_super v10 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              objc_super v10 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              objc_super v10 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              objc_super v10 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              objc_super v10 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              objc_super v10 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              objc_super v10 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              objc_super v10 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              objc_super v10 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              objc_super v10 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              objc_super v10 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              objc_super v10 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              objc_super v10 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              objc_super v10 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              objc_super v10 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              objc_super v10 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              objc_super v10 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              objc_super v10 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              objc_super v10 = @"TAP_LANDMARK";
              break;
            case 6072:
              objc_super v10 = @"TAP_SCENE";
              break;
            case 6073:
              objc_super v10 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              objc_super v10 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              objc_super v10 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              objc_super v10 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              objc_super v10 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              objc_super v10 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              objc_super v10 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              objc_super v10 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              objc_super v10 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              objc_super v10 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              objc_super v10 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              objc_super v10 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              objc_super v10 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              objc_super v10 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              objc_super v10 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              objc_super v10 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              objc_super v10 = @"TAP_VIEW_APP";
              break;
            case 6090:
              objc_super v10 = @"TAP_APP_CLIP";
              break;
            case 6091:
              objc_super v10 = @"DEAD_BATTERY";
              break;
            case 6092:
              objc_super v10 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              objc_super v10 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              objc_super v10 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              objc_super v10 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              objc_super v10 = @"PAUSE_ROUTE";
              break;
            case 6097:
              objc_super v10 = @"TAP_ADD_STOP";
              break;
            case 6098:
              objc_super v10 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              objc_super v10 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              objc_super v10 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              objc_super v10 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              objc_super v10 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              objc_super v10 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              objc_super v10 = @"SHOW_INCIDENT";
              break;
            case 6105:
              objc_super v10 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              objc_super v10 = @"ORDER_DELIVERY";
              break;
            case 6107:
              objc_super v10 = @"VIEW_MENU";
              break;
            case 6108:
              objc_super v10 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              objc_super v10 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              objc_super v10 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              objc_super v10 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)a2)
              {
                case 5001:
                  objc_super v10 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  objc_super v10 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  objc_super v10 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  objc_super v10 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  objc_super v10 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  objc_super v10 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  objc_super v10 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  objc_super v10 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  objc_super v10 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  objc_super v10 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  objc_super v10 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  objc_super v10 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  objc_super v10 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  objc_super v10 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_48;
                case 5016:
                  objc_super v10 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  objc_super v10 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  objc_super v10 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  objc_super v10 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  objc_super v10 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  objc_super v10 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  objc_super v10 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  objc_super v10 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  objc_super v10 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  objc_super v10 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  objc_super v10 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  objc_super v10 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  objc_super v10 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  objc_super v10 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  objc_super v10 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  objc_super v10 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  objc_super v10 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  objc_super v10 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  objc_super v10 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  objc_super v10 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  objc_super v10 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  objc_super v10 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  objc_super v10 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  objc_super v10 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)a2)
                  {
                    case 4001:
                      objc_super v10 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      objc_super v10 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      objc_super v10 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      objc_super v10 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      objc_super v10 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      objc_super v10 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_48;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)a2 > 13000)
      {
        if ((int)a2 <= 16000)
        {
          if ((int)a2 <= 15000)
          {
            switch((int)a2)
            {
              case 14001:
                objc_super v10 = @"VIEW_APP";
                break;
              case 14002:
                objc_super v10 = @"ENABLE";
                break;
              case 14003:
                objc_super v10 = @"BOOK_RIDE";
                break;
              case 14004:
                objc_super v10 = @"REQUEST_RIDE";
                break;
              case 14005:
                objc_super v10 = @"CONTACT_DRIVER";
                break;
              case 14006:
                objc_super v10 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                objc_super v10 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                objc_super v10 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                objc_super v10 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)a2)
                {
                  case 13001:
                    objc_super v10 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    objc_super v10 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    objc_super v10 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    objc_super v10 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    objc_super v10 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    objc_super v10 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    objc_super v10 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_48;
                }
                break;
            }
          }
          else
          {
            switch(a2)
            {
              case 0x3A99:
                objc_super v10 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                objc_super v10 = @"ORB_POP";
                break;
              case 0x3A9B:
                objc_super v10 = @"ORB_DISMISS";
                break;
              default:
LABEL_48:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
                objc_super v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)a2)
          {
            case 17001:
              objc_super v10 = @"START_DRAG";
              break;
            case 17002:
              objc_super v10 = @"CANCEL_DRAG";
              break;
            case 17003:
              objc_super v10 = @"COMPLETE_DRAG";
              break;
            case 17004:
              objc_super v10 = @"START_DROP";
              break;
            case 17005:
              objc_super v10 = @"CANCEL_DROP";
              break;
            case 17006:
              objc_super v10 = @"COMPLETE_DROP";
              break;
            case 17007:
              objc_super v10 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              objc_super v10 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              objc_super v10 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              objc_super v10 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              objc_super v10 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              objc_super v10 = @"CALLOUT_INFO";
              break;
            case 17013:
              objc_super v10 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              objc_super v10 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              objc_super v10 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              objc_super v10 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              objc_super v10 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              objc_super v10 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              objc_super v10 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              objc_super v10 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              objc_super v10 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              objc_super v10 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              objc_super v10 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              objc_super v10 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              objc_super v10 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              objc_super v10 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              objc_super v10 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              objc_super v10 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              objc_super v10 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              objc_super v10 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              objc_super v10 = @"INFO_CONTACTS";
              break;
            case 17032:
              objc_super v10 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              objc_super v10 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              objc_super v10 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              objc_super v10 = @"INFO_DISMISS";
              break;
            case 17036:
              objc_super v10 = @"INFO_INFO";
              break;
            case 17037:
              objc_super v10 = @"INFO_PHOTOS";
              break;
            case 17038:
              objc_super v10 = @"INFO_REVIEWS";
              break;
            case 17039:
              objc_super v10 = @"INFO_SHARE";
              break;
            case 17040:
              objc_super v10 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              objc_super v10 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              objc_super v10 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              objc_super v10 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              objc_super v10 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              objc_super v10 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              objc_super v10 = @"INFO_YELP";
              break;
            case 17047:
              objc_super v10 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              objc_super v10 = @"MAP_3D_OFF";
              break;
            case 17049:
              objc_super v10 = @"MAP_3D_ON";
              break;
            case 17050:
              objc_super v10 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              objc_super v10 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              objc_super v10 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              objc_super v10 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              objc_super v10 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              objc_super v10 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              objc_super v10 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              objc_super v10 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              objc_super v10 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              objc_super v10 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              objc_super v10 = @"MAP_TAP_LINE";
              break;
            case 17061:
              objc_super v10 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              objc_super v10 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              objc_super v10 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              objc_super v10 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              objc_super v10 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              objc_super v10 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              objc_super v10 = @"NAV_CLEAR";
              break;
            case 17068:
              objc_super v10 = @"NAV_LIST";
              break;
            case 17069:
              objc_super v10 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              objc_super v10 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              objc_super v10 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              objc_super v10 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              objc_super v10 = @"ORB_MENU_CALL";
              break;
            case 17074:
              objc_super v10 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              objc_super v10 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              objc_super v10 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              objc_super v10 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              objc_super v10 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              objc_super v10 = @"ORB_MENU_URL";
              break;
            case 17080:
              objc_super v10 = @"ORB_PRESS";
              break;
            case 17081:
              objc_super v10 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              objc_super v10 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              objc_super v10 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              objc_super v10 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              objc_super v10 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              objc_super v10 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              objc_super v10 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              objc_super v10 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              objc_super v10 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              objc_super v10 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              objc_super v10 = @"SEARCH_BEGIN";
              break;
            case 17092:
              objc_super v10 = @"SEARCH_CANCEL";
              break;
            case 17093:
              objc_super v10 = @"SEARCH_SELECT";
              break;
            case 17094:
              objc_super v10 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              objc_super v10 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              objc_super v10 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              objc_super v10 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              objc_super v10 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              objc_super v10 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              objc_super v10 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              objc_super v10 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              objc_super v10 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              objc_super v10 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              objc_super v10 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              objc_super v10 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              objc_super v10 = @"CALLOUT_NAV";
              break;
            case 17107:
              objc_super v10 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              objc_super v10 = @"MAP_TAP_POI";
              break;
            default:
              if (a2 == 16001)
              {
                objc_super v10 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (a2 != 90010) {
                  goto LABEL_48;
                }
                objc_super v10 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)a2)
        {
          case 10101:
            objc_super v10 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            objc_super v10 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            objc_super v10 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            objc_super v10 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            objc_super v10 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            objc_super v10 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            objc_super v10 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            objc_super v10 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            objc_super v10 = @"RAP_CANCEL";
            break;
          case 10110:
            objc_super v10 = @"RAP_NEXT";
            break;
          case 10111:
            objc_super v10 = @"RAP_BACK";
            break;
          case 10112:
            objc_super v10 = @"RAP_SEND";
            break;
          case 10113:
            objc_super v10 = @"RAP_SKIP";
            break;
          case 10114:
            objc_super v10 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            objc_super v10 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            objc_super v10 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            objc_super v10 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            objc_super v10 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            objc_super v10 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            objc_super v10 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            objc_super v10 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            objc_super v10 = @"RAP_HOME";
            break;
          case 10123:
            objc_super v10 = @"RAP_WORK";
            break;
          case 10124:
            objc_super v10 = @"RAP_OTHER";
            break;
          case 10125:
            objc_super v10 = @"RAP_LOCATION";
            break;
          case 10126:
            objc_super v10 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            objc_super v10 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            objc_super v10 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            objc_super v10 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            objc_super v10 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            objc_super v10 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            objc_super v10 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            objc_super v10 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            objc_super v10 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            objc_super v10 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            objc_super v10 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            objc_super v10 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            objc_super v10 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            objc_super v10 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            objc_super v10 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            objc_super v10 = @"RAP_PAN_MAP";
            break;
          case 10142:
            objc_super v10 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            objc_super v10 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            objc_super v10 = @"RAP_ADD_POI";
            break;
          case 10145:
            objc_super v10 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            objc_super v10 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            objc_super v10 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            objc_super v10 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            objc_super v10 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            objc_super v10 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            objc_super v10 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            objc_super v10 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            objc_super v10 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            objc_super v10 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            objc_super v10 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            objc_super v10 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            objc_super v10 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            objc_super v10 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            objc_super v10 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            objc_super v10 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            objc_super v10 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            objc_super v10 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            objc_super v10 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            objc_super v10 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            objc_super v10 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            objc_super v10 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            objc_super v10 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            objc_super v10 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            objc_super v10 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            objc_super v10 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            objc_super v10 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            objc_super v10 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            objc_super v10 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            objc_super v10 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            objc_super v10 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            objc_super v10 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            objc_super v10 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            objc_super v10 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            objc_super v10 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            objc_super v10 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            objc_super v10 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            objc_super v10 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            objc_super v10 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            objc_super v10 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            objc_super v10 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            objc_super v10 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            objc_super v10 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            objc_super v10 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            objc_super v10 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            objc_super v10 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            objc_super v10 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)a2)
            {
              case 11001:
                objc_super v10 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                objc_super v10 = @"TASK_READY";
                break;
              case 11003:
                objc_super v10 = @"TAP_SEARCH";
                break;
              case 11004:
                objc_super v10 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                objc_super v10 = @"SHOW_NEARBY";
                break;
              case 11006:
                objc_super v10 = @"TAP_NEARBY";
                break;
              case 11007:
                objc_super v10 = @"TAP_PROACTIVE";
                break;
              case 11008:
                objc_super v10 = @"FORCE_PRESS";
                break;
              case 11009:
                objc_super v10 = @"TAP_CONTACTS";
                break;
              case 11010:
                objc_super v10 = @"TAP_TRANSIT";
                break;
              case 11011:
                objc_super v10 = @"TAP_DICTATION";
                break;
              case 11012:
                objc_super v10 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                objc_super v10 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                objc_super v10 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                objc_super v10 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                objc_super v10 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                objc_super v10 = @"START_NAV_AUTO";
                break;
              case 11018:
                objc_super v10 = @"TAP_RECENT";
                break;
              case 11019:
                objc_super v10 = @"TAP_FAVORITE";
                break;
              case 11020:
                objc_super v10 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                objc_super v10 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                objc_super v10 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                objc_super v10 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                objc_super v10 = @"NAV_UNMUTE";
                break;
              case 11025:
                objc_super v10 = @"NAV_MUTE";
                break;
              case 11026:
                objc_super v10 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                objc_super v10 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                objc_super v10 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                objc_super v10 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)a2)
                {
                  case 12001:
                    objc_super v10 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    objc_super v10 = @"SELECT_TIME";
                    break;
                  case 12003:
                    objc_super v10 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    objc_super v10 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    objc_super v10 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    objc_super v10 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    objc_super v10 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    objc_super v10 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    objc_super v10 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    objc_super v10 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_48;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      objc_super v10 = @"UI_ACTION_UNKNOWN";
      switch((int)a2)
      {
        case 0:
          break;
        case 1:
          objc_super v10 = @"PULL_UP";
          break;
        case 2:
          objc_super v10 = @"PULL_DOWN";
          break;
        case 3:
          objc_super v10 = @"TAP";
          break;
        case 4:
          objc_super v10 = @"CLOSE";
          break;
        case 5:
          objc_super v10 = @"SWIPE_PREV";
          break;
        case 6:
          objc_super v10 = @"SWIPE_NEXT";
          break;
        case 7:
          objc_super v10 = @"SCROLL_UP";
          break;
        case 8:
          objc_super v10 = @"SCROLL_DOWN";
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
          goto LABEL_48;
        case 10:
          objc_super v10 = @"SHOW_MORE";
          break;
        case 11:
          objc_super v10 = @"SHOW_LESS";
          break;
        case 12:
          objc_super v10 = @"SWIPE_LEFT";
          break;
        case 13:
          objc_super v10 = @"SWIPE_RIGHT";
          break;
        case 14:
          objc_super v10 = @"MINIMIZE";
          break;
        case 15:
          objc_super v10 = @"TAP_PREV";
          break;
        case 16:
          objc_super v10 = @"TAP_NEXT";
          break;
        case 17:
          objc_super v10 = @"SUBMIT";
          break;
        case 18:
          objc_super v10 = @"CANCEL";
          break;
        case 19:
          objc_super v10 = @"ENTER_MAPS";
          break;
        case 20:
          objc_super v10 = @"EXIT_MAPS";
          break;
        case 21:
          objc_super v10 = @"REVEAL";
          break;
        case 22:
          objc_super v10 = @"OPEN_NEW_TAB";
          break;
        case 25:
          objc_super v10 = @"BACK";
          break;
        case 26:
          objc_super v10 = @"ACTIVATE";
          break;
        case 27:
          objc_super v10 = @"DEACTIVATE";
          break;
        case 28:
          objc_super v10 = @"AGREE";
          break;
        case 29:
          objc_super v10 = @"DISAGREE";
          break;
        case 30:
          objc_super v10 = @"SKIP_ANSWER";
          break;
        case 31:
          objc_super v10 = @"EXPAND";
          break;
        case 32:
          objc_super v10 = @"COLLAPSE";
          break;
        case 33:
          objc_super v10 = @"ENTER";
          break;
        case 34:
          objc_super v10 = @"EXIT";
          break;
        case 35:
          objc_super v10 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          objc_super v10 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          objc_super v10 = @"TOGGLE_ON";
          break;
        case 38:
          objc_super v10 = @"TOGGLE_OFF";
          break;
        case 39:
          objc_super v10 = @"LONG_PRESS";
          break;
        case 40:
          objc_super v10 = @"CLICK";
          break;
        case 41:
          objc_super v10 = @"TAP_DONE";
          break;
        case 42:
          objc_super v10 = @"TAP_CLOSE";
          break;
        case 43:
          objc_super v10 = @"SCROLL_LEFT";
          break;
        case 44:
          objc_super v10 = @"SCROLL_RIGHT";
          break;
        case 45:
          objc_super v10 = @"DISPLAY";
          break;
        case 46:
          objc_super v10 = @"OPEN_IN_APP";
          break;
        case 47:
          objc_super v10 = @"CONCEAL";
          break;
        case 48:
          objc_super v10 = @"TAP_DELETE";
          break;
        case 49:
          objc_super v10 = @"TAP_FILTER";
          break;
        case 50:
          objc_super v10 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          objc_super v10 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          objc_super v10 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          objc_super v10 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          objc_super v10 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          objc_super v10 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          objc_super v10 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          objc_super v10 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          objc_super v10 = @"SHARE_PHOTO";
          break;
        case 59:
          objc_super v10 = @"TAP_KEEP_OFF";
          break;
        case 60:
          objc_super v10 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          objc_super v10 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          objc_super v10 = @"TAP_TURN_ON";
          break;
        case 63:
          objc_super v10 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          objc_super v10 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          objc_super v10 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          objc_super v10 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          objc_super v10 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          objc_super v10 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          objc_super v10 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          objc_super v10 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          objc_super v10 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          objc_super v10 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          objc_super v10 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          objc_super v10 = @"RESUME_ROUTE";
          break;
        case 75:
          objc_super v10 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          objc_super v10 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          objc_super v10 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          objc_super v10 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          objc_super v10 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          objc_super v10 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          objc_super v10 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          objc_super v10 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          objc_super v10 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          objc_super v10 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          objc_super v10 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          objc_super v10 = @"REPORT_PHOTO";
          break;
        case 87:
          objc_super v10 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          objc_super v10 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          objc_super v10 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          objc_super v10 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          objc_super v10 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          objc_super v10 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          objc_super v10 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          objc_super v10 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          objc_super v10 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          objc_super v10 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          objc_super v10 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          objc_super v10 = @"NEXT";
          break;
        case 99:
          objc_super v10 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          objc_super v10 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          objc_super v10 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          objc_super v10 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          objc_super v10 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          objc_super v10 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          objc_super v10 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          objc_super v10 = @"CLEAR_INCIDENT";
          break;
        case 107:
          objc_super v10 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          objc_super v10 = @"DISMISS_INCIDENT";
          break;
        case 109:
          objc_super v10 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          objc_super v10 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          objc_super v10 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          objc_super v10 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          objc_super v10 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          objc_super v10 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          objc_super v10 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          objc_super v10 = @"TAP_SHORTCUT";
          break;
        case 117:
          objc_super v10 = @"BLOCK_CONTACT";
          break;
        case 118:
          objc_super v10 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          objc_super v10 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          objc_super v10 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          objc_super v10 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          objc_super v10 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          objc_super v10 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          objc_super v10 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          objc_super v10 = @"TAP_DISMISS";
          break;
        case 126:
          objc_super v10 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          objc_super v10 = @"TAP_OK";
          break;
        case 128:
          objc_super v10 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          objc_super v10 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          objc_super v10 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          objc_super v10 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          objc_super v10 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          objc_super v10 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          objc_super v10 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          objc_super v10 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          objc_super v10 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          objc_super v10 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          objc_super v10 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          objc_super v10 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          objc_super v10 = @"HIDE_DETAILS";
          break;
        case 141:
          objc_super v10 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          objc_super v10 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          objc_super v10 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          objc_super v10 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          objc_super v10 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          objc_super v10 = @"TAP_EXIT";
          break;
        case 147:
          objc_super v10 = @"TAP_CITY_MENU";
          break;
        case 148:
          objc_super v10 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          objc_super v10 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          objc_super v10 = @"TAP_ICLOUD";
          break;
        case 151:
          objc_super v10 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          objc_super v10 = @"TAP_FAVORITES";
          break;
        case 153:
          objc_super v10 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          objc_super v10 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          objc_super v10 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          objc_super v10 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          objc_super v10 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          objc_super v10 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          objc_super v10 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          objc_super v10 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          objc_super v10 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          objc_super v10 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          objc_super v10 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          objc_super v10 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          objc_super v10 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          objc_super v10 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          objc_super v10 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          objc_super v10 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          objc_super v10 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          objc_super v10 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          objc_super v10 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          objc_super v10 = @"TAP_ACCOUNT";
          break;
        case 173:
          objc_super v10 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          objc_super v10 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          objc_super v10 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          objc_super v10 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          objc_super v10 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          objc_super v10 = @"TAP_REPORTS";
          break;
        case 179:
          objc_super v10 = @"TAP_RATINGS";
          break;
        case 180:
          objc_super v10 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          objc_super v10 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          objc_super v10 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          objc_super v10 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          objc_super v10 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          objc_super v10 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          objc_super v10 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          objc_super v10 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          objc_super v10 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          objc_super v10 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          objc_super v10 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          objc_super v10 = @"TAP_RATING";
          break;
        case 192:
          objc_super v10 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          objc_super v10 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          objc_super v10 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          objc_super v10 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          objc_super v10 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          objc_super v10 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          objc_super v10 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          objc_super v10 = @"TAP_MY_GUIDES";
          break;
        case 200:
          objc_super v10 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          objc_super v10 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          objc_super v10 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          objc_super v10 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          objc_super v10 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          objc_super v10 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          objc_super v10 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          objc_super v10 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          objc_super v10 = @"SWITCH_ON_HFP";
          break;
        case 209:
          objc_super v10 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          objc_super v10 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          objc_super v10 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          objc_super v10 = @"RESUME";
          break;
        case 213:
          objc_super v10 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          objc_super v10 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          objc_super v10 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          objc_super v10 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          objc_super v10 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          objc_super v10 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          objc_super v10 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          objc_super v10 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          objc_super v10 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          objc_super v10 = @"RAP_ADD_MAP";
          break;
        case 223:
          objc_super v10 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          objc_super v10 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          objc_super v10 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          objc_super v10 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          objc_super v10 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          objc_super v10 = @"RAP_BAD_TRIP";
          break;
        case 229:
          objc_super v10 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          objc_super v10 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          objc_super v10 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          objc_super v10 = @"RAP_GUIDE";
          break;
        case 233:
          objc_super v10 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          objc_super v10 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          objc_super v10 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          objc_super v10 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          objc_super v10 = @"TAP_SEE_MORE";
          break;
        case 238:
          objc_super v10 = @"RAP_IN_REVIEW";
          break;
        case 239:
          objc_super v10 = @"TAP_OPEN_MENU";
          break;
        case 240:
          objc_super v10 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          objc_super v10 = @"TAP_PIN_LINE";
          break;
        case 242:
          objc_super v10 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          objc_super v10 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          objc_super v10 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          objc_super v10 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          objc_super v10 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          objc_super v10 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          objc_super v10 = @"ADVISORY_ALERT";
          break;
        case 249:
          objc_super v10 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          objc_super v10 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          objc_super v10 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          objc_super v10 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          objc_super v10 = @"MENU_UNPIN";
          break;
        case 254:
          objc_super v10 = @"MENU_PIN";
          break;
        case 255:
          objc_super v10 = @"SWIPE_PIN";
          break;
        case 256:
          objc_super v10 = @"SWIPE_UNPIN";
          break;
        case 257:
          objc_super v10 = @"TAP_MEDIA_APP";
          break;
        case 258:
          objc_super v10 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          objc_super v10 = @"TAP_MEDIA";
          break;
        case 260:
          objc_super v10 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          objc_super v10 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          objc_super v10 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          objc_super v10 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          objc_super v10 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          objc_super v10 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          objc_super v10 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          objc_super v10 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          objc_super v10 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          objc_super v10 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          objc_super v10 = @"TAP_ALLOW";
          break;
        case 271:
          objc_super v10 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          objc_super v10 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          objc_super v10 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          objc_super v10 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          objc_super v10 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          objc_super v10 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          objc_super v10 = @"EDIT_WAYPOINT";
          break;
        case 278:
          objc_super v10 = @"CLEAR_TEXT";
          break;
        case 279:
          objc_super v10 = @"REORDER_WAYPOINT";
          break;
        case 280:
          objc_super v10 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          objc_super v10 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          objc_super v10 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          objc_super v10 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          objc_super v10 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          objc_super v10 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          objc_super v10 = @"RAP_INLINE_ADD";
          break;
        case 287:
          objc_super v10 = @"RAP_TAP_EDIT";
          break;
        case 288:
          objc_super v10 = @"CLAIM_BUSINESS";
          break;
        case 289:
          objc_super v10 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          objc_super v10 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          objc_super v10 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          objc_super v10 = @"NEXT_STOP";
          break;
        case 293:
          objc_super v10 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          objc_super v10 = @"REMOVE_STOP";
          break;
        case 295:
          objc_super v10 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          objc_super v10 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          objc_super v10 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          objc_super v10 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          objc_super v10 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          objc_super v10 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          objc_super v10 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          objc_super v10 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          objc_super v10 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          objc_super v10 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          objc_super v10 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          objc_super v10 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          objc_super v10 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          objc_super v10 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          objc_super v10 = @"FILTER_EV";
          break;
        case 310:
          objc_super v10 = @"FILTER_SURCHARGE";
          break;
        case 311:
          objc_super v10 = @"FILTER_PREFER";
          break;
        case 312:
          objc_super v10 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          objc_super v10 = @"FILTER_AVOID";
          break;
        case 314:
          objc_super v10 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          objc_super v10 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          objc_super v10 = @"FILTER_IC_FARES";
          break;
        case 317:
          objc_super v10 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          objc_super v10 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          objc_super v10 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          objc_super v10 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          objc_super v10 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          objc_super v10 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          objc_super v10 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          objc_super v10 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          objc_super v10 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          objc_super v10 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          objc_super v10 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          objc_super v10 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          objc_super v10 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          objc_super v10 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          objc_super v10 = @"DELETE_PHOTO";
          break;
        case 332:
          objc_super v10 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          objc_super v10 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          objc_super v10 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          objc_super v10 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          objc_super v10 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          objc_super v10 = @"ADD_STOP";
          break;
        case 338:
          objc_super v10 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          objc_super v10 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          objc_super v10 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          objc_super v10 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          objc_super v10 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          objc_super v10 = @"SUBMIT_RATINGS";
          break;
        case 344:
          objc_super v10 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          objc_super v10 = @"FILTER_EBIKE";
          break;
        case 356:
          objc_super v10 = @"ADD_STOP_SIRI";
          break;
        case 357:
          objc_super v10 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          objc_super v10 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          objc_super v10 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          objc_super v10 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          objc_super v10 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          objc_super v10 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          objc_super v10 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          objc_super v10 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          objc_super v10 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          objc_super v10 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          objc_super v10 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          objc_super v10 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          objc_super v10 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          objc_super v10 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          objc_super v10 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          objc_super v10 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          objc_super v10 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          objc_super v10 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          objc_super v10 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          objc_super v10 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          objc_super v10 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          objc_super v10 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          objc_super v10 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          objc_super v10 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          objc_super v10 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          objc_super v10 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          objc_super v10 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          objc_super v10 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          objc_super v10 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          objc_super v10 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          objc_super v10 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          objc_super v10 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          objc_super v10 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          objc_super v10 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          objc_super v10 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          objc_super v10 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          objc_super v10 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          objc_super v10 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          objc_super v10 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          objc_super v10 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          objc_super v10 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          objc_super v10 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          objc_super v10 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          objc_super v10 = @"START_ETA_SHARING";
          break;
        case 401:
          objc_super v10 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          objc_super v10 = @"STOP_ETA_SHARING";
          break;
        case 403:
          objc_super v10 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          objc_super v10 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          objc_super v10 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          objc_super v10 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          objc_super v10 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          objc_super v10 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          objc_super v10 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          objc_super v10 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          objc_super v10 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          objc_super v10 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          objc_super v10 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          objc_super v10 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          objc_super v10 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          objc_super v10 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          objc_super v10 = @"SELECT_CONTROLS";
          break;
        case 418:
          objc_super v10 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          objc_super v10 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          objc_super v10 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          objc_super v10 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          objc_super v10 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          objc_super v10 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          objc_super v10 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          objc_super v10 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          objc_super v10 = @"TAP_MAP";
          break;
        case 427:
          objc_super v10 = @"SWIPE_DOWN";
          break;
        case 428:
          objc_super v10 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          objc_super v10 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          objc_super v10 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          objc_super v10 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          objc_super v10 = @"TAP_AUDIO";
          break;
        case 433:
          objc_super v10 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          objc_super v10 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          objc_super v10 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          objc_super v10 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          objc_super v10 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          objc_super v10 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          objc_super v10 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          objc_super v10 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          objc_super v10 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          objc_super v10 = @"UPDATE_COLOR";
          break;
        case 443:
          objc_super v10 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          objc_super v10 = @"UNSELECT_NETWORK";
          break;
        case 445:
          objc_super v10 = @"TAP_BACK";
          break;
        case 446:
          objc_super v10 = @"TAP_CANCEL";
          break;
        case 447:
          objc_super v10 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          objc_super v10 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          objc_super v10 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          objc_super v10 = @"SELECT_NETWORK";
          break;
        case 451:
          objc_super v10 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          objc_super v10 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          objc_super v10 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          objc_super v10 = @"FILTER_NETWORK";
          break;
        case 455:
          objc_super v10 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          objc_super v10 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          objc_super v10 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          objc_super v10 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          objc_super v10 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          objc_super v10 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          objc_super v10 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          objc_super v10 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          objc_super v10 = @"SAVE";
          break;
        case 464:
          objc_super v10 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          objc_super v10 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          objc_super v10 = @"TAP_TRY_NOW";
          break;
        case 467:
          objc_super v10 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          objc_super v10 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          objc_super v10 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          objc_super v10 = @"START_HIKING";
          break;
        case 471:
          objc_super v10 = @"EDIT_NOTE";
          break;
        case 472:
          objc_super v10 = @"CREATE_NOTE";
          break;
        case 473:
          objc_super v10 = @"DELETE_PIN";
          break;
        case 474:
          objc_super v10 = @"ADD_ROUTE";
          break;
        case 475:
          objc_super v10 = @"ADD_PIN";
          break;
        case 476:
          objc_super v10 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          objc_super v10 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          objc_super v10 = @"TAP_ITEM";
          break;
        case 479:
          objc_super v10 = @"DELETE_ROUTE";
          break;
        case 480:
          objc_super v10 = @"TAP_ROUTE";
          break;
        case 481:
          objc_super v10 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          objc_super v10 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          objc_super v10 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          objc_super v10 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          objc_super v10 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          objc_super v10 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          objc_super v10 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          objc_super v10 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          objc_super v10 = @"TAP_EXPAND";
          break;
        case 490:
          objc_super v10 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          objc_super v10 = @"PAN";
          break;
        case 1002:
          objc_super v10 = @"ZOOM_IN";
          break;
        case 1003:
          objc_super v10 = @"ZOOM_OUT";
          break;
        case 1004:
          objc_super v10 = @"ROTATE";
          break;
        case 1010:
          objc_super v10 = @"TAP_POI";
          break;
        case 1011:
          objc_super v10 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          objc_super v10 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          objc_super v10 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          objc_super v10 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          objc_super v10 = @"DROP_PIN";
          break;
        case 1031:
          objc_super v10 = @"TAP_INCIDENT";
          break;
        case 1032:
          objc_super v10 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          objc_super v10 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          objc_super v10 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          objc_super v10 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          objc_super v10 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          objc_super v10 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          objc_super v10 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          objc_super v10 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          objc_super v10 = @"TAP_COMPASS";
          break;
        case 1041:
          objc_super v10 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          objc_super v10 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          objc_super v10 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          objc_super v10 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          objc_super v10 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          objc_super v10 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          objc_super v10 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          objc_super v10 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          objc_super v10 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          objc_super v10 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          objc_super v10 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          objc_super v10 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          objc_super v10 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          objc_super v10 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          objc_super v10 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          objc_super v10 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          objc_super v10 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          objc_super v10 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          objc_super v10 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          objc_super v10 = @"ZOOM_RESET";
          break;
        case 1061:
          objc_super v10 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          objc_super v10 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          objc_super v10 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          objc_super v10 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          objc_super v10 = @"TAP_GEO";
          break;
        default:
          switch((int)a2)
          {
            case 2001:
              objc_super v10 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              objc_super v10 = @"CLEAR_SEARCH";
              break;
            case 2003:
              objc_super v10 = @"CANCEL_SEARCH";
              break;
            case 2004:
              objc_super v10 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              objc_super v10 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              objc_super v10 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              objc_super v10 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              objc_super v10 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              objc_super v10 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              objc_super v10 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              objc_super v10 = @"REFRESH_SEARCH";
              break;
            case 2012:
              objc_super v10 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              objc_super v10 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              objc_super v10 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              objc_super v10 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              objc_super v10 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              objc_super v10 = @"PASTE_TEXT";
              break;
            case 2018:
              objc_super v10 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              objc_super v10 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              objc_super v10 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              objc_super v10 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              objc_super v10 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              objc_super v10 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              objc_super v10 = @"RETAINED_QUERY";
              break;
            case 2025:
              objc_super v10 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              objc_super v10 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              objc_super v10 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_48;
            case 2030:
              objc_super v10 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              objc_super v10 = @"TAP_SUBACTION";
              break;
            case 2032:
              objc_super v10 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              objc_super v10 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              objc_super v10 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              objc_super v10 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              objc_super v10 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              objc_super v10 = @"SHARE_ITEM";
              break;
            case 2038:
              objc_super v10 = @"HIDE_ITEM";
              break;
            case 2039:
              objc_super v10 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              objc_super v10 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              objc_super v10 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              objc_super v10 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              objc_super v10 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              objc_super v10 = @"ADD_FAVORITE";
              break;
            case 2045:
              objc_super v10 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              objc_super v10 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              objc_super v10 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              objc_super v10 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              objc_super v10 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              objc_super v10 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              objc_super v10 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              objc_super v10 = @"CREATE_FAVORITE";
              break;
            case 2053:
              objc_super v10 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              objc_super v10 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              objc_super v10 = @"EDIT_FAVORITE";
              break;
            case 2056:
              objc_super v10 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              objc_super v10 = @"SHARE_FAVORITE";
              break;
            case 2058:
              objc_super v10 = @"EDIT_FAVORITES";
              break;
            case 2059:
              objc_super v10 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              objc_super v10 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              objc_super v10 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              objc_super v10 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              objc_super v10 = @"REFINE_LOCATION";
              break;
            case 2064:
              objc_super v10 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              objc_super v10 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              objc_super v10 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              objc_super v10 = @"SHOW_COLLECTION";
              break;
            case 2068:
              objc_super v10 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              objc_super v10 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              objc_super v10 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              objc_super v10 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              objc_super v10 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              objc_super v10 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              objc_super v10 = @"EDIT_PHOTO";
              break;
            case 2075:
              objc_super v10 = @"SORT_BY_NAME";
              break;
            case 2076:
              objc_super v10 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              objc_super v10 = @"SORT_BY_RECENT";
              break;
            case 2078:
              objc_super v10 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              objc_super v10 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              objc_super v10 = @"MAP_SEARCH";
              break;
            case 2081:
              objc_super v10 = @"DELETE_COLLECTION";
              break;
            case 2082:
              objc_super v10 = @"SHARE_COLLECTION";
              break;
            case 2083:
              objc_super v10 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              objc_super v10 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              objc_super v10 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              objc_super v10 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              objc_super v10 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              objc_super v10 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              objc_super v10 = @"FOLLOW";
              break;
            case 2090:
              objc_super v10 = @"PUNCH_IN";
              break;
            case 2091:
              objc_super v10 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              objc_super v10 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              objc_super v10 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              objc_super v10 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              objc_super v10 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              objc_super v10 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              objc_super v10 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              objc_super v10 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              objc_super v10 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              objc_super v10 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              objc_super v10 = @"TAP_LOCATION";
              break;
            case 2102:
              objc_super v10 = @"TAP_PUBLISHER";
              break;
            case 2103:
              objc_super v10 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              objc_super v10 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              objc_super v10 = @"UNFOLLOW";
              break;
            case 2106:
              objc_super v10 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              objc_super v10 = @"ADD_VEHICLE";
              break;
            case 2108:
              objc_super v10 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              objc_super v10 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              objc_super v10 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              objc_super v10 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              objc_super v10 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              objc_super v10 = @"SELECT_VEHICLE";
              break;
            case 2114:
              objc_super v10 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              objc_super v10 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              objc_super v10 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              objc_super v10 = @"TAP_BANNER";
              break;
            case 2118:
              objc_super v10 = @"TAP_CONNECT";
              break;
            case 2119:
              objc_super v10 = @"TAP_CONTINUE";
              break;
            case 2120:
              objc_super v10 = @"TAP_EDIT";
              break;
            case 2121:
              objc_super v10 = @"TAP_NAME";
              break;
            case 2122:
              objc_super v10 = @"TAP_NOT_NOW";
              break;
            case 2123:
              objc_super v10 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              objc_super v10 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              objc_super v10 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              objc_super v10 = @"TAP_VEHICLE";
              break;
            case 2127:
              objc_super v10 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              objc_super v10 = @"UPDATE_NAME";
              break;
            case 2129:
              objc_super v10 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              objc_super v10 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              objc_super v10 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              objc_super v10 = @"USE_PHOTO";
              break;
            case 2133:
              objc_super v10 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              objc_super v10 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              objc_super v10 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              objc_super v10 = @"EDIT_RATING";
              break;
            case 2137:
              objc_super v10 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              objc_super v10 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              objc_super v10 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              objc_super v10 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              objc_super v10 = @"RETAKE_PHOTO";
              break;
            case 2142:
              objc_super v10 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              objc_super v10 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              objc_super v10 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              objc_super v10 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              objc_super v10 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              objc_super v10 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              objc_super v10 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              objc_super v10 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              objc_super v10 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              objc_super v10 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              objc_super v10 = @"REPORT_INCIDENT";
              break;
            case 2153:
              objc_super v10 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              objc_super v10 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              objc_super v10 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              objc_super v10 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              objc_super v10 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              objc_super v10 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              objc_super v10 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              objc_super v10 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              objc_super v10 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              objc_super v10 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              objc_super v10 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              objc_super v10 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              objc_super v10 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              objc_super v10 = @"DELETE_ITEM";
              break;
            case 2167:
              objc_super v10 = @"CANCEL_REMOVE";
              break;
            case 2168:
              objc_super v10 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              objc_super v10 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              objc_super v10 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              objc_super v10 = @"TRY_AGAIN";
              break;
            case 2172:
              objc_super v10 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              objc_super v10 = @"CHECK_EBIKE";
              break;
            case 2174:
              objc_super v10 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              objc_super v10 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              objc_super v10 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              objc_super v10 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              objc_super v10 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              objc_super v10 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              objc_super v10 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              objc_super v10 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              objc_super v10 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              objc_super v10 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              objc_super v10 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              objc_super v10 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              objc_super v10 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              objc_super v10 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              objc_super v10 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              objc_super v10 = @"CREATE_WIDGET";
              break;
            case 2190:
              objc_super v10 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              objc_super v10 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              objc_super v10 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              objc_super v10 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              objc_super v10 = @"LPR_HARD_STOP";
              break;
            case 2195:
              objc_super v10 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              objc_super v10 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              objc_super v10 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              objc_super v10 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              objc_super v10 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              objc_super v10 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)a2)
              {
                case 3001:
                  objc_super v10 = @"START_NAV";
                  break;
                case 3002:
                  objc_super v10 = @"END_NAV";
                  break;
                case 3003:
                  objc_super v10 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  objc_super v10 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  objc_super v10 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  objc_super v10 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  objc_super v10 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  objc_super v10 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  objc_super v10 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  objc_super v10 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  objc_super v10 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  objc_super v10 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  objc_super v10 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  objc_super v10 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  objc_super v10 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  objc_super v10 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  objc_super v10 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  objc_super v10 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  objc_super v10 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  objc_super v10 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  objc_super v10 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  objc_super v10 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  objc_super v10 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  objc_super v10 = @"CHECK_BUS";
                  break;
                case 3025:
                  objc_super v10 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  objc_super v10 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  objc_super v10 = @"CHECK_FERRY";
                  break;
                case 3028:
                  objc_super v10 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  objc_super v10 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  objc_super v10 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  objc_super v10 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  objc_super v10 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  objc_super v10 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  objc_super v10 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  objc_super v10 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  objc_super v10 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  objc_super v10 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  objc_super v10 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  objc_super v10 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  objc_super v10 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  objc_super v10 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  objc_super v10 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  objc_super v10 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  objc_super v10 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  objc_super v10 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  objc_super v10 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  objc_super v10 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  objc_super v10 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  objc_super v10 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  objc_super v10 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  objc_super v10 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  objc_super v10 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  objc_super v10 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  objc_super v10 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  objc_super v10 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  objc_super v10 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  objc_super v10 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  objc_super v10 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  objc_super v10 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  objc_super v10 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  objc_super v10 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  objc_super v10 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  objc_super v10 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  objc_super v10 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  objc_super v10 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  objc_super v10 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  objc_super v10 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  objc_super v10 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  objc_super v10 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  objc_super v10 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  objc_super v10 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  objc_super v10 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  objc_super v10 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  objc_super v10 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  objc_super v10 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  objc_super v10 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  objc_super v10 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  objc_super v10 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  objc_super v10 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  objc_super v10 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  objc_super v10 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  objc_super v10 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  objc_super v10 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  objc_super v10 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  objc_super v10 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  objc_super v10 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  objc_super v10 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  objc_super v10 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_48;
              }
              break;
          }
          break;
      }
    }
    v11 = v10;
    if ((int)a3 > 1000)
    {
      if ((int)a3 > 1600)
      {
        switch((int)a3)
        {
          case 1700:
            v12 = @"LOOK_AROUND_PIP";
            break;
          case 1701:
            v12 = @"LOOK_AROUND_ACTION_SHEET";
            break;
          case 1702:
            v12 = @"LOOK_AROUND_VIEW";
            break;
          case 1703:
            v12 = @"LOOK_AROUND_PLATTER";
            break;
          case 1704:
            v12 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
            break;
          case 1705:
            v12 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
            break;
          case 1706:
            v12 = @"LOOK_AROUND_VIEW_PLACECARD";
            break;
          case 1707:
            v12 = @"LOOK_AROUND_PIP_PLACECARD";
            break;
          case 1708:
            v12 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
            break;
          default:
            if (a3 == 1601)
            {
              v12 = @"MENU_ITEM_DARK_MAP";
            }
            else
            {
LABEL_1355:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a3);
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else
      {
        switch((int)a3)
        {
          case 1001:
            v12 = @"CARPLAY_NAV";
            break;
          case 1002:
            v12 = @"CARPLAY_EXPLORE";
            break;
          case 1003:
            v12 = @"CARPLAY_DESTINATIONS";
            break;
          case 1004:
            v12 = @"CARPLAY_TRAFFIC_INCIDENT";
            break;
          case 1005:
            v12 = @"CARPLAY_CONTROL";
            break;
          case 1006:
            v12 = @"CARPLAY_PROACTIVE";
            break;
          case 1007:
            v12 = @"CARPLAY_ROUTING";
            break;
          case 1008:
            v12 = @"CARPLAY_MORE_ROUTES";
            break;
          case 1009:
            v12 = @"CARPLAY_SEARCH_ALONG_ROUTE";
            break;
          case 1010:
            v12 = @"CARPLAY_SEARCH";
            break;
          case 1011:
            v12 = @"CARPLAY_SEARCH_RESULTS";
            break;
          case 1012:
            v12 = @"CARPLAY_FAVORITES";
            break;
          case 1013:
            v12 = @"CARPLAY_NAV_CONFIRMATION";
            break;
          case 1014:
            v12 = @"CARPLAY_DESTINATION_SHARING";
            break;
          case 1015:
            v12 = @"CARPLAY_NOTIFICATION_BATTERY";
            break;
          case 1016:
            v12 = @"CARPLAY_NOTIFICATION_DOOM";
            break;
          case 1017:
            v12 = @"CARPLAY_NOTIFICATION_FUEL";
            break;
          case 1018:
            v12 = @"CARPLAY_NOTIFICATION_HYBRID";
            break;
          case 1019:
            v12 = @"CARPLAY_SHARE_ETA_TRAY";
            break;
          case 1020:
            v12 = @"CARPLAY_ETA_UPDATE_TRAY";
            break;
          case 1021:
            v12 = @"CARPLAY_ACTION_TRAY";
            break;
          case 1022:
            v12 = @"CARPLAY_PLACECARD";
            break;
          case 1023:
            v12 = @"CARPLAY_KEYBOARD";
            break;
          case 1024:
            v12 = @"CARPLAY_UI_TARGET_UNKNOWN";
            break;
          case 1025:
            v12 = @"CARPLAY_EDIT_STOPS";
            break;
          case 1026:
          case 1027:
          case 1028:
          case 1029:
          case 1030:
          case 1031:
          case 1032:
          case 1033:
          case 1034:
          case 1035:
          case 1036:
          case 1037:
          case 1038:
          case 1039:
          case 1040:
          case 1041:
          case 1042:
          case 1043:
          case 1044:
          case 1045:
          case 1046:
          case 1047:
          case 1048:
          case 1049:
          case 1050:
          case 1051:
          case 1052:
          case 1053:
          case 1054:
          case 1055:
          case 1056:
          case 1057:
          case 1058:
          case 1059:
          case 1060:
          case 1061:
          case 1062:
          case 1063:
          case 1064:
          case 1065:
          case 1066:
          case 1067:
          case 1068:
          case 1069:
          case 1070:
          case 1071:
          case 1072:
          case 1073:
          case 1074:
          case 1075:
          case 1076:
          case 1077:
          case 1078:
          case 1079:
          case 1080:
          case 1081:
          case 1082:
          case 1083:
          case 1084:
          case 1085:
          case 1086:
          case 1087:
          case 1088:
          case 1089:
          case 1090:
          case 1091:
          case 1092:
          case 1093:
          case 1094:
          case 1095:
          case 1096:
          case 1097:
          case 1098:
          case 1099:
          case 1162:
          case 1163:
          case 1164:
          case 1165:
          case 1166:
          case 1167:
          case 1168:
          case 1169:
          case 1170:
          case 1171:
          case 1172:
          case 1173:
          case 1174:
          case 1175:
          case 1176:
          case 1177:
          case 1178:
          case 1179:
          case 1180:
          case 1181:
          case 1182:
          case 1183:
          case 1184:
          case 1185:
          case 1186:
          case 1187:
          case 1188:
          case 1189:
          case 1190:
          case 1191:
          case 1192:
          case 1193:
          case 1194:
          case 1195:
          case 1196:
          case 1197:
          case 1198:
          case 1199:
          case 1200:
          case 1241:
          case 1242:
          case 1243:
          case 1244:
          case 1245:
          case 1246:
          case 1247:
          case 1248:
          case 1249:
          case 1250:
          case 1251:
          case 1252:
          case 1253:
          case 1254:
          case 1255:
          case 1256:
          case 1257:
          case 1258:
          case 1259:
          case 1260:
          case 1261:
          case 1262:
          case 1263:
          case 1264:
          case 1265:
          case 1266:
          case 1267:
          case 1268:
          case 1269:
          case 1270:
          case 1271:
          case 1272:
          case 1273:
          case 1274:
          case 1275:
          case 1276:
          case 1277:
          case 1278:
          case 1279:
          case 1280:
          case 1281:
          case 1282:
          case 1283:
          case 1284:
          case 1285:
          case 1286:
          case 1287:
          case 1288:
          case 1289:
          case 1290:
          case 1291:
          case 1292:
          case 1293:
          case 1294:
          case 1295:
          case 1296:
          case 1297:
          case 1298:
          case 1299:
          case 1300:
            goto LABEL_1355;
          case 1100:
            v12 = @"RAP_DIRECTIONS_MENU";
            break;
          case 1101:
            v12 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
            break;
          case 1102:
            v12 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
            break;
          case 1103:
            v12 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
            break;
          case 1104:
            v12 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
            break;
          case 1105:
            v12 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
            break;
          case 1106:
            v12 = @"RAP_TRANSIT_MENU";
            break;
          case 1107:
            v12 = @"RAP_STATION_MAP";
            break;
          case 1108:
            v12 = @"RAP_STATION_MENU";
            break;
          case 1109:
            v12 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
            break;
          case 1110:
            v12 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
            break;
          case 1111:
            v12 = @"RAP_STATION_CLOSED_FORM";
            break;
          case 1112:
            v12 = @"RAP_LINE_MAP";
            break;
          case 1113:
            v12 = @"RAP_LINE_MENU";
            break;
          case 1114:
            v12 = @"RAP_LINE_NAME_FORM";
            break;
          case 1115:
            v12 = @"RAP_LINE_SHAPE_FORM";
            break;
          case 1116:
            v12 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
            break;
          case 1117:
            v12 = @"RAP_ADD_PLACE_MENU";
            break;
          case 1118:
            v12 = @"RAP_ADD_POI_MAP";
            break;
          case 1119:
            v12 = @"RAP_CATEGORY_LIST";
            break;
          case 1120:
            v12 = @"RAP_POI_DETAILS_FORM";
            break;
          case 1121:
            v12 = @"RAP_ADD_STREET_MAP";
            break;
          case 1122:
            v12 = @"RAP_STREET_DETAILS_FORM";
            break;
          case 1123:
            v12 = @"RAP_ADD_OTHER_MAP";
            break;
          case 1124:
            v12 = @"RAP_OTHER_DETAILS_FORM";
            break;
          case 1125:
            v12 = @"RAP_CAMERA";
            break;
          case 1126:
            v12 = @"RAP_LABEL_MAP";
            break;
          case 1127:
            v12 = @"RAP_LABEL_DETAILS_FORM";
            break;
          case 1128:
            v12 = @"RAP_SEARCH_MENU";
            break;
          case 1129:
            v12 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
            break;
          case 1130:
            v12 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
            break;
          case 1131:
            v12 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
            break;
          case 1132:
            v12 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
            break;
          case 1133:
            v12 = @"RAP_SATELLITE_IMAGE_MAP";
            break;
          case 1134:
            v12 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
            break;
          case 1135:
            v12 = @"RAP_OTHER_FORM";
            break;
          case 1136:
            v12 = @"RAP_PRIVACY";
            break;
          case 1137:
            v12 = @"RAP_CONFIRMATION";
            break;
          case 1138:
            v12 = @"RAP_POI_MENU";
            break;
          case 1139:
            v12 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
            break;
          case 1140:
            v12 = @"RAP_ADD_A_PLACE_MAP";
            break;
          case 1141:
            v12 = @"RAP_POI_LOCATION_MAP";
            break;
          case 1142:
            v12 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
            break;
          case 1143:
            v12 = @"RAP_POI_CLOSED_FORM";
            break;
          case 1144:
            v12 = @"RAP_CLAIM_BUSINESS_DIALOG";
            break;
          case 1145:
            v12 = @"RAP_BRAND_MENU";
            break;
          case 1146:
            v12 = @"RAP_BRAND_DETAILS_FORM";
            break;
          case 1147:
            v12 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
            break;
          case 1148:
            v12 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
            break;
          case 1149:
            v12 = @"RAP_LOOK_AROUND_BLURRING_FORM";
            break;
          case 1150:
            v12 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
            break;
          case 1151:
            v12 = @"RAP_LOOK_AROUND_MENU";
            break;
          case 1152:
            v12 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
            break;
          case 1153:
            v12 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
            break;
          case 1154:
            v12 = @"RAP_LIGHTWEIGHT";
            break;
          case 1155:
            v12 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 1156:
            v12 = @"RAP_ADD_CATEGORY";
            break;
          case 1157:
            v12 = @"RAP_ADD_HOURS";
            break;
          case 1158:
            v12 = @"RAP_EDIT_LOCATION";
            break;
          case 1159:
            v12 = @"RAP_EDIT_ENTRY_POINT";
            break;
          case 1160:
            v12 = @"RAP_LOOK_AROUND";
            break;
          case 1161:
            v12 = @"RAP_ADD_ENTRY_POINT";
            break;
          case 1201:
            v12 = @"WATCH_MAIN_MENU";
            break;
          case 1202:
            v12 = @"WATCH_MAIN_PRESS_MENU";
            break;
          case 1203:
            v12 = @"WATCH_SEARCH";
            break;
          case 1204:
            v12 = @"WATCH_DICTATION";
            break;
          case 1205:
            v12 = @"WATCH_FAVORITES";
            break;
          case 1206:
            v12 = @"WATCH_SUB_CATEGORY_LIST";
            break;
          case 1207:
            v12 = @"WATCH_SEARCH_RESULTS_LIST";
            break;
          case 1208:
            v12 = @"WATCH_MAP_VIEW";
            break;
          case 1209:
            v12 = @"WATCH_PLACECARD";
            break;
          case 1210:
            v12 = @"WATCH_ROUTE_PLANNING";
            break;
          case 1211:
            v12 = @"WATCH_ROUTE_DETAILS";
            break;
          case 1212:
            v12 = @"WATCH_NAV_TBT";
            break;
          case 1213:
            v12 = @"WATCH_NAV_MAP";
            break;
          case 1214:
            v12 = @"WATCH_NAV_PRESS_MENU";
            break;
          case 1215:
            v12 = @"WATCH_MAP_PRESS_MENU";
            break;
          case 1216:
            v12 = @"WATCH_ROUTING_PRESS_MENU";
            break;
          case 1217:
            v12 = @"WATCH_TRANSIT_MAP_VIEW";
            break;
          case 1218:
            v12 = @"WATCH_SCRIBBLE";
            break;
          case 1219:
            v12 = @"WATCH_COLLECTION_VIEW";
            break;
          case 1220:
            v12 = @"WATCH_ROUTE_PLANNING_WALKING";
            break;
          case 1221:
            v12 = @"WATCH_ROUTE_PLANNING_DRIVING";
            break;
          case 1222:
            v12 = @"WATCH_ROUTE_PLANNING_TRANSIT";
            break;
          case 1223:
            v12 = @"WATCH_PAIRED_DEVICE";
            break;
          case 1224:
            v12 = @"WATCH_NAV_DRIVING_SPLIT";
            break;
          case 1225:
            v12 = @"WATCH_NAV_DRIVING_PLATTER";
            break;
          case 1226:
            v12 = @"WATCH_NAV_DRIVING_MAP";
            break;
          case 1227:
            v12 = @"WATCH_NAV_WALKING_SPLIT";
            break;
          case 1228:
            v12 = @"WATCH_NAV_WALKING_PLATTER";
            break;
          case 1229:
            v12 = @"WATCH_NAV_WALKING_MAP";
            break;
          case 1230:
            v12 = @"WATCH_NAV_TRANSIT_SPLIT";
            break;
          case 1231:
            v12 = @"WATCH_NAV_TRANSIT_PLATTER";
            break;
          case 1232:
            v12 = @"WATCH_NAV_TRANSIT_MAP";
            break;
          case 1233:
            v12 = @"WATCH_ROUTE_INFO";
            break;
          case 1234:
            v12 = @"WATCH_NAV_CYCLING_MAP";
            break;
          case 1235:
            v12 = @"WATCH_NAV_CYCLING_PLATTER";
            break;
          case 1236:
            v12 = @"WATCH_NAV_CYCLING_SPLIT";
            break;
          case 1237:
            v12 = @"WATCH_ROUTE_PLANNING_CYCLING";
            break;
          case 1238:
            v12 = @"WATCH_SEARCH_INPUT";
            break;
          case 1239:
            v12 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
            break;
          case 1240:
            v12 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
            break;
          case 1301:
            v12 = @"PERSONALIZED_ADDRESS_LIST";
            break;
          case 1302:
            v12 = @"PERSONALIZED_ADDRESS_FORM";
            break;
          case 1303:
            v12 = @"PERSONALIZED_LABEL_FORM";
            break;
          case 1304:
            v12 = @"PERSONALIZED_EDIT_MAP";
            break;
          case 1305:
            v12 = @"PERSONALIZED_CONFIRMATION";
            break;
          case 1306:
            v12 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
            break;
          case 1307:
            v12 = @"PERSONALIZED_ADDRESS_INFO";
            break;
          case 1308:
            v12 = @"PERSONALIZED_ADDRESS_SEARCH";
            break;
          case 1309:
            v12 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
            break;
          case 1310:
            v12 = @"FAVORITE_SEARCH";
            break;
          case 1311:
            v12 = @"FAVORITE_LIST";
            break;
          case 1312:
            v12 = @"FAVORITE_INFO";
            break;
          case 1313:
            v12 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
            break;
          default:
            switch((int)a3)
            {
              case 1401:
                v12 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
                break;
              case 1402:
                v12 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
                break;
              case 1403:
                v12 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
                break;
              case 1404:
                v12 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
                break;
              case 1405:
                v12 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
                break;
              case 1406:
                v12 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
                break;
              case 1407:
                v12 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
                break;
              default:
                switch((int)a3)
                {
                  case 1501:
                    v12 = @"PLACECARD_HEADER";
                    break;
                  case 1502:
                    v12 = @"PLACECARD_ADDRESS";
                    break;
                  case 1503:
                    v12 = @"PLACECARD_PHONE";
                    break;
                  case 1504:
                    v12 = @"PLACECARD_URL";
                    break;
                  default:
                    goto LABEL_1355;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      v12 = @"UI_TARGET_UNKNOWN";
      switch((int)a3)
      {
        case 0:
          break;
        case 1:
          v12 = @"UI_TARGET_POI";
          break;
        case 2:
          v12 = @"UI_TARGET_SEARCH_RESULT_LIST";
          break;
        case 3:
          v12 = @"UI_TARGET_POPULAR_NEARBY_LIST";
          break;
        case 4:
          v12 = @"UI_TARGET_CALLOUT";
          break;
        case 5:
          v12 = @"UI_TARGET_SEARCH_PIN";
          break;
        case 6:
          v12 = @"UI_TARGET_DROPPED_PIN";
          break;
        case 7:
          v12 = @"UI_TARGET_TRANSIT_LINE";
          break;
        case 8:
          v12 = @"SEARCH_TRAY";
          break;
        case 9:
          v12 = @"SEARCH_TRAY_BROWSE";
          break;
        case 10:
          v12 = @"SEARCH_TRAY_POPULAR_NEARBY";
          break;
        case 11:
          v12 = @"SEARCH_TRAY_AC";
          break;
        case 12:
          v12 = @"SEARCH_TRAY_AC_INTERMEDIATE";
          break;
        case 13:
          v12 = @"SEARCH_TRAY_NO_QUERY";
          break;
        case 14:
          v12 = @"AR_WALKING_LEGAL_TRAY";
          break;
        case 15:
          v12 = @"RAISE_TO_START_AR_TRAY";
          break;
        case 16:
          v12 = @"EVENTS_ADVISORY_DETAILS_PAGE";
          break;
        case 17:
          v12 = @"INCIDENT_REPORT_TRAY_CARPLAY";
          break;
        case 18:
          v12 = @"HIGHLIGHTED_AREA";
          break;
        case 19:
          v12 = @"CURATED_COLLECTIONS_HOME";
          break;
        case 20:
          v12 = @"TRAVEL_PREFERENCES_TRAY";
          break;
        case 21:
          v12 = @"RESULT_TRAY_SEARCH";
          break;
        case 22:
          v12 = @"SINGLE_CARD_FILTER";
          break;
        case 23:
          v12 = @"FULL_CARD_FILTER";
          break;
        case 24:
          v12 = @"ACCOUNT_PRIVACY_TRAY";
          break;
        case 25:
          v12 = @"APPLE_RATINGS_HISTORY_TRAY";
          break;
        case 26:
          v12 = @"CURATED_COLLECTIONS_HOME_FILTERED";
          break;
        case 27:
          v12 = @"CITY_MENU";
          break;
        case 28:
          v12 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
          break;
        case 29:
          v12 = @"ACCOUNT_TRAY";
          break;
        case 30:
          v12 = @"QUICK_ACTION_TRAY";
          break;
        case 31:
          v12 = @"SUBMIT_TRIP_FEEDBACK";
          break;
        case 32:
          v12 = @"RAP_PLACE_ISSUE_DETAILS";
          break;
        case 33:
          v12 = @"RAP_GUIDES_DETAILS";
          break;
        case 34:
          v12 = @"RAP_BAD_DIRECTIONS_DETAILS";
          break;
        case 35:
          v12 = @"RAP_ADD_MAP_DETAILS";
          break;
        case 36:
          v12 = @"WATCH_COMPLICATION";
          break;
        case 37:
          v12 = @"RAP_NAV_MENU";
          break;
        case 38:
          v12 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
          break;
        case 39:
          v12 = @"RAP_REPORT_MENU";
          break;
        case 40:
          v12 = @"RAP_CURATED_COLLECTION_MENU";
          break;
        case 41:
          v12 = @"RAP_REPORT_CARD_DETAILS";
          break;
        case 42:
          v12 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
          break;
        case 43:
          v12 = @"RAP_STREET_ISSUE_DETAILS";
          break;
        case 44:
          v12 = @"NEARBY_TRANSIT_CARD";
          break;
        case 45:
          v12 = @"WATCH_NAV_MENU";
          break;
        case 46:
          v12 = @"GENERIC_ADVISORY_PAGE";
          break;
        case 47:
          v12 = @"USER_PROFILE_TRAY";
          break;
        case 48:
          v12 = @"MEDIA_APP_MENU";
          break;
        case 49:
          v12 = @"TEMPLATE_PLACE_TRAY";
          break;
        case 50:
          v12 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
          break;
        case 51:
          v12 = @"ALLOW_NOTIFICATION_DIALOG";
          break;
        case 52:
          v12 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
          break;
        case 53:
          v12 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
          break;
        case 54:
          v12 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
          break;
        case 55:
          v12 = @"NOTIFICATION_CONSENT_PROMPT";
          break;
        case 56:
          v12 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
          break;
        case 57:
          v12 = @"PLACECARD_TRAY_VENDORS_MENU";
          break;
        case 58:
          v12 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
          break;
        case 59:
          v12 = @"SEARCH_ALONG_ROUTE_TRAY";
          break;
        case 60:
          v12 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
          break;
        case 61:
          v12 = @"PLACECARD_SHOWCASE_MENU";
          break;
        case 62:
          v12 = @"RAP_INLINE_ADD_DETAILS";
          break;
        case 63:
          v12 = @"RAP_EDIT_MENU_DETAILS";
          break;
        case 64:
          v12 = @"RAP_SUBMISSION_PROMPT";
          break;
        case 65:
          v12 = @"RAP_PLACECARD_EDIT_MENU";
          break;
        case 66:
          v12 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
          break;
        case 67:
          v12 = @"INCIDENT_REPORT_MENU";
          break;
        case 68:
          v12 = @"RAP_SELECT_BAD_ROUTES_STEPS";
          break;
        case 69:
          v12 = @"RAP_SELECT_BAD_ROUTES";
          break;
        case 70:
          v12 = @"SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 71:
          v12 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 72:
          v12 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
          break;
        case 73:
          v12 = @"SPOTLIGHT_BUSINESS_ENTITY";
          break;
        case 74:
          v12 = @"NOTIFICATION_ARP";
          break;
        case 75:
          v12 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
          break;
        case 76:
          v12 = @"YOUR_PHOTOS_ALBUM";
          break;
        case 77:
          v12 = @"ARP_PHOTO_CREDIT";
          break;
        case 78:
          v12 = @"RAP_OUTREACH_REVIEWED_REPORT";
          break;
        case 79:
          v12 = @"RAP_REPORT_MENU_MORE";
          break;
        case 80:
          v12 = @"WATCH_MAPS_SETTINGS";
          break;
        case 81:
          v12 = @"OFFLINE_FEATURE_PROMPT";
          break;
        case 82:
          v12 = @"EXPIRED_MAPS_DETAILS";
          break;
        case 83:
          v12 = @"MAPS_VIEW";
          break;
        case 84:
          v12 = @"NOTIFICATION_OFFLINE";
          break;
        case 85:
          v12 = @"EXPIRED_MAPS_MANAGEMENT";
          break;
        case 86:
          v12 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
          break;
        case 87:
          v12 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
          break;
        case 88:
          v12 = @"OFFLINE_MAPS_MANAGEMENT";
          break;
        case 89:
          v12 = @"REGION_SELECTOR";
          break;
        case 90:
          v12 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
          break;
        case 91:
          v12 = @"FIND_MY_ETA_SHARING_TRAY";
          break;
        case 92:
          v12 = @"WATCH_PLACE";
          break;
        case 93:
          v12 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
          break;
        case 94:
          v12 = @"WATCH_ROUTE_PLANNING_MAP";
          break;
        case 95:
          v12 = @"WATCH_NAV_WALKING_CONTROLS";
          break;
        case 96:
          v12 = @"WATCH_NAV_CYCLING_CONTROLS";
          break;
        case 97:
          v12 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
          break;
        case 98:
          v12 = @"WATCH_NAV_TRANSIT_CONTROLS";
          break;
        case 99:
          v12 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
          break;
        case 100:
          v12 = @"WATCH_NAV_DRIVING_CONTROLS";
          break;
        case 101:
          v12 = @"RESULTS_TRAY_SEARCH";
          break;
        case 102:
          v12 = @"RESULTS_TRAY_BROWSE";
          break;
        case 103:
          v12 = @"RESULTS_TRAY_FAVORITES";
          break;
        case 104:
          v12 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
          break;
        case 105:
          v12 = @"RESULTS_TRAY_CLUSTER";
          break;
        case 106:
          v12 = @"RESULTS_TRAY_VENUE_BROWSE";
          break;
        case 107:
          v12 = @"WATCH_MAP_RESULTS";
          break;
        case 108:
          v12 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
          break;
        case 109:
          v12 = @"WATCH_PLACES";
          break;
        case 110:
          v12 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
          break;
        case 111:
          v12 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
          break;
        case 112:
          v12 = @"DOWNLOADED_MAPS_DETAILS";
          break;
        case 113:
          v12 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
          break;
        case 114:
          v12 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
          break;
        case 115:
          v12 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
          break;
        case 116:
          v12 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
          break;
        case 117:
          v12 = @"WATCH_ROUTE_OPTIONS";
          break;
        case 118:
          v12 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
          break;
        case 119:
          v12 = @"WATCH_MORE_GUIDES";
          break;
        case 120:
          v12 = @"WATCH_RECENTLY_VIEWED";
          break;
        case 121:
          v12 = @"EV_SUCCESS_TRAY";
          break;
        case 122:
          v12 = @"PREFERRED_NETWORK_SELECTION_TRAY";
          break;
        case 123:
          v12 = @"PREFERRED_NETWORK_TRAY";
          break;
        case 124:
          v12 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
          break;
        case 125:
          v12 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
          break;
        case 126:
          v12 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
          break;
        case 127:
          v12 = @"AC_KEYBOARD_TRAY";
          break;
        case 128:
          v12 = @"MORE_RELATED_TRAILS";
          break;
        case 129:
          v12 = @"MORE_RELATED_TRAILHEADS";
          break;
        case 130:
          v12 = @"ROUTING_TRAY_CUSTOM_ROUTE";
          break;
        case 131:
          v12 = @"CUSTOM_ROUTE_CREATION_TRAY";
          break;
        case 132:
          v12 = @"ROUTING_TRAY_CURATED_HIKE";
          break;
        case 133:
          v12 = @"MORE_CURATED_HIKES";
          break;
        case 134:
          v12 = @"CUSTOM_ROUTE_ONBOARDING";
          break;
        case 135:
          v12 = @"LIBRARY_ROUTES";
          break;
        case 136:
          v12 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
          break;
        case 137:
          v12 = @"MY_LIBRARY";
          break;
        case 138:
          v12 = @"EDIT_NOTE_TRAY";
          break;
        case 139:
          v12 = @"CREATE_NOTE_TRAY";
          break;
        case 140:
          v12 = @"LIBRARY_PLACES";
          break;
        case 141:
          v12 = @"WATCH_ACCOUNT";
          break;
        case 142:
          v12 = @"WATCH_DOWNLOADED_MAPS";
          break;
        case 143:
          v12 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
          break;
        case 144:
          v12 = @"VISUAL_INTELLIGENCE_DETECTION";
          break;
        case 145:
          v12 = @"VISUAL_INTELLIGENCE_SNIPPET";
          break;
        case 146:
        case 147:
        case 148:
        case 149:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 180:
        case 181:
        case 182:
        case 183:
        case 184:
        case 185:
        case 186:
        case 187:
        case 188:
        case 189:
        case 190:
        case 191:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 238:
        case 239:
        case 240:
        case 241:
        case 242:
        case 243:
        case 244:
        case 245:
        case 246:
        case 247:
        case 248:
        case 249:
        case 269:
        case 270:
        case 271:
        case 272:
        case 273:
        case 274:
        case 275:
        case 276:
        case 277:
        case 278:
        case 279:
        case 280:
        case 281:
        case 282:
        case 283:
        case 284:
        case 285:
        case 286:
        case 287:
        case 288:
        case 289:
        case 290:
        case 291:
        case 292:
        case 293:
        case 294:
        case 295:
        case 296:
        case 297:
        case 298:
        case 299:
        case 300:
        case 307:
        case 308:
        case 309:
        case 310:
        case 311:
        case 312:
        case 313:
        case 314:
        case 315:
        case 316:
        case 317:
        case 318:
        case 319:
        case 320:
        case 321:
        case 322:
        case 323:
        case 324:
        case 325:
        case 326:
        case 327:
        case 328:
        case 329:
        case 330:
        case 331:
        case 332:
        case 333:
        case 334:
        case 335:
        case 336:
        case 337:
        case 338:
        case 339:
        case 340:
        case 341:
        case 342:
        case 343:
        case 344:
        case 345:
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
        case 356:
        case 357:
        case 358:
        case 359:
        case 360:
        case 361:
        case 362:
        case 363:
        case 364:
        case 365:
        case 366:
        case 367:
        case 368:
        case 369:
        case 370:
        case 371:
        case 372:
        case 373:
        case 374:
        case 375:
        case 376:
        case 377:
        case 378:
        case 379:
        case 380:
        case 381:
        case 382:
        case 383:
        case 384:
        case 385:
        case 386:
        case 387:
        case 388:
        case 389:
        case 390:
        case 391:
        case 392:
        case 393:
        case 394:
        case 395:
        case 396:
        case 397:
        case 398:
        case 399:
        case 400:
        case 405:
        case 406:
        case 407:
        case 408:
        case 409:
        case 410:
        case 411:
        case 412:
        case 413:
        case 414:
        case 415:
        case 416:
        case 417:
        case 418:
        case 419:
        case 420:
        case 421:
        case 422:
        case 423:
        case 424:
        case 425:
        case 426:
        case 427:
        case 428:
        case 429:
        case 430:
        case 431:
        case 432:
        case 433:
        case 434:
        case 435:
        case 436:
        case 437:
        case 438:
        case 439:
        case 440:
        case 441:
        case 442:
        case 443:
        case 444:
        case 445:
        case 446:
        case 447:
        case 448:
        case 449:
        case 450:
        case 451:
        case 452:
        case 453:
        case 454:
        case 455:
        case 456:
        case 457:
        case 458:
        case 459:
        case 460:
        case 461:
        case 462:
        case 463:
        case 464:
        case 465:
        case 466:
        case 467:
        case 468:
        case 469:
        case 470:
        case 471:
        case 472:
        case 473:
        case 474:
        case 475:
        case 476:
        case 477:
        case 478:
        case 479:
        case 480:
        case 481:
        case 482:
        case 483:
        case 484:
        case 485:
        case 486:
        case 487:
        case 488:
        case 489:
        case 490:
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
        case 700:
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
          goto LABEL_1355;
        case 201:
          v12 = @"PLACECARD_TRAY";
          break;
        case 202:
          v12 = @"WEB_MODULE";
          break;
        case 250:
          v12 = @"ADD_FAVORITE_TRAY";
          break;
        case 251:
          v12 = @"COLLECTION_LIST";
          break;
        case 252:
          v12 = @"COLLECTION_VIEW";
          break;
        case 253:
          v12 = @"FAVORITE_DETAILS";
          break;
        case 254:
          v12 = @"FAVORITES_TRAY";
          break;
        case 255:
          v12 = @"SHARED_COLLECTION";
          break;
        case 256:
          v12 = @"SHARED_COLLECTION_VIEW";
          break;
        case 257:
          v12 = @"RECENTLY_VIEWED";
          break;
        case 258:
          v12 = @"SHARED_WEB_COLLECTION";
          break;
        case 259:
          v12 = @"CURATED_COLLECTION_VIEW";
          break;
        case 260:
          v12 = @"FEATURED_COLLECTIONS";
          break;
        case 261:
          v12 = @"PUBLISHER_TRAY";
          break;
        case 262:
          v12 = @"SHARED_CURATED_COLLECTION_VIEW";
          break;
        case 263:
          v12 = @"CURATED_COLLECTION_NOTIFICATION";
          break;
        case 264:
          v12 = @"CURATED_COLLECTION_LIST";
          break;
        case 265:
          v12 = @"PUBLISHER_LIST";
          break;
        case 266:
          v12 = @"WATCH_CURATED_COLLECTION_VIEW";
          break;
        case 267:
          v12 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
          break;
        case 268:
          v12 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
          break;
        case 301:
          v12 = @"ROUTING_TRAY_DRIVING";
          break;
        case 302:
          v12 = @"ROUTING_TRAY_WALKING";
          break;
        case 303:
          v12 = @"ROUTING_TRAY_TRANSIT";
          break;
        case 304:
          v12 = @"ROUTING_TRAY_RIDESHARE";
          break;
        case 305:
          v12 = @"ROUTING_TRAY_CYCLING";
          break;
        case 306:
          v12 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
          break;
        case 401:
          v12 = @"NAV_TRAY_DRIVING";
          break;
        case 402:
          v12 = @"NAV_TRAY_WALKING";
          break;
        case 403:
          v12 = @"NAV_TRAY_TRANSIT";
          break;
        case 404:
          v12 = @"NAV_TRAY_CYCLING";
          break;
        case 501:
          v12 = @"MAP_PLACECARD";
          break;
        case 502:
          v12 = @"MAP_SEARCH";
          break;
        case 503:
          v12 = @"MAP_RESULTS";
          break;
        case 504:
          v12 = @"MAP_ROUTING";
          break;
        case 505:
          v12 = @"MAP_NAV";
          break;
        case 506:
          v12 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
          break;
        case 507:
          v12 = @"MAP_TRAFFIC_INCIDENT";
          break;
        case 508:
          v12 = @"MAP_FULL_SCREEN";
          break;
        case 509:
          v12 = @"MAP_DRIVE";
          break;
        case 510:
          v12 = @"MAP_LAUNCH_AND_GO";
          break;
        case 511:
          v12 = @"MAP_VIEW";
          break;
        case 601:
          v12 = @"MAPS_SETTINGS";
          break;
        case 602:
          v12 = @"MAPS_PREFERENCES";
          break;
        case 603:
          v12 = @"RAP";
          break;
        case 604:
          v12 = @"ROUTING_DRIVING_DETAILS";
          break;
        case 605:
          v12 = @"ROUTING_WALKING_DETAILS";
          break;
        case 606:
          v12 = @"ROUTING_TRANSIT_DETAILS";
          break;
        case 607:
          v12 = @"ROUTING_EDITOR";
          break;
        case 608:
          v12 = @"NAV_DRIVING_DETAILS";
          break;
        case 609:
          v12 = @"NAV_WALKING_DETAILS";
          break;
        case 610:
          v12 = @"NAV_TRANSIT_DETAILS";
          break;
        case 611:
          v12 = @"NAV_AUDIO_SETTINGS";
          break;
        case 612:
          v12 = @"PHOTO_VIEWER_ALL";
          break;
        case 613:
          v12 = @"PHOTO_VIEWER_SINGLE";
          break;
        case 614:
          v12 = @"ROUTE_OPTIONS_TRANSIT";
          break;
        case 615:
          v12 = @"TRAFFIC_INCIDENT_TRAY";
          break;
        case 616:
          v12 = @"NAV_DIRECTIONS_BANNER_DRIVING";
          break;
        case 617:
          v12 = @"NAV_DIRECTIONS_BANNER_WALKING";
          break;
        case 618:
          v12 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
          break;
        case 619:
          v12 = @"REFINE_SEARCH_SUGGESTION_AREA";
          break;
        case 620:
          v12 = @"ADD_PHOTO_SHEET";
          break;
        case 621:
          v12 = @"ADD_PLACE_SHEET";
          break;
        case 622:
          v12 = @"SHARE_SHEET";
          break;
        case 623:
          v12 = @"EDIT_LOCATION_SHEET";
          break;
        case 624:
          v12 = @"ADD_CONTACT_SHEET";
          break;
        case 625:
          v12 = @"EDIT_NAME_SHEET";
          break;
        case 626:
          v12 = @"DRIVING_NAV_SETTINGS";
          break;
        case 627:
          v12 = @"TRANSIT_SETTINGS";
          break;
        case 628:
          v12 = @"TRANSIT_ADVISORY_SHEET";
          break;
        case 629:
          v12 = @"REMOVE_CAR_SHEET";
          break;
        case 630:
          v12 = @"ROUTE_OPTIONS_DRIVING";
          break;
        case 631:
          v12 = @"ROUTE_OPTIONS_DATETIME";
          break;
        case 632:
          v12 = @"TRANSIT_ADVISORY_BANNER";
          break;
        case 633:
          v12 = @"BOOK_TABLE_SELECT_TIME";
          break;
        case 634:
          v12 = @"BOOK_TABLE_MORE_OPTIONS";
          break;
        case 635:
          v12 = @"BOOK_TABLE_READY";
          break;
        case 636:
          v12 = @"BOOK_TABLE_BOOKED";
          break;
        case 637:
          v12 = @"TRANSIT_LINE_CLUSTER_SHEET";
          break;
        case 638:
          v12 = @"TRANSIT_LINE_LIST_SHEET";
          break;
        case 639:
          v12 = @"TRANSIT_BALANCE_BANNER";
          break;
        case 640:
          v12 = @"WEATHER_ICON";
          break;
        case 641:
          v12 = @"HELP_IMPROVE_MAPS_DIALOG";
          break;
        case 642:
          v12 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
          break;
        case 643:
          v12 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
          break;
        case 644:
          v12 = @"FLOOR_PICKER";
          break;
        case 645:
          v12 = @"VENUE_LIST";
          break;
        case 646:
          v12 = @"AR_MODE";
          break;
        case 647:
          v12 = @"ROUTING_TRANSIT_TICKETS_SHEET";
          break;
        case 648:
          v12 = @"LINKED_SERVICE_HOURS";
          break;
        case 649:
          v12 = @"SHARE_ETA_TRAY";
          break;
        case 650:
          v12 = @"ETA_UPDATE_TRAY";
          break;
        case 651:
          v12 = @"SCHEDULECARD_TRAY";
          break;
        case 652:
          v12 = @"AR_NAV";
          break;
        case 653:
          v12 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 654:
          v12 = @"LOCATIONS_INSIDE";
          break;
        case 655:
          v12 = @"SIMILAR_LOCATIONS";
          break;
        case 656:
          v12 = @"LOCATIONS_AT_ADDRESS";
          break;
        case 657:
          v12 = @"NAV_DIRECTIONS_BANNER_CYCLING";
          break;
        case 658:
          v12 = @"ROUTE_OPTIONS_CYCLING";
          break;
        case 659:
          v12 = @"EV_CONNECTION_TRAY";
          break;
        case 660:
          v12 = @"VIRTUAL_GARAGE";
          break;
        case 661:
          v12 = @"VIRTUAL_GARAGE_BANNER";
          break;
        case 662:
          v12 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
          break;
        case 663:
          v12 = @"ADVISORY_DETAILS_PAGE";
          break;
        case 664:
          v12 = @"APP_CLIP_NOTIFICATION";
          break;
        case 665:
          v12 = @"PHOTO_VIEWER_GALLERY";
          break;
        case 666:
          v12 = @"RECOMMENDATION_CARD";
          break;
        case 667:
          v12 = @"INCIDENT_REPORT_TRAY";
          break;
        case 668:
          v12 = @"MAPS_WIDGET_DISPLAY";
          break;
        case 669:
          v12 = @"VISUAL_LOCATION_FRAMEWORK";
          break;
        case 670:
          v12 = @"APP_CLIP_TRAY";
          break;
        case 671:
          v12 = @"LICENSE_PLATE_SUGGESTION_PAGE";
          break;
        case 672:
          v12 = @"NOTIFICATION_ADD_PLATE";
          break;
        case 673:
          v12 = @"MAPS_RESULTS";
          break;
        case 674:
          v12 = @"MAPS_WIDGET_APP_CONNECTION";
          break;
        case 675:
          v12 = @"MAPS_WIDGET_CURRENT_LOCATION";
          break;
        case 676:
          v12 = @"MAPS_WIDGET_CURRENT_NAV";
          break;
        case 677:
          v12 = @"MAPS_WIDGET_ETA";
          break;
        case 678:
          v12 = @"MAPS_WIDGET_TRANSIT";
          break;
        case 679:
          v12 = @"MAPS_WIDGET_UPC_DESTINATION";
          break;
        case 680:
          v12 = @"WIDGET_CREATION_TRAY";
          break;
        case 681:
          v12 = @"MAPS_WIDGET_HOME";
          break;
        case 682:
          v12 = @"MAPS_WIDGET_PARKED_CAR";
          break;
        case 683:
          v12 = @"MAPS_WIDGET_POI";
          break;
        case 684:
          v12 = @"MAPS_WIDGET_SCHOOL";
          break;
        case 685:
          v12 = @"MAPS_WIDGET_WORK";
          break;
        case 686:
          v12 = @"AIRPORT_NOTIFICATION";
          break;
        case 687:
          v12 = @"MAPS_WIDGET_EMPTY";
          break;
        case 688:
          v12 = @"COARSE_LOCATION_OPTIONS_PROMPT";
          break;
        case 689:
          v12 = @"ALLOW_PRECISE_LOCATION_PROMPT";
          break;
        case 690:
          v12 = @"SHARE_MY_LOCATION";
          break;
        case 691:
          v12 = @"MARK_MY_LOCATION";
          break;
        case 692:
          v12 = @"AIRPORT_NOTIFICATION_WATCH";
          break;
        case 693:
          v12 = @"EDIT_FAVORITE";
          break;
        case 694:
          v12 = @"ROUTING_CYCLING_DETAILS";
          break;
        case 695:
          v12 = @"NAV_CYCLING_DETAILS";
          break;
        case 696:
          v12 = @"MAPS_SUGGESTION_WIDGET";
          break;
        case 697:
          v12 = @"ARP_TIPKIT";
          break;
        case 698:
          v12 = @"ARP_PRIVACY";
          break;
        case 699:
          v12 = @"ROUTE_OPTIONS_WALKING";
          break;
        case 701:
          v12 = @"SAFARI_SEARCH";
          break;
        case 702:
          v12 = @"SPOTLIGHT_SEARCH";
          break;
        case 703:
          v12 = @"SAFARI_MAPS_SEARCH_RESULTS";
          break;
        case 704:
          v12 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
          break;
        case 705:
          v12 = @"WIDGET_MAPS_DESTINATIONS";
          break;
        case 706:
          v12 = @"WIDGET_MAPS_TRANSIT";
          break;
        case 707:
          v12 = @"WIDGET_MAPS_NEARBY";
          break;
        case 708:
          v12 = @"NOTIFICATION_FIND_MY_CAR";
          break;
        case 709:
          v12 = @"CONTROL_CENTER";
          break;
        case 710:
          v12 = @"NOTIFICATION_CENTER";
          break;
        case 711:
          v12 = @"NOTIFICATION_DOOM";
          break;
        case 712:
          v12 = @"NOTIFICATION_VENUES";
          break;
        case 713:
          v12 = @"NOTIFICATION_RAP_UPDATE";
          break;
        case 714:
          v12 = @"NOTIFICATION_TRIP_CANCELLED";
          break;
        case 715:
          v12 = @"NOTIFICATION_STOP_SKIPPED";
          break;
        case 716:
          v12 = @"NOTIFICATION_TRIP_DELAYED";
          break;
        case 717:
          v12 = @"NOTIFICATION_RAP";
          break;
        case 718:
          v12 = @"NOTIFICATION_PROXY_AUTH";
          break;
        case 719:
          v12 = @"NOTIFICATION_PUSH_TO_DEVICE";
          break;
        case 720:
          v12 = @"NOTIFICATION_LOW_FUEL";
          break;
        case 721:
          v12 = @"NOTIFICATION_FIND_MY_CAR_RESET";
          break;
        case 722:
          v12 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
          break;
        case 723:
          v12 = @"NOTIFICATION_SHARED_ETA";
          break;
        case 724:
          v12 = @"NOTIFICATION_SHARED_ETA_UPDATE";
          break;
        case 725:
          v12 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
          break;
        case 726:
          v12 = @"ANNOUNCEMENT_TYPE_GENERAL";
          break;
        case 727:
          v12 = @"ANNOUNCEMENT_TYPE_FLYOVER";
          break;
        case 728:
          v12 = @"ANNOUNCEMENT_TYPE_TRANSIT";
          break;
        case 729:
          v12 = @"ANNOUNCEMENT_TYPE_VENUES";
          break;
        case 730:
          v12 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
          break;
        case 731:
          v12 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
          break;
        case 732:
          v12 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
          break;
        case 733:
          v12 = @"APP_SHEET";
          break;
        case 734:
          v12 = @"CZ_ADVISORY_DETAILS_PAGE";
          break;
        case 735:
          v12 = @"SHARE_ETA_CONTACT_TRAY";
          break;
        case 736:
          v12 = @"SIRI_SHARE_ETA";
          break;
        case 737:
          v12 = @"SIRI_SUGGESTION_SHARED_ETA";
          break;
        case 738:
          v12 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
          break;
        case 739:
          v12 = @"INCIDENT_ALERT_TRAY";
          break;
        case 740:
          v12 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
          break;
        case 741:
          v12 = @"RAP_INCIDENT_REPORT_VIEW";
          break;
        case 742:
          v12 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
          break;
        case 743:
          v12 = @"TRAFFIC_ADVISORY_SHEET";
          break;
        case 801:
          v12 = @"SIRI_PLUGIN_SNIPPET";
          break;
        case 802:
          v12 = @"SIRI_PLUGIN_COMMAND";
          break;
        case 803:
          v12 = @"SIRI_SEARCH_RESULT_LIST";
          break;
        case 804:
          v12 = @"SIRI_DISAMBIGUATION_LIST";
          break;
        case 805:
          v12 = @"SIRI_PLACE_SNIPPET";
          break;
        default:
          if (a3 != 901) {
            goto LABEL_1355;
          }
          v12 = @"CHROME";
          break;
      }
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    v33 = v11;
    __int16 v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_DEBUG, "state '%@' is processing (%@, %@)", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 8)) {
    return 1;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:(int)a3 | (unint64_t)(a2 << 32)];
  double v14 = *(double *)(a1 + 24);
  if (v14 != 0.0)
  {
    double v15 = *(double *)(a1 + 16);
    if (v15 != 0.0 && a4 - v15 >= v14)
    {
      v26 = GEOGetGEOAPSequenceStateAnalyticsLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_1862;
      }
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v28;
      v18 = "state '%@' timed out";
      goto LABEL_1861;
    }
  }
  if ([*(id *)(a1 + 56) containsObject:v13])
  {
    v26 = GEOGetGEOAPSequenceStateAnalyticsLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
LABEL_1862:

      uint64_t v25 = 3;
LABEL_1868:
      *(unsigned char *)(a1 + 8) = 1;
      goto LABEL_1869;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v17;
    v18 = "state '%@' aborts on input pair";
LABEL_1861:
    _os_log_impl(&dword_24FE56000, v26, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
    goto LABEL_1862;
  }
  if ([*(id *)(a1 + 48) containsObject:v13])
  {
    v19 = GEOGetGEOAPSequenceStateAnalyticsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v20;
      _os_log_impl(&dword_24FE56000, v19, OS_LOG_TYPE_DEBUG, "state '%@' fulfilled on input pair", buf, 0xCu);
    }

    if (*(double *)(a1 + 24) != 0.0) {
      *(double *)(a1 + 16) = a4;
    }
    if (*(_DWORD *)(a1 + 32))
    {
      v21 = GEOGetGEOAPSequenceStateAnalyticsLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        int v23 = *(_DWORD *)(a1 + 32);
        if (v23)
        {
          if (v23 == 1)
          {
            v24 = @"MAPS_INTERACTION_TYPE_POSITIVE_SEARCH_ENGAGEMENT";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 32));
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v24 = @"MAPS_INTERACTION_TYPE_UNKNOWN";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_24FE56000, v21, OS_LOG_TYPE_DEBUG, "state '%@' will emit %@", buf, 0x16u);
      }
      +[GEOAPPortal captureMapsInteractionWithInteractionType:*(unsigned int *)(a1 + 32) additionalStates:0 providedDropRate:0 completionQueue:0 completionBlock:0];
    }
    uint64_t v25 = 2;
    goto LABEL_1868;
  }
  uint64_t v25 = 1;
LABEL_1869:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionPairs, 0);
  objc_storeStrong((id *)&self->_admissionPairs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end