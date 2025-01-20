@interface WFEncodeMediaAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSMutableArray)exportSessions;
- (id)metadataForAsset:(id)a3 newMetadata:(id)a4;
- (id)nonEmptyStringValueForKey:(id)a3;
- (void)cancel;
- (void)encodeItems:(id)a3 metadata:(id)a4;
- (void)finishRunningWithError:(id)a3;
- (void)getMetadataItems:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setExportSessions:(id)a3;
- (void)updateSpeedVisibility;
@end

@implementation WFEncodeMediaAction

- (void).cxx_destruct
{
}

- (void)setExportSessions:(id)a3
{
}

- (NSMutableArray)exportSessions
{
  return self->_exportSessions;
}

- (void)updateSpeedVisibility
{
  v3 = [(WFEncodeMediaAction *)self parameterStateForKey:@"WFMediaAudioFormat"];
  id v9 = [v3 value];

  v4 = [(WFEncodeMediaAction *)self parameterStateForKey:@"WFMediaAudioOnly"];
  v5 = [v4 number];
  int v6 = [v5 BOOLValue];

  if (v6) {
    uint64_t v7 = [v9 isEqualToString:@"M4A"] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(WFEncodeMediaAction *)self parameterForKey:@"WFMediaSpeed"];
  [v8 setHidden:v7];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFEncodeMediaAction;
  BOOL v7 = [(WFEncodeMediaAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7
    && (([v6 isEqualToString:@"WFMediaAudioOnly"] & 1) != 0
     || [v6 isEqualToString:@"WFMediaAudioFormat"]))
  {
    [(WFEncodeMediaAction *)self updateSpeedVisibility];
  }

  return v7;
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFEncodeMediaAction;
  [(WFEncodeMediaAction *)&v3 initializeParameters];
  [(WFEncodeMediaAction *)self updateSpeedVisibility];
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  [(WFEncodeMediaAction *)self setExportSessions:0];
  v5.receiver = self;
  v5.super_class = (Class)WFEncodeMediaAction;
  [(WFEncodeMediaAction *)&v5 finishRunningWithError:v4];
}

- (void)cancel
{
  objc_super v3 = [(WFEncodeMediaAction *)self exportSessions];
  [v3 makeObjectsPerformSelector:sel_cancelExport];

  v4.receiver = self;
  v4.super_class = (Class)WFEncodeMediaAction;
  [(WFEncodeMediaAction *)&v4 cancel];
}

- (void)encodeItems:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaAudioFormat" ofClass:objc_opt_class()];
  objc_super v9 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaAudioOnly" ofClass:objc_opt_class()];
  int v10 = [v9 BOOLValue];

  v11 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaSize" ofClass:objc_opt_class()];
  v12 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaSpeed" ofClass:objc_opt_class()];
  v13 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaCustomSpeed" ofClass:objc_opt_class()];
  [v13 floatValue];
  float v15 = v14;

  v16 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMediaPreserveTransparency" ofClass:objc_opt_class()];
  int v17 = [v16 BOOLValue];

  if (!v10) {
    goto LABEL_64;
  }
  if ([v8 isEqualToString:@"AIFF"])
  {
    v18 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1D950]];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke;
    v44[3] = &unk_264E5DBF0;
    v45 = v18;
    v46 = self;
    id v47 = v7;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_3;
    v43[3] = &unk_264E5E840;
    v43[4] = self;
    id v19 = v7;
    id v20 = v18;
    [v6 transformItemsUsingBlock:v44 completionHandler:v43];

    v21 = v45;
