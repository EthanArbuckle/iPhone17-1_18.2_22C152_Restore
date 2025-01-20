@interface RequestStoreItem
- (NSDate)createdDate;
- (NSDate)modifiedDate;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
- (NSString)itemDescription;
- (NSString)itemIdentifier;
- (NSString)itemTitle;
- (NSString)localizedPrice;
- (NSString)offerName;
- (NSString)priceSummary;
- (NSString)productType;
- (NSString)productTypeName;
- (NSString)requestIdentifier;
- (NSString)requestString;
- (NSString)requestSummary;
- (NSString)requesterDSID;
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (RequestLocalizations)localizations;
- (RequestStoreItem)initWithDictionary:(id)a3;
- (RequestStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 ageRating:(id)a6 approverDSID:(id)a7 requesterDSID:(id)a8 createdDate:(id)a9 modifiedDate:(id)a10 itemDesc:(id)a11 itemTitle:(id)a12 localizedPrice:(id)a13 previewURL:(id)a14 productType:(id)a15 productTypeName:(id)a16 productURL:(id)a17 offerName:(id)a18 requestString:(id)a19 requestSummary:(id)a20 priceSummary:(id)a21 status:(int64_t)a22 starRating:(id)a23 thumbnailURLString:(id)a24;
- (RequestStoreItem)initWithRequest:(id)a3;
- (id)compile;
- (id)description;
- (int64_t)status;
- (void)setAgeRating:(id)a3;
- (void)setApproverDSID:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setLocalizations:(id)a3;
- (void)setLocalizedPrice:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setOfferName:(id)a3;
- (void)setPriceSummary:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestString:(id)a3;
- (void)setRequestSummary:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setThumbnailURLString:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation RequestStoreItem

- (RequestStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 ageRating:(id)a6 approverDSID:(id)a7 requesterDSID:(id)a8 createdDate:(id)a9 modifiedDate:(id)a10 itemDesc:(id)a11 itemTitle:(id)a12 localizedPrice:(id)a13 previewURL:(id)a14 productType:(id)a15 productTypeName:(id)a16 productURL:(id)a17 offerName:(id)a18 requestString:(id)a19 requestSummary:(id)a20 priceSummary:(id)a21 status:(int64_t)a22 starRating:(id)a23 thumbnailURLString:(id)a24
{
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  id v38 = a17;
  id v40 = a18;
  id v39 = a19;
  id v37 = a20;
  id v36 = a21;
  id v35 = a23;
  id v34 = a24;
  v55.receiver = self;
  v55.super_class = (Class)RequestStoreItem;
  v29 = [(RequestStoreItem *)&v55 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_ageRating, a6);
    objc_storeStrong((id *)&v30->_approverDSID, a7);
    objc_storeStrong((id *)&v30->_createdDate, a9);
    objc_storeStrong((id *)&v30->_itemDescription, a11);
    objc_storeStrong((id *)&v30->_itemIdentifier, a3);
    objc_storeStrong((id *)&v30->_itemTitle, a12);
    objc_storeStrong((id *)&v30->_localizedPrice, a13);
    objc_storeStrong((id *)&v30->_modifiedDate, a10);
    objc_storeStrong((id *)&v30->_offerName, a18);
    objc_storeStrong((id *)&v30->_previewURL, a14);
    objc_storeStrong((id *)&v30->_priceSummary, a21);
    objc_storeStrong((id *)&v30->_productType, a15);
    objc_storeStrong((id *)&v30->_productTypeName, a16);
    objc_storeStrong((id *)&v30->_productURL, a17);
    objc_storeStrong((id *)&v30->_requestIdentifier, a4);
    objc_storeStrong((id *)&v30->_requestString, a19);
    objc_storeStrong((id *)&v30->_requestSummary, a20);
    objc_storeStrong((id *)&v30->_requesterDSID, a8);
    objc_storeStrong((id *)&v30->_starRating, a23);
    v30->_status = a22;
    objc_storeStrong((id *)&v30->_thumbnailURLString, a24);
    objc_storeStrong((id *)&v30->_uniqueIdentifier, a5);
  }

  return v30;
}

- (RequestStoreItem)initWithRequest:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)RequestStoreItem;
  v5 = [(RequestStoreItem *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 ageRating];
    ageRating = v5->_ageRating;
    v5->_ageRating = (NSString *)v6;

    uint64_t v8 = [v4 approverDSID];
    approverDSID = v5->_approverDSID;
    v5->_approverDSID = (NSString *)v8;

    uint64_t v10 = [v4 createdDate];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v10;

    uint64_t v12 = [v4 itemDescription];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v12;

    uint64_t v14 = [v4 itemIdentifier];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 itemTitle];
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v16;

    uint64_t v18 = [v4 localizedPrice];
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v18;

    uint64_t v20 = [v4 modifiedDate];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v20;

    uint64_t v22 = [v4 offerName];
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v22;

    uint64_t v24 = [v4 previewURL];
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v24;

    uint64_t v26 = [v4 priceSummary];
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v26;

    uint64_t v28 = [v4 productType];
    productType = v5->_productType;
    v5->_productType = (NSString *)v28;

    uint64_t v30 = [v4 productTypeName];
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v30;

    uint64_t v32 = [v4 productURL];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v32;

    uint64_t v34 = [v4 requestIdentifier];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v34;

    uint64_t v36 = [v4 requestString];
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v36;

    uint64_t v38 = [v4 requestSummary];
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v38;

    uint64_t v40 = [v4 requesterDSID];
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v40;

    uint64_t v42 = [v4 starRating];
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v42;

    v5->_status = (int64_t)[v4 status];
    uint64_t v44 = [v4 thumbnailURLString];
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v44;

    uint64_t v46 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v46;
  }
  return v5;
}

