@interface MDLMaterialPropertyNode
- (MDLMaterialPropertyNode)initWithInputs:(NSArray *)inputs outputs:(NSArray *)outputs evaluationFunction:(void *)function;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)name;
- (void)evaluationFunction;
- (void)setEvaluationFunction:(void *)evaluationFunction;
- (void)setName:(id)a3;
@end

@implementation MDLMaterialPropertyNode

- (MDLMaterialPropertyNode)initWithInputs:(NSArray *)inputs outputs:(NSArray *)outputs evaluationFunction:(void *)function
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  v9 = inputs;
  v75 = outputs;
  v73 = function;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obj = v9;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v90, v97, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v91;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v91 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v90 + 1) + 8 * v13);
        id WeakRetained = objc_loadWeakRetained((id *)(v14 + 160));
        BOOL v16 = WeakRetained == 0;

        if (!v16)
        {
          v18 = (void *)MEMORY[0x263EFF940];
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          v21 = NSStringFromSelector(a2);
          objc_msgSend_raise_format_(v18, v22, @"ModelIOException", @"[%@ %@]: input cannot be assigned to multiple nodes", v20, v21);
        }
        if (objc_msgSend_containsObject_(v75, v17, v14))
        {
          v24 = (void *)MEMORY[0x263EFF940];
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          v27 = NSStringFromSelector(a2);
          objc_msgSend_raise_format_(v24, v28, @"ModelIOException", @"[%@ %@]: input appears in output array", v26, v27);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v90, v97, 16);
    }
    while (v11);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v74 = v75;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v29, (uint64_t)&v86, v96, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v87;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v87 != v31) {
          objc_enumerationMutation(v74);
        }
        uint64_t v33 = *(void *)(*((void *)&v86 + 1) + 8 * v32);
        id v34 = objc_loadWeakRetained((id *)(v33 + 160));
        BOOL v35 = v34 == 0;

        if (!v35)
        {
          v37 = (void *)MEMORY[0x263EFF940];
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          v40 = NSStringFromSelector(a2);
          objc_msgSend_raise_format_(v37, v41, @"ModelIOException", @"[%@ %@]: output cannot be assigned to multiple nodes", v39, v40);
        }
        if (objc_msgSend_containsObject_(obj, v36, v33))
        {
          v43 = (void *)MEMORY[0x263EFF940];
          v44 = (objc_class *)objc_opt_class();
          v45 = NSStringFromClass(v44);
          v46 = NSStringFromSelector(a2);
          objc_msgSend_raise_format_(v43, v47, @"ModelIOException", @"[%@ %@]: output appears in input array", v45, v46);
        }
        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v42, (uint64_t)&v86, v96, 16);
    }
    while (v30);
  }

  v85.receiver = self;
  v85.super_class = (Class)MDLMaterialPropertyNode;
  v49 = [(MDLMaterialPropertyNode *)&v85 init];
  if (v49)
  {
    uint64_t v50 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v48, (uint64_t)obj);
    v51 = v49->_inputs;
    v49->_inputs = (NSArray *)v50;

    uint64_t v53 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v52, (uint64_t)v74);
    v54 = v49->_outputs;
    v49->_outputs = (NSArray *)v53;

    uint64_t v55 = MEMORY[0x210532CA0](v73);
    id evaluationFunction = v49->_evaluationFunction;
    v49->_id evaluationFunction = (id)v55;

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v57 = obj;
    uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v81, v95, 16);
    if (v59)
    {
      uint64_t v60 = *(void *)v82;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v82 != v60) {
            objc_enumerationMutation(v57);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v81 + 1) + 8 * v61++) + 160), v49);
        }
        while (v59 != v61);
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v62, (uint64_t)&v81, v95, 16);
      }
      while (v59);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v63 = v74;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v77, v94, 16);
    if (v65)
    {
      uint64_t v66 = *(void *)v78;
      do
      {
        uint64_t v67 = 0;
        do
        {
          if (*(void *)v78 != v66) {
            objc_enumerationMutation(v63);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v77 + 1) + 8 * v67++) + 160), v49);
        }
        while (v65 != v67);
        uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v68, (uint64_t)&v77, v94, 16);
      }
      while (v65);
    }

    v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    inputNodes = v49->_inputNodes;
    v49->_inputNodes = v69;

    v71 = v49;
  }

  return v49;
}

- (void)evaluationFunction
{
  return self->_evaluationFunction;
}

- (void)setEvaluationFunction:(void *)evaluationFunction
{
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_evaluationFunction, 0);
  objc_storeStrong((id *)&self->_inputNodes, 0);
  objc_storeStrong((id *)&self->_outputs, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end