@interface CRXFAppClipCodeScanningState
- (BOOL)allowUnsupportedRX;
- (BOOL)isValid;
- (BOOL)updateWithScannedAppClipCodePayload:(id)a3 error:(id *)a4;
- (CRXFAppClipCode)dualAppClipCode;
- (CRXFAppClipCode)leftAppClipCode;
- (CRXFAppClipCode)rightAppClipCode;
- (CRXFAppClipCodeScanningState)init;
- (CRXFAppClipCodeScanningState)initWithLeftAppClipCode:(id)a3 leftAppClipCodePayload:(id)a4 rightAppClipCode:(id)a5 rightAppClipCodePayload:(id)a6 dualAppClipCode:(id)a7 dualAppClipCodePayload:(id)a8 allowUnsupportedRX:(BOOL)a9;
- (NSData)dualAppClipCodePayload;
- (NSData)leftAppClipCodePayload;
- (NSData)rightAppClipCodePayload;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)lensType;
- (void)reset;
- (void)setAllowUnsupportedRX:(BOOL)a3;
@end

@implementation CRXFAppClipCodeScanningState

- (CRXFAppClipCodeScanningState)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRXFAppClipCodeScanningState;
  v2 = [(CRXFAppClipCodeScanningState *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[CRXFAppClipCodeTranscoder sharedInstance];
    transcoder = v2->_transcoder;
    v2->_transcoder = (CRXFAppClipCodeTranscoder *)v5;
  }
  return v2;
}

- (CRXFAppClipCodeScanningState)initWithLeftAppClipCode:(id)a3 leftAppClipCodePayload:(id)a4 rightAppClipCode:(id)a5 rightAppClipCodePayload:(id)a6 dualAppClipCode:(id)a7 dualAppClipCodePayload:(id)a8 allowUnsupportedRX:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRXFAppClipCodeScanningState;
  v19 = [(CRXFAppClipCodeScanningState *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_leftAppClipCode, a3);
    objc_storeStrong((id *)&v20->_leftAppClipCodePayload, a4);
    objc_storeStrong((id *)&v20->_rightAppClipCode, a5);
    objc_storeStrong((id *)&v20->_rightAppClipCodePayload, a6);
    objc_storeStrong((id *)&v20->_dualAppClipCode, a7);
    objc_storeStrong((id *)&v20->_dualAppClipCodePayload, a8);
    v20->_allowUnsupportedRX = a9;
  }

  return v20;
}

- (void)reset
{
  leftAppClipCodePayload = self->_leftAppClipCodePayload;
  self->_leftAppClipCodePayload = 0;

  leftAppClipCode = self->_leftAppClipCode;
  self->_leftAppClipCode = 0;

  rightAppClipCodePayload = self->_rightAppClipCodePayload;
  self->_rightAppClipCodePayload = 0;

  rightAppClipCode = self->_rightAppClipCode;
  self->_rightAppClipCode = 0;

  dualAppClipCodePayload = self->_dualAppClipCodePayload;
  self->_dualAppClipCodePayload = 0;

  dualAppClipCode = self->_dualAppClipCode;
  self->_dualAppClipCode = 0;
}

- (BOOL)isValid
{
  return self->_leftAppClipCode && self->_rightAppClipCode || self->_dualAppClipCode != 0;
}

- (unint64_t)lensType
{
  unint64_t result = (unint64_t)self->_dualAppClipCode;
  if (result) {
    return [(id)result lensType];
  }
  unint64_t result = (unint64_t)self->_leftAppClipCode;
  if (result) {
    return [(id)result lensType];
  }
  unint64_t result = (unint64_t)self->_rightAppClipCode;
  if (result) {
    return [(id)result lensType];
  }
  return result;
}

