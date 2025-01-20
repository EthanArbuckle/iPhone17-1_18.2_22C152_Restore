@interface PHASEMaterial
+ (PHASEMaterial)new;
- (Handle64)geoMaterialHandle;
- (PHASEAbsorptionData)absorptionData;
- (PHASEMaterial)init;
- (PHASEMaterial)initWithEngine:(PHASEEngine *)engine preset:(PHASEMaterialPreset)preset;
- (PHASEMaterial)initWithEngine:(id)a3 parameterTypes:(unint64_t)a4 semantics:(id)a5;
- (PHASEMaterial)initWithEngine:(id)a3 preset:(int64_t)a4 soundReductionIndex:(id)a5 absorptionData:(id)a6 scatteringData:(id)a7;
- (PHASEMaterial)initWithEngine:(id)a3 semantics:(id)a4;
- (PHASEMaterial)initWithEngine:(id)a3 soundReductionIndex:(id)a4 absorptionData:(id)a5 scatteringData:(id)a6;
- (PHASEScatteringData)scatteringData;
- (PHASESoundReductionIndex)soundReductionIndex;
- (float)attenuationScale;
- (float)attenuationShift;
- (float)attenuationTilt;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preset;
- (void)dealloc;
- (void)setAttenuationScale:(float)a3;
- (void)setAttenuationShift:(float)a3;
- (void)setAttenuationTilt:(float)a3;
- (void)setGeoMaterialHandle:(Handle64)a3;
- (void)writeMaterialCoefs:(BOOL)a3;
@end

@implementation PHASEMaterial

- (PHASEMaterial)init
{
  return 0;
}

+ (PHASEMaterial)new
{
  return 0;
}

