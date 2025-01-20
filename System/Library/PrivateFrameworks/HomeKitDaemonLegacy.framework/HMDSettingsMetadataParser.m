@interface HMDSettingsMetadataParser
+ (id)logCategory;
- (HMDSettingsControllerDependency)dependency;
- (HMDSettingsMetadataParser)initWithDependency:(id)a3;
- (id)logIdentifier;
- (id)modelsFromMetadata:(id)a3;
@end

@implementation HMDSettingsMetadataParser

- (void).cxx_destruct
{
}

- (HMDSettingsControllerDependency)dependency
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dependency);
  return (HMDSettingsControllerDependency *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDSettingsMetadataParser *)self dependency];
  v3 = [v2 parentIdentifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (id)modelsFromMetadata:(id)a3
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v138 = v4;
  v5 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"Info");
  v136 = v5;
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"Version");
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    v10 = v9;
    v135 = (void *)v6;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v180 = v11;
        __int16 v181 = 2112;
        v182 = v135;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Loading setting version %@", buf, 0x16u);
      }
      uint64_t v12 = objc_msgSend(v138, "hmf_dictionaryForKey:", @"Data");
      if (!v12)
      {
        v117 = 0;
        v118 = (void *)MEMORY[0x1D9452090]();
        v119 = v8;
        v120 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          v121 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v180 = v121;
          _os_log_impl(&dword_1D49D5000, v120, OS_LOG_TYPE_ERROR, "%{public}@Missing data section in metadata", buf, 0xCu);
        }
        id v128 = 0;
        goto LABEL_104;
      }
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v140 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14 = [(HMDSettingsMetadataParser *)v8 dependency];
      v15 = [v14 parentIdentifier];
      v16 = [v14 createSettingRootGroupModelWithParentModelID:v15];

      [v13 addObject:v16];
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v177[0] = @"parentUUID";
      v133 = v16;
      v18 = [v16 hmbModelID];
      v177[1] = @"group";
      v178[0] = v18;
      v178[1] = v12;
      v134 = (void *)v12;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v178 forKeys:v177 count:2];
      [v17 addObject:v19];

      *(void *)&long long v20 = 138543874;
      long long v132 = v20;
      id v141 = v13;
      v145 = v8;
      v146 = v14;
      v157 = v17;
LABEL_7:
      if (objc_msgSend(v17, "count", v132))
      {
        v21 = [v17 objectAtIndex:0];
        v158 = objc_msgSend(v21, "hmf_UUIDForKey:", @"parentUUID");
        v142 = v21;
        v22 = objc_msgSend(v21, "hmf_dictionaryForKey:", @"group");
        [v17 removeObjectAtIndex:0];
        v143 = v22;
        v23 = objc_msgSend(v22, "hmf_arrayForKey:", @"Groups");
        long long v165 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id obj = v23;
        uint64_t v24 = [obj countByEnumeratingWithState:&v165 objects:v176 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v166;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v166 != v26) {
                objc_enumerationMutation(obj);
              }
              v28 = *(void **)(*((void *)&v165 + 1) + 8 * i);
              v29 = objc_msgSend(v28, "hmf_stringForKey:", @"Key");
              if (!v29)
              {
                v89 = (void *)MEMORY[0x1D9452090]();
                v90 = v8;
                v91 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  v92 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v180 = v92;
                  __int16 v181 = 2112;
                  v182 = v28;
                  _os_log_impl(&dword_1D49D5000, v91, OS_LOG_TYPE_ERROR, "%{public}@A group is missing a name attribute: %@", buf, 0x16u);
                }
                int v84 = 1;
                v34 = obj;
                v93 = obj;
                goto LABEL_87;
              }
              id v30 = v29;
              v31 = [v14 createSettingGroupModelWithName:v30 parent:v158];
              [v13 addObject:v31];
              v174[0] = @"parentUUID";
              v32 = [v31 hmbModelID];
              v174[1] = @"group";
              v175[0] = v32;
              v175[1] = v28;
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:2];
              [v157 addObject:v33];
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v165 objects:v176 count:16];
          }
          while (v25);
        }
        v34 = obj;

        v35 = objc_msgSend(v143, "hmf_arrayForKey:", @"Settings");
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        id v144 = v35;
        uint64_t v147 = [v144 countByEnumeratingWithState:&v161 objects:v173 count:16];
        if (!v147)
        {
          int v84 = 0;
          goto LABEL_86;
        }
        uint64_t v148 = *(void *)v162;
LABEL_18:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v162 != v148) {
            objc_enumerationMutation(v144);
          }
          v37 = *(void **)(*((void *)&v161 + 1) + 8 * v36);
          v38 = objc_msgSend(v37, "hmf_stringForKey:", @"Key");
          if (v38) {
            break;
          }
          v43 = v37;
          v44 = (void *)MEMORY[0x1D9452090]();
          v45 = v8;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v48 = uint64_t v47 = v36;
            *(_DWORD *)buf = 138543618;
            v180 = v48;
            __int16 v181 = 2112;
            v182 = v43;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@A setting is missing a name: %@", buf, 0x16u);

            uint64_t v36 = v47;
          }

