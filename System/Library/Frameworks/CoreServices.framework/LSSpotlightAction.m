@interface LSSpotlightAction
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpotlightAction:(id)a3;
- (LSSpotlightAction)init;
- (LSSpotlightAction)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)symbolImageName;
- (NSString)unlocalizedTitle;
- (id)_initWithIdentifier:(id)a3 unlocalizedTitle:(id)a4 symbolImageName:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSSpotlightAction

+ (id)new
{
}

- (LSSpotlightAction)init
{
}

- (id)_initWithIdentifier:(id)a3 unlocalizedTitle:(id)a4 symbolImageName:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)LSSpotlightAction;
  v8 = [(LSSpotlightAction *)&v11 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(LSSpotlightAction *)self isEqualToSpotlightAction:a3];
}

- (unint64_t)hash
{
  v3 = [(LSSpotlightAction *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LSSpotlightAction *)self unlocalizedTitle];
  uint64_t v6 = [v5 hash];
  v7 = [(LSSpotlightAction *)self symbolImageName];
  unint64_t v8 = v6 ^ v4 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(LSSpotlightAction *)self identifier];
  uint64_t v6 = [(LSSpotlightAction *)self unlocalizedTitle];
  v7 = [(LSSpotlightAction *)self symbolImageName];
  unint64_t v8 = [v3 stringWithFormat:@"<%@ %p> { identifier = %@, unlocalizedTitle = %@, symbolImageName = %@ }", v4, self, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
  [a3 encodeObject:self->_unlocalizedTitle forKey:@"unlocalizedTitle"];
  symbolImageName = self->_symbolImageName;

  [a3 encodeObject:symbolImageName forKey:@"symbolImageName"];
}

- (LSSpotlightAction)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)LSSpotlightAction;
  uint64_t v4 = [(LSSpotlightAction *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"unlocalizedTitle");
    unlocalizedTitle = v4->_unlocalizedTitle;
    v4->_unlocalizedTitle = (NSString *)v7;

    uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"symbolImageName");
    symbolImageName = v4->_symbolImageName;
    v4->_symbolImageName = (NSString *)v9;
  }
  return v4;
}

- (BOOL)isEqualToSpotlightAction:(id)a3
{
  uint64_t v6 = [(LSSpotlightAction *)self identifier];
  uint64_t v7 = [a3 identifier];
  if ([v6 isEqual:v7])
  {
    unint64_t v8 = [(LSSpotlightAction *)self unlocalizedTitle];
    uint64_t v9 = [a3 unlocalizedTitle];
    if (![v8 isEqual:v9])
    {
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = [(LSSpotlightAction *)self symbolImageName];
    if (v10 || ([a3 symbolImageName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v11 = [(LSSpotlightAction *)self symbolImageName];
      objc_super v12 = [a3 symbolImageName];
      char v13 = [v11 isEqual:v12];

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v13 = 1;
    }

    goto LABEL_11;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)unlocalizedTitle
{
  return self->_unlocalizedTitle;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_unlocalizedTitle, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end