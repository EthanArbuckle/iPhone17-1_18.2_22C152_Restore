@interface MPSGraphIfElseOp
- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5;
- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4;
- (MPSGraphIfElseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 trueBlock:(id)a6 falseBlock:(id)a7 name:(id)a8;
- (id).cxx_construct;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
- (void)partialDerivateForCFOpWithAutodiff:(void *)a3;
@end

@implementation MPSGraphIfElseOp

- (MPSGraphIfElseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 trueBlock:(id)a6 falseBlock:(id)a7 name:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void *)MEMORY[0x1852FE7D0](v17);
  id trueBlock = self->_trueBlock;
  self->_id trueBlock = v20;

  v22 = (void *)MEMORY[0x1852FE7D0](v18);
  id falseBlock = self->_falseBlock;
  self->_id falseBlock = v22;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AutodiffOpData *))(*(void *)value + 8))(value);
  }
  v25 = objc_alloc_init(MPSGraphRegion);
  v28.receiver = self;
  v28.super_class = (Class)MPSGraphIfElseOp;
  v26 = [(MPSGraphOperation *)&v28 initWithGraph:v14 inputTensors:v15 controlDependencies:v16 region:v25 name:v19];

  return v26;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  long long v179 = *((_OWORD *)a3 + 1);
  v180 = (char *)a3 + 16;
  location = (id *)&self->super._graph;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  id obj = (id)WeakRetained[22];
  id v178 = obj;

  mpsFileLoc("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  id v13 = v11;
  LOWORD(v215) = 260;
  v214[0] = __p;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v214);
  uint64_t v15 = mlir::FileLineColLoc::get(StringAttr, 0x891u, 0);
  if (!v15) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  v184 = a3;
  if (!v13)
  {
    BYTE7(v208) = 6;
    strcpy(__dst.i8, "scf.if");
    goto LABEL_13;
  }
  id v16 = (const char *)[v13 UTF8String];
  size_t v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v18;
    *(void *)&long long v208 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
    a3 = v184;
  }
  else
  {
    BYTE7(v208) = v17;
    p_dst = &__dst;
    if (!v17) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v16, v18);
