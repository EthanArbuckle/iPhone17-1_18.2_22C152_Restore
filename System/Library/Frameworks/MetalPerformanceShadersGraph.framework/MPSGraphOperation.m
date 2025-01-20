@interface MPSGraphOperation
- (BOOL)pruneOp;
- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(Autodiff *)a5;
- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(Autodiff *)a4;
- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(Autodiff *)a4;
- (BOOL)stopGradient;
- (MPSGraph)graph;
- (MPSGraphOperation)init;
- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 name:(id)a6;
- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 region:(id)a6 name:(id)a7;
- (NSArray)controlDependencies;
- (NSArray)inputTensors;
- (NSArray)outputTensors;
- (NSMutableDictionary)tensorNameDict;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
- (void)partialDerivateForCFOpWithAutodiff:(Autodiff *)a3;
- (void)setPruneOp:(BOOL)a3;
- (void)setStopGradient:(BOOL)a3;
- (void)setTensorNameDict:(id)a3;
@end

@implementation MPSGraphOperation

- (NSArray)controlDependencies
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_controlDependencies];
}

- (MPSGraphOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPSGraphOperation;
  return [(MPSGraphOperation *)&v3 init];
}

- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 name:(id)a6
{
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 region:0 name:a6];
}

- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 region:(id)a6 name:(id)a7
{
  v12 = (char *)a3;
  id v110 = a4;
  id v109 = a5;
  id v106 = a6;
  id v105 = a7;
  v126.receiver = self;
  v126.super_class = (Class)MPSGraphOperation;
  v13 = [(MPSGraphOperation *)&v126 init];
  uint64_t v121 = 0x2B2B07D42B2B07D0;
  v122 = v12;
  uint64_t v123 = 0;
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  kdebug_trace();
  objc_storeWeak((id *)&v13->_graph, v12);
  v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v110];
  location = (id *)&v13->_graph;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&v13->_graph);
  v114 = v12;
  v115 = v14;
  v16 = [WeakRetained[21] allObjects];
  v17 = [v16 arrayByAddingObjectsFromArray:v109];
  uint64_t v18 = [v17 mutableCopy];
  controlDependencies = v13->_controlDependencies;
  v13->_controlDependencies = (NSMutableArray *)v18;

  p_name = (id *)&v13->_name;
  objc_storeStrong((id *)&v13->_name, a7);
  v13->_stopGradient = 0;
  objc_storeStrong((id *)&v13->_region, a6);
  region = v13->_region;
  if (region) {
    objc_storeWeak((id *)&region->_parentOp, v13);
  }
  p_parentBlock = (id *)&v13->_parentBlock;
  objc_storeWeak((id *)&v13->_parentBlock, *((id *)v12 + 22));
  for (unint64_t i = 0; i < [v14 count]; ++i)
  {
    v22 = [v14 objectAtIndexedSubscript:i];

    v23 = (char *)objc_loadWeakRetained(v22 + 3);
    if (v23 != v12 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    v24 = [v22 operation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v26 = *p_name;
          if (*p_name)
          {
            uint64_t v27 = [*p_name stringByAppendingString:@"/readVariable"];
            v113 = (void *)v27;
          }
          else
          {
            v28 = (objc_class *)objc_opt_class();
            v108 = NSStringFromClass(v28);
            uint64_t v27 = [v108 stringByAppendingString:@"/readVariable"];
            v107 = (void *)v27;
          }
          v29 = [v12 readVariable:v22 name:v27];
          v30 = v113;
          if (!v26)
          {

            v30 = v108;
          }

          [v14 setObject:v29 atIndexedSubscript:i];
        }
      }
    }
  }
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithArray:v14];
  inputTensors = v13->_inputTensors;
  v13->_inputTensors = (NSArray *)v31;

  unint64_t v33 = 0;
  __p = 0;
  v119 = 0;
  v120 = 0;
  while (v33 < [(NSArray *)v13->_inputTensors count])
  {
    v35 = v13;
    v36 = [(NSArray *)v13->_inputTensors objectAtIndexedSubscript:v33];
    uint64_t v37 = [v36 value];
    uint64_t v38 = v37;
    v39 = v119;
    if (v119 < v120)
    {
      *(void *)v119 = v37;
      uint64_t v34 = (uint64_t)(v39 + 8);
      v12 = v114;
      goto LABEL_20;
    }
    v40 = __p;
    int64_t v41 = v119 - (unsigned char *)__p;
    uint64_t v42 = (v119 - (unsigned char *)__p) >> 3;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61) {
      std::vector<long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v44 = v120 - (unsigned char *)__p;
    if ((v120 - (unsigned char *)__p) >> 2 > v43) {
      unint64_t v43 = v44 >> 2;
    }
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v45 = v43;
    }
    if (v45)
    {
      if (v45 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v46 = operator new(8 * v45);
      v47 = (uint64_t *)&v46[8 * v42];
      uint64_t *v47 = v38;
      uint64_t v34 = (uint64_t)(v47 + 1);
      int64_t v48 = v39 - v40;
      if (v39 != v40)
      {
LABEL_32:
        unint64_t v49 = v48 - 8;
        if (v49 < 0x58)
        {
          v13 = v35;
          goto LABEL_41;
        }
        unint64_t v50 = v39 - &v46[v41];
        v13 = v35;
        if (v50 < 0x20) {
          goto LABEL_74;
        }
        uint64_t v51 = (v49 >> 3) + 1;
        uint64_t v52 = 8 * (v51 & 0x3FFFFFFFFFFFFFFCLL);
        v53 = &v39[-v52];
        v47 = (uint64_t *)((char *)v47 - v52);
        v54 = &v46[8 * v42 - 16];
        v55 = (long long *)(v39 - 16);
        uint64_t v56 = v51 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v57 = *v55;
          *(v54 - 1) = *(v55 - 1);
          _OWORD *v54 = v57;
          v54 -= 2;
          v55 -= 2;
          v56 -= 4;
        }
        while (v56);
        v39 = v53;
        if (v51 != (v51 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_74:
          do
          {
LABEL_41:
            uint64_t v58 = *((void *)v39 - 1);
            v39 -= 8;
            *--v47 = v58;
          }
          while (v39 != v40);
        }
        v39 = __p;
        __p = v47;
        v119 = (char *)v34;
        v120 = &v46[8 * v45];
        v12 = v114;
        if (!v39) {
          goto LABEL_20;
        }
LABEL_43:
        operator delete(v39);
        goto LABEL_20;
      }
    }
    else
    {
      v46 = 0;
      v47 = (uint64_t *)(8 * v42);
      *(void *)(8 * v42) = v38;
      uint64_t v34 = 8 * v42 + 8;
      int64_t v48 = v39 - v40;
      if (v39 != v40) {
        goto LABEL_32;
      }
    }
    v13 = v35;
    __p = v47;
    v119 = (char *)v34;
    v120 = &v46[8 * v45];
    v12 = v114;
    if (v39) {
      goto LABEL_43;
    }
LABEL_20:
    v119 = (char *)v34;

    ++v33;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v12 + 104));
  v59 = objc_loadWeakRetained(location);
  v13->_mlirOperation = [(MPSGraphOperation *)v13 makeMLIROpWithBuilder:v59[7] symbolTable:v59[9] inputValues:&__p opInitialization:1 name:*p_name];

  uint64_t v60 = *((void *)v13->_mlirOperation + 3);
  if (!*(void *)v60)
  {
    v100 = "abstractAttribute && \"Malformed attribute storage object.\"";
    int v101 = 165;
    v102 = "AttributeSupport.h";
    v103 = "getAbstractAttribute";
    goto LABEL_68;
  }
  if (*(_UNKNOWN **)(*(void *)v60 + 136) != &mlir::detail::TypeIDResolver<mlir::NameLoc,void>::id)
  {
    v100 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v101 = 566;
    v102 = "Casting.h";
    v103 = "cast";
LABEL_68:
    __assert_rtn(v103, v102, v101, v100);
  }
  uint64_t v117 = *((void *)v13->_mlirOperation + 3);
  v61 = NSString;
  uint64_t Value = mlir::AffineMapAttr::getValue((mlir::AffineMapAttr *)&v117);
  uint64_t v62 = [v61 stringWithUTF8String:mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&Value)];
  id v63 = *p_name;
  id *p_name = (id)v62;

  v64 = [MEMORY[0x1E4F1CA48] array];
  mlirOperation = (unsigned int *)v13->_mlirOperation;
  uint64_t v66 = mlirOperation[9];
  if ((int)v66 >= 1)
  {
    v67 = [MPSGraphTensor alloc];
    id v68 = objc_loadWeakRetained(p_parentBlock);
    id v69 = [(MPSGraphTensor *)v67 initTensorWithOperation:v13 value:mlirOperation - 4 graph:v12 parentBlock:v68 name:*p_name];

    [v64 addObject:v69];
    if (v66 != 1)
    {
      v70 = v13->_mlirOperation;
      if (v70[9] < 2u) {
        goto LABEL_69;
      }
      v71 = [MPSGraphTensor alloc];
      id v72 = objc_loadWeakRetained(p_parentBlock);
      id v73 = [(MPSGraphTensor *)v71 initTensorWithOperation:v13 value:v70 - 8 graph:v12 parentBlock:v72 name:*p_name];

      [v64 addObject:v73];
      if (v66 != 2)
      {
        v74 = v13->_mlirOperation;
        if (v74[9] < 3u) {
          goto LABEL_69;
        }
        v75 = [MPSGraphTensor alloc];
        id v76 = objc_loadWeakRetained(p_parentBlock);
        id v77 = [(MPSGraphTensor *)v75 initTensorWithOperation:v13 value:v74 - 12 graph:v12 parentBlock:v76 name:*p_name];

        [v64 addObject:v77];
        if (v66 != 3)
        {
          v78 = v13->_mlirOperation;
          if (v78[9] < 4u) {
            goto LABEL_69;
          }
          v79 = [MPSGraphTensor alloc];
          id v80 = objc_loadWeakRetained(p_parentBlock);
          id v81 = [(MPSGraphTensor *)v79 initTensorWithOperation:v13 value:v78 - 16 graph:v12 parentBlock:v80 name:*p_name];

          [v64 addObject:v81];
          if (v66 != 4)
          {
            v82 = v13->_mlirOperation;
            if (v82[9] < 5u) {
              goto LABEL_69;
            }
            v83 = [MPSGraphTensor alloc];
            id v84 = objc_loadWeakRetained(p_parentBlock);
            id v85 = [(MPSGraphTensor *)v83 initTensorWithOperation:v13 value:v82 - 20 graph:v12 parentBlock:v84 name:*p_name];

            [v64 addObject:v85];
            if (v66 != 5)
            {
              v86 = v13->_mlirOperation;
              if (v86[9] < 6u) {
                goto LABEL_69;
              }
              v87 = [MPSGraphTensor alloc];
              id v88 = objc_loadWeakRetained(p_parentBlock);
              id v89 = [(MPSGraphTensor *)v87 initTensorWithOperation:v13 value:v86 - 24 graph:v12 parentBlock:v88 name:*p_name];

              [v64 addObject:v89];
              if (v66 != 6)
              {
                uint64_t v90 = 0x3FFFFFFFFFFFFFE2;
                unint64_t v91 = 6;
                while (1)
                {
                  v92 = (unsigned int *)v13->_mlirOperation;
                  if (v91 >= v92[9]) {
                    break;
                  }
                  v93 = [MPSGraphTensor alloc];
                  id v94 = objc_loadWeakRetained(p_parentBlock);
                  id v95 = [(MPSGraphTensor *)v93 initTensorWithOperation:v13 value:&v92[v90] graph:v12 parentBlock:v94 name:*p_name];

                  [v64 addObject:v95];
                  ++v91;
                  v90 -= 6;
                  if (v66 == v91) {
                    goto LABEL_61;
                  }
                }
LABEL_69:
                __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
              }
            }
          }
        }
      }
    }
  }
