@interface AKBiometricRatchetUIContext
- (AKBiometricRatchetUIContext)initWithAttributes:(id)a3 presentationContext:(id)a4;
- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8;
- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15;
- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15 embeddedUIPresentationMode:(id)a16 embeddedUIRightNavButtonTitle:(id)a17;
- (AKBiometricRatchetUIProvider)bioRatchetUIProvider;
- (NSString)debugDescription;
- (NSString)embeddedUIPresentationMode;
- (NSString)embeddedUIRightNavButtonTitle;
- (UIViewController)presentingViewController;
- (id)_findMappedDeeplinkFor:(id)a3 withKey:(id)a4;
- (void)_assertValidPresentingViewController;
- (void)presentRatchetUIWithCompletion:(id)a3;
- (void)setBioRatchetUIProvider:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AKBiometricRatchetUIContext

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AKBiometricRatchetUIContext;
  v15 = [(AKBiometricRatchetContext *)&v18 initWithReason:a3 calloutReason:a4 deeplinkURL:a5 fallbackToNoAuth:v9 useShortExpiration:v8];
  v16 = v15;
  if (v15) {
    objc_storeWeak((id *)&v15->_presentingViewController, v14);
  }

  return v16;
}

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15
{
  BOOL v24 = a7;
  BOOL v25 = a8;
  id v19 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AKBiometricRatchetUIContext;
  v20 = [(AKBiometricRatchetContext *)&v26 initWithReason:a3 calloutReason:a4 deeplinkURL:a5 fallbackToNoAuth:v24 useShortExpiration:v25 beginRatchetTitle:a9 beginRatchetBody:a10 showsLocationWarning:a11 countdownText:a12 findMyErrorTitle:a13 findMyErrorMessage:a14 metaContext:a15];
  v21 = v20;
  if (v20) {
    objc_storeWeak((id *)&v20->_presentingViewController, v19);
  }

  return v21;
}

- (AKBiometricRatchetUIContext)initWithReason:(id)a3 calloutReason:(id)a4 deeplinkURL:(id)a5 presentationContext:(id)a6 fallbackToNoAuth:(BOOL)a7 useShortExpiration:(BOOL)a8 beginRatchetTitle:(id)a9 beginRatchetBody:(id)a10 showsLocationWarning:(BOOL)a11 countdownText:(id)a12 findMyErrorTitle:(id)a13 findMyErrorMessage:(id)a14 metaContext:(id)a15 embeddedUIPresentationMode:(id)a16 embeddedUIRightNavButtonTitle:(id)a17
{
  BOOL v27 = a7;
  BOOL v28 = a8;
  id v19 = a6;
  id v29 = a16;
  id v20 = a17;
  v30.receiver = self;
  v30.super_class = (Class)AKBiometricRatchetUIContext;
  v21 = [(AKBiometricRatchetContext *)&v30 initWithReason:a3 calloutReason:a4 deeplinkURL:a5 fallbackToNoAuth:v27 useShortExpiration:v28 beginRatchetTitle:a9 beginRatchetBody:a10 showsLocationWarning:a11 countdownText:a12 findMyErrorTitle:a13 findMyErrorMessage:a14 metaContext:a15];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_presentingViewController, v19);
    objc_storeStrong((id *)&v22->_embeddedUIPresentationMode, a16);
    objc_storeStrong((id *)&v22->_embeddedUIRightNavButtonTitle, a17);
  }

  return v22;
}

