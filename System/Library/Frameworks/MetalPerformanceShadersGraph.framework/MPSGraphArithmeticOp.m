@interface MPSGraphArithmeticOp
- (MPSGraphArithmeticOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 mathOpType:(unint64_t)a6 name:(id)a7;
- (id)broadcastGradTernaryWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5;
- (id)broadcastGradWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5;
- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphArithmeticOp

- (MPSGraphArithmeticOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 mathOpType:(unint64_t)a6 name:(id)a7
{
  self->_mathOpType = a6;
  return [(MPSGraphOperation *)self initWithGraph:a3 inputTensors:a4 controlDependencies:a5 name:a7];
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11 = a7;
  switch(self->_mathOpType)
  {
    case 0uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IdentityOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t)a5, v11);
      goto LABEL_76;
    case 1uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 2uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentBase2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 3uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentBase10Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 4uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 5uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmBase2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 6uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmBase10Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 7uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SquareOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 8uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SquareRootOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 9uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ReciprocalSquareRootOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xAuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ReciprocalOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xBuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::AbsoluteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xCuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::AbsoluteSquareOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xDuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::NegativeOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xEuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SignOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xFuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SignbitOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x10uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CeilOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x11uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::FloorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x12uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RoundOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x13uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RintOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x14uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SinOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x15uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CosOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x16uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x17uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SinhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x18uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CoshOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x19uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TanhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1AuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ASinOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1BuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ACosOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1CuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ATanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1DuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ASinhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1EuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ACoshOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1FuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ATanhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x20uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::NotOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x21uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsInfiniteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x22uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsFiniteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x23uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsNaNOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x24uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ErfOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x25uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::BitwiseNotOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x26uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::BitwisePopcountOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x27uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ConjugateOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x28uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RealPartOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x29uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ImaginaryPartOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2AuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::AddOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2BuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::SubtractOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2CuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MultiplyOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2DuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::DivideOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2EuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::ModuloOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2FuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::PowerOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x30uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MinimumOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x31uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MaximumOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x32uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::EqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x33uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::NotEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x34uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::LessThanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x35uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::LessThanOrEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x36uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::GreaterThanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x37uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::GreaterThanOrEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x38uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::AndOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x39uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::OrOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3AuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::NandOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3BuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::NorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3CuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::XorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3DuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::XnorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3EuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::ATan2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3FuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseAndOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x40uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseOrOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x41uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseXorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x42uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseLeftShiftOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x43uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseRightShiftOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x44uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::CreateComplexOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x45uLL:
      IsInfinite = (void *)createTernaryArithmeticOp<mlir::mps::SelectOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x46uLL:
      IsInfinite = (void *)createTernaryArithmeticOp<mlir::mps::ClampOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x47uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TruncateOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
LABEL_76:
      a5 = IsInfinite;
      break;
    default:
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      break;
  }

  return a5;
}

- (id)broadcastGradWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v34 = v8;
  id v11 = [(MPSGraphOperation *)self inputTensors];
  v12 = [v11 objectAtIndexedSubscript:a4];
  v13 = NSString;
  v14 = [(MPSGraphOperation *)self name];
  v15 = [v13 stringWithFormat:@"%@/%@/braodcastGrad", v9, v14];
  v35 = [WeakRetained broadcastGradientArgsForPrimaryTensor:v8 withSecondaryTensor:v12 name:v15];

  id v16 = objc_loadWeakRetained((id *)&self->super._graph);
  v17 = NSString;
  v18 = [(MPSGraphOperation *)self name];
  v19 = [v17 stringWithFormat:@"%@/%@/braodcastGrad", v9, v18];
  v20 = [v16 reductionSumWithTensor:v8 axesTensor:v35 name:v19];

  id v21 = objc_loadWeakRetained((id *)&self->super._graph);
  v22 = [(MPSGraphOperation *)self inputTensors];
  v23 = [v22 objectAtIndexedSubscript:a4];
  v24 = NSString;
  v25 = [(MPSGraphOperation *)self name];
  v26 = [v24 stringWithFormat:@"%@/%@/braodcastGrad", v9, v25];
  v27 = [v21 shapeOfTensor:v23 name:v26];

  id v28 = objc_loadWeakRetained((id *)&self->super._graph);
  v29 = NSString;
  v30 = [(MPSGraphOperation *)self name];
  v31 = [v29 stringWithFormat:@"%@/%@/braodcastGrad", v9, v30];
  v32 = [v28 reshapeTensor:v20 withShapeTensor:v27 name:v31];

  return v32;
}

