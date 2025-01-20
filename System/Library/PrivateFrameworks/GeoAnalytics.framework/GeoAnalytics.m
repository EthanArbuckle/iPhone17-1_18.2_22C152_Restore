void sub_100002438(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void v3[5];
  id v4;

  v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005114;
  v3[3] = &unk_100028FF8;
  v3[4] = v1;
  v4 = *(id *)(a1 + 40);
  [v2 statementForKey:@"availB" statementBlock:v3];
}

uint64_t sub_100002524(uint64_t a1, sqlite3_stmt *a2)
{
  for (i = a2; sqlite3_step(i) == 100; i = a2)
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  return 1;
}

void sub_100002658(void *a1)
{
  v2 = _GEOCreateTransaction();
  uint64_t v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002920;
  v7[3] = &unk_1000291E8;
  v6 = (void *)a1[5];
  uint64_t v5 = a1[6];
  v7[4] = v3;
  uint64_t v9 = v5;
  id v8 = v6;
  [v4 executeInTransaction:v7];
}

BOOL sub_100002920(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _analyticsCount];
  uint64_t v3 = *(void *)(a1 + 48);
  if ((uint64_t)v2 < v3)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = v2;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = *(id *)(a1 + 40);
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v10 = sub_1000051F8();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "inserting elem %@", buf, 0xCu);
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [*(id *)(a1 + 32) _writeLogMsgQueueElem:v9];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [*(id *)(a1 + 32) _writeMonthlyCountElem:v9];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [*(id *)(a1 + 32) _writeDailyCountElem:v9];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [*(id *)(a1 + 32) _writeDailySettingsElem:v9];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [*(id *)(a1 + 32) _writeRRLogElem:v9];
                  }
                }
              }
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }

    uint64_t v3 = v12;
    id v2 = v13;
  }
  return (uint64_t)v2 < v3;
}

id sub_100002B74(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = [*(id *)(a1 + 40) uploadBatchId];
  id v19 = 0;
  unsigned int v6 = [v4 bindInt64Parameter:"@batchid" toValue:v5 inStatement:a2 error:&v19];
  id v7 = v19;
  if (v6)
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void *)(a1 + 48);
    id v18 = v7;
    unsigned int v10 = [v8 bindInt64Parameter:"@expiretime" toValue:v9 inStatement:a2 error:&v18];
    id v11 = v18;

    if (v10)
    {
      uint64_t v12 = *(void **)(a1 + 40);
      id v13 = *(void **)(*(void *)(a1 + 32) + 8);
      long long v14 = [v12 logMsg];
      id v17 = v11;
      id v15 = [v13 bindBlobParameter:"@analytic" toValue:v14 inStatement:a2 error:&v17];
      id v7 = v17;
    }
    else
    {
      id v15 = 0;
      id v7 = v11;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

id *sub_100002C94(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)GEOAPDaemonManagerBridge;
    id v5 = (id *)objc_msgSendSuper2(&v12, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      unsigned int v6 = sub_100003478();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        long long v14 = a1;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "hello connection %p", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000BACC;
      v10[3] = &unk_100028A18;
      objc_copyWeak(&v11, (id *)buf);
      [a1[1] setInterruptionHandler:v10];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000BB28;
      v8[3] = &unk_100028A18;
      objc_copyWeak(&v9, (id *)buf);
      [a1[1] setInvalidationHandler:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }

  return a1;
}

void sub_100002E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000030AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistence];
  uint64_t v3 = [v2 selectBatchIdsForBatchUpload];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(a1 + 40);
        if (v9 == objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "unsignedLongLongValue", (void)v12))
        {
          [*(id *)(a1 + 32) _submitBatchForUploadWithBatchId:*(void *)(a1 + 40)];
          unsigned int v10 = v4;
          goto LABEL_12;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v10 = sub_1000051A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "batch id %llu has nothing to upload now", buf, 0xCu);
  }
LABEL_12:
}

void sub_100003234(uint64_t a1)
{
  id v2 = sub_100004B10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "persisting one message with batchID %llu for expedited upload", buf, 0xCu);
  }

  id v4 = +[GEOAPPersistence sharedInstance];
  uint64_t v7 = *(void *)(a1 + 32);
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 storeLogMsgElems:v5];

  id v6 = sub_100005544();
  sub_10000524C((uint64_t)v6, *(void *)(a1 + 40));
}

id sub_100003478()
{
  if (qword_100033DE8 != -1) {
    dispatch_once(&qword_100033DE8, &stru_100028AD8);
  }
  v0 = (void *)qword_100033DE0;
  return v0;
}

id sub_100003928()
{
  if (qword_100033D80 != -1) {
    dispatch_once(&qword_100033D80, &stru_100028730);
  }
  v0 = (void *)qword_100033D78;
  return v0;
}

id sub_10000397C()
{
  self;
  if (qword_100033E68 != -1) {
    dispatch_once(&qword_100033E68, &stru_100029558);
  }
  v0 = (void *)qword_100033E70;
  return v0;
}

void sub_1000039D4(unsigned char *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    id v16 = a7;
    id v17 = a6;
    id v18 = sub_100004B10();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = @"UNKNOWN_EVENT";
      switch((int)a2)
      {
        case 0:
          break;
        case 1:
          id v19 = @"ACCIDENT_CONFIRMATION";
          break;
        case 2:
          id v19 = @"ACCIDENT_SUBMISSION";
          break;
        case 3:
          id v19 = @"ADD_LICENSE_PLATE";
          break;
        case 4:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
          break;
        case 5:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
          break;
        case 6:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
          break;
        case 7:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
          break;
        case 8:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
          break;
        case 9:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
          break;
        case 10:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
          break;
        case 11:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
          break;
        case 12:
          id v19 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
          break;
        case 13:
          id v19 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
          break;
        case 14:
          id v19 = @"ANNOUNCEMENT_TAPPED_GENERAL";
          break;
        case 15:
          id v19 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
          break;
        case 16:
          id v19 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
          break;
        case 17:
          id v19 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
          break;
        case 18:
          id v19 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
          break;
        case 19:
          id v19 = @"ANNOUNCEMENT_TAPPED_VENUES";
          break;
        case 20:
          id v19 = @"APP_CLIP_USED";
          break;
        case 21:
          id v19 = @"AR_MODE_ENTER";
          break;
        case 22:
          id v19 = @"AUTOCOMPLETE_RESULTS_SHOWN";
          break;
        case 23:
          id v19 = @"CARPLAY_CONNECTED";
          break;
        case 24:
          id v19 = @"COARSE_LOCATION_USED";
          break;
        case 25:
          id v19 = @"COLLECTION_CREATED";
          break;
        case 26:
          id v19 = @"COLLECTION_ITEM_TAPPED";
          break;
        case 27:
          id v19 = @"COLLECTION_SHARED";
          break;
        case 28:
          id v19 = @"COLLECTION_SHOWN";
          break;
        case 29:
          id v19 = @"CURATED_COLLECTION_ITEM_TAPPED";
          break;
        case 30:
          id v19 = @"CURATED_COLLECTION_REMOVED";
          break;
        case 31:
          id v19 = @"CURATED_COLLECTION_SAVED";
          break;
        case 32:
          id v19 = @"CURATED_COLLECTION_SHARED";
          break;
        case 33:
          id v19 = @"CURATED_COLLECTION_SHOWN";
          break;
        case 34:
          id v19 = @"DEVICE_CONNECTED";
          break;
        case 35:
          id v19 = @"DIRECTIONS";
          break;
        case 36:
          id v19 = @"DIRECTIONS_REQUESTED_CYCLING";
          break;
        case 37:
          id v19 = @"DIRECTIONS_REQUESTED_DRIVING";
          break;
        case 38:
          id v19 = @"DIRECTIONS_REQUESTED_EBIKE";
          break;
        case 39:
          id v19 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
          break;
        case 40:
          id v19 = @"DIRECTIONS_REQUESTED_TRANSIT";
          break;
        case 41:
          id v19 = @"DIRECTIONS_REQUESTED_WALKING";
          break;
        case 42:
          id v19 = @"DIRECTIONS_SAFARI";
          break;
        case 43:
          id v19 = @"DIRECTIONS_SIRI_PLACECARD";
          break;
        case 44:
          id v19 = @"DIRECTIONS_SPOTLIGHT";
          break;
        case 45:
          id v19 = @"ENTER_MAPS_CARPLAY";
          break;
        case 46:
          id v19 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 47:
          id v19 = @"ETA_RECEIVED";
          break;
        case 48:
          id v19 = @"ETA_SHARED";
          break;
        case 49:
          id v19 = @"FAVORITE_ADD_PLACE";
          break;
        case 50:
          id v19 = @"FAVORITE_TAP_LIST_ITEM";
          break;
        case 51:
          id v19 = @"FLYOVER_FOREGROUNDED";
          break;
        case 52:
          id v19 = @"INCIDENT_SUBMISSION";
          break;
        case 53:
          id v19 = @"LOOK_AROUND_FOREGROUNDED";
          break;
        case 54:
          id v19 = @"LOOK_AROUND_SHARED";
          break;
        case 55:
          id v19 = @"MAPSHOME_GET_DIRECTIONS";
          break;
        case 56:
          id v19 = @"MAPS_HANDOFF_FROM_IPAD";
          break;
        case 57:
          id v19 = @"MAPS_HANDOFF_FROM_MAC";
          break;
        case 58:
          id v19 = @"MAPS_HANDOFF_FROM_PHONE";
          break;
        case 59:
          id v19 = @"MAPS_HANDOFF_FROM_WATCH";
          break;
        case 60:
          id v19 = @"MAP_VIEW_FOREGROUNDED";
          break;
        case 61:
          id v19 = @"NAV_SESSION_COARSE_LOCATION";
          break;
        case 62:
          id v19 = @"NAV_SESSION_PRECISE_LOCATION";
          break;
        case 63:
          id v19 = @"NAV_STARTED_CARPLAY";
          break;
        case 64:
          id v19 = @"NAV_STARTED_CYCLING";
          break;
        case 65:
          id v19 = @"NAV_STARTED_DRIVING";
          break;
        case 66:
          id v19 = @"NAV_STARTED_EBIKE";
          break;
        case 67:
          id v19 = @"NAV_STARTED_EV_ROUTING";
          break;
        case 68:
          id v19 = @"NAV_STARTED_JUNCTION_VIEW";
          break;
        case 69:
          id v19 = @"NAV_STARTED_LANE_GUIDANCE";
          break;
        case 70:
          id v19 = @"NAV_STARTED_TRANSIT";
          break;
        case 71:
          id v19 = @"NAV_STARTED_WALKING";
          break;
        case 72:
          id v19 = @"OPEN_INDOOR_MAP";
          break;
        case 73:
          id v19 = @"OTHER_GET_DIRECTIONS";
          break;
        case 74:
          id v19 = @"PLACECARD_GET_DIRECTIONS";
          break;
        case 75:
          id v19 = @"PLACECARD_RICH_DATA_USED";
          break;
        case 76:
          id v19 = @"PLACECARD_SHARED";
          break;
        case 77:
          id v19 = @"PLACECARD_SHOWN";
          break;
        case 78:
          id v19 = @"PLACECARD_SHOWN_SAFARI";
          break;
        case 79:
          id v19 = @"PLACECARD_SHOWN_SIRI";
          break;
        case 80:
          id v19 = @"PLACECARD_SHOWN_SPOTLIGHT";
          break;
        case 81:
          id v19 = @"PLACECARD_START_NAV";
          break;
        case 82:
          id v19 = @"PROMINENT_GET_DIRECTIONS";
          break;
        case 83:
          id v19 = @"RAP_STARTED";
          break;
        case 84:
          id v19 = @"RIDESHARE_REQUESTED";
          break;
        case 85:
          id v19 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
          break;
        case 86:
          id v19 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
          break;
        case 87:
          id v19 = @"SEARCH_RECENT_SEARCHES_TAPPED";
          break;
        case 88:
          id v19 = @"SEARCH_RESULTS_SHOWN_MAPS";
          break;
        case 89:
          id v19 = @"SEARCH_RESULTS_SHOWN_SAFARI";
          break;
        case 90:
          id v19 = @"SEARCH_RESULTS_SHOWN_SIRI";
          break;
        case 91:
          id v19 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
          break;
        case 92:
          id v19 = @"SEARCH_RESULTS_TAPPED_SAFARI";
          break;
        case 93:
          id v19 = @"SEARCH_RESULTS_TAPPED_SIRI";
          break;
        case 94:
          id v19 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
          break;
        case 95:
          id v19 = @"SEARCH_RESULT_TAPPED_MAPS";
          break;
        case 96:
          id v19 = @"SEARCH_SUGGESTION_TAPPED";
          break;
        case 97:
          id v19 = @"SHARE_DRIVING_ROUTES";
          break;
        case 98:
          id v19 = @"SHARE_FAVORITES";
          break;
        case 99:
          id v19 = @"SHARE_MYLOCATION";
          break;
        case 100:
          id v19 = @"SHARE_TO_DEVICE";
          break;
        case 101:
          id v19 = @"SHARE_TRANSIT_ROUTES";
          break;
        case 102:
          id v19 = @"SHARE_WALKING_ROUTES";
          break;
        case 103:
          id v19 = @"SHOW_MAPS_SETTINGS";
          break;
        case 104:
          id v19 = @"SIRI_START_NAV";
          break;
        case 105:
          id v19 = @"SNAPSHOTTER_USED";
          break;
        case 106:
          id v19 = @"TAP_COMPASS_MODE";
          break;
        case 107:
          id v19 = @"UGC_PHOTO_SUBMISSION";
          break;
        case 108:
          id v19 = @"UGC_RATING_SUBMISSION";
          break;
        case 109:
          id v19 = @"VLF_CORRECTION_ATTEMPTED";
          break;
        case 110:
          id v19 = @"VLF_CORRECTION_FAILED";
          break;
        case 111:
          id v19 = @"VLF_CORRECTION_SUCCESS";
          break;
        case 112:
          id v19 = @"WIDGET_ENTER";
          break;
        case 113:
          id v19 = @"JUNCTION_VIEW_SHOWN";
          break;
        case 114:
          id v19 = @"ETA_SHARED_DRIVING";
          break;
        case 115:
          id v19 = @"ETA_SHARED_WALKING";
          break;
        case 116:
          id v19 = @"ETA_SHARED_CYCLING";
          break;
        case 117:
          id v19 = @"MAPS_HANDOFF";
          break;
        case 118:
          id v19 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
          break;
        case 119:
          id v19 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          id v19 = @"AR_WALKING_LOCALIZATION_SUCCESS";
          break;
        case 121:
          id v19 = @"CURATED_COLLECTIONS_HOME_SHOWN";
          break;
        case 122:
          id v19 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
          break;
        case 123:
          id v19 = @"NEARBY_TRANSIT_SHOWN";
          break;
        case 124:
          id v19 = @"NEARBY_TRANSIT_TAPPED";
          break;
        case 125:
          id v19 = @"SPR_GLOBE_EXPLORED";
          break;
        case 126:
          id v19 = @"SPR_METROS_EXPLORED";
          break;
        case 127:
          id v19 = @"TRANSIT_DETAILS_USED";
          break;
        case 128:
          id v19 = @"USER_ACCOUNT_OPENED_ACCOUNT";
          break;
        case 129:
          id v19 = @"USER_ACCOUNT_SHOWN";
          break;
        case 130:
          id v19 = @"MAP_MODE_DRIVING_SELECTED";
          break;
        case 131:
          id v19 = @"MAP_MODE_EXPLORE_SELECTED";
          break;
        case 132:
          id v19 = @"MAP_MODE_TRANSIT_SELECTED";
          break;
        case 133:
          id v19 = @"MAP_MODE_SATELLITE_SELECTED";
          break;
        case 134:
          id v19 = @"MAP_MODE_DRIVING_USED";
          break;
        case 135:
          id v19 = @"MAP_MODE_EXPLORE_USED";
          break;
        case 136:
          id v19 = @"MAP_MODE_TRANSIT_USED";
          break;
        case 137:
          id v19 = @"MAP_MODE_SATELLITE_USED";
          break;
        case 138:
          id v19 = @"WATCH_GET_DIRECTIONS_CYCLING";
          break;
        case 139:
          id v19 = @"WATCH_START_NAV_CYCLING";
          break;
        case 140:
          id v19 = @"WATCH_GET_DIRECTIONS_WALKING";
          break;
        case 141:
          id v19 = @"WATCH_START_NAV_WALKING";
          break;
        case 142:
          id v19 = @"WATCH_GET_DIRECTIONS_TRANSIT";
          break;
        case 143:
          id v19 = @"WATCH_START_NAV_TRANSIT";
          break;
        case 144:
          id v19 = @"WATCH_GET_DIRECTIONS_DRIVING";
          break;
        case 145:
          id v19 = @"WATCH_START_NAV_DRIVING";
          break;
        case 146:
          id v19 = @"ETA_SHARED_TRANSIT";
          break;
        case 147:
          id v19 = @"USER_ACCOUNT_OPENED";
          break;
        case 148:
          id v19 = @"VENUE_INTERACTION";
          break;
        case 149:
          id v19 = @"ENTER_MAPS";
          break;
        case 150:
          id v19 = @"EXIT_MAPS";
          break;
        case 151:
          id v19 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
          break;
        case 152:
          id v19 = @"ENTER_MAPS_DEVICE";
          break;
        case 153:
          id v19 = @"MAP_VIEW_INSTANTIATED";
          break;
        case 154:
          id v19 = @"MAP_VIEW_ACTIVATED";
          break;
        case 155:
          id v19 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
          break;
        case 156:
          id v19 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
          break;
        case 157:
          id v19 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
          break;
        case 158:
          id v19 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
          break;
        case 159:
          id v19 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
          break;
        case 160:
          id v19 = @"SIRI_SEARCH_CARPLAY_UI";
          break;
        case 161:
          id v19 = @"OPEN_KEYBOARD_CARPLAY_UI";
          break;
        case 162:
          id v19 = @"TAP_SEARCH_CARPLAY_UI";
          break;
        case 163:
          id v19 = @"OPEN_SEARCH_CARPLAY_UI";
          break;
        case 164:
          id v19 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
          break;
        case 165:
          id v19 = @"EXIT_MAPS_CARPLAY";
          break;
        case 166:
          id v19 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
          break;
        case 167:
          id v19 = @"NAV_FEEDBACK_DRIVING";
          break;
        case 168:
          id v19 = @"TRIP_COMPLETED_DRIVING";
          break;
        case 169:
          id v19 = @"HAS_REROUTE_DRIVING";
          break;
        case 170:
          id v19 = @"ETA_OVERESTIMATE_DRIVING";
          break;
        case 171:
          id v19 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
          break;
        case 172:
          id v19 = @"ETA_UNDERESTIMATE_DRIVING";
          break;
        case 173:
          id v19 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
          break;
        case 174:
          id v19 = @"RAP_GOOD_TRIP";
          break;
        case 175:
          id v19 = @"ENRICHED_RESULTS_SHOWN_MAPS";
          break;
        case 176:
          id v19 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 177:
          id v19 = @"ADD_STOP_CARPLAY";
          break;
        case 178:
          id v19 = @"ADD_STOP_CARPLAY_SIRI";
          break;
        case 179:
          id v19 = @"ADD_STOP_DEVICE";
          break;
        case 180:
          id v19 = @"ADD_STOP_DEVICE_SIRI";
          break;
        case 181:
          id v19 = @"SHOWCASE_SHOWN";
          break;
        case 182:
          id v19 = @"SHOWCASE_TAPPED";
          break;
        case 183:
          id v19 = @"PUNCH_IN_SIRI";
          break;
        case 184:
          id v19 = @"PUNCH_IN_SAFARI";
          break;
        case 185:
          id v19 = @"PUNCH_IN_SPOTLIGHT";
          break;
        case 186:
          id v19 = @"PUNCH_IN_SMS";
          break;
        case 187:
          id v19 = @"PUNCH_IN_FINDMY";
          break;
        case 188:
          id v19 = @"PUNCH_IN_OTHER_2ND_PARTY";
          break;
        case 189:
          id v19 = @"PUNCH_IN_3RD_PARTY";
          break;
        case 191:
          id v19 = @"RAP_SUBMITTED";
          break;
        case 192:
          id v19 = @"ARP_PHOTO_SUBMISSION";
          break;
        case 193:
          id v19 = @"ARP_RATING_SUBMISSION";
          break;
        case 194:
          id v19 = @"TRAFFIC_INCIDENT_REPORT";
          break;
        case 195:
          id v19 = @"TRAFFIC_INCIDENT_CONFIRM";
          break;
        case 196:
          id v19 = @"TRAFFIC_INCIDENT_DISMISS";
          break;
        case 197:
          id v19 = @"TRAFFIC_INCIDENT_CLEAR";
          break;
        case 198:
          id v19 = @"MODERN_MAP_EXPLORED";
          break;
        case 199:
          id v19 = @"CARPLAY_ROUTING_UI_USED";
          break;
        case 200:
          id v19 = @"CARPLAY_SEARCH_UI_USED";
          break;
        case 201:
          id v19 = @"ANNOUNCEMENT_DISPLAYED";
          break;
        case 202:
          id v19 = @"ANNOUNCEMENT_TAPPED";
          break;
        case 203:
          id v19 = @"POSITIVE_SEARCH_ENGAGEMENT";
          break;
        case 204:
          id v19 = @"PUNCH_OUT_FINDMY";
          break;
        case 205:
          id v19 = @"WATCH_START_NAV";
          break;
        case 206:
          id v19 = @"HIKING_ENGAGEMENT";
          break;
        case 207:
          id v19 = @"HIKING_PLACECARD";
          break;
        case 208:
          id v19 = @"NO_SEARCH_RESULTS";
          break;
        case 209:
          id v19 = @"PUNCH_IN_SHOWCASE";
          break;
        case 210:
          id v19 = @"SHARED_LOCATION_ENGAGEMENT";
          break;
        case 211:
          id v19 = @"SHARE_SHOWCASE";
          break;
        case 212:
          id v19 = @"WATCH_MAP_VIEW";
          break;
        case 213:
          id v19 = @"WATCH_PLACECARD";
          break;
        case 214:
          id v19 = @"WATCH_SEARCH";
          break;
        case 215:
          id v19 = @"CURATED_HIKE_SAVED";
          break;
        case 216:
          id v19 = @"CUSTOM_HIKE_SAVED";
          break;
        case 217:
          id v19 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
          break;
        case 218:
          id v19 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
          break;
        case 219:
          id v19 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
          break;
        case 220:
          id v19 = @"NAV_STARTED_CURATED_HIKE";
          break;
        case 221:
          id v19 = @"NAV_STARTED_CUSTOM_HIKE";
          break;
        case 222:
          id v19 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
          break;
        case 223:
          id v19 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
          break;
        case 224:
          id v19 = @"SEARCH_PHOTO_INTERACTION";
          break;
        case 225:
          id v19 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 226:
          id v19 = @"LIBRARY_INTERACTION";
          break;
        case 227:
          id v19 = @"SEARCH_FILTER_INTERACTION";
          break;
        case 228:
          id v19 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
          break;
        case 229:
          id v19 = @"CARPLAY_CONNECTED_OFFLINE";
          break;
        case 230:
          id v19 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
          break;
        case 231:
          id v19 = @"DIRECTIONS_OFFLINE";
          break;
        case 232:
          id v19 = @"ENTER_MAPS_DEVICE_OFFLINE";
          break;
        case 233:
          id v19 = @"NO_SEARCH_RESULTS_OFFLINE";
          break;
        case 234:
          id v19 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
          break;
        case 235:
          id v19 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
          break;
        case 236:
          id v19 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
          break;
        case 237:
          id v19 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
          break;
        default:
          id v19 = +[NSString stringWithFormat:@"(unknown: %i)", a2];
          break;
      }
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "storing Daily Usage action '%@'", buf, 0xCu);
    }
    v20 = +[GEOReferenceTimeManager sharedManager];
    v21 = [v20 bestReferenceDate];

    v22 = [[GEOAPDailyCountsQueueElem alloc] initWithType:a2 usageString:v13 usageBool:v14 appId:v15 createTime:v21];
    [a1 _storeQueueElem:v22 completionQueue:v17 completionBlock:v16];

    if (a1[57])
    {
      id v23 = v13;
      id v24 = v14;
      id v25 = v15;
      geo_isolate_sync();
    }
  }
}

