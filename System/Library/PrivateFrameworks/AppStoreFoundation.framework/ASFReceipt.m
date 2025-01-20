@interface ASFReceipt
+ (id)receiptFromBundleAtPath:(id)a3;
+ (id)receiptFromBundleAtURL:(id)a3;
+ (id)receiptWithContentsOfFile:(id)a3;
+ (id)receiptWithData:(id)a3;
- (ASFReceipt)initWithContentsOfFile:(id)a3;
- (ASFReceipt)initWithData:(id)a3;
- (BOOL)isDSIDless;
- (BOOL)isRevoked;
- (BOOL)isVPPLicensed;
- (NSArray)iaps;
- (NSData)bundleIDData;
- (NSData)opaqueDSIDData;
- (NSData)receiptData;
- (NSData)sha1;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)purchaseDate;
- (NSDate)renewalDate;
- (NSNumber)frToolVersion;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)cancellationReason;
- (NSString)developerID;
- (NSString)downloadID;
- (NSString)frAppVersion;
- (NSString)hwtype;
- (NSString)installerVersionID;
- (NSString)opaqueDSIDString;
- (NSString)organizationDisplayName;
- (NSString)parentalControls;
- (NSString)path;
- (NSString)receiptDataString;
- (NSString)receiptType;
@end

@implementation ASFReceipt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha1, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_receiptType, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_parentalControls, 0);
  objc_storeStrong((id *)&self->_organizationDisplayName, 0);
  objc_storeStrong((id *)&self->_opaqueDSIDString, 0);
  objc_storeStrong((id *)&self->_opaqueDSIDData, 0);
  objc_storeStrong((id *)&self->_iaps, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installerVersionID, 0);
  objc_storeStrong((id *)&self->_hwtype, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_frToolVersion, 0);
  objc_storeStrong((id *)&self->_frAppVersion, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_developerID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIDData, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_mutableIAPs, 0);
}

+ (id)receiptFromBundleAtURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    id v4 = v3;
    self;
    id v5 = v4;
    self;
    uint64_t v14 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithURL:v5 allowPlaceholder:0 error:&v14];

    v7 = [v6 dataContainerURL];
    v8 = [v7 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];

    if ([v6 isProfileValidated]) {
      v9 = @"sandboxReceipt";
    }
    else {
      v9 = @"receipt";
    }
    v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:0];

    if (v10)
    {
      v11 = [v10 path];
      v12 = +[ASFReceipt receiptWithContentsOfFile:v11];

      goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (id)receiptWithContentsOfFile:(id)a3
{
  id v3 = a3;
  id v4 = [[ASFReceipt alloc] initWithContentsOfFile:v3];

  return v4;
}

- (ASFReceipt)initWithContentsOfFile:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    v6 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  id v15 = 0;
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:0 error:&v15];
  id v7 = v15;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v10 = [v8 code];

      if (v10 == 260) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (ASFLogHandleForCategory_onceToken != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    }
    v13 = ASFLogHandleForCategory_logHandles_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_error_impl(&dword_21835E000, v13, OS_LOG_TYPE_ERROR, "Error reading receipt: %{public}@", buf, 0xCu);
    }
  }
LABEL_16:

  if (!v6) {
    goto LABEL_8;
  }
  v11 = [(ASFReceipt *)self initWithData:v6];
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v14 = v5;
  self = (ASFReceipt *)v11->_path;
  v11->_path = v14;
LABEL_9:

LABEL_10:
  return v11;
}

+ (id)receiptFromBundleAtPath:(id)a3
{
  if (a3)
  {
    id v3 = objc_msgSend(NSURL, "fileURLWithPath:");
    id v4 = +[ASFReceipt receiptFromBundleAtURL:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)receiptWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[ASFReceipt alloc] initWithData:v3];

  return v4;
}

