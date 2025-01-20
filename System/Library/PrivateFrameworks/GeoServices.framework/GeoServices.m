void sub_100003AE4(void *a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t vars8;

  v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (!v2)
  {
    v3 = +[NSMutableArray arrayWithCapacity:2];
    [*(id *)(a1[4] + 16) setObject:v3 forKey:a1[5]];
    v2 = v3;
  }
  v4 = v2;
  [v2 addObject:a1[6]];
}

void sub_100003B74(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_100003CB8(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (v2)
  {
    id v3 = v2;
    [v2 removeObject:a1[6]];
    v2 = v3;
  }
}

void sub_100003EFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = *(id *)(a1 + 40);
  geo_reentrant_isolate_sync_data();
  if (v6)
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v5, v7, v8, v9, v10);
    }
  }
}

void sub_100003FEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = +[GEOPlatform sharedPlatform];
    if (![v7 isInternalInstall])
    {
LABEL_116:

      goto LABEL_117;
    }
    id v8 = [v6 count];

    if (v8)
    {
      uint64_t v7 = [v5 calculateMissingComponentTypes:v6];
      if ([v7 count])
      {
        uint64_t v9 = +[NSMutableArray array];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v7;
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v14) intValue];
              v16 = @"COMPONENT_TYPE_UNKNOWN";
              switch((int)v15)
              {
                case 0:
                  break;
                case 1:
                  v16 = @"COMPONENT_TYPE_ENTITY";
                  break;
                case 2:
                  v16 = @"COMPONENT_TYPE_PLACE_INFO";
                  break;
                case 3:
                  v16 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
                  break;
                case 4:
                  v16 = @"COMPONENT_TYPE_BOUNDS";
                  break;
                case 5:
                  v16 = @"COMPONENT_TYPE_ADDRESS";
                  break;
                case 6:
                  v16 = @"COMPONENT_TYPE_RATING";
                  break;
                case 7:
                  v16 = @"COMPONENT_TYPE_REVIEW";
                  break;
                case 8:
                  v16 = @"COMPONENT_TYPE_PHOTO";
                  break;
                case 9:
                  v16 = @"COMPONENT_TYPE_HOURS";
                  break;
                case 10:
                  v16 = @"COMPONENT_TYPE_TRANSIT_INFO";
                  break;
                case 11:
                  v16 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
                  break;
                case 12:
                  v16 = @"COMPONENT_TYPE_ETA";
                  break;
                case 13:
                  v16 = @"COMPONENT_TYPE_FLYOVER";
                  break;
                case 14:
                  v16 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
                  break;
                case 15:
                  v16 = @"COMPONENT_TYPE_AMENITIES";
                  break;
                case 16:
                  v16 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
                  break;
                case 20:
                  v16 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
                  break;
                case 21:
                  v16 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
                  break;
                case 22:
                  v16 = @"COMPONENT_TYPE_TEXT_BLOCK";
                  break;
                case 23:
                  v16 = @"COMPONENT_TYPE_FACTOID";
                  break;
                case 24:
                  v16 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
                  break;
                case 25:
                  v16 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
                  break;
                case 26:
                  v16 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
                  break;
                case 27:
                  v16 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
                  break;
                case 29:
                  v16 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
                  break;
                case 30:
                  v16 = @"COMPONENT_TYPE_RESULT_SNIPPET";
                  break;
                case 31:
                  v16 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
                  break;
                case 32:
                  v16 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
                  break;
                case 33:
                  v16 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
                  break;
                case 34:
                  v16 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
                  break;
                case 36:
                  v16 = @"COMPONENT_TYPE_TIP";
                  break;
                case 37:
                  v16 = @"COMPONENT_TYPE_PLACECARD_URL";
                  break;
                case 38:
                  v16 = @"COMPONENT_TYPE_ASSOCIATED_APP";
                  break;
                case 39:
                  v16 = @"COMPONENT_TYPE_MESSAGE_LINK";
                  break;
                case 40:
                  v16 = @"COMPONENT_TYPE_QUICK_LINK";
                  break;
                case 41:
                  v16 = @"COMPONENT_TYPE_RAP";
                  break;
                case 42:
                  v16 = @"COMPONENT_TYPE_OFFLINE_AREA";
                  break;
                case 43:
                  v16 = @"COMPONENT_TYPE_LOCATION_EVENT";
                  break;
                case 44:
                  v16 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
                  break;
                case 45:
                  v16 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
                  break;
                case 46:
                  v16 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
                  break;
                case 47:
                  v16 = @"COMPONENT_TYPE_OFFLINE_SIZE";
                  break;
                case 48:
                  v16 = @"COMPONENT_TYPE_VENUE_INFO";
                  break;
                case 49:
                  v16 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
                  break;
                case 50:
                  v16 = @"COMPONENT_TYPE_CONTAINED_PLACE";
                  break;
                case 51:
                  v16 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
                  break;
                case 52:
                  v16 = @"COMPONENT_TYPE_ICON";
                  break;
                case 53:
                  v16 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
                  break;
                case 54:
                  v16 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
                  break;
                case 55:
                  v16 = @"COMPONENT_TYPE_STOREFRONT";
                  break;
                case 56:
                  v16 = @"COMPONENT_TYPE_GROUND_VIEW_LABEL";
                  break;
                case 57:
                  v16 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
                  break;
                case 58:
                  v16 = @"COMPONENT_TYPE_POI_EVENT";
                  break;
                case 59:
                  v16 = @"COMPONENT_TYPE_STOREFRONT_PRESENTATION";
                  break;
                case 60:
                  v16 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
                  break;
                case 61:
                  v16 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
                  break;
                case 62:
                  v16 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
                  break;
                case 63:
                  v16 = @"COMPONENT_TYPE_LINKED_SERVICE";
                  break;
                case 64:
                  v16 = @"COMPONENT_TYPE_BUSINESS_HOURS";
                  break;
                case 65:
                  v16 = @"COMPONENT_TYPE_COLLECTION";
                  break;
                case 66:
                  v16 = @"COMPONENT_TYPE_RELATED_PLACE";
                  break;
                case 67:
                  v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
                  break;
                case 68:
                  v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
                  break;
                case 69:
                  v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
                  break;
                case 70:
                  v16 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
                  break;
                case 71:
                  v16 = @"COMPONENT_TYPE_PUBLISHER";
                  break;
                case 72:
                  v16 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
                  break;
                case 73:
                  v16 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
                  break;
                case 74:
                  v16 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
                  break;
                case 76:
                  v16 = @"COMPONENT_TYPE_COLLECTION_IDS";
                  break;
                case 77:
                  v16 = @"COMPONENT_TYPE_ISO_3166_CODE";
                  break;
                case 78:
                  v16 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
                  break;
                case 79:
                  v16 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
                  break;
                case 81:
                  v16 = @"COMPONENT_TYPE_STOREFRONT_FACES";
                  break;
                case 82:
                  v16 = @"COMPONENT_TYPE_GUIDE_GROUP";
                  break;
                case 83:
                  v16 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
                  break;
                case 84:
                  v16 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
                  break;
                case 85:
                  v16 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
                  break;
                case 86:
                  v16 = @"COMPONENT_TYPE_ABOUT";
                  break;
                case 87:
                  v16 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
                  break;
                case 88:
                  v16 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
                  break;
                case 89:
                  v16 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
                  break;
                case 90:
                  v16 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
                  break;
                case 91:
                  v16 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
                  break;
                case 92:
                  v16 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
                  break;
                case 93:
                  v16 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
                  break;
                case 94:
                  v16 = @"COMPONENT_TYPE_ACTION_DATA";
                  break;
                case 95:
                  v16 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
                  break;
                case 96:
                  v16 = @"COMPONENT_TYPE_POI_CLAIM";
                  break;
                case 97:
                  v16 = @"COMPONENT_TYPE_EV_CHARGER";
                  break;
                case 98:
                  v16 = @"COMPONENT_TYPE_TRAIL_HEAD";
                  break;
                case 99:
                  v16 = @"COMPONENT_TYPE_TOOL_TIP";
                  break;
                case 100:
                  v16 = @"COMPONENT_TYPE_REFRESH_ID";
                  break;
                case 101:
                  v16 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
                  break;
                case 102:
                  v16 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
                  break;
                case 103:
                  v16 = @"COMPONENT_TYPE_FORWARD_INFO";
                  break;
                case 104:
                  v16 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
                  break;
                case 105:
                  v16 = @"COMPONENT_TYPE_HIKE_SUMMARY";
                  break;
                case 106:
                  v16 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
                  break;
                default:
                  v16 = +[NSString stringWithFormat:@"(unknown: %i)", v15];
                  break;
              }
              [v9 addObject:v16];

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
          }
          while (v12);
        }

        [v9 sortUsingSelector:"compare:"];
        v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = [v9 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Result was missing components: %@", buf, 0xCu);
        }
      }
      goto LABEL_116;
    }
  }
LABEL_117:
}

void sub_100005A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id sub_100005E84(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 16);

  return [v6 removeObjectForKey:v5];
}

void sub_100005EE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 64) != 4)
  {
    uint64_t v5 = [v3 resultsWithResultType:1];
    if ([v4 status] || objc_msgSend(v5, "count"))
    {
      if ([v5 count] != (id)1)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v6 = [v5 firstObject];
      [*(id *)(a1 + 32) requestType];
      if (GEOMapItemHandleShouldStoreRequestData())
      {
        id v7 = objc_alloc_init((Class)GEOMapItemInitialRequestData);
        [v6 setRequestData:v7];

        id v8 = [*(id *)(a1 + 32) requestType];
        uint64_t v9 = [v6 requestData];
        [v9 setRequestType:v8];

        id v10 = [*(id *)(a1 + 32) placeRequestParameters];
        id v11 = [v10 copy];
        id v12 = [v6 requestData];
        [v12 setPlaceRequestParameters:v11];
      }
      if (![v6 status])
      {
        uint64_t v13 = [*(id *)(a1 + 40) pdPlaceCache];
        [v13 storePlace:v6 forRequest:*(void *)(a1 + 32)];

        sub_100003FEC(*(void *)(a1 + 40), v6, *(void **)(a1 + 48));
      }
    }
    else
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = *(void **)(a1 + 32);
        int v19 = 138412290;
        long long v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Caching negative response for request %@", (uint8_t *)&v19, 0xCu);
      }

      id v6 = objc_alloc_init((Class)GEOPDPlace);
      [v6 setNilPlace:1];
      v16 = [*(id *)(a1 + 40) pdPlaceCache];
      [v16 storePlace:v6 forRequest:*(void *)(a1 + 32)];
    }
    goto LABEL_13;
  }
LABEL_14:
  v17 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134217984;
    long long v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Response from the server: %p", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v4, 0);
  }
}

void sub_100006F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_100006FE0(uint64_t a1)
{
  uint64_t v2 = sub_10000704C([_GEODefaultsNotificationHelper alloc], *(void **)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 24) setObject:v2 forKey:*(void *)(a1 + 32)];
}

void *sub_10000704C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)_GEODefaultsNotificationHelper;
    id v4 = objc_msgSendSuper2(&v14, "init");
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 1, v3);
      uint64_t v5 = geo_isolater_create_with_format();
      id v6 = (void *)a1[2];
      a1[2] = v5;

      uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 6, v3);
      id v8 = (void *)a1[4];
      a1[4] = v7;

      uint64_t v9 = +[NSMutableSet setWithCapacity:2];
      id v10 = (void *)a1[5];
      a1[5] = v9;

      id v11 = objc_alloc_init((Class)NSCountedSet);
      id v12 = (void *)a1[3];
      a1[3] = v11;
    }
  }

  return a1;
}

void sub_10000712C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) requestUUID];
  uint64_t v9 = [*(id *)(a1 + 40) peer];
  [v7 _removeRequestUUID:v8 forPeer:v9];

  id v10 = [*(id *)(a1 + 40) requestUUID];

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) requestUUID];
    uint64_t v13 = [*(id *)(a1 + 40) peer];
    [v11 _removeRequestUUID:v12 forPeer:v13];
  }
  [*(id *)(a1 + 48) setError:v6];
  [*(id *)(a1 + 48) setResponse:v5];
  objc_super v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218242;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Responding with place data response: %p / error: %@", (uint8_t *)&v15, 0x16u);
  }

  [*(id *)(a1 + 48) send];
}

void sub_100007958(_Unwind_Exception *a1)
{
}

void sub_1000079A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) peer];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 40) peer];
      uint64_t v7 = [*(id *)(a1 + 40) keysAndSources];
      id v8 = [v7 allKeys];
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      objc_super v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Peer %@ adding listeners for: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = [*(id *)(a1 + 40) keysAndSources];
    id v10 = [v9 allKeys];
    sub_100007B0C((uint64_t)v4, v10);
  }
}

void sub_100007B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    geo_isolate_sync_data();
  }
}

void sub_100007BFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) baseURL];
  id v3 = +[NSFileManager defaultManager];
  id v26 = 0;
  id v4 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v26];
  id v5 = v26;

  if (v5)
  {
    id v6 = [v5 domain];
    if ([v6 isEqualToString:NSCocoaErrorDomain])
    {
      id v7 = [v5 code];

      if (v7 == (id)260) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v16 = sub_10000966C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      goto LABEL_21;
    }
    *(_DWORD *)buf = 138478083;
    v29 = v2;
    __int16 v30 = 2112;
    id v31 = v5;
    id v18 = "Unable to list contents of asset folder %{private}@: %@";
    int v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 22;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    goto LABEL_20;
  }
LABEL_4:
  if ([v4 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          objc_super v14 = [GEOMAResource alloc];
          int v15 = -[GEOMAResource initWithResourceFolder:info:](v14, "initWithResourceFolder:info:", v13, *(void *)(a1 + 40), (void)v22);
          if (v15) {
            [*(id *)(a1 + 48) addObject:v15];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    id v16 = sub_10000966C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    __int16 v17 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138477827;
    v29 = v17;
    id v18 = "Found installed resources: %{private}@";
    int v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    uint32_t v21 = 12;
    goto LABEL_19;
  }
LABEL_21:
}

void sub_100008064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000082D0(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "addObject:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

unint64_t sub_100008D68(void *a1)
{
  unint64_t result = (unint64_t)[a1 UTF8String];
  LOBYTE(v2) = *(unsigned char *)result;
  if (!*(unsigned char *)result) {
    return 0;
  }
  unint64_t v3 = result;
  unint64_t v4 = 0;
  LODWORD(result) = 0;
  unint64_t v5 = v3 + 1;
  do
  {
    unint64_t result = (result + (char)v2);
    if (v4 > 0x30) {
      break;
    }
    int v2 = *(unsigned __int8 *)(v5 + v4++);
  }
  while (v2);
  return result;
}

id sub_100008DBC(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = GEODecodeModernXPCMessage();
  id v13 = 0;
  objc_super v14 = v13;
  if (!v12 || v13)
  {
    int v15 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to decode request: %@", buf, 0xCu);
    }
    id v17 = 0;
  }
  else
  {
    [v12 setService:v8];
    [v12 setMethod:v9];
    [v12 setPeer:v11];
    int v15 = xpc_dictionary_get_value(v10, "progress_observer_endpoint");
    if (v15)
    {
      id v16 = +[NSProgress _geo_mirroredProgressFromReportingXPCEndpoint:v15 totalUnitCount:1];
      [v12 setProgress:v16];
    }
    id v17 = v12;
  }

  return v17;
}

GEOMAResourceInfo_TerritoryRegulatoryInfo *sub_10000919C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 == 1)
  {
    unint64_t v4 = objc_alloc_init(GEOMAResourceInfo_TerritoryRegulatoryInfo);
    goto LABEL_5;
  }
  if (!a1)
  {
    unint64_t v4 = [[GEOMAResourceInfo_MetroRegion alloc] initWithOverrides:v3];
LABEL_5:
    unint64_t v5 = v4;
    goto LABEL_7;
  }
  unint64_t v5 = 0;
LABEL_7:

  return v5;
}

id sub_10000966C()
{
  if (qword_100084800 != -1) {
    dispatch_once(&qword_100084800, &stru_100071EA8);
  }
  v0 = (void *)qword_1000847F8;

  return v0;
}

void sub_1000096C0(id *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_10000966C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109635;
    int v54 = a2;
    __int16 v55 = 2112;
    id v56 = v8;
    __int16 v57 = 2113;
    id v58 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Found resources: %d error: %@ resources: %{private}@", buf, 0x1Cu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100009C08;
  v49[3] = &unk_100072A70;
  id v50 = a1[4];
  id v51 = a1[5];
  id v10 = objc_retainBlock(v49);
  if ([v7 count])
  {
    id v11 = [v7 lastObject];
    if ([v11 isAvailableForUse])
    {
      ((void (*)(void *, void *, void))v10[2])(v10, v11, 0);
    }
    else
    {
      unsigned int v13 = [v11 isOnDisk];
      unsigned __int8 v14 = [a1[6] options];
      unsigned __int8 v15 = [a1[6] options];
      unsigned int v16 = [a1[6] options];
      if ((v14 & 1) != 0 && (v15 & 2) != 0 && (v13 & 1) == 0)
      {
        ((void (*)(void *, void, void))v10[2])(v10, 0, 0);
      }
      else if (v14)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v23 = [v7 reverseObjectEnumerator];
        id v24 = [v23 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v46;
          while (2)
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v46 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              if ([v28 isAvailableForUse])
              {
                ((void (*)(void *, void *, void))v10[2])(v10, v28, 0);
                goto LABEL_35;
              }
              if ([v28 isOnDisk])
              {
                id v30 = a1[7];
                v42[0] = _NSConcreteStackBlock;
                v42[1] = 3221225472;
                v42[2] = sub_100037850;
                v42[3] = &unk_100071F48;
                v44 = v10;
                id v43 = v11;
                [v43 downloadWithOptions:0 queue:v30 completion:v42];

                goto LABEL_35;
              }
            }
            id v25 = [v23 countByEnumeratingWithState:&v45 objects:v52 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }
LABEL_35:
      }
      else
      {
        int v17 = (v16 >> 8) & 1;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100037864;
        v35[3] = &unk_100072A98;
        id v36 = a1[5];
        char v41 = v17;
        id v37 = v7;
        id v18 = v11;
        id v38 = v18;
        int v19 = v10;
        id v40 = v19;
        id v39 = a1[7];
        os_log_type_t v20 = objc_retainBlock(v35);
        uint32_t v21 = v20;
        if (v13)
        {
          id v22 = a1[7];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100037D18;
          v31[3] = &unk_100072AC0;
          v33 = v19;
          id v32 = v18;
          id v34 = v21;
          [v32 downloadWithOptions:0 queue:v22 completion:v31];
        }
        else
        {
          ((void (*)(void *))v20[2])(v20);
        }
      }
    }
  }
  else
  {
    if (!v8)
    {
      if (a2 >= 0xF)
      {
        id v12 = +[NSString stringWithFormat:@"Unknown(%d)", a2];
      }
      else
      {
        id v12 = off_100072B08[a2];
      }
      v29 = +[NSString stringWithFormat:@"Received no results or error from MA Query, only code: %d: %@", a2, v12];
      id v8 = +[NSError GEOErrorWithCode:-8 reason:v29];
    }
    ((void (*)(void *, void, id))v10[2])(v10, 0, v8);
  }
}

void sub_100009C08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isAvailableForUse])
  {
    id v7 = [v5 getLocalFileUrl];
    [v7 fileSystemRepresentation];
    id v8 = (const char *)sandbox_extension_issue_file();
    if (v8)
    {
      id v9 = +[NSData dataWithBytesNoCopy:v8 length:strlen(v8) + 1 freeWhenDone:1];
      [*(id *)(a1 + 32) setSandBoxToken:v9];
    }
    else
    {
      id v9 = sub_10000966C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to issue sandbox extension for file: \"%@\"", (uint8_t *)&v10, 0xCu);
      }
    }

    [*(id *)(a1 + 40) updateLastAccessedTime];
    [*(id *)(a1 + 32) setUrl:v7];
  }
  else
  {
    [*(id *)(a1 + 32) setError:v6];
  }
  [*(id *)(a1 + 32) send];
}

id sub_10000A4D0()
{
  if (qword_100084810 != -1) {
    dispatch_once(&qword_100084810, &stru_100071FB8);
  }
  v0 = (void *)qword_100084808;

  return v0;
}

id sub_10000A7C4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_10000A7D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _listResources:*(unsigned __int8 *)(a1 + 56) queue:*(void *)(a1 + 40) results:*(void *)(a1 + 48)];
}

void sub_10000A7F8(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

id sub_10000A860(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 removeObjectForKey:v2];
}

id sub_10000A8A4(void *a1)
{
  [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v2 = a1[7];
  uint64_t v3 = a1[5];
  unint64_t v4 = *(void **)(a1[4] + 24);

  return [v4 setObject:v2 forKeyedSubscript:v3];
}

uint64_t sub_10000AB58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000AB68(uint64_t a1)
{
}

void sub_10000AD8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) requestUUID];
  id v9 = [*(id *)(a1 + 40) peer];
  [v7 _removeRequestUUID:v8 forPeer:v9];

  id v12 = *(id *)(a1 + 48);
  unsigned int v13 = v5;
  unsigned __int8 v14 = v6;
  id v10 = v6;
  id v11 = v5;
  geo_dispatch_async_qos();
}

id sub_10000AEA0(uint64_t a1)
{
  [*(id *)(a1 + 32) setResponse:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 send];
}

void sub_10000B24C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) requestUUID];
  id v9 = [*(id *)(a1 + 40) peer];
  [v7 _removeRequestUUID:v8 forPeer:v9];

  id v12 = *(id *)(a1 + 48);
  unsigned int v13 = v5;
  unsigned __int8 v14 = v6;
  id v10 = v6;
  id v11 = v5;
  geo_dispatch_async_qos();
}

id sub_10000B360(uint64_t a1)
{
  [*(id *)(a1 + 32) setResponse:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 send];
}

id sub_10000B474(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAllCacheEntries:a2];
  [*(id *)(a1 + 32) setError:v6];

  id v7 = *(void **)(a1 + 32);

  return [v7 send];
}

id sub_10000B7E0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFreeableBytes:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10000B98C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFreedBytes:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

void sub_10000C254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    id v7 = +[NSDictionary _geo_replyDictionaryForError:a3 key:@"err"];
    objc_msgSend(v4, "sendReply:");
  }
  else
  {
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
    CFStringRef v8 = @"response";
    id v9 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [*(id *)(a1 + 32) sendReply:v6];
  }
}

void sub_10000C5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    id v7 = +[NSDictionary _geo_replyDictionaryForError:a3 key:@"err"];
    objc_msgSend(v4, "sendReply:");
  }
  else
  {
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
    CFStringRef v8 = @"response";
    id v9 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [*(id *)(a1 + 32) sendReply:v6];
  }
}

void sub_10000C904(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    CFStringRef v18 = @"err";
    id v19 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    id v13 = 0;
    CFStringRef v8 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (v8)
    {
      CFStringRef v16 = @"data";
      int v17 = v8;
      id v11 = &v17;
      id v12 = &v16;
    }
    else
    {
      CFStringRef v14 = @"err";
      id v15 = v9;
      id v11 = &v15;
      id v12 = &v14;
    }
    id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  }
  [*(id *)(a1 + 32) sendReply:v7];
}

void sub_10000CD80(uint64_t a1, uint64_t a2)
{
  id v9 = 0;
  uint64_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v9];
  id v4 = v9;
  id v5 = v4;
  if (v3)
  {
    CFStringRef v12 = @"response";
    id v13 = v3;
    id v6 = &v13;
    id v7 = &v12;
  }
  else
  {
    CFStringRef v10 = @"err";
    id v11 = v4;
    id v6 = &v11;
    id v7 = &v10;
  }
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v7 count:1];
  [*(id *)(a1 + 32) sendReply:v8];
}

void sub_10000D064(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)GEOExternalRequestCounterCountReply) initWithRequest:*(void *)(a1 + 32)];
  [v4 setObjects:v3];

  [v4 send];
}

void sub_10000D398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]
    && ([v5 firstObject],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10004CC68();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setResults:v5];
    [*(id *)(a1 + 32) setError:v6];
    [*(id *)(a1 + 32) send];
  }
}

void sub_10000D81C(_Unwind_Exception *a1)
{
}

void sub_10000D834(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 localizedDescription];
      int v7 = 138477827;
      CFStringRef v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error updating resource manifest on datasetId change: %{private}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained serverProxy:*(void *)(a1 + 32) didChangeExperimentsInfo:*(void *)(*(void *)(a1 + 32) + 24)];
    notify_post("com.apple.GeoServices.experimentsChanged");
  }
}

id sub_10000D9E8()
{
  GEOConfigGetDouble();
  double v1 = v0;
  uint64_t v2 = GEOConfigGetString();
  if (!v2 || (CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - v1, GEOConfigGetDouble(), v3 > v4) || v1 > CFAbsoluteTimeGetCurrent())
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Nonexist or stale experiment GUID. Generating new one.", v9, 2u);
    }

    id v6 = +[NSUUID UUID];
    uint64_t v7 = [v6 UUIDString];

    GEOConfigSetString();
    CFAbsoluteTimeGetCurrent();
    GEOConfigSetDouble();
    uint64_t v2 = (void *)v7;
  }

  return v2;
}

void sub_10000E0D4(_Unwind_Exception *a1)
{
}

id sub_10000E7DC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 clientConfig];
  CFAbsoluteTime v3 = [v2 configKeyValues];
  CFAbsoluteTime v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = objc_msgSend(v1, "clientConfig", 0);
  id v6 = [v5 configKeyValues];

  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        switch([v11 abConfigValueType])
        {
          case 1u:
            CFStringRef v12 = [v11 abConfigValue];
            uint64_t v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 intValue]);
            goto LABEL_11;
          case 2u:
            CFStringRef v12 = [v11 abConfigValue];
            [v12 doubleValue];
            uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            goto LABEL_11;
          case 3u:
            CFStringRef v12 = [v11 abConfigValue];
            uint64_t v13 = [v12 stringValue];
            goto LABEL_11;
          case 4u:
            CFStringRef v12 = [v11 abConfigValue];
            uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 BOOLValue]);
LABEL_11:
            CFStringRef v14 = (void *)v13;

            if (v14)
            {
              id v15 = [v11 abConfigKey];
              [v4 setObject:v14 forKeyedSubscript:v15];
            }
            break;
          default:
            continue;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v4 count]) {
    CFStringRef v16 = v4;
  }
  else {
    CFStringRef v16 = 0;
  }
  id v17 = v16;

  return v17;
}

void sub_10000EFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000F024(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  GEOOnce();
}

id sub_10000F0B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_10000F0C0(uint64_t a1)
{
  global_queue = geo_get_global_queue();
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

void sub_10000F110(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = GEOFindOrCreateLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138543362;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error loading experiment configuration from service: %{public}@", (uint8_t *)&v32, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    GEOConfigGetDouble();
    objc_msgSend(WeakRetained, "_submitNonRepeatingRetryTask:");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v32 = 138477827;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Loaded new experiment configuration: %{private}@", (uint8_t *)&v32, 0xCu);
    }

    id v11 = +[GEOResourceManifestManager modernManager];
    CFStringRef v12 = [v11 activeTileGroup];
    uint64_t v13 = [v12 dataSet];
    id v14 = [v13 identifier];

    id v15 = [v6 mapsAbClientMetadata];
    CFStringRef v16 = [v15 clientDatasetMetadata];
    [v16 setDatasetId:v14];

    uint64_t v17 = [v6 parsecClientMetadata];
    CFStringRef v18 = [v17 clientDatasetMetadata];
    [v18 setDatasetId:v14];

    long long v19 = [v6 siriClientMetadata];
    long long v20 = [v19 clientDatasetMetadata];
    [v20 setDatasetId:v14];

    long long v21 = [v6 rapClientMetadata];
    long long v22 = [v21 clientDatasetMetadata];
    [v22 setDatasetId:v14];

    [v6 timestamp];
    double v24 = v23;
    [*(id *)(*(void *)(a1 + 32) + 24) timestamp];
    objc_msgSend(v6, "setTimestamp:");
    LODWORD(v14) = [*(id *)(*(void *)(a1 + 32) + 24) isEqual:v6];
    [v6 setTimestamp:v24];
    if (v14)
    {
      id v25 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "New experiment configuration is the same as the previous experiment configuration", (uint8_t *)&v32, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [*(id *)(a1 + 32) _writeExperimentInfoToDisk:v6];
      [*(id *)(*(void *)(a1 + 32) + 24) setTimestamp:v24];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _setupRefreshTask];
    }
    else
    {
      uint64_t v26 = GEOExperimentConfigurationPath();
      id WeakRetained = [v26 stringByDeletingLastPathComponent];

      v27 = +[NSFileManager defaultManager];
      LOBYTE(v32) = 0;
      if (![v27 fileExistsAtPath:WeakRetained isDirectory:&v32] || !(_BYTE)v32) {
        [v27 createDirectoryAtPath:WeakRetained withIntermediateDirectories:1 attributes:0 error:0];
      }
      os_unfair_lock_lock_with_options();
      id v28 = *(id *)(*(void *)(a1 + 32) + 24);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
      id v29 = *(id *)(*(void *)(a1 + 32) + 24);
      [*(id *)(a1 + 32) _writeExperimentInfoToDisk:v6];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v30 = objc_loadWeakRetained((id *)(a1 + 48));
      [v30 _setupRefreshTask];

      id v31 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v31 serverProxy:*(void *)(a1 + 32) didChangeExperimentsInfo:v6];

      notify_post("com.apple.GeoServices.experimentsChanged");
      if (v28 != v29) {
        [*(id *)(a1 + 32) _notifyExperimentsInfoChanged:v28 current:v29];
      }
    }
  }
}

