@interface WKNSURLAuthenticationChallenge
- (id)_web_createTarget;
@end

@implementation WKNSURLAuthenticationChallenge

- (id)_web_createTarget
{
  v2 = [(WKObject *)self _apiObject];
  if ((_MergedGlobals_68 & 1) == 0)
  {
    qword_1EB3597E8 = 0;
    _MergedGlobals_68 = 1;
  }
  if (qword_1EB3597E0 != -1) {
    dispatch_once(&qword_1EB3597E0, &__block_literal_global_18);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F18D70]);
  uint64_t v5 = WebCore::mac((WebCore *)&v2[1], v4);
  uint64_t v6 = qword_1EB3597E8;

  return (id)[v3 initWithAuthenticationChallenge:v5 sender:v6];
}

void __51__WKNSURLAuthenticationChallenge__web_createTarget__block_invoke()
{
  v0 = objc_alloc_init(WKNSURLAuthenticationChallengeSender);
  v1 = (const void *)qword_1EB3597E8;
  qword_1EB3597E8 = (uint64_t)v0;
  if (v1)
  {
    CFRelease(v1);
  }
}

@end