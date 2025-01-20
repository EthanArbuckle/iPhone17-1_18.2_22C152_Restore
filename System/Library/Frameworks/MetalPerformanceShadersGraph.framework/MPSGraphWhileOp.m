@interface MPSGraphWhileOp
- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5;
- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4;
- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4;
- (MPSGraphWhileOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 beforeBlock:(id)a6 afterBlock:(id)a7 name:(id)a8;
- (id).cxx_construct;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
- (void)partialDerivateForCFOpWithAutodiff:(void *)a3;
@end

@implementation MPSGraphWhileOp

- (MPSGraphWhileOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 beforeBlock:(id)a6 afterBlock:(id)a7 name:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void *)MEMORY[0x1852FE7D0](v17);
  id beforeBlock = self->_beforeBlock;
  self->_id beforeBlock = v20;

  v22 = (void *)MEMORY[0x1852FE7D0](v18);
  id afterBlock = self->_afterBlock;
  self->_id afterBlock = v22;

  predicateTensor = self->_predicateTensor;
  self->_predicateTensor = 0;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AutodiffOpData *))(*(void *)value + 8))(value);
  }
  itersCountTensor = self->_itersCountTensor;
  self->_itersCountTensor = 0;

  v27 = objc_alloc_init(MPSGraphRegion);
  v30.receiver = self;
  v30.super_class = (Class)MPSGraphWhileOp;
  v28 = [(MPSGraphOperation *)&v30 initWithGraph:v14 inputTensors:v15 controlDependencies:v16 region:v27 name:v19];

  return v28;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  mpsFileLoc("-[MPSGraphWhileOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  id v139 = v10;
  LOWORD(v167) = 260;
  v166[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v166);
  uint64_t v12 = mlir::FileLineColLoc::get(StringAttr, 0x938u, 0);
  if (!v12) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v139)
  {
    BYTE7(v159) = 9;
    __dst.i8[8] = 101;
    __dst.i64[0] = *(void *)"scf.while";
    id v17 = &__dst.i8[9];
    goto LABEL_13;
  }
  v13 = (const char *)[v139 UTF8String];
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
    *(void *)&long long v159 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    BYTE7(v159) = v14;
    p_dst = &__dst;
    if (!v14) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  id v17 = &p_dst->i8[v15];