- (ASFReceipt)initWithData:(id)a3
{
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v219.receiver = self;
  v219.super_class = (Class)ASFReceipt;
  id v5 = [(ASFReceipt *)&v219 init];
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v6 = objc_opt_new();
  mutableIAPs = v5->_mutableIAPs;
  v5->_mutableIAPs = (NSMutableArray *)v6;

  if (![v4 length]) {
    goto LABEL_28;
  }
  id v8 = v4;
  *(void *)&long long v222 = 0;
  if (SecCmsDecoderCreate())
  {
    if (!v5->_verbose) {
      goto LABEL_22;
    }
    if (ASFLogHandleForCategory_onceToken != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    }
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Could not create decoder";
LABEL_21:
    _os_log_error_impl(&dword_21835E000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
LABEL_22:
    if ((void)v222) {
      SecCmsDecoderDestroy();
    }

    BOOL v12 = 0;
    goto LABEL_25;
  }
  id v11 = v8;
  [v11 bytes];
  [v11 length];
  if (SecCmsDecoderUpdate())
  {
    if (!v5->_verbose) {
      goto LABEL_22;
    }
    if (ASFLogHandleForCategory_onceToken != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    }
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Could not read data";
    goto LABEL_21;
  }
  if (SecCmsDecoderFinish())
  {
    if (!v5->_verbose) {
      goto LABEL_22;
    }
    if (ASFLogHandleForCategory_onceToken != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    }
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Could not parse data";
    goto LABEL_21;
  }

  v23 = (void *)MEMORY[0x21D468810](0);
  if (!v23 || !*v23)
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v176 = ASFLogHandleForCategory_logHandles_0;
      BOOL v12 = 0;
      if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_281;
      }
      LOWORD(v222) = 0;
      _os_log_impl(&dword_21835E000, v176, OS_LOG_TYPE_DEFAULT, "No content", (uint8_t *)&v222, 2u);
    }