LABEL_51:

    return;
  }
  if (![v8 isEqualToString:@"M4A"])
  {
LABEL_64:
    if ([v11 isEqualToString:@"HEVC 1920x1080"])
    {
      if (v17)
      {
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr;
        uint64_t v56 = getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr)
        {
          uint64_t v48 = MEMORY[0x263EF8330];
          uint64_t v49 = 3221225472;
          v50 = __getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_block_invoke;
          v51 = &unk_264E5EC88;
          v52 = &v53;
          v26 = AVFoundationLibrary_52045();
          v54[3] = (uint64_t)dlsym(v26, "AVAssetExportPresetHEVC1920x1080WithAlpha");
          getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr = *(void *)(v52[1] + 24);
          v22 = (id *)v54[3];
        }
        _Block_object_dispose(&v53, 8);
        if (!v22)
        {
          v24 = [MEMORY[0x263F08690] currentHandler];
          v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetHEVC1920x1080WithAlpha(void)"];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 41, @"%s", dlerror());
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr;
        uint64_t v56 = getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr)
        {
          uint64_t v48 = MEMORY[0x263EF8330];
          uint64_t v49 = 3221225472;
          v50 = __getAVAssetExportPresetHEVC1920x1080SymbolLoc_block_invoke;
          v51 = &unk_264E5EC88;
          v52 = &v53;
          v28 = AVFoundationLibrary_52045();
          v54[3] = (uint64_t)dlsym(v28, "AVAssetExportPresetHEVC1920x1080");
          getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr = *(void *)(v52[1] + 24);
          v22 = (id *)v54[3];
        }
        _Block_object_dispose(&v53, 8);
        if (!v22)
        {
          v24 = [MEMORY[0x263F08690] currentHandler];
          v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetHEVC1920x1080(void)"];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 40, @"%s", dlerror());
          goto LABEL_61;
        }
      }
    }
    else if ([v11 isEqualToString:@"HEVC 3840x2160"])
    {
      if (v17)
      {
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr;
        uint64_t v56 = getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr)
        {
          uint64_t v48 = MEMORY[0x263EF8330];
          uint64_t v49 = 3221225472;
          v50 = __getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_block_invoke;
          v51 = &unk_264E5EC88;
          v52 = &v53;
          v27 = AVFoundationLibrary_52045();
          v54[3] = (uint64_t)dlsym(v27, "AVAssetExportPresetHEVC3840x2160WithAlpha");
          getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr = *(void *)(v52[1] + 24);
          v22 = (id *)v54[3];
        }
        _Block_object_dispose(&v53, 8);
        if (!v22)
        {
          v24 = [MEMORY[0x263F08690] currentHandler];
          v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetHEVC3840x2160WithAlpha(void)"];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 43, @"%s", dlerror());
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr;
        uint64_t v56 = getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr)
        {
          uint64_t v48 = MEMORY[0x263EF8330];
          uint64_t v49 = 3221225472;
          v50 = __getAVAssetExportPresetHEVC3840x2160SymbolLoc_block_invoke;
          v51 = &unk_264E5EC88;
          v52 = &v53;
          v30 = AVFoundationLibrary_52045();
          v54[3] = (uint64_t)dlsym(v30, "AVAssetExportPresetHEVC3840x2160");
          getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr = *(void *)(v52[1] + 24);
          v22 = (id *)v54[3];
        }
        _Block_object_dispose(&v53, 8);
        if (!v22)
        {
          v24 = [MEMORY[0x263F08690] currentHandler];
          v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetHEVC3840x2160(void)"];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 42, @"%s", dlerror());
          goto LABEL_61;
        }
      }
    }
    else if ([v11 isEqualToString:@"640x480"])
    {
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset640x480SymbolLoc_ptr;
      uint64_t v56 = getAVAssetExportPreset640x480SymbolLoc_ptr;
      if (!getAVAssetExportPreset640x480SymbolLoc_ptr)
      {
        uint64_t v48 = MEMORY[0x263EF8330];
        uint64_t v49 = 3221225472;
        v50 = __getAVAssetExportPreset640x480SymbolLoc_block_invoke;
        v51 = &unk_264E5EC88;
        v52 = &v53;
        v29 = AVFoundationLibrary_52045();
        v54[3] = (uint64_t)dlsym(v29, "AVAssetExportPreset640x480");
        getAVAssetExportPreset640x480SymbolLoc_ptr = *(void *)(v52[1] + 24);
        v22 = (id *)v54[3];
      }
      _Block_object_dispose(&v53, 8);
      if (!v22)
      {
        v24 = [MEMORY[0x263F08690] currentHandler];
        v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPreset640x480(void)"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 44, @"%s", dlerror());
        goto LABEL_61;
      }
    }
    else if ([v11 isEqualToString:@"960x540"])
    {
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset960x540SymbolLoc_ptr;
      uint64_t v56 = getAVAssetExportPreset960x540SymbolLoc_ptr;
      if (!getAVAssetExportPreset960x540SymbolLoc_ptr)
      {
        uint64_t v48 = MEMORY[0x263EF8330];
        uint64_t v49 = 3221225472;
        v50 = __getAVAssetExportPreset960x540SymbolLoc_block_invoke;
        v51 = &unk_264E5EC88;
        v52 = &v53;
        v31 = AVFoundationLibrary_52045();
        v54[3] = (uint64_t)dlsym(v31, "AVAssetExportPreset960x540");
        getAVAssetExportPreset960x540SymbolLoc_ptr = *(void *)(v52[1] + 24);
        v22 = (id *)v54[3];
      }
      _Block_object_dispose(&v53, 8);
      if (!v22)
      {
        v24 = [MEMORY[0x263F08690] currentHandler];
        v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPreset960x540(void)"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 45, @"%s", dlerror());
        goto LABEL_61;
      }
    }
    else
    {
      if (![v11 isEqualToString:@"1280x720"])
      {
        if ([v11 isEqualToString:@"1920x1080"])
        {
          getAVAssetExportPreset1920x1080();
          id v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if ([v11 isEqualToString:@"3840x2160"])
        {
          getAVAssetExportPreset3840x2160();
          id v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ([v11 isEqualToString:@"ProRes 422"]) {
            getAVAssetExportPresetAppleProRes422LPCM();
          }
          else {
            getAVAssetExportPresetPassthrough();
          }
          id v33 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_44:
        v34 = v33;
        double v35 = 0.5;
        if (([v12 isEqualToString:@"0.5X"] & 1) == 0)
        {
          double v35 = 1.0;
          if (([v12 isEqualToString:@"Normal"] & 1) == 0)
          {
            double v35 = 2.0;
            if (([v12 isEqualToString:@"2X"] & 1) == 0)
            {
              float v36 = fabsf(v15);
              if ([v12 isEqualToString:@"Custom"]) {
                double v35 = v36;
              }
              else {
                double v35 = 1.0;
              }
            }
          }
        }
        v37 = objc_opt_new();
        [(WFEncodeMediaAction *)self setExportSessions:v37];

        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_4;
        v39[3] = &unk_264E5DC88;
        double v42 = v35;
        v39[4] = self;
        v40 = v34;
        id v41 = v7;
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_8;
        v38[3] = &unk_264E5E840;
        v38[4] = self;
        id v20 = v7;
        id v19 = v34;
        [v6 transformItemsUsingBlock:v39 completionHandler:v38];

        v21 = v40;
        goto LABEL_51;
      }
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset1280x720SymbolLoc_ptr;
      uint64_t v56 = getAVAssetExportPreset1280x720SymbolLoc_ptr;
      if (!getAVAssetExportPreset1280x720SymbolLoc_ptr)
      {
        uint64_t v48 = MEMORY[0x263EF8330];
        uint64_t v49 = 3221225472;
        v50 = __getAVAssetExportPreset1280x720SymbolLoc_block_invoke;
        v51 = &unk_264E5EC88;
        v52 = &v53;
        v32 = AVFoundationLibrary_52045();
        v54[3] = (uint64_t)dlsym(v32, "AVAssetExportPreset1280x720");
        getAVAssetExportPreset1280x720SymbolLoc_ptr = *(void *)(v52[1] + 24);
        v22 = (id *)v54[3];
      }
      _Block_object_dispose(&v53, 8);
      if (!v22)
      {
        v24 = [MEMORY[0x263F08690] currentHandler];
        v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPreset1280x720(void)"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 46, @"%s", dlerror());
        goto LABEL_61;
      }
    }
LABEL_43:
    id v33 = *v22;
    goto LABEL_44;
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  v22 = (id *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
  uint64_t v56 = getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
  if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr)
  {
    uint64_t v48 = MEMORY[0x263EF8330];
    uint64_t v49 = 3221225472;
    v50 = __getAVAssetExportPresetAppleM4ASymbolLoc_block_invoke;
    v51 = &unk_264E5EC88;
    v52 = &v53;
    v23 = AVFoundationLibrary_52045();
    v54[3] = (uint64_t)dlsym(v23, "AVAssetExportPresetAppleM4A");
    getAVAssetExportPresetAppleM4ASymbolLoc_ptr = *(void *)(v52[1] + 24);
    v22 = (id *)v54[3];
  }
  _Block_object_dispose(&v53, 8);
  if (v22) {
    goto LABEL_43;
  }
  v24 = [MEMORY[0x263F08690] currentHandler];
  v25 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetAppleM4A(void)"];
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFEncodeMediaAction.m", 39, @"%s", dlerror());
LABEL_61:

  __break(1u);
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_2;
  v12[3] = &unk_264E5DBC8;
  id v13 = v5;
  uint64_t v6 = a1[4];
  id v7 = (void *)a1[5];
  id v8 = v5;
  id v9 = a2;
  int v10 = [v9 asset];
  v11 = [v7 metadataForAsset:v10 newMetadata:a1[6]];
  [v9 generateFileRepresentation:v12 forType:v6 metadata:v11 options:MEMORY[0x263EFFA78]];
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_5;
  v12[3] = &unk_264E5DC60;
  id v7 = v6;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v15 = v7;
  void v12[4] = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 48);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  int v10 = (void *)getAVAssetClass_softClass;
  uint64_t v21 = getAVAssetClass_softClass;
  if (!getAVAssetClass_softClass)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __getAVAssetClass_block_invoke;
    v17[3] = &unk_264E5EC88;
    v17[4] = &v18;
    __getAVAssetClass_block_invoke((uint64_t)v17);
    int v10 = (void *)v19[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v18, 8);
  [v5 getObjectRepresentation:v12 forClass:v11];
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v18)(void *__return_ptr, long long *, double);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id obj;
  void *v62;
  void v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  long long v69;
  _OWORD v70[2];
  long long v71;
  void *v72;
  void v73[3];
  _OWORD v74[3];
  id v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  uint64_t v80;
  _OWORD v81[3];
  _OWORD v82[3];
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  long long v89;
  long long v90;
  void *v91;
  void *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  void *v97;
  unsigned char v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x263EF8340];
  v60 = a2;
  v59 = a3;
  v58 = a4;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2050000000;
  id v6 = (void *)getAVMutableCompositionClass_softClass;
  v97 = (void *)getAVMutableCompositionClass_softClass;
  if (!getAVMutableCompositionClass_softClass)
  {
    *(void *)&v90 = MEMORY[0x263EF8330];
    *((void *)&v90 + 1) = 3221225472;
    v91 = __getAVMutableCompositionClass_block_invoke;
    v92 = &unk_264E5EC88;
    v93 = &v94;
    __getAVMutableCompositionClass_block_invoke((uint64_t)&v90);
    id v6 = (void *)v95[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v94, 8);
  v62 = [v7 composition];
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = [v60 tracks];
  uint64_t v8 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v87;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v87 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        v12 = [v11 mediaType];
        id v13 = [v62 addMutableTrackWithMediaType:v12 preferredTrackID:0];

        objc_msgSend(v13, "setNaturalTimeScale:", objc_msgSend(v11, "naturalTimeScale"));
        [v11 preferredVolume];
        objc_msgSend(v13, "setPreferredVolume:");
        if (v11)
        {
          [v11 preferredTransform];
        }
        else
        {
          v84 = 0u;
          v85 = 0u;
          v83 = 0u;
        }
        v82[0] = v83;
        v82[1] = v84;
        v82[2] = v85;
        [v13 setPreferredTransform:v82];
        id v14 = [v11 languageCode];
        [v13 setLanguageCode:v14];

        id v15 = [v11 extendedLanguageTag];
        [v13 setExtendedLanguageTag:v15];

        if (v11)
        {
          [v11 timeRange];
          [v11 timeRange];
        }
        else
        {
          memset(v81, 0, sizeof(v81));
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
        }
        v79 = v76;
        v80 = v77;
        v75 = 0;
        [v13 insertTimeRange:v81 ofTrack:v11 atTime:&v79 error:&v75];
        id v16 = v75;
        if (v16)
        {
          v51 = v16;
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          goto LABEL_41;
        }
        if (v11)
        {
          [v11 timeRange];
          [v11 timeRange];
        }
        else
        {
          memset(v74, 0, sizeof(v74));
          v69 = 0u;
          memset(v70, 0, sizeof(v70));
        }
        v71 = *(_OWORD *)((char *)v70 + 8);
        v72 = (void *)*((void *)&v70[1] + 1);
        double v17 = *(double *)(a1 + 64);
        v94 = 0;
        v95 = &v94;
        v96 = 0x2020000000;
        uint64_t v18 = (void (*)(void *__return_ptr, long long *, double))getCMTimeMultiplyByFloat64SymbolLoc_ptr;
        v97 = getCMTimeMultiplyByFloat64SymbolLoc_ptr;
        if (!getCMTimeMultiplyByFloat64SymbolLoc_ptr)
        {
          *(void *)&v90 = MEMORY[0x263EF8330];
          *((void *)&v90 + 1) = 3221225472;
          v91 = __getCMTimeMultiplyByFloat64SymbolLoc_block_invoke;
          v92 = &unk_264E5EC88;
          v93 = &v94;
          id v19 = CoreMediaLibrary();
          uint64_t v20 = dlsym(v19, "CMTimeMultiplyByFloat64");
          *(void *)(v93[1] + 24) = v20;
          getCMTimeMultiplyByFloat64SymbolLoc_ptr = *(_UNKNOWN **)(v93[1] + 24);
          uint64_t v18 = (void (*)(void *__return_ptr, long long *, double))v95[3];
        }
        _Block_object_dispose(&v94, 8);
        if (!v18)
        {
          v52 = [MEMORY[0x263F08690] currentHandler];
          uint64_t v53 = objc_msgSend(NSString, "stringWithUTF8String:", "CMTime soft_CMTimeMultiplyByFloat64(CMTime, Float64)");
          objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"WFEncodeMediaAction.m", 18, @"%s", dlerror(), v58);

          goto LABEL_43;
        }
        v90 = v71;
        v91 = v72;
        v18(v73, &v90, 1.0 / v17);
        [v13 scaleTimeRange:v74 toDuration:v73];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if ([*(id *)(a1 + 32) isRunning])
  {
    v94 = 0;
    v95 = &v94;
    v96 = 0x2050000000;
    uint64_t v21 = (void *)getAVAssetExportSessionClass_softClass;
    v97 = (void *)getAVAssetExportSessionClass_softClass;
    if (!getAVAssetExportSessionClass_softClass)
    {
      *(void *)&v90 = MEMORY[0x263EF8330];
      *((void *)&v90 + 1) = 3221225472;
      v91 = __getAVAssetExportSessionClass_block_invoke;
      v92 = &unk_264E5EC88;
      v93 = &v94;
      __getAVAssetExportSessionClass_block_invoke((uint64_t)&v90);
      uint64_t v21 = (void *)v95[3];
    }
    v22 = v21;
    _Block_object_dispose(&v94, 8);
    v23 = [v22 exportSessionWithAsset:v62 presetName:*(void *)(a1 + 40)];
    v24 = [v23 supportedFileTypes];
    v25 = (void *)MEMORY[0x263F852B8];
    v26 = [v24 firstObject];
    v27 = [v25 typeWithString:v26];

    v94 = 0;
    v95 = &v94;
    v96 = 0x2020000000;
    v28 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_52077;
    v97 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_52077;
    if (!getAVMediaTypeVideoSymbolLoc_ptr_52077)
    {
      *(void *)&v90 = MEMORY[0x263EF8330];
      *((void *)&v90 + 1) = 3221225472;
      v91 = __getAVMediaTypeVideoSymbolLoc_block_invoke_52078;
      v92 = &unk_264E5EC88;
      v93 = &v94;
      v29 = AVFoundationLibrary_52045();
      v30 = dlsym(v29, "AVMediaTypeVideo");
      *(void *)(v93[1] + 24) = v30;
      getAVMediaTypeVideoSymbolLoc_ptr_52077 = *(void *)(v93[1] + 24);
      v28 = (void *)v95[3];
    }
    _Block_object_dispose(&v94, 8);
    if (!v28) {
      goto LABEL_44;
    }
    v31 = [v60 tracksWithMediaType:*v28];
    v32 = [v31 count];

    v94 = 0;
    v95 = &v94;
    v96 = 0x2020000000;
    id v33 = (void *)getAVMediaTypeAudioSymbolLoc_ptr;
    v97 = (void *)getAVMediaTypeAudioSymbolLoc_ptr;
    if (!getAVMediaTypeAudioSymbolLoc_ptr)
    {
      *(void *)&v90 = MEMORY[0x263EF8330];
      *((void *)&v90 + 1) = 3221225472;
      v91 = __getAVMediaTypeAudioSymbolLoc_block_invoke;
      v92 = &unk_264E5EC88;
      v93 = &v94;
      v34 = AVFoundationLibrary_52045();
      double v35 = dlsym(v34, "AVMediaTypeAudio");
      *(void *)(v93[1] + 24) = v35;
      getAVMediaTypeAudioSymbolLoc_ptr = *(void *)(v93[1] + 24);
      id v33 = (void *)v95[3];
    }
    _Block_object_dispose(&v94, 8);
    if (!v33)
    {
      uint64_t v56 = [MEMORY[0x263F08690] currentHandler];
      v57 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeAudio(void)"];
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"WFEncodeMediaAction.m", 52, @"%s", dlerror(), v58);

      while (1)
      {
LABEL_43:
        __break(1u);
LABEL_44:
        v54 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v55 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
        objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"WFEncodeMediaAction.m", 51, @"%s", dlerror());
      }
    }
    float v36 = [v60 tracksWithMediaType:*v33];
    v37 = [v36 count] != 0;

    if (v37 && v32 == 0)
    {
      v38 = [MEMORY[0x263F852B8] typesFromStrings:v24];
      v39 = objc_msgSend(v38, "if_objectsPassingTest:", &__block_literal_global_52082);

      if ([v39 count])
      {
        v40 = [v39 firstObject];

        v27 = (void *)v40;
      }
    }
    id v41 = (void *)MEMORY[0x263F339A0];
    double v42 = [MEMORY[0x263F33870] proposedFilenameForFile:v59 ofType:v27];
    v43 = [v41 proposedTemporaryFileURLForFilename:v42];

    [v23 setOutputURL:v43];
    v44 = [v27 string];
    [v23 setOutputFileType:v44];

    v45 = [*(id *)(a1 + 32) metadataForAsset:v60 newMetadata:*(void *)(a1 + 48)];
    if (v45) {
      [v23 setMetadata:v45];
    }
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_7;
    v64[3] = &unk_264E5DC38;
    v65 = v23;
    v46 = *(id *)(a1 + 56);
    v67 = v27;
    v68 = v46;
    v66 = v43;
    id v47 = v27;
    uint64_t v48 = v43;
    uint64_t v49 = v23;
    [v49 exportAsynchronouslyWithCompletionHandler:v64];
    v50 = [*(id *)(a1 + 32) exportSessions];
    [v50 addObject:v49];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_41:
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_7(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] == 3)
  {
    uint64_t v2 = [MEMORY[0x263F33870] fileWithURL:*(void *)(a1 + 40) options:1 ofType:*(void *)(a1 + 48)];
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    id v6 = (id)v2;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 32) error];
    objc_super v3 = *(void (**)(void))(v4 + 16);
    id v6 = (id)v5;
  }
  v3();
}

