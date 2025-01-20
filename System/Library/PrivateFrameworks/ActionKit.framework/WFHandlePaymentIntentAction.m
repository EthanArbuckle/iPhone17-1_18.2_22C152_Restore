@interface WFHandlePaymentIntentAction
- (BOOL)opensInApp;
- (BOOL)selectedPaymentServiceIsApplePay;
- (id)actionForAppIdentifier:(id)a3;
- (id)amountAboveMaximumErrorWithAmount:(id)a3 sending:(BOOL)a4;
- (id)amountBelowMinimumErrorWithAmount:(id)a3 sending:(BOOL)a4;
- (id)credentialsUnverifiedError;
- (id)currencyUnsupportedErrorWithAmount:(id)a3;
- (id)customAppNameForBundleIdentifier:(id)a3;
- (id)customImageForBundleIdentifier:(id)a3;
- (id)disabledOnPlatforms;
- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4;
- (id)errorFromHandleResponse:(id)a3 intent:(id)a4;
- (id)errorFromPaymentsResponse:(id)a3 intent:(id)a4;
- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
- (id)iconName;
- (id)insufficientFundsError;
- (id)localizedKeyParameterDisplayName;
- (id)minimumSupportedClientVersion;
- (id)noBankAccountError;
- (id)noRecipientAccountError:(BOOL)a3;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)showsWhenRunIfApplicable;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
@end

@implementation WFHandlePaymentIntentAction

- (void).cxx_destruct
{
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFHandlePaymentIntentAction;
  v4 = [(WFHandlePaymentIntentAction *)&v6 serializedParametersForDonatedIntent:a3 allowDroppingUnconfigurableValues:a4];
  return v4;
}

- (id)actionForAppIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFHandlePaymentIntentAction;
  v3 = [(WFHandleSystemIntentAction *)&v5 actionForAppIdentifier:a3];
  return v3;
}

- (id)iconName
{
  if ([(WFHandlePaymentIntentAction *)self selectedPaymentServiceIsApplePay])
  {
    v3 = @"ApplePay";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFHandlePaymentIntentAction;
    v3 = [(WFHandlePaymentIntentAction *)&v5 iconName];
  }
  return v3;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFHandlePaymentIntentAction *)self errorFromPaymentsResponse:v6 intent:v7];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandlePaymentIntentAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromHandleResponse:v6 intent:v7];
  }
  v11 = v10;

  return v11;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFHandlePaymentIntentAction *)self errorFromPaymentsResponse:v6 intent:v7];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandlePaymentIntentAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromConfirmResponse:v6 intent:v7];
  }
  v11 = v10;

  return v11;
}

- (id)errorFromPaymentsResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    switch([v6 code])
    {
      case 6:
        goto LABEL_6;
      case 7:
        v9 = [v8 currencyAmount];
        id v10 = self;
        v11 = v9;
        uint64_t v12 = 1;
        goto LABEL_15;
      case 8:
        v9 = [v8 currencyAmount];
        v16 = self;
        v17 = v9;
        uint64_t v18 = 1;
        goto LABEL_17;
      case 9:
        goto LABEL_9;
      case 10:
        uint64_t v13 = [(WFHandlePaymentIntentAction *)self insufficientFundsError];
        goto LABEL_13;
      case 11:
        goto LABEL_10;
      default:
        goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    switch([v6 code])
    {
      case 6:
LABEL_6:
        uint64_t v13 = [(WFHandlePaymentIntentAction *)self credentialsUnverifiedError];
        goto LABEL_13;
      case 7:
        v9 = [v8 currencyAmount];
        id v10 = self;
        v11 = v9;
        uint64_t v12 = 0;
LABEL_15:
        uint64_t v15 = [(WFHandlePaymentIntentAction *)v10 amountBelowMinimumErrorWithAmount:v11 sending:v12];
        goto LABEL_18;
      case 8:
        v9 = [v8 currencyAmount];
        v16 = self;
        v17 = v9;
        uint64_t v18 = 0;
LABEL_17:
        uint64_t v15 = [(WFHandlePaymentIntentAction *)v16 amountAboveMaximumErrorWithAmount:v17 sending:v18];
        goto LABEL_18;
      case 9:
LABEL_9:
        v9 = [v8 currencyAmount];
        uint64_t v15 = [(WFHandlePaymentIntentAction *)self currencyUnsupportedErrorWithAmount:v9];
LABEL_18:
        v14 = (void *)v15;

        break;
      case 10:
LABEL_10:
        uint64_t v13 = [(WFHandlePaymentIntentAction *)self noBankAccountError];
LABEL_13:
        v14 = (void *)v13;
        break;
      default:
LABEL_8:
        v14 = 0;
        break;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)insufficientFundsError
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"Insufficient Funds");
  v3 = WFLocalizedString(@"Your account does not have enough money to send the payment.");
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)noBankAccountError
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"No Bank Account");
  v3 = WFLocalizedString(@"You don't have a bank account configured on this device.");
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)currencyUnsupportedErrorWithAmount:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  uint64_t v6 = [v4 currentLocale];
  id v7 = [v5 currencyCode];

  id v8 = [v6 localizedStringForCurrencyCode:v7];

  v9 = WFLocalizedString(@"Currency Unsupported");
  id v10 = NSString;
  v11 = WFLocalizedString(@"The amount you specified was in %1$@, which is not supported by %2$@.");
  uint64_t v12 = [(WFHandleSystemIntentAction *)self localizedAppName];
  uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v8, v12, 0);

  v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F870B8];
  uint64_t v16 = *MEMORY[0x263F08320];
  v20[0] = *MEMORY[0x263F08338];
  v20[1] = v16;
  v21[0] = v9;
  v21[1] = v13;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v18 = [v14 errorWithDomain:v15 code:5 userInfo:v17];

  return v18;
}