LABEL_12:
  p_dst->i8[v18] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v197);
  v22 = (std::string *)v197.__r_.__value_.__r.__words[0];
  if ((v197.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v197;
  }
  char v23 = 1;
  BYTE1(v215) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v214[0] = v22;
    char v23 = 3;
  }
  LOBYTE(v215) = v23;
  uint64_t v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v214);
  uint64_t v25 = mlir::NameLoc::get(v24, v15);
  if (!v25) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  uint64_t v183 = v25;
  if (SHIBYTE(v197.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v197.__r_.__value_.__l.__data_);
    if ((SBYTE7(v208) & 0x80000000) == 0) {
      goto LABEL_20;
    }
  }
  else if ((SBYTE7(v208) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v206 < 0) {
    operator delete(__p[0]);
  }
  if (*((void *)a5 + 1) == *(void *)a5) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  v26 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>((mlir::OpBuilder *)v184, v183, *(void *)a5);
  if (!*((_DWORD *)v26 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v203 = 0;
  uint64_t v204 = (uint64_t)v26 - 16;
  v201 = 0;
  v202 = 0;
  memset(v214, 0, sizeof(v214));
  v215 = &v215;
  v216 = (int8x16_t *)&v215;
  uint64_t v218 = 0;
  uint64_t v219 = 0;
  uint64_t v217 = 0;
  v184[2] = v214;
  v184[3] = &v215;
  uint64_t v27 = [(MPSGraphRegion *)self->super._region appendNewBlock];
  objc_super v28 = objc_loadWeakRetained(location);
  v29 = (void *)v28[22];
  v28[22] = v27;

  (*((void (**)(void))self->_trueBlock + 2))();
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trueuint64_t Results = self->_trueResults;
  self->_trueuint64_t Results = v30;

  id trueBlock = self->_trueBlock;
  self->_id trueBlock = 0;

  v33 = [MPSGraphYieldOp alloc];
  id v34 = objc_loadWeakRetained(location);
  v182 = [(MPSGraphOperation *)v33 initWithGraph:v34 inputTensors:self->_trueResults controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

  v35 = (id *)objc_loadWeakRetained(location);
  [v35[22] addTerminatorOperation:v182];

  if (!self->_falseBlock)
  {
    [(NSArray *)self->_trueResults count];
    if ([(NSArray *)self->_trueResults count])
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
    }
  }
  int8x16_t __dst = 0u;
  long long v208 = 0u;
  v209 = &v209;
  v210 = (int8x16_t *)&v209;
  uint64_t v212 = 0;
  uint64_t v213 = 0;
  uint64_t v211 = 0;
  v188 = self;
  v177 = v13;
  if (self->_falseBlock)
  {
    v184[2] = &__dst;
    v184[3] = &v209;
    uint64_t v36 = [(MPSGraphRegion *)self->super._region appendNewBlock];
    v37 = objc_loadWeakRetained(location);
    v38 = (void *)v37[22];
    v37[22] = v36;

    (*((void (**)(void))self->_falseBlock + 2))();
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
    falseuint64_t Results = self->_falseResults;
    self->_falseuint64_t Results = v39;

    v41 = [MPSGraphYieldOp alloc];
    id v42 = objc_loadWeakRetained(location);
    v176 = [(MPSGraphOperation *)v41 initWithGraph:v42 inputTensors:self->_falseResults controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

    v43 = (id *)objc_loadWeakRetained(location);
    [v43[22] addTerminatorOperation:v176];

    if (self->_trueResults)
    {
      v44 = self->_falseResults;
      if (v44)
      {
        uint64_t v45 = [(NSArray *)v44 count];
        if (v45 == [(NSArray *)self->_trueResults count])
        {
          for (unint64_t i = 0; ; ++i)
          {
            if (i >= [(NSArray *)self->_trueResults count]) {
              goto LABEL_81;
            }
            v47 = [(NSArray *)self->_trueResults objectAtIndexedSubscript:i];
            uint64_t ElementTypeOrSelf = mlir::getElementTypeOrSelf((void *)(*(void *)([v47 value] + 8) & 0xFFFFFFFFFFFFFFF8));
            v49 = [(NSArray *)self->_falseResults objectAtIndexedSubscript:i];
            if (ElementTypeOrSelf != mlir::getElementTypeOrSelf((void *)(*(void *)([v49 value] + 8) & 0xFFFFFFFFFFFFFFF8))) {
              __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2235, "getElementTypeOrSelf(_trueResults[i].value.getType()) == getElementTypeOrSelf(_falseResults[i].value.getType())");
            }

            v50 = [(NSArray *)self->_trueResults objectAtIndexedSubscript:i];
            uint64_t v51 = *(void *)([v50 value] + 8);
            v52 = [(NSArray *)self->_falseResults objectAtIndexedSubscript:i];
            LODWORD(v51) = (v51 & 0xFFFFFFFFFFFFFFF8) == (*(void *)([v52 value] + 8) & 0xFFFFFFFFFFFFFFF8);

            v53 = self->_trueResults;
            if (v51)
            {
              v54 = [(NSArray *)v53 objectAtIndexedSubscript:i];
              unint64_t v60 = *(void *)([v54 value] + 8) & 0xFFFFFFFFFFFFFFF8;
              v58 = v202;
              if (v202 < v203)
              {
                *(void *)v202 = v60;
                v59 = v58 + 8;
                goto LABEL_38;
              }
              v80 = v201;
              int64_t v81 = v202 - (unsigned char *)v201;
              uint64_t v82 = (v202 - (unsigned char *)v201) >> 3;
              unint64_t v83 = v82 + 1;
              if ((unint64_t)(v82 + 1) >> 61) {
                std::vector<int>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v84 = v203 - (unsigned char *)v201;
              if ((v203 - (unsigned char *)v201) >> 2 > v83) {
                unint64_t v83 = v84 >> 2;
              }
              if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v85 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v85 = v83;
              }
              if (v85)
              {
                if (v85 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v86 = operator new(8 * v85);
                v87 = (unint64_t *)&v86[8 * v82];
                unint64_t *v87 = v60;
                uint64_t v61 = (uint64_t)(v87 + 1);
                int64_t v88 = v58 - v80;
                if (v58 == v80)
                {
LABEL_72:
                  v201 = v87;
                  v202 = (char *)v61;
                  v203 = &v86[8 * v85];
                  if (v58) {
                    goto LABEL_69;
                  }
                  goto LABEL_70;
                }
              }
              else
              {
                v86 = 0;
                v87 = (unint64_t *)(8 * v82);
                *(void *)(8 * v82) = v60;
                uint64_t v61 = 8 * v82 + 8;
                int64_t v88 = v58 - v80;
                if (v58 == v80) {
                  goto LABEL_72;
                }
              }
              unint64_t v89 = v88 - 8;
              if (v89 < 0x58) {
                goto LABEL_190;
              }
              if ((unint64_t)(v58 - v86 - v81) < 0x20) {
                goto LABEL_190;
              }
              uint64_t v90 = (v89 >> 3) + 1;
              uint64_t v91 = 8 * (v90 & 0x3FFFFFFFFFFFFFFCLL);
              v92 = &v58[-v91];
              v87 = (unint64_t *)((char *)v87 - v91);
              v93 = &v86[8 * v82 - 16];
              v94 = (long long *)(v58 - 16);
              uint64_t v95 = v90 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v96 = *v94;
                *(v93 - 1) = *(v94 - 1);
                _OWORD *v93 = v96;
                v93 -= 2;
                v94 -= 2;
                v95 -= 4;
              }
              while (v95);
              v58 = v92;
              if (v90 != (v90 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_190:
                do
                {
                  unint64_t v97 = *((void *)v58 - 1);
                  v58 -= 8;
                  *--v87 = v97;
                }
                while (v58 != v80);
              }
              v58 = v201;
              v201 = v87;
              v202 = (char *)v61;
              v203 = &v86[8 * v85];
              if (v58) {
                goto LABEL_69;
              }
            }
            else
            {
              v54 = [(NSArray *)v53 objectAtIndexedSubscript:i];
              uint64_t v55 = mlir::getElementTypeOrSelf((void *)(*(void *)([v54 value] + 8) & 0xFFFFFFFFFFFFFFF8));
              uint64_t v56 = mlir::UnrankedTensorType::get(v55);
              uint64_t v57 = v56;
              v58 = v202;
              if (v202 < v203)
              {
                *(void *)v202 = v56;
                v59 = v58 + 8;
LABEL_38:
                uint64_t v61 = (uint64_t)v59;
                goto LABEL_70;
              }
              v62 = v201;
              int64_t v63 = v202 - (unsigned char *)v201;
              uint64_t v64 = (v202 - (unsigned char *)v201) >> 3;
              unint64_t v65 = v64 + 1;
              if ((unint64_t)(v64 + 1) >> 61) {
                std::vector<int>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v66 = v203 - (unsigned char *)v201;
              if ((v203 - (unsigned char *)v201) >> 2 > v65) {
                unint64_t v65 = v66 >> 2;
              }
              if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v67 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v67 = v65;
              }
              if (v67)
              {
                if (v67 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v68 = operator new(8 * v67);
                v69 = (uint64_t *)&v68[8 * v64];
                uint64_t *v69 = v57;
                uint64_t v61 = (uint64_t)(v69 + 1);
                int64_t v70 = v58 - v62;
                if (v58 == v62)
                {
LABEL_68:
                  v201 = v69;
                  v202 = (char *)v61;
                  v203 = &v68[8 * v67];
                  if (!v58) {
                    goto LABEL_70;
                  }
LABEL_69:
                  operator delete(v58);
                  goto LABEL_70;
                }
              }
              else
              {
                v68 = 0;
                v69 = (uint64_t *)(8 * v64);
                *(void *)(8 * v64) = v57;
                uint64_t v61 = 8 * v64 + 8;
                int64_t v70 = v58 - v62;
                if (v58 == v62) {
                  goto LABEL_68;
                }
              }
              unint64_t v71 = v70 - 8;
              if (v71 < 0x58) {
                goto LABEL_191;
              }
              if ((unint64_t)(v58 - v68 - v63) < 0x20) {
                goto LABEL_191;
              }
              uint64_t v72 = (v71 >> 3) + 1;
              uint64_t v73 = 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
              v74 = &v58[-v73];
              v69 = (uint64_t *)((char *)v69 - v73);
              v75 = &v68[8 * v64 - 16];
              v76 = (long long *)(v58 - 16);
              uint64_t v77 = v72 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v78 = *v76;
                *(v75 - 1) = *(v76 - 1);
                _OWORD *v75 = v78;
                v75 -= 2;
                v76 -= 2;
                v77 -= 4;
              }
              while (v77);
              v58 = v74;
              if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_191:
                do
                {
                  uint64_t v79 = *((void *)v58 - 1);
                  v58 -= 8;
                  *--v69 = v79;
                }
                while (v58 != v62);
              }
              v58 = v201;
              v201 = v69;
              v202 = (char *)v61;
              v203 = &v68[8 * v67];
              if (v58) {
                goto LABEL_69;
              }
            }
LABEL_70:
            v202 = (char *)v61;

            self = v188;
          }
        }
        v174 = "_falseResults.count == _trueResults.count";
        int v175 = 2232;
      }
      else
      {
        v174 = "_falseResults";
        int v175 = 2231;
      }
      __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", v175, v174);
    }
LABEL_81:
  }
  v98 = (id *)objc_loadWeakRetained(location);
  objc_storeStrong(v98 + 22, obj);

  if (!(void)v179)
  {
    void *v180 = 0;
    v180[1] = 0;
    v99 = (mlir::OpBuilder *)v184;
    uint64_t v200 = 0;
    if (self->_falseBlock) {
      goto LABEL_84;
    }
LABEL_97:
    v197.__r_.__value_.__s.__data_[0] = 1;
    LOBYTE(Inputs) = 0;
    uint64_t v200 = mlir::OpBuilder::create<mlir::scf::IfOp,std::vector<mlir::Type> &,mlir::Value &,BOOL,BOOL>(v99, v183, (uint64_t *)&v201, &v204, (unsigned __int8 *)&v197, (unsigned __int8 *)&Inputs);
    uint64_t v119 = mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
    v120 = (int8x16_t *)mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
    if (v215 == &v215) {
      goto LABEL_103;
    }
    v121 = v120;
    if (v120 == (int8x16_t *)v214) {
      goto LABEL_103;
    }
    uint64_t v122 = v119 + 32;
    v123 = v216;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v122, (uint64_t)&v215, (uint64_t)v216, (uint64_t)&v215);
    if (v123 == (int8x16_t *)&v215) {
      goto LABEL_103;
    }
    v115 = v121 + 2;
    if (v123 != &v121[2])
    {
      v116 = v215;
      v124 = (void *)v123->i64[0];
      v124[1] = &v215;
      v215 = v124;
      uint64_t v125 = v115->i64[0];
      v116[1] = v115;
      v123->i64[0] = v125;
      *(void *)(v125 + 8) = v123;
      goto LABEL_102;
    }
    goto LABEL_171;
  }
  *(_OWORD *)v180 = v179;
  v99 = (mlir::OpBuilder *)v184;
  uint64_t v200 = 0;
  if (!self->_falseBlock) {
    goto LABEL_97;
  }
LABEL_84:
  v197.__r_.__value_.__s.__data_[0] = 1;
  LOBYTE(Inputs) = 1;
  uint64_t v200 = mlir::OpBuilder::create<mlir::scf::IfOp,std::vector<mlir::Type> &,mlir::Value &,BOOL,BOOL>(v99, v183, (uint64_t *)&v201, &v204, (unsigned __int8 *)&v197, (unsigned __int8 *)&Inputs);
  id falseBlock = self->_falseBlock;
  self->_id falseBlock = 0;

  uint64_t v101 = mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
  v102 = (void *)mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
  if (v215 != &v215)
  {
    v103 = v102;
    if (v102 != v214)
    {
      uint64_t v104 = v101 + 32;
      v105 = (uint64_t *)v216;
      llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v104, (uint64_t)&v215, (uint64_t)v216, (uint64_t)&v215);
      if (v105 != (uint64_t *)&v215)
      {
        v106 = v103 + 4;
        if (v105 == v103 + 4) {
          goto LABEL_171;
        }
        v107 = v215;
        v108 = (void *)*v105;
        v108[1] = &v215;
        v215 = v108;
        uint64_t v109 = *v106;
        v107[1] = v106;
        uint64_t *v105 = v109;
        *(void *)(v109 + 8) = v105;
        uint64_t *v106 = (uint64_t)v107;
      }
    }
  }
  uint64_t v110 = mlir::scf::IfOp::elseBlock((mlir::scf::IfOp *)&v200);
  v111 = (int8x16_t *)mlir::scf::IfOp::elseBlock((mlir::scf::IfOp *)&v200);
  if (v209 == &v209) {
    goto LABEL_103;
  }
  v112 = v111;
  if (v111 == &__dst) {
    goto LABEL_103;
  }
  uint64_t v113 = v110 + 32;
  v114 = v210;
  llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v113, (uint64_t)&v209, (uint64_t)v210, (uint64_t)&v209);
  if (v114 == (int8x16_t *)&v209) {
    goto LABEL_103;
  }
  v115 = v112 + 2;
  if (v114 == &v112[2]) {
LABEL_171:
  }
    __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\"");
  v116 = v209;
  v117 = (void *)v114->i64[0];
  v117[1] = &v209;
  v209 = v117;
  uint64_t v118 = v115->i64[0];
  v116[1] = v115;
  v114->i64[0] = v118;
  *(void *)(v118 + 8) = v114;
