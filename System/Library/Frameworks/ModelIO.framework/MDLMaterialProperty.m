@interface MDLMaterialProperty
+ (__n128)_decodeMatrixPropertyWithCoder:(void *)a3 forKey:(void *)a4;
+ (__n128)_decodeVectorWithCoder:(id)a3 forKey:(uint64_t)a4;
+ (id)decodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5;
- (BOOL)isDefaultValue;
- (CGColorRef)color;
- (MDLBufferView)bufferData;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic URL:(NSURL *)URL;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic color:(CGColorRef)color;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float2:(vector_float2)value;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float3:(vector_float3)value;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float4:(vector_float4)value;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float:(float)value;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic matrix4x4:(matrix_float4x4)value;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic string:(NSString *)string;
- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic textureSampler:(MDLTextureSampler *)textureSampler;
- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4;
- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4 stride:(unint64_t)a5;
- (MDLMaterialProperty)initWithName:(id)a3 semantic:(unint64_t)a4 float4WithSRGBA:;
- (MDLMaterialPropertyType)type;
- (MDLMaterialSemantic)semantic;
- (MDLTextureSampler)textureSamplerValue;
- (NSString)name;
- (NSString)stringValue;
- (NSURL)URLValue;
- (__n128)setMatrix4x4Value:(__n128)a3;
- (float)floatValue;
- (float)luminance;
- (id)copyWithZone:(_NSZone *)a3;
- (matrix_float4x4)matrix4x4;
- (unint64_t)stride;
- (vector_float2)float2Value;
- (vector_float3)float3Value;
- (vector_float4)float4Value;
- (void)_encodeMatrixPropertyWithCoder:(id)a3 forKey:(id)a4;
- (void)_encodeVector:(id)a3 withCoder:(id)a4 forKey:;
- (void)clear;
- (void)dealloc;
- (void)encodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5;
- (void)setColor:(CGColorRef)color;
- (void)setFloat2Value:(vector_float2)float2Value;
- (void)setFloat3Value:(vector_float3)float3Value;
- (void)setFloat4Value:(vector_float4)float4Value;
- (void)setFloatValue:(float)floatValue;
- (void)setIsDefaultValue:(BOOL)a3;
- (void)setMatrix4x4:(matrix_float4x4)matrix4x4;
- (void)setName:(NSString *)name;
- (void)setProperties:(MDLMaterialProperty *)property;
- (void)setSemantic:(MDLMaterialSemantic)semantic;
- (void)setStringValue:(NSString *)stringValue;
- (void)setTextureSamplerValue:(MDLTextureSampler *)textureSamplerValue;
- (void)setType:(MDLMaterialPropertyType)type;
- (void)setURLValue:(NSURL *)URLValue;
@end

@implementation MDLMaterialProperty