LABEL_13:
  *id v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v148);
  v20 = (std::string *)v148.__r_.__value_.__r.__words[0];
  if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v20 = &v148;
  }
  char v21 = 1;
  BYTE1(v167) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v166[0] = v20;
    char v21 = 3;
  }
  LOBYTE(v167) = v21;
  uint64_t v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v166);
  uint64_t v23 = mlir::NameLoc::get(v22, v12);
  unint64_t v24 = v23;
  if (!v23) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v148.__r_.__value_.__l.__data_);
    unint64_t v137 = v24;
    if ((SBYTE7(v159) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v137 = v23;
    if ((SBYTE7(v159) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v155 < 0) {
    operator delete(__p[0]);
  }
  long long v129 = *((_OWORD *)a3 + 1);
  v130 = (char *)a3 + 16;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  id v128 = (id)WeakRetained[22];
  id v127 = v128;

  v26 = [(MPSGraphOperation *)self inputTensors];
  getTypesFromTensors(v26, (char **)&v152);

  memset(v166, 0, sizeof(v166));
  v167 = &v167;
  v168 = (uint64_t *)&v167;
  uint64_t v170 = 0;
  uint64_t v171 = 0;
  uint64_t v169 = 0;
  id obj = [(MPSGraphRegion *)self->super._region appendNewBlock];
  id v142 = (id)objc_opt_new();
  v27 = v152;
  if (v153 != v152)
  {
    unint64_t v28 = 0;
    do
    {
      uint64_t v29 = v27[v28];
      __dst.i64[0] = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerforman"
                              "ceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm";
      LOWORD(v160) = 259;
      uint64_t v30 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&__dst);
      uint64_t v31 = mlir::FileLineColLoc::get(v30, 0x94Fu, 0);
      if (!v31) {
        __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
      }
      mlir::Block::addArgument(v166, v29, v31);
      uint64_t v32 = *(void *)(v169 + 8 * v28);
      v33 = [MPSGraphTensor alloc];
      id v34 = objc_loadWeakRetained((id *)&self->super._graph);
      id v35 = [(MPSGraphTensor *)v33 initTensorWithOperation:self value:v32 graph:v34 parentBlock:obj name:0];

      [v142 addObject:v35];
      ++v28;
      v27 = v152;
    }
    while (v28 < (v153 - (unsigned char *)v152) >> 3);
  }
  *((void *)a3 + 2) = v166;
  *((void *)a3 + 3) = &v167;
  v36 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v36 + 22, obj);

  v133 = [MEMORY[0x1E4F1CA48] array];
  (*((void (**)(void))self->_beforeBlock + 2))();
  v37 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  predicateTensor = self->_predicateTensor;
  self->_predicateTensor = v37;

  id beforeBlock = self->_beforeBlock;
  self->_id beforeBlock = 0;

  v40 = [MEMORY[0x1E4F1C978] arrayWithArray:v133];
  beforeResult = self->_beforeResult;
  self->_beforeResult = v40;

  if (!self->_predicateTensor && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  id v42 = objc_loadWeakRetained((id *)&self->super._graph);
  v134 = [v42 castTensor:self->_predicateTensor toType:2147483656 name:@"if_cast"];

  id v43 = objc_loadWeakRetained((id *)&self->super._graph);
  v135 = [v43 reshapeTensor:v134 withShape:MEMORY[0x1E4F1CBF0] name:@"whilePredicate/reshape"];

  v165 = v135;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:1];
  v138 = (void *)[v44 mutableCopy];

  [v138 addObjectsFromArray:self->_beforeResult];
  v45 = [MPSGraphConditionOp alloc];
  id v46 = objc_loadWeakRetained((id *)&self->super._graph);
  v136 = [(MPSGraphOperation *)v45 initWithGraph:v46 inputTensors:v138 controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

  v47 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  [v47[22] addTerminatorOperation:v136];

  getTypesFromTensors(self->_beforeResult, (char **)&v150);
  int8x16_t __dst = 0u;
  long long v159 = 0u;
  v160 = &v160;
  v161 = (int8x16_t *)&v160;
  uint64_t v163 = 0;
  uint64_t v164 = 0;
  uint64_t v162 = 0;
  id v140 = [(MPSGraphRegion *)self->super._region appendNewBlock];
  v48 = objc_opt_new();
  v49 = v150;
  if (v151 != v150)
  {
    unint64_t v50 = 0;
    do
    {
      uint64_t v51 = v49[v50];
      v148.__r_.__value_.__r.__words[0] = (std::string::size_type)"/Library/Caches/com.apple.xbs/Sources/MetalPerformance"
                                                                  "ShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Cor"
                                                                  "e/Files/Operations/MPSGraphControlFlowOps.mm";
      __int16 v149 = 259;
      uint64_t v52 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v148);
      uint64_t v53 = mlir::FileLineColLoc::get(v52, 0x97Du, 0);
      if (!v53) {
        __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
      }
      mlir::Block::addArgument(&__dst, v51, v53);
      uint64_t v54 = *(void *)(v162 + 8 * v50);
      v55 = [MPSGraphTensor alloc];
      id v56 = objc_loadWeakRetained((id *)&self->super._graph);
      id v57 = [(MPSGraphTensor *)v55 initTensorWithOperation:self value:v54 graph:v56 parentBlock:v140 name:0];

      [v48 addObject:v57];
      ++v50;
      v49 = v150;
    }
    while (v50 < (v151 - (unsigned char *)v150) >> 3);
  }
  *((void *)a3 + 2) = &__dst;
  *((void *)a3 + 3) = &v160;
  v58 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v58 + 22, v140);

  (*((void (**)(void))self->_afterBlock + 2))();
  v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
  afterResult = self->_afterResult;
  self->_afterResult = v59;

  id afterBlock = self->_afterBlock;
  self->_id afterBlock = 0;

  v62 = [MPSGraphYieldOp alloc];
  id v63 = objc_loadWeakRetained((id *)&self->super._graph);
  v132 = [(MPSGraphOperation *)v62 initWithGraph:v63 inputTensors:self->_afterResult controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

  v64 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  [v64[22] addTerminatorOperation:v132];

  if ((void)v129)
  {
    _OWORD *v130 = v129;
  }
  else
  {
    *(void *)v130 = 0;
    *((void *)a3 + 3) = 0;
  }
  v65 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v65 + 22, v128);

  v147 = (mlir::GenericProgramPoint *)mlir::OpBuilder::create<mlir::scf::WhileOp,std::vector<mlir::Type> &,std::vector<mlir::Value> &>((mlir::OpBuilder *)a3, v137, (uint64_t *)&v150, (uint64_t *)a5);
  memset(&v148, 0, sizeof(v148));
  uint64_t v66 = v153 - (unsigned char *)v152;
  if (v153 == v152)
  {
    std::string::size_type v69 = 0;
    v68 = 0;
  }
  else
  {
    if (v66 < 0) {
      std::vector<long>::__throw_length_error[abi:ne180100]();
    }
    v67 = (int64x2_t *)operator new(v153 - (unsigned char *)v152);
    v68 = v67;
    std::string::size_type v69 = (std::string::size_type)v67 + 8 * (v66 >> 3);
    v148.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
    v148.__r_.__value_.__r.__words[2] = v69;
    v70 = (unint64_t *)v67;
    unint64_t v71 = v137;
    if ((unint64_t)(v66 - 8) < 0x18) {
      goto LABEL_122;
    }
    unint64_t v72 = ((unint64_t)(v66 - 8) >> 3) + 1;
    v70 = (unint64_t *)v67 + (v72 & 0x3FFFFFFFFFFFFFFCLL);
    int64x2_t v73 = vdupq_n_s64(v137);
    v74 = v67 + 1;
    uint64_t v75 = v72 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v74[-1] = v73;
      int64x2_t *v74 = v73;
      v74 += 2;
      v75 -= 4;
    }
    while (v75);
    unint64_t v71 = v137;
    if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_122:
      do
        *v70++ = v71;
      while (v70 != (unint64_t *)v69);
    }
    v148.__r_.__value_.__l.__size_ = (std::string::size_type)v67 + 8 * (v66 >> 3);
  }
  unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v147);
  mlir::ValueRange::ValueRange(v157, (uint64_t)v152, (v153 - (unsigned char *)v152) >> 3);
  Block = mlir::OpBuilder::createBlock(a3, Body, 0, v157[0], v157[1], (uint64_t)v68, (uint64_t)(v69 - (void)v68) >> 3);
  v78 = Block;
  if (v167 != &v167 && Block != v166)
  {
    v79 = Block + 4;
    v80 = v168;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList((uint64_t)(Block + 4), (uint64_t)&v167, (uint64_t)v168, (uint64_t)&v167);
    if (v80 != (uint64_t *)&v167)
    {
      if (v80 == v79) {
        __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\"");
      }
      v81 = v167;
      v82 = (void *)*v80;
      v82[1] = &v167;
      v167 = v82;
      uint64_t v83 = *v79;
      v81[1] = v79;
      uint64_t *v80 = v83;
      *(void *)(v83 + 8) = v80;
      uint64_t *v79 = (uint64_t)v81;
    }
  }
  if (v153 != v152)
  {
    unint64_t v84 = 0;
    do
    {
      v85 = *(uint64_t **)(v169 + 8 * v84);
      v86 = *(uint64_t **)(v78[6] + 8 * v84);
      if (v86) {
        BOOL v87 = v85 == v86;
      }
      else {
        BOOL v87 = 0;
      }
      if (v87) {
        __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\"");
      }
      v88 = (void *)*v85;
      if (*v85)
      {
        do
        {
          v89 = (void *)v88[1];
          if (v89)
          {
            void *v89 = *v88;
            if (*v88) {
              *(void *)(*v88 + 8) = v88[1];
            }
          }
          v88[3] = v86;
          v88[1] = v86;
          uint64_t v90 = *v86;
          void *v88 = *v86;
          if (v90) {
            *(void *)(v90 + 8) = v88;
          }
          uint64_t *v86 = (uint64_t)v88;
          v88 = (void *)*v85;
        }
        while (*v85);
        v86 = *(uint64_t **)(v78[6] + 8 * v84);
      }
      v91 = [v142 objectAtIndexedSubscript:v84];
      v91[1] = v86;

      ++v84;
    }
    while (v84 < (v153 - (unsigned char *)v152) >> 3);
  }
  v145 = 0;
  v146 = 0;
  v144 = 0;
  uint64_t v92 = v151 - (unsigned char *)v150;
  if (v151 == v150)
  {
    v95 = 0;
    v94 = 0;
  }
  else
  {
    if (v92 < 0) {
      std::vector<long>::__throw_length_error[abi:ne180100]();
    }
    v93 = (int64x2_t *)operator new(v151 - (unsigned char *)v150);
    v94 = v93;
    v95 = &v93->i8[8 * (v92 >> 3)];
    v144 = v93;
    v146 = v95;
    v96 = (unint64_t *)v93;
    unint64_t v97 = v137;
    if ((unint64_t)(v92 - 8) < 0x18) {
      goto LABEL_123;
    }
    unint64_t v98 = ((unint64_t)(v92 - 8) >> 3) + 1;
    v96 = (unint64_t *)v93 + (v98 & 0x3FFFFFFFFFFFFFFCLL);
    int64x2_t v99 = vdupq_n_s64(v137);
    v100 = v93 + 1;
    uint64_t v101 = v98 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v100[-1] = v99;
      int64x2_t *v100 = v99;
      v100 += 2;
      v101 -= 4;
    }
    while (v101);
    unint64_t v97 = v137;
    if (v98 != (v98 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_123:
      do
        *v96++ = v97;
      while (v96 != (unint64_t *)v95);
    }
    v145 = &v93->i8[8 * (v92 >> 3)];
  }
  unint64_t v102 = mlir::scf::WhileOp::getAfter((mlir::scf::WhileOp *)&v147);
  mlir::ValueRange::ValueRange(v156, (uint64_t)v150, (v151 - (unsigned char *)v150) >> 3);
  v103 = (int8x16_t *)mlir::OpBuilder::createBlock(a3, v102, 0, v156[0], v156[1], (uint64_t)v94, (v95 - (char *)v94) >> 3);
  v104 = v103;
  if (v160 != &v160 && v103 != &__dst)
  {
    v105 = v103 + 2;
    v106 = v161;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList((uint64_t)v103[2].i64, (uint64_t)&v160, (uint64_t)v161, (uint64_t)&v160);
    if (v106 != (int8x16_t *)&v160)
    {
      if (v106 == v105) {
        __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\"");
      }
      v107 = v160;
      v108 = (void *)v106->i64[0];
      v108[1] = &v160;
      v160 = v108;
      uint64_t v109 = v105->i64[0];
      v107[1] = v105;
      v106->i64[0] = v109;
      *(void *)(v109 + 8) = v106;
      v105->i64[0] = (uint64_t)v107;
    }
  }
  if (v151 != v150)
  {
    unint64_t v110 = 0;
    do
    {
      v111 = *(uint64_t **)(v162 + 8 * v110);
      v112 = *(uint64_t **)(v104[3].i64[0] + 8 * v110);
      if (v112) {
        BOOL v113 = v111 == v112;
      }
      else {
        BOOL v113 = 0;
      }
      if (v113) {
        __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\"");
      }
      v114 = (void *)*v111;
      if (*v111)
      {
        do
        {
          v115 = (void *)v114[1];
          if (v115)
          {
            void *v115 = *v114;
            if (*v114) {
              *(void *)(*v114 + 8) = v114[1];
            }
          }
          v114[3] = v112;
          v114[1] = v112;
          uint64_t v116 = *v112;
          void *v114 = *v112;
          if (v116) {
            *(void *)(v116 + 8) = v114;
          }
          uint64_t *v112 = (uint64_t)v114;
          v114 = (void *)*v111;
        }
        while (*v111);
        v112 = *(uint64_t **)(v104[3].i64[0] + 8 * v110);
      }
      v117 = [v48 objectAtIndexedSubscript:v110];
      v117[1] = v112;

      ++v110;
    }
    while (v110 < (v151 - (unsigned char *)v150) >> 3);
  }
  uint64_t Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v147);
  if (!v119) {
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\"");
  }
  uint64_t NextResultAtOffset = mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  objc_storeStrong((id *)&self->_beforeBlockArguments, v142);
  objc_storeStrong((id *)&self->_afterBlockArguments, v48);
  v120 = [(NSMutableArray *)self->super._region->_blocks objectAtIndexedSubscript:0];
  v120[3] = v78;

  v121 = [(NSMutableArray *)self->super._region->_blocks objectAtIndexedSubscript:1];
  v121[3] = v104;

  uint64_t v122 = *((void *)v147 + 2);
  mlir::GenericProgramPoint::~GenericProgramPoint(v147);
  uint64_t v124 = *(void *)(v123 + 8);
  *((void *)a3 + 2) = v122;
  *((void *)a3 + 3) = v124;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&NextResultAtOffset);
  if (v94) {
    operator delete(v94);
  }
  if (v68) {
    operator delete(v68);
  }

  mlir::Block::~Block((mlir::Block *)&__dst);
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }

  mlir::Block::~Block((mlir::Block *)v166);
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }

  return DefiningOp;
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5
{
  return recurseForUsesOnEscaped((Autodiff *)a5, (MPSGraphBlock *)a3, (MPSGraphTensor *)a4);
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4
{
  id v6 = a3;
  uint64_t OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(uint64_t, void *, id))(*(void *)OpData + 24))(OpData, a4, v6);

  return (char)a4;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4
{
  id v6 = a3;
  uint64_t OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(uint64_t, void *, id))(*(void *)OpData + 32))(OpData, a4, v6);

  return (char)a4;
}

- (void)partialDerivateForCFOpWithAutodiff:(void *)a3
{
  uint64_t OpData = (AutodiffOpData *)getOpData(&self->super);

  AutodiffOpData::createPartialDerivatives(OpData, (Autodiff *)a3);
}

- (void).cxx_destruct
{
  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AutodiffOpData *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_storeStrong((id *)&self->_itersCountTensor, 0);
  objc_storeStrong((id *)&self->_predicateTensor, 0);
  objc_storeStrong((id *)&self->_afterBlockArguments, 0);
  objc_storeStrong((id *)&self->_beforeBlockArguments, 0);
  objc_storeStrong((id *)&self->_afterResult, 0);
  objc_storeStrong((id *)&self->_beforeResult, 0);
  objc_storeStrong((id *)&self->_initInputTensors, 0);
  objc_storeStrong(&self->_afterBlock, 0);

  objc_storeStrong(&self->_beforeBlock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  return self;
}

@end