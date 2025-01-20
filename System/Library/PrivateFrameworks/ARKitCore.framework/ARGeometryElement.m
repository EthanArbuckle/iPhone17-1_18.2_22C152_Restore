@interface ARGeometryElement
+ (BOOL)supportsSecureCoding;
- (ARGeometryElement)initWithBuffer:(id)a3 count:(int64_t)a4 bytesPerIndex:(int64_t)a5 primitiveType:(int64_t)a6;
- (ARGeometryElement)initWithCoder:(id)a3;
- (ARGeometryPrimitiveType)primitiveType;
- (BOOL)isEqual:(id)a3;
- (NSInteger)bytesPerIndex;
- (NSInteger)count;
- (NSInteger)indexCountPerPrimitive;
- (id)buffer;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setBytesPerIndex:(int64_t)a3;
- (void)setCount:(int64_t)a3;
- (void)setPrimitiveType:(int64_t)a3;
@end

@implementation ARGeometryElement

- (ARGeometryElement)initWithBuffer:(id)a3 count:(int64_t)a4 bytesPerIndex:(int64_t)a5 primitiveType:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARGeometryElement;
  v12 = [(ARGeometryElement *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_buffer, a3);
    v13->_count = a4;
    v13->_bytesPerIndex = a5;
    v13->_primitiveType = a6;
  }

  return v13;
}

- (NSInteger)indexCountPerPrimitive
{
  if (self->_primitiveType == 1) {
    return 3;
  }
  else {
    return 2;
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
  objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](buffer, "contents"), self->_bytesPerIndex * self->_count * -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"buffer"];
  [v6 encodeInteger:self->_count forKey:@"count"];
  [v6 encodeInteger:self->_bytesPerIndex forKey:@"bytesPerIndex"];
  [v6 encodeInteger:self->_primitiveType forKey:@"primitiveType"];
}

- (ARGeometryElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGeometryElement;
  v5 = [(ARGeometryElement *)&v12 init];
  if (v5)
  {
    v5->_count = [v4 decodeIntegerForKey:@"count"];
    v5->_bytesPerIndex = [v4 decodeIntegerForKey:@"bytesPerIndex"];
    v5->_primitiveType = [v4 decodeIntegerForKey:@"primitiveType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buffer"];
    id v7 = MTLCreateSystemDefaultDevice();
    id v8 = v6;
    uint64_t v9 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v8, "bytes"), v5->_bytesPerIndex * v5->_count * -[ARGeometryElement indexCountPerPrimitive](v5, "indexCountPerPrimitive"), 0);
    buffer = v5->_buffer;
    v5->_buffer = (MTLBuffer *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ARGeometryElement *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](self->_buffer, "contents"), self->_bytesPerIndex* self->_count* -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);
      id v7 = (void *)MEMORY[0x1E4F1C9B8];
      id v8 = [(ARGeometryElement *)v5 buffer];
      uint64_t v9 = objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), -[ARGeometryElement bytesPerIndex](v5, "bytesPerIndex")* -[ARGeometryElement count](v5, "count")* -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);

      int64_t count = self->_count;
      BOOL v11 = 0;
      if (count == [(ARGeometryElement *)v5 count])
      {
        int64_t bytesPerIndex = self->_bytesPerIndex;
        if (bytesPerIndex == [(ARGeometryElement *)v5 bytesPerIndex])
        {
          buffer = self->_buffer;
          v14 = [(ARGeometryElement *)v5 buffer];
          if (buffer == v14 || [v6 isEqualToData:v9])
          {
            int64_t primitiveType = self->_primitiveType;
            BOOL v11 = primitiveType == [(ARGeometryElement *)v5 primitiveType];
          }
          else
          {
            BOOL v11 = 0;
          }
        }
        else
        {
          BOOL v11 = 0;
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p count=\"%ld\">", v5, self, -[ARGeometryElement count](self, "count")];

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

- (NSInteger)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (void)setBytesPerIndex:(int64_t)a3
{
  self->_int64_t bytesPerIndex = a3;
}

- (ARGeometryPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (void)setPrimitiveType:(int64_t)a3
{
  self->_int64_t primitiveType = a3;
}

- (void).cxx_destruct
{
}

@end