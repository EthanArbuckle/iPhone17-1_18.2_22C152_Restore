@interface AMSKeychainOptions
+ (BOOL)supportsSecureCoding;
+ (unint64_t)preferredAttestationStyle;
- (AMSKeychainOptions)init;
- (AMSKeychainOptions)initWithCoder:(id)a3;
- (AMSKeychainOptions)initWithOptionsDictionary:(id)a3;
- (BOOL)_compareString:(id)a3 withString:(id)a4;
- (BOOL)authenticationFallbackVisible;
- (BOOL)displayAuthenticationReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)regenerateKeys;
- (NSString)clientCertLabel;
- (NSString)intermediateCertLabel;
- (NSString)label;
- (NSString)prompt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)optionsDictionary;
- (unint64_t)purpose;
- (unint64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationFallbackVisible:(BOOL)a3;
- (void)setClientCertLabel:(id)a3;
- (void)setDisplayAuthenticationReason:(BOOL)a3;
- (void)setIntermediateCertLabel:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setPurpose:(unint64_t)a3;
- (void)setRegenerateKeys:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation AMSKeychainOptions

- (AMSKeychainOptions)init
{
  return [(AMSKeychainOptions *)self initWithOptionsDictionary:0];
}

- (AMSKeychainOptions)initWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSKeychainOptions;
  v5 = [(AMSKeychainOptions *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSKeychainOptionsAuthenticationFallbackVisible", MEMORY[0x1E4F1CC38]);
    v5->_authenticationFallbackVisible = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"AMSKeychainOptionsClientCertLabel"];
    if (v7) {
      objc_storeStrong((id *)&v5->_clientCertLabel, v7);
    }
    v8 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSKeychainOptionsDisplayAuthenticationReason", MEMORY[0x1E4F1CC38]);
    v5->_displayAuthenticationReason = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"AMSKeychainOptionsIntermediateCertLabel"];
    if (v9) {
      objc_storeStrong((id *)&v5->_intermediateCertLabel, v9);
    }
    v10 = [v4 objectForKeyedSubscript:@"AMSKeychainOptionsLabel"];
    if (v10) {
      objc_storeStrong((id *)&v5->_label, v10);
    }
    v11 = [v4 objectForKeyedSubscript:@"AMSKeychainOptionsPrompt"];
    if (v11) {
      objc_storeStrong((id *)&v5->_prompt, v11);
    }
    v12 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSKeychainOptionsPurpose", &unk_1EDD013C0);
    v5->_purpose = [v12 unsignedIntegerValue];

    v13 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSKeychainOptionsRegenerateKeys", MEMORY[0x1E4F1CC28]);
    v5->_regenerateKeys = [v13 BOOLValue];

    v14 = objc_msgSend(v4, "ams_objectForKey:defaultValue:", @"AMSKeychainOptionsStyle", &unk_1EDD013C0);
    v5->_style = [v14 unsignedIntegerValue];
  }
  return v5;
}

- (id)optionsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions authenticationFallbackVisible](self, "authenticationFallbackVisible"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"AMSKeychainOptionsAuthenticationFallbackVisible");

  v5 = [(AMSKeychainOptions *)self clientCertLabel];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"AMSKeychainOptionsClientCertLabel");

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions displayAuthenticationReason](self, "displayAuthenticationReason"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"AMSKeychainOptionsDisplayAuthenticationReason");

  v7 = [(AMSKeychainOptions *)self intermediateCertLabel];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"AMSKeychainOptionsIntermediateCertLabel");

  v8 = [(AMSKeychainOptions *)self label];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"AMSKeychainOptionsLabel");

  v9 = [(AMSKeychainOptions *)self prompt];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, @"AMSKeychainOptionsPrompt");

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSKeychainOptions purpose](self, "purpose"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, @"AMSKeychainOptionsPurpose");

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions regenerateKeys](self, "regenerateKeys"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, @"AMSKeychainOptionsRegenerateKeys");

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSKeychainOptions style](self, "style"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v12, @"AMSKeychainOptionsStyle");

  v13 = (void *)[v3 copy];
  return v13;
}

