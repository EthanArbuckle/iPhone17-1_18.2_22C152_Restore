@interface ApproverStoreItem
- (ApproverStoreItem)initWithDictionary:(id)a3;
- (ApproverStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 date:(id)a6;
- (ApproverStoreItem)initWithRequest:(id)a3 date:(id)a4;
- (BOOL)canSendViaMessages;
- (NSDate)createdDate;
- (NSDate)modifiedDate;
- (NSDictionary)requestInfo;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
- (NSString)itemBundleID;
- (NSString)itemDescription;
- (NSString)itemIdentifier;
- (NSString)itemTitle;
- (NSString)localizedPrice;
- (NSString)offerName;
- (NSString)priceSummary;
- (NSString)productType;
- (NSString)requestIdentifier;
- (NSString)requestString;
- (NSString)requestSummary;
- (NSString)requesterDSID;
- (NSString)requesterName;
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (RequestLocalizations)localizations;
- (id)compile;
- (id)description;
- (int64_t)status;
- (void)setAgeRating:(id)a3;
- (void)setApproverDSID:(id)a3;
- (void)setItemBundleID:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setLocalizedPrice:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setOfferName:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setRequesterName:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setThumbnailURLString:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation ApproverStoreItem

- (ApproverStoreItem)initWithRequest:(id)a3 date:(id)a4
{
  id v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)ApproverStoreItem;
  v6 = [(ApproverStoreItem *)&v54 init];
  if (v6)
  {
    uint64_t v7 = [v5 ageRating];
    ageRating = v6->_ageRating;
    v6->_ageRating = (NSString *)v7;

    uint64_t v9 = [v5 approverDSID];
    approverDSID = v6->_approverDSID;
    v6->_approverDSID = (NSString *)v9;

    v6->_canSendViaMessages = [v5 canSendViaMessages];
    uint64_t v11 = [v5 createdDate];
    createdDate = v6->_createdDate;
    v6->_createdDate = (NSDate *)v11;

    uint64_t v13 = [v5 modifiedDate];
    modifiedDate = v6->_modifiedDate;
    v6->_modifiedDate = (NSDate *)v13;

    uint64_t v15 = [v5 itemIdentifier];
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v15;

    uint64_t v17 = [v5 requestIdentifier];
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSString *)v17;

    uint64_t v19 = [v5 uniqueIdentifier];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v19;

    uint64_t v21 = [v5 itemTitle];
    itemTitle = v6->_itemTitle;
    v6->_itemTitle = (NSString *)v21;

    uint64_t v23 = [v5 itemDescription];
    itemDescription = v6->_itemDescription;
    v6->_itemDescription = (NSString *)v23;

    uint64_t v25 = [v5 localizedPrice];
    localizedPrice = v6->_localizedPrice;
    v6->_localizedPrice = (NSString *)v25;

    uint64_t v27 = [v5 itemBundleID];
    itemBundleID = v6->_itemBundleID;
    v6->_itemBundleID = (NSString *)v27;

    uint64_t v29 = [v5 localizations];
    localizations = v6->_localizations;
    v6->_localizations = (RequestLocalizations *)v29;

    uint64_t v31 = [v5 offerName];
    offerName = v6->_offerName;
    v6->_offerName = (NSString *)v31;

    uint64_t v33 = [v5 previewURL];
    previewURL = v6->_previewURL;
    v6->_previewURL = (NSURL *)v33;

    uint64_t v35 = [v5 productType];
    productType = v6->_productType;
    v6->_productType = (NSString *)v35;

    uint64_t v37 = [v5 thumbnailURLString];
    thumbnailURLString = v6->_thumbnailURLString;
    v6->_thumbnailURLString = (NSString *)v37;

    uint64_t v39 = [v5 requesterDSID];
    requesterDSID = v6->_requesterDSID;
    v6->_requesterDSID = (NSString *)v39;

    uint64_t v41 = [v5 requesterName];
    requesterName = v6->_requesterName;
    v6->_requesterName = (NSString *)v41;

    uint64_t v43 = [v5 requestInfo];
    requestInfo = v6->_requestInfo;
    v6->_requestInfo = (NSDictionary *)v43;

    uint64_t v45 = [v5 starRating];
    starRating = v6->_starRating;
    v6->_starRating = (NSNumber *)v45;

    v6->_status = (int64_t)[v5 status];
    uint64_t v47 = [v5 requestString];
    requestString = v6->_requestString;
    v6->_requestString = (NSString *)v47;

    uint64_t v49 = [v5 requestSummary];
    requestSummary = v6->_requestSummary;
    v6->_requestSummary = (NSString *)v49;

    uint64_t v51 = [v5 priceSummary];
    priceSummary = v6->_priceSummary;
    v6->_priceSummary = (NSString *)v51;
  }
  return v6;
}

