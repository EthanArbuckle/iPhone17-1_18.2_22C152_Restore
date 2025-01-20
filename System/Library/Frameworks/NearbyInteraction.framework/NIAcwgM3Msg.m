@interface NIAcwgM3Msg
+ (BOOL)supportsSecureCoding;
- (AcwgM3MsgStruct)toStruct;
- (NIAcwgM3Msg)initWithCoder:(id)a3;
- (NIAcwgM3Msg)initWithSelectedRanMultiplier:(unsigned __int8)a3 selectedNumChapsPerSlot:(unsigned __int8)a4 numResponders:(unsigned __int8)a5 numSlotsPerRound:(unsigned __int8)a6 supportedSyncCodeIndexBitmask:(unsigned int)a7 selectedHoppingConfigBitmask:(unsigned __int8)a8 macMode:(unsigned __int8)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)macMode;
- (unsigned)numResponders;
- (unsigned)numSlotsPerRound;
- (unsigned)selectedHoppingConfigBitmask;
- (unsigned)selectedNumChapsPerSlot;
- (unsigned)selectedRanMultiplier;
- (unsigned)supportedSyncCodeIndexBitmask;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIAcwgM3Msg

- (NIAcwgM3Msg)initWithSelectedRanMultiplier:(unsigned __int8)a3 selectedNumChapsPerSlot:(unsigned __int8)a4 numResponders:(unsigned __int8)a5 numSlotsPerRound:(unsigned __int8)a6 supportedSyncCodeIndexBitmask:(unsigned int)a7 selectedHoppingConfigBitmask:(unsigned __int8)a8 macMode:(unsigned __int8)a9
{
  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM3Msg;
  result = [(NIAcwgM3Msg *)&v16 init];
  if (result)
  {
    result->_selectedRanMultiplier = a3;
    result->_selectedNumChapsPerSlot = a4;
    result->_numResponders = a5;
    result->_numSlotsPerRound = a6;
    result->_supportedSyncCodeIndexBitmask = a7;
    result->_selectedHoppingConfigBitmask = a8;
    result->_macMode = a9;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:\n", v5];

  objc_msgSend(v6, "appendFormat:", @"selectedRanMultiplier:%u\n", self->_selectedRanMultiplier);
  objc_msgSend(v6, "appendFormat:", @"selectedNumChapsPerSlot:%u\n", self->_selectedNumChapsPerSlot);
  objc_msgSend(v6, "appendFormat:", @"numResponders:%u\n", self->_numResponders);
  objc_msgSend(v6, "appendFormat:", @"numSlotsPerRound:%u\n", self->_numSlotsPerRound);
  objc_msgSend(v6, "appendFormat:", @"supportedSyncCodeIndexBitmask:0x%08x\n", self->_supportedSyncCodeIndexBitmask);
  objc_msgSend(v6, "appendFormat:", @"selectedHoppingConfigBitmask:0x%02x\n", self->_selectedHoppingConfigBitmask);
  objc_msgSend(v6, "appendFormat:", @"macMode:%u>", self->_macMode);

  return v6;
}

- (AcwgM3MsgStruct)toStruct
{
  int v2 = *(unsigned __int16 *)&self->_selectedHoppingConfigBitmask;
  unint64_t v3 = *(unsigned int *)&self->_selectedRanMultiplier | ((unint64_t)self->_supportedSyncCodeIndexBitmask << 32);
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = HIDWORD(v3);
  result.var5 = v2;
  result.var6 = BYTE1(v2);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_macMode;
  return (id)[v4 initWithSelectedRanMultiplier:self->_selectedRanMultiplier selectedNumChapsPerSlot:self->_selectedNumChapsPerSlot numResponders:self->_numResponders numSlotsPerRound:self->_numSlotsPerRound supportedSyncCodeIndexBitmask:self->_supportedSyncCodeIndexBitmask selectedHoppingConfigBitmask:self->_selectedHoppingConfigBitmask macMode:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_selectedRanMultiplier forKey:@"selectedRanMultiplier"];
  [v4 encodeInt:self->_selectedNumChapsPerSlot forKey:@"selectedNumChapsPerSlot"];
  [v4 encodeInt:self->_numResponders forKey:@"numResponders"];
  [v4 encodeInt:self->_numSlotsPerRound forKey:@"numSlotsPerRound"];
  [v4 encodeInt64:self->_supportedSyncCodeIndexBitmask forKey:@"supportedSyncCodeIndexBitmask"];
  [v4 encodeInt:self->_selectedHoppingConfigBitmask forKey:@"selectedHoppingConfigBitmask"];
  [v4 encodeInt:self->_macMode forKey:@"macMode"];
}

- (NIAcwgM3Msg)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_selectedRanMultiplier = [v4 decodeIntForKey:@"selectedRanMultiplier"];
    self->_selectedNumChapsPerSlot = [v5 decodeIntForKey:@"selectedNumChapsPerSlot"];
    self->_numResponders = [v5 decodeIntForKey:@"numResponders"];
    self->_numSlotsPerRound = [v5 decodeIntForKey:@"numSlotsPerRound"];
    self->_supportedSyncCodeIndexBitmask = [v5 decodeInt64ForKey:@"supportedSyncCodeIndexBitmask"];
    self->_selectedHoppingConfigBitmask = [v5 decodeIntForKey:@"selectedHoppingConfigBitmask"];
    self->_macMode = [v5 decodeIntForKey:@"macMode"];
  }

  return self;
}

- (unsigned)selectedRanMultiplier
{
  return self->_selectedRanMultiplier;
}

- (unsigned)selectedNumChapsPerSlot
{
  return self->_selectedNumChapsPerSlot;
}

- (unsigned)numResponders
{
  return self->_numResponders;
}

- (unsigned)numSlotsPerRound
{
  return self->_numSlotsPerRound;
}

- (unsigned)supportedSyncCodeIndexBitmask
{
  return self->_supportedSyncCodeIndexBitmask;
}

- (unsigned)selectedHoppingConfigBitmask
{
  return self->_selectedHoppingConfigBitmask;
}

- (unsigned)macMode
{
  return self->_macMode;
}

@end