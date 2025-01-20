@interface ApprovalRequest
+ (id)createUniqueIDFromRequestID:(id)a3 andCreatedDate:(id)a4;
+ (int64_t)lobForProductType:(id)a3;
+ (int64_t)lobForSubscription:(id)a3;
- (ApprovalRequest)initWithApproverDSID:(id)a3 createdDate:(id)a4 modifiedDate:(id)a5 requestIdentifier:(id)a6 uniqueIdentifier:(id)a7 canSendViaMessages:(BOOL)a8 itemBundleID:(id)a9 itemDescription:(id)a10 itemIdentifier:(id)a11 itemTitle:(id)a12 localizations:(id)a13 offerName:(id)a14 mocked:(BOOL)a15 previewURL:(id)a16 productType:(id)a17 productTypeName:(id)a18 productURL:(id)a19 requesterName:(id)a20 requesterDSID:(id)a21 requestInfo:(id)a22 requestString:(id)a23 requestSummary:(id)a24 priceSummary:(id)a25 status:(int64_t)a26;
- (ApprovalRequest)initWithApproverStorageItem:(id)a3;
- (ApprovalRequest)initWithCloudPushDictionary:(id)a3;
- (ApprovalRequest)initWithCloudPushDictionary:(id)a3 bag:(id)a4;
- (ApprovalRequest)initWithDictionary:(id)a3;
- (ApprovalRequest)initWithRequestStorageItem:(id)a3;
- (BOOL)canSendViaMessages;
- (BOOL)isMocked;
- (BOOL)isSubscription;
- (NSDate)createdDate;
- (NSDate)date;
- (NSDate)modifiedDate;
- (NSDictionary)requestInfo;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
- (NSString)description;
- (NSString)itemBundleID;
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
- (NSString)requesterName;
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (RequestLocalizations)localizations;
- (id)compile;
- (id)metricsApp;
- (id)metricsTopic;
- (int64_t)lineOfBusiness;
- (int64_t)status;
- (void)updateStatus:(int64_t)a3 withApproverDSID:(id)a4;
@end

@implementation ApprovalRequest

