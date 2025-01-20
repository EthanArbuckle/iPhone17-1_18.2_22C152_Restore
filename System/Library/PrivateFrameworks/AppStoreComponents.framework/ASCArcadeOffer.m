@interface ASCArcadeOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCArcadeOffer)initWithCoder:(id)a3;
- (ASCArcadeOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 notSubscribedOffer:(id)a9 subscribedOffer:(id)a10;
- (ASCArcadeOffer)offerWithMetrics:(id)a3;
- (ASCOffer)notSubscribedOffer;
- (ASCOffer)subscribedOffer;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)description;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCArcadeOffer

- (ASCArcadeOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 notSubscribedOffer:(id)a9 subscribedOffer:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)ASCArcadeOffer;
  v23 = [(ASCArcadeOffer *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    id = v23->_id;
    v23->_id = (ASCAdamID *)v24;

    uint64_t v26 = [v17 copy];
    titles = v23->_titles;
    v23->_titles = (NSDictionary *)v26;

    uint64_t v28 = [v18 copy];
    subtitles = v23->_subtitles;
    v23->_subtitles = (NSDictionary *)v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    uint64_t v30 = [v20 copy];
    metrics = v23->_metrics;
    v23->_metrics = (NSArray *)v30;

    uint64_t v32 = [v21 copyWithZone:0];
    notSubscribedOffer = v23->_notSubscribedOffer;
    v23->_notSubscribedOffer = (ASCOffer *)v32;

    uint64_t v34 = [v22 copyWithZone:0];
    subscribedOffer = v23->_subscribedOffer;
    v23->_subscribedOffer = (ASCOffer *)v34;
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCArcadeOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  if (v5)
  {
    v6 = ASCOfferTitlesDecodeForKey(v4, @"titles");
    if (v6)
    {
      v7 = ASCOfferTitlesDecodeForKey(v4, @"subtitles");
      if (v7)
      {
        uint64_t v8 = [v4 decodeIntegerForKey:@"flags"];
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageRating"];
        v10 = ASCMetricsDataDecodeArrayForKey(v4, @"metrics");
        if (v10)
        {
          v11 = ASCOfferDecodeForKey(v4, @"notSubscribedOffer");
          if (v11)
          {
            uint64_t v12 = ASCOfferDecodeForKey(v4, @"subscribedOffer");
            v13 = (void *)v12;
            if (v12)
            {
              self = [(ASCArcadeOffer *)self initWithID:v5 titles:v6 subtitles:v7 flags:v8 ageRating:v9 metrics:v10 notSubscribedOffer:v11 subscribedOffer:v12];
              v14 = self;
            }
            else
            {
              BOOL v55 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
              if (v55) {
                -[ASCArcadeOffer initWithCoder:].cold.6(v55, v56, v57, v58, v59, v60, v61, v62);
              }
              v14 = 0;
            }
          }
          else
          {
            BOOL v47 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v47) {
              -[ASCArcadeOffer initWithCoder:].cold.5(v47, v48, v49, v50, v51, v52, v53, v54);
            }
            v14 = 0;
          }
        }
        else
        {
          BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v39) {
            -[ASCArcadeOffer initWithCoder:].cold.4(v39, v40, v41, v42, v43, v44, v45, v46);
          }
          v14 = 0;
        }
      }
      else
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v31) {
          -[ASCArcadeOffer initWithCoder:](v31, v32, v33, v34, v35, v36, v37, v38);
        }
        v14 = 0;
      }
    }
    else
    {
      BOOL v23 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v23) {
        -[ASCArcadeOffer initWithCoder:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
      v14 = 0;
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v15) {
      -[ASCArcadeOffer initWithCoder:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCArcadeOffer *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCArcadeOffer *)self titles];
  [v4 encodeObject:v6 forKey:@"titles"];

  v7 = [(ASCArcadeOffer *)self subtitles];
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCArcadeOffer flags](self, "flags"), @"flags");
  uint64_t v8 = [(ASCArcadeOffer *)self ageRating];
  [v4 encodeObject:v8 forKey:@"ageRating"];

  v9 = [(ASCArcadeOffer *)self metrics];
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = [(ASCArcadeOffer *)self notSubscribedOffer];
  [v4 encodeObject:v10 forKey:@"notSubscribedOffer"];

  id v11 = [(ASCArcadeOffer *)self subscribedOffer];
  [v4 encodeObject:v11 forKey:@"subscribedOffer"];
}

