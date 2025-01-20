@interface APContentData
+ (BOOL)supportsSecureCoding;
+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5;
+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5 size:(id)a6;
+ (id)mockDataFromContext:(id)a3 types:(id)a4;
- (APContentData)init;
- (APContentData)initWithCoder:(id)a3;
- (APInstallAttribution)installAttribution;
- (BOOL)hasValidRepresentation;
- (BOOL)isLocationAvailableForAd;
- (BOOL)isPAAvailableForAd;
- (NSArray)adServerEnvironment;
- (NSDate)expirationDate;
- (NSDate)receivedReferenceTime;
- (NSDictionary)metadata;
- (NSError)error;
- (NSSet)representations;
- (NSString)brandName;
- (NSString)campaignText;
- (NSString)disclosureRendererPayload;
- (NSString)humanReadableName;
- (NSString)identifier;
- (NSString)journeyIdentifier;
- (NSString)targetingExpressionId;
- (NSString)uniqueIdentifier;
- (NSURL)disclosureURL;
- (NSUUID)contextIdentifier;
- (double)impressionThreshold;
- (double)impressionVisibilityThreshold;
- (double)serverResponseReceivedTimestamp;
- (id)getRepresentation;
- (id)representationWithIdentifier:(id)a3;
- (int64_t)diagnosticCode;
- (int64_t)pricingModel;
- (int64_t)serverUnfilledReason;
- (unint64_t)minimumTimeBetweenPresentation;
- (void)_correctNonNullableFields;
- (void)addRepresentation:(id)a3;
- (void)addRepresentations:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeRepresentation:(id)a3;
- (void)setAdServerEnvironment:(id)a3;
- (void)setBrandName:(id)a3;
- (void)setCampaignText:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setDiagnosticCode:(int64_t)a3;
- (void)setDisclosureRendererPayload:(id)a3;
- (void)setDisclosureURL:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHumanReadableName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressionThreshold:(double)a3;
- (void)setImpressionVisibilityThreshold:(double)a3;
- (void)setInstallAttribution:(id)a3;
- (void)setIsLocationAvailableForAd:(BOOL)a3;
- (void)setIsPAAvailableForAd:(BOOL)a3;
- (void)setJourneyIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMinimumTimeBetweenPresentation:(unint64_t)a3;
- (void)setReceivedReferenceTime:(id)a3;
- (void)setRepresentations:(id)a3;
- (void)setServerResponseReceivedTimestamp:(double)a3;
- (void)setServerUnfilledReason:(int64_t)a3;
- (void)setTargetingExpressionId:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation APContentData

+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](APContentData, sel_createForServerUnfilledReason_placementType_contextIdentifier_size_, a3, a4, a5, 0.0, 0.0);
}

+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5 size:(id)a6
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  id v10 = a5;
  v11 = objc_alloc_init(APContentData);
  objc_msgSend_setServerUnfilledReason_(v11, v12, a3, v13, v14, v15, v16);
  objc_msgSend_setContextIdentifier_(v11, v17, (uint64_t)v10, v18, v19, v20, v21);

  v22 = objc_alloc_init(APRepresentationData);
  objc_msgSend_setPlacementType_(v22, v23, a4, v24, v25, v26, v27);
  objc_msgSend_setSize_(v22, v28, v29, v30, v31, var0, var1);
  v38 = objc_msgSend_identifier(v11, v32, v33, v34, v35, v36, v37);
  objc_msgSend_setContentDataIdentifier_(v22, v39, (uint64_t)v38, v40, v41, v42, v43);

  v50 = objc_msgSend_UUID(MEMORY[0x263F08C38], v44, v45, v46, v47, v48, v49);
  objc_msgSend_setIAdID_(v22, v51, (uint64_t)v50, v52, v53, v54, v55);

  v62 = objc_msgSend_UUID(MEMORY[0x263F08C38], v56, v57, v58, v59, v60, v61);
  objc_msgSend_setImpressionID_(v22, v63, (uint64_t)v62, v64, v65, v66, v67);

  objc_msgSend_addRepresentation_(v11, v68, (uint64_t)v22, v69, v70, v71, v72);
  return v11;
}

