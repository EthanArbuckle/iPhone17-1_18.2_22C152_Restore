@interface VCPFaceAnchor
+ (BOOL)supportsSecureCoding;
- (NSDictionary)blendShapes;
- (VCPFaceAnchor)initWithCoder:(id)a3;
- (VCPFaceAnchor)initWithTransform:(__n128)a3 blendShapes:(__n128)a4 geometry:(__n128)a5;
- (VCPFaceGeometry)geometry;
- (__n128)transform;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VCPFaceAnchor

- (VCPFaceAnchor)initWithTransform:(__n128)a3 blendShapes:(__n128)a4 geometry:(__n128)a5
{
  id v10 = a7;
  id v11 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)VCPFaceAnchor;
  v12 = [(VCPFaceAnchor *)&v21 init];
  v13 = v12;
  if (v12)
  {
    *(__n128 *)&v12[1].super.isa = a2;
    *(__n128 *)&v12[1]._geometry = a3;
    *(__n128 *)&v12[2].super.isa = a4;
    *(__n128 *)&v12[2]._geometry = a5;
    if (v10)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v10];
      blendShapes = v13->_blendShapes;
      v13->_blendShapes = (NSDictionary *)v14;
    }
    objc_storeStrong((id *)&v13->_geometry, a8);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self[1] length:64];
  [v7 encodeObject:v4 forKey:@"transform"];

  blendShapes = self->_blendShapes;
  if (blendShapes) {
    [v7 encodeObject:blendShapes forKey:@"blendshapes"];
  }
  geometry = self->_geometry;
  if (geometry) {
    [v7 encodeObject:geometry forKey:@"geometry"];
  }
}

- (VCPFaceAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transform"];
  if ((unint64_t)[v5 length] > 0x3F)
  {
    [v5 getBytes:&v11 length:64];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendshapes"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    self = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:](self, "initWithTransform:blendShapes:geometry:", v8, v9, *(double *)&v11, *(double *)&v12, *(double *)&v13, *(double *)&v14);

    id v7 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "VCPFaceAnchor initWithCoder - unexpected size of transform data", (uint8_t *)&v11, 2u);
      }
    }
    id v7 = 0;
  }

  return v7;
}

- (__n128)transform
{
  return a1[2];
}

- (NSDictionary)blendShapes
{
  return self->_blendShapes;
}

- (VCPFaceGeometry)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_blendShapes, 0);
}

@end