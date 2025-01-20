@interface ASCOfferAlertOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCOffer)completionOffer;
- (ASCOfferAlertOffer)initWithCoder:(id)a3;
- (ASCOfferAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertFooterMessage:(id)a11 isCancelable:(BOOL)a12 checkRestrictionsForContentRating:(id)a13 shouldCheckForAvailableDiskSpace:(BOOL)a14 remoteControllerRequirement:(id)a15 shouldIncludeActiveAccountInFooterMessage:(BOOL)a16 shouldPromptForConfirmation:(BOOL)a17 completionOffer:(id)a18;
- (ASCOfferAlertOffer)offerWithMetrics:(id)a3;
- (BOOL)isCancelable;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCheckForAvailableDiskSpace;
- (BOOL)shouldIncludeActiveAccountInFooterMessage;
- (BOOL)shouldPromptForConfirmation;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSNumber)checkRestrictionsForContentRating;
- (NSString)alertFooterMessage;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)description;
- (NSString)remoteControllerRequirement;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCOfferAlertOffer

- (ASCOfferAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertFooterMessage:(id)a11 isCancelable:(BOOL)a12 checkRestrictionsForContentRating:(id)a13 shouldCheckForAvailableDiskSpace:(BOOL)a14 remoteControllerRequirement:(id)a15 shouldIncludeActiveAccountInFooterMessage:(BOOL)a16 shouldPromptForConfirmation:(BOOL)a17 completionOffer:(id)a18
{
  id v22 = a3;
  id v23 = a4;
  id v58 = a5;
  id v56 = a7;
  id v57 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a15;
  id v29 = a18;
  v59.receiver = self;
  v59.super_class = (Class)ASCOfferAlertOffer;
  v30 = [(ASCOfferAlertOffer *)&v59 init];
  if (v30)
  {
    uint64_t v31 = [v22 copy];
    id = v30->_id;
    v30->_id = (ASCAdamID *)v31;

    uint64_t v33 = [v23 copy];
    titles = v30->_titles;
    v30->_titles = (NSDictionary *)v33;

    uint64_t v35 = [v58 copy];
    subtitles = v30->_subtitles;
    v30->_subtitles = (NSDictionary *)v35;

    v30->_flags = a6;
    objc_storeStrong((id *)&v30->_ageRating, a7);
    uint64_t v37 = [v57 copy];
    metrics = v30->_metrics;
    v30->_metrics = (NSArray *)v37;

    uint64_t v39 = [v24 copy];
    alertTitle = v30->_alertTitle;
    v30->_alertTitle = (NSString *)v39;

    uint64_t v41 = [v25 copy];
    alertMessage = v30->_alertMessage;
    v30->_alertMessage = (NSString *)v41;

    uint64_t v43 = [v24 copy];
    v44 = v30->_alertTitle;
    v30->_alertTitle = (NSString *)v43;

    uint64_t v45 = [v26 copy];
    alertFooterMessage = v30->_alertFooterMessage;
    v30->_alertFooterMessage = (NSString *)v45;

    v30->_isCancelable = a12;
    uint64_t v47 = [v27 copy];
    checkRestrictionsForContentRating = v30->_checkRestrictionsForContentRating;
    v30->_checkRestrictionsForContentRating = (NSNumber *)v47;

    v30->_shouldCheckForAvailableDiskSpace = a14;
    uint64_t v49 = [v28 copy];
    remoteControllerRequirement = v30->_remoteControllerRequirement;
    v30->_remoteControllerRequirement = (NSString *)v49;

    v30->_shouldIncludeActiveAccountInFooterMessage = a16;
    v30->_shouldPromptForConfirmation = a17;
    uint64_t v51 = [v29 copyWithZone:0];
    completionOffer = v30->_completionOffer;
    v30->_completionOffer = (ASCOffer *)v51;
  }
  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferAlertOffer)initWithCoder:(id)a3
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
        v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ageRating"];
        v9 = ASCMetricsDataDecodeArrayForKey(v4, @"metrics");
        if (v9)
        {
          uint64_t v56 = v8;
          v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertTitle"];
          objc_super v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertMessage"];
          v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertFooterMessage"];
          id v58 = v7;
          id v57 = v9;
          if ([v4 containsValueForKey:@"isCancelable"]) {
            char v53 = [v4 decodeBoolForKey:@"isCancelable"];
          }
          else {
            char v53 = 1;
          }
          v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"checkRestrictionsForContentRating"];
          char v43 = [v4 decodeBoolForKey:@"shouldCheckForAvailableDiskSpace"];
          v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteControllerRequirement"];
          char v45 = [v4 decodeBoolForKey:@"shouldIncludeActiveAccountInFooterMessage"];
          char v46 = [v4 decodeBoolForKey:@"shouldPromptForConfirmation"];
          uint64_t v47 = ASCOfferDecodeForKey(v4, @"completionOffer");
          BYTE1(v51) = v46;
          LOBYTE(v51) = v45;
          LOBYTE(v50) = v43;
          LOBYTE(v49) = v53;
          v7 = v58;
          self = objc_retain(-[ASCOfferAlertOffer initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:", v5, v6, v58, v56, v60, v57, v55, v59, v54, v49, v52, v50, v44, v51,
                     v47));

          v9 = v57;
          v18 = self;
        }
        else
        {
          BOOL v35 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v35) {
            -[ASCOfferAlertOffer initWithCoder:].cold.4(v35, v36, v37, v38, v39, v40, v41, v42);
          }
          v18 = 0;
        }
      }
      else
      {
        BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v27) {
          -[ASCOfferAlertOffer initWithCoder:](v27, v28, v29, v30, v31, v32, v33, v34);
        }
        v18 = 0;
      }
    }
    else
    {
      BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v19) {
        -[ASCOfferAlertOffer initWithCoder:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      v18 = 0;
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      -[ASCOfferAlertOffer initWithCoder:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCOfferAlertOffer *)self id];
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = [(ASCOfferAlertOffer *)self titles];
  [v4 encodeObject:v6 forKey:@"titles"];

  v7 = [(ASCOfferAlertOffer *)self subtitles];
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferAlertOffer flags](self, "flags"), @"flags");
  uint64_t v8 = [(ASCOfferAlertOffer *)self ageRating];
  [v4 encodeObject:v8 forKey:@"ageRating"];

  v9 = [(ASCOfferAlertOffer *)self metrics];
  [v4 encodeObject:v9 forKey:@"metrics"];

  BOOL v10 = [(ASCOfferAlertOffer *)self alertTitle];
  [v4 encodeObject:v10 forKey:@"alertTitle"];

  uint64_t v11 = [(ASCOfferAlertOffer *)self alertMessage];
  [v4 encodeObject:v11 forKey:@"alertMessage"];

  uint64_t v12 = [(ASCOfferAlertOffer *)self alertFooterMessage];
  [v4 encodeObject:v12 forKey:@"alertFooterMessage"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer isCancelable](self, "isCancelable"), @"isCancelable");
  uint64_t v13 = [(ASCOfferAlertOffer *)self checkRestrictionsForContentRating];
  [v4 encodeObject:v13 forKey:@"checkRestrictionsForContentRating"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"), @"shouldCheckForAvailableDiskSpace");
  uint64_t v14 = [(ASCOfferAlertOffer *)self remoteControllerRequirement];
  [v4 encodeObject:v14 forKey:@"remoteControllerRequirement"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"), @"shouldIncludeActiveAccountInFooterMessage");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"), @"shouldPromptForConfirmation");
  id v15 = [(ASCOfferAlertOffer *)self completionOffer];
  [v4 encodeObject:v15 forKey:@"completionOffer"];
}