uint64_t __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 conformsToUTType:*MEMORY[0x263F1D9B8]];
}

uint64_t __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)metadataForAsset:(id)a3 newMetadata:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = v5;
  if (v6)
  {
    uint64_t v20 = v6;
    v23 = [v5 metadata];
    id v7 = (void *)[v23 mutableCopy];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v20;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v12 = [v11 identifier];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v33 = 0;
          v34 = &v33;
          uint64_t v35 = 0x2050000000;
          id v13 = (void *)getAVMetadataItemClass_softClass;
          uint64_t v36 = getAVMetadataItemClass_softClass;
          if (!getAVMetadataItemClass_softClass)
          {
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __getAVMetadataItemClass_block_invoke;
            v32[3] = &unk_264E5EC88;
            v32[4] = &v33;
            __getAVMetadataItemClass_block_invoke((uint64_t)v32);
            id v13 = (void *)v34[3];
          }
          id v14 = v13;
          _Block_object_dispose(&v33, 8);
          id v15 = [v14 metadataItemsFromArray:v23 filteredByIdentifier:v12];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v15);
                }
                [v7 removeObject:*(void *)(*((void *)&v24 + 1) + 8 * j)];
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
            }
            while (v16);
          }

          [v7 addObject:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v8);
    }

    id v6 = v20;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [v6 numberOfItems];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_264E5E238;
    v10[4] = v9;
    id v11 = v6;
    [v9 getMetadataItems:v10];
  }
  else
  {
    [v9 finishRunningWithError:v7];
  }
}