- (id)amountAboveMaximumErrorWithAmount:(id)a3 sending:(BOOL)a4
{
  BOOL v4 = a4;
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = WFFormattedCurrencyAccount(a3);
  uint64_t v6 = WFLocalizedString(@"Above Maximum Amount");
  id v7 = NSString;
  if (v4) {
    id v8 = @"The amount you specified, %@, is above the maximum amount you are allowed to send.";
  }
  else {
    id v8 = @"The amount you specified, %@, is above the maximum amount you are allowed to request.";
  }
  v9 = WFLocalizedString(v8);
  id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, 0);

  v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v17[0] = *MEMORY[0x263F08338];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];

  return v15;
}

- (id)amountBelowMinimumErrorWithAmount:(id)a3 sending:(BOOL)a4
{
  BOOL v4 = a4;
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = WFFormattedCurrencyAccount(a3);
  uint64_t v6 = WFLocalizedString(@"Below Minimum Amount");
  id v7 = NSString;
  if (v4) {
    id v8 = @"The amount you specified, %@, is below the minimum amount you are allowed to send.";
  }
  else {
    id v8 = @"The amount you specified, %@, is below the minimum amount you are allowed to request.";
  }
  v9 = WFLocalizedString(v8);
  id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, 0);

  v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v17[0] = *MEMORY[0x263F08338];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];

  return v15;
}

- (id)credentialsUnverifiedError
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Credentials Unverified");
  BOOL v4 = NSString;
  id v5 = WFLocalizedString(@"You will need to open %@ to verify your credentials.");
  uint64_t v6 = [(WFHandleSystemIntentAction *)self localizedAppName];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6, 0);

  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F870B8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v15[0] = *MEMORY[0x263F08338];
  v15[1] = v10;
  v16[0] = v3;
  v16[1] = v7;
  v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
  uint64_t v13 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v12];

  return v13;
}

- (id)noRecipientAccountError:(BOOL)a3
{
  BOOL v3 = a3;
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = WFLocalizedString(@"No Account");
  uint64_t v6 = NSString;
  if (v3) {
    id v7 = @"The person you are trying to send money to doesn't have an account set up with %@.";
  }
  else {
    id v7 = @"The person you are trying to request money from doesn't have an account set up with %@.";
  }
  id v8 = WFLocalizedString(v7);
  uint64_t v9 = [(WFHandleSystemIntentAction *)self localizedAppName];
  uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);

  v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v17[0] = *MEMORY[0x263F08338];
  v17[1] = v13;
  v18[0] = v5;
  v18[1] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];

  return v15;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Contact");
}

