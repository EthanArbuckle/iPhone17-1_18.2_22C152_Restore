id ABLoadResourcesWithCompletion(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  v2 = +[ABDeviceSceneResourceLoader sharedLoader]();
  v3 = -[ABDeviceSceneResourceLoader loadResourcesWithCompletion:]((uint64_t)v2, v1);

  return v3;
}

void sub_2474212D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ABLogger()
{
  if (ABLogger_onceToken != -1) {
    dispatch_once(&ABLogger_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)ABLogger_logger;

  return v0;
}

void sub_247421544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 __move_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(void *)a1 = v4;

  uint64_t v6 = a2[1];
  a2[1] = 0;
  v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;

  uint64_t v8 = a2[2];
  a2[2] = 0;
  v9 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v8;

  uint64_t v10 = a2[3];
  a2[3] = 0;
  v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;

  uint64_t v12 = a2[4];
  a2[4] = 0;
  v13 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v12;

  uint64_t v14 = a2[5];
  a2[5] = 0;
  v15 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v14;

  uint64_t v16 = a2[6];
  a2[6] = 0;
  v17 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v16;

  __n128 result = *(__n128 *)(a2 + 7);
  long long v19 = *(_OWORD *)(a2 + 9);
  long long v20 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
  *(_OWORD *)(a1 + 88) = v20;
  *(_OWORD *)(a1 + 72) = v19;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

double __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(void *)a1 = v4;

  uint64_t v6 = a2[1];
  a2[1] = 0;
  v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;

  uint64_t v8 = a2[2];
  a2[2] = 0;
  v9 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v8;

  *(void *)&double result = __move_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(a1 + 24, a2 + 3).n128_u64[0];
  return result;
}

__n128 __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  *(void *)(a1 + 24) = *(id *)(a2 + 24);
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  *(void *)(a1 + 48) = *(id *)(a2 + 48);
  __n128 result = *(__n128 *)(a2 + 72);
  long long v5 = *(_OWORD *)(a2 + 88);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 88) = v5;
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void ABDeviceSceneButtonModelSetColor(id *a1, void *a2, double a3)
{
  id v5 = a2;
  double v33 = 0.0;
  double v34 = 0.0;
  double v31 = 0.0;
  double v32 = 0.0;
  [v5 getRed:&v34 green:&v33 blue:&v32 alpha:&v31];
  long long v6 = [*a1 geometry];
  v7 = [v6 firstMaterial];

  HIDWORD(v9) = HIDWORD(v33);
  HIDWORD(v8) = HIDWORD(v34);
  *(float *)&double v8 = v34;
  *(float *)&double v9 = v33;
  HIDWORD(v10) = HIDWORD(v32);
  *(float *)&double v10 = v32;
  v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v8, v9, v10);
  [v7 setValue:v11 forKey:@"glowColor"];

  [v7 setValue:&unk_26FB8E740 forKey:@"glowDistance"];
  uint64_t v12 = [NSNumber numberWithDouble:v31 * 0.4];
  [v7 setValue:v12 forKey:@"glowAmount"];

  v13 = [a1[1] geometry];
  uint64_t v14 = [v13 firstMaterial];

  v15 = [v14 emission];
  [v15 setContents:v5];

  uint64_t v16 = [v14 emission];
  [v16 setIntensity:a3 * 0.35];

  v17 = [a1[2] geometry];
  v18 = [v17 firstMaterial];

  long long v19 = [v18 emission];
  [v19 setContents:v5];

  long long v20 = [v18 emission];
  [v20 setIntensity:a3 * 0.35];

  if (v5)
  {
    v21 = [a1[4] geometry];
    v22 = [v21 firstMaterial];
    v23 = [v22 emission];
    [v23 setContents:v5];

    v24 = [a1[6] geometry];
    v25 = [v24 firstMaterial];
    v26 = [v25 emission];
    [v26 setContents:v5];
  }
  [a1[4] setOpacity:a3];
  [a1[6] setOpacity:a3];
  BOOL v28 = a3 == 1.0 && v5 != 0;
  [a1[3] setHidden:v28];
  [a1[5] setHidden:v28];
  BOOL v30 = a3 == 0.0 && v5 == 0;
  [a1[4] setHidden:v30];
  [a1[6] setHidden:v30];

  __destructor_8_s0_s8_s16_s24_s32_s40_s48((uint64_t)a1);
}