- (ASCArcadeOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCArcadeOffer *)self id];
  v7 = [(ASCArcadeOffer *)self titles];
  uint64_t v8 = [(ASCArcadeOffer *)self subtitles];
  int64_t v9 = [(ASCArcadeOffer *)self flags];
  v10 = [(ASCArcadeOffer *)self ageRating];
  id v11 = [(ASCArcadeOffer *)self notSubscribedOffer];
  uint64_t v12 = [(ASCArcadeOffer *)self subscribedOffer];
  v13 = (void *)[v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 notSubscribedOffer:v11 subscribedOffer:v12];

  return (ASCArcadeOffer *)v13;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCArcadeOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCArcadeOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCArcadeOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCArcadeOffer *)self flags]];
  v7 = [(ASCArcadeOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  uint64_t v8 = [(ASCArcadeOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  int64_t v9 = [(ASCArcadeOffer *)self notSubscribedOffer];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCArcadeOffer *)self subscribedOffer];
  [(ASCHasher *)v3 combineObject:v10];

  unint64_t v11 = [(ASCHasher *)v3 finalizeHash];
  return v11;
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
    uint64_t v8 = [(ASCArcadeOffer *)self id];
    uint64_t v9 = [v7 id];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        unint64_t v11 = [(ASCArcadeOffer *)self titles];
        uint64_t v12 = [v7 titles];
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            v14 = [(ASCArcadeOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            uint64_t v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_36;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_36;
            }
            int64_t v18 = [(ASCArcadeOffer *)self flags];
            if (v18 == [v7 flags])
            {
              uint64_t v19 = [(ASCArcadeOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              uint64_t v21 = (void *)v20;
              BOOL v47 = v19;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                BOOL v23 = v21;
                int v24 = [v22 isEqual:v21];
                uint64_t v21 = v23;
                uint64_t v19 = v47;
                if (v24)
                {
LABEL_27:
                  uint64_t v45 = v21;
                  uint64_t v25 = [(ASCArcadeOffer *)self metrics];
                  uint64_t v26 = [v7 metrics];
                  uint64_t v27 = (void *)v26;
                  uint64_t v46 = (void *)v25;
                  if (v25 && v26)
                  {
                    uint64_t v28 = (void *)v26;
                    int v29 = [v46 isEqual:v26];
                    uint64_t v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      uint64_t v43 = v27;
                      uint64_t v30 = [(ASCArcadeOffer *)self notSubscribedOffer];
                      uint64_t v31 = [v7 notSubscribedOffer];
                      uint64_t v32 = (void *)v31;
                      uint64_t v44 = (void *)v30;
                      if (v30 && v31)
                      {
                        uint64_t v33 = (void *)v31;
                        int v34 = [v44 isEqual:v31];
                        uint64_t v32 = v33;
                        if (v34) {
                          goto LABEL_33;
                        }
                      }
                      else if (v30 == v31)
                      {
LABEL_33:
                        uint64_t v35 = [(ASCArcadeOffer *)self subscribedOffer];
                        uint64_t v36 = [v7 subscribedOffer];
                        uint64_t v37 = (void *)v36;
                        if (v35 && v36)
                        {
                          uint64_t v38 = (void *)v36;
                          char v39 = [v35 isEqual:v36];
                          uint64_t v37 = v38;
                          uint64_t v40 = v35;
                          BOOL v17 = v39;
                        }
                        else
                        {
                          uint64_t v40 = v35;
                          BOOL v17 = v35 == (void *)v36;
                        }

                        uint64_t v32 = v42;
                        goto LABEL_45;
                      }
                      BOOL v17 = 0;
LABEL_45:

                      uint64_t v27 = v43;
                      goto LABEL_46;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  BOOL v17 = 0;
LABEL_46:

                  uint64_t v21 = v45;
                  uint64_t v19 = v47;
                  goto LABEL_47;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              BOOL v17 = 0;
LABEL_47:

              goto LABEL_48;
            }
LABEL_36:
            BOOL v17 = 0;
LABEL_48:

            goto LABEL_49;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        BOOL v17 = 0;
LABEL_49:

        goto LABEL_50;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    BOOL v17 = 0;
LABEL_50:

    goto LABEL_51;
  }
  BOOL v17 = 0;
LABEL_51:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCArcadeOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCArcadeOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCArcadeOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription([(ASCArcadeOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  uint64_t v8 = [(ASCArcadeOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCArcadeOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  v10 = [(ASCArcadeOffer *)self notSubscribedOffer];
  [(ASCDescriber *)v3 addObject:v10 withName:@"notSubscribedOffer"];

  unint64_t v11 = [(ASCArcadeOffer *)self subscribedOffer];
  [(ASCDescriber *)v3 addObject:v11 withName:@"subscribedOffer"];

  uint64_t v12 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v12;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSDictionary)titles
{
  return self->_titles;
}

- (NSDictionary)subtitles
{
  return self->_subtitles;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSNumber)ageRating
{
  return self->_ageRating;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (ASCOffer)notSubscribedOffer
{
  return self->_notSubscribedOffer;
}

- (ASCOffer)subscribedOffer
{
  return self->_subscribedOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedOffer, 0);
  objc_storeStrong((id *)&self->_notSubscribedOffer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end