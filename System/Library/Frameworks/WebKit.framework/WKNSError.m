@interface WKNSError
- (id)_web_createTarget;
@end

@implementation WKNSError

- (id)_web_createTarget
{
  v2 = (void *)WebCore::ResourceError::nsError((WebCore::ResourceError *)([(WKObject *)self _apiObject] + 16));

  return (id)[v2 copy];
}

@end