@interface MPSGraphConcatOp
- (MPSGraphConcatOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(int64_t)a6 interleave:(BOOL)a7 name:(id)a8;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConcatOp

- (MPSGraphConcatOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(int64_t)a6 interleave:(BOOL)a7 name:(id)a8
{
  self->_dimensionIndex = a6;
  self->_interleave = a7;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a8];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  mpsFileLoc("-[MPSGraphConcatOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v29);
  id v12 = v11;
  __int16 v35 = 260;
  v34[0] = (uint64_t)v29;
  uint64_t StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v14 = mlir::FileLineColLoc::get(StringAttr, 0x2E9u, 0);
  if (!v14) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if (!v12)
  {
    HIBYTE(v33) = 10;
    strcpy(__dst.i8, "mps.concat");
    goto LABEL_13;
  }
  v15 = (const char *)[v12 UTF8String];
  size_t v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v17 = v16;
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    unint64_t v33 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v33) = v16;
    p_dst = &__dst;
    if (!v16) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  char v22 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = (uint64_t)p_p;
    char v22 = 3;
  }
  LOBYTE(v35) = v22;
  uint64_t v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  uint64_t v24 = mlir::NameLoc::get(v23, v14);
  if (!v24) {
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v33) & 0x80000000) == 0) {
      goto LABEL_20;
    }
LABEL_24:
    operator delete((void *)__dst.i64[0]);

    if ((v30 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33) < 0) {
    goto LABEL_24;
  }
LABEL_20:

  if ((v30 & 0x80000000) == 0) {
    goto LABEL_21;
  }
LABEL_25:
  operator delete(v29[0]);
