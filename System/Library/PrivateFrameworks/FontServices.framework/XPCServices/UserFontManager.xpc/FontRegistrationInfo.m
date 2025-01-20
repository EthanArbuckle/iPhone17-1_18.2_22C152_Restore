@interface FontRegistrationInfo
+ (id)dictionaryFileURLForTargetDirectoryURL:(id)a3;
- (BOOL)isKnownDestinationFileURL:(id)a3 uuid:(id *)a4;
- (BOOL)isKnownFontInfo:(id)a3;
- (BOOL)isKnownSourceFileURL:(id)a3 uuid:(id *)a4;
- (BOOL)isKnownUserSpecifiedInfo:(id)a3;
- (BOOL)modified;
- (FontRegistrationInfo)initWithTargetDirectoryURL:(id)a3;
- (NSMutableDictionary)uuidToFontInfo;
- (NSURL)sourceDictFileURL;
- (NSURL)targetDirectoryURL;
- (id)externalizeFontInfo:(id)a3;
- (id)fontInfoForUUID:(id)a3;
- (id)internalizeFontInfo:(id)a3;
- (id)souceFontFileURLStringForUUID:(id)a3;
- (id)subpathForAppBundlePath:(id)a3;
- (id)uuidNameForFontInfo:(id)a3;
- (id)uuidsForUserInfo:(id)a3;
- (unint64_t)count;
- (void)removeUUIDName:(id)a3;
- (void)setModified:(BOOL)a3;
- (void)setSourceDictFileURL:(id)a3;
- (void)setTargetDirectoryURL:(id)a3;
- (void)setUuidToFontInfo:(id)a3;
- (void)update;
@end

@implementation FontRegistrationInfo

+ (id)dictionaryFileURLForTargetDirectoryURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 lastPathComponent];
  v5 = [v3 URLByDeletingLastPathComponent];

  v6 = [v5 URLByDeletingLastPathComponent];

  v7 = +[NSString stringWithFormat:@"%@.plist", v4];
  v8 = [v6 URLByAppendingPathComponent:v7];

  return v8;
}

- (id)internalizeFontInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  v5 = [v4 objectForKey:@"CTFontIgnoreURLLocationAttribute"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    [v4 removeObjectForKey:@"CTFontIgnoreURLLocationAttribute"];
    [v4 removeObjectForKey:@"NSCTFontFileURLAttribute"];
    [v4 removeObjectForKey:@"CTFontAssetDataAttribute"];
  }
  else
  {
    v7 = [v3 objectForKey:@"NSCTFontFileURLAttribute"];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 absoluteString];
      [v4 setObject:v9 forKey:@"NSCTFontFileURLAttribute"];
    }
  }
  [v4 removeObjectForKey:@"sandbox"];

  return v4;
}

- (id)externalizeFontInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  v5 = [v3 objectForKey:@"NSCTFontFileURLAttribute"];

  if (v5)
  {
    unsigned int v6 = +[NSURL URLWithString:v5];
    [v4 setObject:v6 forKey:@"NSCTFontFileURLAttribute"];
  }
  return v4;
}

- (FontRegistrationInfo)initWithTargetDirectoryURL:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FontRegistrationInfo;
  unsigned int v6 = [(FontRegistrationInfo *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetDirectoryURL, a3);
    uint64_t v8 = [(id)objc_opt_class() dictionaryFileURLForTargetDirectoryURL:v5];
    sourceDictFileURL = v7->_sourceDictFileURL;
    v7->_sourceDictFileURL = (NSURL *)v8;

    v10 = +[NSFileManager defaultManager];
    v11 = [(NSURL *)v7->_sourceDictFileURL path];
    unsigned int v12 = [v10 fileExistsAtPath:v11];

    if (v12)
    {
      v13 = +[NSInputStream inputStreamWithURL:v7->_sourceDictFileURL];
      [v13 open];
      id v22 = 0;
      uint64_t v14 = +[NSPropertyListSerialization propertyListWithStream:v13 options:1 format:0 error:&v22];
      id v15 = v22;
      uuidToFontInfo = v7->_uuidToFontInfo;
      v7->_uuidToFontInfo = (NSMutableDictionary *)v14;

      [v13 close];
      if (v15)
      {
        v17 = [(NSURL *)v7->_sourceDictFileURL path];
        v21 = [v15 domain];
        [v15 code];
        FSLog_Error();
      }
    }
    if (!v7->_uuidToFontInfo)
    {
      uint64_t v18 = +[NSMutableDictionary dictionaryWithCapacity:0];
      v19 = v7->_uuidToFontInfo;
      v7->_uuidToFontInfo = (NSMutableDictionary *)v18;
    }
  }

  return v7;
}