LABEL_227:
    BOOL v12 = 0;
    goto LABEL_281;
  }
  v24 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v23[1] length:*v23];
  v25 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v24, 0);
  v26 = v25;
  if (!v25 || v25[2] != 17)
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v179 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        _os_log_error_impl(&dword_21835E000, v179, OS_LOG_TYPE_ERROR, "Failed to parse data", (uint8_t *)&v222, 2u);
      }
    }

    goto LABEL_227;
  }
  v216 = v24;
  v27 = v25;
  if (v5->_verbose)
  {
    if (ASFLogHandleForCategory_onceToken != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    }
    v28 = ASFLogHandleForCategory_logHandles_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v222) = 0;
      _os_log_impl(&dword_21835E000, v28, OS_LOG_TYPE_DEFAULT, "Parsing receipt", (uint8_t *)&v222, 2u);
    }
  }
  v29 = -[ASFAsn1SetToken nextToken]((uint64_t)v27);
  if (v29)
  {
    unint64_t v30 = 0x26ACFE000uLL;
    unint64_t v31 = 0x26ACFE000uLL;
    unint64_t v32 = 0x26ACFE000uLL;
    v215 = v27;
    while (1)
    {
      context = (void *)MEMORY[0x21D468910]();
      id v34 = objc_getProperty(v29, v33, 24, 1);
      v35 = +[ASFAsn1ReceiptToken readFromBuffer:](v30 + 704, v34);

      if (v35) {
        break;
      }
LABEL_194:

      uint64_t v173 = -[ASFAsn1SetToken nextToken]((uint64_t)v27);

      v29 = (void *)v173;
      if (!v173) {
        goto LABEL_228;
      }
    }
    switch(v35[1])
    {
      case 0:
        uint64_t v37 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        receiptType = v5->_receiptType;
        v5->_receiptType = (NSString *)v37;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v39 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v5->_receiptType;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v40;
            v41 = v39;
            v42 = "Receipt type: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 1:
        uint64_t v43 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        itemID = v5->_itemID;
        v5->_itemID = (NSNumber *)v43;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v45 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v5->_itemID;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v46;
            v41 = v45;
            v42 = "AdamID: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 2:
        id v47 = objc_getProperty(v35, v36, 24, 1);
        v49 = v47;
        if (v47) {
          id Property = objc_getProperty(v47, v48, 24, 1);
        }
        else {
          id Property = 0;
        }
        objc_storeStrong((id *)&v5->_bundleIDData, Property);

        uint64_t v51 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v51;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v53 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v5->_bundleID;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v54;
            v41 = v53;
            v42 = "BundleID: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 3:
        uint64_t v55 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        bundleVersion = v5->_bundleVersion;
        v5->_bundleVersion = (NSString *)v55;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v57 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = v5->_bundleVersion;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v58;
            v41 = v57;
            v42 = "Application version: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 4:
        unint64_t v59 = v31;
        unint64_t v60 = v30;
        if (!-[ASFAsn1ReceiptToken contentIsAnInteger]((uint64_t)v35)) {
          goto LABEL_181;
        }
        id v62 = objc_getProperty(v35, v61, 24, 1);
        v64 = v62;
        if (v62) {
          id v62 = objc_getProperty(v62, v63, 24, 1);
        }
        id v65 = v62;
        uint64_t v66 = [v65 length];

        if (v66)
        {
          v67 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
          uint64_t v68 = [v67 stringValue];
          opaqueDSIDString = v5->_opaqueDSIDString;
          v5->_opaqueDSIDString = (NSString *)v68;
        }
        else
        {
LABEL_181:
          id v160 = objc_getProperty(v35, v61, 24, 1);
          v162 = v160;
          if (v160) {
            id v160 = objc_getProperty(v160, v161, 24, 1);
          }
          id v163 = v160;
          uint64_t v164 = [v163 length];

          if (!v164)
          {
LABEL_188:
            unint64_t v30 = v60;
            unint64_t v31 = v59;
            unint64_t v32 = 0x26ACFE000uLL;
            if (v5->_verbose)
            {
              if (*(void *)(v31 + 1136) != -1) {
                dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
              }
              uint64_t v171 = ASFLogHandleForCategory_logHandles_0;
              if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
              {
                v172 = v5->_opaqueDSIDString;
                LODWORD(v222) = 138543362;
                *(void *)((char *)&v222 + 4) = v172;
                v41 = v171;
                v42 = "DSID: %{public}@";
                goto LABEL_193;
              }
            }
            goto LABEL_194;
          }
          id v166 = objc_getProperty(v35, v165, 24, 1);
          v168 = v166;
          if (v166) {
            id v169 = objc_getProperty(v166, v167, 24, 1);
          }
          else {
            id v169 = 0;
          }
          objc_storeStrong((id *)&v5->_opaqueDSIDData, v169);

          uint64_t v170 = [(NSData *)v5->_opaqueDSIDData base64EncodedStringWithOptions:0];
          v67 = v5->_opaqueDSIDString;
          v5->_opaqueDSIDString = (NSString *)v170;
        }

        goto LABEL_188;
      case 5:
        id v70 = objc_getProperty(v35, v36, 24, 1);
        v72 = v70;
        if (v70) {
          id v70 = objc_getProperty(v70, v71, 24, 1);
        }
        v73 = (NSData *)v70;

        sha1 = v5->_sha1;
        v5->_sha1 = v73;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v75 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            v76 = v5->_sha1;
            v77 = v75;
            v78 = [(NSData *)v76 base64EncodedStringWithOptions:0];
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v78;
            _os_log_impl(&dword_21835E000, v77, OS_LOG_TYPE_DEFAULT, "SHA1: %{public}@", (uint8_t *)&v222, 0xCu);
          }
        }
        goto LABEL_194;
      case 8:
        v79 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        uint64_t v80 = _readStringDate(v79);
        purchaseDate = v5->_purchaseDate;
        v5->_purchaseDate = (NSDate *)v80;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v82 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            v83 = v5->_purchaseDate;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v83;
            v41 = v82;
            v42 = "Transaction date: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 9:
        uint64_t v84 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        frToolVersion = v5->_frToolVersion;
        v5->_frToolVersion = (NSNumber *)v84;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v86 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            v87 = v5->_frToolVersion;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v87;
            v41 = v86;
            v42 = "FR tool version: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xALL:
        uint64_t v88 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        parentalControls = v5->_parentalControls;
        v5->_parentalControls = (NSString *)v88;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v90 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v91 = v5->_parentalControls;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v91;
            v41 = v90;
            v42 = "Parental controls: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xBLL:
        v92 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        uint64_t v93 = [v92 stringValue];
        developerID = v5->_developerID;
        v5->_developerID = (NSString *)v93;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v95 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            v96 = v5->_developerID;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v96;
            v41 = v95;
            v42 = "DeveloperID: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xCLL:
        v97 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        uint64_t v98 = _readStringDate(v97);
        creationDate = v5->_creationDate;
        v5->_creationDate = (NSDate *)v98;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v100 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            v101 = v5->_creationDate;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v101;
            v41 = v100;
            v42 = "Receipt created: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xDLL:
        uint64_t v102 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        frAppVersion = v5->_frAppVersion;
        v5->_frAppVersion = (NSString *)v102;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v104 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            v105 = v5->_frAppVersion;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v105;
            v41 = v104;
            v42 = "FR app version: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xELL:
        v106 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        uint64_t v107 = [v106 stringValue];
        hwtype = v5->_hwtype;
        v5->_hwtype = (NSString *)v107;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v109 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            v110 = v5->_hwtype;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v110;
            v41 = v109;
            v42 = "HW type: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0xFLL:
        v111 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        uint64_t v112 = [v111 stringValue];
        downloadID = v5->_downloadID;
        v5->_downloadID = (NSString *)v112;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v114 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            v115 = v5->_downloadID;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v115;
            v41 = v114;
            v42 = "DownloadID: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0x10:
        v116 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35)];
        uint64_t v117 = [v116 stringValue];
        installerVersionID = v5->_installerVersionID;
        v5->_installerVersionID = (NSString *)v117;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v119 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
          {
            v120 = v5->_installerVersionID;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v120;
            v41 = v119;
            v42 = "Installer versionID: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0x11:
        id v121 = objc_getProperty(v35, v36, 24, 1);
        v123 = v121;
        if (v121) {
          id v121 = objc_getProperty(v121, v122, 24, 1);
        }
        id v124 = v121;

        id v125 = v124;
        if (!v125)
        {
          if (v5->_verbose)
          {
            if (*(void *)(v31 + 1136) != -1) {
              dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
            }
            v174 = *(NSObject **)(v32 + 1104);
            if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v222) = 0;
              _os_log_error_impl(&dword_21835E000, v174, OS_LOG_TYPE_ERROR, "Failed to load data", (uint8_t *)&v222, 2u);
            }
          }
          goto LABEL_210;
        }
        v126 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v125, 0);
        if (v126 && v126[2] == 17)
        {
          id v213 = v125;
          v214 = v126;
          v127 = v126;
          v128 = objc_opt_new();
          v217 = v127;
          v129 = -[ASFAsn1SetToken nextToken]((uint64_t)v127);
          if (v129)
          {
            do
            {
              v130 = (void *)MEMORY[0x21D468910]();
              id v132 = objc_getProperty(v129, v131, 24, 1);
              uint64_t v133 = +[ASFAsn1ReceiptIAPToken readFromBuffer:]((uint64_t)ASFAsn1ReceiptIAPToken, v132);

              if (v133)
              {
                switch(*(void *)(v133 + 8))
                {
                  case 0x6A5:
                    v135 = [NSNumber numberWithUnsignedLongLong:-[ASFAsn1ReceiptIAPToken integerValue](v133)];
                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 40;
                    break;
                  case 0x6A6:
                    v135 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v133);
                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 32;
                    break;
                  case 0x6A7:
                    v135 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v133);
                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 48;
                    break;
                  case 0x6A8:
                    v139 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v133);
                    v135 = _readStringDate(v139);

                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 24;
                    break;
                  case 0x6A9:
                    v135 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v133);
                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 16;
                    break;
                  case 0x6AALL:
                    v140 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v133);
                    v135 = _readStringDate(v140);

                    if (!v128) {
                      goto LABEL_158;
                    }
                    v136 = v128;
                    v137 = v135;
                    ptrdiff_t v138 = 8;
                    break;
                  default:
                    goto LABEL_159;
                }
                objc_setProperty_atomic_copy(v136, v134, v137, v138);
