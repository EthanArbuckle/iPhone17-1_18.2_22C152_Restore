@interface _AFBluetoothHeadGestureConfigurationMutation
- (BOOL)getIsEnabled;
- (BOOL)getIsSupported;
- (BOOL)isDirty;
- (_AFBluetoothHeadGestureConfigurationMutation)initWithBase:(id)a3;
- (int64_t)getAcceptGesture;
- (int64_t)getRejectGesture;
- (void)setAcceptGesture:(int64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setRejectGesture:(int64_t)a3;
@end

@implementation _AFBluetoothHeadGestureConfigurationMutation

- (void).cxx_destruct
{
}

- (void)setRejectGesture:(int64_t)a3
{
  self->_rejectGesture = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getRejectGesture
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_rejectGesture;
  }
  else {
    return [(AFBluetoothHeadGestureConfiguration *)self->_base rejectGesture];
  }
}

- (void)setAcceptGesture:(int64_t)a3
{
  self->_acceptGesture = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getAcceptGesture
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_acceptGesture;
  }
  else {
    return [(AFBluetoothHeadGestureConfiguration *)self->_base acceptGesture];
  }
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsSupported
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_isSupported;
  }
  else {
    return [(AFBluetoothHeadGestureConfiguration *)self->_base isSupported];
  }
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsEnabled
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_isEnabled;
  }
  else {
    return [(AFBluetoothHeadGestureConfiguration *)self->_base isEnabled];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFBluetoothHeadGestureConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothHeadGestureConfigurationMutation;
  v6 = [(_AFBluetoothHeadGestureConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end