id sub_100005CD0(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  double v32;
  CLLocationDegrees v33;
  double v34;
  CLLocationDegrees v35;
  double v36;
  CLLocationDistance v37;
  double v38;
  CLLocationDistance v39;
  void *v40;
  uint64_t v42;
  id v43;
  uint64_t vars8;
  CLLocationCoordinate2D v45;
  MKMapRect v46;
  MKMapRect v47;
  MKCoordinateRegion v48;

  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    v7 = (void *)v6;
    v8 = objc_alloc((Class)MKMapView);
    [*(id *)(a1 + 32) bounds];
    v9 = objc_msgSend(v8, "initWithFrame:");
    [v9 setShowsAttribution:1];
    [v9 _setShowsAppleLogo:0];
    [v9 setAutoresizingMask:18];
    v10 = objc_alloc_init((Class)MKPointAnnotation);
    if (v7)
    {
      if (!v5)
      {
        [v7 coordinate];
        v13 = [objc_alloc((Class)CLLocation) initWithLatitude:v11 longitude:v12];
        v14 = objc_alloc((Class)CLCircularRegion);
        [v13 coordinate];
        v15 = objc_msgSend(v14, "initWithCenter:radius:identifier:", @"DDInternalConversion");
        v5 = (unint64_t)[objc_alloc((Class)CLPlacemark) initWithLocation:v13 addressDictionary:0 region:v15 areasOfInterest:0];
      }
    }
    else
    {
      v7 = [(id)v5 _geoMapItem];
    }
    v17 = [(id)v5 location];
    [v17 coordinate];
    objc_msgSend(v10, "setCoordinate:");

    [v9 addAnnotation:v10];
    if (v7)
    {
      v18 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v7 isPlaceHolderPlace:0];
      if (v18)
      {
        [*(id *)(a1 + 32) bounds];
        v21 = +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v18, 1, v19, v20);
        if (v21)
        {
          v22 = v21;
          [v21 centerCoordinateDistance];
          [v22 setCenterCoordinateDistance:v23 * 3.0];
          [v9 setCamera:v22 animated:0];
LABEL_26:

          [*(id *)(a1 + 32) addSubview:v9];
          [*(id *)(a1 + 40) removeFromSuperview];

          goto LABEL_27;
        }
      }
    }
    else
    {
      v18 = 0;
    }
    v22 = [v7 displayMapRegion];
    if (v22)
    {
      GEOMapRectForMapRegion();
      v47 = MKMapRectInset(v46, v46.size.width * -3.0, v46.size.height * -3.0);
      objc_msgSend(v9, "setVisibleMapRect:animated:", 0, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
    }
    else
    {
      v25 = (id)v5;
      v26 = [v25 region];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = v26;
      }
      else
      {
        v43 = v25;
        v28 = [v25 location];
        [v28 horizontalAccuracy];
        if (v29 >= 0.0) {
          [v28 horizontalAccuracy];
        }
        [v28 verticalAccuracy];
        if (v30 >= 0.0) {
          [v28 verticalAccuracy];
        }
        v31 = objc_alloc((Class)CLCircularRegion);
        [v28 coordinate];
        v27 = objc_msgSend(v31, "initWithCenter:radius:identifier:", @"DDInternalConversion");

        v25 = v43;
      }

      [v27 center];
      v33 = v32;
      v35 = v34;
      [v27 radius];
      v37 = v36 * 6.0;
      [v27 radius];
      v39 = v38 * 6.0;
      v45.latitude = v33;
      v45.longitude = v35;
      v48 = MKCoordinateRegionMakeWithDistance(v45, v37, v39);
      objc_msgSend(v9, "setRegion:animated:", 0, v48.center.latitude, v48.center.longitude, v48.span.latitudeDelta, v48.span.longitudeDelta);
    }
    goto LABEL_26;
  }
  if (*(unsigned char *)(a1 + 64) || ![*(id *)(a1 + 48) length])
  {
    v16 = DDLocalizedString();
  }
  else
  {
    v16 = DDLocalizedString();
    v42 = *(void *)(a1 + 48);
  }
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v42);
  [*(id *)(a1 + 40) setText:v24];

  objc_msgSend(*(id *)(a1 + 40), "setNumberOfLines:", (char *)objc_msgSend(*(id *)(a1 + 40), "numberOfLines") + 1);
