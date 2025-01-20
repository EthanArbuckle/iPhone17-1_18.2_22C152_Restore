@interface BLPurchaseResponse
+ (BOOL)supportsSecureCoding;
- (BLPurchaseResponse)initWithAMSPurchaseResult:(id)a3;
- (BLPurchaseResponse)initWithCoder:(id)a3;
- (BLPurchaseResponse)initWithPurchase:(id)a3 error:(id)a4;
- (BOOL)hasRacGUID;
- (BOOL)isUserCancelError;
- (NSArray)purchaseResponseItems;
- (NSDictionary)item;
- (NSDictionary)metadata;
- (NSDictionary)responseMetrics;
- (NSNumber)errorCode;
- (NSNumber)firstUnderlyingErrorCode;
- (NSNumber)storeID;
- (NSNumber)supplementalContentCount;
- (NSString)currency;
- (NSString)downloadID;
- (NSString)errorDescription;
- (NSString)errorDomain;
- (NSString)firstUnderlyingErrorDomain;
- (NSString)firstUnderlyingErrorLocalizedDescription;
- (NSString)logUUID;
- (NSString)permLink;
- (NSString)price;
- (NSString)purchaseParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_updatePropertiesFromPurchaseError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setFirstUnderlyingErrorCode:(id)a3;
- (void)setFirstUnderlyingErrorDomain:(id)a3;
- (void)setFirstUnderlyingErrorLocalizedDescription:(id)a3;
- (void)setHasRacGUID:(BOOL)a3;
- (void)setIsUserCancelError:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLogUUID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPermLink:(id)a3;
- (void)setPrice:(id)a3;
- (void)setPurchaseParameters:(id)a3;
- (void)setPurchaseResponseItems:(id)a3;
- (void)setResponseMetrics:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setSupplementalContentCount:(id)a3;
@end

@implementation BLPurchaseResponse

