@interface ASCOfferContext
+ (BOOL)supportsSecureCoding;
- (ASCOfferContext)init;
- (ASCOfferContext)initWithCoder:(id)a3;
- (ASCOfferContext)initWithFlags:(int64_t)a3;
- (ASCOfferContext)initWithFlags:(int64_t)a3 presentingSceneIdentifier:(id)a4 presentingSceneBundleIdentifier:(id)a5 externalDeepLinkURL:(id)a6 paymentViewServiceListener:(id)a7;
- (ASCOfferContext)offerContextWithPresentingSceneIdentifier:(id)a3 presentingSceneBundleIdentifier:(id)a4 externalDeepLinkURL:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldInstallParentApp;
- (BOOL)supportsDSIDLessInstall;
- (BOOL)universalLinkRequired;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSURL)externalDeepLinkURL;
- (NSXPCListenerEndpoint)paymentViewServiceListener;
- (id)description;
- (id)offerContextByAddingFlags:(int64_t)a3;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCOfferContext

- (ASCOfferContext)initWithFlags:(int64_t)a3 presentingSceneIdentifier:(id)a4 presentingSceneBundleIdentifier:(id)a5 externalDeepLinkURL:(id)a6 paymentViewServiceListener:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ASCOfferContext;
  v16 = [(ASCOfferContext *)&v25 init];
  v17 = v16;
  if (v16)
  {
    v16->_flags = a3;
    v18 = (NSString *)[v12 copy];
    presentingSceneIdentifier = v17->_presentingSceneIdentifier;
    v17->_presentingSceneIdentifier = v18;

    v20 = (NSString *)[v13 copy];
    presentingSceneBundleIdentifier = v17->_presentingSceneBundleIdentifier;
    v17->_presentingSceneBundleIdentifier = v20;

    v22 = (NSURL *)[v14 copy];
    externalDeepLinkURL = v17->_externalDeepLinkURL;
    v17->_externalDeepLinkURL = v22;

    objc_storeStrong((id *)&v17->_paymentViewServiceListener, a7);
  }

  return v17;
}

- (ASCOfferContext)initWithFlags:(int64_t)a3
{
  return [(ASCOfferContext *)self initWithFlags:a3 presentingSceneIdentifier:0 presentingSceneBundleIdentifier:0 externalDeepLinkURL:0 paymentViewServiceListener:0];
}

- (ASCOfferContext)init
{
  return [(ASCOfferContext *)self initWithFlags:0];
}

- (BOOL)supportsDSIDLessInstall
{
  return [(ASCOfferContext *)self flags] & 1;
}

- (BOOL)shouldInstallParentApp
{
  return ((unint64_t)[(ASCOfferContext *)self flags] >> 1) & 1;
}

- (BOOL)universalLinkRequired
{
  return ((unint64_t)[(ASCOfferContext *)self flags] >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"flags"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneBundleIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalDeepLinkURL"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentViewServiceListener"];

  v10 = [(ASCOfferContext *)self initWithFlags:v5 presentingSceneIdentifier:v6 presentingSceneBundleIdentifier:v7 externalDeepLinkURL:v8 paymentViewServiceListener:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferContext flags](self, "flags"), @"flags");
  id v5 = [(ASCOfferContext *)self presentingSceneIdentifier];
  [v4 encodeObject:v5 forKey:@"presentingSceneIdentifier"];

  v6 = [(ASCOfferContext *)self presentingSceneBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"presentingSceneBundleIdentifier"];

  v7 = [(ASCOfferContext *)self externalDeepLinkURL];
  [v4 encodeObject:v7 forKey:@"externalDeepLinkURL"];

  id v8 = [(ASCOfferContext *)self paymentViewServiceListener];
  [v4 encodeObject:v8 forKey:@"paymentViewServiceListener"];
}

- (id)offerContextByAddingFlags:(int64_t)a3
{
  unint64_t v4 = [(ASCOfferContext *)self flags] | a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCOfferContext *)self presentingSceneIdentifier];
  v7 = [(ASCOfferContext *)self presentingSceneBundleIdentifier];
  id v8 = [(ASCOfferContext *)self externalDeepLinkURL];
  v9 = [(ASCOfferContext *)self paymentViewServiceListener];
  id v10 = [v5 initWithFlags:v4 presentingSceneIdentifier:v6 presentingSceneBundleIdentifier:v7 externalDeepLinkURL:v8 paymentViewServiceListener:v9];

  return v10;
}

