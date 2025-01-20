@interface AVCRTCPReceiverReport
- (AVCRTCPReceiverReport)initWithRTCPPacket:(tagRTCPPACKET *)a3;
- (id)description;
- (unsigned)cumulativePacketsLost;
- (unsigned)delaySinceLastSR;
- (unsigned)extendedHighestSequenceNumber;
- (unsigned)fractionLost;
- (unsigned)interarrivalJitter;
- (unsigned)lastSRTimestamp;
- (unsigned)reportedSourceSSRC;
- (void)setCumulativePacketsLost:(unsigned int)a3;
- (void)setDelaySinceLastSR:(unsigned int)a3;
- (void)setExtendedHighestSequenceNumber:(unsigned int)a3;
- (void)setFractionLost:(unsigned __int8)a3;
- (void)setInterarrivalJitter:(unsigned int)a3;
- (void)setLastSRTimestamp:(unsigned int)a3;
- (void)setReportedSourceSSRC:(unsigned int)a3;
@end

@implementation AVCRTCPReceiverReport

- (AVCRTCPReceiverReport)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVCRTCPReceiverReport;
  result = -[AVCRTCPPacket initWithRTCPPacket:](&v5, sel_initWithRTCPPacket_);
  if (result && (*(_WORD *)&a3->var0 & 0x1F) != 0)
  {
    result->_reportedSourceSSRC = a3->var1.var0.var1;
    result->_fractionLost = a3->var1.var0.var2;
    result->_cumulativePacketsLost = a3->var1.var0.var2 >> 8;
    result->_extendedHighestSequenceNumber = a3->var1.var0.var3;
    result->_interarrivalJitter = a3->var1.var0.var4;
    result->_lastSRTimestamp = a3->var1.var0.var5;
    result->_delaySinceLastSR = a3->var1.var0.var6[0].var0;
  }
  else
  {

    return 0;
  }
  return result;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPReceiverReport;
  return (id)[NSString stringWithFormat:@"%@, reportedSourceSSRC:%u, fractionLost:%u, cumulativePacketsLost:%u, extendedHighestSequenceNumber:%u, interarrivalJitter:%u, lastSRTimestamp:%u, delaySinceLastSR:%u", -[AVCRTCPPacket description](&v3, sel_description), -[AVCRTCPReceiverReport reportedSourceSSRC](self, "reportedSourceSSRC"), -[AVCRTCPReceiverReport fractionLost](self, "fractionLost"), -[AVCRTCPReceiverReport cumulativePacketsLost](self, "cumulativePacketsLost"), -[AVCRTCPReceiverReport extendedHighestSequenceNumber](self, "extendedHighestSequenceNumber"), -[AVCRTCPReceiverReport interarrivalJitter](self, "interarrivalJitter"), -[AVCRTCPReceiverReport lastSRTimestamp](self, "lastSRTimestamp"), -[AVCRTCPReceiverReport delaySinceLastSR](self, "delaySinceLastSR")];
}

- (unsigned)reportedSourceSSRC
{
  return self->_reportedSourceSSRC;
}

- (void)setReportedSourceSSRC:(unsigned int)a3
{
  self->_reportedSourceSSRC = a3;
}

- (unsigned)fractionLost
{
  return self->_fractionLost;
}

- (void)setFractionLost:(unsigned __int8)a3
{
  self->_fractionLost = a3;
}

- (unsigned)cumulativePacketsLost
{
  return self->_cumulativePacketsLost;
}

- (void)setCumulativePacketsLost:(unsigned int)a3
{
  self->_cumulativePacketsLost = a3;
}

- (unsigned)extendedHighestSequenceNumber
{
  return self->_extendedHighestSequenceNumber;
}

- (void)setExtendedHighestSequenceNumber:(unsigned int)a3
{
  self->_extendedHighestSequenceNumber = a3;
}

- (unsigned)interarrivalJitter
{
  return self->_interarrivalJitter;
}

- (void)setInterarrivalJitter:(unsigned int)a3
{
  self->_interarrivalJitter = a3;
}

- (unsigned)lastSRTimestamp
{
  return self->_lastSRTimestamp;
}

- (void)setLastSRTimestamp:(unsigned int)a3
{
  self->_lastSRTimestamp = a3;
}

- (unsigned)delaySinceLastSR
{
  return self->_delaySinceLastSR;
}

- (void)setDelaySinceLastSR:(unsigned int)a3
{
  self->_delaySinceLastSR = a3;
}

@end