- (id)broadcastGradTernaryWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v34 = v8;
  id v11 = [(MPSGraphOperation *)self inputTensors];
  v12 = [v11 objectAtIndexedSubscript:a4];
  v13 = NSString;
  v14 = [(MPSGraphOperation *)self name];
  v15 = [v13 stringWithFormat:@"%@/%@/braodcastGrad", v9, v14];
  v35 = [WeakRetained broadcastGradientArgsForPrimaryTensor:v8 withSecondaryTensor:v12 name:v15];

  id v16 = objc_loadWeakRetained((id *)&self->super._graph);
  v17 = NSString;
  v18 = [(MPSGraphOperation *)self name];
  v19 = [v17 stringWithFormat:@"%@/%@/braodcastGrad", v9, v18];
  v20 = [v16 reductionSumWithTensor:v8 axesTensor:v35 name:v19];

  id v21 = objc_loadWeakRetained((id *)&self->super._graph);
  v22 = [(MPSGraphOperation *)self inputTensors];
  v23 = [v22 objectAtIndexedSubscript:a4];
  v24 = NSString;
  v25 = [(MPSGraphOperation *)self name];
  v26 = [v24 stringWithFormat:@"%@/%@/braodcastGrad", v9, v25];
  v27 = [v21 shapeOfTensor:v23 name:v26];

  id v28 = objc_loadWeakRetained((id *)&self->super._graph);
  v29 = NSString;
  v30 = [(MPSGraphOperation *)self name];
  v31 = [v29 stringWithFormat:@"%@/%@/braodcastGrad", v9, v30];
  v32 = [v28 reshapeTensor:v20 withShapeTensor:v27 name:v31];

  return v32;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v718 = a3;
  id v719 = a4;
  id v10 = a6;
  id v11 = 0;
  switch(self->_mathOpType)
  {
    case 0uLL:
      goto LABEL_69;
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      v324 = [(MPSGraphOperation *)self outputTensors];
      v355 = [v324 objectAtIndexedSubscript:0];
      v419 = NSString;
      v357 = [(MPSGraphOperation *)self name];
      v358 = [v419 stringWithFormat:@"%@/%@/multiplication", v10, v357];
      uint64_t v359 = [WeakRetained multiplicationWithPrimaryTensor:v355 secondaryTensor:v719 name:v358];
      goto LABEL_56;
    case 2uLL:
      id v429 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v430 = [v429 constantWithScalar:&unk_1EC9F11D8 shape:268435488 dataType:0.693147181];

      id v431 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v430;
      v432 = [(MPSGraphOperation *)self outputTensors];
      v433 = [v432 objectAtIndexedSubscript:0];
      v434 = NSString;
      v435 = [(MPSGraphOperation *)self name];
      v436 = [v434 stringWithFormat:@"%@/%@/multiplication_LN2", v10, v435];
      v349 = [v431 multiplicationWithPrimaryTensor:v433 secondaryTensor:v430 name:v436];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v437 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v353 = [v437 stringWithFormat:@"%@/%@/multiplication", v10, v352];
      uint64_t v354 = [v350 multiplicationWithPrimaryTensor:v349 secondaryTensor:v719 name:v353];
      goto LABEL_71;
    case 3uLL:
      id v420 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v421 = [v420 constantWithScalar:&unk_1EC9F11F0 shape:268435488 dataType:2.30258509];

      id v422 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v421;
      v423 = [(MPSGraphOperation *)self outputTensors];
      v424 = [v423 objectAtIndexedSubscript:0];
      v425 = NSString;
      v426 = [(MPSGraphOperation *)self name];
      v427 = [v425 stringWithFormat:@"%@/%@/multiplication_LN10", v10, v426];
      v349 = [v422 multiplicationWithPrimaryTensor:v424 secondaryTensor:v421 name:v427];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v428 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v353 = [v428 stringWithFormat:@"%@/%@/multiplication", v10, v352];
      uint64_t v354 = [v350 multiplicationWithPrimaryTensor:v349 secondaryTensor:v719 name:v353];
      goto LABEL_71;
    case 4uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      v324 = [(MPSGraphOperation *)self inputTensors];
      v355 = [v324 objectAtIndexedSubscript:0];
      v381 = NSString;
      v357 = [(MPSGraphOperation *)self name];
      v358 = [v381 stringWithFormat:@"%@/%@/division", v10, v357];
      uint64_t v359 = [WeakRetained divisionWithPrimaryTensor:v719 secondaryTensor:v355 name:v358];
      goto LABEL_56;
    case 5uLL:
      id v456 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v457 = [v456 constantWithScalar:&unk_1EC9F1208 shape:268435488 dataType:0.693147181];

      id v458 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v457;
      v459 = [(MPSGraphOperation *)self inputTensors];
      v460 = [v459 objectAtIndexedSubscript:0];
      v461 = NSString;
      v462 = [(MPSGraphOperation *)self name];
      v463 = [v461 stringWithFormat:@"%@/%@/multiplication_LN2", v10, v462];
      v349 = [v458 multiplicationWithPrimaryTensor:v460 secondaryTensor:v457 name:v463];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v464 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v353 = [v464 stringWithFormat:@"%@/%@/division", v10, v352];
      uint64_t v354 = [v350 divisionWithPrimaryTensor:v719 secondaryTensor:v349 name:v353];
      goto LABEL_71;
    case 6uLL:
      id v360 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v361 = [v360 constantWithScalar:&unk_1EC9F1220 shape:268435488 dataType:2.30258509];

      id v362 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v361;
      v363 = [(MPSGraphOperation *)self inputTensors];
      v364 = [v363 objectAtIndexedSubscript:0];
      v365 = NSString;
      v366 = [(MPSGraphOperation *)self name];
      v367 = [v365 stringWithFormat:@"%@/%@/multiplication_LN10", v10, v366];
      v349 = [v362 multiplicationWithPrimaryTensor:v364 secondaryTensor:v361 name:v367];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v368 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v353 = [v368 stringWithFormat:@"%@/%@/division", v10, v352];
      uint64_t v354 = [v350 divisionWithPrimaryTensor:v719 secondaryTensor:v349 name:v353];
      goto LABEL_71;
    case 7uLL:
      id v341 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v342 = [v341 constantWithScalar:&unk_1EC9F1238 shape:268435488 dataType:2.0];

      id v343 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v342;
      v344 = [(MPSGraphOperation *)self inputTensors];
      v345 = [v344 objectAtIndexedSubscript:0];
      v346 = NSString;
      v347 = [(MPSGraphOperation *)self name];
      v348 = [v346 stringWithFormat:@"%@/%@/multiplication_2.0", v10, v347];
      v349 = [v343 multiplicationWithPrimaryTensor:v345 secondaryTensor:v342 name:v348];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v351 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v353 = [v351 stringWithFormat:@"%@/%@/multiplication", v10, v352];
      uint64_t v354 = [v350 multiplicationWithPrimaryTensor:v719 secondaryTensor:v349 name:v353];
LABEL_71:
      id v11 = (id)v354;

      goto LABEL_72;
    case 8uLL:
      id v382 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v382 constantWithScalar:&unk_1EC9F1250 shape:268435488 dataType:0.5];

      id v383 = objc_loadWeakRetained((id *)&self->super._graph);
      v384 = [(MPSGraphOperation *)self inputTensors];
      v385 = [v384 objectAtIndexedSubscript:0];
      v386 = NSString;
      v387 = [(MPSGraphOperation *)self name];
      v388 = [v386 stringWithFormat:@"%@/%@/reciprocalSqrt", v10, v387];
      v389 = [v383 reciprocalSquareRootWithTensor:v385 name:v388];

      id v390 = objc_loadWeakRetained((id *)&self->super._graph);
      v391 = NSString;
      v392 = [(MPSGraphOperation *)self name];
      v393 = [v391 stringWithFormat:@"%@/%@/multiplication_0.5", v10, v392];
      v394 = [v390 multiplicationWithPrimaryTensor:v389 secondaryTensor:v706 name:v393];

      v123 = objc_loadWeakRetained((id *)&self->super._graph);
      v395 = NSString;
      v396 = [(MPSGraphOperation *)self name];
      v397 = [v395 stringWithFormat:@"%@/%@/multiplication", v10, v396];
      id v11 = [v123 multiplicationWithPrimaryTensor:v719 secondaryTensor:v394 name:v397];

      goto LABEL_83;
    case 9uLL:
      id v472 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v472 constantWithScalar:&unk_1EC9F1268 shape:268435488 dataType:-1.5];

      id v473 = objc_loadWeakRetained((id *)&self->super._graph);
      v695 = [v473 constantWithScalar:&unk_1EC9F1280 shape:268435488 dataType:-0.5];

      id v474 = objc_loadWeakRetained((id *)&self->super._graph);
      v475 = [(MPSGraphOperation *)self inputTensors];
      v476 = [v475 objectAtIndexedSubscript:0];
      v477 = NSString;
      v478 = [(MPSGraphOperation *)self name];
      v479 = [v477 stringWithFormat:@"%@/%@/pow_-1.5", v10, v478];
      v480 = [v474 powerWithPrimaryTensor:v476 secondaryTensor:v706 name:v479];

      id v481 = objc_loadWeakRetained((id *)&self->super._graph);
      v482 = NSString;
      v483 = [(MPSGraphOperation *)self name];
      v484 = [v482 stringWithFormat:@"%@/%@/multiplication_-0.5", v10, v483];
      v485 = [v481 multiplicationWithPrimaryTensor:v480 secondaryTensor:v695 name:v484];

      v37 = objc_loadWeakRetained((id *)&self->super._graph);
      v486 = NSString;
      v487 = [(MPSGraphOperation *)self name];
      v488 = [v486 stringWithFormat:@"%@/%@/multiplication", v10, v487];
      id v11 = [v37 multiplicationWithPrimaryTensor:v719 secondaryTensor:v485 name:v488];

      goto LABEL_76;
    case 0xAuLL:
      id v233 = objc_loadWeakRetained((id *)&self->super._graph);
      v234 = NSString;
      v235 = [(MPSGraphOperation *)self name];
      v236 = [v234 stringWithFormat:@"%@/%@/negative", v10, v235];
      uint64_t v237 = [v233 negativeWithTensor:v719 name:v236];

      id v238 = objc_loadWeakRetained((id *)&self->super._graph);
      v714 = (void *)v237;
      v239 = [(MPSGraphOperation *)self inputTensors];
      v240 = [v239 objectAtIndexedSubscript:0];
      v241 = NSString;
      v242 = [(MPSGraphOperation *)self name];
      v243 = [v241 stringWithFormat:@"%@/%@/square", v10, v242];
      v244 = [v238 squareWithTensor:v240 name:v243];

      id v245 = objc_loadWeakRetained((id *)&self->super._graph);
      v246 = NSString;
      v247 = [(MPSGraphOperation *)self name];
      v248 = [v246 stringWithFormat:@"%@/%@/multiplication", v10, v247];
      id v11 = [v245 multiplicationWithPrimaryTensor:v244 secondaryTensor:v714 name:v248];

      goto LABEL_118;
    case 0xBuLL:
      id v465 = objc_loadWeakRetained((id *)&self->super._graph);
      v466 = [(MPSGraphOperation *)self inputTensors];
      v467 = [v466 objectAtIndexedSubscript:0];
      v468 = NSString;
      v469 = [(MPSGraphOperation *)self name];
      v470 = [v468 stringWithFormat:@"%@/%@/sign", v10, v469];
      id v114 = [v465 signWithTensor:v467 name:v470];

      id v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v471 = NSString;
      v192 = [(MPSGraphOperation *)self name];
      v193 = [v471 stringWithFormat:@"%@/%@/multiplication", v10, v192];
      uint64_t v194 = [v190 multiplicationWithPrimaryTensor:v719 secondaryTensor:v114 name:v193];
      goto LABEL_74;
    case 0xCuLL:
      v489 = [(MPSGraphOperation *)self inputTensors];
      v490 = [v489 objectAtIndexedSubscript:0];
      [v490 dataType];

      v491 = [(MPSGraphOperation *)self inputTensors];
      v492 = [v491 objectAtIndexedSubscript:0];
      int v493 = [v492 dataType];

      if ((v493 & 0x1000000) != 0 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v494 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v495 = [v494 constantWithScalar:&unk_1EC9F1298 shape:268435488 dataType:2.0];

      id v496 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v495;
      v497 = [(MPSGraphOperation *)self inputTensors];
      v498 = [v497 objectAtIndexedSubscript:0];
      v499 = NSString;
      v500 = [(MPSGraphOperation *)self name];
      v501 = [v499 stringWithFormat:@"%@/%@/multiplication_2.0", v10, v500];
      v502 = [v496 multiplicationWithPrimaryTensor:v498 secondaryTensor:v495 name:v501];

      id v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v503 = NSString;
      v352 = [(MPSGraphOperation *)self name];
      v504 = [v503 stringWithFormat:@"%@/%@/multiplication", v10, v352];
      id v11 = [v350 multiplicationWithPrimaryTensor:v719 secondaryTensor:v502 name:v504];

LABEL_72:
      goto LABEL_88;
    case 0xDuLL:
      v14 = objc_loadWeakRetained((id *)&self->super._graph);
      v438 = NSString;
      id v16 = [(MPSGraphOperation *)self name];
      v17 = [v438 stringWithFormat:@"%@/%@/negative", v10, v16];
      uint64_t v18 = [v14 negativeWithTensor:v719 name:v17];
      goto LABEL_3;
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x47uLL:
      p_graph = &self->super._graph;
      id v13 = objc_loadWeakRetained((id *)p_graph);
      v14 = objc_msgSend(v13, "constantWithScalar:dataType:", objc_msgSend(v719, "dataType"), 0.0);

      id v15 = objc_loadWeakRetained((id *)p_graph);
      id v16 = [v15 shapeOfTensor:v719 name:v10];

      v17 = objc_loadWeakRetained((id *)p_graph);
      uint64_t v18 = [v17 broadcastTensor:v14 toShapeTensor:v16 name:v10];
LABEL_3:
      id v11 = (id)v18;

      goto LABEL_118;
    case 0xFuLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      v324 = [(MPSGraphOperation *)self outputTensors];
      v355 = [v324 objectAtIndexedSubscript:0];
      v356 = NSString;
      v357 = [(MPSGraphOperation *)self name];
      v358 = [v356 stringWithFormat:@"%@/%@/multiplication", v10, v357];
      uint64_t v359 = [WeakRetained multiplicationWithPrimaryTensor:v719 secondaryTensor:v355 name:v358];
LABEL_56:
      id v11 = (id)v359;

      goto LABEL_57;
    case 0x14uLL:
      id v298 = objc_loadWeakRetained((id *)&self->super._graph);
      v299 = [(MPSGraphOperation *)self inputTensors];
      v300 = [v299 objectAtIndexedSubscript:0];
      v301 = NSString;
      v302 = [(MPSGraphOperation *)self name];
      v303 = [v301 stringWithFormat:@"%@/%@/cos", v10, v302];
      id v114 = [v298 cosWithTensor:v300 name:v303];

      id v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v304 = NSString;
      v192 = [(MPSGraphOperation *)self name];
      v193 = [v304 stringWithFormat:@"%@/%@/multiplication", v10, v192];
      uint64_t v194 = [v190 multiplicationWithPrimaryTensor:v719 secondaryTensor:v114 name:v193];
      goto LABEL_74;
    case 0x15uLL:
      id v282 = objc_loadWeakRetained((id *)&self->super._graph);
      v283 = [(MPSGraphOperation *)self inputTensors];
      v284 = [v283 objectAtIndexedSubscript:0];
      v285 = NSString;
      v286 = [(MPSGraphOperation *)self name];
      v287 = [v285 stringWithFormat:@"%@/%@/cos", v10, v286];
      v288 = [v282 sinWithTensor:v284 name:v287];

      id v289 = objc_loadWeakRetained((id *)&self->super._graph);
      v290 = NSString;
      v291 = [(MPSGraphOperation *)self name];
      v292 = [v290 stringWithFormat:@"%@/%@/negative", v10, v291];
      v293 = [v289 negativeWithTensor:v288 name:v292];

      id v294 = objc_loadWeakRetained((id *)&self->super._graph);
      v295 = NSString;
      v296 = [(MPSGraphOperation *)self name];
      v297 = [v295 stringWithFormat:@"%@/%@/multiplication", v10, v296];
      id v11 = [v294 multiplicationWithPrimaryTensor:v719 secondaryTensor:v293 name:v297];

      goto LABEL_118;
    case 0x16uLL:
      id v313 = objc_loadWeakRetained((id *)&self->super._graph);
      v314 = [(MPSGraphOperation *)self inputTensors];
      v315 = [v314 objectAtIndexedSubscript:0];
      v316 = NSString;
      v317 = [(MPSGraphOperation *)self name];
      v318 = [v316 stringWithFormat:@"%@/%@/cos", v10, v317];
      id WeakRetained = [v313 cosWithTensor:v315 name:v318];

      id v320 = objc_loadWeakRetained((id *)&self->super._graph);
      v321 = NSString;
      v322 = [(MPSGraphOperation *)self name];
      v323 = [v321 stringWithFormat:@"%@/%@/reciprocal", v10, v322];
      v324 = [v320 reciprocalWithTensor:WeakRetained name:v323];

      id v325 = objc_loadWeakRetained((id *)&self->super._graph);
      v326 = NSString;
      v327 = [(MPSGraphOperation *)self name];
      v328 = [v326 stringWithFormat:@"%@/%@/square", v10, v327];
      v329 = [v325 squareWithTensor:v324 name:v328];

      id v330 = objc_loadWeakRetained((id *)&self->super._graph);
      v331 = NSString;
      v332 = [(MPSGraphOperation *)self name];
      v333 = [v331 stringWithFormat:@"%@/%@/multiplication", v10, v332];
      id v11 = [v330 multiplicationWithPrimaryTensor:v719 secondaryTensor:v329 name:v333];

LABEL_57:
      goto LABEL_118;
    case 0x17uLL:
      id v334 = objc_loadWeakRetained((id *)&self->super._graph);
      v335 = [(MPSGraphOperation *)self inputTensors];
      v336 = [v335 objectAtIndexedSubscript:0];
      v337 = NSString;
      v338 = [(MPSGraphOperation *)self name];
      v339 = [v337 stringWithFormat:@"%@/%@/cosh", v10, v338];
      id v114 = [v334 coshWithTensor:v336 name:v339];

      id v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v340 = NSString;
      v192 = [(MPSGraphOperation *)self name];
      v193 = [v340 stringWithFormat:@"%@/%@/multiplication", v10, v192];
      uint64_t v194 = [v190 multiplicationWithPrimaryTensor:v719 secondaryTensor:v114 name:v193];
      goto LABEL_74;
    case 0x18uLL:
      id v184 = objc_loadWeakRetained((id *)&self->super._graph);
      v185 = [(MPSGraphOperation *)self inputTensors];
      v186 = [v185 objectAtIndexedSubscript:0];
      v187 = NSString;
      v188 = [(MPSGraphOperation *)self name];
      v189 = [v187 stringWithFormat:@"%@/%@/sinh", v10, v188];
      id v114 = [v184 sinhWithTensor:v186 name:v189];

      id v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v191 = NSString;
      v192 = [(MPSGraphOperation *)self name];
      v193 = [v191 stringWithFormat:@"%@/%@/multiplication", v10, v192];
      uint64_t v194 = [v190 multiplicationWithPrimaryTensor:v719 secondaryTensor:v114 name:v193];
LABEL_74:
      id v11 = (id)v194;

      goto LABEL_117;
    case 0x19uLL:
      id v116 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v116 constantWithScalar:&unk_1EC9F12B0 shape:268435488 dataType:1.0];

      id v117 = objc_loadWeakRetained((id *)&self->super._graph);
      v118 = [(MPSGraphOperation *)self inputTensors];
      v119 = [v118 objectAtIndexedSubscript:0];
      v120 = NSString;
      v121 = [(MPSGraphOperation *)self name];
      v122 = [v120 stringWithFormat:@"%@/%@/tanh", v10, v121];
      v123 = [v117 tanhWithTensor:v119 name:v122];

      id v124 = objc_loadWeakRetained((id *)&self->super._graph);
      v125 = NSString;
      v126 = [(MPSGraphOperation *)self name];
      v127 = [v125 stringWithFormat:@"%@/%@/square", v10, v126];
      v128 = [v124 squareWithTensor:v123 name:v127];

      id v129 = objc_loadWeakRetained((id *)&self->super._graph);
      v130 = NSString;
      v131 = [(MPSGraphOperation *)self name];
      v132 = [v130 stringWithFormat:@"%@/%@/subtraction_1", v10, v131];
      v133 = [v129 subtractionWithPrimaryTensor:v706 secondaryTensor:v128 name:v132];

      id v134 = objc_loadWeakRetained((id *)&self->super._graph);
      v135 = NSString;
      v136 = [(MPSGraphOperation *)self name];
      v137 = [v135 stringWithFormat:@"%@/%@/multiplication", v10, v136];
      id v11 = [v134 multiplicationWithPrimaryTensor:v719 secondaryTensor:v133 name:v137];

      goto LABEL_82;
    case 0x1AuLL:
      id v505 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v505 constantWithScalar:&unk_1EC9F12C8 shape:268435488 dataType:1.0];

      id v506 = objc_loadWeakRetained((id *)&self->super._graph);
      v507 = [(MPSGraphOperation *)self inputTensors];
      v508 = [v507 objectAtIndexedSubscript:0];
      v509 = NSString;
      v510 = [(MPSGraphOperation *)self name];
      v511 = [v509 stringWithFormat:@"%@/%@/square", v10, v510];
      v701 = [v506 squareWithTensor:v508 name:v511];

      id v512 = objc_loadWeakRetained((id *)&self->super._graph);
      v513 = NSString;
      v514 = [(MPSGraphOperation *)self name];
      v515 = [v513 stringWithFormat:@"%@/%@/subtraction", v10, v514];
      v694 = [v512 subtractionWithPrimaryTensor:v706 secondaryTensor:v701 name:v515];

      id v516 = objc_loadWeakRetained((id *)&self->super._graph);
      v517 = [(MPSGraphOperation *)self inputTensors];
      v518 = [v517 objectAtIndexedSubscript:0];
      v519 = NSString;
      v520 = [(MPSGraphOperation *)self name];
      v521 = [v519 stringWithFormat:@"%@/%@/reciprocalSquareRoot", v10, v520];
      v522 = [v516 reciprocalSquareRootWithTensor:v518 name:v521];

      id v523 = objc_loadWeakRetained((id *)&self->super._graph);
      v524 = NSString;
      v525 = [(MPSGraphOperation *)self name];
      v526 = [v524 stringWithFormat:@"%@/%@/multiplication", v10, v525];
      id v11 = [v523 multiplicationWithPrimaryTensor:v719 secondaryTensor:v522 name:v526];

      goto LABEL_88;
    case 0x1BuLL:
      id v546 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v546 constantWithScalar:&unk_1EC9F12E0 shape:268435488 dataType:1.0];

      id v547 = objc_loadWeakRetained((id *)&self->super._graph);
      v548 = [(MPSGraphOperation *)self inputTensors];
      v549 = [v548 objectAtIndexedSubscript:0];
      v550 = NSString;
      v551 = [(MPSGraphOperation *)self name];
      v552 = [v550 stringWithFormat:@"%@/%@/square", v10, v551];
      v695 = [v547 squareWithTensor:v549 name:v552];

      id v553 = objc_loadWeakRetained((id *)&self->super._graph);
      v554 = NSString;
      v555 = [(MPSGraphOperation *)self name];
      v556 = [v554 stringWithFormat:@"%@/%@/subtraction", v10, v555];
      v557 = [v553 subtractionWithPrimaryTensor:v706 secondaryTensor:v695 name:v556];

      id v558 = objc_loadWeakRetained((id *)&self->super._graph);
      v559 = NSString;
      v560 = [(MPSGraphOperation *)self name];
      v561 = [v559 stringWithFormat:@"%@/%@/reciprocalSquareRoot", v10, v560];
      v562 = [v558 reciprocalSquareRootWithTensor:v557 name:v561];

      id v563 = objc_loadWeakRetained((id *)&self->super._graph);
      v564 = NSString;
      v565 = [(MPSGraphOperation *)self name];
      v566 = [v564 stringWithFormat:@"%@/%@/multiplication", v10, v565];
      v567 = [v563 multiplicationWithPrimaryTensor:v719 secondaryTensor:v562 name:v566];

      id v568 = objc_loadWeakRetained((id *)&self->super._graph);
      v569 = NSString;
      v570 = [(MPSGraphOperation *)self name];
      v571 = [v569 stringWithFormat:@"%@/%@/negative", v10, v570];
      id v11 = [v568 negativeWithTensor:v567 name:v571];

      goto LABEL_87;
    case 0x1CuLL:
      id v171 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v172 = [v171 constantWithScalar:&unk_1EC9F12F8 shape:268435488 dataType:1.0];

      id v173 = objc_loadWeakRetained((id *)&self->super._graph);
      v712 = (void *)v172;
      v174 = [(MPSGraphOperation *)self inputTensors];
      v175 = [v174 objectAtIndexedSubscript:0];
      v176 = NSString;
      v177 = [(MPSGraphOperation *)self name];
      v178 = [v176 stringWithFormat:@"%@/%@/square", v10, v177];
      v159 = [v173 squareWithTensor:v175 name:v178];

      id v179 = objc_loadWeakRetained((id *)&self->super._graph);
      v180 = NSString;
      v181 = [(MPSGraphOperation *)self name];
      v163 = v712;
      v182 = [v180 stringWithFormat:@"%@/%@/addition", v10, v181];
      v165 = [v179 additionWithPrimaryTensor:v712 secondaryTensor:v159 name:v182];

      id v166 = objc_loadWeakRetained((id *)&self->super._graph);
      v183 = NSString;
      v168 = [(MPSGraphOperation *)self name];
      v169 = [v183 stringWithFormat:@"%@/%@/division", v10, v168];
      uint64_t v170 = [v166 divisionWithPrimaryTensor:v719 secondaryTensor:v165 name:v169];
      goto LABEL_23;
    case 0x1DuLL:
      id v398 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v398 constantWithScalar:&unk_1EC9F1310 shape:268435488 dataType:1.0];

      id v399 = objc_loadWeakRetained((id *)&self->super._graph);
      v400 = [(MPSGraphOperation *)self inputTensors];
      v401 = [v400 objectAtIndexedSubscript:0];
      v402 = NSString;
      v403 = [(MPSGraphOperation *)self name];
      v404 = [v402 stringWithFormat:@"%@/%@/square", v10, v403];
      v123 = [v399 squareWithTensor:v401 name:v404];

      id v405 = objc_loadWeakRetained((id *)&self->super._graph);
      v406 = NSString;
      v407 = [(MPSGraphOperation *)self name];
      v408 = [v406 stringWithFormat:@"%@/%@/addition", v10, v407];
      v128 = [v405 additionWithPrimaryTensor:v706 secondaryTensor:v123 name:v408];

      id v409 = objc_loadWeakRetained((id *)&self->super._graph);
      v410 = NSString;
      v411 = [(MPSGraphOperation *)self name];
      v412 = [v410 stringWithFormat:@"%@/%@/rsqrt", v10, v411];
      v413 = [v409 reciprocalSquareRootWithTensor:v128 name:v412];

      id v414 = objc_loadWeakRetained((id *)&self->super._graph);
      v415 = NSString;
      v416 = [(MPSGraphOperation *)self name];
      v417 = [v415 stringWithFormat:@"%@/%@/multiplication", v10, v416];
      uint64_t v418 = [v414 multiplicationWithPrimaryTensor:v719 secondaryTensor:v413 name:v417];
      goto LABEL_81;
    case 0x1EuLL:
      id v527 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = [v527 constantWithScalar:&unk_1EC9F1328 shape:268435488 dataType:1.0];

      id v528 = objc_loadWeakRetained((id *)&self->super._graph);
      v529 = [(MPSGraphOperation *)self inputTensors];
      v530 = [v529 objectAtIndexedSubscript:0];
      v531 = NSString;
      v532 = [(MPSGraphOperation *)self name];
      v533 = [v531 stringWithFormat:@"%@/%@/square", v10, v532];
      v123 = [v528 squareWithTensor:v530 name:v533];

      id v534 = objc_loadWeakRetained((id *)&self->super._graph);
      v535 = NSString;
      v536 = [(MPSGraphOperation *)self name];
      v537 = [v535 stringWithFormat:@"%@/%@/subtraction", v10, v536];
      v128 = [v534 subtractionWithPrimaryTensor:v123 secondaryTensor:v706 name:v537];

      id v538 = objc_loadWeakRetained((id *)&self->super._graph);
      v539 = NSString;
      v540 = [(MPSGraphOperation *)self name];
      v541 = [v539 stringWithFormat:@"%@/%@/rsqrt", v10, v540];
      v413 = [v538 reciprocalSquareRootWithTensor:v128 name:v541];

      id v414 = objc_loadWeakRetained((id *)&self->super._graph);
      v542 = NSString;
      v416 = [(MPSGraphOperation *)self name];
      v417 = [v542 stringWithFormat:@"%@/%@/multiplication", v10, v416];
      uint64_t v418 = [v414 multiplicationWithPrimaryTensor:v719 secondaryTensor:v413 name:v417];
