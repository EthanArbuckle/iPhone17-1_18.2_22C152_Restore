@interface BDSBookWidgetInfo
+ (BOOL)supportsSecureCoding;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8;
- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8 lastEngagedDate:(id)a9 isTrackedAsRecent:(BOOL)a10;
- (BDSBookWidgetInfo)initWithCoder:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isTrackedAsRecent;
- (NSDate)lastEngagedDate;
- (NSNumber)totalDuration;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)coverURL;
- (NSString)libraryContentAssetType;
- (NSString)pageProgressionDirection;
- (NSString)title;
- (id)description;
- (id)insertMatchingManagedObjectIntoContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setCoverURL:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setLibraryContentAssetType:(id)a3;
- (void)setPageProgressionDirection:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDuration:(id)a3;
@end

@implementation BDSBookWidgetInfo

- (id)insertMatchingManagedObjectIntoContext:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10003F594;
  v13 = sub_10003F5A4;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F5AC;
  v6[3] = &unk_10025FAC0;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSBookWidgetInfo;
  v6 = [(BDSBookWidgetInfo *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetID, a3);
  }

  return v7;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = [(BDSBookWidgetInfo *)self initWithAssetID:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v19->_coverURL, a5);
    objc_storeStrong((id *)&v19->_pageProgressionDirection, a6);
    objc_storeStrong((id *)&v19->_cloudAssetType, a7);
    objc_storeStrong((id *)&v19->_libraryContentAssetType, a8);
  }

  return v19;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8 lastEngagedDate:(id)a9 isTrackedAsRecent:(BOOL)a10
{
  id v17 = a9;
  v18 = [(BDSBookWidgetInfo *)self initWithAssetID:a3 title:a4 coverURL:a5 pageProgressionDirection:a6 cloudAssetType:a7 libraryContentAssetType:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_lastEngagedDate, a9);
    v19->_isTrackedAsRecent = a10;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(BDSBookWidgetInfo *)self assetID];
  [v12 encodeObject:v4 forKey:@"assetID"];

  id v5 = [(BDSBookWidgetInfo *)self title];
  [v12 encodeObject:v5 forKey:@"title"];

  v6 = [(BDSBookWidgetInfo *)self coverURL];
  [v12 encodeObject:v6 forKey:@"coverURL"];

  id v7 = [(BDSBookWidgetInfo *)self pageProgressionDirection];
  [v12 encodeObject:v7 forKey:@"pageProgressionDirection"];

  v8 = [(BDSBookWidgetInfo *)self libraryContentAssetType];
  [v12 encodeObject:v8 forKey:@"libraryContentAssetType"];

  objc_super v9 = [(BDSBookWidgetInfo *)self cloudAssetType];
  [v12 encodeObject:v9 forKey:@"cloudAssetType"];

  v10 = [(BDSBookWidgetInfo *)self totalDuration];
  [v12 encodeObject:v10 forKey:@"totalDuration"];

  uint64_t v11 = [(BDSBookWidgetInfo *)self lastEngagedDate];
  [v12 encodeObject:v11 forKey:@"lastEngagedDate"];

  objc_msgSend(v12, "encodeBool:forKey:", -[BDSBookWidgetInfo isTrackedAsRecent](self, "isTrackedAsRecent"), @"isTrackedAsRecent");
  objc_msgSend(v12, "encodeBool:forKey:", -[BDSBookWidgetInfo isExplicit](self, "isExplicit"), @"isExplicit");
}

- (BDSBookWidgetInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BDSBookWidgetInfo;
  id v5 = [(BDSBookWidgetInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverURL"];
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pageProgressionDirection"];
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryContentAssetType"];
    libraryContentAssetType = v5->_libraryContentAssetType;
    v5->_libraryContentAssetType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudAssetType"];
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDuration"];
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastEngagedDate"];
    lastEngagedDate = v5->_lastEngagedDate;
    v5->_lastEngagedDate = (NSDate *)v20;

    v5->_isTrackedAsRecent = [v4 decodeBoolForKey:@"isTrackedAsRecent"];
    v5->_isExplicit = [v4 decodeBoolForKey:@"isExplicit"];
  }

  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v3);
  id v15 = [(BDSBookWidgetInfo *)self assetID];
  uint64_t v14 = [(BDSBookWidgetInfo *)self title];
  id v4 = [(BDSBookWidgetInfo *)self cloudAssetType];
  id v5 = [(BDSBookWidgetInfo *)self lastEngagedDate];
  unsigned int v6 = [(BDSBookWidgetInfo *)self isTrackedAsRecent];
  id v7 = [(BDSBookWidgetInfo *)self coverURL];
  uint64_t v8 = +[NSNumber numberWithBool:[(BDSBookWidgetInfo *)self isExplicit]];
  objc_super v9 = [(BDSBookWidgetInfo *)self pageProgressionDirection];
  uint64_t v10 = [(BDSBookWidgetInfo *)self libraryContentAssetType];
  uint64_t v11 = [(BDSBookWidgetInfo *)self totalDuration];
  uint64_t v12 = +[NSString stringWithFormat:@"<%@:%p assetID=%@ title=%@ cloudAssetType=%@ lastEngagedDate=%@ isTrackedAsRecent=%d coverURL=%@ isExplicit=%@ pageProgressionDirection=%@ libraryContentAssetType=%@ duration=%@>", v16, self, v15, v14, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (NSString)libraryContentAssetType
{
  return self->_libraryContentAssetType;
}

- (void)setLibraryContentAssetType:(id)a3
{
}

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
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

- (NSNumber)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(id)a3
{
}

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_libraryContentAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end