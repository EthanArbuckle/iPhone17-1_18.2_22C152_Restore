@interface CCIDMessageView
+ (id)create:(unsigned __int8)a3;
+ (id)create:(unsigned __int8)a3 withPayload:(id)a4;
+ (id)createWithData:(id)a3;
+ (unint64_t)length;
- (CCIDMessageView)initWithData:(id)a3;
- (CCIDMessageView)initWithLength:(unint64_t)a3;
- (CCIDSlotStatus)status;
- (NSData)aPayload;
- (char)bError;
- (id)ICCStatusToString:(unsigned __int8)a3;
- (id)commandStatusToString:(unsigned __int8)a3;
- (id)description;
- (id)errorToString:(char)a3;
- (id)messageTypeToString:(unsigned __int8)a3;
- (unsigned)bBWI;
- (unsigned)bChainParameter;
- (unsigned)bPowerSelect;
- (unsigned)bProtocolNum;
- (unsigned)bSeq;
- (unsigned)bSlot;
- (unsigned)dwLength;
- (unsigned)messageType;
- (unsigned)wLevelParameter;
- (void)setBBWI:(unsigned __int8)a3;
- (void)setBChainParameter:(unsigned __int8)a3;
- (void)setBError:(char)a3;
- (void)setBPowerSelect:(unsigned __int8)a3;
- (void)setBProtocolNum:(unsigned __int8)a3;
- (void)setBSeq:(unsigned __int8)a3;
- (void)setBSlot:(unsigned __int8)a3;
- (void)setDwLength:(unsigned int)a3;
- (void)setMessageType:(unsigned __int8)a3;
- (void)setPayload:(id)a3;
- (void)setStatus:(id)a3;
- (void)setWLevelParameter:(unsigned __int16)a3;
@end

@implementation CCIDMessageView

- (CCIDMessageView)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCIDMessageView;
  return [(TKDataView *)&v4 initWithLength:a3];
}

- (CCIDMessageView)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCIDMessageView;
  return [(TKDataView *)&v4 initWithData:a3];
}

+ (id)create:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_super v4 = [CCIDMessageView alloc];
  v5 = [(CCIDMessageView *)v4 initWithLength:qword_10002C1F0];
  [(CCIDMessageView *)v5 setMessageType:v3];
  [(CCIDMessageView *)v5 setDwLength:0];

  return v5;
}

+ (id)createWithData:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[CCIDMessageView alloc] initWithData:v3];

  return v4;
}

+ (id)create:(unsigned __int8)a3 withPayload:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  id v6 = [v5 length];
  v7 = [CCIDMessageView alloc];
  v8 = [(CCIDMessageView *)v7 initWithLength:qword_10002C1F0 + v6];
  [(CCIDMessageView *)v8 setMessageType:v4];
  [(CCIDMessageView *)v8 setDwLength:v6];
  [(CCIDMessageView *)v8 setPayload:v5];

  return v8;
}

