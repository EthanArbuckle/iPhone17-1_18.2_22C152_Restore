@interface ProtocolT0DataView
+ (id)createWithData:(id)a3;
+ (unint64_t)length;
- (ProtocolT0DataView)init;
- (id)description;
- (unsigned)bWaitingInteger;
- (void)setBWaitingInteger:(unsigned __int8)a3;
@end

@implementation ProtocolT0DataView

- (ProtocolT0DataView)init
{
  v3.receiver = self;
  v3.super_class = (Class)ProtocolT0DataView;
  return [(ProtocolDataView *)&v3 initWithLength:+[ProtocolT0DataView length]];
}

- (id)description
{
  objc_super v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"{ protocol: T0 bmFindexDindex: 0x%.2x ", -[ProtocolDataView bmFindexDindex](self, "bmFindexDindex"));
  objc_msgSend(v3, "appendFormat:", @"bmTCCKS: %d ", -[ProtocolDataView bmTCCKS](self, "bmTCCKS"));
  objc_msgSend(v3, "appendFormat:", @"bGuardTime: %d ", -[ProtocolDataView bGuardTime](self, "bGuardTime"));
  objc_msgSend(v3, "appendFormat:", @"bWaitingInteger: %d ", -[ProtocolT0DataView bWaitingInteger](self, "bWaitingInteger"));
  objc_msgSend(v3, "appendFormat:", @"bClockStop: %d }", -[ProtocolDataView bClockStop](self, "bClockStop"));

  return v3;
}

- (unsigned)bWaitingInteger
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 3, 1);

  return v4;
}

- (void)setBWaitingInteger:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  objc_super v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 3, 1, &v4);
}

+ (unint64_t)length
{
  return 5;
}

+ (id)createWithData:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(ProtocolDataView *)[ProtocolT0DataView alloc] initWithData:v3];

  return v4;
}

@end