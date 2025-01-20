HAPService *_parseSerializedService(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  HAPCharacteristic *v5;
  uint64_t v6;
  HAPCharacteristic *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  HAPCharacteristic *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  HAPCharacteristic *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  char isKindOfClass;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  __CFString *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  id v62;
  char v63;
  void *v64;
  HAPMetadataConstraints *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  HAPMetadataConstraints *v88;
  HAPCharacteristicMetadata *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  __CFString *v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  __CFString *v100;
  void *v101;
  uint64_t v102;
  __CFString *v103;
  void *v104;
  __CFString *v105;
  id v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  HAPService *v132;
  HAPService *v133;
  HAPService *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  __CFString *v138;
  void *v139;
  NSObject *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  id v144;
  void *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  __CFString *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  __CFString *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  __CFString *v169;
  uint64_t v170;
  HAPCharacteristic *v171;
  uint64_t v172;
  __CFString *v173;
  HAPMetadataConstraints *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  long long v178;
  long long v179;
  long long v180;
  long long v181;
  long long v182;
  long long v183;
  long long v184;
  long long v185;
  long long v186;
  long long v187;
  long long v188;
  long long v189;
  unsigned char v190[128];
  uint8_t v191[128];
  uint8_t v192[4];
  void *v193;
  __int16 v194;
  unint64_t v195;
  uint8_t buf[4];
  void *v197;
  __int16 v198;
  __CFString *v199;
  __int16 v200;
  id v201;
  uint64_t v202;
  uint64_t vars8;

  v202 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v135 = (void *)MEMORY[0x1D944E080]();
    v136 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
    {
      v137 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v197 = v137;
      v198 = 2114;
      v199 = (__CFString *)objc_opt_class();
      v138 = v199;
      _os_log_impl(&dword_1D4758000, v136, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected service object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);
    }
    v133 = 0;
    goto LABEL_175;
  }
  v2 = [v1 objectForKeyedSubscript:@"characteristics"];
  if (!v2)
  {
    v139 = (void *)MEMORY[0x1D944E080]();
    v140 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
    {
      v141 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v197 = v141;
      _os_log_impl(&dword_1D4758000, v140, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] No characteristics found when parsing service object in attribute database", buf, 0xCu);
    }
    goto LABEL_158;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v139 = (void *)MEMORY[0x1D944E080]();
    v142 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      v143 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v197 = v143;
      v198 = 2114;
      v199 = @"characteristics";
      v200 = 2114;
      v201 = (id)objc_opt_class();
      v144 = v201;
      _os_log_impl(&dword_1D4758000, v142, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected '%{public}@' to be an array in the service object of the attribute database, instead it is a %{public}@", buf, 0x20u);
    }
LABEL_158:
    v133 = 0;
    goto LABEL_174;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v4 = v2;
  v161 = v2;
  v163 = v3;
  v176 = [v4 countByEnumeratingWithState:&v182 objects:v191 count:16];
  if (!v176)
  {
LABEL_133:

    v117 = objc_msgSend(v1, "hmf_numberForKey:", @"iid");
    v4 = (id)v117;
    if (v117)
    {
      v118 = (void *)v117;
      v119 = objc_msgSend(v1, "hmf_BOOLForKey:", @"primary");
      if (objc_msgSend(v1, "hmf_BOOLForKey:", @"hidden")) {
        v120 = v119 | 2;
      }
      else {
        v120 = v119;
      }
      v160 = v1;
      v121 = objc_msgSend(v1, "hmf_arrayForKey:", @"linked");
      v122 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v121, "count"));
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      v123 = v121;
      v124 = [v123 countByEnumeratingWithState:&v178 objects:v190 count:16];
      if (v124)
      {
        v125 = v124;
        v126 = *(void *)v179;
        do
        {
          for (i = 0; i != v125; ++i)
          {
            if (*(void *)v179 != v126) {
              objc_enumerationMutation(v123);
            }
            v128 = *(void *)(*((void *)&v178 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v122 addObject:v128];
            }
          }
          v125 = [v123 countByEnumeratingWithState:&v178 objects:v190 count:16];
        }
        while (v125);
      }

      [v122 removeObject:v118];
      v1 = v160;
      v129 = objc_msgSend(v160, "hmf_stringForKey:", @"type");
      if (v129)
      {
        v130 = (void *)v129;
        v131 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v129);

        v132 = [[HAPService alloc] initWithType:v131 instanceID:v118 parsedCharacteristics:v163 serviceProperties:v120 linkedServices:v122];
        v133 = v132;
        if (v132)
        {
          v134 = v132;
        }
        else
        {
          v156 = (void *)MEMORY[0x1D944E080]();
          v157 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            v158 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v197 = v158;
            _os_log_impl(&dword_1D4758000, v157, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service.", buf, 0xCu);
          }
          v1 = v160;
        }
        v2 = v161;
      }
      else
      {
        v152 = (void *)MEMORY[0x1D944E080]();
        v153 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          v154 = HMFGetLogIdentifier();
          v155 = [v160 objectForKeyedSubscript:@"type"];
          *(_DWORD *)buf = 138543618;
          v197 = v154;
          v198 = 2112;
          v199 = v155;
          _os_log_impl(&dword_1D4758000, v153, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service type: %@.", buf, 0x16u);

          v1 = v160;
        }

        v133 = 0;
        v2 = v161;
      }
      v3 = v163;
      v4 = v118;
    }
    else
    {
      v148 = (void *)MEMORY[0x1D944E080]();
      v149 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
      {
        v150 = HMFGetLogIdentifier();
        v151 = [v1 objectForKeyedSubscript:@"iid"];
        *(_DWORD *)buf = 138543618;
        v197 = v150;
        v198 = 2112;
        v199 = v151;
        _os_log_impl(&dword_1D4758000, v149, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized service instanceID: %@.", buf, 0x16u);
      }
      v133 = 0;
    }
    goto LABEL_173;
  }
  v5 = 0;
  v175 = *(void *)v183;
  v162 = v4;
LABEL_6:
  v6 = 0;
  v7 = v5;
  while (1)
  {
    if (*(void *)v183 != v175) {
      objc_enumerationMutation(v4);
    }
    v8 = (__CFString *)*(id *)(*((void *)&v182 + 1) + 8 * v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [(__CFString *)v8 hmf_numberForKey:@"iid"];
      v10 = [(__CFString *)v8 hmf_stringForKey:@"type"];
      v11 = (void *)v10;
      v177 = (void *)v9;
      if (v9) {
        v12 = v10 == 0;
      }
      else {
        v12 = 1;
      }
      if (v12)
      {
        v13 = v3;
        v14 = v4;
        v15 = v7;
        v16 = v6;
        v17 = (void *)MEMORY[0x1D944E080]();
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = v19 = v8;
          *(_DWORD *)buf = 138543618;
          v197 = v20;
          v198 = 2112;
          v199 = v19;
          _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] unable to parse characteristic: %@", buf, 0x16u);

          v8 = v19;
        }

        v5 = 0;
        v6 = v16;
        v7 = v15;
        v4 = v14;
        v3 = v13;
        goto LABEL_123;
      }
      v170 = v6;
      v172 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v10);

      v31 = [(__CFString *)v8 objectForKeyedSubscript:@"perms"];
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v171 = v7;
      v173 = v8;
      if (isKindOfClass)
      {
        v188 = 0u;
        v189 = 0u;
        v186 = 0u;
        v187 = 0u;
        v33 = v31;
        v34 = [v33 countByEnumeratingWithState:&v186 objects:buf count:16];
        if (v34)
        {
          v35 = v34;
          v36 = 0;
          v37 = *(void *)v187;
LABEL_24:
          v38 = 0;
          while (1)
          {
            if (*(void *)v187 != v37) {
              objc_enumerationMutation(v33);
            }
            v39 = *(void **)(*((void *)&v186 + 1) + 8 * v38);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v52 = (void *)MEMORY[0x1D944E080]();
              v53 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v54 = HMFGetLogIdentifier();
                v55 = objc_opt_class();
                *(_DWORD *)v192 = 138543618;
                v193 = v54;
                v194 = 2114;
                v195 = (unint64_t)v55;
                v56 = v55;
                _os_log_impl(&dword_1D4758000, v53, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic property to be a string in the properties array in the attribute database, instead it is a %{public}@", v192, 0x16u);
              }

              v36 = 0;
              goto LABEL_64;
            }
            if ([v39 isEqualToString:@"pr"])
            {
              v36 |= 2uLL;
            }
            else if ([v39 isEqualToString:@"pw"])
            {
              v36 |= 4uLL;
            }
            else if ([v39 isEqualToString:@"ev"])
            {
              v36 |= 1uLL;
            }
            else if ([v39 isEqualToString:@"bonjour"])
            {
              v36 |= 8uLL;
            }
            else
            {
              if ([v39 isEqualToString:@"aa"])
              {
                v36 |= 0x10uLL;
                v40 = (void *)MEMORY[0x1D944E080]();
                v41 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = HMFGetLogIdentifier();
                  *(_DWORD *)v192 = 138543618;
                  v193 = v42;
                  v194 = 2048;
                  v195 = v36;
                  v43 = v41;
                  v44 = "%{public}@[HAPAccessoryServerIP] Characteristic with AAD Properties: %lu";
                  goto LABEL_45;
                }
                goto LABEL_46;
              }
              if (![v39 isEqualToString:@"tw"])
              {
                if (([v39 isEqualToString:@"hd"] & 1) == 0
                  && ![v39 isEqualToString:@"hidden"])
                {
                  if ([v39 isEqualToString:@"wr"])
                  {
                    v36 |= 0x80uLL;
                  }
                  else if ([v39 isEqualToString:@"enc"])
                  {
                    v36 |= 0x100uLL;
                  }
                  goto LABEL_47;
                }
                v36 |= 0x40uLL;
                v40 = (void *)MEMORY[0x1D944E080]();
                v41 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = HMFGetLogIdentifier();
                  *(_DWORD *)v192 = 138543618;
                  v193 = v42;
                  v194 = 2048;
                  v195 = v36;
                  v43 = v41;
                  v44 = "%{public}@[HAPAccessoryServerIP] Characteristic which is hidden: %lu";
LABEL_45:
                  _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_DEFAULT, v44, v192, 0x16u);
                }
LABEL_46:

                goto LABEL_47;
              }
              v36 |= 0x20uLL;
            }
LABEL_47:
            if (v35 == ++v38)
            {
              v45 = [v33 countByEnumeratingWithState:&v186 objects:buf count:16];
              v35 = v45;
              if (v45) {
                goto LABEL_24;
              }
              goto LABEL_63;
            }
          }
        }
        v36 = 0;
LABEL_63:

LABEL_64:
        v8 = v173;
      }
      else
      {
        v46 = (void *)MEMORY[0x1D944E080]();
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = v48 = v8;
          v50 = (__CFString *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v197 = v49;
          v198 = 2114;
          v199 = v50;
          v51 = v50;
          _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic properties to be an array in the attribute database, instead it is a %{public}@", buf, 0x16u);

          v8 = v48;
        }

        v36 = 0;
      }

      v164 = [(__CFString *)v8 hmf_numberForKey:@"ev"];
      v57 = v8;
      v58 = [(__CFString *)v57 hmf_stringForKey:@"description"];
      v59 = [(__CFString *)v57 hmf_stringForKey:@"format"];
      v60 = [(__CFString *)v57 hmf_stringForKey:@"unit"];
      v61 = v57;
      v62 = v59;
      v174 = objc_alloc_init(HAPMetadataConstraints);
      v166 = v62;
      if (([v62 isEqualToString:@"int"] & 1) != 0
        || ([v62 isEqualToString:@"float"] & 1) != 0
        || ([v62 isEqualToString:@"BOOL"] & 1) != 0
        || ([v62 isEqualToString:@"int8"] & 1) != 0
        || ([v62 isEqualToString:@"int16"] & 1) != 0
        || ([v62 isEqualToString:@"int64"] & 1) != 0
        || ([v62 isEqualToString:@"uint8"] & 1) != 0
        || ([v62 isEqualToString:@"uint16"] & 1) != 0
        || ([v62 isEqualToString:@"uint32"] & 1) != 0
        || [v62 isEqualToString:@"uint64"])
      {
        v63 = [v62 isEqualToString:@"string"];
        v64 = [(__CFString *)v61 hmf_numberForKey:@"minValue"];
        v65 = v174;
        [(HAPMetadataConstraints *)v174 setMinimumValue:v64];

        v66 = [(__CFString *)v61 hmf_numberForKey:@"maxValue"];
        [(HAPMetadataConstraints *)v174 setMaximumValue:v66];

        v67 = [(__CFString *)v61 hmf_numberForKey:@"minStep"];
        [(HAPMetadataConstraints *)v174 setStepValue:v67];

        if ((v63 & 1) == 0) {
          goto LABEL_78;
        }
      }
      else
      {
        v65 = v174;
        if (![v62 isEqualToString:@"string"]) {
          goto LABEL_78;
        }
      }
      v68 = [(__CFString *)v61 hmf_numberForKey:@"maxLen"];
      [(HAPMetadataConstraints *)v65 setMaxLength:v68];

      v69 = [(HAPMetadataConstraints *)v65 maxLength];

      if (!v69) {
        [(HAPMetadataConstraints *)v65 setMaxLength:&unk_1F2C80910];
      }
LABEL_78:
      v70 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      v71 = [(__CFString *)v61 hmf_arrayForKey:@"valid-values" ofClasses:v70];

      v72 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      v169 = v61;
      v73 = [(__CFString *)v61 hmf_arrayForKey:@"valid-values-range" ofClasses:v72];

      v167 = (void *)v60;
      v168 = (void *)v58;
      v165 = v71;
      if ([v71 count] || objc_msgSend(v73, "count"))
      {
        v74 = [MEMORY[0x1E4F1CA48] arrayWithArray:v71];
      }
      else
      {
        v74 = 0;
      }
      if ([v73 count] && (objc_msgSend(v73, "count") & 1) == 0 && objc_msgSend(v73, "count"))
      {
        v75 = 0;
        do
        {
          v76 = [v73 objectAtIndexedSubscript:v75];
          v77 = [v73 objectAtIndexedSubscript:v75 | 1];
          v78 = [v76 integerValue];
          if (v78 <= [v77 integerValue])
          {
            do
            {
              v79 = [NSNumber numberWithInteger:v78];
              v80 = [(__CFString *)v74 containsObject:v79];

              if ((v80 & 1) == 0)
              {
                v81 = [NSNumber numberWithInteger:v78];
                [(__CFString *)v74 addObject:v81];
              }
            }
            while (v78++ < [v77 integerValue]);
          }

          v75 += 2;
        }
        while ([v73 count] > v75);
      }
      if ([(__CFString *)v74 count])
      {
        v83 = (void *)MEMORY[0x1D944E080]([(__CFString *)v74 sortUsingComparator:&__block_literal_global_1275]);
        v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          v85 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v197 = v85;
          v198 = 2112;
          v199 = v74;
          _os_log_impl(&dword_1D4758000, v84, OS_LOG_TYPE_DEBUG, "%{public}@[HAPAccessoryServerIP] Setting valid values: %@", buf, 0x16u);
        }
        [(HAPMetadataConstraints *)v174 setValidValues:v74];
      }
      v86 = [(HAPMetadataConstraints *)v174 minimumValue];
      if (v86
        || ([(HAPMetadataConstraints *)v174 maximumValue],
            (v86 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([(HAPMetadataConstraints *)v174 stepValue],
            (v86 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([(HAPMetadataConstraints *)v174 maxLength],
            (v86 = objc_claimAutoreleasedReturnValue()) != 0))
      {

        v87 = v165;
      }
      else
      {
        v114 = [(HAPMetadataConstraints *)v174 validValues];
        v115 = [v114 count];

        v87 = v165;
        if (!v115)
        {
          v88 = 0;
LABEL_100:
          v8 = v173;

          v89 = [[HAPCharacteristicMetadata alloc] initWithConstraints:v88 description:v168 format:v166 units:v167];
          v90 = +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:v89];

          v91 = [(__CFString *)v169 objectForKeyedSubscript:@"value"];
          v92 = (void *)v91;
          if ((v36 & 2) != 0)
          {
            v7 = v171;
            if (!v91)
            {
              v93 = (void *)MEMORY[0x1D944E080]();
              v94 = HMFGetOSLogHandle();
              v95 = v90;
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v97 = v96 = v173;
                *(_DWORD *)buf = 138543362;
                v197 = v97;
                v98 = v94;
                v99 = "%{public}@[HAPAccessoryServerIP] Readable characteristics must contain 'value' key";
                goto LABEL_113;
              }
LABEL_114:

              v5 = 0;
LABEL_115:
              v110 = v164;
LABEL_122:

              v4 = v162;
              v3 = v163;
              v6 = v170;
              v11 = (void *)v172;
LABEL_123:

              goto LABEL_124;
            }
            v100 = v173;
            v95 = v90;
            v101 = [v90 format];
            v102 = HAPCharacteristicFormatFromString(v101);

            v103 = [(__CFString *)v169 objectForKeyedSubscript:@"value"];
            if (v102)
            {
              v104 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
              *(void *)&v186 = 0;
              v105 = [v104 reverseTransformedValue:v103 format:v102 error:&v186];
              v106 = (id)v186;

              if (v106)
              {
                v107 = (void *)MEMORY[0x1D944E080]();
                v108 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  v109 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v197 = v109;
                  v198 = 2114;
                  v199 = v103;
                  v200 = 2114;
                  v201 = v106;
                  _os_log_impl(&dword_1D4758000, v108, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Failed to transform the value '%{public}@' with error: %{public}@", buf, 0x20u);
                }

                v5 = 0;
                v7 = v171;
                v8 = v173;
                goto LABEL_115;
              }
            }
            else
            {
              v111 = (void *)MEMORY[0x1D944E080]();
              v112 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v113 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v197 = v113;
                _os_log_impl(&dword_1D4758000, v112, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);
              }
              v105 = v103;
            }
          }
          else
          {
            v7 = v171;
            if (v91)
            {
              v93 = (void *)MEMORY[0x1D944E080]();
              v94 = HMFGetOSLogHandle();
              v95 = v90;
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v97 = v96 = v173;
                *(_DWORD *)buf = 138543362;
                v197 = v97;
                v98 = v94;
                v99 = "%{public}@[HAPAccessoryServerIP] Non-readable characteristics must not contain 'value' key";
LABEL_113:
                _os_log_impl(&dword_1D4758000, v98, OS_LOG_TYPE_ERROR, v99, buf, 0xCu);

                v8 = v96;
                goto LABEL_114;
              }
              goto LABEL_114;
            }
            v100 = v173;
            v105 = 0;
            v95 = v90;
          }
          v110 = v164;
          v5 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:]([HAPCharacteristic alloc], "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", v172, v177, v105, 0, v36, [v164 BOOLValue], v95);

          v8 = v100;
          goto LABEL_122;
        }
      }
      v88 = v174;
      goto LABEL_100;
    }
    v21 = (void *)MEMORY[0x1D944E080]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = v3;
      v24 = v4;
      v25 = v7;
      v27 = v26 = v6;
      v28 = (__CFString *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v197 = v27;
      v198 = 2114;
      v199 = v28;
      v29 = v8;
      v30 = v28;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Expected characteristic object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);

      v8 = v29;
      v6 = v26;
      v7 = v25;
      v4 = v24;
      v3 = v23;
    }

    v5 = 0;
LABEL_124:

    if (!v5) {
      break;
    }
    [v3 addObject:v5];
    ++v6;
    v7 = v5;
    if (v6 == v176)
    {
      v116 = [v4 countByEnumeratingWithState:&v182 objects:v191 count:16];
      v176 = v116;
      if (!v116)
      {

        v2 = v161;
        goto LABEL_133;
      }
      goto LABEL_6;
    }
  }
  v145 = (void *)MEMORY[0x1D944E080]();
  v146 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
  {
    v147 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v197 = v147;
    _os_log_impl(&dword_1D4758000, v146, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Unable to parse serialized characteristic.", buf, 0xCu);
  }
  v133 = 0;
  v2 = v161;
LABEL_173:

LABEL_174:
LABEL_175:

  return v133;
}

void sub_1D475CFBC(_Unwind_Exception *a1)
{
}

uint64_t isValidInstanceID(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v1 doubleValue];
      double v3 = floor(v2);
      uint64_t v4 = [v1 doubleValue];
      if (v3 == ceil(v5))
      {
        if ([v1 unsignedLongLongValue])
        {
          uint64_t v10 = 1;
          goto LABEL_12;
        }
        v6 = (void *)MEMORY[0x1D944E080]();
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = HMFGetLogIdentifier();
          int v12 = 138543362;
          v13 = v8;
          v9 = "%{public}@### instance ID is not > 0";
          goto LABEL_10;
        }
      }
      else
      {
        v6 = (void *)MEMORY[0x1D944E080](v4);
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = HMFGetLogIdentifier();
          int v12 = 138543362;
          v13 = v8;
          v9 = "%{public}@### instance ID is not an integer";
LABEL_10:
          _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0xCu);
        }
      }
    }
    else
    {
      v6 = (void *)MEMORY[0x1D944E080]();
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = HMFGetLogIdentifier();
        int v12 = 138543362;
        v13 = v8;
        v9 = "%{public}@### instance ID is not a number";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1D944E080]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v8;
      v9 = "%{public}@### nil instance ID";
      goto LABEL_10;
    }
  }

  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

uint64_t isValidTypeName(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    double v3 = (void *)MEMORY[0x1D944E080]();
    uint64_t v4 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    double v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    v6 = "%{public}@### Type name is nil";
LABEL_11:
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0xCu);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v3 = (void *)MEMORY[0x1D944E080]();
    uint64_t v4 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    double v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    v6 = "%{public}@### Type name is not a string";
    goto LABEL_11;
  }
  if (![v1 length])
  {
    double v3 = (void *)MEMORY[0x1D944E080]();
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      double v5 = HMFGetLogIdentifier();
      int v8 = 138543362;
      v9 = v5;
      v6 = "%{public}@### Type name is an empty string";
      goto LABEL_11;
    }
LABEL_12:

    uint64_t v2 = 0;
    goto LABEL_13;
  }
  uint64_t v2 = 1;
LABEL_13:

  return v2;
}

id HAPShortUUIDType(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@"-0000-1000-8000-0026BB765291"])
  {
    id v2 = [v1 substringToIndex:objc_msgSend(v1, "length") - objc_msgSend(@"-0000-1000-8000-0026BB765291", "length")];
  }
  else
  {
    id v2 = v1;
  }
  double v3 = v2;

  return v3;
}

uint64_t numbersAreNotEqualNilSafe(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  double v5 = (void *)v4;
  if (v3 | v4)
  {
    uint64_t v6 = 1;
    if (v3 && v4)
    {
      if (CFNumberIsFloatType((CFNumberRef)v3) || CFNumberIsFloatType((CFNumberRef)v5))
      {
        [(id)v3 floatValue];
        float v8 = v7;
        [v5 floatValue];
        uint64_t v6 = vabds_f32(v8, v9) >= 0.00000011921;
      }
      else
      {
        uint64_t v6 = [(id)v3 isEqualToNumber:v5] ^ 1;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t HAPCharacteristicFormatFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"uint8"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"uint16"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"uint32"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"uint64"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"int8"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"int16"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"int"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"int64"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"BOOL"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"float"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"string"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"data"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"tlv8"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"array"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"dict"])
  {
    uint64_t v2 = 15;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D475E8C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D476279C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HAPIsInternalBuild()
{
  v0 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v1 = [v0 productVariant] == 3;

  return v1;
}

uint64_t HAPCompareStateNumberWithRollover(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  float v7 = v6;
  if (v5 && v6)
  {
    if ([v5 compare:v6] == 1
      && (int v8 = [v5 unsignedIntValue], v8 - objc_msgSend(v7, "unsignedIntValue") <= a3 >> 1))
    {
      uint64_t v9 = 1;
    }
    else if ([v5 compare:v7])
    {
      uint64_t v9 = -1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    if (v6) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v5) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v10;
    }
  }

  return v9;
}

void __Block_byref_object_dispose__337(uint64_t a1)
{
}

id HAPTLVParseContiguousTlvs(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4, void *a5)
{
  if (a2 >= a3) {
    goto LABEL_4;
  }
  uint64_t Next = TLV8GetNext();
  if (!Next)
  {
    v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    if (v13)
    {
      uint64_t v10 = v13;
      if (a5)
      {
        id v12 = v13;
        uint64_t v10 = v12;
        goto LABEL_13;
      }
      goto LABEL_15;
    }
LABEL_4:
    *a4 = a2;
    id v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  if (a5)
  {
    HMErrorFromOSStatus(Next);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = 0;
LABEL_13:
    id v9 = 0;
    *a5 = v12;
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_15:
  id v9 = 0;
LABEL_5:

  return v9;
}

void sub_1D4764B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  __HMFActivityScopeLeave();
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D4764D18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4764E48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D4764F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D476551C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D47656EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4765860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47659C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4765AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4765B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D476626C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47662E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47666F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HMErrorFromOSStatus(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v20 = 0;
    memset(v19, 0, sizeof(v19));
    DebugGetErrorString();
    v17[0] = *MEMORY[0x1E4F28568];
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Failed with OSStatus code %d (%s)", a1, v19);
    v18[0] = v2;
    v17[1] = *MEMORY[0x1E4F28A50];
    unint64_t v3 = [MEMORY[0x1E4F28C58] errorWithOSStatus:a1];
    v18[1] = v3;
    unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

    if ((int)a1 > -6761)
    {
      uint64_t v5 = 3;
      switch(a1)
      {
        case 0xFFFFE598:
        case 0xFFFFE599:
        case 0xFFFFE59A:
        case 0xFFFFE59F:
        case 0xFFFFE5A0:
        case 0xFFFFE5BB:
        case 0xFFFFE5BC:
        case 0xFFFFE5BD:
        case 0xFFFFE5BE:
          uint64_t v5 = 54;
          break;
        case 0xFFFFE59B:
        case 0xFFFFE59C:
        case 0xFFFFE59D:
        case 0xFFFFE5A3:
        case 0xFFFFE5A5:
        case 0xFFFFE5A6:
        case 0xFFFFE5A7:
        case 0xFFFFE5A8:
        case 0xFFFFE5AA:
        case 0xFFFFE5AB:
        case 0xFFFFE5AC:
        case 0xFFFFE5AD:
        case 0xFFFFE5AE:
        case 0xFFFFE5AF:
        case 0xFFFFE5B0:
        case 0xFFFFE5B1:
        case 0xFFFFE5B4:
        case 0xFFFFE5B5:
        case 0xFFFFE5B6:
        case 0xFFFFE5B7:
        case 0xFFFFE5B8:
        case 0xFFFFE5B9:
        case 0xFFFFE5BA:
        case 0xFFFFE5BF:
        case 0xFFFFE5C0:
        case 0xFFFFE5C1:
        case 0xFFFFE5C2:
        case 0xFFFFE5C3:
        case 0xFFFFE5C5:
        case 0xFFFFE5C6:
        case 0xFFFFE5C8:
        case 0xFFFFE5C9:
        case 0xFFFFE5CD:
        case 0xFFFFE5CE:
        case 0xFFFFE5D1:
          goto LABEL_15;
        case 0xFFFFE59E:
          uint64_t v5 = 55;
          break;
        case 0xFFFFE5A1:
        case 0xFFFFE5A2:
        case 0xFFFFE5A9:
          uint64_t v5 = 56;
          break;
        case 0xFFFFE5A4:
        case 0xFFFFE5B3:
        case 0xFFFFE5C4:
        case 0xFFFFE5C7:
        case 0xFFFFE5CC:
          goto LABEL_6;
        case 0xFFFFE5B2:
          uint64_t v5 = 66;
          break;
        case 0xFFFFE5CA:
        case 0xFFFFE5CF:
        case 0xFFFFE5D0:
          break;
        case 0xFFFFE5CB:
          goto LABEL_14;
        case 0xFFFFE5D2:
          uint64_t v5 = 48;
          break;
        default:
          if ((a1 - 35) > 0x1E || ((1 << (a1 - 35)) & 0x42010001) == 0) {
            goto LABEL_15;
          }
LABEL_14:
          uint64_t v5 = 4;
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 0xFFFEEA18:
          uint64_t v5 = 96;
          break;
        case 0xFFFFE58B:
          uint64_t v5 = 10;
          break;
        case 0xFFFFE590:
LABEL_6:
          uint64_t v5 = 53;
          break;
        default:
LABEL_15:
          if ((a1 - 200400) >= 0x64)
          {
            if ((a1 - 200500) >= 0x64)
            {
              if ((a1 + 25298) <= 0xFFFFFFFD)
              {
                float v7 = (void *)MEMORY[0x1D944E080]();
                int v8 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v9 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  id v12 = v9;
                  __int16 v13 = 1024;
                  int v14 = a1;
                  __int16 v15 = 2080;
                  v16 = v19;
                  _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Treating OSStatus %d (%s) as Generic error", buf, 0x1Cu);
                }
              }
              uint64_t v5 = 52;
            }
            else
            {
              uint64_t v5 = 59;
            }
          }
          else
          {
            uint64_t v5 = 58;
          }
          break;
      }
    }
    id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:v5 userInfo:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t _deserializePublicKey(uint64_t a1, uint64_t a2)
{
  if (a2 != 64) {
    return 4294960553;
  }
  LODWORD(result) = HexToData();
  if (result) {
    return result;
  }
  else {
    return 4294960553;
  }
}

id __viewHintForKeyType(void *a1)
{
  uint64_t v1 = [a1 unsignedIntegerValue];
  id v2 = 0;
  if (v1 > 1752001329)
  {
    if (v1 > 1852203848)
    {
      if (v1 == 1852203858) {
        goto LABEL_14;
      }
      uint64_t v3 = 1852203849;
    }
    else
    {
      if (v1 == 1752001330) {
        goto LABEL_14;
      }
      uint64_t v3 = 1836348530;
    }
LABEL_13:
    if (v1 != v3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v1 <= 1751998828)
  {
    if (v1 != 1651209584)
    {
      if (v1 != 1751216227) {
        goto LABEL_16;
      }
      unint64_t v4 = (id *)MEMORY[0x1E4F3B4E0];
      goto LABEL_15;
    }
  }
  else if ((unint64_t)(v1 - 1751998829) >= 2)
  {
    uint64_t v3 = 1751999337;
    goto LABEL_13;
  }
LABEL_14:
  unint64_t v4 = (id *)MEMORY[0x1E4F3B4C0];
LABEL_15:
  id v2 = *v4;
LABEL_16:

  return v2;
}

uint64_t __Block_byref_object_copy__336(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

__CFString *HAPAuthMethodToString(unint64_t a1)
{
  if (a1 > 6) {
    return @"HAPAuthMethodUnknown";
  }
  else {
    return off_1E69EFD28[a1];
  }
}

void sub_1D4768514(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4768758(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HAPAccessorySuspendedStateDescription(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v2 = NSString;
    uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"unknown (%@)", v3];
  }
  else
  {
    uint64_t v1 = off_1E69F3430[a1];
  }

  return v1;
}

void sub_1D4768A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4769B40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D476A4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id HAPAuthFeaturesToString(char a1)
{
  if (a1)
  {
    id v2 = [@"<" stringByAppendingString:@" AuthV2"];
    if ((a1 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v2 = @"<";
  if ((a1 & 4) != 0)
  {
LABEL_5:
    uint64_t v3 = [(__CFString *)v2 stringByAppendingString:@" AuthV3"];

    id v2 = (__CFString *)v3;
  }
LABEL_6:
  if ((a1 & 2) == 0)
  {
    if ((a1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v7 = [(__CFString *)v2 stringByAppendingString:@" Token"];

  id v2 = (__CFString *)v7;
  if ((a1 & 8) != 0)
  {
LABEL_8:
    uint64_t v4 = [(__CFString *)v2 stringByAppendingString:@" SWCert"];

    id v2 = (__CFString *)v4;
  }
LABEL_9:
  uint64_t v5 = [(__CFString *)v2 stringByAppendingString:@" >"];

  return v5;
}

uint64_t HAPGetPreferredAuthMethod(int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 4;
  uint64_t v3 = 5;
  if ((a1 & 0x10) != 0) {
    uint64_t v3 = 6;
  }
  if ((a1 & 8) == 0) {
    uint64_t v2 = v3;
  }
  if ((a1 & 2) == 0) {
    uint64_t v1 = v2;
  }
  if (a1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v1;
  }
  if (a1) {
    return v4;
  }
  else {
    return 0;
  }
}

void sub_1D4770C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4770E58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4771634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D4771744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4771934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4771A48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4771C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4771D7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4771EB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D4771FD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D47722C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47724C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPAudioCodecBitRateAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HAPAudioCodecBitRateConstant";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPAudioCodecBitRate %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HAPAudioCodecBitRateVariable";
  }
  return v2;
}

__CFString *HAPAudioCodecSampleRateAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPAudioCodecSampleRate %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69EFDB0[a1];
  }

  return v1;
}

__CFString *HAPAudioCodecTypeAsString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPAudioCodecType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69EFDC8[a1];
  }

  return v1;
}

void sub_1D4776AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4777F00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4778B78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

uint64_t _SavePairedPeerDelegateCallback_f(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v7 && (isKindOfClass & 1) != 0)
  {
    uint64_t v9 = [v7 server];

    id v7 = (id)v9;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:32];
  uint64_t v11 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  id v12 = [v7 identifier];
  int v13 = [v12 isEqualToString:v11];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = v7;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Pair-Setup - Saving KeyChain for accessory", buf, 0xCu);
    }
    v18 = [v15 keyStore];
    id v22 = 0;
    [v18 savePublicKey:v10 forAccessoryName:v11 error:&v22];
    id v19 = v22;

    [v15 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v10];
    uint64_t v20 = [v19 code];
  }
  else
  {
    uint64_t v20 = 4294960591;
  }

  return v20;
}

uint64_t _FindPairedPeerDelegateCallback_f(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v7 && (isKindOfClass & 1) != 0)
  {
    uint64_t v9 = [v7 server];

    id v7 = (id)v9;
  }
  uint64_t v10 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  uint64_t v11 = [v7 identifier];
  int v12 = [v11 isEqualToString:v10];

  if (v12)
  {
    int v13 = [v7 keyStore];
    id v20 = 0;
    id v14 = [v13 readPublicKeyForAccessoryName:v10 registeredWithHomeKit:0 error:&v20];
    id v15 = v20;

    uint64_t v16 = [v15 code];
    if (!v16)
    {
      if (v14)
      {
        if ([v14 length] == 32)
        {
          id v14 = v14;
          uint64_t v17 = (_OWORD *)[v14 bytes];
          uint64_t v16 = 0;
          long long v18 = v17[1];
          *a3 = *v17;
          a3[1] = v18;
        }
        else
        {
          uint64_t v16 = 4294960553;
        }
      }
      else
      {
        uint64_t v16 = 4294960569;
      }
    }
  }
  else
  {
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = 4294960542;
  }

  return v16;
}

uint64_t _CopyPairingIdentityDelegateCallback_f(int a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v9 && (isKindOfClass & 1) != 0)
  {
    uint64_t v11 = [v9 server];

    id v9 = (id)v11;
  }
  int v12 = [v9 pairingRequest];
  uint64_t v13 = [v12 pairingIdentity];
  if (v13)
  {
    id v14 = (void *)v13;
  }
  else
  {
    id v15 = [v9 keyBag];
    id v14 = [v15 currentIdentity];

    if (!v14)
    {
      v39 = a2;
      v24 = [v9 keyStore];
      if (a4)
      {
        id v45 = 0;
        id v46 = 0;
        id v44 = 0;
        v27 = [v9 identifier];
        id v43 = 0;
        [v24 getControllerPublicKey:&v46 secretKey:&v45 username:&v44 allowCreation:a1 != 0 forAccessory:v27 error:&v43];
        id v22 = v46;
        id v25 = v45;
        id v23 = v44;
        id v26 = v43;

        id v14 = 0;
      }
      else
      {
        id v41 = 0;
        id v42 = 0;
        v28 = [v9 identifier];
        id v40 = 0;
        [v24 getControllerPublicKey:&v42 secretKey:0 username:&v41 allowCreation:a1 != 0 forAccessory:v28 error:&v40];
        id v22 = v42;
        id v23 = v41;
        id v26 = v40;

        id v14 = 0;
        id v25 = 0;
      }
      a2 = v39;
      goto LABEL_16;
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = v9;
  long long v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    id v20 = [v14 identifier];
    *(_DWORD *)buf = 138543618;
    v48 = v19;
    __int16 v49 = 2114;
    v50 = v20;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Using Pairing Identity for PV/PS : %{public}@", buf, 0x16u);
  }
  uint64_t v21 = [v14 publicKey];
  id v22 = [v21 data];

  id v23 = [v14 identifier];
  if (a4)
  {
    v24 = [v14 privateKey];
    id v25 = [v24 data];
    id v26 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v26 = 0;
  id v25 = 0;
LABEL_17:
  uint64_t v29 = [v26 code];
  if (v29) {
    goto LABEL_29;
  }
  if (!v22) {
    goto LABEL_31;
  }
  if ([v22 length] != 32) {
    goto LABEL_30;
  }
  v30 = (_OWORD *)[v22 bytes];
  long long v31 = v30[1];
  *a3 = *v30;
  a3[1] = v31;
  if (!a4) {
    goto LABEL_24;
  }
  if (!v25)
  {
LABEL_31:
    uint64_t v29 = 4294960569;
    goto LABEL_29;
  }
  if ([v25 length] != 32) {
    goto LABEL_30;
  }
  v32 = (_OWORD *)[v25 bytes];
  long long v33 = v32[1];
  *a4 = *v32;
  a4[1] = v33;
LABEL_24:
  uint64_t v29 = 0;
  if (a2 && v23)
  {
    uint64_t v34 = [v23 lengthOfBytesUsingEncoding:4];
    if (v34)
    {
      size_t v35 = v34 + 1;
      v36 = (char *)malloc_type_calloc(v34 + 1, 1uLL, 0x100004077774924uLL);
      if (v36)
      {
        v37 = v36;
        strlcpy(v36, (const char *)[v23 UTF8String], v35);
        uint64_t v29 = 0;
        *a2 = v37;
      }
      else
      {
        uint64_t v29 = 4294960568;
      }
      goto LABEL_29;
    }
LABEL_30:
    uint64_t v29 = 4294960553;
  }
LABEL_29:

  return v29;
}

void sub_1D477AE04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D477B6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D477CC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 128));
  _Unwind_Resume(a1);
}

void sub_1D477CD28(_Unwind_Exception *a1)
{
}

void sub_1D477D198(_Unwind_Exception *a1)
{
}

void sub_1D477D51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__693(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__694(uint64_t a1)
{
}

void sub_1D477D7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D477EEF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1D477F590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D477FC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4780F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D478183C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _PairSetupEventHandler(uint64_t result, uint64_t a2, void *a3)
{
  if (result == 3) {
    return [a3 _handlePairSetupAfterM4Callback];
  }
  return result;
}

uint64_t _PairSetupPromptForSetupCodeDelegateCallback_f(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 _promptForSetupCodeWithFlags:a1 delaySeconds:a2 pairingFlags:PairingSessionGetPeerFlags() isWAC:0];

  return v6;
}

void sub_1D4783428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D47839B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4785080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

id _parseNotificationContextFromCharacteristicResponse(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "hmf_stringForKey:", @"context");
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@[HAPAccessoryServerIP] Notification context not present in response", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1D478B6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void sub_1D478C228(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D478C790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id a55,id a56)
{
}

void sub_1D478C9E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D478D1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a35);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v36 - 192));
  _Unwind_Resume(a1);
}

void sub_1D478D3C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D478E404(_Unwind_Exception *a1)
{
}

void sub_1D4790280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a30);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1D47904C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4791374(_Unwind_Exception *a1)
{
}

void sub_1D4791488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4791C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4791FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4792408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4792A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4792FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4793988(_Unwind_Exception *a1)
{
}

void sub_1D4793E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_1D4794264(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D479436C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4795E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4796838(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4796B7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4796BF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t _WACPairSetupPromptForSetupCodeDelegateCallback_f(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _promptForSetupCodeWithFlags:a1 delaySeconds:a2 pairingFlags:0 isWAC:1];
}

void sub_1D47991CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D479A1EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D479B598(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D479CA88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D479CC28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ___parseSerializedCharacteristicConstraints_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_1D479D350(_Unwind_Exception *exception_object)
{
}

void sub_1D479D974(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

uint64_t HAPAccessoryServerDiscoveryMethod(uint64_t a1)
{
  if (a1) {
    return 2;
  }
  else {
    return 1;
  }
}

void sub_1D47A20B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D47A2308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t verifyResponseStateAndError(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  uint64_t result = TLV8Get();
  if (!result) {
    return 4294960553;
  }
  return result;
}

uint64_t appendRequestMethodAndState()
{
  uint64_t result = TLV8BufferAppendUInt64();
  if (!result)
  {
    return TLV8BufferAppendUInt64();
  }
  return result;
}

void hap2LogInitialize()
{
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
}

uint64_t __hap2LogInitialize_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CoreHAP", "HAP");
  id v1 = (void *)hap2Log_default;
  hap2Log_default = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.CoreHAP", "Browser");
  uint64_t v3 = (void *)hap2Log_browser;
  hap2Log_browser = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.CoreHAP", "Accessory");
  id v5 = (void *)hap2Log_accessory;
  hap2Log_accessory = (uint64_t)v4;

  hap2Log_coap = (uint64_t)os_log_create("com.apple.CoreHAP", "CoAP");

  return MEMORY[0x1F41817F8]();
}

void sub_1D47A6D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2002(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2003(uint64_t a1)
{
}

void sub_1D47A74C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47A9EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47AB714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v13 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v15 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_1D47AC79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47ACA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47ACD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47AD130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47B1A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2670(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2671(uint64_t a1)
{
}

void sub_1D47B1D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D47B1F5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t _FindPairedPeerDelegateCallback_f_2722(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  unsigned int v23 = 0;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  if (!v8)
  {
    uint64_t v10 = 0;
    int v22 = -6705;
    goto LABEL_15;
  }
  uint64_t v9 = [v7 _handlePeerPairingIdentityRequestWithIdentifier:v8 status:&v23];
  uint64_t v10 = v9;
  if (!v23)
  {
    uint64_t v11 = [v9 identifier];
    char v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      int v22 = -6748;
      goto LABEL_15;
    }
    if (a3)
    {
      uint64_t v13 = [v10 publicKey];

      if (v13)
      {
        uint64_t v14 = [v10 publicKey];
        uint64_t v15 = [v14 data];
        size_t v16 = [v15 length];
        uint64_t v17 = *MEMORY[0x1E4F64F10];

        if (v16 == v17)
        {
          uint64_t v18 = [v10 publicKey];
          id v19 = [v18 data];
          memcpy(a3, (const void *)[v19 bytes], v16);

          goto LABEL_9;
        }
        int v22 = -6743;
LABEL_15:
        unsigned int v23 = v22;
        goto LABEL_9;
      }
LABEL_11:
      int v22 = -6727;
      goto LABEL_15;
    }
  }
LABEL_9:
  uint64_t v20 = v23;

  return v20;
}

uint64_t _CopyPairingIdentityDelegateCallback_f_2723(uint64_t a1, char **a2, void *a3, void *a4, void *a5)
{
  unsigned int v35 = 0;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = [v8 _handleLocalPairingIdentityRequestWithStatus:&v35];
  uint64_t v10 = v9;
  if (v35) {
    goto LABEL_15;
  }
  if (a2)
  {
    uint64_t v11 = [v9 identifier];
    uint64_t v12 = [v11 lengthOfBytesUsingEncoding:4];

    if (!v12) {
      goto LABEL_18;
    }
    size_t v13 = v12 + 1;
    uint64_t v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
    if (!v14)
    {
      int v34 = -6728;
      goto LABEL_20;
    }
    uint64_t v15 = v14;
    id v16 = [v10 identifier];
    strlcpy(v15, (const char *)[v16 UTF8String], v13);

    *a2 = v15;
  }
  uint64_t v17 = (uint64_t *)MEMORY[0x1E4F64F10];
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v18 = [v10 publicKey];

  if (!v18) {
    goto LABEL_17;
  }
  id v19 = [v10 publicKey];
  uint64_t v20 = [v19 data];
  size_t v21 = [v20 length];
  uint64_t v22 = *v17;

  if (v21 != v22)
  {
LABEL_18:
    int v34 = -6743;
    goto LABEL_20;
  }
  unsigned int v23 = [v10 publicKey];
  id v24 = [v23 data];
  memcpy(a3, (const void *)[v24 bytes], v21);

LABEL_11:
  if (a4)
  {
    id v25 = [v10 privateKey];

    if (v25)
    {
      id v26 = [v10 privateKey];
      uint64_t v27 = [v26 data];
      size_t v28 = [v27 length];
      uint64_t v29 = *v17;

      if (v28 == v29)
      {
        v30 = [v10 privateKey];
        id v31 = [v30 data];
        memcpy(a4, (const void *)[v31 bytes], v28);

        goto LABEL_15;
      }
      goto LABEL_18;
    }
LABEL_17:
    int v34 = -6727;
LABEL_20:
    unsigned int v35 = v34;
  }
LABEL_15:
  uint64_t v32 = v35;

  return v32;
}

__CFString *HAPWiFiConfigurationOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPWiFiConfigurationOperationType %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E69F0BC0[a1 - 1];
  }

  return v1;
}

__CFString *HAPWiFiSecurityModeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      os_log_t v2 = @"HAPWiFiSecurityModeWPA2PSK";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPWiFiSecurityMode %ld", a1);
      os_log_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    os_log_t v2 = @"HAPWiFiSecurityModeNone";
  }
  return v2;
}

void sub_1D47B9D1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *HAPDiagnosticsSnapshotAudioAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      id v5 = @"HAPDiagnosticsSnapshotAudioAudioRecording";
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_9;
      }
      id v5 = @"HAPDiagnosticsSnapshotAudioAudioClips";
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_12:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

__CFString *HAPDiagnosticsSnapshotOptionsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      id v5 = @"HAPDiagnosticsSnapshotOptionDelay";
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_9;
      }
      id v5 = @"HAPDiagnosticsSnapshotOptionConfigurableMaxSize";
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_12:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

__CFString *HAPDiagnosticsSnapshotTypeAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      id v5 = @"HAPDiagnosticsSnapshotTypeManufacturerSnapshot";
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_9;
      }
      id v5 = @"HAPDiagnosticsSnapshotTypeADKSnapshot";
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_12:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

void sub_1D47C3CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C3E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4235(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4236(uint64_t a1)
{
}

void sub_1D47C40E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C461C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C4FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C56F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C5AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C5E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C6064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47C635C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D47C692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D47C6CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPNFCAccessKeyStateAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"HAPNFCAccessKeyStateActive";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPNFCAccessKeyState %ld", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"HAPNFCAccessKeyStateSuspended";
  }
  return v2;
}

__CFString *HAPNFCAccessKeyTypeAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"HAPNFCAccessKeyTypeEd25519";
  }
  else if (a1 == 2)
  {
    id v2 = @"HAPNFCAccessKeyTypeNIST256";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPNFCAccessKeyType %ld", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *HAPNFCAccessOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPNFCAccessOperationType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F0CB0[a1 - 1];
  }

  return v1;
}

__CFString *HAPNFCAccessResponseStatusAsString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPNFCAccessResponseStatus %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F0CC8[a1];
  }

  return v1;
}

__CFString *HAPAccessoryServerDiscoveryMethodToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Keystore";
  }
  else {
    return off_1E69F0CF0[a1 - 1];
  }
}

__CFString *HAPAccessCodeOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPAccessCodeOperationType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F0D08[a1 - 1];
  }

  return v1;
}

__CFString *HAPAccessCodeResponseStatusAsString(unint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPAccessCodeResponseStatus %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F0D30[a1];
  }

  return v1;
}

__CFString *HAP2TLVErrorsAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"HAP2TLVErrorsUnknown";
  }
  else if (a1 == 2)
  {
    id v2 = @"HAP2TLVErrorsAuthentication";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAP2TLVErrors %ld", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *HAP2TLVPairingStateAsString(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = @"HAP2TLVPairingStateM1";
  }
  else if (a1 == 2)
  {
    id v2 = @"HAP2TLVPairingStateM2";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAP2TLVPairingState %ld", a1);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t _deserializeDataToKeyPair(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = 4294960591;
  if (!v5 || !a2)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = 0;
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v11 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  uint64_t v6 = v11;
  if (!v11)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v7 = 4294960563;
    goto LABEL_14;
  }
  if ([v11 length] != 129)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_21;
  }
  uint64_t v12 = [v6 componentsSeparatedByString:@"+"];
  uint64_t v10 = v12;
  if (!v12)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v7 = 4294960579;
    goto LABEL_14;
  }
  if ([v12 count] != 2)
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v7 = 4294960532;
    goto LABEL_14;
  }
  id v8 = [v10 objectAtIndexedSubscript:0];
  if ([v8 length] != 64)
  {
    id v9 = 0;
    goto LABEL_21;
  }
  id v9 = [v10 objectAtIndexedSubscript:1];
  if ([v9 length] != 64) {
    goto LABEL_21;
  }
  id v8 = v8;
  uint64_t v13 = _deserializePublicKey([v8 UTF8String], objc_msgSend(v8, "length"));
  if (v13)
  {
    uint64_t v7 = v13;
    goto LABEL_14;
  }
  id v9 = v9;
  [v9 UTF8String];
  if ([v9 length] != 64 || (uint64_t v7 = HexToData(), !v7)) {
LABEL_21:
  }
    uint64_t v7 = 4294960553;
LABEL_14:

  return v7;
}

uint64_t _serializeKeyPairToData(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = 4294960591;
  if (a1 && a2)
  {
    if (a3)
    {
      DataToHexCStringEx();
      DataToHexCStringEx();
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s+%s", v9, __s);
      id v7 = [v6 dataUsingEncoding:4];
      *a3 = v7;
      memset_s(__s, 0x41uLL, 0, 0x41uLL);

      return 0;
    }
  }
  return result;
}

const char *KeyTypeDescription(void *a1)
{
  uint64_t v1 = [a1 unsignedIntegerValue];
  if (v1 <= 1751998828)
  {
    if (v1 <= 1751216194)
    {
      switch(v1)
      {
        case 1651209584:
          return "bkup";
        case 1751216193:
          return "hapA";
        case 1751216194:
          return "hapB";
      }
    }
    else if (v1 > 1751216210)
    {
      if (v1 == 1751216211) {
        return "hapS";
      }
      if (v1 == 1751216227) {
        return "hapc";
      }
    }
    else
    {
      if (v1 == 1751216195) {
        return "hapC";
      }
      if (v1 == 1751216205) {
        return "hapM";
      }
    }
  }
  else if (v1 > 1752001640)
  {
    if (v1 > 1852203848)
    {
      if (v1 == 1852203849) {
        return "nfcI";
      }
      if (v1 == 1852203858) {
        return "nfcR";
      }
    }
    else
    {
      if (v1 == 1752001641) {
        return "hmli";
      }
      if (v1 == 1836348530) {
        return "mttr";
      }
    }
  }
  else if (v1 > 1751999336)
  {
    if (v1 == 1751999337) {
      return "hmci";
    }
    if (v1 == 1752001330) {
      return "hmk2";
    }
  }
  else
  {
    if (v1 == 1751998829) {
      return "hmam";
    }
    if (v1 == 1751998830) {
      return "hmams";
    }
  }
  return "unknown";
}

uint64_t __Block_byref_object_copy__5093(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5094(uint64_t a1)
{
}

void sub_1D47CE798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47CEA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47CEE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D47D01C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D03CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _deserializeUUID(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = 4294960591;
  if (v3 && a2)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
    if (v5)
    {
      id v6 = v5;
      *a2 = v6;

      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = 4294960579;
    }
  }

  return v4;
}

void sub_1D47D0B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D47D0ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D1114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D16F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D2C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47D2FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D31DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D33F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D3F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D45B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47D488C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D4C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D5208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47D53A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47D54F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t deviceSupportsKeychainSync()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled == 1)
  {
    os_log_t v0 = (void *)MEMORY[0x1D944E080]();
    uint64_t v1 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      id v2 = HMFGetLogIdentifier();
      int v7 = 138543618;
      id v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "BOOL deviceSupportsKeychainSync(void)";
      _os_log_impl(&dword_1D4758000, v1, OS_LOG_TYPE_INFO, "%{public}@%s always returns YES because HAPIsHH2Enabled() is true)", (uint8_t *)&v7, 0x16u);
    }
    return 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F65570] systemInfo];
    unint64_t v5 = [v4 productPlatform];
    uint64_t v3 = (v5 < 6) & (0x26u >> v5);
  }
  return v3;
}

void sub_1D47D5F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D64AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D79D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Block_object_dispose((const void *)(v36 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D47D8A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47DA7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5326(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5327(uint64_t a1)
{
}

void sub_1D47DAC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id mapUnderlyingErrorToHAPError(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v1;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v2 domain];
  unint64_t v5 = (void *)*MEMORY[0x1E4F28760];

  if (v4 != v5) {
    goto LABEL_5;
  }
  uint64_t v9 = [v2 code];
  if (v9 > 52)
  {
    uint64_t v6 = 8;
    if ((unint64_t)(v9 - 53) >= 2 && v9 != 61) {
      goto LABEL_5;
    }
  }
  else
  {
    if (v9 != -6722)
    {
      if (v9 == -3936 || v9 == 5)
      {
        uint64_t v6 = 26;
        goto LABEL_6;
      }
LABEL_5:
      uint64_t v6 = 22;
      goto LABEL_6;
    }
    uint64_t v6 = 25;
  }
LABEL_6:
  int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:v6 userInfo:v3];

  return v7;
}

void sub_1D47E1A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58)
{
}

uint64_t __Block_byref_object_copy__5773(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5774(uint64_t a1)
{
}

void sub_1D47E2684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D47E2CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47E3728(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D47E3B5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void joinComplete(int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __joinComplete_block_invoke;
  v6[3] = &unk_1E69F3DD0;
  id v7 = v3;
  int v8 = a1;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __joinComplete_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _joinCompleteWithStatus:*(unsigned int *)(a1 + 40)];
}

void sub_1D47E4BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreWiFiLibraryCore()
{
  if (!CoreWiFiLibraryCore_frameworkLibrary) {
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreWiFiLibraryCore_frameworkLibrary;
}

Class __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  if (!CoreWiFiLibraryCore())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("CWFInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCWFInterfaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = abort_report_np();
    return (Class)__61__HAPWACAccessoryClient__joinAccessoryNetworkWithCompletion___block_invoke(v4);
  }
  return result;
}

uint64_t __CoreWiFiLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreWiFiLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D47E5504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47E58B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D47E6034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D47E63B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D47E6528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EA168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1D47EBC24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EBDD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EBE84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EC02C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EC1DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D47EC28C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _notificationContextTLVDataFromPayload(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = a3 + 5;
  if (a3 + 5 <= a2)
  {
    uint64_t v14 = a1 + a3;
    uint64_t v15 = *(unsigned int *)(a1 + a3);
    uint64_t v16 = *(unsigned __int8 *)(v14 + 4);
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = v7;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v34 = v20;
      __int16 v35 = 1024;
      *(_DWORD *)uint64_t v36 = v15;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v16;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Notification context identifier: 0x%x source: 0x%x", buf, 0x18u);
    }
    size_t v21 = [HAPTLVUnsignedNumberValue alloc];
    uint64_t v22 = [NSNumber numberWithInteger:v15];
    unsigned int v23 = [(HAPTLVNumberValueBase *)v21 initWithValue:v22];

    id v24 = [[HAPNotificationContextSourceWrapper alloc] initWithValue:v16];
    id v25 = [[HAPCharacteristicNotificationContext alloc] initWithContextIdentifier:v23 source:v24 clockTickCounter:0];
    id v32 = 0;
    uint64_t v13 = [(HAPCharacteristicNotificationContext *)v25 serializeWithError:&v32];
    id v26 = v32;
    if (v26)
    {
      uint64_t v27 = (void *)MEMORY[0x1D944E080]();
      id v28 = v18;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v34 = v30;
        __int16 v35 = 2114;
        *(void *)uint64_t v36 = v26;
        _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode notification context with error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = v7;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v34 = v12;
      __int16 v35 = 2048;
      *(void *)uint64_t v36 = a2;
      *(_WORD *)&v36[8] = 2048;
      uint64_t v37 = v8;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received notification context of invalid length:%lu:%lu in payload", buf, 0x20u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_1D47EF7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D47F12E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 160));
  _Unwind_Resume(a1);
}

void sub_1D47F794C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6440(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6441(uint64_t a1)
{
}

void sub_1D47F9020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47F967C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47F9D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6626(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6627(uint64_t a1)
{
}

void sub_1D47FA928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D47FAE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47FB734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_1D47FBF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D47FC2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D47FC3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPCharacteristicValueTransitionEndBehaviorAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HAPCharacteristicValueTransitionEndBehaviorLoop";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPCharacteristicValueTransitionEndBehavior %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HAPCharacteristicValueTransitionEndBehaviorNoChange";
  }
  return v2;
}

__CFString *HAPCharacteristicValueTransitionLinearStartConditionAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPCharacteristicValueTransitionLinearStartCondition %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F1538[a1];
  }

  return v1;
}

__CFString *HAPFirmwareUpdateStateAsString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPFirmwareUpdateState %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F1550[a1];
  }

  return v1;
}

__CFString *HAPOTAProviderStateAsString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPOTAProviderState %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F1578[a1];
  }

  return v1;
}

void sub_1D48020F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D480545C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4806AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4806C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4807DE0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4808168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4808A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D480A178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D480C488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1D480C5BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D480C940(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D480CFC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D480D7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D480DDC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D480E4C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D4812C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void _callCharacteristicOperationCompletion(void *a1, void *a2, int a3, void *a4, void *a5)
{
  id v20 = a1;
  uint64_t v9 = a2;
  unint64_t v10 = a4;
  unint64_t v11 = a5;
  uint64_t v12 = (void *)v11;
  if (v9)
  {
    if (!(v10 | v11))
    {
      uint64_t v17 = 0;
LABEL_14:
      v9[2](v9, v20, v17);

      goto LABEL_15;
    }
    switch(a3)
    {
      case 3:
        id v18 = NSString;
        uint64_t v14 = [v20 shortDescription];
        [v18 stringWithFormat:@"Failed to configure characteristic %@.", v14];
        break;
      case 2:
        uint64_t v19 = NSString;
        uint64_t v14 = [v20 shortDescription];
        [v19 stringWithFormat:@"Failed to write to characteristic %@.", v14];
        break;
      case 1:
        uint64_t v13 = NSString;
        uint64_t v14 = [v20 shortDescription];
        uint64_t v15 = [v13 stringWithFormat:@"Failed to read from characteristic %@.", v14];
        uint64_t v16 = 14;
LABEL_11:

LABEL_13:
        uint64_t v17 = [MEMORY[0x1E4F28C58] hapErrorWithCode:v16 description:v15 reason:v12 suggestion:0 underlyingError:v10];

        goto LABEL_14;
      default:
        uint64_t v15 = 0;
        uint64_t v16 = 1;
        goto LABEL_13;
    uint64_t v15 = };
    uint64_t v16 = 13;
    goto LABEL_11;
  }
LABEL_15:
}

void sub_1D48135A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
}

void sub_1D4813AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4813F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48160EC(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__7491(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7492(uint64_t a1)
{
}

void sub_1D48174D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  __HMFActivityScopeLeave();
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4817D8C(_Unwind_Exception *a1)
{
}

void sub_1D481860C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D4819B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D481AAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _parseCharacteristicInstanceID(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = +[HAPDataValueTransformer defaultDataValueTransformer];
  uint64_t v5 = [v3 value];

  id v9 = 0;
  uint64_t v6 = [v4 reverseTransformedValue:v5 format:2 error:&v9];
  id v7 = v9;

  if (a2 && !v6)
  {
    *a2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Invalid Characteristic Instance ID value." reason:0 suggestion:0 underlyingError:v7];
  }

  return v6;
}

uint64_t _isServiceInstanceIDCharacteristic(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 UUID];
  id v3 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"E604E95D-A759-4817-87D3-AA005083A0D1"];
  if ([v2 isEqual:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [v1 UUID];
    uint64_t v6 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000051-0000-1000-8000-0026BB765291"];
    uint64_t v4 = [v5 isEqual:v6];
  }
  return v4;
}

id _parseServiceInstanceID(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = +[HAPDataValueTransformer defaultDataValueTransformer];
  uint64_t v5 = [v3 value];

  id v9 = 0;
  uint64_t v6 = [v4 reverseTransformedValue:v5 format:2 error:&v9];
  id v7 = v9;

  if (a2 && !v6)
  {
    *a2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Invalid Service Instance ID value." reason:0 suggestion:0 underlyingError:v7];
  }

  return v6;
}

uint64_t _isServiceSignatureCharacteristic(void *a1)
{
  id v1 = [a1 UUID];
  uint64_t v2 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"000000A5-0000-1000-8000-0026BB765291"];
  uint64_t v3 = [v1 isEqual:v2];

  return v3;
}

void sub_1D48234B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D482435C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48245D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4824724(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4826028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

id _createCharacteristicWriteBody(void *a1, uint64_t a2, void *a3, int a4, void *a5, void *a6, double a7)
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a1;
  TLV8BufferInit();
  uint64_t v16 = +[HAPDataValueTransformer defaultDataValueTransformer];
  uint64_t v17 = [v16 transformedValue:v15 format:a2 error:a6];

  if (!v17)
  {
    size_t v21 = 0;
LABEL_20:
    uint64_t v20 = 0;
    goto LABEL_4;
  }
  id v18 = v17;
  [v18 bytes];
  [v18 length];
  uint64_t appended = TLV8BufferAppend();
  if (!appended)
  {
    if (!v13
      || (id v25 = v13,
          [v25 bytes],
          [v25 length],
          uint64_t appended = TLV8BufferAppend(),
          !appended))
    {
      if (a7 <= 0.0) {
        goto LABEL_26;
      }
      if (!(unint64_t)(a7 * 10.0))
      {
        size_t v21 = 0;
        uint64_t v20 = 4294960559;
        goto LABEL_4;
      }
      uint64_t appended = TLV8BufferAppendUInt64();
      if (!appended)
      {
LABEL_26:
        if (!a4 || (uint64_t appended = TLV8BufferAppendUInt64(), !appended))
        {
          if (!objc_msgSend(v14, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0)
            || (id v26 = v14,
                [v26 bytes],
                [v26 length],
                uint64_t appended = TLV8BufferAppend(),
                !appended))
          {
            size_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:v28];
            if (!v21)
            {
              uint64_t v20 = 4294960568;
              goto LABEL_4;
            }
            goto LABEL_20;
          }
        }
      }
    }
  }
  uint64_t v20 = appended;
  size_t v21 = 0;
LABEL_4:
  TLV8BufferFree();
  if (a6 && v20)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    unsigned int v23 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v20];
    *a6 = [v22 hapErrorWithCode:12 description:@"Write failed." reason:@"Failed to create write request body." suggestion:0 underlyingError:v23];
  }

  return v21;
}

uint64_t _parseLinkedServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (unint64_t)[v5 length] < 2 || (objc_msgSend(v5, "length"))
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Linked services has invalid value field." reason:0 suggestion:0 underlyingError:0];
      uint64_t v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    if ((unint64_t)[v5 length] >= 2)
    {
      do
      {
        id v7 = v5;
        unsigned __int16 v11 = 0;
        [v5 getBytes:&v11 length:2];
        uint64_t v8 = [NSNumber numberWithUnsignedShort:v11];
        [v6 addObject:v8];

        objc_msgSend(v7, "subdataWithRange:", 2, objc_msgSend(v7, "length") - 2);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      while ((unint64_t)[v5 length] > 1);
    }
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t _parseBTLEPresentationFormat(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  if ((unint64_t)[v5 length] > 6)
  {
    if (!a2) {
      goto LABEL_11;
    }
    [v5 getBytes:&v11 length:7];
    *(unsigned char *)a2 = v11;
    int v7 = v12;
    *(unsigned char *)(a2 + 1) = v12;
    *(_WORD *)(a2 + 2) = v13;
    int v8 = v14;
    *(unsigned char *)(a2 + 4) = v14;
    int v9 = v15;
    *(_WORD *)(a2 + 6) = v15;
    if (!v7 && v8 == 1 && !v9)
    {
LABEL_11:
      uint64_t v6 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Invalid characteristic format descriptor value." reason:0 suggestion:0 underlyingError:0];
    }
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Invalid characteristic format descriptor value length." reason:0 suggestion:0 underlyingError:0];
  uint64_t v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

uint64_t _parseHAPCharacteristicFormat(unsigned __int8 a1, void *a2, void *a3)
{
  if (a1 - 1) < 0x1Bu && ((0x50AAAA9u >> (a1 - 1)))
  {
    if (a2) {
      *a2 = qword_1D4912AD0[(a1 - 1)];
    }
    return 1;
  }
  else
  {
    if (a3)
    {
      uint64_t v4 = [NSString stringWithFormat:@"Invalid characteristic format type, %u", a1];
      *a3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v4 reason:0 suggestion:0 underlyingError:0];
    }
    return 0;
  }
}

uint64_t _parseHAPCharacteristicUnit(int a1, uint64_t *a2, void *a3)
{
  if (HIWORD(a1) > 0x2730u)
  {
    switch(HIWORD(a1))
    {
      case 0x2731u:
        uint64_t v4 = 5;
        if (!a2) {
          return 1;
        }
        break;
      case 0x2763u:
        uint64_t v4 = 2;
        if (!a2) {
          return 1;
        }
        break;
      case 0x27ADu:
        uint64_t v4 = 4;
        if (!a2) {
          return 1;
        }
        break;
      default:
        goto LABEL_21;
    }
LABEL_19:
    *a2 = v4;
    return 1;
  }
  switch(HIWORD(a1))
  {
    case 0x2700u:
      uint64_t v4 = 0;
      if (!a2) {
        return 1;
      }
      goto LABEL_19;
    case 0x2703u:
      uint64_t v4 = 1;
      if (!a2) {
        return 1;
      }
      goto LABEL_19;
    case 0x272Fu:
      uint64_t v4 = 3;
      if (!a2) {
        return 1;
      }
      goto LABEL_19;
  }
LABEL_21:
  if (a3)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid characteristic unit type, %04x", HIWORD(a1)];
    *a3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v6 reason:0 suggestion:0 underlyingError:0];
  }
  return 0;
}

BOOL _parseCharacteristicValidRange(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  if (![v7 length] || (objc_msgSend(v7, "length") & 1) != 0)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"The characteristic valid range value length must be a multiple of 2." reason:0 suggestion:0 underlyingError:0];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)(a2 - 12) < 4 || a2 == 9)
  {
    if (a4)
    {
      int v9 = NSString;
      unint64_t v10 = HAPCharacteristicFormatToString(a2);
      char v11 = [v9 stringWithFormat:@"Characteristics with format type '%@' do not support valid ranges", v10];

      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v11 reason:0 suggestion:0 underlyingError:0];
    }
    goto LABEL_8;
  }
  unint64_t v14 = (unint64_t)[v7 length] >> 1;
  unint64_t v15 = (unint64_t)[v7 length] >> 1;
  uint64_t v16 = objc_msgSend(v7, "subdataWithRange:", 0, v14);
  uint64_t v17 = objc_msgSend(v7, "subdataWithRange:", v14, v15);
  unint64_t v36 = a2 - 11;
  if ((unint64_t)(a2 - 11) >= 3) {
    uint64_t v18 = a2;
  }
  else {
    uint64_t v18 = 2;
  }
  uint64_t v19 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v38 = 0;
  uint64_t v20 = [v19 reverseTransformedValue:v16 format:v18 error:&v38];
  id v21 = v38;

  if (v20)
  {
    __int16 v35 = v16;
    uint64_t v22 = +[HAPDataValueTransformer defaultDataValueTransformer];
    id v37 = v21;
    int v34 = v17;
    unsigned int v23 = [v22 reverseTransformedValue:v17 format:v18 error:&v37];
    id v24 = v37;

    BOOL v12 = v23 != 0;
    if (v23)
    {
      if (v36 > 2)
      {
        id v25 = v20;
        [v8 setMinimumValue:v20];
        [v8 setMaximumValue:v23];
      }
      else
      {
        id v25 = v20;
        if ([v20 longLongValue] >= 1) {
          [v8 setMinLength:v20];
        }
        [v8 setMaxLength:v23];
      }
    }
    else
    {
      id v31 = (void *)MEMORY[0x1D944E080]();
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        long long v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v40 = v33;
        __int16 v41 = 2112;
        id v42 = v24;
        _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform upper value with error: %@", buf, 0x16u);
      }
      uint64_t v17 = v34;
      id v25 = v20;
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to parse upper value" reason:0 suggestion:0 underlyingError:v24];
      }
    }

    uint64_t v16 = v35;
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D944E080]();
    uint64_t v27 = HMFGetOSLogHandle();
    id v28 = v21;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = uint64_t v29 = v16;
      *(_DWORD *)buf = 138543618;
      id v40 = v30;
      __int16 v41 = 2112;
      id v42 = v28;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform lower value with error: %@", buf, 0x16u);

      uint64_t v16 = v29;
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to parse lower value" reason:0 suggestion:0 underlyingError:v28];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
    id v24 = v28;
    id v25 = 0;
  }

LABEL_9:
  return v12;
}

BOOL _parseCharacteristicStepValue(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  if (![v7 length])
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"The characteristic step value length must be greater than 0." reason:0 suggestion:0 underlyingError:0];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)(a2 - 11) < 5 || a2 == 9)
  {
    if (a4)
    {
      int v9 = NSString;
      unint64_t v10 = HAPCharacteristicFormatToString(a2);
      char v11 = [v9 stringWithFormat:@"Characteristics with format type '%@' do not support step value", v10];

      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v11 reason:0 suggestion:0 underlyingError:0];
    }
    goto LABEL_7;
  }
  unint64_t v14 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v20 = 0;
  unint64_t v15 = [v14 reverseTransformedValue:v7 format:a2 error:&v20];
  id v16 = v20;

  BOOL v12 = v15 != 0;
  if (v15)
  {
    [v8 setStepValue:v15];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to transform step value with error: %@", buf, 0x16u);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to parse step value" reason:0 suggestion:0 underlyingError:v16];
    }
  }

LABEL_8:
  return v12;
}

BOOL _parseCharacteristicValidValues(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  if (![v7 length])
  {
    if (a4)
    {
      __int16 v13 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v14 = @"The characteristic valid values length must be greater than 0.";
      unint64_t v15 = 0;
      goto LABEL_11;
    }
LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)(a2 - 16) >= 0xFFFFFFFFFFFFFFF5)
  {
    if (a4)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = HAPCharacteristicFormatToString(a2);
      uint64_t v19 = [v17 stringWithFormat:@"Characteristics with format type '%@' do not support valid values", v18];

      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v19 reason:0 suggestion:0 underlyingError:0];
    }
    goto LABEL_14;
  }
  if ((unint64_t)(a2 - 1) > 3 || (uint64_t v9 = qword_1D4912BA8[a2 - 1], ([v7 length] & v9) != 0))
  {
    unint64_t v10 = (void *)MEMORY[0x1D944E080]();
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values, total size is not a multiple of the format size", buf, 0xCu);
    }
    if (a4)
    {
      __int16 v13 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v14 = @"Failed to extract valid values";
      unint64_t v15 = @"Total size is not a multiple of the format's size";
LABEL_11:
      [v13 hapErrorWithCode:12 description:v14 reason:v15 suggestion:0 underlyingError:0];
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v21 = _getValuesFromData(v7, a2);
  uint64_t v22 = [v21 count];
  BOOL v16 = v22 != 0;
  if (v22)
  {
    __int16 v23 = (void *)MEMORY[0x1D944E080]([v21 sortUsingComparator:&__block_literal_global_7765]);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      __int16 v31 = 2112;
      id v32 = v21;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEBUG, "%{public}@[HAPBTLE] Setting valid values to : %@", buf, 0x16u);
    }
    [v8 setValidValues:v21];
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D944E080]();
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v28;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values", buf, 0xCu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to extract valid values" reason:0 suggestion:0 underlyingError:0];
    }
  }

LABEL_15:
  return v16;
}

uint64_t _parseCharacteristicValidValuesRange(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  if ([v7 length] && (objc_msgSend(v7, "length") & 1) == 0)
  {
    if ((unint64_t)(a2 - 16) < 0xFFFFFFFFFFFFFFF5)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
      unint64_t v10 = [v8 validValues];
      char v11 = [v9 arrayWithArray:v10];

      if ((unint64_t)(a2 - 1) > 3 || (uint64_t v12 = qword_1D4912BA8[a2 - 1], ([v7 length] & v12) != 0))
      {
        __int16 v13 = (void *)MEMORY[0x1D944E080]();
        unint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v43 = v15;
          _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid value range, total size is not a multiple of the format's size", buf, 0xCu);
        }
        if (a4)
        {
          [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to extract valid value range" reason:@"Total size is not a multiple of the format's size" suggestion:0 underlyingError:0];
          uint64_t v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v16 = 0;
        }
        goto LABEL_38;
      }
      id v20 = _getValuesFromData(v7, a2);
      if ([v20 count])
      {
        uint64_t v33 = (void *)MEMORY[0x1D944E080]();
        int v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v43 = v35;
          _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid value range, valid value ranges are not pairs", buf, 0xCu);
        }
        if (a4)
        {
          [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to extract valid value range" reason:@"Valid value ranges are not pairs" suggestion:0 underlyingError:0];
          uint64_t v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
      }
      else
      {
        id v40 = a4;
        __int16 v41 = v8;
        if ([v20 count])
        {
          unint64_t v21 = 0;
          do
          {
            uint64_t v22 = [v20 objectAtIndex:v21];
            __int16 v23 = v20;
            id v24 = [v20 objectAtIndex:v21 | 1];
            uint64_t v25 = [v22 integerValue];
            if (v25 <= [v24 integerValue])
            {
              do
              {
                id v26 = [NSNumber numberWithInteger:v25];
                char v27 = [v11 containsObject:v26];

                if ((v27 & 1) == 0)
                {
                  id v28 = [NSNumber numberWithInteger:v25];
                  [v11 addObject:v28];
                }
              }
              while (v25++ < [v24 integerValue]);
            }

            v21 += 2;
            id v20 = v23;
          }
          while (v21 < [v23 count]);
        }
        if ([v11 count])
        {
          v30 = (void *)MEMORY[0x1D944E080]([v11 sortUsingComparator:&__block_literal_global_1512]);
          __int16 v31 = HMFGetOSLogHandle();
          id v8 = v41;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            id v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v32;
            __int16 v44 = 2112;
            id v45 = v11;
            _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEBUG, "%{public}@[HAPBTLE] Setting valid values to : %@", buf, 0x16u);
          }
          [v41 setValidValues:v11];
          uint64_t v16 = 1;
          goto LABEL_37;
        }
        unint64_t v36 = (void *)MEMORY[0x1D944E080]();
        id v37 = HMFGetOSLogHandle();
        id v8 = v41;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v43 = v38;
          _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to extract valid values", buf, 0xCu);
        }
        if (v40)
        {
          [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Failed to extract valid values" reason:0 suggestion:0 underlyingError:0];
          uint64_t v16 = 0;
          *id v40 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
      }
      uint64_t v16 = 0;
      goto LABEL_37;
    }
    if (a4)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = HAPCharacteristicFormatToString(a2);
      uint64_t v19 = [v17 stringWithFormat:@"Characteristics with format type '%@' do not support valid values", v18];

      *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:v19 reason:0 suggestion:0 underlyingError:0];
    }
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    uint64_t v16 = 0;
    goto LABEL_39;
  }
  [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"The characteristic valid values range length must be even" reason:0 suggestion:0 underlyingError:0];
  uint64_t v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v16;
}

id _getValuesFromData(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "length"));
  if ((unint64_t)(a2 - 1) > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1D4912BC8[a2 - 1];
  }
  if ([v3 length])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = objc_msgSend(v3, "subdataWithRange:", v6, v5);
      id v8 = +[HAPDataValueTransformer defaultDataValueTransformer];
      uint64_t v12 = 0;
      uint64_t v9 = [v8 reverseTransformedValue:v7 format:a2 error:&v12];
      uint64_t v10 = v12;

      if (!v10 && ([v4 containsObject:v9] & 1) == 0) {
        [v4 addObject:v9];
      }

      v6 += v5;
    }
    while (v6 < [v3 length]);
  }

  return v4;
}

uint64_t ___parseCharacteristicValidValuesRange_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t ___parseCharacteristicValidValues_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id HAPTLVWriteSInt64(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a1 == (char)a1)
  {
    LOBYTE(v4[0]) = a1;
    uint64_t v1 = 1;
  }
  else
  {
    v4[0] = a1;
    uint64_t v1 = 8;
  }
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:v1];

  return v2;
}

unint64_t HAPTLVParseSInt64(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  unint64_t result = 0;
  int v5 = -6743;
  switch(a2)
  {
    case 1:
      int v5 = 0;
      unint64_t result = (char)*a1;
      if (a3) {
        goto LABEL_8;
      }
      return result;
    case 2:
      int v5 = 0;
      unint64_t result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
      if (a3) {
        goto LABEL_8;
      }
      return result;
    case 4:
      int v5 = 0;
      unint64_t result = *(int *)a1;
      goto LABEL_7;
    case 8:
      int v5 = 0;
      unint64_t result = *(void *)a1;
      if (!a3) {
        return result;
      }
      goto LABEL_8;
    default:
LABEL_7:
      if (a3) {
LABEL_8:
      }
        *a3 = v5;
      return result;
  }
}

id HAPTLVWriteUInt64(unint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1 > 0xFF)
  {
    if (a1 >> 16)
    {
      int v4 = a1;
      if (HIDWORD(a1))
      {
        char v5 = BYTE4(a1);
        char v6 = BYTE5(a1);
        char v7 = BYTE6(a1);
        char v8 = HIBYTE(a1);
        uint64_t v1 = 8;
      }
      else
      {
        uint64_t v1 = 4;
      }
    }
    else
    {
      LOWORD(v4) = a1;
      uint64_t v1 = 2;
    }
  }
  else
  {
    LOBYTE(v4) = a1;
    uint64_t v1 = 1;
  }
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:v1];

  return v2;
}

uint64_t HAPTLVParseUInt64(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  uint64_t result = 0;
  int v5 = -6743;
  switch(a2)
  {
    case 1:
      int v5 = 0;
      uint64_t result = *a1;
      if (a3) {
        goto LABEL_8;
      }
      return result;
    case 2:
      int v5 = 0;
      uint64_t result = *(unsigned __int16 *)a1;
      if (a3) {
        goto LABEL_8;
      }
      return result;
    case 4:
      int v5 = 0;
      uint64_t result = *(unsigned int *)a1;
      goto LABEL_7;
    case 8:
      int v5 = 0;
      uint64_t result = *(void *)a1;
      if (!a3) {
        return result;
      }
      goto LABEL_8;
    default:
LABEL_7:
      if (a3) {
LABEL_8:
      }
        *a3 = v5;
      return result;
  }
}

id HAPTLVCreateParseArrayToString(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [MEMORY[0x1E4F28E78] string];
  char v6 = [NSString stringWithFormat:@"\n%@[", v4];
  [v5 appendString:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = NSString;
        __int16 v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) descriptionWithIndent:v4];
        unint64_t v14 = [v12 stringWithFormat:@" %@", v13];
        [v5 appendString:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  unint64_t v15 = [NSString stringWithFormat:@"\n%@]", v4];
  [v5 appendString:v15];

  uint64_t v16 = (void *)[v5 copy];

  return v16;
}

id HAPDateWithTimeIntervalSince1970(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v2 = [a1 value];
    id v3 = objc_msgSend(v1, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v2, "longLongValue"));
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_1D4830DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HMErrorFromHAPIPStatusErrorCode(void *a1)
{
  uint64_t v3 = 17;
  switch((unint64_t)a1)
  {
    case 0xFFFFFFFFFFFEECF3:
      uint64_t v3 = 2405;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF4:
      uint64_t v3 = 48;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF5:
      uint64_t v3 = 87;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF6:
      uint64_t v3 = 3;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF7:
      uint64_t v3 = 2;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF8:
      uint64_t v3 = 8;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECF9:
      uint64_t v3 = 16;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFALL:
      uint64_t v3 = 7;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFBLL:
      uint64_t v3 = 6;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFCLL:
      uint64_t v3 = 5;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFDLL:
      uint64_t v3 = 14;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFELL:
      uint64_t v3 = 88;
      goto LABEL_16;
    case 0xFFFFFFFFFFFEECFFLL:
      goto LABEL_16;
    default:
      if (!a1) {
        goto LABEL_17;
      }
      uint64_t v3 = 52;
LABEL_16:
      a1 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithHMErrorCode:", v3, v1);
LABEL_17:
      return a1;
  }
}

id HMErrorFromHAPErrorCode(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Failed with HAP Error code %ld", a1, *MEMORY[0x1E4F28568]);
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E4F28A50];
  uint64_t v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:a1];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:a1 userInfo:v4];

  return v5;
}

void sub_1D4833204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4833418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8984(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8985(uint64_t a1)
{
}

void sub_1D4833618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48338F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4833B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4833C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4833E78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4833FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48342A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4834E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4835050(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48356A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48358F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4835B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4835D90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4836070(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4836364(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48366C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4836934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D4836CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4836E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4836FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48371C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4837DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9299(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__9503(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9504(uint64_t a1)
{
}

void sub_1D4838284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4838394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPAccessCodeCharacterSetAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0)
      {
        v4 &= ~1uLL;
        [v2 addObject:@"HAPAccessCodeCharacterSetArabicNumerals"];
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      int v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
      [v2 addObject:v5];
    }
  }
  if ([v2 count])
  {
    char v6 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    char v6 = @"None";
  }

  return v6;
}

__CFString *HAPAccessCodeFlagsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0)
      {
        v4 &= ~1uLL;
        [v2 addObject:@"HAPAccessCodeFlagHasRestrictions"];
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      int v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
      [v2 addObject:v5];
    }
  }
  if ([v2 count])
  {
    char v6 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    char v6 = @"None";
  }

  return v6;
}

void sub_1D483B380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D483DD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D484253C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10534(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10535(uint64_t a1)
{
}

void sub_1D4842758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4842C2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4842F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4843228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4843480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4843704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48439B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4843C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4843E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4844094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48445FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4844C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D484561C(_Unwind_Exception *a1)
{
}

void sub_1D4845B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10843(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10844(uint64_t a1)
{
}

void sub_1D48464A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4846B8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D48470C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4847B90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D4847C6C(_Unwind_Exception *a1)
{
}

void sub_1D484824C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D4848328(_Unwind_Exception *a1)
{
}

void sub_1D48490D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D48492F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48495E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4849960(_Unwind_Exception *a1)
{
}

void sub_1D4849C08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D4849FF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484A180(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484A3B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484A660(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484A908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484ABB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D484B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D484BCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  os_unfair_lock_unlock(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1D484BDD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D484C098(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D484C750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

HAP2AccessoryServerDiscoveryAccessoryInfo *accessoryInfoForBonjourDevice(void *a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [(__CFString *)v5 name];
  if (v8)
  {
    uint64_t v9 = [(__CFString *)v5 txtDictionary];
    if (!v9)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      long long v19 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v5;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "Received bonjour device that has no TXT record: %@", buf, 0xCu);
      }
      uint64_t v18 = 0;
      goto LABEL_65;
    }
    uint64_t v10 = [(__CFString *)v5 identifierStr];
    if (!v10)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      long long v20 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v5;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "Received bonjour device that has a no device id: %@", buf, 0xCu);
      }
      uint64_t v18 = 0;
      goto LABEL_64;
    }
    uint64_t v11 = [[HAPDeviceID alloc] initWithDeviceIDString:v10];
    if (!v11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      long long v21 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v66 = v10;
        __int16 v67 = 2112;
        v68 = v5;
        _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "Received bonjour device that has an invalid device id '%@': %@", buf, 0x16u);
      }
      uint64_t v18 = 0;
      goto LABEL_63;
    }
    v63[0] = @"bonjourServiceName";
    v63[1] = @"bonjourServiceType";
    v64[0] = v8;
    v64[1] = v6;
    v63[2] = @"bonjourServiceDomain";
    v63[3] = @"bonjourTXTRecord";
    v64[2] = v7;
    v64[3] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
    v61 = v11;
    id v62 = v12;
    id v60 = v8;
    uint64_t v13 = v9;
    uint64_t v14 = [(__CFString *)v13 objectForKeyedSubscript:@"sf"];
    uint64_t v15 = v14;
    if (v14) {
      unsigned __int8 v16 = [v14 intValue];
    }
    else {
      unsigned __int8 v16 = 0;
    }

    uint64_t v22 = [(__CFString *)v13 objectForKeyedSubscript:@"ci"];
    uint64_t v23 = v22;
    if (v22) {
      uint64_t v58 = [v22 longLongValue];
    }
    else {
      uint64_t v58 = 1;
    }

    id v24 = @"c#";
    uint64_t v25 = [(__CFString *)v13 objectForKeyedSubscript:@"c#"];
    v59 = v11;
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = [v25 longLongValue];
      if ((unint64_t)(v27 - 0x100000000) <= 0xFFFFFFFF00000000)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v28 = hap2Log_browser;
        uint64_t v29 = @"c#";
        if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 138412546;
        v66 = @"c#";
        __int16 v67 = 2112;
        v68 = v13;
        goto LABEL_37;
      }
      uint64_t v57 = v27;

      id v32 = [(__CFString *)v13 objectForKeyedSubscript:@"s#"];
      uint64_t v33 = v32;
      if (v32) {
        id v32 = (char *)[v32 longLongValue];
      }
      if ((unint64_t)(v32 - 0x100000000) < 0xFFFFFFFF00000001) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = (uint64_t)v32;
      }
      uint64_t v56 = v34;

      __int16 v35 = @"pv";
      uint64_t v36 = [(__CFString *)v13 objectForKeyedSubscript:@"pv"];
      if (v36)
      {
        id v26 = (void *)v36;
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v36];
        if (v37)
        {
          unsigned __int8 v54 = v16;
          v55 = (__CFString *)v37;

          uint64_t v38 = [(__CFString *)v13 objectForKeyedSubscript:@"md"];
          if (v38)
          {
            id v26 = (void *)v38;
            v39 = [(__CFString *)v13 objectForKeyedSubscript:@"ff"];
            id v40 = v39;
            if (v39) {
              uint64_t v53 = [v39 longLongValue];
            }
            else {
              uint64_t v53 = 0;
            }

            id v45 = @"sh";
            uint64_t v46 = [(__CFString *)v13 objectForKeyedSubscript:@"sh"];
            if (v46)
            {
              v47 = v46;
              uint64_t v48 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v46 options:0];
              uint64_t v46 = v47;
              if (!v48)
              {
                if (hap2LogInitialize_onceToken != -1) {
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                }
                log = hap2Log_browser;
                if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v66 = @"sh";
                  __int16 v67 = 2112;
                  v68 = v13;
                  _os_log_impl(&dword_1D4758000, log, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
                }
                uint64_t v48 = 0;
                uint64_t v46 = v47;
              }
            }
            else
            {
              uint64_t v48 = 0;
            }
            uint64_t v49 = v48;
            os_log_t loga = (os_log_t)v48;

            uint64_t v50 = v49;
            uint64_t v29 = v55;
            __int16 v41 = [[HAP2AccessoryServerDiscoveryHAPAccessoryInfo alloc] initWithDeviceID:v61 rawDiscoveryInfo:v62 name:v60 model:v26 status:v54 category:v58 configurationNumber:v57 stateNumber:v56 protocolVersion:v55 featureFlags:v53 setupHash:v50];
          }
          else
          {
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            __int16 v44 = hap2Log_browser;
            if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v66 = @"md";
              _os_log_error_impl(&dword_1D4758000, v44, OS_LOG_TYPE_ERROR, "Received txtRecord that doesn't include key '%@'", buf, 0xCu);
            }
            id v26 = 0;
            __int16 v41 = 0;
            uint64_t v29 = v55;
          }
          goto LABEL_59;
        }
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v28 = hap2Log_browser;
        uint64_t v29 = @"pv";
        if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
        {
LABEL_58:
          __int16 v41 = 0;
LABEL_59:

          if (v41) {
            id v42 = v41;
          }
          else {
            id v42 = [[HAP2AccessoryServerDiscoveryAccessoryInfo alloc] initWithDeviceID:v61 rawDiscoveryInfo:v62];
          }
          uint64_t v18 = v42;
          uint64_t v11 = v59;

LABEL_63:
LABEL_64:

LABEL_65:
          goto LABEL_66;
        }
        *(_DWORD *)buf = 138412546;
        v66 = @"pv";
        __int16 v67 = 2112;
        v68 = v13;
LABEL_37:
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
        goto LABEL_58;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v30 = hap2Log_browser;
      uint64_t v29 = @"pv";
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
LABEL_57:
        id v26 = 0;
        goto LABEL_58;
      }
      *(_DWORD *)buf = 138412546;
      v66 = @"pv";
      __int16 v67 = 2112;
      v68 = v13;
      __int16 v31 = "Received txtRecord that has no value for key '%@': %@";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v30 = hap2Log_browser;
      uint64_t v29 = @"c#";
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 138412546;
      v66 = @"c#";
      __int16 v67 = 2112;
      v68 = v13;
      __int16 v31 = "Received txtRecord that has a no value for key '%@': %@";
    }
    _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_INFO, v31, buf, 0x16u);
    goto LABEL_57;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v17 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v5;
    _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "Received bonjour device that has no service name: %@", buf, 0xCu);
  }
  uint64_t v18 = 0;
LABEL_66:

  return v18;
}

void sub_1D485926C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1D485991C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D485A3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D485A5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11656(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11657(uint64_t a1)
{
}

__CFString *HAPOperatingStateAbnormalReasonsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_11;
    }
    switch(v3)
    {
      case 1:
        int v5 = @"HAPOperatingStateAbnormalReasonOther";
        break;
      case 4:
        int v5 = @"HAPOperatingStateAbnormalReasonHighTemperature";
        break;
      case 2:
        int v5 = @"HAPOperatingStateAbnormalReasonLowTemperature";
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_14:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

void sub_1D485AD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11855(uint64_t a1)
{
}

HAP2AccessoryServerDiscoveryAccessoryInfo *accessoryInfoForBrowseResult(void *a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  id v2 = nw_browse_result_copy_endpoint(v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v24 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)applier = 138412290;
    *(void *)&applier[4] = v1;
    uint64_t v25 = "Received browse result that has no endpoint: %@";
LABEL_25:
    id v28 = v24;
    uint32_t v29 = 12;
    goto LABEL_26;
  }
  nw_endpoint_type_t type = nw_endpoint_get_type(v2);
  if (type != nw_endpoint_type_bonjour_service)
  {
    nw_endpoint_type_t v26 = type;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v27 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)applier = 67109378;
    *(_DWORD *)&applier[4] = v26;
    *(_WORD *)&applier[8] = 2112;
    *(void *)&applier[10] = v1;
    uint64_t v25 = "Received browse result that has unhandled endpoint type %u: %@";
    id v28 = v27;
    uint32_t v29 = 18;
    goto LABEL_26;
  }
  bonjour_service_name = nw_endpoint_get_bonjour_service_name(v3);
  if (!bonjour_service_name)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v24 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)applier = 138412290;
    *(void *)&applier[4] = v1;
    uint64_t v25 = "Received browse result that has no service name: %@";
    goto LABEL_25;
  }
  id v6 = bonjour_service_name;
  uint64_t v7 = [[NSString alloc] initWithUTF8String:bonjour_service_name];
  if (!v7)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v30 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)applier = 136315394;
    *(void *)&applier[4] = v6;
    *(_WORD *)&applier[12] = 2112;
    *(void *)&applier[14] = v1;
    uint64_t v25 = "Received browse result that has bad service name '%s': %@";
    id v28 = v30;
    uint32_t v29 = 22;
LABEL_26:
    _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, v25, applier, v29);
LABEL_30:
    __int16 v31 = 0;
    goto LABEL_31;
  }
  uint64_t v8 = (void *)v7;
  bonjour_service_nw_endpoint_type_t type = nw_endpoint_get_bonjour_service_type(v3);
  if (!bonjour_service_type)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v33 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_DWORD *)applier = 138412290;
    *(void *)&applier[4] = v1;
    uint64_t v34 = "Received browse result that has no service type: %@";
    __int16 v35 = v33;
    uint32_t v36 = 12;
    goto LABEL_67;
  }
  uint64_t v10 = bonjour_service_type;
  uint64_t v11 = [[NSString alloc] initWithUTF8String:bonjour_service_type];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    bonjour_service_domain = nw_endpoint_get_bonjour_service_domain(v3);
    if (bonjour_service_domain)
    {
      uint64_t v14 = bonjour_service_domain;
      uint64_t v15 = [[NSString alloc] initWithUTF8String:bonjour_service_domain];
      if (v15)
      {
        unsigned __int8 v16 = (void *)v15;
        nw_txt_record_t v17 = nw_browse_result_copy_txt_record_object(v1);
        if (v17)
        {
          uint64_t v18 = v17;
          v61 = v16;
          if (nw_txt_record_is_dictionary(v18))
          {
            long long v19 = v18;
            long long v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:nw_txt_record_get_key_count(v19)];
            *(void *)applier = MEMORY[0x1E4F143A8];
            *(void *)&applier[8] = 3221225472;
            *(void *)&applier[16] = __txtRecordDictionaryForNetworkTxtRecordDictionary_block_invoke;
            v76 = &unk_1E69F2200;
            v77 = v19;
            id v21 = v20;
            id v78 = v21;
            uint64_t v22 = v19;
            if (nw_txt_record_apply(v22, applier)) {
              uint64_t v23 = (void *)[v21 copy];
            }
            else {
              uint64_t v23 = 0;
            }
          }
          else
          {
            __int16 v44 = v18;
            uint64_t v67 = 0;
            v68 = &v67;
            uint64_t v69 = 0x3032000000;
            v70 = __Block_byref_object_copy__11854;
            v71 = __Block_byref_object_dispose__11855;
            id v72 = 0;
            access_bytes[0] = MEMORY[0x1E4F143A8];
            access_bytes[1] = 3221225472;
            access_bytes[2] = __txtRecordDictionaryForNetworkTxtRecordData_block_invoke;
            access_bytes[3] = &unk_1E69F2228;
            access_bytes[4] = &v67;
            nw_txt_record_access_bytes(v44, access_bytes);
            id v45 = (void *)v68[5];
            if (v45)
            {
              uint64_t v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
              uint64_t v62 = 0;
              v63 = &v62;
              uint64_t v64 = 0x2020000000;
              char v65 = 1;
              v47 = (void *)v68[5];
              *(void *)applier = MEMORY[0x1E4F143A8];
              *(void *)&applier[8] = 3221225472;
              *(void *)&applier[16] = __txtRecordDictionaryForNetworkTxtRecordData_block_invoke_198;
              v76 = &unk_1E69F2250;
              v77 = v44;
              v79 = &v62;
              id v48 = v46;
              id v78 = v48;
              [v47 enumerateKeysAndObjectsUsingBlock:applier];
              if (*((unsigned char *)v63 + 24)) {
                uint64_t v23 = (void *)[v48 copy];
              }
              else {
                uint64_t v23 = 0;
              }

              _Block_object_dispose(&v62, 8);
            }
            else
            {
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              uint64_t v49 = hap2Log_browser;
              if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)applier = 138412290;
                *(void *)&applier[4] = v44;
                _os_log_error_impl(&dword_1D4758000, v49, OS_LOG_TYPE_ERROR, "Received txtRecord with data that couldn't be parsed: %@", applier, 0xCu);
              }
              uint64_t v23 = 0;
            }
            _Block_object_dispose(&v67, 8);
          }
          if (v23)
          {
            int v50 = [v12 isEqualToString:@"_airplay._tcp"];
            char v51 = v50;
            v52 = @"deviceid";
            if (!v50) {
              v52 = @"id";
            }
            uint64_t v53 = v52;
            unsigned __int8 v54 = [v23 objectForKeyedSubscript:v53];
            if (v54)
            {
              v55 = [[HAPDeviceID alloc] initWithDeviceIDString:v54];
              if (v55)
              {
                v73[0] = @"bonjourServiceName";
                v73[1] = @"bonjourServiceType";
                v74[0] = v8;
                v74[1] = v12;
                v73[2] = @"bonjourServiceDomain";
                v73[3] = @"bonjourTXTRecord";
                v74[2] = v61;
                v74[3] = v23;
                uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:4];
                if ((v51 & 1) != 0
                  || (hapAccessoryInfoWithDeviceID(v55, v56, v8, v23),
                      (__int16 v31 = (HAP2AccessoryServerDiscoveryAccessoryInfo *)objc_claimAutoreleasedReturnValue()) == 0))
                {
                  __int16 v31 = [[HAP2AccessoryServerDiscoveryAccessoryInfo alloc] initWithDeviceID:v55 rawDiscoveryInfo:v56];
                }
              }
              else
              {
                id v60 = v53;
                if (hap2LogInitialize_onceToken != -1) {
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                }
                v59 = hap2Log_browser;
                if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)applier = 138412546;
                  *(void *)&applier[4] = @"id";
                  *(_WORD *)&applier[12] = 2112;
                  *(void *)&applier[14] = v23;
                  _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_INFO, "Received txtRecord that has an invalid '%@' value: %@", applier, 0x16u);
                }
                __int16 v31 = 0;
                uint64_t v53 = v60;
              }
            }
            else
            {
              uint64_t v57 = v53;
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              uint64_t v58 = hap2Log_browser;
              if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)applier = 138412546;
                *(void *)&applier[4] = @"id";
                *(_WORD *)&applier[12] = 2112;
                *(void *)&applier[14] = v23;
                _os_log_impl(&dword_1D4758000, v58, OS_LOG_TYPE_INFO, "Received txtRecord that has a no '%@': %@", applier, 0x16u);
              }
              __int16 v31 = 0;
              uint64_t v53 = v57;
            }
          }
          else
          {
            __int16 v31 = 0;
          }
          unsigned __int8 v16 = v61;
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v43 = hap2Log_browser;
          if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)applier = 138412290;
            *(void *)&applier[4] = v1;
            _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_INFO, "Received browse result that has no TXT record: %@", applier, 0xCu);
          }
          __int16 v31 = 0;
        }

        goto LABEL_95;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v42 = hap2Log_browser;
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
LABEL_49:
        __int16 v31 = 0;
LABEL_95:

        goto LABEL_96;
      }
      *(_DWORD *)applier = 136315394;
      *(void *)&applier[4] = v14;
      *(_WORD *)&applier[12] = 2112;
      *(void *)&applier[14] = v1;
      v39 = "Received browse result that has bad service name '%s': %@";
      id v40 = v42;
      uint32_t v41 = 22;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v38 = hap2Log_browser;
      if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      *(_DWORD *)applier = 138412290;
      *(void *)&applier[4] = v1;
      v39 = "Received browse result that has no service domain: %@";
      id v40 = v38;
      uint32_t v41 = 12;
    }
    _os_log_error_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, v39, applier, v41);
    goto LABEL_49;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v37 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)applier = 136315394;
    *(void *)&applier[4] = v10;
    *(_WORD *)&applier[12] = 2112;
    *(void *)&applier[14] = v1;
    uint64_t v34 = "Received browse result that has bad service name '%s': %@";
    __int16 v35 = v37;
    uint32_t v36 = 22;
LABEL_67:
    _os_log_error_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, v34, applier, v36);
  }
LABEL_41:
  __int16 v31 = 0;
LABEL_96:

LABEL_31:

  return v31;
}

void sub_1D485BB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __txtRecordDictionaryForNetworkTxtRecordDictionary_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:a2];
  if (!v10)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v13 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    int v21 = 136315394;
    *(void *)uint64_t v22 = a2;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v14;
    uint64_t v15 = "Received txtRecord that has a bad key '%s': %@";
    goto LABEL_10;
  }
  if (a3 == 3)
  {
    [*(id *)(a1 + 40) setObject:&stru_1F2C4E778 forKeyedSubscript:v10];
    goto LABEL_17;
  }
  if (a3 != 4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    nw_txt_record_t v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = 67109634;
      *(_DWORD *)uint64_t v22 = a3;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v10;
      *(_WORD *)&v22[14] = 2112;
      *(void *)&v22[16] = v20;
      _os_log_debug_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "Received txtRecord that has a bad state (%d) for key '%@': %@", (uint8_t *)&v21, 0x1Cu);
    }
    goto LABEL_17;
  }
  uint64_t v11 = [[NSString alloc] initWithBytes:a4 length:a5 encoding:4];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];

LABEL_17:
    uint64_t v16 = 1;
    goto LABEL_18;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v13 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v21 = 138412546;
    *(void *)uint64_t v22 = v10;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v19;
    uint64_t v15 = "Received txtRecord that has a bad value for '%@': %@";
LABEL_10:
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0x16u);
  }
LABEL_11:
  uint64_t v16 = 0;
LABEL_18:

  return v16;
}

uint64_t __txtRecordDictionaryForNetworkTxtRecordData_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a2 length:a3];
  uint64_t v5 = [MEMORY[0x1E4F28E90] dictionaryFromTXTRecordData:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

void __txtRecordDictionaryForNetworkTxtRecordData_block_invoke_198(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = (objc_class *)NSString;
  id v9 = a3;
  uint64_t v10 = (void *)[[v8 alloc] initWithData:v9 encoding:4];

  if (v10)
  {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad key '%@': %@", (uint8_t *)&v13, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

HAP2AccessoryServerDiscoveryHAPAccessoryInfo *hapAccessoryInfoWithDeviceID(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"sf"];
  uint64_t v12 = v11;
  if (v11) {
    unsigned __int8 v13 = [v11 intValue];
  }
  else {
    unsigned __int8 v13 = 0;
  }

  id v14 = [v10 objectForKeyedSubscript:@"ci"];
  __int16 v15 = v14;
  if (v14) {
    uint64_t v16 = [v14 longLongValue];
  }
  else {
    uint64_t v16 = 1;
  }

  uint64_t v17 = @"c#";
  uint64_t v18 = @"c#";
  uint64_t v19 = [v10 objectForKeyedSubscript:@"c#"];
  if (!v19)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v23 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412546;
    id v45 = @"c#";
    __int16 v46 = 2112;
    id v47 = v10;
    uint64_t v24 = "Received txtRecord that has a no value for key '%@': %@";
LABEL_32:
    _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
LABEL_33:
    uint64_t v20 = 0;
    goto LABEL_34;
  }
  uint64_t v20 = v19;
  uint64_t v21 = [v19 longLongValue];
  if ((unint64_t)(v21 - 0x100000000) <= 0xFFFFFFFF00000000)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v22 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412546;
    id v45 = @"c#";
    __int16 v46 = 2112;
    id v47 = v10;
    goto LABEL_13;
  }
  uint64_t v25 = v21;

  nw_endpoint_type_t v26 = [v10 objectForKeyedSubscript:@"s#"];
  uint64_t v27 = v26;
  if (v26) {
    nw_endpoint_type_t v26 = (char *)[v26 longLongValue];
  }
  if ((unint64_t)(v26 - 0x100000000) < 0xFFFFFFFF00000001) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = (uint64_t)v26;
  }

  uint64_t v17 = @"pv";
  uint32_t v29 = @"pv";
  uint64_t v30 = [v10 objectForKeyedSubscript:@"pv"];
  if (!v30)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v23 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412546;
    id v45 = @"pv";
    __int16 v46 = 2112;
    id v47 = v10;
    uint64_t v24 = "Received txtRecord that has no value for key '%@': %@";
    goto LABEL_32;
  }
  uint64_t v20 = (void *)v30;
  uint64_t v31 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v30];
  if (!v31)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v22 = hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412546;
    id v45 = @"pv";
    __int16 v46 = 2112;
    id v47 = v10;
LABEL_13:
    _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
LABEL_34:
    __int16 v35 = 0;
    goto LABEL_35;
  }
  uint64_t v17 = (__CFString *)v31;
  uint64_t v43 = v28;

  uint64_t v32 = [v10 objectForKeyedSubscript:@"md"];
  if (!v32)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v37 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = @"md";
      _os_log_error_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, "Received txtRecord that doesn't include key '%@'", buf, 0xCu);
    }
    goto LABEL_33;
  }
  uint64_t v20 = (void *)v32;
  uint64_t v33 = [v10 objectForKeyedSubscript:@"ff"];
  uint64_t v34 = v33;
  if (v33) {
    uint64_t v42 = [v33 longLongValue];
  }
  else {
    uint64_t v42 = 0;
  }

  uint64_t v38 = @"sh";
  v39 = [v10 objectForKeyedSubscript:@"sh"];
  uint32_t v41 = v39;
  if (v39)
  {
    v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v39 options:0];
    if (!v39)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v40 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v45 = @"sh";
        __int16 v46 = 2112;
        id v47 = v10;
        _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_INFO, "Received txtRecord that has a bad value for key '%@': %@", buf, 0x16u);
      }
      v39 = 0;
    }
  }

  __int16 v35 = [[HAP2AccessoryServerDiscoveryHAPAccessoryInfo alloc] initWithDeviceID:v7 rawDiscoveryInfo:v8 name:v9 model:v20 status:v13 category:v16 configurationNumber:v25 stateNumber:v43 protocolVersion:v17 featureFlags:v42 setupHash:v39];
LABEL_35:

  return v35;
}

void sub_1D485D0FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D485D850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D485DA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HAPDispatchQueueName(void *a1, void *a2)
{
  uint64_t v3 = NSString;
  unint64_t v4 = a2;
  id v5 = a1;
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  if (v4) {
    id v8 = @".";
  }
  else {
    id v8 = &stru_1F2C4E778;
  }
  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = &stru_1F2C4E778;
  }
  uint64_t v10 = [v5 hash];

  uint64_t v11 = [v3 stringWithFormat:@"com.apple.CoreHAP.%@%@%@.%tu", v7, v8, v9, v10];

  id v12 = v11;
  uint64_t v13 = [v12 UTF8String];

  return v13;
}

BOOL HAPAccessoryHasPairings(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t HAPValidateSetupHash(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  if (a1 && a2 && v5)
  {
    id v8 = a1;
    id v9 = [a2 uppercaseString];
    uint64_t v10 = [v6 stringByAppendingString:v9];
    objc_msgSend(v10, "dataUsingEncoding:", 4, 0, 0, 0, 0, 0, 0, 0, 0);
    id v11 = objc_claimAutoreleasedReturnValue();
    if (CC_SHA512((const void *)[v11 bytes], objc_msgSend(v11, "length"), (unsigned __int8 *)&v14))
    {
      id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:4];
    }
    else
    {
      id v12 = 0;
    }

    uint64_t v7 = [v12 isEqual:v8];
  }

  return v7;
}

id HAPGetHAPMetadataVersion()
{
  os_log_t v0 = +[HAPMetadata getSharedInstance];
  uint64_t v1 = [v0 version];

  return v1;
}

uint64_t HAPIsHH2Enabled()
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  return HAPIsHH2Enabled_hh2Enabled;
}

void __HAPIsHH2Enabled_block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Hmdhomemanager.isa)];
  uint64_t v1 = [v0 bundlePath];
  char v2 = [v1 containsString:@"HomeKitDaemonLegacy.framework"];

  if ((v2 & 1) == 0) {
    HAPIsHH2Enabled_hh2Enabled = 1;
  }
  if (HAPIsInternalBuild())
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Homekittesthos.isa)];
    unint64_t v4 = [v3 bundlePath];
    int v5 = [v4 containsString:@"HomeKitTestHostApp.app"];

    if (v5)
    {
      HAPIsHH2Enabled_hh2Enabled = 0;
      uint64_t v6 = (void *)MEMORY[0x1D944E080]();
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = (uint64_t)v8;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Detected unit test app. Switching the flag to HH1", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  id v9 = (void *)MEMORY[0x1D944E080]();
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = (void *)v11;
    uint64_t v13 = @"HH1";
    if (HAPIsHH2Enabled_hh2Enabled) {
      uint64_t v13 = @"HH2";
    }
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@coreHAP Running in %@ mode", (uint8_t *)&v14, 0x16u);
  }
}

uint64_t HAPEqualInstanceIDs(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = HAPInstanceIDFromValue(a1);
  int v5 = HAPInstanceIDFromValue(v3);

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

id HAPInstanceIDFromValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v2 = v1;
  }
  else {
    char v2 = 0;
  }
  id v3 = v2;
  if (objc_msgSend(v3, "hmf_isInteger"))
  {
    id v4 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
    uint64_t v12 = 0;
    int v5 = 0;
    if (![v4 scanUnsignedLongLong:&v12]) {
      goto LABEL_14;
    }
    uint64_t v6 = NSNumber;
    uint64_t v7 = v12;
    goto LABEL_12;
  }
  id v8 = v1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v4 = v9;

  if (v4)
  {
    uint64_t v10 = NSNumber;
    uint64_t v7 = [v4 unsignedLongLongValue];
    uint64_t v6 = v10;
LABEL_12:
    int v5 = [v6 numberWithUnsignedLongLong:v7];
    goto LABEL_14;
  }
  int v5 = 0;
LABEL_14:

  return v5;
}

id HAPInstanceIDFromUniqueIdentifier(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@"+"];
  if ([v1 count] == 2)
  {
    char v2 = [v1 objectAtIndexedSubscript:1];
    id v3 = HAPInstanceIDFromValue(v2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id HAPServerIDFromUniqueIdentifier(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@"+"];
  if ([v1 count] == 2)
  {
    char v2 = [v1 objectAtIndexedSubscript:0];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

id HAPUniqueIdentifier(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a1;
  int v5 = [a2 stringValue];
  uint64_t v6 = [v3 stringWithFormat:@"%@%@%@", v4, @"+", v5];

  return v6;
}

BOOL HAPIsHomePod()
{
  os_log_t v0 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v1 = [v0 productClass] == 6;

  return v1;
}

__CFString *HAPOperatingStateAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPOperatingState %ld", a1);
    BOOL v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v1 = off_1E69F22B0[a1];
  }

  return v1;
}

void sub_1D4861D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HAPStagingNotReadyReasonsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_11;
    }
    switch(v3)
    {
      case 1:
        int v5 = @"HAPStagingNotReadyReasonOther";
        break;
      case 4:
        int v5 = @"HAPStagingNotReadyReasonConnectivity";
        break;
      case 2:
        int v5 = @"HAPStagingNotReadyReasonLowBattery";
        break;
      default:
        goto LABEL_11;
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_11:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_14:
  if ([v2 count])
  {
    uint64_t v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v7 = @"None";
  }

  return v7;
}

__CFString *HAPUpdateNotReadyReasonsAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    uint64_t v3 = 1;
    unint64_t v4 = a1;
    do
    {
      if ((v3 & a1) != 0)
      {
        uint64_t v5 = v3 - 1;
        if (unint64_t)(v3 - 1) <= 7 && ((0x8Bu >> v5))
        {
          v4 &= ~v3;
          [v2 addObject:off_1E69F22F0[v5]];
        }
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
      [v2 addObject:v6];
    }
  }
  if ([v2 count])
  {
    uint64_t v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v7 = @"None";
  }

  return v7;
}

uint64_t __Block_byref_object_copy__12886(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12887(uint64_t a1)
{
}

uint64_t __cleanUpOperationDependencies_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeDependency:a2];
}

void sub_1D4865418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4866D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1D4866F04(_Unwind_Exception *a1)
{
}

void sub_1D4867038(_Unwind_Exception *a1)
{
}

void sub_1D4867178(_Unwind_Exception *a1)
{
}

void sub_1D486729C(_Unwind_Exception *a1)
{
}

void _HandleSocketEvent_f(unsigned int a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [v3 delegate];
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = CUPrintFlags32();
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received socket event with flags %@", (uint8_t *)&v9, 0x16u);
  }
  if (v4) {
    [v4 httpClient:v3 didReceiveSocketEvent:(a1 >> 1) & 2 | (a1 >> 11) & 1];
  }
}

void _Invalidated_f(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v23 = 0;
  memset(v22, 0, sizeof(v22));
  id v3 = a2;
  unint64_t v4 = [v3 delegate];
  uint64_t ErrorString = DebugGetErrorString();
  uint64_t v6 = (void *)MEMORY[0x1D944E080](ErrorString);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [v4 identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 1024;
    int v19 = a1;
    __int16 v20 = 2080;
    uint64_t v21 = v22;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received invalidate callback from CoreUtils HTTPClient %@ due to %d (%s)", buf, 0x26u);
  }
  [v3 setInvalidated:1];
  uint64_t v10 = HMErrorFromOSStatus(a1);
  [v3 setInvalidateReason:v10];

  if ([v3 invalidateRequested])
  {
    [v3 setInvalidateRequested:0];
  }
  else if ([v3 _delegateRespondsToSelector:sel_httpClientDidCloseConnectionDueToServer_])
  {
    __int16 v11 = [v3 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___Invalidated_f_block_invoke;
    block[3] = &unk_1E69F4330;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void _HandleEvent_f(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1D944E080]();
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    nw_endpoint_type_t v26 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[HAP HTTP Client] Received event message", buf, 0xCu);
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  id v7 = a2;
  uint64_t v8 = *(unsigned int *)(a1 + 9648);
  if (v8) {
    goto LABEL_8;
  }
  int v9 = *(_DWORD *)(a1 + 8456);
  if ((v9 - 200) >= 0x64)
  {
    id v10 = 0;
    uint64_t v8 = (v9 + 200000);
  }
  else if (*(void *)(a1 + 8528) && *(void *)(a1 + 8520))
  {
    uint64_t v8 = HTTPGetHeaderField();
    if (v8)
    {
LABEL_8:
      id v10 = 0;
      goto LABEL_9;
    }
    id v10 = 0;
    uint64_t v8 = 4294960579;
  }
  else
  {
    id v10 = 0;
    uint64_t v8 = 4294960558;
  }
LABEL_9:
  uint64_t v11 = HMErrorFromOSStatus(v8);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    id v13 = (void *)MEMORY[0x1D944E080]();
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      nw_endpoint_type_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@[HAP HTTP Client] ### Received event but failed to deliver it due to %@", buf, 0x16u);
    }
  }
  else
  {
    if ([v7 _delegateRespondsToSelector:sel_httpClient_didReceiveEvent_])
    {
      __int16 v16 = [v7 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___HandleEvent_f_block_invoke;
      block[3] = &unk_1E69F46E0;
      id v21 = v7;
      id v10 = 0;
      id v22 = v10;
      dispatch_async(v16, block);
    }
    uint64_t v12 = 0;
  }
  uint64_t v17 = [v7 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v18 = v17;
  }
  else {
    __int16 v18 = 0;
  }
  id v19 = v18;

  if (v19) {
    [v19 incrementHAPIPHTTPEventsCount];
  }
}

void _HandleWillSendMessage_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a1 length:a2];
  uint64_t v11 = 0;
  if (a3 && a4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  }
  if ([v9 _debugDelegateRespondsToSelector:sel_httpClient_willSendHTTPMessageWithHeaders_body_])
  {
    uint64_t v12 = [v9 debugDelegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___HandleWillSendMessage_f_block_invoke;
    block[3] = &unk_1E69F4708;
    id v14 = v9;
    id v15 = v10;
    id v16 = v11;
    dispatch_async(v12, block);
  }
}

void _HandleDidReceiveMessage_f(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a1 length:a2];
  uint64_t v11 = 0;
  if (a3 && a4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  }
  if ([v9 _debugDelegateRespondsToSelector:sel_httpClient_didReceiveHTTPMessageWithHeaders_body_])
  {
    uint64_t v12 = [v9 debugDelegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___HandleDidReceiveMessage_f_block_invoke;
    block[3] = &unk_1E69F4708;
    id v14 = v9;
    id v15 = v10;
    id v16 = v11;
    dispatch_async(v12, block);
  }
}

__CFString *HAPHTTPSerializationTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Invalid";
  }
  else {
    return off_1E69F2448[a1 - 1];
  }
}

__CFString *HAPNotificationContextSourceAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPNotificationContextSource %ld", a1);
    BOOL v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v1 = off_1E69F2468[a1 - 1];
  }

  return v1;
}

id _stringForMessage(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v4 = *(unsigned __int16 *)(a1 + 6);
  if (!*(unsigned char *)a1 && !*(unsigned char *)(a1 + 1) && !*(unsigned char *)(a1 + 4) && !*(void *)(a1 + 48))
  {
    uint64_t v11 = "Ping";
    if (a2) {
      uint64_t v11 = "Pong";
    }
    objc_msgSend(NSString, "stringWithFormat:", @"<%s id=%lu>", v11, v4);
    goto LABEL_14;
  }
  if (*(unsigned char *)(a1 + 4))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", *(void *)(a1 + 40));
    uint64_t v6 = objc_msgSend(v5, "hmf_hexadecimalStringWithOptions:", 2);

    if ((v2 & 1) == 0)
    {
      if (v6)
      {
        id v7 = [NSString stringWithFormat:@"<Request id=%lu, token=%@, size=%lu>", v4, v6, *(void *)(a1 + 24) + *(unsigned __int8 *)(a1 + 3)];
LABEL_12:

        goto LABEL_15;
      }
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v8 = NSString;
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u.%02u", *(unsigned __int8 *)(a1 + 1) >> 5, *(unsigned char *)(a1 + 1) & 0x1F);
    id v7 = [v8 stringWithFormat:@"<Response id=%lu, token=%@, code=%@, size=%lu>", v4, v6, v9, *(void *)(a1 + 24) + *(unsigned __int8 *)(a1 + 3)];

    goto LABEL_12;
  }
  if (a2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
LABEL_13:
  objc_msgSend(NSString, "stringWithFormat:", @"<Event id=%lu>", v4, v12);
  id v7 = LABEL_14:;
LABEL_15:

  return v7;
}

id stringForToken(int a1)
{
  int v4 = a1;
  BOOL v1 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&v4 length:4 freeWhenDone:0];
  char v2 = objc_msgSend(v1, "hmf_hexadecimalStringWithOptions:", 2);

  return v2;
}

void sub_1D486B950(_Unwind_Exception *a1)
{
}

void sub_1D486BA34(_Unwind_Exception *a1)
{
}

void sub_1D486C354(_Unwind_Exception *a1)
{
}

void sub_1D486C41C(_Unwind_Exception *a1)
{
}

void sub_1D486C574(_Unwind_Exception *a1)
{
}

void sub_1D486C7EC(_Unwind_Exception *a1)
{
}

void sub_1D486D738(_Unwind_Exception *a1)
{
}

void sub_1D486D7B8(_Unwind_Exception *a1)
{
}

void sub_1D486DBFC(_Unwind_Exception *a1)
{
}

void sub_1D486E154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D486E6D4(_Unwind_Exception *a1)
{
}

void sub_1D486E814(_Unwind_Exception *a1)
{
}

void sub_1D486F3D0(_Unwind_Exception *a1)
{
}

void sub_1D486F554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D486F6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D486F84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D486FA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13675(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13676(uint64_t a1)
{
}

void sub_1D4870ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4870FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13905(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13906(uint64_t a1)
{
}

void sub_1D4871AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4872224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D48726F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4872AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *HAPWiFiConfigurationUpdateStatusAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_26;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_23;
    }
    if (v3 >= 0x100000)
    {
      if (v3 >= 0x400000)
      {
        if (v3 == 0x400000)
        {
          uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusNetworkConfigured";
        }
        else
        {
          if (v3 != 0x800000) {
            goto LABEL_23;
          }
          uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusConnectionVerified";
        }
      }
      else if (v3 == 0x100000)
      {
        uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusAuthenticationFailed";
      }
      else
      {
        if (v3 != 0x200000) {
          goto LABEL_23;
        }
        uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusLinkEstablished";
      }
    }
    else if (v3 >= 0x40000)
    {
      if (v3 == 0x40000)
      {
        uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusUpdateSuccessful";
      }
      else
      {
        if (v3 != 0x80000) {
          goto LABEL_23;
        }
        uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusUpdateFailed";
      }
    }
    else
    {
      uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusUpdatePending";
      if (v3 != 0x10000)
      {
        if (v3 != 0x20000) {
          goto LABEL_23;
        }
        uint64_t v5 = @"HAPWiFiConfigurationUpdateStatusSessionRestartRequired";
      }
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_23:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_26:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

void sub_1D487E154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D487E5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D487EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14940(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14941(uint64_t a1)
{
}

void sub_1D487F50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D487F8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D487FA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PairSetupAfterM4(int a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1 == 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 pairingSession];
      int PeerFlags = PairingSessionGetPeerFlags();
      [v4 pairingSession];
      uint64_t v6 = (void *)PairingSessionCopyProperty();
      CFTypeID v7 = CFGetTypeID(v6);
      if (v7 == CFDataGetTypeID())
      {
        id v8 = v6;
        id v9 = (void *)MEMORY[0x1D944E080]();
        id v10 = v4;
        uint64_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          id v13 = [v8 shortDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v16 = v12;
          __int16 v17 = 1024;
          int v18 = PeerFlags;
          __int16 v19 = 2112;
          __int16 v20 = v13;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Pair-setup after M4, flags %08X  productData %@", buf, 0x1Cu);
        }
        uint64_t v14 = +[HAPAccessory productDataStringFromData:v8];
        [v10 _handleProductData:v14];

        if (!v6) {
          goto LABEL_8;
        }
      }
      else
      {
        id v8 = 0;
        if (!v6) {
          goto LABEL_8;
        }
      }
      CFRelease(v6);
LABEL_8:
    }
  }
}

uint64_t _PairingShowSetupCode_f(int a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@_PairingShowSetupCode_f with flags: %u", buf, 0x12u);
  }
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = 0;
    uint64_t v12 = [v11 _showSetupCodeWithError:&v19];
    id v13 = v19;
    uint64_t v14 = v13;
    if (v12)
    {
      size_t v15 = [v12 lengthOfBytesUsingEncoding:4];
      if (v15 <= a3 - 1)
      {
        size_t v17 = v15;
        memcpy(a2, (const void *)[v12 UTF8String], v15);
        uint64_t v16 = 0;
        *((unsigned char *)a2 + v17) = 0;
      }
      else
      {
        uint64_t v16 = 4294960553;
      }
    }
    else
    {
      uint64_t v16 = [v13 code];
    }
  }
  else
  {
    uint64_t v16 = 4294960591;
  }

  return v16;
}

uint64_t _PromptForSetupCodeDelegateCallback_f(int a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1D944E080]();
  CFTypeID v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@_PromptForSetupCodeDelegateCallback_f with flags: %u", (uint8_t *)&v12, 0x12u);
  }
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((a1 & 0x20000) != 0)
    {
      [v9 handleBackoffRequestWithTimeout:(double)a2];
    }
    else if ((a1 & 0x10000) != 0 && ([v9 isHandlingInvalidSetupCode] & 1) == 0)
    {
      [v9 handleInvalidSetupCodeAndRestart:1];
    }
    else
    {
      [v9 handleSetupCodeRequest];
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 4294960569;
  }

  return v10;
}

uint64_t _SavePairedPeerDelegateCallback_f_15028(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:32];
    uint64_t v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v12 = 4294960591;
    }
    else
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v9];
      __int16 v14 = [[HAPPairingIdentity alloc] initWithIdentifier:v8 publicKey:v13 privateKey:0 permissions:0];
      int v15 = v14;
      uint64_t v12 = 4294960596;
      if (v14)
      {
        if ([v7 handleSavePeerRequestWithPeerIdentity:v14 error:0]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = 4294960596;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 4294960569;
  }

  return v12;
}

uint64_t _CopyPairingIdentityDelegateCallback_f_15029(uint64_t a1, char **a2, void *a3, void *a4, void *a5)
{
  unsigned int v35 = 0;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = [v8 _handleLocalPairingIdentityRequestWithStatus:&v35];
  uint64_t v10 = v9;
  if (v35) {
    goto LABEL_15;
  }
  if (a2)
  {
    BOOL v11 = [v9 identifier];
    uint64_t v12 = [v11 lengthOfBytesUsingEncoding:4];

    if (!v12) {
      goto LABEL_18;
    }
    size_t v13 = v12 + 1;
    __int16 v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
    if (!v14)
    {
      int v34 = -6728;
      goto LABEL_20;
    }
    int v15 = v14;
    id v16 = [v10 identifier];
    strlcpy(v15, (const char *)[v16 UTF8String], v13);

    *a2 = v15;
  }
  size_t v17 = (uint64_t *)MEMORY[0x1E4F64F10];
  if (!a3) {
    goto LABEL_11;
  }
  int v18 = [v10 publicKey];

  if (!v18) {
    goto LABEL_17;
  }
  id v19 = [v10 publicKey];
  __int16 v20 = [v19 data];
  size_t v21 = [v20 length];
  uint64_t v22 = *v17;

  if (v21 != v22)
  {
LABEL_18:
    int v34 = -6743;
    goto LABEL_20;
  }
  int v23 = [v10 publicKey];
  id v24 = [v23 data];
  memcpy(a3, (const void *)[v24 bytes], v21);

LABEL_11:
  if (a4)
  {
    uint64_t v25 = [v10 privateKey];

    if (v25)
    {
      nw_endpoint_type_t v26 = [v10 privateKey];
      __int16 v27 = [v26 data];
      size_t v28 = [v27 length];
      uint64_t v29 = *v17;

      if (v28 == v29)
      {
        uint64_t v30 = [v10 privateKey];
        id v31 = [v30 data];
        memcpy(a4, (const void *)[v31 bytes], v28);

        goto LABEL_15;
      }
      goto LABEL_18;
    }
LABEL_17:
    int v34 = -6727;
LABEL_20:
    unsigned int v35 = v34;
  }
LABEL_15:
  uint64_t v32 = v35;

  return v32;
}

__CFString *StringForSystemPowerChangedMessage(uint64_t a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 + 536870288;
  unsigned int v1 = v2 >> 4;
  if (v1 < 0xC && ((0xA07u >> v1) & 1) != 0)
  {
    uint64_t v3 = off_1E69F2828[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Missing string for IOSystemMessage: 0x%X", a1);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void sub_1D4885EC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48864AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D488693C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4886D70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4886EC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D488701C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D488740C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1D48887CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D488883C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48888E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48890A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4889288(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48893E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4889474(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HAPAccessoryServerPairSetupTypeToString(unint64_t a1)
{
  if (a1 > 7) {
    return &stru_1F2C4E778;
  }
  else {
    return off_1E69F2980[a1];
  }
}

id HAPPairingStateFromData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  TLV8Get();

  return 0;
}

__CFString *HAPUserPermissionTypeDescription(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E69F29C0[a1];
  }

  return v1;
}

__CFString *HAPLinkTypeDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E69F29F0[a1];
  }

  return v1;
}

__CFString *HAPCommunicationProtocolDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E69F2A08[a1];
  }

  return v1;
}

__CFString *HAPLinkLayerTypeDescription(unint64_t a1)
{
  if (a1 > 4) {
    return @"Ethernet";
  }
  else {
    return off_1E69F2A20[a1];
  }
}

__CFString *HAPCharacteristicValueTransitionTypesAsString(unint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v3 = 1;
  unint64_t v4 = a1;
  do
  {
    if ((v3 & a1) == 0) {
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      uint64_t v5 = @"HAPCharacteristicValueTransitionTypeLinear";
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_9;
      }
      uint64_t v5 = @"HAPCharacteristicValueTransitionTypeLinearDerived";
    }
    v4 &= ~v3;
    [v2 addObject:v5];
LABEL_9:
    v3 *= 2;
  }
  while (v3 - 1 < a1);
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v4);
    [v2 addObject:v6];
  }
LABEL_12:
  if ([v2 count])
  {
    id v7 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v7 = @"None";
  }

  return v7;
}

__CFString *HAPCharacteristicFormatToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = *off_1E69F2C58[a1 - 1];
  }
  return v2;
}

__CFString *HAPCharacteristicUnitToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = *off_1E69F2CD0[a1 - 1];
  }
  return v2;
}

uint64_t HAPCharacteristicUnitFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"seconds"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"arcdegrees"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"celsius"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"percentage"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"lux"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D4891A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16877(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16878(uint64_t a1)
{
}

void sub_1D4891CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4891FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D4892178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48923F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D489261C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4892754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4893140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17089(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17090(uint64_t a1)
{
}

void sub_1D48941CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4894418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4894688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4894910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4894B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4894DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4895060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48952D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4895774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D4895D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D4896B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void __validateAccessoryRuntimeInformationService_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:@"0000023C-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "Accessory Runtime Information service contains more than one Ping characteristic", buf, 2u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    uint64_t v10 = [v6 metadata];
    uint64_t v11 = [v10 format];
    uint64_t v12 = HAPCharacteristicFormatFromString(v11);

    if (v12 != 12)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v13 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "Accessory Runtime Information service contains an invalid Ping characteristic", v14, 2u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_1D4899108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1D48998FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4899974(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4899A08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D489BA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D489BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18139(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18140(uint64_t a1)
{
}

void sub_1D489C264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id cacheFileIdentifierForAccessoryServer(void *a1, void *a2)
{
  id v3 = a1;
  unint64_t v4 = [a2 deviceID];
  uint64_t v5 = [v4 deviceIDString];
  id v6 = [v5 stringByAppendingFormat:@"+%@", v3];

  return v6;
}

void sub_1D489CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D489DC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D489E358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D489E6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D489EF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D489F754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v21 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D48A0238(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D48A08A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void __characteristicDescriptionsFromRequest_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [a2 characteristic];
  id v3 = characteristicDescriptionFromCharacteristic(v4);
  [v2 addObject:v3];
}

id characteristicDescriptionFromCharacteristic(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  id v3 = [v2 type];
  id v4 = +[HAPCharacteristic hap2_shortTypeFromUUID:v3];
  uint64_t v5 = [v2 instanceID];

  id v6 = [v1 stringWithFormat:@"%@ [%@]", v4, v5];

  return v6;
}

void sub_1D48A124C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A2928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_1D48A309C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A3A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A4148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D48A4B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48A55D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A5D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A5E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A6E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1D48A731C(_Unwind_Exception *a1)
{
}

void sub_1D48A75B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48A7888(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48A7C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48A7CAC(_Unwind_Exception *a1)
{
}

void sub_1D48A7E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18744(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18745(uint64_t a1)
{
}

void sub_1D48A80A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A82E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A8450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A8588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48A8788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48AFFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D48B0268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19821(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19822(uint64_t a1)
{
}

void sub_1D48B0580(_Unwind_Exception *a1)
{
}

void sub_1D48B0994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D48B3308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1D48B37F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void coapRequestHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  }
  id v10 = *(id *)(a3 + 344);
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 didReceiveRequestInSession:a3 messageID:*(unsigned __int16 *)(a4 + 6) request:a4 response:a7];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v12 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      int v13 = *(unsigned __int16 *)(a4 + 6);
      v14[0] = 67109120;
      v14[1] = v13;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "Received request with message id %i but session has no app data", (uint8_t *)v14, 8u);
    }
  }
}

void coapPongHandler(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  }
  id v6 = *(id *)(a2 + 344);
  id v7 = v6;
  if (v6)
  {
    [v6 didReceivePongInSession:a2 messageID:a4];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v8 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = a4;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "Received pong with message id %i but session has no app data", (uint8_t *)v9, 8u);
    }
  }
}

void coapNackHandler(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  }
  id v9 = *(id *)(a2 + 344);
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 didFailToSendMessageInSession:a2 messageID:a5 message:a3 reason:a4];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = a5;
      _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "Received nack for message id %i but session has no app data", (uint8_t *)v12, 8u);
    }
  }
}

uint64_t coapEventHandler(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v3 = hap2Log_coap;
  if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_debug_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEBUG, "Received event %u", (uint8_t *)v5, 8u);
  }
  return 0;
}

void coapResponseHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    __assert_rtn("coap_session_get_app_data", "coap_session.c", 92, "session");
  }
  id v8 = *(id *)(a2 + 344);
  id v9 = v8;
  if (v8)
  {
    [v8 didReceiveResponseInSession:a2 messageID:a5 response:a4];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v10 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a5;
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "Received response with message id %i but session has no app data", (uint8_t *)v11, 8u);
    }
  }
}

uint64_t coapNetworkRead(uint64_t a1, unsigned char *a2)
{
  uint64_t result = coap_network_read(a1, (uint64_t)a2);
  if (a2[37] == 30) {
    a2[36] = 0;
  }
  if (a2[5] == 30) {
    a2[4] = 0;
  }
  return result;
}

void sub_1D48B4D34(_Unwind_Exception *a1)
{
}

void sub_1D48B4FDC(_Unwind_Exception *a1)
{
}

void sub_1D48B50D0(_Unwind_Exception *a1)
{
}

void sub_1D48B51C4(_Unwind_Exception *a1)
{
}

void coapLogHandler(unsigned int a1, uint64_t a2)
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  if (a1 == 6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v5 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_INFO))
    {
      int v14 = 136380675;
      *(void *)uint64_t v15 = a2;
      uint64_t v6 = v5;
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_1D4758000, v6, v7, "<libcoap> %{private}s", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (a1 == 7)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v4 = hap2Log_coap;
      if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136380675;
        *(void *)uint64_t v15 = a2;
        _os_log_debug_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "<libcoap> %{private}s", (uint8_t *)&v14, 0xCu);
      }
      return;
    }
    if ((a1 & 0xFFFFFFFE) != 4)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = hap2Log_coap;
      BOOL v10 = os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_ERROR);
      if (a1 > 3)
      {
        if (!v10) {
          return;
        }
        int v14 = 67109379;
        v15[0] = a1;
        LOWORD(v15[1]) = 2081;
        *(void *)((char *)&v15[1] + 2) = a2;
        uint64_t v11 = "<libcoap> Unknown log level (%u) for message: %{private}s";
        uint64_t v12 = v9;
        uint32_t v13 = 18;
      }
      else
      {
        if (!v10) {
          return;
        }
        int v14 = 136380675;
        *(void *)uint64_t v15 = a2;
        uint64_t v11 = "<libcoap> %{private}s";
        uint64_t v12 = v9;
        uint32_t v13 = 12;
      }
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, v13);
      return;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v8 = hap2Log_coap;
    if (os_log_type_enabled((os_log_t)hap2Log_coap, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136380675;
      *(void *)uint64_t v15 = a2;
      uint64_t v6 = v8;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_16;
    }
  }
}

BOOL fd_set_flag(int a1)
{
  int v2 = fcntl(a1, 3, 0);
  return v2 != -1 && fcntl(a1, 4, v2 | 0x1000004u) != -1;
}

void sub_1D48B6114(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48B624C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48B6C58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48B6E60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __HAPBLEDateStringForTime_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)HAPBLEDateStringForTime_formatter;
  HAPBLEDateStringForTime_formatter = (uint64_t)v0;

  int v2 = (void *)HAPBLEDateStringForTime_formatter;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

__CFString *HAPWiProxScanStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    int v2 = [NSNumber numberWithInteger:a1];
    uint64_t v1 = [v2 stringValue];
  }
  else
  {
    uint64_t v1 = off_1E69F3578[a1 - 1];
  }

  return v1;
}

void sub_1D48B86B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48B8C18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48BA6C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48BB36C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48BB3F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48BB47C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48BC114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__20628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20629(uint64_t a1)
{
}

void sub_1D48BC588(_Unwind_Exception *a1)
{
}

void sub_1D48BC8F8(_Unwind_Exception *a1)
{
}

void sub_1D48BCC88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D48BD75C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D48BDC00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48BE3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D48BE8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48BF72C(_Unwind_Exception *a1)
{
}

void sub_1D48BF914(_Unwind_Exception *a1)
{
}

void sub_1D48BFBFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48C0A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a11);
  _Unwind_Resume(a1);
}

void sub_1D48C12E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v25 - 96));
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1D48C184C(_Unwind_Exception *a1)
{
}

void sub_1D48C2C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a52, 8);
  __HMFActivityScopeLeave();
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D48C3730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48C3B70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48C3D04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48C42D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id HAPStringFromAccessoryServerSession(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  if (a1 >= 1)
  {
    for (uint64_t i = 1; i <= a1 && i; i *= 2)
    {
      if ((i & a1) == 0) {
        continue;
      }
      if (i <= 15)
      {
        id v4 = @"CameraStreaming";
        switch(i)
        {
          case 1:
            goto LABEL_15;
          case 2:
            id v4 = @"FirmwareDownloading";
            goto LABEL_15;
          case 4:
            id v4 = @"LogUploading";
            goto LABEL_15;
          case 8:
            id v4 = @"TargetController";
            goto LABEL_15;
          default:
            continue;
        }
        continue;
      }
      switch(i)
      {
        case 16:
          id v4 = @"SiriEndpoint";
          break;
        case 32:
          id v4 = @"DiagnosticsTransfer";
          break;
        case 64:
          id v4 = @"ForegroundClientNotifications";
          break;
        default:
          continue;
      }
LABEL_15:
      [v2 addObject:v4];
    }
  }
  uint64_t v5 = NSString;
  uint64_t v6 = [v2 componentsJoinedByString:@","];
  os_log_type_t v7 = [v5 stringWithFormat:@"<%@>", v6];

  return v7;
}

uint64_t HAPAccessoryServerSessionTypesFromString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = 1;
  id v3 = HAPStringFromAccessoryServerSession(1);
  char v4 = [v1 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v2 = 2;
    uint64_t v5 = HAPStringFromAccessoryServerSession(2);
    char v6 = [v1 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v2 = 4;
      os_log_type_t v7 = HAPStringFromAccessoryServerSession(4);
      char v8 = [v1 isEqual:v7];

      if ((v8 & 1) == 0)
      {
        uint64_t v2 = 8;
        uint64_t v9 = HAPStringFromAccessoryServerSession(8);
        char v10 = [v1 isEqual:v9];

        if ((v10 & 1) == 0)
        {
          uint64_t v2 = 16;
          uint64_t v11 = HAPStringFromAccessoryServerSession(16);
          char v12 = [v1 isEqual:v11];

          if ((v12 & 1) == 0)
          {
            uint64_t v2 = 32;
            uint32_t v13 = HAPStringFromAccessoryServerSession(32);
            char v14 = [v1 isEqual:v13];

            if ((v14 & 1) == 0)
            {
              uint64_t v15 = HAPStringFromAccessoryServerSession(64);
              int v16 = [v1 isEqual:v15];

              if (v16) {
                uint64_t v2 = 64;
              }
              else {
                uint64_t v2 = 0;
              }
            }
          }
        }
      }
    }
  }

  return v2;
}

void sub_1D48C5120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48C52CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48C53D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48C6150(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void __shouldLogPrivateInformation_block_invoke()
{
  id v1 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v0 = [v1 preferenceForKey:@"shouldLogPrivateInformation"];
  shouldLogPrivateInformation_shouldLogPrivateInformation = [v0 BOOLValue];
}

void sub_1D48CAD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t _SavePairedPeerDelegateCallback_f_21558(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  uint64_t v9 = [v7 identifier];
  char v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:32];
    char v12 = [v7 keyStore];
    id v28 = 0;
    [v12 savePublicKey:v11 forAccessoryName:v8 error:&v28];
    id v13 = v28;

    uint64_t v14 = [v13 code];
    if (!v14)
    {
      [v7 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v11];
      uint64_t v15 = [v7 keyStore];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [v7 keyStore];
        uint64_t v18 = [v7 peripheral];
        id v19 = [v18 identifier];
        __int16 v20 = [v7 identifier];
        id v27 = v13;
        objc_msgSend(v17, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v19, v20, objc_msgSend(v7, "hapBLEProtocolVersion"), 0, 0, &v27);
        id v21 = v27;

        id v13 = v21;
        uint64_t v14 = [v21 code];
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1D944E080]();
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v7 identifier];
      *(_DWORD *)buf = 138544130;
      uint64_t v30 = v24;
      __int16 v31 = 2080;
      uint64_t v32 = "OSStatus _SavePairedPeerDelegateCallback_f(const void *, size_t, const uint8_t *, void *)";
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      __int16 v35 = 2112;
      uint32_t v36 = v25;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@%s: Accessory username provided by Pair Setup, %@, doesn't match username provided by BTLE advertisement data, %@", buf, 0x2Au);
    }
    uint64_t v14 = 4294960548;
  }

  return v14;
}

uint64_t _CopyPairingIdentityDelegateCallback_f_21563(int a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [v8 pairingRequest];
  uint64_t v10 = [v9 pairingIdentity];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
  }
  else
  {
    char v12 = [v8 keyBag];
    uint64_t v11 = [v12 currentIdentity];

    if (!v11)
    {
      id v30 = 0;
      id v31 = 0;
      id v28 = 0;
      id v26 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v42 = a3;
  id v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = v8;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    char v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v54 = v16;
    __int16 v55 = 2112;
    uint64_t v56 = v11;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Using Pairing Identity : %@", buf, 0x16u);
  }
  id v45 = v8;

  uint64_t v17 = [v11 publicKey];
  uint64_t v18 = [v17 data];

  id v19 = [v11 identifier];
  uint64_t v43 = a4;
  if (a4)
  {
    __int16 v20 = [v11 privateKey];
    uint64_t v21 = [v20 data];

    uint64_t v22 = [v14 keyStore];
    char v51 = (void *)v21;
    id v52 = v18;
    int v50 = v19;
    int v23 = [v14 identifier];
    uint64_t v49 = 0;
    id v24 = &v50;
    uint64_t v25 = (id *)&v49;
    [v22 getControllerPublicKey:&v52 secretKey:&v51 username:&v50 allowCreation:a1 != 0 forAccessory:v23 error:&v49];
    id v26 = v52;

    id v27 = v51;
    uint64_t v18 = (void *)v21;
    id v28 = v51;
  }
  else
  {
    uint64_t v22 = [v14 keyStore];
    id v47 = v19;
    uint64_t v48 = v18;
    int v23 = [v14 identifier];
    uint64_t v46 = 0;
    id v24 = &v47;
    uint64_t v25 = (id *)&v46;
    [v22 getControllerPublicKey:&v48 secretKey:0 username:&v47 allowCreation:a1 != 0 forAccessory:v23 error:&v46];
    id v28 = 0;
    id v27 = v48;
    id v26 = v48;
  }
  id v29 = v27;

  id v30 = *v24;
  id v31 = *v25;

  uint64_t v32 = [v31 code];
  if (v32)
  {
    id v8 = v45;
    goto LABEL_24;
  }
  id v8 = v45;
  if (!v26) {
    goto LABEL_23;
  }
  if ([v26 length] != 32) {
    goto LABEL_25;
  }
  id v26 = v26;
  __int16 v33 = (_OWORD *)[v26 bytes];
  long long v34 = v33[1];
  *uint64_t v42 = *v33;
  v42[1] = v34;
  if (!v43) {
    goto LABEL_17;
  }
  if (!v28)
  {
LABEL_23:
    uint64_t v32 = 4294960569;
    goto LABEL_24;
  }
  if ([v28 length] != 32) {
    goto LABEL_25;
  }
  __int16 v35 = (_OWORD *)[v28 bytes];
  long long v36 = v35[1];
  *uint64_t v43 = *v35;
  v43[1] = v36;
LABEL_17:
  uint64_t v32 = 0;
  if (a2 && v30)
  {
    uint64_t v37 = [v30 lengthOfBytesUsingEncoding:4];
    if (v37)
    {
      size_t v38 = v37 + 1;
      v39 = (char *)malloc_type_calloc(v37 + 1, 1uLL, 0x100004077774924uLL);
      if (v39)
      {
        id v40 = v39;
        id v30 = v30;
        strlcpy(v40, (const char *)[v30 UTF8String], v38);
        uint64_t v32 = 0;
        *a2 = v40;
      }
      else
      {
        uint64_t v32 = 4294960568;
      }
      goto LABEL_24;
    }
LABEL_25:
    uint64_t v32 = 4294960553;
  }
LABEL_24:

  return v32;
}

uint64_t _PairSetupPromptForSetupCodeDelegateCallback_f_21565(int a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Pair-setup prompting for password...\n", buf, 0xCu);
  }
  [v5 _cancelConnectionLifetimeTimer];
  if ((a1 & 0x30000) == 0)
  {
    if ([v5 _delegateRespondsToSelector:sel_accessoryServer_promptUserForPasswordWithType_])
    {
      uint64_t v9 = [v5 delegateQueue];
      uint64_t v10 = v9;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke_2;
      block[3] = &unk_1E69F4330;
      void block[4] = v5;
      uint64_t v11 = block;
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v12 = 4294960594;
    goto LABEL_10;
  }
  if (![v5 _delegateRespondsToSelector:sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_])goto LABEL_9; {
  uint64_t v9 = [v5 delegateQueue];
  }
  uint64_t v10 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke;
  v15[3] = &unk_1E69F3DD0;
  v15[4] = v5;
  int v16 = a2;
  uint64_t v11 = v15;
LABEL_8:
  dispatch_async(v9, v11);

  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

id _convertFromBTLEToHAPValue(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = HAPCharacteristicFormatFromString(v3);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = +[HAPDataValueTransformer defaultDataValueTransformer];
    id v21 = 0;
    id v8 = [v7 reverseTransformedValue:v4 format:v6 error:&v21];
    id v9 = v21;

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
LABEL_14:

        goto LABEL_15;
      }
      id v14 = (void *)MEMORY[0x1D944E080]();
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v23 = v16;
        __int16 v24 = 2112;
        id v25 = v3;
        uint64_t v17 = "%{public}@[HAPAccessoryServerBTLE] Invalid Format %@ for StepValue";
        uint64_t v18 = v15;
        uint32_t v19 = 22;
        goto LABEL_12;
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D944E080]();
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        int v23 = v16;
        __int16 v24 = 2112;
        id v25 = v4;
        __int16 v26 = 2112;
        id v27 = v3;
        __int16 v28 = 2112;
        id v29 = v9;
        uint64_t v17 = "%{public}@[HAPAccessoryServerBTLE] Failed to transform value, %@, with format, %@, with error: %@";
        uint64_t v18 = v15;
        uint32_t v19 = 42;
LABEL_12:
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }

    id v10 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = (void *)MEMORY[0x1D944E080]();
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v23 = v13;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPAccessoryServerBTLE] Invalid format type string '%@'", buf, 0x16u);
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

void _updateHAPConstraintsFromBTLEValidRange(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    uint64_t v18 = (void *)MEMORY[0x1D944E080]();
    uint32_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v25 = 138543618;
      __int16 v26 = v20;
      __int16 v27 = 2048;
      uint64_t v28 = [v4 length];
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@### Invalid Range data length: %ld", (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = [v3 constraints];

    if (!v5)
    {
      uint64_t v6 = objc_alloc_init(HAPMetadataConstraints);
      [v3 setConstraints:v6];
    }
    unint64_t v7 = (unint64_t)[v4 length] >> 1;
    unint64_t v8 = (unint64_t)[v4 length] >> 1;
    unint64_t v9 = (unint64_t)[v4 length] >> 1;
    id v10 = objc_msgSend(v4, "subdataWithRange:", 0, v7);
    uint64_t v11 = objc_msgSend(v4, "subdataWithRange:", v8, v9);
    uint64_t v12 = [v3 format];
    int v13 = [v12 isEqualToString:@"string"];

    if (v13)
    {
      id v14 = _convertFromBTLEToHAPValue(@"uint16", v10);
      uint64_t v15 = [v3 constraints];
      [v15 setMinLength:v14];

      int v16 = _convertFromBTLEToHAPValue(@"uint16", v11);
      uint64_t v17 = [v3 constraints];
      [v17 setMaxLength:v16];
    }
    else
    {
      id v21 = [v3 format];
      uint64_t v22 = _convertFromBTLEToHAPValue(v21, v10);
      int v23 = [v3 constraints];
      [v23 setMinimumValue:v22];

      int v16 = [v3 format];
      uint64_t v17 = _convertFromBTLEToHAPValue(v16, v11);
      __int16 v24 = [v3 constraints];
      [v24 setMaximumValue:v17];
    }
  }
}

void sub_1D48D1C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48D4D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48D51E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48DE430(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HAPWACWiFiBandToString(char a1)
{
  if (a1)
  {
    uint64_t v2 = [@"<" stringByAppendingString:@" 2.4"];
    if ((a1 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v2 = @"<";
  if ((a1 & 2) != 0)
  {
LABEL_5:
    uint64_t v3 = [(__CFString *)v2 stringByAppendingString:@" 5"];

    uint64_t v2 = (__CFString *)v3;
  }
LABEL_6:
  id v4 = [(__CFString *)v2 stringByAppendingString:@" GHz >"];

  return v4;
}

void sub_1D48E1D80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1D48E5E48(_Unwind_Exception *a1)
{
}

void sub_1D48E71FC(_Unwind_Exception *a1)
{
}

__CFString *HAPDiagnosticsSnapshotFormatAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HAPDiagnosticsSnapshotFormatText";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPDiagnosticsSnapshotFormat %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HAPDiagnosticsSnapshotFormatZip";
  }
  return v2;
}

__CFString *HAP2TLVThreadOperationTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAP2TLVThreadOperationType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F41D0[a1 - 1];
  }

  return v1;
}

void sub_1D48E8FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E91A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E9324(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48E94FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E96D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E9874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E9A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E9BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48E9E60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EA0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EA23C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EA3BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EA5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EA750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EAA50(_Unwind_Exception *a1)
{
}

__CFString *HAP2UnpairedAccessoryServerPermissionTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown Type";
  }
  else {
    return off_1E69F42E0[a1 - 1];
  }
}

void sub_1D48EB3D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EB5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EB6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void localDeviceCallback(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    unint64_t v7 = HMFGetLogIdentifier();
    unint64_t v8 = (void *)btLocalDeviceState2String;
    unint64_t v9 = [NSNumber numberWithInt:a2];
    id v10 = [v8 objectForKeyedSubscript:v9];
    int v11 = 138543874;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] localDeviceCallback with event %@ and result 0x%08x", (uint8_t *)&v11, 0x1Cu);
  }
}

void serviceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (void *)MEMORY[0x1D944E080]();
  unint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    id v10 = (void *)btServiceEvent2String;
    int v11 = [NSNumber numberWithInt:a3];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    int v13 = 138543874;
    id v14 = v9;
    __int16 v15 = 2112;
    int v16 = v12;
    __int16 v17 = 1024;
    int v18 = a5;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] serviceEventCallbackwith event %@  result 0x%08x", (uint8_t *)&v13, 0x1Cu);
  }
}

void sessionEventCallback(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v7 = (void *)MEMORY[0x1D944E080]();
    unint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      int v18 = 138543874;
      uint64_t v19 = v9;
      __int16 v20 = 1024;
      int v21 = a2;
      __int16 v22 = 1024;
      int v23 = a3;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] sessionEventCallback: BTServer detached, event ID 0x%08x with error 0x%08x", (uint8_t *)&v18, 0x18u);
    }
    *(void *)(a4 + 40) = 0;
    *(void *)(a4 + 4_Block_object_dispose(&a9, 8) = 0;
  }
  else
  {
    if (a3)
    {
      id v10 = (void *)MEMORY[0x1D944E080]();
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v12;
        __int16 v20 = 1024;
        int v21 = a3;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: Failed to attach to BTServer with error 0x%08x", (uint8_t *)&v18, 0x12u);
      }
    }
    else
    {
      *(void *)(a4 + 40) = a1;
      int Default = BTLocalDeviceGetDefault();
      if (Default)
      {
        int v14 = Default;
        id v10 = (void *)MEMORY[0x1D944E080]();
        __int16 v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = HMFGetLogIdentifier();
          int v18 = 138543618;
          uint64_t v19 = v16;
          __int16 v20 = 1024;
          int v21 = v14;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: failed to get local device handle with error 0x%08x", (uint8_t *)&v18, 0x12u);
        }
      }
      else
      {
        *(unsigned char *)(a4 + 24_Block_object_dispose(&a9, 8) = 0;
        id v10 = (void *)MEMORY[0x1D944E080]();
        __int16 v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = HMFGetLogIdentifier();
          int v18 = 138543362;
          uint64_t v19 = v17;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] (BTServer) sessionEventCallback: attached.", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
}

void sub_1D48EDF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EE108(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EE204(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EE378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EE464(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EE654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EE7AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EE8A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EEA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EEB70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EECE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48EF31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48EF4DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48EF8DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F0E70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D48F13D4(_Unwind_Exception *exception_object)
{
}

id _extractResponseHeaderFields(void *a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  if ((unint64_t)[v7 length] > 2)
  {
    [v7 getBytes:a2 length:1];
    uint64_t v12 = objc_msgSend(v7, "subdataWithRange:", 1, objc_msgSend(v7, "length") - 1);

    if ((*a2 & 2) != 0)
    {
      [v12 getBytes:a3 length:1];
      __int16 v17 = objc_msgSend(v12, "subdataWithRange:", 1, objc_msgSend(v12, "length") - 1);

      [v17 getBytes:a4 length:1];
      int v18 = objc_msgSend(v17, "subdataWithRange:", 1, objc_msgSend(v17, "length") - 1);

      id v7 = v18;
      int v11 = v7;
    }
    else
    {
      int v13 = (void *)MEMORY[0x1D944E080]();
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        int v16 = *a2;
        int v20 = 138543618;
        int v21 = v15;
        __int16 v22 = 1024;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected PDU Type in controlfield 0x%02x - expecting a response", (uint8_t *)&v20, 0x12u);
      }
      int v11 = 0;
      id v7 = v12;
    }
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x1D944E080]();
    unint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v20 = 138543618;
      int v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = [v7 length];
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Insufficient length %tu - dropping", (uint8_t *)&v20, 0x16u);
    }
    int v11 = 0;
  }

  return v11;
}

void sub_1D48F5040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24697(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24698(uint64_t a1)
{
}

void sub_1D48F52F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48F5444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D48F55A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F58E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F5A5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F5BD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F5E4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D48F5FE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D48F62D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24863(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24864(uint64_t a1)
{
}

void sub_1D48F6750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D48F6A44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *HAPDataStreamTransportCommandAsString(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPDataStreamTransportCommand %ld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"HAPDataStreamTransportCommandStartSession";
  }
  return v2;
}

__CFString *HAPDataStreamTransportCommandStatusAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPDataStreamTransportCommandStatus %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69F46A0[a1];
  }

  return v1;
}

__CFString *HAPDataStreamTransportProtocolAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HAPDataStreamTransportProtocolHAP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HAPDataStreamTransportProtocol %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HAPDataStreamTransportProtocolTCP";
  }
  return v2;
}

double coap_ticks(void *a1)
{
  v3.tv_sec = 0;
  *(void *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  double result = (double)v3.tv_usec * 1.024 + 512.0;
  *a1 = 1000 * (v3.tv_sec - coap_clock_offset) + ((unint64_t)result >> 10);
  return result;
}

size_t coap_session_str(uint64_t a1)
{
  size_t result = coap_print_addr(a1 + 136, (char *)&coap_session_str_szSession, 0x100uLL);
  if (result)
  {
    size_t result = strlen((const char *)&coap_session_str_szSession);
    timeval v3 = (int *)((char *)&coap_session_str_szSession + result);
  }
  else
  {
    timeval v3 = &coap_session_str_szSession;
  }
  if ((int *)((char *)v3 + 6) < &coap_endpoint_str_szEndpoint)
  {
    strcpy((char *)v3, " <-> ");
    timeval v3 = (int *)((char *)v3 + 5);
  }
  if ((int *)((char *)v3 + 1) < &coap_endpoint_str_szEndpoint)
  {
    size_t result = coap_print_addr(a1 + 104, (char *)v3, (char *)&coap_session_str_szSession - (char *)v3 + 256);
    if (result)
    {
      size_t result = strlen((const char *)v3);
      timeval v3 = (int *)((char *)v3 + result);
    }
  }
  if (*(int *)(a1 + 168) >= 1 && (int *)((char *)v3 + 1) < &coap_endpoint_str_szEndpoint)
  {
    size_t result = snprintf((char *)v3, (char *)&coap_session_str_szSession - (char *)v3 + 256, " (if%d)", *(_DWORD *)(a1 + 168));
    timeval v3 = (int *)((char *)v3 + (int)result);
  }
  if ((int *)((char *)v3 + 6) < &coap_endpoint_str_szEndpoint)
  {
    if ((*(unsigned char *)a1 - 1) > 3u) {
      uint64_t v4 = " NONE";
    }
    else {
      uint64_t v4 = off_1E69F4728[(*(unsigned char *)a1 - 1)];
    }
    int v5 = *(_DWORD *)v4;
    *((_WORD *)v3 + 2) = *((_WORD *)v4 + 2);
    *timeval v3 = v5;
  }
  return result;
}

void coap_session_release(uint64_t a1)
{
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 4);
    if (!v1) {
      __assert_rtn("coap_session_release", "coap_session.c", 76, "session->ref > 0");
    }
    int v2 = v1 - 1;
    *(_DWORD *)(a1 + 4) = v2;
    if (!v2 && *(unsigned char *)(a1 + 1) == 1)
    {
      coap_session_free((_DWORD *)a1);
    }
  }
}

void coap_session_free(_DWORD *a1)
{
  if (!a1) {
    return;
  }
  if (a1[1]) {
    __assert_rtn("coap_session_free", "coap_session.c", 171, "session->ref == 0");
  }
  int v2 = (void *)*((void *)a1 + 33);
  if (v2) {
    coap_delete_pdu(v2);
  }
  if (*((_WORD *)a1 + 90))
  {
    int v3 = a1[44];
    if (v3 != -1)
    {
      *((void *)a1 + 23) = 0;
      *((void *)a1 + 24) = 0;
      close(v3);
      a1[44] = -1;
    }
    *((_WORD *)a1 + 90) = 0;
  }
  uint64_t v4 = (void *)*((void *)a1 + 39);
  if (v4) {
    free(v4);
  }
  int v5 = (void *)*((void *)a1 + 41);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = (void *)*((void *)a1 + 29);
  while (v6)
  {
    id v7 = v6;
    uint64_t v6 = (void *)*v6;
    if (!*(unsigned char *)v7[5])
    {
      uint64_t v8 = *((void *)a1 + 26);
      if (v8)
      {
        unint64_t v9 = *(void (**)(void))(v8 + 80);
        if (v9) {
          v9();
        }
      }
    }
    coap_delete_node((void **)v7);
  }
  uint64_t v10 = *((void *)a1 + 25);
  if (v10)
  {
    uint64_t v11 = *(void *)(v10 + 80);
    if (v11)
    {
      uint64_t v12 = (char *)(a1 + 12);
      if (*((void *)a1 + 6))
      {
        uint64_t v13 = *((void *)a1 + 7);
        if (v13 || *((void *)a1 + 8))
        {
          uint64_t v14 = *(void *)(v11 + 48);
          if (v12 == *(char **)(v14 + 24)) {
            *(void *)(v14 + 24) = v13 + *(void *)(v14 + 32);
          }
          uint64_t v15 = *((void *)a1 + 8);
          if (!v13)
          {
            *(void *)(v10 + 80) = v15;
LABEL_42:
            uint64_t v14 = *(void *)(v15 + 48);
LABEL_43:
            *(void *)(v15 + *(void *)(v14 + 32) + _Block_object_dispose(&a9, 8) = v13;
LABEL_44:
            uint64_t v18 = *(void *)v14 + 16 * ((*(_DWORD *)(v14 + 8) - 1) & a1[25]);
            --*(_DWORD *)(v18 + 8);
            if (*(char **)v18 == v12) {
              *(void *)uint64_t v18 = *((void *)a1 + 10);
            }
            uint64_t v19 = *((void *)a1 + 9);
            if (v19) {
              *(void *)(v19 + 32) = *((void *)a1 + 10);
            }
            uint64_t v20 = *((void *)a1 + 10);
            if (v20) {
              *(void *)(v20 + 24) = v19;
            }
            --*(_DWORD *)(v14 + 16);
            goto LABEL_51;
          }
          goto LABEL_38;
        }
        free(**(void ***)(v11 + 48));
        free(*(void **)(*(void *)(*((void *)a1 + 25) + 80) + 48));
        *(void *)(*((void *)a1 + 25) + 80) = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = *((void *)a1 + 26);
    if (v16)
    {
      uint64_t v17 = *(void *)(v16 + 64);
      if (v17)
      {
        uint64_t v12 = (char *)(a1 + 12);
        if (*((void *)a1 + 6))
        {
          uint64_t v13 = *((void *)a1 + 7);
          if (v13 || *((void *)a1 + 8))
          {
            uint64_t v14 = *(void *)(v17 + 48);
            if (v12 == *(char **)(v14 + 24)) {
              *(void *)(v14 + 24) = v13 + *(void *)(v14 + 32);
            }
            uint64_t v15 = *((void *)a1 + 8);
            if (!v13)
            {
              *(void *)(v16 + 64) = v15;
              goto LABEL_42;
            }
LABEL_38:
            *(void *)(v13 + *(void *)(v14 + 32) + 16) = v15;
            uint64_t v15 = *((void *)a1 + 8);
            if (!v15) {
              goto LABEL_44;
            }
            goto LABEL_43;
          }
          free(**(void ***)(v17 + 48));
          free(*(void **)(*(void *)(*((void *)a1 + 26) + 64) + 48));
          *(void *)(*((void *)a1 + 26) + 64) = 0;
        }
      }
    }
  }
LABEL_51:
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: session closed\n", (const char *)&coap_session_str_szSession);
  }

  free(a1);
}

uint64_t coap_session_max_pdu_size(unsigned __int8 *a1)
{
  uint64_t v1 = (*((_DWORD *)a1 + 3) - *((_DWORD *)a1 + 2));
  if (*a1 - 1 > 1)
  {
    if (v1 >= 3)
    {
      if (v1 > 0xE)
      {
        if (v1 > 0x10F)
        {
          if (v1 > 0x10110) {
            return v1 - 6;
          }
          else {
            return v1 - 4;
          }
        }
        else
        {
          return v1 - 3;
        }
      }
      else
      {
        return v1 - 2;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (v1 <= 4)
  {
    return 0;
  }
  else
  {
    return v1 - 4;
  }
}

uint64_t coap_session_write(uint64_t a1, const void *a2, int64_t a3)
{
  *(_WORD *)(a1 + 180) &= 0xFDDFu;
  ssize_t v5 = send(*(_DWORD *)(a1 + 176), a2, a3, 0);
  if (v5 == -1)
  {
    if (*__error() == 35 || *__error() == 4)
    {
      uint64_t v6 = 0;
      *(_WORD *)(a1 + 180) |= 0x20u;
      return v6;
    }
    if (maxlog < 4) {
      return -1;
    }
    uint64_t v8 = __error();
    unint64_t v9 = strerror(*v8);
    coap_log_impl(4, "coap_socket_write: send: %s\n", v9);
    uint64_t v6 = -1;
  }
  else
  {
    uint64_t v6 = v5;
    if (v5 < a3) {
      *(_WORD *)(a1 + 180) |= 0x20u;
    }
    if (v5 >= 1)
    {
      v11.tv_sec = 0;
      *(void *)&v11.tv_usec = 0;
      gettimeofday(&v11, 0);
      *(void *)(a1 + 272) = 1000 * (v11.tv_sec - coap_clock_offset)
                            + ((unint64_t)((double)v11.tv_usec * 1.024 + 512.0) >> 10);
      if (maxlog > 6)
      {
        id v7 = "*  %s: sent %zd bytes\n";
LABEL_16:
        coap_session_str(a1);
        coap_log_impl(7, v7, &coap_session_str_szSession, a3);
        return v6;
      }
      return v6;
    }
    if ((v5 & 0x8000000000000000) == 0) {
      return v6;
    }
  }
  if (maxlog >= 7)
  {
    id v7 = "*   %s: failed to send %zd bytes\n";
    goto LABEL_16;
  }
  return v6;
}

uint64_t coap_session_delay_pdu(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = (_OWORD *)a3;
    uint64_t v12 = 0;
    coap_remove_from_queue((void **)(*((void *)a1 + 26) + 48), (uint64_t)a1, *(_DWORD *)(a3 + 32), &v12);
    if (v12 != v4) {
      __assert_rtn("coap_session_delay_pdu", "coap_session.c", 257, "removed == node");
    }
    coap_session_release(*((void *)v4 + 3));
    *((void *)v4 + 3) = 0;
    *((void *)v4 + 1) = 0;
  }
  else
  {
    unint64_t v9 = a1 + 232;
    while (1)
    {
      unint64_t v9 = *(unsigned __int8 **)v9;
      if (!v9) {
        break;
      }
      if (*((_DWORD *)v9 + 8) == *(unsigned __int16 *)(a2 + 6))
      {
        if (maxlog >= 3)
        {
          coap_session_str((uint64_t)a1);
          coap_log_impl(3, "**  %s: tid=%d: already in-use - dropped\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(a2 + 6));
        }
        return -1;
      }
    }
    uint64_t v10 = coap_new_node();
    if (!v10) {
      return -1;
    }
    uint64_t v4 = v10;
    *((_DWORD *)v10 + _Block_object_dispose(&a9, 8) = *(unsigned __int16 *)(a2 + 6);
    *((void *)v10 + 5) = a2;
    if (!*(unsigned char *)a2 && *a1 - 1 <= 1)
    {
      unsigned __int8 __buf = 0;
      arc4random_buf(&__buf, 1uLL);
      *((_DWORD *)v4 + 5) = coap_calc_timeout(a1, __buf);
    }
  }
  *(void *)uint64_t v4 = 0;
  ssize_t v5 = a1 + 232;
  for (uint64_t i = (void *)*((void *)a1 + 29); i; uint64_t i = (void *)*i)
    ssize_t v5 = i;
  *ssize_t v5 = v4;
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "** %s: tid=%d: delayed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v4 + 8));
  }
  return -3;
}

void coap_session_send_csm(unsigned __int8 *a1)
{
  if (*a1 - 5 <= 0xFFFFFFFD) {
    __assert_rtn("coap_session_send_csm", "coap_session.c", 291, "COAP_PROTO_RELIABLE(session->proto)");
  }
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: sending CSM\n", (const char *)&coap_session_str_szSession);
  }
  a1[2] = 3;
  *((void *)a1 + 30) = 0;
  if (!*((_DWORD *)a1 + 3)) {
    *((_DWORD *)a1 + 3) = 1152;
  }
  int v2 = coap_pdu_init(0, 0xE1u, 0, 0x10uLL);
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    unsigned int v4 = coap_encode_var_safe((uint64_t)v5, 0x800100u);
    if (!coap_add_option(v3, 2u, v4, v5)
      || !coap_pdu_encode_header(v3, *a1)
      || coap_session_send_pdu(a1, v3) != *(void *)(v3 + 24) + *(unsigned __int8 *)(v3 + 3))
    {
      coap_session_disconnected(a1, 1);
    }
    coap_delete_pdu((void *)v3);
  }
  else
  {
    coap_session_disconnected(a1, 1);
  }
}

void coap_session_disconnected(unsigned __int8 *a1, int a2)
{
  int v4 = a1[2];
  if (maxlog >= 7)
  {
    coap_session_str((uint64_t)a1);
    coap_log_impl(7, "***%s: session disconnected (reason %d)\n", (const char *)&coap_session_str_szSession, a2);
  }
  uint64_t v5 = *(void *)(*((void *)a1 + 26) + 16);
  while (v5)
  {
    id v7 = (void **)(v5 + 128);
    uint64_t v6 = *(void **)(v5 + 128);
    uint64_t v5 = *(void *)(v5 + 80);
    if (v6)
    {
      do
      {
        uint64_t v8 = (void *)*v6;
        if ((unsigned __int8 *)v6[1] == a1)
        {
          unint64_t v9 = *v7;
          uint64_t v10 = v7;
          if (*v7 == v6) {
            goto LABEL_13;
          }
          do
          {
            uint64_t v10 = v9;
            unint64_t v9 = (void *)*v9;
            if (v9) {
              BOOL v11 = v9 == v6;
            }
            else {
              BOOL v11 = 1;
            }
          }
          while (!v11);
          if (v9) {
LABEL_13:
          }
            *uint64_t v10 = v8;
          coap_session_release((uint64_t)a1);
          uint64_t v12 = (void *)v6[6];
          if (v12) {
            free(v12);
          }
          free(v6);
        }
        uint64_t v6 = v8;
      }
      while (v8);
    }
  }
  int v13 = *a1;
  if (*((void *)a1 + 27)) {
    *((void *)a1 + 27) = 0;
  }
  a1[2] = 4 * (v13 == 1);
  a1[226] = 0;
  uint64_t v14 = (void *)*((void *)a1 + 33);
  if (v14)
  {
    coap_delete_pdu(v14);
    *((void *)a1 + 33) = 0;
  }
  *((void *)a1 + 32) = 0;
  for (uint64_t i = *((void *)a1 + 29); i; uint64_t i = *((void *)a1 + 29))
  {
    *((void *)a1 + 29) = *(void *)i;
    *(void *)uint64_t i = 0;
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, "** %s: tid=%d: not transmitted after disconnect\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(i + 32));
    }
    if (**(unsigned char **)(i + 40)) {
      goto LABEL_27;
    }
    int v16 = *a1;
    if (v16 == 1)
    {
      if (a2 != 4) {
        goto LABEL_37;
      }
    }
    else if (a2 != 4 || v16 != 2)
    {
      goto LABEL_37;
    }
    if ((coap_wait_ack(*((void *)a1 + 26), (uint64_t)a1, i) & 0x80000000) == 0) {
      continue;
    }
    if (!**(unsigned char **)(i + 40))
    {
LABEL_37:
      uint64_t v17 = *(void (**)(void))(*((void *)a1 + 26) + 80);
      if (v17) {
        v17();
      }
    }
LABEL_27:
    coap_delete_node((void **)i);
  }
  if (a2 != 4)
  {
    uint64_t v18 = *((void *)a1 + 26);
    uint64_t v19 = *(void **)(v18 + 48);
    if (v19)
    {
      while (1)
      {
        uint64_t v20 = (void *)*v19;
        if ((unsigned __int8 *)v19[3] != a1) {
          break;
        }
        *(void *)(v18 + 4_Block_object_dispose(&a9, 8) = v20;
        if (maxlog >= 7)
        {
          coap_session_str((uint64_t)a1);
          coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v19 + 8));
        }
        if (!*(unsigned char *)v19[5])
        {
          int v21 = *(void (**)(uint64_t, unsigned __int8 *))(v18 + 80);
          if (v21) {
            v21(v18, a1);
          }
        }
        coap_delete_node((void **)v19);
        uint64_t v19 = *(void **)(v18 + 48);
        if (!v19) {
          goto LABEL_59;
        }
      }
      if (v20)
      {
        do
        {
          if ((unsigned __int8 *)v20[3] == a1)
          {
            *uint64_t v19 = *v20;
            if (maxlog >= 7)
            {
              coap_session_str((uint64_t)a1);
              coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v20 + 8));
            }
            if (!*(unsigned char *)v20[5])
            {
              __int16 v22 = *(void (**)(uint64_t, unsigned __int8 *))(v18 + 80);
              if (v22) {
                v22(v18, a1);
              }
            }
            coap_delete_node((void **)v20);
          }
          else
          {
            uint64_t v19 = v20;
          }
          uint64_t v20 = (void *)*v19;
        }
        while (*v19);
      }
    }
  }
LABEL_59:
  if (*a1 - 3 <= 1)
  {
    if (*((_WORD *)a1 + 90))
    {
      int v23 = *((_DWORD *)a1 + 44);
      if (v23 != -1)
      {
        *((void *)a1 + 23) = 0;
        *((void *)a1 + 24) = 0;
        close(v23);
        *((_DWORD *)a1 + 44) = -1;
      }
      *((_WORD *)a1 + 90) = 0;
      if (v4 == 1) {
        uint64_t v24 = 4099;
      }
      else {
        uint64_t v24 = 4098;
      }
      coap_handle_event(*((void *)a1 + 26), v24, (uint64_t)a1);
    }
    if (v4)
    {
      uint64_t v25 = *((void *)a1 + 26);
      if (v4 == 4) {
        uint64_t v26 = 8194;
      }
      else {
        uint64_t v26 = 8195;
      }
      coap_handle_event(v25, v26, (uint64_t)a1);
    }
  }
}

void coap_session_connected(unsigned __int8 *a1)
{
  int v2 = a1[2];
  if (v2 != 4)
  {
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, "***%s: session connected\n", (const char *)&coap_session_str_szSession);
      int v2 = a1[2];
    }
    if (v2 == 3) {
      coap_handle_event(*((void *)a1 + 26), 8193, (uint64_t)a1);
    }
  }
  a1[2] = 4;
  *((void *)a1 + 30) = 0;
  if (*a1 == 2)
  {
    *((_DWORD *)a1 + 2) = 0;
    if (!*((_DWORD *)a1 + 3) && maxlog >= 3) {
      coap_log_impl(3, "DTLS overhead exceeds MTU\n");
    }
  }
  uint64_t v4 = *((void *)a1 + 29);
  if (v4)
  {
    while (a1[2] == 4)
    {
      uint64_t v5 = *(unsigned char **)(v4 + 40);
      if (!*v5 && *a1 - 1 <= 1)
      {
        if (a1[226]) {
          return;
        }
        a1[226] = 1;
      }
      *((void *)a1 + 29) = *(void *)v4;
      *(void *)uint64_t v4 = 0;
      if (maxlog >= 7)
      {
        coap_session_str((uint64_t)a1);
        coap_log_impl(7, "** %s: tid=%d: transmitted after delay\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(*(void *)(v4 + 40) + 6));
        uint64_t v5 = *(unsigned char **)(v4 + 40);
      }
      uint64_t v6 = coap_session_send_pdu(a1, (uint64_t)v5);
      unsigned __int8 v7 = *a1 - 1;
      if (**(unsigned char **)(v4 + 40)) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = (*a1 - 1) > 1u;
      }
      if (!v8)
      {
        if ((int)coap_wait_ack(*((void *)a1 + 26), (uint64_t)a1, v4) >= 0) {
          uint64_t v4 = 0;
        }
        unsigned __int8 v7 = *a1 - 1;
      }
      if (v7 > 1u)
      {
        if (v6 < 1)
        {
          *(void *)uint64_t v4 = *((void *)a1 + 29);
          *((void *)a1 + 29) = v4;
          return;
        }
        if (v6 < *(void *)(*(void *)(v4 + 40) + 24)
                + (unint64_t)*(unsigned __int8 *)(*(void *)(v4 + 40) + 3))
        {
          *(void *)uint64_t v4 = *((void *)a1 + 29);
          *((void *)a1 + 29) = v4;
          *((void *)a1 + 30) = v6;
          return;
        }
        coap_delete_node((void **)v4);
      }
      else
      {
        if (v4) {
          coap_delete_node((void **)v4);
        }
        if (v6 < 0) {
          return;
        }
      }
      uint64_t v4 = *((void *)a1 + 29);
      if (!v4) {
        return;
      }
    }
  }
}

char *coap_make_session(int a1, char a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, int a6, uint64_t a7, uint64_t a8)
{
  int v16 = (char *)malloc_type_malloc(0x178uLL, 0x9D9A23A2uLL);
  uint64_t v17 = v16;
  if (!v16) {
    return v17;
  }
  *((void *)v16 + 46) = 0;
  *(_OWORD *)(v16 + 242) = 0u;
  *(_OWORD *)(v16 + 226) = 0u;
  *(_OWORD *)(v16 + 210) = 0u;
  *(_OWORD *)(v16 + 194) = 0u;
  *(_OWORD *)(v16 + 17_Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)(v16 + 162) = 0u;
  *(_OWORD *)(v16 + 146) = 0u;
  *(_OWORD *)(v16 + 130) = 0u;
  *(_OWORD *)(v16 + 114) = 0u;
  *(_OWORD *)(v16 + 9_Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)(v16 + 82) = 0u;
  *(_OWORD *)(v16 + 66) = 0u;
  *(_OWORD *)(v16 + 50) = 0u;
  *(_OWORD *)(v16 + 34) = 0u;
  *(_OWORD *)(v16 + 1_Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)(v16 + 2) = 0u;
  *(_OWORD *)(v16 + 33_Block_object_dispose(&a9, 8) = 0u;
  *(_OWORD *)(v16 + 354) = 0u;
  *(_OWORD *)(v16 + 306) = 0u;
  *(_OWORD *)(v16 + 322) = 0u;
  *(_OWORD *)(v16 + 274) = 0u;
  *(_OWORD *)(v16 + 290) = 0u;
  *(_OWORD *)(v16 + 25_Block_object_dispose(&a9, 8) = 0u;
  char *v16 = a1;
  v16[1] = a2;
  if (a3)
  {
    *((_OWORD *)v16 + 1) = 0uLL;
    *((_OWORD *)v16 + 2) = 0uLL;
    *((_DWORD *)v16 + 4) = *a3;
    uint64_t v18 = a3 + 1;
    int v19 = *((unsigned __int8 *)a3 + 5);
    if (v19 == 2)
    {
      *(_OWORD *)(v16 + 20) = *v18;
      if (!a4) {
        goto LABEL_15;
      }
    }
    else if (v19 == 30)
    {
      v16[21] = 30;
      *(_OWORD *)(v16 + 2_Block_object_dispose(&a9, 8) = *(_OWORD *)(a3 + 3);
      *((_WORD *)v16 + 11) = *((_WORD *)a3 + 3);
      *((_DWORD *)v16 + 11) = a3[7];
      if (!a4) {
        goto LABEL_15;
      }
    }
    else
    {
      memcpy(v16 + 20, v18, *a3);
      if (!a4) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    *(void *)(v16 + 2_Block_object_dispose(&a9, 8) = 0;
    *(void *)(v16 + 20) = 0;
    *((_DWORD *)v16 + 11) = 0;
    *(void *)(v16 + 36) = 0;
    *((_DWORD *)v16 + 4) = 28;
    if (!a4)
    {
LABEL_15:
      *(void *)(v17 + 14_Block_object_dispose(&a9, 8) = 0;
      *(void *)(v17 + 140) = 0;
      *((_DWORD *)v17 + 41) = 0;
      *(void *)(v17 + 156) = 0;
      *((_DWORD *)v17 + 34) = 28;
      if (!a5) {
        goto LABEL_22;
      }
LABEL_18:
      *(_OWORD *)(v17 + 104) = 0u;
      *(_OWORD *)(v17 + 120) = 0u;
      *((_DWORD *)v17 + 26) = *a5;
      __int16 v22 = a5 + 1;
      int v23 = *((unsigned __int8 *)a5 + 5);
      if (v23 == 2)
      {
        *(_OWORD *)(v17 + 10_Block_object_dispose(&a9, 8) = *v22;
      }
      else if (v23 == 30)
      {
        v17[109] = 30;
        *(_OWORD *)(v17 + 116) = *(_OWORD *)(a5 + 3);
        *((_WORD *)v17 + 55) = *((_WORD *)a5 + 3);
        *((_DWORD *)v17 + 33) = a5[7];
      }
      else
      {
        memcpy(v17 + 108, v22, *a5);
      }
      goto LABEL_25;
    }
  }
  *(_OWORD *)(v17 + 136) = 0u;
  *(_OWORD *)(v17 + 152) = 0u;
  *((_DWORD *)v17 + 34) = *a4;
  uint64_t v20 = a4 + 1;
  int v21 = *((unsigned __int8 *)a4 + 5);
  if (v21 == 2)
  {
    *(_OWORD *)(v17 + 140) = *v20;
    if (a5) {
      goto LABEL_18;
    }
  }
  else if (v21 == 30)
  {
    v17[141] = 30;
    *(_OWORD *)(v17 + 14_Block_object_dispose(&a9, 8) = *(_OWORD *)(a4 + 3);
    *((_WORD *)v17 + 71) = *((_WORD *)a4 + 3);
    *((_DWORD *)v17 + 41) = a4[7];
    if (a5) {
      goto LABEL_18;
    }
  }
  else
  {
    memcpy(v17 + 140, v20, *a4);
    if (a5) {
      goto LABEL_18;
    }
  }
LABEL_22:
  *(void *)(v17 + 116) = 0;
  *(void *)(v17 + 10_Block_object_dispose(&a9, 8) = 0;
  *((_DWORD *)v17 + 33) = 0;
  *(void *)(v17 + 124) = 0;
  *((_DWORD *)v17 + 26) = 28;
LABEL_25:
  *((_DWORD *)v17 + 42) = a6;
  *((void *)v17 + 25) = a8;
  *((void *)v17 + 26) = a7;
  if (a8)
  {
    unsigned int v24 = *(unsigned __int16 *)(a8 + 18);
    *((_DWORD *)v17 + 3) = v24;
    if (a1 == 2)
    {
      *((_DWORD *)v17 + 2) = 29;
      if (v24 <= 0x1D)
      {
        *((_DWORD *)v17 + 2) = v24;
        if (maxlog >= 3) {
          coap_log_impl(3, "DTLS overhead exceeds MTU\n");
        }
      }
    }
  }
  else
  {
    *((_DWORD *)v17 + 3) = 1152;
    if (a1 == 2) {
      *((_DWORD *)v17 + 2) = 29;
    }
  }
  *((_DWORD *)v17 + 8_Block_object_dispose(&a9, 8) = 4;
  *(void *)(v17 + 356) = 0x1F4000100000002;
  *((_DWORD *)v17 + 92) = -1;
  *((_DWORD *)v17 + 57) = -1;
  arc4random_buf(v17 + 224, 2uLL);
  return v17;
}

uint64_t coap_get_log_level()
{
  return maxlog;
}

uint64_t coap_set_log_level(uint64_t result)
{
  maxlog = result;
  return result;
}

size_t coap_print_addr(uint64_t a1, char *__dst, unint64_t a3)
{
  size_t v3 = a3;
  int v6 = *(unsigned __int8 *)(a1 + 5);
  if (v6 == 30)
  {
    if (a3 < 7) {
      return 0;
    }
    *__dst = 91;
    uint64_t v10 = __dst + 1;
    unsigned __int8 v7 = (const void *)(a1 + 12);
    int v8 = *(unsigned __int8 *)(a1 + 5);
    unint64_t v9 = 46;
LABEL_6:
    unsigned int v11 = *(unsigned __int16 *)(a1 + 6);
    if (v9 >= a3) {
      socklen_t v12 = a3;
    }
    else {
      socklen_t v12 = v9;
    }
    if (inet_ntop(v8, v7, v10, v12))
    {
      int v13 = &v10[strnlen(v10, v3)];
      if (*(unsigned char *)(a1 + 5) != 30) {
        return &__dst[v3] - &v13[snprintf(v13, &__dst[v3] - v13 + 1, ":%d", bswap32(v11) >> 16)];
      }
      if (v13 < &__dst[v3])
      {
        *v13++ = 93;
        return &__dst[v3] - &v13[snprintf(v13, &__dst[v3] - v13 + 1, ":%d", bswap32(v11) >> 16)];
      }
    }
    else
    {
      perror("coap_print_addr");
    }
    return 0;
  }
  if (v6 == 2)
  {
    unsigned __int8 v7 = (const void *)(a1 + 8);
    int v8 = 2;
    unint64_t v9 = 16;
    uint64_t v10 = __dst;
    goto LABEL_6;
  }
  if (a3 >= 0x16) {
    size_t v3 = 22;
  }
  memcpy(__dst, "(unknown address type)", v3);
  return v3;
}

unsigned __int8 *coap_show_pdu(unsigned __int8 *result)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (maxlog < 7) {
    return result;
  }
  uint64_t v1 = (uint64_t)result;
  unsigned int v2 = *result;
  if (v2 >= 4) {
    unsigned int v2 = 4;
  }
  size_t v3 = msg_type_string_types[v2];
  unint64_t v4 = result[1];
  if (v4 > 7)
  {
    if ((v4 - 224) > 5)
    {
      uint64_t v5 = msg_code_string_buf;
      snprintf(msg_code_string_buf, 5uLL, "%u.%02u", v4 >> 5, v4 & 0x1F);
    }
    else
    {
      uint64_t v5 = msg_code_string_signals[(v4 - 224)];
    }
  }
  else
  {
    uint64_t v5 = msg_code_string_methods[v4];
  }
  uint64_t v86 = 0;
  memset(v85, 0, sizeof(v85));
  snprintf(__str, 0x808uLL, "v:%d t:%s c:%s i:%04x {", 1, v3, v5, *(unsigned __int16 *)(v1 + 6));
  if (*(unsigned char *)(v1 + 4))
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = strlen(__str);
      snprintf(&__str[v7], 2056 - v7, "%02x", *(unsigned __int8 *)(*(void *)(v1 + 40) + v6++));
    }
    while (v6 < *(unsigned __int8 *)(v1 + 4));
  }
  int v8 = strlen(__str);
  snprintf(&__str[v8], 2056 - v8, "}");
  coap_option_iterator_init(v1, (uint64_t)v85, 0);
  int v9 = strlen(__str);
  snprintf(&__str[v9], 2056 - v9, " [");
  int v10 = -1;
  for (char i = 1; ; char i = 0)
  {
    socklen_t v12 = coap_option_next((uint64_t)v85);
    if (!v12) {
      break;
    }
    int v13 = v12;
    if ((i & 1) == 0)
    {
      int v14 = strlen(__str);
      snprintf(&__str[v14], 2056 - v14, ",");
    }
    int v15 = 0;
    switch(*(unsigned char *)(v1 + 1))
    {
      case 0xE1:
        if (WORD4(v85[0]) != 2) {
          goto LABEL_35;
        }
        int v16 = coap_opt_value(v13);
        unsigned int v17 = coap_opt_length(v13);
        int v18 = 0;
        if (v17)
        {
          uint64_t v19 = v17;
          do
          {
            int v20 = *v16++;
            int v18 = v20 | (v18 << 8);
            --v19;
          }
          while (v19);
        }
        goto LABEL_39;
      case 0xE2:
      case 0xE3:
        goto LABEL_46;
      case 0xE4:
        if (WORD4(v85[0]) != 4)
        {
          if (WORD4(v85[0]) == 2)
          {
            __int16 v27 = coap_opt_value(v13);
            uint64_t v28 = coap_opt_length(v13);
            uint64_t v29 = v27;
            int v30 = 0;
LABEL_45:
            int v15 = print_readable(v29, v28, v88, v30);
          }
          else
          {
LABEL_35:
            int v15 = 0;
          }
          goto LABEL_46;
        }
        long long v36 = coap_opt_value(v13);
        unsigned int v37 = coap_opt_length(v13);
        int v38 = 0;
        if (v37)
        {
          uint64_t v39 = v37;
          do
          {
            int v40 = *v36++;
            int v38 = v40 | (v38 << 8);
            --v39;
          }
          while (v39);
        }
LABEL_39:
        int v41 = snprintf(v88, 0x400uLL, "%u");
        goto LABEL_40;
      case 0xE5:
        if (WORD4(v85[0]) != 2) {
          goto LABEL_35;
        }
        id v31 = coap_opt_value(v13);
        unsigned int v32 = coap_opt_length(v13);
        int v33 = 0;
        if (v32)
        {
          uint64_t v34 = v32;
          do
          {
            int v35 = *v31++;
            int v33 = v35 | (v33 << 8);
            --v34;
          }
          while (v34);
        }
        goto LABEL_39;
      default:
        int v21 = 0;
        switch(WORD4(v85[0]))
        {
          case 6:
          case 7:
          case 0xE:
          case 0x1C:
            goto LABEL_23;
          case 8:
          case 0xB:
          case 0xF:
          case 0x14:
          case 0x23:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0xD:
          case 0x10:
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x15:
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1D:
          case 0x1E:
          case 0x1F:
          case 0x20:
          case 0x21:
          case 0x22:
            goto LABEL_43;
          case 0xC:
            uint64_t v56 = coap_opt_value(v13);
            unsigned int v57 = coap_opt_length(v13);
            int v10 = 0;
            if (v57)
            {
              uint64_t v58 = v57;
              do
              {
                int v59 = *v56++;
                int v10 = v59 | (v10 << 8);
                --v58;
              }
              while (v58);
            }
            uint64_t v60 = 0;
            v61 = &print_content_format_formats;
            break;
          case 0x17:
          case 0x1B:
            coap_opt_block_num(v13);
            if (coap_opt_length(v13))
            {
              coap_opt_length(v13);
              coap_opt_value(v13);
              coap_opt_length(v13);
            }
            if (coap_opt_length(v13))
            {
              coap_opt_length(v13);
              coap_opt_value(v13);
              coap_opt_length(v13);
            }
            int v41 = snprintf(v88, 0x400uLL, "%u/%c/%u");
            goto LABEL_40;
          default:
            if (WORD4(v85[0]) == 3) {
              goto LABEL_44;
            }
            if (WORD4(v85[0]) == 60)
            {
LABEL_23:
              __int16 v22 = coap_opt_value(v13);
              unsigned int v23 = coap_opt_length(v13);
              int v24 = 0;
              if (v23)
              {
                uint64_t v25 = v23;
                do
                {
                  int v26 = *v22++;
                  int v24 = v26 | (v24 << 8);
                  --v25;
                }
                while (v25);
              }
              goto LABEL_39;
            }
LABEL_43:
            int v21 = 1;
LABEL_44:
            uint64_t v42 = coap_opt_value(v13);
            uint64_t v28 = coap_opt_length(v13);
            uint64_t v29 = v42;
            int v30 = v21;
            goto LABEL_45;
        }
        break;
    }
    while (1)
    {
      int v62 = *v61;
      v61 += 4;
      if (v62 == v10) {
        break;
      }
      if (++v60 == 24)
      {
        int v41 = snprintf(v88, 0x400uLL, "%d");
        goto LABEL_40;
      }
    }
    int v41 = snprintf(v88, 0x400uLL, "%s");
LABEL_40:
    int v15 = v41;
LABEL_46:
    int v43 = strlen(__str);
    int v44 = *(unsigned __int8 *)(v1 + 1);
    if (v44 == 225)
    {
      uint64_t v45 = 0;
      char v46 = 1;
      while (1)
      {
        char v47 = v46;
        if ((unsigned __int16)msg_option_string_options_csm[8 * v45] == WORD4(v85[0])) {
          break;
        }
        char v46 = 0;
        uint64_t v45 = 1;
        if ((v47 & 1) == 0) {
          goto LABEL_63;
        }
      }
      uint64_t v49 = &msg_option_string_options_csm[8 * v45];
LABEL_54:
      uint64_t v48 = (const char *)*((void *)v49 + 1);
      goto LABEL_64;
    }
    if ((v44 & 0xFE) == 0xE2)
    {
      uint64_t v48 = "Custody";
    }
    else
    {
      if (v44 != 229)
      {
        if (v44 == 228)
        {
          uint64_t v50 = 0;
          char v51 = 1;
          while (1)
          {
            char v52 = v51;
            if ((unsigned __int16)msg_option_string_options_release[8 * v50] == WORD4(v85[0])) {
              break;
            }
            char v51 = 0;
            uint64_t v50 = 1;
            if ((v52 & 1) == 0) {
              goto LABEL_63;
            }
          }
          uint64_t v49 = &msg_option_string_options_release[8 * v50];
        }
        else
        {
          uint64_t v53 = 0;
          unsigned __int8 v54 = msg_option_string_options;
          while (1)
          {
            int v55 = (unsigned __int16)*v54;
            v54 += 8;
            if (v55 == WORD4(v85[0])) {
              break;
            }
            if (++v53 == 20) {
              goto LABEL_63;
            }
          }
          uint64_t v49 = &msg_option_string_options[8 * v53];
        }
        goto LABEL_54;
      }
      uint64_t v48 = "Bad-CSM-Option";
    }
    if (WORD4(v85[0]) != 2)
    {
LABEL_63:
      uint64_t v48 = msg_option_string_buf;
      snprintf(msg_option_string_buf, 6uLL, "%u", WORD4(v85[0]));
    }
LABEL_64:
    snprintf(&__str[v43], 2056 - v43, " %s:%.*s", v48, v15, v88);
  }
  int v63 = strlen(__str);
  snprintf(&__str[v63], 2056 - v63, " ]");
  uint64_t v64 = *(unsigned __int8 **)(v1 + 48);
  char v65 = (FILE **)MEMORY[0x1E4F143D8];
  if (v64)
  {
    uint64_t v66 = *(void *)(v1 + 24) - (void)v64 + *(void *)(v1 + 40);
    int v67 = strlen(__str);
    snprintf(&__str[v67], 2056 - v67, " :: ");
    if ((v10 + 1) <= 0x33 && ((1 << (v10 + 1)) & 0x8060000000003) != 0)
    {
      if (print_readable(v64, v66, v88, 0))
      {
        int v68 = strlen(__str);
        if (snprintf(&__str[v68], 2056 - v68, "'%s'", v88) >= 2056 - v68) {
          __str[2055] = 0;
        }
      }
    }
    else
    {
      int v69 = strlen(__str);
      snprintf(&__str[v69], 2056 - v69, "binary data length %zu\n", v66);
      fputs(__str, *v65);
      strcpy(__str, "<<");
      if (v66)
      {
        uint64_t v70 = v66;
        v71 = v64;
        do
        {
          --v70;
          int v72 = strlen(__str);
          int v73 = *v71++;
          snprintf(&__str[v72], 2056 - v72, "%02x", v73);
        }
        while (v70);
      }
      int v74 = strlen(__str);
      snprintf(&__str[v74], 2056 - v74, ">>");
      uint64_t v75 = v66 << 32;
      int v76 = strlen(__str);
      snprintf(&__str[v76], 2056 - v76, "\n");
      fputs(__str, *v65);
      strcpy(__str, "<<");
      if (v75)
      {
        uint64_t v77 = v75 >> 32;
        uint64_t v78 = MEMORY[0x1E4F14390];
        do
        {
          int v79 = strlen(__str);
          unsigned int v80 = *v64;
          if ((v80 & 0x80) != 0) {
            int v81 = __maskrune(*v64, 0x40000uLL);
          }
          else {
            int v81 = *(_DWORD *)(v78 + 4 * *v64 + 60) & 0x40000;
          }
          --v77;
          if (v81) {
            uint64_t v82 = v80;
          }
          else {
            uint64_t v82 = 46;
          }
          snprintf(&__str[v79], 2056 - v79, "%c ", v82);
          ++v64;
        }
        while (v77);
      }
      int v83 = strlen(__str);
      snprintf(&__str[v83], 2056 - v83, ">>");
      char v65 = (FILE **)MEMORY[0x1E4F143D8];
    }
  }
  int v84 = strlen(__str);
  snprintf(&__str[v84], 2056 - v84, "\n");
  return (unsigned __int8 *)fputs(__str, *v65);
}

uint64_t print_readable(unsigned char *a1, uint64_t a2, unsigned char *a3, int a4)
{
  uint64_t v6 = a2;
  int v7 = a1;
  if (!a1 && a2) {
    __assert_rtn("print_readable", "coap_debug.c", 124, "data || len == 0");
  }
  uint64_t v8 = 0;
  if (a2)
  {
    uint64_t v9 = MEMORY[0x1E4F14390];
    do
    {
      if (!a4)
      {
        int v11 = (char)*v7;
        if (v11 < 0)
        {
          if (__maskrune(*v7, 0x40000uLL))
          {
LABEL_12:
            uint64_t v10 = v8 + 1;
            if ((unint64_t)(v8 + 1) > 0x3FF) {
              break;
            }
            *a3++ = v11;
            goto LABEL_14;
          }
        }
        else if ((*(_DWORD *)(v9 + 4 * *v7 + 60) & 0x40000) != 0)
        {
          goto LABEL_12;
        }
      }
      uint64_t v10 = v8 + 4;
      if ((unint64_t)(v8 + 4) > 0x3FF) {
        break;
      }
      *(_WORD *)a3 = 30812;
      a3[2] = a0123456789abcd_0[(unint64_t)*v7 >> 4];
      a3[3] = a0123456789abcd_0[*v7 & 0xF];
      a3 += 4;
LABEL_14:
      uint64_t v8 = v10;
      ++v7;
      --v6;
    }
    while (v6);
  }
  *a3 = 0;
  return v8;
}

void coap_log_impl(signed int a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (maxlog >= a1)
  {
    if (log_handler)
    {
      va_copy((va_list)v7, va);
      vsnprintf((char *)__str, 0x808uLL, __format, va);
      coapLogHandler(a1, (uint64_t)__str);
    }
    else
    {
      unint64_t v4 = (FILE **)MEMORY[0x1E4F143C8];
      if (a1 >= 3) {
        unint64_t v4 = (FILE **)MEMORY[0x1E4F143D8];
      }
      uint64_t v5 = *v4;
      __str[0].tv_sec = 0;
      *(void *)&__str[0].tv_usec = 0;
      gettimeofday(__str, 0);
      time_t v7 = coap_clock_offset
         + (1000 * (__str[0].tv_sec - coap_clock_offset)
          + ((unint64_t)((double)__str[0].tv_usec * 1.024 + 512.0) >> 10))
         / 0x3E8;
      uint64_t v6 = localtime(&v7);
      if (strftime((char *)__str, 0x20uLL, "%b %d %H:%M:%S", v6)) {
        fprintf(v5, "%s ", (const char *)__str);
      }
      if (a1 <= 9) {
        fprintf(v5, "%s ", loglevels[a1]);
      }
      vfprintf(v5, __format, va);
      fflush(v5);
    }
  }
}

unint64_t coap_opt_parse(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (!a1)
  {
    int v14 = "opt";
    goto LABEL_34;
  }
  if (!a3)
  {
    int v14 = "result";
LABEL_34:
    __assert_rtn("coap_opt_parse", "option.c", 39, v14);
  }
  if (!a2) {
    return 0;
  }
  int v3 = *a1 >> 4;
  *(_WORD *)a3 = v3;
  unint64_t v4 = *a1 & 0xF;
  *(void *)(a3 + _Block_object_dispose(&a9, 8) = v4;
  if (v3 == 13)
  {
    time_t v7 = a1;
LABEL_13:
    if (!--a2) {
      return 0;
    }
    __int16 v9 = v7[1];
    uint64_t v5 = v7 + 1;
    *(_WORD *)a3 = v3 + v9;
LABEL_15:
    if (v4 != 13)
    {
      if (v4 != 14)
      {
        if (v4 == 15)
        {
          if (maxlog >= 7) {
            coap_log_impl(7, "found reserved option length 15\n");
          }
          return 0;
        }
LABEL_24:
        socklen_t v12 = v5 + 1;
        *(void *)(a3 + 16) = v12;
        if (a2 - 1 < v4)
        {
          if (maxlog >= 7) {
            coap_log_impl(7, "invalid option length\n");
          }
          return 0;
        }
        return &v12[v4] - a1;
      }
      if (!--a2) {
        return 0;
      }
      unsigned int v10 = *++v5;
      unint64_t v4 = ((unint64_t)v10 << 8) + 269;
      *(void *)(a3 + _Block_object_dispose(&a9, 8) = v4;
    }
    if (!--a2) {
      return 0;
    }
    unsigned int v11 = *++v5;
    v4 += v11;
    *(void *)(a3 + _Block_object_dispose(&a9, 8) = v4;
    goto LABEL_24;
  }
  if (v3 == 14)
  {
    if (!--a2) {
      return 0;
    }
    time_t v7 = a1 + 1;
    int v8 = a1[1];
    LOWORD(v3) = ((_WORD)v8 << 8) + 269;
    *(_WORD *)a3 = v3;
    if (v8 == 255)
    {
      if (maxlog >= 7) {
        coap_log_impl(7, "delta too large\n");
      }
      return 0;
    }
    goto LABEL_13;
  }
  uint64_t v5 = a1;
  if (v3 != 15) {
    goto LABEL_15;
  }
  uint64_t v6 = 0;
  if (*a1 != 255 && maxlog >= 7)
  {
    coap_log_impl(7, "ignored reserved option delta 15\n");
    return 0;
  }
  return v6;
}

uint64_t coap_option_iterator_init(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (!result) {
    __assert_rtn("coap_option_iterator_init", "option.c", 112, "pdu");
  }
  if (!*(void *)(result + 40)) {
    __assert_rtn("coap_option_iterator_init", "option.c", 113, "pdu->token");
  }
  if (!a2) {
    __assert_rtn("coap_option_iterator_init", "option.c", 114, "oi");
  }
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v3 = *(unsigned __int8 *)(result + 4);
  *(void *)(a2 + 16) = *(void *)(result + 40) + v3;
  uint64_t v4 = *(void *)(result + 24);
  BOOL v5 = v4 <= v3;
  uint64_t v6 = v4 - v3;
  if (v5)
  {
    char v8 = 1;
  }
  else
  {
    *(void *)a2 = v6;
    if (!a3) {
      return result;
    }
    uint64_t v7 = *a3;
    *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 2);
    *(void *)(a2 + 24) = v7;
    char v8 = 2;
  }
  *(unsigned char *)(a2 + 10) = v8;
  return result;
}

unsigned __int8 *coap_option_next(uint64_t a1)
{
  if (!a1) {
    __assert_rtn("coap_option_next", "option.c", 152, "oi");
  }
  char v2 = *(unsigned char *)(a1 + 10);
  if ((v2 & 1) == 0)
  {
    if (*(void *)a1)
    {
      uint64_t v3 = *(unsigned __int8 **)(a1 + 16);
      if (v3)
      {
        memset(v9, 0, sizeof(v9));
        if (*v3 != 255)
        {
          while (1)
          {
            uint64_t v4 = *(unsigned __int8 **)(a1 + 16);
            unint64_t v5 = coap_opt_parse(v4, *(void *)a1, (uint64_t)v9);
            if (!v5) {
              break;
            }
            unint64_t v6 = *(void *)a1 - v5;
            if (*(void *)a1 < v5) {
              __assert_rtn("coap_option_next", "option.c", 167, "optsize <= oi->length");
            }
            *(void *)(a1 + 16) += v5;
            *(void *)a1 = v6;
            unsigned __int16 v7 = *(_WORD *)(a1 + 8) + LOWORD(v9[0]);
            *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = v7;
            if ((*(unsigned char *)(a1 + 10) & 2) == 0 || coap_option_filter_op((_WORD *)(a1 + 24), v7, 2)) {
              return v4;
            }
          }
          char v2 = *(unsigned char *)(a1 + 10);
        }
      }
    }
  }
  uint64_t v4 = 0;
  *(unsigned char *)(a1 + 10) = v2 | 1;
  return v4;
}

uint64_t coap_option_filter_op(_WORD *a1, unsigned int a2, int a3)
{
  int v3 = (unsigned __int16)*a1;
  if (a2 >= 0x100)
  {
    uint64_t v7 = 0;
    int v8 = 1;
    char v9 = 1;
    while (1)
    {
      char v10 = v9;
      if ((v8 & v3) != 0 && (unsigned __int16)a1[v7 + 1] == a2) {
        break;
      }
      char v9 = 0;
      int v8 = 2 * (unsigned __int16)v8;
      uint64_t v7 = 1;
      if ((v10 & 1) == 0)
      {
        int v6 = 3;
LABEL_12:
        if ((a3 - 1) < 2) {
          return 0;
        }
        unint64_t v11 = v6 & ~v3;
        if ((v6 & ~v3) == 0) {
          return 0;
        }
        int v12 = -1;
        do
        {
          int v13 = v12++;
          BOOL v14 = v11 > 1;
          v11 >>= 1;
        }
        while (v14);
        uint64_t v15 = (v13 + 2);
        if (a2 >= 0x100) {
          a1[v15] = a2;
        }
        else {
          *((unsigned char *)a1 + v15 + 3) = a2;
        }
        v3 |= 1 << v12;
        goto LABEL_25;
      }
    }
    if (a3 != 1) {
      return 1;
    }
    LOWORD(v3) = v3 & ~(_WORD)v8;
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = 4;
    while ((v5 & v3) == 0 || *((unsigned __int8 *)a1 + v4 + 6) != a2)
    {
      int v5 = (2 * v5) & 0x1FFF8;
      if (++v4 == 6)
      {
        int v6 = 252;
        goto LABEL_12;
      }
    }
    if (a3 != 1) {
      return 1;
    }
    LOWORD(v3) = v3 & ~(_WORD)v5;
  }
LABEL_25:
  *a1 = v3;
  return 1;
}

unsigned __int8 *coap_check_option(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  uint64_t v6 = 0;
  coap_option_filter_op(&v6, a2, 0);
  coap_option_iterator_init(a1, a3, &v6);
  return coap_option_next(a3);
}

uint64_t coap_opt_length(unsigned char *a1)
{
  char v1 = *a1;
  int v2 = *a1 & 0xF0;
  switch(v2)
  {
    case 208:
      goto LABEL_7;
    case 224:
      ++a1;
LABEL_7:
      ++a1;
      break;
    case 240:
      if (maxlog >= 7) {
        coap_log_impl(7, "illegal option delta\n");
      }
LABEL_13:
      LOWORD(v3) = 0;
      return (unsigned __int16)v3;
  }
  int v3 = v1 & 0xF;
  switch(v3)
  {
    case 13:
      uint64_t v4 = a1 + 1;
LABEL_16:
      LOWORD(v3) = v3 + *v4;
      return (unsigned __int16)v3;
    case 14:
      uint64_t v4 = a1 + 2;
      LOWORD(v3) = (a1[1] << 8) + 269;
      goto LABEL_16;
    case 15:
      if (maxlog >= 7) {
        coap_log_impl(7, "illegal option length\n");
      }
      goto LABEL_13;
  }
  return (unsigned __int16)v3;
}

unsigned char *coap_opt_value(unsigned char *a1)
{
  int v1 = *a1 & 0xF0;
  switch(v1)
  {
    case 208:
      uint64_t v2 = 2;
      break;
    case 224:
      uint64_t v2 = 3;
      break;
    case 240:
      if (maxlog >= 7) {
        coap_log_impl(7, "illegal option delta\n");
      }
      return 0;
    default:
      uint64_t v2 = 1;
      break;
  }
  int v3 = *a1 & 0xF;
  switch(v3)
  {
    case 13:
      return &a1[++v2];
    case 14:
      ++v2;
      return &a1[++v2];
    case 15:
      if (maxlog >= 7) {
        coap_log_impl(7, "illegal option length\n");
      }
      return 0;
  }
  return &a1[v2];
}

uint64_t coap_opt_block_num(unsigned char *a1)
{
  uint64_t result = coap_opt_length(a1);
  if (result)
  {
    if (result == 1
      || (int v3 = coap_opt_value(a1), v4 = coap_opt_length(a1), v5 = (v4 - 1), v4 == 1))
    {
      int v8 = 0;
    }
    else
    {
      int v6 = 0;
      do
      {
        int v7 = *v3++;
        int v6 = v7 | (v6 << 8);
        --v5;
      }
      while (v5);
      int v8 = 16 * v6;
    }
    coap_opt_length(a1);
    char v9 = coap_opt_value(a1);
    return v8 | (v9[coap_opt_length(a1) - 1] >> 4);
  }
  return result;
}

uint64_t coap_get_block(uint64_t result, uint64_t a2)
{
  if (!a2) {
    __assert_rtn("coap_get_block", "block.c", 40, "block");
  }
  *(void *)a2 = 0;
  if (result)
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    uint64_t result = (uint64_t)coap_check_option(result, 0x17u, (uint64_t)v8);
    if (result)
    {
      int v3 = (unsigned char *)result;
      if (coap_opt_length((unsigned char *)result))
      {
        coap_opt_length(v3);
        int v4 = coap_opt_value(v3);
        char v5 = 2 * (v4[coap_opt_length(v3) - 1] & 7);
      }
      else
      {
        char v5 = 0;
      }
      *(unsigned char *)(a2 + 4) = *(unsigned char *)(a2 + 4) & 0xF1 | v5;
      if (coap_opt_length(v3))
      {
        coap_opt_length(v3);
        int v6 = coap_opt_value(v3);
        if ((v6[coap_opt_length(v3) - 1] & 8) != 0) {
          *(unsigned char *)(a2 + 4) |= 1u;
        }
      }
      unsigned int v7 = coap_opt_block_num(v3);
      if (v7 >> 20)
      {
        return 0;
      }
      else
      {
        *(_DWORD *)a2 = v7;
        return 1;
      }
    }
  }
  return result;
}

uint64_t coap_encode_var_safe(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = -1;
  unsigned int v3 = a2;
  do
  {
    ++v2;
    if (v3 < 0x100) {
      break;
    }
    v3 >>= 8;
  }
  while (v2 < 3);
  uint64_t v4 = (v2 + 1);
  do
  {
    *(unsigned char *)(a1 + v2) = a2;
    a2 >>= 8;
  }
  while ((unint64_t)v2--);
  return v4;
}

void *coap_new_string(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(a1 + 17, 0x9D9A23A2uLL);
  unsigned int v3 = v2;
  if (v2)
  {
    *uint64_t v2 = 0;
    v2[1] = v2 + 2;
    *((unsigned char *)v2 + a1 + 16) = 0;
  }
  else if (maxlog >= 2)
  {
    coap_log_impl(2, "coap_new_string: malloc: failed\n");
  }
  return v3;
}

ssize_t coap_network_send(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  ++send_packet_count;
  if ((*(unsigned char *)(a1 + 4) & 4) == 0)
  {
    if (!a2) {
      __assert_rtn("coap_network_send", "coap_io.c", 870, "session");
    }
    v18[0] = a3;
    v18[1] = a4;
    memset(v19, 0, sizeof(v19));
    memset(&v17.msg_namelen, 0, 40);
    v17.msg_name = (void *)(a2 + 108);
    v17.msg_namelen = *(_DWORD *)(a2 + 104);
    v17.msg_iov = (iovec *)v18;
    v17.msg_iovlen = 1;
    int v5 = *(unsigned __int8 *)(a2 + 141);
    if (v5 == 30)
    {
      unint64_t v8 = bswap64(*MEMORY[0x1E4F148B8]);
      unint64_t v9 = bswap64(*(void *)(a2 + 148));
      if (v8 == v9
        && (unint64_t v8 = bswap64(*(void *)(MEMORY[0x1E4F148B8] + 8)), v9 = bswap64(*(void *)(a2 + 156)), v8 == v9))
      {
        int v6 = 0;
      }
      else if (v8 < v9)
      {
        int v6 = -1;
      }
      else
      {
        int v6 = 1;
      }
    }
    else
    {
      if (v5 != 2)
      {
        if (maxlog >= 4) {
          coap_log_impl(4, "protocol not supported\n");
        }
        goto LABEL_26;
      }
      int v6 = *(_DWORD *)(a2 + 144);
    }
    if (v6)
    {
      if (v5 == 2)
      {
        if ((*(_DWORD *)(a2 + 144) & 0xF0) != 0xE0)
        {
          v17.msg_control = v19;
          v17.msg_controllen = 24;
          *(void *)&v19[0] = 24;
          int v12 = *(_DWORD *)(a2 + 168);
          DWORD2(v19[0]) = 26;
          HIDWORD(v19[0]) = v12;
          int v11 = *(_DWORD *)(a2 + 144);
LABEL_24:
          LODWORD(v19[1]) = v11;
        }
      }
      else if (*(unsigned __int8 *)(a2 + 148) != 255)
      {
        if (*(_DWORD *)(a2 + 148) || *(_DWORD *)(a2 + 152) || *(_DWORD *)(a2 + 156) != -65536)
        {
          v17.msg_control = v19;
          v17.msg_controllen = 32;
          DWORD2(v19[0]) = 46;
          *(void *)&v19[0] = 0x2900000020;
          HIDWORD(v19[1]) = *(_DWORD *)(a2 + 168);
          *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)(a2 + 148);
          goto LABEL_26;
        }
        v17.msg_control = v19;
        v17.msg_controllen = 24;
        *(void *)&v19[0] = 24;
        int v10 = *(_DWORD *)(a2 + 168);
        DWORD2(v19[0]) = 26;
        HIDWORD(v19[0]) = v10;
        int v11 = *(_DWORD *)(a2 + 160);
        goto LABEL_24;
      }
    }
LABEL_26:
    ssize_t v7 = sendmsg(*(_DWORD *)a1, &v17, 0);
    goto LABEL_27;
  }
  ssize_t v7 = send(*(_DWORD *)a1, a3, a4, 0);
LABEL_27:
  ssize_t v13 = v7;
  if (v7 < 0 && maxlog >= 2)
  {
    BOOL v14 = __error();
    uint64_t v15 = strerror(*v14);
    coap_log_impl(2, "coap_network_send: %s\n", v15);
  }
  return v13;
}

uint64_t coap_network_read(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    __assert_rtn("coap_network_read", "coap_io.c", 1027, "sock");
  }
  if (!a2) {
    __assert_rtn("coap_network_read", "coap_io.c", 1028, "packet");
  }
  __int16 v4 = *(_WORD *)(a1 + 4);
  if ((v4 & 0x100) == 0) {
    return -1;
  }
  *(_WORD *)(a1 + 4) = v4 & 0xFEFF;
  if ((v4 & 4) != 0)
  {
    ssize_t v15 = recv(*(_DWORD *)a1, (void *)(a2 + 80), 0x1000uLL, 0);
    if ((v15 & 0x8000000000000000) == 0)
    {
      ssize_t v5 = v15;
      if (v15) {
        *(void *)(a2 + 72) = v15;
      }
      return v5;
    }
    int v16 = __error();
    int v17 = maxlog;
    if (*v16 == 61)
    {
      if (maxlog >= 4) {
        coap_log_impl(4, "coap_network_read: unreachable\n");
      }
      return -2;
    }
LABEL_38:
    if (v17 >= 4)
    {
      int v18 = __error();
      uint64_t v19 = strerror(*v18);
      coap_log_impl(4, "coap_network_read: %s\n", v19);
    }
    return -1;
  }
  v21[0] = a2 + 80;
  v21[1] = 4096;
  *(&v20.msg_namelen + 1) = 0;
  *(&v20.msg_iovlen + 1) = 0;
  v20.msg_name = (void *)(a2 + 4);
  v20.msg_namelen = 28;
  v20.msg_iov = (iovec *)v21;
  v20.msg_iovlen = 1;
  v20.msg_control = &v22;
  v20.msg_flags = 0;
  v20.uint64_t msg_controllen = 32;
  uint64_t v22 = -4294967252;
  int v23 = -1;
  ssize_t v7 = recvmsg(*(_DWORD *)a1, &v20, 0);
  if (v7 < 0)
  {
    if (*__error() == 61) {
      return 0;
    }
    int v17 = maxlog;
    goto LABEL_38;
  }
  ssize_t v5 = v7;
  uint64_t msg_controllen = v20.msg_controllen;
  *(_DWORD *)a2 = v20.msg_namelen;
  *(void *)(a2 + 72) = v7;
  if (msg_controllen >= 0xC)
  {
    msg_control = (char *)v20.msg_control;
    if (v20.msg_control)
    {
      int v10 = (unsigned int *)v20.msg_control;
      do
      {
        unsigned int v11 = v10[1];
        if (v11 != -1)
        {
          if (v11)
          {
            if (v11 == 41)
            {
              unsigned int v12 = v10[2];
              if (v12 == 46)
              {
                *(_DWORD *)(a2 + 64) = v10[7];
                *(_OWORD *)(a2 + 44) = *(_OWORD *)(v10 + 3);
                return v5;
              }
            }
            else
            {
              unsigned int v12 = v10[2];
            }
          }
          else
          {
            unsigned int v12 = v10[2];
            if (v12 == 26)
            {
              *(_DWORD *)(a2 + 64) = v10[3];
              if (*(unsigned char *)(a2 + 37) == 30)
              {
                *(void *)(a2 + 44) = 0;
                *(_DWORD *)(a2 + 52) = -65536;
                *(_DWORD *)(a2 + 56) = v10[5];
              }
              else
              {
                *(_DWORD *)(a2 + 40) = v10[5];
              }
              return v5;
            }
          }
          if (v12 != -1 && maxlog >= 7)
          {
            coap_log_impl(7, "cmsg_level = %d and cmsg_nw_endpoint_type_t type = %d not supported - fix\n", v10[1], v12);
            msg_control = (char *)v20.msg_control;
            uint64_t msg_controllen = v20.msg_controllen;
          }
        }
        int v10 = (unsigned int *)((char *)v10 + ((*v10 + 3) & 0x1FFFFFFFCLL));
      }
      while (v10 + 3 <= (unsigned int *)&msg_control[msg_controllen]);
    }
  }
  int v14 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 64) = *(_DWORD *)a1;
  if (getsockname(v14, (sockaddr *)(a2 + 36), (socklen_t *)(a2 + 32)) < 0 && maxlog >= 7) {
    coap_log_impl(7, "Cannot determine local port\n");
  }
  return v5;
}

unsigned __int8 *coap_pdu_init(unsigned __int8 a1, unsigned __int8 a2, __int16 a3, unint64_t a4)
{
  unint64_t v8 = (unsigned __int8 *)malloc_type_malloc(0x38uLL, 0x9D9A23A2uLL);
  unint64_t v9 = v8;
  if (v8)
  {
    _OWORD v8[2] = 6;
    uint64_t v10 = 256;
    if (a4 < 0x100) {
      uint64_t v10 = a4;
    }
    *((void *)v8 + 2) = v10;
    unsigned int v11 = (char *)malloc_type_malloc(v10 + 6, 0x9D9A23A2uLL);
    if (v11)
    {
      unint64_t v12 = v9[2];
      *((void *)v9 + 5) = &v11[v12];
      if (v12 <= 3) {
        __assert_rtn("coap_pdu_clear", "pdu.c", 37, "pdu->max_hdr_size >= COAP_PDU_MAX_UDP_HEADER_SIZE");
      }
      if (*((void *)v9 + 2) > a4) {
        *((void *)v9 + 2) = a4;
      }
      *(_WORD *)(v9 + 3) = 0;
      *((_WORD *)v9 + 4) = 0;
      *((void *)v9 + 3) = 0;
      *((void *)v9 + 4) = a4;
      *((void *)v9 + 6) = 0;
      *((_WORD *)v9 + 3) = a3;
      unsigned __int8 *v9 = a1;
      v9[1] = a2;
    }
    else
    {
      free(v9);
      return 0;
    }
  }
  return v9;
}

void coap_delete_pdu(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1[5];
    if (v2) {
      free((void *)(v2 - *((unsigned __int8 *)a1 + 2)));
    }
    free(a1);
  }
}

uint64_t coap_pdu_resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 16) >= a2) {
    goto LABEL_17;
  }
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    BOOL v5 = v4 >= a2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    unint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      unint64_t v8 = v7 - v6;
      if (v7 <= v6) {
        __assert_rtn("coap_pdu_resize", "pdu.c", 152, "pdu->data > pdu->token");
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    unint64_t v9 = (char *)malloc_type_realloc((void *)(v6 - *(unsigned __int8 *)(a1 + 2)), *(unsigned __int8 *)(a1 + 2) + a2, 0xDE4B050DuLL);
    if (!v9)
    {
      if (maxlog >= 4) {
        coap_log_impl(4, "coap_pdu_resize: realloc failed\n");
      }
      return 0;
    }
    uint64_t v10 = &v9[*(unsigned __int8 *)(a1 + 2)];
    unsigned int v11 = &v10[v8];
    if (!v8) {
      unsigned int v11 = 0;
    }
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = v11;
LABEL_17:
    *(void *)(a1 + 16) = a2;
    return 1;
  }
  if (maxlog >= 4) {
    coap_log_impl(4, "coap_pdu_resize: pdu too big\n");
  }
  return 0;
}

uint64_t coap_add_token(uint64_t a1, unint64_t a2, const void *a3)
{
  uint64_t result = 0;
  if (a1 && a2 <= 8)
  {
    if (*(void *)(a1 + 24))
    {
      if (maxlog >= 4) {
        coap_log_impl(4, "coap_add_token: The token must defined first. Token ignored\n");
      }
      return 0;
    }
    else
    {
      uint64_t result = coap_pdu_check_resize(a1, a2);
      if (result)
      {
        *(unsigned char *)(a1 + 4) = a2;
        if (a2) {
          memcpy(*(void **)(a1 + 40), a3, a2);
        }
        *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = 0;
        *(void *)(a1 + 24) = a2;
        uint64_t result = 1;
        *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = 0;
      }
    }
  }
  return result;
}

uint64_t coap_pdu_check_resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= a2) {
    return 1;
  }
  unint64_t v3 = 2 * v2;
  uint64_t v4 = 256;
  if (v3 > 0x100) {
    uint64_t v4 = v3;
  }
  do
  {
    unint64_t v5 = v4;
    v4 *= 2;
  }
  while (v5 < a2);
  unint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    BOOL v7 = v5 > v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    unint64_t v5 = *(void *)(a1 + 32);
    if (v6 < a2) {
      return 0;
    }
  }
  uint64_t result = coap_pdu_resize(a1, v5);
  if (result) {
    return 1;
  }
  return result;
}

unint64_t coap_add_option(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = 0;
  unsigned int v4 = *(unsigned __int16 *)(a1 + 8);
  BOOL v5 = a2 >= v4;
  unsigned __int16 v6 = a2 - v4;
  if (!v5)
  {
    if (maxlog >= 4) {
      coap_log_impl(4, "coap_add_option: options are not in correct order\n");
    }
    return 0;
  }
  __int16 v9 = a2;
  uint64_t v11 = 2;
  if (v6 >= 0x10Du) {
    uint64_t v11 = 3;
  }
  if (v6 <= 0xCu) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v12 + 2;
  if (a3 <= 0x10C) {
    uint64_t v13 = v12 + 1;
  }
  if (a3 >= 0xD) {
    uint64_t v12 = v13;
  }
  if (!coap_pdu_check_resize(a1, v12 + a3 + *(void *)(a1 + 24))) {
    return 0;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (!v14) {
    __assert_rtn("coap_opt_setheader", "option.c", 322, "opt");
  }
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  if (v16 == v15) {
    goto LABEL_16;
  }
  uint64_t v19 = (unsigned char *)(v14 + v15);
  unint64_t v20 = v16 - v15;
  unsigned __int16 v21 = v9 - *(_WORD *)(a1 + 8);
  if (v21 > 0xCu)
  {
    if (v21 > 0x10Cu)
    {
      if (v20 <= 2) {
        goto LABEL_44;
      }
      char v23 = -32;
      *uint64_t v19 = -32;
      v19[1] = (unsigned __int16)(v21 - 269) >> 8;
      _OWORD v19[2] = v21 - 13;
      unint64_t v22 = 2;
    }
    else
    {
      if (v20 <= 1) {
        goto LABEL_44;
      }
      char v23 = -48;
      *uint64_t v19 = -48;
      v19[1] = v21 - 13;
      unint64_t v22 = 1;
    }
  }
  else
  {
    unint64_t v22 = 0;
    char v23 = 16 * v21;
    *uint64_t v19 = 16 * v21;
  }
  if (a3 <= 0xC)
  {
    *uint64_t v19 = v23 | a3;
    goto LABEL_31;
  }
  if (a3 > 0x10C)
  {
    if (v22 + 3 <= v20)
    {
      *uint64_t v19 = v23 | 0xE;
      v19[v22 + 1] = (unsigned __int16)(a3 - 269) >> 8;
      v22 += 2;
      v19[v22] = a3 - 13;
      goto LABEL_31;
    }
LABEL_44:
    __int16 v17 = maxlog;
    if (maxlog < 7) {
      goto LABEL_19;
    }
    coap_log_impl(7, "insufficient space to encode option delta %d\n");
LABEL_16:
    __int16 v17 = maxlog;
    if (maxlog <= 6) {
      goto LABEL_19;
    }
    coap_log_impl(7, "coap_opt_encode: cannot set option header\n");
    goto LABEL_18;
  }
  if (v22 + 2 > v20)
  {
    __int16 v17 = maxlog;
    if (maxlog < 7) {
      goto LABEL_19;
    }
    coap_log_impl(7, "insufficient space to encode option length %zu\n");
    goto LABEL_16;
  }
  *uint64_t v19 = v23 | 0xD;
  v19[++v22] = a3 - 13;
LABEL_31:
  if (v22 >= v20) {
    __assert_rtn("coap_opt_encode", "option.c", 403, "l <= maxlen");
  }
  unint64_t v24 = v22 + 1;
  if (v20 - (v22 + 1) < a3)
  {
    __int16 v17 = maxlog;
    if (maxlog > 6)
    {
      coap_log_impl(7, "coap_opt_encode: option too large for buffer\n");
LABEL_18:
      __int16 v17 = maxlog;
    }
LABEL_19:
    if (v17 >= 4) {
      coap_log_impl(4, "coap_add_option: cannot add option\n");
    }
    return 0;
  }
  if (a4) {
    memcpy(&v19[v24], a4, a3);
  }
  unint64_t result = v24 + a3;
  if (!(v24 + a3)) {
    goto LABEL_18;
  }
  *(_WORD *)(a1 + _Block_object_dispose(&a9, 8) = v9;
  *(void *)(a1 + 24) += result;
  return result;
}

uint64_t coap_add_data_after(void *a1, uint64_t a2)
{
  if (a1[6]) {
    __assert_rtn("coap_add_data_after", "pdu.c", 302, "pdu->data == NULL");
  }
  a1[6] = 0;
  if (!a2 || !coap_pdu_resize((uint64_t)a1, a2 + a1[3] + 1)) {
    return 0;
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[3];
  a1[3] = v5 + 1;
  *(unsigned char *)(v4 + v5) = -1;
  uint64_t v6 = a1[3];
  uint64_t result = a1[5] + v6;
  a1[6] = result;
  a1[3] = v6 + a2;
  return result;
}

uint64_t coap_get_data(void *a1, uint64_t *a2, void *a3)
{
  if (!a1) {
    __assert_rtn("coap_get_data", "pdu.c", 319, "pdu");
  }
  if (!a2) {
    __assert_rtn("coap_get_data", "pdu.c", 320, "len");
  }
  if (!a3) {
    __assert_rtn("coap_get_data", "pdu.c", 321, "data");
  }
  *a3 = a1[6];
  uint64_t v3 = a1[6];
  if (v3)
  {
    uint64_t v3 = a1[3] - v3 + a1[5];
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t coap_pdu_parse_header_size(int a1, unsigned __int8 *a2)
{
  if (!a2) {
    __assert_rtn("coap_pdu_parse_header_size", "pdu.c", 407, "data");
  }
  if ((a1 - 3) > 1) {
    return 4 * ((a1 - 1) < 2);
  }
  unsigned int v2 = *a2;
  uint64_t v3 = 6;
  if (v2 >> 4 == 14) {
    uint64_t v3 = 4;
  }
  uint64_t v4 = 3;
  if (v2 >> 4 != 13) {
    uint64_t v4 = v3;
  }
  if (v2 >= 0xD0) {
    return v4;
  }
  else {
    return 2;
  }
}

uint64_t coap_pdu_parse_header(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 3);
  uint64_t v5 = v3 - v4;
  if ((a2 - 1) > 1)
  {
    if ((a2 - 3) <= 1)
    {
      if ((v4 - 7) <= 0xFFFFFFFA) {
        __assert_rtn("coap_pdu_parse_header", "pdu.c", 473, "pdu->hdr_size >= 2 && pdu->hdr_size <= 6");
      }
      LOWORD(v7) = 0;
      *(unsigned char *)a1 = 0;
      unsigned int v6 = *(unsigned char *)v5 & 0xF;
      *(unsigned char *)(a1 + 4) = v6;
      *(unsigned char *)(a1 + 1) = *(unsigned char *)(v3 - 1);
      goto LABEL_8;
    }
    if (maxlog >= 7) {
      coap_log_impl(7, "coap_pdu_parse: unsupported protocol\n");
    }
    return 0;
  }
  if (v4 != 4) {
    __assert_rtn("coap_pdu_parse_header", "pdu.c", 463, "pdu->hdr_size == 4");
  }
  if ((*(unsigned char *)v5 & 0xC0) != 0x40)
  {
    if (maxlog >= 7) {
      coap_log_impl(7, "coap_pdu_parse: UDP version not supported\n");
    }
    return 0;
  }
  *(unsigned char *)a1 = (*(unsigned char *)v5 >> 4) & 3;
  unsigned int v6 = *(unsigned char *)v5 & 0xF;
  *(unsigned char *)(a1 + 4) = v6;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(v5 + 1);
  unsigned int v7 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
LABEL_8:
  *(_WORD *)(a1 + 6) = v7;
  unint64_t v8 = *(void *)(a1 + 16);
  if (v8 >= v6) {
    return 1;
  }
  if (maxlog >= 7)
  {
    coap_log_impl(7, "coap_pdu_parse: PDU header token size broken\n");
    unint64_t v8 = *(void *)(a1 + 16);
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 4) = v8;
  return result;
}

uint64_t coap_pdu_parse_opt(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1))
  {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 4);
    unint64_t v3 = *(void *)(a1 + 24);
    BOOL v4 = v2 <= 8 && v3 >= v2;
    if (!v4)
    {
      if (maxlog >= 7) {
        coap_log_impl(7, "coap_pdu_parse: invalid Token\n");
      }
      return 0;
    }
    unint64_t v6 = v3 - v2;
    if (v3 != v2)
    {
      unsigned int v7 = (unsigned __int8 *)(*(void *)(a1 + 40) + v2);
      while (*v7 != 255)
      {
        memset(v9, 0, sizeof(v9));
        unint64_t v8 = coap_opt_parse(v7, v6, (uint64_t)v9);
        if (!v8)
        {
          if (maxlog >= 7) {
            coap_log_impl(7, "coap_pdu_parse: missing payload start code\n");
          }
          return 0;
        }
        BOOL v4 = v6 >= v8;
        v6 -= v8;
        if (!v4) {
          __assert_rtn("next_option_safe", "pdu.c", 395, "optsize <= *length");
        }
        v7 += v8;
        if (!v6) {
          goto LABEL_27;
        }
      }
      if (v6 != 1)
      {
        *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = v7 + 1;
        return 1;
      }
      if (maxlog >= 7) {
        coap_log_impl(7, "coap_pdu_parse: message ending in payload start marker\n");
      }
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 24) || *(unsigned char *)(a1 + 4))
    {
      if (maxlog >= 7) {
        coap_log_impl(7, "coap_pdu_parse: empty message is not empty\n");
      }
      return 0;
    }
    *(void *)(a1 + 24) = 0;
  }
LABEL_27:
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = 0;
  return 1;
}

uint64_t coap_pdu_encode_header(uint64_t a1, int a2)
{
  if ((a2 - 1) <= 1)
  {
    if (*(unsigned __int8 *)(a1 + 2) <= 3u) {
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 570, "pdu->max_hdr_size >= 4");
    }
    *(unsigned char *)(*(void *)(a1 + 40) - 4) = *(unsigned char *)(a1 + 4) | (16 * *(unsigned char *)a1) | 0x40;
    *(unsigned char *)(*(void *)(a1 + 40) - 3) = *(unsigned char *)(a1 + 1);
    *(unsigned char *)(*(void *)(a1 + 40) - 2) = *(unsigned char *)(a1 + 7);
    char v3 = *(unsigned char *)(a1 + 6);
    goto LABEL_4;
  }
  if ((a2 - 3) <= 1)
  {
    unint64_t v6 = *(void *)(a1 + 24);
    unint64_t v7 = *(unsigned __int8 *)(a1 + 4);
    BOOL v8 = v6 >= v7;
    unint64_t v9 = v6 - v7;
    if (!v8) {
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 585, "pdu->used_size >= pdu->token_length");
    }
    if (v9 <= 0xC)
    {
      if (*(unsigned __int8 *)(a1 + 2) <= 1u) {
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 592, "pdu->max_hdr_size >= 2");
      }
      *(unsigned char *)(*(void *)(a1 + 40) - 2) = v7 | (16 * v9);
      *(unsigned char *)(*(void *)(a1 + 40) - 1) = *(unsigned char *)(a1 + 1);
      char v4 = 2;
      goto LABEL_5;
    }
    if (v9 <= 0x10C)
    {
      if (*(unsigned __int8 *)(a1 + 2) <= 2u) {
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 603, "pdu->max_hdr_size >= 3");
      }
      *(unsigned char *)(*(void *)(a1 + 40) - 3) = v7 | 0xD0;
      *(unsigned char *)(*(void *)(a1 + 40) - 2) = v9 - 13;
      *(unsigned char *)(*(void *)(a1 + 40) - 1) = *(unsigned char *)(a1 + 1);
      char v4 = 3;
      goto LABEL_5;
    }
    unsigned int v10 = *(unsigned __int8 *)(a1 + 2);
    if (v9 > 0x1010C)
    {
      if (v10 <= 5) {
        __assert_rtn("coap_pdu_encode_header", "pdu.c", 626, "pdu->max_hdr_size >= 6");
      }
      *(unsigned char *)(*(void *)(a1 + 40) - 6) = v7 | 0xF0;
      int v12 = v9 - 65805;
      *(unsigned char *)(*(void *)(a1 + 40) - 5) = HIBYTE(v12);
      *(unsigned char *)(*(void *)(a1 + 40) - 4) = BYTE2(v12);
      *(unsigned char *)(*(void *)(a1 + 40) - 3) = BYTE1(v12);
      *(unsigned char *)(*(void *)(a1 + 40) - 2) = v12;
      *(unsigned char *)(*(void *)(a1 + 40) - 1) = *(unsigned char *)(a1 + 1);
      char v4 = 6;
      goto LABEL_5;
    }
    if (v10 <= 3) {
      __assert_rtn("coap_pdu_encode_header", "pdu.c", 614, "pdu->max_hdr_size >= 4");
    }
    *(unsigned char *)(*(void *)(a1 + 40) - 4) = v7 | 0xE0;
    __int16 v11 = v9 - 269;
    *(unsigned char *)(*(void *)(a1 + 40) - 3) = HIBYTE(v11);
    *(unsigned char *)(*(void *)(a1 + 40) - 2) = v11;
    char v3 = *(unsigned char *)(a1 + 1);
LABEL_4:
    *(unsigned char *)(*(void *)(a1 + 40) - 1) = v3;
    char v4 = 4;
LABEL_5:
    *(unsigned char *)(a1 + 3) = v4;
    return *(unsigned __int8 *)(a1 + 3);
  }
  if (maxlog >= 4) {
    coap_log_impl(4, "coap_pdu_encode_header: unsupported protocol\n");
  }
  return *(unsigned __int8 *)(a1 + 3);
}

uint64_t coap_print_wellknown(uint64_t a1, unsigned char *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = *a3;
  size_t v56 = 0;
  unsigned int v57 = 0;
  if (!a5)
  {
    size_t i = 0;
    __s1 = 0;
LABEL_10:
    uint64_t v13 = 0;
    goto LABEL_26;
  }
  __s1 = coap_opt_value(a5);
  for (size_t i = 0; i < coap_opt_length(a5) && __s1[i] != 61; ++i)
    ;
  if (i >= coap_opt_length(a5)) {
    goto LABEL_10;
  }
  uint64_t v11 = a4;
  uint64_t v12 = i == 4 && *(_DWORD *)__s1 == 1717924456;
  uint64_t v14 = &coap_print_wellknown__rt_attributes;
  uint64_t v15 = "rt";
  while (i != *v14 || memcmp(__s1, v15, i))
  {
    uint64_t v15 = (const char *)v14[3];
    v14 += 2;
    if (!v15) {
      goto LABEL_18;
    }
  }
  uint64_t v12 = v12 | 4;
LABEL_18:
  uint64_t v16 = &coap_opt_value(a5)[i];
  unsigned int v57 = v16 + 1;
  if (i >= coap_opt_length(a5)) {
    __assert_rtn("coap_print_wellknown", "resource.c", 212, "(resource_param.length + 1) <= coap_opt_length(query_filter)");
  }
  size_t v17 = ~i + coap_opt_length(a5);
  size_t v56 = v17;
  uint64_t v18 = 1;
  if ((v12 & 1) != 0 && v16[1] == 47)
  {
    size_t v56 = --v17;
    unsigned int v57 = v16 + 2;
    uint64_t v18 = 2;
  }
  uint64_t v13 = v12;
  if (v17)
  {
    size_t v19 = v17 - 1;
    if (v16[v18 + v19] == 42)
    {
      size_t v56 = v19;
      uint64_t v13 = v12 | 2;
    }
  }
  a4 = v11;
LABEL_26:
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v20 = *(void *)(a1 + 16);
  if (v20)
  {
    int v21 = 0;
    unint64_t v22 = 0;
    unint64_t v23 = (unint64_t)&a2[v8];
    unsigned int v52 = v13 >> 2;
    unsigned int v53 = (v13 >> 1) & 1;
    uint64_t v24 = a4;
    uint64_t v25 = a2;
    while (1)
    {
      uint64_t v26 = v20;
      uint64_t v20 = *(void *)(v20 + 80);
      if (!i) {
        goto LABEL_36;
      }
      if (v13) {
        break;
      }
      unint64_t v27 = v22;
      uint64_t v28 = v13;
      long long v55 = 0uLL;
      uint64_t v29 = *(void **)(v26 + 120);
      if (!v29) {
        goto LABEL_34;
      }
      while (1)
      {
        uint64_t v30 = v29[1];
        if (*(void *)v30 == i && !memcmp(*(const void **)(v30 + 8), __s1, i)) {
          break;
        }
        uint64_t v29 = (void *)*v29;
        if (!v29) {
          goto LABEL_34;
        }
      }
      id v31 = (long long *)v29[2];
      if (!v31) {
        goto LABEL_34;
      }
      long long v55 = *v31;
      if (**((unsigned char **)v31 + 1) == 34)
      {
        *(void *)&long long v55 = v55 - 2;
        ++*((void *)&v55 + 1);
      }
      if (!match((uint64_t)&v55, (uint64_t)&v56, v53, v52))
      {
LABEL_34:
        uint64_t v13 = v28;
        unint64_t v22 = v27;
        goto LABEL_108;
      }
      uint64_t v13 = v28;
      unint64_t v22 = v27;
      if (v21) {
        goto LABEL_37;
      }
LABEL_47:
      if ((uint64_t)(v23 - (void)v25) >= 1)
      {
        if (!v24)
        {
          *uint64_t v25 = 60;
          unsigned int v32 = v25 + 1;
          if ((unint64_t)(v25 + 1) >= v23)
          {
            uint64_t v24 = 0;
            goto LABEL_57;
          }
LABEL_55:
          uint64_t v24 = 0;
          *v32++ = 47;
          goto LABEL_57;
        }
        --v24;
      }
      if ((unint64_t)v25 < v23)
      {
        unsigned int v32 = v25;
        if (!v24) {
          goto LABEL_55;
        }
        --v24;
      }
      unsigned int v32 = v25;
LABEL_57:
      int v33 = *(unint64_t **)(v26 + 136);
      unint64_t v34 = *v33;
      if (*v33)
      {
        unint64_t v35 = 0;
        do
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24)
            {
              --v24;
            }
            else
            {
              *v32++ = *(unsigned char *)(v33[1] + v35);
              int v33 = *(unint64_t **)(v26 + 136);
              unint64_t v34 = *v33;
            }
          }
          ++v35;
        }
        while (v35 < v34);
        uint64_t v36 = v35 + 2;
      }
      else
      {
        uint64_t v36 = 2;
      }
      if ((unint64_t)v32 < v23)
      {
        if (v24) {
          --v24;
        }
        else {
          *v32++ = 62;
        }
      }
      uint64_t v37 = v36 + 1;
      for (j = *(void **)(v26 + 120); j; j = (void *)*j)
      {
        if ((unint64_t)v32 < v23)
        {
          if (v24) {
            --v24;
          }
          else {
            *v32++ = 59;
          }
        }
        ++v37;
        uint64_t v39 = (unint64_t *)j[1];
        unint64_t v40 = *v39;
        if (*v39)
        {
          unint64_t v41 = 0;
          do
          {
            if ((unint64_t)v32 < v23)
            {
              if (v24)
              {
                --v24;
              }
              else
              {
                *v32++ = *(unsigned char *)(v39[1] + v41);
                uint64_t v39 = (unint64_t *)j[1];
                unint64_t v40 = *v39;
              }
            }
            ++v41;
          }
          while (v41 < v40);
          v37 += v41;
        }
        uint64_t v42 = (unint64_t *)j[2];
        if (v42 && v42[1])
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24)
            {
              --v24;
            }
            else
            {
              *v32++ = 61;
              uint64_t v42 = (unint64_t *)j[2];
            }
          }
          ++v37;
          unint64_t v43 = *v42;
          if (*v42)
          {
            unint64_t v44 = 0;
            do
            {
              if ((unint64_t)v32 < v23)
              {
                if (v24)
                {
                  --v24;
                }
                else
                {
                  *v32++ = *(unsigned char *)(v42[1] + v44);
                  uint64_t v42 = (unint64_t *)j[2];
                  unint64_t v43 = *v42;
                }
              }
              ++v44;
            }
            while (v44 < v43);
            v37 += v44;
          }
        }
      }
      if ((*(unsigned char *)v26 & 4) != 0)
      {
        for (uint64_t k = 0; k != 4; ++k)
        {
          if ((unint64_t)v32 < v23)
          {
            if (v24) {
              --v24;
            }
            else {
              *v32++ = aObs[k];
            }
          }
        }
        v37 += 4;
      }
      unint64_t v46 = v32 - v25;
      if (v46 >> 28) {
        goto LABEL_111;
      }
      v25 += v46 & 0xFFFFFFF;
      v22 += v37;
      int v21 = 1;
LABEL_108:
      if (!v20) {
        goto LABEL_111;
      }
    }
    if (!match(*(void *)(v26 + 136), (uint64_t)&v56, v53, v52)) {
      goto LABEL_108;
    }
LABEL_36:
    if (!v21) {
      goto LABEL_47;
    }
LABEL_37:
    if ((unint64_t)v25 < v23)
    {
      if (v24) {
        --v24;
      }
      else {
        *v25++ = 44;
      }
    }
    ++v22;
    goto LABEL_47;
  }
  unint64_t v22 = 0;
  uint64_t v24 = a4;
  uint64_t v25 = a2;
LABEL_111:
  *uint64_t v49 = v22;
  unsigned int v47 = v25 - a2;
  if (v25 - a2 + v50 - v24 < v22) {
    unsigned int v47 = (v25 - a2) | 0x40000000;
  }
  if ((unint64_t)(v25 - a2) >> 28) {
    return 0x80000000;
  }
  else {
    return v47;
  }
}

BOOL match(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!a1)
  {
    uint64_t v15 = "text";
    goto LABEL_27;
  }
  if (!a2)
  {
    uint64_t v15 = "pattern";
LABEL_27:
    __assert_rtn("match", "resource.c", 102, v15);
  }
  size_t v5 = *(void *)a1;
  size_t v6 = *(void *)a2;
  if (*(void *)a1 < *(void *)a2) {
    return 0;
  }
  if (!a4)
  {
    if (a3 || v6 == v5) {
      return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), *(void *)a2) == 0;
    }
    return 0;
  }
  if (!v5) {
    return 0;
  }
  unint64_t v9 = *(void **)(a1 + 8);
  while (1)
  {
    unsigned int v10 = memchr(v9, 32, v5);
    uint64_t v11 = v10;
    int64_t v12 = v10 - (unsigned char *)v9;
    uint64_t v13 = v10 ? (uint64_t)(v10 + 1) : 0;
    size_t v14 = v10 ? v10 - (unsigned char *)v9 : v5;
    if ((a3 || v6 == v14) && !memcmp(v9, *(const void **)(a2 + 8), v6)) {
      break;
    }
    BOOL result = 0;
    if (v11)
    {
      unint64_t v9 = (void *)v13;
      v5 += ~v12;
      if (v5) {
        continue;
      }
    }
    return result;
  }
  return 1;
}

void coap_free_resource(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 120);
  if (v2)
  {
    do
    {
      char v3 = (void **)*v2;
      free(v2[1]);
      char v4 = v2[2];
      if (v4) {
        free(v4);
      }
      free(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  free(*(void **)(a1 + 136));
  size_t v5 = *(void **)(a1 + 128);
  if (v5)
  {
    do
    {
      size_t v6 = (void *)*v5;
      coap_session_release(v5[1]);
      unint64_t v7 = (void *)v5[6];
      if (v7) {
        free(v7);
      }
      free(v5);
      size_t v5 = v6;
    }
    while (v6);
  }

  free((void *)a1);
}

uint64_t coap_get_resource_from_uri_path(uint64_t a1, size_t __n, unsigned __int8 *__s2)
{
  int v5 = -17973521;
  unsigned int v6 = -1640531527;
  if (__n < 0xC)
  {
    int v9 = -1640531527;
    unsigned int v8 = __n;
    unint64_t v7 = __s2;
  }
  else
  {
    unint64_t v7 = __s2;
    unsigned int v8 = __n;
    int v9 = -1640531527;
    do
    {
      unsigned int v10 = *((_DWORD *)v7 + 1) + v6;
      unsigned int v11 = *((_DWORD *)v7 + 2) + v5;
      int v12 = (*(_DWORD *)v7 + v9 - (v10 + v11)) ^ (v11 >> 13);
      unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 8);
      unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 13);
      int v15 = (v12 - v13 - v14) ^ (v14 >> 12);
      unsigned int v16 = (v13 - v14 - v15) ^ (v15 << 16);
      unsigned int v17 = (v14 - v15 - v16) ^ (v16 >> 5);
      int v9 = (v15 - v16 - v17) ^ (v17 >> 3);
      unsigned int v6 = (v16 - v17 - v9) ^ (v9 << 10);
      int v5 = (v17 - v9 - v6) ^ (v6 >> 15);
      v7 += 12;
      v8 -= 12;
    }
    while (v8 > 0xB);
  }
  unsigned int v18 = v5 + __n;
  switch(v8)
  {
    case 1u:
      goto LABEL_17;
    case 2u:
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      goto LABEL_14;
    case 5u:
      goto LABEL_13;
    case 6u:
      goto LABEL_12;
    case 7u:
      goto LABEL_11;
    case 8u:
      goto LABEL_10;
    case 9u:
      goto LABEL_9;
    case 0xAu:
      goto LABEL_8;
    case 0xBu:
      v18 += v7[10] << 24;
LABEL_8:
      v18 += v7[9] << 16;
LABEL_9:
      v18 += v7[8] << 8;
LABEL_10:
      v6 += v7[7] << 24;
LABEL_11:
      v6 += v7[6] << 16;
LABEL_12:
      v6 += v7[5] << 8;
LABEL_13:
      v6 += v7[4];
LABEL_14:
      v9 += v7[3] << 24;
LABEL_15:
      v9 += v7[2] << 16;
LABEL_16:
      v9 += v7[1] << 8;
LABEL_17:
      v9 += *v7;
      break;
    default:
      break;
  }
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return 0;
  }
  int v20 = (v9 - v18 - v6) ^ (v18 >> 13);
  unsigned int v21 = (v6 - v18 - v20) ^ (v20 << 8);
  unsigned int v22 = (v18 - v20 - v21) ^ (v21 >> 13);
  int v23 = (v20 - v21 - v22) ^ (v22 >> 12);
  unsigned int v24 = (v21 - v22 - v23) ^ (v23 << 16);
  unsigned int v25 = (v22 - v23 - v24) ^ (v24 >> 5);
  int v26 = (v23 - v24 - v25) ^ (v25 >> 3);
  unsigned int v27 = (v25 - v26 - ((v24 - v25 - v26) ^ (v26 << 10))) ^ (((v24 - v25 - v26) ^ (v26 << 10)) >> 15);
  uint64_t v28 = *(void *)(v19 + 64);
  uint64_t v29 = *(void *)(*(void *)v28 + 16 * ((*(_DWORD *)(v28 + 8) - 1) & v27));
  if (!v29) {
    return 0;
  }
  uint64_t v30 = -*(void *)(v28 + 32);
  while (1)
  {
    uint64_t v31 = v29 + v30;
    if (*(_DWORD *)(v29 + v30 + 116) == v27
      && *(_DWORD *)(v31 + 112) == __n
      && !memcmp(*(const void **)(v31 + 104), __s2, __n))
    {
      break;
    }
    uint64_t v29 = *(void *)(v31 + 96);
    if (!v29) {
      return 0;
    }
  }
  return v31;
}

void *coap_find_observer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    __assert_rtn("coap_find_observer", "resource.c", 586, "resource");
  }
  if (!a2) {
    __assert_rtn("coap_find_observer", "resource.c", 587, "session");
  }
  for (size_t i = *(void **)(a1 + 128); i; size_t i = (void *)*i)
  {
    if (i[1] == a2 && (!a3 || *(void *)a3 == i[4] && !memcmp(*(const void **)(a3 + 8), i + 5, *(void *)a3))) {
      break;
    }
  }
  return i;
}

void *coap_add_observer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5, uint64_t a6)
{
  observer = coap_find_observer(a1, a2, a3);
  if (observer)
  {
    unsigned int v13 = observer;
    unsigned int v14 = (void *)observer[6];
    if (v14) {
      free(v14);
    }
    v13[6] = a4;
  }
  else
  {
    for (size_t i = *(void **)(a1 + 128); i; size_t i = (void *)*i)
    {
      if (i[1] == a2)
      {
        uint64_t v17 = i[6];
        if (a4)
        {
          if (v17)
          {
            size_t v18 = *(void *)a4;
            if (*(void *)a4 == *(void *)v17
              && (!v18 || !memcmp(*((const void **)a4 + 1), *(const void **)(v17 + 8), v18)))
            {
LABEL_17:
              v23[0] = i[4];
              v23[1] = i + 5;
              coap_delete_observer(a1, a2, (uint64_t)v23);
              break;
            }
          }
        }
        else if (!v17)
        {
          goto LABEL_17;
        }
      }
    }
    uint64_t v19 = malloc_type_malloc(0x38uLL, 0x9D9A23A2uLL);
    if (v19)
    {
      unsigned int v13 = v19;
      _OWORD v19[6] = 0;
      *((_OWORD *)v19 + 1) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
      *(_OWORD *)uint64_t v19 = 0u;
      ++*(_DWORD *)(a2 + 4);
      v19[1] = a2;
      if (a3)
      {
        unint64_t v20 = *(void *)a3;
        if (*(void *)a3)
        {
          v19[4] = v20;
          unsigned int v21 = v19 + 5;
          if (v20 >= 8) {
            size_t v22 = 8;
          }
          else {
            size_t v22 = v20;
          }
          memcpy(v21, *(const void **)(a3 + 8), v22);
        }
      }
      v13[6] = a4;
      *((unsigned char *)v13 + 16) = v13[2] & 0x7F | (a5 << 7);
      *(void *)((char *)v13 + 20) = a6;
      void *v13 = *(void *)(a1 + 128);
      *(void *)(a1 + 12_Block_object_dispose(&a9, 8) = v13;
      if (maxlog >= 7) {
        coap_log_impl(7, "create new subscription\n");
      }
    }
    else
    {
      if (a4) {
        free(a4);
      }
      return 0;
    }
  }
  return v13;
}

void coap_delete_observer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  observer = coap_find_observer(a1, a2, a3);
  if (observer)
  {
    unsigned int v6 = observer;
    if (maxlog >= 7)
    {
      v16[0] = 0;
      v16[1] = 0;
      char v17 = 0;
      if (!observer[4]) {
        goto LABEL_7;
      }
      unsigned int v7 = 0;
      uint64_t v8 = 0;
      unsigned int v9 = 1;
      do
      {
        snprintf((char *)v16 + v7, 3uLL, "%02x", *((unsigned __int8 *)v6 + v8 + 40));
        uint64_t v8 = v9;
        BOOL v10 = v6[4] > (unint64_t)v9++;
        v7 += 2;
      }
      while (v10);
      if (maxlog >= 7) {
LABEL_7:
      }
        coap_log_impl(7, "removed observer tid %s\n", (const char *)v16);
    }
    unsigned int v13 = *(void **)(a1 + 128);
    int v12 = (void *)(a1 + 128);
    unsigned int v11 = v13;
    if (v13)
    {
      if (v11 == v6) {
        goto LABEL_16;
      }
      do
      {
        int v12 = v11;
        unsigned int v11 = (void *)*v11;
        if (v11) {
          BOOL v14 = v11 == v6;
        }
        else {
          BOOL v14 = 1;
        }
      }
      while (!v14);
      if (v11) {
LABEL_16:
      }
        *int v12 = *v6;
      coap_session_release(a2);
      int v15 = (void *)v6[6];
      if (v15) {
        free(v15);
      }
      free(v6);
    }
  }
}

void *coap_touch_observer(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    int v5 = result;
    do
    {
      uint64_t v6 = (uint64_t)v5;
      int v5 = (void *)v5[10];
      BOOL result = coap_find_observer(v6, a2, a3);
      if (result) {
        *((unsigned char *)result + 16) &= 0xCFu;
      }
    }
    while (v5);
  }
  return result;
}

void *coap_insert_node(void *result, void *a2)
{
  if (result)
  {
    unint64_t v2 = (void *)*result;
    if (*result)
    {
      unint64_t v3 = a2[1];
      unint64_t v4 = v2[1];
      if (v4 <= v3)
      {
        while (1)
        {
          int v5 = v2;
          v3 -= v4;
          a2[1] = v3;
          unint64_t v2 = (void *)*v2;
          if (!v2) {
            break;
          }
          unint64_t v4 = v2[1];
          if (v4 > v3)
          {
            v2[1] = v4 - v3;
            break;
          }
        }
        *a2 = v2;
        *int v5 = a2;
      }
      else
      {
        *a2 = v2;
        *BOOL result = a2;
        v2[1] = v4 - v3;
      }
    }
    else
    {
      *BOOL result = a2;
    }
  }
  return result;
}

void coap_delete_node(void **a1)
{
  if (a1)
  {
    coap_delete_pdu(a1[5]);
    unint64_t v2 = a1[3];
    if (v2)
    {
      uint64_t v3 = v2[26];
      uint64_t v6 = *(void **)(v3 + 48);
      unint64_t v4 = (void *)(v3 + 48);
      int v5 = v6;
      if (v6)
      {
        if (v5 == a1) {
          goto LABEL_11;
        }
        do
        {
          unint64_t v4 = v5;
          int v5 = (void *)*v5;
          if (v5) {
            BOOL v7 = v5 == a1;
          }
          else {
            BOOL v7 = 1;
          }
        }
        while (!v7);
        if (v5) {
LABEL_11:
        }
          *unint64_t v4 = *a1;
      }
      coap_session_release();
    }
    free(a1);
  }
}

void coap_delete_all(void **a1)
{
  if (a1)
  {
    coap_delete_all(*a1);
    coap_delete_node(a1);
  }
}

_OWORD *coap_new_node()
{
  id v0 = malloc_type_malloc(0x30uLL, 0x9D9A23A2uLL);
  int v1 = v0;
  if (v0)
  {
    v0[1] = 0u;
    v0[2] = 0u;
    _OWORD *v0 = 0u;
  }
  else if (maxlog >= 4)
  {
    coap_log_impl(4, "coap_new_node: malloc failed\n");
  }
  return v1;
}

uint64_t coap_startup()
{
  if ((coap_started & 1) == 0)
  {
    coap_started = 1;
    v1.tv_sec = 0;
    *(void *)&v1.tv_usec = 0;
    gettimeofday(&v1, 0);
    coap_clock_offset = v1.tv_sec;
    v1.tv_sec = 0;
    *(void *)&v1.tv_usec = 0;
    return gettimeofday(&v1, 0);
  }
  return result;
}

void coap_free_context(uint64_t a1)
{
  if (!a1) {
    return;
  }
  coap_delete_all(*(void ***)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    if (v3)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      goto LABEL_6;
    }
    uint64_t v5 = *(void *)(a1 + 16);
    if (!v4) {
      break;
    }
LABEL_6:
    uint64_t v6 = *(void *)(v5 + 64);
    if (v2 + 64 == *(void *)(v6 + 24))
    {
      *(void *)(v6 + 24) = v3 + *(void *)(v6 + 32);
      if (v3)
      {
LABEL_8:
        *(void *)(v3 + *(void *)(v6 + 32) + 16) = v4;
        uint64_t v7 = *(void *)(v2 + 80);
        if (!v7) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else if (v3)
    {
      goto LABEL_8;
    }
    *(void *)(a1 + 16) = v4;
    uint64_t v6 = *(void *)(v4 + 64);
    uint64_t v7 = v4;
LABEL_12:
    *(void *)(v7 + *(void *)(v6 + 32) + _Block_object_dispose(&a9, 8) = v3;
LABEL_13:
    uint64_t v8 = *(void *)v6 + 16 * ((*(_DWORD *)(v6 + 8) - 1) & *(_DWORD *)(v2 + 116));
    --*(_DWORD *)(v8 + 8);
    if (*(void *)v8 == v2 + 64) {
      *(void *)uint64_t v8 = *(void *)(v2 + 96);
    }
    uint64_t v9 = *(void *)(v2 + 88);
    if (v9) {
      *(void *)(v9 + 32) = *(void *)(v2 + 96);
    }
    uint64_t v10 = *(void *)(v2 + 96);
    if (v10) {
      *(void *)(v10 + 24) = v9;
    }
    --*(_DWORD *)(v6 + 16);
    coap_free_resource(v2);
    uint64_t v2 = v4;
    if (!v4) {
      goto LABEL_23;
    }
  }
  free(**(void ***)(v5 + 64));
  free(*(void **)(*(void *)(a1 + 16) + 64));
  *(void *)(a1 + 16) = 0;
  coap_free_resource(v2);
LABEL_23:
  *(void *)(a1 + 16) = 0;
  uint64_t v11 = *(void *)(a1 + 24);
  if (v11)
  {
    coap_free_resource(v11);
    *(void *)(a1 + 24) = 0;
  }
  int v12 = *(void **)(a1 + 56);
  while (v12)
  {
    unsigned int v13 = v12;
    int v12 = (void *)*v12;
    if (*((_WORD *)v13 + 14))
    {
      int v14 = v13[6];
      if (v14 != -1)
      {
        *((void *)v13 + 4) = 0;
        *((void *)v13 + 5) = 0;
        close(v14);
        v13[6] = -1;
      }
      *((_WORD *)v13 + 14) = 0;
    }
    uint64_t v15 = *((void *)v13 + 10);
    if (v15)
    {
      do
      {
        if (*(_DWORD *)(v15 + 4)) {
          __assert_rtn("coap_free_endpoint", "coap_session.c", 1014, "session->ref == 0");
        }
        uint64_t v16 = *(void *)(v15 + 64);
        coap_session_free((_DWORD *)v15);
        uint64_t v15 = v16;
      }
      while (v16);
    }
    uint64_t v17 = *((void *)v13 + 1);
    if (v17)
    {
      unint64_t v20 = *(void **)(v17 + 56);
      uint64_t v18 = (void *)(v17 + 56);
      uint64_t v19 = v20;
      if (v20 == (void *)v13) {
        goto LABEL_41;
      }
      do
      {
        uint64_t v18 = v19;
        uint64_t v19 = (void *)*v19;
        if (v19) {
          BOOL v21 = v19 == (void *)v13;
        }
        else {
          BOOL v21 = 1;
        }
      }
      while (!v21);
      if (v19) {
LABEL_41:
      }
        void *v18 = *(void *)v13;
    }
    free(v13);
  }
  uint64_t v22 = *(void *)(a1 + 64);
  if (v22)
  {
    do
    {
      uint64_t v23 = *(void *)(v22 + 64);
      coap_session_release(v22);
      uint64_t v22 = v23;
    }
    while (v23);
  }
  unsigned int v24 = *(void **)(a1 + 160);
  if (v24) {
    free(v24);
  }
  unsigned int v25 = *(void **)(a1 + 176);
  if (v25) {
    free(v25);
  }

  free((void *)a1);
}

uint64_t coap_get_context_server_hint(uint64_t a1, void *__dst, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 208);
  if (!v3 || !*(void *)(v3 + 160) || *(void *)(v3 + 168) - 1 >= a3) {
    return 0;
  }
  memcpy(__dst, *(const void **)(v3 + 160), *(void *)(v3 + 168));
  return *(void *)(v3 + 168);
}

uint64_t coap_get_context_server_psk(uint64_t a1, int a2, int a3, void *__dst, unint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 208);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(const void **)(v5 + 176);
  if (!v6) {
    return 0;
  }
  size_t v7 = *(void *)(v5 + 184);
  if (v7 - 1 >= a5) {
    return 0;
  }
  memcpy(__dst, v6, v7);
  return *(void *)(v5 + 184);
}

uint64_t coap_get_session_client_psk(uint64_t a1, int a2, int a3, void *__dst, void *a5, size_t a6, void *a7, unint64_t a8)
{
  uint64_t v11 = *(const void **)(a1 + 312);
  if (v11 && (size_t v12 = *(void *)(a1 + 320)) != 0 && *(void *)(a1 + 328) && (v13 = *(void *)(a1 + 336)) != 0)
  {
    if (v12 <= a6 && v13 <= a8)
    {
      memcpy(__dst, v11, v12);
      memcpy(a7, *(const void **)(a1 + 328), *(void *)(a1 + 336));
      *a5 = *(void *)(a1 + 320);
      return *(void *)(a1 + 336);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 208);
    if (v15)
    {
      uint64_t v16 = *(const void **)(v15 + 176);
      if (v16)
      {
        if (*(void *)(v15 + 184) - 1 < a8)
        {
          *a5 = 0;
          memcpy(a7, v16, *(void *)(v15 + 184));
          return *(void *)(*(void *)(a1 + 208) + 184);
        }
      }
    }
  }
  uint64_t result = 0;
  *a5 = 0;
  return result;
}

uint64_t coap_option_check_critical(_WORD *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  coap_option_iterator_init(a2, (uint64_t)v13, 0);
  uint64_t v5 = 1;
  while (coap_option_next((uint64_t)v13))
  {
    unsigned int v6 = WORD4(v13[0]);
    if (BYTE8(v13[0]))
    {
      HIDWORD(v_Block_object_dispose(&a9, 8) = WORD4(v13[0]) - 1;
      LODWORD(v_Block_object_dispose(&a9, 8) = HIDWORD(v8);
      unsigned int v7 = v8 >> 1;
      BOOL v9 = v7 > 0x13;
      int v10 = (1 << v7) & 0xA29AF;
      BOOL v11 = v9 || v10 == 0;
      if (v11 && !coap_option_filter_op(a1, WORD4(v13[0]), 2))
      {
        if (maxlog >= 7)
        {
          coap_log_impl(7, "unknown critical option %d\n", v6);
          unsigned int v6 = WORD4(v13[0]);
        }
        coap_option_filter_op(a3, v6, 0);
        uint64_t v5 = 0;
      }
    }
  }
  return v5;
}

uint64_t coap_send(unsigned __int8 *a1, uint64_t a2)
{
  if (!coap_pdu_encode_header(a2, *a1)) {
    goto LABEL_16;
  }
  unint64_t v4 = coap_send_pdu(a1, (unsigned char *)a2, 0);
  if (v4 != -3)
  {
    unint64_t v5 = v4;
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (*a1 - 3 > 1)
      {
        if (!*(unsigned char *)a2)
        {
          unsigned int v6 = coap_new_node();
          if (v6)
          {
            uint64_t v7 = (uint64_t)v6;
            unsigned __int8 __buf = 0;
            *((_DWORD *)v6 + _Block_object_dispose(&a9, 8) = *(unsigned __int16 *)(a2 + 6);
            *((void *)v6 + 5) = a2;
            arc4random_buf(&__buf, 1uLL);
            *(_DWORD *)(v7 + 20) = coap_calc_timeout(a1, __buf);
            return coap_wait_ack(*((void *)a1 + 26), (uint64_t)a1, v7);
          }
          if (maxlog >= 7) {
            coap_log_impl(7, "coap_wait_ack: insufficient memory\n");
          }
          goto LABEL_16;
        }
      }
      else if (v4 < *(void *)(a2 + 24) + (unint64_t)*(unsigned __int8 *)(a2 + 3))
      {
        if (coap_session_delay_pdu(a1, a2, 0) == -3)
        {
          *((void *)a1 + 30) = v5;
          return *(unsigned __int16 *)(a2 + 6);
        }
LABEL_16:
        coap_delete_pdu((void *)a2);
        return 0xFFFFFFFFLL;
      }
      unint64_t v5 = *(unsigned __int16 *)(a2 + 6);
    }
    coap_delete_pdu((void *)a2);
    return v5;
  }
  return *(unsigned __int16 *)(a2 + 6);
}

uint64_t coap_send_pdu(unsigned __int8 *a1, unsigned char *a2, uint64_t a3)
{
  int v6 = a1[141];
  if (v6 == 2)
  {
    if ((*((_DWORD *)a1 + 36) & 0xF0) != 0xE0) {
      goto LABEL_8;
    }
  }
  else if (v6 != 30 || a1[148] != 255)
  {
    goto LABEL_8;
  }
  if (a2[1] > 0x5Fu) {
    return -2;
  }
LABEL_8:
  if (a1[2]) {
    goto LABEL_9;
  }
  int v8 = *a1;
  if (v8 == 2)
  {
    if (!*((void *)a1 + 27))
    {
      *((void *)a1 + 27) = 0;
      uint64_t v9 = *((void *)a1 + 26);
      uint64_t v10 = 512;
LABEL_91:
      coap_handle_event(v9, v10, (uint64_t)a1);
    }
    return -1;
  }
  if ((v8 - 3) > 1) {
    return -1;
  }
  if (v8 == 4) {
    unsigned int v12 = 5684;
  }
  else {
    unsigned int v12 = 5683;
  }
  int v36 = 0;
  int v37 = 1;
  memset(&v34[4], 0, 24);
  int v35 = 0;
  *(_DWORD *)unint64_t v34 = *((_DWORD *)a1 + 26);
  int v13 = a1[109];
  if (v13 == 2)
  {
    *(_OWORD *)&v34[4] = *(_OWORD *)(a1 + 108);
  }
  else if (v13 == 30)
  {
    v34[5] = 30;
    *(_OWORD *)&v34[12] = *(_OWORD *)(a1 + 116);
    *(_WORD *)&v34[6] = *((_WORD *)a1 + 55);
    int v35 = *((_DWORD *)a1 + 33);
  }
  else
  {
    __memcpy_chk();
  }
  *((_WORD *)a1 + 90) &= ~4u;
  int v14 = socket(v13, 1, 0);
  *((_DWORD *)a1 + 44) = v14;
  if (v14 == -1)
  {
    if (maxlog <= 3)
    {
LABEL_90:
      *((_WORD *)a1 + 90) = 0;
      uint64_t v9 = *((void *)a1 + 26);
      uint64_t v10 = 4099;
      goto LABEL_91;
    }
    uint64_t v18 = "coap_socket_connect_tcp1: socket: %s\n";
    goto LABEL_87;
  }
  if (ioctl(v14, 0x8004667EuLL, &v37) == -1 && maxlog >= 4)
  {
    uint64_t v15 = __error();
    uint64_t v16 = strerror(*v15);
    coap_log_impl(4, "coap_socket_connect_tcp1: ioctl FIONBIO: %s\n", v16);
  }
  int v17 = a1[109];
  if (v17 == 30)
  {
    if (!*(_WORD *)&v34[6]) {
      *(_WORD *)&v34[6] = bswap32(v12) >> 16;
    }
    if (setsockopt(*((_DWORD *)a1 + 44), 41, 27, &v36, 4u) == -1 && maxlog >= 4)
    {
      uint64_t v19 = __error();
      strerror(*v19);
      coap_log_impl(4, "coap_socket_connect_tcp1: setsockopt IPV6_V6ONLY: %s\n");
    }
  }
  else if (v17 == 2)
  {
    if (!*(_WORD *)&v34[6]) {
      *(_WORD *)&v34[6] = bswap32(v12) >> 16;
    }
  }
  else if (maxlog >= 1)
  {
    coap_log_impl(1, "coap_socket_connect_tcp1: unsupported sa_family\n");
  }
  int v20 = a1[21];
  if (!a1[21])
  {
    a1[141] = a1[109];
    goto LABEL_66;
  }
  *(void *)(a1 + 140) = 0;
  BOOL v21 = a1 + 140;
  *((_DWORD *)a1 + 41) = 0;
  *(void *)(a1 + 14_Block_object_dispose(&a9, 8) = 0;
  *(void *)(a1 + 156) = 0;
  size_t v22 = *((unsigned int *)a1 + 4);
  *((_DWORD *)a1 + 34) = v22;
  if (v20 == 2)
  {
    *BOOL v21 = *(_OWORD *)(a1 + 20);
  }
  else if (v20 == 30)
  {
    a1[141] = 30;
    *(_OWORD *)(a1 + 14_Block_object_dispose(&a9, 8) = *(_OWORD *)(a1 + 28);
    *((_WORD *)a1 + 71) = *((_WORD *)a1 + 11);
    *((_DWORD *)a1 + 41) = *((_DWORD *)a1 + 11);
  }
  else
  {
    memcpy(v21, a1 + 20, v22);
  }
  if (setsockopt(*((_DWORD *)a1 + 44), 0xFFFF, 4, &v37, 4u) == -1 && maxlog >= 4)
  {
    uint64_t v23 = __error();
    unsigned int v24 = strerror(*v23);
    coap_log_impl(4, "coap_socket_connect_tcp1: setsockopt SO_REUSEADDR: %s\n", v24);
  }
  if (a1[21] == 2) {
    socklen_t v25 = 16;
  }
  else {
    socklen_t v25 = *((_DWORD *)a1 + 4);
  }
  if (bind(*((_DWORD *)a1 + 44), (const sockaddr *)(a1 + 20), v25) == -1)
  {
    if (maxlog <= 3) {
      goto LABEL_88;
    }
    uint64_t v18 = "coap_socket_connect_tcp1: bind: %s\n";
LABEL_87:
    uint64_t v31 = __error();
    unsigned int v32 = strerror(*v31);
    coap_log_impl(4, v18, v32);
LABEL_88:
    int v33 = *((_DWORD *)a1 + 44);
    if (v33 != -1)
    {
      *((void *)a1 + 23) = 0;
      *((void *)a1 + 24) = 0;
      close(v33);
      *((_DWORD *)a1 + 44) = -1;
    }
    goto LABEL_90;
  }
LABEL_66:
  if (connect(*((_DWORD *)a1 + 44), (const sockaddr *)&v34[4], *(socklen_t *)v34) == -1)
  {
    if (*__error() == 36)
    {
      __int16 v28 = 132;
      goto LABEL_75;
    }
    if (maxlog <= 3) {
      goto LABEL_88;
    }
    uint64_t v18 = "coap_socket_connect_tcp1: connect: %s\n";
    goto LABEL_87;
  }
  if (getsockname(*((_DWORD *)a1 + 44), (sockaddr *)(a1 + 140), (socklen_t *)a1 + 34) == -1 && maxlog >= 4)
  {
    int v26 = __error();
    unsigned int v27 = strerror(*v26);
    coap_log_impl(4, "coap_socket_connect_tcp1: getsockname: %s\n", v27);
  }
  __int16 v28 = 4;
  if (getpeername(*((_DWORD *)a1 + 44), (sockaddr *)(a1 + 108), (socklen_t *)a1 + 26) == -1 && maxlog >= 4)
  {
    uint64_t v29 = __error();
    uint64_t v30 = strerror(*v29);
    coap_log_impl(4, "coap_socket_connect_tcp1: getpeername: %s\n", v30);
  }
LABEL_75:
  *((_WORD *)a1 + 90) |= v28;
  *((void *)a1 + 36) = 0;
  *((void *)a1 + 37) = 0;
  *((void *)a1 + 3_Block_object_dispose(&a9, 8) = 0;
  *(void *)unint64_t v34 = 0;
  *(void *)&v34[8] = 0;
  gettimeofday((timeval *)v34, 0);
  *((void *)a1 + 34) = 1000 * (*(void *)v34 - coap_clock_offset)
                       + ((unint64_t)((double)*(int *)&v34[8] * 1.024 + 512.0) >> 10);
  if ((*((_WORD *)a1 + 90) & 0x80) != 0)
  {
    a1[2] = 1;
    goto LABEL_79;
  }
  coap_handle_event(*((void *)a1 + 26), 4097, (uint64_t)a1);
  if (*a1 == 4)
  {
    a1[2] = 2;
    *((void *)a1 + 27) = 0;
    coap_handle_event(*((void *)a1 + 26), 512, (uint64_t)a1);
    coap_session_disconnected(a1, 3);
    return -1;
  }
  coap_session_send_csm(a1);
LABEL_9:
  if (*a2)
  {
    if (a1[2] == 4 && (~*((unsigned __int16 *)a1 + 90) & 0x21) != 0)
    {
LABEL_12:
      return coap_session_send_pdu(a1, (uint64_t)a2);
    }
    goto LABEL_79;
  }
  int v11 = *((unsigned __int16 *)a1 + 90);
  if ((~v11 & 0x1001) == 0)
  {
    if (maxlog >= 3) {
      coap_log_impl(3, "Multicast requests cannot be Confirmable (RFC7252 8.1)\n");
    }
    return -1;
  }
  if (a1[2] == 4 && !a1[226] && (~v11 & 0x21) != 0)
  {
    if (*a1 - 1 <= 1) {
      a1[226] = 1;
    }
    goto LABEL_12;
  }
LABEL_79:

  return coap_session_delay_pdu(a1, (uint64_t)a2, a3);
}

unint64_t coap_calc_timeout(_WORD *a1, int a2)
{
  return (1000
        * (unint64_t)(((((((unsigned __int16)(((8589935
                                                     * (unint64_t)(((unsigned __int16)a1[181] << 6) + 500)) >> 33)
                                                   + (a1[180] << 6))
                                - 64)
                               * a2
                               + 128) >> 8)
                             + 64)
                            * (unsigned __int16)(((8589935
                                                               * (unint64_t)(((unsigned __int16)a1[179] << 6)
                                                                                  + 500)) >> 33)
                                                             + (a1[178] << 6))
                            + 32) >> 6)
        + 32) >> 6;
}

uint64_t coap_wait_ack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ++*(_DWORD *)(a2 + 4);
  *(void *)(a3 + 24) = a2;
  v8.tv_sec = 0;
  *(void *)&v8.tv_usec = 0;
  gettimeofday(&v8, 0);
  unint64_t v5 = 1000 * (v8.tv_sec - coap_clock_offset) + ((unint64_t)((double)v8.tv_usec * 1.024 + 512.0) >> 10);
  if (*(void *)(a1 + 48))
  {
    unint64_t v6 = v5 - *(void *)(a1 + 40) + (*(_DWORD *)(a3 + 20) << *(unsigned char *)(a3 + 16));
  }
  else
  {
    unint64_t v6 = (*(_DWORD *)(a3 + 20) << *(unsigned char *)(a3 + 16));
    *(void *)(a1 + 40) = v5;
  }
  *(void *)(a3 + _Block_object_dispose(&a9, 8) = v6;
  coap_insert_node((void *)(a1 + 48), (void *)a3);
  if (maxlog >= 7)
  {
    coap_session_str(*(void *)(a3 + 24));
    coap_log_impl(7, "** %s: tid=%d: added to retransmit queue (%ums)\n", (const char *)&coap_session_str_szSession, *(_DWORD *)(a3 + 32), (unint64_t)((((125 * *(void *)(a3 + 8)) & 0x1FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4);
  }
  return *(unsigned int *)(a3 + 32);
}

void coap_handle_event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (maxlog >= 7) {
    coap_log_impl(7, "***EVENT: 0x%04x\n", a2);
  }
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 104);
  if (v6)
  {
    v6(a1, a2, a3);
  }
}

uint64_t coap_session_send_pdu(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 3);
  if (!*(unsigned char *)(a2 + 3)) {
    __assert_rtn("coap_session_send_pdu", "net.c", 685, "pdu->hdr_size > 0");
  }
  int v5 = *a1;
  if (v5 == 3)
  {
    uint64_t v7 = coap_session_write((uint64_t)a1, (const void *)(*(void *)(a2 + 40) - v2), *(void *)(a2 + 24) + v2);
  }
  else if (v5 == 1)
  {
    if (*((_WORD *)a1 + 90))
    {
      unint64_t v6 = a1 + 176;
    }
    else
    {
      uint64_t v8 = *((void *)a1 + 25);
      if (!v8) {
        __assert_rtn("coap_session_send", "coap_session.c", 221, "session->endpoint != NULL");
      }
      unint64_t v6 = (unsigned __int8 *)(v8 + 24);
    }
    uint64_t v9 = *(void *)(a2 + 24) + v2;
    uint64_t v7 = (*(uint64_t (**)(unsigned __int8 *, unsigned __int8 *, uint64_t, uint64_t))(*((void *)a1 + 26) + 112))(v6, a1, *(void *)(a2 + 40) - v2, v9);
    if (v7 == v9)
    {
      v12.tv_sec = 0;
      *(void *)&v12.tv_usec = 0;
      gettimeofday(&v12, 0);
      *((void *)a1 + 34) = 1000 * (v12.tv_sec - coap_clock_offset)
                           + ((unint64_t)((double)v12.tv_usec * 1.024 + 512.0) >> 10);
      if (maxlog <= 6)
      {
        uint64_t v7 = v9;
        goto LABEL_17;
      }
      uint64_t v10 = "*  %s: sent %zd bytes\n";
      goto LABEL_15;
    }
    if (maxlog >= 7)
    {
      uint64_t v10 = "*  %s: failed to send %zd bytes\n";
LABEL_15:
      coap_session_str((uint64_t)a1);
      coap_log_impl(7, v10, &coap_session_str_szSession, v9);
    }
  }
  else
  {
    uint64_t v7 = -1;
  }
LABEL_17:
  coap_show_pdu((unsigned __int8 *)a2);
  return v7;
}

unsigned __int8 *coap_new_error_response(unsigned __int8 *a1, int a2, uint64_t *a3)
{
  unsigned __int8 v4 = a2;
  uint64_t v6 = 0;
  unint64_t v7 = a1[4];
  unsigned __int8 v8 = 65;
  uint64_t v9 = &byte_1E69F4B40;
  while (a2 != v8)
  {
    ++v6;
    char v10 = *v9;
    v9 += 16;
    unsigned __int8 v8 = v10;
    if (v6 == 23)
    {
      int v11 = 0;
      char v12 = 1;
      goto LABEL_6;
    }
  }
  int v11 = (const char *)coap_error[2 * v6 + 1];
  char v12 = 0;
  v7 += strlen(v11) + 1;
LABEL_6:
  uint64_t v37 = 0;
  memset(v36, 0, sizeof(v36));
  int v13 = *a1;
  int v14 = *(unsigned __int16 *)a3;
  int v15 = 4;
  uint64_t v16 = 6;
  while ((v15 & v14) == 0 || *((unsigned char *)a3 + v16) != 12)
  {
    int v15 = (2 * v15) & 0x1FFF8;
    if (++v16 == 12) {
      goto LABEL_12;
    }
  }
  *(_WORD *)a3 = v14 & ~(_WORD)v15;
LABEL_12:
  coap_option_iterator_init((uint64_t)a1, (uint64_t)v36, a3);
  for (__int16 i = 0; ; __int16 i = WORD4(v36[0]))
  {
    uint64_t v18 = coap_option_next((uint64_t)v36);
    if (!v18) {
      break;
    }
    uint64_t v19 = v18;
    unsigned int v20 = (unsigned __int16)(WORD4(v36[0]) - i);
    if (v20 < 0x10D) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 3;
    }
    if (v20 < 0xD) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
    v7 += v22 + coap_opt_length(v18);
    int v23 = *v19 & 0xF;
    if (v23 != 13)
    {
      if (v23 != 14) {
        continue;
      }
      ++v7;
    }
    ++v7;
  }
  if (v13) {
    unsigned __int8 v24 = 1;
  }
  else {
    unsigned __int8 v24 = 2;
  }
  socklen_t v25 = coap_pdu_init(v24, v4, *((_WORD *)a1 + 3), v7);
  int v26 = v25;
  if (v25)
  {
    if (coap_add_token((uint64_t)v25, a1[4], *((const void **)a1 + 5)))
    {
      coap_option_iterator_init((uint64_t)a1, (uint64_t)v36, a3);
      while (1)
      {
        unsigned int v27 = coap_option_next((uint64_t)v36);
        if (!v27) {
          break;
        }
        __int16 v28 = v27;
        unsigned int v29 = WORD4(v36[0]);
        size_t v30 = coap_opt_length(v27);
        uint64_t v31 = coap_opt_value(v28);
        coap_add_option((uint64_t)v26, v29, v30, v31);
      }
      if ((v12 & 1) == 0)
      {
        size_t v32 = strlen(v11);
        if (v32)
        {
          size_t v33 = v32;
          unint64_t v34 = (void *)coap_add_data_after(v26, v32);
          if (v34) {
            memcpy(v34, v11, v33);
          }
        }
      }
    }
    else
    {
      if (maxlog >= 7) {
        coap_log_impl(7, "cannot add token to error response\n", *(void *)&v36[0]);
      }
      coap_delete_pdu(v26);
      return 0;
    }
  }
  return v26;
}

unsigned __int8 *coap_send_message_type(unsigned __int8 *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t result = coap_pdu_init(3u, 0, *(_WORD *)(a2 + 6), 0);
    if (result)
    {
      return (unsigned __int8 *)coap_send(v2, (uint64_t)result);
    }
  }
  return result;
}

void coap_handle_dgram_for_proto(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*a2 == 1)
  {
    size_t v6 = *(void *)(a3 + 72);
    unint64_t v7 = coap_pdu_init(0, 0, 0, v6 - 4);
    if (v7)
    {
      if (v6
        && (v8 = (unsigned __int8 *)(a3 + 80), v9 = *a2, unint64_t v10 = coap_pdu_parse_header_size(v9, v8), v10 - 1 < v6)
        && (unint64_t v11 = v10, v10 <= v7[2])
        && coap_pdu_resize((uint64_t)v7, v6 - v10)
        && (memcpy((void *)(*((void *)v7 + 5) - v11), v8, v6),
            v7[3] = v11,
            *((void *)v7 + 3) = v6 - v11,
            coap_pdu_parse_header((uint64_t)v7, v9))
        && coap_pdu_parse_opt((uint64_t)v7))
      {
        coap_dispatch(a1, a2, (uint64_t)v7);
      }
      else if (maxlog >= 4)
      {
        coap_log_impl(4, "discard malformed PDU\n");
      }
    }
    coap_delete_pdu(v7);
  }
}

void coap_read_session()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v43 = v2;
  uint64_t v44 = v0;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((*((_WORD *)v1 + 90) & 0x1004) == 0) {
    __assert_rtn("coap_read_session", "net.c", 1218, "session->sock.flags & (COAP_SOCKET_CONNECTED | COAP_SOCKET_MULTICAST)");
  }
  uint64_t v3 = v1;
  unsigned __int8 v4 = (int *)(v1 + 176);
  long long v49 = 0u;
  memset(v50, 0, 432);
  long long v47 = 0u;
  long long v48 = 0u;
  int v5 = *v1;
  long long v45 = 0u;
  long long v46 = 0u;
  if ((v5 - 1) <= 1)
  {
    long long v6 = *(_OWORD *)(v1 + 120);
    long long v45 = *(_OWORD *)(v1 + 104);
    long long v46 = v6;
    long long v7 = *(_OWORD *)(v1 + 152);
    long long v47 = *(_OWORD *)(v1 + 136);
    long long v48 = v7;
    uint64_t v8 = (*(uint64_t (**)(int *, long long *))(v0 + 120))(v4, &v45);
    uint64_t v9 = v8;
    if (v8 < 0)
    {
      if (v8 == -2)
      {
        int v38 = v3;
        int v39 = 4;
LABEL_91:
        coap_session_disconnected(v38, v39);
      }
      else if (maxlog >= 4)
      {
        coap_session_str((uint64_t)v3);
        coap_log_impl(4, "*  %s: read error\n", (const char *)&coap_session_str_szSession);
      }
    }
    else if (v8)
    {
      *((void *)v3 + 34) = v43;
      long long v10 = v46;
      *(_OWORD *)(v3 + 104) = v45;
      *(_OWORD *)(v3 + 120) = v10;
      long long v11 = v48;
      *(_OWORD *)(v3 + 136) = v47;
      *(_OWORD *)(v3 + 152) = v11;
      if (maxlog >= 7)
      {
        coap_session_str((uint64_t)v3);
        coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v9);
      }
      coap_handle_dgram_for_proto(v44, v3, (uint64_t)&v45);
    }
    return;
  }
  char v12 = (unsigned __int8 *)v50;
  int v13 = (uint64_t *)(v1 + 256);
  int v14 = v1 + 248;
  uint64_t v42 = (int *)(v1 + 176);
LABEL_9:
  if (v5 != 3)
  {
    if (v5 != 4) {
      return;
    }
    goto LABEL_90;
  }
  ssize_t v15 = recv(*v4, v50, 0x1000uLL, 0);
  if (v15 != -1)
  {
    ssize_t v16 = v15;
    if (!v15)
    {
      *((_WORD *)v3 + 90) &= ~0x100u;
      goto LABEL_90;
    }
    if (v15 <= 4095)
    {
      *((_WORD *)v3 + 90) &= ~0x100u;
      if (v15 < 1)
      {
        unint64_t v17 = v15;
LABEL_89:
        if ((v17 & 0x8000000000000000) == 0) {
          return;
        }
LABEL_90:
        int v38 = v3;
        int v39 = 1;
        goto LABEL_91;
      }
    }
    if (maxlog >= 7)
    {
      coap_session_str((uint64_t)v3);
      coap_log_impl(7, "*  %s: received %zd bytes\n", (const char *)&coap_session_str_szSession, v16);
    }
    *((void *)v3 + 34) = v43;
    unint64_t v17 = v16;
    while (1)
    {
      uint64_t v18 = *((void *)v3 + 33);
      if (v18)
      {
        uint64_t v19 = *(unsigned __int8 *)(v18 + 3);
        unint64_t v20 = *(void *)(v18 + 24) + v19 - *v13;
        if (v20 >= v17) {
          size_t v21 = v17;
        }
        else {
          size_t v21 = *(void *)(v18 + 24) + v19 - *v13;
        }
        memcpy((void *)(*(void *)(v18 + 40) - v19 + *v13), v12, v21);
        if (v20 <= v17)
        {
          if (coap_pdu_parse_header(*((void *)v3 + 33), *v3)
            && coap_pdu_parse_opt(*((void *)v3 + 33)))
          {
            coap_dispatch(v44, v3, *((void *)v3 + 33));
          }
          coap_delete_pdu(*((void **)v3 + 33));
          uint64_t v22 = 0;
          *((void *)v3 + 33) = 0;
        }
        else
        {
          uint64_t v22 = *v13 + v21;
        }
        v17 -= v21;
        v12 += v21;
      }
      else
      {
        uint64_t v23 = *v13;
        if (*v13)
        {
          int v24 = *v3;
          if ((v24 - 3) > 1)
          {
            size_t v28 = 4 * ((v24 - 1) < 2);
          }
          else
          {
            unsigned int v25 = *v14;
            uint64_t v26 = 6;
            if (v25 >> 4 == 14) {
              uint64_t v26 = 4;
            }
            uint64_t v27 = 3;
            if (v25 >> 4 != 13) {
              uint64_t v27 = v26;
            }
            if (v25 >= 0xD0) {
              size_t v28 = v27;
            }
            else {
              size_t v28 = 2;
            }
          }
          unint64_t v29 = v28 - v23;
          if (v28 - v23 >= v17) {
            size_t v30 = v17;
          }
          else {
            size_t v30 = v28 - v23;
          }
          memcpy(&v14[v23], v12, v30);
          unint64_t v31 = v17 - v30;
          v12 += v30;
          if (v29 > v17)
          {
            *v13 += v31;
LABEL_71:
            unint64_t v17 = v31;
            goto LABEL_72;
          }
          if (*v3 - 3 >= 2) {
            __assert_rtn("coap_pdu_parse_size", "pdu.c", 432, "proto == COAP_PROTO_TCP || proto == COAP_PROTO_TLS");
          }
          unint64_t v32 = *v14;
          if (v32 <= 0xCF)
          {
            if (v28 < 2) {
              goto LABEL_94;
            }
            uint64_t v33 = v32 >> 4;
            goto LABEL_63;
          }
          unsigned int v34 = v32 >> 4;
          unint64_t v35 = 6;
          if (v32 >> 4 == 14) {
            unint64_t v35 = 4;
          }
          if (v34 == 13) {
            unint64_t v35 = 3;
          }
          if (v35 > v28) {
LABEL_94:
          }
            __assert_rtn("coap_pdu_parse_size", "pdu.c", 433, "coap_pdu_parse_header_size(proto, data) <= length");
          if (v34 == 13)
          {
            uint64_t v33 = v3[249] + 13;
LABEL_63:
            unint64_t v36 = v33 + (v32 & 0xF);
            uint64_t v37 = coap_pdu_init(0, 0, 0, v36);
            *((void *)v3 + 33) = v37;
            if (!v37) {
              goto LABEL_90;
            }
            if (*((void *)v37 + 2) < v36)
            {
              if (!coap_pdu_resize((uint64_t)v37, v36)) {
                goto LABEL_90;
              }
              uint64_t v37 = (unsigned __int8 *)*((void *)v3 + 33);
            }
            v37[3] = v28;
            *((void *)v37 + 3) = v36;
            memcpy((void *)(*((void *)v37 + 5) - v28), v3 + 248, v28);
            uint64_t *v13 = v28;
            if (!v36)
            {
              if (coap_pdu_parse_header(*((void *)v3 + 33), *v3)) {
                coap_dispatch(v44, v3, *((void *)v3 + 33));
              }
              coap_delete_pdu(*((void **)v3 + 33));
              uint64_t *v13 = 0;
              *((void *)v3 + 33) = 0;
            }
            goto LABEL_71;
          }
          if (v28 >= 3)
          {
            if (v34 == 14)
            {
              uint64_t v33 = __rev16(*(unsigned __int16 *)(v3 + 249)) + 269;
              goto LABEL_63;
            }
            if (v28 >= 5)
            {
              uint64_t v33 = bswap32(*(_DWORD *)(v3 + 249)) + 65805;
              goto LABEL_63;
            }
          }
          uint64_t v33 = 0;
          goto LABEL_63;
        }
        v3[248] = *v12;
        if (*v3 - 1 > 3) {
          goto LABEL_90;
        }
        --v17;
        ++v12;
        uint64_t v22 = 1;
      }
      uint64_t *v13 = v22;
LABEL_72:
      if ((uint64_t)v17 <= 0)
      {
        if (v16 != 4096 || v17) {
          goto LABEL_89;
        }
        int v5 = *v3;
        char v12 = (unsigned __int8 *)v50;
        unsigned __int8 v4 = v42;
        goto LABEL_9;
      }
    }
  }
  *((_WORD *)v3 + 90) &= ~0x100u;
  if (*__error() != 35 && *__error() != 4)
  {
    if (*__error() != 54 && maxlog >= 4)
    {
      unint64_t v40 = __error();
      unint64_t v41 = strerror(*v40);
      coap_log_impl(4, "coap_socket_read: recv: %s\n", v41);
    }
    goto LABEL_90;
  }
}

void coap_write_session(uint64_t a1, uint64_t a2)
{
  if ((*(_WORD *)(a1 + 180) & 4) == 0) {
    __assert_rtn("coap_write_session", "net.c", 1164, "session->sock.flags & COAP_SOCKET_CONNECTED");
  }
  for (uint64_t i = *(void *)(a1 + 232); i; uint64_t i = *(void *)(a1 + 232))
  {
    if (maxlog >= 7)
    {
      coap_session_str(a1);
      coap_log_impl(7, "** %s: tid=%d: transmitted after delay\n", (const char *)&coap_session_str_szSession, *(unsigned __int16 *)(*(void *)(i + 40) + 6));
    }
    unint64_t v5 = *(void *)(a1 + 240);
    uint64_t v6 = *(void *)(i + 40);
    uint64_t v7 = *(unsigned __int8 *)(v6 + 3);
    unint64_t v8 = *(void *)(v6 + 24) + v7;
    if (v8 <= v5) {
      __assert_rtn("coap_write_session", "net.c", 1171, "session->partial_write < q->pdu->used_size + q->pdu->hdr_size");
    }
    if (*(unsigned char *)a1 != 3) {
      break;
    }
    uint64_t v9 = coap_session_write(a1, (const void *)(*(void *)(v6 + 40) - v7 - v5), v8 - v5);
    if (v9 < 1) {
      break;
    }
    *(void *)(a1 + 272) = a2;
    uint64_t v10 = *(void *)(a1 + 240);
    if (v9 < *(void *)(*(void *)(i + 40) + 24)
            + (unint64_t)*(unsigned __int8 *)(*(void *)(i + 40) + 3)
            - v10)
    {
      *(void *)(a1 + 240) = v10 + v9;
      return;
    }
    *(void *)(a1 + 232) = *(void *)i;
    *(void *)(a1 + 240) = 0;
    coap_delete_node((void **)i);
  }
}

void coap_dispatch(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  uint64_t v137 = 0;
  if (maxlog >= 7) {
    coap_show_pdu((unsigned __int8 *)a3);
  }
  int v143 = 0;
  uint64_t v142 = 0;
  switch(*(unsigned char *)a3)
  {
    case 0:
      if (coap_option_check_critical((_WORD *)a1, a3, &v142)) {
        goto LABEL_5;
      }
      uint64_t v43 = coap_new_error_response((unsigned __int8 *)a3, 130, &v142);
      if (!v43)
      {
        if (maxlog >= 4) {
          coap_log_impl(4, "coap_dispatch: cannot create error response\n");
        }
        goto LABEL_142;
      }
      uint64_t v6 = 0;
      if (coap_send(a2, (uint64_t)v43) == -1 && maxlog >= 4)
      {
        coap_log_impl(4, "coap_dispatch: error sending response\n");
        goto LABEL_142;
      }
      goto LABEL_285;
    case 1:
      uint64_t v6 = 0;
      if (coap_option_check_critical((_WORD *)a1, a3, &v142)) {
        goto LABEL_15;
      }
      goto LABEL_285;
    case 2:
      coap_remove_from_queue((void **)(a1 + 48), (uint64_t)a2, *(unsigned __int16 *)(a3 + 6), &v137);
      if (a2[226])
      {
        --a2[226];
        if (a2[2] == 4) {
          coap_session_connected(a2);
        }
      }
      uint64_t v6 = v137;
      if (*(unsigned char *)(a3 + 1))
      {
        if (v137)
        {
          uint64_t v7 = *(void *)(v137 + 40);
          if ((*(unsigned char *)(v7 + 1) & 0xE0) == 0x40)
          {
            long long v139 = 0uLL;
            uint64_t v8 = *(unsigned __int8 *)(v7 + 4);
            uint64_t v9 = *(void *)(v7 + 40);
            *(void *)&long long v139 = v8;
            *((void *)&v139 + 1) = v9;
            coap_touch_observer(*(void **)(a1 + 16), *(void *)(v137 + 24), (uint64_t)&v139);
          }
        }
        goto LABEL_15;
      }
      goto LABEL_285;
    case 3:
      if (*((_DWORD *)a2 + 57) == *(unsigned __int16 *)(a3 + 6) && *(_DWORD *)(a1 + 204) && *((void *)a2 + 36))
      {
        int v22 = 0;
      }
      else
      {
        int v22 = 1;
        if (maxlog >= 1) {
          coap_log_impl(1, "got RST for message %d\n", *(unsigned __int16 *)(a3 + 6));
        }
      }
      if (a2[226])
      {
        --a2[226];
        if (a2[2] == 4) {
          coap_session_connected(a2);
        }
      }
      coap_remove_from_queue((void **)(a1 + 48), (uint64_t)a2, *(unsigned __int16 *)(a3 + 6), &v137);
      uint64_t v6 = v137;
      if (v137)
      {
        uint64_t v51 = *(void *)(v137 + 40);
        uint64_t v52 = *(unsigned __int8 *)(v51 + 4);
        uint64_t v53 = *(void *)(v51 + 40);
        *(void *)&long long v139 = v52;
        *((void *)&v139 + 1) = v53;
        uint64_t v54 = *(void *)(a1 + 16);
        if (v54)
        {
          do
          {
            uint64_t v55 = *(void *)(v54 + 80);
            coap_cancel_all_messages(a1, *(void *)(v6 + 24), *((void **)&v139 + 1), v139);
            coap_delete_observer(v54, *(void *)(v6 + 24), (uint64_t)&v139);
            uint64_t v54 = v55;
          }
          while (v55);
        }
        if (v22)
        {
          if (!**(unsigned char **)(v6 + 40))
          {
            size_t v56 = *(void (**)(uint64_t, void))(a1 + 80);
            if (v56) {
              v56(a1, *(void *)(v6 + 24));
            }
          }
        }
        else
        {
          v61 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, void))(a1 + 96);
          if (v61) {
            v61(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
          }
          *((void *)a2 + 37) = *((void *)a2 + 34);
          *((_DWORD *)a2 + 57) = -1;
        }
      }
      else
      {
        uint64_t v57 = *(void *)(a1 + 16);
        if (v57)
        {
          while (1)
          {
            uint64_t v58 = *(void *)(v57 + 80);
            int v59 = *(uint64_t **)(v57 + 128);
            if (v59) {
              break;
            }
LABEL_116:
            uint64_t v6 = 0;
            uint64_t v57 = *(void *)(v57 + 80);
            if (!v58) {
              goto LABEL_285;
            }
          }
          while (1)
          {
            uint64_t v60 = (uint64_t *)*v59;
            if (*((unsigned __int16 *)v59 + 9) == *(unsigned __int16 *)(a3 + 6) && (unsigned __int8 *)v59[1] == a2) {
              break;
            }
            int v59 = (uint64_t *)*v59;
            if (!v60) {
              goto LABEL_116;
            }
          }
          *(void *)&long long v139 = v59[4];
          *((void *)&v139 + 1) = v59 + 5;
          coap_delete_observer(v57, (uint64_t)a2, (uint64_t)&v139);
        }
LABEL_142:
        uint64_t v6 = 0;
      }
      goto LABEL_285;
    default:
LABEL_5:
      uint64_t v6 = 0;
LABEL_15:
      unsigned int v10 = *(unsigned __int8 *)(a3 + 1);
      if (v10 >= 0xE0)
      {
        uint64_t v141 = 0;
        long long v139 = 0u;
        long long v140 = 0u;
        coap_option_iterator_init(a3, (uint64_t)&v139, 0);
        switch(*(unsigned char *)(a3 + 1))
        {
          case 0xE1:
            goto LABEL_121;
          case 0xE2:
            int v69 = coap_pdu_init(0, 0xE3u, 0, 1uLL);
            uint64_t v70 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, void))(a1 + 88);
            if (v70) {
              v70(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
            }
            if (v69)
            {
              coap_add_option((uint64_t)v69, 2u, 0, 0);
              coap_send(a2, (uint64_t)v69);
            }
            goto LABEL_285;
          case 0xE3:
            *((void *)a2 + 37) = *((void *)a2 + 34);
            v71 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, void))(a1 + 96);
            if (v71) {
              v71(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
            }
            goto LABEL_285;
          case 0xE4:
          case 0xE5:
            coap_session_disconnected(a2, 2);
            goto LABEL_285;
          default:
            goto LABEL_285;
        }
        while (1)
        {
          do
          {
LABEL_121:
            int v62 = coap_option_next((uint64_t)&v139);
            if (!v62)
            {
              if (a2[2] == 3) {
                coap_session_connected(a2);
              }
              goto LABEL_285;
            }
          }
          while (WORD4(v139) != 2);
          int v63 = v62;
          uint64_t v64 = coap_opt_value(v62);
          unsigned int v65 = coap_opt_length(v63);
          unsigned int v66 = 0;
          if (!v65) {
            break;
          }
          uint64_t v67 = v65;
          do
          {
            int v68 = *v64++;
            unsigned int v66 = v68 | (v66 << 8);
            --v67;
          }
          while (v67);
          *((_DWORD *)a2 + 3) = v66;
          if (*((_DWORD *)a2 + 2) >= v66)
          {
LABEL_129:
            *((_DWORD *)a2 + 2) = v66;
            if (maxlog >= 3) {
              coap_log_impl(3, "DTLS overhead exceeds MTU\n");
            }
          }
        }
        *((_DWORD *)a2 + 3) = 0;
        goto LABEL_129;
      }
      if (v10 - 1 > 0x1E)
      {
        if (v10 < 0x40)
        {
          if (!*(unsigned char *)(a3 + 1))
          {
            uint64_t v44 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, void))(a1 + 88);
            if (v44) {
              v44(a1, a2, a3, *(unsigned __int16 *)(a3 + 6));
            }
          }
          if (maxlog >= 7) {
            coap_log_impl(7, "dropped message with invalid code (%d.%02d)\n", *(unsigned __int8 *)(a3 + 1) >> 5, *(unsigned char *)(a3 + 1) & 0x1F);
          }
          int v45 = a2[141];
          if (v45 == 2)
          {
            if ((*((_DWORD *)a2 + 36) & 0xF0) == 0xE0) {
              goto LABEL_285;
            }
          }
          else if (v45 == 30 && a2[148] == 255)
          {
            goto LABEL_285;
          }
          if (*(unsigned char *)(a3 + 1))
          {
            coap_send_message_type(a2, a3);
          }
          else if (*a2 - 3 >= 2)
          {
            *(void *)&long long v139 = 0;
            coap_ticks(&v139);
            uint64_t v74 = v139;
            if (*((void *)a2 + 35) + 250 < (unint64_t)v139)
            {
              coap_send_message_type(a2, a3);
              *((void *)a2 + 35) = v74;
            }
          }
        }
        else
        {
          if (v6) {
            uint64_t v23 = *(void *)(v6 + 40);
          }
          else {
            uint64_t v23 = 0;
          }
          if (!*(unsigned char *)a3 && *a2 - 1 <= 1)
          {
            int v72 = coap_pdu_init(2u, 0, *(_WORD *)(a3 + 6), 0);
            if (v72) {
              coap_send(a2, (uint64_t)v72);
            }
          }
          coap_cancel_all_messages(a1, (uint64_t)a2, *(void **)(a3 + 40), *(unsigned __int8 *)(a3 + 4));
          int v73 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t, uint64_t, void))(a1 + 72);
          if (v73) {
            v73(a1, a2, v23, a3, *(unsigned __int16 *)(a3 + 6));
          }
        }
      }
      else
      {
        int v147 = 0;
        uint64_t v146 = 0;
        uint64_t v141 = 0;
        long long v139 = 0u;
        long long v140 = 0u;
        LODWORD(v145) = 0;
        uint64_t v144 = 0;
        coap_option_filter_op(&v144, 0xBu, 0);
        coap_option_iterator_init(a3, (uint64_t)&v139, &v144);
        for (uint64_t i = 0; ; ++i)
        {
          char v12 = coap_option_next((uint64_t)&v139);
          if (!v12) {
            break;
          }
          int v13 = v12;
          unsigned int v14 = coap_opt_length(v12);
          ssize_t v15 = coap_opt_value(v13);
          if (v14)
          {
            uint64_t v16 = v14;
            do
            {
              int v18 = *v15++;
              int v17 = v18;
              unsigned int v19 = (v18 & 0xFFFFFFDF) - 65;
              BOOL v20 = (v18 - 48) >= 0xA && v19 >= 0x1A;
              if (v20
                && ((v17 - 33) <= 0x3E
                  ? (BOOL v21 = ((1 << (v17 - 33)) & 0x4000000096003FC9) == 0)
                  : (BOOL v21 = 1),
                    v21 && v17 != 126))
              {
                if (v17 == 38) {
                  ++i;
                }
                else {
                  i += 3;
                }
              }
              else
              {
                ++i;
              }
              --v16;
            }
            while (v16);
          }
        }
        if (i) {
          uint64_t v24 = i - 1;
        }
        else {
          uint64_t v24 = 0;
        }
        unsigned int v25 = coap_new_string(v24);
        if (v25)
        {
          v134 = a2;
          v135 = v25;
          *unsigned int v25 = v24;
          uint64_t v26 = (unsigned char *)v25[1];
          v136 = (unsigned __int8 *)a3;
          coap_option_iterator_init(a3, (uint64_t)&v139, &v144);
          int v27 = 0;
          while (1)
          {
            size_t v28 = coap_option_next((uint64_t)&v139);
            if (!v28) {
              break;
            }
            unint64_t v29 = v28;
            if (v27) {
              *v26++ = 47;
            }
            ++v27;
            unsigned int v30 = coap_opt_length(v28);
            unint64_t v31 = coap_opt_value(v29);
            if (v30)
            {
              uint64_t v32 = v30;
              do
              {
                int v33 = *v31;
                BOOL v34 = (v33 - 48) >= 0xA && (v33 & 0xFFFFFFDF) - 65 >= 0x1A;
                if (v34
                  && ((v33 - 33) <= 0x3E
                    ? (BOOL v35 = ((1 << (v33 - 33)) & 0x4000000096003FE9) == 0)
                    : (BOOL v35 = 1),
                      v35 && v33 != 126))
                {
                  *uint64_t v26 = 37;
                  v26[1] = a0123456789abcd_0[(unint64_t)*v31 >> 4];
                  v26[2] = a0123456789abcd_0[*v31 & 0xF];
                  v26 += 3;
                }
                else
                {
                  *v26++ = v33;
                }
                ++v31;
                --v32;
              }
              while (v32);
            }
          }
          unint64_t v36 = v135;
          size_t v37 = *v135;
          size_t v38 = v135[1];
          resource_from_uri_path = (unsigned char *)coap_get_resource_from_uri_path(a1, *v135, (unsigned __int8 *)v38);
          unint64_t v40 = resource_from_uri_path;
          if (resource_from_uri_path && (*resource_from_uri_path & 0x10) == 0)
          {
            uint64_t v41 = (uint64_t)resource_from_uri_path;
            uint64_t v42 = v134;
            goto LABEL_171;
          }
          uint64_t v42 = v134;
          if (v37 == 16
            && (*(void *)v38 == 0x6E6B2D6C6C65772ELL
              ? (BOOL v46 = *(void *)(v38 + 8) == 0x65726F632F6E776FLL)
              : (BOOL v46 = 0),
                v46))
          {
            uint64_t v48 = (uint64_t)v136;
            if (v136[1] == 1)
            {
              if (maxlog >= 6) {
                coap_log_impl(6, "create default response for %s\n", ".well-known/core");
              }
              uint64_t v75 = (void *)coap_wellknown_response(a1, v134, v136);
              goto LABEL_167;
            }
            if (maxlog >= 7) {
              coap_log_impl(7, "method not allowed for .well-known/core\n");
            }
            long long v49 = v136;
            int v50 = 133;
          }
          else
          {
            uint64_t v41 = *(void *)(a1 + 24);
            uint64_t v47 = v136[1];
            if (v41 && (unint64_t)(v47 - 1) <= 6 && *(void *)(v41 + 8 * (v47 - 1) + 8)) {
              goto LABEL_171;
            }
            if (v47 == 4)
            {
              if (maxlog >= 7) {
                coap_log_impl(7, "request for unknown resource '%*.*s', return 2.02\n", v37, v37, (const char *)v38);
              }
              uint64_t v48 = (uint64_t)v136;
              long long v49 = v136;
              int v50 = 66;
            }
            else
            {
              if (maxlog >= 7) {
                coap_log_impl(7, "request for unknown resource '%*.*s', return 4.04\n", v37, v37, (const char *)v38);
              }
              uint64_t v48 = (uint64_t)v136;
              long long v49 = v136;
              int v50 = 132;
            }
          }
          uint64_t v75 = coap_new_error_response(v49, v50, &v146);
LABEL_167:
          uint64_t v76 = (uint64_t)v75;
          if (!v40)
          {
            if (!v75)
            {
LABEL_284:
              free(v36);
              goto LABEL_285;
            }
            if (no_response(v48, (uint64_t)v75) != 1)
            {
              if (coap_send(v134, v76) == -1 && maxlog >= 4) {
                coap_log_impl(4, "cannot send response for transaction %u\n");
              }
              goto LABEL_284;
            }
            v102 = (void *)v76;
LABEL_271:
            coap_delete_pdu(v102);
            goto LABEL_284;
          }
          if (v75) {
            coap_delete_pdu(v75);
          }
          uint64_t v41 = (uint64_t)v40;
LABEL_171:
          uint64_t v77 = v136;
          unint64_t v78 = v136[1] - 1;
          if (v78 > 6
            || (int v79 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t *, unsigned __int8 *, unsigned __int8 *))(v41 + 8 * v78 + 8)) == 0)
          {
            if (*v135 == 16
              && ((v97 = (uint64_t *)v135[1], v99 = *v97, uint64_t v98 = v97[1], v99 == 0x6E6B2D6C6C65772ELL)
                ? (BOOL v100 = v98 == 0x65726F632F6E776FLL)
                : (BOOL v100 = 0),
                  v100))
            {
              if (maxlog >= 7) {
                coap_log_impl(7, "create default response for %s\n", ".well-known/core");
              }
              v114 = (unsigned __int8 *)coap_wellknown_response(a1, v42, v136);
              v101 = v114;
              if (maxlog >= 7) {
                coap_log_impl(7, "have wellknown response %p\n", v114);
              }
            }
            else
            {
              v101 = coap_new_error_response(v136, 133, &v146);
            }
            if (!v101) {
              goto LABEL_284;
            }
            if (no_response((uint64_t)v136, (uint64_t)v101) != 1)
            {
              if (coap_send(v42, (uint64_t)v101) == -1 && maxlog >= 7) {
                coap_log_impl(7, "cannot send response for transaction %d\n");
              }
              goto LABEL_284;
            }
            v102 = v101;
            goto LABEL_271;
          }
          v133 = v79;
          uint64_t v141 = 0;
          long long v139 = 0u;
          long long v140 = 0u;
          LODWORD(v145) = 0;
          uint64_t v144 = 0;
          coap_option_filter_op(&v144, 0xFu, 0);
          coap_option_iterator_init((uint64_t)v136, (uint64_t)&v139, &v144);
          for (unint64_t j = 0; ; ++j)
          {
            int v81 = coap_option_next((uint64_t)&v139);
            uint64_t v82 = v81;
            if (!v81) {
              break;
            }
            unsigned int v83 = coap_opt_length(v81);
            int v84 = coap_opt_value(v82);
            if (v83)
            {
              uint64_t v85 = v83;
              do
              {
                int v87 = *v84++;
                int v86 = v87;
                unsigned int v88 = (v87 & 0xFFFFFFDF) - 65;
                unsigned int v89 = v87 - 48;
                BOOL v90 = v87 == 126;
                uint64_t v91 = (1 << (v87 - 33)) & 0x4000000096003FE9;
                int v93 = (v87 - 33) <= 0x3E && v91 != 0 || v90;
                if (v89 >= 0xA && v88 >= 0x1A) {
                  int v95 = v93;
                }
                else {
                  int v95 = 1;
                }
                if ((v86 & 0xFFFFFFEF) == 0x2F) {
                  int v96 = 1;
                }
                else {
                  int v96 = v95;
                }
                if (v96) {
                  ++j;
                }
                else {
                  j += 3;
                }
                --v85;
              }
              while (v85);
            }
          }
          if (j) {
            uint64_t v103 = j - 1;
          }
          else {
            uint64_t v103 = 0;
          }
          unint64_t v36 = v135;
          if (j >= 2)
          {
            v104 = (unsigned __int8 *)coap_new_string(v103);
            uint64_t v82 = v104;
            if (v104)
            {
              uint64_t v132 = v41;
              *(void *)v104 = v103;
              v105 = (unsigned char *)*((void *)v104 + 1);
              coap_option_iterator_init((uint64_t)v136, (uint64_t)&v139, &v144);
              while (1)
              {
                v106 = coap_option_next((uint64_t)&v139);
                if (!v106) {
                  break;
                }
                v107 = v106;
                if (v105 != *((unsigned char **)v82 + 1)) {
                  *v105++ = 38;
                }
                unsigned int v108 = coap_opt_length(v106);
                v109 = coap_opt_value(v107);
                if (v108)
                {
                  uint64_t v110 = v108;
                  do
                  {
                    int v111 = *v109;
                    BOOL v112 = (v111 - 48) >= 0xA && (v111 & 0xFFFFFFDF) - 65 >= 0x1A;
                    if (!v112
                      || ((v111 - 33) <= 0x3E
                        ? (BOOL v113 = ((1 << (v111 - 33)) & 0x4000000096003FE9) == 0)
                        : (BOOL v113 = 1),
                          !v113 || v111 == 126 || (v111 & 0xFFFFFFEF) == 0x2F))
                    {
                      *v105++ = v111;
                    }
                    else
                    {
                      unsigned char *v105 = 37;
                      v105[1] = a0123456789abcd_0[(unint64_t)*v109 >> 4];
                      v105[2] = a0123456789abcd_0[*v109 & 0xF];
                      v105 += 3;
                    }
                    ++v109;
                    --v110;
                  }
                  while (v110);
                }
              }
              uint64_t v42 = v134;
              unint64_t v36 = v135;
              uint64_t v77 = v136;
              uint64_t v41 = v132;
            }
          }
          if (maxlog >= 7) {
            coap_log_impl(7, "call custom handler for resource '%*.*s'\n", **(void **)(v41 + 136), **(void **)(v41 + 136), *(const char **)(*(void *)(v41 + 136) + 8));
          }
          int v115 = *v77;
          __int16 v116 = *((_WORD *)v77 + 3);
          unint64_t v117 = coap_session_max_pdu_size(v42);
          if (v115) {
            unsigned __int8 v118 = 1;
          }
          else {
            unsigned __int8 v118 = 2;
          }
          v119 = coap_pdu_init(v118, 0, v116, v117);
          if (!coap_add_token((uint64_t)v119, v77[4], *((const void **)v77 + 5)))
          {
            if (maxlog >= 4) {
              coap_log_impl(4, "cannot generate response\r\n");
            }
            if (v119) {
              __assert_rtn("handle_request", "net.c", 2310, "response == NULL");
            }
            goto LABEL_284;
          }
          uint64_t v120 = (uint64_t)v77;
          v121 = 0;
          uint64_t v122 = *(void *)(v120 + 40);
          uint64_t v144 = *(unsigned __int8 *)(v120 + 4);
          uint64_t v145 = v122;
          uint64_t v141 = 0;
          long long v139 = 0u;
          long long v140 = 0u;
          if ((*(unsigned char *)v41 & 4) != 0)
          {
            v123 = coap_check_option(v120, 6u, (uint64_t)&v139);
            v121 = v123;
            if (v123)
            {
              v124 = coap_opt_value(v123);
              int v125 = coap_opt_length(v121);
              if (!v125) {
                goto LABEL_255;
              }
              for (uint64_t k = 0; k != v125; v127 = k++)
                ;
              if ((v124[v127] & 1) == 0)
              {
LABEL_255:
                uint64_t v138 = 0;
                char v128 = coap_get_block((uint64_t)v136, (uint64_t)&v138) != 0;
                if (coap_add_observer(v41, (uint64_t)v42, (uint64_t)&v144, v82, v128, v138)) {
                  coap_touch_observer(*(void **)(a1 + 16), (uint64_t)v42, (uint64_t)&v144);
                }
                v133(a1, v41, v42, v136, &v144, v82, v119);
                goto LABEL_269;
              }
              coap_delete_observer(v41, (uint64_t)v42, (uint64_t)&v144);
            }
            uint64_t v120 = (uint64_t)v136;
          }
          v133(a1, v41, v42, (unsigned __int8 *)v120, &v144, v82, v119);
          if (v82) {
            free(v82);
          }
LABEL_269:
          int v129 = no_response((uint64_t)v136, (uint64_t)v119);
          if (v129 == 1)
          {
LABEL_270:
            v102 = v119;
            goto LABEL_271;
          }
          int v130 = v129;
          if (v121 && v119[1] >= 0x60u) {
            coap_delete_observer(v41, (uint64_t)v42, (uint64_t)&v144);
          }
          int v131 = *v119;
          if (v131 == 2)
          {
            if (!v119[1])
            {
              v119[4] = 0;
              *((void *)v119 + 3) = 0;
            }
          }
          else if (v130 != 2 && v131 == 1 && v119[1] < 0x40u)
          {
            goto LABEL_270;
          }
          if (coap_send(v42, (uint64_t)v119) == -1 && maxlog >= 7) {
            coap_log_impl(7, "cannot send response for message %d\n");
          }
          goto LABEL_284;
        }
      }
LABEL_285:
      coap_delete_node((void **)v6);
      return;
  }
}

void coap_remove_from_queue(void **a1, uint64_t a2, int a3, void *a4)
{
  if (!a1) {
    return;
  }
  unsigned __int8 v4 = *a1;
  if (!*a1) {
    return;
  }
  if (v4[3] == a2 && *((_DWORD *)v4 + 8) == a3)
  {
    *a4 = v4;
    uint64_t v6 = (void *)**a1;
    *a1 = v6;
    uint64_t v7 = (void *)*a4;
    if (v6) {
      v6[1] += v7[1];
    }
    void *v7 = 0;
    if (maxlog <= 6) {
      return;
    }
LABEL_17:
    coap_session_str(a2);
    coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, a3);
    return;
  }
  uint64_t v8 = (uint64_t *)*v4;
  if (*v4)
  {
    while (1)
    {
      uint64_t v9 = v8;
      if (v8[3] == a2 && *((_DWORD *)v8 + 8) == a3) {
        break;
      }
      uint64_t v8 = (uint64_t *)*v8;
      unsigned __int8 v4 = v9;
      if (!*v9) {
        return;
      }
    }
    unsigned int v10 = (uint64_t *)*v8;
    *unsigned __int8 v4 = *v9;
    if (v10) {
      v10[1] += v9[1];
    }
    void *v9 = 0;
    *a4 = v9;
    if (maxlog >= 7) {
      goto LABEL_17;
    }
  }
}

void coap_cancel_all_messages(uint64_t a1, uint64_t a2, void *__s1, size_t __n)
{
  unsigned __int8 v4 = *(void **)(a1 + 48);
  if (v4)
  {
    while (v4[3] == a2)
    {
      uint64_t v9 = v4[5];
      if (*(unsigned __int8 *)(v9 + 4) != __n || __n && memcmp(__s1, *(const void **)(v9 + 40), __n)) {
        break;
      }
      *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = *v4;
      if (maxlog >= 7)
      {
        coap_session_str(a2);
        coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)v4 + 8));
      }
      coap_delete_node((void **)v4);
      unsigned __int8 v4 = *(void **)(a1 + 48);
      if (!v4) {
        return;
      }
    }
    for (uint64_t i = (void *)*v4; *v4; uint64_t i = (void *)*v4)
    {
      if (i[3] == a2
        && (uint64_t v11 = i[5], *(unsigned __int8 *)(v11 + 4) == __n)
        && (!__n || !memcmp(__s1, *(const void **)(v11 + 40), __n)))
      {
        *unsigned __int8 v4 = *i;
        if (maxlog >= 7)
        {
          coap_session_str(a2);
          coap_log_impl(7, "** %s: tid=%d: removed\n", (const char *)&coap_session_str_szSession, *((_DWORD *)i + 8));
        }
        coap_delete_node((void **)i);
      }
      else
      {
        unsigned __int8 v4 = i;
      }
    }
  }
}

uint64_t coap_wellknown_response(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v5 = *a3;
  __int16 v6 = *((_WORD *)a3 + 3);
  unint64_t v7 = coap_session_max_pdu_size(a2);
  if (v5) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = 2;
  }
  uint64_t v9 = coap_pdu_init(v8, 0x45u, v6, v7);
  uint64_t v10 = (uint64_t)v9;
  if (v9)
  {
    uint64_t v54 = 0;
    memset(v53, 0, sizeof(v53));
    size_t v52 = 0;
    uint64_t v50 = 0;
    if (!coap_add_token((uint64_t)v9, a3[4], *((const void **)a3 + 5)))
    {
      if (maxlog >= 7) {
        coap_log_impl(7, "coap_wellknown_response: cannot add token\n");
      }
      goto LABEL_19;
    }
    uint64_t v11 = coap_check_option((uint64_t)a3, 0xFu, (uint64_t)v53);
    size_t v55 = 0;
    if ((coap_print_wellknown(a1, v51, &v55, 0xFFFFFFFFLL, v11) & 0x80000000) != 0)
    {
      if (maxlog >= 4) {
        coap_log_impl(4, "cannot determine length of /.well-known/core\n");
      }
    }
    else
    {
      size_t v12 = v55;
      if (maxlog >= 7) {
        coap_log_impl(7, "get_wkc_len: coap_print_wellknown() returned %zu\n", v55);
      }
      if (v12)
      {
        if (coap_get_block((uint64_t)a3, (uint64_t)&v50))
        {
          if (maxlog >= 7) {
            coap_log_impl(7, "create block\n");
          }
          int v13 = (BYTE4(v50) >> 1) & 7;
          if (v13 == 7)
          {
            *(unsigned char *)(v10 + 1) = 0x80;
            return v10;
          }
          unsigned int v22 = v50 << (v13 + 4);
          unint64_t v23 = *(void *)(v10 + 32);
          if (!v23 || v23 > *(void *)(v10 + 24) + 8)
          {
LABEL_38:
            uint64_t v24 = v22;
            unsigned int v25 = coap_encode_var_safe((uint64_t)v51, v12);
            coap_add_option(v10, 4u, v25, v51);
            char v26 = 0;
            goto LABEL_42;
          }
LABEL_39:
          if (maxlog >= 7) {
            coap_log_impl(7, "coap_wellknown_response: insufficient storage space\n");
          }
          goto LABEL_19;
        }
        unint64_t v16 = *(void *)(v10 + 32);
        if (v16)
        {
          unint64_t v17 = *(void *)(v10 + 24);
          if (v16 <= v17 + 8) {
            goto LABEL_39;
          }
          unint64_t v18 = v16 - v17;
          if (v16 - v17 < v12 + 1)
          {
            if (v16 < v17) {
              __assert_rtn("coap_wellknown_response", "net.c", 1903, "resp->used_size <= resp->max_size");
            }
            LODWORD(v50) = 0;
            unsigned int v19 = BYTE4(v50) & 0xF0 | 0xC;
            if (v18 <= 0x405)
            {
              LOBYTE(v20) = 6;
              while ((_BYTE)v20)
              {
                unsigned int v21 = v19 + 14;
                unsigned int v19 = (v19 + 14) & 0xE | v19 & 0xFFFFFFF1;
                int v20 = (v21 >> 1) & 7;
                if (v18 >= ((16 << v20) | 6u)) {
                  goto LABEL_35;
                }
              }
              BYTE4(v50) = v19;
              if (maxlog >= 7) {
                coap_log_impl(7, "coap_wellknown_response: message to small even for szx == 0\n");
              }
              goto LABEL_19;
            }
LABEL_35:
            unsigned int v22 = 0;
            BYTE4(v50) = v19;
            goto LABEL_38;
          }
        }
        uint64_t v24 = 0;
        char v26 = 1;
LABEL_42:
        if (coap_encode_var_safe((uint64_t)v51, 0x28u) != 1) {
          __assert_rtn("coap_wellknown_response", "net.c", 1934, "coap_encode_var_safe(buf, sizeof(buf), COAP_MEDIATYPE_APPLICATION_LINK_FORMAT) == 1");
        }
        unsigned int v27 = coap_encode_var_safe((uint64_t)v51, 0x28u);
        coap_add_option(v10, 0xCu, v27, v51);
        if (v26)
        {
          unsigned int v28 = coap_encode_var_safe((uint64_t)v51, v12);
          coap_add_option(v10, 0x1Cu, v28, v51);
          unint64_t v29 = *(void *)(v10 + 32);
          if (v29)
          {
            uint64_t v30 = *(void *)(v10 + 24);
            if (v12 + v30 + 1 > v29) {
              size_t v12 = v29 + ~v30;
            }
          }
LABEL_67:
          size_t v52 = v12;
          long long v49 = (unsigned char *)coap_add_data_after((void *)v10, v12);
          if (v49)
          {
            if ((coap_print_wellknown(a1, v49, &v52, v24, v11) & 0x80000000) == 0) {
              return v10;
            }
            if (maxlog >= 7) {
              coap_log_impl(7, "coap_print_wellknown failed\n");
            }
          }
          else if (maxlog >= 7)
          {
            coap_log_impl(7, "coap_wellknown_response: coap_add_data failed\n");
          }
          goto LABEL_19;
        }
        int v31 = v50;
        char v32 = BYTE4(v50);
        unint64_t v33 = ((unint64_t)BYTE4(v50) >> 1) & 7;
        unint64_t v34 = (v50 << (v33 + 4));
        unint64_t v35 = v12 - v34;
        if (v12 > v34)
        {
          uint64_t v36 = *(void *)(v10 + 32);
          if (!v36) {
            __assert_rtn("coap_write_block_opt", "block.c", 77, "pdu->max_size > 0");
          }
          unint64_t v37 = v36 - *(void *)(v10 + 24) - 4;
          unint64_t v38 = 1 << (v33 + 4);
          if (v38 <= v37)
          {
            unsigned int v43 = BYTE4(v50) & 0xFE | (v38 < v35);
          }
          else
          {
            if (v35 > v37)
            {
              if (v37 >= 0x10)
              {
                int v39 = -1;
                uint64_t v40 = v37;
                do
                {
                  ++v39;
                  BOOL v41 = (unint64_t)v40 > 1;
                  v40 >>= 1;
                }
                while (v41);
                int v42 = v39 - 4;
                if (maxlog >= 7)
                {
                  coap_log_impl(7, "decrease block size for %zu to %d\n", v37, v42);
                  char v32 = BYTE4(v50);
                  int v31 = v50;
                  LODWORD(v33) = (BYTE4(v50) >> 1) & 7;
                }
                unsigned int v43 = v32 & 0xF0 | (2 * (v42 & 7)) | 1;
                BYTE4(v50) = v43;
                v31 <<= v33 - (v42 & 7);
                LODWORD(v50) = v31;
                goto LABEL_64;
              }
              if (maxlog > 6)
              {
                coap_log_impl(7, "not enough space, even the smallest block does not fit");
LABEL_59:
                if (maxlog >= 7) {
                  coap_log_impl(7, "coap_wellknown_response: cannot add Block2 option\n");
                }
                goto LABEL_19;
              }
              goto LABEL_19;
            }
            unsigned int v43 = BYTE4(v50) & 0xFE;
          }
          BYTE4(v50) = v43;
LABEL_64:
          unsigned int v44 = coap_encode_var_safe((uint64_t)&v55, (8 * (v43 & 1)) | (16 * v31) | (v43 >> 1) & 7);
          coap_add_option(v10, 0x17u, v44, &v55);
          unsigned int v45 = coap_encode_var_safe((uint64_t)v51, v12);
          coap_add_option(v10, 0x1Cu, v45, v51);
          char v46 = ((BYTE4(v50) >> 1) & 7) + 4;
          unint64_t v47 = 1 << v46;
          size_t v48 = v12 - (v50 << v46);
          if (v48 >= v47) {
            size_t v12 = v47;
          }
          else {
            size_t v12 = v48;
          }
          goto LABEL_67;
        }
        if (maxlog > 6)
        {
          coap_log_impl(7, "illegal block requested\n");
          goto LABEL_59;
        }
LABEL_19:
        char v14 = -93;
LABEL_25:
        *(unsigned char *)(v10 + 1) = v14;
        *(void *)(v10 + 24) = *(unsigned __int8 *)(v10 + 4);
        return v10;
      }
    }
    if (maxlog >= 7) {
      coap_log_impl(7, "coap_wellknown_response: undefined resource\n");
    }
    char v14 = 0x80;
    goto LABEL_25;
  }
  if (maxlog >= 7) {
    coap_log_impl(7, "coap_wellknown_response: cannot create PDU\n");
  }
  return v10;
}

uint64_t no_response(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    __assert_rtn("no_response", "net.c", 2054, "request");
  }
  if (!a2) {
    __assert_rtn("no_response", "net.c", 2055, "response");
  }
  if (*(unsigned __int8 *)(a2 + 1) < 0x20u) {
    return 0;
  }
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  uint64_t result = (uint64_t)coap_check_option(a1, 0x102u, (uint64_t)v10);
  if (result)
  {
    unsigned __int8 v4 = (unsigned char *)result;
    int v5 = coap_opt_value((unsigned char *)result);
    unsigned int v6 = coap_opt_length(v4);
    unsigned int v7 = 0;
    if (v6)
    {
      uint64_t v8 = v6;
      do
      {
        int v9 = *v5++;
        unsigned int v7 = v9 | (v7 << 8);
        --v8;
      }
      while (v8);
    }
    if ((v7 >> ((*(unsigned char *)(a2 + 1) >> 5) - 1))) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t AsyncConnection_Connect()
{
  return MEMORY[0x1F4115D38]();
}

uint64_t AsyncConnection_Release()
{
  return MEMORY[0x1F4115D48]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x1F412F6E0]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x1F412F6F8]();
}

uint64_t BTLocalDeviceGetConnectable()
{
  return MEMORY[0x1F412F778]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x1F412F780]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x1F412F7A8]();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return MEMORY[0x1F412F7B0]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x1F412F7B8]();
}

uint64_t BTLocalDeviceGetScanning()
{
  return MEMORY[0x1F412F7C8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1F412F898]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1F412F8A0]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x1F4115DD8]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x1F4115DF0]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x1F4115E00]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x1F4115E10]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x1F4115E18]();
}

uint64_t BonjourDevice_CopyCFString()
{
  return MEMORY[0x1F4115E20]();
}

uint64_t BonjourDevice_GetDNSName()
{
  return MEMORY[0x1F4115E38]();
}

uint64_t BonjourDevice_Reconfirm()
{
  return MEMORY[0x1F4115E58]();
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C97B0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1F4115F28]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1F4116140]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1F4116180]();
}

uint64_t CreateUsableInterfaceList()
{
  return MEMORY[0x1F4116270]();
}

uint64_t DataToHexCStringEx()
{
  return MEMORY[0x1F4116328]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1F4116330]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1F411CB28]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1F411CB30]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1F411CB68]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1F411CB70]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1F411CB78]();
}

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1F411CB88]();
}

uint64_t HMFRandomDataWithLength()
{
  return MEMORY[0x1F411CBE0]();
}

uint64_t HTTPClientCreate()
{
  return MEMORY[0x1F4116400]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x1F4116428]();
}

uint64_t HTTPGetHeaderField()
{
  return MEMORY[0x1F41164D0]();
}

uint64_t HTTPGetReasonPhrase()
{
  return MEMORY[0x1F41164D8]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x1F41164E0]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x1F41164E8]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x1F4116500]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x1F4116510]();
}

uint64_t HTTPMessageSetCompletionBlock()
{
  return MEMORY[0x1F4116520]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1F4116578]();
}

uint64_t HexToData()
{
  return MEMORY[0x1F4116588]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

uint64_t IsAppleTV()
{
  return MEMORY[0x1F41165A8]();
}

uint64_t MFiPlatform_VerifySignature()
{
  return MEMORY[0x1F4116668]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x1F4116898]();
}

uint64_t NormalizeUUIDString()
{
  return MEMORY[0x1F41168B0]();
}

uint64_t PairingSessionCopyProperty()
{
  return MEMORY[0x1F4116910]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1F4116918]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1F4116928]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1F4116930]();
}

uint64_t PairingSessionGetPeerFlags()
{
  return MEMORY[0x1F4116950]();
}

uint64_t PairingSessionGetResumeInfo()
{
  return MEMORY[0x1F4116958]();
}

uint64_t PairingSessionSetEventHandler()
{
  return MEMORY[0x1F4116970]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x1F4116978]();
}

uint64_t PairingSessionSetIdentifier()
{
  return MEMORY[0x1F4116980]();
}

uint64_t PairingSessionSetMTU()
{
  return MEMORY[0x1F4116998]();
}

uint64_t PairingSessionSetProperty()
{
  return MEMORY[0x1F41169C0]();
}

uint64_t PairingSessionSetResumeInfo()
{
  return MEMORY[0x1F41169C8]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x1F41169D0]();
}

uint64_t ReleaseUsableInterfaceList()
{
  return MEMORY[0x1F4116A10]();
}

uint64_t SNScanF()
{
  return MEMORY[0x1F4116A28]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x1F4116A80]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x1F4116AA0]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1F4116AB8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x1F4116B18]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1F4116B30]();
}

uint64_t TLV8BufferAppendUInt64()
{
  return MEMORY[0x1F4116B38]();
}

uint64_t TLV8BufferDetach()
{
  return MEMORY[0x1F4116B40]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1F4116B48]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1F4116B50]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x1F4116B58]();
}

uint64_t TLV8GetBytes()
{
  return MEMORY[0x1F4116B60]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1F4116B68]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1F4116B70]();
}

uint64_t TLV8GetUInt64()
{
  return MEMORY[0x1F4116B78]();
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1F4116BF8]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1F4116C30]();
}

uint64_t WiFiCopyNetworkInfo()
{
  return MEMORY[0x1F4116C38]();
}

uint64_t WiFiJoinNetwork()
{
  return MEMORY[0x1F4116C40]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return MEMORY[0x1F412FF18]();
}

uint64_t WiFiNetworkDisableAutoJoinUntilFirstUserJoin()
{
  return MEMORY[0x1F412FF80]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1F412FFB0]();
}

uint64_t WiFiRestoreNetwork()
{
  return MEMORY[0x1F4116C68]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1F411CC08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1F411CC18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1F40C9B68](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CA200](*(void *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CA530](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1F4116C90]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1F4116CD0]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64_ex()
{
  return MEMORY[0x1F4116CD8]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1F4116CF0]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC488](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40CC560](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1F40F29A0](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1F40F29B8](result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x1F40F29C0](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1F40F29C8](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1F40F29D8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

void nw_connection_cancel_current_endpoint(nw_connection_t connection)
{
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1F40F2A90](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2E98](name, type, domain);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1F40F2ED0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_domain(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EF0](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F38](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1F40F3238]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34E0](configure_dtls, configure_udp);
}

void nw_parameters_prohibit_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x1F40F3810]();
}

BOOL nw_txt_record_access_bytes(nw_txt_record_t txt_record, nw_txt_record_access_bytes_t access_bytes)
{
  return MEMORY[0x1F40F3F68](txt_record, access_bytes);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x1F40F3F70](txt_record, applier);
}

size_t nw_txt_record_get_key_count(nw_txt_record_t txt_record)
{
  return MEMORY[0x1F40F3F80](txt_record);
}

BOOL nw_txt_record_is_dictionary(nw_txt_record_t txt_record)
{
  return MEMORY[0x1F40F3F88](txt_record);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1F40CDCC8](*(void *)&a1, a2, *(void *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1F40CDED8](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1F40CDF38](*(void *)&a1, a2, *(void *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x1F4116D68]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x1F4116D70]();
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}