- (BOOL)updateWithScannedAppClipCodePayload:(id)a3 error:(id *)a4
{
  id v7 = a3;
  p_leftAppClipCodePayload = &self->_leftAppClipCodePayload;
  if (([v7 isEqual:self->_leftAppClipCodePayload] & 1) == 0)
  {
    p_rightAppClipCodePayload = &self->_rightAppClipCodePayload;
    if (([v7 isEqual:self->_rightAppClipCodePayload] & 1) == 0)
    {
      p_dualAppClipCodePayload = &self->_dualAppClipCodePayload;
      if (([v7 isEqual:self->_dualAppClipCodePayload] & 1) == 0)
      {
        transcoder = self->_transcoder;
        id v30 = 0;
        v14 = [(CRXFAppClipCodeTranscoder *)transcoder decodeAppClipCodeFromData:v7 allowUnsupportedRX:[(CRXFAppClipCodeScanningState *)self allowUnsupportedRX] error:&v30];
        v15 = (CRXFAppClipCode *)v30;
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
LABEL_26:
          BOOL v11 = 0;
          *a4 = v17;
LABEL_27:

          v14 = v16;
          goto LABEL_28;
        }
        if ([v14 hasLeftAndRightRX])
        {
          dualAppClipCode = self->_dualAppClipCode;
          p_dualAppClipCode = &self->_dualAppClipCode;
          if (dualAppClipCode)
          {
            v20 = (void *)MEMORY[0x263F087E8];
            uint64_t v21 = MEMORY[0x263EFFA78];
            uint64_t v22 = 33;
            uint64_t v23 = 102;
LABEL_25:
            objc_msgSend(v20, "crxf_errorWithCode:file:line:userInfo:", v22, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeScanningState.m", v23, v21);
            id v17 = (CRXFAppClipCode *)(id)objc_claimAutoreleasedReturnValue();
            goto LABEL_26;
          }
        }
        else if ([v14 hasLeftRX])
        {
          rightAppClipCode = self->_rightAppClipCode;
          if (rightAppClipCode)
          {
            uint64_t v25 = [(CRXFAppClipCode *)rightAppClipCode lensType];
            if (v25 != [v14 lensType])
            {
              v20 = (void *)MEMORY[0x263F087E8];
              uint64_t v21 = MEMORY[0x263EFFA78];
              uint64_t v22 = 31;
              uint64_t v23 = 107;
              goto LABEL_25;
            }
          }
          leftAppClipCode = self->_leftAppClipCode;
          p_dualAppClipCode = &self->_leftAppClipCode;
          if (leftAppClipCode)
          {
            v20 = (void *)MEMORY[0x263F087E8];
            uint64_t v21 = MEMORY[0x263EFFA78];
            uint64_t v22 = 40;
            uint64_t v23 = 116;
            goto LABEL_25;
          }
          p_dualAppClipCodePayload = p_leftAppClipCodePayload;
        }
        else
        {
          if (![v14 hasRightRX])
          {
            BOOL v11 = 1;
LABEL_28:

            goto LABEL_5;
          }
          v27 = self->_leftAppClipCode;
          if (v27)
          {
            uint64_t v28 = [(CRXFAppClipCode *)v27 lensType];
            if (v28 != [v14 lensType])
            {
              v20 = (void *)MEMORY[0x263F087E8];
              uint64_t v21 = MEMORY[0x263EFFA78];
              uint64_t v22 = 31;
              uint64_t v23 = 121;
              goto LABEL_25;
            }
          }
          v29 = self->_rightAppClipCode;
          p_dualAppClipCode = &self->_rightAppClipCode;
          if (v29)
          {
            v20 = (void *)MEMORY[0x263F087E8];
            uint64_t v21 = MEMORY[0x263EFFA78];
            uint64_t v22 = 40;
            uint64_t v23 = 130;
            goto LABEL_25;
          }
          p_dualAppClipCodePayload = p_rightAppClipCodePayload;
        }
        objc_storeStrong((id *)p_dualAppClipCodePayload, a3);
        id v16 = v14;
        v14 = *p_dualAppClipCode;
        *p_dualAppClipCode = v16;
        BOOL v11 = 1;
        goto LABEL_27;
      }
    }
  }
  BOOL v11 = 1;
LABEL_5:

  return v11;
}

- (id)asDictionary
{
  os_log_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  dualAppClipCode = self->_dualAppClipCode;
  if (dualAppClipCode)
  {
    dualAppClipCodePayload = self->_dualAppClipCodePayload;
LABEL_6:
    [v4 setObject:dualAppClipCode forKeyedSubscript:dualAppClipCodePayload];
    goto LABEL_7;
  }
  if (self->_leftAppClipCode && self->_rightAppClipCode)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:");
    dualAppClipCode = self->_rightAppClipCode;
    dualAppClipCodePayload = self->_rightAppClipCodePayload;
    goto LABEL_6;
  }
LABEL_7:
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = +[CRXFAppClipCodeScanningState allocWithZone:](CRXFAppClipCodeScanningState, "allocWithZone:");
  id v6 = [(CRXFAppClipCode *)self->_leftAppClipCode copyWithZone:a3];
  id v7 = (void *)[(NSData *)self->_leftAppClipCodePayload copyWithZone:a3];
  id v8 = [(CRXFAppClipCode *)self->_rightAppClipCode copyWithZone:a3];
  v9 = (void *)[(NSData *)self->_rightAppClipCodePayload copyWithZone:a3];
  id v10 = [(CRXFAppClipCode *)self->_dualAppClipCode copyWithZone:a3];
  BOOL v11 = (void *)[(NSData *)self->_dualAppClipCodePayload copyWithZone:a3];
  LOBYTE(v14) = self->_allowUnsupportedRX;
  v12 = [(CRXFAppClipCodeScanningState *)v5 initWithLeftAppClipCode:v6 leftAppClipCodePayload:v7 rightAppClipCode:v8 rightAppClipCodePayload:v9 dualAppClipCode:v10 dualAppClipCodePayload:v11 allowUnsupportedRX:v14];

  return v12;
}

- (CRXFAppClipCode)leftAppClipCode
{
  return self->_leftAppClipCode;
}

- (NSData)leftAppClipCodePayload
{
  return self->_leftAppClipCodePayload;
}

- (CRXFAppClipCode)rightAppClipCode
{
  return self->_rightAppClipCode;
}

- (NSData)rightAppClipCodePayload
{
  return self->_rightAppClipCodePayload;
}

- (CRXFAppClipCode)dualAppClipCode
{
  return self->_dualAppClipCode;
}

- (NSData)dualAppClipCodePayload
{
  return self->_dualAppClipCodePayload;
}

- (BOOL)allowUnsupportedRX
{
  return self->_allowUnsupportedRX;
}

- (void)setAllowUnsupportedRX:(BOOL)a3
{
  self->_allowUnsupportedRX = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dualAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_dualAppClipCode, 0);
  objc_storeStrong((id *)&self->_rightAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_rightAppClipCode, 0);
  objc_storeStrong((id *)&self->_leftAppClipCodePayload, 0);
  objc_storeStrong((id *)&self->_leftAppClipCode, 0);
  objc_storeStrong((id *)&self->_transcoder, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end