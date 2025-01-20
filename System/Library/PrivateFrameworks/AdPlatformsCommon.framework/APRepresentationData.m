@interface APRepresentationData
+ (BOOL)supportsSecureCoding;
+ (id)mockRepresentationWithType:(int64_t)a3 contentData:(id)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)size;
- (APFrequencyCapData)frequencyCapData;
- (APOdmlServerResponse)odmlResponse;
- (APPolicyData)policyData;
- (APRepresentationData)init;
- (APRepresentationData)initWithCoder:(id)a3;
- (APTapAction)tapAction;
- (APTargetingDimensions)targetingDimensions;
- (BOOL)odmlSuccess;
- (BOOL)parentAppCheckEnabled;
- (BOOL)skipEnabled;
- (BOOL)unbranded;
- (NSArray)cppIds;
- (NSDictionary)appMetadata;
- (NSDictionary)installAttribution;
- (NSDictionary)positionInformation;
- (NSError)error;
- (NSString)adTag;
- (NSString)adamID;
- (NSString)advertiserName;
- (NSString)articleID;
- (NSString)articleTitle;
- (NSString)campaignData;
- (NSString)clientRequestID;
- (NSString)contentDataIdentifier;
- (NSString)deploymentId;
- (NSString)experimentId;
- (NSString)journeyRelayAdGroupId;
- (NSString)journeyRelayCampaignId;
- (NSString)metadata;
- (NSString)rawAdFormatType;
- (NSString)rawAdType;
- (NSString)storeFront;
- (NSString)storeFrontLocale;
- (NSString)targetingExpressionId;
- (NSString)treatmentId;
- (NSURL)videoURL;
- (NSUUID)iAdID;
- (NSUUID)identifier;
- (NSUUID)impressionID;
- (double)bitrate;
- (double)duration;
- (double)skipThreshold;
- (int64_t)connectionType;
- (int64_t)desiredPosition;
- (int64_t)placementType;
- (int64_t)rank;
- (int64_t)slotNumber;
- (int64_t)timeToDisplay;
- (unint64_t)privacyMarkerPosition;
- (unint64_t)signalStrength;
- (void)_correctNonNullableFields;
- (void)encodeWithCoder:(id)a3;
- (void)setAdTag:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAdvertiserName:(id)a3;
- (void)setAppMetadata:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticleTitle:(id)a3;
- (void)setBitrate:(double)a3;
- (void)setCampaignData:(id)a3;
- (void)setClientRequestID:(id)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setContentDataIdentifier:(id)a3;
- (void)setCppIds:(id)a3;
- (void)setDeploymentId:(id)a3;
- (void)setDesiredPosition:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setError:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setFrequencyCapData:(id)a3;
- (void)setIAdID:(id)a3;
- (void)setImpressionID:(id)a3;
- (void)setInstallAttribution:(id)a3;
- (void)setJourneyRelayAdGroupId:(id)a3;
- (void)setJourneyRelayCampaignId:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setOdmlResponse:(id)a3;
- (void)setOdmlSuccess:(BOOL)a3;
- (void)setParentAppCheckEnabled:(BOOL)a3;
- (void)setPlacementType:(int64_t)a3;
- (void)setPolicyData:(id)a3;
- (void)setPositionInformation:(id)a3;
- (void)setPrivacyMarkerPosition:(unint64_t)a3;
- (void)setRank:(int64_t)a3;
- (void)setRawAdFormatType:(id)a3;
- (void)setRawAdType:(id)a3;
- (void)setSignalStrength:(unint64_t)a3;
- (void)setSize:(id)a3;
- (void)setSkipEnabled:(BOOL)a3;
- (void)setSkipThreshold:(double)a3;
- (void)setSlotNumber:(int64_t)a3;
- (void)setStoreFront:(id)a3;
- (void)setStoreFrontLocale:(id)a3;
- (void)setTapAction:(id)a3;
- (void)setTargetingDimensions:(id)a3;
- (void)setTimeToDisplay:(int64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setUnbranded:(BOOL)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation APRepresentationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mockRepresentationWithType:(int64_t)a3 contentData:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = objc_alloc_init(APRepresentationData);
  objc_msgSend_setPlacementType_(v6, v7, a3, v8, v9, v10, v11);
  v18 = objc_msgSend_identifier(v5, v12, v13, v14, v15, v16, v17);

  objc_msgSend_setContentDataIdentifier_(v6, v19, (uint64_t)v18, v20, v21, v22, v23);
  objc_msgSend_setArticleID_(v6, v24, @"A0_OxJ7ViSeCggU0zJdY4Xw", v25, v26, v27, v28);
  objc_msgSend_setArticleTitle_(v6, v29, @"Bahamas missing plane: Debris from aircraft apparently found", v30, v31, v32, v33);
  objc_msgSend_setAdvertiserName_(v6, v34, @"Fox News", v35, v36, v37, v38);
  objc_msgSend_setCampaignData_(v6, v39, @"C15112882:L15115783:A10061684", v40, v41, v42, v43);
  objc_msgSend_setAdTag_(v6, v44, @"<html><head><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"><meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.0\"><style>html {width:100%;height:100%;}body {top: 0;left: 0;margin: 0;padding: 0;width: 100%;height: 100%;overflow: hidden;}.ad {background-image: url(\"http://iad2v2-iadctest.iad.apple.com/adunits/f2/e7/68/00048f30-44e1-4f00-9eda-0022ed2dc67a/1.ad/video//asset_large-image-ipad-portrait.jpg\");height: 100%;width: 100%; }.ad--iphone {background-size: cover; }.ad--ipad {background-size: contain; }.ad--landscape {background-image: url(\"http://iad2v2-iadctest.iad.apple.com/adunits/f2/e7/68/00048f30-44e1-4f00-9eda-0022ed2dc67a/1.ad/video//\"); }.ad {display: flex;align-items: center;justify-content: center;background-position: center center;background-repeat: no-repeat;}.ad--iphone.ad--htmlinterstitial {background-position: top center;}</style><script src=\"mraid.js\"></script></head><body><article onClick=\"mraid.open('https://apple.news/subscription')\" id=\"ad-content\" class=\"ad ad--ipad ad--large\"></article><script>function changeClass() {var obj = document.getElementById('ad-content');if ( Math.abs(window.orientation) === 90) {obj.classList.remove('ad--portrait');obj.classList.add('ad--landscape');} else {obj.classList.remove('ad--landscape');obj.classList.add('ad--portrait');}}if ('large' === 'htmlinterstitial' && 'ipad' === 'iphone') {window.addEventListener('orientationchange', changeClass);window.addEventListener('resize', changeClass);window.addEventListener('load', changeClass);}</script></body></html>",
    v45,
    v46,
    v47,
    v48);
  if (a3 == 3)
  {
    id v49 = objc_alloc(NSURL);
    v55 = objc_msgSend_initWithString_(v49, v50, @"https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8", v51, v52, v53, v54);
    objc_msgSend_setVideoURL_(v6, v56, (uint64_t)v55, v57, v58, v59, v60);

    objc_msgSend_setBitrate_(v6, v61, v62, v63, v64, 100.0, v65);
    objc_msgSend_setSignalStrength_(v6, v66, 20, v67, v68, v69, v70);
    objc_msgSend_setConnectionType_(v6, v71, 1, v72, v73, v74, v75);
  }
  v76 = APLogForCategory();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    int v78 = 138412290;
    v79 = v6;
    _os_log_impl(&dword_226303000, v76, OS_LOG_TYPE_INFO, "Returning mocked rep data %@", (uint8_t *)&v78, 0xCu);
  }

  return v6;
}