LABEL_158:
              }
LABEL_159:

              uint64_t v141 = -[ASFAsn1SetToken nextToken]((uint64_t)v217);

              v129 = (void *)v141;
            }
            while (v141);
          }

          unint64_t v30 = 0x26ACFE000;
          unint64_t v31 = 0x26ACFE000;
          unint64_t v32 = 0x26ACFE000;
          id v125 = v213;
        }
        else
        {
          if (!v5->_verbose)
          {
            v128 = 0;
LABEL_208:

            if (v128)
            {
              [(NSMutableArray *)v5->_mutableIAPs addObject:v128];

LABEL_211:
              v27 = v215;

              goto LABEL_194;
            }
LABEL_210:
            NSLog(&cfstr_DecodeIapsFail.isa, v213);
            goto LABEL_211;
          }
          v214 = v126;
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v175 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v222) = 0;
            _os_log_error_impl(&dword_21835E000, v175, OS_LOG_TYPE_ERROR, "Failed to parse data", (uint8_t *)&v222, 2u);
          }
          v128 = 0;
        }
        v126 = v214;
        goto LABEL_208;
      case 0x15:
        v142 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        uint64_t v143 = _readStringDate(v142);
        expirationDate = v5->_expirationDate;
        v5->_expirationDate = (NSDate *)v143;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v145 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
          {
            v146 = v5->_expirationDate;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v146;
            v41 = v145;
            v42 = "Receipt expires: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0x16:
        v147 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        uint64_t v148 = _readStringDate(v147);
        renewalDate = v5->_renewalDate;
        v5->_renewalDate = (NSDate *)v148;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v150 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
          {
            v151 = v5->_renewalDate;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v151;
            v41 = v150;
            v42 = "Receipt renewal: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0x17:
        uint64_t v152 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        organizationDisplayName = v5->_organizationDisplayName;
        v5->_organizationDisplayName = (NSString *)v152;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v154 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
          {
            v155 = v5->_organizationDisplayName;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v155;
            v41 = v154;
            v42 = "Organization display name: %{public}@";
            goto LABEL_193;
          }
        }
        goto LABEL_194;
      case 0x18:
        uint64_t v156 = -[ASFAsn1ReceiptIAPToken stringValue]((void **)v35);
        cancellationReason = v5->_cancellationReason;
        v5->_cancellationReason = (NSString *)v156;

        if (v5->_verbose)
        {
          if (*(void *)(v31 + 1136) != -1) {
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          }
          v158 = *(NSObject **)(v32 + 1104);
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
          {
            v159 = v5->_cancellationReason;
            LODWORD(v222) = 138543362;
            *(void *)((char *)&v222 + 4) = v159;
            v41 = v158;
            v42 = "Cancellation reason: %{public}@";
LABEL_193:
            _os_log_impl(&dword_21835E000, v41, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v222, 0xCu);
          }
        }
        goto LABEL_194;
      default:
        goto LABEL_194;
    }
  }