LABEL_81:
      id v11 = (id)v418;

LABEL_82:
LABEL_83:

      goto LABEL_88;
    case 0x1FuLL:
      id v151 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v152 = [v151 constantWithScalar:&unk_1EC9F1340 shape:268435488 dataType:1.0];

      id v153 = objc_loadWeakRetained((id *)&self->super._graph);
      v711 = (void *)v152;
      v154 = [(MPSGraphOperation *)self inputTensors];
      v155 = [v154 objectAtIndexedSubscript:0];
      v156 = NSString;
      v157 = [(MPSGraphOperation *)self name];
      v158 = [v156 stringWithFormat:@"%@/%@/square", v10, v157];
      v159 = [v153 squareWithTensor:v155 name:v158];

      id v160 = objc_loadWeakRetained((id *)&self->super._graph);
      v161 = NSString;
      v162 = [(MPSGraphOperation *)self name];
      v163 = v711;
      v164 = [v161 stringWithFormat:@"%@/%@/subtraction", v10, v162];
      v165 = [v160 subtractionWithPrimaryTensor:v159 secondaryTensor:v711 name:v164];

      id v166 = objc_loadWeakRetained((id *)&self->super._graph);
      v167 = NSString;
      v168 = [(MPSGraphOperation *)self name];
      v169 = [v167 stringWithFormat:@"%@/%@/division", v10, v168];
      uint64_t v170 = [v166 divisionWithPrimaryTensor:v719 secondaryTensor:v165 name:v169];