- (ApproverStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ApproverStoreItem;
  uint64_t v15 = [(ApproverStoreItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_requestIdentifier, a4);
    objc_storeStrong((id *)&v16->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v16->_createdDate, a6);
  }

  return v16;
}

- (ApproverStoreItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v141.receiver = self;
  v141.super_class = (Class)ApproverStoreItem;
  id v5 = [(ApproverStoreItem *)&v141 init];

  if (!v5)
  {
LABEL_108:
    v52 = v5;
    goto LABEL_109;
  }
  v6 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    v8 = +[APLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[APLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543874;
      CFStringRef v143 = @"itemIdentifier";
      __int16 v144 = 2114;
      v145 = v11;
      __int16 v146 = 2114;
      v147 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);
    }
    id v7 = 0;
  }
  v138 = v7;
  id v14 = v7;

  uint64_t v15 = [v4 objectForKeyedSubscript:@"requestIdentifier"];
  objc_opt_class();
  v139 = v14;
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
  }
  else
  {
    uint64_t v17 = +[APLogConfig sharedConfig];
    if (!v17)
    {
      uint64_t v17 = +[APLogConfig sharedConfig];
    }
    objc_super v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543874;
      CFStringRef v143 = @"requestIdentifier";
      __int16 v144 = 2114;
      v145 = v20;
      __int16 v146 = 2114;
      v147 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      id v14 = v139;
    }

    id v16 = 0;
  }
  v137 = v16;
  id v140 = v16;

  uint64_t v23 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
  }
  else
  {
    uint64_t v25 = +[APLogConfig sharedConfig];
    if (!v25)
    {
      uint64_t v25 = +[APLogConfig sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      uint64_t v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138543874;
      CFStringRef v143 = @"uniqueIdentifier";
      __int16 v144 = 2114;
      v145 = v28;
      __int16 v146 = 2114;
      v147 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      id v14 = v139;
    }

    id v24 = 0;
  }
  v136 = v24;
  id v31 = v24;

  v32 = [v4 objectForKeyedSubscript:@"createdTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v32;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v32 doubleValue];
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v34 = v31;
      uint64_t v35 = +[APLogConfig sharedConfig];
      if (!v35)
      {
        uint64_t v35 = +[APLogConfig sharedConfig];
      }
      v36 = [v35 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        uint64_t v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138543618;
        CFStringRef v143 = @"createdTimeInterval";
        __int16 v144 = 2114;
        v145 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.", buf, 0x16u);

        id v14 = v139;
      }

      id v33 = 0;
      id v31 = v34;
    }
  }
  v135 = v33;
  id v39 = v33;

  v40 = [v4 objectForKeyedSubscript:@"modifiedTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
LABEL_36:
    v42 = v41;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v40 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  id v43 = v39;
  id v44 = v31;
  uint64_t v45 = +[APLogConfig sharedConfig];
  if (!v45)
  {
    uint64_t v45 = +[APLogConfig sharedConfig];
  }
  v46 = [v45 OSLogObject];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    uint64_t v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    *(_DWORD *)buf = 138543618;
    CFStringRef v143 = @"modifiedTimeInterval";
    __int16 v144 = 2114;
    v145 = v48;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.", buf, 0x16u);

    id v14 = v139;
  }

  id v31 = v44;
  id v39 = v43;
  v42 = 0;
