@interface SGMultiHeadEspressoModel
+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5;
+ (id)makeStringForShape:(unint64_t)a3[10];
+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4;
- (SGMultiHeadEspressoModel)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputName:(id)a6 inputNumParameters:(unint64_t)a7 headDimensionality:(id)a8;
- (id)headDimensionality;
- (id)predict:(id)a3;
- (id)predict:(id)a3 heads:(id)a4;
- (unint64_t)inputNumParameters;
- (void)dealloc;
@end

@implementation SGMultiHeadEspressoModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

- (id)predict:(id)a3
{
  headDimensionality = self->_headDimensionality;
  id v5 = a3;
  v6 = [(NSDictionary *)headDimensionality allKeys];
  v7 = [(SGMultiHeadEspressoModel *)self predict:v5 heads:v6];

  return v7;
}

- (id)predict:(id)a3 heads:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    v21 = MEMORY[0x263EFFA78];
    goto LABEL_32;
  }
  v55 = v6;
  v8 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v54 = v7;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(NSString **)(*((void *)&v58 + 1) + 8 * i);
        v15 = [(NSDictionary *)self->_headDimensionality objectForKeyedSubscript:v14];

        if (v15)
        {
          [v8 addObject:v14];
        }
        else
        {
          v16 = sgLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v14;
            _os_log_impl(&dword_226E32000, v16, OS_LOG_TYPE_INFO, "Could not validate existence of head %@ in model", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    unint64_t v17 = [v8 count];
    v18 = sgLogHandle();
    v19 = v18;
    if (v17 >= 9)
    {
      id v6 = v55;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v20 = [v8 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412546;
        v67 = v20;
        __int16 v68 = 2048;
        uint64_t v69 = 8;
        _os_log_fault_impl(&dword_226E32000, v19, OS_LOG_TYPE_FAULT, "Running inference on heads %@ but max heads for inference is %lu", buf, 0x16u);
      }
LABEL_29:
      v21 = 0;
      goto LABEL_30;
    }
    id v6 = v55;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v22 = [v8 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412290;
      v67 = v22;
      _os_log_impl(&dword_226E32000, v19, OS_LOG_TYPE_INFO, "Running multi-head inference on heads %@", buf, 0xCu);
    }
    v19 = objc_opt_new();
    v23 = (void *)MEMORY[0x22A66BDC0]();
    [(NSString *)self->_inputName cStringUsingEncoding:4];
    int v24 = espresso_network_bind_buffer();
    if (v24)
    {
      int v25 = v24;
      v26 = sgLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        inputName = self->_inputName;
        *(_DWORD *)buf = 138412546;
        v67 = inputName;
        __int16 v68 = 1024;
        LODWORD(v69) = v25;
        _os_log_fault_impl(&dword_226E32000, v26, OS_LOG_TYPE_FAULT, "Could not bind the input buffer to layer %@ in espresso plan, status code %d", buf, 0x12u);
      }

      goto LABEL_29;
    }
    [v55 sparseVectorToDense:0 length:self->_inputNumParameters];
    bzero(buf, 0x540uLL);
    if ([v8 count])
    {
      context = v23;
      unint64_t v29 = 0;
      char v30 = 0;
      v31 = buf;
      *(void *)&long long v28 = 138412546;
      long long v53 = v28;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v29, v53);
        id v32 = objc_claimAutoreleasedReturnValue();
        [v32 cStringUsingEncoding:4];
        int v33 = espresso_network_bind_buffer();
        if (v33)
        {
          int v34 = v33;
          v35 = sgLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v62 = v53;
            id v63 = v32;
            __int16 v64 = 1024;
            int v65 = v34;
            _os_log_fault_impl(&dword_226E32000, v35, OS_LOG_TYPE_FAULT, "Could not bind the output buffer to layer %@ in espresso plan, status code %d", v62, 0x12u);
          }

          char v30 = 1;
        }
        id v36 = objc_alloc(MEMORY[0x263EFF980]);
        v37 = [(NSDictionary *)self->_headDimensionality objectForKeyedSubscript:v32];
        v38 = objc_msgSend(v36, "initWithCapacity:", objc_msgSend(v37, "unsignedIntegerValue"));
        [v19 setObject:v38 forKeyedSubscript:v32];

        ++v29;
        v31 += 168;
      }
      while (v29 < [v8 count]);
      v23 = context;
      if (v30)
      {
        v39 = sgLogHandle();
        id v7 = v54;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v62 = 0;
          _os_log_fault_impl(&dword_226E32000, v39, OS_LOG_TYPE_FAULT, "Could not bind output buffer to network given output names", v62, 2u);
        }
