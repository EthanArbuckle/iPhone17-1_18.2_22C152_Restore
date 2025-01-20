@interface MPSGraphStitchedOp
- (MPSGraphStitchedOp)initWithGraph:(id)a3 withBlock:(id)a4 inputTensors:(id)a5 controlDependencies:(id)a6 name:(id)a7;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
- (void)recurseOperation:(id)a3 builder:(void *)a4 symbolTable:(void *)a5 tensorToValueMap:(void *)a6 operationsRecursed:(id)a7;
@end

@implementation MPSGraphStitchedOp

- (void)recurseOperation:(id)a3 builder:(void *)a4 symbolTable:(void *)a5 tensorToValueMap:(void *)a6 operationsRecursed:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if (!v11) {
    goto LABEL_80;
  }
  if (![(NSArray *)self->_opsAddedInStitchedRegion containsObject:v11]) {
    goto LABEL_80;
  }
  v13 = [v12 objectForKeyedSubscript:v11];

  if (v13) {
    goto LABEL_80;
  }
  [v12 setObject:v11 forKey:v11];
  for (unint64_t i = 0; ; ++i)
  {
    v15 = [v11 controlDependencies];
    unint64_t v16 = [v15 count];

    if (i >= v16) {
      break;
    }
    v17 = [v11 controlDependencies];
    v18 = [v17 objectAtIndexedSubscript:i];

    [(MPSGraphStitchedOp *)self recurseOperation:v18 builder:a4 symbolTable:a5 tensorToValueMap:a6 operationsRecursed:v12];
  }
  id v72 = v12;
  v19 = [v11 inputTensors];
  unint64_t v20 = 0;
  v21 = (char *)a6 + 8;
  v76 = (uint64_t **)a6;
  while (v20 < [v19 count])
  {
    v22 = [v19 objectAtIndexedSubscript:v20];
    v23 = v22;
    v24 = *(uint64_t **)v21;
    if (!*(void *)v21) {
      goto LABEL_21;
    }
    v25 = (char *)a6 + 8;
    do
    {
      unint64_t v26 = v24[4];
      BOOL v27 = v26 >= (unint64_t)v22;
      if (v26 >= (unint64_t)v22) {
        v28 = (uint64_t **)v24;
      }
      else {
        v28 = (uint64_t **)(v24 + 1);
      }
      if (v27) {
        v25 = (char *)v24;
      }
      v24 = *v28;
    }
    while (*v28);
    if (v25 == v21 || (unint64_t)v22 < *((void *)v25 + 4))
    {
LABEL_21:

      v29 = [v19 objectAtIndexedSubscript:v20];
      v23 = [v29 operation];

      if (!v23) {
        __assert_rtn("-[MPSGraphStitchedOp recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:]", "MPSGraphStitchedOps.mm", 181, "currentOp");
      }
      [(MPSGraphStitchedOp *)self recurseOperation:v23 builder:a4 symbolTable:a5 tensorToValueMap:a6 operationsRecursed:v12];
    }

    ++v20;
  }
  unint64_t v30 = 0;
  __p = 0;
  v78 = 0;
  v79 = 0;
  v75 = v11;
  v73 = a4;
  while (v30 < [v19 count])
  {
    v32 = [v19 objectAtIndexedSubscript:v30];
    v33 = *(uint64_t **)v21;
    if (!*(void *)v21) {
      goto LABEL_38;
    }
    v34 = v21;
    do
    {
      unint64_t v35 = v33[4];
      BOOL v36 = v35 >= (unint64_t)v32;
      if (v35 >= (unint64_t)v32) {
        v37 = (uint64_t **)v33;
      }
      else {
        v37 = (uint64_t **)(v33 + 1);
      }
      if (v36) {
        v34 = (char *)v33;
      }
      v33 = *v37;
    }
    while (*v37);
    if (v34 == v21 || (unint64_t)v32 < *((void *)v34 + 4)) {
LABEL_38:
    }
      v34 = v21;
    uint64_t v38 = *((void *)v34 + 5);

    v39 = v78;
    if (v78 < v79)
    {
      *(void *)v78 = v38;
      uint64_t v31 = (uint64_t)(v39 + 8);
      goto LABEL_25;
    }
    v40 = __p;
    int64_t v41 = v78 - (unsigned char *)__p;
    uint64_t v42 = (v78 - (unsigned char *)__p) >> 3;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61) {
      std::vector<long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v44 = v79 - (unsigned char *)__p;
    if ((v79 - (unsigned char *)__p) >> 2 > v43) {
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
      v47 = &v46[8 * v42];
      void *v47 = v38;
      uint64_t v31 = (uint64_t)(v47 + 1);
      int64_t v48 = v39 - v40;
      if (v39 == v40)
      {
LABEL_58:
        __p = v47;
        v79 = &v46[8 * v45];
        id v11 = v75;
        if (!v39) {
          goto LABEL_25;
        }
LABEL_59:
        operator delete(v39);
        goto LABEL_25;
      }
    }
    else
    {
      v46 = 0;
      v47 = (void *)(8 * v42);
      *(void *)(8 * v42) = v38;
      uint64_t v31 = 8 * v42 + 8;
      int64_t v48 = v39 - v40;
      if (v39 == v40) {
        goto LABEL_58;
      }
    }
    unint64_t v49 = v48 - 8;
    if (v49 < 0x58) {
      goto LABEL_87;
    }
    if ((unint64_t)(v39 - v46 - v41) < 0x20) {
      goto LABEL_87;
    }
    uint64_t v50 = (v49 >> 3) + 1;
    uint64_t v51 = 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
    v52 = &v39[-v51];
    v47 = (void *)((char *)v47 - v51);
    v53 = &v46[8 * v42 - 16];
    v54 = (long long *)(v39 - 16);
    uint64_t v55 = v50 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v56 = *v54;
      *(v53 - 1) = *(v54 - 1);
      _OWORD *v53 = v56;
      v53 -= 2;
      v54 -= 2;
      v55 -= 4;
    }
    while (v55);
    v39 = v52;
    if (v50 != (v50 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_87:
      do
      {
        uint64_t v57 = *((void *)v39 - 1);
        v39 -= 8;
        *--v47 = v57;
      }
      while (v39 != v40);
    }
    v39 = __p;
    __p = v47;
    v79 = &v46[8 * v45];
    id v11 = v75;
    if (v39) {
      goto LABEL_59;
    }
LABEL_25:
    v78 = (char *)v31;
    ++v30;
    a4 = v73;
  }
  v58 = [v11 name];
  uint64_t v59 = [v11 makeMLIROpWithBuilder:a4 symbolTable:a5 inputValues:&__p opInitialization:0 name:v58];

  uint64_t v60 = *(unsigned int *)(v59 + 36);
  if ((int)v60 >= 1)
  {
    for (unint64_t j = 0; j != v60; ++j)
    {
      if (j >= *(unsigned int *)(v59 + 36)) {
        __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
      }
      if (j <= 5) {
        uint64_t v63 = v59 + 16 * ~j;
      }
      else {
        uint64_t v63 = v59 - 96 - 24 * (j - 5);
      }
      v64 = [v75 outputTensors];
      unint64_t v65 = [v64 objectAtIndexedSubscript:j];
      v62 = (void *)v65;
      v66 = *(uint64_t **)v21;
      v67 = (uint64_t **)v21;
      v68 = (uint64_t **)v21;
      if (*(void *)v21)
      {
        while (1)
        {
          while (1)
          {
            v68 = (uint64_t **)v66;
            unint64_t v69 = v66[4];
            if (v65 >= v69) {
              break;
            }
            v66 = *v68;
            v67 = v68;
            if (!*v68) {
              goto LABEL_75;
            }
          }
          if (v69 >= v65) {
            break;
          }
          v66 = v68[1];
          if (!v66)
          {
            v67 = v68 + 1;
            goto LABEL_75;
          }
        }
      }
      else
      {
LABEL_75:
        v70 = (uint64_t *)operator new(0x30uLL);
        v70[4] = (uint64_t)v62;
        v70[5] = v63;
        uint64_t *v70 = 0;
        v70[1] = 0;
        v70[2] = (uint64_t)v68;
        *v67 = v70;
        v71 = (uint64_t *)**v76;
        if (v71)
        {
          *v76 = v71;
          v70 = *v67;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v76[1], v70);
        v62 = 0;
        v76[2] = (uint64_t *)((char *)v76[2] + 1);
      }
    }
  }
  if (__p)
  {
    v78 = (char *)__p;
    operator delete(__p);
  }

  id v11 = v75;
  id v12 = v72;
