@interface MPMediaControlsCustomRow
+ (BOOL)supportsSecureCoding;
+ (id)rowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (MPMediaControlsCustomRow)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)titleOverride;
- (UTType)type;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitleOverride:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MPMediaControlsCustomRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setTitleOverride:(id)a3
{
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setType:(id)a3
{
}

- (UTType)type
{
  return self->_type;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPMediaControlsCustomRow *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MPMediaControlsCustomRow *)v5 type];
      int v7 = [v6 isEqual:self->_type];

      v8 = [(MPMediaControlsCustomRow *)v5 titleOverride];
      int v9 = v7 & [v8 isEqualToString:self->_titleOverride];

      v10 = [(MPMediaControlsCustomRow *)v5 identifier];

      int v11 = v9 & [v10 isEqualToString:self->_identifier];
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPMediaControlsCustomRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaControlsCustomRow;
  v5 = [(MPMediaControlsCustomRow *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    uint64_t v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v6];
    type = v5->_type;
    v5->_type = (UTType *)v7;

    if (!v5->_type)
    {

      v13 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleOverride"];
    titleOverride = v5->_titleOverride;
    v5->_titleOverride = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;
  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v6 = a3;
  v5 = [(UTType *)type identifier];
  [v6 encodeObject:v5 forKey:@"type"];

  [v6 encodeObject:self->_titleOverride forKey:@"titleOverride"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)rowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(MPMediaControlsCustomRow);
  [(MPMediaControlsCustomRow *)v10 setType:v9];

  [(MPMediaControlsCustomRow *)v10 setTitleOverride:v8];
  [(MPMediaControlsCustomRow *)v10 setIdentifier:v7];

  return v10;
}

@end