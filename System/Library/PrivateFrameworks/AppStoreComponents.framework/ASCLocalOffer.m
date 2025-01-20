@interface ASCLocalOffer
+ (id)viewInAppStoreOfferForLockupView:(id)a3;
- (ASCAdamID)id;
- (ASCLocalOffer)initWithMetadata:(id)a3 action:(id)a4;
- (ASCOfferMetadata)metadata;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)description;
- (id)action;
- (id)formattedPrice;
- (id)price;
- (int64_t)flags;
- (unint64_t)hash;
@end

@implementation ASCLocalOffer

- (ASCLocalOffer)initWithMetadata:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCLocalOffer;
  v8 = [(ASCLocalOffer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    metadata = v8->_metadata;
    v8->_metadata = (ASCOfferMetadata *)v9;

    uint64_t v11 = [v7 copy];
    id action = v8->_action;
    v8->_id action = (id)v11;
  }
  return v8;
}

+ (id)viewInAppStoreOfferForLockupView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  id v5 = objc_alloc((Class)a1);
  id v6 = objc_alloc_init(ASCViewInAppStoreOfferMetadata);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ASCLocalOffer_viewInAppStoreOfferForLockupView___block_invoke;
  v9[3] = &unk_1E645D7E8;
  objc_copyWeak(&v10, &location);
  id v7 = (void *)[v5 initWithMetadata:v6 action:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

void __50__ASCLocalOffer_viewInAppStoreOfferForLockupView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentProductDetailsViewController];
}

- (ASCAdamID)id
{
  return +[ASCAdamID invalidAdamID];
}

- (NSDictionary)titles
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (NSDictionary)subtitles
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (id)price
{
  return 0;
}

- (id)formattedPrice
{
  return 0;
}

- (int64_t)flags
{
  return 0;
}

- (NSNumber)ageRating
{
  return 0;
}

- (NSArray)metrics
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLocalOffer *)self metadata];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCLocalOffer *)self action];
  id v6 = (void *)MEMORY[0x1C8768F90]();
  [(ASCHasher *)v3 combineObject:v6];

  unint64_t v7 = [(ASCHasher *)v3 finalizeHash];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
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
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCLocalOffer *)self metadata];
    uint64_t v9 = [v7 metadata];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      uint64_t v11 = [(ASCLocalOffer *)self action];
      v12 = (void *)MEMORY[0x1C8768F90]();
      v13 = [v7 action];
      uint64_t v14 = MEMORY[0x1C8768F90]();
      v15 = (void *)v14;
      if (v12 && v14) {
        char v16 = [v12 isEqual:v14];
      }
      else {
        char v16 = v12 == (void *)v14;
      }

      goto LABEL_18;
    }
    char v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v16 = 0;
LABEL_19:

  return v16;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLocalOffer *)self metadata];
  [(ASCDescriber *)v3 addObject:v4 withName:@"metadata"];

  id v5 = [(ASCLocalOffer *)self action];
  id v6 = (void *)MEMORY[0x1C8768F90]();
  [(ASCDescriber *)v3 addObject:v6 withName:@"action"];

  id v7 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v7;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end