@interface UARPHeySiriModelVoiceAssist
+ (id)tag;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPHeySiriModelVoiceAssist)init;
- (id)generateAsset:(id *)a3;
- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
@end

@implementation UARPHeySiriModelVoiceAssist

- (UARPHeySiriModelVoiceAssist)init
{
  return 0;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v5 = [UARPSuperBinaryAsset alloc];
  v6 = [(UARPHeySiriModelBase *)self url];
  v7 = [(UARPSuperBinaryAsset *)v5 initWithURL:v6];
  [(UARPHeySiriModelBase *)self setSuperbinary:v7];

  v8 = [(UARPHeySiriModelBase *)self superbinary];
  LOBYTE(a3) = [v8 expandHeadersAndTLVs:a3];

  v9 = [(UARPHeySiriModelBase *)self superbinary];
  v10 = [v9 tlvs];
  v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:76079623 tlvs:v10];

  v12 = [v11 valueAsVersion];
  -[UARPHeySiriModelBase setMajorVersion:](self, "setMajorVersion:", [v12 majorVersion]);
  -[UARPHeySiriModelBase setMinorVersion:](self, "setMinorVersion:", [v12 minorVersion]);
  v15.receiver = self;
  v15.super_class = (Class)UARPHeySiriModelVoiceAssist;
  [(UARPHeySiriModelBase *)&v15 setDelegate:self];
  v14.receiver = self;
  v14.super_class = (Class)UARPHeySiriModelVoiceAssist;
  [(UARPHeySiriModelBase *)&v14 checkCurrentHeySiriModel];

  return (char)a3;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v92 = a3;
  id v91 = a4;
  v120.receiver = self;
  v120.super_class = (Class)UARPHeySiriModelVoiceAssist;
  v7 = [(UARPHeySiriModelBase *)&v120 accessory];
  v8 = [v7 modelNumber];
  v9 = +[UARPSupportedAccessory findByAppleModelNumber:v8];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F089D8];
    v11 = UARPStringSupplementalAssetsFilepath();
    v12 = [v9 supplementalMobileAssetAppleModelNumber];
    v13 = [v10 stringWithFormat:@"%@/%@-%@", v11, v12, @"VoiceAssist"];

    id v117 = 0;
    LOBYTE(v10) = appendFirstUarpFilenameToFilepath(v13, (uint64_t)&v117);
    objc_super v14 = v117;
    if ((v10 & 1) == 0)
    {
      v116.receiver = self;
      v116.super_class = (Class)UARPHeySiriModelVoiceAssist;
      v16 = [(UARPHeySiriModelBase *)&v116 log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.8((uint64_t)v13, v16, v58, v59, v60, v61, v62, v63);
      }
      goto LABEL_45;
    }
    v115.receiver = self;
    v115.super_class = (Class)UARPHeySiriModelVoiceAssist;
    objc_super v15 = [(UARPHeySiriModelBase *)&v115 log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v13;
      _os_log_impl(&dword_21E079000, v15, OS_LOG_TYPE_DEFAULT, "Filename for voice assist is %@", buf, 0xCu);
    }

    v16 = [NSURL URLWithString:v13];
    v17 = [[UARPSuperBinaryAsset alloc] initWithURL:v16];
    asset = self->_asset;
    self->_asset = v17;

    if (!self->_asset)
    {
      v114.receiver = self;
      v114.super_class = (Class)UARPHeySiriModelVoiceAssist;
      v55 = [(UARPHeySiriModelBase *)&v114 log];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:]();
      }
      goto LABEL_44;
    }
    if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0])
    {
      v113.receiver = self;
      v113.super_class = (Class)UARPHeySiriModelVoiceAssist;
      v55 = [(UARPHeySiriModelBase *)&v113 log];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.7();
      }
      goto LABEL_44;
    }
    v81 = v16;
    v82 = v14;
    v84 = v13;
    p_payloadModel = &self->_payloadModel;
    payloadModel = self->_payloadModel;
    self->_payloadModel = 0;

    v83 = self;
    payloadFallbackModel = self->_payloadFallbackModel;
    location = (id *)&self->_payloadFallbackModel;
    self->_payloadFallbackModel = 0;

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    p_asset = (id *)&self->_asset;
    id obj = [(UARPSuperBinaryAsset *)self->_asset payloads];
    uint64_t v88 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
    if (v88)
    {
      uint64_t v87 = *(void *)v110;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v110 != v87) {
            objc_enumerationMutation(obj);
          }
          uint64_t v89 = v22;
          v23 = *(void **)(*((void *)&v109 + 1) + 8 * v22);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          v24 = [v23 tlvs];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v106;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v106 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v105 + 1) + 8 * i);
                if ([v29 type] == 76079617)
                {
                  v30 = [v29 valueAsString];
                  v31 = [v92 modelLocale];
                  char v32 = [v30 isEqualToString:v31];

                  v33 = (id *)p_payloadModel;
                  if ((v32 & 1) != 0
                    || ([v91 modelLocale],
                        v34 = objc_claimAutoreleasedReturnValue(),
                        int v35 = [v30 isEqualToString:v34],
                        v34,
                        v33 = location,
                        v35))
                  {
                    objc_storeStrong(v33, v23);
                  }
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
            }
            while (v26);
          }

          uint64_t v22 = v89 + 1;
        }
        while (v89 + 1 != v88);
        uint64_t v88 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      }
      while (v88);
    }

    uint64_t v36 = UARPUtilsBuildURLForTemporaryFile();
    superBinaryMetaDataURL = v83->_superBinaryMetaDataURL;
    v83->_superBinaryMetaDataURL = (NSURL *)v36;

    id v38 = *p_asset;
    v39 = v83->_superBinaryMetaDataURL;
    uint64_t v40 = [*p_asset rangeMetadata];
    id v104 = 0;
    LOBYTE(v38) = objc_msgSend(v38, "exportSuperBinaryContentToFilepath:range:error:", v39, v40, v41, &v104);
    v42 = v104;

    if ((v38 & 1) == 0)
    {
      v103.receiver = v83;
      v103.super_class = (Class)UARPHeySiriModelVoiceAssist;
      v55 = [(UARPHeySiriModelBase *)&v103 log];
      v13 = v84;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.6();
      }
      goto LABEL_42;
    }
    v13 = v84;
    if (*p_payloadModel)
    {
      uint64_t v43 = UARPUtilsBuildURLForTemporaryFile();
      modelMetaDataURL = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = (NSURL *)v43;

      id v45 = *p_asset;
      v46 = v83->_modelMetaDataURL;
      uint64_t v47 = [(UARPSuperBinaryAssetPayload *)*p_payloadModel rangeMetadata];
      id v102 = 0;
      LOBYTE(v45) = objc_msgSend(v45, "exportSuperBinaryContentToFilepath:range:error:", v46, v47, v48, &v102);
      objc_super v14 = v102;

      if ((v45 & 1) == 0)
      {
        v101.receiver = v83;
        v101.super_class = (Class)UARPHeySiriModelVoiceAssist;
        v55 = [(UARPHeySiriModelBase *)&v101 log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.5();
        }
        goto LABEL_43;
      }
      uint64_t v49 = UARPUtilsBuildURLForTemporaryFile();
      modelDataURL = v83->_modelDataURL;
      v83->_modelDataURL = (NSURL *)v49;

      id v51 = *p_asset;
      v52 = v83->_modelDataURL;
      uint64_t v53 = [(UARPSuperBinaryAssetPayload *)*p_payloadModel rangePayload];
      id v100 = 0;
      LOBYTE(v51) = objc_msgSend(v51, "exportSuperBinaryContentToFilepath:range:error:", v52, v53, v54, &v100);
      v42 = v100;

      if ((v51 & 1) == 0)
      {
        v99.receiver = v83;
        v99.super_class = (Class)UARPHeySiriModelVoiceAssist;
        v55 = [(UARPHeySiriModelBase *)&v99 log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.4();
        }
LABEL_42:
        objc_super v14 = v42;
LABEL_43:
        v16 = v81;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {
      v64 = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = 0;

      v65 = v83->_modelDataURL;
      v83->_modelDataURL = 0;
    }
    if (*location)
    {
      uint64_t v66 = UARPUtilsBuildURLForTemporaryFile();
      fallbackModelMetaDataURL = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = (NSURL *)v66;

      id v68 = *p_asset;
      v69 = v83->_fallbackModelMetaDataURL;
      uint64_t v70 = [*location rangeMetadata];
      id v98 = 0;
      LOBYTE(v68) = objc_msgSend(v68, "exportSuperBinaryContentToFilepath:range:error:", v69, v70, v71, &v98);
      objc_super v14 = v98;

      if ((v68 & 1) == 0)
      {
        v97.receiver = v83;
        v97.super_class = (Class)UARPHeySiriModelVoiceAssist;
        v55 = [(UARPHeySiriModelBase *)&v97 log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:]();
        }
        goto LABEL_43;
      }
      uint64_t v72 = UARPUtilsBuildURLForTemporaryFile();
      fallbackModelDataURL = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = (NSURL *)v72;

      id v74 = *p_asset;
      v75 = v83->_fallbackModelDataURL;
      uint64_t v76 = [*location rangePayload];
      id v96 = 0;
      LOBYTE(v74) = objc_msgSend(v74, "exportSuperBinaryContentToFilepath:range:error:", v75, v76, v77, &v96);
      v42 = v96;

      if ((v74 & 1) == 0)
      {
        v95.receiver = v83;
        v95.super_class = (Class)UARPHeySiriModelVoiceAssist;
        v55 = [(UARPHeySiriModelBase *)&v95 log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:]();
        }
        goto LABEL_42;
      }
    }
    else
    {
      v78 = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = 0;

      v79 = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = 0;
    }
    v94 = v42;
    v55 = [(UARPHeySiriModelVoiceAssist *)v83 generateAsset:&v94];
    objc_super v14 = v94;

    v80 = +[UARPHeySiriModelVoiceAssist tag];
    v93.receiver = v83;
    v93.super_class = (Class)UARPHeySiriModelVoiceAssist;
    [(UARPHeySiriModelBase *)&v93 offerDynamicAssetToAccessory:v55 tag:v80 error:0];

    goto LABEL_43;
  }
  v119.receiver = self;
  v119.super_class = (Class)UARPHeySiriModelVoiceAssist;
  objc_super v14 = [(UARPHeySiriModelBase *)&v119 log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v118.receiver = self;
    v118.super_class = (Class)UARPHeySiriModelVoiceAssist;
    v56 = [(UARPHeySiriModelBase *)&v118 accessory];
    v57 = [v56 modelNumber];
    *(_DWORD *)buf = 138412290;
    v124 = v57;
    _os_log_error_impl(&dword_21E079000, v14, OS_LOG_TYPE_ERROR, "Could not find supported accessory for  %@", buf, 0xCu);
  }
