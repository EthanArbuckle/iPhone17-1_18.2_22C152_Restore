@interface PINModificationDataView
+ (id)createWithInteraction:(id)a3 error:(id *)a4;
+ (unint64_t)lengthFromNumberMessage:(unsigned __int8)a3;
- (NSString)description;
- (unsigned)bConfirmPIN;
- (unsigned)bEntryValidationCondition;
- (unsigned)bInsertionOffsetNew;
- (unsigned)bInsertionOffsetOld;
- (unsigned)bMsgIndex1;
- (unsigned)bMsgIndex2;
- (unsigned)bMsgIndex3;
- (unsigned)bNumberMessage;
- (unsigned)lengthByte;
- (unsigned)nodeAddressByte;
- (unsigned)protocolControlByte;
- (unsigned)wLangId;
- (unsigned)wPINMaxExtraDigit;
- (void)setBConfirmPIN:(unsigned __int8)a3;
- (void)setBEntryValidationCondition:(unsigned __int8)a3;
- (void)setBInsertionOffsetNew:(unsigned __int8)a3;
- (void)setBInsertionOffsetOld:(unsigned __int8)a3;
- (void)setBMsgIndex1:(unsigned __int8)a3;
- (void)setBMsgIndex2:(unsigned __int8)a3;
- (void)setBMsgIndex3:(unsigned __int8)a3;
- (void)setLengthByte:(unsigned __int8)a3;
- (void)setNodeAddressByte:(unsigned __int8)a3;
- (void)setNumberMessage:(unsigned __int8)a3;
- (void)setProtocolControlByte:(unsigned __int8)a3;
- (void)setWLangId:(unsigned __int16)a3;
- (void)setWPINMaxExtraDigit:(unsigned __int16)a3;
@end

@implementation PINModificationDataView

+ (id)createWithInteraction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 PINMessageIndices];
  unsigned __int8 v7 = [v6 count];

  v8 = [(PINOperationDataView *)[PINModificationDataView alloc] initWithLength:+[PINModificationDataView lengthFromNumberMessage:v7]];
  [(PINOperationDataView *)v8 setBPINOperation:1];
  [v5 initialTimeout];
  [(PINOperationDataView *)v8 setBTimeOut:(int)v9];
  v10 = [v5 PINFormat];
  id v28 = 0;
  id v11 = [v10 PINFormatStringWithError:&v28];
  id v12 = v28;
  [(PINOperationDataView *)v8 setBmFormatString:v11];

  if (v12)
  {
    if (a4)
    {
LABEL_3:
      id v12 = v12;
      v13 = 0;
      *a4 = v12;
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  v14 = [v5 PINFormat];
  -[PINOperationDataView setBmPINBlockString:](v8, "setBmPINBlockString:", [v14 PINBlockString]);

  v15 = [v5 PINFormat];
  id v27 = 0;
  id v16 = [v15 PINLengthFormatWithError:&v27];
  id v12 = v27;
  [(PINOperationDataView *)v8 setBmPINLengthFormat:v16];

  if (v12)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_14;
  }
  -[PINModificationDataView setBInsertionOffsetOld:](v8, "setBInsertionOffsetOld:", [v5 currentPINByteOffset]);
  -[PINModificationDataView setBInsertionOffsetNew:](v8, "setBInsertionOffsetNew:", [v5 newPINByteOffset]);
  v17 = [v5 PINFormat];
  -[PINModificationDataView setWPINMaxExtraDigit:](v8, "setWPINMaxExtraDigit:", [v17 PINMaxExtraDigit]);

  -[PINModificationDataView setBConfirmPIN:](v8, "setBConfirmPIN:", [v5 PINConfirmation]);
  -[PINModificationDataView setBEntryValidationCondition:](v8, "setBEntryValidationCondition:", [v5 PINCompletion]);
  [(PINModificationDataView *)v8 setNumberMessage:v7];
  -[PINModificationDataView setWLangId:](v8, "setWLangId:", [v5 localeID]);
  v18 = [v5 PINMessageIndices];
  if ([v18 count])
  {
    v19 = [v5 PINMessageIndices];
    v20 = [v19 objectAtIndexedSubscript:0];
    -[PINModificationDataView setBMsgIndex1:](v8, "setBMsgIndex1:", [v20 unsignedCharValue]);
  }
  else
  {
    [(PINModificationDataView *)v8 setBMsgIndex1:0];
  }

  int v21 = v7;
  if (v7 >= 2u)
  {
    v22 = [v5 PINMessageIndices];
    v23 = [v22 objectAtIndexedSubscript:1];
    -[PINModificationDataView setBMsgIndex2:](v8, "setBMsgIndex2:", [v23 unsignedCharValue]);

    if (v21 != 2)
    {
      v24 = [v5 PINMessageIndices];
      v25 = [v24 objectAtIndexedSubscript:2];
      -[PINModificationDataView setBMsgIndex3:](v8, "setBMsgIndex3:", [v25 unsignedCharValue]);
    }
  }
  [(PINModificationDataView *)v8 setNodeAddressByte:0];
  [(PINModificationDataView *)v8 setProtocolControlByte:0];
  [(PINModificationDataView *)v8 setLengthByte:0];
  v13 = v8;
  id v12 = 0;
LABEL_14:

  return v13;
}