void sub_10000F634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000F650(uint64_t a1)
{
  uint64_t v2 = +[GEOResourceManifestManager modernManager];
  uint64_t v3 = *(void *)(a1 + 32);
  global_queue = (void *)geo_get_global_queue();
  [v2 addTileGroupObserver:v3 queue:global_queue];

  a1 += 40;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  [WeakRetained _removeOldExperimentsInfoIfNecessary:0];

  id v6 = objc_loadWeakRetained((id *)a1);
  [v6 _setupRefreshTask];

  id v7 = objc_loadWeakRetained((id *)a1);
  [v7 _updateIfNecessary];
}

void sub_10000F900(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = a1[4];
  id v7 = (void *)a1[5];
  if (v7 == *(void **)(v6 + 40))
  {
    *(void *)(v6 + 40) = 0;

    uint64_t v6 = a1[4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 48));
  [v10 setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v8 = GEOURLString();
  [v10 setSourceURL:v8];

  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);
  }
}

uint64_t sub_10000FB38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FFE8(id a1)
{
  qword_100084730 = objc_alloc_init(_GEOExperimentServiceRequestConfig);

  _objc_release_x1();
}

void sub_100010094(id a1)
{
  qword_100084740 = objc_alloc_init(_GEOExperimentServiceRequester);

  _objc_release_x1();
}

uint64_t sub_100010228(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100010498(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setDirectionsResponse:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_1000104D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setError:a2];
  [*(id *)(a1 + 32) setDirectionsError:v6];

  id v7 = *(void **)(a1 + 32);

  return [v7 send];
}

uint64_t sub_100010628()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100084748;
  uint64_t v5 = qword_100084748;
  if (!qword_100084748)
  {
    long long v6 = *(_OWORD *)off_100071678;
    long long v7 = *(_OWORD *)&off_100071688;
    v3[3] = _sl_dlopen();
    qword_100084748 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100010738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010750(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084748 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000107E0()
{
  uint64_t v0 = sub_100010628();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_10001083C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084750;
  uint64_t v7 = qword_100084750;
  if (!qword_100084750)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100010920;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100010920((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100010908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100010920(uint64_t a1)
{
  sub_1000107E0();
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    sub_10004CCB0();
    start();
  }
  qword_100084750 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void start()
{
  id v1 = GEOGetLaunchLog();
  os_signpost_id_t v2 = os_signpost_id_generate(v1);

  uint64_t v3 = GEOGetLaunchLog();
  uint64_t v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "geod_main", (const char *)&unk_1000649A7, buf, 2u);
  }

  uint64_t v5 = GEOGetLaunchLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = +[NSLocale currentLocale];
  +[NSError _setFileNameLocalizationEnabled:0];
  GEODefaultsSetUseServer();
  objc_opt_class();
  _GEOConfigSetProxy();
  +[GEOPlatform setIsRunningInGeod:1];
  id v8 = GEOGetLaunchLog();
  uint64_t v9 = v8;
  unint64_t v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "privacy manager", buf, 2u);
  }

  id v11 = +[GEOPrivacyManager sharedManager];
  CFStringRef v12 = GEOGetLaunchLog();
  uint64_t v13 = v12;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "privacy manager", buf, 2u);
  }

  id v14 = GEOGetLaunchLog();
  id v15 = v14;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "defaults migrator", buf, 2u);
  }

  GEOMigrateDefaults();
  CFStringRef v16 = GEOGetLaunchLog();
  uint64_t v17 = v16;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "defaults migrator", buf, 2u);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v18 = [&off_100077750 countByEnumeratingWithState:&v68 objects:v67 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v69;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v69 != v20) {
          objc_enumerationMutation(&off_100077750);
        }
        uint64_t v22 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        double v23 = +[NSFileManager defaultManager];
        unsigned int v24 = [v23 fileExistsAtPath:v22];

        if (v24)
        {
          id v25 = +[NSFileManager defaultManager];
          [v25 removeItemAtPath:v22 error:0];
        }
      }
      id v19 = [&off_100077750 countByEnumeratingWithState:&v68 objects:v67 count:16];
    }
    while (v19);
  }
  uint64_t v26 = GEOGetLaunchLog();
  v27 = v26;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "tiledb migrator", buf, 2u);
  }

  id v28 = +[GEOFilePaths pathFor:32778];
  id v29 = +[GEOFilePaths pathFor:16394];
  id v30 = +[NSFileManager defaultManager];
  if ([v30 fileExistsAtPath:v28])
  {
    id v31 = +[NSFileManager defaultManager];
    unsigned __int8 v32 = [v31 fileExistsAtPath:v29];

    if ((v32 & 1) == 0) {
      +[GEOTileDB migrateDBFrom:v28 to:v29];
    }
  }
  else
  {
  }
  id v33 = +[GEOFilePaths pathFor:16394];
  id v34 = +[GEOFilePaths pathFor:32778];
  v35 = +[NSFileManager defaultManager];
  if ([v35 fileExistsAtPath:v33])
  {
    id v36 = +[NSFileManager defaultManager];
    unsigned __int8 v37 = [v36 fileExistsAtPath:v34];

    if ((v37 & 1) == 0) {
      +[GEOTileDB migrateFilesFrom:v33 to:v34];
    }
  }
  else
  {
  }
  id v38 = +[GEOFilePaths pathFor:25];
  id v39 = +[NSFileManager defaultManager];
  unsigned int v40 = [v39 fileExistsAtPath:v38];

  if (v40) {
    +[GEOSQLiteDB deleteAllDBFilesFor:v38];
  }

  char v41 = GEOGetLaunchLog();
  v42 = v41;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "tiledb migrator", buf, 2u);
  }

  id v43 = GEOGetLaunchLog();
  v44 = v43;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "configure proxies", buf, 2u);
  }

  +[GEODirectionsRequester useLocalProxy];
  +[GEOCountryConfiguration setUseLocalProxy:1];
  +[GEONetworkDefaults setUseLocalProxy:1];
  +[GEORequestCounter useLocalProxy];
  +[GEOLocationShifter setProxyClass:objc_opt_class()];
  +[GEOResourceManifestManager useLocalProxy];
  +[GEOTileServerLocalProxy enableCDSObserversIfNecessary];
  +[GEOWiFiQualityServiceManager useProxyClass:objc_opt_class()];
  +[GEOResourceRequester setProxyClass:objc_opt_class()];
  +[GEOAnalyticsDataService useLocalProxy];
  +[GEOTileLoader setMemoryCacheCountLimit:0];
  +[GEOTileLoader setMemoryCacheTotalCostLimit:0];
  +[GEOExperimentConfiguration useProxy:objc_opt_class()];
  +[GEOTileLoader useLocalLoader];
  +[GEOMapDataSubscriptionManager _setSharedManagerUseLocalPersistence:1];
  +[GEOOfflineDataAccess _setSharedInstanceUseLocalPersistence:1];
  +[GEOSearchAttributionManifestManager useLocalProxy];
  long long v45 = GEOGetLaunchLog();
  long long v46 = v45;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "configure proxies", buf, 2u);
  }

  long long v47 = GEOGetLaunchLog();
  long long v48 = v47;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "add servers", buf, 2u);
  }

  id v49 = [objc_alloc((Class)GEODaemon) initPrimaryDaemon];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  [v49 addServerClass:objc_opt_class()];
  id v50 = GEOGetLaunchLog();
  id v51 = v50;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "add servers", buf, 2u);
  }

  [v49 start];
  sub_1000452C4();
  [v49 initializeAndStartPairedDeviceConnectionIfNecessary];
  if (sub_100022B80())
  {
    v52 = [v49 submitBGSTQueue];
    dispatch_async(v52, &stru_1000716E8);
  }
  v53 = GEOGetLaunchLog();
  int v54 = v53;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_BEGIN, v6, "geod_main_subtask", "configure cache delete", buf, 2u);
  }

  id v56 = +[GEODiskSpaceManager sharedManager];
  __int16 v57 = objc_alloc_init(GEOImageServiceDiskSpaceProvider);
  [(GEOImageServiceDiskSpaceProvider *)v57 setDaemon:v49];
  [v56 addDiskSpaceProvider:v57];
  id v58 = objc_alloc_init(GEOMobileAssetResourceDiskSpaceProvider);
  [(GEOMobileAssetResourceDiskSpaceProvider *)v58 setDaemon:v49];
  [v56 addDiskSpaceProvider:v58];
  v59 = objc_alloc_init(GEOTileCacheDiskSpaceProvider);
  [v56 addDiskSpaceProvider:v59];

  v60 = objc_alloc_init(GEOPlaceCardDiskSpaceProvider);
  [v56 addDiskSpaceProvider:v60];

  v61 = GEOGetLaunchLog();
  v62 = v61;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_END, v6, "geod_main_subtask", "configure cache delete", buf, 2u);
  }

  +[GEOPairedDeviceFilePaths registerCleanupTasks];
  notify_post(GEODaemonDidStartDarwinNotification);
  global_workloop = geo_get_global_workloop();
  dispatch_async(global_workloop, &stru_100071708);

  v64 = GEOGetLaunchLog();
  v65 = v64;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, v2, "geod_main", (const char *)&unk_1000649A7, buf, 2u);
  }

  dispatch_main();
}

void sub_100011624(id a1)
{
}

void sub_100011630(id a1)
{
  sub_100011680();
  id v1 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  [v1 refresh:0];
}

void sub_100011680()
{
  uint64_t v0 = +[GEOFilePaths pathFor:1];
  v48[0] = v0;
  id v1 = +[GEOFilePaths pathFor:2];
  v48[1] = v1;
  os_signpost_id_t v2 = +[NSArray arrayWithObjects:v48 count:2];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v2;
  id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v28)
  {
    unsigned __int8 v32 = 0;
    uint64_t v27 = *(void *)v43;
    uint64_t v3 = GEOPlaceCalculateFreeableSpaceReply_ptr;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v4;
        uint64_t v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        os_signpost_id_t v6 = [v3[62] defaultManager];
        id v34 = v5;
        id v7 = [v6 enumeratorAtPath:v5];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v31 = v7;
        id v8 = [v31 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v33 = *(void *)v39;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v39 != v33) {
                objc_enumerationMutation(v31);
              }
              uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v13 = [v34 stringByAppendingPathComponent:v11];
              id v14 = [v3[62] defaultManager];
              id v15 = [v14 attributesOfItemAtPath:v13 error:0];

              if (v15)
              {
                char v37 = 0;
                CFStringRef v16 = v3;
                uint64_t v17 = [v3[62] defaultManager];
                [v17 fileExistsAtPath:v13 isDirectory:&v37];

                id v18 = [v13 lastPathComponent];
                id v19 = +[GEOFilePaths pathFor:36];
                uint64_t v20 = [v19 lastPathComponent];
                unsigned __int8 v21 = [v18 isEqual:v20];

                if ((v21 & 1) != 0
                  || ([v15 objectForKeyedSubscript:NSFileProtectionKey],
                      uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                      unsigned __int8 v23 = [v22 isEqualToString:NSFileProtectionNone],
                      v22,
                      (v23 & 1) != 0))
                {
                  uint64_t v3 = v16;
                }
                else
                {
                  unsigned int v24 = v32;
                  uint64_t v3 = v16;
                  if (!v32)
                  {
                    unsigned int v24 = +[NSMutableArray array];
                  }
                  unsigned __int8 v32 = v24;
                  [v24 addObject:v13];
                }
              }
            }
            id v9 = [v31 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v28);
  }
  else
  {
    unsigned __int8 v32 = 0;
  }

  if ([v32 count])
  {
    id v25 = +[GEOKeyBagNotification sharedObject];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100011AA4;
    v35[3] = &unk_100071490;
    id v36 = v32;
    [v25 runAfterFirstUnlock:0 block:v35];
  }
}

void sub_100011AA4(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  id v1 = [obj countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = *(void *)v14;
    *(void *)&long long v2 = 138478083;
    long long v10 = v2;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v5);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Fixing file protection level of %{public}@", buf, 0xCu);
        }
        id v7 = +[NSFileManager defaultManager];
        NSFileAttributeKey v21 = NSFileProtectionKey;
        NSFileProtectionType v22 = NSFileProtectionNone;
        id v8 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v12 = 0;
        [v7 setAttributes:v8 ofItemAtPath:v6 error:&v12];
        id v9 = v12;

        if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v10;
          uint64_t v18 = v6;
          __int16 v19 = 2113;
          id v20 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't set protection level for file %{private}@: %{private}@", buf, 0x16u);
        }

        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v13 objects:v23 count:16];
    }
    while (v3);
  }
}

uint64_t sub_100011CD8()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100084758;
  uint64_t v5 = qword_100084758;
  if (!qword_100084758)
  {
    long long v6 = *(_OWORD *)off_100071728;
    long long v7 = *(_OWORD *)&off_100071738;
    v3[3] = _sl_dlopen();
    qword_100084758 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100011DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011E00(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084758 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100011E90()
{
  uint64_t v0 = sub_100011CD8();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_100011EEC()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100084760;
  uint64_t v5 = qword_100084760;
  if (!qword_100084760)
  {
    long long v6 = *(_OWORD *)off_100071748;
    long long v7 = *(_OWORD *)&off_100071758;
    v3[3] = _sl_dlopen();
    qword_100084760 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100011FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012014(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084760 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000120A4()
{
  uint64_t v0 = sub_100011EEC();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100012100()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084768;
  uint64_t v7 = qword_100084768;
  if (!qword_100084768)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000121E4;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_1000121E4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000121CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000121E4(uint64_t a1)
{
  sub_100011E90();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084768 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10004CCD8();
    return (Class)sub_10001223C();
  }
  return result;
}

id sub_10001223C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084770;
  uint64_t v7 = qword_100084770;
  if (!qword_100084770)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100012320;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100012320((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100012308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100012320(uint64_t a1)
{
  sub_100011E90();
  Class result = objc_getClass("NRDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084770 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10004CD00();
    return (Class)sub_100012378(v3);
  }
  return result;
}

id sub_100012378()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084778;
  uint64_t v7 = qword_100084778;
  if (!qword_100084778)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001245C;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_10001245C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100012444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10001245C(uint64_t a1)
{
  sub_1000120A4();
  Class result = objc_getClass("PDRRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084778 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10004CD28();
    return (Class)sub_1000124B4(v3);
  }
  return result;
}

uint64_t sub_1000124B4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084780;
  uint64_t v6 = qword_100084780;
  if (!qword_100084780)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertySystemVersion");
    qword_100084780 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001258C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000125A4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertySystemVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084780 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000125F4()
{
  uint64_t v0 = (void **)sub_1000124B4();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_100012628(v3);
  }
}

uint64_t sub_100012628()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084788;
  uint64_t v6 = qword_100084788;
  if (!qword_100084788)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertySystemBuildVersion");
    qword_100084788 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012718(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertySystemBuildVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084788 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100012768()
{
  uint64_t v0 = (void **)sub_100012628();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_10001279C(v3);
  }
}

uint64_t sub_10001279C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084790;
  uint64_t v6 = qword_100084790;
  if (!qword_100084790)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertyProductType");
    qword_100084790 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10001288C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertyProductType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084790 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000128DC()
{
  uint64_t v0 = (void **)sub_10001279C();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_100012910(v3);
  }
}

uint64_t sub_100012910()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084798;
  uint64_t v6 = qword_100084798;
  if (!qword_100084798)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertyScreenScale");
    qword_100084798 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000129E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012A00(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertyScreenScale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084798 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100012A50()
{
  uint64_t v0 = (void **)sub_100012910();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_100012A84(v3);
  }
}

uint64_t sub_100012A84()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000847A0;
  uint64_t v6 = qword_1000847A0;
  if (!qword_1000847A0)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertyIsActive");
    qword_1000847A0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012B74(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertyIsActive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100012BC4()
{
  uint64_t v0 = (void **)sub_100012A84();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_100012BF8(v3);
  }
}

uint64_t sub_100012BF8()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000847A8;
  uint64_t v6 = qword_1000847A8;
  if (!qword_1000847A8)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRPairedDeviceRegistryDevicesDidUpdateNotification");
    qword_1000847A8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012CE8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRPairedDeviceRegistryDevicesDidUpdateNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100012D38()
{
  uint64_t v0 = (void **)sub_100012BF8();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_10004CD50();
    return (id)sub_100012D6C(v3);
  }
}

uint64_t sub_100012D6C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000847B0;
  uint64_t v6 = qword_1000847B0;
  if (!qword_1000847B0)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRWatchOSVersionForRemoteDevice");
    qword_1000847B0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012E5C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100012EAC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (uint64_t (*)(id))sub_100012D6C();
  if (v2)
  {
    uint64_t v3 = v2(v1);

    return v3;
  }
  else
  {
    uint64_t v5 = sub_10004CD50();
    return sub_100012EF4(v5);
  }
}

uint64_t sub_100012EF4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000847B8;
  uint64_t v6 = qword_1000847B8;
  if (!qword_1000847B8)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRVersionIsGreaterThanOrEqual");
    qword_1000847B8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100012FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100012FE4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRVersionIsGreaterThanOrEqual");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100013034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))sub_100012EF4();
  if (v4)
  {
    return v4(a1, a2);
  }
  else
  {
    uint64_t v6 = sub_10004CD50();
    return sub_100013080(v6);
  }
}

uint64_t sub_100013080()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000847C0;
  uint64_t v6 = qword_1000847C0;
  if (!qword_1000847C0)
  {
    id v1 = (void *)sub_100011E90();
    v4[3] = (uint64_t)dlsym(v1, "NRDevicePropertyIsAltAccount");
    qword_1000847C0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100013158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100013170(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E90();
  Class result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

GEOPDPlaceCache *sub_1000131C0()
{
  uint64_t v0 = (void **)sub_100013080();
  if (v0)
  {
    id v1 = *v0;
    return (GEOPDPlaceCache *)v1;
  }
  else
  {
    uint64_t v3 = (GEOPDPlaceCache *)sub_10004CD50();
    return [(GEOPDPlaceCache *)v3 initWithCacheFilePath:v5 schedulingDelegate:v6 manifestInfoProvider:v7];
  }
}

id sub_1000133D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "user_version") == (id)2)
  {
    SEL v4 = [v3 log];
    unsigned int v5 = sub_10001350C(v3, 0);

    if (!v5 || ![*(id *)(a1 + 32) _validateDBLocaleAndResetIfNecessary]) {
      goto LABEL_12;
    }
  }
  else if (([*(id *)(a1 + 32) _deleteAndResetDB:0] & 1) == 0)
  {
LABEL_12:
    id v8 = 0;
    goto LABEL_11;
  }
  id v6 = [v3 log];
  unsigned int v7 = sub_10001350C(v3, 0);

  if (!v7
    || !objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "INSERT OR REPLACE INTO pdplaces VALUES (@pdplacehash,@expiretime,@pdplace);",
                        @"placeInsKey")
    || !objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "INSERT OR REPLACE INTO pdplacelookup VALUES (@requestkey,@pdplacehash,@lastaccesstime);",
                        @"placeLookupInsKey")
    || !objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "SELECT a.requestkey, a.pdplacehash, b.pdplace, b.expiretime FROM pdplacelookup a, pdplaces b WHERE a.pdplacehash = b.pdplacehash;",
                        @"lookupAllPlacesKey"))
  {
    goto LABEL_12;
  }
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "SELECT * FROM pdplacelookup;",
         @"lookupAllKeysKey");
LABEL_11:

  return v8;
}

id sub_10001350C(void *a1, int a2)
{
  id v3 = a1;
  SEL v4 = v3;
  if (a2) {
    unsigned int v5 = "DROP TABLE locale";
  }
  else {
    unsigned int v5 = 0;
  }
  if (objc_msgSend(v3, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS locale(   rowid INTEGER PRIMARY KEY NOT NULL,    locale TEXT NOT NULL   );",
                       v5)
    && objc_msgSend(v4, "prepareStatement:forKey:", "INSERT INTO locale    (rowid, locale)    VALUES (0, @locale);",
                       @"SetLocale"))
  {
    id v6 = [v4 prepareStatement:"SELECT locale    FROM locale;" forKey:@"GetValue"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1000136F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001370C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001371C(uint64_t a1)
{
}

void sub_100013724(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateDBLocaleAndResetIfNecessary];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100013A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100013A98()
{
  uint64_t v0 = +[NSLocale currentLocale];
  id v1 = objc_msgSend(v0, "_geo_languageAndLocale");

  return v1;
}

uint64_t sub_100013AEC(uint64_t a1, void *a2)
{
  return 1;
}

void sub_100013CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001431C(uint64_t a1)
{
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100014790;
  v35[3] = &unk_1000717E8;
  long long v38 = &v40;
  void v35[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v36 = v4;
  uint64_t v39 = v5;
  id v37 = *(id *)(a1 + 48);
  unsigned __int8 v6 = [v3 executeStatement:@"placeInsKey" statementBlock:v35];
  *((unsigned char *)v41 + 24) = v6;
  if (v6)
  {
    unsigned int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138478083;
      uint64_t v46 = v8;
      __int16 v47 = 2048;
      uint64_t v48 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "wrote place with hash : %{private}@ / expire time : %lld", buf, 0x16u);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v10 = *(id *)(a1 + 56);
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      while (1)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v15 = *(void *)(a1 + 32);
          long long v16 = *(void **)(v15 + 8);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100014870;
          v27[3] = &unk_1000717E8;
          id v29 = &v40;
          v27[4] = v15;
          v27[5] = v14;
          id v28 = *(id *)(a1 + 40);
          uint64_t v30 = *(void *)(a1 + 72);
          unsigned int v17 = [v16 executeStatement:@"placeLookupInsKey" statementBlock:v27];
          *((unsigned char *)v41 + 24) = v17;
          if (v17)
          {
            uint64_t v18 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_15;
            }
            uint64_t v19 = (uint64_t)*(double *)(a1 + 72);
            *(_DWORD *)buf = 138478083;
            uint64_t v46 = v14;
            __int16 v47 = 2048;
            uint64_t v48 = v19;
            id v20 = v18;
            os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
            NSFileProtectionType v22 = "wrote place lookup key : %{private}@ / access time : %lld";
            uint32_t v23 = 22;
          }
          else
          {
            uint64_t v18 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            *(_DWORD *)buf = 138477827;
            uint64_t v46 = v14;
            id v20 = v18;
            os_log_type_t v21 = OS_LOG_TYPE_ERROR;
            NSFileProtectionType v22 = "unable to write place lookup key : %{private}@";
            uint32_t v23 = 12;
          }
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v22, buf, v23);
LABEL_15:

          if (!v17) {
            goto LABEL_21;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v31 objects:v44 count:16];
        uint64_t v24 = 1;
        if (!v11) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v24 = 1;
  }
  else
  {
    long long v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138477827;
      uint64_t v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "unable to write place with hash : %{private}@", buf, 0xCu);
    }
LABEL_21:
    uint64_t v24 = 0;
  }
LABEL_22:

  _Block_object_dispose(&v40, 8);
  return v24;
}

void sub_100014754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

BOOL sub_100014790(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindTextParameter:"@pdplacehash" toValue:a1[5] inStatement:a2 error:0];
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindInt64Parameter:"@expiretime" toValue:a1[8] inStatement:a2 error:0];
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindBlobNoCopyParameter:"@pdplace" toValue:a1[6] inStatement:a2 error:0];
  return *(unsigned char *)(*(void *)(a1[7] + 8) + 24) != 0;
}

BOOL sub_100014870(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@requestkey" toValue:*(void *)(a1 + 40) inStatement:a2 error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 48) inStatement:a2 error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindInt64Parameter:"@lastaccesstime" toValue:(uint64_t)*(double *)(a1 + 64) inStatement:a2 error:0];
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
}

void sub_100014FB0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 pdPlaceCacheKeyForRequest:0];
  id v5 = [*(id *)(a1 + 48) copy];
  [v2 _storePlace:v3 withHash:v4 forRequestKeys:v5];

  unsigned __int8 v6 = *(void **)(a1 + 64);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      global_queue = *(NSObject **)(a1 + 56);
    }
    else
    {
      global_queue = geo_get_global_queue();
      unsigned __int8 v6 = *(void **)(a1 + 64);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000150B8;
    block[3] = &unk_1000714E0;
    id v10 = v6;
    dispatch_async(global_queue, block);
    if (!v7) {
  }
    }
}

uint64_t sub_1000150B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000150C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000150D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) copy];
  [v2 _storePlace:v3 withHash:v4 forRequestKeys:v5];

  unsigned __int8 v6 = *(void **)(a1 + 72);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7)
    {
      global_queue = *(NSObject **)(a1 + 64);
    }
    else
    {
      global_queue = geo_get_global_queue();
      unsigned __int8 v6 = *(void **)(a1 + 72);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000151C8;
    block[3] = &unk_1000714E0;
    id v10 = v6;
    dispatch_async(global_queue, block);
    if (!v7) {
  }
    }
}

uint64_t sub_1000151C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000151D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000156BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evictPlaceWithHash:*(void *)(a1 + 40)];
}

id sub_1000156C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001574C;
  v5[3] = &unk_1000718B0;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_10001574C(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_100015A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100015AD0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015B54;
  v5[3] = &unk_1000718B0;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_100015B54(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_100016034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100016070(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000160F4;
  v5[3] = &unk_1000718B0;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_1000160F4(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_100016428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id sub_100016464(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000164E8;
  v5[3] = &unk_1000718B0;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_1000164E8(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_100016824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100016854(void *a1)
{
  if (objc_msgSend(*(id *)(a1[4] + 8), "prepareStatement:forKey:", "SELECT pdplacehash FROM pdplacelookup WHERE requestkey = @requestkey;",
                       @"lookupMUIDByPhoneKey"))
  {
    uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1[4] + 8) statementForKey:@"lookupMUIDByPhoneKey"];
    uint64_t v3 = +[NSString stringWithFormat:@"%@%@", @"phNo-", a1[5]];
    uint64_t v4 = *(void **)(a1[4] + 8);
    id v11 = 0;
    unsigned int v5 = [v4 bindTextParameter:"@requestkey" toValue:v3 inStatement:v2 error:&v11];
    id v6 = v11;
    if (v5)
    {
      if (sqlite3_step(v2) == 100)
      {
        while (1)
        {
          uint64_t v7 = [*(id *)(a1[4] + 8) stringForColumn:0 inStatment:v2];
          if ([v7 hasPrefix:@"muid-"])
          {
            id v8 = [v7 substringFromIndex:objc_msgSend(@"muid-", "length")];
            unint64_t v9 = strtouq((const char *)[v8 UTF8String], 0, 10);
            uint64_t v10 = a1[6];
            goto LABEL_10;
          }
          if ([v7 hasPrefix:@"bmid-"]) {
            break;
          }

          if (sqlite3_step(v2) != 100) {
            goto LABEL_11;
          }
        }
        id v8 = [v7 substringFromIndex:objc_msgSend(@"bmid-", "length")];
        unint64_t v9 = strtouq((const char *)[v8 UTF8String], 0, 10);
        uint64_t v10 = a1[7];
LABEL_10:
        *(void *)(*(void *)(v10 + 8) + 24) = v9;
      }
LABEL_11:
      sqlite3_reset(v2);
    }
  }
}

void sub_100016B34(uint64_t a1)
{
  [*(id *)(a1 + 32) _calculateFreeableSpace];
  id v2 = *(id *)(a1 + 40);
  geo_dispatch_async_qos();
}

uint64_t sub_100016BCC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_100016CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100016CFC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _calculateFreeableSpace];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_100016E38(const char **a1, int a2, const char **a3)
{
  if (a2)
  {
    uint64_t v4 = *a3;
    if (*a3) {
      uint64_t v4 = (const char *)strtoll(v4, 0, 10);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return 0;
}

void sub_100016FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016FC4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 56)];
  id v2 = *(id *)(a1 + 40);
  geo_dispatch_async_qos();
}

uint64_t sub_10001706C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void sub_10001719C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000171B4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100017300(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "DELETE FROM pdplaces ORDER BY expiretime ASC LIMIT @limit;",
             @"pdPlaceDelWithLimit");
  if (result)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"pdPlaceDelWithLimit"];
    id result = [*(id *)(*(void *)(a1 + 32) + 8) bindIntParameter:"@limit" toValue:*(unsigned int *)(a1 + 40) inStatement:v3 error:0];
    if (result)
    {
      id result = [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v3 error:0];
      if (result) {
        return (id)(sqlite3_exec((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB], "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE \"phNo-%\" AND pdplacehash NOT IN         (SELECT pdplacehash FROM pdplaces);",
      }
                      0,
                      0,
                      0) == 0);
    }
  }
  return result;
}

