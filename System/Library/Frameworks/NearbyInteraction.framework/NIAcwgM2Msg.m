@interface NIAcwgM2Msg
+ (BOOL)supportsSecureCoding;
+ (id)fromStruct:(AcwgM2MsgStruct)a3;
- (AcwgM2MsgStruct)toStruct;
- (NIAcwgM2Msg)initWithCoder:(id)a3;
- (NIAcwgM2Msg)initWithSelectedUwbConfigId:(unsigned __int16)a3 selectedPulseShapeCombo:(unsigned __int8)a4 selectedChannelBitmask:(unsigned __int8)a5 supportedSyncCodeIndexBitmask:(unsigned int)a6 minRanMultiplier:(unsigned __int8)a7 supportedSlotBitmask:(unsigned __int8)a8 supportedHoppingConfigBitmask:(unsigned __int8)a9;
- (NIAcwgM2Msg)initWithSelectedUwbConfigId:(unsigned __int16)a3 selectedPulseShapeCombo:(unsigned __int8)a4 selectedChannelBitmask:(unsigned __int8)a5 supportedSyncCodeIndexBitmask:(unsigned int)a6 minRanMultiplier:(unsigned __int8)a7 supportedSlotBitmask:(unsigned __int8)a8 supportedHoppingConfigBitmask:(unsigned __int8)a9 selectedFinalData2Bitmask:(unsigned __int8)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)minRanMultiplier;
- (unsigned)selectedChannelBitmask;
- (unsigned)selectedFinalData2Bitmask;
- (unsigned)selectedPulseShapeCombo;
- (unsigned)selectedUwbConfigId;
- (unsigned)supportedHoppingConfigBitmask;
- (unsigned)supportedSlotBitmask;
- (unsigned)supportedSyncCodeIndexBitmask;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIAcwgM2Msg

- (NIAcwgM2Msg)initWithSelectedUwbConfigId:(unsigned __int16)a3 selectedPulseShapeCombo:(unsigned __int8)a4 selectedChannelBitmask:(unsigned __int8)a5 supportedSyncCodeIndexBitmask:(unsigned int)a6 minRanMultiplier:(unsigned __int8)a7 supportedSlotBitmask:(unsigned __int8)a8 supportedHoppingConfigBitmask:(unsigned __int8)a9
{
  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM2Msg;
  result = [(NIAcwgM2Msg *)&v16 init];
  if (result)
  {
    result->_selectedUwbConfigId = a3;
    result->_selectedPulseShapeCombo = a4;
    result->_selectedChannelBitmask = a5;
    result->_supportedSyncCodeIndexBitmask = a6;
    result->_minRanMultiplier = a7;
    result->_supportedSlotBitmask = a8;
    *(_WORD *)&result->_supportedHoppingConfigBitmask = a9;
  }
  return result;
}

