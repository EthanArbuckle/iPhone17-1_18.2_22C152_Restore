@interface ARAnchor
+ (BOOL)supportsSecureCoding;
- (ARAnchor)initWithAnchor:(id)a3;
- (ARAnchor)initWithCoder:(id)a3;
- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4;
- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5;
- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5 hiddenFromPublicDelegate:(uint64_t)a6;
- (ARAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform;
- (ARAnchor)initWithTransform:(simd_float4x4)transform;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAnchor:(id)a3;
- (BOOL)isHiddenFromPublicDelegate;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)sessionIdentifier;
- (__n128)referenceTransform;
- (__n128)setReferenceTransform:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (double)lastUpdateTimestamp;
- (id)_description:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookObject;
- (id)description;
- (simd_float4x4)transform;
- (uint64_t)updateTransformToCoordinateSpace:(float32x4_t)a3 withTimestamp:(float32x4_t)a4;
- (unint64_t)hash;
- (void)_commonInit:(__n128)a3 transform:(__n128)a4 name:(__n128)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUpdateTimestamp:(double)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation ARAnchor

- (ARAnchor)initWithTransform:(simd_float4x4)transform
{
  double v8 = *(double *)transform.columns[2].i64;
  double v9 = *(double *)transform.columns[3].i64;
  double v6 = *(double *)transform.columns[0].i64;
  double v7 = *(double *)transform.columns[1].i64;
  v10.receiver = self;
  v10.super_class = (Class)ARAnchor;
  v3 = [(ARAnchor *)&v10 init];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    -[ARAnchor _commonInit:transform:name:](v3, "_commonInit:transform:name:", v4, 0, v6, v7, v8, v9);
  }
  return v3;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5
{
  id v10 = a7;
  id v11 = a8;
  v19.receiver = a1;
  v19.super_class = (Class)ARAnchor;
  v12 = [(ARAnchor *)&v19 init];
  if (v12)
  {
    v13 = (void *)[v11 copy];
    -[ARAnchor _commonInit:transform:name:](v12, "_commonInit:transform:name:", v10, v13, a2, a3, a4, a5);
  }
  return v12;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5 hiddenFromPublicDelegate:(uint64_t)a6
{
  id v12 = a7;
  id v13 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)ARAnchor;
  v14 = [(ARAnchor *)&v21 init];
  if (v14)
  {
    v15 = (void *)[v13 copy];
    -[ARAnchor _commonInit:transform:name:](v14, "_commonInit:transform:name:", v12, v15, a2, a3, a4, a5);

    v14->_isHiddenFromPublicDelegate = a9;
  }

  return v14;
}

- (ARAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform
{
  double v12 = *(double *)transform.columns[2].i64;
  double v13 = *(double *)transform.columns[3].i64;
  double v10 = *(double *)transform.columns[0].i64;
  double v11 = *(double *)transform.columns[1].i64;
  v5 = name;
  v14.receiver = self;
  v14.super_class = (Class)ARAnchor;
  double v6 = [(ARAnchor *)&v14 init];
  if (v6)
  {
    double v7 = [MEMORY[0x1E4F29128] UUID];
    double v8 = (void *)[(NSString *)v5 copy];
    -[ARAnchor _commonInit:transform:name:](v6, "_commonInit:transform:name:", v7, v8, v10, v11, v12, v13);
  }
  return v6;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4
{
  id v8 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)ARAnchor;
  double v9 = [(ARAnchor *)&v16 init];
  if (v9)
  {
    double v10 = (void *)[v8 copy];
    -[ARAnchor _commonInit:transform:name:](v9, "_commonInit:transform:name:", v10, 0, a2, a3, a4, a5);
  }
  return v9;
}

- (void)_commonInit:(__n128)a3 transform:(__n128)a4 name:(__n128)a5
{
  id v18 = a7;
  id v10 = a8;
  if (v18)
  {
    id v11 = v18;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F29128] UUID];
  }
  double v12 = (void *)a1[1].n128_u64[0];
  a1[1].n128_u64[0] = (unint64_t)v11;

  a1[3] = a2;
  a1[4] = a3;
  a1[5] = a4;
  a1[6] = a5;
  a1[7] = a2;
  a1[8] = a3;
  a1[9] = a4;
  a1[10] = a5;
  double v13 = (void *)a1[1].n128_u64[1];
  a1[1].n128_u64[1] = (unint64_t)v10;

  a1->n128_u8[8] = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"transform", *(double *)self->_anon_30, *(double *)&self->_anon_30[16], *(double *)&self->_anon_30[32], *(double *)&self->_anon_30[48]);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"referenceTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._identifier, *(double *)&self[1]._sessionIdentifier, *(double *)self[1]._anon_30);
  [v5 encodeDouble:@"lastUpdateTimestamp" forKey:self->_lastUpdateTimestamp];
  [v5 encodeBool:self->_isHiddenFromPublicDelegate forKey:@"isHiddenFromPublicDelegate"];
  name = self->_name;
  if (name) {
    [v5 encodeObject:name forKey:@"name"];
  }
}

