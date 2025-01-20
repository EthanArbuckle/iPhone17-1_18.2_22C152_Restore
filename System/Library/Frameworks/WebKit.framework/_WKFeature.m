@interface _WKFeature
- (BOOL)defaultValue;
- (BOOL)isHidden;
- (BOOL)isKindOfClass:(Class)a3;
- (NSString)description;
- (NSString)details;
- (NSString)key;
- (NSString)name;
- (Object)_apiObject;
- (unint64_t)category;
- (unint64_t)status;
- (void)dealloc;
@end

@implementation _WKFeature

- (unint64_t)status
{
  if (self->_wrappedFeature.data.__lx[40] - 1 < 7) {
    return (self->_wrappedFeature.data.__lx[40] - 1) + 1;
  }
  else {
    return 0;
  }
}

- (NSString)key
{
  v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[24];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_wrappedFeature;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::Feature::~Feature((API::Feature *)&self->_wrappedFeature, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKFeature;
    [(_WKFeature *)&v5 dealloc];
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(_WKFeature *)self name];
  v7 = [(_WKFeature *)self key];
  BOOL v8 = [(_WKFeature *)self defaultValue];
  v9 = "off";
  if (v8) {
    v9 = "on";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = %@; key = %@; defaultValue = %s >",
                       v5,
                       self,
                       v6,
                       v7,
                       v9);
}

- (NSString)name
{
  v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[16];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (unint64_t)category
{
  unsigned int v2 = self->_wrappedFeature.data.__lx[41] - 1;
  if (v2 > 9) {
    return 0;
  }
  else {
    return qword_1994F6528[(char)v2];
  }
}

- (NSString)details
{
  unsigned int v2 = *(WTF::StringImpl **)&self->_wrappedFeature.data.__lx[32];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (BOOL)defaultValue
{
  return self->_wrappedFeature.data.__lx[42];
}

- (BOOL)isHidden
{
  return self->_wrappedFeature.data.__lx[43];
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WKFeature;
  if (-[_WKFeature isKindOfClass:](&v5, sel_isKindOfClass_)
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end