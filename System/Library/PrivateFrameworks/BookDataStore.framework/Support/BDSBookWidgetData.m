@interface BDSBookWidgetData
+ (BOOL)supportsSecureCoding;
- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 cloudAssetType:(id)a8 libraryAssetType:(id)a9;
- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 totalDuration:(id)a8 cloudAssetType:(id)a9 libraryAssetType:(id)a10;
- (BDSBookWidgetData)initWithCoder:(id)a3;
- (BOOL)hasSignificantDifferenceWith:(id)a3;
- (NSNumber)readingProgress;
- (NSNumber)totalDuration;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)coverURL;
- (NSString)libraryAssetType;
- (NSString)pageProgressionDirection;
- (NSString)title;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setCoverURL:(id)a3;
- (void)setLibraryAssetType:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setReadingProgress:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDuration:(id)a3;
@end

@implementation BDSBookWidgetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 totalDuration:(id)a8 cloudAssetType:(id)a9 libraryAssetType:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v17 = a9;
  v18 = (__CFString *)a10;
  v29.receiver = self;
  v29.super_class = (Class)BDSBookWidgetData;
  v19 = [(BDSBookWidgetData *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetID, a3);
    objc_storeStrong((id *)&v20->_title, a4);
    objc_storeStrong((id *)&v20->_pageProgressionDirection, a5);
    objc_storeStrong((id *)&v20->_coverURL, a6);
    objc_storeStrong((id *)&v20->_readingProgress, a7);
    objc_storeStrong((id *)&v20->_totalDuration, a8);
    objc_storeStrong((id *)&v20->_cloudAssetType, a9);
    if (v18) {
      v21 = v18;
    }
    else {
      v21 = @"LibraryContentAssetTypeUnknown";
    }
    objc_storeStrong((id *)&v20->_libraryAssetType, v21);
  }

  return v20;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 cloudAssetType:(id)a8 libraryAssetType:(id)a9
{
  return [(BDSBookWidgetData *)self initWithAssetID:a3 title:a4 pageProgressionDirection:a5 coverURL:a6 readingProgress:a7 totalDuration:0 cloudAssetType:a8 libraryAssetType:a9];
}