void sub_247421A30(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8_s16_s24_s32_s40_s48(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24_s32_s40_s48(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
}

void ABLoadDeviceSceneModel(void *a1@<X0>, uint64_t a2@<X8>)
{
  v122[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = ABDeviceModelResourceName();
  id v5 = [v3 URLForResource:v4 withExtension:@"usdz"];

  if (v5
    && ([MEMORY[0x263F08850] defaultManager],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        [v5 path],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isReadableFileAtPath:v7],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x263F135E8]) initWithURL:v5];
    double v10 = v9;
    if (v9)
    {
      [v9 loadTextures];
      v11 = (void *)MEMORY[0x263F16A98];
      v106 = v10;
      uint64_t v12 = [v10 objectAtIndex:0];
      v13 = [v11 nodeWithMDLObject:v12];

      float v14 = ABDegreesToRadians(180.0);
      SCNMatrix4MakeRotation(&v118, v14, 0.0, 1.0, 0.0);
      SCNMatrix4 v117 = v118;
      [v13 setTransform:&v117];
      v15 = [MEMORY[0x263F16A98] node];
      [v15 addChildNode:v13];
      uint64_t v16 = [MEMORY[0x263F16AD8] scene];
      v17 = [MEMORY[0x263F1C550] blackColor];
      [v16 setFogColor:v17];

      [v3 URLForResource:@"Precomputed IBL" withExtension:0];
      v104 = id v116 = 0;
      uint64_t v18 = objc_msgSend(MEMORY[0x263F16A88], "precomputedLightingEnvironmentContentsWithURL:error:");
      id v102 = v116;
      long long v19 = [v16 lightingEnvironment];
      v103 = (void *)v18;
      [v19 setContents:v18];

      long long v20 = [MEMORY[0x263F16A98] node];
      [v20 setName:@"camera"];
      v100 = [MEMORY[0x263F169F0] camera];
      objc_msgSend(v20, "setCamera:");
      objc_msgSend(v20, "setPosition:", 0.0, 0.0, 0.0);
      v21 = [v16 rootNode];
      v101 = v20;
      [v21 addChildNode:v20];

      v98 = v16;
      v22 = [v16 rootNode];
      [v22 addChildNode:v15];

      v23 = [v13 childNodeWithName:@"pSGcebnmcFtsOOG" recursively:1];
      v105 = v13;
      v24 = [v13 childNodeWithName:@"KxLxpHjhdScjmXV" recursively:1];
      v25 = [v23 clone];
      v26 = [v25 name];
      v27 = [v26 stringByAppendingString:@"_highlight"];
      [v25 setName:v27];

      BOOL v28 = [v23 geometry];
      v29 = (void *)[v28 copy];
      [v25 setGeometry:v29];

      memset(&v115, 0, sizeof(v115));
      *(void *)&a.m14 = 0;
      *(void *)&a.m12 = 0;
      a.m11 = 1.0;
      a.m22 = 1.0;
      *(void *)&a.m23 = 0;
      *(void *)&a.m31 = 0;
      *(_OWORD *)&a.m33 = xmmword_24742EA70;
      *(void *)&a.m43 = 0x3F80000000000000;
      memset(&b.m22, 0, 40);
      *(_OWORD *)&b.m12 = 0u;
      b.m11 = 1.0;
      b.m22 = 1.0;
      b.m33 = 1.01;
      b.m44 = 1.0;
      SCNMatrix4Mult(&v115, &a, &b);
      SCNMatrix4 v112 = v115;
      [v25 setTransform:&v112];
      v97 = v23;
      BOOL v30 = [v23 parentNode];
      v95 = v25;
      [v30 addChildNode:v25];

      [v24 clone];
      double v31 = v107 = v3;
      double v32 = [v31 name];
      double v33 = [v32 stringByAppendingString:@"_highlight"];
      [v31 setName:v33];

      double v34 = [v24 geometry];
      v35 = (void *)[v34 copy];
      [v31 setGeometry:v35];

      SCNMatrix4 v111 = v115;
      [v31 setTransform:&v111];
      v96 = v24;
      v36 = [v24 parentNode];
      v94 = v31;
      [v36 addChildNode:v31];

      v37 = [v15 childNodeWithName:@"GQhWfyGbSVpNdnc" recursively:1];
      v38 = [v37 geometry];
      v39 = [v38 firstMaterial];
      v40 = [v39 ambientOcclusion];
      [v40 setTextureComponents:15];

      v41 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.7];
      v42 = [v15 childNodeWithName:@"GQhWfyGbSVpNdnc" recursively:1];
      v43 = [v42 geometry];
      v44 = [v43 firstMaterial];
      v45 = [v44 transparent];
      [v45 setContents:v41];

      v46 = [v15 childNodeWithName:@"GQhWfyGbSVpNdnc" recursively:1];
      v47 = [v46 geometry];
      v48 = [v47 firstMaterial];
      v49 = [v48 metalness];
      [v49 setContents:&unk_26FB8E720];

      v50 = [v15 childNodeWithName:@"GQhWfyGbSVpNdnc" recursively:1];
      v51 = [v50 geometry];
      v52 = [v51 firstMaterial];
      v53 = [v52 roughness];
      [v53 setContents:&unk_26FB8E730];

      v54 = [v15 childNodeWithName:@"ughIzqxkPkTEudm" recursively:1];
      v55 = [v54 geometry];
      v56 = [v55 firstMaterial];
      v57 = [v56 ambientOcclusion];
      [v57 setTextureComponents:15];

      v58 = [v15 childNodeWithName:@"YgbJVdiVqnfLxkd" recursively:1];
      v59 = [v58 geometry];
      v60 = [v59 firstMaterial];
      v61 = [v60 ambientOcclusion];
      [v61 setIntensity:1.8];

      v62 = [v15 childNodeWithName:@"crmKpCAtfjxkywa" recursively:1];
      v63 = [v62 geometry];
      v64 = [v63 firstMaterial];
      v65 = [v64 ambientOcclusion];
      [v65 setIntensity:1.8];

      v66 = [MEMORY[0x263F1C550] colorWithWhite:0.5 alpha:1.0];
      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __ABLoadDeviceSceneModel_block_invoke;
      v108[3] = &unk_2652130A0;
      id v67 = v15;
      id v109 = v67;
      id v93 = v66;
      id v110 = v93;
      [&unk_26FB8E7D8 enumerateObjectsUsingBlock:v108];
      v68 = [v67 childNodeWithName:@"GxnDRwXYWLmLHLg" recursively:1];
      v69 = [v68 geometry];
      v70 = [v69 firstMaterial];

      uint64_t v71 = [v107 URLForResource:@"Action_Button_glow_modifier" withExtension:@"txt"];
      if (v71)
      {
        v72 = [NSString stringWithContentsOfURL:v71 encoding:4 error:0];
        if ([v72 length])
        {
          uint64_t v121 = *MEMORY[0x263F16BF0];
          v122[0] = v72;
          v73 = [NSDictionary dictionaryWithObjects:v122 forKeys:&v121 count:1];
          [v70 setShaderModifiers:v73];
        }
      }
      v92 = (void *)v71;
      v91 = [v67 childNodeWithName:@"gdXDpPaIpuceqyb" recursively:1];
      v74 = [v91 geometry];
      v75 = [v74 firstMaterial];
      v76 = (void *)[v75 copy];

      v77 = [v76 emission];
      [v77 setContents:0];

      v78 = [v76 emission];
      [v78 setIntensity:1.2];

      v79 = [v76 transparent];
      [v79 setContents:&unk_26FB8E568];

      if (v76)
      {
        v120 = v76;
        v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
        v81 = [v95 geometry];
        [v81 setMaterials:v80];

        v119 = v76;
        v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
        v83 = [v94 geometry];
        [v83 setMaterials:v82];
      }
      *(void *)a2 = v98;
      *(void *)(a2 + 8) = v67;
      id v84 = v67;
      id v99 = v98;
      *(void *)(a2 + 16) = [v105 childNodeWithName:@"qoBNQvAugFFloeW" recursively:1];
      *(void *)(a2 + 24) = [v84 childNodeWithName:@"GxnDRwXYWLmLHLg" recursively:1];
      *(void *)(a2 + 32) = [v84 childNodeWithName:@"crmKpCAtfjxkywa" recursively:1];
      *(void *)(a2 + 40) = [v84 childNodeWithName:@"WsgnBpfqdWTTcEN" recursively:1];
      *(void *)(a2 + 48) = v97;
      *(void *)(a2 + 56) = v95;
      *(void *)(a2 + 64) = v96;
      *(void *)(a2 + 72) = v94;
      long long v85 = *(_OWORD *)&v115.m21;
      *(_OWORD *)(a2 + 80) = *(_OWORD *)&v115.m11;
      *(_OWORD *)(a2 + 96) = v85;
      long long v86 = *(_OWORD *)&v115.m41;
      *(_OWORD *)(a2 + 112) = *(_OWORD *)&v115.m31;
      *(_OWORD *)(a2 + 128) = v86;
      id v87 = v94;
      id v88 = v96;
      id v89 = v95;
      id v90 = v97;

      double v10 = v106;
      id v3 = v107;
    }
    else
    {
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
    }
  }
  else
  {
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
}

