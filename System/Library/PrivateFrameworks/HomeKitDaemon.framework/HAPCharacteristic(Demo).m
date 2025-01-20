@interface HAPCharacteristic(Demo)
- (id)responseDelay;
- (void)setResponseDelay:()Demo;
@end

@implementation HAPCharacteristic(Demo)

- (void)setResponseDelay:()Demo
{
}

- (id)responseDelay
{
  v1 = objc_getAssociatedObject(a1, "responseDelay");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end