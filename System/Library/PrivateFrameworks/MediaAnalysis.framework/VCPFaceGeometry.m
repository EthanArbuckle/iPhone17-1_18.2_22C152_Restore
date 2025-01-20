@interface VCPFaceGeometry
+ (BOOL)supportsSecureCoding;
- (VCPFaceGeometry)initWithCoder:(id)a3;
- (VCPFaceGeometry)initWithVertices:(VCPFaceGeometry *)self vertexCount:(SEL)a2;
- (uint64_t)vertices;
- (unint64_t)vertexCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VCPFaceGeometry

- (VCPFaceGeometry)initWithVertices:(VCPFaceGeometry *)self vertexCount:(SEL)a2
{
  unint64_t v3 = v2;
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceGeometry;
  v4 = [(VCPFaceGeometry *)&v9 init];
  v5 = v4;
  if (v3 - 5001 >= 0xFFFFFFFFFFFFEC78 && v4 != 0)
  {
    v4->_vertexCount = v3;
    operator new[]();
  }
  v7 = (VCPFaceGeometry *)0;

  return v7;
}

- (uint64_t)vertices
{
  return *(void *)(a1 + 8);
}

- (void)dealloc
{
  uint64_t v3 = *(void *)self->_vertices;
  if (v3) {
    MEMORY[0x1C186C790](v3, 0x1000C80451B5BE8);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPFaceGeometry;
  [(VCPFaceGeometry *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)self->_vertices length:16 * self->_vertexCount];
  [v5 encodeObject:v4 forKey:@"vertices"];
}

- (VCPFaceGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vertices"];
  unint64_t v6 = [v5 length];
  if (v6 > 0xF)
  {
    self = -[VCPFaceGeometry initWithVertices:vertexCount:](self, "initWithVertices:vertexCount:", [v5 bytes], v6 >> 4);
    v8 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "VCPFaceGeometry initWithCoder - vertices data missing", v10, 2u);
      }
    }
    v8 = 0;
  }

  return v8;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

@end