LABEL_23:
      id v11 = (id)v170;

      goto LABEL_118;
    case 0x20uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
      goto LABEL_118;
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
      v19 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v20 = [v19 constantWithScalar:&unk_1EC9F1358 shape:268435488 dataType:0.0];
      goto LABEL_106;
    case 0x24uLL:
      id v21 = objc_loadWeakRetained((id *)&self->super._graph);
      v22 = [(MPSGraphOperation *)self inputTensors];
      v23 = [v22 objectAtIndexedSubscript:0];
      v24 = NSString;
      v25 = [(MPSGraphOperation *)self name];
      v26 = [v24 stringWithFormat:@"%@/%@/square", v10, v25];
      uint64_t v27 = [v21 squareWithTensor:v23 name:v26];

      id v28 = objc_loadWeakRetained((id *)&self->super._graph);
      v29 = NSString;
      v706 = (void *)v27;
      v30 = [(MPSGraphOperation *)self name];
      v31 = [v29 stringWithFormat:@"%@/%@/negative", v10, v30];
      uint64_t v32 = [v28 negativeWithTensor:v27 name:v31];

      id v33 = objc_loadWeakRetained((id *)&self->super._graph);
      v34 = NSString;
      v695 = (void *)v32;
      v35 = [(MPSGraphOperation *)self name];
      v36 = [v34 stringWithFormat:@"%@/%@/negative", v10, v35];
      v37 = [v33 exponentWithTensor:v32 name:v36];

      id v38 = objc_loadWeakRetained((id *)&self->super._graph);
      v39 = [v38 constantWithScalar:&unk_1EC9F1370 shape:268435488 dataType:1.12837917];

      id v40 = objc_loadWeakRetained((id *)&self->super._graph);
      v41 = NSString;
      v42 = [(MPSGraphOperation *)self name];
      v43 = [v41 stringWithFormat:@"%@/%@/multiplication", v10, v42];
      v44 = [v40 multiplicationWithPrimaryTensor:v37 secondaryTensor:v39 name:v43];

      id v45 = objc_loadWeakRetained((id *)&self->super._graph);
      v46 = NSString;
      v47 = [(MPSGraphOperation *)self name];
      v48 = [v46 stringWithFormat:@"%@/%@/multiplication_1", v10, v47];
      id v11 = [v45 multiplicationWithPrimaryTensor:v719 secondaryTensor:v44 name:v48];

