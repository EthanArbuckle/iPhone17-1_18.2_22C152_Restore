@interface T1InformationBlock
+ (id)informationBlockWithNad:(unsigned __int8)a3 sequence:(char)a4 moreData:(BOOL)a5 informationField:(id)a6 redundancyCode:(char)a7;
- (BOOL)moreData;
- (T1InformationBlock)initWithData:(id)a3;
- (char)sequence;
- (id)description;
@end

@implementation T1InformationBlock

- (T1InformationBlock)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)T1InformationBlock;
  return [(T1TPDUBlock *)&v4 initWithData:a3 needAck:1];
}

- (id)description
{
  v3 = +[NSMutableString string];
  v6.receiver = self;
  v6.super_class = (Class)T1InformationBlock;
  objc_super v4 = [(T1TPDUBlock *)&v6 description];
  [v3 appendFormat:@"{ %@", v4];

  objc_msgSend(v3, "appendFormat:", @"moreData: %d }", -[T1InformationBlock moreData](self, "moreData"));

  return v3;
}

+ (id)informationBlockWithNad:(unsigned __int8)a3 sequence:(char)a4 moreData:(BOOL)a5 informationField:(id)a6 redundancyCode:(char)a7
{
  int v7 = a7;
  BOOL v8 = a5;
  char v9 = a4 != 0;
  unsigned __int8 v22 = a3;
  id v10 = a6;
  v11 = +[NSMutableData data];
  [v11 appendBytes:&v22 length:1];
  char v12 = v9 << 6;
  if (v8) {
    char v12 = ((v9 & 1) << 6) | 0x20;
  }
  char v21 = v12;
  [v11 appendBytes:&v21 length:1];
  unsigned __int8 v20 = [v10 length];
  [v11 appendBytes:&v20 length:1];
  if ([v10 length]) {
    [v11 appendData:v10];
  }
  if (v7)
  {
    unsigned __int16 v18 = +[RedundancyCheck crc16:v11];
    v13 = &v18;
    v14 = v11;
    uint64_t v15 = 2;
  }
  else
  {
    unsigned __int8 v19 = +[RedundancyCheck lrc:v11];
    v13 = (unsigned __int16 *)&v19;
    v14 = v11;
    uint64_t v15 = 1;
  }
  [v14 appendBytes:v13 length:v15];
  v16 = [[T1InformationBlock alloc] initWithData:v11];

  return v16;
}

- (BOOL)moreData
{
  return ([(T1TPDUBlock *)self protocolControlByte] >> 5) & 1;
}

- (char)sequence
{
  return ([(T1TPDUBlock *)self protocolControlByte] >> 6) & 1;
}

@end