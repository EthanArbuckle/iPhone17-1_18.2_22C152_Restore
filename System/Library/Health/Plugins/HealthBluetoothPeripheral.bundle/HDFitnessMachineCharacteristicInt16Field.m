@interface HDFitnessMachineCharacteristicInt16Field
- (id)valueAsData;
- (signed)value;
- (void)setValue:(signed __int16)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicInt16Field

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  signed int v5 = +[HDHealthServiceCharacteristic int16FromData:a3 before:a4];
  *((_WORD *)&self->super._isSet + 1) = v5 / [(HDFitnessMachineCharacteristicField *)self factor];
  self->super._isSet = 1;
}

- (id)valueAsData
{
  double v3 = (double)[(HDFitnessMachineCharacteristicInt16Field *)self value];

  return sub_3DFB8(self, v3);
}

- (signed)value
{
  return *((_WORD *)&self->super._isSet + 1);
}

- (void)setValue:(signed __int16)a3
{
  *((_WORD *)&self->super._isSet + 1) = a3;
}

@end