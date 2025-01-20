@interface PHMediaFormatConversionImplementation_MediaConversionService
- (NSSet)ut_objectsToBeDeallocatedWithReceiver;
- (PAImageConversionServiceClient)imageConversionServiceClient;
- (PAVideoConversionServiceClient)videoConversionServiceClient;
- (PHMediaFormatConversionImplementation_MediaConversionService)init;
- (id)submitNonSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5;
- (id)submitSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5;
- (int64_t)transferBehaviorUserPreference;
- (void)applyCommonOptionsFromRequest:(id)a3 toOptions:(id)a4;
- (void)applyCommonOptionsFromVideoRequest:(id)a3 toOptions:(id)a4;
- (void)dealloc;
- (void)performConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)performImageConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)performVideoConversionRequest:(id)a3 completionHandler:(id)a4;
- (void)setImageConversionServiceClient:(id)a3;
- (void)setVideoConversionServiceClient:(id)a3;
@end

@implementation PHMediaFormatConversionImplementation_MediaConversionService

- (int64_t)transferBehaviorUserPreference
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.camera"];
  v3 = [v2 valueForKey:@"CAMUserPreferenceMediaTransferBehavior"];
  if (!v3 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:
    unint64_t v4 = 0;
    goto LABEL_7;
  }
  unint64_t v4 = [v3 integerValue];
  if (v4 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      unint64_t v7 = v4;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown transfer behavior user preference value %ld, using automatic", (uint8_t *)&v6, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
}

