@interface CRBasebandStatus
- (BOOL)isComponentFailed;
- (CRBasebandStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRBasebandStatus

- (CRBasebandStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBasebandStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"Baseband", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (objc_msgSend_isComponentFailed(self, a2, v2, v3)) {
    return -1;
  }
  else {
    return 1;
  }
}

- (BOOL)isComponentFailed
{
  uint64_t v4 = self;
  v5 = objc_msgSend_componentName(self, a2, v2, v3);
  v8 = objc_msgSend_stringByAppendingString_(v5, v6, @"Failed", v7);
  LOBYTE(v4) = objc_msgSend__checkForComponentFailureInDefaults_(v4, v9, (uint64_t)v8, v10);

  return (char)v4;
}

@end