@interface T1TPDUBlock
+ (BOOL)checkRedundacyCode:(id)a3 redundacyCode:(char)a4;
+ (id)blockWithData:(id)a3 redundacyCode:(char)a4 sequence:(char)a5 rcError:(BOOL *)a6;
+ (unsigned)nodeAddressWithSource:(unsigned __int8)a3 andDestination:(unsigned __int8)a4;
- (BOOL)needAck;
- (NSData)data;
- (NSData)informationField;
- (NSNumber)redundancyCode;
- (T1TPDUBlock)initWithData:(id)a3 needAck:(BOOL)a4;
- (char)blockType;
- (char)redundancyCodeType;
- (char)sequence;
- (id)blockSequenceStr;
- (id)blockTypeStr;
- (id)description;
- (unsigned)lengthByte;
- (unsigned)nodeAddressByte;
- (unsigned)protocolControlByte;
@end

@implementation T1TPDUBlock

- (T1TPDUBlock)initWithData:(id)a3 needAck:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)T1TPDUBlock;
  v8 = [(T1TPDUBlock *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_needAck = a4;
  }

  return v9;
}

- (id)blockTypeStr
{
  unsigned int v2 = [(T1TPDUBlock *)self blockType];
  CFStringRef v3 = @"I-Block";
  if (v2 == 1) {
    CFStringRef v3 = @"R-Block";
  }
  if (v2 == 2) {
    return @"S-Block";
  }
  else {
    return (id)v3;
  }
}

- (id)blockSequenceStr
{
  unsigned int v2 = [(T1TPDUBlock *)self sequence];
  CFStringRef v3 = @"Even";
  if (v2 == 1) {
    CFStringRef v3 = @"Odd";
  }
  if (v2 == 2) {
    return @"None";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  CFStringRef v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"nad: 0x%.2x ", -[T1TPDUBlock nodeAddressByte](self, "nodeAddressByte"));
  objc_msgSend(v3, "appendFormat:", @"pcb: 0x%.2x ", -[T1TPDUBlock protocolControlByte](self, "protocolControlByte"));
  objc_msgSend(v3, "appendFormat:", @"len: 0x%.2x ", -[T1TPDUBlock lengthByte](self, "lengthByte"));
  if ([(T1TPDUBlock *)self lengthByte])
  {
    v4 = [(T1TPDUBlock *)self informationField];
    [v3 appendFormat:@"infField: %@ ", v4];
  }
  unsigned int v5 = [(T1TPDUBlock *)self redundancyCodeType];
  v6 = [(T1TPDUBlock *)self redundancyCode];
  id v7 = v6;
  if (v5) {
    objc_msgSend(v3, "appendFormat:", @"crc: 0x%.4x ", objc_msgSend(v6, "unsignedShortValue"));
  }
  else {
    objc_msgSend(v3, "appendFormat:", @"lrc: 0x%.2x ", objc_msgSend(v6, "unsignedCharValue"));
  }

  v8 = [(T1TPDUBlock *)self blockTypeStr];
  [v3 appendFormat:@"blockType: %@ ", v8];

  v9 = [(T1TPDUBlock *)self blockSequenceStr];
  [v3 appendFormat:@"seq: %@ ", v9];

  return v3;
}

+ (id)blockWithData:(id)a3 redundacyCode:(char)a4 sequence:(char)a5 rcError:(BOOL *)a6
{
  uint64_t v7 = a4;
  id v8 = a3;
  v9 = v8;
  if (v8 && (unint64_t)[v8 length] > 3)
  {
    if (+[T1TPDUBlock checkRedundacyCode:v9 redundacyCode:v7])
    {
      id v13 = v9;
      v14 = [v13 bytes];
      if ((v14[1] & 0xC0) == 0x80) {
        v15 = off_1000243B8;
      }
      else {
        v15 = &off_1000243C0;
      }
      if ((char)v14[1] >= 0) {
        v15 = off_1000243B0;
      }
      id v11 = [objc_alloc(*v15) initWithData:v13];
    }
    else
    {
      v16 = sub_10000DF3C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001886C(v16);
      }

      id v11 = 0;
      *a6 = 1;
    }
  }
  else
  {
    v10 = sub_10000DF3C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100018828(v10);
    }

    id v11 = 0;
  }

  return v11;
}

