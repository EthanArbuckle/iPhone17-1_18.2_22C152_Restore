@interface BMEventExtractor
- (BMEventExtractor)init;
- (BMEventExtractor)initWithBMMiningTaskConfig:(id)a3;
- (BMMiningTaskConfig)bmMiningTaskConfig;
- (BOOL)shouldStop;
- (id)extractEventsFilteredByTypes:(id)a3 taskSpecificEventProviders:(id)a4 error:(id *)a5;
- (void)setBmMiningTaskConfig:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)terminateEarly;
@end

@implementation BMEventExtractor

- (BMEventExtractor)init
{
  return [(BMEventExtractor *)self initWithBMMiningTaskConfig:0];
}

- (BMEventExtractor)initWithBMMiningTaskConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMEventExtractor;
  v6 = [(BMEventExtractor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_shouldStop = 0;
    objc_storeStrong((id *)&v6->_bmMiningTaskConfig, a3);
  }

  return v7;
}

- (void)terminateEarly
{
}

- (id)extractEventsFilteredByTypes:(id)a3 taskSpecificEventProviders:(id)a4 error:(id *)a5
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v117 = a4;
  id v124 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v125 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v153 objects:v168 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v154;
    do
    {
      v12 = v8;
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v154 != v11) {
          objc_enumerationMutation(v12);
        }
        v14 = *(void **)(*((void *)&v153 + 1) + 8 * i);
        if ([(BMEventExtractor *)self shouldStop])
        {
          id v8 = v12;
          id v22 = v12;
          v65 = (void *)MEMORY[0x263EFFA68];
          goto LABEL_106;
        }
        v15 = [v14 eventStream];

        if (v15)
        {
          v16 = [v14 eventStream];
          v17 = [v16 name];
          id v18 = [v125 objectForKey:v17];

          if (!v18)
          {
            id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
            v19 = [v14 eventStream];
            v20 = [v19 name];
            [v125 setObject:v18 forKey:v20];
          }
          [v18 addObject:v14];
          v21 = [v14 eventStream];
          [v124 addObject:v21];
        }
      }
      id v8 = v12;
      uint64_t v10 = [v12 countByEnumeratingWithState:&v153 objects:v168 count:16];
    }
    while (v10);
  }

  id v22 = [MEMORY[0x263EFF980] array];
  if ([v124 count])
  {
    v23 = (void *)MEMORY[0x223C621B0]();
    v24 = [MEMORY[0x263F350B8] knowledgeStoreWithDirectReadOnlyAccess];
    v25 = (void *)MEMORY[0x263F35090];
    v26 = [v124 allObjects];
    v27 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
    v167 = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v167 count:1];
    uint64_t v29 = [v25 eventQueryWithPredicate:0 eventStreams:v26 offset:0 limit:50000 sortDescriptors:v28];

    id v152 = 0;
    v108 = (void *)v29;
    v30 = [v24 executeQuery:v29 error:&v152];
    id v31 = v152;
    v32 = v31;
    if (v30)
    {
      v104 = v24;
      v106 = v23;
      id v112 = v31;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      v101 = v30;
      id obj = v30;
      id v121 = (id)[obj countByEnumeratingWithState:&v148 objects:v166 count:16];
      if (v121)
      {
        context = *(void **)v149;
        id v103 = v8;
        do
        {
          for (j = 0; j != v121; j = (char *)j + 1)
          {
            if (*(void **)v149 != context) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v148 + 1) + 8 * (void)j);
            if ([(BMEventExtractor *)self shouldStop])
            {

              v65 = (void *)MEMORY[0x263EFFA68];
              id v8 = v103;
              goto LABEL_104;
            }
            long long v146 = 0u;
            long long v147 = 0u;
            long long v144 = 0u;
            long long v145 = 0u;
            v35 = [v34 stream];
            v36 = [v35 name];
            v37 = [v125 objectForKey:v36];

            uint64_t v38 = [v37 countByEnumeratingWithState:&v144 objects:v165 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v145;
              do
              {
                for (uint64_t k = 0; k != v39; ++k)
                {
                  if (*(void *)v145 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  v42 = *(void **)(*((void *)&v144 + 1) + 8 * k);
                  v43 = (void *)MEMORY[0x223C621B0]();
                  v44 = [v42 extractEventFromDKEvent:v34];
                  if (v44) {
                    [v22 addObject:v44];
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v144 objects:v165 count:16];
              }
              while (v39);
            }
          }
          id v8 = v103;
          id v121 = (id)[obj countByEnumeratingWithState:&v148 objects:v166 count:16];
        }
        while (v121);
      }

      v32 = v112;
      v24 = v104;
      v23 = v106;
      v30 = v101;
    }

    if (v32) {
      goto LABEL_97;
    }
  }
  unint64_t v45 = 0x264546000uLL;
  v46 = +[BMItemType interactionRecipients];
  int v47 = [v8 containsObject:v46];

  if (v47)
  {
    v48 = (void *)MEMORY[0x223C621B0]();
    v49 = BMLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[BMEventExtractor extractEventsFilteredByTypes:taskSpecificEventProviders:error:](self);
    }

    v50 = [(BMEventExtractor *)self bmMiningTaskConfig];

    if (v50)
    {
      v51 = BMLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        -[BMEventExtractor extractEventsFilteredByTypes:taskSpecificEventProviders:error:](self);
      }
    }
    v52 = [BMInteractionProvider alloc];
    v53 = [(BMEventExtractor *)self bmMiningTaskConfig];
    v54 = [(BMInteractionProvider *)v52 initWithBMMiningTaskConfig:v53];

    id v143 = 0;
    v55 = [(BMInteractionProvider *)v54 interactionEventsForTypes:v8 error:&v143];
    id v56 = v143;
    v32 = v56;
    if (v55)
    {
      obja = (BMCoreRoutineProvider *)v54;
      contexta = v48;
      v109 = v55;
      id v112 = v56;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id v122 = v55;
      uint64_t v57 = [v122 countByEnumeratingWithState:&v139 objects:v164 count:16];
      if (!v57) {
        goto LABEL_52;
      }
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v140;
      while (1)
      {
        for (uint64_t m = 0; m != v58; ++m)
        {
          if (*(void *)v140 != v59) {
            objc_enumerationMutation(v122);
          }
          v61 = *(void **)(*((void *)&v139 + 1) + 8 * m);
          if ([(BMEventExtractor *)self shouldStop])
          {
LABEL_101:

            v65 = (void *)MEMORY[0x263EFFA68];
LABEL_104:
            v32 = v112;
            goto LABEL_105;
          }
          v62 = [v61 item];
          v63 = [v62 type];
          int v64 = [v8 containsObject:v63];

          if (v64) {
            [v22 addObject:v61];
          }
        }
        uint64_t v58 = [v122 countByEnumeratingWithState:&v139 objects:v164 count:16];
        if (!v58)
        {
LABEL_52:

          v55 = v109;
          v32 = v112;
          unint64_t v45 = 0x264546000;
          v48 = contexta;
          v54 = (BMInteractionProvider *)obja;
          break;
        }
      }
    }
  }
  else
  {
    v32 = 0;
  }
  v66 = [*(id *)(v45 + 1496) locationIdentifier];
  id v112 = v32;
  if ([v8 containsObject:v66]) {
    goto LABEL_59;
  }
  v67 = [*(id *)(v45 + 1496) enterLocation];
  if ([v8 containsObject:v67])
  {

LABEL_59:
LABEL_60:
    v68 = (void *)MEMORY[0x223C621B0]();
    v69 = objc_alloc_init(BMCoreRoutineProvider);
    v70 = [(BMCoreRoutineProvider *)v69 locationEvents];
    if (v70)
    {
      obja = v69;
      contexta = v68;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      v110 = v70;
      id v122 = v70;
      uint64_t v71 = [v122 countByEnumeratingWithState:&v135 objects:v163 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = *(void *)v136;
        do
        {
          for (uint64_t n = 0; n != v72; ++n)
          {
            if (*(void *)v136 != v73) {
              objc_enumerationMutation(v122);
            }
            v75 = *(void **)(*((void *)&v135 + 1) + 8 * n);
            if ([(BMEventExtractor *)self shouldStop]) {
              goto LABEL_101;
            }
            v76 = [v75 item];
            v77 = [v76 type];
            int v78 = [v8 containsObject:v77];

            if (v78) {
              [v22 addObject:v75];
            }
          }
          uint64_t v72 = [v122 countByEnumeratingWithState:&v135 objects:v163 count:16];
        }
        while (v72);
      }

      v70 = v110;
      v32 = v112;
      v68 = contexta;
      v69 = obja;
    }

    goto LABEL_73;
  }
  v98 = [*(id *)(v45 + 1496) exitLocation];
  char v99 = [v8 containsObject:v98];

  if (v99) {
    goto LABEL_60;
  }
