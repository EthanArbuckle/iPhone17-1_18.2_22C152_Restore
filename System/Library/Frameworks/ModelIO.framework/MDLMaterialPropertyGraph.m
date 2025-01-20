@interface MDLMaterialPropertyGraph
- (MDLMaterialPropertyGraph)initWithNodes:(NSArray *)nodes connections:(NSArray *)connections;
- (NSArray)connections;
- (NSArray)nodes;
- (void)evaluate;
@end

@implementation MDLMaterialPropertyGraph

- (MDLMaterialPropertyGraph)initWithNodes:(NSArray *)nodes connections:(NSArray *)connections
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  v113 = nodes;
  v112 = connections;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v111 = nodes;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v110 = connections;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  obuint64_t j = v113;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v150, v160, 16);
  if (v12)
  {
    uint64_t v121 = *(void *)v151;
    do
    {
      uint64_t v13 = 0;
      uint64_t v123 = v12;
      do
      {
        if (*(void *)v151 != v121) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v150 + 1) + 8 * v13);
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        v15 = objc_msgSend_inputs(v14, v10, v11);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v146, v159, 16);
        if (v18)
        {
          uint64_t v19 = *(void *)v147;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v147 != v19) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend_addObject_(v6, v17, *(void *)(*((void *)&v146 + 1) + 8 * i));
            }
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v146, v159, 16);
          }
          while (v18);
        }

        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        v23 = objc_msgSend_outputs(v14, v21, v22);
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v142, v158, 16);
        if (v26)
        {
          uint64_t v27 = *(void *)v143;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v143 != v27) {
                objc_enumerationMutation(v23);
              }
              uint64_t v29 = *(void *)(*((void *)&v142 + 1) + 8 * j);
              objc_msgSend_addObject_(v7, v25, v29);
              objc_msgSend_setObject_forKey_(v8, v30, (uint64_t)v14, v29);
            }
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v142, v158, 16);
          }
          while (v26);
        }

        ++v13;
      }
      while (v13 != v123);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v150, v160, 16);
    }
    while (v12);
  }

  id v124 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v122 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v118 = v112;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v31, (uint64_t)&v138, v157, 16);
  if (v34)
  {
    uint64_t v35 = *(void *)v139;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v139 != v35) {
          objc_enumerationMutation(v118);
        }
        v37 = *(void **)(*((void *)&v138 + 1) + 8 * k);
        v38 = objc_msgSend_output(v37, v32, v33);
        if (v38)
        {
          v39 = objc_msgSend_input(v37, v32, v33);
          BOOL v40 = v39 == 0;

          if (!v40)
          {
            v41 = objc_msgSend_output(v37, v32, v33);
            char v43 = objc_msgSend_containsObject_(v7, v42, (uint64_t)v41);

            if ((v43 & 1) == 0)
            {
              v46 = (void *)MEMORY[0x263EFF940];
              v47 = (objc_class *)objc_opt_class();
              v48 = NSStringFromClass(v47);
              v49 = NSStringFromSelector(a2);
              objc_msgSend_raise_format_(v46, v50, @"ModelIOException", @"[%@ %@]: output connection not found in node outputs", v48, v49);
            }
            v51 = objc_msgSend_input(v37, v44, v45);
            char v53 = objc_msgSend_containsObject_(v6, v52, (uint64_t)v51);

            if ((v53 & 1) == 0)
            {
              v56 = (void *)MEMORY[0x263EFF940];
              v57 = (objc_class *)objc_opt_class();
              v58 = NSStringFromClass(v57);
              v59 = NSStringFromSelector(a2);
              objc_msgSend_raise_format_(v56, v60, @"ModelIOException", @"[%@ %@]: output connection not found in node inputs", v58, v59);
            }
            v61 = objc_msgSend_input(v37, v54, v55);
            objc_msgSend_addObject_(v124, v62, (uint64_t)v61);

            v65 = objc_msgSend_output(v37, v63, v64);
            objc_msgSend_addObject_(v122, v66, (uint64_t)v65);

            v69 = objc_msgSend_input(v37, v67, v68);
            v71 = objc_msgSend_objectForKey_(v8, v70, (uint64_t)v69);

            v74 = objc_msgSend_output(v37, v72, v73);
            objc_msgSend_objectForKey_(v8, v75, (uint64_t)v74);
            v76 = (void **)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObject_(v76[3], v77, (uint64_t)v71);
          }
        }
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v32, (uint64_t)&v138, v157, 16);
    }
    while (v34);
  }

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v119 = v118;
  uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v78, (uint64_t)&v134, v156, 16);
  if (v79)
  {
    uint64_t v80 = *(void *)v135;
    do
    {
      for (uint64_t m = 0; m != v79; ++m)
      {
        if (*(void *)v135 != v80) {
          objc_enumerationMutation(v119);
        }
        v82 = *(id **)(*((void *)&v134 + 1) + 8 * m);
        v83 = v82 + 1;
        id WeakRetained = objc_loadWeakRetained(v82 + 1);
        v82 += 2;
        v85 = (id *)objc_loadWeakRetained(v82);
        objc_storeWeak(v85 + 22, WeakRetained);

        id v86 = objc_loadWeakRetained(v82);
        v87 = (id *)objc_loadWeakRetained(v83);
        objc_storeWeak(v87 + 21, v86);
      }
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v88, (uint64_t)&v134, v156, 16);
    }
    while (v79);
  }

  aSelectora = (char *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v115 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v89 = v6;
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v130, v155, 16);
  if (v92)
  {
    uint64_t v93 = *(void *)v131;
    do
    {
      for (uint64_t n = 0; n != v92; ++n)
      {
        if (*(void *)v131 != v93) {
          objc_enumerationMutation(v89);
        }
        uint64_t v95 = *(void *)(*((void *)&v130 + 1) + 8 * n);
        if ((objc_msgSend_containsObject_(v124, v91, v95) & 1) == 0) {
          objc_msgSend_addObject_(aSelectora, v91, v95);
        }
      }
      uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v91, (uint64_t)&v130, v155, 16);
    }
    while (v92);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v96 = v7;
  uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v97, (uint64_t)&v126, v154, 16);
  if (v99)
  {
    uint64_t v100 = *(void *)v127;
    do
    {
      for (iuint64_t i = 0; ii != v99; ++ii)
      {
        if (*(void *)v127 != v100) {
          objc_enumerationMutation(v96);
        }
        uint64_t v102 = *(void *)(*((void *)&v126 + 1) + 8 * ii);
        if ((objc_msgSend_containsObject_(v122, v98, v102) & 1) == 0)
        {
          objc_msgSend_addObject_(v115, v98, v102);
          v104 = objc_msgSend_objectForKey_(v8, v103, v102);
          objc_msgSend_addObject_(self->_finalNodes, v105, (uint64_t)v104);
        }
      }
      uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v98, (uint64_t)&v126, v154, 16);
    }
    while (v99);
  }

  v125.receiver = self;
  v125.super_class = (Class)MDLMaterialPropertyGraph;
  v106 = [(MDLMaterialPropertyNode *)&v125 initWithInputs:aSelectora outputs:v115 evaluationFunction:&unk_26BF51940];
  v107 = v106;
  if (v106)
  {
    objc_storeStrong((id *)&v106->_nodes, v111);
    objc_storeStrong((id *)&v107->_connections, v110);
    v108 = v107;
  }

  return v107;
}

- (void)evaluate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_finalNodes;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v10, v14, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        sub_20B06785C(*(void **)(*((void *)&v10 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v10, v14, 16);
    }
    while (v6);
  }
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSArray)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalNodes, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end