- (AKBiometricRatchetUIContext)initWithAttributes:(id)a3 presentationContext:(id)a4
{
  id v6 = a3;
  id v50 = a4;
  objc_opt_class();
  id v7 = [v6 objectForKeyedSubscript:@"fallback"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    unsigned int v9 = [v8 BOOLValue];
  }
  else {
    unsigned int v9 = 0;
  }
  objc_opt_class();
  id v10 = [v6 objectForKeyedSubscript:@"fallbackText"];
  unsigned int v55 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (!v11)
  {
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v12 localizedStringForKey:@"BIOMETRIC_RATCHET_FALLBACK_TEXT" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v13 = [v6 objectForKeyedSubscript:@"reason"];
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (!v14)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v15 localizedStringForKey:@"BIOMETRIC_RATCHET_COUNTDOWN_TEXT" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v16 = [v6 objectForKeyedSubscript:@"calloutReason"];
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (!v17)
  {
    objc_super v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = [v18 localizedStringForKey:@"BIOMETRIC_RATCHET_CALLOUT_REASON" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v19 = [v6 objectForKeyedSubscript:@"deeplink"];
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  objc_opt_class();
  id v21 = [v6 objectForKeyedSubscript:@"deeplinkType"];
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  v53 = v22;
  if (v20 && v22)
  {
    uint64_t v23 = [(AKBiometricRatchetUIContext *)self _findMappedDeeplinkFor:v20 withKey:v22];
  }
  else
  {
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"prefs:root=APPLE_ACCOUNT"];
  }
  v49 = (void *)v23;
  objc_opt_class();
  id v24 = [v6 objectForKeyedSubscript:@"beginRatchetTitle"];
  if (objc_opt_isKindOfClass()) {
    id v25 = v24;
  }
  else {
    id v25 = 0;
  }
  v54 = v20;

  if (!v25)
  {
    objc_super v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v25 = [v26 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_TITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v27 = [v6 objectForKeyedSubscript:@"beginRatchetBody"];
  v56 = v8;
  if (objc_opt_isKindOfClass()) {
    id v28 = v27;
  }
  else {
    id v28 = 0;
  }

  if (!v28)
  {
    id v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v28 = [v29 localizedStringForKey:@"BIOMETRIC_RATCHET_BEGIN_RATCHET_BODY" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v30 = [v6 objectForKeyedSubscript:@"disableFM"];
  if (objc_opt_isKindOfClass()) {
    id v31 = v30;
  }
  else {
    id v31 = 0;
  }

  v52 = v31;
  if (v31) {
    char v51 = [v31 BOOLValue];
  }
  else {
    char v51 = 0;
  }
  objc_opt_class();
  id v32 = [v6 objectForKeyedSubscript:@"disableFMErrorTitle"];
  v59 = v17;
  if (objc_opt_isKindOfClass()) {
    id v33 = v32;
  }
  else {
    id v33 = 0;
  }

  if (!v33)
  {
    v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v33 = [v34 localizedStringForKey:@"BIOMETRIC_RATCHET_FIND_MY_ERROR_TITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v35 = [v6 objectForKeyedSubscript:@"disableFMErrorMessage"];
  v60 = v14;
  if (objc_opt_isKindOfClass()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }

  if (!v36)
  {
    v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v36 = [v37 localizedStringForKey:@"BIOMETRIC_RATCHET_FIND_MY_ERROR_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v38 = [v6 objectForKeyedSubscript:@"metaContext"];
  v57 = v25;
  v58 = v11;
  if (objc_opt_isKindOfClass()) {
    id v39 = v38;
  }
  else {
    id v39 = 0;
  }

  objc_opt_class();
  id v40 = [v6 objectForKeyedSubscript:@"presentationMode"];
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }

  if (!v41)
  {
    v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v41 = [v42 localizedStringForKey:@"BIOMETRIC_RATCHET_EMBEDDEDUI_PRESENTATION_MODE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  objc_opt_class();
  id v43 = [v6 objectForKeyedSubscript:@"rightNavBarButtonTitle"];
  if (objc_opt_isKindOfClass()) {
    id v44 = v43;
  }
  else {
    id v44 = 0;
  }

  if (!v44)
  {
    v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v44 = [v45 localizedStringForKey:@"BIOMETRIC_RATCHET_EMBEDDEDUI_RIGHT_NAVBUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable-DTO"];
  }
  v61.receiver = self;
  v61.super_class = (Class)AKBiometricRatchetUIContext;
  v46 = [(AKBiometricRatchetContext *)&v61 initWithReason:v58 calloutReason:v59 deeplinkURL:v49 fallbackToNoAuth:v55 useShortExpiration:0 beginRatchetTitle:v57 beginRatchetBody:v28 showsLocationWarning:v51 countdownText:v60 findMyErrorTitle:v33 findMyErrorMessage:v36 metaContext:v39];
  v47 = v46;
  if (v46)
  {
    objc_storeWeak((id *)&v46->_presentingViewController, v50);
    objc_storeStrong((id *)&v47->_embeddedUIPresentationMode, v41);
    objc_storeStrong((id *)&v47->_embeddedUIRightNavButtonTitle, v44);
  }

  return v47;
}

- (AKBiometricRatchetUIProvider)bioRatchetUIProvider
{
  bioRatchetUIProvider = self->_bioRatchetUIProvider;
  if (!bioRatchetUIProvider)
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Bio Ratchet UI Provider initialized", v8, 2u);
    }

    v5 = [[AKBiometricRatchetiOSUIProvider alloc] initWithContext:self];
    id v6 = self->_bioRatchetUIProvider;
    self->_bioRatchetUIProvider = (AKBiometricRatchetUIProvider *)v5;

    bioRatchetUIProvider = self->_bioRatchetUIProvider;
  }

  return bioRatchetUIProvider;
}

- (void)_assertValidPresentingViewController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is missing! Things don't look good!", v1, 2u);
}

- (void)presentRatchetUIWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKBiometricRatchetUIContext presentRatchetUIWithCompletion:](v5);
  }

  id v6 = [(AKBiometricRatchetUIContext *)self bioRatchetUIProvider];
  [v6 presentRatchetUIWithCompletion:v4];
}

- (NSString)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)AKBiometricRatchetUIContext;
  v3 = [(AKBiometricRatchetContext *)&v8 debugDescription];
  id v4 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v6 = [v4 stringWithFormat:@"%@ \tpresentationContext: %@,\n", v3, WeakRetained];

  return (NSString *)v6;
}

- (id)_findMappedDeeplinkFor:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"url"])
  {
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"urlBagKey"])
  {
    objc_super v8 = [MEMORY[0x1E4F4F0C8] sharedBag];
    id v7 = [v8 urlAtKey:v6];

    if (v7) {
      goto LABEL_9;
    }
    unsigned int v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKBiometricRatchetUIContext _findMappedDeeplinkFor:withKey:]((uint64_t)v6, v9);
    }
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSString)embeddedUIPresentationMode
{
  return self->_embeddedUIPresentationMode;
}

- (NSString)embeddedUIRightNavButtonTitle
{
  return self->_embeddedUIRightNavButtonTitle;
}

- (void)setBioRatchetUIProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioRatchetUIProvider, 0);
  objc_storeStrong((id *)&self->_embeddedUIRightNavButtonTitle, 0);
  objc_storeStrong((id *)&self->_embeddedUIPresentationMode, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)presentRatchetUIWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Calling bioRatchetUIProvider to present the ratchet arming UI", v1, 2u);
}

- (void)_findMappedDeeplinkFor:(uint64_t)a1 withKey:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "URL not found for key: %@", (uint8_t *)&v2, 0xCu);
}

@end