@interface ASCLockup
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCArtwork)icon;
- (ASCLockup)initWithCoder:(id)a3;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 icon:(id)a5 heading:(id)a6 title:(id)a7 subtitle:(id)a8 ageRating:(id)a9 offer:(id)a10;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11 features:(id)a12;
- (ASCLockup)lockupWithOffer:(id)a3;
- (ASCLockup)lockupWithSignpostTags:(id)a3;
- (ASCLockupDisplayContext)displayContext;
- (ASCOffer)offer;
- (ASCScreenshots)screenshots;
- (ASCTrailers)trailers;
- (ASCViewMetrics)metrics;
- (BOOL)hasMedia;
- (BOOL)isDistributor;
- (BOOL)isEditorsChoice;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresSSOEntitlement;
- (NSArray)features;
- (NSArray)subgenres;
- (NSArray)webDistributionDomains;
- (NSDictionary)contentRatingsBySystem;
- (NSSet)signpostTags;
- (NSString)ageRating;
- (NSString)appVersionId;
- (NSString)bundleID;
- (NSString)contentProviderTeamID;
- (NSString)description;
- (NSString)developerId;
- (NSString)developerName;
- (NSString)distributorBundleId;
- (NSString)eula;
- (NSString)genreID;
- (NSString)genreName;
- (NSString)heading;
- (NSString)kind;
- (NSString)privacyPolicyUrl;
- (NSString)productDescription;
- (NSString)productPageDescription;
- (NSString)productPageMetadata;
- (NSString)productRatingBadge;
- (NSString)productVariantID;
- (NSString)shortName;
- (NSString)subtitle;
- (NSString)supportUrl;
- (NSString)title;
- (float)productRating;
- (id)featureWithClass:(Class)a3;
- (id)lockupByAddingFeature:(id)a3;
- (unint64_t)hash;
- (void)_buyParamsWithCompletionBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockup

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11 features:(id)a12
{
  id v17 = a3;
  id v49 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v50.receiver = self;
  v50.super_class = (Class)ASCLockup;
  v26 = [(ASCLockup *)&v50 init];
  if (v26)
  {
    uint64_t v27 = [v17 copy];
    id = v26->_id;
    v26->_id = (ASCAdamID *)v27;

    uint64_t v29 = [v49 copy];
    kind = v26->_kind;
    v26->_kind = (NSString *)v29;

    uint64_t v31 = [v18 copy];
    metrics = v26->_metrics;
    v26->_metrics = (ASCViewMetrics *)v31;

    uint64_t v33 = [v19 copy];
    icon = v26->_icon;
    v26->_icon = (ASCArtwork *)v33;

    uint64_t v35 = [v20 copy];
    heading = v26->_heading;
    v26->_heading = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    title = v26->_title;
    v26->_title = (NSString *)v37;

    uint64_t v39 = [v22 copy];
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v39;

    uint64_t v41 = [v23 copy];
    ageRating = v26->_ageRating;
    v26->_ageRating = (NSString *)v41;

    uint64_t v43 = [v24 copyWithZone:0];
    offer = v26->_offer;
    v26->_offer = (ASCOffer *)v43;

    uint64_t v45 = [v25 copy];
    features = v26->_features;
    v26->_features = (NSArray *)v45;
  }
  return v26;
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11
{
  return [(ASCLockup *)self initWithID:a3 kind:a4 metrics:a5 icon:a6 heading:a7 title:a8 subtitle:a9 ageRating:a10 offer:a11 features:MEMORY[0x1E4F1CBF0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    if (v6)
    {
      id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
      id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heading"];
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
      id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageRating"];
      v10 = ASCOfferDecodeForKey(v4, @"offer");
      v11 = ASCLockupFeaturesDecodeForKey(v4, @"features");
      v12 = v5;
      v13 = v6;
      id v24 = v6;
      v14 = (void *)v7;
      uint64_t v15 = v7;
      v16 = v5;
      id v17 = (void *)v8;
      id v18 = [(ASCLockup *)self initWithID:v12 kind:v13 metrics:v22 icon:v15 heading:v23 title:v8 subtitle:v21 ageRating:v9 offer:v10 features:v11];

      v5 = v16;
      self = v18;

      v6 = v24;
      id v19 = v18;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ASCLockup initWithCoder:]();
      }
      id v19 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ASCLockup initWithCoder:]();
    }
    id v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockup *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCLockup *)self kind];
  [v4 encodeObject:v6 forKey:@"kind"];

  uint64_t v7 = [(ASCLockup *)self metrics];
  [v4 encodeObject:v7 forKey:@"metrics"];

  uint64_t v8 = [(ASCLockup *)self icon];
  [v4 encodeObject:v8 forKey:@"icon"];

  v9 = [(ASCLockup *)self heading];
  [v4 encodeObject:v9 forKey:@"heading"];

  v10 = [(ASCLockup *)self title];
  [v4 encodeObject:v10 forKey:@"title"];

  v11 = [(ASCLockup *)self subtitle];
  [v4 encodeObject:v11 forKey:@"subtitle"];

  v12 = [(ASCLockup *)self ageRating];
  [v4 encodeObject:v12 forKey:@"ageRating"];

  v13 = [(ASCLockup *)self offer];
  [v4 encodeObject:v13 forKey:@"offer"];

  id v14 = [(ASCLockup *)self features];
  [v4 encodeObject:v14 forKey:@"features"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockup *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockup *)self kind];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCLockup *)self metrics];
  [(ASCHasher *)v3 combineObject:v6];

  uint64_t v7 = [(ASCLockup *)self icon];
  [(ASCHasher *)v3 combineObject:v7];

  uint64_t v8 = [(ASCLockup *)self heading];
  [(ASCHasher *)v3 combineObject:v8];

  v9 = [(ASCLockup *)self title];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCLockup *)self subtitle];
  [(ASCHasher *)v3 combineObject:v10];

  v11 = [(ASCLockup *)self ageRating];
  [(ASCHasher *)v3 combineObject:v11];

  v12 = [(ASCLockup *)self offer];
  [(ASCHasher *)v3 combineObject:v12];

  v13 = [(ASCLockup *)self features];
  [(ASCHasher *)v3 combineObject:v13];

  unint64_t v14 = [(ASCHasher *)v3 finalizeHash];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockup *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
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
    uint64_t v8 = v6;

    if (!v8)
    {
      BOOL v7 = 0;
LABEL_69:

      goto LABEL_70;
    }
    v9 = [(ASCLockup *)self id];
    uint64_t v10 = [(ASCLockup *)v8 id];
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10])
      {
LABEL_12:
        v12 = [(ASCLockup *)self kind];
        uint64_t v13 = [(ASCLockup *)v8 kind];
        unint64_t v14 = (void *)v13;
        if (v12 && v13)
        {
          if ([v12 isEqual:v13])
          {
LABEL_15:
            uint64_t v15 = [(ASCLockup *)self metrics];
            uint64_t v16 = [(ASCLockup *)v8 metrics];
            id v17 = (void *)v16;
            if (v15 && v16)
            {
              if ([v15 isEqual:v16])
              {
LABEL_18:
                id v18 = [(ASCLockup *)self icon];
                uint64_t v19 = [(ASCLockup *)v8 icon];
                id v20 = (void *)v19;
                if (v18 && v19)
                {
                  id v21 = v18;
                  v66 = v15;
                  id v22 = v17;
                  id v23 = v18;
                  id v24 = v20;
                  int v25 = [v21 isEqual:v20];
                  id v20 = v24;
                  id v18 = v23;
                  id v17 = v22;
                  uint64_t v15 = v66;
                  if (v25)
                  {
LABEL_21:
                    v64 = v20;
                    v65 = v18;
                    uint64_t v26 = [(ASCLockup *)self heading];
                    uint64_t v27 = [(ASCLockup *)v8 heading];
                    v28 = (void *)v27;
                    v67 = (void *)v26;
                    if (v26 && v27)
                    {
                      uint64_t v29 = (void *)v27;
                      int v30 = [v67 isEqual:v27];
                      v28 = v29;
                      if (v30)
                      {
LABEL_24:
                        v62 = v28;
                        uint64_t v31 = [(ASCLockup *)self title];
                        uint64_t v32 = [(ASCLockup *)v8 title];
                        uint64_t v33 = (void *)v32;
                        v63 = (void *)v31;
                        if (v31 && v32)
                        {
                          v34 = (void *)v32;
                          int v35 = [v63 isEqual:v32];
                          uint64_t v33 = v34;
                          if (v35)
                          {
LABEL_27:
                            v60 = v33;
                            uint64_t v36 = [(ASCLockup *)self subtitle];
                            uint64_t v37 = [(ASCLockup *)v8 subtitle];
                            v38 = (void *)v37;
                            v61 = (void *)v36;
                            if (v36 && v37)
                            {
                              uint64_t v39 = (void *)v37;
                              int v40 = [v61 isEqual:v37];
                              v38 = v39;
                              if (v40)
                              {
LABEL_30:
                                v58 = v38;
                                uint64_t v41 = [(ASCLockup *)self ageRating];
                                uint64_t v42 = [(ASCLockup *)v8 ageRating];
                                uint64_t v43 = (void *)v42;
                                v59 = (void *)v41;
                                if (v41 && v42)
                                {
                                  v44 = (void *)v42;
                                  int v45 = [v59 isEqual:v42];
                                  uint64_t v43 = v44;
                                  if (v45)
                                  {
LABEL_33:
                                    v46 = [(ASCLockup *)self offer];
                                    uint64_t v47 = [(ASCLockup *)v8 offer];
                                    v56 = (void *)v47;
                                    v57 = v46;
                                    if (v46 && v47)
                                    {
                                      if ([v46 isEqual:v47]) {
                                        goto LABEL_36;
                                      }
                                    }
                                    else if (v46 == (void *)v47)
                                    {
LABEL_36:
                                      v48 = [(ASCLockup *)self features];
                                      uint64_t v49 = [(ASCLockup *)v8 features];
                                      objc_super v50 = (void *)v49;
                                      if (v48 && v49)
                                      {
                                        v51 = (void *)v49;
                                        char v52 = [v48 isEqual:v49];
                                        objc_super v50 = v51;
                                        v53 = v48;
                                        BOOL v7 = v52;
                                      }
                                      else
                                      {
                                        v53 = v48;
                                        BOOL v7 = v48 == (void *)v49;
                                      }

                                      goto LABEL_60;
                                    }
                                    BOOL v7 = 0;
LABEL_60:

                                    uint64_t v43 = v55;
                                    goto LABEL_61;
                                  }
                                }
                                else if (v41 == v42)
                                {
                                  goto LABEL_33;
                                }
                                BOOL v7 = 0;
LABEL_61:

                                v38 = v58;
                                goto LABEL_62;
                              }
                            }
                            else if (v36 == v37)
                            {
                              goto LABEL_30;
                            }
                            BOOL v7 = 0;
LABEL_62:

                            uint64_t v33 = v60;
                            goto LABEL_63;
                          }
                        }
                        else if (v31 == v32)
                        {
                          goto LABEL_27;
                        }
                        BOOL v7 = 0;
LABEL_63:

                        v28 = v62;
                        goto LABEL_64;
                      }
                    }
                    else if (v26 == v27)
                    {
                      goto LABEL_24;
                    }
                    BOOL v7 = 0;
LABEL_64:

                    id v20 = v64;
                    id v18 = v65;
                    goto LABEL_65;
                  }
                }
                else if (v18 == (void *)v19)
                {
                  goto LABEL_21;
                }
                BOOL v7 = 0;
LABEL_65:

                goto LABEL_66;
              }
            }
            else if (v15 == (void *)v16)
            {
              goto LABEL_18;
            }
            BOOL v7 = 0;
LABEL_66:

            goto LABEL_67;
          }
        }
        else if (v12 == (void *)v13)
        {
          goto LABEL_15;
        }
        BOOL v7 = 0;
LABEL_67:

        goto LABEL_68;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    BOOL v7 = 0;
LABEL_68:

    goto LABEL_69;
  }
  BOOL v7 = 1;