LABEL_228:

  int v180 = SecCmsMessageContentLevelCount();
  if (v180 >= 1)
  {
    int v181 = v180;
    for (int i = 0; i != v181; ++i)
    {
      SecCmsMessageContentLevel();
      if (SecCmsContentInfoGetContentTypeTag() == 26 && SecCmsContentInfoGetContent()) {
        break;
      }
    }
  }
  CFDateRef v183 = v5->_creationDate;
  *(void *)buf = 0;
  uint64_t CertificateList = SecCmsSignedDataGetCertificateList();
  if (!CertificateList) {
    goto LABEL_303;
  }
  v185 = (uint64_t *)CertificateList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v187 = *v185;
  if (*v185)
  {
    v188 = v185 + 1;
    do
    {
      CFDataRef v189 = CFDataCreate(0, *(const UInt8 **)(v187 + 8), *(void *)v187);
      if (v189)
      {
        CFDataRef v190 = v189;
        SecCertificateRef v191 = SecCertificateCreateWithData(0, v189);
        if (v191)
        {
          SecCertificateRef v192 = v191;
          CFArrayAppendValue(Mutable, v191);
          CFRelease(v192);
        }
        CFRelease(v190);
      }
      uint64_t v193 = *v188++;
      uint64_t v187 = v193;
    }
    while (v193);
  }
  if (!Mutable)
  {
LABEL_303:
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v196 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        _os_log_error_impl(&dword_21835E000, v196, OS_LOG_TYPE_ERROR, "Could not read certificates", (uint8_t *)&v222, 2u);
      }
    }
    uint64_t v197 = 0xFFFFLL;
    goto LABEL_278;
  }
  if (SecTrustCreateWithCertificates(Mutable, 0, (SecTrustRef *)buf))
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Could not create trust";
LABEL_300:
        _os_log_error_impl(&dword_21835E000, v194, OS_LOG_TYPE_ERROR, v195, (uint8_t *)&v222, 2u);
      }
    }
    goto LABEL_276;
  }
  v198 = *(__SecTrust **)buf;
  CFMutableArrayRef v199 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 3, MEMORY[0x263EFFF70]);
  uint64_t v200 = 0;
  uint64_t v201 = *MEMORY[0x263F174A0];
  *(void *)&long long v222 = *MEMORY[0x263F17498];
  *((void *)&v222 + 1) = v201;
  char v202 = 1;
  do
  {
    char v203 = v202;
    SecPolicyRef v204 = SecPolicyCreateWithProperties(*((CFTypeRef *)&v222 + v200), 0);
    if (!v204)
    {
      v205 = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!v205)
      {
LABEL_271:
        CFRelease(v199);
        goto LABEL_272;
      }
LABEL_260:
      v206 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", 3, v213);
      CFDictionaryAddValue(v205, (const void *)*MEMORY[0x263F174B0], v206);
      SecPolicyRef v207 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x263F17490], v205);
      if (v207)
      {
        SecPolicyRef v208 = v207;
        CFArrayAppendValue(v199, v207);
        CFRelease(v208);
        CFRelease(v205);

        if (v204) {
          goto LABEL_262;
        }
      }
      else
      {
        CFRelease(v205);
      }
      goto LABEL_271;
    }
    CFArrayAppendValue(v199, v204);
    CFRelease(v204);
    char v202 = 0;
    uint64_t v200 = 1;
  }
  while ((v203 & 1) != 0);
  v205 = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v205) {
    goto LABEL_260;
  }