- (void)setImageConversionServiceClient:(id)a3
{
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return (PAImageConversionServiceClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVideoConversionServiceClient:(id)a3
{
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return (PAVideoConversionServiceClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)applyCommonOptionsFromRequest:(id)a3 toOptions:(id)a4
{
  id v5 = a4;
  if ([a3 requiresPassthroughConversion]) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"];
  }
  [v5 setObject:&unk_1F394BE80 forKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"];
}

- (void)performImageConversionRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  v9 = objc_opt_new();
  [v9 setMediaType:2];
  v10 = [v7 outputPathExtension];
  [v9 setOutputPathExtension:v10];

  [v9 generateTemporaryOutputFileURLForRequest:v7];
  id v62 = 0;
  char v11 = [v9 createTemporaryOutputFileWithErrorError:&v62];
  id v12 = v62;
  if (v11)
  {
    v56 = self;
    v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = +[PAMediaConversionServiceDefaultImageMetadataPolicy standardPolicy];
    [v13 addObject:v14];

    v15 = [v7 source];
    uint64_t v16 = [v15 renderOriginatingSignature];

    v55 = (void *)v16;
    if (v16)
    {
      v17 = [MEMORY[0x1E4F8CC48] renderOriginatingAssetIdentifierMetadataKey];
      v18 = +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:v17 value:v16];
      [v13 addObject:v18];
    }
    else
    {
      if (![v7 requiresFormatConversion])
      {
LABEL_11:
        v57 = [v7 livePhotoPairingIdentifier];
        switch([v7 livePhotoPairingIdentifierBehavior])
        {
          case 0:
            v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:a2 object:v56 file:@"PHMediaFormatConversionImplementation_MediaConversionService.m" lineNumber:328 description:@"Unexpected uninitialized live photo pairing identifier behavior"];
            goto LABEL_21;
          case 2:
            v22 = [v7 source];
            v23 = [v22 livePhotoPairingIdentifier];

            if (!v23) {
              goto LABEL_22;
            }
            goto LABEL_19;
          case 3:
            goto LABEL_16;
          case 4:
            v24 = [v7 source];
            v25 = [v24 livePhotoPairingIdentifier];

            if (!v25) {
              goto LABEL_22;
            }
LABEL_16:
            v21 = [MEMORY[0x1E4F8CC48] livePhotoPairingIdentifierMetadataKey];
            v26 = v21;
            v27 = v57;
            goto LABEL_20;
          case 5:
            v21 = [v7 source];
            uint64_t v28 = [v21 livePhotoPairingIdentifier];
            if (!v28) {
              goto LABEL_21;
            }
            v29 = (void *)v28;
            int v30 = [v7 requiresFormatConversion];

            if (!v30) {
              goto LABEL_22;
            }
LABEL_19:
            v21 = [MEMORY[0x1E4F8CC48] livePhotoPairingIdentifierMetadataKey];
            v26 = v21;
            v27 = 0;
LABEL_20:
            v31 = +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:v26 value:v27];
            [v13 addObject:v31];

LABEL_21:
LABEL_22:
            if ([v7 locationMetadataBehavior] == 1)
            {
              v32 = +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:0];
              [v13 addObject:v32];
LABEL_27:

              goto LABEL_28;
            }
            if ([v7 locationMetadataBehavior] == 2)
            {
              v33 = [v7 location];

              if (v33)
              {
                v32 = [v7 location];
                v34 = +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:v32];
                [v13 addObject:v34];

                goto LABEL_27;
              }
            }
LABEL_28:
            if ([v7 creationDateMetadataBehavior] == 2)
            {
              v35 = [v7 creationDate];

              if (v35)
              {
                v36 = [v7 creationDate];
                v37 = [v7 creationDateTimeZone];
                v38 = +[PAMediaConversionServiceSetCreationDateImageMetadataPolicy policyWithCreationDate:v36 inTimeZone:v37];
                [v13 addObject:v38];
              }
            }
            if ([v7 captionMetadataBehavior] == 1)
            {
              v39 = +[PAMediaConversionServiceSetCaptionImageMetadataPolicy policyWithCaption:0];
              [v13 addObject:v39];
LABEL_36:

              goto LABEL_37;
            }
            if ([v7 captionMetadataBehavior] == 2)
            {
              v40 = [v7 caption];

              if (v40)
              {
                v39 = [v7 caption];
                v41 = +[PAMediaConversionServiceSetCaptionImageMetadataPolicy policyWithCaption:v39];
                [v13 addObject:v41];

                goto LABEL_36;
              }
            }
LABEL_37:
            if ([v7 accessibilityDescriptionMetadataBehavior] == 1)
            {
              v42 = +[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy policyWithAccessibilityDescription:0];
              [v13 addObject:v42];
LABEL_42:

              goto LABEL_43;
            }
            if ([v7 accessibilityDescriptionMetadataBehavior] == 2)
            {
              v43 = [v7 accessibilityDescription];

              if (v43)
              {
                v42 = [v7 accessibilityDescription];
                v44 = +[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy policyWithAccessibilityDescription:v42];
                [v13 addObject:v44];

                goto LABEL_42;
              }
            }
LABEL_43:
            v45 = [MEMORY[0x1E4F1CA60] dictionary];
            v46 = +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:v13];
            [v45 setObject:v46 forKeyedSubscript:@"PAMediaConversionServiceOptionMetadataPolicyKey"];

            [v45 setObject:&unk_1F394C048 forKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"];
            [v45 setObject:&unk_1F394BE68 forKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"];
            [v45 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PAMediaConversionServiceOptionFormatConversionOnlyKey"];
            [v45 setObject:@"PHMediaFormatConversion" forKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
            [(PHMediaFormatConversionImplementation_MediaConversionService *)v56 applyCommonOptionsFromRequest:v7 toOptions:v45];
            v47 = [v7 source];
            v48 = [v47 fileURL];
            v49 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v48];

            v50 = [v9 fileURL];
            v51 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v50];

            v52 = [(PHMediaFormatConversionImplementation_MediaConversionService *)v56 imageConversionServiceClient];
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __112__PHMediaFormatConversionImplementation_MediaConversionService_performImageConversionRequest_completionHandler___block_invoke;
            v58[3] = &unk_1E6CFECC0;
            id v59 = v7;
            v61 = v8;
            id v60 = v9;
            [v52 convertImageAtSourceURLCollection:v49 toDestinationURLCollection:v51 options:v45 completionHandler:v58];

            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_44;
      }
      v19 = [v7 source];
      v17 = [v19 fileSignature];

      if (!v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v54 = [v7 source];
          *(_DWORD *)buf = 138412290;
          id v64 = v54;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil file signature for source %@", buf, 0xCu);
        }
        v53 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:5 userInfo:0];
        [v7 setError:v53];

        [v7 setStatus:5];
        v8[2](v8);
LABEL_44:

        goto LABEL_45;
      }
      v18 = [MEMORY[0x1E4F8CC48] originatingAssetIdentifierMetadataKey];
      v20 = +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:v18 value:v17];
      [v13 addObject:v20];
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v12;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
  }
  [v7 setError:v12];
  [v7 setStatus:5];
  v8[2](v8);