void sub_100004750(unsigned char *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id v30 = v10;
    uint64_t v12 = GEOBatchUploadPolicyType();
    uint64_t v13 = GEOBatchAnalyticsSessionType();
    int v14 = v13;
    if v13 < 0x14 && ((0xBFFFFu >> v13))
    {
      id v15 = *(&off_100029608 + (int)v13);
    }
    else
    {
      id v15 = +[NSString stringWithFormat:@"(unknown: %i)", v13];
    }
    id v16 = +[GEOAPUploadPolicies sharedPolicies];
    id v17 = [v16 uploadPolicyForUploadPolicyType:v12];

    int v18 = GEOBatchOpaqueAppID();
    if ((v14 - 7) < 0xFFFFFFFE || v12 == geo_userActionAndMetadataUploadType)
    {
      uint64_t v19 = a3;
    }
    else
    {
      uint64_t v19 = GEOMakeGEOAPBatchIDForReqRespMetadata();
      v20 = sub_100004B10();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134283777;
        uint64_t v33 = a3;
        __int16 v34 = 2049;
        uint64_t v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "first class upgrade; batchId %{private}llu is now %{private}llu",
          buf,
          0x16u);
      }
    }
    v21 = sub_100004B10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412547;
      uint64_t v33 = (uint64_t)v15;
      __int16 v34 = 1025;
      LODWORD(v35) = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "storing analytic of type %@ (%{private}u)", buf, 0x12u);
    }

    double v22 = sub_100004D9C();
    id v23 = +[GEOReferenceTimeManager sharedManager];
    id v24 = [v23 bestReferenceDate];

    id v25 = [v24 dateByAddingTimeInterval:v22];
    v26 = [[GEOAPLogMsgQueueElem alloc] initWithLogMsg:v9 uploadBatchId:v19 expireTime:v25 createTime:v24];
    if ([v17 sendImmediately])
    {
      v27 = sub_100004B10();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "fast tracking analytic log message of type '%@'", buf, 0xCu);
      }

      id v28 = objc_retainBlock(v11);
      uint64_t v29 = v19;
      id v10 = v30;
      [a1 _fastTrackElement:v26 withBatchID:v29 completionQueue:v30 completionBlock:v28];
    }
    else
    {
      id v10 = v30;
      [a1 _storeQueueElem:v26 completionQueue:v30 completionBlock:v11];
    }
    if (a1[57])
    {
      id v31 = v9;
      geo_isolate_sync();
    }
  }
}

id sub_100004B10()
{
  if (qword_100033E80 != -1) {
    dispatch_once(&qword_100033E80, &stru_1000295E8);
  }
  v0 = (void *)qword_100033E78;
  return v0;
}

double sub_100004D9C()
{
  uint64_t v0 = GEOBatchUploadPolicyType();
  v1 = +[GEOAPUploadPolicies sharedPolicies];
  id v2 = [v1 uploadPolicyForUploadPolicyType:v0];

  [v2 ttl];
  double v4 = v3;

  return v4;
}

void sub_100005050(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count] == *(id *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = sub_100004B10();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "reached batch capacity; will spool now", v4, 2u);
    }

    id v3 = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
    [*(id *)(a1 + 32) _spoolElementsToDBFromQueue:v3];
  }
}

uint64_t sub_100005100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005114(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    double v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2]);
    [*(id *)(a1 + 40) addObject:v4];
  }
  return 1;
}

id sub_1000051A4()
{
  if (qword_100033E18 != -1) {
    dispatch_once(&qword_100033E18, &stru_100028CF8);
  }
  uint64_t v0 = (void *)qword_100033E10;
  return v0;
}

id sub_1000051F8()
{
  if (qword_100033E60 != -1) {
    dispatch_once(&qword_100033E60, &stru_100029538);
  }
  uint64_t v0 = (void *)qword_100033E58;
  return v0;
}

void sub_10000524C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = *(NSObject **)(a1 + 8);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000030AC;
    v3[3] = &unk_100028C10;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t sub_100005360(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 32))
    {
      return 1;
    }
    else
    {
      id v2 = sub_1000051F8();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "device has not been unlocked since last boot; can't proceed yet",
          v3,
          2u);
      }

      return *(unsigned char *)(v1 + 32) != 0;
    }
  }
  return result;
}

void sub_1000054A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005544()
{
  self;
  if (qword_100033DF8 != -1) {
    dispatch_once(&qword_100033DF8, &stru_100028B20);
  }
  uint64_t v0 = (void *)qword_100033DF0;
  return v0;
}

uint64_t sub_10000559C()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100033D58;
  uint64_t v5 = qword_100033D58;
  if (!qword_100033D58)
  {
    long long v6 = *(_OWORD *)off_100028678;
    long long v7 = *(_OWORD *)&off_100028688;
    v3[3] = _sl_dlopen();
    qword_100033D58 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1000056AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000056C4(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100033D58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005754()
{
  uint64_t v0 = sub_10000559C();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_1000057B0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100033D60;
  uint64_t v7 = qword_100033D60;
  if (!qword_100033D60)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005894;
    v3[3] = &unk_1000286C8;
    v3[4] = &v4;
    sub_100005894((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000587C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005894(uint64_t a1)
{
  sub_100005754();
  Class result = objc_getClass("BGSystemTaskScheduler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100033D60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10001A544();
    return (Class)sub_1000058EC();
  }
  return result;
}

id sub_1000058EC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100033D68;
  uint64_t v7 = qword_100033D68;
  if (!qword_100033D68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000059D0;
    v3[3] = &unk_1000286C8;
    v3[4] = &v4;
    sub_1000059D0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000059B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000059D0(uint64_t a1)
{
  sub_100005754();
  Class result = objc_getClass("BGNonRepeatingSystemTaskRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100033D68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10001A56C();
    return (Class)sub_100005A28(v3);
  }
  return result;
}

id sub_100005A28()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100033D70;
  uint64_t v7 = qword_100033D70;
  if (!qword_100033D70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005B0C;
    v3[3] = &unk_1000286C8;
    v3[4] = &v4;
    sub_100005B0C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005B0C(uint64_t a1)
{
  sub_100005754();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BGRepeatingSystemTaskRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100033D70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (GEOAPServiceLocal *)sub_10001A594();
    [(GEOAPServiceLocal *)v2 reportDailySettings:v4 completion:v5];
  }
}

uint64_t sub_100005C4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005FD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006048(id a1)
{
  qword_100033D78 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "LocalService");
  _objc_release_x1();
}

void *sub_10000608C(void *result)
{
  if (result)
  {
    id v1 = result;
    unsigned int v2 = [result dataRequestKindType];
    return (void *)(v2 | ((void)[v1 dataRequestKindSubtype] << 32));
  }
  return result;
}

id sub_1000060CC(id a1)
{
  id v1 = a1;
  if (a1)
  {
    if ([a1 hasErrorCode] && objc_msgSend(v1, "hasErrorDomain"))
    {
      id v2 = objc_alloc((Class)NSError);
      SEL v3 = [v1 errorDomain];
      id v1 = objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, objc_msgSend(v1, "errorCode"), 0);
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

id sub_100006170(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if ([a1 hasUsedBackgroundUrl]) {
      id v3 = [v2 usedBackgroundUrl];
    }
    else {
      id v3 = 0;
    }
    a1 = +[NSNumber numberWithInt:v3];
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_1000061D4(void *a1)
{
  if (a1)
  {
    [a1 eventTimestamp];
    a1 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_10000621C(id result)
{
  if (result)
  {
    uint64_t v1 = [result clientMetrics];
    id v2 = [v1 networkMetrics];
    id v3 = [v2 transactionMetrics];
    id v4 = [v3 lastObject];
    id v5 = [v4 usedCellular];

    return v5;
  }
  return result;
}

void sub_1000062F0(id a1)
{
  qword_100033D88 = objc_alloc_init(GEOAPNetEventAggregator);
  _objc_release_x1();
}

int64_t sub_100006648(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

id sub_100006F34()
{
  if (qword_100033DA0 != -1) {
    dispatch_once(&qword_100033DA0, &stru_100028828);
  }
  uint64_t v0 = (void *)qword_100033D98;
  return v0;
}

void sub_100006F88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)GEONetworkEventData) initWithData:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v98 = a1;
    id v102 = v3;
    unsigned int v6 = [v4 dataRequestKindType];
    id v114 = [v5 dataRequestKindSubtype];
    sub_1000060CC(v5);
    uint64_t v7 = v118 = v5;
    uint64_t v8 = sub_100006170(v118);
    id v9 = [v118 networkService];
    id v10 = [v118 requestingAppIdentifier];
    id v11 = [v118 requestingAppMajorVer];
    uint64_t v12 = [v118 requestingAppMinorVer];
    uint64_t v13 = [v118 clientMetrics];
    int v14 = [v118 additionalStates];
    v117 = v7;
    uint64_t v91 = v7;
    id v5 = v118;
    v101 = (void *)v8;
    +[GEOAPPortal captureNetworkEventForDataRequestKind:v6 | ((void)v114 << 32) networkService:v9 usedBackgroundURL:v8 requestAppIdentifier:v10 appMajorVersion:v11 appMinorVersion:v12 error:v91 clientMetrics:v13 states:v14];

    unsigned int v103 = sub_10000621C(v118);
    uint64_t v15 = sub_1000061D4(v118);
    id v16 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v116 = [v16 components:28 fromDate:v15];
    v99 = v16;
    v100 = (void *)v15;
    if (v6 == 768 || v6 == 1792 || v6 == 1280)
    {
      v115 = +[NSNumber numberWithInt:v114];
    }
    else
    {
      v115 = 0;
    }
    if (v117)
    {
      v107 = [v117 domain];
      v106 = +[NSNumber numberWithInteger:[v117 code]];
    }
    else
    {
      v106 = 0;
      v107 = 0;
    }
    int v18 = [v118 clientMetrics];
    uint64_t v19 = [v18 networkMetrics];
    id v20 = [v19 httpResponseCode];

    v21 = [v118 clientMetrics];
    double v22 = [v21 networkMetrics];
    v113 = [v22 serviceIpAddress];

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v23 = [v118 additionalStates];
    id v24 = [v23 countByEnumeratingWithState:&v119 objects:v129 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v120;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v120 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v119 + 1) + 8 * i);
          if ([v28 stateType] == 706)
          {
            uint64_t v29 = [v28 tileSet];
            id v30 = [v29 tileSetInfos];
            id v31 = [v30 firstObject];
            v112 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v31 style]);

            goto LABEL_22;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v119 objects:v129 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    v112 = 0;
LABEL_22:

    if ([v118 hasTilesetId])
    {
      uint64_t v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v118 tilesetId]);
    }
    else
    {
      uint64_t v32 = 0;
    }
    v111 = (void *)v32;
    id v96 = v20;
    if ([v118 hasNetworkService])
    {
      v110 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v118 networkService]);
    }
    else
    {
      v110 = 0;
    }
    v109 = [v118 requestingAppIdentifier];
    uint64_t v33 = [v118 appIdentifier];
    v108 = [v118 manifestEnvironment];
    uint64_t v34 = [v118 countryCode];
    id v35 = [v118 datasetId];
    v36 = [v118 clientMetrics];
    v37 = [v36 networkMetrics];
    v38 = [v37 transactionMetrics];
    v39 = [v38 lastObject];
    unsigned int v40 = [v39 reusedConnection];

    unsigned int v41 = [v118 usedBackgroundUrl];
    if (v33) {
      CFStringRef v42 = (const __CFString *)v33;
    }
    else {
      CFStringRef v42 = @"unspecified";
    }
    id v43 = objc_alloc((Class)NSString);
    id v44 = [v116 year];
    id v45 = [v116 month];
    id v46 = [v116 day];
    unsigned int v94 = v41;
    unsigned int v95 = v40;
    uint64_t v47 = v41;
    v48 = (__CFString *)v42;
    v105 = (void *)v34;
    id v49 = objc_msgSend(v43, "initWithFormat:", @"%@-%@-%@-%@-%04d-%02d-%02d-%d-%d-%@-%@-%@-%@-%@-%@-%@-%u-%d-%d", v109, v42, v110, v115, v44, v45, v46, v103, v96, v113, v107, v106, v112, v108, v111, v34,
            v35,
            v40,
            v47);
    v97 = [*(id *)(v98 + 32) objectForKeyedSubscript:v42];
    if (!v97)
    {
      id v50 = objc_alloc_init((Class)NSMutableDictionary);
      [*(id *)(v98 + 32) setObject:v50 forKeyedSubscript:v42];
    }
    v51 = [*(id *)(v98 + 32) objectForKeyedSubscript:v42];
    id v52 = [v51 objectForKeyedSubscript:v49];

    if (!v52)
    {
      id v92 = v49;
      id v53 = objc_alloc_init((Class)NSMutableArray);
      id v54 = objc_alloc_init((Class)NSMutableArray);
      id v55 = objc_alloc_init((Class)NSMutableArray);
      id v52 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
      v56 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v116 year]);
      [v52 setObject:v56 forKeyedSubscript:@"y"];

      v57 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v116 month]);
      [v52 setObject:v57 forKeyedSubscript:@"m"];

      v58 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v116 day]);
      [v52 setObject:v58 forKeyedSubscript:@"d"];

      v59 = +[NSNumber numberWithBool:v103];
      [v52 setObject:v59 forKeyedSubscript:@"c"];

      v104 = v53;
      [v52 setObject:v53 forKeyedSubscript:@"L"];
      v93 = v54;
      [v52 setObject:v54 forKeyedSubscript:@"tx"];
      v60 = v55;
      [v52 setObject:v55 forKeyedSubscript:@"rx"];
      [v52 setObject:v108 forKeyedSubscript:@"me"];
      [v52 setObject:v109 forKeyedSubscript:@"raid"];
      [v52 setObject:v42 forKeyedSubscript:@"aid"];
      [v52 setObject:v113 forKeyedSubscript:@"ip"];
      v61 = +[NSNumber numberWithBool:v95];
      [v52 setObject:v61 forKeyedSubscript:@"cr"];

      v62 = +[NSNumber numberWithBool:v94];
      [v52 setObject:v62 forKeyedSubscript:@"ubu"];

      if (v110) {
        [v52 setObject:v110 forKeyedSubscript:@"n"];
      }
      if (v96)
      {
        v63 = +[NSNumber numberWithInt:v96];
        [v52 setObject:v63 forKeyedSubscript:@"hc"];
      }
      id v49 = v92;
      if (v115) {
        [v52 setObject:v115 forKeyedSubscript:@"p"];
      }
      if (v112) {
        [v52 setObject:v112 forKeyedSubscript:@"tss"];
      }
      if (v111) {
        [v52 setObject:v111 forKeyedSubscript:@"tsi"];
      }
      if (v117)
      {
        [v52 setObject:v107 forKeyedSubscript:@"ed"];
        [v52 setObject:v106 forKeyedSubscript:@"ec"];
      }
      if (v105) {
        [v52 setObject:v105 forKeyedSubscript:@"cc"];
      }
      id v5 = v118;
      if (v35)
      {
        v64 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
        [v52 setObject:v64 forKeyedSubscript:@"dsid"];
      }
      v65 = [*(id *)(v98 + 32) objectForKeyedSubscript:v42];
      [v65 setObject:v52 forKeyedSubscript:v92];
    }
    v66 = [v5 clientMetrics];
    v67 = [v66 networkMetrics];
    v68 = [v67 transactionMetrics];
    v69 = [v68 lastObject];
    [v69 requestStart];
    double v71 = v70;

    v72 = [v5 clientMetrics];
    v73 = [v72 networkMetrics];
    v74 = [v73 transactionMetrics];
    v75 = [v74 lastObject];
    [v75 requestEnd];
    double v77 = v76;

    if (v77 <= v71) {
      double v78 = 0.0;
    }
    else {
      double v78 = (v77 - v71) * 1000.0 * 1000.0;
    }
    v79 = [v52 objectForKeyedSubscript:@"L"];
    v80 = +[NSNumber numberWithDouble:v78];
    [v79 addObject:v80];

    if (v117)
    {
      v81 = sub_100006F34();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        id v82 = [v79 count];
        *(_DWORD *)buf = 134218498;
        id v124 = v82;
        __int16 v125 = 2048;
        v126 = v79;
        __int16 v127 = 2112;
        id v128 = v49;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "count now %lu %p %@", buf, 0x20u);
      }
    }
    v83 = [v52 objectForKeyedSubscript:@"tx"];
    v84 = [v5 clientMetrics];
    v85 = [v84 networkMetrics];
    v86 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v85 requestDataSize]);
    [v83 addObject:v86];

    v87 = [v52 objectForKeyedSubscript:@"rx"];
    v88 = [v5 clientMetrics];
    v89 = [v88 networkMetrics];
    v90 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v89 responseDataSize]);
    [v87 addObject:v90];

    id v17 = v117;
    id v3 = v102;
  }
  else
  {
    id v17 = sub_100006F34();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "unable to read data element", buf, 2u);
    }
  }
}

void sub_100007C08(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init((Class)GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setLatencyStats:v25];

  uint64_t v26 = [*(id *)(a1 + 32) latencyStats];
  [v26 setMax:(unint64_t)a4];

  v27 = [*(id *)(a1 + 32) latencyStats];
  [v27 setMin:(unint64_t)a3];

  id v28 = [*(id *)(a1 + 32) latencyStats];
  [v28 setP10:(unint64_t)a5];

  uint64_t v29 = [*(id *)(a1 + 32) latencyStats];
  [v29 setP25:(unint64_t)a6];

  id v30 = [*(id *)(a1 + 32) latencyStats];
  [v30 setP50:(unint64_t)a7];

  id v31 = [*(id *)(a1 + 32) latencyStats];
  [v31 setP75:(unint64_t)a8];

  uint64_t v32 = [*(id *)(a1 + 32) latencyStats];
  [v32 setP90:(unint64_t)a9];

  uint64_t v33 = [*(id *)(a1 + 32) latencyStats];
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = [*(id *)(a1 + 32) latencyStats];
  [v36 setAlgMean:v34];
}

void sub_100007DD0(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init((Class)GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setTxBytesStats:v25];

  uint64_t v26 = [*(id *)(a1 + 32) txBytesStats];
  [v26 setMax:(unint64_t)a4];

  v27 = [*(id *)(a1 + 32) txBytesStats];
  [v27 setMin:(unint64_t)a3];

  id v28 = [*(id *)(a1 + 32) txBytesStats];
  [v28 setP10:(unint64_t)a5];

  uint64_t v29 = [*(id *)(a1 + 32) txBytesStats];
  [v29 setP25:(unint64_t)a6];

  id v30 = [*(id *)(a1 + 32) txBytesStats];
  [v30 setP50:(unint64_t)a7];

  id v31 = [*(id *)(a1 + 32) txBytesStats];
  [v31 setP75:(unint64_t)a8];

  uint64_t v32 = [*(id *)(a1 + 32) txBytesStats];
  [v32 setP90:(unint64_t)a9];

  uint64_t v33 = [*(id *)(a1 + 32) txBytesStats];
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = [*(id *)(a1 + 32) txBytesStats];
  [v36 setAlgMean:v34];
}

void sub_100007F98(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init((Class)GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setRxBytesStats:v25];

  uint64_t v26 = [*(id *)(a1 + 32) rxBytesStats];
  [v26 setMax:(unint64_t)a4];

  v27 = [*(id *)(a1 + 32) rxBytesStats];
  [v27 setMin:(unint64_t)a3];

  id v28 = [*(id *)(a1 + 32) rxBytesStats];
  [v28 setP10:(unint64_t)a5];

  uint64_t v29 = [*(id *)(a1 + 32) rxBytesStats];
  [v29 setP25:(unint64_t)a6];

  id v30 = [*(id *)(a1 + 32) rxBytesStats];
  [v30 setP50:(unint64_t)a7];

  id v31 = [*(id *)(a1 + 32) rxBytesStats];
  [v31 setP75:(unint64_t)a8];

  uint64_t v32 = [*(id *)(a1 + 32) rxBytesStats];
  [v32 setP90:(unint64_t)a9];

  uint64_t v33 = [*(id *)(a1 + 32) rxBytesStats];
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = [*(id *)(a1 + 32) rxBytesStats];
  [v36 setAlgMean:v34];
}