- (BLPurchaseResponse)initWithAMSPurchaseResult:(id)a3
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v185.receiver = self;
  v185.super_class = (Class)BLPurchaseResponse;
  v6 = [(BLPurchaseResponse *)&v185 init];
  v7 = v6;
  if (v5 && v6)
  {
    objc_opt_class();
    v11 = objc_msgSend_responseDictionary(v5, v8, v9, v10);
    v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"songList", v13);
    v15 = BUDynamicCast();

    if (objc_msgSend_count(v15, v16, v17, v18))
    {
      v175 = v7;
      id v176 = v5;
      v180 = objc_opt_new();
      long long v181 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      id obj = v15;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v181, (uint64_t)v186, 16);
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v179 = *(void *)v182;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v182 != v179) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v181 + 1) + 8 * i);
            v27 = objc_alloc_init(BLPurchaseResponseItem);
            objc_msgSend_setItem_(v27, v28, (uint64_t)v26, v29);
            objc_opt_class();
            v32 = objc_msgSend_objectForKeyedSubscript_(v26, v30, @"metadata", v31);
            v33 = BUDynamicCast();
            objc_msgSend_setMetadata_(v27, v34, (uint64_t)v33, v35);

            v39 = objc_msgSend_metadata(v27, v36, v37, v38);
            v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"kind", v41);
            uint64_t isEqualToString = objc_msgSend_isEqualToString_(v42, v43, @"book", v44);
            objc_msgSend_setIsAudiobook_(v27, v46, isEqualToString, v47);

            v51 = objc_msgSend_metadata(v27, v48, v49, v50);
            v54 = objc_msgSend_objectForKeyedSubscript_(v51, v52, @"kind", v53);
            uint64_t v57 = objc_msgSend_isEqualToString_(v54, v55, @"pdf", v56);
            objc_msgSend_setIsPDF_(v27, v58, v57, v59);

            objc_opt_class();
            v64 = objc_msgSend_objectForKeyedSubscript_(v26, v60, @"buyParams", v61);
            if (v64)
            {
              int v65 = 0;
            }
            else
            {
              v3 = objc_msgSend_objectForKeyedSubscript_(v26, v62, @"action-params", v63);
              if (v3)
              {
                int v65 = 0;
              }
              else
              {
                objc_msgSend_objectForKeyedSubscript_(v26, v66, @"redownload-params", v67);
                v178 = int v65 = 1;
              }
            }
            v68 = BUDynamicCast();
            objc_msgSend_setPurchaseParameters_(v27, v69, (uint64_t)v68, v70);

            if (v65) {
            if (!v64)
            }

            objc_opt_class();
            v73 = objc_msgSend_objectForKeyedSubscript_(v26, v71, @"is-purchased-redownload", v72);
            v74 = BUDynamicCast();
            uint64_t v78 = objc_msgSend_BOOLValue(v74, v75, v76, v77);
            objc_msgSend_setIsPurchaseRedownload_(v27, v79, v78, v80);

            objc_msgSend_addObject_(v180, v81, (uint64_t)v27, v82);
          }
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v83, (uint64_t)&v181, (uint64_t)v186, 16);
        }
        while (v24);
      }

      uint64_t v87 = objc_msgSend_copy(v180, v84, v85, v86);
      v7 = v175;
      purchaseResponseItems = v175->_purchaseResponseItems;
      v175->_purchaseResponseItems = (NSArray *)v87;

      id v5 = v176;
    }
    v89 = objc_msgSend_purchase(v5, v19, v20, v21);
    v93 = objc_msgSend_buyParams(v89, v90, v91, v92);
    v97 = objc_msgSend_stringValue(v93, v94, v95, v96);
    uint64_t v100 = objc_msgSend_storeIDFromBuyParameters_(BLUtilities, v98, (uint64_t)v97, v99);
    storeID = v7->_storeID;
    v7->_storeID = (NSNumber *)v100;

    objc_opt_class();
    v105 = objc_msgSend_responseDictionary(v5, v102, v103, v104);
    v108 = objc_msgSend_objectForKeyedSubscript_(v105, v106, @"metrics", v107);
    v109 = BUDynamicCast();

    objc_storeStrong((id *)&v7->_responseMetrics, v109);
    objc_opt_class();
    v112 = objc_msgSend_objectForKeyedSubscript_(v109, v110, @"currency", v111);
    uint64_t v113 = BUDynamicCast();
    currency = v7->_currency;
    v7->_currency = (NSString *)v113;

    v117 = objc_msgSend_objectForKeyedSubscript_(v109, v115, @"price", v116);
    objc_opt_class();
    v118 = BUDynamicCast();
    if (!v118)
    {
      objc_opt_class();
      v119 = BUDynamicCast();
      v123 = v119;
      if (v119)
      {
        v118 = objc_msgSend_stringValue(v119, v120, v121, v122);
      }
      else
      {
        v118 = 0;
      }
    }
    objc_storeStrong((id *)&v7->_price, v118);
    v127 = objc_msgSend_purchase(v5, v124, v125, v126);
    v131 = objc_msgSend_buyParams(v127, v128, v129, v130);
    uint64_t v135 = objc_msgSend_stringValue(v131, v132, v133, v134);
    purchaseParameters = v7->_purchaseParameters;
    v7->_purchaseParameters = (NSString *)v135;

    v140 = objc_msgSend_purchase(v5, v137, v138, v139);
    uint64_t v144 = objc_msgSend_logUUID(v140, v141, v142, v143);
    logUUID = v7->_logUUID;
    v7->_logUUID = (NSString *)v144;

    v146 = [BLDownloadMetadata alloc];
    v150 = objc_msgSend_firstObject(v15, v147, v148, v149);
    v153 = objc_msgSend_initWithDictionary_(v146, v151, (uint64_t)v150, v152);

    v157 = objc_msgSend_racGUID(v153, v154, v155, v156);
    v7->_hasRacGUID = v157 != 0;

    v161 = objc_msgSend_firstObject(v7->_purchaseResponseItems, v158, v159, v160);
    int isAudiobook = objc_msgSend_isAudiobook(v161, v162, v163, v164);

    if (isAudiobook)
    {
      uint64_t v169 = objc_msgSend_valueForKeyPath_(v7->_purchaseResponseItems, v166, @"@sum.isPDF", v168);
      supplementalContentCount = v7->_supplementalContentCount;
      v7->_supplementalContentCount = (NSNumber *)v169;
    }
    v171 = objc_msgSend_error(v5, v166, v167, v168);
    objc_msgSend__updatePropertiesFromPurchaseError_(v7, v172, (uint64_t)v171, v173);
  }
  return v7;
}

