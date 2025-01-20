@interface VCPMADServiceImageAsset
+ (VCPMADServiceImageAsset)assetWithImageData:(id)a3 uniformTypeIdentifier:(id)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7;
+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5;
+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7;
+ (VCPMADServiceImageAsset)assetWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7;
+ (VCPMADServiceImageAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6;
- (BOOL)fromGenerativePlayground;
- (BOOL)hasCachedParseData;
- (BOOL)hasValidSceneProcessing;
- (BOOL)isHighResDecoded;
- (BOOL)isScreenshot;
- (BOOL)userSafetyEligible;
- (CGSize)resolution;
- (CLLocation)location;
- (NSArray)barcodeObservations;
- (NSArray)documentObservations;
- (NSArray)faces;
- (NSArray)nsfwClassifications;
- (NSArray)scenenetClassifications;
- (NSData)cachedParseData;
- (NSNumber)animatedStickerScore;
- (NSNumber)isSensitive;
- (NSString)clientBundleID;
- (NSString)clientTeamID;
- (NSString)identifier;
- (NSString)signpostPayload;
- (VCPMADServiceImageAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4;
- (id)vcp_annotationWithTypes:(unint64_t)a3;
- (id)vcp_scenenetAnnotation;
- (id)vcp_textAnnotation;
- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4;
- (unint64_t)assetType;
- (unsigned)orientation;
- (void)setBarcodeObservations:(id)a3;
- (void)setCachedParseData:(id)a3;
- (void)setDocumentObservations:(id)a3;
- (void)setSignpostPayload:(id)a3;
- (void)setUserSafetyEligible:(BOOL)a3;
@end

@implementation VCPMADServiceImageAsset

- (id)vcp_textAnnotation
{
  v2 = [(VCPMADServiceImageAsset *)self documentObservations];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB4078] textBlockWithDocumentObservations:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vcp_scenenetAnnotation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [(VCPMADServiceImageAsset *)self scenenetClassifications];
  if (v2)
  {
    v29 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v28 = v2;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (!v4) {
      goto LABEL_16;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v9 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
        v10 = objc_msgSend(v9, "nodeForExtendedSceneClassId:", objc_msgSend(v8, "extendedSceneIdentifier"));

        if (v10
          && ([v10 name], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
        {
          id v12 = objc_alloc(MEMORY[0x1E4FB4060]);
          v13 = [v10 name];
          [v8 boundingBox];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          [v8 confidence];
          *(float *)&double v23 = v22;
          v24 = objc_msgSend(v12, "initWithLabel:normalizedBoundingBox:confidence:", v13, v15, v17, v19, v21, v23);
          [v29 addObject:v24];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_14;
          }
          v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v8 extendedSceneIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v35 = v25;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[SceneNet] Failed to find label for identifier %llu", buf, 0xCu);
          }
        }

LABEL_14:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (!v5)
      {
LABEL_16:

        v26 = (void *)[objc_alloc(MEMORY[0x1E4FB4068]) initWithAnnotations:v29 revision:3737841665];
        v2 = v28;
        goto LABEL_18;
      }
    }
  }
  v26 = 0;
LABEL_18:

  return v26;
}

- (id)vcp_annotationWithTypes:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v4 = self;
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  if ((a3 & 3) == 0)
  {
    uint64_t v6 = 0;
    v61 = 0;
    v137 = 0;
    goto LABEL_89;
  }
  uint64_t v5 = [(VCPMADServiceImageAsset *)self faces];
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v140 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = [v5 firstObject];
    uint64_t v8 = [v7 photoLibrary];

    v138 = v6;
    v127 = v5;
    v128 = (void *)v8;
    char v129 = v3;
    v131 = v4;
    if (v8)
    {
LABEL_4:
      v9 = VCPSignPostLog();
      os_signpost_id_t v10 = os_signpost_id_generate(v9);

      v11 = VCPSignPostLog();
      id v12 = v11;
      unint64_t v136 = v10 - 1;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MADVIFetchVerifiedPeople", "", buf, 2u);
      }
      os_signpost_id_t spid = v10;

      uint64_t v13 = objc_msgSend(v128, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", &unk_1F15EE118, &unk_1F15EE130);
      double v14 = [MEMORY[0x1E4F391F8] fetchPersonsWithFaces:v5 options:v13];
      double v15 = v140;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        double v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = [v14 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v159 = v17;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[VI][Identity] Fetched %lu verified identities", buf, 0xCu);
        }
      }
      if ([v14 count])
      {
        unint64_t v18 = 0;
        do
        {
          double v19 = (void *)MEMORY[0x1C186D320]();
          double v20 = [v14 objectAtIndexedSubscript:v18];
          double v21 = [v20 localIdentifier];
          [v15 setObject:v20 forKeyedSubscript:v21];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              double v23 = [v20 localIdentifier];
              uint64_t v24 = [v20 verifiedType];
              *(_DWORD *)buf = 138412546;
              uint64_t v159 = (uint64_t)v23;
              __int16 v160 = 2048;
              uint64_t v161 = v24;
              _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[VI][Identity] -> identitity %@ with verified type %ld", buf, 0x16u);

              double v15 = v140;
            }
          }
          ++v18;
        }
        while (v18 < [v14 count]);
      }
      uint64_t v25 = VCPSignPostLog();
      v26 = v25;
      if (v136 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, spid, "MADVIFetchVerifiedPeople", "", buf, 2u);
      }

      v27 = v13;
      char v3 = v129;