+ (unint64_t)lengthFromNumberMessage:(unsigned __int8)a3
{
  unint64_t v3 = 19;
  if (a3 == 3) {
    unint64_t v3 = 20;
  }
  if (a3) {
    return v3;
  }
  else {
    return 18;
  }
}

- (NSString)description
{
  unint64_t v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"{ bTimeOut: 0x%.2x ", -[PINOperationDataView bTimeOut](self, "bTimeOut"));
  objc_msgSend(v3, "appendFormat:", @"bmFormatString: 0x%.2x ", -[PINOperationDataView bmFormatString](self, "bmFormatString"));
  objc_msgSend(v3, "appendFormat:", @"bmPINBlockString: 0x%.2x ", -[PINOperationDataView bmPINBlockString](self, "bmPINBlockString"));
  objc_msgSend(v3, "appendFormat:", @"bmPINLengthFormat: 0x%.2x ", -[PINOperationDataView bmPINLengthFormat](self, "bmPINLengthFormat"));
  objc_msgSend(v3, "appendFormat:", @"bInsertionOffsetOld: 0x%.2x ", -[PINModificationDataView bInsertionOffsetOld](self, "bInsertionOffsetOld"));
  objc_msgSend(v3, "appendFormat:", @"bInsertionOffsetNew: 0x%.2x ", -[PINModificationDataView bInsertionOffsetNew](self, "bInsertionOffsetNew"));
  objc_msgSend(v3, "appendFormat:", @"wPINMaxExtraDigit: 0x%.4x ", -[PINModificationDataView wPINMaxExtraDigit](self, "wPINMaxExtraDigit"));
  objc_msgSend(v3, "appendFormat:", @"bConfirmPIN: 0x%.2x ", -[PINModificationDataView bConfirmPIN](self, "bConfirmPIN"));
  objc_msgSend(v3, "appendFormat:", @"bEntryValidationCondition: 0x%.2x ", -[PINModificationDataView bEntryValidationCondition](self, "bEntryValidationCondition"));
  objc_msgSend(v3, "appendFormat:", @"bNumberMessage: 0x%.2x ", -[PINModificationDataView bNumberMessage](self, "bNumberMessage"));
  objc_msgSend(v3, "appendFormat:", @"wLangId: 0x%.4x ", -[PINModificationDataView wLangId](self, "wLangId"));
  objc_msgSend(v3, "appendFormat:", @"bMsgIndex1: 0x%.2x ", -[PINModificationDataView bMsgIndex1](self, "bMsgIndex1"));
  objc_msgSend(v3, "appendFormat:", @"bMsgIndex2: 0x%.2x ", -[PINModificationDataView bMsgIndex2](self, "bMsgIndex2"));
  objc_msgSend(v3, "appendFormat:", @"bMsgIndex3: 0x%.2x ", -[PINModificationDataView bMsgIndex3](self, "bMsgIndex3"));
  objc_msgSend(v3, "appendFormat:", @"nodeAddressByte: 0x%.2x ", -[PINModificationDataView nodeAddressByte](self, "nodeAddressByte"));
  objc_msgSend(v3, "appendFormat:", @"protocolControlByte: 0x%.2x ", -[PINModificationDataView protocolControlByte](self, "protocolControlByte"));
  objc_msgSend(v3, "appendFormat:", @"lengthByte: 0x%.2x }", -[PINModificationDataView lengthByte](self, "lengthByte"));

  return (NSString *)v3;
}

