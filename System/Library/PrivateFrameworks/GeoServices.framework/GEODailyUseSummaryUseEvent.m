@interface GEODailyUseSummaryUseEvent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAppType;
- (BOOL)hasCount;
- (BOOL)hasEventType;
- (BOOL)hasUsageBool;
- (BOOL)hasUsageString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usageBool;
- (GEODailyUseSummaryUseEvent)initWithDictionary:(id)a3;
- (GEODailyUseSummaryUseEvent)initWithJSON:(id)a3;
- (NSString)usageString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsAppType:(id)a3;
- (int)StringAsEventType:(id)a3;
- (int)appType;
- (int)eventType;
- (unint64_t)hash;
- (unsigned)count;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppType:(int)a3;
- (void)setCount:(unsigned int)a3;
- (void)setEventType:(int)a3;
- (void)setHasAppType:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasUsageBool:(BOOL)a3;
- (void)setUsageBool:(BOOL)a3;
- (void)setUsageString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODailyUseSummaryUseEvent

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(unsigned char *)(v5 + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_count;
      *(unsigned char *)(v5 + 32) |= 2u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_appType;
  *(unsigned char *)(v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 28) = self->_usageBool;
    *(unsigned char *)(v5 + 32) |= 8u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_usageString copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  v4 = @"UNKNOWN_EVENT";
  switch(a3)
  {
    case 0:
      goto LABEL_570;
    case 1:
      v4 = @"ACCIDENT_CONFIRMATION";
      break;
    case 2:
      v4 = @"ACCIDENT_SUBMISSION";
      break;
    case 3:
      v4 = @"ADD_LICENSE_PLATE";
      break;
    case 4:
      v4 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
      break;
    case 5:
      v4 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
      break;
    case 6:
      v4 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
      break;
    case 7:
      v4 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
      break;
    case 8:
      v4 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
      break;
    case 9:
      v4 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
      break;
    case 10:
      v4 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
      break;
    case 11:
      v4 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
      break;
    case 12:
      v4 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
      break;
    case 13:
      v4 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
      break;
    case 14:
      v4 = @"ANNOUNCEMENT_TAPPED_GENERAL";
      break;
    case 15:
      v4 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
      break;
    case 16:
      v4 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
      break;
    case 17:
      v4 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
      break;
    case 18:
      v4 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
      break;
    case 19:
      v4 = @"ANNOUNCEMENT_TAPPED_VENUES";
      break;
    case 20:
      v4 = @"APP_CLIP_USED";
      break;
    case 21:
      v4 = @"AR_MODE_ENTER";
      break;
    case 22:
      v4 = @"AUTOCOMPLETE_RESULTS_SHOWN";
      break;
    case 23:
      v4 = @"CARPLAY_CONNECTED";
      break;
    case 24:
      v4 = @"COARSE_LOCATION_USED";
      break;
    case 25:
      v4 = @"COLLECTION_CREATED";
      break;
    case 26:
      v4 = @"COLLECTION_ITEM_TAPPED";
      break;
    case 27:
      v4 = @"COLLECTION_SHARED";
      break;
    case 28:
      v4 = @"COLLECTION_SHOWN";
      break;
    case 29:
      v4 = @"CURATED_COLLECTION_ITEM_TAPPED";
      break;
    case 30:
      v4 = @"CURATED_COLLECTION_REMOVED";
      break;
    case 31:
      v4 = @"CURATED_COLLECTION_SAVED";
      break;
    case 32:
      v4 = @"CURATED_COLLECTION_SHARED";
      break;
    case 33:
      v4 = @"CURATED_COLLECTION_SHOWN";
      break;
    case 34:
      v4 = @"DEVICE_CONNECTED";
      break;
    case 35:
      v4 = @"DIRECTIONS";
      break;
    case 36:
      v4 = @"DIRECTIONS_REQUESTED_CYCLING";
      break;
    case 37:
      v4 = @"DIRECTIONS_REQUESTED_DRIVING";
      break;
    case 38:
      v4 = @"DIRECTIONS_REQUESTED_EBIKE";
      break;
    case 39:
      v4 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
      break;
    case 40:
      v4 = @"DIRECTIONS_REQUESTED_TRANSIT";
      break;
    case 41:
      v4 = @"DIRECTIONS_REQUESTED_WALKING";
      break;
    case 42:
      v4 = @"DIRECTIONS_SAFARI";
      break;
    case 43:
      v4 = @"DIRECTIONS_SIRI_PLACECARD";
      break;
    case 44:
      v4 = @"DIRECTIONS_SPOTLIGHT";
      break;
    case 45:
      v4 = @"ENTER_MAPS_CARPLAY";
      break;
    case 46:
      v4 = @"ENTER_VENUE_EXPERIENCE";
      break;
    case 47:
      v4 = @"ETA_RECEIVED";
      break;
    case 48:
      v4 = @"ETA_SHARED";
      break;
    case 49:
      v4 = @"FAVORITE_ADD_PLACE";
      break;
    case 50:
      v4 = @"FAVORITE_TAP_LIST_ITEM";
      break;
    case 51:
      v4 = @"FLYOVER_FOREGROUNDED";
      break;
    case 52:
      v4 = @"INCIDENT_SUBMISSION";
      break;
    case 53:
      v4 = @"LOOK_AROUND_FOREGROUNDED";
      break;
    case 54:
      v4 = @"LOOK_AROUND_SHARED";
      break;
    case 55:
      v4 = @"MAPSHOME_GET_DIRECTIONS";
      break;
    case 56:
      v4 = @"MAPS_HANDOFF_FROM_IPAD";
      break;
    case 57:
      v4 = @"MAPS_HANDOFF_FROM_MAC";
      break;
    case 58:
      v4 = @"MAPS_HANDOFF_FROM_PHONE";
      break;
    case 59:
      v4 = @"MAPS_HANDOFF_FROM_WATCH";
      break;
    case 60:
      v4 = @"MAP_VIEW_FOREGROUNDED";
      break;
    case 61:
      v4 = @"NAV_SESSION_COARSE_LOCATION";
      break;
    case 62:
      v4 = @"NAV_SESSION_PRECISE_LOCATION";
      break;
    case 63:
      v4 = @"NAV_STARTED_CARPLAY";
      break;
    case 64:
      v4 = @"NAV_STARTED_CYCLING";
      break;
    case 65:
      v4 = @"NAV_STARTED_DRIVING";
      break;
    case 66:
      v4 = @"NAV_STARTED_EBIKE";
      break;
    case 67:
      v4 = @"NAV_STARTED_EV_ROUTING";
      break;
    case 68:
      v4 = @"NAV_STARTED_JUNCTION_VIEW";
      break;
    case 69:
      v4 = @"NAV_STARTED_LANE_GUIDANCE";
      break;
    case 70:
      v4 = @"NAV_STARTED_TRANSIT";
      break;
    case 71:
      v4 = @"NAV_STARTED_WALKING";
      break;
    case 72:
      v4 = @"OPEN_INDOOR_MAP";
      break;
    case 73:
      v4 = @"OTHER_GET_DIRECTIONS";
      break;
    case 74:
      v4 = @"PLACECARD_GET_DIRECTIONS";
      break;
    case 75:
      v4 = @"PLACECARD_RICH_DATA_USED";
      break;
    case 76:
      v4 = @"PLACECARD_SHARED";
      break;
    case 77:
      v4 = @"PLACECARD_SHOWN";
      break;
    case 78:
      v4 = @"PLACECARD_SHOWN_SAFARI";
      break;
    case 79:
      v4 = @"PLACECARD_SHOWN_SIRI";
      break;
    case 80:
      v4 = @"PLACECARD_SHOWN_SPOTLIGHT";
      break;
    case 81:
      v4 = @"PLACECARD_START_NAV";
      break;
    case 82:
      v4 = @"PROMINENT_GET_DIRECTIONS";
      break;
    case 83:
      v4 = @"RAP_STARTED";
      break;
    case 84:
      v4 = @"RIDESHARE_REQUESTED";
      break;
    case 85:
      v4 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
      break;
    case 86:
      v4 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
      break;
    case 87:
      v4 = @"SEARCH_RECENT_SEARCHES_TAPPED";
      break;
    case 88:
      v4 = @"SEARCH_RESULTS_SHOWN_MAPS";
      break;
    case 89:
      v4 = @"SEARCH_RESULTS_SHOWN_SAFARI";
      break;
    case 90:
      v4 = @"SEARCH_RESULTS_SHOWN_SIRI";
      break;
    case 91:
      v4 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
      break;
    case 92:
      v4 = @"SEARCH_RESULTS_TAPPED_SAFARI";
      break;
    case 93:
      v4 = @"SEARCH_RESULTS_TAPPED_SIRI";
      break;
    case 94:
      v4 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
      break;
    case 95:
      v4 = @"SEARCH_RESULT_TAPPED_MAPS";
      break;
    case 96:
      v4 = @"SEARCH_SUGGESTION_TAPPED";
      break;
    case 97:
      v4 = @"SHARE_DRIVING_ROUTES";
      break;
    case 98:
      v4 = @"SHARE_FAVORITES";
      break;
    case 99:
      v4 = @"SHARE_MYLOCATION";
      break;
    case 100:
      v4 = @"SHARE_TO_DEVICE";
      break;
    case 101:
      v4 = @"SHARE_TRANSIT_ROUTES";
      break;
    case 102:
      v4 = @"SHARE_WALKING_ROUTES";
      break;
    case 103:
      v4 = @"SHOW_MAPS_SETTINGS";
      break;
    case 104:
      v4 = @"SIRI_START_NAV";
      break;
    case 105:
      v4 = @"SNAPSHOTTER_USED";
      break;
    case 106:
      v4 = @"TAP_COMPASS_MODE";
      break;
    case 107:
      v4 = @"UGC_PHOTO_SUBMISSION";
      break;
    case 108:
      v4 = @"UGC_RATING_SUBMISSION";
      break;
    case 109:
      v4 = @"VLF_CORRECTION_ATTEMPTED";
      break;
    case 110:
      v4 = @"VLF_CORRECTION_FAILED";
      break;
    case 111:
      v4 = @"VLF_CORRECTION_SUCCESS";
      break;
    case 112:
      v4 = @"WIDGET_ENTER";
      break;
    case 113:
      v4 = @"JUNCTION_VIEW_SHOWN";
      break;
    case 114:
      v4 = @"ETA_SHARED_DRIVING";
      break;
    case 115:
      v4 = @"ETA_SHARED_WALKING";
      break;
    case 116:
      v4 = @"ETA_SHARED_CYCLING";
      break;
    case 117:
      v4 = @"MAPS_HANDOFF";
      break;
    case 118:
      v4 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
      break;
    case 119:
      v4 = @"AR_WALKING_LOCALIZATION_FAILED";
      break;
    case 120:
      v4 = @"AR_WALKING_LOCALIZATION_SUCCESS";
      break;
    case 121:
      v4 = @"CURATED_COLLECTIONS_HOME_SHOWN";
      break;
    case 122:
      v4 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
      break;
    case 123:
      v4 = @"NEARBY_TRANSIT_SHOWN";
      break;
    case 124:
      v4 = @"NEARBY_TRANSIT_TAPPED";
      break;
    case 125:
      v4 = @"SPR_GLOBE_EXPLORED";
      break;
    case 126:
      v4 = @"SPR_METROS_EXPLORED";
      break;
    case 127:
      v4 = @"TRANSIT_DETAILS_USED";
      break;
    case 128:
      v4 = @"USER_ACCOUNT_OPENED_ACCOUNT";
      break;
    case 129:
      v4 = @"USER_ACCOUNT_SHOWN";
      break;
    case 130:
      v4 = @"MAP_MODE_DRIVING_SELECTED";
      break;
    case 131:
      v4 = @"MAP_MODE_EXPLORE_SELECTED";
      break;
    case 132:
      v4 = @"MAP_MODE_TRANSIT_SELECTED";
      break;
    case 133:
      v4 = @"MAP_MODE_SATELLITE_SELECTED";
      break;
    case 134:
      v4 = @"MAP_MODE_DRIVING_USED";
      break;
    case 135:
      v4 = @"MAP_MODE_EXPLORE_USED";
      break;
    case 136:
      v4 = @"MAP_MODE_TRANSIT_USED";
      break;
    case 137:
      v4 = @"MAP_MODE_SATELLITE_USED";
      break;
    case 138:
      v4 = @"WATCH_GET_DIRECTIONS_CYCLING";
      break;
    case 139:
      v4 = @"WATCH_START_NAV_CYCLING";
      break;
    case 140:
      v4 = @"WATCH_GET_DIRECTIONS_WALKING";
      break;
    case 141:
      v4 = @"WATCH_START_NAV_WALKING";
      break;
    case 142:
      v4 = @"WATCH_GET_DIRECTIONS_TRANSIT";
      break;
    case 143:
      v4 = @"WATCH_START_NAV_TRANSIT";
      break;
    case 144:
      v4 = @"WATCH_GET_DIRECTIONS_DRIVING";
      break;
    case 145:
      v4 = @"WATCH_START_NAV_DRIVING";
      break;
    case 146:
      v4 = @"ETA_SHARED_TRANSIT";
      break;
    case 147:
      v4 = @"USER_ACCOUNT_OPENED";
      break;
    case 148:
      v4 = @"VENUE_INTERACTION";
      break;
    case 149:
      v4 = @"ENTER_MAPS";
      break;
    case 150:
      v4 = @"EXIT_MAPS";
      break;
    case 151:
      v4 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
      break;
    case 152:
      v4 = @"ENTER_MAPS_DEVICE";
      break;
    case 153:
      v4 = @"MAP_VIEW_INSTANTIATED";
      break;
    case 154:
      v4 = @"MAP_VIEW_ACTIVATED";
      break;
    case 155:
      v4 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
      break;
    case 156:
      v4 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
      break;
    case 157:
      v4 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
      break;
    case 158:
      v4 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
      break;
    case 159:
      v4 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
      break;
    case 160:
      v4 = @"SIRI_SEARCH_CARPLAY_UI";
      break;
    case 161:
      v4 = @"OPEN_KEYBOARD_CARPLAY_UI";
      break;
    case 162:
      v4 = @"TAP_SEARCH_CARPLAY_UI";
      break;
    case 163:
      v4 = @"OPEN_SEARCH_CARPLAY_UI";
      break;
    case 164:
      v4 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
      break;
    case 165:
      v4 = @"EXIT_MAPS_CARPLAY";
      break;
    case 166:
      v4 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
      break;
    case 167:
      v4 = @"NAV_FEEDBACK_DRIVING";
      break;
    case 168:
      v4 = @"TRIP_COMPLETED_DRIVING";
      break;
    case 169:
      v4 = @"HAS_REROUTE_DRIVING";
      break;
    case 170:
      v4 = @"ETA_OVERESTIMATE_DRIVING";
      break;
    case 171:
      v4 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
      break;
    case 172:
      v4 = @"ETA_UNDERESTIMATE_DRIVING";
      break;
    case 173:
      v4 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
      break;
    case 174:
      v4 = @"RAP_GOOD_TRIP";
      break;
    case 175:
      v4 = @"ENRICHED_RESULTS_SHOWN_MAPS";
      break;
    case 176:
      v4 = @"TAP_TRANSIT_TIPKIT";
      break;
    case 177:
      v4 = @"ADD_STOP_CARPLAY";
      break;
    case 178:
      v4 = @"ADD_STOP_CARPLAY_SIRI";
      break;
    case 179:
      v4 = @"ADD_STOP_DEVICE";
      break;
    case 180:
      v4 = @"ADD_STOP_DEVICE_SIRI";
      break;
    case 181:
      v4 = @"SHOWCASE_SHOWN";
      break;
    case 182:
      v4 = @"SHOWCASE_TAPPED";
      break;
    case 183:
      v4 = @"PUNCH_IN_SIRI";
      break;
    case 184:
      v4 = @"PUNCH_IN_SAFARI";
      break;
    case 185:
      v4 = @"PUNCH_IN_SPOTLIGHT";
      break;
    case 186:
      v4 = @"PUNCH_IN_SMS";
      break;
    case 187:
      v4 = @"PUNCH_IN_FINDMY";
      break;
    case 188:
      v4 = @"PUNCH_IN_OTHER_2ND_PARTY";
      break;
    case 189:
      v4 = @"PUNCH_IN_3RD_PARTY";
      break;
    case 191:
      v4 = @"RAP_SUBMITTED";
      break;
    case 192:
      v4 = @"ARP_PHOTO_SUBMISSION";
      break;
    case 193:
      v4 = @"ARP_RATING_SUBMISSION";
      break;
    case 194:
      v4 = @"TRAFFIC_INCIDENT_REPORT";
      break;
    case 195:
      v4 = @"TRAFFIC_INCIDENT_CONFIRM";
      break;
    case 196:
      v4 = @"TRAFFIC_INCIDENT_DISMISS";
      break;
    case 197:
      v4 = @"TRAFFIC_INCIDENT_CLEAR";
      break;
    case 198:
      v4 = @"MODERN_MAP_EXPLORED";
      break;
    case 199:
      v4 = @"CARPLAY_ROUTING_UI_USED";
      break;
    case 200:
      v4 = @"CARPLAY_SEARCH_UI_USED";
      break;
    case 201:
      v4 = @"ANNOUNCEMENT_DISPLAYED";
      break;
    case 202:
      v4 = @"ANNOUNCEMENT_TAPPED";
      break;
    case 203:
      v4 = @"POSITIVE_SEARCH_ENGAGEMENT";
      break;
    case 204:
      v4 = @"PUNCH_OUT_FINDMY";
      break;
    case 205:
      v4 = @"WATCH_START_NAV";
      break;
    case 206:
      v4 = @"HIKING_ENGAGEMENT";
      break;
    case 207:
      v4 = @"HIKING_PLACECARD";
      break;
    case 208:
      v4 = @"NO_SEARCH_RESULTS";
      break;
    case 209:
      v4 = @"PUNCH_IN_SHOWCASE";
      break;
    case 210:
      v4 = @"SHARED_LOCATION_ENGAGEMENT";
      break;
    case 211:
      v4 = @"SHARE_SHOWCASE";
      break;
    case 212:
      v4 = @"WATCH_MAP_VIEW";
      break;
    case 213:
      v4 = @"WATCH_PLACECARD";
      break;
    case 214:
      v4 = @"WATCH_SEARCH";
      break;
    case 215:
      v4 = @"CURATED_HIKE_SAVED";
      break;
    case 216:
      v4 = @"CUSTOM_HIKE_SAVED";
      break;
    case 217:
      v4 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
      break;
    case 218:
      v4 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
      break;
    case 219:
      v4 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
      break;
    case 220:
      v4 = @"NAV_STARTED_CURATED_HIKE";
      break;
    case 221:
      v4 = @"NAV_STARTED_CUSTOM_HIKE";
      break;
    case 222:
      v4 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
      break;
    case 223:
      v4 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
      break;
    case 224:
      v4 = @"SEARCH_PHOTO_INTERACTION";
      break;
    case 225:
      v4 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
      break;
    case 226:
      v4 = @"LIBRARY_INTERACTION";
      break;
    case 227:
      v4 = @"SEARCH_FILTER_INTERACTION";
      break;
    case 228:
      v4 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
      break;
    case 229:
      v4 = @"CARPLAY_CONNECTED_OFFLINE";
      break;
    case 230:
      v4 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
      break;
    case 231:
      v4 = @"DIRECTIONS_OFFLINE";
      break;
    case 232:
      v4 = @"ENTER_MAPS_DEVICE_OFFLINE";
      break;
    case 233:
      v4 = @"NO_SEARCH_RESULTS_OFFLINE";
      break;
    case 234:
      v4 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
      break;
    case 235:
      v4 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
      break;
    case 236:
      v4 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
      break;
    case 237:
      v4 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_570:
      break;
  }
  return v4;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_EVENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCIDENT_CONFIRMATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCIDENT_SUBMISSION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADD_LICENSE_PLATE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_FLYOVER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_GENERAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_TRANSIT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_UNKNOWN"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_VENUES"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_FLYOVER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_GENERAL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_LOOK_AROUND"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_TRANSIT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_UNKNOWN"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED_VENUES"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"APP_CLIP_USED"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"AR_MODE_ENTER"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULTS_SHOWN"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"CARPLAY_CONNECTED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_USED"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"COLLECTION_CREATED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"COLLECTION_ITEM_TAPPED"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"COLLECTION_SHARED"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"COLLECTION_SHOWN"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_ITEM_TAPPED"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_REMOVED"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_SAVED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_SHARED"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_SHOWN"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"DEVICE_CONNECTED"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_CYCLING"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_DRIVING"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_EBIKE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_EV_ROUTING"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_TRANSIT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_WALKING"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SAFARI"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SIRI_PLACECARD"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SPOTLIGHT"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ENTER_MAPS_CARPLAY"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ENTER_VENUE_EXPERIENCE"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ETA_RECEIVED"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ETA_SHARED"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"FAVORITE_ADD_PLACE"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"FAVORITE_TAP_LIST_ITEM"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"FLYOVER_FOREGROUNDED"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"INCIDENT_SUBMISSION"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_FOREGROUNDED"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_SHARED"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"MAPSHOME_GET_DIRECTIONS"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"MAPS_HANDOFF_FROM_IPAD"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"MAPS_HANDOFF_FROM_MAC"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"MAPS_HANDOFF_FROM_PHONE"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"MAPS_HANDOFF_FROM_WATCH"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW_FOREGROUNDED"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"NAV_SESSION_COARSE_LOCATION"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"NAV_SESSION_PRECISE_LOCATION"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_CARPLAY"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_CYCLING"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_DRIVING"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_EBIKE"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_EV_ROUTING"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_JUNCTION_VIEW"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_LANE_GUIDANCE"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_TRANSIT"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_WALKING"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"OPEN_INDOOR_MAP"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"OTHER_GET_DIRECTIONS"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"PLACECARD_GET_DIRECTIONS"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"PLACECARD_RICH_DATA_USED"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHARED"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWN"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWN_SAFARI"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWN_SIRI"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWN_SPOTLIGHT"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"PLACECARD_START_NAV"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"PROMINENT_GET_DIRECTIONS"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"RAP_STARTED"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_REQUESTED"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"SEARCH_NEARBY_CATEGORY_TAPPED"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"SEARCH_RECENTLY_VIEWED_TAPPED"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"SEARCH_RECENT_SEARCHES_TAPPED"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_SHOWN_MAPS"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_SHOWN_SAFARI"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_SHOWN_SIRI"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_SHOWN_SPOTLIGHT"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_TAPPED_SAFARI"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_TAPPED_SIRI"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_TAPPED_SPOTLIGHT"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULT_TAPPED_MAPS"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"SEARCH_SUGGESTION_TAPPED"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"SHARE_DRIVING_ROUTES"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"SHARE_FAVORITES"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"SHARE_MYLOCATION"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"SHARE_TO_DEVICE"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"SHARE_TRANSIT_ROUTES"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"SHARE_WALKING_ROUTES"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"SHOW_MAPS_SETTINGS"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"SIRI_START_NAV"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"SNAPSHOTTER_USED"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"TAP_COMPASS_MODE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"UGC_PHOTO_SUBMISSION"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"UGC_RATING_SUBMISSION"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"VLF_CORRECTION_ATTEMPTED"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"VLF_CORRECTION_FAILED"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"VLF_CORRECTION_SUCCESS"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"WIDGET_ENTER"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"JUNCTION_VIEW_SHOWN"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"ETA_SHARED_DRIVING"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"ETA_SHARED_WALKING"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"ETA_SHARED_CYCLING"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"MAPS_HANDOFF"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"AR_WALKING_LOCALIZATION_ATTEMPTED"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"AR_WALKING_LOCALIZATION_FAILED"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"AR_WALKING_LOCALIZATION_SUCCESS"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_SHOWN"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"NEARBY_TRANSIT_SHOWN"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"NEARBY_TRANSIT_TAPPED"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"SPR_GLOBE_EXPLORED"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"SPR_METROS_EXPLORED"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"TRANSIT_DETAILS_USED"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"USER_ACCOUNT_OPENED_ACCOUNT"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"USER_ACCOUNT_SHOWN"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_DRIVING_SELECTED"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_EXPLORE_SELECTED"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_TRANSIT_SELECTED"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_SATELLITE_SELECTED"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_DRIVING_USED"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_EXPLORE_USED"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_TRANSIT_USED"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"MAP_MODE_SATELLITE_USED"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"WATCH_GET_DIRECTIONS_CYCLING"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"WATCH_START_NAV_CYCLING"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"WATCH_GET_DIRECTIONS_WALKING"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"WATCH_START_NAV_WALKING"])
  {
    int v4 = 141;
  }
  else if ([v3 isEqualToString:@"WATCH_GET_DIRECTIONS_TRANSIT"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"WATCH_START_NAV_TRANSIT"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"WATCH_GET_DIRECTIONS_DRIVING"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"WATCH_START_NAV_DRIVING"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"ETA_SHARED_TRANSIT"])
  {
    int v4 = 146;
  }
  else if ([v3 isEqualToString:@"USER_ACCOUNT_OPENED"])
  {
    int v4 = 147;
  }
  else if ([v3 isEqualToString:@"VENUE_INTERACTION"])
  {
    int v4 = 148;
  }
  else if ([v3 isEqualToString:@"ENTER_MAPS"])
  {
    int v4 = 149;
  }
  else if ([v3 isEqualToString:@"EXIT_MAPS"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"TOTAL_SECONDS_IN_MAPS_DEVICE"])
  {
    int v4 = 151;
  }
  else if ([v3 isEqualToString:@"ENTER_MAPS_DEVICE"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW_INSTANTIATED"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW_ACTIVATED"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_LIST_ITEM_CARPLAY_UI"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_FAVORITE_CARPLAY_UI"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"GET_DIRECTIONS_CARPLAY_CONNECTED"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"SIRI_SEARCH_CARPLAY_UI"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"OPEN_KEYBOARD_CARPLAY_UI"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"TAP_SEARCH_CARPLAY_UI"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"OPEN_SEARCH_CARPLAY_UI"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"MAPS_SEARCH_CARPLAY_CONNECTED"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"EXIT_MAPS_CARPLAY"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"TOTAL_SECONDS_IN_MAPS_CARPLAY"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"NAV_FEEDBACK_DRIVING"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"TRIP_COMPLETED_DRIVING"])
  {
    int v4 = 168;
  }
  else if ([v3 isEqualToString:@"HAS_REROUTE_DRIVING"])
  {
    int v4 = 169;
  }
  else if ([v3 isEqualToString:@"ETA_OVERESTIMATE_DRIVING"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"EXTREME_ETA_OVERESTIMATE_DRIVING"])
  {
    int v4 = 171;
  }
  else if ([v3 isEqualToString:@"ETA_UNDERESTIMATE_DRIVING"])
  {
    int v4 = 172;
  }
  else if ([v3 isEqualToString:@"EXTREME_ETA_UNDERESTIMATE_DRIVING"])
  {
    int v4 = 173;
  }
  else if ([v3 isEqualToString:@"RAP_GOOD_TRIP"])
  {
    int v4 = 174;
  }
  else if ([v3 isEqualToString:@"ENRICHED_RESULTS_SHOWN_MAPS"])
  {
    int v4 = 175;
  }
  else if ([v3 isEqualToString:@"TAP_TRANSIT_TIPKIT"])
  {
    int v4 = 176;
  }
  else if ([v3 isEqualToString:@"ADD_STOP_CARPLAY"])
  {
    int v4 = 177;
  }
  else if ([v3 isEqualToString:@"ADD_STOP_CARPLAY_SIRI"])
  {
    int v4 = 178;
  }
  else if ([v3 isEqualToString:@"ADD_STOP_DEVICE"])
  {
    int v4 = 179;
  }
  else if ([v3 isEqualToString:@"ADD_STOP_DEVICE_SIRI"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_SHOWN"])
  {
    int v4 = 181;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_TAPPED"])
  {
    int v4 = 182;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_SIRI"])
  {
    int v4 = 183;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_SAFARI"])
  {
    int v4 = 184;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_SPOTLIGHT"])
  {
    int v4 = 185;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_SMS"])
  {
    int v4 = 186;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_FINDMY"])
  {
    int v4 = 187;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_OTHER_2ND_PARTY"])
  {
    int v4 = 188;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_3RD_PARTY"])
  {
    int v4 = 189;
  }
  else if ([v3 isEqualToString:@"RAP_SUBMITTED"])
  {
    int v4 = 191;
  }
  else if ([v3 isEqualToString:@"ARP_PHOTO_SUBMISSION"])
  {
    int v4 = 192;
  }
  else if ([v3 isEqualToString:@"ARP_RATING_SUBMISSION"])
  {
    int v4 = 193;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_REPORT"])
  {
    int v4 = 194;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_CONFIRM"])
  {
    int v4 = 195;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_DISMISS"])
  {
    int v4 = 196;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_CLEAR"])
  {
    int v4 = 197;
  }
  else if ([v3 isEqualToString:@"MODERN_MAP_EXPLORED"])
  {
    int v4 = 198;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ROUTING_UI_USED"])
  {
    int v4 = 199;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH_UI_USED"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_DISPLAYED"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TAPPED"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"POSITIVE_SEARCH_ENGAGEMENT"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"PUNCH_OUT_FINDMY"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"WATCH_START_NAV"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"HIKING_ENGAGEMENT"])
  {
    int v4 = 206;
  }
  else if ([v3 isEqualToString:@"HIKING_PLACECARD"])
  {
    int v4 = 207;
  }
  else if ([v3 isEqualToString:@"NO_SEARCH_RESULTS"])
  {
    int v4 = 208;
  }
  else if ([v3 isEqualToString:@"PUNCH_IN_SHOWCASE"])
  {
    int v4 = 209;
  }
  else if ([v3 isEqualToString:@"SHARED_LOCATION_ENGAGEMENT"])
  {
    int v4 = 210;
  }
  else if ([v3 isEqualToString:@"SHARE_SHOWCASE"])
  {
    int v4 = 211;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_VIEW"])
  {
    int v4 = 212;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACECARD"])
  {
    int v4 = 213;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH"])
  {
    int v4 = 214;
  }
  else if ([v3 isEqualToString:@"CURATED_HIKE_SAVED"])
  {
    int v4 = 215;
  }
  else if ([v3 isEqualToString:@"CUSTOM_HIKE_SAVED"])
  {
    int v4 = 216;
  }
  else if ([v3 isEqualToString:@"CUSTOM_HIKE_CREATION_TRAY_SHOWN"])
  {
    int v4 = 217;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_CURATED_HIKE"])
  {
    int v4 = 218;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUESTED_CUSTOM_HIKE"])
  {
    int v4 = 219;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_CURATED_HIKE"])
  {
    int v4 = 220;
  }
  else if ([v3 isEqualToString:@"NAV_STARTED_CUSTOM_HIKE"])
  {
    int v4 = 221;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE_SHOWN"])
  {
    int v4 = 222;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CUSTOM_HIKE_SHOWN"])
  {
    int v4 = 223;
  }
  else if ([v3 isEqualToString:@"SEARCH_PHOTO_INTERACTION"])
  {
    int v4 = 224;
  }
  else if ([v3 isEqualToString:@"COMPLETE_DOWNLOAD_OFFLINE_MAPS"])
  {
    int v4 = 225;
  }
  else if ([v3 isEqualToString:@"LIBRARY_INTERACTION"])
  {
    int v4 = 226;
  }
  else if ([v3 isEqualToString:@"SEARCH_FILTER_INTERACTION"])
  {
    int v4 = 227;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE"])
  {
    int v4 = 228;
  }
  else if ([v3 isEqualToString:@"CARPLAY_CONNECTED_OFFLINE"])
  {
    int v4 = 229;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE"])
  {
    int v4 = 230;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_OFFLINE"])
  {
    int v4 = 231;
  }
  else if ([v3 isEqualToString:@"ENTER_MAPS_DEVICE_OFFLINE"])
  {
    int v4 = 232;
  }
  else if ([v3 isEqualToString:@"NO_SEARCH_RESULTS_OFFLINE"])
  {
    int v4 = 233;
  }
  else if ([v3 isEqualToString:@"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE"])
  {
    int v4 = 234;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE"])
  {
    int v4 = 235;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULT_TAPPED_MAPS_OFFLINE"])
  {
    int v4 = 236;
  }
  else if ([v3 isEqualToString:@"TAP_DOWNLOAD_MAPS_OFFLINE"])
  {
    int v4 = 237;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)appType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_appType;
  }
  else {
    return 0;
  }
}

- (void)setAppType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_appType = a3;
}

- (void)setHasAppType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAppType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)appTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8478[a3];
  }

  return v3;
}

- (int)StringAsAppType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FIRST_PARTY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SECOND_PARTY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DAEMONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"END_SENTINEL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)usageBool
{
  return self->_usageBool;
}

- (void)setUsageBool:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_usageBool = a3;
}

- (void)setHasUsageBool:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasUsageBool
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasUsageString
{
  return self->_usageString != 0;
}

- (NSString)usageString
{
  return self->_usageString;
}

- (void)setUsageString:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODailyUseSummaryUseEvent;
  int v4 = [(GEODailyUseSummaryUseEvent *)&v8 description];
  uint64_t v5 = [(GEODailyUseSummaryUseEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODailyUseSummaryUseEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 4) != 0)
    {
      v6 = @"UNKNOWN_EVENT";
      switch(*(_DWORD *)(a1 + 24))
      {
        case 0:
          break;
        case 1:
          v6 = @"ACCIDENT_CONFIRMATION";
          break;
        case 2:
          v6 = @"ACCIDENT_SUBMISSION";
          break;
        case 3:
          v6 = @"ADD_LICENSE_PLATE";
          break;
        case 4:
          v6 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
          break;
        case 5:
          v6 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
          break;
        case 6:
          v6 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
          break;
        case 7:
          v6 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
          break;
        case 8:
          v6 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
          break;
        case 9:
          v6 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
          break;
        case 0xA:
          v6 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
          break;
        case 0xB:
          v6 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
          break;
        case 0xC:
          v6 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
          break;
        case 0xD:
          v6 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
          break;
        case 0xE:
          v6 = @"ANNOUNCEMENT_TAPPED_GENERAL";
          break;
        case 0xF:
          v6 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
          break;
        case 0x10:
          v6 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
          break;
        case 0x11:
          v6 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
          break;
        case 0x12:
          v6 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
          break;
        case 0x13:
          v6 = @"ANNOUNCEMENT_TAPPED_VENUES";
          break;
        case 0x14:
          v6 = @"APP_CLIP_USED";
          break;
        case 0x15:
          v6 = @"AR_MODE_ENTER";
          break;
        case 0x16:
          v6 = @"AUTOCOMPLETE_RESULTS_SHOWN";
          break;
        case 0x17:
          v6 = @"CARPLAY_CONNECTED";
          break;
        case 0x18:
          v6 = @"COARSE_LOCATION_USED";
          break;
        case 0x19:
          v6 = @"COLLECTION_CREATED";
          break;
        case 0x1A:
          v6 = @"COLLECTION_ITEM_TAPPED";
          break;
        case 0x1B:
          v6 = @"COLLECTION_SHARED";
          break;
        case 0x1C:
          v6 = @"COLLECTION_SHOWN";
          break;
        case 0x1D:
          v6 = @"CURATED_COLLECTION_ITEM_TAPPED";
          break;
        case 0x1E:
          v6 = @"CURATED_COLLECTION_REMOVED";
          break;
        case 0x1F:
          v6 = @"CURATED_COLLECTION_SAVED";
          break;
        case 0x20:
          v6 = @"CURATED_COLLECTION_SHARED";
          break;
        case 0x21:
          v6 = @"CURATED_COLLECTION_SHOWN";
          break;
        case 0x22:
          v6 = @"DEVICE_CONNECTED";
          break;
        case 0x23:
          v6 = @"DIRECTIONS";
          break;
        case 0x24:
          v6 = @"DIRECTIONS_REQUESTED_CYCLING";
          break;
        case 0x25:
          v6 = @"DIRECTIONS_REQUESTED_DRIVING";
          break;
        case 0x26:
          v6 = @"DIRECTIONS_REQUESTED_EBIKE";
          break;
        case 0x27:
          v6 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
          break;
        case 0x28:
          v6 = @"DIRECTIONS_REQUESTED_TRANSIT";
          break;
        case 0x29:
          v6 = @"DIRECTIONS_REQUESTED_WALKING";
          break;
        case 0x2A:
          v6 = @"DIRECTIONS_SAFARI";
          break;
        case 0x2B:
          v6 = @"DIRECTIONS_SIRI_PLACECARD";
          break;
        case 0x2C:
          v6 = @"DIRECTIONS_SPOTLIGHT";
          break;
        case 0x2D:
          v6 = @"ENTER_MAPS_CARPLAY";
          break;
        case 0x2E:
          v6 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 0x2F:
          v6 = @"ETA_RECEIVED";
          break;
        case 0x30:
          v6 = @"ETA_SHARED";
          break;
        case 0x31:
          v6 = @"FAVORITE_ADD_PLACE";
          break;
        case 0x32:
          v6 = @"FAVORITE_TAP_LIST_ITEM";
          break;
        case 0x33:
          v6 = @"FLYOVER_FOREGROUNDED";
          break;
        case 0x34:
          v6 = @"INCIDENT_SUBMISSION";
          break;
        case 0x35:
          v6 = @"LOOK_AROUND_FOREGROUNDED";
          break;
        case 0x36:
          v6 = @"LOOK_AROUND_SHARED";
          break;
        case 0x37:
          v6 = @"MAPSHOME_GET_DIRECTIONS";
          break;
        case 0x38:
          v6 = @"MAPS_HANDOFF_FROM_IPAD";
          break;
        case 0x39:
          v6 = @"MAPS_HANDOFF_FROM_MAC";
          break;
        case 0x3A:
          v6 = @"MAPS_HANDOFF_FROM_PHONE";
          break;
        case 0x3B:
          v6 = @"MAPS_HANDOFF_FROM_WATCH";
          break;
        case 0x3C:
          v6 = @"MAP_VIEW_FOREGROUNDED";
          break;
        case 0x3D:
          v6 = @"NAV_SESSION_COARSE_LOCATION";
          break;
        case 0x3E:
          v6 = @"NAV_SESSION_PRECISE_LOCATION";
          break;
        case 0x3F:
          v6 = @"NAV_STARTED_CARPLAY";
          break;
        case 0x40:
          v6 = @"NAV_STARTED_CYCLING";
          break;
        case 0x41:
          v6 = @"NAV_STARTED_DRIVING";
          break;
        case 0x42:
          v6 = @"NAV_STARTED_EBIKE";
          break;
        case 0x43:
          v6 = @"NAV_STARTED_EV_ROUTING";
          break;
        case 0x44:
          v6 = @"NAV_STARTED_JUNCTION_VIEW";
          break;
        case 0x45:
          v6 = @"NAV_STARTED_LANE_GUIDANCE";
          break;
        case 0x46:
          v6 = @"NAV_STARTED_TRANSIT";
          break;
        case 0x47:
          v6 = @"NAV_STARTED_WALKING";
          break;
        case 0x48:
          v6 = @"OPEN_INDOOR_MAP";
          break;
        case 0x49:
          v6 = @"OTHER_GET_DIRECTIONS";
          break;
        case 0x4A:
          v6 = @"PLACECARD_GET_DIRECTIONS";
          break;
        case 0x4B:
          v6 = @"PLACECARD_RICH_DATA_USED";
          break;
        case 0x4C:
          v6 = @"PLACECARD_SHARED";
          break;
        case 0x4D:
          v6 = @"PLACECARD_SHOWN";
          break;
        case 0x4E:
          v6 = @"PLACECARD_SHOWN_SAFARI";
          break;
        case 0x4F:
          v6 = @"PLACECARD_SHOWN_SIRI";
          break;
        case 0x50:
          v6 = @"PLACECARD_SHOWN_SPOTLIGHT";
          break;
        case 0x51:
          v6 = @"PLACECARD_START_NAV";
          break;
        case 0x52:
          v6 = @"PROMINENT_GET_DIRECTIONS";
          break;
        case 0x53:
          v6 = @"RAP_STARTED";
          break;
        case 0x54:
          v6 = @"RIDESHARE_REQUESTED";
          break;
        case 0x55:
          v6 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
          break;
        case 0x56:
          v6 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
          break;
        case 0x57:
          v6 = @"SEARCH_RECENT_SEARCHES_TAPPED";
          break;
        case 0x58:
          v6 = @"SEARCH_RESULTS_SHOWN_MAPS";
          break;
        case 0x59:
          v6 = @"SEARCH_RESULTS_SHOWN_SAFARI";
          break;
        case 0x5A:
          v6 = @"SEARCH_RESULTS_SHOWN_SIRI";
          break;
        case 0x5B:
          v6 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
          break;
        case 0x5C:
          v6 = @"SEARCH_RESULTS_TAPPED_SAFARI";
          break;
        case 0x5D:
          v6 = @"SEARCH_RESULTS_TAPPED_SIRI";
          break;
        case 0x5E:
          v6 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
          break;
        case 0x5F:
          v6 = @"SEARCH_RESULT_TAPPED_MAPS";
          break;
        case 0x60:
          v6 = @"SEARCH_SUGGESTION_TAPPED";
          break;
        case 0x61:
          v6 = @"SHARE_DRIVING_ROUTES";
          break;
        case 0x62:
          v6 = @"SHARE_FAVORITES";
          break;
        case 0x63:
          v6 = @"SHARE_MYLOCATION";
          break;
        case 0x64:
          v6 = @"SHARE_TO_DEVICE";
          break;
        case 0x65:
          v6 = @"SHARE_TRANSIT_ROUTES";
          break;
        case 0x66:
          v6 = @"SHARE_WALKING_ROUTES";
          break;
        case 0x67:
          v6 = @"SHOW_MAPS_SETTINGS";
          break;
        case 0x68:
          v6 = @"SIRI_START_NAV";
          break;
        case 0x69:
          v6 = @"SNAPSHOTTER_USED";
          break;
        case 0x6A:
          v6 = @"TAP_COMPASS_MODE";
          break;
        case 0x6B:
          v6 = @"UGC_PHOTO_SUBMISSION";
          break;
        case 0x6C:
          v6 = @"UGC_RATING_SUBMISSION";
          break;
        case 0x6D:
          v6 = @"VLF_CORRECTION_ATTEMPTED";
          break;
        case 0x6E:
          v6 = @"VLF_CORRECTION_FAILED";
          break;
        case 0x6F:
          v6 = @"VLF_CORRECTION_SUCCESS";
          break;
        case 0x70:
          v6 = @"WIDGET_ENTER";
          break;
        case 0x71:
          v6 = @"JUNCTION_VIEW_SHOWN";
          break;
        case 0x72:
          v6 = @"ETA_SHARED_DRIVING";
          break;
        case 0x73:
          v6 = @"ETA_SHARED_WALKING";
          break;
        case 0x74:
          v6 = @"ETA_SHARED_CYCLING";
          break;
        case 0x75:
          v6 = @"MAPS_HANDOFF";
          break;
        case 0x76:
          v6 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
          break;
        case 0x77:
          v6 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 0x78:
          v6 = @"AR_WALKING_LOCALIZATION_SUCCESS";
          break;
        case 0x79:
          v6 = @"CURATED_COLLECTIONS_HOME_SHOWN";
          break;
        case 0x7A:
          v6 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
          break;
        case 0x7B:
          v6 = @"NEARBY_TRANSIT_SHOWN";
          break;
        case 0x7C:
          v6 = @"NEARBY_TRANSIT_TAPPED";
          break;
        case 0x7D:
          v6 = @"SPR_GLOBE_EXPLORED";
          break;
        case 0x7E:
          v6 = @"SPR_METROS_EXPLORED";
          break;
        case 0x7F:
          v6 = @"TRANSIT_DETAILS_USED";
          break;
        case 0x80:
          v6 = @"USER_ACCOUNT_OPENED_ACCOUNT";
          break;
        case 0x81:
          v6 = @"USER_ACCOUNT_SHOWN";
          break;
        case 0x82:
          v6 = @"MAP_MODE_DRIVING_SELECTED";
          break;
        case 0x83:
          v6 = @"MAP_MODE_EXPLORE_SELECTED";
          break;
        case 0x84:
          v6 = @"MAP_MODE_TRANSIT_SELECTED";
          break;
        case 0x85:
          v6 = @"MAP_MODE_SATELLITE_SELECTED";
          break;
        case 0x86:
          v6 = @"MAP_MODE_DRIVING_USED";
          break;
        case 0x87:
          v6 = @"MAP_MODE_EXPLORE_USED";
          break;
        case 0x88:
          v6 = @"MAP_MODE_TRANSIT_USED";
          break;
        case 0x89:
          v6 = @"MAP_MODE_SATELLITE_USED";
          break;
        case 0x8A:
          v6 = @"WATCH_GET_DIRECTIONS_CYCLING";
          break;
        case 0x8B:
          v6 = @"WATCH_START_NAV_CYCLING";
          break;
        case 0x8C:
          v6 = @"WATCH_GET_DIRECTIONS_WALKING";
          break;
        case 0x8D:
          v6 = @"WATCH_START_NAV_WALKING";
          break;
        case 0x8E:
          v6 = @"WATCH_GET_DIRECTIONS_TRANSIT";
          break;
        case 0x8F:
          v6 = @"WATCH_START_NAV_TRANSIT";
          break;
        case 0x90:
          v6 = @"WATCH_GET_DIRECTIONS_DRIVING";
          break;
        case 0x91:
          v6 = @"WATCH_START_NAV_DRIVING";
          break;
        case 0x92:
          v6 = @"ETA_SHARED_TRANSIT";
          break;
        case 0x93:
          v6 = @"USER_ACCOUNT_OPENED";
          break;
        case 0x94:
          v6 = @"VENUE_INTERACTION";
          break;
        case 0x95:
          v6 = @"ENTER_MAPS";
          break;
        case 0x96:
          v6 = @"EXIT_MAPS";
          break;
        case 0x97:
          v6 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
          break;
        case 0x98:
          v6 = @"ENTER_MAPS_DEVICE";
          break;
        case 0x99:
          v6 = @"MAP_VIEW_INSTANTIATED";
          break;
        case 0x9A:
          v6 = @"MAP_VIEW_ACTIVATED";
          break;
        case 0x9B:
          v6 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
          break;
        case 0x9C:
          v6 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
          break;
        case 0x9D:
          v6 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
          break;
        case 0x9E:
          v6 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
          break;
        case 0x9F:
          v6 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
          break;
        case 0xA0:
          v6 = @"SIRI_SEARCH_CARPLAY_UI";
          break;
        case 0xA1:
          v6 = @"OPEN_KEYBOARD_CARPLAY_UI";
          break;
        case 0xA2:
          v6 = @"TAP_SEARCH_CARPLAY_UI";
          break;
        case 0xA3:
          v6 = @"OPEN_SEARCH_CARPLAY_UI";
          break;
        case 0xA4:
          v6 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
          break;
        case 0xA5:
          v6 = @"EXIT_MAPS_CARPLAY";
          break;
        case 0xA6:
          v6 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
          break;
        case 0xA7:
          v6 = @"NAV_FEEDBACK_DRIVING";
          break;
        case 0xA8:
          v6 = @"TRIP_COMPLETED_DRIVING";
          break;
        case 0xA9:
          v6 = @"HAS_REROUTE_DRIVING";
          break;
        case 0xAA:
          v6 = @"ETA_OVERESTIMATE_DRIVING";
          break;
        case 0xAB:
          v6 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
          break;
        case 0xAC:
          v6 = @"ETA_UNDERESTIMATE_DRIVING";
          break;
        case 0xAD:
          v6 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
          break;
        case 0xAE:
          v6 = @"RAP_GOOD_TRIP";
          break;
        case 0xAF:
          v6 = @"ENRICHED_RESULTS_SHOWN_MAPS";
          break;
        case 0xB0:
          v6 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 0xB1:
          v6 = @"ADD_STOP_CARPLAY";
          break;
        case 0xB2:
          v6 = @"ADD_STOP_CARPLAY_SIRI";
          break;
        case 0xB3:
          v6 = @"ADD_STOP_DEVICE";
          break;
        case 0xB4:
          v6 = @"ADD_STOP_DEVICE_SIRI";
          break;
        case 0xB5:
          v6 = @"SHOWCASE_SHOWN";
          break;
        case 0xB6:
          v6 = @"SHOWCASE_TAPPED";
          break;
        case 0xB7:
          v6 = @"PUNCH_IN_SIRI";
          break;
        case 0xB8:
          v6 = @"PUNCH_IN_SAFARI";
          break;
        case 0xB9:
          v6 = @"PUNCH_IN_SPOTLIGHT";
          break;
        case 0xBA:
          v6 = @"PUNCH_IN_SMS";
          break;
        case 0xBB:
          v6 = @"PUNCH_IN_FINDMY";
          break;
        case 0xBC:
          v6 = @"PUNCH_IN_OTHER_2ND_PARTY";
          break;
        case 0xBD:
          v6 = @"PUNCH_IN_3RD_PARTY";
          break;
        case 0xBF:
          v6 = @"RAP_SUBMITTED";
          break;
        case 0xC0:
          v6 = @"ARP_PHOTO_SUBMISSION";
          break;
        case 0xC1:
          v6 = @"ARP_RATING_SUBMISSION";
          break;
        case 0xC2:
          v6 = @"TRAFFIC_INCIDENT_REPORT";
          break;
        case 0xC3:
          v6 = @"TRAFFIC_INCIDENT_CONFIRM";
          break;
        case 0xC4:
          v6 = @"TRAFFIC_INCIDENT_DISMISS";
          break;
        case 0xC5:
          v6 = @"TRAFFIC_INCIDENT_CLEAR";
          break;
        case 0xC6:
          v6 = @"MODERN_MAP_EXPLORED";
          break;
        case 0xC7:
          v6 = @"CARPLAY_ROUTING_UI_USED";
          break;
        case 0xC8:
          v6 = @"CARPLAY_SEARCH_UI_USED";
          break;
        case 0xC9:
          v6 = @"ANNOUNCEMENT_DISPLAYED";
          break;
        case 0xCA:
          v6 = @"ANNOUNCEMENT_TAPPED";
          break;
        case 0xCB:
          v6 = @"POSITIVE_SEARCH_ENGAGEMENT";
          break;
        case 0xCC:
          v6 = @"PUNCH_OUT_FINDMY";
          break;
        case 0xCD:
          v6 = @"WATCH_START_NAV";
          break;
        case 0xCE:
          v6 = @"HIKING_ENGAGEMENT";
          break;
        case 0xCF:
          v6 = @"HIKING_PLACECARD";
          break;
        case 0xD0:
          v6 = @"NO_SEARCH_RESULTS";
          break;
        case 0xD1:
          v6 = @"PUNCH_IN_SHOWCASE";
          break;
        case 0xD2:
          v6 = @"SHARED_LOCATION_ENGAGEMENT";
          break;
        case 0xD3:
          v6 = @"SHARE_SHOWCASE";
          break;
        case 0xD4:
          v6 = @"WATCH_MAP_VIEW";
          break;
        case 0xD5:
          v6 = @"WATCH_PLACECARD";
          break;
        case 0xD6:
          v6 = @"WATCH_SEARCH";
          break;
        case 0xD7:
          v6 = @"CURATED_HIKE_SAVED";
          break;
        case 0xD8:
          v6 = @"CUSTOM_HIKE_SAVED";
          break;
        case 0xD9:
          v6 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
          break;
        case 0xDA:
          v6 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
          break;
        case 0xDB:
          v6 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
          break;
        case 0xDC:
          v6 = @"NAV_STARTED_CURATED_HIKE";
          break;
        case 0xDD:
          v6 = @"NAV_STARTED_CUSTOM_HIKE";
          break;
        case 0xDE:
          v6 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
          break;
        case 0xDF:
          v6 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
          break;
        case 0xE0:
          v6 = @"SEARCH_PHOTO_INTERACTION";
          break;
        case 0xE1:
          v6 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 0xE2:
          v6 = @"LIBRARY_INTERACTION";
          break;
        case 0xE3:
          v6 = @"SEARCH_FILTER_INTERACTION";
          break;
        case 0xE4:
          v6 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
          break;
        case 0xE5:
          v6 = @"CARPLAY_CONNECTED_OFFLINE";
          break;
        case 0xE6:
          v6 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
          break;
        case 0xE7:
          v6 = @"DIRECTIONS_OFFLINE";
          break;
        case 0xE8:
          v6 = @"ENTER_MAPS_DEVICE_OFFLINE";
          break;
        case 0xE9:
          v6 = @"NO_SEARCH_RESULTS_OFFLINE";
          break;
        case 0xEA:
          v6 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
          break;
        case 0xEB:
          v6 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
          break;
        case 0xEC:
          v6 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
          break;
        case 0xED:
          v6 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v7 = @"eventType";
      }
      else {
        v7 = @"event_type";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      uint64_t v8 = *(int *)(a1 + 16);
      if (v8 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53F8478[v8];
      }
      if (a2) {
        v10 = @"appType";
      }
      else {
        v10 = @"app_type";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v11 forKey:@"count"];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 8) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      [v4 setObject:v12 forKey:@"usageBool"];
    }
    v13 = [(id)a1 usageString];
    if (v13) {
      [v4 setObject:v13 forKey:@"usageString"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODailyUseSummaryUseEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODailyUseSummaryUseEvent)initWithDictionary:(id)a3
{
  return (GEODailyUseSummaryUseEvent *)-[GEODailyUseSummaryUseEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_512;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_512;
  }
  if (a3) {
    v6 = @"eventType";
  }
  else {
    v6 = @"event_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_EVENT"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ACCIDENT_CONFIRMATION"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ACCIDENT_SUBMISSION"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"ADD_LICENSE_PLATE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_FLYOVER"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_GENERAL"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_TRANSIT"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_UNKNOWN"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED_VENUES"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_FLYOVER"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_GENERAL"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_LOOK_AROUND"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_TRANSIT"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_UNKNOWN"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED_VENUES"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"APP_CLIP_USED"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"AR_MODE_ENTER"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"AUTOCOMPLETE_RESULTS_SHOWN"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"CARPLAY_CONNECTED"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"COARSE_LOCATION_USED"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"COLLECTION_CREATED"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"COLLECTION_ITEM_TAPPED"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"COLLECTION_SHARED"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"COLLECTION_SHOWN"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION_ITEM_TAPPED"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION_REMOVED"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION_SAVED"])
    {
      uint64_t v9 = 31;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION_SHARED"])
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTION_SHOWN"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"DEVICE_CONNECTED"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_CYCLING"])
    {
      uint64_t v9 = 36;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_DRIVING"])
    {
      uint64_t v9 = 37;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_EBIKE"])
    {
      uint64_t v9 = 38;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_EV_ROUTING"])
    {
      uint64_t v9 = 39;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_TRANSIT"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_WALKING"])
    {
      uint64_t v9 = 41;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_SAFARI"])
    {
      uint64_t v9 = 42;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_SIRI_PLACECARD"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_SPOTLIGHT"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"ENTER_MAPS_CARPLAY"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"ENTER_VENUE_EXPERIENCE"])
    {
      uint64_t v9 = 46;
    }
    else if ([v8 isEqualToString:@"ETA_RECEIVED"])
    {
      uint64_t v9 = 47;
    }
    else if ([v8 isEqualToString:@"ETA_SHARED"])
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"FAVORITE_ADD_PLACE"])
    {
      uint64_t v9 = 49;
    }
    else if ([v8 isEqualToString:@"FAVORITE_TAP_LIST_ITEM"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"FLYOVER_FOREGROUNDED"])
    {
      uint64_t v9 = 51;
    }
    else if ([v8 isEqualToString:@"INCIDENT_SUBMISSION"])
    {
      uint64_t v9 = 52;
    }
    else if ([v8 isEqualToString:@"LOOK_AROUND_FOREGROUNDED"])
    {
      uint64_t v9 = 53;
    }
    else if ([v8 isEqualToString:@"LOOK_AROUND_SHARED"])
    {
      uint64_t v9 = 54;
    }
    else if ([v8 isEqualToString:@"MAPSHOME_GET_DIRECTIONS"])
    {
      uint64_t v9 = 55;
    }
    else if ([v8 isEqualToString:@"MAPS_HANDOFF_FROM_IPAD"])
    {
      uint64_t v9 = 56;
    }
    else if ([v8 isEqualToString:@"MAPS_HANDOFF_FROM_MAC"])
    {
      uint64_t v9 = 57;
    }
    else if ([v8 isEqualToString:@"MAPS_HANDOFF_FROM_PHONE"])
    {
      uint64_t v9 = 58;
    }
    else if ([v8 isEqualToString:@"MAPS_HANDOFF_FROM_WATCH"])
    {
      uint64_t v9 = 59;
    }
    else if ([v8 isEqualToString:@"MAP_VIEW_FOREGROUNDED"])
    {
      uint64_t v9 = 60;
    }
    else if ([v8 isEqualToString:@"NAV_SESSION_COARSE_LOCATION"])
    {
      uint64_t v9 = 61;
    }
    else if ([v8 isEqualToString:@"NAV_SESSION_PRECISE_LOCATION"])
    {
      uint64_t v9 = 62;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_CARPLAY"])
    {
      uint64_t v9 = 63;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_CYCLING"])
    {
      uint64_t v9 = 64;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_DRIVING"])
    {
      uint64_t v9 = 65;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_EBIKE"])
    {
      uint64_t v9 = 66;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_EV_ROUTING"])
    {
      uint64_t v9 = 67;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_JUNCTION_VIEW"])
    {
      uint64_t v9 = 68;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_LANE_GUIDANCE"])
    {
      uint64_t v9 = 69;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_TRANSIT"])
    {
      uint64_t v9 = 70;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_WALKING"])
    {
      uint64_t v9 = 71;
    }
    else if ([v8 isEqualToString:@"OPEN_INDOOR_MAP"])
    {
      uint64_t v9 = 72;
    }
    else if ([v8 isEqualToString:@"OTHER_GET_DIRECTIONS"])
    {
      uint64_t v9 = 73;
    }
    else if ([v8 isEqualToString:@"PLACECARD_GET_DIRECTIONS"])
    {
      uint64_t v9 = 74;
    }
    else if ([v8 isEqualToString:@"PLACECARD_RICH_DATA_USED"])
    {
      uint64_t v9 = 75;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHARED"])
    {
      uint64_t v9 = 76;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHOWN"])
    {
      uint64_t v9 = 77;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHOWN_SAFARI"])
    {
      uint64_t v9 = 78;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHOWN_SIRI"])
    {
      uint64_t v9 = 79;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHOWN_SPOTLIGHT"])
    {
      uint64_t v9 = 80;
    }
    else if ([v8 isEqualToString:@"PLACECARD_START_NAV"])
    {
      uint64_t v9 = 81;
    }
    else if ([v8 isEqualToString:@"PROMINENT_GET_DIRECTIONS"])
    {
      uint64_t v9 = 82;
    }
    else if ([v8 isEqualToString:@"RAP_STARTED"])
    {
      uint64_t v9 = 83;
    }
    else if ([v8 isEqualToString:@"RIDESHARE_REQUESTED"])
    {
      uint64_t v9 = 84;
    }
    else if ([v8 isEqualToString:@"SEARCH_NEARBY_CATEGORY_TAPPED"])
    {
      uint64_t v9 = 85;
    }
    else if ([v8 isEqualToString:@"SEARCH_RECENTLY_VIEWED_TAPPED"])
    {
      uint64_t v9 = 86;
    }
    else if ([v8 isEqualToString:@"SEARCH_RECENT_SEARCHES_TAPPED"])
    {
      uint64_t v9 = 87;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_SHOWN_MAPS"])
    {
      uint64_t v9 = 88;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_SHOWN_SAFARI"])
    {
      uint64_t v9 = 89;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_SHOWN_SIRI"])
    {
      uint64_t v9 = 90;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_SHOWN_SPOTLIGHT"])
    {
      uint64_t v9 = 91;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_TAPPED_SAFARI"])
    {
      uint64_t v9 = 92;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_TAPPED_SIRI"])
    {
      uint64_t v9 = 93;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_TAPPED_SPOTLIGHT"])
    {
      uint64_t v9 = 94;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULT_TAPPED_MAPS"])
    {
      uint64_t v9 = 95;
    }
    else if ([v8 isEqualToString:@"SEARCH_SUGGESTION_TAPPED"])
    {
      uint64_t v9 = 96;
    }
    else if ([v8 isEqualToString:@"SHARE_DRIVING_ROUTES"])
    {
      uint64_t v9 = 97;
    }
    else if ([v8 isEqualToString:@"SHARE_FAVORITES"])
    {
      uint64_t v9 = 98;
    }
    else if ([v8 isEqualToString:@"SHARE_MYLOCATION"])
    {
      uint64_t v9 = 99;
    }
    else if ([v8 isEqualToString:@"SHARE_TO_DEVICE"])
    {
      uint64_t v9 = 100;
    }
    else if ([v8 isEqualToString:@"SHARE_TRANSIT_ROUTES"])
    {
      uint64_t v9 = 101;
    }
    else if ([v8 isEqualToString:@"SHARE_WALKING_ROUTES"])
    {
      uint64_t v9 = 102;
    }
    else if ([v8 isEqualToString:@"SHOW_MAPS_SETTINGS"])
    {
      uint64_t v9 = 103;
    }
    else if ([v8 isEqualToString:@"SIRI_START_NAV"])
    {
      uint64_t v9 = 104;
    }
    else if ([v8 isEqualToString:@"SNAPSHOTTER_USED"])
    {
      uint64_t v9 = 105;
    }
    else if ([v8 isEqualToString:@"TAP_COMPASS_MODE"])
    {
      uint64_t v9 = 106;
    }
    else if ([v8 isEqualToString:@"UGC_PHOTO_SUBMISSION"])
    {
      uint64_t v9 = 107;
    }
    else if ([v8 isEqualToString:@"UGC_RATING_SUBMISSION"])
    {
      uint64_t v9 = 108;
    }
    else if ([v8 isEqualToString:@"VLF_CORRECTION_ATTEMPTED"])
    {
      uint64_t v9 = 109;
    }
    else if ([v8 isEqualToString:@"VLF_CORRECTION_FAILED"])
    {
      uint64_t v9 = 110;
    }
    else if ([v8 isEqualToString:@"VLF_CORRECTION_SUCCESS"])
    {
      uint64_t v9 = 111;
    }
    else if ([v8 isEqualToString:@"WIDGET_ENTER"])
    {
      uint64_t v9 = 112;
    }
    else if ([v8 isEqualToString:@"JUNCTION_VIEW_SHOWN"])
    {
      uint64_t v9 = 113;
    }
    else if ([v8 isEqualToString:@"ETA_SHARED_DRIVING"])
    {
      uint64_t v9 = 114;
    }
    else if ([v8 isEqualToString:@"ETA_SHARED_WALKING"])
    {
      uint64_t v9 = 115;
    }
    else if ([v8 isEqualToString:@"ETA_SHARED_CYCLING"])
    {
      uint64_t v9 = 116;
    }
    else if ([v8 isEqualToString:@"MAPS_HANDOFF"])
    {
      uint64_t v9 = 117;
    }
    else if ([v8 isEqualToString:@"AR_WALKING_LOCALIZATION_ATTEMPTED"])
    {
      uint64_t v9 = 118;
    }
    else if ([v8 isEqualToString:@"AR_WALKING_LOCALIZATION_FAILED"])
    {
      uint64_t v9 = 119;
    }
    else if ([v8 isEqualToString:@"AR_WALKING_LOCALIZATION_SUCCESS"])
    {
      uint64_t v9 = 120;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTIONS_HOME_SHOWN"])
    {
      uint64_t v9 = 121;
    }
    else if ([v8 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN"])
    {
      uint64_t v9 = 122;
    }
    else if ([v8 isEqualToString:@"NEARBY_TRANSIT_SHOWN"])
    {
      uint64_t v9 = 123;
    }
    else if ([v8 isEqualToString:@"NEARBY_TRANSIT_TAPPED"])
    {
      uint64_t v9 = 124;
    }
    else if ([v8 isEqualToString:@"SPR_GLOBE_EXPLORED"])
    {
      uint64_t v9 = 125;
    }
    else if ([v8 isEqualToString:@"SPR_METROS_EXPLORED"])
    {
      uint64_t v9 = 126;
    }
    else if ([v8 isEqualToString:@"TRANSIT_DETAILS_USED"])
    {
      uint64_t v9 = 127;
    }
    else if ([v8 isEqualToString:@"USER_ACCOUNT_OPENED_ACCOUNT"])
    {
      uint64_t v9 = 128;
    }
    else if ([v8 isEqualToString:@"USER_ACCOUNT_SHOWN"])
    {
      uint64_t v9 = 129;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_DRIVING_SELECTED"])
    {
      uint64_t v9 = 130;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_EXPLORE_SELECTED"])
    {
      uint64_t v9 = 131;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_TRANSIT_SELECTED"])
    {
      uint64_t v9 = 132;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_SATELLITE_SELECTED"])
    {
      uint64_t v9 = 133;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_DRIVING_USED"])
    {
      uint64_t v9 = 134;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_EXPLORE_USED"])
    {
      uint64_t v9 = 135;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_TRANSIT_USED"])
    {
      uint64_t v9 = 136;
    }
    else if ([v8 isEqualToString:@"MAP_MODE_SATELLITE_USED"])
    {
      uint64_t v9 = 137;
    }
    else if ([v8 isEqualToString:@"WATCH_GET_DIRECTIONS_CYCLING"])
    {
      uint64_t v9 = 138;
    }
    else if ([v8 isEqualToString:@"WATCH_START_NAV_CYCLING"])
    {
      uint64_t v9 = 139;
    }
    else if ([v8 isEqualToString:@"WATCH_GET_DIRECTIONS_WALKING"])
    {
      uint64_t v9 = 140;
    }
    else if ([v8 isEqualToString:@"WATCH_START_NAV_WALKING"])
    {
      uint64_t v9 = 141;
    }
    else if ([v8 isEqualToString:@"WATCH_GET_DIRECTIONS_TRANSIT"])
    {
      uint64_t v9 = 142;
    }
    else if ([v8 isEqualToString:@"WATCH_START_NAV_TRANSIT"])
    {
      uint64_t v9 = 143;
    }
    else if ([v8 isEqualToString:@"WATCH_GET_DIRECTIONS_DRIVING"])
    {
      uint64_t v9 = 144;
    }
    else if ([v8 isEqualToString:@"WATCH_START_NAV_DRIVING"])
    {
      uint64_t v9 = 145;
    }
    else if ([v8 isEqualToString:@"ETA_SHARED_TRANSIT"])
    {
      uint64_t v9 = 146;
    }
    else if ([v8 isEqualToString:@"USER_ACCOUNT_OPENED"])
    {
      uint64_t v9 = 147;
    }
    else if ([v8 isEqualToString:@"VENUE_INTERACTION"])
    {
      uint64_t v9 = 148;
    }
    else if ([v8 isEqualToString:@"ENTER_MAPS"])
    {
      uint64_t v9 = 149;
    }
    else if ([v8 isEqualToString:@"EXIT_MAPS"])
    {
      uint64_t v9 = 150;
    }
    else if ([v8 isEqualToString:@"TOTAL_SECONDS_IN_MAPS_DEVICE"])
    {
      uint64_t v9 = 151;
    }
    else if ([v8 isEqualToString:@"ENTER_MAPS_DEVICE"])
    {
      uint64_t v9 = 152;
    }
    else if ([v8 isEqualToString:@"MAP_VIEW_INSTANTIATED"])
    {
      uint64_t v9 = 153;
    }
    else if ([v8 isEqualToString:@"MAP_VIEW_ACTIVATED"])
    {
      uint64_t v9 = 154;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI"])
    {
      uint64_t v9 = 155;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_LIST_ITEM_CARPLAY_UI"])
    {
      uint64_t v9 = 156;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_FAVORITE_CARPLAY_UI"])
    {
      uint64_t v9 = 157;
    }
    else if ([v8 isEqualToString:@"GET_DIRECTIONS_CARPLAY_CONNECTED"])
    {
      uint64_t v9 = 158;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED"])
    {
      uint64_t v9 = 159;
    }
    else if ([v8 isEqualToString:@"SIRI_SEARCH_CARPLAY_UI"])
    {
      uint64_t v9 = 160;
    }
    else if ([v8 isEqualToString:@"OPEN_KEYBOARD_CARPLAY_UI"])
    {
      uint64_t v9 = 161;
    }
    else if ([v8 isEqualToString:@"TAP_SEARCH_CARPLAY_UI"])
    {
      uint64_t v9 = 162;
    }
    else if ([v8 isEqualToString:@"OPEN_SEARCH_CARPLAY_UI"])
    {
      uint64_t v9 = 163;
    }
    else if ([v8 isEqualToString:@"MAPS_SEARCH_CARPLAY_CONNECTED"])
    {
      uint64_t v9 = 164;
    }
    else if ([v8 isEqualToString:@"EXIT_MAPS_CARPLAY"])
    {
      uint64_t v9 = 165;
    }
    else if ([v8 isEqualToString:@"TOTAL_SECONDS_IN_MAPS_CARPLAY"])
    {
      uint64_t v9 = 166;
    }
    else if ([v8 isEqualToString:@"NAV_FEEDBACK_DRIVING"])
    {
      uint64_t v9 = 167;
    }
    else if ([v8 isEqualToString:@"TRIP_COMPLETED_DRIVING"])
    {
      uint64_t v9 = 168;
    }
    else if ([v8 isEqualToString:@"HAS_REROUTE_DRIVING"])
    {
      uint64_t v9 = 169;
    }
    else if ([v8 isEqualToString:@"ETA_OVERESTIMATE_DRIVING"])
    {
      uint64_t v9 = 170;
    }
    else if ([v8 isEqualToString:@"EXTREME_ETA_OVERESTIMATE_DRIVING"])
    {
      uint64_t v9 = 171;
    }
    else if ([v8 isEqualToString:@"ETA_UNDERESTIMATE_DRIVING"])
    {
      uint64_t v9 = 172;
    }
    else if ([v8 isEqualToString:@"EXTREME_ETA_UNDERESTIMATE_DRIVING"])
    {
      uint64_t v9 = 173;
    }
    else if ([v8 isEqualToString:@"RAP_GOOD_TRIP"])
    {
      uint64_t v9 = 174;
    }
    else if ([v8 isEqualToString:@"ENRICHED_RESULTS_SHOWN_MAPS"])
    {
      uint64_t v9 = 175;
    }
    else if ([v8 isEqualToString:@"TAP_TRANSIT_TIPKIT"])
    {
      uint64_t v9 = 176;
    }
    else if ([v8 isEqualToString:@"ADD_STOP_CARPLAY"])
    {
      uint64_t v9 = 177;
    }
    else if ([v8 isEqualToString:@"ADD_STOP_CARPLAY_SIRI"])
    {
      uint64_t v9 = 178;
    }
    else if ([v8 isEqualToString:@"ADD_STOP_DEVICE"])
    {
      uint64_t v9 = 179;
    }
    else if ([v8 isEqualToString:@"ADD_STOP_DEVICE_SIRI"])
    {
      uint64_t v9 = 180;
    }
    else if ([v8 isEqualToString:@"SHOWCASE_SHOWN"])
    {
      uint64_t v9 = 181;
    }
    else if ([v8 isEqualToString:@"SHOWCASE_TAPPED"])
    {
      uint64_t v9 = 182;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_SIRI"])
    {
      uint64_t v9 = 183;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_SAFARI"])
    {
      uint64_t v9 = 184;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_SPOTLIGHT"])
    {
      uint64_t v9 = 185;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_SMS"])
    {
      uint64_t v9 = 186;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_FINDMY"])
    {
      uint64_t v9 = 187;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_OTHER_2ND_PARTY"])
    {
      uint64_t v9 = 188;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_3RD_PARTY"])
    {
      uint64_t v9 = 189;
    }
    else if ([v8 isEqualToString:@"RAP_SUBMITTED"])
    {
      uint64_t v9 = 191;
    }
    else if ([v8 isEqualToString:@"ARP_PHOTO_SUBMISSION"])
    {
      uint64_t v9 = 192;
    }
    else if ([v8 isEqualToString:@"ARP_RATING_SUBMISSION"])
    {
      uint64_t v9 = 193;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_INCIDENT_REPORT"])
    {
      uint64_t v9 = 194;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_INCIDENT_CONFIRM"])
    {
      uint64_t v9 = 195;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_INCIDENT_DISMISS"])
    {
      uint64_t v9 = 196;
    }
    else if ([v8 isEqualToString:@"TRAFFIC_INCIDENT_CLEAR"])
    {
      uint64_t v9 = 197;
    }
    else if ([v8 isEqualToString:@"MODERN_MAP_EXPLORED"])
    {
      uint64_t v9 = 198;
    }
    else if ([v8 isEqualToString:@"CARPLAY_ROUTING_UI_USED"])
    {
      uint64_t v9 = 199;
    }
    else if ([v8 isEqualToString:@"CARPLAY_SEARCH_UI_USED"])
    {
      uint64_t v9 = 200;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_DISPLAYED"])
    {
      uint64_t v9 = 201;
    }
    else if ([v8 isEqualToString:@"ANNOUNCEMENT_TAPPED"])
    {
      uint64_t v9 = 202;
    }
    else if ([v8 isEqualToString:@"POSITIVE_SEARCH_ENGAGEMENT"])
    {
      uint64_t v9 = 203;
    }
    else if ([v8 isEqualToString:@"PUNCH_OUT_FINDMY"])
    {
      uint64_t v9 = 204;
    }
    else if ([v8 isEqualToString:@"WATCH_START_NAV"])
    {
      uint64_t v9 = 205;
    }
    else if ([v8 isEqualToString:@"HIKING_ENGAGEMENT"])
    {
      uint64_t v9 = 206;
    }
    else if ([v8 isEqualToString:@"HIKING_PLACECARD"])
    {
      uint64_t v9 = 207;
    }
    else if ([v8 isEqualToString:@"NO_SEARCH_RESULTS"])
    {
      uint64_t v9 = 208;
    }
    else if ([v8 isEqualToString:@"PUNCH_IN_SHOWCASE"])
    {
      uint64_t v9 = 209;
    }
    else if ([v8 isEqualToString:@"SHARED_LOCATION_ENGAGEMENT"])
    {
      uint64_t v9 = 210;
    }
    else if ([v8 isEqualToString:@"SHARE_SHOWCASE"])
    {
      uint64_t v9 = 211;
    }
    else if ([v8 isEqualToString:@"WATCH_MAP_VIEW"])
    {
      uint64_t v9 = 212;
    }
    else if ([v8 isEqualToString:@"WATCH_PLACECARD"])
    {
      uint64_t v9 = 213;
    }
    else if ([v8 isEqualToString:@"WATCH_SEARCH"])
    {
      uint64_t v9 = 214;
    }
    else if ([v8 isEqualToString:@"CURATED_HIKE_SAVED"])
    {
      uint64_t v9 = 215;
    }
    else if ([v8 isEqualToString:@"CUSTOM_HIKE_SAVED"])
    {
      uint64_t v9 = 216;
    }
    else if ([v8 isEqualToString:@"CUSTOM_HIKE_CREATION_TRAY_SHOWN"])
    {
      uint64_t v9 = 217;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_CURATED_HIKE"])
    {
      uint64_t v9 = 218;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUESTED_CUSTOM_HIKE"])
    {
      uint64_t v9 = 219;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_CURATED_HIKE"])
    {
      uint64_t v9 = 220;
    }
    else if ([v8 isEqualToString:@"NAV_STARTED_CUSTOM_HIKE"])
    {
      uint64_t v9 = 221;
    }
    else if ([v8 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE_SHOWN"])
    {
      uint64_t v9 = 222;
    }
    else if ([v8 isEqualToString:@"ROUTING_TRAY_CUSTOM_HIKE_SHOWN"])
    {
      uint64_t v9 = 223;
    }
    else if ([v8 isEqualToString:@"SEARCH_PHOTO_INTERACTION"])
    {
      uint64_t v9 = 224;
    }
    else if ([v8 isEqualToString:@"COMPLETE_DOWNLOAD_OFFLINE_MAPS"])
    {
      uint64_t v9 = 225;
    }
    else if ([v8 isEqualToString:@"LIBRARY_INTERACTION"])
    {
      uint64_t v9 = 226;
    }
    else if ([v8 isEqualToString:@"SEARCH_FILTER_INTERACTION"])
    {
      uint64_t v9 = 227;
    }
    else if ([v8 isEqualToString:@"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE"])
    {
      uint64_t v9 = 228;
    }
    else if ([v8 isEqualToString:@"CARPLAY_CONNECTED_OFFLINE"])
    {
      uint64_t v9 = 229;
    }
    else if ([v8 isEqualToString:@"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE"])
    {
      uint64_t v9 = 230;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_OFFLINE"])
    {
      uint64_t v9 = 231;
    }
    else if ([v8 isEqualToString:@"ENTER_MAPS_DEVICE_OFFLINE"])
    {
      uint64_t v9 = 232;
    }
    else if ([v8 isEqualToString:@"NO_SEARCH_RESULTS_OFFLINE"])
    {
      uint64_t v9 = 233;
    }
    else if ([v8 isEqualToString:@"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE"])
    {
      uint64_t v9 = 234;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE"])
    {
      uint64_t v9 = 235;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULT_TAPPED_MAPS_OFFLINE"])
    {
      uint64_t v9 = 236;
    }
    else if ([v8 isEqualToString:@"TAP_DOWNLOAD_MAPS_OFFLINE"])
    {
      uint64_t v9 = 237;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_486;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setEventType:v9];
LABEL_486:

  if (a3) {
    v10 = @"appType";
  }
  else {
    v10 = @"app_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"FIRST_PARTY"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"SECOND_PARTY"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"THIRD_PARTY"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"DAEMONS"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"END_SENTINEL"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_504;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_504:
    [a1 setAppType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));
  }

  v15 = [v5 objectForKeyedSubscript:@"usageBool"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUsageBool:", objc_msgSend(v15, "BOOLValue"));
  }

  v16 = [v5 objectForKeyedSubscript:@"usageString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 copy];
    [a1 setUsageString:v17];
  }
LABEL_512:

  return a1;
}

- (GEODailyUseSummaryUseEvent)initWithJSON:(id)a3
{
  return (GEODailyUseSummaryUseEvent *)-[GEODailyUseSummaryUseEvent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEODailyUseSummaryUseEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODailyUseSummaryUseEventReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_usageString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEODailyUseSummaryUseEvent *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_eventType;
    *((unsigned char *)v6 + 32) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 4) = self->_appType;
  *((unsigned char *)v6 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v6 + 5) = self->_count;
  *((unsigned char *)v6 + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v6 + 28) = self->_usageBool;
    *((unsigned char *)v6 + 32) |= 8u;
  }
LABEL_6:
  if (self->_usageString)
  {
    objc_msgSend(v6, "setUsageString:");
    id v4 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEODailyUseSummaryUseEvent *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_appType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_count != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    char v5 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 32) & 8) == 0) {
    goto LABEL_21;
  }
  if (!self->_usageBool)
  {
    if (!*((unsigned char *)v4 + 28)) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  if (!*((unsigned char *)v4 + 28)) {
    goto LABEL_21;
  }
LABEL_27:
  usageString = self->_usageString;
  if ((unint64_t)usageString | *((void *)v4 + 1)) {
    char v5 = -[NSString isEqual:](usageString, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEODailyUseSummaryUseEvent *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_eventType;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_appType;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_usageString hash];
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_count;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_usageBool;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_usageString hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 32);
  if ((v5 & 4) != 0)
  {
    self->_eventType = *((_DWORD *)v6 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v6 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v6 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_appType = *((_DWORD *)v6 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  char v5 = *((unsigned char *)v6 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_count = *((_DWORD *)v6 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v6 + 32) & 8) != 0)
  {
LABEL_5:
    self->_usageBool = *((unsigned char *)v6 + 28);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
  if (*((void *)v6 + 1))
  {
    -[GEODailyUseSummaryUseEvent setUsageString:](self, "setUsageString:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end