- (ApprovalRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v151.receiver = self;
  v151.super_class = (Class)ApprovalRequest;
  v5 = [(ApprovalRequest *)&v151 init];

  if (!v5) {
    goto LABEL_115;
  }
  v6 = [v4 objectForKeyedSubscript:@"ageRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v150 = v7;

  v8 = [v4 objectForKeyedSubscript:@"approverDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v149 = v9;

  v10 = [v4 objectForKeyedSubscript:@"canSendViaMessages"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  unsigned __int8 v136 = [v12 BOOLValue];
  v13 = [v4 objectForKeyedSubscript:@"createdTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = +[APLogConfig sharedConfig];
      if (!v15)
      {
        v15 = +[APLogConfig sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543618;
        CFStringRef v153 = @"createdTimeInterval";
        __int16 v154 = 2114;
        v155 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.", buf, 0x16u);
      }
      id v14 = 0;
    }
  }
  id v19 = v14;

  v20 = [v4 objectForKeyedSubscript:@"modifiedTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 doubleValue];
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = 0;
    }
  }
  id obj = v21;
  id v137 = v21;

  v22 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  v138 = v19;
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
  }
  else
  {
    v24 = +[APLogConfig sharedConfig];
    if (!v24)
    {
      v24 = +[APLogConfig sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543874;
      CFStringRef v153 = @"identifier";
      __int16 v154 = 2114;
      v155 = v27;
      __int16 v156 = 2114;
      v157 = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      id v19 = v138;
    }

    id v23 = 0;
  }
  id v148 = v23;

  v30 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;
  }
  else
  {
    v32 = +[APLogConfig sharedConfig];
    if (!v32)
    {
      v32 = +[APLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138543874;
      CFStringRef v153 = @"uniqueIdentifier";
      __int16 v154 = 2114;
      v155 = v35;
      __int16 v156 = 2114;
      v157 = v37;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      id v19 = v138;
    }

    id v31 = 0;
  }
  id v147 = v31;

  v38 = [v4 objectForKeyedSubscript:@"bundleID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v39 = v38;
  }
  else {
    id v39 = 0;
  }
  id v146 = v39;

  v40 = [v4 objectForKeyedSubscript:@"itemDescription"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }
  id v145 = v41;

  v42 = [v4 objectForKeyedSubscript:@"itemTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v43 = v42;
  }
  else {
    id v43 = 0;
  }
  id v144 = v43;

  v44 = [v4 objectForKeyedSubscript:@"itemIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v45 = v44;
  }
  else
  {
    v46 = +[APLogConfig sharedConfig];
    if (!v46)
    {
      v46 = +[APLogConfig sharedConfig];
    }
    v47 = [v46 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      *(_DWORD *)buf = 138543874;
      CFStringRef v153 = @"itemIdentifier";
      __int16 v154 = 2114;
      v155 = v49;
      __int16 v156 = 2114;
      v157 = v51;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      id v19 = v138;
    }

    id v45 = 0;
  }
  id v143 = v45;

  v52 = [RequestLocalizations alloc];
  v53 = [v4 objectForKeyedSubscript:@"localizations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v54 = v53;
  }
  else {
    id v54 = 0;
  }
  id v55 = v54;

  v142 = [(RequestLocalizations *)v52 initWithDictionary:v55];
  v56 = [v4 objectForKeyedSubscript:@"offerName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v57 = v56;
  }
  else {
    id v57 = 0;
  }
  id v141 = v57;

  v58 = [v4 objectForKeyedSubscript:@"mocked"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v59 = v58;
  }
  else {
    id v59 = 0;
  }
  id v60 = v59;

  unsigned __int8 v132 = [v60 BOOLValue];
  v61 = [v4 objectForKeyedSubscript:@"previewURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v62 = v61;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v62 = +[NSURL URLWithString:v61];
    }
    else
    {
      id v62 = 0;
    }
  }
  id v131 = v62;
  id v134 = v62;

  v63 = [v4 objectForKeyedSubscript:@"productType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v64 = v63;
  }
  else {
    id v64 = 0;
  }
  id v140 = v64;

  v65 = [v4 objectForKeyedSubscript:@"productTypeName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v66 = v65;
  }
  else {
    id v66 = 0;
  }
  id v139 = v66;

  v67 = [v4 objectForKeyedSubscript:@"productURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v68 = v67;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v69 = 0;
      goto LABEL_81;
    }
    +[NSURL URLWithString:](NSURL, "URLWithString:", v67, v131);
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  v69 = v68;
LABEL_81:
  id v133 = v69;

  v70 = [v4 objectForKeyedSubscript:@"requesterDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v71 = v70;
  }
  else {
    id v71 = 0;
  }
  id v72 = v71;

  v73 = [v4 objectForKeyedSubscript:@"requesterName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v74 = v73;
  }
  else {
    id v74 = 0;
  }
  id v75 = v74;

  v76 = [v4 objectForKeyedSubscript:@"starRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v77 = v76;
  }
  else {
    id v77 = 0;
  }
  id v78 = v77;

  v79 = [v4 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v80 = v79;
  }
  else {
    id v80 = 0;
  }
  id v81 = v80;

  id v82 = [v81 integerValue];
  v83 = (NSString *)[v150 copy];
  ageRating = v5->_ageRating;
  v5->_ageRating = v83;

  v85 = (NSString *)[v149 copy];
  approverDSID = v5->_approverDSID;
  v5->_approverDSID = v85;

  v5->_canSendViaMessages = v136;
  if (v19)
  {
    v87 = (NSDate *)v19;
    createdDate = v5->_createdDate;
    v5->_createdDate = v87;
  }
  else
  {
    createdDate = +[NSDate now];
    objc_storeStrong((id *)&v5->_createdDate, createdDate);
  }

  objc_storeStrong((id *)&v5->_modifiedDate, obj);
  v89 = (__CFString *)[v148 copy];
  v90 = v89;
  if (v89) {
    v91 = v89;
  }
  else {
    v91 = &stru_100039F08;
  }
  objc_storeStrong((id *)&v5->_requestIdentifier, v91);

  v92 = (__CFString *)[v147 copy];
  v93 = v92;
  if (v92) {
    v94 = v92;
  }
  else {
    v94 = &stru_100039F08;
  }
  objc_storeStrong((id *)&v5->_uniqueIdentifier, v94);

  v95 = (NSString *)[v146 copy];
  itemBundleID = v5->_itemBundleID;
  v5->_itemBundleID = v95;

  v97 = (NSString *)[v145 copy];
  itemDescription = v5->_itemDescription;
  v5->_itemDescription = v97;

  v99 = (NSString *)[v144 copy];
  itemTitle = v5->_itemTitle;
  v5->_itemTitle = v99;

  v101 = (__CFString *)[v143 copy];
  v102 = v101;
  if (v101) {
    v103 = v101;
  }
  else {
    v103 = &stru_100039F08;
  }
  objc_storeStrong((id *)&v5->_itemIdentifier, v103);

  objc_storeStrong((id *)&v5->_localizations, v142);
  v5->_mocked = v132;
  v104 = (NSString *)[v141 copy];
  offerName = v5->_offerName;
  v5->_offerName = v104;

  objc_storeStrong((id *)&v5->_previewURL, v131);
  v106 = (NSString *)[v140 copy];
  productType = v5->_productType;
  v5->_productType = v106;

  v108 = (NSString *)[v139 copy];
  productTypeName = v5->_productTypeName;
  v5->_productTypeName = v108;

  objc_storeStrong((id *)&v5->_productURL, v69);
  v110 = (NSString *)[v72 copy];
  requesterDSID = v5->_requesterDSID;
  v5->_requesterDSID = v110;

  v112 = (NSString *)[v75 copy];
  requesterName = v5->_requesterName;
  v5->_requesterName = v112;

  objc_storeStrong((id *)&v5->_starRating, v77);
  v5->_status = (int64_t)v82;
  v114 = [v4 objectForKeyedSubscript:@"requestString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v115 = v114;
  }
  else {
    id v115 = 0;
  }
  id v116 = v115;

  v117 = (NSString *)[v116 copy];
  requestString = v5->_requestString;
  v5->_requestString = v117;

  v119 = [v4 objectForKeyedSubscript:@"requestSummary"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v120 = v119;
  }
  else {
    id v120 = 0;
  }
  id v121 = v120;

  v122 = (NSString *)[v121 copy];
  requestSummary = v5->_requestSummary;
  v5->_requestSummary = v122;

  v124 = [v4 objectForKeyedSubscript:@"priceSummary"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v125 = v124;
  }
  else {
    id v125 = 0;
  }
  id v126 = v125;

  v127 = (NSString *)[v126 copy];
  priceSummary = v5->_priceSummary;
  v5->_priceSummary = v127;

LABEL_115:
  v129 = v5;

  return v129;
}

- (ApprovalRequest)initWithApproverDSID:(id)a3 createdDate:(id)a4 modifiedDate:(id)a5 requestIdentifier:(id)a6 uniqueIdentifier:(id)a7 canSendViaMessages:(BOOL)a8 itemBundleID:(id)a9 itemDescription:(id)a10 itemIdentifier:(id)a11 itemTitle:(id)a12 localizations:(id)a13 offerName:(id)a14 mocked:(BOOL)a15 previewURL:(id)a16 productType:(id)a17 productTypeName:(id)a18 productURL:(id)a19 requesterName:(id)a20 requesterDSID:(id)a21 requestInfo:(id)a22 requestString:(id)a23 requestSummary:(id)a24 priceSummary:(id)a25 status:(int64_t)a26
{
  id v56 = a3;
  id v41 = a4;
  id v54 = a4;
  id v42 = a5;
  id v52 = a5;
  id v50 = a6;
  id v44 = a7;
  id v59 = a7;
  id v58 = a9;
  id v57 = a10;
  id v55 = a11;
  id v53 = a12;
  id v51 = a13;
  id v49 = a14;
  id v48 = a16;
  id v47 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  id v46 = a25;
  v60.receiver = self;
  v60.super_class = (Class)ApprovalRequest;
  v37 = [(ApprovalRequest *)&v60 init];
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_approverDSID, a3);
    objc_storeStrong((id *)&v38->_createdDate, v41);
    objc_storeStrong((id *)&v38->_modifiedDate, v42);
    v38->_canSendViaMessages = a8;
    objc_storeStrong((id *)&v38->_requestIdentifier, a6);
    objc_storeStrong((id *)&v38->_uniqueIdentifier, v44);
    objc_storeStrong((id *)&v38->_itemBundleID, a9);
    objc_storeStrong((id *)&v38->_itemDescription, a10);
    objc_storeStrong((id *)&v38->_itemTitle, a12);
    objc_storeStrong((id *)&v38->_itemIdentifier, a11);
    objc_storeStrong((id *)&v38->_localizations, a13);
    objc_storeStrong((id *)&v38->_offerName, a14);
    v38->_mocked = a15;
    objc_storeStrong((id *)&v38->_previewURL, a16);
    objc_storeStrong((id *)&v38->_productType, a17);
    objc_storeStrong((id *)&v38->_productTypeName, a18);
    objc_storeStrong((id *)&v38->_productURL, a19);
    objc_storeStrong((id *)&v38->_requesterDSID, a21);
    objc_storeStrong((id *)&v38->_requesterName, a20);
    objc_storeStrong((id *)&v38->_requestInfo, a22);
    objc_storeStrong((id *)&v38->_requestString, a23);
    objc_storeStrong((id *)&v38->_requestSummary, a24);
    objc_storeStrong((id *)&v38->_priceSummary, a25);
    v38->_status = a26;
  }

  return v38;
}

