@interface MDAnnouncementsManager
- (BOOL)_announcementRegionContainsCoordinate:(id)a3 coordinate:(id)a4;
- (BOOL)_announcementsDocumentNeedsUpdate:(id)a3 announcementsURL:(id)a4;
- (BOOL)_pointInPolygon:(CLLocationCoordinate2D)a3 polygonPoints:(CLLocationCoordinate2D *)a4 numberOfPolygonPoints:(unint64_t)a5;
- (MDAnnouncementsManager)initWithState:(id)a3;
- (id)_announcementsFilePath;
- (id)_announcementsFromDisk;
- (id)_announcementsURLPath;
- (id)_getAnnouncementWithID:(id)a3 announcementID:(id)a4;
- (void)_updateAnnouncementIfNecessary:(id)a3 withCompletionHandler:(id)a4;
- (void)_updateAnnouncementsDocumentFromURL:(id)a3 announcementsFromDisk:(id)a4 withCompletionHandler:(id)a5;
- (void)clearCurrentAnnouncement;
- (void)fetchActiveAnnouncement:(id)a3;
- (void)reset;
- (void)update:(id)a3;
@end

@implementation MDAnnouncementsManager

- (MDAnnouncementsManager)initWithState:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MDAnnouncementsManager;
  v6 = [(MDAnnouncementsManager *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MDAnnouncementsManagerQueue", v7);
    announcementsQueue = v6->_announcementsQueue;
    v6->_announcementsQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_state, a3);
  }

  return v6;
}

- (void)fetchActiveAnnouncement:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  announcementsQueue = self->_announcementsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018904;
  block[3] = &unk_1000392D0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(announcementsQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearCurrentAnnouncement
{
  objc_initWeak(&location, self);
  announcementsQueue = self->_announcementsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018B38;
  block[3] = &unk_100038960;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(announcementsQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)reset
{
  objc_initWeak(&location, self);
  announcementsQueue = self->_announcementsQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018C78;
  v4[3] = &unk_100038CF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(announcementsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)update:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (+[GEOKeyBagNotification canAccessFilesWithProtection:3])
  {
    objc_initWeak(location, self);
    announcementsQueue = self->_announcementsQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019064;
    v7[3] = &unk_1000392D0;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async(announcementsQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot update announcements, the device has not been unlocked since boot", (uint8_t *)location, 2u);
    }

    v4[2](v4);
  }
}

- (void)_updateAnnouncementsDocumentFromURL:(id)a3 announcementsFromDisk:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  objc_super v11 = GEOFindOrCreateLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Fetch announcements from server @: %@", buf, 0xCu);
    }

    id v13 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v8];
    [v13 setHTTPShouldHandleCookies:0];
    v14 = +[MDState getDefault:@"AnnouncementsETag"];
    if (v14) {
      [v13 setValue:v14 forHTTPHeaderField:@"If-None-Match"];
    }
    v15 = +[NSURLSession sharedSession];
    uint64_t v16 = MapsAppBundleId;
    v17 = [v15 configuration];
    objc_msgSend(v17, "set_sourceApplicationBundleIdentifier:", v16);

    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100019394;
    v22 = &unk_100039318;
    v26 = v10;
    v23 = self;
    id v24 = v9;
    id v25 = v8;
    v18 = [v15 dataTaskWithRequest:v13 completionHandler:&v19];
    objc_msgSend(v18, "resume", v19, v20, v21, v22, v23);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "No announcements URL present. Not updating announcements document", buf, 2u);
    }

    v10[2](v10);
  }
}

- (void)_updateAnnouncementIfNecessary:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Checking file for new announcements", buf, 2u);
  }

  GEOConfigGetDouble();
  double v10 = v9;
  objc_super v11 = [(MDState *)self->_state locationManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019A30;
  v14[3] = &unk_100039340;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [v11 fetchSingleLocationWithAccuracy:v14 timeout:v10 completionHandler:5.0];
}

- (BOOL)_announcementsDocumentNeedsUpdate:(id)a3 announcementsURL:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v4 = a4;
  id v5 = +[MDState getDefault:@"LastAnnouncementsURL"];
  id v6 = [v4 absoluteString];

  LODWORD(v4) = [v6 isEqualToString:v5];
  if (v4)
  {
    id v7 = +[MDState getDefault:@"AnnouncementsLastUpdated"];
    [v7 doubleValue];
    double v9 = v8;

    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - v9;
    GEOConfigGetDouble();
    BOOL v12 = v10 > v11;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_announcementsFilePath
{
  id v2 = objc_alloc((Class)NSFileManager);
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];

  id v4 = [v3 URLByAppendingPathComponent:@"Library/Caches/Announcements.pbd"];

  return v4;
}

- (BOOL)_announcementRegionContainsCoordinate:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  double v8 = v7;
  if (!v7 || !objc_msgSend(v7, "containsCoordinate:", var0, var1)) {
    goto LABEL_15;
  }
  if (![v8 vertexsCount] || !GEOConfigGetBOOL()) {
    goto LABEL_14;
  }
  v23 = malloc_type_malloc(16 * (void)[v8 vertexsCount], 0x1000040451B5BE8uLL);
  if (!v23) {
    goto LABEL_15;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v9 = [v8 vertexs];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      v14 = 0;
      uint64_t v15 = (uint64_t)v23 + 16 * v12 + 8;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v14);
        [v16 lat];
        CLLocationDegrees v18 = v17;
        [v16 lng];
        *(CLLocationCoordinate2D *)(v15 - 8) = CLLocationCoordinate2DMake(v18, v19);
        v14 = (char *)v14 + 1;
        v15 += 16;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      v12 += (uint64_t)v14;
    }
    while (v11);
  }

  unsigned __int8 v20 = -[MDAnnouncementsManager _pointInPolygon:polygonPoints:numberOfPolygonPoints:](self, "_pointInPolygon:polygonPoints:numberOfPolygonPoints:", v23, [v8 vertexsCount], var0, var1);
  free(v23);
  if (v20) {
LABEL_14:
  }
    BOOL v21 = 1;
  else {
LABEL_15:
  }
    BOOL v21 = 0;

  return v21;
}

