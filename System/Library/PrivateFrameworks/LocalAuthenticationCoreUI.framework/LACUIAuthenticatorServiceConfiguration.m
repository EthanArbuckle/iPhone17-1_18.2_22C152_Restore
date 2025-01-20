@interface LACUIAuthenticatorServiceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)headerHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresIntent;
- (LACUIAuthenticatorServiceConfiguration)initWithCoder:(id)a3;
- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3;
- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4;
- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4 options:(id)a5;
- (NSData)contextData;
- (NSString)bundleIdentifier;
- (NSString)cancelButtonTitle;
- (NSString)fallbackButtonTitle;
- (NSString)iconPath;
- (NSString)passwordFieldPlaceholder;
- (NSString)prompt;
- (NSString)subtitle;
- (NSString)title;
- (NSString)verifyPrompt;
- (id)description;
- (id)validateConfiguration;
- (int64_t)passcodeLength;
- (unint64_t)mode;
- (unint64_t)requirement;
- (unint64_t)style;
- (void)_configureFallbackButtonTitleForRequirement:(uint64_t)a1;
- (void)_validateEnterConfiguration;
- (void)_validateRegisterConfiguration;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setFallbackButtonTitle:(id)a3;
- (void)setHeaderHidden:(BOOL)a3;
- (void)setIconPath:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPasscodeLength:(int64_t)a3;
- (void)setPasswordFieldPlaceholder:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setRequiresIntent:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVerifyPrompt:(id)a3;
@end

@implementation LACUIAuthenticatorServiceConfiguration

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3
{
  return [(LACUIAuthenticatorServiceConfiguration *)self initWithContext:a3 requirement:1];
}

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LACUIAuthenticatorServiceConfiguration;
  v8 = [(LACUIAuthenticatorServiceConfiguration *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->_requirement = a4;
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 infoDictionary];
    v12 = [v11 objectForKey:@"CFBundleName"];
    [(LACUIAuthenticatorServiceConfiguration *)v9 setTitle:v12];

    v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 bundleIdentifier];
    [(LACUIAuthenticatorServiceConfiguration *)v9 setBundleIdentifier:v14];

    [(LACUIAuthenticatorServiceConfiguration *)v9 setPasscodeLength:6];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"BUTTON_CANCEL" value:&stru_270434680 table:@"Localizable"];
    [(LACUIAuthenticatorServiceConfiguration *)v9 setCancelButtonTitle:v16];

    v9->_mode = 0;
    objc_storeStrong((id *)&v9->_contextData, a3);
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"ENTER_PASSWORD" value:&stru_270434680 table:@"Localizable"];
    passwordFieldPlaceholder = v9->_passwordFieldPlaceholder;
    v9->_passwordFieldPlaceholder = (NSString *)v18;

    v9->_requiresIntent = 1;
    -[LACUIAuthenticatorServiceConfiguration _configureFallbackButtonTitleForRequirement:]((uint64_t)v9, a4);
  }

  return v9;
}