id sub_100017494(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017508;
  v4[3] = &unk_100071A18;
  v4[4] = v1;
  return [v2 executeInTransaction:v4];
}

BOOL sub_100017508(uint64_t a1)
{
  return !sqlite3_exec((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB], "DELETE FROM pdplacelookup WHERE requestkey LIKE \"phNo-%\";",
            0,
            0,
            0)
      && sqlite3_exec((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB], "DELETE FROM pdplaces WHERE pdplacehash NOT IN (SELECT pdplacehash FROM pdplacelookup);",
           0,
           0,
           0) == 0;
}

id sub_100017658(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000176E4;
  v5[3] = &unk_100071A18;
  void v5[4] = v2;
  return [v3 executeInTransaction:v5];
}

BOOL sub_1000176E4(uint64_t a1)
{
  return !sqlite3_exec((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB], "DELETE FROM pdplaces;",
            0,
            0,
            0)
      && sqlite3_exec((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB], "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE \"phNo-%\" AND pdplacehash NOT IN         (SELECT pdplacehash FROM pdplaces);",
           0,
           0,
           0) == 0;
}

id sub_10001798C(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCleanupAndAccessTimeUpdate];
}

id sub_100017F6C(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "DELETE FROM pdplaces WHERE pdplacehash = @pdplacehash;",
                        @"placeRemovePlaceKey"))
    return 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"placeRemovePlaceKey"];
  if (![*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 40) inStatement:v2 error:0])return 0; {
  if (![*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v2 error:0])
  }
    return 0;
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "prepareStatement:forKey:", "DELETE FROM pdplacelookup WHERE pdplacehash = @pdplacehash;",
                        @"placeLookupRemovePlaceKey"))
    return 0;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"placeLookupRemovePlaceKey"];
  if (![*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 40) inStatement:v3 error:0])return 0; {
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return [v4 executeStatement:v3 error:0];
}

id sub_1000180F8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

void sub_1000181E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000182AC;
  v4[3] = &unk_100071A68;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 statementForKey:@"lookupAllPlacesKey" statementBlock:v4];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_1000182AC(void *a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v5 = [*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2];
    id v6 = (void *)a1[5];
    if (v6 && ![v6 evaluateWithObject:v5])
    {
    }
    else
    {
      uint64_t v7 = [*(id *)(a1[4] + 8) stringForColumn:1 inStatment:a2];
      id v8 = [*(id *)(a1[4] + 8) noCopyBlobForColumn:2 inStatment:a2];
      id v9 = [objc_alloc((Class)GEOPDPlace) initWithData:v8];
      [*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2];
      char v10 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if ((v10 & 1) == 0) {
        return 1;
      }
    }
  }
  return 1;
}

void sub_100018774(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018838;
  v4[3] = &unk_100071A68;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 statementForKey:@"lookupAllKeysKey" statementBlock:v4];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_100018838(void *a1, sqlite3_stmt *a2)
{
  for (i = a2; sqlite3_step(i) == 100; i = a2)
  {
    id v6 = [*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2];
    uint64_t v7 = (void *)a1[5];
    if (v7 && ![v7 evaluateWithObject:v6])
    {
    }
    else
    {
      id v8 = [*(id *)(a1[4] + 8) stringForColumn:1 inStatment:a2];
      [*(id *)(a1[4] + 8) int64ForColumn:2 inStatment:a2];
      char v9 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if ((v9 & 1) == 0) {
        return 1;
      }
    }
  }
  return 1;
}

void sub_100018D68(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

uint64_t sub_100018F60(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_step(a2);
  while (v4 == 100)
  {
    id v5 = [*(id *)(a1 + 32) stringForColumn:0 inStatment:a2];
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
    {

      return 1;
    }
    uint64_t v4 = sqlite3_step(a2);
  }
  if (v4 != 101)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    [v6 reportSQLiteErrorCode:v4 method:@"step" error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    return 0;
  }
  return 1;
}

id sub_100019038(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v3 bindTextParameter:"@locale" toValue:v2 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

uint64_t sub_100019858(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = a5;
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([v11 hasEntitlement:*(void *)(*((void *)&v28 + 1) + 8 * (void)v19)])
        {
          uint64_t v26 = 1;
          xpc_object_t reply = v15;
          goto LABEL_13;
        }
        uint64_t v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v12);
  os_log_type_t v21 = [v11 bundleIdentifier];
  NSFileProtectionType v22 = +[NSString stringWithFormat:@"%@ is missing required entitlement to call %@.%@", v21, v13, v14];

  uint32_t v23 = +[NSError GEOErrorWithCode:-5 reason:v22];
  uint64_t v24 = GEOGetGEODaemonLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
  }

  id v25 = [objc_alloc((Class)GEOXPCReplyError) initWithReplyObject:reply error:v23 mode:a6];
  [v25 send];

  uint64_t v26 = 0;
LABEL_13:

  return v26;
}

void sub_10001A09C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = objc_alloc_init((Class)GEOPairedDeviceReply);
    [v3 setPing:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001BE38(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = objc_alloc_init((Class)GEOPairedDeviceReply);
    [v3 setConfigureSubscriptionShouldSync:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001D4D4(id a1)
{
  qword_1000847C8 = [[GEOMobileAssetResourceUpdater alloc] initInternal];

  _objc_release_x1();
}

id sub_10001D8F0(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateOnQueue];
  id result = *(id *)(a1 + 40);
  if (result)
  {
    return [result setTaskCompleted];
  }
  return result;
}

void sub_10001DAA0(uint64_t a1, uint64_t a2)
{
  id v4 = sub_10000966C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MA catalog result: %d", buf, 8u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DBA8;
  v7[3] = &unk_100071BA0;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

id sub_10001DBA8(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8)) {
    return [v1 _updateComplete];
  }
  else {
    return [v1 _fetchAssets];
  }
}

void sub_10001DE1C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_10000966C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v12[0] = 67109890;
    v12[1] = a2;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MA query result: %d error: %@ info; %@ resources: %@",
      (uint8_t *)v12,
      0x26u);
  }

  id v11 = [v7 count];
  if (a2 || !v11) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else {
    [*(id *)(a1 + 48) _processResources:v7 group:*(void *)(a1 + 40)];
  }
}

id sub_10001DF38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateComplete];
}

void sub_10001E118(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) _pruneOldResourcesIn:*(void *)(a1 + 32)];
  }
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void sub_10001E160(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10000966C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MA update result for %@: %ld error: %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001E698(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v13 = [v7 objectForKey:v12];
        id v14 = [v13 dictionaryRepresentation];
        [v6 setObject:v14 forKey:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v9);
  }

  __int16 v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        NSFileProtectionType v22 = [v16 objectForKey:v21];
        uint32_t v23 = _geo_NSErrorDictionaryRepresentationCopy();
        [v15 setObject:v23 forKey:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v18);
  }

  uint64_t v24 = *(void **)(a1 + 32);
  v35[0] = @"attributionInfos";
  v35[1] = @"errors";
  v36[0] = v6;
  v36[1] = v15;
  id v25 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v24 sendReply:v25];
}

void sub_10001EE34(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    id v7 = [v10 data];
    [v6 setObject:v7 forKey:@"response"];

    id v8 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v9 = *(void **)(a1 + 32);
    id v6 = +[NSDictionary _geo_replyDictionaryForError:v5 key:@"err"];
    id v8 = v9;
  }
  [v8 sendReply:v6];

LABEL_6:
}

void sub_10001EFBC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    v14[0] = @"uuid";
    v14[1] = @"uuidDate";
    v15[0] = v7;
    v15[1] = v8;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v12 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v9)
    {
      id v10 = +[NSError GEOErrorWithCode:-8 reason:@"unexpected"];
    }
    id v13 = *(void **)(a1 + 32);
    uint64_t v11 = +[NSDictionary _geo_replyDictionaryForError:v10 key:@"err"];
    uint64_t v12 = v13;
  }
  [v12 sendReply:v11];
}

void sub_10001F198(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    v14[0] = @"uuid";
    v14[1] = @"uuidDate";
    v15[0] = v7;
    v15[1] = v8;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v12 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v9)
    {
      id v10 = +[NSError GEOErrorWithCode:-8 reason:@"unexpected"];
    }
    id v13 = *(void **)(a1 + 32);
    uint64_t v11 = +[NSDictionary _geo_replyDictionaryForError:v10 key:@"err"];
    uint64_t v12 = v13;
  }
  [v12 sendReply:v11];
}

void sub_10001F4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

void sub_10001F8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F8B8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 48) peer];
  id v5 = sub_10001FA8C(v3, v2, v4);

  if (v5)
  {
    id v6 = sub_10001FB8C(*(void *)(a1 + 32), v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6 == v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v7 = [_GEOOfflinePeerHelper alloc];
    id v8 = [*(id *)(a1 + 48) peer];
    id v5 = sub_10001FC80((id *)&v7->super.isa, v8, *(void **)(a1 + 40));

    sub_10001FD3C((uint64_t)v5, 0);
    if (!v2)
    {
      uint64_t v2 = +[NSMutableArray arrayWithCapacity:5];
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    [v2 insertObject:v5 atIndex:0];
    id v9 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "via fetch state: cohort %{public}@ added peer %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

id sub_10001FA8C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 count])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100020EFC;
      v9[3] = &unk_100071D38;
      id v10 = v6;
      id v7 = [v5 indexOfObjectPassingTest:v9];
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        a1 = 0;
      }
      else
      {
        a1 = [v5 objectAtIndexedSubscript:v7];
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

id sub_10001FB8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && [v3 count])
  {
    id v5 = [v4 lastObject];
    if (sub_100020FEC((uint64_t)v5))
    {
      id v6 = v5;
    }
    else
    {
      id v7 = (char *)[v4 indexOfObjectWithOptions:2 passingTest:&stru_100071DA0];
      if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        id v6 = 0;
      }
      else
      {
        id v8 = v7;
        id v6 = [v4 objectAtIndexedSubscript:v7];
        if (v8 < (char *)[v4 count] - 1)
        {
          [v4 removeObjectAtIndex:v8];
          [v4 addObject:v6];
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id *sub_10001FC80(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_GEOOfflinePeerHelper;
    id v7 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, v5);
      id v8 = [v6 copy];
      id v9 = a1[4];
      a1[4] = v8;

      uint64_t v10 = geo_isolater_create_with_format();
      id v11 = a1[2];
      a1[2] = (id)v10;

      *((unsigned char *)a1 + 12) = 0;
      *((_WORD *)a1 + 5) = 0;
    }
  }

  return a1;
}

void sub_10001FD3C(uint64_t a1, char a2)
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    *(unsigned char *)(a1 + 9) = a2;
    _geo_isolate_unlock();
  }
}

void sub_10001FD90(_Unwind_Exception *a1)
{
}

void sub_100020150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002018C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002019C(uint64_t a1)
{
}

void sub_1000201A4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) setSubscribed:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

void sub_100020248(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_25;
  }
  if (sub_100020ADC((BOOL)a1, v7, v8))
  {
    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 1, 0, 0);
    goto LABEL_25;
  }
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  unsigned __int8 v52 = 0;
  unsigned __int8 v52 = [v7 hasEntitlement:@"com.apple.geod.offline.service.takeover"];
  if (*((unsigned char *)v50 + 24))
  {
    uint64_t v10 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Will allow takeover by peer %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v11 = sub_10002108C(a1, 0, v8);
    goto LABEL_15;
  }
  long long v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  char v43 = sub_100021524;
  long long v44 = &unk_100071DF0;
  long long v45 = a1;
  id v46 = v8;
  uint64_t v48 = &v49;
  id v12 = v7;
  id v47 = v12;
  geo_isolate_sync_data();
  if (*((unsigned char *)v50 + 24))
  {
    id v13 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      id v14 = "No active peers found, will allow subscription from peer %{public}@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    id v13 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      id v14 = "Active peers found, will NOT allow subscription from peer %{public}@";
      goto LABEL_13;
    }
  }

LABEL_15:
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v60 = 0x3032000000;
  v61 = sub_10002018C;
  v62 = sub_10002019C;
  id v63 = 0;
  long long v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_100021624;
  id v36 = &unk_100071DF0;
  id v37 = a1;
  id v15 = v8;
  id v38 = v15;
  p_long long buf = &buf;
  id v16 = v7;
  id v39 = v16;
  geo_isolate_sync_data();
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    id v17 = sub_10001FC80((id *)[_GEOOfflinePeerHelper alloc], v16, v15);
    id v18 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v17;
  }
  if (*((unsigned char *)v50 + 24))
  {
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = sub_10002018C;
    long long v31 = sub_10002019C;
    id v32 = 0;
    id v19 = v15;
    geo_isolate_sync_data();
    sub_10001FD3C(*(void *)(*((void *)&buf + 1) + 40), 1);
    id v20 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v28[5];
      uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v53 = 138543874;
      id v54 = v19;
      __int16 v55 = 2114;
      uint64_t v56 = v21;
      __int16 v57 = 2114;
      uint64_t v58 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "via subscribe: cohort %{public}@ ownership will switch from %{public}@ -> %{public}@", v53, 0x20u);
    }

    (*((void (**)(id, uint64_t, void, uint64_t))v9 + 2))(v9, 1, *(void *)(*((void *)&buf + 1) + 40), v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = sub_10002018C;
    long long v31 = sub_10002019C;
    id v32 = 0;
    id v23 = v15;
    geo_isolate_sync_data();
    sub_10001FD3C(*(void *)(*((void *)&buf + 1) + 40), 1);
    uint64_t v24 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v28[5];
      uint64_t v26 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v53 = 138543874;
      id v54 = v23;
      __int16 v55 = 2114;
      uint64_t v56 = v25;
      __int16 v57 = 2114;
      uint64_t v58 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "via subscribe: cohort %{public}@ ownership will NOT switch from %{public}@ -> %{public}@", v53, 0x20u);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, *(void *)(*((void *)&buf + 1) + 40), 0);
    _Block_object_dispose(&v27, 8);
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v49, 8);
LABEL_25:
}

void sub_1000208DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_10002093C(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) peer];
  uint64_t v4 = sub_10001FA8C(v2, v10, v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  sub_10001FD3C(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
  uint64_t v7 = sub_10001FB8C(*(void *)(a1 + 32), v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_100020A14(uint64_t a1, char a2)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      LOBYTE(v6) = a2;
      geo_isolate_sync_data();
      uint64_t v5 = objc_msgSend(WeakRetained, "connection", _NSConcreteStackBlock, 3221225472, sub_10002249C, &unk_100071E40, a1, v6);
      [v5 initiateBarrierIfNecessary:0 delegate:a1];
    }
  }
}

BOOL sub_100020ADC(BOOL a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  if (a1)
  {
    sub_100020B4C((id)a1, a3);
    id WeakRetained = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    }
    a1 = WeakRetained == v5;
  }
  return a1;
}

id sub_100020B4C(id a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_10002018C;
    id v11 = sub_10002019C;
    id v12 = 0;
    id v6 = v3;
    geo_isolate_sync_data();
    a1 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }

  return a1;
}

void sub_100020C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id *sub_100020C8C(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id sub_100020CBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && [*(id *)(a1 + 16) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [*(id *)(a1 + 16) allValues];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v9 count])
          {
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_100020EAC;
            v13[3] = &unk_100071D38;
            id v14 = v3;
            id v10 = [v9 indexOfObjectPassingTest:v13];
            if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v11 = [v9 objectAtIndexedSubscript:v10];

              goto LABEL_16;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v11 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
LABEL_16:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

BOOL sub_100020EAC(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  if (a2) {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  *a4 = WeakRetained == *(id *)(a1 + 32);

  return *a4;
}

BOOL sub_100020EFC(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  if (a2) {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  *a4 = WeakRetained == *(id *)(a1 + 32);

  return *a4;
}

void sub_100020F4C(void *a1)
{
  if ([*(id *)(a1[4] + 16) count])
  {
    uint64_t v2 = a1[4];
    id v6 = [*(id *)(v2 + 16) objectForKeyedSubscript:a1[5]];
    uint64_t v3 = sub_10001FB8C(v2, v6);
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

uint64_t sub_100020FEC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v3 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    uint64_t v1 = *(unsigned char *)(v1 + 9) != 0;
    _geo_isolate_unlock();
  }
  return v1;
}

void sub_100021048(_Unwind_Exception *a1)
{
}

BOOL sub_100021060(id a1, _GEOOfflinePeerHelper *a2, unint64_t a3, BOOL *a4)
{
  BOOL result = sub_100020FEC((uint64_t)a2);
  *a4 = result;
  return result;
}

id sub_10002108C(id a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_10002018C;
    id v14 = sub_10002019C;
    id v15 = 0;
    id v8 = v5;
    id v9 = v6;
    geo_isolate_sync_data();
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void sub_1000211D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000211EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = sub_10002123C(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));

  return _objc_release_x1();
}

id sub_10002123C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v28 = a3;
  if (!a1)
  {
    id v23 = 0;
    goto LABEL_37;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 16);
  id v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v29)
  {
    uint64_t v25 = 0;
    id v23 = 0;
    goto LABEL_34;
  }
  uint64_t v25 = 0;
  uint64_t v26 = a1;
  id v23 = 0;
  uint64_t v27 = *(void *)v31;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v31 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * i);
      unsigned int v8 = [v28 isEqual:v7];
      unsigned int v9 = v8;
      if (!v28 || v8)
      {
        uint64_t v10 = [*(id *)(a1 + 16) objectForKeyedSubscript:v7];
        if (v9)
        {
          id v11 = sub_10001FB8C(a1, v10);
        }
        else
        {
          id v11 = 0;
        }
        if ([v10 count])
        {
          unint64_t v12 = 0;
          do
          {
            uint64_t v13 = [v10 objectAtIndexedSubscript:v12];
            id v14 = (id *)v13;
            if (v13
              && (id WeakRetained = objc_loadWeakRetained((id *)(v13 + 24))) != 0
              && (long long v16 = WeakRetained,
                  id v17 = objc_loadWeakRetained(v14 + 3),
                  v17,
                  v16,
                  v17 != v5))
            {
              ++v12;
            }
            else
            {
              [v10 removeObjectAtIndex:v12];
            }
          }
          while (v12 < (unint64_t)[v10 count]);
        }
        if ([v10 count])
        {
          if (v9)
          {
            a1 = v26;
            long long v18 = sub_10001FB8C(v26, v10);
            id v19 = v18;
            if (v18 != v11)
            {
              id v20 = v18;

              id v23 = v20;
            }

            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v21 = v25;
          if (!v25)
          {
            uint64_t v21 = +[NSMutableArray arrayWithCapacity:3];
          }
          uint64_t v25 = v21;
          [v21 addObject:v7];
        }
        a1 = v26;
LABEL_29:

        continue;
      }
    }
    id v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v29);
LABEL_34:

  if ([v25 count]) {
    [*(id *)(a1 + 16) removeObjectsForKeys:v25];
  }

LABEL_37:

  return v23;
}

void sub_100021524(uint64_t a1)
{
  id v2 = sub_10002123C(*(void *)(a1 + 32), 0, *(void **)(a1 + 40));
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 count] == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = sub_10001FB8C(*(void *)(a1 + 32), v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3 == 0;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v4 = sub_10001FA8C(*(void **)(a1 + 32), v5, *(void **)(a1 + 48));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4 == v3;
    }
  }
}

void sub_100021624(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v6 = +[NSMutableArray arrayWithCapacity:3];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    id v2 = v6;
  }
  id v7 = v2;
  uint64_t v3 = sub_10001FA8C(*(void **)(a1 + 32), v2, *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000216D8(uint64_t *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = sub_10001FB8C(a1[4], v5);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [v5 removeObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
  [v5 addObject:*(void *)(*(void *)(a1[7] + 8) + 40)];
}

void sub_10002177C(uint64_t *a1)
{
  id v5 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = sub_10001FB8C(a1[4], v5);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (([v5 containsObject:*(void *)(*(void *)(a1[7] + 8) + 40)] & 1) == 0) {
    [v5 insertObject:*(void *)(*(void *)(a1[7] + 8) + 40) atIndex:0];
  }
}

void sub_100021AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_10002018C;
    id v28 = sub_10002019C;
    id v29 = 0;
    long long v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    long long v18 = sub_100021FB8;
    id v19 = &unk_100071CC0;
    uint64_t v20 = a1;
    id v21 = v6;
    id v22 = v5;
    id v23 = &v24;
    geo_isolate_sync_data();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = (id)v25[5];
    id v9 = [v8 countByEnumeratingWithState:&v12 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          sub_1000221B0(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v12 objects:v30 count:16];
      }
      while (v9);
    }

    _Block_object_dispose(&v24, 8);
  }
}

void sub_100021C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_100021EF8(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      geo_isolate_sync_data();
      uint64_t v3 = [WeakRetained connection];
      [v3 initiateBarrierIfNecessary:0 delegate:a1];
    }
  }
}

void sub_100021FB8(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if ((unint64_t)[v2 count] > 1
    || (([v2 lastObject], uint64_t v3 = objc_claimAutoreleasedReturnValue(), (v4 = (void *)v3) == 0)
      ? (id v5 = 0)
      : (id v5 = objc_loadWeakRetained((id *)(v3 + 24))),
        id v6 = (id)a1[6],
        v5,
        v4,
        v5 != v6))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v2;
    id v7 = v2;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (v12)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v12 + 24));
            if (WeakRetained)
            {
              long long v14 = WeakRetained;
              id v15 = objc_loadWeakRetained((id *)(v12 + 24));
              id v16 = (id)a1[6];

              if (v15 != v16)
              {
                uint64_t v17 = *(void **)(*(void *)(a1[7] + 8) + 40);
                if (!v17)
                {
                  uint64_t v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
                  uint64_t v19 = *(void *)(a1[7] + 8);
                  uint64_t v20 = *(void **)(v19 + 40);
                  *(void *)(v19 + 40) = v18;

                  uint64_t v17 = *(void **)(*(void *)(a1[7] + 8) + 40);
                }
                [v17 addObject:v12];
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v2 = v21;
  }
}

void sub_1000221B0(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      geo_isolate_sync_data();
      uint64_t v3 = [WeakRetained connection];
      [v3 initiateBarrierIfNecessary:0 delegate:a1];
    }
  }
}

void sub_10002237C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022394(uint64_t a1)
{
  sub_100020CBC(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    id v9 = v2;
    id v5 = v2[4];
    uint64_t v6 = sub_10002123C(v3, v4, v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v2 = v9;
  }
}

uint64_t sub_10002242C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t sub_10002248C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 11) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t sub_10002249C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 10) = 1;
  if (!*(unsigned char *)(result + 40)) {
    *(unsigned char *)(*(void *)(result + 32) + 11) = 0;
  }
  return result;
}

uint64_t sub_1000224CC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 12) = 1;
  return result;
}

void sub_1000229A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void *sub_100022A14(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + 8);
  uint64_t v1 = 10;
  while (!*(unsigned char *)(result[4] + v1))
  {
LABEL_5:
    if (++v1 == 13) {
      return result;
    }
  }
  uint64_t v2 = *(void *)(result[6] + 8);
  if (*(void *)(v2 + 24) == 4)
  {
    *(void *)(v2 + 24) = v1 - 10;
    *(unsigned char *)(result[4] + v1) = 0;
    goto LABEL_5;
  }
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = 1;
  return result;
}