- (void)clear
{
  string = self->_string;
  self->_string = 0;

  name = self->_name;
  self->_name = 0;

  url = self->_url;
  self->_url = 0;

  textureSampler = self->_textureSampler;
  self->_textureSampler = 0;

  self->_color = 0;
  *(_OWORD *)&self->_anon_40[32] = 0u;
  *(_OWORD *)&self->_anon_40[48] = 0u;
  *(_OWORD *)self->_anon_40 = 0u;
  *(_OWORD *)&self->_anon_40[16] = 0u;
  *(_OWORD *)self->_float = 0u;
  self->_semantic = 0x8000;
  objc_storeWeak((id *)&self->_node, 0);
  objc_storeWeak((id *)&self->_overrider, 0);

  objc_storeWeak((id *)&self->_overridee, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_string, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_name, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_url, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  objc_storeStrong((id *)(v10 + 32), self->_textureSampler);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)self->_float;
  long long v20 = *(_OWORD *)self->_anon_40;
  long long v21 = *(_OWORD *)&self->_anon_40[16];
  long long v22 = *(_OWORD *)&self->_anon_40[48];
  *(_OWORD *)(v10 + 96) = *(_OWORD *)&self->_anon_40[32];
  *(_OWORD *)(v10 + 112) = v22;
  *(_OWORD *)(v10 + 64) = v20;
  *(_OWORD *)(v10 + 80) = v21;
  *(void *)(v10 + 152) = self->_semantic;
  *(void *)(v10 + 192) = self->_type;
  objc_msgSend_setColor_((void *)v10, v23, (uint64_t)self->_color);
  return (id)v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  v4 = name;
  v7 = v4;
  if (v4)
  {
    objc_msgSend_stringWithString_(NSString, (const char *)v4, (uint64_t)v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_name;
    self->_name = v5;
  }
  else
  {
    v6 = self->_name;
    self->_name = 0;
  }
}

- (MDLMaterialSemantic)semantic
{
  return self->_semantic;
}

- (void)setSemantic:(MDLMaterialSemantic)semantic
{
  self->_semantic = semantic;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic
{
  v6 = name;
  objc_msgSend_clear(self, v7, v8);
  v21.receiver = self;
  v21.super_class = (Class)MDLMaterialProperty;
  uint64_t v10 = [(MDLMaterialProperty *)&v21 init];
  if (v10)
  {
    if (v6)
    {
      uint64_t v11 = objc_msgSend_stringWithString_(NSString, v9, (uint64_t)v6);
      uint64_t v12 = v10->_name;
      v10->_name = (NSString *)v11;
    }
    v10->_semantic = semantic;
    uint64_t v13 = MEMORY[0x263EF89A8];
    long long v14 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)v10->_anon_40 = *MEMORY[0x263EF89A8];
    *(_OWORD *)&v10->_anon_40[16] = v14;
    long long v15 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&v10->_anon_40[32] = *(_OWORD *)(v13 + 32);
    *(_OWORD *)&v10->_anon_40[48] = v15;
    *(void *)v10->_float = 0;
    *(void *)&v10->_float[8] = 0;
    textureSampler = v10->_textureSampler;
    v10->_textureSampler = 0;

    url = v10->_url;
    v10->_url = 0;

    string = v10->_string;
    v10->_string = 0;

    v10->_type = 5;
    buffer = v10->_buffer;
    v10->_buffer = 0;

    objc_storeWeak((id *)&v10->_node, 0);
    objc_storeWeak((id *)&v10->_overridee, 0);
    objc_storeWeak((id *)&v10->_overrider, 0);
    v10->_isDefaultValue = 1;
  }

  return v10;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float:(float)value
{
  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  uint64_t v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  uint64_t v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = LODWORD(value);
    *(void *)(v11 + 192) = 5;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float2:(vector_float2)value
{
  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  uint64_t v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  uint64_t v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = (unint64_t)value;
    *(void *)(v11 + 192) = 6;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float3:(vector_float3)value
{
  long long v16 = v5;
  uint64_t v8 = name;
  objc_msgSend_clear(self, v9, v10);
  uint64_t v12 = objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v8, semantic);
  uint64_t v13 = (MDLMaterialProperty *)v12;
  if (v12)
  {
    long long v14 = v16;
    HIDWORD(v14) = 0;
    *(_OWORD *)(v12 + 48) = v14;
    *(void *)(v12 + 192) = 7;
  }

  return v13;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float4:(vector_float4)value
{
  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  uint64_t v11 = (vector_float4 *)objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  uint64_t v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    v11[3] = value;
    v11[12].i64[0] = 8;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic matrix4x4:(matrix_float4x4)value
{
  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  uint64_t v11 = (matrix_float4x4 *)objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  uint64_t v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    v11[1] = value;
    v11[3].columns[0].i64[0] = 9;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic URL:(NSURL *)URL
{
  uint64_t v8 = name;
  uint64_t v9 = URL;
  objc_msgSend_clear(self, v10, v11);
  uint64_t v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  long long v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 24), URL);
    v14->_type = 2;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic string:(NSString *)string
{
  uint64_t v8 = name;
  uint64_t v9 = string;
  objc_msgSend_clear(self, v10, v11);
  long long v15 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v9, v13, v14);
    v17 = v15->_string;
    v15->_string = (NSString *)v16;

    v15->_type = 1;
  }

  return v15;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic textureSampler:(MDLTextureSampler *)textureSampler
{
  uint64_t v8 = name;
  uint64_t v9 = textureSampler;
  objc_msgSend_clear(self, v10, v11);
  uint64_t v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  uint64_t v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 32), textureSampler);
    v14->_type = 3;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(id)a3 semantic:(unint64_t)a4 float4WithSRGBA:
{
  long long v14 = v4;
  id v7 = a3;
  objc_msgSend_clear(self, v8, v9);
  uint64_t v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, a4);
  uint64_t v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = v14;
    *(void *)(v11 + 192) = 8;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic color:(CGColorRef)color
{
  uint64_t v8 = name;
  objc_msgSend_clear(self, v9, v10);
  uint64_t v12 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v8, semantic);
  if (v12)
  {
    v12->_color = CGColorCreateCopy(color);
    v12->_type = 4;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4 stride:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_msgSend_clear(self, v10, v11);
  uint64_t v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, 32769);
  long long v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 136), a4);
    v14->_stride = a5;
    v14->_type = 10;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend_clear(self, v9, v10);
  long long v14 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v7, 32769);
  if (v14)
  {
    if (objc_msgSend_type(v8, v12, v13) != 3)
    {
      long long v15 = NSStringFromSelector(a2);
      uint64_t v16 = (void *)MEMORY[0x263EFF940];
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      objc_msgSend_raise_format_(v16, v19, @"ModelIOException", @"[%@ %@]: value.type must be MDLMeshBufferTypeCustom", v18, v15);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v14->_buffer, a4);
    }
    else {
      NSLog(&cfstr_MdlmeshbufferI.isa);
    }
    v14->_stride = 0;
    v14->_type = 10;
  }

  return v14;
}

