@interface WFAVAssetContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (AVAsset)asset;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (CLLocation)location;
- (WFFileType)preferredFileType;
- (id)duration;
- (id)frameRate;
- (id)generateExportSessionForType:(id)a3;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)metadataItemForCommonKey:(id)a3;
- (id)supportedTypes;
- (void)generateFileRepresentation:(id)a3 forType:(id)a4 metadata:(id)a5 options:(id)a6;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getPreferredFileSize:(id)a3;
@end

@implementation WFAVAssetContentItem

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFAVAssetContentItem *)self metadataItemForCommonKey:@"artwork"];
    unsigned __int8 v6 = v5 != 0;
  }
  else if (([v4 isEqualToUTType:*MEMORY[0x263F1D9C0]] & 1) != 0 {
         || ([v4 isEqualToUTType:*MEMORY[0x263F1D9B8]] & 1) != 0
  }
         || ([v4 isEqualToUTType:*MEMORY[0x263F1DD58]] & 1) != 0)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFAVAssetContentItem;
    unsigned __int8 v6 = [(WFGenericFileContentItem *)&v8 canGenerateRepresentationForType:v4];
  }

  return v6;
}

- (id)supportedTypes
{
  v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x263F852B8];
  v5 = [(WFAVAssetContentItem *)self generateExportSessionForType:0];
  unsigned __int8 v6 = [v5 supportedFileTypes];
  v7 = [v4 typesFromStrings:v6];
  [v3 addObjectsFromArray:v7];

  objc_super v8 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856A8]];
  LODWORD(v5) = [v3 containsObject:v8];

  if (v5)
  {
    v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB80]];
    [v3 addObject:v9];

    v10 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1D950]];
    [v3 addObject:v10];
  }
  v11 = +[WFObjectType typeWithClass:getAVAssetClass()];
  [v3 addObject:v11];

  v12 = +[WFObjectType typeWithClass:getAVMutableMovieClass()];
  [v3 addObject:v12];

  v13 = [(WFAVAssetContentItem *)self metadataItemForCommonKey:@"artwork"];

  if (v13)
  {
    v14 = +[WFObjectType typeWithClass:objc_opt_class()];
    [v3 addObject:v14];
  }
  v15 = +[WFObjectType typeWithClass:objc_opt_class()];
  [v3 addObject:v15];

  return v3;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v7 = NSStringFromClass(a3);
  int v8 = [@"AVAsset" isEqualToString:v7];

  if (v8)
  {
    v9 = [(WFContentItem *)self internalRepresentationType];
    v10 = [(WFContentItem *)self fileRepresentationForType:v9];

    if (v10)
    {
      v11 = [v10 fileURL];
      v12 = NSURL;
      v13 = NSHomeDirectory();
      v14 = [v12 fileURLWithPath:v13 isDirectory:1];
      if (objc_msgSend(v11, "wf_isContainedByDirectoryAtURL:", v14))
      {
      }
      else
      {
        v20 = [v10 fileURL];
        v21 = +[WFTemporaryFileManager sharedAppGroupDirectoryURL];
        char v22 = objc_msgSend(v20, "wf_isContainedByDirectoryAtURL:", v21);

        if ((v22 & 1) == 0)
        {
          uint64_t v23 = [v10 copy];

          uint64_t v31 = v23;
          v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
          v25 = [(WFContentItem *)self internalRepresentationType];
          [(WFContentItem *)self setFileRepresentations:v24 forType:v25];

          v10 = v23;
        }
      }
      id AVURLAssetClass_9736 = getAVURLAssetClass_9736();
      v27 = [v10 fileURL];
      v28 = [AVURLAssetClass_9736 assetWithURL:v27];

      v29 = [v10 wfName];
      v15 = +[WFObjectRepresentation object:v28 named:v29];
    }
    else
    {
      v10 = getWFContentItemLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFAVAssetContentItem generateObjectRepresentationForClass:options:error:]";
        _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_FAULT, "%s Failed to generate AVAsset repersentation; fileRepresentationForType: returned nil",
          buf,
          0xCu);
      }
      v15 = 0;
    }
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v15 = 0;
      goto LABEL_21;
    }
    v10 = [(WFAVAssetContentItem *)self metadataItemForCommonKey:@"artwork"];
    v16 = [v10 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v16 objectForKey:@"data"];
      v18 = [MEMORY[0x263F85308] imageWithData:v17];
      if (v18)
      {
        v19 = [(WFContentItem *)self name];
        v15 = +[WFObjectRepresentation object:v18 named:v19];
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
LABEL_21:
  return v15;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = a3;
  if ([(objc_class *)a5 isSubclassOfClass:getAVMutableMovieClass()])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__WFAVAssetContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v9[3] = &unk_264287920;
    Class v11 = a5;
    v9[4] = self;
    id v10 = v7;
    [(WFContentItem *)self getFileRepresentation:v9 forType:0];
  }
  else
  {
    int v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v8);
  }
}

