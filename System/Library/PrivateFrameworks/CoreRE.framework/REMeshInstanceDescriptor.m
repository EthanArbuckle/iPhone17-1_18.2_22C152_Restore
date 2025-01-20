@interface REMeshInstanceDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithModelCount:(unint64_t)a3 error:(id *)a4;
- (MeshInstance)meshInstanceWithModels:(SEL)a3 meshManager:(const void *)a4;
- (NSString)name;
- (REMeshInstanceDescriptor)initWithCoder:(id)a3;
- (REMeshInstanceDescriptor)initWithMeshAssetInstance:(const void *)a3;
- (REMeshInstanceDescriptor)initWithName:(__n128)a3 modelIndex:(__n128)a4 transform:(__n128)a5 lodSelectOptions:(uint64_t)a6;
- (REMeshLodSelectOptions)lodSelectOptions;
- (__n128)transform;
- (id).cxx_construct;
- (unint64_t)estimateContainerSize;
- (unsigned)modelIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshInstanceDescriptor

- (REMeshInstanceDescriptor)initWithMeshAssetInstance:(const void *)a3
{
  v5 = [NSString stringWithUTF8String:*((void *)a3 + 1)];
  v6 = -[REMeshInstanceDescriptor initWithName:modelIndex:transform:lodSelectOptions:](self, "initWithName:modelIndex:transform:lodSelectOptions:", v5, *((unsigned int *)a3 + 20), *(void *)((char *)a3 + 84), *((double *)a3 + 2), *((double *)a3 + 4), *((double *)a3 + 6), *((double *)a3 + 8));

  return v6;
}