+ (BOOL)checkRedundacyCode:(id)a3 redundacyCode:(char)a4
{
  int v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    unsigned __int8 v14 = 0;
    objc_msgSend(v5, "getBytes:range:", &v14, (char *)objc_msgSend(v5, "length") - 1, 1);
    int v7 = v14;
    id v8 = objc_msgSend(v6, "subdataWithRange:", 0, (char *)objc_msgSend(v6, "length") - 1);
    BOOL v9 = +[RedundancyCheck crc16:v8] == v7;
  }
  else if ([v5 length])
  {
    int v10 = 0;
    unint64_t v11 = 0;
    do
    {
      id v12 = v6;
      v10 ^= *((unsigned __int8 *)[v12 bytes] + v11++);
    }
    while (v11 < (unint64_t)[v12 length]);
    BOOL v9 = v10 == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (unsigned)nodeAddressWithSource:(unsigned __int8)a3 andDestination:(unsigned __int8)a4
{
  return a3 & 7 | (16 * (a4 & 7));
}

- (unsigned)nodeAddressByte
{
  id v2 = [(T1TPDUBlock *)self data];
  unsigned __int8 v3 = *(unsigned char *)[v2 bytes];

  return v3;
}

- (unsigned)protocolControlByte
{
  id v2 = [(T1TPDUBlock *)self data];
  unsigned __int8 v3 = *((unsigned char *)[v2 bytes] + 1);

  return v3;
}

- (unsigned)lengthByte
{
  id v2 = [(T1TPDUBlock *)self data];
  unsigned __int8 v3 = *((unsigned char *)[v2 bytes] + 2);

  return v3;
}

- (NSData)informationField
{
  if ([(T1TPDUBlock *)self lengthByte])
  {
    unsigned __int8 v3 = [(T1TPDUBlock *)self data];
    int v4 = objc_msgSend(v3, "subdataWithRange:", 3, -[T1TPDUBlock lengthByte](self, "lengthByte"));
  }
  else
  {
    int v4 = 0;
  }

  return (NSData *)v4;
}

- (NSNumber)redundancyCode
{
  unsigned __int8 v3 = [(T1TPDUBlock *)self data];
  int v4 = (char *)[v3 length];
  id v5 = &v4[-[(T1TPDUBlock *)self lengthByte]];

  if (v5 == (char *)4)
  {
    id v6 = [(T1TPDUBlock *)self data];
    int v7 = (unsigned __int8 *)[v6 bytes];
    id v8 = [(T1TPDUBlock *)self data];
    uint64_t v9 = v7[(void)[v8 length] - 1];

    int v10 = +[NSNumber numberWithUnsignedChar:v9];
  }
  else
  {
    unsigned __int16 v14 = 0;
    unint64_t v11 = [(T1TPDUBlock *)self data];
    id v12 = [(T1TPDUBlock *)self data];
    objc_msgSend(v11, "getBytes:range:", &v14, (char *)objc_msgSend(v12, "length") - 2, 2);

    int v10 = +[NSNumber numberWithUnsignedShort:v14];
  }

  return (NSNumber *)v10;
}

- (char)blockType
{
  if (([(T1TPDUBlock *)self protocolControlByte] & 0x80) == 0) {
    return 0;
  }
  if (([(T1TPDUBlock *)self protocolControlByte] & 0xC0) == 0x80) {
    return 1;
  }
  return 2;
}

- (char)redundancyCodeType
{
  id v2 = self;
  unsigned __int8 v3 = [(T1TPDUBlock *)self data];
  int v4 = (char *)[v3 length];
  LOBYTE(v2) = &v4[-[(T1TPDUBlock *)v2 lengthByte]] != (char *)4;

  return (char)v2;
}

- (char)sequence
{
  return 2;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)needAck
{
  return self->_needAck;
}

- (void).cxx_destruct
{
}

@end