- (void)dealloc
{
  color = self->_color;
  if (color)
  {
    CFRelease(color);
    self->_color = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MDLMaterialProperty;
  [(MDLMaterialProperty *)&v4 dealloc];
}

- (void)setProperties:(MDLMaterialProperty *)property
{
  long long v14 = property;
  if (self != v14)
  {
    objc_msgSend_clear(self, v4, v5);
    uint64_t name = (uint64_t)v14->_name;
    if (name)
    {
      objc_msgSend_stringWithString_(NSString, v6, name);
      id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v9 = self->_name;
      self->_uint64_t name = v8;
    }
    self->_semantic = v14->_semantic;
    long long v10 = *(_OWORD *)v14->_anon_40;
    long long v11 = *(_OWORD *)&v14->_anon_40[16];
    long long v12 = *(_OWORD *)&v14->_anon_40[48];
    *(_OWORD *)&self->_anon_40[32] = *(_OWORD *)&v14->_anon_40[32];
    *(_OWORD *)&self->_anon_40[48] = v12;
    *(_OWORD *)self->_anon_40 = v10;
    *(_OWORD *)&self->_anon_40[16] = v11;
    *(_OWORD *)self->_float = *(_OWORD *)v14->_float;
    objc_storeStrong((id *)&self->_textureSampler, v14->_textureSampler);
    objc_storeStrong((id *)&self->_url, v14->_url);
    objc_storeStrong((id *)&self->_string, v14->_string);
    self->_type = v14->_type;
    self->_isDefaultValue = v14->_isDefaultValue;
    objc_msgSend_setColor_(self, v13, (uint64_t)v14->_color);
  }
}

- (CGColorRef)color
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    color = (CGColor *)objc_msgSend_color(v5, v6, v7);
  }
  else
  {
    color = self->_color;
  }

  return color;
}

- (void)setColor:(CGColorRef)color
{
  id v5 = self->_color;
  if (v5)
  {
    CFRelease(v5);
    self->_color = 0;
  }
  if (color) {
    self->_color = CGColorCreateCopy(color);
  }
  self->_isDefaultValue = 0;
}

- (MDLBufferView)bufferData
{
  return self->_buffer;
}

- (unint64_t)stride
{
  return self->_stride;
}