- (PHASEMaterial)initWithEngine:(PHASEEngine *)engine preset:(PHASEMaterialPreset)preset
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  v111 = engine;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = (Phase::Logger *)objc_opt_class();
  if (!v6)
  {
    v16 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 729;
      _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [Database not found] - Returning default material.", buf, 0x12u);
    }
    v17 = +[PHASESoundReductionIndex objectForDefault];
    v18 = +[PHASEAbsorptionData objectForDefault];
    v19 = +[PHASEScatteringData objectForDefault];
    self = [(PHASEMaterial *)self initWithEngine:v111 preset:preset soundReductionIndex:v17 absorptionData:v18 scatteringData:v19];

    goto LABEL_26;
  }
  if (preset <= 1833071210)
  {
    switch(preset)
    {
      case 0:
        uint64_t v7 = *MEMORY[0x263F23168];
        id v136 = 0;
        uint64_t v110 = v7;
        v8 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v9 = v136;
        [v5 addEntriesFromDictionary:v8];

        uint64_t v10 = *MEMORY[0x263F23170];
        id v135 = 0;
        uint64_t v109 = v10;
        v11 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v12 = v135;

        [v5 addEntriesFromDictionary:v11];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v134 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Default" error:&v134];
        id v15 = v134;

        [v5 addEntriesFromDictionary:v14];
        goto LABEL_22;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_20;
      case 4:
        goto LABEL_17;
      case 5:
        goto LABEL_18;
      case 6:
        uint64_t v56 = *MEMORY[0x263F23168];
        id v121 = 0;
        uint64_t v110 = v56;
        v57 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v58 = v121;
        [v5 addEntriesFromDictionary:v57];

        uint64_t v59 = *MEMORY[0x263F23170];
        id v120 = 0;
        uint64_t v109 = v59;
        v60 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v61 = v120;

        [v5 addEntriesFromDictionary:v60];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v119 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Drywall_SingleSheet" error:&v119];
        id v15 = v119;

        [v5 addEntriesFromDictionary:v14];
        goto LABEL_22;
      case 7:
        goto LABEL_19;
      case 10:
        goto LABEL_16;
      default:
        goto LABEL_40;
    }
  }
  if (preset > 1833202294)
  {
    switch(preset)
    {
      case PHASEMaterialPresetDrywall:
LABEL_19:
        uint64_t v44 = *MEMORY[0x263F23168];
        id v118 = 0;
        uint64_t v110 = v44;
        v45 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v46 = v118;
        [v5 addEntriesFromDictionary:v45];

        uint64_t v47 = *MEMORY[0x263F23170];
        id v117 = 0;
        uint64_t v109 = v47;
        v48 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v49 = v117;

        [v5 addEntriesFromDictionary:v48];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v116 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Drywall_DoubleSheet" error:&v116];
        id v15 = v116;

        [v5 addEntriesFromDictionary:v14];
        break;
      case PHASEMaterialPresetGlass:
LABEL_20:
        uint64_t v50 = *MEMORY[0x263F23168];
        id v130 = 0;
        uint64_t v110 = v50;
        v51 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v52 = v130;
        [v5 addEntriesFromDictionary:v51];

        uint64_t v53 = *MEMORY[0x263F23170];
        id v129 = 0;
        uint64_t v109 = v53;
        v54 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v55 = v129;

        [v5 addEntriesFromDictionary:v54];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v128 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Window_SinglePane" error:&v128];
        id v15 = v128;

        [v5 addEntriesFromDictionary:v14];
        break;
      case PHASEMaterialPresetWood:
LABEL_16:
        uint64_t v26 = *MEMORY[0x263F23168];
        id v115 = 0;
        uint64_t v110 = v26;
        v27 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v28 = v115;
        [v5 addEntriesFromDictionary:v27];

        uint64_t v29 = *MEMORY[0x263F23170];
        id v114 = 0;
        uint64_t v109 = v29;
        v30 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v31 = v114;

        [v5 addEntriesFromDictionary:v30];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v113 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Wall_Wood_Medium_BT15 mm_150mm" error:&v113];
        id v15 = v113;

        [v5 addEntriesFromDictionary:v14];
        break;
      default:
        goto LABEL_40;
    }
  }
  else
  {
    switch(preset)
    {
      case PHASEMaterialPresetBrick:
LABEL_17:
        uint64_t v32 = *MEMORY[0x263F23168];
        id v127 = 0;
        uint64_t v110 = v32;
        v33 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v34 = v127;
        [v5 addEntriesFromDictionary:v33];

        uint64_t v35 = *MEMORY[0x263F23170];
        id v126 = 0;
        uint64_t v109 = v35;
        v36 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v37 = v126;

        [v5 addEntriesFromDictionary:v36];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v125 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Brickwork_General" error:&v125];
        id v15 = v125;

        [v5 addEntriesFromDictionary:v14];
        break;
      case PHASEMaterialPresetConcrete:
LABEL_18:
        uint64_t v38 = *MEMORY[0x263F23168];
        id v124 = 0;
        uint64_t v110 = v38;
        v39 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v40 = v124;
        [v5 addEntriesFromDictionary:v39];

        uint64_t v41 = *MEMORY[0x263F23170];
        id v123 = 0;
        uint64_t v109 = v41;
        v42 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v43 = v123;

        [v5 addEntriesFromDictionary:v42];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v122 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Wall_Concrete_Thickness_GT200mm" error:&v122];
        id v15 = v122;

        [v5 addEntriesFromDictionary:v14];
        break;
      case PHASEMaterialPresetCardboard:
LABEL_12:
        uint64_t v20 = *MEMORY[0x263F23168];
        id v133 = 0;
        uint64_t v110 = v20;
        v21 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v22 = v133;
        [v5 addEntriesFromDictionary:v21];

        uint64_t v23 = *MEMORY[0x263F23170];
        id v132 = 0;
        uint64_t v109 = v23;
        v24 = objc_msgSend(MEMORY[0x263F231A0], "acousticParameters:forMaterialName:error:");
        id v25 = v132;

        [v5 addEntriesFromDictionary:v24];
        uint64_t v13 = *MEMORY[0x263F23178];
        id v131 = 0;
        v14 = [MEMORY[0x263F231A0] acousticParameters:v13 forMaterialName:@"Cardboard_3mm" error:&v131];
        id v15 = v131;

        [v5 addEntriesFromDictionary:v14];
        break;
      default:
LABEL_40:
        v98 = **(id **)(Phase::Logger::GetInstance(v6) + 432);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v138 = "PHASEMaterial.mm";
          __int16 v139 = 1024;
          int v140 = 642;
          _os_log_impl(&dword_221E5E000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d Preset enumeration not found. Would only be caused by invalid use of API.", buf, 0x12u);
        }
        goto LABEL_58;
    }
  }