- (id)customImageForBundleIdentifier:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F85520]])
  {
    BOOL v3 = [MEMORY[0x263F85308] actionKitImageNamed:@"ApplePay"];
    BOOL v4 = [v3 imageWithRenderingMode:1];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)customAppNameForBundleIdentifier:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F85520]])
  {
    BOOL v3 = WFLocalizedString(@"Apple Pay");
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (BOOL)selectedPaymentServiceIsApplePay
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  BOOL v3 = [v2 extensionBundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.PassKit.PassKitIntentsExtension"];

  return v4;
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_24:
      v26.receiver = self;
      v26.super_class = (Class)WFHandlePaymentIntentAction;
      v21 = [(WFHandleIntentAction *)&v26 errorFromResolutionResult:v8 forSlot:v9 onIntent:v10];
      goto LABEL_25;
    }
    id v11 = v10;
    if ([v8 resolutionResultCode] == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v8 unsupportedReason];
        if (v17 != 3)
        {
          if (v17 != 2)
          {
            if (v17 == 1)
            {
              uint64_t v13 = [v11 currencyAmount];
              v14 = self;
              uint64_t v15 = v13;
              uint64_t v16 = 0;
              goto LABEL_15;
            }
            goto LABEL_23;
          }
          uint64_t v13 = [v11 currencyAmount];
          v23 = self;
          v24 = v13;
          uint64_t v25 = 0;
          goto LABEL_31;
        }
LABEL_28:
        uint64_t v13 = [v11 currencyAmount];
        uint64_t v18 = [(WFHandlePaymentIntentAction *)self currencyUnsupportedErrorWithAmount:v13];
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 unsupportedReason] == 2)
      {
        v19 = self;
        uint64_t v20 = 0;
        goto LABEL_22;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  id v11 = v10;
  if ([v8 resolutionResultCode] != 1) {
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v8 unsupportedReason];
    if (v12 != 3)
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          uint64_t v13 = [v11 currencyAmount];
          v14 = self;
          uint64_t v15 = v13;
          uint64_t v16 = 1;
LABEL_15:
          uint64_t v18 = [(WFHandlePaymentIntentAction *)v14 amountBelowMinimumErrorWithAmount:v15 sending:v16];
LABEL_32:
          v21 = (void *)v18;

          goto LABEL_33;
        }
        goto LABEL_23;
      }
      uint64_t v13 = [v11 currencyAmount];
      v23 = self;
      v24 = v13;
      uint64_t v25 = 1;
LABEL_31:
      uint64_t v18 = [(WFHandlePaymentIntentAction *)v23 amountAboveMaximumErrorWithAmount:v24 sending:v25];
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 unsupportedReason] != 3) {
    goto LABEL_23;
  }
  v19 = self;
  uint64_t v20 = 1;
LABEL_22:
  v21 = [(WFHandlePaymentIntentAction *)v19 noRecipientAccountError:v20];
LABEL_33:

LABEL_25:
  return v21;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *, void))a7;
  uint64_t v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"currencyAmount"];

  if (v18)
  {
    id v19 = v13;
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [MEMORY[0x263F087B8] decimalNumberHandlerWithRoundingMode:2 scale:4 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:1];
        v21 = [v19 magnitude];
        v22 = [v21 decimalNumberByRoundingAccordingToBehavior:v20];

        v23 = [v19 unitString];
        v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          v27 = [MEMORY[0x263EFF960] currentLocale];
          id v25 = [v27 currencyCode];
        }
        objc_super v26 = (void *)[objc_alloc(MEMORY[0x263F0FA48]) initWithAmount:v22 currencyCode:v25];
      }
      else
      {
        objc_super v26 = 0;
        uint64_t v20 = v19;
        id v19 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
      objc_super v26 = 0;
    }

    v16[2](v16, v26, 0);
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WFHandlePaymentIntentAction;
    [(WFHandleIntentAction *)&v28 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

- (id)minimumSupportedClientVersion
{
  v5.receiver = self;
  v5.super_class = (Class)WFHandlePaymentIntentAction;
  v2 = [(WFHandlePaymentIntentAction *)&v5 minimumSupportedClientVersion];
  BOOL v3 = WFMaximumBundleVersion();

  return v3;
}

- (BOOL)opensInApp
{
  v2 = [(WFHandlePaymentIntentAction *)self parameterValueForKey:@"WFVenmoActionAppSwitch" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)showsWhenRunIfApplicable
{
  char v3 = [(WFHandleSystemIntentAction *)self intentDescription];
  int v4 = objc_msgSend((id)objc_msgSend(v3, "facadeClass"), "isSubclassOfClass:", objc_opt_class());

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFHandlePaymentIntentAction;
    objc_super v5 = [(WFHandleIntentAction *)&v7 showsWhenRunIfApplicable];
  }
  else
  {
    objc_super v5 = (void *)MEMORY[0x263EFFA88];
  }
  return v5;
}

- (id)disabledOnPlatforms
{
  v10.receiver = self;
  v10.super_class = (Class)WFHandlePaymentIntentAction;
  char v3 = [(WFHandleIntentAction *)&v10 disabledOnPlatforms];
  int v4 = [(WFHandlePaymentIntentAction *)self identifier];
  if ([v4 isEqualToString:@"sirikit.intent.payments.SendPaymentIntent"])
  {

LABEL_4:
    id v7 = [v3 arrayByAddingObject:*MEMORY[0x263F871E8]];
    goto LABEL_6;
  }
  objc_super v5 = [(WFHandlePaymentIntentAction *)self identifier];
  int v6 = [v5 isEqualToString:@"sirikit.intent.payments.RequestPaymentIntent"];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = v3;
LABEL_6:
  id v8 = v7;

  return v8;
}

@end