LABEL_262:
  OSStatus v209 = SecTrustSetPolicies(v198, v199);
  CFRelease(v199);
  if (v209)
  {
LABEL_272:
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Failed to update policies";
        goto LABEL_300;
      }
    }
    goto LABEL_276;
  }
  if (v183 && SecTrustSetVerifyDate(*(SecTrustRef *)buf, v183))
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Could not set verification date";
        goto LABEL_300;
      }
    }
  }
  else
  {
    CFErrorRef error = 0;
    BOOL v210 = SecTrustEvaluateWithError(*(SecTrustRef *)buf, &error);
    CFErrorRef v211 = error;
    if (error)
    {
      if (v5->_verbose)
      {
        if (ASFLogHandleForCategory_onceToken != -1) {
          dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
        }
        v212 = ASFLogHandleForCategory_logHandles_0;
        if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v222) = 138543362;
          *(void *)((char *)&v222 + 4) = error;
          _os_log_impl(&dword_21835E000, v212, OS_LOG_TYPE_DEFAULT, "Error evaluating trust: %{public}@", (uint8_t *)&v222, 0xCu);
        }
        CFErrorRef v211 = error;
      }
      CFRelease(v211);
    }
    if (v210)
    {
      if (error) {
        uint64_t v197 = 0xFFFFLL;
      }
      else {
        uint64_t v197 = 0;
      }
      goto LABEL_277;
    }
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Failed to evaluate trust";
        goto LABEL_300;
      }
    }
  }