- (BOOL)hasValidRepresentation
{
  v12 = objc_msgSend_error(self, a2, v2, v3, v4, v5, v6);
  if (v12 || objc_msgSend_serverUnfilledReason(self, v8, v9, v10, v11, v13, v14))
  {
    BOOL v21 = 0;
  }
  else
  {
    v23 = objc_msgSend_representations(self, v15, v16, v17, v18, v19, v20);
    BOOL v21 = objc_msgSend_count(v23, v24, v25, v26, v27, v28, v29) != 0;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mockDataFromContext:(id)a3 types:(id)a4
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(APContentData);
  v132 = v5;
  double v14 = objc_msgSend_identifier(v5, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setContextIdentifier_(v7, v15, (uint64_t)v14, v16, v17, v18, v19);

  uint64_t v26 = objc_msgSend_UUID(MEMORY[0x263F08C38], v20, v21, v22, v23, v24, v25);
  uint64_t v33 = objc_msgSend_UUIDString(v26, v27, v28, v29, v30, v31, v32);
  objc_msgSend_setJourneyIdentifier_(v7, v34, (uint64_t)v33, v35, v36, v37, v38);

  objc_msgSend_setMetadata_(v7, v39, MEMORY[0x263EFFA78], v40, v41, v42, v43);
  objc_msgSend_setDisclosureRendererPayload_(v7, v44, @"CAISBWVuX1VTOAFwAg", v45, v46, v47, v48);
  double v54 = objc_msgSend_URLWithString_(NSURL, v49, @"https://iad2v1-iadsdk.iad.apple.com/adserver/2.6/segment/privacyrender/1.0/ad", v50, v51, v52, v53);
  objc_msgSend_setDisclosureURL_(v7, v55, (uint64_t)v54, v56, v57, v58, v59);

  objc_msgSend_setMinimumTimeBetweenPresentation_(v7, v60, 2, v61, v62, v63, v64);
  objc_msgSend_setBrandName_(v7, v65, @"Brand name", v66, v67, v68, v69);
  objc_msgSend_setCampaignText_(v7, v70, @"Campaign text", v71, v72, v73, v74);
  v80 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v75, v76, v77, v78, 3600.0, v79);
  objc_msgSend_setExpirationDate_(v7, v81, (uint64_t)v80, v82, v83, v84, v85);

  v92 = objc_msgSend_array(MEMORY[0x263EFF980], v86, v87, v88, v89, v90, v91);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v93 = v6;
  uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v133, (uint64_t)v139, 16, v95, v96);
  if (v97)
  {
    uint64_t v104 = v97;
    uint64_t v105 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v104; ++i)
      {
        if (*(void *)v134 != v105) {
          objc_enumerationMutation(v93);
        }
        switch(objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v133 + 1) + 8 * i), v98, v99, v100, v101, v102, v103))
        {
          case 0:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeAnyBanner", buf, 2u);
            }
            uint64_t v108 = 0;
            break;
          case 1:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeInterstitial", buf, 2u);
            }
            uint64_t v108 = 1;
            break;
          case 2:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeAudio", buf, 2u);
            }
            uint64_t v108 = 2;
            break;
          case 3:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeVideo", buf, 2u);
            }
            uint64_t v108 = 3;
            break;
          case 4:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeNative", buf, 2u);
            }
            uint64_t v108 = 4;
            break;
          case 5:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeApp", buf, 2u);
            }
            uint64_t v108 = 5;
            break;
          case 7:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeSponsorship", buf, 2u);
            }
            uint64_t v108 = 7;
            break;
          default:
            v107 = APLogForCategory();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226303000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeUndefined", buf, 2u);
            }
            uint64_t v108 = -1;
            break;
        }

        v113 = objc_msgSend_mockRepresentationWithType_contentData_(APRepresentationData, v109, v108, (uint64_t)v7, v110, v111, v112);
        objc_msgSend_addObject_(v92, v114, (uint64_t)v113, v115, v116, v117, v118);
      }
      uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v98, (uint64_t)&v133, (uint64_t)v139, 16, v102, v103);
    }
    while (v104);
  }

  v119 = APLogForCategory();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v138 = v92;
    _os_log_impl(&dword_226303000, v119, OS_LOG_TYPE_INFO, "Creating representations set with %{public}@", buf, 0xCu);
  }

  v125 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v120, (uint64_t)v92, v121, v122, v123, v124);
  objc_msgSend_setRepresentations_(v7, v126, (uint64_t)v125, v127, v128, v129, v130);

  return v7;
}