LABEL_22:

      if ((v3 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_65;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v62 = VCPLogInstance();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = [(VCPMADServiceImageAsset *)v4 identifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v159 = (uint64_t)v63;
        _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_ERROR, "[VI][%@] -> face without photoLibrary", buf, 0xCu);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v64 = [(VCPMADServiceImageAsset *)v4 photoLibrary];
      int v65 = MediaAnalysisLogLevel();
      v128 = (void *)v64;
      if (v64)
      {
        if (v65 >= 6)
        {
          v66 = VCPLogInstance();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = [(VCPMADServiceImageAsset *)v4 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v159 = (uint64_t)v67;
            __int16 v160 = 2112;
            uint64_t v161 = (uint64_t)v128;
            _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_INFO, "[VI][%@] -> asset's photoLibrary %@", buf, 0x16u);
          }
        }
        goto LABEL_4;
      }
      if (v65 >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v73 = [(VCPMADServiceImageAsset *)v4 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v159 = (uint64_t)v73;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[VI][%@] -> asset without photoLibrary", buf, 0xCu);
        }
LABEL_63:
        v128 = 0;
        goto LABEL_22;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v68 = [(VCPMADServiceImageAsset *)v4 identifier];
        v69 = objc_opt_class();
        id v70 = v69;
        v71 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v159 = (uint64_t)v68;
        __int16 v160 = 2112;
        uint64_t v161 = (uint64_t)v69;
        __int16 v162 = 2112;
        uint64_t v163 = (uint64_t)v71;
        id v72 = v71;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[VI][%@] -> faces from %@ (expected %@)", buf, 0x20u);

        uint64_t v6 = v138;
      }
      goto LABEL_63;
    }
    v128 = 0;
    if ((v3 & 1) == 0)
    {
LABEL_23:
      v137 = 0;
      if ((v3 & 2) != 0)
      {
LABEL_24:
        uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        id v29 = v5;
        long long v30 = (void *)v28;
        id v31 = v29;
        uint64_t v32 = [v29 countByEnumeratingWithState:&v147 objects:v156 count:16];
        long long v33 = v140;
        spida = (void *)v28;
        if (v32)
        {
          uint64_t v34 = v32;
          uint64_t v35 = *(void *)v148;
          *(void *)v139 = v31;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v148 != v35) {
                objc_enumerationMutation(v31);
              }
              uint64_t v37 = *(void **)(*((void *)&v147 + 1) + 8 * i);
              v38 = (void *)MEMORY[0x1C186D320]();
              if (objc_msgSend(v37, "vcp_hasBody"))
              {
                objc_msgSend(v37, "vcp_normalizedBodyBounds");
                double v40 = v39;
                double v42 = v41;
                double v44 = v43;
                double v46 = v45;
                id v47 = objc_alloc(MEMORY[0x1E4FB4060]);
                LODWORD(v48) = 1.0;
                v49 = objc_msgSend(v47, "initWithLabel:normalizedBoundingBox:confidence:", @"Human", v40, v42, v44, v46, v48);
                [v30 addObject:v49];

                v50 = [v37 personLocalIdentifier];
                v51 = [v33 objectForKeyedSubscript:v50];

                if (v51 && [v51 faceCount])
                {
                  uint64_t v52 = [v51 faceCount];
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v53 = VCPLogInstance();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    {
                      v54 = [v37 personLocalIdentifier];
                      v55 = [v51 name];
                      *(_DWORD *)buf = 138412802;
                      uint64_t v159 = (uint64_t)v54;
                      __int16 v160 = 2112;
                      uint64_t v161 = (uint64_t)v55;
                      __int16 v162 = 2048;
                      uint64_t v163 = v52;
                      _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_DEBUG, "[VI][Identity] Creating VIReducePersonOverTriggerRegionalAnnotation for human (torso) identity %@ (%@) with %ld faces in Photos library", buf, 0x20u);
                    }
                    long long v30 = spida;
                  }
                  id v56 = objc_alloc(MEMORY[0x1E4FB4050]);
                  v57 = [v37 personLocalIdentifier];
                  LODWORD(v58) = 1.0;
                  v59 = objc_msgSend(v56, "initWithLabel:boundingBox:confidence:faceCount:", v57, v52, v40, v42, v44, v46, v58);

                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    v60 = VCPLogInstance();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v159 = (uint64_t)v59;
                      _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEBUG, "[VI][Identity] Created VIReducePersonOverTriggerRegionalAnnotation %@", buf, 0xCu);
                    }
                  }
                  [v138 addObject:v59];

                  id v31 = *(id *)v139;
                  long long v33 = v140;
                }
              }
            }
            uint64_t v34 = [v31 countByEnumeratingWithState:&v147 objects:v156 count:16];
          }
          while (v34);
        }

        uint64_t v6 = v138;
        char v3 = v129;
        uint64_t v4 = v131;
        uint64_t v5 = v127;
        goto LABEL_87;
      }