- (BDSBookWidgetData)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BDSBookWidgetData;
  v5 = [(BDSBookWidgetData *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pageProgressionDirection"];
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverURL"];
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingProgress"];
    readingProgress = v5->_readingProgress;
    v5->_readingProgress = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDuration"];
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudAssetType"];
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryContentAssetType"];
    libraryAssetType = v5->_libraryAssetType;
    v5->_libraryAssetType = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSBookWidgetData *)self assetID];
  [v4 encodeObject:v5 forKey:@"assetID"];

  uint64_t v6 = [(BDSBookWidgetData *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  v7 = [(BDSBookWidgetData *)self pageProgressionDirection];
  [v4 encodeObject:v7 forKey:@"pageProgressionDirection"];

  uint64_t v8 = [(BDSBookWidgetData *)self coverURL];
  [v4 encodeObject:v8 forKey:@"coverURL"];

  v9 = [(BDSBookWidgetData *)self readingProgress];
  [v4 encodeObject:v9 forKey:@"readingProgress"];

  uint64_t v10 = [(BDSBookWidgetData *)self totalDuration];
  [v4 encodeObject:v10 forKey:@"totalDuration"];

  v11 = [(BDSBookWidgetData *)self cloudAssetType];
  [v4 encodeObject:v11 forKey:@"cloudAssetType"];

  id v12 = [(BDSBookWidgetData *)self libraryAssetType];
  [v4 encodeObject:v12 forKey:@"libraryContentAssetType"];
}

- (BOOL)hasSignificantDifferenceWith:(id)a3
{
  id v4 = (BDSBookWidgetData *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self) {
      goto LABEL_59;
    }
    uint64_t v6 = [(BDSBookWidgetData *)self assetID];
    v7 = [(BDSBookWidgetData *)v5 assetID];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      id v11 = v8;
      if (!v9)
      {
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
      unsigned int v12 = [v8 isEqualToString:v9];

      if (!v12) {
        goto LABEL_43;
      }
    }
    uint64_t v14 = [(BDSBookWidgetData *)self readingProgress];
    v15 = [(BDSBookWidgetData *)v5 readingProgress];
    id v11 = v14;
    id v16 = v15;
    id v17 = v16;
    if (v11 == v16)
    {
    }
    else
    {
      id v18 = v11;
      if (!v16)
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      unsigned int v19 = [v11 isEqualToNumber:v16];

      if (!v19) {
        goto LABEL_41;
      }
    }
    uint64_t v20 = [(BDSBookWidgetData *)self totalDuration];
    v21 = [(BDSBookWidgetData *)v5 totalDuration];
    id v18 = v20;
    id v22 = v21;
    objc_super v23 = v22;
    if (v18 == v22)
    {
    }
    else
    {
      id v24 = v18;
      if (!v22)
      {
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      unsigned int v25 = [v18 isEqualToNumber:v22];

      if (!v25) {
        goto LABEL_39;
      }
    }
    id v26 = [(BDSBookWidgetData *)self title];
    id v27 = [(BDSBookWidgetData *)v5 title];
    id v24 = v26;
    id v28 = v27;
    v57 = v28;
    if (v24 == v28)
    {
    }
    else
    {
      id v29 = v24;
      if (!v28)
      {
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      unsigned int v55 = [v24 isEqualToString:v28];

      if (!v55) {
        goto LABEL_37;
      }
    }
    v56 = v23;
    v30 = [(BDSBookWidgetData *)self coverURL];
    v31 = [(BDSBookWidgetData *)v5 coverURL];
    id v29 = v30;
    id v32 = v31;
    v54 = v32;
    if (v29 == v32)
    {
    }
    else
    {
      v33 = v32;
      if (!v32)
      {

LABEL_35:
        objc_super v23 = v56;
        goto LABEL_36;
      }
      unsigned int v52 = [v29 isEqualToString:v32];

      if (!v52) {
        goto LABEL_35;
      }
    }
    id v50 = v29;
    v34 = [(BDSBookWidgetData *)self cloudAssetType];
    v35 = [(BDSBookWidgetData *)v5 cloudAssetType];
    id v36 = v34;
    id v37 = v35;
    v51 = v37;
    v53 = v36;
    if (v36 == v37)
    {
    }
    else
    {
      v38 = v37;
      if (!v37)
      {
        char v49 = 1;
LABEL_57:
        v40 = v50;

        char v39 = v49;
LABEL_58:

        if (v39)
        {
LABEL_44:
          v13 = sub_10000D068();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v5;
            __int16 v60 = 2112;
            v61 = self;
            goto LABEL_46;
          }
          goto LABEL_47;
        }
LABEL_59:
        BOOL v41 = 0;
        goto LABEL_60;
      }
      unsigned int v48 = [v36 isEqualToString:v37];

      if (!v48)
      {
        char v39 = 1;
        v40 = v50;
        goto LABEL_58;
      }
    }
    v42 = [(BDSBookWidgetData *)self libraryAssetType];
    v43 = [(BDSBookWidgetData *)v5 libraryAssetType];
    id v36 = v42;
    id v44 = v43;
    v45 = v44;
    if (v36 == v44)
    {
      char v49 = 0;
    }
    else
    {
      if (v44) {
        unsigned int v46 = [v36 isEqualToString:v44] ^ 1;
      }
      else {
        LOBYTE(v46) = 1;
      }
      char v49 = v46;
    }

    goto LABEL_57;
  }
  v13 = sub_10000D068();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v59 = 0;
    __int16 v60 = 2112;
    v61 = self;
LABEL_46:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found changes between %@ and %@:", buf, 0x16u);
  }
LABEL_47:

  BOOL v41 = 1;
LABEL_60:

  return v41;
}

- (id)description
{
  v3 = [(BDSBookWidgetData *)self assetID];
  id v4 = [(BDSBookWidgetData *)self title];
  v5 = [(BDSBookWidgetData *)self pageProgressionDirection];
  uint64_t v6 = [(BDSBookWidgetData *)self cloudAssetType];
  v7 = [(BDSBookWidgetData *)self libraryAssetType];
  id v8 = [(BDSBookWidgetData *)self readingProgress];
  [v8 doubleValue];
  double v10 = v9 * 100.0;
  id v11 = [(BDSBookWidgetData *)self totalDuration];
  unsigned int v12 = [(BDSBookWidgetData *)self coverURL];
  CFStringRef v13 = &stru_10026BED0;
  if (!v12) {
    CFStringRef v13 = @" missing coverURL";
  }
  uint64_t v14 = +[NSString stringWithFormat:@"[%@ '%@' %@ %@ %@ (%.0f%%) %@%@]", v3, v4, v5, v6, v7, *(void *)&v10, v11, v13];

  return v14;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)pageProgressionDirection
{
  return self->_pageProgressionDirection;
}

- (void)setPageProgressionDirection:(id)a3
{
}

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
{
}

- (NSNumber)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (NSString)libraryAssetType
{
  return self->_libraryAssetType;
}

- (void)setLibraryAssetType:(id)a3
{
}

- (NSNumber)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_libraryAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end