- (ApprovalRequest)initWithApproverStorageItem:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ApprovalRequest;
  v5 = [(ApprovalRequest *)&v47 init];
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

    uint64_t v12 = [v4 modifiedDate];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    uint64_t v14 = [v4 requestIdentifier];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 itemDescription];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    uint64_t v20 = [v4 itemTitle];
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    uint64_t v22 = [v4 itemIdentifier];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 localizations];
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    uint64_t v26 = [v4 localizedPrice];
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    uint64_t v28 = [v4 offerName];
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    uint64_t v30 = [v4 previewURL];
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    uint64_t v32 = [v4 productType];
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    uint64_t v34 = [v4 requesterDSID];
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v34;

    uint64_t v36 = [v4 starRating];
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v36;

    v5->_status = (int64_t)[v4 status];
    uint64_t v38 = [v4 requestString];
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v38;

    uint64_t v40 = [v4 requestSummary];
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v40;

    uint64_t v42 = [v4 priceSummary];
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v42;

    uint64_t v44 = [v4 thumbnailURLString];
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v44;
  }
  return v5;
}

- (ApprovalRequest)initWithRequestStorageItem:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ApprovalRequest;
  v5 = [(ApprovalRequest *)&v51 init];
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

    uint64_t v12 = [v4 modifiedDate];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    uint64_t v14 = [v4 requestIdentifier];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 uniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 itemDescription];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    uint64_t v20 = [v4 itemTitle];
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    uint64_t v22 = [v4 itemIdentifier];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 localizations];
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    uint64_t v26 = [v4 localizedPrice];
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    uint64_t v28 = [v4 offerName];
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    uint64_t v30 = [v4 previewURL];
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    uint64_t v32 = [v4 productType];
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    uint64_t v34 = [v4 productTypeName];
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v34;

    uint64_t v36 = [v4 productURL];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v36;

    uint64_t v38 = [v4 requesterDSID];
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v38;

    uint64_t v40 = [v4 starRating];
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v40;

    v5->_status = (int64_t)[v4 status];
    uint64_t v42 = [v4 requestString];
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v42;

    uint64_t v44 = [v4 requestSummary];
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v44;

    uint64_t v46 = [v4 priceSummary];
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v46;

    uint64_t v48 = [v4 thumbnailURLString];
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v48;
  }
  return v5;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3
{
  id v4 = a3;
  v5 = +[AMSBag sharedBag];
  uint64_t v6 = [(ApprovalRequest *)self initWithCloudPushDictionary:v4 bag:v5];

  return v6;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v236.receiver = self;
  v236.super_class = (Class)ApprovalRequest;
  uint64_t v8 = [(ApprovalRequest *)&v236 init];

  if (!v8) {
    goto LABEL_237;
  }
  id v9 = [v6 objectForKeyedSubscript:@"requestInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v217 = v10;
  id v11 = v10;

  uint64_t v12 = [v11 objectForKeyedSubscript:@"salables"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  v231 = v14;
  v15 = [v14 objectForKeyedSubscript:@"lockupData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = [v11 objectForKeyedSubscript:@"productType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id obj = v19;
  id v20 = v19;

  if ([v20 isEqualToString:@"A"])
  {
    id v21 = [v14 objectForKeyedSubscript:@"parentSalables"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = [v23 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }
    id v26 = v25;

    v230 = v26;
    v27 = [v26 objectForKeyedSubscript:@"lockupData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }
    id v229 = v28;
  }
  else
  {
    id v229 = 0;
    v230 = 0;
  }
  id v29 = v6;
  uint64_t v30 = [v11 objectForKeyedSubscript:@"requestId"];
  objc_opt_class();
  id v31 = v7;
  if (objc_opt_isKindOfClass()) {
    id v32 = v30;
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;

  v228 = v33;
  if (!v33)
  {
    int v47 = 1;
    id v7 = v31;
    id v6 = v29;
    uint64_t v48 = v231;
    goto LABEL_235;
  }
  objc_storeStrong((id *)&v8->_requestIdentifier, v32);
  uint64_t v34 = [v11 objectForKeyedSubscript:@"clientInfo"];
  uint64_t v35 = +[APLogConfig sharedDaemonConfig];
  uint64_t v36 = (void *)v35;
  id v225 = v20;
  v226 = v17;
  v227 = (void *)v34;
  id v7 = v31;
  if (v34)
  {
    if (!v35)
    {
      uint64_t v36 = +[APLogConfig sharedConfig];
    }
    v37 = [v36 OSLogObject];
    id v6 = v29;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v239 = v38;
      __int16 v240 = 2112;
      v241 = v227;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: clientInfo: %@", buf, 0x16u);
    }
    [v227 componentsSeparatedByString:@"-"];
    long long v232 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    id v40 = [v39 countByEnumeratingWithState:&v232 objects:v237 count:16];
    if (v40)
    {
      id v41 = v40;
      id v212 = v11;
      id v221 = v7;
      v223 = v29;
      uint64_t v42 = *(void *)v233;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v233 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = [*(id *)(*((void *)&v232 + 1) + 8 * i) componentsSeparatedByString:@":"];
          id v45 = [v44 firstObject];
          uint64_t v46 = [v44 lastObject];
          if ([v45 isEqualToString:@"canSendViaMessages"]) {
            v8->_canSendViaMessages = [v46 BOOLValue];
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v232 objects:v237 count:16];
      }
      while (v41);
      uint64_t v36 = v39;
      id v7 = v221;
      id v6 = v223;
      id v11 = v212;
    }
    else
    {
      uint64_t v36 = v39;
    }
  }
  else
  {
    if (!v35)
    {
      uint64_t v36 = +[APLogConfig sharedConfig];
    }
    id v39 = [v36 OSLogObject];
    id v6 = v29;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v239 = v49;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Server Response - No clientInfo passed from child device", buf, 0xCu);
    }
  }

  id v50 = [v11 objectForKeyedSubscript:@"adamId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v51 = v50;
  }
  else {
    id v51 = 0;
  }
  id v20 = v225;
  id v52 = v51;

  v220 = v52;
  id v53 = [v52 stringValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v54 = v53;
  }
  else {
    id v54 = 0;
  }
  id v55 = v54;

  v219 = v55;
  if (v55)
  {
    objc_storeStrong((id *)&v8->_itemIdentifier, v54);
    id v56 = [v11 objectForKeyedSubscript:@"approveButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v57 = v56;
    }
    else {
      id v57 = 0;
    }
    id v224 = v57;

    id v58 = [v11 objectForKeyedSubscript:@"declineButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v59 = v58;
    }
    else {
      id v59 = 0;
    }
    id v222 = v59;

    objc_super v60 = [v11 objectForKeyedSubscript:@"requestString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v61 = v60;
    }
    else {
      id v61 = 0;
    }
    id v62 = v61;

    v214 = v62;
    if (!v62)
    {
      int v47 = 1;
      id v17 = v226;
LABEL_233:

      goto LABEL_234;
    }
    objc_storeStrong((id *)&v8->_requestString, v61);
    v63 = [v11 objectForKeyedSubscript:@"requestSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v64 = v63;
    }
    else {
      id v64 = 0;
    }
    id v209 = v64;

    objc_storeStrong((id *)&v8->_requestSummary, v64);
    v65 = [v11 objectForKeyedSubscript:@"priceSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v66 = v65;
    }
    else {
      id v66 = 0;
    }
    id v208 = v66;

    objc_storeStrong((id *)&v8->_priceSummary, v66);
    v67 = [v226 objectForKeyedSubscript:@"contentRating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v68 = v67;
    }
    else {
      id v68 = 0;
    }
    id v69 = v68;

    v207 = v69;
    v70 = [v69 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v71 = v70;
    }
    else {
      id v71 = 0;
    }
    id v72 = v71;

    if ([v72 length]) {
      CFStringRef v73 = (const __CFString *)v72;
    }
    else {
      CFStringRef v73 = @"0";
    }
    ageRating = v8->_ageRating;
    v8->_ageRating = &v73->isa;

    id v75 = [v11 objectForKeyedSubscript:@"approverDsId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v76 = v75;
    }
    else {
      id v76 = 0;
    }
    id v77 = v76;

    v205 = v77;
    uint64_t v78 = [v77 stringValue];
    approverDSID = v8->_approverDSID;
    v8->_approverDSID = (NSString *)v78;

    id v80 = objc_alloc_init((Class)NSDateFormatter);
    [v80 setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss.SZZZ"];
    uint64_t v81 = [v11 objectForKeyedSubscript:@"requestCreatedUtc"];
    v210 = (void *)v81;
    if (v81)
    {
      id v82 = [v80 dateFromString:v81];
      if (v82) {
        goto LABEL_100;
      }
      v83 = +[APLogConfig sharedDaemonConfig];
      if (!v83)
      {
        v83 = +[APLogConfig sharedConfig];
      }
      v84 = [v83 OSLogObject];
      if (!os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
      {
LABEL_99:

        id v82 = +[NSDate date];
        id v20 = v225;
LABEL_100:
        objc_storeStrong((id *)&v8->_createdDate, v82);
        uint64_t v89 = [v11 objectForKeyedSubscript:@"approvalStatusUpdatedUtc"];
        v211 = v82;
        id v206 = v72;
        v203 = (void *)v89;
        if (v89)
        {
          v90 = [v80 dateFromString:v89];
          v91 = v90;
          if (v90)
          {
            v92 = v90;
            modifiedDate = v8->_modifiedDate;
            v8->_modifiedDate = v92;
          }
          else
          {
            modifiedDate = +[NSDate date];
            objc_storeStrong((id *)&v8->_modifiedDate, modifiedDate);
          }

          id v82 = v211;
        }
        else
        {
          uint64_t v94 = +[NSDate date];
          v91 = v8->_modifiedDate;
          v8->_modifiedDate = (NSDate *)v94;
        }

        uint64_t v95 = +[ApprovalRequest createUniqueIDFromRequestID:v8->_requestIdentifier andCreatedDate:v82];
        uniqueIdentifier = v8->_uniqueIdentifier;
        v8->_uniqueIdentifier = (NSString *)v95;

        v97 = [v231 objectForKeyedSubscript:@"bundleIdentifier"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v98 = v97;
        }
        else {
          id v98 = 0;
        }
        id v99 = v98;

        if (v99)
        {
          v100 = (NSString *)v99;
          itemBundleID = (__CFString *)v8->_itemBundleID;
          v8->_itemBundleID = v100;
        }
        else
        {
          v102 = [v230 objectForKeyedSubscript:@"bundleIdentifier"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v103 = v102;
          }
          else {
            id v103 = 0;
          }
          itemBundleID = (__CFString *)v103;

          if (itemBundleID) {
            v104 = itemBundleID;
          }
          else {
            v104 = @"Unknown";
          }
          objc_storeStrong((id *)&v8->_itemBundleID, v104);
        }

        v105 = [v231 objectForKeyedSubscript:@"localizedName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v106 = v105;
        }
        else {
          id v106 = 0;
        }
        id v107 = v106;

        if (v107)
        {
          v108 = (NSString *)v107;
          itemTitle = v8->_itemTitle;
          v8->_itemTitle = v108;
        }
        else
        {
          id v110 = v11;
          v111 = [v230 objectForKeyedSubscript:@"localizedName"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v112 = v111;
          }
          else {
            id v112 = 0;
          }
          itemTitle = (NSString *)v112;

          objc_storeStrong((id *)&v8->_itemTitle, v112);
          id v11 = v110;
          id v20 = v225;
        }
        v204 = v80;

        if (v224)
        {
          id v113 = v224;
        }
        else
        {
          id v113 = +[Localizations stringWithKey:@"ACTION_APPROVE"];
        }
        id v114 = v113;

        if (v222)
        {
          id v115 = v222;
        }
        else
        {
          id v115 = +[Localizations stringWithKey:@"ACTION_DECLINE"];
        }
        id v116 = v115;

        v117 = [v11 objectForKeyedSubscript:@"requesterFirstName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v118 = v117;
        }
        else {
          id v118 = 0;
        }
        v119 = (__CFString *)v118;

        if (v119) {
          id v120 = v119;
        }
        else {
          id v120 = @"Unknown";
        }
        objc_storeStrong((id *)&v8->_requesterName, v120);

        id v121 = +[Localizations stringWithKey:@"NOTIFICATION_TITLE_APPROVER" bag:v7];
        v122 = v121;
        if (v121)
        {
          id v121 = +[NSString stringWithValidatedFormat:v121, @"%@", 0, v8->_requesterName validFormatSpecifiers error];
        }
        id v123 = v121;

        id v222 = v116;
        id v224 = v114;
        v202 = v123;
        if (!v123)
        {
          int v47 = 1;
          id v17 = v226;
          v127 = v206;
LABEL_232:

          goto LABEL_233;
        }
        v124 = [[RequestLocalizations alloc] initWithApprove:v114 body:v214 decline:v116 title:v123];
        if (!v124)
        {
          int v47 = 1;
          id v17 = v226;
          v127 = v206;
LABEL_231:

          goto LABEL_232;
        }
        v201 = v124;
        objc_storeStrong((id *)&v8->_localizations, v124);
        id v125 = [v11 objectForKeyedSubscript:@"priceString"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v126 = v125;
        }
        else {
          id v126 = 0;
        }
        v128 = (__CFString *)v126;

        if (v128) {
          v129 = v128;
        }
        else {
          v129 = @"Unknown";
        }
        objc_storeStrong((id *)&v8->_localizedPrice, v129);

        v130 = [v226 objectForKeyedSubscript:@"offerName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v131 = v130;
        }
        else {
          id v131 = 0;
        }
        unsigned __int8 v132 = (__CFString *)v131;

        if (v132) {
          id v133 = v132;
        }
        else {
          id v133 = @"Unknown";
        }
        v200 = v133;

        objc_storeStrong((id *)&v8->_offerName, v133);
        id v134 = [v11 objectForKeyedSubscript:@"previewURL"];
        objc_opt_class();
        v213 = v11;
        if (objc_opt_isKindOfClass()) {
          id v135 = v134;
        }
        else {
          id v135 = 0;
        }
        id v136 = v135;

        v199 = v136;
        if (v136)
        {
          previewURL = +[NSURL URLWithString:v136];
          objc_storeStrong((id *)&v8->_previewURL, previewURL);
        }
        else
        {
          previewURL = v8->_previewURL;
          v8->_previewURL = 0;
        }

        p_productType = (void **)&v8->_productType;
        objc_storeStrong((id *)&v8->_productType, obj);
        id v139 = [v231 objectForKeyedSubscript:@"productTypeName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v140 = v139;
        }
        else {
          id v140 = 0;
        }
        id v141 = (__CFString *)v140;

        if (v141) {
          v142 = v141;
        }
        else {
          v142 = @"Unknown";
        }
        id v143 = v142;

        objc_storeStrong((id *)&v8->_productTypeName, v142);
        obja = v143;
        if ([(__CFString *)v143 isEqualToString:@"Subscription"])
        {
          CFStringRef v144 = @"SUB";
        }
        else
        {
          if (![(__CFString *)v143 isEqualToString:@"AudioBook"]) {
            goto LABEL_174;
          }
          CFStringRef v144 = @"PUB";
        }
        id v145 = *p_productType;
        *p_productType = (void *)v144;

LABEL_174:
        id v146 = [v231 objectForKeyedSubscript:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v147 = v146;
        }
        else {
          id v147 = 0;
        }
        id v148 = v147;

        v198 = v148;
        if (v148)
        {
          productURL = +[NSURL URLWithString:v148];
          objc_storeStrong((id *)&v8->_productURL, productURL);
        }
        else
        {
          productURL = v8->_productURL;
          v8->_productURL = 0;
        }

        id v11 = v213;
        id v150 = [v213 objectForKeyedSubscript:@"requesterDsId"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v151 = v150;
        }
        else {
          id v151 = 0;
        }
        id v152 = v151;

        uint64_t v153 = [v152 stringValue];
        requesterDSID = v8->_requesterDSID;
        v8->_requesterDSID = (NSString *)v153;

        objc_storeStrong((id *)&v8->_requestInfo, v217);
        v155 = [v213 objectForKeyedSubscript:@"approvalStatus"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v156 = v155;
        }
        else {
          id v156 = 0;
        }
        id v157 = v156;

        id v218 = v157;
        if (v157) {
          uint64_t v158 = (uint64_t)[v157 integerValue];
        }
        else {
          uint64_t v158 = -2;
        }
        v8->_int64_t status = v158;
        v159 = [v226 objectForKeyedSubscript:@"userRating"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v160 = v159;
        }
        else {
          id v160 = 0;
        }
        id v161 = v160;

        if (v161)
        {
          id v162 = v161;
        }
        else
        {
          v163 = [v229 objectForKeyedSubscript:@"userRating"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v164 = v163;
          }
          else {
            id v164 = 0;
          }
          id v165 = v164;

          id v162 = v165;
        }

        v166 = [v162 objectForKeyedSubscript:@"value"];
        objc_opt_class();
        v196 = v162;
        if (objc_opt_isKindOfClass()) {
          id v167 = v166;
        }
        else {
          id v167 = 0;
        }
        id v17 = v226;
        id v168 = v167;

        if (v168) {
          v169 = (_UNKNOWN **)v168;
        }
        else {
          v169 = &off_10003ADC0;
        }
        objc_storeStrong((id *)&v8->_starRating, v169);

        int64_t status = v8->_status;
        v197 = v152;
        if (!status)
        {
          CFStringRef v171 = @"declinedString";
          goto LABEL_208;
        }
        if (status == 1)
        {
          CFStringRef v171 = @"approvalString";
LABEL_208:
          id v172 = [v213 objectForKeyedSubscript:v171];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v173 = v172;
          }
          else {
            id v173 = 0;
          }
          v176 = (__CFString *)v173;
          v177 = v176;
LABEL_214:
          v178 = v176;

          v177 = v178;
LABEL_215:
          if (v177) {
            v179 = v177;
          }
          else {
            v179 = &stru_100039F08;
          }
          objc_storeStrong((id *)&v8->_itemDescription, v179);
          v180 = [v231 objectForKeyedSubscript:@"coverArtImageUrl"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v181 = v180;
          }
          else {
            id v181 = 0;
          }
          id v182 = v181;

          if (v182)
          {
            v183 = (__CFString *)v182;
          }
          else
          {
            v184 = [v230 objectForKeyedSubscript:@"coverArtImageUrl"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v185 = v184;
            }
            else {
              id v185 = 0;
            }
            id v186 = v185;

            v183 = (__CFString *)v186;
          }

          if (v183) {
            v187 = v183;
          }
          else {
            v187 = @"Unknown";
          }
          objc_storeStrong((id *)&v8->_thumbnailURLString, v187);

          int v47 = 0;
          id v20 = v225;
          v127 = v206;
          v124 = v201;
          goto LABEL_231;
        }
        v174 = [v226 objectForKeyedSubscript:@"subtitle"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v175 = v174;
        }
        else {
          id v175 = 0;
        }
        id v190 = v175;

        if (v190)
        {
          v177 = (__CFString *)v190;
        }
        else
        {
          v191 = [v229 objectForKeyedSubscript:@"subtitle"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v192 = v191;
          }
          else {
            id v192 = 0;
          }
          id v193 = v192;

          v177 = (__CFString *)v193;
          if (!v177)
          {
LABEL_247:
            v194 = [v226 objectForKeyedSubscript:@"artistName"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v195 = v194;
            }
            else {
              id v195 = 0;
            }
            id v172 = v195;

            v176 = [v172 stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
            goto LABEL_214;
          }
        }
        if ([(__CFString *)v177 length]) {
          goto LABEL_215;
        }
        goto LABEL_247;
      }
      id v85 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v239 = v85;
      __int16 v240 = 2112;
      v241 = v210;
      v86 = "%{public}@: Failed To Parse Created Date. String Value: \"%@\"";
      v87 = v84;
      uint32_t v88 = 22;
    }
    else
    {
      v83 = +[APLogConfig sharedDaemonConfig];
      if (!v83)
      {
        v83 = +[APLogConfig sharedConfig];
      }
      v84 = [v83 OSLogObject];
      if (!os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
        goto LABEL_99;
      }
      id v85 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v239 = v85;
      v86 = "%{public}@: Server Response Missing Created Date";
      v87 = v84;
      uint32_t v88 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_FAULT, v86, buf, v88);

    goto LABEL_99;
  }
  int v47 = 1;
  id v17 = v226;
LABEL_234:
  uint64_t v48 = v231;

LABEL_235:
  if (!v47)
  {
LABEL_237:
    v188 = v8;
    goto LABEL_238;
  }
  v188 = 0;
LABEL_238:

  return v188;
}

+ (id)createUniqueIDFromRequestID:(id)a3 andCreatedDate:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSinceReferenceDate];
  id v7 = +[NSString stringWithFormat:@"%ld_%@", (uint64_t)v6, v5];

  uint64_t v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    uint64_t v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    v15 = v7;
    id v10 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Generated UniqueID from request: %@", buf, 0x16u);
  }
  return v7;
}

- (void)updateStatus:(int64_t)a3 withApproverDSID:(id)a4
{
  self->_int64_t status = a3;
  objc_storeStrong((id *)&self->_approverDSID, a4);
}

- (BOOL)isSubscription
{
  v2 = [(ApprovalRequest *)self productTypeName];
  unsigned __int8 v3 = [v2 isEqualToString:@"Subscription"];

  return v3;
}

- (id)metricsApp
{
  if ([(ApprovalRequest *)self isSubscription])
  {
    unsigned __int8 v3 = [(ApprovalRequest *)self itemBundleID];
    unint64_t v4 = +[ApprovalRequest lobForSubscription:v3];

    if (v4 < 9)
    {
      id v5 = &off_100038D30[v4];
      return *v5;
    }
    return @"xp_its_main";
  }
  else
  {
    double v6 = [(ApprovalRequest *)self productType];
    int64_t v7 = +[ApprovalRequest lobForProductType:v6];

    if ((unint64_t)(v7 - 1) < 3)
    {
      id v5 = &off_100038D78 + v7 - 1;
      return *v5;
    }
    return @"unknown";
  }
}

- (id)metricsTopic
{
  if ([(ApprovalRequest *)self isSubscription])
  {
    unsigned __int8 v3 = [(ApprovalRequest *)self itemBundleID];
    int64_t v4 = +[ApprovalRequest lobForSubscription:v3];

    if ((unint64_t)(v4 - 3) >= 6) {
      return @"xp_its_main";
    }
    else {
      return *(&off_100038D90 + v4 - 3);
    }
  }
  else
  {
    double v6 = [(ApprovalRequest *)self productType];
    int64_t v7 = +[ApprovalRequest lobForProductType:v6];

    CFStringRef v8 = @"xp_its_main";
    if (v7 == 3) {
      CFStringRef v8 = @"xp_its_music_main";
    }
    if (v7 == 1) {
      return @"xp_ase_appstore_ue";
    }
    else {
      return (id)v8;
    }
  }
}

- (int64_t)lineOfBusiness
{
  if ([(ApprovalRequest *)self isSubscription])
  {
    unsigned __int8 v3 = [(ApprovalRequest *)self itemBundleID];
    int64_t v4 = +[ApprovalRequest lobForSubscription:v3];
  }
  else
  {
    unsigned __int8 v3 = [(ApprovalRequest *)self productType];
    int64_t v4 = +[ApprovalRequest lobForProductType:v3];
  }
  int64_t v5 = v4;

  return v5;
}

+ (int64_t)lobForSubscription:(id)a3
{
  unsigned __int8 v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"com.apple.tv"])
  {
    int64_t v4 = 8;
  }
  else
  {
    if ([v3 isEqualToString:@"com.apple.music"]) {
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"com.apple.appleone"])
    {
      int64_t v4 = 6;
      goto LABEL_15;
    }
    if ([v3 isEqualToString:@"com.apple.fitness"])
    {
      int64_t v4 = 7;
      goto LABEL_15;
    }
    if ([v3 isEqualToString:@"com.apple.news"])
    {
      int64_t v4 = 4;
      goto LABEL_15;
    }
    if (!v3)
    {
LABEL_4:
      int64_t v4 = 3;
    }
    else if ([v3 isEqualToString:@"unknown"])
    {
      int64_t v4 = 3;
    }
    else
    {
      int64_t v4 = 0;
    }
  }