LABEL_49:

        v21 = 0;
        goto LABEL_31;
      }
    }
    int v40 = espresso_plan_execute_sync();
    if (v40)
    {
      int v41 = v40;
      v39 = sgLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v62 = 67109120;
        LODWORD(v63) = v41;
        _os_log_fault_impl(&dword_226E32000, v39, OS_LOG_TYPE_FAULT, "Could not execute espresso plan, status code %d", v62, 8u);
      }
      id v7 = v54;
      goto LABEL_49;
    }
    contexta = v23;
    if ([v8 count])
    {
      unint64_t v42 = 0;
      do
      {
        v43 = [v8 objectAtIndexedSubscript:v42];
        v44 = [(NSDictionary *)self->_headDimensionality objectForKeyedSubscript:v43];
        uint64_t v45 = [v44 unsignedIntegerValue];

        if (v45)
        {
          unint64_t v47 = 0;
          do
          {
            LODWORD(v46) = *(_DWORD *)(*(void *)&buf[168 * v42] + 4 * v47);
            v48 = [NSNumber numberWithFloat:v46];
            v49 = [v19 objectForKeyedSubscript:v43];
            [v49 setObject:v48 atIndexedSubscript:v47];

            ++v47;
            v50 = [(NSDictionary *)self->_headDimensionality objectForKeyedSubscript:v43];
            unint64_t v51 = [v50 unsignedIntegerValue];
          }
          while (v47 < v51);
        }

        ++v42;
      }
      while (v42 < [v8 count]);
    }
    v19 = v19;
    v21 = v19;
  }
  else
  {
    v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_226E32000, v19, OS_LOG_TYPE_FAULT, "No available heads were found for inference", buf, 2u);
    }
    v21 = 0;
  }
  id v6 = v55;
LABEL_30:
  id v7 = v54;
LABEL_31:

LABEL_32:
  return v21;
}

- (id)headDimensionality
{
  return self->_headDimensionality;
}

- (unint64_t)inputNumParameters
{
  return self->_inputNumParameters;
}

