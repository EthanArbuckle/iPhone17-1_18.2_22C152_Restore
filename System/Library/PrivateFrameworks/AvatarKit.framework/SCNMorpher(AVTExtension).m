@interface SCNMorpher(AVTExtension)
- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension;
@end

@implementation SCNMorpher(AVTExtension)

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension
{
  uint64_t v174 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = [a1 correctiveDriverCounts];

  if (!v5)
  {
    v6 = [a1 targets];
    uint64_t v7 = [a1 targetsAndInBetween];
    v8 = [a1 inBetweenCounts];
    v158 = a1;
    uint64_t v9 = [a1 inBetweenWeights];
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v143 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v147 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v11 = [v6 count];
    v148 = v6;
    v137 = (void *)v9;
    v138 = (void *)v7;
    v146 = v8;
    v156 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      id v149 = 0;
      uint64_t v150 = 0;
      v140 = 0;
      v141 = 0;
      id v154 = 0;
      v139 = 0;
      id v144 = 0;
      v13 = 0;
      uint64_t v136 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v145 = v11;
      while (1)
      {
        uint64_t v153 = v14;
        v16 = [v148 objectAtIndexedSubscript:v15];
        v17 = [v16 name];
        int v18 = [v17 containsString:@"__"];

        if (!v18)
        {
          uint64_t v151 = v15;
          v23 = [v8 objectAtIndexedSubscript:v15];
          unint64_t v24 = [v23 unsignedIntegerValue];

          if (v24 < 2)
          {
            uint64_t v14 = v153;
            v36 = v156;
            if (v149) {
              [v149 addObject:&unk_26C00C4A8];
            }
            else {
              id v149 = 0;
            }
            uint64_t v34 = v151;
            v35 = v158;
          }
          else
          {
            uint64_t v14 = v153;
            if (!v149)
            {
              id v149 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v25 = objc_alloc_init(MEMORY[0x263EFF980]);

              if ([v156 count])
              {
                unint64_t v26 = 0;
                do
                {
                  [v149 addObject:&unk_26C00C4A8];
                  ++v26;
                }
                while (v26 < [v156 count]);
              }
              v141 = v25;
              uint64_t v14 = v153;
            }
            v27 = [NSNumber numberWithUnsignedInteger:v24];
            [v149 addObject:v27];

            unint64_t v28 = v24 - 1;
            uint64_t v29 = v150;
            do
            {
              uint64_t v30 = v14;
              uint64_t v31 = v29++;
              v32 = [v138 objectAtIndexedSubscript:v31];
              [v147 addObject:v32];

              uint64_t v14 = v30 + 1;
              v33 = [v137 objectAtIndexedSubscript:v30];
              [v141 addObject:v33];

              --v28;
            }
            while (v28);
            uint64_t v150 = v29;
            uint64_t v12 = v145;
            v8 = v146;
            uint64_t v34 = v151;
            v35 = v158;
            v36 = v156;
          }
          [v147 addObject:v16];
          ++v150;
          [v35 weightForTargetAtIndex:v34];
          *(float *)&double v65 = v65;
          v66 = [NSNumber numberWithFloat:v65];
          [v143 addObject:v66];

          uint64_t v15 = v151;
          [v36 addObject:v16];
          goto LABEL_61;
        }
        v19 = [v16 name];
        v20 = [v19 componentsSeparatedByString:@"__"];

        uint64_t v21 = [v20 count];
        if (v21 == 1)
        {
          v22 = avt_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v170 = v20;
            _os_log_error_impl(&dword_20B819000, v22, OS_LOG_TYPE_ERROR, "Error: Failed to create corrective with only one target: %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v37 = v21;
          uint64_t v152 = v15;
          v155 = v13;
          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          id v38 = v20;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v164 objects:v173 count:16];
          v40 = v158;
          v142 = v20;
          if (!v39)
          {

LABEL_37:
            v51 = v140;
            if (!v154) {
              id v154 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            v52 = [v146 objectAtIndexedSubscript:v152];
            unint64_t v53 = [v52 unsignedIntegerValue];

            uint64_t v54 = v153;
            if (v53 < 2)
            {
              if (v144) {
                [v144 addObject:&unk_26C00C4A8];
              }
              else {
                id v144 = 0;
              }
              v64 = v146;
              uint64_t v59 = v150;
            }
            else
            {
              if (!v144)
              {
                id v144 = objc_alloc_init(MEMORY[0x263EFF980]);
                id v55 = objc_alloc_init(MEMORY[0x263EFF980]);

                if ([v139 count])
                {
                  unint64_t v56 = 0;
                  do
                  {
                    [v144 addObject:&unk_26C00C4A8];
                    ++v56;
                  }
                  while (v56 < [v139 count]);
                }
                v155 = v55;
                uint64_t v54 = v153;
              }
              v57 = [NSNumber numberWithUnsignedInteger:v53];
              [v144 addObject:v57];

              unint64_t v58 = v53 - 1;
              uint64_t v59 = v150;
              do
              {
                uint64_t v60 = v54;
                uint64_t v61 = v59++;
                v62 = [v138 objectAtIndexedSubscript:v61];
                [v154 addObject:v62];

                uint64_t v54 = v60 + 1;
                v63 = [v137 objectAtIndexedSubscript:v60];
                [v155 addObject:v63];

                --v58;
              }
              while (v58);
              uint64_t v153 = v54;
              v64 = v146;
              v51 = v140;
            }
            [v154 addObject:v16];
            id v67 = v139;
            if (!v139)
            {
              id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v68 = objc_alloc_init(MEMORY[0x263EFF980]);

              v51 = v68;
            }
            uint64_t v150 = v59 + 1;
            v69 = [NSNumber numberWithUnsignedInteger:v37];
            v139 = v67;
            [v67 addObject:v69];

            v140 = v51;
            [v51 addObjectsFromArray:v38];
            v13 = v155;
            uint64_t v15 = v152;
            v8 = v64;
            v20 = v142;
            goto LABEL_60;
          }
          uint64_t v41 = v39;
          uint64_t v42 = *(void *)v165;
          char v43 = 1;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v165 != v42) {
                objc_enumerationMutation(v38);
              }
              v45 = *(void **)(*((void *)&v164 + 1) + 8 * i);
              if ([v40 _weightIndexForTargetNamed:v45] == 0x7FFFFFFFFFFFFFFFLL)
              {
                v46 = avt_default_log();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  v48 = [v16 name];
                  *(_DWORD *)buf = 138412546;
                  v170 = v45;
                  __int16 v171 = 2112;
                  v172 = v48;
                  _os_log_error_impl(&dword_20B819000, v46, OS_LOG_TYPE_ERROR, "Error: Failed to find index of driving target %@ for corrective %@", buf, 0x16u);
                }
                if (v4)
                {
                  v47 = [v16 name];
                  ((void (**)(id, void *, void *, uint64_t))v4)[2](v4, v47, v45, v37);
                }
                char v43 = 0;
                v40 = v158;
              }
            }
            uint64_t v41 = [v38 countByEnumeratingWithState:&v164 objects:v173 count:16];
          }
          while (v41);

          v20 = v142;
          if (v43) {
            goto LABEL_37;
          }
          v8 = v146;
          if (v146)
          {
            v49 = [v146 objectAtIndexedSubscript:v152];
            uint64_t v50 = [v49 unsignedIntegerValue];
          }
          else
          {
            uint64_t v50 = 1;
          }
          uint64_t v15 = v152;
          v136 += v50;
          v13 = v155;
        }
