@interface ARGeometrySource
+ (BOOL)supportsSecureCoding;
- (ARGeometrySource)initWithBuffer:(id)a3 count:(int64_t)a4 format:(unint64_t)a5 componentsPerVector:(int64_t)a6 offset:(int64_t)a7 stride:(int64_t)a8;
- (ARGeometrySource)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MTLVertexFormat)format;
- (NSInteger)componentsPerVector;
- (NSInteger)count;
- (NSInteger)offset;
- (NSInteger)stride;
- (id)buffer;
- (id)description;
- (unint64_t)componentSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setComponentsPerVector:(int64_t)a3;
- (void)setCount:(int64_t)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setOffset:(int64_t)a3;
- (void)setStride:(int64_t)a3;
@end

@implementation ARGeometrySource

- (ARGeometrySource)initWithBuffer:(id)a3 count:(int64_t)a4 format:(unint64_t)a5 componentsPerVector:(int64_t)a6 offset:(int64_t)a7 stride:(int64_t)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARGeometrySource;
  v16 = [(ARGeometrySource *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_buffer, a3);
    v17->_count = a4;
    v17->_format = a5;
    v17->_componentsPerVector = a6;
    v17->_offset = a7;
    v17->_stride = a8;
  }

  return v17;
}

- (unint64_t)componentSize
{
  unint64_t format = self->_format;
  if (format == 28 || format == 30) {
    return 4;
  }
  else {
    return format == 45;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  buffer = self->_buffer;
  id v6 = a3;
  objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](buffer, "contents"), -[ARGeometrySource componentSize](self, "componentSize") * self->_count * self->_componentsPerVector, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"buffer"];
  [v6 encodeInteger:self->_count forKey:@"count"];
  [v6 encodeInteger:self->_format forKey:@"format"];
  [v6 encodeInteger:self->_componentsPerVector forKey:@"componentsPerVector"];
  [v6 encodeInteger:self->_offset forKey:@"offset"];
  [v6 encodeInteger:self->_stride forKey:@"stride"];
}

- (ARGeometrySource)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGeometrySource;
  v5 = [(ARGeometrySource *)&v12 init];
  if (v5)
  {
    v5->_count = [v4 decodeIntegerForKey:@"count"];
    v5->_unint64_t format = [v4 decodeIntegerForKey:@"format"];
    v5->_componentsPerVector = [v4 decodeIntegerForKey:@"componentsPerVector"];
    v5->_offset = [v4 decodeIntegerForKey:@"offset"];
    v5->_stride = [v4 decodeIntegerForKey:@"stride"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buffer"];
    id v7 = MTLCreateSystemDefaultDevice();
    id v8 = v6;
    uint64_t v9 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v8, "bytes"), -[ARGeometrySource componentSize](v5, "componentSize") * v5->_count * v5->_componentsPerVector, 0);
    buffer = v5->_buffer;
    v5->_buffer = (MTLBuffer *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ARGeometrySource *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](self->_buffer, "contents"), -[ARGeometrySource componentSize](self, "componentSize") * self->_count * self->_componentsPerVector, 0);
      id v7 = (void *)MEMORY[0x1E4F1C9B8];
      id v8 = [(ARGeometrySource *)v5 buffer];
      uint64_t v9 = objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), -[ARGeometrySource componentSize](self, "componentSize")* -[ARGeometrySource count](v5, "count")* self->_componentsPerVector, 0);

      int64_t count = self->_count;
      char v11 = 0;
      if (count == [(ARGeometrySource *)v5 count])
      {
        unint64_t format = self->_format;
        if (format == [(ARGeometrySource *)v5 format]
          && (int64_t offset = self->_offset, offset == [(ARGeometrySource *)v5 offset])
          && (int64_t componentsPerVector = self->_componentsPerVector,
              componentsPerVector == [(ARGeometrySource *)v5 componentsPerVector])
          && (int64_t stride = self->_stride, stride == [(ARGeometrySource *)v5 stride]))
        {
          buffer = self->_buffer;
          v17 = [(ARGeometrySource *)v5 buffer];
          if (buffer == v17) {
            char v11 = 1;
          }
          else {
            char v11 = [v6 isEqualToData:v9];
          }
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p count=\"%ld\">", v5, self, -[ARGeometrySource count](self, "count")];

  return v6;
}

- (id)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (NSInteger)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_int64_t count = a3;
}

- (MTLVertexFormat)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_unint64_t format = a3;
}

- (NSInteger)componentsPerVector
{
  return self->_componentsPerVector;
}

- (void)setComponentsPerVector:(int64_t)a3
{
  self->_int64_t componentsPerVector = a3;
}

- (NSInteger)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_int64_t offset = a3;
}

- (NSInteger)stride
{
  return self->_stride;
}

- (void)setStride:(int64_t)a3
{
  self->_int64_t stride = a3;
}

- (void).cxx_destruct
{
}

@end