- (SGMultiHeadEspressoModel)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputName:(id)a6 inputNumParameters:(unint64_t)a7 headDimensionality:(id)a8
{
  uint64_t v10 = *(void *)&a5.var1;
  var0 = a5.var0;
  id v15 = a6;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SGMultiHeadEspressoModel;
  unint64_t v17 = [(SGMultiHeadEspressoModel *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_espressoPlan = a4;
    v17->_espressoContext = a3;
    v17->_espressoModel.plan = var0;
    *(void *)&v17->_espressoModel.network_index = v10;
    objc_storeStrong((id *)&v17->_inputName, a6);
    v18->_inputNumParameters = a7;
    objc_storeStrong((id *)&v18->_headDimensionality, a8);
  }

  return v18;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SGMultiHeadEspressoModel;
  [(SGMultiHeadEspressoModel *)&v3 dealloc];
}

+ (id)classifierWithEspressoModelFile:(id)a3 inputName:(id)a4 headDimensionality:(id)a5
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = espresso_create_context();
  if (!v10)
  {
    unint64_t v17 = sgLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v18 = "Could not create espresso context";
LABEL_10:
    v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  uint64_t plan = espresso_create_plan();
  if (!plan)
  {
    unint64_t v17 = sgLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v18 = "Could not create espresso plan";
    goto LABEL_10;
  }
  uint64_t v13 = plan;
  uint64_t v84 = v11;
  uint64_t v95 = 0;
  uint64_t v96 = 0;
  id v14 = v7;
  [v14 UTF8String];
  int v15 = espresso_plan_add_network();
  if (v15)
  {
    int v16 = v15;
    unint64_t v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 65568;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      v18 = "Could not add espresso network from file %@ with storage type %05x, status code %d";
      v19 = v17;
      uint32_t v20 = 24;
LABEL_11:
      _os_log_fault_impl(&dword_226E32000, v19, OS_LOG_TYPE_FAULT, v18, buf, v20);
    }
LABEL_32:

LABEL_33:
    v37 = 0;
    goto LABEL_34;
  }
  uint64_t v83 = v13;
  id v21 = v8;
  [v21 cStringUsingEncoding:4];
  int v22 = espresso_network_declare_input();
  if (v22)
  {
    int v23 = v22;
    unint64_t v17 = sgLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23;
    v18 = "Could not declare espresso network input %@, status code %d";
    v19 = v17;
    uint32_t v20 = 18;
    goto LABEL_11;
  }
  long long v94 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v91 = 0u;
  id v24 = v9;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v91 objects:v131 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    id v79 = v7;
    id v81 = v9;
    char v27 = 0;
    uint64_t v28 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v92 != v28) {
          objc_enumerationMutation(v24);
        }
        id v30 = *(id *)(*((void *)&v91 + 1) + 8 * i);
        [v30 cStringUsingEncoding:4];
        int v31 = espresso_network_declare_output();
        if (v31)
        {
          int v32 = v31;
          int v33 = sgLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v30;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_fault_impl(&dword_226E32000, v33, OS_LOG_TYPE_FAULT, "Could not declare espresso network output %@, status code %d", buf, 0x12u);
          }

          char v27 = 1;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v91 objects:v131 count:16];
    }
    while (v26);

    id v7 = v79;
    id v9 = v81;
    if (v27)
    {
      unint64_t v17 = sgLogHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      v18 = "Espresso multi head model did not have all declared heads";
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v34 = v83;
  int v35 = espresso_plan_build();
  if (v35)
  {
    int v36 = v35;
    unint64_t v17 = sgLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v36;
    v18 = "Could not build espresso plan, status code %d";
    v19 = v17;
    uint32_t v20 = 8;
    goto LABEL_11;
  }
  context = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v130 = 0;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  memset(buf, 0, sizeof(buf));
  id v39 = v21;
  [v39 cStringUsingEncoding:4];
  int v40 = espresso_network_bind_buffer();
  if (v40)
  {
    int v41 = v40;
    unint64_t v42 = sgLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v109 = 138412546;
      *(void *)&v109[4] = v39;
      *(_WORD *)&v109[12] = 1024;
      *(_DWORD *)&v109[14] = v41;
      _os_log_fault_impl(&dword_226E32000, v42, OS_LOG_TYPE_FAULT, "Could not bind the input buffer to layer %@ in espresso plan during initialization, status code %d", v109, 0x12u);
    }

    goto LABEL_33;
  }
  uint64_t v90 = 0;
  memset(v120, 0, sizeof(v120));
  int v43 = espresso_buffer_unpack_tensor_shape();
  if (v43)
  {
    int v44 = v43;
    id v82 = v9;
    uint64_t v45 = sgLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v109 = 138412546;
      *(void *)&v109[4] = v39;
      *(_WORD *)&v109[12] = 1024;
      *(_DWORD *)&v109[14] = v44;
      _os_log_fault_impl(&dword_226E32000, v45, OS_LOG_TYPE_FAULT, "Unable to get input shape to layer %@ in espresso plan during initialization, status code %d", v109, 0x12u);
    }
    double v46 = context;
    goto LABEL_45;
  }
  id v76 = v39;
  id v78 = v8;
  id v80 = v7;
  unint64_t v47 = +[SGMultiHeadEspressoModel getNumParametersFromShape:v120 rank:v90];
  v48 = sgLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    v74 = +[SGMultiHeadEspressoModel makeStringForShape:v120];
    *(_DWORD *)v109 = 138413058;
    *(void *)&v109[4] = v76;
    *(_WORD *)&v109[12] = 2048;
    *(void *)&v109[14] = v90;
    *(_WORD *)&v109[22] = 2112;
    *(void *)&v109[24] = v74;
    LOWORD(v110) = 2048;
    *(void *)((char *)&v110 + 2) = v47;
    _os_log_debug_impl(&dword_226E32000, v48, OS_LOG_TYPE_DEBUG, "Input layer %@ has rank %zu, shape %@, num parameters %tu", v109, 0x2Au);
  }
  unint64_t v75 = v47;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v49 = v24;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v119 count:16];
  if (!v50)
  {

    goto LABEL_77;
  }
  uint64_t v51 = v50;
  id v82 = v9;
  int v52 = 0;
  uint64_t v53 = *(void *)v87;
  do
  {
    for (uint64_t j = 0; j != v51; ++j)
    {
      if (*(void *)v87 != v53) {
        objc_enumerationMutation(v49);
      }
      v55 = *(void **)(*((void *)&v86 + 1) + 8 * j);
      v56 = [v49 objectForKeyedSubscript:v55];
      uint64_t v118 = 0;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      memset(v109, 0, sizeof(v109));
      id v57 = v55;
      [v57 cStringUsingEncoding:4];
      int v58 = espresso_network_bind_buffer();
      if (!v58)
      {
        uint64_t v61 = v53;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v106 = 0u;
        memset(v105, 0, sizeof(v105));
        int v62 = espresso_buffer_unpack_tensor_shape();
        if (v62)
        {
          int v63 = v62;
          __int16 v64 = sgLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v97 = 138412546;
            id v98 = v57;
            __int16 v99 = 1024;
            LODWORD(v100) = v63;
            int v65 = v64;
            v66 = "Unable to get output shape to layer %@ in espresso plan during initialization, status code %d";
            uint32_t v67 = 18;
            goto LABEL_66;
          }
          goto LABEL_67;
        }
        int v85 = v52;
        unint64_t v68 = +[SGMultiHeadEspressoModel getNumParametersFromShape:v105 rank:0];
        uint64_t v69 = [v56 unsignedIntegerValue];
        v70 = sgLogHandle();
        __int16 v64 = v70;
        if (v69 == v68)
        {
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v72 = +[SGMultiHeadEspressoModel makeStringForShape:v105];
            *(_DWORD *)v97 = 138413058;
            id v98 = v57;
            __int16 v99 = 2048;
            uint64_t v100 = 0;
            __int16 v101 = 2112;
            unint64_t v102 = (unint64_t)v72;
            __int16 v103 = 2048;
            unint64_t v104 = v68;
            _os_log_debug_impl(&dword_226E32000, v64, OS_LOG_TYPE_DEBUG, "Output layer %@ has rank %zu, shape %@, num parameters %tu", v97, 0x2Au);
          }
          int v52 = v85;
        }
        else
        {
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
          {
            uint64_t v71 = [v56 unsignedIntegerValue];
            *(_DWORD *)v97 = 138412802;
            id v98 = v57;
            __int16 v99 = 2048;
            uint64_t v100 = v71;
            __int16 v101 = 2048;
            unint64_t v102 = v68;
            int v65 = v64;
            v66 = "Output layer %@ has expected dimensionality %lu but has actual dimensionality %lu";
            uint32_t v67 = 32;
LABEL_66:
            _os_log_fault_impl(&dword_226E32000, v65, OS_LOG_TYPE_FAULT, v66, v97, v67);
          }
LABEL_67:
          int v52 = 1;
        }

        uint64_t v53 = v61;
        goto LABEL_69;
      }
      int v59 = v58;
      long long v60 = sgLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v105 = 138412546;
        *(void *)&v105[4] = v57;
        *(_WORD *)&v105[12] = 1024;
        *(_DWORD *)&v105[14] = v59;
        _os_log_fault_impl(&dword_226E32000, v60, OS_LOG_TYPE_FAULT, "Could not bind the output buffer to layer %@ in espresso plan during initialization, status code %d", v105, 0x12u);
      }

      int v52 = 1;