- (RequestStoreItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"ageRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [v4 objectForKeyedSubscript:@"approverDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v78 = v7;
  }
  else {
    id v78 = 0;
  }

  uint64_t v8 = [v4 objectForKeyedSubscript:@"requesterDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v76 = v8;
  }
  else {
    id v76 = 0;
  }

  v9 = [v4 objectForKeyedSubscript:@"itemDescription"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v4 objectForKeyedSubscript:@"itemTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v74 = v11;
  }
  else {
    id v74 = 0;
  }

  uint64_t v12 = [v4 objectForKeyedSubscript:@"localizedPrice"];
  objc_opt_class();
  v84 = self;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  uint64_t v14 = [v4 objectForKeyedSubscript:@"previewURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
LABEL_23:
    v85 = v15;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = +[NSURL URLWithString:v14];
    goto LABEL_23;
  }
  v85 = 0;
LABEL_25:

  uint64_t v16 = [v4 objectForKeyedSubscript:@"productType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v81 = v16;
  }
  else {
    id v81 = 0;
  }

  v17 = [v4 objectForKeyedSubscript:@"productTypeName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  v19 = [v4 objectForKeyedSubscript:@"productURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
LABEL_35:
    id v21 = v20;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = +[NSURL URLWithString:v19];
    goto LABEL_35;
  }
  id v21 = 0;
