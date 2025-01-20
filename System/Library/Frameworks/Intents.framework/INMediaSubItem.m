@interface INMediaSubItem
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INMediaSubItem)initWithCoder:(id)a3;
- (INMediaSubItem)initWithIdentifier:(id)a3 assetInfo:(id)a4;
- (NSString)assetInfo;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INMediaSubItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetInfo, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"identifier";
  identifier = self->_identifier;
  v4 = identifier;
  if (!identifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"assetInfo";
  v10[0] = v4;
  assetInfo = self->_assetInfo;
  v6 = assetInfo;
  if (!assetInfo)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (assetInfo)
  {
    if (identifier) {
      goto LABEL_7;
    }
  }
  else
  {

    if (identifier) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMediaSubItem;
  v6 = [(INMediaSubItem *)&v11 description];
  v7 = [(INMediaSubItem *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMediaSubItem *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"identifier");

  v9 = [v6 encodeObject:self->_assetInfo];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"assetInfo");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_assetInfo forKey:@"assetInfo"];
}

- (INMediaSubItem)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"identifier"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"assetInfo"];

  v13 = [(INMediaSubItem *)self initWithIdentifier:v8 assetInfo:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INMediaSubItem *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      BOOL v8 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        assetInfo = self->_assetInfo;
        if (assetInfo == v5->_assetInfo || -[NSString isEqual:](assetInfo, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_assetInfo hash] ^ v3;
}

- (INMediaSubItem)initWithIdentifier:(id)a3 assetInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INMediaSubItem;
  BOOL v8 = [(INMediaSubItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    assetInfo = v8->_assetInfo;
    v8->_assetInfo = (NSString *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:@"identifier"];
    BOOL v8 = [v6 objectForKeyedSubscript:@"assetInfo"];
    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 assetInfo:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end