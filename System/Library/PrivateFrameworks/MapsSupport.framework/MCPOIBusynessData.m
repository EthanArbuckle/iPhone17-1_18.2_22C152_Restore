@interface MCPOIBusynessData
+ (BOOL)supportsSecureCoding;
+ (id)cacheFileURL;
+ (id)readLastFromDisk:(id *)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)leechedGEOCoordinate2D;
- (CLLocation)leechedLocation;
- (CLVisit)visit;
- (MCPOIBusynessData)initWithCoder:(id)a3;
- (MCPOIBusynessData)initWithLocation:(id)a3 visit:(id)a4;
- (double)uploadedTimestamp;
- (id)description;
- (id)leechedGEOLocation;
- (void)encodeWithCoder:(id)a3;
- (void)writeToDisk;
@end

@implementation MCPOIBusynessData

+ (id)cacheFileURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];
  v4 = [v3 stringByAppendingPathComponent:@"com.apple.geocorrectiond"];

  char v14 = 0;
  v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4 isDirectory:&v14];

  if (v6) {
    goto LABEL_4;
  }
  v7 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v9 = v13;

  if (v8)
  {

LABEL_4:
    id v9 = [v4 stringByAppendingPathComponent:@"poi-busyness.last"];
    v10 = +[NSURL fileURLWithPath:v9];
    goto LABEL_8;
  }
  v11 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create cache dir %@: %@", buf, 0x16u);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (MCPOIBusynessData)initWithLocation:(id)a3 visit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCPOIBusynessData;
  id v9 = [(MCPOIBusynessData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_leechedLocation, a3);
    objc_storeStrong((id *)&v10->_visit, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MCPOIBusynessData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCPOIBusynessData;
  v5 = [(MCPOIBusynessData *)&v12 init];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loc"];
  leechedLocation = v5->_leechedLocation;
  v5->_leechedLocation = (CLLocation *)v6;

  [v4 decodeDoubleForKey:@"ts"];
  v5->_uploadedTimestamp = v8;
  if (v5->_leechedLocation && v8 > 1.0) {
LABEL_7:
  }
    v10 = v5;
  else {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  leechedLocation = self->_leechedLocation;
  id v5 = a3;
  [v5 encodeObject:leechedLocation forKey:@"loc"];
  [v5 encodeDouble:@"ts" forKey:self->_uploadedTimestamp];
}

+ (id)readLastFromDisk:(id *)a3
{
  id v4 = +[GEOKeyBagNotification sharedObject];
  unsigned __int8 v5 = [v4 canAccessFilesWithProtection:1];

  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() cacheFileURL];
    id v7 = +[NSFileManager defaultManager];
    double v8 = [v6 path];
    unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      id v21 = 0;
      id v10 = [objc_alloc((Class)NSData) initWithContentsOfURL:v6 options:0 error:&v21];
      v11 = v21;
      objc_super v12 = v11;
      if (!v10 || v11)
      {
        id v18 = GEOGetPOIBusynessLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v6;
          __int16 v24 = 2112;
          v25 = v12;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed read %@: %@", buf, 0x16u);
        }

        if (a3)
        {
          objc_super v12 = v12;
          v16 = 0;
          *a3 = v12;
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        id v20 = 0;
        id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v20];
        objc_super v12 = v20;
        char v14 = GEOGetPOIBusynessLog();
        v15 = v14;
        if (!v13 || v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v6;
            __int16 v24 = 2112;
            v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed unarchive %@: %@", buf, 0x16u);
          }

          v16 = 0;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Successfuly read %{private}@", buf, 0xCu);
          }

          v13[8] = 1;
          v16 = v13;
        }
      }
    }
    else
    {
      objc_super v12 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Last location does not exist at %@", buf, 0xCu);
      }
      v16 = 0;
    }
  }
  else
  {
    __int16 v17 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Refusing to read last location, device is not unlocked", buf, 2u);
    }

    if (a3)
    {
      +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (void)writeToDisk
{
  if (self->_written)
  {
    v3 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      char v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Already wrote %{private}@", buf, 0xCu);
    }
  }
  else
  {
    self->_uploadedTimestamp = CFAbsoluteTimeGetCurrent();
    id v12 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
    unsigned __int8 v5 = v12;
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      id v7 = [(id)objc_opt_class() cacheFileURL];
      id v11 = 0;
      unsigned int v8 = [v4 writeToURL:v7 options:0x20000000 error:&v11];
      v3 = v11;
      unsigned __int8 v9 = GEOGetPOIBusynessLog();
      id v10 = v9;
      if (!v8 || v3)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138478339;
          char v14 = self;
          __int16 v15 = 2112;
          v16 = v7;
          __int16 v17 = 2112;
          id v18 = v3;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to write %{private}@ to %@: %@", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          char v14 = self;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Successfuly wrote %{private}@", buf, 0xCu);
        }

        v3 = 0;
        self->_written = 1;
      }
    }
    else
    {
      v3 = v5;
      id v7 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        char v14 = self;
        __int16 v15 = 2112;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to archive %{private}@: %@", buf, 0x16u);
      }
    }
  }
}

- (id)leechedGEOLocation
{
  [(MCPOIBusynessData *)self leechedGEOCoordinate2D];
  id v5 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v3, v4);
  [(CLLocation *)self->_leechedLocation altitude];
  [v5 setAltitude:(int)v6];
  [(CLLocation *)self->_leechedLocation horizontalAccuracy];
  objc_msgSend(v5, "setHorizontalAccuracy:");
  [(CLLocation *)self->_leechedLocation verticalAccuracy];
  objc_msgSend(v5, "setVerticalAccuracy:");
  id v7 = [(CLLocation *)self->_leechedLocation timestamp];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setTimestamp:");

  unsigned int v8 = [(CLLocation *)self->_leechedLocation referenceFrame];
  if (v8 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * (v8 == 2);
  }
  [v5 setReferenceFrame:v9];

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)leechedGEOCoordinate2D
{
  [(CLLocation *)self->_leechedLocation coordinate];
  double v4 = v3;
  [(CLLocation *)self->_leechedLocation coordinate];
  double v6 = v4;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (id)description
{
  [(MCPOIBusynessData *)self leechedGEOCoordinate2D];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  id v7 = (objc_class *)objc_opt_class();
  unsigned int v8 = NSStringFromClass(v7);
  uint64_t v9 = +[NSString stringWithFormat:@"<%@ %p %f,%f at %.02f>", v8, self, v4, v6, *(void *)&self->_uploadedTimestamp];

  return v9;
}

- (CLLocation)leechedLocation
{
  return self->_leechedLocation;
}

- (CLVisit)visit
{
  return self->_visit;
}

- (double)uploadedTimestamp
{
  return self->_uploadedTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visit, 0);

  objc_storeStrong((id *)&self->_leechedLocation, 0);
}

@end