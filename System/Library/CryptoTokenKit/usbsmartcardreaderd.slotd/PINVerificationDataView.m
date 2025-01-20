@interface PINVerificationDataView
+ (id)createWithInteraction:(id)a3 error:(id *)a4;
- (NSString)description;
- (unsigned)bEntryValidationCondition;
- (unsigned)bMsgIndex;
- (unsigned)bNumberMessage;
- (unsigned)lengthByte;
- (unsigned)nodeAddressByte;
- (unsigned)protocolControlByte;
- (unsigned)wLangId;
- (unsigned)wPINMaxExtraDigit;
- (void)setBEntryValidationCondition:(unsigned __int8)a3;
- (void)setBMsgIndex:(unsigned __int8)a3;
- (void)setBNumberMessage:(unsigned __int8)a3;
- (void)setLengthByte:(unsigned __int8)a3;
- (void)setNodeAddressByte:(unsigned __int8)a3;
- (void)setProtocolControlByte:(unsigned __int8)a3;
- (void)setWLangId:(unsigned __int16)a3;
- (void)setWPINMaxExtraDigit:(unsigned __int16)a3;
@end

@implementation PINVerificationDataView

+ (id)createWithInteraction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 PINByteOffset])
  {
    v6 = sub_1000149AC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000194DC(v6);
    }
  }
  v7 = [PINVerificationDataView alloc];
  v8 = [(PINOperationDataView *)v7 initWithLength:qword_10002C258];
  [(PINOperationDataView *)v8 setBPINOperation:0];
  [v5 initialTimeout];
  [(PINOperationDataView *)v8 setBTimeOut:(int)v9];
  v10 = [v5 PINFormat];
  id v24 = 0;
  id v11 = [v10 PINFormatStringWithError:&v24];
  id v12 = v24;
  [(PINOperationDataView *)v8 setBmFormatString:v11];

  if (v12)
  {
    if (a4)
    {
LABEL_7:
      id v12 = v12;
      v13 = 0;
      *a4 = v12;
      goto LABEL_15;
    }
  }
  else
  {
    v14 = [v5 PINFormat];
    -[PINOperationDataView setBmPINBlockString:](v8, "setBmPINBlockString:", [v14 PINBlockString]);

    v15 = [v5 PINFormat];
    id v23 = 0;
    id v16 = [v15 PINLengthFormatWithError:&v23];
    id v12 = v23;
    [(PINOperationDataView *)v8 setBmPINLengthFormat:v16];

    if (!v12)
    {
      v17 = [v5 PINFormat];
      -[PINVerificationDataView setWPINMaxExtraDigit:](v8, "setWPINMaxExtraDigit:", [v17 PINMaxExtraDigit]);

      -[PINVerificationDataView setBEntryValidationCondition:](v8, "setBEntryValidationCondition:", [v5 PINCompletion]);
      v18 = [v5 PINMessageIndices];
      -[PINVerificationDataView setBNumberMessage:](v8, "setBNumberMessage:", [v18 count]);

      -[PINVerificationDataView setWLangId:](v8, "setWLangId:", [v5 localeID]);
      v19 = [v5 PINMessageIndices];
      if ([v19 count])
      {
        v20 = [v5 PINMessageIndices];
        v21 = [v20 objectAtIndexedSubscript:0];
        -[PINVerificationDataView setBMsgIndex:](v8, "setBMsgIndex:", [v21 unsignedCharValue]);
      }
      else
      {
        [(PINVerificationDataView *)v8 setBMsgIndex:0];
      }

      [(PINVerificationDataView *)v8 setNodeAddressByte:0];
      [(PINVerificationDataView *)v8 setProtocolControlByte:0];
      [(PINVerificationDataView *)v8 setLengthByte:0];
      v13 = v8;
      id v12 = 0;
      goto LABEL_15;
    }
    if (a4) {
      goto LABEL_7;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (NSString)description
{
  v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"{ wPINMaxExtraDigit: 0x%.4x ", -[PINVerificationDataView wPINMaxExtraDigit](self, "wPINMaxExtraDigit"));
  objc_msgSend(v3, "appendFormat:", @"bEntryValidationCondition: 0x%.2x ", -[PINVerificationDataView bEntryValidationCondition](self, "bEntryValidationCondition"));
  objc_msgSend(v3, "appendFormat:", @"bNumberMessage: 0x%.2x ", -[PINVerificationDataView bNumberMessage](self, "bNumberMessage"));
  objc_msgSend(v3, "appendFormat:", @"wLangId: 0x%.4x ", -[PINVerificationDataView wLangId](self, "wLangId"));
  objc_msgSend(v3, "appendFormat:", @"bMsgIndex: 0x%.2x ", -[PINVerificationDataView bMsgIndex](self, "bMsgIndex"));
  objc_msgSend(v3, "appendFormat:", @"nodeAddressByte: 0x%.2x ", -[PINVerificationDataView nodeAddressByte](self, "nodeAddressByte"));
  objc_msgSend(v3, "appendFormat:", @"protocolControlByte: 0x%.2x ", -[PINVerificationDataView protocolControlByte](self, "protocolControlByte"));
  objc_msgSend(v3, "appendFormat:", @"lengthByte: 0x%.2x }", -[PINVerificationDataView lengthByte](self, "lengthByte"));

  return (NSString *)v3;
}

- (unsigned)wPINMaxExtraDigit
{
  return [(TKDataView *)self uint16:5];
}

- (void)setWPINMaxExtraDigit:(unsigned __int16)a3
{
}

- (unsigned)bEntryValidationCondition
{
  return [(TKDataView *)self uint8:7];
}

- (void)setBEntryValidationCondition:(unsigned __int8)a3
{
}

- (unsigned)bNumberMessage
{
  return [(TKDataView *)self uint8:8];
}

- (void)setBNumberMessage:(unsigned __int8)a3
{
}

- (unsigned)wLangId
{
  return [(TKDataView *)self uint16:9];
}

- (void)setWLangId:(unsigned __int16)a3
{
}

- (unsigned)bMsgIndex
{
  return [(TKDataView *)self uint8:11];
}

- (void)setBMsgIndex:(unsigned __int8)a3
{
}

- (unsigned)nodeAddressByte
{
  return [(TKDataView *)self uint8:12];
}

- (void)setNodeAddressByte:(unsigned __int8)a3
{
}

- (unsigned)protocolControlByte
{
  return [(TKDataView *)self uint8:13];
}

- (void)setProtocolControlByte:(unsigned __int8)a3
{
}

- (unsigned)lengthByte
{
  return [(TKDataView *)self uint8:14];
}

- (void)setLengthByte:(unsigned __int8)a3
{
}

@end