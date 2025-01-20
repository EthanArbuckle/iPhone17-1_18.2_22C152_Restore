@interface FigCaptureSessionParsedConfigurationRestrictions
- (BOOL)allowAllConfigurations;
- (FigCaptureSessionParsedConfigurationRestrictions)initWithAllowedAVMediaTypes:(id)a3 clientIsNonStandard:(BOOL)a4;
- (FigCaptureSessionParsedConfigurationRestrictions)initWithClientAuditToken:(id *)a3;
- (NSArray)allowedConnectionMediaTypes;
- (NSArray)allowedConnectionMetadataIdentifiers;
- (uint64_t)_parseRestrictionsWithAllowedAVMediaTypes:(int)a3 clientIsNonStandard:;
- (void)dealloc;
@end

@implementation FigCaptureSessionParsedConfigurationRestrictions

- (BOOL)allowAllConfigurations
{
  return self->_allowAllConfigurations;
}

- (FigCaptureSessionParsedConfigurationRestrictions)initWithClientAuditToken:(id *)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    BOOL v8 = FigCaptureClientIsNonStandardWithSecTask(v6) != 0;
    v9 = (void *)SecTaskCopyValueForEntitlement(v7, @"com.apple.private.avfoundation.capture.nonstandard-client.allowed-media-types", 0);
    self = [(FigCaptureSessionParsedConfigurationRestrictions *)self initWithAllowedAVMediaTypes:v9 clientIsNonStandard:v8];
    CFRelease(v7);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
  }

  return self;
}

- (FigCaptureSessionParsedConfigurationRestrictions)initWithAllowedAVMediaTypes:(id)a3 clientIsNonStandard:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSessionParsedConfigurationRestrictions;
  v6 = [(FigCaptureSessionParsedConfigurationRestrictions *)&v9 init];
  v7 = v6;
  if (v6) {
    -[FigCaptureSessionParsedConfigurationRestrictions _parseRestrictionsWithAllowedAVMediaTypes:clientIsNonStandard:]((uint64_t)v6, a3, v4);
  }
  return v7;
}