- (APContentData)init
{
  v11.receiver = self;
  v11.super_class = (Class)APContentData;
  uint64_t v2 = [(APContentData *)&v11 init];
  uint64_t v9 = v2;
  if (v2)
  {
    objc_msgSend__correctNonNullableFields(v2, v3, v4, v5, v6, v7, v8);
    v9->_diagnosticCode = -1;
  }
  return v9;
}

- (void)_correctNonNullableFields
{
  v38[2] = *MEMORY[0x263EF8340];
  if (!self->_identifier)
  {
    double v8 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, v2, v3, v4, v5, v6);
    objc_msgSend_UUIDString(v8, v9, v10, v11, v12, v13, v14);
    double v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v15;
  }
  if (!self->_contextIdentifier)
  {
    v38[0] = 0;
    v38[1] = 0;
    id v17 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v23 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v17, v18, (uint64_t)v38, v19, v20, v21, v22);
    contextIdentifier = self->_contextIdentifier;
    self->_contextIdentifier = v23;
  }
  if (!self->_journeyIdentifier)
  {
    double v25 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, v2, v3, v4, v5, v6);
    objc_msgSend_UUIDString(v25, v26, v27, v28, v29, v30, v31);
    double v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    journeyIdentifier = self->_journeyIdentifier;
    self->_journeyIdentifier = v32;
  }
  if (!self->_uniqueIdentifier)
  {
    self->_uniqueIdentifier = (NSString *)@"UniqueIdentifierPlaceholder";
  }
  if (!self->_representations)
  {
    objc_msgSend_set(MEMORY[0x263EFF9C0], a2, v2, v3, v4, v5, v6);
    uint64_t v34 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    representations = self->_representations;
    self->_representations = v34;
  }
  if (!self->_expirationDate)
  {
    objc_msgSend_distantFuture(MEMORY[0x263EFF910], a2, v2, v3, v4, v5, v6);
    uint64_t v36 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v36;
  }
}