- (ARAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"transform");
    long long v29 = v6;
    long long v27 = v8;
    long long v28 = v7;
    long long v26 = v9;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"referenceTransform");
    long long v24 = v11;
    long long v25 = v10;
    long long v22 = v13;
    long long v23 = v12;
    [v4 decodeDoubleForKey:@"lastUpdateTimestamp"];
    double v15 = v14;
    v30.receiver = self;
    v30.super_class = (Class)ARAnchor;
    objc_super v16 = [(ARAnchor *)&v30 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_identifier, v5);
      *(_OWORD *)v17->_anon_30 = v29;
      *(_OWORD *)&v17->_anon_30[16] = v28;
      *(_OWORD *)&v17->_anon_30[32] = v27;
      *(_OWORD *)&v17->_anon_30[48] = v26;
      *(_OWORD *)&v17[1].super.isa = v25;
      *(_OWORD *)&v17[1]._identifier = v24;
      *(_OWORD *)&v17[1]._sessionIdentifier = v23;
      *(_OWORD *)v17[1]._anon_30 = v22;
      v17->_lastUpdateTimestamp = v15;
      v17->_isHiddenFromPublicDelegate = [v4 decodeBoolForKey:@"isHiddenFromPublicDelegate"];
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      name = v17->_name;
      v17->_name = (NSString *)v18;
    }
    self = v17;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ARAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARAnchor;
  id v5 = [(ARAnchor *)&v24 init];
  if (v5)
  {
    long long v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    long long v9 = [v4 name];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 sessionIdentifier];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v12;

    [v4 transform];
    *(_OWORD *)v5->_anon_30 = v14;
    *(_OWORD *)&v5->_anon_30[16] = v15;
    *(_OWORD *)&v5->_anon_30[32] = v16;
    *(_OWORD *)&v5->_anon_30[48] = v17;
    [v4 referenceTransform];
    *(_OWORD *)&v5[1].super.isa = v18;
    *(_OWORD *)&v5[1]._identifier = v19;
    *(_OWORD *)&v5[1]._sessionIdentifier = v20;
    *(_OWORD *)v5[1]._anon_30 = v21;
    [v4 lastUpdateTimestamp];
    v5->_lastUpdateTimestamp = v22;
    v5->_isHiddenFromPublicDelegate = [v4 isHiddenFromPublicDelegate];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithAnchor:self];
}

- (unint64_t)hash
{
  v2 = [(ARAnchor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARAnchor;
  if ([(ARAnchor *)&v7 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ARAnchor *)self isEqualToAnchor:v4];
  }

  return v5;
}

- (BOOL)isEqualToAnchor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ARAnchor *)self identifier];
  long long v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F28E78];
  long long v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  long long v8 = [v5 stringWithFormat:@"<%@: %p", v7, self];

  long long v9 = [(ARAnchor *)self identifier];
  [v8 appendFormat:@" identifier=\"%@\"", v9];

  uint64_t v10 = [(ARAnchor *)self sessionIdentifier];

  if (v10)
  {
    long long v11 = [(ARAnchor *)self sessionIdentifier];
    uint64_t v12 = [v11 UUIDString];
    [v8 appendFormat:@" sessionIdentifier=\"%@\"", v12];
  }
  long long v13 = [(ARAnchor *)self name];

  if (v13)
  {
    long long v14 = [(ARAnchor *)self name];
    [v8 appendFormat:@" name=\"%@\"", v14];
  }
  if (objc_opt_respondsToSelector())
  {
    int v15 = [(ARAnchor *)self isTracked];
    long long v16 = @"NO";
    if (v15) {
      long long v16 = @"YES";
    }
    [v8 appendFormat:@" tracked=%@", v16];
  }
  [(ARAnchor *)self transform];
  long long v21 = ARMatrix4x4Description(v3, v17, v18, v19, v20);
  [v8 appendFormat:@" transform=%@", v21];

  [v8 appendString:@">"];
  return v8;
}

- (id)description
{
  return [(ARAnchor *)self _description:0];
}

- (id)debugQuickLookObject
{
  return [(ARAnchor *)self _description:1];
}

- (uint64_t)updateTransformToCoordinateSpace:(float32x4_t)a3 withTimestamp:(float32x4_t)a4
{
  [a1 transform];
  uint64_t v8 = 0;
  v18[0] = v9;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v12;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  do
  {
    *(long long *)((char *)&v19 + v8 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v18[v8])), a3, *(float32x2_t *)&v18[v8], 1), a4, (float32x4_t)v18[v8], 2), a5, (float32x4_t)v18[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  uint64_t result = objc_msgSend(a1, "setTransform:", *(double *)&v19, *(double *)&v20, *(double *)&v21, *(double *)&v22);
  if (a6 != 0.0)
  {
    return [a1 setLastUpdateTimestamp:a6];
  }
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (simd_float4x4)transform
{
  simd_float4 v2 = *(simd_float4 *)self->_anon_30;
  simd_float4 v3 = *(simd_float4 *)&self->_anon_30[16];
  simd_float4 v4 = *(simd_float4 *)&self->_anon_30[32];
  simd_float4 v5 = *(simd_float4 *)&self->_anon_30[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (__n128)referenceTransform
{
  return a1[7];
}

- (__n128)setReferenceTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  self->_lastUpdateTimestamp = a3;
}

- (BOOL)isHiddenFromPublicDelegate
{
  return self->_isHiddenFromPublicDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end