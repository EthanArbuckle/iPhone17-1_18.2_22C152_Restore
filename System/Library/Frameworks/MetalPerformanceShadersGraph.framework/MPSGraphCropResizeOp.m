@interface MPSGraphCropResizeOp
- (MPSGraphCropResizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphCropResizeOp

- (MPSGraphCropResizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  objc_storeStrong((id *)&self->_desc, a6);
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(MPSGraphOperation *)self initWithGraph:v15 inputTensors:v14 controlDependencies:v13 name:v12];

  return v16;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphCropResizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCropResizeOps.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x6Eu, v11);
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  id v13 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int v14 = [(MPSGraphCropResizeOpDescriptor *)self->_desc resizeHeight];
  unsigned int v15 = [(MPSGraphCropResizeOpDescriptor *)self->_desc resizeWidth];
  BOOL v16 = [(MPSGraphCropResizeOpDescriptor *)self->_desc normalizeCoordinates];
  [(MPSGraphCropResizeOpDescriptor *)self->_desc spatialScale];
  v18 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v52, v17);
  v19 = llvm::APFloatBase::IEEEsingle(v18);
  llvm::APFloat::Storage::Storage(&v50, v52, v19);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v52);
  unsigned int v20 = [(MPSGraphCropResizeOpDescriptor *)self->_desc resizeMode];
  unsigned int v41 = [(MPSGraphCropResizeOpDescriptor *)self->_desc samplingMode];
  unsigned int v21 = [(MPSGraphCropResizeOpDescriptor *)self->_desc coordinateMode];
  uint64_t v45 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v45);
  uint64_t v23 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.crop_resize", (const unsigned __int8 *)0xF, Context);
  if (!v24)
  {
    __int16 v49 = 1283;
    v48[2] = (uint64_t)"mps.crop_resize";
    v48[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v47 = 259;
    llvm::operator+(v48, (uint64_t *)&v46, (uint64_t)v53);
    llvm::report_fatal_error((llvm::Twine *)v53, 1);
  }
  mlir::OperationState::OperationState(v52, v12, v23);
  int v39 = v16;
  unsigned int v25 = v14;
  v40 = v11;
  uint64_t v26 = *v13;
  uint64_t v27 = v13[1];
  v28 = v50;
  v30 = llvm::APFloatBase::PPCDoubleDouble(v29);
  if (v30 == v28) {
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v54, &v50);
  }
  else {
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v54, (uint64_t)&v50);
  }
  mlir::mps::CropResizeOp::build((mlir::Builder *)a3, (uint64_t)v52, v26, v27, v25, v15, v39, (uint64_t)v53, v20, v41, v21);
  if (v30 == v54) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v55);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v54);
  }
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v52);
  if (!v31)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_21;
  }
  uint64_t v32 = llvm::DefaultDoCastIfPossible<mlir::mps::CropResizeOp,mlir::Operation *,llvm::CastInfo<mlir::mps::CropResizeOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v35 = "result && \"builder didn't return the right type\"";
    int v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_21:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v52);
  if (!*(_DWORD *)(v32 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v42 = v32 - 16;
  if (v30 == v50) {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v51);
  }
  else {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v50);
  }
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v42);

  return DefiningOp;
}

- (void).cxx_destruct
{
}

@end