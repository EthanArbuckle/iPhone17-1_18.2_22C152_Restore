@interface DBGTargetHub
+ (id)sharedHub;
+ (unint64_t)hubVersion;
- (DBGTargetHub)init;
- (id)performRequest:(id)a3;
- (id)performRequestWithRequestInBase64:(id)a3;
- (void)clearAllRequestsAndData;
@end

@implementation DBGTargetHub

+ (unint64_t)hubVersion
{
  +[DebugHierarchyTargetHub debugHierarchyVersion];
  return (unint64_t)v2;
}

+ (id)sharedHub
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __25__DBGTargetHub_sharedHub__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHub_onceToken != -1) {
    dispatch_once(&sharedHub_onceToken, block);
  }
  float v2 = (void *)sharedHub_sharedHub;
  return v2;
}

uint64_t __25__DBGTargetHub_sharedHub__block_invoke(uint64_t a1)
{
  sharedHub_sharedHub = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

- (DBGTargetHub)init
{
  v3.receiver = self;
  v3.super_class = (Class)DBGTargetHub;
  return [(DBGTargetHub *)&v3 init];
}

- (id)performRequest:(id)a3
{
  id v3 = a3;
  v4 = +[DebugHierarchyTargetHub sharedHub];
  v5 = [v4 performRequest:v3];

  return v5;
}

- (id)performRequestWithRequestInBase64:(id)a3
{
  id v3 = a3;
  v4 = +[DebugHierarchyTargetHub sharedHub];
  v5 = [v4 performRequestWithRequestInBase64:v3];

  return v5;
}

- (void)clearAllRequestsAndData
{
  id v2 = +[DebugHierarchyTargetHub sharedHub];
  [v2 clearAllRequestsAndData];
}

@end