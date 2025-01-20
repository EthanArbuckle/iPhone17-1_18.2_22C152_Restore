@interface CRUWBStatus
- (BOOL)isComponentFailed;
- (CRUWBStatus)init;
- (int64_t)copyComponentStatus;
@end

@implementation CRUWBStatus

- (CRUWBStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRUWBStatus;
  v2 = [(CRComponentAuth *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setComponentName_(v2, v3, @"UWB", v4);
  }
  return v5;
}

- (int64_t)copyComponentStatus
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  if (objc_msgSend_isComponentFailed(self, v3, v4, v5)) {
    return -1;
  }
  return 1;
}

- (BOOL)isComponentFailed
{
  uint64_t v4 = self;
  uint64_t v5 = objc_msgSend_componentName(self, a2, v2, v3);
  v8 = objc_msgSend_stringByAppendingString_(v5, v6, @"Failed", v7);
  LOBYTE(v4) = objc_msgSend__checkForComponentFailureInDefaults_(v4, v9, (uint64_t)v8, v10);

  return (char)v4;
}

@end