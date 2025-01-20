@interface HMDAssistantCharacteristicTuple
- (HMDAssistantCharacteristicTuple)init;
- (HMDAssistantCharacteristicTuple)initWithAttribute:(id)a3 value:(id)a4;
- (NSString)attribute;
- (SAHAAttributeValue)value;
@end

@implementation HMDAssistantCharacteristicTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
}

- (SAHAAttributeValue)value
{
  return self->_value;
}

- (NSString)attribute
{
  return self->_attribute;
}

- (HMDAssistantCharacteristicTuple)initWithAttribute:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAssistantCharacteristicTuple;
  v9 = [(HMDAssistantCharacteristicTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribute, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (HMDAssistantCharacteristicTuple)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end