LABEL_69:
    }
    uint64_t v51 = [v49 countByEnumeratingWithState:&v86 objects:v119 count:16];
  }
  while (v51);

  id v9 = v82;
  uint64_t v34 = v83;
  if ((v52 & 1) == 0)
  {
LABEL_77:
    v73 = [SGMultiHeadEspressoModel alloc];
    v37 = -[SGMultiHeadEspressoModel initWithEspressoContext:espressoPlan:espressoModel:inputName:inputNumParameters:headDimensionality:](v73, "initWithEspressoContext:espressoPlan:espressoModel:inputName:inputNumParameters:headDimensionality:", v84, v34, v95, v96, v76, v75, v49);
    id v8 = v78;
    id v7 = v80;
    goto LABEL_34;
  }
  uint64_t v45 = sgLogHandle();
  id v8 = v78;
  double v46 = context;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v109 = 0;
    _os_log_fault_impl(&dword_226E32000, v45, OS_LOG_TYPE_FAULT, "Espresso multi head model output dimensionality did not match that expected", v109, 2u);
  }
  id v7 = v80;
LABEL_45:

  v37 = 0;
  id v9 = v82;
LABEL_34:

  return v37;
}

+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  unint64_t v4 = 10;
  if (a4 < 0xA) {
    unint64_t v4 = a4;
  }
  unint64_t result = 1;
  do
  {
    uint64_t v6 = *a3++;
    result *= v6;
    --v4;
  }
  while (v4);
  return result;
}

+ (id)makeStringForShape:(unint64_t)a3[10]
{
  unint64_t v4 = objc_opt_new();
  [v4 appendString:@"{"];
  for (uint64_t i = 0; i != 10; ++i)
    objc_msgSend(v4, "appendFormat:", @" %zu", a3[i]);
  [v4 appendString:@" }"];
  return v4;
}

@end