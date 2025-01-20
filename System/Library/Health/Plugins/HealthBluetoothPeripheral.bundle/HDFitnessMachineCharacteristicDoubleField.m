@interface HDFitnessMachineCharacteristicDoubleField
- (BOOL)isSigned;
- (double)value;
- (id)valueAsData;
- (void)setIsSigned:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicDoubleField

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  if (!*a3) {
    return;
  }
  unsigned int v7 = [(HDFitnessMachineCharacteristicField *)self fieldLength];
  v8 = *a3;
  if (&(*a3)[v7] > a4)
  {
    *(void *)&self->_isSigned = 0;
    *a3 = 0;
    return;
  }
  uint64_t v9 = v7;
  if ([(HDFitnessMachineCharacteristicDoubleField *)self isSigned])
  {
    BOOL v10 = v8[v9 - 1] >= 0;
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v10 = 1;
    if (v9)
    {
LABEL_6:
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        int v13 = *(unsigned __int8 *)v8++;
        v12 |= v13 << v11;
        v11 += 8;
      }
      while (8 * v9 != v11);
      goto LABEL_11;
    }
  }
  uint64_t v12 = 0;
LABEL_11:
  if (v9 > 7) {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 9 - v9;
    do
    {
      uint64_t v14 = (v14 << 8) | 0xFF00;
      --v15;
    }
    while (v15 > 1);
    v12 |= v14 << 8;
  }
  *a3 += v9;
  *(double *)&self->_isSigned = (double)v12 / (double)[(HDFitnessMachineCharacteristicField *)self factor];
  self->super._isSet = 1;
}

- (id)valueAsData
{
  [(HDFitnessMachineCharacteristicDoubleField *)self value];

  return sub_3DFB8(self, v3);
}

- (double)value
{
  return *(double *)&self->_isSigned;
}

- (void)setValue:(double)a3
{
  *(double *)&self->_isSigned = a3;
}

- (BOOL)isSigned
{
  return *(&self->super._isSet + 1);
}

- (void)setIsSigned:(BOOL)a3
{
  *(&self->super._isSet + 1) = a3;
}

@end