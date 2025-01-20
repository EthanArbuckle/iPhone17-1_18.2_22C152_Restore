@interface INPaymentMethod
+ (BOOL)supportsSecureCoding;
+ (INPaymentMethod)applePayPaymentMethod;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (INImage)icon;
- (INPaymentMethod)initWithCoder:(id)a3;
- (INPaymentMethod)initWithType:(INPaymentMethodType)type name:(NSString *)name identificationHint:(NSString *)identificationHint icon:(INImage *)icon;
- (INPaymentMethodType)type;
- (NSString)description;
- (NSString)identificationHint;
- (NSString)name;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_localizedCopyWithLocalizer:(id)a3;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation INPaymentMethod

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  INPaymentMethodType v6 = [(INPaymentMethod *)self type];
  v7 = [(INPaymentMethod *)self name];
  v8 = [v4 languageCode];

  v9 = [v7 localizeForLanguage:v8];
  v10 = [(INPaymentMethod *)self identificationHint];
  v11 = [(INPaymentMethod *)self icon];
  v12 = (void *)[v5 initWithType:v6 name:v9 identificationHint:v10 icon:v11];

  return v12;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  INPaymentMethodType v6 = [(INPaymentMethod *)self name];

  if (v6)
  {
    v7 = [(INPaymentMethod *)self name];
    v8 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);

    id v5 = v7;
  }
  else
  {
    v8 = INPaymentMethodTypeGetLocalizedName([(INPaymentMethod *)self type], v5);
  }

  return v8;
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v12 = v8;

    uint64_t v13 = [v12 name];
LABEL_16:
    v11 = (void *)v13;

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v12 = v10;

    uint64_t v13 = objc_msgSend(v12, "if_flatMap:", &__block_literal_global_22402);
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:
  v14 = [(INPaymentMethod *)self name];
  char v15 = objc_msgSend(v14, "_intents_compareValue:relation:", v11, a4);

  return v15;
}

id __87__INPaymentMethod_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [v4 name];

  id v7 = objc_msgSend(v5, "if_arrayWithObjectIfNonNil:", v6);

  return v7;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INPaymentMethod *)self copy];
    id v9 = [(INPaymentMethod *)self icon];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __77__INPaymentMethod_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E551E2D0;
      v10[4] = v8;
      id v11 = v7;
      v6[2](v6, v9, v10);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

uint64_t __77__INPaymentMethod_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INPaymentMethod *)self icon];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(INPaymentMethod *)self icon];
    id v7 = [v6 _identifier];
    v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      id v9 = [(INPaymentMethod *)self icon];
      v10 = [v9 _identifier];
      id v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [(INPaymentMethod *)self icon];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(INPaymentMethod *)self icon];

  if (v4)
  {
    id v5 = [(INPaymentMethod *)self icon];
    [v3 addObject:v5];
  }
  if ([v3 count]) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identificationHint, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)identificationHint
{
  return self->_identificationHint;
}

- (void)setIcon:(id)a3
{
}

- (INImage)icon
{
  return self->_icon;
}

- (NSString)name
{
  return self->_name;
}

- (INPaymentMethodType)type
{
  return self->_type;
}

- (id)_dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"type";
  id v3 = [NSNumber numberWithInteger:self->_type];
  v13[0] = v3;
  v12[1] = @"name";
  name = self->_name;
  id v5 = name;
  if (!name)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v5;
  v12[2] = @"icon";
  icon = self->_icon;
  id v7 = icon;
  if (!icon)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v7;
  v12[3] = @"identificationHint";
  identificationHint = self->_identificationHint;
  id v9 = identificationHint;
  if (!identificationHint)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (identificationHint)
  {
    if (icon) {
      goto LABEL_9;
    }
LABEL_14:

    if (name) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!icon) {
    goto LABEL_14;
  }
LABEL_9:
  if (name) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentMethod;
  id v6 = [(INPaymentMethod *)&v11 description];
  id v7 = [(INPaymentMethod *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPaymentMethod *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  unint64_t v8 = self->_type - 1;
  if (v8 > 7) {
    id v9 = @"unknown";
  }
  else {
    id v9 = off_1E5518FE0[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"type");

  objc_super v11 = [v6 encodeObject:self->_name];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"name");

  id v12 = [v6 encodeObject:self->_icon];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"icon");

  id v13 = [v6 encodeObject:self->_identificationHint];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"identificationHint");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_identificationHint forKey:@"identificationHint"];
}

- (INPaymentMethod)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"name"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"identificationHint"];

  char v15 = [(INPaymentMethod *)self initWithType:v5 name:v9 identificationHint:v14 icon:v10];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPaymentMethod *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v9 = 0;
      if (self->_type == v5->_type)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
        {
          icon = self->_icon;
          if (icon == v5->_icon || -[INImage isEqual:](icon, "isEqual:"))
          {
            identificationHint = self->_identificationHint;
            if (identificationHint == v5->_identificationHint
              || -[NSString isEqual:](identificationHint, "isEqual:"))
            {
              BOOL v9 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  unint64_t v6 = v5 ^ [(INImage *)self->_icon hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_identificationHint hash] ^ v4;

  return v7;
}

- (INPaymentMethod)initWithType:(INPaymentMethodType)type name:(NSString *)name identificationHint:(NSString *)identificationHint icon:(INImage *)icon
{
  v10 = name;
  objc_super v11 = identificationHint;
  uint64_t v12 = icon;
  v22.receiver = self;
  v22.super_class = (Class)INPaymentMethod;
  id v13 = [(INPaymentMethod *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_int64_t type = type;
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [(INImage *)v12 copy];
    v18 = v14->_icon;
    v14->_icon = (INImage *)v17;

    uint64_t v19 = [(NSString *)v11 copy];
    v20 = v14->_identificationHint;
    v14->_identificationHint = (NSString *)v19;
  }
  return v14;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [v8 objectForKeyedSubscript:@"type"];
    uint64_t v10 = INPaymentMethodTypeWithString(v9);

    objc_super v11 = [v8 objectForKeyedSubscript:@"name"];
    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"icon"];
    v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = [v8 objectForKeyedSubscript:@"identificationHint"];
    v16 = (void *)[objc_alloc((Class)a1) initWithType:v10 name:v11 identificationHint:v15 icon:v14];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INPaymentMethod)applePayPaymentMethod
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__INPaymentMethod_applePayPaymentMethod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applePayPaymentMethod_onceToken != -1) {
    dispatch_once(&applePayPaymentMethod_onceToken, block);
  }
  id v2 = (void *)applePayPaymentMethod_me;

  return (INPaymentMethod *)v2;
}

uint64_t __40__INPaymentMethod_applePayPaymentMethod__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithType:8 name:0 identificationHint:0 icon:0];
  uint64_t v2 = applePayPaymentMethod_me;
  applePayPaymentMethod_me = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

@end