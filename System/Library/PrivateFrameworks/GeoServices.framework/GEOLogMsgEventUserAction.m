@interface GEOLogMsgEventUserAction
+ (BOOL)isValid:(id)a3;
- (BOOL)hasActionRichProviderId;
- (BOOL)hasButtonType;
- (BOOL)hasModuleInfo;
- (BOOL)hasUserActionEventAction;
- (BOOL)hasUserActionEventKey;
- (BOOL)hasUserActionEventTarget;
- (BOOL)hasUserActionEventValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventUserAction)init;
- (GEOLogMsgEventUserAction)initWithData:(id)a3;
- (GEOLogMsgEventUserAction)initWithDictionary:(id)a3;
- (GEOLogMsgEventUserAction)initWithJSON:(id)a3;
- (GEOLogMsgEventUserActionModuleInfo)moduleInfo;
- (NSString)actionRichProviderId;
- (NSString)userActionEventKey;
- (NSString)userActionEventValue;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buttonTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)userActionEventActionAsString:(int)a3;
- (id)userActionEventTargetAsString:(int)a3;
- (int)StringAsButtonType:(id)a3;
- (int)StringAsUserActionEventTarget:(id)a3;
- (int)buttonType;
- (int)userActionEventAction;
- (int)userActionEventTarget;
- (unint64_t)hash;
- (void)_readActionRichProviderId;
- (void)_readModuleInfo;
- (void)_readUserActionEventKey;
- (void)_readUserActionEventValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setActionRichProviderId:(id)a3;
- (void)setButtonType:(int)a3;
- (void)setHasButtonType:(BOOL)a3;
- (void)setHasUserActionEventAction:(BOOL)a3;
- (void)setHasUserActionEventTarget:(BOOL)a3;
- (void)setModuleInfo:(id)a3;
- (void)setUserActionEventAction:(int)a3;
- (void)setUserActionEventKey:(id)a3;
- (void)setUserActionEventTarget:(int)a3;
- (void)setUserActionEventValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventUserAction

- (int)userActionEventAction
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_userActionEventAction;
  }
  else {
    return 0;
  }
}

- (void)setUserActionEventValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_userActionEventValue, a3);
}

- (void)setUserActionEventTarget:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_userActionEventTarget = a3;
}

- (void)setUserActionEventAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_userActionEventAction = a3;
}