- (id)messageTypeToString:(unsigned __int8)a3
{
  uint64_t v4 = @"PC_to_RDR_IccPowerOn";
  switch(a3)
  {
    case 'P':
      uint64_t v4 = @"RDR_to_PC_NotifySlotChange";
      break;
    case 'Q':
      uint64_t v4 = @"RDR_to_PC_HardwareError";
      break;
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'd':
    case 'f':
    case 'g':
    case 'h':
    case 'p':
LABEL_9:
      uint64_t v4 = +[NSString stringWithFormat:@"Unknown(%.2x)", a3];
      goto LABEL_10;
    case 'a':
      uint64_t v4 = @"PC_to_RDR_SetParameters";
      break;
    case 'b':
LABEL_10:
      break;
    case 'c':
      uint64_t v4 = @"PC_to_RDR_IccPowerOff";
      break;
    case 'e':
      uint64_t v4 = @"PC_to_RDR_GetSlotStatus";
      break;
    case 'i':
      uint64_t v4 = @"PC_to_RDR_Secure";
      break;
    case 'j':
      uint64_t v4 = @"PC_to_RDR_T0APDU";
      break;
    case 'k':
      uint64_t v4 = @"PC_to_RDR_Escape";
      break;
    case 'l':
      uint64_t v4 = @"PC_to_RDR_GetParameters";
      break;
    case 'm':
      uint64_t v4 = @"PC_to_RDR_ResetParameters";
      break;
    case 'n':
      uint64_t v4 = @"PC_to_RDR_IccClock";
      break;
    case 'o':
      uint64_t v4 = @"PC_to_RDR_XfrBlock";
      break;
    case 'q':
      uint64_t v4 = @"PC_to_RDR_Mechanical";
      break;
    case 'r':
      uint64_t v4 = @"PC_to_RDR_Abort";
      break;
    case 's':
      uint64_t v4 = @"PC_to_RDR_SetDataRateAndClockFrequency";
      break;
    default:
      switch(a3)
      {
        case 0x80u:
          uint64_t v4 = @"RDR_to_PC_DataBlock";
          break;
        case 0x81u:
          uint64_t v4 = @"RDR_to_PC_SlotStatus";
          break;
        case 0x82u:
          uint64_t v4 = @"RDR_to_PC_Parameters";
          break;
        case 0x83u:
          uint64_t v4 = @"RDR_to_PC_Escape";
          break;
        case 0x84u:
          uint64_t v4 = @"RDR_to_PC_DataRateAndClockFrequency";
          break;
        default:
          goto LABEL_9;
      }
      break;
  }
  return v4;
}

- (id)errorToString:(char)a3
{
  uint64_t v3 = a3 + 32;
  if v3 < 0x21 && ((0x1F9FD8001uLL >> v3))
  {
    uint64_t v4 = *(&off_100024AD0 + v3);
  }
  else
  {
    uint64_t v4 = +[NSString stringWithFormat:@"0x%.2x", a3];
  }

  return v4;
}

- (id)ICCStatusToString:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"Undefined";
  }
  else {
    return *(&off_100024BD8 + (char)a3);
  }
}

- (id)commandStatusToString:(unsigned __int8)a3
{
  CFStringRef v3 = @"TimeExtension";
  CFStringRef v4 = @"Undefined";
  if (a3 == 64) {
    CFStringRef v4 = @"Failed";
  }
  if (a3 != 128) {
    CFStringRef v3 = v4;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"OK";
  }
}

- (id)description
{
  CFStringRef v3 = +[NSMutableString string];
  CFStringRef v4 = [(CCIDMessageView *)self messageTypeToString:[(CCIDMessageView *)self messageType]];
  [v3 appendFormat:@"{ messageType: %@ ", v4];

  objc_msgSend(v3, "appendFormat:", @"dwLength: %d ", -[CCIDMessageView dwLength](self, "dwLength"));
  objc_msgSend(v3, "appendFormat:", @"bSlot: %d ", -[CCIDMessageView bSlot](self, "bSlot"));
  objc_msgSend(v3, "appendFormat:", @"bSeq: %d ", -[CCIDMessageView bSeq](self, "bSeq"));
  objc_msgSend(v3, "appendFormat:", @"bChainParameter: %d ", -[CCIDMessageView bChainParameter](self, "bChainParameter"));
  if ([(CCIDMessageView *)self messageType] == 128
    || [(CCIDMessageView *)self messageType] == 129
    || [(CCIDMessageView *)self messageType] == 130
    || [(CCIDMessageView *)self messageType] == 132)
  {
    [v3 appendString:@"errorAndStatus: { "];
    id v5 = [(CCIDMessageView *)self status];
    id v6 = -[CCIDMessageView ICCStatusToString:](self, "ICCStatusToString:", [v5 bmICCStatus]);
    [v3 appendFormat:@"bmICCStatus: %@ ", v6];

    v7 = [(CCIDMessageView *)self status];
    v8 = -[CCIDMessageView commandStatusToString:](self, "commandStatusToString:", [v7 bmCommandStatus]);
    [v3 appendFormat:@"bmCommandStatus: %@ ", v8];

    v9 = [(CCIDMessageView *)self status];
    if ([v9 bmCommandStatus])
    {
    }
    else
    {
      unsigned int v10 = [(CCIDMessageView *)self bError];

      if (!v10)
      {
LABEL_9:
        [v3 appendString:@" }"];
        goto LABEL_10;
      }
    }
    v11 = [(CCIDMessageView *)self errorToString:[(CCIDMessageView *)self bError]];
    [v3 appendFormat:@"bError: %@ ", v11];

    goto LABEL_9;
  }
  if ([(CCIDMessageView *)self messageType] == 98) {
    objc_msgSend(v3, "appendFormat:", @"bPowerSelect: %d ", -[CCIDMessageView bPowerSelect](self, "bPowerSelect"));
  }
LABEL_10:
  [v3 appendString:@" }"];

  return v3;
}

