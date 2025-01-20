@interface CRKIDSMessageCannon
- (CRKIDSMessageCannon)initWithIDSPrimitives:(id)a3;
- (CRKIDSMessageFormatter)messageFormatter;
- (CRKIDSPrimitives)IDSPrimitives;
- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6;
- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7;
@end

@implementation CRKIDSMessageCannon

- (CRKIDSMessageCannon)initWithIDSPrimitives:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKIDSMessageCannon;
  v6 = [(CRKIDSMessageCannon *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSPrimitives, a3);
    uint64_t v8 = objc_opt_new();
    messageFormatter = v7->_messageFormatter;
    v7->_messageFormatter = (CRKIDSMessageFormatter *)v8;
  }
  return v7;
}

- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)objc_opt_new();
  [(CRKIDSMessageCannon *)self sendIDSMessage:v13 destinationAddress:v12 sourceAppleID:v11 options:v14 completion:v10];
}

- (void)sendIDSMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(CRKIDSMessageCannon *)self messageFormatter];
  v18 = [v17 formatMessageForSending:v16];

  v19 = [(CRKIDSMessageCannon *)self IDSPrimitives];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __90__CRKIDSMessageCannon_sendIDSMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v21[3] = &unk_2646F3EA0;
  v21[4] = self;
  id v22 = v12;
  id v20 = v12;
  [v19 sendMessage:v18 destinationAddress:v15 sourceAppleID:v14 options:v13 completion:v21];
}

void __90__CRKIDSMessageCannon_sendIDSMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSMessageFormatter)messageFormatter
{
  return self->_messageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFormatter, 0);

  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

@end