uint64_t sub_100022B80()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_1000847D8;
  uint64_t v5 = qword_1000847D8;
  if (!qword_1000847D8)
  {
    long long v6 = *(_OWORD *)off_100071E88;
    long long v7 = *(_OWORD *)&off_100071E98;
    v3[3] = _sl_dlopen();
    qword_1000847D8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100022C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022CA8(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000847D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100022D38()
{
  uint64_t v0 = sub_100022B80();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100022D94()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000847E0;
  uint64_t v7 = qword_1000847E0;
  if (!qword_1000847E0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100022E78;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100022E78((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100022E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100022E78(uint64_t a1)
{
  sub_100022D38();
  Class result = objc_getClass("BGSystemTaskScheduler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000847E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10004CD74();
    return (Class)sub_100022ED0(v3);
  }
  return result;
}

id sub_100022ED0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000847E8;
  uint64_t v7 = qword_1000847E8;
  if (!qword_1000847E8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100022FB4;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100022FB4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100022F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100022FB4(uint64_t a1)
{
  sub_100022D38();
  Class result = objc_getClass("BGNonRepeatingSystemTaskRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000847E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10004CD9C();
    return (Class)sub_10002300C();
  }
  return result;
}

id sub_10002300C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000847F0;
  uint64_t v7 = qword_1000847F0;
  if (!qword_1000847F0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000230F0;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_1000230F0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000230D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000230F0(uint64_t a1)
{
  sub_100022D38();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BGRepeatingSystemTaskRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000847F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (void *)sub_10004CDC4();
    sub_100023148(v2);
  }
}

void sub_100023148(id a1)
{
  qword_1000847F8 = (uint64_t)os_log_create("com.apple.GeoServices", "MAResource");

  _objc_release_x1();
}

uint64_t sub_1000238B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000238C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relocateOnQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_1000238D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v9 = sub_10000A4D0();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023A24;
    block[3] = &unk_100071ED0;
    uint64_t v10 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v16 = v10;
    id v17 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

    id v8 = v16;
    goto LABEL_5;
  }
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100023A34;
    v11[3] = &unk_100071EF8;
    id v13 = v6;
    uint64_t v14 = a2;
    id v12 = v5;
    dispatch_async(v7, v11);

    id v8 = v13;
LABEL_5:
  }
}

id sub_100023A24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relocateOnQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t sub_100023A34(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void sub_1000240DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100024170;
    v5[3] = &unk_100071928;
    id v6 = v2;
    uint64_t v7 = a2;
    dispatch_async(v4, v5);
  }
}

uint64_t sub_100024170(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

uint64_t sub_100024188(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

uint64_t sub_100024370(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100024380(uint64_t a1)
{
}

void sub_100024388(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v3 _removeResourceAt:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

void sub_1000248FC(id a1)
{
  qword_100084808 = geo_dispatch_queue_create();

  _objc_release_x1();
}

id sub_100024AC4(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  [*(id *)(a1 + 32) setFunction:v6];

  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 send];
}

id sub_100024C24(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  [*(id *)(a1 + 32) setFunction:v6];

  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 send];
}

void sub_100025090(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  id v10 = objc_alloc_init((Class)GEOLocationShiftingCacheItem);
  [v10 setAddDate:v9];

  objc_msgSend(v10, "setCoordinate:", a3, a4);
  [v10 setRadiusMeters:a5];
  [*(id *)(a1 + 32) addObject:v10];
}

id sub_100025140(uint64_t a1)
{
  [*(id *)(a1 + 32) setItems:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 send];
}

uint64_t sub_100025244(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v3 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    uint64_t v1 = *(unsigned char *)(v1 + 24) != 0;
    _geo_isolate_unlock();
  }
  return v1;
}

void sub_1000252B0(_Unwind_Exception *a1)
{
}

id sub_100025428(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setData:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_1000255FC(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setExists:a2];
  [*(id *)(a1 + 32) setError:v6];

  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 send];
}

id sub_100025774(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setKeys:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_1000258BC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setMetadata:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 send];
}

uint64_t sub_100025A40()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100084818;
  uint64_t v5 = qword_100084818;
  if (!qword_100084818)
  {
    long long v6 = *(_OWORD *)off_1000720D0;
    long long v7 = *(_OWORD *)&off_1000720E0;
    v3[3] = _sl_dlopen();
    qword_100084818 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100025B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025B68(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084818 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100025BF8()
{
  uint64_t v0 = sub_100025A40();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100025C54()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084820;
  uint64_t v7 = qword_100084820;
  if (!qword_100084820)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100025D38;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100025D38((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100025D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100025D38(uint64_t a1)
{
  sub_100025BF8();
  Class result = objc_getClass("MAAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084820 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10004CDEC();
    return (Class)sub_100025D90(v3);
  }
  return result;
}

id sub_100025D90()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084828;
  uint64_t v7 = qword_100084828;
  if (!qword_100084828)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100025E74;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100025E74((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100025E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100025E74(uint64_t a1)
{
  sub_100025BF8();
  Class result = objc_getClass("MAAssetQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084828 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10004CE14();
    return (Class)sub_100025ECC();
  }
  return result;
}

id sub_100025ECC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100084830;
  uint64_t v7 = qword_100084830;
  if (!qword_100084830)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100025FB0;
    v3[3] = &unk_1000716C8;
    v3[4] = &v4;
    sub_100025FB0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100025F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100025FB0(uint64_t a1)
{
  sub_100025BF8();
  Class result = objc_getClass("MADownloadOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100084830 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10004CE3C();
    return (Class)sub_100026008(v3);
  }
  return result;
}

uint64_t sub_100026008()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084838;
  uint64_t v6 = qword_100084838;
  if (!qword_100084838)
  {
    id v1 = (void *)sub_100025BF8();
    v4[3] = (uint64_t)dlsym(v1, "MAPurgeAll");
    qword_100084838 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000260E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000260F8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100025BF8();
  Class result = dlsym(v2, "MAPurgeAll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084838 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100026148(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  uint64_t v4 = (void (*)(id, id))sub_100026008();
  if (v4)
  {
    v4(v6, v3);
  }
  else
  {
    uint64_t v5 = sub_10004CD50();
    sub_1000261B4(v5);
  }
}

uint64_t sub_1000261B4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084840;
  uint64_t v6 = qword_100084840;
  if (!qword_100084840)
  {
    id v1 = (void *)sub_100025BF8();
    v4[3] = (uint64_t)dlsym(v1, "MAPurgeCatalogs");
    qword_100084840 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10002628C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000262A4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100025BF8();
  Class result = dlsym(v2, "MAPurgeCatalogs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084840 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000262F4(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  uint64_t v4 = (void (*)(id, id))sub_1000261B4();
  if (v4)
  {
    v4(v7, v3);
  }
  else
  {
    uint64_t v5 = (_GEOLocationShifterLocalProxy *)sub_10004CD50();
    [(_GEOLocationShifterLocalProxy *)v5 init];
  }
}

void sub_10002649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000264B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained persistentCache];
    [v2 removeAllShiftEntries];

    id WeakRetained = v3;
  }
}

void sub_100026A18(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length] && GEOConfigGetBOOL())
  {
    GEOConfigGetArray();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v7 hasSuffix:@"*"])
          {
            id v8 = objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 1);
            unsigned __int8 v9 = [*(id *)(a1 + 32) hasPrefix:v8];

            if (v9) {
              goto LABEL_19;
            }
          }
          else if ([*(id *)(a1 + 32) isEqualToString:v7])
          {
LABEL_19:
            unsigned int v12 = 1;
            id v13 = v2;
            goto LABEL_20;
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v10 = sub_10001083C();
    id v11 = [*(id *)(a1 + 40) bundleId];
    id v24 = 0;
    unsigned int v12 = [v10 _checkAndExerciseAuthorizationForBundleID:v11 error:&v24];
    id v13 = v24;

    if (v13)
    {
      uint64_t v2 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unexpected error checking CL auth: %@", buf, 0xCu);
      }
      unsigned int v12 = 0;
LABEL_20:
    }
  }
  else
  {
    unsigned int v12 = 0;
  }
  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = "NO";
    id v16 = *(NSObject **)(a1 + 32);
    if (v12) {
      uint64_t v15 = "YES";
    }
    *(_DWORD *)long long buf = 138412546;
    long long v30 = v16;
    __int16 v31 = 2080;
    long long v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Can use persistent cache for %@? %s", buf, 0x16u);
  }

  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(NSObject **)(v17 + 24);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026D90;
  v19[3] = &unk_100072120;
  v19[4] = v17;
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 40);
  char v23 = v12;
  id v22 = *(id *)(a1 + 64);
  dispatch_async(v18, v19);
}

id sub_100026D90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shiftLatLng:*(void *)(a1 + 40) auditToken:*(void *)(a1 + 48) usePersistentCache:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

id sub_100026F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void **)(a1 + 32);
  if (a2) {
    return [v5 _callCompletionHandler:*(void *)(a1 + 64) withRequestedCoordinate:*(void *)(a1 + 40) reduceRadius:a2 forResponse:a4 error:*(double *)(a1 + 72)];
  }
  else {
    return [v5 _doNetworkRequestForLatLng:*(void *)(a1 + 40) reduceRadius:*(void *)(a1 + 48) traits:*(void *)(a1 + 56) auditToken:*(unsigned __int8 *)(a1 + 80) shouldCache:*(void *)(a1 + 64) completionHandler:*(double *)(a1 + 72)];
  }
}

void sub_10002711C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12
    && (id v6 = objc_alloc((Class)GEOLocationShiftFunctionResponse),
        [*(id *)(a1 + 32) coordinate],
        (id v9 = objc_msgSend(v6, "initWithPolyLocationShiftResponse:originalCoordinate:version:", v12, +[GEOLocationShifter locationShiftFunctionVersion](GEOLocationShifter, "locationShiftFunctionVersion"), v7, v8)) != 0))
  {
    id v10 = v9;
    if (*(unsigned char *)(a1 + 64))
    {
      id v11 = [*(id *)(a1 + 40) persistentCache];
      [v11 storeShiftResponse:v10];
    }
  }
  else
  {
    if (!v5)
    {
      id v5 = +[NSError GEOErrorWithCode:-13];
    }
    id v10 = 0;
  }
  [*(id *)(a1 + 40) _callCompletionHandler:*(void *)(a1 + 48) withRequestedCoordinate:*(void *)(a1 + 32) reduceRadius:v10 forResponse:v5 error:*(double *)(a1 + 56)];
}

uint64_t sub_100027360(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1000275B8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027694;
  block[3] = &unk_1000721C0;
  id v9 = *(id *)(a1 + 40);
  id v14 = v7;
  id v15 = v9;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t sub_100027694(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100027750(id a1)
{
  qword_100084850 = objc_alloc_init(_GEOLocationShiftRequestConfig);

  _objc_release_x1();
}

uint64_t sub_10002791C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100027C4C(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void sub_100027C5C(uint64_t a1, void *a2, void *a3)
{
  id v10 = *(id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  geo_isolate_sync();
  (*(void (**)(void, id, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v6, v8, v9);
}

id sub_100027D34(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_100027F14(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void sub_100027F24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = *(id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  geo_isolate_sync();
  (*(void (**)(void, void, id, id, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), v9, v10, v8);
}

id sub_100028018(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100028120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028148(uint64_t a1)
{
}

id sub_100028150(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 8);

  return [v6 removeObjectForKey:v5];
}

uint64_t sub_1000282E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000283C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000286C0(id a1)
{
  qword_100084858 = (uint64_t)os_log_create("com.apple.GeoServices", "ImageService");

  _objc_release_x1();
}

uint64_t sub_100028704()
{
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100084868;
  uint64_t v5 = qword_100084868;
  if (!qword_100084868)
  {
    long long v6 = *(_OWORD *)off_1000722C8;
    long long v7 = *(_OWORD *)&off_1000722D8;
    v3[3] = _sl_dlopen();
    qword_100084868 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100028814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002882C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084868 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000288BC()
{
  uint64_t v0 = sub_100028704();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_100028918()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100084870;
  uint64_t v6 = qword_100084870;
  if (!qword_100084870)
  {
    id v1 = (void *)sub_1000288BC();
    v4[3] = (uint64_t)dlsym(v1, "AnalyticsSendEventLazy");
    qword_100084870 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000289F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100028A08(uint64_t a1)
{
  uint64_t v2 = (void *)sub_1000288BC();
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100084870 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

GEOTransitUpdateServer *sub_100028A58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (uint64_t (*)(id, id))sub_100028918();
  if (v5)
  {
    uint64_t v6 = v5(v3, v4);

    return (GEOTransitUpdateServer *)v6;
  }
  else
  {
    id v8 = (GEOTransitUpdateServer *)sub_10004CD50();
    return [(GEOTransitUpdateServer *)v8 initWithDaemon:v10];
  }
}

void sub_100028D38(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) request];
  [v1 addObject:v2];
}

void sub_100028D98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(a1 + 48), "setResponse:", v7, _NSConcreteStackBlock, 3221225472, sub_100028E80, &unk_100071888, v8);

  [*(id *)(a1 + 48) setError:v6];
  [*(id *)(a1 + 48) send];
}

void sub_100028E80(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) request];
  [v1 removeObject:v2];
}

void sub_100029078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100029090(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000290A0(uint64_t a1)
{
}

void sub_1000290A8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [*(id *)(a1 + 40) request];
  uint64_t v3 = [v2 member:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000298AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"urgency"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[GEODiskSpaceManager sharedManager];
    id v5 = objc_msgSend(v4, "purgableDiskSpaceForUrgency:", objc_msgSend(v3, "intValue"));

    CFStringRef v10 = @"bytes";
    id v6 = +[NSNumber numberWithUnsignedLongLong:v5];
    id v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [*(id *)(a1 + 32) sendReply:v7];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v7 = +[NSError GEOErrorWithCode:-12 reason:@"urgency must be a number"];
    id v9 = +[NSDictionary _geo_replyDictionaryForError:v7 key:@"err"];
    [v8 sendReply:v9];
  }
}

void sub_100029AE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"urgency"];

  uint64_t v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"bytes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = v5;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    geo_dispatch_async_qos();
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[NSError GEOErrorWithCode:-12 reason:@"urgency & space must be a number"];
    uint64_t v8 = +[NSDictionary _geo_replyDictionaryForError:v7 key:@"err"];
    [v6 sendReply:v8];
  }
}

void sub_100029C90(id *a1)
{
  id v2 = +[GEODiskSpaceManager sharedManager];
  id v3 = objc_msgSend(v2, "freePurgableDiskSpace:urgency:", objc_msgSend(a1[4], "unsignedLongLongValue"), objc_msgSend(a1[5], "intValue"));

  CFStringRef v6 = @"bytes";
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:v3];
  id v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  [a1[6] sendReply:v5];
}

void sub_100029EFC(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:GEOTileServerLocalProxyForceExplicitProactiveTileDownloadRunNotification object:*(void *)(a1 + 32)];
}

void sub_10002A59C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    CFStringRef v6 = @"ping";
    id v3 = [a2 type];
    if (v3 >= 3)
    {
      uint64_t v4 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    }
    else
    {
      uint64_t v4 = off_1000723E0[(int)v3];
    }
    id v7 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    [v2 sendReply:v5];
  }
}

void sub_10002AA20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      id v4 = [objc_alloc((Class)GEOOfflineServiceReply) initWithRequest:v3];
      id v5 = *(void **)(a1 + 8);
      CFStringRef v6 = [v3 request];
      id v7 = [v3 requestMetadata];
      qos_class_self();
      global_queue = (void *)geo_get_global_queue();
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10002AB60;
      v10[3] = &unk_100072400;
      id v11 = v4;
      id v9 = v4;
      [v5 processRequest:v6 requestMetaData:v7 queue:global_queue response:v10];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10004CEAC();
    }
  }
}

id sub_10002AB60(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setResponse:a2];
  [*(id *)(a1 + 32) setResponseMetadata:v9];

  [*(id *)(a1 + 32) setError:v8];
  id v10 = *(void **)(a1 + 32);

  return [v10 send];
}

void sub_10002ABEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 8) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10004CEAC();
  }
}

uint64_t sub_10002AC48(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_10002AC5C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

id sub_10002AE44(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setNames:a2];
  [*(id *)(a1 + 32) setPaths:v9];

  [*(id *)(a1 + 32) setError:v8];
  id v10 = *(void **)(a1 + 32);

  return [v10 send];
}

uint64_t sub_10002AED0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (GEOTileKeyIsOffline())
  {
    id v5 = [v3 valueForEntitlement:@"com.apple.geoservices.restricted-tiles"];
    if (([v5 containsObject:@"offline"] & 1) == 0)
    {
      CFStringRef v6 = GEOConfigGetArray();
      id v7 = [v4 offlineCohortId];
      unsigned __int8 v8 = [v6 containsObject:v7];

      if ((v8 & 1) == 0)
      {
        uint64_t v19 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          id v20 = [v4 offlineCohortId];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Attempt to load offline tiles from un-entitled or mis-entitled client: %{public}@", (uint8_t *)&buf, 0xCu);
        }
LABEL_24:
        uint64_t v18 = 0;
        goto LABEL_25;
      }
    }
  }
  *(void *)&long long buf = GEOTileKeyMakeOnline();
  *((void *)&buf + 1) = v9;
  if (GEOTileKeyStyle())
  {
    id v10 = v3;
    id v11 = v10;
    unint64_t v22 = -2;
    char v23 = &qword_100059CA0;
    do
    {
      if (v22 == 7) {
        goto LABEL_19;
      }
      int v24 = *((_DWORD *)v23 + 2);
      ++v22;
      v23 += 2;
    }
    while (v24);
    BOOL v25 = v22 + 1 > 8;
    if (v22 < 3)
    {
LABEL_19:

      goto LABEL_20;
    }
    unint64_t v26 = v22 + 2;
    id v12 = [v10 valueForEntitlement:@"com.apple.geoservices.restricted-tiles"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)*v23 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = *v23;
      }
      id v14 = (char *)&unk_100059C98 + 16 * v26 + 5;
      while (1)
      {
        char v15 = *v14++;
        char v16 = v15 - 1;
        CFStringRef v17 = @"<unknown>";
        if ((v15 - 1) <= 7u) {
          CFStringRef v17 = off_100072448[v16];
        }
        if ([v12 containsObject:v17]) {
          break;
        }
        if (!--v13) {
          goto LABEL_16;
        }
      }

      goto LABEL_19;
    }
LABEL_16:

    if (v25) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v18 = 1;
LABEL_25:

  return v18;
}

id sub_10002B188(void *a1, void *a2)
{
  id v19 = a1;
  id v3 = a2;
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v9 = v19;
        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (!v10)
        {

LABEL_20:
          uint64_t v9 = GEOGetSubscriptionsLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138477827;
            uint64_t v29 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Peer is not entitled for identifier '%{private}@'", buf, 0xCu);
          }
LABEL_22:

          continue;
        }
        id v11 = v10;
        char v12 = 0;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
            if (_GEOMapDataSubscriptionIdentifierIsCompatible())
            {
              [v4 addObject:v8];
              goto LABEL_22;
            }
            if (_GEOMapDataSubscriptionIdentifierIsCompatible())
            {
              [v4 addObject:v15];
              char v12 = 1;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
          if (v11) {
            continue;
          }
          break;
        }

        if ((v12 & 1) == 0) {
          goto LABEL_20;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v6);
  }

  return v4;
}

id sub_10002B8F8(void *a1)
{
  id v1 = [a1 valueForEntitlement:@"com.apple.geoservices.map-subscriptions"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    id v3 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
        }
        id v4 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v7 = v2;
  }
  else
  {
LABEL_13:
    id v7 = 0;
  }

  return v7;
}

void sub_10002BA60(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)GEOMapSubscriptionsFetchReply) initWithRequest:*(void *)(a1 + 32)];
  id v7 = v6;
  if (v5) {
    [v6 setError:v5];
  }
  else {
    [v6 setSubscriptions:v8];
  }
  [v7 send];
}

uint64_t sub_10002BDB8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v5 containsString:@"*"])
  {
    id v7 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 bundleIdentifier];
      *(_DWORD *)long long buf = 138543362;
      long long v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Attempt from peer '%{public}@' to add subscription with wildcard identifier", buf, 0xCu);
    }
    if (a3)
    {
      +[NSError GEOErrorWithCode:-12 reason:@"Cannot add a map subscription with an identifier containing wildcards ('*')"];
      uint64_t v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
    goto LABEL_28;
  }
  long long v10 = sub_10002B8F8(v6);
  if ([v10 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v10;
    long long v12 = (char *)[v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          if (_GEOMapDataSubscriptionIdentifierIsCompatible())
          {
            uint64_t v18 = GEOGetSubscriptionsLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              id v19 = [v6 bundleIdentifier];
              *(_DWORD *)long long buf = 138543875;
              long long v27 = v19;
              __int16 v28 = 2113;
              id v29 = v5;
              __int16 v30 = 2114;
              id v31 = v5;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Peer '%{public}@' is entitled for identifier '%{private}@' (entitlement value: %{public}@')", buf, 0x20u);
            }
            uint64_t v9 = 1;
            goto LABEL_27;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = (char *)[v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    char v16 = GEOGetSubscriptionsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v17 = [v6 bundleIdentifier];
      *(_DWORD *)long long buf = 138543619;
      long long v27 = v17;
      __int16 v28 = 2113;
      id v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Attempt from peer '%{public}@' to add subscription with unentitled identifier: '%{private}@'", buf, 0x16u);
    }
    if (!a3) {
      goto LABEL_26;
    }
    +[NSString stringWithFormat:@"Identifier mismatch for entitlement '%@'", @"com.apple.geoservices.map-subscriptions"];
  }
  else
  {
    if (!a3) {
      goto LABEL_26;
    }
    +[NSString stringWithFormat:@"Missing or incorrect entitlement '%@'", @"com.apple.geoservices.map-subscriptions"];
  long long v20 = };
  *a3 = +[NSError GEOErrorWithCode:-5 reason:v20];

LABEL_26:
  uint64_t v9 = 0;
LABEL_27:

LABEL_28:
  return v9;
}

id sub_10002C124(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setSubscription:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_10002C3A4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10002C5D8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setState:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_10002C624(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setState:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 send];
}

void sub_10002C8AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v12 = (unint64_t)objc_msgSend(v11, "dataTypes", (void)v16);
          if (((unint64_t)[*(id *)(a1 + 40) dataTypes] & v12) != 0)
          {
            uint64_t v13 = [v11 region];
            uint64_t v14 = [*(id *)(a1 + 40) region];
            unsigned __int8 v15 = [v13 containsRegion:v14];

            if (v15)
            {
              uint64_t v8 = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    [*(id *)(a1 + 32) setSufficientlyContained:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setError:a3];
  }
  objc_msgSend(*(id *)(a1 + 32), "send", (void)v16);
}

void sub_10002CDD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [a2 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 32), "setTimestamp:");
  }
  [*(id *)(a1 + 32) setError:v5];
  [*(id *)(a1 + 32) send];
}

void sub_10002D12C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_10002D208;
    long long v10 = &unk_100071888;
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = v6;
    geo_isolate_sync_data();
  }
  objc_msgSend(*(id *)(a1 + 48), "setSizeInBytes:", a2, v7, v8, v9, v10, v11);
  [*(id *)(a1 + 48) setError:v5];
  [*(id *)(a1 + 48) send];
}

id sub_10002D208(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10002D21C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) requestUUID];
  [v2 setObject:v6 forKey:v7];
}

void sub_10002D4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D4FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002D50C(uint64_t a1)
{
}

void sub_10002D514(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) requestUUID];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
  id v9 = [v7 requestUUID];
  [v8 removeObjectForKey:v9];
}

id sub_10002D708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "setError:");
  }
  else {
    [v4 setSizeInBytes:a2];
  }
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 send];
}

id sub_10002D85C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setSubscriptionsInfo:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_10002DA60(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setError:a2];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

void sub_10002DBC4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10002B188(*(void **)(a1 + 40), a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setIdentifiers:v4];
    [*(id *)(a1 + 32) send];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:");
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 send];
  }
}

id sub_10002DD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setSerializedReply:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_10002DE90(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setError:a2];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10002DFDC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setError:a2];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10002E108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 setSerializedSummary:a2];
  }
  else {
    objc_msgSend(v3, "setError:");
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 send];
}

id sub_10002E23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "setError:");
  }
  else {
    [v4 setAvailableBytes:a2];
  }
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 send];
}

void sub_10002E658(void *a1, void *a2)
{
  if (a2)
  {
    id v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v6 = a1[6];
    id v4 = a2;
    uint64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];
    objc_msgSend(v2, "broadcastState:forIdentifier:fromPairedDevice:toObservers:", v4, v3, 0, v5, v6);
  }
}

void sub_10002E708(void *a1, void *a2)
{
  if (a2)
  {
    id v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v6 = a1[6];
    id v4 = a2;
    uint64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];
    objc_msgSend(v2, "broadcastState:forIdentifier:fromPairedDevice:toObservers:", v4, v3, 1, v5, v6);
  }
}

void sub_10002ECC8(_Unwind_Exception *a1)
{
}

id *sub_10002ED08(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v5 = a1[2];
    _geo_isolate_lock_data();
    a1 = (id *)[a1[5] containsObject:v3];
    _geo_isolate_unlock();
  }
  return a1;
}

void sub_10002ED74(_Unwind_Exception *a1)
{
}

void *sub_10002ED8C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)_GEOMapSubscriptionStateObserverHelper;
    id v4 = objc_msgSendSuper2(&v8, "init");
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 1, v3);
      uint64_t v5 = geo_isolater_create_with_format();
      uint64_t v6 = (void *)a1[2];
      a1[2] = v5;
    }
  }

  return a1;
}

void sub_10002EE14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    if (([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
    {
      id v4 = *(void **)(a1 + 40);
      if (!v4)
      {
        uint64_t v5 = +[NSMutableArray array];
        uint64_t v6 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v5;

        id v4 = *(void **)(a1 + 40);
      }
      [v4 addObject:v3];
    }
    _geo_isolate_unlock();
  }
}

void sub_10002EEAC(_Unwind_Exception *a1)
{
}

void sub_10002EEC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    if (([*(id *)(a1 + 24) containsObject:v3] & 1) == 0)
    {
      id v4 = *(void **)(a1 + 24);
      if (!v4)
      {
        uint64_t v5 = +[NSMutableArray array];
        uint64_t v6 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v5;

        id v4 = *(void **)(a1 + 24);
      }
      [v4 addObject:v3];
    }
    _geo_isolate_unlock();
  }
}

void sub_10002EF5C(_Unwind_Exception *a1)
{
}

void sub_10002F1E8(_Unwind_Exception *a1)
{
}

void sub_10002F22C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v6 = a1[2];
    _geo_isolate_lock_data();
    if ([a1[5] containsObject:v3])
    {
      id v4 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 1);
        *(_DWORD *)long long buf = 138543875;
        id v8 = WeakRetained;
        __int16 v9 = 2160;
        uint64_t v10 = 1752392040;
        __int16 v11 = 2113;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[PairedDevice] Removing peer %{public}@ as an observer of paired device subscription %{private, mask.hash}@", buf, 0x20u);
      }
      [a1[5] removeObject:v3];
    }
    _geo_isolate_unlock();
  }
}

void sub_10002F354(_Unwind_Exception *a1)
{
}

void sub_10002F37C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v6 = a1[2];
    _geo_isolate_lock_data();
    if ([a1[3] containsObject:v3])
    {
      id v4 = GEOGetSubscriptionsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 1);
        *(_DWORD *)long long buf = 138543875;
        id v8 = WeakRetained;
        __int16 v9 = 2160;
        uint64_t v10 = 1752392040;
        __int16 v11 = 2113;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing peer %{public}@ as an observer of subscription %{private, mask.hash}@", buf, 0x20u);
      }
      [a1[3] removeObject:v3];
    }
    _geo_isolate_unlock();
  }
}

void sub_10002F4A4(_Unwind_Exception *a1)
{
}

uint64_t sub_10002F4CC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v3 = *(id *)(a1 + 16);
    _geo_isolate_lock_data();
    if ([*(id *)(v1 + 24) count]) {
      uint64_t v1 = 1;
    }
    else {
      uint64_t v1 = [*(id *)(v1 + 40) count] != 0;
    }
    _geo_isolate_unlock();
  }
  return v1;
}

void sub_10002F540(_Unwind_Exception *a1)
{
}

id *sub_10002F558(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v3 = a1[2];
    _geo_isolate_lock_data();
    uint64_t v1 = (id *)[v1[5] copy];
    _geo_isolate_unlock();
  }

  return v1;
}

void sub_10002F5C4(_Unwind_Exception *a1)
{
}

void sub_10002F700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002F718(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  id v2 = [v6 allObjects];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10002F8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002F8D4(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  id v2 = [v6 allObjects];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10002FA98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v9 = v6;
      id v10 = v5;
      geo_isolate_sync_data();
      if (*((unsigned char *)v12 + 24))
      {
        id v8 = objc_msgSend(WeakRetained, "connection", _NSConcreteStackBlock, 3221225472, sub_100030204, &unk_100071DC8, a1, v9, v10, &v11);
        [v8 initiateBarrierIfNecessary:0 delegate:a1];
      }
      _Block_object_dispose(&v11, 8);
    }
  }
}

void sub_10002FBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002FBE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      uint64_t v11 = 0;
      id v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v9 = v6;
      id v10 = v5;
      geo_isolate_sync_data();
      if (*((unsigned char *)v12 + 24))
      {
        id v8 = objc_msgSend(WeakRetained, "connection", _NSConcreteStackBlock, 3221225472, sub_100030168, &unk_100071DC8, a1, v9, v10, &v11);
        [v8 initiateBarrierIfNecessary:0 delegate:a1];
      }
      _Block_object_dispose(&v11, 8);
    }
  }
}

void sub_10002FD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002FEC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_10002FF2C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
  else
  {
    id v4 = objc_alloc_init((Class)GEOPairedDeviceConfigureSubscriptionShouldSyncReply);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_100030168(void *a1)
{
  id result = [*(id *)(a1[4] + 24) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (_BYTE)result;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = *(void **)(a1[4] + 32);
    if (!v3)
    {
      uint64_t v4 = +[NSMutableDictionary dictionary];
      uint64_t v5 = a1[4];
      id v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v4;

      id v3 = *(void **)(a1[4] + 32);
    }
    uint64_t v8 = a1[5];
    uint64_t v7 = a1[6];
    return [v3 setObject:v7 forKey:v8];
  }
  return result;
}

id sub_100030204(void *a1)
{
  id result = [*(id *)(a1[4] + 40) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (_BYTE)result;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v3 = *(void **)(a1[4] + 48);
    if (!v3)
    {
      uint64_t v4 = +[NSMutableDictionary dictionary];
      uint64_t v5 = a1[4];
      id v6 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = v4;

      id v3 = *(void **)(a1[4] + 48);
    }
    uint64_t v8 = a1[5];
    uint64_t v7 = a1[6];
    return [v3 setObject:v7 forKey:v8];
  }
  return result;
}

void sub_100030410(_Unwind_Exception *a1)
{
}

id sub_100030428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _broadcastState:a3 forIdentifier:a2 fromPairedDevice:0 toPeer:*(void *)(a1 + 40)];
}

id sub_10003043C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _broadcastState:a3 forIdentifier:a2 fromPairedDevice:1 toPeer:*(void *)(a1 + 40)];
}

id *sub_1000305AC(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_100030BD4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 addObject:v2];
}

void sub_100030C34(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init((Class)GEOImageServiceImage);
    [v4 setImageId:*(void *)(a1 + 32)];
    [v4 setImage:v3];

    id v6 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = v4;
    id v5 = v4;
    geo_isolate_sync_data();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

id sub_100030D44(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 addObject:v3];
}

