@interface MPSGraphLocalConvolutionOp
- (MPSGraphLocalConvolutionOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphLocalConvolutionOp

- (MPSGraphLocalConvolutionOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphLocalConvolutionOp;
  return [(MPSGraphLocalConvolutionBase *)&v11 initWithGraph:a3 inputTensors:a4 controlDependencies:a5 dataLayout:a6 kernelShape:a7 dilationRateInX:a8 dilationRateInY:a9 name:a10];
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  v14 = NSString;
  [(MPSGraphOperation *)self name];
  if (v13 == v9) {
    v19 = {;
  }
    v16 = [v14 stringWithFormat:@"%@/%@/LocalConvolutionDataGradient", v11, v19];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v18 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:1];
    [WeakRetained localConvolutionDataGradientWithIncomingGradientTensor:v10 weightTensor:v18 dataLayout:self->super._dataLayout kernelShape:self->super._kernelShape dilationRateInX:self->super._dilationRateInX dilationRateInY:self->super._dilationRateInY name:v16];
  }
  else {
    v15 = {;
  }
    v16 = [v14 stringWithFormat:@"%@/%@/LocalConvolutionDataGradient", v11, v15];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v18 = [(NSArray *)self->super.super._inputTensors objectAtIndexedSubscript:0];
    [WeakRetained localConvolutionWeightGradientWithIncomingGradientTensor:v10 sourceTensor:v18 dataLayout:self->super._dataLayout kernelShape:self->super._kernelShape dilationRateInX:self->super._dilationRateInX dilationRateInY:self->super._dilationRateInY name:v16];
  v20 = };

  return v20;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v46[38] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  mpsFileLoc("-[MPSGraphLocalConvolutionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphLocalConvolution.mm", __p);
  uint64_t v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::LocalConvolutionOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x8Cu, v11);
  if (v37 < 0) {
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
  uint64_t v38 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v38);
  uint64_t v19 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.local_convolution", (const unsigned __int8 *)0x15, Context);
  if (!v20)
  {
    __int16 v44 = 1283;
    v42 = "mps.local_convolution";
    uint64_t v43 = 21;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    __int16 v40 = 259;
    llvm::operator+(v41, v39, (uint64_t)v45);
    llvm::report_fatal_error((llvm::Twine *)v45, 1);
  }
  mlir::OperationState::OperationState(v46, v12, v19);
  mlir::mps::LocalConvolutionOp::build((mlir::MLIRContext **)a3, (uint64_t)v46, *v15, v15[1], dataLayout, KernelSizeFromShape, v16);
  v21 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v46);
  v22 = v21;
  if (!v21)
  {
    v27 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v28 = 662;
    v29 = "Casting.h";
    v30 = "dyn_cast";
    goto LABEL_25;
  }
  uint64_t v23 = *((void *)v21 + 6);
  v24 = *(void **)(v23 + 16);
  if (v24 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v45[0] = *(void *)(v23 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v45);
    if (v32 == 21)
    {
      BOOL v33 = *AttrData == 0x61636F6C2E73706DLL && AttrData[1] == 0x6C6F766E6F635F6CLL;
      if (v33 && *(void *)((char *)AttrData + 13) == 0x6E6F6974756C6F76)
      {
        __int16 v44 = 1283;
        v41[0] = (uint64_t)"classof on '";
        v42 = "mps.local_convolution";
        uint64_t v43 = 21;
        v39[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v40 = 259;
        llvm::operator+(v41, v39, (uint64_t)v45);
        llvm::report_fatal_error((llvm::Twine *)v45, 1);
      }
    }
    goto LABEL_24;
  }
  if (v24 != &mlir::detail::TypeIDResolver<mlir::mps::LocalConvolutionOp,void>::id)
  {
LABEL_24:
    v27 = "result && \"builder didn't return the right type\"";
    int v28 = 497;
    v29 = "Builders.h";
    v30 = "create";
LABEL_25:
    __assert_rtn(v30, v29, v28, v27);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v46);
  if (!*((_DWORD *)v22 + 9)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  v35 = (char *)v22 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v35);

  return DefiningOp;
}

@end