void __70__WFAVAssetContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id AVMutableMovieClass = getAVMutableMovieClass();
    int v8 = [v5 fileURL];
    v9 = [AVMutableMovieClass assetWithURL:v8];

    uint64_t v10 = *(void *)(a1 + 40);
    Class v11 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, void *, void *, void))(v10 + 16))(v10, v9, v11, 0);
  }
  else
  {
    v12 = getWFContentItemLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(*(Class *)(a1 + 48));
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v14 = [v6 localizedDescription];
      }
      else
      {
        v14 = @"couldn't generate an asset file";
      }
      int v15 = 136315650;
      v16 = "-[WFAVAssetContentItem generateObjectRepresentation:options:forClass:]_block_invoke";
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_216505000, v12, OS_LOG_TYPE_FAULT, "%s Failed to generate %{public}@ representation: %{public}@", (uint8_t *)&v15, 0x20u);
      if (v6) {
    }
      }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)generateFileRepresentation:(id)a3 forType:(id)a4 metadata:(id)a5 options:(id)a6
{
  void (*v87)(uint64_t *__return_ptr, void, uint64_t);
  void *v88;
  void *v89;
  void *v90;
  void **v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  BOOL v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  char v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  id v132;
  uint64_t v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void (**v139)(id, void *, void);
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void (**v146)(id, void *, void);
  id v147;
  void v148[4];
  id v149;
  id v150;
  id v151;
  WFAVAssetContentItem *v152;
  void (**v153)(id, void *, void);
  void v154[4];
  id v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void **v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void (**v168)(id, void *, void);
  id v169;
  id v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void v176[7];
  id v177;
  void *v178;
  void **v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;

  v186 = *MEMORY[0x263EF8340];
  v146 = (void (**)(id, void *, void))a3;
  id v10 = a4;
  v147 = a5;
  v141 = v10;
  v142 = a6;
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [(WFAVAssetContentItem *)self preferredFileType];
  }
  v12 = v11;
  v144 = v11;
  if ([v11 conformsToUTType:*MEMORY[0x263F1DB80]])
  {
    id v13 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856A8]];
  }
  else
  {
    id v13 = v12;
  }
  v14 = v13;
  int v15 = [(WFContentItem *)self name];
  v16 = +[WFFileRepresentation proposedFilenameForFile:v15 ofType:v14];
  v145 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v16];

  __int16 v17 = [(WFAVAssetContentItem *)self asset];
  if (v17)
  {
    getAVURLAssetClass_9736();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v19 = v18;

  v143 = v19;
  v20 = [v19 URL];
  uint64_t v21 = [v20 wfFileType];
  int v22 = [v14 isEqualToType:v21];

  if (v22 && ![v147 count])
  {
    v101 = [MEMORY[0x263F08850] defaultManager];
    v102 = [v143 URL];
    v156 = 0;
    v103 = [v101 copyItemAtURL:v102 toURL:v145 error:&v156];
    v104 = v156;

    if (v103)
    {
      v105 = +[WFFileRepresentation fileWithURL:v145 options:1 ofType:v144];
      v175 = v105;
      v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v175 count:1];
      [(WFContentItem *)self setFileRepresentations:v106 forType:v144];

      v146[2](v146, v105, 0);
    }
    else
    {
      ((void (**)(id, void *, id))v146)[2](v146, 0, v104);
    }
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263F1D950];
    v24 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1D950]];
    int v25 = [v14 conformsToType:v24];

    if (v25)
    {
      v26 = [(WFAVAssetContentItem *)self asset];
      v27 = [(WFContentItem *)self name];
      id v28 = v26;
      id v29 = v27;
      v136 = v147;
      v139 = v146;
      v178 = 0;
      v179 = &v178;
      v180 = 0x2050000000;
      v30 = (void *)getAVAssetReaderClass_softClass;
      v181 = getAVAssetReaderClass_softClass;
      if (!getAVAssetReaderClass_softClass)
      {
        v157 = MEMORY[0x263EF8330];
        v158 = 3221225472;
        v159 = __getAVAssetReaderClass_block_invoke;
        v160 = &unk_26428AC60;
        v161 = &v178;
        __getAVAssetReaderClass_block_invoke((uint64_t)&v157);
        v30 = v179[3];
      }
      id v31 = v30;
      _Block_object_dispose(&v178, 8);
      v170 = 0;
      v137 = [v31 assetReaderWithAsset:v28 error:&v170];
      v138 = v170;
      v32 = getAVMediaTypeAudio();
      v33 = [v28 tracksWithMediaType:v32];
      v140 = [v33 firstObject];

      if (v140
        && ([v140 formatDescriptions],
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            BOOL v35 = [v34 count] == 1,
            v34,
            v35))
      {
        v36 = malloc_type_calloc(0x20uLL, 1uLL, 0x8367510AuLL);
        _DWORD *v36 = 6619138;
        v178 = 0;
        v179 = &v178;
        v180 = 0x2020000000;
        v37 = (id *)getAVFormatIDKeySymbolLoc_ptr;
        v181 = getAVFormatIDKeySymbolLoc_ptr;
        if (!getAVFormatIDKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVFormatIDKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = &v178;
          v38 = AVFoundationLibrary_4612();
          v39 = dlsym(v38, "AVFormatIDKey");
          *((void *)v161[1] + 3) = v39;
          getAVFormatIDKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v37 = (id *)v179[3];
        }
        _Block_object_dispose(&v178, 8);
        if (!v37)
        {
          v107 = [MEMORY[0x263F08690] currentHandler];
          v108 = [NSString stringWithUTF8String:"NSString *getAVFormatIDKey(void)"];
          objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, @"WFAudioInterchangeFormatEncoder.m", 25, @"%s", dlerror());

          goto LABEL_87;
        }
        v130 = *v37;
        v176[0] = v130;
        v178 = &unk_26C741CC8;
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v40 = (id *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
        v174 = (void *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
        if (!getAVLinearPCMIsFloatKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVLinearPCMIsFloatKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v41 = AVFoundationLibrary_4612();
          v42 = dlsym(v41, "AVLinearPCMIsFloatKey");
          *((void *)v161[1] + 3) = v42;
          getAVLinearPCMIsFloatKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v40 = (id *)v172[3];
        }
        v132 = v29;
        v133 = v23;
        _Block_object_dispose(&v171, 8);
        if (!v40)
        {
          v109 = [MEMORY[0x263F08690] currentHandler];
          v110 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMIsFloatKey(void)"];
          objc_msgSend(v109, "handleFailureInFunction:file:lineNumber:description:", v110, @"WFAudioInterchangeFormatEncoder.m", 26, @"%s", dlerror());

          goto LABEL_87;
        }
        id v43 = *v40;
        v176[1] = v43;
        uint64_t v44 = MEMORY[0x263EFFA80];
        v179 = (void **)MEMORY[0x263EFFA80];
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v45 = (id *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
        v174 = (void *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
        if (!getAVLinearPCMBitDepthKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVLinearPCMBitDepthKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v46 = AVFoundationLibrary_4612();
          v47 = dlsym(v46, "AVLinearPCMBitDepthKey");
          *((void *)v161[1] + 3) = v47;
          getAVLinearPCMBitDepthKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v45 = (id *)v172[3];
        }
        _Block_object_dispose(&v171, 8);
        if (!v45)
        {
          v111 = [MEMORY[0x263F08690] currentHandler];
          v112 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMBitDepthKey(void)"];
          objc_msgSend(v111, "handleFailureInFunction:file:lineNumber:description:", v112, @"WFAudioInterchangeFormatEncoder.m", 27, @"%s", dlerror());

          goto LABEL_87;
        }
        id v48 = *v45;
        v176[2] = v48;
        v180 = (uint64_t)&unk_26C741CE0;
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v49 = (id *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
        v174 = (void *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
        if (!getAVLinearPCMIsNonInterleavedSymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVLinearPCMIsNonInterleavedSymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v50 = AVFoundationLibrary_4612();
          v51 = dlsym(v50, "AVLinearPCMIsNonInterleaved");
          *((void *)v161[1] + 3) = v51;
          getAVLinearPCMIsNonInterleavedSymbolLoc_ptr = *((void *)v161[1] + 3);
          v49 = (id *)v172[3];
        }
        _Block_object_dispose(&v171, 8);
        if (!v49)
        {
          v113 = [MEMORY[0x263F08690] currentHandler];
          v114 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMIsNonInterleaved(void)"];
          objc_msgSend(v113, "handleFailureInFunction:file:lineNumber:description:", v114, @"WFAudioInterchangeFormatEncoder.m", 28, @"%s", dlerror());

          goto LABEL_87;
        }
        id v52 = *v49;
        v176[3] = v52;
        v181 = v44;
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v53 = (id *)getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
        v174 = (void *)getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
        if (!getAVLinearPCMIsBigEndianKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVLinearPCMIsBigEndianKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v54 = AVFoundationLibrary_4612();
          v55 = dlsym(v54, "AVLinearPCMIsBigEndianKey");
          *((void *)v161[1] + 3) = v55;
          getAVLinearPCMIsBigEndianKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v53 = (id *)v172[3];
        }
        _Block_object_dispose(&v171, 8);
        if (!v53)
        {
          v115 = [MEMORY[0x263F08690] currentHandler];
          v116 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMIsBigEndianKey(void)"];
          objc_msgSend(v115, "handleFailureInFunction:file:lineNumber:description:", v116, @"WFAudioInterchangeFormatEncoder.m", 29, @"%s", dlerror());

          goto LABEL_87;
        }
        v128 = *v53;
        v176[4] = v128;
        v182 = MEMORY[0x263EFFA88];
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v56 = (id *)getAVSampleRateKeySymbolLoc_ptr;
        v174 = (void *)getAVSampleRateKeySymbolLoc_ptr;
        if (!getAVSampleRateKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVSampleRateKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v57 = AVFoundationLibrary_4612();
          v58 = dlsym(v57, "AVSampleRateKey");
          *((void *)v161[1] + 3) = v58;
          getAVSampleRateKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v56 = (id *)v172[3];
        }
        _Block_object_dispose(&v171, 8);
        if (!v56)
        {
          v117 = [MEMORY[0x263F08690] currentHandler];
          v118 = [NSString stringWithUTF8String:"NSString *getAVSampleRateKey(void)"];
          objc_msgSend(v117, "handleFailureInFunction:file:lineNumber:description:", v118, @"WFAudioInterchangeFormatEncoder.m", 31, @"%s", dlerror());

          goto LABEL_87;
        }
        v127 = *v56;
        v176[5] = v127;
        v183 = &unk_26C741CF8;
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v59 = (id *)getAVNumberOfChannelsKeySymbolLoc_ptr;
        v174 = (void *)getAVNumberOfChannelsKeySymbolLoc_ptr;
        if (!getAVNumberOfChannelsKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVNumberOfChannelsKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v60 = AVFoundationLibrary_4612();
          v61 = dlsym(v60, "AVNumberOfChannelsKey");
          *((void *)v161[1] + 3) = v61;
          getAVNumberOfChannelsKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v59 = (id *)v172[3];
        }
        _Block_object_dispose(&v171, 8);
        if (!v59)
        {
          v119 = [MEMORY[0x263F08690] currentHandler];
          v120 = [NSString stringWithUTF8String:"NSString *getAVNumberOfChannelsKey(void)"];
          objc_msgSend(v119, "handleFailureInFunction:file:lineNumber:description:", v120, @"WFAudioInterchangeFormatEncoder.m", 32, @"%s", dlerror());

          goto LABEL_87;
        }
        id v62 = *v59;
        v176[6] = v62;
        v184 = &unk_26C741D10;
        v171 = 0;
        v172 = &v171;
        v173 = 0x2020000000;
        v63 = (id *)getAVChannelLayoutKeySymbolLoc_ptr;
        v174 = (void *)getAVChannelLayoutKeySymbolLoc_ptr;
        if (!getAVChannelLayoutKeySymbolLoc_ptr)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVChannelLayoutKeySymbolLoc_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          v64 = AVFoundationLibrary_4612();
          v65 = dlsym(v64, "AVChannelLayoutKey");
          *((void *)v161[1] + 3) = v65;
          getAVChannelLayoutKeySymbolLoc_ptr = *((void *)v161[1] + 3);
          v63 = (id *)v172[3];
        }
        v66 = v36;
        _Block_object_dispose(&v171, 8);
        if (!v63)
        {
          v121 = [MEMORY[0x263F08690] currentHandler];
          v122 = [NSString stringWithUTF8String:"NSString *getAVChannelLayoutKey(void)"];
          objc_msgSend(v121, "handleFailureInFunction:file:lineNumber:description:", v122, @"WFAudioInterchangeFormatEncoder.m", 33, @"%s", dlerror(), v43, v127, v128, v130);

          goto LABEL_87;
        }
        v177 = *v63;
        v67 = (void *)MEMORY[0x263EFF8F8];
        id v68 = v177;
        v69 = [v67 dataWithBytesNoCopy:v66 length:32 freeWhenDone:1];
        id v29 = v132;
        v185 = v69;
        v135 = [NSDictionary dictionaryWithObjects:&v178 forKeys:v176 count:8];

        v171 = 0;
        v172 = &v171;
        v173 = 0x2050000000;
        v70 = (void *)getAVAssetReaderTrackOutputClass_softClass;
        v174 = (void *)getAVAssetReaderTrackOutputClass_softClass;
        if (!getAVAssetReaderTrackOutputClass_softClass)
        {
          v157 = MEMORY[0x263EF8330];
          v158 = 3221225472;
          v159 = __getAVAssetReaderTrackOutputClass_block_invoke;
          v160 = &unk_26428AC60;
          v161 = (void **)&v171;
          __getAVAssetReaderTrackOutputClass_block_invoke((uint64_t)&v157);
          v70 = (void *)v172[3];
        }
        id v71 = v70;
        _Block_object_dispose(&v171, 8);
        v72 = [v71 assetReaderTrackOutputWithTrack:v140 outputSettings:v135];
        if ([v137 canAddOutput:v72])
        {
          [v137 addOutput:v72];
          v73 = [MEMORY[0x263F852B8] typeWithUTType:v133];
          v74 = +[WFFileRepresentation proposedFilenameForFile:v132 ofType:v73];
          v131 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v74];

          v171 = 0;
          v172 = &v171;
          v173 = 0x2050000000;
          v75 = (void *)getAVAssetWriterClass_softClass_4624;
          v174 = (void *)getAVAssetWriterClass_softClass_4624;
          if (!getAVAssetWriterClass_softClass_4624)
          {
            v157 = MEMORY[0x263EF8330];
            v158 = 3221225472;
            v159 = __getAVAssetWriterClass_block_invoke_4625;
            v160 = &unk_26428AC60;
            v161 = (void **)&v171;
            __getAVAssetWriterClass_block_invoke_4625((uint64_t)&v157);
            v75 = (void *)v172[3];
          }
          id v76 = v75;
          _Block_object_dispose(&v171, 8);
          v171 = 0;
          v172 = &v171;
          v173 = 0x2020000000;
          v77 = (void **)getAVFileTypeAIFFSymbolLoc_ptr;
          v174 = (void *)getAVFileTypeAIFFSymbolLoc_ptr;
          if (!getAVFileTypeAIFFSymbolLoc_ptr)
          {
            v157 = MEMORY[0x263EF8330];
            v158 = 3221225472;
            v159 = __getAVFileTypeAIFFSymbolLoc_block_invoke;
            v160 = &unk_26428AC60;
            v161 = (void **)&v171;
            v78 = AVFoundationLibrary_4612();
            v79 = dlsym(v78, "AVFileTypeAIFF");
            *((void *)v161[1] + 3) = v79;
            getAVFileTypeAIFFSymbolLoc_ptr = *((void *)v161[1] + 3);
            v77 = (void **)v172[3];
          }
          _Block_object_dispose(&v171, 8);
          if (!v77)
          {
            v123 = [MEMORY[0x263F08690] currentHandler];
            v124 = [NSString stringWithUTF8String:"AVFileType getAVFileTypeAIFF(void)"];
            objc_msgSend(v123, "handleFailureInFunction:file:lineNumber:description:", v124, @"WFAudioInterchangeFormatEncoder.m", 30, @"%s", dlerror());

            goto LABEL_87;
          }
          v80 = *v77;
          v169 = v138;
          id v81 = v80;
          v134 = [v76 assetWriterWithURL:v131 fileType:v81 error:&v169];
          id v29 = v132;
          v129 = v169;

          [v134 setMetadata:v136];
          v171 = 0;
          v172 = &v171;
          v173 = 0x2050000000;
          v82 = (void *)getAVAssetWriterInputClass_softClass_4627;
          v174 = (void *)getAVAssetWriterInputClass_softClass_4627;
          if (!getAVAssetWriterInputClass_softClass_4627)
          {
            v157 = MEMORY[0x263EF8330];
            v158 = 3221225472;
            v159 = __getAVAssetWriterInputClass_block_invoke_4628;
            v160 = &unk_26428AC60;
            v161 = (void **)&v171;
            __getAVAssetWriterInputClass_block_invoke_4628((uint64_t)&v157);
            v82 = (void *)v172[3];
          }
          id v83 = v82;
          _Block_object_dispose(&v171, 8);
          v84 = getAVMediaTypeAudio();
          v85 = [v83 assetWriterInputWithMediaType:v84 outputSettings:v135];

          [v85 setExpectsMediaDataInRealTime:0];
          if (([v134 canAddInput:v85] & 1) != 0
            && ([v134 addInput:v85], (objc_msgSend(v134, "startWriting") & 1) != 0)
            && ([v137 startReading] & 1) != 0)
          {
            uint64_t v86 = [v140 naturalTimeScale];
            v171 = 0;
            v172 = &v171;
            v173 = 0x2020000000;
            v87 = (void (*)(uint64_t *__return_ptr, void, uint64_t))getCMTimeMakeSymbolLoc_ptr_4629;
            v174 = getCMTimeMakeSymbolLoc_ptr_4629;
            if (!getCMTimeMakeSymbolLoc_ptr_4629)
            {
              v157 = MEMORY[0x263EF8330];
              v158 = 3221225472;
              v159 = __getCMTimeMakeSymbolLoc_block_invoke_4630;
              v160 = &unk_26428AC60;
              v161 = (void **)&v171;
              v88 = CoreMediaLibrary_4631();
              v89 = dlsym(v88, "CMTimeMake");
              *((void *)v161[1] + 3) = v89;
              getCMTimeMakeSymbolLoc_ptr_4629 = (_UNKNOWN *)*((void *)v161[1] + 3);
              v87 = (void (*)(uint64_t *__return_ptr, void, uint64_t))v172[3];
            }
            _Block_object_dispose(&v171, 8);
            if (!v87)
            {
              while (1)
              {
                v125 = [MEMORY[0x263F08690] currentHandler];
                v126 = objc_msgSend(NSString, "stringWithUTF8String:", "CMTime soft_CMTimeMake(int64_t, int32_t)");
                objc_msgSend(v125, "handleFailureInFunction:file:lineNumber:description:", v126, @"WFAudioInterchangeFormatEncoder.m", 16, @"%s", dlerror());

LABEL_87:
                __break(1u);
              }
            }
            v87(&v171, 0, v86);
            [v134 startSessionAtSourceTime:&v171];
            v90 = dispatch_get_global_queue(0, 0);
            v157 = MEMORY[0x263EF8330];
            v158 = 3221225472;
            v159 = __WFEncodeAssetToAIFF_block_invoke;
            v160 = &unk_264286788;
            v91 = v85;
            v161 = v91;
            v162 = v72;
            v163 = v134;
            v168 = v139;
            v164 = v131;
            v165 = v73;
            v166 = v137;
            v167 = v129;
            [v91 requestMediaDataWhenReadyOnQueue:v90 usingBlock:&v157];
          }
          else
          {
            ((void (**)(id, void *, id))v139)[2](v139, 0, v129);
          }

          v138 = v129;
        }
        else
        {
          ((void (**)(id, void *, id))v139)[2](v139, 0, v138);
        }
      }
      else
      {
        v139[2](v139, 0, 0);
      }
    }
    else
    {
      v92 = [(WFAVAssetContentItem *)self generateExportSessionForType:v14];
      [v92 setOutputURL:v145];
      if (v147) {
        objc_msgSend(v92, "setMetadata:");
      }
      v93 = (void *)MEMORY[0x263F852B8];
      v94 = [v92 supportedFileTypes];
      v95 = [v93 typesFromStrings:v94];
      v154[0] = MEMORY[0x263EF8330];
      v154[1] = 3221225472;
      v154[2] = __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke;
      v154[3] = &unk_2642878D0;
      v96 = v14;
      v155 = v96;
      v97 = [v95 indexesOfObjectsPassingTest:v154];
      v98 = [v97 count] == 0;

      if (v98)
      {
        v100 = [(id)objc_opt_class() badCoercionErrorForType:v144];
        ((void (**)(id, void *, id))v146)[2](v146, 0, v100);
      }
      else
      {
        v99 = [v96 string];
        [v92 setOutputFileType:v99];

        v148[0] = MEMORY[0x263EF8330];
        v148[1] = 3221225472;
        v148[2] = __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke_2;
        v148[3] = &unk_2642878F8;
        v149 = v92;
        v153 = v146;
        v150 = v145;
        v151 = v144;
        v152 = self;
        [v149 exportAsynchronouslyWithCompletionHandler:v148];

        v100 = v149;
      }
    }
  }
}

uint64_t __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) conformsToType:a2];
}

