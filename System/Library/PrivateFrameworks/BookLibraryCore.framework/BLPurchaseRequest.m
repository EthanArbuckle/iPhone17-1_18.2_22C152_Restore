@interface BLPurchaseRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithBuyParameters:(id)a3 storeIdentifier:(id)a4;
+ (id)requestWithPermlink:(id)a3 title:(id)a4;
- (BLPurchaseRequest)initWithCoder:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isPreOrder;
- (BOOL)isRestore;
- (BOOL)isSupplementalContent;
- (BOOL)isUserInitiated;
- (BOOL)shouldSuppressNetworkEvaluatorDialogs;
- (NSDictionary)analyticsInfo;
- (NSNumber)accountIdentifier;
- (NSNumber)storeIdentifier;
- (NSSet)storeIdentifiersToDownload;
- (NSString)buyParameters;
- (NSString)logUUID;
- (NSString)permlinkTitle;
- (NSString)presentingSceneIdentifier;
- (NSURL)permlink;
- (NSXPCListenerEndpoint)paymentSheetListenerEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAnalyticsInfo:(id)a3;
- (void)setAudiobook:(BOOL)a3;
- (void)setBuyParameters:(id)a3;
- (void)setLogUUID:(id)a3;
- (void)setPaymentSheetListenerEndpoint:(id)a3;
- (void)setPermlink:(id)a3;
- (void)setPermlinkTitle:(id)a3;
- (void)setPreOrder:(BOOL)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRestore:(BOOL)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setStoreIdentifiersToDownload:(id)a3;
- (void)setSupplementalContent:(BOOL)a3;
- (void)setSuppressNetworkEvaluatorDialogs:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation BLPurchaseRequest

+ (id)requestWithBuyParameters:(id)a3 storeIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BLPurchaseRequest);
  objc_msgSend_setBuyParameters_(v7, v8, (uint64_t)v6, v9);
  objc_msgSend_setStoreIdentifier_(v7, v10, (uint64_t)v5, v11);

  uint64_t isPreOrderFromBuyParameters = objc_msgSend_isPreOrderFromBuyParameters_(BLUtilities, v12, (uint64_t)v6, v13);
  objc_msgSend_setPreOrder_(v7, v15, isPreOrderFromBuyParameters, v16);
  objc_msgSend_setUserInitiated_(v7, v17, 1, v18);

  return v7;
}

+ (id)requestWithPermlink:(id)a3 title:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BLPurchaseRequest);
  objc_msgSend_setPermlink_(v7, v8, (uint64_t)v6, v9);

  objc_msgSend_setPermlinkTitle_(v7, v10, (uint64_t)v5, v11);
  objc_msgSend_setUserInitiated_(v7, v12, 1, v13);

  return v7;
}

