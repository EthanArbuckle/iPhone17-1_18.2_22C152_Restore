@interface ProtocolDataView
- (ProtocolDataView)initWithData:(id)a3;
- (ProtocolDataView)initWithLength:(unint64_t)a3;
- (unsigned)bClockStop;
- (unsigned)bGuardTime;
- (unsigned)bmFindexDindex;
- (unsigned)bmTCCKS;
- (void)setBClockStop:(unsigned __int8)a3;
- (void)setBGuardTime:(unsigned __int8)a3;
- (void)setBmFindexDindex:(unsigned __int8)a3;
- (void)setBmTCCKS:(unsigned __int8)a3;
@end

@implementation ProtocolDataView

- (ProtocolDataView)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProtocolDataView;
  return [(TKDataView *)&v4 initWithLength:a3];
}

- (ProtocolDataView)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProtocolDataView;
  return [(TKDataView *)&v4 initWithData:a3];
}

- (unsigned)bmFindexDindex
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 0, 1);

  return v4;
}

- (void)setBmFindexDindex:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 0, 1, &v4);
}

- (unsigned)bmTCCKS
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 1, 1);

  return v4;
}

- (void)setBmTCCKS:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 1, 1, &v4);
}

- (unsigned)bGuardTime
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 2, 1);

  return v4;
}

- (void)setBGuardTime:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 2, 1, &v4);
}

- (unsigned)bClockStop
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 4, 1);

  return v4;
}

- (void)setBClockStop:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 4, 1, &v4);
}

@end