LABEL_80:
}

- (MPSGraphStitchedOp)initWithGraph:(id)a3 withBlock:(id)a4 inputTensors:(id)a5 controlDependencies:(id)a6 name:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  unint64_t v16 = (void *)MEMORY[0x1852FE7D0](a4);
  id stitchingBlock = self->_stitchingBlock;
  self->_id stitchingBlock = v16;

  v20.receiver = self;
  v20.super_class = (Class)MPSGraphStitchedOp;
  v18 = [(MPSGraphOperation *)&v20 initWithGraph:v15 inputTensors:v14 controlDependencies:v13 name:v12];

  return v18;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  BOOL v7 = a6;
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v84 = a7;
  mpsFileLoc("-[MPSGraphStitchedOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphStitchedOps.mm", __p);
  id v89 = v84;
  __int16 v118 = 260;
  p_data = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&p_data);
  uint64_t v12 = mlir::FileLineColLoc::get(StringAttr, 0x33u, 0);
  if (!v12) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v89)
  {
    HIBYTE(v92) = 13;
    qmemcpy(&__dst, "mpsx.stitched", 13);
    v17 = &__dst.i8[13];
    goto LABEL_13;
  }
  id v13 = (const char *)[v89 UTF8String];
  size_t v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v18 = v14 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v15;
    unint64_t v92 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v92) = v14;
    p_dst = &__dst;
    if (!v14) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  __int8 *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v113);
  objc_super v20 = (std::string *)v113.__r_.__value_.__r.__words[0];
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    objc_super v20 = &v113;
  }
  char v21 = 1;
  HIBYTE(v118) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    p_data = (void **)&v20->__r_.__value_.__l.__data_;
    char v21 = 3;
  }
  LOBYTE(v118) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&p_data);
  uint64_t v86 = mlir::NameLoc::get(v22, v12);
  if (!v86) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v113.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v92) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SHIBYTE(v92) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v107 < 0) {
    operator delete(__p[0]);
  }
  v105 = 0;
  uint64_t F32Type = mlir::Builder::getF32Type((mlir::Float32Type **)a3, v23);
  uint64_t v104 = mlir::UnrankedTensorType::get(F32Type);
  v25 = mlir::OpBuilder::create<mlir::mpsx::StitchedOp,mlir::UnrankedTensorType &>((mlir::OpBuilder *)a3, v86, &v104);
  if (!*((_DWORD *)v25 + 9))
  {
    v75 = "resultNumber < getNumResults() && \"Result number is out of range for operation\"";
    int v76 = 984;
    v77 = "Operation.h";
    v78 = "getOpResultImpl";
    goto LABEL_76;
  }
  uint64_t v26 = *(void *)(*((void *)v25 - 1) & 0xFFFFFFFFFFFFFFF8);
  if (!v26)
  {
    v75 = "abstractType && \"Malformed type storage object.\"";
    int v76 = 160;
    v77 = "TypeSupport.h";
    v78 = "getAbstractType";
    goto LABEL_76;
  }
  BOOL v27 = *(void **)(v26 + 136);
  if (v27 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v27 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v75 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v76 = 566;
    v77 = "Casting.h";
    v78 = "cast";
LABEL_76:
    __assert_rtn(v78, v77, v76, v75);
  }
  v105 = (char *)v25 - 16;
  unint64_t DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v105);
  if (self->super._name) {
    name = self->super._name;
  }
  else {
    name = (NSString *)v89;
  }
  MPSSymbolTable::insertOp((MPSSymbolTable *)a4, DefiningOp, name, (uint64_t)&v102);
  uint64_t v30 = mlir::Value::getDefiningOp((mlir::Value *)&v105);
  if (!v30) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  uint64_t v101 = llvm::DefaultDoCastIfPossible<mlir::mpsx::StitchedOp,mlir::Operation *,llvm::CastInfo<mlir::mpsx::StitchedOp,mlir::Operation *,void>>::doCastIfPossible(v30);
  unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v101);
  mlir::ValueRange::ValueRange(v114, 0, 0);
  Block = mlir::OpBuilder::createBlock(a3, Body, 0, v114[0], v114[1], 0, 0);
  *((void *)a3 + 2) = Block;
  *((void *)a3 + 3) = Block + 2;
  if (v7)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->super._graph);
    v85 = (void *)[WeakRetained[10] copyWithZone:0];

    (*((void (**)(void))self->_stitchingBlock + 2))();
    v34 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
    finalOutputTensorForStitchedRegion = self->_finalOutputTensorForStitchedRegion;
    self->_finalOutputTensorForStitchedRegion = v34;

    BOOL v36 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
    id v88 = v36[10];

    v83 = [MEMORY[0x1E4F1CA48] arrayWithArray:v88];
    [v83 removeObjectsInArray:v85];
    v37 = [MEMORY[0x1E4F1C978] arrayWithArray:v83];
    opsAddedInStitchedRegion = self->_opsAddedInStitchedRegion;
    self->_opsAddedInStitchedRegion = v37;

    v39 = [MEMORY[0x1E4F1CA80] set];
    for (unint64_t i = 0; i < [(NSArray *)self->_opsAddedInStitchedRegion count]; ++i)
    {
      int64_t v41 = [(NSArray *)self->_opsAddedInStitchedRegion objectAtIndexedSubscript:i];
      uint64_t v42 = [v41 inputTensors];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke;
      v99[3] = &unk_1E4FC1580;
      v99[4] = self;
      id v100 = v39;
      [v42 enumerateObjectsUsingBlock:v99];
    }
    v61 = [v39 allObjects];
    inputTensors = self->super._inputTensors;
    self->super._inputTensors = v61;

    __dst.i64[0] = 0;
    __dst.i64[1] = (uint64_t)&__dst;
    unint64_t v92 = 0x4812000000;
    v93 = __Block_byref_object_copy__3;
    v94 = __Block_byref_object_dispose__3;
    v95 = "";
    v97 = 0;
    uint64_t v98 = 0;
    v96 = 0;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke_77;
    v90[3] = &unk_1E4FC1648;
    v90[4] = &__dst;
    [v39 enumerateObjectsUsingBlock:v90];
    v63.impl = (ValueImpl *)[(MPSGraphTensor *)self->_finalOutputTensorForStitchedRegion value];
    uint64_t v108 = v86;
    Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v108);
    uint64_t v65 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.stitched_return", (const unsigned __int8 *)0x14, Context);
    if (!v66)
    {
      __int16 v112 = 1283;
      v111[2] = (uint64_t)"mpsx.stitched_return";
      v111[3] = 20;
             " by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-w"
             "ith-dialects-management";
      __int16 v110 = 259;
      llvm::operator+(v111, (uint64_t *)&v109, (uint64_t)&v113);
      llvm::report_fatal_error((llvm::Twine *)&v113, 1);
    }
    mlir::OperationState::OperationState(&p_data, v86, v65);
    mlir::pdl_interp::EraseOp::build((uint64_t)a3, (uint64_t)&p_data, (uint64_t)v63.impl);
    v67 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)&p_data);
    if (v67)
    {
      if (llvm::DefaultDoCastIfPossible<mlir::mpsx::ReturnStitchedOp,mlir::Operation *,llvm::CastInfo<mlir::mpsx::ReturnStitchedOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v67))
      {
        mlir::OperationState::~OperationState((mlir::OperationState *)&p_data);
        v68.impl = (ValueImpl *)[(MPSGraphTensor *)self->_finalOutputTensorForStitchedRegion value];
        *((void *)v105 + 1) = *((void *)v68.impl + 1) & 0xFFFFFFFFFFFFFFF8 | *((void *)v105 + 1) & 7;
        _Block_object_dispose(&__dst, 8);
        if (v96)
        {
          v97 = v96;
          operator delete(v96);
        }

        goto LABEL_66;
      }
      v79 = "result && \"builder didn't return the right type\"";
      int v80 = 497;
      v81 = "Builders.h";
      v82 = "create";
    }
    else
    {
      v79 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
      int v80 = 662;
      v81 = "Casting.h";
      v82 = "dyn_cast";
    }
    __assert_rtn(v82, v81, v80, v79);
  }
  v85 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v43 = 0;
  v116 = 0;
  uint64_t v117 = 0;
  p_data = (void **)&v116;
  while (v43 < [(NSArray *)self->super._inputTensors count])
  {
    unint64_t v44 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:v43];
    unint64_t v45 = (void *)v44;
    if (v43 >= (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3) {
      std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v46 = *(void *)(*(void *)a5 + 8 * v43);
    v47 = v116;
    int64_t v48 = &v116;
    unint64_t v49 = &v116;
    if (v116)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v49 = (uint64_t **)v47;
          unint64_t v50 = v47[4];
          if (v44 >= v50) {
            break;
          }
          v47 = *v49;
          int64_t v48 = v49;
          if (!*v49) {
            goto LABEL_44;
          }
        }
        if (v50 >= v44) {
          break;
        }
        v47 = v49[1];
        if (!v47)
        {
          int64_t v48 = v49 + 1;
          goto LABEL_44;
        }
      }
    }
    else
    {
LABEL_44:
      uint64_t v51 = (uint64_t *)operator new(0x30uLL);
      v51[4] = (uint64_t)v45;
      v51[5] = v46;
      *uint64_t v51 = 0;
      v51[1] = 0;
      v51[2] = (uint64_t)v49;
      *int64_t v48 = v51;
      if (*p_data)
      {
        p_data = (void **)*p_data;
        uint64_t v51 = *v48;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v116, v51);
      unint64_t v45 = 0;
      ++v117;
    }

    ++v43;
  }
  v52 = [(MPSGraphTensor *)self->_finalOutputTensorForStitchedRegion operation];
  [(MPSGraphStitchedOp *)self recurseOperation:v52 builder:a3 symbolTable:a4 tensorToValueMap:&p_data operationsRecursed:v85];

  v53 = [(MPSGraphTensor *)self->_finalOutputTensorForStitchedRegion operation];
  v54 = [v53 outputTensors];
  uint64_t v55 = [v54 objectAtIndexedSubscript:0];
  long long v56 = v116;
  if (!v116) {
    goto LABEL_58;
  }
  uint64_t v57 = &v116;
  do
  {
    v58 = v56;
    uint64_t v59 = v57;
    unint64_t v60 = v56[4];
    if (v60 >= (unint64_t)v55) {
      uint64_t v57 = (uint64_t **)v56;
    }
    else {
      ++v56;
    }
    long long v56 = (uint64_t *)*v56;
  }
  while (v56);
  if (v57 == &v116) {
    goto LABEL_58;
  }
  if (v60 < (unint64_t)v55) {
    v58 = (uint64_t *)v59;
  }
  if ((unint64_t)v55 < v58[4]) {
LABEL_58:
  }
    uint64_t v57 = &v116;
  __dst.i64[0] = (uint64_t)v57[5];

  mlir::OpBuilder::create<mlir::mpsx::ReturnStitchedOp,mlir::Value &>((mlir::OpBuilder *)a3, v86, __dst.i64);
  std::__tree<MPSGraphTensor * {__strong}>::destroy((uint64_t)&p_data, v116);