LABEL_22:

  if (v15)
  {
    v63 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v62)
                                                                                        + 432)));
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = [v15 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 719;
      __int16 v141 = 2112;
      v142 = v64;
      _os_log_impl(&dword_221E5E000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@] - Returning default material.", buf, 0x1Cu);
    }
    v65 = +[PHASESoundReductionIndex objectForDefault];
    v66 = +[PHASEAbsorptionData objectForDefault];
    v67 = +[PHASEScatteringData objectForDefault];
    self = [(PHASEMaterial *)self initWithEngine:v111 preset:preset soundReductionIndex:v65 absorptionData:v66 scatteringData:v67];

    goto LABEL_26;
  }
  if (!v5)
  {
    v69 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v62)
                                                                                        + 432)));
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v95 = [0 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 661;
      __int16 v141 = 2112;
      v142 = v95;
      _os_log_impl(&dword_221E5E000, v69, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);
    }
    goto LABEL_57;
  }
  v69 = [v5 objectForKey:v110];
  uint64_t v70 = [v5 objectForKey:v109];
  v71 = [v5 objectForKey:v13];
  v72 = v71;
  v108 = (void *)v70;
  if (!v69)
  {
    v69 = v70;
    v96 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v71)
                                                                                        + 432)));
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v97 = [0 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 678;
      __int16 v141 = 2112;
      v142 = v97;
      _os_log_impl(&dword_221E5E000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);
    }
    goto LABEL_39;
  }
  v73 = [PHASEAbsorptionData alloc];
  v74 = [v69 absorptionReferenceData];
  v75 = [v69 frequencyBands];
  v76 = v108;
  v77 = [(PHASEAbsorptionData *)v73 initWithAbsorptionCoefficients:v74 frequencyBands:v75];
  [v5 setObject:v77 forKeyedSubscript:v110];

  v78 = [v5 objectForKeyedSubscript:v110];
  LODWORD(v74) = v78 == 0;

  if (v74)
  {
    v99 = **(id **)(Phase::Logger::GetInstance(v79) + 432);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 672;
      _os_log_impl(&dword_221E5E000, v99, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASEAbsorptionData.", buf, 0x12u);
    }
    goto LABEL_56;
  }
  if (!v108)
  {
    v96 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v79)
                                                                                        + 432)));
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v100 = [0 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 695;
      __int16 v141 = 2112;
      v142 = v100;
      _os_log_impl(&dword_221E5E000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);
    }
LABEL_39:

LABEL_57:
LABEL_58:
    v68 = 0;
    goto LABEL_59;
  }
  v80 = [PHASEScatteringData alloc];
  v106 = [v108 scatteringReferenceData];
  v81 = [v108 frequencyBands];
  v82 = [(PHASEScatteringData *)v80 initWithScatteringCoefficients:v106 frequencyBands:v81];
  [v5 setObject:v82 forKeyedSubscript:v109];

  v83 = [v5 objectForKeyedSubscript:v109];
  BOOL v84 = v83 == 0;

  if (v84)
  {
    v101 = **(id **)(Phase::Logger::GetInstance(v85) + 432);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 689;
      _os_log_impl(&dword_221E5E000, v101, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASEScatteringData.", buf, 0x12u);
    }
    goto LABEL_56;
  }
  if (!v72)
  {
    v102 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v85)
                                                                                         + 432)));
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v103 = [0 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 713;
      __int16 v141 = 2112;
      v142 = v103;
      _os_log_impl(&dword_221E5E000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);
    }
    goto LABEL_57;
  }
  v86 = [PHASESoundReductionIndex alloc];
  v107 = [(Phase::Logger *)v72 soundReductionIndexReferenceData];
  v87 = [(Phase::Logger *)v72 frequencyBands];
  v76 = v108;
  v88 = [(Phase::Logger *)v72 materialDepth];
  [v88 floatValue];
  v89 = -[PHASESoundReductionIndex initWithSoundReductionIndices:frequencyBands:measuredDepth:](v86, "initWithSoundReductionIndices:frequencyBands:measuredDepth:", v107, v87);
  [v5 setObject:v89 forKeyedSubscript:v13];

  v90 = [v5 objectForKeyedSubscript:v13];
  LODWORD(v88) = v90 == 0;

  if (v88)
  {
    v104 = **(id **)(Phase::Logger::GetInstance(v91) + 432);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      __int16 v139 = 1024;
      int v140 = 707;
      _os_log_impl(&dword_221E5E000, v104, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASESoundReductionIndex.", buf, 0x12u);
    }
LABEL_56:

    goto LABEL_57;
  }

  v92 = [v5 objectForKey:v13];
  v93 = [v5 objectForKey:v110];
  v94 = [v5 objectForKey:v109];
  self = [(PHASEMaterial *)self initWithEngine:v111 preset:preset soundReductionIndex:v92 absorptionData:v93 scatteringData:v94];

