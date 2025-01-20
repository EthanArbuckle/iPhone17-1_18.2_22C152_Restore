@interface SKUniform
+ (BOOL)supportsSecureCoding;
+ (SKUniform)uniformWithName:(NSString *)name;
+ (SKUniform)uniformWithName:(NSString *)name float:(float)value;
+ (SKUniform)uniformWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value;
+ (SKUniform)uniformWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value;
+ (SKUniform)uniformWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value;
+ (SKUniform)uniformWithName:(NSString *)name floatVector2:(GLKVector2)value;
+ (SKUniform)uniformWithName:(NSString *)name floatVector3:(GLKVector3)value;
+ (SKUniform)uniformWithName:(NSString *)name floatVector4:(GLKVector4)value;
+ (SKUniform)uniformWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value;
+ (SKUniform)uniformWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value;
+ (SKUniform)uniformWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value;
+ (SKUniform)uniformWithName:(NSString *)name texture:(SKTexture *)texture;
+ (SKUniform)uniformWithName:(NSString *)name vectorFloat2:(vector_float2)value;
+ (SKUniform)uniformWithName:(NSString *)name vectorFloat3:(vector_float3)value;
+ (SKUniform)uniformWithName:(NSString *)name vectorFloat4:(vector_float4)value;
- (BOOL)isEqualToUniform:(id)a3;
- (GLKMatrix2)floatMatrix2Value;
- (GLKMatrix3)floatMatrix3Value;
- (GLKMatrix4)floatMatrix4Value;
- (GLKVector2)floatVector2Value;
- (GLKVector3)floatVector3Value;
- (GLKVector4)floatVector4Value;
- (NSString)name;
- (SKTexture)textureValue;
- (SKUniform)initWithCoder:(id)a3;
- (SKUniform)initWithName:(NSString *)name;
- (SKUniform)initWithName:(NSString *)name float:(float)value;
- (SKUniform)initWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value;
- (SKUniform)initWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value;
- (SKUniform)initWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value;
- (SKUniform)initWithName:(NSString *)name floatVector2:(GLKVector2)value;
- (SKUniform)initWithName:(NSString *)name floatVector3:(GLKVector3)value;
- (SKUniform)initWithName:(NSString *)name floatVector4:(GLKVector4)value;
- (SKUniform)initWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value;
- (SKUniform)initWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value;
- (SKUniform)initWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value;
- (SKUniform)initWithName:(NSString *)name texture:(SKTexture *)texture;
- (SKUniform)initWithName:(NSString *)name vectorFloat2:(vector_float2)value;
- (SKUniform)initWithName:(NSString *)name vectorFloat3:(vector_float3)value;
- (SKUniform)initWithName:(NSString *)name vectorFloat4:(vector_float4)value;
- (SKUniformType)uniformType;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (matrix_float2x2)matrixFloat2x2Value;
- (matrix_float3x3)matrixFloat3x3Value;
- (matrix_float4x4)matrixFloat4x4Value;
- (unint64_t)_seed;
- (vector_float2)vectorFloat2Value;
- (vector_float3)vectorFloat3Value;
- (vector_float4)vectorFloat4Value;
- (void)_addTargetShader:(id)a3;
- (void)_propagateChange;
- (void)_removeTargetShader:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFloatValue:(float)floatValue;
- (void)setFloatVector2Value:(GLKVector2)floatVector2Value;
- (void)setFloatVector3Value:(GLKVector3)floatVector3Value;
- (void)setFloatVector4Value:(GLKVector4)floatVector4Value;
- (void)setMatrixFloat2x2Value:(matrix_float2x2)matrixFloat2x2Value;
- (void)setMatrixFloat3x3Value:(matrix_float3x3)matrixFloat3x3Value;
- (void)setMatrixFloat4x4Value:(matrix_float4x4)matrixFloat4x4Value;
- (void)setTextureValue:(SKTexture *)textureValue;
- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value;
- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value;
- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value;
- (void)set_seed:(unint64_t)a3;
@end

@implementation SKUniform

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  switch(self->_type)
  {
    case 1:
      v3 = NSString;
      [(SKUniform *)self floatValue];
      uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"%.3f", v4);
      v6 = @"Float";
      goto LABEL_7;
    case 2:
      v8 = NSString;
      [(SKUniform *)self vectorFloat2Value];
      float v82 = v9;
      [(SKUniform *)self vectorFloat2Value];
      uint64_t v5 = [v8 stringWithFormat:@"{%.3f, %.3f}", v82, v10];
      v6 = @"FloatVector2";
      goto LABEL_7;
    case 3:
      v11 = NSString;
      [(SKUniform *)self vectorFloat3Value];
      float v83 = v12;
      [(SKUniform *)self vectorFloat3Value];
      float v80 = v13;
      [(SKUniform *)self vectorFloat3Value];
      uint64_t v5 = [v11 stringWithFormat:@"{%.3f, %.3f, %.3f}", v83, v80, v14];
      v6 = @"FloatVector3";
      goto LABEL_7;
    case 4:
      v15 = NSString;
      [(SKUniform *)self vectorFloat4Value];
      float v84 = v16;
      [(SKUniform *)self vectorFloat4Value];
      float v81 = v17;
      [(SKUniform *)self vectorFloat4Value];
      float v78 = v18;
      [(SKUniform *)self vectorFloat4Value];
      uint64_t v5 = [v15 stringWithFormat:@"{%.3f, %.3f, %.3f, %.3f}", v84, v81, v78, v19];
      v6 = @"FloatVector4";