- (uint64_t)_parseRestrictionsWithAllowedAVMediaTypes:(int)a3 clientIsNonStandard:
{
  v74[37] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = a2;
    uint64_t v4 = result;
    if (a2) {
      int v5 = a3;
    }
    else {
      int v5 = 0;
    }
    if (v5 == 1)
    {
      uint64_t v24 = result;
      v26 = (void *)[MEMORY[0x1E4F1CA48] array];
      v62 = (void *)[MEMORY[0x1E4F1CA48] array];
      objc_opt_class();
      id obj = v3;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_29:
        uint64_t v4 = v24;
        *(unsigned char *)(v24 + 8) = 0;
        v22 = v26;
        [v26 removeAllObjects];
        v23 = v62;
        [v62 removeAllObjects];
LABEL_32:
        *(void *)(v4 + 16) = [v22 copy];
        result = [v23 copy];
        *(void *)(v4 + 24) = result;
        return result;
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v25 = [v3 countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v25)
      {
        uint64_t v27 = *(void *)v68;
        uint64_t v61 = *MEMORY[0x1E4F55990];
        uint64_t v60 = *MEMORY[0x1E4F21820];
        uint64_t v59 = *MEMORY[0x1E4F1F128];
        uint64_t v57 = *MEMORY[0x1E4F21830];
        uint64_t v58 = *MEMORY[0x1E4F21828];
        uint64_t v55 = *MEMORY[0x1E4F21840];
        uint64_t v56 = *MEMORY[0x1E4F21838];
        uint64_t v53 = *MEMORY[0x1E4F1F130];
        uint64_t v54 = *MEMORY[0x1E4F21848];
        uint64_t v51 = *MEMORY[0x1E4F21858];
        uint64_t v52 = *MEMORY[0x1E4F21850];
        uint64_t v49 = *MEMORY[0x1E4F1F140];
        uint64_t v50 = *MEMORY[0x1E4F1F138];
        uint64_t v47 = *MEMORY[0x1E4F21860];
        uint64_t v48 = *MEMORY[0x1E4F55978];
        uint64_t v45 = *MEMORY[0x1E4F21898];
        uint64_t v46 = *MEMORY[0x1E4F21868];
        uint64_t v43 = *MEMORY[0x1E4F21878];
        uint64_t v44 = *MEMORY[0x1E4F21870];
        uint64_t v41 = *MEMORY[0x1E4F559A0];
        uint64_t v42 = *MEMORY[0x1E4F55998];
        uint64_t v39 = *MEMORY[0x1E4F559B0];
        uint64_t v40 = *MEMORY[0x1E4F559A8];
        uint64_t v37 = *MEMORY[0x1E4F559B8];
        uint64_t v38 = *MEMORY[0x1E4F559C0];
        uint64_t v35 = *MEMORY[0x1E4F559C8];
        uint64_t v36 = *MEMORY[0x1E4F1F148];
        uint64_t v33 = *MEMORY[0x1E4F559E8];
        uint64_t v34 = *MEMORY[0x1E4F559D8];
        uint64_t v31 = *MEMORY[0x1E4F21880];
        uint64_t v32 = *MEMORY[0x1E4F218A8];
        uint64_t v6 = *MEMORY[0x1E4F559E0];
        uint64_t v7 = *MEMORY[0x1E4F55988];
        uint64_t v8 = *MEMORY[0x1E4F55968];
        uint64_t v9 = *MEMORY[0x1E4F55970];
        uint64_t v10 = *MEMORY[0x1E4F55980];
        uint64_t v11 = *MEMORY[0x1E4F559D0];
        while (2)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v68 != v27) {
              objc_enumerationMutation(v3);
            }
            uint64_t v29 = v12;
            v13 = *(void **)(*((void *)&v67 + 1) + 8 * v12);
            v14 = (void *)[v3 objectForKeyedSubscript:v13];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v14 BOOLValue])
              {
                uint64_t v15 = [&unk_1EFB05AD0 objectForKeyedSubscript:v13];
                if (!v15) {
                  goto LABEL_29;
                }
                [v26 addObject:v15];
              }
            }
            else
            {
              objc_opt_class();
              id v30 = v14;
              if ((objc_opt_isKindOfClass() & 1) == 0
                || ![v13 isEqualToString:@"AVMediaTypeMetadataObject"])
              {
                goto LABEL_29;
              }
              [v26 addObject:&unk_1EFAFEAD8];
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              uint64_t v16 = [v14 countByEnumeratingWithState:&v63 objects:v71 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v64;
LABEL_20:
                uint64_t v19 = 0;
                while (1)
                {
                  if (*(void *)v64 != v18) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v63 + 1) + 8 * v19);
                  v73[0] = @"AVMetadataObjectTypeAppClipCode";
                  v73[1] = @"AVMetadataObjectTypeAztecCode";
                  v74[0] = v61;
                  v74[1] = v60;
                  v73[2] = @"AVMetadataObjectTypeCatBody";
                  v73[3] = @"AVMetadataObjectTypeCode128Code";
                  v74[2] = v59;
                  v74[3] = v58;
                  v73[4] = @"AVMetadataObjectTypeCode39Code";
                  v73[5] = @"AVMetadataObjectTypeCode39Mod43Code";
                  v74[4] = v57;
                  v74[5] = v56;
                  v73[6] = @"AVMetadataObjectTypeCode93Code";
                  v73[7] = @"AVMetadataObjectTypeDataMatrixCode";
                  v74[6] = v55;
                  v74[7] = v54;
                  v73[8] = @"AVMetadataObjectTypeDogBody";
                  v73[9] = @"AVMetadataObjectTypeEAN13Code";
                  v74[8] = v53;
                  v74[9] = v52;
                  v73[10] = @"AVMetadataObjectTypeEAN8Code";
                  v73[11] = @"AVMetadataObjectTypeFace";
                  v74[10] = v51;
                  v74[11] = v50;
                  v73[12] = @"AVMetadataObjectTypeHumanBody";
                  v73[13] = @"AVMetadataObjectTypeHumanFullBody";
                  v74[12] = v49;
                  v74[13] = v48;
                  v73[14] = @"AVMetadataObjectTypeInterleaved2of5Code";
                  v73[15] = @"AVMetadataObjectTypeITF14Code";
                  v74[14] = v47;
                  v74[15] = v46;
                  v73[16] = @"AVMetadataObjectTypeOfflineVideoStabilizationMotion";
                  v73[17] = @"AVMetadataObjectTypePDF417Code";
                  v74[16] = v45;
                  v74[17] = v44;
                  v73[18] = @"AVMetadataObjectTypeQRCode";
                  v73[19] = @"AVMetadataObjectTypeCodabarCode";
                  v74[18] = v43;
                  v74[19] = v42;
                  v73[20] = @"AVMetadataObjectTypeGS1DataBarCode";
                  v73[21] = @"AVMetadataObjectTypeGS1DataBarExpandedCode";
                  v74[20] = v41;
                  v74[21] = v40;
                  v73[22] = @"AVMetadataObjectTypeGS1DataBarLimitedCode";
                  v73[23] = @"AVMetadataObjectTypeMicroQRCode";
                  v74[22] = v39;
                  v74[23] = v38;
                  v73[24] = @"AVMetadataObjectTypeMicroPDF417Code";
                  v73[25] = @"AVMetadataObjectTypeSalientObject";
                  v74[24] = v37;
                  v74[25] = v36;
                  v73[26] = @"AVMetadataObjectTypeTextRegion";
                  v73[27] = @"AVMetadataObjectTypeSceneClassification";
                  v74[26] = v35;
                  v74[27] = v34;
                  v73[28] = @"AVMetadataObjectTypeVisualIntelligence";
                  v73[29] = @"AVMetadataObjectTypeTrackedFaces";
                  v74[28] = v33;
                  v74[29] = v32;
                  v73[30] = @"AVMetadataObjectTypeUPCECode";
                  v73[31] = @"AVMetadataObjectTypeVideoPreviewHistogram";
                  v74[30] = v31;
                  v74[31] = v6;
                  v73[32] = @"AVMetadataObjectTypeHumanHead";
                  v73[33] = @"AVMetadataObjectTypeCatHead";
                  v74[32] = v7;
                  v74[33] = v8;
                  v73[34] = @"AVMetadataObjectTypeDogHead";
                  v73[35] = @"AVMetadataObjectTypeHumanHand";
                  v74[34] = v9;
                  v74[35] = v10;
                  v73[36] = @"AVMetadataObjectTypeEyeReliefStatus";
                  v74[36] = v11;
                  uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v74, v73, 37), "objectForKeyedSubscript:", v20);
                  if (!v21) {
                    goto LABEL_29;
                  }
                  [v62 addObject:v21];
                  if (v17 == ++v19)
                  {
                    uint64_t v17 = [v30 countByEnumeratingWithState:&v63 objects:v71 count:16];
                    if (v17) {
                      goto LABEL_20;
                    }
                    break;
                  }
                }
              }
            }
            v3 = obj;
            uint64_t v12 = v29 + 1;
          }
          while (v29 + 1 != v25);
          uint64_t v25 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
          if (v25) {
            continue;
          }
          break;
        }
        uint64_t v4 = v24;
        *(unsigned char *)(v24 + 8) = 0;
        v22 = v26;
        v23 = v62;
        goto LABEL_32;
      }
      uint64_t v4 = v24;
      v22 = v26;
      v23 = v62;
    }
    else
    {
      v23 = 0;
      v22 = 0;
    }
    *(unsigned char *)(v4 + 8) = v5 ^ 1;
    goto LABEL_32;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedConfigurationRestrictions;
  [(FigCaptureSessionParsedConfigurationRestrictions *)&v3 dealloc];
}

- (NSArray)allowedConnectionMediaTypes
{
  return self->_allowedConnectionMediaTypes;
}

- (NSArray)allowedConnectionMetadataIdentifiers
{
  return self->_allowedConnectionMetadataIdentifiers;
}

@end