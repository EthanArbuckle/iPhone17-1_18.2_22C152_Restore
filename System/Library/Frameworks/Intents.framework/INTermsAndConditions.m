@interface INTermsAndConditions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INTermsAndConditions)init;
- (INTermsAndConditions)initWithCoder:(id)a3;
- (INTermsAndConditions)initWithLocalizedTermsAndConditionsText:(NSString *)localizedTermsAndConditionsText privacyPolicyURL:(NSURL *)privacyPolicyURL termsAndConditionsURL:(NSURL *)termsAndConditionsURL;
- (NSString)description;
- (NSString)localizedTermsAndConditionsText;
- (NSURL)privacyPolicyURL;
- (NSURL)termsAndConditionsURL;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTermsAndConditions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsAndConditionsURL, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);

  objc_storeStrong((id *)&self->_localizedTermsAndConditionsText, 0);
}

- (NSURL)termsAndConditionsURL
{
  return self->_termsAndConditionsURL;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSString)localizedTermsAndConditionsText
{
  return self->_localizedTermsAndConditionsText;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"localizedTermsAndConditionsText";
  localizedTermsAndConditionsText = self->_localizedTermsAndConditionsText;
  v4 = localizedTermsAndConditionsText;
  if (!localizedTermsAndConditionsText)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"privacyPolicyURL";
  privacyPolicyURL = self->_privacyPolicyURL;
  v6 = privacyPolicyURL;
  if (!privacyPolicyURL)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"termsAndConditionsURL";
  termsAndConditionsURL = self->_termsAndConditionsURL;
  v8 = termsAndConditionsURL;
  if (!termsAndConditionsURL)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (termsAndConditionsURL)
  {
    if (privacyPolicyURL) {
      goto LABEL_9;
    }
LABEL_14:

    if (localizedTermsAndConditionsText) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!privacyPolicyURL) {
    goto LABEL_14;
  }
LABEL_9:
  if (localizedTermsAndConditionsText) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTermsAndConditions;
  v6 = [(INTermsAndConditions *)&v11 description];
  v7 = [(INTermsAndConditions *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTermsAndConditions *)self descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  v6 = (INTermsAndConditions *)a3;
  if (v6 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(INTermsAndConditions *)v7 privacyPolicyURL];
      if (v8
        || ([(INTermsAndConditions *)self privacyPolicyURL],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v4 = [(INTermsAndConditions *)v7 privacyPolicyURL];
        v9 = [(INTermsAndConditions *)self privacyPolicyURL];
        int v10 = [v4 isEqual:v9];

        if (v8)
        {
LABEL_11:

          v12 = [(INTermsAndConditions *)v7 termsAndConditionsURL];
          if (v12
            || ([(INTermsAndConditions *)self termsAndConditionsURL],
                (v4 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v13 = [(INTermsAndConditions *)v7 termsAndConditionsURL];
            v14 = [(INTermsAndConditions *)self termsAndConditionsURL];
            int v15 = [v13 isEqual:v14];

            if (v12)
            {
LABEL_17:

              v16 = [(INTermsAndConditions *)v7 localizedTermsAndConditionsText];
              v17 = [(INTermsAndConditions *)self localizedTermsAndConditionsText];
              int v11 = [v16 isEqualToString:v17] & v10 & v15;

              goto LABEL_18;
            }
          }
          else
          {
            int v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        int v10 = 1;
      }

      goto LABEL_11;
    }
    LOBYTE(v11) = 0;
  }
LABEL_18:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [INTermsAndConditions alloc];
  v5 = [(INTermsAndConditions *)self localizedTermsAndConditionsText];
  v6 = [(INTermsAndConditions *)self privacyPolicyURL];
  v7 = [(INTermsAndConditions *)self termsAndConditionsURL];
  v8 = [(INTermsAndConditions *)v4 initWithLocalizedTermsAndConditionsText:v5 privacyPolicyURL:v6 termsAndConditionsURL:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  localizedTermsAndConditionsText = self->_localizedTermsAndConditionsText;
  id v5 = a3;
  [v5 encodeObject:localizedTermsAndConditionsText forKey:@"localizedTermsAndConditionsText"];
  [v5 encodeObject:self->_privacyPolicyURL forKey:@"privacyPolicyURL"];
  [v5 encodeObject:self->_termsAndConditionsURL forKey:@"termsAndConditionsURL"];
}

- (INTermsAndConditions)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INTermsAndConditions *)self init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTermsAndConditionsText"];
  if (v6)
  {
    localizedTermsAndConditionsText = v5->_localizedTermsAndConditionsText;
    v5->_localizedTermsAndConditionsText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPolicyURL"];
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsAndConditionsURL"];
    termsAndConditionsURL = v5->_termsAndConditionsURL;
    v5->_termsAndConditionsURL = (NSURL *)v10;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    v16 = "-[INTermsAndConditions initWithCoder:]";
    __int16 v17 = 2080;
    v18 = "_localizedTermsAndConditionsText";
    _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v15, 0x16u);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (INTermsAndConditions)init
{
  return [(INTermsAndConditions *)self initWithLocalizedTermsAndConditionsText:&stru_1EDA6DB28 privacyPolicyURL:0 termsAndConditionsURL:0];
}

- (INTermsAndConditions)initWithLocalizedTermsAndConditionsText:(NSString *)localizedTermsAndConditionsText privacyPolicyURL:(NSURL *)privacyPolicyURL termsAndConditionsURL:(NSURL *)termsAndConditionsURL
{
  uint64_t v8 = localizedTermsAndConditionsText;
  v9 = privacyPolicyURL;
  uint64_t v10 = termsAndConditionsURL;
  v19.receiver = self;
  v19.super_class = (Class)INTermsAndConditions;
  int v11 = [(INTermsAndConditions *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_localizedTermsAndConditionsText;
    v11->_localizedTermsAndConditionsText = (NSString *)v12;

    uint64_t v14 = [(NSURL *)v9 copy];
    int v15 = v11->_privacyPolicyURL;
    v11->_privacyPolicyURL = (NSURL *)v14;

    uint64_t v16 = [(NSURL *)v10 copy];
    __int16 v17 = v11->_termsAndConditionsURL;
    v11->_termsAndConditionsURL = (NSURL *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end