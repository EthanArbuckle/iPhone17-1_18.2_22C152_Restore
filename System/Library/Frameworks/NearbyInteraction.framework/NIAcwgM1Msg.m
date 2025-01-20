@interface NIAcwgM1Msg
+ (BOOL)supportsSecureCoding;
- (AcwgM1MsgStruct)toStruct;
- (NIAcwgM1Msg)initWithCoder:(id)a3;
- (NIAcwgM1Msg)initWithSupportedUwbConfigIds:(id)a3 supportedPulseShapeCombos:(id)a4 channelBitmask:(unsigned __int8)a5 uwbSessionId:(unsigned int)a6;
- (NIAcwgM1Msg)initWithSupportedUwbConfigIds:(id)a3 supportedPulseShapeCombos:(id)a4 channelBitmask:(unsigned __int8)a5 uwbSessionId:(unsigned int)a6 finalData2Bitmask:(unsigned __int8)a7;
- (NSArray)supportedPulseShapeCombos;
- (NSArray)supportedUwbConfigIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)channelBitmask;
- (unsigned)finalData2Bitmask;
- (unsigned)uwbSessionId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIAcwgM1Msg

- (NIAcwgM1Msg)initWithSupportedUwbConfigIds:(id)a3 supportedPulseShapeCombos:(id)a4 channelBitmask:(unsigned __int8)a5 uwbSessionId:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM1Msg;
  v13 = [(NIAcwgM1Msg *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_supportedUwbConfigIds, a3);
    objc_storeStrong((id *)&v14->_supportedPulseShapeCombos, a4);
    v14->_channelBitmask = a5;
    v14->_uwbSessionId = a6;
    v14->_finalData2Bitmask = 0;
  }

  return v14;
}

- (NIAcwgM1Msg)initWithSupportedUwbConfigIds:(id)a3 supportedPulseShapeCombos:(id)a4 channelBitmask:(unsigned __int8)a5 uwbSessionId:(unsigned int)a6 finalData2Bitmask:(unsigned __int8)a7
{
  result = [(NIAcwgM1Msg *)self initWithSupportedUwbConfigIds:a3 supportedPulseShapeCombos:a4 channelBitmask:a5 uwbSessionId:*(void *)&a6];
  if (result) {
    result->_finalData2Bitmask = a7;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:\n", v5];

  [v6 appendFormat:@"supportedUwbConfigIds:%@\n", self->_supportedUwbConfigIds];
  [v6 appendFormat:@"supportedPulseShapeCombos:%@\n", self->_supportedPulseShapeCombos];
  objc_msgSend(v6, "appendFormat:", @"channelBitmask:0x%02x\n", self->_channelBitmask);
  objc_msgSend(v6, "appendFormat:", @"uwbSessionId:0x%08x (%u)\n", self->_uwbSessionId, self->_uwbSessionId);
  objc_msgSend(v6, "appendFormat:", @"finalData2Bitmask:0x%02x>", self->_finalData2Bitmask);

  return v6;
}

- (AcwgM1MsgStruct)toStruct
{
  nsNumberArrayToStdVector<unsigned short>(self->_supportedUwbConfigIds, (uint64_t)v7);
  nsNumberArrayToStdVector<unsigned char>(self->_supportedPulseShapeCombos, (uint64_t *)__p);
  rose::alisha::AcwgM1MsgStruct::AcwgM1MsgStruct((uint64_t)retstr, (uint64_t)v7, (uint64_t)__p, self->_channelBitmask, self->_uwbSessionId, self->_finalData2Bitmask);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  result = (AcwgM1MsgStruct *)v7[0];
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  supportedUwbConfigIds = self->_supportedUwbConfigIds;
  supportedPulseShapeCombos = self->_supportedPulseShapeCombos;
  uint64_t channelBitmask = self->_channelBitmask;
  uint64_t uwbSessionId = self->_uwbSessionId;
  finalData2Bitmask = self->_finalData2Bitmask;

  return (id)[v4 initWithSupportedUwbConfigIds:supportedUwbConfigIds supportedPulseShapeCombos:supportedPulseShapeCombos channelBitmask:channelBitmask uwbSessionId:uwbSessionId finalData2Bitmask:finalData2Bitmask];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_supportedUwbConfigIds forKey:@"supportedUwbConfigIds"];
  [v4 encodeObject:self->_supportedPulseShapeCombos forKey:@"supportedPulseShapeCombos"];
  [v4 encodeInt:self->_channelBitmask forKey:@"channelBitmask"];
  [v4 encodeInt64:self->_uwbSessionId forKey:@"uwbSessionId"];
  [v4 encodeInt:self->_finalData2Bitmask forKey:@"finalData2Bitmask"];
}

- (NIAcwgM1Msg)initWithCoder:(id)a3
{
  id v4 = a3;
  if (self)
  {
    v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedUwbConfigIds"];
    supportedUwbConfigIds = self->_supportedUwbConfigIds;
    self->_supportedUwbConfigIds = v5;

    v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedPulseShapeCombos"];
    supportedPulseShapeCombos = self->_supportedPulseShapeCombos;
    self->_supportedPulseShapeCombos = v7;

    self->_uint64_t channelBitmask = [v4 decodeIntForKey:@"channelBitmask"];
    self->_uint64_t uwbSessionId = [v4 decodeInt64ForKey:@"uwbSessionId"];
    self->_finalData2Bitmask = [v4 decodeIntForKey:@"finalData2Bitmask"];
  }

  return self;
}

- (NSArray)supportedUwbConfigIds
{
  return self->_supportedUwbConfigIds;
}

- (NSArray)supportedPulseShapeCombos
{
  return self->_supportedPulseShapeCombos;
}

- (unsigned)channelBitmask
{
  return self->_channelBitmask;
}

- (unsigned)uwbSessionId
{
  return self->_uwbSessionId;
}

- (unsigned)finalData2Bitmask
{
  return self->_finalData2Bitmask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPulseShapeCombos, 0);

  objc_storeStrong((id *)&self->_supportedUwbConfigIds, 0);
}

@end