LABEL_27:
  v40 = *(void **)(a1 + 56);
  return [v40 invalidate];
}

void sub_100006144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: geocoderHandler error '%@'", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = [v5 firstObject];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100006274(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: RECEIVED user loc", buf, 2u);
    }
    [v5 verticalAccuracy];
    if (v8 >= 0.0)
    {
      [v5 horizontalAccuracy];
      if (v9 >= 0.0)
      {
        [v5 coordinate];
        id v12 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v10, v11);
        [*(id *)(a1 + 32) setDeviceLocation:v12];
      }
    }
  }
  else if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: NOT RECEIVED user loc", buf, 2u);
  }
  if ((unint64_t)[*(id *)(a1 + 40) length] >= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 32) displayRegion];
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: Updating Locale from %@ to %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setDisplayRegion:*(void *)(a1 + 40)];
  }
  v15 = [*(id *)(a1 + 48) ticketForForwardGeocodeString:*(void *)(a1 + 56) maxResults:1 traits:*(void *)(a1 + 32)];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000064E8;
  v16[3] = &unk_10000C460;
  id v17 = *(id *)(a1 + 64);
  [v15 submitWithRefinedHandler:v16 networkActivity:0];
}

void sub_1000064E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000065E0;
  v14[3] = &unk_10000C438;
  id v15 = v7;
  id v16 = v8;
  id v10 = *(id *)(a1 + 32);
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

void sub_1000065E0(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) count] || (v2 = (id *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "count"))) {
    id v3 = *v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_100006664(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 firstObject];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void sub_1000069FC(uint64_t a1)
{
  +[CLLocationManager setDefaultEffectiveBundleIdentifier:@"com.apple.Maps"];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006AC4;
  v4[3] = &unk_10000C4D8;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 createViewControllerWithCompletionHandler:v4];
}

void sub_100006AC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006BB0;
    block[3] = &unk_10000C4B0;
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(0.0, 0.0);
  }
}

uint64_t sub_100006BB0(uint64_t a1)
{
  [*(id *)(a1 + 32) addViewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) preferredContentSize];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v3(v2, 1);
}

