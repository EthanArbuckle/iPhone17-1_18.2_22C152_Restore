@interface ANSTTensorData
+ (ANSTTensorData)new;
- (ANSTTensorData)init;
- (ANSTTensorData)initWithDescriptor:(id)a3 dataPointer:(void *)a4 length:(unint64_t)a5 deallocator:(id)a6 error:(id *)a7;
- (ANSTTensorDescriptor)tensorDescriptor;
- (BOOL)performDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)performMutableDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation ANSTTensorData

- (ANSTTensorData)init
{
  result = (ANSTTensorData *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (ANSTTensorData)new
{
  result = (ANSTTensorData *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTTensorData)initWithDescriptor:(id)a3 dataPointer:(void *)a4 length:(unint64_t)a5 deallocator:(id)a6 error:(id *)a7
{
  v34[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)ANSTTensorData;
  v16 = [(ANSTTensorData *)&v32 init];
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v17 = objc_msgSend_copy(v12, v14, v15);
  tensorDescriptor = v16->_tensorDescriptor;
  v16->_tensorDescriptor = (ANSTTensorDescriptor *)v17;

  v16->_dataPointer = a4;
  v16->_unint64_t length = a5;
  if (v13)
  {
    v21 = objc_msgSend_copy(v13, v19, v20);
    uint64_t v22 = MEMORY[0x24C5491F0]();
    id deallocator = v16->_deallocator;
    v16->_id deallocator = (id)v22;
  }
  else
  {
    v21 = v16->_deallocator;
    v16->_id deallocator = 0;
  }

  unint64_t length = v16->_length;
  if (length < objc_msgSend__minimumContiguousLength(v16->_tensorDescriptor, v25, v26))
  {
    if (a7)
    {
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F07F80];
      v34[0] = @"Tensor data length does not satisfy its descriptor's minimum contiguous length.";
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v34, &v33, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, @"ANSTErrorDomain", 12, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
LABEL_8:
    a7 = v16;
  }

  return (ANSTTensorData *)a7;
}

- (void)dealloc
{
  if (self->_dataPointer)
  {
    id deallocator = (void (**)(void))self->_deallocator;
    if (deallocator) {
      deallocator[2]();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)ANSTTensorData;
  [(ANSTTensorData *)&v4 dealloc];
}

- (ANSTTensorDescriptor)tensorDescriptor
{
  return self->_tensorDescriptor;
}

- (BOOL)performDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)performMutableDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
  objc_storeStrong((id *)&self->_tensorDescriptor, 0);
}

@end