+ (unint64_t)preferredAttestationStyle
{
  int v2 = MGGetBoolAnswer();
  id v3 = +[AMSDevice hardwarePlatform];
  id v4 = v3;
  unint64_t v5 = !v2 || [v3 isEqualToString:@"t8015"];

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions authenticationFallbackVisible](self, "authenticationFallbackVisible"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"authenticationFallbackVisible");

  unint64_t v5 = [(AMSKeychainOptions *)self clientCertLabel];

  if (v5)
  {
    v6 = [(AMSKeychainOptions *)self clientCertLabel];
    v7 = AMSHashIfNeeded(v6);
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"clientCertLabel");
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions displayAuthenticationReason](self, "displayAuthenticationReason"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"displayAuthenticationReason");

  v9 = [(AMSKeychainOptions *)self intermediateCertLabel];

  if (v9)
  {
    v10 = [(AMSKeychainOptions *)self intermediateCertLabel];
    v11 = AMSHashIfNeeded(v10);
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, @"intermediateCertLabel");
  }
  v12 = [(AMSKeychainOptions *)self label];

  if (v12)
  {
    v13 = [(AMSKeychainOptions *)self label];
    v14 = AMSHashIfNeeded(v13);
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v14, @"label");
  }
  v15 = [(AMSKeychainOptions *)self prompt];

  if (v15)
  {
    objc_super v16 = [(AMSKeychainOptions *)self prompt];
    v17 = AMSHashIfNeeded(v16);
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v17, @"prompt");
  }
  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSKeychainOptions purpose](self, "purpose"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v18, @"purpose");

  v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSKeychainOptions regenerateKeys](self, "regenerateKeys"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v19, @"regenerateKeys");

  v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSKeychainOptions style](self, "style"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v20, @"style");

  v21 = [self ams_generateDescriptionWithSubObjects:v3];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = 0;
LABEL_13:
    BOOL v23 = 0;
    goto LABEL_14;
  }
  id v5 = v4;

  if (!v5) {
    goto LABEL_13;
  }
  int v6 = [(AMSKeychainOptions *)self authenticationFallbackVisible];
  if (v6 != [v5 authenticationFallbackVisible]) {
    goto LABEL_13;
  }
  v7 = [(AMSKeychainOptions *)self clientCertLabel];
  v8 = [v5 clientCertLabel];
  BOOL v9 = [(AMSKeychainOptions *)self _compareString:v7 withString:v8];

  if (!v9) {
    goto LABEL_13;
  }
  int v10 = [(AMSKeychainOptions *)self displayAuthenticationReason];
  if (v10 != [v5 displayAuthenticationReason]) {
    goto LABEL_13;
  }
  v11 = [(AMSKeychainOptions *)self intermediateCertLabel];
  v12 = [v5 intermediateCertLabel];
  BOOL v13 = [(AMSKeychainOptions *)self _compareString:v11 withString:v12];

  if (!v13) {
    goto LABEL_13;
  }
  v14 = [(AMSKeychainOptions *)self label];
  v15 = [v5 label];
  BOOL v16 = [(AMSKeychainOptions *)self _compareString:v14 withString:v15];

  if (!v16) {
    goto LABEL_13;
  }
  v17 = [(AMSKeychainOptions *)self prompt];
  v18 = [v5 prompt];
  BOOL v19 = [(AMSKeychainOptions *)self _compareString:v17 withString:v18];

  if (!v19) {
    goto LABEL_13;
  }
  unint64_t v20 = [(AMSKeychainOptions *)self purpose];
  if (v20 != [v5 purpose]) {
    goto LABEL_13;
  }
  int v21 = [(AMSKeychainOptions *)self regenerateKeys];
  if (v21 != [v5 regenerateKeys]) {
    goto LABEL_13;
  }
  unint64_t v22 = [(AMSKeychainOptions *)self style];
  BOOL v23 = v22 == [v5 style];
LABEL_14:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSKeychainOptions *)self optionsDictionary];
  [v4 encodeObject:v5 forKey:@"o"];
}

- (AMSKeychainOptions)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  BOOL v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  int v10 = [v5 decodeObjectOfClasses:v9 forKey:@"o"];

  objc_opt_class();
  id v11 = 0;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }

  v12 = [(AMSKeychainOptions *)self initWithOptionsDictionary:v11];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AMSKeychainOptions *)self optionsDictionary];
  uint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = (void *)[v4 initWithOptionsDictionary:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_compareString:(id)a3 withString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = (v5 || !v6) && (!v5 || !v6 || [v5 isEqualToString:v6]);

  return v8;
}

- (NSString)clientCertLabel
{
  return self->_clientCertLabel;
}

- (void)setClientCertLabel:(id)a3
{
}

- (NSString)intermediateCertLabel
{
  return self->_intermediateCertLabel;
}

- (void)setIntermediateCertLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(unint64_t)a3
{
  self->_purpose = a3;
}

- (BOOL)regenerateKeys
{
  return self->_regenerateKeys;
}

- (void)setRegenerateKeys:(BOOL)a3
{
  self->_regenerateKeys = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)authenticationFallbackVisible
{
  return self->_authenticationFallbackVisible;
}

- (void)setAuthenticationFallbackVisible:(BOOL)a3
{
  self->_authenticationFallbackVisible = a3;
}

- (BOOL)displayAuthenticationReason
{
  return self->_displayAuthenticationReason;
}

- (void)setDisplayAuthenticationReason:(BOOL)a3
{
  self->_displayAuthenticationReason = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_intermediateCertLabel, 0);
  objc_storeStrong((id *)&self->_clientCertLabel, 0);
}

@end