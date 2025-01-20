@interface UnitsInfo
+ (BOOL)shouldSkipUnitName:(id)a3;
+ (UnitsInfo)converterUnits;
+ (UnitsInfo)unitsInfoWithDictionary:(id)a3;
- (NSArray)unitNames;
- (NSMutableArray)unitIDToInfo;
- (NSMutableArray)unitTypeToInfo;
- (NSMutableDictionary)unitNameToInfo;
- (NSMutableDictionary)unitTypeNameToInfo;
- (UnitInfo)degreesInfo;
- (UnitInfo)radiansInfo;
- (UnitTypeInfo)angleInfo;
- (UnitsInfo)initWithDictionary:(id)a3;
- (id)infoForUnitID:(int)a3;
- (id)infoForUnitName:(id)a3;
- (id)infoForUnitType:(int)a3;
- (id)infoForUnitTypeName:(id)a3;
- (int)unitCount;
- (int)unitTypeCount;
- (void)populateSubunitIDs:(id)a3 forUnit:(id)a4 visited:(id)a5;
- (void)setAngleInfo:(id)a3;
- (void)setDegreesInfo:(id)a3;
- (void)setRadiansInfo:(id)a3;
- (void)setUnitIDToInfo:(id)a3;
- (void)setUnitNameToInfo:(id)a3;
- (void)setUnitTypeNameToInfo:(id)a3;
- (void)setUnitTypeToInfo:(id)a3;
@end

@implementation UnitsInfo

- (id)infoForUnitID:(int)a3
{
  if (a3 < 0
    || ([(UnitsInfo *)self unitIDToInfo],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    v7 = [(UnitsInfo *)self unitIDToInfo];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }
  return v8;
}

- (NSMutableArray)unitIDToInfo
{
  return self->_unitIDToInfo;
}

void __27__UnitsInfo_converterUnits__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v0 pathForResource:@"ConverterUnits" ofType:@"plist"];

  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v4];
  uint64_t v2 = +[UnitsInfo unitsInfoWithDictionary:v1];
  v3 = (void *)converterUnits_unitsInfo;
  converterUnits_unitsInfo = v2;
}

+ (UnitsInfo)unitsInfoWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[UnitsInfo alloc] initWithDictionary:v3];

  return v4;
}

