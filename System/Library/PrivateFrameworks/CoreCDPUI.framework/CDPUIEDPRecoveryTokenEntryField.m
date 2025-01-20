@interface CDPUIEDPRecoveryTokenEntryField
- (CDPUIEDPRecoveryTokenEntryField)initWithPlaceholder:(id)a3;
@end

@implementation CDPUIEDPRecoveryTokenEntryField

- (CDPUIEDPRecoveryTokenEntryField)initWithPlaceholder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPUIEDPRecoveryTokenEntryField;
  v5 = -[CDPUIEDPRecoveryTokenEntryField initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(CDPUIEDPRecoveryTokenEntryField *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setPlaceholder:v4];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setBorderStyle:3];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setTextAlignment:0];
    v7 = [MEMORY[0x263F825C8] systemGray6Color];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setBackgroundColor:v7];

    [(CDPUIEDPRecoveryTokenEntryField *)v6 setClearsOnInsertion:1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setClearButtonMode:1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setAutocapitalizationType:0];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setInlinePredictionType:1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setSmartDashesType:1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setReturnKeyType:11];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setWritingToolsBehavior:-1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setAutocorrectionType:1];
    [(CDPUIEDPRecoveryTokenEntryField *)v6 setSpellCheckingType:2];
  }

  return v6;
}

@end