LABEL_70:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockup *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  v5 = [(ASCLockup *)self kind];
  [(ASCDescriber *)v3 addObject:v5 withName:@"kind"];

  v6 = [(ASCLockup *)self metrics];
  [(ASCDescriber *)v3 addObject:v6 withName:@"metrics"];

  BOOL v7 = [(ASCLockup *)self icon];
  [(ASCDescriber *)v3 addObject:v7 withName:@"icon"];

  uint64_t v8 = [(ASCLockup *)self heading];
  [(ASCDescriber *)v3 addObject:v8 withName:@"heading"];

  v9 = [(ASCLockup *)self title];
  [(ASCDescriber *)v3 addObject:v9 withName:@"title"];

  uint64_t v10 = [(ASCLockup *)self subtitle];
  [(ASCDescriber *)v3 addObject:v10 withName:@"subtitle"];

  v11 = [(ASCLockup *)self ageRating];
  [(ASCDescriber *)v3 addObject:v11 withName:@"ageRating"];

  v12 = [(ASCLockup *)self offer];
  [(ASCDescriber *)v3 addObject:v12 withName:@"offer"];

  uint64_t v13 = [(ASCLockup *)self features];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [(ASCLockup *)self features];
    [(ASCDescriber *)v3 addObject:v15 withName:@"features"];
  }
  uint64_t v16 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v16;
}