LABEL_26:
  v68 = self;
LABEL_59:

  return v68;
}

- (PHASEMaterial)initWithEngine:(id)a3 preset:(int64_t)a4 soundReductionIndex:(id)a5 absorptionData:(id)a6 scatteringData:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (Phase::Logger *)a7;
  v16 = v15;
  if (v13 && v14 && v15)
  {
    v21.receiver = self;
    v21.super_class = (Class)PHASEMaterial;
    v17 = [(PHASEMaterial *)&v21 init];
    v18 = v17;
    if (v17)
    {
      objc_storeWeak((id *)&v17->_engine, v12);
      v18->_preset = a4;
      objc_storeStrong((id *)&v18->_soundReductionIndex, a5);
      objc_storeStrong((id *)&v18->_absorptionData, a6);
      objc_storeStrong((id *)&v18->_scatteringData, a7);
      *(void *)&v18->_attenuationScale = 1065353216;
      v18->_attenuationTilt = 0.0;
      [(PHASEMaterial *)v18 writeMaterialCoefs:1];
    }
  }
  else
  {
    v19 = **(id **)(Phase::Logger::GetInstance(v15) + 432);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "PHASEMaterial.mm";
      __int16 v24 = 1024;
      int v25 = 753;
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Cannot initialize a PHASEMaterial without valid SRI, absorption and scattering data!", buf, 0x12u);
    }

    v18 = 0;
  }

  return v18;
}