LABEL_86:
      spida = 0;
LABEL_87:

      goto LABEL_88;
    }
LABEL_65:
    v74 = [MEMORY[0x1E4F1CA48] array];
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id type = v5;
    uint64_t v75 = [type countByEnumeratingWithState:&v151 objects:v157 count:16];
    v76 = v140;
    v137 = v74;
    if (v75)
    {
      uint64_t v77 = v75;
      uint64_t v78 = *(void *)v152;
      do
      {
        for (uint64_t j = 0; j != v77; ++j)
        {
          if (*(void *)v152 != v78) {
            objc_enumerationMutation(type);
          }
          v80 = *(void **)(*((void *)&v151 + 1) + 8 * j);
          v81 = (void *)MEMORY[0x1C186D320]();
          if (objc_msgSend(v80, "vcp_hasFace"))
          {
            objc_msgSend(v80, "vcp_normalizedFaceBounds");
            double v83 = v82;
            double v85 = v84;
            double v87 = v86;
            double v89 = v88;
            id v90 = objc_alloc(MEMORY[0x1E4FB4060]);
            LODWORD(v91) = 1.0;
            v92 = objc_msgSend(v90, "initWithLabel:normalizedBoundingBox:confidence:", @"Face", v83, v85, v87, v89, v91);
            [v74 addObject:v92];

            v93 = [v80 personLocalIdentifier];
            v94 = [v76 objectForKeyedSubscript:v93];

            if (v94 && [v94 faceCount])
            {
              uint64_t v95 = [v94 faceCount];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v96 = VCPLogInstance();
                if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
                {
                  v97 = [v80 personLocalIdentifier];
                  v98 = [v94 name];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v159 = (uint64_t)v97;
                  __int16 v160 = 2112;
                  uint64_t v161 = (uint64_t)v98;
                  __int16 v162 = 2048;
                  uint64_t v163 = v95;
                  _os_log_impl(&dword_1BBEDA000, v96, OS_LOG_TYPE_DEBUG, "[VI][Identity] Creating VIReducePersonOverTriggerRegionalAnnotation for face identity %@ (%@) with %ld faces in Photos library", buf, 0x20u);

                  uint64_t v6 = v138;
                }

                v76 = v140;
              }
              id v99 = objc_alloc(MEMORY[0x1E4FB4050]);
              v100 = [v80 personLocalIdentifier];
              LODWORD(v101) = 1.0;
              v102 = v99;
              v74 = v137;
              v103 = objc_msgSend(v102, "initWithLabel:boundingBox:confidence:faceCount:", v100, v95, v83, v85, v87, v89, v101);

              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v104 = VCPLogInstance();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v159 = (uint64_t)v103;
                  _os_log_impl(&dword_1BBEDA000, v104, OS_LOG_TYPE_DEBUG, "[VI][Identity] Created VIReducePersonOverTriggerRegionalAnnotation %@", buf, 0xCu);
                }
              }
              [v6 addObject:v103];
            }
          }
        }
        uint64_t v77 = [type countByEnumeratingWithState:&v151 objects:v157 count:16];
      }
      while (v77);
    }

    char v3 = v129;
    uint64_t v4 = v131;
    uint64_t v5 = v127;
    if ((v129 & 2) != 0) {
      goto LABEL_24;
    }
    goto LABEL_86;
  }
  uint64_t v6 = 0;
  spida = 0;
  v137 = 0;