- (BLPurchaseResponse)initWithPurchase:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)BLPurchaseResponse;
  v8 = [(BLPurchaseResponse *)&v32 init];
  uint64_t v9 = v8;
  if (v8)
  {
    purchaseResponseItems = v8->_purchaseResponseItems;
    v8->_purchaseResponseItems = 0;

    responseMetrics = v9->_responseMetrics;
    v9->_responseMetrics = 0;

    currency = v9->_currency;
    v9->_currency = 0;

    price = v9->_price;
    v9->_price = 0;

    uint64_t v17 = objc_msgSend_buyParams(v6, v14, v15, v16);
    uint64_t v21 = objc_msgSend_stringValue(v17, v18, v19, v20);
    purchaseParameters = v9->_purchaseParameters;
    v9->_purchaseParameters = (NSString *)v21;

    uint64_t v25 = objc_msgSend_storeIDFromBuyParameters_(BLUtilities, v23, (uint64_t)v9->_purchaseParameters, v24);
    storeID = v9->_storeID;
    v9->_storeID = (NSNumber *)v25;

    logUUID = v9->_logUUID;
    v9->_logUUID = 0;

    supplementalContentCount = v9->_supplementalContentCount;
    v9->_supplementalContentCount = 0;

    objc_msgSend__updatePropertiesFromPurchaseError_(v9, v29, (uint64_t)v7, v30);
  }

  return v9;
}

