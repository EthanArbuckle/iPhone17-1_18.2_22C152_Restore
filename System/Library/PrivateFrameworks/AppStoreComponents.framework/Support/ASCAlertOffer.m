@interface ASCAlertOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCAlertOffer)initWithCoder:(id)a3;
- (ASCAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertButtonOffer:(id)a11 alertButtonTitle:(id)a12;
- (ASCAlertOffer)offerWithMetrics:(id)a3;
- (ASCOffer)alertButtonOffer;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)alertButtonTitle;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)description;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAlertOffer

- (ASCAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertButtonOffer:(id)a11 alertButtonTitle:(id)a12
{
  id v44 = a3;
  id v18 = a4;
  id v19 = a5;
  id v43 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)ASCAlertOffer;
  v25 = [(ASCAlertOffer *)&v45 init];
  if (v25)
  {
    v26 = (ASCAdamID *)objc_msgSend(v44, "copy", v43);
    id = v25->_id;
    v25->_id = v26;

    v28 = (NSDictionary *)[v18 copy];
    titles = v25->_titles;
    v25->_titles = v28;

    v30 = (NSDictionary *)[v19 copy];
    subtitles = v25->_subtitles;
    v25->_subtitles = v30;

    v25->_flags = a6;
    objc_storeStrong((id *)&v25->_ageRating, a7);
    v32 = (NSArray *)[v20 copy];
    metrics = v25->_metrics;
    v25->_metrics = v32;

    v34 = (NSString *)[v21 copy];
    alertTitle = v25->_alertTitle;
    v25->_alertTitle = v34;

    v36 = (NSString *)[v22 copy];
    alertMessage = v25->_alertMessage;
    v25->_alertMessage = v36;

    v38 = (ASCOffer *)[v23 copyWithZone:0];
    alertButtonOffer = v25->_alertButtonOffer;
    v25->_alertButtonOffer = v38;

    v40 = (NSString *)[v24 copy];
    alertButtonTitle = v25->_alertButtonTitle;
    v25->_alertButtonTitle = v40;
  }
  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAlertOffer)initWithCoder:(id)a3
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
          v49 = v9;
          v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertTitle"];
          v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertMessage"];
          v11 = sub_10001CDBC(v4, @"alertButtonOffer");
          v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertButtonTitle"];
          self = [(ASCAlertOffer *)self initWithID:v5 titles:v6 subtitles:v7 flags:v8 ageRating:v49 metrics:v10 alertTitle:v48 alertMessage:v47 alertButtonOffer:v11 alertButtonTitle:v12];

          v9 = v49;
          v13 = self;
        }
        else
        {
          BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v38) {
            sub_10013DD2C(v38, v39, v40, v41, v42, v43, v44, v45);
          }
          v13 = 0;
        }
      }
      else
      {
        BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v30) {
          sub_10013DCF0(v30, v31, v32, v33, v34, v35, v36, v37);
        }
        v13 = 0;
      }
    }
    else
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_10013DCB4(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v13 = 0;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_10013DC78(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCAlertOffer *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCAlertOffer *)self titles];
  [v4 encodeObject:v6 forKey:@"titles"];

  v7 = [(ASCAlertOffer *)self subtitles];
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAlertOffer flags](self, "flags"), @"flags");
  id v8 = [(ASCAlertOffer *)self ageRating];
  [v4 encodeObject:v8 forKey:@"ageRating"];

  v9 = [(ASCAlertOffer *)self metrics];
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = [(ASCAlertOffer *)self alertTitle];
  [v4 encodeObject:v10 forKey:@"alertTitle"];

  v11 = [(ASCAlertOffer *)self alertMessage];
  [v4 encodeObject:v11 forKey:@"alertMessage"];

  v12 = [(ASCAlertOffer *)self alertButtonOffer];
  [v4 encodeObject:v12 forKey:@"alertButtonOffer"];

  id v13 = [(ASCAlertOffer *)self alertButtonTitle];
  [v4 encodeObject:v13 forKey:@"alertButtonTitle"];
}

