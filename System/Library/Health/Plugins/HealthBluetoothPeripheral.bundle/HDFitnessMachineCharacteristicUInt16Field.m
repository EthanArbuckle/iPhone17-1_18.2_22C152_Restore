@interface HDFitnessMachineCharacteristicUInt16Field
- (id)valueAsData;
- (unsigned)value;
- (void)setValue:(unsigned __int16)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicUInt16Field

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  unsigned int v5 = +[HDHealthServiceCharacteristic uint16FromData:a3 before:a4];
  *((_WORD *)&self->super._isSet + 1) = v5 / [(HDFitnessMachineCharacteristicField *)self factor];
  self->super._isSet = 1;
}

- (id)valueAsData
{
  double v3 = (double)[(HDFitnessMachineCharacteristicUInt16Field *)self value];

  return sub_3DFB8(self, v3);
}

- (unsigned)value
{
  return *((_WORD *)&self->super._isSet + 1);
}

- (void)setValue:(unsigned __int16)a3
{
  *((_WORD *)&self->super._isSet + 1) = a3;
}

@end