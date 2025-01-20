@interface ASCURLOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCURLOffer)initWithCoder:(id)a3;
- (ASCURLOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 url:(id)a9 isSensitive:(BOOL)a10;
- (ASCURLOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSensitive;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)description;
- (NSURL)url;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCURLOffer

- (ASCURLOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 url:(id)a9 isSensitive:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ASCURLOffer;
  v22 = [(ASCURLOffer *)&v34 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    id = v22->_id;
    v22->_id = (ASCAdamID *)v23;

    uint64_t v25 = [v17 copy];
    titles = v22->_titles;
    v22->_titles = (NSDictionary *)v25;

    uint64_t v27 = [v18 copy];
    subtitles = v22->_subtitles;
    v22->_subtitles = (NSDictionary *)v27;

    v22->_flags = a6;
    objc_storeStrong((id *)&v22->_ageRating, a7);
    uint64_t v29 = [v20 copy];
    metrics = v22->_metrics;
    v22->_metrics = (NSArray *)v29;

    uint64_t v31 = [v21 copy];
    url = v22->_url;
    v22->_url = (NSURL *)v31;

    v22->_isSensitive = a10;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCURLOffer)initWithCoder:(id)a3
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
          v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
          if (v11)
          {
            LOBYTE(v54) = [v4 decodeBoolForKey:@"isSensitive"];
            self = [(ASCURLOffer *)self initWithID:v5 titles:v6 subtitles:v7 flags:v8 ageRating:v9 metrics:v10 url:v11 isSensitive:v54];
            v12 = self;
          }
          else
          {
            BOOL v45 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v45) {
              -[ASCURLOffer initWithCoder:].cold.5(v45, v46, v47, v48, v49, v50, v51, v52);
            }
            v12 = 0;
          }
        }
        else
        {
          BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v37) {
            -[ASCURLOffer initWithCoder:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);
          }
          v12 = 0;
        }
      }
      else
      {
        BOOL v29 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v29) {
          -[ASCURLOffer initWithCoder:](v29, v30, v31, v32, v33, v34, v35, v36);
        }
        v12 = 0;
      }
    }
    else
    {
      BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v21) {
        -[ASCURLOffer initWithCoder:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
      v12 = 0;
    }
  }
  else
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v13) {
      -[ASCURLOffer initWithCoder:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ASCURLOffer *)self id];
  [v10 encodeObject:v4 forKey:@"id"];

  v5 = [(ASCURLOffer *)self titles];
  [v10 encodeObject:v5 forKey:@"titles"];

  v6 = [(ASCURLOffer *)self subtitles];
  [v10 encodeObject:v6 forKey:@"subtitles"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[ASCURLOffer flags](self, "flags"), @"flags");
  v7 = [(ASCURLOffer *)self ageRating];
  [v10 encodeObject:v7 forKey:@"ageRating"];

  uint64_t v8 = [(ASCURLOffer *)self metrics];
  [v10 encodeObject:v8 forKey:@"metrics"];

  v9 = [(ASCURLOffer *)self url];
  [v10 encodeObject:v9 forKey:@"url"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ASCURLOffer isSensitive](self, "isSensitive"), @"isSensitive");
}

- (ASCURLOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCURLOffer *)self id];
  v7 = [(ASCURLOffer *)self titles];
  uint64_t v8 = [(ASCURLOffer *)self subtitles];
  int64_t v9 = [(ASCURLOffer *)self flags];
  id v10 = [(ASCURLOffer *)self ageRating];
  v11 = [(ASCURLOffer *)self url];
  LOBYTE(v14) = [(ASCURLOffer *)self isSensitive];
  v12 = (void *)[v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 url:v11 isSensitive:v14];

  return (ASCURLOffer *)v12;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCURLOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCURLOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCURLOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCURLOffer *)self flags]];
  v7 = [(ASCURLOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  uint64_t v8 = [(ASCURLOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  int64_t v9 = [(ASCURLOffer *)self url];
  [(ASCHasher *)v3 combineObject:v9];

  [(ASCHasher *)v3 combineBool:[(ASCURLOffer *)self isSensitive]];
  unint64_t v10 = [(ASCHasher *)v3 finalizeHash];

  return v10;
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
    uint64_t v8 = [(ASCURLOffer *)self id];
    uint64_t v9 = [v7 id];
    unint64_t v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        v11 = [(ASCURLOffer *)self titles];
        uint64_t v12 = [v7 titles];
        BOOL v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            uint64_t v14 = [(ASCURLOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            uint64_t v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_34;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_34;
            }
            int64_t v18 = [(ASCURLOffer *)self flags];
            if (v18 == [v7 flags])
            {
              uint64_t v19 = [(ASCURLOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              BOOL v21 = (void *)v20;
              uint64_t v43 = v19;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                uint64_t v23 = v21;
                int v24 = [v22 isEqual:v21];
                BOOL v21 = v23;
                uint64_t v19 = v43;
                if (v24)
                {
LABEL_27:
                  uint64_t v41 = v21;
                  uint64_t v25 = [(ASCURLOffer *)self metrics];
                  uint64_t v26 = [v7 metrics];
                  uint64_t v27 = (void *)v26;
                  uint64_t v42 = (void *)v25;
                  if (v25 && v26)
                  {
                    uint64_t v28 = (void *)v26;
                    int v29 = [v42 isEqual:v26];
                    uint64_t v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      uint64_t v39 = v27;
                      uint64_t v30 = [(ASCURLOffer *)self url];
                      uint64_t v31 = [v7 url];
                      uint64_t v32 = (void *)v31;
                      uint64_t v40 = (void *)v30;
                      if (v30 && v31)
                      {
                        uint64_t v33 = (void *)v31;
                        int v34 = [v40 isEqual:v31];
                        uint64_t v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          uint64_t v35 = v32;
                          BOOL v36 = [(ASCURLOffer *)self isSensitive];
                          char v37 = [v7 isSensitive];
                          uint64_t v32 = v35;
                          char v17 = v36 ^ v37 ^ 1;
LABEL_41:

                          uint64_t v27 = v39;
                          goto LABEL_42;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      char v17 = 0;
                      goto LABEL_41;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  char v17 = 0;
LABEL_42:

                  BOOL v21 = v41;
                  uint64_t v19 = v43;
                  goto LABEL_43;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              char v17 = 0;
LABEL_43:

              goto LABEL_44;
            }
LABEL_34:
            char v17 = 0;
LABEL_44:

            goto LABEL_45;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        char v17 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    char v17 = 0;
LABEL_46:

    goto LABEL_47;
  }
  char v17 = 0;
LABEL_47:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCURLOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCURLOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCURLOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription([(ASCURLOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  uint64_t v8 = [(ASCURLOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCURLOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  unint64_t v10 = [(ASCURLOffer *)self url];
  [(ASCDescriber *)v3 addSensitiveObject:v10 withName:@"url"];

  [(ASCDescriber *)v3 addBool:[(ASCURLOffer *)self isSensitive] withName:@"isSensitive"];
  v11 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v11;
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

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
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

@end