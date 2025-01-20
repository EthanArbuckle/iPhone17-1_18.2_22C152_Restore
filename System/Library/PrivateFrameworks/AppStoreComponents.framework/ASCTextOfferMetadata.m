@interface ASCTextOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCTextOfferMetadata)initWithCoder:(id)a3;
- (ASCTextOfferMetadata)initWithTitle:(id)a3 subtitle:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isText;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCTextOfferMetadata

- (ASCTextOfferMetadata)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCTextOfferMetadata;
  v8 = [(ASCOfferMetadata *)&v14 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCTextOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v5)
  {
    v20.receiver = self;
    v20.super_class = (Class)ASCTextOfferMetadata;
    id v6 = [(ASCOfferMetadata *)&v20 initWithCoder:v4];
    id v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_title, v5);
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
      subtitle = v7->_subtitle;
      v7->_subtitle = (NSString *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[ASCTextOfferMetadata initWithCoder:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCTextOfferMetadata;
  id v4 = a3;
  [(ASCOfferMetadata *)&v7 encodeWithCoder:v4];
  v5 = [(ASCTextOfferMetadata *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(ASCTextOfferMetadata *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCTextOfferMetadata *)self title];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCTextOfferMetadata *)self subtitle];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [(ASCTextOfferMetadata *)self title];
    uint64_t v9 = [v7 title];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      BOOL v11 = [(ASCTextOfferMetadata *)self subtitle];
      uint64_t v12 = [v7 subtitle];
      uint64_t v13 = (void *)v12;
      if (v11 && v12) {
        char v14 = [v11 isEqual:v12];
      }
      else {
        char v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    char v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCTextOfferMetadata *)self title];
  [(ASCDescriber *)v3 addObject:v4 withName:@"title"];

  id v5 = [(ASCTextOfferMetadata *)self subtitle];
  [(ASCDescriber *)v3 addObject:v5 withName:@"subtitle"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (BOOL)isText
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end