LABEL_45:
}

- (void)applyCommonOptionsFromVideoRequest:(id)a3 toOptions:(id)a4
{
  id v45 = a3;
  id v7 = a4;
  uint64_t v8 = [v45 source];
  v9 = [v8 renderOriginatingSignature];

  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataRenderOriginatingSignatureKey"];
  }
  else if ([v45 requiresFormatConversion])
  {
    v10 = [v45 source];
    char v11 = [v10 fileSignature];

    if (!v11)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v44 = [v45 source];
      [v43 handleFailureInMethod:a2, self, @"PHMediaFormatConversionImplementation_MediaConversionService.m", 194, @"Unexpected nil file signature for source %@", v44 object file lineNumber description];
    }
    [v7 setObject:v11 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataOriginatingSignatureKey"];
  }
  id v12 = [v45 livePhotoPairingIdentifier];
  switch([v45 livePhotoPairingIdentifierBehavior])
  {
    case 0:
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversionImplementation_MediaConversionService.m" lineNumber:226 description:@"Unexpected uninitialized live photo pairing identifier behavior"];

      goto LABEL_17;
    case 2:
      v14 = [v45 source];
      v15 = [v14 livePhotoPairingIdentifier];

      if (v15) {
        goto LABEL_15;
      }
      goto LABEL_17;
    case 3:
      goto LABEL_12;
    case 4:
      uint64_t v16 = [v45 source];
      v17 = [v16 livePhotoPairingIdentifier];

      if (!v17) {
        goto LABEL_17;
      }
LABEL_12:
      v18 = v7;
      v19 = v12;
      goto LABEL_16;
    case 5:
      v20 = [v45 source];
      uint64_t v21 = [v20 livePhotoPairingIdentifier];
      if (v21)
      {
        v22 = (void *)v21;
        int v23 = [v45 requiresFormatConversion];

        if (v23)
        {
LABEL_15:
          v19 = &stru_1F3947AF8;
          v18 = v7;
LABEL_16:
          [v18 setObject:v19 forKeyedSubscript:@"PAMediaConversionServiceOptionLivePhotoPairingIdentifierKey"];
        }
      }
      else
      {
      }
LABEL_17:
      v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v45, "locationMetadataBehavior") != 1);
      [v7 setObject:v24 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"];

      if ([v45 locationMetadataBehavior] == 2)
      {
        v25 = [v45 location];

        if (v25)
        {
          v26 = [v45 location];
          [v7 setObject:v26 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataLocationKey"];
        }
      }
      if ([v45 creationDateMetadataBehavior] == 2)
      {
        v27 = [v45 creationDate];

        if (v27)
        {
          uint64_t v28 = [v45 creationDate];
          [v7 setObject:v28 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateKey"];

          v29 = [v45 creationDateTimeZone];

          if (v29)
          {
            int v30 = [v45 creationDateTimeZone];
            v31 = [v45 creationDate];
            uint64_t v32 = [v30 secondsFromGMTForDate:v31];

            v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:v32];
            [v7 setObject:v33 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateTimeZoneOffsetKey"];
          }
        }
      }
      v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v45, "captionMetadataBehavior") != 1);
      [v7 setObject:v34 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeDescriptionKey"];

      if ([v45 captionMetadataBehavior] == 2)
      {
        v35 = [v45 caption];

        if (v35)
        {
          v36 = [v45 caption];
          [v7 setObject:v36 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataDescriptionKey"];
        }
      }
      v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v45, "accessibilityDescriptionMetadataBehavior") != 1);
      [v7 setObject:v37 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeAccessibilityDescriptionKey"];

      if ([v45 accessibilityDescriptionMetadataBehavior] == 2)
      {
        v38 = [v45 accessibilityDescription];

        if (v38)
        {
          v39 = [v45 accessibilityDescription];
          [v7 setObject:v39 forKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataAccessibilityDescriptionKey"];
        }
      }
      [v7 setObject:&unk_1F394BE38 forKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyKey"];
      [v7 setObject:&unk_1F394BE50 forKeyedSubscript:@"PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey"];
      id v40 = (id)*MEMORY[0x1E4F156E8];
      v41 = [v45 videoExportPreset];

      if (v41)
      {
        id v42 = [v45 videoExportPreset];

        [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PAMediaConversionServiceOptionIsPassthroughConversionKey"];
      }
      else
      {
        if (![v45 shouldExportAsHDR]) {
          goto LABEL_35;
        }
        id v42 = (id)*MEMORY[0x1E4F156E0];
      }
      id v40 = v42;
LABEL_35:
      [v7 setObject:v40 forKeyedSubscript:@"PAMediaConversionServiceOptionExportPresetNameKey"];

      return;
    default:
      goto LABEL_17;
  }
}

- (id)submitSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  char v11 = (void *)MEMORY[0x1E4F1CA60];
  int v30 = @"PAMediaConversionServiceOptionTargetFileSizeKey";
  id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "estimatedOutputFileLength"));
  v31[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v14 = [v11 dictionaryWithDictionary:v13];

  [(PHMediaFormatConversionImplementation_MediaConversionService *)self applyCommonOptionsFromRequest:v8 toOptions:v14];
  [(PHMediaFormatConversionImplementation_MediaConversionService *)self applyCommonOptionsFromVideoRequest:v8 toOptions:v14];
  objc_initWeak(&location, v8);
  v15 = [(PHMediaFormatConversionImplementation_MediaConversionService *)self videoConversionServiceClient];
  uint64_t v16 = [v8 source];
  v17 = [v16 fileURL];
  v18 = [v8 destination];
  v19 = [v18 fileURL];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __133__PHMediaFormatConversionImplementation_MediaConversionService_submitSinglePassVideoConversionRequest_destination_completionHandler___block_invoke;
  v25[3] = &unk_1E6CFEC08;
  id v20 = v10;
  id v26 = v20;
  objc_copyWeak(&v28, &location);
  id v21 = v9;
  id v27 = v21;
  id v24 = [v15 convertVideoAtSourceURL:v17 toDestinationURL:v19 options:v14 completionHandler:v25];

  [v20 startObservingProgress:v24 forRequest:v8];
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v24;
}

- (id)submitNonSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = *MEMORY[0x1E4F15AB0];
  v28[0] = @"PAMediaConversionServiceOptionOutputFileTypeKey";
  v28[1] = @"PAMediaConversionServiceOptionAVIncludeMetadataKey";
  v29[0] = v12;
  v29[1] = MEMORY[0x1E4F1CC38];
  v28[2] = @"PAMediaConversionServiceOptionAudioTrackGroupHandlingKey";
  v29[2] = &unk_1F394BE20;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  v14 = [v11 dictionaryWithDictionary:v13];

  [(PHMediaFormatConversionImplementation_MediaConversionService *)self applyCommonOptionsFromRequest:v8 toOptions:v14];
  [(PHMediaFormatConversionImplementation_MediaConversionService *)self applyCommonOptionsFromVideoRequest:v8 toOptions:v14];
  objc_initWeak(&location, v8);
  v15 = [(PHMediaFormatConversionImplementation_MediaConversionService *)self videoConversionServiceClient];
  uint64_t v16 = [v8 source];
  v17 = [v16 fileURL];
  v18 = [v9 fileURL];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __136__PHMediaFormatConversionImplementation_MediaConversionService_submitNonSinglePassVideoConversionRequest_destination_completionHandler___block_invoke;
  v23[3] = &unk_1E6CFEC08;
  objc_copyWeak(&v26, &location);
  id v19 = v9;
  id v24 = v19;
  id v20 = v10;
  id v25 = v20;
  id v21 = [v15 convertVideoAtSourceURL:v17 toDestinationURL:v18 options:v14 completionHandler:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v21;
}

- (void)performVideoConversionRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 destination];
  if (!v8)
  {
    id v8 = objc_opt_new();
    [v8 setMediaType:1];
    [v8 generateTemporaryOutputFileURLForRequest:v6];
  }
  id v13 = 0;
  char v9 = [v8 createTemporaryOutputFileWithErrorError:&v13];
  id v10 = v13;
  if (v9)
  {
    if ([v6 requiresSinglePassVideoConversion]) {
      [(PHMediaFormatConversionImplementation_MediaConversionService *)self submitSinglePassVideoConversionRequest:v6 destination:v8 completionHandler:v7];
    }
    else {
    char v11 = [(PHMediaFormatConversionImplementation_MediaConversionService *)self submitNonSinglePassVideoConversionRequest:v6 destination:v8 completionHandler:v7];
    }
    if (v11)
    {
      uint64_t v12 = [v6 progress];
      [v12 addChild:v11 withPendingUnitCount:1];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil progress for conversion request %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
    }
    [v6 setError:v10];
    [v6 setStatus:5];
    v7[2](v7);
  }
}

