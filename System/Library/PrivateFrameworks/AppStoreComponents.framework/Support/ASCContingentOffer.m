@interface ASCContingentOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCContingentOffer)initWithCoder:(id)a3;
- (ASCContingentOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 organicOffer:(id)a9 streamlinedOffer:(id)a10 offerID:(id)a11 iapItemID:(id)a12 iapItemName:(id)a13 iapProductName:(id)a14 offerType:(int64_t)a15;
- (ASCContingentOffer)offerWithMetrics:(id)a3;
- (ASCOffer)organicOffer;
- (ASCOffer)streamlinedOffer;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSNumber)iapItemID;
- (NSString)description;
- (NSString)iapItemName;
- (NSString)iapProductName;
- (NSString)offerID;
- (int64_t)flags;
- (int64_t)offerType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCContingentOffer

- (ASCContingentOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 organicOffer:(id)a9 streamlinedOffer:(id)a10 offerID:(id)a11 iapItemID:(id)a12 iapItemName:(id)a13 iapProductName:(id)a14 offerType:(int64_t)a15
{
  id v54 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v53 = a7;
  id v55 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v26 = v20;
  id v27 = a13;
  id v28 = a14;
  v56.receiver = self;
  v56.super_class = (Class)ASCContingentOffer;
  v29 = [(ASCContingentOffer *)&v56 init];
  if (v29)
  {
    v30 = (ASCAdamID *)[v54 copy];
    id = v29->_id;
    v29->_id = v30;

    v32 = (NSDictionary *)[v19 copy];
    titles = v29->_titles;
    v29->_titles = v32;

    v34 = (NSDictionary *)[v26 copy];
    subtitles = v29->_subtitles;
    v29->_subtitles = v34;

    v29->_flags = a6;
    objc_storeStrong((id *)&v29->_ageRating, v21);
    v36 = (NSArray *)[v55 copy];
    metrics = v29->_metrics;
    v29->_metrics = v36;

    v38 = (ASCOffer *)[v22 copyWithZone:0];
    organicOffer = v29->_organicOffer;
    v29->_organicOffer = v38;

    v40 = (ASCOffer *)[v23 copyWithZone:0];
    streamlinedOffer = v29->_streamlinedOffer;
    v29->_streamlinedOffer = v40;

    v42 = (NSString *)[v24 copy];
    offerID = v29->_offerID;
    v29->_offerID = v42;

    v44 = (NSNumber *)[v25 copy];
    iapItemID = v29->_iapItemID;
    v29->_iapItemID = v44;

    v46 = (NSString *)[v27 copy];
    iapItemName = v29->_iapItemName;
    v29->_iapItemName = v46;

    v48 = (NSString *)[v28 copy];
    iapProductName = v29->_iapProductName;
    v29->_iapProductName = v48;

    v29->_offerType = a15;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCContingentOffer)initWithCoder:(id)a3
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
          uint64_t v11 = sub_10001CDBC(v4, @"organicOffer");
          v12 = (void *)v11;
          if (v11)
          {
            v99 = (void *)v11;
            v97 = v9;
            v98 = sub_10001CDBC(v4, @"streamlinedOffer");
            v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerID"];
            if (v13)
            {
              v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iapItemID"];
              if (v14)
              {
                v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iapItemName"];
                if (v96)
                {
                  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iapProductName"];
                  if (v15)
                  {
                    uint64_t v94 = v15;
                    id v95 = [v4 decodeIntegerForKey:@"offerType"];
                    v16 = self;
                    v17 = (void *)v15;
                    v9 = v97;
                    v18 = [(ASCContingentOffer *)v16 initWithID:v5 titles:v6 subtitles:v7 flags:v8 ageRating:v97 metrics:v10 organicOffer:v99 streamlinedOffer:v98 offerID:v13 iapItemID:v14 iapItemName:v96 iapProductName:v94 offerType:v95];
                    id v19 = v17;
                    self = v18;
                    id v20 = v18;
                  }
                  else
                  {
                    BOOL v85 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                    v9 = v97;
                    if (v85) {
                      sub_10013E650(v85, v86, v87, v88, v89, v90, v91, v92);
                    }
                    id v20 = 0;
                    id v19 = 0;
                  }
                }
                else
                {
                  BOOL v77 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v77) {
                    sub_10013E614(v77, v78, v79, v80, v81, v82, v83, v84);
                  }
                  id v20 = 0;
                }
              }
              else
              {
                BOOL v69 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v69) {
                  sub_10013E5D8(v69, v70, v71, v72, v73, v74, v75, v76);
                }
                id v20 = 0;
              }
            }
            else
            {
              BOOL v61 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v61) {
                sub_10013E59C(v61, v62, v63, v64, v65, v66, v67, v68);
              }
              id v20 = 0;
            }

            v12 = v99;
          }
          else
          {
            BOOL v53 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v53) {
              sub_10013E560(v53, v54, v55, v56, v57, v58, v59, v60);
            }
            id v20 = 0;
          }
        }
        else
        {
          BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v45) {
            sub_10013E524(v45, v46, v47, v48, v49, v50, v51, v52);
          }
          id v20 = 0;
        }
      }
      else
      {
        BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v37) {
          sub_10013E4E8(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        id v20 = 0;
      }
    }
    else
    {
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v29) {
        sub_10013E4AC(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      id v20 = 0;
    }
  }
  else
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v21) {
      sub_10013E470(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = [(ASCContingentOffer *)self id];
  [v15 encodeObject:v4 forKey:@"id"];

  v5 = [(ASCContingentOffer *)self titles];
  [v15 encodeObject:v5 forKey:@"titles"];

  v6 = [(ASCContingentOffer *)self subtitles];
  [v15 encodeObject:v6 forKey:@"subtitles"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer flags](self, "flags"), @"flags");
  v7 = [(ASCContingentOffer *)self ageRating];
  [v15 encodeObject:v7 forKey:@"ageRating"];

  id v8 = [(ASCContingentOffer *)self metrics];
  [v15 encodeObject:v8 forKey:@"metrics"];

  v9 = [(ASCContingentOffer *)self organicOffer];
  [v15 encodeObject:v9 forKey:@"organicOffer"];

  v10 = [(ASCContingentOffer *)self streamlinedOffer];
  [v15 encodeObject:v10 forKey:@"streamlinedOffer"];

  uint64_t v11 = [(ASCContingentOffer *)self offerID];
  [v15 encodeObject:v11 forKey:@"offerID"];

  v12 = [(ASCContingentOffer *)self iapItemID];
  [v15 encodeObject:v12 forKey:@"iapItemID"];

  v13 = [(ASCContingentOffer *)self iapItemName];
  [v15 encodeObject:v13 forKey:@"iapItemName"];

  v14 = [(ASCContingentOffer *)self iapProductName];
  [v15 encodeObject:v14 forKey:@"iapProductName"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer offerType](self, "offerType"), @"offerType");
}

