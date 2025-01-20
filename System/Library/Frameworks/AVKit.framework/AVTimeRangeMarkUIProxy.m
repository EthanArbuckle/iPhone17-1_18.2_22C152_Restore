@interface AVTimeRangeMarkUIProxy
+ (id)maskedTimeRangeMarkUIProxyWithCornerRadius:(float)a3;
+ (id)timeRangeMarkUIProxyWithBackgroundColor:(id)a3 cornerRadius:(float)a4;
- (BOOL)isMasked;
- (UIColor)backgroundColor;
- (float)cornerRadius;
@end

@implementation AVTimeRangeMarkUIProxy

- (void).cxx_destruct
{
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isMasked
{
  return self->_isMasked;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

+ (id)timeRangeMarkUIProxyWithBackgroundColor:(id)a3 cornerRadius:(float)a4
{
  v5 = (UIColor *)a3;
  v6 = objc_alloc_init(AVTimeRangeMarkUIProxy);
  backgroundColor = v6->_backgroundColor;
  v6->_backgroundColor = v5;

  v6->_cornerRadius = a4;

  return v6;
}

+ (id)maskedTimeRangeMarkUIProxyWithCornerRadius:(float)a3
{
  v4 = objc_alloc_init(AVTimeRangeMarkUIProxy);
  v4->_isMasked = 1;
  v4->_cornerRadius = a3;

  return v4;
}

@end