- (PHASEMaterial)initWithEngine:(id)a3 soundReductionIndex:(id)a4 absorptionData:(id)a5 scatteringData:(id)a6
{
  id v10 = a3;
  v11 = (PHASESoundReductionIndex *)a4;
  id v12 = (PHASEAbsorptionData *)a5;
  id v13 = (PHASEScatteringData *)a6;
  id v14 = v13;
  if (v11 && v12 && v13) {
    goto LABEL_22;
  }
  sGetFrequencies((uint64_t)__p);
  if (v11)
  {
    if (v12) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v23 = objc_opt_new();
    for (uint64_t i = 0; i != 124; i += 4)
    {
      int v25 = [PHASESubband alloc];
      LODWORD(v26) = *(_DWORD *)((char *)__p[0] + i);
      v27 = [(PHASESubband *)v25 initWithFrequency:v26 value:0.0];
      [v23 addObject:v27];
    }
    id v12 = [[PHASEAbsorptionData alloc] initWithAbsorptionCoefficients:v23];

    if (v14) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  id v15 = objc_opt_new();
  for (uint64_t j = 0; j != 124; j += 4)
  {
    v17 = [PHASESubband alloc];
    LODWORD(v18) = *(_DWORD *)((char *)__p[0] + j);
    LODWORD(v19) = 1.0;
    uint64_t v20 = [(PHASESubband *)v17 initWithFrequency:v18 value:v19];
    [v15 addObject:v20];
  }
  objc_super v21 = [PHASESoundReductionIndex alloc];
  LODWORD(v22) = 1041865114;
  v11 = [(PHASESoundReductionIndex *)v21 initWithAttenuationCoefficients:v15 measuredDepth:v22];

  if (!v12) {
    goto LABEL_11;
  }
LABEL_6:
  if (!v14)
  {
LABEL_14:
    id v28 = objc_opt_new();
    for (uint64_t k = 0; k != 124; k += 4)
    {
      v30 = [PHASESubband alloc];
      LODWORD(v31) = *(_DWORD *)((char *)__p[0] + k);
      uint64_t v32 = [(PHASESubband *)v30 initWithFrequency:v31 value:0.0];
      [v28 addObject:v32];
    }
    v33 = [[PHASEScatteringData alloc] initWithScatteringCoefficients:v28];

    id v14 = v33;
  }
LABEL_17:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (!v11 || !v12 || !v14) {
    std::terminate();
  }
LABEL_22:
  id v34 = [(PHASEMaterial *)self initWithEngine:v10 preset:1833136740 soundReductionIndex:v11 absorptionData:v12 scatteringData:v14];

  return v34;
}

- (PHASEMaterial)initWithEngine:(id)a3 parameterTypes:(unint64_t)a4 semantics:(id)a5
{
  return [(PHASEMaterial *)self initWithEngine:a3 semantics:a5];
}

- (PHASEMaterial)initWithEngine:(id)a3 semantics:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v74 = a3;
  id v86 = a4;
  if (!objc_opt_class())
  {
    double v19 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "PHASEMaterial.mm";
      __int16 v100 = 1024;
      int v101 = 996;
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [Database not found] - Falling back to default material.", buf, 0x12u);
    }
    v76 = +[PHASESoundReductionIndex objectForDefault];
    id v87 = +[PHASEAbsorptionData objectForDefault];
    obunint64_t j = +[PHASEScatteringData objectForDefault];
    double v18 = -[PHASEMaterial initWithEngine:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:soundReductionIndex:absorptionData:scatteringData:", v74, v76, v87);
    self = v18;
    goto LABEL_67;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v82 = *MEMORY[0x263F23168];
  v76 = v5;
  objc_msgSend(v5, "addObject:");
  uint64_t v78 = *MEMORY[0x263F23170];
  objc_msgSend(v5, "addObject:");
  uint64_t v75 = *MEMORY[0x263F23178];
  objc_msgSend(v5, "addObject:");
  id v87 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obunint64_t j = [v86 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v94;
    uint64_t v83 = *MEMORY[0x263F23188];
    uint64_t v8 = *MEMORY[0x263F23180];
    uint64_t v9 = *MEMORY[0x263F23198];
    uint64_t v10 = *MEMORY[0x263F23190];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v94 != v7) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        if ([v12 isEqualToString:@"SurfaceMaterial"])
        {
          id v13 = [v86 objectForKeyedSubscript:v12];
          [v87 setObject:v13 forKey:v10];
        }
        else if ([v12 isEqualToString:@"ARMeshMaterialID"])
        {
          id v13 = [v86 objectForKeyedSubscript:v12];
          [v87 setObject:v13 forKey:v9];
        }
        else if ([v12 isEqualToString:@"Object"])
        {
          id v13 = [v86 objectForKeyedSubscript:v12];
          [v87 setObject:v13 forKey:v8];
        }
        else
        {
          id v14 = (Phase::Logger *)[v12 isEqualToString:@"ARMeshClassificationID"];
          if (!v14)
          {
            uint64_t v20 = **(id **)(Phase::Logger::GetInstance(v14) + 432);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v99 = "PHASEMaterial.mm";
              __int16 v100 = 1024;
              int v101 = 872;
              __int16 v102 = 2112;
              v103 = v12;
              _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Query contains unrecognized key [%@].", buf, 0x1Cu);
            }
            double v18 = 0;
            goto LABEL_67;
          }
          id v13 = [v86 objectForKeyedSubscript:v12];
          [v87 setObject:v13 forKey:v83];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v6);
  }

  id v15 = [NSDictionary dictionary];
  id v92 = 0;
  BOOL v84 = [MEMORY[0x263F231A0] acousticParameters:v5 forSemanticLabels:v87 error:&v92];
  obunint64_t j = v92;

  if (obj)
  {
    log = (PHASEAbsorptionData *)**(id **)(Phase::Logger::GetInstance(v16) + 432);
    if (os_log_type_enabled(&log->super, OS_LOG_TYPE_ERROR))
    {
      v17 = [obj localizedDescription];
      *(_DWORD *)buf = 136315650;
      v99 = "PHASEMaterial.mm";
      __int16 v100 = 1024;
      int v101 = 990;
      __int16 v102 = 2112;
      v103 = v17;
      _os_log_impl(&dword_221E5E000, &log->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);
    }
    double v18 = 0;
    goto LABEL_66;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v73 = [v84 allKeys];
  uint64_t v21 = [v73 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (!v21)
  {

    goto LABEL_69;
  }
  v71 = 0;
  v72 = 0;
  uint64_t v80 = *(void *)v89;
  log = 0;
LABEL_29:
  uint64_t v79 = v21;
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v89 != v80) {
      objc_enumerationMutation(v73);
    }
    uint64_t v23 = *(void **)(*((void *)&v88 + 1) + 8 * v22);
    if (objc_msgSend(v23, "isEqualToString:", v82, v71))
    {
      __int16 v24 = [v84 objectForKey:v82];
      if (!v24)
      {
        v68 = **(id **)(Phase::Logger::GetInstance(0) + 432);
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          goto LABEL_64;
        }
        *(_DWORD *)buf = 136315394;
        v99 = "PHASEMaterial.mm";
        __int16 v100 = 1024;
        int v101 = 913;
        v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeAbsorption.";
        goto LABEL_63;
      }
      int v25 = objc_opt_new();
      for (unint64_t j = 0; ; ++j)
      {
        v27 = [v24 frequencyBands];
        BOOL v28 = [v27 count] > j;

        if (!v28) {
          break;
        }
        uint64_t v29 = [PHASESubband alloc];
        v30 = [v24 frequencyBands];
        double v31 = [v30 objectAtIndexedSubscript:j];
        [v31 floatValue];
        int v33 = v32;
        id v34 = [v24 absorptionUserData];
        uint64_t v35 = [v34 objectAtIndexedSubscript:j];
        [v35 floatValue];
        LODWORD(v37) = v36;
        LODWORD(v38) = v33;
        v39 = [(PHASESubband *)v29 initWithFrequency:v38 value:v37];
        [v25 addObject:v39];
      }
      v54 = log;
      log = [[PHASEAbsorptionData alloc] initWithAbsorptionCoefficients:v25];
      goto LABEL_50;
    }
    if ([v23 isEqualToString:v78])
    {
      __int16 v24 = [v84 objectForKey:v78];
      if (!v24)
      {
        v68 = **(id **)(Phase::Logger::GetInstance(0) + 432);
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          goto LABEL_64;
        }
        *(_DWORD *)buf = 136315394;
        v99 = "PHASEMaterial.mm";
        __int16 v100 = 1024;
        int v101 = 940;
        v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeScattering.";
        goto LABEL_63;
      }
      int v25 = objc_opt_new();
      for (unint64_t k = 0; ; ++k)
      {
        uint64_t v41 = [v24 frequencyBands];
        BOOL v42 = [v41 count] > k;

        if (!v42) {
          break;
        }
        id v43 = [PHASESubband alloc];
        uint64_t v44 = [v24 frequencyBands];
        v45 = [v44 objectAtIndexedSubscript:k];
        [v45 floatValue];
        int v47 = v46;
        v48 = [v24 scatteringUserData];
        id v49 = [v48 objectAtIndexedSubscript:k];
        [v49 floatValue];
        LODWORD(v51) = v50;
        LODWORD(v52) = v47;
        uint64_t v53 = [(PHASESubband *)v43 initWithFrequency:v52 value:v51];
        [v25 addObject:v53];
      }
      v54 = v72;
      v72 = [[PHASEScatteringData alloc] initWithScatteringCoefficients:v25];
      goto LABEL_50;
    }
    id v55 = (Phase::Logger *)[v23 isEqualToString:v75];
    if (!v55) {
      break;
    }
    __int16 v24 = [v84 objectForKey:v75];
    if (v24)
    {
      int v25 = objc_opt_new();
      for (unint64_t m = 0; ; ++m)
      {
        v57 = [v24 frequencyBands];
        BOOL v58 = [v57 count] > m;

        if (!v58) {
          break;
        }
        uint64_t v59 = [v24 soundReductionIndexUserData];
        v60 = [v59 objectAtIndexedSubscript:m];
        [v60 floatValue];
        expf((float)((float)(fmaxf(v61, 0.0) * -10.0) / 10.0) * 0.11513);

        v62 = [PHASESubband alloc];
        v63 = [v24 frequencyBands];
        v64 = [v63 objectAtIndexedSubscript:m];
        [v64 floatValue];
        v65 = -[PHASESubband initWithFrequency:value:](v62, "initWithFrequency:value:");
        [v25 addObject:v65];
      }
      v66 = [PHASESoundReductionIndex alloc];
      v54 = [v24 materialDepth];
      [v54 floatValue];
      uint64_t v67 = -[PHASESoundReductionIndex initWithAttenuationCoefficients:measuredDepth:](v66, "initWithAttenuationCoefficients:measuredDepth:", v25);

      v71 = (void *)v67;
LABEL_50:
    }
    if (++v22 == v79)
    {
      uint64_t v21 = [v73 countByEnumeratingWithState:&v88 objects:v97 count:16];
      if (!v21)
      {

        if (log && v72 && v71)
        {
          double v18 = [(PHASEMaterial *)self initWithEngine:v74 soundReductionIndex:v71 absorptionData:log scatteringData:v72];
          self = v18;
          goto LABEL_65;
        }
LABEL_69:
        std::terminate();
      }
      goto LABEL_29;
    }
  }
  v68 = **(id **)(Phase::Logger::GetInstance(v55) + 432);
  if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
    goto LABEL_64;
  }
  *(_DWORD *)buf = 136315394;
  v99 = "PHASEMaterial.mm";
  __int16 v100 = 1024;
  int v101 = 974;
  v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeSoundReductionIndex.";