LABEL_276:
  uint64_t v197 = 0xFFFFLL;
LABEL_277:
  CFRelease(Mutable);
LABEL_278:
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }

  BOOL v12 = v197 != 0xFFFF;
LABEL_281:
  SecCmsMessageDestroy();
LABEL_25:
  if ([(NSMutableArray *)v5->_mutableIAPs count])
  {
    uint64_t v13 = [(NSMutableArray *)v5->_mutableIAPs copy];
    iaps = v5->_iaps;
    v5->_iaps = (NSArray *)v13;
  }
  if (!v12)
  {
LABEL_28:
    if ([(NSString *)v5->_receiptType hasSuffix:@"Stub"])
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      id v15 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        uint64_t v17 = [v4 length];
        LODWORD(v222) = 134217984;
        *(void *)((char *)&v222 + 4) = v17;
        uint64_t v18 = "Allowing invalid receipt because it is a stub receipt [%{iec-bytes}ld]";
        goto LABEL_38;
      }
    }
    else if ([(NSString *)v5->_receiptType isEqualToString:@"Xcode"])
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v19 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v16 = v19;
        uint64_t v20 = [v4 length];
        LODWORD(v222) = 134217984;
        *(void *)((char *)&v222 + 4) = v20;
        uint64_t v18 = "Allowing invalid receipt because it is an StoreKit testing receipt [%{iec-bytes}ld]";
LABEL_38:
        _os_log_error_impl(&dword_21835E000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v222, 0xCu);
      }
    }
    else
    {
      if (ASFLogHandleForCategory_onceToken != -1) {
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v21 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v177 = v21;
        uint64_t v178 = [v4 length];
        LODWORD(v222) = 134217984;
        *(void *)((char *)&v222 + 4) = v178;
        _os_log_error_impl(&dword_21835E000, v177, OS_LOG_TYPE_ERROR, "Invalid receipt [%{iec-bytes}ld]", (uint8_t *)&v222, 0xCu);
      }
      id v5 = 0;
    }
  }
LABEL_44:

  return v5;
}

- (BOOL)isDSIDless
{
  downloadID = self->_downloadID;
  if (!downloadID
    || (LODWORD(v4) = [(NSString *)downloadID isEqualToString:@"0"], v4))
  {
    NSUInteger v4 = [(NSString *)self->_opaqueDSIDString length];
    if (v4)
    {
      if ([(NSString *)self->_opaqueDSIDString isEqualToString:@"0"]) {
        LOBYTE(v4) = 0;
      }
      else {
        LOBYTE(v4) = ![(NSString *)self->_receiptType isEqualToString:@"ProductionSandbox"];
      }
    }
  }
  return v4;
}

- (BOOL)isRevoked
{
  return [(NSString *)self->_cancellationReason length] != 0;
}

- (BOOL)isVPPLicensed
{
  return self->_renewalDate != 0;
}

- (NSData)receiptData
{
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:self->_path];
}

- (NSString)receiptDataString
{
  v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:self->_path];
  id v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)bundleIDData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)cancellationReason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)developerID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)downloadID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)frAppVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)frToolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)hwtype
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)installerVersionID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)iaps
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)opaqueDSIDData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)opaqueDSIDString
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)organizationDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)parentalControls
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)receiptType
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)renewalDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (NSData)sha1
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

@end