void sub_100030D84(id *a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned __int8 v15 = sub_100030F60;
  long long v16 = sub_100030F70;
  id v17 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100030F60;
  id v10 = sub_100030F70;
  id v11 = 0;
  id v2 = a1[5];
  id v3 = a1[6];
  id v4 = a1[7];
  id v5 = a1[8];
  geo_isolate_sync();
  if (v13[5])
  {
    objc_msgSend(a1[8], "setResponse:");
LABEL_5:
    [a1[8] send];
    goto LABEL_6;
  }
  if (v7[5])
  {
    objc_msgSend(a1[8], "setError:");
    goto LABEL_5;
  }
LABEL_6:

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

void sub_100030F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100030F60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100030F70(uint64_t a1)
{
}

void sub_100030F78(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) identifier];
  unsigned __int8 v4 = [v2 containsObject:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v6 = [*(id *)(a1 + 40) identifier];
  [v5 removeObject:v6];

  id v7 = [*(id *)(a1 + 40) request];
  if ((v4 & 1) == 0)
  {
    long long v18 = sub_100031444();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Request was canceled while consulting the disk cache", buf, 2u);
    }

    uint64_t v19 = +[NSError GEOErrorWithCode:-2 reason:0];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
    goto LABEL_18;
  }
  if (![*(id *)(a1 + 48) count])
  {
    long long v21 = sub_100031444();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "All assets for request were found in the disk cache", buf, 2u);
    }

    id v22 = objc_alloc_init((Class)GEOImageServiceResponse);
    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    long long v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setStatus:0];
    long long v25 = [*(id *)(a1 + 40) request];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setWidth:", objc_msgSend(v25, "width"));

    long long v26 = [*(id *)(a1 + 40) request];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setHeight:", objc_msgSend(v26, "height"));

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setImages:*(void *)(a1 + 56)];
    goto LABEL_18;
  }
  id v8 = [*(id *)(a1 + 56) count];
  id v9 = sub_100031444();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      id v11 = [*(id *)(a1 + 56) count];
      uint64_t v12 = [*(id *)(a1 + 40) request];
      uint64_t v13 = [v12 imageIds];
      id v14 = [v13 count];
      id v15 = [*(id *)(a1 + 48) count];
      *(_DWORD *)long long buf = 134218496;
      id v41 = v11;
      __int16 v42 = 2050;
      id v43 = v14;
      __int16 v44 = 2050;
      id v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%lu of %{public}llu assets for request were found in the disk cache. Will issue network request for the remaining %{public}llu.", buf, 0x20u);
    }
    long long v16 = [*(id *)(a1 + 40) request];
    id v17 = [v16 copy];

    [v17 setImageIds:*(void *)(a1 + 48)];
    id v7 = v17;
    if (!v17) {
      return;
    }
    goto LABEL_17;
  }
  if (v10)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Zero assets for request were found in the disk cache. Will issue original request to network", buf, 2u);
  }

  if (v7)
  {
LABEL_17:
    long long v27 = *(void **)(*(void *)(a1 + 32) + 32);
    __int16 v28 = [*(id *)(a1 + 40) identifier];
    [v27 setObject:v7 forKey:v28];

    id v29 = +[GEOImageServiceServerRequester sharedRequester];
    __int16 v30 = [*(id *)(a1 + 40) preferredAuditToken];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    void v36[2] = sub_100031498;
    v36[3] = &unk_100072730;
    id v31 = *(void **)(a1 + 40);
    v36[4] = *(void *)(a1 + 32);
    id v37 = v31;
    id v38 = *(id *)(a1 + 56);
    id v39 = *(id *)(a1 + 64);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100031758;
    v33[3] = &unk_100072758;
    long long v32 = *(void **)(a1 + 40);
    v33[4] = *(void *)(a1 + 32);
    id v34 = v32;
    id v35 = *(id *)(a1 + 64);
    [v29 startSimpleImageServiceRequest:v7 auditToken:v30 finished:v36 networkActivity:0 error:v33];

LABEL_18:
  }
}

id sub_100031444()
{
  if (qword_100084880 != -1) {
    dispatch_once(&qword_100084880, &stru_1000727C8);
  }
  uint64_t v0 = (void *)qword_100084878;

  return v0;
}

void sub_100031498(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  long long v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  long long v26 = sub_1000316F8;
  long long v27 = &unk_100071888;
  uint64_t v28 = v4;
  id v29 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = v3;
  id obj = [v3 images];
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v10 = *(void **)(*(void *)(a1 + 32) + 8);
        id v11 = [v9 image];
        uint64_t v12 = [v9 imageId];
        uint64_t v13 = [*(id *)(a1 + 40) request];
        id v14 = [v13 width];
        id v15 = [*(id *)(a1 + 40) request];
        objc_msgSend(v10, "addData:forIdentifier:width:height:", v11, v12, v14, objc_msgSend(v15, "height"));
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v6);
  }

  long long v16 = [v18 images];
  id v17 = [v16 mutableCopy];

  [v17 addObjectsFromArray:*(void *)(a1 + 48)];
  [v18 setImages:v17];
  [*(id *)(a1 + 56) setResponse:v18];
  [*(id *)(a1 + 56) send];
}

void sub_1000316F8(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 removeObjectForKey:v2];
}

void sub_100031758(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v4 = a2;
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(a1 + 48), "setError:", v4, _NSConcreteStackBlock, 3221225472, sub_100031824, &unk_100071888, v5);

  [*(id *)(a1 + 48) send];
}

void sub_100031824(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 removeObjectForKey:v2];
}

void sub_100031A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100031A34(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(*(void *)(a1 + 32) + 24);
  id v9 = [v7 identifier];
  [v8 removeObject:v9];
}

void sub_100031C94(id a1)
{
  qword_100084878 = (uint64_t)os_log_create("com.apple.GeoServices", "ImageService");

  _objc_release_x1();
}

void sub_100031D2C(id a1)
{
  qword_100084888 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"ShortSessionDataByAppID", 0);

  _objc_release_x1();
}

void sub_1000326D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000326FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003270C(uint64_t a1)
{
}

void sub_100032714(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100032788(void *a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    if ((*(void *)&a3 & 0xFFF000) != 0)
    {
      [a1 _notifyPeerOfChangedKeys:v5 options:*(void *)&a3 & 0xFFF000 | 0x10000000];
    }
    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v6) {
        sub_10004CF3C(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

void sub_100032B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032B30(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100032BA4(void *a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    if ((*(void *)&a3 & 0xFFF000) != 0)
    {
      [a1 _notifyPeerOfChangedKeys:v5 options:*(void *)&a3 & 0xFFF000];
    }
    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v6) {
        sub_10004CF3C(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

void sub_10003319C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_1000331B4(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  GEOOnce();
}

id sub_100033248(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_100033250(uint64_t a1)
{
  global_queue = geo_get_global_queue();
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

uint64_t sub_1000332A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100033350(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [*(id *)(a1 + 40) peer];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = [*(id *)(a1 + 40) peer];
      uint64_t v7 = [*(id *)(a1 + 40) keys];
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Peer %@ removing listeners for: %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v8 = [*(id *)(a1 + 40) keys];
    sub_100033494((uint64_t)v4, v8);
  }
}

void sub_100033494(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3;
    geo_isolate_sync_data();
  }
}

void sub_100033B4C(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100033D18(uint64_t a1)
{
  id v2 = +[NSSet setWithArray:*(void *)(a1 + 32)];
  if (_GEOConfigOptionsUseClientCache())
  {
    id v7 = v2;
  }
  else
  {
    id v7 = [v2 mutableCopy];
    [v7 intersectSet:*(void *)(*(void *)(a1 + 40) + 24)];
    if (![v7 count])
    {
      id v3 = v7;
      id v7 = v2;
      goto LABEL_11;
    }
  }
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = +[NSMutableSet setWithCapacity:10];
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v4 forKeyedSubscript:v3];
  }
  uint64_t v5 = [v7 allObjects];
  [v4 addObjectsFromArray:v5];

  if ((*(unsigned char *)(a1 + 57) & 0x10) != 0) {
    [*(id *)(*(void *)(a1 + 40) + 40) addObject:v3];
  }
  BOOL v6 = [*(id *)(a1 + 48) connection];
  [v6 initiateBarrierIfNecessary:0 delegate:*(void *)(a1 + 40)];

LABEL_11:
}

void sub_10003414C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100034190(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
    id v3 = [v2 firstObject];

    if (v3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 unsignedIntegerValue];
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v3];
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:v3];
      [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v3];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v7 = [*(id *)(a1 + 40) connection];
    [v7 initiateBarrierIfNecessary:0 delegate:*(void *)(a1 + 32)];
  }
}

void sub_1000342CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10003433C(id a1)
{
  qword_100084898 = [[GEODiskSpaceManager alloc] initWithCacheDeleteID:@"com.apple.geod.cachedelete"];

  _objc_release_x1();
}

void sub_1000347F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

id sub_100034820(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained _validVolume:v5];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 purgableDiskSpaceForUrgency:a2];

    long long v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134283521;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Returning purgeable space: %{private}llu", buf, 0xCu);
    }

    uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:v9, @"CACHE_DELETE_AMOUNT"];
    v15[1] = @"CACHE_DELETE_VOLUME";
    v16[0] = v11;
    v16[1] = v7;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    id v13 = v12;
  }
  else
  {
    id v13 = &__NSDictionary0__struct;
  }

  return v13;
}

id sub_1000349B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v7 = [v6 unsignedLongLongValue];

  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v10 = [WeakRetained _validVolume:v5];

  if (v10)
  {
    id v11 = objc_loadWeakRetained(v8);
    id v12 = [v11 freePurgableDiskSpace:v7 urgency:a2];

    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134283777;
      id v21 = v12;
      __int16 v22 = 2049;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Freed %{private}llu bytes of %{private}llu requested", buf, 0x16u);
    }

    id v14 = +[NSNumber numberWithUnsignedLongLong:v12, @"CACHE_DELETE_AMOUNT"];
    v18[1] = @"CACHE_DELETE_VOLUME";
    v19[0] = v14;
    v19[1] = v10;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    id v16 = v15;
  }
  else
  {
    id v16 = &__NSDictionary0__struct;
  }

  return v16;
}

void sub_100034C08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034D80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000350E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000350FC(uint64_t a1, void *a2)
{
  id v3 = [a2 purgableDiskSpaceForUrgency:*(unsigned int *)(a1 + 48)];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v3;
  objc_sync_exit(obj);
}

void sub_100035290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000352A8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v4 <= v5)
  {
    *a4 = 1;
  }
  else
  {
    id v7 = [a2 freePurgableDiskSpace:v4 - v5 urgency:*(unsigned int *)(a1 + 56)];
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
    objc_sync_exit(obj);
  }
}

id *sub_1000353A0(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)GEOWiFiQualityTileRequester;
    id v11 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

void sub_100035460(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = GEOURLString();
    if ([v7 length])
    {
      id v29 = v6;
      __int16 v30 = v5;
      id v8 = [v6 copy];
      id v9 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v8;

      id v10 = +[NSMutableDictionary dictionaryWithCapacity:2];
      [v10 setObject:*(void *)(a1 + 8) forKey:@"X-tilekey"];
      if (GEOConfigGetBOOL())
      {
        id v11 = +[GEOPlatform sharedPlatform];
        id v12 = [v11 osAndBuildVersion];

        [v10 setObject:v12 forKey:@"X-os-version"];
      }
      id v13 = [(id)objc_opt_class() requestKind];
      id v14 = +[GEORequestCounter sharedCounter];
      uint64_t v15 = [v14 requestCounterTicketForType:v13 auditToken:*(void *)(a1 + 24) traits:0];

      if (GEOConfigGetBOOL()) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = 16;
      }
      if (GEOConfigGetBOOL()) {
        v16 |= 0x20uLL;
      }
      if (GEOConfigGetBOOL()) {
        uint64_t v17 = v16 | 2;
      }
      else {
        uint64_t v17 = v16;
      }
      id v18 = objc_alloc((Class)GEODataRequest);
      uint64_t v19 = +[NSURL URLWithString:v7];
      uint64_t v20 = *(void *)(a1 + 24);
      GEOConfigGetDouble();
      double v22 = v21;
      id v23 = [v10 copy];
      id v24 = [v18 initWithKind:v13 URL:v19 auditToken:v20 timeoutInterval:v23 additionalHTTPHeaders:0 bodyData:0 userAgent:v22 entityTag:*(void *)(a1 + 16) cachedData:0 requestCounterTicket:v15 multipathServiceType:0 multipathAlternatePort:0 backgroundSessionIdentifier:0 throttleToken:0 options:v17];

      uint64_t v25 = +[GEODataURLSession sharedDataURLSession];
      unint64_t v5 = v30;
      uint64_t v26 = [v25 taskWithRequest:v24 delegate:a1 delegateQueue:v30];
      long long v27 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v26;

      [*(id *)(a1 + 32) start];
      id v6 = v29;
    }
    else
    {
      +[NSError GEOErrorWithCode:-4 reason:@"No URL in manifest for WiFi tile service"];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100035794;
      block[3] = &unk_100071AB8;
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = v6;
      id v28 = v32;
      dispatch_async(v5, block);
    }
  }
}

uint64_t sub_100035794(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

id sub_100035A2C()
{
  uint64_t v0 = +[NSMutableSet set];
  uint64_t v1 = 0;
  char v2 = 1;
  do
  {
    char v3 = v2;
    unint64_t v4 = sub_10000919C(v1, 0);
    if (v4) {
      [v0 addObject:v4];
    }
    unint64_t v5 = sub_100035AE8(v1);
    if ([v5 count]) {
      [v0 addObjectsFromArray:v5];
    }

    char v2 = 0;
    uint64_t v1 = 1;
  }
  while ((v3 & 1) != 0);

  return v0;
}

GEOMAResourceInfo_TerritoryRegulatoryInfo *sub_100035AE0(uint64_t a1)
{
  return sub_10000919C(a1, 0);
}

id sub_100035AE8(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      char v2 = &__NSArray0__struct;
      goto LABEL_9;
    case 1:
      uint64_t v1 = GEOMAResourceInfo_TerritoryRegulatoryInfo;
      goto LABEL_7;
    case 0:
      uint64_t v1 = GEOMAResourceInfo_MetroRegion;
LABEL_7:
      char v2 = [(__objc2_class *)v1 allExisitngInfos];
      goto LABEL_9;
  }
  char v2 = 0;
LABEL_9:

  return v2;
}

CFStringRef sub_100035B50(uint64_t a1)
{
  CFStringRef v1 = @"territories";
  if (a1 != 1) {
    CFStringRef v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"metroRegions";
  }
}

void sub_100035B74(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  id v6 = +[NSNull null];

  if (v6 == v8) {
    id v7 = 0;
  }
  else {
    id v7 = v8;
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void sub_100035C04(id a1)
{
  qword_1000848A8 = +[GEOFilePaths urlFor:17];

  _objc_release_x1();
}

void sub_100035FB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addKeyValuePair:v5 with:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v6 mutableCopy];
      [v7 addKeyValueArray:v5 with:v8];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10004CFF0();
    }
  }
}

void sub_100036088(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10000966C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) results];
    *(_DWORD *)long long buf = 67109891;
    int v19 = a2;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2113;
    uint64_t v23 = v7;
    __int16 v24 = 2113;
    uint64_t v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MA query result: %d error: %@ info; %{private}@ resources: %{private}@",
      buf,
      0x26u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100036234;
  v11[3] = &unk_1000729D0;
  id v9 = *(NSObject **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 72);
  uint64_t v17 = a2;
  id v14 = v5;
  id v15 = *(id *)(a1 + 64);
  id v10 = v5;
  dispatch_async(v9, v11);
}

void sub_100036234(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]
    || ([*(id *)(a1 + 40) results],
        char v2 = objc_claimAutoreleasedReturnValue(),
        id v3 = [v2 count],
        v2,
        v3))
  {
    unint64_t v4 = [*(id *)(a1 + 40) results];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100036404;
    v10[3] = &unk_1000729A8;
    id v11 = *(id *)(a1 + 56);
    id v5 = objc_msgSend(v4, "_geo_map:", v10);

    id v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", (char *)[*(id *)(a1 + 32) count] + (void)objc_msgSend(v5, "count"));
    if ([*(id *)(a1 + 32) count]) {
      [v6 addObjectsFromArray:*(void *)(a1 + 32)];
    }
    if ([v5 count]) {
      [v6 addObjectsFromArray:v5];
    }
    uint64_t v7 = [v6 allObjects];
    id v8 = [v7 sortedArrayUsingSelector:"compare:"];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v9();
  }
}

GEOMAResource *sub_100036404(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [[GEOMAResource alloc] initWithMobileAsset:v3 info:*(void *)(a1 + 32)];

  return v4;
}

void sub_100036580(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@" "];
  [*(id *)(a1 + 32) appendString:v6];

  [*(id *)(a1 + 32) appendString:@": "];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    CFStringRef v8 = v15;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      [v10 appendString:@"["];
      id v11 = *(void **)(a1 + 32);
      id v12 = [(__CFString *)v15 componentsJoinedByString:@", "];
      [v11 appendString:v12];

      uint64_t v7 = *(void **)(a1 + 32);
      CFStringRef v8 = @"]";
    }
    else
    {
      [v10 appendString:@"{invalid: "];
      id v13 = *(void **)(a1 + 32);
      id v14 = [(__CFString *)v15 description];
      [v13 appendString:v14];

      uint64_t v7 = *(void **)(a1 + 32);
      CFStringRef v8 = @"}";
    }
  }
  [v7 appendString:v8];
}

void sub_10003685C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036884(uint64_t a1)
{
}

void sub_10003688C(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) baseURLForType:1];
  id v3 = [v2 path];

  unint64_t v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = objc_alloc_init(*(Class *)(a1 + 40));
    id v10 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void sub_100036C48(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) baseURLForType:0];
  id v3 = +[NSFileManager defaultManager];
  id v26 = 0;
  unint64_t v4 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v26];
  id v5 = v26;

  if (v5)
  {
    id v6 = [v5 domain];
    if ([v6 isEqualToString:NSCocoaErrorDomain])
    {
      id v7 = [v5 code];

      if (v7 == (id)260) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v8 = sub_10000966C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to list contents of metro asset folder: %@", buf, 0xCu);
    }
  }
LABEL_9:
  if ([v4 count])
  {
    id v19 = v5;
    __int16 v20 = v4;
    id v21 = v2;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      uint64_t v13 = GEOMetroRegionCountryCodeKey;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) lastPathComponent];
          if ((unint64_t)[v15 length] >= 2 && (unint64_t)objc_msgSend(v15, "length") < 4
            || [v15 isEqualToString:@"_UNK_"])
          {
            id v16 = objc_alloc(*(Class *)(a1 + 40));
            uint64_t v27 = v13;
            id v28 = v15;
            uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
            id v18 = [v16 initWithOverrides:v17];

            if (v18) {
              [*(id *)(a1 + 32) addObject:v18];
            }
          }
          id v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v11);
    }

    unint64_t v4 = v20;
    char v2 = v21;
    id v5 = v19;
  }
}

void sub_10003733C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      CFStringRef v10 = @"wifiresp";
      id v7 = [v5 data];
      id v11 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      goto LABEL_5;
    }
    id v6 = +[NSError GEOErrorWithCode:-8 reason:@"SPI contract violated"];
  }
  id v7 = v6;
  uint64_t v8 = +[NSDictionary _geo_replyDictionaryForError:v6 key:@"err"];
LABEL_5:
  id v9 = (void *)v8;

  [*(id *)(a1 + 32) sendReply:v9];
}

void sub_1000375D0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  id v11 = a5;
  if (v11) {
    goto LABEL_9;
  }
  if (!(v9 | v10))
  {
    id v11 = +[NSError GEOErrorWithCode:-8 reason:@"SPI contract violated"];
LABEL_9:
    uint64_t v13 = v11;
    id v14 = +[NSDictionary _geo_replyDictionaryForError:v11 key:@"err"];
    goto LABEL_10;
  }
  uint64_t v12 = +[NSMutableDictionary dictionaryWithCapacity:2];
  uint64_t v13 = v12;
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:@"wifitd"];
  }
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"wifiet"];
  }
  id v14 = [v13 copy];
LABEL_10:
  id v15 = v14;

  [*(id *)(a1 + 32) sendReply:v15];
}

uint64_t sub_100037850(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100037864(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) downloadOptions];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 72))
  {
    [v2 setAllowsCellularAccess:1];
    [v3 setAllowsExpensiveAccess:1];
    [v3 setRequiresPowerPluggedIn:0];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v4 = [*(id *)(a1 + 40) reverseObjectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(v4);
      }
      unint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      if ([v9 isAvailableForUse]) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v10 = v9;
    id v11 = sub_10000966C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Found older copy already in place.", buf, 2u);
    }

    if (v10) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_11:
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [*(id *)(a1 + 40) reverseObjectEnumerator];
  id v10 = [v12 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v12);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v15 isOnDisk])
        {
          id v10 = v15;
          id v16 = sub_10000966C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Found older copy in MobileAssets storage.", buf, 2u);
          }

          goto LABEL_27;
        }
      }
      id v10 = [v12 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_27:

LABEL_28:
  if (([*(id *)(a1 + 48) isEqual:v10] & 1) == 0)
  {
    uint64_t v17 = sub_10000966C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Enqueued download of newer copy.", buf, 2u);
    }

    [*(id *)(a1 + 48) downloadWithOptions:v3];
  }
  if ([v10 isAvailableForUse])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else if ([v10 isOnDisk])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100037C3C;
    v21[3] = &unk_100071F48;
    uint64_t v18 = *(void *)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v22 = v10;
    [v22 downloadWithOptions:0 queue:v18 completion:v21];
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 64);
    __int16 v20 = +[NSError GEOErrorWithCode:-20 reason:@"Waiting on at least one version to be downloaded"];
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
  }
}

void sub_100037C3C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10000966C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Relocated older copy with result %d: %@.", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100037D18(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = sub_10000966C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Latest resource wasn't available, will queue it up", v6, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
}

id *sub_1000388BC(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)GEOWiFiQualityServiceRequester;
    __int16 v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

void sub_100038968(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_alloc_init(GEOWiFiQualityServiceDataRequestConfig);
    uint64_t v8 = a1[1];
    id v9 = +[GEOMapService sharedService];
    objc_super v10 = [v9 defaultTraits];
    uint64_t v11 = a1[2];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_100038AAC;
    v12[3] = &unk_100072B88;
    id v13 = v5;
    id v14 = v6;
    [a1 _startWithRequest:v8 traits:v10 auditToken:v11 config:v7 throttleToken:0 options:0 completionHandler:v12];
  }
}

void sub_100038AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038B80;
  block[3] = &unk_1000721C0;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_100038B80(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100038EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100038EE4()
{
  if (qword_1000848C0 != -1) {
    dispatch_once(&qword_1000848C0, &stru_100072D10);
  }
  uint64_t v0 = (void *)qword_1000848B8;

  return v0;
}

id sub_100038F38(uint64_t a1, void *a2)
{
  char v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _setup:v3];

  return v5;
}

void sub_1000391BC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) tearDown];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

BOOL sub_100039280(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(*(void *)(a1 + 32) + 16) int64ForColumn:0 inStatment:a2];
    *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) int64ForColumn:1 inStatment:a2];
  }
  return v4 == 100;
}

void sub_100039520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039550(void *a1, sqlite3_stmt *a2)
{
  if (![*(id *)(a1[4] + 16) bindInt64Parameter:"@timestamp" toValue:a1[7] inStatement:a2 error:0]|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 16) intForColumn:0 inStatment:a2];
  uint64_t v4 = 1;
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 16) int64ForColumn:1 inStatment:a2];
  return v4;
}

id sub_100039600(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) bindIntParameter:"@limit" toValue:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) inStatement:a2 error:0];
}

void sub_1000398BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000398EC(void *a1, sqlite3_stmt *a2)
{
  do
  {
    if (sqlite3_step(a2) != 100) {
      break;
    }
    id v4 = [*(id *)(a1[4] + 16) int64ForColumn:0 inStatment:a2];
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
    *(void *)(*(void *)(a1[6] + 8) + 24) += v4;
  }
  while (a1[7] + *(void *)(*(void *)(a1[6] + 8) + 24) <= a1[8]);
  return 1;
}

id sub_10003997C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) bindIntParameter:"@limit" toValue:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) inStatement:a2 error:0];
}

void sub_100039A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039A64(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

void sub_100039B28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100039B40(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkToSize:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 vacuum];
}

void sub_100039C40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100039C58(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 vacuum];
}

void sub_100039D84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_100039E40;
  id v7 = &unk_100072C78;
  uint64_t v8 = v2;
  id v9 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v3 executeInTransaction:&v4];
  objc_msgSend(*(id *)(a1 + 32), "_evictIfNecessary", v4, v5, v6, v7, v8);
}

uint64_t sub_100039E40(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 48) length];
  id v7 = *(void **)(a1 + 48);
  id v8 = v4;
  id v9 = v3;
  id v10 = v7;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10003A5CC;
  v26[4] = sub_10003A5DC;
  id v27 = 0;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_10003A75C;
  uint64_t v19 = &unk_100072D38;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v23 = v26;
  id v24 = v6;
  uint64_t v25 = v5;
  id v13 = v10;
  id v22 = v13;
  LODWORD(v10) = [v11 executeStatement:@"AddAsset" statementBlock:&v16];

  _Block_object_dispose(v26, 8);
  if (!v10) {
    return 0;
  }
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sqliteDB", v16, v17, v18, v19));
  uint64_t result = (uint64_t)sub_10003A044(*(void **)(*(void *)(a1 + 32) + 16), insert_rowid, (unint64_t)(Current + kCFAbsoluteTimeIntervalSince1970));
  if (result)
  {
    *(void *)(*(void *)(a1 + 32) + 40) += [*(id *)(a1 + 48) length];
    return 1;
  }
  return result;
}

void sub_10003A02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003A044(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10003A5CC;
  void v13[4] = sub_10003A5DC;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A8D0;
  v8[3] = &unk_100072D60;
  id v5 = a1;
  id v9 = v5;
  id v10 = v13;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  id v6 = [v5 executeStatement:@"SetAccessTime" statementBlock:v8];

  _Block_object_dispose(v13, 8);
  return v6;
}