- (unsigned)messageType
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 0, 1);

  return v4;
}

- (void)setMessageType:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 0, 1, &v4);
}

- (unsigned)dwLength
{
  unsigned int v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 1, 4);

  return v4;
}

- (void)setDwLength:(unsigned int)a3
{
  unsigned int v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 1, 4, &v4);
}

- (unsigned)bSlot
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 5, 1);

  return v4;
}

- (void)setBSlot:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 5, 1, &v4);
}

- (unsigned)bSeq
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 6, 1);

  return v4;
}

- (void)setBSeq:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 6, 1, &v4);
}

- (CCIDSlotStatus)status
{
  CFStringRef v3 = objc_opt_new();
  unsigned __int8 v4 = [(TKDataView *)self buffer];
  objc_msgSend(v4, "getBytes:range:", objc_msgSend(v3, "statusPtr"), 7, 1);

  return (CCIDSlotStatus *)v3;
}

- (void)setStatus:(id)a3
{
  id v4 = a3;
  id v6 = [(TKDataView *)self mutableBuffer];
  id v5 = [v4 statusPtr];

  objc_msgSend(v6, "replaceBytesInRange:withBytes:", 7, 1, v5);
}

- (unsigned)bBWI
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 7, 1);

  return v4;
}

- (void)setBBWI:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 7, 1, &v4);
}

- (unsigned)bPowerSelect
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 7, 1);

  return v4;
}

- (void)setBPowerSelect:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 7, 1, &v4);
}

- (unsigned)bProtocolNum
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 7, 1);

  return v4;
}

- (void)setBProtocolNum:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 7, 1, &v4);
}

- (char)bError
{
  char v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 8, 1);

  return v4;
}

- (void)setBError:(char)a3
{
  char v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 8, 1, &v4);
}

- (unsigned)wLevelParameter
{
  unsigned __int16 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 8, 2);

  return v4;
}

- (void)setWLevelParameter:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 8, 2, &v4);
}

- (unsigned)bChainParameter
{
  unsigned __int8 v4 = 0;
  v2 = [(TKDataView *)self buffer];
  objc_msgSend(v2, "getBytes:range:", &v4, 9, 1);

  return v4;
}

- (void)setBChainParameter:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  CFStringRef v3 = [(TKDataView *)self mutableBuffer];
  objc_msgSend(v3, "replaceBytesInRange:withBytes:", 8, 1, &v4);
}

- (NSData)aPayload
{
  CFStringRef v3 = [(TKDataView *)self buffer];
  id v4 = [v3 length];
  unint64_t v5 = qword_10002C1F0;

  if ((unint64_t)v4 <= v5)
  {
    unsigned int v10 = 0;
  }
  else
  {
    id v6 = [(TKDataView *)self buffer];
    uint64_t v7 = qword_10002C1F0;
    v8 = [(TKDataView *)self buffer];
    v9 = (char *)[v8 length];
    unsigned int v10 = objc_msgSend(v6, "subdataWithRange:", v7, &v9[-qword_10002C1F0]);
  }

  return (NSData *)v10;
}

- (void)setPayload:(id)a3
{
  id v4 = a3;
  id v9 = [(TKDataView *)self mutableBuffer];
  uint64_t v5 = qword_10002C1F0;
  id v6 = [v4 length];
  id v7 = v4;
  id v8 = [v7 bytes];

  objc_msgSend(v9, "replaceBytesInRange:withBytes:", v5, v6, v8);
}

+ (unint64_t)length
{
  return qword_10002C1F0;
}

@end