- (UnitsInfo)initWithDictionary:(id)a3
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v189.receiver = self;
  v189.super_class = (Class)UnitsInfo;
  v5 = [(UnitsInfo *)&v189 init];
  if (!v5) {
    goto LABEL_123;
  }
  unint64_t v6 = objc_opt_new();
  [(UnitsInfo *)v5 setUnitNameToInfo:v6];

  v7 = objc_opt_new();
  [(UnitsInfo *)v5 setUnitIDToInfo:v7];

  v8 = objc_opt_new();
  [(UnitsInfo *)v5 setUnitTypeNameToInfo:v8];

  v9 = objc_opt_new();
  [(UnitsInfo *)v5 setUnitTypeToInfo:v9];

  v10 = [(UnitsInfo *)v5 unitIDToInfo];
  v11 = objc_opt_new();
  [v10 addObject:v11];

  v12 = [(UnitsInfo *)v5 unitTypeToInfo];
  v13 = objc_opt_new();
  [v12 addObject:v13];

  v133 = objc_opt_new();
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v125 = v4;
  obuint64_t j = v4;
  p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
  id v137 = (id)[obj countByEnumeratingWithState:&v185 objects:v196 count:16];
  if (!v137)
  {
    unsigned int v134 = 0;
    goto LABEL_63;
  }
  unsigned int v134 = 0;
  uint64_t v135 = *(void *)v186;
  v15 = @"BaseNumerator";
  v16 = @"BaseDenominator";
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v186 != v135) {
        objc_enumerationMutation(obj);
      }
      uint64_t v141 = v17;
      v18 = *(void **)(*((void *)&v185 + 1) + 8 * v17);
      v19 = [obj objectForKeyedSubscript:v18];
      v20 = objc_opt_new();
      [v20 setUnitType:++v134];
      [v20 setName:v18];
      objc_msgSend(v20, "setDecompositionCoefficient:", 1, 0x3040000000000000);
      v21 = [v19 objectForKeyedSubscript:@"BaseDecomposition"];
      [v20 setIsDecomposable:v21 != 0];

      if ([v18 isEqualToString:@"Temperature"])
      {
        [v20 setIsTemperature:1];
      }
      else if ([v18 isEqualToString:@"Currency"])
      {
        [v20 setIsCurrency:1];
      }
      else if ([v18 isEqualToString:@"Volume"])
      {
        [v20 setIsVolume:1];
      }
      if ([v18 isEqualToString:@"Angle"]) {
        [(UnitsInfo *)v5 setAngleInfo:v20];
      }
      v22 = [(UnitsInfo *)v5 unitTypeNameToInfo];
      [v22 setObject:v20 forKeyedSubscript:v18];

      v23 = [(UnitsInfo *)v5 unitTypeToInfo];
      [v23 addObject:v20];

      v147 = objc_opt_new();
      objc_msgSend(v20, "setUnits:");
      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      id v24 = v19;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v181 objects:v195 count:16];
      p_info = CalculateUnitsTrieNode.info;
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v182;
        uint64_t v143 = *(void *)v182;
        id v145 = v24;
        do
        {
          uint64_t v28 = 0;
          uint64_t v149 = v26;
          do
          {
            if (*(void *)v182 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v181 + 1) + 8 * v28);
            if (([p_info + 171 shouldSkipUnitName:v29] & 1) == 0)
            {
              v30 = [v24 objectForKeyedSubscript:v29];
              v31 = [(UnitsInfo *)v5 unitIDToInfo];
              uint64_t v32 = [v31 count];

              v33 = objc_opt_new();
              [v33 setUnitID:v32];
              [v33 setUnitType:v134];
              [v33 setName:v29];
              [v33 setTypeInfo:v20];
              v34 = [v30 objectForKeyedSubscript:@"Inverted"];
              objc_msgSend(v33, "setIsInverted:", objc_msgSend(v34, "BOOLValue"));

              if ([v20 isDecomposable])
              {
                v35 = [v30 objectForKeyedSubscript:@"IsDisplayName"];
                objc_msgSend(v33, "setIsDisplayName:", objc_msgSend(v35, "BOOLValue"));
              }
              else
              {
                [v33 setIsDisplayName:0];
              }
              if ([v33 isDisplayName])
              {
                v36 = [v30 objectForKeyedSubscript:@"ImpliesDivision"];
                objc_msgSend(v33, "setImpliesDivision:", objc_msgSend(v36, "BOOLValue"));
              }
              else
              {
                [v33 setImpliesDivision:0];
              }
              v37 = [v30 objectForKeyedSubscript:@"DoNotSuggest"];
              objc_msgSend(v33, "setDoNotSuggest:", objc_msgSend(v37, "BOOLValue"));

              v38 = [v30 objectForKeyedSubscript:@"FormatNextSmallest"];
              objc_msgSend(v33, "setFormatNextSmallest:", objc_msgSend(v38, "BOOLValue"));

              v39 = [v30 objectForKeyedSubscript:@"PreferredUnit"];
              objc_msgSend(v33, "setIsPreferredUnit:", objc_msgSend(v39, "BOOLValue"));

              [v33 setMeasurementSystem:0];
              v40 = [v30 objectForKeyedSubscript:@"MeasurementSystem"];
              v41 = v40;
              if (v40)
              {
                if ([v40 isEqualToString:@"Metric"])
                {
                  uint64_t v42 = 1;
                  goto LABEL_34;
                }
                if ([v41 isEqualToString:@"US"])
                {
                  uint64_t v42 = 2;
                  goto LABEL_34;
                }
                if ([v41 isEqualToString:@"UK"])
                {
                  uint64_t v42 = 3;
LABEL_34:
                  [v33 setMeasurementSystem:v42];
                }
              }
              if ([v20 isTemperature])
              {
                if ([v29 isEqualToString:@"fahrenheit"])
                {
                  [v33 setIsFahrenheit:1];
                }
                else if ([v29 isEqualToString:@"celsius"])
                {
                  [v33 setIsCelsius:1];
                }
                else if ([v29 isEqualToString:@"kelvin"])
                {
                  [v33 setIsKelvin:1];
                }
              }
              v43 = v16;
              if ([v29 isEqualToString:@"degree"]) {
                [(UnitsInfo *)v5 setDegreesInfo:v33];
              }
              v44 = v15;
              if ([v29 isEqualToString:@"radian"]) {
                [(UnitsInfo *)v5 setRadiansInfo:v33];
              }
              v45 = [(UnitsInfo *)v5 unitNameToInfo];
              [v45 setObject:v33 forKeyedSubscript:v29];

              v46 = [(UnitsInfo *)v5 unitIDToInfo];
              [v46 addObject:v33];

              [v147 addObject:v33];
              [v133 addObject:v29];
              LODWORD(v169) = 0;
              v15 = v44;
              v47 = [v30 objectForKeyedSubscript:v44];

              if (v47)
              {
                id v48 = [v30 objectForKeyedSubscript:v44];
                uint64_t v49 = __bid128_from_string((unsigned __int8 *)[v48 UTF8String], 4, &v169);
                objc_msgSend(v33, "setBaseNumerator:", v49, v50);
              }
              v16 = v43;
              v51 = [v30 objectForKeyedSubscript:v43];

              if (v51)
              {
                id v52 = [v30 objectForKeyedSubscript:v43];
                uint64_t v53 = __bid128_from_string((unsigned __int8 *)[v52 UTF8String], 4, &v169);
                objc_msgSend(v33, "setBaseDenominator:", v53, v54);
              }
              v55 = [v20 baseUnit];
              uint64_t v27 = v143;
              if (v55
                || (unint64_t v56 = [v33 baseNumerator],
                    !__bid128_quiet_equal(v56, v57, 1uLL, 0x3040000000000000uLL, &v169)))
              {
              }
              else
              {
                unint64_t v58 = [v33 baseDenominator];
                if (__bid128_quiet_equal(v58, v59, 1uLL, 0x3040000000000000uLL, &v169))
                {
                  [v33 setIsBaseUnit:1];
                  [v20 setBaseUnit:v33];
                }
              }

              p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
              id v24 = v145;
              uint64_t v26 = v149;
            }
            ++v28;
          }
          while (v26 != v28);
          uint64_t v60 = [v24 countByEnumeratingWithState:&v181 objects:v195 count:16];
          uint64_t v26 = v60;
        }
        while (v60);
      }

      uint64_t v17 = v141 + 1;
    }
    while ((id)(v141 + 1) != v137);
    id v137 = (id)[obj countByEnumeratingWithState:&v185 objects:v196 count:16];
  }
  while (v137);
