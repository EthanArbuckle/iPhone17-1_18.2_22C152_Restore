@interface AKLoginCodeNotificationBuilder
+ (__CFUserNotification)buildLoginCodeNotificationWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6;
+ (id)buildLoginCodeNotificationOptionsWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6;
@end

@implementation AKLoginCodeNotificationBuilder

+ (__CFUserNotification)buildLoginCodeNotificationWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([MEMORY[0x1E4F46FF0] deviceIsAudioAccessory])
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationWithTitle:body:footer:loginCode:](v13);
    }

    v14 = 0;
  }
  else
  {
    CFDictionaryRef v15 = +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationOptionsWithTitle:v9 body:v10 footer:v11 loginCode:v12];
    v14 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v15);
  }
  return v14;
}

+ (id)buildLoginCodeNotificationOptionsWithTitle:(id)a3 body:(id)a4 footer:(id)a5 loginCode:(id)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(AKAppleIDAuthenticationContext);
  [(AKAppleIDAuthenticationContext *)v13 _setMessage:v12];

  [(AKAppleIDAuthenticationContext *)v13 setReason:v11];
  v14 = NSString;
  uint64_t v15 = [v9 unsignedIntValue];

  v16 = objc_msgSend(v14, "stringWithFormat:", @"%06u", v15);
  [(AKAppleIDAuthenticationContext *)v13 setGeneratedCode:v16];

  [(AKAppleIDAuthenticationContext *)v13 setNotificationDisclaimer:v10];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v19 = [v18 localizedStringForKey:@"LOGIN_CODE_ALERT_OK_BUTTON" value:&stru_1EE40D360 table:@"Localizable"];
  [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

  v20 = [(AKAppleIDAuthenticationContext *)v13 _message];
  [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];

  v21 = [(AKAppleIDAuthenticationContext *)v13 _interpolatedReason];
  [v17 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];

  uint64_t v22 = MEMORY[0x1E4F1CC38];
  [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v24 = [v23 resourceURL];
  [v17 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];

  v25 = [MEMORY[0x1E4F28C80] extensionItemWithAppleIDAuthenticationContext:v13];
  v26 = (void *)MEMORY[0x1E4F28DB0];
  v31[0] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v28 = [v26 archivedDataWithRootObject:v27 requiringSecureCoding:1 error:0];

  uint64_t v29 = *MEMORY[0x1E4FA7350];
  [v17 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4FA7350]];
  [v17 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4FA7328]];
  [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
  [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FA7378]];
  [v17 setObject:v28 forKeyedSubscript:v29];
  [v17 setObject:@"com.apple.AuthKitUI.AKSecondFactorAlert" forKeyedSubscript:*MEMORY[0x1E4FA7348]];

  return v17;
}

+ (void)buildLoginCodeNotificationWithTitle:(os_log_t)log body:footer:loginCode:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Attempted to show login code CFUserNotification on HomePod, AuthKit prompts aren't made for this!", v1, 2u);
}

@end