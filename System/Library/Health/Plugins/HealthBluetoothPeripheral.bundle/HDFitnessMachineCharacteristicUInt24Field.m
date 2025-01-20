@interface HDFitnessMachineCharacteristicUInt24Field
- (id)valueAsData;
- (unsigned)value;
- (void)setValue:(unsigned int)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicUInt24Field

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  unsigned int v5 = +[HDHealthServiceCharacteristic uint24FromData:a3 before:a4];
  self->_value = v5 / [(HDFitnessMachineCharacteristicField *)self factor];
  self->super._isSet = 1;
}

- (id)valueAsData
{
  double v3 = (double)[(HDFitnessMachineCharacteristicUInt24Field *)self value];

  return sub_3DFB8(self, v3);
}

- (unsigned)value
{
  return self->_value;
}

- (void)setValue:(unsigned int)a3
{
  self->_value = a3;
}

@end