LABEL_63:
  _os_log_impl(&dword_221E5E000, v68, OS_LOG_TYPE_ERROR, v69, buf, 0x12u);
LABEL_64:

  double v18 = 0;
LABEL_65:

LABEL_66:
LABEL_67:

  return v18;
}

- (void)writeMaterialCoefs:(BOOL)a3
{
  BOOL v3 = a3;
  v31[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    soundReductionIndex = self->_soundReductionIndex;
    if (soundReductionIndex)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v7 = [(PHASESoundReductionIndex *)soundReductionIndex attenuationCoefficients];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            [v11 value];
            [v11 frequency];
            log2f(v12 / 632.46);
            id v13 = [PHASESubband alloc];
            [v11 frequency];
            id v14 = -[PHASESubband initWithFrequency:value:](v13, "initWithFrequency:value:");
            [v5 addObject:v14];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v8);
      }
    }
    id v15 = v5;
    *(void *)buf = v15;
    *(void *)&buf[8] = self->_soundReductionIndex;
    *(void *)&buf[16] = self->_absorptionData;
    *(void *)&buf[24] = self->_scatteringData;
    if (v3)
    {
      uint64_t v16 = [WeakRetained implementation];
      [(PHASEMaterial *)self setGeoMaterialHandle:(*(uint64_t (**)(void, unsigned char *))(**(void **)(v16 + 368) + 32))(*(void *)(v16 + 368), buf)];
    }
    else
    {
      uint64_t v22 = *(void *)([WeakRetained implementation] + 368);
      (*(void (**)(uint64_t, uint64_t, unsigned char *))(*(void *)v22 + 88))(v22, [(PHASEMaterial *)self geoMaterialHandle], buf);
    }
  }
  else
  {
    uint64_t v17 = *MEMORY[0x263F08320];
    uint64_t v30 = *MEMORY[0x263F08320];
    double v18 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v31[0] = v18;
    id v15 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];

    uint64_t v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v19)
                                                                                        + 432)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [v15 objectForKeyedSubscript:v17];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "PHASEMaterial.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1012;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = [v21 UTF8String];
      _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
  }
}