- (ASCOfferContext)offerContextWithPresentingSceneIdentifier:(id)a3 presentingSceneBundleIdentifier:(id)a4 externalDeepLinkURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)objc_opt_class());
  int64_t v12 = [(ASCOfferContext *)self flags];
  id v13 = [(ASCOfferContext *)self paymentViewServiceListener];
  id v14 = [v11 initWithFlags:v12 presentingSceneIdentifier:v10 presentingSceneBundleIdentifier:v9 externalDeepLinkURL:v8 paymentViewServiceListener:v13];

  return (ASCOfferContext *)v14;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  [(ASCHasher *)v3 combineInteger:[(ASCOfferContext *)self flags]];
  unint64_t v4 = [(ASCHasher *)v3 finalizeHash];

  return v4;
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
    unsigned int v8 = [(ASCOfferContext *)self supportsDSIDLessInstall];
    if (v8 == [v7 supportsDSIDLessInstall])
    {
      unsigned int v9 = [(ASCOfferContext *)self shouldInstallParentApp];
      if (v9 == [v7 shouldInstallParentApp])
      {
        int64_t v12 = [(ASCOfferContext *)self presentingSceneIdentifier];
        uint64_t v13 = [v7 presentingSceneIdentifier];
        id v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_14:
            id v15 = [(ASCOfferContext *)self presentingSceneBundleIdentifier];
            uint64_t v16 = [v7 presentingSceneBundleIdentifier];
            v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_17:
                v18 = [(ASCOfferContext *)self externalDeepLinkURL];
                uint64_t v19 = [v7 externalDeepLinkURL];
                v20 = (void *)v19;
                if (v18 && v19)
                {
                  if (![v18 isEqual:v19]) {
                    goto LABEL_27;
                  }
                }
                else if (v18 != (void *)v19)
                {
                  goto LABEL_27;
                }
                unsigned int v21 = [(ASCOfferContext *)self universalLinkRequired];
                if (v21 == [v7 universalLinkRequired])
                {
                  v22 = [(ASCOfferContext *)self paymentViewServiceListener];
                  uint64_t v23 = [v7 paymentViewServiceListener];
                  v24 = (void *)v23;
                  objc_super v25 = v22;
                  if (v22 && v23) {
                    unsigned __int8 v10 = [v22 isEqual:v23];
                  }
                  else {
                    unsigned __int8 v10 = v22 == (void *)v23;
                  }

                  goto LABEL_33;
                }
LABEL_27:
                unsigned __int8 v10 = 0;
LABEL_33:

                goto LABEL_34;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_17;
            }
            unsigned __int8 v10 = 0;
LABEL_34:

            goto LABEL_35;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_14;
        }
        unsigned __int8 v10 = 0;
LABEL_35:

        goto LABEL_10;
      }
    }
  }
  unsigned __int8 v10 = 0;
LABEL_10:

  return v10;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  [(ASCDescriber *)v3 addBool:[(ASCOfferContext *)self supportsDSIDLessInstall] withName:@"supportsDSIDLessInstall"];
  [(ASCDescriber *)v3 addBool:[(ASCOfferContext *)self shouldInstallParentApp] withName:@"shouldInstallParentApp"];
  id v4 = [(ASCOfferContext *)self presentingSceneIdentifier];
  [(ASCDescriber *)v3 addObject:v4 withName:@"presentingSceneIdentifier"];

  id v5 = [(ASCOfferContext *)self presentingSceneBundleIdentifier];
  [(ASCDescriber *)v3 addObject:v5 withName:@"presentingSceneBundleIdentifier"];

  v6 = [(ASCOfferContext *)self externalDeepLinkURL];
  [(ASCDescriber *)v3 addObject:v6 withName:@"externalDeepLinkURL"];

  [(ASCDescriber *)v3 addBool:[(ASCOfferContext *)self universalLinkRequired] withName:@"universalLinkRequired"];
  id v7 = [(ASCOfferContext *)self paymentViewServiceListener];
  [(ASCDescriber *)v3 addObject:v7 withName:@"paymentViewServiceListener"];

  unsigned int v8 = [(ASCDescriber *)v3 finalizeDescription];

  return v8;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (NSURL)externalDeepLinkURL
{
  return self->_externalDeepLinkURL;
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_externalDeepLinkURL, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
}

@end