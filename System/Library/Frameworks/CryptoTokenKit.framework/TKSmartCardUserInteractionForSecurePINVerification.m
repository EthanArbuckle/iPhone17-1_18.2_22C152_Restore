@interface TKSmartCardUserInteractionForSecurePINVerification
+ (BOOL)supportsSecureCoding;
- (NSData)APDU;
- (TKSmartCardPINFormat)PINFormat;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINVerification)initWithCoder:(id)a3;
- (int64_t)PINByteOffset;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setAPDU:(id)a3;
- (void)setPINByteOffset:(int64_t)a3;
- (void)setPINFormat:(id)a3;
- (void)setSlot:(id)a3;
- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 PINByteOffset:(int64_t)a6;
@end

@implementation TKSmartCardUserInteractionForSecurePINVerification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINVerification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKSmartCardUserInteractionForSecurePINVerification;
  v5 = [(TKSmartCardUserInteractionForPINOperation *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINFormat"];
    uint64_t v7 = [v6 copy];
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APDU"];
    uint64_t v10 = [v9 copy];
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINByteOffset"];
    v5->_PINByteOffset = [v12 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TKSmartCardUserInteractionForSecurePINVerification;
  id v4 = a3;
  [(TKSmartCardUserInteractionForPINOperation *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_PINFormat, @"PINFormat", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_APDU forKey:@"APDU"];
  v5 = [NSNumber numberWithInteger:self->_PINByteOffset];
  [v4 encodeObject:v5 forKey:@"PINByteOffset"];
}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 PINByteOffset:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  [(TKSmartCardUserInteractionForSecurePINVerification *)self setSlot:a3];
  [(TKSmartCardUserInteractionForSecurePINVerification *)self setPINFormat:v11];

  [(TKSmartCardUserInteractionForSecurePINVerification *)self setAPDU:v10];

  [(TKSmartCardUserInteractionForSecurePINVerification *)self setPINByteOffset:a6];
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(TKSmartCardUserInteractionForSecurePINVerification *)self slot];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke;
  v11[3] = &unk_1E63C8298;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 synchronous:0 remoteSlotWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2;
  v9[3] = &unk_1E63C8468;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 runUserInteraction:self reply:v9];
}

uint64_t __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unsigned __int16 v11 = 0;
  v5 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  id v10 = v6;
  LODWORD(v5) = +[TKSmartCard decodeResponse:v7 sw:&v11 appendTo:v8 error:&v10];

  id v9 = v10;
  if (v5)
  {
    [*(id *)(a1 + 32) setResultSW:v11];
    [*(id *)(a1 + 32) setResultData:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (TKSmartCardSlot)slot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slot);

  return (TKSmartCardSlot *)WeakRetained;
}

- (void)setSlot:(id)a3
{
}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPINFormat:(id)a3
{
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAPDU:(id)a3
{
}

- (int64_t)PINByteOffset
{
  return self->_PINByteOffset;
}

- (void)setPINByteOffset:(int64_t)a3
{
  self->_PINByteOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APDU, 0);
  objc_storeStrong((id *)&self->_PINFormat, 0);

  objc_destroyWeak((id *)&self->_slot);
}

@end