LABEL_67:
          if (++v36 == v147)
          {
            int v84 = 0;
            uint64_t v147 = [v144 countByEnumeratingWithState:&v161 objects:v173 count:16];
            if (!v147) {
              goto LABEL_86;
            }
            goto LABEL_18;
          }
        }
        id v39 = v38;
        v40 = objc_msgSend(v37, "hmf_stringForKey:", @"Type");
        if (!v40)
        {
          v94 = v37;
          v95 = (void *)MEMORY[0x1D9452090]();
          v96 = v8;
          v97 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            v98 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v180 = v98;
            __int16 v181 = 2112;
            v182 = v94;
            _os_log_impl(&dword_1D49D5000, v97, OS_LOG_TYPE_ERROR, "%{public}@A setting is missing type attribute %@", buf, 0x16u);
          }
          id v41 = 0;
LABEL_77:

LABEL_81:
LABEL_85:

          int v84 = 1;
          goto LABEL_86;
        }
        uint64_t v152 = v36;
        id v41 = v40;
        if ([v41 isEqualToString:@"data"])
        {
          uint64_t v42 = 1;
        }
        else if ([v41 isEqualToString:@"number"])
        {
          uint64_t v42 = 2;
        }
        else if ([v41 isEqualToString:@"string"])
        {
          uint64_t v42 = 3;
        }
        else if ([v41 isEqualToString:@"selection"])
        {
          uint64_t v42 = 4;
        }
        else
        {
          if (([v41 isEqualToString:@"collection"] & 1) == 0)
          {
            v109 = v37;

            v95 = (void *)MEMORY[0x1D9452090]();
            v110 = v8;
            v97 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              v111 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v180 = v111;
              __int16 v181 = 2112;
              v182 = v109;
              _os_log_impl(&dword_1D49D5000, v97, OS_LOG_TYPE_ERROR, "%{public}@Decoded setting with unrecognized type %@", buf, 0x16u);
            }
            goto LABEL_77;
          }
          uint64_t v42 = 5;
        }
        uint64_t v155 = v42;

        v154 = v37;
        v49 = objc_msgSend(v37, "hmf_arrayForKey:", @"Properties");
        if (!v49)
        {
          v95 = (void *)MEMORY[0x1D9452090]();
          v99 = v8;
          v100 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v102 = id v101 = v41;
            *(_DWORD *)buf = 138544130;
            v180 = v102;
            __int16 v181 = 2112;
            v182 = v154;
            __int16 v183 = 2112;
            id v184 = v39;
            __int16 v185 = 2112;
            v186 = 0;
            _os_log_impl(&dword_1D49D5000, v100, OS_LOG_TYPE_ERROR, "%{public}@A setting is missing a required attribute %@ name: %@, propertiesArray %@", buf, 0x2Au);

            id v41 = v101;
          }

          goto LABEL_81;
        }
        v50 = v49;
        v151 = v41;
        uint64_t v51 = [v49 containsObject:@"r"];
        v150 = v50;
        if ([v50 containsObject:@"w"]) {
          v51 |= 2uLL;
        }
        v52 = [NSNumber numberWithInteger:v155];
        v53 = [NSNumber numberWithUnsignedInteger:v51];
        v54 = [v14 createSettingModelWithName:v39 parent:v158 type:v52 properties:v53];

        if (!v54)
        {
          v103 = (void *)MEMORY[0x1D9452090]();
          v104 = v8;
          v105 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
          {
            v106 = HMFGetLogIdentifier();
            [NSNumber numberWithInteger:v155];
            v108 = id v107 = v39;
            *(_DWORD *)buf = v132;
            v180 = v106;
            __int16 v181 = 2112;
            v182 = v107;
            __int16 v183 = 2112;
            id v184 = v108;
            _os_log_impl(&dword_1D49D5000, v105, OS_LOG_TYPE_ERROR, "%{public}@Unable to create setting model for setting %@ with type %@", buf, 0x20u);

            id v39 = v107;
          }

          id v41 = v151;
          goto LABEL_85;
        }
        v149 = v39;
        v55 = objc_msgSend(v154, "hmf_arrayForKey:", @"Constraints");
        v153 = v54;
        v56 = [v54 hmbModelID];
        id v57 = v55;
        id v58 = v56;
        id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v169 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v159 = v57;
        uint64_t v60 = [v159 countByEnumeratingWithState:&v169 objects:buf count:16];
        if (!v60) {
          goto LABEL_61;
        }
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v170;
        while (1)
        {
          uint64_t v63 = 0;
          do
          {
            if (*(void *)v170 != v62) {
              objc_enumerationMutation(v159);
            }
            v64 = *(void **)(*((void *)&v169 + 1) + 8 * v63);
            objc_msgSend(v64, "hmf_stringForKey:", @"Type");
            id v65 = (id)objc_claimAutoreleasedReturnValue();
            if ([v65 isEqualToString:@"minimumValue"])
            {
              uint64_t v66 = 1;
LABEL_51:

              v67 = [v64 objectForKey:@"Value"];
              v68 = [HMDSettingConstraintModel alloc];
              v69 = [MEMORY[0x1E4F29128] UUID];
              v70 = [(HMBModel *)v68 initWithModelID:v69 parentModelID:v58];

              v71 = [NSNumber numberWithInteger:v66];
              [(HMDSettingConstraintModel *)v70 setType:v71];

              [(HMDSettingConstraintModel *)v70 setNumberValue:v67];
LABEL_52:
              [v59 addObject:v70];

              goto LABEL_53;
            }
            if ([v65 isEqualToString:@"maximumValue"])
            {
              uint64_t v66 = 2;
              goto LABEL_51;
            }
            if ([v65 isEqualToString:@"stepValue"])
            {
              uint64_t v66 = 3;
              goto LABEL_51;
            }
            char v72 = [v65 isEqualToString:@"validValue"];

            v67 = [v64 objectForKey:@"Value"];
            if (v72)
            {
              v73 = [HMDSettingConstraintModel alloc];
              v74 = [MEMORY[0x1E4F29128] UUID];
              v70 = [(HMBModel *)v73 initWithModelID:v74 parentModelID:v58];

              v75 = [NSNumber numberWithInteger:4];
              [(HMDSettingConstraintModel *)v70 setType:v75];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(HMDSettingConstraintModel *)v70 setDataValue:v67];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [(HMDSettingConstraintModel *)v70 setStringValue:v67];
                }
              }
              goto LABEL_52;
            }
