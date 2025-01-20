@interface HDFitnessMachineCharacteristicUInt8Field
- (id)valueAsData;
- (unsigned)value;
- (void)setValue:(unsigned __int8)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicUInt8Field

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  unsigned int v5 = +[HDHealthServiceCharacteristic uint8FromData:a3 before:a4];
  *(&self->super._isSet + 1) = v5 / [(HDFitnessMachineCharacteristicField *)self factor];
  self->super._isSet = 1;
}

- (id)valueAsData
{
  double v3 = (double)[(HDFitnessMachineCharacteristicUInt8Field *)self value];

  return sub_3DFB8(self, v3);
}

- (unsigned)value
{
  return *(&self->super._isSet + 1);
}

- (void)setValue:(unsigned __int8)a3
{
  *(&self->super._isSet + 1) = a3;
}

@end