void __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) status] == 3)
  {
    v2 = +[WFFileRepresentation fileWithURL:*(void *)(a1 + 40) options:1 ofType:*(void *)(a1 + 48)];
    v3 = *(void **)(a1 + 56);
    v9[0] = v2;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v3 setFileRepresentations:v4 forType:*(void *)(a1 + 48)];

    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v2, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 64);
    id v8 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
}

- (id)metadataItemForCommonKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAVAssetContentItem *)self asset];
  id v6 = [v5 commonMetadata];

  uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"commonKey = %@", v4];

  id v8 = [v6 filteredArrayUsingPredicate:v7];
  v9 = [v8 firstObject];

  return v9;
}

- (id)generateExportSessionForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAVAssetContentItem *)self asset];
  getAVURLAssetClass_9736();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(WFAVAssetContentItem *)self asset];
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = (void *)MEMORY[0x263F852B8];
  id v8 = [v6 URL];
  v9 = [v8 pathExtension];
  id v10 = [v7 typeFromFileExtension:v9];

  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x2020000000;
  id v11 = (id *)getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  uint64_t v37 = getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  if (!getAVAssetExportPresetPassthroughSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getAVAssetExportPresetPassthroughSymbolLoc_block_invoke;
    v32 = &unk_26428AC60;
    v33 = &v34;
    v12 = AVFoundationLibrary_9711();
    v35[3] = (uint64_t)dlsym(v12, "AVAssetExportPresetPassthrough");
    getAVAssetExportPresetPassthroughSymbolLoc_ptr = *(void *)(v33[1] + 24);
    id v11 = (id *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v11)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    id v28 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetPassthrough(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"WFAVAssetContentItem.m", 46, @"%s", dlerror(), v29, v30, v31, v32);
    goto LABEL_28;
  }
  id v13 = *v11;
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x2020000000;
  v14 = (id *)getAVFileTypeAppleM4ASymbolLoc_ptr;
  uint64_t v37 = getAVFileTypeAppleM4ASymbolLoc_ptr;
  if (!getAVFileTypeAppleM4ASymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getAVFileTypeAppleM4ASymbolLoc_block_invoke;
    v32 = &unk_26428AC60;
    v33 = &v34;
    int v15 = AVFoundationLibrary_9711();
    v35[3] = (uint64_t)dlsym(v15, "AVFileTypeAppleM4A");
    getAVFileTypeAppleM4ASymbolLoc_ptr = *(void *)(v33[1] + 24);
    v14 = (id *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v14)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    id v28 = [NSString stringWithUTF8String:"AVFileType getAVFileTypeAppleM4A(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"WFAVAssetContentItem.m", 47, @"%s", dlerror(), v29, v30, v31, v32);
    goto LABEL_28;
  }
  id v16 = *v14;
  if (v4) {
    __int16 v17 = v4;
  }
  else {
    __int16 v17 = v10;
  }
  if ([v17 isEqualToString:v16])
  {

LABEL_16:
    uint64_t v34 = 0;
    BOOL v35 = &v34;
    uint64_t v36 = 0x2020000000;
    id v19 = (id *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
    uint64_t v37 = getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
    if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr)
    {
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      id v31 = __getAVAssetExportPresetAppleM4ASymbolLoc_block_invoke;
      v32 = &unk_26428AC60;
      v33 = &v34;
      v20 = AVFoundationLibrary_9711();
      v35[3] = (uint64_t)dlsym(v20, "AVAssetExportPresetAppleM4A");
      getAVAssetExportPresetAppleM4ASymbolLoc_ptr = *(void *)(v33[1] + 24);
      id v19 = (id *)v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v19)
    {
      id v21 = *v19;

      id v13 = v21;
      goto LABEL_20;
    }
    v27 = [MEMORY[0x263F08690] currentHandler];
    id v28 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetAppleM4A(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"WFAVAssetContentItem.m", 48, @"%s", dlerror(), v29, v30, v31, v32);
LABEL_28:

    __break(1u);
    return result;
  }
  char v18 = [v10 conformsToUTType:*MEMORY[0x263F1DB80]];

  if (v18) {
    goto LABEL_16;
  }
LABEL_20:
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x2050000000;
  int v22 = (void *)getAVAssetExportSessionClass_softClass;
  uint64_t v37 = getAVAssetExportSessionClass_softClass;
  if (!getAVAssetExportSessionClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = __getAVAssetExportSessionClass_block_invoke;
    v32 = &unk_26428AC60;
    v33 = &v34;
    __getAVAssetExportSessionClass_block_invoke((uint64_t)&v29);
    int v22 = (void *)v35[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v34, 8);
  v24 = [(WFAVAssetContentItem *)self asset];
  int v25 = [v23 exportSessionWithAsset:v24 presetName:v13];

  return v25;
}

- (AVAsset)asset
{
  v3 = +[WFObjectType typeWithClass:getAVAssetClass()];
  id v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v5 object];

  return (AVAsset *)v6;
}