- (NSString)stringValue
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_stringValue(v5, v6, v7);
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = self->_string;
  }

  return v8;
}

- (void)setStringValue:(NSString *)stringValue
{
  self->_type = 1;
  self->_isDefaultValue = 0;
}

- (NSURL)URLValue
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_URLValue(v5, v6, v7);
    id v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = self->_url;
  }

  return v8;
}

- (void)setURLValue:(NSURL *)URLValue
{
  self->_type = 2;
  self->_isDefaultValue = 0;
}

- (MDLTextureSampler)textureSamplerValue
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_textureSamplerValue(v5, v6, v7);
    id v8 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = self->_textureSampler;
  }

  return v8;
}

- (void)setTextureSamplerValue:(MDLTextureSampler *)textureSamplerValue
{
  self->_type = 3;
  self->_isDefaultValue = 0;
}

- (float)floatValue
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_floatValue(v5, v6, v7);
    float v9 = v8;
  }
  else
  {
    float v9 = *(float *)self->_float;
  }

  return v9;
}

- (void)setFloatValue:(float)floatValue
{
  *(float *)self->_float = floatValue;
  self->_type = 5;
  self->_isDefaultValue = 0;
}

- (float)luminance
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_luminance(v5, v6, v7);
    float v9 = v8;

    return v9;
  }
  else
  {
    switch(self->_type)
    {
      case 4uLL:
        color = self->_color;
        float result = sub_20B068710(color);
        break;
      case 5uLL:
        return *(float *)self->_float;
      case 6uLL:
        return vaddv_f32(*(float32x2_t *)self->_float) * 0.5;
      case 7uLL:
      case 8uLL:
        float64x2_t v11 = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)self->_float), (float64x2_t)xmmword_20B1E6D70);
        return *(float *)&self->_float[8] + 0.072187 + v11.f64[0] + v11.f64[1];
      default:
        return 0.0;
    }
  }
  return result;
}

- (vector_float2)float2Value
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float2Value(v5, v6, v7);
    vector_float2 v9 = v8;
  }
  else
  {
    vector_float2 v9 = *(vector_float2 *)self->_float;
  }

  return v9;
}

- (void)setFloat2Value:(vector_float2)float2Value
{
  unint64_t v3 = vextq_s8(*(int8x16_t *)self->_float, *(int8x16_t *)self->_float, 8uLL).u64[0];
  *(_OWORD *)self->_float = *(_OWORD *)float2Value.f32;
  self->_type = 6;
  self->_isDefaultValue = 0;
}

- (vector_float3)float3Value
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float3Value(v4, v5, v6);
  }
  result.i64[1] = v8;
  result.i64[0] = v7;
  return result;
}

- (void)setFloat3Value:(vector_float3)float3Value
{
  HIDWORD(v3) = *(_DWORD *)&self->_float[12];
  *(_OWORD *)self->_float = v3;
  self->_type = 7;
  self->_isDefaultValue = 0;
}

- (vector_float4)float4Value
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float4Value(v5, v6, v7);
    vector_float4 v10 = v8;
  }
  else
  {
    vector_float4 v10 = *(vector_float4 *)self->_float;
  }

  return v10;
}

- (void)setFloat4Value:(vector_float4)float4Value
{
  *(vector_float4 *)self->_float = float4Value;
  self->_type = 8;
  self->_isDefaultValue = 0;
}

- (matrix_float4x4)matrix4x4
{
  p_overrider = &self->_overrider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_matrix4x4(v5, v6, v7);
    simd_float4 v18 = v9;
    simd_float4 v19 = v8;
    simd_float4 v16 = v11;
    simd_float4 v17 = v10;
  }
  else
  {
    simd_float4 v18 = *(simd_float4 *)&self->_anon_40[16];
    simd_float4 v19 = *(simd_float4 *)self->_anon_40;
    simd_float4 v16 = *(simd_float4 *)&self->_anon_40[48];
    simd_float4 v17 = *(simd_float4 *)&self->_anon_40[32];
  }

  simd_float4 v13 = v18;
  simd_float4 v12 = v19;
  simd_float4 v15 = v16;
  simd_float4 v14 = v17;
  result.columns[3] = v15;
  result.columns[2] = v14;
  result.columns[1] = v13;
  result.columns[0] = v12;
  return result;
}