void sub_100008278(uint64_t a1, char a2, double a3)
{
  if (a2)
  {
    id v4 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3];
    id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int v6 = [v5 components:28 fromDate:v4];
    uint64_t v7 = [v5 dateFromComponents:v6];

    GEOConfigGetDate();
    objc_msgSend(v6, "setDay:", (char *)objc_msgSend(v6, "day") - 7);
    uint64_t v8 = [v5 dateFromComponents:v6];
    GEOConfigSetDate();
    id v9 = [v5 components:28 fromDate:v8];

    objc_msgSend(v9, "setDay:", (char *)objc_msgSend(v9, "day") + 1);
    id v10 = [v5 dateFromComponents:v9];
    while ([v10 compare:v7] == (id)-1)
    {
      id v11 = v10;
      uint64_t v12 = sub_100006F34();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      int v14 = sub_100006F34();
      uint64_t v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "DailyNetworkEvent", "for '%@'", buf, 0xCu);
      }

      [*(id *)(a1 + 32) runAggregationForDate:v11];
      GEOConfigSetDate();
      objc_msgSend(v9, "setDay:", (char *)objc_msgSend(v9, "day") + 1);
      id v10 = [v5 dateFromComponents:v9];

      id v16 = sub_100006F34();
      id v17 = v16;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v10;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v13, "DailyNetworkEvent", "for '%@'", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v7 = sub_100006F34();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no time sync", buf, 2u);
    }
  }
}

void sub_1000085A4(id a1)
{
  qword_100033D98 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "NetEventAggregator");
  _objc_release_x1();
}

id sub_1000085E8()
{
  self;
  if (qword_100033DB0 != -1) {
    dispatch_once(&qword_100033DB0, &stru_100028848);
  }
  uint64_t v0 = (void *)qword_100033DA8;
  return v0;
}

void sub_100008640(id a1)
{
  qword_100033DA8 = objc_alloc_init(GEOAPCountsAggregator);
  _objc_release_x1();
}

id *sub_1000088E4(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_100008914(uint64_t a1)
{
  if (a1)
  {
    a1 = [*(id *)(a1 + 8) dateByAddingTimeInterval:*(double *)(a1 + 24)];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

id *sub_100008950(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_100008980(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v3 = [v2 components:28 fromDate:v1[2]];
    objc_msgSend(v3, "setMonth:", (char *)objc_msgSend(v3, "month") + 1);
    uint64_t v1 = [v2 dateFromComponents:v3];
  }
  return v1;
}

id sub_100008CA0()
{
  if (qword_100033DC0 != -1) {
    dispatch_once(&qword_100033DC0, &stru_1000289D0);
  }
  uint64_t v0 = (void *)qword_100033DB8;
  return v0;
}

void sub_100008FC8(id *a1)
{
  if (a1)
  {
    unsigned __int8 v2 = [a1[4] tryLock];
    id v3 = sub_100008CA0();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "starting", buf, 2u);
      }

      id v3 = [a1 now];
      [a1 startDailyAggregationFromTime:v3];
      [a1 startMonthlyAggregationFromTime:v3];
      id v5 = sub_100008CA0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "done", v6, 2u);
      }

      [a1[4] unlock];
    }
    else if (v4)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "already running; done", v8, 2u);
    }
  }
}

void sub_1000092C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000092E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000092F0(uint64_t a1)
{
}

uint64_t sub_1000092F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 settings];

  unsigned int v6 = sub_100008CA0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "found daily settings record", buf, 2u);
    }

    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v9 = [v3 settings];
    unsigned int v6 = v9;
    if (v8)
    {
      [v8 mergeFrom:v9];
    }
    else
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      id v11 = *(NSObject **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
      unsigned int v6 = v11;
    }
  }
  else if (v7)
  {
    *(_WORD *)os_signpost_id_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "daily settings record found but is empty", v13, 2u);
  }

  return 1;
}

void sub_100009424(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    geo_dispatch_async_qos();
  }
  else
  {
    uint64_t v1 = sub_100008CA0();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "no daily settings to report", buf, 2u);
    }
  }
}

void sub_1000094F4(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapSettings];
  unsigned __int8 v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapUiShown];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapsFeatures];
  BOOL v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapsUserSettings];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) routingSettings];
  +[GEOAPPortal capturePeriodicSettingsWithMapSettings:v6 mapUiShown:v2 mapsFeatures:v3 mapsUserSettings:v4 routingSettings:v5];
}

void sub_1000098A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000098CC(id a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 createTime];
  id v6 = [v5 compare:*((void *)a1 + 4)];

  if (v6 != (id)1)
  {
    uint64_t v8 = [v3 createTime];
    id v9 = [v8 compare:*((void *)a1 + 5)];

    if (v9 != (id)-1)
    {
      ++*(_DWORD *)(*(void *)(*((void *)a1 + 7) + 8) + 24);
      id v10 = objc_alloc((Class)NSString);
      id v11 = [v3 countType];
      uint64_t v12 = [v3 usageString];
      os_signpost_id_t v13 = [v3 usageBool];
      id v14 = [v10 initWithFormat:@"%u%@%@", v11, v12, v13];

      uint64_t v15 = [v3 appId];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100009ADC;
      v17[3] = &unk_100028898;
      id v18 = *((id *)a1 + 6);
      id v19 = v14;
      id v20 = v3;
      a1 = v14;
      +[GEOAPUtils appTypeForAppId:v15 resultBlock:v17];

      char v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    char v7 = 0;
    ++*(_DWORD *)(*(void *)(*((void *)a1 + 8) + 8) + 24);
    LOBYTE(a1) = 1;
    goto LABEL_7;
  }
  if (!*(_DWORD *)(*(void *)(*((void *)a1 + 7) + 8) + 24)) {
    goto LABEL_6;
  }
  char v7 = 0;
  LOBYTE(a1) = 0;
LABEL_7:

  return (v7 | a1) & 1;
}

void sub_100009ADC(uint64_t a1, uint64_t a2)
{
  id v18 = [objc_alloc((Class)NSNumber) initWithInt:a2];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 objectForKeyedSubscript:v18];

  if (!v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v8 setObject:v7 forKeyedSubscript:v18];

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v11 = [v10 objectForKeyedSubscript:v18];
    [v11 setObject:v9 forKeyedSubscript:@"e"];
  }
  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  os_signpost_id_t v13 = [v12 objectForKeyedSubscript:v18];
  id v14 = [v13 objectForKeyedSubscript:@"c"];

  id v15 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v14, "intValue") + 1);
  id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v17 = [v16 objectForKeyedSubscript:v18];
  [v17 setObject:v15 forKeyedSubscript:@"c"];
}

void sub_100009CB4(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    if (*(int *)(a1 + 48) >= 1)
    {
      uint64_t v2 = 0;
      do
      {
        id v19 = [objc_alloc((Class)NSNumber) initWithInt:v2];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id obj = *(id *)(a1 + 32);
        id v20 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v20)
        {
          uint64_t v18 = *(void *)v22;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(obj);
              }
              uint64_t v4 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
              id v7 = [v6 objectForKeyedSubscript:v19];

              if (v7)
              {
                uint64_t v8 = [v7 objectForKeyedSubscript:@"e"];
                id v9 = objc_alloc_init((Class)GEODailyUseSummaryUseEvent);
                objc_msgSend(v9, "setEventType:", objc_msgSend(v8, "countType"));
                uint64_t v10 = v2;
                [v9 setAppType:v2];
                id v11 = [v7 objectForKeyedSubscript:@"c"];
                objc_msgSend(v9, "setCount:", +[GEOAPFuzzers fuzzMonthlyCount:forDailyUsageType:](GEOAPFuzzers, "fuzzMonthlyCount:forDailyUsageType:", objc_msgSend(v11, "unsignedIntValue"), objc_msgSend(v9, "eventType")));

                uint64_t v12 = [v8 usageBool];

                if (v12)
                {
                  os_signpost_id_t v13 = [v8 usageBool];
                  objc_msgSend(v9, "setUsageBool:", objc_msgSend(v13, "BOOLValue"));
                }
                id v14 = [v8 usageString];
                [v9 setUsageString:v14];

                [v17 addObject:v9];
                uint64_t v2 = v10;
              }
            }
            id v20 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v20);
        }

        uint64_t v2 = (v2 + 1);
      }
      while ((int)v2 < *(_DWORD *)(a1 + 48));
    }
    id v15 = v17;
    geo_dispatch_async_qos();
  }
}

void sub_100009FDC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) copy];
  +[GEOAPPortal captureDailyUseSummaryWithUseEvents:v1 summaryPeriod:2 summaryDate:0 firstEventDate:0 user_mapsUseLastDate:0];
}

void sub_10000A510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 240), 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A598(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 createTime];
  id v6 = [v5 compare:*(void *)(a1 + 32)];

  if (v6 != (id)1)
  {
    id v9 = [v3 createTime];
    id v10 = [v9 compare:*(void *)(a1 + 40)];

    if (v10 != (id)-1)
    {
      if ([v3 countType] != 149)
      {
        if ([v3 countType] == 150
          && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
        {
          double v16 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
          id v17 = [v3 createTime];
          [v17 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
          *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v16 + v18;

          uint64_t v19 = *(void *)(a1 + 72);
        }
        else
        {
          if ([v3 countType] == 45)
          {
            uint64_t v20 = [v3 createTime];
            uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
            long long v22 = *(void **)(v21 + 40);
            *(void *)(v21 + 40) = v20;
          }
          if ([v3 countType] != 165
            || !*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
          {
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            id v28 = objc_alloc((Class)NSString);
            id v29 = [v3 countType];
            id v30 = [v3 usageString];
            id v31 = [v3 usageBool];
            id v32 = [v28 initWithFormat:@"%u%@%@", v29, v30, v31];

            uint64_t v33 = [v3 appId];
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_10000A908;
            v34[3] = &unk_100028938;
            id v35 = *(id *)(a1 + 48);
            id v36 = v32;
            id v37 = v3;
            long long v38 = *(_OWORD *)(a1 + 104);
            uint64_t v39 = *(void *)(a1 + 120);
            id v8 = v32;
            +[GEOAPUtils appTypeForAppId:v33 resultBlock:v34];

            char v7 = 1;
            goto LABEL_9;
          }
          double v23 = *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
          long long v24 = [v3 createTime];
          [v24 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
          *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v23 + v25;

          uint64_t v19 = *(void *)(a1 + 88);
        }
        uint64_t v26 = *(void *)(v19 + 8);
        v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = 0;

        char v7 = 0;
        uint64_t v14 = *(void *)(a1 + 56);
        goto LABEL_8;
      }
      uint64_t v11 = [v3 createTime];
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      os_signpost_id_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
LABEL_7:
    char v7 = 0;
    uint64_t v14 = *(void *)(a1 + 64);
LABEL_8:
    ++*(_DWORD *)(*(void *)(v14 + 8) + 24);
    LOBYTE(v8) = 1;
    goto LABEL_9;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_7;
  }
  char v7 = 0;
  LOBYTE(v8) = 0;
LABEL_9:

  return (v7 | v8) & 1;
}

void sub_10000A908(uint64_t a1, uint64_t a2, int a3)
{
  id v29 = [objc_alloc((Class)NSNumber) initWithInt:a2];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  char v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v8 = [v7 objectForKeyedSubscript:v29];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v10 setObject:v9 forKeyedSubscript:v29];

    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    os_signpost_id_t v13 = [v12 objectForKeyedSubscript:v29];
    [v13 setObject:v11 forKeyedSubscript:@"e"];
  }
  uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v15 = [v14 objectForKeyedSubscript:v29];
  double v16 = [v15 objectForKeyedSubscript:@"c"];

  id v17 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v16, "intValue") + 1);
  double v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v19 = [v18 objectForKeyedSubscript:v29];
  [v19 setObject:v17 forKeyedSubscript:@"c"];

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && a3)
  {
    uint64_t v20 = [*(id *)(a1 + 48) createTime];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  if (a3
    && ([*(id *)(a1 + 48) countType] == 45
     || [*(id *)(a1 + 48) countType] == 152))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v23 = [*(id *)(a1 + 48) createTime];
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      double v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    uint64_t v26 = [*(id *)(a1 + 48) createTime];
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

void sub_10000AB94(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v29 = objc_alloc_init((Class)NSMutableArray);
    if (*(int *)(a1 + 112) >= 1)
    {
      uint64_t v2 = 0;
      do
      {
        id v31 = [objc_alloc((Class)NSNumber) initWithInt:v2];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = *(id *)(a1 + 32);
        id v32 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v32)
        {
          uint64_t v30 = *(void *)v36;
          do
          {
            for (i = 0; i != v32; i = (char *)i + 1)
            {
              if (*(void *)v36 != v30) {
                objc_enumerationMutation(obj);
              }
              uint64_t v4 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
              char v7 = [v6 objectForKeyedSubscript:v31];

              if (v7)
              {
                id v8 = [v7 objectForKeyedSubscript:@"e"];
                id v9 = objc_alloc_init((Class)GEODailyUseSummaryUseEvent);
                objc_msgSend(v9, "setEventType:", objc_msgSend(v8, "countType"));
                uint64_t v10 = v2;
                [v9 setAppType:v2];
                uint64_t v11 = [v7 objectForKeyedSubscript:@"c"];
                objc_msgSend(v9, "setCount:", +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:](GEOAPFuzzers, "fuzzDailyCount:forDailyUsageType:", objc_msgSend(v11, "unsignedIntValue"), objc_msgSend(v9, "eventType")));

                uint64_t v12 = [v8 usageBool];

                if (v12)
                {
                  os_signpost_id_t v13 = [v8 usageBool];
                  objc_msgSend(v9, "setUsageBool:", objc_msgSend(v13, "BOOLValue"));
                }
                uint64_t v14 = [v8 usageString];
                [v9 setUsageString:v14];

                [v29 addObject:v9];
                uint64_t v2 = v10;
              }
            }
            id v32 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v32);
        }

        uint64_t v2 = (v2 + 1);
      }
      while ((int)v2 < *(_DWORD *)(a1 + 112));
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && (_GEOConfigHasValue() & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceReferenceDate];
      GEOConfigSetDouble();
    }
    if (_GEOConfigHasValue())
    {
      id v15 = objc_alloc((Class)NSNumber);
      GEOConfigGetDouble();
      id v16 = objc_msgSend(v15, "initWithDouble:");
    }
    else
    {
      id v16 = 0;
    }
    id v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v17)
    {
      [v17 timeIntervalSinceReferenceDate];
      GEOConfigSetDouble();
    }
    if (*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) > 0.0)
    {
      id v18 = objc_alloc_init((Class)GEODailyUseSummaryUseEvent);
      [v18 setEventType:151];
      [v18 setAppType:0];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      if (v19 && v19 != *(void *)(a1 + 40)) {
        [v18 setUsageString:@"Dropped counts"];
      }
      objc_msgSend(v18, "setCount:", +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:](GEOAPFuzzers, "fuzzDailyCount:forDailyUsageType:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), objc_msgSend(v18, "eventType")));
      [v29 addObject:v18];
    }
    if (*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) > 0.0)
    {
      id v20 = objc_alloc_init((Class)GEODailyUseSummaryUseEvent);
      [v20 setEventType:166];
      [v20 setAppType:0];
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      if (v21)
      {
        if (v21 != *(void *)(a1 + 40)) {
          [v20 setUsageString:@"Dropped counts"];
        }
      }
      objc_msgSend(v20, "setCount:", +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:](GEOAPFuzzers, "fuzzDailyCount:forDailyUsageType:", *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), objc_msgSend(v20, "eventType")));
      [v29 addObject:v20];
    }
    long long v22 = +[NSTimeZone defaultTimeZone];
    uint64_t v23 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), (double)(uint64_t)[v22 secondsFromGMTForDate:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)]);
    uint64_t v24 = *(void *)(*(void *)(a1 + 104) + 8);
    double v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    unint64_t v34 = v16;
    id v33 = *(id *)(a1 + 40);
    id v26 = v16;
    id v27 = v29;
    geo_dispatch_async_qos();
  }
}

void sub_10000B158(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) copy];
  uint64_t v2 = +[GEOAPUtils dailyAggregationTimestampFromDate:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceReferenceDate];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  +[GEOAPPortal captureDailyUseSummaryWithUseEvents:v4 summaryPeriod:1 summaryDate:v2 firstEventDate:v3 user_mapsUseLastDate:*(void *)(a1 + 48)];
}

void sub_10000B53C(id *a1)
{
  if (a1)
  {
    uint64_t v2 = sub_100008CA0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "starting eval mode aggregation", buf, 2u);
    }

    [a1[4] lock];
    id v3 = +[NSDate distantPast];
    id v4 = +[NSDate distantFuture];
    [a1 aggregateDailyCountsAndReportFrom:v3 until:v4];

    id v5 = +[NSDate distantPast];
    id v6 = +[NSDate distantFuture];
    [a1 aggregateMonthlyCountsAndReportFrom:v5 until:v6];

    [a1[4] unlock];
    char v7 = sub_100008CA0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "finished eval mode aggregation", v8, 2u);
    }
  }
}

void sub_10000B6D0(id a1)
{
  qword_100033DB8 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "Aggregator");
  _objc_release_x1();
}

uint64_t sub_10000B714()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100033DC8;
  uint64_t v5 = qword_100033DC8;
  if (!qword_100033DC8)
  {
    long long v6 = *(_OWORD *)off_1000289F0;
    long long v7 = *(_OWORD *)&off_100028A00;
    v3[3] = _sl_dlopen();
    qword_100033DC8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_10000B824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B83C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100033DC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000B8CC()
{
  uint64_t v0 = sub_10000B714();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_10000B928()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100033DD0;
  uint64_t v6 = qword_100033DD0;
  if (!qword_100033DD0)
  {
    id v1 = (void *)sub_10000B8CC();
    v4[3] = (uint64_t)dlsym(v1, "AnalyticsSendEventLazy");
    qword_100033DD0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000BA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10000BA18(uint64_t a1)
{
  uint64_t v2 = (void *)sub_10000B8CC();
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100033DD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000BA68(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void (*)(id, id))sub_10000B928();
  if (v5)
  {
    v5(v3, v4);
  }
  else
  {
    sub_10001A604();
    sub_10000BACC(v6);
  }
}

void sub_10000BACC(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[1] invalidate];
    id v2 = v3[1];
    v3[1] = 0;

    WeakRetained = v3;
  }
}

void sub_10000BB28(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

uint64_t sub_10000BD98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C18C(uint64_t a1)
{
  id v2 = sub_100003478();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[GEOAPDaemonManagerBridge showEvalData]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v3 = +[GEOAPServiceManager sharedManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C300;
  v5[3] = &unk_100028A40;
  id v6 = *(id *)(a1 + 32);
  [v3 showEvalDataWithVisitorBlock:v5];

  id v4 = sub_100003478();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "will call endEvalData", buf, 2u);
  }

  [*(id *)(a1 + 32) endEvalData];
}

void sub_10000C300(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_100003478();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    uint64_t v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "eval visit type %llu", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 32) evalData:v8 ofType:a2 createTime:v7];
}

void sub_10000C5D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_10000C600(uint64_t a1)
{
  id v2 = sub_10000397C();
  sub_100017B44((uint64_t)v2, *(void **)(a1 + 32));

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [WeakRetained[1] invalidate];
    id v4 = v5[1];
    v5[1] = 0;

    WeakRetained = v5;
  }
}

void sub_10000C688(uint64_t a1)
{
  id v2 = sub_10000397C();
  sub_100017B44((uint64_t)v2, *(void **)(a1 + 32));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    uint64_t v5 = WeakRetained;

    WeakRetained = v5;
  }
}

id sub_10000C9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  LODWORD(v9) = a8;
  return [*(id *)(a1 + 32) inflightBatchUUID:a2 createTime:a3 analyticSessionType:a4 eventCount:a5 uploadSize:a6 urlSessionType:a7 stageNumber:v9];
}

id sub_10000C9E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) endInflightData];
}

id sub_10000CB84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned int a9)
{
  return [*(id *)(a1 + 32) uploadHistoryForBatchUUID:a2 endDate:a3 uploadLatency:a4 analyticSessionType:a5 eventCount:a6 uploadSize:a7 urlSessionType:__PAIR64__(a9 stageNumber:a8)];
}

id sub_10000CBCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) endHistoricalData];
}

id sub_10000CCA8()
{
  self;
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000;
  id v6 = sub_10000CDB0;
  id v7 = sub_10000CDC0;
  id v8 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CDC8;
  block[3] = &unk_1000286C8;
  block[4] = &v3;
  if (qword_100033DD8 != -1) {
    dispatch_once(&qword_100033DD8, block);
  }
  id v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

uint64_t sub_10000CDB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000CDC0(uint64_t a1)
{
}

uint64_t sub_10000CDC8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(GEOAPDaemon);
  return _objc_release_x1();
}

void sub_10000D088(uint64_t a1)
{
  id v2 = sub_100003478();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "SIGTERM received", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _shutdown];
}

void *sub_10000D108(void *result)
{
  if (result)
  {
    id v1 = result;
    [result _setupSigHandler];
    id v2 = (void *)v1[1];
    return [v2 activate];
  }
  return result;
}

BOOL sub_10000D148(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 32) != 0;
  }
  return result;
}

void sub_10000D1AC(id a1)
{
  qword_100033DE0 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "GEOAPDaemon");
  _objc_release_x1();
}