void sub_1000070D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000071AC;
    block[3] = &unk_10000C4B0;
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_1000071AC(void *a1)
{
  [*(id *)(a1[4] + 8) setFlights:a1[5]];
  uint64_t v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

uint64_t sub_100007670(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007680(uint64_t a1)
{
}

void sub_100007688(void *a1, void *a2)
{
  id v74 = a1;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = a2;
  id v3 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v84;
    uint64_t v6 = DDBinderContactKey;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v84 != v5) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v83 + 1) + 8 * v7);
      id v9 = [v8 type];
      unsigned int v10 = [v9 isEqualToString:v6];

      if (v10) {
        break;
      }
      if (v4 == (id)++v7)
      {
        id v4 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
        if (!v4) {
          goto LABEL_65;
        }
        goto LABEL_3;
      }
    }
    id v11 = [v74 givenName];
    if ([v11 length])
    {
      BOOL v71 = 0;
    }
    else
    {
      id v12 = [v74 familyName];
      if ([v12 length])
      {
        BOOL v71 = 0;
      }
      else
      {
        id v13 = [v74 nickname];
        BOOL v71 = [v13 length] == 0;
      }
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v70 = [v8 subResults];
    id v14 = [v70 countByEnumeratingWithState:&v79 objects:v88 count:16];
    id v15 = v74;
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v80;
      uint64_t v68 = DDBinderJobTitleKey;
      uint64_t v69 = DDBinderCompanyNameKey;
      uint64_t v66 = DDBinderContactNameKey;
      uint64_t v67 = *(void *)v80;
      do
      {
        id v18 = 0;
        id v63 = v16;
        do
        {
          if (*(void *)v80 != v17) {
            objc_enumerationMutation(v70);
          }
          v19 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v18);
          __int16 v20 = [v19 type];
          uint64_t v21 = [v15 organizationName];
          if ([v21 length])
          {
            v22 = v20;
          }
          else
          {
            v22 = v20;
            unsigned int v23 = [v20 isEqualToString:v69];

            if (v23)
            {
              id v24 = [v19 matchedString];
              [v15 setOrganizationName:v24];
LABEL_33:
              v29 = v22;
              goto LABEL_61;
            }
          }
          v25 = [v15 departmentName];
          if ([v25 length])
          {
          }
          else
          {
            unsigned int v26 = [v22 isEqualToString:@"DepartmentName"];

            if (v26)
            {
              id v24 = [v19 matchedString];
              [v15 setDepartmentName:v24];
              goto LABEL_33;
            }
          }
          v27 = [v15 jobTitle];
          if ([v27 length])
          {
          }
          else
          {
            unsigned int v28 = [v22 isEqualToString:v68];

            if (v28)
            {
              id v24 = [v19 matchedString];
              [v15 setJobTitle:v24];
              goto LABEL_33;
            }
          }
          v29 = v22;
          if (!v71) {
            goto LABEL_62;
          }
          if ([v22 isEqualToString:@"NLPContactName"])
          {
            id v24 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
            v30 = [v19 matchedString];
            v31 = [v24 personNameComponentsFromString:v30];

            v32 = [v31 givenName];
            +[NSLocale currentLocale];
            v34 = v33 = v18;
            v35 = [v32 capitalizedStringWithLocale:v34];
            [v74 setGivenName:v35];

            v36 = [v31 middleName];
            [v74 setMiddleName:v36];

            v37 = [v31 familyName];
            id v15 = v74;
            v38 = +[NSLocale currentLocale];
            v39 = [v37 capitalizedStringWithLocale:v38];
            [v74 setFamilyName:v39];

            uint64_t v17 = v67;
            id v18 = v33;

            v40 = [v31 namePrefix];
            [v74 setNamePrefix:v40];

            v41 = [v31 nameSuffix];
            [v74 setNameSuffix:v41];

            goto LABEL_61;
          }
          if (![v22 isEqualToString:v66]) {
            goto LABEL_62;
          }
          v65 = v18;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v24 = [v19 subResults];
          id v42 = [v24 countByEnumeratingWithState:&v75 objects:v87 count:16];
          if (!v42) {
            goto LABEL_61;
          }
          id v43 = v42;
          v64 = v22;
          uint64_t v44 = *(void *)v76;
          v45 = &CFRelease_ptr;
          do
          {
            v46 = 0;
            do
            {
              if (*(void *)v76 != v44) {
                objc_enumerationMutation(v24);
              }
              v47 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v46);
              v48 = [v47 type];
              v49 = [v47 matchedString];
              if ([v48 isEqualToString:@"FirstName"])
              {
                v50 = [v45[110] currentLocale];
                v51 = [v49 capitalizedStringWithLocale:v50];
                [v74 setGivenName:v51];
LABEL_45:

                goto LABEL_48;
              }
              if ([v48 isEqualToString:@"MiddleName"])
              {
                [v74 setMiddleName:v49];
              }
              else
              {
                if ([v48 isEqualToString:@"LastName"])
                {
                  v50 = [v45[110] currentLocale];
                  v51 = [v49 capitalizedStringWithLocale:v50];
                  [v74 setFamilyName:v51];
                  goto LABEL_45;
                }
                if ([v48 isEqualToString:@"Title"])
                {
                  [v74 setNamePrefix:v49];
                }
                else if ([v48 isEqualToString:@"NameSuffix"])
                {
                  [v74 setNameSuffix:v49];
                }
                else if (([v48 isEqualToString:@"AddressBookContactName"] & 1) != 0 {
                       || [v48 isEqualToString:@"NLPContactName"])
                }
                {
                  id v72 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
                  v73 = [v72 personNameComponentsFromString:v49];
                  v52 = [v73 givenName];
                  v53 = +[NSLocale currentLocale];
                  v54 = [v52 capitalizedStringWithLocale:v53];
                  [v74 setGivenName:v54];

                  v55 = [v73 middleName];
                  [v74 setMiddleName:v55];

                  v56 = [v73 familyName];
                  v57 = +[NSLocale currentLocale];
                  v58 = [v56 capitalizedStringWithLocale:v57];
                  [v74 setFamilyName:v58];

                  v59 = [v73 namePrefix];
                  [v74 setNamePrefix:v59];

                  v60 = [v73 nameSuffix];
                  [v74 setNameSuffix:v60];

                  v45 = &CFRelease_ptr;
                }
              }
LABEL_48:

              v46 = (char *)v46 + 1;
            }
            while (v43 != v46);
            id v61 = [v24 countByEnumeratingWithState:&v75 objects:v87 count:16];
            id v43 = v61;
          }
          while (v61);
          id v16 = v63;
          v29 = v64;
          uint64_t v17 = v67;
          id v18 = v65;
          id v15 = v74;
LABEL_61:

LABEL_62:
          id v18 = (char *)v18 + 1;
        }
        while (v18 != v16);
        id v16 = [v70 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v16);
    }
  }
