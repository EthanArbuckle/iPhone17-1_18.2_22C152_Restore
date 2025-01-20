@interface SKAttributeValue
+ (BOOL)supportsSecureCoding;
+ (SKAttributeValue)valueWithFloat:(float)value;
+ (SKAttributeValue)valueWithVectorFloat2:(vector_float2)value;
+ (SKAttributeValue)valueWithVectorFloat3:(vector_float3)value;
+ (SKAttributeValue)valueWithVectorFloat4:(vector_float4)value;
- (BOOL)copyValueTo:(void *)a3 type:(int64_t)a4 count:(unsigned int)a5;
- (BOOL)isEqualToAttributeValue:(id)a3;
- (SKAttributeValue)init;
- (SKAttributeValue)initWithCoder:(id)a3;
- (float)floatValue;
- (int64_t)type;
- (vector_float2)vectorFloat2Value;
- (vector_float3)vectorFloat3Value;
- (vector_float4)vectorFloat4Value;
- (void)encodeWithCoder:(id)a3;
- (void)setFloatValue:(float)floatValue;
- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value;
- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value;
- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value;
@end

@implementation SKAttributeValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)copyValueTo:(void *)a3 type:(int64_t)a4 count:(unsigned int)a5
{
  unint64_t v5 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 7)
  {
    unsigned int v6 = a5;
    if (a5)
    {
      size_t v8 = qword_20AEDE870[v5];
      v9 = (char *)self + qword_20AEDE830[v5];
      do
      {
        memcpy(a3, v9, v8);
        a3 = (char *)a3 + v8;
        --v6;
      }
      while (v6);
    }
  }
  return v5 < 8;
}