void sub_10003A144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A2D8(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = -1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10003A5CC;
  id v21 = sub_10003A5DC;
  id v22 = 0;
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10003A5E4;
  v16[3] = &unk_100072CA0;
  v16[4] = &v23;
  v16[5] = &v17;
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = v4;
  id v7 = v3;
  id v8 = v16;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_10003A5CC;
  v33[4] = sub_10003A5DC;
  id v34 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003A988;
  v27[3] = &unk_100072D88;
  id v9 = v6;
  id v28 = v9;
  id v10 = v7;
  id v29 = v10;
  long long v31 = v33;
  uint64_t v32 = v5;
  uint64_t v11 = v8;
  id v30 = v11;
  [v9 statementForKey:@"FindAsset" statementBlock:v27];

  _Block_object_dispose(v33, 8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003A61C;
  v13[3] = &unk_100071978;
  uint64_t v12 = *(NSObject **)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = &v17;
  dispatch_async(v12, v13);
  if (v18[5]) {
    sub_10003A044(*(void **)(*(void *)(a1 + 32) + 16), v24[3], (unint64_t)(Current + kCFAbsoluteTimeIntervalSince1970));
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void sub_10003A594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10003A5CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003A5DC(uint64_t a1)
{
}

uint64_t sub_10003A5E4(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

uint64_t sub_10003A61C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10003A638(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A6C0;
  block[3] = &unk_1000714E0;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t sub_10003A6C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003A718(id a1)
{
  qword_1000848B8 = (uint64_t)os_log_create("com.apple.GeoServices", "ImageServicePersistence");

  _objc_release_x1();
}

id sub_10003A75C(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v4 bindBlobParameter:"@identifier" toValue:v5 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0;
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(a1 + 72);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v28 = *(id *)(v10 + 40);
  unsigned int v11 = [v8 bindIntParameter:"@width" toValue:v9 inStatement:a2 error:&v28];
  objc_storeStrong((id *)(v10 + 40), v28);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(unsigned int *)(a1 + 76);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v27 = *(id *)(v14 + 40);
  unsigned int v15 = [v12 bindIntParameter:"@height" toValue:v13 inStatement:a2 error:&v27];
  objc_storeStrong((id *)(v14 + 40), v27);
  if (!v15) {
    return 0;
  }
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  id v26 = *(id *)(v18 + 40);
  unsigned int v19 = [v16 bindInt64Parameter:"@data_size" toValue:v17 inStatement:a2 error:&v26];
  objc_storeStrong((id *)(v18 + 40), v26);
  if (!v19) {
    return 0;
  }
  id v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  id v25 = *(id *)(v22 + 40);
  id v23 = [v20 bindBlobParameter:"@data" toValue:v21 inStatement:a2 error:&v25];
  objc_storeStrong((id *)(v22 + 40), v25);
  return v23;
}

id sub_10003A8D0(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v5 bindInt64Parameter:"@asset_rowid" toValue:v4 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = a1[7];
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v13 = *(id *)(v10 + 40);
  id v11 = [v9 bindInt64Parameter:"@timestamp" toValue:v8 inStatement:a2 error:&v13];
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

uint64_t sub_10003A988(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v4 bindBlobParameter:"@identifier" toValue:v5 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(a1 + 64);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v25 = *(id *)(v10 + 40);
  unsigned int v11 = [v8 bindIntParameter:"@width" toValue:v9 inStatement:a2 error:&v25];
  objc_storeStrong((id *)(v10 + 40), v25);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(unsigned int *)(a1 + 68);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v24 = *(id *)(v14 + 40);
  unsigned int v15 = [v12 bindIntParameter:"@height" toValue:v13 inStatement:a2 error:&v24];
  objc_storeStrong((id *)(v14 + 40), v24);
  if (!v15) {
    return 0;
  }
  uint64_t v16 = sqlite3_step(a2);
  while (v16 == 100)
  {
    [*(id *)(a1 + 32) int64ForColumn:0 inStatment:a2];
    uint64_t v17 = 1;
    uint64_t v18 = [*(id *)(a1 + 32) blobForColumn:1 inStatment:a2];
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()) {
      goto LABEL_11;
    }
    uint64_t v16 = sqlite3_step(a2);
  }
  if (v16 == 101) {
    return 1;
  }
  unsigned int v19 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  id v23 = *(id *)(v20 + 40);
  [v19 reportSQLiteErrorCode:v16 method:@"step" error:&v23];
  id v21 = v23;
  uint64_t v17 = 0;
  uint64_t v18 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v21;
LABEL_11:

  return v17;
}

void sub_10003AC94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "_geo_filtered:", &stru_100072DC8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v6 count])
    {
      unsigned int v7 = +[GEOMapDataSubscriptionManager sharedManager];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 8);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10003B030;
      v11[3] = &unk_100072DF0;
      void v11[4] = v8;
      id v13 = *(id *)(a1 + 40);
      id v6 = v6;
      id v12 = v6;
      [v7 _calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:v9 completionHandler:v11];
    }
    else
    {
      sub_10003AEA8(*(GEOTransitUpdateServer **)(a1 + 32), 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003AE48;
    block[3] = &unk_100071AB8;
    id v16 = *(id *)(a1 + 40);
    id v15 = v5;
    dispatch_async(v10, block);

    id v6 = v16;
  }
}

uint64_t sub_10003AE48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL sub_10003AE5C(id a1, GEOMapDataSubscription *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = ([(GEOMapDataSubscription *)v2 dataTypes] & 0x400) != 0
    && [(GEOMapDataSubscription *)v2 policy] == (id)1;

  return v3;
}

GEOTransitUpdateServer *sub_10003AEA8(GEOTransitUpdateServer *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    int BOOL = GEOConfigGetBOOL();
    int v6 = GEOConfigGetBOOL();
    if (qword_1000848D0 != -1) {
      dispatch_once(&qword_1000848D0, &stru_100072E58);
    }
    unsigned int v7 = qword_1000848C8;
    if (os_log_type_enabled((os_log_t)qword_1000848C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218752;
      uint64_t v12 = a2;
      __int16 v13 = 2048;
      uint64_t v14 = a3;
      __int16 v15 = 1024;
      int v16 = BOOL;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[Offline] Reporting subscription count: %llu, consumedDiskSpace: %{bytes}llu, automaticUpdatesEnabled: %i, optimizeStorageEnabled: %i", buf, 0x22u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003B134;
    v8[3] = &unk_100072E38;
    void v8[4] = a2;
    v8[5] = a3;
    char v9 = BOOL;
    char v10 = v6;
    return sub_100028A58(@"com.apple.GeoServices.OfflineRegionsStatistics", v8);
  }
  return result;
}

void sub_10003B030(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = *(GEOTransitUpdateServer **)(a1 + 32);
  if (v5)
  {
    isolater = v6->_isolater;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003B120;
    v8[3] = &unk_100071AB8;
    id v10 = *(id *)(a1 + 48);
    id v9 = v5;
    dispatch_async(isolater, v8);
  }
  else
  {
    sub_10003AEA8(v6, (uint64_t)[*(id *)(a1 + 40) count], a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_10003B120(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_10003B134(uint64_t a1)
{
  v8[0] = @"regionCount";
  uint64_t v2 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v9[0] = v2;
  v8[1] = @"consumedDiskSpace";
  BOOL v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v9[1] = v3;
  v8[2] = @"automaticUpdatesEnabled";
  uint64_t v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[2] = v4;
  v8[3] = @"optimizeStorageEnabled";
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v9[3] = v5;
  int v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

void sub_10003B27C(id a1)
{
  qword_1000848C8 = (uint64_t)os_log_create("com.apple.GeoServices", "PeriodicTelemetry");

  _objc_release_x1();
}

char *sub_10003B4D4(void *a1)
{
  string = (char *)xpc_dictionary_get_string(a1, "lcl");
  if (string)
  {
    id v2 = objc_alloc((Class)NSLocale);
    BOOL v3 = +[NSString stringWithUTF8String:string];
    string = (char *)[v2 initWithLocaleIdentifier:v3];
  }

  return string;
}

void sub_10003CE24(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v20 = a5;
  id v10 = a6;
  id v11 = a3;
  if ((GEOTileKeyEquals() & 1) == 0)
  {
    uint64_t v12 = GEOStringFromTileKey();
    __int16 v13 = GEOStringFromTileKey();
    NSLog(@"Asked to load key %@ and instead got back %@. See <rdar://problem/13307083>", v12, v13);
  }
  if (!*(unsigned char *)(a1 + 88) && (GEOTileKeyIsOffline() & 1) == 0)
  {
    if (v10)
    {
      uint64_t v14 = [v10 objectForKeyedSubscript:GEOTileLoadResultSourceKey];
      if ([v14 integerValue] == (id)2)
      {

LABEL_10:
        GEOMachAbsoluteTimeGetCurrent();
        double v16 = v15;
        __int16 v17 = +[GEOOfflineStateManager shared];
        [v17 reportTileResponse:a2 usedInterfaces:0 forCohortId:*(void *)(a1 + 32) duration:v20 error:v16 - *(double *)(a1 + 64)];

        goto LABEL_11;
      }
    }
    if (!v20) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:
  int v18 = [v10 objectForKeyedSubscript:GEOTileLoadResultIsPreliminaryKey];
  unsigned __int8 v19 = [v18 BOOLValue];

  [*(id *)(a1 + 40) _receivedTile:v11 error:v20 info:v10 forKey:a2 forPeer:*(void *)(a1 + 48)];
  if ((v19 & 1) == 0) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void sub_10003CFCC(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  [v2 removeObject:a1[6]];

  BOOL v3 = (_xpc_connection_s *)a1[7];
  uint64_t v4 = (void *)a1[8];

  xpc_connection_send_message(v3, v4);
}

id sub_10003D1BC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (xpc_dictionary_get_data(v4, "mcfg", 0)
    && ([v3 hasEntitlement:@"com.apple.geoservices.custom-manifest-configuration"] & 1) == 0)
  {
    uint64_t v8 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = [v3 bundleIdentifier];
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Un-entitled process %{public}@ is trying to set a custom manifest configuration", (uint8_t *)&v11, 0xCu);
    }
    unsigned int v7 = +[GEOTileLoader modernLoaderForResourceManifestConfiguration:0 locale:0];
  }
  else
  {
    objc_opt_class();
    id v5 = GEODecodeXPCValue();
    int v6 = sub_10003B4D4(v4);
    unsigned int v7 = +[GEOTileLoader modernLoaderForResourceManifestConfiguration:v5 locale:v6];
  }

  return v7;
}

void sub_10003D6A4(uint64_t a1, uint64_t value)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "sz", value);
  id v4 = *(void **)(a1 + 32);
  id v3 = *(_xpc_connection_s **)(a1 + 40);

  xpc_connection_send_message(v3, v4);
}

void sub_10003DAB4(uint64_t a1, uint64_t value)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "sz", value);
  id v4 = *(void **)(a1 + 32);
  id v3 = *(_xpc_connection_s **)(a1 + 40);

  xpc_connection_send_message(v3, v4);
}

BOOL sub_10003E540(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, double a7)
{
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)GEOTileEnumeration);
  double v16 = +[NSData dataWithBytes:a2 length:16];
  [v15 setKey:v16];

  if (*(unsigned char *)(a1 + 40)) {
    id v17 = v14;
  }
  else {
    id v17 = 0;
  }
  [v15 setData:v17];

  [v15 setCurrent:a4];
  [v15 setETag:v13];

  [v15 setOriginalLoadReason:a6];
  [v15 setAge:a7];
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  [v15 encodeToXPCDictionary:v18];
  xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v18);
  BOOL v20 = xpc_get_type(v19) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v19, "cont");

  return v20;
}

void sub_10003E6A0(uint64_t a1)
{
}

void sub_10003E860(id a1)
{
  qword_1000848E0 = objc_alloc_init(_GEOImageServiceRequestConfig);

  _objc_release_x1();
}

void sub_10003E90C(id a1)
{
  qword_1000848E8 = objc_alloc_init(GEOImageServiceServerRequester);

  _objc_release_x1();
}

void sub_10003EAA4(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  if (v10)
  {
    uint64_t v7 = a1[5];
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void (**)(void))(v7 + 16);
  }
  else
  {
    uint64_t v9 = a1[6];
    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
LABEL_9:
}

void sub_10003EE34(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:&stru_100075DE0];
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
  if (!v5)
  {
    id v5 = +[NSMutableIndexSet indexSet];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }
  [v5 addIndex:a3];
}

id sub_10003F090(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 40) filename];
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v4 atIndexedSubscript:a2];

  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v6 setObject:v5 atIndexedSubscript:a2];
}

id sub_10003F2C0()
{
  if (qword_100084900 != -1) {
    dispatch_once(&qword_100084900, &stru_100073108);
  }
  uint64_t v0 = (void *)qword_1000848F8;

  return v0;
}

uint64_t sub_10003F590(void *a1)
{
  uint64_t v2 = a1[7];
  if (a1[4])
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v3, v4);
}

id sub_10003F854(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchResources:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 88) unpack:*(unsigned __int8 *)(a1 + 89) manifestConfiguration:*(void *)(a1 + 48) auditToken:*(void *)(a1 + 56) signpostID:*(void *)(a1 + 80) queue:*(void *)(a1 + 64) handler:*(void *)(a1 + 72)];
}

uint64_t sub_10003FEC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100040168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_100040188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:WeakRetained];
  }
  else
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v20) {
      sub_10004D110(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  if (!v6)
  {
    id v8 = [v5 count];
    if (v8 == [*(id *)(a1 + 40) count])
    {
      uint64_t v9 = +[NSURL fileURLWithPath:*(void *)(a1 + 48)];
      id v10 = *(void **)(a1 + 40);
      id v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      id v30 = sub_100040480;
      long long v31 = &unk_100073000;
      id v11 = v9;
      id v32 = v11;
      uint64_t v12 = objc_msgSend(v10, "_geo_compactMap:", &v28);
      id v13 = [v12 count];
      if (v13 == [*(id *)(a1 + 40) count])
      {
        [*(id *)(a1 + 32) didResolvePaths:v12 forResources:*(void *)(a1 + 40)];
        id v6 = 0;
      }
      else
      {
        double v16 = [*(id *)(a1 + 40) count];
        int64_t v17 = v16 - (unsigned char *)[v12 count];
        xpc_object_t v18 = +[NSString stringWithFormat:@"unable to resolve name for %d resources", v17, v28, v29, v30, v31];
        id v6 = +[NSError GEOErrorWithCode:-11 reason:v18];

        xpc_object_t v19 = sub_10003F2C0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          unsigned int v34 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't get name for %d resources", buf, 8u);
        }

        [*(id *)(a1 + 32) failedToResolveResources:*(void *)(a1 + 40) withError:v6];
      }

      goto LABEL_11;
    }
    +[NSError GEOErrorWithCode:-11 reason:@"loadedResources.count != input remaining.count"];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = sub_10003F2C0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    unsigned int v15 = [*(id *)(a1 + 40) count];
    *(_DWORD *)long long buf = 67109376;
    unsigned int v34 = v15;
    __int16 v35 = 1024;
    unsigned int v36 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Requested %d resources, got %d resources", buf, 0xEu);
  }

  [*(id *)(a1 + 32) failedToResolveResources:*(void *)(a1 + 40) withError:v6];
LABEL_11:
}

id sub_100040480(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 filename];
  uint64_t v4 = [v2 URLByAppendingPathComponent:v3 isDirectory:0];

  return v4;
}

id sub_100040578(uint64_t a1)
{
  uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[3])
  {
    dispatch_source_set_timer(v2[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24), &stru_100073048);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;

    uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  }

  return [(dispatch_source_t *)v2 _failAllPendingRequests];
}

void sub_100040B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100040B6C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 wantsUnpacked:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_100040BB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 finishedResource:*(void *)(a1 + 32) withResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)])objc_msgSend(*(id *)(a1 + 56), "addObject:", v3); {
}
  }

void sub_100040EF4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) _finished:v9 withResult:v6 error:0];

  [v7 addObjectsFromArray:v8];
}

void sub_100041634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _failAllPendingRequests];
}

void sub_1000416D0(id a1)
{
  qword_1000848F8 = (uint64_t)os_log_create("com.apple.GeoServices", "ResourceRequester");

  _objc_release_x1();
}

id sub_100041714()
{
  if (qword_100084910 != -1) {
    dispatch_once(&qword_100084910, &stru_100073128);
  }
  uint64_t v0 = (void *)qword_100084908;

  return v0;
}

void sub_100041768(id a1)
{
  qword_100084908 = (uint64_t)os_log_create("com.apple.GeoServices", "GEODirectionsRequesterServerLocalProxy");

  _objc_release_x1();
}

void sub_100042040(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  if (v5)
  {
    id v8 = v5;
    id v9 = +[GEOExperimentConfiguration sharedConfiguration];
    id v10 = [v8 datasetAbStatus];
    [v9 refreshDatasetABStatus:v10];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = objc_msgSend(v8, "routes", 0);
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        unsigned int v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) unpackLatLngVertices];
          unsigned int v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    uint64_t v16 = a1[5];
    if (v16) {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v8);
    }
    goto LABEL_15;
  }
  if (a1[6])
  {
    objc_msgSend(v6, "_geo_directionsErrorInfo");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();
LABEL_15:
  }
}

void sub_100042644(uint64_t a1)
{
  if (sub_100011CD8())
  {
    uint64_t v2 = [sub_100012100() sharedInstance];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000426F0;
    v3[3] = &unk_100071438;
    id v4 = *(id *)(a1 + 32);
    [v2 getDevicesWithBlock:v3];
  }
}

void sub_1000426F0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[GEOResourceManifestConfiguration configurationWithPairedDevice:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        id v10 = [v9 dataDirectoryFor:7];
        if ([v10 length]) {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v6);
  }

  id v11 = +[NSFileManager defaultManager];
  id v12 = GEOResourcesPairedDevicesCachesDirectory();
  id v13 = [v11 contentsOfDirectoryAtPath:v12 error:0];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
        long long v19 = GEOResourcesPairedDevicesCachesDirectory();
        long long v20 = [v19 stringByAppendingPathComponent:v18];

        if (([v3 containsObject:v20] & 1) == 0)
        {
          id v21 = v4;
          uint64_t v22 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138477827;
            id v44 = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Paired device data directory is obsolete. Removing it... (%{private}@)", buf, 0xCu);
          }

          uint64_t v23 = +[NSFileManager defaultManager];
          id v34 = 0;
          unsigned __int8 v24 = [v23 removeItemAtPath:v20 error:&v34];
          id v25 = v34;

          if ((v24 & 1) == 0)
          {
            uint64_t v26 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543362;
              id v44 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to remove obsolete paired device directory: %{public}@", buf, 0xCu);
            }
          }
          id v4 = v21;
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v15);
  }

  if ([v4 count])
  {
    uint64_t v27 = [*(id *)(a1 + 32) daemon];
    id v28 = [v27 serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100042B38;
    block[3] = &unk_100071888;
    id v32 = v4;
    id v33 = *(id *)(a1 + 32);
    dispatch_async(v28, block);
  }
}

void sub_100042B38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  id v5 = +[GEOResourceManifestConfiguration configurationWithPairedDevice:v2];

  if (([*(id *)(*(void *)(a1 + 40) + 16) containsObject:v5] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 16) addObject:v5];
    id v3 = +[GEOResourceManifestManager modernManagerForConfiguration:v5];
    [v3 addServerProxyObserver:*(void *)(a1 + 40)];

    id v4 = +[GEOResourceManifestManager modernManagerForConfiguration:v5];
    [v4 openServerConnection];
  }
}

id sub_100042E7C(uint64_t a1)
{
  [*(id *)(a1 + 32) _fireOpportunisticResourceLoads];
  id v2 = *(void **)(a1 + 40);

  return [v2 setTaskCompleted];
}

void sub_100042F34(uint64_t a1)
{
  id v2 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned int v3 = [v2 isNetworkConstrained];

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v3)
  {
    if (v4 || !GEOConfigGetBOOL()) {
      return;
    }
    id v11 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
    uint64_t v5 = [v11 addInternalAssertionForReason:@"constrained-network"];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    id v8 = v11;
  }
  else
  {
    if (!v4) {
      return;
    }
    id v9 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
    [v9 removeAssertion:*(void *)(*(void *)(a1 + 32) + 32)];

    uint64_t v10 = *(void *)(a1 + 32);
    id v8 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = 0;
  }
}

void sub_100043044(uint64_t a1)
{
  id v4 = objc_alloc_init((Class)GEOResourceManifestConfiguration);
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v4];
  id v2 = +[GEOResourceManifestManager modernManager];
  [v2 addServerProxyObserver:*(void *)(a1 + 32)];

  unsigned int v3 = +[GEOResourceManifestManager modernManager];
  [v3 openServerConnection];
}

id sub_1000430E8()
{
  uint64_t v0 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  return v0;
}

void sub_1000431E4(id a1)
{
  qword_100084928 = (uint64_t)objc_alloc_init((Class)GEOResourceManifestConfiguration);

  _objc_release_x1();
}

void sub_1000432F4(id a1, NSArray *a2)
{
  id v2 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = +[GEOResourceManifestConfiguration configurationWithPairedDevice:*(void *)(*((void *)&v10 + 1) + 8 * (void)v6)];
        id v8 = +[GEOResourceManifestManager modernManagerForConfiguration:v7];
        id v9 = [v8 serverProxy];
        [v9 performOpportunisticResourceLoading];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_1000438B0(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

void sub_1000439F0(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

void sub_100043B70(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

void sub_100043D60(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSDictionary _geo_replyDictionaryForError:a2 key:@"err"];
  [v2 sendReply:v3];
}

void sub_100044334(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v7 = [v10 data];
    [v6 setObject:v7 forKey:@"manifestData"];

    id v8 = *(void **)(a1 + 32);
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v9 = *(void **)(a1 + 32);
    id v6 = +[NSDictionary _geo_replyDictionaryForError:v5 key:@"err"];
    id v8 = v9;
  }
  [v8 sendReply:v6];

LABEL_6:
}

void sub_1000446C4(id *a1)
{
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  id v63 = sub_100044CB0;
  v64 = sub_100044CDC;
  id v65 = 0;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100044CE4;
  v57[3] = &unk_100071950;
  id v58 = a1[4];
  id v59 = a1[7];
  id v2 = objc_retainBlock(v57);
  id v3 = (void *)v61[5];
  v61[5] = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = a1[5];
  id v6 = [a1[4] configuration];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100044D6C;
  v55[3] = &unk_1000731D8;
  id v28 = v4;
  id v56 = v28;
  [v5 _forEachPeerMatchingConfiguration:v6 perform:v55];

  if ([v28 count])
  {
    id v7 = objc_alloc((Class)NSDictionary);
    id v8 = [a1[6] data];
    id v9 = +[NSDictionary dictionaryWithObject:v8 forKey:@"activeTileGroupData"];
    id v24 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"resourcemanifest.didChangeActiveTileGroup", @"message", v9, @"userInfo", 0);

    uint64_t v27 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = [v28 copy];
    id v11 = [v10 countByEnumeratingWithState:&v51 objects:v66 count:16];
    if (v11)
    {
      uint64_t v26 = *(void *)v52;
      id obj = v10;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v12);
          v49[0] = 0;
          v49[1] = v49;
          v49[2] = 0x2020000000;
          char v50 = 0;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100044D78;
          v44[3] = &unk_100073200;
          id v47 = v49;
          id v45 = v28;
          id v46 = v13;
          uint64_t v48 = &v60;
          id v14 = objc_retainBlock(v44);
          uint64_t v38 = 0;
          long long v39 = &v38;
          uint64_t v40 = 0x3032000000;
          long long v41 = sub_100044E1C;
          long long v42 = sub_100044E2C;
          id v43 = 0;
          id v15 = [a1[5] daemon];
          uint64_t v16 = [v15 serverQueue];
          id v32 = _NSConcreteStackBlock;
          uint64_t v33 = 3221225472;
          id v34 = sub_100044E34;
          long long v35 = &unk_100071978;
          long long v17 = v14;
          id v36 = v17;
          long long v37 = &v38;
          uint64_t v18 = geo_dispatch_timer_create_on_queue();
          long long v19 = (void *)v39[5];
          v39[5] = v18;

          dispatch_activate((dispatch_object_t)v39[5]);
          long long v20 = [v13 connection];
          id v21 = [a1[5] daemon];
          uint64_t v22 = [v21 serverQueue];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100044EB4;
          v29[3] = &unk_100073228;
          uint64_t v23 = v17;
          id v30 = v23;
          long long v31 = &v38;
          [v20 sendMessage:v27 withReply:v22 handler:v29];

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(v49, 8);
          long long v12 = (char *)v12 + 1;
        }
        while (v11 != v12);
        id v10 = obj;
        id v11 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
      }
      while (v11);
    }
  }
  else
  {
    (*(void (**)(void))(v61[5] + 16))();
  }

  _Block_object_dispose(&v60, 8);
}

void sub_100044C54(_Unwind_Exception *a1)
{
}

id sub_100044CB0(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100044CDC(uint64_t a1)
{
}

uint64_t sub_100044CE4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  GEOActiveTileGroupChangedInternalDarwinNotificationName();
  id v3 = objc_claimAutoreleasedReturnValue();
  notify_post((const char *)[v3 UTF8String]);

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id v5 = (const char *)GEOActiveTileGroupChangedNotification;

  return notify_post(v5);
}

id sub_100044D6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100044D78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      if (![*(id *)(a1 + 32) count])
      {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
        uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v4 = *(void **)(v3 + 40);
        *(void *)(v3 + 40) = 0;
      }
    }
  }
}

uint64_t sub_100044E1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100044E2C(uint64_t a1)
{
}

void sub_100044E34(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

void sub_100044EB4(uint64_t a1, void *a2)
{
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

id sub_100045240()
{
  self;
  uint64_t v2 = objc_opt_class();
  uint64_t v0 = +[NSArray arrayWithObjects:&v2 count:1];

  return v0;
}

void sub_1000452C4()
{
  self;
  if (sub_100022B80())
  {
    id v0 = [sub_100022D94() sharedScheduler];
    [v0 registerForTaskWithIdentifier:@"com.apple.geod.telemetry.daily" usingQueue:0 launchHandler:&stru_100073290];
  }
}

void sub_100045338(id a1, BGSystemTask *a2)
{
}

void sub_10004534C(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  self;
  uint64_t v4 = sub_1000455CC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v27 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Generating telemetry for type: %llu", buf, 0xCu);
  }

  uint64_t v5 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = sub_100045240();
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(objc_class **)(*((void *)&v21 + 1) + 8 * (void)v10);
        dispatch_group_enter(v5);
        id v12 = objc_alloc_init(v11);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        void v19[2] = sub_100045620;
        v19[3] = &unk_100071468;
        long long v20 = v5;
        [v12 reportTelemetryForType:a2 completionHandler:v19];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  global_queue = geo_get_global_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045628;
  block[3] = &unk_100071BA0;
  id v17 = v15;
  uint64_t v18 = a2;
  id v14 = v15;
  dispatch_group_notify(v5, global_queue, block);
}

id sub_1000455CC()
{
  if (qword_100084938 != -1) {
    dispatch_once(&qword_100084938, &stru_1000732B0);
  }
  id v0 = (void *)qword_100084930;

  return v0;
}

void sub_100045620(uint64_t a1)
{
}

id sub_100045628(uint64_t a1)
{
  uint64_t v2 = sub_1000455CC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Finished generating telemetry for type: %llu", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_1000456D8(id a1)
{
  qword_100084930 = (uint64_t)os_log_create("com.apple.GeoServices", "PeriodicTelemetry");

  _objc_release_x1();
}

void sub_10004595C(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = +[GEOPDPlace failedPlaceDataForMuid:](GEOPDPlace, "failedPlaceDataForMuid:", [v7 muid]);
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v5];
  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  if (!v6)
  {
    uint64_t v6 = +[NSMutableIndexSet indexSet];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
  [v6 addIndex:a3];
}

id sub_100045C28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 40) atIndexedSubscript:a2];
}

id sub_100045C38(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)GEOPDPlaceResponse);
  uint64_t v3 = objc_msgSend(v1, "_geo_map:", &stru_1000735D8);

  id v4 = [v3 mutableCopy];
  [v2 setMapsResults:v4];

  return v2;
}

void sub_1000463D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 finishedIdentifier:*(void *)(a1 + 32) withResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)])objc_msgSend(*(id *)(a1 + 56), "addObject:", v3); {
}
  }

void sub_1000468CC(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  int v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = a3;
LABEL_3:
    id v8 = [v6 objectAtIndexedSubscript:v7];
    uint64_t v9 = *(void **)(a1 + 48);
    id v10 = [*(id *)(a1 + 56) _finished:v8 withResult:v13 error:0];
    [v9 addObjectsFromArray:v10];

    goto LABEL_4;
  }
  id v11 = [objc_alloc((Class)GEOMapItemIdentifier) initWithPlace:v13];
  id v12 = [v5 indexOfObject:v11];

  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) addIndex:v12];
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = v12;
    goto LABEL_3;
  }
LABEL_4:
}

uint64_t sub_100046E6C(uint64_t a1)
{
  qword_100084940 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_10004721C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) _failAllPendingRequests];
}

void sub_10004729C(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56)) {
    goto LABEL_3;
  }
  global_queue = geo_get_global_queue();
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100047414;
  v10[3] = &unk_1000730E8;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v6, v10);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56));
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
LABEL_3:
    GEODataRequestTimeout();
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 3.0 * 0.5 * 1000000000.0));
    dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

void sub_100047414(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupPendingRequestMananger];
}

void sub_1000475AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000475D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000475E0(uint64_t a1)
{
}

id sub_1000475E8(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
  uint64_t v8 = a1[5];
  uint64_t v9 = *(void **)(a1[4] + 24);

  return [v9 removeObjectForKey:v8];
}

