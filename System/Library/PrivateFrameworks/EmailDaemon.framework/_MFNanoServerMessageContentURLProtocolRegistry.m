@interface _MFNanoServerMessageContentURLProtocolRegistry
+ (id)sharedRegistry;
- (NSMapTable)storage;
- (_MFNanoServerMessageContentURLProtocolRegistry)init;
- (id)URLForLoadingContext:(id)a3 scheme:(id)a4;
- (id)loadingContextForURL:(id)a3;
@end

@implementation _MFNanoServerMessageContentURLProtocolRegistry

+ (id)sharedRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000944DC;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BD48 != -1) {
    dispatch_once(&qword_10016BD48, block);
  }
  v2 = (void *)qword_10016BD40;

  return v2;
}

- (_MFNanoServerMessageContentURLProtocolRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MFNanoServerMessageContentURLProtocolRegistry;
  v2 = [(_MFNanoServerMessageContentURLProtocolRegistry *)&v8 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = +[NSMapTable weakToWeakObjectsMapTable];
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v5;
  }
  return v2;
}

- (id)URLForLoadingContext:(id)a3 scheme:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_lock lock];
  objc_super v8 = objc_getAssociatedObject(v6, off_10016AC90);
  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSURLComponents);
    [v9 setScheme:v7];
    uint64_t v10 = qword_10016BD50++;
    v11 = +[NSString stringWithFormat:@"/%lu", v10];
    [v9 setPath:v11];

    objc_super v8 = [v9 URL];
    objc_setAssociatedObject(v6, off_10016AC90, v8, (void *)0x301);
    v12 = [(_MFNanoServerMessageContentURLProtocolRegistry *)self storage];
    [v12 setObject:v6 forKey:v8];
  }
  [(NSLock *)self->_lock unlock];

  return v8;
}

- (id)loadingContextForURL:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  uint64_t v5 = [(_MFNanoServerMessageContentURLProtocolRegistry *)self storage];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:0];
    id v6 = [v7 query];

    if (v6)
    {
      [v7 setQuery:0];
      objc_super v8 = [(_MFNanoServerMessageContentURLProtocolRegistry *)self storage];
      id v9 = [v7 URL];
      id v6 = [v8 objectForKey:v9];
    }
  }
  [(NSLock *)self->_lock unlock];

  return v6;
}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end