- (void)_updatePropertiesFromPurchaseError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v52 = v4;
    objc_msgSend_domain(v4, v5, v6, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDomain = self->_errorDomain;
    self->_errorDomain = v8;

    uint64_t v10 = NSNumber;
    uint64_t v14 = objc_msgSend_code(v52, v11, v12, v13);
    objc_msgSend_numberWithInteger_(v10, v15, v14, v16);
    uint64_t v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    errorCode = self->_errorCode;
    self->_errorCode = v17;

    objc_msgSend_localizedDescription(v52, v19, v20, v21);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDescription = self->_errorDescription;
    self->_errorDescription = v22;

    v27 = objc_msgSend_underlyingErrors(v52, v24, v25, v26);
    objc_opt_class();
    uint64_t v31 = objc_msgSend_firstObject(v27, v28, v29, v30);
    objc_super v32 = BUDynamicCast();

    if (v32)
    {
      objc_msgSend_domain(v32, v33, v34, v35);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorDomain = self->_firstUnderlyingErrorDomain;
      self->_firstUnderlyingErrorDomain = v36;

      uint64_t v38 = NSNumber;
      uint64_t v42 = objc_msgSend_code(v32, v39, v40, v41);
      objc_msgSend_numberWithInteger_(v38, v43, v42, v44);
      v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorCode = self->_firstUnderlyingErrorCode;
      self->_firstUnderlyingErrorCode = v45;

      objc_msgSend_localizedDescription(v32, v47, v48, v49);
      uint64_t v50 = (NSString *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorLocalizedDescription = self->_firstUnderlyingErrorLocalizedDescription;
      self->_firstUnderlyingErrorLocalizedDescription = v50;
    }
    self->_isUserCancelError = objc_msgSend_bl_isUserCancelError(v52, v33, v34, v35);

    id v4 = v52;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = (BLPurchaseResponse *)objc_msgSend_initWithAMSPurchaseResult_(self, v5, 0, v6);
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"currency");
    currency = v7->_currency;
    v7->_currency = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"errorCode");
    errorCode = v7->_errorCode;
    v7->_errorCode = (NSNumber *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"errorDescription");
    errorDescription = v7->_errorDescription;
    v7->_errorDescription = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"errorDomain");
    errorDomain = v7->_errorDomain;
    v7->_errorDomain = (NSString *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"firstUnderlyingErrorCode");
    firstUnderlyingErrorCode = v7->_firstUnderlyingErrorCode;
    v7->_firstUnderlyingErrorCode = (NSNumber *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"firstUnderlyingErrorDomain");
    firstUnderlyingErrorDomain = v7->_firstUnderlyingErrorDomain;
    v7->_firstUnderlyingErrorDomain = (NSString *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"firstUnderlyingErrorLocalizedDescription");
    firstUnderlyingErrorLocalizedDescription = v7->_firstUnderlyingErrorLocalizedDescription;
    v7->_firstUnderlyingErrorLocalizedDescription = (NSString *)v34;

    v7->_isUserCancelError = objc_msgSend_decodeBoolForKey_(v4, v36, @"isUserCancelError", v37);
    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"logUUID");
    logUUID = v7->_logUUID;
    v7->_logUUID = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"permLink");
    permLink = v7->_permLink;
    v7->_permLink = (NSString *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"price");
    price = v7->_price;
    v7->_price = (NSString *)v48;

    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"purchaseParameters");
    purchaseParameters = v7->_purchaseParameters;
    v7->_purchaseParameters = (NSString *)v52;

    v54 = (void *)MEMORY[0x263EFFA08];
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v61 = objc_msgSend_setWithObjects_(v54, v59, v55, v60, v56, v57, v58, 0);
    uint64_t v63 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v62, (uint64_t)v61, @"responseMetrics");
    responseMetrics = v7->_responseMetrics;
    v7->_responseMetrics = (NSDictionary *)v63;

    uint64_t v65 = objc_opt_class();
    uint64_t v67 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, @"storeID");
    storeID = v7->_storeID;
    v7->_storeID = (NSNumber *)v67;

    v69 = (void *)MEMORY[0x263EFFA08];
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    v74 = objc_msgSend_setWithObjects_(v69, v72, v70, v73, v71, 0);
    uint64_t v76 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v75, (uint64_t)v74, @"purchaseResponseItems");
    purchaseResponseItems = v7->_purchaseResponseItems;
    v7->_purchaseResponseItems = (NSArray *)v76;

    v7->_hasRacGUID = objc_msgSend_decodeBoolForKey_(v4, v78, @"hasRacGUID", v79);
    uint64_t v80 = objc_opt_class();
    uint64_t v82 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"supplementalContentCount");
    supplementalContentCount = v7->_supplementalContentCount;
    v7->_supplementalContentCount = (NSNumber *)v82;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_currency(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"currency");

  uint64_t v13 = objc_msgSend_errorCode(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"errorCode");

  uint64_t v18 = objc_msgSend_errorDescription(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"errorDescription");

  uint64_t v23 = objc_msgSend_errorDomain(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"errorDomain");

  uint64_t v28 = objc_msgSend_firstUnderlyingErrorCode(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, @"firstUnderlyingErrorCode");

  v33 = objc_msgSend_firstUnderlyingErrorDomain(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"firstUnderlyingErrorDomain");

  uint64_t v38 = objc_msgSend_firstUnderlyingErrorLocalizedDescription(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"firstUnderlyingErrorLocalizedDescription");

  uint64_t isUserCancelError = objc_msgSend_isUserCancelError(self, v40, v41, v42);
  objc_msgSend_encodeBool_forKey_(v4, v44, isUserCancelError, @"isUserCancelError");
  uint64_t v48 = objc_msgSend_logUUID(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, @"logUUID");

  uint64_t v53 = objc_msgSend_permLink(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, @"permLink");

  uint64_t v58 = objc_msgSend_price(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v4, v59, (uint64_t)v58, @"price");

  uint64_t v63 = objc_msgSend_purchaseParameters(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v4, v64, (uint64_t)v63, @"purchaseParameters");

  v68 = objc_msgSend_responseMetrics(self, v65, v66, v67);
  objc_msgSend_encodeObject_forKey_(v4, v69, (uint64_t)v68, @"responseMetrics");

  uint64_t v73 = objc_msgSend_storeID(self, v70, v71, v72);
  objc_msgSend_encodeObject_forKey_(v4, v74, (uint64_t)v73, @"storeID");

  uint64_t v78 = objc_msgSend_purchaseResponseItems(self, v75, v76, v77);
  objc_msgSend_encodeObject_forKey_(v4, v79, (uint64_t)v78, @"purchaseResponseItems");

  uint64_t hasRacGUID = objc_msgSend_hasRacGUID(self, v80, v81, v82);
  objc_msgSend_encodeBool_forKey_(v4, v84, hasRacGUID, @"hasRacGUID");
  objc_msgSend_supplementalContentCount(self, v85, v86, v87);
  id v89 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v89, @"supplementalContentCount");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_opt_new();
  if (v7)
  {
    uint64_t v8 = objc_msgSend_currency(self, v4, v5, v6);
    objc_msgSend_setCurrency_(v7, v9, (uint64_t)v8, v10);

    uint64_t v14 = objc_msgSend_errorCode(self, v11, v12, v13);
    objc_msgSend_setErrorCode_(v7, v15, (uint64_t)v14, v16);

    uint64_t v20 = objc_msgSend_errorDescription(self, v17, v18, v19);
    objc_msgSend_setErrorDescription_(v7, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_errorDomain(self, v23, v24, v25);
    objc_msgSend_setErrorDomain_(v7, v27, (uint64_t)v26, v28);

    uint64_t v32 = objc_msgSend_firstUnderlyingErrorCode(self, v29, v30, v31);
    objc_msgSend_setFirstUnderlyingErrorCode_(v7, v33, (uint64_t)v32, v34);

    uint64_t v38 = objc_msgSend_firstUnderlyingErrorDomain(self, v35, v36, v37);
    objc_msgSend_setFirstUnderlyingErrorDomain_(v7, v39, (uint64_t)v38, v40);

    uint64_t v44 = objc_msgSend_firstUnderlyingErrorLocalizedDescription(self, v41, v42, v43);
    objc_msgSend_setFirstUnderlyingErrorLocalizedDescription_(v7, v45, (uint64_t)v44, v46);

    uint64_t isUserCancelError = objc_msgSend_isUserCancelError(self, v47, v48, v49);
    objc_msgSend_setIsUserCancelError_(v7, v51, isUserCancelError, v52);
    uint64_t v56 = objc_msgSend_logUUID(self, v53, v54, v55);
    objc_msgSend_setLogUUID_(v7, v57, (uint64_t)v56, v58);

    uint64_t v62 = objc_msgSend_permLink(self, v59, v60, v61);
    objc_msgSend_setPermLink_(v7, v63, (uint64_t)v62, v64);

    v68 = objc_msgSend_price(self, v65, v66, v67);
    objc_msgSend_setPrice_(v7, v69, (uint64_t)v68, v70);

    v74 = objc_msgSend_purchaseParameters(self, v71, v72, v73);
    objc_msgSend_setPurchaseParameters_(v7, v75, (uint64_t)v74, v76);

    uint64_t v80 = objc_msgSend_responseMetrics(self, v77, v78, v79);
    objc_msgSend_setResponseMetrics_(v7, v81, (uint64_t)v80, v82);

    uint64_t v86 = objc_msgSend_storeID(self, v83, v84, v85);
    objc_msgSend_setStoreID_(v7, v87, (uint64_t)v86, v88);

    uint64_t v92 = objc_msgSend_purchaseResponseItems(self, v89, v90, v91);
    objc_msgSend_setPurchaseResponseItems_(v7, v93, (uint64_t)v92, v94);

    uint64_t hasRacGUID = objc_msgSend_hasRacGUID(self, v95, v96, v97);
    objc_msgSend_setHasRacGUID_(v7, v99, hasRacGUID, v100);
    uint64_t v104 = objc_msgSend_supplementalContentCount(self, v101, v102, v103);
    objc_msgSend_setSupplementalContentCount_(v7, v105, (uint64_t)v104, v106);
  }
  return v7;
}