- (NIAcwgM2Msg)initWithSelectedUwbConfigId:(unsigned __int16)a3 selectedPulseShapeCombo:(unsigned __int8)a4 selectedChannelBitmask:(unsigned __int8)a5 supportedSyncCodeIndexBitmask:(unsigned int)a6 minRanMultiplier:(unsigned __int8)a7 supportedSlotBitmask:(unsigned __int8)a8 supportedHoppingConfigBitmask:(unsigned __int8)a9 selectedFinalData2Bitmask:(unsigned __int8)a10
{
  LOBYTE(v11) = a9;
  result = [(NIAcwgM2Msg *)self initWithSelectedUwbConfigId:a3 selectedPulseShapeCombo:a4 selectedChannelBitmask:a5 supportedSyncCodeIndexBitmask:*(void *)&a6 minRanMultiplier:a7 supportedSlotBitmask:a8 supportedHoppingConfigBitmask:v11];
  if (result) {
    result->_selectedFinalData2Bitmask = a10;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:\n", v5];

  objc_msgSend(v6, "appendFormat:", @"selectedUwbConfigId:%u\n", self->_selectedUwbConfigId);
  objc_msgSend(v6, "appendFormat:", @"selectedPulseShapeCombo:%u\n", self->_selectedPulseShapeCombo);
  objc_msgSend(v6, "appendFormat:", @"selectedChannelBitmask:0x%02x\n", self->_selectedChannelBitmask);
  objc_msgSend(v6, "appendFormat:", @"supportedSyncCodeIndexBitmask:0x%08x\n", self->_supportedSyncCodeIndexBitmask);
  objc_msgSend(v6, "appendFormat:", @"minRanMultiplier:%u\n", self->_minRanMultiplier);
  objc_msgSend(v6, "appendFormat:", @"supportedSlotBitmask:0x%02x\n", self->_supportedSlotBitmask);
  objc_msgSend(v6, "appendFormat:", @"supportedHoppingConfigBitmask:0x%02x\n", self->_supportedHoppingConfigBitmask);
  objc_msgSend(v6, "appendFormat:", @"selectedFinalData2Bitmask:0x%02x>", self->_selectedFinalData2Bitmask);

  return v6;
}

- (AcwgM2MsgStruct)toStruct
{
  int v2 = *(_DWORD *)&self->_minRanMultiplier;
  unint64_t v3 = self->_selectedUwbConfigId | ((unint64_t)self->_selectedPulseShapeCombo << 16) | ((unint64_t)self->_selectedChannelBitmask << 24) | ((unint64_t)self->_supportedSyncCodeIndexBitmask << 32);
  result.var0 = v3;
  result.var1 = BYTE2(v3);
  result.var2 = BYTE3(v3);
  result.var3 = HIDWORD(v3);
  result.var4 = v2;
  result.var5 = BYTE1(v2);
  result.var6 = BYTE2(v2);
  result.var7 = HIBYTE(v2);
  return result;
}

+ (id)fromStruct:(AcwgM2MsgStruct)a3
{
  BYTE1(v5) = a3.var7;
  LOBYTE(v5) = a3.var6;
  unint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minRanMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:selectedFinalData2Bitmask:", a3.var0, a3.var1, a3.var2, a3.var3, a3.var4, a3.var5, v5);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOWORD(v6) = *(_WORD *)&self->_supportedHoppingConfigBitmask;
  return (id)objc_msgSend(v4, "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minRanMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:selectedFinalData2Bitmask:", self->_selectedUwbConfigId, self->_selectedPulseShapeCombo, self->_selectedChannelBitmask, self->_supportedSyncCodeIndexBitmask, self->_minRanMultiplier, self->_supportedSlotBitmask, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_selectedUwbConfigId forKey:@"selectedUwbConfigId"];
  [v4 encodeInt:self->_selectedPulseShapeCombo forKey:@"selectedPulseShapeCombo"];
  [v4 encodeInt:self->_selectedChannelBitmask forKey:@"selectedChannelBitmask"];
  [v4 encodeInt64:self->_supportedSyncCodeIndexBitmask forKey:@"supportedSyncCodeIndexBitmask"];
  [v4 encodeInt:self->_minRanMultiplier forKey:@"minRanMultiplier"];
  [v4 encodeInt:self->_supportedSlotBitmask forKey:@"supportedSlotBitmask"];
  [v4 encodeInt:self->_supportedHoppingConfigBitmask forKey:@"supportedHoppingConfigBitmask"];
  [v4 encodeInt:self->_selectedFinalData2Bitmask forKey:@"selectedFinalData2Bitmask"];
}

- (NIAcwgM2Msg)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self)
  {
    self->_selectedUwbConfigId = [v4 decodeIntForKey:@"selectedUwbConfigId"];
    self->_selectedPulseShapeCombo = [v5 decodeIntForKey:@"selectedPulseShapeCombo"];
    self->_selectedChannelBitmask = [v5 decodeIntForKey:@"selectedChannelBitmask"];
    self->_supportedSyncCodeIndexBitmask = [v5 decodeInt64ForKey:@"supportedSyncCodeIndexBitmask"];
    self->_minRanMultiplier = [v5 decodeIntForKey:@"minRanMultiplier"];
    self->_supportedSlotBitmask = [v5 decodeIntForKey:@"supportedSlotBitmask"];
    self->_supportedHoppingConfigBitmask = [v5 decodeIntForKey:@"supportedHoppingConfigBitmask"];
    self->_selectedFinalData2Bitmask = [v5 decodeIntForKey:@"selectedFinalData2Bitmask"];
  }

  return self;
}

- (unsigned)selectedUwbConfigId
{
  return self->_selectedUwbConfigId;
}

- (unsigned)selectedPulseShapeCombo
{
  return self->_selectedPulseShapeCombo;
}

- (unsigned)selectedChannelBitmask
{
  return self->_selectedChannelBitmask;
}

- (unsigned)supportedSyncCodeIndexBitmask
{
  return self->_supportedSyncCodeIndexBitmask;
}

- (unsigned)minRanMultiplier
{
  return self->_minRanMultiplier;
}

- (unsigned)supportedSlotBitmask
{
  return self->_supportedSlotBitmask;
}

- (unsigned)supportedHoppingConfigBitmask
{
  return self->_supportedHoppingConfigBitmask;
}

- (unsigned)selectedFinalData2Bitmask
{
  return self->_selectedFinalData2Bitmask;
}

@end