- (void)_configureFallbackButtonTitleForRequirement:(uint64_t)a1
{
  if (a1)
  {
    switch(a2)
    {
      case 2:
      case 4:
        v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v8 = v3;
        v4 = @"DEVICE_PASSCODE";
        goto LABEL_5;
      case 3:
      case 5:
        v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v8 = v3;
        v4 = @"CUSTOM_PASSWORD";
LABEL_5:
        uint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_270434680 table:@"Localizable"];
        v6 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v5;

        id v7 = v8;
        break;
      default:
        id v7 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;
        break;
    }
  }
}

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4 options:(id)a5
{
  id v8 = a5;
  v9 = [(LACUIAuthenticatorServiceConfiguration *)self initWithContext:a3 requirement:a4];
  v10 = [NSNumber numberWithInteger:*MEMORY[0x263F523B8]];
  v11 = [v8 objectForKeyedSubscript:v10];
  [(LACUIAuthenticatorServiceConfiguration *)v9 setSubtitle:v11];

  v12 = [NSNumber numberWithInteger:*MEMORY[0x263F523E8]];
  v13 = [v8 objectForKeyedSubscript:v12];

  [(LACUIAuthenticatorServiceConfiguration *)v9 setIconPath:v13];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LACUIAuthenticatorServiceConfiguration *)self title];
  v6 = NSStringFromSelector(sel_title);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(LACUIAuthenticatorServiceConfiguration *)self bundleIdentifier];
  id v8 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(LACUIAuthenticatorServiceConfiguration *)self iconPath];
  v10 = NSStringFromSelector(sel_iconPath);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(LACUIAuthenticatorServiceConfiguration *)self subtitle];
  v12 = NSStringFromSelector(sel_subtitle);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(LACUIAuthenticatorServiceConfiguration *)self cancelButtonTitle];
  v14 = NSStringFromSelector(sel_cancelButtonTitle);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(LACUIAuthenticatorServiceConfiguration *)self contextData];
  v16 = NSStringFromSelector(sel_contextData);
  [v4 encodeObject:v15 forKey:v16];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration requirement](self, "requirement"));
  uint64_t v18 = NSStringFromSelector(sel_requirement);
  [v4 encodeObject:v17 forKey:v18];

  v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACUIAuthenticatorServiceConfiguration passcodeLength](self, "passcodeLength"));
  v20 = NSStringFromSelector(sel_passcodeLength);
  [v4 encodeObject:v19 forKey:v20];

  objc_super v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration mode](self, "mode"));
  v22 = NSStringFromSelector(sel_mode);
  [v4 encodeObject:v21 forKey:v22];

  v23 = [(LACUIAuthenticatorServiceConfiguration *)self prompt];
  v24 = NSStringFromSelector(sel_prompt);
  [v4 encodeObject:v23 forKey:v24];

  v25 = [(LACUIAuthenticatorServiceConfiguration *)self verifyPrompt];
  v26 = NSStringFromSelector(sel_verifyPrompt);
  [v4 encodeObject:v25 forKey:v26];

  v27 = [(LACUIAuthenticatorServiceConfiguration *)self fallbackButtonTitle];
  v28 = NSStringFromSelector(sel_fallbackButtonTitle);
  [v4 encodeObject:v27 forKey:v28];

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration style](self, "style"));
  v30 = NSStringFromSelector(sel_style);
  [v4 encodeObject:v29 forKey:v30];

  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[LACUIAuthenticatorServiceConfiguration headerHidden](self, "headerHidden"));
  v32 = NSStringFromSelector(sel_headerHidden);
  [v4 encodeObject:v31 forKey:v32];

  v33 = [(LACUIAuthenticatorServiceConfiguration *)self passwordFieldPlaceholder];
  v34 = NSStringFromSelector(sel_passwordFieldPlaceholder);
  [v4 encodeObject:v33 forKey:v34];

  objc_msgSend(NSNumber, "numberWithBool:", -[LACUIAuthenticatorServiceConfiguration requiresIntent](self, "requiresIntent"));
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  v35 = NSStringFromSelector(sel_requiresIntent);
  [v4 encodeObject:v36 forKey:v35];
}

- (LACUIAuthenticatorServiceConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromSelector(sel_title);
  v60 = [v3 decodeObjectOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(sel_bundleIdentifier);
  v58 = [v3 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_iconPath);
  v57 = [v3 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_subtitle);
  v56 = [v3 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v12 = objc_opt_class();
  v13 = NSStringFromSelector(sel_cancelButtonTitle);
  v55 = [v3 decodeObjectOfClass:v12 forKey:v13];

  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_contextData);
  v54 = [v3 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_requirement);
  uint64_t v18 = [v3 decodeObjectOfClass:v16 forKey:v17];
  uint64_t v52 = [v18 integerValue];

  uint64_t v19 = objc_opt_class();
  v20 = NSStringFromSelector(sel_fallbackButtonTitle);
  v53 = [v3 decodeObjectOfClass:v19 forKey:v20];

  uint64_t v21 = objc_opt_class();
  v22 = NSStringFromSelector(sel_passcodeLength);
  v23 = [v3 decodeObjectOfClass:v21 forKey:v22];
  uint64_t v51 = (int)[v23 intValue];

  uint64_t v24 = objc_opt_class();
  v25 = NSStringFromSelector(sel_mode);
  v26 = [v3 decodeObjectOfClass:v24 forKey:v25];
  uint64_t v50 = [v26 unsignedIntValue];

  uint64_t v27 = objc_opt_class();
  v28 = NSStringFromSelector(sel_prompt);
  v49 = [v3 decodeObjectOfClass:v27 forKey:v28];

  uint64_t v29 = objc_opt_class();
  v30 = NSStringFromSelector(sel_verifyPrompt);
  v48 = [v3 decodeObjectOfClass:v29 forKey:v30];

  uint64_t v31 = objc_opt_class();
  v32 = NSStringFromSelector(sel_style);
  v33 = [v3 decodeObjectOfClass:v31 forKey:v32];
  uint64_t v47 = [v33 unsignedIntValue];

  uint64_t v34 = objc_opt_class();
  v35 = NSStringFromSelector(sel_headerHidden);
  id v36 = [v3 decodeObjectOfClass:v34 forKey:v35];
  unsigned int v46 = [v36 BOOLValue];

  uint64_t v37 = objc_opt_class();
  v38 = NSStringFromSelector(sel_passwordFieldPlaceholder);
  v45 = [v3 decodeObjectOfClass:v37 forKey:v38];

  uint64_t v39 = objc_opt_class();
  v40 = NSStringFromSelector(sel_requiresIntent);
  v41 = [v3 decodeObjectOfClass:v39 forKey:v40];

  unsigned int v44 = [v41 BOOLValue];
  v42 = [(LACUIAuthenticatorServiceConfiguration *)self initWithContext:v54 requirement:v52];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setTitle:v60];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setBundleIdentifier:v58];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setIconPath:v57];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setSubtitle:v56];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setCancelButtonTitle:v55];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setFallbackButtonTitle:v53];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setPasscodeLength:v51];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setMode:v50];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setPrompt:v49];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setVerifyPrompt:v48];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setStyle:v47];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setHeaderHidden:v46];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setPasswordFieldPlaceholder:v45];
  [(LACUIAuthenticatorServiceConfiguration *)v42 setRequiresIntent:v44];

  return v42;
}

- (void)setFallbackButtonTitle:(id)a3
{
  id v8 = a3;
  if (v8
    && ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v8 stringByTrimmingCharactersInSet:v5],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    objc_storeStrong((id *)&self->_fallbackButtonTitle, a3);
  }
  else
  {
    -[LACUIAuthenticatorServiceConfiguration _configureFallbackButtonTitleForRequirement:]((uint64_t)self, self->_requirement);
  }
}

- (id)validateConfiguration
{
  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    -[LACUIAuthenticatorServiceConfiguration _validateRegisterConfiguration](self);
    id v3 = (const char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (mode) {
      goto LABEL_6;
    }
    -[LACUIAuthenticatorServiceConfiguration _validateEnterConfiguration](self);
    id v3 = (const char *)objc_claimAutoreleasedReturnValue();
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (void)_validateEnterConfiguration
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (v3
      && ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 stringByTrimmingCharactersInSet:v4],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 length],
          v5,
          v4,
          v6))
    {
      if (v2[10])
      {
        if (v2[11] != 0x7FFFFFFFFFFFFFFFLL)
        {
          a1 = 0;
          goto LABEL_10;
        }
        uint64_t v7 = @"There must be at least 1 authentication mechanism";
      }
      else
      {
        uint64_t v7 = @"Password field placeholder cannot be nil or empty";
      }
    }
    else
    {
      uint64_t v7 = @"Title cannot be nil or empty";
    }
    a1 = [MEMORY[0x263F52460] errorWithCode:*MEMORY[0x263F52328] debugDescription:v7];
LABEL_10:
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_validateRegisterConfiguration
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[2];
    if (v3
      && ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 stringByTrimmingCharactersInSet:v4],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 length],
          v5,
          v4,
          v6))
    {
      uint64_t v7 = v2[11];
      if (v7 == 5 || v7 == 3)
      {
        if (v2[10])
        {
          a1 = 0;
LABEL_10:
          uint64_t v1 = vars8;
          goto LABEL_11;
        }
        id v8 = @"Password field placeholder cannot be nil or empty";
      }
      else
      {
        id v8 = @"Invalid requirement used for register mode";
      }
    }
    else
    {
      id v8 = @"Title cannot be nil or empty";
    }
    a1 = [MEMORY[0x263F52460] errorWithCode:*MEMORY[0x263F52328] debugDescription:v8];
    goto LABEL_10;
  }