void __ABLoadDeviceSceneModel_block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) childNodeWithName:a2 recursively:1];
  id v3 = [v9 geometry];
  uint64_t v4 = [v3 firstMaterial];

  id v5 = [v4 normal];
  [v5 setIntensity:0.2];

  uint64_t v6 = *(void *)(a1 + 40);
  v7 = [v4 diffuse];
  [v7 setContents:v6];

  char v8 = [v4 roughness];
  [v8 setIntensity:0.65];
}

__CFString *ABDeviceModelResourceName()
{
  if ((MGIsDeviceOfType() & 1) != 0 || MGIsDeviceOfType()) {
    return @"iPhone15_Pro_NaturalTitanium_v0005-D83-D84";
  }
  else {
    return @"iPhone15_Pro_NaturalTitanium_v0006-D47-D48-D93-D94";
  }
}

double ABDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

uint64_t __ABLogger_block_invoke()
{
  ABLogger_logger = (uint64_t)os_log_create("com.apple.ActionButtonSelector", "General");

  return MEMORY[0x270F9A758]();
}

void sub_247422BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id carouselItems(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [ABCarouselItem alloc];
        double v10 = objc_msgSend(v8, "image", (void)v16);
        char v11 = [v8 canBeHighlighted];
        uint64_t v12 = [v8 identifier];
        v13 = -[ABCarouselItem initWithImage:canBeHighlighted:identifier:]((id *)&v9->super.isa, v10, v11, v12);
        [v2 addObject:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  float v14 = (void *)[v2 copy];

  return v14;
}

void sub_247423ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2474240BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_247424804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double __copy_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(id *a1, id *a2)
{
  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
  objc_storeStrong(a1 + 2, a2[2]);

  *(void *)&double result = __copy_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)(a1 + 3), (uint64_t)(a2 + 3)).n128_u64[0];
  return result;
}