- (id)featureWithClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(ASCLockup *)self features];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)lockupByAddingFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASCLockup *)self features];
  uint64_t v6 = (void *)[v5 mutableCopy];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __35__ASCLockup_lockupByAddingFeature___block_invoke;
  v22[3] = &unk_1E645DC38;
  id v7 = v4;
  id v23 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v22];
  id v21 = v7;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    [v6 addObject:v7];
  }
  else {
    [v6 replaceObjectAtIndex:v8 withObject:v7];
  }
  uint64_t v19 = [ASCLockup alloc];
  id v9 = [(ASCLockup *)self id];
  uint64_t v10 = [(ASCLockup *)self kind];
  long long v11 = [(ASCLockup *)self metrics];
  long long v12 = [(ASCLockup *)self icon];
  long long v13 = [(ASCLockup *)self heading];
  long long v14 = [(ASCLockup *)self title];
  uint64_t v15 = [(ASCLockup *)self subtitle];
  uint64_t v16 = [(ASCLockup *)self ageRating];
  id v17 = [(ASCLockup *)self offer];
  id v20 = [(ASCLockup *)v19 initWithID:v9 kind:v10 metrics:v11 icon:v12 heading:v13 title:v14 subtitle:v15 ageRating:v16 offer:v17 features:v6];

  return v20;
}

