@interface AVUnreachableAssetInspectorLoader
- (AVUnreachableAssetInspectorLoader)initWithFigError:(int)a3 userInfo:(id)a4;
- (Class)_classForTrackInspectors;
- (id)initForUnitTests;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVUnreachableAssetInspectorLoader

- (AVUnreachableAssetInspectorLoader)initWithFigError:(int)a3 userInfo:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVUnreachableAssetInspectorLoader;
  v6 = [(AVAssetInspectorLoader *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_figError = a3;
    v6->_figErrorUserInfo = (NSDictionary *)a4;
    v7->_statusOfValueForKeyReturnsLoaded = 0;
  }
  return v7;
}

- (id)initForUnitTests
{
  v3.receiver = self;
  v3.super_class = (Class)AVUnreachableAssetInspectorLoader;
  id result = [(AVAssetInspectorLoader *)&v3 init];
  if (result)
  {
    *((_DWORD *)result + 4) = 0;
    *((void *)result + 3) = 0;
    *((unsigned char *)result + 32) = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVUnreachableAssetInspectorLoader;
  [(AVAssetInspectorLoader *)&v3 dealloc];
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (self->_statusOfValueForKeyReturnsLoaded) {
    return 2;
  }
  if (a4) {
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(self->_figError, self->_figErrorUserInfo);
  }
  return 3;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (Class)_classForTrackInspectors
{
  return 0;
}

@end