__n128 __copy_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  objc_storeStrong((id *)(a1 + 16), *(id *)(a2 + 16));
  objc_storeStrong((id *)(a1 + 24), *(id *)(a2 + 24));
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  objc_storeStrong((id *)(a1 + 40), *(id *)(a2 + 40));
  objc_storeStrong((id *)(a1 + 48), *(id *)(a2 + 48));
  __n128 result = *(__n128 *)(a2 + 56);
  long long v5 = *(_OWORD *)(a2 + 72);
  long long v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v6;
  *(_OWORD *)(a1 + 72) = v5;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72(id *a1)
{
  __destructor_8_s0_s8_s16_s24_s32_s40_s48((uint64_t)(a1 + 3));
}

double __copy_constructor_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];

  *(void *)&double result = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)(a1 + 3), (uint64_t)(a2 + 3)).n128_u64[0];
  return result;
}

void ABReleaseResources()
{
  v0 = +[ABDeviceSceneResourceLoader sharedLoader]();
  -[ABDeviceSceneResourceLoader releaseResources](v0);
}

void sub_2474255FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247426244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_247426F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_247427960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_247427A3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_247428A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247428C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247428D78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double ABButtonOffsetFromDeviceCenter()
{
  return -3.58;
}

double ABButtonPressDepth()
{
  return 0.031;
}

double ABButtonScreenScale()
{
  return 0.004;
}

void sub_247429F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ABDefaultZoomedOutSceneParams()
{
  if (ABDefaultZoomedOutSceneParams_onceToken != -1) {
    dispatch_once(&ABDefaultZoomedOutSceneParams_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)ABDefaultZoomedOutSceneParams_params;

  return v0;
}

void __ABDefaultZoomedOutSceneParams_block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = @"Scale";
  v2[1] = @"Rotation";
  v3[0] = &unk_26FB8E580;
  v3[1] = &unk_26FB8E598;
  v2[2] = @"xOffset";
  v2[3] = @"yOffset";
  v3[2] = &unk_26FB8E5B0;
  v3[3] = &unk_26FB8E750;
  v2[4] = @"zOffset";
  v2[5] = @"Damping";
  v3[4] = &unk_26FB8E5C8;
  v3[5] = &unk_26FB8E580;
  v2[6] = @"DampingSmooth";
  v2[7] = @"Response";
  v3[6] = &unk_26FB8E5E0;
  v3[7] = &unk_26FB8E580;
  v2[8] = @"ResponseSmooth";
  v2[9] = @"TimeFactor";
  v3[8] = &unk_26FB8E5E0;
  v3[9] = &unk_26FB8E580;
  v2[10] = @"FocusDistance";
  v2[11] = @"FocalLength";
  v3[10] = &unk_26FB8E760;
  v3[11] = &unk_26FB8E770;
  v2[12] = @"fStop";
  v2[13] = @"ApertureBlades";
  v3[12] = &unk_26FB8E780;
  v3[13] = &unk_26FB8E5F8;
  v2[14] = @"LightingIntensity";
  v2[15] = @"ZoomInProgress";
  v3[14] = &unk_26FB8E580;
  v3[15] = &unk_26FB8E5E0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  uint64_t v1 = (void *)ABDefaultZoomedOutSceneParams_params;
  ABDefaultZoomedOutSceneParams_params = v0;
}

