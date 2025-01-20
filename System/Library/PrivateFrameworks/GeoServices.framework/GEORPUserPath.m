@interface GEORPUserPath
+ (BOOL)isValid:(id)a3;
+ (Class)webPathType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPUserPath)init;
- (GEORPUserPath)initWithData:(id)a3;
- (GEORPUserPath)initWithDictionary:(id)a3;
- (GEORPUserPath)initWithJSON:(id)a3;
- (NSMutableArray)webPaths;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)nativePathsAsString:(int)a3;
- (id)webPathAtIndex:(unint64_t)a3;
- (int)StringAsNativePaths:(id)a3;
- (int)nativePathAtIndex:(unint64_t)a3;
- (int)nativePaths;
- (unint64_t)hash;
- (unint64_t)nativePathsCount;
- (unint64_t)webPathsCount;
- (void)_addNoFlagsWebPath:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readNativePaths;
- (void)_readWebPaths;
- (void)addNativePath:(int)a3;
- (void)addWebPath:(id)a3;
- (void)clearNativePaths;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWebPaths;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setNativePaths:(int *)a3 count:(unint64_t)a4;
- (void)setWebPaths:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPUserPath

- (unint64_t)webPathsCount
{
  -[GEORPUserPath _readWebPaths]((uint64_t)self);
  webPaths = self->_webPaths;

  return [(NSMutableArray *)webPaths count];
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v6 = a1 + 3;
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if ((int)v8 > 1000)
          {
            if ((int)v8 > 1600)
            {
              switch((int)v8)
              {
                case 1700:
                  v9 = @"LOOK_AROUND_PIP";
                  break;
                case 1701:
                  v9 = @"LOOK_AROUND_ACTION_SHEET";
                  break;
                case 1702:
                  v9 = @"LOOK_AROUND_VIEW";
                  break;
                case 1703:
                  v9 = @"LOOK_AROUND_PLATTER";
                  break;
                case 1704:
                  v9 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
                  break;
                case 1705:
                  v9 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
                  break;
                case 1706:
                  v9 = @"LOOK_AROUND_VIEW_PLACECARD";
                  break;
                case 1707:
                  v9 = @"LOOK_AROUND_PIP_PLACECARD";
                  break;
                case 1708:
                  v9 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
                  break;
                default:
                  if (v8 == 1601)
                  {
                    v9 = @"MENU_ITEM_DARK_MAP";
                  }
                  else
                  {
LABEL_29:
                    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
                    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  break;
              }
            }
            else
            {
              switch((int)v8)
              {
                case 1001:
                  v9 = @"CARPLAY_NAV";
                  break;
                case 1002:
                  v9 = @"CARPLAY_EXPLORE";
                  break;
                case 1003:
                  v9 = @"CARPLAY_DESTINATIONS";
                  break;
                case 1004:
                  v9 = @"CARPLAY_TRAFFIC_INCIDENT";
                  break;
                case 1005:
                  v9 = @"CARPLAY_CONTROL";
                  break;
                case 1006:
                  v9 = @"CARPLAY_PROACTIVE";
                  break;
                case 1007:
                  v9 = @"CARPLAY_ROUTING";
                  break;
                case 1008:
                  v9 = @"CARPLAY_MORE_ROUTES";
                  break;
                case 1009:
                  v9 = @"CARPLAY_SEARCH_ALONG_ROUTE";
                  break;
                case 1010:
                  v9 = @"CARPLAY_SEARCH";
                  break;
                case 1011:
                  v9 = @"CARPLAY_SEARCH_RESULTS";
                  break;
                case 1012:
                  v9 = @"CARPLAY_FAVORITES";
                  break;
                case 1013:
                  v9 = @"CARPLAY_NAV_CONFIRMATION";
                  break;
                case 1014:
                  v9 = @"CARPLAY_DESTINATION_SHARING";
                  break;
                case 1015:
                  v9 = @"CARPLAY_NOTIFICATION_BATTERY";
                  break;
                case 1016:
                  v9 = @"CARPLAY_NOTIFICATION_DOOM";
                  break;
                case 1017:
                  v9 = @"CARPLAY_NOTIFICATION_FUEL";
                  break;
                case 1018:
                  v9 = @"CARPLAY_NOTIFICATION_HYBRID";
                  break;
                case 1019:
                  v9 = @"CARPLAY_SHARE_ETA_TRAY";
                  break;
                case 1020:
                  v9 = @"CARPLAY_ETA_UPDATE_TRAY";
                  break;
                case 1021:
                  v9 = @"CARPLAY_ACTION_TRAY";
                  break;
                case 1022:
                  v9 = @"CARPLAY_PLACECARD";
                  break;
                case 1023:
                  v9 = @"CARPLAY_KEYBOARD";
                  break;
                case 1024:
                  v9 = @"CARPLAY_UI_TARGET_UNKNOWN";
                  break;
                case 1025:
                  v9 = @"CARPLAY_EDIT_STOPS";
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
                  goto LABEL_29;
                case 1100:
                  v9 = @"RAP_DIRECTIONS_MENU";
                  break;
                case 1101:
                  v9 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
                  break;
                case 1102:
                  v9 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
                  break;
                case 1103:
                  v9 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
                  break;
                case 1104:
                  v9 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
                  break;
                case 1105:
                  v9 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
                  break;
                case 1106:
                  v9 = @"RAP_TRANSIT_MENU";
                  break;
                case 1107:
                  v9 = @"RAP_STATION_MAP";
                  break;
                case 1108:
                  v9 = @"RAP_STATION_MENU";
                  break;
                case 1109:
                  v9 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
                  break;
                case 1110:
                  v9 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
                  break;
                case 1111:
                  v9 = @"RAP_STATION_CLOSED_FORM";
                  break;
                case 1112:
                  v9 = @"RAP_LINE_MAP";
                  break;
                case 1113:
                  v9 = @"RAP_LINE_MENU";
                  break;
                case 1114:
                  v9 = @"RAP_LINE_NAME_FORM";
                  break;
                case 1115:
                  v9 = @"RAP_LINE_SHAPE_FORM";
                  break;
                case 1116:
                  v9 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
                  break;
                case 1117:
                  v9 = @"RAP_ADD_PLACE_MENU";
                  break;
                case 1118:
                  v9 = @"RAP_ADD_POI_MAP";
                  break;
                case 1119:
                  v9 = @"RAP_CATEGORY_LIST";
                  break;
                case 1120:
                  v9 = @"RAP_POI_DETAILS_FORM";
                  break;
                case 1121:
                  v9 = @"RAP_ADD_STREET_MAP";
                  break;
                case 1122:
                  v9 = @"RAP_STREET_DETAILS_FORM";
                  break;
                case 1123:
                  v9 = @"RAP_ADD_OTHER_MAP";
                  break;
                case 1124:
                  v9 = @"RAP_OTHER_DETAILS_FORM";
                  break;
                case 1125:
                  v9 = @"RAP_CAMERA";
                  break;
                case 1126:
                  v9 = @"RAP_LABEL_MAP";
                  break;
                case 1127:
                  v9 = @"RAP_LABEL_DETAILS_FORM";
                  break;
                case 1128:
                  v9 = @"RAP_SEARCH_MENU";
                  break;
                case 1129:
                  v9 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
                  break;
                case 1130:
                  v9 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
                  break;
                case 1131:
                  v9 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
                  break;
                case 1132:
                  v9 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
                  break;
                case 1133:
                  v9 = @"RAP_SATELLITE_IMAGE_MAP";
                  break;
                case 1134:
                  v9 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
                  break;
                case 1135:
                  v9 = @"RAP_OTHER_FORM";
                  break;
                case 1136:
                  v9 = @"RAP_PRIVACY";
                  break;
                case 1137:
                  v9 = @"RAP_CONFIRMATION";
                  break;
                case 1138:
                  v9 = @"RAP_POI_MENU";
                  break;
                case 1139:
                  v9 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
                  break;
                case 1140:
                  v9 = @"RAP_ADD_A_PLACE_MAP";
                  break;
                case 1141:
                  v9 = @"RAP_POI_LOCATION_MAP";
                  break;
                case 1142:
                  v9 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
                  break;
                case 1143:
                  v9 = @"RAP_POI_CLOSED_FORM";
                  break;
                case 1144:
                  v9 = @"RAP_CLAIM_BUSINESS_DIALOG";
                  break;
                case 1145:
                  v9 = @"RAP_BRAND_MENU";
                  break;
                case 1146:
                  v9 = @"RAP_BRAND_DETAILS_FORM";
                  break;
                case 1147:
                  v9 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
                  break;
                case 1148:
                  v9 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
                  break;
                case 1149:
                  v9 = @"RAP_LOOK_AROUND_BLURRING_FORM";
                  break;
                case 1150:
                  v9 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
                  break;
                case 1151:
                  v9 = @"RAP_LOOK_AROUND_MENU";
                  break;
                case 1152:
                  v9 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
                  break;
                case 1153:
                  v9 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
                  break;
                case 1154:
                  v9 = @"RAP_LIGHTWEIGHT";
                  break;
                case 1155:
                  v9 = @"RAP_EDIT_PLACE_DETAILS";
                  break;
                case 1156:
                  v9 = @"RAP_ADD_CATEGORY";
                  break;
                case 1157:
                  v9 = @"RAP_ADD_HOURS";
                  break;
                case 1158:
                  v9 = @"RAP_EDIT_LOCATION";
                  break;
                case 1159:
                  v9 = @"RAP_EDIT_ENTRY_POINT";
                  break;
                case 1160:
                  v9 = @"RAP_LOOK_AROUND";
                  break;
                case 1161:
                  v9 = @"RAP_ADD_ENTRY_POINT";
                  break;
                case 1201:
                  v9 = @"WATCH_MAIN_MENU";
                  break;
                case 1202:
                  v9 = @"WATCH_MAIN_PRESS_MENU";
                  break;
                case 1203:
                  v9 = @"WATCH_SEARCH";
                  break;
                case 1204:
                  v9 = @"WATCH_DICTATION";
                  break;
                case 1205:
                  v9 = @"WATCH_FAVORITES";
                  break;
                case 1206:
                  v9 = @"WATCH_SUB_CATEGORY_LIST";
                  break;
                case 1207:
                  v9 = @"WATCH_SEARCH_RESULTS_LIST";
                  break;
                case 1208:
                  v9 = @"WATCH_MAP_VIEW";
                  break;
                case 1209:
                  v9 = @"WATCH_PLACECARD";
                  break;
                case 1210:
                  v9 = @"WATCH_ROUTE_PLANNING";
                  break;
                case 1211:
                  v9 = @"WATCH_ROUTE_DETAILS";
                  break;
                case 1212:
                  v9 = @"WATCH_NAV_TBT";
                  break;
                case 1213:
                  v9 = @"WATCH_NAV_MAP";
                  break;
                case 1214:
                  v9 = @"WATCH_NAV_PRESS_MENU";
                  break;
                case 1215:
                  v9 = @"WATCH_MAP_PRESS_MENU";
                  break;
                case 1216:
                  v9 = @"WATCH_ROUTING_PRESS_MENU";
                  break;
                case 1217:
                  v9 = @"WATCH_TRANSIT_MAP_VIEW";
                  break;
                case 1218:
                  v9 = @"WATCH_SCRIBBLE";
                  break;
                case 1219:
                  v9 = @"WATCH_COLLECTION_VIEW";
                  break;
                case 1220:
                  v9 = @"WATCH_ROUTE_PLANNING_WALKING";
                  break;
                case 1221:
                  v9 = @"WATCH_ROUTE_PLANNING_DRIVING";
                  break;
                case 1222:
                  v9 = @"WATCH_ROUTE_PLANNING_TRANSIT";
                  break;
                case 1223:
                  v9 = @"WATCH_PAIRED_DEVICE";
                  break;
                case 1224:
                  v9 = @"WATCH_NAV_DRIVING_SPLIT";
                  break;
                case 1225:
                  v9 = @"WATCH_NAV_DRIVING_PLATTER";
                  break;
                case 1226:
                  v9 = @"WATCH_NAV_DRIVING_MAP";
                  break;
                case 1227:
                  v9 = @"WATCH_NAV_WALKING_SPLIT";
                  break;
                case 1228:
                  v9 = @"WATCH_NAV_WALKING_PLATTER";
                  break;
                case 1229:
                  v9 = @"WATCH_NAV_WALKING_MAP";
                  break;
                case 1230:
                  v9 = @"WATCH_NAV_TRANSIT_SPLIT";
                  break;
                case 1231:
                  v9 = @"WATCH_NAV_TRANSIT_PLATTER";
                  break;
                case 1232:
                  v9 = @"WATCH_NAV_TRANSIT_MAP";
                  break;
                case 1233:
                  v9 = @"WATCH_ROUTE_INFO";
                  break;
                case 1234:
                  v9 = @"WATCH_NAV_CYCLING_MAP";
                  break;
                case 1235:
                  v9 = @"WATCH_NAV_CYCLING_PLATTER";
                  break;
                case 1236:
                  v9 = @"WATCH_NAV_CYCLING_SPLIT";
                  break;
                case 1237:
                  v9 = @"WATCH_ROUTE_PLANNING_CYCLING";
                  break;
                case 1238:
                  v9 = @"WATCH_SEARCH_INPUT";
                  break;
                case 1239:
                  v9 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
                  break;
                case 1240:
                  v9 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
                  break;
                case 1301:
                  v9 = @"PERSONALIZED_ADDRESS_LIST";
                  break;
                case 1302:
                  v9 = @"PERSONALIZED_ADDRESS_FORM";
                  break;
                case 1303:
                  v9 = @"PERSONALIZED_LABEL_FORM";
                  break;
                case 1304:
                  v9 = @"PERSONALIZED_EDIT_MAP";
                  break;
                case 1305:
                  v9 = @"PERSONALIZED_CONFIRMATION";
                  break;
                case 1306:
                  v9 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
                  break;
                case 1307:
                  v9 = @"PERSONALIZED_ADDRESS_INFO";
                  break;
                case 1308:
                  v9 = @"PERSONALIZED_ADDRESS_SEARCH";
                  break;
                case 1309:
                  v9 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
                  break;
                case 1310:
                  v9 = @"FAVORITE_SEARCH";
                  break;
                case 1311:
                  v9 = @"FAVORITE_LIST";
                  break;
                case 1312:
                  v9 = @"FAVORITE_INFO";
                  break;
                case 1313:
                  v9 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
                  break;
                default:
                  switch((int)v8)
                  {
                    case 1401:
                      v9 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
                      break;
                    case 1402:
                      v9 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
                      break;
                    case 1403:
                      v9 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
                      break;
                    case 1404:
                      v9 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
                      break;
                    case 1405:
                      v9 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
                      break;
                    case 1406:
                      v9 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
                      break;
                    case 1407:
                      v9 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
                      break;
                    default:
                      switch((int)v8)
                      {
                        case 1501:
                          v9 = @"PLACECARD_HEADER";
                          break;
                        case 1502:
                          v9 = @"PLACECARD_ADDRESS";
                          break;
                        case 1503:
                          v9 = @"PLACECARD_PHONE";
                          break;
                        case 1504:
                          v9 = @"PLACECARD_URL";
                          break;
                        default:
                          goto LABEL_29;
                      }
                      break;
                  }
                  break;
              }
            }
          }
          else
          {
            v9 = @"UI_TARGET_UNKNOWN";
            switch((int)v8)
            {
              case 0:
                break;
              case 1:
                v9 = @"UI_TARGET_POI";
                break;
              case 2:
                v9 = @"UI_TARGET_SEARCH_RESULT_LIST";
                break;
              case 3:
                v9 = @"UI_TARGET_POPULAR_NEARBY_LIST";
                break;
              case 4:
                v9 = @"UI_TARGET_CALLOUT";
                break;
              case 5:
                v9 = @"UI_TARGET_SEARCH_PIN";
                break;
              case 6:
                v9 = @"UI_TARGET_DROPPED_PIN";
                break;
              case 7:
                v9 = @"UI_TARGET_TRANSIT_LINE";
                break;
              case 8:
                v9 = @"SEARCH_TRAY";
                break;
              case 9:
                v9 = @"SEARCH_TRAY_BROWSE";
                break;
              case 10:
                v9 = @"SEARCH_TRAY_POPULAR_NEARBY";
                break;
              case 11:
                v9 = @"SEARCH_TRAY_AC";
                break;
              case 12:
                v9 = @"SEARCH_TRAY_AC_INTERMEDIATE";
                break;
              case 13:
                v9 = @"SEARCH_TRAY_NO_QUERY";
                break;
              case 14:
                v9 = @"AR_WALKING_LEGAL_TRAY";
                break;
              case 15:
                v9 = @"RAISE_TO_START_AR_TRAY";
                break;
              case 16:
                v9 = @"EVENTS_ADVISORY_DETAILS_PAGE";
                break;
              case 17:
                v9 = @"INCIDENT_REPORT_TRAY_CARPLAY";
                break;
              case 18:
                v9 = @"HIGHLIGHTED_AREA";
                break;
              case 19:
                v9 = @"CURATED_COLLECTIONS_HOME";
                break;
              case 20:
                v9 = @"TRAVEL_PREFERENCES_TRAY";
                break;
              case 21:
                v9 = @"RESULT_TRAY_SEARCH";
                break;
              case 22:
                v9 = @"SINGLE_CARD_FILTER";
                break;
              case 23:
                v9 = @"FULL_CARD_FILTER";
                break;
              case 24:
                v9 = @"ACCOUNT_PRIVACY_TRAY";
                break;
              case 25:
                v9 = @"APPLE_RATINGS_HISTORY_TRAY";
                break;
              case 26:
                v9 = @"CURATED_COLLECTIONS_HOME_FILTERED";
                break;
              case 27:
                v9 = @"CITY_MENU";
                break;
              case 28:
                v9 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
                break;
              case 29:
                v9 = @"ACCOUNT_TRAY";
                break;
              case 30:
                v9 = @"QUICK_ACTION_TRAY";
                break;
              case 31:
                v9 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              case 32:
                v9 = @"RAP_PLACE_ISSUE_DETAILS";
                break;
              case 33:
                v9 = @"RAP_GUIDES_DETAILS";
                break;
              case 34:
                v9 = @"RAP_BAD_DIRECTIONS_DETAILS";
                break;
              case 35:
                v9 = @"RAP_ADD_MAP_DETAILS";
                break;
              case 36:
                v9 = @"WATCH_COMPLICATION";
                break;
              case 37:
                v9 = @"RAP_NAV_MENU";
                break;
              case 38:
                v9 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
                break;
              case 39:
                v9 = @"RAP_REPORT_MENU";
                break;
              case 40:
                v9 = @"RAP_CURATED_COLLECTION_MENU";
                break;
              case 41:
                v9 = @"RAP_REPORT_CARD_DETAILS";
                break;
              case 42:
                v9 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
                break;
              case 43:
                v9 = @"RAP_STREET_ISSUE_DETAILS";
                break;
              case 44:
                v9 = @"NEARBY_TRANSIT_CARD";
                break;
              case 45:
                v9 = @"WATCH_NAV_MENU";
                break;
              case 46:
                v9 = @"GENERIC_ADVISORY_PAGE";
                break;
              case 47:
                v9 = @"USER_PROFILE_TRAY";
                break;
              case 48:
                v9 = @"MEDIA_APP_MENU";
                break;
              case 49:
                v9 = @"TEMPLATE_PLACE_TRAY";
                break;
              case 50:
                v9 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
                break;
              case 51:
                v9 = @"ALLOW_NOTIFICATION_DIALOG";
                break;
              case 52:
                v9 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
                break;
              case 53:
                v9 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
                break;
              case 54:
                v9 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
                break;
              case 55:
                v9 = @"NOTIFICATION_CONSENT_PROMPT";
                break;
              case 56:
                v9 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
                break;
              case 57:
                v9 = @"PLACECARD_TRAY_VENDORS_MENU";
                break;
              case 58:
                v9 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
                break;
              case 59:
                v9 = @"SEARCH_ALONG_ROUTE_TRAY";
                break;
              case 60:
                v9 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
                break;
              case 61:
                v9 = @"PLACECARD_SHOWCASE_MENU";
                break;
              case 62:
                v9 = @"RAP_INLINE_ADD_DETAILS";
                break;
              case 63:
                v9 = @"RAP_EDIT_MENU_DETAILS";
                break;
              case 64:
                v9 = @"RAP_SUBMISSION_PROMPT";
                break;
              case 65:
                v9 = @"RAP_PLACECARD_EDIT_MENU";
                break;
              case 66:
                v9 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
                break;
              case 67:
                v9 = @"INCIDENT_REPORT_MENU";
                break;
              case 68:
                v9 = @"RAP_SELECT_BAD_ROUTES_STEPS";
                break;
              case 69:
                v9 = @"RAP_SELECT_BAD_ROUTES";
                break;
              case 70:
                v9 = @"SIRI_SUGGESTION_RESUME_ROUTE";
                break;
              case 71:
                v9 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
                break;
              case 72:
                v9 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
                break;
              case 73:
                v9 = @"SPOTLIGHT_BUSINESS_ENTITY";
                break;
              case 74:
                v9 = @"NOTIFICATION_ARP";
                break;
              case 75:
                v9 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
                break;
              case 76:
                v9 = @"YOUR_PHOTOS_ALBUM";
                break;
              case 77:
                v9 = @"ARP_PHOTO_CREDIT";
                break;
              case 78:
                v9 = @"RAP_OUTREACH_REVIEWED_REPORT";
                break;
              case 79:
                v9 = @"RAP_REPORT_MENU_MORE";
                break;
              case 80:
                v9 = @"WATCH_MAPS_SETTINGS";
                break;
              case 81:
                v9 = @"OFFLINE_FEATURE_PROMPT";
                break;
              case 82:
                v9 = @"EXPIRED_MAPS_DETAILS";
                break;
              case 83:
                v9 = @"MAPS_VIEW";
                break;
              case 84:
                v9 = @"NOTIFICATION_OFFLINE";
                break;
              case 85:
                v9 = @"EXPIRED_MAPS_MANAGEMENT";
                break;
              case 86:
                v9 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
                break;
              case 87:
                v9 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
                break;
              case 88:
                v9 = @"OFFLINE_MAPS_MANAGEMENT";
                break;
              case 89:
                v9 = @"REGION_SELECTOR";
                break;
              case 90:
                v9 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
                break;
              case 91:
                v9 = @"FIND_MY_ETA_SHARING_TRAY";
                break;
              case 92:
                v9 = @"WATCH_PLACE";
                break;
              case 93:
                v9 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
                break;
              case 94:
                v9 = @"WATCH_ROUTE_PLANNING_MAP";
                break;
              case 95:
                v9 = @"WATCH_NAV_WALKING_CONTROLS";
                break;
              case 96:
                v9 = @"WATCH_NAV_CYCLING_CONTROLS";
                break;
              case 97:
                v9 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
                break;
              case 98:
                v9 = @"WATCH_NAV_TRANSIT_CONTROLS";
                break;
              case 99:
                v9 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
                break;
              case 100:
                v9 = @"WATCH_NAV_DRIVING_CONTROLS";
                break;
              case 101:
                v9 = @"RESULTS_TRAY_SEARCH";
                break;
              case 102:
                v9 = @"RESULTS_TRAY_BROWSE";
                break;
              case 103:
                v9 = @"RESULTS_TRAY_FAVORITES";
                break;
              case 104:
                v9 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
                break;
              case 105:
                v9 = @"RESULTS_TRAY_CLUSTER";
                break;
              case 106:
                v9 = @"RESULTS_TRAY_VENUE_BROWSE";
                break;
              case 107:
                v9 = @"WATCH_MAP_RESULTS";
                break;
              case 108:
                v9 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
                break;
              case 109:
                v9 = @"WATCH_PLACES";
                break;
              case 110:
                v9 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
                break;
              case 111:
                v9 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
                break;
              case 112:
                v9 = @"DOWNLOADED_MAPS_DETAILS";
                break;
              case 113:
                v9 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
                break;
              case 114:
                v9 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
                break;
              case 115:
                v9 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
                break;
              case 116:
                v9 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
                break;
              case 117:
                v9 = @"WATCH_ROUTE_OPTIONS";
                break;
              case 118:
                v9 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
                break;
              case 119:
                v9 = @"WATCH_MORE_GUIDES";
                break;
              case 120:
                v9 = @"WATCH_RECENTLY_VIEWED";
                break;
              case 121:
                v9 = @"EV_SUCCESS_TRAY";
                break;
              case 122:
                v9 = @"PREFERRED_NETWORK_SELECTION_TRAY";
                break;
              case 123:
                v9 = @"PREFERRED_NETWORK_TRAY";
                break;
              case 124:
                v9 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
                break;
              case 125:
                v9 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
                break;
              case 126:
                v9 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
                break;
              case 127:
                v9 = @"AC_KEYBOARD_TRAY";
                break;
              case 128:
                v9 = @"MORE_RELATED_TRAILS";
                break;
              case 129:
                v9 = @"MORE_RELATED_TRAILHEADS";
                break;
              case 130:
                v9 = @"ROUTING_TRAY_CUSTOM_ROUTE";
                break;
              case 131:
                v9 = @"CUSTOM_ROUTE_CREATION_TRAY";
                break;
              case 132:
                v9 = @"ROUTING_TRAY_CURATED_HIKE";
                break;
              case 133:
                v9 = @"MORE_CURATED_HIKES";
                break;
              case 134:
                v9 = @"CUSTOM_ROUTE_ONBOARDING";
                break;
              case 135:
                v9 = @"LIBRARY_ROUTES";
                break;
              case 136:
                v9 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
                break;
              case 137:
                v9 = @"MY_LIBRARY";
                break;
              case 138:
                v9 = @"EDIT_NOTE_TRAY";
                break;
              case 139:
                v9 = @"CREATE_NOTE_TRAY";
                break;
              case 140:
                v9 = @"LIBRARY_PLACES";
                break;
              case 141:
                v9 = @"WATCH_ACCOUNT";
                break;
              case 142:
                v9 = @"WATCH_DOWNLOADED_MAPS";
                break;
              case 143:
                v9 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
                break;
              case 144:
                v9 = @"VISUAL_INTELLIGENCE_DETECTION";
                break;
              case 145:
                v9 = @"VISUAL_INTELLIGENCE_SNIPPET";
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
                goto LABEL_29;
              case 201:
                v9 = @"PLACECARD_TRAY";
                break;
              case 202:
                v9 = @"WEB_MODULE";
                break;
              case 250:
                v9 = @"ADD_FAVORITE_TRAY";
                break;
              case 251:
                v9 = @"COLLECTION_LIST";
                break;
              case 252:
                v9 = @"COLLECTION_VIEW";
                break;
              case 253:
                v9 = @"FAVORITE_DETAILS";
                break;
              case 254:
                v9 = @"FAVORITES_TRAY";
                break;
              case 255:
                v9 = @"SHARED_COLLECTION";
                break;
              case 256:
                v9 = @"SHARED_COLLECTION_VIEW";
                break;
              case 257:
                v9 = @"RECENTLY_VIEWED";
                break;
              case 258:
                v9 = @"SHARED_WEB_COLLECTION";
                break;
              case 259:
                v9 = @"CURATED_COLLECTION_VIEW";
                break;
              case 260:
                v9 = @"FEATURED_COLLECTIONS";
                break;
              case 261:
                v9 = @"PUBLISHER_TRAY";
                break;
              case 262:
                v9 = @"SHARED_CURATED_COLLECTION_VIEW";
                break;
              case 263:
                v9 = @"CURATED_COLLECTION_NOTIFICATION";
                break;
              case 264:
                v9 = @"CURATED_COLLECTION_LIST";
                break;
              case 265:
                v9 = @"PUBLISHER_LIST";
                break;
              case 266:
                v9 = @"WATCH_CURATED_COLLECTION_VIEW";
                break;
              case 267:
                v9 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
                break;
              case 268:
                v9 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
                break;
              case 301:
                v9 = @"ROUTING_TRAY_DRIVING";
                break;
              case 302:
                v9 = @"ROUTING_TRAY_WALKING";
                break;
              case 303:
                v9 = @"ROUTING_TRAY_TRANSIT";
                break;
              case 304:
                v9 = @"ROUTING_TRAY_RIDESHARE";
                break;
              case 305:
                v9 = @"ROUTING_TRAY_CYCLING";
                break;
              case 306:
                v9 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
                break;
              case 401:
                v9 = @"NAV_TRAY_DRIVING";
                break;
              case 402:
                v9 = @"NAV_TRAY_WALKING";
                break;
              case 403:
                v9 = @"NAV_TRAY_TRANSIT";
                break;
              case 404:
                v9 = @"NAV_TRAY_CYCLING";
                break;
              case 501:
                v9 = @"MAP_PLACECARD";
                break;
              case 502:
                v9 = @"MAP_SEARCH";
                break;
              case 503:
                v9 = @"MAP_RESULTS";
                break;
              case 504:
                v9 = @"MAP_ROUTING";
                break;
              case 505:
                v9 = @"MAP_NAV";
                break;
              case 506:
                v9 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
                break;
              case 507:
                v9 = @"MAP_TRAFFIC_INCIDENT";
                break;
              case 508:
                v9 = @"MAP_FULL_SCREEN";
                break;
              case 509:
                v9 = @"MAP_DRIVE";
                break;
              case 510:
                v9 = @"MAP_LAUNCH_AND_GO";
                break;
              case 511:
                v9 = @"MAP_VIEW";
                break;
              case 601:
                v9 = @"MAPS_SETTINGS";
                break;
              case 602:
                v9 = @"MAPS_PREFERENCES";
                break;
              case 603:
                v9 = @"RAP";
                break;
              case 604:
                v9 = @"ROUTING_DRIVING_DETAILS";
                break;
              case 605:
                v9 = @"ROUTING_WALKING_DETAILS";
                break;
              case 606:
                v9 = @"ROUTING_TRANSIT_DETAILS";
                break;
              case 607:
                v9 = @"ROUTING_EDITOR";
                break;
              case 608:
                v9 = @"NAV_DRIVING_DETAILS";
                break;
              case 609:
                v9 = @"NAV_WALKING_DETAILS";
                break;
              case 610:
                v9 = @"NAV_TRANSIT_DETAILS";
                break;
              case 611:
                v9 = @"NAV_AUDIO_SETTINGS";
                break;
              case 612:
                v9 = @"PHOTO_VIEWER_ALL";
                break;
              case 613:
                v9 = @"PHOTO_VIEWER_SINGLE";
                break;
              case 614:
                v9 = @"ROUTE_OPTIONS_TRANSIT";
                break;
              case 615:
                v9 = @"TRAFFIC_INCIDENT_TRAY";
                break;
              case 616:
                v9 = @"NAV_DIRECTIONS_BANNER_DRIVING";
                break;
              case 617:
                v9 = @"NAV_DIRECTIONS_BANNER_WALKING";
                break;
              case 618:
                v9 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
                break;
              case 619:
                v9 = @"REFINE_SEARCH_SUGGESTION_AREA";
                break;
              case 620:
                v9 = @"ADD_PHOTO_SHEET";
                break;
              case 621:
                v9 = @"ADD_PLACE_SHEET";
                break;
              case 622:
                v9 = @"SHARE_SHEET";
                break;
              case 623:
                v9 = @"EDIT_LOCATION_SHEET";
                break;
              case 624:
                v9 = @"ADD_CONTACT_SHEET";
                break;
              case 625:
                v9 = @"EDIT_NAME_SHEET";
                break;
              case 626:
                v9 = @"DRIVING_NAV_SETTINGS";
                break;
              case 627:
                v9 = @"TRANSIT_SETTINGS";
                break;
              case 628:
                v9 = @"TRANSIT_ADVISORY_SHEET";
                break;
              case 629:
                v9 = @"REMOVE_CAR_SHEET";
                break;
              case 630:
                v9 = @"ROUTE_OPTIONS_DRIVING";
                break;
              case 631:
                v9 = @"ROUTE_OPTIONS_DATETIME";
                break;
              case 632:
                v9 = @"TRANSIT_ADVISORY_BANNER";
                break;
              case 633:
                v9 = @"BOOK_TABLE_SELECT_TIME";
                break;
              case 634:
                v9 = @"BOOK_TABLE_MORE_OPTIONS";
                break;
              case 635:
                v9 = @"BOOK_TABLE_READY";
                break;
              case 636:
                v9 = @"BOOK_TABLE_BOOKED";
                break;
              case 637:
                v9 = @"TRANSIT_LINE_CLUSTER_SHEET";
                break;
              case 638:
                v9 = @"TRANSIT_LINE_LIST_SHEET";
                break;
              case 639:
                v9 = @"TRANSIT_BALANCE_BANNER";
                break;
              case 640:
                v9 = @"WEATHER_ICON";
                break;
              case 641:
                v9 = @"HELP_IMPROVE_MAPS_DIALOG";
                break;
              case 642:
                v9 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
                break;
              case 643:
                v9 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
                break;
              case 644:
                v9 = @"FLOOR_PICKER";
                break;
              case 645:
                v9 = @"VENUE_LIST";
                break;
              case 646:
                v9 = @"AR_MODE";
                break;
              case 647:
                v9 = @"ROUTING_TRANSIT_TICKETS_SHEET";
                break;
              case 648:
                v9 = @"LINKED_SERVICE_HOURS";
                break;
              case 649:
                v9 = @"SHARE_ETA_TRAY";
                break;
              case 650:
                v9 = @"ETA_UPDATE_TRAY";
                break;
              case 651:
                v9 = @"SCHEDULECARD_TRAY";
                break;
              case 652:
                v9 = @"AR_NAV";
                break;
              case 653:
                v9 = @"TAP_TRANSIT_ACCESS_POINT";
                break;
              case 654:
                v9 = @"LOCATIONS_INSIDE";
                break;
              case 655:
                v9 = @"SIMILAR_LOCATIONS";
                break;
              case 656:
                v9 = @"LOCATIONS_AT_ADDRESS";
                break;
              case 657:
                v9 = @"NAV_DIRECTIONS_BANNER_CYCLING";
                break;
              case 658:
                v9 = @"ROUTE_OPTIONS_CYCLING";
                break;
              case 659:
                v9 = @"EV_CONNECTION_TRAY";
                break;
              case 660:
                v9 = @"VIRTUAL_GARAGE";
                break;
              case 661:
                v9 = @"VIRTUAL_GARAGE_BANNER";
                break;
              case 662:
                v9 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
                break;
              case 663:
                v9 = @"ADVISORY_DETAILS_PAGE";
                break;
              case 664:
                v9 = @"APP_CLIP_NOTIFICATION";
                break;
              case 665:
                v9 = @"PHOTO_VIEWER_GALLERY";
                break;
              case 666:
                v9 = @"RECOMMENDATION_CARD";
                break;
              case 667:
                v9 = @"INCIDENT_REPORT_TRAY";
                break;
              case 668:
                v9 = @"MAPS_WIDGET_DISPLAY";
                break;
              case 669:
                v9 = @"VISUAL_LOCATION_FRAMEWORK";
                break;
              case 670:
                v9 = @"APP_CLIP_TRAY";
                break;
              case 671:
                v9 = @"LICENSE_PLATE_SUGGESTION_PAGE";
                break;
              case 672:
                v9 = @"NOTIFICATION_ADD_PLATE";
                break;
              case 673:
                v9 = @"MAPS_RESULTS";
                break;
              case 674:
                v9 = @"MAPS_WIDGET_APP_CONNECTION";
                break;
              case 675:
                v9 = @"MAPS_WIDGET_CURRENT_LOCATION";
                break;
              case 676:
                v9 = @"MAPS_WIDGET_CURRENT_NAV";
                break;
              case 677:
                v9 = @"MAPS_WIDGET_ETA";
                break;
              case 678:
                v9 = @"MAPS_WIDGET_TRANSIT";
                break;
              case 679:
                v9 = @"MAPS_WIDGET_UPC_DESTINATION";
                break;
              case 680:
                v9 = @"WIDGET_CREATION_TRAY";
                break;
              case 681:
                v9 = @"MAPS_WIDGET_HOME";
                break;
              case 682:
                v9 = @"MAPS_WIDGET_PARKED_CAR";
                break;
              case 683:
                v9 = @"MAPS_WIDGET_POI";
                break;
              case 684:
                v9 = @"MAPS_WIDGET_SCHOOL";
                break;
              case 685:
                v9 = @"MAPS_WIDGET_WORK";
                break;
              case 686:
                v9 = @"AIRPORT_NOTIFICATION";
                break;
              case 687:
                v9 = @"MAPS_WIDGET_EMPTY";
                break;
              case 688:
                v9 = @"COARSE_LOCATION_OPTIONS_PROMPT";
                break;
              case 689:
                v9 = @"ALLOW_PRECISE_LOCATION_PROMPT";
                break;
              case 690:
                v9 = @"SHARE_MY_LOCATION";
                break;
              case 691:
                v9 = @"MARK_MY_LOCATION";
                break;
              case 692:
                v9 = @"AIRPORT_NOTIFICATION_WATCH";
                break;
              case 693:
                v9 = @"EDIT_FAVORITE";
                break;
              case 694:
                v9 = @"ROUTING_CYCLING_DETAILS";
                break;
              case 695:
                v9 = @"NAV_CYCLING_DETAILS";
                break;
              case 696:
                v9 = @"MAPS_SUGGESTION_WIDGET";
                break;
              case 697:
                v9 = @"ARP_TIPKIT";
                break;
              case 698:
                v9 = @"ARP_PRIVACY";
                break;
              case 699:
                v9 = @"ROUTE_OPTIONS_WALKING";
                break;
              case 701:
                v9 = @"SAFARI_SEARCH";
                break;
              case 702:
                v9 = @"SPOTLIGHT_SEARCH";
                break;
              case 703:
                v9 = @"SAFARI_MAPS_SEARCH_RESULTS";
                break;
              case 704:
                v9 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
                break;
              case 705:
                v9 = @"WIDGET_MAPS_DESTINATIONS";
                break;
              case 706:
                v9 = @"WIDGET_MAPS_TRANSIT";
                break;
              case 707:
                v9 = @"WIDGET_MAPS_NEARBY";
                break;
              case 708:
                v9 = @"NOTIFICATION_FIND_MY_CAR";
                break;
              case 709:
                v9 = @"CONTROL_CENTER";
                break;
              case 710:
                v9 = @"NOTIFICATION_CENTER";
                break;
              case 711:
                v9 = @"NOTIFICATION_DOOM";
                break;
              case 712:
                v9 = @"NOTIFICATION_VENUES";
                break;
              case 713:
                v9 = @"NOTIFICATION_RAP_UPDATE";
                break;
              case 714:
                v9 = @"NOTIFICATION_TRIP_CANCELLED";
                break;
              case 715:
                v9 = @"NOTIFICATION_STOP_SKIPPED";
                break;
              case 716:
                v9 = @"NOTIFICATION_TRIP_DELAYED";
                break;
              case 717:
                v9 = @"NOTIFICATION_RAP";
                break;
              case 718:
                v9 = @"NOTIFICATION_PROXY_AUTH";
                break;
              case 719:
                v9 = @"NOTIFICATION_PUSH_TO_DEVICE";
                break;
              case 720:
                v9 = @"NOTIFICATION_LOW_FUEL";
                break;
              case 721:
                v9 = @"NOTIFICATION_FIND_MY_CAR_RESET";
                break;
              case 722:
                v9 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
                break;
              case 723:
                v9 = @"NOTIFICATION_SHARED_ETA";
                break;
              case 724:
                v9 = @"NOTIFICATION_SHARED_ETA_UPDATE";
                break;
              case 725:
                v9 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
                break;
              case 726:
                v9 = @"ANNOUNCEMENT_TYPE_GENERAL";
                break;
              case 727:
                v9 = @"ANNOUNCEMENT_TYPE_FLYOVER";
                break;
              case 728:
                v9 = @"ANNOUNCEMENT_TYPE_TRANSIT";
                break;
              case 729:
                v9 = @"ANNOUNCEMENT_TYPE_VENUES";
                break;
              case 730:
                v9 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
                break;
              case 731:
                v9 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
                break;
              case 732:
                v9 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
                break;
              case 733:
                v9 = @"APP_SHEET";
                break;
              case 734:
                v9 = @"CZ_ADVISORY_DETAILS_PAGE";
                break;
              case 735:
                v9 = @"SHARE_ETA_CONTACT_TRAY";
                break;
              case 736:
                v9 = @"SIRI_SHARE_ETA";
                break;
              case 737:
                v9 = @"SIRI_SUGGESTION_SHARED_ETA";
                break;
              case 738:
                v9 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
                break;
              case 739:
                v9 = @"INCIDENT_ALERT_TRAY";
                break;
              case 740:
                v9 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
                break;
              case 741:
                v9 = @"RAP_INCIDENT_REPORT_VIEW";
                break;
              case 742:
                v9 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
                break;
              case 743:
                v9 = @"TRAFFIC_ADVISORY_SHEET";
                break;
              case 801:
                v9 = @"SIRI_PLUGIN_SNIPPET";
                break;
              case 802:
                v9 = @"SIRI_PLUGIN_COMMAND";
                break;
              case 803:
                v9 = @"SIRI_SEARCH_RESULT_LIST";
                break;
              case 804:
                v9 = @"SIRI_DISAMBIGUATION_LIST";
                break;
              case 805:
                v9 = @"SIRI_PLACE_SNIPPET";
                break;
              default:
                if (v8 != 901) {
                  goto LABEL_29;
                }
                v9 = @"CHROME";
                break;
            }
          }
          [v5 addObject:v9];

          ++v7;
          v6 = a1 + 3;
        }
        while (v7 < a1[4]);
      }
      if (a2) {
        v10 = @"nativePath";
      }
      else {
        v10 = @"native_path";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (a1[6])
    {
      v11 = [a1 webPaths];
      if (a2) {
        v12 = @"webPath";
      }
      else {
        v12 = @"web_path";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __43__GEORPUserPath__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPUserPath;
  v4 = [(GEORPUserPath *)&v8 description];
  v5 = [(GEORPUserPath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearWebPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  webPaths = self->_webPaths;

  [(NSMutableArray *)webPaths removeAllObjects];
}

- (void)addWebPath:(id)a3
{
  id v4 = a3;
  -[GEORPUserPath _readWebPaths]((uint64_t)self);
  -[GEORPUserPath _addNoFlagsWebPath:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (int)StringAsNativePaths:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UI_TARGET_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_SEARCH_RESULT_LIST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_POPULAR_NEARBY_LIST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_CALLOUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_SEARCH_PIN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_DROPPED_PIN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_TRANSIT_LINE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_BROWSE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_POPULAR_NEARBY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_AC"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_AC_INTERMEDIATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_NO_QUERY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AR_WALKING_LEGAL_TRAY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RAISE_TO_START_AR_TRAY"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"EVENTS_ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_TRAY_CARPLAY"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHTED_AREA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TRAVEL_PREFERENCES_TRAY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RESULT_TRAY_SEARCH"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SINGLE_CARD_FILTER"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FULL_CARD_FILTER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_PRIVACY_TRAY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"APPLE_RATINGS_HISTORY_TRAY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_FILTERED"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"CITY_MENU"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_TRAY"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"QUICK_ACTION_TRAY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SUBMIT_TRIP_FEEDBACK"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"RAP_PLACE_ISSUE_DETAILS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RAP_GUIDES_DETAILS"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"RAP_BAD_DIRECTIONS_DETAILS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_MAP_DETAILS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"WATCH_COMPLICATION"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"RAP_NAV_MENU"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ALIGHT_BANNER_TRANSIT"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_MENU"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"RAP_CURATED_COLLECTION_MENU"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_CARD_DETAILS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_NO_LOCATION_TRANSIT"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RAP_STREET_ISSUE_DETAILS"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"NEARBY_TRANSIT_CARD"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_MENU"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"GENERIC_ADVISORY_PAGE"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"USER_PROFILE_TRAY"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"MEDIA_APP_MENU"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"TEMPLATE_PLACE_TRAY"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_RAP"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ALLOW_NOTIFICATION_DIALOG"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_DRIVING"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_ARP"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_PROMPT"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"QUICK_ACTION_TRAY_VENDORS_MENU"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"PLACECARD_TRAY_VENDORS_MENU"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH_ROUTE_PLANNING"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE_TRAY"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS_SEARCH_ROUTE_PLANNING"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWCASE_MENU"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"RAP_INLINE_ADD_DETAILS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_MENU_DETAILS"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"RAP_SUBMISSION_PROMPT"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"RAP_PLACECARD_EDIT_MENU"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"ARP_SUBMISSION_CONFIRMATION_PAGE"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_MENU"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"RAP_SELECT_BAD_ROUTES_STEPS"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"RAP_SELECT_BAD_ROUTES"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_RESUME_ROUTE"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY_LIST"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ARP"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"IMPROVE_LOCATION_ACCURACY_PROMPT"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"YOUR_PHOTOS_ALBUM"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"ARP_PHOTO_CREDIT"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"RAP_OUTREACH_REVIEWED_REPORT"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_MENU_MORE"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"WATCH_MAPS_SETTINGS"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"OFFLINE_FEATURE_PROMPT"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"EXPIRED_MAPS_DETAILS"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"MAPS_VIEW"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_OFFLINE"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"EXPIRED_MAPS_MANAGEMENT"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"OFFLINE_NEW_MAPS_MANAGEMENT"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"EDIT_EXPIRED_MAPS_MANAGEMENT"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"OFFLINE_MAPS_MANAGEMENT"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"REGION_SELECTOR"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"OFFLINE_SUGGESTED_MAPS_MANAGEMENT"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"FIND_MY_ETA_SHARING_TRAY"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACE"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_MAP"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_CONTROLS"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_CONTROLS"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_CONTROLS"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_RESULTS_CAROUSEL"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_CONTROLS"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_BROWSE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_FAVORITES"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_CLUSTER"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_VENUE_BROWSE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_RESULTS"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_ELEVATION_VIEW"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACES"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_ELEVATION_VIEW"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"DOWNLOADED_MAPS_DETAILS"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_OVERVIEW_MAP"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_OVERVIEW_MAP"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_OVERVIEW_MAP"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_OPTIONS"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_OVERVIEW_MAP"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"WATCH_MORE_GUIDES"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"WATCH_RECENTLY_VIEWED"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"EV_SUCCESS_TRAY"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"PREFERRED_NETWORK_SELECTION_TRAY"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"PREFERRED_NETWORK_TRAY"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"WALKING_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"FINDMY_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"CARPLAY_FIND_MY_ETA_SHARING_TRAY"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"AC_KEYBOARD_TRAY"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"MORE_RELATED_TRAILS"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"MORE_RELATED_TRAILHEADS"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CUSTOM_ROUTE"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"CUSTOM_ROUTE_CREATION_TRAY"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"MORE_CURATED_HIKES"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"CUSTOM_ROUTE_ONBOARDING"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"LIBRARY_ROUTES"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"HIKING_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"MY_LIBRARY"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"EDIT_NOTE_TRAY"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"CREATE_NOTE_TRAY"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"LIBRARY_PLACES"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"WATCH_ACCOUNT"])
  {
    int v4 = 141;
  }
  else if ([v3 isEqualToString:@"WATCH_DOWNLOADED_MAPS"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION_LIST"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_SNIPPET"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"PLACECARD_TRAY"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"WEB_MODULE"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"ADD_FAVORITE_TRAY"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"COLLECTION_LIST"])
  {
    int v4 = 251;
  }
  else if ([v3 isEqualToString:@"COLLECTION_VIEW"])
  {
    int v4 = 252;
  }
  else if ([v3 isEqualToString:@"FAVORITE_DETAILS"])
  {
    int v4 = 253;
  }
  else if ([v3 isEqualToString:@"FAVORITES_TRAY"])
  {
    int v4 = 254;
  }
  else if ([v3 isEqualToString:@"SHARED_COLLECTION"])
  {
    int v4 = 255;
  }
  else if ([v3 isEqualToString:@"SHARED_COLLECTION_VIEW"])
  {
    int v4 = 256;
  }
  else if ([v3 isEqualToString:@"RECENTLY_VIEWED"])
  {
    int v4 = 257;
  }
  else if ([v3 isEqualToString:@"SHARED_WEB_COLLECTION"])
  {
    int v4 = 258;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_VIEW"])
  {
    int v4 = 259;
  }
  else if ([v3 isEqualToString:@"FEATURED_COLLECTIONS"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_TRAY"])
  {
    int v4 = 261;
  }
  else if ([v3 isEqualToString:@"SHARED_CURATED_COLLECTION_VIEW"])
  {
    int v4 = 262;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_NOTIFICATION"])
  {
    int v4 = 263;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_LIST"])
  {
    int v4 = 264;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_LIST"])
  {
    int v4 = 265;
  }
  else if ([v3 isEqualToString:@"WATCH_CURATED_COLLECTION_VIEW"])
  {
    int v4 = 266;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_SUBLIST"])
  {
    int v4 = 267;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST"])
  {
    int v4 = 268;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_DRIVING"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_WALKING"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_TRANSIT"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CYCLING"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_DRIVING"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_WALKING"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_TRANSIT"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_CYCLING"])
  {
    int v4 = 404;
  }
  else if ([v3 isEqualToString:@"MAP_PLACECARD"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"MAP_SEARCH"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"MAP_ROUTING"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"MAP_NAV"])
  {
    int v4 = 505;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 506;
  }
  else if ([v3 isEqualToString:@"MAP_TRAFFIC_INCIDENT"])
  {
    int v4 = 507;
  }
  else if ([v3 isEqualToString:@"MAP_FULL_SCREEN"])
  {
    int v4 = 508;
  }
  else if ([v3 isEqualToString:@"MAP_DRIVE"])
  {
    int v4 = 509;
  }
  else if ([v3 isEqualToString:@"MAP_LAUNCH_AND_GO"])
  {
    int v4 = 510;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW"])
  {
    int v4 = 511;
  }
  else if ([v3 isEqualToString:@"MAPS_SETTINGS"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"MAPS_PREFERENCES"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"RAP"])
  {
    int v4 = 603;
  }
  else if ([v3 isEqualToString:@"ROUTING_DRIVING_DETAILS"])
  {
    int v4 = 604;
  }
  else if ([v3 isEqualToString:@"ROUTING_WALKING_DETAILS"])
  {
    int v4 = 605;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRANSIT_DETAILS"])
  {
    int v4 = 606;
  }
  else if ([v3 isEqualToString:@"ROUTING_EDITOR"])
  {
    int v4 = 607;
  }
  else if ([v3 isEqualToString:@"NAV_DRIVING_DETAILS"])
  {
    int v4 = 608;
  }
  else if ([v3 isEqualToString:@"NAV_WALKING_DETAILS"])
  {
    int v4 = 609;
  }
  else if ([v3 isEqualToString:@"NAV_TRANSIT_DETAILS"])
  {
    int v4 = 610;
  }
  else if ([v3 isEqualToString:@"NAV_AUDIO_SETTINGS"])
  {
    int v4 = 611;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_ALL"])
  {
    int v4 = 612;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_SINGLE"])
  {
    int v4 = 613;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_TRANSIT"])
  {
    int v4 = 614;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_TRAY"])
  {
    int v4 = 615;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_DRIVING"])
  {
    int v4 = 616;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_WALKING"])
  {
    int v4 = 617;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_TRANSIT"])
  {
    int v4 = 618;
  }
  else if ([v3 isEqualToString:@"REFINE_SEARCH_SUGGESTION_AREA"])
  {
    int v4 = 619;
  }
  else if ([v3 isEqualToString:@"ADD_PHOTO_SHEET"])
  {
    int v4 = 620;
  }
  else if ([v3 isEqualToString:@"ADD_PLACE_SHEET"])
  {
    int v4 = 621;
  }
  else if ([v3 isEqualToString:@"SHARE_SHEET"])
  {
    int v4 = 622;
  }
  else if ([v3 isEqualToString:@"EDIT_LOCATION_SHEET"])
  {
    int v4 = 623;
  }
  else if ([v3 isEqualToString:@"ADD_CONTACT_SHEET"])
  {
    int v4 = 624;
  }
  else if ([v3 isEqualToString:@"EDIT_NAME_SHEET"])
  {
    int v4 = 625;
  }
  else if ([v3 isEqualToString:@"DRIVING_NAV_SETTINGS"])
  {
    int v4 = 626;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SETTINGS"])
  {
    int v4 = 627;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ADVISORY_SHEET"])
  {
    int v4 = 628;
  }
  else if ([v3 isEqualToString:@"REMOVE_CAR_SHEET"])
  {
    int v4 = 629;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_DRIVING"])
  {
    int v4 = 630;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_DATETIME"])
  {
    int v4 = 631;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ADVISORY_BANNER"])
  {
    int v4 = 632;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_SELECT_TIME"])
  {
    int v4 = 633;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_MORE_OPTIONS"])
  {
    int v4 = 634;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_READY"])
  {
    int v4 = 635;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_BOOKED"])
  {
    int v4 = 636;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_CLUSTER_SHEET"])
  {
    int v4 = 637;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_LIST_SHEET"])
  {
    int v4 = 638;
  }
  else if ([v3 isEqualToString:@"TRANSIT_BALANCE_BANNER"])
  {
    int v4 = 639;
  }
  else if ([v3 isEqualToString:@"WEATHER_ICON"])
  {
    int v4 = 640;
  }
  else if ([v3 isEqualToString:@"HELP_IMPROVE_MAPS_DIALOG"])
  {
    int v4 = 641;
  }
  else if ([v3 isEqualToString:@"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG"])
  {
    int v4 = 642;
  }
  else if ([v3 isEqualToString:@"COMMUTE_PREDICTION_ACCURACY_DIALOG"])
  {
    int v4 = 643;
  }
  else if ([v3 isEqualToString:@"FLOOR_PICKER"])
  {
    int v4 = 644;
  }
  else if ([v3 isEqualToString:@"VENUE_LIST"])
  {
    int v4 = 645;
  }
  else if ([v3 isEqualToString:@"AR_MODE"])
  {
    int v4 = 646;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRANSIT_TICKETS_SHEET"])
  {
    int v4 = 647;
  }
  else if ([v3 isEqualToString:@"LINKED_SERVICE_HOURS"])
  {
    int v4 = 648;
  }
  else if ([v3 isEqualToString:@"SHARE_ETA_TRAY"])
  {
    int v4 = 649;
  }
  else if ([v3 isEqualToString:@"ETA_UPDATE_TRAY"])
  {
    int v4 = 650;
  }
  else if ([v3 isEqualToString:@"SCHEDULECARD_TRAY"])
  {
    int v4 = 651;
  }
  else if ([v3 isEqualToString:@"AR_NAV"])
  {
    int v4 = 652;
  }
  else if ([v3 isEqualToString:@"TAP_TRANSIT_ACCESS_POINT"])
  {
    int v4 = 653;
  }
  else if ([v3 isEqualToString:@"LOCATIONS_INSIDE"])
  {
    int v4 = 654;
  }
  else if ([v3 isEqualToString:@"SIMILAR_LOCATIONS"])
  {
    int v4 = 655;
  }
  else if ([v3 isEqualToString:@"LOCATIONS_AT_ADDRESS"])
  {
    int v4 = 656;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_CYCLING"])
  {
    int v4 = 657;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_CYCLING"])
  {
    int v4 = 658;
  }
  else if ([v3 isEqualToString:@"EV_CONNECTION_TRAY"])
  {
    int v4 = 659;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE"])
  {
    int v4 = 660;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE_BANNER"])
  {
    int v4 = 661;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE_VEHICLE_VIEW"])
  {
    int v4 = 662;
  }
  else if ([v3 isEqualToString:@"ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 663;
  }
  else if ([v3 isEqualToString:@"APP_CLIP_NOTIFICATION"])
  {
    int v4 = 664;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_GALLERY"])
  {
    int v4 = 665;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION_CARD"])
  {
    int v4 = 666;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_TRAY"])
  {
    int v4 = 667;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_DISPLAY"])
  {
    int v4 = 668;
  }
  else if ([v3 isEqualToString:@"VISUAL_LOCATION_FRAMEWORK"])
  {
    int v4 = 669;
  }
  else if ([v3 isEqualToString:@"APP_CLIP_TRAY"])
  {
    int v4 = 670;
  }
  else if ([v3 isEqualToString:@"LICENSE_PLATE_SUGGESTION_PAGE"])
  {
    int v4 = 671;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ADD_PLATE"])
  {
    int v4 = 672;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULTS"])
  {
    int v4 = 673;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_APP_CONNECTION"])
  {
    int v4 = 674;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_CURRENT_LOCATION"])
  {
    int v4 = 675;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_CURRENT_NAV"])
  {
    int v4 = 676;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_ETA"])
  {
    int v4 = 677;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_TRANSIT"])
  {
    int v4 = 678;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_UPC_DESTINATION"])
  {
    int v4 = 679;
  }
  else if ([v3 isEqualToString:@"WIDGET_CREATION_TRAY"])
  {
    int v4 = 680;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_HOME"])
  {
    int v4 = 681;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_PARKED_CAR"])
  {
    int v4 = 682;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_POI"])
  {
    int v4 = 683;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_SCHOOL"])
  {
    int v4 = 684;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_WORK"])
  {
    int v4 = 685;
  }
  else if ([v3 isEqualToString:@"AIRPORT_NOTIFICATION"])
  {
    int v4 = 686;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_EMPTY"])
  {
    int v4 = 687;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_OPTIONS_PROMPT"])
  {
    int v4 = 688;
  }
  else if ([v3 isEqualToString:@"ALLOW_PRECISE_LOCATION_PROMPT"])
  {
    int v4 = 689;
  }
  else if ([v3 isEqualToString:@"SHARE_MY_LOCATION"])
  {
    int v4 = 690;
  }
  else if ([v3 isEqualToString:@"MARK_MY_LOCATION"])
  {
    int v4 = 691;
  }
  else if ([v3 isEqualToString:@"AIRPORT_NOTIFICATION_WATCH"])
  {
    int v4 = 692;
  }
  else if ([v3 isEqualToString:@"EDIT_FAVORITE"])
  {
    int v4 = 693;
  }
  else if ([v3 isEqualToString:@"ROUTING_CYCLING_DETAILS"])
  {
    int v4 = 694;
  }
  else if ([v3 isEqualToString:@"NAV_CYCLING_DETAILS"])
  {
    int v4 = 695;
  }
  else if ([v3 isEqualToString:@"MAPS_SUGGESTION_WIDGET"])
  {
    int v4 = 696;
  }
  else if ([v3 isEqualToString:@"ARP_TIPKIT"])
  {
    int v4 = 697;
  }
  else if ([v3 isEqualToString:@"ARP_PRIVACY"])
  {
    int v4 = 698;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_WALKING"])
  {
    int v4 = 699;
  }
  else if ([v3 isEqualToString:@"SAFARI_SEARCH"])
  {
    int v4 = 701;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_SEARCH"])
  {
    int v4 = 702;
  }
  else if ([v3 isEqualToString:@"SAFARI_MAPS_SEARCH_RESULTS"])
  {
    int v4 = 703;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_MAPS_SEARCH_RESULTS"])
  {
    int v4 = 704;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_DESTINATIONS"])
  {
    int v4 = 705;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_TRANSIT"])
  {
    int v4 = 706;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_NEARBY"])
  {
    int v4 = 707;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_FIND_MY_CAR"])
  {
    int v4 = 708;
  }
  else if ([v3 isEqualToString:@"CONTROL_CENTER"])
  {
    int v4 = 709;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CENTER"])
  {
    int v4 = 710;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_DOOM"])
  {
    int v4 = 711;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_VENUES"])
  {
    int v4 = 712;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_RAP_UPDATE"])
  {
    int v4 = 713;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRIP_CANCELLED"])
  {
    int v4 = 714;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_STOP_SKIPPED"])
  {
    int v4 = 715;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRIP_DELAYED"])
  {
    int v4 = 716;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_RAP"])
  {
    int v4 = 717;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_PROXY_AUTH"])
  {
    int v4 = 718;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_PUSH_TO_DEVICE"])
  {
    int v4 = 719;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_LOW_FUEL"])
  {
    int v4 = 720;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_FIND_MY_CAR_RESET"])
  {
    int v4 = 721;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRAFFIC_CONDITIONS"])
  {
    int v4 = 722;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_SHARED_ETA"])
  {
    int v4 = 723;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_SHARED_ETA_UPDATE"])
  {
    int v4 = 724;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
  {
    int v4 = 725;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
  {
    int v4 = 726;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
  {
    int v4 = 727;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
  {
    int v4 = 728;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
  {
    int v4 = 729;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
  {
    int v4 = 730;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
  {
    int v4 = 731;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
  {
    int v4 = 732;
  }
  else if ([v3 isEqualToString:@"APP_SHEET"])
  {
    int v4 = 733;
  }
  else if ([v3 isEqualToString:@"CZ_ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 734;
  }
  else if ([v3 isEqualToString:@"SHARE_ETA_CONTACT_TRAY"])
  {
    int v4 = 735;
  }
  else if ([v3 isEqualToString:@"SIRI_SHARE_ETA"])
  {
    int v4 = 736;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA"])
  {
    int v4 = 737;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY"])
  {
    int v4 = 738;
  }
  else if ([v3 isEqualToString:@"INCIDENT_ALERT_TRAY"])
  {
    int v4 = 739;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_CONFIRMATION_TRAY"])
  {
    int v4 = 740;
  }
  else if ([v3 isEqualToString:@"RAP_INCIDENT_REPORT_VIEW"])
  {
    int v4 = 741;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE_CATEGORY_TRAY"])
  {
    int v4 = 742;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_ADVISORY_SHEET"])
  {
    int v4 = 743;
  }
  else if ([v3 isEqualToString:@"SIRI_PLUGIN_SNIPPET"])
  {
    int v4 = 801;
  }
  else if ([v3 isEqualToString:@"SIRI_PLUGIN_COMMAND"])
  {
    int v4 = 802;
  }
  else if ([v3 isEqualToString:@"SIRI_SEARCH_RESULT_LIST"])
  {
    int v4 = 803;
  }
  else if ([v3 isEqualToString:@"SIRI_DISAMBIGUATION_LIST"])
  {
    int v4 = 804;
  }
  else if ([v3 isEqualToString:@"SIRI_PLACE_SNIPPET"])
  {
    int v4 = 805;
  }
  else if ([v3 isEqualToString:@"CHROME"])
  {
    int v4 = 901;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NAV"])
  {
    int v4 = 1001;
  }
  else if ([v3 isEqualToString:@"CARPLAY_EXPLORE"])
  {
    int v4 = 1002;
  }
  else if ([v3 isEqualToString:@"CARPLAY_DESTINATIONS"])
  {
    int v4 = 1003;
  }
  else if ([v3 isEqualToString:@"CARPLAY_TRAFFIC_INCIDENT"])
  {
    int v4 = 1004;
  }
  else if ([v3 isEqualToString:@"CARPLAY_CONTROL"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"CARPLAY_PROACTIVE"])
  {
    int v4 = 1006;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ROUTING"])
  {
    int v4 = 1007;
  }
  else if ([v3 isEqualToString:@"CARPLAY_MORE_ROUTES"])
  {
    int v4 = 1008;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 1009;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH"])
  {
    int v4 = 1010;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH_RESULTS"])
  {
    int v4 = 1011;
  }
  else if ([v3 isEqualToString:@"CARPLAY_FAVORITES"])
  {
    int v4 = 1012;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NAV_CONFIRMATION"])
  {
    int v4 = 1013;
  }
  else if ([v3 isEqualToString:@"CARPLAY_DESTINATION_SHARING"])
  {
    int v4 = 1014;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_BATTERY"])
  {
    int v4 = 1015;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_DOOM"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_FUEL"])
  {
    int v4 = 1017;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_HYBRID"])
  {
    int v4 = 1018;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SHARE_ETA_TRAY"])
  {
    int v4 = 1019;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ETA_UPDATE_TRAY"])
  {
    int v4 = 1020;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ACTION_TRAY"])
  {
    int v4 = 1021;
  }
  else if ([v3 isEqualToString:@"CARPLAY_PLACECARD"])
  {
    int v4 = 1022;
  }
  else if ([v3 isEqualToString:@"CARPLAY_KEYBOARD"])
  {
    int v4 = 1023;
  }
  else if ([v3 isEqualToString:@"CARPLAY_UI_TARGET_UNKNOWN"])
  {
    int v4 = 1024;
  }
  else if ([v3 isEqualToString:@"CARPLAY_EDIT_STOPS"])
  {
    int v4 = 1025;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_MENU"])
  {
    int v4 = 1100;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST"])
  {
    int v4 = 1101;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM"])
  {
    int v4 = 1102;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM"])
  {
    int v4 = 1103;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM"])
  {
    int v4 = 1104;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM"])
  {
    int v4 = 1105;
  }
  else if ([v3 isEqualToString:@"RAP_TRANSIT_MENU"])
  {
    int v4 = 1106;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_MAP"])
  {
    int v4 = 1107;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_MENU"])
  {
    int v4 = 1108;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP"])
  {
    int v4 = 1109;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM"])
  {
    int v4 = 1110;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_CLOSED_FORM"])
  {
    int v4 = 1111;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_MAP"])
  {
    int v4 = 1112;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_MENU"])
  {
    int v4 = 1113;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_NAME_FORM"])
  {
    int v4 = 1114;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_SHAPE_FORM"])
  {
    int v4 = 1115;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_SCHEDULE_INCORRECT_FORM"])
  {
    int v4 = 1116;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_PLACE_MENU"])
  {
    int v4 = 1117;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_POI_MAP"])
  {
    int v4 = 1118;
  }
  else if ([v3 isEqualToString:@"RAP_CATEGORY_LIST"])
  {
    int v4 = 1119;
  }
  else if ([v3 isEqualToString:@"RAP_POI_DETAILS_FORM"])
  {
    int v4 = 1120;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_STREET_MAP"])
  {
    int v4 = 1121;
  }
  else if ([v3 isEqualToString:@"RAP_STREET_DETAILS_FORM"])
  {
    int v4 = 1122;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_OTHER_MAP"])
  {
    int v4 = 1123;
  }
  else if ([v3 isEqualToString:@"RAP_OTHER_DETAILS_FORM"])
  {
    int v4 = 1124;
  }
  else if ([v3 isEqualToString:@"RAP_CAMERA"])
  {
    int v4 = 1125;
  }
  else if ([v3 isEqualToString:@"RAP_LABEL_MAP"])
  {
    int v4 = 1126;
  }
  else if ([v3 isEqualToString:@"RAP_LABEL_DETAILS_FORM"])
  {
    int v4 = 1127;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_MENU"])
  {
    int v4 = 1128;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_UNEXPECTED_RESULT_FORM"])
  {
    int v4 = 1129;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_ADDRESS_INCORRECT_FORM"])
  {
    int v4 = 1130;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_MAP"])
  {
    int v4 = 1131;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM"])
  {
    int v4 = 1132;
  }
  else if ([v3 isEqualToString:@"RAP_SATELLITE_IMAGE_MAP"])
  {
    int v4 = 1133;
  }
  else if ([v3 isEqualToString:@"RAP_SATELLITE_IMAGE_DETAILS_FORM"])
  {
    int v4 = 1134;
  }
  else if ([v3 isEqualToString:@"RAP_OTHER_FORM"])
  {
    int v4 = 1135;
  }
  else if ([v3 isEqualToString:@"RAP_PRIVACY"])
  {
    int v4 = 1136;
  }
  else if ([v3 isEqualToString:@"RAP_CONFIRMATION"])
  {
    int v4 = 1137;
  }
  else if ([v3 isEqualToString:@"RAP_POI_MENU"])
  {
    int v4 = 1138;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_AUTOCOMPLETE_MENU"])
  {
    int v4 = 1139;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_A_PLACE_MAP"])
  {
    int v4 = 1140;
  }
  else if ([v3 isEqualToString:@"RAP_POI_LOCATION_MAP"])
  {
    int v4 = 1141;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP"])
  {
    int v4 = 1142;
  }
  else if ([v3 isEqualToString:@"RAP_POI_CLOSED_FORM"])
  {
    int v4 = 1143;
  }
  else if ([v3 isEqualToString:@"RAP_CLAIM_BUSINESS_DIALOG"])
  {
    int v4 = 1144;
  }
  else if ([v3 isEqualToString:@"RAP_BRAND_MENU"])
  {
    int v4 = 1145;
  }
  else if ([v3 isEqualToString:@"RAP_BRAND_DETAILS_FORM"])
  {
    int v4 = 1146;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM"])
  {
    int v4 = 1147;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STREET_FORM"])
  {
    int v4 = 1148;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_BLURRING_FORM"])
  {
    int v4 = 1149;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_REMOVE_HOME_FORM"])
  {
    int v4 = 1150;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_MENU"])
  {
    int v4 = 1151;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STORE_FORM"])
  {
    int v4 = 1152;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_PRIVACY_MENU"])
  {
    int v4 = 1153;
  }
  else if ([v3 isEqualToString:@"RAP_LIGHTWEIGHT"])
  {
    int v4 = 1154;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_PLACE_DETAILS"])
  {
    int v4 = 1155;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_CATEGORY"])
  {
    int v4 = 1156;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_HOURS"])
  {
    int v4 = 1157;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_LOCATION"])
  {
    int v4 = 1158;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_ENTRY_POINT"])
  {
    int v4 = 1159;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND"])
  {
    int v4 = 1160;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_ENTRY_POINT"])
  {
    int v4 = 1161;
  }
  else if ([v3 isEqualToString:@"WATCH_MAIN_MENU"])
  {
    int v4 = 1201;
  }
  else if ([v3 isEqualToString:@"WATCH_MAIN_PRESS_MENU"])
  {
    int v4 = 1202;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH"])
  {
    int v4 = 1203;
  }
  else if ([v3 isEqualToString:@"WATCH_DICTATION"])
  {
    int v4 = 1204;
  }
  else if ([v3 isEqualToString:@"WATCH_FAVORITES"])
  {
    int v4 = 1205;
  }
  else if ([v3 isEqualToString:@"WATCH_SUB_CATEGORY_LIST"])
  {
    int v4 = 1206;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_RESULTS_LIST"])
  {
    int v4 = 1207;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_VIEW"])
  {
    int v4 = 1208;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACECARD"])
  {
    int v4 = 1209;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING"])
  {
    int v4 = 1210;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_DETAILS"])
  {
    int v4 = 1211;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TBT"])
  {
    int v4 = 1212;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_MAP"])
  {
    int v4 = 1213;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_PRESS_MENU"])
  {
    int v4 = 1214;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_PRESS_MENU"])
  {
    int v4 = 1215;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTING_PRESS_MENU"])
  {
    int v4 = 1216;
  }
  else if ([v3 isEqualToString:@"WATCH_TRANSIT_MAP_VIEW"])
  {
    int v4 = 1217;
  }
  else if ([v3 isEqualToString:@"WATCH_SCRIBBLE"])
  {
    int v4 = 1218;
  }
  else if ([v3 isEqualToString:@"WATCH_COLLECTION_VIEW"])
  {
    int v4 = 1219;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING"])
  {
    int v4 = 1220;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING"])
  {
    int v4 = 1221;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT"])
  {
    int v4 = 1222;
  }
  else if ([v3 isEqualToString:@"WATCH_PAIRED_DEVICE"])
  {
    int v4 = 1223;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_SPLIT"])
  {
    int v4 = 1224;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_PLATTER"])
  {
    int v4 = 1225;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_MAP"])
  {
    int v4 = 1226;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_SPLIT"])
  {
    int v4 = 1227;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_PLATTER"])
  {
    int v4 = 1228;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_MAP"])
  {
    int v4 = 1229;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_SPLIT"])
  {
    int v4 = 1230;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_PLATTER"])
  {
    int v4 = 1231;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_MAP"])
  {
    int v4 = 1232;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_INFO"])
  {
    int v4 = 1233;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_MAP"])
  {
    int v4 = 1234;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_PLATTER"])
  {
    int v4 = 1235;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_SPLIT"])
  {
    int v4 = 1236;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING"])
  {
    int v4 = 1237;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_INPUT"])
  {
    int v4 = 1238;
  }
  else if ([v3 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
  {
    int v4 = 1239;
  }
  else if ([v3 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_ROUTE"])
  {
    int v4 = 1240;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_LIST"])
  {
    int v4 = 1301;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_FORM"])
  {
    int v4 = 1302;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_LABEL_FORM"])
  {
    int v4 = 1303;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_EDIT_MAP"])
  {
    int v4 = 1304;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_CONFIRMATION"])
  {
    int v4 = 1305;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_DELETE_DIALOG"])
  {
    int v4 = 1306;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_INFO"])
  {
    int v4 = 1307;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH"])
  {
    int v4 = 1308;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH_RESULTS"])
  {
    int v4 = 1309;
  }
  else if ([v3 isEqualToString:@"FAVORITE_SEARCH"])
  {
    int v4 = 1310;
  }
  else if ([v3 isEqualToString:@"FAVORITE_LIST"])
  {
    int v4 = 1311;
  }
  else if ([v3 isEqualToString:@"FAVORITE_INFO"])
  {
    int v4 = 1312;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_CONFIRMATION_WITH_PRIVACY"])
  {
    int v4 = 1313;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS"])
  {
    int v4 = 1401;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING"])
  {
    int v4 = 1402;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING"])
  {
    int v4 = 1403;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED"])
  {
    int v4 = 1404;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG"])
  {
    int v4 = 1405;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_FEEDBACK"])
  {
    int v4 = 1406;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_ENABLE_ALL"])
  {
    int v4 = 1407;
  }
  else if ([v3 isEqualToString:@"PLACECARD_HEADER"])
  {
    int v4 = 1501;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ADDRESS"])
  {
    int v4 = 1502;
  }
  else if ([v3 isEqualToString:@"PLACECARD_PHONE"])
  {
    int v4 = 1503;
  }
  else if ([v3 isEqualToString:@"PLACECARD_URL"])
  {
    int v4 = 1504;
  }
  else if ([v3 isEqualToString:@"MENU_ITEM_DARK_MAP"])
  {
    int v4 = 1601;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP"])
  {
    int v4 = 1700;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_ACTION_SHEET"])
  {
    int v4 = 1701;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_VIEW"])
  {
    int v4 = 1702;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PLATTER"])
  {
    int v4 = 1703;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM"])
  {
    int v4 = 1704;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_REGION"])
  {
    int v4 = 1705;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_VIEW_PLACECARD"])
  {
    int v4 = 1706;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_PLACECARD"])
  {
    int v4 = 1707;
  }
  else if ([v3 isEqualToString:@"OFFLINE_BROWSE_ONLY_SEARCH_TRAY"])
  {
    int v4 = 1708;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_PLACE"])
  {
    int v4 = 1801;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SEARCH"])
  {
    int v4 = 1802;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SEARCH_RESULTS"])
  {
    int v4 = 1803;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_PUBLISHER"])
  {
    int v4 = 1804;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_GUIDE"])
  {
    int v4 = 1805;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_GUIDES_HOME"])
  {
    int v4 = 1806;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_RELATED_PLACES_LIST"])
  {
    int v4 = 1807;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_COLLECTION_LIST"])
  {
    int v4 = 1808;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_DIRECTIONS"])
  {
    int v4 = 1809;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SIDEBAR"])
  {
    int v4 = 1810;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"nativePath";
      }
      else {
        unint64_t v7 = @"native_path";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v28 = a3;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v27 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (!v10) {
          goto LABEL_1034;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 isEqualToString:@"UI_TARGET_UNKNOWN"])
              {
                uint64_t v16 = 0;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_POI"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_SEARCH_RESULT_LIST"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_POPULAR_NEARBY_LIST"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_CALLOUT"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_SEARCH_PIN"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_DROPPED_PIN"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"UI_TARGET_TRANSIT_LINE"])
              {
                uint64_t v16 = 7;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY"])
              {
                uint64_t v16 = 8;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY_BROWSE"])
              {
                uint64_t v16 = 9;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY_POPULAR_NEARBY"])
              {
                uint64_t v16 = 10;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY_AC"])
              {
                uint64_t v16 = 11;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY_AC_INTERMEDIATE"])
              {
                uint64_t v16 = 12;
              }
              else if ([v15 isEqualToString:@"SEARCH_TRAY_NO_QUERY"])
              {
                uint64_t v16 = 13;
              }
              else if ([v15 isEqualToString:@"AR_WALKING_LEGAL_TRAY"])
              {
                uint64_t v16 = 14;
              }
              else if ([v15 isEqualToString:@"RAISE_TO_START_AR_TRAY"])
              {
                uint64_t v16 = 15;
              }
              else if ([v15 isEqualToString:@"EVENTS_ADVISORY_DETAILS_PAGE"])
              {
                uint64_t v16 = 16;
              }
              else if ([v15 isEqualToString:@"INCIDENT_REPORT_TRAY_CARPLAY"])
              {
                uint64_t v16 = 17;
              }
              else if ([v15 isEqualToString:@"HIGHLIGHTED_AREA"])
              {
                uint64_t v16 = 18;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTIONS_HOME"])
              {
                uint64_t v16 = 19;
              }
              else if ([v15 isEqualToString:@"TRAVEL_PREFERENCES_TRAY"])
              {
                uint64_t v16 = 20;
              }
              else if ([v15 isEqualToString:@"RESULT_TRAY_SEARCH"])
              {
                uint64_t v16 = 21;
              }
              else if ([v15 isEqualToString:@"SINGLE_CARD_FILTER"])
              {
                uint64_t v16 = 22;
              }
              else if ([v15 isEqualToString:@"FULL_CARD_FILTER"])
              {
                uint64_t v16 = 23;
              }
              else if ([v15 isEqualToString:@"ACCOUNT_PRIVACY_TRAY"])
              {
                uint64_t v16 = 24;
              }
              else if ([v15 isEqualToString:@"APPLE_RATINGS_HISTORY_TRAY"])
              {
                uint64_t v16 = 25;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTIONS_HOME_FILTERED"])
              {
                uint64_t v16 = 26;
              }
              else if ([v15 isEqualToString:@"CITY_MENU"])
              {
                uint64_t v16 = 27;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED"])
              {
                uint64_t v16 = 28;
              }
              else if ([v15 isEqualToString:@"ACCOUNT_TRAY"])
              {
                uint64_t v16 = 29;
              }
              else if ([v15 isEqualToString:@"QUICK_ACTION_TRAY"])
              {
                uint64_t v16 = 30;
              }
              else if ([v15 isEqualToString:@"SUBMIT_TRIP_FEEDBACK"])
              {
                uint64_t v16 = 31;
              }
              else if ([v15 isEqualToString:@"RAP_PLACE_ISSUE_DETAILS"])
              {
                uint64_t v16 = 32;
              }
              else if ([v15 isEqualToString:@"RAP_GUIDES_DETAILS"])
              {
                uint64_t v16 = 33;
              }
              else if ([v15 isEqualToString:@"RAP_BAD_DIRECTIONS_DETAILS"])
              {
                uint64_t v16 = 34;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_MAP_DETAILS"])
              {
                uint64_t v16 = 35;
              }
              else if ([v15 isEqualToString:@"WATCH_COMPLICATION"])
              {
                uint64_t v16 = 36;
              }
              else if ([v15 isEqualToString:@"RAP_NAV_MENU"])
              {
                uint64_t v16 = 37;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_ALIGHT_BANNER_TRANSIT"])
              {
                uint64_t v16 = 38;
              }
              else if ([v15 isEqualToString:@"RAP_REPORT_MENU"])
              {
                uint64_t v16 = 39;
              }
              else if ([v15 isEqualToString:@"RAP_CURATED_COLLECTION_MENU"])
              {
                uint64_t v16 = 40;
              }
              else if ([v15 isEqualToString:@"RAP_REPORT_CARD_DETAILS"])
              {
                uint64_t v16 = 41;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_NO_LOCATION_TRANSIT"])
              {
                uint64_t v16 = 42;
              }
              else if ([v15 isEqualToString:@"RAP_STREET_ISSUE_DETAILS"])
              {
                uint64_t v16 = 43;
              }
              else if ([v15 isEqualToString:@"NEARBY_TRANSIT_CARD"])
              {
                uint64_t v16 = 44;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_MENU"])
              {
                uint64_t v16 = 45;
              }
              else if ([v15 isEqualToString:@"GENERIC_ADVISORY_PAGE"])
              {
                uint64_t v16 = 46;
              }
              else if ([v15 isEqualToString:@"USER_PROFILE_TRAY"])
              {
                uint64_t v16 = 47;
              }
              else if ([v15 isEqualToString:@"MEDIA_APP_MENU"])
              {
                uint64_t v16 = 48;
              }
              else if ([v15 isEqualToString:@"TEMPLATE_PLACE_TRAY"])
              {
                uint64_t v16 = 49;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_RAP"])
              {
                uint64_t v16 = 50;
              }
              else if ([v15 isEqualToString:@"ALLOW_NOTIFICATION_DIALOG"])
              {
                uint64_t v16 = 51;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_DRIVING"])
              {
                uint64_t v16 = 52;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_ARP"])
              {
                uint64_t v16 = 53;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED"])
              {
                uint64_t v16 = 54;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CONSENT_PROMPT"])
              {
                uint64_t v16 = 55;
              }
              else if ([v15 isEqualToString:@"QUICK_ACTION_TRAY_VENDORS_MENU"])
              {
                uint64_t v16 = 56;
              }
              else if ([v15 isEqualToString:@"PLACECARD_TRAY_VENDORS_MENU"])
              {
                uint64_t v16 = 57;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_SEARCH_ROUTE_PLANNING"])
              {
                uint64_t v16 = 58;
              }
              else if ([v15 isEqualToString:@"SEARCH_ALONG_ROUTE_TRAY"])
              {
                uint64_t v16 = 59;
              }
              else if ([v15 isEqualToString:@"MAP_RESULTS_SEARCH_ROUTE_PLANNING"])
              {
                uint64_t v16 = 60;
              }
              else if ([v15 isEqualToString:@"PLACECARD_SHOWCASE_MENU"])
              {
                uint64_t v16 = 61;
              }
              else if ([v15 isEqualToString:@"RAP_INLINE_ADD_DETAILS"])
              {
                uint64_t v16 = 62;
              }
              else if ([v15 isEqualToString:@"RAP_EDIT_MENU_DETAILS"])
              {
                uint64_t v16 = 63;
              }
              else if ([v15 isEqualToString:@"RAP_SUBMISSION_PROMPT"])
              {
                uint64_t v16 = 64;
              }
              else if ([v15 isEqualToString:@"RAP_PLACECARD_EDIT_MENU"])
              {
                uint64_t v16 = 65;
              }
              else if ([v15 isEqualToString:@"ARP_SUBMISSION_CONFIRMATION_PAGE"])
              {
                uint64_t v16 = 66;
              }
              else if ([v15 isEqualToString:@"INCIDENT_REPORT_MENU"])
              {
                uint64_t v16 = 67;
              }
              else if ([v15 isEqualToString:@"RAP_SELECT_BAD_ROUTES_STEPS"])
              {
                uint64_t v16 = 68;
              }
              else if ([v15 isEqualToString:@"RAP_SELECT_BAD_ROUTES"])
              {
                uint64_t v16 = 69;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_RESUME_ROUTE"])
              {
                uint64_t v16 = 70;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
              {
                uint64_t v16 = 71;
              }
              else if ([v15 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY_LIST"])
              {
                uint64_t v16 = 72;
              }
              else if ([v15 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY"])
              {
                uint64_t v16 = 73;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_ARP"])
              {
                uint64_t v16 = 74;
              }
              else if ([v15 isEqualToString:@"IMPROVE_LOCATION_ACCURACY_PROMPT"])
              {
                uint64_t v16 = 75;
              }
              else if ([v15 isEqualToString:@"YOUR_PHOTOS_ALBUM"])
              {
                uint64_t v16 = 76;
              }
              else if ([v15 isEqualToString:@"ARP_PHOTO_CREDIT"])
              {
                uint64_t v16 = 77;
              }
              else if ([v15 isEqualToString:@"RAP_OUTREACH_REVIEWED_REPORT"])
              {
                uint64_t v16 = 78;
              }
              else if ([v15 isEqualToString:@"RAP_REPORT_MENU_MORE"])
              {
                uint64_t v16 = 79;
              }
              else if ([v15 isEqualToString:@"WATCH_MAPS_SETTINGS"])
              {
                uint64_t v16 = 80;
              }
              else if ([v15 isEqualToString:@"OFFLINE_FEATURE_PROMPT"])
              {
                uint64_t v16 = 81;
              }
              else if ([v15 isEqualToString:@"EXPIRED_MAPS_DETAILS"])
              {
                uint64_t v16 = 82;
              }
              else if ([v15 isEqualToString:@"MAPS_VIEW"])
              {
                uint64_t v16 = 83;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_OFFLINE"])
              {
                uint64_t v16 = 84;
              }
              else if ([v15 isEqualToString:@"EXPIRED_MAPS_MANAGEMENT"])
              {
                uint64_t v16 = 85;
              }
              else if ([v15 isEqualToString:@"OFFLINE_NEW_MAPS_MANAGEMENT"])
              {
                uint64_t v16 = 86;
              }
              else if ([v15 isEqualToString:@"EDIT_EXPIRED_MAPS_MANAGEMENT"])
              {
                uint64_t v16 = 87;
              }
              else if ([v15 isEqualToString:@"OFFLINE_MAPS_MANAGEMENT"])
              {
                uint64_t v16 = 88;
              }
              else if ([v15 isEqualToString:@"REGION_SELECTOR"])
              {
                uint64_t v16 = 89;
              }
              else if ([v15 isEqualToString:@"OFFLINE_SUGGESTED_MAPS_MANAGEMENT"])
              {
                uint64_t v16 = 90;
              }
              else if ([v15 isEqualToString:@"FIND_MY_ETA_SHARING_TRAY"])
              {
                uint64_t v16 = 91;
              }
              else if ([v15 isEqualToString:@"WATCH_PLACE"])
              {
                uint64_t v16 = 92;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL"])
              {
                uint64_t v16 = 93;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_MAP"])
              {
                uint64_t v16 = 94;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_CONTROLS"])
              {
                uint64_t v16 = 95;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_CONTROLS"])
              {
                uint64_t v16 = 96;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL"])
              {
                uint64_t v16 = 97;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TRANSIT_CONTROLS"])
              {
                uint64_t v16 = 98;
              }
              else if ([v15 isEqualToString:@"WATCH_SEARCH_RESULTS_CAROUSEL"])
              {
                uint64_t v16 = 99;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_DRIVING_CONTROLS"])
              {
                uint64_t v16 = 100;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_SEARCH"])
              {
                uint64_t v16 = 101;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_BROWSE"])
              {
                uint64_t v16 = 102;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_FAVORITES"])
              {
                uint64_t v16 = 103;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_SEARCH_ALONG_ROUTE"])
              {
                uint64_t v16 = 104;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_CLUSTER"])
              {
                uint64_t v16 = 105;
              }
              else if ([v15 isEqualToString:@"RESULTS_TRAY_VENUE_BROWSE"])
              {
                uint64_t v16 = 106;
              }
              else if ([v15 isEqualToString:@"WATCH_MAP_RESULTS"])
              {
                uint64_t v16 = 107;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_ELEVATION_VIEW"])
              {
                uint64_t v16 = 108;
              }
              else if ([v15 isEqualToString:@"WATCH_PLACES"])
              {
                uint64_t v16 = 109;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_ELEVATION_VIEW"])
              {
                uint64_t v16 = 110;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL"])
              {
                uint64_t v16 = 111;
              }
              else if ([v15 isEqualToString:@"DOWNLOADED_MAPS_DETAILS"])
              {
                uint64_t v16 = 112;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL"])
              {
                uint64_t v16 = 113;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TRANSIT_OVERVIEW_MAP"])
              {
                uint64_t v16 = 114;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_OVERVIEW_MAP"])
              {
                uint64_t v16 = 115;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_OVERVIEW_MAP"])
              {
                uint64_t v16 = 116;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_OPTIONS"])
              {
                uint64_t v16 = 117;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_DRIVING_OVERVIEW_MAP"])
              {
                uint64_t v16 = 118;
              }
              else if ([v15 isEqualToString:@"WATCH_MORE_GUIDES"])
              {
                uint64_t v16 = 119;
              }
              else if ([v15 isEqualToString:@"WATCH_RECENTLY_VIEWED"])
              {
                uint64_t v16 = 120;
              }
              else if ([v15 isEqualToString:@"EV_SUCCESS_TRAY"])
              {
                uint64_t v16 = 121;
              }
              else if ([v15 isEqualToString:@"PREFERRED_NETWORK_SELECTION_TRAY"])
              {
                uint64_t v16 = 122;
              }
              else if ([v15 isEqualToString:@"PREFERRED_NETWORK_TRAY"])
              {
                uint64_t v16 = 123;
              }
              else if ([v15 isEqualToString:@"WALKING_TRANSITION_SUGGESTION_TRAY"])
              {
                uint64_t v16 = 124;
              }
              else if ([v15 isEqualToString:@"FINDMY_TRANSITION_SUGGESTION_TRAY"])
              {
                uint64_t v16 = 125;
              }
              else if ([v15 isEqualToString:@"CARPLAY_FIND_MY_ETA_SHARING_TRAY"])
              {
                uint64_t v16 = 126;
              }
              else if ([v15 isEqualToString:@"AC_KEYBOARD_TRAY"])
              {
                uint64_t v16 = 127;
              }
              else if ([v15 isEqualToString:@"MORE_RELATED_TRAILS"])
              {
                uint64_t v16 = 128;
              }
              else if ([v15 isEqualToString:@"MORE_RELATED_TRAILHEADS"])
              {
                uint64_t v16 = 129;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_CUSTOM_ROUTE"])
              {
                uint64_t v16 = 130;
              }
              else if ([v15 isEqualToString:@"CUSTOM_ROUTE_CREATION_TRAY"])
              {
                uint64_t v16 = 131;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE"])
              {
                uint64_t v16 = 132;
              }
              else if ([v15 isEqualToString:@"MORE_CURATED_HIKES"])
              {
                uint64_t v16 = 133;
              }
              else if ([v15 isEqualToString:@"CUSTOM_ROUTE_ONBOARDING"])
              {
                uint64_t v16 = 134;
              }
              else if ([v15 isEqualToString:@"LIBRARY_ROUTES"])
              {
                uint64_t v16 = 135;
              }
              else if ([v15 isEqualToString:@"HIKING_TRANSITION_SUGGESTION_TRAY"])
              {
                uint64_t v16 = 136;
              }
              else if ([v15 isEqualToString:@"MY_LIBRARY"])
              {
                uint64_t v16 = 137;
              }
              else if ([v15 isEqualToString:@"EDIT_NOTE_TRAY"])
              {
                uint64_t v16 = 138;
              }
              else if ([v15 isEqualToString:@"CREATE_NOTE_TRAY"])
              {
                uint64_t v16 = 139;
              }
              else if ([v15 isEqualToString:@"LIBRARY_PLACES"])
              {
                uint64_t v16 = 140;
              }
              else if ([v15 isEqualToString:@"WATCH_ACCOUNT"])
              {
                uint64_t v16 = 141;
              }
              else if ([v15 isEqualToString:@"WATCH_DOWNLOADED_MAPS"])
              {
                uint64_t v16 = 142;
              }
              else if ([v15 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION_LIST"])
              {
                uint64_t v16 = 143;
              }
              else if ([v15 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION"])
              {
                uint64_t v16 = 144;
              }
              else if ([v15 isEqualToString:@"VISUAL_INTELLIGENCE_SNIPPET"])
              {
                uint64_t v16 = 145;
              }
              else if ([v15 isEqualToString:@"PLACECARD_TRAY"])
              {
                uint64_t v16 = 201;
              }
              else if ([v15 isEqualToString:@"WEB_MODULE"])
              {
                uint64_t v16 = 202;
              }
              else if ([v15 isEqualToString:@"ADD_FAVORITE_TRAY"])
              {
                uint64_t v16 = 250;
              }
              else if ([v15 isEqualToString:@"COLLECTION_LIST"])
              {
                uint64_t v16 = 251;
              }
              else if ([v15 isEqualToString:@"COLLECTION_VIEW"])
              {
                uint64_t v16 = 252;
              }
              else if ([v15 isEqualToString:@"FAVORITE_DETAILS"])
              {
                uint64_t v16 = 253;
              }
              else if ([v15 isEqualToString:@"FAVORITES_TRAY"])
              {
                uint64_t v16 = 254;
              }
              else if ([v15 isEqualToString:@"SHARED_COLLECTION"])
              {
                uint64_t v16 = 255;
              }
              else if ([v15 isEqualToString:@"SHARED_COLLECTION_VIEW"])
              {
                uint64_t v16 = 256;
              }
              else if ([v15 isEqualToString:@"RECENTLY_VIEWED"])
              {
                uint64_t v16 = 257;
              }
              else if ([v15 isEqualToString:@"SHARED_WEB_COLLECTION"])
              {
                uint64_t v16 = 258;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTION_VIEW"])
              {
                uint64_t v16 = 259;
              }
              else if ([v15 isEqualToString:@"FEATURED_COLLECTIONS"])
              {
                uint64_t v16 = 260;
              }
              else if ([v15 isEqualToString:@"PUBLISHER_TRAY"])
              {
                uint64_t v16 = 261;
              }
              else if ([v15 isEqualToString:@"SHARED_CURATED_COLLECTION_VIEW"])
              {
                uint64_t v16 = 262;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTION_NOTIFICATION"])
              {
                uint64_t v16 = 263;
              }
              else if ([v15 isEqualToString:@"CURATED_COLLECTION_LIST"])
              {
                uint64_t v16 = 264;
              }
              else if ([v15 isEqualToString:@"PUBLISHER_LIST"])
              {
                uint64_t v16 = 265;
              }
              else if ([v15 isEqualToString:@"WATCH_CURATED_COLLECTION_VIEW"])
              {
                uint64_t v16 = 266;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_SUBLIST"])
              {
                uint64_t v16 = 267;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST"])
              {
                uint64_t v16 = 268;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_DRIVING"])
              {
                uint64_t v16 = 301;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_WALKING"])
              {
                uint64_t v16 = 302;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_TRANSIT"])
              {
                uint64_t v16 = 303;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE"])
              {
                uint64_t v16 = 304;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_CYCLING"])
              {
                uint64_t v16 = 305;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW"])
              {
                uint64_t v16 = 306;
              }
              else if ([v15 isEqualToString:@"NAV_TRAY_DRIVING"])
              {
                uint64_t v16 = 401;
              }
              else if ([v15 isEqualToString:@"NAV_TRAY_WALKING"])
              {
                uint64_t v16 = 402;
              }
              else if ([v15 isEqualToString:@"NAV_TRAY_TRANSIT"])
              {
                uint64_t v16 = 403;
              }
              else if ([v15 isEqualToString:@"NAV_TRAY_CYCLING"])
              {
                uint64_t v16 = 404;
              }
              else if ([v15 isEqualToString:@"MAP_PLACECARD"])
              {
                uint64_t v16 = 501;
              }
              else if ([v15 isEqualToString:@"MAP_SEARCH"])
              {
                uint64_t v16 = 502;
              }
              else if ([v15 isEqualToString:@"MAP_RESULTS"])
              {
                uint64_t v16 = 503;
              }
              else if ([v15 isEqualToString:@"MAP_ROUTING"])
              {
                uint64_t v16 = 504;
              }
              else if ([v15 isEqualToString:@"MAP_NAV"])
              {
                uint64_t v16 = 505;
              }
              else if ([v15 isEqualToString:@"MAP_RESULTS_SEARCH_ALONG_ROUTE"])
              {
                uint64_t v16 = 506;
              }
              else if ([v15 isEqualToString:@"MAP_TRAFFIC_INCIDENT"])
              {
                uint64_t v16 = 507;
              }
              else if ([v15 isEqualToString:@"MAP_FULL_SCREEN"])
              {
                uint64_t v16 = 508;
              }
              else if ([v15 isEqualToString:@"MAP_DRIVE"])
              {
                uint64_t v16 = 509;
              }
              else if ([v15 isEqualToString:@"MAP_LAUNCH_AND_GO"])
              {
                uint64_t v16 = 510;
              }
              else if ([v15 isEqualToString:@"MAP_VIEW"])
              {
                uint64_t v16 = 511;
              }
              else if ([v15 isEqualToString:@"MAPS_SETTINGS"])
              {
                uint64_t v16 = 601;
              }
              else if ([v15 isEqualToString:@"MAPS_PREFERENCES"])
              {
                uint64_t v16 = 602;
              }
              else if ([v15 isEqualToString:@"RAP"])
              {
                uint64_t v16 = 603;
              }
              else if ([v15 isEqualToString:@"ROUTING_DRIVING_DETAILS"])
              {
                uint64_t v16 = 604;
              }
              else if ([v15 isEqualToString:@"ROUTING_WALKING_DETAILS"])
              {
                uint64_t v16 = 605;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRANSIT_DETAILS"])
              {
                uint64_t v16 = 606;
              }
              else if ([v15 isEqualToString:@"ROUTING_EDITOR"])
              {
                uint64_t v16 = 607;
              }
              else if ([v15 isEqualToString:@"NAV_DRIVING_DETAILS"])
              {
                uint64_t v16 = 608;
              }
              else if ([v15 isEqualToString:@"NAV_WALKING_DETAILS"])
              {
                uint64_t v16 = 609;
              }
              else if ([v15 isEqualToString:@"NAV_TRANSIT_DETAILS"])
              {
                uint64_t v16 = 610;
              }
              else if ([v15 isEqualToString:@"NAV_AUDIO_SETTINGS"])
              {
                uint64_t v16 = 611;
              }
              else if ([v15 isEqualToString:@"PHOTO_VIEWER_ALL"])
              {
                uint64_t v16 = 612;
              }
              else if ([v15 isEqualToString:@"PHOTO_VIEWER_SINGLE"])
              {
                uint64_t v16 = 613;
              }
              else if ([v15 isEqualToString:@"ROUTE_OPTIONS_TRANSIT"])
              {
                uint64_t v16 = 614;
              }
              else if ([v15 isEqualToString:@"TRAFFIC_INCIDENT_TRAY"])
              {
                uint64_t v16 = 615;
              }
              else if ([v15 isEqualToString:@"NAV_DIRECTIONS_BANNER_DRIVING"])
              {
                uint64_t v16 = 616;
              }
              else if ([v15 isEqualToString:@"NAV_DIRECTIONS_BANNER_WALKING"])
              {
                uint64_t v16 = 617;
              }
              else if ([v15 isEqualToString:@"NAV_DIRECTIONS_BANNER_TRANSIT"])
              {
                uint64_t v16 = 618;
              }
              else if ([v15 isEqualToString:@"REFINE_SEARCH_SUGGESTION_AREA"])
              {
                uint64_t v16 = 619;
              }
              else if ([v15 isEqualToString:@"ADD_PHOTO_SHEET"])
              {
                uint64_t v16 = 620;
              }
              else if ([v15 isEqualToString:@"ADD_PLACE_SHEET"])
              {
                uint64_t v16 = 621;
              }
              else if ([v15 isEqualToString:@"SHARE_SHEET"])
              {
                uint64_t v16 = 622;
              }
              else if ([v15 isEqualToString:@"EDIT_LOCATION_SHEET"])
              {
                uint64_t v16 = 623;
              }
              else if ([v15 isEqualToString:@"ADD_CONTACT_SHEET"])
              {
                uint64_t v16 = 624;
              }
              else if ([v15 isEqualToString:@"EDIT_NAME_SHEET"])
              {
                uint64_t v16 = 625;
              }
              else if ([v15 isEqualToString:@"DRIVING_NAV_SETTINGS"])
              {
                uint64_t v16 = 626;
              }
              else if ([v15 isEqualToString:@"TRANSIT_SETTINGS"])
              {
                uint64_t v16 = 627;
              }
              else if ([v15 isEqualToString:@"TRANSIT_ADVISORY_SHEET"])
              {
                uint64_t v16 = 628;
              }
              else if ([v15 isEqualToString:@"REMOVE_CAR_SHEET"])
              {
                uint64_t v16 = 629;
              }
              else if ([v15 isEqualToString:@"ROUTE_OPTIONS_DRIVING"])
              {
                uint64_t v16 = 630;
              }
              else if ([v15 isEqualToString:@"ROUTE_OPTIONS_DATETIME"])
              {
                uint64_t v16 = 631;
              }
              else if ([v15 isEqualToString:@"TRANSIT_ADVISORY_BANNER"])
              {
                uint64_t v16 = 632;
              }
              else if ([v15 isEqualToString:@"BOOK_TABLE_SELECT_TIME"])
              {
                uint64_t v16 = 633;
              }
              else if ([v15 isEqualToString:@"BOOK_TABLE_MORE_OPTIONS"])
              {
                uint64_t v16 = 634;
              }
              else if ([v15 isEqualToString:@"BOOK_TABLE_READY"])
              {
                uint64_t v16 = 635;
              }
              else if ([v15 isEqualToString:@"BOOK_TABLE_BOOKED"])
              {
                uint64_t v16 = 636;
              }
              else if ([v15 isEqualToString:@"TRANSIT_LINE_CLUSTER_SHEET"])
              {
                uint64_t v16 = 637;
              }
              else if ([v15 isEqualToString:@"TRANSIT_LINE_LIST_SHEET"])
              {
                uint64_t v16 = 638;
              }
              else if ([v15 isEqualToString:@"TRANSIT_BALANCE_BANNER"])
              {
                uint64_t v16 = 639;
              }
              else if ([v15 isEqualToString:@"WEATHER_ICON"])
              {
                uint64_t v16 = 640;
              }
              else if ([v15 isEqualToString:@"HELP_IMPROVE_MAPS_DIALOG"])
              {
                uint64_t v16 = 641;
              }
              else if ([v15 isEqualToString:@"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG"])
              {
                uint64_t v16 = 642;
              }
              else if ([v15 isEqualToString:@"COMMUTE_PREDICTION_ACCURACY_DIALOG"])
              {
                uint64_t v16 = 643;
              }
              else if ([v15 isEqualToString:@"FLOOR_PICKER"])
              {
                uint64_t v16 = 644;
              }
              else if ([v15 isEqualToString:@"VENUE_LIST"])
              {
                uint64_t v16 = 645;
              }
              else if ([v15 isEqualToString:@"AR_MODE"])
              {
                uint64_t v16 = 646;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRANSIT_TICKETS_SHEET"])
              {
                uint64_t v16 = 647;
              }
              else if ([v15 isEqualToString:@"LINKED_SERVICE_HOURS"])
              {
                uint64_t v16 = 648;
              }
              else if ([v15 isEqualToString:@"SHARE_ETA_TRAY"])
              {
                uint64_t v16 = 649;
              }
              else if ([v15 isEqualToString:@"ETA_UPDATE_TRAY"])
              {
                uint64_t v16 = 650;
              }
              else if ([v15 isEqualToString:@"SCHEDULECARD_TRAY"])
              {
                uint64_t v16 = 651;
              }
              else if ([v15 isEqualToString:@"AR_NAV"])
              {
                uint64_t v16 = 652;
              }
              else if ([v15 isEqualToString:@"TAP_TRANSIT_ACCESS_POINT"])
              {
                uint64_t v16 = 653;
              }
              else if ([v15 isEqualToString:@"LOCATIONS_INSIDE"])
              {
                uint64_t v16 = 654;
              }
              else if ([v15 isEqualToString:@"SIMILAR_LOCATIONS"])
              {
                uint64_t v16 = 655;
              }
              else if ([v15 isEqualToString:@"LOCATIONS_AT_ADDRESS"])
              {
                uint64_t v16 = 656;
              }
              else if ([v15 isEqualToString:@"NAV_DIRECTIONS_BANNER_CYCLING"])
              {
                uint64_t v16 = 657;
              }
              else if ([v15 isEqualToString:@"ROUTE_OPTIONS_CYCLING"])
              {
                uint64_t v16 = 658;
              }
              else if ([v15 isEqualToString:@"EV_CONNECTION_TRAY"])
              {
                uint64_t v16 = 659;
              }
              else if ([v15 isEqualToString:@"VIRTUAL_GARAGE"])
              {
                uint64_t v16 = 660;
              }
              else if ([v15 isEqualToString:@"VIRTUAL_GARAGE_BANNER"])
              {
                uint64_t v16 = 661;
              }
              else if ([v15 isEqualToString:@"VIRTUAL_GARAGE_VEHICLE_VIEW"])
              {
                uint64_t v16 = 662;
              }
              else if ([v15 isEqualToString:@"ADVISORY_DETAILS_PAGE"])
              {
                uint64_t v16 = 663;
              }
              else if ([v15 isEqualToString:@"APP_CLIP_NOTIFICATION"])
              {
                uint64_t v16 = 664;
              }
              else if ([v15 isEqualToString:@"PHOTO_VIEWER_GALLERY"])
              {
                uint64_t v16 = 665;
              }
              else if ([v15 isEqualToString:@"RECOMMENDATION_CARD"])
              {
                uint64_t v16 = 666;
              }
              else if ([v15 isEqualToString:@"INCIDENT_REPORT_TRAY"])
              {
                uint64_t v16 = 667;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_DISPLAY"])
              {
                uint64_t v16 = 668;
              }
              else if ([v15 isEqualToString:@"VISUAL_LOCATION_FRAMEWORK"])
              {
                uint64_t v16 = 669;
              }
              else if ([v15 isEqualToString:@"APP_CLIP_TRAY"])
              {
                uint64_t v16 = 670;
              }
              else if ([v15 isEqualToString:@"LICENSE_PLATE_SUGGESTION_PAGE"])
              {
                uint64_t v16 = 671;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_ADD_PLATE"])
              {
                uint64_t v16 = 672;
              }
              else if ([v15 isEqualToString:@"MAPS_RESULTS"])
              {
                uint64_t v16 = 673;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_APP_CONNECTION"])
              {
                uint64_t v16 = 674;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_CURRENT_LOCATION"])
              {
                uint64_t v16 = 675;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_CURRENT_NAV"])
              {
                uint64_t v16 = 676;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_ETA"])
              {
                uint64_t v16 = 677;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_TRANSIT"])
              {
                uint64_t v16 = 678;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_UPC_DESTINATION"])
              {
                uint64_t v16 = 679;
              }
              else if ([v15 isEqualToString:@"WIDGET_CREATION_TRAY"])
              {
                uint64_t v16 = 680;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_HOME"])
              {
                uint64_t v16 = 681;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_PARKED_CAR"])
              {
                uint64_t v16 = 682;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_POI"])
              {
                uint64_t v16 = 683;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_SCHOOL"])
              {
                uint64_t v16 = 684;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_WORK"])
              {
                uint64_t v16 = 685;
              }
              else if ([v15 isEqualToString:@"AIRPORT_NOTIFICATION"])
              {
                uint64_t v16 = 686;
              }
              else if ([v15 isEqualToString:@"MAPS_WIDGET_EMPTY"])
              {
                uint64_t v16 = 687;
              }
              else if ([v15 isEqualToString:@"COARSE_LOCATION_OPTIONS_PROMPT"])
              {
                uint64_t v16 = 688;
              }
              else if ([v15 isEqualToString:@"ALLOW_PRECISE_LOCATION_PROMPT"])
              {
                uint64_t v16 = 689;
              }
              else if ([v15 isEqualToString:@"SHARE_MY_LOCATION"])
              {
                uint64_t v16 = 690;
              }
              else if ([v15 isEqualToString:@"MARK_MY_LOCATION"])
              {
                uint64_t v16 = 691;
              }
              else if ([v15 isEqualToString:@"AIRPORT_NOTIFICATION_WATCH"])
              {
                uint64_t v16 = 692;
              }
              else if ([v15 isEqualToString:@"EDIT_FAVORITE"])
              {
                uint64_t v16 = 693;
              }
              else if ([v15 isEqualToString:@"ROUTING_CYCLING_DETAILS"])
              {
                uint64_t v16 = 694;
              }
              else if ([v15 isEqualToString:@"NAV_CYCLING_DETAILS"])
              {
                uint64_t v16 = 695;
              }
              else if ([v15 isEqualToString:@"MAPS_SUGGESTION_WIDGET"])
              {
                uint64_t v16 = 696;
              }
              else if ([v15 isEqualToString:@"ARP_TIPKIT"])
              {
                uint64_t v16 = 697;
              }
              else if ([v15 isEqualToString:@"ARP_PRIVACY"])
              {
                uint64_t v16 = 698;
              }
              else if ([v15 isEqualToString:@"ROUTE_OPTIONS_WALKING"])
              {
                uint64_t v16 = 699;
              }
              else if ([v15 isEqualToString:@"SAFARI_SEARCH"])
              {
                uint64_t v16 = 701;
              }
              else if ([v15 isEqualToString:@"SPOTLIGHT_SEARCH"])
              {
                uint64_t v16 = 702;
              }
              else if ([v15 isEqualToString:@"SAFARI_MAPS_SEARCH_RESULTS"])
              {
                uint64_t v16 = 703;
              }
              else if ([v15 isEqualToString:@"SPOTLIGHT_MAPS_SEARCH_RESULTS"])
              {
                uint64_t v16 = 704;
              }
              else if ([v15 isEqualToString:@"WIDGET_MAPS_DESTINATIONS"])
              {
                uint64_t v16 = 705;
              }
              else if ([v15 isEqualToString:@"WIDGET_MAPS_TRANSIT"])
              {
                uint64_t v16 = 706;
              }
              else if ([v15 isEqualToString:@"WIDGET_MAPS_NEARBY"])
              {
                uint64_t v16 = 707;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_FIND_MY_CAR"])
              {
                uint64_t v16 = 708;
              }
              else if ([v15 isEqualToString:@"CONTROL_CENTER"])
              {
                uint64_t v16 = 709;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_CENTER"])
              {
                uint64_t v16 = 710;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_DOOM"])
              {
                uint64_t v16 = 711;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_VENUES"])
              {
                uint64_t v16 = 712;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_RAP_UPDATE"])
              {
                uint64_t v16 = 713;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_TRIP_CANCELLED"])
              {
                uint64_t v16 = 714;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_STOP_SKIPPED"])
              {
                uint64_t v16 = 715;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_TRIP_DELAYED"])
              {
                uint64_t v16 = 716;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_RAP"])
              {
                uint64_t v16 = 717;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_PROXY_AUTH"])
              {
                uint64_t v16 = 718;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_PUSH_TO_DEVICE"])
              {
                uint64_t v16 = 719;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_LOW_FUEL"])
              {
                uint64_t v16 = 720;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_FIND_MY_CAR_RESET"])
              {
                uint64_t v16 = 721;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_TRAFFIC_CONDITIONS"])
              {
                uint64_t v16 = 722;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_SHARED_ETA"])
              {
                uint64_t v16 = 723;
              }
              else if ([v15 isEqualToString:@"NOTIFICATION_SHARED_ETA_UPDATE"])
              {
                uint64_t v16 = 724;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
              {
                uint64_t v16 = 725;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
              {
                uint64_t v16 = 726;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
              {
                uint64_t v16 = 727;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
              {
                uint64_t v16 = 728;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
              {
                uint64_t v16 = 729;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
              {
                uint64_t v16 = 730;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
              {
                uint64_t v16 = 731;
              }
              else if ([v15 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
              {
                uint64_t v16 = 732;
              }
              else if ([v15 isEqualToString:@"APP_SHEET"])
              {
                uint64_t v16 = 733;
              }
              else if ([v15 isEqualToString:@"CZ_ADVISORY_DETAILS_PAGE"])
              {
                uint64_t v16 = 734;
              }
              else if ([v15 isEqualToString:@"SHARE_ETA_CONTACT_TRAY"])
              {
                uint64_t v16 = 735;
              }
              else if ([v15 isEqualToString:@"SIRI_SHARE_ETA"])
              {
                uint64_t v16 = 736;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA"])
              {
                uint64_t v16 = 737;
              }
              else if ([v15 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY"])
              {
                uint64_t v16 = 738;
              }
              else if ([v15 isEqualToString:@"INCIDENT_ALERT_TRAY"])
              {
                uint64_t v16 = 739;
              }
              else if ([v15 isEqualToString:@"INCIDENT_REPORT_CONFIRMATION_TRAY"])
              {
                uint64_t v16 = 740;
              }
              else if ([v15 isEqualToString:@"RAP_INCIDENT_REPORT_VIEW"])
              {
                uint64_t v16 = 741;
              }
              else if ([v15 isEqualToString:@"SEARCH_ALONG_ROUTE_CATEGORY_TRAY"])
              {
                uint64_t v16 = 742;
              }
              else if ([v15 isEqualToString:@"TRAFFIC_ADVISORY_SHEET"])
              {
                uint64_t v16 = 743;
              }
              else if ([v15 isEqualToString:@"SIRI_PLUGIN_SNIPPET"])
              {
                uint64_t v16 = 801;
              }
              else if ([v15 isEqualToString:@"SIRI_PLUGIN_COMMAND"])
              {
                uint64_t v16 = 802;
              }
              else if ([v15 isEqualToString:@"SIRI_SEARCH_RESULT_LIST"])
              {
                uint64_t v16 = 803;
              }
              else if ([v15 isEqualToString:@"SIRI_DISAMBIGUATION_LIST"])
              {
                uint64_t v16 = 804;
              }
              else if ([v15 isEqualToString:@"SIRI_PLACE_SNIPPET"])
              {
                uint64_t v16 = 805;
              }
              else if ([v15 isEqualToString:@"CHROME"])
              {
                uint64_t v16 = 901;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NAV"])
              {
                uint64_t v16 = 1001;
              }
              else if ([v15 isEqualToString:@"CARPLAY_EXPLORE"])
              {
                uint64_t v16 = 1002;
              }
              else if ([v15 isEqualToString:@"CARPLAY_DESTINATIONS"])
              {
                uint64_t v16 = 1003;
              }
              else if ([v15 isEqualToString:@"CARPLAY_TRAFFIC_INCIDENT"])
              {
                uint64_t v16 = 1004;
              }
              else if ([v15 isEqualToString:@"CARPLAY_CONTROL"])
              {
                uint64_t v16 = 1005;
              }
              else if ([v15 isEqualToString:@"CARPLAY_PROACTIVE"])
              {
                uint64_t v16 = 1006;
              }
              else if ([v15 isEqualToString:@"CARPLAY_ROUTING"])
              {
                uint64_t v16 = 1007;
              }
              else if ([v15 isEqualToString:@"CARPLAY_MORE_ROUTES"])
              {
                uint64_t v16 = 1008;
              }
              else if ([v15 isEqualToString:@"CARPLAY_SEARCH_ALONG_ROUTE"])
              {
                uint64_t v16 = 1009;
              }
              else if ([v15 isEqualToString:@"CARPLAY_SEARCH"])
              {
                uint64_t v16 = 1010;
              }
              else if ([v15 isEqualToString:@"CARPLAY_SEARCH_RESULTS"])
              {
                uint64_t v16 = 1011;
              }
              else if ([v15 isEqualToString:@"CARPLAY_FAVORITES"])
              {
                uint64_t v16 = 1012;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NAV_CONFIRMATION"])
              {
                uint64_t v16 = 1013;
              }
              else if ([v15 isEqualToString:@"CARPLAY_DESTINATION_SHARING"])
              {
                uint64_t v16 = 1014;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NOTIFICATION_BATTERY"])
              {
                uint64_t v16 = 1015;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NOTIFICATION_DOOM"])
              {
                uint64_t v16 = 1016;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NOTIFICATION_FUEL"])
              {
                uint64_t v16 = 1017;
              }
              else if ([v15 isEqualToString:@"CARPLAY_NOTIFICATION_HYBRID"])
              {
                uint64_t v16 = 1018;
              }
              else if ([v15 isEqualToString:@"CARPLAY_SHARE_ETA_TRAY"])
              {
                uint64_t v16 = 1019;
              }
              else if ([v15 isEqualToString:@"CARPLAY_ETA_UPDATE_TRAY"])
              {
                uint64_t v16 = 1020;
              }
              else if ([v15 isEqualToString:@"CARPLAY_ACTION_TRAY"])
              {
                uint64_t v16 = 1021;
              }
              else if ([v15 isEqualToString:@"CARPLAY_PLACECARD"])
              {
                uint64_t v16 = 1022;
              }
              else if ([v15 isEqualToString:@"CARPLAY_KEYBOARD"])
              {
                uint64_t v16 = 1023;
              }
              else if ([v15 isEqualToString:@"CARPLAY_UI_TARGET_UNKNOWN"])
              {
                uint64_t v16 = 1024;
              }
              else if ([v15 isEqualToString:@"CARPLAY_EDIT_STOPS"])
              {
                uint64_t v16 = 1025;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_MENU"])
              {
                uint64_t v16 = 1100;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST"])
              {
                uint64_t v16 = 1101;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM"])
              {
                uint64_t v16 = 1102;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM"])
              {
                uint64_t v16 = 1103;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM"])
              {
                uint64_t v16 = 1104;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM"])
              {
                uint64_t v16 = 1105;
              }
              else if ([v15 isEqualToString:@"RAP_TRANSIT_MENU"])
              {
                uint64_t v16 = 1106;
              }
              else if ([v15 isEqualToString:@"RAP_STATION_MAP"])
              {
                uint64_t v16 = 1107;
              }
              else if ([v15 isEqualToString:@"RAP_STATION_MENU"])
              {
                uint64_t v16 = 1108;
              }
              else if ([v15 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP"])
              {
                uint64_t v16 = 1109;
              }
              else if ([v15 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM"])
              {
                uint64_t v16 = 1110;
              }
              else if ([v15 isEqualToString:@"RAP_STATION_CLOSED_FORM"])
              {
                uint64_t v16 = 1111;
              }
              else if ([v15 isEqualToString:@"RAP_LINE_MAP"])
              {
                uint64_t v16 = 1112;
              }
              else if ([v15 isEqualToString:@"RAP_LINE_MENU"])
              {
                uint64_t v16 = 1113;
              }
              else if ([v15 isEqualToString:@"RAP_LINE_NAME_FORM"])
              {
                uint64_t v16 = 1114;
              }
              else if ([v15 isEqualToString:@"RAP_LINE_SHAPE_FORM"])
              {
                uint64_t v16 = 1115;
              }
              else if ([v15 isEqualToString:@"RAP_LINE_SCHEDULE_INCORRECT_FORM"])
              {
                uint64_t v16 = 1116;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_PLACE_MENU"])
              {
                uint64_t v16 = 1117;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_POI_MAP"])
              {
                uint64_t v16 = 1118;
              }
              else if ([v15 isEqualToString:@"RAP_CATEGORY_LIST"])
              {
                uint64_t v16 = 1119;
              }
              else if ([v15 isEqualToString:@"RAP_POI_DETAILS_FORM"])
              {
                uint64_t v16 = 1120;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_STREET_MAP"])
              {
                uint64_t v16 = 1121;
              }
              else if ([v15 isEqualToString:@"RAP_STREET_DETAILS_FORM"])
              {
                uint64_t v16 = 1122;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_OTHER_MAP"])
              {
                uint64_t v16 = 1123;
              }
              else if ([v15 isEqualToString:@"RAP_OTHER_DETAILS_FORM"])
              {
                uint64_t v16 = 1124;
              }
              else if ([v15 isEqualToString:@"RAP_CAMERA"])
              {
                uint64_t v16 = 1125;
              }
              else if ([v15 isEqualToString:@"RAP_LABEL_MAP"])
              {
                uint64_t v16 = 1126;
              }
              else if ([v15 isEqualToString:@"RAP_LABEL_DETAILS_FORM"])
              {
                uint64_t v16 = 1127;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_MENU"])
              {
                uint64_t v16 = 1128;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_UNEXPECTED_RESULT_FORM"])
              {
                uint64_t v16 = 1129;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_ADDRESS_INCORRECT_FORM"])
              {
                uint64_t v16 = 1130;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_MAP"])
              {
                uint64_t v16 = 1131;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM"])
              {
                uint64_t v16 = 1132;
              }
              else if ([v15 isEqualToString:@"RAP_SATELLITE_IMAGE_MAP"])
              {
                uint64_t v16 = 1133;
              }
              else if ([v15 isEqualToString:@"RAP_SATELLITE_IMAGE_DETAILS_FORM"])
              {
                uint64_t v16 = 1134;
              }
              else if ([v15 isEqualToString:@"RAP_OTHER_FORM"])
              {
                uint64_t v16 = 1135;
              }
              else if ([v15 isEqualToString:@"RAP_PRIVACY"])
              {
                uint64_t v16 = 1136;
              }
              else if ([v15 isEqualToString:@"RAP_CONFIRMATION"])
              {
                uint64_t v16 = 1137;
              }
              else if ([v15 isEqualToString:@"RAP_POI_MENU"])
              {
                uint64_t v16 = 1138;
              }
              else if ([v15 isEqualToString:@"RAP_SEARCH_AUTOCOMPLETE_MENU"])
              {
                uint64_t v16 = 1139;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_A_PLACE_MAP"])
              {
                uint64_t v16 = 1140;
              }
              else if ([v15 isEqualToString:@"RAP_POI_LOCATION_MAP"])
              {
                uint64_t v16 = 1141;
              }
              else if ([v15 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP"])
              {
                uint64_t v16 = 1142;
              }
              else if ([v15 isEqualToString:@"RAP_POI_CLOSED_FORM"])
              {
                uint64_t v16 = 1143;
              }
              else if ([v15 isEqualToString:@"RAP_CLAIM_BUSINESS_DIALOG"])
              {
                uint64_t v16 = 1144;
              }
              else if ([v15 isEqualToString:@"RAP_BRAND_MENU"])
              {
                uint64_t v16 = 1145;
              }
              else if ([v15 isEqualToString:@"RAP_BRAND_DETAILS_FORM"])
              {
                uint64_t v16 = 1146;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM"])
              {
                uint64_t v16 = 1147;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STREET_FORM"])
              {
                uint64_t v16 = 1148;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_BLURRING_FORM"])
              {
                uint64_t v16 = 1149;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_REMOVE_HOME_FORM"])
              {
                uint64_t v16 = 1150;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_MENU"])
              {
                uint64_t v16 = 1151;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STORE_FORM"])
              {
                uint64_t v16 = 1152;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND_PRIVACY_MENU"])
              {
                uint64_t v16 = 1153;
              }
              else if ([v15 isEqualToString:@"RAP_LIGHTWEIGHT"])
              {
                uint64_t v16 = 1154;
              }
              else if ([v15 isEqualToString:@"RAP_EDIT_PLACE_DETAILS"])
              {
                uint64_t v16 = 1155;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_CATEGORY"])
              {
                uint64_t v16 = 1156;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_HOURS"])
              {
                uint64_t v16 = 1157;
              }
              else if ([v15 isEqualToString:@"RAP_EDIT_LOCATION"])
              {
                uint64_t v16 = 1158;
              }
              else if ([v15 isEqualToString:@"RAP_EDIT_ENTRY_POINT"])
              {
                uint64_t v16 = 1159;
              }
              else if ([v15 isEqualToString:@"RAP_LOOK_AROUND"])
              {
                uint64_t v16 = 1160;
              }
              else if ([v15 isEqualToString:@"RAP_ADD_ENTRY_POINT"])
              {
                uint64_t v16 = 1161;
              }
              else if ([v15 isEqualToString:@"WATCH_MAIN_MENU"])
              {
                uint64_t v16 = 1201;
              }
              else if ([v15 isEqualToString:@"WATCH_MAIN_PRESS_MENU"])
              {
                uint64_t v16 = 1202;
              }
              else if ([v15 isEqualToString:@"WATCH_SEARCH"])
              {
                uint64_t v16 = 1203;
              }
              else if ([v15 isEqualToString:@"WATCH_DICTATION"])
              {
                uint64_t v16 = 1204;
              }
              else if ([v15 isEqualToString:@"WATCH_FAVORITES"])
              {
                uint64_t v16 = 1205;
              }
              else if ([v15 isEqualToString:@"WATCH_SUB_CATEGORY_LIST"])
              {
                uint64_t v16 = 1206;
              }
              else if ([v15 isEqualToString:@"WATCH_SEARCH_RESULTS_LIST"])
              {
                uint64_t v16 = 1207;
              }
              else if ([v15 isEqualToString:@"WATCH_MAP_VIEW"])
              {
                uint64_t v16 = 1208;
              }
              else if ([v15 isEqualToString:@"WATCH_PLACECARD"])
              {
                uint64_t v16 = 1209;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING"])
              {
                uint64_t v16 = 1210;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_DETAILS"])
              {
                uint64_t v16 = 1211;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TBT"])
              {
                uint64_t v16 = 1212;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_MAP"])
              {
                uint64_t v16 = 1213;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_PRESS_MENU"])
              {
                uint64_t v16 = 1214;
              }
              else if ([v15 isEqualToString:@"WATCH_MAP_PRESS_MENU"])
              {
                uint64_t v16 = 1215;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTING_PRESS_MENU"])
              {
                uint64_t v16 = 1216;
              }
              else if ([v15 isEqualToString:@"WATCH_TRANSIT_MAP_VIEW"])
              {
                uint64_t v16 = 1217;
              }
              else if ([v15 isEqualToString:@"WATCH_SCRIBBLE"])
              {
                uint64_t v16 = 1218;
              }
              else if ([v15 isEqualToString:@"WATCH_COLLECTION_VIEW"])
              {
                uint64_t v16 = 1219;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING"])
              {
                uint64_t v16 = 1220;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING"])
              {
                uint64_t v16 = 1221;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT"])
              {
                uint64_t v16 = 1222;
              }
              else if ([v15 isEqualToString:@"WATCH_PAIRED_DEVICE"])
              {
                uint64_t v16 = 1223;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_DRIVING_SPLIT"])
              {
                uint64_t v16 = 1224;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_DRIVING_PLATTER"])
              {
                uint64_t v16 = 1225;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_DRIVING_MAP"])
              {
                uint64_t v16 = 1226;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_SPLIT"])
              {
                uint64_t v16 = 1227;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_PLATTER"])
              {
                uint64_t v16 = 1228;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_WALKING_MAP"])
              {
                uint64_t v16 = 1229;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TRANSIT_SPLIT"])
              {
                uint64_t v16 = 1230;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TRANSIT_PLATTER"])
              {
                uint64_t v16 = 1231;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_TRANSIT_MAP"])
              {
                uint64_t v16 = 1232;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_INFO"])
              {
                uint64_t v16 = 1233;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_MAP"])
              {
                uint64_t v16 = 1234;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_PLATTER"])
              {
                uint64_t v16 = 1235;
              }
              else if ([v15 isEqualToString:@"WATCH_NAV_CYCLING_SPLIT"])
              {
                uint64_t v16 = 1236;
              }
              else if ([v15 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING"])
              {
                uint64_t v16 = 1237;
              }
              else if ([v15 isEqualToString:@"WATCH_SEARCH_INPUT"])
              {
                uint64_t v16 = 1238;
              }
              else if ([v15 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
              {
                uint64_t v16 = 1239;
              }
              else if ([v15 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_ROUTE"])
              {
                uint64_t v16 = 1240;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_LIST"])
              {
                uint64_t v16 = 1301;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_FORM"])
              {
                uint64_t v16 = 1302;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_LABEL_FORM"])
              {
                uint64_t v16 = 1303;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_EDIT_MAP"])
              {
                uint64_t v16 = 1304;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_CONFIRMATION"])
              {
                uint64_t v16 = 1305;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_DELETE_DIALOG"])
              {
                uint64_t v16 = 1306;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_INFO"])
              {
                uint64_t v16 = 1307;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH"])
              {
                uint64_t v16 = 1308;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH_RESULTS"])
              {
                uint64_t v16 = 1309;
              }
              else if ([v15 isEqualToString:@"FAVORITE_SEARCH"])
              {
                uint64_t v16 = 1310;
              }
              else if ([v15 isEqualToString:@"FAVORITE_LIST"])
              {
                uint64_t v16 = 1311;
              }
              else if ([v15 isEqualToString:@"FAVORITE_INFO"])
              {
                uint64_t v16 = 1312;
              }
              else if ([v15 isEqualToString:@"PERSONALIZED_CONFIRMATION_WITH_PRIVACY"])
              {
                uint64_t v16 = 1313;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS"])
              {
                uint64_t v16 = 1401;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING"])
              {
                uint64_t v16 = 1402;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING"])
              {
                uint64_t v16 = 1403;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED"])
              {
                uint64_t v16 = 1404;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG"])
              {
                uint64_t v16 = 1405;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_FEEDBACK"])
              {
                uint64_t v16 = 1406;
              }
              else if ([v15 isEqualToString:@"ROUTING_TRAY_RIDESHARE_ENABLE_ALL"])
              {
                uint64_t v16 = 1407;
              }
              else if ([v15 isEqualToString:@"PLACECARD_HEADER"])
              {
                uint64_t v16 = 1501;
              }
              else if ([v15 isEqualToString:@"PLACECARD_ADDRESS"])
              {
                uint64_t v16 = 1502;
              }
              else if ([v15 isEqualToString:@"PLACECARD_PHONE"])
              {
                uint64_t v16 = 1503;
              }
              else if ([v15 isEqualToString:@"PLACECARD_URL"])
              {
                uint64_t v16 = 1504;
              }
              else if ([v15 isEqualToString:@"MENU_ITEM_DARK_MAP"])
              {
                uint64_t v16 = 1601;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_PIP"])
              {
                uint64_t v16 = 1700;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_ACTION_SHEET"])
              {
                uint64_t v16 = 1701;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_VIEW"])
              {
                uint64_t v16 = 1702;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_PLATTER"])
              {
                uint64_t v16 = 1703;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM"])
              {
                uint64_t v16 = 1704;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_REGION"])
              {
                uint64_t v16 = 1705;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_VIEW_PLACECARD"])
              {
                uint64_t v16 = 1706;
              }
              else if ([v15 isEqualToString:@"LOOK_AROUND_PIP_PLACECARD"])
              {
                uint64_t v16 = 1707;
              }
              else if ([v15 isEqualToString:@"OFFLINE_BROWSE_ONLY_SEARCH_TRAY"])
              {
                uint64_t v16 = 1708;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_PLACE"])
              {
                uint64_t v16 = 1801;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_SEARCH"])
              {
                uint64_t v16 = 1802;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_SEARCH_RESULTS"])
              {
                uint64_t v16 = 1803;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_PUBLISHER"])
              {
                uint64_t v16 = 1804;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_GUIDE"])
              {
                uint64_t v16 = 1805;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_GUIDES_HOME"])
              {
                uint64_t v16 = 1806;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_RELATED_PLACES_LIST"])
              {
                uint64_t v16 = 1807;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_COLLECTION_LIST"])
              {
                uint64_t v16 = 1808;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_DIRECTIONS"])
              {
                uint64_t v16 = 1809;
              }
              else if ([v15 isEqualToString:@"MAPS_WEB_SIDEBAR"])
              {
                uint64_t v16 = 1810;
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v16 = [v14 intValue];
            }
            [v6 addNativePath:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (!v11)
          {
LABEL_1034:

            a3 = v28;
            objc_super v8 = v27;
            break;
          }
        }
      }

      if (a3) {
        id v17 = @"webPath";
      }
      else {
        id v17 = @"web_path";
      }
      id v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v30 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = (void *)[v24 copy];
                [v6 addWebPath:v25];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v21);
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nativePathsAsString:(int)a3
{
  if (a3 > 1000)
  {
    if (a3 > 1600)
    {
      switch(a3)
      {
        case 1700:
          int v4 = @"LOOK_AROUND_PIP";
          break;
        case 1701:
          int v4 = @"LOOK_AROUND_ACTION_SHEET";
          break;
        case 1702:
          int v4 = @"LOOK_AROUND_VIEW";
          break;
        case 1703:
          int v4 = @"LOOK_AROUND_PLATTER";
          break;
        case 1704:
          int v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
          break;
        case 1705:
          int v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
          break;
        case 1706:
          int v4 = @"LOOK_AROUND_VIEW_PLACECARD";
          break;
        case 1707:
          int v4 = @"LOOK_AROUND_PIP_PLACECARD";
          break;
        case 1708:
          int v4 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
          break;
        default:
          if (a3 == 1601)
          {
            int v4 = @"MENU_ITEM_DARK_MAP";
          }
          else
          {
LABEL_55:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
            int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_56:
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          int v4 = @"CARPLAY_NAV";
          break;
        case 1002:
          int v4 = @"CARPLAY_EXPLORE";
          break;
        case 1003:
          int v4 = @"CARPLAY_DESTINATIONS";
          break;
        case 1004:
          int v4 = @"CARPLAY_TRAFFIC_INCIDENT";
          break;
        case 1005:
          int v4 = @"CARPLAY_CONTROL";
          break;
        case 1006:
          int v4 = @"CARPLAY_PROACTIVE";
          break;
        case 1007:
          int v4 = @"CARPLAY_ROUTING";
          break;
        case 1008:
          int v4 = @"CARPLAY_MORE_ROUTES";
          break;
        case 1009:
          int v4 = @"CARPLAY_SEARCH_ALONG_ROUTE";
          break;
        case 1010:
          int v4 = @"CARPLAY_SEARCH";
          break;
        case 1011:
          int v4 = @"CARPLAY_SEARCH_RESULTS";
          break;
        case 1012:
          int v4 = @"CARPLAY_FAVORITES";
          break;
        case 1013:
          int v4 = @"CARPLAY_NAV_CONFIRMATION";
          break;
        case 1014:
          int v4 = @"CARPLAY_DESTINATION_SHARING";
          break;
        case 1015:
          int v4 = @"CARPLAY_NOTIFICATION_BATTERY";
          break;
        case 1016:
          int v4 = @"CARPLAY_NOTIFICATION_DOOM";
          break;
        case 1017:
          int v4 = @"CARPLAY_NOTIFICATION_FUEL";
          break;
        case 1018:
          int v4 = @"CARPLAY_NOTIFICATION_HYBRID";
          break;
        case 1019:
          int v4 = @"CARPLAY_SHARE_ETA_TRAY";
          break;
        case 1020:
          int v4 = @"CARPLAY_ETA_UPDATE_TRAY";
          break;
        case 1021:
          int v4 = @"CARPLAY_ACTION_TRAY";
          break;
        case 1022:
          int v4 = @"CARPLAY_PLACECARD";
          break;
        case 1023:
          int v4 = @"CARPLAY_KEYBOARD";
          break;
        case 1024:
          int v4 = @"CARPLAY_UI_TARGET_UNKNOWN";
          break;
        case 1025:
          int v4 = @"CARPLAY_EDIT_STOPS";
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
          goto LABEL_55;
        case 1100:
          int v4 = @"RAP_DIRECTIONS_MENU";
          break;
        case 1101:
          int v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
          break;
        case 1102:
          int v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
          break;
        case 1103:
          int v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
          break;
        case 1104:
          int v4 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
          break;
        case 1105:
          int v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
          break;
        case 1106:
          int v4 = @"RAP_TRANSIT_MENU";
          break;
        case 1107:
          int v4 = @"RAP_STATION_MAP";
          break;
        case 1108:
          int v4 = @"RAP_STATION_MENU";
          break;
        case 1109:
          int v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
          break;
        case 1110:
          int v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
          break;
        case 1111:
          int v4 = @"RAP_STATION_CLOSED_FORM";
          break;
        case 1112:
          int v4 = @"RAP_LINE_MAP";
          break;
        case 1113:
          int v4 = @"RAP_LINE_MENU";
          break;
        case 1114:
          int v4 = @"RAP_LINE_NAME_FORM";
          break;
        case 1115:
          int v4 = @"RAP_LINE_SHAPE_FORM";
          break;
        case 1116:
          int v4 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
          break;
        case 1117:
          int v4 = @"RAP_ADD_PLACE_MENU";
          break;
        case 1118:
          int v4 = @"RAP_ADD_POI_MAP";
          break;
        case 1119:
          int v4 = @"RAP_CATEGORY_LIST";
          break;
        case 1120:
          int v4 = @"RAP_POI_DETAILS_FORM";
          break;
        case 1121:
          int v4 = @"RAP_ADD_STREET_MAP";
          break;
        case 1122:
          int v4 = @"RAP_STREET_DETAILS_FORM";
          break;
        case 1123:
          int v4 = @"RAP_ADD_OTHER_MAP";
          break;
        case 1124:
          int v4 = @"RAP_OTHER_DETAILS_FORM";
          break;
        case 1125:
          int v4 = @"RAP_CAMERA";
          break;
        case 1126:
          int v4 = @"RAP_LABEL_MAP";
          break;
        case 1127:
          int v4 = @"RAP_LABEL_DETAILS_FORM";
          break;
        case 1128:
          int v4 = @"RAP_SEARCH_MENU";
          break;
        case 1129:
          int v4 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
          break;
        case 1130:
          int v4 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
          break;
        case 1131:
          int v4 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
          break;
        case 1132:
          int v4 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
          break;
        case 1133:
          int v4 = @"RAP_SATELLITE_IMAGE_MAP";
          break;
        case 1134:
          int v4 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
          break;
        case 1135:
          int v4 = @"RAP_OTHER_FORM";
          break;
        case 1136:
          int v4 = @"RAP_PRIVACY";
          break;
        case 1137:
          int v4 = @"RAP_CONFIRMATION";
          break;
        case 1138:
          int v4 = @"RAP_POI_MENU";
          break;
        case 1139:
          int v4 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
          break;
        case 1140:
          int v4 = @"RAP_ADD_A_PLACE_MAP";
          break;
        case 1141:
          int v4 = @"RAP_POI_LOCATION_MAP";
          break;
        case 1142:
          int v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
          break;
        case 1143:
          int v4 = @"RAP_POI_CLOSED_FORM";
          break;
        case 1144:
          int v4 = @"RAP_CLAIM_BUSINESS_DIALOG";
          break;
        case 1145:
          int v4 = @"RAP_BRAND_MENU";
          break;
        case 1146:
          int v4 = @"RAP_BRAND_DETAILS_FORM";
          break;
        case 1147:
          int v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
          break;
        case 1148:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
          break;
        case 1149:
          int v4 = @"RAP_LOOK_AROUND_BLURRING_FORM";
          break;
        case 1150:
          int v4 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
          break;
        case 1151:
          int v4 = @"RAP_LOOK_AROUND_MENU";
          break;
        case 1152:
          int v4 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
          break;
        case 1153:
          int v4 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
          break;
        case 1154:
          int v4 = @"RAP_LIGHTWEIGHT";
          break;
        case 1155:
          int v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 1156:
          int v4 = @"RAP_ADD_CATEGORY";
          break;
        case 1157:
          int v4 = @"RAP_ADD_HOURS";
          break;
        case 1158:
          int v4 = @"RAP_EDIT_LOCATION";
          break;
        case 1159:
          int v4 = @"RAP_EDIT_ENTRY_POINT";
          break;
        case 1160:
          int v4 = @"RAP_LOOK_AROUND";
          break;
        case 1161:
          int v4 = @"RAP_ADD_ENTRY_POINT";
          break;
        case 1201:
          int v4 = @"WATCH_MAIN_MENU";
          break;
        case 1202:
          int v4 = @"WATCH_MAIN_PRESS_MENU";
          break;
        case 1203:
          int v4 = @"WATCH_SEARCH";
          break;
        case 1204:
          int v4 = @"WATCH_DICTATION";
          break;
        case 1205:
          int v4 = @"WATCH_FAVORITES";
          break;
        case 1206:
          int v4 = @"WATCH_SUB_CATEGORY_LIST";
          break;
        case 1207:
          int v4 = @"WATCH_SEARCH_RESULTS_LIST";
          break;
        case 1208:
          int v4 = @"WATCH_MAP_VIEW";
          break;
        case 1209:
          int v4 = @"WATCH_PLACECARD";
          break;
        case 1210:
          int v4 = @"WATCH_ROUTE_PLANNING";
          break;
        case 1211:
          int v4 = @"WATCH_ROUTE_DETAILS";
          break;
        case 1212:
          int v4 = @"WATCH_NAV_TBT";
          break;
        case 1213:
          int v4 = @"WATCH_NAV_MAP";
          break;
        case 1214:
          int v4 = @"WATCH_NAV_PRESS_MENU";
          break;
        case 1215:
          int v4 = @"WATCH_MAP_PRESS_MENU";
          break;
        case 1216:
          int v4 = @"WATCH_ROUTING_PRESS_MENU";
          break;
        case 1217:
          int v4 = @"WATCH_TRANSIT_MAP_VIEW";
          break;
        case 1218:
          int v4 = @"WATCH_SCRIBBLE";
          break;
        case 1219:
          int v4 = @"WATCH_COLLECTION_VIEW";
          break;
        case 1220:
          int v4 = @"WATCH_ROUTE_PLANNING_WALKING";
          break;
        case 1221:
          int v4 = @"WATCH_ROUTE_PLANNING_DRIVING";
          break;
        case 1222:
          int v4 = @"WATCH_ROUTE_PLANNING_TRANSIT";
          break;
        case 1223:
          int v4 = @"WATCH_PAIRED_DEVICE";
          break;
        case 1224:
          int v4 = @"WATCH_NAV_DRIVING_SPLIT";
          break;
        case 1225:
          int v4 = @"WATCH_NAV_DRIVING_PLATTER";
          break;
        case 1226:
          int v4 = @"WATCH_NAV_DRIVING_MAP";
          break;
        case 1227:
          int v4 = @"WATCH_NAV_WALKING_SPLIT";
          break;
        case 1228:
          int v4 = @"WATCH_NAV_WALKING_PLATTER";
          break;
        case 1229:
          int v4 = @"WATCH_NAV_WALKING_MAP";
          break;
        case 1230:
          int v4 = @"WATCH_NAV_TRANSIT_SPLIT";
          break;
        case 1231:
          int v4 = @"WATCH_NAV_TRANSIT_PLATTER";
          break;
        case 1232:
          int v4 = @"WATCH_NAV_TRANSIT_MAP";
          break;
        case 1233:
          int v4 = @"WATCH_ROUTE_INFO";
          break;
        case 1234:
          int v4 = @"WATCH_NAV_CYCLING_MAP";
          break;
        case 1235:
          int v4 = @"WATCH_NAV_CYCLING_PLATTER";
          break;
        case 1236:
          int v4 = @"WATCH_NAV_CYCLING_SPLIT";
          break;
        case 1237:
          int v4 = @"WATCH_ROUTE_PLANNING_CYCLING";
          break;
        case 1238:
          int v4 = @"WATCH_SEARCH_INPUT";
          break;
        case 1239:
          int v4 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 1240:
          int v4 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 1301:
          int v4 = @"PERSONALIZED_ADDRESS_LIST";
          break;
        case 1302:
          int v4 = @"PERSONALIZED_ADDRESS_FORM";
          break;
        case 1303:
          int v4 = @"PERSONALIZED_LABEL_FORM";
          break;
        case 1304:
          int v4 = @"PERSONALIZED_EDIT_MAP";
          break;
        case 1305:
          int v4 = @"PERSONALIZED_CONFIRMATION";
          break;
        case 1306:
          int v4 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
          break;
        case 1307:
          int v4 = @"PERSONALIZED_ADDRESS_INFO";
          break;
        case 1308:
          int v4 = @"PERSONALIZED_ADDRESS_SEARCH";
          break;
        case 1309:
          int v4 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
          break;
        case 1310:
          int v4 = @"FAVORITE_SEARCH";
          break;
        case 1311:
          int v4 = @"FAVORITE_LIST";
          break;
        case 1312:
          int v4 = @"FAVORITE_INFO";
          break;
        case 1313:
          int v4 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
          break;
        default:
          switch(a3)
          {
            case 1401:
              int v4 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
              break;
            case 1402:
              int v4 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
              break;
            case 1403:
              int v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
              break;
            case 1404:
              int v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
              break;
            case 1405:
              int v4 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
              break;
            case 1406:
              int v4 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
              break;
            case 1407:
              int v4 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
              break;
            default:
              switch(a3)
              {
                case 1501:
                  int v4 = @"PLACECARD_HEADER";
                  break;
                case 1502:
                  int v4 = @"PLACECARD_ADDRESS";
                  break;
                case 1503:
                  int v4 = @"PLACECARD_PHONE";
                  break;
                case 1504:
                  int v4 = @"PLACECARD_URL";
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
    int v4 = @"UI_TARGET_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_56;
      case 1:
        int v4 = @"UI_TARGET_POI";
        break;
      case 2:
        int v4 = @"UI_TARGET_SEARCH_RESULT_LIST";
        break;
      case 3:
        int v4 = @"UI_TARGET_POPULAR_NEARBY_LIST";
        break;
      case 4:
        int v4 = @"UI_TARGET_CALLOUT";
        break;
      case 5:
        int v4 = @"UI_TARGET_SEARCH_PIN";
        break;
      case 6:
        int v4 = @"UI_TARGET_DROPPED_PIN";
        break;
      case 7:
        int v4 = @"UI_TARGET_TRANSIT_LINE";
        break;
      case 8:
        int v4 = @"SEARCH_TRAY";
        break;
      case 9:
        int v4 = @"SEARCH_TRAY_BROWSE";
        break;
      case 10:
        int v4 = @"SEARCH_TRAY_POPULAR_NEARBY";
        break;
      case 11:
        int v4 = @"SEARCH_TRAY_AC";
        break;
      case 12:
        int v4 = @"SEARCH_TRAY_AC_INTERMEDIATE";
        break;
      case 13:
        int v4 = @"SEARCH_TRAY_NO_QUERY";
        break;
      case 14:
        int v4 = @"AR_WALKING_LEGAL_TRAY";
        break;
      case 15:
        int v4 = @"RAISE_TO_START_AR_TRAY";
        break;
      case 16:
        int v4 = @"EVENTS_ADVISORY_DETAILS_PAGE";
        break;
      case 17:
        int v4 = @"INCIDENT_REPORT_TRAY_CARPLAY";
        break;
      case 18:
        int v4 = @"HIGHLIGHTED_AREA";
        break;
      case 19:
        int v4 = @"CURATED_COLLECTIONS_HOME";
        break;
      case 20:
        int v4 = @"TRAVEL_PREFERENCES_TRAY";
        break;
      case 21:
        int v4 = @"RESULT_TRAY_SEARCH";
        break;
      case 22:
        int v4 = @"SINGLE_CARD_FILTER";
        break;
      case 23:
        int v4 = @"FULL_CARD_FILTER";
        break;
      case 24:
        int v4 = @"ACCOUNT_PRIVACY_TRAY";
        break;
      case 25:
        int v4 = @"APPLE_RATINGS_HISTORY_TRAY";
        break;
      case 26:
        int v4 = @"CURATED_COLLECTIONS_HOME_FILTERED";
        break;
      case 27:
        int v4 = @"CITY_MENU";
        break;
      case 28:
        int v4 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
        break;
      case 29:
        int v4 = @"ACCOUNT_TRAY";
        break;
      case 30:
        int v4 = @"QUICK_ACTION_TRAY";
        break;
      case 31:
        int v4 = @"SUBMIT_TRIP_FEEDBACK";
        break;
      case 32:
        int v4 = @"RAP_PLACE_ISSUE_DETAILS";
        break;
      case 33:
        int v4 = @"RAP_GUIDES_DETAILS";
        break;
      case 34:
        int v4 = @"RAP_BAD_DIRECTIONS_DETAILS";
        break;
      case 35:
        int v4 = @"RAP_ADD_MAP_DETAILS";
        break;
      case 36:
        int v4 = @"WATCH_COMPLICATION";
        break;
      case 37:
        int v4 = @"RAP_NAV_MENU";
        break;
      case 38:
        int v4 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
        break;
      case 39:
        int v4 = @"RAP_REPORT_MENU";
        break;
      case 40:
        int v4 = @"RAP_CURATED_COLLECTION_MENU";
        break;
      case 41:
        int v4 = @"RAP_REPORT_CARD_DETAILS";
        break;
      case 42:
        int v4 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
        break;
      case 43:
        int v4 = @"RAP_STREET_ISSUE_DETAILS";
        break;
      case 44:
        int v4 = @"NEARBY_TRANSIT_CARD";
        break;
      case 45:
        int v4 = @"WATCH_NAV_MENU";
        break;
      case 46:
        int v4 = @"GENERIC_ADVISORY_PAGE";
        break;
      case 47:
        int v4 = @"USER_PROFILE_TRAY";
        break;
      case 48:
        int v4 = @"MEDIA_APP_MENU";
        break;
      case 49:
        int v4 = @"TEMPLATE_PLACE_TRAY";
        break;
      case 50:
        int v4 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
        break;
      case 51:
        int v4 = @"ALLOW_NOTIFICATION_DIALOG";
        break;
      case 52:
        int v4 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
        break;
      case 53:
        int v4 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
        break;
      case 54:
        int v4 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
        break;
      case 55:
        int v4 = @"NOTIFICATION_CONSENT_PROMPT";
        break;
      case 56:
        int v4 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
        break;
      case 57:
        int v4 = @"PLACECARD_TRAY_VENDORS_MENU";
        break;
      case 58:
        int v4 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
        break;
      case 59:
        int v4 = @"SEARCH_ALONG_ROUTE_TRAY";
        break;
      case 60:
        int v4 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
        break;
      case 61:
        int v4 = @"PLACECARD_SHOWCASE_MENU";
        break;
      case 62:
        int v4 = @"RAP_INLINE_ADD_DETAILS";
        break;
      case 63:
        int v4 = @"RAP_EDIT_MENU_DETAILS";
        break;
      case 64:
        int v4 = @"RAP_SUBMISSION_PROMPT";
        break;
      case 65:
        int v4 = @"RAP_PLACECARD_EDIT_MENU";
        break;
      case 66:
        int v4 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
        break;
      case 67:
        int v4 = @"INCIDENT_REPORT_MENU";
        break;
      case 68:
        int v4 = @"RAP_SELECT_BAD_ROUTES_STEPS";
        break;
      case 69:
        int v4 = @"RAP_SELECT_BAD_ROUTES";
        break;
      case 70:
        int v4 = @"SIRI_SUGGESTION_RESUME_ROUTE";
        break;
      case 71:
        int v4 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
        break;
      case 72:
        int v4 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
        break;
      case 73:
        int v4 = @"SPOTLIGHT_BUSINESS_ENTITY";
        break;
      case 74:
        int v4 = @"NOTIFICATION_ARP";
        break;
      case 75:
        int v4 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
        break;
      case 76:
        int v4 = @"YOUR_PHOTOS_ALBUM";
        break;
      case 77:
        int v4 = @"ARP_PHOTO_CREDIT";
        break;
      case 78:
        int v4 = @"RAP_OUTREACH_REVIEWED_REPORT";
        break;
      case 79:
        int v4 = @"RAP_REPORT_MENU_MORE";
        break;
      case 80:
        int v4 = @"WATCH_MAPS_SETTINGS";
        break;
      case 81:
        int v4 = @"OFFLINE_FEATURE_PROMPT";
        break;
      case 82:
        int v4 = @"EXPIRED_MAPS_DETAILS";
        break;
      case 83:
        int v4 = @"MAPS_VIEW";
        break;
      case 84:
        int v4 = @"NOTIFICATION_OFFLINE";
        break;
      case 85:
        int v4 = @"EXPIRED_MAPS_MANAGEMENT";
        break;
      case 86:
        int v4 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
        break;
      case 87:
        int v4 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
        break;
      case 88:
        int v4 = @"OFFLINE_MAPS_MANAGEMENT";
        break;
      case 89:
        int v4 = @"REGION_SELECTOR";
        break;
      case 90:
        int v4 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
        break;
      case 91:
        int v4 = @"FIND_MY_ETA_SHARING_TRAY";
        break;
      case 92:
        int v4 = @"WATCH_PLACE";
        break;
      case 93:
        int v4 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
        break;
      case 94:
        int v4 = @"WATCH_ROUTE_PLANNING_MAP";
        break;
      case 95:
        int v4 = @"WATCH_NAV_WALKING_CONTROLS";
        break;
      case 96:
        int v4 = @"WATCH_NAV_CYCLING_CONTROLS";
        break;
      case 97:
        int v4 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
        break;
      case 98:
        int v4 = @"WATCH_NAV_TRANSIT_CONTROLS";
        break;
      case 99:
        int v4 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
        break;
      case 100:
        int v4 = @"WATCH_NAV_DRIVING_CONTROLS";
        break;
      case 101:
        int v4 = @"RESULTS_TRAY_SEARCH";
        break;
      case 102:
        int v4 = @"RESULTS_TRAY_BROWSE";
        break;
      case 103:
        int v4 = @"RESULTS_TRAY_FAVORITES";
        break;
      case 104:
        int v4 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
        break;
      case 105:
        int v4 = @"RESULTS_TRAY_CLUSTER";
        break;
      case 106:
        int v4 = @"RESULTS_TRAY_VENUE_BROWSE";
        break;
      case 107:
        int v4 = @"WATCH_MAP_RESULTS";
        break;
      case 108:
        int v4 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
        break;
      case 109:
        int v4 = @"WATCH_PLACES";
        break;
      case 110:
        int v4 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
        break;
      case 111:
        int v4 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
        break;
      case 112:
        int v4 = @"DOWNLOADED_MAPS_DETAILS";
        break;
      case 113:
        int v4 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
        break;
      case 114:
        int v4 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
        break;
      case 115:
        int v4 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
        break;
      case 116:
        int v4 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
        break;
      case 117:
        int v4 = @"WATCH_ROUTE_OPTIONS";
        break;
      case 118:
        int v4 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
        break;
      case 119:
        int v4 = @"WATCH_MORE_GUIDES";
        break;
      case 120:
        int v4 = @"WATCH_RECENTLY_VIEWED";
        break;
      case 121:
        int v4 = @"EV_SUCCESS_TRAY";
        break;
      case 122:
        int v4 = @"PREFERRED_NETWORK_SELECTION_TRAY";
        break;
      case 123:
        int v4 = @"PREFERRED_NETWORK_TRAY";
        break;
      case 124:
        int v4 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 125:
        int v4 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
        break;
      case 126:
        int v4 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
        break;
      case 127:
        int v4 = @"AC_KEYBOARD_TRAY";
        break;
      case 128:
        int v4 = @"MORE_RELATED_TRAILS";
        break;
      case 129:
        int v4 = @"MORE_RELATED_TRAILHEADS";
        break;
      case 130:
        int v4 = @"ROUTING_TRAY_CUSTOM_ROUTE";
        break;
      case 131:
        int v4 = @"CUSTOM_ROUTE_CREATION_TRAY";
        break;
      case 132:
        int v4 = @"ROUTING_TRAY_CURATED_HIKE";
        break;
      case 133:
        int v4 = @"MORE_CURATED_HIKES";
        break;
      case 134:
        int v4 = @"CUSTOM_ROUTE_ONBOARDING";
        break;
      case 135:
        int v4 = @"LIBRARY_ROUTES";
        break;
      case 136:
        int v4 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 137:
        int v4 = @"MY_LIBRARY";
        break;
      case 138:
        int v4 = @"EDIT_NOTE_TRAY";
        break;
      case 139:
        int v4 = @"CREATE_NOTE_TRAY";
        break;
      case 140:
        int v4 = @"LIBRARY_PLACES";
        break;
      case 141:
        int v4 = @"WATCH_ACCOUNT";
        break;
      case 142:
        int v4 = @"WATCH_DOWNLOADED_MAPS";
        break;
      case 143:
        int v4 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
        break;
      case 144:
        int v4 = @"VISUAL_INTELLIGENCE_DETECTION";
        break;
      case 145:
        int v4 = @"VISUAL_INTELLIGENCE_SNIPPET";
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
        goto LABEL_55;
      case 201:
        int v4 = @"PLACECARD_TRAY";
        break;
      case 202:
        int v4 = @"WEB_MODULE";
        break;
      case 250:
        int v4 = @"ADD_FAVORITE_TRAY";
        break;
      case 251:
        int v4 = @"COLLECTION_LIST";
        break;
      case 252:
        int v4 = @"COLLECTION_VIEW";
        break;
      case 253:
        int v4 = @"FAVORITE_DETAILS";
        break;
      case 254:
        int v4 = @"FAVORITES_TRAY";
        break;
      case 255:
        int v4 = @"SHARED_COLLECTION";
        break;
      case 256:
        int v4 = @"SHARED_COLLECTION_VIEW";
        break;
      case 257:
        int v4 = @"RECENTLY_VIEWED";
        break;
      case 258:
        int v4 = @"SHARED_WEB_COLLECTION";
        break;
      case 259:
        int v4 = @"CURATED_COLLECTION_VIEW";
        break;
      case 260:
        int v4 = @"FEATURED_COLLECTIONS";
        break;
      case 261:
        int v4 = @"PUBLISHER_TRAY";
        break;
      case 262:
        int v4 = @"SHARED_CURATED_COLLECTION_VIEW";
        break;
      case 263:
        int v4 = @"CURATED_COLLECTION_NOTIFICATION";
        break;
      case 264:
        int v4 = @"CURATED_COLLECTION_LIST";
        break;
      case 265:
        int v4 = @"PUBLISHER_LIST";
        break;
      case 266:
        int v4 = @"WATCH_CURATED_COLLECTION_VIEW";
        break;
      case 267:
        int v4 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
        break;
      case 268:
        int v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
        break;
      case 301:
        int v4 = @"ROUTING_TRAY_DRIVING";
        break;
      case 302:
        int v4 = @"ROUTING_TRAY_WALKING";
        break;
      case 303:
        int v4 = @"ROUTING_TRAY_TRANSIT";
        break;
      case 304:
        int v4 = @"ROUTING_TRAY_RIDESHARE";
        break;
      case 305:
        int v4 = @"ROUTING_TRAY_CYCLING";
        break;
      case 306:
        int v4 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
        break;
      case 401:
        int v4 = @"NAV_TRAY_DRIVING";
        break;
      case 402:
        int v4 = @"NAV_TRAY_WALKING";
        break;
      case 403:
        int v4 = @"NAV_TRAY_TRANSIT";
        break;
      case 404:
        int v4 = @"NAV_TRAY_CYCLING";
        break;
      case 501:
        int v4 = @"MAP_PLACECARD";
        break;
      case 502:
        int v4 = @"MAP_SEARCH";
        break;
      case 503:
        int v4 = @"MAP_RESULTS";
        break;
      case 504:
        int v4 = @"MAP_ROUTING";
        break;
      case 505:
        int v4 = @"MAP_NAV";
        break;
      case 506:
        int v4 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
        break;
      case 507:
        int v4 = @"MAP_TRAFFIC_INCIDENT";
        break;
      case 508:
        int v4 = @"MAP_FULL_SCREEN";
        break;
      case 509:
        int v4 = @"MAP_DRIVE";
        break;
      case 510:
        int v4 = @"MAP_LAUNCH_AND_GO";
        break;
      case 511:
        int v4 = @"MAP_VIEW";
        break;
      case 601:
        int v4 = @"MAPS_SETTINGS";
        break;
      case 602:
        int v4 = @"MAPS_PREFERENCES";
        break;
      case 603:
        int v4 = @"RAP";
        break;
      case 604:
        int v4 = @"ROUTING_DRIVING_DETAILS";
        break;
      case 605:
        int v4 = @"ROUTING_WALKING_DETAILS";
        break;
      case 606:
        int v4 = @"ROUTING_TRANSIT_DETAILS";
        break;
      case 607:
        int v4 = @"ROUTING_EDITOR";
        break;
      case 608:
        int v4 = @"NAV_DRIVING_DETAILS";
        break;
      case 609:
        int v4 = @"NAV_WALKING_DETAILS";
        break;
      case 610:
        int v4 = @"NAV_TRANSIT_DETAILS";
        break;
      case 611:
        int v4 = @"NAV_AUDIO_SETTINGS";
        break;
      case 612:
        int v4 = @"PHOTO_VIEWER_ALL";
        break;
      case 613:
        int v4 = @"PHOTO_VIEWER_SINGLE";
        break;
      case 614:
        int v4 = @"ROUTE_OPTIONS_TRANSIT";
        break;
      case 615:
        int v4 = @"TRAFFIC_INCIDENT_TRAY";
        break;
      case 616:
        int v4 = @"NAV_DIRECTIONS_BANNER_DRIVING";
        break;
      case 617:
        int v4 = @"NAV_DIRECTIONS_BANNER_WALKING";
        break;
      case 618:
        int v4 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
        break;
      case 619:
        int v4 = @"REFINE_SEARCH_SUGGESTION_AREA";
        break;
      case 620:
        int v4 = @"ADD_PHOTO_SHEET";
        break;
      case 621:
        int v4 = @"ADD_PLACE_SHEET";
        break;
      case 622:
        int v4 = @"SHARE_SHEET";
        break;
      case 623:
        int v4 = @"EDIT_LOCATION_SHEET";
        break;
      case 624:
        int v4 = @"ADD_CONTACT_SHEET";
        break;
      case 625:
        int v4 = @"EDIT_NAME_SHEET";
        break;
      case 626:
        int v4 = @"DRIVING_NAV_SETTINGS";
        break;
      case 627:
        int v4 = @"TRANSIT_SETTINGS";
        break;
      case 628:
        int v4 = @"TRANSIT_ADVISORY_SHEET";
        break;
      case 629:
        int v4 = @"REMOVE_CAR_SHEET";
        break;
      case 630:
        int v4 = @"ROUTE_OPTIONS_DRIVING";
        break;
      case 631:
        int v4 = @"ROUTE_OPTIONS_DATETIME";
        break;
      case 632:
        int v4 = @"TRANSIT_ADVISORY_BANNER";
        break;
      case 633:
        int v4 = @"BOOK_TABLE_SELECT_TIME";
        break;
      case 634:
        int v4 = @"BOOK_TABLE_MORE_OPTIONS";
        break;
      case 635:
        int v4 = @"BOOK_TABLE_READY";
        break;
      case 636:
        int v4 = @"BOOK_TABLE_BOOKED";
        break;
      case 637:
        int v4 = @"TRANSIT_LINE_CLUSTER_SHEET";
        break;
      case 638:
        int v4 = @"TRANSIT_LINE_LIST_SHEET";
        break;
      case 639:
        int v4 = @"TRANSIT_BALANCE_BANNER";
        break;
      case 640:
        int v4 = @"WEATHER_ICON";
        break;
      case 641:
        int v4 = @"HELP_IMPROVE_MAPS_DIALOG";
        break;
      case 642:
        int v4 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 643:
        int v4 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 644:
        int v4 = @"FLOOR_PICKER";
        break;
      case 645:
        int v4 = @"VENUE_LIST";
        break;
      case 646:
        int v4 = @"AR_MODE";
        break;
      case 647:
        int v4 = @"ROUTING_TRANSIT_TICKETS_SHEET";
        break;
      case 648:
        int v4 = @"LINKED_SERVICE_HOURS";
        break;
      case 649:
        int v4 = @"SHARE_ETA_TRAY";
        break;
      case 650:
        int v4 = @"ETA_UPDATE_TRAY";
        break;
      case 651:
        int v4 = @"SCHEDULECARD_TRAY";
        break;
      case 652:
        int v4 = @"AR_NAV";
        break;
      case 653:
        int v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 654:
        int v4 = @"LOCATIONS_INSIDE";
        break;
      case 655:
        int v4 = @"SIMILAR_LOCATIONS";
        break;
      case 656:
        int v4 = @"LOCATIONS_AT_ADDRESS";
        break;
      case 657:
        int v4 = @"NAV_DIRECTIONS_BANNER_CYCLING";
        break;
      case 658:
        int v4 = @"ROUTE_OPTIONS_CYCLING";
        break;
      case 659:
        int v4 = @"EV_CONNECTION_TRAY";
        break;
      case 660:
        int v4 = @"VIRTUAL_GARAGE";
        break;
      case 661:
        int v4 = @"VIRTUAL_GARAGE_BANNER";
        break;
      case 662:
        int v4 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
        break;
      case 663:
        int v4 = @"ADVISORY_DETAILS_PAGE";
        break;
      case 664:
        int v4 = @"APP_CLIP_NOTIFICATION";
        break;
      case 665:
        int v4 = @"PHOTO_VIEWER_GALLERY";
        break;
      case 666:
        int v4 = @"RECOMMENDATION_CARD";
        break;
      case 667:
        int v4 = @"INCIDENT_REPORT_TRAY";
        break;
      case 668:
        int v4 = @"MAPS_WIDGET_DISPLAY";
        break;
      case 669:
        int v4 = @"VISUAL_LOCATION_FRAMEWORK";
        break;
      case 670:
        int v4 = @"APP_CLIP_TRAY";
        break;
      case 671:
        int v4 = @"LICENSE_PLATE_SUGGESTION_PAGE";
        break;
      case 672:
        int v4 = @"NOTIFICATION_ADD_PLATE";
        break;
      case 673:
        int v4 = @"MAPS_RESULTS";
        break;
      case 674:
        int v4 = @"MAPS_WIDGET_APP_CONNECTION";
        break;
      case 675:
        int v4 = @"MAPS_WIDGET_CURRENT_LOCATION";
        break;
      case 676:
        int v4 = @"MAPS_WIDGET_CURRENT_NAV";
        break;
      case 677:
        int v4 = @"MAPS_WIDGET_ETA";
        break;
      case 678:
        int v4 = @"MAPS_WIDGET_TRANSIT";
        break;
      case 679:
        int v4 = @"MAPS_WIDGET_UPC_DESTINATION";
        break;
      case 680:
        int v4 = @"WIDGET_CREATION_TRAY";
        break;
      case 681:
        int v4 = @"MAPS_WIDGET_HOME";
        break;
      case 682:
        int v4 = @"MAPS_WIDGET_PARKED_CAR";
        break;
      case 683:
        int v4 = @"MAPS_WIDGET_POI";
        break;
      case 684:
        int v4 = @"MAPS_WIDGET_SCHOOL";
        break;
      case 685:
        int v4 = @"MAPS_WIDGET_WORK";
        break;
      case 686:
        int v4 = @"AIRPORT_NOTIFICATION";
        break;
      case 687:
        int v4 = @"MAPS_WIDGET_EMPTY";
        break;
      case 688:
        int v4 = @"COARSE_LOCATION_OPTIONS_PROMPT";
        break;
      case 689:
        int v4 = @"ALLOW_PRECISE_LOCATION_PROMPT";
        break;
      case 690:
        int v4 = @"SHARE_MY_LOCATION";
        break;
      case 691:
        int v4 = @"MARK_MY_LOCATION";
        break;
      case 692:
        int v4 = @"AIRPORT_NOTIFICATION_WATCH";
        break;
      case 693:
        int v4 = @"EDIT_FAVORITE";
        break;
      case 694:
        int v4 = @"ROUTING_CYCLING_DETAILS";
        break;
      case 695:
        int v4 = @"NAV_CYCLING_DETAILS";
        break;
      case 696:
        int v4 = @"MAPS_SUGGESTION_WIDGET";
        break;
      case 697:
        int v4 = @"ARP_TIPKIT";
        break;
      case 698:
        int v4 = @"ARP_PRIVACY";
        break;
      case 699:
        int v4 = @"ROUTE_OPTIONS_WALKING";
        break;
      case 701:
        int v4 = @"SAFARI_SEARCH";
        break;
      case 702:
        int v4 = @"SPOTLIGHT_SEARCH";
        break;
      case 703:
        int v4 = @"SAFARI_MAPS_SEARCH_RESULTS";
        break;
      case 704:
        int v4 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
        break;
      case 705:
        int v4 = @"WIDGET_MAPS_DESTINATIONS";
        break;
      case 706:
        int v4 = @"WIDGET_MAPS_TRANSIT";
        break;
      case 707:
        int v4 = @"WIDGET_MAPS_NEARBY";
        break;
      case 708:
        int v4 = @"NOTIFICATION_FIND_MY_CAR";
        break;
      case 709:
        int v4 = @"CONTROL_CENTER";
        break;
      case 710:
        int v4 = @"NOTIFICATION_CENTER";
        break;
      case 711:
        int v4 = @"NOTIFICATION_DOOM";
        break;
      case 712:
        int v4 = @"NOTIFICATION_VENUES";
        break;
      case 713:
        int v4 = @"NOTIFICATION_RAP_UPDATE";
        break;
      case 714:
        int v4 = @"NOTIFICATION_TRIP_CANCELLED";
        break;
      case 715:
        int v4 = @"NOTIFICATION_STOP_SKIPPED";
        break;
      case 716:
        int v4 = @"NOTIFICATION_TRIP_DELAYED";
        break;
      case 717:
        int v4 = @"NOTIFICATION_RAP";
        break;
      case 718:
        int v4 = @"NOTIFICATION_PROXY_AUTH";
        break;
      case 719:
        int v4 = @"NOTIFICATION_PUSH_TO_DEVICE";
        break;
      case 720:
        int v4 = @"NOTIFICATION_LOW_FUEL";
        break;
      case 721:
        int v4 = @"NOTIFICATION_FIND_MY_CAR_RESET";
        break;
      case 722:
        int v4 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
        break;
      case 723:
        int v4 = @"NOTIFICATION_SHARED_ETA";
        break;
      case 724:
        int v4 = @"NOTIFICATION_SHARED_ETA_UPDATE";
        break;
      case 725:
        int v4 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
        break;
      case 726:
        int v4 = @"ANNOUNCEMENT_TYPE_GENERAL";
        break;
      case 727:
        int v4 = @"ANNOUNCEMENT_TYPE_FLYOVER";
        break;
      case 728:
        int v4 = @"ANNOUNCEMENT_TYPE_TRANSIT";
        break;
      case 729:
        int v4 = @"ANNOUNCEMENT_TYPE_VENUES";
        break;
      case 730:
        int v4 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
        break;
      case 731:
        int v4 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
        break;
      case 732:
        int v4 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
        break;
      case 733:
        int v4 = @"APP_SHEET";
        break;
      case 734:
        int v4 = @"CZ_ADVISORY_DETAILS_PAGE";
        break;
      case 735:
        int v4 = @"SHARE_ETA_CONTACT_TRAY";
        break;
      case 736:
        int v4 = @"SIRI_SHARE_ETA";
        break;
      case 737:
        int v4 = @"SIRI_SUGGESTION_SHARED_ETA";
        break;
      case 738:
        int v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
        break;
      case 739:
        int v4 = @"INCIDENT_ALERT_TRAY";
        break;
      case 740:
        int v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
        break;
      case 741:
        int v4 = @"RAP_INCIDENT_REPORT_VIEW";
        break;
      case 742:
        int v4 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
        break;
      case 743:
        int v4 = @"TRAFFIC_ADVISORY_SHEET";
        break;
      case 801:
        int v4 = @"SIRI_PLUGIN_SNIPPET";
        break;
      case 802:
        int v4 = @"SIRI_PLUGIN_COMMAND";
        break;
      case 803:
        int v4 = @"SIRI_SEARCH_RESULT_LIST";
        break;
      case 804:
        int v4 = @"SIRI_DISAMBIGUATION_LIST";
        break;
      case 805:
        int v4 = @"SIRI_PLACE_SNIPPET";
        break;
      default:
        if (a3 != 901) {
          goto LABEL_55;
        }
        int v4 = @"CHROME";
        break;
    }
  }
  return v4;
}

- (void)setWebPaths:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  webPaths = self->_webPaths;
  self->_webPaths = v4;
}

- (GEORPUserPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPUserPath;
  v2 = [(GEORPUserPath *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    int v4 = v2;
  }

  return v3;
}

- (GEORPUserPath)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPUserPath;
  uint64_t v3 = [(GEORPUserPath *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPUserPath;
  [(GEORPUserPath *)&v3 dealloc];
}

- (void)_readNativePaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserPathReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNativePaths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)nativePathsCount
{
  return self->_nativePaths.count;
}

- (int)nativePaths
{
  return self->_nativePaths.list;
}

- (void)clearNativePaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addNativePath:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (int)nativePathAtIndex:(unint64_t)a3
{
  -[GEORPUserPath _readNativePaths]((uint64_t)self);
  p_nativePaths = &self->_nativePaths;
  unint64_t count = self->_nativePaths.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_nativePaths->list[a3];
}

- (void)setNativePaths:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147390](&self->_nativePaths, a3, a4);
}

- (void)_readWebPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserPathReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebPaths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)webPaths
{
  -[GEORPUserPath _readWebPaths]((uint64_t)self);
  webPaths = self->_webPaths;

  return webPaths;
}

- (void)_addNoFlagsWebPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      int v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)webPathAtIndex:(unint64_t)a3
{
  -[GEORPUserPath _readWebPaths]((uint64_t)self);
  webPaths = self->_webPaths;

  return (id)[(NSMutableArray *)webPaths objectAtIndex:a3];
}

+ (Class)webPathType
{
  return (Class)objc_opt_class();
}

- (id)dictionaryRepresentation
{
  return -[GEORPUserPath _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPUserPath _dictionaryRepresentation:](self, 1);
}

void __43__GEORPUserPath__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPUserPath)initWithDictionary:(id)a3
{
  return (GEORPUserPath *)-[GEORPUserPath _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPUserPath)initWithJSON:(id)a3
{
  return (GEORPUserPath *)-[GEORPUserPath _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3850;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3851;
    }
    GEORPUserPathReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUserPathIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUserPathReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPUserPath *)self readAll:0];
    if (self->_nativePaths.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_nativePaths.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_webPaths;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEORPUserPath *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPUserPath *)self nativePathsCount])
  {
    [v11 clearNativePaths];
    unint64_t v4 = [(GEORPUserPath *)self nativePathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addNativePath:", -[GEORPUserPath nativePathAtIndex:](self, "nativePathAtIndex:", i));
    }
  }
  if ([(GEORPUserPath *)self webPathsCount])
  {
    [v11 clearWebPaths];
    unint64_t v7 = [(GEORPUserPath *)self webPathsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        id v10 = [(GEORPUserPath *)self webPathAtIndex:j];
        [v11 addWebPath:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPUserPathReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPUserPath *)self readAll:0];
  PBRepeatedInt32Copy();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v8 = self->_webPaths;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [v5 addWebPath:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPUserPath *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual()))
  {
    webPaths = self->_webPaths;
    if ((unint64_t)webPaths | v4[6]) {
      char v6 = -[NSMutableArray isEqual:](webPaths, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEORPUserPath *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  return [(NSMutableArray *)self->_webPaths hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 nativePathsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEORPUserPath addNativePath:](self, "addNativePath:", [v4 nativePathAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEORPUserPath addWebPath:](self, "addWebPath:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPUserPathReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3855);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPUserPath *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webPaths, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end