- (APRepresentationData)init
{
  v11.receiver = self;
  v11.super_class = (Class)APRepresentationData;
  v2 = [(APRepresentationData *)&v11 init];
  uint64_t v9 = v2;
  if (v2) {
    objc_msgSend__correctNonNullableFields(v2, v3, v4, v5, v6, v7, v8);
  }
  return v9;
}

- (void)_correctNonNullableFields
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!self->_identifier)
  {
    objc_msgSend_UUID(MEMORY[0x263F08C38], a2, v2, v3, v4, v5, v6);
    double v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v8;
  }
  if (!self->_adamID)
  {
    self->_adamID = (NSString *)&stru_26DA004A8;
  }
  if (!self->_iAdID)
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    id v10 = objc_alloc(MEMORY[0x263F08C38]);
    double v16 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)&v41, v12, v13, v14, v15);
    iAdID = self->_iAdID;
    self->_iAdID = v16;
  }
  if (!self->_impressionID)
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    v24 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v18, v19, (uint64_t)&v41, v20, v21, v22, v23);
    impressionID = self->_impressionID;
    self->_impressionID = v24;
  }
  if (!self->_clientRequestID)
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    id v26 = objc_alloc(MEMORY[0x263F08C38]);
    double v32 = objc_msgSend_initWithUUIDBytes_(v26, v27, (uint64_t)&v41, v28, v29, v30, v31);
    objc_msgSend_UUIDString(v32, v33, v34, v35, v36, v37, v38);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    clientRequestID = self->_clientRequestID;
    self->_clientRequestID = v39;
  }
  if (!self->_storeFront)
  {
    self->_storeFront = (NSString *)&stru_26DA004A8;
  }
  if (!self->_storeFrontLocale)
  {
    self->_storeFrontLocale = (NSString *)&stru_26DA004A8;
  }
}

