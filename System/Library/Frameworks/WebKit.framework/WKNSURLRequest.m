@interface WKNSURLRequest
- (id)URL;
- (id)_web_createTarget;
@end

@implementation WKNSURLRequest

- (id)_web_createTarget
{
  [(WKObject *)self _apiObject];
  v2 = (void *)WebCore::ResourceRequest::nsURLRequest();

  return (id)[v2 copy];
}

- (id)URL
{
  WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)([(WKObject *)self _apiObject] + 16));

  return (id)WTF::URL::operator NSURL *();
}

@end