- (NSString)logUUID
{
  logUUID = self->_logUUID;
  if (!logUUID)
  {
    if (qword_267D253F8 != -1) {
      dispatch_once(&qword_267D253F8, &unk_26CED3E30);
    }
    logUUID = (NSString *)qword_267D253F0;
  }
  v3 = logUUID;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v118.receiver = self;
  v118.super_class = (Class)BLPurchaseRequest;
  id v5 = [(BLPurchaseRequest *)&v118 init];
  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"audiobook");
    uint64_t v9 = BUDynamicCast();
    uint64_t v13 = objc_msgSend_BOOLValue(v9, v10, v11, v12);
    objc_msgSend_setAudiobook_(v5, v14, v13, v15);

    objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"preOrder");
    v19 = BUDynamicCast();
    uint64_t v23 = objc_msgSend_BOOLValue(v19, v20, v21, v22);
    objc_msgSend_setPreOrder_(v5, v24, v23, v25);

    objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"restore");
    v29 = BUDynamicCast();
    uint64_t v33 = objc_msgSend_BOOLValue(v29, v30, v31, v32);
    objc_msgSend_setRestore_(v5, v34, v33, v35);

    objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"supplementalContent");
    v39 = BUDynamicCast();
    uint64_t v43 = objc_msgSend_BOOLValue(v39, v40, v41, v42);
    objc_msgSend_setSupplementalContent_(v5, v44, v43, v45);

    objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"suppressNetworkEvaluatorDialogs");
    v49 = BUDynamicCast();
    uint64_t v53 = objc_msgSend_BOOLValue(v49, v50, v51, v52);
    objc_msgSend_setSuppressNetworkEvaluatorDialogs_(v5, v54, v53, v55);

    objc_opt_class();
    uint64_t v56 = objc_opt_class();
    v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, @"userInitiated");
    v59 = BUDynamicCast();
    uint64_t v63 = objc_msgSend_BOOLValue(v59, v60, v61, v62);
    objc_msgSend_setUserInitiated_(v5, v64, v63, v65);

    objc_opt_class();
    uint64_t v66 = objc_opt_class();
    v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"presentingSceneIdentifier");
    v69 = BUDynamicCast();
    objc_msgSend_setPresentingSceneIdentifier_(v5, v70, (uint64_t)v69, v71);

    uint64_t v72 = objc_opt_class();
    v74 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, @"storeIdentifier");
    objc_msgSend_setStoreIdentifier_(v5, v75, (uint64_t)v74, v76);

    v77 = (void *)MEMORY[0x263EFFA08];
    uint64_t v78 = objc_opt_class();
    uint64_t v79 = objc_opt_class();
    v82 = objc_msgSend_setWithObjects_(v77, v80, v78, v81, v79, 0);
    v84 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v83, (uint64_t)v82, @"storeIdentifiersToDownload");
    objc_msgSend_setStoreIdentifiersToDownload_(v5, v85, (uint64_t)v84, v86);

    uint64_t v87 = objc_opt_class();
    v89 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, @"buyParameters");
    objc_msgSend_setBuyParameters_(v5, v90, (uint64_t)v89, v91);

    uint64_t v92 = objc_opt_class();
    v94 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, @"permlink");
    objc_msgSend_setPermlink_(v5, v95, (uint64_t)v94, v96);

    uint64_t v97 = objc_opt_class();
    v99 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v98, v97, @"permlinkTitle");
    objc_msgSend_setPermlinkTitle_(v5, v100, (uint64_t)v99, v101);

    uint64_t v102 = objc_opt_class();
    v104 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v103, v102, @"accountIdentifier");
    objc_msgSend_setAccountIdentifier_(v5, v105, (uint64_t)v104, v106);

    uint64_t v107 = objc_opt_class();
    v109 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v108, v107, @"logUUID");
    objc_msgSend_setLogUUID_(v5, v110, (uint64_t)v109, v111);

    uint64_t v112 = objc_opt_class();
    v114 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v113, v112, @"paymentSheetListenerEndpoint");
    objc_msgSend_setPaymentSheetListenerEndpoint_(v5, v115, (uint64_t)v114, v116);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_numberWithBool_(v4, v10, isAudiobook, v11);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v12, @"audiobook");

  v14 = NSNumber;
  uint64_t isPreOrder = objc_msgSend_isPreOrder(self, v15, v16, v17);
  uint64_t v21 = objc_msgSend_numberWithBool_(v14, v19, isPreOrder, v20);
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)v21, @"preOrder");

  uint64_t v23 = NSNumber;
  uint64_t isRestore = objc_msgSend_isRestore(self, v24, v25, v26);
  v30 = objc_msgSend_numberWithBool_(v23, v28, isRestore, v29);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)v30, @"restore");

  uint64_t v32 = NSNumber;
  uint64_t isSupplementalContent = objc_msgSend_isSupplementalContent(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithBool_(v32, v37, isSupplementalContent, v38);
  objc_msgSend_encodeObject_forKey_(v5, v40, (uint64_t)v39, @"supplementalContent");

  uint64_t v41 = NSNumber;
  uint64_t shouldSuppressNetworkEvaluatorDialogs = objc_msgSend_shouldSuppressNetworkEvaluatorDialogs(self, v42, v43, v44);
  v48 = objc_msgSend_numberWithBool_(v41, v46, shouldSuppressNetworkEvaluatorDialogs, v47);
  objc_msgSend_encodeObject_forKey_(v5, v49, (uint64_t)v48, @"suppressNetworkEvaluatorDialogs");

  v50 = NSNumber;
  uint64_t isUserInitiated = objc_msgSend_isUserInitiated(self, v51, v52, v53);
  v57 = objc_msgSend_numberWithBool_(v50, v55, isUserInitiated, v56);
  objc_msgSend_encodeObject_forKey_(v5, v58, (uint64_t)v57, @"userInitiated");

  uint64_t v62 = objc_msgSend_presentingSceneIdentifier(self, v59, v60, v61);
  objc_msgSend_encodeObject_forKey_(v5, v63, (uint64_t)v62, @"presentingSceneIdentifier");

  v67 = objc_msgSend_storeIdentifier(self, v64, v65, v66);
  objc_msgSend_encodeObject_forKey_(v5, v68, (uint64_t)v67, @"storeIdentifier");

  uint64_t v72 = objc_msgSend_storeIdentifiersToDownload(self, v69, v70, v71);
  objc_msgSend_encodeObject_forKey_(v5, v73, (uint64_t)v72, @"storeIdentifiersToDownload");

  v77 = objc_msgSend_buyParameters(self, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v5, v78, (uint64_t)v77, @"buyParameters");

  v82 = objc_msgSend_permlink(self, v79, v80, v81);
  objc_msgSend_encodeObject_forKey_(v5, v83, (uint64_t)v82, @"permlink");

  uint64_t v87 = objc_msgSend_permlinkTitle(self, v84, v85, v86);
  objc_msgSend_encodeObject_forKey_(v5, v88, (uint64_t)v87, @"permlinkTitle");

  uint64_t v92 = objc_msgSend_accountIdentifier(self, v89, v90, v91);
  objc_msgSend_encodeObject_forKey_(v5, v93, (uint64_t)v92, @"accountIdentifier");

  uint64_t v97 = objc_msgSend_logUUID(self, v94, v95, v96);
  objc_msgSend_encodeObject_forKey_(v5, v98, (uint64_t)v97, @"logUUID");

  objc_msgSend_paymentSheetListenerEndpoint(self, v99, v100, v101);
  id v103 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v102, (uint64_t)v103, @"paymentSheetListenerEndpoint");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_opt_new();
  if (v7)
  {
    uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v4, v5, v6);
    objc_msgSend_setAudiobook_(v7, v9, isAudiobook, v10);
    v14 = objc_msgSend_storeIdentifier(self, v11, v12, v13);
    objc_msgSend_setStoreIdentifier_(v7, v15, (uint64_t)v14, v16);

    uint64_t v20 = objc_msgSend_storeIdentifiersToDownload(self, v17, v18, v19);
    objc_msgSend_setStoreIdentifiersToDownload_(v7, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_buyParameters(self, v23, v24, v25);
    objc_msgSend_setBuyParameters_(v7, v27, (uint64_t)v26, v28);

    uint64_t v32 = objc_msgSend_permlink(self, v29, v30, v31);
    objc_msgSend_setPermlink_(v7, v33, (uint64_t)v32, v34);

    uint64_t v38 = objc_msgSend_permlinkTitle(self, v35, v36, v37);
    objc_msgSend_setPermlinkTitle_(v7, v39, (uint64_t)v38, v40);

    uint64_t isPreOrder = objc_msgSend_isPreOrder(self, v41, v42, v43);
    objc_msgSend_setPreOrder_(v7, v45, isPreOrder, v46);
    uint64_t isRestore = objc_msgSend_isRestore(self, v47, v48, v49);
    objc_msgSend_setRestore_(v7, v51, isRestore, v52);
    uint64_t isSupplementalContent = objc_msgSend_isSupplementalContent(self, v53, v54, v55);
    objc_msgSend_setSupplementalContent_(v7, v57, isSupplementalContent, v58);
    uint64_t shouldSuppressNetworkEvaluatorDialogs = objc_msgSend_shouldSuppressNetworkEvaluatorDialogs(self, v59, v60, v61);
    objc_msgSend_setSuppressNetworkEvaluatorDialogs_(v7, v63, shouldSuppressNetworkEvaluatorDialogs, v64);
    uint64_t isUserInitiated = objc_msgSend_isUserInitiated(self, v65, v66, v67);
    objc_msgSend_setUserInitiated_(v7, v69, isUserInitiated, v70);
    v74 = objc_msgSend_presentingSceneIdentifier(self, v71, v72, v73);
    objc_msgSend_setPresentingSceneIdentifier_(v7, v75, (uint64_t)v74, v76);

    uint64_t v80 = objc_msgSend_accountIdentifier(self, v77, v78, v79);
    objc_msgSend_setAccountIdentifier_(v7, v81, (uint64_t)v80, v82);

    uint64_t v86 = objc_msgSend_logUUID(self, v83, v84, v85);
    objc_msgSend_setLogUUID_(v7, v87, (uint64_t)v86, v88);

    uint64_t v92 = objc_msgSend_paymentSheetListenerEndpoint(self, v89, v90, v91);
    objc_msgSend_setPaymentSheetListenerEndpoint_(v7, v93, (uint64_t)v92, v94);
  }
  return v7;
}