void sub_100047A24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  BOOL v3 = (v2 & 8) == 0;
  if (_GEOConfigHasValue()) {
    int BOOL = GEOConfigGetBOOL();
  }
  else {
    int BOOL = (v2 >> 1) & 1;
  }
  if (_GEOConfigHasValue()) {
    int v5 = GEOConfigGetBOOL();
  }
  else {
    int v5 = (v2 >> 2) & 1;
  }
  if (_GEOConfigHasValue()) {
    int v6 = GEOConfigGetBOOL();
  }
  else {
    int v6 = v2 & 1;
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v74 = a1;
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == identifiers";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (!*(void *)(a1 + 80))
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == requesterHandler";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (!*(void *)(a1 + 40))
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == traits";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    goto LABEL_25;
  }
  unsigned int v8 = *(unsigned __int8 *)(a1 + 108);
  int v9 = BOOL & v8;
  if (!(BOOL & v8 | v6))
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "!canUseCache && !canUseNetwork";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
LABEL_25:

    return;
  }
  if (![v7 count])
  {
    long long v41 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      long long v42 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "No use running %{public}@ without any MUIDs.", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    return;
  }
  BOOL v63 = v3;
  int v64 = v6;
  id v65 = [*(id *)(*(void *)(a1 + 48) + 40) identifiersRequested:*(void *)(a1 + 32) forHandler:*(void *)(a1 + 80)];
  v66 = +[NSMutableOrderedSet orderedSetWithArray:*(void *)(a1 + 32)];
  long long v69 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  [v66 minusSet:v65];
  id v15 = NSMutableOrderedSet;
  long long v71 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v66 count]);
  if (!v9)
  {
    id v15 = +[GEOPlatform sharedPlatform];
    if (![v15 isInternalInstall])
    {
      id v72 = 0;
LABEL_64:
      long long v39 = v71;
      int v40 = v64;

      [v71 unionOrderedSet:v66];
LABEL_65:
      [v39 minusSet:v65];
      if (v40 && [v71 count])
      {
        id v43 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138477827;
          *(void *)&uint8_t buf[4] = v71;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Missing Identifiers: %{private}@", buf, 0xCu);
        }

        id v44 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138477827;
          *(void *)&uint8_t buf[4] = v65;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Requests in progress: %{private}@", buf, 0xCu);
        }

        id v45 = [v71 array];
        uint64_t v46 = *(unsigned int *)(v74 + 104);
        uint64_t v48 = *(void *)(v74 + 40);
        id v47 = *(void **)(v74 + 48);
        uint64_t v50 = *(void *)(v74 + 56);
        uint64_t v49 = *(void *)(v74 + 64);
        uint64_t v51 = *(void *)(v74 + 72);
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100048B34;
        v77[3] = &unk_100073480;
        v77[4] = v47;
        BOOL v80 = v63;
        id v72 = v72;
        id v78 = v72;
        id v79 = v45;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_100048F28;
        v75[3] = &unk_100073430;
        v75[4] = *(void *)(v74 + 48);
        id v76 = v71;
        id v52 = v45;
        [v47 _requestIdentifiersFromNetwork:v52 resultProviderID:v46 requestUUID:v49 traits:v48 auditToken:v50 throttleToken:v51 finished:v77 error:v75];
      }
      else
      {
        long long v53 = *(void **)(*(void *)(v74 + 48) + 40);
        long long v54 = [v71 set];
        [v53 failedToResolveIdentifiers:v54 withError:0];

        [*(id *)(v74 + 48) _resetRequestTimeout];
      }
      goto LABEL_73;
    }
  }
  uint64_t v16 = +[GEOPDPlaceRequest createRequestedComponentsForReason:0 traits:*(void *)(a1 + 40) count:1];
  id v72 = +[GEOPDPlace componentTypesFromComponentInfos:v16];

  if (!v9) {
    goto LABEL_64;
  }
  long long v68 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v66 count]);
  v67 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v66 count]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v66;
  id v17 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (!v17) {
    goto LABEL_51;
  }
  uint64_t v18 = v5 & v8;
  uint64_t v73 = *(void *)v96;
  do
  {
    for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v96 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v95 + 1) + 8 * i);
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v100 = sub_1000475D0;
      v101 = sub_1000475E0;
      id v102 = 0;
      uint64_t v91 = 0;
      v92 = &v91;
      uint64_t v93 = 0x2020000000;
      char v94 = 0;
      uint64_t v87 = 0;
      v88 = &v87;
      uint64_t v89 = 0x2020000000;
      uint64_t v90 = 0;
      long long v21 = [*(id *)(v74 + 48) pdPlaceCache];
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_100048754;
      v86[3] = &unk_1000718B0;
      v86[4] = buf;
      v86[5] = &v91;
      v86[6] = &v87;
      [v21 lookupPlaceByIdentifier:v20 allowExpired:v18 resultBlock:v86];

      long long v22 = *(void **)(*(void *)&buf[8] + 40);
      if (v22)
      {
        unsigned int v23 = [v22 hasExpectedComponentTypes:v72];
        if (*((unsigned char *)v92 + 24)) {
          char v24 = 0;
        }
        else {
          char v24 = v23;
        }
        if (v24)
        {
          uint64_t v25 = 1;
LABEL_47:
          [*(id *)(v74 + 48) registerCacheResult:v25 forMapItem:v20 cachedByteCount:v88[3] forRequestType:23 auditToken:*(void *)(v74 + 56)];
          [v69 addObject:v20];
          [v68 addObject:*(void *)(*(void *)&buf[8] + 40)];
          goto LABEL_49;
        }
        if (v18) {
          unsigned int v26 = v23;
        }
        else {
          unsigned int v26 = 0;
        }
        if (v26 == 1)
        {
          [v67 addObject:v20];
          uint64_t v25 = 3;
          goto LABEL_47;
        }
      }
      [v71 addObject:v20];
      [*(id *)(v74 + 48) registerCacheResult:2 forMapItem:v20 cachedByteCount:v88[3] forRequestType:23 auditToken:*(void *)(v74 + 56)];
LABEL_49:
      _Block_object_dispose(&v87, 8);
      _Block_object_dispose(&v91, 8);
      _Block_object_dispose(buf, 8);
    }
    id v17 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
  }
  while (v17);
LABEL_51:

  [*(id *)(*(void *)(v74 + 48) + 40) didResolveItems:v68 forIdentifiers:v69];
  if ([v67 count]) {
    BOOL v27 = v64 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27)
  {
    [*(id *)(*(void *)(v74 + 48) + 40) willUpdateExpiredIdentifiers:v67];
    id v28 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138477827;
      *(void *)&uint8_t buf[4] = v67;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Expired Identifiers: %{private}@", buf, 0xCu);
    }

    uint64_t v29 = [v67 allObjects];
    uint64_t v30 = *(unsigned int *)(v74 + 104);
    uint64_t v32 = *(void *)(v74 + 40);
    long long v31 = *(void **)(v74 + 48);
    uint64_t v34 = *(void *)(v74 + 56);
    uint64_t v33 = *(void *)(v74 + 64);
    uint64_t v35 = *(void *)(v74 + 72);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000487C4;
    v83[3] = &unk_100073408;
    BOOL v85 = v63;
    v83[4] = v31;
    id v84 = v29;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1000489AC;
    v81[3] = &unk_100073430;
    v81[4] = v31;
    id v82 = v67;
    id v36 = v29;
    [v31 _requestIdentifiersFromNetwork:v36 resultProviderID:v30 requestUUID:v33 traits:v32 auditToken:v34 throttleToken:v35 finished:v83 error:v81];
  }
  long long v37 = (char *)[v68 count];
  id v38 = [v71 count];
  if (&v37[(void)v38] == [obj count])
  {

    long long v39 = v71;
    int v40 = v64;
    goto LABEL_65;
  }
  BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (v55) {
    sub_10004D244(v55, v56, v57, v58, v59, v60, v61, v62);
  }

LABEL_73:
}

void sub_100048718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_100048754(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void sub_1000487C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  geo_reentrant_isolate_sync();
}

id sub_100048888(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (!objc_msgSend(v7, "status", (void)v9)) {
            [*(id *)(a1 + 40) trackPlaceData:v7];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "didResolveItems:forIdentifiers:", *(void *)(a1 + 32), *(void *)(a1 + 48), (void)v9);
}

void sub_1000489AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  geo_reentrant_isolate_sync_data();
}

void sub_100048A68(void *a1)
{
  [*(id *)(a1[4] + 40) failedToResolveIdentifiers:a1[5] withError:0];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = a1[6];
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[For MUID] Error refreshing expired muids: %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100048B34(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v3 = v4;
  geo_reentrant_isolate_sync();
}

id sub_100048C0C(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          long long v9 = [v7 compactDebugDescription];
          *(_DWORD *)long long buf = 138477827;
          id v23 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Received place data: %{private}@", buf, 0xCu);
        }
        [v7 setFirstSeenTimestamp:Current];
        sub_100003FEC(*(void *)(a1 + 40), v7, *(void **)(a1 + 48));
        id v10 = [objc_alloc((Class)GEOMapItemIdentifier) initWithPlace:v7];
        long long v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138477827;
          id v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Checking placedata with identifier=%{private}@", buf, 0xCu);
        }

        unsigned int v12 = [v7 status];
        id v13 = GEOFindOrCreateLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)long long buf = 138478083;
            id v23 = v10;
            __int16 v24 = 2113;
            id v25 = v7;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received unsuccessful place with identifier=%{private}@, data: %{private}@", buf, 0x16u);
          }
        }
        else
        {
          if (v14)
          {
            id v15 = [v7 bestName];
            *(_DWORD *)long long buf = 138477827;
            id v23 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received place data for: %{private}@", buf, 0xCu);
          }
          if (*(unsigned char *)(a1 + 64)) {
            [*(id *)(a1 + 40) trackPlaceData:v7];
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 40) + 40) didResolveItems:*(void *)(a1 + 32) forIdentifiers:*(void *)(a1 + 56)];
}

void sub_100048F28(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(id *)(a1 + 40);
  id v3 = v4;
  geo_reentrant_isolate_sync();
}

void sub_100048FE4(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[For MUID] Error fetching missing muids: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 40) + 40);
  id v5 = [*(id *)(a1 + 48) set];
  [v4 failedToResolveIdentifiers:v5 withError:*(void *)(a1 + 32)];
}

void sub_1000492F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32)
    && ([v3 resultsWithResultType:1], v4 = objc_claimAutoreleasedReturnValue(), id v3 = v6, v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_7;
    }
    id v4 = +[NSError GEOErrorWithCode:-11 reason:@"Identifier lookup failed to return any results"];
    uint64_t v5 = *(void *)(a1 + 40);
  }
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

  id v3 = v6;
LABEL_7:
}

void sub_1000499E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100049A00(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSNull null];

  if (v6 != v5)
  {
    uint64_t v7 = GEOStringForPhoneNumber();
    id v8 = v7;
    if (v7 && [v7 length])
    {
      long long v9 = [*(id *)(a1 + 32) pdPlaceCache];
      id v10 = [v9 lookupIdentifierByPhoneNumber:v8];

      if (v10)
      {
        long long v11 = *(void **)(a1 + 40);
        unsigned int v12 = +[NSNumber numberWithUnsignedInteger:a3];
        [v11 setObject:v12 forKey:v10];
      }
    }
    else
    {
      id v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't construct a string version for phone number.", v14, 2u);
      }
    }
  }
}

id sub_100049B44(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100049B70(uint64_t a1)
{
}

void sub_100049B78(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100049CAC;
  v17[3] = &unk_100073520;
  uint64_t v13 = *(void *)(a1 + 88);
  id v21 = v8;
  uint64_t v22 = v13;
  id v18 = v7;
  uint64_t v14 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  char v23 = *(unsigned char *)(a1 + 96);
  id v15 = v7;
  id v16 = v8;
  [v9 requestIdentifiers:v15 resultProviderID:0 requestUUID:v10 traits:v11 options:a2 auditToken:v12 throttleToken:v14 requesterHandler:v17];
}

void sub_100049CAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 56) || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v7 = +[NSMutableSet setWithArray:*(void *)(a1 + 32)];
    if (v6)
    {
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67240450;
        int v36 = 0;
        __int16 v37 = 2114;
        id v38 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error consulting providerId=%{public}d: %{public}@", buf, 0x12u);
      }
    }
    else
    {
      id v8 = [v5 resultsWithResultType:1];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v29 = 0;
        id v30 = v5;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v13, "status", v29, v30) != 20)
            {
              id v14 = [objc_alloc((Class)GEOMapItemIdentifier) initWithPlace:v13];
              id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
              id v16 = v15;
              if (v15)
              {
                id v17 = v7;
                id v18 = *(void **)(a1 + 48);
                id v19 = [v15 unsignedIntegerValue];
                id v20 = v18;
                id v7 = v17;
                [v20 setObject:v13 atIndexedSubscript:v19];
              }
              [v7 removeObject:v14];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v10);
        id v6 = v29;
        id v5 = v30;
      }
    }

    uint64_t v21 = *(void *)(a1 + 56);
    if (v21)
    {
      uint64_t v22 = sub_100045C38(*(void **)(a1 + 48));
      (*(void (**)(uint64_t, void *, id))(v21 + 16))(v21, v22, v6);
    }
    uint64_t v23 = *(void *)(a1 + 64);
    if (*(void *)(*(void *)(v23 + 8) + 40))
    {
      if (*(unsigned char *)(a1 + 72))
      {
        id v24 = [v7 count];
        uint64_t v23 = *(void *)(a1 + 64);
        if (v24)
        {
          uint64_t v25 = *(void *)(*(void *)(v23 + 8) + 40);
          unsigned int v26 = [v7 allObjects];
          (*(void (**)(uint64_t, uint64_t, void *, void))(v25 + 16))(v25, 1, v26, 0);

          uint64_t v23 = *(void *)(a1 + 64);
        }
      }
    }
    uint64_t v27 = *(void *)(v23 + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = 0;
  }
}

uint64_t sub_10004A0EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = [a4 data];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];

  return 1;
}

void sub_10004A14C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void sub_10004A2A4(void *a1, void *a2, char a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

uint64_t sub_10004A314(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

id sub_10004A6AC(id a1, GEOPDPlace *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)GEOPDMapsResult);
  [v3 setResultType:1];
  [v3 setPlace:v2];

  return v3;
}

void sub_10004A9E8(id a1)
{
  qword_100084958 = objc_alloc_init(_GEOTransitRouteUpdateRequestConfig);

  _objc_release_x1();
}

void sub_10004AAA0(id a1)
{
  qword_100084960 = objc_alloc_init(GEOTransitUpdateServerRequester);

  _objc_release_x1();
}

void sub_10004AC14(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

uint64_t sub_10004AD90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004AFE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B25C(id a1)
{
  id v1 = objc_alloc_init((Class)GEOTaskQueue);
  id v2 = (void *)qword_100084970;
  qword_100084970 = (uint64_t)v1;

  [(id)qword_100084970 setWidth:GEOConfigGetUInteger()];
  id global_queue = (id)geo_get_global_queue();
  uint64_t v3 = _GEOConfigAddBlockListenerForKey();
  id v4 = (void *)qword_100084978;
  qword_100084978 = v3;
}

void sub_10004B300(id a1, $464B15F94E0D705FD6D497CD7841E26A a2)
{
  uint64_t UInteger = GEOConfigGetUInteger();
  uint64_t v3 = (void *)qword_100084970;

  [v3 setWidth:UInteger];
}

void sub_10004B538(id a1)
{
  qword_100084988 = objc_alloc_init(GEOETAServiceRequester);

  _objc_release_x1();
}

void sub_10004B808(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  if (v12)
  {
    id v7 = v12;
    id v8 = +[GEOExperimentConfiguration sharedConfiguration];
    id v9 = [v7 datasetAbStatus];
    [v8 refreshDatasetABStatus:v9];

    uint64_t v10 = a1[5];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
    }
  }
  else
  {
    uint64_t v11 = a1[6];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
    }
  }
}

void sub_10004BC1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    int BOOL = GEOConfigGetBOOL();
    uint64_t v6 = *(void *)(a1 + 32);
    if (BOOL)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      _DWORD v7[2] = sub_10004BD0C;
      v7[3] = &unk_1000736E8;
      id v8 = v4;
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
    }
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void sub_10004BD0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (GEOETATrafficUpdateRequestHasSensitiveFields()) {
    [v3 clearSensitiveFields:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BD7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  id v5 = [v3 datasetAbStatus];
  [v4 refreshDatasetABStatus:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v3, "routes", 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 reroutedRoutesCount])
        {
          id v12 = [v11 reroutedRouteAtIndex:0];
          [v12 unpackLatLngVertices];
          uint64_t v13 = [v12 unpackedLatLngVertices];

          if (!v13) {
            [v11 setReroutedRoutes:0];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

void sub_10004BF24(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[GEOProtobufSession sharedDelegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C03C;
  block[3] = &unk_100073760;
  id v13 = a1[4];
  id v11 = v6;
  id v14 = a1[5];
  id v15 = a1[6];
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

uint64_t sub_10004C03C(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  if (a1[4])
  {
    uint64_t result = a1[7];
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = a1[8];
  }
  id v4 = *(uint64_t (**)(void))(result + 16);

  return v4();
}

id sub_10004C614(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResponse:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10004C654(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 send];
}

void sub_10004C968(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)GEOETAUpdateableWillSendRequest) initWithMessage:@"ETA.willSendETARequest" traits:0 auditToken:0 throttleToken:0];
  id v5 = [*(id *)(a1 + 32) peer];
  id v6 = [v5 connection];
  global_workloop = (void *)geo_get_global_workloop();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004CA78;
  v9[3] = &unk_1000737B0;
  id v10 = v3;
  id v8 = v3;
  [v4 send:v6 withReply:global_workloop handler:v9];
}

void sub_10004CA78(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 updatedRequest];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id sub_10004CAD8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResponse:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 send];
}

id sub_10004CB18(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setError:v4];
  id v5 = objc_msgSend(v4, "_geo_etaTrafficUpdateErrorInfo");

  [*(id *)(a1 + 32) setErrorInfo:v5];
  id v6 = *(void **)(a1 + 32);

  return [v6 send];
}

void sub_10004CC20()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: proxy != ((void *)0)", v0, 2u);
}

void sub_10004CC68()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: counts.count == 0 || [counts.firstObject isKindOfClass:GEORequestCounterCacheResults.class]", v0, 2u);
}

uint64_t sub_10004CCB0()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CCD8(v0);
}

uint64_t sub_10004CCD8()
{
  return sub_10004CD00();
}

uint64_t sub_10004CD00()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CD28(v0);
}

uint64_t sub_10004CD28()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CD50(v0);
}

uint64_t sub_10004CD50()
{
  return sub_10004CD74();
}

uint64_t sub_10004CD74()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CD9C(v0);
}

uint64_t sub_10004CD9C()
{
  return sub_10004CDC4();
}

uint64_t sub_10004CDC4()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CDEC(v0);
}

uint64_t sub_10004CDEC()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CE14(v0);
}

uint64_t sub_10004CE14()
{
  return sub_10004CE3C();
}

uint64_t sub_10004CE3C()
{
  uint64_t v0 = abort_report_np();
  return sub_10004CE64(v0);
}

void sub_10004CE64()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _persistence != ((void *)0)", v0, 2u);
}

void sub_10004CEAC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _offlineService != ((void *)0)", v0, 2u);
}

void sub_10004CEF4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: request.requestUUID != ((void *)0)", v0, 2u);
}

void sub_10004CF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000342CC((void *)&_mh_execute_header, &_os_log_default, a3, "Assertion failed: options != GEOConfigOption_None", a5, a6, a7, a8, 0);
}

void sub_10004CF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004CFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004CFF0()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  int v2 = 138543362;
  id v3 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unreachable reached: query parameter value is unexpected type: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10004D08C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [proxy isKindOfClass:GEOTileServerLocalProxy.class]", v0, 2u);
}

void sub_10004D0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000342CC((void *)&_mh_execute_header, &_os_log_default, a3, "Assertion failed: indexes != ((void *)0)", a5, a6, a7, a8, 0);
}

void sub_10004D110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000342CC((void *)&_mh_execute_header, &_os_log_default, a3, "Assertion failed: strongLoader != nil", a5, a6, a7, a8, 0);
}

void sub_10004D14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004D188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000342CC((void *)&_mh_execute_header, &_os_log_default, a3, "Assertion failed: [resolvedIdentifierIndexes count] == [placeResults count]", a5, a6, a7, a8, 0);
}

void sub_10004D1C4(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v1, 8u);
}

void sub_10004D244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000342CC((void *)&_mh_execute_header, &_os_log_default, a3, "Assertion failed: hittingPlaces.count + missingIdentifiers.count == todoIdentifiers.count", a5, a6, a7, a8, 0);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

uint64_t CacheDeleteUpdatePurgeable()
{
  return _CacheDeleteUpdatePurgeable();
}

uint64_t GEOActiveTileGroupChangedInternalDarwinNotificationName()
{
  return _GEOActiveTileGroupChangedInternalDarwinNotificationName();
}

uint64_t GEOBackgroundTaskReportReportTaskInitiated()
{
  return _GEOBackgroundTaskReportReportTaskInitiated();
}

uint64_t GEOCalculateChangedKeys()
{
  return _GEOCalculateChangedKeys();
}

uint64_t GEOConfigGetArray()
{
  return _GEOConfigGetArray();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
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

uint64_t GEOConfigSetDictionary()
{
  return _GEOConfigSetDictionary();
}

uint64_t GEOConfigSetDouble()
{
  return _GEOConfigSetDouble();
}

uint64_t GEOConfigSetString()
{
  return _GEOConfigSetString();
}

uint64_t GEOConfig_createEntitledKeyPathForKey()
{
  return _GEOConfig_createEntitledKeyPathForKey();
}

uint64_t GEOConfig_keyRequiresEntitlement()
{
  return _GEOConfig_keyRequiresEntitlement();
}

uint64_t GEOConfig_migrateEntitledKey()
{
  return _GEOConfig_migrateEntitledKey();
}

uint64_t GEOConfig_pruneEntitledKeysForAuditToken()
{
  return _GEOConfig_pruneEntitledKeysForAuditToken();
}

uint64_t GEOConfig_validateEntitlementForKey()
{
  return _GEOConfig_validateEntitlementForKey();
}

uint64_t GEOCreatePhoneNumberForStringRepresentation()
{
  return _GEOCreatePhoneNumberForStringRepresentation();
}

uint64_t GEODataRequestTimeout()
{
  return _GEODataRequestTimeout();
}

uint64_t GEODecodeModernXPCMessage()
{
  return _GEODecodeModernXPCMessage();
}

uint64_t GEODecodeXPCValue()
{
  return _GEODecodeXPCValue();
}

uint64_t GEODefaultsSetUseServer()
{
  return _GEODefaultsSetUseServer();
}

uint64_t GEODirectionsRequestHasSensitiveFields()
{
  return _GEODirectionsRequestHasSensitiveFields();
}

uint64_t GEOETARequestRemoveFieldsForSendingRequest()
{
  return _GEOETARequestRemoveFieldsForSendingRequest();
}

uint64_t GEOETATrafficUpdateRequestHasSensitiveFields()
{
  return _GEOETATrafficUpdateRequestHasSensitiveFields();
}

uint64_t GEOErrorDomain()
{
  return _GEOErrorDomain();
}

uint64_t GEOExperimentConfigurationPath()
{
  return _GEOExperimentConfigurationPath();
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

uint64_t GEOGetDefaultWithSource()
{
  return _GEOGetDefaultWithSource();
}

uint64_t GEOGetGEODaemonLog()
{
  return _GEOGetGEODaemonLog();
}

uint64_t GEOGetLaunchLog()
{
  return _GEOGetLaunchLog();
}

uint64_t GEOGetMonotonicTime()
{
  return _GEOGetMonotonicTime();
}

uint64_t GEOGetOfflineServiceLog()
{
  return _GEOGetOfflineServiceLog();
}

uint64_t GEOGetResourceManifestLog()
{
  return _GEOGetResourceManifestLog();
}

uint64_t GEOGetSubscriptionsLog()
{
  return _GEOGetSubscriptionsLog();
}

uint64_t GEOGetTileLoadingLog()
{
  return _GEOGetTileLoadingLog();
}

uint64_t GEOGetURL()
{
  return _GEOGetURL();
}

uint64_t GEOGetUserDefaultsLog()
{
  return _GEOGetUserDefaultsLog();
}

uint64_t GEOGetValuesForKeysForCompanionSync()
{
  return _GEOGetValuesForKeysForCompanionSync();
}

uint64_t GEOGreenTeaGetLog()
{
  return _GEOGreenTeaGetLog();
}

uint64_t GEOGreenTeaLog()
{
  return _GEOGreenTeaLog();
}

uint64_t GEOMachAbsoluteTimeGetCurrent()
{
  return _GEOMachAbsoluteTimeGetCurrent();
}

uint64_t GEOMapItemHandleShouldStoreRequestData()
{
  return _GEOMapItemHandleShouldStoreRequestData();
}

uint64_t GEOMapRectForMapRegion()
{
  return _GEOMapRectForMapRegion();
}

uint64_t GEOMapRectIntersectsRect()
{
  return _GEOMapRectIntersectsRect();
}

uint64_t GEOMigrateDefaults()
{
  return _GEOMigrateDefaults();
}

uint64_t GEOOfflineStateAsString()
{
  return _GEOOfflineStateAsString();
}

uint64_t GEOOnce()
{
  return _GEOOnce();
}

uint64_t GEOProactiveTileDownloadPolicyIsEnabled()
{
  return _GEOProactiveTileDownloadPolicyIsEnabled();
}

uint64_t GEORegionalResourcesDirectory()
{
  return _GEORegionalResourcesDirectory();
}

uint64_t GEORegisterPListStateCaptureAtFrequency()
{
  return _GEORegisterPListStateCaptureAtFrequency();
}

uint64_t GEORegisterPListStateCaptureLegacy()
{
  return _GEORegisterPListStateCaptureLegacy();
}

uint64_t GEOResourcesPairedDevicesCachesDirectory()
{
  return _GEOResourcesPairedDevicesCachesDirectory();
}

uint64_t GEOResourcesPath()
{
  return _GEOResourcesPath();
}

uint64_t GEOStringForPhoneNumber()
{
  return _GEOStringForPhoneNumber();
}

uint64_t GEOStringFromTileKey()
{
  return _GEOStringFromTileKey();
}

uint64_t GEOTileKeyEquals()
{
  return _GEOTileKeyEquals();
}

uint64_t GEOTileKeyIsOffline()
{
  return _GEOTileKeyIsOffline();
}

uint64_t GEOTileKeyMakeOnline()
{
  return _GEOTileKeyMakeOnline();
}

uint64_t GEOTileKeyStyle()
{
  return _GEOTileKeyStyle();
}

uint64_t GEOURLLogFacility()
{
  return _GEOURLLogFacility();
}

uint64_t GEOURLString()
{
  return _GEOURLString();
}

uint64_t GEOUnregisterStateCaptureLegacy()
{
  return _GEOUnregisterStateCaptureLegacy();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return __GEOConfigAddBlockListenerForKey();
}

uint64_t _GEOConfigClearExpiredKey()
{
  return __GEOConfigClearExpiredKey();
}

uint64_t _GEOConfigHasValue()
{
  return __GEOConfigHasValue();
}

uint64_t _GEOConfigOptionsUseClientCache()
{
  return __GEOConfigOptionsUseClientCache();
}

uint64_t _GEOConfigPostKeysChangedNotification()
{
  return __GEOConfigPostKeysChangedNotification();
}

uint64_t _GEOConfigProxy()
{
  return __GEOConfigProxy();
}

uint64_t _GEOConfigRemoveValue()
{
  return __GEOConfigRemoveValue();
}

uint64_t _GEOConfigSetProxy()
{
  return __GEOConfigSetProxy();
}

uint64_t _GEOCreateTransaction()
{
  return __GEOCreateTransaction();
}

uint64_t _GEOGetAllValuesInStore()
{
  return __GEOGetAllValuesInStore();
}

uint64_t _GEOLogPBCodableData()
{
  return __GEOLogPBCodableData();
}

uint64_t _GEOMapDataSubscriptionIdentifierIsCompatible()
{
  return __GEOMapDataSubscriptionIdentifierIsCompatible();
}

uint64_t _GEOMurmurHash3_128_realign()
{
  return __GEOMurmurHash3_128_realign();
}

uint64_t _GEOResetAllDefaults()
{
  return __GEOResetAllDefaults();
}

uint64_t _GEOSetAllValuesInStore()
{
  return __GEOSetAllValuesInStore();
}

uint64_t _GEOSetQueryForExperimentType()
{
  return __GEOSetQueryForExperimentType();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _geo_NSErrorDictionaryRepresentationCopy()
{
  return __geo_NSErrorDictionaryRepresentationCopy();
}

uint64_t _geo_NSErrorFromDictionaryRepresentationCopy()
{
  return __geo_NSErrorFromDictionaryRepresentationCopy();
}

uint64_t _geo_isolate_lock()
{
  return __geo_isolate_lock();
}

uint64_t _geo_isolate_lock_data()
{
  return __geo_isolate_lock_data();
}

uint64_t _geo_isolate_unlock()
{
  return __geo_isolate_unlock();
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return _dispatch_block_create_with_voucher_and_qos_class();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
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

uint64_t geo_dispatch_block_clean_copy()
{
  return _geo_dispatch_block_clean_copy();
}

uint64_t geo_dispatch_queue_create()
{
  return _geo_dispatch_queue_create();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return _geo_dispatch_queue_create_with_qos();
}

uint64_t geo_dispatch_queue_create_with_target()
{
  return _geo_dispatch_queue_create_with_target();
}

uint64_t geo_dispatch_queue_create_with_workloop_qos()
{
  return _geo_dispatch_queue_create_with_workloop_qos();
}

uint64_t geo_dispatch_timer_create_on_queue()
{
  return _geo_dispatch_timer_create_on_queue();
}

uint64_t geo_get_global_queue()
{
  return _geo_get_global_queue();
}

uint64_t geo_get_global_workloop()
{
  return _geo_get_global_workloop();
}

uint64_t geo_isolate_sync()
{
  return _geo_isolate_sync();
}

uint64_t geo_isolate_sync_data()
{
  return _geo_isolate_sync_data();
}

uint64_t geo_isolater_create()
{
  return _geo_isolater_create();
}

uint64_t geo_isolater_create_with_format()
{
  return _geo_isolater_create_with_format();
}

uint64_t geo_reentrant_isolate_sync()
{
  return _geo_reentrant_isolate_sync();
}

uint64_t geo_reentrant_isolate_sync_data()
{
  return _geo_reentrant_isolate_sync_data();
}

uint64_t geo_reentrant_isolater_create()
{
  return _geo_reentrant_isolater_create();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return _strtouq(__str, __endptr, __base);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__acceptableKeys(void *a1, const char *a2, ...)
{
  return [a1 _acceptableKeys];
}

id objc_msgSend__calculateFreeableSpace(void *a1, const char *a2, ...)
{
  return [a1 _calculateFreeableSpace];
}

id objc_msgSend__cleanupPendingRequestMananger(void *a1, const char *a2, ...)
{
  return [a1 _cleanupPendingRequestMananger];
}

id objc_msgSend__configureConstrainedNetworkUpdateAssertion(void *a1, const char *a2, ...)
{
  return [a1 _configureConstrainedNetworkUpdateAssertion];
}

id objc_msgSend__defaultQueryParameters(void *a1, const char *a2, ...)
{
  return [a1 _defaultQueryParameters];
}

id objc_msgSend__defaultQueryType(void *a1, const char *a2, ...)
{
  return [a1 _defaultQueryType];
}

id objc_msgSend__deleteAndRecreateDB(void *a1, const char *a2, ...)
{
  return [a1 _deleteAndRecreateDB];
}

id objc_msgSend__evictAssetsOlderThanAllowedThreshold(void *a1, const char *a2, ...)
{
  return [a1 _evictAssetsOlderThanAllowedThreshold];
}

id objc_msgSend__evictIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _evictIfNecessary];
}

id objc_msgSend__failAllPendingRequests(void *a1, const char *a2, ...)
{
  return [a1 _failAllPendingRequests];
}

id objc_msgSend__fireOpportunisticResourceLoads(void *a1, const char *a2, ...)
{
  return [a1 _fireOpportunisticResourceLoads];
}

id objc_msgSend__getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 _getLocalFileUrl];
}

id objc_msgSend__getPlistURL(void *a1, const char *a2, ...)
{
  return [a1 _getPlistURL];
}

id objc_msgSend__mapsAbClientMetadata(void *a1, const char *a2, ...)
{
  return [a1 _mapsAbClientMetadata];
}

id objc_msgSend__registerCacheDeleteCallbacks(void *a1, const char *a2, ...)
{
  return [a1 _registerCacheDeleteCallbacks];
}

id objc_msgSend__resetRequestTimeout(void *a1, const char *a2, ...)
{
  return [a1 _resetRequestTimeout];
}

id objc_msgSend__setNeedsPairedDeviceStateSynchronization(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsPairedDeviceStateSynchronization];
}

