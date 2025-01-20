@interface SGWalletPassViewManager
- (NSData)passData;
- (PKPass)pass;
- (SGWalletPassViewManager)initWithData:(id)a3;
- (double)passTimeInterval;
- (id)addPassViewController;
- (id)icon;
- (id)organizationName;
- (id)passStyle;
- (id)passView;
- (id)passes;
- (id)title;
@end

@implementation SGWalletPassViewManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passData, 0);
}

- (PKPass)pass
{
  return self->_pass;
}

- (NSData)passData
{
  return self->_passData;
}

- (id)addPassViewController
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getPKAddPassesViewControllerClass_softClass;
  uint64_t v11 = getPKAddPassesViewControllerClass_softClass;
  if (!getPKAddPassesViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPKAddPassesViewControllerClass_block_invoke;
    v7[3] = &unk_1E612E840;
    v7[4] = &v8;
    __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] initWithPass:self->_pass];
  return v5;
}

- (id)passView
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getPKPassViewClass_softClass;
  uint64_t v11 = getPKPassViewClass_softClass;
  if (!getPKPassViewClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPKPassViewClass_block_invoke;
    v7[3] = &unk_1E612E840;
    v7[4] = &v8;
    __getPKPassViewClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] initWithPass:self->_pass content:5 suppressedContent:6];
  return v5;
}

- (id)icon
{
  pass = self->_pass;
  if (pass)
  {
    pass = [pass icon];
  }
  return pass;
}

- (id)passStyle
{
  switch([(PKPass *)self->_pass style])
  {
    case 0:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleCoupon";
      break;
    case 1:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleGiftCard";
      break;
    case 2:
    case 3:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleEventTicket";
      break;
    case 4:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleBoardingPass";
      break;
    case 6:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStylePayment";
      break;
    case 7:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleAccess";
      break;
    case 8:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleHealthPass";
      break;
    default:
      v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
      v3 = v2;
      v4 = @"SuggestionsWalletPassStyleGeneric";
      break;
  }
  v5 = [v2 localizedStringForKey:v4 value:&stru_1F0ED27A8 table:0];

  return v5;
}

- (double)passTimeInterval
{
  pass = self->_pass;
  if (!pass) {
    return 0.0;
  }
  v4 = [(PKPass *)pass relevantDate];

  if (!v4) {
    return 0.0;
  }
  v5 = [(PKPass *)self->_pass relevantDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return v7;
}

- (id)organizationName
{
  pass = self->_pass;
  if (pass)
  {
    pass = [pass organizationName];
  }
  return pass;
}

- (id)title
{
  pass = self->_pass;
  if (pass)
  {
    v3 = [(PKPass *)pass localizedDescription];
  }
  else
  {
    v3 = &stru_1F0ED27A8;
  }
  return v3;
}

- (id)passes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_pass;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (SGWalletPassViewManager)initWithData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGWalletPassViewManager;
  v5 = [(SGWalletPassViewManager *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    passData = v5->_passData;
    v5->_passData = (NSData *)v6;

    if (v5->_passData)
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      uint64_t v8 = (void *)getPKPassClass_softClass;
      uint64_t v23 = getPKPassClass_softClass;
      if (!getPKPassClass_softClass)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __getPKPassClass_block_invoke;
        v19[3] = &unk_1E612E840;
        v19[4] = &v20;
        __getPKPassClass_block_invoke((uint64_t)v19);
        uint64_t v8 = (void *)v21[3];
      }
      v9 = v8;
      _Block_object_dispose(&v20, 8);
      id v10 = [v9 alloc];
      uint64_t v11 = v5->_passData;
      id v17 = 0;
      uint64_t v12 = [v10 initWithData:v11 error:&v17];
      id v13 = v17;
      pass = v5->_pass;
      v5->_pass = (PKPass *)v12;

      if (v13)
      {
        v15 = v5->_pass;
        v5->_pass = 0;
      }
    }
  }

  return v5;
}

@end