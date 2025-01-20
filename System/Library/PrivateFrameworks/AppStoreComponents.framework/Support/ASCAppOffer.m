@interface ASCAppOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCAppOffer)initWithCoder:(id)a3;
- (ASCAppOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 baseBuyParams:(id)a9 metricsBuyParams:(id)a10 additionalHeaders:(id)a11 preflightPackageURL:(id)a12 bundleID:(id)a13 itemName:(id)a14 vendorName:(id)a15 capabilities:(id)a16;
- (ASCAppOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)capabilities;
- (NSArray)metrics;
- (NSDictionary)additionalHeaders;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)baseBuyParams;
- (NSString)bundleID;
- (NSString)description;
- (NSString)itemName;
- (NSString)metricsBuyParams;
- (NSString)vendorName;
- (NSURL)preflightPackageURL;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAppOffer

- (ASCAppOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 baseBuyParams:(id)a9 metricsBuyParams:(id)a10 additionalHeaders:(id)a11 preflightPackageURL:(id)a12 bundleID:(id)a13 itemName:(id)a14 vendorName:(id)a15 capabilities:(id)a16
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v58 = a7;
  id v60 = a7;
  id v23 = a8;
  v24 = v21;
  id v63 = a9;
  id v62 = a10;
  v25 = v22;
  id v61 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  v64.receiver = self;
  v64.super_class = (Class)ASCAppOffer;
  v31 = [(ASCAppOffer *)&v64 init];
  if (v31)
  {
    v32 = (ASCAdamID *)[v20 copy];
    id = v31->_id;
    v31->_id = v32;

    v34 = (NSDictionary *)[v24 copy];
    titles = v31->_titles;
    v31->_titles = v34;

    v36 = (NSDictionary *)[v25 copy];
    subtitles = v31->_subtitles;
    v31->_subtitles = v36;

    v31->_flags = a6;
    objc_storeStrong((id *)&v31->_ageRating, v58);
    v38 = (NSArray *)[v23 copy];
    metrics = v31->_metrics;
    v31->_metrics = v38;

    v40 = (NSString *)[v63 copy];
    baseBuyParams = v31->_baseBuyParams;
    v31->_baseBuyParams = v40;

    v42 = (NSString *)[v62 copy];
    metricsBuyParams = v31->_metricsBuyParams;
    v31->_metricsBuyParams = v42;

    v44 = (NSDictionary *)[v61 copy];
    additionalHeaders = v31->_additionalHeaders;
    v31->_additionalHeaders = v44;

    v46 = (NSURL *)[v26 copy];
    preflightPackageURL = v31->_preflightPackageURL;
    v31->_preflightPackageURL = v46;

    v48 = (NSString *)[v27 copy];
    bundleID = v31->_bundleID;
    v31->_bundleID = v48;

    v50 = (NSString *)[v28 copy];
    itemName = v31->_itemName;
    v31->_itemName = v50;

    v52 = (NSString *)[v29 copy];
    vendorName = v31->_vendorName;
    v31->_vendorName = v52;

    v54 = (NSArray *)[v30 copy];
    capabilities = v31->_capabilities;
    v31->_capabilities = v54;
  }
  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAppOffer)initWithCoder:(id)a3
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
          v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseBuyParams"];
          if (v11)
          {
            v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metricsBuyParams"];
            if (v102)
            {
              id v95 = v8;
              v98 = v9;
              id v12 = objc_alloc((Class)NSSet);
              uint64_t v13 = objc_opt_class();
              id v97 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
              v101 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
              v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preflightPackageURL"];
              v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
              if (v99)
              {
                v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];
                if (v96)
                {
                  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
                  if (v14)
                  {
                    id v93 = objc_alloc((Class)NSSet);
                    uint64_t v15 = objc_opt_class();
                    id v94 = objc_msgSend(v93, "initWithObjects:", v15, objc_opt_class(), 0);
                    v16 = [v4 decodeObjectOfClasses:v94 forKey:@"capabilities"];
                    self = [(ASCAppOffer *)self initWithID:v5 titles:v6 subtitles:v7 flags:v95 ageRating:v98 metrics:v10 baseBuyParams:v11 metricsBuyParams:v102 additionalHeaders:v101 preflightPackageURL:v100 bundleID:v99 itemName:v96 vendorName:v14 capabilities:v16];

                    v17 = (void *)v14;
                    v9 = v98;
                    v18 = self;
                    v19 = v97;
                  }
                  else
                  {
                    BOOL v84 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                    if (v84) {
                      sub_10013E128(v84, v85, v86, v87, v88, v89, v90, v91);
                    }
                    v18 = 0;
                    v19 = v97;
                    v9 = v98;
                    v17 = 0;
                  }
                }
                else
                {
                  BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v76) {
                    sub_10013E0EC(v76, v77, v78, v79, v80, v81, v82, v83);
                  }
                  v18 = 0;
                  v19 = v97;
                  v9 = v98;
                }
              }
              else
              {
                BOOL v68 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v68) {
                  sub_10013E0B0(v68, v69, v70, v71, v72, v73, v74, v75);
                }
                v18 = 0;
                v19 = v97;
                v9 = v98;
              }
            }
            else
            {
              BOOL v60 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v60) {
                sub_10013E074(v60, v61, v62, v63, v64, v65, v66, v67);
              }
              v18 = 0;
            }
          }
          else
          {
            BOOL v52 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v52) {
              sub_10013E038(v52, v53, v54, v55, v56, v57, v58, v59);
            }
            v18 = 0;
          }
        }
        else
        {
          BOOL v44 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v44) {
            sub_10013DFFC(v44, v45, v46, v47, v48, v49, v50, v51);
          }
          v18 = 0;
        }
      }
      else
      {
        BOOL v36 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v36) {
          sub_10013DFC0(v36, v37, v38, v39, v40, v41, v42, v43);
        }
        v18 = 0;
      }
    }
    else
    {
      BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v28) {
        sub_10013DF84(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      v18 = 0;
    }
  }
  else
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_10013DF48(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCAppOffer *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCAppOffer *)self titles];
  [v4 encodeObject:v6 forKey:@"titles"];

  v7 = [(ASCAppOffer *)self subtitles];
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAppOffer flags](self, "flags"), @"flags");
  id v8 = [(ASCAppOffer *)self ageRating];
  [v4 encodeObject:v8 forKey:@"ageRating"];

  v9 = [(ASCAppOffer *)self metrics];
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = [(ASCAppOffer *)self baseBuyParams];
  [v4 encodeObject:v10 forKey:@"baseBuyParams"];

  v11 = [(ASCAppOffer *)self metricsBuyParams];
  [v4 encodeObject:v11 forKey:@"metricsBuyParams"];

  id v12 = [(ASCAppOffer *)self additionalHeaders];
  [v4 encodeObject:v12 forKey:@"additionalHeaders"];

  uint64_t v13 = [(ASCAppOffer *)self preflightPackageURL];
  [v4 encodeObject:v13 forKey:@"preflightPackageURL"];

  uint64_t v14 = [(ASCAppOffer *)self bundleID];
  [v4 encodeObject:v14 forKey:@"bundleID"];

  uint64_t v15 = [(ASCAppOffer *)self itemName];
  [v4 encodeObject:v15 forKey:@"itemName"];

  v16 = [(ASCAppOffer *)self vendorName];
  [v4 encodeObject:v16 forKey:@"vendorName"];

  id v17 = [(ASCAppOffer *)self capabilities];
  [v4 encodeObject:v17 forKey:@"capabilities"];
}

