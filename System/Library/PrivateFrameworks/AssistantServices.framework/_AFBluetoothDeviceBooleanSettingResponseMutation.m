@interface _AFBluetoothDeviceBooleanSettingResponseMutation
- (BOOL)isDirty;
- (_AFBluetoothDeviceBooleanSettingResponseMutation)initWithBase:(id)a3;
- (int64_t)getStatus;
- (int64_t)getValue;
- (void)setStatus:(int64_t)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation _AFBluetoothDeviceBooleanSettingResponseMutation

- (void).cxx_destruct
{
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getStatus
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_status;
  }
  else {
    return [(AFBluetoothDeviceBooleanSettingResponse *)self->_base status];
  }
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getValue
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_value;
  }
  else {
    return [(AFBluetoothDeviceBooleanSettingResponse *)self->_base value];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFBluetoothDeviceBooleanSettingResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothDeviceBooleanSettingResponseMutation;
  v6 = [(_AFBluetoothDeviceBooleanSettingResponseMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end