LABEL_53:

            ++v63;
          }
          while (v61 != v63);
          uint64_t v76 = [v159 countByEnumeratingWithState:&v169 objects:buf count:16];
          uint64_t v61 = v76;
          if (!v76)
          {
LABEL_61:

            v77 = (void *)[v59 copy];
            v78 = [v154 objectForKey:@"Value"];
            v79 = [NSNumber numberWithInteger:v155];
            id v160 = 0;
            v14 = v146;
            v80 = [v146 settingValueForValue:v78 type:v79 constraintModels:v77 error:&v160];
            id v81 = v160;

            v82 = v153;
            int v83 = [v153 setSettingValue:v80];
            if (v83)
            {
              [v140 addObject:v153];
              [v139 addObjectsFromArray:v77];
              int v84 = 0;
              id v13 = v141;
              v8 = v145;
            }
            else
            {
              v85 = (void *)MEMORY[0x1D9452090]();
              v86 = v145;
              v87 = HMFGetOSLogHandle();
              id v13 = v141;
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              {
                v88 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                v180 = v88;
                __int16 v181 = 2112;
                v182 = v78;
                __int16 v183 = 2112;
                id v184 = v80;
                __int16 v185 = 2112;
                v186 = v153;
                _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_ERROR, "%{public}@Unable to set value %@(%@) on model %@", buf, 0x2Au);
              }
              int v84 = 1;
              v8 = v145;
              v14 = v146;
              v82 = v153;
            }

            v34 = obj;
            uint64_t v36 = v152;
            if (v83) {
              goto LABEL_67;
            }
LABEL_86:

            v93 = v144;
LABEL_87:
            id v17 = v157;

            if (v84)
            {
              id v128 = 0;
              v130 = v139;
              v129 = v140;
              goto LABEL_103;
            }
            goto LABEL_7;
          }
        }
      }
      v122 = (void *)MEMORY[0x1D9452090]();
      v123 = v8;
      v124 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
      {
        v125 = HMFGetLogIdentifier();
        v126 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v127 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v140, "count"));
        *(_DWORD *)buf = v132;
        v180 = v125;
        __int16 v181 = 2112;
        v182 = v126;
        __int16 v183 = 2112;
        id v184 = v127;
        _os_log_impl(&dword_1D49D5000, v124, OS_LOG_TYPE_INFO, "%{public}@Parsed %@ groups and %@ settings", buf, 0x20u);
      }
      [v137 addObjectsFromArray:v13];
      v129 = v140;
      [v137 addObjectsFromArray:v140];
      v130 = v139;
      [v137 addObjectsFromArray:v139];
      id v128 = v137;
LABEL_103:

      v117 = v134;
LABEL_104:
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v116 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v180 = v116;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing version number in metadata", buf, 0xCu);
      }
      id v128 = 0;
    }
  }
  else
  {
    v112 = (void *)MEMORY[0x1D9452090]();
    v113 = self;
    v114 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      v115 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v180 = v115;
      _os_log_impl(&dword_1D49D5000, v114, OS_LOG_TYPE_ERROR, "%{public}@Missing info section in metadata", buf, 0xCu);
    }
    id v128 = 0;
  }

  return v128;
}

- (HMDSettingsMetadataParser)initWithDependency:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDSettingsMetadataParser;
  v5 = [(HMDSettingsMetadataParser *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dependency, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_57188 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_57188, &__block_literal_global_57189);
  }
  v2 = (void *)logCategory__hmf_once_v15_57190;
  return v2;
}

uint64_t __40__HMDSettingsMetadataParser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_57190;
  logCategory__hmf_once_v15_57190 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end