- (MeshInstance)meshInstanceWithModels:(SEL)a3 meshManager:(const void *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v25 = [(REMeshInstanceDescriptor *)self name];
  v9 = (_anonymous_namespace_ *)[v25 UTF8String];
  uint64_t v26 = 0;
  v27 = "";
  unsigned int v10 = [(REMeshInstanceDescriptor *)self modelIndex];
  uint64_t v11 = v10;
  unint64_t v12 = *((void *)a4 + 7);
  if (v12 <= v10)
  {
    uint64_t v28 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    int v29 = 136315906;
    v30 = "operator[]";
    __int16 v31 = 1024;
    int v32 = 797;
    __int16 v33 = 2048;
    uint64_t v34 = v11;
    __int16 v35 = 2048;
    unint64_t v36 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  uint64_t v13 = *(void *)(*((void *)a4 + 9) + 8 * v10);
  [(REMeshInstanceDescriptor *)self transform];
  long long v23 = v15;
  long long v24 = v14;
  long long v21 = v17;
  long long v22 = v16;
  REMeshLodSelectOptions v18 = [(REMeshInstanceDescriptor *)self lodSelectOptions];
  v19 = (char *)v27;
  *(void *)&retstr->var0.var0 = v26;
  retstr->var0.var1 = v19;
  uint64_t v26 = 0;
  v27 = "";
  *(_OWORD *)&retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var4.var2 = 0u;
  *(_OWORD *)&retstr->var5.var1 = 0u;
  re::DataArray<re::MeshModel>::tryGet((uint64_t)a5 + 8, v13);
  *(_OWORD *)&retstr->var3.var0.var0.var0 = v24;
  *(_OWORD *)&retstr->var3.var0.var5[4] = v23;
  *(_OWORD *)&retstr->var3.var0.var5[8] = v22;
  *(_OWORD *)&retstr->var3.var0.var5[12] = v21;
  retstr->var1 = (DataArrayHandle<re::MeshModel>)v13;
  retstr->var2 = v18.options;
  re::StringID::destroyString((re::StringID *)&v26);

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshInstanceDescriptor)initWithName:(__n128)a3 modelIndex:(__n128)a4 transform:(__n128)a5 lodSelectOptions:(uint64_t)a6
{
  id v12 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)REMeshInstanceDescriptor;
  uint64_t v13 = [(REMeshInstanceDescriptor *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_modelIndex = a8;
    *(__n128 *)&v13[1].super.isa = a2;
    *(__n128 *)&v13[1]._name = a3;
    *(__n128 *)&v13[2].super.isa = a4;
    *(__n128 *)&v13[2]._name = a5;
    v13->_lodSelectOptions = a9;
  }

  return v13;
}

- (REMeshInstanceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  unint64_t v7 = [v4 decodeIntegerForKey:@"modelIndex"];
  self->_modelIndex = v7;
  uint64_t v29 = 0;
  id v8 = v4;
  v9 = (int32x4_t *)[v8 decodeBytesForKey:@"transform" returnedLength:&v29];
  if (v29 == 64)
  {
    int32x4_t v10 = *v9;
    int32x4_t v11 = v9[1];
    if ((v9->u32[0] & 0x7FFFFFFF) > 0x7F7FFFFF || (v10.i32[1] & 0x7FFFFFFFu) > 0x7F7FFFFF) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = (v10.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v10.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    }
    int32x4_t v15 = v9[2];
    int32x4_t v14 = v9[3];
    if ((v11.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF || (v11.i32[1] & 0x7FFFFFFFu) > 0x7F7FFFFF) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = (v11.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v11.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
    }
    if ((v15.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF)
    {
      BOOL v18 = 0;
    }
    else
    {
      BOOL v17 = (v15.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v15.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
      BOOL v18 = (v15.i32[1] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v17;
    }
    if ((v14.i32[0] & 0x7FFFFFFFu) > 0x7F7FFFFF)
    {
      BOOL v20 = 0;
    }
    else
    {
      BOOL v19 = (v14.i32[2] & 0x7FFFFFFFu) <= 0x7F7FFFFF && (v14.i32[3] & 0x7FFFFFFFu) < 0x7F800000;
      BOOL v20 = (v14.i32[1] & 0x7FFFFFFFu) <= 0x7F7FFFFF && v19;
    }
    v21.i64[0] = vuzp2q_s32(vuzp2q_s32(v11, v10), v11).u64[0];
    v21.i64[1] = __PAIR64__(v14.u32[3], v15.u32[3]);
    *(int16x4_t *)v21.f32 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v21, (float32x4_t)xmmword_23435FBB0)));
    v21.i16[0] = vmaxv_u16(*(uint16x4_t *)v21.f32);
    if ((v20 & ~v21.i32[0] & (v12 && v16 && v18)) == 1)
    {
      *(int32x4_t *)&self[1].super.isa = v10;
      *(int32x4_t *)&self[1]._name = v11;
      char v13 = 1;
      *(int32x4_t *)&self[2].super.isa = v15;
      *(int32x4_t *)&self[2]._name = v14;
    }
    else
    {
      char v13 = 0;
      *(_OWORD *)&self[2].super.isa = 0u;
      *(_OWORD *)&self[2]._name = 0u;
      *(_OWORD *)&self[1].super.isa = 0u;
      *(_OWORD *)&self[1]._name = 0u;
    }
  }
  else
  {
    char v13 = 0;
  }
  self->_lodSelectOptions.options.strategy = [v8 decodeIntForKey:@"lodSelectOptions.strategy"];
  [v8 decodeFloatForKey:@"lodSelectOptions.bias"];
  self->_lodSelectOptions.options.bias = v23;
  if (HIDWORD(v7)) {
    long long v24 = {;
  }
    [v8 failWithError:v24];
LABEL_45:

    v27 = 0;
    goto LABEL_46;
  }
  if (v23 < 0.00001 || self->_lodSelectOptions.options.strategy >= 2u) {
    char v26 = 0;
  }
  else {
    char v26 = v13;
  }
  if ((v26 & 1) == 0) {
    long long v24 = {;
  }
    [v8 failWithError:v24];
    goto LABEL_45;
  }
  v27 = self;
LABEL_46:

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_modelIndex forKey:@"modelIndex"];
  [v5 encodeBytes:&self[1] length:64 forKey:@"transform"];
  [v5 encodeInt:self->_lodSelectOptions.options.strategy forKey:@"lodSelectOptions.strategy"];
  *(float *)&double v4 = self->_lodSelectOptions.options.bias;
  [v5 encodeFloat:@"lodSelectOptions.bias" forKey:v4];
}

- (BOOL)validateWithModelCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t modelIndex = self->_modelIndex;
  if (modelIndex >= a3) {
  return modelIndex < a3;
  }
}

- (unint64_t)estimateContainerSize
{
  v3 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v3);
  name = self->_name;
  if (name)
  {
    v6 = (objc_class *)objc_opt_class();
    size_t v7 = class_getInstanceSize(v6);
    id v8 = self->_name;
    if (v8) {
      name = (NSString *)([(NSString *)v8 lengthOfBytesUsingEncoding:4] + 1);
    }
    else {
      name = 0;
    }
  }
  else
  {
    size_t v7 = 0;
  }
  return (unint64_t)name + v7 + InstanceSize;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)modelIndex
{
  return self->_modelIndex;
}

- (__n128)transform
{
  return a1[2];
}

- (REMeshLodSelectOptions)lodSelectOptions
{
  return self->_lodSelectOptions;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  *((_DWORD *)self + 7) = 1065353216;
  return self;
}

@end