id sub_10000D1F0(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v4 = 0;
LABEL_10:
    id v17 = 0;
    goto LABEL_11;
  }
  v21.receiver = a1;
  v21.super_class = (Class)GEOAPUploadFileWriter;
  id v3 = objc_msgSendSuper2(&v21, "init");
  id v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 24) = 0;
    *((void *)v3 + 2) = a2;
    uint64_t v5 = +[GEOAPUtils GEOAPCachePath];
    id v6 = objc_alloc_init((Class)NSUUID);
    id v7 = [v6 UUIDString];
    uint64_t v8 = [v5 stringByAppendingPathComponent:v7];
    uint64_t v9 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v8;

    int v10 = open((const char *)[*((id *)v4 + 3) fileSystemRepresentation], 1537, 416);
    *((_DWORD *)v4 + 2) = v10;
    if (v10 < 0)
    {
      uint64_t v12 = sub_1000051A4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *((void *)v4 + 3);
        uint64_t v14 = __error();
        id v15 = strerror(*v14);
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        double v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "unable to create upload file '%@' (%s)", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = GEOBatchAnalyticsSessionType();
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000D3FC;
      v19[3] = &unk_100028B00;
      id v20 = v4;
      [v20 _arpcDataForType:v11 dataBlock:v19];
      uint64_t v12 = v20;
    }

    int v16 = *((_DWORD *)v4 + 2);
    if (v16 < 0) {
      goto LABEL_10;
    }
  }
  id v4 = v4;
  id v17 = v4;
LABEL_11:

  return v17;
}

void sub_10000D3FC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
  id v7 = v5;
  unint64_t v8 = write(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  if (v8 < (unint64_t)[v7 length])
  {
    uint64_t v9 = sub_1000051A4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v10;
      __int16 v24 = 2080;
      double v25 = v12;
      uint64_t v13 = "unable to write ARPC header to file '%@' (%s)";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  *(void *)(*(void *)(a1 + 32) + 88) = [v7 length];
  int __buf = 0;
  if ((unint64_t)write(*(_DWORD *)(*(void *)(a1 + 32) + 8), &__buf, 4uLL) <= 3)
  {
    uint64_t v9 = sub_1000051A4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
      id v15 = __error();
      int v16 = strerror(*v15);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      double v25 = v16;
      uint64_t v13 = "unable to write len placeholder to file '%@' (%s)";
      goto LABEL_11;
    }
LABEL_12:

    close(*(_DWORD *)(*(void *)(a1 + 32) + 8));
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = a3;
  if (a3)
  {
    if (compression_stream_init((compression_stream *)(*(void *)(a1 + 32) + 32), COMPRESSION_STREAM_ENCODE, COMPRESSION_LZ4) == COMPRESSION_STATUS_OK)
    {
      size_t UInteger = GEOConfigGetUInteger();
      *(void *)(*(void *)(a1 + 32) + 72) = malloc_type_malloc(UInteger, 0x4AF9BE0BuLL);
      *(void *)(*(void *)(a1 + 32) + 80) = UInteger;
      goto LABEL_13;
    }
    uint64_t v9 = sub_1000051A4();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
    id v18 = __error();
    uint64_t v19 = strerror(*v18);
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v17;
    __int16 v24 = 2080;
    double v25 = v19;
    uint64_t v13 = "unable to initialize ARPC header to file '%@' (%s)";
    goto LABEL_11;
  }
LABEL_13:
}

uint64_t sub_10000D7D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_30;
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0) {
    goto LABEL_29;
  }
  char __buf = 10;
  unint64_t v5 = (unint64_t)[v3 length];
  if (v5 < 0x80)
  {
    uint64_t v9 = v38;
    LOBYTE(v6) = 1;
LABEL_9:
    *uint64_t v9 = v5;
  }
  else
  {
    uint64_t v6 = 1;
    while (v6 != 16)
    {
      v38[v6 - 1] = v5 | 0x80;
      unint64_t v7 = v5 >> 7;
      ++v6;
      unint64_t v8 = v5 >> 14;
      v5 >>= 7;
      if (!v8)
      {
        uint64_t v9 = &v38[v6 - 1];
        LOBYTE(v5) = v7;
        goto LABEL_9;
      }
    }
    LOBYTE(v6) = 0;
  }
  if (!*(unsigned char *)(a1 + 12))
  {
    int v11 = v6 + 1;
    if (write(*(_DWORD *)(a1 + 8), &__buf, v6 + 1) <= v6)
    {
      id v15 = sub_1000051A4();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }
    else
    {
      int v12 = *(_DWORD *)(a1 + 8);
      id v13 = v4;
      unint64_t v14 = write(v12, [v13 bytes], (size_t)objc_msgSend(v13, "length"));
      if (v14 >= (unint64_t)[v13 length])
      {
        *(_DWORD *)(a1 + 96) += [v13 length] + v11;
LABEL_39:
        a1 = 1;
        goto LABEL_30;
      }
      id v15 = sub_1000051A4();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }
    uint64_t v23 = *(void *)(a1 + 24);
    __int16 v24 = __error();
    double v25 = strerror(*v24);
    int v33 = 138412546;
    uint64_t v34 = v23;
    __int16 v35 = 2080;
    long long v36 = v25;
    long long v22 = "unable to write data to file '%@' (%s)";
    goto LABEL_27;
  }
  *(void *)(a1 + 32) = *(void *)(a1 + 72);
  *(void *)(a1 + 48) = &__buf;
  *(void *)(a1 + 56) = v6 + 1;
  *(void *)(a1 + 40) = *(void *)(a1 + 80);
  if (compression_stream_process((compression_stream *)(a1 + 32), 0))
  {
    uint64_t v10 = sub_1000051A4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "compress process failed", (uint8_t *)&v33, 2u);
    }
LABEL_16:

    goto LABEL_29;
  }
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 40);
  unint64_t v18 = v16 - v17;
  if (v16 != v17)
  {
    if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v16 - v17) < v18)
    {
      id v15 = sub_1000051A4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_28;
    }
    *(_DWORD *)(a1 + 96) += v18;
  }
  id v27 = v4;
  *(void *)(a1 + 48) = [v27 bytes];
  id v28 = [v27 length];
  *(void *)(a1 + 56) = v28;
  if (!v28) {
    goto LABEL_39;
  }
  while (1)
  {
    uint64_t v29 = *(void *)(a1 + 80);
    *(void *)(a1 + 32) = *(void *)(a1 + 72);
    *(void *)(a1 + 40) = v29;
    if (compression_stream_process((compression_stream *)(a1 + 32), 0))
    {
      uint64_t v10 = sub_1000051A4();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      LOWORD(v33) = 0;
      goto LABEL_15;
    }
    uint64_t v30 = *(void *)(a1 + 80);
    uint64_t v31 = *(void *)(a1 + 40);
    unint64_t v32 = v30 - v31;
    if (v30 != v31) {
      break;
    }
LABEL_38:
    if (!*(void *)(a1 + 56)) {
      goto LABEL_39;
    }
  }
  if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v30 - v31) >= v32)
  {
    *(_DWORD *)(a1 + 96) += v32;
    goto LABEL_38;
  }
  id v15 = sub_1000051A4();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    goto LABEL_28;
  }
LABEL_24:
  uint64_t v19 = *(void *)(a1 + 24);
  id v20 = __error();
  objc_super v21 = strerror(*v20);
  int v33 = 138412546;
  uint64_t v34 = v19;
  __int16 v35 = 2080;
  long long v36 = v21;
  long long v22 = "unable to write compressed data to file '%@' (%s)";
LABEL_27:
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v33, 0x16u);
LABEL_28:

LABEL_29:
  a1 = 0;
LABEL_30:

  return a1;
}

uint64_t sub_10000DC1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_34;
  }
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 < 0) {
    goto LABEL_33;
  }
  if (!*(unsigned char *)(a1 + 12))
  {
LABEL_13:
    if (lseek(v4, *(void *)(a1 + 88), 0) == *(void *)(a1 + 88))
    {
      *(_DWORD *)(a1 + 96) = bswap32(*(_DWORD *)(a1 + 96));
      if ((unint64_t)write(*(_DWORD *)(a1 + 8), (const void *)(a1 + 96), 4uLL) > 3)
      {
        close(*(_DWORD *)(a1 + 8));
        *(_DWORD *)(a1 + 8) = -1;
        unint64_t v18 = (const std::__fs::filesystem::path *)[*(id *)(a1 + 24) fileSystemRepresentation];
        uint64_t v19 = (std::__fs::filesystem::path *)v3;
        id v20 = (const std::__fs::filesystem::path *)[(std::__fs::filesystem::path *)v19 fileSystemRepresentation];
        objc_super v21 = sub_1000051A4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          unint64_t v32 = v18;
          __int16 v33 = 2080;
          uint64_t v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "moving finalized file '%s' to '%s'", buf, 0x16u);
        }

        rename(v18, v20, v22);
        if ((v23 & 0x80000000) == 0)
        {
          if (chmod((const char *)v20, 0x120u) < 0)
          {
            __int16 v24 = sub_1000051A4();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              double v25 = __error();
              id v26 = strerror(*v25);
              *(_DWORD *)buf = 138412546;
              unint64_t v32 = v19;
              __int16 v33 = 2080;
              uint64_t v34 = (const std::__fs::filesystem::path *)v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "unable to set file perms on file '%@' (%s)", buf, 0x16u);
            }
          }
          a1 = 1;
          goto LABEL_34;
        }
        uint64_t v10 = sub_1000051A4();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        id v27 = __error();
        id v28 = strerror(*v27);
        *(_DWORD *)buf = 138412546;
        unint64_t v32 = v19;
        __int16 v33 = 2080;
        uint64_t v34 = (const std::__fs::filesystem::path *)v28;
        unint64_t v14 = "unable to move finalized file to '%@' (%s)";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
        goto LABEL_32;
      }
      uint64_t v10 = sub_1000051A4();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v10 = sub_1000051A4();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
    }
    id v15 = *(const std::__fs::filesystem::path **)(a1 + 24);
    uint64_t v16 = __error();
    uint64_t v17 = strerror(*v16);
    *(_DWORD *)buf = 138412546;
    unint64_t v32 = v15;
    __int16 v33 = 2080;
    uint64_t v34 = (const std::__fs::filesystem::path *)v17;
    unint64_t v14 = "unable to update finalized file '%@' with length (%s)";
    goto LABEL_31;
  }
  char v30 = 0;
  while (1)
  {
    *(void *)(a1 + 48) = &v30;
    *(void *)(a1 + 56) = 0;
    uint64_t v5 = *(void *)(a1 + 80);
    *(void *)(a1 + 32) = *(void *)(a1 + 72);
    *(void *)(a1 + 40) = v5;
    compression_status v6 = compression_stream_process((compression_stream *)(a1 + 32), 1);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 40);
    unint64_t v9 = v7 - v8;
    if (v7 != v8) {
      break;
    }
LABEL_8:
    if (v6)
    {
      if (v6 == COMPRESSION_STATUS_ERROR)
      {
        uint64_t v10 = sub_1000051A4();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        goto LABEL_11;
      }
      compression_stream_destroy((compression_stream *)(a1 + 32));
      free(*(void **)(a1 + 72));
      *(unsigned char *)(a1 + 12) = 0;
      int v4 = *(_DWORD *)(a1 + 8);
      goto LABEL_13;
    }
  }
  if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v7 - v8) >= v9)
  {
    *(_DWORD *)(a1 + 96) += v9;
    goto LABEL_8;
  }
  uint64_t v10 = sub_1000051A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
LABEL_11:
    int v11 = *(const std::__fs::filesystem::path **)(a1 + 24);
    int v12 = __error();
    id v13 = strerror(*v12);
    *(_DWORD *)buf = 138412546;
    unint64_t v32 = v11;
    __int16 v33 = 2080;
    uint64_t v34 = (const std::__fs::filesystem::path *)v13;
    unint64_t v14 = "unable to write finalized compressed data to file '%@' (%s)";
    goto LABEL_31;
  }
LABEL_32:

LABEL_33:
  a1 = 0;
LABEL_34:

  return a1;
}

void sub_10000E054(id a1)
{
  qword_100033DF0 = objc_alloc_init(GEOAPUploader);
  _objc_release_x1();
}

void sub_10000E174(uint64_t a1)
{
  id v2 = +[GEOAPURLSessionConfig allSessionConfigTypes];
  id v3 = objc_alloc_init((Class)NSCache);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setCountLimit:", objc_msgSend(v2, "count"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setTotalCostLimit:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "countLimit"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v2;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(a1 + 32), "_sessionForType:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v10), "intValue"));
        [v11 getAllTasksWithCompletionHandler:&stru_100028B60];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v13 = *(void *)(a1 + 32);
  unint64_t v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = v15[2];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000E550;
  handler[3] = &unk_1000288E8;
  unint64_t v18 = v15;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  [*(id *)(a1 + 32) _clearExpired];
}

void sub_10000E3B8(id a1, NSArray *a2)
{
  id v2 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138412546;
    long long v13 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "state", v13);
        if ((unint64_t)v9 > 3) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = (uint64_t)*(&off_100028D18 + (void)v9);
        }
        int v11 = sub_1000051A4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          dispatch_source_t v12 = [v8 taskDescription];
          *(_DWORD *)buf = v13;
          uint64_t v19 = v10;
          __int16 v20 = 2112;
          long long v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "found %@ task with desc %@", buf, 0x16u);
        }
      }
      id v5 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

id sub_10000E550(uint64_t a1)
{
  id v2 = sub_1000051A4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "analytics upload timer fired", v4, 2u);
  }

  return [*(id *)(a1 + 32) _submitBatchesForUpload];
}

void sub_10000E5C4(id a1)
{
  qword_100033E00 = +[GEOAPPersistence sharedInstance];
  _objc_release_x1();
}

void sub_10000E760(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = sub_1000051A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "background task started; enqueuing work", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E880;
  block[3] = &unk_1000288E8;
  id v5 = *(NSObject **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v5, block);
  uint64_t v6 = sub_1000051A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "background task finished", buf, 2u);
  }

  [v3 setTaskCompleted];
}

void sub_10000E880(uint64_t a1)
{
  id v2 = _GEOCreateTransaction();
  id v3 = sub_1000051A4();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = objc_alloc_init((Class)NSDate);
  uint64_t v6 = sub_1000051A4();
  id v7 = v6;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AggregateAndUpload", "at '%@'", (uint8_t *)&v18, 0xCu);
  }

  id v8 = sub_1000051A4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "starting fqid counts aggregation", (uint8_t *)&v18, 2u);
  }

  sub_1000085E8();
  id v9 = (id *)objc_claimAutoreleasedReturnValue();
  sub_100008FC8(v9);

  uint64_t v10 = sub_1000051A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "finished fqid counts aggregation", (uint8_t *)&v18, 2u);
  }

  int v11 = sub_1000051A4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "starting netevent aggregation", (uint8_t *)&v18, 2u);
  }

  dispatch_source_t v12 = +[GEOAPNetEventAggregator sharedAggregator];
  [v12 runAggregation];

  long long v13 = sub_1000051A4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "finished netevent aggregation", (uint8_t *)&v18, 2u);
  }

  long long v14 = sub_1000051A4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "submitting batches for upload", (uint8_t *)&v18, 2u);
  }

  sub_10000EBCC(*(void *)(a1 + 32));
  long long v15 = sub_1000051A4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "finished submitting batches for upload", (uint8_t *)&v18, 2u);
  }

  long long v16 = sub_1000051A4();
  long long v17 = v16;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v4, "AggregateAndUpload", "at '%@'", (uint8_t *)&v18, 0xCu);
  }
}

void sub_10000EBCC(uint64_t a1)
{
  if (a1)
  {
    id v2 = sub_10000CCA8();
    BOOL v3 = sub_10000D148((BOOL)v2);

    if (!v3)
    {
      os_signpost_id_t v4 = *(NSObject **)(a1 + 8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000ECD8;
      block[3] = &unk_1000288E8;
      block[4] = a1;
      dispatch_async(v4, block);
    }
  }
}

id sub_10000ECD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUploadTimer];
}

void sub_10000F990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v61 - 176), 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FA4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FA5C(uint64_t a1)
{
}

uint64_t sub_10000FA64(void *a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [v3 expireTime];
  id v5 = [v4 compare:a1[4]];

  if (v5 == (id)-1)
  {
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
LABEL_9:
    uint64_t v18 = 1;
    goto LABEL_10;
  }
  ++*(void *)(*(void *)(a1[8] + 8) + 24);
  uint64_t v6 = [v3 logMsg];
  *(void *)(*(void *)(a1[9] + 8) + 24) += [v6 length];

  if (!*(void *)(*(void *)(a1[10] + 8) + 40))
  {
    uint64_t v7 = [v3 expireTime];
    uint64_t v8 = *(void *)(a1[10] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [v3 createTime];
    uint64_t v11 = *(void *)(a1[11] + 8);
    dispatch_source_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = a1[5];
  long long v14 = [v3 logMsg];
  LOBYTE(v13) = sub_10000D7D4(v13, v14);

  if (v13) {
    goto LABEL_9;
  }
  long long v15 = sub_1000051A4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = a1[6];
    uint64_t v17 = a1[12];
    int v20 = 138412546;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(%@) unable to write upload record for batch id %llu; stopping here",
      (uint8_t *)&v20,
      0x16u);
  }

  uint64_t v18 = 0;
LABEL_10:

  return v18;
}

uint64_t sub_10000FC34(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) timeIntervalSinceNow];
    double v3 = fmax(v2, 0.0);
    if (*(double *)(a1 + 120) < v3)
    {
      os_signpost_id_t v4 = sub_1000051A4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = (uint64_t)*(double *)(a1 + 120);
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        int v30 = 138413314;
        uint64_t v31 = v6;
        __int16 v32 = 2112;
        uint64_t v33 = v7;
        __int16 v34 = 2048;
        uint64_t v35 = v5;
        __int16 v36 = 2112;
        uint64_t v37 = v8;
        __int16 v38 = 2048;
        uint64_t v39 = (uint64_t)v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "(%@) %@ TTL (%ld) preferred over %@ (%ld)", (uint8_t *)&v30, 0x34u);
      }

      double v3 = *(double *)(a1 + 120);
    }
    id v9 = sub_1000051A4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 128);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v30 = 138413570;
      uint64_t v31 = v10;
      __int16 v32 = 2048;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      uint64_t v35 = v12;
      __int16 v36 = 2048;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      __int16 v40 = 2048;
      uint64_t v41 = (uint64_t)v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "(%@) upload batchId %llu is using uploading policy type '%@' : %lu messages of size %lu with TTL %ld", (uint8_t *)&v30, 0x3Eu);
    }

    long long v15 = sub_100010044(*(void *)(a1 + 128), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(unsigned int *)(a1 + 136), 0, *(void **)(a1 + 32));
    uint64_t v16 = +[GEOAPUtils GEOAPCachePath];
    uint64_t v17 = [v16 stringByAppendingPathComponent:v15];

    if ((sub_10000DC1C(*(void *)(a1 + 56), v17) & 1) == 0)
    {
      id v26 = sub_1000051A4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v28 = *(void *)(a1 + 128);
        int v30 = 138412546;
        uint64_t v31 = v27;
        __int16 v32 = 2048;
        uint64_t v33 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "(%@) unable to finalize and close upload file for batchId %llu; will try upload later",
          (uint8_t *)&v30,
          0x16u);
      }

      uint64_t v25 = 0;
      goto LABEL_19;
    }
    uint64_t v18 = *(void **)(a1 + 64);
    id v19 = +[NSURL fileURLWithPath:v17];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [v18 _startTaskForFile:v19 taskDescription:v15 analyticSessionType:GEOBatchAnalyticsSessionType() apURLsessionConfigType:*(unsigned int *)(a1 + 136) ttl:*(double *)(a1 + 120)];
  }
  else
  {
    long long v15 = sub_1000051A4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 128);
      int v30 = 138412546;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "(%@) nothing to upload for batchId %llu", (uint8_t *)&v30, 0x16u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
    return 1;
  }
  long long v15 = sub_1000051A4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 128);
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    int v30 = 138412802;
    uint64_t v31 = v22;
    __int16 v32 = 2048;
    uint64_t v33 = v23;
    __int16 v34 = 2048;
    uint64_t v35 = v24;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "(%@) batchId %llu had %llu expired records", (uint8_t *)&v30, 0x20u);
  }
  uint64_t v25 = 1;
LABEL_19:

  return v25;
}

id sub_100010044(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a7;
  [a4 timeIntervalSinceReferenceDate];
  long long v15 = +[NSString stringWithFormat:@"%@_%llu_%lu_%lu_%lu_%lu_%d_%@", @"GEOAPv5", a1, a6, a2, a3, (unint64_t)v14, a5, v13];

  return v15;
}

void sub_1000106A8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2)
  {
    id v11 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      sub_10001A628(v11, a10);
      JUMPOUT(0x100010640);
    }
    objc_end_catch();
    JUMPOUT(0x10001063CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1000107A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = sub_1000051A4();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = [*(id *)(a1 + 40) taskDescription];
    uint64_t v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v43 = 2112;
    id v44 = v6;
    uint64_t v7 = "upload failed for task '%@' : (%@)";
    uint64_t v8 = v3;
    uint32_t v9 = 22;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = [*(id *)(a1 + 40) taskDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    uint64_t v7 = "upload successful for task '%@'";
    uint64_t v8 = v3;
    uint32_t v9 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v7, buf, v9);

LABEL_7:
  uint64_t v10 = [*(id *)(a1 + 40) taskDescription];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  __int16 v38 = sub_100010C54;
  uint64_t v39 = &unk_100028CB0;
  id v40 = *(id *)(a1 + 32);
  int8x16_t v35 = *(int8x16_t *)(a1 + 40);
  id v11 = (id)v35.i64[0];
  int8x16_t v41 = vextq_s8(v35, v35, 8uLL);
  uint64_t v12 = v37;
  id v13 = [v10 componentsSeparatedByString:@"_"];
  if ([v10 hasPrefix:@"GEOAPv5"])
  {
    if ([v13 count] == (id)8)
    {
      id v14 = objc_alloc((Class)NSScanner);
      long long v15 = [v13 objectAtIndexedSubscript:1];
      id v16 = [v14 initWithString:v15];

      *(void *)buf = 0;
      [v16 scanUnsignedLongLong:buf];

      uint64_t v17 = [v13 objectAtIndexedSubscript:2];
      id v18 = [v17 integerValue];

      id v19 = [v13 objectAtIndexedSubscript:3];
      id v20 = [v19 integerValue];

      uint64_t v21 = [v13 objectAtIndexedSubscript:4];
      id v22 = [v21 integerValue];

      uint64_t v23 = [v13 objectAtIndexedSubscript:5];
      uint64_t v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v23 longLongValue]);

      uint64_t v25 = [v13 objectAtIndexedSubscript:6];
      id v26 = [v25 intValue];

      uint64_t v27 = [v13 objectAtIndexedSubscript:7];
      v38((uint64_t)v12, *(void *)buf, (unint64_t)v18, (uint64_t)v20, (uint64_t)v22, v24, (uint64_t)v26, v27);

      id v28 = v12;
LABEL_10:

      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10001A6F4();
    }
  }

  uint64_t v29 = sub_1000051A4();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    int v30 = [*(id *)(a1 + 40) taskDescription];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "unrecognized task description '%@'", buf, 0xCu);
  }
  [*(id *)(a1 + 40) cancel];
  uint64_t v31 = *(void **)(a1 + 48);
  __int16 v32 = [*(id *)(a1 + 40) taskDescription];
  uint64_t v10 = [v31 fileURLForTaskDescription:v32];

  uint64_t v33 = +[NSFileManager defaultManager];
  id v36 = 0;
  unsigned __int8 v34 = [v33 removeItemAtURL:v10 error:&v36];
  id v28 = v36;

  if ((v34 & 1) == 0)
  {
    id v13 = sub_1000051A4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v43 = 2112;
      id v44 = v28;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "remove %@ failed (%@)", buf, 0x16u);
    }
    goto LABEL_10;
  }