- (NSDictionary)item
{
  id v4 = objc_msgSend_purchaseResponseItems(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_firstObject(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_item(v8, v9, v10, v11);

  return (NSDictionary *)v12;
}

- (NSString)downloadID
{
  id v4 = objc_msgSend_purchaseResponseItems(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_firstObject(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_downloadID(v8, v9, v10, v11);

  return (NSString *)v12;
}

- (NSDictionary)metadata
{
  id v4 = objc_msgSend_purchaseResponseItems(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_firstObject(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_metadata(v8, v9, v10, v11);

  return (NSDictionary *)v12;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (void)setLogUUID:(id)a3
{
}

- (NSString)permLink
{
  return self->_permLink;
}

- (void)setPermLink:(id)a3
{
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (NSDictionary)responseMetrics
{
  return self->_responseMetrics;
}

- (void)setResponseMetrics:(id)a3
{
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (BOOL)hasRacGUID
{
  return self->_hasRacGUID;
}

- (void)setHasRacGUID:(BOOL)a3
{
  self->_uint64_t hasRacGUID = a3;
}

- (NSNumber)supplementalContentCount
{
  return self->_supplementalContentCount;
}

- (void)setSupplementalContentCount:(id)a3
{
}

- (NSArray)purchaseResponseItems
{
  return self->_purchaseResponseItems;
}

- (void)setPurchaseResponseItems:(id)a3
{
}

- (void)setItem:(id)a3
{
}

- (void)setDownloadID:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (NSString)purchaseParameters
{
  return self->_purchaseParameters;
}

- (void)setPurchaseParameters:(id)a3
{
}

- (NSNumber)firstUnderlyingErrorCode
{
  return self->_firstUnderlyingErrorCode;
}

- (void)setFirstUnderlyingErrorCode:(id)a3
{
}

- (NSString)firstUnderlyingErrorDomain
{
  return self->_firstUnderlyingErrorDomain;
}

- (void)setFirstUnderlyingErrorDomain:(id)a3
{
}

- (NSString)firstUnderlyingErrorLocalizedDescription
{
  return self->_firstUnderlyingErrorLocalizedDescription;
}

- (void)setFirstUnderlyingErrorLocalizedDescription:(id)a3
{
}

- (BOOL)isUserCancelError
{
  return self->_isUserCancelError;
}

- (void)setIsUserCancelError:(BOOL)a3
{
  self->_uint64_t isUserCancelError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnderlyingErrorLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_firstUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_firstUnderlyingErrorCode, 0);
  objc_storeStrong((id *)&self->_purchaseParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_purchaseResponseItems, 0);
  objc_storeStrong((id *)&self->_supplementalContentCount, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_responseMetrics, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);

  objc_storeStrong((id *)&self->_currency, 0);
}

@end