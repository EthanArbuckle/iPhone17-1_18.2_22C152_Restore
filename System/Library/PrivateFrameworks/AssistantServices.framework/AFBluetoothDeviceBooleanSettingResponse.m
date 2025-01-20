@interface AFBluetoothDeviceBooleanSettingResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFBluetoothDeviceBooleanSettingResponse)init;
- (AFBluetoothDeviceBooleanSettingResponse)initWithBuilder:(id)a3;
- (AFBluetoothDeviceBooleanSettingResponse)initWithCoder:(id)a3;
- (AFBluetoothDeviceBooleanSettingResponse)initWithValue:(int64_t)a3 status:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)status;
- (int64_t)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBluetoothDeviceBooleanSettingResponse

- (int64_t)status
{
  return self->_status;
}

- (int64_t)value
{
  return self->_value;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t value = self->_value;
  id v6 = a3;
  v7 = [v4 numberWithInteger:value];
  [v6 encodeObject:v7 forKey:@"AFBluetoothDeviceBooleanSettingResponse::value"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_status];
  [v6 encodeObject:v8 forKey:@"AFBluetoothDeviceBooleanSettingResponse::status"];
}

- (AFBluetoothDeviceBooleanSettingResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceBooleanSettingResponse::value"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceBooleanSettingResponse::status"];

  uint64_t v8 = [v7 integerValue];
  return [(AFBluetoothDeviceBooleanSettingResponse *)self initWithValue:v6 status:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFBluetoothDeviceBooleanSettingResponse *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t value = self->_value;
      if (value == [(AFBluetoothDeviceBooleanSettingResponse *)v5 value])
      {
        int64_t status = self->_status;
        BOOL v8 = status == [(AFBluetoothDeviceBooleanSettingResponse *)v5 status];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_value];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_status];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)AFBluetoothDeviceBooleanSettingResponse;
  v5 = [(AFBluetoothDeviceBooleanSettingResponse *)&v14 description];
  unint64_t value = self->_value;
  if (value > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E5925630[value];
  }
  BOOL v8 = v7;
  unint64_t status = self->_status;
  if (status > 4) {
    v10 = @"(unknown)";
  }
  else {
    v10 = off_1E5926508[status];
  }
  v11 = v10;
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t value = %@, status = %@}", v5, v8, v11];

  return v12;
}

- (id)description
{
  return [(AFBluetoothDeviceBooleanSettingResponse *)self _descriptionWithIndent:0];
}

- (AFBluetoothDeviceBooleanSettingResponse)initWithValue:(int64_t)a3 status:(int64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AFBluetoothDeviceBooleanSettingResponse_initWithValue_status___block_invoke;
  v5[3] = &__block_descriptor_48_e59_v16__0___AFBluetoothDeviceBooleanSettingResponseMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return [(AFBluetoothDeviceBooleanSettingResponse *)self initWithBuilder:v5];
}

void __64__AFBluetoothDeviceBooleanSettingResponse_initWithValue_status___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setValue:v3];
  [v4 setStatus:*(void *)(a1 + 40)];
}

- (AFBluetoothDeviceBooleanSettingResponse)init
{
  return [(AFBluetoothDeviceBooleanSettingResponse *)self initWithBuilder:0];
}

- (AFBluetoothDeviceBooleanSettingResponse)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothDeviceBooleanSettingResponse;
  v5 = [(AFBluetoothDeviceBooleanSettingResponse *)&v9 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFBluetoothDeviceBooleanSettingResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBluetoothDeviceBooleanSettingResponseMutation *)v7 isDirty])
    {
      v6->_unint64_t value = [(_AFBluetoothDeviceBooleanSettingResponseMutation *)v7 getValue];
      v6->_unint64_t status = [(_AFBluetoothDeviceBooleanSettingResponseMutation *)v7 getStatus];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *))a3;
  if (v4)
  {
    v5 = [[_AFBluetoothDeviceBooleanSettingResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBluetoothDeviceBooleanSettingResponseMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFBluetoothDeviceBooleanSettingResponse);
      v6->_unint64_t value = [(_AFBluetoothDeviceBooleanSettingResponseMutation *)v5 getValue];
      v6->_unint64_t status = [(_AFBluetoothDeviceBooleanSettingResponseMutation *)v5 getStatus];
    }
    else
    {
      unint64_t v6 = (AFBluetoothDeviceBooleanSettingResponse *)[(AFBluetoothDeviceBooleanSettingResponse *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFBluetoothDeviceBooleanSettingResponse *)[(AFBluetoothDeviceBooleanSettingResponse *)self copy];
  }

  return v6;
}

@end