LABEL_11:
}

void sub_100010C54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8)
{
  id v15 = a6;
  id v16 = a8;
  uint64_t v17 = sub_1000051A4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v18 = @"unsuccessfully";
    if (!*(void *)(a1 + 32)) {
      CFStringRef v18 = @"successfully";
    }
    *(_DWORD *)buf = 138412546;
    id v138 = v16;
    __int16 v139 = 2112;
    uint64_t v140 = (uint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "(%@) upload stage finished %@", buf, 0x16u);
  }
  long long v122 = v15;

  if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
  {
    id v19 = +[GEOAPDebugPersistence sharedInstance];
    [v19 removeInflightUploadWithBatchUUID:v16];
  }
  uint64_t v20 = GEOBatchUploadPolicyType();
  uint64_t v21 = v20;
  uint64_t v106 = a5;
  if (v20 >= 0xC)
  {
    uint64_t v22 = +[NSString stringWithFormat:@"(unknown: %i)", v20];
  }
  else
  {
    uint64_t v22 = (uint64_t)*(&off_100028D38 + (int)v20);
  }
  uint64_t v105 = a4;
  uint64_t v23 = GEOBatchAnalyticsSessionType();
  uint64_t v24 = sub_1000051A4();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    if v23 < 0x14 && ((0xBFFFFu >> v23))
    {
      uint64_t v25 = *(&off_100028D98 + (int)v23);
    }
    else
    {
      uint64_t v25 = +[NSString stringWithFormat:@"(unknown: %i)", v23];
    }
    int v26 = GEOBatchOpaqueAppID();
    *(_DWORD *)buf = 138413314;
    id v138 = v16;
    __int16 v139 = 2048;
    uint64_t v140 = a2;
    __int16 v141 = 2112;
    uint64_t v142 = v22;
    __int16 v143 = 2112;
    uint64_t v144 = (uint64_t)v25;
    __int16 v145 = 1024;
    LODWORD(v146) = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "(%@) URL task complete for batchId:%llu -- %@ / %@ / %u", buf, 0x30u);
  }
  uint64_t v27 = *(void **)(a1 + 40);
  id v28 = [*(id *)(a1 + 48) taskDescription];
  uint64_t v29 = [v27 fileURLForTaskDescription:v28];

  v117 = (void *)v22;
  uint64_t v118 = a2;
  if (a7 >= 7)
  {
    uint64_t v30 = +[NSString stringWithFormat:@"(unknown: %i)", a7];
  }
  else
  {
    uint64_t v30 = (uint64_t)*(&off_100028E38 + (int)a7);
  }
  uint64_t v31 = +[GEOAPUploadPolicies sharedPolicies];
  __int16 v32 = [v31 uploadPolicyForUploadPolicyType:v21];

  v116 = v32;
  uint64_t v33 = [v32 uploadStages];
  unsigned __int8 v34 = (char *)[v33 count];
  if ((unint64_t)(v34 - 1) >= a3) {
    int8x16_t v35 = (char *)a3;
  }
  else {
    int8x16_t v35 = v34 - 1;
  }
  uint64_t v36 = (uint64_t)v35;
  uint64_t v37 = objc_msgSend(v33, "objectAtIndexedSubscript:");
  __int16 v38 = [v37 urlSessionConfig];
  unsigned int v114 = [v38 type];

  long long v121 = v16;
  v107 = (void *)v30;
  v110 = v33;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_38;
  }
  uint64_t v39 = sub_1000051A4();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v138 = v16;
    __int16 v139 = 2048;
    uint64_t v140 = v118;
    __int16 v141 = 2048;
    uint64_t v142 = v36;
    __int16 v143 = 2112;
    uint64_t v144 = v30;
    __int16 v145 = 2112;
    uint64_t v146 = v22;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "(%@) batchId:%llu -- upload stage %lu:%@ for %@ ended in error", buf, 0x34u);
  }

  if (v36 + 1 >= (unint64_t)[v33 count])
  {
LABEL_38:
    if (GEOConfigGetBOOL())
    {
      uint64_t v62 = *(void *)(a1 + 32);
      id v63 = objc_alloc((Class)NSString);
      uint64_t v64 = [v29 absoluteString];
      v65 = (void *)v64;
      CFStringRef v66 = @"fail";
      if (!v62) {
        CFStringRef v66 = @"success";
      }
      v67 = [v63 initWithFormat:@"%@-%@", v64, v66];

      id v68 = [objc_alloc((Class)NSURL) initWithString:v67];
      uint64_t v69 = +[NSFileManager defaultManager];
      [v69 moveItemAtURL:v29 toURL:v68 error:0];

      id v70 = 0;
    }
    else
    {
      double v71 = +[NSFileManager defaultManager];
      id v132 = 0;
      unsigned __int8 v72 = [v71 removeItemAtURL:v29 error:&v132];
      id v70 = v132;

      if (v72)
      {
        uint64_t v73 = v114;
LABEL_47:
        unsigned int v103 = v29;
        id v104 = v70;
        uint64_t v74 = v36;
        if (!v36)
        {
          v75 = [*(id *)(a1 + 40) persistence];
          [v75 clearPendingLogMsgElemsForBatchUploadWithBatchId:v118];

          uint64_t v74 = 0;
        }
        sub_10000524C(*(void *)(a1 + 40), v118);
        v83 = +[GEOReferenceTimeManager sharedManager];
        double v76 = [v83 bestReferenceDate];

        id v109 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        id v77 = [v109 component:32 fromDate:v76];
        uint64_t v78 = GEOBatchAnalyticsSessionType();
        v79 = +[NSNumber numberWithInt:v78];
        v80 = +[NSNumber numberWithInt:v73];
        v81 = +[NSNumber numberWithInt:*(void *)(a1 + 32) == 0];
        long long v120 = v76;
        [v76 timeIntervalSinceDate:v122];
        LODWORD(v83) = vcvtpd_u64_f64(v82);
        v84 = +[NSNumber numberWithUnsignedInt:v83];
        v123[0] = _NSConcreteStackBlock;
        v123[1] = 3221225472;
        v123[2] = sub_100011A24;
        v123[3] = &unk_100028C88;
        uint64_t v128 = v74;
        id v113 = v80;
        id v124 = v113;
        id v85 = v84;
        id v125 = v85;
        id v129 = v77;
        uint64_t v130 = v105;
        uint64_t v131 = v106;
        v86 = v81;
        v126 = v86;
        id v111 = v79;
        id v127 = v111;
        sub_10000BA68(@"com.apple.GEOAP.uploadEvent", v123);
        if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
        {
          v87 = +[GEOAPDebugPersistence sharedInstance];
          [v87 addUploadHistoryForBatchUUID:v121 completionTime:v76 latency:v83 sessionType:v78 eventCount:v105 uploadSize:v106 uploadPolicy:__PAIR64__(v74 stageNum:v114)];
        }
        CFStringRef v42 = v122;
        v51 = v103;
        v88 = v109;
        id v52 = v110;
        v60 = v120;
        v59 = v113;
        goto LABEL_52;
      }
      v67 = sub_1000051A4();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v138 = v16;
        __int16 v139 = 2112;
        uint64_t v140 = (uint64_t)v29;
        __int16 v141 = 2112;
        uint64_t v142 = (uint64_t)v70;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
      }
    }
    uint64_t v73 = v114;

    goto LABEL_47;
  }
  long long v119 = [v33 objectAtIndexedSubscript:v36 + 1];
  id v40 = [v119 urlSessionConfig];
  id v41 = [v40 type];

  [v116 ttl];
  CFStringRef v42 = v122;
  __int16 v43 = objc_msgSend(v122, "dateByAddingTimeInterval:");
  [v43 timeIntervalSinceNow];
  if (v44 <= 0.0)
  {
    uint64_t v61 = sub_1000051A4();
    id v16 = v121;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v138 = v121;
      __int16 v139 = 2048;
      uint64_t v140 = v36 + 1;
      __int16 v141 = 2112;
      uint64_t v142 = v30;
      __int16 v143 = 2048;
      uint64_t v144 = v118;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "(%@) upload stage %lu:%@ for batchId %llu exhausted the remaining TTL", buf, 0x2Au);
    }

    goto LABEL_38;
  }
  double v45 = v44;
  v108 = v43;
  sub_100010044(v118, v105, v106, v122, (uint64_t)v41, v36 + 1, v121);
  id v111 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = objc_msgSend(*(id *)(a1 + 40), "fileURLForTaskDescription:");
  uint64_t v47 = +[NSFileManager defaultManager];
  id v136 = 0;
  v48 = v29;
  v112 = (void *)v46;
  unsigned __int8 v49 = [v47 moveItemAtURL:v29 toURL:v46 error:&v136];
  id v50 = v136;

  if ((v49 & 1) == 0)
  {
    v89 = v50;
    v90 = sub_1000051A4();
    v51 = v48;
    v59 = v112;
    v60 = v119;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v138 = v121;
      __int16 v139 = 2112;
      uint64_t v140 = (uint64_t)v48;
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v112;
      __int16 v143 = 2112;
      uint64_t v144 = (uint64_t)v89;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "(%@) move %@ to %@ failed (%@)", buf, 0x2Au);
    }

    uint64_t v91 = +[NSFileManager defaultManager];
    id v92 = v89;
    id v135 = v89;
    unsigned __int8 v93 = [v91 removeItemAtURL:v51 error:&v135];
    id v58 = v135;

    id v52 = v110;
    if (v93) {
      goto LABEL_68;
    }
    v57 = sub_1000051A4();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v138 = v121;
      __int16 v139 = 2112;
      uint64_t v140 = (uint64_t)v51;
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
    }
    goto LABEL_67;
  }
  [v119 ttl];
  v51 = v48;
  id v52 = v110;
  if (v45 > v53)
  {
    id v54 = sub_1000051A4();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      [v119 ttl];
      *(_DWORD *)buf = 138413314;
      id v138 = v121;
      __int16 v139 = 2112;
      uint64_t v140 = (uint64_t)v107;
      __int16 v141 = 2048;
      uint64_t v142 = (uint64_t)v55;
      __int16 v143 = 2112;
      uint64_t v144 = v22;
      __int16 v145 = 2048;
      uint64_t v146 = (uint64_t)v45;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "(%@) %@ TTL (%ld) preferred over %@ (%ld)", buf, 0x34u);
    }

    [v119 ttl];
    double v45 = v56;
  }
  if ([*(id *)(a1 + 40) _startTaskForFile:v112 taskDescription:v111 analyticSessionType:v23 apURLsessionConfigType:v41 ttl:v45])
  {
    if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
    {
      v57 = +[GEOAPDebugPersistence sharedInstance];
      LODWORD(v102) = v36 + 1;
      [v57 addInflightUploadWithBatchUUID:v121 createTime:v122 sessionType:v23 eventCount:v105 uploadSize:v106 uploadPolicy:v41 stageNum:v102];
      id v58 = v50;
      v59 = v112;
      v60 = v119;
LABEL_67:

      goto LABEL_68;
    }
    id v58 = v50;
    v59 = v112;
    v60 = v119;
  }
  else
  {
    uint64_t v115 = v36;
    unsigned int v94 = sub_1000051A4();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v138 = v121;
      __int16 v139 = 2112;
      uint64_t v140 = (uint64_t)v107;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "(%@) starting stage %@ failed", buf, 0x16u);
    }

    unsigned int v95 = +[NSFileManager defaultManager];
    id v134 = v50;
    id v96 = v50;
    v59 = v112;
    unsigned __int8 v97 = [v95 removeItemAtURL:v112 error:&v134];
    id v58 = v134;

    v60 = v119;
    if ((v97 & 1) == 0)
    {
      v57 = sub_1000051A4();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v138 = v121;
        __int16 v139 = 2112;
        uint64_t v140 = (uint64_t)v112;
        __int16 v141 = 2112;
        uint64_t v142 = (uint64_t)v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
      }
      uint64_t v36 = v115;
      goto LABEL_67;
    }
    uint64_t v36 = v115;
  }
LABEL_68:
  v88 = v108;
  if (v36) {
    goto LABEL_53;
  }
  uint64_t v98 = [*(id *)(a1 + 40) persistence];
  [v98 clearPendingLogMsgElemsForBatchUploadWithBatchId:v118];

  v99 = +[NSFileManager defaultManager];
  id v133 = v58;
  unsigned __int8 v100 = [v99 removeItemAtURL:v51 error:&v133];
  id v101 = v133;

  if (v100)
  {
    id v58 = v101;
    v88 = v108;
    id v52 = v110;
    goto LABEL_53;
  }
  v86 = sub_1000051A4();
  id v52 = v110;
  id v104 = v101;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v138 = v121;
    __int16 v139 = 2112;
    uint64_t v140 = (uint64_t)v51;
    __int16 v141 = 2112;
    uint64_t v142 = (uint64_t)v101;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
  }
  v88 = v108;
LABEL_52:

  id v58 = v104;
LABEL_53:
}

id sub_100011A24(void *a1)
{
  v12[0] = @"attempt";
  uint64_t v2 = +[NSNumber numberWithUnsignedInteger:a1[8]];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v13[0] = v2;
  v13[1] = v3;
  v12[1] = @"config";
  v12[2] = @"duration";
  v13[2] = v4;
  v12[3] = @"hour";
  uint64_t v5 = +[NSNumber numberWithInteger:a1[9]];
  v13[3] = v5;
  v12[4] = @"num";
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:a1[10]];
  v13[4] = v6;
  v12[5] = @"size";
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a1[11]];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  v13[5] = v7;
  v13[6] = v8;
  v12[6] = @"success";
  v12[7] = @"type";
  v13[7] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

uint64_t sub_100011E68(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_100011EC4(id a1)
{
  qword_100033E10 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "Uploader");
  _objc_release_x1();
}

void sub_100011F5C(id a1)
{
  qword_100033E20 = objc_alloc_init(GEOAPDebugPersistence);
  _objc_release_x1();
}

uint64_t sub_1000120B0(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 24) = a2;
  }
  return result;
}

uint64_t sub_1000120BC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 24))
    {
      return 1;
    }
    else
    {
      uint64_t v2 = sub_10001214C();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "device has not been unlocked since last boot; can't proceed yet",
          v3,
          2u);
      }

      return *(unsigned char *)(v1 + 24) != 0;
    }
  }
  return result;
}

id sub_10001214C()
{
  if (qword_100033E38 != -1) {
    dispatch_once(&qword_100033E38, &stru_100029130);
  }
  id v0 = (void *)qword_100033E30;
  return v0;
}

BOOL sub_10001229C(id a1, GEOSQLiteDB *a2)
{
  uint64_t v2 = a2;
  if ([(GEOSQLiteDB *)v2 user_version] == (id)1)
  {
    if (!-[GEOSQLiteDB createTable:withDrop:](v2, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS uploadHistory (batchUUID STRING NOT NULL, uploadDoneTime DATETIME DEFAULT CURRENT_TIMESTAMP, uploadLatency INTEGER NOT NULL, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          0)
      || (-[GEOSQLiteDB createTable:withDrop:](v2, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS uploadInflight (batchUUID STRING NOT NULL, createTime DATETIME DEFAULT CURRENT_TIMESTAMP, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          0) & 1) == 0)
    {
      goto LABEL_17;
    }
  }
  else
  {
    if (!-[GEOSQLiteDB createTable:withDrop:](v2, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS uploadHistory (batchUUID STRING NOT NULL, uploadDoneTime DATETIME DEFAULT CURRENT_TIMESTAMP, uploadLatency INTEGER NOT NULL, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          "DROP TABLE uploadHistory;")
      || !-[GEOSQLiteDB createTable:withDrop:](v2, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS uploadInflight (batchUUID STRING NOT NULL, createTime DATETIME DEFAULT CURRENT_TIMESTAMP, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          "DROP TABLE uploadInflight;"))
    {
      goto LABEL_17;
    }
    [(GEOSQLiteDB *)v2 setUser_version:1];
  }
  if (!-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "INSERT INTO uploadHistory (batchUUID,uploadDoneTime,uploadLatency,sessionType,eventCount,uploadSize,uploadPolicy,stageNum) VALUES(@batchUUID, DATETIME( @uploadDoneTime, 'UNIXEPOCH') ,@uploadLatency,@sessionType,@eventCount,@uploadSize,@uploadPolicy,@stageNum);",
                        @"insUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "INSERT INTO uploadInflight (batchUUID,createTime,sessionType,eventCount,uploadSize,uploadPolicy,stageNum)VALUES(@batchUUID, DATETIME( @createTime, 'UNIXEPOCH') ,@sessionType,@eventCount,@uploadSize,@uploadPolicy,@stageNum);",
                        @"insIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "DELETE FROM uploadInflight WHERE batchUUID=@batchUUID;",
                        @"delIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "SELECT batchUUID,createTime,sessionType,eventCount,uploadSize,uploadPolicy,stageNum FROM uploadInflight;",
                        @"selIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "SELECT batchUUID,uploadLatency,sessionType,eventCount,uploadSize,uploadPolicy,stageNum, strftime('%s',uploadDoneTime) FROM uploadHistory WHERE uploadDoneTime >= DATETIME( @uploadDoneTime, 'UNIXEPOCH');",
                        @"selUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "DELETE FROM uploadHistory;",
                        @"delAllUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "SELECT COUNT(1) FROM uploadInflight;",
                        @"cntI"))
  {
LABEL_17:
    unsigned __int8 v3 = 0;
    goto LABEL_16;
  }
  unsigned __int8 v3 = -[GEOSQLiteDB prepareStatement:forKey:](v2, "prepareStatement:forKey:", "SELECT COUNT(1) FROM uploadHistory;",
                          @"cntH");
LABEL_16:

  return v3;
}

void sub_1000124EC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned __int8 v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

id sub_1000125B8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"delAllUH" statementBlock:&stru_100028F30];
}

BOOL sub_1000125D4(id a1, sqlite3_stmt *a2)
{
  return 1;
}

void sub_100012728(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_100012744(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unsigned __int8 v3 = sub_10001214C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "recording upload history for batch %@", buf, 0xCu);
    }

    uint64_t v5 = (void *)WeakRetained[1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012890;
    v8[3] = &unk_100028F58;
    void v8[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = v6;
    uint64_t v10 = v7;
    long long v11 = *(_OWORD *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 72);
    [v5 executeStatement:@"insUH" statementBlock:v8];
  }
}

id sub_100012890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v39 = 0;
  unsigned int v6 = [v5 bindTextParameter:"@batchUUID" toValue:v4 inStatement:a2 error:&v39];
  id v7 = v39;
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(a1 + 48);
  id v38 = v7;
  unsigned int v10 = [v8 bindInt64Parameter:"@uploadDoneTime" toValue:v9 inStatement:a2 error:&v38];
  id v11 = v38;

  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(unsigned int *)(a1 + 56);
  id v37 = v11;
  unsigned int v14 = [v12 bindInt64Parameter:"@uploadLatency" toValue:v13 inStatement:a2 error:&v37];
  id v7 = v37;

  if (!v14)
  {
LABEL_10:
    id v29 = 0;
    goto LABEL_9;
  }
  id v15 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v16 = *(unsigned int *)(a1 + 60);
  id v36 = v7;
  unsigned int v17 = [v15 bindIntParameter:"@sessionType" toValue:v16 inStatement:a2 error:&v36];
  id v11 = v36;

  if (!v17)
  {
LABEL_11:
    id v29 = 0;
    id v7 = v11;
    goto LABEL_9;
  }
  CFStringRef v18 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v19 = *(unsigned int *)(a1 + 64);
  id v35 = v11;
  unsigned int v20 = [v18 bindInt64Parameter:"@eventCount" toValue:v19 inStatement:a2 error:&v35];
  id v7 = v35;

  if (!v20) {
    goto LABEL_10;
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = *(unsigned int *)(a1 + 68);
  id v34 = v7;
  unsigned int v23 = [v21 bindInt64Parameter:"@uploadSize" toValue:v22 inStatement:a2 error:&v34];
  id v11 = v34;

  if (!v23) {
    goto LABEL_11;
  }
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v25 = *(unsigned int *)(a1 + 72);
  id v33 = v11;
  unsigned int v26 = [v24 bindIntParameter:"@uploadPolicy" toValue:v25 inStatement:a2 error:&v33];
  id v7 = v33;

  if (!v26) {
    goto LABEL_10;
  }
  uint64_t v27 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v28 = *(unsigned int *)(a1 + 76);
  id v32 = v7;
  id v29 = [v27 bindInt64Parameter:"@stageNum" toValue:v28 inStatement:a2 error:&v32];
  id v30 = v32;

  id v7 = v30;
LABEL_9:

  return v29;
}

void sub_100012BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012C0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012CD8;
    v7[3] = &unk_100028FA8;
    v7[4] = WeakRetained;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v5;
    uint64_t v9 = v6;
    long long v10 = *(_OWORD *)(a1 + 56);
    int v11 = *(_DWORD *)(a1 + 72);
    [v4 executeStatement:@"insIU" statementBlock:v7];
  }
}

