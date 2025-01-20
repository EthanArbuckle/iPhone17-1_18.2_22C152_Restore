@interface ASCPresenterContext
+ (ASCPresenterContext)sharedContext;
- (ASCAppOfferStateCenter)appOfferStateCenter;
- (ASCArtworkFetcher)artworkFetcher;
- (ASCLockupFetcher)lockupFetcher;
- (ASCPresenterContext)initWithArtworkFetcher:(id)a3 lockupFetcher:(id)a4 appOfferStateCenter:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation ASCPresenterContext

+ (ASCPresenterContext)sharedContext
{
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)sharedContext_sharedContext;

  return (ASCPresenterContext *)v2;
}

void __36__ASCPresenterContext_sharedContext__block_invoke()
{
  v0 = [ASCPresenterContext alloc];
  id v5 = +[ASCArtworkFetcher sharedFetcher];
  v1 = +[ASCLockupFetcher sharedFetcher];
  v2 = +[ASCAppOfferStateCenter sharedCenter];
  uint64_t v3 = [(ASCPresenterContext *)v0 initWithArtworkFetcher:v5 lockupFetcher:v1 appOfferStateCenter:v2];
  v4 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = v3;
}

- (ASCPresenterContext)initWithArtworkFetcher:(id)a3 lockupFetcher:(id)a4 appOfferStateCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASCPresenterContext;
  v12 = [(ASCPresenterContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_artworkFetcher, a3);
    objc_storeStrong((id *)&v13->_lockupFetcher, a4);
    objc_storeStrong((id *)&v13->_appOfferStateCenter, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_alloc_init(ASCHasher);
  v4 = [(ASCPresenterContext *)self artworkFetcher];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCPresenterContext *)self lockupFetcher];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCPresenterContext *)self appOfferStateCenter];
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
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCPresenterContext *)self artworkFetcher];
    uint64_t v9 = [v7 artworkFetcher];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        id v11 = [(ASCPresenterContext *)self lockupFetcher];
        uint64_t v12 = [v7 lockupFetcher];
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12]) {
            goto LABEL_13;
          }
        }
        else if (v11 == (void *)v12)
        {
LABEL_13:
          v14 = [(ASCPresenterContext *)self appOfferStateCenter];
          uint64_t v15 = [v7 appOfferStateCenter];
          v16 = (void *)v15;
          if (v14 && v15) {
            char v17 = [v14 isEqual:v15];
          }
          else {
            char v17 = v14 == (void *)v15;
          }

          goto LABEL_23;
        }
        char v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    char v17 = 0;
LABEL_24:

    goto LABEL_25;
  }
  char v17 = 0;
LABEL_25:

  return v17;
}

- (id)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCPresenterContext *)self artworkFetcher];
  [(ASCDescriber *)v3 addObject:v4 withName:@"artworkFetcher"];

  id v5 = [(ASCPresenterContext *)self lockupFetcher];
  [(ASCDescriber *)v3 addObject:v5 withName:@"lockupFetcher"];

  v6 = [(ASCPresenterContext *)self appOfferStateCenter];
  [(ASCDescriber *)v3 addObject:v6 withName:@"appOfferStateCenter"];

  id v7 = [(ASCDescriber *)v3 finalizeDescription];

  return v7;
}

- (ASCArtworkFetcher)artworkFetcher
{
  return self->_artworkFetcher;
}

- (ASCLockupFetcher)lockupFetcher
{
  return self->_lockupFetcher;
}

- (ASCAppOfferStateCenter)appOfferStateCenter
{
  return self->_appOfferStateCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appOfferStateCenter, 0);
  objc_storeStrong((id *)&self->_lockupFetcher, 0);

  objc_storeStrong((id *)&self->_artworkFetcher, 0);
}

@end