LABEL_65:
}

id sub_100007EF8(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  v49 = a4;
  unint64_t v65 = a2;
  id v50 = a3;
  v51 = +[NSMutableArray array];
  v56 = +[NSMutableArray array];
  v57 = +[NSMutableArray array];
  v54 = +[NSMutableArray array];
  v52 = +[NSMutableArray array];
  v53 = +[NSMutableArray array];
  v55 = +[NSMutableArray array];
  v59 = +[NSSet setWithArray:&off_10000CA58];
  if (a1 | v65)
  {
    uint64_t v6 = +[NSMutableArray array];
    if (a1)
    {
      CFStringRef Type = (const __CFString *)DDResultGetType();
      if (CFStringCompare(Type, DDBinderSignatureBlockKey, 0))
      {
        [v6 addObject:a1];
        if (v50)
        {
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v8 = v50;
          id v9 = [v8 countByEnumeratingWithState:&v88 objects:v96 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v89;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v89 != v10) {
                  objc_enumerationMutation(v8);
                }
                objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v88 + 1) + 8 * i), "coreResult", v49));
              }
              id v9 = [v8 countByEnumeratingWithState:&v88 objects:v96 count:16];
            }
            while (v9);
          }
        }
      }
      else
      {
        [v6 addObjectsFromArray:DDResultGetSubResults()];
      }
    }
    if (v65) {
      [v6 addObject:v65];
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v6;
    id v63 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
    if (v63)
    {
      id v60 = *(id *)v85;
      do
      {
        id v12 = 0;
        do
        {
          if (*(id *)v85 != v60) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v12);
          if (v13 == (void *)v65) {
            goto LABEL_26;
          }
          int Category = DDResultGetCategory();
          if ((Category - 1) >= 2)
          {
            if (Category != 3) {
              goto LABEL_47;
            }
            id v19 = objc_alloc_init((Class)CNMutablePostalAddress);
            DDResultGetSubresultWithType();
            [v19 setStreet:DDResultGetMatchedString()];
            v27 = [v19 street];
            BOOL v28 = v27 == 0;

            if (v28)
            {
              DDResultGetSubresultWithType();
              [v19 setStreet:DDResultGetMatchedString()];
            }
            DDResultGetSubresultWithType();
            [v19 setCity:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setState:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setPostalCode:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setCountry:DDResultGetMatchedString()];
            [v19 setISOCountryCode:DDResultGetCountryCode()];
            [v54 addObject:v19];
            id v29 = [objc_alloc((Class)CNLabeledValue) initWithLabel:0 value:v19];
            [v55 addObject:v29];

            goto LABEL_46;
          }
          if (!v13)
          {
LABEL_26:
            char v18 = 1;
          }
          else
          {
            id v15 = (void *)DDResultCopyExtractedURLWithOptions();
            if (v15)
            {
              id v16 = v15;
              char v17 = 0;
              char v18 = 0;
              id v19 = v16;
              goto LABEL_29;
            }
            char v18 = 0;
          }
          objc_msgSend((id)v65, "absoluteString", v49);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          id v16 = 0;
          if (v19)
          {
            char v17 = 1;
LABEL_29:
            CFTypeRef cf = 0;
            __int16 v20 = +[NSURL URLWithString:](NSURL, "URLWithString:", v19, v49);
            uint64_t v21 = objc_msgSend(v20, "dd_emailFromValidSchemes:", v59);
            v22 = objc_msgSend(v21, "dd_userFriendlyEmail");

            if (v22 && ([v57 containsObject:v22] & 1) == 0)
            {
              [v57 addObject:v22];
              if ((v18 & 1) == 0) {
                DDResultCopyMailValue();
              }
              id v23 = [objc_alloc((Class)CNLabeledValue) initWithLabel:cf value:v22];
              [v53 addObject:v23];
            }
            id v24 = objc_msgSend(v20, "dd_phoneNumberFromValidSchemes:", v59);
            if (v24 && ([v56 containsObject:v24] & 1) == 0)
            {
              [v56 addObject:v24];
              id v25 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v24];
              [v51 addObject:v25];
              if ((v18 & 1) == 0) {
                DDResultCopyPhoneValue();
              }
              id v26 = [objc_alloc((Class)CNLabeledValue) initWithLabel:cf value:v25];
              [v52 addObject:v26];
            }
            if ((v17 & 1) == 0) {
              CFRelease(v16);
            }
            goto LABEL_46;
          }
          id v19 = 0;
LABEL_46:

LABEL_47:
          id v12 = (char *)v12 + 1;
        }
        while (v63 != v12);
        id v30 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
        id v63 = v30;
      }
      while (v30);
    }
  }
  CFTypeRef cf = 0;
  p_CFTypeRef cf = &cf;
  uint64_t v80 = 0x3032000000;
  long long v81 = sub_100007670;
  long long v82 = sub_100007680;
  id v83 = 0;
  if ((dd_isDeviceLocked() & 1) == 0
    && (id)+[CNContactStore authorizationStatusForEntityType:0] == (id)3)
  {
    id v64 = objc_alloc_init((Class)CNContactStore);
    id v31 = objc_alloc((Class)CNContactFetchRequest);
    v32 = +[CNContactContentViewController descriptorForRequiredKeys];
    v94 = v32;
    v33 = +[NSArray arrayWithObjects:&v94 count:1];
    id v34 = [v31 initWithKeysToFetch:v33];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v61 = v51;
    id v35 = [v61 countByEnumeratingWithState:&v74 objects:v93 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v75;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v75 != v36) {
            objc_enumerationMutation(v61);
          }
          v38 = +[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", *(void *)(*((void *)&v74 + 1) + 8 * (void)j), v49);
          [v34 setPredicate:v38];

          v72[4] = &cf;
          uint64_t v73 = 0;
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_1000089C0;
          v72[3] = &unk_10000C528;
          [v64 enumerateContactsWithFetchRequest:v34 error:&v73 usingBlock:v72];
        }
        id v35 = [v61 countByEnumeratingWithState:&v74 objects:v93 count:16];
      }
      while (v35);
    }

    if (!p_cf[5])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v62 = v57;
      id v39 = [v62 countByEnumeratingWithState:&v68 objects:v92 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v69;
        do
        {
          for (k = 0; k != v39; k = (char *)k + 1)
          {
            if (*(void *)v69 != v40) {
              objc_enumerationMutation(v62);
            }
            id v42 = +[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", *(void *)(*((void *)&v68 + 1) + 8 * (void)k), v49);
            [v34 setPredicate:v42];

            v66[4] = &cf;
            uint64_t v67 = 0;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_1000089F8;
            v66[3] = &unk_10000C528;
            [v64 enumerateContactsWithFetchRequest:v34 error:&v67 usingBlock:v66];
          }
          id v39 = [v62 countByEnumeratingWithState:&v68 objects:v92 count:16];
        }
        while (v39);
      }
    }
  }
  id v43 = p_cf;
  if (v49) {
    BOOL *v49 = p_cf[5] != 0;
  }
  uint64_t v44 = (void *)v43[5];
  if (!v44)
  {
    id v45 = objc_alloc_init((Class)CNMutableContact);
    [v45 setPhoneNumbers:v52];
    [v45 setEmailAddresses:v53];
    [v45 setPostalAddresses:v55];
    sub_100007688(v45, v50);
    v46 = (void *)p_cf[5];
    p_cf[5] = v45;

    uint64_t v44 = (void *)p_cf[5];
  }
  id v47 = v44;
  _Block_object_dispose(&cf, 8);

  return v47;
}

