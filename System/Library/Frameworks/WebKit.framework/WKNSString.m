@interface WKNSString
- (Class)class;
- (Class)superclass;
- (id)_web_createTarget;
@end

@implementation WKNSString

- (id)_web_createTarget
{
  [(WKObject *)self _apiObject];
  WTF::String::isolatedCopy();
  WTF::String::createCFString((uint64_t *)&v6, (WTF::String *)&v7);
  v4 = v6;
  v3 = v7;
  v7 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, v2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  return v4;
}

- (Class)superclass
{
  return (Class)[NSString superclass];
}

- (Class)class
{
  return (Class)objc_opt_class();
}

@end