LABEL_42:
  id v49 = v42;

  if (v14 && v140 && v39 && v31)
  {
    v50 = [v4 objectForKeyedSubscript:@"ageRating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v51 = v50;
    }
    else {
      id v51 = 0;
    }
    id v129 = v42;
    id obj = v51;
    id v53 = v51;

    objc_super v54 = [v4 objectForKeyedSubscript:@"canSendViaMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v55 = v54;
    }
    else {
      id v55 = 0;
    }
    id v56 = v55;

    v57 = [v4 objectForKeyedSubscript:@"approverDSID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v58 = v57;
    }
    else {
      id v58 = 0;
    }
    id v122 = v58;
    id v130 = v58;

    v59 = [v4 objectForKeyedSubscript:@"itemBundleID"];
    objc_opt_class();
    v132 = v49;
    if (objc_opt_isKindOfClass()) {
      id v60 = v59;
    }
    else {
      id v60 = 0;
    }
    id v128 = v60;

    v61 = [v4 objectForKeyedSubscript:@"localizations"];
    objc_opt_class();
    id v124 = v60;
    if (objc_opt_isKindOfClass()) {
      id v62 = v61;
    }
    else {
      id v62 = 0;
    }
    id v63 = v62;

    v127 = v63;
    v64 = [[RequestLocalizations alloc] initWithDictionary:v63];
    v65 = [v4 objectForKeyedSubscript:@"price"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v66 = v65;
    }
    else {
      id v66 = 0;
    }
    id v119 = v66;
    id v123 = v66;

    v67 = [v4 objectForKeyedSubscript:@"offerName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v68 = v67;
    }
    else {
      id v68 = 0;
    }
    id v117 = v68;
    id v121 = v68;

    v69 = [v4 objectForKeyedSubscript:@"previewURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v70 = v69;
    }
    else {
      id v70 = 0;
    }
    id v115 = v70;
    id v120 = v70;

    v71 = [v4 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v72 = v71;
    }
    else {
      id v72 = 0;
    }
    id v114 = v72;
    id v118 = v72;

    v73 = [v4 objectForKeyedSubscript:@"itemTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v74 = v73;
    }
    else {
      id v74 = 0;
    }
    id v111 = v74;
    id v116 = v74;

    v75 = [v4 objectForKeyedSubscript:@"itemDescription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v76 = v75;
    }
    else {
      id v76 = 0;
    }
    id v109 = v76;
    id v113 = v76;

    v77 = [v4 objectForKeyedSubscript:@"thumbnailURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v78 = v77;
    }
    else {
      id v78 = 0;
    }
    id v108 = v78;
    id v112 = v78;

    v79 = [v4 objectForKeyedSubscript:@"requesterName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v80 = v79;
    }
    else {
      id v80 = 0;
    }
    id v106 = v80;
    id v110 = v80;

    v81 = [v4 objectForKeyedSubscript:@"requesterDSID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v82 = v81;
    }
    else {
      id v82 = 0;
    }
    id v104 = v82;
    id v107 = v82;

    v83 = [v4 objectForKeyedSubscript:@"requestInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v84 = v83;
    }
    else {
      id v84 = 0;
    }
    id v103 = v84;
    id v105 = v84;

    v85 = [v4 objectForKeyedSubscript:@"starRating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v86 = v85;
    }
    else {
      id v86 = 0;
    }
    id v101 = v86;
    id v102 = v86;

    v87 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    v131 = v53;
    if (objc_opt_isKindOfClass()) {
      id v88 = v87;
    }
    else {
      id v88 = 0;
    }
    id v89 = v88;

    v90 = [v4 objectForKeyedSubscript:@"requestString"];
    objc_opt_class();
    v133 = v39;
    v134 = v31;
    v125 = v64;
    if (objc_opt_isKindOfClass()) {
      id v91 = v90;
    }
    else {
      id v91 = 0;
    }
    id v92 = v91;

    v93 = [v4 objectForKeyedSubscript:@"requestSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v94 = v93;
    }
    else {
      id v94 = 0;
    }
    id v95 = v94;

    v96 = [v4 objectForKeyedSubscript:@"priceSummary"];
    objc_opt_class();
    v100 = v92;
    if (objc_opt_isKindOfClass()) {
      id v97 = v96;
    }
    else {
      id v97 = 0;
    }
    id v98 = v97;

    objc_storeStrong((id *)&v5->_ageRating, obj);
    objc_storeStrong((id *)&v5->_approverDSID, v122);
    v5->_canSendViaMessages = [v56 BOOLValue];
    objc_storeStrong((id *)&v5->_createdDate, v135);
    objc_storeStrong((id *)&v5->_modifiedDate, v129);
    objc_storeStrong((id *)&v5->_itemIdentifier, v138);
    objc_storeStrong((id *)&v5->_requestIdentifier, v137);
    objc_storeStrong((id *)&v5->_uniqueIdentifier, v136);
    objc_storeStrong((id *)&v5->_itemTitle, v111);
    objc_storeStrong((id *)&v5->_itemDescription, v109);
    objc_storeStrong((id *)&v5->_localizations, v125);
    objc_storeStrong((id *)&v5->_localizedPrice, v119);
    objc_storeStrong((id *)&v5->_offerName, v117);
    objc_storeStrong((id *)&v5->_previewURL, v115);
    objc_storeStrong((id *)&v5->_productType, v114);
    objc_storeStrong((id *)&v5->_itemBundleID, v124);
    objc_storeStrong((id *)&v5->_thumbnailURLString, v108);
    objc_storeStrong((id *)&v5->_requesterDSID, v104);
    objc_storeStrong((id *)&v5->_requesterName, v106);
    objc_storeStrong((id *)&v5->_requestInfo, v103);
    objc_storeStrong((id *)&v5->_starRating, v101);
    v5->_status = (int64_t)[v89 integerValue];
    objc_storeStrong((id *)&v5->_requestString, v91);
    objc_storeStrong((id *)&v5->_requestSummary, v94);
    objc_storeStrong((id *)&v5->_priceSummary, v97);

    goto LABEL_108;
  }

  v52 = 0;
