@interface ASCStatefulOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCOffer)buyOffer;
- (ASCOffer)defaultOffer;
- (ASCOffer)openOffer;
- (ASCStatefulOffer)initWithCoder:(id)a3;
- (ASCStatefulOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 defaultOffer:(id)a9 buyOffer:(id)a10 openOffer:(id)a11;
- (ASCStatefulOffer)offerWithMetrics:(id)a3;
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

@implementation ASCStatefulOffer

- (ASCStatefulOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 defaultOffer:(id)a9 buyOffer:(id)a10 openOffer:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v38 = a7;
  id v37 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v39.receiver = self;
  v39.super_class = (Class)ASCStatefulOffer;
  v23 = [(ASCStatefulOffer *)&v39 init];
  if (v23)
  {
    v24 = (ASCAdamID *)objc_msgSend(v17, "copy", v37, v38);
    id = v23->_id;
    v23->_id = v24;

    v26 = (NSDictionary *)[v18 copy];
    titles = v23->_titles;
    v23->_titles = v26;

    v28 = (NSDictionary *)[v19 copy];
    subtitles = v23->_subtitles;
    v23->_subtitles = v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    objc_storeStrong((id *)&v23->_metrics, a8);
    v30 = (ASCOffer *)[v20 copyWithZone:0];
    defaultOffer = v23->_defaultOffer;
    v23->_defaultOffer = v30;

    v32 = (ASCOffer *)[v21 copyWithZone:0];
    buyOffer = v23->_buyOffer;
    v23->_buyOffer = v32;

    v34 = (ASCOffer *)[v22 copyWithZone:0];
    openOffer = v23->_openOffer;
    v23->_openOffer = v34;
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCStatefulOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  if (v5)
  {
    v6 = sub_10001CBAC(v4, @"titles");
    if (v6)
    {
      v7 = sub_10001CBAC(v4, @"subtitles");
      if (v7)
      {
        id v8 = [v4 decodeIntegerForKey:@"flags"];
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageRating"];
        v10 = sub_10001B9B4(v4, @"metrics");
        if (v10)
        {
          v11 = sub_10001CDBC(v4, @"defaultOffer");
          if (v11)
          {
            v12 = sub_10001CDBC(v4, @"buyOffer");
            uint64_t v13 = sub_10001CDBC(v4, @"openOffer");
            id v14 = v8;
            v15 = v9;
            v16 = (void *)v13;
            self = [(ASCStatefulOffer *)self initWithID:v5 titles:v6 subtitles:v7 flags:v14 ageRating:v15 metrics:v10 defaultOffer:v11 buyOffer:v12 openOffer:v13];

            v9 = v15;
            id v17 = self;
          }
          else
          {
            BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v50) {
              sub_10013F390(v50, v51, v52, v53, v54, v55, v56, v57);
            }
            id v17 = 0;
          }
        }
        else
        {
          BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v42) {
            sub_10013F354(v42, v43, v44, v45, v46, v47, v48, v49);
          }
          id v17 = 0;
        }
      }
      else
      {
        BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v34) {
          sub_10013F318(v34, v35, v36, v37, v38, v39, v40, v41);
        }
        id v17 = 0;
      }
    }
    else
    {
      BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v26) {
        sub_10013F2DC(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      id v17 = 0;
    }
  }
  else
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v18) {
      sub_10013F2A0(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    id v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCStatefulOffer *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCStatefulOffer *)self titles];
  [v4 encodeObject:v6 forKey:@"titles"];

  v7 = [(ASCStatefulOffer *)self subtitles];
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCStatefulOffer flags](self, "flags"), @"flags");
  id v8 = [(ASCStatefulOffer *)self ageRating];
  [v4 encodeObject:v8 forKey:@"ageRating"];

  v9 = [(ASCStatefulOffer *)self metrics];
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = [(ASCStatefulOffer *)self defaultOffer];
  [v4 encodeObject:v10 forKey:@"defaultOffer"];

  v11 = [(ASCStatefulOffer *)self buyOffer];
  [v4 encodeObject:v11 forKey:@"buyOffer"];

  id v12 = [(ASCStatefulOffer *)self openOffer];
  [v4 encodeObject:v12 forKey:@"openOffer"];
}

