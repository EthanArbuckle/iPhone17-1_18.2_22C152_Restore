@interface HAPTLVNumberValueBase
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVNumberValueBase)init;
- (HAPTLVNumberValueBase)initWithValue:(id)a3;
- (NSNumber)value;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setValue:(id)a3;
@end

@implementation HAPTLVNumberValueBase

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPTLVNumberValueBase *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAPTLVNumberValueBase *)self value];
      v7 = [(HAPTLVNumberValueBase *)v5 value];

      char v8 = [v6 isEqualToNumber:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPTLVNumberValueBase allocWithZone:a3];
  v5 = [(HAPTLVNumberValueBase *)self value];
  v6 = [(HAPTLVNumberValueBase *)v4 initWithValue:v5];

  return v6;
}

- (id)_serialize
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)serializeWithError:(id *)a3
{
  if (a3
    && ([(HAPTLVNumberValueBase *)self value],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    v6 = 0;
    *a3 = v7;
  }
  else
  {
    v6 = [(HAPTLVNumberValueBase *)self _serialize];
  }

  return v6;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  char v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    unsigned int v11 = 0;
    id v7 = v6;
    char v8 = -[HAPTLVNumberValueBase _parseFromData:length:status:](self, "_parseFromData:length:status:", [v7 bytes], objc_msgSend(v7, "length"), &v11);
    BOOL v9 = v11 == 0;
    if (v11)
    {
      if (a4)
      {
        HMErrorFromOSStatus(v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [(HAPTLVNumberValueBase *)self setValue:v8];
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HAPTLVNumberValueBase)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVNumberValueBase;
  id v6 = [(HAPTLVNumberValueBase *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

- (HAPTLVNumberValueBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPTLVNumberValueBase;
  return [(HAPTLVNumberValueBase *)&v3 init];
}

@end