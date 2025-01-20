@interface HIDAnalyticsEventField
- (HIDAnalyticsEventField)initWithName:(id)a3;
- (NSString)fieldName;
- (id)value;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setStringValue:(id)a3;
@end

@implementation HIDAnalyticsEventField

- (HIDAnalyticsEventField)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDAnalyticsEventField;
  v6 = [(HIDAnalyticsEventField *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fieldName, a3);
    v8 = v7;
  }

  return v7;
}

- (id)value
{
  stringValue = self->stringValue;
  if (stringValue)
  {
    v3 = stringValue;
  }
  else
  {
    v3 = [NSNumber numberWithUnsignedLongLong:self->integerValue];
  }
  return v3;
}

- (void)setIntegerValue:(unint64_t)a3
{
  self->integerValue = a3;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->stringValue, 0);
}

@end