id sub_100012CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v34 = 0;
  unsigned int v6 = [v5 bindTextParameter:"@batchUUID" toValue:v4 inStatement:a2 error:&v34];
  id v7 = v34;
  if (!v6) {
    goto LABEL_9;
  }
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(a1 + 48);
  id v33 = v7;
  unsigned int v10 = [v8 bindInt64Parameter:"@createTime" toValue:v9 inStatement:a2 error:&v33];
  id v11 = v33;

  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(unsigned int *)(a1 + 56);
  id v32 = v11;
  unsigned int v14 = [v12 bindIntParameter:"@sessionType" toValue:v13 inStatement:a2 error:&v32];
  id v7 = v32;

  if (!v14)
  {
LABEL_9:
    id v26 = 0;
    goto LABEL_8;
  }
  id v15 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v16 = *(unsigned int *)(a1 + 60);
  id v31 = v7;
  unsigned int v17 = [v15 bindInt64Parameter:"@eventCount" toValue:v16 inStatement:a2 error:&v31];
  id v11 = v31;

  if (!v17)
  {
LABEL_10:
    id v26 = 0;
    id v7 = v11;
    goto LABEL_8;
  }
  CFStringRef v18 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v19 = *(unsigned int *)(a1 + 64);
  id v30 = v11;
  unsigned int v20 = [v18 bindInt64Parameter:"@uploadSize" toValue:v19 inStatement:a2 error:&v30];
  id v7 = v30;

  if (!v20) {
    goto LABEL_9;
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = *(unsigned int *)(a1 + 68);
  id v29 = v7;
  unsigned int v23 = [v21 bindIntParameter:"@uploadPolicy" toValue:v22 inStatement:a2 error:&v29];
  id v11 = v29;

  if (!v23) {
    goto LABEL_10;
  }
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v25 = *(unsigned int *)(a1 + 72);
  id v28 = v11;
  id v26 = [v24 bindInt64Parameter:"@stageNum" toValue:v25 inStatement:a2 error:&v28];
  id v7 = v28;

LABEL_8:
  return v26;
}

void sub_100012FA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100012FBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013074;
    v5[3] = &unk_100028FF8;
    void v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    [v4 executeStatement:@"delIU" statementBlock:v5];
  }
}

id sub_100013074(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = 0;
  return [v3 bindTextParameter:"@batchUUID" toValue:v2 inStatement:a2 error:&v5];
}

void sub_1000131DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000131F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000132DC;
    v6[3] = &unk_100029048;
    uint64_t v5 = *(void *)(a1 + 56);
    v6[4] = WeakRetained;
    uint64_t v8 = v5;
    id v7 = *(id *)(a1 + 40);
    [v4 executeStatement:@"selUH" statementBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_1000132DC(void *a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1[4] + 8);
  uint64_t v5 = a1[6];
  id v10 = 0;
  [v4 bindInt64Parameter:"@uploadDoneTime" toValue:v5 inStatement:a2 error:&v10];
  id v9 = v10;
  while (sqlite3_step(a2) == 100)
  {
    id v6 = [*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:1 inStatment:a2];
    [*(id *)(a1[4] + 8) intForColumn:2 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:4 inStatment:a2];
    [*(id *)(a1[4] + 8) intForColumn:5 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:6 inStatment:a2];
    id v7 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)(uint64_t)objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 7, a2));
    (*(void (**)(void))(a1[5] + 16))(a1[5]);
  }
  return 1;
}

void sub_100013588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000135A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100013680;
    v9[3] = &unk_100029098;
    v9[4] = WeakRetained;
    id v10 = *(id *)(a1 + 40);
    [v4 executeStatement:@"selIU" statementBlock:v9];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, v6, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100013680(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) stringForColumn:0 inStatment:a2];
    id v5 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)(uint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "int64ForColumn:inStatment:", 1, a2));
    [*(id *)(*(void *)(a1 + 32) + 8) intForColumn:2 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:3 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:4 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) intForColumn:5 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:6 inStatment:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return 1;
}

void sub_1000138AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000138C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    int v9 = 0;
    uint64_t v4 = (void *)WeakRetained[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013A5C;
    v7[3] = &unk_1000290E8;
    v7[4] = v3;
    void v7[5] = v10;
    [v4 executeStatement:@"cntI" statementBlock:v7];
    id v5 = (void *)v3[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100013AC4;
    v6[3] = &unk_1000290E8;
    v6[4] = v3;
    void v6[5] = v8;
    [v5 executeStatement:@"cntH" statementBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    _Block_object_dispose(v8, 8);
    _Block_object_dispose(v10, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100013A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100013A5C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return v4 == 100;
}

BOOL sub_100013AC4(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return v4 == 100;
}

void sub_100013B70(id a1)
{
  qword_100033E30 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "DebugPersistence");
  _objc_release_x1();
}

void sub_100013BB4(id a1)
{
  qword_100033E40 = objc_alloc_init(GEOAPPersistence);
  _objc_release_x1();
}

uint64_t sub_100013D1C(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 32) = a2;
  }
  return result;
}

uint64_t sub_100013E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "user_version") == (id)10)
  {
    if (!objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS analytics (msgid INTEGER PRIMARY KEY AUTOINCREMENT, createtime DATETIME DEFAULT CURRENT_TIMESTAMP, expiretime DATETIME, batchid INTEGER NOT NULL, analytic BLOB NOT NULL);",
                          0)
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS inflight (fk_msgid INTEGER PRIMARY KEY, up_time DATETIME DEFAULT CURRENT_TIMESTAMP);",
                          0)
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shadow (analytic BLOB NOT NULL, COL_TYPE INT NOT NULL, createtime DATETIME DEFAULT CURRENT_TIMESTAMP);",
                          0)
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailysettings (msgid INTEGER PRIMARY KEY AUTOINCREMENT, settings_data BLOB NOT NULL, createtime DATETIME NOT NULL);",
                          0)
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          0)
      || (objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS monthlycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          0) & 1) == 0)
    {
      goto LABEL_40;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS analytics (msgid INTEGER PRIMARY KEY AUTOINCREMENT, createtime DATETIME DEFAULT CURRENT_TIMESTAMP, expiretime DATETIME, batchid INTEGER NOT NULL, analytic BLOB NOT NULL);",
                          "DROP TABLE analytics;")
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS inflight (fk_msgid INTEGER PRIMARY KEY, up_time DATETIME DEFAULT CURRENT_TIMESTAMP);",
                          "DROP TABLE inflight;")
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shadow (analytic BLOB NOT NULL, COL_TYPE INT NOT NULL, createtime DATETIME DEFAULT CURRENT_TIMESTAMP);",
                          "DROP TABLE shadow;")
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailysettings (msgid INTEGER PRIMARY KEY AUTOINCREMENT, settings_data BLOB NOT NULL, createtime DATETIME NOT NULL);",
                          "DROP TABLE dailysettings;")
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          "DROP TABLE dailycounts;")
      || !objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS monthlycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          "DROP TABLE monthlycounts;"))
    {
      goto LABEL_40;
    }
    objc_msgSend(v3, "setUser_version:", 10);
  }
  if (!objc_msgSend(v3, "prepareStatement:forKey:", "INSERT INTO analytics (batchid,expiretime,analytic)VALUES (@batchid, DATETIME( @expiretime, 'UNIXEPOCH') ,@analytic);",
                        @"insA")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "INSERT INTO inflight (fk_msgid) VALUES (@fk_msgid);",
                        @"insI")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "INSERT INTO dailysettings (settings_data, createtime) VALUES (@settings_data, DATETIME( @createtime, 'UNIXEPOCH'));",
                        @"insDS")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "INSERT INTO dailycounts (count_type,app_id,createtime,usage_string,usage_BOOL) VALUES (@count_type,@app_id, DATETIME( @createtime, 'UNIXEPOCH'), @usage_string,@usage_BOOL);",
                        @"insDC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "INSERT INTO monthlycounts (count_type,app_id,createtime,usage_string,usage_BOOL) VALUES (@count_type,@app_id, DATETIME( @createtime, 'UNIXEPOCH'), @usage_string,@usage_BOOL);",
                        @"insMC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT batchid FROM analytics WHERE batchid NOT IN(SELECT batchid FROM analytics,inflight WHERE msgid = fk_msgid GROUP BY batchid)GROUP BY batchid;",
                        @"availB")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM analytics WHERE expiretime <=  DATETIME( @expiretime, 'UNIXEPOCH')  AND batchid = @batchid;",
                        @"delX")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT msgid,batchid,analytic, strftime('%s',expiretime), strftime('%s',createtime) FROM analytics WHERE msgid NOT IN(SELECT fk_msgid FROM inflight)  AND batchid = @batchid;",
                        @"nextBP")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT msgid, settings_data, strftime('%s',createtime) FROM dailysettings;",
                        @"qryDS")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT msgid,count_type, app_id, usage_string, usage_BOOL, strftime('%s',createtime) FROM dailycounts;",
                        @"qryDC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT msgid,count_type, app_id, usage_string, usage_BOOL, strftime('%s',createtime) FROM monthlycounts;",
                        @"qryMC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM analytics WHERE batchid = @batchid AND msgid IN (SELECT fk_msgid FROM inflight);",
                        @"delBP")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM dailysettings WHERE msgid <= @msgid;",
                        @"delDS")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM dailycounts WHERE msgid <= @msgid;",
                        @"delDC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM monthlycounts WHERE msgid <= @msgid;",
                        @"delMC")
    || !objc_msgSend(v3, "prepareStatement:forKey:", "DELETE FROM inflight WHERE fk_msgid NOT IN (SELECT msgid FROM analytics);",
                        @"cleanB")
    || ![v3 prepareStatement:"DELETE FROM analytics;" forKey:@"nuke"]
    || ![v3 prepareStatement:"SELECT COUNT(1) FROM analytics;" forKey:@"count"]
    || ![v3 prepareStatement:"SELECT changes();" forKey:@"chng"]
    || !objc_msgSend(v3, "prepareStatement:forKey:", "SELECT DISTINCT batchid FROM analytics;",
                        @"sfd"))
  {
LABEL_40:
    uint64_t v5 = 0;
    goto LABEL_39;
  }
  int v4 = *(unsigned char **)(a1 + 32);
  if (v4[16]) {
    [v4 _setupEvalStmtsOnDb:v3];
  }
  uint64_t v5 = 1;
LABEL_39:

  return v5;
}

void sub_1000142D8(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "prepareStatement:forKey:", "INSERT INTO shadow (analytic,COL_TYPE,createtime) VALUES(@analytic,@type, DATETIME( @createtime, 'UNIXEPOCH', 'SUBSEC'))", @"insS"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "prepareStatement:forKey:", "SELECT analytic,COL_TYPE, strftime('%s',createtime, 'SUBSEC') FROM shadow;",
                          @"show") & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "prepareStatement:forKey:", "DELETE FROM shadow;",
                            @"flush") & 1) == 0)
      {
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
        if (v18) {
          sub_10001A73C(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }
    else
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v10) {
        sub_10001A778(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v2) {
      sub_10001A7B4(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

id sub_10001445C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

id sub_100014468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) createTime];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
  id v19 = 0;
  unsigned int v8 = [v7 bindInt64Parameter:"@type" toValue:1 inStatement:a2 error:&v19];
  id v9 = v19;
  if (v8)
  {
    BOOL v10 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = [*(id *)(a1 + 32) logMsg];
    id v18 = v9;
    unsigned int v12 = [v10 bindBlobParameter:"@analytic" toValue:v11 inStatement:a2 error:&v18];
    id v13 = v18;

    if (v12)
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8);
      id v17 = v13;
      id v15 = [v14 bindRealParameter:"@createtime" toValue:a2 inStatement:&v17 error:v6];
      id v9 = v17;
    }
    else
    {
      id v15 = 0;
      id v9 = v13;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t sub_10001464C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) createTime];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = [*(id *)(a1 + 32) appId];
  id v34 = 0;
  unsigned int v9 = [v7 bindTextParameter:"@app_id" toValue:v8 inStatement:a2 error:&v34];
  id v10 = v34;

  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 8);
  id v33 = v10;
  unsigned int v12 = [v11 bindInt64Parameter:"@createtime" toValue:(uint64_t)v6 inStatement:a2 error:&v33];
  id v13 = v33;

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8);
  id v15 = [*(id *)(a1 + 32) countType];
  id v32 = v13;
  unsigned int v16 = [v14 bindIntParameter:"@count_type" toValue:v15 inStatement:a2 error:&v32];
  id v10 = v32;

  if (v16)
  {
    id v17 = [*(id *)(a1 + 32) usageString];

    id v18 = *(void **)(*(void *)(a1 + 40) + 8);
    if (v17)
    {
      id v19 = [*(id *)(a1 + 32) usageString];
      id v31 = v10;
      unsigned __int8 v20 = [v18 bindTextParameter:"@usage_string" toValue:v19 inStatement:a2 error:&v31];
      id v13 = v31;

      if (v20) {
        goto LABEL_6;
      }
    }
    else
    {
      id v30 = v10;
      unsigned int v26 = [v18 bindNullParameter:"@usage_string" inStatement:a2 error:&v30];
      id v13 = v30;

      if (v26)
      {
LABEL_6:
        uint64_t v21 = [*(id *)(a1 + 32) usageBool];

        uint64_t v22 = *(void **)(*(void *)(a1 + 40) + 8);
        if (v21)
        {
          uint64_t v23 = [*(id *)(a1 + 32) usageBool];
          id v29 = v13;
          unsigned __int8 v24 = objc_msgSend(v22, "bindIntParameter:toValue:inStatement:error:", "@usage_BOOL", objc_msgSend(v23, "BOOLValue"), a2, &v29);
          id v10 = v29;

          if ((v24 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
          id v28 = v13;
          uint64_t v25 = (uint64_t)[v22 bindNullParameter:"@usage_BOOL" inStatement:a2 error:&v28];
          id v10 = v28;

          if (!v25) {
            goto LABEL_13;
          }
        }
        uint64_t v25 = 1;
        goto LABEL_13;
      }
    }
LABEL_10:
    uint64_t v25 = 0;
    id v10 = v13;
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v25 = 0;
LABEL_13:

  return v25;
}

id sub_100014A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) createTime];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = [*(id *)(a1 + 32) settings];
  unsigned int v9 = [v8 data];
  id v17 = 0;
  unsigned int v10 = [v7 bindBlobParameter:"@settings_data" toValue:v9 inStatement:a2 error:&v17];
  id v11 = v17;

  if (v10)
  {
    unsigned int v12 = *(void **)(*(void *)(a1 + 40) + 8);
    id v16 = v11;
    id v13 = [v12 bindInt64Parameter:"@createtime" toValue:(uint64_t)v6 inStatement:a2 error:&v16];
    id v14 = v16;

    id v11 = v14;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id sub_100014BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v14 = 0;
  unsigned int v5 = [v4 bindInt64Parameter:"@type" toValue:2 inStatement:a2 error:&v14];
  id v6 = v14;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    unsigned int v8 = *(void **)(*(void *)(a1 + 32) + 8);
    unsigned int v9 = [v7 rrLogData];
    id v13 = v6;
    id v10 = [v8 bindBlobParameter:"@analytic" toValue:v9 inStatement:a2 error:&v13];
    id v11 = v13;

    id v6 = v11;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_100014DA8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014E5C;
  v5[3] = &unk_1000292B0;
  uint64_t v4 = *(void *)(a1 + 56);
  void v5[4] = v2;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v3 executeInTransaction:v5];
}

id sub_100014E5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014F20;
  v7[3] = &unk_100029288;
  uint64_t v4 = *(void *)(a1 + 56);
  v7[4] = v2;
  uint64_t v10 = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = [v3 statementForKey:@"nextBP" statementBlock:v7];

  return v5;
}

uint64_t sub_100014F20(void *a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1[4] + 8);
  uint64_t v5 = a1[7];
  id v18 = 0;
  [v4 bindInt64Parameter:"@batchid" toValue:v5 inStatement:a2 error:&v18];
  id v16 = v18;
  if (sqlite3_step(a2) == 100)
  {
    while (1)
    {
      id v6 = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2, v16);
      id v7 = [*(id *)(a1[4] + 8) int64ForColumn:1 inStatment:a2];
      id v8 = [*(id *)(a1[4] + 8) blobForColumn:2 inStatment:a2];
      id v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:4 inStatment:a2]);
      uint64_t v10 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2]);
      id v11 = [[GEOAPLogMsgQueueElem alloc] initWithLogMsg:v8 uploadBatchId:v7 expireTime:v10 createTime:v9];
      if (!(*(unsigned int (**)(void))(a1[5] + 16))()) {
        break;
      }
      uint64_t v12 = a1[4];
      id v13 = *(void **)(v12 + 8);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100015154;
      v17[3] = &unk_100029260;
      void v17[4] = v12;
      v17[5] = v6;
      [v13 executeStatement:@"insI" statementBlock:v17];

      if (sqlite3_step(a2) != 100) {
        goto LABEL_6;
      }
    }
  }
LABEL_6:
  uint64_t v14 = (*(uint64_t (**)(void))(a1[6] + 16))();

  return v14;
}

id sub_100015154(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = 0;
  return [v3 bindInt64Parameter:"@fk_msgid" toValue:v2 inStatement:a2 error:&v5];
}

void sub_100015328(uint64_t a1)
{
  uint64_t v2 = sub_1000051F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "executeSync", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015440;
  v5[3] = &unk_100029350;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 64);
  [v4 executeInTransaction:v5];
}

uint64_t sub_100015440(uint64_t a1)
{
  uint64_t v2 = sub_1000051F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "executeTransaction", buf, 2u);
  }

  *(void *)buf = 0;
  id v16 = buf;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v3 + 8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000155E8;
  v12[3] = &unk_100029300;
  v12[4] = v3;
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = buf;
  [v5 statementForKey:v4 statementBlock:v12];
  if (*((void *)v16 + 3))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    uint64_t v8 = *(void *)(a1 + 48);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015890;
    v11[3] = &unk_100029328;
    v11[4] = v6;
    v11[5] = buf;
    [v7 executeStatement:v8 statementBlock:v11];
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }

  _Block_object_dispose(buf, 8);
  return 1;
}

void sub_1000155D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000155E8(void *a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sub_1000051F8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v19 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "stmtforkey %p", buf, 0xCu);
  }

  if (sqlite3_step(a2) == 100)
  {
    *(void *)&long long v5 = 138412290;
    long long v17 = v5;
    while (1)
    {
      id v6 = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2, v17);
      id v7 = [*(id *)(a1[4] + 8) intForColumn:1 inStatment:a2];
      uint64_t v8 = [*(id *)(a1[4] + 8) stringForColumn:2 inStatment:a2];
      uint64_t v9 = [*(id *)(a1[4] + 8) stringForColumn:3 inStatment:a2];
      uint64_t v10 = [*(id *)(a1[4] + 8) stringForColumn:4 inStatment:a2];
      id v11 = v10;
      if (v10)
      {
        uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
      }
      else
      {
        uint64_t v12 = 0;
      }
      +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:5 inStatment:a2]);
      id v13 = (sqlite3_stmt *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = sub_1000051F8();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v17;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "select elem with create time %@", buf, 0xCu);
      }

      id v15 = [[GEOAPDailyCountsQueueElem alloc] initWithType:v7 usageString:v9 usageBool:v12 appId:v8 createTime:v13];
      if (!(*(unsigned int (**)(void))(a1[5] + 16))()) {
        break;
      }
      *(void *)(*(void *)(a1[6] + 8) + 24) = v6;

      if (sqlite3_step(a2) != 100) {
        return 1;
      }
    }
  }
  return 1;
}

id sub_100015890(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(*(void *)(v2 + 8) + 24);
  uint64_t v6 = 0;
  return [v3 bindInt64Parameter:"@msgid" toValue:v4 inStatement:a2 error:&v6];
}

uint64_t sub_1000159A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015A78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015B24;
  v4[3] = &unk_1000293C8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 executeInTransaction:v4];
}

uint64_t sub_100015B24(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015C90;
  v9[3] = &unk_100029300;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  id v11 = &v12;
  [v3 statementForKey:@"qryDS" statementBlock:v9];
  if (v13[3])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015DD8;
    void v8[3] = &unk_100029328;
    void v8[4] = v4;
    void v8[5] = &v12;
    [v5 executeStatement:@"delDS" statementBlock:v8];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }

  _Block_object_dispose(&v12, 8);
  return 1;
}

void sub_100015C78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015C90(void *a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100)
  {
    while (1)
    {
      id v4 = [*(id *)(a1[4] + 8) int64ForColumn:0 inStatment:a2];
      id v5 = [*(id *)(a1[4] + 8) blobForColumn:1 inStatment:a2];
      id v6 = [objc_alloc((Class)GEOLogMsgEventPeriodicSettingsSummary) initWithData:v5];
      id v7 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:2 inStatment:a2]);
      uint64_t v8 = [[GEOAPDailySettingsQueueElem alloc] initWithSettings:v6 createTime:v7];
      if (!(*(unsigned int (**)(void))(a1[5] + 16))()) {
        break;
      }
      *(void *)(*(void *)(a1[6] + 8) + 24) = v4;

      if (sqlite3_step(a2) != 100) {
        return 1;
      }
    }
  }
  return 1;
}

id sub_100015DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(*(void *)(v2 + 8) + 24);
  uint64_t v6 = 0;
  return [v3 bindInt64Parameter:"@msgid" toValue:v4 inStatement:a2 error:&v6];
}

