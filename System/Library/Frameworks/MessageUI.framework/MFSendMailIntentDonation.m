@interface MFSendMailIntentDonation
- (void)donateSendActionFromMessageFuture:(id)a3;
@end

@implementation MFSendMailIntentDonation

- (void)donateSendActionFromMessageFuture:(id)a3
{
  id v3 = [a3 map:&__block_literal_global_34];
  [v3 addSuccessBlock:&__block_literal_global_3];
}

id __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MFMailIntentTransformer);
  v4 = [(MFMailIntentTransformer *)v3 transformedValue:v2];

  return v4;
}

void __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v2 response:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_3;
  v5[3] = &unk_1E5F7B4A0;
  id v4 = v2;
  id v6 = v4;
  [v3 donateInteractionWithCompletion:v5];
}

void __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [v3 description];
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "donation failed with %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 32);
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_INFO, "donation with messageInfo %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end