uint64_t __35__ASCLockup_lockupByAddingFeature___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (ASCLockup)lockupWithOffer:(id)a3
{
  id v4 = a3;
  uint64_t v16 = [ASCLockup alloc];
  uint64_t v15 = [(ASCLockup *)self id];
  uint64_t v5 = [(ASCLockup *)self kind];
  uint64_t v6 = [(ASCLockup *)self metrics];
  id v7 = [(ASCLockup *)self icon];
  uint64_t v8 = [(ASCLockup *)self heading];
  id v9 = [(ASCLockup *)self title];
  uint64_t v10 = [(ASCLockup *)self subtitle];
  long long v11 = [(ASCLockup *)self ageRating];
  long long v12 = [(ASCLockup *)self features];
  long long v13 = [(ASCLockup *)v16 initWithID:v15 kind:v5 metrics:v6 icon:v7 heading:v8 title:v9 subtitle:v10 ageRating:v11 offer:v4 features:v12];

  return v13;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (ASCViewMetrics)metrics
{
  return self->_metrics;
}

- (ASCArtwork)icon
{
  return self->_icon;
}

- (NSString)heading
{
  return self->_heading;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 icon:(id)a5 heading:(id)a6 title:(id)a7 subtitle:(id)a8 ageRating:(id)a9 offer:(id)a10
{
  return [(ASCLockup *)self initWithID:a3 kind:a4 metrics:0 icon:a5 heading:a6 title:a7 subtitle:a8 ageRating:a9 offer:a10];
}

- (BOOL)isEditorsChoice
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  char v3 = [v2 isEditorsChoice];

  return v3;
}

- (float)productRating
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  [v2 productRating];
  float v4 = v3;

  return v4;
}