void sub_100015EF0(void *a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 8);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000161B8;
  v27[3] = &unk_100028FF8;
  v27[4] = v3;
  id v5 = v2;
  id v28 = v5;
  [v4 statementForKey:@"sfd" statementBlock:v27];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedLongLongValue];
        uint64_t v10 = a1[4];
        id v11 = *(void **)(v10 + 8);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100016250;
        v22[3] = &unk_100029418;
        uint64_t v12 = a1[6];
        v22[4] = v10;
        v22[5] = v12;
        v22[6] = v9;
        [v11 executeStatement:@"delX" statementBlock:v22];
        uint64_t v18 = 0;
        id v19 = &v18;
        uint64_t v20 = 0x2020000000;
        uint64_t v21 = 0;
        uint64_t v13 = a1[4];
        uint64_t v14 = *(void **)(v13 + 8);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000162EC;
        v17[3] = &unk_1000290E8;
        void v17[4] = v13;
        v17[5] = &v18;
        [v14 statementForKey:@"chng" statementBlock:v17];
        if (v19[3])
        {
          uint64_t v15 = a1[5];
          if (v15) {
            (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);
          }
        }
        _Block_object_dispose(&v18, 8);
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
  }
}

void sub_100016198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000161B8(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
    id v5 = *(void **)(a1 + 40);
    id v6 = +[NSNumber numberWithUnsignedLongLong:v4];
    [v5 addObject:v6];
  }
  return 1;
}

uint64_t sub_100016250(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[5];
  id v5 = *(void **)(a1[4] + 8);
  id v12 = 0;
  [v5 bindInt64Parameter:"@expiretime" toValue:v4 inStatement:a2 error:&v12];
  id v6 = v12;
  uint64_t v7 = *(void **)(a1[4] + 8);
  uint64_t v8 = a1[6];
  id v11 = v6;
  [v7 bindInt64Parameter:"@batchid" toValue:v8 inStatement:a2 error:&v11];
  id v9 = v11;

  return 1;
}

uint64_t sub_1000162EC(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return 1;
}

id sub_1000163CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100016448;
  v5[3] = &unk_100029488;
  uint64_t v3 = *(void *)(a1 + 40);
  void v5[4] = v1;
  void v5[5] = v3;
  return [v2 executeInTransaction:v5];
}

uint64_t sub_100016448(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000164F4;
  v6[3] = &unk_100029260;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = v2;
  void v6[5] = v4;
  [v3 executeStatement:@"delBP" statementBlock:v6];
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"cleanB" statementBlock:&stru_100029460];
  return 1;
}

uint64_t sub_1000164F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = 0;
  [v3 bindInt64Parameter:"@batchid" toValue:v2 inStatement:a2 error:&v5];
  return 1;
}

BOOL sub_100016534(id a1, sqlite3_stmt *a2)
{
  return 1;
}

id sub_1000165C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"nuke" statementBlock:&stru_1000294A8];
}

BOOL sub_1000165DC(id a1, sqlite3_stmt *a2)
{
  return 1;
}

id sub_100016688(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailysettings (msgid INTEGER PRIMARY KEY AUTOINCREMENT, settings_data BLOB NOT NULL, createtime DATETIME NOT NULL);",
    "DROP TABLE dailysettings;");
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return objc_msgSend(v2, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
           "DROP TABLE dailycounts;");
}

uint64_t sub_100017234(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupEvalStmtsOnDb:*(void *)(*(void *)(a1 + 32) + 8)];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[0];
  uint64_t v4 = GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[1];
  return _GEOConfigSetBOOL(v3, v4, v2);
}

id sub_100017300(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupEvalStmtsOnDb:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 executeStatement:@"flush" statementBlock:&stru_1000294F0];
}

BOOL sub_100017354(id a1, sqlite3_stmt *a2)
{
  return 1;
}

void sub_1000174C8(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupEvalStmtsOnDb:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017574;
  v4[3] = &unk_100029098;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  [v3 statementForKey:@"show" statementBlock:v4];
}

uint64_t sub_100017574(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100)
  {
    *(void *)&long long v4 = 134217984;
    long long v10 = v4;
    do
    {
      id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "blobForColumn:inStatment:", 0, a2, v10);
      unint64_t v6 = (unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:1 inStatment:a2];
      [*(id *)(*(void *)(a1 + 32) + 8) doubleForColumn:2 inStatment:a2];
      uint64_t v7 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
      if (v6 > 2) {
        unint64_t v6 = 1;
      }
      uint64_t v8 = sub_1000051F8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v10;
        unint64_t v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "data type %lld", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    while (sqlite3_step(a2) == 100);
  }
  return 1;
}

void sub_1000176F8(id a1)
{
  qword_100033E58 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "Persistence");
  _objc_release_x1();
}

void sub_10001773C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100017758(id a1)
{
  qword_100033E70 = objc_alloc_init(GEOAPStorage);
  _objc_release_x1();
}

id sub_100017968(uint64_t a1)
{
  uint64_t v2 = sub_100004B10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "upload timer fired", v4, 2u);
  }

  [*(id *)(a1 + 32) _clearUploadTimer];
  [*(id *)(a1 + 32) _flushRemainderToDB];
  return [*(id *)(a1 + 32) _initiateCollationAndUpload];
}

void sub_1000179EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = v3;
  if (a1)
  {
    id v5 = v3;
    geo_isolate_sync();
  }
}

id sub_100017A90(uint64_t a1)
{
  uint64_t v2 = sub_100004B10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "registering eval observer %p", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 64) addObject:*(void *)(a1 + 32)];
}

void sub_100017B44(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = v3;
  if (a1)
  {
    id v5 = v3;
    geo_isolate_sync();
  }
}

id sub_100017BE8(uint64_t a1)
{
  uint64_t v2 = sub_100004B10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "deregistering eval observer %p", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 64) removeObject:*(void *)(a1 + 32)];
}

void sub_100017E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017E4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017E5C(uint64_t a1)
{
}

uint64_t sub_100017E64(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
  return _objc_release_x1();
}

void sub_100017F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017FA0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
  return _objc_release_x1();
}

void sub_100017FE8(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = sub_100004B10();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 logMsg:*(void *)(a1 + 40)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_10001850C(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = sub_100004B10();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 dailyUsageActionType:*(unsigned int *)(a1 + 64) usageString:*(void *)(a1 + 40) usageBool:*(void *)(a1 + 48) appId:*(void *)(a1 + 56)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_100018680(unsigned char *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    id v16 = a7;
    id v17 = a6;
    uint64_t v18 = sub_100004B10();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = @"UNKNOWN_EVENT";
      switch((int)a2)
      {
        case 0:
          break;
        case 1:
          id v19 = @"ACCIDENT_CONFIRMATION";
          break;
        case 2:
          id v19 = @"ACCIDENT_SUBMISSION";
          break;
        case 3:
          id v19 = @"ADD_LICENSE_PLATE";
          break;
        case 4:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
          break;
        case 5:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
          break;
        case 6:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
          break;
        case 7:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
          break;
        case 8:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
          break;
        case 9:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
          break;
        case 10:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
          break;
        case 11:
          id v19 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
          break;
        case 12:
          id v19 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
          break;
        case 13:
          id v19 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
          break;
        case 14:
          id v19 = @"ANNOUNCEMENT_TAPPED_GENERAL";
          break;
        case 15:
          id v19 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
          break;
        case 16:
          id v19 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
          break;
        case 17:
          id v19 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
          break;
        case 18:
          id v19 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
          break;
        case 19:
          id v19 = @"ANNOUNCEMENT_TAPPED_VENUES";
          break;
        case 20:
          id v19 = @"APP_CLIP_USED";
          break;
        case 21:
          id v19 = @"AR_MODE_ENTER";
          break;
        case 22:
          id v19 = @"AUTOCOMPLETE_RESULTS_SHOWN";
          break;
        case 23:
          id v19 = @"CARPLAY_CONNECTED";
          break;
        case 24:
          id v19 = @"COARSE_LOCATION_USED";
          break;
        case 25:
          id v19 = @"COLLECTION_CREATED";
          break;
        case 26:
          id v19 = @"COLLECTION_ITEM_TAPPED";
          break;
        case 27:
          id v19 = @"COLLECTION_SHARED";
          break;
        case 28:
          id v19 = @"COLLECTION_SHOWN";
          break;
        case 29:
          id v19 = @"CURATED_COLLECTION_ITEM_TAPPED";
          break;
        case 30:
          id v19 = @"CURATED_COLLECTION_REMOVED";
          break;
        case 31:
          id v19 = @"CURATED_COLLECTION_SAVED";
          break;
        case 32:
          id v19 = @"CURATED_COLLECTION_SHARED";
          break;
        case 33:
          id v19 = @"CURATED_COLLECTION_SHOWN";
          break;
        case 34:
          id v19 = @"DEVICE_CONNECTED";
          break;
        case 35:
          id v19 = @"DIRECTIONS";
          break;
        case 36:
          id v19 = @"DIRECTIONS_REQUESTED_CYCLING";
          break;
        case 37:
          id v19 = @"DIRECTIONS_REQUESTED_DRIVING";
          break;
        case 38:
          id v19 = @"DIRECTIONS_REQUESTED_EBIKE";
          break;
        case 39:
          id v19 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
          break;
        case 40:
          id v19 = @"DIRECTIONS_REQUESTED_TRANSIT";
          break;
        case 41:
          id v19 = @"DIRECTIONS_REQUESTED_WALKING";
          break;
        case 42:
          id v19 = @"DIRECTIONS_SAFARI";
          break;
        case 43:
          id v19 = @"DIRECTIONS_SIRI_PLACECARD";
          break;
        case 44:
          id v19 = @"DIRECTIONS_SPOTLIGHT";
          break;
        case 45:
          id v19 = @"ENTER_MAPS_CARPLAY";
          break;
        case 46:
          id v19 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 47:
          id v19 = @"ETA_RECEIVED";
          break;
        case 48:
          id v19 = @"ETA_SHARED";
          break;
        case 49:
          id v19 = @"FAVORITE_ADD_PLACE";
          break;
        case 50:
          id v19 = @"FAVORITE_TAP_LIST_ITEM";
          break;
        case 51:
          id v19 = @"FLYOVER_FOREGROUNDED";
          break;
        case 52:
          id v19 = @"INCIDENT_SUBMISSION";
          break;
        case 53:
          id v19 = @"LOOK_AROUND_FOREGROUNDED";
          break;
        case 54:
          id v19 = @"LOOK_AROUND_SHARED";
          break;
        case 55:
          id v19 = @"MAPSHOME_GET_DIRECTIONS";
          break;
        case 56:
          id v19 = @"MAPS_HANDOFF_FROM_IPAD";
          break;
        case 57:
          id v19 = @"MAPS_HANDOFF_FROM_MAC";
          break;
        case 58:
          id v19 = @"MAPS_HANDOFF_FROM_PHONE";
          break;
        case 59:
          id v19 = @"MAPS_HANDOFF_FROM_WATCH";
          break;
        case 60:
          id v19 = @"MAP_VIEW_FOREGROUNDED";
          break;
        case 61:
          id v19 = @"NAV_SESSION_COARSE_LOCATION";
          break;
        case 62:
          id v19 = @"NAV_SESSION_PRECISE_LOCATION";
          break;
        case 63:
          id v19 = @"NAV_STARTED_CARPLAY";
          break;
        case 64:
          id v19 = @"NAV_STARTED_CYCLING";
          break;
        case 65:
          id v19 = @"NAV_STARTED_DRIVING";
          break;
        case 66:
          id v19 = @"NAV_STARTED_EBIKE";
          break;
        case 67:
          id v19 = @"NAV_STARTED_EV_ROUTING";
          break;
        case 68:
          id v19 = @"NAV_STARTED_JUNCTION_VIEW";
          break;
        case 69:
          id v19 = @"NAV_STARTED_LANE_GUIDANCE";
          break;
        case 70:
          id v19 = @"NAV_STARTED_TRANSIT";
          break;
        case 71:
          id v19 = @"NAV_STARTED_WALKING";
          break;
        case 72:
          id v19 = @"OPEN_INDOOR_MAP";
          break;
        case 73:
          id v19 = @"OTHER_GET_DIRECTIONS";
          break;
        case 74:
          id v19 = @"PLACECARD_GET_DIRECTIONS";
          break;
        case 75:
          id v19 = @"PLACECARD_RICH_DATA_USED";
          break;
        case 76:
          id v19 = @"PLACECARD_SHARED";
          break;
        case 77:
          id v19 = @"PLACECARD_SHOWN";
          break;
        case 78:
          id v19 = @"PLACECARD_SHOWN_SAFARI";
          break;
        case 79:
          id v19 = @"PLACECARD_SHOWN_SIRI";
          break;
        case 80:
          id v19 = @"PLACECARD_SHOWN_SPOTLIGHT";
          break;
        case 81:
          id v19 = @"PLACECARD_START_NAV";
          break;
        case 82:
          id v19 = @"PROMINENT_GET_DIRECTIONS";
          break;
        case 83:
          id v19 = @"RAP_STARTED";
          break;
        case 84:
          id v19 = @"RIDESHARE_REQUESTED";
          break;
        case 85:
          id v19 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
          break;
        case 86:
          id v19 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
          break;
        case 87:
          id v19 = @"SEARCH_RECENT_SEARCHES_TAPPED";
          break;
        case 88:
          id v19 = @"SEARCH_RESULTS_SHOWN_MAPS";
          break;
        case 89:
          id v19 = @"SEARCH_RESULTS_SHOWN_SAFARI";
          break;
        case 90:
          id v19 = @"SEARCH_RESULTS_SHOWN_SIRI";
          break;
        case 91:
          id v19 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
          break;
        case 92:
          id v19 = @"SEARCH_RESULTS_TAPPED_SAFARI";
          break;
        case 93:
          id v19 = @"SEARCH_RESULTS_TAPPED_SIRI";
          break;
        case 94:
          id v19 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
          break;
        case 95:
          id v19 = @"SEARCH_RESULT_TAPPED_MAPS";
          break;
        case 96:
          id v19 = @"SEARCH_SUGGESTION_TAPPED";
          break;
        case 97:
          id v19 = @"SHARE_DRIVING_ROUTES";
          break;
        case 98:
          id v19 = @"SHARE_FAVORITES";
          break;
        case 99:
          id v19 = @"SHARE_MYLOCATION";
          break;
        case 100:
          id v19 = @"SHARE_TO_DEVICE";
          break;
        case 101:
          id v19 = @"SHARE_TRANSIT_ROUTES";
          break;
        case 102:
          id v19 = @"SHARE_WALKING_ROUTES";
          break;
        case 103:
          id v19 = @"SHOW_MAPS_SETTINGS";
          break;
        case 104:
          id v19 = @"SIRI_START_NAV";
          break;
        case 105:
          id v19 = @"SNAPSHOTTER_USED";
          break;
        case 106:
          id v19 = @"TAP_COMPASS_MODE";
          break;
        case 107:
          id v19 = @"UGC_PHOTO_SUBMISSION";
          break;
        case 108:
          id v19 = @"UGC_RATING_SUBMISSION";
          break;
        case 109:
          id v19 = @"VLF_CORRECTION_ATTEMPTED";
          break;
        case 110:
          id v19 = @"VLF_CORRECTION_FAILED";
          break;
        case 111:
          id v19 = @"VLF_CORRECTION_SUCCESS";
          break;
        case 112:
          id v19 = @"WIDGET_ENTER";
          break;
        case 113:
          id v19 = @"JUNCTION_VIEW_SHOWN";
          break;
        case 114:
          id v19 = @"ETA_SHARED_DRIVING";
          break;
        case 115:
          id v19 = @"ETA_SHARED_WALKING";
          break;
        case 116:
          id v19 = @"ETA_SHARED_CYCLING";
          break;
        case 117:
          id v19 = @"MAPS_HANDOFF";
          break;
        case 118:
          id v19 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
          break;
        case 119:
          id v19 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          id v19 = @"AR_WALKING_LOCALIZATION_SUCCESS";
          break;
        case 121:
          id v19 = @"CURATED_COLLECTIONS_HOME_SHOWN";
          break;
        case 122:
          id v19 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
          break;
        case 123:
          id v19 = @"NEARBY_TRANSIT_SHOWN";
          break;
        case 124:
          id v19 = @"NEARBY_TRANSIT_TAPPED";
          break;
        case 125:
          id v19 = @"SPR_GLOBE_EXPLORED";
          break;
        case 126:
          id v19 = @"SPR_METROS_EXPLORED";
          break;
        case 127:
          id v19 = @"TRANSIT_DETAILS_USED";
          break;
        case 128:
          id v19 = @"USER_ACCOUNT_OPENED_ACCOUNT";
          break;
        case 129:
          id v19 = @"USER_ACCOUNT_SHOWN";
          break;
        case 130:
          id v19 = @"MAP_MODE_DRIVING_SELECTED";
          break;
        case 131:
          id v19 = @"MAP_MODE_EXPLORE_SELECTED";
          break;
        case 132:
          id v19 = @"MAP_MODE_TRANSIT_SELECTED";
          break;
        case 133:
          id v19 = @"MAP_MODE_SATELLITE_SELECTED";
          break;
        case 134:
          id v19 = @"MAP_MODE_DRIVING_USED";
          break;
        case 135:
          id v19 = @"MAP_MODE_EXPLORE_USED";
          break;
        case 136:
          id v19 = @"MAP_MODE_TRANSIT_USED";
          break;
        case 137:
          id v19 = @"MAP_MODE_SATELLITE_USED";
          break;
        case 138:
          id v19 = @"WATCH_GET_DIRECTIONS_CYCLING";
          break;
        case 139:
          id v19 = @"WATCH_START_NAV_CYCLING";
          break;
        case 140:
          id v19 = @"WATCH_GET_DIRECTIONS_WALKING";
          break;
        case 141:
          id v19 = @"WATCH_START_NAV_WALKING";
          break;
        case 142:
          id v19 = @"WATCH_GET_DIRECTIONS_TRANSIT";
          break;
        case 143:
          id v19 = @"WATCH_START_NAV_TRANSIT";
          break;
        case 144:
          id v19 = @"WATCH_GET_DIRECTIONS_DRIVING";
          break;
        case 145:
          id v19 = @"WATCH_START_NAV_DRIVING";
          break;
        case 146:
          id v19 = @"ETA_SHARED_TRANSIT";
          break;
        case 147:
          id v19 = @"USER_ACCOUNT_OPENED";
          break;
        case 148:
          id v19 = @"VENUE_INTERACTION";
          break;
        case 149:
          id v19 = @"ENTER_MAPS";
          break;
        case 150:
          id v19 = @"EXIT_MAPS";
          break;
        case 151:
          id v19 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
          break;
        case 152:
          id v19 = @"ENTER_MAPS_DEVICE";
          break;
        case 153:
          id v19 = @"MAP_VIEW_INSTANTIATED";
          break;
        case 154:
          id v19 = @"MAP_VIEW_ACTIVATED";
          break;
        case 155:
          id v19 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
          break;
        case 156:
          id v19 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
          break;
        case 157:
          id v19 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
          break;
        case 158:
          id v19 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
          break;
        case 159:
          id v19 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
          break;
        case 160:
          id v19 = @"SIRI_SEARCH_CARPLAY_UI";
          break;
        case 161:
          id v19 = @"OPEN_KEYBOARD_CARPLAY_UI";
          break;
        case 162:
          id v19 = @"TAP_SEARCH_CARPLAY_UI";
          break;
        case 163:
          id v19 = @"OPEN_SEARCH_CARPLAY_UI";
          break;
        case 164:
          id v19 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
          break;
        case 165:
          id v19 = @"EXIT_MAPS_CARPLAY";
          break;
        case 166:
          id v19 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
          break;
        case 167:
          id v19 = @"NAV_FEEDBACK_DRIVING";
          break;
        case 168:
          id v19 = @"TRIP_COMPLETED_DRIVING";
          break;
        case 169:
          id v19 = @"HAS_REROUTE_DRIVING";
          break;
        case 170:
          id v19 = @"ETA_OVERESTIMATE_DRIVING";
          break;
        case 171:
          id v19 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
          break;
        case 172:
          id v19 = @"ETA_UNDERESTIMATE_DRIVING";
          break;
        case 173:
          id v19 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
          break;
        case 174:
          id v19 = @"RAP_GOOD_TRIP";
          break;
        case 175:
          id v19 = @"ENRICHED_RESULTS_SHOWN_MAPS";
          break;
        case 176:
          id v19 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 177:
          id v19 = @"ADD_STOP_CARPLAY";
          break;
        case 178:
          id v19 = @"ADD_STOP_CARPLAY_SIRI";
          break;
        case 179:
          id v19 = @"ADD_STOP_DEVICE";
          break;
        case 180:
          id v19 = @"ADD_STOP_DEVICE_SIRI";
          break;
        case 181:
          id v19 = @"SHOWCASE_SHOWN";
          break;
        case 182:
          id v19 = @"SHOWCASE_TAPPED";
          break;
        case 183:
          id v19 = @"PUNCH_IN_SIRI";
          break;
        case 184:
          id v19 = @"PUNCH_IN_SAFARI";
          break;
        case 185:
          id v19 = @"PUNCH_IN_SPOTLIGHT";
          break;
        case 186:
          id v19 = @"PUNCH_IN_SMS";
          break;
        case 187:
          id v19 = @"PUNCH_IN_FINDMY";
          break;
        case 188:
          id v19 = @"PUNCH_IN_OTHER_2ND_PARTY";
          break;
        case 189:
          id v19 = @"PUNCH_IN_3RD_PARTY";
          break;
        case 191:
          id v19 = @"RAP_SUBMITTED";
          break;
        case 192:
          id v19 = @"ARP_PHOTO_SUBMISSION";
          break;
        case 193:
          id v19 = @"ARP_RATING_SUBMISSION";
          break;
        case 194:
          id v19 = @"TRAFFIC_INCIDENT_REPORT";
          break;
        case 195:
          id v19 = @"TRAFFIC_INCIDENT_CONFIRM";
          break;
        case 196:
          id v19 = @"TRAFFIC_INCIDENT_DISMISS";
          break;
        case 197:
          id v19 = @"TRAFFIC_INCIDENT_CLEAR";
          break;
        case 198:
          id v19 = @"MODERN_MAP_EXPLORED";
          break;
        case 199:
          id v19 = @"CARPLAY_ROUTING_UI_USED";
          break;
        case 200:
          id v19 = @"CARPLAY_SEARCH_UI_USED";
          break;
        case 201:
          id v19 = @"ANNOUNCEMENT_DISPLAYED";
          break;
        case 202:
          id v19 = @"ANNOUNCEMENT_TAPPED";
          break;
        case 203:
          id v19 = @"POSITIVE_SEARCH_ENGAGEMENT";
          break;
        case 204:
          id v19 = @"PUNCH_OUT_FINDMY";
          break;
        case 205:
          id v19 = @"WATCH_START_NAV";
          break;
        case 206:
          id v19 = @"HIKING_ENGAGEMENT";
          break;
        case 207:
          id v19 = @"HIKING_PLACECARD";
          break;
        case 208:
          id v19 = @"NO_SEARCH_RESULTS";
          break;
        case 209:
          id v19 = @"PUNCH_IN_SHOWCASE";
          break;
        case 210:
          id v19 = @"SHARED_LOCATION_ENGAGEMENT";
          break;
        case 211:
          id v19 = @"SHARE_SHOWCASE";
          break;
        case 212:
          id v19 = @"WATCH_MAP_VIEW";
          break;
        case 213:
          id v19 = @"WATCH_PLACECARD";
          break;
        case 214:
          id v19 = @"WATCH_SEARCH";
          break;
        case 215:
          id v19 = @"CURATED_HIKE_SAVED";
          break;
        case 216:
          id v19 = @"CUSTOM_HIKE_SAVED";
          break;
        case 217:
          id v19 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
          break;
        case 218:
          id v19 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
          break;
        case 219:
          id v19 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
          break;
        case 220:
          id v19 = @"NAV_STARTED_CURATED_HIKE";
          break;
        case 221:
          id v19 = @"NAV_STARTED_CUSTOM_HIKE";
          break;
        case 222:
          id v19 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
          break;
        case 223:
          id v19 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
          break;
        case 224:
          id v19 = @"SEARCH_PHOTO_INTERACTION";
          break;
        case 225:
          id v19 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 226:
          id v19 = @"LIBRARY_INTERACTION";
          break;
        case 227:
          id v19 = @"SEARCH_FILTER_INTERACTION";
          break;
        case 228:
          id v19 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
          break;
        case 229:
          id v19 = @"CARPLAY_CONNECTED_OFFLINE";
          break;
        case 230:
          id v19 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
          break;
        case 231:
          id v19 = @"DIRECTIONS_OFFLINE";
          break;
        case 232:
          id v19 = @"ENTER_MAPS_DEVICE_OFFLINE";
          break;
        case 233:
          id v19 = @"NO_SEARCH_RESULTS_OFFLINE";
          break;
        case 234:
          id v19 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
          break;
        case 235:
          id v19 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
          break;
        case 236:
          id v19 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
          break;
        case 237:
          id v19 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
          break;
        default:
          id v19 = +[NSString stringWithFormat:@"(unknown: %i)", a2];
          break;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "storing Monthly Usage action '%@'", buf, 0xCu);
    }
    uint64_t v20 = +[GEOReferenceTimeManager sharedManager];
    uint64_t v21 = [v20 bestReferenceDate];

    uint64_t v22 = [(GEOAPDailyCountsQueueElem *)[GEOAPMonthlyCountsQueueElem alloc] initWithType:a2 usageString:v13 usageBool:v14 appId:v15 createTime:v21];
    [a1 _storeQueueElem:v22 completionQueue:v17 completionBlock:v16];

    if (a1[57])
    {
      id v23 = v13;
      id v24 = v14;
      id v25 = v15;
      geo_isolate_sync();
    }
  }
}