LABEL_21:
  uint64_t v25 = *((void *)a5 + 1);
  v34[0] = *(void *)(v25 - 8);
  *((void *)a5 + 1) = v25 - 8;
  uint64_t v26 = mlir::OpBuilder::create<mlir::mps::ConcatOp,std::vector<mlir::Value> &,mlir::Value&,BOOL &>((mlir::UnitAttr **)a3, v24, (uint64_t *)a5, v34, (unsigned __int8 *)&self->_interleave);
  if (!*(_DWORD *)(v26 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  __dst.i64[0] = v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v84 = self;
  v13 = [(MPSGraphOperation *)self inputTensors];
  uint64_t v14 = [v13 count] - 1;

  if (v14 != a5)
  {
    v78 = v11;
    v79 = v10;
    id v80 = v12;
    size_t v16 = [(MPSGraphOperation *)self inputTensors];
    size_t v17 = [v16 objectAtIndexedSubscript:0];
    v18 = [v17 shape];
    uint64_t v19 = [v18 count];
    unint64_t v77 = a5;

    uint64_t v20 = (v19 & (v84->_dimensionIndex >> 63)) + v84->_dimensionIndex;
    BOOL interleave = v84->_interleave;
    BOOL v22 = v84->_interleave && v20 == v19 - 1;
    int v23 = !v22;
    int v83 = v23;
    uint64_t v24 = (char *)operator new(8uLL);
    unint64_t v25 = 0;
    *(void *)uint64_t v24 = 0;
    uint64_t v26 = v24 + 8;
    uint64_t v82 = v20 + interleave;
    v85 = v24;
    for (i = v24 + 8; ; i = (char *)v28)
    {
      v29 = [(MPSGraphOperation *)v84 inputTensors];
      unint64_t v30 = [v29 count] - 1;

      if (v25 >= v30)
      {
        id v11 = v78;
        id v81 = v78;
        if (v83)
        {
          p_graph = (id *)&v84->super._graph;
          id WeakRetained = objc_loadWeakRetained((id *)&v84->super._graph);
          uint64_t v55 = *(void *)&v24[8 * v77];
          id v10 = v79;
          v76 = [v79 shape];
          unint64_t v77 = [v76 objectAtIndexedSubscript:v82];
          uint64_t v56 = [(id)v77 integerValue];
        }
        else
        {
          id v10 = v79;
          v57 = [(MPSGraphOperation *)v84 inputTensors];
          v58 = [v57 objectAtIndexedSubscript:0];
          v59 = [v58 shape];
          v60 = (void *)[v59 mutableCopy];

          v61 = [NSNumber numberWithInteger:*((void *)i - 1)];
          [v60 setObject:v61 atIndexedSubscript:v82];

          p_graph = (id *)&v84->super._graph;
          id v62 = objc_loadWeakRetained((id *)&v84->super._graph);
          v63 = NSString;
          v64 = [(MPSGraphOperation *)v84 name];
          v65 = [v63 stringWithFormat:@"%@/%@/reshape1", v80, v64];
          uint64_t v66 = [v62 reshapeTensor:v81 withShape:v60 name:v65];

          id WeakRetained = objc_loadWeakRetained((id *)&v84->super._graph);
          uint64_t v55 = *(void *)&v24[8 * v77];
          uint64_t v56 = 1;
          id v81 = (id)v66;
        }
        v67 = NSString;
        v68 = [(MPSGraphOperation *)v84 name];
        v69 = [v67 stringWithFormat:@"%@/%@/slice", v80, v68];
        v15 = [WeakRetained sliceTensor:v81 dimension:v82 start:v55 length:v56 name:v69];

        if (v83)
        {
          id v12 = v80;
          v70 = v76;
        }
        else
        {

          id WeakRetained = objc_loadWeakRetained(p_graph);
          id v12 = v80;
          uint64_t v71 = [v10 shape];
          v72 = NSString;
          unint64_t v77 = [(MPSGraphOperation *)v84 name];
          v70 = (void *)v71;
          v73 = [v72 stringWithFormat:@"%@/%@/reshape2", v80, v77];
          uint64_t v74 = [WeakRetained reshapeTensor:v15 withShape:v71 name:v73];

          v15 = (void *)v74;
        }

        operator delete(v24);
        goto LABEL_50;
      }
      if (v83)
      {
        v31 = [(MPSGraphOperation *)v84 inputTensors];
        v32 = [v31 objectAtIndexedSubscript:v25];
        unint64_t v33 = [v32 shape];
        v34 = [v33 objectAtIndexedSubscript:v82];
        uint64_t v35 = [v34 integerValue];

        uint64_t v36 = *((void *)i - 1) + v35;
        if (i < v26) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v36 = *((void *)i - 1) + 1;
        if (i < v26)
        {
LABEL_10:
          *(void *)i = v36;
          uint64_t v28 = (uint64_t)(i + 8);
          goto LABEL_11;
        }
      }
      v37 = v85;
      uint64_t v38 = (i - v85) >> 3;
      unint64_t v39 = v38 + 1;
      if ((unint64_t)(v38 + 1) >> 61) {
        std::vector<long>::__throw_length_error[abi:ne180100]();
      }
      if ((v26 - v85) >> 2 > v39) {
        unint64_t v39 = (v26 - v85) >> 2;
      }
      if ((unint64_t)(v26 - v85) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v40)
      {
        if (v40 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v41 = (char *)operator new(8 * v40);
        uint64_t v24 = &v41[8 * v38];
        *(void *)uint64_t v24 = v36;
        uint64_t v28 = (uint64_t)(v24 + 8);
        v42 = (char *)(i - v85);
        if (i == v85) {
          goto LABEL_31;
        }
      }
      else
      {
        v41 = 0;
        uint64_t v24 = (char *)(8 * v38);
        *(void *)(8 * v38) = v36;
        uint64_t v28 = 8 * v38 + 8;
        v42 = (char *)(i - v85);
        if (i == v85) {
          goto LABEL_31;
        }
      }
      unint64_t v43 = (unint64_t)(v42 - 8);
      if (v43 < 0x168)
      {
        v44 = i;
        goto LABEL_30;
      }
      unint64_t v46 = (i - 8 - v85) & 0xFFFFFFFFFFFFFFF8;
      if (&v41[i - v85 - 8 - v46] > &v41[i - v85 - 8]) {
        break;
      }
      if (&i[-v46 - 8] > i - 8)
      {
        v44 = i;
        goto LABEL_30;
      }
      if ((unint64_t)(v85 - v41) < 0x20)
      {
        v44 = i;
        goto LABEL_30;
      }
      uint64_t v47 = (v43 >> 3) + 1;
      uint64_t v48 = 8 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
      v44 = &i[-v48];
      v24 -= v48;
      v49 = &v41[8 * v38 - 16];
      v50 = i - 16;
      uint64_t v51 = v47 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v52 = *(_OWORD *)v50;
        *((_OWORD *)v49 - 1) = *((_OWORD *)v50 - 1);
        *(_OWORD *)v49 = v52;
        v49 -= 32;
        v50 -= 32;
        v51 -= 4;
      }
      while (v51);
      if (v47 != (v47 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_30;
      }
LABEL_31:
      uint64_t v26 = &v41[8 * v40];
      v85 = v24;
      if (v37) {
        operator delete(v37);
      }
LABEL_11:
      ++v25;
    }
    v44 = i;
    do
    {
LABEL_30:
      uint64_t v45 = *((void *)v44 - 1);
      v44 -= 8;
      *((void *)v24 - 1) = v45;
      v24 -= 8;
    }
    while (v44 != v85);
    goto LABEL_31;
  }
  v15 = 0;
LABEL_50:

  return v15;
}

@end