- (__n128)setMatrix4x4Value:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  result[12].n128_u64[0] = 9;
  result[11].n128_u8[8] = 0;
  return result;
}

- (void)_encodeVector:(id)a3 withCoder:(id)a4 forKey:
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v5 = v4;
  objc_msgSend_encodeBytes_length_forKey_(a3, a2, (uint64_t)&v5, 16, a4);
}

+ (__n128)_decodeVectorWithCoder:(id)a3 forKey:(uint64_t)a4
{
  uint64_t v9 = 0;
  id v5 = a3;
  uint64_t v7 = objc_msgSend_decodeBytesForKey_returnedLength_(v5, v6, a4, &v9);
  result.n128_u64[0] = 0;
  if (v9 == 16) {
    return *(__n128 *)v7;
  }
  return result;
}

- (void)_encodeMatrixPropertyWithCoder:(id)a3 forKey:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  long long v19 = *(_OWORD *)self->_anon_40;
  simd_float4 v8 = objc_msgSend_stringByAppendingString_(v6, v7, @".column0");
  objc_msgSend__encodeVector_withCoder_forKey_(self, v9, (uint64_t)v23, v8, *(double *)&v19);

  long long v20 = *(_OWORD *)&self->_anon_40[16];
  simd_float4 v11 = objc_msgSend_stringByAppendingString_(v6, v10, @".column1");
  objc_msgSend__encodeVector_withCoder_forKey_(self, v12, (uint64_t)v23, v11, *(double *)&v20);

  long long v21 = *(_OWORD *)&self->_anon_40[32];
  simd_float4 v14 = objc_msgSend_stringByAppendingString_(v6, v13, @".column2");
  objc_msgSend__encodeVector_withCoder_forKey_(self, v15, (uint64_t)v23, v14, *(double *)&v21);

  long long v22 = *(_OWORD *)&self->_anon_40[48];
  simd_float4 v17 = objc_msgSend_stringByAppendingString_(v6, v16, @".column3");
  objc_msgSend__encodeVector_withCoder_forKey_(self, v18, (uint64_t)v23, v17, *(double *)&v22);
}

+ (__n128)_decodeMatrixPropertyWithCoder:(void *)a3 forKey:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend_stringByAppendingString_(v7, v8, @".column0");
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v10, (uint64_t)v6, v9);
  long long v22 = v11;

  simd_float4 v13 = objc_msgSend_stringByAppendingString_(v7, v12, @".column1");;
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v14, (uint64_t)v6, v13);

  simd_float4 v16 = objc_msgSend_stringByAppendingString_(v7, v15, @".column2");
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v17, (uint64_t)v6, v16);

  long long v19 = objc_msgSend_stringByAppendingString_(v7, v18, @".column3");
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v20, (uint64_t)v6, v19);

  return (__n128)v22;
}

- (void)encodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5
{
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  string = self->_string;
  simd_float4 v12 = objc_msgSend_stringByAppendingString_(v8, v11, @".string");
  objc_msgSend_encodeObject_forKey_(v41, v13, (uint64_t)string, v12);

  uint64_t name = self->_name;
  simd_float4 v16 = objc_msgSend_stringByAppendingString_(v8, v15, @".name");
  objc_msgSend_encodeObject_forKey_(v41, v17, (uint64_t)name, v16);

  url = self->_url;
  long long v20 = objc_msgSend_stringByAppendingString_(v8, v19, @".url");
  objc_msgSend_encodeObject_forKey_(v41, v21, (uint64_t)url, v20);

  long long v40 = *(_OWORD *)self->_float;
  id v23 = objc_msgSend_stringByAppendingString_(v8, v22, @".vector");
  objc_msgSend__encodeVector_withCoder_forKey_(self, v24, (uint64_t)v41, v23, *(double *)&v40);

  v26 = objc_msgSend_stringByAppendingString_(v8, v25, @".matrix");
  objc_msgSend__encodeMatrixPropertyWithCoder_forKey_(self, v27, (uint64_t)v41, v26);

  buffer = self->_buffer;
  v30 = objc_msgSend_stringByAppendingString_(v8, v29, @".buffer");
  objc_msgSend_encodeBuffer_withCoder_forKey_(v9, v31, (uint64_t)buffer, v41, v30);

  unint64_t stride = self->_stride;
  v34 = objc_msgSend_stringByAppendingString_(v8, v33, @".stride");
  objc_msgSend_encodeInteger_forKey_(v41, v35, stride, v34);

  unint64_t semantic = self->_semantic;
  v38 = objc_msgSend_stringByAppendingString_(v8, v37, @".semantic");
  objc_msgSend_encodeInteger_forKey_(v41, v39, semantic, v38);
}