+ (SKAttributeValue)valueWithFloat:(float)value
{
  v4 = objc_alloc_init(SKAttributeValue);
  *(float *)&double v5 = value;
  [(SKAttributeValue *)v4 setFloatValue:v5];

  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat2:(vector_float2)value
{
  v4 = objc_alloc_init(SKAttributeValue);
  [(SKAttributeValue *)v4 setVectorFloat2Value:*(double *)&value];

  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat3:(vector_float3)value
{
  double v6 = v3;
  v4 = objc_alloc_init(SKAttributeValue);
  [(SKAttributeValue *)v4 setVectorFloat3Value:v6];

  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat4:(vector_float4)value
{
  double v5 = *(double *)value.i64;
  double v3 = objc_alloc_init(SKAttributeValue);
  [(SKAttributeValue *)v3 setVectorFloat4Value:v5];

  return v3;
}

- (float)floatValue
{
  return self->floatValues[0];
}

- (void)setFloatValue:(float)floatValue
{
  self->floatValues[0] = floatValue;
  self->halfFloatValues[0] = floatToHalfFloat(floatValue);
}

- (vector_float2)vectorFloat2Value
{
  return *(vector_float2 *)self->floatValues;
}

- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value
{
  float v4 = vectorFloat2Value.f32[1];
  *(vector_float2 *)self->floatValues = vectorFloat2Value;
  self->halfFloatValues[0] = floatToHalfFloat(vectorFloat2Value.f32[0]);
  self->halfFloatValues[1] = floatToHalfFloat(v4);
}

- (vector_float3)vectorFloat3Value
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value
{
  float v5 = *((float *)&v3 + 1);
  *(void *)self->floatValues = v3;
  float v6 = *((float *)&v3 + 2);
  self->floatValues[2] = *((float *)&v3 + 2);
  self->halfFloatValues[0] = floatToHalfFloat(*(float *)&v3);
  self->halfFloatValues[1] = floatToHalfFloat(v5);
  self->halfFloatValues[2] = floatToHalfFloat(v6);
}

- (vector_float4)vectorFloat4Value
{
  return *(vector_float4 *)self->floatValues;
}

- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value
{
  float v4 = vectorFloat4Value.f32[3];
  float v5 = vectorFloat4Value.f32[2];
  float v6 = vectorFloat4Value.f32[1];
  *(vector_float4 *)self->floatValues = vectorFloat4Value;
  self->halfFloatValues[0] = floatToHalfFloat(vectorFloat4Value.f32[0]);
  self->halfFloatValues[1] = floatToHalfFloat(v6);
  self->halfFloatValues[2] = floatToHalfFloat(v5);
  self->halfFloatValues[3] = floatToHalfFloat(v4);
}

- (SKAttributeValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKAttributeValue;
  vector_float3 result = [(SKAttributeValue *)&v3 init];
  if (result) {
    result->_type = 0;
  }
  return result;
}

- (SKAttributeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  float v5 = [(SKAttributeValue *)self init];
  if (v5)
  {
    float v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    v5->_type = [v6 integerValue];

    [v4 decodeFloatForKey:@"_floatValues0"];
    unsigned int v11 = v7;
    [v4 decodeFloatForKey:@"_floatValues1"];
    unsigned int v10 = v8;
    [v4 decodeFloatForKey:@"_floatValues2"];
    [v4 decodeFloatForKey:@"_floatValues3"];
    [(SKAttributeValue *)v5 setVectorFloat4Value:COERCE_DOUBLE(__PAIR64__(v10, v11))];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [NSNumber numberWithInteger:self->_type];
  [v9 encodeObject:v4 forKey:@"_type"];

  *(float *)&double v5 = self->floatValues[0];
  [v9 encodeFloat:@"_floatValues0" forKey:v5];
  *(float *)&double v6 = self->floatValues[1];
  [v9 encodeFloat:@"_floatValues1" forKey:v6];
  *(float *)&double v7 = self->floatValues[2];
  [v9 encodeFloat:@"_floatValues2" forKey:v7];
  *(float *)&double v8 = self->floatValues[3];
  [v9 encodeFloat:@"_floatValues3" forKey:v8];
}

- (BOOL)isEqualToAttributeValue:(id)a3
{
  id v4 = (SKAttributeValue *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    if ((COERCE_UNSIGNED_INT(self->floatValues[0] - v4->floatValues[0]) & 0x60000000) != 0) {
      goto LABEL_9;
    }
    if ((COERCE_UNSIGNED_INT(self->floatValues[1] - v4->floatValues[1]) & 0x60000000) != 0) {
      goto LABEL_9;
    }
    if ((COERCE_UNSIGNED_INT(self->floatValues[2] - v4->floatValues[2]) & 0x60000000) != 0) {
      goto LABEL_9;
    }
    float v5 = v4->floatValues[3];
    float v6 = self->floatValues[3] - v5;
    if ((LODWORD(v6) & 0x60000000) != 0) {
      goto LABEL_9;
    }
    LOWORD(v6) = self->halfFloatValues[0];
    LOWORD(v5) = v4->halfFloatValues[0];
    float v7 = (float)LODWORD(v5);
    float v8 = (float)LODWORD(v6) - v7;
    if ((LODWORD(v8) & 0x60000000) != 0) {
      goto LABEL_9;
    }
    LOWORD(v8) = self->halfFloatValues[1];
    LOWORD(v7) = v4->halfFloatValues[1];
    float v9 = (float)LODWORD(v7);
    float v10 = (float)LODWORD(v8) - v9;
    if ((LODWORD(v10) & 0x60000000) != 0
      || (LOWORD(v10) = self->halfFloatValues[2],
          LOWORD(v9) = v4->halfFloatValues[2],
          float v11 = (float)LODWORD(v9),
          float v12 = (float)LODWORD(v10) - v11,
          (LODWORD(v12) & 0x60000000) != 0))
    {
LABEL_9:
      BOOL v13 = 0;
    }
    else
    {
      LOWORD(v12) = self->halfFloatValues[3];
      LOWORD(v11) = v4->halfFloatValues[3];
      BOOL v13 = (COERCE_UNSIGNED_INT((float)LODWORD(v12) - (float)LODWORD(v11)) & 0x60000000) == 0;
    }
  }

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

@end