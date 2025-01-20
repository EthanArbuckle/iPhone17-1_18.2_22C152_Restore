@interface _AFBluetoothHeadphoneInEarDetectionStateMutation
- (BOOL)getIsEnabled;
- (BOOL)isDirty;
- (_AFBluetoothHeadphoneInEarDetectionStateMutation)initWithBase:(id)a3;
- (int64_t)getPrimaryEarbudSide;
- (int64_t)getPrimaryInEarStatus;
- (int64_t)getSecondaryInEarStatus;
- (void)setIsEnabled:(BOOL)a3;
- (void)setPrimaryEarbudSide:(int64_t)a3;
- (void)setPrimaryInEarStatus:(int64_t)a3;
- (void)setSecondaryInEarStatus:(int64_t)a3;
@end

@implementation _AFBluetoothHeadphoneInEarDetectionStateMutation

- (void).cxx_destruct
{
}

- (void)setSecondaryInEarStatus:(int64_t)a3
{
  self->_secondaryInEarStatus = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getSecondaryInEarStatus
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_secondaryInEarStatus;
  }
  else {
    return [(AFBluetoothHeadphoneInEarDetectionState *)self->_base secondaryInEarStatus];
  }
}

- (void)setPrimaryInEarStatus:(int64_t)a3
{
  self->_primaryInEarStatus = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getPrimaryInEarStatus
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_primaryInEarStatus;
  }
  else {
    return [(AFBluetoothHeadphoneInEarDetectionState *)self->_base primaryInEarStatus];
  }
}

- (void)setPrimaryEarbudSide:(int64_t)a3
{
  self->_primaryEarbudSide = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getPrimaryEarbudSide
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_primaryEarbudSide;
  }
  else {
    return [(AFBluetoothHeadphoneInEarDetectionState *)self->_base primaryEarbudSide];
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
    return [(AFBluetoothHeadphoneInEarDetectionState *)self->_base isEnabled];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFBluetoothHeadphoneInEarDetectionStateMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothHeadphoneInEarDetectionStateMutation;
  v6 = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end