@interface HAPSecuritySessionDelegateAdditionalDerivedKeyTuple
+ (id)new;
- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init;
- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5;
- (NSData)infoData;
- (NSData)saltData;
- (NSString)name;
@end

@implementation HAPSecuritySessionDelegateAdditionalDerivedKeyTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoData, 0);
  objc_storeStrong((id *)&self->_saltData, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)infoData
{
  return self->_infoData;
}

- (NSData)saltData
{
  return self->_saltData;
}

- (NSString)name
{
  return self->_name;
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPSecuritySessionDelegateAdditionalDerivedKeyTuple;
  v11 = [(HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    saltData = v11->_saltData;
    v11->_saltData = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    infoData = v11->_infoData;
    v11->_infoData = (NSData *)v16;
  }
  return v11;
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
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