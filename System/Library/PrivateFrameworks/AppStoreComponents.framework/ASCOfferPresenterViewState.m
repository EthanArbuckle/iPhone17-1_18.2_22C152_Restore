@interface ASCOfferPresenterViewState
- (ASCOfferMetadata)metadata;
- (ASCOfferPresenterViewState)initWithMetadata:(id)a3 theme:(id)a4;
- (ASCOfferTheme)theme;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation ASCOfferPresenterViewState

- (ASCOfferPresenterViewState)initWithMetadata:(id)a3 theme:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCOfferPresenterViewState;
  v8 = [(ASCOfferPresenterViewState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    metadata = v8->_metadata;
    v8->_metadata = (ASCOfferMetadata *)v9;

    uint64_t v11 = [v7 copy];
    theme = v8->_theme;
    v8->_theme = (ASCOfferTheme *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  v4 = [(ASCOfferPresenterViewState *)self metadata];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCOfferPresenterViewState *)self theme];
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
    v8 = [(ASCOfferPresenterViewState *)self metadata];
    uint64_t v9 = [v7 metadata];
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
      uint64_t v11 = [(ASCOfferPresenterViewState *)self theme];
      uint64_t v12 = [v7 theme];
      v13 = (void *)v12;
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
  id v4 = [(ASCOfferPresenterViewState *)self metadata];
  [(ASCDescriber *)v3 addObject:v4 withName:@"metadata"];

  id v5 = [(ASCOfferPresenterViewState *)self theme];
  [(ASCDescriber *)v3 addObject:v5 withName:@"theme"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (ASCOfferTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end