- (APRepresentationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v345.receiver = self;
  v345.super_class = (Class)APRepresentationData;
  double v5 = [(APRepresentationData *)&v345 init];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x22A64D040]();
    uint64_t v7 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"frequencyCapData", v9, v10, v11);
    frequencyCapData = v5->_frequencyCapData;
    v5->_frequencyCapData = (APFrequencyCapData *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"policyData", v16, v17, v18);
    policyData = v5->_policyData;
    v5->_policyData = (APPolicyData *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"targetingDimensionsKey", v23, v24, v25);
    targetingDimensions = v5->_targetingDimensions;
    v5->_targetingDimensions = (APTargetingDimensions *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"tapAction", v30, v31, v32);
    tapAction = v5->_tapAction;
    v5->_tapAction = (APTapAction *)v33;

    v5->_privacyMarkerPosition = (int)objc_msgSend_decodeIntForKey_(v4, v35, @"privacyMarkerPositionKey", v36, v37, v38, v39);
    v5->_placementType = (int)objc_msgSend_decodeIntForKey_(v4, v40, @"placementType", v41, v42, v43, v44);
    uint64_t v45 = objc_opt_class();
    uint64_t v50 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, @"rawAdType", v47, v48, v49);
    rawAdType = v5->_rawAdType;
    v5->_rawAdType = (NSString *)v50;

    uint64_t v52 = objc_opt_class();
    uint64_t v57 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, @"rawAdFormatType", v54, v55, v56);
    rawAdFormatType = v5->_rawAdFormatType;
    v5->_rawAdFormatType = (NSString *)v57;

    v5->_desiredPosition = (int)objc_msgSend_decodeIntForKey_(v4, v59, @"desiredPosition", v60, v61, v62, v63);
    int v69 = objc_msgSend_decodeIntForKey_(v4, v64, @"width", v65, v66, v67, v68);
    v5->_size.width = (double)v69;
    int v74 = objc_msgSend_decodeIntForKey_(v4, v70, @"height", v71, v72, (double)v69, v73);
    v5->_size.height = (double)v74;
    if (objc_msgSend_containsValueForKey_(v4, v75, @"adTag", v76, v77, (double)v74, v78))
    {
      uint64_t v79 = objc_opt_class();
      uint64_t v84 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, @"adTag", v81, v82, v83);
      adTag = v5->_adTag;
      v5->_adTag = (NSString *)v84;
    }
    uint64_t v86 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v87, v86, @"videoURL", v88, v89, v90);
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v91;

    objc_msgSend_decodeDoubleForKey_(v4, v93, @"duration", v94, v95, v96, v97);
    v5->_duration = v98;
    objc_msgSend_decodeDoubleForKey_(v4, v99, @"skipThreshold", v100, v101, v98, v102);
    v5->_skipThreshold = v103;
    v5->_skipEnabled = objc_msgSend_decodeBoolForKey_(v4, v104, @"skipEnabled", v105, v106, v103, v107);
    v5->_unbranded = objc_msgSend_decodeBoolForKey_(v4, v108, @"unbranded", v109, v110, v111, v112);
    objc_msgSend_decodeDoubleForKey_(v4, v113, @"bitrate", v114, v115, v116, v117);
    v5->_bitrate = v118;
    v5->_signalStrength = objc_msgSend_decodeIntegerForKey_(v4, v119, @"signalStrengthKey", v120, v121, v118, v122);
    v5->_connectionType = objc_msgSend_decodeIntegerForKey_(v4, v123, @"connectionTypeKey", v124, v125, v126, v127);
    uint64_t v128 = objc_opt_class();
    uint64_t v133 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v129, v128, @"articleID", v130, v131, v132);
    articleID = v5->_articleID;
    v5->_articleID = (NSString *)v133;

    uint64_t v135 = objc_opt_class();
    uint64_t v140 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v136, v135, @"articleTitle", v137, v138, v139);
    articleTitle = v5->_articleTitle;
    v5->_articleTitle = (NSString *)v140;

    uint64_t v142 = objc_opt_class();
    uint64_t v147 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v143, v142, @"advertiserName", v144, v145, v146);
    advertiserName = v5->_advertiserName;
    v5->_advertiserName = (NSString *)v147;

    uint64_t v149 = objc_opt_class();
    uint64_t v154 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v150, v149, @"campaignData", v151, v152, v153);
    campaignData = v5->_campaignData;
    v5->_campaignData = (NSString *)v154;

    uint64_t v156 = objc_opt_class();
    uint64_t v161 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v157, v156, @"contentDataIdentifier", v158, v159, v160);
    contentDataIdentifier = v5->_contentDataIdentifier;
    v5->_contentDataIdentifier = (NSString *)v161;

    uint64_t v163 = objc_opt_class();
    uint64_t v168 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v164, v163, @"identifier", v165, v166, v167);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v168;

    uint64_t v170 = objc_opt_class();
    uint64_t v175 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v171, v170, @"adamID", v172, v173, v174);
    adamID = v5->_adamID;
    v5->_adamID = (NSString *)v175;

    uint64_t v177 = objc_opt_class();
    uint64_t v182 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v178, v177, @"metadata", v179, v180, v181);
    metadata = v5->_metadata;
    v5->_metadata = (NSString *)v182;

    uint64_t v184 = objc_opt_class();
    uint64_t v189 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, @"journeyRelayAdGroupId", v186, v187, v188);
    journeyRelayAdGroupId = v5->_journeyRelayAdGroupId;
    v5->_journeyRelayAdGroupId = (NSString *)v189;

    uint64_t v191 = objc_opt_class();
    uint64_t v196 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v192, v191, @"journeyRelayCampaignId", v193, v194, v195);
    journeyRelayCampaignId = v5->_journeyRelayCampaignId;
    v5->_journeyRelayCampaignId = (NSString *)v196;

    v5->_parentAppCheckEnabled = objc_msgSend_decodeBoolForKey_(v4, v198, @"parentAppCheckEnabled", v199, v200, v201, v202);
    v209 = objc_msgSend_classes(MEMORY[0x263F20B78], v203, v204, v205, v206, v207, v208);
    uint64_t v214 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v210, (uint64_t)v209, @"installAttribution", v211, v212, v213);
    installAttribution = v5->_installAttribution;
    v5->_installAttribution = (NSDictionary *)v214;

    v5->_rank = objc_msgSend_decodeIntegerForKey_(v4, v216, @"rank", v217, v218, v219, v220);
    v5->_timeToDisplay = objc_msgSend_decodeIntegerForKey_(v4, v221, @"timeToDisplay", v222, v223, v224, v225);
    uint64_t v226 = objc_opt_class();
    uint64_t v231 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v227, v226, @"iAdID", v228, v229, v230);
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSUUID *)v231;

    uint64_t v233 = objc_opt_class();
    uint64_t v238 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v234, v233, @"impressionID", v235, v236, v237);
    impressionID = v5->_impressionID;
    v5->_impressionID = (NSUUID *)v238;

    uint64_t v240 = objc_opt_class();
    uint64_t v245 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v241, v240, @"storefront", v242, v243, v244);
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSString *)v245;

    uint64_t v247 = objc_opt_class();
    uint64_t v252 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v248, v247, @"storefrontLocale", v249, v250, v251);
    storeFrontLocale = v5->_storeFrontLocale;
    v5->_storeFrontLocale = (NSString *)v252;

    uint64_t v254 = objc_opt_class();
    uint64_t v259 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v255, v254, @"clientRequestID", v256, v257, v258);
    clientRequestID = v5->_clientRequestID;
    v5->_clientRequestID = (NSString *)v259;

    v261 = (void *)MEMORY[0x263EFFA08];
    uint64_t v262 = objc_opt_class();
    v268 = objc_msgSend_setWithObjects_(v261, v263, v262, v264, v265, v266, v267, 0);
    v269 = (void *)MEMORY[0x263EFFA08];
    uint64_t v270 = objc_opt_class();
    uint64_t v271 = objc_opt_class();
    v277 = objc_msgSend_setWithObjects_(v269, v272, v270, v273, v274, v275, v276, v271, 0);
    uint64_t v281 = objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(v4, v278, (uint64_t)v268, (uint64_t)v277, @"positionInformation", v279, v280);
    positionInformation = v5->_positionInformation;
    v5->_positionInformation = (NSDictionary *)v281;

    v5->_slotNumber = objc_msgSend_decodeIntegerForKey_(v4, v283, @"slotNumber", v284, v285, v286, v287);
    uint64_t v288 = objc_opt_class();
    uint64_t v293 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v289, v288, @"cppIds", v290, v291, v292);
    cppIds = v5->_cppIds;
    v5->_cppIds = (NSArray *)v293;

    v295 = (void *)MEMORY[0x263EFFA08];
    uint64_t v296 = objc_opt_class();
    uint64_t v297 = objc_opt_class();
    uint64_t v298 = objc_opt_class();
    uint64_t v299 = objc_opt_class();
    v305 = objc_msgSend_setWithObjects_(v295, v300, v296, v301, v302, v303, v304, v297, v298, v299, 0);
    uint64_t v310 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v306, (uint64_t)v305, @"appMetadata", v307, v308, v309);
    appMetadata = v5->_appMetadata;
    v5->_appMetadata = (NSDictionary *)v310;

    v5->_odmlSuccess = objc_msgSend_decodeBoolForKey_(v4, v312, @"odmlSuccess", v313, v314, v315, v316);
    uint64_t v317 = objc_opt_class();
    uint64_t v322 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v318, v317, @"treatmentId", v319, v320, v321);
    treatmentId = v5->_treatmentId;
    v5->_treatmentId = (NSString *)v322;

    uint64_t v324 = objc_opt_class();
    uint64_t v329 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v325, v324, @"deploymentId", v326, v327, v328);
    deploymentId = v5->_deploymentId;
    v5->_deploymentId = (NSString *)v329;

    uint64_t v331 = objc_opt_class();
    uint64_t v336 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v332, v331, @"experimentId", v333, v334, v335);
    experimentId = v5->_experimentId;
    v5->_experimentId = (NSString *)v336;

    objc_msgSend__correctNonNullableFields(v5, v338, v339, v340, v341, v342, v343);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v11 = objc_msgSend_frequencyCapData(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"frequencyCapData", v13, v14, v15);

  double v22 = objc_msgSend_policyData(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"policyData", v24, v25, v26);

  uint64_t v33 = objc_msgSend_targetingDimensions(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"targetingDimensionsKey", v35, v36, v37);

  double v44 = objc_msgSend_tapAction(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"tapAction", v46, v47, v48);

  uint64_t v55 = objc_msgSend_privacyMarkerPosition(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInt_forKey_(v4, v56, v55, @"privacyMarkerPositionKey", v57, v58, v59);
  uint64_t v66 = objc_msgSend_placementType(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeInt_forKey_(v4, v67, v66, @"placementType", v68, v69, v70);
  uint64_t v77 = objc_msgSend_rawAdType(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"rawAdType", v79, v80, v81);

  uint64_t v88 = objc_msgSend_rawAdFormatType(self, v82, v83, v84, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, @"rawAdFormatType", v90, v91, v92);

  uint64_t v99 = objc_msgSend_desiredPosition(self, v93, v94, v95, v96, v97, v98);
  objc_msgSend_encodeInt_forKey_(v4, v100, v99, @"desiredPosition", v101, v102, v103);
  objc_msgSend_size(self, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeInt_forKey_(v4, v111, (int)v110, @"width", v112, v110, v113);
  objc_msgSend_size(self, v114, v115, v116, v117, v118, v119);
  objc_msgSend_encodeInt_forKey_(v4, v121, (int)v120, @"height", v122, v123, v120);
  uint64_t v130 = objc_msgSend_adTag(self, v124, v125, v126, v127, v128, v129);
  objc_msgSend_encodeObject_forKey_(v4, v131, (uint64_t)v130, @"adTag", v132, v133, v134);

  v141 = objc_msgSend_videoURL(self, v135, v136, v137, v138, v139, v140);
  objc_msgSend_encodeObject_forKey_(v4, v142, (uint64_t)v141, @"videoURL", v143, v144, v145);

  objc_msgSend_duration(self, v146, v147, v148, v149, v150, v151);
  objc_msgSend_encodeDouble_forKey_(v4, v152, @"duration", v153, v154, v155, v156);
  objc_msgSend_skipThreshold(self, v157, v158, v159, v160, v161, v162);
  objc_msgSend_encodeDouble_forKey_(v4, v163, @"skipThreshold", v164, v165, v166, v167);
  uint64_t v174 = objc_msgSend_skipEnabled(self, v168, v169, v170, v171, v172, v173);
  objc_msgSend_encodeBool_forKey_(v4, v175, v174, @"skipEnabled", v176, v177, v178);
  uint64_t v185 = objc_msgSend_unbranded(self, v179, v180, v181, v182, v183, v184);
  objc_msgSend_encodeBool_forKey_(v4, v186, v185, @"unbranded", v187, v188, v189);
  objc_msgSend_bitrate(self, v190, v191, v192, v193, v194, v195);
  objc_msgSend_encodeDouble_forKey_(v4, v196, @"bitrate", v197, v198, v199, v200);
  uint64_t v207 = objc_msgSend_signalStrength(self, v201, v202, v203, v204, v205, v206);
  objc_msgSend_encodeInteger_forKey_(v4, v208, v207, @"signalStrengthKey", v209, v210, v211);
  uint64_t v218 = objc_msgSend_connectionType(self, v212, v213, v214, v215, v216, v217);
  objc_msgSend_encodeInteger_forKey_(v4, v219, v218, @"connectionTypeKey", v220, v221, v222);
  double v229 = objc_msgSend_articleID(self, v223, v224, v225, v226, v227, v228);
  objc_msgSend_encodeObject_forKey_(v4, v230, (uint64_t)v229, @"articleID", v231, v232, v233);

  uint64_t v240 = objc_msgSend_articleTitle(self, v234, v235, v236, v237, v238, v239);
  objc_msgSend_encodeObject_forKey_(v4, v241, (uint64_t)v240, @"articleTitle", v242, v243, v244);

  double v251 = objc_msgSend_advertiserName(self, v245, v246, v247, v248, v249, v250);
  objc_msgSend_encodeObject_forKey_(v4, v252, (uint64_t)v251, @"advertiserName", v253, v254, v255);

  uint64_t v262 = objc_msgSend_campaignData(self, v256, v257, v258, v259, v260, v261);
  objc_msgSend_encodeObject_forKey_(v4, v263, (uint64_t)v262, @"campaignData", v264, v265, v266);

  uint64_t v273 = objc_msgSend_contentDataIdentifier(self, v267, v268, v269, v270, v271, v272);
  objc_msgSend_encodeObject_forKey_(v4, v274, (uint64_t)v273, @"contentDataIdentifier", v275, v276, v277);

  uint64_t v284 = objc_msgSend_identifier(self, v278, v279, v280, v281, v282, v283);
  objc_msgSend_encodeObject_forKey_(v4, v285, (uint64_t)v284, @"identifier", v286, v287, v288);

  v295 = objc_msgSend_adamID(self, v289, v290, v291, v292, v293, v294);
  objc_msgSend_encodeObject_forKey_(v4, v296, (uint64_t)v295, @"adamID", v297, v298, v299);

  v306 = objc_msgSend_metadata(self, v300, v301, v302, v303, v304, v305);
  objc_msgSend_encodeObject_forKey_(v4, v307, (uint64_t)v306, @"metadata", v308, v309, v310);

  uint64_t v317 = objc_msgSend_journeyRelayAdGroupId(self, v311, v312, v313, v314, v315, v316);
  objc_msgSend_encodeObject_forKey_(v4, v318, (uint64_t)v317, @"journeyRelayAdGroupId", v319, v320, v321);

  double v328 = objc_msgSend_journeyRelayCampaignId(self, v322, v323, v324, v325, v326, v327);
  objc_msgSend_encodeObject_forKey_(v4, v329, (uint64_t)v328, @"journeyRelayCampaignId", v330, v331, v332);

  uint64_t v339 = objc_msgSend_parentAppCheckEnabled(self, v333, v334, v335, v336, v337, v338);
  objc_msgSend_encodeBool_forKey_(v4, v340, v339, @"parentAppCheckEnabled", v341, v342, v343);
  v350 = objc_msgSend_installAttribution(self, v344, v345, v346, v347, v348, v349);
  objc_msgSend_encodeObject_forKey_(v4, v351, (uint64_t)v350, @"installAttribution", v352, v353, v354);

  uint64_t v361 = objc_msgSend_rank(self, v355, v356, v357, v358, v359, v360);
  objc_msgSend_encodeInteger_forKey_(v4, v362, v361, @"rank", v363, v364, v365);
  uint64_t v372 = objc_msgSend_timeToDisplay(self, v366, v367, v368, v369, v370, v371);
  objc_msgSend_encodeInteger_forKey_(v4, v373, v372, @"timeToDisplay", v374, v375, v376);
  v383 = objc_msgSend_iAdID(self, v377, v378, v379, v380, v381, v382);
  objc_msgSend_encodeObject_forKey_(v4, v384, (uint64_t)v383, @"iAdID", v385, v386, v387);

  v394 = objc_msgSend_impressionID(self, v388, v389, v390, v391, v392, v393);
  objc_msgSend_encodeObject_forKey_(v4, v395, (uint64_t)v394, @"impressionID", v396, v397, v398);

  v405 = objc_msgSend_storeFront(self, v399, v400, v401, v402, v403, v404);
  objc_msgSend_encodeObject_forKey_(v4, v406, (uint64_t)v405, @"storefront", v407, v408, v409);

  v416 = objc_msgSend_storeFrontLocale(self, v410, v411, v412, v413, v414, v415);
  objc_msgSend_encodeObject_forKey_(v4, v417, (uint64_t)v416, @"storefrontLocale", v418, v419, v420);

  v427 = objc_msgSend_clientRequestID(self, v421, v422, v423, v424, v425, v426);
  objc_msgSend_encodeObject_forKey_(v4, v428, (uint64_t)v427, @"clientRequestID", v429, v430, v431);

  v438 = objc_msgSend_positionInformation(self, v432, v433, v434, v435, v436, v437);
  objc_msgSend_encodeObject_forKey_(v4, v439, (uint64_t)v438, @"positionInformation", v440, v441, v442);

  uint64_t v449 = objc_msgSend_slotNumber(self, v443, v444, v445, v446, v447, v448);
  objc_msgSend_encodeInteger_forKey_(v4, v450, v449, @"slotNumber", v451, v452, v453);
  v460 = objc_msgSend_cppIds(self, v454, v455, v456, v457, v458, v459);
  objc_msgSend_encodeObject_forKey_(v4, v461, (uint64_t)v460, @"cppIds", v462, v463, v464);

  v471 = objc_msgSend_appMetadata(self, v465, v466, v467, v468, v469, v470);
  objc_msgSend_encodeObject_forKey_(v4, v472, (uint64_t)v471, @"appMetadata", v473, v474, v475);

  uint64_t v482 = objc_msgSend_odmlSuccess(self, v476, v477, v478, v479, v480, v481);
  objc_msgSend_encodeBool_forKey_(v4, v483, v482, @"odmlSuccess", v484, v485, v486);
  v493 = objc_msgSend_treatmentId(self, v487, v488, v489, v490, v491, v492);
  objc_msgSend_encodeObject_forKey_(v4, v494, (uint64_t)v493, @"treatmentId", v495, v496, v497);

  v504 = objc_msgSend_deploymentId(self, v498, v499, v500, v501, v502, v503);
  objc_msgSend_encodeObject_forKey_(v4, v505, (uint64_t)v504, @"deploymentId", v506, v507, v508);

  objc_msgSend_experimentId(self, v509, v510, v511, v512, v513, v514);
  id v519 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v515, (uint64_t)v519, @"experimentId", v516, v517, v518);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)contentDataIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentDataIdentifier:(id)a3
{
}

- (int64_t)placementType
{
  return self->_placementType;
}

- (void)setPlacementType:(int64_t)a3
{
  self->_placementType = a3;
}

- (NSString)rawAdType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRawAdType:(id)a3
{
}

- (NSString)rawAdFormatType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRawAdFormatType:(id)a3
{
}

- (int64_t)desiredPosition
{
  return self->_desiredPosition;
}

- (void)setDesiredPosition:(int64_t)a3
{
  self->_desiredPosition = a3;
}

- (APFrequencyCapData)frequencyCapData
{
  return (APFrequencyCapData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFrequencyCapData:(id)a3
{
}

- (APPolicyData)policyData
{
  return (APPolicyData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPolicyData:(id)a3
{
}

- (APTargetingDimensions)targetingDimensions
{
  return (APTargetingDimensions *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTargetingDimensions:(id)a3
{
}

- (unint64_t)privacyMarkerPosition
{
  return self->_privacyMarkerPosition;
}

- (void)setPrivacyMarkerPosition:(unint64_t)a3
{
  self->_privacyMarkerPosition = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (APTapAction)tapAction
{
  return (APTapAction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTapAction:(id)a3
{
}

- (NSString)adTag
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdTag:(id)a3
{
}

- (NSURL)videoURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVideoURL:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)skipThreshold
{
  return self->_skipThreshold;
}

- (void)setSkipThreshold:(double)a3
{
  self->_skipThreshold = a3;
}

- (BOOL)skipEnabled
{
  return self->_skipEnabled;
}

- (void)setSkipEnabled:(BOOL)a3
{
  self->_skipEnabled = a3;
}

- (BOOL)unbranded
{
  return self->_unbranded;
}

- (void)setUnbranded:(BOOL)a3
{
  self->_unbranded = a3;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(double)a3
{
  self->_bitrate = a3;
}

- (unint64_t)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(unint64_t)a3
{
  self->_signalStrength = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (NSString)articleID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setArticleID:(id)a3
{
}

- (NSString)articleTitle
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setArticleTitle:(id)a3
{
}

- (NSString)advertiserName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAdvertiserName:(id)a3
{
}

- (NSString)campaignData
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCampaignData:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 192, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)targetingExpressionId
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)adamID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAdamID:(id)a3
{
}

- (NSString)metadata
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMetadata:(id)a3
{
}

- (NSString)journeyRelayAdGroupId
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setJourneyRelayAdGroupId:(id)a3
{
}

- (NSString)journeyRelayCampaignId
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setJourneyRelayCampaignId:(id)a3
{
}

- (BOOL)parentAppCheckEnabled
{
  return self->_parentAppCheckEnabled;
}

- (void)setParentAppCheckEnabled:(BOOL)a3
{
  self->_parentAppCheckEnabled = a3;
}

- (NSDictionary)installAttribution
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setInstallAttribution:(id)a3
{
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)timeToDisplay
{
  return self->_timeToDisplay;
}

- (void)setTimeToDisplay:(int64_t)a3
{
  self->_timeToDisplay = a3;
}

- (NSUUID)iAdID
{
  return (NSUUID *)objc_getProperty(self, a2, 264, 1);
}

- (void)setIAdID:(id)a3
{
}

- (NSUUID)impressionID
{
  return (NSUUID *)objc_getProperty(self, a2, 272, 1);
}

- (void)setImpressionID:(id)a3
{
}

- (NSString)clientRequestID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setClientRequestID:(id)a3
{
}

- (NSString)storeFront
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setStoreFront:(id)a3
{
}

- (NSString)storeFrontLocale
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setStoreFrontLocale:(id)a3
{
}

- (APOdmlServerResponse)odmlResponse
{
  return (APOdmlServerResponse *)objc_getProperty(self, a2, 304, 1);
}

- (void)setOdmlResponse:(id)a3
{
}

- (BOOL)odmlSuccess
{
  return self->_odmlSuccess;
}

- (void)setOdmlSuccess:(BOOL)a3
{
  self->_odmlSuccess = a3;
}

- (NSString)treatmentId
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)deploymentId
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDeploymentId:(id)a3
{
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setExperimentId:(id)a3
{
}

- (NSDictionary)positionInformation
{
  return self->_positionInformation;
}

- (void)setPositionInformation:(id)a3
{
}

- (int64_t)slotNumber
{
  return self->_slotNumber;
}

- (void)setSlotNumber:(int64_t)a3
{
  self->_slotNumber = a3;
}

- (NSArray)cppIds
{
  return self->_cppIds;
}

- (void)setCppIds:(id)a3
{
}

- (NSDictionary)appMetadata
{
  return self->_appMetadata;
}

- (void)setAppMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMetadata, 0);
  objc_storeStrong((id *)&self->_cppIds, 0);
  objc_storeStrong((id *)&self->_positionInformation, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
  objc_storeStrong((id *)&self->_storeFrontLocale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_impressionID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_journeyRelayCampaignId, 0);
  objc_storeStrong((id *)&self->_journeyRelayAdGroupId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_campaignData, 0);
  objc_storeStrong((id *)&self->_advertiserName, 0);
  objc_storeStrong((id *)&self->_articleTitle, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_adTag, 0);
  objc_storeStrong((id *)&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_targetingDimensions, 0);
  objc_storeStrong((id *)&self->_policyData, 0);
  objc_storeStrong((id *)&self->_frequencyCapData, 0);
  objc_storeStrong((id *)&self->_rawAdFormatType, 0);
  objc_storeStrong((id *)&self->_rawAdType, 0);
  objc_storeStrong((id *)&self->_contentDataIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end