id ABDefaultZoomedInSceneParams()
{
  if (ABDefaultZoomedInSceneParams_onceToken != -1) {
    dispatch_once(&ABDefaultZoomedInSceneParams_onceToken, &__block_literal_global_65);
  }
  uint64_t v0 = (void *)ABDefaultZoomedInSceneParams_params;

  return v0;
}

void __ABDefaultZoomedInSceneParams_block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = @"Scale";
  v2[1] = @"Rotation";
  v3[0] = &unk_26FB8E580;
  v3[1] = &unk_26FB8E610;
  v2[2] = @"xOffset";
  v2[3] = @"yOffset";
  v3[2] = &unk_26FB8E5E0;
  v3[3] = &unk_26FB8E790;
  v2[4] = @"zOffset";
  v2[5] = @"Damping";
  v3[4] = &unk_26FB8E7A0;
  v3[5] = &unk_26FB8E580;
  v2[6] = @"DampingSmooth";
  v2[7] = @"Response";
  v3[6] = &unk_26FB8E5E0;
  v3[7] = &unk_26FB8E580;
  v2[8] = @"ResponseSmooth";
  v2[9] = @"TimeFactor";
  v3[8] = &unk_26FB8E5E0;
  v3[9] = &unk_26FB8E580;
  v2[10] = @"FocusDistance";
  v2[11] = @"FocalLength";
  v3[10] = &unk_26FB8E760;
  v3[11] = &unk_26FB8E770;
  v2[12] = @"fStop";
  v2[13] = @"ApertureBlades";
  v3[12] = &unk_26FB8E780;
  v3[13] = &unk_26FB8E5F8;
  v2[14] = @"LightingIntensity";
  v2[15] = @"ZoomInProgress";
  v3[14] = &unk_26FB8E7B0;
  v3[15] = &unk_26FB8E580;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  uint64_t v1 = (void *)ABDefaultZoomedInSceneParams_params;
  ABDefaultZoomedInSceneParams_params = v0;
}

id ABWelcomeModeZoomedOutSceneParams()
{
  if (ABWelcomeModeZoomedOutSceneParams_onceToken != -1) {
    dispatch_once(&ABWelcomeModeZoomedOutSceneParams_onceToken, &__block_literal_global_75);
  }
  uint64_t v0 = (void *)ABWelcomeModeZoomedOutSceneParams_params;

  return v0;
}

void __ABWelcomeModeZoomedOutSceneParams_block_invoke()
{
  v20[16] = *MEMORY[0x263EF8340];
  uint64_t v0 = ABDefaultZoomedOutSceneParams();
  v20[0] = &unk_26FB8E580;
  uint64_t v1 = NSNumber;
  uint64_t v2 = objc_msgSend(v0, "objectForKeyedSubscript:", @"Scale", @"Rotation");
  [v2 doubleValue];
  uint64_t v4 = [v1 numberWithDouble:v3 * 0.0 + 62.0];
  v20[1] = v4;
  v19[2] = @"xOffset";
  long long v5 = NSNumber;
  long long v6 = objc_msgSend(v0, "objectForKeyedSubscript:");
  [v6 doubleValue];
  char v8 = [v5 numberWithDouble:v7 * 0.0 + 0.5];
  v20[2] = v8;
  v19[3] = @"yOffset";
  id v9 = NSNumber;
  double v10 = objc_msgSend(v0, "objectForKeyedSubscript:");
  [v10 doubleValue];
  uint64_t v12 = [v9 numberWithDouble:v11 * 0.0 + -3.35];
  v20[3] = v12;
  v19[4] = @"zOffset";
  v13 = NSNumber;
  float v14 = objc_msgSend(v0, "objectForKeyedSubscript:");
  [v14 doubleValue];
  long long v16 = [v13 numberWithDouble:v15 * 0.0 + -10.5];
  v20[4] = v16;
  v20[5] = &unk_26FB8E580;
  v19[5] = @"Damping";
  v19[6] = @"DampingSmooth";
  v19[7] = @"Response";
  v19[8] = @"ResponseSmooth";
  v19[9] = @"TimeFactor";
  v19[10] = @"FocusDistance";
  v20[10] = &unk_26FB8E760;
  v20[11] = &unk_26FB8E770;
  v19[11] = @"FocalLength";
  v19[12] = @"fStop";
  v20[12] = &unk_26FB8E780;
  v20[13] = &unk_26FB8E5F8;
  v20[6] = &unk_26FB8E5E0;
  v20[7] = &unk_26FB8E580;
  v19[13] = @"ApertureBlades";
  v19[14] = @"LightingIntensity";
  v20[8] = &unk_26FB8E5E0;
  v20[9] = &unk_26FB8E580;
  v19[15] = @"ZoomInProgress";
  v20[14] = &unk_26FB8E580;
  v20[15] = &unk_26FB8E5E0;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:16];
  long long v18 = (void *)ABWelcomeModeZoomedOutSceneParams_params;
  ABWelcomeModeZoomedOutSceneParams_params = v17;
}