LABEL_88:

  v61 = spida;
LABEL_89:
  if ([v6 count])
  {
    v105 = (void *)[objc_alloc(MEMORY[0x1E4FB4048]) initWithRegionsItems:v6];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v106 = VCPLogInstance();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v107 = [v6 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v159 = v107;
        __int16 v160 = 2112;
        uint64_t v161 = (uint64_t)v105;
        _os_log_impl(&dword_1BBEDA000, v106, OS_LOG_TYPE_DEBUG, "[VI][Identity] Packaged VIReducePersonOverTriggerAnnotation with %lu VIReducePersonOverTriggerRegionalAnnotation - %@", buf, 0x16u);
      }
    }
    if ((v3 & 4) == 0)
    {
LABEL_95:
      v108 = 0;
      if ((v3 & 8) != 0) {
        goto LABEL_96;
      }
LABEL_117:
      v109 = 0;
      if ((v3 & 0x10) != 0) {
        goto LABEL_97;
      }
      goto LABEL_118;
    }
  }
  else
  {
    v105 = 0;
    if ((v3 & 4) == 0) {
      goto LABEL_95;
    }
  }
  v111 = [(VCPMADServiceImageAsset *)v4 nsfwClassifications];
  if (v111)
  {
    v141 = v105;
    spidb = v61;
    char v130 = v3;
    v132 = v4;
    v108 = [MEMORY[0x1E4F1CA48] array];
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v112 = v111;
    uint64_t v113 = [v112 countByEnumeratingWithState:&v143 objects:v155 count:16];
    if (!v113) {
      goto LABEL_114;
    }
    uint64_t v114 = v113;
    uint64_t v115 = *(void *)v144;
    while (1)
    {
      uint64_t v116 = 0;
      do
      {
        if (*(void *)v144 != v115) {
          objc_enumerationMutation(v112);
        }
        v117 = *(void **)(*((void *)&v143 + 1) + 8 * v116);
        v118 = VCPSpecialLabelFromExtendedSceneClassificationID([v117 extendedSceneIdentifier]);
        if (v118)
        {
          id v119 = objc_alloc(MEMORY[0x1E4FB4060]);
          [v117 confidence];
          *(float *)&double v121 = v120;
          v122 = objc_msgSend(v119, "initWithLabel:normalizedBoundingBox:confidence:", v118, 0.0, 0.0, 1.0, 1.0, v121);
          [v108 addObject:v122];
LABEL_107:

          goto LABEL_108;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v122 = VCPLogInstance();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v123 = [v117 extendedSceneIdentifier];
            *(_DWORD *)buf = 134217984;
            uint64_t v159 = v123;
            _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_DEFAULT, "[NSFW] Failed to find label for identifier %llu", buf, 0xCu);
          }
          goto LABEL_107;
        }
LABEL_108:

        ++v116;
      }
      while (v114 != v116);
      uint64_t v124 = [v112 countByEnumeratingWithState:&v143 objects:v155 count:16];
      uint64_t v114 = v124;
      if (!v124)
      {
LABEL_114:

        char v3 = v130;
        uint64_t v4 = v132;
        v61 = spidb;
        v105 = v141;
        goto LABEL_116;
      }
    }
  }
  v108 = 0;
