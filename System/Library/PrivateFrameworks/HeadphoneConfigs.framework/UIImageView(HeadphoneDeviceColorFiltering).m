@interface UIImageView(HeadphoneDeviceColorFiltering)
+ (BOOL)_headphoneDefaultFiltersID:()HeadphoneDeviceColorFiltering;
+ (id)_headphoneGetAssetsDictionary:()HeadphoneDeviceColorFiltering;
+ (uint64_t)_headphoneIsProductOfDifferentColors:()HeadphoneDeviceColorFiltering;
- (void)_headphoneApplyFilters:()HeadphoneDeviceColorFiltering pid:darkMode:deviceColor:;
@end

@implementation UIImageView(HeadphoneDeviceColorFiltering)

- (void)_headphoneApplyFilters:()HeadphoneDeviceColorFiltering pid:darkMode:deviceColor:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v51) = a4;
    WORD2(v51) = 1024;
    *(_DWORD *)((char *)&v51 + 6) = a5;
    WORD5(v51) = 1024;
    HIDWORD(v51) = a6;
    _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Applying filter with pid - %d, darkMode - %d, deviceColor - %d", buf, 0x14u);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v13 = (void *)[v12 initWithType:*MEMORY[0x1E4F3A038]];
  id v14 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v15 = (void *)[v14 initWithType:*MEMORY[0x1E4F39FD8]];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 4);
  int v49 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 20);
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 28);
  int v47 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 44);
  *(_OWORD *)v45 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 52);
  *(_OWORD *)&v45[12] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  int v17 = [MEMORY[0x1E4FB1838] _headphoneIsProductOfDifferentColors:a4];
  if (a5)
  {
    if (v17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"DarkMatrixValue-%d", a6);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = @"DarkMatrixValue";
    }
    if ([MEMORY[0x1E4FB1838] _headphoneIsProductOfDifferentColors:a4])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"DarkBiasValue-%d", a6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = @"DarkBiasValue";
    }
    v20 = [v10 objectForKey:v18];
    [v20 floatValue];
    float v22 = v21;

    v23 = [v10 objectForKey:v19];
    [v23 floatValue];
    float v25 = v24;

    if (v25 != 0.0 && v22 != 0.0
      || ([MEMORY[0x1E4FB1838] _headphoneIsProductOfDifferentColors:a4] & 1) == 0)
    {
      goto LABEL_25;
    }
    v43 = v13;
    v44 = a1;
    v42 = @"DarkBiasValue-%d";
    v26 = @"DarkMatrixValue-%d";
  }
  else
  {
    if (v17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"LightMatrixValue-%d", a6);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = @"LightMatrixValue";
    }
    if ([MEMORY[0x1E4FB1838] _headphoneIsProductOfDifferentColors:a4])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"LightBiasValue-%d", a6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = @"LightBiasValue";
    }
    v27 = [v10 objectForKey:v18];
    [v27 floatValue];
    float v22 = v28;

    v29 = [v10 objectForKey:v19];
    [v29 floatValue];
    float v25 = v30;

    if (v25 != 0.0 && v22 != 0.0
      || ![MEMORY[0x1E4FB1838] _headphoneIsProductOfDifferentColors:a4])
    {
      goto LABEL_25;
    }
    v43 = v13;
    v44 = a1;
    v42 = @"LightBiasValue-%d";
    v26 = @"LightMatrixValue-%d";
  }
  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", v26, objc_msgSend(MEMORY[0x1E4FB1838], "_headphoneDefaultFiltersID:", a4));

  uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", v42, objc_msgSend(MEMORY[0x1E4FB1838], "_headphoneDefaultFiltersID:", a4));

  v33 = [v10 objectForKey:v31];
  [v33 floatValue];
  float v22 = v34;

  v35 = [v10 objectForKey:v32];
  [v35 floatValue];
  float v25 = v36;

  v18 = (__CFString *)v31;
  v19 = (__CFString *)v32;
  v13 = v43;
  a1 = v44;
LABEL_25:
  *(float *)buf = v22;
  long long v51 = v48;
  int v52 = v49;
  float v53 = v22;
  long long v54 = v46;
  int v55 = v47;
  float v56 = v22;
  *(_OWORD *)v57 = *(_OWORD *)v45;
  *(_OWORD *)&v57[12] = *(_OWORD *)&v45[12];
  v37 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:buf];
  [v13 setValue:v37 forKey:@"inputColorMatrix"];

  *(float *)&double v38 = v25;
  v39 = [NSNumber numberWithFloat:v38];
  [v15 setValue:v39 forKey:@"inputAmount"];

  [v16 addObject:v13];
  [v16 addObject:v15];
  v40 = [a1 layer];
  [v40 setFilters:v16];

  v41 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v41, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Shader applied successfully", buf, 2u);
  }
}