uint64_t __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeItems:*(void *)(a1 + 40) metadata:a2];
}

- (void)getMetadataItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFEncodeMediaAction *)self nonEmptyStringValueForKey:@"WFMetadataTitle"];
  id v6 = [(WFEncodeMediaAction *)self nonEmptyStringValueForKey:@"WFMetadataArtist"];
  id v7 = [(WFEncodeMediaAction *)self nonEmptyStringValueForKey:@"WFMetadataAlbum"];
  uint64_t v8 = [(WFEncodeMediaAction *)self nonEmptyStringValueForKey:@"WFMetadataGenre"];
  uint64_t v9 = [(WFEncodeMediaAction *)self nonEmptyStringValueForKey:@"WFMetadataYear"];
  int v10 = [(WFEncodeMediaAction *)self parameterValueForKey:@"WFMetadataArtwork" ofClass:objc_opt_class()];
  id v11 = objc_opt_new();
  if (v5)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    v12 = (id *)getAVMetadataCommonIdentifierTitleSymbolLoc_ptr;
    uint64_t v47 = getAVMetadataCommonIdentifierTitleSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierTitleSymbolLoc_ptr)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __getAVMetadataCommonIdentifierTitleSymbolLoc_block_invoke;
      double v42 = &unk_264E5EC88;
      v43 = &v44;
      id v13 = AVFoundationLibrary_52045();
      v45[3] = (uint64_t)dlsym(v13, "AVMetadataCommonIdentifierTitle");
      getAVMetadataCommonIdentifierTitleSymbolLoc_ptr = *(void *)(v43[1] + 24);
      v12 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (!v12)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataCommonIdentifierTitle(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFEncodeMediaAction.m", 33, @"%s", dlerror());
      goto LABEL_38;
    }
    id v14 = *v12;
    id v15 = WFMakeMetadataItem(v14, v5);
    [v11 addObject:v15];
  }
  if (v6)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v16 = (id *)getAVMetadataCommonIdentifierArtistSymbolLoc_ptr;
    uint64_t v47 = getAVMetadataCommonIdentifierArtistSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierArtistSymbolLoc_ptr)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __getAVMetadataCommonIdentifierArtistSymbolLoc_block_invoke;
      double v42 = &unk_264E5EC88;
      v43 = &v44;
      uint64_t v17 = AVFoundationLibrary_52045();
      v45[3] = (uint64_t)dlsym(v17, "AVMetadataCommonIdentifierArtist");
      getAVMetadataCommonIdentifierArtistSymbolLoc_ptr = *(void *)(v43[1] + 24);
      uint64_t v16 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (!v16)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataCommonIdentifierArtist(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFEncodeMediaAction.m", 34, @"%s", dlerror());
      goto LABEL_38;
    }
    id v18 = *v16;
    id v19 = WFMakeMetadataItem(v18, v6);
    [v11 addObject:v19];
  }
  if (v7)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v20 = (id *)getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr;
    uint64_t v47 = getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __getAVMetadataCommonIdentifierAlbumNameSymbolLoc_block_invoke;
      double v42 = &unk_264E5EC88;
      v43 = &v44;
      uint64_t v21 = AVFoundationLibrary_52045();
      v45[3] = (uint64_t)dlsym(v21, "AVMetadataCommonIdentifierAlbumName");
      getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr = *(void *)(v43[1] + 24);
      uint64_t v20 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (!v20)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataCommonIdentifierAlbumName(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFEncodeMediaAction.m", 35, @"%s", dlerror());
      goto LABEL_38;
    }
    id v22 = *v20;
    v23 = WFMakeMetadataItem(v22, v7);
    [v11 addObject:v23];
  }
  if (v8)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    long long v24 = (id *)getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr;
    uint64_t v47 = getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr;
    if (!getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_block_invoke;
      double v42 = &unk_264E5EC88;
      v43 = &v44;
      long long v25 = AVFoundationLibrary_52045();
      v45[3] = (uint64_t)dlsym(v25, "AVMetadataIdentifierQuickTimeMetadataGenre");
      getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr = *(void *)(v43[1] + 24);
      long long v24 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (!v24)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataIdentifierQuickTimeMetadataGenre(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFEncodeMediaAction.m", 37, @"%s", dlerror());
      goto LABEL_38;
    }
    id v26 = *v24;
    long long v27 = WFMakeMetadataItem(v26, v8);
    [v11 addObject:v27];
  }
  if (v9)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    long long v28 = (id *)getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr;
    uint64_t v47 = getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr;
    if (!getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr)
    {
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      id v41 = __getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_block_invoke;
      double v42 = &unk_264E5EC88;
      v43 = &v44;
      long long v29 = AVFoundationLibrary_52045();
      v45[3] = (uint64_t)dlsym(v29, "AVMetadataIdentifierQuickTimeMetadataYear");
      getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr = *(void *)(v43[1] + 24);
      long long v28 = (id *)v45[3];
    }
    _Block_object_dispose(&v44, 8);
    if (v28)
    {
      id v30 = *v28;
      long long v31 = WFMakeMetadataItem(v30, v9);
      [v11 addObject:v31];

      goto LABEL_26;
    }
    v34 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v35 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataIdentifierQuickTimeMetadataYear(void)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFEncodeMediaAction.m", 38, @"%s", dlerror());
