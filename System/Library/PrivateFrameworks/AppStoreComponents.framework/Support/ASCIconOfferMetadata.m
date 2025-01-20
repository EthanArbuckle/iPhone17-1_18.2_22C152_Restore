@interface ASCIconOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCIconOfferMetadata)initWithBaseImageName:(id)a3 animationName:(id)a4;
- (ASCIconOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIcon;
- (NSString)animationName;
- (NSString)baseImageName;
- (id)description;
- (id)imageNameForSize:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCIconOfferMetadata

- (ASCIconOfferMetadata)initWithBaseImageName:(id)a3 animationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCIconOfferMetadata;
  v8 = [(ASCOfferMetadata *)&v14 _init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    baseImageName = v8->_baseImageName;
    v8->_baseImageName = v9;

    v11 = (NSString *)[v7 copy];
    animationName = v8->_animationName;
    v8->_animationName = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCIconOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseImageName"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animationName"];
    if (v6)
    {
      v27.receiver = self;
      v27.super_class = (Class)ASCIconOfferMetadata;
      id v7 = [(ASCOfferMetadata *)&v27 initWithCoder:v4];
      p_isa = (id *)&v7->super.super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_baseImageName, v5);
        objc_storeStrong(p_isa + 1, v6);
      }
      self = p_isa;
      v9 = self;
    }
    else
    {
      BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v18) {
        sub_10013EC14(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      v9 = 0;
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_10013EBD8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCIconOfferMetadata;
  id v4 = a3;
  [(ASCOfferMetadata *)&v7 encodeWithCoder:v4];
  v5 = [(ASCIconOfferMetadata *)self baseImageName];
  [v4 encodeObject:v5 forKey:@"baseImageName"];

  id v6 = [(ASCIconOfferMetadata *)self animationName];
  [v4 encodeObject:v6 forKey:@"animationName"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCIconOfferMetadata *)self baseImageName];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCIconOfferMetadata *)self animationName];
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
    v8 = [(ASCIconOfferMetadata *)self baseImageName];
    uint64_t v9 = [v7 baseImageName];
    BOOL v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      uint64_t v11 = [(ASCIconOfferMetadata *)self animationName];
      uint64_t v12 = [v7 animationName];
      uint64_t v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCIconOfferMetadata *)self baseImageName];
  [(ASCDescriber *)v3 addObject:v4 withName:@"baseImageName"];

  id v5 = [(ASCIconOfferMetadata *)self animationName];
  [(ASCDescriber *)v3 addObject:v5 withName:@"animationName"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (id)imageNameForSize:(id)a3
{
  v3 = [(ASCIconOfferMetadata *)self baseImageName];
  id v4 = +[NSString stringWithFormat:@"%@%@%@", v3, &stru_10018BDF0, &stru_10018BDF0];

  return v4;
}

- (BOOL)isIcon
{
  return 1;
}

- (NSString)animationName
{
  return self->_animationName;
}

- (NSString)baseImageName
{
  return self->_baseImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageName, 0);

  objc_storeStrong((id *)&self->_animationName, 0);
}

@end