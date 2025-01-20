@interface GEOLogMsgStateCuratedCollection
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCollectionDetails;
- (BOOL)hasHorizontalIndex;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasPlacecardType;
- (BOOL)hasPublisherDetails;
- (BOOL)hasRepeatableSectionIndex;
- (BOOL)hasVerticalIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCollectionDetails)collectionDetails;
- (GEOLogMsgStateCuratedCollection)init;
- (GEOLogMsgStateCuratedCollection)initWithData:(id)a3;
- (GEOLogMsgStateCuratedCollection)initWithDictionary:(id)a3;
- (GEOLogMsgStateCuratedCollection)initWithJSON:(id)a3;
- (GEOPublisherDetails)publisherDetails;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)impossibleActionsAsString:(int)a3;
- (id)jsonRepresentation;
- (id)placecardTypeAsString:(int)a3;
- (id)possibleActionsAsString:(int)a3;
- (int)StringAsPlacecardType:(id)a3;
- (int)impossibleActionAtIndex:(unint64_t)a3;
- (int)impossibleActions;
- (int)localSearchProviderID;
- (int)placecardType;
- (int)possibleActionAtIndex:(unint64_t)a3;
- (int)possibleActions;
- (int)repeatableSectionIndex;
- (unint64_t)hash;
- (unint64_t)impossibleActionsCount;
- (unint64_t)possibleActionsCount;
- (unsigned)horizontalIndex;
- (unsigned)verticalIndex;
- (void)_readCollectionDetails;
- (void)_readImpossibleActions;
- (void)_readPossibleActions;
- (void)_readPublisherDetails;
- (void)addImpossibleAction:(int)a3;
- (void)addPossibleAction:(int)a3;
- (void)clearImpossibleActions;
- (void)clearPossibleActions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCollectionDetails:(id)a3;
- (void)setHasHorizontalIndex:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasPlacecardType:(BOOL)a3;
- (void)setHasRepeatableSectionIndex:(BOOL)a3;
- (void)setHasVerticalIndex:(BOOL)a3;
- (void)setHorizontalIndex:(unsigned int)a3;
- (void)setImpossibleActions:(int *)a3 count:(unint64_t)a4;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setPlacecardType:(int)a3;
- (void)setPossibleActions:(int *)a3 count:(unint64_t)a4;
- (void)setPublisherDetails:(id)a3;
- (void)setRepeatableSectionIndex:(int)a3;
- (void)setVerticalIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateCuratedCollection

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 publisherDetails];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        v8 = @"publisherDetails";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        v8 = @"publisher_details";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 collectionDetails];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"collectionDetails";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"collection_details";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ((*(_WORD *)(a1 + 112) & 4) != 0)
    {
      uint64_t v13 = *(int *)(a1 + 100);
      if v13 < 0x12 && ((0x2FFFFu >> v13))
      {
        v14 = off_1E53F82C0[v13];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v15 = @"placecardType";
      }
      else {
        v15 = @"placecard_type";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if (*(void *)(a1 + 48))
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v17 = (void *)(a1 + 40);
      if (*(void *)(a1 + 48))
      {
        unint64_t v18 = 0;
        do
        {
          uint64_t v19 = *(unsigned int *)(*v17 + 4 * v18);
          if ((int)v19 > 4000)
          {
            if ((int)v19 <= 10100)
            {
              if ((int)v19 > 7000)
              {
                switch((int)v19)
                {
                  case 9001:
                    v20 = @"TAP_WIDGET_ITEM";
                    break;
                  case 9002:
                    v20 = @"DISPLAY_NOTIFICATION";
                    break;
                  case 9003:
                    v20 = @"TAP_NOTIFICATION";
                    break;
                  case 9004:
                    v20 = @"EXPAND_NOTIFICATION";
                    break;
                  case 9005:
                    v20 = @"DISMISS_NOTIFICATION";
                    break;
                  case 9006:
                    v20 = @"OPEN_SEARCH";
                    break;
                  case 9007:
                    v20 = @"OPEN_PAN_VIEW";
                    break;
                  case 9008:
                    v20 = @"PAN_LEFT";
                    break;
                  case 9009:
                    v20 = @"PAN_UP";
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
                    goto LABEL_69;
                  case 9011:
                    v20 = @"PAN_DOWN";
                    break;
                  case 9012:
                    v20 = @"TAP_RECENT_DESTINATIONS";
                    break;
                  case 9013:
                    v20 = @"OPEN_DESTINATIONS";
                    break;
                  case 9014:
                    v20 = @"OPEN_FAVORITES";
                    break;
                  case 9015:
                    v20 = @"VIEW_NAV_OPTIONS";
                    break;
                  case 9016:
                    v20 = @"START_NAV_NO_GUIDANCE";
                    break;
                  case 9017:
                    v20 = @"TURN_OFF_GUIDANCE";
                    break;
                  case 9018:
                    v20 = @"TURN_ON_GUIDANCE";
                    break;
                  case 9019:
                    v20 = @"OPEN_KEYBOARD";
                    break;
                  case 9020:
                    v20 = @"SHARE_DESTINATION";
                    break;
                  case 9021:
                    v20 = @"START_NAV_AUTOMATED";
                    break;
                  case 9022:
                    v20 = @"SHARE_ETA";
                    break;
                  case 9023:
                    v20 = @"SELECT_GROUP";
                    break;
                  case 9024:
                    v20 = @"DESELECT_GROUP";
                    break;
                  case 9025:
                    v20 = @"SELECT_CONTACT";
                    break;
                  case 9026:
                    v20 = @"DESELECT_CONTACT";
                    break;
                  case 9027:
                    v20 = @"TAP_VIEW_CONTACTS";
                    break;
                  case 9028:
                    v20 = @"STOP_RECEIVING_ETA";
                    break;
                  case 9029:
                    v20 = @"DISPLAY_ANNOUNCEMENT";
                    break;
                  case 9030:
                    v20 = @"TAP_ANNOUNCEMENT";
                    break;
                  case 9031:
                    v20 = @"DISPLAY_CYCLING_NOTIFICATION";
                    break;
                  case 9032:
                    v20 = @"TAP_CYCLING_NOTIFICATION";
                    break;
                  case 9033:
                    v20 = @"SHARE_CYCLING_ETA";
                    break;
                  case 9034:
                    v20 = @"MANAGE_NOTIFICATIONS";
                    break;
                  case 9035:
                    v20 = @"PUNCH_OUT_PUBLISHER_REVIEW";
                    break;
                  case 9036:
                    v20 = @"SCROLL_FORWARD";
                    break;
                  case 9037:
                    v20 = @"SCROLL_BACKWARD";
                    break;
                  case 9038:
                    v20 = @"SHOW_ALL_CURATED_COLLECTIONS";
                    break;
                  case 9039:
                    v20 = @"TAP_LESS";
                    break;
                  case 9040:
                    v20 = @"TAP_MORE";
                    break;
                  case 9101:
                    v20 = @"DISPLAY_ADD_HOME_AND_WORK";
                    break;
                  case 9102:
                    v20 = @"TAP_ADD_HOME_AND_WORK";
                    break;
                  case 9103:
                    v20 = @"DISPLAY_ALLOW_FREQUENTS";
                    break;
                  case 9104:
                    v20 = @"TAP_ALLOW_FREQUENTS";
                    break;
                  case 9105:
                    v20 = @"DISPLAY_ALLOW_LOCATION";
                    break;
                  case 9106:
                    v20 = @"TAP_ALLOW_LOCATION";
                    break;
                  default:
                    switch((int)v19)
                    {
                      case 7001:
                        v20 = @"EXPAND_TRANSIT_SYSTEM";
                        break;
                      case 7002:
                        v20 = @"COLLAPSE_TRANSIT_SYSTEM";
                        break;
                      case 7003:
                        v20 = @"SHOW_MORE_DEPARTURES";
                        break;
                      case 7004:
                        v20 = @"VIEW_TRANSIT_LINE";
                        break;
                      case 7005:
                        v20 = @"CANCEL_VIEW_TRANSIT_LINE";
                        break;
                      case 7006:
                        v20 = @"TAP_TRANSIT_ATTRIBUTION";
                        break;
                      case 7007:
                        v20 = @"TAP_TRANSIT_ADVISORY";
                        break;
                      case 7008:
                        v20 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                        break;
                      case 7009:
                        v20 = @"SUBSCRIBE_LINE_INCIDENT";
                        break;
                      case 7010:
                        v20 = @"UNSUBSCRIBE_LINE_INCIDENT";
                        break;
                      case 7011:
                        v20 = @"TAP_NEAREST_STATION";
                        break;
                      case 7012:
                        v20 = @"TAP_NEAREST_STOP";
                        break;
                      case 7013:
                        v20 = @"TAP_CONNECTION";
                        break;
                      case 7014:
                        v20 = @"GET_TICKETS";
                        break;
                      case 7015:
                        v20 = @"OPEN_SCHEDULECARD_DATETIME";
                        break;
                      case 7016:
                        v20 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                        break;
                      case 7017:
                        v20 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                        break;
                      case 7018:
                        v20 = @"VIEW_ON_MAP";
                        break;
                      case 7019:
                        v20 = @"FORCE_UPDATE_DEPARTURE_INFO";
                        break;
                      case 7020:
                        v20 = @"TAP_TRANSIT_LINE_INFO";
                        break;
                      case 7021:
                        v20 = @"TAP_ATTRIBUTION_CELL";
                        break;
                      case 7022:
                        v20 = @"TAP_NEXT_DEPARTURES";
                        break;
                      case 7023:
                        v20 = @"VIEW_BANNER";
                        break;
                      case 7024:
                        v20 = @"GET_SHOWTIMES";
                        break;
                      case 7025:
                        v20 = @"MAKE_APPOINTMENT";
                        break;
                      case 7026:
                        v20 = @"RESERVE_PARKING";
                        break;
                      case 7027:
                        v20 = @"RESERVE_ROOM";
                        break;
                      case 7028:
                        v20 = @"WAITLIST";
                        break;
                      case 7029:
                        v20 = @"ORDER_TAKEOUT";
                        break;
                      case 7030:
                        v20 = @"RESERVE";
                        break;
                      default:
                        switch((int)v19)
                        {
                          case 8001:
                            v20 = @"INVOKE_SIRI_SNIPPET";
                            break;
                          case 8002:
                            v20 = @"INVOKE_SIRI_DISAMBIGUATION";
                            break;
                          case 8003:
                            v20 = @"SHOW_PLACE_DETAILS";
                            break;
                          case 8004:
                            v20 = @"ANSWER_REROUTE_SUGGESTION";
                            break;
                          case 8005:
                            v20 = @"SUGGEST_NAV_REROUTE";
                            break;
                          case 8006:
                            v20 = @"GET_NAV_STATUS";
                            break;
                          case 8007:
                            v20 = @"REPEAT_NAV_STATUS";
                            break;
                          case 8008:
                            v20 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                            break;
                          case 8009:
                            v20 = @"INVOKE_SIRI";
                            break;
                          case 8010:
                            v20 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                            break;
                          case 8011:
                            v20 = @"DISPLAY_NO_RESULTS_MESSAGE";
                            break;
                          default:
                            goto LABEL_69;
                        }
                        break;
                    }
                    break;
                }
              }
              else
              {
                switch((int)v19)
                {
                  case 6003:
                    v20 = @"GET_DIRECTIONS";
                    break;
                  case 6004:
                    v20 = @"TAP_FLYOVER_TOUR";
                    break;
                  case 6005:
                    v20 = @"REMOVE_PIN";
                    break;
                  case 6006:
                    v20 = @"TAP_PHOTO";
                    break;
                  case 6007:
                    v20 = @"TAP_MAPS_VIEW";
                    break;
                  case 6008:
                    v20 = @"TAP_ADDRESS";
                    break;
                  case 6009:
                    v20 = @"CALL";
                    break;
                  case 6010:
                    v20 = @"TAP_URL";
                    break;
                  case 6011:
                    v20 = @"SHOW_TODAY_HOURS";
                    break;
                  case 6012:
                    v20 = @"SHOW_ALL_HOURS";
                    break;
                  case 6013:
                    v20 = @"SHARE";
                    break;
                  case 6014:
                  case 6017:
                  case 6028:
                  case 6030:
                  case 6035:
                    goto LABEL_69;
                  case 6015:
                    v20 = @"ADD_TO_FAVORITES";
                    break;
                  case 6016:
                    v20 = @"ADD_CONTACT";
                    break;
                  case 6018:
                    v20 = @"PUNCH_OUT_PHOTO";
                    break;
                  case 6019:
                    v20 = @"PUNCH_OUT_USEFUL_TO_KNOW";
                    break;
                  case 6020:
                    v20 = @"PUNCH_OUT_OPEN_APP";
                    break;
                  case 6021:
                    v20 = @"PUNCH_OUT_SINGLE_REVIEW";
                    break;
                  case 6022:
                    v20 = @"PUNCH_OUT_CHECK_IN";
                    break;
                  case 6023:
                    v20 = @"PUNCH_OUT_MORE_INFO";
                    break;
                  case 6024:
                    v20 = @"PUNCH_OUT_WRITE_REVIEW";
                    break;
                  case 6025:
                    v20 = @"PUNCH_OUT_ADD_PHOTO";
                    break;
                  case 6026:
                    v20 = @"TAP_GRID_VIEW";
                    break;
                  case 6027:
                    v20 = @"EDIT_LOCATION";
                    break;
                  case 6029:
                    v20 = @"ADD_PHOTO";
                    break;
                  case 6031:
                    v20 = @"RETAKE";
                    break;
                  case 6032:
                    v20 = @"ADD_NOTE";
                    break;
                  case 6033:
                    v20 = @"REMOVE_CAR";
                    break;
                  case 6034:
                    v20 = @"EDIT_NAME";
                    break;
                  case 6036:
                    v20 = @"RESERVE_TABLE";
                    break;
                  case 6037:
                    v20 = @"ADD_TO_QUEUE";
                    break;
                  case 6038:
                    v20 = @"VIEW_BOOKED_TABLE";
                    break;
                  case 6039:
                    v20 = @"VIEW_QUEUED_TABLE";
                    break;
                  case 6040:
                    v20 = @"PUNCH_OUT_THIRD_PARTY_APP";
                    break;
                  case 6041:
                    v20 = @"PUNCH_OUT_LEGAL_LINK";
                    break;
                  case 6042:
                    v20 = @"TAP_PLACECARD_HEADER";
                    break;
                  case 6043:
                    v20 = @"REMOVE_FROM_FAVORITES";
                    break;
                  case 6044:
                    v20 = @"VIEW_CONTACT";
                    break;
                  case 6045:
                    v20 = @"CHAT";
                    break;
                  case 6046:
                    v20 = @"FIND_STORES";
                    break;
                  case 6047:
                    v20 = @"TAP_PARENT";
                    break;
                  case 6048:
                    v20 = @"SCROLL_LEFT_PHOTOS";
                    break;
                  case 6049:
                    v20 = @"SCROLL_RIGHT_PHOTOS";
                    break;
                  case 6050:
                    v20 = @"PUNCH_OUT";
                    break;
                  case 6051:
                    v20 = @"TAP_ENTER_MUNIN";
                    break;
                  case 6052:
                    v20 = @"TAP_RECOMMENDED_DISHES_PHOTO";
                    break;
                  case 6053:
                    v20 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
                    break;
                  case 6054:
                    v20 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
                    break;
                  case 6055:
                    v20 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
                    break;
                  case 6056:
                    v20 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
                    break;
                  case 6057:
                    v20 = @"SHOW_LINKED_SERVICE_HOURS";
                    break;
                  case 6058:
                    v20 = @"ENTER_LOOK_AROUND";
                    break;
                  case 6059:
                    v20 = @"EXIT_LOOK_AROUND";
                    break;
                  case 6060:
                    v20 = @"TAP_ENTER_LOOK_AROUND_VIEW";
                    break;
                  case 6061:
                    v20 = @"TAP_ENTER_LOOK_AROUND_PIP";
                    break;
                  case 6062:
                    v20 = @"EXPAND_LOOK_AROUND_VIEW";
                    break;
                  case 6063:
                    v20 = @"CLOSE_LOOK_AROUND";
                    break;
                  case 6064:
                    v20 = @"COLLAPSE_LOOK_AROUND_VIEW";
                    break;
                  case 6065:
                    v20 = @"TAP_SHOW_ACTIONS";
                    break;
                  case 6066:
                    v20 = @"TAP_HIDE_LABELS";
                    break;
                  case 6067:
                    v20 = @"TAP_SHOW_LABELS";
                    break;
                  case 6068:
                    v20 = @"TAP_SHOW_DETAILS";
                    break;
                  case 6069:
                    v20 = @"PAN_LOOK_AROUND";
                    break;
                  case 6070:
                    v20 = @"TAP_LOOK_AROUND_THUMBNAIL";
                    break;
                  case 6071:
                    v20 = @"TAP_LANDMARK";
                    break;
                  case 6072:
                    v20 = @"TAP_SCENE";
                    break;
                  case 6073:
                    v20 = @"SHOW_LINKED_BUSINESS_HOURS";
                    break;
                  case 6074:
                    v20 = @"TAP_PLACECARD_SHORTCUT";
                    break;
                  case 6075:
                    v20 = @"SHOW_ALL_LOCATIONS_INSIDE";
                    break;
                  case 6076:
                    v20 = @"SHOW_ALL_SIMILAR_LOCATIONS";
                    break;
                  case 6077:
                    v20 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
                    break;
                  case 6078:
                    v20 = @"TAP_PARENT_LOCATION";
                    break;
                  case 6079:
                    v20 = @"TAP_SIMILAR_LOCATION";
                    break;
                  case 6080:
                    v20 = @"TAP_LOCATION_INSIDE";
                    break;
                  case 6081:
                    v20 = @"TAP_LOCATION_AT_ADDRESS";
                    break;
                  case 6082:
                    v20 = @"CLOSE_ROUTE_GENIUS";
                    break;
                  case 6083:
                    v20 = @"LOAD_WEB_CONTENT";
                    break;
                  case 6084:
                    v20 = @"SCROLL_FORWARD_WEB_CONTENT";
                    break;
                  case 6085:
                    v20 = @"SCROLL_BACKWARD_WEB_CONTENT";
                    break;
                  case 6086:
                    v20 = @"TAP_WEB_CONTENT";
                    break;
                  case 6087:
                    v20 = @"SHOW_PHOTO_VIEWER";
                    break;
                  case 6088:
                    v20 = @"SHOW_LAST_PAGE";
                    break;
                  case 6089:
                    v20 = @"TAP_VIEW_APP";
                    break;
                  case 6090:
                    v20 = @"TAP_APP_CLIP";
                    break;
                  case 6091:
                    v20 = @"DEAD_BATTERY";
                    break;
                  case 6092:
                    v20 = @"DISMISS_LOW_BATTERY_ALERT";
                    break;
                  case 6093:
                    v20 = @"DISMISS_OUT_OF_RANGE_ALERT";
                    break;
                  case 6094:
                    v20 = @"FAILED_TO_LOAD_EV_STATUS";
                    break;
                  case 6095:
                    v20 = @"LOW_BATTERY_ALERT";
                    break;
                  case 6096:
                    v20 = @"PAUSE_ROUTE";
                    break;
                  case 6097:
                    v20 = @"TAP_ADD_STOP";
                    break;
                  case 6098:
                    v20 = @"TAP_CHARGE_POINT";
                    break;
                  case 6099:
                    v20 = @"TAP_OUT_OF_RANGE_ALERT";
                    break;
                  case 6100:
                    v20 = @"SCROLL_DOWN_PHOTOS";
                    break;
                  case 6101:
                    v20 = @"SCROLL_UP_PHOTOS";
                    break;
                  case 6102:
                    v20 = @"TAP_MORE_PHOTOS";
                    break;
                  case 6103:
                    v20 = @"TAP_TO_CONFIRM_INCIDENT";
                    break;
                  case 6104:
                    v20 = @"SHOW_INCIDENT";
                    break;
                  case 6105:
                    v20 = @"REVEAL_APP_CLIP";
                    break;
                  case 6106:
                    v20 = @"ORDER_DELIVERY";
                    break;
                  case 6107:
                    v20 = @"VIEW_MENU";
                    break;
                  case 6108:
                    v20 = @"TAP_EDIT_STOPS";
                    break;
                  case 6109:
                    v20 = @"LEARN_MORE_WEB_CONTENT";
                    break;
                  case 6110:
                    v20 = @"MAKE_APPOINTMENT_WEB_CONTENT";
                    break;
                  case 6111:
                    v20 = @"REVEAL_SHOWCASE";
                    break;
                  default:
                    switch((int)v19)
                    {
                      case 5001:
                        v20 = @"SHOW_MAPS_SETTINGS";
                        break;
                      case 5002:
                        v20 = @"TAP_STANDARD_MODE";
                        break;
                      case 5003:
                        v20 = @"TAP_TRANSIT_MODE";
                        break;
                      case 5004:
                        v20 = @"TAP_SATELLITE_MODE";
                        break;
                      case 5005:
                        v20 = @"SWITCH_ON_TRAFFIC";
                        break;
                      case 5006:
                        v20 = @"SWITCH_OFF_TRAFFIC";
                        break;
                      case 5007:
                        v20 = @"SWITCH_ON_LABELS";
                        break;
                      case 5008:
                        v20 = @"SWITCH_OFF_LABELS";
                        break;
                      case 5009:
                        v20 = @"SWITCH_ON_3D_MAP";
                        break;
                      case 5010:
                        v20 = @"SWITCH_OFF_3D_MAP";
                        break;
                      case 5011:
                        v20 = @"SWITCH_ON_WEATHER";
                        break;
                      case 5012:
                        v20 = @"SWITCH_OFF_WEATHER";
                        break;
                      case 5013:
                        v20 = @"REPORT_A_PROBLEM";
                        break;
                      case 5014:
                        v20 = @"ADD_PLACE";
                        break;
                      case 5015:
                        goto LABEL_69;
                      case 5016:
                        v20 = @"TAP_PREFERENCES";
                        break;
                      case 5017:
                        v20 = @"SWITCH_ON_TOLLS";
                        break;
                      case 5018:
                        v20 = @"SWITCH_OFF_TOLLS";
                        break;
                      case 5019:
                        v20 = @"SWITCH_ON_HIGHWAYS";
                        break;
                      case 5020:
                        v20 = @"SWITCH_OFF_HIGHWAYS";
                        break;
                      case 5021:
                        v20 = @"SWITCH_ON_HEADING";
                        break;
                      case 5022:
                        v20 = @"SWITCH_OFF_HEADING";
                        break;
                      case 5023:
                        v20 = @"SWITCH_ON_SPEED_LIMIT";
                        break;
                      case 5024:
                        v20 = @"SWITCH_OFF_SPEED_LIMIT";
                        break;
                      case 5025:
                        v20 = @"ELECT_DRIVING_MODE";
                        break;
                      case 5026:
                        v20 = @"ELECT_WALKING_MODE";
                        break;
                      case 5027:
                        v20 = @"ELECT_TRANSIT_MODE";
                        break;
                      case 5028:
                        v20 = @"ELECT_RIDESHARE_MODE";
                        break;
                      case 5029:
                        v20 = @"SWITCH_ON_FIND_MY_CAR";
                        break;
                      case 5030:
                        v20 = @"SWITCH_OFF_FIND_MY_CAR";
                        break;
                      case 5031:
                        v20 = @"MARK_MY_LOCATION";
                        break;
                      case 5032:
                        v20 = @"TAP_HYBRID_MODE";
                        break;
                      case 5033:
                        v20 = @"CHECK_AVOID_BUSY_ROADS";
                        break;
                      case 5034:
                        v20 = @"UNCHECK_AVOID_BUSY_ROADS";
                        break;
                      case 5035:
                        v20 = @"CHECK_AVOID_HILLS";
                        break;
                      case 5036:
                        v20 = @"UNCHECK_AVOID_HILLS";
                        break;
                      case 5037:
                        v20 = @"CHECK_AVOID_STAIRS";
                        break;
                      case 5038:
                        v20 = @"UNCHECK_AVOID_STAIRS";
                        break;
                      case 5039:
                        v20 = @"ELECT_CYCLING_MODE";
                        break;
                      default:
                        switch((int)v19)
                        {
                          case 4001:
                            v20 = @"RECENTER_CURRENT_LOCATION";
                            break;
                          case 4002:
                            v20 = @"TAP_HEADING_ON";
                            break;
                          case 4003:
                            v20 = @"TAP_HEADING_OFF";
                            break;
                          case 4004:
                            v20 = @"PUCK_DRIFT";
                            break;
                          case 4005:
                            v20 = @"PUCK_SNAP";
                            break;
                          case 4006:
                            v20 = @"SELECT_FLOOR";
                            break;
                          default:
                            goto LABEL_69;
                        }
                        break;
                    }
                    break;
                }
              }
            }
            else if ((int)v19 > 13000)
            {
              if ((int)v19 <= 16000)
              {
                if ((int)v19 <= 15000)
                {
                  switch((int)v19)
                  {
                    case 14001:
                      v20 = @"VIEW_APP";
                      break;
                    case 14002:
                      v20 = @"ENABLE";
                      break;
                    case 14003:
                      v20 = @"BOOK_RIDE";
                      break;
                    case 14004:
                      v20 = @"REQUEST_RIDE";
                      break;
                    case 14005:
                      v20 = @"CONTACT_DRIVER";
                      break;
                    case 14006:
                      v20 = @"CHANGE_PAYMENT";
                      break;
                    case 14007:
                      v20 = @"ENABLE_ALL_RIDESHARE_APPS";
                      break;
                    case 14008:
                      v20 = @"TAP_FOR_MORE_RIDES";
                      break;
                    case 14009:
                      v20 = @"SUBMIT_TRIP_FEEDBACK";
                      break;
                    default:
                      switch((int)v19)
                      {
                        case 13001:
                          v20 = @"SELECT_ADDRESS";
                          break;
                        case 13002:
                          v20 = @"ADD_ADDRESS";
                          break;
                        case 13003:
                          v20 = @"SELECT_LABEL";
                          break;
                        case 13004:
                          v20 = @"DELETE_ADDRESS";
                          break;
                        case 13005:
                          v20 = @"EDIT_ITEMS";
                          break;
                        case 13006:
                          v20 = @"RAP_FAVORITES";
                          break;
                        case 13007:
                          v20 = @"SORT_LIST_ITEM";
                          break;
                        default:
                          goto LABEL_69;
                      }
                      break;
                  }
                }
                else
                {
                  switch(v19)
                  {
                    case 0x3A99:
                      v20 = @"ORB_PEEK";
                      break;
                    case 0x3A9A:
                      v20 = @"ORB_POP";
                      break;
                    case 0x3A9B:
                      v20 = @"ORB_DISMISS";
                      break;
                    default:
LABEL_69:
                      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
                      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      break;
                  }
                }
              }
              else
              {
                switch((int)v19)
                {
                  case 17001:
                    v20 = @"START_DRAG";
                    break;
                  case 17002:
                    v20 = @"CANCEL_DRAG";
                    break;
                  case 17003:
                    v20 = @"COMPLETE_DRAG";
                    break;
                  case 17004:
                    v20 = @"START_DROP";
                    break;
                  case 17005:
                    v20 = @"CANCEL_DROP";
                    break;
                  case 17006:
                    v20 = @"COMPLETE_DROP";
                    break;
                  case 17007:
                    v20 = @"ANNOTATION_SELECT";
                    break;
                  case 17008:
                    v20 = @"ANNOTATION_SELECT_AUTO";
                    break;
                  case 17009:
                    v20 = @"ANNOTATION_SELECT_LIST";
                    break;
                  case 17010:
                    v20 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
                    break;
                  case 17011:
                    v20 = @"CALLOUT_FLYOVER_TOUR";
                    break;
                  case 17012:
                    v20 = @"CALLOUT_INFO";
                    break;
                  case 17013:
                    v20 = @"CALLOUT_NAV_TRANSIT";
                    break;
                  case 17014:
                    v20 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
                    break;
                  case 17015:
                    v20 = @"CALLOUT_VIEW_TRANSIT_LINE";
                    break;
                  case 17016:
                    v20 = @"DIRECTIONS_SELECT";
                    break;
                  case 17017:
                    v20 = @"DIRECTIONS_TRANSIT_CUSTOM";
                    break;
                  case 17018:
                    v20 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
                    break;
                  case 17019:
                    v20 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
                    break;
                  case 17020:
                    v20 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
                    break;
                  case 17021:
                    v20 = @"DIRECTIONS_TRANSIT_LATER";
                    break;
                  case 17022:
                    v20 = @"DIRECTIONS_TRANSIT_NOW";
                    break;
                  case 17023:
                    v20 = @"FLYOVER_NOTIFICATION_DISMISS";
                    break;
                  case 17024:
                    v20 = @"FLYOVER_NOTIFICATION_START";
                    break;
                  case 17025:
                    v20 = @"FLYOVER_TOUR_COMPLETED";
                    break;
                  case 17026:
                    v20 = @"FLYOVER_TOUR_END";
                    break;
                  case 17027:
                    v20 = @"FLYOVER_TOUR_NOTIFICATION";
                    break;
                  case 17028:
                    v20 = @"FLYOVER_TOUR_START";
                    break;
                  case 17029:
                    v20 = @"INFO_BOOKMARKS";
                    break;
                  case 17030:
                    v20 = @"INFO_CARD_DETACHED";
                    break;
                  case 17031:
                    v20 = @"INFO_CONTACTS";
                    break;
                  case 17032:
                    v20 = @"INFO_DIRECTIONS";
                    break;
                  case 17033:
                    v20 = @"INFO_DIRECTIONS_FROM";
                    break;
                  case 17034:
                    v20 = @"INFO_DIRECTIONS_TO";
                    break;
                  case 17035:
                    v20 = @"INFO_DISMISS";
                    break;
                  case 17036:
                    v20 = @"INFO_INFO";
                    break;
                  case 17037:
                    v20 = @"INFO_PHOTOS";
                    break;
                  case 17038:
                    v20 = @"INFO_REVIEWS";
                    break;
                  case 17039:
                    v20 = @"INFO_SHARE";
                    break;
                  case 17040:
                    v20 = @"INFO_SHARE_AIRDROP";
                    break;
                  case 17041:
                    v20 = @"INFO_SHARE_FACEBOOK";
                    break;
                  case 17042:
                    v20 = @"INFO_SHARE_MAIL";
                    break;
                  case 17043:
                    v20 = @"INFO_SHARE_MESSAGE";
                    break;
                  case 17044:
                    v20 = @"INFO_SHARE_TENCENTWEIBO";
                    break;
                  case 17045:
                    v20 = @"INFO_SHARE_WEIBO";
                    break;
                  case 17046:
                    v20 = @"INFO_YELP";
                    break;
                  case 17047:
                    v20 = @"MAPS_APP_LAUNCH";
                    break;
                  case 17048:
                    v20 = @"MAP_3D_OFF";
                    break;
                  case 17049:
                    v20 = @"MAP_3D_ON";
                    break;
                  case 17050:
                    v20 = @"MAP_OPTIONS_DROP_PIN";
                    break;
                  case 17051:
                    v20 = @"MAP_OPTIONS_HYBRID";
                    break;
                  case 17052:
                    v20 = @"MAP_OPTIONS_PRINT";
                    break;
                  case 17053:
                    v20 = @"MAP_OPTIONS_REMOVE_PIN";
                    break;
                  case 17054:
                    v20 = @"MAP_OPTIONS_SATELLITE";
                    break;
                  case 17055:
                    v20 = @"MAP_OPTIONS_STANDARD";
                    break;
                  case 17056:
                    v20 = @"MAP_OPTIONS_TRAFFIC_HIDE";
                    break;
                  case 17057:
                    v20 = @"MAP_OPTIONS_TRAFFIC_SHOW";
                    break;
                  case 17058:
                    v20 = @"MAP_OPTIONS_TRANSIT";
                    break;
                  case 17059:
                    v20 = @"MAP_TAP_FLYOVER_CITY";
                    break;
                  case 17060:
                    v20 = @"MAP_TAP_LINE";
                    break;
                  case 17061:
                    v20 = @"MAP_TAP_POI_TRANSIT";
                    break;
                  case 17062:
                    v20 = @"MAP_TAP_TRAFFIC_INCIDENT";
                    break;
                  case 17063:
                    v20 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
                    break;
                  case 17064:
                    v20 = @"MAP_USER_TRACKING_OFF";
                    break;
                  case 17065:
                    v20 = @"MAP_USER_TRACKING_ON";
                    break;
                  case 17066:
                    v20 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
                    break;
                  case 17067:
                    v20 = @"NAV_CLEAR";
                    break;
                  case 17068:
                    v20 = @"NAV_LIST";
                    break;
                  case 17069:
                    v20 = @"NAV_ROUTE_STEP_NEXT";
                    break;
                  case 17070:
                    v20 = @"NAV_ROUTE_STEP_PREV";
                    break;
                  case 17071:
                    v20 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
                    break;
                  case 17072:
                    v20 = @"ORB_DISPLAY_MENU";
                    break;
                  case 17073:
                    v20 = @"ORB_MENU_CALL";
                    break;
                  case 17074:
                    v20 = @"ORB_MENU_DIRECTIONS";
                    break;
                  case 17075:
                    v20 = @"ORB_MENU_DISMISS";
                    break;
                  case 17076:
                    v20 = @"ORB_MENU_SHARE";
                    break;
                  case 17077:
                    v20 = @"ORB_MENU_SHOW_PLACECARD";
                    break;
                  case 17078:
                    v20 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
                    break;
                  case 17079:
                    v20 = @"ORB_MENU_URL";
                    break;
                  case 17080:
                    v20 = @"ORB_PRESS";
                    break;
                  case 17081:
                    v20 = @"ORB_SPRINGBOARD_MARK_LOCATION";
                    break;
                  case 17082:
                    v20 = @"ORB_SPRINGBOARD_SEARCH";
                    break;
                  case 17083:
                    v20 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
                    break;
                  case 17084:
                    v20 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
                    break;
                  case 17085:
                    v20 = @"RAP_PERMISSION_CANCEL";
                    break;
                  case 17086:
                    v20 = @"RAP_PERMISSION_EMAIL_NA";
                    break;
                  case 17087:
                    v20 = @"RAP_PERMISSION_EMAIL_OK";
                    break;
                  case 17088:
                    v20 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
                    break;
                  case 17089:
                    v20 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
                    break;
                  case 17090:
                    v20 = @"RAP_PERMISSION_OK";
                    break;
                  case 17091:
                    v20 = @"SEARCH_BEGIN";
                    break;
                  case 17092:
                    v20 = @"SEARCH_CANCEL";
                    break;
                  case 17093:
                    v20 = @"SEARCH_SELECT";
                    break;
                  case 17094:
                    v20 = @"TRANSIT_LINE_SELECTION_DISMISS";
                    break;
                  case 17095:
                    v20 = @"TRANSIT_LINE_SELECTION_VIEW";
                    break;
                  case 17096:
                    v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
                    break;
                  case 17097:
                    v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
                    break;
                  case 17098:
                    v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
                    break;
                  case 17099:
                    v20 = @"UNKNOWN_ACTION";
                    break;
                  case 17100:
                    v20 = @"INFO_SHARE_TWITTER";
                    break;
                  case 17101:
                    v20 = @"INFO_TAP_POPULAR_APP_NEARBY";
                    break;
                  case 17102:
                    v20 = @"INFO_DIRECTIONS_WALK";
                    break;
                  case 17103:
                    v20 = @"INFO_DIRECTIONS_TRANSIT";
                    break;
                  case 17104:
                    v20 = @"INFO_DIRECTIONS_DRIVE";
                    break;
                  case 17105:
                    v20 = @"INFO_REPORT_A_PROBLEM";
                    break;
                  case 17106:
                    v20 = @"CALLOUT_NAV";
                    break;
                  case 17107:
                    v20 = @"RAP_PERMISSION_EMAIL_CANCEL";
                    break;
                  case 17108:
                    v20 = @"MAP_TAP_POI";
                    break;
                  default:
                    if (v19 == 16001)
                    {
                      v20 = @"SEARCH_IN_MAPS";
                    }
                    else
                    {
                      if (v19 != 90010) {
                        goto LABEL_69;
                      }
                      v20 = @"PAN_RIGHT";
                    }
                    break;
                }
              }
            }
            else
            {
              switch((int)v19)
              {
                case 10101:
                  v20 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
                  break;
                case 10102:
                  v20 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
                  break;
                case 10103:
                  v20 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
                  break;
                case 10104:
                  v20 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
                  break;
                case 10105:
                  v20 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
                  break;
                case 10106:
                  v20 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
                  break;
                case 10107:
                  v20 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
                  break;
                case 10108:
                  v20 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
                  break;
                case 10109:
                  v20 = @"RAP_CANCEL";
                  break;
                case 10110:
                  v20 = @"RAP_NEXT";
                  break;
                case 10111:
                  v20 = @"RAP_BACK";
                  break;
                case 10112:
                  v20 = @"RAP_SEND";
                  break;
                case 10113:
                  v20 = @"RAP_SKIP";
                  break;
                case 10114:
                  v20 = @"RAP_SHOW_MORE";
                  break;
                case 10115:
                  v20 = @"RAP_ADD_PHOTO";
                  break;
                case 10116:
                  v20 = @"RAP_MAP_INCORRECT";
                  break;
                case 10117:
                  v20 = @"RAP_BAD_DIRECTIONS";
                  break;
                case 10118:
                  v20 = @"RAP_TRANSIT_INFO_INCORRECT";
                  break;
                case 10119:
                  v20 = @"RAP_SATELLITE_IMAGE_PROBLEM";
                  break;
                case 10120:
                  v20 = @"RAP_SEARCH_RESULTS_INCORRECT";
                  break;
                case 10121:
                  v20 = @"RAP_ADD_A_PLACE";
                  break;
                case 10122:
                  v20 = @"RAP_HOME";
                  break;
                case 10123:
                  v20 = @"RAP_WORK";
                  break;
                case 10124:
                  v20 = @"RAP_OTHER";
                  break;
                case 10125:
                  v20 = @"RAP_LOCATION";
                  break;
                case 10126:
                  v20 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
                  break;
                case 10127:
                  v20 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
                  break;
                case 10128:
                  v20 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
                  break;
                case 10129:
                  v20 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
                  break;
                case 10130:
                  v20 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
                  break;
                case 10131:
                  v20 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
                  break;
                case 10132:
                  v20 = @"RAP_TRANSIT_DELAY";
                  break;
                case 10133:
                  v20 = @"RAP_LOCATION_CLOSED";
                  break;
                case 10134:
                  v20 = @"RAP_CLOSED_PERMANENTLY";
                  break;
                case 10135:
                  v20 = @"RAP_CLOSED_TEMPORARILY";
                  break;
                case 10136:
                  v20 = @"RAP_HOURS_HAVE_CHANGED";
                  break;
                case 10137:
                  v20 = @"RAP_SELECT_STATION";
                  break;
                case 10138:
                  v20 = @"RAP_SELECT_LINE";
                  break;
                case 10139:
                  v20 = @"RAP_SELECT_ACCESS_POINT";
                  break;
                case 10140:
                  v20 = @"RAP_SELECT_SEARCH";
                  break;
                case 10141:
                  v20 = @"RAP_PAN_MAP";
                  break;
                case 10142:
                  v20 = @"RAP_CENTER_MAP_ON_USER";
                  break;
                case 10143:
                  v20 = @"RAP_SEARCH_UNEXPECTED";
                  break;
                case 10144:
                  v20 = @"RAP_ADD_POI";
                  break;
                case 10145:
                  v20 = @"RAP_ADD_STREET_ADDRESS";
                  break;
                case 10146:
                  v20 = @"RAP_ADD_OTHER";
                  break;
                case 10147:
                  v20 = @"RAP_SELECT_CATEGORY";
                  break;
                case 10148:
                  v20 = @"RAP_TAKE_PHOTO";
                  break;
                case 10149:
                  v20 = @"RAP_RETAKE_PHOTO";
                  break;
                case 10150:
                  v20 = @"RAP_PLACE_DETAILS";
                  break;
                case 10151:
                  v20 = @"RAP_SATELLITE_IMAGE_OUTDATED";
                  break;
                case 10152:
                  v20 = @"RAP_SATELLITE_IMAGE_QUALITY";
                  break;
                case 10153:
                  v20 = @"RAP_SELECT_LABEL";
                  break;
                case 10154:
                  v20 = @"RAP_SELECT_ROUTE";
                  break;
                case 10155:
                  v20 = @"RAP_CLAIM_BUSINESS";
                  break;
                case 10156:
                  v20 = @"RAP_BRAND_DETAILS";
                  break;
                case 10157:
                  v20 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
                  break;
                case 10158:
                  v20 = @"RAP_LOOK_AROUND_LABELS_STREET";
                  break;
                case 10159:
                  v20 = @"RAP_LOOK_AROUND_BLURRING";
                  break;
                case 10160:
                  v20 = @"RAP_LOOK_AROUND_REMOVE_HOME";
                  break;
                case 10161:
                  v20 = @"RAP_LOOK_AROUND_LABELS_STORE";
                  break;
                case 10162:
                  v20 = @"RAP_LOOK_AROUND_PRIVACY";
                  break;
                case 10163:
                  v20 = @"RAP_INCORRECT_HOURS";
                  break;
                case 10164:
                  v20 = @"RAP_INCORRECT_ADDRESS";
                  break;
                case 10165:
                  v20 = @"RAP_EDIT_PLACE_DETAILS";
                  break;
                case 10166:
                  v20 = @"RAP_EDIT_PLACE_NAME";
                  break;
                case 10167:
                  v20 = @"RAP_EDIT_ADDRESS";
                  break;
                case 10168:
                  v20 = @"RAP_ADD_CATEGORY";
                  break;
                case 10169:
                  v20 = @"RAP_REMOVE_CATEGORY";
                  break;
                case 10170:
                  v20 = @"RAP_DESELECT_CATEGORY";
                  break;
                case 10171:
                  v20 = @"RAP_ADD_HOURS";
                  break;
                case 10172:
                  v20 = @"RAP_REMOVE_HOURS";
                  break;
                case 10173:
                  v20 = @"RAP_TAP_DAY_OF_WEEK";
                  break;
                case 10174:
                  v20 = @"RAP_TAP_24_HOURS_BUTTON";
                  break;
                case 10175:
                  v20 = @"RAP_TAP_OPEN_TIME";
                  break;
                case 10176:
                  v20 = @"RAP_TAP_CLOSED_TIME";
                  break;
                case 10177:
                  v20 = @"RAP_TAP_TEMPORARY_CLOSURE";
                  break;
                case 10178:
                  v20 = @"RAP_TAP_PERMANENTLY_CLOSED";
                  break;
                case 10179:
                  v20 = @"RAP_EDIT_WEBSITE";
                  break;
                case 10180:
                  v20 = @"RAP_EDIT_PHONE_NUMBER";
                  break;
                case 10181:
                  v20 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
                  break;
                case 10182:
                  v20 = @"RAP_ADD_COMMENTS";
                  break;
                case 10183:
                  v20 = @"RAP_EDIT_LOCATION";
                  break;
                case 10184:
                  v20 = @"RAP_VIEW_LOCATION";
                  break;
                case 10185:
                  v20 = @"RAP_ZOOM_IN";
                  break;
                case 10186:
                  v20 = @"RAP_ZOOM_OUT";
                  break;
                case 10187:
                  v20 = @"RAP_VIEW_ENTRY_POINTS";
                  break;
                case 10188:
                  v20 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
                  break;
                case 10189:
                  v20 = @"RAP_ADD_NEW_ENTRY_POINT";
                  break;
                case 10190:
                  v20 = @"RAP_REMOVE_ENTRY_POINT";
                  break;
                case 10191:
                  v20 = @"RAP_SELECT_ENTRY_POINT_TYPE";
                  break;
                default:
                  switch((int)v19)
                  {
                    case 11001:
                      v20 = @"EXIT_MAPS_LOWER_WRIST";
                      break;
                    case 11002:
                      v20 = @"TASK_READY";
                      break;
                    case 11003:
                      v20 = @"TAP_SEARCH";
                      break;
                    case 11004:
                      v20 = @"TAP_MY_LOCATION";
                      break;
                    case 11005:
                      v20 = @"SHOW_NEARBY";
                      break;
                    case 11006:
                      v20 = @"TAP_NEARBY";
                      break;
                    case 11007:
                      v20 = @"TAP_PROACTIVE";
                      break;
                    case 11008:
                      v20 = @"FORCE_PRESS";
                      break;
                    case 11009:
                      v20 = @"TAP_CONTACTS";
                      break;
                    case 11010:
                      v20 = @"TAP_TRANSIT";
                      break;
                    case 11011:
                      v20 = @"TAP_DICTATION";
                      break;
                    case 11012:
                      v20 = @"GET_DIRECTIONS_DRIVING";
                      break;
                    case 11013:
                      v20 = @"GET_DIRECTIONS_WALKING";
                      break;
                    case 11014:
                      v20 = @"GET_DIRECTIONS_TRANSIT";
                      break;
                    case 11015:
                      v20 = @"OPEN_STANDARD_MAP";
                      break;
                    case 11016:
                      v20 = @"OPEN_TRANSIT_MAP";
                      break;
                    case 11017:
                      v20 = @"START_NAV_AUTO";
                      break;
                    case 11018:
                      v20 = @"TAP_RECENT";
                      break;
                    case 11019:
                      v20 = @"TAP_FAVORITE";
                      break;
                    case 11020:
                      v20 = @"TAP_SCRIBBLE";
                      break;
                    case 11021:
                      v20 = @"TAP_VIEW_MAP";
                      break;
                    case 11022:
                      v20 = @"TAP_VIEW_TBT";
                      break;
                    case 11023:
                      v20 = @"VIEW_ROUTE_INFO";
                      break;
                    case 11024:
                      v20 = @"NAV_UNMUTE";
                      break;
                    case 11025:
                      v20 = @"NAV_MUTE";
                      break;
                    case 11026:
                      v20 = @"GET_DIRECTIONS_CYCLING";
                      break;
                    case 11027:
                      v20 = @"TAP_SEARCH_HOME";
                      break;
                    case 11028:
                      v20 = @"ROUTE_PAUSED_ON_WATCH";
                      break;
                    case 11029:
                      v20 = @"NEXT_STOP_TAPPED_ON_WATCH";
                      break;
                    default:
                      switch((int)v19)
                      {
                        case 12001:
                          v20 = @"VIEW_MORE_OPTIONS";
                          break;
                        case 12002:
                          v20 = @"SELECT_TIME";
                          break;
                        case 12003:
                          v20 = @"SHOW_NEXT_AVAILABLE";
                          break;
                        case 12004:
                          v20 = @"DECREASE_TABLE_SIZE";
                          break;
                        case 12005:
                          v20 = @"INCREASE_TABLE_SIZE";
                          break;
                        case 12006:
                          v20 = @"EDIT_BOOKING";
                          break;
                        case 12007:
                          v20 = @"EDIT_PHONE";
                          break;
                        case 12008:
                          v20 = @"ADD_SPECIAL_REQUEST";
                          break;
                        case 12009:
                          v20 = @"CHANGE_RESERVATION";
                          break;
                        case 12010:
                          v20 = @"LEARN_MORE";
                          break;
                        default:
                          goto LABEL_69;
                      }
                      break;
                  }
                  break;
              }
            }
          }
          else
          {
            v20 = @"UI_ACTION_UNKNOWN";
            switch((int)v19)
            {
              case 0:
                break;
              case 1:
                v20 = @"PULL_UP";
                break;
              case 2:
                v20 = @"PULL_DOWN";
                break;
              case 3:
                v20 = @"TAP";
                break;
              case 4:
                v20 = @"CLOSE";
                break;
              case 5:
                v20 = @"SWIPE_PREV";
                break;
              case 6:
                v20 = @"SWIPE_NEXT";
                break;
              case 7:
                v20 = @"SCROLL_UP";
                break;
              case 8:
                v20 = @"SCROLL_DOWN";
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
                goto LABEL_69;
              case 10:
                v20 = @"SHOW_MORE";
                break;
              case 11:
                v20 = @"SHOW_LESS";
                break;
              case 12:
                v20 = @"SWIPE_LEFT";
                break;
              case 13:
                v20 = @"SWIPE_RIGHT";
                break;
              case 14:
                v20 = @"MINIMIZE";
                break;
              case 15:
                v20 = @"TAP_PREV";
                break;
              case 16:
                v20 = @"TAP_NEXT";
                break;
              case 17:
                v20 = @"SUBMIT";
                break;
              case 18:
                v20 = @"CANCEL";
                break;
              case 19:
                v20 = @"ENTER_MAPS";
                break;
              case 20:
                v20 = @"EXIT_MAPS";
                break;
              case 21:
                v20 = @"REVEAL";
                break;
              case 22:
                v20 = @"OPEN_NEW_TAB";
                break;
              case 25:
                v20 = @"BACK";
                break;
              case 26:
                v20 = @"ACTIVATE";
                break;
              case 27:
                v20 = @"DEACTIVATE";
                break;
              case 28:
                v20 = @"AGREE";
                break;
              case 29:
                v20 = @"DISAGREE";
                break;
              case 30:
                v20 = @"SKIP_ANSWER";
                break;
              case 31:
                v20 = @"EXPAND";
                break;
              case 32:
                v20 = @"COLLAPSE";
                break;
              case 33:
                v20 = @"ENTER";
                break;
              case 34:
                v20 = @"EXIT";
                break;
              case 35:
                v20 = @"SCROLL_UP_INDEX_BAR";
                break;
              case 36:
                v20 = @"SCROLL_DOWN_INDEX_BAR";
                break;
              case 37:
                v20 = @"TOGGLE_ON";
                break;
              case 38:
                v20 = @"TOGGLE_OFF";
                break;
              case 39:
                v20 = @"LONG_PRESS";
                break;
              case 40:
                v20 = @"CLICK";
                break;
              case 41:
                v20 = @"TAP_DONE";
                break;
              case 42:
                v20 = @"TAP_CLOSE";
                break;
              case 43:
                v20 = @"SCROLL_LEFT";
                break;
              case 44:
                v20 = @"SCROLL_RIGHT";
                break;
              case 45:
                v20 = @"DISPLAY";
                break;
              case 46:
                v20 = @"OPEN_IN_APP";
                break;
              case 47:
                v20 = @"CONCEAL";
                break;
              case 48:
                v20 = @"TAP_DELETE";
                break;
              case 49:
                v20 = @"TAP_FILTER";
                break;
              case 50:
                v20 = @"TAP_SECONDARY_BUTTON";
                break;
              case 51:
                v20 = @"TAP_WIDGET_FOOD";
                break;
              case 52:
                v20 = @"TAP_WIDGET_GAS";
                break;
              case 53:
                v20 = @"TAP_WIDGET_LOADING";
                break;
              case 54:
                v20 = @"TAP_WIDGET_SEARCH";
                break;
              case 55:
                v20 = @"TAP_WIDGET_STORES";
                break;
              case 56:
                v20 = @"DISPLAY_ALLOW_ONCE_PROMPT";
                break;
              case 57:
                v20 = @"SHARE_CURRENT_LOCATION";
                break;
              case 58:
                v20 = @"SHARE_PHOTO";
                break;
              case 59:
                v20 = @"TAP_KEEP_OFF";
                break;
              case 60:
                v20 = @"TAP_PHOTO_CATEGORY";
                break;
              case 61:
                v20 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
                break;
              case 62:
                v20 = @"TAP_TURN_ON";
                break;
              case 63:
                v20 = @"DISPLAY_CYCLING_ANNOTATION";
                break;
              case 64:
                v20 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
                break;
              case 65:
                v20 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
                break;
              case 66:
                v20 = @"DISPLAY_WALKING_DEFAULT_OPTION";
                break;
              case 67:
                v20 = @"TAP_CYCLING_ANNOTATION";
                break;
              case 68:
                v20 = @"TAP_DRIVING_DEFAULT_OPTION";
                break;
              case 69:
                v20 = @"TAP_TRANSIT_DEFAULT_OPTION";
                break;
              case 70:
                v20 = @"TAP_WALKING_DEFAULT_OPTION";
                break;
              case 71:
                v20 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
                break;
              case 72:
                v20 = @"TAP_RIDESHARE_DEFAULT_OPTION";
                break;
              case 73:
                v20 = @"TAP_PERSONAL_COLLECTION";
                break;
              case 74:
                v20 = @"RESUME_ROUTE";
                break;
              case 75:
                v20 = @"DISPLAY_OUT_OF_RANGE_ALERT";
                break;
              case 76:
                v20 = @"TAP_ALLOW_ONCE";
                break;
              case 77:
                v20 = @"TAP_DO_NOT_ALLOW";
                break;
              case 78:
                v20 = @"ADD_RECCOMENDED_FAVORITE";
                break;
              case 79:
                v20 = @"ADD_RECOMMENDED_HOME_FAVORITE";
                break;
              case 80:
                v20 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
                break;
              case 81:
                v20 = @"ADD_RECOMMENDED_WORK_FAVORITE";
                break;
              case 82:
                v20 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
                break;
              case 83:
                v20 = @"CREATE_SCHOOL_FAVORITE";
                break;
              case 84:
                v20 = @"TAP_SCHOOL_FAVORITE";
                break;
              case 85:
                v20 = @"SELECT_ROUTING_TYPE_CYCLING";
                break;
              case 86:
                v20 = @"REPORT_PHOTO";
                break;
              case 87:
                v20 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
                break;
              case 88:
                v20 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
                break;
              case 89:
                v20 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
                break;
              case 90:
                v20 = @"CREATE_RECOMMENDED_FAVORITE";
                break;
              case 91:
                v20 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
                break;
              case 92:
                v20 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
                break;
              case 93:
                v20 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
                break;
              case 94:
                v20 = @"TAP_SMALL_WIDGET_ITEM";
                break;
              case 95:
                v20 = @"TAP_MEDIUM_WIDGET_ITEM";
                break;
              case 96:
                v20 = @"TAP_LARGE_WIDGET_ITEM";
                break;
              case 97:
                v20 = @"DISPLAY_ARP_TIPKIT";
                break;
              case 98:
                v20 = @"NEXT";
                break;
              case 99:
                v20 = @"TAP_RATE_AND_ADD_PHOTOS";
                break;
              case 100:
                v20 = @"TAP_TO_ADD_POSITIVE_RATING";
                break;
              case 101:
                v20 = @"TAP_TO_ADD_NEGATIVE_RATING";
                break;
              case 102:
                v20 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
                break;
              case 103:
                v20 = @"INVOKE_SIRI_PROMPT";
                break;
              case 104:
                v20 = @"ETA_SHARED_SUCCESSFULLY";
                break;
              case 105:
                v20 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
                break;
              case 106:
                v20 = @"CLEAR_INCIDENT";
                break;
              case 107:
                v20 = @"CONFIRM_INCIDENT";
                break;
              case 108:
                v20 = @"DISMISS_INCIDENT";
                break;
              case 109:
                v20 = @"INCIDENT_ALERT_TIMEOUT";
                break;
              case 110:
                v20 = @"INCIDENT_ALERT_TRAY_SHOWN";
                break;
              case 111:
                v20 = @"INCIDENT_CARD_SHOWN";
                break;
              case 112:
                v20 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
                break;
              case 113:
                v20 = @"INCIDENT_REPORT_TRAY_SHOWN";
                break;
              case 114:
                v20 = @"NAV_TRAY_DISCOVERY_SHOWN";
                break;
              case 115:
                v20 = @"TAP_TO_REPORT_INCIDENT";
                break;
              case 116:
                v20 = @"TAP_SHORTCUT";
                break;
              case 117:
                v20 = @"BLOCK_CONTACT";
                break;
              case 118:
                v20 = @"TAP_TO_ADD_RATING";
                break;
              case 119:
                v20 = @"AR_WALKING_LOCALIZATION_FAILED";
                break;
              case 120:
                v20 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
                break;
              case 121:
                v20 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
                break;
              case 122:
                v20 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
                break;
              case 123:
                v20 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
                break;
              case 124:
                v20 = @"RAISE_TO_ENTER_AR_WALKING";
                break;
              case 125:
                v20 = @"TAP_DISMISS";
                break;
              case 126:
                v20 = @"TAP_ENTER_AR_WALKING";
                break;
              case 127:
                v20 = @"TAP_OK";
                break;
              case 128:
                v20 = @"TAP_TRY_AGAIN";
                break;
              case 129:
                v20 = @"TAP_TURN_ON_IN_SETTINGS";
                break;
              case 130:
                v20 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
                break;
              case 131:
                v20 = @"VLF_CORRECTION_USER_ABANDON";
                break;
              case 132:
                v20 = @"AREA_EVENTS_ALERT";
                break;
              case 133:
                v20 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
                break;
              case 134:
                v20 = @"ACCEPT_EVENT_REROUTE";
                break;
              case 135:
                v20 = @"DISPLAY_AREA_EVENTS_ADVISORY";
                break;
              case 136:
                v20 = @"DISMISS_EVENT_REROUTE";
                break;
              case 137:
                v20 = @"PUNCH_OUT_EVENTS_LINK";
                break;
              case 138:
                v20 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
                break;
              case 139:
                v20 = @"ADJUST_GUIDANCE_SETTINGS";
                break;
              case 140:
                v20 = @"HIDE_DETAILS";
                break;
              case 141:
                v20 = @"SELECT_VOICE_GUIDANCE_ON";
                break;
              case 142:
                v20 = @"SELECT_VOICE_GUIDANCE_OFF";
                break;
              case 143:
                v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
                break;
              case 144:
                v20 = @"TAP_TEXT_LABEL";
                break;
              case 145:
                v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
                break;
              case 146:
                v20 = @"TAP_EXIT";
                break;
              case 147:
                v20 = @"TAP_CITY_MENU";
                break;
              case 148:
                v20 = @"CHECK_AVOID_TOLLS";
                break;
              case 149:
                v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
                break;
              case 150:
                v20 = @"TAP_ICLOUD";
                break;
              case 151:
                v20 = @"CHECK_AVOID_HIGHWAYS";
                break;
              case 152:
                v20 = @"TAP_FAVORITES";
                break;
              case 153:
                v20 = @"SELECT_DISTANCE_IN_KM";
                break;
              case 154:
                v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
                break;
              case 155:
                v20 = @"OPEN_FULL_CARD_FILTER";
                break;
              case 156:
                v20 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
                break;
              case 157:
                v20 = @"OPEN_SINGLE_CARD_FILTER";
                break;
              case 158:
                v20 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
                break;
              case 159:
                v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
                break;
              case 160:
                v20 = @"SESSIONLESS_REVEAL";
                break;
              case 161:
                v20 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
                break;
              case 162:
                v20 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
                break;
              case 163:
                v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
                break;
              case 164:
                v20 = @"ENTER_RAP_REPORT_MENU";
                break;
              case 165:
                v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
                break;
              case 166:
                v20 = @"TAP_MY_VEHICLES";
                break;
              case 167:
                v20 = @"SUBMIT_SINGLE_CARD_FILTER";
                break;
              case 168:
                v20 = @"SUBMIT_FULL_CARD_FILTER";
                break;
              case 169:
                v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
                break;
              case 170:
                v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
                break;
              case 171:
                v20 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
                break;
              case 172:
                v20 = @"TAP_ACCOUNT";
                break;
              case 173:
                v20 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
                break;
              case 174:
                v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
                break;
              case 175:
                v20 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
                break;
              case 176:
                v20 = @"RESULT_REFINEMENT_TOGGLE_OFF";
                break;
              case 177:
                v20 = @"TAP_CITY_CURATED_COLLECTIONS";
                break;
              case 178:
                v20 = @"TAP_REPORTS";
                break;
              case 179:
                v20 = @"TAP_RATINGS";
                break;
              case 180:
                v20 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
                break;
              case 181:
                v20 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
                break;
              case 182:
                v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
                break;
              case 183:
                v20 = @"SELECT_DISTANCE_IN_MILES";
                break;
              case 184:
                v20 = @"TAP_PRIVACY_STATEMENT";
                break;
              case 185:
                v20 = @"TAP_MAPS_SETTINGS";
                break;
              case 186:
                v20 = @"CANCEL_FULL_CARD_FILTER";
                break;
              case 187:
                v20 = @"TAP_LATEST_CURATED_COLLECTION";
                break;
              case 188:
                v20 = @"TAP_TEMPORAL_CURATED_COLLECTION";
                break;
              case 189:
                v20 = @"UNCHECK_AVOID_TOLLS";
                break;
              case 190:
                v20 = @"UNSELECT_SEARCH_REFINEMENT";
                break;
              case 191:
                v20 = @"TAP_RATING";
                break;
              case 192:
                v20 = @"TAP_ICLOUD_SIGN_IN";
                break;
              case 193:
                v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
                break;
              case 194:
                v20 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
                break;
              case 195:
                v20 = @"UNCHECK_AVOID_HIGHWAYS";
                break;
              case 196:
                v20 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
                break;
              case 197:
                v20 = @"RESULT_REFINEMENT_TOGGLE_ON";
                break;
              case 198:
                v20 = @"TAP_CONTEXT_LINE_HYPERLINK";
                break;
              case 199:
                v20 = @"TAP_MY_GUIDES";
                break;
              case 200:
                v20 = @"SELECT_SEARCH_REFINEMENT";
                break;
              case 201:
                v20 = @"SESSIONLESS_TAP_ACCOUNT";
                break;
              case 202:
                v20 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
                break;
              case 203:
                v20 = @"TAP_TRAVEL_PREFERENCES";
                break;
              case 204:
                v20 = @"SHOW_CURATED_COLLECTION_LIST";
                break;
              case 205:
                v20 = @"CANCEL_SINGLE_CARD_FILTER";
                break;
              case 206:
                v20 = @"DISPLAY_HFP_OPTION";
                break;
              case 207:
                v20 = @"SWITCH_OFF_HFP";
                break;
              case 208:
                v20 = @"SWITCH_ON_HFP";
                break;
              case 209:
                v20 = @"TAP_QUICK_ACTION_TRAY";
                break;
              case 210:
                v20 = @"SHOW_ALL_CITIES";
                break;
              case 211:
                v20 = @"TAP_ADD_NEARBY_TRANSIT";
                break;
              case 212:
                v20 = @"RESUME";
                break;
              case 213:
                v20 = @"DISPLAY_TIPKIT_PROMPT";
                break;
              case 214:
                v20 = @"TAP_NEARBY_TRANSIT_FAVORITE";
                break;
              case 215:
                v20 = @"TAP_DRIVING_MODE";
                break;
              case 216:
                v20 = @"SWITCH_ON_VOICE_GUIDANCE";
                break;
              case 217:
                v20 = @"DISMISS_TIPKIT_PROMPT";
                break;
              case 218:
                v20 = @"TAP_EXPAND_EXIT_DETAILS";
                break;
              case 219:
                v20 = @"TAP_NEARBY_TRANSIT_FILTER";
                break;
              case 220:
                v20 = @"TAP_MORE_DEPARTURES";
                break;
              case 221:
                v20 = @"RAP_INDIVIDUAL_PLACE";
                break;
              case 222:
                v20 = @"RAP_ADD_MAP";
                break;
              case 223:
                v20 = @"TAP_SUGGESTED_RAP";
                break;
              case 224:
                v20 = @"RAP_STREET_ISSUE";
                break;
              case 225:
                v20 = @"SWIPE_PIN_REVEAL";
                break;
              case 226:
                v20 = @"TAP_ADD_TIPKIT_FAVORITE";
                break;
              case 227:
                v20 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
                break;
              case 228:
                v20 = @"RAP_BAD_TRIP";
                break;
              case 229:
                v20 = @"RAP_PLACE_ISSUE";
                break;
              case 230:
                v20 = @"TAP_OPEN_MAPS";
                break;
              case 231:
                v20 = @"TAP_NEARBY_TRANSIT_RESULT";
                break;
              case 232:
                v20 = @"RAP_GUIDE";
                break;
              case 233:
                v20 = @"SWITCH_OFF_VOICE_GUIDANCE";
                break;
              case 234:
                v20 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
                break;
              case 235:
                v20 = @"SELECT_TRANSIT_STEP";
                break;
              case 236:
                v20 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
                break;
              case 237:
                v20 = @"TAP_SEE_MORE";
                break;
              case 238:
                v20 = @"RAP_IN_REVIEW";
                break;
              case 239:
                v20 = @"TAP_OPEN_MENU";
                break;
              case 240:
                v20 = @"TAP_NEARBY_TRANSIT";
                break;
              case 241:
                v20 = @"TAP_PIN_LINE";
                break;
              case 242:
                v20 = @"SWITCH_OFF_TRIP_FEEDBACK";
                break;
              case 243:
                v20 = @"RAP_GOOD_TRIP";
                break;
              case 244:
                v20 = @"TAP_FILTERED_CURATED_COLLECTION";
                break;
              case 245:
                v20 = @"SHARE_MY_LOCATION";
                break;
              case 246:
                v20 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
                break;
              case 247:
                v20 = @"DISPLAY_GENERIC_ADVISORY";
                break;
              case 248:
                v20 = @"ADVISORY_ALERT";
                break;
              case 249:
                v20 = @"PUNCH_OUT_LINK";
                break;
              case 250:
                v20 = @"TAP_GENERIC_ADVISORY";
                break;
              case 251:
                v20 = @"TAP_EXPLORE_MODE";
                break;
              case 252:
                v20 = @"TAP_UNPIN_LINE";
                break;
              case 253:
                v20 = @"MENU_UNPIN";
                break;
              case 254:
                v20 = @"MENU_PIN";
                break;
              case 255:
                v20 = @"SWIPE_PIN";
                break;
              case 256:
                v20 = @"SWIPE_UNPIN";
                break;
              case 257:
                v20 = @"TAP_MEDIA_APP";
                break;
              case 258:
                v20 = @"TAP_GUIDES_SUBACTION";
                break;
              case 259:
                v20 = @"TAP_MEDIA";
                break;
              case 260:
                v20 = @"PUNCH_OUT_MEDIA";
                break;
              case 261:
                v20 = @"SHOW_MEDIA_APP_MENU";
                break;
              case 262:
                v20 = @"SCROLL_RIGHT_RIBBON";
                break;
              case 263:
                v20 = @"SCROLL_LEFT_RIBBON";
                break;
              case 264:
                v20 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
                break;
              case 265:
                v20 = @"TAP_SHOW_MORE_TEXT";
                break;
              case 266:
                v20 = @"SCROLL_LEFT_RATINGS";
                break;
              case 267:
                v20 = @"SCROLL_LEFT_TEMPLATE_PLACE";
                break;
              case 268:
                v20 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
                break;
              case 269:
                v20 = @"SCROLL_RIGHT_RATINGS";
                break;
              case 270:
                v20 = @"TAP_ALLOW";
                break;
              case 271:
                v20 = @"TAP_GO_TO_SETTING";
                break;
              case 272:
                v20 = @"START_SUBMIT_REPORT";
                break;
              case 273:
                v20 = @"AUTHENTICATION_INFO_FAILURE";
                break;
              case 274:
                v20 = @"SUCCESSFULLY_SUBMIT_REPORT";
                break;
              case 275:
                v20 = @"FAILED_SUBMIT_REPORT";
                break;
              case 276:
                v20 = @"AUTHENTICATION_INFO_SUCCESS";
                break;
              case 277:
                v20 = @"EDIT_WAYPOINT";
                break;
              case 278:
                v20 = @"CLEAR_TEXT";
                break;
              case 279:
                v20 = @"REORDER_WAYPOINT";
                break;
              case 280:
                v20 = @"REMOVE_WAYPOINT";
                break;
              case 281:
                v20 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
                break;
              case 282:
                v20 = @"TAP_SHOWCASE_MENU";
                break;
              case 283:
                v20 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
                break;
              case 284:
                v20 = @"TAP_PHOTO_ALBUM";
                break;
              case 285:
                v20 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
                break;
              case 286:
                v20 = @"RAP_INLINE_ADD";
                break;
              case 287:
                v20 = @"RAP_TAP_EDIT";
                break;
              case 288:
                v20 = @"CLAIM_BUSINESS";
                break;
              case 289:
                v20 = @"RAP_EDIT_OPTIONS";
                break;
              case 290:
                v20 = @"TAP_IN_REVIEW_RAP";
                break;
              case 291:
                v20 = @"ORB_MENU_ADD_STOP";
                break;
              case 292:
                v20 = @"NEXT_STOP";
                break;
              case 293:
                v20 = @"ARRIVE_AT_WAYPOINT";
                break;
              case 294:
                v20 = @"REMOVE_STOP";
                break;
              case 295:
                v20 = @"DISPLAY_PAUSE_BUTTON";
                break;
              case 296:
                v20 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
                break;
              case 297:
                v20 = @"AUTO_ADVANCE_NEXT_STOP";
                break;
              case 298:
                v20 = @"ADD_INLINE_NEGATIVE_RATING";
                break;
              case 299:
                v20 = @"ADD_INLINE_POSITIVE_RATING";
                break;
              case 300:
                v20 = @"TAP_TO_ADD_RATING_AND_PHOTO";
                break;
              case 301:
                v20 = @"SUBMIT_RATINGS_AND_PHOTOS";
                break;
              case 302:
                v20 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
                break;
              case 303:
                v20 = @"TAP_RECENTLY_VIEWED_ROUTE";
                break;
              case 304:
                v20 = @"SHOW_ALL_RECENTS";
                break;
              case 305:
                v20 = @"RESUME_MULTIPOINT_ROUTE";
                break;
              case 306:
                v20 = @"DISMISS_TRANSIT_TIPKIT";
                break;
              case 307:
                v20 = @"DISPLAY_TRANSIT_TIPKIT";
                break;
              case 308:
                v20 = @"TAP_TRANSIT_TIPKIT";
                break;
              case 309:
                v20 = @"FILTER_EV";
                break;
              case 310:
                v20 = @"FILTER_SURCHARGE";
                break;
              case 311:
                v20 = @"FILTER_PREFER";
                break;
              case 312:
                v20 = @"TAP_WALKING_ANNOTATION";
                break;
              case 313:
                v20 = @"FILTER_AVOID";
                break;
              case 314:
                v20 = @"FILTER_TRANSPORTATION_MODE";
                break;
              case 315:
                v20 = @"FILTER_RECOMMENDED_ROUTES";
                break;
              case 316:
                v20 = @"FILTER_IC_FARES";
                break;
              case 317:
                v20 = @"FILTER_TRANSIT_CARD_FARES";
                break;
              case 318:
                v20 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
                break;
              case 319:
                v20 = @"TAP_NOTIFICATION_SETTINGS";
                break;
              case 320:
                v20 = @"TAP_ENABLE_NOTIFICATION";
                break;
              case 321:
                v20 = @"ARP_SUGGESTIONS_TURN_OFF";
                break;
              case 322:
                v20 = @"ARP_SUGGESTIONS_TURN_ON";
                break;
              case 323:
                v20 = @"DISMISS_ARP_SUGGESTION";
                break;
              case 324:
                v20 = @"RATINGS_AND_PHOTOS_TURN_ON";
                break;
              case 325:
                v20 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
                break;
              case 326:
                v20 = @"UNSELECT_SUGGESTED_PHOTOS";
                break;
              case 327:
                v20 = @"SUGGESTED_PHOTOS_SHOWN";
                break;
              case 328:
                v20 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 329:
                v20 = @"TAP_YOUR_PHOTOS_ALBUM";
                break;
              case 330:
                v20 = @"RATINGS_AND_PHOTOS_TURN_OFF";
                break;
              case 331:
                v20 = @"DELETE_PHOTO";
                break;
              case 332:
                v20 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 333:
                v20 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
                break;
              case 334:
                v20 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 335:
                v20 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
                break;
              case 336:
                v20 = @"SELECT_SUGGESTED_PHOTOS";
                break;
              case 337:
                v20 = @"ADD_STOP";
                break;
              case 338:
                v20 = @"SHOW_CREDIT_TURN_ON";
                break;
              case 339:
                v20 = @"DISPLAY_ARP_SUGGESTION";
                break;
              case 340:
                v20 = @"TAP_TO_ADD_PHOTO_CREDIT";
                break;
              case 341:
                v20 = @"SHOW_CREDIT_TURN_OFF";
                break;
              case 342:
                v20 = @"TAP_TO_EDIT_NICKNAME";
                break;
              case 343:
                v20 = @"SUBMIT_RATINGS";
                break;
              case 344:
                v20 = @"END_NAV_ON_WATCH";
                break;
              case 345:
                v20 = @"FILTER_EBIKE";
                break;
              case 356:
                v20 = @"ADD_STOP_SIRI";
                break;
              case 357:
                v20 = @"TAP_REVIEWED_RAP";
                break;
              case 358:
                v20 = @"TAP_OUTREACH_RAP";
                break;
              case 359:
                v20 = @"DISPLAY_SUGGESTED_ITEM";
                break;
              case 360:
                v20 = @"DISPLAY_HIKING_TIPKIT";
                break;
              case 361:
                v20 = @"DISMISS_HIKING_TIPKIT";
                break;
              case 362:
                v20 = @"TAP_HIKING_TIPKIT";
                break;
              case 363:
                v20 = @"SCROLL_LEFT_TRAILS";
                break;
              case 364:
                v20 = @"TAP_MORE_TRAILS";
                break;
              case 365:
                v20 = @"TAP_RELATED_TRAIL";
                break;
              case 366:
                v20 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
                break;
              case 367:
                v20 = @"SCROLL_RIGHT_TRAILS";
                break;
              case 368:
                v20 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
                break;
              case 369:
                v20 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
                break;
              case 370:
                v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
                break;
              case 371:
                v20 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
                break;
              case 372:
                v20 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
                break;
              case 373:
                v20 = @"EXPIRED_MAPS_REMOVED";
                break;
              case 374:
                v20 = @"UPDATE_ALL_DOWNLOAD_MAPS";
                break;
              case 375:
                v20 = @"TAP_EXPIRED_MAPS";
                break;
              case 376:
                v20 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
                break;
              case 377:
                v20 = @"MOVE_DOWNLOAD_MAPS";
                break;
              case 378:
                v20 = @"SAVE_RENAME_DOWNLOAD_MAPS";
                break;
              case 379:
                v20 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
                break;
              case 380:
                v20 = @"TAP_ENTER_OFFLINE_MAPS";
                break;
              case 381:
                v20 = @"TAP_DOWNLOAD_MAPS";
                break;
              case 382:
                v20 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
                break;
              case 383:
                v20 = @"DELETE_DOWNLOAD_MAPS";
                break;
              case 384:
                v20 = @"SLIDE_CLEAR_EXPIRED_MAPS";
                break;
              case 385:
                v20 = @"RENAME_DOWNLOAD_MAPS";
                break;
              case 386:
                v20 = @"RESIZE_DOWNLOAD_MAPS";
                break;
              case 387:
                v20 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
                break;
              case 388:
                v20 = @"RESTORE_EXPIRED_MAPS";
                break;
              case 389:
                v20 = @"CLEAR_EXPIRED_MAPS";
                break;
              case 390:
                v20 = @"TAP_USING_OFFLINE_BAR";
                break;
              case 391:
                v20 = @"UPDATE_DOWNLOAD_MAPS";
                break;
              case 392:
                v20 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
                break;
              case 393:
                v20 = @"DISPLAY_DOWNLOAD_MAPS";
                break;
              case 394:
                v20 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
                break;
              case 395:
                v20 = @"DISPLAY_EXPIRED_MAPS";
                break;
              case 396:
                v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
                break;
              case 397:
                v20 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
                break;
              case 398:
                v20 = @"SLIDE_RESTORE_EXPIRED_MAPS";
                break;
              case 399:
                v20 = @"ETA_SHARE_TRAY_TIMEOUT";
                break;
              case 400:
                v20 = @"START_ETA_SHARING";
                break;
              case 401:
                v20 = @"PERSON_LOCATION_UPDATE";
                break;
              case 402:
                v20 = @"STOP_ETA_SHARING";
                break;
              case 403:
                v20 = @"PUNCH_OUT_TO_FINDMY";
                break;
              case 404:
                v20 = @"TAP_PEOPLE_LOCATION";
                break;
              case 405:
                v20 = @"TAP_TO_REQUEST_LOCATION";
                break;
              case 406:
                v20 = @"ZOOM_OUT_CROWN";
                break;
              case 407:
                v20 = @"TAP_RESIZE_DOWNLOAD_MAPS";
                break;
              case 408:
                v20 = @"TAP_DELETE_DOWNLOAD_MAPS";
                break;
              case 409:
                v20 = @"SELECT_LIST_VIEW";
                break;
              case 410:
                v20 = @"SCROLL_RIGHT_TRAILHEADS";
                break;
              case 411:
                v20 = @"SWITCH_TO_ONLINE_MODE";
                break;
              case 412:
                v20 = @"TAP_RELATED_TRAILHEAD";
                break;
              case 413:
                v20 = @"SELECT_ELEVATION_VIEW";
                break;
              case 414:
                v20 = @"TOGGLE_PROXIMITY_RADIUS_ON";
                break;
              case 415:
                v20 = @"SEE_MORE_RECENTS";
                break;
              case 416:
                v20 = @"SEE_MORE_GUIDES";
                break;
              case 417:
                v20 = @"SELECT_CONTROLS";
                break;
              case 418:
                v20 = @"NO_SEARCH_RESULTS";
                break;
              case 419:
                v20 = @"TAP_VIEW_RESULTS_CAROUSEL";
                break;
              case 420:
                v20 = @"TAP_VIEW_RESULTS_LIST";
                break;
              case 421:
                v20 = @"SELECT_MAP_VIEW";
                break;
              case 422:
                v20 = @"SCROLL_LEFT_TRAILHEADS";
                break;
              case 423:
                v20 = @"SWITCH_TO_OFFLINE_MODE";
                break;
              case 424:
                v20 = @"ZOOM_IN_CROWN";
                break;
              case 425:
                v20 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
                break;
              case 426:
                v20 = @"TAP_MAP";
                break;
              case 427:
                v20 = @"SWIPE_DOWN";
                break;
              case 428:
                v20 = @"TAP_MORE_TRAILHEADS";
                break;
              case 429:
                v20 = @"TAP_ROUTE_OPTIONS";
                break;
              case 430:
                v20 = @"TAP_ROUTE_NAV_MAP";
                break;
              case 431:
                v20 = @"TAP_ROUTE_OVERVIEW_MAP";
                break;
              case 432:
                v20 = @"TAP_AUDIO";
                break;
              case 433:
                v20 = @"TAP_OPEN_PLACECARD";
                break;
              case 434:
                v20 = @"TAP_VIEW_STOPS";
                break;
              case 435:
                v20 = @"TAP_ROUTE_DETAILS";
                break;
              case 436:
                v20 = @"ADD_LPR_VEHICLE";
                break;
              case 437:
                v20 = @"TAP_ADD_VEHICLE";
                break;
              case 438:
                v20 = @"TAP_PLUG_TYPE";
                break;
              case 439:
                v20 = @"UNSELECT_SUGGESTED_NETWORK";
                break;
              case 440:
                v20 = @"TAP_SET_UP_LATER";
                break;
              case 441:
                v20 = @"ADD_EV_VEHICLE";
                break;
              case 442:
                v20 = @"UPDATE_COLOR";
                break;
              case 443:
                v20 = @"SELECT_OTHER_NETWORK";
                break;
              case 444:
                v20 = @"UNSELECT_NETWORK";
                break;
              case 445:
                v20 = @"TAP_BACK";
                break;
              case 446:
                v20 = @"TAP_CANCEL";
                break;
              case 447:
                v20 = @"UNSELECT_VEHICLE";
                break;
              case 448:
                v20 = @"UNSELECT_OTHER_NETWORK";
                break;
              case 449:
                v20 = @"DISPLAY_EV_TIPKIT";
                break;
              case 450:
                v20 = @"SELECT_NETWORK";
                break;
              case 451:
                v20 = @"TAP_EV_TIPKIT";
                break;
              case 452:
                v20 = @"TAP_CHOOSE_NETWORKS";
                break;
              case 453:
                v20 = @"TAP_ADD_NETWORK";
                break;
              case 454:
                v20 = @"FILTER_NETWORK";
                break;
              case 455:
                v20 = @"SELECT_SUGGESTED_NETWORK";
                break;
              case 456:
                v20 = @"TRANSIT_TO_WALKING";
                break;
              case 457:
                v20 = @"TRANSIT_TO_FINDMY";
                break;
              case 458:
                v20 = @"TAP_AC_KEYBOARD";
                break;
              case 459:
                v20 = @"REACH_PHOTO_STRIP_END";
                break;
              case 460:
                v20 = @"SEARCH_HERE_REVEAL";
                break;
              case 461:
                v20 = @"TAP_SEARCH_HERE";
                break;
              case 462:
                v20 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
                break;
              case 463:
                v20 = @"SAVE";
                break;
              case 464:
                v20 = @"TAP_MORE_CURATED_HIKES";
                break;
              case 465:
                v20 = @"CREATE_CUSTOM_ROUTE";
                break;
              case 466:
                v20 = @"TAP_TRY_NOW";
                break;
              case 467:
                v20 = @"TAP_CURATED_HIKE";
                break;
              case 468:
                v20 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
                break;
              case 469:
                v20 = @"ADD_TO_LIBRARY";
                break;
              case 470:
                v20 = @"START_HIKING";
                break;
              case 471:
                v20 = @"EDIT_NOTE";
                break;
              case 472:
                v20 = @"CREATE_NOTE";
                break;
              case 473:
                v20 = @"DELETE_PIN";
                break;
              case 474:
                v20 = @"ADD_ROUTE";
                break;
              case 475:
                v20 = @"ADD_PIN";
                break;
              case 476:
                v20 = @"REMOVE_FROM_COLLECTION";
                break;
              case 477:
                v20 = @"REMOVE_FROM_LIBRARY";
                break;
              case 478:
                v20 = @"TAP_ITEM";
                break;
              case 479:
                v20 = @"DELETE_ROUTE";
                break;
              case 480:
                v20 = @"TAP_ROUTE";
                break;
              case 481:
                v20 = @"TAP_DOWNLOAD_WATCH_MAPS";
                break;
              case 482:
                v20 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
                break;
              case 483:
                v20 = @"STOP_DOWNLOAD_ONTO_WATCH";
                break;
              case 484:
                v20 = @"TAP_DOWNLOAD_ONTO_WATCH";
                break;
              case 485:
                v20 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
                break;
              case 486:
                v20 = @"TAP_DOWNLOAD_NOW_WATCH";
                break;
              case 487:
                v20 = @"REVEAL_DETECTION_LIST";
                break;
              case 488:
                v20 = @"TAP_RECOMMENDATION";
                break;
              case 489:
                v20 = @"TAP_EXPAND";
                break;
              case 490:
                v20 = @"EXPAND_DETECTION_LIST";
                break;
              case 1001:
                v20 = @"PAN";
                break;
              case 1002:
                v20 = @"ZOOM_IN";
                break;
              case 1003:
                v20 = @"ZOOM_OUT";
                break;
              case 1004:
                v20 = @"ROTATE";
                break;
              case 1010:
                v20 = @"TAP_POI";
                break;
              case 1011:
                v20 = @"TAP_POI_TRANSIT";
                break;
              case 1017:
                v20 = @"TAP_POI_HIGHLIGHTED";
                break;
              case 1018:
                v20 = @"TAP_POI_CLUSTERED";
                break;
              case 1020:
                v20 = @"TAP_POI_DROPPED_PIN";
                break;
              case 1030:
                v20 = @"DROP_PIN";
                break;
              case 1031:
                v20 = @"TAP_INCIDENT";
                break;
              case 1032:
                v20 = @"TAP_TRANSIT_LINE";
                break;
              case 1033:
                v20 = @"TAP_POI_CALENDAR";
                break;
              case 1034:
                v20 = @"TAP_POI_CURRENT_LOCATION";
                break;
              case 1035:
                v20 = @"TAP_POI_TRANSIT_LINE";
                break;
              case 1036:
                v20 = @"TAP_POI_LANDMARK";
                break;
              case 1037:
                v20 = @"TAP_POI_FLYOVER";
                break;
              case 1038:
                v20 = @"TAP_TO_HIDE_TRAY";
                break;
              case 1039:
                v20 = @"TAP_TO_REVEAL_TRAY";
                break;
              case 1040:
                v20 = @"TAP_COMPASS";
                break;
              case 1041:
                v20 = @"PITCH_AWAY_FROM_GROUND";
                break;
              case 1042:
                v20 = @"PITCH_CLOSER_TO_GROUND";
                break;
              case 1043:
                v20 = @"ZOOM_IN_PINCH";
                break;
              case 1044:
                v20 = @"ZOOM_OUT_PINCH";
                break;
              case 1045:
                v20 = @"ZOOM_IN_DOUBLE_TAP";
                break;
              case 1046:
                v20 = @"ZOOM_OUT_TWO_FINGER_TAP";
                break;
              case 1047:
                v20 = @"ZOOM_IN_ONE_FINGER";
                break;
              case 1048:
                v20 = @"ZOOM_OUT_ONE_FINGER";
                break;
              case 1049:
                v20 = @"ZOOM_IN_BUTTON";
                break;
              case 1050:
                v20 = @"ZOOM_OUT_BUTTON";
                break;
              case 1051:
                v20 = @"TAP_TRAFFIC_CAMERA";
                break;
              case 1052:
                v20 = @"DISPLAY_INDOOR_MAP_BUTTON";
                break;
              case 1053:
                v20 = @"OPEN_INDOOR_MAP";
                break;
              case 1054:
                v20 = @"DISPLAY_VENUE_BROWSE_BUTTON";
                break;
              case 1055:
                v20 = @"TAP_VENUE_BROWSE_BUTTON";
                break;
              case 1056:
                v20 = @"ENTER_VENUE_EXPERIENCE";
                break;
              case 1057:
                v20 = @"EXIT_VENUE_EXPERIENCE";
                break;
              case 1058:
                v20 = @"ZOOM_IN_SCENE_PINCH";
                break;
              case 1059:
                v20 = @"ZOOM_OUT_SCENE_PINCH";
                break;
              case 1060:
                v20 = @"ZOOM_RESET";
                break;
              case 1061:
                v20 = @"TAP_SCENE_UNAVAILABLE_AREA";
                break;
              case 1062:
                v20 = @"TAP_TRANSIT_ACCESS_POINT";
                break;
              case 1063:
                v20 = @"TAP_SPEED_CAMERA";
                break;
              case 1064:
                v20 = @"TAP_RED_LIGHT_CAMERA";
                break;
              case 1065:
                v20 = @"TAP_GEO";
                break;
              default:
                switch((int)v19)
                {
                  case 2001:
                    v20 = @"TAP_SEARCH_FIELD";
                    break;
                  case 2002:
                    v20 = @"CLEAR_SEARCH";
                    break;
                  case 2003:
                    v20 = @"CANCEL_SEARCH";
                    break;
                  case 2004:
                    v20 = @"TAP_BROWSE_TOP_CATEGORY";
                    break;
                  case 2005:
                    v20 = @"TAP_BROWSE_SUB_CATEGORY";
                    break;
                  case 2006:
                    v20 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
                    break;
                  case 2007:
                    v20 = @"TAP_LIST_ITEM";
                    break;
                  case 2008:
                    v20 = @"SHARE_LIST_ITEM";
                    break;
                  case 2009:
                    v20 = @"DELETE_LIST_ITEM";
                    break;
                  case 2010:
                    v20 = @"EDIT_LIST_ITEM";
                    break;
                  case 2011:
                    v20 = @"REFRESH_SEARCH";
                    break;
                  case 2012:
                    v20 = @"REVEAL_LIST_ITEM_ACTIONS";
                    break;
                  case 2013:
                    v20 = @"HIDE_LIST_ITEM_ACTIONS";
                    break;
                  case 2014:
                    v20 = @"TAP_SEARCH_BUTTON";
                    break;
                  case 2015:
                    v20 = @"SHOW_SEARCH_RESULTS";
                    break;
                  case 2016:
                    v20 = @"SHOW_REFRESH_SEARCH";
                    break;
                  case 2017:
                    v20 = @"PASTE_TEXT";
                    break;
                  case 2018:
                    v20 = @"TAP_LIST_SUB_ITEM";
                    break;
                  case 2019:
                    v20 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2020:
                    v20 = @"TAP_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2021:
                    v20 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2022:
                    v20 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2023:
                    v20 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2024:
                    v20 = @"RETAINED_QUERY";
                    break;
                  case 2025:
                    v20 = @"TAP_RECENT_AC_SUGGESTION";
                    break;
                  case 2026:
                    v20 = @"CLEAR_RECENT_AC_SUGGESTION";
                    break;
                  case 2027:
                    v20 = @"DELETE_RECENT_AC_SUGGESTION";
                    break;
                  case 2028:
                  case 2029:
                    goto LABEL_69;
                  case 2030:
                    v20 = @"TAP_BROWSE_NEARBY_CATEGORY";
                    break;
                  case 2031:
                    v20 = @"TAP_SUBACTION";
                    break;
                  case 2032:
                    v20 = @"TAP_QUERY_BUILDING_ARROW";
                    break;
                  case 2033:
                    v20 = @"CLICK_ON_EDIT_SEARCH";
                    break;
                  case 2034:
                    v20 = @"REMOVE_CLIENT_AC_SUGGESTION";
                    break;
                  case 2035:
                    v20 = @"SHARE_CLIENT_AC_SUGGESTION";
                    break;
                  case 2036:
                    v20 = @"TAP_ON_MORE_RESULTS";
                    break;
                  case 2037:
                    v20 = @"SHARE_ITEM";
                    break;
                  case 2038:
                    v20 = @"HIDE_ITEM";
                    break;
                  case 2039:
                    v20 = @"TAP_SUGGESTED_ITEM";
                    break;
                  case 2040:
                    v20 = @"SHARE_SUGGESTED_ITEM";
                    break;
                  case 2041:
                    v20 = @"HIDE_SUGGESTED_ITEM";
                    break;
                  case 2042:
                    v20 = @"ADD_HOME_FAVORITE";
                    break;
                  case 2043:
                    v20 = @"ADD_WORK_FAVORITE";
                    break;
                  case 2044:
                    v20 = @"ADD_FAVORITE";
                    break;
                  case 2045:
                    v20 = @"VIEW_FAVORITES_LIST";
                    break;
                  case 2046:
                    v20 = @"TAP_HOME_FAVORITE";
                    break;
                  case 2047:
                    v20 = @"TAP_WORK_FAVORITE";
                    break;
                  case 2048:
                    v20 = @"TAP_CAR_FAVORITE";
                    break;
                  case 2049:
                    v20 = @"TAP_FAVORITE_ITEM";
                    break;
                  case 2050:
                    v20 = @"CREATE_HOME_FAVORITE";
                    break;
                  case 2051:
                    v20 = @"CREATE_WORK_FAVORITE";
                    break;
                  case 2052:
                    v20 = @"CREATE_FAVORITE";
                    break;
                  case 2053:
                    v20 = @"SUBMIT_FAVORITE_EDIT";
                    break;
                  case 2054:
                    v20 = @"ADD_RECOMMENDED_FAVORITE";
                    break;
                  case 2055:
                    v20 = @"EDIT_FAVORITE";
                    break;
                  case 2056:
                    v20 = @"REMOVE_FAVORITE";
                    break;
                  case 2057:
                    v20 = @"SHARE_FAVORITE";
                    break;
                  case 2058:
                    v20 = @"EDIT_FAVORITES";
                    break;
                  case 2059:
                    v20 = @"ADD_FAVORITE_PLACE";
                    break;
                  case 2060:
                    v20 = @"REMOVE_FAVORITE_PLACE";
                    break;
                  case 2061:
                    v20 = @"CHANGE_HOME_ADDRESS";
                    break;
                  case 2062:
                    v20 = @"CHANGE_WORK_ADDRESS";
                    break;
                  case 2063:
                    v20 = @"REFINE_LOCATION";
                    break;
                  case 2064:
                    v20 = @"TAP_RECENTLY_VIEWED_ITEM";
                    break;
                  case 2065:
                    v20 = @"SHOW_COLLECTION_LIST";
                    break;
                  case 2066:
                    v20 = @"SHOW_FAVORITES_COLLECTION";
                    break;
                  case 2067:
                    v20 = @"SHOW_COLLECTION";
                    break;
                  case 2068:
                    v20 = @"TAP_COLLECTION_ITEM";
                    break;
                  case 2069:
                    v20 = @"SHARE_COLLECTION_ITEM";
                    break;
                  case 2070:
                    v20 = @"REMOVE_COLLECTION_ITEM";
                    break;
                  case 2071:
                    v20 = @"SAVE_SHARED_COLLECTION";
                    break;
                  case 2072:
                    v20 = @"CREATE_NEW_COLLECTION";
                    break;
                  case 2073:
                    v20 = @"SAVE_TO_COLLECTION";
                    break;
                  case 2074:
                    v20 = @"EDIT_PHOTO";
                    break;
                  case 2075:
                    v20 = @"SORT_BY_NAME";
                    break;
                  case 2076:
                    v20 = @"SORT_BY_DISTANCE";
                    break;
                  case 2077:
                    v20 = @"SORT_BY_RECENT";
                    break;
                  case 2078:
                    v20 = @"AUTO_SHARE_ETA";
                    break;
                  case 2079:
                    v20 = @"CANCEL_AUTO_SHARE_ETA";
                    break;
                  case 2080:
                    v20 = @"MAP_SEARCH";
                    break;
                  case 2081:
                    v20 = @"DELETE_COLLECTION";
                    break;
                  case 2082:
                    v20 = @"SHARE_COLLECTION";
                    break;
                  case 2083:
                    v20 = @"SHOW_TRANSIT_LINES_COLLECTION";
                    break;
                  case 2084:
                    v20 = @"SHOW_MY_PLACES";
                    break;
                  case 2085:
                    v20 = @"SHOW_ALL_PLACES";
                    break;
                  case 2086:
                    v20 = @"TAP_RECENT_QUERY";
                    break;
                  case 2087:
                    v20 = @"TAP_QUERY_SUGGESTION";
                    break;
                  case 2088:
                    v20 = @"DELETE_CURATED_COLLECTION";
                    break;
                  case 2089:
                    v20 = @"FOLLOW";
                    break;
                  case 2090:
                    v20 = @"PUNCH_IN";
                    break;
                  case 2091:
                    v20 = @"SAVE_CURATED_COLLECTION";
                    break;
                  case 2092:
                    v20 = @"SCROLL_LEFT_COLLECTIONS";
                    break;
                  case 2093:
                    v20 = @"SCROLL_RIGHT_COLLECTIONS";
                    break;
                  case 2094:
                    v20 = @"SEE_ALL_CURATED_COLLECTION";
                    break;
                  case 2095:
                    v20 = @"SEE_ALL_PUBLISHERS";
                    break;
                  case 2096:
                    v20 = @"SHARE_CURATED_COLLECTION";
                    break;
                  case 2097:
                    v20 = @"SHARE_PUBLISHER";
                    break;
                  case 2098:
                    v20 = @"SHOW_MORE_COLLECTION";
                    break;
                  case 2099:
                    v20 = @"TAP_CURATED_COLLECTION";
                    break;
                  case 2100:
                    v20 = @"TAP_FEATURED_COLLECTIONS";
                    break;
                  case 2101:
                    v20 = @"TAP_LOCATION";
                    break;
                  case 2102:
                    v20 = @"TAP_PUBLISHER";
                    break;
                  case 2103:
                    v20 = @"TAP_PUBLISHER_APP";
                    break;
                  case 2104:
                    v20 = @"TAP_PUBLISHER_COLLECTIONS";
                    break;
                  case 2105:
                    v20 = @"UNFOLLOW";
                    break;
                  case 2106:
                    v20 = @"CHANGE_SCHOOL_ADDRESS";
                    break;
                  case 2107:
                    v20 = @"ADD_VEHICLE";
                    break;
                  case 2108:
                    v20 = @"DISPLAY_VIRTUAL_GARAGE";
                    break;
                  case 2109:
                    v20 = @"ENTER_VIRTUAL_GARAGE";
                    break;
                  case 2110:
                    v20 = @"PUNCH_OUT_MANUFACTURER_APP";
                    break;
                  case 2111:
                    v20 = @"REMOVE_LICENSE_PLATE";
                    break;
                  case 2112:
                    v20 = @"REMOVE_VEHICLE";
                    break;
                  case 2113:
                    v20 = @"SELECT_VEHICLE";
                    break;
                  case 2114:
                    v20 = @"SUBMIT_LICENSE_PLATE";
                    break;
                  case 2115:
                    v20 = @"TAP_ADD_LICENSE_PLATE";
                    break;
                  case 2116:
                    v20 = @"TAP_ADD_NEW_CAR";
                    break;
                  case 2117:
                    v20 = @"TAP_BANNER";
                    break;
                  case 2118:
                    v20 = @"TAP_CONNECT";
                    break;
                  case 2119:
                    v20 = @"TAP_CONTINUE";
                    break;
                  case 2120:
                    v20 = @"TAP_EDIT";
                    break;
                  case 2121:
                    v20 = @"TAP_NAME";
                    break;
                  case 2122:
                    v20 = @"TAP_NOT_NOW";
                    break;
                  case 2123:
                    v20 = @"TAP_OTHER_VEHICLE";
                    break;
                  case 2124:
                    v20 = @"TAP_REMOVE_LICENSE_PLATE";
                    break;
                  case 2125:
                    v20 = @"TAP_UPDATE_PLATE_NUMBER";
                    break;
                  case 2126:
                    v20 = @"TAP_VEHICLE";
                    break;
                  case 2127:
                    v20 = @"TAP_VEHICLE_NAME";
                    break;
                  case 2128:
                    v20 = @"UPDATE_NAME";
                    break;
                  case 2129:
                    v20 = @"DONE_TAKING_PHOTO";
                    break;
                  case 2130:
                    v20 = @"ENABLE_SHOW_PHOTO_NAME";
                    break;
                  case 2131:
                    v20 = @"SUBMIT_PHOTO";
                    break;
                  case 2132:
                    v20 = @"USE_PHOTO";
                    break;
                  case 2133:
                    v20 = @"ADD_RECOMMENDATION_TO_MAPS";
                    break;
                  case 2134:
                    v20 = @"CANCEL_PHOTO_SUBMISSION";
                    break;
                  case 2135:
                    v20 = @"CLOSE_RECOMMENDATION_CARD";
                    break;
                  case 2136:
                    v20 = @"EDIT_RATING";
                    break;
                  case 2137:
                    v20 = @"PROMPTED_TO_ADD_PHOTO";
                    break;
                  case 2138:
                    v20 = @"PROMPTED_TO_ADD_RATING";
                    break;
                  case 2139:
                    v20 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
                    break;
                  case 2140:
                    v20 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
                    break;
                  case 2141:
                    v20 = @"RETAKE_PHOTO";
                    break;
                  case 2142:
                    v20 = @"REVEAL_RECOMMENDATION_CARD";
                    break;
                  case 2143:
                    v20 = @"SUBMIT_NEGATIVE_RATING";
                    break;
                  case 2144:
                    v20 = @"SUBMIT_POSITIVE_RATING";
                    break;
                  case 2145:
                    v20 = @"TAP_CHOOSING_PHOTO";
                    break;
                  case 2146:
                    v20 = @"TAP_TAKE_NEW_PHOTO";
                    break;
                  case 2147:
                    v20 = @"TAP_TO_ADD_PHOTO";
                    break;
                  case 2148:
                    v20 = @"CANCEL_INCIDENT_REPORT";
                    break;
                  case 2149:
                    v20 = @"INCIDENT_REPORT_SUBMITTED";
                    break;
                  case 2150:
                    v20 = @"REPORTED_INCIDENT_NOT_RECEIVED";
                    break;
                  case 2151:
                    v20 = @"REPORTED_INCIDENT_RECEIVED";
                    break;
                  case 2152:
                    v20 = @"REPORT_INCIDENT";
                    break;
                  case 2153:
                    v20 = @"SELECT_INCIDENT_TYPE";
                    break;
                  case 2154:
                    v20 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
                    break;
                  case 2155:
                    v20 = @"TAP_TO_START_REPORT_INCIDENT";
                    break;
                  case 2156:
                    v20 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
                    break;
                  case 2157:
                    v20 = @"ATTEMPT_VLF_CORRECTION";
                    break;
                  case 2158:
                    v20 = @"DISMISS_VLF_PROMPT";
                    break;
                  case 2159:
                    v20 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
                    break;
                  case 2160:
                    v20 = @"VLF_CORRECTION_FAILED";
                    break;
                  case 2161:
                    v20 = @"VLF_CORRECTION_SUCCESSFUL";
                    break;
                  case 2162:
                    v20 = @"ENABLE_WIDGET_SUGGESTIONS";
                    break;
                  case 2163:
                    v20 = @"DISPLAY_CZ_ADVISORY";
                    break;
                  case 2164:
                    v20 = @"PUNCH_OUT_URL_PAY";
                    break;
                  case 2165:
                    v20 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
                    break;
                  case 2166:
                    v20 = @"DELETE_ITEM";
                    break;
                  case 2167:
                    v20 = @"CANCEL_REMOVE";
                    break;
                  case 2168:
                    v20 = @"DELETE_SUGGESTION";
                    break;
                  case 2169:
                    v20 = @"ADD_SCHOOL_FAVORITE";
                    break;
                  case 2170:
                    v20 = @"GO_TO_WEBSITE";
                    break;
                  case 2171:
                    v20 = @"TRY_AGAIN";
                    break;
                  case 2172:
                    v20 = @"CHECK_AUTO_RECORD_WORKOUT";
                    break;
                  case 2173:
                    v20 = @"CHECK_EBIKE";
                    break;
                  case 2174:
                    v20 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
                    break;
                  case 2175:
                    v20 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
                    break;
                  case 2176:
                    v20 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
                    break;
                  case 2177:
                    v20 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
                    break;
                  case 2178:
                    v20 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
                    break;
                  case 2179:
                    v20 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
                    break;
                  case 2180:
                    v20 = @"TAP_CYCLING_DEFAULT_OPTION";
                    break;
                  case 2181:
                    v20 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
                    break;
                  case 2182:
                    v20 = @"TAP_CYCLING_STAIRS_ADVISORY";
                    break;
                  case 2183:
                    v20 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
                    break;
                  case 2184:
                    v20 = @"UNCHECK_AUTO_RECORD_WORKOUT";
                    break;
                  case 2185:
                    v20 = @"UNCHECK_EBIKE";
                    break;
                  case 2186:
                    v20 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
                    break;
                  case 2187:
                    v20 = @"DISPLAY_LPR_ADVISORY";
                    break;
                  case 2188:
                    v20 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
                    break;
                  case 2189:
                    v20 = @"CREATE_WIDGET";
                    break;
                  case 2190:
                    v20 = @"REVEAL_WIDGET_TRAY";
                    break;
                  case 2191:
                    v20 = @"LPR_ERROR_CODE";
                    break;
                  case 2192:
                    v20 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
                    break;
                  case 2193:
                    v20 = @"TAP_CLEAR_RECENTLY_VIEWED";
                    break;
                  case 2194:
                    v20 = @"LPR_HARD_STOP";
                    break;
                  case 2195:
                    v20 = @"TAP_PUBLISHER_SUBACTION";
                    break;
                  case 2196:
                    v20 = @"CARPLAY_DISPLAY_ACTIVATED";
                    break;
                  case 2197:
                    v20 = @"CARPLAY_DISPLAY_DEACTIVATED";
                    break;
                  case 2198:
                    v20 = @"TAP_FEATURED_COLLECTION";
                    break;
                  case 2199:
                    v20 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
                    break;
                  case 2200:
                    v20 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
                    break;
                  default:
                    switch((int)v19)
                    {
                      case 3001:
                        v20 = @"START_NAV";
                        break;
                      case 3002:
                        v20 = @"END_NAV";
                        break;
                      case 3003:
                        v20 = @"OPEN_NAV_AUDIO_SETTINGS";
                        break;
                      case 3004:
                        v20 = @"VIEW_DETAILS";
                        break;
                      case 3005:
                        v20 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                        break;
                      case 3006:
                        v20 = @"OPEN_ROUTING_EDITOR";
                        break;
                      case 3007:
                        v20 = @"EDIT_ORIGIN";
                        break;
                      case 3008:
                        v20 = @"EDIT_DESTINATION";
                        break;
                      case 3009:
                        v20 = @"SWAP_ORIGIN_DESTINATION";
                        break;
                      case 3010:
                        v20 = @"OPEN_MORE_ROUTES";
                        break;
                      case 3011:
                        v20 = @"SELECT_ROUTING_TYPE_DRIVING";
                        break;
                      case 3012:
                        v20 = @"SELECT_ROUTING_TYPE_WALKING";
                        break;
                      case 3013:
                        v20 = @"SELECT_ROUTING_TYPE_TRANSIT";
                        break;
                      case 3014:
                        v20 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                        break;
                      case 3015:
                        v20 = @"SELECT_ROUTE";
                        break;
                      case 3016:
                        v20 = @"COLLAPSE_STEP_DETAILS_WALK";
                        break;
                      case 3017:
                        v20 = @"EXPAND_STEP_DETAILS_WALK";
                        break;
                      case 3018:
                        v20 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                        break;
                      case 3019:
                        v20 = @"EXPAND_STEP_DETAILS_TRANSIT";
                        break;
                      case 3020:
                        v20 = @"UNCHECK_BUS";
                        break;
                      case 3021:
                        v20 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                        break;
                      case 3022:
                        v20 = @"UNCHECK_COMMUTER_RAIL";
                        break;
                      case 3023:
                        v20 = @"UNCHECK_FERRY";
                        break;
                      case 3024:
                        v20 = @"CHECK_BUS";
                        break;
                      case 3025:
                        v20 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                        break;
                      case 3026:
                        v20 = @"CHECK_COMMUTER_RAIL";
                        break;
                      case 3027:
                        v20 = @"CHECK_FERRY";
                        break;
                      case 3028:
                        v20 = @"SELECT_LEAVE_AT";
                        break;
                      case 3029:
                        v20 = @"SELECT_ARRIVE_BY";
                        break;
                      case 3030:
                        v20 = @"SELECT_LEAVE_NOW";
                        break;
                      case 3031:
                        v20 = @"SELECT_DATE_TIME";
                        break;
                      case 3032:
                        v20 = @"SWITCH_ON_IC_FARES";
                        break;
                      case 3033:
                        v20 = @"SWITCH_OFF_IC_FARES";
                        break;
                      case 3034:
                        v20 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                        break;
                      case 3035:
                        v20 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                        break;
                      case 3036:
                        v20 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                        break;
                      case 3037:
                        v20 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                        break;
                      case 3038:
                        v20 = @"REVEAL_FROM_ROUTING";
                        break;
                      case 3039:
                        v20 = @"DISPLAY_ROUTES";
                        break;
                      case 3040:
                        v20 = @"CHECK_RECOMMENDED_ROUTES";
                        break;
                      case 3041:
                        v20 = @"UNCHECK_RECOMMENDED_ROUTES";
                        break;
                      case 3042:
                        v20 = @"CHECK_FASTER_TRIPS";
                        break;
                      case 3043:
                        v20 = @"UNCHECK_FASTER_TRIPS";
                        break;
                      case 3044:
                        v20 = @"CHECK_FEWER_TRANSFERS";
                        break;
                      case 3045:
                        v20 = @"UNCHECK_FEWER_TRANSFERS";
                        break;
                      case 3046:
                        v20 = @"CHECK_LESS_WALKING";
                        break;
                      case 3047:
                        v20 = @"UNCHECK_LESS_WALKING";
                        break;
                      case 3048:
                        v20 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                        break;
                      case 3049:
                        v20 = @"TAP_MORE_ROUTES";
                        break;
                      case 3050:
                        v20 = @"OPEN_NAV_OVERVIEW";
                        break;
                      case 3051:
                        v20 = @"RESUME_NAV_MANEUVER_VIEW";
                        break;
                      case 3052:
                        v20 = @"SELECT_AUDIO_VOLUME_SILENT";
                        break;
                      case 3053:
                        v20 = @"SELECT_AUDIO_VOLUME_LOW";
                        break;
                      case 3054:
                        v20 = @"SELECT_AUDIO_VOLUME_NORMAL";
                        break;
                      case 3055:
                        v20 = @"SELECT_AUDIO_VOLUME_LOUD";
                        break;
                      case 3056:
                        v20 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                        break;
                      case 3057:
                        v20 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                        break;
                      case 3058:
                        v20 = @"RESUME_PREV_NAV";
                        break;
                      case 3059:
                        v20 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                        break;
                      case 3060:
                        v20 = @"ACCEPT_REROUTE";
                        break;
                      case 3061:
                        v20 = @"DISMISS_REROUTE";
                        break;
                      case 3062:
                        v20 = @"ATTEMPT_END_NAV";
                        break;
                      case 3063:
                        v20 = @"DISPLAY_BANNER";
                        break;
                      case 3064:
                        v20 = @"VIEW_BANNER_DETAILS";
                        break;
                      case 3065:
                        v20 = @"ENTER_GUIDANCE";
                        break;
                      case 3066:
                        v20 = @"AUTO_ADVANCE_GUIDANCE";
                        break;
                      case 3067:
                        v20 = @"TAP_OPEN_WALLET";
                        break;
                      case 3068:
                        v20 = @"SELECT_VOICE_GUIDANCE_ALL";
                        break;
                      case 3069:
                        v20 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                        break;
                      case 3070:
                        v20 = @"SELECT_VOICE_GUIDANCE_NONE";
                        break;
                      case 3071:
                        v20 = @"DISPLAY_CARD";
                        break;
                      case 3072:
                        v20 = @"RENDER_ROUTE";
                        break;
                      case 3073:
                        v20 = @"DISPLAY_JUNCTION_VIEW";
                        break;
                      case 3074:
                        v20 = @"SELECT_DEPARTURE";
                        break;
                      case 3075:
                        v20 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                        break;
                      case 3076:
                        v20 = @"DEVICE_RAISE";
                        break;
                      case 3077:
                        v20 = @"ENTER_AR_NAV_VIEW";
                        break;
                      case 3078:
                        v20 = @"EXIT_AR_NAV_VIEW";
                        break;
                      case 3079:
                        v20 = @"AR_CALIBRATION_START";
                        break;
                      case 3080:
                        v20 = @"AR_CALIBRATION_FAILURE";
                        break;
                      case 3081:
                        v20 = @"AR_CALIBRATION_SUCCESS";
                        break;
                      case 3082:
                        v20 = @"DISPLAY_AR_NAV_ARROW";
                        break;
                      case 3083:
                        v20 = @"DISPLAY_AR_NAV_TURN_AROUND";
                        break;
                      case 3084:
                        v20 = @"DISPLAY_GO_OUTSIDE_BANNER";
                        break;
                      case 3085:
                        v20 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                        break;
                      case 3086:
                        v20 = @"DISPLAY_AR_NAV_ENDPOINT";
                        break;
                      case 3087:
                        v20 = @"DISPLAY_ADVISORY_BANNER";
                        break;
                      case 3088:
                        v20 = @"TAP_SHOW_ADVISORY_DETAILS";
                        break;
                      default:
                        goto LABEL_69;
                    }
                    break;
                }
                break;
            }
          }
          [v16 addObject:v20];

          ++v18;
          v17 = (void *)(a1 + 40);
        }
        while (v18 < *(void *)(a1 + 48));
      }
      if (a2) {
        v21 = @"possibleAction";
      }
      else {
        v21 = @"possible_action";
      }
      [v4 setObject:v16 forKey:v21];
    }
    if (*(void *)(a1 + 24))
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v23 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v24 = 0;
        do
        {
          uint64_t v25 = *(unsigned int *)(*v23 + 4 * v24);
          if ((int)v25 > 4000)
          {
            if ((int)v25 <= 10100)
            {
              if ((int)v25 > 7000)
              {
                switch((int)v25)
                {
                  case 9001:
                    v26 = @"TAP_WIDGET_ITEM";
                    break;
                  case 9002:
                    v26 = @"DISPLAY_NOTIFICATION";
                    break;
                  case 9003:
                    v26 = @"TAP_NOTIFICATION";
                    break;
                  case 9004:
                    v26 = @"EXPAND_NOTIFICATION";
                    break;
                  case 9005:
                    v26 = @"DISMISS_NOTIFICATION";
                    break;
                  case 9006:
                    v26 = @"OPEN_SEARCH";
                    break;
                  case 9007:
                    v26 = @"OPEN_PAN_VIEW";
                    break;
                  case 9008:
                    v26 = @"PAN_LEFT";
                    break;
                  case 9009:
                    v26 = @"PAN_UP";
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
                    goto LABEL_1405;
                  case 9011:
                    v26 = @"PAN_DOWN";
                    break;
                  case 9012:
                    v26 = @"TAP_RECENT_DESTINATIONS";
                    break;
                  case 9013:
                    v26 = @"OPEN_DESTINATIONS";
                    break;
                  case 9014:
                    v26 = @"OPEN_FAVORITES";
                    break;
                  case 9015:
                    v26 = @"VIEW_NAV_OPTIONS";
                    break;
                  case 9016:
                    v26 = @"START_NAV_NO_GUIDANCE";
                    break;
                  case 9017:
                    v26 = @"TURN_OFF_GUIDANCE";
                    break;
                  case 9018:
                    v26 = @"TURN_ON_GUIDANCE";
                    break;
                  case 9019:
                    v26 = @"OPEN_KEYBOARD";
                    break;
                  case 9020:
                    v26 = @"SHARE_DESTINATION";
                    break;
                  case 9021:
                    v26 = @"START_NAV_AUTOMATED";
                    break;
                  case 9022:
                    v26 = @"SHARE_ETA";
                    break;
                  case 9023:
                    v26 = @"SELECT_GROUP";
                    break;
                  case 9024:
                    v26 = @"DESELECT_GROUP";
                    break;
                  case 9025:
                    v26 = @"SELECT_CONTACT";
                    break;
                  case 9026:
                    v26 = @"DESELECT_CONTACT";
                    break;
                  case 9027:
                    v26 = @"TAP_VIEW_CONTACTS";
                    break;
                  case 9028:
                    v26 = @"STOP_RECEIVING_ETA";
                    break;
                  case 9029:
                    v26 = @"DISPLAY_ANNOUNCEMENT";
                    break;
                  case 9030:
                    v26 = @"TAP_ANNOUNCEMENT";
                    break;
                  case 9031:
                    v26 = @"DISPLAY_CYCLING_NOTIFICATION";
                    break;
                  case 9032:
                    v26 = @"TAP_CYCLING_NOTIFICATION";
                    break;
                  case 9033:
                    v26 = @"SHARE_CYCLING_ETA";
                    break;
                  case 9034:
                    v26 = @"MANAGE_NOTIFICATIONS";
                    break;
                  case 9035:
                    v26 = @"PUNCH_OUT_PUBLISHER_REVIEW";
                    break;
                  case 9036:
                    v26 = @"SCROLL_FORWARD";
                    break;
                  case 9037:
                    v26 = @"SCROLL_BACKWARD";
                    break;
                  case 9038:
                    v26 = @"SHOW_ALL_CURATED_COLLECTIONS";
                    break;
                  case 9039:
                    v26 = @"TAP_LESS";
                    break;
                  case 9040:
                    v26 = @"TAP_MORE";
                    break;
                  case 9101:
                    v26 = @"DISPLAY_ADD_HOME_AND_WORK";
                    break;
                  case 9102:
                    v26 = @"TAP_ADD_HOME_AND_WORK";
                    break;
                  case 9103:
                    v26 = @"DISPLAY_ALLOW_FREQUENTS";
                    break;
                  case 9104:
                    v26 = @"TAP_ALLOW_FREQUENTS";
                    break;
                  case 9105:
                    v26 = @"DISPLAY_ALLOW_LOCATION";
                    break;
                  case 9106:
                    v26 = @"TAP_ALLOW_LOCATION";
                    break;
                  default:
                    switch((int)v25)
                    {
                      case 7001:
                        v26 = @"EXPAND_TRANSIT_SYSTEM";
                        break;
                      case 7002:
                        v26 = @"COLLAPSE_TRANSIT_SYSTEM";
                        break;
                      case 7003:
                        v26 = @"SHOW_MORE_DEPARTURES";
                        break;
                      case 7004:
                        v26 = @"VIEW_TRANSIT_LINE";
                        break;
                      case 7005:
                        v26 = @"CANCEL_VIEW_TRANSIT_LINE";
                        break;
                      case 7006:
                        v26 = @"TAP_TRANSIT_ATTRIBUTION";
                        break;
                      case 7007:
                        v26 = @"TAP_TRANSIT_ADVISORY";
                        break;
                      case 7008:
                        v26 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                        break;
                      case 7009:
                        v26 = @"SUBSCRIBE_LINE_INCIDENT";
                        break;
                      case 7010:
                        v26 = @"UNSUBSCRIBE_LINE_INCIDENT";
                        break;
                      case 7011:
                        v26 = @"TAP_NEAREST_STATION";
                        break;
                      case 7012:
                        v26 = @"TAP_NEAREST_STOP";
                        break;
                      case 7013:
                        v26 = @"TAP_CONNECTION";
                        break;
                      case 7014:
                        v26 = @"GET_TICKETS";
                        break;
                      case 7015:
                        v26 = @"OPEN_SCHEDULECARD_DATETIME";
                        break;
                      case 7016:
                        v26 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                        break;
                      case 7017:
                        v26 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                        break;
                      case 7018:
                        v26 = @"VIEW_ON_MAP";
                        break;
                      case 7019:
                        v26 = @"FORCE_UPDATE_DEPARTURE_INFO";
                        break;
                      case 7020:
                        v26 = @"TAP_TRANSIT_LINE_INFO";
                        break;
                      case 7021:
                        v26 = @"TAP_ATTRIBUTION_CELL";
                        break;
                      case 7022:
                        v26 = @"TAP_NEXT_DEPARTURES";
                        break;
                      case 7023:
                        v26 = @"VIEW_BANNER";
                        break;
                      case 7024:
                        v26 = @"GET_SHOWTIMES";
                        break;
                      case 7025:
                        v26 = @"MAKE_APPOINTMENT";
                        break;
                      case 7026:
                        v26 = @"RESERVE_PARKING";
                        break;
                      case 7027:
                        v26 = @"RESERVE_ROOM";
                        break;
                      case 7028:
                        v26 = @"WAITLIST";
                        break;
                      case 7029:
                        v26 = @"ORDER_TAKEOUT";
                        break;
                      case 7030:
                        v26 = @"RESERVE";
                        break;
                      default:
                        switch((int)v25)
                        {
                          case 8001:
                            v26 = @"INVOKE_SIRI_SNIPPET";
                            break;
                          case 8002:
                            v26 = @"INVOKE_SIRI_DISAMBIGUATION";
                            break;
                          case 8003:
                            v26 = @"SHOW_PLACE_DETAILS";
                            break;
                          case 8004:
                            v26 = @"ANSWER_REROUTE_SUGGESTION";
                            break;
                          case 8005:
                            v26 = @"SUGGEST_NAV_REROUTE";
                            break;
                          case 8006:
                            v26 = @"GET_NAV_STATUS";
                            break;
                          case 8007:
                            v26 = @"REPEAT_NAV_STATUS";
                            break;
                          case 8008:
                            v26 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                            break;
                          case 8009:
                            v26 = @"INVOKE_SIRI";
                            break;
                          case 8010:
                            v26 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                            break;
                          case 8011:
                            v26 = @"DISPLAY_NO_RESULTS_MESSAGE";
                            break;
                          default:
                            goto LABEL_1405;
                        }
                        break;
                    }
                    break;
                }
              }
              else
              {
                switch((int)v25)
                {
                  case 6003:
                    v26 = @"GET_DIRECTIONS";
                    break;
                  case 6004:
                    v26 = @"TAP_FLYOVER_TOUR";
                    break;
                  case 6005:
                    v26 = @"REMOVE_PIN";
                    break;
                  case 6006:
                    v26 = @"TAP_PHOTO";
                    break;
                  case 6007:
                    v26 = @"TAP_MAPS_VIEW";
                    break;
                  case 6008:
                    v26 = @"TAP_ADDRESS";
                    break;
                  case 6009:
                    v26 = @"CALL";
                    break;
                  case 6010:
                    v26 = @"TAP_URL";
                    break;
                  case 6011:
                    v26 = @"SHOW_TODAY_HOURS";
                    break;
                  case 6012:
                    v26 = @"SHOW_ALL_HOURS";
                    break;
                  case 6013:
                    v26 = @"SHARE";
                    break;
                  case 6014:
                  case 6017:
                  case 6028:
                  case 6030:
                  case 6035:
                    goto LABEL_1405;
                  case 6015:
                    v26 = @"ADD_TO_FAVORITES";
                    break;
                  case 6016:
                    v26 = @"ADD_CONTACT";
                    break;
                  case 6018:
                    v26 = @"PUNCH_OUT_PHOTO";
                    break;
                  case 6019:
                    v26 = @"PUNCH_OUT_USEFUL_TO_KNOW";
                    break;
                  case 6020:
                    v26 = @"PUNCH_OUT_OPEN_APP";
                    break;
                  case 6021:
                    v26 = @"PUNCH_OUT_SINGLE_REVIEW";
                    break;
                  case 6022:
                    v26 = @"PUNCH_OUT_CHECK_IN";
                    break;
                  case 6023:
                    v26 = @"PUNCH_OUT_MORE_INFO";
                    break;
                  case 6024:
                    v26 = @"PUNCH_OUT_WRITE_REVIEW";
                    break;
                  case 6025:
                    v26 = @"PUNCH_OUT_ADD_PHOTO";
                    break;
                  case 6026:
                    v26 = @"TAP_GRID_VIEW";
                    break;
                  case 6027:
                    v26 = @"EDIT_LOCATION";
                    break;
                  case 6029:
                    v26 = @"ADD_PHOTO";
                    break;
                  case 6031:
                    v26 = @"RETAKE";
                    break;
                  case 6032:
                    v26 = @"ADD_NOTE";
                    break;
                  case 6033:
                    v26 = @"REMOVE_CAR";
                    break;
                  case 6034:
                    v26 = @"EDIT_NAME";
                    break;
                  case 6036:
                    v26 = @"RESERVE_TABLE";
                    break;
                  case 6037:
                    v26 = @"ADD_TO_QUEUE";
                    break;
                  case 6038:
                    v26 = @"VIEW_BOOKED_TABLE";
                    break;
                  case 6039:
                    v26 = @"VIEW_QUEUED_TABLE";
                    break;
                  case 6040:
                    v26 = @"PUNCH_OUT_THIRD_PARTY_APP";
                    break;
                  case 6041:
                    v26 = @"PUNCH_OUT_LEGAL_LINK";
                    break;
                  case 6042:
                    v26 = @"TAP_PLACECARD_HEADER";
                    break;
                  case 6043:
                    v26 = @"REMOVE_FROM_FAVORITES";
                    break;
                  case 6044:
                    v26 = @"VIEW_CONTACT";
                    break;
                  case 6045:
                    v26 = @"CHAT";
                    break;
                  case 6046:
                    v26 = @"FIND_STORES";
                    break;
                  case 6047:
                    v26 = @"TAP_PARENT";
                    break;
                  case 6048:
                    v26 = @"SCROLL_LEFT_PHOTOS";
                    break;
                  case 6049:
                    v26 = @"SCROLL_RIGHT_PHOTOS";
                    break;
                  case 6050:
                    v26 = @"PUNCH_OUT";
                    break;
                  case 6051:
                    v26 = @"TAP_ENTER_MUNIN";
                    break;
                  case 6052:
                    v26 = @"TAP_RECOMMENDED_DISHES_PHOTO";
                    break;
                  case 6053:
                    v26 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
                    break;
                  case 6054:
                    v26 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
                    break;
                  case 6055:
                    v26 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
                    break;
                  case 6056:
                    v26 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
                    break;
                  case 6057:
                    v26 = @"SHOW_LINKED_SERVICE_HOURS";
                    break;
                  case 6058:
                    v26 = @"ENTER_LOOK_AROUND";
                    break;
                  case 6059:
                    v26 = @"EXIT_LOOK_AROUND";
                    break;
                  case 6060:
                    v26 = @"TAP_ENTER_LOOK_AROUND_VIEW";
                    break;
                  case 6061:
                    v26 = @"TAP_ENTER_LOOK_AROUND_PIP";
                    break;
                  case 6062:
                    v26 = @"EXPAND_LOOK_AROUND_VIEW";
                    break;
                  case 6063:
                    v26 = @"CLOSE_LOOK_AROUND";
                    break;
                  case 6064:
                    v26 = @"COLLAPSE_LOOK_AROUND_VIEW";
                    break;
                  case 6065:
                    v26 = @"TAP_SHOW_ACTIONS";
                    break;
                  case 6066:
                    v26 = @"TAP_HIDE_LABELS";
                    break;
                  case 6067:
                    v26 = @"TAP_SHOW_LABELS";
                    break;
                  case 6068:
                    v26 = @"TAP_SHOW_DETAILS";
                    break;
                  case 6069:
                    v26 = @"PAN_LOOK_AROUND";
                    break;
                  case 6070:
                    v26 = @"TAP_LOOK_AROUND_THUMBNAIL";
                    break;
                  case 6071:
                    v26 = @"TAP_LANDMARK";
                    break;
                  case 6072:
                    v26 = @"TAP_SCENE";
                    break;
                  case 6073:
                    v26 = @"SHOW_LINKED_BUSINESS_HOURS";
                    break;
                  case 6074:
                    v26 = @"TAP_PLACECARD_SHORTCUT";
                    break;
                  case 6075:
                    v26 = @"SHOW_ALL_LOCATIONS_INSIDE";
                    break;
                  case 6076:
                    v26 = @"SHOW_ALL_SIMILAR_LOCATIONS";
                    break;
                  case 6077:
                    v26 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
                    break;
                  case 6078:
                    v26 = @"TAP_PARENT_LOCATION";
                    break;
                  case 6079:
                    v26 = @"TAP_SIMILAR_LOCATION";
                    break;
                  case 6080:
                    v26 = @"TAP_LOCATION_INSIDE";
                    break;
                  case 6081:
                    v26 = @"TAP_LOCATION_AT_ADDRESS";
                    break;
                  case 6082:
                    v26 = @"CLOSE_ROUTE_GENIUS";
                    break;
                  case 6083:
                    v26 = @"LOAD_WEB_CONTENT";
                    break;
                  case 6084:
                    v26 = @"SCROLL_FORWARD_WEB_CONTENT";
                    break;
                  case 6085:
                    v26 = @"SCROLL_BACKWARD_WEB_CONTENT";
                    break;
                  case 6086:
                    v26 = @"TAP_WEB_CONTENT";
                    break;
                  case 6087:
                    v26 = @"SHOW_PHOTO_VIEWER";
                    break;
                  case 6088:
                    v26 = @"SHOW_LAST_PAGE";
                    break;
                  case 6089:
                    v26 = @"TAP_VIEW_APP";
                    break;
                  case 6090:
                    v26 = @"TAP_APP_CLIP";
                    break;
                  case 6091:
                    v26 = @"DEAD_BATTERY";
                    break;
                  case 6092:
                    v26 = @"DISMISS_LOW_BATTERY_ALERT";
                    break;
                  case 6093:
                    v26 = @"DISMISS_OUT_OF_RANGE_ALERT";
                    break;
                  case 6094:
                    v26 = @"FAILED_TO_LOAD_EV_STATUS";
                    break;
                  case 6095:
                    v26 = @"LOW_BATTERY_ALERT";
                    break;
                  case 6096:
                    v26 = @"PAUSE_ROUTE";
                    break;
                  case 6097:
                    v26 = @"TAP_ADD_STOP";
                    break;
                  case 6098:
                    v26 = @"TAP_CHARGE_POINT";
                    break;
                  case 6099:
                    v26 = @"TAP_OUT_OF_RANGE_ALERT";
                    break;
                  case 6100:
                    v26 = @"SCROLL_DOWN_PHOTOS";
                    break;
                  case 6101:
                    v26 = @"SCROLL_UP_PHOTOS";
                    break;
                  case 6102:
                    v26 = @"TAP_MORE_PHOTOS";
                    break;
                  case 6103:
                    v26 = @"TAP_TO_CONFIRM_INCIDENT";
                    break;
                  case 6104:
                    v26 = @"SHOW_INCIDENT";
                    break;
                  case 6105:
                    v26 = @"REVEAL_APP_CLIP";
                    break;
                  case 6106:
                    v26 = @"ORDER_DELIVERY";
                    break;
                  case 6107:
                    v26 = @"VIEW_MENU";
                    break;
                  case 6108:
                    v26 = @"TAP_EDIT_STOPS";
                    break;
                  case 6109:
                    v26 = @"LEARN_MORE_WEB_CONTENT";
                    break;
                  case 6110:
                    v26 = @"MAKE_APPOINTMENT_WEB_CONTENT";
                    break;
                  case 6111:
                    v26 = @"REVEAL_SHOWCASE";
                    break;
                  default:
                    switch((int)v25)
                    {
                      case 5001:
                        v26 = @"SHOW_MAPS_SETTINGS";
                        break;
                      case 5002:
                        v26 = @"TAP_STANDARD_MODE";
                        break;
                      case 5003:
                        v26 = @"TAP_TRANSIT_MODE";
                        break;
                      case 5004:
                        v26 = @"TAP_SATELLITE_MODE";
                        break;
                      case 5005:
                        v26 = @"SWITCH_ON_TRAFFIC";
                        break;
                      case 5006:
                        v26 = @"SWITCH_OFF_TRAFFIC";
                        break;
                      case 5007:
                        v26 = @"SWITCH_ON_LABELS";
                        break;
                      case 5008:
                        v26 = @"SWITCH_OFF_LABELS";
                        break;
                      case 5009:
                        v26 = @"SWITCH_ON_3D_MAP";
                        break;
                      case 5010:
                        v26 = @"SWITCH_OFF_3D_MAP";
                        break;
                      case 5011:
                        v26 = @"SWITCH_ON_WEATHER";
                        break;
                      case 5012:
                        v26 = @"SWITCH_OFF_WEATHER";
                        break;
                      case 5013:
                        v26 = @"REPORT_A_PROBLEM";
                        break;
                      case 5014:
                        v26 = @"ADD_PLACE";
                        break;
                      case 5015:
                        goto LABEL_1405;
                      case 5016:
                        v26 = @"TAP_PREFERENCES";
                        break;
                      case 5017:
                        v26 = @"SWITCH_ON_TOLLS";
                        break;
                      case 5018:
                        v26 = @"SWITCH_OFF_TOLLS";
                        break;
                      case 5019:
                        v26 = @"SWITCH_ON_HIGHWAYS";
                        break;
                      case 5020:
                        v26 = @"SWITCH_OFF_HIGHWAYS";
                        break;
                      case 5021:
                        v26 = @"SWITCH_ON_HEADING";
                        break;
                      case 5022:
                        v26 = @"SWITCH_OFF_HEADING";
                        break;
                      case 5023:
                        v26 = @"SWITCH_ON_SPEED_LIMIT";
                        break;
                      case 5024:
                        v26 = @"SWITCH_OFF_SPEED_LIMIT";
                        break;
                      case 5025:
                        v26 = @"ELECT_DRIVING_MODE";
                        break;
                      case 5026:
                        v26 = @"ELECT_WALKING_MODE";
                        break;
                      case 5027:
                        v26 = @"ELECT_TRANSIT_MODE";
                        break;
                      case 5028:
                        v26 = @"ELECT_RIDESHARE_MODE";
                        break;
                      case 5029:
                        v26 = @"SWITCH_ON_FIND_MY_CAR";
                        break;
                      case 5030:
                        v26 = @"SWITCH_OFF_FIND_MY_CAR";
                        break;
                      case 5031:
                        v26 = @"MARK_MY_LOCATION";
                        break;
                      case 5032:
                        v26 = @"TAP_HYBRID_MODE";
                        break;
                      case 5033:
                        v26 = @"CHECK_AVOID_BUSY_ROADS";
                        break;
                      case 5034:
                        v26 = @"UNCHECK_AVOID_BUSY_ROADS";
                        break;
                      case 5035:
                        v26 = @"CHECK_AVOID_HILLS";
                        break;
                      case 5036:
                        v26 = @"UNCHECK_AVOID_HILLS";
                        break;
                      case 5037:
                        v26 = @"CHECK_AVOID_STAIRS";
                        break;
                      case 5038:
                        v26 = @"UNCHECK_AVOID_STAIRS";
                        break;
                      case 5039:
                        v26 = @"ELECT_CYCLING_MODE";
                        break;
                      default:
                        switch((int)v25)
                        {
                          case 4001:
                            v26 = @"RECENTER_CURRENT_LOCATION";
                            break;
                          case 4002:
                            v26 = @"TAP_HEADING_ON";
                            break;
                          case 4003:
                            v26 = @"TAP_HEADING_OFF";
                            break;
                          case 4004:
                            v26 = @"PUCK_DRIFT";
                            break;
                          case 4005:
                            v26 = @"PUCK_SNAP";
                            break;
                          case 4006:
                            v26 = @"SELECT_FLOOR";
                            break;
                          default:
                            goto LABEL_1405;
                        }
                        break;
                    }
                    break;
                }
              }
            }
            else if ((int)v25 > 13000)
            {
              if ((int)v25 <= 16000)
              {
                if ((int)v25 <= 15000)
                {
                  switch((int)v25)
                  {
                    case 14001:
                      v26 = @"VIEW_APP";
                      break;
                    case 14002:
                      v26 = @"ENABLE";
                      break;
                    case 14003:
                      v26 = @"BOOK_RIDE";
                      break;
                    case 14004:
                      v26 = @"REQUEST_RIDE";
                      break;
                    case 14005:
                      v26 = @"CONTACT_DRIVER";
                      break;
                    case 14006:
                      v26 = @"CHANGE_PAYMENT";
                      break;
                    case 14007:
                      v26 = @"ENABLE_ALL_RIDESHARE_APPS";
                      break;
                    case 14008:
                      v26 = @"TAP_FOR_MORE_RIDES";
                      break;
                    case 14009:
                      v26 = @"SUBMIT_TRIP_FEEDBACK";
                      break;
                    default:
                      switch((int)v25)
                      {
                        case 13001:
                          v26 = @"SELECT_ADDRESS";
                          break;
                        case 13002:
                          v26 = @"ADD_ADDRESS";
                          break;
                        case 13003:
                          v26 = @"SELECT_LABEL";
                          break;
                        case 13004:
                          v26 = @"DELETE_ADDRESS";
                          break;
                        case 13005:
                          v26 = @"EDIT_ITEMS";
                          break;
                        case 13006:
                          v26 = @"RAP_FAVORITES";
                          break;
                        case 13007:
                          v26 = @"SORT_LIST_ITEM";
                          break;
                        default:
                          goto LABEL_1405;
                      }
                      break;
                  }
                }
                else
                {
                  switch(v25)
                  {
                    case 0x3A99:
                      v26 = @"ORB_PEEK";
                      break;
                    case 0x3A9A:
                      v26 = @"ORB_POP";
                      break;
                    case 0x3A9B:
                      v26 = @"ORB_DISMISS";
                      break;
                    default:
LABEL_1405:
                      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
                      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      break;
                  }
                }
              }
              else
              {
                switch((int)v25)
                {
                  case 17001:
                    v26 = @"START_DRAG";
                    break;
                  case 17002:
                    v26 = @"CANCEL_DRAG";
                    break;
                  case 17003:
                    v26 = @"COMPLETE_DRAG";
                    break;
                  case 17004:
                    v26 = @"START_DROP";
                    break;
                  case 17005:
                    v26 = @"CANCEL_DROP";
                    break;
                  case 17006:
                    v26 = @"COMPLETE_DROP";
                    break;
                  case 17007:
                    v26 = @"ANNOTATION_SELECT";
                    break;
                  case 17008:
                    v26 = @"ANNOTATION_SELECT_AUTO";
                    break;
                  case 17009:
                    v26 = @"ANNOTATION_SELECT_LIST";
                    break;
                  case 17010:
                    v26 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
                    break;
                  case 17011:
                    v26 = @"CALLOUT_FLYOVER_TOUR";
                    break;
                  case 17012:
                    v26 = @"CALLOUT_INFO";
                    break;
                  case 17013:
                    v26 = @"CALLOUT_NAV_TRANSIT";
                    break;
                  case 17014:
                    v26 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
                    break;
                  case 17015:
                    v26 = @"CALLOUT_VIEW_TRANSIT_LINE";
                    break;
                  case 17016:
                    v26 = @"DIRECTIONS_SELECT";
                    break;
                  case 17017:
                    v26 = @"DIRECTIONS_TRANSIT_CUSTOM";
                    break;
                  case 17018:
                    v26 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
                    break;
                  case 17019:
                    v26 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
                    break;
                  case 17020:
                    v26 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
                    break;
                  case 17021:
                    v26 = @"DIRECTIONS_TRANSIT_LATER";
                    break;
                  case 17022:
                    v26 = @"DIRECTIONS_TRANSIT_NOW";
                    break;
                  case 17023:
                    v26 = @"FLYOVER_NOTIFICATION_DISMISS";
                    break;
                  case 17024:
                    v26 = @"FLYOVER_NOTIFICATION_START";
                    break;
                  case 17025:
                    v26 = @"FLYOVER_TOUR_COMPLETED";
                    break;
                  case 17026:
                    v26 = @"FLYOVER_TOUR_END";
                    break;
                  case 17027:
                    v26 = @"FLYOVER_TOUR_NOTIFICATION";
                    break;
                  case 17028:
                    v26 = @"FLYOVER_TOUR_START";
                    break;
                  case 17029:
                    v26 = @"INFO_BOOKMARKS";
                    break;
                  case 17030:
                    v26 = @"INFO_CARD_DETACHED";
                    break;
                  case 17031:
                    v26 = @"INFO_CONTACTS";
                    break;
                  case 17032:
                    v26 = @"INFO_DIRECTIONS";
                    break;
                  case 17033:
                    v26 = @"INFO_DIRECTIONS_FROM";
                    break;
                  case 17034:
                    v26 = @"INFO_DIRECTIONS_TO";
                    break;
                  case 17035:
                    v26 = @"INFO_DISMISS";
                    break;
                  case 17036:
                    v26 = @"INFO_INFO";
                    break;
                  case 17037:
                    v26 = @"INFO_PHOTOS";
                    break;
                  case 17038:
                    v26 = @"INFO_REVIEWS";
                    break;
                  case 17039:
                    v26 = @"INFO_SHARE";
                    break;
                  case 17040:
                    v26 = @"INFO_SHARE_AIRDROP";
                    break;
                  case 17041:
                    v26 = @"INFO_SHARE_FACEBOOK";
                    break;
                  case 17042:
                    v26 = @"INFO_SHARE_MAIL";
                    break;
                  case 17043:
                    v26 = @"INFO_SHARE_MESSAGE";
                    break;
                  case 17044:
                    v26 = @"INFO_SHARE_TENCENTWEIBO";
                    break;
                  case 17045:
                    v26 = @"INFO_SHARE_WEIBO";
                    break;
                  case 17046:
                    v26 = @"INFO_YELP";
                    break;
                  case 17047:
                    v26 = @"MAPS_APP_LAUNCH";
                    break;
                  case 17048:
                    v26 = @"MAP_3D_OFF";
                    break;
                  case 17049:
                    v26 = @"MAP_3D_ON";
                    break;
                  case 17050:
                    v26 = @"MAP_OPTIONS_DROP_PIN";
                    break;
                  case 17051:
                    v26 = @"MAP_OPTIONS_HYBRID";
                    break;
                  case 17052:
                    v26 = @"MAP_OPTIONS_PRINT";
                    break;
                  case 17053:
                    v26 = @"MAP_OPTIONS_REMOVE_PIN";
                    break;
                  case 17054:
                    v26 = @"MAP_OPTIONS_SATELLITE";
                    break;
                  case 17055:
                    v26 = @"MAP_OPTIONS_STANDARD";
                    break;
                  case 17056:
                    v26 = @"MAP_OPTIONS_TRAFFIC_HIDE";
                    break;
                  case 17057:
                    v26 = @"MAP_OPTIONS_TRAFFIC_SHOW";
                    break;
                  case 17058:
                    v26 = @"MAP_OPTIONS_TRANSIT";
                    break;
                  case 17059:
                    v26 = @"MAP_TAP_FLYOVER_CITY";
                    break;
                  case 17060:
                    v26 = @"MAP_TAP_LINE";
                    break;
                  case 17061:
                    v26 = @"MAP_TAP_POI_TRANSIT";
                    break;
                  case 17062:
                    v26 = @"MAP_TAP_TRAFFIC_INCIDENT";
                    break;
                  case 17063:
                    v26 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
                    break;
                  case 17064:
                    v26 = @"MAP_USER_TRACKING_OFF";
                    break;
                  case 17065:
                    v26 = @"MAP_USER_TRACKING_ON";
                    break;
                  case 17066:
                    v26 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
                    break;
                  case 17067:
                    v26 = @"NAV_CLEAR";
                    break;
                  case 17068:
                    v26 = @"NAV_LIST";
                    break;
                  case 17069:
                    v26 = @"NAV_ROUTE_STEP_NEXT";
                    break;
                  case 17070:
                    v26 = @"NAV_ROUTE_STEP_PREV";
                    break;
                  case 17071:
                    v26 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
                    break;
                  case 17072:
                    v26 = @"ORB_DISPLAY_MENU";
                    break;
                  case 17073:
                    v26 = @"ORB_MENU_CALL";
                    break;
                  case 17074:
                    v26 = @"ORB_MENU_DIRECTIONS";
                    break;
                  case 17075:
                    v26 = @"ORB_MENU_DISMISS";
                    break;
                  case 17076:
                    v26 = @"ORB_MENU_SHARE";
                    break;
                  case 17077:
                    v26 = @"ORB_MENU_SHOW_PLACECARD";
                    break;
                  case 17078:
                    v26 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
                    break;
                  case 17079:
                    v26 = @"ORB_MENU_URL";
                    break;
                  case 17080:
                    v26 = @"ORB_PRESS";
                    break;
                  case 17081:
                    v26 = @"ORB_SPRINGBOARD_MARK_LOCATION";
                    break;
                  case 17082:
                    v26 = @"ORB_SPRINGBOARD_SEARCH";
                    break;
                  case 17083:
                    v26 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
                    break;
                  case 17084:
                    v26 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
                    break;
                  case 17085:
                    v26 = @"RAP_PERMISSION_CANCEL";
                    break;
                  case 17086:
                    v26 = @"RAP_PERMISSION_EMAIL_NA";
                    break;
                  case 17087:
                    v26 = @"RAP_PERMISSION_EMAIL_OK";
                    break;
                  case 17088:
                    v26 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
                    break;
                  case 17089:
                    v26 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
                    break;
                  case 17090:
                    v26 = @"RAP_PERMISSION_OK";
                    break;
                  case 17091:
                    v26 = @"SEARCH_BEGIN";
                    break;
                  case 17092:
                    v26 = @"SEARCH_CANCEL";
                    break;
                  case 17093:
                    v26 = @"SEARCH_SELECT";
                    break;
                  case 17094:
                    v26 = @"TRANSIT_LINE_SELECTION_DISMISS";
                    break;
                  case 17095:
                    v26 = @"TRANSIT_LINE_SELECTION_VIEW";
                    break;
                  case 17096:
                    v26 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
                    break;
                  case 17097:
                    v26 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
                    break;
                  case 17098:
                    v26 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
                    break;
                  case 17099:
                    v26 = @"UNKNOWN_ACTION";
                    break;
                  case 17100:
                    v26 = @"INFO_SHARE_TWITTER";
                    break;
                  case 17101:
                    v26 = @"INFO_TAP_POPULAR_APP_NEARBY";
                    break;
                  case 17102:
                    v26 = @"INFO_DIRECTIONS_WALK";
                    break;
                  case 17103:
                    v26 = @"INFO_DIRECTIONS_TRANSIT";
                    break;
                  case 17104:
                    v26 = @"INFO_DIRECTIONS_DRIVE";
                    break;
                  case 17105:
                    v26 = @"INFO_REPORT_A_PROBLEM";
                    break;
                  case 17106:
                    v26 = @"CALLOUT_NAV";
                    break;
                  case 17107:
                    v26 = @"RAP_PERMISSION_EMAIL_CANCEL";
                    break;
                  case 17108:
                    v26 = @"MAP_TAP_POI";
                    break;
                  default:
                    if (v25 == 16001)
                    {
                      v26 = @"SEARCH_IN_MAPS";
                    }
                    else
                    {
                      if (v25 != 90010) {
                        goto LABEL_1405;
                      }
                      v26 = @"PAN_RIGHT";
                    }
                    break;
                }
              }
            }
            else
            {
              switch((int)v25)
              {
                case 10101:
                  v26 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
                  break;
                case 10102:
                  v26 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
                  break;
                case 10103:
                  v26 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
                  break;
                case 10104:
                  v26 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
                  break;
                case 10105:
                  v26 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
                  break;
                case 10106:
                  v26 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
                  break;
                case 10107:
                  v26 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
                  break;
                case 10108:
                  v26 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
                  break;
                case 10109:
                  v26 = @"RAP_CANCEL";
                  break;
                case 10110:
                  v26 = @"RAP_NEXT";
                  break;
                case 10111:
                  v26 = @"RAP_BACK";
                  break;
                case 10112:
                  v26 = @"RAP_SEND";
                  break;
                case 10113:
                  v26 = @"RAP_SKIP";
                  break;
                case 10114:
                  v26 = @"RAP_SHOW_MORE";
                  break;
                case 10115:
                  v26 = @"RAP_ADD_PHOTO";
                  break;
                case 10116:
                  v26 = @"RAP_MAP_INCORRECT";
                  break;
                case 10117:
                  v26 = @"RAP_BAD_DIRECTIONS";
                  break;
                case 10118:
                  v26 = @"RAP_TRANSIT_INFO_INCORRECT";
                  break;
                case 10119:
                  v26 = @"RAP_SATELLITE_IMAGE_PROBLEM";
                  break;
                case 10120:
                  v26 = @"RAP_SEARCH_RESULTS_INCORRECT";
                  break;
                case 10121:
                  v26 = @"RAP_ADD_A_PLACE";
                  break;
                case 10122:
                  v26 = @"RAP_HOME";
                  break;
                case 10123:
                  v26 = @"RAP_WORK";
                  break;
                case 10124:
                  v26 = @"RAP_OTHER";
                  break;
                case 10125:
                  v26 = @"RAP_LOCATION";
                  break;
                case 10126:
                  v26 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
                  break;
                case 10127:
                  v26 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
                  break;
                case 10128:
                  v26 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
                  break;
                case 10129:
                  v26 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
                  break;
                case 10130:
                  v26 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
                  break;
                case 10131:
                  v26 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
                  break;
                case 10132:
                  v26 = @"RAP_TRANSIT_DELAY";
                  break;
                case 10133:
                  v26 = @"RAP_LOCATION_CLOSED";
                  break;
                case 10134:
                  v26 = @"RAP_CLOSED_PERMANENTLY";
                  break;
                case 10135:
                  v26 = @"RAP_CLOSED_TEMPORARILY";
                  break;
                case 10136:
                  v26 = @"RAP_HOURS_HAVE_CHANGED";
                  break;
                case 10137:
                  v26 = @"RAP_SELECT_STATION";
                  break;
                case 10138:
                  v26 = @"RAP_SELECT_LINE";
                  break;
                case 10139:
                  v26 = @"RAP_SELECT_ACCESS_POINT";
                  break;
                case 10140:
                  v26 = @"RAP_SELECT_SEARCH";
                  break;
                case 10141:
                  v26 = @"RAP_PAN_MAP";
                  break;
                case 10142:
                  v26 = @"RAP_CENTER_MAP_ON_USER";
                  break;
                case 10143:
                  v26 = @"RAP_SEARCH_UNEXPECTED";
                  break;
                case 10144:
                  v26 = @"RAP_ADD_POI";
                  break;
                case 10145:
                  v26 = @"RAP_ADD_STREET_ADDRESS";
                  break;
                case 10146:
                  v26 = @"RAP_ADD_OTHER";
                  break;
                case 10147:
                  v26 = @"RAP_SELECT_CATEGORY";
                  break;
                case 10148:
                  v26 = @"RAP_TAKE_PHOTO";
                  break;
                case 10149:
                  v26 = @"RAP_RETAKE_PHOTO";
                  break;
                case 10150:
                  v26 = @"RAP_PLACE_DETAILS";
                  break;
                case 10151:
                  v26 = @"RAP_SATELLITE_IMAGE_OUTDATED";
                  break;
                case 10152:
                  v26 = @"RAP_SATELLITE_IMAGE_QUALITY";
                  break;
                case 10153:
                  v26 = @"RAP_SELECT_LABEL";
                  break;
                case 10154:
                  v26 = @"RAP_SELECT_ROUTE";
                  break;
                case 10155:
                  v26 = @"RAP_CLAIM_BUSINESS";
                  break;
                case 10156:
                  v26 = @"RAP_BRAND_DETAILS";
                  break;
                case 10157:
                  v26 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
                  break;
                case 10158:
                  v26 = @"RAP_LOOK_AROUND_LABELS_STREET";
                  break;
                case 10159:
                  v26 = @"RAP_LOOK_AROUND_BLURRING";
                  break;
                case 10160:
                  v26 = @"RAP_LOOK_AROUND_REMOVE_HOME";
                  break;
                case 10161:
                  v26 = @"RAP_LOOK_AROUND_LABELS_STORE";
                  break;
                case 10162:
                  v26 = @"RAP_LOOK_AROUND_PRIVACY";
                  break;
                case 10163:
                  v26 = @"RAP_INCORRECT_HOURS";
                  break;
                case 10164:
                  v26 = @"RAP_INCORRECT_ADDRESS";
                  break;
                case 10165:
                  v26 = @"RAP_EDIT_PLACE_DETAILS";
                  break;
                case 10166:
                  v26 = @"RAP_EDIT_PLACE_NAME";
                  break;
                case 10167:
                  v26 = @"RAP_EDIT_ADDRESS";
                  break;
                case 10168:
                  v26 = @"RAP_ADD_CATEGORY";
                  break;
                case 10169:
                  v26 = @"RAP_REMOVE_CATEGORY";
                  break;
                case 10170:
                  v26 = @"RAP_DESELECT_CATEGORY";
                  break;
                case 10171:
                  v26 = @"RAP_ADD_HOURS";
                  break;
                case 10172:
                  v26 = @"RAP_REMOVE_HOURS";
                  break;
                case 10173:
                  v26 = @"RAP_TAP_DAY_OF_WEEK";
                  break;
                case 10174:
                  v26 = @"RAP_TAP_24_HOURS_BUTTON";
                  break;
                case 10175:
                  v26 = @"RAP_TAP_OPEN_TIME";
                  break;
                case 10176:
                  v26 = @"RAP_TAP_CLOSED_TIME";
                  break;
                case 10177:
                  v26 = @"RAP_TAP_TEMPORARY_CLOSURE";
                  break;
                case 10178:
                  v26 = @"RAP_TAP_PERMANENTLY_CLOSED";
                  break;
                case 10179:
                  v26 = @"RAP_EDIT_WEBSITE";
                  break;
                case 10180:
                  v26 = @"RAP_EDIT_PHONE_NUMBER";
                  break;
                case 10181:
                  v26 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
                  break;
                case 10182:
                  v26 = @"RAP_ADD_COMMENTS";
                  break;
                case 10183:
                  v26 = @"RAP_EDIT_LOCATION";
                  break;
                case 10184:
                  v26 = @"RAP_VIEW_LOCATION";
                  break;
                case 10185:
                  v26 = @"RAP_ZOOM_IN";
                  break;
                case 10186:
                  v26 = @"RAP_ZOOM_OUT";
                  break;
                case 10187:
                  v26 = @"RAP_VIEW_ENTRY_POINTS";
                  break;
                case 10188:
                  v26 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
                  break;
                case 10189:
                  v26 = @"RAP_ADD_NEW_ENTRY_POINT";
                  break;
                case 10190:
                  v26 = @"RAP_REMOVE_ENTRY_POINT";
                  break;
                case 10191:
                  v26 = @"RAP_SELECT_ENTRY_POINT_TYPE";
                  break;
                default:
                  switch((int)v25)
                  {
                    case 11001:
                      v26 = @"EXIT_MAPS_LOWER_WRIST";
                      break;
                    case 11002:
                      v26 = @"TASK_READY";
                      break;
                    case 11003:
                      v26 = @"TAP_SEARCH";
                      break;
                    case 11004:
                      v26 = @"TAP_MY_LOCATION";
                      break;
                    case 11005:
                      v26 = @"SHOW_NEARBY";
                      break;
                    case 11006:
                      v26 = @"TAP_NEARBY";
                      break;
                    case 11007:
                      v26 = @"TAP_PROACTIVE";
                      break;
                    case 11008:
                      v26 = @"FORCE_PRESS";
                      break;
                    case 11009:
                      v26 = @"TAP_CONTACTS";
                      break;
                    case 11010:
                      v26 = @"TAP_TRANSIT";
                      break;
                    case 11011:
                      v26 = @"TAP_DICTATION";
                      break;
                    case 11012:
                      v26 = @"GET_DIRECTIONS_DRIVING";
                      break;
                    case 11013:
                      v26 = @"GET_DIRECTIONS_WALKING";
                      break;
                    case 11014:
                      v26 = @"GET_DIRECTIONS_TRANSIT";
                      break;
                    case 11015:
                      v26 = @"OPEN_STANDARD_MAP";
                      break;
                    case 11016:
                      v26 = @"OPEN_TRANSIT_MAP";
                      break;
                    case 11017:
                      v26 = @"START_NAV_AUTO";
                      break;
                    case 11018:
                      v26 = @"TAP_RECENT";
                      break;
                    case 11019:
                      v26 = @"TAP_FAVORITE";
                      break;
                    case 11020:
                      v26 = @"TAP_SCRIBBLE";
                      break;
                    case 11021:
                      v26 = @"TAP_VIEW_MAP";
                      break;
                    case 11022:
                      v26 = @"TAP_VIEW_TBT";
                      break;
                    case 11023:
                      v26 = @"VIEW_ROUTE_INFO";
                      break;
                    case 11024:
                      v26 = @"NAV_UNMUTE";
                      break;
                    case 11025:
                      v26 = @"NAV_MUTE";
                      break;
                    case 11026:
                      v26 = @"GET_DIRECTIONS_CYCLING";
                      break;
                    case 11027:
                      v26 = @"TAP_SEARCH_HOME";
                      break;
                    case 11028:
                      v26 = @"ROUTE_PAUSED_ON_WATCH";
                      break;
                    case 11029:
                      v26 = @"NEXT_STOP_TAPPED_ON_WATCH";
                      break;
                    default:
                      switch((int)v25)
                      {
                        case 12001:
                          v26 = @"VIEW_MORE_OPTIONS";
                          break;
                        case 12002:
                          v26 = @"SELECT_TIME";
                          break;
                        case 12003:
                          v26 = @"SHOW_NEXT_AVAILABLE";
                          break;
                        case 12004:
                          v26 = @"DECREASE_TABLE_SIZE";
                          break;
                        case 12005:
                          v26 = @"INCREASE_TABLE_SIZE";
                          break;
                        case 12006:
                          v26 = @"EDIT_BOOKING";
                          break;
                        case 12007:
                          v26 = @"EDIT_PHONE";
                          break;
                        case 12008:
                          v26 = @"ADD_SPECIAL_REQUEST";
                          break;
                        case 12009:
                          v26 = @"CHANGE_RESERVATION";
                          break;
                        case 12010:
                          v26 = @"LEARN_MORE";
                          break;
                        default:
                          goto LABEL_1405;
                      }
                      break;
                  }
                  break;
              }
            }
          }
          else
          {
            v26 = @"UI_ACTION_UNKNOWN";
            switch((int)v25)
            {
              case 0:
                break;
              case 1:
                v26 = @"PULL_UP";
                break;
              case 2:
                v26 = @"PULL_DOWN";
                break;
              case 3:
                v26 = @"TAP";
                break;
              case 4:
                v26 = @"CLOSE";
                break;
              case 5:
                v26 = @"SWIPE_PREV";
                break;
              case 6:
                v26 = @"SWIPE_NEXT";
                break;
              case 7:
                v26 = @"SCROLL_UP";
                break;
              case 8:
                v26 = @"SCROLL_DOWN";
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
                goto LABEL_1405;
              case 10:
                v26 = @"SHOW_MORE";
                break;
              case 11:
                v26 = @"SHOW_LESS";
                break;
              case 12:
                v26 = @"SWIPE_LEFT";
                break;
              case 13:
                v26 = @"SWIPE_RIGHT";
                break;
              case 14:
                v26 = @"MINIMIZE";
                break;
              case 15:
                v26 = @"TAP_PREV";
                break;
              case 16:
                v26 = @"TAP_NEXT";
                break;
              case 17:
                v26 = @"SUBMIT";
                break;
              case 18:
                v26 = @"CANCEL";
                break;
              case 19:
                v26 = @"ENTER_MAPS";
                break;
              case 20:
                v26 = @"EXIT_MAPS";
                break;
              case 21:
                v26 = @"REVEAL";
                break;
              case 22:
                v26 = @"OPEN_NEW_TAB";
                break;
              case 25:
                v26 = @"BACK";
                break;
              case 26:
                v26 = @"ACTIVATE";
                break;
              case 27:
                v26 = @"DEACTIVATE";
                break;
              case 28:
                v26 = @"AGREE";
                break;
              case 29:
                v26 = @"DISAGREE";
                break;
              case 30:
                v26 = @"SKIP_ANSWER";
                break;
              case 31:
                v26 = @"EXPAND";
                break;
              case 32:
                v26 = @"COLLAPSE";
                break;
              case 33:
                v26 = @"ENTER";
                break;
              case 34:
                v26 = @"EXIT";
                break;
              case 35:
                v26 = @"SCROLL_UP_INDEX_BAR";
                break;
              case 36:
                v26 = @"SCROLL_DOWN_INDEX_BAR";
                break;
              case 37:
                v26 = @"TOGGLE_ON";
                break;
              case 38:
                v26 = @"TOGGLE_OFF";
                break;
              case 39:
                v26 = @"LONG_PRESS";
                break;
              case 40:
                v26 = @"CLICK";
                break;
              case 41:
                v26 = @"TAP_DONE";
                break;
              case 42:
                v26 = @"TAP_CLOSE";
                break;
              case 43:
                v26 = @"SCROLL_LEFT";
                break;
              case 44:
                v26 = @"SCROLL_RIGHT";
                break;
              case 45:
                v26 = @"DISPLAY";
                break;
              case 46:
                v26 = @"OPEN_IN_APP";
                break;
              case 47:
                v26 = @"CONCEAL";
                break;
              case 48:
                v26 = @"TAP_DELETE";
                break;
              case 49:
                v26 = @"TAP_FILTER";
                break;
              case 50:
                v26 = @"TAP_SECONDARY_BUTTON";
                break;
              case 51:
                v26 = @"TAP_WIDGET_FOOD";
                break;
              case 52:
                v26 = @"TAP_WIDGET_GAS";
                break;
              case 53:
                v26 = @"TAP_WIDGET_LOADING";
                break;
              case 54:
                v26 = @"TAP_WIDGET_SEARCH";
                break;
              case 55:
                v26 = @"TAP_WIDGET_STORES";
                break;
              case 56:
                v26 = @"DISPLAY_ALLOW_ONCE_PROMPT";
                break;
              case 57:
                v26 = @"SHARE_CURRENT_LOCATION";
                break;
              case 58:
                v26 = @"SHARE_PHOTO";
                break;
              case 59:
                v26 = @"TAP_KEEP_OFF";
                break;
              case 60:
                v26 = @"TAP_PHOTO_CATEGORY";
                break;
              case 61:
                v26 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
                break;
              case 62:
                v26 = @"TAP_TURN_ON";
                break;
              case 63:
                v26 = @"DISPLAY_CYCLING_ANNOTATION";
                break;
              case 64:
                v26 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
                break;
              case 65:
                v26 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
                break;
              case 66:
                v26 = @"DISPLAY_WALKING_DEFAULT_OPTION";
                break;
              case 67:
                v26 = @"TAP_CYCLING_ANNOTATION";
                break;
              case 68:
                v26 = @"TAP_DRIVING_DEFAULT_OPTION";
                break;
              case 69:
                v26 = @"TAP_TRANSIT_DEFAULT_OPTION";
                break;
              case 70:
                v26 = @"TAP_WALKING_DEFAULT_OPTION";
                break;
              case 71:
                v26 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
                break;
              case 72:
                v26 = @"TAP_RIDESHARE_DEFAULT_OPTION";
                break;
              case 73:
                v26 = @"TAP_PERSONAL_COLLECTION";
                break;
              case 74:
                v26 = @"RESUME_ROUTE";
                break;
              case 75:
                v26 = @"DISPLAY_OUT_OF_RANGE_ALERT";
                break;
              case 76:
                v26 = @"TAP_ALLOW_ONCE";
                break;
              case 77:
                v26 = @"TAP_DO_NOT_ALLOW";
                break;
              case 78:
                v26 = @"ADD_RECCOMENDED_FAVORITE";
                break;
              case 79:
                v26 = @"ADD_RECOMMENDED_HOME_FAVORITE";
                break;
              case 80:
                v26 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
                break;
              case 81:
                v26 = @"ADD_RECOMMENDED_WORK_FAVORITE";
                break;
              case 82:
                v26 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
                break;
              case 83:
                v26 = @"CREATE_SCHOOL_FAVORITE";
                break;
              case 84:
                v26 = @"TAP_SCHOOL_FAVORITE";
                break;
              case 85:
                v26 = @"SELECT_ROUTING_TYPE_CYCLING";
                break;
              case 86:
                v26 = @"REPORT_PHOTO";
                break;
              case 87:
                v26 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
                break;
              case 88:
                v26 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
                break;
              case 89:
                v26 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
                break;
              case 90:
                v26 = @"CREATE_RECOMMENDED_FAVORITE";
                break;
              case 91:
                v26 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
                break;
              case 92:
                v26 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
                break;
              case 93:
                v26 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
                break;
              case 94:
                v26 = @"TAP_SMALL_WIDGET_ITEM";
                break;
              case 95:
                v26 = @"TAP_MEDIUM_WIDGET_ITEM";
                break;
              case 96:
                v26 = @"TAP_LARGE_WIDGET_ITEM";
                break;
              case 97:
                v26 = @"DISPLAY_ARP_TIPKIT";
                break;
              case 98:
                v26 = @"NEXT";
                break;
              case 99:
                v26 = @"TAP_RATE_AND_ADD_PHOTOS";
                break;
              case 100:
                v26 = @"TAP_TO_ADD_POSITIVE_RATING";
                break;
              case 101:
                v26 = @"TAP_TO_ADD_NEGATIVE_RATING";
                break;
              case 102:
                v26 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
                break;
              case 103:
                v26 = @"INVOKE_SIRI_PROMPT";
                break;
              case 104:
                v26 = @"ETA_SHARED_SUCCESSFULLY";
                break;
              case 105:
                v26 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
                break;
              case 106:
                v26 = @"CLEAR_INCIDENT";
                break;
              case 107:
                v26 = @"CONFIRM_INCIDENT";
                break;
              case 108:
                v26 = @"DISMISS_INCIDENT";
                break;
              case 109:
                v26 = @"INCIDENT_ALERT_TIMEOUT";
                break;
              case 110:
                v26 = @"INCIDENT_ALERT_TRAY_SHOWN";
                break;
              case 111:
                v26 = @"INCIDENT_CARD_SHOWN";
                break;
              case 112:
                v26 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
                break;
              case 113:
                v26 = @"INCIDENT_REPORT_TRAY_SHOWN";
                break;
              case 114:
                v26 = @"NAV_TRAY_DISCOVERY_SHOWN";
                break;
              case 115:
                v26 = @"TAP_TO_REPORT_INCIDENT";
                break;
              case 116:
                v26 = @"TAP_SHORTCUT";
                break;
              case 117:
                v26 = @"BLOCK_CONTACT";
                break;
              case 118:
                v26 = @"TAP_TO_ADD_RATING";
                break;
              case 119:
                v26 = @"AR_WALKING_LOCALIZATION_FAILED";
                break;
              case 120:
                v26 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
                break;
              case 121:
                v26 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
                break;
              case 122:
                v26 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
                break;
              case 123:
                v26 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
                break;
              case 124:
                v26 = @"RAISE_TO_ENTER_AR_WALKING";
                break;
              case 125:
                v26 = @"TAP_DISMISS";
                break;
              case 126:
                v26 = @"TAP_ENTER_AR_WALKING";
                break;
              case 127:
                v26 = @"TAP_OK";
                break;
              case 128:
                v26 = @"TAP_TRY_AGAIN";
                break;
              case 129:
                v26 = @"TAP_TURN_ON_IN_SETTINGS";
                break;
              case 130:
                v26 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
                break;
              case 131:
                v26 = @"VLF_CORRECTION_USER_ABANDON";
                break;
              case 132:
                v26 = @"AREA_EVENTS_ALERT";
                break;
              case 133:
                v26 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
                break;
              case 134:
                v26 = @"ACCEPT_EVENT_REROUTE";
                break;
              case 135:
                v26 = @"DISPLAY_AREA_EVENTS_ADVISORY";
                break;
              case 136:
                v26 = @"DISMISS_EVENT_REROUTE";
                break;
              case 137:
                v26 = @"PUNCH_OUT_EVENTS_LINK";
                break;
              case 138:
                v26 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
                break;
              case 139:
                v26 = @"ADJUST_GUIDANCE_SETTINGS";
                break;
              case 140:
                v26 = @"HIDE_DETAILS";
                break;
              case 141:
                v26 = @"SELECT_VOICE_GUIDANCE_ON";
                break;
              case 142:
                v26 = @"SELECT_VOICE_GUIDANCE_OFF";
                break;
              case 143:
                v26 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
                break;
              case 144:
                v26 = @"TAP_TEXT_LABEL";
                break;
              case 145:
                v26 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
                break;
              case 146:
                v26 = @"TAP_EXIT";
                break;
              case 147:
                v26 = @"TAP_CITY_MENU";
                break;
              case 148:
                v26 = @"CHECK_AVOID_TOLLS";
                break;
              case 149:
                v26 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
                break;
              case 150:
                v26 = @"TAP_ICLOUD";
                break;
              case 151:
                v26 = @"CHECK_AVOID_HIGHWAYS";
                break;
              case 152:
                v26 = @"TAP_FAVORITES";
                break;
              case 153:
                v26 = @"SELECT_DISTANCE_IN_KM";
                break;
              case 154:
                v26 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
                break;
              case 155:
                v26 = @"OPEN_FULL_CARD_FILTER";
                break;
              case 156:
                v26 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
                break;
              case 157:
                v26 = @"OPEN_SINGLE_CARD_FILTER";
                break;
              case 158:
                v26 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
                break;
              case 159:
                v26 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
                break;
              case 160:
                v26 = @"SESSIONLESS_REVEAL";
                break;
              case 161:
                v26 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
                break;
              case 162:
                v26 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
                break;
              case 163:
                v26 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
                break;
              case 164:
                v26 = @"ENTER_RAP_REPORT_MENU";
                break;
              case 165:
                v26 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
                break;
              case 166:
                v26 = @"TAP_MY_VEHICLES";
                break;
              case 167:
                v26 = @"SUBMIT_SINGLE_CARD_FILTER";
                break;
              case 168:
                v26 = @"SUBMIT_FULL_CARD_FILTER";
                break;
              case 169:
                v26 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
                break;
              case 170:
                v26 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
                break;
              case 171:
                v26 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
                break;
              case 172:
                v26 = @"TAP_ACCOUNT";
                break;
              case 173:
                v26 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
                break;
              case 174:
                v26 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
                break;
              case 175:
                v26 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
                break;
              case 176:
                v26 = @"RESULT_REFINEMENT_TOGGLE_OFF";
                break;
              case 177:
                v26 = @"TAP_CITY_CURATED_COLLECTIONS";
                break;
              case 178:
                v26 = @"TAP_REPORTS";
                break;
              case 179:
                v26 = @"TAP_RATINGS";
                break;
              case 180:
                v26 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
                break;
              case 181:
                v26 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
                break;
              case 182:
                v26 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
                break;
              case 183:
                v26 = @"SELECT_DISTANCE_IN_MILES";
                break;
              case 184:
                v26 = @"TAP_PRIVACY_STATEMENT";
                break;
              case 185:
                v26 = @"TAP_MAPS_SETTINGS";
                break;
              case 186:
                v26 = @"CANCEL_FULL_CARD_FILTER";
                break;
              case 187:
                v26 = @"TAP_LATEST_CURATED_COLLECTION";
                break;
              case 188:
                v26 = @"TAP_TEMPORAL_CURATED_COLLECTION";
                break;
              case 189:
                v26 = @"UNCHECK_AVOID_TOLLS";
                break;
              case 190:
                v26 = @"UNSELECT_SEARCH_REFINEMENT";
                break;
              case 191:
                v26 = @"TAP_RATING";
                break;
              case 192:
                v26 = @"TAP_ICLOUD_SIGN_IN";
                break;
              case 193:
                v26 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
                break;
              case 194:
                v26 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
                break;
              case 195:
                v26 = @"UNCHECK_AVOID_HIGHWAYS";
                break;
              case 196:
                v26 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
                break;
              case 197:
                v26 = @"RESULT_REFINEMENT_TOGGLE_ON";
                break;
              case 198:
                v26 = @"TAP_CONTEXT_LINE_HYPERLINK";
                break;
              case 199:
                v26 = @"TAP_MY_GUIDES";
                break;
              case 200:
                v26 = @"SELECT_SEARCH_REFINEMENT";
                break;
              case 201:
                v26 = @"SESSIONLESS_TAP_ACCOUNT";
                break;
              case 202:
                v26 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
                break;
              case 203:
                v26 = @"TAP_TRAVEL_PREFERENCES";
                break;
              case 204:
                v26 = @"SHOW_CURATED_COLLECTION_LIST";
                break;
              case 205:
                v26 = @"CANCEL_SINGLE_CARD_FILTER";
                break;
              case 206:
                v26 = @"DISPLAY_HFP_OPTION";
                break;
              case 207:
                v26 = @"SWITCH_OFF_HFP";
                break;
              case 208:
                v26 = @"SWITCH_ON_HFP";
                break;
              case 209:
                v26 = @"TAP_QUICK_ACTION_TRAY";
                break;
              case 210:
                v26 = @"SHOW_ALL_CITIES";
                break;
              case 211:
                v26 = @"TAP_ADD_NEARBY_TRANSIT";
                break;
              case 212:
                v26 = @"RESUME";
                break;
              case 213:
                v26 = @"DISPLAY_TIPKIT_PROMPT";
                break;
              case 214:
                v26 = @"TAP_NEARBY_TRANSIT_FAVORITE";
                break;
              case 215:
                v26 = @"TAP_DRIVING_MODE";
                break;
              case 216:
                v26 = @"SWITCH_ON_VOICE_GUIDANCE";
                break;
              case 217:
                v26 = @"DISMISS_TIPKIT_PROMPT";
                break;
              case 218:
                v26 = @"TAP_EXPAND_EXIT_DETAILS";
                break;
              case 219:
                v26 = @"TAP_NEARBY_TRANSIT_FILTER";
                break;
              case 220:
                v26 = @"TAP_MORE_DEPARTURES";
                break;
              case 221:
                v26 = @"RAP_INDIVIDUAL_PLACE";
                break;
              case 222:
                v26 = @"RAP_ADD_MAP";
                break;
              case 223:
                v26 = @"TAP_SUGGESTED_RAP";
                break;
              case 224:
                v26 = @"RAP_STREET_ISSUE";
                break;
              case 225:
                v26 = @"SWIPE_PIN_REVEAL";
                break;
              case 226:
                v26 = @"TAP_ADD_TIPKIT_FAVORITE";
                break;
              case 227:
                v26 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
                break;
              case 228:
                v26 = @"RAP_BAD_TRIP";
                break;
              case 229:
                v26 = @"RAP_PLACE_ISSUE";
                break;
              case 230:
                v26 = @"TAP_OPEN_MAPS";
                break;
              case 231:
                v26 = @"TAP_NEARBY_TRANSIT_RESULT";
                break;
              case 232:
                v26 = @"RAP_GUIDE";
                break;
              case 233:
                v26 = @"SWITCH_OFF_VOICE_GUIDANCE";
                break;
              case 234:
                v26 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
                break;
              case 235:
                v26 = @"SELECT_TRANSIT_STEP";
                break;
              case 236:
                v26 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
                break;
              case 237:
                v26 = @"TAP_SEE_MORE";
                break;
              case 238:
                v26 = @"RAP_IN_REVIEW";
                break;
              case 239:
                v26 = @"TAP_OPEN_MENU";
                break;
              case 240:
                v26 = @"TAP_NEARBY_TRANSIT";
                break;
              case 241:
                v26 = @"TAP_PIN_LINE";
                break;
              case 242:
                v26 = @"SWITCH_OFF_TRIP_FEEDBACK";
                break;
              case 243:
                v26 = @"RAP_GOOD_TRIP";
                break;
              case 244:
                v26 = @"TAP_FILTERED_CURATED_COLLECTION";
                break;
              case 245:
                v26 = @"SHARE_MY_LOCATION";
                break;
              case 246:
                v26 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
                break;
              case 247:
                v26 = @"DISPLAY_GENERIC_ADVISORY";
                break;
              case 248:
                v26 = @"ADVISORY_ALERT";
                break;
              case 249:
                v26 = @"PUNCH_OUT_LINK";
                break;
              case 250:
                v26 = @"TAP_GENERIC_ADVISORY";
                break;
              case 251:
                v26 = @"TAP_EXPLORE_MODE";
                break;
              case 252:
                v26 = @"TAP_UNPIN_LINE";
                break;
              case 253:
                v26 = @"MENU_UNPIN";
                break;
              case 254:
                v26 = @"MENU_PIN";
                break;
              case 255:
                v26 = @"SWIPE_PIN";
                break;
              case 256:
                v26 = @"SWIPE_UNPIN";
                break;
              case 257:
                v26 = @"TAP_MEDIA_APP";
                break;
              case 258:
                v26 = @"TAP_GUIDES_SUBACTION";
                break;
              case 259:
                v26 = @"TAP_MEDIA";
                break;
              case 260:
                v26 = @"PUNCH_OUT_MEDIA";
                break;
              case 261:
                v26 = @"SHOW_MEDIA_APP_MENU";
                break;
              case 262:
                v26 = @"SCROLL_RIGHT_RIBBON";
                break;
              case 263:
                v26 = @"SCROLL_LEFT_RIBBON";
                break;
              case 264:
                v26 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
                break;
              case 265:
                v26 = @"TAP_SHOW_MORE_TEXT";
                break;
              case 266:
                v26 = @"SCROLL_LEFT_RATINGS";
                break;
              case 267:
                v26 = @"SCROLL_LEFT_TEMPLATE_PLACE";
                break;
              case 268:
                v26 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
                break;
              case 269:
                v26 = @"SCROLL_RIGHT_RATINGS";
                break;
              case 270:
                v26 = @"TAP_ALLOW";
                break;
              case 271:
                v26 = @"TAP_GO_TO_SETTING";
                break;
              case 272:
                v26 = @"START_SUBMIT_REPORT";
                break;
              case 273:
                v26 = @"AUTHENTICATION_INFO_FAILURE";
                break;
              case 274:
                v26 = @"SUCCESSFULLY_SUBMIT_REPORT";
                break;
              case 275:
                v26 = @"FAILED_SUBMIT_REPORT";
                break;
              case 276:
                v26 = @"AUTHENTICATION_INFO_SUCCESS";
                break;
              case 277:
                v26 = @"EDIT_WAYPOINT";
                break;
              case 278:
                v26 = @"CLEAR_TEXT";
                break;
              case 279:
                v26 = @"REORDER_WAYPOINT";
                break;
              case 280:
                v26 = @"REMOVE_WAYPOINT";
                break;
              case 281:
                v26 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
                break;
              case 282:
                v26 = @"TAP_SHOWCASE_MENU";
                break;
              case 283:
                v26 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
                break;
              case 284:
                v26 = @"TAP_PHOTO_ALBUM";
                break;
              case 285:
                v26 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
                break;
              case 286:
                v26 = @"RAP_INLINE_ADD";
                break;
              case 287:
                v26 = @"RAP_TAP_EDIT";
                break;
              case 288:
                v26 = @"CLAIM_BUSINESS";
                break;
              case 289:
                v26 = @"RAP_EDIT_OPTIONS";
                break;
              case 290:
                v26 = @"TAP_IN_REVIEW_RAP";
                break;
              case 291:
                v26 = @"ORB_MENU_ADD_STOP";
                break;
              case 292:
                v26 = @"NEXT_STOP";
                break;
              case 293:
                v26 = @"ARRIVE_AT_WAYPOINT";
                break;
              case 294:
                v26 = @"REMOVE_STOP";
                break;
              case 295:
                v26 = @"DISPLAY_PAUSE_BUTTON";
                break;
              case 296:
                v26 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
                break;
              case 297:
                v26 = @"AUTO_ADVANCE_NEXT_STOP";
                break;
              case 298:
                v26 = @"ADD_INLINE_NEGATIVE_RATING";
                break;
              case 299:
                v26 = @"ADD_INLINE_POSITIVE_RATING";
                break;
              case 300:
                v26 = @"TAP_TO_ADD_RATING_AND_PHOTO";
                break;
              case 301:
                v26 = @"SUBMIT_RATINGS_AND_PHOTOS";
                break;
              case 302:
                v26 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
                break;
              case 303:
                v26 = @"TAP_RECENTLY_VIEWED_ROUTE";
                break;
              case 304:
                v26 = @"SHOW_ALL_RECENTS";
                break;
              case 305:
                v26 = @"RESUME_MULTIPOINT_ROUTE";
                break;
              case 306:
                v26 = @"DISMISS_TRANSIT_TIPKIT";
                break;
              case 307:
                v26 = @"DISPLAY_TRANSIT_TIPKIT";
                break;
              case 308:
                v26 = @"TAP_TRANSIT_TIPKIT";
                break;
              case 309:
                v26 = @"FILTER_EV";
                break;
              case 310:
                v26 = @"FILTER_SURCHARGE";
                break;
              case 311:
                v26 = @"FILTER_PREFER";
                break;
              case 312:
                v26 = @"TAP_WALKING_ANNOTATION";
                break;
              case 313:
                v26 = @"FILTER_AVOID";
                break;
              case 314:
                v26 = @"FILTER_TRANSPORTATION_MODE";
                break;
              case 315:
                v26 = @"FILTER_RECOMMENDED_ROUTES";
                break;
              case 316:
                v26 = @"FILTER_IC_FARES";
                break;
              case 317:
                v26 = @"FILTER_TRANSIT_CARD_FARES";
                break;
              case 318:
                v26 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
                break;
              case 319:
                v26 = @"TAP_NOTIFICATION_SETTINGS";
                break;
              case 320:
                v26 = @"TAP_ENABLE_NOTIFICATION";
                break;
              case 321:
                v26 = @"ARP_SUGGESTIONS_TURN_OFF";
                break;
              case 322:
                v26 = @"ARP_SUGGESTIONS_TURN_ON";
                break;
              case 323:
                v26 = @"DISMISS_ARP_SUGGESTION";
                break;
              case 324:
                v26 = @"RATINGS_AND_PHOTOS_TURN_ON";
                break;
              case 325:
                v26 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
                break;
              case 326:
                v26 = @"UNSELECT_SUGGESTED_PHOTOS";
                break;
              case 327:
                v26 = @"SUGGESTED_PHOTOS_SHOWN";
                break;
              case 328:
                v26 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 329:
                v26 = @"TAP_YOUR_PHOTOS_ALBUM";
                break;
              case 330:
                v26 = @"RATINGS_AND_PHOTOS_TURN_OFF";
                break;
              case 331:
                v26 = @"DELETE_PHOTO";
                break;
              case 332:
                v26 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 333:
                v26 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
                break;
              case 334:
                v26 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
                break;
              case 335:
                v26 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
                break;
              case 336:
                v26 = @"SELECT_SUGGESTED_PHOTOS";
                break;
              case 337:
                v26 = @"ADD_STOP";
                break;
              case 338:
                v26 = @"SHOW_CREDIT_TURN_ON";
                break;
              case 339:
                v26 = @"DISPLAY_ARP_SUGGESTION";
                break;
              case 340:
                v26 = @"TAP_TO_ADD_PHOTO_CREDIT";
                break;
              case 341:
                v26 = @"SHOW_CREDIT_TURN_OFF";
                break;
              case 342:
                v26 = @"TAP_TO_EDIT_NICKNAME";
                break;
              case 343:
                v26 = @"SUBMIT_RATINGS";
                break;
              case 344:
                v26 = @"END_NAV_ON_WATCH";
                break;
              case 345:
                v26 = @"FILTER_EBIKE";
                break;
              case 356:
                v26 = @"ADD_STOP_SIRI";
                break;
              case 357:
                v26 = @"TAP_REVIEWED_RAP";
                break;
              case 358:
                v26 = @"TAP_OUTREACH_RAP";
                break;
              case 359:
                v26 = @"DISPLAY_SUGGESTED_ITEM";
                break;
              case 360:
                v26 = @"DISPLAY_HIKING_TIPKIT";
                break;
              case 361:
                v26 = @"DISMISS_HIKING_TIPKIT";
                break;
              case 362:
                v26 = @"TAP_HIKING_TIPKIT";
                break;
              case 363:
                v26 = @"SCROLL_LEFT_TRAILS";
                break;
              case 364:
                v26 = @"TAP_MORE_TRAILS";
                break;
              case 365:
                v26 = @"TAP_RELATED_TRAIL";
                break;
              case 366:
                v26 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
                break;
              case 367:
                v26 = @"SCROLL_RIGHT_TRAILS";
                break;
              case 368:
                v26 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
                break;
              case 369:
                v26 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
                break;
              case 370:
                v26 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
                break;
              case 371:
                v26 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
                break;
              case 372:
                v26 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
                break;
              case 373:
                v26 = @"EXPIRED_MAPS_REMOVED";
                break;
              case 374:
                v26 = @"UPDATE_ALL_DOWNLOAD_MAPS";
                break;
              case 375:
                v26 = @"TAP_EXPIRED_MAPS";
                break;
              case 376:
                v26 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
                break;
              case 377:
                v26 = @"MOVE_DOWNLOAD_MAPS";
                break;
              case 378:
                v26 = @"SAVE_RENAME_DOWNLOAD_MAPS";
                break;
              case 379:
                v26 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
                break;
              case 380:
                v26 = @"TAP_ENTER_OFFLINE_MAPS";
                break;
              case 381:
                v26 = @"TAP_DOWNLOAD_MAPS";
                break;
              case 382:
                v26 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
                break;
              case 383:
                v26 = @"DELETE_DOWNLOAD_MAPS";
                break;
              case 384:
                v26 = @"SLIDE_CLEAR_EXPIRED_MAPS";
                break;
              case 385:
                v26 = @"RENAME_DOWNLOAD_MAPS";
                break;
              case 386:
                v26 = @"RESIZE_DOWNLOAD_MAPS";
                break;
              case 387:
                v26 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
                break;
              case 388:
                v26 = @"RESTORE_EXPIRED_MAPS";
                break;
              case 389:
                v26 = @"CLEAR_EXPIRED_MAPS";
                break;
              case 390:
                v26 = @"TAP_USING_OFFLINE_BAR";
                break;
              case 391:
                v26 = @"UPDATE_DOWNLOAD_MAPS";
                break;
              case 392:
                v26 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
                break;
              case 393:
                v26 = @"DISPLAY_DOWNLOAD_MAPS";
                break;
              case 394:
                v26 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
                break;
              case 395:
                v26 = @"DISPLAY_EXPIRED_MAPS";
                break;
              case 396:
                v26 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
                break;
              case 397:
                v26 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
                break;
              case 398:
                v26 = @"SLIDE_RESTORE_EXPIRED_MAPS";
                break;
              case 399:
                v26 = @"ETA_SHARE_TRAY_TIMEOUT";
                break;
              case 400:
                v26 = @"START_ETA_SHARING";
                break;
              case 401:
                v26 = @"PERSON_LOCATION_UPDATE";
                break;
              case 402:
                v26 = @"STOP_ETA_SHARING";
                break;
              case 403:
                v26 = @"PUNCH_OUT_TO_FINDMY";
                break;
              case 404:
                v26 = @"TAP_PEOPLE_LOCATION";
                break;
              case 405:
                v26 = @"TAP_TO_REQUEST_LOCATION";
                break;
              case 406:
                v26 = @"ZOOM_OUT_CROWN";
                break;
              case 407:
                v26 = @"TAP_RESIZE_DOWNLOAD_MAPS";
                break;
              case 408:
                v26 = @"TAP_DELETE_DOWNLOAD_MAPS";
                break;
              case 409:
                v26 = @"SELECT_LIST_VIEW";
                break;
              case 410:
                v26 = @"SCROLL_RIGHT_TRAILHEADS";
                break;
              case 411:
                v26 = @"SWITCH_TO_ONLINE_MODE";
                break;
              case 412:
                v26 = @"TAP_RELATED_TRAILHEAD";
                break;
              case 413:
                v26 = @"SELECT_ELEVATION_VIEW";
                break;
              case 414:
                v26 = @"TOGGLE_PROXIMITY_RADIUS_ON";
                break;
              case 415:
                v26 = @"SEE_MORE_RECENTS";
                break;
              case 416:
                v26 = @"SEE_MORE_GUIDES";
                break;
              case 417:
                v26 = @"SELECT_CONTROLS";
                break;
              case 418:
                v26 = @"NO_SEARCH_RESULTS";
                break;
              case 419:
                v26 = @"TAP_VIEW_RESULTS_CAROUSEL";
                break;
              case 420:
                v26 = @"TAP_VIEW_RESULTS_LIST";
                break;
              case 421:
                v26 = @"SELECT_MAP_VIEW";
                break;
              case 422:
                v26 = @"SCROLL_LEFT_TRAILHEADS";
                break;
              case 423:
                v26 = @"SWITCH_TO_OFFLINE_MODE";
                break;
              case 424:
                v26 = @"ZOOM_IN_CROWN";
                break;
              case 425:
                v26 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
                break;
              case 426:
                v26 = @"TAP_MAP";
                break;
              case 427:
                v26 = @"SWIPE_DOWN";
                break;
              case 428:
                v26 = @"TAP_MORE_TRAILHEADS";
                break;
              case 429:
                v26 = @"TAP_ROUTE_OPTIONS";
                break;
              case 430:
                v26 = @"TAP_ROUTE_NAV_MAP";
                break;
              case 431:
                v26 = @"TAP_ROUTE_OVERVIEW_MAP";
                break;
              case 432:
                v26 = @"TAP_AUDIO";
                break;
              case 433:
                v26 = @"TAP_OPEN_PLACECARD";
                break;
              case 434:
                v26 = @"TAP_VIEW_STOPS";
                break;
              case 435:
                v26 = @"TAP_ROUTE_DETAILS";
                break;
              case 436:
                v26 = @"ADD_LPR_VEHICLE";
                break;
              case 437:
                v26 = @"TAP_ADD_VEHICLE";
                break;
              case 438:
                v26 = @"TAP_PLUG_TYPE";
                break;
              case 439:
                v26 = @"UNSELECT_SUGGESTED_NETWORK";
                break;
              case 440:
                v26 = @"TAP_SET_UP_LATER";
                break;
              case 441:
                v26 = @"ADD_EV_VEHICLE";
                break;
              case 442:
                v26 = @"UPDATE_COLOR";
                break;
              case 443:
                v26 = @"SELECT_OTHER_NETWORK";
                break;
              case 444:
                v26 = @"UNSELECT_NETWORK";
                break;
              case 445:
                v26 = @"TAP_BACK";
                break;
              case 446:
                v26 = @"TAP_CANCEL";
                break;
              case 447:
                v26 = @"UNSELECT_VEHICLE";
                break;
              case 448:
                v26 = @"UNSELECT_OTHER_NETWORK";
                break;
              case 449:
                v26 = @"DISPLAY_EV_TIPKIT";
                break;
              case 450:
                v26 = @"SELECT_NETWORK";
                break;
              case 451:
                v26 = @"TAP_EV_TIPKIT";
                break;
              case 452:
                v26 = @"TAP_CHOOSE_NETWORKS";
                break;
              case 453:
                v26 = @"TAP_ADD_NETWORK";
                break;
              case 454:
                v26 = @"FILTER_NETWORK";
                break;
              case 455:
                v26 = @"SELECT_SUGGESTED_NETWORK";
                break;
              case 456:
                v26 = @"TRANSIT_TO_WALKING";
                break;
              case 457:
                v26 = @"TRANSIT_TO_FINDMY";
                break;
              case 458:
                v26 = @"TAP_AC_KEYBOARD";
                break;
              case 459:
                v26 = @"REACH_PHOTO_STRIP_END";
                break;
              case 460:
                v26 = @"SEARCH_HERE_REVEAL";
                break;
              case 461:
                v26 = @"TAP_SEARCH_HERE";
                break;
              case 462:
                v26 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
                break;
              case 463:
                v26 = @"SAVE";
                break;
              case 464:
                v26 = @"TAP_MORE_CURATED_HIKES";
                break;
              case 465:
                v26 = @"CREATE_CUSTOM_ROUTE";
                break;
              case 466:
                v26 = @"TAP_TRY_NOW";
                break;
              case 467:
                v26 = @"TAP_CURATED_HIKE";
                break;
              case 468:
                v26 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
                break;
              case 469:
                v26 = @"ADD_TO_LIBRARY";
                break;
              case 470:
                v26 = @"START_HIKING";
                break;
              case 471:
                v26 = @"EDIT_NOTE";
                break;
              case 472:
                v26 = @"CREATE_NOTE";
                break;
              case 473:
                v26 = @"DELETE_PIN";
                break;
              case 474:
                v26 = @"ADD_ROUTE";
                break;
              case 475:
                v26 = @"ADD_PIN";
                break;
              case 476:
                v26 = @"REMOVE_FROM_COLLECTION";
                break;
              case 477:
                v26 = @"REMOVE_FROM_LIBRARY";
                break;
              case 478:
                v26 = @"TAP_ITEM";
                break;
              case 479:
                v26 = @"DELETE_ROUTE";
                break;
              case 480:
                v26 = @"TAP_ROUTE";
                break;
              case 481:
                v26 = @"TAP_DOWNLOAD_WATCH_MAPS";
                break;
              case 482:
                v26 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
                break;
              case 483:
                v26 = @"STOP_DOWNLOAD_ONTO_WATCH";
                break;
              case 484:
                v26 = @"TAP_DOWNLOAD_ONTO_WATCH";
                break;
              case 485:
                v26 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
                break;
              case 486:
                v26 = @"TAP_DOWNLOAD_NOW_WATCH";
                break;
              case 487:
                v26 = @"REVEAL_DETECTION_LIST";
                break;
              case 488:
                v26 = @"TAP_RECOMMENDATION";
                break;
              case 489:
                v26 = @"TAP_EXPAND";
                break;
              case 490:
                v26 = @"EXPAND_DETECTION_LIST";
                break;
              case 1001:
                v26 = @"PAN";
                break;
              case 1002:
                v26 = @"ZOOM_IN";
                break;
              case 1003:
                v26 = @"ZOOM_OUT";
                break;
              case 1004:
                v26 = @"ROTATE";
                break;
              case 1010:
                v26 = @"TAP_POI";
                break;
              case 1011:
                v26 = @"TAP_POI_TRANSIT";
                break;
              case 1017:
                v26 = @"TAP_POI_HIGHLIGHTED";
                break;
              case 1018:
                v26 = @"TAP_POI_CLUSTERED";
                break;
              case 1020:
                v26 = @"TAP_POI_DROPPED_PIN";
                break;
              case 1030:
                v26 = @"DROP_PIN";
                break;
              case 1031:
                v26 = @"TAP_INCIDENT";
                break;
              case 1032:
                v26 = @"TAP_TRANSIT_LINE";
                break;
              case 1033:
                v26 = @"TAP_POI_CALENDAR";
                break;
              case 1034:
                v26 = @"TAP_POI_CURRENT_LOCATION";
                break;
              case 1035:
                v26 = @"TAP_POI_TRANSIT_LINE";
                break;
              case 1036:
                v26 = @"TAP_POI_LANDMARK";
                break;
              case 1037:
                v26 = @"TAP_POI_FLYOVER";
                break;
              case 1038:
                v26 = @"TAP_TO_HIDE_TRAY";
                break;
              case 1039:
                v26 = @"TAP_TO_REVEAL_TRAY";
                break;
              case 1040:
                v26 = @"TAP_COMPASS";
                break;
              case 1041:
                v26 = @"PITCH_AWAY_FROM_GROUND";
                break;
              case 1042:
                v26 = @"PITCH_CLOSER_TO_GROUND";
                break;
              case 1043:
                v26 = @"ZOOM_IN_PINCH";
                break;
              case 1044:
                v26 = @"ZOOM_OUT_PINCH";
                break;
              case 1045:
                v26 = @"ZOOM_IN_DOUBLE_TAP";
                break;
              case 1046:
                v26 = @"ZOOM_OUT_TWO_FINGER_TAP";
                break;
              case 1047:
                v26 = @"ZOOM_IN_ONE_FINGER";
                break;
              case 1048:
                v26 = @"ZOOM_OUT_ONE_FINGER";
                break;
              case 1049:
                v26 = @"ZOOM_IN_BUTTON";
                break;
              case 1050:
                v26 = @"ZOOM_OUT_BUTTON";
                break;
              case 1051:
                v26 = @"TAP_TRAFFIC_CAMERA";
                break;
              case 1052:
                v26 = @"DISPLAY_INDOOR_MAP_BUTTON";
                break;
              case 1053:
                v26 = @"OPEN_INDOOR_MAP";
                break;
              case 1054:
                v26 = @"DISPLAY_VENUE_BROWSE_BUTTON";
                break;
              case 1055:
                v26 = @"TAP_VENUE_BROWSE_BUTTON";
                break;
              case 1056:
                v26 = @"ENTER_VENUE_EXPERIENCE";
                break;
              case 1057:
                v26 = @"EXIT_VENUE_EXPERIENCE";
                break;
              case 1058:
                v26 = @"ZOOM_IN_SCENE_PINCH";
                break;
              case 1059:
                v26 = @"ZOOM_OUT_SCENE_PINCH";
                break;
              case 1060:
                v26 = @"ZOOM_RESET";
                break;
              case 1061:
                v26 = @"TAP_SCENE_UNAVAILABLE_AREA";
                break;
              case 1062:
                v26 = @"TAP_TRANSIT_ACCESS_POINT";
                break;
              case 1063:
                v26 = @"TAP_SPEED_CAMERA";
                break;
              case 1064:
                v26 = @"TAP_RED_LIGHT_CAMERA";
                break;
              case 1065:
                v26 = @"TAP_GEO";
                break;
              default:
                switch((int)v25)
                {
                  case 2001:
                    v26 = @"TAP_SEARCH_FIELD";
                    break;
                  case 2002:
                    v26 = @"CLEAR_SEARCH";
                    break;
                  case 2003:
                    v26 = @"CANCEL_SEARCH";
                    break;
                  case 2004:
                    v26 = @"TAP_BROWSE_TOP_CATEGORY";
                    break;
                  case 2005:
                    v26 = @"TAP_BROWSE_SUB_CATEGORY";
                    break;
                  case 2006:
                    v26 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
                    break;
                  case 2007:
                    v26 = @"TAP_LIST_ITEM";
                    break;
                  case 2008:
                    v26 = @"SHARE_LIST_ITEM";
                    break;
                  case 2009:
                    v26 = @"DELETE_LIST_ITEM";
                    break;
                  case 2010:
                    v26 = @"EDIT_LIST_ITEM";
                    break;
                  case 2011:
                    v26 = @"REFRESH_SEARCH";
                    break;
                  case 2012:
                    v26 = @"REVEAL_LIST_ITEM_ACTIONS";
                    break;
                  case 2013:
                    v26 = @"HIDE_LIST_ITEM_ACTIONS";
                    break;
                  case 2014:
                    v26 = @"TAP_SEARCH_BUTTON";
                    break;
                  case 2015:
                    v26 = @"SHOW_SEARCH_RESULTS";
                    break;
                  case 2016:
                    v26 = @"SHOW_REFRESH_SEARCH";
                    break;
                  case 2017:
                    v26 = @"PASTE_TEXT";
                    break;
                  case 2018:
                    v26 = @"TAP_LIST_SUB_ITEM";
                    break;
                  case 2019:
                    v26 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2020:
                    v26 = @"TAP_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2021:
                    v26 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2022:
                    v26 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2023:
                    v26 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
                    break;
                  case 2024:
                    v26 = @"RETAINED_QUERY";
                    break;
                  case 2025:
                    v26 = @"TAP_RECENT_AC_SUGGESTION";
                    break;
                  case 2026:
                    v26 = @"CLEAR_RECENT_AC_SUGGESTION";
                    break;
                  case 2027:
                    v26 = @"DELETE_RECENT_AC_SUGGESTION";
                    break;
                  case 2028:
                  case 2029:
                    goto LABEL_1405;
                  case 2030:
                    v26 = @"TAP_BROWSE_NEARBY_CATEGORY";
                    break;
                  case 2031:
                    v26 = @"TAP_SUBACTION";
                    break;
                  case 2032:
                    v26 = @"TAP_QUERY_BUILDING_ARROW";
                    break;
                  case 2033:
                    v26 = @"CLICK_ON_EDIT_SEARCH";
                    break;
                  case 2034:
                    v26 = @"REMOVE_CLIENT_AC_SUGGESTION";
                    break;
                  case 2035:
                    v26 = @"SHARE_CLIENT_AC_SUGGESTION";
                    break;
                  case 2036:
                    v26 = @"TAP_ON_MORE_RESULTS";
                    break;
                  case 2037:
                    v26 = @"SHARE_ITEM";
                    break;
                  case 2038:
                    v26 = @"HIDE_ITEM";
                    break;
                  case 2039:
                    v26 = @"TAP_SUGGESTED_ITEM";
                    break;
                  case 2040:
                    v26 = @"SHARE_SUGGESTED_ITEM";
                    break;
                  case 2041:
                    v26 = @"HIDE_SUGGESTED_ITEM";
                    break;
                  case 2042:
                    v26 = @"ADD_HOME_FAVORITE";
                    break;
                  case 2043:
                    v26 = @"ADD_WORK_FAVORITE";
                    break;
                  case 2044:
                    v26 = @"ADD_FAVORITE";
                    break;
                  case 2045:
                    v26 = @"VIEW_FAVORITES_LIST";
                    break;
                  case 2046:
                    v26 = @"TAP_HOME_FAVORITE";
                    break;
                  case 2047:
                    v26 = @"TAP_WORK_FAVORITE";
                    break;
                  case 2048:
                    v26 = @"TAP_CAR_FAVORITE";
                    break;
                  case 2049:
                    v26 = @"TAP_FAVORITE_ITEM";
                    break;
                  case 2050:
                    v26 = @"CREATE_HOME_FAVORITE";
                    break;
                  case 2051:
                    v26 = @"CREATE_WORK_FAVORITE";
                    break;
                  case 2052:
                    v26 = @"CREATE_FAVORITE";
                    break;
                  case 2053:
                    v26 = @"SUBMIT_FAVORITE_EDIT";
                    break;
                  case 2054:
                    v26 = @"ADD_RECOMMENDED_FAVORITE";
                    break;
                  case 2055:
                    v26 = @"EDIT_FAVORITE";
                    break;
                  case 2056:
                    v26 = @"REMOVE_FAVORITE";
                    break;
                  case 2057:
                    v26 = @"SHARE_FAVORITE";
                    break;
                  case 2058:
                    v26 = @"EDIT_FAVORITES";
                    break;
                  case 2059:
                    v26 = @"ADD_FAVORITE_PLACE";
                    break;
                  case 2060:
                    v26 = @"REMOVE_FAVORITE_PLACE";
                    break;
                  case 2061:
                    v26 = @"CHANGE_HOME_ADDRESS";
                    break;
                  case 2062:
                    v26 = @"CHANGE_WORK_ADDRESS";
                    break;
                  case 2063:
                    v26 = @"REFINE_LOCATION";
                    break;
                  case 2064:
                    v26 = @"TAP_RECENTLY_VIEWED_ITEM";
                    break;
                  case 2065:
                    v26 = @"SHOW_COLLECTION_LIST";
                    break;
                  case 2066:
                    v26 = @"SHOW_FAVORITES_COLLECTION";
                    break;
                  case 2067:
                    v26 = @"SHOW_COLLECTION";
                    break;
                  case 2068:
                    v26 = @"TAP_COLLECTION_ITEM";
                    break;
                  case 2069:
                    v26 = @"SHARE_COLLECTION_ITEM";
                    break;
                  case 2070:
                    v26 = @"REMOVE_COLLECTION_ITEM";
                    break;
                  case 2071:
                    v26 = @"SAVE_SHARED_COLLECTION";
                    break;
                  case 2072:
                    v26 = @"CREATE_NEW_COLLECTION";
                    break;
                  case 2073:
                    v26 = @"SAVE_TO_COLLECTION";
                    break;
                  case 2074:
                    v26 = @"EDIT_PHOTO";
                    break;
                  case 2075:
                    v26 = @"SORT_BY_NAME";
                    break;
                  case 2076:
                    v26 = @"SORT_BY_DISTANCE";
                    break;
                  case 2077:
                    v26 = @"SORT_BY_RECENT";
                    break;
                  case 2078:
                    v26 = @"AUTO_SHARE_ETA";
                    break;
                  case 2079:
                    v26 = @"CANCEL_AUTO_SHARE_ETA";
                    break;
                  case 2080:
                    v26 = @"MAP_SEARCH";
                    break;
                  case 2081:
                    v26 = @"DELETE_COLLECTION";
                    break;
                  case 2082:
                    v26 = @"SHARE_COLLECTION";
                    break;
                  case 2083:
                    v26 = @"SHOW_TRANSIT_LINES_COLLECTION";
                    break;
                  case 2084:
                    v26 = @"SHOW_MY_PLACES";
                    break;
                  case 2085:
                    v26 = @"SHOW_ALL_PLACES";
                    break;
                  case 2086:
                    v26 = @"TAP_RECENT_QUERY";
                    break;
                  case 2087:
                    v26 = @"TAP_QUERY_SUGGESTION";
                    break;
                  case 2088:
                    v26 = @"DELETE_CURATED_COLLECTION";
                    break;
                  case 2089:
                    v26 = @"FOLLOW";
                    break;
                  case 2090:
                    v26 = @"PUNCH_IN";
                    break;
                  case 2091:
                    v26 = @"SAVE_CURATED_COLLECTION";
                    break;
                  case 2092:
                    v26 = @"SCROLL_LEFT_COLLECTIONS";
                    break;
                  case 2093:
                    v26 = @"SCROLL_RIGHT_COLLECTIONS";
                    break;
                  case 2094:
                    v26 = @"SEE_ALL_CURATED_COLLECTION";
                    break;
                  case 2095:
                    v26 = @"SEE_ALL_PUBLISHERS";
                    break;
                  case 2096:
                    v26 = @"SHARE_CURATED_COLLECTION";
                    break;
                  case 2097:
                    v26 = @"SHARE_PUBLISHER";
                    break;
                  case 2098:
                    v26 = @"SHOW_MORE_COLLECTION";
                    break;
                  case 2099:
                    v26 = @"TAP_CURATED_COLLECTION";
                    break;
                  case 2100:
                    v26 = @"TAP_FEATURED_COLLECTIONS";
                    break;
                  case 2101:
                    v26 = @"TAP_LOCATION";
                    break;
                  case 2102:
                    v26 = @"TAP_PUBLISHER";
                    break;
                  case 2103:
                    v26 = @"TAP_PUBLISHER_APP";
                    break;
                  case 2104:
                    v26 = @"TAP_PUBLISHER_COLLECTIONS";
                    break;
                  case 2105:
                    v26 = @"UNFOLLOW";
                    break;
                  case 2106:
                    v26 = @"CHANGE_SCHOOL_ADDRESS";
                    break;
                  case 2107:
                    v26 = @"ADD_VEHICLE";
                    break;
                  case 2108:
                    v26 = @"DISPLAY_VIRTUAL_GARAGE";
                    break;
                  case 2109:
                    v26 = @"ENTER_VIRTUAL_GARAGE";
                    break;
                  case 2110:
                    v26 = @"PUNCH_OUT_MANUFACTURER_APP";
                    break;
                  case 2111:
                    v26 = @"REMOVE_LICENSE_PLATE";
                    break;
                  case 2112:
                    v26 = @"REMOVE_VEHICLE";
                    break;
                  case 2113:
                    v26 = @"SELECT_VEHICLE";
                    break;
                  case 2114:
                    v26 = @"SUBMIT_LICENSE_PLATE";
                    break;
                  case 2115:
                    v26 = @"TAP_ADD_LICENSE_PLATE";
                    break;
                  case 2116:
                    v26 = @"TAP_ADD_NEW_CAR";
                    break;
                  case 2117:
                    v26 = @"TAP_BANNER";
                    break;
                  case 2118:
                    v26 = @"TAP_CONNECT";
                    break;
                  case 2119:
                    v26 = @"TAP_CONTINUE";
                    break;
                  case 2120:
                    v26 = @"TAP_EDIT";
                    break;
                  case 2121:
                    v26 = @"TAP_NAME";
                    break;
                  case 2122:
                    v26 = @"TAP_NOT_NOW";
                    break;
                  case 2123:
                    v26 = @"TAP_OTHER_VEHICLE";
                    break;
                  case 2124:
                    v26 = @"TAP_REMOVE_LICENSE_PLATE";
                    break;
                  case 2125:
                    v26 = @"TAP_UPDATE_PLATE_NUMBER";
                    break;
                  case 2126:
                    v26 = @"TAP_VEHICLE";
                    break;
                  case 2127:
                    v26 = @"TAP_VEHICLE_NAME";
                    break;
                  case 2128:
                    v26 = @"UPDATE_NAME";
                    break;
                  case 2129:
                    v26 = @"DONE_TAKING_PHOTO";
                    break;
                  case 2130:
                    v26 = @"ENABLE_SHOW_PHOTO_NAME";
                    break;
                  case 2131:
                    v26 = @"SUBMIT_PHOTO";
                    break;
                  case 2132:
                    v26 = @"USE_PHOTO";
                    break;
                  case 2133:
                    v26 = @"ADD_RECOMMENDATION_TO_MAPS";
                    break;
                  case 2134:
                    v26 = @"CANCEL_PHOTO_SUBMISSION";
                    break;
                  case 2135:
                    v26 = @"CLOSE_RECOMMENDATION_CARD";
                    break;
                  case 2136:
                    v26 = @"EDIT_RATING";
                    break;
                  case 2137:
                    v26 = @"PROMPTED_TO_ADD_PHOTO";
                    break;
                  case 2138:
                    v26 = @"PROMPTED_TO_ADD_RATING";
                    break;
                  case 2139:
                    v26 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
                    break;
                  case 2140:
                    v26 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
                    break;
                  case 2141:
                    v26 = @"RETAKE_PHOTO";
                    break;
                  case 2142:
                    v26 = @"REVEAL_RECOMMENDATION_CARD";
                    break;
                  case 2143:
                    v26 = @"SUBMIT_NEGATIVE_RATING";
                    break;
                  case 2144:
                    v26 = @"SUBMIT_POSITIVE_RATING";
                    break;
                  case 2145:
                    v26 = @"TAP_CHOOSING_PHOTO";
                    break;
                  case 2146:
                    v26 = @"TAP_TAKE_NEW_PHOTO";
                    break;
                  case 2147:
                    v26 = @"TAP_TO_ADD_PHOTO";
                    break;
                  case 2148:
                    v26 = @"CANCEL_INCIDENT_REPORT";
                    break;
                  case 2149:
                    v26 = @"INCIDENT_REPORT_SUBMITTED";
                    break;
                  case 2150:
                    v26 = @"REPORTED_INCIDENT_NOT_RECEIVED";
                    break;
                  case 2151:
                    v26 = @"REPORTED_INCIDENT_RECEIVED";
                    break;
                  case 2152:
                    v26 = @"REPORT_INCIDENT";
                    break;
                  case 2153:
                    v26 = @"SELECT_INCIDENT_TYPE";
                    break;
                  case 2154:
                    v26 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
                    break;
                  case 2155:
                    v26 = @"TAP_TO_START_REPORT_INCIDENT";
                    break;
                  case 2156:
                    v26 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
                    break;
                  case 2157:
                    v26 = @"ATTEMPT_VLF_CORRECTION";
                    break;
                  case 2158:
                    v26 = @"DISMISS_VLF_PROMPT";
                    break;
                  case 2159:
                    v26 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
                    break;
                  case 2160:
                    v26 = @"VLF_CORRECTION_FAILED";
                    break;
                  case 2161:
                    v26 = @"VLF_CORRECTION_SUCCESSFUL";
                    break;
                  case 2162:
                    v26 = @"ENABLE_WIDGET_SUGGESTIONS";
                    break;
                  case 2163:
                    v26 = @"DISPLAY_CZ_ADVISORY";
                    break;
                  case 2164:
                    v26 = @"PUNCH_OUT_URL_PAY";
                    break;
                  case 2165:
                    v26 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
                    break;
                  case 2166:
                    v26 = @"DELETE_ITEM";
                    break;
                  case 2167:
                    v26 = @"CANCEL_REMOVE";
                    break;
                  case 2168:
                    v26 = @"DELETE_SUGGESTION";
                    break;
                  case 2169:
                    v26 = @"ADD_SCHOOL_FAVORITE";
                    break;
                  case 2170:
                    v26 = @"GO_TO_WEBSITE";
                    break;
                  case 2171:
                    v26 = @"TRY_AGAIN";
                    break;
                  case 2172:
                    v26 = @"CHECK_AUTO_RECORD_WORKOUT";
                    break;
                  case 2173:
                    v26 = @"CHECK_EBIKE";
                    break;
                  case 2174:
                    v26 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
                    break;
                  case 2175:
                    v26 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
                    break;
                  case 2176:
                    v26 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
                    break;
                  case 2177:
                    v26 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
                    break;
                  case 2178:
                    v26 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
                    break;
                  case 2179:
                    v26 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
                    break;
                  case 2180:
                    v26 = @"TAP_CYCLING_DEFAULT_OPTION";
                    break;
                  case 2181:
                    v26 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
                    break;
                  case 2182:
                    v26 = @"TAP_CYCLING_STAIRS_ADVISORY";
                    break;
                  case 2183:
                    v26 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
                    break;
                  case 2184:
                    v26 = @"UNCHECK_AUTO_RECORD_WORKOUT";
                    break;
                  case 2185:
                    v26 = @"UNCHECK_EBIKE";
                    break;
                  case 2186:
                    v26 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
                    break;
                  case 2187:
                    v26 = @"DISPLAY_LPR_ADVISORY";
                    break;
                  case 2188:
                    v26 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
                    break;
                  case 2189:
                    v26 = @"CREATE_WIDGET";
                    break;
                  case 2190:
                    v26 = @"REVEAL_WIDGET_TRAY";
                    break;
                  case 2191:
                    v26 = @"LPR_ERROR_CODE";
                    break;
                  case 2192:
                    v26 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
                    break;
                  case 2193:
                    v26 = @"TAP_CLEAR_RECENTLY_VIEWED";
                    break;
                  case 2194:
                    v26 = @"LPR_HARD_STOP";
                    break;
                  case 2195:
                    v26 = @"TAP_PUBLISHER_SUBACTION";
                    break;
                  case 2196:
                    v26 = @"CARPLAY_DISPLAY_ACTIVATED";
                    break;
                  case 2197:
                    v26 = @"CARPLAY_DISPLAY_DEACTIVATED";
                    break;
                  case 2198:
                    v26 = @"TAP_FEATURED_COLLECTION";
                    break;
                  case 2199:
                    v26 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
                    break;
                  case 2200:
                    v26 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
                    break;
                  default:
                    switch((int)v25)
                    {
                      case 3001:
                        v26 = @"START_NAV";
                        break;
                      case 3002:
                        v26 = @"END_NAV";
                        break;
                      case 3003:
                        v26 = @"OPEN_NAV_AUDIO_SETTINGS";
                        break;
                      case 3004:
                        v26 = @"VIEW_DETAILS";
                        break;
                      case 3005:
                        v26 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                        break;
                      case 3006:
                        v26 = @"OPEN_ROUTING_EDITOR";
                        break;
                      case 3007:
                        v26 = @"EDIT_ORIGIN";
                        break;
                      case 3008:
                        v26 = @"EDIT_DESTINATION";
                        break;
                      case 3009:
                        v26 = @"SWAP_ORIGIN_DESTINATION";
                        break;
                      case 3010:
                        v26 = @"OPEN_MORE_ROUTES";
                        break;
                      case 3011:
                        v26 = @"SELECT_ROUTING_TYPE_DRIVING";
                        break;
                      case 3012:
                        v26 = @"SELECT_ROUTING_TYPE_WALKING";
                        break;
                      case 3013:
                        v26 = @"SELECT_ROUTING_TYPE_TRANSIT";
                        break;
                      case 3014:
                        v26 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                        break;
                      case 3015:
                        v26 = @"SELECT_ROUTE";
                        break;
                      case 3016:
                        v26 = @"COLLAPSE_STEP_DETAILS_WALK";
                        break;
                      case 3017:
                        v26 = @"EXPAND_STEP_DETAILS_WALK";
                        break;
                      case 3018:
                        v26 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                        break;
                      case 3019:
                        v26 = @"EXPAND_STEP_DETAILS_TRANSIT";
                        break;
                      case 3020:
                        v26 = @"UNCHECK_BUS";
                        break;
                      case 3021:
                        v26 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                        break;
                      case 3022:
                        v26 = @"UNCHECK_COMMUTER_RAIL";
                        break;
                      case 3023:
                        v26 = @"UNCHECK_FERRY";
                        break;
                      case 3024:
                        v26 = @"CHECK_BUS";
                        break;
                      case 3025:
                        v26 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                        break;
                      case 3026:
                        v26 = @"CHECK_COMMUTER_RAIL";
                        break;
                      case 3027:
                        v26 = @"CHECK_FERRY";
                        break;
                      case 3028:
                        v26 = @"SELECT_LEAVE_AT";
                        break;
                      case 3029:
                        v26 = @"SELECT_ARRIVE_BY";
                        break;
                      case 3030:
                        v26 = @"SELECT_LEAVE_NOW";
                        break;
                      case 3031:
                        v26 = @"SELECT_DATE_TIME";
                        break;
                      case 3032:
                        v26 = @"SWITCH_ON_IC_FARES";
                        break;
                      case 3033:
                        v26 = @"SWITCH_OFF_IC_FARES";
                        break;
                      case 3034:
                        v26 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                        break;
                      case 3035:
                        v26 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                        break;
                      case 3036:
                        v26 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                        break;
                      case 3037:
                        v26 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                        break;
                      case 3038:
                        v26 = @"REVEAL_FROM_ROUTING";
                        break;
                      case 3039:
                        v26 = @"DISPLAY_ROUTES";
                        break;
                      case 3040:
                        v26 = @"CHECK_RECOMMENDED_ROUTES";
                        break;
                      case 3041:
                        v26 = @"UNCHECK_RECOMMENDED_ROUTES";
                        break;
                      case 3042:
                        v26 = @"CHECK_FASTER_TRIPS";
                        break;
                      case 3043:
                        v26 = @"UNCHECK_FASTER_TRIPS";
                        break;
                      case 3044:
                        v26 = @"CHECK_FEWER_TRANSFERS";
                        break;
                      case 3045:
                        v26 = @"UNCHECK_FEWER_TRANSFERS";
                        break;
                      case 3046:
                        v26 = @"CHECK_LESS_WALKING";
                        break;
                      case 3047:
                        v26 = @"UNCHECK_LESS_WALKING";
                        break;
                      case 3048:
                        v26 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                        break;
                      case 3049:
                        v26 = @"TAP_MORE_ROUTES";
                        break;
                      case 3050:
                        v26 = @"OPEN_NAV_OVERVIEW";
                        break;
                      case 3051:
                        v26 = @"RESUME_NAV_MANEUVER_VIEW";
                        break;
                      case 3052:
                        v26 = @"SELECT_AUDIO_VOLUME_SILENT";
                        break;
                      case 3053:
                        v26 = @"SELECT_AUDIO_VOLUME_LOW";
                        break;
                      case 3054:
                        v26 = @"SELECT_AUDIO_VOLUME_NORMAL";
                        break;
                      case 3055:
                        v26 = @"SELECT_AUDIO_VOLUME_LOUD";
                        break;
                      case 3056:
                        v26 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                        break;
                      case 3057:
                        v26 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                        break;
                      case 3058:
                        v26 = @"RESUME_PREV_NAV";
                        break;
                      case 3059:
                        v26 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                        break;
                      case 3060:
                        v26 = @"ACCEPT_REROUTE";
                        break;
                      case 3061:
                        v26 = @"DISMISS_REROUTE";
                        break;
                      case 3062:
                        v26 = @"ATTEMPT_END_NAV";
                        break;
                      case 3063:
                        v26 = @"DISPLAY_BANNER";
                        break;
                      case 3064:
                        v26 = @"VIEW_BANNER_DETAILS";
                        break;
                      case 3065:
                        v26 = @"ENTER_GUIDANCE";
                        break;
                      case 3066:
                        v26 = @"AUTO_ADVANCE_GUIDANCE";
                        break;
                      case 3067:
                        v26 = @"TAP_OPEN_WALLET";
                        break;
                      case 3068:
                        v26 = @"SELECT_VOICE_GUIDANCE_ALL";
                        break;
                      case 3069:
                        v26 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                        break;
                      case 3070:
                        v26 = @"SELECT_VOICE_GUIDANCE_NONE";
                        break;
                      case 3071:
                        v26 = @"DISPLAY_CARD";
                        break;
                      case 3072:
                        v26 = @"RENDER_ROUTE";
                        break;
                      case 3073:
                        v26 = @"DISPLAY_JUNCTION_VIEW";
                        break;
                      case 3074:
                        v26 = @"SELECT_DEPARTURE";
                        break;
                      case 3075:
                        v26 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                        break;
                      case 3076:
                        v26 = @"DEVICE_RAISE";
                        break;
                      case 3077:
                        v26 = @"ENTER_AR_NAV_VIEW";
                        break;
                      case 3078:
                        v26 = @"EXIT_AR_NAV_VIEW";
                        break;
                      case 3079:
                        v26 = @"AR_CALIBRATION_START";
                        break;
                      case 3080:
                        v26 = @"AR_CALIBRATION_FAILURE";
                        break;
                      case 3081:
                        v26 = @"AR_CALIBRATION_SUCCESS";
                        break;
                      case 3082:
                        v26 = @"DISPLAY_AR_NAV_ARROW";
                        break;
                      case 3083:
                        v26 = @"DISPLAY_AR_NAV_TURN_AROUND";
                        break;
                      case 3084:
                        v26 = @"DISPLAY_GO_OUTSIDE_BANNER";
                        break;
                      case 3085:
                        v26 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                        break;
                      case 3086:
                        v26 = @"DISPLAY_AR_NAV_ENDPOINT";
                        break;
                      case 3087:
                        v26 = @"DISPLAY_ADVISORY_BANNER";
                        break;
                      case 3088:
                        v26 = @"TAP_SHOW_ADVISORY_DETAILS";
                        break;
                      default:
                        goto LABEL_1405;
                    }
                    break;
                }
                break;
            }
          }
          [v22 addObject:v26];

          ++v24;
          v23 = (void *)(a1 + 16);
        }
        while (v24 < *(void *)(a1 + 24));
      }
      if (a2) {
        v27 = @"impossibleAction";
      }
      else {
        v27 = @"impossible_action";
      }
      [v4 setObject:v22 forKey:v27];
    }
    __int16 v28 = *(_WORD *)(a1 + 112);
    if ((v28 & 0x10) != 0)
    {
      v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
      [v4 setObject:v33 forKey:@"verticalIndex"];

      __int16 v28 = *(_WORD *)(a1 + 112);
      if ((v28 & 1) == 0)
      {
LABEL_2695:
        if ((v28 & 2) == 0) {
          goto LABEL_2696;
        }
        goto LABEL_2707;
      }
    }
    else if ((v28 & 1) == 0)
    {
      goto LABEL_2695;
    }
    v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v34 forKey:@"horizontalIndex"];

    __int16 v28 = *(_WORD *)(a1 + 112);
    if ((v28 & 2) == 0)
    {
LABEL_2696:
      if ((v28 & 8) != 0)
      {
LABEL_2697:
        v29 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
        if (a2) {
          v30 = @"repeatableSectionIndex";
        }
        else {
          v30 = @"repeatable_section_index";
        }
        [v4 setObject:v29 forKey:v30];
      }
LABEL_2701:
      id v31 = v4;

      goto LABEL_2702;
    }
LABEL_2707:
    v35 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
    [v4 setObject:v35 forKey:@"localSearchProviderID"];

    if ((*(_WORD *)(a1 + 112) & 8) != 0) {
      goto LABEL_2697;
    }
    goto LABEL_2701;
  }
  id v31 = 0;
LABEL_2702:

  return v31;
}

- (GEOLogMsgStateCuratedCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateCuratedCollection;
  v2 = [(GEOLogMsgStateCuratedCollection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateCuratedCollection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateCuratedCollection;
  v3 = [(GEOLogMsgStateCuratedCollection *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgStateCuratedCollection;
  [(GEOLogMsgStateCuratedCollection *)&v3 dealloc];
}

- (void)_readPublisherDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateCuratedCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPublisherDetails
{
  return self->_publisherDetails != 0;
}

- (GEOPublisherDetails)publisherDetails
{
  -[GEOLogMsgStateCuratedCollection _readPublisherDetails]((uint64_t)self);
  publisherDetails = self->_publisherDetails;

  return publisherDetails;
}

- (void)setPublisherDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_publisherDetails, a3);
}

- (void)_readCollectionDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateCuratedCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasCollectionDetails
{
  return self->_collectionDetails != 0;
}

- (GEOCollectionDetails)collectionDetails
{
  -[GEOLogMsgStateCuratedCollection _readCollectionDetails]((uint64_t)self);
  collectionDetails = self->_collectionDetails;

  return collectionDetails;
}

- (void)setCollectionDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_collectionDetails, a3);
}

- (int)placecardType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_placecardType;
  }
  else {
    return 0;
  }
}

- (void)setPlacecardType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_placecardType = a3;
}

- (void)setHasPlacecardType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPlacecardType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)placecardTypeAsString:(int)a3
{
  if a3 < 0x12 && ((0x2FFFFu >> a3))
  {
    __int16 v3 = off_1E53F82C0[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (void)_readPossibleActions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateCuratedCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPossibleActions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
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
  *(_WORD *)&self->_flags |= 0x200u;

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
  *(_WORD *)&self->_flags |= 0x200u;
}

- (int)possibleActionAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateCuratedCollection _readPossibleActions]((uint64_t)self);
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
  *(_WORD *)&self->_flags |= 0x200u;

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
            int v4 = @"TAP_WIDGET_ITEM";
            break;
          case 9002:
            int v4 = @"DISPLAY_NOTIFICATION";
            break;
          case 9003:
            int v4 = @"TAP_NOTIFICATION";
            break;
          case 9004:
            int v4 = @"EXPAND_NOTIFICATION";
            break;
          case 9005:
            int v4 = @"DISMISS_NOTIFICATION";
            break;
          case 9006:
            int v4 = @"OPEN_SEARCH";
            break;
          case 9007:
            int v4 = @"OPEN_PAN_VIEW";
            break;
          case 9008:
            int v4 = @"PAN_LEFT";
            break;
          case 9009:
            int v4 = @"PAN_UP";
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
            int v4 = @"PAN_DOWN";
            break;
          case 9012:
            int v4 = @"TAP_RECENT_DESTINATIONS";
            break;
          case 9013:
            int v4 = @"OPEN_DESTINATIONS";
            break;
          case 9014:
            int v4 = @"OPEN_FAVORITES";
            break;
          case 9015:
            int v4 = @"VIEW_NAV_OPTIONS";
            break;
          case 9016:
            int v4 = @"START_NAV_NO_GUIDANCE";
            break;
          case 9017:
            int v4 = @"TURN_OFF_GUIDANCE";
            break;
          case 9018:
            int v4 = @"TURN_ON_GUIDANCE";
            break;
          case 9019:
            int v4 = @"OPEN_KEYBOARD";
            break;
          case 9020:
            int v4 = @"SHARE_DESTINATION";
            break;
          case 9021:
            int v4 = @"START_NAV_AUTOMATED";
            break;
          case 9022:
            int v4 = @"SHARE_ETA";
            break;
          case 9023:
            int v4 = @"SELECT_GROUP";
            break;
          case 9024:
            int v4 = @"DESELECT_GROUP";
            break;
          case 9025:
            int v4 = @"SELECT_CONTACT";
            break;
          case 9026:
            int v4 = @"DESELECT_CONTACT";
            break;
          case 9027:
            int v4 = @"TAP_VIEW_CONTACTS";
            break;
          case 9028:
            int v4 = @"STOP_RECEIVING_ETA";
            break;
          case 9029:
            int v4 = @"DISPLAY_ANNOUNCEMENT";
            break;
          case 9030:
            int v4 = @"TAP_ANNOUNCEMENT";
            break;
          case 9031:
            int v4 = @"DISPLAY_CYCLING_NOTIFICATION";
            break;
          case 9032:
            int v4 = @"TAP_CYCLING_NOTIFICATION";
            break;
          case 9033:
            int v4 = @"SHARE_CYCLING_ETA";
            break;
          case 9034:
            int v4 = @"MANAGE_NOTIFICATIONS";
            break;
          case 9035:
            int v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
            break;
          case 9036:
            int v4 = @"SCROLL_FORWARD";
            break;
          case 9037:
            int v4 = @"SCROLL_BACKWARD";
            break;
          case 9038:
            int v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
            break;
          case 9039:
            int v4 = @"TAP_LESS";
            break;
          case 9040:
            int v4 = @"TAP_MORE";
            break;
          case 9101:
            int v4 = @"DISPLAY_ADD_HOME_AND_WORK";
            break;
          case 9102:
            int v4 = @"TAP_ADD_HOME_AND_WORK";
            break;
          case 9103:
            int v4 = @"DISPLAY_ALLOW_FREQUENTS";
            break;
          case 9104:
            int v4 = @"TAP_ALLOW_FREQUENTS";
            break;
          case 9105:
            int v4 = @"DISPLAY_ALLOW_LOCATION";
            break;
          case 9106:
            int v4 = @"TAP_ALLOW_LOCATION";
            break;
          default:
            switch(a3)
            {
              case 7001:
                int v4 = @"EXPAND_TRANSIT_SYSTEM";
                break;
              case 7002:
                int v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                break;
              case 7003:
                int v4 = @"SHOW_MORE_DEPARTURES";
                break;
              case 7004:
                int v4 = @"VIEW_TRANSIT_LINE";
                break;
              case 7005:
                int v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                break;
              case 7006:
                int v4 = @"TAP_TRANSIT_ATTRIBUTION";
                break;
              case 7007:
                int v4 = @"TAP_TRANSIT_ADVISORY";
                break;
              case 7008:
                int v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                break;
              case 7009:
                int v4 = @"SUBSCRIBE_LINE_INCIDENT";
                break;
              case 7010:
                int v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                break;
              case 7011:
                int v4 = @"TAP_NEAREST_STATION";
                break;
              case 7012:
                int v4 = @"TAP_NEAREST_STOP";
                break;
              case 7013:
                int v4 = @"TAP_CONNECTION";
                break;
              case 7014:
                int v4 = @"GET_TICKETS";
                break;
              case 7015:
                int v4 = @"OPEN_SCHEDULECARD_DATETIME";
                break;
              case 7016:
                int v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                break;
              case 7017:
                int v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                break;
              case 7018:
                int v4 = @"VIEW_ON_MAP";
                break;
              case 7019:
                int v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                break;
              case 7020:
                int v4 = @"TAP_TRANSIT_LINE_INFO";
                break;
              case 7021:
                int v4 = @"TAP_ATTRIBUTION_CELL";
                break;
              case 7022:
                int v4 = @"TAP_NEXT_DEPARTURES";
                break;
              case 7023:
                int v4 = @"VIEW_BANNER";
                break;
              case 7024:
                int v4 = @"GET_SHOWTIMES";
                break;
              case 7025:
                int v4 = @"MAKE_APPOINTMENT";
                break;
              case 7026:
                int v4 = @"RESERVE_PARKING";
                break;
              case 7027:
                int v4 = @"RESERVE_ROOM";
                break;
              case 7028:
                int v4 = @"WAITLIST";
                break;
              case 7029:
                int v4 = @"ORDER_TAKEOUT";
                break;
              case 7030:
                int v4 = @"RESERVE";
                break;
              default:
                switch(a3)
                {
                  case 8001:
                    int v4 = @"INVOKE_SIRI_SNIPPET";
                    break;
                  case 8002:
                    int v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                    break;
                  case 8003:
                    int v4 = @"SHOW_PLACE_DETAILS";
                    break;
                  case 8004:
                    int v4 = @"ANSWER_REROUTE_SUGGESTION";
                    break;
                  case 8005:
                    int v4 = @"SUGGEST_NAV_REROUTE";
                    break;
                  case 8006:
                    int v4 = @"GET_NAV_STATUS";
                    break;
                  case 8007:
                    int v4 = @"REPEAT_NAV_STATUS";
                    break;
                  case 8008:
                    int v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                    break;
                  case 8009:
                    int v4 = @"INVOKE_SIRI";
                    break;
                  case 8010:
                    int v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                    break;
                  case 8011:
                    int v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
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
            int v4 = @"GET_DIRECTIONS";
            break;
          case 6004:
            int v4 = @"TAP_FLYOVER_TOUR";
            break;
          case 6005:
            int v4 = @"REMOVE_PIN";
            break;
          case 6006:
            int v4 = @"TAP_PHOTO";
            break;
          case 6007:
            int v4 = @"TAP_MAPS_VIEW";
            break;
          case 6008:
            int v4 = @"TAP_ADDRESS";
            break;
          case 6009:
            int v4 = @"CALL";
            break;
          case 6010:
            int v4 = @"TAP_URL";
            break;
          case 6011:
            int v4 = @"SHOW_TODAY_HOURS";
            break;
          case 6012:
            int v4 = @"SHOW_ALL_HOURS";
            break;
          case 6013:
            int v4 = @"SHARE";
            break;
          case 6014:
          case 6017:
          case 6028:
          case 6030:
          case 6035:
            goto LABEL_84;
          case 6015:
            int v4 = @"ADD_TO_FAVORITES";
            break;
          case 6016:
            int v4 = @"ADD_CONTACT";
            break;
          case 6018:
            int v4 = @"PUNCH_OUT_PHOTO";
            break;
          case 6019:
            int v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
            break;
          case 6020:
            int v4 = @"PUNCH_OUT_OPEN_APP";
            break;
          case 6021:
            int v4 = @"PUNCH_OUT_SINGLE_REVIEW";
            break;
          case 6022:
            int v4 = @"PUNCH_OUT_CHECK_IN";
            break;
          case 6023:
            int v4 = @"PUNCH_OUT_MORE_INFO";
            break;
          case 6024:
            int v4 = @"PUNCH_OUT_WRITE_REVIEW";
            break;
          case 6025:
            int v4 = @"PUNCH_OUT_ADD_PHOTO";
            break;
          case 6026:
            int v4 = @"TAP_GRID_VIEW";
            break;
          case 6027:
            int v4 = @"EDIT_LOCATION";
            break;
          case 6029:
            int v4 = @"ADD_PHOTO";
            break;
          case 6031:
            int v4 = @"RETAKE";
            break;
          case 6032:
            int v4 = @"ADD_NOTE";
            break;
          case 6033:
            int v4 = @"REMOVE_CAR";
            break;
          case 6034:
            int v4 = @"EDIT_NAME";
            break;
          case 6036:
            int v4 = @"RESERVE_TABLE";
            break;
          case 6037:
            int v4 = @"ADD_TO_QUEUE";
            break;
          case 6038:
            int v4 = @"VIEW_BOOKED_TABLE";
            break;
          case 6039:
            int v4 = @"VIEW_QUEUED_TABLE";
            break;
          case 6040:
            int v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
            break;
          case 6041:
            int v4 = @"PUNCH_OUT_LEGAL_LINK";
            break;
          case 6042:
            int v4 = @"TAP_PLACECARD_HEADER";
            break;
          case 6043:
            int v4 = @"REMOVE_FROM_FAVORITES";
            break;
          case 6044:
            int v4 = @"VIEW_CONTACT";
            break;
          case 6045:
            int v4 = @"CHAT";
            break;
          case 6046:
            int v4 = @"FIND_STORES";
            break;
          case 6047:
            int v4 = @"TAP_PARENT";
            break;
          case 6048:
            int v4 = @"SCROLL_LEFT_PHOTOS";
            break;
          case 6049:
            int v4 = @"SCROLL_RIGHT_PHOTOS";
            break;
          case 6050:
            int v4 = @"PUNCH_OUT";
            break;
          case 6051:
            int v4 = @"TAP_ENTER_MUNIN";
            break;
          case 6052:
            int v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
            break;
          case 6053:
            int v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
            break;
          case 6054:
            int v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
            break;
          case 6055:
            int v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6056:
            int v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6057:
            int v4 = @"SHOW_LINKED_SERVICE_HOURS";
            break;
          case 6058:
            int v4 = @"ENTER_LOOK_AROUND";
            break;
          case 6059:
            int v4 = @"EXIT_LOOK_AROUND";
            break;
          case 6060:
            int v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
            break;
          case 6061:
            int v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
            break;
          case 6062:
            int v4 = @"EXPAND_LOOK_AROUND_VIEW";
            break;
          case 6063:
            int v4 = @"CLOSE_LOOK_AROUND";
            break;
          case 6064:
            int v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
            break;
          case 6065:
            int v4 = @"TAP_SHOW_ACTIONS";
            break;
          case 6066:
            int v4 = @"TAP_HIDE_LABELS";
            break;
          case 6067:
            int v4 = @"TAP_SHOW_LABELS";
            break;
          case 6068:
            int v4 = @"TAP_SHOW_DETAILS";
            break;
          case 6069:
            int v4 = @"PAN_LOOK_AROUND";
            break;
          case 6070:
            int v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
            break;
          case 6071:
            int v4 = @"TAP_LANDMARK";
            break;
          case 6072:
            int v4 = @"TAP_SCENE";
            break;
          case 6073:
            int v4 = @"SHOW_LINKED_BUSINESS_HOURS";
            break;
          case 6074:
            int v4 = @"TAP_PLACECARD_SHORTCUT";
            break;
          case 6075:
            int v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
            break;
          case 6076:
            int v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
            break;
          case 6077:
            int v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
            break;
          case 6078:
            int v4 = @"TAP_PARENT_LOCATION";
            break;
          case 6079:
            int v4 = @"TAP_SIMILAR_LOCATION";
            break;
          case 6080:
            int v4 = @"TAP_LOCATION_INSIDE";
            break;
          case 6081:
            int v4 = @"TAP_LOCATION_AT_ADDRESS";
            break;
          case 6082:
            int v4 = @"CLOSE_ROUTE_GENIUS";
            break;
          case 6083:
            int v4 = @"LOAD_WEB_CONTENT";
            break;
          case 6084:
            int v4 = @"SCROLL_FORWARD_WEB_CONTENT";
            break;
          case 6085:
            int v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
            break;
          case 6086:
            int v4 = @"TAP_WEB_CONTENT";
            break;
          case 6087:
            int v4 = @"SHOW_PHOTO_VIEWER";
            break;
          case 6088:
            int v4 = @"SHOW_LAST_PAGE";
            break;
          case 6089:
            int v4 = @"TAP_VIEW_APP";
            break;
          case 6090:
            int v4 = @"TAP_APP_CLIP";
            break;
          case 6091:
            int v4 = @"DEAD_BATTERY";
            break;
          case 6092:
            int v4 = @"DISMISS_LOW_BATTERY_ALERT";
            break;
          case 6093:
            int v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
            break;
          case 6094:
            int v4 = @"FAILED_TO_LOAD_EV_STATUS";
            break;
          case 6095:
            int v4 = @"LOW_BATTERY_ALERT";
            break;
          case 6096:
            int v4 = @"PAUSE_ROUTE";
            break;
          case 6097:
            int v4 = @"TAP_ADD_STOP";
            break;
          case 6098:
            int v4 = @"TAP_CHARGE_POINT";
            break;
          case 6099:
            int v4 = @"TAP_OUT_OF_RANGE_ALERT";
            break;
          case 6100:
            int v4 = @"SCROLL_DOWN_PHOTOS";
            break;
          case 6101:
            int v4 = @"SCROLL_UP_PHOTOS";
            break;
          case 6102:
            int v4 = @"TAP_MORE_PHOTOS";
            break;
          case 6103:
            int v4 = @"TAP_TO_CONFIRM_INCIDENT";
            break;
          case 6104:
            int v4 = @"SHOW_INCIDENT";
            break;
          case 6105:
            int v4 = @"REVEAL_APP_CLIP";
            break;
          case 6106:
            int v4 = @"ORDER_DELIVERY";
            break;
          case 6107:
            int v4 = @"VIEW_MENU";
            break;
          case 6108:
            int v4 = @"TAP_EDIT_STOPS";
            break;
          case 6109:
            int v4 = @"LEARN_MORE_WEB_CONTENT";
            break;
          case 6110:
            int v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
            break;
          case 6111:
            int v4 = @"REVEAL_SHOWCASE";
            break;
          default:
            switch(a3)
            {
              case 5001:
                int v4 = @"SHOW_MAPS_SETTINGS";
                break;
              case 5002:
                int v4 = @"TAP_STANDARD_MODE";
                break;
              case 5003:
                int v4 = @"TAP_TRANSIT_MODE";
                break;
              case 5004:
                int v4 = @"TAP_SATELLITE_MODE";
                break;
              case 5005:
                int v4 = @"SWITCH_ON_TRAFFIC";
                break;
              case 5006:
                int v4 = @"SWITCH_OFF_TRAFFIC";
                break;
              case 5007:
                int v4 = @"SWITCH_ON_LABELS";
                break;
              case 5008:
                int v4 = @"SWITCH_OFF_LABELS";
                break;
              case 5009:
                int v4 = @"SWITCH_ON_3D_MAP";
                break;
              case 5010:
                int v4 = @"SWITCH_OFF_3D_MAP";
                break;
              case 5011:
                int v4 = @"SWITCH_ON_WEATHER";
                break;
              case 5012:
                int v4 = @"SWITCH_OFF_WEATHER";
                break;
              case 5013:
                int v4 = @"REPORT_A_PROBLEM";
                break;
              case 5014:
                int v4 = @"ADD_PLACE";
                break;
              case 5015:
                goto LABEL_84;
              case 5016:
                int v4 = @"TAP_PREFERENCES";
                break;
              case 5017:
                int v4 = @"SWITCH_ON_TOLLS";
                break;
              case 5018:
                int v4 = @"SWITCH_OFF_TOLLS";
                break;
              case 5019:
                int v4 = @"SWITCH_ON_HIGHWAYS";
                break;
              case 5020:
                int v4 = @"SWITCH_OFF_HIGHWAYS";
                break;
              case 5021:
                int v4 = @"SWITCH_ON_HEADING";
                break;
              case 5022:
                int v4 = @"SWITCH_OFF_HEADING";
                break;
              case 5023:
                int v4 = @"SWITCH_ON_SPEED_LIMIT";
                break;
              case 5024:
                int v4 = @"SWITCH_OFF_SPEED_LIMIT";
                break;
              case 5025:
                int v4 = @"ELECT_DRIVING_MODE";
                break;
              case 5026:
                int v4 = @"ELECT_WALKING_MODE";
                break;
              case 5027:
                int v4 = @"ELECT_TRANSIT_MODE";
                break;
              case 5028:
                int v4 = @"ELECT_RIDESHARE_MODE";
                break;
              case 5029:
                int v4 = @"SWITCH_ON_FIND_MY_CAR";
                break;
              case 5030:
                int v4 = @"SWITCH_OFF_FIND_MY_CAR";
                break;
              case 5031:
                int v4 = @"MARK_MY_LOCATION";
                break;
              case 5032:
                int v4 = @"TAP_HYBRID_MODE";
                break;
              case 5033:
                int v4 = @"CHECK_AVOID_BUSY_ROADS";
                break;
              case 5034:
                int v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                break;
              case 5035:
                int v4 = @"CHECK_AVOID_HILLS";
                break;
              case 5036:
                int v4 = @"UNCHECK_AVOID_HILLS";
                break;
              case 5037:
                int v4 = @"CHECK_AVOID_STAIRS";
                break;
              case 5038:
                int v4 = @"UNCHECK_AVOID_STAIRS";
                break;
              case 5039:
                int v4 = @"ELECT_CYCLING_MODE";
                break;
              default:
                switch(a3)
                {
                  case 4001:
                    int v4 = @"RECENTER_CURRENT_LOCATION";
                    break;
                  case 4002:
                    int v4 = @"TAP_HEADING_ON";
                    break;
                  case 4003:
                    int v4 = @"TAP_HEADING_OFF";
                    break;
                  case 4004:
                    int v4 = @"PUCK_DRIFT";
                    break;
                  case 4005:
                    int v4 = @"PUCK_SNAP";
                    break;
                  case 4006:
                    int v4 = @"SELECT_FLOOR";
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
              int v4 = @"VIEW_APP";
              break;
            case 14002:
              int v4 = @"ENABLE";
              break;
            case 14003:
              int v4 = @"BOOK_RIDE";
              break;
            case 14004:
              int v4 = @"REQUEST_RIDE";
              break;
            case 14005:
              int v4 = @"CONTACT_DRIVER";
              break;
            case 14006:
              int v4 = @"CHANGE_PAYMENT";
              break;
            case 14007:
              int v4 = @"ENABLE_ALL_RIDESHARE_APPS";
              break;
            case 14008:
              int v4 = @"TAP_FOR_MORE_RIDES";
              break;
            case 14009:
              int v4 = @"SUBMIT_TRIP_FEEDBACK";
              break;
            default:
              switch(a3)
              {
                case 13001:
                  int v4 = @"SELECT_ADDRESS";
                  break;
                case 13002:
                  int v4 = @"ADD_ADDRESS";
                  break;
                case 13003:
                  int v4 = @"SELECT_LABEL";
                  break;
                case 13004:
                  int v4 = @"DELETE_ADDRESS";
                  break;
                case 13005:
                  int v4 = @"EDIT_ITEMS";
                  break;
                case 13006:
                  int v4 = @"RAP_FAVORITES";
                  break;
                case 13007:
                  int v4 = @"SORT_LIST_ITEM";
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
              int v4 = @"ORB_PEEK";
              break;
            case 15002:
              int v4 = @"ORB_POP";
              break;
            case 15003:
              int v4 = @"ORB_DISMISS";
              break;
            default:
LABEL_84:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
              int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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
            int v4 = @"START_DRAG";
            break;
          case 17002:
            int v4 = @"CANCEL_DRAG";
            break;
          case 17003:
            int v4 = @"COMPLETE_DRAG";
            break;
          case 17004:
            int v4 = @"START_DROP";
            break;
          case 17005:
            int v4 = @"CANCEL_DROP";
            break;
          case 17006:
            int v4 = @"COMPLETE_DROP";
            break;
          case 17007:
            int v4 = @"ANNOTATION_SELECT";
            break;
          case 17008:
            int v4 = @"ANNOTATION_SELECT_AUTO";
            break;
          case 17009:
            int v4 = @"ANNOTATION_SELECT_LIST";
            break;
          case 17010:
            int v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
            break;
          case 17011:
            int v4 = @"CALLOUT_FLYOVER_TOUR";
            break;
          case 17012:
            int v4 = @"CALLOUT_INFO";
            break;
          case 17013:
            int v4 = @"CALLOUT_NAV_TRANSIT";
            break;
          case 17014:
            int v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
            break;
          case 17015:
            int v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
            break;
          case 17016:
            int v4 = @"DIRECTIONS_SELECT";
            break;
          case 17017:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
            break;
          case 17018:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
            break;
          case 17019:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
            break;
          case 17020:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
            break;
          case 17021:
            int v4 = @"DIRECTIONS_TRANSIT_LATER";
            break;
          case 17022:
            int v4 = @"DIRECTIONS_TRANSIT_NOW";
            break;
          case 17023:
            int v4 = @"FLYOVER_NOTIFICATION_DISMISS";
            break;
          case 17024:
            int v4 = @"FLYOVER_NOTIFICATION_START";
            break;
          case 17025:
            int v4 = @"FLYOVER_TOUR_COMPLETED";
            break;
          case 17026:
            int v4 = @"FLYOVER_TOUR_END";
            break;
          case 17027:
            int v4 = @"FLYOVER_TOUR_NOTIFICATION";
            break;
          case 17028:
            int v4 = @"FLYOVER_TOUR_START";
            break;
          case 17029:
            int v4 = @"INFO_BOOKMARKS";
            break;
          case 17030:
            int v4 = @"INFO_CARD_DETACHED";
            break;
          case 17031:
            int v4 = @"INFO_CONTACTS";
            break;
          case 17032:
            int v4 = @"INFO_DIRECTIONS";
            break;
          case 17033:
            int v4 = @"INFO_DIRECTIONS_FROM";
            break;
          case 17034:
            int v4 = @"INFO_DIRECTIONS_TO";
            break;
          case 17035:
            int v4 = @"INFO_DISMISS";
            break;
          case 17036:
            int v4 = @"INFO_INFO";
            break;
          case 17037:
            int v4 = @"INFO_PHOTOS";
            break;
          case 17038:
            int v4 = @"INFO_REVIEWS";
            break;
          case 17039:
            int v4 = @"INFO_SHARE";
            break;
          case 17040:
            int v4 = @"INFO_SHARE_AIRDROP";
            break;
          case 17041:
            int v4 = @"INFO_SHARE_FACEBOOK";
            break;
          case 17042:
            int v4 = @"INFO_SHARE_MAIL";
            break;
          case 17043:
            int v4 = @"INFO_SHARE_MESSAGE";
            break;
          case 17044:
            int v4 = @"INFO_SHARE_TENCENTWEIBO";
            break;
          case 17045:
            int v4 = @"INFO_SHARE_WEIBO";
            break;
          case 17046:
            int v4 = @"INFO_YELP";
            break;
          case 17047:
            int v4 = @"MAPS_APP_LAUNCH";
            break;
          case 17048:
            int v4 = @"MAP_3D_OFF";
            break;
          case 17049:
            int v4 = @"MAP_3D_ON";
            break;
          case 17050:
            int v4 = @"MAP_OPTIONS_DROP_PIN";
            break;
          case 17051:
            int v4 = @"MAP_OPTIONS_HYBRID";
            break;
          case 17052:
            int v4 = @"MAP_OPTIONS_PRINT";
            break;
          case 17053:
            int v4 = @"MAP_OPTIONS_REMOVE_PIN";
            break;
          case 17054:
            int v4 = @"MAP_OPTIONS_SATELLITE";
            break;
          case 17055:
            int v4 = @"MAP_OPTIONS_STANDARD";
            break;
          case 17056:
            int v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
            break;
          case 17057:
            int v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
            break;
          case 17058:
            int v4 = @"MAP_OPTIONS_TRANSIT";
            break;
          case 17059:
            int v4 = @"MAP_TAP_FLYOVER_CITY";
            break;
          case 17060:
            int v4 = @"MAP_TAP_LINE";
            break;
          case 17061:
            int v4 = @"MAP_TAP_POI_TRANSIT";
            break;
          case 17062:
            int v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
            break;
          case 17063:
            int v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
            break;
          case 17064:
            int v4 = @"MAP_USER_TRACKING_OFF";
            break;
          case 17065:
            int v4 = @"MAP_USER_TRACKING_ON";
            break;
          case 17066:
            int v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
            break;
          case 17067:
            int v4 = @"NAV_CLEAR";
            break;
          case 17068:
            int v4 = @"NAV_LIST";
            break;
          case 17069:
            int v4 = @"NAV_ROUTE_STEP_NEXT";
            break;
          case 17070:
            int v4 = @"NAV_ROUTE_STEP_PREV";
            break;
          case 17071:
            int v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
            break;
          case 17072:
            int v4 = @"ORB_DISPLAY_MENU";
            break;
          case 17073:
            int v4 = @"ORB_MENU_CALL";
            break;
          case 17074:
            int v4 = @"ORB_MENU_DIRECTIONS";
            break;
          case 17075:
            int v4 = @"ORB_MENU_DISMISS";
            break;
          case 17076:
            int v4 = @"ORB_MENU_SHARE";
            break;
          case 17077:
            int v4 = @"ORB_MENU_SHOW_PLACECARD";
            break;
          case 17078:
            int v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
            break;
          case 17079:
            int v4 = @"ORB_MENU_URL";
            break;
          case 17080:
            int v4 = @"ORB_PRESS";
            break;
          case 17081:
            int v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
            break;
          case 17082:
            int v4 = @"ORB_SPRINGBOARD_SEARCH";
            break;
          case 17083:
            int v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
            break;
          case 17084:
            int v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
            break;
          case 17085:
            int v4 = @"RAP_PERMISSION_CANCEL";
            break;
          case 17086:
            int v4 = @"RAP_PERMISSION_EMAIL_NA";
            break;
          case 17087:
            int v4 = @"RAP_PERMISSION_EMAIL_OK";
            break;
          case 17088:
            int v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
            break;
          case 17089:
            int v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
            break;
          case 17090:
            int v4 = @"RAP_PERMISSION_OK";
            break;
          case 17091:
            int v4 = @"SEARCH_BEGIN";
            break;
          case 17092:
            int v4 = @"SEARCH_CANCEL";
            break;
          case 17093:
            int v4 = @"SEARCH_SELECT";
            break;
          case 17094:
            int v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
            break;
          case 17095:
            int v4 = @"TRANSIT_LINE_SELECTION_VIEW";
            break;
          case 17096:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
            break;
          case 17097:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
            break;
          case 17098:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
            break;
          case 17099:
            int v4 = @"UNKNOWN_ACTION";
            break;
          case 17100:
            int v4 = @"INFO_SHARE_TWITTER";
            break;
          case 17101:
            int v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
            break;
          case 17102:
            int v4 = @"INFO_DIRECTIONS_WALK";
            break;
          case 17103:
            int v4 = @"INFO_DIRECTIONS_TRANSIT";
            break;
          case 17104:
            int v4 = @"INFO_DIRECTIONS_DRIVE";
            break;
          case 17105:
            int v4 = @"INFO_REPORT_A_PROBLEM";
            break;
          case 17106:
            int v4 = @"CALLOUT_NAV";
            break;
          case 17107:
            int v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
            break;
          case 17108:
            int v4 = @"MAP_TAP_POI";
            break;
          default:
            if (a3 == 16001)
            {
              int v4 = @"SEARCH_IN_MAPS";
            }
            else
            {
              if (a3 != 90010) {
                goto LABEL_84;
              }
              int v4 = @"PAN_RIGHT";
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
          int v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
          break;
        case 10102:
          int v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
          break;
        case 10103:
          int v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
          break;
        case 10104:
          int v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
          break;
        case 10105:
          int v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
          break;
        case 10106:
          int v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
          break;
        case 10107:
          int v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
          break;
        case 10108:
          int v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
          break;
        case 10109:
          int v4 = @"RAP_CANCEL";
          break;
        case 10110:
          int v4 = @"RAP_NEXT";
          break;
        case 10111:
          int v4 = @"RAP_BACK";
          break;
        case 10112:
          int v4 = @"RAP_SEND";
          break;
        case 10113:
          int v4 = @"RAP_SKIP";
          break;
        case 10114:
          int v4 = @"RAP_SHOW_MORE";
          break;
        case 10115:
          int v4 = @"RAP_ADD_PHOTO";
          break;
        case 10116:
          int v4 = @"RAP_MAP_INCORRECT";
          break;
        case 10117:
          int v4 = @"RAP_BAD_DIRECTIONS";
          break;
        case 10118:
          int v4 = @"RAP_TRANSIT_INFO_INCORRECT";
          break;
        case 10119:
          int v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
          break;
        case 10120:
          int v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
          break;
        case 10121:
          int v4 = @"RAP_ADD_A_PLACE";
          break;
        case 10122:
          int v4 = @"RAP_HOME";
          break;
        case 10123:
          int v4 = @"RAP_WORK";
          break;
        case 10124:
          int v4 = @"RAP_OTHER";
          break;
        case 10125:
          int v4 = @"RAP_LOCATION";
          break;
        case 10126:
          int v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
          break;
        case 10127:
          int v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
          break;
        case 10128:
          int v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
          break;
        case 10129:
          int v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
          break;
        case 10130:
          int v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
          break;
        case 10131:
          int v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
          break;
        case 10132:
          int v4 = @"RAP_TRANSIT_DELAY";
          break;
        case 10133:
          int v4 = @"RAP_LOCATION_CLOSED";
          break;
        case 10134:
          int v4 = @"RAP_CLOSED_PERMANENTLY";
          break;
        case 10135:
          int v4 = @"RAP_CLOSED_TEMPORARILY";
          break;
        case 10136:
          int v4 = @"RAP_HOURS_HAVE_CHANGED";
          break;
        case 10137:
          int v4 = @"RAP_SELECT_STATION";
          break;
        case 10138:
          int v4 = @"RAP_SELECT_LINE";
          break;
        case 10139:
          int v4 = @"RAP_SELECT_ACCESS_POINT";
          break;
        case 10140:
          int v4 = @"RAP_SELECT_SEARCH";
          break;
        case 10141:
          int v4 = @"RAP_PAN_MAP";
          break;
        case 10142:
          int v4 = @"RAP_CENTER_MAP_ON_USER";
          break;
        case 10143:
          int v4 = @"RAP_SEARCH_UNEXPECTED";
          break;
        case 10144:
          int v4 = @"RAP_ADD_POI";
          break;
        case 10145:
          int v4 = @"RAP_ADD_STREET_ADDRESS";
          break;
        case 10146:
          int v4 = @"RAP_ADD_OTHER";
          break;
        case 10147:
          int v4 = @"RAP_SELECT_CATEGORY";
          break;
        case 10148:
          int v4 = @"RAP_TAKE_PHOTO";
          break;
        case 10149:
          int v4 = @"RAP_RETAKE_PHOTO";
          break;
        case 10150:
          int v4 = @"RAP_PLACE_DETAILS";
          break;
        case 10151:
          int v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
          break;
        case 10152:
          int v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
          break;
        case 10153:
          int v4 = @"RAP_SELECT_LABEL";
          break;
        case 10154:
          int v4 = @"RAP_SELECT_ROUTE";
          break;
        case 10155:
          int v4 = @"RAP_CLAIM_BUSINESS";
          break;
        case 10156:
          int v4 = @"RAP_BRAND_DETAILS";
          break;
        case 10157:
          int v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
          break;
        case 10158:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
          break;
        case 10159:
          int v4 = @"RAP_LOOK_AROUND_BLURRING";
          break;
        case 10160:
          int v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
          break;
        case 10161:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
          break;
        case 10162:
          int v4 = @"RAP_LOOK_AROUND_PRIVACY";
          break;
        case 10163:
          int v4 = @"RAP_INCORRECT_HOURS";
          break;
        case 10164:
          int v4 = @"RAP_INCORRECT_ADDRESS";
          break;
        case 10165:
          int v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 10166:
          int v4 = @"RAP_EDIT_PLACE_NAME";
          break;
        case 10167:
          int v4 = @"RAP_EDIT_ADDRESS";
          break;
        case 10168:
          int v4 = @"RAP_ADD_CATEGORY";
          break;
        case 10169:
          int v4 = @"RAP_REMOVE_CATEGORY";
          break;
        case 10170:
          int v4 = @"RAP_DESELECT_CATEGORY";
          break;
        case 10171:
          int v4 = @"RAP_ADD_HOURS";
          break;
        case 10172:
          int v4 = @"RAP_REMOVE_HOURS";
          break;
        case 10173:
          int v4 = @"RAP_TAP_DAY_OF_WEEK";
          break;
        case 10174:
          int v4 = @"RAP_TAP_24_HOURS_BUTTON";
          break;
        case 10175:
          int v4 = @"RAP_TAP_OPEN_TIME";
          break;
        case 10176:
          int v4 = @"RAP_TAP_CLOSED_TIME";
          break;
        case 10177:
          int v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
          break;
        case 10178:
          int v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
          break;
        case 10179:
          int v4 = @"RAP_EDIT_WEBSITE";
          break;
        case 10180:
          int v4 = @"RAP_EDIT_PHONE_NUMBER";
          break;
        case 10181:
          int v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
          break;
        case 10182:
          int v4 = @"RAP_ADD_COMMENTS";
          break;
        case 10183:
          int v4 = @"RAP_EDIT_LOCATION";
          break;
        case 10184:
          int v4 = @"RAP_VIEW_LOCATION";
          break;
        case 10185:
          int v4 = @"RAP_ZOOM_IN";
          break;
        case 10186:
          int v4 = @"RAP_ZOOM_OUT";
          break;
        case 10187:
          int v4 = @"RAP_VIEW_ENTRY_POINTS";
          break;
        case 10188:
          int v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
          break;
        case 10189:
          int v4 = @"RAP_ADD_NEW_ENTRY_POINT";
          break;
        case 10190:
          int v4 = @"RAP_REMOVE_ENTRY_POINT";
          break;
        case 10191:
          int v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
          break;
        default:
          switch(a3)
          {
            case 11001:
              int v4 = @"EXIT_MAPS_LOWER_WRIST";
              break;
            case 11002:
              int v4 = @"TASK_READY";
              break;
            case 11003:
              int v4 = @"TAP_SEARCH";
              break;
            case 11004:
              int v4 = @"TAP_MY_LOCATION";
              break;
            case 11005:
              int v4 = @"SHOW_NEARBY";
              break;
            case 11006:
              int v4 = @"TAP_NEARBY";
              break;
            case 11007:
              int v4 = @"TAP_PROACTIVE";
              break;
            case 11008:
              int v4 = @"FORCE_PRESS";
              break;
            case 11009:
              int v4 = @"TAP_CONTACTS";
              break;
            case 11010:
              int v4 = @"TAP_TRANSIT";
              break;
            case 11011:
              int v4 = @"TAP_DICTATION";
              break;
            case 11012:
              int v4 = @"GET_DIRECTIONS_DRIVING";
              break;
            case 11013:
              int v4 = @"GET_DIRECTIONS_WALKING";
              break;
            case 11014:
              int v4 = @"GET_DIRECTIONS_TRANSIT";
              break;
            case 11015:
              int v4 = @"OPEN_STANDARD_MAP";
              break;
            case 11016:
              int v4 = @"OPEN_TRANSIT_MAP";
              break;
            case 11017:
              int v4 = @"START_NAV_AUTO";
              break;
            case 11018:
              int v4 = @"TAP_RECENT";
              break;
            case 11019:
              int v4 = @"TAP_FAVORITE";
              break;
            case 11020:
              int v4 = @"TAP_SCRIBBLE";
              break;
            case 11021:
              int v4 = @"TAP_VIEW_MAP";
              break;
            case 11022:
              int v4 = @"TAP_VIEW_TBT";
              break;
            case 11023:
              int v4 = @"VIEW_ROUTE_INFO";
              break;
            case 11024:
              int v4 = @"NAV_UNMUTE";
              break;
            case 11025:
              int v4 = @"NAV_MUTE";
              break;
            case 11026:
              int v4 = @"GET_DIRECTIONS_CYCLING";
              break;
            case 11027:
              int v4 = @"TAP_SEARCH_HOME";
              break;
            case 11028:
              int v4 = @"ROUTE_PAUSED_ON_WATCH";
              break;
            case 11029:
              int v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
              break;
            default:
              switch(a3)
              {
                case 12001:
                  int v4 = @"VIEW_MORE_OPTIONS";
                  break;
                case 12002:
                  int v4 = @"SELECT_TIME";
                  break;
                case 12003:
                  int v4 = @"SHOW_NEXT_AVAILABLE";
                  break;
                case 12004:
                  int v4 = @"DECREASE_TABLE_SIZE";
                  break;
                case 12005:
                  int v4 = @"INCREASE_TABLE_SIZE";
                  break;
                case 12006:
                  int v4 = @"EDIT_BOOKING";
                  break;
                case 12007:
                  int v4 = @"EDIT_PHONE";
                  break;
                case 12008:
                  int v4 = @"ADD_SPECIAL_REQUEST";
                  break;
                case 12009:
                  int v4 = @"CHANGE_RESERVATION";
                  break;
                case 12010:
                  int v4 = @"LEARN_MORE";
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
    int v4 = @"UI_ACTION_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_85;
      case 1:
        int v4 = @"PULL_UP";
        break;
      case 2:
        int v4 = @"PULL_DOWN";
        break;
      case 3:
        int v4 = @"TAP";
        break;
      case 4:
        int v4 = @"CLOSE";
        break;
      case 5:
        int v4 = @"SWIPE_PREV";
        break;
      case 6:
        int v4 = @"SWIPE_NEXT";
        break;
      case 7:
        int v4 = @"SCROLL_UP";
        break;
      case 8:
        int v4 = @"SCROLL_DOWN";
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
        int v4 = @"SHOW_MORE";
        break;
      case 11:
        int v4 = @"SHOW_LESS";
        break;
      case 12:
        int v4 = @"SWIPE_LEFT";
        break;
      case 13:
        int v4 = @"SWIPE_RIGHT";
        break;
      case 14:
        int v4 = @"MINIMIZE";
        break;
      case 15:
        int v4 = @"TAP_PREV";
        break;
      case 16:
        int v4 = @"TAP_NEXT";
        break;
      case 17:
        int v4 = @"SUBMIT";
        break;
      case 18:
        int v4 = @"CANCEL";
        break;
      case 19:
        int v4 = @"ENTER_MAPS";
        break;
      case 20:
        int v4 = @"EXIT_MAPS";
        break;
      case 21:
        int v4 = @"REVEAL";
        break;
      case 22:
        int v4 = @"OPEN_NEW_TAB";
        break;
      case 25:
        int v4 = @"BACK";
        break;
      case 26:
        int v4 = @"ACTIVATE";
        break;
      case 27:
        int v4 = @"DEACTIVATE";
        break;
      case 28:
        int v4 = @"AGREE";
        break;
      case 29:
        int v4 = @"DISAGREE";
        break;
      case 30:
        int v4 = @"SKIP_ANSWER";
        break;
      case 31:
        int v4 = @"EXPAND";
        break;
      case 32:
        int v4 = @"COLLAPSE";
        break;
      case 33:
        int v4 = @"ENTER";
        break;
      case 34:
        int v4 = @"EXIT";
        break;
      case 35:
        int v4 = @"SCROLL_UP_INDEX_BAR";
        break;
      case 36:
        int v4 = @"SCROLL_DOWN_INDEX_BAR";
        break;
      case 37:
        int v4 = @"TOGGLE_ON";
        break;
      case 38:
        int v4 = @"TOGGLE_OFF";
        break;
      case 39:
        int v4 = @"LONG_PRESS";
        break;
      case 40:
        int v4 = @"CLICK";
        break;
      case 41:
        int v4 = @"TAP_DONE";
        break;
      case 42:
        int v4 = @"TAP_CLOSE";
        break;
      case 43:
        int v4 = @"SCROLL_LEFT";
        break;
      case 44:
        int v4 = @"SCROLL_RIGHT";
        break;
      case 45:
        int v4 = @"DISPLAY";
        break;
      case 46:
        int v4 = @"OPEN_IN_APP";
        break;
      case 47:
        int v4 = @"CONCEAL";
        break;
      case 48:
        int v4 = @"TAP_DELETE";
        break;
      case 49:
        int v4 = @"TAP_FILTER";
        break;
      case 50:
        int v4 = @"TAP_SECONDARY_BUTTON";
        break;
      case 51:
        int v4 = @"TAP_WIDGET_FOOD";
        break;
      case 52:
        int v4 = @"TAP_WIDGET_GAS";
        break;
      case 53:
        int v4 = @"TAP_WIDGET_LOADING";
        break;
      case 54:
        int v4 = @"TAP_WIDGET_SEARCH";
        break;
      case 55:
        int v4 = @"TAP_WIDGET_STORES";
        break;
      case 56:
        int v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
        break;
      case 57:
        int v4 = @"SHARE_CURRENT_LOCATION";
        break;
      case 58:
        int v4 = @"SHARE_PHOTO";
        break;
      case 59:
        int v4 = @"TAP_KEEP_OFF";
        break;
      case 60:
        int v4 = @"TAP_PHOTO_CATEGORY";
        break;
      case 61:
        int v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
        break;
      case 62:
        int v4 = @"TAP_TURN_ON";
        break;
      case 63:
        int v4 = @"DISPLAY_CYCLING_ANNOTATION";
        break;
      case 64:
        int v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
        break;
      case 65:
        int v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
        break;
      case 66:
        int v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
        break;
      case 67:
        int v4 = @"TAP_CYCLING_ANNOTATION";
        break;
      case 68:
        int v4 = @"TAP_DRIVING_DEFAULT_OPTION";
        break;
      case 69:
        int v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
        break;
      case 70:
        int v4 = @"TAP_WALKING_DEFAULT_OPTION";
        break;
      case 71:
        int v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
        break;
      case 72:
        int v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
        break;
      case 73:
        int v4 = @"TAP_PERSONAL_COLLECTION";
        break;
      case 74:
        int v4 = @"RESUME_ROUTE";
        break;
      case 75:
        int v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
        break;
      case 76:
        int v4 = @"TAP_ALLOW_ONCE";
        break;
      case 77:
        int v4 = @"TAP_DO_NOT_ALLOW";
        break;
      case 78:
        int v4 = @"ADD_RECCOMENDED_FAVORITE";
        break;
      case 79:
        int v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
        break;
      case 80:
        int v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 81:
        int v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
        break;
      case 82:
        int v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
        break;
      case 83:
        int v4 = @"CREATE_SCHOOL_FAVORITE";
        break;
      case 84:
        int v4 = @"TAP_SCHOOL_FAVORITE";
        break;
      case 85:
        int v4 = @"SELECT_ROUTING_TYPE_CYCLING";
        break;
      case 86:
        int v4 = @"REPORT_PHOTO";
        break;
      case 87:
        int v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
        break;
      case 88:
        int v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
        break;
      case 89:
        int v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
        break;
      case 90:
        int v4 = @"CREATE_RECOMMENDED_FAVORITE";
        break;
      case 91:
        int v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
        break;
      case 92:
        int v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 93:
        int v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
        break;
      case 94:
        int v4 = @"TAP_SMALL_WIDGET_ITEM";
        break;
      case 95:
        int v4 = @"TAP_MEDIUM_WIDGET_ITEM";
        break;
      case 96:
        int v4 = @"TAP_LARGE_WIDGET_ITEM";
        break;
      case 97:
        int v4 = @"DISPLAY_ARP_TIPKIT";
        break;
      case 98:
        int v4 = @"NEXT";
        break;
      case 99:
        int v4 = @"TAP_RATE_AND_ADD_PHOTOS";
        break;
      case 100:
        int v4 = @"TAP_TO_ADD_POSITIVE_RATING";
        break;
      case 101:
        int v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
        break;
      case 102:
        int v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
        break;
      case 103:
        int v4 = @"INVOKE_SIRI_PROMPT";
        break;
      case 104:
        int v4 = @"ETA_SHARED_SUCCESSFULLY";
        break;
      case 105:
        int v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
        break;
      case 106:
        int v4 = @"CLEAR_INCIDENT";
        break;
      case 107:
        int v4 = @"CONFIRM_INCIDENT";
        break;
      case 108:
        int v4 = @"DISMISS_INCIDENT";
        break;
      case 109:
        int v4 = @"INCIDENT_ALERT_TIMEOUT";
        break;
      case 110:
        int v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
        break;
      case 111:
        int v4 = @"INCIDENT_CARD_SHOWN";
        break;
      case 112:
        int v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
        break;
      case 113:
        int v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
        break;
      case 114:
        int v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
        break;
      case 115:
        int v4 = @"TAP_TO_REPORT_INCIDENT";
        break;
      case 116:
        int v4 = @"TAP_SHORTCUT";
        break;
      case 117:
        int v4 = @"BLOCK_CONTACT";
        break;
      case 118:
        int v4 = @"TAP_TO_ADD_RATING";
        break;
      case 119:
        int v4 = @"AR_WALKING_LOCALIZATION_FAILED";
        break;
      case 120:
        int v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
        break;
      case 121:
        int v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
        break;
      case 122:
        int v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
        break;
      case 123:
        int v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
        break;
      case 124:
        int v4 = @"RAISE_TO_ENTER_AR_WALKING";
        break;
      case 125:
        int v4 = @"TAP_DISMISS";
        break;
      case 126:
        int v4 = @"TAP_ENTER_AR_WALKING";
        break;
      case 127:
        int v4 = @"TAP_OK";
        break;
      case 128:
        int v4 = @"TAP_TRY_AGAIN";
        break;
      case 129:
        int v4 = @"TAP_TURN_ON_IN_SETTINGS";
        break;
      case 130:
        int v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
        break;
      case 131:
        int v4 = @"VLF_CORRECTION_USER_ABANDON";
        break;
      case 132:
        int v4 = @"AREA_EVENTS_ALERT";
        break;
      case 133:
        int v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
        break;
      case 134:
        int v4 = @"ACCEPT_EVENT_REROUTE";
        break;
      case 135:
        int v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
        break;
      case 136:
        int v4 = @"DISMISS_EVENT_REROUTE";
        break;
      case 137:
        int v4 = @"PUNCH_OUT_EVENTS_LINK";
        break;
      case 138:
        int v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
        break;
      case 139:
        int v4 = @"ADJUST_GUIDANCE_SETTINGS";
        break;
      case 140:
        int v4 = @"HIDE_DETAILS";
        break;
      case 141:
        int v4 = @"SELECT_VOICE_GUIDANCE_ON";
        break;
      case 142:
        int v4 = @"SELECT_VOICE_GUIDANCE_OFF";
        break;
      case 143:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
        break;
      case 144:
        int v4 = @"TAP_TEXT_LABEL";
        break;
      case 145:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
        break;
      case 146:
        int v4 = @"TAP_EXIT";
        break;
      case 147:
        int v4 = @"TAP_CITY_MENU";
        break;
      case 148:
        int v4 = @"CHECK_AVOID_TOLLS";
        break;
      case 149:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
        break;
      case 150:
        int v4 = @"TAP_ICLOUD";
        break;
      case 151:
        int v4 = @"CHECK_AVOID_HIGHWAYS";
        break;
      case 152:
        int v4 = @"TAP_FAVORITES";
        break;
      case 153:
        int v4 = @"SELECT_DISTANCE_IN_KM";
        break;
      case 154:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
        break;
      case 155:
        int v4 = @"OPEN_FULL_CARD_FILTER";
        break;
      case 156:
        int v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
        break;
      case 157:
        int v4 = @"OPEN_SINGLE_CARD_FILTER";
        break;
      case 158:
        int v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 159:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
        break;
      case 160:
        int v4 = @"SESSIONLESS_REVEAL";
        break;
      case 161:
        int v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
        break;
      case 162:
        int v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
        break;
      case 163:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
        break;
      case 164:
        int v4 = @"ENTER_RAP_REPORT_MENU";
        break;
      case 165:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
        break;
      case 166:
        int v4 = @"TAP_MY_VEHICLES";
        break;
      case 167:
        int v4 = @"SUBMIT_SINGLE_CARD_FILTER";
        break;
      case 168:
        int v4 = @"SUBMIT_FULL_CARD_FILTER";
        break;
      case 169:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
        break;
      case 170:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
        break;
      case 171:
        int v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
        break;
      case 172:
        int v4 = @"TAP_ACCOUNT";
        break;
      case 173:
        int v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
        break;
      case 174:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
        break;
      case 175:
        int v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
        break;
      case 176:
        int v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
        break;
      case 177:
        int v4 = @"TAP_CITY_CURATED_COLLECTIONS";
        break;
      case 178:
        int v4 = @"TAP_REPORTS";
        break;
      case 179:
        int v4 = @"TAP_RATINGS";
        break;
      case 180:
        int v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
        break;
      case 181:
        int v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
        break;
      case 182:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
        break;
      case 183:
        int v4 = @"SELECT_DISTANCE_IN_MILES";
        break;
      case 184:
        int v4 = @"TAP_PRIVACY_STATEMENT";
        break;
      case 185:
        int v4 = @"TAP_MAPS_SETTINGS";
        break;
      case 186:
        int v4 = @"CANCEL_FULL_CARD_FILTER";
        break;
      case 187:
        int v4 = @"TAP_LATEST_CURATED_COLLECTION";
        break;
      case 188:
        int v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
        break;
      case 189:
        int v4 = @"UNCHECK_AVOID_TOLLS";
        break;
      case 190:
        int v4 = @"UNSELECT_SEARCH_REFINEMENT";
        break;
      case 191:
        int v4 = @"TAP_RATING";
        break;
      case 192:
        int v4 = @"TAP_ICLOUD_SIGN_IN";
        break;
      case 193:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
        break;
      case 194:
        int v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
        break;
      case 195:
        int v4 = @"UNCHECK_AVOID_HIGHWAYS";
        break;
      case 196:
        int v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
        break;
      case 197:
        int v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
        break;
      case 198:
        int v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
        break;
      case 199:
        int v4 = @"TAP_MY_GUIDES";
        break;
      case 200:
        int v4 = @"SELECT_SEARCH_REFINEMENT";
        break;
      case 201:
        int v4 = @"SESSIONLESS_TAP_ACCOUNT";
        break;
      case 202:
        int v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 203:
        int v4 = @"TAP_TRAVEL_PREFERENCES";
        break;
      case 204:
        int v4 = @"SHOW_CURATED_COLLECTION_LIST";
        break;
      case 205:
        int v4 = @"CANCEL_SINGLE_CARD_FILTER";
        break;
      case 206:
        int v4 = @"DISPLAY_HFP_OPTION";
        break;
      case 207:
        int v4 = @"SWITCH_OFF_HFP";
        break;
      case 208:
        int v4 = @"SWITCH_ON_HFP";
        break;
      case 209:
        int v4 = @"TAP_QUICK_ACTION_TRAY";
        break;
      case 210:
        int v4 = @"SHOW_ALL_CITIES";
        break;
      case 211:
        int v4 = @"TAP_ADD_NEARBY_TRANSIT";
        break;
      case 212:
        int v4 = @"RESUME";
        break;
      case 213:
        int v4 = @"DISPLAY_TIPKIT_PROMPT";
        break;
      case 214:
        int v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
        break;
      case 215:
        int v4 = @"TAP_DRIVING_MODE";
        break;
      case 216:
        int v4 = @"SWITCH_ON_VOICE_GUIDANCE";
        break;
      case 217:
        int v4 = @"DISMISS_TIPKIT_PROMPT";
        break;
      case 218:
        int v4 = @"TAP_EXPAND_EXIT_DETAILS";
        break;
      case 219:
        int v4 = @"TAP_NEARBY_TRANSIT_FILTER";
        break;
      case 220:
        int v4 = @"TAP_MORE_DEPARTURES";
        break;
      case 221:
        int v4 = @"RAP_INDIVIDUAL_PLACE";
        break;
      case 222:
        int v4 = @"RAP_ADD_MAP";
        break;
      case 223:
        int v4 = @"TAP_SUGGESTED_RAP";
        break;
      case 224:
        int v4 = @"RAP_STREET_ISSUE";
        break;
      case 225:
        int v4 = @"SWIPE_PIN_REVEAL";
        break;
      case 226:
        int v4 = @"TAP_ADD_TIPKIT_FAVORITE";
        break;
      case 227:
        int v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
        break;
      case 228:
        int v4 = @"RAP_BAD_TRIP";
        break;
      case 229:
        int v4 = @"RAP_PLACE_ISSUE";
        break;
      case 230:
        int v4 = @"TAP_OPEN_MAPS";
        break;
      case 231:
        int v4 = @"TAP_NEARBY_TRANSIT_RESULT";
        break;
      case 232:
        int v4 = @"RAP_GUIDE";
        break;
      case 233:
        int v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
        break;
      case 234:
        int v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
        break;
      case 235:
        int v4 = @"SELECT_TRANSIT_STEP";
        break;
      case 236:
        int v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
        break;
      case 237:
        int v4 = @"TAP_SEE_MORE";
        break;
      case 238:
        int v4 = @"RAP_IN_REVIEW";
        break;
      case 239:
        int v4 = @"TAP_OPEN_MENU";
        break;
      case 240:
        int v4 = @"TAP_NEARBY_TRANSIT";
        break;
      case 241:
        int v4 = @"TAP_PIN_LINE";
        break;
      case 242:
        int v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
        break;
      case 243:
        int v4 = @"RAP_GOOD_TRIP";
        break;
      case 244:
        int v4 = @"TAP_FILTERED_CURATED_COLLECTION";
        break;
      case 245:
        int v4 = @"SHARE_MY_LOCATION";
        break;
      case 246:
        int v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
        break;
      case 247:
        int v4 = @"DISPLAY_GENERIC_ADVISORY";
        break;
      case 248:
        int v4 = @"ADVISORY_ALERT";
        break;
      case 249:
        int v4 = @"PUNCH_OUT_LINK";
        break;
      case 250:
        int v4 = @"TAP_GENERIC_ADVISORY";
        break;
      case 251:
        int v4 = @"TAP_EXPLORE_MODE";
        break;
      case 252:
        int v4 = @"TAP_UNPIN_LINE";
        break;
      case 253:
        int v4 = @"MENU_UNPIN";
        break;
      case 254:
        int v4 = @"MENU_PIN";
        break;
      case 255:
        int v4 = @"SWIPE_PIN";
        break;
      case 256:
        int v4 = @"SWIPE_UNPIN";
        break;
      case 257:
        int v4 = @"TAP_MEDIA_APP";
        break;
      case 258:
        int v4 = @"TAP_GUIDES_SUBACTION";
        break;
      case 259:
        int v4 = @"TAP_MEDIA";
        break;
      case 260:
        int v4 = @"PUNCH_OUT_MEDIA";
        break;
      case 261:
        int v4 = @"SHOW_MEDIA_APP_MENU";
        break;
      case 262:
        int v4 = @"SCROLL_RIGHT_RIBBON";
        break;
      case 263:
        int v4 = @"SCROLL_LEFT_RIBBON";
        break;
      case 264:
        int v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
        break;
      case 265:
        int v4 = @"TAP_SHOW_MORE_TEXT";
        break;
      case 266:
        int v4 = @"SCROLL_LEFT_RATINGS";
        break;
      case 267:
        int v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
        break;
      case 268:
        int v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
        break;
      case 269:
        int v4 = @"SCROLL_RIGHT_RATINGS";
        break;
      case 270:
        int v4 = @"TAP_ALLOW";
        break;
      case 271:
        int v4 = @"TAP_GO_TO_SETTING";
        break;
      case 272:
        int v4 = @"START_SUBMIT_REPORT";
        break;
      case 273:
        int v4 = @"AUTHENTICATION_INFO_FAILURE";
        break;
      case 274:
        int v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
        break;
      case 275:
        int v4 = @"FAILED_SUBMIT_REPORT";
        break;
      case 276:
        int v4 = @"AUTHENTICATION_INFO_SUCCESS";
        break;
      case 277:
        int v4 = @"EDIT_WAYPOINT";
        break;
      case 278:
        int v4 = @"CLEAR_TEXT";
        break;
      case 279:
        int v4 = @"REORDER_WAYPOINT";
        break;
      case 280:
        int v4 = @"REMOVE_WAYPOINT";
        break;
      case 281:
        int v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
        break;
      case 282:
        int v4 = @"TAP_SHOWCASE_MENU";
        break;
      case 283:
        int v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
        break;
      case 284:
        int v4 = @"TAP_PHOTO_ALBUM";
        break;
      case 285:
        int v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 286:
        int v4 = @"RAP_INLINE_ADD";
        break;
      case 287:
        int v4 = @"RAP_TAP_EDIT";
        break;
      case 288:
        int v4 = @"CLAIM_BUSINESS";
        break;
      case 289:
        int v4 = @"RAP_EDIT_OPTIONS";
        break;
      case 290:
        int v4 = @"TAP_IN_REVIEW_RAP";
        break;
      case 291:
        int v4 = @"ORB_MENU_ADD_STOP";
        break;
      case 292:
        int v4 = @"NEXT_STOP";
        break;
      case 293:
        int v4 = @"ARRIVE_AT_WAYPOINT";
        break;
      case 294:
        int v4 = @"REMOVE_STOP";
        break;
      case 295:
        int v4 = @"DISPLAY_PAUSE_BUTTON";
        break;
      case 296:
        int v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
        break;
      case 297:
        int v4 = @"AUTO_ADVANCE_NEXT_STOP";
        break;
      case 298:
        int v4 = @"ADD_INLINE_NEGATIVE_RATING";
        break;
      case 299:
        int v4 = @"ADD_INLINE_POSITIVE_RATING";
        break;
      case 300:
        int v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
        break;
      case 301:
        int v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
        break;
      case 302:
        int v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
        break;
      case 303:
        int v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
        break;
      case 304:
        int v4 = @"SHOW_ALL_RECENTS";
        break;
      case 305:
        int v4 = @"RESUME_MULTIPOINT_ROUTE";
        break;
      case 306:
        int v4 = @"DISMISS_TRANSIT_TIPKIT";
        break;
      case 307:
        int v4 = @"DISPLAY_TRANSIT_TIPKIT";
        break;
      case 308:
        int v4 = @"TAP_TRANSIT_TIPKIT";
        break;
      case 309:
        int v4 = @"FILTER_EV";
        break;
      case 310:
        int v4 = @"FILTER_SURCHARGE";
        break;
      case 311:
        int v4 = @"FILTER_PREFER";
        break;
      case 312:
        int v4 = @"TAP_WALKING_ANNOTATION";
        break;
      case 313:
        int v4 = @"FILTER_AVOID";
        break;
      case 314:
        int v4 = @"FILTER_TRANSPORTATION_MODE";
        break;
      case 315:
        int v4 = @"FILTER_RECOMMENDED_ROUTES";
        break;
      case 316:
        int v4 = @"FILTER_IC_FARES";
        break;
      case 317:
        int v4 = @"FILTER_TRANSIT_CARD_FARES";
        break;
      case 318:
        int v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 319:
        int v4 = @"TAP_NOTIFICATION_SETTINGS";
        break;
      case 320:
        int v4 = @"TAP_ENABLE_NOTIFICATION";
        break;
      case 321:
        int v4 = @"ARP_SUGGESTIONS_TURN_OFF";
        break;
      case 322:
        int v4 = @"ARP_SUGGESTIONS_TURN_ON";
        break;
      case 323:
        int v4 = @"DISMISS_ARP_SUGGESTION";
        break;
      case 324:
        int v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
        break;
      case 325:
        int v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
        break;
      case 326:
        int v4 = @"UNSELECT_SUGGESTED_PHOTOS";
        break;
      case 327:
        int v4 = @"SUGGESTED_PHOTOS_SHOWN";
        break;
      case 328:
        int v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 329:
        int v4 = @"TAP_YOUR_PHOTOS_ALBUM";
        break;
      case 330:
        int v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
        break;
      case 331:
        int v4 = @"DELETE_PHOTO";
        break;
      case 332:
        int v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 333:
        int v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
        break;
      case 334:
        int v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 335:
        int v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
        break;
      case 336:
        int v4 = @"SELECT_SUGGESTED_PHOTOS";
        break;
      case 337:
        int v4 = @"ADD_STOP";
        break;
      case 338:
        int v4 = @"SHOW_CREDIT_TURN_ON";
        break;
      case 339:
        int v4 = @"DISPLAY_ARP_SUGGESTION";
        break;
      case 340:
        int v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
        break;
      case 341:
        int v4 = @"SHOW_CREDIT_TURN_OFF";
        break;
      case 342:
        int v4 = @"TAP_TO_EDIT_NICKNAME";
        break;
      case 343:
        int v4 = @"SUBMIT_RATINGS";
        break;
      case 344:
        int v4 = @"END_NAV_ON_WATCH";
        break;
      case 345:
        int v4 = @"FILTER_EBIKE";
        break;
      case 356:
        int v4 = @"ADD_STOP_SIRI";
        break;
      case 357:
        int v4 = @"TAP_REVIEWED_RAP";
        break;
      case 358:
        int v4 = @"TAP_OUTREACH_RAP";
        break;
      case 359:
        int v4 = @"DISPLAY_SUGGESTED_ITEM";
        break;
      case 360:
        int v4 = @"DISPLAY_HIKING_TIPKIT";
        break;
      case 361:
        int v4 = @"DISMISS_HIKING_TIPKIT";
        break;
      case 362:
        int v4 = @"TAP_HIKING_TIPKIT";
        break;
      case 363:
        int v4 = @"SCROLL_LEFT_TRAILS";
        break;
      case 364:
        int v4 = @"TAP_MORE_TRAILS";
        break;
      case 365:
        int v4 = @"TAP_RELATED_TRAIL";
        break;
      case 366:
        int v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
        break;
      case 367:
        int v4 = @"SCROLL_RIGHT_TRAILS";
        break;
      case 368:
        int v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 369:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
        break;
      case 370:
        int v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 371:
        int v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 372:
        int v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 373:
        int v4 = @"EXPIRED_MAPS_REMOVED";
        break;
      case 374:
        int v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
        break;
      case 375:
        int v4 = @"TAP_EXPIRED_MAPS";
        break;
      case 376:
        int v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 377:
        int v4 = @"MOVE_DOWNLOAD_MAPS";
        break;
      case 378:
        int v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
        break;
      case 379:
        int v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 380:
        int v4 = @"TAP_ENTER_OFFLINE_MAPS";
        break;
      case 381:
        int v4 = @"TAP_DOWNLOAD_MAPS";
        break;
      case 382:
        int v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
        break;
      case 383:
        int v4 = @"DELETE_DOWNLOAD_MAPS";
        break;
      case 384:
        int v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
        break;
      case 385:
        int v4 = @"RENAME_DOWNLOAD_MAPS";
        break;
      case 386:
        int v4 = @"RESIZE_DOWNLOAD_MAPS";
        break;
      case 387:
        int v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
        break;
      case 388:
        int v4 = @"RESTORE_EXPIRED_MAPS";
        break;
      case 389:
        int v4 = @"CLEAR_EXPIRED_MAPS";
        break;
      case 390:
        int v4 = @"TAP_USING_OFFLINE_BAR";
        break;
      case 391:
        int v4 = @"UPDATE_DOWNLOAD_MAPS";
        break;
      case 392:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 393:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS";
        break;
      case 394:
        int v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
        break;
      case 395:
        int v4 = @"DISPLAY_EXPIRED_MAPS";
        break;
      case 396:
        int v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 397:
        int v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
        break;
      case 398:
        int v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
        break;
      case 399:
        int v4 = @"ETA_SHARE_TRAY_TIMEOUT";
        break;
      case 400:
        int v4 = @"START_ETA_SHARING";
        break;
      case 401:
        int v4 = @"PERSON_LOCATION_UPDATE";
        break;
      case 402:
        int v4 = @"STOP_ETA_SHARING";
        break;
      case 403:
        int v4 = @"PUNCH_OUT_TO_FINDMY";
        break;
      case 404:
        int v4 = @"TAP_PEOPLE_LOCATION";
        break;
      case 405:
        int v4 = @"TAP_TO_REQUEST_LOCATION";
        break;
      case 406:
        int v4 = @"ZOOM_OUT_CROWN";
        break;
      case 407:
        int v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
        break;
      case 408:
        int v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
        break;
      case 409:
        int v4 = @"SELECT_LIST_VIEW";
        break;
      case 410:
        int v4 = @"SCROLL_RIGHT_TRAILHEADS";
        break;
      case 411:
        int v4 = @"SWITCH_TO_ONLINE_MODE";
        break;
      case 412:
        int v4 = @"TAP_RELATED_TRAILHEAD";
        break;
      case 413:
        int v4 = @"SELECT_ELEVATION_VIEW";
        break;
      case 414:
        int v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
        break;
      case 415:
        int v4 = @"SEE_MORE_RECENTS";
        break;
      case 416:
        int v4 = @"SEE_MORE_GUIDES";
        break;
      case 417:
        int v4 = @"SELECT_CONTROLS";
        break;
      case 418:
        int v4 = @"NO_SEARCH_RESULTS";
        break;
      case 419:
        int v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
        break;
      case 420:
        int v4 = @"TAP_VIEW_RESULTS_LIST";
        break;
      case 421:
        int v4 = @"SELECT_MAP_VIEW";
        break;
      case 422:
        int v4 = @"SCROLL_LEFT_TRAILHEADS";
        break;
      case 423:
        int v4 = @"SWITCH_TO_OFFLINE_MODE";
        break;
      case 424:
        int v4 = @"ZOOM_IN_CROWN";
        break;
      case 425:
        int v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
        break;
      case 426:
        int v4 = @"TAP_MAP";
        break;
      case 427:
        int v4 = @"SWIPE_DOWN";
        break;
      case 428:
        int v4 = @"TAP_MORE_TRAILHEADS";
        break;
      case 429:
        int v4 = @"TAP_ROUTE_OPTIONS";
        break;
      case 430:
        int v4 = @"TAP_ROUTE_NAV_MAP";
        break;
      case 431:
        int v4 = @"TAP_ROUTE_OVERVIEW_MAP";
        break;
      case 432:
        int v4 = @"TAP_AUDIO";
        break;
      case 433:
        int v4 = @"TAP_OPEN_PLACECARD";
        break;
      case 434:
        int v4 = @"TAP_VIEW_STOPS";
        break;
      case 435:
        int v4 = @"TAP_ROUTE_DETAILS";
        break;
      case 436:
        int v4 = @"ADD_LPR_VEHICLE";
        break;
      case 437:
        int v4 = @"TAP_ADD_VEHICLE";
        break;
      case 438:
        int v4 = @"TAP_PLUG_TYPE";
        break;
      case 439:
        int v4 = @"UNSELECT_SUGGESTED_NETWORK";
        break;
      case 440:
        int v4 = @"TAP_SET_UP_LATER";
        break;
      case 441:
        int v4 = @"ADD_EV_VEHICLE";
        break;
      case 442:
        int v4 = @"UPDATE_COLOR";
        break;
      case 443:
        int v4 = @"SELECT_OTHER_NETWORK";
        break;
      case 444:
        int v4 = @"UNSELECT_NETWORK";
        break;
      case 445:
        int v4 = @"TAP_BACK";
        break;
      case 446:
        int v4 = @"TAP_CANCEL";
        break;
      case 447:
        int v4 = @"UNSELECT_VEHICLE";
        break;
      case 448:
        int v4 = @"UNSELECT_OTHER_NETWORK";
        break;
      case 449:
        int v4 = @"DISPLAY_EV_TIPKIT";
        break;
      case 450:
        int v4 = @"SELECT_NETWORK";
        break;
      case 451:
        int v4 = @"TAP_EV_TIPKIT";
        break;
      case 452:
        int v4 = @"TAP_CHOOSE_NETWORKS";
        break;
      case 453:
        int v4 = @"TAP_ADD_NETWORK";
        break;
      case 454:
        int v4 = @"FILTER_NETWORK";
        break;
      case 455:
        int v4 = @"SELECT_SUGGESTED_NETWORK";
        break;
      case 456:
        int v4 = @"TRANSIT_TO_WALKING";
        break;
      case 457:
        int v4 = @"TRANSIT_TO_FINDMY";
        break;
      case 458:
        int v4 = @"TAP_AC_KEYBOARD";
        break;
      case 459:
        int v4 = @"REACH_PHOTO_STRIP_END";
        break;
      case 460:
        int v4 = @"SEARCH_HERE_REVEAL";
        break;
      case 461:
        int v4 = @"TAP_SEARCH_HERE";
        break;
      case 462:
        int v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
        break;
      case 463:
        int v4 = @"SAVE";
        break;
      case 464:
        int v4 = @"TAP_MORE_CURATED_HIKES";
        break;
      case 465:
        int v4 = @"CREATE_CUSTOM_ROUTE";
        break;
      case 466:
        int v4 = @"TAP_TRY_NOW";
        break;
      case 467:
        int v4 = @"TAP_CURATED_HIKE";
        break;
      case 468:
        int v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
        break;
      case 469:
        int v4 = @"ADD_TO_LIBRARY";
        break;
      case 470:
        int v4 = @"START_HIKING";
        break;
      case 471:
        int v4 = @"EDIT_NOTE";
        break;
      case 472:
        int v4 = @"CREATE_NOTE";
        break;
      case 473:
        int v4 = @"DELETE_PIN";
        break;
      case 474:
        int v4 = @"ADD_ROUTE";
        break;
      case 475:
        int v4 = @"ADD_PIN";
        break;
      case 476:
        int v4 = @"REMOVE_FROM_COLLECTION";
        break;
      case 477:
        int v4 = @"REMOVE_FROM_LIBRARY";
        break;
      case 478:
        int v4 = @"TAP_ITEM";
        break;
      case 479:
        int v4 = @"DELETE_ROUTE";
        break;
      case 480:
        int v4 = @"TAP_ROUTE";
        break;
      case 481:
        int v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
        break;
      case 482:
        int v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 483:
        int v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
        break;
      case 484:
        int v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
        break;
      case 485:
        int v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 486:
        int v4 = @"TAP_DOWNLOAD_NOW_WATCH";
        break;
      case 487:
        int v4 = @"REVEAL_DETECTION_LIST";
        break;
      case 488:
        int v4 = @"TAP_RECOMMENDATION";
        break;
      case 489:
        int v4 = @"TAP_EXPAND";
        break;
      case 490:
        int v4 = @"EXPAND_DETECTION_LIST";
        break;
      case 1001:
        int v4 = @"PAN";
        break;
      case 1002:
        int v4 = @"ZOOM_IN";
        break;
      case 1003:
        int v4 = @"ZOOM_OUT";
        break;
      case 1004:
        int v4 = @"ROTATE";
        break;
      case 1010:
        int v4 = @"TAP_POI";
        break;
      case 1011:
        int v4 = @"TAP_POI_TRANSIT";
        break;
      case 1017:
        int v4 = @"TAP_POI_HIGHLIGHTED";
        break;
      case 1018:
        int v4 = @"TAP_POI_CLUSTERED";
        break;
      case 1020:
        int v4 = @"TAP_POI_DROPPED_PIN";
        break;
      case 1030:
        int v4 = @"DROP_PIN";
        break;
      case 1031:
        int v4 = @"TAP_INCIDENT";
        break;
      case 1032:
        int v4 = @"TAP_TRANSIT_LINE";
        break;
      case 1033:
        int v4 = @"TAP_POI_CALENDAR";
        break;
      case 1034:
        int v4 = @"TAP_POI_CURRENT_LOCATION";
        break;
      case 1035:
        int v4 = @"TAP_POI_TRANSIT_LINE";
        break;
      case 1036:
        int v4 = @"TAP_POI_LANDMARK";
        break;
      case 1037:
        int v4 = @"TAP_POI_FLYOVER";
        break;
      case 1038:
        int v4 = @"TAP_TO_HIDE_TRAY";
        break;
      case 1039:
        int v4 = @"TAP_TO_REVEAL_TRAY";
        break;
      case 1040:
        int v4 = @"TAP_COMPASS";
        break;
      case 1041:
        int v4 = @"PITCH_AWAY_FROM_GROUND";
        break;
      case 1042:
        int v4 = @"PITCH_CLOSER_TO_GROUND";
        break;
      case 1043:
        int v4 = @"ZOOM_IN_PINCH";
        break;
      case 1044:
        int v4 = @"ZOOM_OUT_PINCH";
        break;
      case 1045:
        int v4 = @"ZOOM_IN_DOUBLE_TAP";
        break;
      case 1046:
        int v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
        break;
      case 1047:
        int v4 = @"ZOOM_IN_ONE_FINGER";
        break;
      case 1048:
        int v4 = @"ZOOM_OUT_ONE_FINGER";
        break;
      case 1049:
        int v4 = @"ZOOM_IN_BUTTON";
        break;
      case 1050:
        int v4 = @"ZOOM_OUT_BUTTON";
        break;
      case 1051:
        int v4 = @"TAP_TRAFFIC_CAMERA";
        break;
      case 1052:
        int v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
        break;
      case 1053:
        int v4 = @"OPEN_INDOOR_MAP";
        break;
      case 1054:
        int v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
        break;
      case 1055:
        int v4 = @"TAP_VENUE_BROWSE_BUTTON";
        break;
      case 1056:
        int v4 = @"ENTER_VENUE_EXPERIENCE";
        break;
      case 1057:
        int v4 = @"EXIT_VENUE_EXPERIENCE";
        break;
      case 1058:
        int v4 = @"ZOOM_IN_SCENE_PINCH";
        break;
      case 1059:
        int v4 = @"ZOOM_OUT_SCENE_PINCH";
        break;
      case 1060:
        int v4 = @"ZOOM_RESET";
        break;
      case 1061:
        int v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
        break;
      case 1062:
        int v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 1063:
        int v4 = @"TAP_SPEED_CAMERA";
        break;
      case 1064:
        int v4 = @"TAP_RED_LIGHT_CAMERA";
        break;
      case 1065:
        int v4 = @"TAP_GEO";
        break;
      default:
        switch(a3)
        {
          case 2001:
            int v4 = @"TAP_SEARCH_FIELD";
            break;
          case 2002:
            int v4 = @"CLEAR_SEARCH";
            break;
          case 2003:
            int v4 = @"CANCEL_SEARCH";
            break;
          case 2004:
            int v4 = @"TAP_BROWSE_TOP_CATEGORY";
            break;
          case 2005:
            int v4 = @"TAP_BROWSE_SUB_CATEGORY";
            break;
          case 2006:
            int v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
            break;
          case 2007:
            int v4 = @"TAP_LIST_ITEM";
            break;
          case 2008:
            int v4 = @"SHARE_LIST_ITEM";
            break;
          case 2009:
            int v4 = @"DELETE_LIST_ITEM";
            break;
          case 2010:
            int v4 = @"EDIT_LIST_ITEM";
            break;
          case 2011:
            int v4 = @"REFRESH_SEARCH";
            break;
          case 2012:
            int v4 = @"REVEAL_LIST_ITEM_ACTIONS";
            break;
          case 2013:
            int v4 = @"HIDE_LIST_ITEM_ACTIONS";
            break;
          case 2014:
            int v4 = @"TAP_SEARCH_BUTTON";
            break;
          case 2015:
            int v4 = @"SHOW_SEARCH_RESULTS";
            break;
          case 2016:
            int v4 = @"SHOW_REFRESH_SEARCH";
            break;
          case 2017:
            int v4 = @"PASTE_TEXT";
            break;
          case 2018:
            int v4 = @"TAP_LIST_SUB_ITEM";
            break;
          case 2019:
            int v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
            break;
          case 2020:
            int v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
            break;
          case 2021:
            int v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
            break;
          case 2022:
            int v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2023:
            int v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2024:
            int v4 = @"RETAINED_QUERY";
            break;
          case 2025:
            int v4 = @"TAP_RECENT_AC_SUGGESTION";
            break;
          case 2026:
            int v4 = @"CLEAR_RECENT_AC_SUGGESTION";
            break;
          case 2027:
            int v4 = @"DELETE_RECENT_AC_SUGGESTION";
            break;
          case 2028:
          case 2029:
            goto LABEL_84;
          case 2030:
            int v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
            break;
          case 2031:
            int v4 = @"TAP_SUBACTION";
            break;
          case 2032:
            int v4 = @"TAP_QUERY_BUILDING_ARROW";
            break;
          case 2033:
            int v4 = @"CLICK_ON_EDIT_SEARCH";
            break;
          case 2034:
            int v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
            break;
          case 2035:
            int v4 = @"SHARE_CLIENT_AC_SUGGESTION";
            break;
          case 2036:
            int v4 = @"TAP_ON_MORE_RESULTS";
            break;
          case 2037:
            int v4 = @"SHARE_ITEM";
            break;
          case 2038:
            int v4 = @"HIDE_ITEM";
            break;
          case 2039:
            int v4 = @"TAP_SUGGESTED_ITEM";
            break;
          case 2040:
            int v4 = @"SHARE_SUGGESTED_ITEM";
            break;
          case 2041:
            int v4 = @"HIDE_SUGGESTED_ITEM";
            break;
          case 2042:
            int v4 = @"ADD_HOME_FAVORITE";
            break;
          case 2043:
            int v4 = @"ADD_WORK_FAVORITE";
            break;
          case 2044:
            int v4 = @"ADD_FAVORITE";
            break;
          case 2045:
            int v4 = @"VIEW_FAVORITES_LIST";
            break;
          case 2046:
            int v4 = @"TAP_HOME_FAVORITE";
            break;
          case 2047:
            int v4 = @"TAP_WORK_FAVORITE";
            break;
          case 2048:
            int v4 = @"TAP_CAR_FAVORITE";
            break;
          case 2049:
            int v4 = @"TAP_FAVORITE_ITEM";
            break;
          case 2050:
            int v4 = @"CREATE_HOME_FAVORITE";
            break;
          case 2051:
            int v4 = @"CREATE_WORK_FAVORITE";
            break;
          case 2052:
            int v4 = @"CREATE_FAVORITE";
            break;
          case 2053:
            int v4 = @"SUBMIT_FAVORITE_EDIT";
            break;
          case 2054:
            int v4 = @"ADD_RECOMMENDED_FAVORITE";
            break;
          case 2055:
            int v4 = @"EDIT_FAVORITE";
            break;
          case 2056:
            int v4 = @"REMOVE_FAVORITE";
            break;
          case 2057:
            int v4 = @"SHARE_FAVORITE";
            break;
          case 2058:
            int v4 = @"EDIT_FAVORITES";
            break;
          case 2059:
            int v4 = @"ADD_FAVORITE_PLACE";
            break;
          case 2060:
            int v4 = @"REMOVE_FAVORITE_PLACE";
            break;
          case 2061:
            int v4 = @"CHANGE_HOME_ADDRESS";
            break;
          case 2062:
            int v4 = @"CHANGE_WORK_ADDRESS";
            break;
          case 2063:
            int v4 = @"REFINE_LOCATION";
            break;
          case 2064:
            int v4 = @"TAP_RECENTLY_VIEWED_ITEM";
            break;
          case 2065:
            int v4 = @"SHOW_COLLECTION_LIST";
            break;
          case 2066:
            int v4 = @"SHOW_FAVORITES_COLLECTION";
            break;
          case 2067:
            int v4 = @"SHOW_COLLECTION";
            break;
          case 2068:
            int v4 = @"TAP_COLLECTION_ITEM";
            break;
          case 2069:
            int v4 = @"SHARE_COLLECTION_ITEM";
            break;
          case 2070:
            int v4 = @"REMOVE_COLLECTION_ITEM";
            break;
          case 2071:
            int v4 = @"SAVE_SHARED_COLLECTION";
            break;
          case 2072:
            int v4 = @"CREATE_NEW_COLLECTION";
            break;
          case 2073:
            int v4 = @"SAVE_TO_COLLECTION";
            break;
          case 2074:
            int v4 = @"EDIT_PHOTO";
            break;
          case 2075:
            int v4 = @"SORT_BY_NAME";
            break;
          case 2076:
            int v4 = @"SORT_BY_DISTANCE";
            break;
          case 2077:
            int v4 = @"SORT_BY_RECENT";
            break;
          case 2078:
            int v4 = @"AUTO_SHARE_ETA";
            break;
          case 2079:
            int v4 = @"CANCEL_AUTO_SHARE_ETA";
            break;
          case 2080:
            int v4 = @"MAP_SEARCH";
            break;
          case 2081:
            int v4 = @"DELETE_COLLECTION";
            break;
          case 2082:
            int v4 = @"SHARE_COLLECTION";
            break;
          case 2083:
            int v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
            break;
          case 2084:
            int v4 = @"SHOW_MY_PLACES";
            break;
          case 2085:
            int v4 = @"SHOW_ALL_PLACES";
            break;
          case 2086:
            int v4 = @"TAP_RECENT_QUERY";
            break;
          case 2087:
            int v4 = @"TAP_QUERY_SUGGESTION";
            break;
          case 2088:
            int v4 = @"DELETE_CURATED_COLLECTION";
            break;
          case 2089:
            int v4 = @"FOLLOW";
            break;
          case 2090:
            int v4 = @"PUNCH_IN";
            break;
          case 2091:
            int v4 = @"SAVE_CURATED_COLLECTION";
            break;
          case 2092:
            int v4 = @"SCROLL_LEFT_COLLECTIONS";
            break;
          case 2093:
            int v4 = @"SCROLL_RIGHT_COLLECTIONS";
            break;
          case 2094:
            int v4 = @"SEE_ALL_CURATED_COLLECTION";
            break;
          case 2095:
            int v4 = @"SEE_ALL_PUBLISHERS";
            break;
          case 2096:
            int v4 = @"SHARE_CURATED_COLLECTION";
            break;
          case 2097:
            int v4 = @"SHARE_PUBLISHER";
            break;
          case 2098:
            int v4 = @"SHOW_MORE_COLLECTION";
            break;
          case 2099:
            int v4 = @"TAP_CURATED_COLLECTION";
            break;
          case 2100:
            int v4 = @"TAP_FEATURED_COLLECTIONS";
            break;
          case 2101:
            int v4 = @"TAP_LOCATION";
            break;
          case 2102:
            int v4 = @"TAP_PUBLISHER";
            break;
          case 2103:
            int v4 = @"TAP_PUBLISHER_APP";
            break;
          case 2104:
            int v4 = @"TAP_PUBLISHER_COLLECTIONS";
            break;
          case 2105:
            int v4 = @"UNFOLLOW";
            break;
          case 2106:
            int v4 = @"CHANGE_SCHOOL_ADDRESS";
            break;
          case 2107:
            int v4 = @"ADD_VEHICLE";
            break;
          case 2108:
            int v4 = @"DISPLAY_VIRTUAL_GARAGE";
            break;
          case 2109:
            int v4 = @"ENTER_VIRTUAL_GARAGE";
            break;
          case 2110:
            int v4 = @"PUNCH_OUT_MANUFACTURER_APP";
            break;
          case 2111:
            int v4 = @"REMOVE_LICENSE_PLATE";
            break;
          case 2112:
            int v4 = @"REMOVE_VEHICLE";
            break;
          case 2113:
            int v4 = @"SELECT_VEHICLE";
            break;
          case 2114:
            int v4 = @"SUBMIT_LICENSE_PLATE";
            break;
          case 2115:
            int v4 = @"TAP_ADD_LICENSE_PLATE";
            break;
          case 2116:
            int v4 = @"TAP_ADD_NEW_CAR";
            break;
          case 2117:
            int v4 = @"TAP_BANNER";
            break;
          case 2118:
            int v4 = @"TAP_CONNECT";
            break;
          case 2119:
            int v4 = @"TAP_CONTINUE";
            break;
          case 2120:
            int v4 = @"TAP_EDIT";
            break;
          case 2121:
            int v4 = @"TAP_NAME";
            break;
          case 2122:
            int v4 = @"TAP_NOT_NOW";
            break;
          case 2123:
            int v4 = @"TAP_OTHER_VEHICLE";
            break;
          case 2124:
            int v4 = @"TAP_REMOVE_LICENSE_PLATE";
            break;
          case 2125:
            int v4 = @"TAP_UPDATE_PLATE_NUMBER";
            break;
          case 2126:
            int v4 = @"TAP_VEHICLE";
            break;
          case 2127:
            int v4 = @"TAP_VEHICLE_NAME";
            break;
          case 2128:
            int v4 = @"UPDATE_NAME";
            break;
          case 2129:
            int v4 = @"DONE_TAKING_PHOTO";
            break;
          case 2130:
            int v4 = @"ENABLE_SHOW_PHOTO_NAME";
            break;
          case 2131:
            int v4 = @"SUBMIT_PHOTO";
            break;
          case 2132:
            int v4 = @"USE_PHOTO";
            break;
          case 2133:
            int v4 = @"ADD_RECOMMENDATION_TO_MAPS";
            break;
          case 2134:
            int v4 = @"CANCEL_PHOTO_SUBMISSION";
            break;
          case 2135:
            int v4 = @"CLOSE_RECOMMENDATION_CARD";
            break;
          case 2136:
            int v4 = @"EDIT_RATING";
            break;
          case 2137:
            int v4 = @"PROMPTED_TO_ADD_PHOTO";
            break;
          case 2138:
            int v4 = @"PROMPTED_TO_ADD_RATING";
            break;
          case 2139:
            int v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
            break;
          case 2140:
            int v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
            break;
          case 2141:
            int v4 = @"RETAKE_PHOTO";
            break;
          case 2142:
            int v4 = @"REVEAL_RECOMMENDATION_CARD";
            break;
          case 2143:
            int v4 = @"SUBMIT_NEGATIVE_RATING";
            break;
          case 2144:
            int v4 = @"SUBMIT_POSITIVE_RATING";
            break;
          case 2145:
            int v4 = @"TAP_CHOOSING_PHOTO";
            break;
          case 2146:
            int v4 = @"TAP_TAKE_NEW_PHOTO";
            break;
          case 2147:
            int v4 = @"TAP_TO_ADD_PHOTO";
            break;
          case 2148:
            int v4 = @"CANCEL_INCIDENT_REPORT";
            break;
          case 2149:
            int v4 = @"INCIDENT_REPORT_SUBMITTED";
            break;
          case 2150:
            int v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
            break;
          case 2151:
            int v4 = @"REPORTED_INCIDENT_RECEIVED";
            break;
          case 2152:
            int v4 = @"REPORT_INCIDENT";
            break;
          case 2153:
            int v4 = @"SELECT_INCIDENT_TYPE";
            break;
          case 2154:
            int v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
            break;
          case 2155:
            int v4 = @"TAP_TO_START_REPORT_INCIDENT";
            break;
          case 2156:
            int v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2157:
            int v4 = @"ATTEMPT_VLF_CORRECTION";
            break;
          case 2158:
            int v4 = @"DISMISS_VLF_PROMPT";
            break;
          case 2159:
            int v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2160:
            int v4 = @"VLF_CORRECTION_FAILED";
            break;
          case 2161:
            int v4 = @"VLF_CORRECTION_SUCCESSFUL";
            break;
          case 2162:
            int v4 = @"ENABLE_WIDGET_SUGGESTIONS";
            break;
          case 2163:
            int v4 = @"DISPLAY_CZ_ADVISORY";
            break;
          case 2164:
            int v4 = @"PUNCH_OUT_URL_PAY";
            break;
          case 2165:
            int v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
            break;
          case 2166:
            int v4 = @"DELETE_ITEM";
            break;
          case 2167:
            int v4 = @"CANCEL_REMOVE";
            break;
          case 2168:
            int v4 = @"DELETE_SUGGESTION";
            break;
          case 2169:
            int v4 = @"ADD_SCHOOL_FAVORITE";
            break;
          case 2170:
            int v4 = @"GO_TO_WEBSITE";
            break;
          case 2171:
            int v4 = @"TRY_AGAIN";
            break;
          case 2172:
            int v4 = @"CHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2173:
            int v4 = @"CHECK_EBIKE";
            break;
          case 2174:
            int v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2175:
            int v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
            break;
          case 2176:
            int v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2177:
            int v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
            break;
          case 2178:
            int v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2179:
            int v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2180:
            int v4 = @"TAP_CYCLING_DEFAULT_OPTION";
            break;
          case 2181:
            int v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2182:
            int v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
            break;
          case 2183:
            int v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2184:
            int v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2185:
            int v4 = @"UNCHECK_EBIKE";
            break;
          case 2186:
            int v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
            break;
          case 2187:
            int v4 = @"DISPLAY_LPR_ADVISORY";
            break;
          case 2188:
            int v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
            break;
          case 2189:
            int v4 = @"CREATE_WIDGET";
            break;
          case 2190:
            int v4 = @"REVEAL_WIDGET_TRAY";
            break;
          case 2191:
            int v4 = @"LPR_ERROR_CODE";
            break;
          case 2192:
            int v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
            break;
          case 2193:
            int v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
            break;
          case 2194:
            int v4 = @"LPR_HARD_STOP";
            break;
          case 2195:
            int v4 = @"TAP_PUBLISHER_SUBACTION";
            break;
          case 2196:
            int v4 = @"CARPLAY_DISPLAY_ACTIVATED";
            break;
          case 2197:
            int v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
            break;
          case 2198:
            int v4 = @"TAP_FEATURED_COLLECTION";
            break;
          case 2199:
            int v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
            break;
          case 2200:
            int v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
            break;
          default:
            switch(a3)
            {
              case 3001:
                int v4 = @"START_NAV";
                break;
              case 3002:
                int v4 = @"END_NAV";
                break;
              case 3003:
                int v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                break;
              case 3004:
                int v4 = @"VIEW_DETAILS";
                break;
              case 3005:
                int v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                break;
              case 3006:
                int v4 = @"OPEN_ROUTING_EDITOR";
                break;
              case 3007:
                int v4 = @"EDIT_ORIGIN";
                break;
              case 3008:
                int v4 = @"EDIT_DESTINATION";
                break;
              case 3009:
                int v4 = @"SWAP_ORIGIN_DESTINATION";
                break;
              case 3010:
                int v4 = @"OPEN_MORE_ROUTES";
                break;
              case 3011:
                int v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                break;
              case 3012:
                int v4 = @"SELECT_ROUTING_TYPE_WALKING";
                break;
              case 3013:
                int v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                break;
              case 3014:
                int v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                break;
              case 3015:
                int v4 = @"SELECT_ROUTE";
                break;
              case 3016:
                int v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                break;
              case 3017:
                int v4 = @"EXPAND_STEP_DETAILS_WALK";
                break;
              case 3018:
                int v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                break;
              case 3019:
                int v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                break;
              case 3020:
                int v4 = @"UNCHECK_BUS";
                break;
              case 3021:
                int v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3022:
                int v4 = @"UNCHECK_COMMUTER_RAIL";
                break;
              case 3023:
                int v4 = @"UNCHECK_FERRY";
                break;
              case 3024:
                int v4 = @"CHECK_BUS";
                break;
              case 3025:
                int v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3026:
                int v4 = @"CHECK_COMMUTER_RAIL";
                break;
              case 3027:
                int v4 = @"CHECK_FERRY";
                break;
              case 3028:
                int v4 = @"SELECT_LEAVE_AT";
                break;
              case 3029:
                int v4 = @"SELECT_ARRIVE_BY";
                break;
              case 3030:
                int v4 = @"SELECT_LEAVE_NOW";
                break;
              case 3031:
                int v4 = @"SELECT_DATE_TIME";
                break;
              case 3032:
                int v4 = @"SWITCH_ON_IC_FARES";
                break;
              case 3033:
                int v4 = @"SWITCH_OFF_IC_FARES";
                break;
              case 3034:
                int v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                break;
              case 3035:
                int v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                break;
              case 3036:
                int v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                break;
              case 3037:
                int v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                break;
              case 3038:
                int v4 = @"REVEAL_FROM_ROUTING";
                break;
              case 3039:
                int v4 = @"DISPLAY_ROUTES";
                break;
              case 3040:
                int v4 = @"CHECK_RECOMMENDED_ROUTES";
                break;
              case 3041:
                int v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                break;
              case 3042:
                int v4 = @"CHECK_FASTER_TRIPS";
                break;
              case 3043:
                int v4 = @"UNCHECK_FASTER_TRIPS";
                break;
              case 3044:
                int v4 = @"CHECK_FEWER_TRANSFERS";
                break;
              case 3045:
                int v4 = @"UNCHECK_FEWER_TRANSFERS";
                break;
              case 3046:
                int v4 = @"CHECK_LESS_WALKING";
                break;
              case 3047:
                int v4 = @"UNCHECK_LESS_WALKING";
                break;
              case 3048:
                int v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                break;
              case 3049:
                int v4 = @"TAP_MORE_ROUTES";
                break;
              case 3050:
                int v4 = @"OPEN_NAV_OVERVIEW";
                break;
              case 3051:
                int v4 = @"RESUME_NAV_MANEUVER_VIEW";
                break;
              case 3052:
                int v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                break;
              case 3053:
                int v4 = @"SELECT_AUDIO_VOLUME_LOW";
                break;
              case 3054:
                int v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                break;
              case 3055:
                int v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                break;
              case 3056:
                int v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                break;
              case 3057:
                int v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                break;
              case 3058:
                int v4 = @"RESUME_PREV_NAV";
                break;
              case 3059:
                int v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                break;
              case 3060:
                int v4 = @"ACCEPT_REROUTE";
                break;
              case 3061:
                int v4 = @"DISMISS_REROUTE";
                break;
              case 3062:
                int v4 = @"ATTEMPT_END_NAV";
                break;
              case 3063:
                int v4 = @"DISPLAY_BANNER";
                break;
              case 3064:
                int v4 = @"VIEW_BANNER_DETAILS";
                break;
              case 3065:
                int v4 = @"ENTER_GUIDANCE";
                break;
              case 3066:
                int v4 = @"AUTO_ADVANCE_GUIDANCE";
                break;
              case 3067:
                int v4 = @"TAP_OPEN_WALLET";
                break;
              case 3068:
                int v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                break;
              case 3069:
                int v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                break;
              case 3070:
                int v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                break;
              case 3071:
                int v4 = @"DISPLAY_CARD";
                break;
              case 3072:
                int v4 = @"RENDER_ROUTE";
                break;
              case 3073:
                int v4 = @"DISPLAY_JUNCTION_VIEW";
                break;
              case 3074:
                int v4 = @"SELECT_DEPARTURE";
                break;
              case 3075:
                int v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                break;
              case 3076:
                int v4 = @"DEVICE_RAISE";
                break;
              case 3077:
                int v4 = @"ENTER_AR_NAV_VIEW";
                break;
              case 3078:
                int v4 = @"EXIT_AR_NAV_VIEW";
                break;
              case 3079:
                int v4 = @"AR_CALIBRATION_START";
                break;
              case 3080:
                int v4 = @"AR_CALIBRATION_FAILURE";
                break;
              case 3081:
                int v4 = @"AR_CALIBRATION_SUCCESS";
                break;
              case 3082:
                int v4 = @"DISPLAY_AR_NAV_ARROW";
                break;
              case 3083:
                int v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                break;
              case 3084:
                int v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                break;
              case 3085:
                int v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                break;
              case 3086:
                int v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                break;
              case 3087:
                int v4 = @"DISPLAY_ADVISORY_BANNER";
                break;
              case 3088:
                int v4 = @"TAP_SHOW_ADVISORY_DETAILS";
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

- (void)_readImpossibleActions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateCuratedCollectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpossibleActions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)impossibleActionsCount
{
  return self->_impossibleActions.count;
}

- (int)impossibleActions
{
  return self->_impossibleActions.list;
}

- (void)clearImpossibleActions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  PBRepeatedInt32Clear();
}

- (void)addImpossibleAction:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (int)impossibleActionAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateCuratedCollection _readImpossibleActions]((uint64_t)self);
  p_impossibleActions = &self->_impossibleActions;
  unint64_t count = self->_impossibleActions.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_impossibleActions->list[a3];
}

- (void)setImpossibleActions:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;

  MEMORY[0x1F4147390](&self->_impossibleActions, a3, a4);
}

- (id)impossibleActionsAsString:(int)a3
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
            int v4 = @"TAP_WIDGET_ITEM";
            break;
          case 9002:
            int v4 = @"DISPLAY_NOTIFICATION";
            break;
          case 9003:
            int v4 = @"TAP_NOTIFICATION";
            break;
          case 9004:
            int v4 = @"EXPAND_NOTIFICATION";
            break;
          case 9005:
            int v4 = @"DISMISS_NOTIFICATION";
            break;
          case 9006:
            int v4 = @"OPEN_SEARCH";
            break;
          case 9007:
            int v4 = @"OPEN_PAN_VIEW";
            break;
          case 9008:
            int v4 = @"PAN_LEFT";
            break;
          case 9009:
            int v4 = @"PAN_UP";
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
            int v4 = @"PAN_DOWN";
            break;
          case 9012:
            int v4 = @"TAP_RECENT_DESTINATIONS";
            break;
          case 9013:
            int v4 = @"OPEN_DESTINATIONS";
            break;
          case 9014:
            int v4 = @"OPEN_FAVORITES";
            break;
          case 9015:
            int v4 = @"VIEW_NAV_OPTIONS";
            break;
          case 9016:
            int v4 = @"START_NAV_NO_GUIDANCE";
            break;
          case 9017:
            int v4 = @"TURN_OFF_GUIDANCE";
            break;
          case 9018:
            int v4 = @"TURN_ON_GUIDANCE";
            break;
          case 9019:
            int v4 = @"OPEN_KEYBOARD";
            break;
          case 9020:
            int v4 = @"SHARE_DESTINATION";
            break;
          case 9021:
            int v4 = @"START_NAV_AUTOMATED";
            break;
          case 9022:
            int v4 = @"SHARE_ETA";
            break;
          case 9023:
            int v4 = @"SELECT_GROUP";
            break;
          case 9024:
            int v4 = @"DESELECT_GROUP";
            break;
          case 9025:
            int v4 = @"SELECT_CONTACT";
            break;
          case 9026:
            int v4 = @"DESELECT_CONTACT";
            break;
          case 9027:
            int v4 = @"TAP_VIEW_CONTACTS";
            break;
          case 9028:
            int v4 = @"STOP_RECEIVING_ETA";
            break;
          case 9029:
            int v4 = @"DISPLAY_ANNOUNCEMENT";
            break;
          case 9030:
            int v4 = @"TAP_ANNOUNCEMENT";
            break;
          case 9031:
            int v4 = @"DISPLAY_CYCLING_NOTIFICATION";
            break;
          case 9032:
            int v4 = @"TAP_CYCLING_NOTIFICATION";
            break;
          case 9033:
            int v4 = @"SHARE_CYCLING_ETA";
            break;
          case 9034:
            int v4 = @"MANAGE_NOTIFICATIONS";
            break;
          case 9035:
            int v4 = @"PUNCH_OUT_PUBLISHER_REVIEW";
            break;
          case 9036:
            int v4 = @"SCROLL_FORWARD";
            break;
          case 9037:
            int v4 = @"SCROLL_BACKWARD";
            break;
          case 9038:
            int v4 = @"SHOW_ALL_CURATED_COLLECTIONS";
            break;
          case 9039:
            int v4 = @"TAP_LESS";
            break;
          case 9040:
            int v4 = @"TAP_MORE";
            break;
          case 9101:
            int v4 = @"DISPLAY_ADD_HOME_AND_WORK";
            break;
          case 9102:
            int v4 = @"TAP_ADD_HOME_AND_WORK";
            break;
          case 9103:
            int v4 = @"DISPLAY_ALLOW_FREQUENTS";
            break;
          case 9104:
            int v4 = @"TAP_ALLOW_FREQUENTS";
            break;
          case 9105:
            int v4 = @"DISPLAY_ALLOW_LOCATION";
            break;
          case 9106:
            int v4 = @"TAP_ALLOW_LOCATION";
            break;
          default:
            switch(a3)
            {
              case 7001:
                int v4 = @"EXPAND_TRANSIT_SYSTEM";
                break;
              case 7002:
                int v4 = @"COLLAPSE_TRANSIT_SYSTEM";
                break;
              case 7003:
                int v4 = @"SHOW_MORE_DEPARTURES";
                break;
              case 7004:
                int v4 = @"VIEW_TRANSIT_LINE";
                break;
              case 7005:
                int v4 = @"CANCEL_VIEW_TRANSIT_LINE";
                break;
              case 7006:
                int v4 = @"TAP_TRANSIT_ATTRIBUTION";
                break;
              case 7007:
                int v4 = @"TAP_TRANSIT_ADVISORY";
                break;
              case 7008:
                int v4 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                break;
              case 7009:
                int v4 = @"SUBSCRIBE_LINE_INCIDENT";
                break;
              case 7010:
                int v4 = @"UNSUBSCRIBE_LINE_INCIDENT";
                break;
              case 7011:
                int v4 = @"TAP_NEAREST_STATION";
                break;
              case 7012:
                int v4 = @"TAP_NEAREST_STOP";
                break;
              case 7013:
                int v4 = @"TAP_CONNECTION";
                break;
              case 7014:
                int v4 = @"GET_TICKETS";
                break;
              case 7015:
                int v4 = @"OPEN_SCHEDULECARD_DATETIME";
                break;
              case 7016:
                int v4 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                break;
              case 7017:
                int v4 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                break;
              case 7018:
                int v4 = @"VIEW_ON_MAP";
                break;
              case 7019:
                int v4 = @"FORCE_UPDATE_DEPARTURE_INFO";
                break;
              case 7020:
                int v4 = @"TAP_TRANSIT_LINE_INFO";
                break;
              case 7021:
                int v4 = @"TAP_ATTRIBUTION_CELL";
                break;
              case 7022:
                int v4 = @"TAP_NEXT_DEPARTURES";
                break;
              case 7023:
                int v4 = @"VIEW_BANNER";
                break;
              case 7024:
                int v4 = @"GET_SHOWTIMES";
                break;
              case 7025:
                int v4 = @"MAKE_APPOINTMENT";
                break;
              case 7026:
                int v4 = @"RESERVE_PARKING";
                break;
              case 7027:
                int v4 = @"RESERVE_ROOM";
                break;
              case 7028:
                int v4 = @"WAITLIST";
                break;
              case 7029:
                int v4 = @"ORDER_TAKEOUT";
                break;
              case 7030:
                int v4 = @"RESERVE";
                break;
              default:
                switch(a3)
                {
                  case 8001:
                    int v4 = @"INVOKE_SIRI_SNIPPET";
                    break;
                  case 8002:
                    int v4 = @"INVOKE_SIRI_DISAMBIGUATION";
                    break;
                  case 8003:
                    int v4 = @"SHOW_PLACE_DETAILS";
                    break;
                  case 8004:
                    int v4 = @"ANSWER_REROUTE_SUGGESTION";
                    break;
                  case 8005:
                    int v4 = @"SUGGEST_NAV_REROUTE";
                    break;
                  case 8006:
                    int v4 = @"GET_NAV_STATUS";
                    break;
                  case 8007:
                    int v4 = @"REPEAT_NAV_STATUS";
                    break;
                  case 8008:
                    int v4 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                    break;
                  case 8009:
                    int v4 = @"INVOKE_SIRI";
                    break;
                  case 8010:
                    int v4 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                    break;
                  case 8011:
                    int v4 = @"DISPLAY_NO_RESULTS_MESSAGE";
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
            int v4 = @"GET_DIRECTIONS";
            break;
          case 6004:
            int v4 = @"TAP_FLYOVER_TOUR";
            break;
          case 6005:
            int v4 = @"REMOVE_PIN";
            break;
          case 6006:
            int v4 = @"TAP_PHOTO";
            break;
          case 6007:
            int v4 = @"TAP_MAPS_VIEW";
            break;
          case 6008:
            int v4 = @"TAP_ADDRESS";
            break;
          case 6009:
            int v4 = @"CALL";
            break;
          case 6010:
            int v4 = @"TAP_URL";
            break;
          case 6011:
            int v4 = @"SHOW_TODAY_HOURS";
            break;
          case 6012:
            int v4 = @"SHOW_ALL_HOURS";
            break;
          case 6013:
            int v4 = @"SHARE";
            break;
          case 6014:
          case 6017:
          case 6028:
          case 6030:
          case 6035:
            goto LABEL_84;
          case 6015:
            int v4 = @"ADD_TO_FAVORITES";
            break;
          case 6016:
            int v4 = @"ADD_CONTACT";
            break;
          case 6018:
            int v4 = @"PUNCH_OUT_PHOTO";
            break;
          case 6019:
            int v4 = @"PUNCH_OUT_USEFUL_TO_KNOW";
            break;
          case 6020:
            int v4 = @"PUNCH_OUT_OPEN_APP";
            break;
          case 6021:
            int v4 = @"PUNCH_OUT_SINGLE_REVIEW";
            break;
          case 6022:
            int v4 = @"PUNCH_OUT_CHECK_IN";
            break;
          case 6023:
            int v4 = @"PUNCH_OUT_MORE_INFO";
            break;
          case 6024:
            int v4 = @"PUNCH_OUT_WRITE_REVIEW";
            break;
          case 6025:
            int v4 = @"PUNCH_OUT_ADD_PHOTO";
            break;
          case 6026:
            int v4 = @"TAP_GRID_VIEW";
            break;
          case 6027:
            int v4 = @"EDIT_LOCATION";
            break;
          case 6029:
            int v4 = @"ADD_PHOTO";
            break;
          case 6031:
            int v4 = @"RETAKE";
            break;
          case 6032:
            int v4 = @"ADD_NOTE";
            break;
          case 6033:
            int v4 = @"REMOVE_CAR";
            break;
          case 6034:
            int v4 = @"EDIT_NAME";
            break;
          case 6036:
            int v4 = @"RESERVE_TABLE";
            break;
          case 6037:
            int v4 = @"ADD_TO_QUEUE";
            break;
          case 6038:
            int v4 = @"VIEW_BOOKED_TABLE";
            break;
          case 6039:
            int v4 = @"VIEW_QUEUED_TABLE";
            break;
          case 6040:
            int v4 = @"PUNCH_OUT_THIRD_PARTY_APP";
            break;
          case 6041:
            int v4 = @"PUNCH_OUT_LEGAL_LINK";
            break;
          case 6042:
            int v4 = @"TAP_PLACECARD_HEADER";
            break;
          case 6043:
            int v4 = @"REMOVE_FROM_FAVORITES";
            break;
          case 6044:
            int v4 = @"VIEW_CONTACT";
            break;
          case 6045:
            int v4 = @"CHAT";
            break;
          case 6046:
            int v4 = @"FIND_STORES";
            break;
          case 6047:
            int v4 = @"TAP_PARENT";
            break;
          case 6048:
            int v4 = @"SCROLL_LEFT_PHOTOS";
            break;
          case 6049:
            int v4 = @"SCROLL_RIGHT_PHOTOS";
            break;
          case 6050:
            int v4 = @"PUNCH_OUT";
            break;
          case 6051:
            int v4 = @"TAP_ENTER_MUNIN";
            break;
          case 6052:
            int v4 = @"TAP_RECOMMENDED_DISHES_PHOTO";
            break;
          case 6053:
            int v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
            break;
          case 6054:
            int v4 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
            break;
          case 6055:
            int v4 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6056:
            int v4 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
            break;
          case 6057:
            int v4 = @"SHOW_LINKED_SERVICE_HOURS";
            break;
          case 6058:
            int v4 = @"ENTER_LOOK_AROUND";
            break;
          case 6059:
            int v4 = @"EXIT_LOOK_AROUND";
            break;
          case 6060:
            int v4 = @"TAP_ENTER_LOOK_AROUND_VIEW";
            break;
          case 6061:
            int v4 = @"TAP_ENTER_LOOK_AROUND_PIP";
            break;
          case 6062:
            int v4 = @"EXPAND_LOOK_AROUND_VIEW";
            break;
          case 6063:
            int v4 = @"CLOSE_LOOK_AROUND";
            break;
          case 6064:
            int v4 = @"COLLAPSE_LOOK_AROUND_VIEW";
            break;
          case 6065:
            int v4 = @"TAP_SHOW_ACTIONS";
            break;
          case 6066:
            int v4 = @"TAP_HIDE_LABELS";
            break;
          case 6067:
            int v4 = @"TAP_SHOW_LABELS";
            break;
          case 6068:
            int v4 = @"TAP_SHOW_DETAILS";
            break;
          case 6069:
            int v4 = @"PAN_LOOK_AROUND";
            break;
          case 6070:
            int v4 = @"TAP_LOOK_AROUND_THUMBNAIL";
            break;
          case 6071:
            int v4 = @"TAP_LANDMARK";
            break;
          case 6072:
            int v4 = @"TAP_SCENE";
            break;
          case 6073:
            int v4 = @"SHOW_LINKED_BUSINESS_HOURS";
            break;
          case 6074:
            int v4 = @"TAP_PLACECARD_SHORTCUT";
            break;
          case 6075:
            int v4 = @"SHOW_ALL_LOCATIONS_INSIDE";
            break;
          case 6076:
            int v4 = @"SHOW_ALL_SIMILAR_LOCATIONS";
            break;
          case 6077:
            int v4 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
            break;
          case 6078:
            int v4 = @"TAP_PARENT_LOCATION";
            break;
          case 6079:
            int v4 = @"TAP_SIMILAR_LOCATION";
            break;
          case 6080:
            int v4 = @"TAP_LOCATION_INSIDE";
            break;
          case 6081:
            int v4 = @"TAP_LOCATION_AT_ADDRESS";
            break;
          case 6082:
            int v4 = @"CLOSE_ROUTE_GENIUS";
            break;
          case 6083:
            int v4 = @"LOAD_WEB_CONTENT";
            break;
          case 6084:
            int v4 = @"SCROLL_FORWARD_WEB_CONTENT";
            break;
          case 6085:
            int v4 = @"SCROLL_BACKWARD_WEB_CONTENT";
            break;
          case 6086:
            int v4 = @"TAP_WEB_CONTENT";
            break;
          case 6087:
            int v4 = @"SHOW_PHOTO_VIEWER";
            break;
          case 6088:
            int v4 = @"SHOW_LAST_PAGE";
            break;
          case 6089:
            int v4 = @"TAP_VIEW_APP";
            break;
          case 6090:
            int v4 = @"TAP_APP_CLIP";
            break;
          case 6091:
            int v4 = @"DEAD_BATTERY";
            break;
          case 6092:
            int v4 = @"DISMISS_LOW_BATTERY_ALERT";
            break;
          case 6093:
            int v4 = @"DISMISS_OUT_OF_RANGE_ALERT";
            break;
          case 6094:
            int v4 = @"FAILED_TO_LOAD_EV_STATUS";
            break;
          case 6095:
            int v4 = @"LOW_BATTERY_ALERT";
            break;
          case 6096:
            int v4 = @"PAUSE_ROUTE";
            break;
          case 6097:
            int v4 = @"TAP_ADD_STOP";
            break;
          case 6098:
            int v4 = @"TAP_CHARGE_POINT";
            break;
          case 6099:
            int v4 = @"TAP_OUT_OF_RANGE_ALERT";
            break;
          case 6100:
            int v4 = @"SCROLL_DOWN_PHOTOS";
            break;
          case 6101:
            int v4 = @"SCROLL_UP_PHOTOS";
            break;
          case 6102:
            int v4 = @"TAP_MORE_PHOTOS";
            break;
          case 6103:
            int v4 = @"TAP_TO_CONFIRM_INCIDENT";
            break;
          case 6104:
            int v4 = @"SHOW_INCIDENT";
            break;
          case 6105:
            int v4 = @"REVEAL_APP_CLIP";
            break;
          case 6106:
            int v4 = @"ORDER_DELIVERY";
            break;
          case 6107:
            int v4 = @"VIEW_MENU";
            break;
          case 6108:
            int v4 = @"TAP_EDIT_STOPS";
            break;
          case 6109:
            int v4 = @"LEARN_MORE_WEB_CONTENT";
            break;
          case 6110:
            int v4 = @"MAKE_APPOINTMENT_WEB_CONTENT";
            break;
          case 6111:
            int v4 = @"REVEAL_SHOWCASE";
            break;
          default:
            switch(a3)
            {
              case 5001:
                int v4 = @"SHOW_MAPS_SETTINGS";
                break;
              case 5002:
                int v4 = @"TAP_STANDARD_MODE";
                break;
              case 5003:
                int v4 = @"TAP_TRANSIT_MODE";
                break;
              case 5004:
                int v4 = @"TAP_SATELLITE_MODE";
                break;
              case 5005:
                int v4 = @"SWITCH_ON_TRAFFIC";
                break;
              case 5006:
                int v4 = @"SWITCH_OFF_TRAFFIC";
                break;
              case 5007:
                int v4 = @"SWITCH_ON_LABELS";
                break;
              case 5008:
                int v4 = @"SWITCH_OFF_LABELS";
                break;
              case 5009:
                int v4 = @"SWITCH_ON_3D_MAP";
                break;
              case 5010:
                int v4 = @"SWITCH_OFF_3D_MAP";
                break;
              case 5011:
                int v4 = @"SWITCH_ON_WEATHER";
                break;
              case 5012:
                int v4 = @"SWITCH_OFF_WEATHER";
                break;
              case 5013:
                int v4 = @"REPORT_A_PROBLEM";
                break;
              case 5014:
                int v4 = @"ADD_PLACE";
                break;
              case 5015:
                goto LABEL_84;
              case 5016:
                int v4 = @"TAP_PREFERENCES";
                break;
              case 5017:
                int v4 = @"SWITCH_ON_TOLLS";
                break;
              case 5018:
                int v4 = @"SWITCH_OFF_TOLLS";
                break;
              case 5019:
                int v4 = @"SWITCH_ON_HIGHWAYS";
                break;
              case 5020:
                int v4 = @"SWITCH_OFF_HIGHWAYS";
                break;
              case 5021:
                int v4 = @"SWITCH_ON_HEADING";
                break;
              case 5022:
                int v4 = @"SWITCH_OFF_HEADING";
                break;
              case 5023:
                int v4 = @"SWITCH_ON_SPEED_LIMIT";
                break;
              case 5024:
                int v4 = @"SWITCH_OFF_SPEED_LIMIT";
                break;
              case 5025:
                int v4 = @"ELECT_DRIVING_MODE";
                break;
              case 5026:
                int v4 = @"ELECT_WALKING_MODE";
                break;
              case 5027:
                int v4 = @"ELECT_TRANSIT_MODE";
                break;
              case 5028:
                int v4 = @"ELECT_RIDESHARE_MODE";
                break;
              case 5029:
                int v4 = @"SWITCH_ON_FIND_MY_CAR";
                break;
              case 5030:
                int v4 = @"SWITCH_OFF_FIND_MY_CAR";
                break;
              case 5031:
                int v4 = @"MARK_MY_LOCATION";
                break;
              case 5032:
                int v4 = @"TAP_HYBRID_MODE";
                break;
              case 5033:
                int v4 = @"CHECK_AVOID_BUSY_ROADS";
                break;
              case 5034:
                int v4 = @"UNCHECK_AVOID_BUSY_ROADS";
                break;
              case 5035:
                int v4 = @"CHECK_AVOID_HILLS";
                break;
              case 5036:
                int v4 = @"UNCHECK_AVOID_HILLS";
                break;
              case 5037:
                int v4 = @"CHECK_AVOID_STAIRS";
                break;
              case 5038:
                int v4 = @"UNCHECK_AVOID_STAIRS";
                break;
              case 5039:
                int v4 = @"ELECT_CYCLING_MODE";
                break;
              default:
                switch(a3)
                {
                  case 4001:
                    int v4 = @"RECENTER_CURRENT_LOCATION";
                    break;
                  case 4002:
                    int v4 = @"TAP_HEADING_ON";
                    break;
                  case 4003:
                    int v4 = @"TAP_HEADING_OFF";
                    break;
                  case 4004:
                    int v4 = @"PUCK_DRIFT";
                    break;
                  case 4005:
                    int v4 = @"PUCK_SNAP";
                    break;
                  case 4006:
                    int v4 = @"SELECT_FLOOR";
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
              int v4 = @"VIEW_APP";
              break;
            case 14002:
              int v4 = @"ENABLE";
              break;
            case 14003:
              int v4 = @"BOOK_RIDE";
              break;
            case 14004:
              int v4 = @"REQUEST_RIDE";
              break;
            case 14005:
              int v4 = @"CONTACT_DRIVER";
              break;
            case 14006:
              int v4 = @"CHANGE_PAYMENT";
              break;
            case 14007:
              int v4 = @"ENABLE_ALL_RIDESHARE_APPS";
              break;
            case 14008:
              int v4 = @"TAP_FOR_MORE_RIDES";
              break;
            case 14009:
              int v4 = @"SUBMIT_TRIP_FEEDBACK";
              break;
            default:
              switch(a3)
              {
                case 13001:
                  int v4 = @"SELECT_ADDRESS";
                  break;
                case 13002:
                  int v4 = @"ADD_ADDRESS";
                  break;
                case 13003:
                  int v4 = @"SELECT_LABEL";
                  break;
                case 13004:
                  int v4 = @"DELETE_ADDRESS";
                  break;
                case 13005:
                  int v4 = @"EDIT_ITEMS";
                  break;
                case 13006:
                  int v4 = @"RAP_FAVORITES";
                  break;
                case 13007:
                  int v4 = @"SORT_LIST_ITEM";
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
              int v4 = @"ORB_PEEK";
              break;
            case 15002:
              int v4 = @"ORB_POP";
              break;
            case 15003:
              int v4 = @"ORB_DISMISS";
              break;
            default:
LABEL_84:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
              int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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
            int v4 = @"START_DRAG";
            break;
          case 17002:
            int v4 = @"CANCEL_DRAG";
            break;
          case 17003:
            int v4 = @"COMPLETE_DRAG";
            break;
          case 17004:
            int v4 = @"START_DROP";
            break;
          case 17005:
            int v4 = @"CANCEL_DROP";
            break;
          case 17006:
            int v4 = @"COMPLETE_DROP";
            break;
          case 17007:
            int v4 = @"ANNOTATION_SELECT";
            break;
          case 17008:
            int v4 = @"ANNOTATION_SELECT_AUTO";
            break;
          case 17009:
            int v4 = @"ANNOTATION_SELECT_LIST";
            break;
          case 17010:
            int v4 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
            break;
          case 17011:
            int v4 = @"CALLOUT_FLYOVER_TOUR";
            break;
          case 17012:
            int v4 = @"CALLOUT_INFO";
            break;
          case 17013:
            int v4 = @"CALLOUT_NAV_TRANSIT";
            break;
          case 17014:
            int v4 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
            break;
          case 17015:
            int v4 = @"CALLOUT_VIEW_TRANSIT_LINE";
            break;
          case 17016:
            int v4 = @"DIRECTIONS_SELECT";
            break;
          case 17017:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM";
            break;
          case 17018:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
            break;
          case 17019:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
            break;
          case 17020:
            int v4 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
            break;
          case 17021:
            int v4 = @"DIRECTIONS_TRANSIT_LATER";
            break;
          case 17022:
            int v4 = @"DIRECTIONS_TRANSIT_NOW";
            break;
          case 17023:
            int v4 = @"FLYOVER_NOTIFICATION_DISMISS";
            break;
          case 17024:
            int v4 = @"FLYOVER_NOTIFICATION_START";
            break;
          case 17025:
            int v4 = @"FLYOVER_TOUR_COMPLETED";
            break;
          case 17026:
            int v4 = @"FLYOVER_TOUR_END";
            break;
          case 17027:
            int v4 = @"FLYOVER_TOUR_NOTIFICATION";
            break;
          case 17028:
            int v4 = @"FLYOVER_TOUR_START";
            break;
          case 17029:
            int v4 = @"INFO_BOOKMARKS";
            break;
          case 17030:
            int v4 = @"INFO_CARD_DETACHED";
            break;
          case 17031:
            int v4 = @"INFO_CONTACTS";
            break;
          case 17032:
            int v4 = @"INFO_DIRECTIONS";
            break;
          case 17033:
            int v4 = @"INFO_DIRECTIONS_FROM";
            break;
          case 17034:
            int v4 = @"INFO_DIRECTIONS_TO";
            break;
          case 17035:
            int v4 = @"INFO_DISMISS";
            break;
          case 17036:
            int v4 = @"INFO_INFO";
            break;
          case 17037:
            int v4 = @"INFO_PHOTOS";
            break;
          case 17038:
            int v4 = @"INFO_REVIEWS";
            break;
          case 17039:
            int v4 = @"INFO_SHARE";
            break;
          case 17040:
            int v4 = @"INFO_SHARE_AIRDROP";
            break;
          case 17041:
            int v4 = @"INFO_SHARE_FACEBOOK";
            break;
          case 17042:
            int v4 = @"INFO_SHARE_MAIL";
            break;
          case 17043:
            int v4 = @"INFO_SHARE_MESSAGE";
            break;
          case 17044:
            int v4 = @"INFO_SHARE_TENCENTWEIBO";
            break;
          case 17045:
            int v4 = @"INFO_SHARE_WEIBO";
            break;
          case 17046:
            int v4 = @"INFO_YELP";
            break;
          case 17047:
            int v4 = @"MAPS_APP_LAUNCH";
            break;
          case 17048:
            int v4 = @"MAP_3D_OFF";
            break;
          case 17049:
            int v4 = @"MAP_3D_ON";
            break;
          case 17050:
            int v4 = @"MAP_OPTIONS_DROP_PIN";
            break;
          case 17051:
            int v4 = @"MAP_OPTIONS_HYBRID";
            break;
          case 17052:
            int v4 = @"MAP_OPTIONS_PRINT";
            break;
          case 17053:
            int v4 = @"MAP_OPTIONS_REMOVE_PIN";
            break;
          case 17054:
            int v4 = @"MAP_OPTIONS_SATELLITE";
            break;
          case 17055:
            int v4 = @"MAP_OPTIONS_STANDARD";
            break;
          case 17056:
            int v4 = @"MAP_OPTIONS_TRAFFIC_HIDE";
            break;
          case 17057:
            int v4 = @"MAP_OPTIONS_TRAFFIC_SHOW";
            break;
          case 17058:
            int v4 = @"MAP_OPTIONS_TRANSIT";
            break;
          case 17059:
            int v4 = @"MAP_TAP_FLYOVER_CITY";
            break;
          case 17060:
            int v4 = @"MAP_TAP_LINE";
            break;
          case 17061:
            int v4 = @"MAP_TAP_POI_TRANSIT";
            break;
          case 17062:
            int v4 = @"MAP_TAP_TRAFFIC_INCIDENT";
            break;
          case 17063:
            int v4 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
            break;
          case 17064:
            int v4 = @"MAP_USER_TRACKING_OFF";
            break;
          case 17065:
            int v4 = @"MAP_USER_TRACKING_ON";
            break;
          case 17066:
            int v4 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
            break;
          case 17067:
            int v4 = @"NAV_CLEAR";
            break;
          case 17068:
            int v4 = @"NAV_LIST";
            break;
          case 17069:
            int v4 = @"NAV_ROUTE_STEP_NEXT";
            break;
          case 17070:
            int v4 = @"NAV_ROUTE_STEP_PREV";
            break;
          case 17071:
            int v4 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
            break;
          case 17072:
            int v4 = @"ORB_DISPLAY_MENU";
            break;
          case 17073:
            int v4 = @"ORB_MENU_CALL";
            break;
          case 17074:
            int v4 = @"ORB_MENU_DIRECTIONS";
            break;
          case 17075:
            int v4 = @"ORB_MENU_DISMISS";
            break;
          case 17076:
            int v4 = @"ORB_MENU_SHARE";
            break;
          case 17077:
            int v4 = @"ORB_MENU_SHOW_PLACECARD";
            break;
          case 17078:
            int v4 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
            break;
          case 17079:
            int v4 = @"ORB_MENU_URL";
            break;
          case 17080:
            int v4 = @"ORB_PRESS";
            break;
          case 17081:
            int v4 = @"ORB_SPRINGBOARD_MARK_LOCATION";
            break;
          case 17082:
            int v4 = @"ORB_SPRINGBOARD_SEARCH";
            break;
          case 17083:
            int v4 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
            break;
          case 17084:
            int v4 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
            break;
          case 17085:
            int v4 = @"RAP_PERMISSION_CANCEL";
            break;
          case 17086:
            int v4 = @"RAP_PERMISSION_EMAIL_NA";
            break;
          case 17087:
            int v4 = @"RAP_PERMISSION_EMAIL_OK";
            break;
          case 17088:
            int v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
            break;
          case 17089:
            int v4 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
            break;
          case 17090:
            int v4 = @"RAP_PERMISSION_OK";
            break;
          case 17091:
            int v4 = @"SEARCH_BEGIN";
            break;
          case 17092:
            int v4 = @"SEARCH_CANCEL";
            break;
          case 17093:
            int v4 = @"SEARCH_SELECT";
            break;
          case 17094:
            int v4 = @"TRANSIT_LINE_SELECTION_DISMISS";
            break;
          case 17095:
            int v4 = @"TRANSIT_LINE_SELECTION_VIEW";
            break;
          case 17096:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
            break;
          case 17097:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
            break;
          case 17098:
            int v4 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
            break;
          case 17099:
            int v4 = @"UNKNOWN_ACTION";
            break;
          case 17100:
            int v4 = @"INFO_SHARE_TWITTER";
            break;
          case 17101:
            int v4 = @"INFO_TAP_POPULAR_APP_NEARBY";
            break;
          case 17102:
            int v4 = @"INFO_DIRECTIONS_WALK";
            break;
          case 17103:
            int v4 = @"INFO_DIRECTIONS_TRANSIT";
            break;
          case 17104:
            int v4 = @"INFO_DIRECTIONS_DRIVE";
            break;
          case 17105:
            int v4 = @"INFO_REPORT_A_PROBLEM";
            break;
          case 17106:
            int v4 = @"CALLOUT_NAV";
            break;
          case 17107:
            int v4 = @"RAP_PERMISSION_EMAIL_CANCEL";
            break;
          case 17108:
            int v4 = @"MAP_TAP_POI";
            break;
          default:
            if (a3 == 16001)
            {
              int v4 = @"SEARCH_IN_MAPS";
            }
            else
            {
              if (a3 != 90010) {
                goto LABEL_84;
              }
              int v4 = @"PAN_RIGHT";
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
          int v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
          break;
        case 10102:
          int v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
          break;
        case 10103:
          int v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
          break;
        case 10104:
          int v4 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
          break;
        case 10105:
          int v4 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
          break;
        case 10106:
          int v4 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
          break;
        case 10107:
          int v4 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
          break;
        case 10108:
          int v4 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
          break;
        case 10109:
          int v4 = @"RAP_CANCEL";
          break;
        case 10110:
          int v4 = @"RAP_NEXT";
          break;
        case 10111:
          int v4 = @"RAP_BACK";
          break;
        case 10112:
          int v4 = @"RAP_SEND";
          break;
        case 10113:
          int v4 = @"RAP_SKIP";
          break;
        case 10114:
          int v4 = @"RAP_SHOW_MORE";
          break;
        case 10115:
          int v4 = @"RAP_ADD_PHOTO";
          break;
        case 10116:
          int v4 = @"RAP_MAP_INCORRECT";
          break;
        case 10117:
          int v4 = @"RAP_BAD_DIRECTIONS";
          break;
        case 10118:
          int v4 = @"RAP_TRANSIT_INFO_INCORRECT";
          break;
        case 10119:
          int v4 = @"RAP_SATELLITE_IMAGE_PROBLEM";
          break;
        case 10120:
          int v4 = @"RAP_SEARCH_RESULTS_INCORRECT";
          break;
        case 10121:
          int v4 = @"RAP_ADD_A_PLACE";
          break;
        case 10122:
          int v4 = @"RAP_HOME";
          break;
        case 10123:
          int v4 = @"RAP_WORK";
          break;
        case 10124:
          int v4 = @"RAP_OTHER";
          break;
        case 10125:
          int v4 = @"RAP_LOCATION";
          break;
        case 10126:
          int v4 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
          break;
        case 10127:
          int v4 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
          break;
        case 10128:
          int v4 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
          break;
        case 10129:
          int v4 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
          break;
        case 10130:
          int v4 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
          break;
        case 10131:
          int v4 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
          break;
        case 10132:
          int v4 = @"RAP_TRANSIT_DELAY";
          break;
        case 10133:
          int v4 = @"RAP_LOCATION_CLOSED";
          break;
        case 10134:
          int v4 = @"RAP_CLOSED_PERMANENTLY";
          break;
        case 10135:
          int v4 = @"RAP_CLOSED_TEMPORARILY";
          break;
        case 10136:
          int v4 = @"RAP_HOURS_HAVE_CHANGED";
          break;
        case 10137:
          int v4 = @"RAP_SELECT_STATION";
          break;
        case 10138:
          int v4 = @"RAP_SELECT_LINE";
          break;
        case 10139:
          int v4 = @"RAP_SELECT_ACCESS_POINT";
          break;
        case 10140:
          int v4 = @"RAP_SELECT_SEARCH";
          break;
        case 10141:
          int v4 = @"RAP_PAN_MAP";
          break;
        case 10142:
          int v4 = @"RAP_CENTER_MAP_ON_USER";
          break;
        case 10143:
          int v4 = @"RAP_SEARCH_UNEXPECTED";
          break;
        case 10144:
          int v4 = @"RAP_ADD_POI";
          break;
        case 10145:
          int v4 = @"RAP_ADD_STREET_ADDRESS";
          break;
        case 10146:
          int v4 = @"RAP_ADD_OTHER";
          break;
        case 10147:
          int v4 = @"RAP_SELECT_CATEGORY";
          break;
        case 10148:
          int v4 = @"RAP_TAKE_PHOTO";
          break;
        case 10149:
          int v4 = @"RAP_RETAKE_PHOTO";
          break;
        case 10150:
          int v4 = @"RAP_PLACE_DETAILS";
          break;
        case 10151:
          int v4 = @"RAP_SATELLITE_IMAGE_OUTDATED";
          break;
        case 10152:
          int v4 = @"RAP_SATELLITE_IMAGE_QUALITY";
          break;
        case 10153:
          int v4 = @"RAP_SELECT_LABEL";
          break;
        case 10154:
          int v4 = @"RAP_SELECT_ROUTE";
          break;
        case 10155:
          int v4 = @"RAP_CLAIM_BUSINESS";
          break;
        case 10156:
          int v4 = @"RAP_BRAND_DETAILS";
          break;
        case 10157:
          int v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
          break;
        case 10158:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STREET";
          break;
        case 10159:
          int v4 = @"RAP_LOOK_AROUND_BLURRING";
          break;
        case 10160:
          int v4 = @"RAP_LOOK_AROUND_REMOVE_HOME";
          break;
        case 10161:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STORE";
          break;
        case 10162:
          int v4 = @"RAP_LOOK_AROUND_PRIVACY";
          break;
        case 10163:
          int v4 = @"RAP_INCORRECT_HOURS";
          break;
        case 10164:
          int v4 = @"RAP_INCORRECT_ADDRESS";
          break;
        case 10165:
          int v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 10166:
          int v4 = @"RAP_EDIT_PLACE_NAME";
          break;
        case 10167:
          int v4 = @"RAP_EDIT_ADDRESS";
          break;
        case 10168:
          int v4 = @"RAP_ADD_CATEGORY";
          break;
        case 10169:
          int v4 = @"RAP_REMOVE_CATEGORY";
          break;
        case 10170:
          int v4 = @"RAP_DESELECT_CATEGORY";
          break;
        case 10171:
          int v4 = @"RAP_ADD_HOURS";
          break;
        case 10172:
          int v4 = @"RAP_REMOVE_HOURS";
          break;
        case 10173:
          int v4 = @"RAP_TAP_DAY_OF_WEEK";
          break;
        case 10174:
          int v4 = @"RAP_TAP_24_HOURS_BUTTON";
          break;
        case 10175:
          int v4 = @"RAP_TAP_OPEN_TIME";
          break;
        case 10176:
          int v4 = @"RAP_TAP_CLOSED_TIME";
          break;
        case 10177:
          int v4 = @"RAP_TAP_TEMPORARY_CLOSURE";
          break;
        case 10178:
          int v4 = @"RAP_TAP_PERMANENTLY_CLOSED";
          break;
        case 10179:
          int v4 = @"RAP_EDIT_WEBSITE";
          break;
        case 10180:
          int v4 = @"RAP_EDIT_PHONE_NUMBER";
          break;
        case 10181:
          int v4 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
          break;
        case 10182:
          int v4 = @"RAP_ADD_COMMENTS";
          break;
        case 10183:
          int v4 = @"RAP_EDIT_LOCATION";
          break;
        case 10184:
          int v4 = @"RAP_VIEW_LOCATION";
          break;
        case 10185:
          int v4 = @"RAP_ZOOM_IN";
          break;
        case 10186:
          int v4 = @"RAP_ZOOM_OUT";
          break;
        case 10187:
          int v4 = @"RAP_VIEW_ENTRY_POINTS";
          break;
        case 10188:
          int v4 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
          break;
        case 10189:
          int v4 = @"RAP_ADD_NEW_ENTRY_POINT";
          break;
        case 10190:
          int v4 = @"RAP_REMOVE_ENTRY_POINT";
          break;
        case 10191:
          int v4 = @"RAP_SELECT_ENTRY_POINT_TYPE";
          break;
        default:
          switch(a3)
          {
            case 11001:
              int v4 = @"EXIT_MAPS_LOWER_WRIST";
              break;
            case 11002:
              int v4 = @"TASK_READY";
              break;
            case 11003:
              int v4 = @"TAP_SEARCH";
              break;
            case 11004:
              int v4 = @"TAP_MY_LOCATION";
              break;
            case 11005:
              int v4 = @"SHOW_NEARBY";
              break;
            case 11006:
              int v4 = @"TAP_NEARBY";
              break;
            case 11007:
              int v4 = @"TAP_PROACTIVE";
              break;
            case 11008:
              int v4 = @"FORCE_PRESS";
              break;
            case 11009:
              int v4 = @"TAP_CONTACTS";
              break;
            case 11010:
              int v4 = @"TAP_TRANSIT";
              break;
            case 11011:
              int v4 = @"TAP_DICTATION";
              break;
            case 11012:
              int v4 = @"GET_DIRECTIONS_DRIVING";
              break;
            case 11013:
              int v4 = @"GET_DIRECTIONS_WALKING";
              break;
            case 11014:
              int v4 = @"GET_DIRECTIONS_TRANSIT";
              break;
            case 11015:
              int v4 = @"OPEN_STANDARD_MAP";
              break;
            case 11016:
              int v4 = @"OPEN_TRANSIT_MAP";
              break;
            case 11017:
              int v4 = @"START_NAV_AUTO";
              break;
            case 11018:
              int v4 = @"TAP_RECENT";
              break;
            case 11019:
              int v4 = @"TAP_FAVORITE";
              break;
            case 11020:
              int v4 = @"TAP_SCRIBBLE";
              break;
            case 11021:
              int v4 = @"TAP_VIEW_MAP";
              break;
            case 11022:
              int v4 = @"TAP_VIEW_TBT";
              break;
            case 11023:
              int v4 = @"VIEW_ROUTE_INFO";
              break;
            case 11024:
              int v4 = @"NAV_UNMUTE";
              break;
            case 11025:
              int v4 = @"NAV_MUTE";
              break;
            case 11026:
              int v4 = @"GET_DIRECTIONS_CYCLING";
              break;
            case 11027:
              int v4 = @"TAP_SEARCH_HOME";
              break;
            case 11028:
              int v4 = @"ROUTE_PAUSED_ON_WATCH";
              break;
            case 11029:
              int v4 = @"NEXT_STOP_TAPPED_ON_WATCH";
              break;
            default:
              switch(a3)
              {
                case 12001:
                  int v4 = @"VIEW_MORE_OPTIONS";
                  break;
                case 12002:
                  int v4 = @"SELECT_TIME";
                  break;
                case 12003:
                  int v4 = @"SHOW_NEXT_AVAILABLE";
                  break;
                case 12004:
                  int v4 = @"DECREASE_TABLE_SIZE";
                  break;
                case 12005:
                  int v4 = @"INCREASE_TABLE_SIZE";
                  break;
                case 12006:
                  int v4 = @"EDIT_BOOKING";
                  break;
                case 12007:
                  int v4 = @"EDIT_PHONE";
                  break;
                case 12008:
                  int v4 = @"ADD_SPECIAL_REQUEST";
                  break;
                case 12009:
                  int v4 = @"CHANGE_RESERVATION";
                  break;
                case 12010:
                  int v4 = @"LEARN_MORE";
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
    int v4 = @"UI_ACTION_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_85;
      case 1:
        int v4 = @"PULL_UP";
        break;
      case 2:
        int v4 = @"PULL_DOWN";
        break;
      case 3:
        int v4 = @"TAP";
        break;
      case 4:
        int v4 = @"CLOSE";
        break;
      case 5:
        int v4 = @"SWIPE_PREV";
        break;
      case 6:
        int v4 = @"SWIPE_NEXT";
        break;
      case 7:
        int v4 = @"SCROLL_UP";
        break;
      case 8:
        int v4 = @"SCROLL_DOWN";
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
        int v4 = @"SHOW_MORE";
        break;
      case 11:
        int v4 = @"SHOW_LESS";
        break;
      case 12:
        int v4 = @"SWIPE_LEFT";
        break;
      case 13:
        int v4 = @"SWIPE_RIGHT";
        break;
      case 14:
        int v4 = @"MINIMIZE";
        break;
      case 15:
        int v4 = @"TAP_PREV";
        break;
      case 16:
        int v4 = @"TAP_NEXT";
        break;
      case 17:
        int v4 = @"SUBMIT";
        break;
      case 18:
        int v4 = @"CANCEL";
        break;
      case 19:
        int v4 = @"ENTER_MAPS";
        break;
      case 20:
        int v4 = @"EXIT_MAPS";
        break;
      case 21:
        int v4 = @"REVEAL";
        break;
      case 22:
        int v4 = @"OPEN_NEW_TAB";
        break;
      case 25:
        int v4 = @"BACK";
        break;
      case 26:
        int v4 = @"ACTIVATE";
        break;
      case 27:
        int v4 = @"DEACTIVATE";
        break;
      case 28:
        int v4 = @"AGREE";
        break;
      case 29:
        int v4 = @"DISAGREE";
        break;
      case 30:
        int v4 = @"SKIP_ANSWER";
        break;
      case 31:
        int v4 = @"EXPAND";
        break;
      case 32:
        int v4 = @"COLLAPSE";
        break;
      case 33:
        int v4 = @"ENTER";
        break;
      case 34:
        int v4 = @"EXIT";
        break;
      case 35:
        int v4 = @"SCROLL_UP_INDEX_BAR";
        break;
      case 36:
        int v4 = @"SCROLL_DOWN_INDEX_BAR";
        break;
      case 37:
        int v4 = @"TOGGLE_ON";
        break;
      case 38:
        int v4 = @"TOGGLE_OFF";
        break;
      case 39:
        int v4 = @"LONG_PRESS";
        break;
      case 40:
        int v4 = @"CLICK";
        break;
      case 41:
        int v4 = @"TAP_DONE";
        break;
      case 42:
        int v4 = @"TAP_CLOSE";
        break;
      case 43:
        int v4 = @"SCROLL_LEFT";
        break;
      case 44:
        int v4 = @"SCROLL_RIGHT";
        break;
      case 45:
        int v4 = @"DISPLAY";
        break;
      case 46:
        int v4 = @"OPEN_IN_APP";
        break;
      case 47:
        int v4 = @"CONCEAL";
        break;
      case 48:
        int v4 = @"TAP_DELETE";
        break;
      case 49:
        int v4 = @"TAP_FILTER";
        break;
      case 50:
        int v4 = @"TAP_SECONDARY_BUTTON";
        break;
      case 51:
        int v4 = @"TAP_WIDGET_FOOD";
        break;
      case 52:
        int v4 = @"TAP_WIDGET_GAS";
        break;
      case 53:
        int v4 = @"TAP_WIDGET_LOADING";
        break;
      case 54:
        int v4 = @"TAP_WIDGET_SEARCH";
        break;
      case 55:
        int v4 = @"TAP_WIDGET_STORES";
        break;
      case 56:
        int v4 = @"DISPLAY_ALLOW_ONCE_PROMPT";
        break;
      case 57:
        int v4 = @"SHARE_CURRENT_LOCATION";
        break;
      case 58:
        int v4 = @"SHARE_PHOTO";
        break;
      case 59:
        int v4 = @"TAP_KEEP_OFF";
        break;
      case 60:
        int v4 = @"TAP_PHOTO_CATEGORY";
        break;
      case 61:
        int v4 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
        break;
      case 62:
        int v4 = @"TAP_TURN_ON";
        break;
      case 63:
        int v4 = @"DISPLAY_CYCLING_ANNOTATION";
        break;
      case 64:
        int v4 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
        break;
      case 65:
        int v4 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
        break;
      case 66:
        int v4 = @"DISPLAY_WALKING_DEFAULT_OPTION";
        break;
      case 67:
        int v4 = @"TAP_CYCLING_ANNOTATION";
        break;
      case 68:
        int v4 = @"TAP_DRIVING_DEFAULT_OPTION";
        break;
      case 69:
        int v4 = @"TAP_TRANSIT_DEFAULT_OPTION";
        break;
      case 70:
        int v4 = @"TAP_WALKING_DEFAULT_OPTION";
        break;
      case 71:
        int v4 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
        break;
      case 72:
        int v4 = @"TAP_RIDESHARE_DEFAULT_OPTION";
        break;
      case 73:
        int v4 = @"TAP_PERSONAL_COLLECTION";
        break;
      case 74:
        int v4 = @"RESUME_ROUTE";
        break;
      case 75:
        int v4 = @"DISPLAY_OUT_OF_RANGE_ALERT";
        break;
      case 76:
        int v4 = @"TAP_ALLOW_ONCE";
        break;
      case 77:
        int v4 = @"TAP_DO_NOT_ALLOW";
        break;
      case 78:
        int v4 = @"ADD_RECCOMENDED_FAVORITE";
        break;
      case 79:
        int v4 = @"ADD_RECOMMENDED_HOME_FAVORITE";
        break;
      case 80:
        int v4 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 81:
        int v4 = @"ADD_RECOMMENDED_WORK_FAVORITE";
        break;
      case 82:
        int v4 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
        break;
      case 83:
        int v4 = @"CREATE_SCHOOL_FAVORITE";
        break;
      case 84:
        int v4 = @"TAP_SCHOOL_FAVORITE";
        break;
      case 85:
        int v4 = @"SELECT_ROUTING_TYPE_CYCLING";
        break;
      case 86:
        int v4 = @"REPORT_PHOTO";
        break;
      case 87:
        int v4 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
        break;
      case 88:
        int v4 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
        break;
      case 89:
        int v4 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
        break;
      case 90:
        int v4 = @"CREATE_RECOMMENDED_FAVORITE";
        break;
      case 91:
        int v4 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
        break;
      case 92:
        int v4 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
        break;
      case 93:
        int v4 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
        break;
      case 94:
        int v4 = @"TAP_SMALL_WIDGET_ITEM";
        break;
      case 95:
        int v4 = @"TAP_MEDIUM_WIDGET_ITEM";
        break;
      case 96:
        int v4 = @"TAP_LARGE_WIDGET_ITEM";
        break;
      case 97:
        int v4 = @"DISPLAY_ARP_TIPKIT";
        break;
      case 98:
        int v4 = @"NEXT";
        break;
      case 99:
        int v4 = @"TAP_RATE_AND_ADD_PHOTOS";
        break;
      case 100:
        int v4 = @"TAP_TO_ADD_POSITIVE_RATING";
        break;
      case 101:
        int v4 = @"TAP_TO_ADD_NEGATIVE_RATING";
        break;
      case 102:
        int v4 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
        break;
      case 103:
        int v4 = @"INVOKE_SIRI_PROMPT";
        break;
      case 104:
        int v4 = @"ETA_SHARED_SUCCESSFULLY";
        break;
      case 105:
        int v4 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
        break;
      case 106:
        int v4 = @"CLEAR_INCIDENT";
        break;
      case 107:
        int v4 = @"CONFIRM_INCIDENT";
        break;
      case 108:
        int v4 = @"DISMISS_INCIDENT";
        break;
      case 109:
        int v4 = @"INCIDENT_ALERT_TIMEOUT";
        break;
      case 110:
        int v4 = @"INCIDENT_ALERT_TRAY_SHOWN";
        break;
      case 111:
        int v4 = @"INCIDENT_CARD_SHOWN";
        break;
      case 112:
        int v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
        break;
      case 113:
        int v4 = @"INCIDENT_REPORT_TRAY_SHOWN";
        break;
      case 114:
        int v4 = @"NAV_TRAY_DISCOVERY_SHOWN";
        break;
      case 115:
        int v4 = @"TAP_TO_REPORT_INCIDENT";
        break;
      case 116:
        int v4 = @"TAP_SHORTCUT";
        break;
      case 117:
        int v4 = @"BLOCK_CONTACT";
        break;
      case 118:
        int v4 = @"TAP_TO_ADD_RATING";
        break;
      case 119:
        int v4 = @"AR_WALKING_LOCALIZATION_FAILED";
        break;
      case 120:
        int v4 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
        break;
      case 121:
        int v4 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
        break;
      case 122:
        int v4 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
        break;
      case 123:
        int v4 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
        break;
      case 124:
        int v4 = @"RAISE_TO_ENTER_AR_WALKING";
        break;
      case 125:
        int v4 = @"TAP_DISMISS";
        break;
      case 126:
        int v4 = @"TAP_ENTER_AR_WALKING";
        break;
      case 127:
        int v4 = @"TAP_OK";
        break;
      case 128:
        int v4 = @"TAP_TRY_AGAIN";
        break;
      case 129:
        int v4 = @"TAP_TURN_ON_IN_SETTINGS";
        break;
      case 130:
        int v4 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
        break;
      case 131:
        int v4 = @"VLF_CORRECTION_USER_ABANDON";
        break;
      case 132:
        int v4 = @"AREA_EVENTS_ALERT";
        break;
      case 133:
        int v4 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
        break;
      case 134:
        int v4 = @"ACCEPT_EVENT_REROUTE";
        break;
      case 135:
        int v4 = @"DISPLAY_AREA_EVENTS_ADVISORY";
        break;
      case 136:
        int v4 = @"DISMISS_EVENT_REROUTE";
        break;
      case 137:
        int v4 = @"PUNCH_OUT_EVENTS_LINK";
        break;
      case 138:
        int v4 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
        break;
      case 139:
        int v4 = @"ADJUST_GUIDANCE_SETTINGS";
        break;
      case 140:
        int v4 = @"HIDE_DETAILS";
        break;
      case 141:
        int v4 = @"SELECT_VOICE_GUIDANCE_ON";
        break;
      case 142:
        int v4 = @"SELECT_VOICE_GUIDANCE_OFF";
        break;
      case 143:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
        break;
      case 144:
        int v4 = @"TAP_TEXT_LABEL";
        break;
      case 145:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
        break;
      case 146:
        int v4 = @"TAP_EXIT";
        break;
      case 147:
        int v4 = @"TAP_CITY_MENU";
        break;
      case 148:
        int v4 = @"CHECK_AVOID_TOLLS";
        break;
      case 149:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
        break;
      case 150:
        int v4 = @"TAP_ICLOUD";
        break;
      case 151:
        int v4 = @"CHECK_AVOID_HIGHWAYS";
        break;
      case 152:
        int v4 = @"TAP_FAVORITES";
        break;
      case 153:
        int v4 = @"SELECT_DISTANCE_IN_KM";
        break;
      case 154:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
        break;
      case 155:
        int v4 = @"OPEN_FULL_CARD_FILTER";
        break;
      case 156:
        int v4 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
        break;
      case 157:
        int v4 = @"OPEN_SINGLE_CARD_FILTER";
        break;
      case 158:
        int v4 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 159:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
        break;
      case 160:
        int v4 = @"SESSIONLESS_REVEAL";
        break;
      case 161:
        int v4 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
        break;
      case 162:
        int v4 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
        break;
      case 163:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
        break;
      case 164:
        int v4 = @"ENTER_RAP_REPORT_MENU";
        break;
      case 165:
        int v4 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
        break;
      case 166:
        int v4 = @"TAP_MY_VEHICLES";
        break;
      case 167:
        int v4 = @"SUBMIT_SINGLE_CARD_FILTER";
        break;
      case 168:
        int v4 = @"SUBMIT_FULL_CARD_FILTER";
        break;
      case 169:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
        break;
      case 170:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
        break;
      case 171:
        int v4 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
        break;
      case 172:
        int v4 = @"TAP_ACCOUNT";
        break;
      case 173:
        int v4 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
        break;
      case 174:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
        break;
      case 175:
        int v4 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
        break;
      case 176:
        int v4 = @"RESULT_REFINEMENT_TOGGLE_OFF";
        break;
      case 177:
        int v4 = @"TAP_CITY_CURATED_COLLECTIONS";
        break;
      case 178:
        int v4 = @"TAP_REPORTS";
        break;
      case 179:
        int v4 = @"TAP_RATINGS";
        break;
      case 180:
        int v4 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
        break;
      case 181:
        int v4 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
        break;
      case 182:
        int v4 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
        break;
      case 183:
        int v4 = @"SELECT_DISTANCE_IN_MILES";
        break;
      case 184:
        int v4 = @"TAP_PRIVACY_STATEMENT";
        break;
      case 185:
        int v4 = @"TAP_MAPS_SETTINGS";
        break;
      case 186:
        int v4 = @"CANCEL_FULL_CARD_FILTER";
        break;
      case 187:
        int v4 = @"TAP_LATEST_CURATED_COLLECTION";
        break;
      case 188:
        int v4 = @"TAP_TEMPORAL_CURATED_COLLECTION";
        break;
      case 189:
        int v4 = @"UNCHECK_AVOID_TOLLS";
        break;
      case 190:
        int v4 = @"UNSELECT_SEARCH_REFINEMENT";
        break;
      case 191:
        int v4 = @"TAP_RATING";
        break;
      case 192:
        int v4 = @"TAP_ICLOUD_SIGN_IN";
        break;
      case 193:
        int v4 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
        break;
      case 194:
        int v4 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
        break;
      case 195:
        int v4 = @"UNCHECK_AVOID_HIGHWAYS";
        break;
      case 196:
        int v4 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
        break;
      case 197:
        int v4 = @"RESULT_REFINEMENT_TOGGLE_ON";
        break;
      case 198:
        int v4 = @"TAP_CONTEXT_LINE_HYPERLINK";
        break;
      case 199:
        int v4 = @"TAP_MY_GUIDES";
        break;
      case 200:
        int v4 = @"SELECT_SEARCH_REFINEMENT";
        break;
      case 201:
        int v4 = @"SESSIONLESS_TAP_ACCOUNT";
        break;
      case 202:
        int v4 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
        break;
      case 203:
        int v4 = @"TAP_TRAVEL_PREFERENCES";
        break;
      case 204:
        int v4 = @"SHOW_CURATED_COLLECTION_LIST";
        break;
      case 205:
        int v4 = @"CANCEL_SINGLE_CARD_FILTER";
        break;
      case 206:
        int v4 = @"DISPLAY_HFP_OPTION";
        break;
      case 207:
        int v4 = @"SWITCH_OFF_HFP";
        break;
      case 208:
        int v4 = @"SWITCH_ON_HFP";
        break;
      case 209:
        int v4 = @"TAP_QUICK_ACTION_TRAY";
        break;
      case 210:
        int v4 = @"SHOW_ALL_CITIES";
        break;
      case 211:
        int v4 = @"TAP_ADD_NEARBY_TRANSIT";
        break;
      case 212:
        int v4 = @"RESUME";
        break;
      case 213:
        int v4 = @"DISPLAY_TIPKIT_PROMPT";
        break;
      case 214:
        int v4 = @"TAP_NEARBY_TRANSIT_FAVORITE";
        break;
      case 215:
        int v4 = @"TAP_DRIVING_MODE";
        break;
      case 216:
        int v4 = @"SWITCH_ON_VOICE_GUIDANCE";
        break;
      case 217:
        int v4 = @"DISMISS_TIPKIT_PROMPT";
        break;
      case 218:
        int v4 = @"TAP_EXPAND_EXIT_DETAILS";
        break;
      case 219:
        int v4 = @"TAP_NEARBY_TRANSIT_FILTER";
        break;
      case 220:
        int v4 = @"TAP_MORE_DEPARTURES";
        break;
      case 221:
        int v4 = @"RAP_INDIVIDUAL_PLACE";
        break;
      case 222:
        int v4 = @"RAP_ADD_MAP";
        break;
      case 223:
        int v4 = @"TAP_SUGGESTED_RAP";
        break;
      case 224:
        int v4 = @"RAP_STREET_ISSUE";
        break;
      case 225:
        int v4 = @"SWIPE_PIN_REVEAL";
        break;
      case 226:
        int v4 = @"TAP_ADD_TIPKIT_FAVORITE";
        break;
      case 227:
        int v4 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
        break;
      case 228:
        int v4 = @"RAP_BAD_TRIP";
        break;
      case 229:
        int v4 = @"RAP_PLACE_ISSUE";
        break;
      case 230:
        int v4 = @"TAP_OPEN_MAPS";
        break;
      case 231:
        int v4 = @"TAP_NEARBY_TRANSIT_RESULT";
        break;
      case 232:
        int v4 = @"RAP_GUIDE";
        break;
      case 233:
        int v4 = @"SWITCH_OFF_VOICE_GUIDANCE";
        break;
      case 234:
        int v4 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
        break;
      case 235:
        int v4 = @"SELECT_TRANSIT_STEP";
        break;
      case 236:
        int v4 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
        break;
      case 237:
        int v4 = @"TAP_SEE_MORE";
        break;
      case 238:
        int v4 = @"RAP_IN_REVIEW";
        break;
      case 239:
        int v4 = @"TAP_OPEN_MENU";
        break;
      case 240:
        int v4 = @"TAP_NEARBY_TRANSIT";
        break;
      case 241:
        int v4 = @"TAP_PIN_LINE";
        break;
      case 242:
        int v4 = @"SWITCH_OFF_TRIP_FEEDBACK";
        break;
      case 243:
        int v4 = @"RAP_GOOD_TRIP";
        break;
      case 244:
        int v4 = @"TAP_FILTERED_CURATED_COLLECTION";
        break;
      case 245:
        int v4 = @"SHARE_MY_LOCATION";
        break;
      case 246:
        int v4 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
        break;
      case 247:
        int v4 = @"DISPLAY_GENERIC_ADVISORY";
        break;
      case 248:
        int v4 = @"ADVISORY_ALERT";
        break;
      case 249:
        int v4 = @"PUNCH_OUT_LINK";
        break;
      case 250:
        int v4 = @"TAP_GENERIC_ADVISORY";
        break;
      case 251:
        int v4 = @"TAP_EXPLORE_MODE";
        break;
      case 252:
        int v4 = @"TAP_UNPIN_LINE";
        break;
      case 253:
        int v4 = @"MENU_UNPIN";
        break;
      case 254:
        int v4 = @"MENU_PIN";
        break;
      case 255:
        int v4 = @"SWIPE_PIN";
        break;
      case 256:
        int v4 = @"SWIPE_UNPIN";
        break;
      case 257:
        int v4 = @"TAP_MEDIA_APP";
        break;
      case 258:
        int v4 = @"TAP_GUIDES_SUBACTION";
        break;
      case 259:
        int v4 = @"TAP_MEDIA";
        break;
      case 260:
        int v4 = @"PUNCH_OUT_MEDIA";
        break;
      case 261:
        int v4 = @"SHOW_MEDIA_APP_MENU";
        break;
      case 262:
        int v4 = @"SCROLL_RIGHT_RIBBON";
        break;
      case 263:
        int v4 = @"SCROLL_LEFT_RIBBON";
        break;
      case 264:
        int v4 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
        break;
      case 265:
        int v4 = @"TAP_SHOW_MORE_TEXT";
        break;
      case 266:
        int v4 = @"SCROLL_LEFT_RATINGS";
        break;
      case 267:
        int v4 = @"SCROLL_LEFT_TEMPLATE_PLACE";
        break;
      case 268:
        int v4 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
        break;
      case 269:
        int v4 = @"SCROLL_RIGHT_RATINGS";
        break;
      case 270:
        int v4 = @"TAP_ALLOW";
        break;
      case 271:
        int v4 = @"TAP_GO_TO_SETTING";
        break;
      case 272:
        int v4 = @"START_SUBMIT_REPORT";
        break;
      case 273:
        int v4 = @"AUTHENTICATION_INFO_FAILURE";
        break;
      case 274:
        int v4 = @"SUCCESSFULLY_SUBMIT_REPORT";
        break;
      case 275:
        int v4 = @"FAILED_SUBMIT_REPORT";
        break;
      case 276:
        int v4 = @"AUTHENTICATION_INFO_SUCCESS";
        break;
      case 277:
        int v4 = @"EDIT_WAYPOINT";
        break;
      case 278:
        int v4 = @"CLEAR_TEXT";
        break;
      case 279:
        int v4 = @"REORDER_WAYPOINT";
        break;
      case 280:
        int v4 = @"REMOVE_WAYPOINT";
        break;
      case 281:
        int v4 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
        break;
      case 282:
        int v4 = @"TAP_SHOWCASE_MENU";
        break;
      case 283:
        int v4 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
        break;
      case 284:
        int v4 = @"TAP_PHOTO_ALBUM";
        break;
      case 285:
        int v4 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 286:
        int v4 = @"RAP_INLINE_ADD";
        break;
      case 287:
        int v4 = @"RAP_TAP_EDIT";
        break;
      case 288:
        int v4 = @"CLAIM_BUSINESS";
        break;
      case 289:
        int v4 = @"RAP_EDIT_OPTIONS";
        break;
      case 290:
        int v4 = @"TAP_IN_REVIEW_RAP";
        break;
      case 291:
        int v4 = @"ORB_MENU_ADD_STOP";
        break;
      case 292:
        int v4 = @"NEXT_STOP";
        break;
      case 293:
        int v4 = @"ARRIVE_AT_WAYPOINT";
        break;
      case 294:
        int v4 = @"REMOVE_STOP";
        break;
      case 295:
        int v4 = @"DISPLAY_PAUSE_BUTTON";
        break;
      case 296:
        int v4 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
        break;
      case 297:
        int v4 = @"AUTO_ADVANCE_NEXT_STOP";
        break;
      case 298:
        int v4 = @"ADD_INLINE_NEGATIVE_RATING";
        break;
      case 299:
        int v4 = @"ADD_INLINE_POSITIVE_RATING";
        break;
      case 300:
        int v4 = @"TAP_TO_ADD_RATING_AND_PHOTO";
        break;
      case 301:
        int v4 = @"SUBMIT_RATINGS_AND_PHOTOS";
        break;
      case 302:
        int v4 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
        break;
      case 303:
        int v4 = @"TAP_RECENTLY_VIEWED_ROUTE";
        break;
      case 304:
        int v4 = @"SHOW_ALL_RECENTS";
        break;
      case 305:
        int v4 = @"RESUME_MULTIPOINT_ROUTE";
        break;
      case 306:
        int v4 = @"DISMISS_TRANSIT_TIPKIT";
        break;
      case 307:
        int v4 = @"DISPLAY_TRANSIT_TIPKIT";
        break;
      case 308:
        int v4 = @"TAP_TRANSIT_TIPKIT";
        break;
      case 309:
        int v4 = @"FILTER_EV";
        break;
      case 310:
        int v4 = @"FILTER_SURCHARGE";
        break;
      case 311:
        int v4 = @"FILTER_PREFER";
        break;
      case 312:
        int v4 = @"TAP_WALKING_ANNOTATION";
        break;
      case 313:
        int v4 = @"FILTER_AVOID";
        break;
      case 314:
        int v4 = @"FILTER_TRANSPORTATION_MODE";
        break;
      case 315:
        int v4 = @"FILTER_RECOMMENDED_ROUTES";
        break;
      case 316:
        int v4 = @"FILTER_IC_FARES";
        break;
      case 317:
        int v4 = @"FILTER_TRANSIT_CARD_FARES";
        break;
      case 318:
        int v4 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
        break;
      case 319:
        int v4 = @"TAP_NOTIFICATION_SETTINGS";
        break;
      case 320:
        int v4 = @"TAP_ENABLE_NOTIFICATION";
        break;
      case 321:
        int v4 = @"ARP_SUGGESTIONS_TURN_OFF";
        break;
      case 322:
        int v4 = @"ARP_SUGGESTIONS_TURN_ON";
        break;
      case 323:
        int v4 = @"DISMISS_ARP_SUGGESTION";
        break;
      case 324:
        int v4 = @"RATINGS_AND_PHOTOS_TURN_ON";
        break;
      case 325:
        int v4 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
        break;
      case 326:
        int v4 = @"UNSELECT_SUGGESTED_PHOTOS";
        break;
      case 327:
        int v4 = @"SUGGESTED_PHOTOS_SHOWN";
        break;
      case 328:
        int v4 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 329:
        int v4 = @"TAP_YOUR_PHOTOS_ALBUM";
        break;
      case 330:
        int v4 = @"RATINGS_AND_PHOTOS_TURN_OFF";
        break;
      case 331:
        int v4 = @"DELETE_PHOTO";
        break;
      case 332:
        int v4 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 333:
        int v4 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
        break;
      case 334:
        int v4 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
        break;
      case 335:
        int v4 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
        break;
      case 336:
        int v4 = @"SELECT_SUGGESTED_PHOTOS";
        break;
      case 337:
        int v4 = @"ADD_STOP";
        break;
      case 338:
        int v4 = @"SHOW_CREDIT_TURN_ON";
        break;
      case 339:
        int v4 = @"DISPLAY_ARP_SUGGESTION";
        break;
      case 340:
        int v4 = @"TAP_TO_ADD_PHOTO_CREDIT";
        break;
      case 341:
        int v4 = @"SHOW_CREDIT_TURN_OFF";
        break;
      case 342:
        int v4 = @"TAP_TO_EDIT_NICKNAME";
        break;
      case 343:
        int v4 = @"SUBMIT_RATINGS";
        break;
      case 344:
        int v4 = @"END_NAV_ON_WATCH";
        break;
      case 345:
        int v4 = @"FILTER_EBIKE";
        break;
      case 356:
        int v4 = @"ADD_STOP_SIRI";
        break;
      case 357:
        int v4 = @"TAP_REVIEWED_RAP";
        break;
      case 358:
        int v4 = @"TAP_OUTREACH_RAP";
        break;
      case 359:
        int v4 = @"DISPLAY_SUGGESTED_ITEM";
        break;
      case 360:
        int v4 = @"DISPLAY_HIKING_TIPKIT";
        break;
      case 361:
        int v4 = @"DISMISS_HIKING_TIPKIT";
        break;
      case 362:
        int v4 = @"TAP_HIKING_TIPKIT";
        break;
      case 363:
        int v4 = @"SCROLL_LEFT_TRAILS";
        break;
      case 364:
        int v4 = @"TAP_MORE_TRAILS";
        break;
      case 365:
        int v4 = @"TAP_RELATED_TRAIL";
        break;
      case 366:
        int v4 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
        break;
      case 367:
        int v4 = @"SCROLL_RIGHT_TRAILS";
        break;
      case 368:
        int v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 369:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
        break;
      case 370:
        int v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 371:
        int v4 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 372:
        int v4 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
        break;
      case 373:
        int v4 = @"EXPIRED_MAPS_REMOVED";
        break;
      case 374:
        int v4 = @"UPDATE_ALL_DOWNLOAD_MAPS";
        break;
      case 375:
        int v4 = @"TAP_EXPIRED_MAPS";
        break;
      case 376:
        int v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 377:
        int v4 = @"MOVE_DOWNLOAD_MAPS";
        break;
      case 378:
        int v4 = @"SAVE_RENAME_DOWNLOAD_MAPS";
        break;
      case 379:
        int v4 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
        break;
      case 380:
        int v4 = @"TAP_ENTER_OFFLINE_MAPS";
        break;
      case 381:
        int v4 = @"TAP_DOWNLOAD_MAPS";
        break;
      case 382:
        int v4 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
        break;
      case 383:
        int v4 = @"DELETE_DOWNLOAD_MAPS";
        break;
      case 384:
        int v4 = @"SLIDE_CLEAR_EXPIRED_MAPS";
        break;
      case 385:
        int v4 = @"RENAME_DOWNLOAD_MAPS";
        break;
      case 386:
        int v4 = @"RESIZE_DOWNLOAD_MAPS";
        break;
      case 387:
        int v4 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
        break;
      case 388:
        int v4 = @"RESTORE_EXPIRED_MAPS";
        break;
      case 389:
        int v4 = @"CLEAR_EXPIRED_MAPS";
        break;
      case 390:
        int v4 = @"TAP_USING_OFFLINE_BAR";
        break;
      case 391:
        int v4 = @"UPDATE_DOWNLOAD_MAPS";
        break;
      case 392:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
        break;
      case 393:
        int v4 = @"DISPLAY_DOWNLOAD_MAPS";
        break;
      case 394:
        int v4 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
        break;
      case 395:
        int v4 = @"DISPLAY_EXPIRED_MAPS";
        break;
      case 396:
        int v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
        break;
      case 397:
        int v4 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
        break;
      case 398:
        int v4 = @"SLIDE_RESTORE_EXPIRED_MAPS";
        break;
      case 399:
        int v4 = @"ETA_SHARE_TRAY_TIMEOUT";
        break;
      case 400:
        int v4 = @"START_ETA_SHARING";
        break;
      case 401:
        int v4 = @"PERSON_LOCATION_UPDATE";
        break;
      case 402:
        int v4 = @"STOP_ETA_SHARING";
        break;
      case 403:
        int v4 = @"PUNCH_OUT_TO_FINDMY";
        break;
      case 404:
        int v4 = @"TAP_PEOPLE_LOCATION";
        break;
      case 405:
        int v4 = @"TAP_TO_REQUEST_LOCATION";
        break;
      case 406:
        int v4 = @"ZOOM_OUT_CROWN";
        break;
      case 407:
        int v4 = @"TAP_RESIZE_DOWNLOAD_MAPS";
        break;
      case 408:
        int v4 = @"TAP_DELETE_DOWNLOAD_MAPS";
        break;
      case 409:
        int v4 = @"SELECT_LIST_VIEW";
        break;
      case 410:
        int v4 = @"SCROLL_RIGHT_TRAILHEADS";
        break;
      case 411:
        int v4 = @"SWITCH_TO_ONLINE_MODE";
        break;
      case 412:
        int v4 = @"TAP_RELATED_TRAILHEAD";
        break;
      case 413:
        int v4 = @"SELECT_ELEVATION_VIEW";
        break;
      case 414:
        int v4 = @"TOGGLE_PROXIMITY_RADIUS_ON";
        break;
      case 415:
        int v4 = @"SEE_MORE_RECENTS";
        break;
      case 416:
        int v4 = @"SEE_MORE_GUIDES";
        break;
      case 417:
        int v4 = @"SELECT_CONTROLS";
        break;
      case 418:
        int v4 = @"NO_SEARCH_RESULTS";
        break;
      case 419:
        int v4 = @"TAP_VIEW_RESULTS_CAROUSEL";
        break;
      case 420:
        int v4 = @"TAP_VIEW_RESULTS_LIST";
        break;
      case 421:
        int v4 = @"SELECT_MAP_VIEW";
        break;
      case 422:
        int v4 = @"SCROLL_LEFT_TRAILHEADS";
        break;
      case 423:
        int v4 = @"SWITCH_TO_OFFLINE_MODE";
        break;
      case 424:
        int v4 = @"ZOOM_IN_CROWN";
        break;
      case 425:
        int v4 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
        break;
      case 426:
        int v4 = @"TAP_MAP";
        break;
      case 427:
        int v4 = @"SWIPE_DOWN";
        break;
      case 428:
        int v4 = @"TAP_MORE_TRAILHEADS";
        break;
      case 429:
        int v4 = @"TAP_ROUTE_OPTIONS";
        break;
      case 430:
        int v4 = @"TAP_ROUTE_NAV_MAP";
        break;
      case 431:
        int v4 = @"TAP_ROUTE_OVERVIEW_MAP";
        break;
      case 432:
        int v4 = @"TAP_AUDIO";
        break;
      case 433:
        int v4 = @"TAP_OPEN_PLACECARD";
        break;
      case 434:
        int v4 = @"TAP_VIEW_STOPS";
        break;
      case 435:
        int v4 = @"TAP_ROUTE_DETAILS";
        break;
      case 436:
        int v4 = @"ADD_LPR_VEHICLE";
        break;
      case 437:
        int v4 = @"TAP_ADD_VEHICLE";
        break;
      case 438:
        int v4 = @"TAP_PLUG_TYPE";
        break;
      case 439:
        int v4 = @"UNSELECT_SUGGESTED_NETWORK";
        break;
      case 440:
        int v4 = @"TAP_SET_UP_LATER";
        break;
      case 441:
        int v4 = @"ADD_EV_VEHICLE";
        break;
      case 442:
        int v4 = @"UPDATE_COLOR";
        break;
      case 443:
        int v4 = @"SELECT_OTHER_NETWORK";
        break;
      case 444:
        int v4 = @"UNSELECT_NETWORK";
        break;
      case 445:
        int v4 = @"TAP_BACK";
        break;
      case 446:
        int v4 = @"TAP_CANCEL";
        break;
      case 447:
        int v4 = @"UNSELECT_VEHICLE";
        break;
      case 448:
        int v4 = @"UNSELECT_OTHER_NETWORK";
        break;
      case 449:
        int v4 = @"DISPLAY_EV_TIPKIT";
        break;
      case 450:
        int v4 = @"SELECT_NETWORK";
        break;
      case 451:
        int v4 = @"TAP_EV_TIPKIT";
        break;
      case 452:
        int v4 = @"TAP_CHOOSE_NETWORKS";
        break;
      case 453:
        int v4 = @"TAP_ADD_NETWORK";
        break;
      case 454:
        int v4 = @"FILTER_NETWORK";
        break;
      case 455:
        int v4 = @"SELECT_SUGGESTED_NETWORK";
        break;
      case 456:
        int v4 = @"TRANSIT_TO_WALKING";
        break;
      case 457:
        int v4 = @"TRANSIT_TO_FINDMY";
        break;
      case 458:
        int v4 = @"TAP_AC_KEYBOARD";
        break;
      case 459:
        int v4 = @"REACH_PHOTO_STRIP_END";
        break;
      case 460:
        int v4 = @"SEARCH_HERE_REVEAL";
        break;
      case 461:
        int v4 = @"TAP_SEARCH_HERE";
        break;
      case 462:
        int v4 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
        break;
      case 463:
        int v4 = @"SAVE";
        break;
      case 464:
        int v4 = @"TAP_MORE_CURATED_HIKES";
        break;
      case 465:
        int v4 = @"CREATE_CUSTOM_ROUTE";
        break;
      case 466:
        int v4 = @"TAP_TRY_NOW";
        break;
      case 467:
        int v4 = @"TAP_CURATED_HIKE";
        break;
      case 468:
        int v4 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
        break;
      case 469:
        int v4 = @"ADD_TO_LIBRARY";
        break;
      case 470:
        int v4 = @"START_HIKING";
        break;
      case 471:
        int v4 = @"EDIT_NOTE";
        break;
      case 472:
        int v4 = @"CREATE_NOTE";
        break;
      case 473:
        int v4 = @"DELETE_PIN";
        break;
      case 474:
        int v4 = @"ADD_ROUTE";
        break;
      case 475:
        int v4 = @"ADD_PIN";
        break;
      case 476:
        int v4 = @"REMOVE_FROM_COLLECTION";
        break;
      case 477:
        int v4 = @"REMOVE_FROM_LIBRARY";
        break;
      case 478:
        int v4 = @"TAP_ITEM";
        break;
      case 479:
        int v4 = @"DELETE_ROUTE";
        break;
      case 480:
        int v4 = @"TAP_ROUTE";
        break;
      case 481:
        int v4 = @"TAP_DOWNLOAD_WATCH_MAPS";
        break;
      case 482:
        int v4 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 483:
        int v4 = @"STOP_DOWNLOAD_ONTO_WATCH";
        break;
      case 484:
        int v4 = @"TAP_DOWNLOAD_ONTO_WATCH";
        break;
      case 485:
        int v4 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
        break;
      case 486:
        int v4 = @"TAP_DOWNLOAD_NOW_WATCH";
        break;
      case 487:
        int v4 = @"REVEAL_DETECTION_LIST";
        break;
      case 488:
        int v4 = @"TAP_RECOMMENDATION";
        break;
      case 489:
        int v4 = @"TAP_EXPAND";
        break;
      case 490:
        int v4 = @"EXPAND_DETECTION_LIST";
        break;
      case 1001:
        int v4 = @"PAN";
        break;
      case 1002:
        int v4 = @"ZOOM_IN";
        break;
      case 1003:
        int v4 = @"ZOOM_OUT";
        break;
      case 1004:
        int v4 = @"ROTATE";
        break;
      case 1010:
        int v4 = @"TAP_POI";
        break;
      case 1011:
        int v4 = @"TAP_POI_TRANSIT";
        break;
      case 1017:
        int v4 = @"TAP_POI_HIGHLIGHTED";
        break;
      case 1018:
        int v4 = @"TAP_POI_CLUSTERED";
        break;
      case 1020:
        int v4 = @"TAP_POI_DROPPED_PIN";
        break;
      case 1030:
        int v4 = @"DROP_PIN";
        break;
      case 1031:
        int v4 = @"TAP_INCIDENT";
        break;
      case 1032:
        int v4 = @"TAP_TRANSIT_LINE";
        break;
      case 1033:
        int v4 = @"TAP_POI_CALENDAR";
        break;
      case 1034:
        int v4 = @"TAP_POI_CURRENT_LOCATION";
        break;
      case 1035:
        int v4 = @"TAP_POI_TRANSIT_LINE";
        break;
      case 1036:
        int v4 = @"TAP_POI_LANDMARK";
        break;
      case 1037:
        int v4 = @"TAP_POI_FLYOVER";
        break;
      case 1038:
        int v4 = @"TAP_TO_HIDE_TRAY";
        break;
      case 1039:
        int v4 = @"TAP_TO_REVEAL_TRAY";
        break;
      case 1040:
        int v4 = @"TAP_COMPASS";
        break;
      case 1041:
        int v4 = @"PITCH_AWAY_FROM_GROUND";
        break;
      case 1042:
        int v4 = @"PITCH_CLOSER_TO_GROUND";
        break;
      case 1043:
        int v4 = @"ZOOM_IN_PINCH";
        break;
      case 1044:
        int v4 = @"ZOOM_OUT_PINCH";
        break;
      case 1045:
        int v4 = @"ZOOM_IN_DOUBLE_TAP";
        break;
      case 1046:
        int v4 = @"ZOOM_OUT_TWO_FINGER_TAP";
        break;
      case 1047:
        int v4 = @"ZOOM_IN_ONE_FINGER";
        break;
      case 1048:
        int v4 = @"ZOOM_OUT_ONE_FINGER";
        break;
      case 1049:
        int v4 = @"ZOOM_IN_BUTTON";
        break;
      case 1050:
        int v4 = @"ZOOM_OUT_BUTTON";
        break;
      case 1051:
        int v4 = @"TAP_TRAFFIC_CAMERA";
        break;
      case 1052:
        int v4 = @"DISPLAY_INDOOR_MAP_BUTTON";
        break;
      case 1053:
        int v4 = @"OPEN_INDOOR_MAP";
        break;
      case 1054:
        int v4 = @"DISPLAY_VENUE_BROWSE_BUTTON";
        break;
      case 1055:
        int v4 = @"TAP_VENUE_BROWSE_BUTTON";
        break;
      case 1056:
        int v4 = @"ENTER_VENUE_EXPERIENCE";
        break;
      case 1057:
        int v4 = @"EXIT_VENUE_EXPERIENCE";
        break;
      case 1058:
        int v4 = @"ZOOM_IN_SCENE_PINCH";
        break;
      case 1059:
        int v4 = @"ZOOM_OUT_SCENE_PINCH";
        break;
      case 1060:
        int v4 = @"ZOOM_RESET";
        break;
      case 1061:
        int v4 = @"TAP_SCENE_UNAVAILABLE_AREA";
        break;
      case 1062:
        int v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 1063:
        int v4 = @"TAP_SPEED_CAMERA";
        break;
      case 1064:
        int v4 = @"TAP_RED_LIGHT_CAMERA";
        break;
      case 1065:
        int v4 = @"TAP_GEO";
        break;
      default:
        switch(a3)
        {
          case 2001:
            int v4 = @"TAP_SEARCH_FIELD";
            break;
          case 2002:
            int v4 = @"CLEAR_SEARCH";
            break;
          case 2003:
            int v4 = @"CANCEL_SEARCH";
            break;
          case 2004:
            int v4 = @"TAP_BROWSE_TOP_CATEGORY";
            break;
          case 2005:
            int v4 = @"TAP_BROWSE_SUB_CATEGORY";
            break;
          case 2006:
            int v4 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
            break;
          case 2007:
            int v4 = @"TAP_LIST_ITEM";
            break;
          case 2008:
            int v4 = @"SHARE_LIST_ITEM";
            break;
          case 2009:
            int v4 = @"DELETE_LIST_ITEM";
            break;
          case 2010:
            int v4 = @"EDIT_LIST_ITEM";
            break;
          case 2011:
            int v4 = @"REFRESH_SEARCH";
            break;
          case 2012:
            int v4 = @"REVEAL_LIST_ITEM_ACTIONS";
            break;
          case 2013:
            int v4 = @"HIDE_LIST_ITEM_ACTIONS";
            break;
          case 2014:
            int v4 = @"TAP_SEARCH_BUTTON";
            break;
          case 2015:
            int v4 = @"SHOW_SEARCH_RESULTS";
            break;
          case 2016:
            int v4 = @"SHOW_REFRESH_SEARCH";
            break;
          case 2017:
            int v4 = @"PASTE_TEXT";
            break;
          case 2018:
            int v4 = @"TAP_LIST_SUB_ITEM";
            break;
          case 2019:
            int v4 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
            break;
          case 2020:
            int v4 = @"TAP_DID_YOU_MEAN_MESSAGE";
            break;
          case 2021:
            int v4 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
            break;
          case 2022:
            int v4 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2023:
            int v4 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
            break;
          case 2024:
            int v4 = @"RETAINED_QUERY";
            break;
          case 2025:
            int v4 = @"TAP_RECENT_AC_SUGGESTION";
            break;
          case 2026:
            int v4 = @"CLEAR_RECENT_AC_SUGGESTION";
            break;
          case 2027:
            int v4 = @"DELETE_RECENT_AC_SUGGESTION";
            break;
          case 2028:
          case 2029:
            goto LABEL_84;
          case 2030:
            int v4 = @"TAP_BROWSE_NEARBY_CATEGORY";
            break;
          case 2031:
            int v4 = @"TAP_SUBACTION";
            break;
          case 2032:
            int v4 = @"TAP_QUERY_BUILDING_ARROW";
            break;
          case 2033:
            int v4 = @"CLICK_ON_EDIT_SEARCH";
            break;
          case 2034:
            int v4 = @"REMOVE_CLIENT_AC_SUGGESTION";
            break;
          case 2035:
            int v4 = @"SHARE_CLIENT_AC_SUGGESTION";
            break;
          case 2036:
            int v4 = @"TAP_ON_MORE_RESULTS";
            break;
          case 2037:
            int v4 = @"SHARE_ITEM";
            break;
          case 2038:
            int v4 = @"HIDE_ITEM";
            break;
          case 2039:
            int v4 = @"TAP_SUGGESTED_ITEM";
            break;
          case 2040:
            int v4 = @"SHARE_SUGGESTED_ITEM";
            break;
          case 2041:
            int v4 = @"HIDE_SUGGESTED_ITEM";
            break;
          case 2042:
            int v4 = @"ADD_HOME_FAVORITE";
            break;
          case 2043:
            int v4 = @"ADD_WORK_FAVORITE";
            break;
          case 2044:
            int v4 = @"ADD_FAVORITE";
            break;
          case 2045:
            int v4 = @"VIEW_FAVORITES_LIST";
            break;
          case 2046:
            int v4 = @"TAP_HOME_FAVORITE";
            break;
          case 2047:
            int v4 = @"TAP_WORK_FAVORITE";
            break;
          case 2048:
            int v4 = @"TAP_CAR_FAVORITE";
            break;
          case 2049:
            int v4 = @"TAP_FAVORITE_ITEM";
            break;
          case 2050:
            int v4 = @"CREATE_HOME_FAVORITE";
            break;
          case 2051:
            int v4 = @"CREATE_WORK_FAVORITE";
            break;
          case 2052:
            int v4 = @"CREATE_FAVORITE";
            break;
          case 2053:
            int v4 = @"SUBMIT_FAVORITE_EDIT";
            break;
          case 2054:
            int v4 = @"ADD_RECOMMENDED_FAVORITE";
            break;
          case 2055:
            int v4 = @"EDIT_FAVORITE";
            break;
          case 2056:
            int v4 = @"REMOVE_FAVORITE";
            break;
          case 2057:
            int v4 = @"SHARE_FAVORITE";
            break;
          case 2058:
            int v4 = @"EDIT_FAVORITES";
            break;
          case 2059:
            int v4 = @"ADD_FAVORITE_PLACE";
            break;
          case 2060:
            int v4 = @"REMOVE_FAVORITE_PLACE";
            break;
          case 2061:
            int v4 = @"CHANGE_HOME_ADDRESS";
            break;
          case 2062:
            int v4 = @"CHANGE_WORK_ADDRESS";
            break;
          case 2063:
            int v4 = @"REFINE_LOCATION";
            break;
          case 2064:
            int v4 = @"TAP_RECENTLY_VIEWED_ITEM";
            break;
          case 2065:
            int v4 = @"SHOW_COLLECTION_LIST";
            break;
          case 2066:
            int v4 = @"SHOW_FAVORITES_COLLECTION";
            break;
          case 2067:
            int v4 = @"SHOW_COLLECTION";
            break;
          case 2068:
            int v4 = @"TAP_COLLECTION_ITEM";
            break;
          case 2069:
            int v4 = @"SHARE_COLLECTION_ITEM";
            break;
          case 2070:
            int v4 = @"REMOVE_COLLECTION_ITEM";
            break;
          case 2071:
            int v4 = @"SAVE_SHARED_COLLECTION";
            break;
          case 2072:
            int v4 = @"CREATE_NEW_COLLECTION";
            break;
          case 2073:
            int v4 = @"SAVE_TO_COLLECTION";
            break;
          case 2074:
            int v4 = @"EDIT_PHOTO";
            break;
          case 2075:
            int v4 = @"SORT_BY_NAME";
            break;
          case 2076:
            int v4 = @"SORT_BY_DISTANCE";
            break;
          case 2077:
            int v4 = @"SORT_BY_RECENT";
            break;
          case 2078:
            int v4 = @"AUTO_SHARE_ETA";
            break;
          case 2079:
            int v4 = @"CANCEL_AUTO_SHARE_ETA";
            break;
          case 2080:
            int v4 = @"MAP_SEARCH";
            break;
          case 2081:
            int v4 = @"DELETE_COLLECTION";
            break;
          case 2082:
            int v4 = @"SHARE_COLLECTION";
            break;
          case 2083:
            int v4 = @"SHOW_TRANSIT_LINES_COLLECTION";
            break;
          case 2084:
            int v4 = @"SHOW_MY_PLACES";
            break;
          case 2085:
            int v4 = @"SHOW_ALL_PLACES";
            break;
          case 2086:
            int v4 = @"TAP_RECENT_QUERY";
            break;
          case 2087:
            int v4 = @"TAP_QUERY_SUGGESTION";
            break;
          case 2088:
            int v4 = @"DELETE_CURATED_COLLECTION";
            break;
          case 2089:
            int v4 = @"FOLLOW";
            break;
          case 2090:
            int v4 = @"PUNCH_IN";
            break;
          case 2091:
            int v4 = @"SAVE_CURATED_COLLECTION";
            break;
          case 2092:
            int v4 = @"SCROLL_LEFT_COLLECTIONS";
            break;
          case 2093:
            int v4 = @"SCROLL_RIGHT_COLLECTIONS";
            break;
          case 2094:
            int v4 = @"SEE_ALL_CURATED_COLLECTION";
            break;
          case 2095:
            int v4 = @"SEE_ALL_PUBLISHERS";
            break;
          case 2096:
            int v4 = @"SHARE_CURATED_COLLECTION";
            break;
          case 2097:
            int v4 = @"SHARE_PUBLISHER";
            break;
          case 2098:
            int v4 = @"SHOW_MORE_COLLECTION";
            break;
          case 2099:
            int v4 = @"TAP_CURATED_COLLECTION";
            break;
          case 2100:
            int v4 = @"TAP_FEATURED_COLLECTIONS";
            break;
          case 2101:
            int v4 = @"TAP_LOCATION";
            break;
          case 2102:
            int v4 = @"TAP_PUBLISHER";
            break;
          case 2103:
            int v4 = @"TAP_PUBLISHER_APP";
            break;
          case 2104:
            int v4 = @"TAP_PUBLISHER_COLLECTIONS";
            break;
          case 2105:
            int v4 = @"UNFOLLOW";
            break;
          case 2106:
            int v4 = @"CHANGE_SCHOOL_ADDRESS";
            break;
          case 2107:
            int v4 = @"ADD_VEHICLE";
            break;
          case 2108:
            int v4 = @"DISPLAY_VIRTUAL_GARAGE";
            break;
          case 2109:
            int v4 = @"ENTER_VIRTUAL_GARAGE";
            break;
          case 2110:
            int v4 = @"PUNCH_OUT_MANUFACTURER_APP";
            break;
          case 2111:
            int v4 = @"REMOVE_LICENSE_PLATE";
            break;
          case 2112:
            int v4 = @"REMOVE_VEHICLE";
            break;
          case 2113:
            int v4 = @"SELECT_VEHICLE";
            break;
          case 2114:
            int v4 = @"SUBMIT_LICENSE_PLATE";
            break;
          case 2115:
            int v4 = @"TAP_ADD_LICENSE_PLATE";
            break;
          case 2116:
            int v4 = @"TAP_ADD_NEW_CAR";
            break;
          case 2117:
            int v4 = @"TAP_BANNER";
            break;
          case 2118:
            int v4 = @"TAP_CONNECT";
            break;
          case 2119:
            int v4 = @"TAP_CONTINUE";
            break;
          case 2120:
            int v4 = @"TAP_EDIT";
            break;
          case 2121:
            int v4 = @"TAP_NAME";
            break;
          case 2122:
            int v4 = @"TAP_NOT_NOW";
            break;
          case 2123:
            int v4 = @"TAP_OTHER_VEHICLE";
            break;
          case 2124:
            int v4 = @"TAP_REMOVE_LICENSE_PLATE";
            break;
          case 2125:
            int v4 = @"TAP_UPDATE_PLATE_NUMBER";
            break;
          case 2126:
            int v4 = @"TAP_VEHICLE";
            break;
          case 2127:
            int v4 = @"TAP_VEHICLE_NAME";
            break;
          case 2128:
            int v4 = @"UPDATE_NAME";
            break;
          case 2129:
            int v4 = @"DONE_TAKING_PHOTO";
            break;
          case 2130:
            int v4 = @"ENABLE_SHOW_PHOTO_NAME";
            break;
          case 2131:
            int v4 = @"SUBMIT_PHOTO";
            break;
          case 2132:
            int v4 = @"USE_PHOTO";
            break;
          case 2133:
            int v4 = @"ADD_RECOMMENDATION_TO_MAPS";
            break;
          case 2134:
            int v4 = @"CANCEL_PHOTO_SUBMISSION";
            break;
          case 2135:
            int v4 = @"CLOSE_RECOMMENDATION_CARD";
            break;
          case 2136:
            int v4 = @"EDIT_RATING";
            break;
          case 2137:
            int v4 = @"PROMPTED_TO_ADD_PHOTO";
            break;
          case 2138:
            int v4 = @"PROMPTED_TO_ADD_RATING";
            break;
          case 2139:
            int v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
            break;
          case 2140:
            int v4 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
            break;
          case 2141:
            int v4 = @"RETAKE_PHOTO";
            break;
          case 2142:
            int v4 = @"REVEAL_RECOMMENDATION_CARD";
            break;
          case 2143:
            int v4 = @"SUBMIT_NEGATIVE_RATING";
            break;
          case 2144:
            int v4 = @"SUBMIT_POSITIVE_RATING";
            break;
          case 2145:
            int v4 = @"TAP_CHOOSING_PHOTO";
            break;
          case 2146:
            int v4 = @"TAP_TAKE_NEW_PHOTO";
            break;
          case 2147:
            int v4 = @"TAP_TO_ADD_PHOTO";
            break;
          case 2148:
            int v4 = @"CANCEL_INCIDENT_REPORT";
            break;
          case 2149:
            int v4 = @"INCIDENT_REPORT_SUBMITTED";
            break;
          case 2150:
            int v4 = @"REPORTED_INCIDENT_NOT_RECEIVED";
            break;
          case 2151:
            int v4 = @"REPORTED_INCIDENT_RECEIVED";
            break;
          case 2152:
            int v4 = @"REPORT_INCIDENT";
            break;
          case 2153:
            int v4 = @"SELECT_INCIDENT_TYPE";
            break;
          case 2154:
            int v4 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
            break;
          case 2155:
            int v4 = @"TAP_TO_START_REPORT_INCIDENT";
            break;
          case 2156:
            int v4 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2157:
            int v4 = @"ATTEMPT_VLF_CORRECTION";
            break;
          case 2158:
            int v4 = @"DISMISS_VLF_PROMPT";
            break;
          case 2159:
            int v4 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
            break;
          case 2160:
            int v4 = @"VLF_CORRECTION_FAILED";
            break;
          case 2161:
            int v4 = @"VLF_CORRECTION_SUCCESSFUL";
            break;
          case 2162:
            int v4 = @"ENABLE_WIDGET_SUGGESTIONS";
            break;
          case 2163:
            int v4 = @"DISPLAY_CZ_ADVISORY";
            break;
          case 2164:
            int v4 = @"PUNCH_OUT_URL_PAY";
            break;
          case 2165:
            int v4 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
            break;
          case 2166:
            int v4 = @"DELETE_ITEM";
            break;
          case 2167:
            int v4 = @"CANCEL_REMOVE";
            break;
          case 2168:
            int v4 = @"DELETE_SUGGESTION";
            break;
          case 2169:
            int v4 = @"ADD_SCHOOL_FAVORITE";
            break;
          case 2170:
            int v4 = @"GO_TO_WEBSITE";
            break;
          case 2171:
            int v4 = @"TRY_AGAIN";
            break;
          case 2172:
            int v4 = @"CHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2173:
            int v4 = @"CHECK_EBIKE";
            break;
          case 2174:
            int v4 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2175:
            int v4 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
            break;
          case 2176:
            int v4 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2177:
            int v4 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
            break;
          case 2178:
            int v4 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2179:
            int v4 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
            break;
          case 2180:
            int v4 = @"TAP_CYCLING_DEFAULT_OPTION";
            break;
          case 2181:
            int v4 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
            break;
          case 2182:
            int v4 = @"TAP_CYCLING_STAIRS_ADVISORY";
            break;
          case 2183:
            int v4 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
            break;
          case 2184:
            int v4 = @"UNCHECK_AUTO_RECORD_WORKOUT";
            break;
          case 2185:
            int v4 = @"UNCHECK_EBIKE";
            break;
          case 2186:
            int v4 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
            break;
          case 2187:
            int v4 = @"DISPLAY_LPR_ADVISORY";
            break;
          case 2188:
            int v4 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
            break;
          case 2189:
            int v4 = @"CREATE_WIDGET";
            break;
          case 2190:
            int v4 = @"REVEAL_WIDGET_TRAY";
            break;
          case 2191:
            int v4 = @"LPR_ERROR_CODE";
            break;
          case 2192:
            int v4 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
            break;
          case 2193:
            int v4 = @"TAP_CLEAR_RECENTLY_VIEWED";
            break;
          case 2194:
            int v4 = @"LPR_HARD_STOP";
            break;
          case 2195:
            int v4 = @"TAP_PUBLISHER_SUBACTION";
            break;
          case 2196:
            int v4 = @"CARPLAY_DISPLAY_ACTIVATED";
            break;
          case 2197:
            int v4 = @"CARPLAY_DISPLAY_DEACTIVATED";
            break;
          case 2198:
            int v4 = @"TAP_FEATURED_COLLECTION";
            break;
          case 2199:
            int v4 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
            break;
          case 2200:
            int v4 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
            break;
          default:
            switch(a3)
            {
              case 3001:
                int v4 = @"START_NAV";
                break;
              case 3002:
                int v4 = @"END_NAV";
                break;
              case 3003:
                int v4 = @"OPEN_NAV_AUDIO_SETTINGS";
                break;
              case 3004:
                int v4 = @"VIEW_DETAILS";
                break;
              case 3005:
                int v4 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                break;
              case 3006:
                int v4 = @"OPEN_ROUTING_EDITOR";
                break;
              case 3007:
                int v4 = @"EDIT_ORIGIN";
                break;
              case 3008:
                int v4 = @"EDIT_DESTINATION";
                break;
              case 3009:
                int v4 = @"SWAP_ORIGIN_DESTINATION";
                break;
              case 3010:
                int v4 = @"OPEN_MORE_ROUTES";
                break;
              case 3011:
                int v4 = @"SELECT_ROUTING_TYPE_DRIVING";
                break;
              case 3012:
                int v4 = @"SELECT_ROUTING_TYPE_WALKING";
                break;
              case 3013:
                int v4 = @"SELECT_ROUTING_TYPE_TRANSIT";
                break;
              case 3014:
                int v4 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                break;
              case 3015:
                int v4 = @"SELECT_ROUTE";
                break;
              case 3016:
                int v4 = @"COLLAPSE_STEP_DETAILS_WALK";
                break;
              case 3017:
                int v4 = @"EXPAND_STEP_DETAILS_WALK";
                break;
              case 3018:
                int v4 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                break;
              case 3019:
                int v4 = @"EXPAND_STEP_DETAILS_TRANSIT";
                break;
              case 3020:
                int v4 = @"UNCHECK_BUS";
                break;
              case 3021:
                int v4 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3022:
                int v4 = @"UNCHECK_COMMUTER_RAIL";
                break;
              case 3023:
                int v4 = @"UNCHECK_FERRY";
                break;
              case 3024:
                int v4 = @"CHECK_BUS";
                break;
              case 3025:
                int v4 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                break;
              case 3026:
                int v4 = @"CHECK_COMMUTER_RAIL";
                break;
              case 3027:
                int v4 = @"CHECK_FERRY";
                break;
              case 3028:
                int v4 = @"SELECT_LEAVE_AT";
                break;
              case 3029:
                int v4 = @"SELECT_ARRIVE_BY";
                break;
              case 3030:
                int v4 = @"SELECT_LEAVE_NOW";
                break;
              case 3031:
                int v4 = @"SELECT_DATE_TIME";
                break;
              case 3032:
                int v4 = @"SWITCH_ON_IC_FARES";
                break;
              case 3033:
                int v4 = @"SWITCH_OFF_IC_FARES";
                break;
              case 3034:
                int v4 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                break;
              case 3035:
                int v4 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                break;
              case 3036:
                int v4 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                break;
              case 3037:
                int v4 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                break;
              case 3038:
                int v4 = @"REVEAL_FROM_ROUTING";
                break;
              case 3039:
                int v4 = @"DISPLAY_ROUTES";
                break;
              case 3040:
                int v4 = @"CHECK_RECOMMENDED_ROUTES";
                break;
              case 3041:
                int v4 = @"UNCHECK_RECOMMENDED_ROUTES";
                break;
              case 3042:
                int v4 = @"CHECK_FASTER_TRIPS";
                break;
              case 3043:
                int v4 = @"UNCHECK_FASTER_TRIPS";
                break;
              case 3044:
                int v4 = @"CHECK_FEWER_TRANSFERS";
                break;
              case 3045:
                int v4 = @"UNCHECK_FEWER_TRANSFERS";
                break;
              case 3046:
                int v4 = @"CHECK_LESS_WALKING";
                break;
              case 3047:
                int v4 = @"UNCHECK_LESS_WALKING";
                break;
              case 3048:
                int v4 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                break;
              case 3049:
                int v4 = @"TAP_MORE_ROUTES";
                break;
              case 3050:
                int v4 = @"OPEN_NAV_OVERVIEW";
                break;
              case 3051:
                int v4 = @"RESUME_NAV_MANEUVER_VIEW";
                break;
              case 3052:
                int v4 = @"SELECT_AUDIO_VOLUME_SILENT";
                break;
              case 3053:
                int v4 = @"SELECT_AUDIO_VOLUME_LOW";
                break;
              case 3054:
                int v4 = @"SELECT_AUDIO_VOLUME_NORMAL";
                break;
              case 3055:
                int v4 = @"SELECT_AUDIO_VOLUME_LOUD";
                break;
              case 3056:
                int v4 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                break;
              case 3057:
                int v4 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                break;
              case 3058:
                int v4 = @"RESUME_PREV_NAV";
                break;
              case 3059:
                int v4 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                break;
              case 3060:
                int v4 = @"ACCEPT_REROUTE";
                break;
              case 3061:
                int v4 = @"DISMISS_REROUTE";
                break;
              case 3062:
                int v4 = @"ATTEMPT_END_NAV";
                break;
              case 3063:
                int v4 = @"DISPLAY_BANNER";
                break;
              case 3064:
                int v4 = @"VIEW_BANNER_DETAILS";
                break;
              case 3065:
                int v4 = @"ENTER_GUIDANCE";
                break;
              case 3066:
                int v4 = @"AUTO_ADVANCE_GUIDANCE";
                break;
              case 3067:
                int v4 = @"TAP_OPEN_WALLET";
                break;
              case 3068:
                int v4 = @"SELECT_VOICE_GUIDANCE_ALL";
                break;
              case 3069:
                int v4 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                break;
              case 3070:
                int v4 = @"SELECT_VOICE_GUIDANCE_NONE";
                break;
              case 3071:
                int v4 = @"DISPLAY_CARD";
                break;
              case 3072:
                int v4 = @"RENDER_ROUTE";
                break;
              case 3073:
                int v4 = @"DISPLAY_JUNCTION_VIEW";
                break;
              case 3074:
                int v4 = @"SELECT_DEPARTURE";
                break;
              case 3075:
                int v4 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                break;
              case 3076:
                int v4 = @"DEVICE_RAISE";
                break;
              case 3077:
                int v4 = @"ENTER_AR_NAV_VIEW";
                break;
              case 3078:
                int v4 = @"EXIT_AR_NAV_VIEW";
                break;
              case 3079:
                int v4 = @"AR_CALIBRATION_START";
                break;
              case 3080:
                int v4 = @"AR_CALIBRATION_FAILURE";
                break;
              case 3081:
                int v4 = @"AR_CALIBRATION_SUCCESS";
                break;
              case 3082:
                int v4 = @"DISPLAY_AR_NAV_ARROW";
                break;
              case 3083:
                int v4 = @"DISPLAY_AR_NAV_TURN_AROUND";
                break;
              case 3084:
                int v4 = @"DISPLAY_GO_OUTSIDE_BANNER";
                break;
              case 3085:
                int v4 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                break;
              case 3086:
                int v4 = @"DISPLAY_AR_NAV_ENDPOINT";
                break;
              case 3087:
                int v4 = @"DISPLAY_ADVISORY_BANNER";
                break;
              case 3088:
                int v4 = @"TAP_SHOW_ADVISORY_DETAILS";
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

- (unsigned)verticalIndex
{
  return self->_verticalIndex;
}

- (void)setVerticalIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_verticalIndex = a3;
}

- (void)setHasVerticalIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 528;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasVerticalIndex
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)horizontalIndex
{
  return self->_horizontalIndex;
}

- (void)setHorizontalIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_horizontalIndex = a3;
}

- (void)setHasHorizontalIndex:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasHorizontalIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)repeatableSectionIndex
{
  return self->_repeatableSectionIndex;
}

- (void)setRepeatableSectionIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_repeatableSectionIndex = a3;
}

- (void)setHasRepeatableSectionIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRepeatableSectionIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateCuratedCollection;
  int v4 = [(GEOLogMsgStateCuratedCollection *)&v8 description];
  v5 = [(GEOLogMsgStateCuratedCollection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateCuratedCollection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateCuratedCollection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateCuratedCollection)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateCuratedCollection *)-[GEOLogMsgStateCuratedCollection _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgStateCuratedCollection)initWithJSON:(id)a3
{
  return (GEOLogMsgStateCuratedCollection *)-[GEOLogMsgStateCuratedCollection _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_6740;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6741;
    }
    GEOLogMsgStateCuratedCollectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPublisherDetails *)self->_publisherDetails readAll:1];
    [(GEOCollectionDetails *)self->_collectionDetails readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateCuratedCollectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateCuratedCollectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStateCuratedCollectionIsDirty((uint64_t)self) & 1) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateCuratedCollection *)self readAll:0];
  if (self->_publisherDetails) {
    PBDataWriterWriteSubmessage();
  }
  v5 = v11;
  if (self->_collectionDetails)
  {
    PBDataWriterWriteSubmessage();
    v5 = v11;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v11;
  }
  if (self->_possibleActions.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v11;
      ++v6;
    }
    while (v6 < self->_possibleActions.count);
  }
  if (self->_impossibleActions.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v11;
      ++v7;
    }
    while (v7 < self->_impossibleActions.count);
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v11;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_17:
      if ((flags & 2) == 0) {
        goto LABEL_18;
      }
LABEL_22:
      PBDataWriterWriteInt32Field();
      v5 = v11;
      if ((*(_WORD *)&self->_flags & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v5 = v11;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  if ((flags & 8) != 0)
  {
LABEL_23:
    PBDataWriterWriteInt32Field();
LABEL_25:
    v5 = v11;
  }
LABEL_26:
}

- (void)copyTo:(id)a3
{
  id v11 = (id *)a3;
  [(GEOLogMsgStateCuratedCollection *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 20) = self->_readerMarkPos;
  *((_DWORD *)v11 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_publisherDetails) {
    objc_msgSend(v11, "setPublisherDetails:");
  }
  if (self->_collectionDetails) {
    objc_msgSend(v11, "setCollectionDetails:");
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v11 + 25) = self->_placecardType;
    *((_WORD *)v11 + 56) |= 4u;
  }
  if ([(GEOLogMsgStateCuratedCollection *)self possibleActionsCount])
  {
    [v11 clearPossibleActions];
    unint64_t v4 = [(GEOLogMsgStateCuratedCollection *)self possibleActionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPossibleAction:", -[GEOLogMsgStateCuratedCollection possibleActionAtIndex:](self, "possibleActionAtIndex:", i));
    }
  }
  if ([(GEOLogMsgStateCuratedCollection *)self impossibleActionsCount])
  {
    [v11 clearImpossibleActions];
    unint64_t v7 = [(GEOLogMsgStateCuratedCollection *)self impossibleActionsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v11, "addImpossibleAction:", -[GEOLogMsgStateCuratedCollection impossibleActionAtIndex:](self, "impossibleActionAtIndex:", j));
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v11 + 27) = self->_verticalIndex;
    *((_WORD *)v11 + 56) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_17:
      if ((flags & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v11 + 23) = self->_horizontalIndex;
  *((_WORD *)v11 + 56) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_18:
    if ((flags & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_25:
  *((_DWORD *)v11 + 24) = self->_localSearchProviderID;
  *((_WORD *)v11 + 56) |= 2u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_19:
    *((_DWORD *)v11 + 26) = self->_repeatableSectionIndex;
    *((_WORD *)v11 + 56) |= 8u;
  }
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateCuratedCollection *)self readAll:0];
    id v9 = [(GEOPublisherDetails *)self->_publisherDetails copyWithZone:a3];
    v10 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v9;

    id v11 = [(GEOCollectionDetails *)self->_collectionDetails copyWithZone:a3];
    v12 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v11;

    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 100) = self->_placecardType;
      *(_WORD *)(v5 + 112) |= 4u;
    }
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 108) = self->_verticalIndex;
      *(_WORD *)(v5 + 112) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_9:
        if ((flags & 2) == 0) {
          goto LABEL_10;
        }
        goto LABEL_15;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 92) = self->_horizontalIndex;
    *(_WORD *)(v5 + 112) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 8) == 0) {
        return (id)v5;
      }
LABEL_11:
      *(_DWORD *)(v5 + 104) = self->_repeatableSectionIndex;
      *(_WORD *)(v5 + 112) |= 8u;
      return (id)v5;
    }
LABEL_15:
    *(_DWORD *)(v5 + 96) = self->_localSearchProviderID;
    *(_WORD *)(v5 + 112) |= 2u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateCuratedCollectionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  [(GEOLogMsgStateCuratedCollection *)self readAll:1];
  [v4 readAll:1];
  publisherDetails = self->_publisherDetails;
  if ((unint64_t)publisherDetails | *((void *)v4 + 9))
  {
    if (!-[GEOPublisherDetails isEqual:](publisherDetails, "isEqual:")) {
      goto LABEL_32;
    }
  }
  collectionDetails = self->_collectionDetails;
  if ((unint64_t)collectionDetails | *((void *)v4 + 8))
  {
    if (!-[GEOCollectionDetails isEqual:](collectionDetails, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_placecardType != *((_DWORD *)v4 + 25)) {
      goto LABEL_32;
    }
  }
  else if ((v7 & 4) != 0)
  {
LABEL_32:
    BOOL v10 = 0;
    goto LABEL_33;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_32;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_verticalIndex != *((_DWORD *)v4 + 27)) {
      goto LABEL_32;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_horizontalIndex != *((_DWORD *)v4 + 23)) {
      goto LABEL_32;
    }
  }
  else if (v9)
  {
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 24)) {
      goto LABEL_32;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_32;
  }
  BOOL v10 = (v9 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_repeatableSectionIndex != *((_DWORD *)v4 + 26)) {
      goto LABEL_32;
    }
    BOOL v10 = 1;
  }
LABEL_33:

  return v10;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateCuratedCollection *)self readAll:1];
  unint64_t v3 = [(GEOPublisherDetails *)self->_publisherDetails hash];
  unint64_t v4 = [(GEOCollectionDetails *)self->_collectionDetails hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_placecardType;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = PBRepeatedInt32Hash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v9 = 2654435761 * self->_verticalIndex;
    if (flags)
    {
LABEL_6:
      uint64_t v10 = 2654435761 * self->_horizontalIndex;
      if ((flags & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v11 = 0;
      if ((flags & 8) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v12 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (flags) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v11 = 2654435761 * self->_localSearchProviderID;
  if ((flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_repeatableSectionIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  [v16 readAll:0];
  id v4 = v16;
  publisherDetails = self->_publisherDetails;
  uint64_t v6 = *((void *)v16 + 9);
  if (publisherDetails)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPublisherDetails mergeFrom:](publisherDetails, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLogMsgStateCuratedCollection setPublisherDetails:](self, "setPublisherDetails:");
  }
  id v4 = v16;
LABEL_7:
  collectionDetails = self->_collectionDetails;
  uint64_t v8 = *((void *)v4 + 8);
  if (collectionDetails)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOCollectionDetails mergeFrom:](collectionDetails, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLogMsgStateCuratedCollection setCollectionDetails:](self, "setCollectionDetails:");
  }
  id v4 = v16;
LABEL_13:
  if ((*((_WORD *)v4 + 56) & 4) != 0)
  {
    self->_placecardType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 4u;
  }
  uint64_t v9 = [v4 possibleActionsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[GEOLogMsgStateCuratedCollection addPossibleAction:](self, "addPossibleAction:", [v16 possibleActionAtIndex:i]);
  }
  uint64_t v12 = [v16 impossibleActionsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[GEOLogMsgStateCuratedCollection addImpossibleAction:](self, "addImpossibleAction:", [v16 impossibleActionAtIndex:j]);
  }
  __int16 v15 = *((_WORD *)v16 + 56);
  if ((v15 & 0x10) != 0)
  {
    self->_verticalIndex = *((_DWORD *)v16 + 27);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v15 = *((_WORD *)v16 + 56);
    if ((v15 & 1) == 0)
    {
LABEL_23:
      if ((v15 & 2) == 0) {
        goto LABEL_24;
      }
      goto LABEL_31;
    }
  }
  else if ((v15 & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_horizontalIndex = *((_DWORD *)v16 + 23);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v15 = *((_WORD *)v16 + 56);
  if ((v15 & 2) == 0)
  {
LABEL_24:
    if ((v15 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_31:
  self->_localSearchProviderID = *((_DWORD *)v16 + 24);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v16 + 56) & 8) != 0)
  {
LABEL_25:
    self->_repeatableSectionIndex = *((_DWORD *)v16 + 26);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_26:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherDetails, 0);
  objc_storeStrong((id *)&self->_collectionDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end