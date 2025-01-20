@interface BMAppClipLaunchEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMAppClipLaunchEvent)initWithProto:(id)a3;
- (BMAppClipLaunchEvent)initWithProtoData:(id)a3;
- (BMAppClipLaunchEvent)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10;
- (BOOL)isEqual:(id)a3;
- (NSString)URLHash;
- (NSString)appBundleID;
- (NSString)clipBundleID;
- (NSString)description;
- (NSString)launchReason;
- (NSString)referrerBundleID;
- (NSString)webAppBundleID;
- (NSURL)fullURL;
- (NSURL)referrerURL;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMAppClipLaunchEvent

- (BMAppClipLaunchEvent)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)BMAppClipLaunchEvent;
  v24 = [(BMEventBase *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    URLHash = v24->_URLHash;
    v24->_URLHash = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    clipBundleID = v24->_clipBundleID;
    v24->_clipBundleID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    appBundleID = v24->_appBundleID;
    v24->_appBundleID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    webAppBundleID = v24->_webAppBundleID;
    v24->_webAppBundleID = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    launchReason = v24->_launchReason;
    v24->_launchReason = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    fullURL = v24->_fullURL;
    v24->_fullURL = (NSURL *)v35;

    uint64_t v37 = [v22 copy];
    referrerURL = v24->_referrerURL;
    v24->_referrerURL = (NSURL *)v37;

    uint64_t v39 = [v23 copy];
    referrerBundleID = v24->_referrerBundleID;
    v24->_referrerBundleID = (NSString *)v39;
  }
  return v24;
}

- (NSString)description
{
  v14 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [(BMAppClipLaunchEvent *)self URLHash];
  v5 = [(BMAppClipLaunchEvent *)self clipBundleID];
  v6 = [(BMAppClipLaunchEvent *)self appBundleID];
  v7 = [(BMAppClipLaunchEvent *)self webAppBundleID];
  v8 = [(BMAppClipLaunchEvent *)self launchReason];
  v9 = [(BMAppClipLaunchEvent *)self fullURL];
  v10 = [(BMAppClipLaunchEvent *)self referrerURL];
  v11 = [(BMAppClipLaunchEvent *)self referrerBundleID];
  v12 = [v14 stringWithFormat:@"<%@ %p> URLHash: %@, clipBundleID: %@, appBundleID: %@, webAppBundleID: %@, launchReason: %@, fullURL: %@, referrerURL: %@, referrerBundleID: %@", v3, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 != 1)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMAppClipLaunchEvent eventWithData:dataVersion:](v7);
    }
  }
  v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMAppClipLaunchEvent *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (BMAppClipLaunchEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BMAppClipLaunchEvent initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  id v19 = [v5 uRLHash];
  id v17 = [v5 clipBundleID];
  id v6 = [v5 appBundleID];
  id v18 = [v5 webAppBundleID];
  id v16 = [v5 launchReason];
  v7 = (void *)MEMORY[0x1E4F1CB10];
  id v20 = [v5 fullURL];
  v8 = [v7 URLWithString:v20];
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [v5 referrerURL];
  v11 = [v9 URLWithString:v10];
  v12 = [v5 referrerBundleID];

  self = [(BMAppClipLaunchEvent *)self initWithURLHash:v19 clipBundleID:v17 appBundleID:v6 webAppBundleID:v18 launchReason:v16 fullURL:v8 referrerURL:v11 referrerBundleID:v12];
  v13 = self;
LABEL_8:

  return v13;
}

