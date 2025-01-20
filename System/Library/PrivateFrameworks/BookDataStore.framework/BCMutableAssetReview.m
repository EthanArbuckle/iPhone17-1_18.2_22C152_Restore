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
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F9080();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableAssetReview;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableAssetReview *)*((void *)v12 + 9);
    *((void *)v12 + 9) = v13;
LABEL_7:
  }
  return (BCMutableAssetReview *)v12;
}

- (BCMutableAssetReview)initWithCloudData:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)BCMutableAssetReview;
  v5 = [(BCMutableCloudData *)&v67 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_assetReviewID(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      assetReviewID = v5->_assetReviewID;
      v5->_assetReviewID = (NSString *)v23;

      v5->_starRating = objc_msgSend_starRating(v14, v25, v26, v27, v28, v29, v30, v31);
      v39 = objc_msgSend_reviewTitle(v14, v32, v33, v34, v35, v36, v37, v38);
      uint64_t v47 = objc_msgSend_copy(v39, v40, v41, v42, v43, v44, v45, v46);
      reviewTitle = v5->_reviewTitle;
      v5->_reviewTitle = (NSString *)v47;

      v56 = objc_msgSend_reviewBody(v14, v49, v50, v51, v52, v53, v54, v55);
      uint64_t v64 = objc_msgSend_copy(v56, v57, v58, v59, v60, v61, v62, v63);
      reviewBody = v5->_reviewBody;
      v5->_reviewBody = (NSString *)v64;
    }
    else
    {
      reviewBody = BDSCloudKitLog();
      if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR)) {
        sub_2361F8F04();
      }
      v56 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableAssetReview)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    reviewBody = BDSCloudKitLog();
    if (os_log_type_enabled(reviewBody, OS_LOG_TYPE_ERROR)) {
      sub_2361F90B4();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v44.receiver = self;
  v44.super_class = (Class)BCMutableAssetReview;
  uint64_t v11 = [(BCMutableCloudData *)&v44 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    assetReviewID = v11->_assetReviewID;
    v11->_assetReviewID = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, @"starRating", v15, v16, v17, v18, v19);
    self = (BCMutableAssetReview *)objc_claimAutoreleasedReturnValue();
    v11->_starRating = objc_msgSend_intValue(self, v20, v21, v22, v23, v24, v25, v26);
    uint64_t v33 = objc_msgSend_objectForKey_(v4, v27, @"reviewTitle", v28, v29, v30, v31, v32);
    reviewTitle = v11->_reviewTitle;
    v11->_reviewTitle = (NSString *)v33;

    uint64_t v41 = objc_msgSend_objectForKey_(v4, v35, @"reviewBody", v36, v37, v38, v39, v40);
    reviewBody = v11->_reviewBody;
    v11->_reviewBody = (NSString *)v41;
LABEL_7:
  }
  return v11;
}

- (NSString)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetReviewID(self, a2, v2, v3, v4, v5, v6, v7);
  int v18 = objc_msgSend_starRating(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_reviewTitle(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v34 = objc_msgSend_reviewBody(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v41 = objc_msgSend_stringWithFormat_(v9, v35, @"assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@", v36, v37, v38, v39, v40, v10, v18, v26, v34);

  return (NSString *)v41;
}

- (id)recordType
{
  return @"assetReview";
}

- (double)normalizedStarRating
{
  uint64_t v8 = NSNumber;
  uint64_t v9 = objc_msgSend_starRating(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_numberWithShort_(v8, v10, v9, v11, v12, v13, v14, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19, v20, v21, v22, v23);
  double v25 = v24 / 5.0;

  return v25;
}

- (void)setNormalizedStarRating:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, v5, v6, v7, v8, floor(a3 * 5.0));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v17 = objc_msgSend_integerValue(v24, v10, v11, v12, v13, v14, v15, v16);
  objc_msgSend_setStarRating_(self, v18, v17, v19, v20, v21, v22, v23);
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  v52.receiver = self;
  v52.super_class = (Class)BCMutableAssetReview;
  uint64_t v3 = [(BCMutableCloudData *)&v52 configuredRecordFromAttributes];
  uint64_t v4 = NSNumber;
  uint64_t v12 = objc_msgSend_starRating(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithShort_(v4, v13, v12, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v3, v20, (uint64_t)v19, @"starRating", v21, v22, v23, v24);

  uint64_t v32 = objc_msgSend_reviewTitle(self, v25, v26, v27, v28, v29, v30, v31);
  objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v32, @"reviewTitle", v34, v35, v36, v37);

  uint64_t v45 = objc_msgSend_reviewBody(self, v38, v39, v40, v41, v42, v43, v44);
  objc_msgSend_setObject_forKey_(v3, v46, (uint64_t)v45, @"reviewBody", v47, v48, v49, v50);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v44.receiver = self;
  v44.super_class = (Class)BCMutableAssetReview;
  id v4 = a3;
  [(BCMutableCloudData *)&v44 encodeWithCoder:v4];
  uint64_t v12 = objc_msgSend_starRating(self, v5, v6, v7, v8, v9, v10, v11, v44.receiver, v44.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v13, v12, @"starRating", v14, v15, v16, v17);
  double v25 = objc_msgSend_reviewTitle(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"reviewTitle", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_reviewBody(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"reviewBody", v40, v41, v42, v43);
}

- (BCMutableAssetReview)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BCMutableAssetReview;
  uint64_t v5 = [(BCMutableCloudData *)&v39 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    assetReviewID = v13->_assetReviewID;
    v13->_assetReviewID = (NSString *)v14;

    v13->_starRating = objc_msgSend_decodeIntForKey_(v4, v16, @"starRating", v17, v18, v19, v20, v21);
    uint64_t v22 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"reviewTitle", v24, v25, v26, v27);
    reviewTitle = v13->_reviewTitle;
    v13->_reviewTitle = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"reviewBody", v32, v33, v34, v35);
    reviewBody = v13->_reviewBody;
    v13->_reviewBody = (NSString *)v36;
  }
  return v13;
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