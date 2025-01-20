@interface FSOperations
- (FSOperations)initWithType:(unsigned __int8)a3;
- (unsigned)fatEntryOffsetForCluster:(unsigned int)a3;
- (unsigned)fatType;
- (unsigned)getDirtyBitCluster;
- (unsigned)getDirtyBitMask;
- (unsigned)getDirtyBitValueForEntry:(char *)a3;
- (unsigned)getNextClusterFromEntryForCluster:(unsigned int)a3 entry:(char *)a4;
- (unsigned)numBytesPerClusterInFat;
- (unsigned)setFatEntryForCluster:(unsigned int)a3 entry:(char *)a4 withValue:(unsigned int)a5;
- (void)applyDirtyBitValueToEntry:(char *)a3 newValue:(unsigned __int8)a4;
- (void)setFatType:(unsigned __int8)a3;
@end

@implementation FSOperations

- (FSOperations)initWithType:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FSOperations;
  result = [(FSOperations *)&v5 init];
  result->_fatType = a3;
  return result;
}

- (unsigned)numBytesPerClusterInFat
{
  if (self->_fatType == 1) {
    unsigned int v2 = 2;
  }
  else {
    unsigned int v2 = 4;
  }
  if (self->_fatType) {
    return v2;
  }
  else {
    return 0;
  }
}

- (unsigned)fatEntryOffsetForCluster:(unsigned int)a3
{
  unsigned int v3 = 4 * a3;
  if (!self->_fatType) {
    unsigned int v3 = (3 * a3) >> 1;
  }
  if (self->_fatType == 1) {
    return 2 * a3;
  }
  else {
    return v3;
  }
}

- (unsigned)getNextClusterFromEntryForCluster:(unsigned int)a3 entry:(char *)a4
{
  if (self->_fatType == 1) {
    return *(unsigned __int16 *)a4;
  }
  if (self->_fatType) {
    return *(_DWORD *)a4 & 0xFFFFFFF;
  }
  unsigned int v4 = *(unsigned __int16 *)a4;
  unsigned int v5 = v4 >> 4;
  unsigned int v6 = v4 & 0xFFF;
  if (a3) {
    return v5;
  }
  else {
    return v6;
  }
}

- (unsigned)setFatEntryForCluster:(unsigned int)a3 entry:(char *)a4 withValue:(unsigned int)a5
{
  if (self->_fatType == 1)
  {
    unsigned int result = *(unsigned __int16 *)a4;
    *(_WORD *)a4 = a5;
  }
  else if (self->_fatType)
  {
    unsigned int result = *(_DWORD *)a4 & 0xFFFFFFF;
    *(_DWORD *)a4 = *(_DWORD *)a4 & 0xF0000000 | a5 & 0xFFFFFFF;
  }
  else
  {
    __int16 v5 = a4[1];
    unsigned int v6 = *a4 | (a4[1] << 8);
    if (a3)
    {
      *a4 = *a4 & 0xF | (16 * a5);
      a4[1] = a5 >> 4;
      return v6 >> 4;
    }
    else
    {
      *a4 = a5;
      a4[1] = (unsigned __int16)((v5 << 8) & 0xF000 | a5 & 0xFFF) >> 8;
      return v6 & 0xFFF;
    }
  }
  return result;
}

- (unsigned)getDirtyBitCluster
{
  return [(FSOperations *)self fatType] - 1 < 2;
}

- (unsigned)getDirtyBitMask
{
  unsigned int v2 = [(FSOperations *)self fatType];
  if (v2 == 1) {
    return 0x8000;
  }
  else {
    return (v2 == 2) << 27;
  }
}

- (unsigned)getDirtyBitValueForEntry:(char *)a3
{
  unsigned int v4 = [(FSOperations *)self getNextClusterFromEntryForCluster:[(FSOperations *)self getDirtyBitCluster] entry:a3];
  unsigned int v5 = [(FSOperations *)self getDirtyBitMask];
  if ([(FSOperations *)self fatType] - 1 >= 2) {
    return 2;
  }
  else {
    return (v5 & v4) == 0;
  }
}

- (void)applyDirtyBitValueToEntry:(char *)a3 newValue:(unsigned __int8)a4
{
  int v4 = a4;
  unsigned int v7 = [(FSOperations *)self getNextClusterFromEntryForCluster:[(FSOperations *)self getDirtyBitCluster] entry:a3];
  unsigned int v8 = [(FSOperations *)self getDirtyBitMask];
  if ([(FSOperations *)self fatType] - 1 <= 1)
  {
    if (v4 == 1) {
      uint64_t v9 = v7 & ~v8;
    }
    else {
      uint64_t v9 = v8 | v7;
    }
    uint64_t v10 = [(FSOperations *)self getDirtyBitCluster];
    [(FSOperations *)self setFatEntryForCluster:v10 entry:a3 withValue:v9];
  }
}

- (unsigned)fatType
{
  return self->_fatType;
}

- (void)setFatType:(unsigned __int8)a3
{
  self->_fatType = a3;
}

@end