- (void)setAttenuationScale:(float)a3
{
  float v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3 < 0.0)
  {
    id v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      uint64_t v7 = "PHASEMaterial.mm";
      __int16 v8 = 1024;
      int v9 = 1049;
      __int16 v10 = 2048;
      double v11 = v3;
      _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input multipler %2.2f for setattenuationScale must be non-negative. Clamping.", (uint8_t *)&v6, 0x1Cu);
    }
    float v3 = fmaxf(v3, 0.0);
  }
  if (self->_attenuationScale != v3)
  {
    self->_attenuationScale = v3;
    [(PHASEMaterial *)self writeMaterialCoefs:0];
  }
}

- (void)setAttenuationShift:(float)a3
{
  float v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 < -1.0 || a3 > 1.0)
  {
    int v6 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315650;
      __int16 v8 = "PHASEMaterial.mm";
      __int16 v9 = 1024;
      int v10 = 1065;
      __int16 v11 = 2048;
      double v12 = v3;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input offset %2.2f for setattenuationShift is out-of-range. Clamping to [-1, 1].", (uint8_t *)&v7, 0x1Cu);
    }
    float v3 = fminf(fmaxf(v3, -1.0), 1.0);
  }
  if (self->_attenuationShift != v3)
  {
    self->_attenuationShift = v3;
    [(PHASEMaterial *)self writeMaterialCoefs:0];
  }
}

