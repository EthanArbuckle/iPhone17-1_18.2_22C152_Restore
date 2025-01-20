@interface HFSetupAccessoryResult
- (BOOL)hasAddRequest;
- (BOOL)isAllZerosCode;
- (BOOL)isValidForPairing;
- (HFSetupAccessoryResult)initWithPayload:(id)a3;
- (HFSetupAccessoryResult)initWithPayload:(id)a3 error:(id)a4 hasAddRequest:(BOOL)a5;
- (HFSetupAccessoryResult)initWithPayload:(id)a3 hasAddRequest:(BOOL)a4;
- (HFSetupAccessoryResult)initWithSetupCode:(id)a3;
- (HFSetupAccessoryResult)initWithSetupURL:(id)a3;
- (HMSetupAccessoryPayload)setupPayload;
- (NSError)error;
- (id)description;
@end

@implementation HFSetupAccessoryResult

- (HFSetupAccessoryResult)initWithPayload:(id)a3 error:(id)a4 hasAddRequest:(BOOL)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5;
  }
  if (v10)
  {
    v26.receiver = self;
    v26.super_class = (Class)HFSetupAccessoryResult;
    v11 = [(HFSetupAccessoryResult *)&v26 init];
    v12 = v11;
    if (v11)
    {
      p_error = (void **)&v11->_error;
      objc_storeStrong((id *)&v11->_error, a4);
      uint64_t v14 = [(id)v8 copy];
      setupPayload = v12->_setupPayload;
      v12->_setupPayload = (HMSetupAccessoryPayload *)v14;

      v12->_isValidForPairing = v10;
      if (v12->_error)
      {
        if (v8) {
          NSLog(&cfstr_Hfsetupaccesso_0.isa, v8);
        }
        goto LABEL_14;
      }
      v12->_hasAddRequest = a5;
      if ([(HMSetupAccessoryPayload *)v12->_setupPayload isPaired])
      {
        uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 21);
        v18 = *p_error;
        *p_error = (void *)v17;

LABEL_14:
        v24 = v12->_setupPayload;
        v12->_setupPayload = 0;

        goto LABEL_15;
      }
      if ([(HFSetupAccessoryResult *)v12 isAllZerosCode])
      {
        v19 = (void *)MEMORY[0x263F087E8];
        v20 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode", @"HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode", 1);
        v21 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode", @"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode", 1);
        uint64_t v22 = objc_msgSend(v19, "hf_errorWithCode:title:description:", 22, v20, v21);
        v23 = *p_error;
        *p_error = (void *)v22;

        goto LABEL_14;
      }
    }
LABEL_15:
    self = v12;
    v16 = self;
    goto LABEL_16;
  }
  NSLog(&cfstr_Hfsetupaccesso.isa);
  v16 = 0;
LABEL_16:

  return v16;
}

- (HFSetupAccessoryResult)initWithPayload:(id)a3 hasAddRequest:(BOOL)a4
{
  return [(HFSetupAccessoryResult *)self initWithPayload:a3 error:0 hasAddRequest:a4];
}

- (HFSetupAccessoryResult)initWithPayload:(id)a3
{
  return [(HFSetupAccessoryResult *)self initWithPayload:a3 error:0 hasAddRequest:0];
}

- (HFSetupAccessoryResult)initWithSetupURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F0E770];
  id v5 = a3;
  id v10 = 0;
  v6 = (void *)[[v4 alloc] initWithSetupPayloadURL:v5 error:&v10];

  id v7 = v10;
  unint64_t v8 = [(HFSetupAccessoryResult *)self initWithPayload:v6 error:v7 hasAddRequest:0];

  return v8;
}

- (HFSetupAccessoryResult)initWithSetupCode:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F0E770];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithHAPSetupCode:v5];

  id v7 = [(HFSetupAccessoryResult *)self initWithPayload:v6 error:0 hasAddRequest:0];
  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFSetupAccessoryResult *)self setupPayload];
  id v5 = (id)[v3 appendObject:v4 withName:@"setupPayload"];

  v6 = [(HFSetupAccessoryResult *)self error];
  id v7 = (id)[v3 appendObject:v6 withName:@"error"];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFSetupAccessoryResult hasAddRequest](self, "hasAddRequest"), @"hasAddRequest");
  unint64_t v9 = [v3 build];

  return v9;
}

- (BOOL)isAllZerosCode
{
  v3 = [(HFSetupAccessoryResult *)self setupPayload];

  if (v3)
  {
    v4 = [(HFSetupAccessoryResult *)self setupPayload];
    id v5 = [v4 setupCode];
    v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C081158];

    if (v6)
    {
      LOBYTE(v3) = [v6 compare:@"00000000"] == 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (NSError)error
{
  return self->_error;
}

- (HMSetupAccessoryPayload)setupPayload
{
  return self->_setupPayload;
}

- (BOOL)hasAddRequest
{
  return self->_hasAddRequest;
}

- (BOOL)isValidForPairing
{
  return self->_isValidForPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end