- (void)setActionRichProviderId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_actionRichProviderId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActionEventValue, 0);
  objc_storeStrong((id *)&self->_userActionEventKey, 0);
  objc_storeStrong((id *)&self->_moduleInfo, 0);
  objc_storeStrong((id *)&self->_actionRichProviderId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOLogMsgEventUserAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventUserAction;
  v2 = [(GEOLogMsgEventUserAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventUserAction *)self readAll:0];
    if (self->_userActionEventKey) {
      PBDataWriterWriteStringField();
    }
    if (self->_userActionEventValue) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_moduleInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_actionRichProviderId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_5412;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5413;
    }
    GEOLogMsgEventUserActionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLogMsgEventUserActionModuleInfo *)self->_moduleInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)setButtonType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_buttonType = a3;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 userActionEventKey];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"userActionEventKey";
      }
      else {
        objc_super v6 = @"user_action_event_key";
      }
      [v4 setObject:v5 forKey:v6];
    }

    v7 = [(id)a1 userActionEventValue];
    if (v7)
    {
      if (a2) {
        id v8 = @"userActionEventValue";
      }
      else {
        id v8 = @"user_action_event_value";
      }
      [v4 setObject:v7 forKey:v8];
    }

    char v9 = *(unsigned char *)(a1 + 72);
    if ((v9 & 4) != 0)
    {
      int v10 = *(_DWORD *)(a1 + 68);
      if (v10 > 1000)
      {
        if (v10 > 1600)
        {
          switch(v10)
          {
            case 1700:
              v11 = @"LOOK_AROUND_PIP";
              break;
            case 1701:
              v11 = @"LOOK_AROUND_ACTION_SHEET";
              break;
            case 1702:
              v11 = @"LOOK_AROUND_VIEW";
              break;
            case 1703:
              v11 = @"LOOK_AROUND_PLATTER";
              break;
            case 1704:
              v11 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
              break;
            case 1705:
              v11 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
              break;
            case 1706:
              v11 = @"LOOK_AROUND_VIEW_PLACECARD";
              break;
            case 1707:
              v11 = @"LOOK_AROUND_PIP_PLACECARD";
              break;
            case 1708:
              v11 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
              break;
            default:
              if (v10 == 1601)
              {
                v11 = @"MENU_ITEM_DARK_MAP";
              }
              else
              {
LABEL_37:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
                v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case 1001:
              v11 = @"CARPLAY_NAV";
              break;
            case 1002:
              v11 = @"CARPLAY_EXPLORE";
              break;
            case 1003:
              v11 = @"CARPLAY_DESTINATIONS";
              break;
            case 1004:
              v11 = @"CARPLAY_TRAFFIC_INCIDENT";
              break;
            case 1005:
              v11 = @"CARPLAY_CONTROL";
              break;
            case 1006:
              v11 = @"CARPLAY_PROACTIVE";
              break;
            case 1007:
              v11 = @"CARPLAY_ROUTING";
              break;
            case 1008:
              v11 = @"CARPLAY_MORE_ROUTES";
              break;
            case 1009:
              v11 = @"CARPLAY_SEARCH_ALONG_ROUTE";
              break;
            case 1010:
              v11 = @"CARPLAY_SEARCH";
              break;
            case 1011:
              v11 = @"CARPLAY_SEARCH_RESULTS";
              break;
            case 1012:
              v11 = @"CARPLAY_FAVORITES";
              break;
            case 1013:
              v11 = @"CARPLAY_NAV_CONFIRMATION";
              break;
            case 1014:
              v11 = @"CARPLAY_DESTINATION_SHARING";
              break;
            case 1015:
              v11 = @"CARPLAY_NOTIFICATION_BATTERY";
              break;
            case 1016:
              v11 = @"CARPLAY_NOTIFICATION_DOOM";
              break;
            case 1017:
              v11 = @"CARPLAY_NOTIFICATION_FUEL";
              break;
            case 1018:
              v11 = @"CARPLAY_NOTIFICATION_HYBRID";
              break;
            case 1019:
              v11 = @"CARPLAY_SHARE_ETA_TRAY";
              break;
            case 1020:
              v11 = @"CARPLAY_ETA_UPDATE_TRAY";
              break;
            case 1021:
              v11 = @"CARPLAY_ACTION_TRAY";
              break;
            case 1022:
              v11 = @"CARPLAY_PLACECARD";
              break;
            case 1023:
              v11 = @"CARPLAY_KEYBOARD";
              break;
            case 1024:
              v11 = @"CARPLAY_UI_TARGET_UNKNOWN";
              break;
            case 1025:
              v11 = @"CARPLAY_EDIT_STOPS";
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
              goto LABEL_37;
            case 1100:
              v11 = @"RAP_DIRECTIONS_MENU";
              break;
            case 1101:
              v11 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
              break;
            case 1102:
              v11 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
              break;
            case 1103:
              v11 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
              break;
            case 1104:
              v11 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
              break;
            case 1105:
              v11 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
              break;
            case 1106:
              v11 = @"RAP_TRANSIT_MENU";
              break;
            case 1107:
              v11 = @"RAP_STATION_MAP";
              break;
            case 1108:
              v11 = @"RAP_STATION_MENU";
              break;
            case 1109:
              v11 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
              break;
            case 1110:
              v11 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
              break;
            case 1111:
              v11 = @"RAP_STATION_CLOSED_FORM";
              break;
            case 1112:
              v11 = @"RAP_LINE_MAP";
              break;
            case 1113:
              v11 = @"RAP_LINE_MENU";
              break;
            case 1114:
              v11 = @"RAP_LINE_NAME_FORM";
              break;
            case 1115:
              v11 = @"RAP_LINE_SHAPE_FORM";
              break;
            case 1116:
              v11 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
              break;
            case 1117:
              v11 = @"RAP_ADD_PLACE_MENU";
              break;
            case 1118:
              v11 = @"RAP_ADD_POI_MAP";
              break;
            case 1119:
              v11 = @"RAP_CATEGORY_LIST";
              break;
            case 1120:
              v11 = @"RAP_POI_DETAILS_FORM";
              break;
            case 1121:
              v11 = @"RAP_ADD_STREET_MAP";
              break;
            case 1122:
              v11 = @"RAP_STREET_DETAILS_FORM";
              break;
            case 1123:
              v11 = @"RAP_ADD_OTHER_MAP";
              break;
            case 1124:
              v11 = @"RAP_OTHER_DETAILS_FORM";
              break;
            case 1125:
              v11 = @"RAP_CAMERA";
              break;
            case 1126:
              v11 = @"RAP_LABEL_MAP";
              break;
            case 1127:
              v11 = @"RAP_LABEL_DETAILS_FORM";
              break;
            case 1128:
              v11 = @"RAP_SEARCH_MENU";
              break;
            case 1129:
              v11 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
              break;
            case 1130:
              v11 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
              break;
            case 1131:
              v11 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
              break;
            case 1132:
              v11 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
              break;
            case 1133:
              v11 = @"RAP_SATELLITE_IMAGE_MAP";
              break;
            case 1134:
              v11 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
              break;
            case 1135:
              v11 = @"RAP_OTHER_FORM";
              break;
            case 1136:
              v11 = @"RAP_PRIVACY";
              break;
            case 1137:
              v11 = @"RAP_CONFIRMATION";
              break;
            case 1138:
              v11 = @"RAP_POI_MENU";
              break;
            case 1139:
              v11 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
              break;
            case 1140:
              v11 = @"RAP_ADD_A_PLACE_MAP";
              break;
            case 1141:
              v11 = @"RAP_POI_LOCATION_MAP";
              break;
            case 1142:
              v11 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
              break;
            case 1143:
              v11 = @"RAP_POI_CLOSED_FORM";
              break;
            case 1144:
              v11 = @"RAP_CLAIM_BUSINESS_DIALOG";
              break;
            case 1145:
              v11 = @"RAP_BRAND_MENU";
              break;
            case 1146:
              v11 = @"RAP_BRAND_DETAILS_FORM";
              break;
            case 1147:
              v11 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
              break;
            case 1148:
              v11 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
              break;
            case 1149:
              v11 = @"RAP_LOOK_AROUND_BLURRING_FORM";
              break;
            case 1150:
              v11 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
              break;
            case 1151:
              v11 = @"RAP_LOOK_AROUND_MENU";
              break;
            case 1152:
              v11 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
              break;
            case 1153:
              v11 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
              break;
            case 1154:
              v11 = @"RAP_LIGHTWEIGHT";
              break;
            case 1155:
              v11 = @"RAP_EDIT_PLACE_DETAILS";
              break;
            case 1156:
              v11 = @"RAP_ADD_CATEGORY";
              break;
            case 1157:
              v11 = @"RAP_ADD_HOURS";
              break;
            case 1158:
              v11 = @"RAP_EDIT_LOCATION";
              break;
            case 1159:
              v11 = @"RAP_EDIT_ENTRY_POINT";
              break;
            case 1160:
              v11 = @"RAP_LOOK_AROUND";
              break;
            case 1161:
              v11 = @"RAP_ADD_ENTRY_POINT";
              break;
            case 1201:
              v11 = @"WATCH_MAIN_MENU";
              break;
            case 1202:
              v11 = @"WATCH_MAIN_PRESS_MENU";
              break;
            case 1203:
              v11 = @"WATCH_SEARCH";
              break;
            case 1204:
              v11 = @"WATCH_DICTATION";
              break;
            case 1205:
              v11 = @"WATCH_FAVORITES";
              break;
            case 1206:
              v11 = @"WATCH_SUB_CATEGORY_LIST";
              break;
            case 1207:
              v11 = @"WATCH_SEARCH_RESULTS_LIST";
              break;
            case 1208:
              v11 = @"WATCH_MAP_VIEW";
              break;
            case 1209:
              v11 = @"WATCH_PLACECARD";
              break;
            case 1210:
              v11 = @"WATCH_ROUTE_PLANNING";
              break;
            case 1211:
              v11 = @"WATCH_ROUTE_DETAILS";
              break;
            case 1212:
              v11 = @"WATCH_NAV_TBT";
              break;
            case 1213:
              v11 = @"WATCH_NAV_MAP";
              break;
            case 1214:
              v11 = @"WATCH_NAV_PRESS_MENU";
              break;
            case 1215:
              v11 = @"WATCH_MAP_PRESS_MENU";
              break;
            case 1216:
              v11 = @"WATCH_ROUTING_PRESS_MENU";
              break;
            case 1217:
              v11 = @"WATCH_TRANSIT_MAP_VIEW";
              break;
            case 1218:
              v11 = @"WATCH_SCRIBBLE";
              break;
            case 1219:
              v11 = @"WATCH_COLLECTION_VIEW";
              break;
            case 1220:
              v11 = @"WATCH_ROUTE_PLANNING_WALKING";
              break;
            case 1221:
              v11 = @"WATCH_ROUTE_PLANNING_DRIVING";
              break;
            case 1222:
              v11 = @"WATCH_ROUTE_PLANNING_TRANSIT";
              break;
            case 1223:
              v11 = @"WATCH_PAIRED_DEVICE";
              break;
            case 1224:
              v11 = @"WATCH_NAV_DRIVING_SPLIT";
              break;
            case 1225:
              v11 = @"WATCH_NAV_DRIVING_PLATTER";
              break;
            case 1226:
              v11 = @"WATCH_NAV_DRIVING_MAP";
              break;
            case 1227:
              v11 = @"WATCH_NAV_WALKING_SPLIT";
              break;
            case 1228:
              v11 = @"WATCH_NAV_WALKING_PLATTER";
              break;
            case 1229:
              v11 = @"WATCH_NAV_WALKING_MAP";
              break;
            case 1230:
              v11 = @"WATCH_NAV_TRANSIT_SPLIT";
              break;
            case 1231:
              v11 = @"WATCH_NAV_TRANSIT_PLATTER";
              break;
            case 1232:
              v11 = @"WATCH_NAV_TRANSIT_MAP";
              break;
            case 1233:
              v11 = @"WATCH_ROUTE_INFO";
              break;
            case 1234:
              v11 = @"WATCH_NAV_CYCLING_MAP";
              break;
            case 1235:
              v11 = @"WATCH_NAV_CYCLING_PLATTER";
              break;
            case 1236:
              v11 = @"WATCH_NAV_CYCLING_SPLIT";
              break;
            case 1237:
              v11 = @"WATCH_ROUTE_PLANNING_CYCLING";
              break;
            case 1238:
              v11 = @"WATCH_SEARCH_INPUT";
              break;
            case 1239:
              v11 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
              break;
            case 1240:
              v11 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
              break;
            case 1301:
              v11 = @"PERSONALIZED_ADDRESS_LIST";
              break;
            case 1302:
              v11 = @"PERSONALIZED_ADDRESS_FORM";
              break;
            case 1303:
              v11 = @"PERSONALIZED_LABEL_FORM";
              break;
            case 1304:
              v11 = @"PERSONALIZED_EDIT_MAP";
              break;
            case 1305:
              v11 = @"PERSONALIZED_CONFIRMATION";
              break;
            case 1306:
              v11 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
              break;
            case 1307:
              v11 = @"PERSONALIZED_ADDRESS_INFO";
              break;
            case 1308:
              v11 = @"PERSONALIZED_ADDRESS_SEARCH";
              break;
            case 1309:
              v11 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
              break;
            case 1310:
              v11 = @"FAVORITE_SEARCH";
              break;
            case 1311:
              v11 = @"FAVORITE_LIST";
              break;
            case 1312:
              v11 = @"FAVORITE_INFO";
              break;
            case 1313:
              v11 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
              break;
            default:
              switch(v10)
              {
                case 1401:
                  v11 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
                  break;
                case 1402:
                  v11 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
                  break;
                case 1403:
                  v11 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
                  break;
                case 1404:
                  v11 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
                  break;
                case 1405:
                  v11 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
                  break;
                case 1406:
                  v11 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
                  break;
                case 1407:
                  v11 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
                  break;
                default:
                  switch(v10)
                  {
                    case 1501:
                      v11 = @"PLACECARD_HEADER";
                      break;
                    case 1502:
                      v11 = @"PLACECARD_ADDRESS";
                      break;
                    case 1503:
                      v11 = @"PLACECARD_PHONE";
                      break;
                    case 1504:
                      v11 = @"PLACECARD_URL";
                      break;
                    default:
                      goto LABEL_37;
                  }
                  break;
              }
              break;
          }
        }
      }
      else
      {
        v11 = @"UI_TARGET_UNKNOWN";
        switch(v10)
        {
          case 0:
            break;
          case 1:
            v11 = @"UI_TARGET_POI";
            break;
          case 2:
            v11 = @"UI_TARGET_SEARCH_RESULT_LIST";
            break;
          case 3:
            v11 = @"UI_TARGET_POPULAR_NEARBY_LIST";
            break;
          case 4:
            v11 = @"UI_TARGET_CALLOUT";
            break;
          case 5:
            v11 = @"UI_TARGET_SEARCH_PIN";
            break;
          case 6:
            v11 = @"UI_TARGET_DROPPED_PIN";
            break;
          case 7:
            v11 = @"UI_TARGET_TRANSIT_LINE";
            break;
          case 8:
            v11 = @"SEARCH_TRAY";
            break;
          case 9:
            v11 = @"SEARCH_TRAY_BROWSE";
            break;
          case 10:
            v11 = @"SEARCH_TRAY_POPULAR_NEARBY";
            break;
          case 11:
            v11 = @"SEARCH_TRAY_AC";
            break;
          case 12:
            v11 = @"SEARCH_TRAY_AC_INTERMEDIATE";
            break;
          case 13:
            v11 = @"SEARCH_TRAY_NO_QUERY";
            break;
          case 14:
            v11 = @"AR_WALKING_LEGAL_TRAY";
            break;
          case 15:
            v11 = @"RAISE_TO_START_AR_TRAY";
            break;
          case 16:
            v11 = @"EVENTS_ADVISORY_DETAILS_PAGE";
            break;
          case 17:
            v11 = @"INCIDENT_REPORT_TRAY_CARPLAY";
            break;
          case 18:
            v11 = @"HIGHLIGHTED_AREA";
            break;
          case 19:
            v11 = @"CURATED_COLLECTIONS_HOME";
            break;
          case 20:
            v11 = @"TRAVEL_PREFERENCES_TRAY";
            break;
          case 21:
            v11 = @"RESULT_TRAY_SEARCH";
            break;
          case 22:
            v11 = @"SINGLE_CARD_FILTER";
            break;
          case 23:
            v11 = @"FULL_CARD_FILTER";
            break;
          case 24:
            v11 = @"ACCOUNT_PRIVACY_TRAY";
            break;
          case 25:
            v11 = @"APPLE_RATINGS_HISTORY_TRAY";
            break;
          case 26:
            v11 = @"CURATED_COLLECTIONS_HOME_FILTERED";
            break;
          case 27:
            v11 = @"CITY_MENU";
            break;
          case 28:
            v11 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
            break;
          case 29:
            v11 = @"ACCOUNT_TRAY";
            break;
          case 30:
            v11 = @"QUICK_ACTION_TRAY";
            break;
          case 31:
            v11 = @"SUBMIT_TRIP_FEEDBACK";
            break;
          case 32:
            v11 = @"RAP_PLACE_ISSUE_DETAILS";
            break;
          case 33:
            v11 = @"RAP_GUIDES_DETAILS";
            break;
          case 34:
            v11 = @"RAP_BAD_DIRECTIONS_DETAILS";
            break;
          case 35:
            v11 = @"RAP_ADD_MAP_DETAILS";
            break;
          case 36:
            v11 = @"WATCH_COMPLICATION";
            break;
          case 37:
            v11 = @"RAP_NAV_MENU";
            break;
          case 38:
            v11 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
            break;
          case 39:
            v11 = @"RAP_REPORT_MENU";
            break;
          case 40:
            v11 = @"RAP_CURATED_COLLECTION_MENU";
            break;
          case 41:
            v11 = @"RAP_REPORT_CARD_DETAILS";
            break;
          case 42:
            v11 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
            break;
          case 43:
            v11 = @"RAP_STREET_ISSUE_DETAILS";
            break;
          case 44:
            v11 = @"NEARBY_TRANSIT_CARD";
            break;
          case 45:
            v11 = @"WATCH_NAV_MENU";
            break;
          case 46:
            v11 = @"GENERIC_ADVISORY_PAGE";
            break;
          case 47:
            v11 = @"USER_PROFILE_TRAY";
            break;
          case 48:
            v11 = @"MEDIA_APP_MENU";
            break;
          case 49:
            v11 = @"TEMPLATE_PLACE_TRAY";
            break;
          case 50:
            v11 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
            break;
          case 51:
            v11 = @"ALLOW_NOTIFICATION_DIALOG";
            break;
          case 52:
            v11 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
            break;
          case 53:
            v11 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
            break;
          case 54:
            v11 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
            break;
          case 55:
            v11 = @"NOTIFICATION_CONSENT_PROMPT";
            break;
          case 56:
            v11 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
            break;
          case 57:
            v11 = @"PLACECARD_TRAY_VENDORS_MENU";
            break;
          case 58:
            v11 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
            break;
          case 59:
            v11 = @"SEARCH_ALONG_ROUTE_TRAY";
            break;
          case 60:
            v11 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
            break;
          case 61:
            v11 = @"PLACECARD_SHOWCASE_MENU";
            break;
          case 62:
            v11 = @"RAP_INLINE_ADD_DETAILS";
            break;
          case 63:
            v11 = @"RAP_EDIT_MENU_DETAILS";
            break;
          case 64:
            v11 = @"RAP_SUBMISSION_PROMPT";
            break;
          case 65:
            v11 = @"RAP_PLACECARD_EDIT_MENU";
            break;
          case 66:
            v11 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
            break;
          case 67:
            v11 = @"INCIDENT_REPORT_MENU";
            break;
          case 68:
            v11 = @"RAP_SELECT_BAD_ROUTES_STEPS";
            break;
          case 69:
            v11 = @"RAP_SELECT_BAD_ROUTES";
            break;
          case 70:
            v11 = @"SIRI_SUGGESTION_RESUME_ROUTE";
            break;
          case 71:
            v11 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
            break;
          case 72:
            v11 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
            break;
          case 73:
            v11 = @"SPOTLIGHT_BUSINESS_ENTITY";
            break;
          case 74:
            v11 = @"NOTIFICATION_ARP";
            break;
          case 75:
            v11 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
            break;
          case 76:
            v11 = @"YOUR_PHOTOS_ALBUM";
            break;
          case 77:
            v11 = @"ARP_PHOTO_CREDIT";
            break;
          case 78:
            v11 = @"RAP_OUTREACH_REVIEWED_REPORT";
            break;
          case 79:
            v11 = @"RAP_REPORT_MENU_MORE";
            break;
          case 80:
            v11 = @"WATCH_MAPS_SETTINGS";
            break;
          case 81:
            v11 = @"OFFLINE_FEATURE_PROMPT";
            break;
          case 82:
            v11 = @"EXPIRED_MAPS_DETAILS";
            break;
          case 83:
            v11 = @"MAPS_VIEW";
            break;
          case 84:
            v11 = @"NOTIFICATION_OFFLINE";
            break;
          case 85:
            v11 = @"EXPIRED_MAPS_MANAGEMENT";
            break;
          case 86:
            v11 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
            break;
          case 87:
            v11 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
            break;
          case 88:
            v11 = @"OFFLINE_MAPS_MANAGEMENT";
            break;
          case 89:
            v11 = @"REGION_SELECTOR";
            break;
          case 90:
            v11 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
            break;
          case 91:
            v11 = @"FIND_MY_ETA_SHARING_TRAY";
            break;
          case 92:
            v11 = @"WATCH_PLACE";
            break;
          case 93:
            v11 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
            break;
          case 94:
            v11 = @"WATCH_ROUTE_PLANNING_MAP";
            break;
          case 95:
            v11 = @"WATCH_NAV_WALKING_CONTROLS";
            break;
          case 96:
            v11 = @"WATCH_NAV_CYCLING_CONTROLS";
            break;
          case 97:
            v11 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
            break;
          case 98:
            v11 = @"WATCH_NAV_TRANSIT_CONTROLS";
            break;
          case 99:
            v11 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
            break;
          case 100:
            v11 = @"WATCH_NAV_DRIVING_CONTROLS";
            break;
          case 101:
            v11 = @"RESULTS_TRAY_SEARCH";
            break;
          case 102:
            v11 = @"RESULTS_TRAY_BROWSE";
            break;
          case 103:
            v11 = @"RESULTS_TRAY_FAVORITES";
            break;
          case 104:
            v11 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
            break;
          case 105:
            v11 = @"RESULTS_TRAY_CLUSTER";
            break;
          case 106:
            v11 = @"RESULTS_TRAY_VENUE_BROWSE";
            break;
          case 107:
            v11 = @"WATCH_MAP_RESULTS";
            break;
          case 108:
            v11 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
            break;
          case 109:
            v11 = @"WATCH_PLACES";
            break;
          case 110:
            v11 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
            break;
          case 111:
            v11 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
            break;
          case 112:
            v11 = @"DOWNLOADED_MAPS_DETAILS";
            break;
          case 113:
            v11 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
            break;
          case 114:
            v11 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
            break;
          case 115:
            v11 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
            break;
          case 116:
            v11 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
            break;
          case 117:
            v11 = @"WATCH_ROUTE_OPTIONS";
            break;
          case 118:
            v11 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
            break;
          case 119:
            v11 = @"WATCH_MORE_GUIDES";
            break;
          case 120:
            v11 = @"WATCH_RECENTLY_VIEWED";
            break;
          case 121:
            v11 = @"EV_SUCCESS_TRAY";
            break;
          case 122:
            v11 = @"PREFERRED_NETWORK_SELECTION_TRAY";
            break;
          case 123:
            v11 = @"PREFERRED_NETWORK_TRAY";
            break;
          case 124:
            v11 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
            break;
          case 125:
            v11 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
            break;
          case 126:
            v11 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
            break;
          case 127:
            v11 = @"AC_KEYBOARD_TRAY";
            break;
          case 128:
            v11 = @"MORE_RELATED_TRAILS";
            break;
          case 129:
            v11 = @"MORE_RELATED_TRAILHEADS";
            break;
          case 130:
            v11 = @"ROUTING_TRAY_CUSTOM_ROUTE";
            break;
          case 131:
            v11 = @"CUSTOM_ROUTE_CREATION_TRAY";
            break;
          case 132:
            v11 = @"ROUTING_TRAY_CURATED_HIKE";
            break;
          case 133:
            v11 = @"MORE_CURATED_HIKES";
            break;
          case 134:
            v11 = @"CUSTOM_ROUTE_ONBOARDING";
            break;
          case 135:
            v11 = @"LIBRARY_ROUTES";
            break;
          case 136:
            v11 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
            break;
          case 137:
            v11 = @"MY_LIBRARY";
            break;
          case 138:
            v11 = @"EDIT_NOTE_TRAY";
            break;
          case 139:
            v11 = @"CREATE_NOTE_TRAY";
            break;
          case 140:
            v11 = @"LIBRARY_PLACES";
            break;
          case 141:
            v11 = @"WATCH_ACCOUNT";
            break;
          case 142:
            v11 = @"WATCH_DOWNLOADED_MAPS";
            break;
          case 143:
            v11 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
            break;
          case 144:
            v11 = @"VISUAL_INTELLIGENCE_DETECTION";
            break;
          case 145:
            v11 = @"VISUAL_INTELLIGENCE_SNIPPET";
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
            goto LABEL_37;
          case 201:
            v11 = @"PLACECARD_TRAY";
            break;
          case 202:
            v11 = @"WEB_MODULE";
            break;
          case 250:
            v11 = @"ADD_FAVORITE_TRAY";
            break;
          case 251:
            v11 = @"COLLECTION_LIST";
            break;
          case 252:
            v11 = @"COLLECTION_VIEW";
            break;
          case 253:
            v11 = @"FAVORITE_DETAILS";
            break;
          case 254:
            v11 = @"FAVORITES_TRAY";
            break;
          case 255:
            v11 = @"SHARED_COLLECTION";
            break;
          case 256:
            v11 = @"SHARED_COLLECTION_VIEW";
            break;
          case 257:
            v11 = @"RECENTLY_VIEWED";
            break;
          case 258:
            v11 = @"SHARED_WEB_COLLECTION";
            break;
          case 259:
            v11 = @"CURATED_COLLECTION_VIEW";
            break;
          case 260:
            v11 = @"FEATURED_COLLECTIONS";
            break;
          case 261:
            v11 = @"PUBLISHER_TRAY";
            break;
          case 262:
            v11 = @"SHARED_CURATED_COLLECTION_VIEW";
            break;
          case 263:
            v11 = @"CURATED_COLLECTION_NOTIFICATION";
            break;
          case 264:
            v11 = @"CURATED_COLLECTION_LIST";
            break;
          case 265:
            v11 = @"PUBLISHER_LIST";
            break;
          case 266:
            v11 = @"WATCH_CURATED_COLLECTION_VIEW";
            break;
          case 267:
            v11 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
            break;
          case 268:
            v11 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
            break;
          case 301:
            v11 = @"ROUTING_TRAY_DRIVING";
            break;
          case 302:
            v11 = @"ROUTING_TRAY_WALKING";
            break;
          case 303:
            v11 = @"ROUTING_TRAY_TRANSIT";
            break;
          case 304:
            v11 = @"ROUTING_TRAY_RIDESHARE";
            break;
          case 305:
            v11 = @"ROUTING_TRAY_CYCLING";
            break;
          case 306:
            v11 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
            break;
          case 401:
            v11 = @"NAV_TRAY_DRIVING";
            break;
          case 402:
            v11 = @"NAV_TRAY_WALKING";
            break;
          case 403:
            v11 = @"NAV_TRAY_TRANSIT";
            break;
          case 404:
            v11 = @"NAV_TRAY_CYCLING";
            break;
          case 501:
            v11 = @"MAP_PLACECARD";
            break;
          case 502:
            v11 = @"MAP_SEARCH";
            break;
          case 503:
            v11 = @"MAP_RESULTS";
            break;
          case 504:
            v11 = @"MAP_ROUTING";
            break;
          case 505:
            v11 = @"MAP_NAV";
            break;
          case 506:
            v11 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
            break;
          case 507:
            v11 = @"MAP_TRAFFIC_INCIDENT";
            break;
          case 508:
            v11 = @"MAP_FULL_SCREEN";
            break;
          case 509:
            v11 = @"MAP_DRIVE";
            break;
          case 510:
            v11 = @"MAP_LAUNCH_AND_GO";
            break;
          case 511:
            v11 = @"MAP_VIEW";
            break;
          case 601:
            v11 = @"MAPS_SETTINGS";
            break;
          case 602:
            v11 = @"MAPS_PREFERENCES";
            break;
          case 603:
            v11 = @"RAP";
            break;
          case 604:
            v11 = @"ROUTING_DRIVING_DETAILS";
            break;
          case 605:
            v11 = @"ROUTING_WALKING_DETAILS";
            break;
          case 606:
            v11 = @"ROUTING_TRANSIT_DETAILS";
            break;
          case 607:
            v11 = @"ROUTING_EDITOR";
            break;
          case 608:
            v11 = @"NAV_DRIVING_DETAILS";
            break;
          case 609:
            v11 = @"NAV_WALKING_DETAILS";
            break;
          case 610:
            v11 = @"NAV_TRANSIT_DETAILS";
            break;
          case 611:
            v11 = @"NAV_AUDIO_SETTINGS";
            break;
          case 612:
            v11 = @"PHOTO_VIEWER_ALL";
            break;
          case 613:
            v11 = @"PHOTO_VIEWER_SINGLE";
            break;
          case 614:
            v11 = @"ROUTE_OPTIONS_TRANSIT";
            break;
          case 615:
            v11 = @"TRAFFIC_INCIDENT_TRAY";
            break;
          case 616:
            v11 = @"NAV_DIRECTIONS_BANNER_DRIVING";
            break;
          case 617:
            v11 = @"NAV_DIRECTIONS_BANNER_WALKING";
            break;
          case 618:
            v11 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
            break;
          case 619:
            v11 = @"REFINE_SEARCH_SUGGESTION_AREA";
            break;
          case 620:
            v11 = @"ADD_PHOTO_SHEET";
            break;
          case 621:
            v11 = @"ADD_PLACE_SHEET";
            break;
          case 622:
            v11 = @"SHARE_SHEET";
            break;
          case 623:
            v11 = @"EDIT_LOCATION_SHEET";
            break;
          case 624:
            v11 = @"ADD_CONTACT_SHEET";
            break;
          case 625:
            v11 = @"EDIT_NAME_SHEET";
            break;
          case 626:
            v11 = @"DRIVING_NAV_SETTINGS";
            break;
          case 627:
            v11 = @"TRANSIT_SETTINGS";
            break;
          case 628:
            v11 = @"TRANSIT_ADVISORY_SHEET";
            break;
          case 629:
            v11 = @"REMOVE_CAR_SHEET";
            break;
          case 630:
            v11 = @"ROUTE_OPTIONS_DRIVING";
            break;
          case 631:
            v11 = @"ROUTE_OPTIONS_DATETIME";
            break;
          case 632:
            v11 = @"TRANSIT_ADVISORY_BANNER";
            break;
          case 633:
            v11 = @"BOOK_TABLE_SELECT_TIME";
            break;
          case 634:
            v11 = @"BOOK_TABLE_MORE_OPTIONS";
            break;
          case 635:
            v11 = @"BOOK_TABLE_READY";
            break;
          case 636:
            v11 = @"BOOK_TABLE_BOOKED";
            break;
          case 637:
            v11 = @"TRANSIT_LINE_CLUSTER_SHEET";
            break;
          case 638:
            v11 = @"TRANSIT_LINE_LIST_SHEET";
            break;
          case 639:
            v11 = @"TRANSIT_BALANCE_BANNER";
            break;
          case 640:
            v11 = @"WEATHER_ICON";
            break;
          case 641:
            v11 = @"HELP_IMPROVE_MAPS_DIALOG";
            break;
          case 642:
            v11 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
            break;
          case 643:
            v11 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
            break;
          case 644:
            v11 = @"FLOOR_PICKER";
            break;
          case 645:
            v11 = @"VENUE_LIST";
            break;
          case 646:
            v11 = @"AR_MODE";
            break;
          case 647:
            v11 = @"ROUTING_TRANSIT_TICKETS_SHEET";
            break;
          case 648:
            v11 = @"LINKED_SERVICE_HOURS";
            break;
          case 649:
            v11 = @"SHARE_ETA_TRAY";
            break;
          case 650:
            v11 = @"ETA_UPDATE_TRAY";
            break;
          case 651:
            v11 = @"SCHEDULECARD_TRAY";
            break;
          case 652:
            v11 = @"AR_NAV";
            break;
          case 653:
            v11 = @"TAP_TRANSIT_ACCESS_POINT";
            break;
          case 654:
            v11 = @"LOCATIONS_INSIDE";
            break;
          case 655:
            v11 = @"SIMILAR_LOCATIONS";
            break;
          case 656:
            v11 = @"LOCATIONS_AT_ADDRESS";
            break;
          case 657:
            v11 = @"NAV_DIRECTIONS_BANNER_CYCLING";
            break;
          case 658:
            v11 = @"ROUTE_OPTIONS_CYCLING";
            break;
          case 659:
            v11 = @"EV_CONNECTION_TRAY";
            break;
          case 660:
            v11 = @"VIRTUAL_GARAGE";
            break;
          case 661:
            v11 = @"VIRTUAL_GARAGE_BANNER";
            break;
          case 662:
            v11 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
            break;
          case 663:
            v11 = @"ADVISORY_DETAILS_PAGE";
            break;
          case 664:
            v11 = @"APP_CLIP_NOTIFICATION";
            break;
          case 665:
            v11 = @"PHOTO_VIEWER_GALLERY";
            break;
          case 666:
            v11 = @"RECOMMENDATION_CARD";
            break;
          case 667:
            v11 = @"INCIDENT_REPORT_TRAY";
            break;
          case 668:
            v11 = @"MAPS_WIDGET_DISPLAY";
            break;
          case 669:
            v11 = @"VISUAL_LOCATION_FRAMEWORK";
            break;
          case 670:
            v11 = @"APP_CLIP_TRAY";
            break;
          case 671:
            v11 = @"LICENSE_PLATE_SUGGESTION_PAGE";
            break;
          case 672:
            v11 = @"NOTIFICATION_ADD_PLATE";
            break;
          case 673:
            v11 = @"MAPS_RESULTS";
            break;
          case 674:
            v11 = @"MAPS_WIDGET_APP_CONNECTION";
            break;
          case 675:
            v11 = @"MAPS_WIDGET_CURRENT_LOCATION";
            break;
          case 676:
            v11 = @"MAPS_WIDGET_CURRENT_NAV";
            break;
          case 677:
            v11 = @"MAPS_WIDGET_ETA";
            break;
          case 678:
            v11 = @"MAPS_WIDGET_TRANSIT";
            break;
          case 679:
            v11 = @"MAPS_WIDGET_UPC_DESTINATION";
            break;
          case 680:
            v11 = @"WIDGET_CREATION_TRAY";
            break;
          case 681:
            v11 = @"MAPS_WIDGET_HOME";
            break;
          case 682:
            v11 = @"MAPS_WIDGET_PARKED_CAR";
            break;
          case 683:
            v11 = @"MAPS_WIDGET_POI";
            break;
          case 684:
            v11 = @"MAPS_WIDGET_SCHOOL";
            break;
          case 685:
            v11 = @"MAPS_WIDGET_WORK";
            break;
          case 686:
            v11 = @"AIRPORT_NOTIFICATION";
            break;
          case 687:
            v11 = @"MAPS_WIDGET_EMPTY";
            break;
          case 688:
            v11 = @"COARSE_LOCATION_OPTIONS_PROMPT";
            break;
          case 689:
            v11 = @"ALLOW_PRECISE_LOCATION_PROMPT";
            break;
          case 690:
            v11 = @"SHARE_MY_LOCATION";
            break;
          case 691:
            v11 = @"MARK_MY_LOCATION";
            break;
          case 692:
            v11 = @"AIRPORT_NOTIFICATION_WATCH";
            break;
          case 693:
            v11 = @"EDIT_FAVORITE";
            break;
          case 694:
            v11 = @"ROUTING_CYCLING_DETAILS";
            break;
          case 695:
            v11 = @"NAV_CYCLING_DETAILS";
            break;
          case 696:
            v11 = @"MAPS_SUGGESTION_WIDGET";
            break;
          case 697:
            v11 = @"ARP_TIPKIT";
            break;
          case 698:
            v11 = @"ARP_PRIVACY";
            break;
          case 699:
            v11 = @"ROUTE_OPTIONS_WALKING";
            break;
          case 701:
            v11 = @"SAFARI_SEARCH";
            break;
          case 702:
            v11 = @"SPOTLIGHT_SEARCH";
            break;
          case 703:
            v11 = @"SAFARI_MAPS_SEARCH_RESULTS";
            break;
          case 704:
            v11 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
            break;
          case 705:
            v11 = @"WIDGET_MAPS_DESTINATIONS";
            break;
          case 706:
            v11 = @"WIDGET_MAPS_TRANSIT";
            break;
          case 707:
            v11 = @"WIDGET_MAPS_NEARBY";
            break;
          case 708:
            v11 = @"NOTIFICATION_FIND_MY_CAR";
            break;
          case 709:
            v11 = @"CONTROL_CENTER";
            break;
          case 710:
            v11 = @"NOTIFICATION_CENTER";
            break;
          case 711:
            v11 = @"NOTIFICATION_DOOM";
            break;
          case 712:
            v11 = @"NOTIFICATION_VENUES";
            break;
          case 713:
            v11 = @"NOTIFICATION_RAP_UPDATE";
            break;
          case 714:
            v11 = @"NOTIFICATION_TRIP_CANCELLED";
            break;
          case 715:
            v11 = @"NOTIFICATION_STOP_SKIPPED";
            break;
          case 716:
            v11 = @"NOTIFICATION_TRIP_DELAYED";
            break;
          case 717:
            v11 = @"NOTIFICATION_RAP";
            break;
          case 718:
            v11 = @"NOTIFICATION_PROXY_AUTH";
            break;
          case 719:
            v11 = @"NOTIFICATION_PUSH_TO_DEVICE";
            break;
          case 720:
            v11 = @"NOTIFICATION_LOW_FUEL";
            break;
          case 721:
            v11 = @"NOTIFICATION_FIND_MY_CAR_RESET";
            break;
          case 722:
            v11 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
            break;
          case 723:
            v11 = @"NOTIFICATION_SHARED_ETA";
            break;
          case 724:
            v11 = @"NOTIFICATION_SHARED_ETA_UPDATE";
            break;
          case 725:
            v11 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
            break;
          case 726:
            v11 = @"ANNOUNCEMENT_TYPE_GENERAL";
            break;
          case 727:
            v11 = @"ANNOUNCEMENT_TYPE_FLYOVER";
            break;
          case 728:
            v11 = @"ANNOUNCEMENT_TYPE_TRANSIT";
            break;
          case 729:
            v11 = @"ANNOUNCEMENT_TYPE_VENUES";
            break;
          case 730:
            v11 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
            break;
          case 731:
            v11 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
            break;
          case 732:
            v11 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
            break;
          case 733:
            v11 = @"APP_SHEET";
            break;
          case 734:
            v11 = @"CZ_ADVISORY_DETAILS_PAGE";
            break;
          case 735:
            v11 = @"SHARE_ETA_CONTACT_TRAY";
            break;
          case 736:
            v11 = @"SIRI_SHARE_ETA";
            break;
          case 737:
            v11 = @"SIRI_SUGGESTION_SHARED_ETA";
            break;
          case 738:
            v11 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
            break;
          case 739:
            v11 = @"INCIDENT_ALERT_TRAY";
            break;
          case 740:
            v11 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
            break;
          case 741:
            v11 = @"RAP_INCIDENT_REPORT_VIEW";
            break;
          case 742:
            v11 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
            break;
          case 743:
            v11 = @"TRAFFIC_ADVISORY_SHEET";
            break;
          case 801:
            v11 = @"SIRI_PLUGIN_SNIPPET";
            break;
          case 802:
            v11 = @"SIRI_PLUGIN_COMMAND";
            break;
          case 803:
            v11 = @"SIRI_SEARCH_RESULT_LIST";
            break;
          case 804:
            v11 = @"SIRI_DISAMBIGUATION_LIST";
            break;
          case 805:
            v11 = @"SIRI_PLACE_SNIPPET";
            break;
          default:
            if (v10 != 901) {
              goto LABEL_37;
            }
            v11 = @"CHROME";
            break;
        }
      }
      if (a2) {
        v12 = @"userActionEventTarget";
      }
      else {
        v12 = @"user_action_event_target";
      }
      [v4 setObject:v11 forKey:v12];

      char v9 = *(unsigned char *)(a1 + 72);
    }
    if ((v9 & 2) != 0)
    {
      int v13 = *(_DWORD *)(a1 + 64);
      if (v13 > 4000)
      {
        if (v13 <= 10100)
        {
          if (v13 > 7000)
          {
            switch(v13)
            {
              case 9001:
                v14 = @"TAP_WIDGET_ITEM";
                break;
              case 9002:
                v14 = @"DISPLAY_NOTIFICATION";
                break;
              case 9003:
                v14 = @"TAP_NOTIFICATION";
                break;
              case 9004:
                v14 = @"EXPAND_NOTIFICATION";
                break;
              case 9005:
                v14 = @"DISMISS_NOTIFICATION";
                break;
              case 9006:
                v14 = @"OPEN_SEARCH";
                break;
              case 9007:
                v14 = @"OPEN_PAN_VIEW";
                break;
              case 9008:
                v14 = @"PAN_LEFT";
                break;
              case 9009:
                v14 = @"PAN_UP";
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
                goto LABEL_569;
              case 9011:
                v14 = @"PAN_DOWN";
                break;
              case 9012:
                v14 = @"TAP_RECENT_DESTINATIONS";
                break;
              case 9013:
                v14 = @"OPEN_DESTINATIONS";
                break;
              case 9014:
                v14 = @"OPEN_FAVORITES";
                break;
              case 9015:
                v14 = @"VIEW_NAV_OPTIONS";
                break;
              case 9016:
                v14 = @"START_NAV_NO_GUIDANCE";
                break;
              case 9017:
                v14 = @"TURN_OFF_GUIDANCE";
                break;
              case 9018:
                v14 = @"TURN_ON_GUIDANCE";
                break;
              case 9019:
                v14 = @"OPEN_KEYBOARD";
                break;
              case 9020:
                v14 = @"SHARE_DESTINATION";
                break;
              case 9021:
                v14 = @"START_NAV_AUTOMATED";
                break;
              case 9022:
                v14 = @"SHARE_ETA";
                break;
              case 9023:
                v14 = @"SELECT_GROUP";
                break;
              case 9024:
                v14 = @"DESELECT_GROUP";
                break;
              case 9025:
                v14 = @"SELECT_CONTACT";
                break;
              case 9026:
                v14 = @"DESELECT_CONTACT";
                break;
              case 9027:
                v14 = @"TAP_VIEW_CONTACTS";
                break;
              case 9028:
                v14 = @"STOP_RECEIVING_ETA";
                break;
              case 9029:
                v14 = @"DISPLAY_ANNOUNCEMENT";
                break;
              case 9030:
                v14 = @"TAP_ANNOUNCEMENT";
                break;
              case 9031:
                v14 = @"DISPLAY_CYCLING_NOTIFICATION";
                break;
              case 9032:
                v14 = @"TAP_CYCLING_NOTIFICATION";
                break;
              case 9033:
                v14 = @"SHARE_CYCLING_ETA";
                break;
              case 9034:
                v14 = @"MANAGE_NOTIFICATIONS";
                break;
              case 9035:
                v14 = @"PUNCH_OUT_PUBLISHER_REVIEW";
                break;
              case 9036:
                v14 = @"SCROLL_FORWARD";
                break;
              case 9037:
                v14 = @"SCROLL_BACKWARD";
                break;
              case 9038:
                v14 = @"SHOW_ALL_CURATED_COLLECTIONS";
                break;
              case 9039:
                v14 = @"TAP_LESS";
                break;
              case 9040:
                v14 = @"TAP_MORE";
                break;
              case 9101:
                v14 = @"DISPLAY_ADD_HOME_AND_WORK";
                break;
              case 9102:
                v14 = @"TAP_ADD_HOME_AND_WORK";
                break;
              case 9103:
                v14 = @"DISPLAY_ALLOW_FREQUENTS";
                break;
              case 9104:
                v14 = @"TAP_ALLOW_FREQUENTS";
                break;
              case 9105:
                v14 = @"DISPLAY_ALLOW_LOCATION";
                break;
              case 9106:
                v14 = @"TAP_ALLOW_LOCATION";
                break;
              default:
                switch(v13)
                {
                  case 7001:
                    v14 = @"EXPAND_TRANSIT_SYSTEM";
                    break;
                  case 7002:
                    v14 = @"COLLAPSE_TRANSIT_SYSTEM";
                    break;
                  case 7003:
                    v14 = @"SHOW_MORE_DEPARTURES";
                    break;
                  case 7004:
                    v14 = @"VIEW_TRANSIT_LINE";
                    break;
                  case 7005:
                    v14 = @"CANCEL_VIEW_TRANSIT_LINE";
                    break;
                  case 7006:
                    v14 = @"TAP_TRANSIT_ATTRIBUTION";
                    break;
                  case 7007:
                    v14 = @"TAP_TRANSIT_ADVISORY";
                    break;
                  case 7008:
                    v14 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                    break;
                  case 7009:
                    v14 = @"SUBSCRIBE_LINE_INCIDENT";
                    break;
                  case 7010:
                    v14 = @"UNSUBSCRIBE_LINE_INCIDENT";
                    break;
                  case 7011:
                    v14 = @"TAP_NEAREST_STATION";
                    break;
                  case 7012:
                    v14 = @"TAP_NEAREST_STOP";
                    break;
                  case 7013:
                    v14 = @"TAP_CONNECTION";
                    break;
                  case 7014:
                    v14 = @"GET_TICKETS";
                    break;
                  case 7015:
                    v14 = @"OPEN_SCHEDULECARD_DATETIME";
                    break;
                  case 7016:
                    v14 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                    break;
                  case 7017:
                    v14 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                    break;
                  case 7018:
                    v14 = @"VIEW_ON_MAP";
                    break;
                  case 7019:
                    v14 = @"FORCE_UPDATE_DEPARTURE_INFO";
                    break;
                  case 7020:
                    v14 = @"TAP_TRANSIT_LINE_INFO";
                    break;
                  case 7021:
                    v14 = @"TAP_ATTRIBUTION_CELL";
                    break;
                  case 7022:
                    v14 = @"TAP_NEXT_DEPARTURES";
                    break;
                  case 7023:
                    v14 = @"VIEW_BANNER";
                    break;
                  case 7024:
                    v14 = @"GET_SHOWTIMES";
                    break;
                  case 7025:
                    v14 = @"MAKE_APPOINTMENT";
                    break;
                  case 7026:
                    v14 = @"RESERVE_PARKING";
                    break;
                  case 7027:
                    v14 = @"RESERVE_ROOM";
                    break;
                  case 7028:
                    v14 = @"WAITLIST";
                    break;
                  case 7029:
                    v14 = @"ORDER_TAKEOUT";
                    break;
                  case 7030:
                    v14 = @"RESERVE";
                    break;
                  default:
                    switch(v13)
                    {
                      case 8001:
                        v14 = @"INVOKE_SIRI_SNIPPET";
                        break;
                      case 8002:
                        v14 = @"INVOKE_SIRI_DISAMBIGUATION";
                        break;
                      case 8003:
                        v14 = @"SHOW_PLACE_DETAILS";
                        break;
                      case 8004:
                        v14 = @"ANSWER_REROUTE_SUGGESTION";
                        break;
                      case 8005:
                        v14 = @"SUGGEST_NAV_REROUTE";
                        break;
                      case 8006:
                        v14 = @"GET_NAV_STATUS";
                        break;
                      case 8007:
                        v14 = @"REPEAT_NAV_STATUS";
                        break;
                      case 8008:
                        v14 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                        break;
                      case 8009:
                        v14 = @"INVOKE_SIRI";
                        break;
                      case 8010:
                        v14 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                        break;
                      case 8011:
                        v14 = @"DISPLAY_NO_RESULTS_MESSAGE";
                        break;
                      default:
                        goto LABEL_569;
                    }
                    break;
                }
                break;
            }
          }
          else
          {
            switch(v13)
            {
              case 6003:
                v14 = @"GET_DIRECTIONS";
                break;
              case 6004:
                v14 = @"TAP_FLYOVER_TOUR";
                break;
              case 6005:
                v14 = @"REMOVE_PIN";
                break;
              case 6006:
                v14 = @"TAP_PHOTO";
                break;
              case 6007:
                v14 = @"TAP_MAPS_VIEW";
                break;
              case 6008:
                v14 = @"TAP_ADDRESS";
                break;
              case 6009:
                v14 = @"CALL";
                break;
              case 6010:
                v14 = @"TAP_URL";
                break;
              case 6011:
                v14 = @"SHOW_TODAY_HOURS";
                break;
              case 6012:
                v14 = @"SHOW_ALL_HOURS";
                break;
              case 6013:
                v14 = @"SHARE";
                break;
              case 6014:
              case 6017:
              case 6028:
              case 6030:
              case 6035:
                goto LABEL_569;
              case 6015:
                v14 = @"ADD_TO_FAVORITES";
                break;
              case 6016:
                v14 = @"ADD_CONTACT";
                break;
              case 6018:
                v14 = @"PUNCH_OUT_PHOTO";
                break;
              case 6019:
                v14 = @"PUNCH_OUT_USEFUL_TO_KNOW";
                break;
              case 6020:
                v14 = @"PUNCH_OUT_OPEN_APP";
                break;
              case 6021:
                v14 = @"PUNCH_OUT_SINGLE_REVIEW";
                break;
              case 6022:
                v14 = @"PUNCH_OUT_CHECK_IN";
                break;
              case 6023:
                v14 = @"PUNCH_OUT_MORE_INFO";
                break;
              case 6024:
                v14 = @"PUNCH_OUT_WRITE_REVIEW";
                break;
              case 6025:
                v14 = @"PUNCH_OUT_ADD_PHOTO";
                break;
              case 6026:
                v14 = @"TAP_GRID_VIEW";
                break;
              case 6027:
                v14 = @"EDIT_LOCATION";
                break;
              case 6029:
                v14 = @"ADD_PHOTO";
                break;
              case 6031:
                v14 = @"RETAKE";
                break;
              case 6032:
                v14 = @"ADD_NOTE";
                break;
              case 6033:
                v14 = @"REMOVE_CAR";
                break;
              case 6034:
                v14 = @"EDIT_NAME";
                break;
              case 6036:
                v14 = @"RESERVE_TABLE";
                break;
              case 6037:
                v14 = @"ADD_TO_QUEUE";
                break;
              case 6038:
                v14 = @"VIEW_BOOKED_TABLE";
                break;
              case 6039:
                v14 = @"VIEW_QUEUED_TABLE";
                break;
              case 6040:
                v14 = @"PUNCH_OUT_THIRD_PARTY_APP";
                break;
              case 6041:
                v14 = @"PUNCH_OUT_LEGAL_LINK";
                break;
              case 6042:
                v14 = @"TAP_PLACECARD_HEADER";
                break;
              case 6043:
                v14 = @"REMOVE_FROM_FAVORITES";
                break;
              case 6044:
                v14 = @"VIEW_CONTACT";
                break;
              case 6045:
                v14 = @"CHAT";
                break;
              case 6046:
                v14 = @"FIND_STORES";
                break;
              case 6047:
                v14 = @"TAP_PARENT";
                break;
              case 6048:
                v14 = @"SCROLL_LEFT_PHOTOS";
                break;
              case 6049:
                v14 = @"SCROLL_RIGHT_PHOTOS";
                break;
              case 6050:
                v14 = @"PUNCH_OUT";
                break;
              case 6051:
                v14 = @"TAP_ENTER_MUNIN";
                break;
              case 6052:
                v14 = @"TAP_RECOMMENDED_DISHES_PHOTO";
                break;
              case 6053:
                v14 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
                break;
              case 6054:
                v14 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
                break;
              case 6055:
                v14 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
                break;
              case 6056:
                v14 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
                break;
              case 6057:
                v14 = @"SHOW_LINKED_SERVICE_HOURS";
                break;
              case 6058:
                v14 = @"ENTER_LOOK_AROUND";
                break;
              case 6059:
                v14 = @"EXIT_LOOK_AROUND";
                break;
              case 6060:
                v14 = @"TAP_ENTER_LOOK_AROUND_VIEW";
                break;
              case 6061:
                v14 = @"TAP_ENTER_LOOK_AROUND_PIP";
                break;
              case 6062:
                v14 = @"EXPAND_LOOK_AROUND_VIEW";
                break;
              case 6063:
                v14 = @"CLOSE_LOOK_AROUND";
                break;
              case 6064:
                v14 = @"COLLAPSE_LOOK_AROUND_VIEW";
                break;
              case 6065:
                v14 = @"TAP_SHOW_ACTIONS";
                break;
              case 6066:
                v14 = @"TAP_HIDE_LABELS";
                break;
              case 6067:
                v14 = @"TAP_SHOW_LABELS";
                break;
              case 6068:
                v14 = @"TAP_SHOW_DETAILS";
                break;
              case 6069:
                v14 = @"PAN_LOOK_AROUND";
                break;
              case 6070:
                v14 = @"TAP_LOOK_AROUND_THUMBNAIL";
                break;
              case 6071:
                v14 = @"TAP_LANDMARK";
                break;
              case 6072:
                v14 = @"TAP_SCENE";
                break;
              case 6073:
                v14 = @"SHOW_LINKED_BUSINESS_HOURS";
                break;
              case 6074:
                v14 = @"TAP_PLACECARD_SHORTCUT";
                break;
              case 6075:
                v14 = @"SHOW_ALL_LOCATIONS_INSIDE";
                break;
              case 6076:
                v14 = @"SHOW_ALL_SIMILAR_LOCATIONS";
                break;
              case 6077:
                v14 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
                break;
              case 6078:
                v14 = @"TAP_PARENT_LOCATION";
                break;
              case 6079:
                v14 = @"TAP_SIMILAR_LOCATION";
                break;
              case 6080:
                v14 = @"TAP_LOCATION_INSIDE";
                break;
              case 6081:
                v14 = @"TAP_LOCATION_AT_ADDRESS";
                break;
              case 6082:
                v14 = @"CLOSE_ROUTE_GENIUS";
                break;
              case 6083:
                v14 = @"LOAD_WEB_CONTENT";
                break;
              case 6084:
                v14 = @"SCROLL_FORWARD_WEB_CONTENT";
                break;
              case 6085:
                v14 = @"SCROLL_BACKWARD_WEB_CONTENT";
                break;
              case 6086:
                v14 = @"TAP_WEB_CONTENT";
                break;
              case 6087:
                v14 = @"SHOW_PHOTO_VIEWER";
                break;
              case 6088:
                v14 = @"SHOW_LAST_PAGE";
                break;
              case 6089:
                v14 = @"TAP_VIEW_APP";
                break;
              case 6090:
                v14 = @"TAP_APP_CLIP";
                break;
              case 6091:
                v14 = @"DEAD_BATTERY";
                break;
              case 6092:
                v14 = @"DISMISS_LOW_BATTERY_ALERT";
                break;
              case 6093:
                v14 = @"DISMISS_OUT_OF_RANGE_ALERT";
                break;
              case 6094:
                v14 = @"FAILED_TO_LOAD_EV_STATUS";
                break;
              case 6095:
                v14 = @"LOW_BATTERY_ALERT";
                break;
              case 6096:
                v14 = @"PAUSE_ROUTE";
                break;
              case 6097:
                v14 = @"TAP_ADD_STOP";
                break;
              case 6098:
                v14 = @"TAP_CHARGE_POINT";
                break;
              case 6099:
                v14 = @"TAP_OUT_OF_RANGE_ALERT";
                break;
              case 6100:
                v14 = @"SCROLL_DOWN_PHOTOS";
                break;
              case 6101:
                v14 = @"SCROLL_UP_PHOTOS";
                break;
              case 6102:
                v14 = @"TAP_MORE_PHOTOS";
                break;
              case 6103:
                v14 = @"TAP_TO_CONFIRM_INCIDENT";
                break;
              case 6104:
                v14 = @"SHOW_INCIDENT";
                break;
              case 6105:
                v14 = @"REVEAL_APP_CLIP";
                break;
              case 6106:
                v14 = @"ORDER_DELIVERY";
                break;
              case 6107:
                v14 = @"VIEW_MENU";
                break;
              case 6108:
                v14 = @"TAP_EDIT_STOPS";
                break;
              case 6109:
                v14 = @"LEARN_MORE_WEB_CONTENT";
                break;
              case 6110:
                v14 = @"MAKE_APPOINTMENT_WEB_CONTENT";
                break;
              case 6111:
                v14 = @"REVEAL_SHOWCASE";
                break;
              default:
                switch(v13)
                {
                  case 5001:
                    v14 = @"SHOW_MAPS_SETTINGS";
                    break;
                  case 5002:
                    v14 = @"TAP_STANDARD_MODE";
                    break;
                  case 5003:
                    v14 = @"TAP_TRANSIT_MODE";
                    break;
                  case 5004:
                    v14 = @"TAP_SATELLITE_MODE";
                    break;
                  case 5005:
                    v14 = @"SWITCH_ON_TRAFFIC";
                    break;
                  case 5006:
                    v14 = @"SWITCH_OFF_TRAFFIC";
                    break;
                  case 5007:
                    v14 = @"SWITCH_ON_LABELS";
                    break;
                  case 5008:
                    v14 = @"SWITCH_OFF_LABELS";
                    break;
                  case 5009:
                    v14 = @"SWITCH_ON_3D_MAP";
                    break;
                  case 5010:
                    v14 = @"SWITCH_OFF_3D_MAP";
                    break;
                  case 5011:
                    v14 = @"SWITCH_ON_WEATHER";
                    break;
                  case 5012:
                    v14 = @"SWITCH_OFF_WEATHER";
                    break;
                  case 5013:
                    v14 = @"REPORT_A_PROBLEM";
                    break;
                  case 5014:
                    v14 = @"ADD_PLACE";
                    break;
                  case 5015:
                    goto LABEL_569;
                  case 5016:
                    v14 = @"TAP_PREFERENCES";
                    break;
                  case 5017:
                    v14 = @"SWITCH_ON_TOLLS";
                    break;
                  case 5018:
                    v14 = @"SWITCH_OFF_TOLLS";
                    break;
                  case 5019:
                    v14 = @"SWITCH_ON_HIGHWAYS";
                    break;
                  case 5020:
                    v14 = @"SWITCH_OFF_HIGHWAYS";
                    break;
                  case 5021:
                    v14 = @"SWITCH_ON_HEADING";
                    break;
                  case 5022:
                    v14 = @"SWITCH_OFF_HEADING";
                    break;
                  case 5023:
                    v14 = @"SWITCH_ON_SPEED_LIMIT";
                    break;
                  case 5024:
                    v14 = @"SWITCH_OFF_SPEED_LIMIT";
                    break;
                  case 5025:
                    v14 = @"ELECT_DRIVING_MODE";
                    break;
                  case 5026:
                    v14 = @"ELECT_WALKING_MODE";
                    break;
                  case 5027:
                    v14 = @"ELECT_TRANSIT_MODE";
                    break;
                  case 5028:
                    v14 = @"ELECT_RIDESHARE_MODE";
                    break;
                  case 5029:
                    v14 = @"SWITCH_ON_FIND_MY_CAR";
                    break;
                  case 5030:
                    v14 = @"SWITCH_OFF_FIND_MY_CAR";
                    break;
                  case 5031:
                    v14 = @"MARK_MY_LOCATION";
                    break;
                  case 5032:
                    v14 = @"TAP_HYBRID_MODE";
                    break;
                  case 5033:
                    v14 = @"CHECK_AVOID_BUSY_ROADS";
                    break;
                  case 5034:
                    v14 = @"UNCHECK_AVOID_BUSY_ROADS";
                    break;
                  case 5035:
                    v14 = @"CHECK_AVOID_HILLS";
                    break;
                  case 5036:
                    v14 = @"UNCHECK_AVOID_HILLS";
                    break;
                  case 5037:
                    v14 = @"CHECK_AVOID_STAIRS";
                    break;
                  case 5038:
                    v14 = @"UNCHECK_AVOID_STAIRS";
                    break;
                  case 5039:
                    v14 = @"ELECT_CYCLING_MODE";
                    break;
                  default:
                    switch(v13)
                    {
                      case 4001:
                        v14 = @"RECENTER_CURRENT_LOCATION";
                        break;
                      case 4002:
                        v14 = @"TAP_HEADING_ON";
                        break;
                      case 4003:
                        v14 = @"TAP_HEADING_OFF";
                        break;
                      case 4004:
                        v14 = @"PUCK_DRIFT";
                        break;
                      case 4005:
                        v14 = @"PUCK_SNAP";
                        break;
                      case 4006:
                        v14 = @"SELECT_FLOOR";
                        break;
                      default:
                        goto LABEL_569;
                    }
                    break;
                }
                break;
            }
          }
        }
        else if (v13 > 13000)
        {
          if (v13 <= 16000)
          {
            if (v13 <= 15000)
            {
              switch(v13)
              {
                case 14001:
                  v14 = @"VIEW_APP";
                  break;
                case 14002:
                  v14 = @"ENABLE";
                  break;
                case 14003:
                  v14 = @"BOOK_RIDE";
                  break;
                case 14004:
                  v14 = @"REQUEST_RIDE";
                  break;
                case 14005:
                  v14 = @"CONTACT_DRIVER";
                  break;
                case 14006:
                  v14 = @"CHANGE_PAYMENT";
                  break;
                case 14007:
                  v14 = @"ENABLE_ALL_RIDESHARE_APPS";
                  break;
                case 14008:
                  v14 = @"TAP_FOR_MORE_RIDES";
                  break;
                case 14009:
                  v14 = @"SUBMIT_TRIP_FEEDBACK";
                  break;
                default:
                  switch(v13)
                  {
                    case 13001:
                      v14 = @"SELECT_ADDRESS";
                      break;
                    case 13002:
                      v14 = @"ADD_ADDRESS";
                      break;
                    case 13003:
                      v14 = @"SELECT_LABEL";
                      break;
                    case 13004:
                      v14 = @"DELETE_ADDRESS";
                      break;
                    case 13005:
                      v14 = @"EDIT_ITEMS";
                      break;
                    case 13006:
                      v14 = @"RAP_FAVORITES";
                      break;
                    case 13007:
                      v14 = @"SORT_LIST_ITEM";
                      break;
                    default:
                      goto LABEL_569;
                  }
                  break;
              }
            }
            else
            {
              switch(v13)
              {
                case 15001:
                  v14 = @"ORB_PEEK";
                  break;
                case 15002:
                  v14 = @"ORB_POP";
                  break;
                case 15003:
                  v14 = @"ORB_DISMISS";
                  break;
                default:
LABEL_569:
                  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 64));
                  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  break;
              }
            }
          }
          else
          {
            switch(v13)
            {
              case 17001:
                v14 = @"START_DRAG";
                break;
              case 17002:
                v14 = @"CANCEL_DRAG";
                break;
              case 17003:
                v14 = @"COMPLETE_DRAG";
                break;
              case 17004:
                v14 = @"START_DROP";
                break;
              case 17005:
                v14 = @"CANCEL_DROP";
                break;
              case 17006:
                v14 = @"COMPLETE_DROP";
                break;
              case 17007:
                v14 = @"ANNOTATION_SELECT";
                break;
              case 17008:
                v14 = @"ANNOTATION_SELECT_AUTO";
                break;
              case 17009:
                v14 = @"ANNOTATION_SELECT_LIST";
                break;
              case 17010:
                v14 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
                break;
              case 17011:
                v14 = @"CALLOUT_FLYOVER_TOUR";
                break;
              case 17012:
                v14 = @"CALLOUT_INFO";
                break;
              case 17013:
                v14 = @"CALLOUT_NAV_TRANSIT";
                break;
              case 17014:
                v14 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
                break;
              case 17015:
                v14 = @"CALLOUT_VIEW_TRANSIT_LINE";
                break;
              case 17016:
                v14 = @"DIRECTIONS_SELECT";
                break;
              case 17017:
                v14 = @"DIRECTIONS_TRANSIT_CUSTOM";
                break;
              case 17018:
                v14 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
                break;
              case 17019:
                v14 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
                break;
              case 17020:
                v14 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
                break;
              case 17021:
                v14 = @"DIRECTIONS_TRANSIT_LATER";
                break;
              case 17022:
                v14 = @"DIRECTIONS_TRANSIT_NOW";
                break;
              case 17023:
                v14 = @"FLYOVER_NOTIFICATION_DISMISS";
                break;
              case 17024:
                v14 = @"FLYOVER_NOTIFICATION_START";
                break;
              case 17025:
                v14 = @"FLYOVER_TOUR_COMPLETED";
                break;
              case 17026:
                v14 = @"FLYOVER_TOUR_END";
                break;
              case 17027:
                v14 = @"FLYOVER_TOUR_NOTIFICATION";
                break;
              case 17028:
                v14 = @"FLYOVER_TOUR_START";
                break;
              case 17029:
                v14 = @"INFO_BOOKMARKS";
                break;
              case 17030:
                v14 = @"INFO_CARD_DETACHED";
                break;
              case 17031:
                v14 = @"INFO_CONTACTS";
                break;
              case 17032:
                v14 = @"INFO_DIRECTIONS";
                break;
              case 17033:
                v14 = @"INFO_DIRECTIONS_FROM";
                break;
              case 17034:
                v14 = @"INFO_DIRECTIONS_TO";
                break;
              case 17035:
                v14 = @"INFO_DISMISS";
                break;
              case 17036:
                v14 = @"INFO_INFO";
                break;
              case 17037:
                v14 = @"INFO_PHOTOS";
                break;
              case 17038:
                v14 = @"INFO_REVIEWS";
                break;
              case 17039:
                v14 = @"INFO_SHARE";
                break;
              case 17040:
                v14 = @"INFO_SHARE_AIRDROP";
                break;
              case 17041:
                v14 = @"INFO_SHARE_FACEBOOK";
                break;
              case 17042:
                v14 = @"INFO_SHARE_MAIL";
                break;
              case 17043:
                v14 = @"INFO_SHARE_MESSAGE";
                break;
              case 17044:
                v14 = @"INFO_SHARE_TENCENTWEIBO";
                break;
              case 17045:
                v14 = @"INFO_SHARE_WEIBO";
                break;
              case 17046:
                v14 = @"INFO_YELP";
                break;
              case 17047:
                v14 = @"MAPS_APP_LAUNCH";
                break;
              case 17048:
                v14 = @"MAP_3D_OFF";
                break;
              case 17049:
                v14 = @"MAP_3D_ON";
                break;
              case 17050:
                v14 = @"MAP_OPTIONS_DROP_PIN";
                break;
              case 17051:
                v14 = @"MAP_OPTIONS_HYBRID";
                break;
              case 17052:
                v14 = @"MAP_OPTIONS_PRINT";
                break;
              case 17053:
                v14 = @"MAP_OPTIONS_REMOVE_PIN";
                break;
              case 17054:
                v14 = @"MAP_OPTIONS_SATELLITE";
                break;
              case 17055:
                v14 = @"MAP_OPTIONS_STANDARD";
                break;
              case 17056:
                v14 = @"MAP_OPTIONS_TRAFFIC_HIDE";
                break;
              case 17057:
                v14 = @"MAP_OPTIONS_TRAFFIC_SHOW";
                break;
              case 17058:
                v14 = @"MAP_OPTIONS_TRANSIT";
                break;
              case 17059:
                v14 = @"MAP_TAP_FLYOVER_CITY";
                break;
              case 17060:
                v14 = @"MAP_TAP_LINE";
                break;
              case 17061:
                v14 = @"MAP_TAP_POI_TRANSIT";
                break;
              case 17062:
                v14 = @"MAP_TAP_TRAFFIC_INCIDENT";
                break;
              case 17063:
                v14 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
                break;
              case 17064:
                v14 = @"MAP_USER_TRACKING_OFF";
                break;
              case 17065:
                v14 = @"MAP_USER_TRACKING_ON";
                break;
              case 17066:
                v14 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
                break;
              case 17067:
                v14 = @"NAV_CLEAR";
                break;
              case 17068:
                v14 = @"NAV_LIST";
                break;
              case 17069:
                v14 = @"NAV_ROUTE_STEP_NEXT";
                break;
              case 17070:
                v14 = @"NAV_ROUTE_STEP_PREV";
                break;
              case 17071:
                v14 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
                break;
              case 17072:
                v14 = @"ORB_DISPLAY_MENU";
                break;
              case 17073:
                v14 = @"ORB_MENU_CALL";
                break;
              case 17074:
                v14 = @"ORB_MENU_DIRECTIONS";
                break;
              case 17075:
                v14 = @"ORB_MENU_DISMISS";
                break;
              case 17076:
                v14 = @"ORB_MENU_SHARE";
                break;
              case 17077:
                v14 = @"ORB_MENU_SHOW_PLACECARD";
                break;
              case 17078:
                v14 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
                break;
              case 17079:
                v14 = @"ORB_MENU_URL";
                break;
              case 17080:
                v14 = @"ORB_PRESS";
                break;
              case 17081:
                v14 = @"ORB_SPRINGBOARD_MARK_LOCATION";
                break;
              case 17082:
                v14 = @"ORB_SPRINGBOARD_SEARCH";
                break;
              case 17083:
                v14 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
                break;
              case 17084:
                v14 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
                break;
              case 17085:
                v14 = @"RAP_PERMISSION_CANCEL";
                break;
              case 17086:
                v14 = @"RAP_PERMISSION_EMAIL_NA";
                break;
              case 17087:
                v14 = @"RAP_PERMISSION_EMAIL_OK";
                break;
              case 17088:
                v14 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
                break;
              case 17089:
                v14 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
                break;
              case 17090:
                v14 = @"RAP_PERMISSION_OK";
                break;
              case 17091:
                v14 = @"SEARCH_BEGIN";
                break;
              case 17092:
                v14 = @"SEARCH_CANCEL";
                break;
              case 17093:
                v14 = @"SEARCH_SELECT";
                break;
              case 17094:
                v14 = @"TRANSIT_LINE_SELECTION_DISMISS";
                break;
              case 17095:
                v14 = @"TRANSIT_LINE_SELECTION_VIEW";
                break;
              case 17096:
                v14 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
                break;
              case 17097:
                v14 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
                break;
              case 17098:
                v14 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
                break;
              case 17099:
                v14 = @"UNKNOWN_ACTION";
                break;
              case 17100:
                v14 = @"INFO_SHARE_TWITTER";
                break;
              case 17101:
                v14 = @"INFO_TAP_POPULAR_APP_NEARBY";
                break;
              case 17102:
                v14 = @"INFO_DIRECTIONS_WALK";
                break;
              case 17103:
                v14 = @"INFO_DIRECTIONS_TRANSIT";
                break;
              case 17104:
                v14 = @"INFO_DIRECTIONS_DRIVE";
                break;
              case 17105:
                v14 = @"INFO_REPORT_A_PROBLEM";
                break;
              case 17106:
                v14 = @"CALLOUT_NAV";
                break;
              case 17107:
                v14 = @"RAP_PERMISSION_EMAIL_CANCEL";
                break;
              case 17108:
                v14 = @"MAP_TAP_POI";
                break;
              default:
                if (v13 == 16001)
                {
                  v14 = @"SEARCH_IN_MAPS";
                }
                else
                {
                  if (v13 != 90010) {
                    goto LABEL_569;
                  }
                  v14 = @"PAN_RIGHT";
                }
                break;
            }
          }
        }
        else
        {
          switch(v13)
          {
            case 10101:
              v14 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
              break;
            case 10102:
              v14 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
              break;
            case 10103:
              v14 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
              break;
            case 10104:
              v14 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
              break;
            case 10105:
              v14 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
              break;
            case 10106:
              v14 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
              break;
            case 10107:
              v14 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
              break;
            case 10108:
              v14 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
              break;
            case 10109:
              v14 = @"RAP_CANCEL";
              break;
            case 10110:
              v14 = @"RAP_NEXT";
              break;
            case 10111:
              v14 = @"RAP_BACK";
              break;
            case 10112:
              v14 = @"RAP_SEND";
              break;
            case 10113:
              v14 = @"RAP_SKIP";
              break;
            case 10114:
              v14 = @"RAP_SHOW_MORE";
              break;
            case 10115:
              v14 = @"RAP_ADD_PHOTO";
              break;
            case 10116:
              v14 = @"RAP_MAP_INCORRECT";
              break;
            case 10117:
              v14 = @"RAP_BAD_DIRECTIONS";
              break;
            case 10118:
              v14 = @"RAP_TRANSIT_INFO_INCORRECT";
              break;
            case 10119:
              v14 = @"RAP_SATELLITE_IMAGE_PROBLEM";
              break;
            case 10120:
              v14 = @"RAP_SEARCH_RESULTS_INCORRECT";
              break;
            case 10121:
              v14 = @"RAP_ADD_A_PLACE";
              break;
            case 10122:
              v14 = @"RAP_HOME";
              break;
            case 10123:
              v14 = @"RAP_WORK";
              break;
            case 10124:
              v14 = @"RAP_OTHER";
              break;
            case 10125:
              v14 = @"RAP_LOCATION";
              break;
            case 10126:
              v14 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
              break;
            case 10127:
              v14 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
              break;
            case 10128:
              v14 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
              break;
            case 10129:
              v14 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
              break;
            case 10130:
              v14 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
              break;
            case 10131:
              v14 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
              break;
            case 10132:
              v14 = @"RAP_TRANSIT_DELAY";
              break;
            case 10133:
              v14 = @"RAP_LOCATION_CLOSED";
              break;
            case 10134:
              v14 = @"RAP_CLOSED_PERMANENTLY";
              break;
            case 10135:
              v14 = @"RAP_CLOSED_TEMPORARILY";
              break;
            case 10136:
              v14 = @"RAP_HOURS_HAVE_CHANGED";
              break;
            case 10137:
              v14 = @"RAP_SELECT_STATION";
              break;
            case 10138:
              v14 = @"RAP_SELECT_LINE";
              break;
            case 10139:
              v14 = @"RAP_SELECT_ACCESS_POINT";
              break;
            case 10140:
              v14 = @"RAP_SELECT_SEARCH";
              break;
            case 10141:
              v14 = @"RAP_PAN_MAP";
              break;
            case 10142:
              v14 = @"RAP_CENTER_MAP_ON_USER";
              break;
            case 10143:
              v14 = @"RAP_SEARCH_UNEXPECTED";
              break;
            case 10144:
              v14 = @"RAP_ADD_POI";
              break;
            case 10145:
              v14 = @"RAP_ADD_STREET_ADDRESS";
              break;
            case 10146:
              v14 = @"RAP_ADD_OTHER";
              break;
            case 10147:
              v14 = @"RAP_SELECT_CATEGORY";
              break;
            case 10148:
              v14 = @"RAP_TAKE_PHOTO";
              break;
            case 10149:
              v14 = @"RAP_RETAKE_PHOTO";
              break;
            case 10150:
              v14 = @"RAP_PLACE_DETAILS";
              break;
            case 10151:
              v14 = @"RAP_SATELLITE_IMAGE_OUTDATED";
              break;
            case 10152:
              v14 = @"RAP_SATELLITE_IMAGE_QUALITY";
              break;
            case 10153:
              v14 = @"RAP_SELECT_LABEL";
              break;
            case 10154:
              v14 = @"RAP_SELECT_ROUTE";
              break;
            case 10155:
              v14 = @"RAP_CLAIM_BUSINESS";
              break;
            case 10156:
              v14 = @"RAP_BRAND_DETAILS";
              break;
            case 10157:
              v14 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
              break;
            case 10158:
              v14 = @"RAP_LOOK_AROUND_LABELS_STREET";
              break;
            case 10159:
              v14 = @"RAP_LOOK_AROUND_BLURRING";
              break;
            case 10160:
              v14 = @"RAP_LOOK_AROUND_REMOVE_HOME";
              break;
            case 10161:
              v14 = @"RAP_LOOK_AROUND_LABELS_STORE";
              break;
            case 10162:
              v14 = @"RAP_LOOK_AROUND_PRIVACY";
              break;
            case 10163:
              v14 = @"RAP_INCORRECT_HOURS";
              break;
            case 10164:
              v14 = @"RAP_INCORRECT_ADDRESS";
              break;
            case 10165:
              v14 = @"RAP_EDIT_PLACE_DETAILS";
              break;
            case 10166:
              v14 = @"RAP_EDIT_PLACE_NAME";
              break;
            case 10167:
              v14 = @"RAP_EDIT_ADDRESS";
              break;
            case 10168:
              v14 = @"RAP_ADD_CATEGORY";
              break;
            case 10169:
              v14 = @"RAP_REMOVE_CATEGORY";
              break;
            case 10170:
              v14 = @"RAP_DESELECT_CATEGORY";
              break;
            case 10171:
              v14 = @"RAP_ADD_HOURS";
              break;
            case 10172:
              v14 = @"RAP_REMOVE_HOURS";
              break;
            case 10173:
              v14 = @"RAP_TAP_DAY_OF_WEEK";
              break;
            case 10174:
              v14 = @"RAP_TAP_24_HOURS_BUTTON";
              break;
            case 10175:
              v14 = @"RAP_TAP_OPEN_TIME";
              break;
            case 10176:
              v14 = @"RAP_TAP_CLOSED_TIME";
              break;
            case 10177:
              v14 = @"RAP_TAP_TEMPORARY_CLOSURE";
              break;
            case 10178:
              v14 = @"RAP_TAP_PERMANENTLY_CLOSED";
              break;
            case 10179:
              v14 = @"RAP_EDIT_WEBSITE";
              break;
            case 10180:
              v14 = @"RAP_EDIT_PHONE_NUMBER";
              break;
            case 10181:
              v14 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
              break;
            case 10182:
              v14 = @"RAP_ADD_COMMENTS";
              break;
            case 10183:
              v14 = @"RAP_EDIT_LOCATION";
              break;
            case 10184:
              v14 = @"RAP_VIEW_LOCATION";
              break;
            case 10185:
              v14 = @"RAP_ZOOM_IN";
              break;
            case 10186:
              v14 = @"RAP_ZOOM_OUT";
              break;
            case 10187:
              v14 = @"RAP_VIEW_ENTRY_POINTS";
              break;
            case 10188:
              v14 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
              break;
            case 10189:
              v14 = @"RAP_ADD_NEW_ENTRY_POINT";
              break;
            case 10190:
              v14 = @"RAP_REMOVE_ENTRY_POINT";
              break;
            case 10191:
              v14 = @"RAP_SELECT_ENTRY_POINT_TYPE";
              break;
            default:
              switch(v13)
              {
                case 11001:
                  v14 = @"EXIT_MAPS_LOWER_WRIST";
                  break;
                case 11002:
                  v14 = @"TASK_READY";
                  break;
                case 11003:
                  v14 = @"TAP_SEARCH";
                  break;
                case 11004:
                  v14 = @"TAP_MY_LOCATION";
                  break;
                case 11005:
                  v14 = @"SHOW_NEARBY";
                  break;
                case 11006:
                  v14 = @"TAP_NEARBY";
                  break;
                case 11007:
                  v14 = @"TAP_PROACTIVE";
                  break;
                case 11008:
                  v14 = @"FORCE_PRESS";
                  break;
                case 11009:
                  v14 = @"TAP_CONTACTS";
                  break;
                case 11010:
                  v14 = @"TAP_TRANSIT";
                  break;
                case 11011:
                  v14 = @"TAP_DICTATION";
                  break;
                case 11012:
                  v14 = @"GET_DIRECTIONS_DRIVING";
                  break;
                case 11013:
                  v14 = @"GET_DIRECTIONS_WALKING";
                  break;
                case 11014:
                  v14 = @"GET_DIRECTIONS_TRANSIT";
                  break;
                case 11015:
                  v14 = @"OPEN_STANDARD_MAP";
                  break;
                case 11016:
                  v14 = @"OPEN_TRANSIT_MAP";
                  break;
                case 11017:
                  v14 = @"START_NAV_AUTO";
                  break;
                case 11018:
                  v14 = @"TAP_RECENT";
                  break;
                case 11019:
                  v14 = @"TAP_FAVORITE";
                  break;
                case 11020:
                  v14 = @"TAP_SCRIBBLE";
                  break;
                case 11021:
                  v14 = @"TAP_VIEW_MAP";
                  break;
                case 11022:
                  v14 = @"TAP_VIEW_TBT";
                  break;
                case 11023:
                  v14 = @"VIEW_ROUTE_INFO";
                  break;
                case 11024:
                  v14 = @"NAV_UNMUTE";
                  break;
                case 11025:
                  v14 = @"NAV_MUTE";
                  break;
                case 11026:
                  v14 = @"GET_DIRECTIONS_CYCLING";
                  break;
                case 11027:
                  v14 = @"TAP_SEARCH_HOME";
                  break;
                case 11028:
                  v14 = @"ROUTE_PAUSED_ON_WATCH";
                  break;
                case 11029:
                  v14 = @"NEXT_STOP_TAPPED_ON_WATCH";
                  break;
                default:
                  switch(v13)
                  {
                    case 12001:
                      v14 = @"VIEW_MORE_OPTIONS";
                      break;
                    case 12002:
                      v14 = @"SELECT_TIME";
                      break;
                    case 12003:
                      v14 = @"SHOW_NEXT_AVAILABLE";
                      break;
                    case 12004:
                      v14 = @"DECREASE_TABLE_SIZE";
                      break;
                    case 12005:
                      v14 = @"INCREASE_TABLE_SIZE";
                      break;
                    case 12006:
                      v14 = @"EDIT_BOOKING";
                      break;
                    case 12007:
                      v14 = @"EDIT_PHONE";
                      break;
                    case 12008:
                      v14 = @"ADD_SPECIAL_REQUEST";
                      break;
                    case 12009:
                      v14 = @"CHANGE_RESERVATION";
                      break;
                    case 12010:
                      v14 = @"LEARN_MORE";
                      break;
                    default:
                      goto LABEL_569;
                  }
                  break;
              }
              break;
          }
        }
      }
      else
      {
        v14 = @"UI_ACTION_UNKNOWN";
        switch(v13)
        {
          case 0:
            break;
          case 1:
            v14 = @"PULL_UP";
            break;
          case 2:
            v14 = @"PULL_DOWN";
            break;
          case 3:
            v14 = @"TAP";
            break;
          case 4:
            v14 = @"CLOSE";
            break;
          case 5:
            v14 = @"SWIPE_PREV";
            break;
          case 6:
            v14 = @"SWIPE_NEXT";
            break;
          case 7:
            v14 = @"SCROLL_UP";
            break;
          case 8:
            v14 = @"SCROLL_DOWN";
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
            goto LABEL_569;
          case 10:
            v14 = @"SHOW_MORE";
            break;
          case 11:
            v14 = @"SHOW_LESS";
            break;
          case 12:
            v14 = @"SWIPE_LEFT";
            break;
          case 13:
            v14 = @"SWIPE_RIGHT";
            break;
          case 14:
            v14 = @"MINIMIZE";
            break;
          case 15:
            v14 = @"TAP_PREV";
            break;
          case 16:
            v14 = @"TAP_NEXT";
            break;
          case 17:
            v14 = @"SUBMIT";
            break;
          case 18:
            v14 = @"CANCEL";
            break;
          case 19:
            v14 = @"ENTER_MAPS";
            break;
          case 20:
            v14 = @"EXIT_MAPS";
            break;
          case 21:
            v14 = @"REVEAL";
            break;
          case 22:
            v14 = @"OPEN_NEW_TAB";
            break;
          case 25:
            v14 = @"BACK";
            break;
          case 26:
            v14 = @"ACTIVATE";
            break;
          case 27:
            v14 = @"DEACTIVATE";
            break;
          case 28:
            v14 = @"AGREE";
            break;
          case 29:
            v14 = @"DISAGREE";
            break;
          case 30:
            v14 = @"SKIP_ANSWER";
            break;
          case 31:
            v14 = @"EXPAND";
            break;
          case 32:
            v14 = @"COLLAPSE";
            break;
          case 33:
            v14 = @"ENTER";
            break;
          case 34:
            v14 = @"EXIT";
            break;
          case 35:
            v14 = @"SCROLL_UP_INDEX_BAR";
            break;
          case 36:
            v14 = @"SCROLL_DOWN_INDEX_BAR";
            break;
          case 37:
            v14 = @"TOGGLE_ON";
            break;
          case 38:
            v14 = @"TOGGLE_OFF";
            break;
          case 39:
            v14 = @"LONG_PRESS";
            break;
          case 40:
            v14 = @"CLICK";
            break;
          case 41:
            v14 = @"TAP_DONE";
            break;
          case 42:
            v14 = @"TAP_CLOSE";
            break;
          case 43:
            v14 = @"SCROLL_LEFT";
            break;
          case 44:
            v14 = @"SCROLL_RIGHT";
            break;
          case 45:
            v14 = @"DISPLAY";
            break;
          case 46:
            v14 = @"OPEN_IN_APP";
            break;
          case 47:
            v14 = @"CONCEAL";
            break;
          case 48:
            v14 = @"TAP_DELETE";
            break;
          case 49:
            v14 = @"TAP_FILTER";
            break;
          case 50:
            v14 = @"TAP_SECONDARY_BUTTON";
            break;
          case 51:
            v14 = @"TAP_WIDGET_FOOD";
            break;
          case 52:
            v14 = @"TAP_WIDGET_GAS";
            break;
          case 53:
            v14 = @"TAP_WIDGET_LOADING";
            break;
          case 54:
            v14 = @"TAP_WIDGET_SEARCH";
            break;
          case 55:
            v14 = @"TAP_WIDGET_STORES";
            break;
          case 56:
            v14 = @"DISPLAY_ALLOW_ONCE_PROMPT";
            break;
          case 57:
            v14 = @"SHARE_CURRENT_LOCATION";
            break;
          case 58:
            v14 = @"SHARE_PHOTO";
            break;
          case 59:
            v14 = @"TAP_KEEP_OFF";
            break;
          case 60:
            v14 = @"TAP_PHOTO_CATEGORY";
            break;
          case 61:
            v14 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
            break;
          case 62:
            v14 = @"TAP_TURN_ON";
            break;
          case 63:
            v14 = @"DISPLAY_CYCLING_ANNOTATION";
            break;
          case 64:
            v14 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
            break;
          case 65:
            v14 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
            break;
          case 66:
            v14 = @"DISPLAY_WALKING_DEFAULT_OPTION";
            break;
          case 67:
            v14 = @"TAP_CYCLING_ANNOTATION";
            break;
          case 68:
            v14 = @"TAP_DRIVING_DEFAULT_OPTION";
            break;
          case 69:
            v14 = @"TAP_TRANSIT_DEFAULT_OPTION";
            break;
          case 70:
            v14 = @"TAP_WALKING_DEFAULT_OPTION";
            break;
          case 71:
            v14 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
            break;
          case 72:
            v14 = @"TAP_RIDESHARE_DEFAULT_OPTION";
            break;
          case 73:
            v14 = @"TAP_PERSONAL_COLLECTION";
            break;
          case 74:
            v14 = @"RESUME_ROUTE";
            break;
          case 75:
            v14 = @"DISPLAY_OUT_OF_RANGE_ALERT";
            break;
          case 76:
            v14 = @"TAP_ALLOW_ONCE";
            break;
          case 77:
            v14 = @"TAP_DO_NOT_ALLOW";
            break;
          case 78:
            v14 = @"ADD_RECCOMENDED_FAVORITE";
            break;
          case 79:
            v14 = @"ADD_RECOMMENDED_HOME_FAVORITE";
            break;
          case 80:
            v14 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
            break;
          case 81:
            v14 = @"ADD_RECOMMENDED_WORK_FAVORITE";
            break;
          case 82:
            v14 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
            break;
          case 83:
            v14 = @"CREATE_SCHOOL_FAVORITE";
            break;
          case 84:
            v14 = @"TAP_SCHOOL_FAVORITE";
            break;
          case 85:
            v14 = @"SELECT_ROUTING_TYPE_CYCLING";
            break;
          case 86:
            v14 = @"REPORT_PHOTO";
            break;
          case 87:
            v14 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
            break;
          case 88:
            v14 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
            break;
          case 89:
            v14 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
            break;
          case 90:
            v14 = @"CREATE_RECOMMENDED_FAVORITE";
            break;
          case 91:
            v14 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
            break;
          case 92:
            v14 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
            break;
          case 93:
            v14 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
            break;
          case 94:
            v14 = @"TAP_SMALL_WIDGET_ITEM";
            break;
          case 95:
            v14 = @"TAP_MEDIUM_WIDGET_ITEM";
            break;
          case 96:
            v14 = @"TAP_LARGE_WIDGET_ITEM";
            break;
          case 97:
            v14 = @"DISPLAY_ARP_TIPKIT";
            break;
          case 98:
            v14 = @"NEXT";
            break;
          case 99:
            v14 = @"TAP_RATE_AND_ADD_PHOTOS";
            break;
          case 100:
            v14 = @"TAP_TO_ADD_POSITIVE_RATING";
            break;
          case 101:
            v14 = @"TAP_TO_ADD_NEGATIVE_RATING";
            break;
          case 102:
            v14 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
            break;
          case 103:
            v14 = @"INVOKE_SIRI_PROMPT";
            break;
          case 104:
            v14 = @"ETA_SHARED_SUCCESSFULLY";
            break;
          case 105:
            v14 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
            break;
          case 106:
            v14 = @"CLEAR_INCIDENT";
            break;
          case 107:
            v14 = @"CONFIRM_INCIDENT";
            break;
          case 108:
            v14 = @"DISMISS_INCIDENT";
            break;
          case 109:
            v14 = @"INCIDENT_ALERT_TIMEOUT";
            break;
          case 110:
            v14 = @"INCIDENT_ALERT_TRAY_SHOWN";
            break;
          case 111:
            v14 = @"INCIDENT_CARD_SHOWN";
            break;
          case 112:
            v14 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
            break;
          case 113:
            v14 = @"INCIDENT_REPORT_TRAY_SHOWN";
            break;
          case 114:
            v14 = @"NAV_TRAY_DISCOVERY_SHOWN";
            break;
          case 115:
            v14 = @"TAP_TO_REPORT_INCIDENT";
            break;
          case 116:
            v14 = @"TAP_SHORTCUT";
            break;
          case 117:
            v14 = @"BLOCK_CONTACT";
            break;
          case 118:
            v14 = @"TAP_TO_ADD_RATING";
            break;
          case 119:
            v14 = @"AR_WALKING_LOCALIZATION_FAILED";
            break;
          case 120:
            v14 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
            break;
          case 121:
            v14 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
            break;
          case 122:
            v14 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
            break;
          case 123:
            v14 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
            break;
          case 124:
            v14 = @"RAISE_TO_ENTER_AR_WALKING";
            break;
          case 125:
            v14 = @"TAP_DISMISS";
            break;
          case 126:
            v14 = @"TAP_ENTER_AR_WALKING";
            break;
          case 127:
            v14 = @"TAP_OK";
            break;
          case 128:
            v14 = @"TAP_TRY_AGAIN";
            break;
          case 129:
            v14 = @"TAP_TURN_ON_IN_SETTINGS";
            break;
          case 130:
            v14 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
            break;
          case 131:
            v14 = @"VLF_CORRECTION_USER_ABANDON";
            break;
          case 132:
            v14 = @"AREA_EVENTS_ALERT";
            break;
          case 133:
            v14 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
            break;
          case 134:
            v14 = @"ACCEPT_EVENT_REROUTE";
            break;
          case 135:
            v14 = @"DISPLAY_AREA_EVENTS_ADVISORY";
            break;
          case 136:
            v14 = @"DISMISS_EVENT_REROUTE";
            break;
          case 137:
            v14 = @"PUNCH_OUT_EVENTS_LINK";
            break;
          case 138:
            v14 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
            break;
          case 139:
            v14 = @"ADJUST_GUIDANCE_SETTINGS";
            break;
          case 140:
            v14 = @"HIDE_DETAILS";
            break;
          case 141:
            v14 = @"SELECT_VOICE_GUIDANCE_ON";
            break;
          case 142:
            v14 = @"SELECT_VOICE_GUIDANCE_OFF";
            break;
          case 143:
            v14 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
            break;
          case 144:
            v14 = @"TAP_TEXT_LABEL";
            break;
          case 145:
            v14 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
            break;
          case 146:
            v14 = @"TAP_EXIT";
            break;
          case 147:
            v14 = @"TAP_CITY_MENU";
            break;
          case 148:
            v14 = @"CHECK_AVOID_TOLLS";
            break;
          case 149:
            v14 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
            break;
          case 150:
            v14 = @"TAP_ICLOUD";
            break;
          case 151:
            v14 = @"CHECK_AVOID_HIGHWAYS";
            break;
          case 152:
            v14 = @"TAP_FAVORITES";
            break;
          case 153:
            v14 = @"SELECT_DISTANCE_IN_KM";
            break;
          case 154:
            v14 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
            break;
          case 155:
            v14 = @"OPEN_FULL_CARD_FILTER";
            break;
          case 156:
            v14 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
            break;
          case 157:
            v14 = @"OPEN_SINGLE_CARD_FILTER";
            break;
          case 158:
            v14 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
            break;
          case 159:
            v14 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
            break;
          case 160:
            v14 = @"SESSIONLESS_REVEAL";
            break;
          case 161:
            v14 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
            break;
          case 162:
            v14 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
            break;
          case 163:
            v14 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
            break;
          case 164:
            v14 = @"ENTER_RAP_REPORT_MENU";
            break;
          case 165:
            v14 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
            break;
          case 166:
            v14 = @"TAP_MY_VEHICLES";
            break;
          case 167:
            v14 = @"SUBMIT_SINGLE_CARD_FILTER";
            break;
          case 168:
            v14 = @"SUBMIT_FULL_CARD_FILTER";
            break;
          case 169:
            v14 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
            break;
          case 170:
            v14 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
            break;
          case 171:
            v14 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
            break;
          case 172:
            v14 = @"TAP_ACCOUNT";
            break;
          case 173:
            v14 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
            break;
          case 174:
            v14 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
            break;
          case 175:
            v14 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
            break;
          case 176:
            v14 = @"RESULT_REFINEMENT_TOGGLE_OFF";
            break;
          case 177:
            v14 = @"TAP_CITY_CURATED_COLLECTIONS";
            break;
          case 178:
            v14 = @"TAP_REPORTS";
            break;
          case 179:
            v14 = @"TAP_RATINGS";
            break;
          case 180:
            v14 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
            break;
          case 181:
            v14 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
            break;
          case 182:
            v14 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
            break;
          case 183:
            v14 = @"SELECT_DISTANCE_IN_MILES";
            break;
          case 184:
            v14 = @"TAP_PRIVACY_STATEMENT";
            break;
          case 185:
            v14 = @"TAP_MAPS_SETTINGS";
            break;
          case 186:
            v14 = @"CANCEL_FULL_CARD_FILTER";
            break;
          case 187:
            v14 = @"TAP_LATEST_CURATED_COLLECTION";
            break;
          case 188:
            v14 = @"TAP_TEMPORAL_CURATED_COLLECTION";
            break;
          case 189:
            v14 = @"UNCHECK_AVOID_TOLLS";
            break;
          case 190:
            v14 = @"UNSELECT_SEARCH_REFINEMENT";
            break;
          case 191:
            v14 = @"TAP_RATING";
            break;
          case 192:
            v14 = @"TAP_ICLOUD_SIGN_IN";
            break;
          case 193:
            v14 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
            break;
          case 194:
            v14 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
            break;
          case 195:
            v14 = @"UNCHECK_AVOID_HIGHWAYS";
            break;
          case 196:
            v14 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
            break;
          case 197:
            v14 = @"RESULT_REFINEMENT_TOGGLE_ON";
            break;
          case 198:
            v14 = @"TAP_CONTEXT_LINE_HYPERLINK";
            break;
          case 199:
            v14 = @"TAP_MY_GUIDES";
            break;
          case 200:
            v14 = @"SELECT_SEARCH_REFINEMENT";
            break;
          case 201:
            v14 = @"SESSIONLESS_TAP_ACCOUNT";
            break;
          case 202:
            v14 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
            break;
          case 203:
            v14 = @"TAP_TRAVEL_PREFERENCES";
            break;
          case 204:
            v14 = @"SHOW_CURATED_COLLECTION_LIST";
            break;
          case 205:
            v14 = @"CANCEL_SINGLE_CARD_FILTER";
            break;
          case 206:
            v14 = @"DISPLAY_HFP_OPTION";
            break;
          case 207:
            v14 = @"SWITCH_OFF_HFP";
            break;
          case 208:
            v14 = @"SWITCH_ON_HFP";
            break;
          case 209:
            v14 = @"TAP_QUICK_ACTION_TRAY";
            break;
          case 210:
            v14 = @"SHOW_ALL_CITIES";
            break;
          case 211:
            v14 = @"TAP_ADD_NEARBY_TRANSIT";
            break;
          case 212:
            v14 = @"RESUME";
            break;
          case 213:
            v14 = @"DISPLAY_TIPKIT_PROMPT";
            break;
          case 214:
            v14 = @"TAP_NEARBY_TRANSIT_FAVORITE";
            break;
          case 215:
            v14 = @"TAP_DRIVING_MODE";
            break;
          case 216:
            v14 = @"SWITCH_ON_VOICE_GUIDANCE";
            break;
          case 217:
            v14 = @"DISMISS_TIPKIT_PROMPT";
            break;
          case 218:
            v14 = @"TAP_EXPAND_EXIT_DETAILS";
            break;
          case 219:
            v14 = @"TAP_NEARBY_TRANSIT_FILTER";
            break;
          case 220:
            v14 = @"TAP_MORE_DEPARTURES";
            break;
          case 221:
            v14 = @"RAP_INDIVIDUAL_PLACE";
            break;
          case 222:
            v14 = @"RAP_ADD_MAP";
            break;
          case 223:
            v14 = @"TAP_SUGGESTED_RAP";
            break;
          case 224:
            v14 = @"RAP_STREET_ISSUE";
            break;
          case 225:
            v14 = @"SWIPE_PIN_REVEAL";
            break;
          case 226:
            v14 = @"TAP_ADD_TIPKIT_FAVORITE";
            break;
          case 227:
            v14 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
            break;
          case 228:
            v14 = @"RAP_BAD_TRIP";
            break;
          case 229:
            v14 = @"RAP_PLACE_ISSUE";
            break;
          case 230:
            v14 = @"TAP_OPEN_MAPS";
            break;
          case 231:
            v14 = @"TAP_NEARBY_TRANSIT_RESULT";
            break;
          case 232:
            v14 = @"RAP_GUIDE";
            break;
          case 233:
            v14 = @"SWITCH_OFF_VOICE_GUIDANCE";
            break;
          case 234:
            v14 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
            break;
          case 235:
            v14 = @"SELECT_TRANSIT_STEP";
            break;
          case 236:
            v14 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
            break;
          case 237:
            v14 = @"TAP_SEE_MORE";
            break;
          case 238:
            v14 = @"RAP_IN_REVIEW";
            break;
          case 239:
            v14 = @"TAP_OPEN_MENU";
            break;
          case 240:
            v14 = @"TAP_NEARBY_TRANSIT";
            break;
          case 241:
            v14 = @"TAP_PIN_LINE";
            break;
          case 242:
            v14 = @"SWITCH_OFF_TRIP_FEEDBACK";
            break;
          case 243:
            v14 = @"RAP_GOOD_TRIP";
            break;
          case 244:
            v14 = @"TAP_FILTERED_CURATED_COLLECTION";
            break;
          case 245:
            v14 = @"SHARE_MY_LOCATION";
            break;
          case 246:
            v14 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
            break;
          case 247:
            v14 = @"DISPLAY_GENERIC_ADVISORY";
            break;
          case 248:
            v14 = @"ADVISORY_ALERT";
            break;
          case 249:
            v14 = @"PUNCH_OUT_LINK";
            break;
          case 250:
            v14 = @"TAP_GENERIC_ADVISORY";
            break;
          case 251:
            v14 = @"TAP_EXPLORE_MODE";
            break;
          case 252:
            v14 = @"TAP_UNPIN_LINE";
            break;
          case 253:
            v14 = @"MENU_UNPIN";
            break;
          case 254:
            v14 = @"MENU_PIN";
            break;
          case 255:
            v14 = @"SWIPE_PIN";
            break;
          case 256:
            v14 = @"SWIPE_UNPIN";
            break;
          case 257:
            v14 = @"TAP_MEDIA_APP";
            break;
          case 258:
            v14 = @"TAP_GUIDES_SUBACTION";
            break;
          case 259:
            v14 = @"TAP_MEDIA";
            break;
          case 260:
            v14 = @"PUNCH_OUT_MEDIA";
            break;
          case 261:
            v14 = @"SHOW_MEDIA_APP_MENU";
            break;
          case 262:
            v14 = @"SCROLL_RIGHT_RIBBON";
            break;
          case 263:
            v14 = @"SCROLL_LEFT_RIBBON";
            break;
          case 264:
            v14 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
            break;
          case 265:
            v14 = @"TAP_SHOW_MORE_TEXT";
            break;
          case 266:
            v14 = @"SCROLL_LEFT_RATINGS";
            break;
          case 267:
            v14 = @"SCROLL_LEFT_TEMPLATE_PLACE";
            break;
          case 268:
            v14 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
            break;
          case 269:
            v14 = @"SCROLL_RIGHT_RATINGS";
            break;
          case 270:
            v14 = @"TAP_ALLOW";
            break;
          case 271:
            v14 = @"TAP_GO_TO_SETTING";
            break;
          case 272:
            v14 = @"START_SUBMIT_REPORT";
            break;
          case 273:
            v14 = @"AUTHENTICATION_INFO_FAILURE";
            break;
          case 274:
            v14 = @"SUCCESSFULLY_SUBMIT_REPORT";
            break;
          case 275:
            v14 = @"FAILED_SUBMIT_REPORT";
            break;
          case 276:
            v14 = @"AUTHENTICATION_INFO_SUCCESS";
            break;
          case 277:
            v14 = @"EDIT_WAYPOINT";
            break;
          case 278:
            v14 = @"CLEAR_TEXT";
            break;
          case 279:
            v14 = @"REORDER_WAYPOINT";
            break;
          case 280:
            v14 = @"REMOVE_WAYPOINT";
            break;
          case 281:
            v14 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
            break;
          case 282:
            v14 = @"TAP_SHOWCASE_MENU";
            break;
          case 283:
            v14 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
            break;
          case 284:
            v14 = @"TAP_PHOTO_ALBUM";
            break;
          case 285:
            v14 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
            break;
          case 286:
            v14 = @"RAP_INLINE_ADD";
            break;
          case 287:
            v14 = @"RAP_TAP_EDIT";
            break;
          case 288:
            v14 = @"CLAIM_BUSINESS";
            break;
          case 289:
            v14 = @"RAP_EDIT_OPTIONS";
            break;
          case 290:
            v14 = @"TAP_IN_REVIEW_RAP";
            break;
          case 291:
            v14 = @"ORB_MENU_ADD_STOP";
            break;
          case 292:
            v14 = @"NEXT_STOP";
            break;
          case 293:
            v14 = @"ARRIVE_AT_WAYPOINT";
            break;
          case 294:
            v14 = @"REMOVE_STOP";
            break;
          case 295:
            v14 = @"DISPLAY_PAUSE_BUTTON";
            break;
          case 296:
            v14 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
            break;
          case 297:
            v14 = @"AUTO_ADVANCE_NEXT_STOP";
            break;
          case 298:
            v14 = @"ADD_INLINE_NEGATIVE_RATING";
            break;
          case 299:
            v14 = @"ADD_INLINE_POSITIVE_RATING";
            break;
          case 300:
            v14 = @"TAP_TO_ADD_RATING_AND_PHOTO";
            break;
          case 301:
            v14 = @"SUBMIT_RATINGS_AND_PHOTOS";
            break;
          case 302:
            v14 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
            break;
          case 303:
            v14 = @"TAP_RECENTLY_VIEWED_ROUTE";
            break;
          case 304:
            v14 = @"SHOW_ALL_RECENTS";
            break;
          case 305:
            v14 = @"RESUME_MULTIPOINT_ROUTE";
            break;
          case 306:
            v14 = @"DISMISS_TRANSIT_TIPKIT";
            break;
          case 307:
            v14 = @"DISPLAY_TRANSIT_TIPKIT";
            break;
          case 308:
            v14 = @"TAP_TRANSIT_TIPKIT";
            break;
          case 309:
            v14 = @"FILTER_EV";
            break;
          case 310:
            v14 = @"FILTER_SURCHARGE";
            break;
          case 311:
            v14 = @"FILTER_PREFER";
            break;
          case 312:
            v14 = @"TAP_WALKING_ANNOTATION";
            break;
          case 313:
            v14 = @"FILTER_AVOID";
            break;
          case 314:
            v14 = @"FILTER_TRANSPORTATION_MODE";
            break;
          case 315:
            v14 = @"FILTER_RECOMMENDED_ROUTES";
            break;
          case 316:
            v14 = @"FILTER_IC_FARES";
            break;
          case 317:
            v14 = @"FILTER_TRANSIT_CARD_FARES";
            break;
          case 318:
            v14 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
            break;
          case 319:
            v14 = @"TAP_NOTIFICATION_SETTINGS";
            break;
          case 320:
            v14 = @"TAP_ENABLE_NOTIFICATION";
            break;
          case 321:
            v14 = @"ARP_SUGGESTIONS_TURN_OFF";
            break;
          case 322:
            v14 = @"ARP_SUGGESTIONS_TURN_ON";
            break;
          case 323:
            v14 = @"DISMISS_ARP_SUGGESTION";
            break;
          case 324:
            v14 = @"RATINGS_AND_PHOTOS_TURN_ON";
            break;
          case 325:
            v14 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
            break;
          case 326:
            v14 = @"UNSELECT_SUGGESTED_PHOTOS";
            break;
          case 327:
            v14 = @"SUGGESTED_PHOTOS_SHOWN";
            break;
          case 328:
            v14 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
            break;
          case 329:
            v14 = @"TAP_YOUR_PHOTOS_ALBUM";
            break;
          case 330:
            v14 = @"RATINGS_AND_PHOTOS_TURN_OFF";
            break;
          case 331:
            v14 = @"DELETE_PHOTO";
            break;
          case 332:
            v14 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
            break;
          case 333:
            v14 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
            break;
          case 334:
            v14 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
            break;
          case 335:
            v14 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
            break;
          case 336:
            v14 = @"SELECT_SUGGESTED_PHOTOS";
            break;
          case 337:
            v14 = @"ADD_STOP";
            break;
          case 338:
            v14 = @"SHOW_CREDIT_TURN_ON";
            break;
          case 339:
            v14 = @"DISPLAY_ARP_SUGGESTION";
            break;
          case 340:
            v14 = @"TAP_TO_ADD_PHOTO_CREDIT";
            break;
          case 341:
            v14 = @"SHOW_CREDIT_TURN_OFF";
            break;
          case 342:
            v14 = @"TAP_TO_EDIT_NICKNAME";
            break;
          case 343:
            v14 = @"SUBMIT_RATINGS";
            break;
          case 344:
            v14 = @"END_NAV_ON_WATCH";
            break;
          case 345:
            v14 = @"FILTER_EBIKE";
            break;
          case 356:
            v14 = @"ADD_STOP_SIRI";
            break;
          case 357:
            v14 = @"TAP_REVIEWED_RAP";
            break;
          case 358:
            v14 = @"TAP_OUTREACH_RAP";
            break;
          case 359:
            v14 = @"DISPLAY_SUGGESTED_ITEM";
            break;
          case 360:
            v14 = @"DISPLAY_HIKING_TIPKIT";
            break;
          case 361:
            v14 = @"DISMISS_HIKING_TIPKIT";
            break;
          case 362:
            v14 = @"TAP_HIKING_TIPKIT";
            break;
          case 363:
            v14 = @"SCROLL_LEFT_TRAILS";
            break;
          case 364:
            v14 = @"TAP_MORE_TRAILS";
            break;
          case 365:
            v14 = @"TAP_RELATED_TRAIL";
            break;
          case 366:
            v14 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
            break;
          case 367:
            v14 = @"SCROLL_RIGHT_TRAILS";
            break;
          case 368:
            v14 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
            break;
          case 369:
            v14 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
            break;
          case 370:
            v14 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
            break;
          case 371:
            v14 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
            break;
          case 372:
            v14 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
            break;
          case 373:
            v14 = @"EXPIRED_MAPS_REMOVED";
            break;
          case 374:
            v14 = @"UPDATE_ALL_DOWNLOAD_MAPS";
            break;
          case 375:
            v14 = @"TAP_EXPIRED_MAPS";
            break;
          case 376:
            v14 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
            break;
          case 377:
            v14 = @"MOVE_DOWNLOAD_MAPS";
            break;
          case 378:
            v14 = @"SAVE_RENAME_DOWNLOAD_MAPS";
            break;
          case 379:
            v14 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
            break;
          case 380:
            v14 = @"TAP_ENTER_OFFLINE_MAPS";
            break;
          case 381:
            v14 = @"TAP_DOWNLOAD_MAPS";
            break;
          case 382:
            v14 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
            break;
          case 383:
            v14 = @"DELETE_DOWNLOAD_MAPS";
            break;
          case 384:
            v14 = @"SLIDE_CLEAR_EXPIRED_MAPS";
            break;
          case 385:
            v14 = @"RENAME_DOWNLOAD_MAPS";
            break;
          case 386:
            v14 = @"RESIZE_DOWNLOAD_MAPS";
            break;
          case 387:
            v14 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
            break;
          case 388:
            v14 = @"RESTORE_EXPIRED_MAPS";
            break;
          case 389:
            v14 = @"CLEAR_EXPIRED_MAPS";
            break;
          case 390:
            v14 = @"TAP_USING_OFFLINE_BAR";
            break;
          case 391:
            v14 = @"UPDATE_DOWNLOAD_MAPS";
            break;
          case 392:
            v14 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
            break;
          case 393:
            v14 = @"DISPLAY_DOWNLOAD_MAPS";
            break;
          case 394:
            v14 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
            break;
          case 395:
            v14 = @"DISPLAY_EXPIRED_MAPS";
            break;
          case 396:
            v14 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
            break;
          case 397:
            v14 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
            break;
          case 398:
            v14 = @"SLIDE_RESTORE_EXPIRED_MAPS";
            break;
          case 399:
            v14 = @"ETA_SHARE_TRAY_TIMEOUT";
            break;
          case 400:
            v14 = @"START_ETA_SHARING";
            break;
          case 401:
            v14 = @"PERSON_LOCATION_UPDATE";
            break;
          case 402:
            v14 = @"STOP_ETA_SHARING";
            break;
          case 403:
            v14 = @"PUNCH_OUT_TO_FINDMY";
            break;
          case 404:
            v14 = @"TAP_PEOPLE_LOCATION";
            break;
          case 405:
            v14 = @"TAP_TO_REQUEST_LOCATION";
            break;
          case 406:
            v14 = @"ZOOM_OUT_CROWN";
            break;
          case 407:
            v14 = @"TAP_RESIZE_DOWNLOAD_MAPS";
            break;
          case 408:
            v14 = @"TAP_DELETE_DOWNLOAD_MAPS";
            break;
          case 409:
            v14 = @"SELECT_LIST_VIEW";
            break;
          case 410:
            v14 = @"SCROLL_RIGHT_TRAILHEADS";
            break;
          case 411:
            v14 = @"SWITCH_TO_ONLINE_MODE";
            break;
          case 412:
            v14 = @"TAP_RELATED_TRAILHEAD";
            break;
          case 413:
            v14 = @"SELECT_ELEVATION_VIEW";
            break;
          case 414:
            v14 = @"TOGGLE_PROXIMITY_RADIUS_ON";
            break;
          case 415:
            v14 = @"SEE_MORE_RECENTS";
            break;
          case 416:
            v14 = @"SEE_MORE_GUIDES";
            break;
          case 417:
            v14 = @"SELECT_CONTROLS";
            break;
          case 418:
            v14 = @"NO_SEARCH_RESULTS";
            break;
          case 419:
            v14 = @"TAP_VIEW_RESULTS_CAROUSEL";
            break;
          case 420:
            v14 = @"TAP_VIEW_RESULTS_LIST";
            break;
          case 421:
            v14 = @"SELECT_MAP_VIEW";
            break;
          case 422:
            v14 = @"SCROLL_LEFT_TRAILHEADS";
            break;
          case 423:
            v14 = @"SWITCH_TO_OFFLINE_MODE";
            break;
          case 424:
            v14 = @"ZOOM_IN_CROWN";
            break;
          case 425:
            v14 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
            break;
          case 426:
            v14 = @"TAP_MAP";
            break;
          case 427:
            v14 = @"SWIPE_DOWN";
            break;
          case 428:
            v14 = @"TAP_MORE_TRAILHEADS";
            break;
          case 429:
            v14 = @"TAP_ROUTE_OPTIONS";
            break;
          case 430:
            v14 = @"TAP_ROUTE_NAV_MAP";
            break;
          case 431:
            v14 = @"TAP_ROUTE_OVERVIEW_MAP";
            break;
          case 432:
            v14 = @"TAP_AUDIO";
            break;
          case 433:
            v14 = @"TAP_OPEN_PLACECARD";
            break;
          case 434:
            v14 = @"TAP_VIEW_STOPS";
            break;
          case 435:
            v14 = @"TAP_ROUTE_DETAILS";
            break;
          case 436:
            v14 = @"ADD_LPR_VEHICLE";
            break;
          case 437:
            v14 = @"TAP_ADD_VEHICLE";
            break;
          case 438:
            v14 = @"TAP_PLUG_TYPE";
            break;
          case 439:
            v14 = @"UNSELECT_SUGGESTED_NETWORK";
            break;
          case 440:
            v14 = @"TAP_SET_UP_LATER";
            break;
          case 441:
            v14 = @"ADD_EV_VEHICLE";
            break;
          case 442:
            v14 = @"UPDATE_COLOR";
            break;
          case 443:
            v14 = @"SELECT_OTHER_NETWORK";
            break;
          case 444:
            v14 = @"UNSELECT_NETWORK";
            break;
          case 445:
            v14 = @"TAP_BACK";
            break;
          case 446:
            v14 = @"TAP_CANCEL";
            break;
          case 447:
            v14 = @"UNSELECT_VEHICLE";
            break;
          case 448:
            v14 = @"UNSELECT_OTHER_NETWORK";
            break;
          case 449:
            v14 = @"DISPLAY_EV_TIPKIT";
            break;
          case 450:
            v14 = @"SELECT_NETWORK";
            break;
          case 451:
            v14 = @"TAP_EV_TIPKIT";
            break;
          case 452:
            v14 = @"TAP_CHOOSE_NETWORKS";
            break;
          case 453:
            v14 = @"TAP_ADD_NETWORK";
            break;
          case 454:
            v14 = @"FILTER_NETWORK";
            break;
          case 455:
            v14 = @"SELECT_SUGGESTED_NETWORK";
            break;
          case 456:
            v14 = @"TRANSIT_TO_WALKING";
            break;
          case 457:
            v14 = @"TRANSIT_TO_FINDMY";
            break;
          case 458:
            v14 = @"TAP_AC_KEYBOARD";
            break;
          case 459:
            v14 = @"REACH_PHOTO_STRIP_END";
            break;
          case 460:
            v14 = @"SEARCH_HERE_REVEAL";
            break;
          case 461:
            v14 = @"TAP_SEARCH_HERE";
            break;
          case 462:
            v14 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
            break;
          case 463:
            v14 = @"SAVE";
            break;
          case 464:
            v14 = @"TAP_MORE_CURATED_HIKES";
            break;
          case 465:
            v14 = @"CREATE_CUSTOM_ROUTE";
            break;
          case 466:
            v14 = @"TAP_TRY_NOW";
            break;
          case 467:
            v14 = @"TAP_CURATED_HIKE";
            break;
          case 468:
            v14 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
            break;
          case 469:
            v14 = @"ADD_TO_LIBRARY";
            break;
          case 470:
            v14 = @"START_HIKING";
            break;
          case 471:
            v14 = @"EDIT_NOTE";
            break;
          case 472:
            v14 = @"CREATE_NOTE";
            break;
          case 473:
            v14 = @"DELETE_PIN";
            break;
          case 474:
            v14 = @"ADD_ROUTE";
            break;
          case 475:
            v14 = @"ADD_PIN";
            break;
          case 476:
            v14 = @"REMOVE_FROM_COLLECTION";
            break;
          case 477:
            v14 = @"REMOVE_FROM_LIBRARY";
            break;
          case 478:
            v14 = @"TAP_ITEM";
            break;
          case 479:
            v14 = @"DELETE_ROUTE";
            break;
          case 480:
            v14 = @"TAP_ROUTE";
            break;
          case 481:
            v14 = @"TAP_DOWNLOAD_WATCH_MAPS";
            break;
          case 482:
            v14 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
            break;
          case 483:
            v14 = @"STOP_DOWNLOAD_ONTO_WATCH";
            break;
          case 484:
            v14 = @"TAP_DOWNLOAD_ONTO_WATCH";
            break;
          case 485:
            v14 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
            break;
          case 486:
            v14 = @"TAP_DOWNLOAD_NOW_WATCH";
            break;
          case 487:
            v14 = @"REVEAL_DETECTION_LIST";
            break;
          case 488:
            v14 = @"TAP_RECOMMENDATION";
            break;
          case 489:
            v14 = @"TAP_EXPAND";
            break;
          case 490:
            v14 = @"EXPAND_DETECTION_LIST";
            break;
          case 1001:
            v14 = @"PAN";
            break;
          case 1002:
            v14 = @"ZOOM_IN";
            break;
          case 1003:
            v14 = @"ZOOM_OUT";
            break;
          case 1004:
            v14 = @"ROTATE";
            break;
          case 1010:
            v14 = @"TAP_POI";
            break;
          case 1011:
            v14 = @"TAP_POI_TRANSIT";
            break;
          case 1017:
            v14 = @"TAP_POI_HIGHLIGHTED";
            break;
          case 1018:
            v14 = @"TAP_POI_CLUSTERED";
            break;
          case 1020:
            v14 = @"TAP_POI_DROPPED_PIN";
            break;
          case 1030:
            v14 = @"DROP_PIN";
            break;
          case 1031:
            v14 = @"TAP_INCIDENT";
            break;
          case 1032:
            v14 = @"TAP_TRANSIT_LINE";
            break;
          case 1033:
            v14 = @"TAP_POI_CALENDAR";
            break;
          case 1034:
            v14 = @"TAP_POI_CURRENT_LOCATION";
            break;
          case 1035:
            v14 = @"TAP_POI_TRANSIT_LINE";
            break;
          case 1036:
            v14 = @"TAP_POI_LANDMARK";
            break;
          case 1037:
            v14 = @"TAP_POI_FLYOVER";
            break;
          case 1038:
            v14 = @"TAP_TO_HIDE_TRAY";
            break;
          case 1039:
            v14 = @"TAP_TO_REVEAL_TRAY";
            break;
          case 1040:
            v14 = @"TAP_COMPASS";
            break;
          case 1041:
            v14 = @"PITCH_AWAY_FROM_GROUND";
            break;
          case 1042:
            v14 = @"PITCH_CLOSER_TO_GROUND";
            break;
          case 1043:
            v14 = @"ZOOM_IN_PINCH";
            break;
          case 1044:
            v14 = @"ZOOM_OUT_PINCH";
            break;
          case 1045:
            v14 = @"ZOOM_IN_DOUBLE_TAP";
            break;
          case 1046:
            v14 = @"ZOOM_OUT_TWO_FINGER_TAP";
            break;
          case 1047:
            v14 = @"ZOOM_IN_ONE_FINGER";
            break;
          case 1048:
            v14 = @"ZOOM_OUT_ONE_FINGER";
            break;
          case 1049:
            v14 = @"ZOOM_IN_BUTTON";
            break;
          case 1050:
            v14 = @"ZOOM_OUT_BUTTON";
            break;
          case 1051:
            v14 = @"TAP_TRAFFIC_CAMERA";
            break;
          case 1052:
            v14 = @"DISPLAY_INDOOR_MAP_BUTTON";
            break;
          case 1053:
            v14 = @"OPEN_INDOOR_MAP";
            break;
          case 1054:
            v14 = @"DISPLAY_VENUE_BROWSE_BUTTON";
            break;
          case 1055:
            v14 = @"TAP_VENUE_BROWSE_BUTTON";
            break;
          case 1056:
            v14 = @"ENTER_VENUE_EXPERIENCE";
            break;
          case 1057:
            v14 = @"EXIT_VENUE_EXPERIENCE";
            break;
          case 1058:
            v14 = @"ZOOM_IN_SCENE_PINCH";
            break;
          case 1059:
            v14 = @"ZOOM_OUT_SCENE_PINCH";
            break;
          case 1060:
            v14 = @"ZOOM_RESET";
            break;
          case 1061:
            v14 = @"TAP_SCENE_UNAVAILABLE_AREA";
            break;
          case 1062:
            v14 = @"TAP_TRANSIT_ACCESS_POINT";
            break;
          case 1063:
            v14 = @"TAP_SPEED_CAMERA";
            break;
          case 1064:
            v14 = @"TAP_RED_LIGHT_CAMERA";
            break;
          case 1065:
            v14 = @"TAP_GEO";
            break;
          default:
            switch(v13)
            {
              case 2001:
                v14 = @"TAP_SEARCH_FIELD";
                break;
              case 2002:
                v14 = @"CLEAR_SEARCH";
                break;
              case 2003:
                v14 = @"CANCEL_SEARCH";
                break;
              case 2004:
                v14 = @"TAP_BROWSE_TOP_CATEGORY";
                break;
              case 2005:
                v14 = @"TAP_BROWSE_SUB_CATEGORY";
                break;
              case 2006:
                v14 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
                break;
              case 2007:
                v14 = @"TAP_LIST_ITEM";
                break;
              case 2008:
                v14 = @"SHARE_LIST_ITEM";
                break;
              case 2009:
                v14 = @"DELETE_LIST_ITEM";
                break;
              case 2010:
                v14 = @"EDIT_LIST_ITEM";
                break;
              case 2011:
                v14 = @"REFRESH_SEARCH";
                break;
              case 2012:
                v14 = @"REVEAL_LIST_ITEM_ACTIONS";
                break;
              case 2013:
                v14 = @"HIDE_LIST_ITEM_ACTIONS";
                break;
              case 2014:
                v14 = @"TAP_SEARCH_BUTTON";
                break;
              case 2015:
                v14 = @"SHOW_SEARCH_RESULTS";
                break;
              case 2016:
                v14 = @"SHOW_REFRESH_SEARCH";
                break;
              case 2017:
                v14 = @"PASTE_TEXT";
                break;
              case 2018:
                v14 = @"TAP_LIST_SUB_ITEM";
                break;
              case 2019:
                v14 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
                break;
              case 2020:
                v14 = @"TAP_DID_YOU_MEAN_MESSAGE";
                break;
              case 2021:
                v14 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
                break;
              case 2022:
                v14 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
                break;
              case 2023:
                v14 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
                break;
              case 2024:
                v14 = @"RETAINED_QUERY";
                break;
              case 2025:
                v14 = @"TAP_RECENT_AC_SUGGESTION";
                break;
              case 2026:
                v14 = @"CLEAR_RECENT_AC_SUGGESTION";
                break;
              case 2027:
                v14 = @"DELETE_RECENT_AC_SUGGESTION";
                break;
              case 2028:
              case 2029:
                goto LABEL_569;
              case 2030:
                v14 = @"TAP_BROWSE_NEARBY_CATEGORY";
                break;
              case 2031:
                v14 = @"TAP_SUBACTION";
                break;
              case 2032:
                v14 = @"TAP_QUERY_BUILDING_ARROW";
                break;
              case 2033:
                v14 = @"CLICK_ON_EDIT_SEARCH";
                break;
              case 2034:
                v14 = @"REMOVE_CLIENT_AC_SUGGESTION";
                break;
              case 2035:
                v14 = @"SHARE_CLIENT_AC_SUGGESTION";
                break;
              case 2036:
                v14 = @"TAP_ON_MORE_RESULTS";
                break;
              case 2037:
                v14 = @"SHARE_ITEM";
                break;
              case 2038:
                v14 = @"HIDE_ITEM";
                break;
              case 2039:
                v14 = @"TAP_SUGGESTED_ITEM";
                break;
              case 2040:
                v14 = @"SHARE_SUGGESTED_ITEM";
                break;
              case 2041:
                v14 = @"HIDE_SUGGESTED_ITEM";
                break;
              case 2042:
                v14 = @"ADD_HOME_FAVORITE";
                break;
              case 2043:
                v14 = @"ADD_WORK_FAVORITE";
                break;
              case 2044:
                v14 = @"ADD_FAVORITE";
                break;
              case 2045:
                v14 = @"VIEW_FAVORITES_LIST";
                break;
              case 2046:
                v14 = @"TAP_HOME_FAVORITE";
                break;
              case 2047:
                v14 = @"TAP_WORK_FAVORITE";
                break;
              case 2048:
                v14 = @"TAP_CAR_FAVORITE";
                break;
              case 2049:
                v14 = @"TAP_FAVORITE_ITEM";
                break;
              case 2050:
                v14 = @"CREATE_HOME_FAVORITE";
                break;
              case 2051:
                v14 = @"CREATE_WORK_FAVORITE";
                break;
              case 2052:
                v14 = @"CREATE_FAVORITE";
                break;
              case 2053:
                v14 = @"SUBMIT_FAVORITE_EDIT";
                break;
              case 2054:
                v14 = @"ADD_RECOMMENDED_FAVORITE";
                break;
              case 2055:
                v14 = @"EDIT_FAVORITE";
                break;
              case 2056:
                v14 = @"REMOVE_FAVORITE";
                break;
              case 2057:
                v14 = @"SHARE_FAVORITE";
                break;
              case 2058:
                v14 = @"EDIT_FAVORITES";
                break;
              case 2059:
                v14 = @"ADD_FAVORITE_PLACE";
                break;
              case 2060:
                v14 = @"REMOVE_FAVORITE_PLACE";
                break;
              case 2061:
                v14 = @"CHANGE_HOME_ADDRESS";
                break;
              case 2062:
                v14 = @"CHANGE_WORK_ADDRESS";
                break;
              case 2063:
                v14 = @"REFINE_LOCATION";
                break;
              case 2064:
                v14 = @"TAP_RECENTLY_VIEWED_ITEM";
                break;
              case 2065:
                v14 = @"SHOW_COLLECTION_LIST";
                break;
              case 2066:
                v14 = @"SHOW_FAVORITES_COLLECTION";
                break;
              case 2067:
                v14 = @"SHOW_COLLECTION";
                break;
              case 2068:
                v14 = @"TAP_COLLECTION_ITEM";
                break;
              case 2069:
                v14 = @"SHARE_COLLECTION_ITEM";
                break;
              case 2070:
                v14 = @"REMOVE_COLLECTION_ITEM";
                break;
              case 2071:
                v14 = @"SAVE_SHARED_COLLECTION";
                break;
              case 2072:
                v14 = @"CREATE_NEW_COLLECTION";
                break;
              case 2073:
                v14 = @"SAVE_TO_COLLECTION";
                break;
              case 2074:
                v14 = @"EDIT_PHOTO";
                break;
              case 2075:
                v14 = @"SORT_BY_NAME";
                break;
              case 2076:
                v14 = @"SORT_BY_DISTANCE";
                break;
              case 2077:
                v14 = @"SORT_BY_RECENT";
                break;
              case 2078:
                v14 = @"AUTO_SHARE_ETA";
                break;
              case 2079:
                v14 = @"CANCEL_AUTO_SHARE_ETA";
                break;
              case 2080:
                v14 = @"MAP_SEARCH";
                break;
              case 2081:
                v14 = @"DELETE_COLLECTION";
                break;
              case 2082:
                v14 = @"SHARE_COLLECTION";
                break;
              case 2083:
                v14 = @"SHOW_TRANSIT_LINES_COLLECTION";
                break;
              case 2084:
                v14 = @"SHOW_MY_PLACES";
                break;
              case 2085:
                v14 = @"SHOW_ALL_PLACES";
                break;
              case 2086:
                v14 = @"TAP_RECENT_QUERY";
                break;
              case 2087:
                v14 = @"TAP_QUERY_SUGGESTION";
                break;
              case 2088:
                v14 = @"DELETE_CURATED_COLLECTION";
                break;
              case 2089:
                v14 = @"FOLLOW";
                break;
              case 2090:
                v14 = @"PUNCH_IN";
                break;
              case 2091:
                v14 = @"SAVE_CURATED_COLLECTION";
                break;
              case 2092:
                v14 = @"SCROLL_LEFT_COLLECTIONS";
                break;
              case 2093:
                v14 = @"SCROLL_RIGHT_COLLECTIONS";
                break;
              case 2094:
                v14 = @"SEE_ALL_CURATED_COLLECTION";
                break;
              case 2095:
                v14 = @"SEE_ALL_PUBLISHERS";
                break;
              case 2096:
                v14 = @"SHARE_CURATED_COLLECTION";
                break;
              case 2097:
                v14 = @"SHARE_PUBLISHER";
                break;
              case 2098:
                v14 = @"SHOW_MORE_COLLECTION";
                break;
              case 2099:
                v14 = @"TAP_CURATED_COLLECTION";
                break;
              case 2100:
                v14 = @"TAP_FEATURED_COLLECTIONS";
                break;
              case 2101:
                v14 = @"TAP_LOCATION";
                break;
              case 2102:
                v14 = @"TAP_PUBLISHER";
                break;
              case 2103:
                v14 = @"TAP_PUBLISHER_APP";
                break;
              case 2104:
                v14 = @"TAP_PUBLISHER_COLLECTIONS";
                break;
              case 2105:
                v14 = @"UNFOLLOW";
                break;
              case 2106:
                v14 = @"CHANGE_SCHOOL_ADDRESS";
                break;
              case 2107:
                v14 = @"ADD_VEHICLE";
                break;
              case 2108:
                v14 = @"DISPLAY_VIRTUAL_GARAGE";
                break;
              case 2109:
                v14 = @"ENTER_VIRTUAL_GARAGE";
                break;
              case 2110:
                v14 = @"PUNCH_OUT_MANUFACTURER_APP";
                break;
              case 2111:
                v14 = @"REMOVE_LICENSE_PLATE";
                break;
              case 2112:
                v14 = @"REMOVE_VEHICLE";
                break;
              case 2113:
                v14 = @"SELECT_VEHICLE";
                break;
              case 2114:
                v14 = @"SUBMIT_LICENSE_PLATE";
                break;
              case 2115:
                v14 = @"TAP_ADD_LICENSE_PLATE";
                break;
              case 2116:
                v14 = @"TAP_ADD_NEW_CAR";
                break;
              case 2117:
                v14 = @"TAP_BANNER";
                break;
              case 2118:
                v14 = @"TAP_CONNECT";
                break;
              case 2119:
                v14 = @"TAP_CONTINUE";
                break;
              case 2120:
                v14 = @"TAP_EDIT";
                break;
              case 2121:
                v14 = @"TAP_NAME";
                break;
              case 2122:
                v14 = @"TAP_NOT_NOW";
                break;
              case 2123:
                v14 = @"TAP_OTHER_VEHICLE";
                break;
              case 2124:
                v14 = @"TAP_REMOVE_LICENSE_PLATE";
                break;
              case 2125:
                v14 = @"TAP_UPDATE_PLATE_NUMBER";
                break;
              case 2126:
                v14 = @"TAP_VEHICLE";
                break;
              case 2127:
                v14 = @"TAP_VEHICLE_NAME";
                break;
              case 2128:
                v14 = @"UPDATE_NAME";
                break;
              case 2129:
                v14 = @"DONE_TAKING_PHOTO";
                break;
              case 2130:
                v14 = @"ENABLE_SHOW_PHOTO_NAME";
                break;
              case 2131:
                v14 = @"SUBMIT_PHOTO";
                break;
              case 2132:
                v14 = @"USE_PHOTO";
                break;
              case 2133:
                v14 = @"ADD_RECOMMENDATION_TO_MAPS";
                break;
              case 2134:
                v14 = @"CANCEL_PHOTO_SUBMISSION";
                break;
              case 2135:
                v14 = @"CLOSE_RECOMMENDATION_CARD";
                break;
              case 2136:
                v14 = @"EDIT_RATING";
                break;
              case 2137:
                v14 = @"PROMPTED_TO_ADD_PHOTO";
                break;
              case 2138:
                v14 = @"PROMPTED_TO_ADD_RATING";
                break;
              case 2139:
                v14 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
                break;
              case 2140:
                v14 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
                break;
              case 2141:
                v14 = @"RETAKE_PHOTO";
                break;
              case 2142:
                v14 = @"REVEAL_RECOMMENDATION_CARD";
                break;
              case 2143:
                v14 = @"SUBMIT_NEGATIVE_RATING";
                break;
              case 2144:
                v14 = @"SUBMIT_POSITIVE_RATING";
                break;
              case 2145:
                v14 = @"TAP_CHOOSING_PHOTO";
                break;
              case 2146:
                v14 = @"TAP_TAKE_NEW_PHOTO";
                break;
              case 2147:
                v14 = @"TAP_TO_ADD_PHOTO";
                break;
              case 2148:
                v14 = @"CANCEL_INCIDENT_REPORT";
                break;
              case 2149:
                v14 = @"INCIDENT_REPORT_SUBMITTED";
                break;
              case 2150:
                v14 = @"REPORTED_INCIDENT_NOT_RECEIVED";
                break;
              case 2151:
                v14 = @"REPORTED_INCIDENT_RECEIVED";
                break;
              case 2152:
                v14 = @"REPORT_INCIDENT";
                break;
              case 2153:
                v14 = @"SELECT_INCIDENT_TYPE";
                break;
              case 2154:
                v14 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
                break;
              case 2155:
                v14 = @"TAP_TO_START_REPORT_INCIDENT";
                break;
              case 2156:
                v14 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
                break;
              case 2157:
                v14 = @"ATTEMPT_VLF_CORRECTION";
                break;
              case 2158:
                v14 = @"DISMISS_VLF_PROMPT";
                break;
              case 2159:
                v14 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
                break;
              case 2160:
                v14 = @"VLF_CORRECTION_FAILED";
                break;
              case 2161:
                v14 = @"VLF_CORRECTION_SUCCESSFUL";
                break;
              case 2162:
                v14 = @"ENABLE_WIDGET_SUGGESTIONS";
                break;
              case 2163:
                v14 = @"DISPLAY_CZ_ADVISORY";
                break;
              case 2164:
                v14 = @"PUNCH_OUT_URL_PAY";
                break;
              case 2165:
                v14 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
                break;
              case 2166:
                v14 = @"DELETE_ITEM";
                break;
              case 2167:
                v14 = @"CANCEL_REMOVE";
                break;
              case 2168:
                v14 = @"DELETE_SUGGESTION";
                break;
              case 2169:
                v14 = @"ADD_SCHOOL_FAVORITE";
                break;
              case 2170:
                v14 = @"GO_TO_WEBSITE";
                break;
              case 2171:
                v14 = @"TRY_AGAIN";
                break;
              case 2172:
                v14 = @"CHECK_AUTO_RECORD_WORKOUT";
                break;
              case 2173:
                v14 = @"CHECK_EBIKE";
                break;
              case 2174:
                v14 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
                break;
              case 2175:
                v14 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
                break;
              case 2176:
                v14 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
                break;
              case 2177:
                v14 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
                break;
              case 2178:
                v14 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
                break;
              case 2179:
                v14 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
                break;
              case 2180:
                v14 = @"TAP_CYCLING_DEFAULT_OPTION";
                break;
              case 2181:
                v14 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
                break;
              case 2182:
                v14 = @"TAP_CYCLING_STAIRS_ADVISORY";
                break;
              case 2183:
                v14 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
                break;
              case 2184:
                v14 = @"UNCHECK_AUTO_RECORD_WORKOUT";
                break;
              case 2185:
                v14 = @"UNCHECK_EBIKE";
                break;
              case 2186:
                v14 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
                break;
              case 2187:
                v14 = @"DISPLAY_LPR_ADVISORY";
                break;
              case 2188:
                v14 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
                break;
              case 2189:
                v14 = @"CREATE_WIDGET";
                break;
              case 2190:
                v14 = @"REVEAL_WIDGET_TRAY";
                break;
              case 2191:
                v14 = @"LPR_ERROR_CODE";
                break;
              case 2192:
                v14 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
                break;
              case 2193:
                v14 = @"TAP_CLEAR_RECENTLY_VIEWED";
                break;
              case 2194:
                v14 = @"LPR_HARD_STOP";
                break;
              case 2195:
                v14 = @"TAP_PUBLISHER_SUBACTION";
                break;
              case 2196:
                v14 = @"CARPLAY_DISPLAY_ACTIVATED";
                break;
              case 2197:
                v14 = @"CARPLAY_DISPLAY_DEACTIVATED";
                break;
              case 2198:
                v14 = @"TAP_FEATURED_COLLECTION";
                break;
              case 2199:
                v14 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
                break;
              case 2200:
                v14 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
                break;
              default:
                switch(v13)
                {
                  case 3001:
                    v14 = @"START_NAV";
                    break;
                  case 3002:
                    v14 = @"END_NAV";
                    break;
                  case 3003:
                    v14 = @"OPEN_NAV_AUDIO_SETTINGS";
                    break;
                  case 3004:
                    v14 = @"VIEW_DETAILS";
                    break;
                  case 3005:
                    v14 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                    break;
                  case 3006:
                    v14 = @"OPEN_ROUTING_EDITOR";
                    break;
                  case 3007:
                    v14 = @"EDIT_ORIGIN";
                    break;
                  case 3008:
                    v14 = @"EDIT_DESTINATION";
                    break;
                  case 3009:
                    v14 = @"SWAP_ORIGIN_DESTINATION";
                    break;
                  case 3010:
                    v14 = @"OPEN_MORE_ROUTES";
                    break;
                  case 3011:
                    v14 = @"SELECT_ROUTING_TYPE_DRIVING";
                    break;
                  case 3012:
                    v14 = @"SELECT_ROUTING_TYPE_WALKING";
                    break;
                  case 3013:
                    v14 = @"SELECT_ROUTING_TYPE_TRANSIT";
                    break;
                  case 3014:
                    v14 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                    break;
                  case 3015:
                    v14 = @"SELECT_ROUTE";
                    break;
                  case 3016:
                    v14 = @"COLLAPSE_STEP_DETAILS_WALK";
                    break;
                  case 3017:
                    v14 = @"EXPAND_STEP_DETAILS_WALK";
                    break;
                  case 3018:
                    v14 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                    break;
                  case 3019:
                    v14 = @"EXPAND_STEP_DETAILS_TRANSIT";
                    break;
                  case 3020:
                    v14 = @"UNCHECK_BUS";
                    break;
                  case 3021:
                    v14 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                    break;
                  case 3022:
                    v14 = @"UNCHECK_COMMUTER_RAIL";
                    break;
                  case 3023:
                    v14 = @"UNCHECK_FERRY";
                    break;
                  case 3024:
                    v14 = @"CHECK_BUS";
                    break;
                  case 3025:
                    v14 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                    break;
                  case 3026:
                    v14 = @"CHECK_COMMUTER_RAIL";
                    break;
                  case 3027:
                    v14 = @"CHECK_FERRY";
                    break;
                  case 3028:
                    v14 = @"SELECT_LEAVE_AT";
                    break;
                  case 3029:
                    v14 = @"SELECT_ARRIVE_BY";
                    break;
                  case 3030:
                    v14 = @"SELECT_LEAVE_NOW";
                    break;
                  case 3031:
                    v14 = @"SELECT_DATE_TIME";
                    break;
                  case 3032:
                    v14 = @"SWITCH_ON_IC_FARES";
                    break;
                  case 3033:
                    v14 = @"SWITCH_OFF_IC_FARES";
                    break;
                  case 3034:
                    v14 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                    break;
                  case 3035:
                    v14 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                    break;
                  case 3036:
                    v14 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                    break;
                  case 3037:
                    v14 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                    break;
                  case 3038:
                    v14 = @"REVEAL_FROM_ROUTING";
                    break;
                  case 3039:
                    v14 = @"DISPLAY_ROUTES";
                    break;
                  case 3040:
                    v14 = @"CHECK_RECOMMENDED_ROUTES";
                    break;
                  case 3041:
                    v14 = @"UNCHECK_RECOMMENDED_ROUTES";
                    break;
                  case 3042:
                    v14 = @"CHECK_FASTER_TRIPS";
                    break;
                  case 3043:
                    v14 = @"UNCHECK_FASTER_TRIPS";
                    break;
                  case 3044:
                    v14 = @"CHECK_FEWER_TRANSFERS";
                    break;
                  case 3045:
                    v14 = @"UNCHECK_FEWER_TRANSFERS";
                    break;
                  case 3046:
                    v14 = @"CHECK_LESS_WALKING";
                    break;
                  case 3047:
                    v14 = @"UNCHECK_LESS_WALKING";
                    break;
                  case 3048:
                    v14 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                    break;
                  case 3049:
                    v14 = @"TAP_MORE_ROUTES";
                    break;
                  case 3050:
                    v14 = @"OPEN_NAV_OVERVIEW";
                    break;
                  case 3051:
                    v14 = @"RESUME_NAV_MANEUVER_VIEW";
                    break;
                  case 3052:
                    v14 = @"SELECT_AUDIO_VOLUME_SILENT";
                    break;
                  case 3053:
                    v14 = @"SELECT_AUDIO_VOLUME_LOW";
                    break;
                  case 3054:
                    v14 = @"SELECT_AUDIO_VOLUME_NORMAL";
                    break;
                  case 3055:
                    v14 = @"SELECT_AUDIO_VOLUME_LOUD";
                    break;
                  case 3056:
                    v14 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                    break;
                  case 3057:
                    v14 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                    break;
                  case 3058:
                    v14 = @"RESUME_PREV_NAV";
                    break;
                  case 3059:
                    v14 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                    break;
                  case 3060:
                    v14 = @"ACCEPT_REROUTE";
                    break;
                  case 3061:
                    v14 = @"DISMISS_REROUTE";
                    break;
                  case 3062:
                    v14 = @"ATTEMPT_END_NAV";
                    break;
                  case 3063:
                    v14 = @"DISPLAY_BANNER";
                    break;
                  case 3064:
                    v14 = @"VIEW_BANNER_DETAILS";
                    break;
                  case 3065:
                    v14 = @"ENTER_GUIDANCE";
                    break;
                  case 3066:
                    v14 = @"AUTO_ADVANCE_GUIDANCE";
                    break;
                  case 3067:
                    v14 = @"TAP_OPEN_WALLET";
                    break;
                  case 3068:
                    v14 = @"SELECT_VOICE_GUIDANCE_ALL";
                    break;
                  case 3069:
                    v14 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                    break;
                  case 3070:
                    v14 = @"SELECT_VOICE_GUIDANCE_NONE";
                    break;
                  case 3071:
                    v14 = @"DISPLAY_CARD";
                    break;
                  case 3072:
                    v14 = @"RENDER_ROUTE";
                    break;
                  case 3073:
                    v14 = @"DISPLAY_JUNCTION_VIEW";
                    break;
                  case 3074:
                    v14 = @"SELECT_DEPARTURE";
                    break;
                  case 3075:
                    v14 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                    break;
                  case 3076:
                    v14 = @"DEVICE_RAISE";
                    break;
                  case 3077:
                    v14 = @"ENTER_AR_NAV_VIEW";
                    break;
                  case 3078:
                    v14 = @"EXIT_AR_NAV_VIEW";
                    break;
                  case 3079:
                    v14 = @"AR_CALIBRATION_START";
                    break;
                  case 3080:
                    v14 = @"AR_CALIBRATION_FAILURE";
                    break;
                  case 3081:
                    v14 = @"AR_CALIBRATION_SUCCESS";
                    break;
                  case 3082:
                    v14 = @"DISPLAY_AR_NAV_ARROW";
                    break;
                  case 3083:
                    v14 = @"DISPLAY_AR_NAV_TURN_AROUND";
                    break;
                  case 3084:
                    v14 = @"DISPLAY_GO_OUTSIDE_BANNER";
                    break;
                  case 3085:
                    v14 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                    break;
                  case 3086:
                    v14 = @"DISPLAY_AR_NAV_ENDPOINT";
                    break;
                  case 3087:
                    v14 = @"DISPLAY_ADVISORY_BANNER";
                    break;
                  case 3088:
                    v14 = @"TAP_SHOW_ADVISORY_DETAILS";
                    break;
                  default:
                    goto LABEL_569;
                }
                break;
            }
            break;
        }
      }
      if (a2) {
        v15 = @"userActionEventAction";
      }
      else {
        v15 = @"user_action_event_action";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 moduleInfo];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"moduleInfo";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"module_info";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v20 = *(int *)(a1 + 60);
      if (v20 >= 0x10)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E53F8960[v20];
      }
      if (a2) {
        v22 = @"buttonType";
      }
      else {
        v22 = @"button_type";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 actionRichProviderId];
    if (v23)
    {
      if (a2) {
        v24 = @"actionRichProviderId";
      }
      else {
        v24 = @"action_rich_provider_id";
      }
      [v4 setObject:v23 forKey:v24];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)userActionEventActionAsString:(int)a3
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