LABEL_15:

  return v4;
}

+ (int64_t)lobForProductType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"A"] & 1) != 0
    || ([v3 isEqualToString:@"ASB"] & 1) != 0
    || ([v3 isEqualToString:@"C"] & 1) != 0
    || ([v3 isEqualToString:@"G"] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if (([v3 isEqualToString:@"P"] & 1) != 0 {
         || ([v3 isEqualToString:@"Q"] & 1) != 0
  }
         || ([v3 isEqualToString:@"S"] & 1) != 0
         || ([v3 isEqualToString:@"V"] & 1) != 0)
  {
    int64_t v4 = 3;
  }
  else
  {
    if (([v3 isEqualToString:@"B"] & 1) == 0
      && ([v3 isEqualToString:@"W"] & 1) == 0
      && ([v3 isEqualToString:@"PUB"] & 1) == 0)
    {
      [v3 isEqualToString:@"PC"];
    }
    int64_t v4 = 0;
  }

  return v4;
}

- (id)compile
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  int64_t v4 = [(ApprovalRequest *)self createdDate];
  [v4 timeIntervalSinceReferenceDate];
  int64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, @"createdTimeInterval");

  double v6 = [(ApprovalRequest *)self modifiedDate];
  [v6 timeIntervalSinceReferenceDate];
  int64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, @"modifiedTimeInterval");

  CFStringRef v8 = [(ApprovalRequest *)self requestIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v8, @"identifier");

  id v9 = [(ApprovalRequest *)self uniqueIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v9, @"uniqueIdentifier");

  id v10 = [(ApprovalRequest *)self itemIdentifier];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, @"itemIdentifier");

  id v11 = [(ApprovalRequest *)self ageRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, @"ageRating");

  uint64_t v12 = [(ApprovalRequest *)self approverDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v12, @"approverDSID");

  id v13 = [(ApprovalRequest *)self itemBundleID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v13, @"bundleID");

  __int16 v14 = +[NSNumber numberWithBool:[(ApprovalRequest *)self canSendViaMessages]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v14, @"canSendViaMessages");

  v15 = [(ApprovalRequest *)self itemTitle];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v15, @"itemTitle");

  id v16 = [(ApprovalRequest *)self itemDescription];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v16, @"itemDescription");

  id v17 = [(ApprovalRequest *)self localizations];
  uint64_t v18 = [v17 compile];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v18, @"localizations");

  id v19 = [(ApprovalRequest *)self offerName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v19, @"offerName");

  id v20 = +[NSNumber numberWithBool:[(ApprovalRequest *)self isMocked]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v20, @"mocked");

  id v21 = [(ApprovalRequest *)self localizedPrice];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v21, @"localizedPrice");

  id v22 = [(ApprovalRequest *)self previewURL];
  id v23 = [v22 absoluteString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v23, @"previewURL");

  uint64_t v24 = [(ApprovalRequest *)self productType];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v24, @"productType");

  id v25 = [(ApprovalRequest *)self productTypeName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v25, @"productTypeName");

  id v26 = [(ApprovalRequest *)self productURL];
  v27 = [v26 absoluteString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v27, @"productURL");

  id v28 = [(ApprovalRequest *)self thumbnailURLString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v28, @"thumbnailURL");

  id v29 = [(ApprovalRequest *)self requesterDSID];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v29, @"requesterDSID");

  uint64_t v30 = [(ApprovalRequest *)self requesterName];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v30, @"requesterName");

  id v31 = [(ApprovalRequest *)self starRating];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v31, @"starRating");

  id v32 = +[NSNumber numberWithInteger:[(ApprovalRequest *)self status]];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v32, @"status");

  id v33 = [(ApprovalRequest *)self requestString];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v33, @"requestString");

  uint64_t v34 = [(ApprovalRequest *)self requestSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v34, @"requestSummary");

  uint64_t v35 = [(ApprovalRequest *)self priceSummary];
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v35, @"priceSummary");

  return v3;
}

- (NSString)description
{
  id v3 = [(ApprovalRequest *)self compile];
  int64_t v4 = [(ApprovalRequest *)self ap_generateDescriptionWithSubObjects:v3];

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (NSString)approverDSID
{
  return self->_approverDSID;
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (NSString)itemBundleID
{
  return self->_itemBundleID;
}

- (BOOL)isMocked
{
  return self->_mocked;
}

- (NSString)offerName
{
  return self->_offerName;
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

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (NSNumber)starRating
{
  return self->_starRating;
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
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_thumbnailURLString, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_itemBundleID, 0);
  objc_storeStrong((id *)&self->_localizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_approverDSID, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end