- (ASCStatefulOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCStatefulOffer *)self id];
  v7 = [(ASCStatefulOffer *)self titles];
  id v8 = [(ASCStatefulOffer *)self subtitles];
  int64_t v9 = [(ASCStatefulOffer *)self flags];
  v10 = [(ASCStatefulOffer *)self ageRating];
  v11 = [(ASCStatefulOffer *)self defaultOffer];
  id v12 = [(ASCStatefulOffer *)self buyOffer];
  uint64_t v13 = [(ASCStatefulOffer *)self openOffer];
  id v14 = [v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 defaultOffer:v11 buyOffer:v12 openOffer:v13];

  return (ASCStatefulOffer *)v14;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCStatefulOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCStatefulOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCStatefulOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCStatefulOffer *)self flags]];
  v7 = [(ASCStatefulOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  id v8 = [(ASCStatefulOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  int64_t v9 = [(ASCStatefulOffer *)self defaultOffer];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCStatefulOffer *)self buyOffer];
  [(ASCHasher *)v3 combineObject:v10];

  v11 = [(ASCStatefulOffer *)self openOffer];
  [(ASCHasher *)v3 combineObject:v11];

  unint64_t v12 = [(ASCHasher *)v3 finalizeHash];
  return v12;
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
    id v8 = [(ASCStatefulOffer *)self id];
    uint64_t v9 = [v7 id];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        v11 = [(ASCStatefulOffer *)self titles];
        uint64_t v12 = [v7 titles];
        uint64_t v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            id v14 = [(ASCStatefulOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_39;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_39;
            }
            id v18 = [(ASCStatefulOffer *)self flags];
            if (v18 == [v7 flags])
            {
              uint64_t v19 = [(ASCStatefulOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              uint64_t v21 = (void *)v20;
              uint64_t v54 = v19;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                uint64_t v23 = v21;
                unsigned int v24 = [v22 isEqual:v21];
                uint64_t v21 = v23;
                uint64_t v19 = v54;
                if (v24)
                {
LABEL_27:
                  uint64_t v52 = v21;
                  uint64_t v25 = [(ASCStatefulOffer *)self metrics];
                  uint64_t v26 = [v7 metrics];
                  uint64_t v27 = (void *)v26;
                  uint64_t v53 = (void *)v25;
                  if (v25 && v26)
                  {
                    uint64_t v28 = (void *)v26;
                    unsigned int v29 = [v53 isEqual:v26];
                    uint64_t v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      BOOL v50 = v27;
                      uint64_t v30 = [(ASCStatefulOffer *)self defaultOffer];
                      uint64_t v31 = [v7 defaultOffer];
                      uint64_t v32 = (void *)v31;
                      uint64_t v51 = (void *)v30;
                      if (v30 && v31)
                      {
                        uint64_t v33 = (void *)v31;
                        unsigned int v34 = [v51 isEqual:v31];
                        uint64_t v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          uint64_t v48 = v32;
                          uint64_t v35 = [(ASCStatefulOffer *)self buyOffer];
                          uint64_t v36 = [v7 buyOffer];
                          uint64_t v37 = (void *)v36;
                          uint64_t v49 = (void *)v35;
                          if (v35 && v36)
                          {
                            uint64_t v38 = (void *)v36;
                            unsigned int v39 = [v49 isEqual:v36];
                            uint64_t v37 = v38;
                            if (v39) {
                              goto LABEL_36;
                            }
                          }
                          else if (v35 == v36)
                          {
LABEL_36:
                            uint64_t v40 = [(ASCStatefulOffer *)self openOffer];
                            uint64_t v41 = [v7 openOffer];
                            BOOL v42 = (void *)v41;
                            if (v40 && v41)
                            {
                              uint64_t v43 = (void *)v41;
                              unsigned __int8 v44 = [v40 isEqual:v41];
                              BOOL v42 = v43;
                              uint64_t v45 = v40;
                              BOOL v17 = v44;
                            }
                            else
                            {
                              uint64_t v45 = v40;
                              BOOL v17 = v40 == (void *)v41;
                            }

                            uint64_t v37 = v47;
                            goto LABEL_50;
                          }
                          BOOL v17 = 0;
LABEL_50:

                          uint64_t v32 = v48;
                          goto LABEL_51;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      BOOL v17 = 0;
LABEL_51:

                      uint64_t v27 = v50;
                      goto LABEL_52;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  BOOL v17 = 0;
LABEL_52:

                  uint64_t v21 = v52;
                  uint64_t v19 = v54;
                  goto LABEL_53;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              BOOL v17 = 0;
LABEL_53:

              goto LABEL_54;
            }
LABEL_39:
            BOOL v17 = 0;
LABEL_54:

            goto LABEL_55;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        BOOL v17 = 0;
LABEL_55:

        goto LABEL_56;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    BOOL v17 = 0;
LABEL_56:

    goto LABEL_57;
  }
  BOOL v17 = 0;
LABEL_57:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCStatefulOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCStatefulOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCStatefulOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription((__int16)[(ASCStatefulOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  id v8 = [(ASCStatefulOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCStatefulOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  v10 = [(ASCStatefulOffer *)self defaultOffer];
  [(ASCDescriber *)v3 addObject:v10 withName:@"defaultOffer"];

  v11 = [(ASCStatefulOffer *)self buyOffer];
  [(ASCDescriber *)v3 addObject:v11 withName:@"buyOffer"];

  uint64_t v12 = [(ASCStatefulOffer *)self openOffer];
  [(ASCDescriber *)v3 addObject:v12 withName:@"openOffer"];

  uint64_t v13 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v13;
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

- (ASCOffer)defaultOffer
{
  return self->_defaultOffer;
}

- (ASCOffer)buyOffer
{
  return self->_buyOffer;
}

- (ASCOffer)openOffer
{
  return self->_openOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openOffer, 0);
  objc_storeStrong((id *)&self->_buyOffer, 0);
  objc_storeStrong((id *)&self->_defaultOffer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end