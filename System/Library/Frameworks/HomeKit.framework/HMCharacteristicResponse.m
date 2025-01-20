@interface HMCharacteristicResponse
- (BOOL)isEqual:(id)a3;
- (HMCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4;
- (HMCharacteristicResponse)initWithRequest:(id)a3 value:(id)a4 error:(id)a5;
@end

@implementation HMCharacteristicResponse

- (HMCharacteristicResponse)initWithRequest:(id)a3 value:(id)a4 error:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMCharacteristicResponse;
  return [(HMResponseBase *)&v6 initWithRequest:a3 value:a4 error:a5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMCharacteristicResponse *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    objc_super v6 = v5;
    if (v6)
    {
      v7 = [(HMResponseBase *)self request];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
      id v9 = v8;

      v10 = [(HMResponseBase *)v6 request];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;

      v13 = [v9 characteristic];

      v14 = [v12 characteristic];

      char v15 = [v13 isEqual:v14];
    }
    else
    {
      char v15 = 0;
    }
  }
  return v15;
}

- (HMCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4
{
  return [(HMCharacteristicResponse *)self initWithRequest:a3 value:0 error:a4];
}

@end