- (BMAppClipLaunchEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBAppClipLaunchEvent alloc] initWithData:v4];

    self = [(BMAppClipLaunchEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(BMAppClipLaunchEvent *)self URLHash];
  [v3 setURLHash:v4];

  id v5 = [(BMAppClipLaunchEvent *)self clipBundleID];
  [v3 setClipBundleID:v5];

  id v6 = [(BMAppClipLaunchEvent *)self appBundleID];
  [v3 setAppBundleID:v6];

  v7 = [(BMAppClipLaunchEvent *)self webAppBundleID];
  [v3 setWebAppBundleID:v7];

  v8 = [(BMAppClipLaunchEvent *)self launchReason];
  [v3 setLaunchReason:v8];

  v9 = [(BMAppClipLaunchEvent *)self fullURL];
  v10 = [v9 absoluteString];
  [v3 setFullURL:v10];

  v11 = [(BMAppClipLaunchEvent *)self referrerURL];
  v12 = [v11 absoluteString];
  [v3 setReferrerURL:v12];

  v13 = [(BMAppClipLaunchEvent *)self referrerBundleID];
  [v3 setReferrerBundleID:v13];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(BMAppClipLaunchEvent *)self URLHash];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMAppClipLaunchEvent *)self appBundleID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(BMAppClipLaunchEvent *)self clipBundleID];
  uint64_t v8 = [v7 hash];
  v9 = [(BMAppClipLaunchEvent *)self webAppBundleID];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(BMAppClipLaunchEvent *)self launchReason];
  uint64_t v12 = [v11 hash];
  v13 = [(BMAppClipLaunchEvent *)self fullURL];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(BMAppClipLaunchEvent *)self referrerURL];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  id v17 = [(BMAppClipLaunchEvent *)self referrerBundleID];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(BMAppClipLaunchEvent *)self URLHash];
    if (v7 || ([v6 URLHash], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [(BMAppClipLaunchEvent *)self URLHash];
      v9 = [v6 URLHash];
      char v34 = [v8 isEqual:v9];

      if (v7)
      {
LABEL_9:

        v11 = [(BMAppClipLaunchEvent *)self appBundleID];
        if (v11 || ([v6 appBundleID], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v7 = [(BMAppClipLaunchEvent *)self appBundleID];
          uint64_t v12 = [v6 appBundleID];
          char v33 = [v7 isEqual:v12];

          if (v11)
          {
LABEL_15:

            v13 = [(BMAppClipLaunchEvent *)self clipBundleID];
            if (v13 || ([v6 clipBundleID], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v7 = [(BMAppClipLaunchEvent *)self clipBundleID];
              uint64_t v14 = [v6 clipBundleID];
              HIDWORD(v32) = [v7 isEqual:v14];

              if (v13)
              {
LABEL_21:

                v15 = [(BMAppClipLaunchEvent *)self webAppBundleID];
                if (v15
                  || ([v6 webAppBundleID], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v7 = [(BMAppClipLaunchEvent *)self webAppBundleID];
                  uint64_t v16 = [v6 webAppBundleID];
                  LODWORD(v32) = [v7 isEqual:v16];

                  if (v15)
                  {
LABEL_27:

                    id v17 = [(BMAppClipLaunchEvent *)self launchReason];
                    if (v17
                      || ([v6 launchReason], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      v7 = [(BMAppClipLaunchEvent *)self launchReason];
                      unint64_t v18 = [v6 launchReason];
                      char v19 = [v7 isEqual:v18];

                      if (v17)
                      {
LABEL_33:

                        id v20 = [(BMAppClipLaunchEvent *)self fullURL];
                        if (v20
                          || ([v6 fullURL], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          v7 = [(BMAppClipLaunchEvent *)self fullURL];
                          id v21 = [v6 fullURL];
                          char v22 = [v7 isEqual:v21];

                          if (v20)
                          {
LABEL_39:

                            id v23 = [(BMAppClipLaunchEvent *)self referrerURL];
                            if (v23
                              || ([v6 referrerURL],
                                  (v7 = objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              v24 = [(BMAppClipLaunchEvent *)self referrerURL];
                              uint64_t v25 = [v6 referrerURL];
                              char v26 = [v24 isEqual:v25];

                              if (v23)
                              {
LABEL_45:

                                uint64_t v27 = [(BMAppClipLaunchEvent *)self referrerBundleID];
                                if (v27
                                  || ([v6 referrerBundleID],
                                      (v7 = objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  v28 = [(BMAppClipLaunchEvent *)self referrerBundleID];
                                  uint64_t v29 = [v6 referrerBundleID];
                                  char v30 = [v28 isEqual:v29];

                                  if (v27)
                                  {
LABEL_51:

                                    char v10 = v34 & v33 & BYTE4(v32) & v32 & v19 & v22 & v26 & v30;
                                    goto LABEL_52;
                                  }
                                }
                                else
                                {
                                  char v30 = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              char v26 = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          char v22 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      char v19 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  LODWORD(v32) = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              HIDWORD(v32) = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char v33 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v34 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_52:

  return v10;
}

- (NSString)URLHash
{
  return self->_URLHash;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSURL)fullURL
{
  return self->_fullURL;
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);

  objc_storeStrong((id *)&self->_URLHash, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Mismatched BMAppLaunchEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBAppClipLaunchEvent proto", (uint8_t *)&v5, 0xCu);
}

@end