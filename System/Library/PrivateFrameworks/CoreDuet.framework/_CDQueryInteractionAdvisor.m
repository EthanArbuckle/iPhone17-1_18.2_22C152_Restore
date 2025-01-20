@interface _CDQueryInteractionAdvisor
- (_CDInteractionStore)store;
- (_CDQueryInteractionAdvisor)initWithStore:(id)a3;
- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation _CDQueryInteractionAdvisor

- (_CDQueryInteractionAdvisor)initWithStore:(id)a3
{
  v4 = (_CDInteractionStore *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_CDQueryInteractionAdvisor;
  v5 = [(_CDQueryInteractionAdvisor *)&v8 init];
  store = v5->_store;
  v5->_store = v4;

  return v5;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v73 = a4;
  store = self->_store;
  v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  unint64_t v80 = [(_CDInteractionStore *)store countInteractionsUsingPredicate:v7 error:0];

  id v72 = (id)[v73 copy];
  objc_super v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [v73 constrainKeywords];
  id v71 = [v8 setWithSet:v9];

  v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v11 = [v74 componentsSeparatedByCharactersInSet:v10];
  [v71 addObjectsFromArray:v11];

  [v72 setConstrainKeywords:v71];
  id v70 = [v72 interactionPredicate];
  v12 = [(_CDInteractionStore *)self->_store queryInteractionsUsingPredicate:v70 sortDescriptors:0 limit:0 error:0];
  v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v87 = [v74 componentsSeparatedByCharactersInSet:v13];

  id v84 = [MEMORY[0x1E4F1CAD0] setWithArray:v87];
  uint64_t v88 = [v87 count];
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__7;
  v129 = __Block_byref_object_dispose__7;
  id v130 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:100];
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__7;
  v123 = __Block_byref_object_dispose__7;
  id v124 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __82___CDQueryInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke;
  v118[3] = &unk_1E560E498;
  v118[4] = &v125;
  v118[5] = &v119;
  v118[6] = v88;
  v14 = (void (**)(void, void, void))MEMORY[0x192FB31A0](v118);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v75 = v12;
  uint64_t v81 = [v75 countByEnumeratingWithState:&v114 objects:v137 count:16];
  if (v81)
  {
    size_t v82 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v115 != v82) {
          objc_enumerationMutation(v75);
        }
        v15 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        v16 = [v15 keywords];
        v17 = (void *)[v16 countByEnumeratingWithState:&v110 objects:v136 count:16];
        if (v17)
        {
          v18 = *(char **)v111;
          uint64_t v85 = (uint64_t)v16;
          v86 = v18;
          do
          {
            id v89 = v17;
            for (j = 0; j != v89; j = (char *)j + 1)
            {
              if (*(char **)v111 != v86) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void *)(*((void *)&v110 + 1) + 8 * (void)j);
              if ([v84 containsObject:v20])
              {
                v21 = [v15 sender];
                ((void (**)(void, void *, uint64_t))v14)[2](v14, v21, v20);

                long long v108 = 0u;
                long long v109 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                v22 = [v15 recipients];
                uint64_t v23 = [v22 countByEnumeratingWithState:&v106 objects:v135 count:16];
                if (v23)
                {
                  uint64_t v24 = *(void *)v107;
                  do
                  {
                    for (uint64_t k = 0; k != v23; ++k)
                    {
                      if (*(void *)v107 != v24) {
                        objc_enumerationMutation(v22);
                      }
                      v14[2](v14, *(void *)(*((void *)&v106 + 1) + 8 * k), v20);
                    }
                    uint64_t v23 = [v22 countByEnumeratingWithState:&v106 objects:v135 count:16];
                  }
                  while (v23);
                }

                v16 = (void *)v85;
              }
            }
            v17 = (void *)[v16 countByEnumeratingWithState:&v110 objects:v136 count:16];
          }
          while (v17);
        }
      }
      uint64_t v81 = [v75 countByEnumeratingWithState:&v114 objects:v137 count:16];
    }
    while (v81);
  }

  v69[1] = v69;
  MEMORY[0x1F4188790]();
  v86 = (char *)v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v82 = v26;
  bzero(v86, v26);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v27 = (id)v126[5];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v102 objects:v134 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v103;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v103 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = [(id)v126[5] objectForKeyedSubscript:*(void *)(*((void *)&v102 + 1) + 8 * m)];
        if (v88)
        {
          for (uint64_t n = 0; n != v88; ++n)
          {
            v33 = [v87 objectAtIndexedSubscript:n];
            v34 = [v31 objectForKey:v33];

            if (v34) {
              *(float *)&v86[4 * n] = *(float *)&v86[4 * n] + 1.0;
            }
          }
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v102 objects:v134 count:16];
    }
    while (v28);
  }

  if (v88)
  {
    float v35 = (float)v80;
    uint64_t v36 = v88;
    v37 = (float *)v86;
    do
    {
      float *v37 = logf(v35 / *v37);
      ++v37;
      --v36;
    }
    while (v36);
  }
  v69[0] = [(id)v120[5] count];
  MEMORY[0x1F4188790]();
  v76 = (char *)v69 - v38;
  bzero((char *)v69 - v38, v39);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v77 = (id)v120[5];
  uint64_t v79 = [v77 countByEnumeratingWithState:&v98 objects:v133 count:16];
  if (v79)
  {
    unint64_t v80 = 0;
    uint64_t v78 = *(void *)v99;
    do
    {
      unint64_t v80 = (int)v80;
      uint64_t v81 = 0;
      uint64_t i = (uint64_t)&v76[v82 * (int)v80];
      do
      {
        if (*(void *)v99 != v78) {
          objc_enumerationMutation(v77);
        }
        uint64_t v40 = *(void *)(*((void *)&v98 + 1) + 8 * v81);
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v89 = v87;
        uint64_t v41 = [v89 countByEnumeratingWithState:&v94 objects:v132 count:16];
        if (v41)
        {
          int v42 = 0;
          uint64_t v43 = *(void *)v95;
          do
          {
            uint64_t v44 = 0;
            uint64_t v85 = v42;
            v45 = (char *)(i + 4 * v42);
            do
            {
              if (*(void *)v95 != v43) {
                objc_enumerationMutation(v89);
              }
              uint64_t v46 = *(void *)(*((void *)&v94 + 1) + 8 * v44);
              v47 = [(id)v126[5] objectForKeyedSubscript:v40];
              v48 = [v47 objectForKeyedSubscript:v46];
              LODWORD(v46) = [v48 intValue];

              *(float *)&v45[4 * v44++] = (float)(int)v46;
            }
            while (v41 != v44);
            uint64_t v41 = [v89 countByEnumeratingWithState:&v94 objects:v132 count:16];
            int v42 = v85 + v44;
          }
          while (v41);
        }

        i += v82;
        ++v80;
        ++v81;
      }
      while (v81 != v79);
      uint64_t v79 = [v77 countByEnumeratingWithState:&v98 objects:v133 count:16];
    }
    while (v79);
  }

  id v89 = [v75 firstObject];
  uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v69[0]];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  unint64_t v80 = (unint64_t)(id)v120[5];
  uint64_t v49 = [(id)v80 countByEnumeratingWithState:&v90 objects:v131 count:16];
  if (v49)
  {
    int v50 = 0;
    uint64_t v81 = *(void *)v91;
    do
    {
      uint64_t v51 = 0;
      v52 = &v76[v82 * v50];
      uint64_t v85 = v49;
      do
      {
        if (*(void *)v91 != v81) {
          objc_enumerationMutation((id)v80);
        }
        uint64_t v53 = *(void *)(*((void *)&v90 + 1) + 8 * v51);
        v54 = objc_alloc_init(_CDAdvisedInteraction);
        -[_CDAdvisedInteraction setMechanism:](v54, "setMechanism:", [v89 mechanism]);
        v55 = [v89 bundleId];
        [(_CDAdvisedInteraction *)v54 setBundleId:v55];

        v56 = [v89 account];
        [(_CDAdvisedInteraction *)v54 setAccount:v56];
        BOOL v57 = v88 == 0;

        double v58 = 0.0;
        if (!v57)
        {
          uint64_t v59 = v88;
          v60 = (float *)v52;
          v61 = (float *)v86;
          do
          {
            float v62 = *v60++;
            float v63 = v62;
            float v64 = *v61++;
            double v58 = v58 + (float)(v63 * v64);
            --v59;
          }
          while (v59);
        }
        [(_CDAdvisedInteraction *)v54 setScore:v58];
        [(_CDAdvisedInteraction *)v54 setContact:v53];
        [(id)i addObject:v54];

        ++v50;
        ++v51;
        v52 += v82;
      }
      while (v51 != v85);
      uint64_t v49 = [(id)v80 countByEnumeratingWithState:&v90 objects:v131 count:16];
    }
    while (v49);
  }

  v65 = [(id)i sortedArrayUsingComparator:&__block_literal_global_21];
  unint64_t v66 = [v73 resultLimit];
  if (v66 < [v65 count])
  {
    uint64_t v67 = objc_msgSend(v65, "subarrayWithRange:", 0, objc_msgSend(v73, "resultLimit"));

    v65 = (void *)v67;
  }

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v125, 8);

  return v65;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end