void sub_100008974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1000089C0(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void sub_1000089F8(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

uint64_t DDExtractMapLocationInformationFromURL()
{
  return _DDExtractMapLocationInformationFromURL();
}

uint64_t DDLocalizedString()
{
  return _DDLocalizedString();
}

uint64_t DDResultCopyExtractedURL()
{
  return _DDResultCopyExtractedURL();
}

uint64_t DDResultCopyExtractedURLWithOptions()
{
  return _DDResultCopyExtractedURLWithOptions();
}

uint64_t DDResultCopyMailValue()
{
  return _DDResultCopyMailValue();
}

uint64_t DDResultCopyPhoneValue()
{
  return _DDResultCopyPhoneValue();
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

uint64_t DDResultGetCountryCode()
{
  return _DDResultGetCountryCode();
}

uint64_t DDResultGetMatchedString()
{
  return _DDResultGetMatchedString();
}

uint64_t DDResultGetSubResults()
{
  return _DDResultGetSubResults();
}

uint64_t DDResultGetSubresultWithType()
{
  return _DDResultGetSubresultWithType();
}

uint64_t DDResultGetType()
{
  return _DDResultGetType();
}

uint64_t DDResultGetValue()
{
  return _DDResultGetValue();
}

uint64_t DDResultHasType()
{
  return _DDResultHasType();
}

uint64_t GEOMapRectForMapRegion()
{
  return _GEOMapRectForMapRegion();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  return _MKMapRectInset(rect, dx, dy);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t dd_isDeviceLocked()
{
  return _dd_isDeviceLocked();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int32_t u_charDigitValue(UChar32 c)
{
  return _u_charDigitValue(c);
}

UBool u_isdigit(UChar32 c)
{
  return _u_isdigit(c);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__geoMapItem(void *a1, const char *a2, ...)
{
  return [a1 _geoMapItem];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actionClass(void *a1, const char *a2, ...)
{
  return [a1 actionClass];
}

id objc_msgSend_actionContext(void *a1, const char *a2, ...)
{
  return [a1 actionContext];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associatedVisualResults(void *a1, const char *a2, ...)
{
  return [a1 associatedVisualResults];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerCoordinateDistance(void *a1, const char *a2, ...)
{
  return [a1 centerCoordinateDistance];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_coreResult(void *a1, const char *a2, ...)
{
  return [a1 coreResult];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_departmentName(void *a1, const char *a2, ...)
{
  return [a1 departmentName];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_displayMapRegion(void *a1, const char *a2, ...)
{
  return [a1 displayMapRegion];
}

id objc_msgSend_displayRegion(void *a1, const char *a2, ...)
{
  return [a1 displayRegion];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_jobTitle(void *a1, const char *a2, ...)
{
  return [a1 jobTitle];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_matchedString(void *a1, const char *a2, ...)
{
  return [a1 matchedString];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return [a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return [a1 nameSuffix];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return [a1 nickname];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLocationManager(void *a1, const char *a2, ...)
{
  return [a1 removeLocationManager];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_subResults(void *a1, const char *a2, ...)
{
  return [a1 subResults];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 verticalAccuracy];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}