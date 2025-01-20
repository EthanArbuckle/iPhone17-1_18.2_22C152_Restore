@interface BCMutableAssetReview
+ (BOOL)supportsSecureCoding;
- (BCMutableAssetReview)initWithAssetReviewID:(id)a3;
- (BCMutableAssetReview)initWithCloudData:(id)a3;
- (BCMutableAssetReview)initWithCoder:(id)a3;
- (BCMutableAssetReview)initWithRecord:(id)a3;
- (NSString)assetReviewID;
- (NSString)description;
- (NSString)reviewBody;
- (NSString)reviewTitle;
- (NSString)userID;
- (double)normalizedStarRating;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (signed)starRating;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetReviewID:(id)a3;
- (void)setNormalizedStarRating:(double)a3;
- (void)setReviewBody:(id)a3;
- (void)setReviewTitle:(id)a3;
- (void)setStarRating:(signed __int16)a3;
- (void)setUserID:(id)a3;
@end

@implementation BCMutableAssetReview

- (BCMutableAssetReview)initWithAssetReviewID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E8DC0();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableAssetReview;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableAssetReview *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;
LABEL_7:
  }
  return (BCMutableAssetReview *)v5;
}

- (BCMutableAssetReview)initWithCloudData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCMutableAssetReview;
  id v5 = [(BCMutableCloudData *)&v18 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 assetReviewID];
      objc_super v9 = (NSString *)[v8 copy];
      assetReviewID = v5->_assetReviewID;
      v5->_assetReviewID = v9;

      v5->_starRating = (unsigned __int16)[v7 starRating];
      v11 = [v7 reviewTitle];
      v12 = (NSString *)[v11 copy];
      reviewTitle = v5->_reviewTitle;
      v5->_reviewTitle = v12;

      v14 = [v7 reviewBody];
      v15 = (NSString *)[v14 copy];
      reviewBody = v5->_reviewBody;
      v5->_reviewBody = v15;
    }
    else
    {
      reviewBody = sub_1000083A0();
      if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR)) {
        sub_1001E8DF4();
      }
      v14 = v5;
      id v5 = 0;
    }
  }
  return v5;
}

- (BCMutableAssetReview)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    reviewBody = sub_1000083A0();
    if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR)) {
      sub_1001E8E28();
    }
    id v5 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableAssetReview;
  id v5 = [(BCMutableCloudData *)&v13 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    assetReviewID = v5->_assetReviewID;
    v5->_assetReviewID = (NSString *)v6;

    self = [v4 objectForKey:@"starRating"];
    v5->_starRating = (unsigned __int16)[(BCMutableAssetReview *)self intValue];
    uint64_t v8 = [v4 objectForKey:@"reviewTitle"];
    reviewTitle = v5->_reviewTitle;
    v5->_reviewTitle = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"reviewBody"];
    reviewBody = v5->_reviewBody;
    v5->_reviewBody = (NSString *)v10;
LABEL_7:
  }
  return v5;
}

- (NSString)description
{
  v3 = [(BCMutableAssetReview *)self assetReviewID];
  signed int v4 = [(BCMutableAssetReview *)self starRating];
  id v5 = [(BCMutableAssetReview *)self reviewTitle];
  uint64_t v6 = [(BCMutableAssetReview *)self reviewBody];
  v7 = +[NSString stringWithFormat:@"assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (id)recordType
{
  return @"assetReview";
}

- (double)normalizedStarRating
{
  v2 = +[NSNumber numberWithShort:[(BCMutableAssetReview *)self starRating]];
  [v2 floatValue];
  double v4 = v3 / 5.0;

  return v4;
}

- (void)setNormalizedStarRating:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:floor(a3 * 5.0)];
  -[BCMutableAssetReview setStarRating:](self, "setStarRating:", (__int16)[v4 integerValue]);
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  v8.receiver = self;
  v8.super_class = (Class)BCMutableAssetReview;
  float v3 = [(BCMutableCloudData *)&v8 configuredRecordFromAttributes];
  id v4 = +[NSNumber numberWithShort:[(BCMutableAssetReview *)self starRating]];
  [v3 setObject:v4 forKey:@"starRating"];

  id v5 = [(BCMutableAssetReview *)self reviewTitle];
  [v3 setObject:v5 forKey:@"reviewTitle"];

  uint64_t v6 = [(BCMutableAssetReview *)self reviewBody];
  [v3 setObject:v6 forKey:@"reviewBody"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCMutableAssetReview;
  id v4 = a3;
  [(BCMutableCloudData *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", -[BCMutableAssetReview starRating](self, "starRating", v7.receiver, v7.super_class), @"starRating");
  id v5 = [(BCMutableAssetReview *)self reviewTitle];
  [v4 encodeObject:v5 forKey:@"reviewTitle"];

  uint64_t v6 = [(BCMutableAssetReview *)self reviewBody];
  [v4 encodeObject:v6 forKey:@"reviewBody"];
}

- (BCMutableAssetReview)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCMutableAssetReview;
  id v5 = [(BCMutableCloudData *)&v14 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    assetReviewID = v6->_assetReviewID;
    v6->_assetReviewID = (NSString *)v7;

    v6->_starRating = (unsigned __int16)[v4 decodeIntForKey:@"starRating"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reviewTitle"];
    reviewTitle = v6->_reviewTitle;
    v6->_reviewTitle = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reviewBody"];
    reviewBody = v6->_reviewBody;
    v6->_reviewBody = (NSString *)v11;
  }
  return v6;
}

- (NSString)assetReviewID
{
  return self->_assetReviewID;
}

- (void)setAssetReviewID:(id)a3
{
}

- (signed)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(signed __int16)a3
{
  self->_starRating = a3;
}

- (NSString)reviewTitle
{
  return self->_reviewTitle;
}

- (void)setReviewTitle:(id)a3
{
}

- (NSString)reviewBody
{
  return self->_reviewBody;
}

- (void)setReviewBody:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_reviewBody, 0);
  objc_storeStrong((id *)&self->_reviewTitle, 0);
  objc_storeStrong((id *)&self->_assetReviewID, 0);
}

@end