- (APContentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v199.receiver = self;
  v199.super_class = (Class)APContentData;
  double v5 = [(APContentData *)&v199 init];
  double v6 = v5;
  if (v5)
  {
    v5->_diagnosticCode = -1;
    context = (void *)MEMORY[0x22A64D040]();
    uint64_t v7 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"identifier", v9, v10, v11);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"contextIdentifier", v16, v17, v18);
    contextIdentifier = v6->_contextIdentifier;
    v6->_contextIdentifier = (NSUUID *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"journeyIdentifier", v23, v24, v25);
    journeyIdentifier = v6->_journeyIdentifier;
    v6->_journeyIdentifier = (NSString *)v26;

    uint64_t v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v36 = objc_msgSend_setWithObjects_(v28, v31, v29, v32, v33, v34, v35, v30, 0);
    uint64_t v41 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, @"metadata", v38, v39, v40);
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v41;

    uint64_t v43 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"disclosureURL", v45, v46, v47);
    disclosureURL = v6->_disclosureURL;
    v6->_disclosureURL = (NSURL *)v48;

    if (objc_msgSend_containsValueForKey_(v4, v50, @"disclosureRendererPayload", v51, v52, v53, v54))
    {
      uint64_t v60 = objc_opt_class();
      uint64_t v65 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, @"disclosureRendererPayload", v62, v63, v64);
      disclosureRendererPayload = v6->_disclosureRendererPayload;
      v6->_disclosureRendererPayload = (NSString *)v65;
    }
    v6->_minimumTimeBetweenPresentation = (int)objc_msgSend_decodeIntForKey_(v4, v55, @"minimumTimeBetweenPresentation", v56, v57, v58, v59);
    uint64_t v67 = objc_opt_class();
    uint64_t v72 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, @"brandName", v69, v70, v71);
    brandName = v6->_brandName;
    v6->_brandName = (NSString *)v72;

    uint64_t v74 = objc_opt_class();
    uint64_t v79 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v74, @"campaignText", v76, v77, v78);
    campaignText = v6->_campaignText;
    v6->_campaignText = (NSString *)v79;

    uint64_t v81 = objc_opt_class();
    uint64_t v86 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, @"targetingExpressionId", v83, v84, v85);
    targetingExpressionId = v6->_targetingExpressionId;
    v6->_targetingExpressionId = (NSString *)v86;

    uint64_t v88 = objc_opt_class();
    uint64_t v93 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, @"expirationDate", v90, v91, v92);
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v93;

    objc_msgSend_decodeDoubleForKey_(v4, v95, @"impressionThreshold", v96, v97, v98, v99);
    v6->_impressionThreshold = v100;
    objc_msgSend_decodeDoubleForKey_(v4, v101, @"impressionVisiblityThreshold", v102, v103, v100, v104);
    v6->_impressionVisibilityThreshold = v105;
    v6->_serverUnfilledReason = (int)objc_msgSend_decodeIntForKey_(v4, v106, @"serverUnfilledReason", v107, v108, v105, v109);
    uint64_t v110 = objc_opt_class();
    uint64_t v115 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v111, v110, @"error", v112, v113, v114);
    error = v6->_error;
    v6->_error = (NSError *)v115;

    uint64_t v117 = objc_opt_class();
    uint64_t v122 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v118, v117, @"installAttribution", v119, v120, v121);
    installAttribution = v6->_installAttribution;
    v6->_installAttribution = (APInstallAttribution *)v122;

    double v124 = (void *)MEMORY[0x263EFFA08];
    uint64_t v125 = objc_opt_class();
    uint64_t v126 = objc_opt_class();
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    long long v134 = objc_msgSend_setWithObjects_(v124, v129, v125, v130, v131, v132, v133, v126, v127, v128, 0);
    v139 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, @"representationsKey", v136, v137, v138);
    uint64_t v146 = objc_msgSend_mutableCopy(v139, v140, v141, v142, v143, v144, v145);
    representations = v6->_representations;
    v6->_representations = (NSMutableSet *)v146;

    objc_msgSend_decodeDoubleForKey_(v4, v148, @"serverResponseReceivedTimestamp", v149, v150, v151, v152);
    v6->_serverResponseReceivedTimestamp = v153;
    uint64_t v154 = objc_opt_class();
    uint64_t v159 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v155, v154, @"receivedReferenceTime", v156, v157, v158);
    receivedReferenceTime = v6->_receivedReferenceTime;
    v6->_receivedReferenceTime = (NSDate *)v159;

    v6->_isPAAvailableForAd = objc_msgSend_decodeBoolForKey_(v4, v161, @"personalizedAdsEnabledKey", v162, v163, v164, v165);
    v6->_isLocationAvailableForAd = objc_msgSend_decodeBoolForKey_(v4, v166, @"locationEnabledKey", v167, v168, v169, v170);
    v171 = (void *)MEMORY[0x263EFFA08];
    uint64_t v172 = objc_opt_class();
    uint64_t v173 = objc_opt_class();
    v179 = objc_msgSend_setWithObjects_(v171, v174, v172, v175, v176, v177, v178, v173, 0);
    uint64_t v184 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v180, (uint64_t)v179, @"adServerEnvironment", v181, v182, v183);
    adServerEnvironment = v6->_adServerEnvironment;
    v6->_adServerEnvironment = (NSArray *)v184;

    v6->_diagnosticCode = (int)objc_msgSend_decodeIntForKey_(v4, v186, @"diagnosticCode", v187, v188, v189, v190);
    objc_msgSend__correctNonNullableFields(v6, v191, v192, v193, v194, v195, v196);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v269 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v11 = objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"identifier", v13, v14, v15);

  double v22 = objc_msgSend_contextIdentifier(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"contextIdentifier", v24, v25, v26);

  uint64_t v33 = objc_msgSend_journeyIdentifier(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"journeyIdentifier", v35, v36, v37);

  v44 = objc_msgSend_metadata(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"metadata", v46, v47, v48);

  double v55 = objc_msgSend_disclosureURL(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"disclosureURL", v57, v58, v59);

  uint64_t v66 = objc_msgSend_disclosureRendererPayload(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, @"disclosureRendererPayload", v68, v69, v70);

  uint64_t v77 = objc_msgSend_minimumTimeBetweenPresentation(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeInt_forKey_(v4, v78, v77, @"minimumTimeBetweenPresentation", v79, v80, v81);
  uint64_t v88 = objc_msgSend_brandName(self, v82, v83, v84, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, @"brandName", v90, v91, v92);

  double v99 = objc_msgSend_campaignText(self, v93, v94, v95, v96, v97, v98);
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, @"campaignText", v101, v102, v103);

  uint64_t v110 = objc_msgSend_targetingExpressionId(self, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeObject_forKey_(v4, v111, (uint64_t)v110, @"targetingExpressionId", v112, v113, v114);

  double v121 = objc_msgSend_expirationDate(self, v115, v116, v117, v118, v119, v120);
  objc_msgSend_encodeObject_forKey_(v4, v122, (uint64_t)v121, @"expirationDate", v123, v124, v125);

  objc_msgSend_impressionThreshold(self, v126, v127, v128, v129, v130, v131);
  objc_msgSend_encodeDouble_forKey_(v4, v132, @"impressionThreshold", v133, v134, v135, v136);
  objc_msgSend_impressionVisibilityThreshold(self, v137, v138, v139, v140, v141, v142);
  objc_msgSend_encodeDouble_forKey_(v4, v143, @"impressionVisiblityThreshold", v144, v145, v146, v147);
  uint64_t v154 = objc_msgSend_serverUnfilledReason(self, v148, v149, v150, v151, v152, v153);
  objc_msgSend_encodeInt_forKey_(v4, v155, v154, @"serverUnfilledReason", v156, v157, v158);
  double v165 = objc_msgSend_error(self, v159, v160, v161, v162, v163, v164);
  objc_msgSend_encodeObject_forKey_(v4, v166, (uint64_t)v165, @"error", v167, v168, v169);

  uint64_t v176 = objc_msgSend_installAttribution(self, v170, v171, v172, v173, v174, v175);
  objc_msgSend_encodeObject_forKey_(v4, v177, (uint64_t)v176, @"installAttribution", v178, v179, v180);

  objc_msgSend_serverResponseReceivedTimestamp(self, v181, v182, v183, v184, v185, v186);
  objc_msgSend_encodeDouble_forKey_(v4, v187, @"serverResponseReceivedTimestamp", v188, v189, v190, v191);
  v198 = objc_msgSend_receivedReferenceTime(self, v192, v193, v194, v195, v196, v197);
  objc_msgSend_encodeObject_forKey_(v4, v199, (uint64_t)v198, @"receivedReferenceTime", v200, v201, v202);

  uint64_t isPAAvailableForAd = objc_msgSend_isPAAvailableForAd(self, v203, v204, v205, v206, v207, v208);
  objc_msgSend_encodeBool_forKey_(v4, v210, isPAAvailableForAd, @"personalizedAdsEnabledKey", v211, v212, v213);
  uint64_t isLocationAvailableForAd = objc_msgSend_isLocationAvailableForAd(self, v214, v215, v216, v217, v218, v219);
  objc_msgSend_encodeBool_forKey_(v4, v221, isLocationAvailableForAd, @"locationEnabledKey", v222, v223, v224);
  v225 = APLogForCategory();
  if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
  {
    v232 = objc_msgSend_representations(self, v226, v227, v228, v229, v230, v231);
    int v267 = 138412290;
    id v268 = (id)objc_opt_class();
    id v233 = v268;
    _os_log_impl(&dword_226303000, v225, OS_LOG_TYPE_INFO, "Encoding apcontentdata with representations: %@", (uint8_t *)&v267, 0xCu);
  }
  v240 = objc_msgSend_representations(self, v234, v235, v236, v237, v238, v239);
  objc_msgSend_encodeObject_forKey_(v4, v241, (uint64_t)v240, @"representationsKey", v242, v243, v244);

  v251 = objc_msgSend_adServerEnvironment(self, v245, v246, v247, v248, v249, v250);
  objc_msgSend_encodeObject_forKey_(v4, v252, (uint64_t)v251, @"adServerEnvironment", v253, v254, v255);

  uint64_t v262 = objc_msgSend_diagnosticCode(self, v256, v257, v258, v259, v260, v261);
  objc_msgSend_encodeInt_forKey_(v4, v263, v262, @"diagnosticCode", v264, v265, v266);
}