LABEL_46:
}

- (id)generateAsset:(id *)a3
{
  uint64_t v53 = 0;
  uint64_t v52 = 0;
  uint64_t v54 = 0;
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  v43.receiver = self;
  v43.super_class = (Class)UARPHeySiriModelVoiceAssist;
  v50[0] = [(UARPHeySiriModelBase *)&v43 uarpProtocolVersion];
  v50[1] = 44;
  payloadModel = self->_payloadModel;
  BOOL v6 = payloadModel == 0;
  BOOL v7 = payloadModel != 0;
  if (v6) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  if (self->_fallbackModelMetaDataURL) {
    BOOL v7 = v8;
  }
  int v55 = 44;
  int v56 = 40 * v7;
  int v9 = 40 * v7 + 44;
  int v51 = v9;
  LODWORD(v54) = v9;
  v10 = (uint64_t *)MEMORY[0x263F080B8];
  if (self->_superBinaryMetaDataURL)
  {
    v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [(NSURL *)self->_superBinaryMetaDataURL absoluteString];
    v13 = [v11 attributesOfItemAtPath:v12 error:a3];

    objc_super v14 = [v13 objectForKeyedSubscript:*v10];
    int v15 = [v14 unsignedLongValue];
    v9 += v15;
    HIDWORD(v54) = v15;
    int v51 = v9;
  }
  v42 = +[UARPHeySiriModelVoiceAssist tag];
  if (self->_payloadModel)
  {
    LODWORD(v47) = 40;
    DWORD1(v47) = [v42 tag];
    v16 = [MEMORY[0x263F08850] defaultManager];
    v17 = [(NSURL *)self->_modelMetaDataURL absoluteString];
    v18 = [v16 attributesOfItemAtPath:v17 error:a3];

    uint64_t v19 = *v10;
    v20 = [v18 objectForKeyedSubscript:*v10];
    DWORD2(v48) = v9;
    HIDWORD(v48) = [v20 unsignedLongValue];
    int v21 = v9 + HIDWORD(v48);
    uint64_t v22 = [MEMORY[0x263F08850] defaultManager];
    v23 = [(NSURL *)self->_modelDataURL absoluteString];
    v24 = [v22 attributesOfItemAtPath:v23 error:a3];

    uint64_t v25 = [v24 objectForKeyedSubscript:v19];
    LODWORD(v49) = v21;
    HIDWORD(v49) = [v25 unsignedLongValue];
    int v9 = v21 + HIDWORD(v49);
    int v51 = v21 + HIDWORD(v49);
  }
  if (self->_payloadFallbackModel)
  {
    LODWORD(v44) = 40;
    DWORD1(v44) = [v42 tag];
    uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v27 = [(NSURL *)self->_fallbackModelMetaDataURL absoluteString];
    v28 = [v26 attributesOfItemAtPath:v27 error:a3];

    uint64_t v29 = *MEMORY[0x263F080B8];
    v30 = [v28 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
    DWORD2(v45) = v9;
    HIDWORD(v45) = [v30 unsignedLongValue];
    int v31 = v9 + HIDWORD(v45);
    char v32 = [MEMORY[0x263F08850] defaultManager];
    v33 = [(NSURL *)self->_fallbackModelDataURL absoluteString];
    v34 = [v32 attributesOfItemAtPath:v33 error:a3];

    int v35 = [v34 objectForKeyedSubscript:v29];
    LODWORD(v46) = v31;
    HIDWORD(v46) = [v35 unsignedLongValue];
    int v51 = v31 + HIDWORD(v46);
  }
  uarpSuperBinaryHeaderEndianSwap(v50, v50);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v47, &v47);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v44, &v44);
  uint64_t v36 = UARPUtilsBuildURLForTemporaryFile();
  v37 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v36 error:a3];
  if (v37)
  {
    id v38 = objc_alloc_init(MEMORY[0x263EFF990]);
    [v38 appendBytes:v50 length:44];
    if (self->_payloadModel) {
      [v38 appendBytes:&v47 length:40];
    }
    if (self->_payloadFallbackModel) {
      [v38 appendBytes:&v44 length:40];
    }
    if ([v37 uarpWriteData:v38 error:a3]
      && [v37 uarpCloseAndReturnError:a3]
      && uarpUtilsConcatenateURLs((uint64_t)v36, *(void **)((char *)&self->super.super.isa + v41), (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelMetaDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelMetaDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelDataURL, (uint64_t)a3))
    {
      id v39 = v36;
    }
    else
    {
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructVoiceAssist();
  v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFallbackModel, 0);
  objc_storeStrong((id *)&self->_payloadModel, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_fallbackModelDataURL, 0);
  objc_storeStrong((id *)&self->_fallbackModelMetaDataURL, 0);
  objc_storeStrong((id *)&self->_modelDataURL, 0);
  objc_storeStrong((id *)&self->_modelMetaDataURL, 0);
  objc_storeStrong((id *)&self->_superBinaryMetaDataURL, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Could not init uarp superbinary %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.2()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Failed to export Fallback Model URL %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.3()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Failed to export Fallback Model MetaData URL %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.4()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Failed to export Model URL %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.5()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Failed to export Model MetaData URL %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.6()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Failed to export SuperBinary MetaData URL %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.7()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Could not expand uarp superbinary  %@", v2, v3, v4, v5, v6);
}

- (void)currentHeySiriModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 error:(uint64_t)a5 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end