+ (id)decodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = objc_alloc_init(MDLMaterialProperty);
  uint64_t v12 = objc_opt_class();
  simd_float4 v14 = objc_msgSend_stringByAppendingString_(v9, v13, @".string");
  uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v8, v15, v12, v14);
  string = v11->_string;
  v11->_string = (NSString *)v16;

  uint64_t v18 = objc_opt_class();
  long long v20 = objc_msgSend_stringByAppendingString_(v9, v19, @".name");
  uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v8, v21, v18, v20);
  uint64_t name = v11->_name;
  v11->_uint64_t name = (NSString *)v22;

  uint64_t v24 = objc_opt_class();
  v26 = objc_msgSend_stringByAppendingString_(v9, v25, @".url");
  uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v8, v27, v24, v26);
  url = v11->_url;
  v11->_url = (NSURL *)v28;

  v31 = objc_msgSend_stringByAppendingString_(v9, v30, @".vector");
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v32, (uint64_t)v8, v31);
  *(_OWORD *)v11->_float = v33;

  v35 = objc_msgSend_stringByAppendingString_(v9, v34, @".matrix");
  objc_msgSend__decodeMatrixPropertyWithCoder_forKey_(a1, v36, (uint64_t)v8, v35);
  *(_OWORD *)v11->_anon_40 = v37;
  *(_OWORD *)&v11->_anon_40[16] = v38;
  *(_OWORD *)&v11->_anon_40[32] = v39;
  *(_OWORD *)&v11->_anon_40[48] = v40;

  v42 = objc_msgSend_stringByAppendingString_(v9, v41, @".buffer");
  uint64_t v44 = objc_msgSend_decodeBufferWithCoder_forKey_(v10, v43, (uint64_t)v8, v42);
  buffer = v11->_buffer;
  v11->_buffer = (MDLBufferView *)v44;

  v47 = objc_msgSend_stringByAppendingString_(v9, v46, @".stride");
  v11->_unint64_t stride = objc_msgSend_decodeIntegerForKey_(v8, v48, (uint64_t)v47);

  v11->_unint64_t semantic = objc_msgSend_decodeIntegerForKey_(v8, v49, @".semantic");

  return v11;
}

- (MDLMaterialPropertyType)type
{
  return self->_type;
}

- (void)setType:(MDLMaterialPropertyType)type
{
  self->_type = type;
}

- (void)setMatrix4x4:(matrix_float4x4)matrix4x4
{
  *(simd_float4 *)&self[1].super.isa = matrix4x4.columns[0];
  *(simd_float4 *)&self[1]._uint64_t name = matrix4x4.columns[1];
  *(simd_float4 *)&self[1]._textureSampler = matrix4x4.columns[2];
  *(simd_float4 *)self[1]._float = matrix4x4.columns[3];
}

- (BOOL)isDefaultValue
{
  return self->_isDefaultValue;
}

- (void)setIsDefaultValue:(BOOL)a3
{
  self->_isDefaultValue = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overridee);
  objc_destroyWeak((id *)&self->_overrider);
  objc_destroyWeak((id *)&self->_node);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_textureSampler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end