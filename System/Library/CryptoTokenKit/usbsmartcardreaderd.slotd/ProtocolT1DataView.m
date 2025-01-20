@interface ProtocolT1DataView
+ (id)createWithData:(id)a3;
+ (unint64_t)length;
- (ProtocolT1DataView)init;
- (id)description;
- (unsigned)bIFSC;
- (unsigned)bNadValue;
- (unsigned)bmWaitingIntegers;
- (void)setBIFSC:(unsigned __int8)a3;
- (void)setBNadValue:(unsigned __int8)a3;
- (void)setBmWaitingIntegers:(unsigned __int8)a3;
@end

@implementation ProtocolT1DataView

- (ProtocolT1DataView)init
{
  v3.receiver = self;
  v3.super_class = (Class)ProtocolT1DataView;
  return [(ProtocolDataView *)&v3 initWithLength:+[ProtocolT1DataView length]];
}

- (id)description
{
  objc_super v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"{ protocol: T1 bmFindexDindex: 0x%.2x ", -[ProtocolDataView bmFindexDindex](self, "bmFindexDindex"));
  objc_msgSend(v3, "appendFormat:", @"bmTCCKST: %d ", -[ProtocolDataView bmTCCKS](self, "bmTCCKS"));
  objc_msgSend(v3, "appendFormat:", @"bGuardTime: %d ", -[ProtocolDataView bGuardTime](self, "bGuardTime"));
  objc_msgSend(v3, "appendFormat:", @"bmWaitingIntegers: 0x%1x ", -[ProtocolT1DataView bmWaitingIntegers](self, "bmWaitingIntegers"));
  objc_msgSend(v3, "appendFormat:", @"bClockStop: %d ", -[ProtocolDataView bClockStop](self, "bClockStop"));
  objc_msgSend(v3, "appendFormat:", @"bIFSC: %d ", -[ProtocolT1DataView bIFSC](self, "bIFSC"));
  objc_msgSend(v3, "appendFormat:", @"bNadValue: %d }", -[ProtocolT1DataView bNadValue](self, "bNadValue"));

  return v3;
}

- (unsigned)bmWaitingIntegers
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 3, 1);

  return v4;
}

- (void)setBmWaitingIntegers:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  objc_super v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 3, 1, &v4);
}

- (unsigned)bIFSC
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 5, 1);

  return v4;
}

- (void)setBIFSC:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  objc_super v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 5, 1, &v4);
}

- (unsigned)bNadValue
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 6, 1);

  return v4;
}

- (void)setBNadValue:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  objc_super v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 6, 1, &v4);
}

+ (unint64_t)length
{
  return 7;
}

+ (id)createWithData:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(ProtocolDataView *)[ProtocolT1DataView alloc] initWithData:v3];

  return v4;
}

@end