id objc_msgSend__setupRefreshTask(void *a1, const char *a2, ...)
{
  return [a1 _setupRefreshTask];
}

id objc_msgSend__updateDataSizeOnDBQueue(void *a1, const char *a2, ...)
{
  return [a1 _updateDataSizeOnDBQueue];
}

id objc_msgSend__updateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateIfNecessary];
}

id objc_msgSend__updateOnQueue(void *a1, const char *a2, ...)
{
  return [a1 _updateOnQueue];
}

id objc_msgSend__validateDBLocaleAndResetIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _validateDBLocaleAndResetIfNecessary];
}

id objc_msgSend_abConfigKey(void *a1, const char *a2, ...)
{
  return [a1 abConfigKey];
}

id objc_msgSend_abConfigValue(void *a1, const char *a2, ...)
{
  return [a1 abConfigValue];
}

id objc_msgSend_abConfigValueType(void *a1, const char *a2, ...)
{
  return [a1 abConfigValueType];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeResources(void *a1, const char *a2, ...)
{
  return [a1 activeResources];
}

id objc_msgSend_activeTileGroup(void *a1, const char *a2, ...)
{
  return [a1 activeTileGroup];
}

id objc_msgSend_activeVersions(void *a1, const char *a2, ...)
{
  return [a1 activeVersions];
}

id objc_msgSend_additionalEnabledMarkets(void *a1, const char *a2, ...)
{
  return [a1 additionalEnabledMarkets];
}

id objc_msgSend_allExisitngInfos(void *a1, const char *a2, ...)
{
  return [a1 allExisitngInfos];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowCellular(void *a1, const char *a2, ...)
{
  return [a1 allowCellular];
}

id objc_msgSend_alternateResourcesNSURLs(void *a1, const char *a2, ...)
{
  return [a1 alternateResourcesNSURLs];
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return [a1 appId];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_automobileOptions(void *a1, const char *a2, ...)
{
  return [a1 automobileOptions];
}

id objc_msgSend_availableRequestCount(void *a1, const char *a2, ...)
{
  return [a1 availableRequestCount];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_basemapId(void *a1, const char *a2, ...)
{
  return [a1 basemapId];
}

id objc_msgSend_bestName(void *a1, const char *a2, ...)
{
  return [a1 bestName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_branchExpirationTtlHours(void *a1, const char *a2, ...)
{
  return [a1 branchExpirationTtlHours];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdForNetworkAttribution(void *a1, const char *a2, ...)
{
  return [a1 bundleIdForNetworkAttribution];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return [a1 cacheKey];
}

id objc_msgSend_cachePolicy(void *a1, const char *a2, ...)
{
  return [a1 cachePolicy];
}

id objc_msgSend_calculateFreeableSize(void *a1, const char *a2, ...)
{
  return [a1 calculateFreeableSize];
}

id objc_msgSend_calculateFreeableSizeSync(void *a1, const char *a2, ...)
{
  return [a1 calculateFreeableSizeSync];
}

id objc_msgSend_calculateFreeableSpaceSync(void *a1, const char *a2, ...)
{
  return [a1 calculateFreeableSpaceSync];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelCleanupBlockSchedule(void *a1, const char *a2, ...)
{
  return [a1 cancelCleanupBlockSchedule];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_clearCounters(void *a1, const char *a2, ...)
{
  return [a1 clearCounters];
}

id objc_msgSend_clearPurgeableOfflineData(void *a1, const char *a2, ...)
{
  return [a1 clearPurgeableOfflineData];
}

id objc_msgSend_clientCapabilities(void *a1, const char *a2, ...)
{
  return [a1 clientCapabilities];
}

id objc_msgSend_clientConfig(void *a1, const char *a2, ...)
{
  return [a1 clientConfig];
}

id objc_msgSend_clientDatasetMetadata(void *a1, const char *a2, ...)
{
  return [a1 clientDatasetMetadata];
}

id objc_msgSend_clientMetrics(void *a1, const char *a2, ...)
{
  return [a1 clientMetrics];
}

id objc_msgSend_closeServerConnection(void *a1, const char *a2, ...)
{
  return [a1 closeServerConnection];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compactDebugDescription(void *a1, const char *a2, ...)
{
  return [a1 compactDebugDescription];
}

id objc_msgSend_configKeyValues(void *a1, const char *a2, ...)
{
  return [a1 configKeyValues];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configureSubscriptionShouldSync(void *a1, const char *a2, ...)
{
  return [a1 configureSubscriptionShouldSync];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionProperties(void *a1, const char *a2, ...)
{
  return [a1 connectionProperties];
}

id objc_msgSend_contentVersion(void *a1, const char *a2, ...)
{
  return [a1 contentVersion];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyWithoutETAComponents(void *a1, const char *a2, ...)
{
  return [a1 copyWithoutETAComponents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentProcessAuditToken(void *a1, const char *a2, ...)
{
  return [a1 currentProcessAuditToken];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSet(void *a1, const char *a2, ...)
{
  return [a1 dataSet];
}

id objc_msgSend_dataTypes(void *a1, const char *a2, ...)
{
  return [a1 dataTypes];
}

id objc_msgSend_datasetAbStatus(void *a1, const char *a2, ...)
{
  return [a1 datasetAbStatus];
}

id objc_msgSend_datasetId(void *a1, const char *a2, ...)
{
  return [a1 datasetId];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultTag(void *a1, const char *a2, ...)
{
  return [a1 defaultTag];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_defaultXPCServerConnectionQueue(void *a1, const char *a2, ...)
{
  return [a1 defaultXPCServerConnectionQueue];
}

id objc_msgSend_deleteAllDBFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteAllDBFiles];
}

id objc_msgSend_deletePhoneNumberMapping(void *a1, const char *a2, ...)
{
  return [a1 deletePhoneNumberMapping];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_directionsDetail(void *a1, const char *a2, ...)
{
  return [a1 directionsDetail];
}

id objc_msgSend_directionsRequest(void *a1, const char *a2, ...)
{
  return [a1 directionsRequest];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
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

id objc_msgSend_downloadMode(void *a1, const char *a2, ...)
{
  return [a1 downloadMode];
}

id objc_msgSend_downloadOptions(void *a1, const char *a2, ...)
{
  return [a1 downloadOptions];
}

id objc_msgSend_dropAllTables(void *a1, const char *a2, ...)
{
  return [a1 dropAllTables];
}

id objc_msgSend_enableCDSObserversIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 enableCDSObserversIfNecessary];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_entityComponent(void *a1, const char *a2, ...)
{
  return [a1 entityComponent];
}

id objc_msgSend_entityTag(void *a1, const char *a2, ...)
{
  return [a1 entityTag];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_evictAllEntries(void *a1, const char *a2, ...)
{
  return [a1 evictAllEntries];
}

id objc_msgSend_experimentsInfo(void *a1, const char *a2, ...)
{
  return [a1 experimentsInfo];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_expireOSVersion(void *a1, const char *a2, ...)
{
  return [a1 expireOSVersion];
}

id objc_msgSend_expireTime(void *a1, const char *a2, ...)
{
  return [a1 expireTime];
}

id objc_msgSend_explicitResources(void *a1, const char *a2, ...)
{
  return [a1 explicitResources];
}

id objc_msgSend_extras(void *a1, const char *a2, ...)
{
  return [a1 extras];
}

id objc_msgSend_failAllRemainingRequests(void *a1, const char *a2, ...)
{
  return [a1 failAllRemainingRequests];
}

id objc_msgSend_failedPlaceData(void *a1, const char *a2, ...)
{
  return [a1 failedPlaceData];
}

id objc_msgSend_fetchExpired(void *a1, const char *a2, ...)
{
  return [a1 fetchExpired];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return [a1 filter];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstSeenTimestamp(void *a1, const char *a2, ...)
{
  return [a1 firstSeenTimestamp];
}

id objc_msgSend_flushToPowerLog(void *a1, const char *a2, ...)
{
  return [a1 flushToPowerLog];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return [a1 force];
}

id objc_msgSend_forceUpdate(void *a1, const char *a2, ...)
{
  return [a1 forceUpdate];
}

id objc_msgSend_freeBytes(void *a1, const char *a2, ...)
{
  return [a1 freeBytes];
}

id objc_msgSend_fromPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 fromPairedDevice];
}

id objc_msgSend_getAllExpiringKeys(void *a1, const char *a2, ...)
{
  return [a1 getAllExpiringKeys];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_handleData(void *a1, const char *a2, ...)
{
  return [a1 handleData];
}

id objc_msgSend_hasBasemapId(void *a1, const char *a2, ...)
{
  return [a1 hasBasemapId];
}

id objc_msgSend_hasBranchExpirationTtlHours(void *a1, const char *a2, ...)
{
  return [a1 hasBranchExpirationTtlHours];
}

id objc_msgSend_hasDatasetId(void *a1, const char *a2, ...)
{
  return [a1 hasDatasetId];
}

id objc_msgSend_hasEvInfo(void *a1, const char *a2, ...)
{
  return [a1 hasEvInfo];
}

id objc_msgSend_hasFiredCallHistoryRecentsClearedNotification(void *a1, const char *a2, ...)
{
  return [a1 hasFiredCallHistoryRecentsClearedNotification];
}

id objc_msgSend_hasFiredResetPrivacyWarningsNotification(void *a1, const char *a2, ...)
{
  return [a1 hasFiredResetPrivacyWarningsNotification];
}

id objc_msgSend_hasIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasIdentifier];
}

id objc_msgSend_hasMainTransportType(void *a1, const char *a2, ...)
{
  return [a1 hasMainTransportType];
}

id objc_msgSend_hasMuid(void *a1, const char *a2, ...)
{
  return [a1 hasMuid];
}

id objc_msgSend_hasRefreshIntervalSeconds(void *a1, const char *a2, ...)
{
  return [a1 hasRefreshIntervalSeconds];
}

id objc_msgSend_hasTelephone(void *a1, const char *a2, ...)
{
  return [a1 hasTelephone];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_identifiersFilter(void *a1, const char *a2, ...)
{
  return [a1 identifiersFilter];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageId(void *a1, const char *a2, ...)
{
  return [a1 imageId];
}

id objc_msgSend_imageIds(void *a1, const char *a2, ...)
{
  return [a1 imageIds];
}

id objc_msgSend_images(void *a1, const char *a2, ...)
{
  return [a1 images];
}

id objc_msgSend_includeToken(void *a1, const char *a2, ...)
{
  return [a1 includeToken];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_initInternal(void *a1, const char *a2, ...)
{
  return [a1 initInternal];
}

id objc_msgSend_initPrimaryDaemon(void *a1, const char *a2, ...)
{
  return [a1 initPrimaryDaemon];
}

id objc_msgSend_initializeAndStartPairedDeviceConnectionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 initializeAndStartPairedDeviceConnectionIfNecessary];
}

id objc_msgSend_installedResources(void *a1, const char *a2, ...)
{
  return [a1 installedResources];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_isAvailableForUse(void *a1, const char *a2, ...)
{
  return [a1 isAvailableForUse];
}

id objc_msgSend_isCacheable(void *a1, const char *a2, ...)
{
  return [a1 isCacheable];
}

id objc_msgSend_isDefaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 isDefaultConfiguration];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return [a1 isExpired];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLocationShiftEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLocationShiftEnabled];
}

id objc_msgSend_isLocationd(void *a1, const char *a2, ...)
{
  return [a1 isLocationd];
}

id objc_msgSend_isNetworkConstrained(void *a1, const char *a2, ...)
{
  return [a1 isNetworkConstrained];
}

id objc_msgSend_isOnDisk(void *a1, const char *a2, ...)
{
  return [a1 isOnDisk];
}

id objc_msgSend_isolationQueue(void *a1, const char *a2, ...)
{
  return [a1 isolationQueue];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyOptions(void *a1, const char *a2, ...)
{
  return [a1 keyOptions];
}

id objc_msgSend_keyString(void *a1, const char *a2, ...)
{
  return [a1 keyString];
}

id objc_msgSend_keyStrings(void *a1, const char *a2, ...)
{
  return [a1 keyStrings];
}

id objc_msgSend_keyStringsAndValues(void *a1, const char *a2, ...)
{
  return [a1 keyStringsAndValues];
}

id objc_msgSend_keyValue(void *a1, const char *a2, ...)
{
  return [a1 keyValue];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_keysAndSources(void *a1, const char *a2, ...)
{
  return [a1 keysAndSources];
}

id objc_msgSend_lastAccessedTime(void *a1, const char *a2, ...)
{
  return [a1 lastAccessedTime];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdatedDate];
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return [a1 latLng];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locationShiftEnabledRegions(void *a1, const char *a2, ...)
{
  return [a1 locationShiftEnabledRegions];
}

id objc_msgSend_locationShiftFunctionVersion(void *a1, const char *a2, ...)
{
  return [a1 locationShiftFunctionVersion];
}

id objc_msgSend_locationShiftVersion(void *a1, const char *a2, ...)
{
  return [a1 locationShiftVersion];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_maResourcesFolder(void *a1, const char *a2, ...)
{
  return [a1 maResourcesFolder];
}

id objc_msgSend_mainTransportType(void *a1, const char *a2, ...)
{
  return [a1 mainTransportType];
}

id objc_msgSend_manifestConfiguration(void *a1, const char *a2, ...)
{
  return [a1 manifestConfiguration];
}

id objc_msgSend_mapsAbClientMetadata(void *a1, const char *a2, ...)
{
  return [a1 mapsAbClientMetadata];
}

id objc_msgSend_mapsId(void *a1, const char *a2, ...)
{
  return [a1 mapsId];
}

id objc_msgSend_mapsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mapsIdentifier];
}

id objc_msgSend_minTTL(void *a1, const char *a2, ...)
{
  return [a1 minTTL];
}

id objc_msgSend_minimumUregency(void *a1, const char *a2, ...)
{
  return [a1 minimumUregency];
}

id objc_msgSend_minimumUrgency(void *a1, const char *a2, ...)
{
  return [a1 minimumUrgency];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modernLoader(void *a1, const char *a2, ...)
{
  return [a1 modernLoader];
}

id objc_msgSend_modernManager(void *a1, const char *a2, ...)
{
  return [a1 modernManager];
}

id objc_msgSend_muid(void *a1, const char *a2, ...)
{
  return [a1 muid];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newXPCData(void *a1, const char *a2, ...)
{
  return [a1 newXPCData];
}

id objc_msgSend_nextSafeRequestTime(void *a1, const char *a2, ...)
{
  return [a1 nextSafeRequestTime];
}

id objc_msgSend_nilPlace(void *a1, const char *a2, ...)
{
  return [a1 nilPlace];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nsURL(void *a1, const char *a2, ...)
{
  return [a1 nsURL];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offlineCohortId(void *a1, const char *a2, ...)
{
  return [a1 offlineCohortId];
}

id objc_msgSend_onPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 onPairedDevice];
}

id objc_msgSend_openServerConnection(void *a1, const char *a2, ...)
{
  return [a1 openServerConnection];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_osAndBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 osAndBuildVersion];
}

id objc_msgSend_pairedDeviceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceIdentifiers];
}

id objc_msgSend_parametersCount(void *a1, const char *a2, ...)
{
  return [a1 parametersCount];
}

id objc_msgSend_parsecClientMetadata(void *a1, const char *a2, ...)
{
  return [a1 parsecClientMetadata];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pdPlaceCache(void *a1, const char *a2, ...)
{
  return [a1 pdPlaceCache];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return [a1 peerID];
}

id objc_msgSend_peers(void *a1, const char *a2, ...)
{
  return [a1 peers];
}

id objc_msgSend_performOpportunisticResourceLoading(void *a1, const char *a2, ...)
{
  return [a1 performOpportunisticResourceLoading];
}

id objc_msgSend_periodicCleanupAndAccessTimeUpdate(void *a1, const char *a2, ...)
{
  return [a1 periodicCleanupAndAccessTimeUpdate];
}

id objc_msgSend_persistentCache(void *a1, const char *a2, ...)
{
  return [a1 persistentCache];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_ping(void *a1, const char *a2, ...)
{
  return [a1 ping];
}

id objc_msgSend_place(void *a1, const char *a2, ...)
{
  return [a1 place];
}

id objc_msgSend_placeRequestParameters(void *a1, const char *a2, ...)
{
  return [a1 placeRequestParameters];
}

id objc_msgSend_placeSearchResponsesCount(void *a1, const char *a2, ...)
{
  return [a1 placeSearchResponsesCount];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_preferredAuditToken(void *a1, const char *a2, ...)
{
  return [a1 preferredAuditToken];
}

id objc_msgSend_preloading(void *a1, const char *a2, ...)
{
  return [a1 preloading];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return [a1 proxy];
}

id objc_msgSend_pruneDiskCache(void *a1, const char *a2, ...)
{
  return [a1 pruneDiskCache];
}

id objc_msgSend_pruneShiftEntries(void *a1, const char *a2, ...)
{
  return [a1 pruneShiftEntries];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_rapClientMetadata(void *a1, const char *a2, ...)
{
  return [a1 rapClientMetadata];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_receivedData(void *a1, const char *a2, ...)
{
  return [a1 receivedData];
}

id objc_msgSend_recvBytes(void *a1, const char *a2, ...)
{
  return [a1 recvBytes];
}

id objc_msgSend_refreshIntervalSeconds(void *a1, const char *a2, ...)
{
  return [a1 refreshIntervalSeconds];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_registerCleanupTasks(void *a1, const char *a2, ...)
{
  return [a1 registerCleanupTasks];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllShiftEntries(void *a1, const char *a2, ...)
{
  return [a1 removeAllShiftEntries];
}

id objc_msgSend_removeAllShiftEntriesSync(void *a1, const char *a2, ...)
{
  return [a1 removeAllShiftEntriesSync];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestData(void *a1, const char *a2, ...)
{
  return [a1 requestData];
}

id objc_msgSend_requestKind(void *a1, const char *a2, ...)
{
  return [a1 requestKind];
}

id objc_msgSend_requestKindRaw(void *a1, const char *a2, ...)
{
  return [a1 requestKindRaw];
}

id objc_msgSend_requestKindSubtype(void *a1, const char *a2, ...)
{
  return [a1 requestKindSubtype];
}

id objc_msgSend_requestKindType(void *a1, const char *a2, ...)
{
  return [a1 requestKindType];
}

id objc_msgSend_requestMetadata(void *a1, const char *a2, ...)
{
  return [a1 requestMetadata];
}

id objc_msgSend_requestSubtype(void *a1, const char *a2, ...)
{
  return [a1 requestSubtype];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_requestUUID(void *a1, const char *a2, ...)
{
  return [a1 requestUUID];
}

id objc_msgSend_requestedComponents(void *a1, const char *a2, ...)
{
  return [a1 requestedComponents];
}

id objc_msgSend_reroutedRoutesCount(void *a1, const char *a2, ...)
{
  return [a1 reroutedRoutesCount];
}

id objc_msgSend_resetActiveTileGroup(void *a1, const char *a2, ...)
{
  return [a1 resetActiveTileGroup];
}

id objc_msgSend_resourceInfo(void *a1, const char *a2, ...)
{
  return [a1 resourceInfo];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return [a1 resources];
}

id objc_msgSend_resourcesProxyURL(void *a1, const char *a2, ...)
{
  return [a1 resourcesProxyURL];
}

id objc_msgSend_resourcesURL(void *a1, const char *a2, ...)
{
  return [a1 resourcesURL];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultProvider(void *a1, const char *a2, ...)
{
  return [a1 resultProvider];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_routeAttributes(void *a1, const char *a2, ...)
{
  return [a1 routeAttributes];
}

id objc_msgSend_routes(void *a1, const char *a2, ...)
{
  return [a1 routes];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_savedState(void *a1, const char *a2, ...)
{
  return [a1 savedState];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scenario(void *a1, const char *a2, ...)
{
  return [a1 scenario];
}

id objc_msgSend_scheduleCleanup(void *a1, const char *a2, ...)
{
  return [a1 scheduleCleanup];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_sendInitialUpdate(void *a1, const char *a2, ...)
{
  return [a1 sendInitialUpdate];
}

id objc_msgSend_serializedState(void *a1, const char *a2, ...)
{
  return [a1 serializedState];
}

id objc_msgSend_serializedSummary(void *a1, const char *a2, ...)
{
  return [a1 serializedSummary];
}

id objc_msgSend_serverProxy(void *a1, const char *a2, ...)
{
  return [a1 serverProxy];
}

id objc_msgSend_serverQueue(void *a1, const char *a2, ...)
{
  return [a1 serverQueue];
}

id objc_msgSend_serviceRequester(void *a1, const char *a2, ...)
{
  return [a1 serviceRequester];
}

id objc_msgSend_serviceTagsCount(void *a1, const char *a2, ...)
{
  return [a1 serviceTagsCount];
}

id objc_msgSend_serviceVersions(void *a1, const char *a2, ...)
{
  return [a1 serviceVersions];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setSubscriptionStateSummary(void *a1, const char *a2, ...)
{
  return [a1 setSubscriptionStateSummary];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_shardedId(void *a1, const char *a2, ...)
{
  return [a1 shardedId];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedAuthHelper(void *a1, const char *a2, ...)
{
  return [a1 sharedAuthHelper];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedCounter(void *a1, const char *a2, ...)
{
  return [a1 sharedCounter];
}

id objc_msgSend_sharedDataURLSession(void *a1, const char *a2, ...)
{
  return [a1 sharedDataURLSession];
}

id objc_msgSend_sharedDelegateQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedDelegateQueue];
}

id objc_msgSend_sharedHelper(void *a1, const char *a2, ...)
{
  return [a1 sharedHelper];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedNetworkDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkDefaults];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_sharedRequester(void *a1, const char *a2, ...)
{
  return [a1 sharedRequester];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedThrottler(void *a1, const char *a2, ...)
{
  return [a1 sharedThrottler];
}

id objc_msgSend_sharedUpdater(void *a1, const char *a2, ...)
{
  return [a1 sharedUpdater];
}

id objc_msgSend_shouldConsiderCaching(void *a1, const char *a2, ...)
{
  return [a1 shouldConsiderCaching];
}

id objc_msgSend_shouldSync(void *a1, const char *a2, ...)
{
  return [a1 shouldSync];
}

id objc_msgSend_shouldSyncToPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldSyncToPairedDevice];
}

id objc_msgSend_siriClientMetadata(void *a1, const char *a2, ...)
{
  return [a1 siriClientMetadata];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return [a1 sourceURL];
}

id objc_msgSend_sqliteDB(void *a1, const char *a2, ...)
{
  return [a1 sqliteDB];
}

id objc_msgSend_standardConfig(void *a1, const char *a2, ...)
{
  return [a1 standardConfig];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_submitBGSTQueue(void *a1, const char *a2, ...)
{
  return [a1 submitBGSTQueue];
}

id objc_msgSend_submitBackgroundTasksNeededDuringDaemonStart(void *a1, const char *a2, ...)
{
  return [a1 submitBackgroundTasksNeededDuringDaemonStart];
}

id objc_msgSend_subscribe(void *a1, const char *a2, ...)
{
  return [a1 subscribe];
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return [a1 sync];
}

id objc_msgSend_targetSize(void *a1, const char *a2, ...)
{
  return [a1 targetSize];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_telephone(void *a1, const char *a2, ...)
{
  return [a1 telephone];
}

id objc_msgSend_throttleToken(void *a1, const char *a2, ...)
{
  return [a1 throttleToken];
}

id objc_msgSend_throttlerToken(void *a1, const char *a2, ...)
{
  return [a1 throttlerToken];
}

id objc_msgSend_tileCache(void *a1, const char *a2, ...)
{
  return [a1 tileCache];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeToLive(void *a1, const char *a2, ...)
{
  return [a1 timeToLive];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unpack(void *a1, const char *a2, ...)
{
  return [a1 unpack];
}

id objc_msgSend_unpackLatLngVertices(void *a1, const char *a2, ...)
{
  return [a1 unpackLatLngVertices];
}

id objc_msgSend_unpackedLatLngVertices(void *a1, const char *a2, ...)
{
  return [a1 unpackedLatLngVertices];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateLastAccessedTime(void *a1, const char *a2, ...)
{
  return [a1 updateLastAccessedTime];
}

id objc_msgSend_updateSubscriptionState(void *a1, const char *a2, ...)
{
  return [a1 updateSubscriptionState];
}

id objc_msgSend_updatedRequest(void *a1, const char *a2, ...)
{
  return [a1 updatedRequest];
}

id objc_msgSend_urgency(void *a1, const char *a2, ...)
{
  return [a1 urgency];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlInfoSet(void *a1, const char *a2, ...)
{
  return [a1 urlInfoSet];
}

id objc_msgSend_useBackgroundURL(void *a1, const char *a2, ...)
{
  return [a1 useBackgroundURL];
}

id objc_msgSend_useLocalLoader(void *a1, const char *a2, ...)
{
  return [a1 useLocalLoader];
}

id objc_msgSend_useLocalProxy(void *a1, const char *a2, ...)
{
  return [a1 useLocalProxy];
}

id objc_msgSend_usedInterface(void *a1, const char *a2, ...)
{
  return [a1 usedInterface];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vehicleSpecifications(void *a1, const char *a2, ...)
{
  return [a1 vehicleSpecifications];
}

id objc_msgSend_versionManifest(void *a1, const char *a2, ...)
{
  return [a1 versionManifest];
}

id objc_msgSend_whichFilter(void *a1, const char *a2, ...)
{
  return [a1 whichFilter];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_xmitBytes(void *a1, const char *a2, ...)
{
  return [a1 xmitBytes];
}

id objc_msgSend_xpcUuid(void *a1, const char *a2, ...)
{
  return [a1 xpcUuid];
}