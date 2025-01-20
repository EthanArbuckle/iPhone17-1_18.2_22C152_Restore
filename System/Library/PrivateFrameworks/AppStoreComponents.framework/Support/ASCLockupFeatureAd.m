@interface ASCLockupFeatureAd
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureAd)initWithCoder:(id)a3;
- (ASCLockupFeatureAd)initWithEditorsChoice:(BOOL)a3 productRating:(float)a4 productRatingBadge:(id)a5 productDescription:(id)a6;
- (BOOL)isEditorsChoice;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)productDescription;
- (NSString)productRatingBadge;
- (float)productRating;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureAd

- (ASCLockupFeatureAd)initWithEditorsChoice:(BOOL)a3 productRating:(float)a4 productRatingBadge:(id)a5 productDescription:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFeatureAd;
  v12 = [(ASCLockupFeatureAd *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_isEditorsChoice = a3;
    v12->_productRating = a4;
    v14 = (NSString *)[v10 copy];
    productRatingBadge = v13->_productRatingBadge;
    v13->_productRatingBadge = v14;

    v16 = (NSString *)[v11 copy];
    productDescription = v13->_productDescription;
    v13->_productDescription = v16;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAd)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeBoolForKey:@"isEditorsChoice"];
  if ([v4 containsValueForKey:@"productRating"])
  {
    [v4 decodeFloatForKey:@"productRating"];
    int v7 = v6;
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productRatingBadge"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productDescription"];
    LODWORD(v10) = v7;
    self = [(ASCLockupFeatureAd *)self initWithEditorsChoice:v5 productRating:v8 productRatingBadge:v9 productDescription:v10];

    id v11 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013E764();
    }
    id v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"), @"isEditorsChoice");
  [(ASCLockupFeatureAd *)self productRating];
  objc_msgSend(v4, "encodeFloat:forKey:", @"productRating");
  id v5 = [(ASCLockupFeatureAd *)self productRatingBadge];
  [v4 encodeObject:v5 forKey:@"productRatingBadge"];

  id v6 = [(ASCLockupFeatureAd *)self productDescription];
  [v4 encodeObject:v6 forKey:@"productDescription"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  [(ASCHasher *)v3 combineBool:[(ASCLockupFeatureAd *)self isEditorsChoice]];
  [(ASCLockupFeatureAd *)self productRating];
  [(ASCHasher *)v3 combineDouble:v4];
  id v5 = [(ASCLockupFeatureAd *)self productRatingBadge];
  [(ASCHasher *)v3 combineObject:v5];

  id v6 = [(ASCLockupFeatureAd *)self productDescription];
  [(ASCHasher *)v3 combineObject:v6];

  unint64_t v7 = [(ASCHasher *)v3 finalizeHash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (ASCLockupFeatureAd *)a3;
  if (self != v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    v8 = v6;

    if (!v8
      || (unsigned int v9 = [(ASCLockupFeatureAd *)self isEditorsChoice],
          v9 != [(ASCLockupFeatureAd *)v8 isEditorsChoice])
      || ([(ASCLockupFeatureAd *)self productRating],
          float v11 = v10,
          [(ASCLockupFeatureAd *)v8 productRating],
          v11 != v12))
    {
      unsigned __int8 v7 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v13 = [(ASCLockupFeatureAd *)self productRatingBadge];
    uint64_t v14 = [(ASCLockupFeatureAd *)v8 productRatingBadge];
    v15 = (void *)v14;
    if (v13 && v14)
    {
      if ([v13 isEqual:v14]) {
        goto LABEL_14;
      }
    }
    else if (v13 == (void *)v14)
    {
LABEL_14:
      v16 = [(ASCLockupFeatureAd *)self productDescription];
      uint64_t v17 = [(ASCLockupFeatureAd *)v8 productDescription];
      v18 = (void *)v17;
      if (v16 && v17) {
        unsigned __int8 v7 = [v16 isEqual:v17];
      }
      else {
        unsigned __int8 v7 = v16 == (void *)v17;
      }

      goto LABEL_24;
    }
    unsigned __int8 v7 = 0;
LABEL_24:

    goto LABEL_18;
  }
  unsigned __int8 v7 = 1;
LABEL_19:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  [(ASCDescriber *)v3 addBool:[(ASCLockupFeatureAd *)self isEditorsChoice] withName:@"isEditorsChoice"];
  [(ASCLockupFeatureAd *)self productRating];
  [(ASCDescriber *)v3 addDouble:@"productRating" withName:v4];
  id v5 = [(ASCLockupFeatureAd *)self productRatingBadge];
  [(ASCDescriber *)v3 addObject:v5 withName:@"productRatingBadge"];

  id v6 = [(ASCLockupFeatureAd *)self productDescription];
  [(ASCDescriber *)v3 addObject:v6 withName:@"productDescription"];

  unsigned __int8 v7 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v7;
}

- (BOOL)isEditorsChoice
{
  return self->_isEditorsChoice;
}

- (float)productRating
{
  return self->_productRating;
}

- (NSString)productRatingBadge
{
  return self->_productRatingBadge;
}

- (NSString)productDescription
{
  return self->_productDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productDescription, 0);

  objc_storeStrong((id *)&self->_productRatingBadge, 0);
}

@end