- (ASCAppOffer)offerWithMetrics:(id)a3
{
  id v18 = a3;
  id v16 = objc_alloc((Class)objc_opt_class());
  BOOL v20 = [(ASCAppOffer *)self id];
  v19 = [(ASCAppOffer *)self titles];
  id v4 = [(ASCAppOffer *)self subtitles];
  int64_t v15 = [(ASCAppOffer *)self flags];
  v5 = [(ASCAppOffer *)self ageRating];
  uint64_t v14 = [(ASCAppOffer *)self baseBuyParams];
  v6 = [(ASCAppOffer *)self metricsBuyParams];
  v7 = [(ASCAppOffer *)self additionalHeaders];
  id v8 = [(ASCAppOffer *)self preflightPackageURL];
  v9 = [(ASCAppOffer *)self bundleID];
  v10 = [(ASCAppOffer *)self itemName];
  v11 = [(ASCAppOffer *)self vendorName];
  id v12 = [(ASCAppOffer *)self capabilities];
  id v17 = [v16 initWithID:v20 titles:v19 subtitles:v4 flags:v15 ageRating:v5 metrics:v18 baseBuyParams:v14 metricsBuyParams:v6 additionalHeaders:v7 preflightPackageURL:v8 bundleID:v9 itemName:v10 vendorName:v11 capabilities:v12];

  return (ASCAppOffer *)v17;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCAppOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCAppOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  v6 = [(ASCAppOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCAppOffer *)self flags]];
  v7 = [(ASCAppOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  id v8 = [(ASCAppOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  v9 = [(ASCAppOffer *)self baseBuyParams];
  [(ASCHasher *)v3 combineObject:v9];

  v10 = [(ASCAppOffer *)self metricsBuyParams];
  [(ASCHasher *)v3 combineObject:v10];

  v11 = [(ASCAppOffer *)self additionalHeaders];
  [(ASCHasher *)v3 combineObject:v11];

  id v12 = [(ASCAppOffer *)self preflightPackageURL];
  [(ASCHasher *)v3 combineObject:v12];

  uint64_t v13 = [(ASCAppOffer *)self bundleID];
  [(ASCHasher *)v3 combineObject:v13];

  uint64_t v14 = [(ASCAppOffer *)self itemName];
  [(ASCHasher *)v3 combineObject:v14];

  int64_t v15 = [(ASCAppOffer *)self vendorName];
  [(ASCHasher *)v3 combineObject:v15];

  id v16 = [(ASCAppOffer *)self capabilities];
  [(ASCHasher *)v3 combineObject:v16];

  unint64_t v17 = [(ASCHasher *)v3 finalizeHash];
  return v17;
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
    id v8 = [(ASCAppOffer *)self id];
    uint64_t v9 = [v7 id];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        v11 = [(ASCAppOffer *)self titles];
        uint64_t v12 = [v7 titles];
        uint64_t v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            uint64_t v14 = [(ASCAppOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            id v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_54;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_54;
            }
            id v18 = [(ASCAppOffer *)self flags];
            if (v18 == [v7 flags])
            {
              v19 = [(ASCAppOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              uint64_t v21 = (void *)v20;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                uint64_t v72 = v14;
                uint64_t v23 = v16;
                uint64_t v24 = v19;
                uint64_t v25 = v21;
                unsigned int v26 = [v22 isEqual:v21];
                uint64_t v21 = v25;
                v19 = v24;
                id v16 = v23;
                uint64_t v14 = v72;
                if (v26)
                {
LABEL_27:
                  uint64_t v70 = v21;
                  uint64_t v71 = v19;
                  uint64_t v27 = [(ASCAppOffer *)self metrics];
                  uint64_t v28 = [v7 metrics];
                  uint64_t v29 = (void *)v28;
                  uint64_t v74 = (void *)v27;
                  if (v27 && v28)
                  {
                    uint64_t v30 = (void *)v28;
                    unsigned int v31 = [v74 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      BOOL v68 = v29;
                      uint64_t v32 = [(ASCAppOffer *)self baseBuyParams];
                      uint64_t v33 = [v7 baseBuyParams];
                      uint64_t v34 = (void *)v33;
                      uint64_t v69 = (void *)v32;
                      if (v32 && v33)
                      {
                        uint64_t v35 = (void *)v33;
                        unsigned int v36 = [v69 isEqual:v33];
                        uint64_t v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          uint64_t v66 = v34;
                          uint64_t v37 = [(ASCAppOffer *)self metricsBuyParams];
                          uint64_t v38 = [v7 metricsBuyParams];
                          uint64_t v39 = (void *)v38;
                          uint64_t v67 = (void *)v37;
                          if (v37 && v38)
                          {
                            uint64_t v40 = (void *)v38;
                            unsigned int v41 = [v67 isEqual:v38];
                            uint64_t v39 = v40;
                            if (v41)
                            {
LABEL_36:
                              uint64_t v64 = v39;
                              uint64_t v42 = [(ASCAppOffer *)self additionalHeaders];
                              uint64_t v43 = [v7 additionalHeaders];
                              uint64_t v65 = v42;
                              uint64_t v63 = (void *)v43;
                              if (v42 && v43)
                              {
                                if ([v42 isEqual:v43])
                                {
LABEL_39:
                                  BOOL v44 = [(ASCAppOffer *)self preflightPackageURL];
                                  uint64_t v45 = [v7 preflightPackageURL];
                                  uint64_t v61 = (void *)v45;
                                  uint64_t v62 = v44;
                                  if (v44 && v45)
                                  {
                                    if ([v44 isEqual:v45])
                                    {
LABEL_42:
                                      uint64_t v46 = [(ASCAppOffer *)self bundleID];
                                      uint64_t v47 = [v7 bundleID];
                                      BOOL v60 = (void *)v46;
                                      if (v46 && v47)
                                      {
                                        uint64_t v48 = (void *)v47;
                                        if ([v60 isEqual:v47])
                                        {
LABEL_45:
                                          uint64_t v73 = v14;
                                          uint64_t v59 = v16;
                                          uint64_t v49 = [(ASCAppOffer *)self itemName];
                                          uint64_t v50 = [v7 itemName];
                                          uint64_t v51 = v49;
                                          uint64_t v58 = (void *)v50;
                                          if (v49 && v50)
                                          {
                                            if ([v49 isEqual:v50])
                                            {
LABEL_48:
                                              BOOL v52 = [(ASCAppOffer *)self vendorName];
                                              [v7 vendorName];
                                              v57 = uint64_t v56 = v52;
                                              if (v52 && v57)
                                              {
                                                if ([v52 isEqual:v57]) {
                                                  goto LABEL_51;
                                                }
                                              }
                                              else if (v52 == v57)
                                              {
LABEL_51:
                                                uint64_t v53 = [(ASCAppOffer *)self capabilities];
                                                uint64_t v55 = [v7 capabilities];
                                                if (v53 && v55) {
                                                  unsigned __int8 v17 = [v53 isEqual:v55];
                                                }
                                                else {
                                                  unsigned __int8 v17 = v53 == v55;
                                                }

                                                goto LABEL_75;
                                              }
                                              unsigned __int8 v17 = 0;
LABEL_75:

                                              goto LABEL_76;
                                            }
                                          }
                                          else if (v49 == (void *)v50)
                                          {
                                            goto LABEL_48;
                                          }
                                          unsigned __int8 v17 = 0;
LABEL_76:

                                          id v16 = v59;
                                          uint64_t v14 = v73;
                                          goto LABEL_77;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v48 = (void *)v47;
                                        if (v60 == (void *)v47) {
                                          goto LABEL_45;
                                        }
                                      }
                                      unsigned __int8 v17 = 0;
LABEL_77:

                                      goto LABEL_78;
                                    }
                                  }
                                  else if (v44 == (void *)v45)
                                  {
                                    goto LABEL_42;
                                  }
                                  unsigned __int8 v17 = 0;
LABEL_78:

                                  goto LABEL_79;
                                }
                              }
                              else if (v42 == (void *)v43)
                              {
                                goto LABEL_39;
                              }
                              unsigned __int8 v17 = 0;
LABEL_79:

                              uint64_t v39 = v64;
                              goto LABEL_80;
                            }
                          }
                          else if (v37 == v38)
                          {
                            goto LABEL_36;
                          }
                          unsigned __int8 v17 = 0;
LABEL_80:

                          uint64_t v34 = v66;
                          goto LABEL_81;
                        }
                      }
                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }
                      unsigned __int8 v17 = 0;
LABEL_81:

                      uint64_t v29 = v68;
                      goto LABEL_82;
                    }
                  }
                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }
                  unsigned __int8 v17 = 0;
LABEL_82:

                  uint64_t v21 = v70;
                  v19 = v71;
                  goto LABEL_83;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              unsigned __int8 v17 = 0;
LABEL_83:

              goto LABEL_84;
            }
LABEL_54:
            unsigned __int8 v17 = 0;
LABEL_84:

            goto LABEL_85;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        unsigned __int8 v17 = 0;
LABEL_85:

        goto LABEL_86;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    unsigned __int8 v17 = 0;
LABEL_86:

    goto LABEL_87;
  }
  unsigned __int8 v17 = 0;
LABEL_87:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCAppOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCAppOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  v6 = [(ASCAppOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription((__int16)[(ASCAppOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  id v8 = [(ASCAppOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCAppOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  v10 = [(ASCAppOffer *)self baseBuyParams];
  [(ASCDescriber *)v3 addSensitiveObject:v10 withName:@"baseBuyParams"];

  v11 = [(ASCAppOffer *)self metricsBuyParams];
  [(ASCDescriber *)v3 addSensitiveObject:v11 withName:@"metricsBuyParams"];

  uint64_t v12 = [(ASCAppOffer *)self additionalHeaders];
  [(ASCDescriber *)v3 addObject:v12 withName:@"additionalHeaders"];

  uint64_t v13 = [(ASCAppOffer *)self preflightPackageURL];
  [(ASCDescriber *)v3 addObject:v13 withName:@"preflightPackageURL"];

  uint64_t v14 = [(ASCAppOffer *)self bundleID];
  [(ASCDescriber *)v3 addObject:v14 withName:@"bundleID"];

  uint64_t v15 = [(ASCAppOffer *)self itemName];
  [(ASCDescriber *)v3 addObject:v15 withName:@"itemName"];

  id v16 = [(ASCAppOffer *)self vendorName];
  [(ASCDescriber *)v3 addObject:v16 withName:@"vendorName"];

  unsigned __int8 v17 = [(ASCAppOffer *)self capabilities];
  [(ASCDescriber *)v3 addObject:v17 withName:@"capabilities"];

  id v18 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v18;
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

- (NSString)baseBuyParams
{
  return self->_baseBuyParams;
}

- (NSString)metricsBuyParams
{
  return self->_metricsBuyParams;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (NSURL)preflightPackageURL
{
  return self->_preflightPackageURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_preflightPackageURL, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_metricsBuyParams, 0);
  objc_storeStrong((id *)&self->_baseBuyParams, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end