- (NSString)productRatingBadge
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 productRatingBadge];

  return (NSString *)v3;
}

- (NSString)productDescription
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 productDescription];

  return (NSString *)v3;
}

- (NSString)distributorBundleId
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 distributorBundleId];

  return (NSString *)v3;
}

- (NSString)appVersionId
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 appVersionId];

  return (NSString *)v3;
}

- (NSString)developerId
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 developerId];

  return (NSString *)v3;
}

- (NSArray)webDistributionDomains
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 webDistributionDomains];

  return (NSArray *)v3;
}

- (NSString)supportUrl
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 supportUrl];

  return (NSString *)v3;
}

- (NSDictionary)contentRatingsBySystem
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  float v3 = [v2 contentRatingsBySystem];

  return (NSDictionary *)v3;
}

- (BOOL)isDistributor
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  char v3 = [v2 isDistributor];

  return v3;
}

- (NSString)bundleID
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  char v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (void)_buyParamsWithCompletionBlock:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F4DDC8] BOOLForEntitlement:@"com.apple.private.appstorecomponents.lockup-buy-params"])
  {
    uint64_t v5 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
    id v6 = v5;
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ASCLockup(BuyParams) _buyParamsWithCompletionBlock:]();
      }
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F28568];
      uint64_t v36 = @"Missing lockup app offer data.";
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v20 = (void *)[v18 initWithDomain:@"ASCLockupBuyParamsErrorDomain" code:1 userInfo:v19];

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_14;
      v29[3] = &unk_1E645DC60;
      id v30 = v20;
      id v31 = v4;
      id v12 = v20;
      dispatch_async(MEMORY[0x1E4F14428], v29);

      long long v14 = v31;
      goto LABEL_11;
    }
    id v7 = [v5 appOffer];
    uint64_t v8 = [v7 metricsBuyParams];

    if (v8)
    {
      id v9 = +[ASCAppOfferStateCenter sharedCenter];
      uint64_t v10 = [v6 appOffer];
      long long v11 = objc_alloc_init(ASCMetricsActivity);
      id v12 = [v9 decorateBuyParamsForOffer:v10 withActivity:v11];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_2;
      v23[3] = &unk_1E645DC88;
      id v13 = v4;
      id v24 = v13;
      [v12 addSuccessBlock:v23];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_4;
      v21[3] = &unk_1E645DCB0;
      id v22 = v13;
      [v12 addErrorBlock:v21];

      long long v14 = v24;
LABEL_11:

      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Not decorating metricsBuyParams because they were nil.", buf, 2u);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_15;
    v25[3] = &unk_1E645DC60;
    id v27 = v4;
    id v6 = v6;
    id v26 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v25);

    id v12 = v27;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ASCLockup(BuyParams) _buyParamsWithCompletionBlock:]();
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"Host app was not entitled";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v17 = (void *)[v15 initWithDomain:@"ASCLockupBuyParamsErrorDomain" code:0 userInfo:v16];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke;
    block[3] = &unk_1E645DC60;
    id v33 = v17;
    id v34 = v4;
    id v6 = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v12 = v34;
  }
LABEL_15:
}

uint64_t __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) appOffer];
  id v2 = [v3 baseBuyParams];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v2, 0);
}

