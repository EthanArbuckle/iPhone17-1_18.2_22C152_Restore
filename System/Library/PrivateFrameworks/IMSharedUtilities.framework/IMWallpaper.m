@interface IMWallpaper
+ (BOOL)supportsSecureCoding;
- (BOOL)contentIsSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowResWallpaperExists;
- (BOOL)wallpaperExists;
- (IMWallpaper)initWithCoder:(id)a3;
- (IMWallpaper)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11;
- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8;
- (IMWallpaperMetadata)metadata;
- (NSString)fileName;
- (NSString)filePath;
- (NSString)lowResFileName;
- (NSString)lowResFilePath;
- (id)dictionaryRepresentation;
- (id)lowResWallpaperData;
- (id)publicDictionaryRepresentation;
- (id)wallpaperData;
- (int64_t)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMWallpaper

- (void)encodeWithCoder:(id)a3
{
}

- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IMWallpaper;
  v19 = [(IMWallpaper *)&v23 init];
  if (v19)
  {
    v20 = [[IMWallpaper_SwiftImpl alloc] initWithFileName:v14 filePath:v15 lowResFileName:v16 lowResFilePath:v17 metadata:v18 contentIsSensitive:v8];
    swiftImpl = v19->swiftImpl;
    v19->swiftImpl = v20;
  }
  return v19;
}

- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v29.receiver = self;
  v29.super_class = (Class)IMWallpaper;
  v24 = [(IMWallpaper *)&v29 init];
  if (v24)
  {
    LOBYTE(v28) = a10;
    v25 = [[IMWallpaper_SwiftImpl alloc] initWithFileName:v17 filePath:v18 data:v19 lowResFileName:v20 lowResFilePath:v21 lowResData:v22 metadata:v23 contentIsSensitive:v28 error:a11];
    swiftImpl = v24->swiftImpl;
    v24->swiftImpl = v25;
  }
  return v24;
}

- (IMWallpaper)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v11.receiver = self;
    v11.super_class = (Class)IMWallpaper;
    v6 = [(IMWallpaper *)&v11 init];
    if (v6)
    {
      v7 = [[IMWallpaper_SwiftImpl alloc] initWithDictionaryRepresentation:v5];
      swiftImpl = v6->swiftImpl;
      v6->swiftImpl = v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IMWallpaper)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMWallpaper;
  v5 = [(IMWallpaper *)&v10 init];
  if (v5
    && (v6 = [[IMWallpaper_SwiftImpl alloc] initWithCoder:v4], swiftImpl = v5->swiftImpl, v5->swiftImpl = v6, swiftImpl, !v5->swiftImpl))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v5;
  }

  return v8;
}

- (NSString)fileName
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl fileName];
}

- (NSString)filePath
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl filePath];
}

- (NSString)lowResFileName
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl lowResFileName];
}

- (NSString)lowResFilePath
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl lowResFilePath];
}

- (int64_t)dataVersion
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl dataVersion];
}

- (IMWallpaperMetadata)metadata
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl metadata];
}

- (id)wallpaperData
{
  swiftImpl = self->swiftImpl;
  id v6 = 0;
  v3 = [(IMWallpaper_SwiftImpl *)swiftImpl fetchWallpaperDataAndReturnError:&v6];
  id v4 = v6;
  if (!v3 && _IMWillLog()) {
    _IMAlwaysLog();
  }

  return v3;
}

- (id)lowResWallpaperData
{
  swiftImpl = self->swiftImpl;
  id v6 = 0;
  v3 = [(IMWallpaper_SwiftImpl *)swiftImpl fetchLowResWallpaperDataAndReturnError:&v6];
  id v4 = v6;
  if (!v3 && _IMWillLog()) {
    _IMAlwaysLog();
  }

  return v3;
}

- (BOOL)wallpaperExists
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl wallpaperExists];
}

- (BOOL)lowResWallpaperExists
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl lowResWallpaperExists];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)contentIsSensitive
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl contentIsSensitive];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMWallpaper *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(IMWallpaper *)self fileName];
      v7 = [(IMWallpaper *)v5 fileName];
      if ([v6 isEqualToString:v7])
      {
        BOOL v34 = 1;
      }
      else
      {
        v9 = [(IMWallpaper *)self fileName];
        if (v9)
        {
          BOOL v34 = 0;
        }
        else
        {
          objc_super v10 = [(IMWallpaper *)v5 fileName];
          BOOL v34 = v10 == 0;
        }
      }

      objc_super v11 = [(IMWallpaper *)self filePath];
      v12 = [(IMWallpaper *)v5 filePath];
      if ([v11 isEqualToString:v12])
      {
        BOOL v33 = 1;
      }
      else
      {
        v13 = [(IMWallpaper *)self filePath];
        if (v13)
        {
          BOOL v33 = 0;
        }
        else
        {
          id v14 = [(IMWallpaper *)v5 filePath];
          BOOL v33 = v14 == 0;
        }
      }

      id v15 = [(IMWallpaper *)self lowResFileName];
      id v16 = [(IMWallpaper *)v5 lowResFileName];
      if ([v15 isEqualToString:v16])
      {
        BOOL v17 = 1;
      }
      else
      {
        id v18 = [(IMWallpaper *)self lowResFileName];
        if (v18)
        {
          BOOL v17 = 0;
        }
        else
        {
          id v19 = [(IMWallpaper *)v5 lowResFileName];
          BOOL v17 = v19 == 0;
        }
      }

      id v20 = [(IMWallpaper *)self lowResFilePath];
      id v21 = [(IMWallpaper *)v5 lowResFilePath];
      if ([v20 isEqualToString:v21])
      {
        BOOL v22 = 1;
      }
      else
      {
        id v23 = [(IMWallpaper *)self lowResFilePath];
        if (v23)
        {
          BOOL v22 = 0;
        }
        else
        {
          v24 = [(IMWallpaper *)v5 lowResFilePath];
          BOOL v22 = v24 == 0;
        }
      }

      int64_t v25 = [(IMWallpaper *)self dataVersion];
      uint64_t v26 = [(IMWallpaper *)v5 dataVersion];
      v27 = [(IMWallpaper *)self metadata];
      uint64_t v28 = [(IMWallpaper *)v5 metadata];
      char v29 = [v27 isEqual:v28];

      BOOL v30 = [(IMWallpaper *)self contentIsSensitive];
      BOOL v31 = [(IMWallpaper *)v5 contentIsSensitive];
      char v8 = 0;
      if (v34 && v33 && v17 && v22 && v25 == v26) {
        char v8 = v29 & (v30 ^ v31 ^ 1);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v8 = [(IMWallpaper_SwiftImpl *)self->swiftImpl isEqual:v4];
      }
      else {
        char v8 = 0;
      }
    }
  }

  return v8;
}

- (id)publicDictionaryRepresentation
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl publicDictionaryRepresentation];
}

- (id)dictionaryRepresentation
{
  return [(IMWallpaper_SwiftImpl *)self->swiftImpl dictionaryRepresentation];
}

- (void).cxx_destruct
{
}

@end