LABEL_63:

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id v128 = obj;
  uint64_t v127 = [v128 countByEnumeratingWithState:&v177 objects:v194 count:16];
  if (v127)
  {
    uint64_t v126 = *(void *)v178;
    do
    {
      uint64_t v61 = 0;
      do
      {
        if (*(void *)v178 != v126)
        {
          uint64_t v62 = v61;
          objc_enumerationMutation(v128);
          uint64_t v61 = v62;
        }
        uint64_t v129 = v61;
        uint64_t v63 = *(void *)(*((void *)&v177 + 1) + 8 * v61);
        v64 = [v128 objectForKeyedSubscript:v63];
        id v138 = [v64 objectForKeyedSubscript:@"BaseDecomposition"];
        if (v138)
        {
          v150 = v64;
          long long v175 = 0u;
          long long v176 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          long long v165 = 0u;
          long long v166 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          uint64_t v65 = [v138 countByEnumeratingWithState:&v165 objects:v193 count:16];
          if (v65)
          {
            uint64_t v66 = v65;
            uint64_t v67 = *(void *)v166;
            do
            {
              for (uint64_t i = 0; i != v66; ++i)
              {
                if (*(void *)v166 != v67) {
                  objc_enumerationMutation(v138);
                }
                v69 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                v70 = [v138 objectForKeyedSubscript:v69];
                if ([v69 isEqualToString:@"Coefficient"])
                {
                  int v71 = [v70 intValue];
                  if (v71 >= 0) {
                    uint64_t v72 = v71;
                  }
                  else {
                    uint64_t v72 = -v71;
                  }
                  if (v71 < 0) {
                    unint64_t v73 = 0xB040000000000000;
                  }
                  else {
                    unint64_t v73 = 0x3040000000000000;
                  }
                  v74 = [(UnitsInfo *)v5 unitTypeNameToInfo];
                  v75 = [v74 objectForKeyedSubscript:v63];
                  objc_msgSend(v75, "setDecompositionCoefficient:", v72, v73);
                }
                else
                {
                  v76 = [(UnitsInfo *)v5 unitNameToInfo];
                  v74 = [v76 objectForKeyedSubscript:v69];

                  uint64_t v77 = v67;
                  v78 = (_DWORD *)&v169 + 2 * (int)[v74 unitType];
                  _DWORD *v78 = [v74 unitID];
                  v78[1] = [v70 intValue];
                  uint64_t v67 = v77;
                }
              }
              uint64_t v66 = [v138 countByEnumeratingWithState:&v165 objects:v193 count:16];
            }
            while (v66);
          }
          v79 = [(UnitsInfo *)v5 unitTypeNameToInfo];
          v80 = [v79 objectForKeyedSubscript:v63];
          v164[4] = v173;
          v164[5] = v174;
          v164[6] = v175;
          v164[7] = v176;
          v164[0] = v169;
          v164[1] = v170;
          v164[2] = v171;
          v164[3] = v172;
          [v80 setDecomposition:v164];

          p_info = CalculateUnitsTrieNode.info;
          v64 = v150;
        }
        long long v162 = 0u;
        long long v163 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        id v81 = v64;
        uint64_t v82 = [v81 countByEnumeratingWithState:&v160 objects:v192 count:16];
        if (v82)
        {
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v161;
          uint64_t v130 = *(void *)v161;
          id v131 = v81;
          do
          {
            uint64_t v85 = 0;
            uint64_t v132 = v83;
            do
            {
              if (*(void *)v161 != v84) {
                objc_enumerationMutation(v81);
              }
              uint64_t v86 = *(void *)(*((void *)&v160 + 1) + 8 * v85);
              if (([p_info + 171 shouldSkipUnitName:v86] & 1) == 0)
              {
                v148 = [v81 objectForKeyedSubscript:v86];
                uint64_t v87 = [v148 objectForKeyedSubscript:@"BestEquivalent"];
                v144 = (void *)v87;
                uint64_t v146 = v85;
                if (v87)
                {
                  uint64_t v88 = v87;
                  v89 = [(UnitsInfo *)v5 unitNameToInfo];
                  v90 = [v89 objectForKeyedSubscript:v88];
                }
                else
                {
                  v90 = 0;
                }
                v91 = [(UnitsInfo *)v5 unitNameToInfo];
                v92 = [v91 objectForKeyedSubscript:v86];
                [v92 setBestEquivalent:v90];

                uint64_t v93 = [v148 objectForKeyedSubscript:@"NextSmallest"];
                v142 = (void *)v93;
                if (v93)
                {
                  uint64_t v94 = v93;
                  v95 = [(UnitsInfo *)v5 unitNameToInfo];
                  uint64_t v96 = [v95 objectForKeyedSubscript:v94];
                }
                else
                {
                  uint64_t v96 = 0;
                }
                v97 = [(UnitsInfo *)v5 unitNameToInfo];
                v98 = [v97 objectForKeyedSubscript:v86];
                id obja = (id)v96;
                [v98 setNextSmallest:v96];

                v99 = [v148 objectForKeyedSubscript:@"Subunits"];
                if (v99)
                {
                  uint64_t v151 = v86;
                  v100 = v5;
                  v101 = objc_opt_new();
                  long long v156 = 0u;
                  long long v157 = 0u;
                  long long v158 = 0u;
                  long long v159 = 0u;
                  v136 = v99;
                  id v102 = v99;
                  uint64_t v103 = [v102 countByEnumeratingWithState:&v156 objects:v191 count:16];
                  if (v103)
                  {
                    uint64_t v104 = v103;
                    uint64_t v105 = *(void *)v157;
                    do
                    {
                      for (uint64_t j = 0; j != v104; ++j)
                      {
                        v107 = v90;
                        if (*(void *)v157 != v105) {
                          objc_enumerationMutation(v102);
                        }
                        uint64_t v108 = *(void *)(*((void *)&v156 + 1) + 8 * j);
                        v109 = [(UnitsInfo *)v100 unitNameToInfo];
                        v110 = [v109 objectForKeyedSubscript:v108];

                        if (v110)
                        {
                          v111 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v110, "unitID"));
                          [v101 addObject:v111];
                        }
                        else
                        {
                          NSLog(&cfstr_WarningUnitTyp.isa, v151, v108);
                        }
                        v90 = v107;
                      }
                      uint64_t v104 = [v102 countByEnumeratingWithState:&v156 objects:v191 count:16];
                    }
                    while (v104);
                  }

                  v5 = v100;
                  v112 = [(UnitsInfo *)v100 unitNameToInfo];
                  v113 = [v112 objectForKeyedSubscript:v151];
                  [v113 setSubunitIDs:v101];

                  p_info = (__objc2_class_ro **)(CalculateUnitsTrieNode + 32);
                  uint64_t v84 = v130;
                  id v81 = v131;
                  uint64_t v83 = v132;
                  v99 = v136;
                }

                uint64_t v85 = v146;
              }
              ++v85;
            }
            while (v85 != v83);
            uint64_t v83 = [v81 countByEnumeratingWithState:&v160 objects:v192 count:16];
          }
          while (v83);
        }

        uint64_t v61 = v129 + 1;
      }
      while (v129 + 1 != v127);
      uint64_t v127 = [v128 countByEnumeratingWithState:&v177 objects:v194 count:16];
    }
    while (v127);
  }

  v114 = objc_opt_new();
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v115 = [(UnitsInfo *)v5 unitIDToInfo];
  uint64_t v116 = [v115 countByEnumeratingWithState:&v152 objects:v190 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v153;
    do
    {
      for (uint64_t k = 0; k != v117; ++k)
      {
        if (*(void *)v153 != v118) {
          objc_enumerationMutation(v115);
        }
        [(UnitsInfo *)v5 populateSubunitIDs:*(void *)(*((void *)&v152 + 1) + 8 * k) forUnit:*(void *)(*((void *)&v152 + 1) + 8 * k) visited:v114];
        [v114 removeAllObjects];
      }
      uint64_t v117 = [v115 countByEnumeratingWithState:&v152 objects:v190 count:16];
    }
    while (v117);
  }

  uint64_t v120 = [v133 copy];
  unitNames = v5->_unitNames;
  v5->_unitNames = (NSArray *)v120;

  v5->_unitTypeCount = v134;
  v122 = [(UnitsInfo *)v5 unitIDToInfo];
  v5->_unitCount = [v122 count];

  v123 = v5;
  id v4 = v125;