LABEL_7:
      v7 = (__CFString *)v5;
      break;
    case 5:
      v20 = NSString;
      [(SKUniform *)self matrixFloat2x2Value];
      double v22 = v21;
      [(SKUniform *)self matrixFloat2x2Value];
      double v24 = v23;
      [(SKUniform *)self matrixFloat2x2Value];
      float v85 = v25;
      [(SKUniform *)self matrixFloat2x2Value];
      v7 = [v20 stringWithFormat:@"\n\t{%.3f, %.3f,\n \t%.3f, %.3f}", *(void *)&v22, *(void *)&v24, v85, v26];
      v6 = @"FloatMatrix2";
      break;
    case 6:
      v27 = NSString;
      [(SKUniform *)self matrixFloat3x3Value];
      double v29 = v28;
      [(SKUniform *)self matrixFloat3x3Value];
      double v31 = v30;
      [(SKUniform *)self matrixFloat3x3Value];
      double v33 = v32;
      [(SKUniform *)self matrixFloat3x3Value];
      double v35 = v34;
      [(SKUniform *)self matrixFloat3x3Value];
      double v37 = v36;
      [(SKUniform *)self matrixFloat3x3Value];
      double v39 = v38;
      [(SKUniform *)self matrixFloat3x3Value];
      double v41 = v40;
      [(SKUniform *)self matrixFloat3x3Value];
      float v87 = v42;
      [(SKUniform *)self matrixFloat3x3Value];
      v7 = [v27 stringWithFormat:@"\n\t{%.3f, %.3f, %.3f,\n \t%.3f, %.3f %.3f,\n \t%.3f, %.3f %.3f}", *(void *)&v29, *(void *)&v31, *(void *)&v33, *(void *)&v35, *(void *)&v37, *(void *)&v39, *(void *)&v41, v87, v43];
      v6 = @"FloatMatrix3";
      break;
    case 7:
      v44 = NSString;
      [(SKUniform *)self matrixFloat4x4Value];
      double v86 = v45;
      [(SKUniform *)self matrixFloat4x4Value];
      double v79 = v46;
      [(SKUniform *)self matrixFloat4x4Value];
      double v77 = v47;
      [(SKUniform *)self matrixFloat4x4Value];
      double v76 = v48;
      [(SKUniform *)self matrixFloat4x4Value];
      double v75 = v49;
      [(SKUniform *)self matrixFloat4x4Value];
      double v74 = v50;
      [(SKUniform *)self matrixFloat4x4Value];
      double v52 = v51;
      [(SKUniform *)self matrixFloat4x4Value];
      double v54 = v53;
      [(SKUniform *)self matrixFloat4x4Value];
      double v56 = v55;
      [(SKUniform *)self matrixFloat4x4Value];
      double v58 = v57;
      [(SKUniform *)self matrixFloat4x4Value];
      double v60 = v59;
      [(SKUniform *)self matrixFloat4x4Value];
      double v62 = v61;
      [(SKUniform *)self matrixFloat4x4Value];
      double v64 = v63;
      [(SKUniform *)self matrixFloat4x4Value];
      double v66 = v65;
      [(SKUniform *)self matrixFloat4x4Value];
      float v73 = v67;
      [(SKUniform *)self matrixFloat4x4Value];
      v7 = [v44 stringWithFormat:@"\n\t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,\n \t{%.3f, %.3f, %.3f, %.3f,}", *(void *)&v86, *(void *)&v79, *(void *)&v77, *(void *)&v76, *(void *)&v75, *(void *)&v74, *(void *)&v52, *(void *)&v54, *(void *)&v56, *(void *)&v58, *(void *)&v60, *(void *)&v62, *(void *)&v64, *(void *)&v66, v73, v68];
      v6 = @"FloatMatrix4";
      break;
    case 8:
      v69 = [(SKUniform *)self textureValue];
      if (v69)
      {
        v70 = [(SKUniform *)self textureValue];
        v7 = [v70 description];
      }
      else
      {
        v7 = @"<nil>";
      }

      v6 = @"Texture";
      break;
    default:
      v7 = 0;
      v6 = 0;
      break;
  }
  v71 = [NSString stringWithFormat:@"<SKUniform> type:'%@' value:%@", v6, v7];

  return v71;
}