void __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E645DC60;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __54__ASCLockup_BuyParams___buyParamsWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (NSString)developerName
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 developerName];

  return (NSString *)v3;
}

- (ASCLockupDisplayContext)displayContext
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 displayContext];

  return (ASCLockupDisplayContext *)v3;
}

- (NSString)privacyPolicyUrl
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 privacyPolicyUrl];

  return (NSString *)v3;
}

- (NSString)eula
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 eula];

  return (NSString *)v3;
}

- (NSString)genreName
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 genreName];

  return (NSString *)v3;
}

- (NSString)genreID
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 genreID];

  return (NSString *)v3;
}

- (NSArray)subgenres
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 subgenres];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (ASCScreenshots)screenshots
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 screenshots];

  return (ASCScreenshots *)v3;
}

- (ASCTrailers)trailers
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 trailers];

  return (ASCTrailers *)v3;
}

- (BOOL)hasMedia
{
  id v3 = [(ASCLockup *)self screenshots];
  id v4 = [v3 artwork];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(ASCLockup *)self trailers];
    id v7 = [v6 videos];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

- (NSString)productPageMetadata
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 productPageMetadata];

  return (NSString *)v3;
}

- (NSString)productPageDescription
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 productPageDescription];

  return (NSString *)v3;
}

- (NSString)productVariantID
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 productVariantID];

  return (NSString *)v3;
}

- (NSString)contentProviderTeamID
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 contentProviderTeamID];
  }
  else
  {
    if (os_variant_has_internal_content())
    {
      id v7 = [NSString alloc];
      id v8 = [(ASCLockup *)self id];
      uint64_t v9 = [v7 initWithFormat:@"Lockup for %@ Adam ID does not include Safari extension feature.", v8];

      id v10 = objc_alloc(MEMORY[0x1E4F1CA00]);
      uint64_t v11 = *MEMORY[0x1E4F1C3B8];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v15[0] = *MEMORY[0x1E4F285A0];
      v15[1] = v12;
      v16[0] = @"Set ASCLockupContextSafariExtension context on lockup request";
      v16[1] = @"Possibly a mismatching JS version for ASC";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      id v14 = (id)[v10 initWithName:v11 reason:v9 userInfo:v13];

      objc_exception_throw(v14);
    }
    BOOL v5 = &stru_1F1E020F8;
  }

  return (NSString *)v5;
}

- (NSString)shortName
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 shortName];

  return (NSString *)v3;
}

- (NSSet)signpostTags
{
  id v2 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v3 = [v2 signpostTags];

  return (NSSet *)v3;
}

- (ASCLockup)lockupWithSignpostTags:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[ASCLockupFeatureSignpostTags alloc] initWithSignpostTags:v4];

  id v6 = [(ASCLockup *)self lockupByAddingFeature:v5];

  return (ASCLockup *)v6;
}

- (BOOL)requiresSSOEntitlement
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(ASCLockup *)self featureWithClass:objc_opt_class()];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 requiresSSOEntitlement];
  }
  else
  {
    if (os_variant_has_internal_content())
    {
      id v7 = [NSString alloc];
      id v8 = [(ASCLockup *)self id];
      uint64_t v9 = [v7 initWithFormat:@"Lockup for %@ Adam ID does not include Single Sign On feature.", v8];

      id v10 = objc_alloc(MEMORY[0x1E4F1CA00]);
      uint64_t v11 = *MEMORY[0x1E4F1C3B8];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v15[0] = *MEMORY[0x1E4F285A0];
      v15[1] = v12;
      v16[0] = @"Set ASCLockupContextSingleSignOn context on lockup request";
      v16[1] = @"Possibly a mismatching JS version for ASC";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      id v14 = (id)[v10 initWithName:v11 reason:v9 userInfo:v13];

      objc_exception_throw(v14);
    }
    char v5 = 0;
  }

  return v5;
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCLockup because id was missing", v0, 2u);
}

- (void)initWithCoder:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCLockupKind because kind was missing", v0, 2u);
}

@end