LABEL_60:

        uint64_t v14 = v153;
        uint64_t v12 = v145;
LABEL_61:

        if (++v15 == v12) {
          goto LABEL_64;
        }
      }
    }
    uint64_t v136 = 0;
    v13 = 0;
    id v144 = 0;
    v139 = 0;
    v140 = 0;
    id v154 = 0;
    v141 = 0;
    id v149 = 0;
LABEL_64:
    v70 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v140, "count"));
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    obuint64_t j = v140;
    uint64_t v71 = [obj countByEnumeratingWithState:&v160 objects:v168 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v161;
      do
      {
        for (uint64_t j = 0; j != v72; ++j)
        {
          v75 = v70;
          if (*(void *)v161 != v73) {
            objc_enumerationMutation(obj);
          }
          v76 = *(void **)(*((void *)&v160 + 1) + 8 * j);
          v159[0] = MEMORY[0x263EF8330];
          v159[1] = 3221225472;
          v159[2] = __76__SCNMorpher_AVTExtension__avt_buildInternalSupportForCorrectivesWithBlock___block_invoke;
          v159[3] = &unk_26401F328;
          v159[4] = v76;
          uint64_t v77 = [v156 indexOfObjectPassingTest:v159];
          if (v77 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v78 = avt_default_log();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v170 = v76;
              _os_log_error_impl(&dword_20B819000, v78, OS_LOG_TYPE_ERROR, "Error: Failed to find index for driving target %@", buf, 0xCu);
            }
            v70 = v75;
          }
          else
          {
            v78 = [NSNumber numberWithUnsignedInteger:v77];
            v70 = v75;
            [v75 addObject:v78];
          }
        }
        uint64_t v72 = [obj countByEnumeratingWithState:&v160 objects:v168 count:16];
      }
      while (v72);
    }

    unint64_t v79 = [v147 count];
    if (v79 < [v149 count])
    {
      v80 = avt_default_log();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.6(v80, v81, v82, v83, v84, v85, v86, v87);
      }
    }
    unint64_t v88 = [v154 count];
    if (v88 < [v144 count])
    {
      v89 = avt_default_log();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.5(v89, v90, v91, v92, v93, v94, v95, v96);
      }
    }
    uint64_t v97 = [v147 count];
    uint64_t v98 = [v154 count] + v97;
    if (v98 != [v138 count] - v136)
    {
      v99 = avt_default_log();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.4(v99, v100, v101, v102, v103, v104, v105, v106);
      }
    }
    if ([v144 count])
    {
      uint64_t v107 = [v149 count];
      uint64_t v108 = [v144 count] + v107;
      if (v108 != [v146 count])
      {
        v109 = avt_default_log();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:](v109, v110, v111, v112, v113, v114, v115, v116);
        }
      }
      uint64_t v117 = [v141 count];
      uint64_t v118 = [v13 count] + v117;
      if (v118 != [v137 count])
      {
        v119 = avt_default_log();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:](v119, v120, v121, v122, v123, v124, v125, v126);
        }
      }
      uint64_t v127 = [v144 count];
      if (v127 != [v139 count])
      {
        v128 = avt_default_log();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:](v128, v129, v130, v131, v132, v133, v134, v135);
        }
      }
    }
    if (v139) {
      [v158 setTargetsAndInBetweens:v147 inBetweenCounts:v149 inBetweenWeights:v141 correctives:v154 driverCounts:v139 driverIndices:v70 inBetweenCounts:v144 inBetweenWeights:v13];
    }
  }
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end