- (ASCAlertOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  uint64_t v15 = [(ASCAlertOffer *)self id];
  v5 = [(ASCAlertOffer *)self titles];
  v6 = [(ASCAlertOffer *)self subtitles];
  int64_t v7 = [(ASCAlertOffer *)self flags];
  id v8 = [(ASCAlertOffer *)self ageRating];
  v9 = [(ASCAlertOffer *)self alertTitle];
  v10 = [(ASCAlertOffer *)self alertMessage];
  v11 = [(ASCAlertOffer *)self alertButtonOffer];
  v12 = [(ASCAlertOffer *)self alertButtonTitle];
  id v13 = [v16 initWithID:v15 titles:v5 subtitles:v6 flags:v7 ageRating:v8 metrics:v4 alertTitle:v9 alertMessage:v10 alertButtonOffer:v11 alertButtonTitle:v12];

  return (ASCAlertOffer *)v13;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCAlertOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCAlertOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCAlertOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCAlertOffer *)self flags]];
  int64_t v7 = [(ASCAlertOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  id v8 = [(ASCAlertOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  v9 = [(ASCAlertOffer *)self alertTitle];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCAlertOffer *)self alertMessage];
  [(ASCHasher *)v3 combineObject:v10];

  v11 = [(ASCAlertOffer *)self alertButtonOffer];
  [(ASCHasher *)v3 combineObject:v11];

  v12 = [(ASCAlertOffer *)self alertButtonTitle];
  [(ASCHasher *)v3 combineObject:v12];

  unint64_t v13 = [(ASCHasher *)v3 finalizeHash];
  return v13;
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
    id v8 = [(ASCAlertOffer *)self id];
    uint64_t v9 = [v7 id];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        v11 = [(ASCAlertOffer *)self titles];
        uint64_t v12 = [v7 titles];
        unint64_t v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            BOOL v14 = [(ASCAlertOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            id v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_42;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_42;
            }
            id v18 = [(ASCAlertOffer *)self flags];
            if (v18 == [v7 flags])
            {
              uint64_t v19 = [(ASCAlertOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              uint64_t v21 = (void *)v20;
              v58 = v19;
              if (v19 && v20)
              {
                BOOL v22 = v19;
                uint64_t v23 = v21;
                unsigned int v24 = [v22 isEqual:v21];
                uint64_t v21 = v23;
                uint64_t v19 = v58;
                if (v24)
                {
LABEL_27:
                  v56 = v21;
                  uint64_t v25 = [(ASCAlertOffer *)self metrics];
                  uint64_t v26 = [v7 metrics];
                  uint64_t v27 = (void *)v26;
                  v57 = (void *)v25;
                  if (v25 && v26)
                  {
                    uint64_t v28 = (void *)v26;
                    unsigned int v29 = [v57 isEqual:v26];
                    uint64_t v27 = v28;
                    if (v29)
                    {
LABEL_30:
                      v54 = v27;
                      uint64_t v30 = [(ASCAlertOffer *)self alertTitle];
                      uint64_t v31 = [v7 alertTitle];
                      uint64_t v32 = (void *)v31;
                      v55 = (void *)v30;
                      if (v30 && v31)
                      {
                        uint64_t v33 = (void *)v31;
                        unsigned int v34 = [v55 isEqual:v31];
                        uint64_t v32 = v33;
                        if (v34)
                        {
LABEL_33:
                          v52 = v32;
                          uint64_t v35 = [(ASCAlertOffer *)self alertMessage];
                          uint64_t v36 = [v7 alertMessage];
                          uint64_t v37 = (void *)v36;
                          v53 = (void *)v35;
                          if (v35 && v36)
                          {
                            BOOL v38 = (void *)v36;
                            unsigned int v39 = [v53 isEqual:v36];
                            uint64_t v37 = v38;
                            if (v39)
                            {
LABEL_36:
                              v50 = v37;
                              uint64_t v40 = [(ASCAlertOffer *)self alertButtonOffer];
                              uint64_t v41 = [v7 alertButtonOffer];
                              v51 = v40;
                              v49 = (void *)v41;
                              if (v40 && v41)
                              {
                                if ([v40 isEqual:v41]) {
                                  goto LABEL_39;
                                }
                              }
                              else if (v40 == (void *)v41)
                              {
LABEL_39:
                                uint64_t v42 = [(ASCAlertOffer *)self alertButtonTitle];
                                uint64_t v43 = [v7 alertButtonTitle];
                                uint64_t v44 = (void *)v43;
                                if (v42 && v43)
                                {
                                  uint64_t v45 = (void *)v43;
                                  unsigned __int8 v46 = [v42 isEqual:v43];
                                  uint64_t v44 = v45;
                                  v47 = v42;
                                  BOOL v17 = v46;
                                }
                                else
                                {
                                  v47 = v42;
                                  BOOL v17 = v42 == (void *)v43;
                                }

                                goto LABEL_55;
                              }
                              BOOL v17 = 0;
LABEL_55:

                              uint64_t v37 = v50;
                              goto LABEL_56;
                            }
                          }
                          else if (v35 == v36)
                          {
                            goto LABEL_36;
                          }
                          BOOL v17 = 0;
LABEL_56:

                          uint64_t v32 = v52;
                          goto LABEL_57;
                        }
                      }
                      else if (v30 == v31)
                      {
                        goto LABEL_33;
                      }
                      BOOL v17 = 0;
LABEL_57:

                      uint64_t v27 = v54;
                      goto LABEL_58;
                    }
                  }
                  else if (v25 == v26)
                  {
                    goto LABEL_30;
                  }
                  BOOL v17 = 0;
LABEL_58:

                  uint64_t v21 = v56;
                  uint64_t v19 = v58;
                  goto LABEL_59;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              BOOL v17 = 0;
LABEL_59:

              goto LABEL_60;
            }
LABEL_42:
            BOOL v17 = 0;
LABEL_60:

            goto LABEL_61;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        BOOL v17 = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    BOOL v17 = 0;
LABEL_62:

    goto LABEL_63;
  }
  BOOL v17 = 0;
LABEL_63:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCAlertOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCAlertOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCAlertOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription((__int16)[(ASCAlertOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  id v8 = [(ASCAlertOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCAlertOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  v10 = [(ASCAlertOffer *)self alertTitle];
  [(ASCDescriber *)v3 addObject:v10 withName:@"alertTitle"];

  v11 = [(ASCAlertOffer *)self alertMessage];
  [(ASCDescriber *)v3 addObject:v11 withName:@"alertMessage"];

  uint64_t v12 = [(ASCAlertOffer *)self alertButtonOffer];
  [(ASCDescriber *)v3 addObject:v12 withName:@"alertButtonOffer"];

  unint64_t v13 = [(ASCAlertOffer *)self alertButtonTitle];
  [(ASCDescriber *)v3 addObject:v13 withName:@"alertButtonTitle"];

  BOOL v14 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v14;
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

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (ASCOffer)alertButtonOffer
{
  return self->_alertButtonOffer;
}

- (NSString)alertButtonTitle
{
  return self->_alertButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertButtonOffer, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end