- (GEOLogMsgEventUserAction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventUserAction;
  uint64_t v3 = [(GEOLogMsgEventUserAction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserActionEventKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserActionEventKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserActionEventKey
{
  return self->_userActionEventKey != 0;
}

- (NSString)userActionEventKey
{
  -[GEOLogMsgEventUserAction _readUserActionEventKey]((uint64_t)self);
  userActionEventKey = self->_userActionEventKey;

  return userActionEventKey;
}

- (void)setUserActionEventKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_userActionEventKey, a3);
}

- (void)_readUserActionEventValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserActionEventValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserActionEventValue
{
  return self->_userActionEventValue != 0;
}

- (NSString)userActionEventValue
{
  -[GEOLogMsgEventUserAction _readUserActionEventValue]((uint64_t)self);
  userActionEventValue = self->_userActionEventValue;

  return userActionEventValue;
}

- (int)userActionEventTarget
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_userActionEventTarget;
  }
  else {
    return 0;
  }
}

- (void)setHasUserActionEventTarget:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUserActionEventTarget
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)userActionEventTargetAsString:(int)a3
{
  if (a3 > 1000)
  {
    if (a3 > 1600)
    {
      switch(a3)
      {
        case 1700:
          v4 = @"LOOK_AROUND_PIP";
          break;
        case 1701:
          v4 = @"LOOK_AROUND_ACTION_SHEET";
          break;
        case 1702:
          v4 = @"LOOK_AROUND_VIEW";
          break;
        case 1703:
          v4 = @"LOOK_AROUND_PLATTER";
          break;
        case 1704:
          v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
          break;
        case 1705:
          v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
          break;
        case 1706:
          v4 = @"LOOK_AROUND_VIEW_PLACECARD";
          break;
        case 1707:
          v4 = @"LOOK_AROUND_PIP_PLACECARD";
          break;
        case 1708:
          v4 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
          break;
        default:
          if (a3 == 1601)
          {
            v4 = @"MENU_ITEM_DARK_MAP";
          }
          else
          {
LABEL_55:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
            v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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
          v4 = @"CARPLAY_NAV";
          break;
        case 1002:
          v4 = @"CARPLAY_EXPLORE";
          break;
        case 1003:
          v4 = @"CARPLAY_DESTINATIONS";
          break;
        case 1004:
          v4 = @"CARPLAY_TRAFFIC_INCIDENT";
          break;
        case 1005:
          v4 = @"CARPLAY_CONTROL";
          break;
        case 1006:
          v4 = @"CARPLAY_PROACTIVE";
          break;
        case 1007:
          v4 = @"CARPLAY_ROUTING";
          break;
        case 1008:
          v4 = @"CARPLAY_MORE_ROUTES";
          break;
        case 1009:
          v4 = @"CARPLAY_SEARCH_ALONG_ROUTE";
          break;
        case 1010:
          v4 = @"CARPLAY_SEARCH";
          break;
        case 1011:
          v4 = @"CARPLAY_SEARCH_RESULTS";
          break;
        case 1012:
          v4 = @"CARPLAY_FAVORITES";
          break;
        case 1013:
          v4 = @"CARPLAY_NAV_CONFIRMATION";
          break;
        case 1014:
          v4 = @"CARPLAY_DESTINATION_SHARING";
          break;
        case 1015:
          v4 = @"CARPLAY_NOTIFICATION_BATTERY";
          break;
        case 1016:
          v4 = @"CARPLAY_NOTIFICATION_DOOM";
          break;
        case 1017:
          v4 = @"CARPLAY_NOTIFICATION_FUEL";
          break;
        case 1018:
          v4 = @"CARPLAY_NOTIFICATION_HYBRID";
          break;
        case 1019:
          v4 = @"CARPLAY_SHARE_ETA_TRAY";
          break;
        case 1020:
          v4 = @"CARPLAY_ETA_UPDATE_TRAY";
          break;
        case 1021:
          v4 = @"CARPLAY_ACTION_TRAY";
          break;
        case 1022:
          v4 = @"CARPLAY_PLACECARD";
          break;
        case 1023:
          v4 = @"CARPLAY_KEYBOARD";
          break;
        case 1024:
          v4 = @"CARPLAY_UI_TARGET_UNKNOWN";
          break;
        case 1025:
          v4 = @"CARPLAY_EDIT_STOPS";
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
          v4 = @"RAP_DIRECTIONS_MENU";
          break;
        case 1101:
          v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
          break;
        case 1102:
          v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
          break;
        case 1103:
          v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
          break;
        case 1104:
          v4 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
          break;
        case 1105:
          v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
          break;
        case 1106:
          v4 = @"RAP_TRANSIT_MENU";
          break;
        case 1107:
          v4 = @"RAP_STATION_MAP";
          break;
        case 1108:
          v4 = @"RAP_STATION_MENU";
          break;
        case 1109:
          v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
          break;
        case 1110:
          v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
          break;
        case 1111:
          v4 = @"RAP_STATION_CLOSED_FORM";
          break;
        case 1112:
          v4 = @"RAP_LINE_MAP";
          break;
        case 1113:
          v4 = @"RAP_LINE_MENU";
          break;
        case 1114:
          v4 = @"RAP_LINE_NAME_FORM";
          break;
        case 1115:
          v4 = @"RAP_LINE_SHAPE_FORM";
          break;
        case 1116:
          v4 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
          break;
        case 1117:
          v4 = @"RAP_ADD_PLACE_MENU";
          break;
        case 1118:
          v4 = @"RAP_ADD_POI_MAP";
          break;
        case 1119:
          v4 = @"RAP_CATEGORY_LIST";
          break;
        case 1120:
          v4 = @"RAP_POI_DETAILS_FORM";
          break;
        case 1121:
          v4 = @"RAP_ADD_STREET_MAP";
          break;
        case 1122:
          v4 = @"RAP_STREET_DETAILS_FORM";
          break;
        case 1123:
          v4 = @"RAP_ADD_OTHER_MAP";
          break;
        case 1124:
          v4 = @"RAP_OTHER_DETAILS_FORM";
          break;
        case 1125:
          v4 = @"RAP_CAMERA";
          break;
        case 1126:
          v4 = @"RAP_LABEL_MAP";
          break;
        case 1127:
          v4 = @"RAP_LABEL_DETAILS_FORM";
          break;
        case 1128:
          v4 = @"RAP_SEARCH_MENU";
          break;
        case 1129:
          v4 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
          break;
        case 1130:
          v4 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
          break;
        case 1131:
          v4 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
          break;
        case 1132:
          v4 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
          break;
        case 1133:
          v4 = @"RAP_SATELLITE_IMAGE_MAP";
          break;
        case 1134:
          v4 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
          break;
        case 1135:
          v4 = @"RAP_OTHER_FORM";
          break;
        case 1136:
          v4 = @"RAP_PRIVACY";
          break;
        case 1137:
          v4 = @"RAP_CONFIRMATION";
          break;
        case 1138:
          v4 = @"RAP_POI_MENU";
          break;
        case 1139:
          v4 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
          break;
        case 1140:
          v4 = @"RAP_ADD_A_PLACE_MAP";
          break;
        case 1141:
          v4 = @"RAP_POI_LOCATION_MAP";
          break;
        case 1142:
          v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
          break;
        case 1143:
          v4 = @"RAP_POI_CLOSED_FORM";
          break;
        case 1144:
          v4 = @"RAP_CLAIM_BUSINESS_DIALOG";
          break;
        case 1145:
          v4 = @"RAP_BRAND_MENU";
          break;
        case 1146:
          v4 = @"RAP_BRAND_DETAILS_FORM";
          break;
        case 1147:
          v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
          break;
        case 1148:
          v4 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
          break;
        case 1149:
          v4 = @"RAP_LOOK_AROUND_BLURRING_FORM";
          break;
        case 1150:
          v4 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
          break;
        case 1151:
          v4 = @"RAP_LOOK_AROUND_MENU";
          break;
        case 1152:
          v4 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
          break;
        case 1153:
          v4 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
          break;
        case 1154:
          v4 = @"RAP_LIGHTWEIGHT";
          break;
        case 1155:
          v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 1156:
          v4 = @"RAP_ADD_CATEGORY";
          break;
        case 1157:
          v4 = @"RAP_ADD_HOURS";
          break;
        case 1158:
          v4 = @"RAP_EDIT_LOCATION";
          break;
        case 1159:
          v4 = @"RAP_EDIT_ENTRY_POINT";
          break;
        case 1160:
          v4 = @"RAP_LOOK_AROUND";
          break;
        case 1161:
          v4 = @"RAP_ADD_ENTRY_POINT";
          break;
        case 1201:
          v4 = @"WATCH_MAIN_MENU";
          break;
        case 1202:
          v4 = @"WATCH_MAIN_PRESS_MENU";
          break;
        case 1203:
          v4 = @"WATCH_SEARCH";
          break;
        case 1204:
          v4 = @"WATCH_DICTATION";
          break;
        case 1205:
          v4 = @"WATCH_FAVORITES";
          break;
        case 1206:
          v4 = @"WATCH_SUB_CATEGORY_LIST";
          break;
        case 1207:
          v4 = @"WATCH_SEARCH_RESULTS_LIST";
          break;
        case 1208:
          v4 = @"WATCH_MAP_VIEW";
          break;
        case 1209:
          v4 = @"WATCH_PLACECARD";
          break;
        case 1210:
          v4 = @"WATCH_ROUTE_PLANNING";
          break;
        case 1211:
          v4 = @"WATCH_ROUTE_DETAILS";
          break;
        case 1212:
          v4 = @"WATCH_NAV_TBT";
          break;
        case 1213:
          v4 = @"WATCH_NAV_MAP";
          break;
        case 1214:
          v4 = @"WATCH_NAV_PRESS_MENU";
          break;
        case 1215:
          v4 = @"WATCH_MAP_PRESS_MENU";
          break;
        case 1216:
          v4 = @"WATCH_ROUTING_PRESS_MENU";
          break;
        case 1217:
          v4 = @"WATCH_TRANSIT_MAP_VIEW";
          break;
        case 1218:
          v4 = @"WATCH_SCRIBBLE";
          break;
        case 1219:
          v4 = @"WATCH_COLLECTION_VIEW";
          break;
        case 1220:
          v4 = @"WATCH_ROUTE_PLANNING_WALKING";
          break;
        case 1221:
          v4 = @"WATCH_ROUTE_PLANNING_DRIVING";
          break;
        case 1222:
          v4 = @"WATCH_ROUTE_PLANNING_TRANSIT";
          break;
        case 1223:
          v4 = @"WATCH_PAIRED_DEVICE";
          break;
        case 1224:
          v4 = @"WATCH_NAV_DRIVING_SPLIT";
          break;
        case 1225:
          v4 = @"WATCH_NAV_DRIVING_PLATTER";
          break;
        case 1226:
          v4 = @"WATCH_NAV_DRIVING_MAP";
          break;
        case 1227:
          v4 = @"WATCH_NAV_WALKING_SPLIT";
          break;
        case 1228:
          v4 = @"WATCH_NAV_WALKING_PLATTER";
          break;
        case 1229:
          v4 = @"WATCH_NAV_WALKING_MAP";
          break;
        case 1230:
          v4 = @"WATCH_NAV_TRANSIT_SPLIT";
          break;
        case 1231:
          v4 = @"WATCH_NAV_TRANSIT_PLATTER";
          break;
        case 1232:
          v4 = @"WATCH_NAV_TRANSIT_MAP";
          break;
        case 1233:
          v4 = @"WATCH_ROUTE_INFO";
          break;
        case 1234:
          v4 = @"WATCH_NAV_CYCLING_MAP";
          break;
        case 1235:
          v4 = @"WATCH_NAV_CYCLING_PLATTER";
          break;
        case 1236:
          v4 = @"WATCH_NAV_CYCLING_SPLIT";
          break;
        case 1237:
          v4 = @"WATCH_ROUTE_PLANNING_CYCLING";
          break;
        case 1238:
          v4 = @"WATCH_SEARCH_INPUT";
          break;
        case 1239:
          v4 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 1240:
          v4 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 1301:
          v4 = @"PERSONALIZED_ADDRESS_LIST";
          break;
        case 1302:
          v4 = @"PERSONALIZED_ADDRESS_FORM";
          break;
        case 1303:
          v4 = @"PERSONALIZED_LABEL_FORM";
          break;
        case 1304:
          v4 = @"PERSONALIZED_EDIT_MAP";
          break;
        case 1305:
          v4 = @"PERSONALIZED_CONFIRMATION";
          break;
        case 1306:
          v4 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
          break;
        case 1307:
          v4 = @"PERSONALIZED_ADDRESS_INFO";
          break;
        case 1308:
          v4 = @"PERSONALIZED_ADDRESS_SEARCH";
          break;
        case 1309:
          v4 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
          break;
        case 1310:
          v4 = @"FAVORITE_SEARCH";
          break;
        case 1311:
          v4 = @"FAVORITE_LIST";
          break;
        case 1312:
          v4 = @"FAVORITE_INFO";
          break;
        case 1313:
          v4 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
          break;
        default:
          switch(a3)
          {
            case 1401:
              v4 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
              break;
            case 1402:
              v4 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
              break;
            case 1403:
              v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
              break;
            case 1404:
              v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
              break;
            case 1405:
              v4 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
              break;
            case 1406:
              v4 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
              break;
            case 1407:
              v4 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
              break;
            default:
              switch(a3)
              {
                case 1501:
                  v4 = @"PLACECARD_HEADER";
                  break;
                case 1502:
                  v4 = @"PLACECARD_ADDRESS";
                  break;
                case 1503:
                  v4 = @"PLACECARD_PHONE";
                  break;
                case 1504:
                  v4 = @"PLACECARD_URL";
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
    v4 = @"UI_TARGET_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_56;
      case 1:
        v4 = @"UI_TARGET_POI";
        break;
      case 2:
        v4 = @"UI_TARGET_SEARCH_RESULT_LIST";
        break;
      case 3:
        v4 = @"UI_TARGET_POPULAR_NEARBY_LIST";
        break;
      case 4:
        v4 = @"UI_TARGET_CALLOUT";
        break;
      case 5:
        v4 = @"UI_TARGET_SEARCH_PIN";
        break;
      case 6:
        v4 = @"UI_TARGET_DROPPED_PIN";
        break;
      case 7:
        v4 = @"UI_TARGET_TRANSIT_LINE";
        break;
      case 8:
        v4 = @"SEARCH_TRAY";
        break;
      case 9:
        v4 = @"SEARCH_TRAY_BROWSE";
        break;
      case 10:
        v4 = @"SEARCH_TRAY_POPULAR_NEARBY";
        break;
      case 11:
        v4 = @"SEARCH_TRAY_AC";
        break;
      case 12:
        v4 = @"SEARCH_TRAY_AC_INTERMEDIATE";
        break;
      case 13:
        v4 = @"SEARCH_TRAY_NO_QUERY";
        break;
      case 14:
        v4 = @"AR_WALKING_LEGAL_TRAY";
        break;
      case 15:
        v4 = @"RAISE_TO_START_AR_TRAY";
        break;
      case 16:
        v4 = @"EVENTS_ADVISORY_DETAILS_PAGE";
        break;
      case 17:
        v4 = @"INCIDENT_REPORT_TRAY_CARPLAY";
        break;
      case 18:
        v4 = @"HIGHLIGHTED_AREA";
        break;
      case 19:
        v4 = @"CURATED_COLLECTIONS_HOME";
        break;
      case 20:
        v4 = @"TRAVEL_PREFERENCES_TRAY";
        break;
      case 21:
        v4 = @"RESULT_TRAY_SEARCH";
        break;
      case 22:
        v4 = @"SINGLE_CARD_FILTER";
        break;
      case 23:
        v4 = @"FULL_CARD_FILTER";
        break;
      case 24:
        v4 = @"ACCOUNT_PRIVACY_TRAY";
        break;
      case 25:
        v4 = @"APPLE_RATINGS_HISTORY_TRAY";
        break;
      case 26:
        v4 = @"CURATED_COLLECTIONS_HOME_FILTERED";
        break;
      case 27:
        v4 = @"CITY_MENU";
        break;
      case 28:
        v4 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
        break;
      case 29:
        v4 = @"ACCOUNT_TRAY";
        break;
      case 30:
        v4 = @"QUICK_ACTION_TRAY";
        break;
      case 31:
        v4 = @"SUBMIT_TRIP_FEEDBACK";
        break;
      case 32:
        v4 = @"RAP_PLACE_ISSUE_DETAILS";
        break;
      case 33:
        v4 = @"RAP_GUIDES_DETAILS";
        break;
      case 34:
        v4 = @"RAP_BAD_DIRECTIONS_DETAILS";
        break;
      case 35:
        v4 = @"RAP_ADD_MAP_DETAILS";
        break;
      case 36:
        v4 = @"WATCH_COMPLICATION";
        break;
      case 37:
        v4 = @"RAP_NAV_MENU";
        break;
      case 38:
        v4 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
        break;
      case 39:
        v4 = @"RAP_REPORT_MENU";
        break;
      case 40:
        v4 = @"RAP_CURATED_COLLECTION_MENU";
        break;
      case 41:
        v4 = @"RAP_REPORT_CARD_DETAILS";
        break;
      case 42:
        v4 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
        break;
      case 43:
        v4 = @"RAP_STREET_ISSUE_DETAILS";
        break;
      case 44:
        v4 = @"NEARBY_TRANSIT_CARD";
        break;
      case 45:
        v4 = @"WATCH_NAV_MENU";
        break;
      case 46:
        v4 = @"GENERIC_ADVISORY_PAGE";
        break;
      case 47:
        v4 = @"USER_PROFILE_TRAY";
        break;
      case 48:
        v4 = @"MEDIA_APP_MENU";
        break;
      case 49:
        v4 = @"TEMPLATE_PLACE_TRAY";
        break;
      case 50:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
        break;
      case 51:
        v4 = @"ALLOW_NOTIFICATION_DIALOG";
        break;
      case 52:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
        break;
      case 53:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
        break;
      case 54:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
        break;
      case 55:
        v4 = @"NOTIFICATION_CONSENT_PROMPT";
        break;
      case 56:
        v4 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
        break;
      case 57:
        v4 = @"PLACECARD_TRAY_VENDORS_MENU";
        break;
      case 58:
        v4 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
        break;
      case 59:
        v4 = @"SEARCH_ALONG_ROUTE_TRAY";
        break;
      case 60:
        v4 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
        break;
      case 61:
        v4 = @"PLACECARD_SHOWCASE_MENU";
        break;
      case 62:
        v4 = @"RAP_INLINE_ADD_DETAILS";
        break;
      case 63:
        v4 = @"RAP_EDIT_MENU_DETAILS";
        break;
      case 64:
        v4 = @"RAP_SUBMISSION_PROMPT";
        break;
      case 65:
        v4 = @"RAP_PLACECARD_EDIT_MENU";
        break;
      case 66:
        v4 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
        break;
      case 67:
        v4 = @"INCIDENT_REPORT_MENU";
        break;
      case 68:
        v4 = @"RAP_SELECT_BAD_ROUTES_STEPS";
        break;
      case 69:
        v4 = @"RAP_SELECT_BAD_ROUTES";
        break;
      case 70:
        v4 = @"SIRI_SUGGESTION_RESUME_ROUTE";
        break;
      case 71:
        v4 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
        break;
      case 72:
        v4 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
        break;
      case 73:
        v4 = @"SPOTLIGHT_BUSINESS_ENTITY";
        break;
      case 74:
        v4 = @"NOTIFICATION_ARP";
        break;
      case 75:
        v4 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
        break;
      case 76:
        v4 = @"YOUR_PHOTOS_ALBUM";
        break;
      case 77:
        v4 = @"ARP_PHOTO_CREDIT";
        break;
      case 78:
        v4 = @"RAP_OUTREACH_REVIEWED_REPORT";
        break;
      case 79:
        v4 = @"RAP_REPORT_MENU_MORE";
        break;
      case 80:
        v4 = @"WATCH_MAPS_SETTINGS";
        break;
      case 81:
        v4 = @"OFFLINE_FEATURE_PROMPT";
        break;
      case 82:
        v4 = @"EXPIRED_MAPS_DETAILS";
        break;
      case 83:
        v4 = @"MAPS_VIEW";
        break;
      case 84:
        v4 = @"NOTIFICATION_OFFLINE";
        break;
      case 85:
        v4 = @"EXPIRED_MAPS_MANAGEMENT";
        break;
      case 86:
        v4 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
        break;
      case 87:
        v4 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
        break;
      case 88:
        v4 = @"OFFLINE_MAPS_MANAGEMENT";
        break;
      case 89:
        v4 = @"REGION_SELECTOR";
        break;
      case 90:
        v4 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
        break;
      case 91:
        v4 = @"FIND_MY_ETA_SHARING_TRAY";
        break;
      case 92:
        v4 = @"WATCH_PLACE";
        break;
      case 93:
        v4 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
        break;
      case 94:
        v4 = @"WATCH_ROUTE_PLANNING_MAP";
        break;
      case 95:
        v4 = @"WATCH_NAV_WALKING_CONTROLS";
        break;
      case 96:
        v4 = @"WATCH_NAV_CYCLING_CONTROLS";
        break;
      case 97:
        v4 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
        break;
      case 98:
        v4 = @"WATCH_NAV_TRANSIT_CONTROLS";
        break;
      case 99:
        v4 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
        break;
      case 100:
        v4 = @"WATCH_NAV_DRIVING_CONTROLS";
        break;
      case 101:
        v4 = @"RESULTS_TRAY_SEARCH";
        break;
      case 102:
        v4 = @"RESULTS_TRAY_BROWSE";
        break;
      case 103:
        v4 = @"RESULTS_TRAY_FAVORITES";
        break;
      case 104:
        v4 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
        break;
      case 105:
        v4 = @"RESULTS_TRAY_CLUSTER";
        break;
      case 106:
        v4 = @"RESULTS_TRAY_VENUE_BROWSE";
        break;
      case 107:
        v4 = @"WATCH_MAP_RESULTS";
        break;
      case 108:
        v4 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
        break;
      case 109:
        v4 = @"WATCH_PLACES";
        break;
      case 110:
        v4 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
        break;
      case 111:
        v4 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
        break;
      case 112:
        v4 = @"DOWNLOADED_MAPS_DETAILS";
        break;
      case 113:
        v4 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
        break;
      case 114:
        v4 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
        break;
      case 115:
        v4 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
        break;
      case 116:
        v4 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
        break;
      case 117:
        v4 = @"WATCH_ROUTE_OPTIONS";
        break;
      case 118:
        v4 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
        break;
      case 119:
        v4 = @"WATCH_MORE_GUIDES";
        break;
      case 120:
        v4 = @"WATCH_RECENTLY_VIEWED";
        break;
      case 121:
        v4 = @"EV_SUCCESS_TRAY";
        break;
      case 122:
        v4 = @"PREFERRED_NETWORK_SELECTION_TRAY";
        break;
      case 123:
        v4 = @"PREFERRED_NETWORK_TRAY";
        break;
      case 124:
        v4 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 125:
        v4 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
        break;
      case 126:
        v4 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
        break;
      case 127:
        v4 = @"AC_KEYBOARD_TRAY";
        break;
      case 128:
        v4 = @"MORE_RELATED_TRAILS";
        break;
      case 129:
        v4 = @"MORE_RELATED_TRAILHEADS";
        break;
      case 130:
        v4 = @"ROUTING_TRAY_CUSTOM_ROUTE";
        break;
      case 131:
        v4 = @"CUSTOM_ROUTE_CREATION_TRAY";
        break;
      case 132:
        v4 = @"ROUTING_TRAY_CURATED_HIKE";
        break;
      case 133:
        v4 = @"MORE_CURATED_HIKES";
        break;
      case 134:
        v4 = @"CUSTOM_ROUTE_ONBOARDING";
        break;
      case 135:
        v4 = @"LIBRARY_ROUTES";
        break;
      case 136:
        v4 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 137:
        v4 = @"MY_LIBRARY";
        break;
      case 138:
        v4 = @"EDIT_NOTE_TRAY";
        break;
      case 139:
        v4 = @"CREATE_NOTE_TRAY";
        break;
      case 140:
        v4 = @"LIBRARY_PLACES";
        break;
      case 141:
        v4 = @"WATCH_ACCOUNT";
        break;
      case 142:
        v4 = @"WATCH_DOWNLOADED_MAPS";
        break;
      case 143:
        v4 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
        break;
      case 144:
        v4 = @"VISUAL_INTELLIGENCE_DETECTION";
        break;
      case 145:
        v4 = @"VISUAL_INTELLIGENCE_SNIPPET";
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
        v4 = @"PLACECARD_TRAY";
        break;
      case 202:
        v4 = @"WEB_MODULE";
        break;
      case 250:
        v4 = @"ADD_FAVORITE_TRAY";
        break;
      case 251:
        v4 = @"COLLECTION_LIST";
        break;
      case 252:
        v4 = @"COLLECTION_VIEW";
        break;
      case 253:
        v4 = @"FAVORITE_DETAILS";
        break;
      case 254:
        v4 = @"FAVORITES_TRAY";
        break;
      case 255:
        v4 = @"SHARED_COLLECTION";
        break;
      case 256:
        v4 = @"SHARED_COLLECTION_VIEW";
        break;
      case 257:
        v4 = @"RECENTLY_VIEWED";
        break;
      case 258:
        v4 = @"SHARED_WEB_COLLECTION";
        break;
      case 259:
        v4 = @"CURATED_COLLECTION_VIEW";
        break;
      case 260:
        v4 = @"FEATURED_COLLECTIONS";
        break;
      case 261:
        v4 = @"PUBLISHER_TRAY";
        break;
      case 262:
        v4 = @"SHARED_CURATED_COLLECTION_VIEW";
        break;
      case 263:
        v4 = @"CURATED_COLLECTION_NOTIFICATION";
        break;
      case 264:
        v4 = @"CURATED_COLLECTION_LIST";
        break;
      case 265:
        v4 = @"PUBLISHER_LIST";
        break;
      case 266:
        v4 = @"WATCH_CURATED_COLLECTION_VIEW";
        break;
      case 267:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
        break;
      case 268:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
        break;
      case 301:
        v4 = @"ROUTING_TRAY_DRIVING";
        break;
      case 302:
        v4 = @"ROUTING_TRAY_WALKING";
        break;
      case 303:
        v4 = @"ROUTING_TRAY_TRANSIT";
        break;
      case 304:
        v4 = @"ROUTING_TRAY_RIDESHARE";
        break;
      case 305:
        v4 = @"ROUTING_TRAY_CYCLING";
        break;
      case 306:
        v4 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
        break;
      case 401:
        v4 = @"NAV_TRAY_DRIVING";
        break;
      case 402:
        v4 = @"NAV_TRAY_WALKING";
        break;
      case 403:
        v4 = @"NAV_TRAY_TRANSIT";
        break;
      case 404:
        v4 = @"NAV_TRAY_CYCLING";
        break;
      case 501:
        v4 = @"MAP_PLACECARD";
        break;
      case 502:
        v4 = @"MAP_SEARCH";
        break;
      case 503:
        v4 = @"MAP_RESULTS";
        break;
      case 504:
        v4 = @"MAP_ROUTING";
        break;
      case 505:
        v4 = @"MAP_NAV";
        break;
      case 506:
        v4 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
        break;
      case 507:
        v4 = @"MAP_TRAFFIC_INCIDENT";
        break;
      case 508:
        v4 = @"MAP_FULL_SCREEN";
        break;
      case 509:
        v4 = @"MAP_DRIVE";
        break;
      case 510:
        v4 = @"MAP_LAUNCH_AND_GO";
        break;
      case 511:
        v4 = @"MAP_VIEW";
        break;
      case 601:
        v4 = @"MAPS_SETTINGS";
        break;
      case 602:
        v4 = @"MAPS_PREFERENCES";
        break;
      case 603:
        v4 = @"RAP";
        break;
      case 604:
        v4 = @"ROUTING_DRIVING_DETAILS";
        break;
      case 605:
        v4 = @"ROUTING_WALKING_DETAILS";
        break;
      case 606:
        v4 = @"ROUTING_TRANSIT_DETAILS";
        break;
      case 607:
        v4 = @"ROUTING_EDITOR";
        break;
      case 608:
        v4 = @"NAV_DRIVING_DETAILS";
        break;
      case 609:
        v4 = @"NAV_WALKING_DETAILS";
        break;
      case 610:
        v4 = @"NAV_TRANSIT_DETAILS";
        break;
      case 611:
        v4 = @"NAV_AUDIO_SETTINGS";
        break;
      case 612:
        v4 = @"PHOTO_VIEWER_ALL";
        break;
      case 613:
        v4 = @"PHOTO_VIEWER_SINGLE";
        break;
      case 614:
        v4 = @"ROUTE_OPTIONS_TRANSIT";
        break;
      case 615:
        v4 = @"TRAFFIC_INCIDENT_TRAY";
        break;
      case 616:
        v4 = @"NAV_DIRECTIONS_BANNER_DRIVING";
        break;
      case 617:
        v4 = @"NAV_DIRECTIONS_BANNER_WALKING";
        break;
      case 618:
        v4 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
        break;
      case 619:
        v4 = @"REFINE_SEARCH_SUGGESTION_AREA";
        break;
      case 620:
        v4 = @"ADD_PHOTO_SHEET";
        break;
      case 621:
        v4 = @"ADD_PLACE_SHEET";
        break;
      case 622:
        v4 = @"SHARE_SHEET";
        break;
      case 623:
        v4 = @"EDIT_LOCATION_SHEET";
        break;
      case 624:
        v4 = @"ADD_CONTACT_SHEET";
        break;
      case 625:
        v4 = @"EDIT_NAME_SHEET";
        break;
      case 626:
        v4 = @"DRIVING_NAV_SETTINGS";
        break;
      case 627:
        v4 = @"TRANSIT_SETTINGS";
        break;
      case 628:
        v4 = @"TRANSIT_ADVISORY_SHEET";
        break;
      case 629:
        v4 = @"REMOVE_CAR_SHEET";
        break;
      case 630:
        v4 = @"ROUTE_OPTIONS_DRIVING";
        break;
      case 631:
        v4 = @"ROUTE_OPTIONS_DATETIME";
        break;
      case 632:
        v4 = @"TRANSIT_ADVISORY_BANNER";
        break;
      case 633:
        v4 = @"BOOK_TABLE_SELECT_TIME";
        break;
      case 634:
        v4 = @"BOOK_TABLE_MORE_OPTIONS";
        break;
      case 635:
        v4 = @"BOOK_TABLE_READY";
        break;
      case 636:
        v4 = @"BOOK_TABLE_BOOKED";
        break;
      case 637:
        v4 = @"TRANSIT_LINE_CLUSTER_SHEET";
        break;
      case 638:
        v4 = @"TRANSIT_LINE_LIST_SHEET";
        break;
      case 639:
        v4 = @"TRANSIT_BALANCE_BANNER";
        break;
      case 640:
        v4 = @"WEATHER_ICON";
        break;
      case 641:
        v4 = @"HELP_IMPROVE_MAPS_DIALOG";
        break;
      case 642:
        v4 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 643:
        v4 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 644:
        v4 = @"FLOOR_PICKER";
        break;
      case 645:
        v4 = @"VENUE_LIST";
        break;
      case 646:
        v4 = @"AR_MODE";
        break;
      case 647:
        v4 = @"ROUTING_TRANSIT_TICKETS_SHEET";
        break;
      case 648:
        v4 = @"LINKED_SERVICE_HOURS";
        break;
      case 649:
        v4 = @"SHARE_ETA_TRAY";
        break;
      case 650:
        v4 = @"ETA_UPDATE_TRAY";
        break;
      case 651:
        v4 = @"SCHEDULECARD_TRAY";
        break;
      case 652:
        v4 = @"AR_NAV";
        break;
      case 653:
        v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 654:
        v4 = @"LOCATIONS_INSIDE";
        break;
      case 655:
        v4 = @"SIMILAR_LOCATIONS";
        break;
      case 656:
        v4 = @"LOCATIONS_AT_ADDRESS";
        break;
      case 657:
        v4 = @"NAV_DIRECTIONS_BANNER_CYCLING";
        break;
      case 658:
        v4 = @"ROUTE_OPTIONS_CYCLING";
        break;
      case 659:
        v4 = @"EV_CONNECTION_TRAY";
        break;
      case 660:
        v4 = @"VIRTUAL_GARAGE";
        break;
      case 661:
        v4 = @"VIRTUAL_GARAGE_BANNER";
        break;
      case 662:
        v4 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
        break;
      case 663:
        v4 = @"ADVISORY_DETAILS_PAGE";
        break;
      case 664:
        v4 = @"APP_CLIP_NOTIFICATION";
        break;
      case 665:
        v4 = @"PHOTO_VIEWER_GALLERY";
        break;
      case 666:
        v4 = @"RECOMMENDATION_CARD";
        break;
      case 667:
        v4 = @"INCIDENT_REPORT_TRAY";
        break;
      case 668:
        v4 = @"MAPS_WIDGET_DISPLAY";
        break;
      case 669:
        v4 = @"VISUAL_LOCATION_FRAMEWORK";
        break;
      case 670:
        v4 = @"APP_CLIP_TRAY";
        break;
      case 671:
        v4 = @"LICENSE_PLATE_SUGGESTION_PAGE";
        break;
      case 672:
        v4 = @"NOTIFICATION_ADD_PLATE";
        break;
      case 673:
        v4 = @"MAPS_RESULTS";
        break;
      case 674:
        v4 = @"MAPS_WIDGET_APP_CONNECTION";
        break;
      case 675:
        v4 = @"MAPS_WIDGET_CURRENT_LOCATION";
        break;
      case 676:
        v4 = @"MAPS_WIDGET_CURRENT_NAV";
        break;
      case 677:
        v4 = @"MAPS_WIDGET_ETA";
        break;
      case 678:
        v4 = @"MAPS_WIDGET_TRANSIT";
        break;
      case 679:
        v4 = @"MAPS_WIDGET_UPC_DESTINATION";
        break;
      case 680:
        v4 = @"WIDGET_CREATION_TRAY";
        break;
      case 681:
        v4 = @"MAPS_WIDGET_HOME";
        break;
      case 682:
        v4 = @"MAPS_WIDGET_PARKED_CAR";
        break;
      case 683:
        v4 = @"MAPS_WIDGET_POI";
        break;
      case 684:
        v4 = @"MAPS_WIDGET_SCHOOL";
        break;
      case 685:
        v4 = @"MAPS_WIDGET_WORK";
        break;
      case 686:
        v4 = @"AIRPORT_NOTIFICATION";
        break;
      case 687:
        v4 = @"MAPS_WIDGET_EMPTY";
        break;
      case 688:
        v4 = @"COARSE_LOCATION_OPTIONS_PROMPT";
        break;
      case 689:
        v4 = @"ALLOW_PRECISE_LOCATION_PROMPT";
        break;
      case 690:
        v4 = @"SHARE_MY_LOCATION";
        break;
      case 691:
        v4 = @"MARK_MY_LOCATION";
        break;
      case 692:
        v4 = @"AIRPORT_NOTIFICATION_WATCH";
        break;
      case 693:
        v4 = @"EDIT_FAVORITE";
        break;
      case 694:
        v4 = @"ROUTING_CYCLING_DETAILS";
        break;
      case 695:
        v4 = @"NAV_CYCLING_DETAILS";
        break;
      case 696:
        v4 = @"MAPS_SUGGESTION_WIDGET";
        break;
      case 697:
        v4 = @"ARP_TIPKIT";
        break;
      case 698:
        v4 = @"ARP_PRIVACY";
        break;
      case 699:
        v4 = @"ROUTE_OPTIONS_WALKING";
        break;
      case 701:
        v4 = @"SAFARI_SEARCH";
        break;
      case 702:
        v4 = @"SPOTLIGHT_SEARCH";
        break;
      case 703:
        v4 = @"SAFARI_MAPS_SEARCH_RESULTS";
        break;
      case 704:
        v4 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
        break;
      case 705:
        v4 = @"WIDGET_MAPS_DESTINATIONS";
        break;
      case 706:
        v4 = @"WIDGET_MAPS_TRANSIT";
        break;
      case 707:
        v4 = @"WIDGET_MAPS_NEARBY";
        break;
      case 708:
        v4 = @"NOTIFICATION_FIND_MY_CAR";
        break;
      case 709:
        v4 = @"CONTROL_CENTER";
        break;
      case 710:
        v4 = @"NOTIFICATION_CENTER";
        break;
      case 711:
        v4 = @"NOTIFICATION_DOOM";
        break;
      case 712:
        v4 = @"NOTIFICATION_VENUES";
        break;
      case 713:
        v4 = @"NOTIFICATION_RAP_UPDATE";
        break;
      case 714:
        v4 = @"NOTIFICATION_TRIP_CANCELLED";
        break;
      case 715:
        v4 = @"NOTIFICATION_STOP_SKIPPED";
        break;
      case 716:
        v4 = @"NOTIFICATION_TRIP_DELAYED";
        break;
      case 717:
        v4 = @"NOTIFICATION_RAP";
        break;
      case 718:
        v4 = @"NOTIFICATION_PROXY_AUTH";
        break;
      case 719:
        v4 = @"NOTIFICATION_PUSH_TO_DEVICE";
        break;
      case 720:
        v4 = @"NOTIFICATION_LOW_FUEL";
        break;
      case 721:
        v4 = @"NOTIFICATION_FIND_MY_CAR_RESET";
        break;
      case 722:
        v4 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
        break;
      case 723:
        v4 = @"NOTIFICATION_SHARED_ETA";
        break;
      case 724:
        v4 = @"NOTIFICATION_SHARED_ETA_UPDATE";
        break;
      case 725:
        v4 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
        break;
      case 726:
        v4 = @"ANNOUNCEMENT_TYPE_GENERAL";
        break;
      case 727:
        v4 = @"ANNOUNCEMENT_TYPE_FLYOVER";
        break;
      case 728:
        v4 = @"ANNOUNCEMENT_TYPE_TRANSIT";
        break;
      case 729:
        v4 = @"ANNOUNCEMENT_TYPE_VENUES";
        break;
      case 730:
        v4 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
        break;
      case 731:
        v4 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
        break;
      case 732:
        v4 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
        break;
      case 733:
        v4 = @"APP_SHEET";
        break;
      case 734:
        v4 = @"CZ_ADVISORY_DETAILS_PAGE";
        break;
      case 735:
        v4 = @"SHARE_ETA_CONTACT_TRAY";
        break;
      case 736:
        v4 = @"SIRI_SHARE_ETA";
        break;
      case 737:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA";
        break;
      case 738:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
        break;
      case 739:
        v4 = @"INCIDENT_ALERT_TRAY";
        break;
      case 740:
        v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
        break;
      case 741:
        v4 = @"RAP_INCIDENT_REPORT_VIEW";
        break;
      case 742:
        v4 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
        break;
      case 743:
        v4 = @"TRAFFIC_ADVISORY_SHEET";
        break;
      case 801:
        v4 = @"SIRI_PLUGIN_SNIPPET";
        break;
      case 802:
        v4 = @"SIRI_PLUGIN_COMMAND";
        break;
      case 803:
        v4 = @"SIRI_SEARCH_RESULT_LIST";
        break;
      case 804:
        v4 = @"SIRI_DISAMBIGUATION_LIST";
        break;
      case 805:
        v4 = @"SIRI_PLACE_SNIPPET";
        break;
      default:
        if (a3 != 901) {
          goto LABEL_55;
        }
        v4 = @"CHROME";
        break;
    }
  }
  return v4;
}

- (int)StringAsUserActionEventTarget:(id)a3
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

- (void)setHasUserActionEventAction:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasUserActionEventAction
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readModuleInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModuleInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasModuleInfo
{
  return self->_moduleInfo != 0;
}

- (GEOLogMsgEventUserActionModuleInfo)moduleInfo
{
  -[GEOLogMsgEventUserAction _readModuleInfo]((uint64_t)self);
  moduleInfo = self->_moduleInfo;

  return moduleInfo;
}

- (void)setModuleInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_moduleInfo, a3);
}

- (int)buttonType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_buttonType;
  }
  else {
    return 0;
  }
}