void sub_1000197B4(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = sub_100004B10();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          id v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 monthlyUsageActionType:*(unsigned int *)(a1 + 64) usageString:*(void *)(a1 + 40) usageBool:*(void *)(a1 + 48) appId:*(void *)(a1 + 56)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_100019928(void *a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    long long v10 = sub_100004B10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "storing Daily Settings", v14, 2u);
    }

    long long v11 = +[GEOReferenceTimeManager sharedManager];
    long long v12 = [v11 bestReferenceDate];

    id v13 = [[GEOAPDailySettingsQueueElem alloc] initWithSettings:v9 createTime:v12];
    [a1 _storeQueueElem:v13 completionQueue:v8 completionBlock:v7];
  }
}

void sub_100019B20(uint64_t a1)
{
  id v2 = sub_100004B10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "will persist %lu analytics", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[GEOAPPersistence sharedInstance];
  [v4 storeLogMsgElems:*(void *)(a1 + 32)];
}

void sub_100019DE0(uint64_t a1, void *a2)
{
  id v25 = a2;
  id v3 = [objc_alloc((Class)GEORequestResponseMetadata) initWithData:v25];
  id v4 = objc_alloc((Class)NSDate);
  [v3 collectionTime];
  id v24 = objc_msgSend(v4, "initWithTimeIntervalSinceReferenceDate:");
  id v23 = [v24 dateByAddingTimeInterval:sub_100004D9C()];
  id v5 = objc_alloc_init((Class)GEOLogMsgEvent);
  [v5 setEventType:63];
  id v6 = [v3 eventMetadata];
  [v5 setServiceMetadata:v6];

  id v7 = objc_alloc_init((Class)GEOLogMsgState);
  [v7 setStateType:601];
  id v8 = [v3 stateUserSession];
  [v7 setUserSession:v8];

  [v5 addLogMsgState:v7];
  id v9 = +[GEOAPStateFactory sharedFactory];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = [&off_10002C8D0 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      id v13 = 0;
      id v14 = v7;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(&off_10002C8D0);
        }
        objc_msgSend(v9, "stateForType:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v13), "integerValue"));
        id v7 = (id)objc_claimAutoreleasedReturnValue();

        [v5 addLogMsgState:v7];
        id v13 = (char *)v13 + 1;
        id v14 = v7;
      }
      while (v11 != v13);
      id v11 = [&off_10002C8D0 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }
  id v15 = objc_alloc_init((Class)GEOLogMsgState);

  [v15 setStateType:713];
  id v16 = [v3 stateOffline];
  [v15 setOffline:v16];

  [v5 addLogMsgState:v15];
  +[GEOAPPortal populateCommonEventValues:v5];
  id v17 = objc_alloc_init((Class)GEOLogMessage);
  [v17 setLogMessageType:GEOBatchLogMessageType()];
  [v17 addLogMsgEvent:v5];
  uint64_t v18 = [GEOAPLogMsgQueueElem alloc];
  id v19 = [v17 data];
  uint64_t v20 = [(GEOAPLogMsgQueueElem *)v18 initWithLogMsg:v19 uploadBatchId:*(void *)(a1 + 32) expireTime:v23 createTime:v24];

  uint64_t v21 = +[GEOAPPersistence sharedInstance];
  id v30 = v20;
  uint64_t v22 = +[NSArray arrayWithObjects:&v30 count:1];
  [v21 storeLogMsgElems:v22];
}

void sub_10001A140(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A1BC;
    block[3] = &unk_1000288E8;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

id sub_10001A1BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushRemainderToDB];
}

void sub_10001A238(id a1)
{
  qword_100033E78 = (uint64_t)os_log_create("com.apple.GeoAnalytics", "Storage");
  _objc_release_x1();
}

void start()
{
  +[GEOPlatform setIsRunningInGeoAPd:1];
  +[GEOAPServiceManager useProxyClass:objc_opt_class()];
  id v1 = +[GEOReferenceTimeManager sharedManager];
  id v2 = +[GEOAPUtils GEOAPCachePath];
  id v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    id v5 = +[NSFileManager defaultManager];
    id v18 = 0;
    unsigned __int8 v6 = [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v7 = v18;

    if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "directory create error : (%@)", (uint8_t *)&v16, 0xCu);
    }
  }
  id v8 = sub_100005544();
  id v9 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  id v10 = sub_100011E68((uint64_t)v8);
  xpc_set_event_stream_handler(v9, v10, &stru_1000296C8);

  id v11 = +[GEOCountryConfiguration sharedConfiguration];
  uint64_t v12 = [v11 countryCode];
  id v13 = dispatch_get_global_queue(17, 0);
  +[GEOMetroRegionAssetProvider preloadAssetForCountryCode:v12 preloadQueue:v13 completion:&stru_100029708];

  uint64_t v14 = sub_10000CCA8();
  id v15 = (void *)qword_100033E88;
  qword_100033E88 = v14;

  sub_10000D108((void *)qword_100033E88);
  dispatch_main();
}

void sub_10001A4A4(id a1, BOOL a2)
{
  BOOL v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "preloading metro region assets completed (%d)", (uint8_t *)v3, 8u);
  }
}

uint64_t sub_10001A544()
{
  return sub_10001A56C();
}

uint64_t sub_10001A56C()
{
  uint64_t v0 = abort_report_np();
  return sub_10001A594(v0);
}

uint64_t sub_10001A594()
{
  uint64_t v0 = abort_report_np();
  return sub_10001A5BC(v0);
}

void sub_10001A5BC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unreachable reached: local proxy bypassed", v0, 2u);
}

void sub_10001A604()
{
  dlerror();
  uint64_t v0 = (void *)abort_report_np();
  sub_10001A628(v0, v1);
}

void sub_10001A628(void *a1, uint64_t a2)
{
  id v3 = a1;
  unsigned __int8 v4 = sub_1000051A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412546;
    uint64_t v6 = a2;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "uploadTask '%@' could not resume '%@'", (uint8_t *)&v5, 0x16u);
  }

  objc_end_catch();
}

void sub_10001A6F4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: components.count == 8", v0, 2u);
}

void sub_10001A73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t GEOBatchAnalyticsSessionType()
{
  return _GEOBatchAnalyticsSessionType();
}

uint64_t GEOBatchIDIsTelemetryData()
{
  return _GEOBatchIDIsTelemetryData();
}

uint64_t GEOBatchLogMessageType()
{
  return _GEOBatchLogMessageType();
}

uint64_t GEOBatchOpaqueAppID()
{
  return _GEOBatchOpaqueAppID();
}

uint64_t GEOBatchUploadPolicyType()
{
  return _GEOBatchUploadPolicyType();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetDate()
{
  return _GEOConfigGetDate();
}

uint64_t GEOConfigGetDouble()
{
  return _GEOConfigGetDouble();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

uint64_t GEOConfigGetString()
{
  return _GEOConfigGetString();
}

uint64_t GEOConfigGetUInteger()
{
  return _GEOConfigGetUInteger();
}

uint64_t GEOConfigSetDate()
{
  return _GEOConfigSetDate();
}

uint64_t GEOConfigSetDouble()
{
  return _GEOConfigSetDouble();
}

uint64_t GEOGetURL()
{
  return _GEOGetURL();
}

uint64_t GEOMakeGEOAPBatchIDForReqRespMetadata()
{
  return _GEOMakeGEOAPBatchIDForReqRespMetadata();
}

uint64_t GEOMightHaveCorrespondingReqRespMetadata()
{
  return _GEOMightHaveCorrespondingReqRespMetadata();
}

uint64_t GEOProtocolBufferRequestHeader()
{
  return _GEOProtocolBufferRequestHeader();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _GEOConfigHasValue()
{
  return __GEOConfigHasValue();
}

uint64_t _GEOConfigRemoveValueSync()
{
  return __GEOConfigRemoveValueSync();
}

uint64_t _GEOCreateTransaction()
{
  return __GEOCreateTransaction();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t geo_assert_isolated()
{
  return _geo_assert_isolated();
}

uint64_t geo_dispatch_async_qos()
{
  return _geo_dispatch_async_qos();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return _geo_dispatch_queue_create_with_qos();
}

uint64_t geo_isolate_sync()
{
  return _geo_isolate_sync();
}

uint64_t geo_isolater_create()
{
  return _geo_isolater_create();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_GEOAPCachePath(void *a1, const char *a2, ...)
{
  return [a1 GEOAPCachePath];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__analyticsCount(void *a1, const char *a2, ...)
{
  return [a1 _analyticsCount];
}

id objc_msgSend__clearExpired(void *a1, const char *a2, ...)
{
  return [a1 _clearExpired];
}

id objc_msgSend__clearUploadTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearUploadTimer];
}

id objc_msgSend__configureDatabase(void *a1, const char *a2, ...)
{
  return [a1 _configureDatabase];
}

id objc_msgSend__copyAndEmptyBatchQueue(void *a1, const char *a2, ...)
{
  return [a1 _copyAndEmptyBatchQueue];
}

id objc_msgSend__debugUploadCountersEnabled(void *a1, const char *a2, ...)
{
  return [a1 _debugUploadCountersEnabled];
}

id objc_msgSend__flushRemainderToDB(void *a1, const char *a2, ...)
{
  return [a1 _flushRemainderToDB];
}

id objc_msgSend__hasEvalEntitlement(void *a1, const char *a2, ...)
{
  return [a1 _hasEvalEntitlement];
}

id objc_msgSend__hasTelemetryEntitlement(void *a1, const char *a2, ...)
{
  return [a1 _hasTelemetryEntitlement];
}

id objc_msgSend__initiateCollationAndUpload(void *a1, const char *a2, ...)
{
  return [a1 _initiateCollationAndUpload];
}

id objc_msgSend__setUploadTimer(void *a1, const char *a2, ...)
{
  return [a1 _setUploadTimer];
}

id objc_msgSend__setupBackgroundTask(void *a1, const char *a2, ...)
{
  return [a1 _setupBackgroundTask];
}

id objc_msgSend__setupSigHandler(void *a1, const char *a2, ...)
{
  return [a1 _setupSigHandler];
}

id objc_msgSend__shutdown(void *a1, const char *a2, ...)
{
  return [a1 _shutdown];
}

id objc_msgSend__submitBatchesForUpload(void *a1, const char *a2, ...)
{
  return [a1 _submitBatchesForUpload];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_additionalStates(void *a1, const char *a2, ...)
{
  return [a1 additionalStates];
}

id objc_msgSend_allSessionConfigTypes(void *a1, const char *a2, ...)
{
  return [a1 allSessionConfigTypes];
}

id objc_msgSend_apPersistence(void *a1, const char *a2, ...)
{
  return [a1 apPersistence];
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return [a1 appId];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_bestReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 bestReferenceDate];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clientMetrics(void *a1, const char *a2, ...)
{
  return [a1 clientMetrics];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionTime(void *a1, const char *a2, ...)
{
  return [a1 collectionTime];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countLimit(void *a1, const char *a2, ...)
{
  return [a1 countLimit];
}

id objc_msgSend_countType(void *a1, const char *a2, ...)
{
  return [a1 countType];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createTime(void *a1, const char *a2, ...)
{
  return [a1 createTime];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataRequestKindSubtype(void *a1, const char *a2, ...)
{
  return [a1 dataRequestKindSubtype];
}

id objc_msgSend_dataRequestKindType(void *a1, const char *a2, ...)
{
  return [a1 dataRequestKindType];
}

id objc_msgSend_datasetId(void *a1, const char *a2, ...)
{
  return [a1 datasetId];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultPragmas(void *a1, const char *a2, ...)
{
  return [a1 defaultPragmas];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_deleteAllHistory(void *a1, const char *a2, ...)
{
  return [a1 deleteAllHistory];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_discretionary(void *a1, const char *a2, ...)
{
  return [a1 discretionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endEvalData(void *a1, const char *a2, ...)
{
  return [a1 endEvalData];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return [a1 errorDomain];
}

id objc_msgSend_evalModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 evalModeEnabled];
}

id objc_msgSend_eventMetadata(void *a1, const char *a2, ...)
{
  return [a1 eventMetadata];
}

id objc_msgSend_eventTimestamp(void *a1, const char *a2, ...)
{
  return [a1 eventTimestamp];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expireTime(void *a1, const char *a2, ...)
{
  return [a1 expireTime];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flushEvalData(void *a1, const char *a2, ...)
{
  return [a1 flushEvalData];
}

id objc_msgSend_hasErrorCode(void *a1, const char *a2, ...)
{
  return [a1 hasErrorCode];
}

id objc_msgSend_hasErrorDomain(void *a1, const char *a2, ...)
{
  return [a1 hasErrorDomain];
}

id objc_msgSend_hasNetworkService(void *a1, const char *a2, ...)
{
  return [a1 hasNetworkService];
}

id objc_msgSend_hasTilesetId(void *a1, const char *a2, ...)
{
  return [a1 hasTilesetId];
}

id objc_msgSend_hasUsedBackgroundUrl(void *a1, const char *a2, ...)
{
  return [a1 hasUsedBackgroundUrl];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_httpResponseCode(void *a1, const char *a2, ...)
{
  return [a1 httpResponseCode];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latencyStats(void *a1, const char *a2, ...)
{
  return [a1 latencyStats];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logMsg(void *a1, const char *a2, ...)
{
  return [a1 logMsg];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_manifestEnvironment(void *a1, const char *a2, ...)
{
  return [a1 manifestEnvironment];
}

id objc_msgSend_mapSettings(void *a1, const char *a2, ...)
{
  return [a1 mapSettings];
}

id objc_msgSend_mapUiShown(void *a1, const char *a2, ...)
{
  return [a1 mapUiShown];
}

id objc_msgSend_mapsFeatures(void *a1, const char *a2, ...)
{
  return [a1 mapsFeatures];
}

id objc_msgSend_mapsUserSettings(void *a1, const char *a2, ...)
{
  return [a1 mapsUserSettings];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_networkMetrics(void *a1, const char *a2, ...)
{
  return [a1 networkMetrics];
}

id objc_msgSend_networkService(void *a1, const char *a2, ...)
{
  return [a1 networkService];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_osAndBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 osAndBuildVersion];
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return [a1 persistence];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestDataSize(void *a1, const char *a2, ...)
{
  return [a1 requestDataSize];
}

id objc_msgSend_requestEnd(void *a1, const char *a2, ...)
{
  return [a1 requestEnd];
}

id objc_msgSend_requestStart(void *a1, const char *a2, ...)
{
  return [a1 requestStart];
}

id objc_msgSend_requestTypeCode(void *a1, const char *a2, ...)
{
  return [a1 requestTypeCode];
}

id objc_msgSend_requestingAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestingAppIdentifier];
}

id objc_msgSend_requestingAppMajorVer(void *a1, const char *a2, ...)
{
  return [a1 requestingAppMajorVer];
}

id objc_msgSend_requestingAppMinorVer(void *a1, const char *a2, ...)
{
  return [a1 requestingAppMinorVer];
}

id objc_msgSend_requirePower(void *a1, const char *a2, ...)
{
  return [a1 requirePower];
}

id objc_msgSend_requireWifi(void *a1, const char *a2, ...)
{
  return [a1 requireWifi];
}

id objc_msgSend_responseDataSize(void *a1, const char *a2, ...)
{
  return [a1 responseDataSize];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retrieveDailyAggregationInterval(void *a1, const char *a2, ...)
{
  return [a1 retrieveDailyAggregationInterval];
}

id objc_msgSend_retrieveLastDailyAggregationTime(void *a1, const char *a2, ...)
{
  return [a1 retrieveLastDailyAggregationTime];
}

id objc_msgSend_retrieveLastMonthlyAggregationTime(void *a1, const char *a2, ...)
{
  return [a1 retrieveLastMonthlyAggregationTime];
}

id objc_msgSend_reusedConnection(void *a1, const char *a2, ...)
{
  return [a1 reusedConnection];
}

id objc_msgSend_routingSettings(void *a1, const char *a2, ...)
{
  return [a1 routingSettings];
}

id objc_msgSend_rrLogData(void *a1, const char *a2, ...)
{
  return [a1 rrLogData];
}

id objc_msgSend_runAggregation(void *a1, const char *a2, ...)
{
  return [a1 runAggregation];
}

id objc_msgSend_runAggregationTasks(void *a1, const char *a2, ...)
{
  return [a1 runAggregationTasks];
}

id objc_msgSend_rxBytesStats(void *a1, const char *a2, ...)
{
  return [a1 rxBytesStats];
}

id objc_msgSend_selectBatchIdsForBatchUpload(void *a1, const char *a2, ...)
{
  return [a1 selectBatchIdsForBatchUpload];
}

id objc_msgSend_sendImmediately(void *a1, const char *a2, ...)
{
  return [a1 sendImmediately];
}

id objc_msgSend_serviceIpAddress(void *a1, const char *a2, ...)
{
  return [a1 serviceIpAddress];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedAggregator(void *a1, const char *a2, ...)
{
  return [a1 sharedAggregator];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedPolicies(void *a1, const char *a2, ...)
{
  return [a1 sharedPolicies];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateOffline(void *a1, const char *a2, ...)
{
  return [a1 stateOffline];
}

id objc_msgSend_stateType(void *a1, const char *a2, ...)
{
  return [a1 stateType];
}

id objc_msgSend_stateUserSession(void *a1, const char *a2, ...)
{
  return [a1 stateUserSession];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return [a1 taskDescription];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_tileSet(void *a1, const char *a2, ...)
{
  return [a1 tileSet];
}

id objc_msgSend_tileSetInfos(void *a1, const char *a2, ...)
{
  return [a1 tileSetInfos];
}

id objc_msgSend_tilesetId(void *a1, const char *a2, ...)
{
  return [a1 tilesetId];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return [a1 transactionMetrics];
}

id objc_msgSend_tryLock(void *a1, const char *a2, ...)
{
  return [a1 tryLock];
}

id objc_msgSend_ttl(void *a1, const char *a2, ...)
{
  return [a1 ttl];
}

id objc_msgSend_txBytesStats(void *a1, const char *a2, ...)
{
  return [a1 txBytesStats];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_uploadBatchId(void *a1, const char *a2, ...)
{
  return [a1 uploadBatchId];
}

id objc_msgSend_uploadStages(void *a1, const char *a2, ...)
{
  return [a1 uploadStages];
}

id objc_msgSend_urlSessionConfig(void *a1, const char *a2, ...)
{
  return [a1 urlSessionConfig];
}

id objc_msgSend_usageBool(void *a1, const char *a2, ...)
{
  return [a1 usageBool];
}

id objc_msgSend_usageString(void *a1, const char *a2, ...)
{
  return [a1 usageString];
}

id objc_msgSend_usedBackgroundUrl(void *a1, const char *a2, ...)
{
  return [a1 usedBackgroundUrl];
}

id objc_msgSend_usedCellular(void *a1, const char *a2, ...)
{
  return [a1 usedCellular];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}