- (SKUniform)initWithName:(NSString *)name
{
  uint64_t v5 = name;
  v9.receiver = self;
  v9.super_class = (Class)SKUniform;
  v6 = [(SKUniform *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    [(SKUniform *)v6 set_seed:1];
    objc_storeStrong((id *)&v7->_name, name);
  }

  return v7;
}

- (SKUniform)initWithName:(NSString *)name float:(float)value
{
  v6 = name;
  v7 = [(SKUniform *)self initWithName:v6];
  objc_super v9 = v7;
  if (v7)
  {
    *(float *)&double v8 = value;
    [(SKUniform *)v7 setFloatValue:v8];
  }

  return v9;
}

- (SKUniform)initWithName:(NSString *)name texture:(SKTexture *)texture
{
  v6 = name;
  v7 = texture;
  double v8 = [(SKUniform *)self initWithName:v6];
  objc_super v9 = v8;
  if (v8) {
    [(SKUniform *)v8 setTextureValue:v7];
  }

  return v9;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat2:(vector_float2)value
{
  v6 = name;
  v7 = [(SKUniform *)self initWithName:v6];
  double v8 = v7;
  if (v7) {
    [(SKUniform *)v7 setVectorFloat2Value:*(double *)&value];
  }

  return v8;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat3:(vector_float3)value
{
  double v10 = v4;
  v6 = name;
  v7 = [(SKUniform *)self initWithName:v6];
  double v8 = v7;
  if (v7) {
    [(SKUniform *)v7 setVectorFloat3Value:v10];
  }

  return v8;
}

- (SKUniform)initWithName:(NSString *)name vectorFloat4:(vector_float4)value
{
  double v9 = *(double *)value.i64;
  uint64_t v5 = name;
  v6 = [(SKUniform *)self initWithName:v5];
  v7 = v6;
  if (v6) {
    [(SKUniform *)v6 setVectorFloat4Value:v9];
  }

  return v7;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value
{
  double v4 = *(double *)&value.columns[1];
  double v5 = *(double *)value.columns;
  v7 = name;
  double v8 = [(SKUniform *)self initWithName:v7];
  double v9 = v8;
  if (v8) {
    -[SKUniform setMatrixFloat2x2Value:](v8, "setMatrixFloat2x2Value:", v5, v4);
  }

  return v9;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value
{
  double v10 = *(double *)value.columns[1].i64;
  double v11 = *(double *)value.columns[2].i64;
  double v9 = *(double *)value.columns[0].i64;
  double v5 = name;
  v6 = [(SKUniform *)self initWithName:v5];
  v7 = v6;
  if (v6) {
    -[SKUniform setMatrixFloat3x3Value:](v6, "setMatrixFloat3x3Value:", v9, v10, v11);
  }

  return v7;
}

- (SKUniform)initWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value
{
  double v11 = *(double *)value.columns[2].i64;
  double v12 = *(double *)value.columns[3].i64;
  double v9 = *(double *)value.columns[0].i64;
  double v10 = *(double *)value.columns[1].i64;
  double v5 = name;
  v6 = [(SKUniform *)self initWithName:v5];
  v7 = v6;
  if (v6) {
    -[SKUniform setMatrixFloat4x4Value:](v6, "setMatrixFloat4x4Value:", v9, v10, v11, v12);
  }

  return v7;
}

- (SKUniform)initWithName:(NSString *)name floatVector2:(GLKVector2)value
{
  int v6 = v5;
  int v7 = v4;
  double v9 = name;
  double v10 = [(SKUniform *)self initWithName:v9];
  float v13 = v10;
  if (v10)
  {
    LODWORD(v11) = v7;
    LODWORD(v12) = v6;
    -[SKUniform setFloatVector2Value:](v10, "setFloatVector2Value:", v11, v12);
  }

  return v13;
}

- (SKUniform)initWithName:(NSString *)name floatVector3:(GLKVector3)value
{
  int v7 = v6;
  int v8 = v5;
  int v9 = v4;
  double v11 = name;
  double v12 = [(SKUniform *)self initWithName:v11];
  float v16 = v12;
  if (v12)
  {
    LODWORD(v13) = v9;
    LODWORD(v14) = v8;
    LODWORD(v15) = v7;
    -[SKUniform setFloatVector3Value:](v12, "setFloatVector3Value:", v13, v14, v15);
  }

  return v16;
}

- (SKUniform)initWithName:(NSString *)name floatVector4:(GLKVector4)value
{
  int v8 = v7;
  int v9 = v6;
  int v10 = v5;
  int v11 = v4;
  double v13 = name;
  double v14 = [(SKUniform *)self initWithName:v13];
  float v19 = v14;
  if (v14)
  {
    LODWORD(v15) = v11;
    LODWORD(v16) = v10;
    LODWORD(v17) = v9;
    LODWORD(v18) = v8;
    -[SKUniform setFloatVector4Value:](v14, "setFloatVector4Value:", v15, v16, v17, v18);
  }

  return v19;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value
{
  int v8 = v7;
  int v9 = v6;
  int v10 = v5;
  int v11 = v4;
  double v13 = name;
  double v14 = [(SKUniform *)self initWithName:v13];
  float v19 = v14;
  if (v14)
  {
    LODWORD(v15) = v11;
    LODWORD(v16) = v10;
    LODWORD(v17) = v9;
    LODWORD(v18) = v8;
    -[SKUniform setFloatMatrix2Value:](v14, "setFloatMatrix2Value:", v15, v16, v17, v18);
  }

  return v19;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value
{
  int v6 = name;
  int v7 = [(SKUniform *)self initWithName:v6];
  int v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&value->m[4];
    v11[0] = *(_OWORD *)&value->m00;
    v11[1] = v9;
    float m22 = value->m22;
    [(SKUniform *)v7 setFloatMatrix3Value:v11];
  }

  return v8;
}

- (SKUniform)initWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value
{
  int v6 = name;
  int v7 = [(SKUniform *)self initWithName:v6];
  int v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&value->m[4];
    v12[0] = *(_OWORD *)&value->m00;
    v12[1] = v9;
    long long v10 = *(_OWORD *)&value->m[12];
    v12[2] = *(_OWORD *)&value->m[8];
    v12[3] = v10;
    [(SKUniform *)v7 setFloatMatrix4Value:v12];
  }

  return v8;
}

+ (SKUniform)uniformWithName:(NSString *)name
{
  v3 = name;
  int v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v3];

  return (SKUniform *)v4;
}

+ (SKUniform)uniformWithName:(NSString *)name float:(float)value
{
  int v5 = name;
  id v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v7 = value;
  int v8 = (void *)[v6 initWithName:v5 float:v7];

  return (SKUniform *)v8;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat2:(vector_float2)value
{
  int v5 = name;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v5 vectorFloat2:*(double *)&value];

  return (SKUniform *)v6;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat3:(vector_float3)value
{
  double v8 = v4;
  int v5 = name;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v5 vectorFloat3:v8];

  return (SKUniform *)v6;
}

+ (SKUniform)uniformWithName:(NSString *)name vectorFloat4:(vector_float4)value
{
  double v7 = *(double *)value.i64;
  double v4 = name;
  int v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v4 vectorFloat4:v7];

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat2x2:(matrix_float2x2)value
{
  double v4 = *(double *)&value.columns[1];
  double v5 = *(double *)value.columns;
  id v6 = name;
  double v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat2x2:", v6, v5, v4);

  return (SKUniform *)v7;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat3x3:(matrix_float3x3)value
{
  double v8 = *(double *)value.columns[1].i64;
  double v9 = *(double *)value.columns[2].i64;
  double v7 = *(double *)value.columns[0].i64;
  double v4 = name;
  double v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat3x3:", v4, v7, v8, v9);

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name matrixFloat4x4:(matrix_float4x4)value
{
  double v10 = *(double *)value.columns[3].i64;
  double v8 = *(double *)value.columns[1].i64;
  double v9 = *(double *)value.columns[2].i64;
  double v7 = *(double *)value.columns[0].i64;
  double v4 = name;
  double v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:matrixFloat4x4:", v4, v7, v8, v9, v10);

  return (SKUniform *)v5;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector2:(GLKVector2)value
{
  int v6 = v5;
  int v7 = v4;
  double v8 = name;
  id v9 = objc_alloc((Class)objc_opt_class());
  LODWORD(v10) = v7;
  LODWORD(v11) = v6;
  double v12 = objc_msgSend(v9, "initWithName:floatVector2:", v8, v10, v11);

  return (SKUniform *)v12;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector3:(GLKVector3)value
{
  int v7 = v6;
  int v8 = v5;
  int v9 = v4;
  double v10 = name;
  id v11 = objc_alloc((Class)objc_opt_class());
  LODWORD(v12) = v9;
  LODWORD(v13) = v8;
  LODWORD(v14) = v7;
  double v15 = objc_msgSend(v11, "initWithName:floatVector3:", v10, v12, v13, v14);

  return (SKUniform *)v15;
}

+ (SKUniform)uniformWithName:(NSString *)name floatVector4:(GLKVector4)value
{
  int v8 = v7;
  int v9 = v6;
  int v10 = v5;
  int v11 = v4;
  double v12 = name;
  id v13 = objc_alloc((Class)objc_opt_class());
  LODWORD(v14) = v11;
  LODWORD(v15) = v10;
  LODWORD(v16) = v9;
  LODWORD(v17) = v8;
  double v18 = objc_msgSend(v13, "initWithName:floatVector4:", v12, v14, v15, v16, v17);

  return (SKUniform *)v18;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix2:(GLKMatrix2)value
{
  int v8 = v7;
  int v9 = v6;
  int v10 = v5;
  int v11 = v4;
  double v12 = name;
  id v13 = objc_alloc((Class)objc_opt_class());
  LODWORD(v14) = v11;
  LODWORD(v15) = v10;
  LODWORD(v16) = v9;
  LODWORD(v17) = v8;
  double v18 = objc_msgSend(v13, "initWithName:floatMatrix2:", v12, v14, v15, v16, v17);

  return (SKUniform *)v18;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix3:(GLKMatrix3 *)value
{
  int v5 = name;
  id v6 = objc_alloc((Class)objc_opt_class());
  long long v7 = *(_OWORD *)&value->m[4];
  v10[0] = *(_OWORD *)&value->m00;
  v10[1] = v7;
  float m22 = value->m22;
  int v8 = (void *)[v6 initWithName:v5 floatMatrix3:v10];

  return (SKUniform *)v8;
}

+ (SKUniform)uniformWithName:(NSString *)name floatMatrix4:(GLKMatrix4 *)value
{
  int v5 = name;
  id v6 = objc_alloc((Class)objc_opt_class());
  long long v7 = *(_OWORD *)&value->m[4];
  v11[0] = *(_OWORD *)&value->m00;
  v11[1] = v7;
  long long v8 = *(_OWORD *)&value->m[12];
  _OWORD v11[2] = *(_OWORD *)&value->m[8];
  v11[3] = v8;
  int v9 = (void *)[v6 initWithName:v5 floatMatrix4:v11];

  return (SKUniform *)v9;
}

+ (SKUniform)uniformWithName:(NSString *)name texture:(SKTexture *)texture
{
  int v5 = name;
  id v6 = texture;
  long long v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v5 texture:v6];

  return (SKUniform *)v7;
}

- (GLKVector2)floatVector2Value
{
  return (GLKVector2)[(SKUniform *)self vectorFloat2Value];
}

- (GLKVector3)floatVector3Value
{
  uint64_t v2 = [(SKUniform *)self vectorFloat3Value];
  for (uint64_t i = 0; i != 3; ++i)
  {
    *(_OWORD *)id v6 = v4;
    *((_DWORD *)&v6[2] + i + 1) = *(_DWORD *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
  }
  *(void *)&result.x = v2;
  result.z = v3;
  return result;
}

- (GLKVector4)floatVector4Value
{
  uint64_t v2 = [(SKUniform *)self vectorFloat4Value];
  for (uint64_t i = 0; i != 4; ++i)
  {
    *(_OWORD *)id v6 = v4;
    v6[i + 4] = *(_DWORD *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
  }
  *(void *)&result.v[2] = v3;
  *(void *)&result.x = v2;
  return result;
}

- (GLKMatrix2)floatMatrix2Value
{
  uint64_t v2 = [(SKUniform *)self matrixFloat2x2Value];
  __break(1u);
  *(void *)&result.m[2] = v3;
  *(void *)&result.m00 = v2;
  return result;
}

- (GLKMatrix3)floatMatrix3Value
{
  [(SKUniform *)self matrixFloat3x3Value];
  unsigned int v5 = 0;
  v9[0] = v4;
  v9[1] = v6;
  v9[2] = v7;
  for (int i = 1; ; ++i)
  {
    *((_DWORD *)&retstr->m00 + v5) = v4;
    long long v4 = v9[i];
    v5 += 3;
  }
}

- (GLKMatrix4)floatMatrix4Value
{
  [(SKUniform *)self matrixFloat4x4Value];
  unsigned int v5 = 0;
  v10[0] = v4;
  v10[1] = v6;
  _OWORD v10[2] = v7;
  v10[3] = v8;
  for (int i = 1; ; ++i)
  {
    *((_DWORD *)&retstr->m00 + v5) = v4;
    long long v4 = v10[i];
    v5 += 4;
  }
}

- (void)setFloatVector2Value:(GLKVector2)floatVector2Value
{
  uint64_t v5 = 0;
  int v11 = v3;
  int v12 = v4;
  double v6 = 0.0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    int v9 = *(&v11 + v5);
    double v10 = v6;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v5 & 1))) = v9;
    double v6 = v10;
    uint64_t v5 = 1;
    char v7 = 0;
  }
  while ((v8 & 1) != 0);
  -[SKUniform setVectorFloat2Value:](self, "setVectorFloat2Value:", *(void *)&floatVector2Value, v10);
}

- (void)setFloatVector3Value:(GLKVector3)floatVector3Value
{
  uint64_t v6 = 0;
  int v11 = v3;
  int v12 = v4;
  int v13 = v5;
  long long v7 = 0uLL;
  do
  {
    int v8 = *(&v11 + v6);
    long long v10 = v7;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v8;
    long long v9 = v10;
    HIDWORD(v9) = HIDWORD(v7);
    ++v6;
    long long v7 = v9;
  }
  while (v6 != 3);
  -[SKUniform setVectorFloat3Value:](self, "setVectorFloat3Value:", *(void *)&floatVector3Value.x, *(void *)&floatVector3Value.v[2]);
}

- (void)setFloatVector4Value:(GLKVector4)floatVector4Value
{
  uint64_t v7 = 0;
  int v11 = v3;
  int v12 = v4;
  int v13 = v5;
  int v14 = v6;
  long long v8 = 0uLL;
  do
  {
    int v9 = *(&v11 + v7);
    long long v10 = v8;
    *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v9;
    long long v8 = v10;
    ++v7;
  }
  while (v7 != 4);
  -[SKUniform setVectorFloat4Value:](self, "setVectorFloat4Value:", *(void *)&floatVector4Value.x, *(void *)&floatVector4Value.v[2], *(double *)&v10);
}

- (vector_float2)vectorFloat2Value
{
  if (self->_type)
  {
    return *(vector_float2 *)&self->_value._floatValue;
  }
  else
  {
    self->_type = 2;
    vector_float2 result = 0;
    *(void *)&self->_value._floatValue = 0;
  }
  return result;
}

- (vector_float3)vectorFloat3Value
{
  if (!self->_type)
  {
    self->_type = 3;
    *(_OWORD *)&self->_value._floatValue = 0u;
  }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (vector_float4)vectorFloat4Value
{
  if (self->_type)
  {
    return *(vector_float4 *)&self->_value._floatValue;
  }
  else
  {
    self->_type = 4;
    vector_float4 result = 0uLL;
    *(_OWORD *)&self->_value._floatValue = 0u;
  }
  return result;
}

- (matrix_float2x2)matrixFloat2x2Value
{
  if (!self->_type)
  {
    self->_type = 5;
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x263EF8998];
  }
  simd_float2 v2 = *(simd_float2 *)&self->_value._floatValue;
  Class isa = self[1].super.isa;
  result.columns[1] = (simd_float2)isa;
  result.columns[0] = v2;
  return result;
}

- (matrix_float3x3)matrixFloat3x3Value
{
  if (!self->_type)
  {
    self->_type = 6;
    uint64_t v2 = MEMORY[0x263EF89A0];
    long long v3 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x263EF89A0];
    *(_OWORD *)&self[1]._type = v3;
    *(_OWORD *)&self[1]._seed = *(_OWORD *)(v2 + 32);
  }
  simd_float3 v4 = *(simd_float3 *)&self->_value._floatValue;
  simd_float3 v5 = *(simd_float3 *)&self[1]._type;
  simd_float3 v6 = *(simd_float3 *)&self[1]._seed;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

- (matrix_float4x4)matrixFloat4x4Value
{
  if (!self->_type)
  {
    self->_type = 7;
    long long v2 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    long long v3 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
    *(_OWORD *)&self->_value._floatValue = *MEMORY[0x263EF89A8];
    *(_OWORD *)&self[1]._type = v2;
    *(_OWORD *)&self[1]._seed = v4;
    *(_OWORD *)&self[1]._targetShaders = v3;
  }
  simd_float4 v5 = *(simd_float4 *)&self->_value._floatValue;
  simd_float4 v6 = *(simd_float4 *)&self[1]._type;
  simd_float4 v7 = *(simd_float4 *)&self[1]._seed;
  simd_float4 v8 = *(simd_float4 *)&self[1]._targetShaders;
  result.columns[3] = v8;
  result.columns[2] = v7;
  result.columns[1] = v6;
  result.columns[0] = v5;
  return result;
}

- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value
{
  if (!self->_type) {
    self->_type = 2;
  }
  *(vector_float2 *)&self->_value._floatValue = vectorFloat2Value;
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value
{
  if (!self->_type) {
    self->_type = 3;
  }
  *(_OWORD *)&self->_value._floatValue = v3;
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value
{
  if (!self->_type) {
    self->_type = 4;
  }
  *(vector_float4 *)&self->_value._floatValue = vectorFloat4Value;
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setMatrixFloat2x2Value:(matrix_float2x2)matrixFloat2x2Value
{
  if (!self->_type) {
    self->_type = 5;
  }
  *(simd_float2 *)&self->_value._floatValue = matrixFloat2x2Value.columns[0];
  self[1].super.Class isa = (Class)matrixFloat2x2Value.columns[1];
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setMatrixFloat3x3Value:(matrix_float3x3)matrixFloat3x3Value
{
  if (!self->_type) {
    self->_type = 6;
  }
  *(simd_float3 *)&self->_value._floatValue = matrixFloat3x3Value.columns[0];
  *(simd_float3 *)&self[1]._type = matrixFloat3x3Value.columns[1];
  *(simd_float3 *)&self[1]._seed = matrixFloat3x3Value.columns[2];
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setMatrixFloat4x4Value:(matrix_float4x4)matrixFloat4x4Value
{
  if (!self->_type) {
    self->_type = 7;
  }
  *(simd_float4 *)&self->_value._floatValue = matrixFloat4x4Value.columns[0];
  *(simd_float4 *)&self[1]._type = matrixFloat4x4Value.columns[1];
  *(simd_float4 *)&self[1]._seed = matrixFloat4x4Value.columns[2];
  *(simd_float4 *)&self[1]._targetShaders = matrixFloat4x4Value.columns[3];
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (void)setTextureValue:(SKTexture *)textureValue
{
  long long v4 = textureValue;
  if (!self->_type)
  {
    self->_type = 8;
    simd_float4 v5 = self->_textureValue;
    self->_textureValue = 0;
  }
  simd_float4 v6 = self->_textureValue;
  self->_textureValue = v4;

  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (SKTexture)textureValue
{
  if (!self->_type)
  {
    self->_type = 8;
    textureValue = self->_textureValue;
    self->_textureValue = 0;
  }
  long long v4 = self->_textureValue;

  return v4;
}

- (void)setFloatValue:(float)floatValue
{
  if (!self->_type)
  {
    self->_type = 1;
    textureValue = self->_textureValue;
    self->_textureValue = 0;
  }
  self->_value._floatValue = floatValue;
  [(SKUniform *)self set_seed:[(SKUniform *)self _seed] + 1];

  [(SKUniform *)self _propagateChange];
}

- (float)floatValue
{
  if (self->_type) {
    return self->_value._floatValue;
  }
  self->_type = 1;
  self->_value._floatValue = 0.0;
  return 0.0;
}

- (SKUniformType)uniformType
{
  return self->_type;
}

- (SKUniform)initWithCoder:(id)a3
{
  v84[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SKUniform *)self set_seed:0];
  self->_type = [v4 decodeIntegerForKey:@"_type"];
  simd_float4 v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
  name = self->_name;
  self->_name = v5;

  switch(self->_type)
  {
    case 1:
      [v4 decodeFloatForKey:@"_floatValue"];
      self->_value._floatValue = v7;
      break;
    case 2:
      float v46 = (void *)MEMORY[0x263EFFA08];
      v84[0] = objc_opt_class();
      v84[1] = objc_opt_class();
      v84[2] = objc_opt_class();
      float v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:3];
      float v48 = [v46 setWithArray:v47];
      float v49 = [v4 decodeObjectOfClasses:v48 forKey:@"_floatVector2Value"];

      float v50 = [v49 objectAtIndexedSubscript:0];
      [v50 floatValue];
      unsigned int v78 = v51;
      double v52 = [v49 objectAtIndexedSubscript:1];
      [v52 floatValue];
      *(void *)&self->_value._floatValue = __PAIR64__(v53, v78);

      break;
    case 3:
      simd_float4 v8 = (void *)MEMORY[0x263EFFA08];
      v83[0] = objc_opt_class();
      v83[1] = objc_opt_class();
      v83[2] = objc_opt_class();
      int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:3];
      long long v10 = [v8 setWithArray:v9];
      int v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_floatVector3Value"];

      int v12 = [v11 objectAtIndexedSubscript:0];
      [v12 floatValue];
      *(void *)&long long v76 = v13;
      int v14 = [v11 objectAtIndexedSubscript:1];
      [v14 floatValue];
      int v74 = v15;
      double v16 = [v11 objectAtIndexedSubscript:2];
      [v16 floatValue];
      long long v17 = v76;
      DWORD1(v17) = v74;
      DWORD2(v17) = v18;
      *(_OWORD *)&self->_value._floatValue = v17;

      break;
    case 4:
      float v19 = (void *)MEMORY[0x263EFFA08];
      v82[0] = objc_opt_class();
      v82[1] = objc_opt_class();
      v82[2] = objc_opt_class();
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:3];
      float v21 = [v19 setWithArray:v20];
      double v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_floatVector3Value"];

      float v23 = [v22 objectAtIndexedSubscript:0];
      [v23 floatValue];
      unsigned int v77 = v24;
      float v25 = [v22 objectAtIndexedSubscript:1];
      [v25 floatValue];
      unsigned int v75 = v26;
      v27 = [v22 objectAtIndexedSubscript:2];
      [v27 floatValue];
      unsigned int v73 = v28;
      double v29 = [v22 objectAtIndexedSubscript:3];
      [v29 floatValue];
      *(void *)&long long v30 = __PAIR64__(v75, v77);
      *((void *)&v30 + 1) = __PAIR64__(v31, v73);
      *(_OWORD *)&self->_value._floatValue = v30;

      break;
    case 5:
      float v32 = (void *)MEMORY[0x263EFFA08];
      v81[0] = objc_opt_class();
      v81[1] = objc_opt_class();
      v81[2] = objc_opt_class();
      double v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:3];
      float v34 = [v32 setWithArray:v33];
      double v35 = [v4 decodeObjectOfClasses:v34 forKey:@"_floatMatrix2Value"];

      uint64_t v36 = 0;
      char v37 = 1;
      do
      {
        uint64_t v38 = 0;
        char v39 = v37;
        char v40 = 1;
        do
        {
          char v41 = v40;
          float v42 = [v35 objectAtIndexedSubscript:v38 | (2 * v36)];
          [v42 floatValue];
          *((_DWORD *)&self->_value._floatValue + 2 * v36 + v38) = v43;

          char v40 = 0;
          uint64_t v38 = 1;
        }
        while ((v41 & 1) != 0);
        char v37 = 0;
        uint64_t v36 = 1;
      }
      while ((v39 & 1) != 0);

      break;
    case 6:
      double v54 = (void *)MEMORY[0x263EFFA08];
      v80[0] = objc_opt_class();
      v80[1] = objc_opt_class();
      v80[2] = objc_opt_class();
      float v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];
      double v56 = [v54 setWithArray:v55];
      float v57 = [v4 decodeObjectOfClasses:v56 forKey:@"_floatMatrix3Value"];

      uint64_t v58 = 0;
      for (uint64_t i = 0; i != 3; ++i)
      {
        for (uint64_t j = 0; j != 3; ++j)
        {
          float v61 = [v57 objectAtIndexedSubscript:v58 + j];
          [v61 floatValue];
          *((_DWORD *)&self->_value._floatValue + 4 * i + j) = v62;
        }
        v58 += 3;
      }

      break;
    case 7:
      float v63 = (void *)MEMORY[0x263EFFA08];
      v79[0] = objc_opt_class();
      v79[1] = objc_opt_class();
      v79[2] = objc_opt_class();
      double v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:3];
      float v65 = [v63 setWithArray:v64];
      double v66 = [v4 decodeObjectOfClasses:v65 forKey:@"_floatMatrix4Value"];

      uint64_t v67 = 0;
      for (uint64_t k = 0; k != 4; ++k)
      {
        for (uint64_t m = 0; m != 4; ++m)
        {
          v70 = [v66 objectAtIndexedSubscript:v67 + m];
          [v70 floatValue];
          *((_DWORD *)&self->_value._floatValue + 4 * k + m) = v71;
        }
        v67 += 4;
      }

      break;
    case 8:
      v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textureValue"];
      textureValue = self->_textureValue;
      self->_textureValue = v44;

      break;
    default:
      break;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  v46[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"_name"];
  [v4 encodeInteger:self->_type forKey:@"_type"];
  switch(self->_type)
  {
    case 1:
      *(float *)&double v5 = self->_value._floatValue;
      [v4 encodeFloat:@"_floatValue" forKey:v5];
      break;
    case 2:
      simd_float4 v6 = [NSNumber numberWithFloat:*(double *)&self->_value._floatValue];
      v46[0] = v6;
      LODWORD(v7) = *((_DWORD *)&self->_value + 1);
      simd_float4 v8 = [NSNumber numberWithFloat:v7];
      v46[1] = v8;
      int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
      [v4 encodeObject:v9 forKey:@"_floatVector2Value"];

      break;
    case 3:
      *(float *)&double v5 = self->_value._floatValue;
      long long v10 = [NSNumber numberWithFloat:v5];
      v45[0] = v10;
      LODWORD(v11) = *((_DWORD *)&self->_value + 1);
      int v12 = [NSNumber numberWithFloat:v11];
      v45[1] = v12;
      LODWORD(v13) = self[1].super.isa;
      int v14 = [NSNumber numberWithFloat:v13];
      v45[2] = v14;
      int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
      [v4 encodeObject:v15 forKey:@"_floatVector3Value"];

      break;
    case 4:
      *(float *)&double v5 = self->_value._floatValue;
      double v16 = [NSNumber numberWithFloat:v5];
      v44[0] = v16;
      LODWORD(v17) = *((_DWORD *)&self->_value + 1);
      int v18 = objc_msgSend(NSNumber, "numberWithFloat:", v17, v16);
      v44[1] = v18;
      LODWORD(v19) = self[1].super.isa;
      v20 = [NSNumber numberWithFloat:v19];
      v44[2] = v20;
      LODWORD(v21) = HIDWORD(self[1].super.isa);
      double v22 = [NSNumber numberWithFloat:v21];
      v44[3] = v22;
      float v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
      [v4 encodeObject:v23 forKey:@"_floatVector4Value"];

      break;
    case 5:
      unsigned int v24 = [MEMORY[0x263EFF980] array];
      uint64_t v26 = 0;
      p_value = &self->_value;
      char v28 = 1;
      do
      {
        char v29 = 0;
        char v30 = v28;
        char v31 = 1;
        do
        {
          char v32 = v31;
          LODWORD(v25) = p_value[2 * v26 + (v29 & 1)];
          double v33 = [NSNumber numberWithFloat:v25];
          [v24 addObject:v33];

          char v31 = 0;
          char v29 = 1;
        }
        while ((v32 & 1) != 0);
        char v28 = 0;
        uint64_t v26 = 1;
      }
      while ((v30 & 1) != 0);
      [v4 encodeObject:v24 forKey:@"_floatMatrix2Value"];
      goto LABEL_21;
    case 6:
      unsigned int v24 = [MEMORY[0x263EFF980] array];
      uint64_t v35 = 0;
      uint64_t v36 = &self->_value;
      do
      {
        for (int i = 0; i != 3; ++i)
        {
          LODWORD(v34) = v36[4 * v35 + (i & 3)];
          uint64_t v38 = [NSNumber numberWithFloat:v34];
          [v24 addObject:v38];
        }
        ++v35;
      }
      while (v35 != 3);
      [v4 encodeObject:v24 forKey:@"_floatMatrix3Value"];
      goto LABEL_21;
    case 7:
      unsigned int v24 = [MEMORY[0x263EFF980] array];
      uint64_t v40 = 0;
      char v41 = &self->_value;
      do
      {
        for (int j = 0; j != 4; ++j)
        {
          LODWORD(v39) = v41[4 * v40 + (j & 3)];
          int v43 = [NSNumber numberWithFloat:v39];
          [v24 addObject:v43];
        }
        ++v40;
      }
      while (v40 != 4);
      [v4 encodeObject:v24 forKey:@"_floatMatrix4Value"];
LABEL_21:

      break;
    case 8:
      [v4 encodeObject:self->_textureValue forKey:@"_textureValue"];
      break;
    default:
      break;
  }
}

- (BOOL)isEqualToUniform:(id)a3
{
  id v4 = (SKUniform *)a3;
  if (self == v4)
  {
LABEL_36:
    BOOL v29 = 1;
  }
  else
  {
    if ([(NSString *)self->_name isEqualToString:v4->_name])
    {
      int64_t type = self->_type;
      if (type == v4->_type)
      {
        switch(type)
        {
          case 1:
            float v6 = self->_value._floatValue - v4->_value._floatValue;
            goto LABEL_15;
          case 2:
            float32x2_t v7 = vsub_f32(*(float32x2_t *)&self->_value._floatValue, *(float32x2_t *)&v4->_value._floatValue);
            if ((v7.i32[0] & 0x60000000) != 0) {
              goto LABEL_37;
            }
            float v6 = v7.f32[1];
            goto LABEL_15;
          case 3:
            float32x4_t v8 = vsubq_f32(*(float32x4_t *)&self->_value._floatValue, *(float32x4_t *)&v4->_value._floatValue);
            if ((v8.i32[0] & 0x60000000) != 0 || (v8.i32[1] & 0x60000000) != 0) {
              goto LABEL_37;
            }
            float v6 = v8.f32[2];
            goto LABEL_15;
          case 4:
            float32x4_t v9 = vsubq_f32(*(float32x4_t *)&self->_value._floatValue, *(float32x4_t *)&v4->_value._floatValue);
            if ((v9.i32[0] & 0x60000000) != 0 || (v9.i32[1] & 0x60000000) != 0 || (v9.i32[2] & 0x60000000) != 0) {
              goto LABEL_37;
            }
            float v6 = v9.f32[3];
LABEL_15:
            if ((LODWORD(v6) & 0x60000000) == 0) {
              goto LABEL_36;
            }
            goto LABEL_37;
          case 5:
            uint64_t v10 = 0;
            char v11 = 1;
LABEL_18:
            char v12 = 0;
            char v13 = v11;
            uint64_t v14 = *((void *)&v4->_value._floatValue + v10);
            uint64_t v15 = *((void *)&self->_value._floatValue + v10);
            char v16 = 1;
            while (1)
            {
              char v17 = v16;
              uint64_t v32 = v14;
              float v18 = *(float *)((unint64_t)&v32 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v12 & 1)));
              uint64_t v31 = v15;
              if ((COERCE_UNSIGNED_INT(v18 - *(float *)((unint64_t)&v31 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v12 & 1)))) & 0x60000000) != 0) {
                goto LABEL_37;
              }
              char v16 = 0;
              char v12 = 1;
              if ((v17 & 1) == 0)
              {
                char v11 = 0;
                uint64_t v10 = 1;
                if (v13) {
                  goto LABEL_18;
                }
                goto LABEL_36;
              }
            }
          case 6:
            uint64_t v19 = 0;
LABEL_24:
            int v20 = 0;
            long long v21 = *((_OWORD *)&v4->_value._floatValue + v19);
            long long v22 = *((_OWORD *)&self->_value._floatValue + v19);
            while (1)
            {
              long long v34 = v21;
              float v23 = *(float *)((unint64_t)&v34 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
              long long v33 = v22;
              if ((COERCE_UNSIGNED_INT(v23 - *(float *)((unint64_t)&v33 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)))) & 0x60000000) != 0) {
                goto LABEL_37;
              }
              if (++v20 == 3)
              {
                if (++v19 != 3) {
                  goto LABEL_24;
                }
                goto LABEL_36;
              }
            }
          case 7:
            uint64_t v24 = 0;
            break;
          case 8:
            if ([(SKTexture *)self->_textureValue isEqualToTexture:v4->_textureValue]) {
              goto LABEL_36;
            }
            goto LABEL_37;
          default:
            goto LABEL_36;
        }
LABEL_30:
        int v25 = 0;
        long long v26 = *((_OWORD *)&v4->_value._floatValue + v24);
        long long v27 = *((_OWORD *)&self->_value._floatValue + v24);
        while (1)
        {
          long long v36 = v26;
          float v28 = *(float *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3 | (4 * (v25 & 3)));
          long long v35 = v27;
          if ((COERCE_UNSIGNED_INT(v28 - *(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v25 & 3)))) & 0x60000000) != 0) {
            break;
          }
          if (++v25 == 4)
          {
            if (++v24 != 4) {
              goto LABEL_30;
            }
            goto LABEL_36;
          }
        }
      }
    }
LABEL_37:
    BOOL v29 = 0;
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SKUniform);
  v4->_int64_t type = self->_type;
  long long v5 = *(_OWORD *)&self->_value._floatValue;
  long long v6 = *(_OWORD *)&self[1]._type;
  long long v7 = *(_OWORD *)&self[1]._targetShaders;
  *(_OWORD *)&v4[1]._seed = *(_OWORD *)&self[1]._seed;
  *(_OWORD *)&v4[1]._targetShaders = v7;
  *(_OWORD *)&v4->_value._floatValue = v5;
  *(_OWORD *)&v4[1]._int64_t type = v6;
  objc_storeStrong((id *)&v4->_textureValue, self->_textureValue);
  uint64_t v8 = [(SKUniform *)self name];
  name = v4->_name;
  v4->_name = (NSString *)v8;

  return v4;
}

- (void)_propagateChange
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v2 = self->_targetShaders;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "targetShader", (void)v7);
        [v6 _setUniformsDirty];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_addTargetShader:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  targetShaders = self->_targetShaders;
  if (!targetShaders)
  {
    long long v6 = [MEMORY[0x263EFF980] array];
    long long v7 = self->_targetShaders;
    self->_targetShaders = v6;

    targetShaders = self->_targetShaders;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v8 = targetShaders;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v8);
      }
      objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "targetShader", (void)v14);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12 == v4;

      if (v13) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v8 = (NSMutableArray *)objc_opt_new();
    [(NSMutableArray *)v8 setTargetShader:v4];
    [(NSMutableArray *)self->_targetShaders addObject:v8];
  }
}

- (void)_removeTargetShader:(id)a3
{
  id v4 = a3;
  targetShaders = self->_targetShaders;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SKUniform__removeTargetShader___block_invoke;
  v7[3] = &unk_263FEA150;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(NSMutableArray *)targetShaders enumerateObjectsUsingBlock:v7];
}

void __33__SKUniform__removeTargetShader___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  long long v7 = [v9 targetShader];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectAtIndex:a3];
    *a4 = 1;
  }
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)_seed
{
  return self->_seed;
}

- (void)set_seed:(unint64_t)a3
{
  self->_seed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetShaders, 0);
  objc_storeStrong((id *)&self->_textureValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end