LABEL_73:
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v79 = v117;
  uint64_t v80 = [v79 countByEnumeratingWithState:&v131 objects:v162 count:16];
  if (!v80) {
    goto LABEL_96;
  }
  uint64_t v82 = v80;
  contextb = *(void **)v132;
  *(void *)&long long v81 = 138412546;
  long long v100 = v81;
  v107 = v79;
  do
  {
    for (iuint64_t i = 0; ii != v82; ++ii)
    {
      if (*(void **)v132 != contextb) {
        objc_enumerationMutation(v79);
      }
      v84 = *(void **)(*((void *)&v131 + 1) + 8 * ii);
      id v130 = 0;
      v85 = objc_msgSend(v84, "eventsForTypes:error:", v8, &v130, v100);
      id v86 = v130;
      v87 = v86;
      if (v85)
      {
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id objb = v85;
        v123 = v85;
        uint64_t v88 = [v123 countByEnumeratingWithState:&v126 objects:v161 count:16];
        if (v88)
        {
          uint64_t v89 = v88;
          v111 = v87;
          uint64_t v102 = ii;
          uint64_t v105 = v82;
          v90 = v8;
          uint64_t v91 = *(void *)v127;
          while (2)
          {
            for (uint64_t jj = 0; jj != v89; ++jj)
            {
              if (*(void *)v127 != v91) {
                objc_enumerationMutation(v123);
              }
              v93 = *(void **)(*((void *)&v126 + 1) + 8 * jj);
              if ([(BMEventExtractor *)self shouldStop])
              {

                v65 = (void *)MEMORY[0x263EFFA68];
                id v8 = v90;
                goto LABEL_104;
              }
              v94 = [v93 item];
              v95 = [v94 type];
              int v96 = [v90 containsObject:v95];

              if (v96) {
                [v22 addObject:v93];
              }
            }
            uint64_t v89 = [v123 countByEnumeratingWithState:&v126 objects:v161 count:16];
            if (v89) {
              continue;
            }
            break;
          }
          id v8 = v90;
          v87 = v111;
          v32 = v112;
          uint64_t v82 = v105;
          id v79 = v107;
          iuint64_t i = v102;
        }
      }
      else
      {
        if (!v86) {
          goto LABEL_94;
        }
        id objb = 0;
        v123 = BMLog();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v100;
          v158 = v87;
          __int16 v159 = 2112;
          v160 = v84;
          _os_log_fault_impl(&dword_21FF33000, v123, OS_LOG_TYPE_FAULT, "Unexpected error in taskSpecificEventProvider {error: %@, provider: %@}", buf, 0x16u);
        }
      }

      v85 = objb;
LABEL_94:
    }
    uint64_t v82 = [v79 countByEnumeratingWithState:&v131 objects:v162 count:16];
  }
  while (v82);
LABEL_96:

  if (v32)
  {
LABEL_97:

    id v22 = 0;
  }
  if (a5) {
    *a5 = v32;
  }
  id v22 = v22;
  v65 = v22;
LABEL_105:

LABEL_106:

  return v65;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return (BMMiningTaskConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)extractEventsFilteredByTypes:(void *)a1 taskSpecificEventProviders:error:.cold.1(void *a1)
{
  v1 = NSNumber;
  v2 = [a1 bmMiningTaskConfig];
  v3 = objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "interactionExtractedTopicFromAttachmentFactorInUse"));
  OUTLINED_FUNCTION_0_0(&dword_21FF33000, v4, v5, "Passing bmMiningTaskConfig to BMInteractionProvider with interactionExtractedTopicFromAttachmentFactorInUse as %@", v6, v7, v8, v9, 2u);
}

- (void)extractEventsFilteredByTypes:(void *)a1 taskSpecificEventProviders:error:.cold.2(void *a1)
{
  v1 = [a1 bmMiningTaskConfig];
  OUTLINED_FUNCTION_0_0(&dword_21FF33000, v2, v3, "Passing bmMiningTaskConfig to BMInteractionProvider %@", v4, v5, v6, v7, 2u);
}

@end