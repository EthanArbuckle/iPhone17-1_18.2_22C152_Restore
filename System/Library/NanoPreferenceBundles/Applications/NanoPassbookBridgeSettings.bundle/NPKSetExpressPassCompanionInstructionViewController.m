@interface NPKSetExpressPassCompanionInstructionViewController
- (NSString)cardName;
- (id)_errorAcknowledgeButtonTitle;
- (id)_errorMessage;
- (id)_errorTitle;
- (id)_instructionMessage;
- (id)_instructionTitle;
- (id)_unlockRequiredMessage;
- (id)_unlockRequiredTitle;
- (int64_t)paymentCardType;
- (unint64_t)messageType;
- (void)handleSetExpressPassError;
- (void)handleSetExpressPassUnlockRequired;
- (void)setCardName:(id)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setPaymentCardType:(int64_t)a3;
@end

@implementation NPKSetExpressPassCompanionInstructionViewController

- (void)handleSetExpressPassError
{
  id v5 = [(NPKSetExpressPassCompanionInstructionViewController *)self _errorTitle];
  v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self _errorMessage];
  v4 = [(NPKSetExpressPassCompanionInstructionViewController *)self _errorAcknowledgeButtonTitle];
  [(NPKBridgeInstructionViewController *)self handleErrorWithTitle:v5 message:v3 acknowledgeButtonTitle:v4];
}

- (void)handleSetExpressPassUnlockRequired
{
  id v5 = [(NPKSetExpressPassCompanionInstructionViewController *)self _unlockRequiredTitle];
  v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self _unlockRequiredMessage];
  v4 = [(NPKSetExpressPassCompanionInstructionViewController *)self _errorAcknowledgeButtonTitle];
  [(NPKBridgeInstructionViewController *)self handleErrorWithTitle:v5 message:v3 acknowledgeButtonTitle:v4];
}

- (id)_instructionTitle
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = sub_191C0(@"INSTRUCTION_TITLE", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
  id v5 = [v3 localizedStringForKey:v4 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v5;
}

- (id)_instructionMessage
{
  unint64_t v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self messageType];
  v4 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];
  id v5 = v4;
  if (!v3)
  {

    if (!v5)
    {
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
      v9 = @"INSTRUCTION_ENABLE_MESSAGE_NO_CARD_NAME";
      goto LABEL_10;
    }
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
    v11 = @"INSTRUCTION_ENABLE_MESSAGE";
LABEL_8:
    v12 = sub_191C0(v11, v10);
    v13 = [v7 localizedStringForKey:v12 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
    v14 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);

    goto LABEL_11;
  }
  if (v4)
  {
    int64_t v6 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];

    if (v6 != 3)
    {
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v10 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
      v11 = @"INSTRUCTION_DISABLE_MESSAGE";
      goto LABEL_8;
    }
  }
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
  v9 = @"INSTRUCTION_DISABLE_MESSAGE_NO_CARD_NAME";
LABEL_10:
  v12 = sub_191C0(v9, v8);
  v15 = [v7 localizedStringForKey:v12 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
LABEL_11:

  return v15;
}

- (id)_errorTitle
{
  unint64_t v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self messageType];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
  if (v3) {
    int64_t v6 = @"DISABLE_ERROR_TITLE";
  }
  else {
    int64_t v6 = @"SET_CARD_ERROR_TITLE";
  }
  v7 = sub_191C0(v6, v5);
  uint64_t v8 = [v4 localizedStringForKey:v7 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v8;
}

- (id)_errorMessage
{
  unint64_t v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self messageType];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType];
  if (v3)
  {
    int64_t v6 = sub_191C0(@"DISABLE_ERROR_MESSAGE", v5);
    v7 = [v4 localizedStringForKey:v6 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  }
  else
  {
    uint64_t v8 = sub_191C0(@"SET_CARD_ERROR_MESSAGE_NO_CARD_NAME", v5);
    v7 = [v4 localizedStringForKey:v8 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

    v9 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];

    if (!v9) {
      goto LABEL_6;
    }
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    int64_t v6 = sub_191C0(@"SET_CARD_ERROR_MESSAGE", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
    uint64_t v10 = [v4 localizedStringForKey:v6 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
    v11 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

    v7 = (void *)v12;
  }

LABEL_6:

  return v7;
}

- (id)_unlockRequiredTitle
{
  unint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = sub_191C0(@"SET_CARD_UNLOCK_REQUIRED_TITLE", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
  uint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v5;
}

- (id)_unlockRequiredMessage
{
  unint64_t v3 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];

  +[NSBundle bundleForClass:objc_opt_class()];
  if (v3) {
    v4 = {;
  }
    uint64_t v5 = sub_191C0(@"SET_CARD_UNLOCK_REQUIRED_MESSAGE", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
    int64_t v6 = [v4 localizedStringForKey:v5 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
    v7 = [(NPKSetExpressPassCompanionInstructionViewController *)self cardName];
    uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
  }
  else {
    v4 = {;
  }
    uint64_t v5 = sub_191C0(@"SET_CARD_UNLOCK_REQUIRED_MESSAGE_NO_CARD_NAME", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
    uint64_t v8 = [v4 localizedStringForKey:v5 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  }

  return v8;
}

- (id)_errorAcknowledgeButtonTitle
{
  unint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = sub_191C0(@"ERROR_ACKNOWLEDGE_BUTTON_TITLE", [(NPKSetExpressPassCompanionInstructionViewController *)self paymentCardType]);
  uint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v5;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (int64_t)paymentCardType
{
  return self->_paymentCardType;
}

- (void)setPaymentCardType:(int64_t)a3
{
  self->_paymentCardType = a3;
}

- (NSString)cardName
{
  return self->_cardName;
}

- (void)setCardName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end