@interface MCProfileWarning
+ (BOOL)supportsSecureCoding;
+ (id)warningWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProfileWarning:(id)a3;
- (BOOL)isLongForm;
- (MCProfileWarning)initWithCoder:(id)a3;
- (MCProfileWarning)initWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5;
- (NSString)localizedBody;
- (NSString)localizedTitle;
- (id)serializedDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLongForm:(BOOL)a3;
- (void)setLocalizedBody:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation MCProfileWarning

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MCProfileWarning)initWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCProfileWarning;
  v11 = [(MCProfileWarning *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_localizedTitle, a3);
    objc_storeStrong((id *)&v12->_localizedBody, a4);
    v12->_isLongForm = a5;
  }

  return v12;
}

+ (id)warningWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithLocalizedTitle:v9 localizedBody:v8 isLongForm:v5];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  localizedTitle = self->_localizedTitle;
  id v5 = a3;
  [v5 encodeObject:localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedBody forKey:@"localizedBody"];
  [v5 encodeBool:self->_isLongForm forKey:@"isLongForm"];
}

- (MCProfileWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCProfileWarning;
  id v5 = [(MCProfileWarning *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedBody"];
    localizedBody = v5->_localizedBody;
    v5->_localizedBody = (NSString *)v8;

    v5->_isLongForm = [v4 decodeBoolForKey:@"isLongForm"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MCProfileWarning *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = [(MCProfileWarning *)self isEqualToProfileWarning:v4];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)MCProfileWarning;
      unsigned __int8 v5 = [(MCProfileWarning *)&v8 isEqual:v4];
    }
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)isEqualToProfileWarning:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(MCProfileWarning *)self localizedTitle];
      objc_super v8 = [v6 localizedTitle];
      if (v7 == v8
        || ([(MCProfileWarning *)self localizedTitle],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v6 localizedTitle],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        id v10 = [(MCProfileWarning *)self localizedBody];
        uint64_t v11 = [v6 localizedBody];
        if (v10 == (void *)v11)
        {

          char v9 = 1;
        }
        else
        {
          v12 = (void *)v11;
          v13 = [(MCProfileWarning *)self localizedBody];
          objc_super v14 = [v6 localizedBody];
          char v9 = [v13 isEqualToString:v14];
        }
        if (v7 == v8) {
          goto LABEL_12;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }
  char v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_localizedTitle hash];
  return [(NSString *)self->_localizedBody hash] ^ v3;
}

- (id)serializedDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_localizedTitle forKeyedSubscript:@"Title"];
  [v3 setObject:self->_localizedBody forKeyedSubscript:@"Body"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLongForm];
  [v3 setObject:v4 forKeyedSubscript:@"Long Form"];

  return v3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedBody
{
  return self->_localizedBody;
}

- (void)setLocalizedBody:(id)a3
{
}

- (BOOL)isLongForm
{
  return self->_isLongForm;
}

- (void)setIsLongForm:(BOOL)a3
{
  self->_isLongForm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedBody, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end