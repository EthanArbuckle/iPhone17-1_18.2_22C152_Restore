@interface AAPSyncStatePersistence
- (AAPSyncState)state;
- (NSURL)URL;
- (id)_errWithCode:(int64_t)a3 desc:(id)a4 err:(id)a5;
- (id)_fileManager;
- (id)_generateURLIfNeededWithError:(id *)a3;
- (id)load;
- (id)reset;
- (id)save:(id)a3;
- (void)dealloc;
- (void)setURL:(id)a3;
@end

@implementation AAPSyncStatePersistence

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncStatePersistence;
  [(AAPSyncStatePersistence *)&v3 dealloc];
}

- (NSURL)URL
{
  return (NSURL *)[(AAPSyncStatePersistence *)self _generateURLIfNeededWithError:0];
}

- (void)setURL:(id)a3
{
  url = self->_url;
  if (url != a3 && (-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
  {

    self->_url = (NSURL *)[a3 copy];
  }
}

- (id)load
{
  v14 = 0;
  id v3 = [(AAPSyncStatePersistence *)self _generateURLIfNeededWithError:&v14];
  if (v14)
  {
    CFStringRef v4 = @"could not create saved state URL";
    v5 = self;
    uint64_t v6 = 101;
LABEL_3:
    id v7 = -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
    goto LABEL_4;
  }
  v10 = v3;
  v11 = +[NSData dataWithContentsOfURL:v3 options:2 error:&v14];
  if (!v11)
  {
    if (!objc_msgSend(-[AAPSyncStatePersistence _fileManager](self, "_fileManager"), "fileExistsAtPath:", objc_msgSend(v10, "path")))
    {
      v8 = 0;
      goto LABEL_5;
    }
    CFStringRef v4 = @"could not read saved state";
    v5 = self;
    uint64_t v6 = 102;
    goto LABEL_3;
  }
  uint64_t v13 = 0;
  id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v13];
  if (v13)
  {
    id v7 = [(AAPSyncStatePersistence *)self _errWithCode:105 desc:+[NSString stringWithFormat:@"saved state was corrupted - error -> %@", v13] err:0];
  }
  else
  {
    v8 = v12;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_5;
      }
      id v7 = [(AAPSyncStatePersistence *)self _errWithCode:104 desc:+[NSString stringWithFormat:@"saved state was in an unexpected format - tossing -> %@", v8] err:0];
    }
    else
    {
      id v7 = [(AAPSyncStatePersistence *)self _errWithCode:103 desc:@"saved state was badly defined - tossing" err:0];
    }
  }
LABEL_4:
  v8 = 0;
  v14 = v7;
LABEL_5:

  self->_state = (AAPSyncState *)v8;
  return v14;
}

- (id)save:(id)a3
{
  id v13 = 0;
  if (a3)
  {
    id v5 = [(AAPSyncStatePersistence *)self _generateURLIfNeededWithError:&v13];
    if (v13)
    {
      CFStringRef v6 = @"could not create saved state URL";
      id v7 = self;
      uint64_t v8 = 202;
    }
    else
    {
      id v10 = v5;
      if ((objc_msgSend(-[AAPSyncStatePersistence _fileManager](self, "_fileManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(v5, "URLByDeletingLastPathComponent"), 1, 0, &v13) & 1) == 0)id v13 = -[AAPSyncStatePersistence _errWithCode:desc:err:](self, "_errWithCode:desc:err:", 203, @"could not create the saved state parent directory", v13); {
      uint64_t v12 = 0;
      }
      v11 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
      if (!v11 || v12)
      {
        CFStringRef v6 = +[NSString stringWithFormat:@"could not archive state -> %@ -> error -> %@", a3, v12];
        id v7 = self;
        uint64_t v8 = 204;
      }
      else
      {
        if ([(NSData *)v11 writeToURL:v10 options:1 error:&v13])
        {

          self->_state = (AAPSyncState *)[a3 copy];
          return v13;
        }
        CFStringRef v6 = +[NSString stringWithFormat:@"could not save state -> %@", a3];
        id v7 = self;
        uint64_t v8 = 205;
      }
    }
    return -[AAPSyncStatePersistence _errWithCode:desc:err:](v7, "_errWithCode:desc:err:", v8, v6);
  }
  else
  {
    return [(AAPSyncStatePersistence *)self _errWithCode:201 desc:@"could not save nil state" err:0];
  }
}

- (id)reset
{
  id v10 = 0;
  id v3 = [(AAPSyncStatePersistence *)self _generateURLIfNeededWithError:&v10];
  if (v10)
  {
    CFStringRef v4 = @"could not create saved state URL";
    id v5 = self;
    uint64_t v6 = 301;
    return -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
  }
  unsigned __int8 v7 = objc_msgSend(-[AAPSyncStatePersistence _fileManager](self, "_fileManager"), "removeItemAtURL:error:", v3, &v10);
  uint64_t v8 = v10;
  if ((v7 & 1) == 0)
  {
    CFStringRef v4 = @"could not reset state";
    id v5 = self;
    uint64_t v6 = 302;
    return -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
  }
  return v8;
}

- (id)_fileManager
{
  id result = self->_fileManager;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSFileManager);
    self->_fileManager = (NSFileManager *)result;
    if (!result)
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncStatePersistence.m" lineNumber:144 description:@"failed to create fileManager"];
      return self->_fileManager;
    }
  }
  return result;
}

- (id)_generateURLIfNeededWithError:(id *)a3
{
  url = self->_url;
  if (!url)
  {
    -[AAPSyncStatePersistence setURL:](self, "setURL:", objc_msgSend(objc_msgSend(-[AAPSyncStatePersistence _fileManager](self, "_fileManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 0, a3), "URLByAppendingPathComponent:isDirectory:", @"Assistant/com.apple.siri.applications.laststate.plist", 0));
    url = self->_url;
  }
  id v5 = url;

  return v5;
}

- (id)_errWithCode:(int64_t)a3 desc:(id)a4 err:(id)a5
{
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v9 = v8;
  if (a4) {
    [v8 setObject:a4 forKey:NSLocalizedDescriptionKey];
  }
  if (a5) {
    [v9 setObject:a5 forKey:NSUnderlyingErrorKey];
  }
  id v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", [(id)objc_opt_class() description], a3, v9);

  return v10;
}

- (AAPSyncState)state
{
  return self->_state;
}

@end