LABEL_11:
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LACUIAuthenticatorServiceConfiguration *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self != v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(LACUIAuthenticatorServiceConfiguration *)self title];
      uint64_t v7 = [(LACUIAuthenticatorServiceConfiguration *)v5 title];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_52;
      }
      v9 = [(LACUIAuthenticatorServiceConfiguration *)self bundleIdentifier];
      uint64_t v10 = [(LACUIAuthenticatorServiceConfiguration *)v5 bundleIdentifier];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_52;
      }
      uint64_t v12 = [(LACUIAuthenticatorServiceConfiguration *)self iconPath];
      if (v12
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 iconPath],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = [(LACUIAuthenticatorServiceConfiguration *)self iconPath];
        uint64_t v14 = [(LACUIAuthenticatorServiceConfiguration *)v5 iconPath];
        int v15 = [v13 isEqualToString:v14];

        if (v12)
        {

          if (!v15) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v15 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      v17 = [(LACUIAuthenticatorServiceConfiguration *)self subtitle];
      if (v17
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 subtitle],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v18 = [(LACUIAuthenticatorServiceConfiguration *)self subtitle];
        uint64_t v19 = [(LACUIAuthenticatorServiceConfiguration *)v5 subtitle];
        int v20 = [v18 isEqualToString:v19];

        if (v17)
        {

          if (!v20) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v20 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      uint64_t v21 = [(LACUIAuthenticatorServiceConfiguration *)self prompt];
      if (v21
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 prompt],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v22 = [(LACUIAuthenticatorServiceConfiguration *)self prompt];
        v23 = [(LACUIAuthenticatorServiceConfiguration *)v5 prompt];
        int v24 = [v22 isEqualToString:v23];

        if (v21)
        {

          if (!v24) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v24 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      v25 = [(LACUIAuthenticatorServiceConfiguration *)self verifyPrompt];
      if (v25
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 verifyPrompt],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v26 = [(LACUIAuthenticatorServiceConfiguration *)self verifyPrompt];
        uint64_t v27 = [(LACUIAuthenticatorServiceConfiguration *)v5 verifyPrompt];
        int v28 = [v26 isEqualToString:v27];

        if (v25)
        {

          if (!v28) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v28 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      uint64_t v29 = [(LACUIAuthenticatorServiceConfiguration *)self cancelButtonTitle];
      if (v29
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 cancelButtonTitle],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v30 = [(LACUIAuthenticatorServiceConfiguration *)self cancelButtonTitle];
        uint64_t v31 = [(LACUIAuthenticatorServiceConfiguration *)v5 cancelButtonTitle];
        int v32 = [v30 isEqualToString:v31];

        if (v29)
        {

          if (!v32) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v32 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      v33 = [(LACUIAuthenticatorServiceConfiguration *)self fallbackButtonTitle];
      if (v33
        || ([(LACUIAuthenticatorServiceConfiguration *)v5 fallbackButtonTitle],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v34 = [(LACUIAuthenticatorServiceConfiguration *)self fallbackButtonTitle];
        v35 = [(LACUIAuthenticatorServiceConfiguration *)v5 fallbackButtonTitle];
        int v36 = [v34 isEqualToString:v35];

        if (v33)
        {

          if (!v36) {
            goto LABEL_52;
          }
        }
        else
        {

          if ((v36 & 1) == 0) {
            goto LABEL_52;
          }
        }
      }
      unint64_t v37 = [(LACUIAuthenticatorServiceConfiguration *)self requirement];
      if (v37 != [(LACUIAuthenticatorServiceConfiguration *)v5 requirement]) {
        goto LABEL_52;
      }
      int64_t v38 = [(LACUIAuthenticatorServiceConfiguration *)self passcodeLength];
      if (v38 != [(LACUIAuthenticatorServiceConfiguration *)v5 passcodeLength]) {
        goto LABEL_52;
      }
      unint64_t v39 = [(LACUIAuthenticatorServiceConfiguration *)self mode];
      if (v39 != [(LACUIAuthenticatorServiceConfiguration *)v5 mode]) {
        goto LABEL_52;
      }
      v40 = [(LACUIAuthenticatorServiceConfiguration *)self contextData];
      uint64_t v41 = [(LACUIAuthenticatorServiceConfiguration *)v5 contextData];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        v42 = (void *)v41;
        v43 = [(LACUIAuthenticatorServiceConfiguration *)self contextData];
        unsigned int v44 = [(LACUIAuthenticatorServiceConfiguration *)v5 contextData];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_52;
        }
      }
      unint64_t v46 = [(LACUIAuthenticatorServiceConfiguration *)self style];
      if (v46 == [(LACUIAuthenticatorServiceConfiguration *)v5 style])
      {
        BOOL v47 = [(LACUIAuthenticatorServiceConfiguration *)self headerHidden];
        BOOL v16 = v47 ^ [(LACUIAuthenticatorServiceConfiguration *)v5 headerHidden] ^ 1;
LABEL_53:

        goto LABEL_54;
      }
LABEL_52:
      LOBYTE(v16) = 0;
      goto LABEL_53;
    }
    LOBYTE(v16) = 1;
  }
  else
  {
    LOBYTE(v16) = 0;
  }
LABEL_54:

  return v16;
}

- (id)description
{
  v31[16] = *MEMORY[0x263EF8340];
  v26 = NSString;
  uint64_t v24 = objc_opt_class();
  v30 = [NSString stringWithFormat:@"title: %@", self->_title];
  v31[0] = v30;
  uint64_t v29 = [NSString stringWithFormat:@"bundleIdentifier: %@", self->_bundleIdentifier];
  v31[1] = v29;
  int v28 = [NSString stringWithFormat:@"iconPath: %@", self->_iconPath];
  v31[2] = v28;
  uint64_t v27 = [NSString stringWithFormat:@"subtitle: %@", self->_subtitle];
  v31[3] = v27;
  v25 = [NSString stringWithFormat:@"prompt: %@", self->_prompt];
  v31[4] = v25;
  v23 = [NSString stringWithFormat:@"verifyPrompt: %@", self->_verifyPrompt];
  v31[5] = v23;
  v22 = [NSString stringWithFormat:@"cancelButtonTitle: %@", self->_cancelButtonTitle];
  v31[6] = v22;
  uint64_t v21 = [NSString stringWithFormat:@"fallbackButtonTitle: %@", self->_fallbackButtonTitle];
  v31[7] = v21;
  int v20 = [NSString stringWithFormat:@"passwordFieldPlaceholder: %@", self->_passwordFieldPlaceholder];
  v31[8] = v20;
  id v3 = NSString;
  uint64_t v19 = NSStringFromLACUIAuthenticatorServiceConfigurationRequirement(self->_requirement);
  uint64_t v4 = [v3 stringWithFormat:@"requirement: %@", v19];
  v31[9] = v4;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"passcodeLength: %d", self->_passcodeLength);
  v31[10] = v5;
  if (self->_mode) {
    uint64_t v6 = @"Register";
  }
  else {
    uint64_t v6 = @"Enter";
  }
  uint64_t v7 = [NSString stringWithFormat:@"mode: %@", v6];
  v31[11] = v7;
  int v8 = [NSString stringWithFormat:@"contextData: %@", self->_contextData];
  v31[12] = v8;
  if (self->_style) {
    v9 = @"FullScreen";
  }
  else {
    v9 = @"Sheet";
  }
  uint64_t v10 = [NSString stringWithFormat:@"style: %@", v9];
  v31[13] = v10;
  if (self->_headerHidden) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  uint64_t v12 = [NSString stringWithFormat:@"headerHidden: %@", v11];
  v31[14] = v12;
  if (self->_requiresIntent) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  uint64_t v14 = [NSString stringWithFormat:@"requiresIntent: %@", v13];
  v31[15] = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:16];
  BOOL v16 = [v15 componentsJoinedByString:@"; "];
  v17 = [v26 stringWithFormat:@"<%@ %p; %@>", v24, self, v16];

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)verifyPrompt
{
  return self->_verifyPrompt;
}

- (void)setVerifyPrompt:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (NSString)passwordFieldPlaceholder
{
  return self->_passwordFieldPlaceholder;
}

- (void)setPasswordFieldPlaceholder:(id)a3
{
}

- (unint64_t)requirement
{
  return self->_requirement;
}

- (int64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (void)setPasscodeLength:(int64_t)a3
{
  self->_passcodeLength = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)headerHidden
{
  return self->_headerHidden;
}

- (void)setHeaderHidden:(BOOL)a3
{
  self->_headerHidden = a3;
}

- (BOOL)requiresIntent
{
  return self->_requiresIntent;
}

- (void)setRequiresIntent:(BOOL)a3
{
  self->_requiresIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_passwordFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_verifyPrompt, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end