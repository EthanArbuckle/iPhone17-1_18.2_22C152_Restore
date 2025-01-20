@interface TKSmartCardUserInteractionForStringEntry
+ (BOOL)supportsSecureCoding;
- (NSString)result;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForStringEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(id)a3;
- (void)setResult:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation TKSmartCardUserInteractionForStringEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForStringEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TKSmartCardUserInteractionForStringEntry;
  v5 = [(TKSmartCardUserInteraction *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    uint64_t v7 = [v6 copy];
    v8 = v5->_result;
    v5->_result = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TKSmartCardUserInteractionForStringEntry;
  id v4 = a3;
  [(TKSmartCardUserInteraction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, @"result", v5.receiver, v5.super_class);
}

- (void)runWithReply:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TKSmartCardUserInteractionForStringEntry *)self slot];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke;
  v11[3] = &unk_1E63C8298;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 synchronous:0 remoteSlotWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2;
  v9[3] = &unk_1E63C85A0;
  id v10 = v6;
  id v8 = v6;
  [v7 runUserInteraction:self reply:v9];
}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResult:(id)a3
{
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
  objc_destroyWeak((id *)&self->_slot);

  objc_storeStrong((id *)&self->_result, 0);
}

@end