@interface REMeshAttributeDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4;
- (REMeshAttributeDescriptor)initWithCoder:(id)a3;
- (REMeshAttributeDescriptor)initWithMeshAssetBuffer:(const void *)a3 payloadBuilder:(void *)a4;
- (REMeshAttributeDescriptor)initWithPayloadOffset:(unsigned int)a3 count:(unsigned int)a4 format:(unint64_t)a5 stepFunction:(unint64_t)a6 stride:(unsigned int)a7;
- (REMeshAttributeDescriptor)initWithVertexAttributeDescriptor:(const VertexAttributeDescriptor *)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5;
- (unint64_t)bufferSize;
- (unint64_t)estimateContainerSize;
- (unint64_t)format;
- (unint64_t)stepFunction;
- (unsigned)count;
- (unsigned)payloadOffset;
- (unsigned)stride;
- (void)addBufferToArray:(void *)a3 name:(const char *)a4 payloadBuffer:(const void *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshAttributeDescriptor

- (REMeshAttributeDescriptor)initWithMeshAssetBuffer:(const void *)a3 payloadBuilder:(void *)a4
{
  v7 = (re *)re::sizeFromVertexFormat(*((unsigned __int8 *)a3 + 72), (uint64_t)a2);
  v8 = v7;
  unint64_t v9 = v7;
  unint64_t v10 = *((void *)a3 + 6) / (unint64_t)v7;
  if (HIDWORD(v10))
  {
    v11 = *re::assetTypesLogObjects(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl(&dword_233120000, v11, OS_LOG_TYPE_FAULT, "Vertex count overflow when initializing REMeshAttributeDescriptor", v18, 2u);
    }
    v12 = 0;
  }
  else
  {
    re::StringID::StringID((re::StringID *)v18, (const re::DynamicString *)a3);
    int v14 = re::bufferIdentifierForMeshAttribute((re *)v18, v13);
    re::StringID::destroyString((re::StringID *)v18);
    if ((v14 & 0xFFFFFFFC) == 4) {
      v15 = (char *)a4 + 64;
    }
    else {
      v15 = (char *)a4 + 8;
    }
    if (v9 <= 4) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v9;
    }
    v12 = self;
  }

  return v12;
}

- (REMeshAttributeDescriptor)initWithVertexAttributeDescriptor:(const VertexAttributeDescriptor *)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5
{
  return [(REMeshAttributeDescriptor *)self initWithPayloadOffset:*(void *)&a4 count:*(void *)&a5 format:a3->var1 stepFunction:a3->var2 stride:re::sizeFromVertexFormat(a3->var1, (uint64_t)a2)];
}