id ABWelcomeModeZoomedInSceneParams()
{
  if (ABWelcomeModeZoomedInSceneParams_onceToken != -1) {
    dispatch_once(&ABWelcomeModeZoomedInSceneParams_onceToken, &__block_literal_global_78);
  }
  uint64_t v0 = (void *)ABWelcomeModeZoomedInSceneParams_params;

  return v0;
}

void __ABWelcomeModeZoomedInSceneParams_block_invoke()
{
  uint64_t v0 = ABDefaultZoomedInSceneParams();
  id v3 = (id)[v0 mutableCopy];

  [v3 setObject:&unk_26FB8E628 forKeyedSubscript:@"Response"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)ABWelcomeModeZoomedInSceneParams_params;
  ABWelcomeModeZoomedInSceneParams_params = v1;
}

id ABScrollDraggingStateParams(void *a1, void *a2, double a3, double a4)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  v28[0] = @"TimeFactor";
  v28[1] = @"Damping";
  v29[0] = &unk_26FB8E580;
  v29[1] = &unk_26FB8E580;
  v28[2] = @"DampingSmooth";
  v29[2] = &unk_26FB8E5E0;
  id v9 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  v13 = objc_opt_new();
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __transitionStateParams_block_invoke;
  v22 = &unk_265213168;
  id v23 = v11;
  id v24 = v10;
  id v25 = v13;
  double v26 = a4;
  double v27 = a3;
  id v14 = v11;
  id v15 = v10;
  id v16 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:&v19];

  uint64_t v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

id ABStateParamLimits()
{
  if (ABStateParamLimits_onceToken != -1) {
    dispatch_once(&ABStateParamLimits_onceToken, &__block_literal_global_82);
  }
  uint64_t v0 = (void *)ABStateParamLimits_limits;

  return v0;
}