LABEL_123:

  return v5;
}

- (NSMutableDictionary)unitNameToInfo
{
  return self->_unitNameToInfo;
}

+ (BOOL)shouldSkipUnitName:(id)a3
{
  return [a3 isEqualToString:@"BaseDecomposition"];
}

- (void)populateSubunitIDs:(id)a3 forUnit:(id)a4 visited:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "unitID"));
  if (([v10 containsObject:v11] & 1) == 0)
  {
    [v10 addObject:v11];
    v12 = [v9 allSubunitIDs];
    [v12 addObject:v11];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = objc_msgSend(v8, "subunitIDs", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = -[UnitsInfo infoForUnitID:](self, "infoForUnitID:", [*(id *)(*((void *)&v19 + 1) + 8 * v17) intValue]);
          [(UnitsInfo *)self populateSubunitIDs:v18 forUnit:v9 visited:v10];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (NSMutableDictionary)unitTypeNameToInfo
{
  return self->_unitTypeNameToInfo;
}

- (NSMutableArray)unitTypeToInfo
{
  return self->_unitTypeToInfo;
}

- (void)setUnitTypeToInfo:(id)a3
{
}

- (void)setUnitTypeNameToInfo:(id)a3
{
}

- (void)setUnitNameToInfo:(id)a3
{
}

- (void)setUnitIDToInfo:(id)a3
{
}

- (void)setRadiansInfo:(id)a3
{
}

- (void)setDegreesInfo:(id)a3
{
}

- (void)setAngleInfo:(id)a3
{
}

+ (UnitsInfo)converterUnits
{
  if (converterUnits_loadUnitDictionaryOnce[0] != -1) {
    dispatch_once(converterUnits_loadUnitDictionaryOnce, &__block_literal_global_301);
  }
  uint64_t v2 = (void *)converterUnits_unitsInfo;
  return (UnitsInfo *)v2;
}

- (id)infoForUnitName:(id)a3
{
  id v4 = a3;
  v5 = [(UnitsInfo *)self unitNameToInfo];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSArray)unitNames
{
  return self->_unitNames;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radiansInfo);
  objc_destroyWeak((id *)&self->_degreesInfo);
  objc_destroyWeak((id *)&self->_angleInfo);
  objc_storeStrong((id *)&self->_unitTypeToInfo, 0);
  objc_storeStrong((id *)&self->_unitTypeNameToInfo, 0);
  objc_storeStrong((id *)&self->_unitIDToInfo, 0);
  objc_storeStrong((id *)&self->_unitNameToInfo, 0);
  objc_storeStrong((id *)&self->_unitNames, 0);
}

- (UnitInfo)radiansInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radiansInfo);
  return (UnitInfo *)WeakRetained;
}

- (UnitInfo)degreesInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_degreesInfo);
  return (UnitInfo *)WeakRetained;
}

- (UnitTypeInfo)angleInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_angleInfo);
  return (UnitTypeInfo *)WeakRetained;
}

- (int)unitTypeCount
{
  return self->_unitTypeCount;
}

- (int)unitCount
{
  return self->_unitCount;
}

- (id)infoForUnitTypeName:(id)a3
{
  id v4 = a3;
  v5 = [(UnitsInfo *)self unitTypeNameToInfo];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)infoForUnitType:(int)a3
{
  if (a3 < 1
    || ([(UnitsInfo *)self unitTypeToInfo],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    id v8 = 0;
  }
  else
  {
    v7 = [(UnitsInfo *)self unitTypeToInfo];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }
  return v8;
}

@end