- (void)addBufferToArray:(void *)a3 name:(const char *)a4 payloadBuffer:(const void *)a5
{
  uint64_t v16 = 0;
  v17 = "";
  unsigned int v10 = re::bufferIdentifierForMeshAttribute((re *)&v16, v9);
  re::StringID::destroyString((re::StringID *)&v16);
  char v18 = [(REMeshAttributeDescriptor *)self format];
  char v19 = [(REMeshAttributeDescriptor *)self stepFunction];
  if (v10 >= 8)
  {
    re::internal::assertLog((re::internal *)6, v12, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < N", "operator[]", 242, v10, 8);
    _os_crash();
    __break(1u);
  }
  else
  {
    v13 = (void *)*((void *)a5 + v10);
    unsigned int v14 = [(REMeshAttributeDescriptor *)self payloadOffset];
    int v15 = [(REMeshAttributeDescriptor *)self bufferSize];
    id v20 = 0;
    id v20 = v13;
    unsigned int v21 = v14;
    int v22 = v15;
    int v23 = 0;
    unsigned int v24 = [(REMeshAttributeDescriptor *)self stride];
    re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)a3, (uint64_t)&v16);
    if (v20)
    {

      id v20 = 0;
    }
    if (v16)
    {
      if (v17) {
        (*(void (**)(void))(*(void *)v16 + 40))();
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshAttributeDescriptor)initWithPayloadOffset:(unsigned int)a3 count:(unsigned int)a4 format:(unint64_t)a5 stepFunction:(unint64_t)a6 stride:(unsigned int)a7
{
  v13.receiver = self;
  v13.super_class = (Class)REMeshAttributeDescriptor;
  result = [(REMeshAttributeDescriptor *)&v13 init];
  if (result)
  {
    result->_payloadOffset = a3;
    result->_count = a4;
    result->_format = a5;
    result->_stepFunction = a6;
    result->_stride = a7;
  }
  return result;
}

- (REMeshAttributeDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"payloadOffset"];
  self->_payloadOffset = v5;
  unint64_t v6 = [v4 decodeIntegerForKey:@"count"];
  self->_count = v6;
  unint64_t v7 = [v4 decodeIntegerForKey:@"format"];
  unint64_t v8 = v7;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AF7DFA0, memory_order_acquire) & 1) == 0)
  {
    unint64_t v7 = __cxa_guard_acquire(&qword_26AF7DFA0);
    if (v7)
    {
      qword_26AF7DF98 = (uint64_t)re::mtl::introspect_VertexFormat(0, v32);
      __cxa_guard_release(&qword_26AF7DFA0);
    }
  }
  if (!v8) {
    goto LABEL_10;
  }
  unint64_t v9 = *(unsigned int **)(qword_26AF7DF98 + 64);
  unint64_t v10 = *v9;
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *((void *)v9 + 1);
  BOOL v13 = 1;
  do
  {
    uint64_t v14 = *(void *)(v12 + 8 * v11);
    if (*(_DWORD *)v14 == 1 && *(void *)(v14 + 8) == v8) {
      break;
    }
    BOOL v13 = ++v11 < v10;
  }
  while (v10 != v11);
  if (v13)
  {
    self->_format = v8;
    int v15 = 1;
  }
  else
  {
LABEL_10:
    self->_format = 0;
    uint64_t v16 = *re::assetTypesLogObjects((re *)v7);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_error_impl(&dword_233120000, v16, OS_LOG_TYPE_ERROR, "Invalid MTLVertexFormat when decoding REMeshAttributeDescriptor", v34, 2u);
    }
    int v15 = 0;
  }
  unint64_t v17 = [v4 decodeIntegerForKey:@"stepFunction"];
  unint64_t v18 = v17;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AF7DFB0, memory_order_acquire) & 1) == 0)
  {
    unint64_t v17 = __cxa_guard_acquire(&qword_26AF7DFB0);
    if (v17)
    {
      qword_26AF7DFA8 = (uint64_t)re::mtl::introspect_VertexStepFunction(0, v33);
      __cxa_guard_release(&qword_26AF7DFB0);
    }
  }
  char v19 = *(unsigned int **)(qword_26AF7DFA8 + 64);
  unint64_t v20 = *v19;
  if (!v20) {
    goto LABEL_21;
  }
  uint64_t v21 = 0;
  uint64_t v22 = *((void *)v19 + 1);
  BOOL v23 = 1;
  do
  {
    uint64_t v24 = *(void *)(v22 + 8 * v21);
    if (*(_DWORD *)v24 == 1 && *(void *)(v24 + 8) == v18) {
      break;
    }
    BOOL v23 = ++v21 < v20;
  }
  while (v20 != v21);
  if (v23)
  {
    self->_stepFunction = v18;
    int v25 = 1;
  }
  else
  {
LABEL_21:
    self->_stepFunction = -1;
    v26 = *re::assetTypesLogObjects((re *)v17);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_233120000, v26, OS_LOG_TYPE_ERROR, "Invalid MTLVertexStepFunction when decoding REMeshAttributeDescriptor", buf, 2u);
    }
    int v25 = 0;
  }
  unint64_t v27 = [v4 decodeIntegerForKey:@"stride"];
  self->_stride = v27;
  if (HIDWORD(v27) || HIDWORD(v6) || HIDWORD(v5)) {
    v30 = {;
  }
    [v4 failWithError:v30];
LABEL_31:

    v29 = 0;
    goto LABEL_32;
  }
  if ((v15 & v25 & 1) == 0) {
    v30 = {;
  }
    [v4 failWithError:v30];
    goto LABEL_31;
  }
  v29 = self;
LABEL_32:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_payloadOffset forKey:@"payloadOffset"];
  [v4 encodeInteger:self->_count forKey:@"count"];
  [v4 encodeInteger:self->_format forKey:@"format"];
  [v4 encodeInteger:self->_stepFunction forKey:@"stepFunction"];
  [v4 encodeInteger:self->_stride forKey:@"stride"];
}

- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4
{
  unint64_t payloadOffset = self->_payloadOffset;
  unint64_t v7 = [(REMeshAttributeDescriptor *)self bufferSize];
  if (v7 && !__CFADD__(payloadOffset, v7) && payloadOffset < a3 && payloadOffset + v7 <= a3) {
    return 1;
  }
  return 0;
}

- (unint64_t)bufferSize
{
  unsigned int v3 = re::sizeFromVertexFormat(LOBYTE(self->_format), (uint64_t)a2);
  uint64_t count = self->_count;
  if (count) {
    return (count - 1) * self->_stride + v3;
  }
  else {
    return 0;
  }
}

- (unint64_t)estimateContainerSize
{
  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v2);
}

- (unsigned)payloadOffset
{
  return self->_payloadOffset;
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)stride
{
  return self->_stride;
}

- (unint64_t)format
{
  return self->_format;
}

- (unint64_t)stepFunction
{
  return self->_stepFunction;
}

@end