LABEL_102:
  v115->i64[0] = (uint64_t)v116;
LABEL_103:
  unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v200);
  uint64_t v127 = *(void *)(Body + 8);
  if (v127) {
    v128 = (mlir::GenericProgramPoint **)(v127 - 8);
  }
  else {
    v128 = 0;
  }
  mlir::Block::getTerminator(v128);
  if (!v129)
  {
    uint64_t v199 = 0;
LABEL_186:
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2273, "thenYieldOp && \"thenRegion must have a terminator\"");
  }
  uint64_t v199 = llvm::DefaultDoCastIfPossible<mlir::scf::YieldOp,mlir::Operation *,llvm::CastInfo<mlir::scf::YieldOp,mlir::Operation *,void>>::doCastIfPossible(v129);
  if (!v199) {
    goto LABEL_186;
  }
  uint64_t Inputs = mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v199);
  uint64_t v194 = v130;
  mlir::OperandRange::getTypes(&Inputs, (uint64_t *)&v197);
  unint64_t v131 = mlir::scf::WhileOp::getAfter((mlir::scf::WhileOp *)&v200);
  uint64_t v132 = *(void *)(v131 + 8);
  if (v132) {
    v133 = (mlir::GenericProgramPoint **)(v132 - 8);
  }
  else {
    v133 = 0;
  }
  mlir::Block::getTerminator(v133);
  if (!v134
    || !llvm::DefaultDoCastIfPossible<mlir::scf::YieldOp,mlir::Operation *,llvm::CastInfo<mlir::scf::YieldOp,mlir::Operation *,void>>::doCastIfPossible(v134))
  {
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2279, "elseYieldOp && \"elseRegion must have a terminator\"");
  }
  v190 = (void *)mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v199);
  uint64_t v191 = v135;
  mlir::OperandRange::getTypes((uint64_t *)&v190, &Inputs);
  v190 = 0;
  uint64_t v191 = 0;
  v192 = 0;
  std::string::size_type v136 = v197.__r_.__value_.__r.__words[2];
  if (v197.__r_.__value_.__r.__words[2] != v197.__r_.__value_.__r.__words[0]) {
    __assert_rtn("operator-", "STLExtras.h", 1202, "base == rhs.base && \"incompatible iterators\"");
  }
  uint64_t v137 = v195;
  if (v195 != Inputs) {
    __assert_rtn("operator-", "STLExtras.h", 1202, "base == rhs.base && \"incompatible iterators\"");
  }
  uint64_t v138 = v194;
  std::string::size_type size = v197.__r_.__value_.__l.__size_;
  if (v198 - v197.__r_.__value_.__l.__size_ != v196 - v194) {
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2285, "thenResultSize == elseResultSize && \"then and else blocks should have equal number of return values\"");
  }
  locationa = (id *)v131;
  unint64_t v187 = Body;
  if (v198 != v197.__r_.__value_.__l.__size_)
  {
    v150 = 0;
    do
    {
      v153 = (uint64_t **)(*(void *)(*(void *)(v136 + 32 * size + 24) + 8) & 0xFFFFFFFFFFFFFFF8);
      v154 = (uint64_t **)(*(void *)(*(void *)(v137 + 32 * v138 + 24) + 8) & 0xFFFFFFFFFFFFFFF8);
      NextResultAtOffset = 0;
      if (!mlir::joinTypes(v153, v154, &NextResultAtOffset)) {
        __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2293, "mlir::succeeded(joinTypes(thenType, elseType, resultType))");
      }
      if (v150 < v192)
      {
        *(void *)v150 = NextResultAtOffset;
        uint64_t v151 = (uint64_t)(v150 + 8);
      }
      else
      {
        v155 = (char *)v190;
        int64_t v156 = v150 - (unsigned char *)v190;
        uint64_t v157 = (v150 - (unsigned char *)v190) >> 3;
        unint64_t v158 = v157 + 1;
        if ((unint64_t)(v157 + 1) >> 61) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v159 = v192 - (unsigned char *)v190;
        if ((v192 - (unsigned char *)v190) >> 2 > v158) {
          unint64_t v158 = v159 >> 2;
        }
        if ((unint64_t)v159 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v160 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v160 = v158;
        }
        if (v160)
        {
          if (v160 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v161 = operator new(8 * v160);
          v162 = &v161[8 * v157];
          void *v162 = NextResultAtOffset;
          uint64_t v151 = (uint64_t)(v162 + 1);
          int64_t v163 = v150 - v155;
          if (v150 != v155)
          {
LABEL_144:
            unint64_t v164 = v163 - 8;
            if (v164 < 0x168)
            {
              v165 = v150;
              goto LABEL_146;
            }
            unint64_t v167 = (v150 - 8 - v155) & 0xFFFFFFFFFFFFFFF8;
            if (&v161[v156 - 8 - v167] > &v161[v156 - 8])
            {
              v165 = v150;
              goto LABEL_146;
            }
            if (&v150[-v167 - 8] > v150 - 8)
            {
              v165 = v150;
              goto LABEL_146;
            }
            if ((unint64_t)(v150 - v161 - v156) < 0x20)
            {
              v165 = v150;
              goto LABEL_146;
            }
            uint64_t v168 = (v164 >> 3) + 1;
            uint64_t v169 = 8 * (v168 & 0x3FFFFFFFFFFFFFFCLL);
            v165 = &v150[-v169];
            v162 = (void *)((char *)v162 - v169);
            v170 = &v161[8 * v157 - 16];
            v171 = v150 - 16;
            uint64_t v172 = v168 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v173 = *(_OWORD *)v171;
              *(v170 - 1) = *((_OWORD *)v171 - 1);
              _OWORD *v170 = v173;
              v170 -= 2;
              v171 -= 32;
              v172 -= 4;
            }
            while (v172);
            if (v168 != (v168 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_146:
                uint64_t v166 = *((void *)v165 - 1);
                v165 -= 8;
                *--v162 = v166;
              }
              while (v165 != v155);
            }
            v150 = (char *)v190;
            v190 = v162;
            uint64_t v191 = v151;
            v192 = &v161[8 * v160];
            if (!v150) {
              goto LABEL_129;
            }
LABEL_151:
            operator delete(v150);
            goto LABEL_129;
          }
        }
        else
        {
          v161 = 0;
          v162 = (void *)(8 * v157);
          *(void *)(8 * v157) = NextResultAtOffset;
          uint64_t v151 = 8 * v157 + 8;
          int64_t v163 = v150 - v155;
          if (v150 != v155) {
            goto LABEL_144;
          }
        }
        v190 = v162;
        uint64_t v191 = v151;
        v192 = &v161[8 * v160];
        if (v150) {
          goto LABEL_151;
        }
      }
LABEL_129:
      uint64_t v191 = v151;
      ++size;
      ++v138;
      BOOL v152 = v136 == v197.__r_.__value_.__r.__words[2] && size == v198;
      v150 = (char *)v151;
    }
    while (!v152);
  }
  uint64_t v140 = *(void *)(v187 + 8);
  v141 = [(NSMutableArray *)v188->super._region->_blocks objectAtIndexedSubscript:0];
  uint64_t v142 = v140 - 8;
  if (!v140) {
    uint64_t v142 = 0;
  }
  v141[3] = v142;

  v143 = (char *)locationa[1];
  v144 = [(NSMutableArray *)v188->super._region->_blocks objectAtIndexedSubscript:1];
  v145 = v143 - 8;
  if (!v143) {
    v145 = 0;
  }
  v144[3] = v145;

  uint64_t Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v200);
  if (!v147) {
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\"");
  }
  NextResultAtOffset = (uint64_t **)mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&NextResultAtOffset);
  if (v190) {
    operator delete(v190);
  }
  mlir::Block::~Block((mlir::Block *)&__dst);

  mlir::Block::~Block((mlir::Block *)v214);
  if (v201)
  {
    v202 = (char *)v201;
    operator delete(v201);
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
  objc_storeStrong((id *)&self->_trueResults, 0);
  objc_storeStrong((id *)&self->_falseResults, 0);
  objc_storeStrong(&self->_falseBlock, 0);

  objc_storeStrong(&self->_trueBlock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  return self;
}

@end