- (void)setAttenuationTilt:(float)a3
{
  float v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3 < -1.0 || a3 > 1.0)
  {
    int v6 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315650;
      __int16 v8 = "PHASEMaterial.mm";
      __int16 v9 = 1024;
      int v10 = 1080;
      __int16 v11 = 2048;
      double v12 = v3;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input slope %2.2f for setattenuationTilt is out-of-range. Clamping to [-1, 1].", (uint8_t *)&v7, 0x1Cu);
    }
    float v3 = fminf(fmaxf(v3, -1.0), 1.0);
  }
  if (self->_attenuationTilt != v3)
  {
    self->_attenuationTilt = v3;
    [(PHASEMaterial *)self writeMaterialCoefs:0];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  int64_t v6 = [(PHASEMaterial *)self preset];
  int v7 = [(PHASEMaterial *)self soundReductionIndex];
  __int16 v8 = [(PHASEMaterial *)self absorptionData];
  __int16 v9 = [(PHASEMaterial *)self scatteringData];
  int v10 = (void *)[v4 initWithEngine:WeakRetained preset:v6 soundReductionIndex:v7 absorptionData:v8 scatteringData:v9];

  [(PHASEMaterial *)self attenuationScale];
  objc_msgSend(v10, "setAttenuationScale:");
  [(PHASEMaterial *)self attenuationShift];
  objc_msgSend(v10, "setAttenuationShift:");
  [(PHASEMaterial *)self attenuationTilt];
  objc_msgSend(v10, "setAttenuationTilt:");
  return v10;
}

- (void)dealloc
{
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v6 = *(void *)([v5 implementation] + 368);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v6 + 296))(v6, [(PHASEMaterial *)self geoMaterialHandle]);
  }
  v7.receiver = self;
  v7.super_class = (Class)PHASEMaterial;
  [(PHASEMaterial *)&v7 dealloc];
}

- (Handle64)geoMaterialHandle
{
  return self->_geoMaterialHandle;
}

- (void)setGeoMaterialHandle:(Handle64)a3
{
  self->_geoMaterialHandle = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (PHASESoundReductionIndex)soundReductionIndex
{
  return self->_soundReductionIndex;
}

- (PHASEAbsorptionData)absorptionData
{
  return self->_absorptionData;
}

- (PHASEScatteringData)scatteringData
{
  return self->_scatteringData;
}

- (float)attenuationScale
{
  return self->_attenuationScale;
}

- (float)attenuationShift
{
  return self->_attenuationShift;
}

- (float)attenuationTilt
{
  return self->_attenuationTilt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scatteringData, 0);
  objc_storeStrong((id *)&self->_absorptionData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndex, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  return self;
}

@end