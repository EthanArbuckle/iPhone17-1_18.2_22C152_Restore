@interface CKRecipientGenerator
+ (id)sharedRecipientGenerator;
- (NSArray)searchABPropertyTypes;
- (id)recipientWithAddress:(id)a3;
- (id)recipientWithContact:(id)a3;
- (id)recipientWithContactProperty:(id)a3;
- (void)getAddressForContact:(id)a3 address:(id *)a4 kind:(unint64_t *)a5;
- (void)setSearchABPropertyTypes:(id)a3;
@end

@implementation CKRecipientGenerator

+ (id)sharedRecipientGenerator
{
  if (sharedRecipientGenerator_once != -1) {
    dispatch_once(&sharedRecipientGenerator_once, &__block_literal_global_79);
  }
  v2 = (void *)sharedRecipientGenerator_sSharedRecipientGenerator;

  return v2;
}

void __48__CKRecipientGenerator_sharedRecipientGenerator__block_invoke()
{
  v0 = objc_alloc_init(CKRecipientGenerator);
  v1 = (void *)sharedRecipientGenerator_sSharedRecipientGenerator;
  sharedRecipientGenerator_sSharedRecipientGenerator = (uint64_t)v0;

  v2 = (void *)sharedRecipientGenerator_sSharedRecipientGenerator;
  CKPreferredAddressTypes();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setSearchABPropertyTypes:v3];
}

- (id)recipientWithContact:(id)a3
{
  id v9 = 0;
  uint64_t v10 = 5;
  [(CKRecipientGenerator *)self getAddressForContact:a3 address:&v9 kind:&v10];
  id v3 = v9;
  v4 = +[CKRecipientGenerator sharedRecipientGenerator];
  v5 = [v4 recipientWithAddress:v3];

  if (v10 == 1)
  {
    v6 = (void *)MEMORY[0x192FB9A40](1);
    id v7 = v6;
    [v5 setCountryCode:v7];
    if (v6) {
      CFRelease(v7);
    }
  }

  return v5;
}

- (void)getAddressForContact:(id)a3 address:(id *)a4 kind:(unint64_t *)a5
{
  id v17 = a3;
  id v7 = [v17 phoneNumbers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [v17 phoneNumbers];
    uint64_t v10 = [v9 firstObject];

    v11 = [v10 value];
    v12 = [v11 stringValue];

    unint64_t v13 = 1;
LABEL_5:

    goto LABEL_6;
  }
  v14 = [v17 emailAddresses];
  v12 = (void *)[v14 count];

  if (v12)
  {
    v15 = [v17 emailAddresses];
    uint64_t v10 = [v15 firstObject];

    v12 = [v10 value];
    unint64_t v13 = 0;
    goto LABEL_5;
  }
  unint64_t v13 = 5;
LABEL_6:
  id v16 = v12;
  *a4 = v16;
  *a5 = v13;
}

- (id)recipientWithContactProperty:(id)a3
{
  id v3 = a3;
  v4 = [v3 key];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v5)
  {
    v6 = [v3 value];
  }
  else
  {
    id v7 = [v3 key];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1AEE0]];

    if (v8)
    {
      id v9 = [v3 value];
      v6 = [v9 stringValue];
    }
    else
    {
      v6 = 0;
    }
  }
  if ([v6 length])
  {
    uint64_t v10 = +[CKRecipientGenerator sharedRecipientGenerator];
    v11 = [v10 recipientWithAddress:v6];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recipientWithAddress:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (char *)a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    int v5 = [v4 fetchCNContactForHandleWithID:v3];

    int v6 = MEMORY[0x192FBA6E0](v3);
    if (v6)
    {
      uint64_t v7 = 1;
    }
    else if (IMStringIsEmail())
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = 2;
    }
    uint64_t v10 = IMStripFormattingFromAddress();
    v11 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    v12 = objc_msgSend(v11, "__ck_bestAccountForAddress:", v10);

    unint64_t v13 = [v12 imHandleWithID:v10];
    if (CKIsRunningInFullCKClient() || CKIsRunningUnitTests()) {
      v14 = [[CKIMComposeRecipient alloc] initWithHandle:v13];
    }
    else {
      v14 = (CKIMComposeRecipient *)[objc_alloc(MEMORY[0x1E4F5A140]) initWithContact:v5 address:v3 kind:v7];
    }
    id v9 = v14;
    if (v6)
    {
      v15 = (void *)MEMORY[0x192FB9A40](1);
      id v16 = v15;
      [(CKIMComposeRecipient *)v9 setCountryCode:v16];
      if (v15) {
        CFRelease(v16);
      }
    }
    if ((!v13 || !v5) && IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412802;
        v20 = v3;
        __int16 v21 = 2112;
        v22 = v13;
        __int16 v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Address %@ matched to nil handle (%@) or contact (%@)", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315138;
        v20 = "-[CKRecipientGenerator recipientWithAddress:]";
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s given nil address", (uint8_t *)&v19, 0xCu);
      }
    }
    id v9 = 0;
  }

  return v9;
}

- (NSArray)searchABPropertyTypes
{
  return self->_searchABPropertyTypes;
}

- (void)setSearchABPropertyTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end