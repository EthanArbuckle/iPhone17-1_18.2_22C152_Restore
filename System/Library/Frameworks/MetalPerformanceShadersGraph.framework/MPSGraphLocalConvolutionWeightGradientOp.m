@interface MPSGraphLocalConvolutionWeightGradientOp
- (MPSGraphLocalConvolutionWeightGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphLocalConvolutionWeightGradientOp

- (MPSGraphLocalConvolutionWeightGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphLocalConvolutionWeightGradientOp;
  return [(MPSGraphLocalConvolutionBase *)&v11 initWithGraph:a3 inputTensors:a4 controlDependencies:a5 dataLayout:a6 kernelShape:a7 dilationRateInX:a8 dilationRateInY:a9 name:a10];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v48[38] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphLocalConvolutionWeightGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphLocalConvolution.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::LocalConvolutionOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0xF1u, v11);
  if (v39 < 0) {
    operator delete(__p[0]);
  }
  uint64_t KernelSizeFromShape = getKernelSizeFromShape(self->super._kernelShape, (mlir::Builder *)a3);
  uint64_t DilationRateAttr = getDilationRateAttr(self->super._dilationRateInX, self->super._dilationRateInY, (mlir::OpBuilder *)a3);
  v15 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 8uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v16 = DilationRateAttr;
  unsigned int dataLayout = self->super._dataLayout;
  uint64_t v40 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  uint64_t v19 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.local_convolution_weight_gradient", (const unsigned __int8 *)0x25, Context);
  if (!v20)
  {
    __int16 v46 = 1283;
    v44 = "mps.local_convolution_weight_gradient";
    uint64_t v45 = 37;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v42 = 259;
    llvm::operator+(v43, v41, (uint64_t)v47);
    llvm::report_fatal_error((llvm::Twine *)v47, 1);
  }
  mlir::OperationState::OperationState(v48, v12, v19);
  mlir::mps::LocalConvolutionWeightGradientOp::build((mlir::MLIRContext **)a3, (uint64_t)v48, *v15, v15[1], dataLayout, KernelSizeFromShape, v16);
  v21 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  v22 = v21;
  if (!v21)
  {
    v27 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v28 = 662;
    v29 = "Casting.h";
    v30 = "dyn_cast";
    goto LABEL_31;
  }
  uint64_t v23 = *((void *)v21 + 6);
  v24 = *(void **)(v23 + 16);
  if (v24 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v47[0] = *(void *)(v23 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v47);
    if (v32 == 37)
    {
      BOOL v33 = *AttrData == 0x61636F6C2E73706DLL && AttrData[1] == 0x6C6F766E6F635F6CLL;
      BOOL v34 = v33 && AttrData[2] == 0x65775F6E6F697475;
      BOOL v35 = v34 && AttrData[3] == 0x6172675F74686769;
      if (v35 && *(void *)((char *)AttrData + 29) == 0x746E656964617267)
      {
        __int16 v46 = 1283;
        v43[0] = (uint64_t)"classof on '";
        v44 = "mps.local_convolution_weight_gradient";
        uint64_t v45 = 37;
        v41[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v42 = 259;
        llvm::operator+(v43, v41, (uint64_t)v47);
        llvm::report_fatal_error((llvm::Twine *)v47, 1);
      }
    }
    goto LABEL_30;
  }
  if (v24 != &mlir::detail::TypeIDResolver<mlir::mps::LocalConvolutionWeightGradientOp,void>::id)
  {
LABEL_30:
    v27 = "result && \"builder didn't return the right type\"";
    int v28 = 497;
    v29 = "Builders.h";
    v30 = "create";
LABEL_31:
    __assert_rtn(v30, v29, v28, v27);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*((_DWORD *)v22 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v37 = (char *)v22 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

@end