- (ASCOfferAlertOffer)offerWithMetrics:(id)a3
{
  id v25 = a3;
  id v23 = objc_alloc((Class)objc_opt_class());
  uint64_t v22 = [(ASCOfferAlertOffer *)self id];
  uint64_t v21 = [(ASCOfferAlertOffer *)self titles];
  uint64_t v20 = [(ASCOfferAlertOffer *)self subtitles];
  int64_t v19 = [(ASCOfferAlertOffer *)self flags];
  v18 = [(ASCOfferAlertOffer *)self ageRating];
  uint64_t v17 = [(ASCOfferAlertOffer *)self alertTitle];
  id v4 = [(ASCOfferAlertOffer *)self alertMessage];
  v5 = [(ASCOfferAlertOffer *)self alertFooterMessage];
  BOOL v6 = [(ASCOfferAlertOffer *)self isCancelable];
  v7 = [(ASCOfferAlertOffer *)self checkRestrictionsForContentRating];
  BOOL v8 = [(ASCOfferAlertOffer *)self shouldCheckForAvailableDiskSpace];
  v9 = [(ASCOfferAlertOffer *)self remoteControllerRequirement];
  BOOL v10 = [(ASCOfferAlertOffer *)self shouldIncludeActiveAccountInFooterMessage];
  BOOL v11 = [(ASCOfferAlertOffer *)self shouldPromptForConfirmation];
  uint64_t v12 = [(ASCOfferAlertOffer *)self completionOffer];
  BYTE1(v16) = v11;
  LOBYTE(v16) = v10;
  LOBYTE(v15) = v8;
  LOBYTE(v14) = v6;
  uint64_t v24 = objc_msgSend(v23, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:", v22, v21, v20, v19, v18, v25, v17, v4, v5, v14, v7, v15, v9, v16, v12);

  return (ASCOfferAlertOffer *)v24;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCOfferAlertOffer *)self id];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCOfferAlertOffer *)self titles];
  [(ASCHasher *)v3 combineObject:v5];

  BOOL v6 = [(ASCOfferAlertOffer *)self subtitles];
  [(ASCHasher *)v3 combineObject:v6];

  [(ASCHasher *)v3 combineInteger:[(ASCOfferAlertOffer *)self flags]];
  v7 = [(ASCOfferAlertOffer *)self ageRating];
  [(ASCHasher *)v3 combineObject:v7];

  BOOL v8 = [(ASCOfferAlertOffer *)self metrics];
  [(ASCHasher *)v3 combineObject:v8];

  v9 = [(ASCOfferAlertOffer *)self alertTitle];
  [(ASCHasher *)v3 combineObject:v9];

  BOOL v10 = [(ASCOfferAlertOffer *)self alertMessage];
  [(ASCHasher *)v3 combineObject:v10];

  BOOL v11 = [(ASCOfferAlertOffer *)self alertFooterMessage];
  [(ASCHasher *)v3 combineObject:v11];

  [(ASCHasher *)v3 combineBool:[(ASCOfferAlertOffer *)self isCancelable]];
  uint64_t v12 = [(ASCOfferAlertOffer *)self checkRestrictionsForContentRating];
  [(ASCHasher *)v3 combineObject:v12];

  [(ASCHasher *)v3 combineBool:[(ASCOfferAlertOffer *)self shouldCheckForAvailableDiskSpace]];
  uint64_t v13 = [(ASCOfferAlertOffer *)self remoteControllerRequirement];
  [(ASCHasher *)v3 combineObject:v13];

  [(ASCHasher *)v3 combineBool:[(ASCOfferAlertOffer *)self shouldIncludeActiveAccountInFooterMessage]];
  [(ASCHasher *)v3 combineBool:[(ASCOfferAlertOffer *)self shouldPromptForConfirmation]];
  uint64_t v14 = [(ASCOfferAlertOffer *)self completionOffer];
  [(ASCHasher *)v3 combineObject:v14];

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
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    BOOL v8 = [(ASCOfferAlertOffer *)self id];
    uint64_t v9 = [v7 id];
    BOOL v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9])
      {
LABEL_10:
        BOOL v11 = [(ASCOfferAlertOffer *)self titles];
        uint64_t v12 = [v7 titles];
        uint64_t v13 = (void *)v12;
        if (v11 && v12)
        {
          if ([v11 isEqual:v12])
          {
LABEL_13:
            uint64_t v14 = [(ASCOfferAlertOffer *)self subtitles];
            uint64_t v15 = [v7 subtitles];
            uint64_t v16 = (void *)v15;
            if (v14 && v15)
            {
              if (![v14 isEqual:v15]) {
                goto LABEL_40;
              }
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_40;
            }
            int64_t v18 = [(ASCOfferAlertOffer *)self flags];
            if (v18 == [v7 flags])
            {
              int64_t v19 = [(ASCOfferAlertOffer *)self ageRating];
              uint64_t v20 = [v7 ageRating];
              uint64_t v21 = (void *)v20;
              if (v19 && v20)
              {
                uint64_t v22 = v19;
                v71 = v14;
                id v23 = v16;
                uint64_t v24 = v19;
                id v25 = v21;
                int v26 = [v22 isEqual:v21];
                uint64_t v21 = v25;
                int64_t v19 = v24;
                uint64_t v16 = v23;
                uint64_t v14 = v71;
                if (v26)
                {
LABEL_27:
                  v69 = v21;
                  v70 = v19;
                  uint64_t v27 = [(ASCOfferAlertOffer *)self metrics];
                  uint64_t v28 = [v7 metrics];
                  uint64_t v29 = (void *)v28;
                  v74 = (void *)v27;
                  if (v27 && v28)
                  {
                    uint64_t v30 = (void *)v28;
                    int v31 = [v74 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      v67 = v29;
                      uint64_t v32 = [(ASCOfferAlertOffer *)self alertTitle];
                      uint64_t v33 = [v7 alertTitle];
                      uint64_t v34 = (void *)v33;
                      v68 = (void *)v32;
                      if (v32 && v33)
                      {
                        BOOL v35 = (void *)v33;
                        int v36 = [v68 isEqual:v33];
                        uint64_t v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          v65 = v34;
                          uint64_t v37 = [(ASCOfferAlertOffer *)self alertMessage];
                          uint64_t v38 = [v7 alertMessage];
                          uint64_t v39 = (void *)v38;
                          v66 = (void *)v37;
                          if (v37 && v38)
                          {
                            uint64_t v40 = (void *)v38;
                            int v41 = [v66 isEqual:v38];
                            uint64_t v39 = v40;
                            if (v41)
                            {
LABEL_36:
                              v63 = v39;
                              uint64_t v42 = [(ASCOfferAlertOffer *)self alertFooterMessage];
                              uint64_t v43 = [v7 alertFooterMessage];
                              v64 = v42;
                              v62 = (void *)v43;
                              if (v42 && v43)
                              {
                                if (![v42 isEqual:v43]) {
                                  goto LABEL_51;
                                }
                              }
                              else if (v42 != (void *)v43)
                              {
LABEL_51:
                                char v17 = 0;
LABEL_69:

                                uint64_t v39 = v63;
                                goto LABEL_70;
                              }
                              int v44 = [(ASCOfferAlertOffer *)self isCancelable];
                              if (v44 != [v7 isCancelable]) {
                                goto LABEL_51;
                              }
                              uint64_t v45 = [(ASCOfferAlertOffer *)self checkRestrictionsForContentRating];
                              uint64_t v46 = [v7 checkRestrictionsForContentRating];
                              v61 = (void *)v45;
                              if (v45 && v46)
                              {
                                uint64_t v47 = (void *)v46;
                                if (![v61 isEqual:v46]) {
                                  goto LABEL_58;
                                }
                              }
                              else
                              {
                                uint64_t v47 = (void *)v46;
                                if (v61 != (void *)v46)
                                {
LABEL_58:
                                  char v17 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }
                              int v72 = [(ASCOfferAlertOffer *)self shouldCheckForAvailableDiskSpace];
                              if (v72 != [v7 shouldCheckForAvailableDiskSpace]) {
                                goto LABEL_58;
                              }
                              v73 = v14;
                              v60 = v16;
                              uint64_t v48 = [(ASCOfferAlertOffer *)self remoteControllerRequirement];
                              uint64_t v49 = [v7 remoteControllerRequirement];
                              uint64_t v50 = (void *)v49;
                              uint64_t v51 = (void *)v48;
                              if (v48 && v49)
                              {
                                v52 = (void *)v48;
                                char v53 = v50;
                                if (![v52 isEqual:v50]) {
                                  goto LABEL_66;
                                }
                              }
                              else
                              {
                                char v53 = (void *)v49;
                                if (v51 != (void *)v49) {
                                  goto LABEL_66;
                                }
                              }
                              int v57 = [(ASCOfferAlertOffer *)self shouldIncludeActiveAccountInFooterMessage];
                              if (v57 == [v7 shouldIncludeActiveAccountInFooterMessage])
                              {
                                int v58 = [(ASCOfferAlertOffer *)self shouldPromptForConfirmation];
                                if (v58 == [v7 shouldPromptForConfirmation])
                                {
                                  v55 = [(ASCOfferAlertOffer *)self completionOffer];
                                  [v7 completionOffer];
                                  v59 = uint64_t v56 = v55;
                                  if (v55 && v59) {
                                    char v17 = [v55 isEqual:v59];
                                  }
                                  else {
                                    char v17 = v55 == v59;
                                  }

                                  goto LABEL_67;
                                }
                              }
LABEL_66:
                              char v17 = 0;
LABEL_67:

                              uint64_t v16 = v60;
                              uint64_t v14 = v73;
                              goto LABEL_68;
                            }
                          }
                          else if (v37 == v38)
                          {
                            goto LABEL_36;
                          }
                          char v17 = 0;
LABEL_70:

                          uint64_t v34 = v65;
                          goto LABEL_71;
                        }
                      }
                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }
                      char v17 = 0;
LABEL_71:

                      uint64_t v29 = v67;
                      goto LABEL_72;
                    }
                  }
                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }
                  char v17 = 0;
LABEL_72:

                  uint64_t v21 = v69;
                  int64_t v19 = v70;
                  goto LABEL_73;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              char v17 = 0;
LABEL_73:

              goto LABEL_74;
            }
LABEL_40:
            char v17 = 0;
LABEL_74:

            goto LABEL_75;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        char v17 = 0;
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    char v17 = 0;
LABEL_76:

    goto LABEL_77;
  }
  char v17 = 0;
LABEL_77:

  return v17;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCOfferAlertOffer *)self id];
  [(ASCDescriber *)v3 addObject:v4 withName:@"id"];

  id v5 = [(ASCOfferAlertOffer *)self titles];
  [(ASCDescriber *)v3 addObject:v5 withName:@"titles"];

  BOOL v6 = [(ASCOfferAlertOffer *)self subtitles];
  [(ASCDescriber *)v3 addObject:v6 withName:@"subtitles"];

  id v7 = ASCOfferFlagsGetDescription([(ASCOfferAlertOffer *)self flags]);
  [(ASCDescriber *)v3 addObject:v7 withName:@"flags"];

  BOOL v8 = [(ASCOfferAlertOffer *)self ageRating];
  [(ASCDescriber *)v3 addObject:v8 withName:@"ageRating"];

  uint64_t v9 = [(ASCOfferAlertOffer *)self metrics];
  [(ASCDescriber *)v3 addSensitiveObject:v9 withName:@"metrics"];

  BOOL v10 = [(ASCOfferAlertOffer *)self alertTitle];
  [(ASCDescriber *)v3 addObject:v10 withName:@"alertTitle"];

  BOOL v11 = [(ASCOfferAlertOffer *)self alertMessage];
  [(ASCDescriber *)v3 addObject:v11 withName:@"alertMessage"];

  uint64_t v12 = [(ASCOfferAlertOffer *)self alertFooterMessage];
  [(ASCDescriber *)v3 addObject:v12 withName:@"alertFooterMessage"];

  [(ASCDescriber *)v3 addBool:[(ASCOfferAlertOffer *)self isCancelable] withName:@"isCancelable"];
  uint64_t v13 = [(ASCOfferAlertOffer *)self checkRestrictionsForContentRating];
  [(ASCDescriber *)v3 addObject:v13 withName:@"checkRestrictionsForContentRating"];

  [(ASCDescriber *)v3 addBool:[(ASCOfferAlertOffer *)self shouldCheckForAvailableDiskSpace] withName:@"shouldCheckForAvailableDiskSpace"];
  uint64_t v14 = [(ASCOfferAlertOffer *)self remoteControllerRequirement];
  [(ASCDescriber *)v3 addObject:v14 withName:@"remoteControllerRequirement"];

  [(ASCDescriber *)v3 addBool:[(ASCOfferAlertOffer *)self shouldIncludeActiveAccountInFooterMessage] withName:@"shouldIncludeActiveAccountInFooterMessage"];
  [(ASCDescriber *)v3 addBool:[(ASCOfferAlertOffer *)self shouldPromptForConfirmation] withName:@"shouldPromptForConfirmation"];
  uint64_t v15 = [(ASCOfferAlertOffer *)self completionOffer];
  [(ASCDescriber *)v3 addObject:v15 withName:@"completionOffer"];

  uint64_t v16 = [(ASCDescriber *)v3 finalizeDescription];

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

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)alertFooterMessage
{
  return self->_alertFooterMessage;
}

- (BOOL)isCancelable
{
  return self->_isCancelable;
}

- (NSNumber)checkRestrictionsForContentRating
{
  return self->_checkRestrictionsForContentRating;
}

- (BOOL)shouldCheckForAvailableDiskSpace
{
  return self->_shouldCheckForAvailableDiskSpace;
}

- (NSString)remoteControllerRequirement
{
  return self->_remoteControllerRequirement;
}

- (BOOL)shouldIncludeActiveAccountInFooterMessage
{
  return self->_shouldIncludeActiveAccountInFooterMessage;
}

- (BOOL)shouldPromptForConfirmation
{
  return self->_shouldPromptForConfirmation;
}

- (ASCOffer)completionOffer
{
  return self->_completionOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffer, 0);
  objc_storeStrong((id *)&self->_remoteControllerRequirement, 0);
  objc_storeStrong((id *)&self->_checkRestrictionsForContentRating, 0);
  objc_storeStrong((id *)&self->_alertFooterMessage, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
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

@end