- (WFFileType)preferredFileType
{
  v3 = [(WFContentItem *)self internalRepresentationType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(WFContentItem *)self internalRepresentationType];
  }
  else
  {
    id v6 = [(WFContentItem *)self internalRepresentation];
    uint64_t v7 = [v6 wfType];
    int v8 = [v7 conformsToClass:getAVURLAssetClass_9736()];

    if (v8)
    {
      v9 = [(WFAVAssetContentItem *)self asset];
      id v10 = [v9 URL];
      id v11 = [v10 wfFileType];

      if (v11)
      {
        if ([v11 conformsToUTType:*MEMORY[0x263F1DB80]])
        {
          id v12 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856A8]];
        }
        else
        {
          id v12 = v11;
        }
      }
      else
      {
        v16.receiver = self;
        v16.super_class = (Class)WFAVAssetContentItem;
        id v12 = [(WFContentItem *)&v16 preferredFileType];
      }
      id v13 = v12;

      goto LABEL_12;
    }
    v15.receiver = self;
    v15.super_class = (Class)WFAVAssetContentItem;
    uint64_t v5 = [(WFContentItem *)&v15 preferredFileType];
  }
  id v13 = (void *)v5;
LABEL_12:
  return (WFFileType *)v13;
}

- (CLLocation)location
{
  id AVMetadataItemClass = getAVMetadataItemClass();
  id v4 = [(WFAVAssetContentItem *)self asset];
  uint64_t v5 = [v4 metadata];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v6 = (id *)getAVMetadataCommonKeyLocationSymbolLoc_ptr;
  uint64_t v33 = getAVMetadataCommonKeyLocationSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyLocationSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getAVMetadataCommonKeyLocationSymbolLoc_block_invoke;
    id v28 = &unk_26428AC60;
    uint64_t v29 = &v30;
    uint64_t v7 = AVFoundationLibrary_9711();
    v31[3] = (uint64_t)dlsym(v7, "AVMetadataCommonKeyLocation");
    getAVMetadataCommonKeyLocationSymbolLoc_ptr = *(void *)(v29[1] + 24);
    id v6 = (id *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (v6)
  {
    id v8 = *v6;
    v9 = getAVMetadataKeySpaceCommon();
    id v10 = [AVMetadataItemClass metadataItemsFromArray:v5 withKey:v8 keySpace:v9];

    id v11 = [v10 firstObject];

    if (v11)
    {
      id v12 = [v11 stringValue];
      if ((unint64_t)[v12 length] >= 0x11)
      {
        v14 = [v12 substringToIndex:8];
        objc_super v15 = objc_msgSend(v12, "substringWithRange:", 8, 9);
        uint64_t v30 = 0;
        id v31 = &v30;
        uint64_t v32 = 0x2050000000;
        objc_super v16 = (void *)getCLLocationClass_softClass_9766;
        uint64_t v33 = getCLLocationClass_softClass_9766;
        if (!getCLLocationClass_softClass_9766)
        {
          uint64_t v25 = MEMORY[0x263EF8330];
          uint64_t v26 = 3221225472;
          v27 = __getCLLocationClass_block_invoke_9767;
          id v28 = &unk_26428AC60;
          uint64_t v29 = &v30;
          __getCLLocationClass_block_invoke_9767((uint64_t)&v25);
          objc_super v16 = (void *)v31[3];
        }
        __int16 v17 = v16;
        _Block_object_dispose(&v30, 8);
        id v18 = [v17 alloc];
        [v14 doubleValue];
        double v20 = v19;
        [v15 doubleValue];
        id v13 = (void *)[v18 initWithLatitude:v20 longitude:v21];
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }

    return (CLLocation *)v13;
  }
  else
  {
    id v23 = [MEMORY[0x263F08690] currentHandler];
    v24 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyLocation(void)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"WFAVAssetContentItem.m", 45, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)duration
{
  v2 = [(WFAVAssetContentItem *)self asset];
  v3 = v2;
  if (v2)
  {
    [v2 duration];
  }
  else
  {
    long long v18 = 0uLL;
    double v19 = 0;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  id v4 = (double (*)(long long *))getCMTimeGetSecondsSymbolLoc_ptr_9776;
  v27 = getCMTimeGetSecondsSymbolLoc_ptr_9776;
  if (!getCMTimeGetSecondsSymbolLoc_ptr_9776)
  {
    *(void *)&long long v20 = MEMORY[0x263EF8330];
    *((void *)&v20 + 1) = 3221225472;
    double v21 = __getCMTimeGetSecondsSymbolLoc_block_invoke_9777;
    int v22 = &unk_26428AC60;
    id v23 = &v24;
    uint64_t v5 = CoreMediaLibrary_9778();
    v25[3] = (uint64_t)dlsym(v5, "CMTimeGetSeconds");
    getCMTimeGetSecondsSymbolLoc_ptr_9776 = *(_UNKNOWN **)(v23[1] + 24);
    id v4 = (double (*)(long long *))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v4)
  {
    long long v20 = v18;
    double v21 = v19;
    double v6 = v4(&v20);

    uint64_t v7 = [MEMORY[0x263EFF910] date];
    id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    v9 = [v7 dateByAddingTimeInterval:v6];
    uint64_t v10 = 224;
    id v11 = [v8 components:224 fromDate:v7 toDate:v9 options:0];

    if ([v11 hour])
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v13 = [v11 minute];
      if (v13) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = 0x10000;
      }
      if (v13) {
        uint64_t v10 = 224;
      }
      else {
        uint64_t v10 = 192;
      }
    }
    v14 = [[WFTimeInterval alloc] initWithTimeInterval:v10 allowedUnits:0 unitsStyle:v12 zeroFormattingBehavior:v6];

    return v14;
  }
  else
  {
    objc_super v16 = [MEMORY[0x263F08690] currentHandler];
    __int16 v17 = [NSString stringWithUTF8String:"Float64 soft_CMTimeGetSeconds(CMTime)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"WFAVAssetContentItem.m", 23, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (void)getPreferredFileSize:(id)a3
{
  void (*v12)(_OWORD *__return_ptr, long long *, long long *);
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[3];
  long long v17;
  uint64_t v18;
  long long v19;
  void *(*v20)(uint64_t);
  _OWORD v21[3];
  objc_super v22;
  long long v23;
  void *(*v24)(uint64_t);
  void *v25;
  long long *v26;
  long long v27;
  uint64_t v28;
  void *v29;

  id v4 = a3;
  uint64_t v5 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v22.receiver = self;
    v22.super_class = (Class)WFAVAssetContentItem;
    [(WFContentItem *)&v22 getPreferredFileSize:v4];
LABEL_13:

    return;
  }
  uint64_t v7 = [(WFAVAssetContentItem *)self generateExportSessionForType:0];
  *(void *)&v27 = 0;
  *((void *)&v27 + 1) = &v27;
  id v28 = 0x2020000000;
  uint64_t v8 = getkCMTimeZeroSymbolLoc_ptr_9789;
  uint64_t v29 = (void *)getkCMTimeZeroSymbolLoc_ptr_9789;
  if (!getkCMTimeZeroSymbolLoc_ptr_9789)
  {
    *(void *)&id v23 = MEMORY[0x263EF8330];
    *((void *)&v23 + 1) = 3221225472;
    uint64_t v24 = __getkCMTimeZeroSymbolLoc_block_invoke_9790;
    uint64_t v25 = &unk_26428AC60;
    uint64_t v26 = &v27;
    v9 = CoreMediaLibrary_9778();
    *(void *)(*((void *)&v27 + 1) + 24) = dlsym(v9, "kCMTimeZero");
    getkCMTimeZeroSymbolLoc_ptr_9789 = *(void *)(*((void *)v26 + 1) + 24);
    uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 24);
  }
  _Block_object_dispose(&v27, 8);
  if (v8)
  {
    double v19 = *(_OWORD *)v8;
    long long v20 = *(void *(**)(uint64_t))(v8 + 16);
    uint64_t v10 = [v7 asset];
    id v11 = v10;
    if (v10)
    {
      [v10 duration];
    }
    else
    {
      __int16 v17 = 0uLL;
      long long v18 = 0;
    }
    *(void *)&v27 = 0;
    *((void *)&v27 + 1) = &v27;
    id v28 = 0x2020000000;
    uint64_t v12 = (void (*)(_OWORD *__return_ptr, long long *, long long *))getCMTimeRangeMakeSymbolLoc_ptr;
    uint64_t v29 = getCMTimeRangeMakeSymbolLoc_ptr;
    if (!getCMTimeRangeMakeSymbolLoc_ptr)
    {
      *(void *)&id v23 = MEMORY[0x263EF8330];
      *((void *)&v23 + 1) = 3221225472;
      uint64_t v24 = __getCMTimeRangeMakeSymbolLoc_block_invoke;
      uint64_t v25 = &unk_26428AC60;
      uint64_t v26 = &v27;
      uint64_t v13 = CoreMediaLibrary_9778();
      *(void *)(*((void *)&v27 + 1) + 24) = dlsym(v13, "CMTimeRangeMake");
      getCMTimeRangeMakeSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v26 + 1) + 24);
      uint64_t v12 = *(void (**)(_OWORD *__return_ptr, long long *, long long *))(*((void *)&v27 + 1) + 24);
    }
    _Block_object_dispose(&v27, 8);
    if (v12)
    {
      id v23 = v19;
      uint64_t v24 = v20;
      v27 = v17;
      id v28 = v18;
      v12(v21, &v23, &v27);
      v16[0] = v21[0];
      v16[1] = v21[1];
      v16[2] = v21[2];
      [v7 setTimeRange:v16];

      (*((void (**)(id, uint64_t))v4 + 2))(v4, [v7 estimatedOutputFileLength]);
      goto LABEL_13;
    }
    v14 = [MEMORY[0x263F08690] currentHandler];
    objc_super v15 = objc_msgSend(NSString, "stringWithUTF8String:", "CMTimeRange soft_CMTimeRangeMake(CMTime, CMTime)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFAVAssetContentItem.m", 24, @"%s", dlerror());
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    objc_super v15 = [NSString stringWithUTF8String:"CMTime getkCMTimeZero(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"WFAVAssetContentItem.m", 22, @"%s", dlerror());
  }

  __break(1u);
}

- (id)frameRate
{
  v2 = [(WFAVAssetContentItem *)self asset];
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v3 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_9793;
  uint64_t v17 = getAVMediaTypeVideoSymbolLoc_ptr_9793;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_9793)
  {
    id v4 = AVFoundationLibrary_9711();
    v15[3] = (uint64_t)dlsym(v4, "AVMediaTypeVideo");
    getAVMediaTypeVideoSymbolLoc_ptr_9793 = v15[3];
    v3 = (void *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v3)
  {
    uint64_t v5 = [v2 tracksWithMediaType:*v3];
    double v6 = [v5 firstObject];
    [v6 nominalFrameRate];
    int v8 = v7;

    LODWORD(v9) = v8;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
    return v10;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"WFAVAssetContentItem.m", 34, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Media Items");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Media (plural)", @"Media");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Media (singular)", @"Media");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Media";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = +[WFObjectType typeWithClassName:@"AVMutableMovie" frameworkName:@"AVFoundation" location:0];
  uint64_t v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"AVAsset" frameworkName:@"AVFoundation" location:0];
  id v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1D9C0]];
  uint64_t v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToUTType:*MEMORY[0x263F1D9C0]] & 1) != 0
    || ([v4 isEqualToUTType:*MEMORY[0x263F1D9B8]] & 1) != 0
    || ([v4 isEqualToUTType:*MEMORY[0x263F1DD58]] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFAVAssetContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v40[6] = *MEMORY[0x263EF8340];
  BOOL v35 = WFLocalizedContentPropertyNameMarker(@"Duration");
  uint64_t v34 = +[WFContentPropertyBuilder keyPath:@"duration" name:v35 class:objc_opt_class()];
  uint64_t v33 = [v34 timeUnits:224];
  v40[0] = v33;
  uint64_t v32 = WFLocalizedContentPropertyNameMarker(@"Frame Rate");
  id v31 = +[WFContentPropertyBuilder keyPath:@"frameRate" name:v32 class:objc_opt_class()];
  uint64_t v30 = [v31 irrational:1];
  v40[1] = v30;
  uint64_t v29 = WFLocalizedContentPropertyNameMarker(@"Title");
  id v28 = +[WFContentPropertyBuilder block:&__block_literal_global_9841 name:v29 class:objc_opt_class()];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v2 = (id *)getAVMetadataCommonKeyTitleSymbolLoc_ptr;
  uint64_t v39 = getAVMetadataCommonKeyTitleSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyTitleSymbolLoc_ptr)
  {
    id v3 = AVFoundationLibrary_9711();
    v37[3] = (uint64_t)dlsym(v3, "AVMetadataCommonKeyTitle");
    getAVMetadataCommonKeyTitleSymbolLoc_ptr = v37[3];
    v2 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v2)
  {
    long long v18 = [MEMORY[0x263F08690] currentHandler];
    double v19 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyTitle(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFAVAssetContentItem.m", 41, @"%s", dlerror());

    goto LABEL_16;
  }
  id v24 = *v2;
  v27 = objc_msgSend(v28, "userInfo:");
  v40[2] = v27;
  uint64_t v26 = WFLocalizedContentPropertyNameMarker(@"Artist");
  uint64_t v25 = +[WFContentPropertyBuilder block:&__block_literal_global_9841 name:v26 class:objc_opt_class()];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v4 = (id *)getAVMetadataCommonKeyArtistSymbolLoc_ptr;
  uint64_t v39 = getAVMetadataCommonKeyArtistSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyArtistSymbolLoc_ptr)
  {
    unsigned __int8 v5 = AVFoundationLibrary_9711();
    v37[3] = (uint64_t)dlsym(v5, "AVMetadataCommonKeyArtist");
    getAVMetadataCommonKeyArtistSymbolLoc_ptr = v37[3];
    id v4 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v4)
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    double v21 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyArtist(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFAVAssetContentItem.m", 42, @"%s", dlerror());

    goto LABEL_16;
  }
  id v6 = *v4;
  objc_super v7 = [v25 userInfo:v6];
  v40[3] = v7;
  int v8 = WFLocalizedContentPropertyNameMarker(@"Album");
  double v9 = +[WFContentPropertyBuilder block:&__block_literal_global_9841 name:v8 class:objc_opt_class()];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v10 = (id *)getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr;
  uint64_t v39 = getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr)
  {
    id v11 = AVFoundationLibrary_9711();
    v37[3] = (uint64_t)dlsym(v11, "AVMetadataCommonKeyAlbumName");
    getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr = v37[3];
    uint64_t v10 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v10)
  {
    int v22 = [MEMORY[0x263F08690] currentHandler];
    id v23 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyAlbumName(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFAVAssetContentItem.m", 43, @"%s", dlerror());

LABEL_16:
    __break(1u);
  }
  id v12 = *v10;
  uint64_t v13 = [v9 userInfo:v12];
  v40[4] = v13;
  uint64_t v14 = WFLocalizedContentPropertyNameMarker(@"Artwork");
  objc_super v15 = +[WFContentPropertyBuilder block:&__block_literal_global_38 name:v14 class:objc_opt_class()];
  v40[5] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:6];

  return v16;
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  objc_super v7 = [v5 asset];
  v14[0] = @"commonMetadata";
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WFAVAssetContentItem_propertyBuilders__block_invoke_4;
  v11[3] = &unk_264288800;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 loadValuesAsynchronouslyForKeys:v8 completionHandler:v11];
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  id AVMetadataItemClass = getAVMetadataItemClass();
  id v3 = [*(id *)(a1 + 32) asset];
  id v4 = [v3 commonMetadata];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v5 = (id *)getAVMetadataCommonKeyArtworkSymbolLoc_ptr;
  uint64_t v20 = getAVMetadataCommonKeyArtworkSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyArtworkSymbolLoc_ptr)
  {
    id v6 = AVFoundationLibrary_9711();
    v18[3] = (uint64_t)dlsym(v6, "AVMetadataCommonKeyArtwork");
    getAVMetadataCommonKeyArtworkSymbolLoc_ptr = v18[3];
    id v5 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    id v7 = *v5;
    int v8 = getAVMetadataKeySpaceCommon();
    id v9 = [AVMetadataItemClass metadataItemsFromArray:v4 withKey:v7 keySpace:v8];

    id v10 = [v9 firstObject];

    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = (void *)MEMORY[0x263F85308];
    id v13 = [v10 value];
    uint64_t v14 = [v12 imageWithData:v13];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);
  }
  else
  {
    objc_super v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyArtwork(void)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"WFAVAssetContentItem.m", 44, @"%s", dlerror());

    __break(1u);
  }
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v6 asset];
  v18[0] = @"commonMetadata";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __40__WFAVAssetContentItem_propertyBuilders__block_invoke_2;
  v14[3] = &unk_26428A9D8;
  id v15 = v6;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  [v9 loadValuesAsynchronouslyForKeys:v10 completionHandler:v14];
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  id AVMetadataItemClass = getAVMetadataItemClass();
  id v3 = [*(id *)(a1 + 32) asset];
  id v4 = [v3 commonMetadata];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = getAVMetadataKeySpaceCommon();
  id v7 = [AVMetadataItemClass metadataItemsFromArray:v4 withKey:v5 keySpace:v6];
  id v10 = [v7 firstObject];

  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [v10 value];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (BOOL)getListAltText:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(WFAVAssetContentItem *)self asset];
  id v6 = v5;
  if (v5)
  {
    [v5 duration];
  }
  else
  {
    long long v13 = 0uLL;
    uint64_t v14 = 0;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v7 = (double (*)(long long *))getCMTimeGetSecondsSymbolLoc_ptr_14522;
  int v22 = getCMTimeGetSecondsSymbolLoc_ptr_14522;
  if (!getCMTimeGetSecondsSymbolLoc_ptr_14522)
  {
    *(void *)&long long v15 = MEMORY[0x263EF8330];
    *((void *)&v15 + 1) = 3221225472;
    id v16 = __getCMTimeGetSecondsSymbolLoc_block_invoke_14523;
    id v17 = &unk_26428AC60;
    long long v18 = &v19;
    __getCMTimeGetSecondsSymbolLoc_block_invoke_14523(&v15);
    id v7 = (double (*)(long long *))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    long long v15 = v13;
    id v16 = v14;
    double v8 = v7(&v15);
    id v9 = WFChooseFromListFormatPlaybackDuration(v8);

    if (v4) {
      v4[2](v4, v9);
    }

    return 1;
  }
  else
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    id v12 = [NSString stringWithUTF8String:"Float64 soft_CMTimeGetSeconds(CMTime)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFContentItem+ChooseFromList.m", 31, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2050000000;
  uint64_t v5 = (void *)getAVMetadataItemClass_softClass_14530;
  uint64_t v31 = getAVMetadataItemClass_softClass_14530;
  if (!getAVMetadataItemClass_softClass_14530)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getAVMetadataItemClass_block_invoke_14531;
    uint64_t v26 = &unk_26428AC60;
    v27 = &v28;
    __getAVMetadataItemClass_block_invoke_14531((uint64_t)&v23);
    uint64_t v5 = (void *)v29[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v28, 8);
  id v7 = [(WFAVAssetContentItem *)self asset];
  double v8 = [v7 commonMetadata];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  id v9 = (id *)getAVMetadataCommonKeyArtistSymbolLoc_ptr_14532;
  uint64_t v31 = getAVMetadataCommonKeyArtistSymbolLoc_ptr_14532;
  if (!getAVMetadataCommonKeyArtistSymbolLoc_ptr_14532)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getAVMetadataCommonKeyArtistSymbolLoc_block_invoke_14533;
    uint64_t v26 = &unk_26428AC60;
    v27 = &v28;
    id v10 = AVFoundationLibrary_14534();
    id v11 = dlsym(v10, "AVMetadataCommonKeyArtist");
    *(void *)(v27[1] + 24) = v11;
    getAVMetadataCommonKeyArtistSymbolLoc_ptr_14532 = *(void *)(v27[1] + 24);
    id v9 = (id *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    int v22 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyArtist(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFContentItem+ChooseFromList.m", 36, @"%s", dlerror());
LABEL_18:

    __break(1u);
    return result;
  }
  id v12 = *v9;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  long long v13 = (void *)getAVMetadataKeySpaceCommonSymbolLoc_ptr_14537;
  uint64_t v31 = getAVMetadataKeySpaceCommonSymbolLoc_ptr_14537;
  if (!getAVMetadataKeySpaceCommonSymbolLoc_ptr_14537)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __getAVMetadataKeySpaceCommonSymbolLoc_block_invoke_14538;
    uint64_t v26 = &unk_26428AC60;
    v27 = &v28;
    uint64_t v14 = AVFoundationLibrary_14534();
    long long v15 = dlsym(v14, "AVMetadataKeySpaceCommon");
    *(void *)(v27[1] + 24) = v15;
    getAVMetadataKeySpaceCommonSymbolLoc_ptr_14537 = *(void *)(v27[1] + 24);
    long long v13 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v13)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    int v22 = [NSString stringWithUTF8String:"AVMetadataKeySpace getAVMetadataKeySpaceCommon(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFContentItem+ChooseFromList.m", 35, @"%s", dlerror());
    goto LABEL_18;
  }
  id v16 = [v6 metadataItemsFromArray:v8 withKey:v12 keySpace:*v13];
  id v17 = [v16 firstObject];
  long long v18 = [v17 value];

  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4) {
      v4[2](v4, v18);
    }
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

@end