- (void)addRepresentation:(id)a3
{
  representations = self->_representations;
  id v5 = a3;
  objc_msgSend_addObject_(representations, v6, (uint64_t)v5, v7, v8, v9, v10);
  objc_msgSend_identifier(self, v11, v12, v13, v14, v15, v16);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentDataIdentifier_(v5, v17, (uint64_t)v22, v18, v19, v20, v21);
}

- (void)addRepresentations:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16, 0.0, v6);
  if (v7)
  {
    uint64_t v13 = v7;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_addRepresentation_(self, v8, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v9, v10, v11, v12);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v16, (uint64_t)v20, 16, v11, v12);
    }
    while (v13);
  }
}

- (void)removeRepresentation:(id)a3
{
  representations = self->_representations;
  id v14 = a3;
  objc_msgSend_removeObject_(representations, v4, (uint64_t)v14, v5, v6, v7, v8);
  objc_msgSend_setContentDataIdentifier_(v14, v9, 0, v10, v11, v12, v13);
}

- (id)getRepresentation
{
  return (id)((uint64_t (*)(NSMutableSet *, char *))MEMORY[0x270F9A6D0])(self->_representations, sel_anyObject);
}

- (id)representationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = sub_226308F6C;
  uint64_t v21 = sub_226308F7C;
  id v22 = 0;
  representations = self->_representations;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_226308F84;
  v14[3] = &unk_26479B998;
  id v6 = v4;
  id v15 = v6;
  long long v16 = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(representations, v7, (uint64_t)v14, v8, v9, v10, v11);
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (int64_t)pricingModel
{
  return 103;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSUUID)contextIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)journeyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setJourneyIdentifier:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetadata:(id)a3
{
}