- (unsigned)bInsertionOffsetOld
{
  return [(TKDataView *)self uint8:5];
}

- (void)setBInsertionOffsetOld:(unsigned __int8)a3
{
}

- (unsigned)bInsertionOffsetNew
{
  return [(TKDataView *)self uint8:6];
}

- (void)setBInsertionOffsetNew:(unsigned __int8)a3
{
}

- (unsigned)wPINMaxExtraDigit
{
  return [(TKDataView *)self uint16:7];
}

- (void)setWPINMaxExtraDigit:(unsigned __int16)a3
{
}

- (unsigned)bConfirmPIN
{
  return [(TKDataView *)self uint8:9];
}

- (void)setBConfirmPIN:(unsigned __int8)a3
{
}

- (unsigned)bEntryValidationCondition
{
  return [(TKDataView *)self uint8:10];
}

- (void)setBEntryValidationCondition:(unsigned __int8)a3
{
}

- (unsigned)bNumberMessage
{
  return [(TKDataView *)self uint8:11];
}

- (void)setNumberMessage:(unsigned __int8)a3
{
}

- (unsigned)wLangId
{
  return [(TKDataView *)self uint16:12];
}

- (void)setWLangId:(unsigned __int16)a3
{
}

- (unsigned)bMsgIndex1
{
  return [(TKDataView *)self uint8:14];
}

- (void)setBMsgIndex1:(unsigned __int8)a3
{
}

- (unsigned)bMsgIndex2
{
  if (![(PINModificationDataView *)self bNumberMessage])
  {
    v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:1239 description:@"only present if bNumberMessage is not null"];
  }

  return [(TKDataView *)self uint8:15];
}

- (void)setBMsgIndex2:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (![(PINModificationDataView *)self bNumberMessage])
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:1244 description:@"only present if bNumberMessage is not null"];
  }

  [(TKDataView *)self setUint8:v3 at:15];
}

- (unsigned)bMsgIndex3
{
  if ([(PINModificationDataView *)self bNumberMessage] != 3)
  {
    v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:1249 description:@"only present if bNumberMessage = 3"];
  }

  return [(TKDataView *)self uint8:16];
}

- (void)setBMsgIndex3:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(PINModificationDataView *)self bNumberMessage] != 3)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:1254 description:@"only present if bNumberMessage = 3"];
  }

  [(TKDataView *)self setUint8:v3 at:16];
}

- (unsigned)nodeAddressByte
{
  uint64_t v3 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 3;

  return [(TKDataView *)self uint8:v3];
}

- (void)setNodeAddressByte:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 3;

  [(TKDataView *)self setUint8:v3 at:v5];
}

- (unsigned)protocolControlByte
{
  uint64_t v3 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 2;

  return [(TKDataView *)self uint8:v3];
}

- (void)setProtocolControlByte:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 2;

  [(TKDataView *)self setUint8:v3 at:v5];
}

- (unsigned)lengthByte
{
  uint64_t v3 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 1;

  return [(TKDataView *)self uint8:v3];
}

- (void)setLengthByte:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = (char *)+[PINModificationDataView lengthFromNumberMessage:[(PINModificationDataView *)self bNumberMessage]]- 1;

  [(TKDataView *)self setUint8:v3 at:v5];
}

@end