LABEL_37:

  uint64_t v22 = [v4 objectForKeyedSubscript:@"starRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

  uint64_t v24 = [v4 objectForKeyedSubscript:@"thumbnailURLString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v77 = v24;
  }
  else {
    id v77 = 0;
  }

  v25 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v83 = v25;
  }
  else {
    id v83 = 0;
  }

  uint64_t v26 = [v4 objectForKeyedSubscript:@"requestIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  v82 = v13;

  uint64_t v28 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  v79 = v6;
  v80 = v21;
  if (objc_opt_isKindOfClass()) {
    id v73 = v28;
  }
  else {
    id v73 = 0;
  }
  id v29 = v23;

  uint64_t v30 = [v4 objectForKeyedSubscript:@"createdTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;
LABEL_56:
    id v71 = v31;
    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  id v71 = 0;
LABEL_58:

  uint64_t v32 = [v4 objectForKeyedSubscript:@"modifiedTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v32;
LABEL_62:
    id v34 = v33;
    goto LABEL_64;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v32 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  id v34 = 0;
LABEL_64:

  id v35 = [v4 objectForKeyedSubscript:@"offerName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v67 = v35;
  }
  else {
    id v67 = 0;
  }

  uint64_t v36 = [v4 objectForKeyedSubscript:@"requestString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v69 = v36;
  }
  else {
    id v69 = 0;
  }
  id v37 = v27;
  v70 = v34;

  uint64_t v38 = [v4 objectForKeyedSubscript:@"requestSummary"];
  objc_opt_class();
  id v39 = v10;
  if (objc_opt_isKindOfClass()) {
    id v40 = v38;
  }
  else {
    id v40 = 0;
  }

  id v41 = [v4 objectForKeyedSubscript:@"priceSummary"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v42 = v41;
  }
  else {
    id v42 = 0;
  }
  id v68 = v40;

  id v43 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  uint64_t v44 = v74;
  if (objc_opt_isKindOfClass()) {
    id v45 = v43;
  }
  else {
    id v45 = 0;
  }

  uint64_t v46 = 0;
  v72 = v4;
  v66 = v39;
  v64 = v29;
  v65 = v18;
  v63 = v37;
  if (!v83 || !v37)
  {
    objc_super v55 = v83;
    v57 = v73;
    v56 = v71;
LABEL_85:
    id v51 = v69;
    id v54 = v70;
    id v48 = v45;
    objc_super v49 = v42;
    id v53 = v67;
    id v50 = v68;
    goto LABEL_86;
  }
  if (!v71)
  {
    objc_super v55 = v83;
    v56 = 0;
    v57 = v73;
    goto LABEL_85;
  }
  id v47 = [v45 integerValue];
  id v62 = v29;
  id v61 = v42;
  id v48 = v45;
  objc_super v49 = v42;
  id v50 = v68;
  id v51 = v69;
  id v52 = v37;
  id v60 = v18;
  id v53 = v67;
  id v54 = v70;
  id v59 = v39;
  objc_super v55 = v83;
  v56 = v71;
  v57 = v73;
  uint64_t v46 = objc_retain(-[RequestStoreItem initWithItemIdentifier:requestIdentifier:uniqueIdentifier:ageRating:approverDSID:requesterDSID:createdDate:modifiedDate:itemDesc:itemTitle:localizedPrice:previewURL:productType:productTypeName:productURL:offerName:requestString:requestSummary:priceSummary:status:starRating:thumbnailURLString:](v84, "initWithItemIdentifier:requestIdentifier:uniqueIdentifier:ageRating:approverDSID:requesterDSID:createdDate:modifiedDate:itemDesc:itemTitle:localizedPrice:previewURL:productType:productTypeName:productURL:offerName:requestString:requestSummary:priceSummary:status:starRating:thumbnailURLString:", v83, v52, v73, v79, v78, v76, v71, v70, v59, v74, v82, v85, v81, v60,
            v80,
            v67,
            v69,
            v68,
            v61,
            v47,
            v62,
            v77));
  v84 = v46;
LABEL_86:
  v75 = v46;

  return v75;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(RequestStoreItem *)self ageRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, @"ageRating");

  v5 = [(RequestStoreItem *)self approverDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"approverDSID");

  id v6 = [(RequestStoreItem *)self requesterDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, @"requesterDSID");

  v7 = [(RequestStoreItem *)self itemDescription];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, @"itemDescription");

  uint64_t v8 = [(RequestStoreItem *)self itemTitle];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v8, @"itemTitle");

  v9 = [(RequestStoreItem *)self localizedPrice];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v9, @"localizedPrice");

  id v10 = [(RequestStoreItem *)self previewURL];
  v11 = [v10 absoluteString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, @"previewURL");

  uint64_t v12 = [(RequestStoreItem *)self productType];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v12, @"productType");

  id v13 = [(RequestStoreItem *)self productTypeName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v13, @"productTypeName");

  uint64_t v14 = [(RequestStoreItem *)self productURL];
  id v15 = [v14 absoluteString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v15, @"productURL");

  uint64_t v16 = [(RequestStoreItem *)self starRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v16, @"starRating");

  v17 = [(RequestStoreItem *)self thumbnailURLString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v17, @"thumbnailURLString");

  id v18 = [(RequestStoreItem *)self itemIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v18, @"itemIdentifier");

  v19 = [(RequestStoreItem *)self localizations];
  id v20 = [v19 compile];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v20, @"localizations");

  id v21 = [(RequestStoreItem *)self offerName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v21, @"offerName");

  uint64_t v22 = [(RequestStoreItem *)self requestIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v22, @"requestIdentifier");

  id v23 = +[NSNumber numberWithInteger:[(RequestStoreItem *)self status]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v23, @"status");

  uint64_t v24 = [(RequestStoreItem *)self uniqueIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v24, @"uniqueIdentifier");

  v25 = [(RequestStoreItem *)self createdDate];
  [v25 timeIntervalSinceReferenceDate];
  uint64_t v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v26, @"createdTimeInterval");

  id v27 = [(RequestStoreItem *)self modifiedDate];
  [v27 timeIntervalSinceReferenceDate];
  uint64_t v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v28, @"modifiedTimeInterval");

  id v29 = [(RequestStoreItem *)self requestString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v29, @"requestString");

  uint64_t v30 = [(RequestStoreItem *)self requestSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v30, @"requestSummary");

  id v31 = [(RequestStoreItem *)self priceSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v31, @"priceSummary");

  return v3;
}

- (id)description
{
  id v3 = [(RequestStoreItem *)self compile];
  id v4 = [(RequestStoreItem *)self ap_generateDescriptionWithSubObjects:v3];

  return v4;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
}

- (NSString)approverDSID
{
  return self->_approverDSID;
}

- (void)setApproverDSID:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (void)setLocalizations:(id)a3
{
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (void)setLocalizedPrice:(id)a3
{
}

- (NSString)offerName
{
  return self->_offerName;
}

- (void)setOfferName:(id)a3
{
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSNumber)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (void)setThumbnailURLString:(id)a3
{
}

- (NSString)requestString
{
  return self->_requestString;
}

- (void)setRequestString:(id)a3
{
}

- (NSString)requestSummary
{
  return self->_requestSummary;
}

- (void)setRequestSummary:(id)a3
{
}

- (NSString)priceSummary
{
  return self->_priceSummary;
}

- (void)setPriceSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceSummary, 0);
  objc_storeStrong((id *)&self->_requestSummary, 0);
  objc_storeStrong((id *)&self->_requestString, 0);
  objc_storeStrong((id *)&self->_thumbnailURLString, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizedPrice, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_approverDSID, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
}

@end