LABEL_38:

    __break(1u);
    return;
  }
LABEL_26:
  if ([v10 numberOfItems])
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __40__WFEncodeMediaAction_getMetadataItems___block_invoke;
    v36[3] = &unk_264E5E098;
    id v38 = v4;
    id v37 = v11;
    v32 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
    [v10 getFileRepresentation:v36 forType:v32];
  }
  else
  {
    if ([v11 count]) {
      uint64_t v33 = v11;
    }
    else {
      uint64_t v33 = 0;
    }
    (*((void (**)(id, void *))v4 + 2))(v4, v33);
  }
}

void __40__WFEncodeMediaAction_getMetadataItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_32;
  }
  id v7 = [getAVMutableMetadataItemClass() metadataItem];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v8 = (void *)getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr;
  uint64_t v36 = getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr;
  if (!getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr)
  {
    uint64_t v9 = AVFoundationLibrary_52045();
    v34[3] = (uint64_t)dlsym(v9, "AVMetadataCommonIdentifierArtwork");
    getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr = v34[3];
    uint64_t v8 = (void *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v8)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = [NSString stringWithUTF8String:"AVMetadataIdentifier getAVMetadataCommonIdentifierArtwork(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFEncodeMediaAction.m", 36, @"%s", dlerror());
    goto LABEL_34;
  }
  [v7 setIdentifier:*v8];
  int v10 = [v5 wfType];
  int v11 = [v10 conformsToUTType:*MEMORY[0x263F1DAD0]];

  if (v11)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    v12 = (void *)getkCMMetadataBaseDataType_GIFSymbolLoc_ptr;
    uint64_t v36 = getkCMMetadataBaseDataType_GIFSymbolLoc_ptr;
    if (!getkCMMetadataBaseDataType_GIFSymbolLoc_ptr)
    {
      id v13 = CoreMediaLibrary();
      v34[3] = (uint64_t)dlsym(v13, "kCMMetadataBaseDataType_GIF");
      getkCMMetadataBaseDataType_GIFSymbolLoc_ptr = v34[3];
      v12 = (void *)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v12)
    {
      id v14 = [MEMORY[0x263F08690] currentHandler];
      id v15 = [NSString stringWithUTF8String:"CFStringRef getkCMMetadataBaseDataType_GIF(void)"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFEncodeMediaAction.m", 20, @"%s", dlerror());
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  uint64_t v16 = [v5 wfType];
  int v17 = [v16 conformsToUTType:*MEMORY[0x263F1DB40]];

  if (!v17)
  {
    id v19 = [v5 wfType];
    int v20 = [v19 conformsToUTType:*MEMORY[0x263F1DC08]];

    if (!v20)
    {
      id v22 = [v5 wfType];
      int v23 = [v22 conformsToUTType:*MEMORY[0x263F1D9C8]];

      if (!v23) {
        goto LABEL_26;
      }
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      v12 = (void *)getkCMMetadataBaseDataType_BMPSymbolLoc_ptr;
      uint64_t v36 = getkCMMetadataBaseDataType_BMPSymbolLoc_ptr;
      if (!getkCMMetadataBaseDataType_BMPSymbolLoc_ptr)
      {
        long long v24 = CoreMediaLibrary();
        v34[3] = (uint64_t)dlsym(v24, "kCMMetadataBaseDataType_BMP");
        getkCMMetadataBaseDataType_BMPSymbolLoc_ptr = v34[3];
        v12 = (void *)v34[3];
      }
      _Block_object_dispose(&v33, 8);
      if (!v12) {
        goto LABEL_35;
      }
      goto LABEL_25;
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    v12 = (void *)getkCMMetadataBaseDataType_PNGSymbolLoc_ptr;
    uint64_t v36 = getkCMMetadataBaseDataType_PNGSymbolLoc_ptr;
    if (!getkCMMetadataBaseDataType_PNGSymbolLoc_ptr)
    {
      uint64_t v21 = CoreMediaLibrary();
      v34[3] = (uint64_t)dlsym(v21, "kCMMetadataBaseDataType_PNG");
      getkCMMetadataBaseDataType_PNGSymbolLoc_ptr = v34[3];
      v12 = (void *)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (v12) {
      goto LABEL_25;
    }
    id v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = [NSString stringWithUTF8String:"CFStringRef getkCMMetadataBaseDataType_PNG(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFEncodeMediaAction.m", 22, @"%s", dlerror());
    while (1)
    {
LABEL_34:

      __break(1u);
LABEL_35:
      id v14 = [MEMORY[0x263F08690] currentHandler];
      id v15 = [NSString stringWithUTF8String:"CFStringRef getkCMMetadataBaseDataType_BMP(void)"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFEncodeMediaAction.m", 23, @"%s", dlerror());
    }
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  v12 = (void *)getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr;
  uint64_t v36 = getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr;
  if (!getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr)
  {
    id v18 = CoreMediaLibrary();
    v34[3] = (uint64_t)dlsym(v18, "kCMMetadataBaseDataType_JPEG");
    getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr = v34[3];
    v12 = (void *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v12)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = [NSString stringWithUTF8String:"CFStringRef getkCMMetadataBaseDataType_JPEG(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFEncodeMediaAction.m", 21, @"%s", dlerror());
    goto LABEL_34;
  }
LABEL_25:
  [v7 setDataType:*v12];
LABEL_26:
  WFImageSizeFromFile();
  double v26 = v25;
  double v28 = v27;
  if ([v5 fileSize] > 0x20000 && (v26 > 1400.0 || v28 > 1400.0))
  {
    id v30 = v7;
    id v31 = *(id *)(a1 + 32);
    id v32 = *(id *)(a1 + 40);
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    long long v29 = [v5 data];
    [v7 setValue:v29];

    [*(id *)(a1 + 32) addObject:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_32:
}

uint64_t __40__WFEncodeMediaAction_getMetadataItems___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_super v3 = [a2 data];
    [*(id *)(a1 + 32) setValue:v3];

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (id)nonEmptyStringValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEncodeMediaAction *)self parameterValueForKey:v4 ofClass:objc_opt_class()];

  if ([v5 length]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end