LABEL_66:

  unint64_t v69 = (mlir::GenericProgramPoint *)mlir::Value::getDefiningOp((mlir::Value *)&v105);
  uint64_t v70 = *((void *)v69 + 2);
  mlir::GenericProgramPoint::~GenericProgramPoint(v69);
  uint64_t v72 = *(void *)(v71 + 8);
  *((void *)a3 + 2) = v70;
  *((void *)a3 + 3) = v72;
  v73 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v105);
  if (v103 < 0) {
    operator delete(v102);
  }

  return v73;
}

void __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 104);
  id v6 = v3;
  v5 = [v3 operation];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v28 = v3;
  uint64_t v5 = [v3 value];
  uint64_t v6 = v5;
  v8 = (uint64_t *)v4[7];
  unint64_t v7 = v4[8];
  if ((unint64_t)v8 < v7)
  {
    uint64_t *v8 = v5;
    uint64_t v9 = (uint64_t)(v8 + 1);
    goto LABEL_14;
  }
  v10 = (char *)v4[6];
  uint64_t v11 = ((char *)v8 - v10) >> 3;
  unint64_t v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) >> 61) {
    std::vector<long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = v7 - (void)v10;
  if (v13 >> 2 > v12) {
    unint64_t v12 = v13 >> 2;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v14 = v12;
  }
  if (v14)
  {
    if (v14 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    size_t v15 = (char *)operator new(8 * v14);
    unint64_t v16 = (uint64_t *)&v15[8 * v11];
    v17 = &v15[8 * v14];
    *unint64_t v16 = v6;
    uint64_t v9 = (uint64_t)(v16 + 1);
    uint64_t v18 = (char *)((char *)v8 - v10);
    if (v8 == (uint64_t *)v10)
    {
LABEL_12:
      v4[6] = v16;
      v4[7] = v9;
      v4[8] = v17;
      if (!v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    size_t v15 = 0;
    unint64_t v16 = (uint64_t *)(8 * v11);
    v17 = 0;
    *(void *)(8 * v11) = v6;
    uint64_t v9 = 8 * v11 + 8;
    uint64_t v18 = (char *)((char *)v8 - v10);
    if (v8 == (uint64_t *)v10) {
      goto LABEL_12;
    }
  }
  unint64_t v19 = (unint64_t)(v18 - 8);
  if (v19 < 0x58) {
    goto LABEL_30;
  }
  if ((unint64_t)(v10 - v15) < 0x20) {
    goto LABEL_30;
  }
  uint64_t v20 = (v19 >> 3) + 1;
  uint64_t v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
  uint64_t v22 = &v8[v21 / 0xFFFFFFFFFFFFFFF8];
  unint64_t v16 = (uint64_t *)((char *)v16 - v21);
  v23 = &v15[8 * v11 - 16];
  v24 = v8 - 2;
  uint64_t v25 = v20 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v26 = *(_OWORD *)v24;
    *((_OWORD *)v23 - 1) = *((_OWORD *)v24 - 1);
    *(_OWORD *)v23 = v26;
    v23 -= 32;
    v24 -= 4;
    v25 -= 4;
  }
  while (v25);
  v8 = v22;
  if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_30:
    do
    {
      uint64_t v27 = *--v8;
      *--unint64_t v16 = v27;
    }
    while (v8 != (uint64_t *)v10);
  }
  v8 = (uint64_t *)v4[6];
  v4[6] = v16;
  v4[7] = v9;
  v4[8] = v17;
  if (v8) {
LABEL_13:
  }
    operator delete(v8);
LABEL_14:
  v4[7] = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opsAddedInStitchedRegion, 0);
  objc_storeStrong((id *)&self->_finalOutputTensorForStitchedRegion, 0);

  objc_storeStrong(&self->_stitchingBlock, 0);
}

@end