LABEL_109:

  return v52;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ApproverStoreItem *)self itemIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, @"itemIdentifier");

  id v5 = [(ApproverStoreItem *)self requestIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"requestIdentifier");

  v6 = [(ApproverStoreItem *)self uniqueIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, @"uniqueIdentifier");

  id v7 = [(ApproverStoreItem *)self createdDate];
  [v7 timeIntervalSinceReferenceDate];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v8, @"createdTimeInterval");

  uint64_t v9 = [(ApproverStoreItem *)self modifiedDate];
  [v9 timeIntervalSinceReferenceDate];
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, @"modifiedTimeInterval");

  id v11 = [(ApproverStoreItem *)self ageRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, @"ageRating");

  id v12 = [(ApproverStoreItem *)self approverDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v12, @"approverDSID");

  id v13 = [(ApproverStoreItem *)self itemBundleID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v13, @"itemBundleID");

  id v14 = +[NSNumber numberWithBool:[(ApproverStoreItem *)self canSendViaMessages]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v14, @"canSendViaMessages");

  uint64_t v15 = [(ApproverStoreItem *)self itemTitle];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v15, @"itemTitle");

  id v16 = [(ApproverStoreItem *)self itemDescription];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v16, @"itemDescription");

  uint64_t v17 = [(ApproverStoreItem *)self localizations];
  objc_super v18 = [v17 compile];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v18, @"localizations");

  uint64_t v19 = [(ApproverStoreItem *)self localizedPrice];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v19, @"price");

  v20 = [(ApproverStoreItem *)self offerName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v20, @"offerName");

  uint64_t v21 = [(ApproverStoreItem *)self previewURL];
  v22 = [v21 absoluteString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v22, @"previewURL");

  uint64_t v23 = [(ApproverStoreItem *)self productType];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v23, @"productType");

  id v24 = [(ApproverStoreItem *)self thumbnailURLString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v24, @"thumbnailURL");

  uint64_t v25 = [(ApproverStoreItem *)self requesterName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v25, @"requesterName");

  v26 = [(ApproverStoreItem *)self requesterDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v26, @"requesterDSID");

  uint64_t v27 = [(ApproverStoreItem *)self requestInfo];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v27, @"requestInfo");

  v28 = [(ApproverStoreItem *)self starRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v28, @"starRating");

  uint64_t v29 = +[NSNumber numberWithInteger:[(ApproverStoreItem *)self status]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v29, @"status");

  v30 = [(ApproverStoreItem *)self requestString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v30, @"requestString");

  id v31 = [(ApproverStoreItem *)self requestSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v31, @"requestSummary");

  v32 = [(ApproverStoreItem *)self priceSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v32, @"priceSummary");

  return v3;
}

- (id)description
{
  id v3 = [(ApproverStoreItem *)self compile];
  id v4 = [(ApproverStoreItem *)self ap_generateDescriptionWithSubObjects:v3];

  return v4;
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

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
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

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (void)setLocalizedPrice:(id)a3
{
}

- (NSString)itemBundleID
{
  return self->_itemBundleID;
}

- (void)setItemBundleID:(id)a3
{
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
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

- (void)setPreviewURL:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (void)setThumbnailURLString:(id)a3
{
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void)setRequesterName:(id)a3
{
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
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

- (NSString)requestString
{
  return self->_requestString;
}

- (NSString)requestSummary
{
  return self->_requestSummary;
}

- (NSString)priceSummary
{
  return self->_priceSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceSummary, 0);
  objc_storeStrong((id *)&self->_requestSummary, 0);
  objc_storeStrong((id *)&self->_requestString, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_thumbnailURLString, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemBundleID, 0);
  objc_storeStrong((id *)&self->_localizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_approverDSID, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
}

@end