- (ASCContingentOffer)offerWithMetrics:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(ASCContingentOffer *)self id];
  v17 = [(ASCContingentOffer *)self titles];
  v16 = [(ASCContingentOffer *)self subtitles];
  id v14 = [(ASCContingentOffer *)self flags];
  v6 = [(ASCContingentOffer *)self ageRating];
  v13 = [(ASCContingentOffer *)self organicOffer];
  v7 = [(ASCContingentOffer *)self streamlinedOffer];
  id v8 = [(ASCContingentOffer *)self offerID];
  v9 = [(ASCContingentOffer *)self iapItemID];
  v10 = [(ASCContingentOffer *)self iapItemName];
  uint64_t v11 = [(ASCContingentOffer *)self iapProductName];
  id v15 = objc_msgSend(v4, "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemName:iapProductName:offerType:", v5, v17, v16, v14, v6, v18, v13, v7, v8, v9, v10, v11, -[ASCContingentOffer offerType](self, "offerType"));

  return (ASCContingentOffer *)v15;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCContingentOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCContingentOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCContingentOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCContingentOffer *)self flags]];
  v7 = [(ASCContingentOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  id v8 = [(ASCContingentOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  v9 = [(ASCContingentOffer *)self organicOffer];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCContingentOffer *)self streamlinedOffer];
  [(ASCHasher *)v3 combineObject:v10];

  uint64_t v11 = [(ASCContingentOffer *)self offerID];
  [(ASCHasher *)v3 combineObject:v11];

  v12 = [(ASCContingentOffer *)self iapItemID];
  [(ASCHasher *)v3 combineObject:v12];

  v13 = [(ASCContingentOffer *)self iapItemName];
  [(ASCHasher *)v3 combineObject:v13];

  id v14 = [(ASCContingentOffer *)self iapProductName];
  [(ASCHasher *)v3 combineObject:v14];

  [(ASCHasher *)v3 combineInteger:[(ASCContingentOffer *)self offerType]];
  unint64_t v15 = [(ASCHasher *)v3 finalizeHash];

  return v15;
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
    id v8 = [(ASCContingentOffer *)self id];
    uint64_t v9 = [v7 id];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        uint64_t v11 = [(ASCContingentOffer *)self titles];
        uint64_t v12 = [v7 titles];
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            id v14 = [(ASCContingentOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_49;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_49;
            }
            id v18 = [(ASCContingentOffer *)self flags];
            if (v18 == [v7 flags])
            {
              id v19 = [(ASCContingentOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              BOOL v21 = (void *)v20;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                uint64_t v66 = v16;
                uint64_t v23 = v19;
                uint64_t v24 = v21;
                unsigned int v25 = [v22 isEqual:v21];
                BOOL v21 = v24;
                id v19 = v23;
                v16 = v66;
                if (v25)
                {
LABEL_27:
                  uint64_t v64 = v21;
                  uint64_t v65 = v19;
                  uint64_t v26 = [(ASCContingentOffer *)self metrics];
                  uint64_t v27 = [v7 metrics];
                  uint64_t v28 = (void *)v27;
                  uint64_t v68 = (void *)v26;
                  if (v26 && v27)
                  {
                    BOOL v29 = (void *)v27;
                    unsigned int v30 = [v68 isEqual:v27];
                    uint64_t v28 = v29;
                    if (v30)
                    {
LABEL_30:
                      uint64_t v62 = v28;
                      uint64_t v31 = [(ASCContingentOffer *)self organicOffer];
                      uint64_t v32 = [v7 organicOffer];
                      uint64_t v33 = (void *)v32;
                      uint64_t v63 = (void *)v31;
                      if (v31 && v32)
                      {
                        uint64_t v34 = (void *)v32;
                        unsigned int v35 = [v63 isEqual:v32];
                        uint64_t v33 = v34;
                        if (v35)
                        {
LABEL_33:
                          uint64_t v60 = v33;
                          uint64_t v36 = [(ASCContingentOffer *)self streamlinedOffer];
                          uint64_t v37 = [v7 streamlinedOffer];
                          uint64_t v38 = (void *)v37;
                          BOOL v61 = (void *)v36;
                          if (v36 && v37)
                          {
                            uint64_t v39 = (void *)v37;
                            unsigned int v40 = [v61 isEqual:v37];
                            uint64_t v38 = v39;
                            if (v40)
                            {
LABEL_36:
                              uint64_t v58 = v38;
                              uint64_t v41 = [(ASCContingentOffer *)self offerID];
                              uint64_t v42 = [v7 offerID];
                              uint64_t v59 = v41;
                              uint64_t v57 = (void *)v42;
                              if (v41 && v42)
                              {
                                if ([v41 isEqual:v42])
                                {
LABEL_39:
                                  uint64_t v43 = [(ASCContingentOffer *)self iapItemID];
                                  uint64_t v44 = [v7 iapItemID];
                                  uint64_t v55 = (void *)v44;
                                  uint64_t v56 = v43;
                                  if (v43 && v44)
                                  {
                                    if ([v43 isEqual:v44])
                                    {
LABEL_42:
                                      uint64_t v45 = [(ASCContingentOffer *)self iapItemName];
                                      uint64_t v46 = [v7 iapItemName];
                                      uint64_t v54 = (void *)v45;
                                      if (v45 && v46)
                                      {
                                        uint64_t v47 = (void *)v46;
                                        if ([v54 isEqual:v46])
                                        {
LABEL_45:
                                          uint64_t v67 = v16;
                                          uint64_t v48 = [(ASCContingentOffer *)self iapProductName];
                                          uint64_t v49 = [v7 iapProductName];
                                          BOOL v53 = (void *)v48;
                                          if (v48 && v49)
                                          {
                                            uint64_t v50 = (void *)v49;
                                            if ([v53 isEqual:v49])
                                            {
LABEL_48:
                                              id v51 = [(ASCContingentOffer *)self offerType];
                                              BOOL v17 = v51 == [v7 offerType];
LABEL_66:

                                              v16 = v67;
                                              goto LABEL_67;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v50 = (void *)v49;
                                            if (v53 == (void *)v49) {
                                              goto LABEL_48;
                                            }
                                          }
                                          BOOL v17 = 0;
                                          goto LABEL_66;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v47 = (void *)v46;
                                        if (v54 == (void *)v46) {
                                          goto LABEL_45;
                                        }
                                      }
                                      BOOL v17 = 0;
LABEL_67:

                                      goto LABEL_68;
                                    }
                                  }
                                  else if (v43 == (void *)v44)
                                  {
                                    goto LABEL_42;
                                  }
                                  BOOL v17 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }
                              else if (v41 == (void *)v42)
                              {
                                goto LABEL_39;
                              }
                              BOOL v17 = 0;
LABEL_69:

                              uint64_t v38 = v58;
                              goto LABEL_70;
                            }
                          }
                          else if (v36 == v37)
                          {
                            goto LABEL_36;
                          }
                          BOOL v17 = 0;
LABEL_70:

                          uint64_t v33 = v60;
                          goto LABEL_71;
                        }
                      }
                      else if (v31 == v32)
                      {
                        goto LABEL_33;
                      }
                      BOOL v17 = 0;
LABEL_71:

                      uint64_t v28 = v62;
                      goto LABEL_72;
                    }
                  }
                  else if (v26 == v27)
                  {
                    goto LABEL_30;
                  }
                  BOOL v17 = 0;
LABEL_72:

                  BOOL v21 = v64;
                  id v19 = v65;
                  goto LABEL_73;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              BOOL v17 = 0;
LABEL_73:

              goto LABEL_74;
            }
LABEL_49:
            BOOL v17 = 0;
LABEL_74:

            goto LABEL_75;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        BOOL v17 = 0;
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    BOOL v17 = 0;
LABEL_76:

    goto LABEL_77;
  }
  BOOL v17 = 0;
LABEL_77:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCContingentOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCContingentOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCContingentOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription((__int16)[(ASCContingentOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  id v8 = [(ASCContingentOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCContingentOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  v10 = [(ASCContingentOffer *)self organicOffer];
  [(ASCDescriber *)v3 addObject:v10 withName:@"organicOffer"];

  uint64_t v11 = [(ASCContingentOffer *)self streamlinedOffer];
  [(ASCDescriber *)v3 addObject:v11 withName:@"streamlinedOffer"];

  uint64_t v12 = [(ASCContingentOffer *)self offerID];
  [(ASCDescriber *)v3 addObject:v12 withName:@"offerID"];

  v13 = [(ASCContingentOffer *)self iapItemID];
  [(ASCDescriber *)v3 addObject:v13 withName:@"iapItemID"];

  id v14 = [(ASCContingentOffer *)self iapItemName];
  [(ASCDescriber *)v3 addObject:v14 withName:@"iapItemName"];

  uint64_t v15 = [(ASCContingentOffer *)self iapProductName];
  [(ASCDescriber *)v3 addObject:v15 withName:@"iapProductName"];

  [(ASCDescriber *)v3 addInteger:[(ASCContingentOffer *)self offerType] withName:@"offerType"];
  v16 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v16;
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

- (ASCOffer)organicOffer
{
  return self->_organicOffer;
}

- (ASCOffer)streamlinedOffer
{
  return self->_streamlinedOffer;
}

- (NSString)offerID
{
  return self->_offerID;
}

- (NSNumber)iapItemID
{
  return self->_iapItemID;
}

- (NSString)iapItemName
{
  return self->_iapItemName;
}

- (NSString)iapProductName
{
  return self->_iapProductName;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iapProductName, 0);
  objc_storeStrong((id *)&self->_iapItemName, 0);
  objc_storeStrong((id *)&self->_iapItemID, 0);
  objc_storeStrong((id *)&self->_offerID, 0);
  objc_storeStrong((id *)&self->_streamlinedOffer, 0);
  objc_storeStrong((id *)&self->_organicOffer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end