LABEL_61:
  objc_storeStrong((id *)&v13->_outputTensors, v64);
  [*((id *)v12 + 10) addObject:v13];
  id v96 = objc_loadWeakRetained(p_parentBlock);

  if (v96)
  {
    v97 = (id *)objc_loadWeakRetained(p_parentBlock);
    [v97[2] addObject:v13];
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v12 + 104));
  v98 = v13;

  if (__p)
  {
    v119 = (char *)__p;
    operator delete(__p);
  }

  kdebug_trace();
  return v98;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = self;
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  v6 = [(MPSGraphOperation *)self graph];
  [v6 dump];

  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  if ([v9 count] == 1)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      v12 = [v8 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_6;
      }
      v14 = [v8 objectAtIndexedSubscript:i];
      v15 = [v9 objectAtIndexedSubscript:0];
      v16 = NSString;
      v17 = [v14 name];
      uint64_t v18 = [v16 stringWithFormat:@"gradient for %@", v17];
      v19 = [(MPSGraphOperation *)self partialDerivativeForInputTensor:v14 incomingGradient:v15 inputIndex:i name:v18];

      if (!v19)
      {
LABEL_6:
        v19 = [MEMORY[0x1E4F1CA98] null];
      }
      [v10 addObject:v19];
    }
  }
  else
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    v10 = 0;
  }

  return v10;
}

- (void)partialDerivateForCFOpWithAutodiff:(Autodiff *)a3
{
  if (MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(Autodiff *)a5
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(Autodiff *)a4
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(Autodiff *)a4
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (NSArray)inputTensors
{
  return self->_inputTensors;
}

- (NSArray)outputTensors
{
  return self->_outputTensors;
}

- (NSString)name
{
  return self->_name;
}

- (MPSGraph)graph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);

  return (MPSGraph *)WeakRetained;
}

- (BOOL)pruneOp
{
  return self->_pruneOp;
}

- (void)setPruneOp:(BOOL)a3
{
  self->_pruneOp = a3;
}

- (NSMutableDictionary)tensorNameDict
{
  return self->_tensorNameDict;
}

- (void)setTensorNameDict:(id)a3
{
}

- (BOOL)stopGradient
{
  return self->_stopGradient;
}

- (void)setStopGradient:(BOOL)a3
{
  self->_stopGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorNameDict, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parentBlock);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_controlDependencies, 0);
  objc_storeStrong((id *)&self->_outputTensors, 0);
  objc_storeStrong((id *)&self->_inputTensors, 0);

  objc_destroyWeak((id *)&self->_graph);
}

@end