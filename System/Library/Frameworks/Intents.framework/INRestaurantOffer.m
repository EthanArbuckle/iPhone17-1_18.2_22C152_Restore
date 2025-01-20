@interface INRestaurantOffer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INRestaurantOffer)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)offerDetailText;
- (NSString)offerIdentifier;
- (NSString)offerTitleText;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOfferDetailText:(NSString *)offerDetailText;
- (void)setOfferIdentifier:(NSString *)offerIdentifier;
- (void)setOfferTitleText:(NSString *)offerTitleText;
@end

@implementation INRestaurantOffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_offerDetailText, 0);

  objc_storeStrong((id *)&self->_offerTitleText, 0);
}

- (void)setOfferIdentifier:(NSString *)offerIdentifier
{
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferDetailText:(NSString *)offerDetailText
{
}

- (NSString)offerDetailText
{
  return self->_offerDetailText;
}

- (void)setOfferTitleText:(NSString *)offerTitleText
{
}

- (NSString)offerTitleText
{
  return self->_offerTitleText;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"offerTitleText";
  offerTitleText = self->_offerTitleText;
  v4 = offerTitleText;
  if (!offerTitleText)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"offerDetailText";
  offerDetailText = self->_offerDetailText;
  v6 = offerDetailText;
  if (!offerDetailText)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"offerIdentifier";
  offerIdentifier = self->_offerIdentifier;
  v8 = offerIdentifier;
  if (!offerIdentifier)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (offerIdentifier)
  {
    if (offerDetailText) {
      goto LABEL_9;
    }
LABEL_14:

    if (offerTitleText) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!offerDetailText) {
    goto LABEL_14;
  }
LABEL_9:
  if (offerTitleText) {
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
  v11.super_class = (Class)INRestaurantOffer;
  v6 = [(INRestaurantOffer *)&v11 description];
  v7 = [(INRestaurantOffer *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRestaurantOffer *)self descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INRestaurantOffer *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = [(INRestaurantOffer *)self offerTitleText];
      v9 = [(INRestaurantOffer *)v7 offerTitleText];
      if ([v8 isEqualToString:v9])
      {
        v10 = [(INRestaurantOffer *)self offerDetailText];
        objc_super v11 = [(INRestaurantOffer *)v7 offerDetailText];
        if ([v10 isEqualToString:v11])
        {
          v12 = [(INRestaurantOffer *)self offerIdentifier];
          v13 = [(INRestaurantOffer *)v7 offerIdentifier];
          char v6 = [v12 isEqualToString:v13];
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  offerTitleText = self->_offerTitleText;
  id v5 = a3;
  [v5 encodeObject:offerTitleText forKey:@"offerTitleText"];
  [v5 encodeObject:self->_offerDetailText forKey:@"offerDetailText"];
  [v5 encodeObject:self->_offerIdentifier forKey:@"offerIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = [(INRestaurantOffer *)self offerTitleText];
  [v4 setOfferTitleText:v5];

  char v6 = [(INRestaurantOffer *)self offerDetailText];
  [v4 setOfferDetailText:v6];

  v7 = [(INRestaurantOffer *)self offerIdentifier];
  [v4 setOfferIdentifier:v7];

  return v4;
}

- (INRestaurantOffer)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INRestaurantOffer *)self init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerTitleText"];
  if (!v6)
  {
    v13 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v15 = 136315394;
    v16 = "-[INRestaurantOffer initWithCoder:]";
    __int16 v17 = 2080;
    v18 = "_offerTitleText";
LABEL_13:
    _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v15, 0x16u);
    goto LABEL_14;
  }
  offerTitleText = v5->_offerTitleText;
  v5->_offerTitleText = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerDetailText"];
  if (!v8)
  {
    v13 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v15 = 136315394;
    v16 = "-[INRestaurantOffer initWithCoder:]";
    __int16 v17 = 2080;
    v18 = "_offerDetailText";
    goto LABEL_13;
  }
  offerDetailText = v5->_offerDetailText;
  v5->_offerDetailText = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerIdentifier"];
  if (!v10)
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      v16 = "-[INRestaurantOffer initWithCoder:]";
      __int16 v17 = 2080;
      v18 = "_offerIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  offerIdentifier = v5->_offerIdentifier;
  v5->_offerIdentifier = (NSString *)v10;

LABEL_6:
  v12 = v5;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end