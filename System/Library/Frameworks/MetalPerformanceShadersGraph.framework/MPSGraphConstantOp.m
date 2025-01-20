@interface MPSGraphConstantOp
- (MPSGraphConstantOp)initWithGraph:(id)a3 data:(id)a4 shape:(id)a5 dataType:(unsigned int)a6 isSplat:(BOOL)a7 name:(id)a8;
- (NSArray)shape;
- (unsigned)dataType;
- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7;
@end

@implementation MPSGraphConstantOp

- (MPSGraphConstantOp)initWithGraph:(id)a3 data:(id)a4 shape:(id)a5 dataType:(unsigned int)a6 isSplat:(BOOL)a7 name:(id)a8
{
  v14 = (NSData *)a4;
  objc_storeStrong((id *)&self->_shape, a5);
  id v15 = a5;
  id v16 = a8;
  id v17 = a3;
  self->_dataType = a6;
  data = self->_data;
  self->_data = v14;
  v19 = v14;

  self->_isSplat = a7;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphConstantOp;
  v20 = [(MPSGraphOperation *)&v22 initWithGraph:v17 inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] name:v16];

  return v20;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10 = a7;
  mpsFileLoc("-[MPSGraphConstantOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  uint64_t v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ConstantOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0xA5u, v10);
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)self->_dataType);
  if (!*MLIRType)
  {
    id v16 = "abstractType && \"Malformed type storage object.\"";
    int v17 = 160;
    v18 = "TypeSupport.h";
    v19 = "getAbstractType";
    goto LABEL_8;
  }
  if ((_UNKNOWN *)(*MLIRType)[17] != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
  {
    id v16 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
    int v17 = 566;
    v18 = "Casting.h";
    v19 = "cast";
LABEL_8:
    __assert_rtn(v19, v18, v17, v16);
  }
  uint64_t ConstantOp = createConstantOp((mlir::OpBuilder *)a3, v11, self->_data, MLIRType, self->_isSplat);
  data = self->_data;
  self->_data = 0;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&ConstantOp);
  return DefiningOp;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end