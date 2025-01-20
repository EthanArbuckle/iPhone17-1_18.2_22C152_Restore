@interface AAUIDTOHelper
+ (BOOL)_shouldAllowOpForRatchetState:(id)a3;
- (AAUIDTOHelper)initWithDTOController:(id)a3;
- (BOOL)isDTOGatingEnabled;
- (id)_makeOpNotAllowedAlertForAddCustodian:(BOOL)a3;
- (id)makeCustodianAddOpNotAllowedAlert;
- (id)makeCustodianDeleteOpNotAllowedAlert;
- (id)makeGenericRatchetFailedAlert;
- (id)makeRatchetContextWithPresentationContext:(id)a3 DTOContextType:(int64_t)a4;
- (void)shouldAllowOpForContext:(id)a3 completion:(id)a4;
- (void)shouldGateUsingRatchetForAltDSID:(id)a3 completion:(id)a4;
@end

@implementation AAUIDTOHelper

- (AAUIDTOHelper)initWithDTOController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIDTOHelper;
  v6 = [(AAUIDTOHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (BOOL)isDTOGatingEnabled
{
  return [(AKBiometricRatchetController *)self->_controller isDTOEnabled];
}

- (void)shouldGateUsingRatchetForAltDSID:(id)a3 completion:(id)a4
{
}

+ (BOOL)_shouldAllowOpForRatchetState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 rawState] == 3 || objc_msgSend(v3, "rawState") == 4;

  return v4;
}

- (id)makeRatchetContextWithPresentationContext:(id)a3 DTOContextType:(int64_t)a4
{
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  v7 = [v5 bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BIOMETRIC_RATCHET_FALLBACK_TEXT" value:&stru_26BD39CD8 table:@"Localizable"];

  objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY" value:&stru_26BD39CD8 table:@"Localizable"];

  if (a4 == 2)
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v18 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE_DELETE_RC" value:&stru_26BD39CD8 table:@"Localizable"];

    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v19 localizedStringForKey:@"BIOMETRIC_RATCHET_COUNTDOWN_TEXT_DELETE_RC" value:&stru_26BD39CD8 table:@"Localizable"];

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = v15;
    v17 = @"BIOMETRIC_RATCHET_CALLOUT_REASON_DELETE";
  }
  else
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (a4 == 1)
    {
      v12 = [v11 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE_ADD_RC" value:&stru_26BD39CD8 table:@"Localizable"];

      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"BIOMETRIC_RATCHET_COUNTDOWN_TEXT_ADD_RC" value:&stru_26BD39CD8 table:@"Localizable"];

      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = v15;
      v17 = @"BIOMETRIC_RATCHET_CALLOUT_REASON_ADD";
    }
    else
    {
      v12 = [v11 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];

      v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [v20 localizedStringForKey:@"BIOMETRIC_RATCHET_COUNTDOWN_TEXT" value:&stru_26BD39CD8 table:@"Localizable"];

      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = v15;
      v17 = @"BIOMETRIC_RATCHET_CALLOUT_REASON";
    }
  }
  v21 = [v15 localizedStringForKey:v17 value:&stru_26BD39CD8 table:@"Localizable"];

  id v22 = objc_alloc(MEMORY[0x263F292E0]);
  v23 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery"];
  LOBYTE(v26) = 0;
  v24 = (void *)[v22 initWithReason:v8 calloutReason:v21 deeplinkURL:v23 presentationContext:v6 fallbackToNoAuth:0 useShortExpiration:0 beginRatchetTitle:v12 beginRatchetBody:v10 showsLocationWarning:v26 countdownText:v14 findMyErrorTitle:&stru_26BD39CD8 findMyErrorMessage:&stru_26BD39CD8 metaContext:0];

  return v24;
}

- (void)shouldAllowOpForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  controller = self->_controller;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke;
  v9[3] = &unk_263F93A28;
  id v10 = v6;
  id v8 = v6;
  [(AKBiometricRatchetController *)controller armWithContext:a3 completion:v9];
}

void __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke_cold_1((uint64_t)v6, v7);
  }

  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    objc_super v9 = [v5 ratchetState];
    BOOL v10 = +[AAUIDTOHelper _shouldAllowOpForRatchetState:v9];
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, BOOL, void))(v11 + 16))(v11, v10, 0);
    }
  }
}

- (id)makeCustodianDeleteOpNotAllowedAlert
{
  return [(AAUIDTOHelper *)self _makeOpNotAllowedAlertForAddCustodian:0];
}

- (id)makeCustodianAddOpNotAllowedAlert
{
  return [(AAUIDTOHelper *)self _makeOpNotAllowedAlertForAddCustodian:1];
}

- (id)_makeOpNotAllowedAlertForAddCustodian:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"RATCHET_RC_EDIT_NOT_ALLOWED_ALERT_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v3)
  {
    v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RATCHET_RC_ADD_NOT_ALLOWED_ALERT_TITLE"];
    uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_26BD39CD8 table:@"Localizable"];

    objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"RATCHET_RC_ADD_NOT_ALLOWED_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];

    if (![MEMORY[0x263F202D8] isVirtualMachine]) {
      goto LABEL_7;
    }
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = v11;
    v13 = @"RATCHET_RC_ADD_NOT_ALLOWED_MESSAGE_VM";
  }
  else
  {
    v14 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RATCHET_RC_DELETE_NOT_ALLOWED_ALERT_TITLE"];
    uint64_t v8 = [v6 localizedStringForKey:v14 value:&stru_26BD39CD8 table:@"Localizable"];

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [v15 localizedStringForKey:@"RATCHET_RC_DELETE_NOT_ALLOWED_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];

    if (![MEMORY[0x263F202D8] isVirtualMachine]) {
      goto LABEL_7;
    }
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = v11;
    v13 = @"RATCHET_RC_DELETE_NOT_ALLOWED_MESSAGE_VM";
  }
  uint64_t v16 = [v11 localizedStringForKey:v13 value:&stru_26BD39CD8 table:@"Localizable"];

  BOOL v10 = (void *)v16;
LABEL_7:
  v17 = _AAUILogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    [(AAUIDTOHelper *)(uint64_t)v8 _makeOpNotAllowedAlertForAddCustodian:v17];
  }

  v18 = [MEMORY[0x263F82418] alertWithTitle:v8 message:v10 buttonTitle:v5];

  return v18;
}

- (id)makeGenericRatchetFailedAlert
{
  v2 = (void *)MEMORY[0x263F82418];
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"RATCHET_RC_EDIT_NOT_ALLOWED_ALERT_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"RATCHET_RC_EDIT_GENERIC_RATCHET_FAILURE_ALERT_DESCRIPTION" value:&stru_26BD39CD8 table:@"Localizable"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"RATCHET_RC_EDIT_GENERIC_RATCHET_FAILURE_ALERT_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
  objc_super v9 = [v2 alertWithTitle:v4 message:v6 buttonTitle:v8];

  return v9;
}

- (void).cxx_destruct
{
}

void __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Calling armed ratchet error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_makeOpNotAllowedAlertForAddCustodian:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "title: %@, message: %@", (uint8_t *)&v3, 0x16u);
}

@end