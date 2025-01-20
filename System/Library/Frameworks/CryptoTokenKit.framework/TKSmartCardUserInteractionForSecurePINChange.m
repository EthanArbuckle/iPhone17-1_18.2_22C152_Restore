@interface TKSmartCardUserInteractionForSecurePINChange
+ (BOOL)supportsSecureCoding;
- (NSData)APDU;
- (TKSmartCardPINConfirmation)PINConfirmation;
- (TKSmartCardPINFormat)PINFormat;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINChange)init;
- (TKSmartCardUserInteractionForSecurePINChange)initWithCoder:(id)a3;
- (int64_t)currentPINByteOffset;
- (int64_t)newPINByteOffset;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setAPDU:(id)a3;
- (void)setCurrentPINByteOffset:(int64_t)a3;
- (void)setNewPINByteOffset:(int64_t)a3;
- (void)setPINConfirmation:(TKSmartCardPINConfirmation)PINConfirmation;
- (void)setPINFormat:(id)a3;
- (void)setSlot:(id)a3;
- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 currentPINByteOffset:(int64_t)a6 newPINByteOffset:(int64_t)a7;
@end

@implementation TKSmartCardUserInteractionForSecurePINChange

- (TKSmartCardUserInteractionForSecurePINChange)init
{
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  result = [(TKSmartCardUserInteractionForPINOperation *)&v3 init];
  if (result) {
    result->_PINConfirmation = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  v5 = [(TKSmartCardUserInteractionForPINOperation *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINConfirmation"];
    v5->_PINConfirmation = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINFormat"];
    uint64_t v8 = [v7 copy];
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APDU"];
    uint64_t v11 = [v10 copy];
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentPINByteOffset"];
    v5->_currentPINByteOffset = [v13 integerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newPINByteOffset"];
    v5->_newPINByteOffset = [v14 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  id v4 = a3;
  [(TKSmartCardUserInteractionForPINOperation *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_PINConfirmation, v8.receiver, v8.super_class);
  [v4 encodeObject:v5 forKey:@"PINConfirmation"];

  [v4 encodeObject:self->_PINFormat forKey:@"PINFormat"];
  [v4 encodeObject:self->_APDU forKey:@"APDU"];
  v6 = [NSNumber numberWithInteger:self->_currentPINByteOffset];
  [v4 encodeObject:v6 forKey:@"currentPINByteOffset"];

  v7 = [NSNumber numberWithInteger:self->_newPINByteOffset];
  [v4 encodeObject:v7 forKey:@"newPINByteOffset"];
}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 currentPINByteOffset:(int64_t)a6 newPINByteOffset:(int64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  [(TKSmartCardUserInteractionForSecurePINChange *)self setSlot:a3];
  [(TKSmartCardUserInteractionForSecurePINChange *)self setPINFormat:v13];

  [(TKSmartCardUserInteractionForSecurePINChange *)self setAPDU:v12];
  [(TKSmartCardUserInteractionForSecurePINChange *)self setCurrentPINByteOffset:a6];

  [(TKSmartCardUserInteractionForSecurePINChange *)self setNewPINByteOffset:a7];
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(TKSmartCardUserInteractionForSecurePINChange *)self slot];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke;
  v11[3] = &unk_1E63C8298;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 synchronous:0 remoteSlotWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2;
  v9[3] = &unk_1E63C8468;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 runUserInteraction:self reply:v9];
}

uint64_t __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (TKSmartCardPINConfirmation)PINConfirmation
{
  return self->_PINConfirmation;
}

- (void)setPINConfirmation:(TKSmartCardPINConfirmation)PINConfirmation
{
  self->_PINConfirmation = PINConfirmation;
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
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPINFormat:(id)a3
{
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAPDU:(id)a3
{
}

- (int64_t)currentPINByteOffset
{
  return self->_currentPINByteOffset;
}

- (void)setCurrentPINByteOffset:(int64_t)a3
{
  self->_currentPINByteOffset = a3;
}

- (int64_t)newPINByteOffset
{
  return self->_newPINByteOffset;
}

- (void)setNewPINByteOffset:(int64_t)a3
{
  self->_newPINByteOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APDU, 0);
  objc_storeStrong((id *)&self->_PINFormat, 0);

  objc_destroyWeak((id *)&self->_slot);
}

@end