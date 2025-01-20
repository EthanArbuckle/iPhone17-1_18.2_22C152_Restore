@interface TKSmartCardUserInteractionForConfirmation
+ (BOOL)supportsSecureCoding;
- (BOOL)result;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForConfirmation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setSlot:(id)a3;
@end

@implementation TKSmartCardUserInteractionForConfirmation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForConfirmation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKSmartCardUserInteractionForConfirmation;
  v5 = [(TKSmartCardUserInteraction *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    v5->_result = [v6 integerValue] != 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TKSmartCardUserInteractionForConfirmation;
  id v4 = a3;
  [(TKSmartCardUserInteraction *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", self->_result, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"result"];
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(TKSmartCardUserInteractionForConfirmation *)self slot];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke;
  v11[3] = &unk_1E63C8298;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 synchronous:0 remoteSlotWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2;
  v9[3] = &unk_1E63C85A0;
  id v10 = v6;
  id v8 = v6;
  [v7 runUserInteraction:self reply:v9];
}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (TKSmartCardSlot)slot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slot);

  return (TKSmartCardSlot *)WeakRetained;
}

- (void)setSlot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end