- (id)uuidNameForFontInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"NSCTFontFileURLAttribute"];
  id v13 = 0;
  unsigned __int8 v6 = [(FontRegistrationInfo *)self isKnownSourceFileURL:v5 uuid:&v13];
  id v7 = v13;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];

    self->_modified = 1;
    uuidToFontInfo = self->_uuidToFontInfo;
    v11 = [(FontRegistrationInfo *)self internalizeFontInfo:v4];
    [(NSMutableDictionary *)uuidToFontInfo setObject:v11 forKey:v9];

    id v7 = (id)v9;
  }

  return v7;
}

- (id)uuidsForUserInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    uuidToFontInfo = self->_uuidToFontInfo;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A65C;
    v11[3] = &unk_100010478;
    id v12 = v4;
    id v7 = v5;
    id v13 = v7;
    [(NSMutableDictionary *)uuidToFontInfo enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)subpathForAppBundlePath:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@".app/"];
  if (v5)
  {
    id v6 = [v3 substringFromIndex:v4 + 5];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)isKnownSourceFileURL:(id)a3 uuid:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 absoluteString];
  uint64_t v8 = [(FontRegistrationInfo *)self subpathForAppBundlePath:v7];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100006350;
  v21 = sub_100006360;
  id v22 = 0;
  uuidToFontInfo = self->_uuidToFontInfo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A8E4;
  v13[3] = &unk_100010630;
  v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  id v15 = &v23;
  v16 = &v17;
  [(NSMutableDictionary *)uuidToFontInfo enumerateKeysAndObjectsUsingBlock:v13];
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v11 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (BOOL)isKnownDestinationFileURL:(id)a3 uuid:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 path];
  uint64_t v8 = [(NSURL *)self->_targetDirectoryURL path];
  if ([v7 hasPrefix:v8])
  {
    id v9 = [v6 lastPathComponent];
    id v10 = [(NSMutableDictionary *)self->_uuidToFontInfo objectForKey:v9];

    if (v10) {
      id v10 = v9;
    }
    if (a4) {
      *a4 = v10;
    }
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isKnownFontInfo:(id)a3
{
  id v4 = [a3 objectForKey:@"NSCTFontFileURLAttribute"];
  if (v4) {
    BOOL v5 = [(FontRegistrationInfo *)self isKnownSourceFileURL:v4 uuid:0];
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isKnownUserSpecifiedInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    uuidToFontInfo = self->_uuidToFontInfo;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000ABE8;
    v9[3] = &unk_100010658;
    BOOL v11 = &v12;
    id v10 = v4;
    [(NSMutableDictionary *)uuidToFontInfo enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)fontInfoForUUID:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_uuidToFontInfo objectForKey:a3];
  BOOL v5 = [(FontRegistrationInfo *)self externalizeFontInfo:v4];

  return v5;
}

- (id)souceFontFileURLStringForUUID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_uuidToFontInfo objectForKey:a3];
  id v4 = [v3 objectForKey:@"NSCTFontFileURLAttribute"];

  return v4;
}

- (void)removeUUIDName:(id)a3
{
  self->_modified = 1;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_uuidToFontInfo count];
}

- (void)update
{
  if (self->_modified)
  {
    id v3 = +[NSFileManager defaultManager];
    id v4 = [(NSURL *)self->_targetDirectoryURL path];
    BOOL v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

    id v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
    uuidToFontInfo = self->_uuidToFontInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AF58;
    v15[3] = &unk_100010478;
    id v8 = v5;
    id v16 = v8;
    id v9 = v6;
    id v17 = v9;
    [(NSMutableDictionary *)uuidToFontInfo enumerateKeysAndObjectsUsingBlock:v15];
    if ([v9 count])
    {
      id v10 = +[NSOutputStream outputStreamWithURL:self->_sourceDictFileURL append:0];
      [v10 open];
      id v14 = 0;
      +[NSPropertyListSerialization writePropertyList:v9 toStream:v10 format:200 options:0 error:&v14];
      id v11 = v14;
      [v10 close];
      if (v11)
      {
        uint64_t v12 = [(NSURL *)self->_sourceDictFileURL path];
        id v13 = [v11 domain];
        [v11 code];
        FSLog_Error();
      }
    }
    else
    {
      id v11 = +[NSFileManager defaultManager];
      [v11 removeItemAtURL:self->_sourceDictFileURL error:0];
    }
  }
}

- (NSURL)sourceDictFileURL
{
  return self->_sourceDictFileURL;
}

- (void)setSourceDictFileURL:(id)a3
{
}

- (NSURL)targetDirectoryURL
{
  return self->_targetDirectoryURL;
}

- (void)setTargetDirectoryURL:(id)a3
{
}

- (NSMutableDictionary)uuidToFontInfo
{
  return self->_uuidToFontInfo;
}

- (void)setUuidToFontInfo:(id)a3
{
}

- (BOOL)modified
{
  return self->_modified;
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToFontInfo, 0);
  objc_storeStrong((id *)&self->_targetDirectoryURL, 0);
  objc_storeStrong((id *)&self->_sourceDictFileURL, 0);
}

@end