+ (id)_headphoneGetAssetsDictionary:()HeadphoneDeviceColorFiltering
{
  v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1191 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Settings UI: Getting shader dictionary", v1191, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  switch(a3)
  {
    case 8194:
    case 8207:
      v20 = [NSNumber numberWithInt:85];
      [v5 setObject:v20 forKeyedSubscript:@"BudHeight"];

      float v21 = [NSNumber numberWithInt:3];
      [v5 setObject:v21 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      float v22 = [NSNumber numberWithInt:30];
      [v5 setObject:v22 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v23 = [NSNumber numberWithInt:108];
      [v5 setObject:v23 forKeyedSubscript:@"CaseHeight"];

      float v24 = [NSNumber numberWithInt:62];
      [v5 setObject:v24 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      float v25 = [NSNumber numberWithInt:35];
      [v5 setObject:v25 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v26) = 1053609165;
      v27 = [NSNumber numberWithFloat:v26];
      [v5 setObject:v27 forKeyedSubscript:@"DarkBiasValue"];

      LODWORD(v28) = 1065772646;
      v29 = [NSNumber numberWithFloat:v28];
      [v5 setObject:v29 forKeyedSubscript:@"DarkMatrixValue"];

      float v30 = NSNumber;
      LODWORD(v31) = 0.5;
      goto LABEL_21;
    case 8195:
      v42 = [NSNumber numberWithInt:108];
      [v5 setObject:v42 forKeyedSubscript:@"BudHeight"];

      LODWORD(v43) = 1051931443;
      v44 = [NSNumber numberWithFloat:v43];
      [v5 setObject:v44 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v45) = 1065772646;
      long long v46 = [NSNumber numberWithFloat:v45];
      [v5 setObject:v46 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v47) = 0.5;
      long long v48 = [NSNumber numberWithFloat:v47];
      [v5 setObject:v48 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v49) = 1066359849;
      v50 = [NSNumber numberWithFloat:v49];
      [v5 setObject:v50 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v51) = 1044549468;
      int v52 = [NSNumber numberWithFloat:v51];
      [v5 setObject:v52 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v53) = 1065017672;
      long long v54 = [NSNumber numberWithFloat:v53];
      [v5 setObject:v54 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v55) = 0.5;
      float v56 = [NSNumber numberWithFloat:v55];
      [v5 setObject:v56 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v57) = 1066695393;
      uint64_t v58 = [NSNumber numberWithFloat:v57];
      [v5 setObject:v58 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v59) = 1055286886;
      v60 = [NSNumber numberWithFloat:v59];
      [v5 setObject:v60 forKeyedSubscript:@"DarkBiasValue-11"];

      LODWORD(v61) = 1057300152;
      v62 = [NSNumber numberWithFloat:v61];
      [v5 setObject:v62 forKeyedSubscript:@"DarkMatrixValue-11"];

      LODWORD(v63) = 0.5;
      v64 = [NSNumber numberWithFloat:v63];
      [v5 setObject:v64 forKeyedSubscript:@"LightBiasValue-11"];

      LODWORD(v65) = 1066695393;
      v66 = [NSNumber numberWithFloat:v65];
      [v5 setObject:v66 forKeyedSubscript:@"LightMatrixValue-11"];

      LODWORD(v67) = 1047233823;
      v68 = [NSNumber numberWithFloat:v67];
      [v5 setObject:v68 forKeyedSubscript:@"DarkBiasValue-12"];

      LODWORD(v69) = 1061662228;
      v70 = [NSNumber numberWithFloat:v69];
      [v5 setObject:v70 forKeyedSubscript:@"DarkMatrixValue-12"];

      LODWORD(v71) = 0.5;
      v72 = [NSNumber numberWithFloat:v71];
      [v5 setObject:v72 forKeyedSubscript:@"LightBiasValue-12"];

      LODWORD(v73) = 1066695393;
      v74 = [NSNumber numberWithFloat:v73];
      [v5 setObject:v74 forKeyedSubscript:@"LightMatrixValue-12"];

      LODWORD(v75) = 1047233823;
      v76 = [NSNumber numberWithFloat:v75];
      [v5 setObject:v76 forKeyedSubscript:@"DarkBiasValue-13"];

      LODWORD(v77) = 1061662228;
      v78 = [NSNumber numberWithFloat:v77];
      [v5 setObject:v78 forKeyedSubscript:@"DarkMatrixValue-13"];

      LODWORD(v79) = 0.5;
      v80 = [NSNumber numberWithFloat:v79];
      [v5 setObject:v80 forKeyedSubscript:@"LightBiasValue-13"];

      LODWORD(v81) = 1066695393;
      v82 = [NSNumber numberWithFloat:v81];
      [v5 setObject:v82 forKeyedSubscript:@"LightMatrixValue-13"];

      LODWORD(v83) = 1055286886;
      v84 = [NSNumber numberWithFloat:v83];
      [v5 setObject:v84 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v85) = 1059816735;
      v86 = [NSNumber numberWithFloat:v85];
      [v5 setObject:v86 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v87) = 0.5;
      v88 = [NSNumber numberWithFloat:v87];
      [v5 setObject:v88 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v89) = 1066695393;
      v90 = [NSNumber numberWithFloat:v89];
      [v5 setObject:v90 forKeyedSubscript:@"LightMatrixValue-18"];

      LODWORD(v91) = 1056629064;
      v92 = [NSNumber numberWithFloat:v91];
      [v5 setObject:v92 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v93) = 1058306785;
      v94 = [NSNumber numberWithFloat:v93];
      [v5 setObject:v94 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v95) = 0.5;
      v96 = [NSNumber numberWithFloat:v95];
      [v5 setObject:v96 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v97) = 1066695393;
      v98 = [NSNumber numberWithFloat:v97];
      [v5 setObject:v98 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v99) = 1056293519;
      v100 = [NSNumber numberWithFloat:v99];
      [v5 setObject:v100 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v101) = 1060320051;
      v102 = [NSNumber numberWithFloat:v101];
      [v5 setObject:v102 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v103) = 0.5;
      v104 = [NSNumber numberWithFloat:v103];
      [v5 setObject:v104 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v105) = 1066695393;
      v106 = [NSNumber numberWithFloat:v105];
      [v5 setObject:v106 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v107) = 1056125747;
      v108 = [NSNumber numberWithFloat:v107];
      [v5 setObject:v108 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v109) = 1058977874;
      v110 = [NSNumber numberWithFloat:v109];
      [v5 setObject:v110 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v111) = 0.5;
      v112 = [NSNumber numberWithFloat:v111];
      [v5 setObject:v112 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v113) = 1066695393;
      v114 = [NSNumber numberWithFloat:v113];
      [v5 setObject:v114 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v115) = 1055957975;
      v116 = [NSNumber numberWithFloat:v115];
      [v5 setObject:v116 forKeyedSubscript:@"DarkBiasValue-23"];

      LODWORD(v117) = 1052266988;
      v118 = [NSNumber numberWithFloat:v117];
      [v5 setObject:v118 forKeyedSubscript:@"DarkMatrixValue-23"];

      LODWORD(v119) = 0.5;
      v120 = [NSNumber numberWithFloat:v119];
      [v5 setObject:v120 forKeyedSubscript:@"LightBiasValue-23"];

      LODWORD(v121) = 1066695393;
      v122 = [NSNumber numberWithFloat:v121];
      [v5 setObject:v122 forKeyedSubscript:@"LightMatrixValue-23"];

      LODWORD(v123) = 1058642330;
      v124 = [NSNumber numberWithFloat:v123];
      [v5 setObject:v124 forKeyedSubscript:@"DarkBiasValue-32"];

      LODWORD(v125) = 1049582633;
      v126 = [NSNumber numberWithFloat:v125];
      [v5 setObject:v126 forKeyedSubscript:@"DarkMatrixValue-32"];

      LODWORD(v127) = 0.5;
      v128 = [NSNumber numberWithFloat:v127];
      [v5 setObject:v128 forKeyedSubscript:@"LightBiasValue-32"];

      LODWORD(v129) = 1066695393;
      v130 = [NSNumber numberWithFloat:v129];
      [v5 setObject:v130 forKeyedSubscript:@"LightMatrixValue-32"];

      LODWORD(v131) = 1052266988;
      v132 = [NSNumber numberWithFloat:v131];
      [v5 setObject:v132 forKeyedSubscript:@"DarkBiasValue-33"];

      LODWORD(v133) = 1059313418;
      v134 = [NSNumber numberWithFloat:v133];
      [v5 setObject:v134 forKeyedSubscript:@"DarkMatrixValue-33"];

      LODWORD(v135) = 0.5;
      v136 = [NSNumber numberWithFloat:v135];
      [v5 setObject:v136 forKeyedSubscript:@"LightBiasValue-33"];

      LODWORD(v137) = 1066695393;
      v138 = [NSNumber numberWithFloat:v137];
      [v5 setObject:v138 forKeyedSubscript:@"LightMatrixValue-33"];

      LODWORD(v139) = 1056293519;
      v140 = [NSNumber numberWithFloat:v139];
      [v5 setObject:v140 forKeyedSubscript:@"DarkBiasValue-34"];

      LODWORD(v141) = 0.5;
      v142 = [NSNumber numberWithFloat:v141];
      [v5 setObject:v142 forKeyedSubscript:@"DarkMatrixValue-34"];

      LODWORD(v143) = 0.5;
      v144 = [NSNumber numberWithFloat:v143];
      [v5 setObject:v144 forKeyedSubscript:@"LightBiasValue-34"];

      LODWORD(v145) = 1066695393;
      v146 = [NSNumber numberWithFloat:v145];
      [v5 setObject:v146 forKeyedSubscript:@"LightMatrixValue-34"];

      LODWORD(v147) = 1053609165;
      v148 = [NSNumber numberWithFloat:v147];
      [v5 setObject:v148 forKeyedSubscript:@"DarkBiasValue-35"];

      LODWORD(v149) = 1058139013;
      v150 = [NSNumber numberWithFloat:v149];
      [v5 setObject:v150 forKeyedSubscript:@"DarkMatrixValue-35"];

      LODWORD(v151) = 0.5;
      v152 = [NSNumber numberWithFloat:v151];
      [v5 setObject:v152 forKeyedSubscript:@"LightBiasValue-35"];

      LODWORD(v153) = 1066695393;
      v154 = [NSNumber numberWithFloat:v153];
      [v5 setObject:v154 forKeyedSubscript:@"LightMatrixValue-35"];

      LODWORD(v155) = 1056293519;
      v156 = [NSNumber numberWithFloat:v155];
      [v5 setObject:v156 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v157) = 1054280253;
      v158 = [NSNumber numberWithFloat:v157];
      [v5 setObject:v158 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v159) = 0.5;
      v160 = [NSNumber numberWithFloat:v159];
      [v5 setObject:v160 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v161) = 1066695393;
      v162 = [NSNumber numberWithFloat:v161];
      v163 = @"LightMatrixValue-37";
      break;
    case 8197:
      v164 = [NSNumber numberWithInt:108];
      [v5 setObject:v164 forKeyedSubscript:@"BudHeight"];

      LODWORD(v165) = 1049414861;
      v166 = [NSNumber numberWithFloat:v165];
      [v5 setObject:v166 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v167) = 1066192077;
      v168 = [NSNumber numberWithFloat:v167];
      [v5 setObject:v168 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v169) = 0.5;
      v170 = [NSNumber numberWithFloat:v169];
      [v5 setObject:v170 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v171) = 1066359849;
      v172 = [NSNumber numberWithFloat:v171];
      [v5 setObject:v172 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v173) = 1056125747;
      v174 = [NSNumber numberWithFloat:v173];
      [v5 setObject:v174 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v175) = 1053944709;
      v176 = [NSNumber numberWithFloat:v175];
      [v5 setObject:v176 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v177) = 0.5;
      v178 = [NSNumber numberWithFloat:v177];
      [v5 setObject:v178 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v179) = 1066695393;
      v180 = [NSNumber numberWithFloat:v179];
      [v5 setObject:v180 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v181) = 1059481190;
      v182 = [NSNumber numberWithFloat:v181];
      [v5 setObject:v182 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v183) = 1049582633;
      v184 = [NSNumber numberWithFloat:v183];
      [v5 setObject:v184 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v185) = 0.5;
      v186 = [NSNumber numberWithFloat:v185];
      [v5 setObject:v186 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v187) = 1066695393;
      v188 = [NSNumber numberWithFloat:v187];
      [v5 setObject:v188 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v189) = 1059984507;
      v190 = [NSNumber numberWithFloat:v189];
      [v5 setObject:v190 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v191) = 1051931443;
      v192 = [NSNumber numberWithFloat:v191];
      [v5 setObject:v192 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v193) = 0.5;
      v194 = [NSNumber numberWithFloat:v193];
      [v5 setObject:v194 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v195) = 1066695393;
      v196 = [NSNumber numberWithFloat:v195];
      [v5 setObject:v196 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v197) = 1050253722;
      v198 = [NSNumber numberWithFloat:v197];
      [v5 setObject:v198 forKeyedSubscript:@"DarkBiasValue-27"];

      LODWORD(v199) = 1065520988;
      v200 = [NSNumber numberWithFloat:v199];
      [v5 setObject:v200 forKeyedSubscript:@"DarkMatrixValue-27"];

      LODWORD(v201) = 0.5;
      v202 = [NSNumber numberWithFloat:v201];
      [v5 setObject:v202 forKeyedSubscript:@"LightBiasValue-27"];

      LODWORD(v203) = 1066695393;
      v204 = [NSNumber numberWithFloat:v203];
      [v5 setObject:v204 forKeyedSubscript:@"LightMatrixValue-27"];

      LODWORD(v205) = 1056293519;
      v206 = [NSNumber numberWithFloat:v205];
      [v5 setObject:v206 forKeyedSubscript:@"DarkBiasValue-29"];

      LODWORD(v207) = 1035489772;
      v208 = [NSNumber numberWithFloat:v207];
      [v5 setObject:v208 forKeyedSubscript:@"DarkMatrixValue-29"];

      LODWORD(v209) = 0.5;
      v210 = [NSNumber numberWithFloat:v209];
      [v5 setObject:v210 forKeyedSubscript:@"LightBiasValue-29"];

      LODWORD(v211) = 1066695393;
      v212 = [NSNumber numberWithFloat:v211];
      [v5 setObject:v212 forKeyedSubscript:@"LightMatrixValue-29"];

      LODWORD(v213) = 1055286886;
      v214 = [NSNumber numberWithFloat:v213];
      [v5 setObject:v214 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v215) = 1057132380;
      v216 = [NSNumber numberWithFloat:v215];
      [v5 setObject:v216 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v217) = 0.5;
      v218 = [NSNumber numberWithFloat:v217];
      [v5 setObject:v218 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v219) = 1066695393;
      v220 = [NSNumber numberWithFloat:v219];
      [v5 setObject:v220 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v221) = 1056293519;
      v222 = [NSNumber numberWithFloat:v221];
      [v5 setObject:v222 forKeyedSubscript:@"DarkBiasValue-65"];

      LODWORD(v223) = 1062836634;
      v224 = [NSNumber numberWithFloat:v223];
      [v5 setObject:v224 forKeyedSubscript:@"DarkMatrixValue-65"];

      LODWORD(v225) = 0.5;
      v226 = [NSNumber numberWithFloat:v225];
      [v5 setObject:v226 forKeyedSubscript:@"LightBiasValue-65"];

      LODWORD(v227) = 1066695393;
      v228 = [NSNumber numberWithFloat:v227];
      [v5 setObject:v228 forKeyedSubscript:@"LightMatrixValue-65"];

      LODWORD(v229) = 1055286886;
      v230 = [NSNumber numberWithFloat:v229];
      [v5 setObject:v230 forKeyedSubscript:@"DarkBiasValue-73"];

      LODWORD(v231) = 1059816735;
      v232 = [NSNumber numberWithFloat:v231];
      [v5 setObject:v232 forKeyedSubscript:@"DarkMatrixValue-73"];

      LODWORD(v233) = 0.5;
      v234 = [NSNumber numberWithFloat:v233];
      [v5 setObject:v234 forKeyedSubscript:@"LightBiasValue-73"];

      LODWORD(v235) = 1066695393;
      v162 = [NSNumber numberWithFloat:v235];
      v163 = @"LightMatrixValue-73";
      break;
    case 8198:
      v236 = [NSNumber numberWithInt:108];
      [v5 setObject:v236 forKeyedSubscript:@"BudHeight"];

      LODWORD(v237) = 1051931443;
      v238 = [NSNumber numberWithFloat:v237];
      [v5 setObject:v238 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v239) = 1065772646;
      v240 = [NSNumber numberWithFloat:v239];
      [v5 setObject:v240 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v241) = 0.5;
      v242 = [NSNumber numberWithFloat:v241];
      [v5 setObject:v242 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v243) = 1066695393;
      v244 = [NSNumber numberWithFloat:v243];
      [v5 setObject:v244 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v245) = 1058726216;
      v246 = [NSNumber numberWithFloat:v245];
      [v5 setObject:v246 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v247) = 1046562734;
      v248 = [NSNumber numberWithFloat:v247];
      [v5 setObject:v248 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v249) = 0.5;
      v250 = [NSNumber numberWithFloat:v249];
      [v5 setObject:v250 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v251) = 1066695393;
      v252 = [NSNumber numberWithFloat:v251];
      [v5 setObject:v252 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v253) = 1056293519;
      v254 = [NSNumber numberWithFloat:v253];
      [v5 setObject:v254 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v255) = 1064514355;
      v256 = [NSNumber numberWithFloat:v255];
      [v5 setObject:v256 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v257) = 0.5;
      v258 = [NSNumber numberWithFloat:v257];
      [v5 setObject:v258 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v259) = 1066695393;
      v260 = [NSNumber numberWithFloat:v259];
      [v5 setObject:v260 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v261) = 1054951342;
      v262 = [NSNumber numberWithFloat:v261];
      [v5 setObject:v262 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v263) = 1062836634;
      v264 = [NSNumber numberWithFloat:v263];
      [v5 setObject:v264 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v265) = 0.5;
      v266 = [NSNumber numberWithFloat:v265];
      [v5 setObject:v266 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v267) = 1066695393;
      v268 = [NSNumber numberWithFloat:v267];
      [v5 setObject:v268 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v269) = 1055286886;
      v270 = [NSNumber numberWithFloat:v269];
      [v5 setObject:v270 forKeyedSubscript:@"DarkBiasValue-8"];

      LODWORD(v271) = 1062836634;
      v272 = [NSNumber numberWithFloat:v271];
      [v5 setObject:v272 forKeyedSubscript:@"DarkMatrixValue-8"];

      LODWORD(v273) = 0.5;
      v274 = [NSNumber numberWithFloat:v273];
      [v5 setObject:v274 forKeyedSubscript:@"LightBiasValue-8"];

      LODWORD(v275) = 1066695393;
      v276 = [NSNumber numberWithFloat:v275];
      [v5 setObject:v276 forKeyedSubscript:@"LightMatrixValue-8"];

      LODWORD(v277) = 1059481190;
      v278 = [NSNumber numberWithFloat:v277];
      [v5 setObject:v278 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v279) = 1045220557;
      v280 = [NSNumber numberWithFloat:v279];
      [v5 setObject:v280 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v281) = 0.5;
      v282 = [NSNumber numberWithFloat:v281];
      [v5 setObject:v282 forKeyedSubscript:@"LightBiasValue-9"];

      LODWORD(v283) = 1066695393;
      v284 = [NSNumber numberWithFloat:v283];
      [v5 setObject:v284 forKeyedSubscript:@"LightMatrixValue-9"];

      LODWORD(v285) = 1055622431;
      v286 = [NSNumber numberWithFloat:v285];
      [v5 setObject:v286 forKeyedSubscript:@"DarkBiasValue-14"];

      LODWORD(v287) = 0.75;
      v288 = [NSNumber numberWithFloat:v287];
      [v5 setObject:v288 forKeyedSubscript:@"DarkMatrixValue-14"];

      LODWORD(v289) = 0.5;
      v290 = [NSNumber numberWithFloat:v289];
      [v5 setObject:v290 forKeyedSubscript:@"LightBiasValue-14"];

      LODWORD(v291) = 1066695393;
      v292 = [NSNumber numberWithFloat:v291];
      [v5 setObject:v292 forKeyedSubscript:@"LightMatrixValue-14"];

      LODWORD(v293) = 1056293519;
      v294 = [NSNumber numberWithFloat:v293];
      [v5 setObject:v294 forKeyedSubscript:@"DarkBiasValue-15"];

      LODWORD(v295) = 1061494456;
      v296 = [NSNumber numberWithFloat:v295];
      [v5 setObject:v296 forKeyedSubscript:@"DarkMatrixValue-15"];

      LODWORD(v297) = 0.5;
      v298 = [NSNumber numberWithFloat:v297];
      [v5 setObject:v298 forKeyedSubscript:@"LightBiasValue-15"];

      LODWORD(v299) = 1066695393;
      v300 = [NSNumber numberWithFloat:v299];
      [v5 setObject:v300 forKeyedSubscript:@"LightMatrixValue-15"];

      LODWORD(v301) = 1059145646;
      v302 = [NSNumber numberWithFloat:v301];
      [v5 setObject:v302 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v303) = 1052938076;
      v304 = [NSNumber numberWithFloat:v303];
      [v5 setObject:v304 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v305) = 0.5;
      v306 = [NSNumber numberWithFloat:v305];
      [v5 setObject:v306 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v307) = 1066695393;
      v308 = [NSNumber numberWithFloat:v307];
      [v5 setObject:v308 forKeyedSubscript:@"LightMatrixValue-18"];

      LODWORD(v309) = 1057132380;
      v310 = [NSNumber numberWithFloat:v309];
      [v5 setObject:v310 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v311) = 1059481190;
      v312 = [NSNumber numberWithFloat:v311];
      [v5 setObject:v312 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v313) = 0.5;
      v314 = [NSNumber numberWithFloat:v313];
      [v5 setObject:v314 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v315) = 1066695393;
      v316 = [NSNumber numberWithFloat:v315];
      [v5 setObject:v316 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v317) = 1058810102;
      v318 = [NSNumber numberWithFloat:v317];
      [v5 setObject:v318 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v319) = 1051260355;
      v320 = [NSNumber numberWithFloat:v319];
      [v5 setObject:v320 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v321) = 0.5;
      v322 = [NSNumber numberWithFloat:v321];
      [v5 setObject:v322 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v323) = 1066695393;
      v324 = [NSNumber numberWithFloat:v323];
      [v5 setObject:v324 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v325) = 1058977874;
      v326 = [NSNumber numberWithFloat:v325];
      [v5 setObject:v326 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v327) = 1050924810;
      v328 = [NSNumber numberWithFloat:v327];
      [v5 setObject:v328 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v329) = 0.5;
      v330 = [NSNumber numberWithFloat:v329];
      [v5 setObject:v330 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v331) = 1066695393;
      v332 = [NSNumber numberWithFloat:v331];
      [v5 setObject:v332 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v333) = 1051931443;
      v334 = [NSNumber numberWithFloat:v333];
      [v5 setObject:v334 forKeyedSubscript:@"DarkBiasValue-27"];

      LODWORD(v335) = 1065772646;
      v336 = [NSNumber numberWithFloat:v335];
      [v5 setObject:v336 forKeyedSubscript:@"DarkMatrixValue-27"];

      LODWORD(v337) = 0.5;
      v338 = [NSNumber numberWithFloat:v337];
      [v5 setObject:v338 forKeyedSubscript:@"LightBiasValue-27"];

      LODWORD(v339) = 1066695393;
      v340 = [NSNumber numberWithFloat:v339];
      [v5 setObject:v340 forKeyedSubscript:@"LightMatrixValue-27"];

      LODWORD(v341) = 1056293519;
      v342 = [NSNumber numberWithFloat:v341];
      [v5 setObject:v342 forKeyedSubscript:@"DarkBiasValue-29"];

      LODWORD(v343) = 1062668861;
      v344 = [NSNumber numberWithFloat:v343];
      [v5 setObject:v344 forKeyedSubscript:@"DarkMatrixValue-29"];

      LODWORD(v345) = 0.5;
      v346 = [NSNumber numberWithFloat:v345];
      [v5 setObject:v346 forKeyedSubscript:@"LightBiasValue-29"];

      LODWORD(v347) = 1066695393;
      v348 = [NSNumber numberWithFloat:v347];
      [v5 setObject:v348 forKeyedSubscript:@"LightMatrixValue-29"];

      LODWORD(v349) = 1055957975;
      v350 = [NSNumber numberWithFloat:v349];
      [v5 setObject:v350 forKeyedSubscript:@"DarkBiasValue-32"];

      LODWORD(v351) = 1059984507;
      v352 = [NSNumber numberWithFloat:v351];
      [v5 setObject:v352 forKeyedSubscript:@"DarkMatrixValue-32"];

      LODWORD(v353) = 0.5;
      v354 = [NSNumber numberWithFloat:v353];
      [v5 setObject:v354 forKeyedSubscript:@"LightBiasValue-32"];

      LODWORD(v355) = 1066695393;
      v356 = [NSNumber numberWithFloat:v355];
      [v5 setObject:v356 forKeyedSubscript:@"LightMatrixValue-32"];

      LODWORD(v357) = 1056461292;
      v358 = [NSNumber numberWithFloat:v357];
      [v5 setObject:v358 forKeyedSubscript:@"DarkBiasValue-33"];

      LODWORD(v359) = 1059648963;
      v360 = [NSNumber numberWithFloat:v359];
      [v5 setObject:v360 forKeyedSubscript:@"DarkMatrixValue-33"];

      LODWORD(v361) = 0.5;
      v362 = [NSNumber numberWithFloat:v361];
      [v5 setObject:v362 forKeyedSubscript:@"LightBiasValue-33"];

      LODWORD(v363) = 1066695393;
      v364 = [NSNumber numberWithFloat:v363];
      [v5 setObject:v364 forKeyedSubscript:@"LightMatrixValue-33"];

      LODWORD(v365) = 1056293519;
      v366 = [NSNumber numberWithFloat:v365];
      [v5 setObject:v366 forKeyedSubscript:@"DarkBiasValue-34"];

      LODWORD(v367) = 1061326684;
      v368 = [NSNumber numberWithFloat:v367];
      [v5 setObject:v368 forKeyedSubscript:@"DarkMatrixValue-34"];

      LODWORD(v369) = 0.5;
      v370 = [NSNumber numberWithFloat:v369];
      [v5 setObject:v370 forKeyedSubscript:@"LightBiasValue-34"];

      LODWORD(v371) = 1066695393;
      v372 = [NSNumber numberWithFloat:v371];
      [v5 setObject:v372 forKeyedSubscript:@"LightMatrixValue-34"];

      LODWORD(v373) = 1055622431;
      v374 = [NSNumber numberWithFloat:v373];
      [v5 setObject:v374 forKeyedSubscript:@"DarkBiasValue-35"];

      LODWORD(v375) = 1059648963;
      v376 = [NSNumber numberWithFloat:v375];
      [v5 setObject:v376 forKeyedSubscript:@"DarkMatrixValue-35"];

      LODWORD(v377) = 0.5;
      v378 = [NSNumber numberWithFloat:v377];
      [v5 setObject:v378 forKeyedSubscript:@"LightBiasValue-35"];

      LODWORD(v379) = 1066695393;
      v380 = [NSNumber numberWithFloat:v379];
      [v5 setObject:v380 forKeyedSubscript:@"LightMatrixValue-35"];

      LODWORD(v381) = 1058306785;
      v382 = [NSNumber numberWithFloat:v381];
      [v5 setObject:v382 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v383) = 1051092582;
      v384 = [NSNumber numberWithFloat:v383];
      [v5 setObject:v384 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v385) = 0.5;
      v386 = [NSNumber numberWithFloat:v385];
      [v5 setObject:v386 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v387) = 1066695393;
      v388 = [NSNumber numberWithFloat:v387];
      [v5 setObject:v388 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v389) = 1054951342;
      v390 = [NSNumber numberWithFloat:v389];
      [v5 setObject:v390 forKeyedSubscript:@"DarkBiasValue-42"];

      LODWORD(v391) = 1062501089;
      v392 = [NSNumber numberWithFloat:v391];
      [v5 setObject:v392 forKeyedSubscript:@"DarkMatrixValue-42"];

      LODWORD(v393) = 0.5;
      v394 = [NSNumber numberWithFloat:v393];
      [v5 setObject:v394 forKeyedSubscript:@"LightBiasValue-42"];

      LODWORD(v395) = 1066695393;
      v396 = [NSNumber numberWithFloat:v395];
      [v5 setObject:v396 forKeyedSubscript:@"LightMatrixValue-42"];

      LODWORD(v397) = 1054280253;
      v398 = [NSNumber numberWithFloat:v397];
      [v5 setObject:v398 forKeyedSubscript:@"DarkBiasValue-46"];

      LODWORD(v399) = 1063843267;
      v400 = [NSNumber numberWithFloat:v399];
      [v5 setObject:v400 forKeyedSubscript:@"DarkMatrixValue-46"];

      LODWORD(v401) = 0.5;
      v402 = [NSNumber numberWithFloat:v401];
      [v5 setObject:v402 forKeyedSubscript:@"LightBiasValue-46"];

      LODWORD(v403) = 1066695393;
      v404 = [NSNumber numberWithFloat:v403];
      [v5 setObject:v404 forKeyedSubscript:@"LightMatrixValue-46"];

      LODWORD(v405) = 1051931443;
      v406 = [NSNumber numberWithFloat:v405];
      [v5 setObject:v406 forKeyedSubscript:@"DarkBiasValue-47"];

      LODWORD(v407) = 1065772646;
      v408 = [NSNumber numberWithFloat:v407];
      [v5 setObject:v408 forKeyedSubscript:@"DarkMatrixValue-47"];

      LODWORD(v409) = 0.5;
      v410 = [NSNumber numberWithFloat:v409];
      [v5 setObject:v410 forKeyedSubscript:@"LightBiasValue-47"];

      LODWORD(v411) = 1066695393;
      v412 = [NSNumber numberWithFloat:v411];
      [v5 setObject:v412 forKeyedSubscript:@"LightMatrixValue-47"];

      LODWORD(v413) = 1054615798;
      v414 = [NSNumber numberWithFloat:v413];
      [v5 setObject:v414 forKeyedSubscript:@"DarkBiasValue-61"];

      LODWORD(v415) = 1063507722;
      v416 = [NSNumber numberWithFloat:v415];
      [v5 setObject:v416 forKeyedSubscript:@"DarkMatrixValue-61"];

      LODWORD(v417) = 0.5;
      v418 = [NSNumber numberWithFloat:v417];
      [v5 setObject:v418 forKeyedSubscript:@"LightBiasValue-61"];

      LODWORD(v419) = 1066695393;
      v420 = [NSNumber numberWithFloat:v419];
      [v5 setObject:v420 forKeyedSubscript:@"LightMatrixValue-61"];

      LODWORD(v421) = 1053944709;
      v422 = [NSNumber numberWithFloat:v421];
      [v5 setObject:v422 forKeyedSubscript:@"DarkBiasValue-62"];

      LODWORD(v423) = 1064011039;
      v424 = [NSNumber numberWithFloat:v423];
      [v5 setObject:v424 forKeyedSubscript:@"DarkMatrixValue-62"];

      LODWORD(v425) = 0.5;
      v426 = [NSNumber numberWithFloat:v425];
      [v5 setObject:v426 forKeyedSubscript:@"LightBiasValue-62"];

      LODWORD(v427) = 1066695393;
      v428 = [NSNumber numberWithFloat:v427];
      [v5 setObject:v428 forKeyedSubscript:@"LightMatrixValue-62"];

      LODWORD(v429) = 1054951342;
      v430 = [NSNumber numberWithFloat:v429];
      [v5 setObject:v430 forKeyedSubscript:@"DarkBiasValue-63"];

      LODWORD(v431) = 1064011039;
      v432 = [NSNumber numberWithFloat:v431];
      [v5 setObject:v432 forKeyedSubscript:@"DarkMatrixValue-63"];

      LODWORD(v433) = 0.5;
      v434 = [NSNumber numberWithFloat:v433];
      [v5 setObject:v434 forKeyedSubscript:@"LightBiasValue-63"];

      LODWORD(v435) = 1066695393;
      v436 = [NSNumber numberWithFloat:v435];
      [v5 setObject:v436 forKeyedSubscript:@"LightMatrixValue-63"];

      LODWORD(v437) = 1054951342;
      v438 = [NSNumber numberWithFloat:v437];
      [v5 setObject:v438 forKeyedSubscript:@"DarkBiasValue-64"];

      LODWORD(v439) = 1060487823;
      v440 = [NSNumber numberWithFloat:v439];
      [v5 setObject:v440 forKeyedSubscript:@"DarkMatrixValue-64"];

      LODWORD(v441) = 0.5;
      v442 = [NSNumber numberWithFloat:v441];
      [v5 setObject:v442 forKeyedSubscript:@"LightBiasValue-64"];

      LODWORD(v443) = 1066695393;
      v444 = [NSNumber numberWithFloat:v443];
      [v5 setObject:v444 forKeyedSubscript:@"LightMatrixValue-64"];

      LODWORD(v445) = 1055957975;
      v446 = [NSNumber numberWithFloat:v445];
      [v5 setObject:v446 forKeyedSubscript:@"DarkBiasValue-91"];

      LODWORD(v447) = 1064011039;
      v448 = [NSNumber numberWithFloat:v447];
      [v5 setObject:v448 forKeyedSubscript:@"DarkMatrixValue-91"];

      LODWORD(v449) = 0.5;
      v450 = [NSNumber numberWithFloat:v449];
      [v5 setObject:v450 forKeyedSubscript:@"LightBiasValue-91"];

      LODWORD(v451) = 1065185444;
      v452 = [NSNumber numberWithFloat:v451];
      [v5 setObject:v452 forKeyedSubscript:@"LightMatrixValue-91"];

      LODWORD(v453) = 1055957975;
      v454 = [NSNumber numberWithFloat:v453];
      [v5 setObject:v454 forKeyedSubscript:@"DarkBiasValue-92"];

      LODWORD(v455) = 1063675494;
      v456 = [NSNumber numberWithFloat:v455];
      [v5 setObject:v456 forKeyedSubscript:@"DarkMatrixValue-92"];

      LODWORD(v457) = 0.5;
      v458 = [NSNumber numberWithFloat:v457];
      [v5 setObject:v458 forKeyedSubscript:@"LightBiasValue-92"];

      LODWORD(v459) = 1065185444;
      v162 = [NSNumber numberWithFloat:v459];
      v163 = @"LightMatrixValue-92";
      break;
    case 8201:
      v460 = [NSNumber numberWithInt:108];
      [v5 setObject:v460 forKeyedSubscript:@"BudHeight"];

      LODWORD(v461) = 1051931443;
      v462 = [NSNumber numberWithFloat:v461];
      [v5 setObject:v462 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v463) = 1065772646;
      v464 = [NSNumber numberWithFloat:v463];
      [v5 setObject:v464 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v465) = 0.5;
      v466 = [NSNumber numberWithFloat:v465];
      [v5 setObject:v466 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v467) = 1066695393;
      v468 = [NSNumber numberWithFloat:v467];
      [v5 setObject:v468 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v469) = 1057384038;
      v470 = [NSNumber numberWithFloat:v469];
      [v5 setObject:v470 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v471) = 1058642330;
      v472 = [NSNumber numberWithFloat:v471];
      [v5 setObject:v472 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v473) = 0.5;
      v474 = [NSNumber numberWithFloat:v473];
      [v5 setObject:v474 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v475) = 1066695393;
      v476 = [NSNumber numberWithFloat:v475];
      [v5 setObject:v476 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v477) = 1058474557;
      v478 = [NSNumber numberWithFloat:v477];
      [v5 setObject:v478 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v479) = 1053944709;
      v480 = [NSNumber numberWithFloat:v479];
      [v5 setObject:v480 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v481) = 0.5;
      v482 = [NSNumber numberWithFloat:v481];
      [v5 setObject:v482 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v483) = 1066695393;
      v484 = [NSNumber numberWithFloat:v483];
      [v5 setObject:v484 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v485) = 1057467924;
      v486 = [NSNumber numberWithFloat:v485];
      [v5 setObject:v486 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v487) = 1057132380;
      v488 = [NSNumber numberWithFloat:v487];
      [v5 setObject:v488 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v489) = 0.5;
      v490 = [NSNumber numberWithFloat:v489];
      [v5 setObject:v490 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v491) = 1066695393;
      v492 = [NSNumber numberWithFloat:v491];
      [v5 setObject:v492 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v493) = 1057467924;
      v494 = [NSNumber numberWithFloat:v493];
      [v5 setObject:v494 forKeyedSubscript:@"DarkBiasValue-24"];

      LODWORD(v495) = 0.5;
      v496 = [NSNumber numberWithFloat:v495];
      [v5 setObject:v496 forKeyedSubscript:@"DarkMatrixValue-24"];

      LODWORD(v497) = 0.5;
      v498 = [NSNumber numberWithFloat:v497];
      [v5 setObject:v498 forKeyedSubscript:@"LightBiasValue-24"];

      LODWORD(v499) = 1066695393;
      v500 = [NSNumber numberWithFloat:v499];
      [v5 setObject:v500 forKeyedSubscript:@"LightMatrixValue-24"];

      LODWORD(v501) = 1051931443;
      v502 = [NSNumber numberWithFloat:v501];
      [v5 setObject:v502 forKeyedSubscript:@"DarkBiasValue-25"];

      LODWORD(v503) = 1066024305;
      v504 = [NSNumber numberWithFloat:v503];
      [v5 setObject:v504 forKeyedSubscript:@"DarkMatrixValue-25"];

      LODWORD(v505) = 0.5;
      v506 = [NSNumber numberWithFloat:v505];
      [v5 setObject:v506 forKeyedSubscript:@"LightBiasValue-25"];

      LODWORD(v507) = 1066695393;
      v508 = [NSNumber numberWithFloat:v507];
      [v5 setObject:v508 forKeyedSubscript:@"LightMatrixValue-25"];

      LODWORD(v509) = 1058642330;
      v510 = [NSNumber numberWithFloat:v509];
      [v5 setObject:v510 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v511) = 1050589266;
      v512 = [NSNumber numberWithFloat:v511];
      [v5 setObject:v512 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v513) = 0.5;
      v514 = [NSNumber numberWithFloat:v513];
      [v5 setObject:v514 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v515) = 1066695393;
      v516 = [NSNumber numberWithFloat:v515];
      [v5 setObject:v516 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v517) = 1057803469;
      v518 = [NSNumber numberWithFloat:v517];
      [v5 setObject:v518 forKeyedSubscript:@"DarkBiasValue-38"];

      LODWORD(v519) = 1060320051;
      v520 = [NSNumber numberWithFloat:v519];
      [v5 setObject:v520 forKeyedSubscript:@"DarkMatrixValue-38"];

      LODWORD(v521) = 0.5;
      v522 = [NSNumber numberWithFloat:v521];
      [v5 setObject:v522 forKeyedSubscript:@"LightBiasValue-38"];

      LODWORD(v523) = 1066695393;
      v524 = [NSNumber numberWithFloat:v523];
      [v5 setObject:v524 forKeyedSubscript:@"LightMatrixValue-38"];

      LODWORD(v525) = 1051931443;
      v526 = [NSNumber numberWithFloat:v525];
      [v5 setObject:v526 forKeyedSubscript:@"DarkBiasValue-39"];

      LODWORD(v527) = 1065772646;
      v528 = [NSNumber numberWithFloat:v527];
      [v5 setObject:v528 forKeyedSubscript:@"DarkMatrixValue-39"];

      LODWORD(v529) = 0.5;
      v530 = [NSNumber numberWithFloat:v529];
      [v5 setObject:v530 forKeyedSubscript:@"LightBiasValue-39"];

      LODWORD(v531) = 1066695393;
      v532 = [NSNumber numberWithFloat:v531];
      [v5 setObject:v532 forKeyedSubscript:@"LightMatrixValue-39"];

      LODWORD(v533) = 1057635697;
      v534 = [NSNumber numberWithFloat:v533];
      [v5 setObject:v534 forKeyedSubscript:@"DarkBiasValue-40"];

      LODWORD(v535) = 1058474557;
      v536 = [NSNumber numberWithFloat:v535];
      [v5 setObject:v536 forKeyedSubscript:@"DarkMatrixValue-40"];

      LODWORD(v537) = 0.5;
      v538 = [NSNumber numberWithFloat:v537];
      [v5 setObject:v538 forKeyedSubscript:@"LightBiasValue-40"];

      LODWORD(v539) = 1066695393;
      v540 = [NSNumber numberWithFloat:v539];
      [v5 setObject:v540 forKeyedSubscript:@"LightMatrixValue-40"];

      LODWORD(v541) = 1053944709;
      v542 = [NSNumber numberWithFloat:v541];
      [v5 setObject:v542 forKeyedSubscript:@"DarkBiasValue-41"];

      LODWORD(v543) = 1062836634;
      v544 = [NSNumber numberWithFloat:v543];
      [v5 setObject:v544 forKeyedSubscript:@"DarkMatrixValue-41"];

      LODWORD(v545) = 0.5;
      v546 = [NSNumber numberWithFloat:v545];
      [v5 setObject:v546 forKeyedSubscript:@"LightBiasValue-41"];

      LODWORD(v547) = 1066695393;
      v548 = [NSNumber numberWithFloat:v547];
      [v5 setObject:v548 forKeyedSubscript:@"LightMatrixValue-41"];

      LODWORD(v549) = 1052938076;
      v550 = [NSNumber numberWithFloat:v549];
      [v5 setObject:v550 forKeyedSubscript:@"DarkBiasValue-66"];

      LODWORD(v551) = 1059145646;
      v552 = [NSNumber numberWithFloat:v551];
      [v5 setObject:v552 forKeyedSubscript:@"DarkMatrixValue-66"];

      LODWORD(v553) = 0.5;
      v554 = [NSNumber numberWithFloat:v553];
      [v5 setObject:v554 forKeyedSubscript:@"LightBiasValue-66"];

      LODWORD(v555) = 1066695393;
      v556 = [NSNumber numberWithFloat:v555];
      [v5 setObject:v556 forKeyedSubscript:@"LightMatrixValue-66"];

      LODWORD(v557) = 1051595899;
      v558 = [NSNumber numberWithFloat:v557];
      [v5 setObject:v558 forKeyedSubscript:@"DarkBiasValue-67"];

      LODWORD(v559) = 1065520988;
      v560 = [NSNumber numberWithFloat:v559];
      [v5 setObject:v560 forKeyedSubscript:@"DarkMatrixValue-67"];

      LODWORD(v561) = 0.5;
      v562 = [NSNumber numberWithFloat:v561];
      [v5 setObject:v562 forKeyedSubscript:@"LightBiasValue-67"];

      LODWORD(v563) = 1066695393;
      v162 = [NSNumber numberWithFloat:v563];
      v163 = @"LightMatrixValue-67";
      break;
    case 8202:
      goto LABEL_33;
    case 8203:
      v564 = [NSNumber numberWithInt:86];
      [v5 setObject:v564 forKeyedSubscript:@"BudHeight"];

      v565 = [NSNumber numberWithInt:6];
      [v5 setObject:v565 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v566 = [NSNumber numberWithInt:17];
      [v5 setObject:v566 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v567 = [NSNumber numberWithInt:70];
      [v5 setObject:v567 forKeyedSubscript:@"CaseHeight"];

      v568 = [NSNumber numberWithInt:33];
      [v5 setObject:v568 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v569 = [NSNumber numberWithInt:22];
      [v5 setObject:v569 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v570) = 0.5;
      v571 = [NSNumber numberWithFloat:v570];
      [v5 setObject:v571 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v572) = 1063675494;
      v573 = [NSNumber numberWithFloat:v572];
      [v5 setObject:v573 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v574) = 1057300152;
      v575 = [NSNumber numberWithFloat:v574];
      [v5 setObject:v575 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v576) = 1066695393;
      v577 = [NSNumber numberWithFloat:v576];
      [v5 setObject:v577 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v578) = 0.5;
      v579 = [NSNumber numberWithFloat:v578];
      [v5 setObject:v579 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v580) = 1061997773;
      v581 = [NSNumber numberWithFloat:v580];
      [v5 setObject:v581 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v582) = 1057803469;
      v583 = [NSNumber numberWithFloat:v582];
      [v5 setObject:v583 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v584) = 1066695393;
      v585 = [NSNumber numberWithFloat:v584];
      [v5 setObject:v585 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v586) = 0.5;
      v587 = [NSNumber numberWithFloat:v586];
      [v5 setObject:v587 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v588) = 1064514355;
      v589 = [NSNumber numberWithFloat:v588];
      [v5 setObject:v589 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v590) = 0.5;
      v591 = [NSNumber numberWithFloat:v590];
      [v5 setObject:v591 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v592) = 1066695393;
      v593 = [NSNumber numberWithFloat:v592];
      [v5 setObject:v593 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v594) = 0.5;
      v595 = [NSNumber numberWithFloat:v594];
      [v5 setObject:v595 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v596) = 1063675494;
      v597 = [NSNumber numberWithFloat:v596];
      [v5 setObject:v597 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v598) = 1058642330;
      v599 = [NSNumber numberWithFloat:v598];
      [v5 setObject:v599 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v600) = 1066695393;
      v601 = [NSNumber numberWithFloat:v600];
      [v5 setObject:v601 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v602) = 0.5;
      v603 = [NSNumber numberWithFloat:v602];
      [v5 setObject:v603 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v604) = 1064514355;
      v605 = [NSNumber numberWithFloat:v604];
      [v5 setObject:v605 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v606) = 1058306785;
      v607 = [NSNumber numberWithFloat:v606];
      [v5 setObject:v607 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v608) = 1066695393;
      v609 = [NSNumber numberWithFloat:v608];
      [v5 setObject:v609 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v610) = 0.5;
      v611 = [NSNumber numberWithFloat:v610];
      [v5 setObject:v611 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v612) = 1064514355;
      v613 = [NSNumber numberWithFloat:v612];
      [v5 setObject:v613 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v614) = 1057803469;
      v615 = [NSNumber numberWithFloat:v614];
      [v5 setObject:v615 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v616) = 1066695393;
      v617 = [NSNumber numberWithFloat:v616];
      [v5 setObject:v617 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v618) = 0.5;
      v619 = [NSNumber numberWithFloat:v618];
      [v5 setObject:v619 forKeyedSubscript:@"DarkBiasValue-11"];

      LODWORD(v620) = 1063675494;
      v621 = [NSNumber numberWithFloat:v620];
      [v5 setObject:v621 forKeyedSubscript:@"DarkMatrixValue-11"];

      LODWORD(v622) = 1058642330;
      v623 = [NSNumber numberWithFloat:v622];
      [v5 setObject:v623 forKeyedSubscript:@"LightBiasValue-11"];

      LODWORD(v624) = 1066695393;
      v625 = [NSNumber numberWithFloat:v624];
      [v5 setObject:v625 forKeyedSubscript:@"LightMatrixValue-11"];

      LODWORD(v626) = 0.5;
      v627 = [NSNumber numberWithFloat:v626];
      [v5 setObject:v627 forKeyedSubscript:@"DarkBiasValue-13"];

      LODWORD(v628) = 1064514355;
      v629 = [NSNumber numberWithFloat:v628];
      [v5 setObject:v629 forKeyedSubscript:@"DarkMatrixValue-13"];

      LODWORD(v630) = 0.5;
      v631 = [NSNumber numberWithFloat:v630];
      [v5 setObject:v631 forKeyedSubscript:@"LightBiasValue-13"];

      LODWORD(v632) = 1066695393;
      v162 = [NSNumber numberWithFloat:v632];
      v163 = @"LightMatrixValue-13";
      break;
    case 8204:
      v633 = [NSNumber numberWithInt:108];
      [v5 setObject:v633 forKeyedSubscript:@"BudHeight"];

      LODWORD(v634) = 1058810102;
      v635 = [NSNumber numberWithFloat:v634];
      [v5 setObject:v635 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v636) = 1053273620;
      v637 = [NSNumber numberWithFloat:v636];
      [v5 setObject:v637 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v638) = 0.5;
      v639 = [NSNumber numberWithFloat:v638];
      [v5 setObject:v639 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v640) = 1066695393;
      v641 = [NSNumber numberWithFloat:v640];
      [v5 setObject:v641 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v642) = 1056293519;
      v643 = [NSNumber numberWithFloat:v642];
      [v5 setObject:v643 forKeyedSubscript:@"DarkBiasValue-60"];

      LODWORD(v644) = 1063172178;
      v645 = [NSNumber numberWithFloat:v644];
      [v5 setObject:v645 forKeyedSubscript:@"DarkMatrixValue-60"];

      LODWORD(v646) = 0.5;
      v647 = [NSNumber numberWithFloat:v646];
      [v5 setObject:v647 forKeyedSubscript:@"LightBiasValue-60"];

      LODWORD(v648) = 1066695393;
      v649 = [NSNumber numberWithFloat:v648];
      [v5 setObject:v649 forKeyedSubscript:@"LightMatrixValue-60"];

      LODWORD(v650) = 1053609165;
      v651 = [NSNumber numberWithFloat:v650];
      [v5 setObject:v651 forKeyedSubscript:@"DarkBiasValue-69"];

      LODWORD(v652) = 1063507722;
      v653 = [NSNumber numberWithFloat:v652];
      [v5 setObject:v653 forKeyedSubscript:@"DarkMatrixValue-69"];

      LODWORD(v654) = 0.5;
      v655 = [NSNumber numberWithFloat:v654];
      [v5 setObject:v655 forKeyedSubscript:@"LightBiasValue-69"];

      LODWORD(v656) = 1066695393;
      v657 = [NSNumber numberWithFloat:v656];
      [v5 setObject:v657 forKeyedSubscript:@"LightMatrixValue-69"];

      LODWORD(v658) = 1053609165;
      v659 = [NSNumber numberWithFloat:v658];
      [v5 setObject:v659 forKeyedSubscript:@"DarkBiasValue-70"];

      LODWORD(v660) = 1063172178;
      v661 = [NSNumber numberWithFloat:v660];
      [v5 setObject:v661 forKeyedSubscript:@"DarkMatrixValue-70"];

      LODWORD(v662) = 0.5;
      v663 = [NSNumber numberWithFloat:v662];
      [v5 setObject:v663 forKeyedSubscript:@"LightBiasValue-70"];

      LODWORD(v664) = 1066695393;
      v665 = [NSNumber numberWithFloat:v664];
      [v5 setObject:v665 forKeyedSubscript:@"LightMatrixValue-70"];

      LODWORD(v666) = 1058139013;
      v667 = [NSNumber numberWithFloat:v666];
      [v5 setObject:v667 forKeyedSubscript:@"DarkBiasValue-71"];

      LODWORD(v668) = 1056125747;
      v669 = [NSNumber numberWithFloat:v668];
      [v5 setObject:v669 forKeyedSubscript:@"DarkMatrixValue-71"];

      LODWORD(v670) = 0.5;
      v671 = [NSNumber numberWithFloat:v670];
      [v5 setObject:v671 forKeyedSubscript:@"LightBiasValue-71"];

      LODWORD(v672) = 1066695393;
      v673 = [NSNumber numberWithFloat:v672];
      [v5 setObject:v673 forKeyedSubscript:@"LightMatrixValue-71"];

      LODWORD(v674) = 1054615798;
      v675 = [NSNumber numberWithFloat:v674];
      [v5 setObject:v675 forKeyedSubscript:@"DarkBiasValue-72"];

      LODWORD(v676) = 1061830001;
      v677 = [NSNumber numberWithFloat:v676];
      [v5 setObject:v677 forKeyedSubscript:@"DarkMatrixValue-72"];

      LODWORD(v678) = 0.5;
      v679 = [NSNumber numberWithFloat:v678];
      [v5 setObject:v679 forKeyedSubscript:@"LightBiasValue-72"];

      LODWORD(v680) = 1066695393;
      v162 = [NSNumber numberWithFloat:v680];
      v163 = @"LightMatrixValue-72";
      break;
    case 8205:
      v681 = [NSNumber numberWithInt:108];
      [v5 setObject:v681 forKeyedSubscript:@"BudHeight"];

      LODWORD(v682) = 1050421494;
      v683 = [NSNumber numberWithFloat:v682];
      [v5 setObject:v683 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v684) = 1066192077;
      v685 = [NSNumber numberWithFloat:v684];
      [v5 setObject:v685 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v686) = 0.5;
      v687 = [NSNumber numberWithFloat:v686];
      [v5 setObject:v687 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v688) = 1066695393;
      v689 = [NSNumber numberWithFloat:v688];
      [v5 setObject:v689 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v690) = 0.375;
      v691 = [NSNumber numberWithFloat:v690];
      [v5 setObject:v691 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v692) = 1058810102;
      v693 = [NSNumber numberWithFloat:v692];
      [v5 setObject:v693 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v694) = 0.5;
      v695 = [NSNumber numberWithFloat:v694];
      [v5 setObject:v695 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v696) = 1066695393;
      v697 = [NSNumber numberWithFloat:v696];
      [v5 setObject:v697 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v698) = 1055286886;
      v699 = [NSNumber numberWithFloat:v698];
      [v5 setObject:v699 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v700) = 1060320051;
      v701 = [NSNumber numberWithFloat:v700];
      [v5 setObject:v701 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v702) = 0.5;
      v703 = [NSNumber numberWithFloat:v702];
      [v5 setObject:v703 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v704) = 1066695393;
      v162 = [NSNumber numberWithFloat:v704];
      v163 = @"LightMatrixValue-2";
      break;
    case 8206:
      v705 = [NSNumber numberWithInt:64];
      [v5 setObject:v705 forKeyedSubscript:@"BudHeight"];

      v706 = [NSNumber numberWithInt:6];
      [v5 setObject:v706 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v707 = [NSNumber numberWithInt:27];
      [v5 setObject:v707 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v708 = [NSNumber numberWithInt:92];
      [v5 setObject:v708 forKeyedSubscript:@"CaseHeight"];

      v709 = [NSNumber numberWithInt:59];
      [v5 setObject:v709 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v710 = [NSNumber numberWithInt:38];
      [v5 setObject:v710 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v711) = 1053609165;
      v712 = [NSNumber numberWithFloat:v711];
      [v5 setObject:v712 forKeyedSubscript:@"DarkBiasValue"];

      v40 = NSNumber;
      LODWORD(v41) = 1065772646;
      goto LABEL_16;
    case 8208:
      v714 = [NSNumber numberWithInt:108];
      [v5 setObject:v714 forKeyedSubscript:@"BudHeight"];

      LODWORD(v715) = 0.5;
      v716 = [NSNumber numberWithFloat:v715];
      [v5 setObject:v716 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v717) = 1063675494;
      v718 = [NSNumber numberWithFloat:v717];
      [v5 setObject:v718 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v719) = 1057803469;
      v720 = [NSNumber numberWithFloat:v719];
      [v5 setObject:v720 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v721) = 1068792545;
      v722 = [NSNumber numberWithFloat:v721];
      [v5 setObject:v722 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v723) = 1055622431;
      v724 = [NSNumber numberWithFloat:v723];
      [v5 setObject:v724 forKeyedSubscript:@"DarkBiasValue-77"];

      LODWORD(v725) = 1064849900;
      v726 = [NSNumber numberWithFloat:v725];
      [v5 setObject:v726 forKeyedSubscript:@"DarkMatrixValue-77"];

      LODWORD(v727) = 0.5;
      v728 = [NSNumber numberWithFloat:v727];
      [v5 setObject:v728 forKeyedSubscript:@"LightBiasValue-77"];

      LODWORD(v729) = 1.0;
      v730 = [NSNumber numberWithFloat:v729];
      [v5 setObject:v730 forKeyedSubscript:@"LightMatrixValue-77"];

      LODWORD(v731) = 1054280253;
      v732 = [NSNumber numberWithFloat:v731];
      [v5 setObject:v732 forKeyedSubscript:@"DarkBiasValue-78"];

      LODWORD(v733) = 1064849900;
      v734 = [NSNumber numberWithFloat:v733];
      [v5 setObject:v734 forKeyedSubscript:@"DarkMatrixValue-78"];

      LODWORD(v735) = 0.5;
      v736 = [NSNumber numberWithFloat:v735];
      [v5 setObject:v736 forKeyedSubscript:@"LightBiasValue-78"];

      LODWORD(v737) = 1.0;
      v738 = [NSNumber numberWithFloat:v737];
      [v5 setObject:v738 forKeyedSubscript:@"LightMatrixValue-78"];

      LODWORD(v739) = 1053609165;
      v740 = [NSNumber numberWithFloat:v739];
      [v5 setObject:v740 forKeyedSubscript:@"DarkBiasValue-79"];

      LODWORD(v741) = 1065017672;
      v742 = [NSNumber numberWithFloat:v741];
      [v5 setObject:v742 forKeyedSubscript:@"DarkMatrixValue-79"];

      LODWORD(v743) = 0.5;
      v744 = [NSNumber numberWithFloat:v743];
      [v5 setObject:v744 forKeyedSubscript:@"LightBiasValue-79"];

      LODWORD(v745) = 1.0;
      v162 = [NSNumber numberWithFloat:v745];
      v163 = @"LightMatrixValue-79";
      break;
    case 8209:
      v746 = [NSNumber numberWithInt:31];
      [v5 setObject:v746 forKeyedSubscript:@"BudHeight"];

      v747 = [NSNumber numberWithInt:6];
      [v5 setObject:v747 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v748 = [NSNumber numberWithInt:25];
      [v5 setObject:v748 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v749 = [NSNumber numberWithInt:100];
      [v5 setObject:v749 forKeyedSubscript:@"CaseHeight"];

      v750 = [NSNumber numberWithInt:49];
      [v5 setObject:v750 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v751 = [NSNumber numberWithInt:30];
      [v5 setObject:v751 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v752) = 1052938076;
      v753 = [NSNumber numberWithFloat:v752];
      [v5 setObject:v753 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v754) = 1065017672;
      v755 = [NSNumber numberWithFloat:v754];
      [v5 setObject:v755 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v756) = 0.5;
      v757 = [NSNumber numberWithFloat:v756];
      [v5 setObject:v757 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v758) = 1.0;
      v759 = [NSNumber numberWithFloat:v758];
      [v5 setObject:v759 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v760) = 1056293519;
      v761 = [NSNumber numberWithFloat:v760];
      [v5 setObject:v761 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v762) = 1064849900;
      v763 = [NSNumber numberWithFloat:v762];
      [v5 setObject:v763 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v764) = 1057300152;
      v765 = [NSNumber numberWithFloat:v764];
      [v5 setObject:v765 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v766) = 1066527621;
      v767 = [NSNumber numberWithFloat:v766];
      [v5 setObject:v767 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v768) = 1055622431;
      v769 = [NSNumber numberWithFloat:v768];
      [v5 setObject:v769 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v770) = 1064682127;
      v771 = [NSNumber numberWithFloat:v770];
      [v5 setObject:v771 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v772) = 0.5;
      v773 = [NSNumber numberWithFloat:v772];
      [v5 setObject:v773 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v774) = 1.0;
      v775 = [NSNumber numberWithFloat:v774];
      [v5 setObject:v775 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v776) = 1055622431;
      v777 = [NSNumber numberWithFloat:v776];
      [v5 setObject:v777 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v778) = 1064514355;
      v779 = [NSNumber numberWithFloat:v778];
      [v5 setObject:v779 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v780) = 0.5;
      v781 = [NSNumber numberWithFloat:v780];
      [v5 setObject:v781 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v782) = 1.0;
      v783 = [NSNumber numberWithFloat:v782];
      [v5 setObject:v783 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v784) = 1055957975;
      v785 = [NSNumber numberWithFloat:v784];
      [v5 setObject:v785 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v786) = 1065017672;
      v787 = [NSNumber numberWithFloat:v786];
      [v5 setObject:v787 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v788) = 0.5;
      v789 = [NSNumber numberWithFloat:v788];
      [v5 setObject:v789 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v790) = 1.0;
      v791 = [NSNumber numberWithFloat:v790];
      [v5 setObject:v791 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v792) = 1055622431;
      v793 = [NSNumber numberWithFloat:v792];
      [v5 setObject:v793 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v794) = 1064346583;
      v795 = [NSNumber numberWithFloat:v794];
      [v5 setObject:v795 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v796) = 0.5;
      v797 = [NSNumber numberWithFloat:v796];
      [v5 setObject:v797 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v798) = 1.0;
      v162 = [NSNumber numberWithFloat:v798];
      v163 = @"LightMatrixValue-6";
      break;
    case 8210:
      v799 = [NSNumber numberWithInt:51];
      [v5 setObject:v799 forKeyedSubscript:@"BudHeight"];

      v800 = [NSNumber numberWithInt:6];
      [v5 setObject:v800 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v801 = [NSNumber numberWithInt:28];
      [v5 setObject:v801 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v802 = [NSNumber numberWithInt:52];
      [v5 setObject:v802 forKeyedSubscript:@"CaseHeight"];

      v803 = [NSNumber numberWithInt:50];
      [v5 setObject:v803 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v804 = [NSNumber numberWithInt:28];
      [v5 setObject:v804 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v805) = 1056293519;
      v806 = [NSNumber numberWithFloat:v805];
      [v5 setObject:v806 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v807) = 1064514355;
      v808 = [NSNumber numberWithFloat:v807];
      [v5 setObject:v808 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v809) = 0.5;
      v810 = [NSNumber numberWithFloat:v809];
      [v5 setObject:v810 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v811) = 1065604874;
      v812 = [NSNumber numberWithFloat:v811];
      [v5 setObject:v812 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v813) = 0.5;
      v814 = [NSNumber numberWithFloat:v813];
      [v5 setObject:v814 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v815) = 0.75;
      v816 = [NSNumber numberWithFloat:v815];
      [v5 setObject:v816 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v817) = 0.5;
      v818 = [NSNumber numberWithFloat:v817];
      [v5 setObject:v818 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v819) = 1.0;
      v820 = [NSNumber numberWithFloat:v819];
      [v5 setObject:v820 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v821) = 1056293519;
      v822 = [NSNumber numberWithFloat:v821];
      [v5 setObject:v822 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v823) = 1064178811;
      v824 = [NSNumber numberWithFloat:v823];
      [v5 setObject:v824 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v825) = 0.5;
      v826 = [NSNumber numberWithFloat:v825];
      [v5 setObject:v826 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v827) = 1.0;
      v828 = [NSNumber numberWithFloat:v827];
      [v5 setObject:v828 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v829) = 1056293519;
      v830 = [NSNumber numberWithFloat:v829];
      [v5 setObject:v830 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v831) = 1063507722;
      v832 = [NSNumber numberWithFloat:v831];
      [v5 setObject:v832 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v833) = 0.5;
      v834 = [NSNumber numberWithFloat:v833];
      [v5 setObject:v834 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v835) = 1.0;
      v836 = [NSNumber numberWithFloat:v835];
      [v5 setObject:v836 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v837) = 1056293519;
      v838 = [NSNumber numberWithFloat:v837];
      [v5 setObject:v838 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v839) = 1064178811;
      v840 = [NSNumber numberWithFloat:v839];
      [v5 setObject:v840 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v841) = 0.5;
      v842 = [NSNumber numberWithFloat:v841];
      [v5 setObject:v842 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v843) = 1.0;
      v844 = [NSNumber numberWithFloat:v843];
      [v5 setObject:v844 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v845) = 1056629064;
      v846 = [NSNumber numberWithFloat:v845];
      [v5 setObject:v846 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v847) = 1064514355;
      v848 = [NSNumber numberWithFloat:v847];
      [v5 setObject:v848 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v849) = 0.5;
      v850 = [NSNumber numberWithFloat:v849];
      [v5 setObject:v850 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v851) = 1.0;
      v852 = [NSNumber numberWithFloat:v851];
      [v5 setObject:v852 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v853) = 1055286886;
      v854 = [NSNumber numberWithFloat:v853];
      [v5 setObject:v854 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v855) = 1063507722;
      v856 = [NSNumber numberWithFloat:v855];
      [v5 setObject:v856 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v857) = 0.5;
      v858 = [NSNumber numberWithFloat:v857];
      [v5 setObject:v858 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v859) = 1.0;
      v860 = [NSNumber numberWithFloat:v859];
      [v5 setObject:v860 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v861) = 1054951342;
      v862 = [NSNumber numberWithFloat:v861];
      [v5 setObject:v862 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v863) = 1062501089;
      v864 = [NSNumber numberWithFloat:v863];
      [v5 setObject:v864 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v865) = 0.5;
      v866 = [NSNumber numberWithFloat:v865];
      [v5 setObject:v866 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v867) = 1.0;
      v868 = [NSNumber numberWithFloat:v867];
      [v5 setObject:v868 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v869) = 1056293519;
      v870 = [NSNumber numberWithFloat:v869];
      [v5 setObject:v870 forKeyedSubscript:@"DarkBiasValue-8"];

      LODWORD(v871) = 1063507722;
      v872 = [NSNumber numberWithFloat:v871];
      [v5 setObject:v872 forKeyedSubscript:@"DarkMatrixValue-8"];

      LODWORD(v873) = 0.5;
      v874 = [NSNumber numberWithFloat:v873];
      [v5 setObject:v874 forKeyedSubscript:@"LightBiasValue-8"];

      LODWORD(v875) = 1.0;
      v876 = [NSNumber numberWithFloat:v875];
      [v5 setObject:v876 forKeyedSubscript:@"LightMatrixValue-8"];

      LODWORD(v877) = 1055286886;
      v878 = [NSNumber numberWithFloat:v877];
      [v5 setObject:v878 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v879) = 1060655596;
      v880 = [NSNumber numberWithFloat:v879];
      [v5 setObject:v880 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v881) = 0.5;
      v882 = [NSNumber numberWithFloat:v881];
      [v5 setObject:v882 forKeyedSubscript:@"LightBiasValue-9"];

      v883 = NSNumber;
      LODWORD(v884) = 1.0;
      goto LABEL_28;
    case 8211:
      v885 = [NSNumber numberWithInt:62];
      [v5 setObject:v885 forKeyedSubscript:@"BudHeight"];

      v886 = [NSNumber numberWithInt:6];
      [v5 setObject:v886 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v887 = [NSNumber numberWithInt:34];
      [v5 setObject:v887 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v888 = [NSNumber numberWithInt:94];
      [v5 setObject:v888 forKeyedSubscript:@"CaseHeight"];

      v889 = [NSNumber numberWithInt:74];
      [v5 setObject:v889 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v890 = [NSNumber numberWithInt:46];
      [v5 setObject:v890 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v891) = 1053776937;
      v892 = [NSNumber numberWithFloat:v891];
      [v5 setObject:v892 forKeyedSubscript:@"DarkBiasValue"];

      LODWORD(v893) = 1066359849;
      v894 = [NSNumber numberWithFloat:v893];
      [v5 setObject:v894 forKeyedSubscript:@"DarkMatrixValue"];

      float v30 = NSNumber;
      LODWORD(v31) = 1058139013;
      goto LABEL_21;
    case 8212:
    case 8228:
      uint64_t v32 = [NSNumber numberWithInt:64];
      [v5 setObject:v32 forKeyedSubscript:@"BudHeight"];

      v33 = [NSNumber numberWithInt:6];
      [v5 setObject:v33 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      float v34 = [NSNumber numberWithInt:27];
      [v5 setObject:v34 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v35 = [NSNumber numberWithInt:102];
      [v5 setObject:v35 forKeyedSubscript:@"CaseHeight"];

      float v36 = [NSNumber numberWithInt:59];
      [v5 setObject:v36 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v37 = [NSNumber numberWithInt:38];
      [v5 setObject:v37 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v38) = 1053273620;
      v39 = [NSNumber numberWithFloat:v38];
      [v5 setObject:v39 forKeyedSubscript:@"DarkBiasValue"];

      v40 = NSNumber;
      LODWORD(v41) = 1066443735;
LABEL_16:
      v713 = [v40 numberWithFloat:v41];
      [v5 setObject:v713 forKeyedSubscript:@"DarkMatrixValue"];

      float v30 = NSNumber;
      LODWORD(v31) = 1057803469;
LABEL_21:
      v895 = [v30 numberWithFloat:v31];
      [v5 setObject:v895 forKeyedSubscript:@"LightBiasValue"];

      v18 = NSNumber;
      LODWORD(v19) = 1066695393;
      goto LABEL_22;
    case 8214:
      v897 = [NSNumber numberWithInt:31];
      [v5 setObject:v897 forKeyedSubscript:@"BudHeight"];

      v898 = [NSNumber numberWithInt:6];
      [v5 setObject:v898 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v899 = [NSNumber numberWithInt:25];
      [v5 setObject:v899 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v900 = [NSNumber numberWithInt:100];
      [v5 setObject:v900 forKeyedSubscript:@"CaseHeight"];

      v901 = [NSNumber numberWithInt:49];
      [v5 setObject:v901 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v902 = [NSNumber numberWithInt:30];
      [v5 setObject:v902 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v903) = 1056293519;
      v904 = [NSNumber numberWithFloat:v903];
      [v5 setObject:v904 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v905) = 1064849900;
      v906 = [NSNumber numberWithFloat:v905];
      [v5 setObject:v906 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v907) = 1057300152;
      v908 = [NSNumber numberWithFloat:v907];
      [v5 setObject:v908 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v909) = 1066527621;
      v910 = [NSNumber numberWithFloat:v909];
      [v5 setObject:v910 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v911) = 1054615798;
      v912 = [NSNumber numberWithFloat:v911];
      [v5 setObject:v912 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v913) = 1064849900;
      v914 = [NSNumber numberWithFloat:v913];
      [v5 setObject:v914 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v915) = 0.5;
      v916 = [NSNumber numberWithFloat:v915];
      [v5 setObject:v916 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v917) = 1.0;
      v918 = [NSNumber numberWithFloat:v917];
      [v5 setObject:v918 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v919) = 1055957975;
      v920 = [NSNumber numberWithFloat:v919];
      [v5 setObject:v920 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v921) = 1063843267;
      v922 = [NSNumber numberWithFloat:v921];
      [v5 setObject:v922 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v923) = 1056360628;
      v924 = [NSNumber numberWithFloat:v923];
      [v5 setObject:v924 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v925) = 1064766013;
      v926 = [NSNumber numberWithFloat:v925];
      [v5 setObject:v926 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v927) = 1053609165;
      v928 = [NSNumber numberWithFloat:v927];
      [v5 setObject:v928 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v929) = 1064346583;
      v930 = [NSNumber numberWithFloat:v929];
      [v5 setObject:v930 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v931) = 0.5;
      v932 = [NSNumber numberWithFloat:v931];
      [v5 setObject:v932 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v933) = 1.0;
      v934 = [NSNumber numberWithFloat:v933];
      [v5 setObject:v934 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v935) = 1054615798;
      v936 = [NSNumber numberWithFloat:v935];
      [v5 setObject:v936 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v937) = 1064514355;
      v938 = [NSNumber numberWithFloat:v937];
      [v5 setObject:v938 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v939) = 0.5;
      v940 = [NSNumber numberWithFloat:v939];
      [v5 setObject:v940 forKeyedSubscript:@"LightBiasValue-4"];

      v941 = NSNumber;
      LODWORD(v942) = 1.0;
      goto LABEL_31;
    case 8215:
      v943 = [NSNumber numberWithInt:108];
      [v5 setObject:v943 forKeyedSubscript:@"BudHeight"];

      LODWORD(v944) = 1056159302;
      v945 = [NSNumber numberWithFloat:v944];
      [v5 setObject:v945 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v946) = 1065269330;
      v947 = [NSNumber numberWithFloat:v946];
      [v5 setObject:v947 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v948) = 0.5;
      v949 = [NSNumber numberWithFloat:v948];
      [v5 setObject:v949 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v950) = 1.0;
      v951 = [NSNumber numberWithFloat:v950];
      [v5 setObject:v951 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v952) = 1056226410;
      v953 = [NSNumber numberWithFloat:v952];
      [v5 setObject:v953 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v954) = 1064262697;
      v955 = [NSNumber numberWithFloat:v954];
      [v5 setObject:v955 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v956) = 0.5;
      v957 = [NSNumber numberWithFloat:v956];
      [v5 setObject:v957 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v958) = 1.0;
      v959 = [NSNumber numberWithFloat:v958];
      [v5 setObject:v959 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v960) = 1056629064;
      v961 = [NSNumber numberWithFloat:v960];
      [v5 setObject:v961 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v962) = 1065017672;
      v963 = [NSNumber numberWithFloat:v962];
      [v5 setObject:v963 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v964) = 0.5;
      v965 = [NSNumber numberWithFloat:v964];
      [v5 setObject:v965 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v966) = 1065604874;
      v967 = [NSNumber numberWithFloat:v966];
      [v5 setObject:v967 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v968) = 1057300152;
      v969 = [NSNumber numberWithFloat:v968];
      [v5 setObject:v969 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v970) = 1063675494;
      v971 = [NSNumber numberWithFloat:v970];
      [v5 setObject:v971 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v972) = 1057803469;
      v973 = [NSNumber numberWithFloat:v972];
      [v5 setObject:v973 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v974) = 1065017672;
      v975 = [NSNumber numberWithFloat:v974];
      [v5 setObject:v975 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v976) = 0.5;
      v977 = [NSNumber numberWithFloat:v976];
      [v5 setObject:v977 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v978) = 1.0;
      v979 = [NSNumber numberWithFloat:v978];
      [v5 setObject:v979 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v980) = 1057132380;
      v981 = [NSNumber numberWithFloat:v980];
      [v5 setObject:v981 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v982) = 1065772646;
      v983 = [NSNumber numberWithFloat:v982];
      [v5 setObject:v983 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v984) = 1056360628;
      v985 = [NSNumber numberWithFloat:v984];
      [v5 setObject:v985 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v986) = 1065772646;
      v987 = [NSNumber numberWithFloat:v986];
      [v5 setObject:v987 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v988) = 0.5;
      v989 = [NSNumber numberWithFloat:v988];
      [v5 setObject:v989 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v990) = 1.0;
      v991 = [NSNumber numberWithFloat:v990];
      [v5 setObject:v991 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v992) = 1056427737;
      v993 = [NSNumber numberWithFloat:v992];
      [v5 setObject:v993 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v994) = 1064849900;
      v995 = [NSNumber numberWithFloat:v994];
      [v5 setObject:v995 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v996) = 1057434370;
      v997 = [NSNumber numberWithFloat:v996];
      [v5 setObject:v997 forKeyedSubscript:@"LightBiasValue-9"];

      v883 = NSNumber;
      LODWORD(v884) = 1066317906;
LABEL_28:
      v162 = [v883 numberWithFloat:v884];
      v163 = @"LightMatrixValue-9";
      break;
    case 8217:
    case 8219:
    case 8222:
    case 8224:
      v6 = [NSNumber numberWithInt:62];
      [v5 setObject:v6 forKeyedSubscript:@"BudHeight"];

      v7 = [NSNumber numberWithInt:6];
      [v5 setObject:v7 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v8 = [NSNumber numberWithInt:34];
      [v5 setObject:v8 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v9 = [NSNumber numberWithInt:94];
      [v5 setObject:v9 forKeyedSubscript:@"CaseHeight"];

      id v10 = [NSNumber numberWithInt:74];
      [v5 setObject:v10 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v11 = [NSNumber numberWithInt:46];
      [v5 setObject:v11 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v12) = 1053609165;
      v13 = [NSNumber numberWithFloat:v12];
      [v5 setObject:v13 forKeyedSubscript:@"DarkBiasValue"];

      LODWORD(v14) = 1065940419;
      v15 = [NSNumber numberWithFloat:v14];
      [v5 setObject:v15 forKeyedSubscript:@"DarkMatrixValue"];

      LODWORD(v16) = 0.5;
      int v17 = [NSNumber numberWithFloat:v16];
      [v5 setObject:v17 forKeyedSubscript:@"LightBiasValue"];

      v18 = NSNumber;
      LODWORD(v19) = 1065940419;
LABEL_22:
      v162 = [v18 numberWithFloat:v19];
      v163 = @"LightMatrixValue";
      break;
    case 8218:
      v998 = [NSNumber numberWithInt:108];
      [v5 setObject:v998 forKeyedSubscript:@"BudHeight"];

      LODWORD(v999) = 0.5;
      v1000 = [NSNumber numberWithFloat:v999];
      [v5 setObject:v1000 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v1001) = 1.0;
      v1002 = [NSNumber numberWithFloat:v1001];
      [v5 setObject:v1002 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v1003) = 1055957975;
      v1004 = [NSNumber numberWithFloat:v1003];
      [v5 setObject:v1004 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1005) = 1061997773;
      v1006 = [NSNumber numberWithFloat:v1005];
      [v5 setObject:v1006 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1007) = 0.5;
      v1008 = [NSNumber numberWithFloat:v1007];
      [v5 setObject:v1008 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1009) = 1.0;
      v1010 = [NSNumber numberWithFloat:v1009];
      [v5 setObject:v1010 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1011) = 1055957975;
      v1012 = [NSNumber numberWithFloat:v1011];
      [v5 setObject:v1012 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1013) = 1061997773;
      v1014 = [NSNumber numberWithFloat:v1013];
      [v5 setObject:v1014 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1015) = 0.5;
      v1016 = [NSNumber numberWithFloat:v1015];
      [v5 setObject:v1016 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v1017) = 1.0;
      v1018 = [NSNumber numberWithFloat:v1017];
      [v5 setObject:v1018 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v1019) = 1055957975;
      v1020 = [NSNumber numberWithFloat:v1019];
      [v5 setObject:v1020 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v1021) = 1062836634;
      v1022 = [NSNumber numberWithFloat:v1021];
      [v5 setObject:v1022 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v1023) = 0.5;
      v1024 = [NSNumber numberWithFloat:v1023];
      [v5 setObject:v1024 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v1025) = 1.0;
      v1026 = [NSNumber numberWithFloat:v1025];
      [v5 setObject:v1026 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v1027) = 1055957975;
      v1028 = [NSNumber numberWithFloat:v1027];
      [v5 setObject:v1028 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v1029) = 1062836634;
      v1030 = [NSNumber numberWithFloat:v1029];
      [v5 setObject:v1030 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v1031) = 0.5;
      v1032 = [NSNumber numberWithFloat:v1031];
      [v5 setObject:v1032 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v1033) = 1.0;
      v1034 = [NSNumber numberWithFloat:v1033];
      [v5 setObject:v1034 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v1035) = 1055957975;
      v1036 = [NSNumber numberWithFloat:v1035];
      [v5 setObject:v1036 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v1037) = 1061997773;
      v162 = [NSNumber numberWithFloat:v1037];
      v163 = @"DarkMatrixValue-7";
      break;
    case 8221:
      v1038 = [NSNumber numberWithInt:74];
      [v5 setObject:v1038 forKeyedSubscript:@"BudHeight"];

      v1039 = [NSNumber numberWithInt:6];
      [v5 setObject:v1039 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v1040 = [NSNumber numberWithInt:17];
      [v5 setObject:v1040 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v1041 = [NSNumber numberWithInt:57];
      [v5 setObject:v1041 forKeyedSubscript:@"CaseHeight"];

      v1042 = [NSNumber numberWithInt:33];
      [v5 setObject:v1042 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v1043 = [NSNumber numberWithInt:22];
      [v5 setObject:v1043 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v1044) = 1056293519;
      v1045 = [NSNumber numberWithFloat:v1044];
      [v5 setObject:v1045 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1046) = 1064178811;
      v1047 = [NSNumber numberWithFloat:v1046];
      [v5 setObject:v1047 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1048) = 0.5;
      v1049 = [NSNumber numberWithFloat:v1048];
      [v5 setObject:v1049 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v1050) = 1065185444;
      v1051 = [NSNumber numberWithFloat:v1050];
      [v5 setObject:v1051 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v1052) = 1055957975;
      v1053 = [NSNumber numberWithFloat:v1052];
      [v5 setObject:v1053 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1054) = 1064514355;
      v1055 = [NSNumber numberWithFloat:v1054];
      [v5 setObject:v1055 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1056) = 0.5;
      v1057 = [NSNumber numberWithFloat:v1056];
      [v5 setObject:v1057 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1058) = 1065185444;
      v1059 = [NSNumber numberWithFloat:v1058];
      [v5 setObject:v1059 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1060) = 1056629064;
      v1061 = [NSNumber numberWithFloat:v1060];
      [v5 setObject:v1061 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v1062) = 1064849900;
      v1063 = [NSNumber numberWithFloat:v1062];
      [v5 setObject:v1063 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v1064) = 0.5;
      v1065 = [NSNumber numberWithFloat:v1064];
      [v5 setObject:v1065 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v1066) = 1065185444;
      v1067 = [NSNumber numberWithFloat:v1066];
      [v5 setObject:v1067 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v1068) = 1056293519;
      v1069 = [NSNumber numberWithFloat:v1068];
      [v5 setObject:v1069 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v1070) = 1064849900;
      v1071 = [NSNumber numberWithFloat:v1070];
      [v5 setObject:v1071 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v1072) = 0.5;
      v1073 = [NSNumber numberWithFloat:v1072];
      [v5 setObject:v1073 forKeyedSubscript:@"LightBiasValue-4"];

      v941 = NSNumber;
      LODWORD(v942) = 1065185444;
LABEL_31:
      v162 = [v941 numberWithFloat:v942];
      v163 = @"LightMatrixValue-4";
      break;
    case 8223:
      v1074 = [NSNumber numberWithInt:108];
      [v5 setObject:v1074 forKeyedSubscript:@"BudHeight"];

      LODWORD(v1075) = 0.5;
      v1076 = [NSNumber numberWithFloat:v1075];
      [v5 setObject:v1076 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v1077) = 1064682127;
      v1078 = [NSNumber numberWithFloat:v1077];
      [v5 setObject:v1078 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v1079) = 0.5;
      v1080 = [NSNumber numberWithFloat:v1079];
      [v5 setObject:v1080 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v1081) = 1064849900;
      v1082 = [NSNumber numberWithFloat:v1081];
      [v5 setObject:v1082 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v1083) = 0.5;
      v1084 = [NSNumber numberWithFloat:v1083];
      [v5 setObject:v1084 forKeyedSubscript:@"DarkBiasValue-22"];

      LODWORD(v1085) = 1063675494;
      v1086 = [NSNumber numberWithFloat:v1085];
      [v5 setObject:v1086 forKeyedSubscript:@"DarkMatrixValue-22"];

      LODWORD(v1087) = 0.5;
      v1088 = [NSNumber numberWithFloat:v1087];
      [v5 setObject:v1088 forKeyedSubscript:@"LightBiasValue-22"];

      LODWORD(v1089) = 1064849900;
      v1090 = [NSNumber numberWithFloat:v1089];
      [v5 setObject:v1090 forKeyedSubscript:@"LightMatrixValue-22"];

      LODWORD(v1091) = 0.5;
      v1092 = [NSNumber numberWithFloat:v1091];
      [v5 setObject:v1092 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v1093) = 1063675494;
      v1094 = [NSNumber numberWithFloat:v1093];
      [v5 setObject:v1094 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v1095) = 0.5;
      v1096 = [NSNumber numberWithFloat:v1095];
      [v5 setObject:v1096 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v1097) = 1064849900;
      v1098 = [NSNumber numberWithFloat:v1097];
      [v5 setObject:v1098 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v1099) = 1055286886;
      v1100 = [NSNumber numberWithFloat:v1099];
      [v5 setObject:v1100 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v1101) = 1.0;
      v1102 = [NSNumber numberWithFloat:v1101];
      [v5 setObject:v1102 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v1103) = 0.5;
      v1104 = [NSNumber numberWithFloat:v1103];
      [v5 setObject:v1104 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v1105) = 1.0;
      v1106 = [NSNumber numberWithFloat:v1105];
      [v5 setObject:v1106 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v1107) = 0.5;
      v1108 = [NSNumber numberWithFloat:v1107];
      [v5 setObject:v1108 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v1109) = 1063675494;
      v1110 = [NSNumber numberWithFloat:v1109];
      [v5 setObject:v1110 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v1111) = 0.5;
      v1112 = [NSNumber numberWithFloat:v1111];
      [v5 setObject:v1112 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v1113) = 1.0;
      v1114 = [NSNumber numberWithFloat:v1113];
      [v5 setObject:v1114 forKeyedSubscript:@"LightMatrixValue-18"];

LABEL_33:
      v1115 = [NSNumber numberWithInt:108];
      [v5 setObject:v1115 forKeyedSubscript:@"BudHeight"];

      LODWORD(v1116) = 0.5;
      v1117 = [NSNumber numberWithFloat:v1116];
      [v5 setObject:v1117 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v1118) = 1063675494;
      v1119 = [NSNumber numberWithFloat:v1118];
      [v5 setObject:v1119 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v1120) = 0.5;
      v1121 = [NSNumber numberWithFloat:v1120];
      [v5 setObject:v1121 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v1122) = 1.0;
      v1123 = [NSNumber numberWithFloat:v1122];
      [v5 setObject:v1123 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v1124) = 0.5;
      v1125 = [NSNumber numberWithFloat:v1124];
      [v5 setObject:v1125 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1126) = 1064682127;
      v1127 = [NSNumber numberWithFloat:v1126];
      [v5 setObject:v1127 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1128) = 0.5;
      v1129 = [NSNumber numberWithFloat:v1128];
      [v5 setObject:v1129 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1130) = 1064849900;
      v1131 = [NSNumber numberWithFloat:v1130];
      [v5 setObject:v1131 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1132) = 0.5;
      v1133 = [NSNumber numberWithFloat:v1132];
      [v5 setObject:v1133 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v1134) = 1063675494;
      v1135 = [NSNumber numberWithFloat:v1134];
      [v5 setObject:v1135 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v1136) = 0.5;
      v1137 = [NSNumber numberWithFloat:v1136];
      [v5 setObject:v1137 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v1138) = 1064849900;
      v1139 = [NSNumber numberWithFloat:v1138];
      [v5 setObject:v1139 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v1140) = 0.5;
      v1141 = [NSNumber numberWithFloat:v1140];
      [v5 setObject:v1141 forKeyedSubscript:@"DarkBiasValue-15"];

      LODWORD(v1142) = 1063675494;
      v1143 = [NSNumber numberWithFloat:v1142];
      [v5 setObject:v1143 forKeyedSubscript:@"DarkMatrixValue-15"];

      LODWORD(v1144) = 0.5;
      v1145 = [NSNumber numberWithFloat:v1144];
      [v5 setObject:v1145 forKeyedSubscript:@"LightBiasValue-15"];

      LODWORD(v1146) = 1.0;
      v1147 = [NSNumber numberWithFloat:v1146];
      [v5 setObject:v1147 forKeyedSubscript:@"LightMatrixValue-15"];

      LODWORD(v1148) = 1055286886;
      v1149 = [NSNumber numberWithFloat:v1148];
      [v5 setObject:v1149 forKeyedSubscript:@"DarkBiasValue-16"];

      LODWORD(v1150) = 1.0;
      v1151 = [NSNumber numberWithFloat:v1150];
      [v5 setObject:v1151 forKeyedSubscript:@"DarkMatrixValue-16"];

      LODWORD(v1152) = 0.5;
      v1153 = [NSNumber numberWithFloat:v1152];
      [v5 setObject:v1153 forKeyedSubscript:@"LightBiasValue-16"];

      LODWORD(v1154) = 1.0;
      v1155 = [NSNumber numberWithFloat:v1154];
      [v5 setObject:v1155 forKeyedSubscript:@"LightMatrixValue-16"];

      LODWORD(v1156) = 0.5;
      v1157 = [NSNumber numberWithFloat:v1156];
      [v5 setObject:v1157 forKeyedSubscript:@"DarkBiasValue-17"];

      LODWORD(v1158) = 1064514355;
      v1159 = [NSNumber numberWithFloat:v1158];
      [v5 setObject:v1159 forKeyedSubscript:@"DarkMatrixValue-17"];

      LODWORD(v1160) = 0.5;
      v1161 = [NSNumber numberWithFloat:v1160];
      [v5 setObject:v1161 forKeyedSubscript:@"LightBiasValue-17"];

      LODWORD(v1162) = 1064682127;
      v162 = [NSNumber numberWithFloat:v1162];
      v163 = @"LightMatrixValue-17";
      break;
    case 8229:
      v1163 = [NSNumber numberWithInt:108];
      v1164 = @"BudHeight";
      goto LABEL_36;
    case 8230:
      v1165 = [NSNumber numberWithInt:48];
      [v5 setObject:v1165 forKeyedSubscript:@"BudHeight"];

      v1166 = [NSNumber numberWithInt:25];
      [v5 setObject:v1166 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v1167 = [NSNumber numberWithInt:6];
      [v5 setObject:v1167 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v1163 = [NSNumber numberWithInt:0];
      v1164 = @"UnifiedSpacingBudsCase";
LABEL_36:
      [v5 setObject:v1163 forKeyedSubscript:v1164];

      LODWORD(v1168) = 1057803469;
      v1169 = [NSNumber numberWithFloat:v1168];
      [v5 setObject:v1169 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v1170) = 1.0;
      v1171 = [NSNumber numberWithFloat:v1170];
      [v5 setObject:v1171 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v1172) = 1057635697;
      v1173 = [NSNumber numberWithFloat:v1172];
      [v5 setObject:v1173 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v1174) = 1064514355;
      v1175 = [NSNumber numberWithFloat:v1174];
      [v5 setObject:v1175 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v1176) = 0.5;
      v1177 = [NSNumber numberWithFloat:v1176];
      [v5 setObject:v1177 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v1178) = 1.0;
      v1179 = [NSNumber numberWithFloat:v1178];
      [v5 setObject:v1179 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v1180) = 1055957975;
      v1181 = [NSNumber numberWithFloat:v1180];
      [v5 setObject:v1181 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1182) = 1064514355;
      v1183 = [NSNumber numberWithFloat:v1182];
      [v5 setObject:v1183 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1184) = 0.5;
      v1185 = [NSNumber numberWithFloat:v1184];
      [v5 setObject:v1185 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1186) = 1.0;
      v1187 = [NSNumber numberWithFloat:v1186];
      [v5 setObject:v1187 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1188) = 1055957975;
      v1189 = [NSNumber numberWithFloat:v1188];
      [v5 setObject:v1189 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1190) = 1064514355;
      v162 = [NSNumber numberWithFloat:v1190];
      v163 = @"DarkMatrixValue-2";
      break;
    default:
      v162 = [NSNumber numberWithInt:108];
      v163 = @"BudHeight";
      break;
  }
  [v5 setObject:v162 forKeyedSubscript:v163];

  return v5;
}

+ (uint64_t)_headphoneIsProductOfDifferentColors:()HeadphoneDeviceColorFiltering
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "isProductOfDifferentColors Battery Status: Input pid - %d", (uint8_t *)v6, 8u);
  }

  return ((a3 - 8195) < 0x24) & (0xC1498E7CDuLL >> (a3 - 3));
}

+ (BOOL)_headphoneDefaultFiltersID:()HeadphoneDeviceColorFiltering
{
  return ((a3 - 8204) & 0xFFFFFFFB) == 0;
}

@end