LABEL_76:
LABEL_87:

LABEL_88:
      goto LABEL_118;
    case 0x27uLL:
      v451 = [(MPSGraphOperation *)self inputTensors];
      v452 = [v451 objectAtIndexedSubscript:0];
      [v452 dataType];

      v453 = [(MPSGraphOperation *)self inputTensors];
      v454 = [v453 objectAtIndexedSubscript:0];
      int v455 = [v454 dataType];

      if ((v455 & 0x1000000) != 0 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      goto LABEL_69;
    case 0x28uLL:
      v442 = [(MPSGraphOperation *)self inputTensors];
      v443 = [v442 objectAtIndexedSubscript:0];
      int v444 = [v443 dataType];

      if ((v444 & 0x1000000) == 0)
      {
LABEL_69:
        id v11 = v719;
        goto LABEL_118;
      }
      v445 = &self->super._graph;
      id v446 = objc_loadWeakRetained((id *)&self->super._graph);
      v447 = [(MPSGraphOperation *)self inputTensors];
      v448 = [v447 objectAtIndexedSubscript:0];
      int v449 = [v448 dataType];
      uint64_t v450 = 268435472;
      if (v449 == 285212736)
      {
        uint64_t v450 = 268435488;
      }
      else if (v449 != 285212704)
      {
        llvm::llvm_unreachable_internal((llvm *)"unsupported complex type", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphUtilities.mm", (const char *)0x6D);
      }
      v664 = [v446 constantWithScalar:&unk_1EC9F13A0 shape:v450 dataType:0.0];

      id v673 = objc_loadWeakRetained((id *)&self->super._graph);
      v674 = [v719 shape];
      v675 = NSString;
      v676 = [(MPSGraphOperation *)self name];
      v677 = [v675 stringWithFormat:@"%@/%@/broadcastZero", v10, v676];
      v670 = [v673 broadcastTensor:v664 toShape:v674 name:v677];

      id v671 = objc_loadWeakRetained((id *)v445);
      uint64_t v672 = [v671 complexTensorWithRealTensor:v719 imaginaryTensor:v670 name:v10];
      goto LABEL_125;
    case 0x29uLL:
      v439 = [(MPSGraphOperation *)self inputTensors];
      v440 = [v439 objectAtIndexedSubscript:0];
      int v441 = [v440 dataType];

      if ((v441 & 0x1000000) != 0)
      {
        v598 = &self->super._graph;
        id v599 = objc_loadWeakRetained((id *)&self->super._graph);
        v600 = [(MPSGraphOperation *)self inputTensors];
        v601 = [v600 objectAtIndexedSubscript:0];
        int v602 = [v601 dataType];
        uint64_t v603 = 268435472;
        if (v602 == 285212736)
        {
          uint64_t v603 = 268435488;
        }
        else if (v602 != 285212704)
        {
          llvm::llvm_unreachable_internal((llvm *)"unsupported complex type", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphUtilities.mm", (const char *)0x6D);
        }
        v664 = [v599 constantWithScalar:&unk_1EC9F13B8 shape:v603 dataType:0.0];

        id v665 = objc_loadWeakRetained((id *)&self->super._graph);
        v666 = [v719 shape];
        v667 = NSString;
        v668 = [(MPSGraphOperation *)self name];
        v669 = [v667 stringWithFormat:@"%@/%@/broadcastZero", v10, v668];
        v670 = [v665 broadcastTensor:v664 toShape:v666 name:v669];

        id v671 = objc_loadWeakRetained((id *)v598);
        uint64_t v672 = [v671 complexTensorWithRealTensor:v670 imaginaryTensor:v719 name:v10];
LABEL_125:
        id v11 = (id)v672;

        goto LABEL_118;
      }
      if ((MTLReportFailureTypeEnabled() & 1) == 0) {
        goto LABEL_109;
      }
      goto LABEL_108;
    case 0x2AuLL:
      id v114 = v719;
      v543 = [(MPSGraphOperation *)self inputTensors];
      [v543 objectAtIndexedSubscript:a5];

      v544 = [(MPSGraphOperation *)self inputTensors];
      id v545 = [v544 objectAtIndexedSubscript:a5];

      if (v545 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      goto LABEL_85;
    case 0x2BuLL:
      id v114 = v719;
      v305 = [(MPSGraphOperation *)self inputTensors];
      [v305 objectAtIndexedSubscript:a5];

      v306 = [(MPSGraphOperation *)self inputTensors];
      id v307 = [v306 objectAtIndexedSubscript:a5];

      if (v307 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      if (a5 == 1)
      {
        id v308 = objc_loadWeakRetained((id *)&self->super._graph);
        v309 = NSString;
        v310 = [(MPSGraphOperation *)self name];
        v311 = [v309 stringWithFormat:@"%@/%@/negative", v10, v310];
        uint64_t v312 = [v308 negativeWithTensor:v114 name:v311];

        id v114 = (id)v312;
      }
      goto LABEL_85;
    case 0x2CuLL:
      id v369 = v719;
      v370 = [(MPSGraphOperation *)self inputTensors];
      [v370 objectAtIndexedSubscript:a5];

      v371 = [(MPSGraphOperation *)self inputTensors];
      id v372 = [v371 objectAtIndexedSubscript:a5];

      if (v372 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v373 = objc_loadWeakRetained((id *)&self->super._graph);
      v374 = [(MPSGraphOperation *)self inputTensors];
      v375 = [v374 objectAtIndexedSubscript:a5 == 0];
      v376 = NSString;
      v377 = [(MPSGraphOperation *)self name];
      v378 = [v376 stringWithFormat:@"%@/%@/multiplication", v10, v377];
      v379 = [v373 multiplicationWithPrimaryTensor:v369 secondaryTensor:v375 name:v378];

      uint64_t v380 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v379 inputIndex:a5 name:v10];
      goto LABEL_97;
    case 0x2DuLL:
      id v572 = v719;
      v573 = [(MPSGraphOperation *)self inputTensors];
      [v573 objectAtIndexedSubscript:a5];

      v574 = [(MPSGraphOperation *)self inputTensors];
      id v575 = [v574 objectAtIndexedSubscript:a5];

      if (v575 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v576 = objc_loadWeakRetained((id *)&self->super._graph);
      [(MPSGraphOperation *)self inputTensors];
      if (a5) {
        v577 = {;
      }
        v578 = [v577 objectAtIndexedSubscript:1];
        v579 = NSString;
        v580 = [(MPSGraphOperation *)self name];
        v581 = [v579 stringWithFormat:@"%@/%@/square", v10, v580];
        uint64_t v716 = [v576 squareWithTensor:v578 name:v581];

        id v582 = objc_loadWeakRetained((id *)&self->super._graph);
        v583 = [(MPSGraphOperation *)self inputTensors];
        v584 = [v583 objectAtIndexedSubscript:0];
        v585 = NSString;
        v586 = [(MPSGraphOperation *)self name];
        v587 = [v585 stringWithFormat:@"%@/%@/division", v10, v586];
        uint64_t v702 = [v582 divisionWithPrimaryTensor:v584 secondaryTensor:v716 name:v587];

        id v588 = objc_loadWeakRetained((id *)&self->super._graph);
        v589 = NSString;
        v590 = [(MPSGraphOperation *)self name];
        v591 = [v589 stringWithFormat:@"%@/%@/multiplication", v10, v590];
        uint64_t v592 = [v588 multiplicationWithPrimaryTensor:v572 secondaryTensor:v702 name:v591];

        v593 = objc_loadWeakRetained((id *)&self->super._graph);
        v594 = NSString;
        v595 = [(MPSGraphOperation *)self name];
        v596 = (void *)v702;
        v597 = [v594 stringWithFormat:@"%@/%@/negative", v10, v595];
        v19 = [v593 negativeWithTensor:v592 name:v597];
        id v572 = (id)v592;
        id v576 = (id)v716;
      }
      else {
        v596 = {;
      }
        v593 = [v596 objectAtIndexedSubscript:1];
        v635 = NSString;
        v595 = [(MPSGraphOperation *)self name];
        v597 = [v635 stringWithFormat:@"%@/%@/division", v10, v595];
        v19 = [v576 divisionWithPrimaryTensor:v572 secondaryTensor:v593 name:v597];
      }

      uint64_t v20 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v19 inputIndex:a5 name:v10];
      goto LABEL_106;
    case 0x2EuLL:
      id v114 = v719;
      v249 = [(MPSGraphOperation *)self inputTensors];
      [v249 objectAtIndexedSubscript:a5];

      v250 = [(MPSGraphOperation *)self inputTensors];
      id v251 = [v250 objectAtIndexedSubscript:a5];

      if (v251 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      if (a5 == 1)
      {
        id v693 = objc_loadWeakRetained((id *)&self->super._graph);
        v700 = v114;
        v686 = [(MPSGraphOperation *)self inputTensors];
        v252 = [v686 objectAtIndexedSubscript:0];
        v253 = [(MPSGraphOperation *)self inputTensors];
        v254 = [v253 objectAtIndexedSubscript:1];
        v255 = NSString;
        v256 = [(MPSGraphOperation *)self name];
        v257 = [v255 stringWithFormat:@"%@/%@/division", v10, v256];
        v715 = [v693 divisionWithPrimaryTensor:v252 secondaryTensor:v254 name:v257];

        id v258 = objc_loadWeakRetained((id *)&self->super._graph);
        v259 = NSString;
        v260 = [(MPSGraphOperation *)self name];
        v261 = [v259 stringWithFormat:@"%@/%@/floor", v10, v260];
        v262 = [v258 floorWithTensor:v715 name:v261];

        id v263 = objc_loadWeakRetained((id *)&self->super._graph);
        v264 = NSString;
        v265 = [(MPSGraphOperation *)self name];
        v266 = [v264 stringWithFormat:@"%@/%@/multiplication", v10, v265];
        v267 = [v263 multiplicationWithPrimaryTensor:v700 secondaryTensor:v262 name:v266];

        id v268 = objc_loadWeakRetained((id *)&self->super._graph);
        v269 = NSString;
        v270 = [(MPSGraphOperation *)self name];
        v271 = [v269 stringWithFormat:@"%@/%@/negative", v10, v270];
        id v114 = [v268 negativeWithTensor:v267 name:v271];
      }
LABEL_85:
      id v11 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v114 inputIndex:a5 name:v10];
      goto LABEL_117;
    case 0x2FuLL:
      id v49 = v719;
      v50 = [(MPSGraphOperation *)self inputTensors];
      [v50 objectAtIndexedSubscript:a5];

      v51 = [(MPSGraphOperation *)self inputTensors];
      id v52 = [v51 objectAtIndexedSubscript:a5];

      if (v52 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v53 = objc_loadWeakRetained((id *)&self->super._graph);
      v54 = v53;
      if (a5)
      {
        v55 = [(MPSGraphOperation *)self inputTensors];
        v56 = [v55 objectAtIndexedSubscript:0];
        v57 = NSString;
        v58 = [(MPSGraphOperation *)self name];
        v59 = [v57 stringWithFormat:@"%@/%@/logarithm", v10, v58];
        uint64_t v707 = [v54 logarithmWithTensor:v56 name:v59];

        id v696 = objc_loadWeakRetained((id *)&self->super._graph);
        v60 = NSString;
        v61 = [(MPSGraphOperation *)self name];
        v62 = (void *)v707;
        v63 = [v60 stringWithFormat:@"%@/%@/multiplication", v10, v61];
        v64 = [v696 multiplicationWithPrimaryTensor:v49 secondaryTensor:v707 name:v63];

        id v65 = objc_loadWeakRetained((id *)&self->super._graph);
        v689 = [(MPSGraphOperation *)self outputTensors];
        v66 = [v689 objectAtIndexedSubscript:0];
        v67 = NSString;
        v68 = [(MPSGraphOperation *)self name];
        v69 = [v67 stringWithFormat:@"%@/%@/multiplication2", v10, v68];
        [v65 multiplicationWithPrimaryTensor:v64 secondaryTensor:v66 name:v69];
      }
      else
      {
        uint64_t v604 = [v53 constantWithScalar:&unk_1EC9F1388 shape:268435488 dataType:1.0];

        id v605 = objc_loadWeakRetained((id *)&self->super._graph);
        v717 = (void *)v604;
        v606 = [(MPSGraphOperation *)self inputTensors];
        v607 = [v606 objectAtIndexedSubscript:1];
        v608 = NSString;
        v609 = [(MPSGraphOperation *)self name];
        v610 = [v608 stringWithFormat:@"%@/%@/subraction", v10, v609];
        uint64_t v703 = [v605 subtractionWithPrimaryTensor:v607 secondaryTensor:v717 name:v610];

        id v611 = objc_loadWeakRetained((id *)&self->super._graph);
        v612 = [(MPSGraphOperation *)self inputTensors];
        v613 = [v612 objectAtIndexedSubscript:0];
        v614 = NSString;
        v615 = [(MPSGraphOperation *)self name];
        v616 = [v614 stringWithFormat:@"%@/%@/power", v10, v615];
        v689 = [v611 powerWithPrimaryTensor:v613 secondaryTensor:v703 name:v616];

        id v617 = objc_loadWeakRetained((id *)&self->super._graph);
        v680 = [(MPSGraphOperation *)self inputTensors];
        v618 = [v680 objectAtIndexedSubscript:1];
        v619 = NSString;
        v620 = [(MPSGraphOperation *)self name];
        v621 = [v619 stringWithFormat:@"%@/%@/multiplication", v10, v620];
        v64 = [v617 multiplicationWithPrimaryTensor:v49 secondaryTensor:v618 name:v621];

        v66 = objc_loadWeakRetained((id *)&self->super._graph);
        v622 = NSString;
        v68 = [(MPSGraphOperation *)self name];
        id v65 = (id)v703;
        v62 = v717;
        v69 = [v622 stringWithFormat:@"%@/%@/multiplication2", v10, v68];
        [v66 multiplicationWithPrimaryTensor:v689 secondaryTensor:v64 name:v69];
      v379 = };

      uint64_t v380 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v379 inputIndex:a5 name:v10];
LABEL_97:
      id v11 = (id)v380;

      goto LABEL_118;
    case 0x30uLL:
      id v272 = v719;
      v273 = [(MPSGraphOperation *)self inputTensors];
      v708 = v272;
      [v273 objectAtIndexedSubscript:a5];

      v274 = [(MPSGraphOperation *)self inputTensors];
      id v275 = [v274 objectAtIndexedSubscript:a5];

      if (v275 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v74 = objc_loadWeakRetained((id *)&self->super._graph);
      v690 = [(MPSGraphOperation *)self inputTensors];
      [v690 objectAtIndexedSubscript:0];
      if (a5) {
        v276 = {;
      }
        v277 = [(MPSGraphOperation *)self inputTensors];
        v278 = [v277 objectAtIndexedSubscript:1];
        v279 = NSString;
        v280 = [(MPSGraphOperation *)self name];
        v281 = [v279 stringWithFormat:@"%@/%@/greaterThanOrEqualTo", v10, v280];
        v697 = [v74 greaterThanOrEqualToWithPrimaryTensor:v276 secondaryTensor:v278 name:v281];
      }
      else {
        v629 = {;
      }
        v630 = [(MPSGraphOperation *)self inputTensors];
        v631 = [v630 objectAtIndexedSubscript:1];
        v632 = NSString;
        v633 = [(MPSGraphOperation *)self name];
        v634 = [v632 stringWithFormat:@"%@/%@/lessThan", v10, v633];
        v697 = [v74 lessThanWithPrimaryTensor:v629 secondaryTensor:v631 name:v634];
      }
      goto LABEL_99;
    case 0x31uLL:
      id v70 = v719;
      v71 = [(MPSGraphOperation *)self inputTensors];
      v708 = v70;
      [v71 objectAtIndexedSubscript:a5];

      v72 = [(MPSGraphOperation *)self inputTensors];
      id v73 = [v72 objectAtIndexedSubscript:a5];

      if (v73 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v74 = objc_loadWeakRetained((id *)&self->super._graph);
      v690 = [(MPSGraphOperation *)self inputTensors];
      [v690 objectAtIndexedSubscript:0];
      if (a5) {
        v75 = {;
      }
        v76 = [(MPSGraphOperation *)self inputTensors];
        v77 = [v76 objectAtIndexedSubscript:1];
        v78 = NSString;
        v79 = [(MPSGraphOperation *)self name];
        v80 = [v78 stringWithFormat:@"%@/%@/lessThanOrEqualTo", v10, v79];
        v697 = [v74 lessThanOrEqualToWithPrimaryTensor:v75 secondaryTensor:v77 name:v80];
      }
      else {
        v623 = {;
      }
        v624 = [(MPSGraphOperation *)self inputTensors];
        v625 = [v624 objectAtIndexedSubscript:1];
        v626 = NSString;
        v627 = [(MPSGraphOperation *)self name];
        v628 = [v626 stringWithFormat:@"%@/%@/greaterThan", v10, v627];
        v697 = [v74 greaterThanWithPrimaryTensor:v623 secondaryTensor:v625 name:v628];
      }
LABEL_99:

      id v81 = objc_loadWeakRetained((id *)&self->super._graph);
      v82 = NSString;
      v83 = [(MPSGraphOperation *)self name];
      v84 = [v82 stringWithFormat:@"%@/%@/multiplication", v10, v83];
      v19 = [v81 multiplicationWithPrimaryTensor:v708 secondaryTensor:v697 name:v84];

      uint64_t v20 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v19 inputIndex:a5 name:v10];
      goto LABEL_106;
    case 0x3EuLL:
      id v699 = v719;
      v195 = [(MPSGraphOperation *)self inputTensors];
      [v195 objectAtIndexedSubscript:a5];

      v196 = [(MPSGraphOperation *)self inputTensors];
      id v197 = [v196 objectAtIndexedSubscript:a5];

      if (v197 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v198 = objc_loadWeakRetained((id *)&self->super._graph);
      v199 = [(MPSGraphOperation *)self inputTensors];
      v200 = [v199 objectAtIndexedSubscript:0];
      v201 = NSString;
      v202 = [(MPSGraphOperation *)self name];
      v203 = [v201 stringWithFormat:@"%@/%@/square", v10, v202];
      uint64_t v204 = [v198 squareWithTensor:v200 name:v203];

      id v205 = objc_loadWeakRetained((id *)&self->super._graph);
      v692 = (void *)v204;
      v206 = [(MPSGraphOperation *)self inputTensors];
      v207 = [v206 objectAtIndexedSubscript:1];
      v208 = NSString;
      v209 = [(MPSGraphOperation *)self name];
      v210 = [v208 stringWithFormat:@"%@/%@/square_1", v10, v209];
      v713 = [v205 squareWithTensor:v207 name:v210];

      id v211 = objc_loadWeakRetained((id *)&self->super._graph);
      v212 = NSString;
      v213 = [(MPSGraphOperation *)self name];
      v214 = [v212 stringWithFormat:@"%@/%@/add", v10, v213];
      uint64_t v215 = [v211 additionWithPrimaryTensor:v204 secondaryTensor:v713 name:v214];

      id v216 = objc_loadWeakRetained((id *)&self->super._graph);
      v685 = (void *)v215;
      v217 = [(MPSGraphOperation *)self inputTensors];
      if (a5)
      {
        v218 = [v217 objectAtIndexedSubscript:1];
        v219 = NSString;
        v220 = [(MPSGraphOperation *)self name];
        v221 = [v219 stringWithFormat:@"%@/%@/divide", v10, v220];
        v222 = [v216 divisionWithPrimaryTensor:v218 secondaryTensor:v215 name:v221];

        id v223 = objc_loadWeakRetained((id *)&self->super._graph);
        v224 = NSString;
        v225 = [(MPSGraphOperation *)self name];
        v226 = [v224 stringWithFormat:@"%@/%@/multiplication", v10, v225];
        v227 = [v223 multiplicationWithPrimaryTensor:v699 secondaryTensor:v222 name:v226];

        id v228 = objc_loadWeakRetained((id *)&self->super._graph);
        v229 = NSString;
        v230 = [(MPSGraphOperation *)self name];
        v231 = [v229 stringWithFormat:@"%@/%@/negative", v10, v230];
        v232 = [v228 negativeWithTensor:v227 name:v231];
      }
      else
      {
        v636 = [v217 objectAtIndexedSubscript:0];
        v637 = NSString;
        v638 = [(MPSGraphOperation *)self name];
        v639 = [v637 stringWithFormat:@"%@/%@/divide", v10, v638];
        v222 = [v216 divisionWithPrimaryTensor:v636 secondaryTensor:v215 name:v639];

        id v228 = objc_loadWeakRetained((id *)&self->super._graph);
        v640 = NSString;
        v230 = [(MPSGraphOperation *)self name];
        v231 = [v640 stringWithFormat:@"%@/%@/multiplication", v10, v230];
        v232 = [v228 multiplicationWithPrimaryTensor:v699 secondaryTensor:v222 name:v231];
        v227 = v699;
      }

      id v11 = [(MPSGraphArithmeticOp *)self broadcastGradWithOutputGradient:v232 inputIndex:a5 name:v10];

      goto LABEL_118;
    case 0x44uLL:
      if (a5 == 1)
      {
        v19 = objc_loadWeakRetained((id *)&self->super._graph);
        uint64_t v20 = [v19 imaginaryPartOfTensor:v719 name:v10];
        goto LABEL_106;
      }
      if (!a5)
      {
        v19 = objc_loadWeakRetained((id *)&self->super._graph);
        uint64_t v20 = [v19 realPartOfTensor:v719 name:v10];
LABEL_106:
        id v11 = (id)v20;

        goto LABEL_118;
      }
      if (MTLReportFailureTypeEnabled())
      {
LABEL_108:
        MTLReportFailure();
        id v11 = 0;
      }
      else
      {
LABEL_109:
        id v11 = 0;
      }
      goto LABEL_118;
    case 0x45uLL:
      id v138 = v719;
      v139 = [(MPSGraphOperation *)self inputTensors];
      [v139 objectAtIndexedSubscript:a5];

      v140 = [(MPSGraphOperation *)self inputTensors];
      id v141 = [v140 objectAtIndexedSubscript:a5];

      if (v141 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      if (a5 == 1)
      {
        id v641 = objc_loadWeakRetained((id *)&self->super._graph);
        v710 = [v641 constantWithScalar:&unk_1EC9F13E8 shape:268435488 dataType:0.0];

        id v642 = objc_loadWeakRetained((id *)&self->super._graph);
        v144 = [(MPSGraphOperation *)self inputTensors];
        v145 = [v144 objectAtIndexedSubscript:2];
        v643 = NSString;
        v147 = [(MPSGraphOperation *)self name];
        v148 = [v643 stringWithFormat:@"%@/%@/select", v10, v147];
        v149 = v642;
        uint64_t v150 = [v642 selectWithPredicateTensor:v145 truePredicateTensor:v138 falsePredicateTensor:v710 name:v148];
        goto LABEL_111;
      }
      if (!a5)
      {
        id v142 = objc_loadWeakRetained((id *)&self->super._graph);
        v710 = [v142 constantWithScalar:&unk_1EC9F13D0 shape:268435488 dataType:0.0];

        id v143 = objc_loadWeakRetained((id *)&self->super._graph);
        v144 = [(MPSGraphOperation *)self inputTensors];
        v145 = [v144 objectAtIndexedSubscript:2];
        v146 = NSString;
        v147 = [(MPSGraphOperation *)self name];
        v148 = [v146 stringWithFormat:@"%@/%@/select", v10, v147];
        v149 = v143;
        uint64_t v150 = [v143 selectWithPredicateTensor:v145 truePredicateTensor:v710 falsePredicateTensor:v138 name:v148];
LABEL_111:
        v644 = (void *)v150;

        v645 = [(MPSGraphArithmeticOp *)self broadcastGradTernaryWithOutputGradient:v644 inputIndex:a5 name:v10];

        id v11 = v645;
        goto LABEL_118;
      }
      id v11 = 0;

LABEL_118:
      return v11;
    case 0x46uLL:
      id v691 = v719;
      v85 = [(MPSGraphOperation *)self inputTensors];
      [v85 objectAtIndexedSubscript:a5];

      v86 = [(MPSGraphOperation *)self inputTensors];
      id v87 = [v86 objectAtIndexedSubscript:a5];

      if (v87 != v718 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v88 = objc_loadWeakRetained((id *)&self->super._graph);
      uint64_t v709 = [v88 constantWithScalar:&unk_1EC9F1400 shape:268435488 dataType:0.0];

      v89 = &self->super._graph;
      if (a5 == 1)
      {
        id v687 = objc_loadWeakRetained((id *)v89);
        v681 = [(MPSGraphOperation *)self inputTensors];
        v646 = [v681 objectAtIndexedSubscript:0];
        v647 = [(MPSGraphOperation *)self inputTensors];
        v648 = [v647 objectAtIndexedSubscript:1];
        v649 = NSString;
        v650 = [(MPSGraphOperation *)self name];
        v651 = [v649 stringWithFormat:@"%@/%@/lessThan", v10, v650];
        uint64_t v704 = [v687 lessThanWithPrimaryTensor:v646 secondaryTensor:v648 name:v651];

        id v106 = objc_loadWeakRetained((id *)&self->super._graph);
        v652 = NSString;
        v108 = [(MPSGraphOperation *)self name];
        v653 = v652;
        v111 = v691;
        v115 = (void *)v704;
        id v114 = (id)v709;
        v109 = [v653 stringWithFormat:@"%@/%@/select", v10, v108];
        uint64_t v654 = [v106 selectWithPredicateTensor:v704 truePredicateTensor:v691 falsePredicateTensor:v709 name:v109];
      }
      else
      {
        if (!a5)
        {
          id v683 = objc_loadWeakRetained((id *)v89);
          v678 = [(MPSGraphOperation *)self inputTensors];
          v90 = [v678 objectAtIndexedSubscript:0];
          v91 = [(MPSGraphOperation *)self inputTensors];
          v92 = [v91 objectAtIndexedSubscript:1];
          v93 = NSString;
          v94 = [(MPSGraphOperation *)self name];
          v95 = [v93 stringWithFormat:@"%@/%@/lessThan", v10, v94];
          uint64_t v698 = [v683 lessThanWithPrimaryTensor:v90 secondaryTensor:v92 name:v95];

          id v96 = objc_loadWeakRetained((id *)&self->super._graph);
          v679 = [(MPSGraphOperation *)self inputTensors];
          v97 = [v679 objectAtIndexedSubscript:0];
          v98 = [(MPSGraphOperation *)self inputTensors];
          v99 = [v98 objectAtIndexedSubscript:2];
          v100 = NSString;
          v101 = [(MPSGraphOperation *)self name];
          v102 = [v100 stringWithFormat:@"%@/%@/greaterThan", v10, v101];
          uint64_t v684 = [v96 lessThanWithPrimaryTensor:v97 secondaryTensor:v99 name:v102];

          id v103 = objc_loadWeakRetained((id *)&self->super._graph);
          v104 = NSString;
          v105 = [(MPSGraphOperation *)self name];
          id v106 = (id)v684;
          v107 = [v104 stringWithFormat:@"%@/%@/logicalOR", v10, v105];
          v108 = [v103 logicalORWithPrimaryTensor:v698 secondaryTensor:v684 name:v107];

          v109 = objc_loadWeakRetained((id *)&self->super._graph);
          v110 = NSString;
          v111 = [(MPSGraphOperation *)self name];
          v112 = [v110 stringWithFormat:@"%@/%@/select", v10, v111];
          v113 = [v109 selectWithPredicateTensor:v108 truePredicateTensor:v709 falsePredicateTensor:v691 name:v112];

          v115 = (void *)v698;
          id v114 = (id)v709;
          goto LABEL_116;
        }
        id v688 = objc_loadWeakRetained((id *)v89);
        v682 = [(MPSGraphOperation *)self inputTensors];
        v655 = [v682 objectAtIndexedSubscript:0];
        v656 = [(MPSGraphOperation *)self inputTensors];
        v657 = [v656 objectAtIndexedSubscript:2];
        v658 = NSString;
        v659 = [(MPSGraphOperation *)self name];
        v660 = [v658 stringWithFormat:@"%@/%@/greaterThan", v10, v659];
        uint64_t v705 = [v688 lessThanWithPrimaryTensor:v655 secondaryTensor:v657 name:v660];

        id v106 = objc_loadWeakRetained((id *)&self->super._graph);
        v661 = NSString;
        v108 = [(MPSGraphOperation *)self name];
        v662 = v661;
        v111 = v691;
        v115 = (void *)v705;
        id v114 = (id)v709;
        v109 = [v662 stringWithFormat:@"%@/%@/select", v10, v108];
        uint64_t v654 = [v106 selectWithPredicateTensor:v705 truePredicateTensor:v691 falsePredicateTensor:v709 name:v109];
      }
      v113 = (void *)v654;
LABEL_116:

      id v11 = [(MPSGraphArithmeticOp *)self broadcastGradTernaryWithOutputGradient:v113 inputIndex:a5 name:v10];

LABEL_117:
      goto LABEL_118;
    default:
      __assert_rtn("-[MPSGraphArithmeticOp partialDerivativeForInputTensor:incomingGradient:inputIndex:name:]", "MPSGraphArithmeticOps.mm", 1460, "0 && \"unimplemented math op\"");
  }
}

@end