- (void)setLogUUID:(id)a3
{
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
}

- (BOOL)isAudiobook
{
  return self->_audiobook;
}

- (void)setAudiobook:(BOOL)a3
{
  self->_audiobook = a3;
}

- (BOOL)isPreOrder
{
  return self->_preOrder;
}

- (void)setPreOrder:(BOOL)a3
{
  self->_preOrder = a3;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
}

- (NSString)permlinkTitle
{
  return self->_permlinkTitle;
}

- (void)setPermlinkTitle:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSDictionary)analyticsInfo
{
  return self->_analyticsInfo;
}

- (void)setAnalyticsInfo:(id)a3
{
}

- (BOOL)isRestore
{
  return self->_restore;
}

- (void)setRestore:(BOOL)a3
{
  self->_restore = a3;
}

- (BOOL)shouldSuppressNetworkEvaluatorDialogs
{
  return self->_suppressNetworkEvaluatorDialogs;
}

- (void)setSuppressNetworkEvaluatorDialogs:(BOOL)a3
{
  self->_suppressNetworkEvaluatorDialogs = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (NSSet)storeIdentifiersToDownload
{
  return self->_storeIdentifiersToDownload;
}

- (void)setStoreIdentifiersToDownload:(id)a3
{
}

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
}

- (NSXPCListenerEndpoint)paymentSheetListenerEndpoint
{
  return self->_paymentSheetListenerEndpoint;
}

- (void)setPaymentSheetListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_storeIdentifiersToDownload, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsInfo, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_permlinkTitle, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);

  objc_storeStrong((id *)&self->_logUUID, 0);
}

@end