LABEL_116:

  if ((v3 & 8) == 0) {
    goto LABEL_117;
  }
LABEL_96:
  v109 = [(VCPMADServiceImageAsset *)v4 vcp_textAnnotation];
  if ((v3 & 0x10) != 0)
  {
LABEL_97:
    v110 = [(VCPMADServiceImageAsset *)v4 vcp_scenenetAnnotation];
    goto LABEL_119;
  }
LABEL_118:
  v110 = 0;
LABEL_119:
  v125 = (void *)[objc_alloc(MEMORY[0x1E4FB4018]) initWithReducePersonOverTriggerAnnotation:v105 faceAnnotations:v137 humanAnnotations:v61 nsfwAnnotations:v108 textBlockAnnotation:v109 scenenetAnnotation:v110 barcodeAnnotation:0];

  return v125;
}

- (VCPMADServiceImageAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPMADServiceImageAsset;
  v9 = [(VCPMADServiceImageAsset *)&v12 init];
  os_signpost_id_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientBundleID, a3);
    objc_storeStrong((id *)&v10->_clientTeamID, a4);
  }

  return v10;
}

+ (VCPMADServiceImageAsset)assetWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  double v14 = [[VCPMADServiceImagePixelBufferAsset alloc] initWithPixelBuffer:a3 orientation:v9 andIdentifier:v11 clientBundleID:v12 clientTeamID:v13];

  return (VCPMADServiceImageAsset *)v14;
}

+ (VCPMADServiceImageAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[VCPMADServiceImageURLAsset alloc] initWithURL:v9 identifier:v10 clientBundleID:v11 clientTeamID:v12];

  return (VCPMADServiceImageAsset *)v13;
}

+ (VCPMADServiceImageAsset)assetWithImageData:(id)a3 uniformTypeIdentifier:(id)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double v16 = [[VCPMADServiceImageDataAsset alloc] initWithImageData:v11 uniformTypeIdentifier:v12 identifier:v13 clientBundleID:v14 clientTeamID:v15];

  return (VCPMADServiceImageAsset *)v16;
}

+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[VCPMADServiceImagePhotosAsset alloc] initWithPhotosAsset:v7 clientBundleID:v8 clientTeamID:v9];

  return (VCPMADServiceImageAsset *)v10;
}

+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [[VCPMADServiceImagePhotosAsset alloc] initWithPhotosAsset:v11 pixelBuffer:a4 orientation:v9 clientBundleID:v12 clientTeamID:v13];

  return (VCPMADServiceImageAsset *)v14;
}

- (NSString)identifier
{
  return 0;
}

- (CLLocation)location
{
  return 0;
}

- (BOOL)isScreenshot
{
  return 0;
}

- (NSArray)faces
{
  return 0;
}

- (NSArray)nsfwClassifications
{
  return 0;
}

- (NSArray)scenenetClassifications
{
  return 0;
}

- (NSArray)barcodeObservations
{
  return 0;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  return -4;
}

- (void)setCachedParseData:(id)a3
{
}

- (BOOL)hasValidSceneProcessing
{
  return 0;
}

- (NSNumber)isSensitive
{
  return 0;
}

- (BOOL)fromGenerativePlayground
{
  return 0;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientTeamID
{
  return self->_clientTeamID;
}

- (NSArray)documentObservations
{
  return self->_documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
}

- (void)setBarcodeObservations:(id)a3
{
}

- (BOOL)hasCachedParseData
{
  return self->_hasCachedParseData;
}

- (NSData)cachedParseData
{
  return self->_cachedParseData;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_isHighResDecoded;
}

- (BOOL)userSafetyEligible
{
  return self->_userSafetyEligible;
}

- (void)setUserSafetyEligible:(BOOL)a3
{
  self->_userSafetyEligible = a3;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_barcodeObservations, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end