void __ABStateParamLimits_block_invoke()
{
  v34[11] = *MEMORY[0x263EF8340];
  v33[0] = @"Scale";
  uint64_t v0 = [ABParameterLimits alloc];
  if (v0)
  {
    v32.receiver = v0;
    v32.super_class = (Class)ABParameterLimits;
    uint64_t v0 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v0) {
      *(_OWORD *)&v0->_minValue = xmmword_24742EAD0;
    }
  }
  double v31 = v0;
  v34[0] = v0;
  v33[1] = @"Damping";
  uint64_t v1 = [ABParameterLimits alloc];
  if (v1)
  {
    v32.receiver = v1;
    v32.super_class = (Class)ABParameterLimits;
    uint64_t v1 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v1) {
      *(_OWORD *)&v1->_minValue = xmmword_24742EAE0;
    }
  }
  BOOL v30 = v1;
  v34[1] = v1;
  v33[2] = @"DampingSmooth";
  uint64_t v2 = [ABParameterLimits alloc];
  if (v2)
  {
    v32.receiver = v2;
    v32.super_class = (Class)ABParameterLimits;
    uint64_t v2 = (ABParameterLimits *)objc_msgSendSuper2(&v32, sel_init);
    if (v2) {
      *(_OWORD *)&v2->_minValue = xmmword_24742EAE0;
    }
  }
  v29 = v2;
  v34[2] = v2;
  v33[3] = @"Response";
  id v3 = [ABParameterLimits alloc];
  if (v3)
  {
    v32.receiver = v3;
    v32.super_class = (Class)ABParameterLimits;
    uint64_t v4 = (char *)objc_msgSendSuper2(&v32, sel_init);
    long long v5 = v4;
    if (v4) {
      *(_OWORD *)(v4 + 8) = xmmword_24742EAE0;
    }
  }
  else
  {
    long long v5 = 0;
  }
  v34[3] = v5;
  v33[4] = @"ResponseSmooth";
  long long v6 = [ABParameterLimits alloc];
  if (v6)
  {
    v32.receiver = v6;
    v32.super_class = (Class)ABParameterLimits;
    id v7 = (char *)objc_msgSendSuper2(&v32, sel_init);
    id v8 = v7;
    if (v7) {
      *(_OWORD *)(v7 + 8) = xmmword_24742EAE0;
    }
  }
  else
  {
    id v8 = 0;
  }
  v34[4] = v8;
  v33[5] = @"TimeFactor";
  id v9 = [ABParameterLimits alloc];
  if (v9)
  {
    v32.receiver = v9;
    v32.super_class = (Class)ABParameterLimits;
    id v10 = (char *)objc_msgSendSuper2(&v32, sel_init);
    id v11 = v10;
    if (v10) {
      *(_OWORD *)(v10 + 8) = xmmword_24742EAE0;
    }
  }
  else
  {
    id v11 = 0;
  }
  v34[5] = v11;
  v33[6] = @"FocusDistance";
  id v12 = [ABParameterLimits alloc];
  if (v12)
  {
    v32.receiver = v12;
    v32.super_class = (Class)ABParameterLimits;
    v13 = (char *)objc_msgSendSuper2(&v32, sel_init);
    id v14 = v13;
    if (v13) {
      *(_OWORD *)(v13 + 8) = xmmword_24742EAD0;
    }
  }
  else
  {
    id v14 = 0;
  }
  v34[6] = v14;
  v33[7] = @"FocalLength";
  id v15 = [ABParameterLimits alloc];
  if (v15)
  {
    v32.receiver = v15;
    v32.super_class = (Class)ABParameterLimits;
    id v16 = (char *)objc_msgSendSuper2(&v32, sel_init);
    uint64_t v17 = v16;
    if (v16) {
      *(_OWORD *)(v16 + 8) = xmmword_24742EAD0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  v34[7] = v17;
  v33[8] = @"ApertureBlades";
  long long v18 = [ABParameterLimits alloc];
  if (v18)
  {
    v32.receiver = v18;
    v32.super_class = (Class)ABParameterLimits;
    uint64_t v19 = (char *)objc_msgSendSuper2(&v32, sel_init);
    uint64_t v20 = v19;
    if (v19) {
      *(_OWORD *)(v19 + 8) = xmmword_24742EAE0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  v34[8] = v20;
  v33[9] = @"fStop";
  uint64_t v21 = [ABParameterLimits alloc];
  if (v21)
  {
    v32.receiver = v21;
    v32.super_class = (Class)ABParameterLimits;
    v22 = (char *)objc_msgSendSuper2(&v32, sel_init);
    id v23 = v22;
    if (v22) {
      *(_OWORD *)(v22 + 8) = xmmword_24742EAD0;
    }
  }
  else
  {
    id v23 = 0;
  }
  v34[9] = v23;
  v33[10] = @"LightingIntensity";
  id v24 = [ABParameterLimits alloc];
  if (v24)
  {
    v32.receiver = v24;
    v32.super_class = (Class)ABParameterLimits;
    id v25 = (char *)objc_msgSendSuper2(&v32, sel_init);
    double v26 = v25;
    if (v25) {
      *(_OWORD *)(v25 + 8) = xmmword_24742EAE0;
    }
  }
  else
  {
    double v26 = 0;
  }
  v34[10] = v26;
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:11];
  BOOL v28 = (void *)ABStateParamLimits_limits;
  ABStateParamLimits_limits = v27;
}

void __transitionStateParams_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v23];
  if (v6)
  {
    [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v23];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v23];
    [v7 doubleValue];
    double v9 = v8;
    [v5 doubleValue];
    double v11 = (v9 - v10) * *(double *)(a1 + 56);

    id v12 = ABStateParamLimits();
    v13 = [v12 objectForKeyedSubscript:v23];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = +[ABParameterLimits unlimited]();
    }
    id v16 = (double *)v15;

    uint64_t v17 = NSNumber;
    [v5 doubleValue];
    double v19 = v18 + v11 * *(double *)(a1 + 64);
    if (v16)
    {
      double v20 = v16[1];
      double v21 = v16[2];
    }
    else
    {
      double v20 = 0.0;
      double v21 = 0.0;
    }
    v22 = objc_msgSend(v17, "numberWithDouble:", ABClamp(v19, v20, v21));
    [*(id *)(a1 + 48) setObject:v22 forKeyedSubscript:v23];
  }
}