- (NSURL)disclosureURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisclosureURL:(id)a3
{
}

- (NSString)disclosureRendererPayload
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisclosureRendererPayload:(id)a3
{
}

- (BOOL)isLocationAvailableForAd
{
  return self->_isLocationAvailableForAd;
}

- (void)setIsLocationAvailableForAd:(BOOL)a3
{
  self->_uint64_t isLocationAvailableForAd = a3;
}

- (BOOL)isPAAvailableForAd
{
  return self->_isPAAvailableForAd;
}

- (void)setIsPAAvailableForAd:(BOOL)a3
{
  self->_uint64_t isPAAvailableForAd = a3;
}

- (NSString)targetingExpressionId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTargetingExpressionId:(id)a3
{
}

- (unint64_t)minimumTimeBetweenPresentation
{
  return self->_minimumTimeBetweenPresentation;
}

- (void)setMinimumTimeBetweenPresentation:(unint64_t)a3
{
  self->_minimumTimeBetweenPresentation = a3;
}

- (APInstallAttribution)installAttribution
{
  return (APInstallAttribution *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInstallAttribution:(id)a3
{
}

- (NSSet)representations
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRepresentations:(id)a3
{
}

- (NSString)brandName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBrandName:(id)a3
{
}

- (NSString)campaignText
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCampaignText:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 120, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (double)impressionThreshold
{
  return self->_impressionThreshold;
}

- (void)setImpressionThreshold:(double)a3
{
  self->_impressionThreshold = a3;
}

- (double)impressionVisibilityThreshold
{
  return self->_impressionVisibilityThreshold;
}

- (void)setImpressionVisibilityThreshold:(double)a3
{
  self->_impressionVisibilityThreshold = a3;
}

- (int64_t)serverUnfilledReason
{
  return self->_serverUnfilledReason;
}

- (void)setServerUnfilledReason:(int64_t)a3
{
  self->_serverUnfilledReason = a3;
}

- (double)serverResponseReceivedTimestamp
{
  return self->_serverResponseReceivedTimestamp;
}

- (void)setServerResponseReceivedTimestamp:(double)a3
{
  self->_serverResponseReceivedTimestamp = a3;
}

- (NSDate)receivedReferenceTime
{
  return self->_receivedReferenceTime;
}

- (void)setReceivedReferenceTime:(id)a3
{
}

- (int64_t)diagnosticCode
{
  return self->_diagnosticCode;
}

- (void)setDiagnosticCode:(int64_t)a3
{
  self->_diagnosticCode = a3;
}

- (NSArray)adServerEnvironment
{
  return self->_adServerEnvironment;
}

- (void)setAdServerEnvironment:(id)a3
{
}

- (NSString)humanReadableName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHumanReadableName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_adServerEnvironment, 0);
  objc_storeStrong((id *)&self->_receivedReferenceTime, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_campaignText, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
  objc_storeStrong((id *)&self->_disclosureRendererPayload, 0);
  objc_storeStrong((id *)&self->_disclosureURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_journeyIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_representations, 0);
}

@end