- (id)_announcementsFromDisk
{
  id v3 = objc_alloc((Class)NSData);
  id v4 = [(MDAnnouncementsManager *)self _announcementsFilePath];
  id v5 = [v3 initWithContentsOfURL:v4];

  if (v5) {
    id v6 = [objc_alloc((Class)GEOAvailableAnnouncements) initWithData:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_getAnnouncementWithID:(id)a3 announcementID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 unsignedIntValue];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v9 = objc_msgSend(v5, "announcements", 0);
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 announcementID] == v8)
          {
            id v15 = v14;
            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_12:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_announcementsURLPath
{
  id v2 = GEOURLString();
  if ([v2 length])
  {
    id v3 = +[GEOPlatform sharedPlatform];
    id v4 = [v3 osVersion];

    id v5 = +[GEOPlatform sharedPlatform];
    id v6 = [v5 buildVersion];

    id v7 = +[GEOPlatform sharedPlatform];
    unsigned int v8 = [v7 hardwareIdentifier];

    if (v4 && v6 && v8)
    {
      double v9 = +[NSLocale preferredLanguages];
      id v10 = +[GEOResourceManifestManager modernManager];
      id v11 = [v10 activeTileGroup];
      uint64_t v12 = [v11 announcementsSupportedLanguages];

      v35 = (void *)v12;
      CFStringRef v13 = +[NSLocale mostPreferredLanguageOf:v12 withPreferredLanguages:v9 forUsage:1 options:0];
      if (!v13)
      {
        CFStringRef v13 = [v9 firstObject];
        if (!v13)
        {
          v14 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No preferredLanguages list found. Falling back to 'en'", buf, 2u);
          }

          CFStringRef v13 = @"en";
        }
      }
      v49[0] = @"os";
      v49[1] = @"os_version";
      v50[0] = @"ios";
      v50[1] = v4;
      v49[2] = @"os_build";
      v49[3] = @"hardware";
      v50[2] = v6;
      v50[3] = v8;
      v49[4] = @"lang";
      v34 = (__CFString *)v13;
      v50[4] = v13;
      v42 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
      v38 = v6;
      v39 = v4;
      v36 = v9;
      v37 = v8;
      if (qword_100047528 != -1) {
        dispatch_once(&qword_100047528, &stru_100039360);
      }
      id v15 = +[NSMutableString string];
      v40 = v2;
      [v2 rangeOfString:@"?"];
      id v16 = @"&";
      if (!v17) {
        id v16 = @"?";
      }
      long long v18 = v16;
      long long v19 = [v42 allKeys];
      long long v20 = [v19 sortedArrayUsingComparator:&stru_1000393A0];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v20;
      id v21 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v44;
        char v24 = 1;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            long long v27 = [v42 objectForKey:v26];
            id v28 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:qword_100047520];

            CFStringRef v29 = @"&";
            if (v24) {
              CFStringRef v29 = v18;
            }
            [v15 appendFormat:@"%@%@=%@", v29, v26, v28];

            char v24 = 0;
          }
          id v22 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
          char v24 = 0;
        }
        while (v22);
      }

      uint64_t v30 = [v40 stringByAppendingString:v15];

      v31 = +[NSURL URLWithString:v30];

      id v2 = (void *)v30;
      id v6 = v38;
      id v4 = v39;
      v32 = v36;
      unsigned int v8 = v37;
    }
    else
    {
      v32 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Device details could not be determined", buf, 2u);
      }
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)_pointInPolygon:(CLLocationCoordinate2D)a3 polygonPoints:(CLLocationCoordinate2D *)a4 numberOfPolygonPoints:(unint64_t)a5
{
  char v5 = 0;
  if (a5)
  {
    unint64_t v6 = 0;
    p_double longitude = &a4->longitude;
    do
    {
      if (v6 < a5 - 1) {
        unint64_t v8 = v6 + 1;
      }
      else {
        unint64_t v8 = 0;
      }
      double v9 = &a4[v8];
      double longitude = v9->longitude;
      if (*p_longitude > longitude || *p_longitude == longitude && *(p_longitude - 1) > v9->latitude)
      {
        unint64_t v11 = v8;
        unint64_t v8 = v6;
      }
      else
      {
        double longitude = *p_longitude;
        unint64_t v11 = v6;
      }
      if (a3.longitude >= longitude)
      {
        double v12 = a4[v8].longitude;
        if (a3.longitude < v12)
        {
          double v13 = v12 - longitude;
          if (v13 != 0.0
            && a3.latitude < a4[v11].latitude + (a4[v8].latitude - a4[v11].latitude) / v13 * (a3.longitude - longitude))
          {
            v5 ^= 1u;
          }
        }
      }
      ++v6;
      p_longitude += 2;
    }
    while (a5 != v6);
  }
  return v5 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_announcementsQueue, 0);
}

@end