- (void)performConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = v14;
  if (!v14)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHMediaFormatConversionImplementation_MediaConversionService.m", 72, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    id v8 = 0;
  }
  if ([v8 isCompositeRequest])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PHMediaFormatConversionImplementation_MediaConversionService.m", 73, @"Invalid parameter not satisfying: %@", @"!request.isCompositeRequest" object file lineNumber description];

    if (v7) {
      goto LABEL_5;
    }
  }
  else if (v7)
  {
    goto LABEL_5;
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PHMediaFormatConversionImplementation_MediaConversionService.m", 74, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  char v9 = [v14 source];
  uint64_t v10 = [v9 mediaType];

  if (v10 == 1) {
    [(PHMediaFormatConversionImplementation_MediaConversionService *)self performVideoConversionRequest:v14 completionHandler:v7];
  }
  else {
    [(PHMediaFormatConversionImplementation_MediaConversionService *)self performImageConversionRequest:v14 completionHandler:v7];
  }
}

- (NSSet)ut_objectsToBeDeallocatedWithReceiver
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_videoConversionServiceClient, self->_imageConversionServiceClient, 0);
}

- (void)dealloc
{
  [(PAVideoConversionServiceClient *)self->_videoConversionServiceClient invalidateAfterPendingRequestCompletion];
  v3.receiver = self;
  v3.super_class = (Class)PHMediaFormatConversionImplementation_MediaConversionService;
  [(PHMediaFormatConversionImplementation_MediaConversionService *)&v3 dealloc];
}

- (PHMediaFormatConversionImplementation_MediaConversionService)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHMediaFormatConversionImplementation_MediaConversionService;
  v2 = [(PHMediaFormatConversionImplementation_MediaConversionService *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = (PAVideoConversionServiceClient *)v3;

    uint64_t v5 = objc_opt_new();
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = (PAImageConversionServiceClient *)v5;
  }
  return v2;
}

@end