- (void)setHasButtonType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasButtonType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)buttonTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8960[a3];
  }

  return v3;
}

- (int)StringAsButtonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUTTON_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_GUIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_REPORT_AN_ISSUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SHARE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_QUICK_LINK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_GROUP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DIRECTIONS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_FLYOVER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_DOWNLOAD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_PHOTOS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_TO_FAVORITES"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_SAVE_TO_LIBRARY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BUTTON_TYPE_ADD_A_NOTE"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readActionRichProviderId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventUserActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionRichProviderId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasActionRichProviderId
{
  return self->_actionRichProviderId != 0;
}

- (NSString)actionRichProviderId
{
  -[GEOLogMsgEventUserAction _readActionRichProviderId]((uint64_t)self);
  actionRichProviderId = self->_actionRichProviderId;

  return actionRichProviderId;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventUserAction;
  int v4 = [(GEOLogMsgEventUserAction *)&v8 description];
  v5 = [(GEOLogMsgEventUserAction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventUserAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventUserAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventUserAction)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventUserAction *)-[GEOLogMsgEventUserAction _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEventUserAction)initWithJSON:(id)a3
{
  return (GEOLogMsgEventUserAction *)-[GEOLogMsgEventUserAction _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventUserActionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventUserActionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgEventUserAction *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userActionEventKey) {
    objc_msgSend(v6, "setUserActionEventKey:");
  }
  if (self->_userActionEventValue) {
    objc_msgSend(v6, "setUserActionEventValue:");
  }
  char flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_userActionEventTarget;
    *((unsigned char *)v6 + 72) |= 4u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_userActionEventAction;
    *((unsigned char *)v6 + 72) |= 2u;
  }
  if (self->_moduleInfo)
  {
    objc_msgSend(v6, "setModuleInfo:");
    v5 = v6;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 15) = self->_buttonType;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  if (self->_actionRichProviderId)
  {
    objc_msgSend(v6, "setActionRichProviderId:");
    v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventUserActionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventUserAction *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_userActionEventKey copyWithZone:a3];
  int v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_userActionEventValue copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_userActionEventTarget;
    *(unsigned char *)(v5 + 72) |= 4u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_userActionEventAction;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  id v14 = [(GEOLogMsgEventUserActionModuleInfo *)self->_moduleInfo copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_buttonType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_actionRichProviderId copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOLogMsgEventUserAction *)self readAll:1];
  [v4 readAll:1];
  userActionEventKey = self->_userActionEventKey;
  if ((unint64_t)userActionEventKey | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](userActionEventKey, "isEqual:")) {
      goto LABEL_26;
    }
  }
  userActionEventValue = self->_userActionEventValue;
  if ((unint64_t)userActionEventValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](userActionEventValue, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_userActionEventTarget != *((_DWORD *)v4 + 17)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_userActionEventAction != *((_DWORD *)v4 + 16)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_26;
  }
  moduleInfo = self->_moduleInfo;
  if ((unint64_t)moduleInfo | *((void *)v4 + 3))
  {
    if (!-[GEOLogMsgEventUserActionModuleInfo isEqual:](moduleInfo, "isEqual:"))
    {
LABEL_26:
      char v11 = 0;
      goto LABEL_27;
    }
    char flags = (char)self->_flags;
    char v8 = *((unsigned char *)v4 + 72);
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_buttonType != *((_DWORD *)v4 + 15)) {
      goto LABEL_26;
    }
  }
  else if (v8)
  {
    goto LABEL_26;
  }
  actionRichProviderId = self->_actionRichProviderId;
  if ((unint64_t)actionRichProviderId | *((void *)v4 + 2)) {
    char v11 = -[NSString isEqual:](actionRichProviderId, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventUserAction *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_userActionEventKey hash];
  NSUInteger v4 = [(NSString *)self->_userActionEventValue hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_userActionEventTarget;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_userActionEventAction;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  unint64_t v7 = [(GEOLogMsgEventUserActionModuleInfo *)self->_moduleInfo hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_buttonType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_actionRichProviderId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = a3;
  [v8 readAll:0];
  NSUInteger v4 = v8;
  if (v8[4])
  {
    -[GEOLogMsgEventUserAction setUserActionEventKey:](self, "setUserActionEventKey:");
    NSUInteger v4 = v8;
  }
  if (v4[5])
  {
    -[GEOLogMsgEventUserAction setUserActionEventValue:](self, "setUserActionEventValue:");
    NSUInteger v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 4) != 0)
  {
    self->_userActionEventTarget = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_userActionEventAction = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
  }
  moduleInfo = self->_moduleInfo;
  uint64_t v7 = v4[3];
  if (moduleInfo)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[GEOLogMsgEventUserActionModuleInfo mergeFrom:](moduleInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[GEOLogMsgEventUserAction setModuleInfo:](self, "setModuleInfo:");
  }
  NSUInteger v4 = v8;
LABEL_15:
  if (v4[9])
  {
    self->_buttonType = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[2])
  {
    -[GEOLogMsgEventUserAction setActionRichProviderId:](self, "setActionRichProviderId:");
    NSUInteger v4 = v8;
  }
}

@end