@interface MPSGraphTensor
- (MPSDataType)dataType;
- (MPSGraphOperation)operation;
- (MPSShape)shape;
- (NSString)name;
- (Value)value;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5;
- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 name:(id)a6;
- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 parentBlock:(id)a6 name:(id)a7;
- (id)initTensorWithValue:(Value)a3 graph:(id)a4;
- (unint64_t)index;
@end

@implementation MPSGraphTensor

- (id)initTensorWithValue:(Value)a3 graph:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphTensor;
  v7 = [(MPSGraphTensor *)&v12 init];
  uint64_t v8 = getMPSShapeFromMLIR((uint64_t **)(*((void *)a3.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  shape = v7->_shape;
  v7->_shape = (NSArray *)v8;

  v7->_value = a3;
  objc_storeWeak((id *)&v7->_graph, v6);
  name = v7->_name;
  v7->_name = (NSString *)@"UndefinedName";

  objc_storeWeak((id *)&v7->_operation, 0);
  v7->_dataType = getMPSDataType((void *)(*((void *)a3.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  if (qword_1E8EBF1D0 != -1) {
    dispatch_once(&qword_1E8EBF1D0, &__block_literal_global_3);
  }
  v7->_index = atomic_fetch_add((atomic_uint *volatile)_MergedGlobals_5, 1u);

  return v7;
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5
{
  return [(MPSGraphTensor *)self initTensorWithOperation:a3 value:a4.impl graph:a5 name:0];
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  objc_super v12 = [(MPSGraphTensor *)self initTensorWithValue:a4.impl graph:a5];
  objc_storeWeak(v12 + 2, v10);
  if (v11) {
    objc_storeStrong(v12 + 8, a6);
  }

  return v12;
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 parentBlock:(id)a6 name:(id)a7
{
  id v12 = a6;
  v13 = [(MPSGraphTensor *)self initTensorWithOperation:a3 value:a4.impl graph:a5 name:a7];
  objc_storeWeak(v13 + 4, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)debugDescription
{
  v19[0] = 0;
  v19[1] = 0;
  uint64_t v20 = 0;
  int v11 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  int v17 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  id v10 = &unk_1EC9A38B8;
  v18 = v19;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v10, 0, 0, 0);
  mlir::Value::print((mlir::Value *)&self->_value, (llvm::raw_ostream *)&v10);
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphTensor;
  v4 = [(MPSGraphTensor *)&v9 debugDescription];
  v5 = v18;
  if (*((char *)v18 + 23) < 0) {
    v5 = *v18;
  }
  id v6 = [(NSArray *)self->_shape debugDescription];
  v7 = [v3 stringWithFormat:@"%@ : \n\nIR: %s \nShape: %@\n", v4, v5, v6];

  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v10);
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[0]);
  }

  return v7;
}

- (MPSGraphOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);

  return (MPSGraphOperation *)WeakRetained;
}

- (unint64_t)index
{
  return self->_index;
}

- (Value)value
{
  return self->_value;
}

- (MPSShape)shape
{
  return self->_shape;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_destroyWeak((id *)&self->_parentBlock);
  objc_destroyWeak((id *)&self->_graph);

  objc_destroyWeak((id *)&self->_operation);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end