float64x2_t SCNMatrix4FromCATransform3D@<Q0>(float64x2_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t v2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[2]), a1[3]);
  *a2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*a1), a1[1]);
  a2[1] = v2;
  float64x2_t result = a1[7];
  float32x4_t v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[6]), result);
  a2[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[4]), a1[5]);
  a2[3] = v4;
  return result;
}

float64x2_t CATransform3DFromSCNMatrix4@<Q0>(float32x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t v2 = vcvtq_f64_f32(a1[1]);
  *a2 = vcvtq_f64_f32(*a1);
  a2[1] = v2;
  float64x2_t v3 = vcvtq_f64_f32(a1[3]);
  a2[2] = vcvtq_f64_f32(a1[2]);
  a2[3] = v3;
  float64x2_t v4 = vcvtq_f64_f32(a1[5]);
  a2[4] = vcvtq_f64_f32(a1[4]);
  a2[5] = v4;
  float64x2_t result = vcvtq_f64_f32(a1[6]);
  float64x2_t v6 = vcvtq_f64_f32(a1[7]);
  a2[6] = result;
  a2[7] = v6;
  return result;
}

double ABClamp(double result, double a2, double a3)
{
  if (result >= a3) {
    float64x2_t result = a3;
  }
  if (result < a2) {
    return a2;
  }
  return result;
}

uint64_t ABEqualObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqual:v4];
    }
  }

  return v6;
}

uint64_t ABHighFrameRateUpdateReasonMake(uint64_t result)
{
  return result;
}

float ABFrameRateRange()
{
  LODWORD(result) = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return result;
}

id ABSnapshotImageName(int a1)
{
  float64x2_t v2 = deviceSuffix();
  if (v2)
  {
    id v3 = NSString;
    if (a1) {
      id v4 = @"assistant";
    }
    else {
      id v4 = @"settings";
    }
    id v5 = deviceSuffix();
    uint64_t v6 = [v3 stringWithFormat:@"scene_snapshot_%@-%@.png", v4, v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

__CFString *deviceSuffix()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v18 = -781324731;
  long long v17 = xmmword_24742EB10;
  uint64_t v0 = @"D84";
  if ((MGIsDeviceOfType() & 1) == 0)
  {
    int v16 = 1874287171;
    long long v15 = xmmword_24742EB24;
    uint64_t v0 = @"D83";
    if ((MGIsDeviceOfType() & 1) == 0)
    {
      int v14 = 1214880059;
      long long v13 = xmmword_24742EB38;
      if (MGIsDeviceOfType())
      {
        uint64_t v0 = @"D93";
      }
      else
      {
        int v12 = 426359977;
        long long v11 = xmmword_24742EB4C;
        if (MGIsDeviceOfType())
        {
          uint64_t v0 = @"D94";
        }
        else
        {
          int v10 = 1223847566;
          long long v9 = xmmword_24742EB60;
          if (MGIsDeviceOfType())
          {
            uint64_t v0 = @"D47";
          }
          else
          {
            int v8 = 185580364;
            long long v7 = xmmword_24742EB74;
            if (MGIsDeviceOfType())
            {
              uint64_t v0 = @"D48";
            }
            else
            {
              uint64_t v1 = ABLogger();
              if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v6 = 0;
                _os_log_impl(&dword_24741F000, v1, OS_LOG_TYPE_DEFAULT, "Unsupported device. Fallback to using screen size.", v6, 2u);
              }

              float64x2_t v2 = [MEMORY[0x263F1C920] mainScreen];
              [v2 bounds];
              if (v3 == 932.0) {
                id v4 = @"D84";
              }
              else {
                id v4 = @"D83";
              }
              uint64_t v0 = v4;
            }
          }
        }
      }
    }
  }

  return v0;
}

__CFString *ABDisplayPackageName()
{
  return @"Display";
}

void sub_24742D0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

SCNMatrix4 *__cdecl SCNMatrix4Invert(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *m)
{
  return (SCNMatrix4 *)MEMORY[0x270EFD278](retstr, m);
}

SCNMatrix4 *__cdecl SCNMatrix4MakeRotation(SCNMatrix4 *__return_ptr retstr, float angle, float x, float y, float z)
{
  return (SCNMatrix4 *)MEMORY[0x270EFD280](retstr, angle, x, y, z);
}

SCNMatrix4 *__cdecl SCNMatrix4Mult(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *a, SCNMatrix4 *b)
{
  return (SCNMatrix4 *)MEMORY[0x270EFD288](retstr, a, b);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}