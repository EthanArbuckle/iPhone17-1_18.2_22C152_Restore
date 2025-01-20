@interface AVCRTCPSenderReport
- (AVCRTCPReceiverReport)receiverReport;
- (AVCRTCPSenderReport)initWithRTCPPacket:(tagRTCPPACKET *)a3;
- (id)description;
- (unsigned)NTPLeastSignificantWord;
- (unsigned)NTPMostSignificantWord;
- (unsigned)RTPTimestamp;
- (unsigned)octetsSent;
- (unsigned)packetsSent;
- (void)dealloc;
- (void)setNTPLeastSignificantWord:(unsigned int)a3;
- (void)setNTPMostSignificantWord:(unsigned int)a3;
- (void)setOctetsSent:(unsigned int)a3;
- (void)setPacketsSent:(unsigned int)a3;
- (void)setRTPTimestamp:(unsigned int)a3;
- (void)setReceiverReport:(id)a3;
@end

@implementation AVCRTCPSenderReport

- (AVCRTCPSenderReport)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v13, 170, sizeof(v13));
  v9.receiver = self;
  v9.super_class = (Class)AVCRTCPSenderReport;
  v5 = [(AVCRTCPPacket *)&v9 initWithRTCPPacket:a3];
  v6 = v5;
  if (v5)
  {
    v5->_NTPMostSignificantWord = a3->var1.var0.var1;
    v5->_NTPLeastSignificantWord = a3->var1.var0.var2;
    v5->_RTPTimestamp = a3->var1.var0.var3;
    v5->_packetsSent = a3->var1.var0.var4;
    v5->_octetsSent = a3->var1.var0.var5;
    if ((*(unsigned char *)&a3->var0 & 0x1F) != 0)
    {
      __int16 v7 = *(void *)&a3->var0 | 0xC900;
      uint64_t v10 = *(void *)&a3->var0;
      LOWORD(v10) = v7;
      long long v11 = *(_OWORD *)&a3->var1.var22.var1.var0[16];
      uint64_t v12 = *((void *)&a3->var1.var22 + 5);
      v5->_receiverReport = [[AVCRTCPReceiverReport alloc] initWithRTCPPacket:&v10];
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSenderReport;
  [(AVCRTCPSenderReport *)&v3 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSenderReport;
  return (id)[NSString stringWithFormat:@"%@, NTPMostSignificantWord:%u, NTPLeastSignificantWord:%u, RTPTimestamp:%u, packetsSent:%u, octetsSent:%u, receiverReport:%@", -[AVCRTCPPacket description](&v3, sel_description), -[AVCRTCPSenderReport NTPMostSignificantWord](self, "NTPMostSignificantWord"), -[AVCRTCPSenderReport NTPLeastSignificantWord](self, "NTPLeastSignificantWord"), -[AVCRTCPSenderReport RTPTimestamp](self, "RTPTimestamp"), -[AVCRTCPSenderReport packetsSent](self, "packetsSent"), -[AVCRTCPSenderReport octetsSent](self, "octetsSent"), -[AVCRTCPSenderReport receiverReport](self, "receiverReport")];
}

- (unsigned)NTPMostSignificantWord
{
  return self->_NTPMostSignificantWord;
}

- (void)setNTPMostSignificantWord:(unsigned int)a3
{
  self->_NTPMostSignificantWord = a3;
}

- (unsigned)NTPLeastSignificantWord
{
  return self->_NTPLeastSignificantWord;
}

- (void)setNTPLeastSignificantWord:(unsigned int)a3
{
  self->_NTPLeastSignificantWord = a3;
}

- (unsigned)RTPTimestamp
{
  return self->_RTPTimestamp;
}

- (void)setRTPTimestamp:(unsigned int)a3
{
  self->_RTPTimestamp = a3;
}

- (unsigned)packetsSent
{
  return self->_packetsSent;
}

- (void)setPacketsSent:(unsigned int)a3
{
  self->_packetsSent = a3;
}

- (unsigned)octetsSent
{
  return self->_octetsSent;
}

- (void)setOctetsSent:(unsigned int)a3
{
  self->_octetsSent = a3;
}

- (AVCRTCPReceiverReport)receiverReport
{
  return self->_receiverReport;
}

- (void)setReceiverReport:(id)a3
{
}

@end