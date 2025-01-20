@interface MPSGraphSampleGridOp
- (MPSGraphSampleGridOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 layout:(unint64_t)a6 normalizeCoordinates:(BOOL)a7 relativeCoordinates:(BOOL)a8 alignCorners:(BOOL)a9 paddingMode:(int64_t)a10 samplingMode:(unint64_t)a11 nearestRoundingMode:(unint64_t)a12 name:(id)a13;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphSampleGridOp

- (MPSGraphSampleGridOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 layout:(unint64_t)a6 normalizeCoordinates:(BOOL)a7 relativeCoordinates:(BOOL)a8 alignCorners:(BOOL)a9 paddingMode:(int64_t)a10 samplingMode:(unint64_t)a11 nearestRoundingMode:(unint64_t)a12 name:(id)a13
{
  self->_relativeCoordinates = a7;
  self->_alignCorners = a8;
  *(&self->_alignCorners + 1) = a9;
  self->_paddingMode = a10;
  self->_samplingMode = a11;
  self->_nearestRoundingMode = a12;
  self->_layout = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a13];
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [(MPSGraphOperation *)self inputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  if (v13 == v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    v16 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:0];
    v17 = NSString;
    v18 = [(MPSGraphOperation *)self name];
    v19 = [v17 stringWithFormat:@"%@/%@/sampleGridDataGradient/shapeOp", v11, v18];
    v20 = [WeakRetained shapeOfTensor:v16 name:v19];

    v21 = NSString;
    v22 = [(MPSGraphOperation *)self name];
    v23 = [v21 stringWithFormat:@"%@/%@/sampleGridDataGradient", v11, v22];

    id v24 = objc_loadWeakRetained((id *)&self->super._graph);
    v25 = [(NSArray *)self->super._inputTensors objectAtIndexedSubscript:1];
    v14 = [v24 sampleGridDataGradientWithIncomingGradientTensor:v10 coordinateTensor:v25 outputShapeTensor:v20 normalizeCoordinates:self->_relativeCoordinates relativeCoordinates:self->_alignCorners paddingMode:self->_paddingMode samplingMode:self->_samplingMode name:v23];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  v38[38] = *MEMORY[0x1E4F143B8];
  id v28 = a7;
  mpsFileLoc("-[MPSGraphSampleGridOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphSampleGrid.mm", __p);
  uint64_t v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x61u, v28);
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  v12 = *(uint64_t **)a5;
  if (*((void *)a5 + 1) - *(void *)a5 <= 0x10uLL) {
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
  unsigned int samplingMode = self->_samplingMode;
  unsigned int paddingMode = self->_paddingMode;
  unsigned int layout = self->_layout;
  uint64_t v14 = mlir::mps::NearestRoundingModeAttr::get(*(mlir::MLIRContext **)a3, self->_nearestRoundingMode);
  uint64_t v32 = v11;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v32);
  uint64_t v16 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.sample_grid", (const unsigned __int8 *)0xF, Context);
  if (!v17)
  {
    __int16 v36 = 1283;
    v35[2] = (uint64_t)"mps.sample_grid";
    v35[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    __int16 v34 = 259;
    llvm::operator+(v35, (uint64_t *)&v33, (uint64_t)v37);
    llvm::report_fatal_error((llvm::Twine *)v37, 1);
  }
  mlir::OperationState::OperationState(v38, v11, v16);
  mlir::mps::SampleGridOp::build((mlir::UnitAttr **)a3, (uint64_t)v38, *v12, v12[1], v12[2], self->_relativeCoordinates, self->_alignCorners, *((unsigned __int8 *)&self->_alignCorners + 1), paddingMode, samplingMode, layout, v14);
  v18 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v38);
  if (!v18)
  {
    v22 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v23 = 662;
    id v24 = "Casting.h";
    v25 = "dyn_cast";
    goto LABEL_12;
  }
  uint64_t v19 = llvm::DefaultDoCastIfPossible<mlir::mps::SampleGridOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SampleGridOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v18);
  if (!v19)
  {
    v22 = "result && \"builder didn't return the right type\"";
    int v23 = 497;
    id v24 = "Builders.h";
    v25 = "create";
LABEL_12:
    __assert_rtn(v25, v24, v23, v22);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v38);
  if (!*(_DWORD *)(v19 + 36)) {
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\"");
  }
  uint64_t v29 = v19 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v29);

  return DefiningOp;
}

@end