@interface VCEmulatedPacket
- (BOOL)isDroppedByAQM;
- (BOOL)isLost;
- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3;
- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3 datagram:(char *)a4 datagramSize:(unsigned int)a5;
- (char)datagram;
- (double)arrivalTime;
- (double)departureTime;
- (double)networkServiceTime;
- (int64_t)type;
- (tagIDSDatagramStruct)metadata;
- (unsigned)packetID;
- (unsigned)sequenceNumber;
- (unsigned)size;
- (void)setArrivalTime:(double)a3;
- (void)setDatagram:(char *)a3;
- (void)setDepartureTime:(double)a3;
- (void)setIsDroppedByAQM:(BOOL)a3;
- (void)setIsLost:(BOOL)a3;
- (void)setMetadata:(tagIDSDatagramStruct *)a3;
- (void)setNetworkServiceTime:(double)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setSize:(unsigned int)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VCEmulatedPacket

- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCEmulatedPacket;
  result = [(VCEmulatedPacket *)&v5 init];
  if (result) {
    result->_packetID = a3;
  }
  return result;
}

- (VCEmulatedPacket)initWithPacketID:(unsigned int)a3 datagram:(char *)a4 datagramSize:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCEmulatedPacket;
  v8 = [(VCEmulatedPacket *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_packetID = a3;
    v8->_size = a5;
    if (a4 && a5 < 0x5DD)
    {
      memcpy(v8->_datagram, a4, a5);
      v9->_datagramPtr = (char *)v9->_datagram;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          v17 = "-[VCEmulatedPacket initWithPacketID:datagram:datagramSize:]";
          __int16 v18 = 1024;
          int v19 = 51;
          __int16 v20 = 2048;
          v21 = a4;
          __int16 v22 = 1024;
          unsigned int v23 = a5;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create VCEmualtedPacket with datagram: %p, datagramSize: %d", buf, 0x2Cu);
        }
      }

      return 0;
    }
  }
  return v9;
}

- (unsigned)packetID
{
  return self->_packetID;
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (double)arrivalTime
{
  return self->_arrivalTime;
}

- (void)setArrivalTime:(double)a3
{
  self->_arrivalTime = a3;
}

- (double)networkServiceTime
{
  return self->_networkServiceTime;
}

- (void)setNetworkServiceTime:(double)a3
{
  self->_networkServiceTime = a3;
}

- (double)departureTime
{
  return self->_departureTime;
}

- (void)setDepartureTime:(double)a3
{
  self->_departureTime = a3;
}

- (BOOL)isLost
{
  return self->_isLost;
}

- (void)setIsLost:(BOOL)a3
{
  self->_isLost = a3;
}

- (BOOL)isDroppedByAQM
{
  return self->_isDroppedByAQM;
}

- (void)setIsDroppedByAQM:(BOOL)a3
{
  self->_isDroppedByAQM = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (char)datagram
{
  return self->_datagramPtr;
}

- (void)setDatagram:(char *)a3
{
  self->_datagramPtr = a3;
}

- (tagIDSDatagramStruct)metadata
{
  objc_copyStruct(retstr, &self->_metadata, 1640, 1, 0);
  return result;
}

- (void)setMetadata:(tagIDSDatagramStruct *)a3
{
}

@end