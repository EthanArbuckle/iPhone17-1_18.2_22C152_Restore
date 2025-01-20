@interface REAttributeDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4;
- (NSString)name;
- (REAttributeDescriptor)initWithCoder:(id)a3;
- (REAttributeDescriptor)initWithName:(id)a3 buffer:(const void *)a4 elementSize:(unint64_t)a5 payloadLayout:(void *)a6;
- (REAttributeDescriptor)initWithName:(id)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5 stride:(unsigned int)a6;
- (unint64_t)bufferSize;
- (unint64_t)estimateContainerSize;
- (unsigned)count;
- (unsigned)payloadOffset;
- (unsigned)stride;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REAttributeDescriptor

- (REAttributeDescriptor)initWithName:(id)a3 buffer:(const void *)a4 elementSize:(unint64_t)a5 payloadLayout:(void *)a6
{
  id v10 = a3;

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAttributeDescriptor)initWithName:(id)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5 stride:(unsigned int)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REAttributeDescriptor;
  v11 = [(REAttributeDescriptor *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_payloadOffset = a4;
    v11->_count = a5;
    v11->_stride = a6;
  }

  return v11;
}

- (REAttributeDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  v7 = self->_name;
  unint64_t v8 = [v4 decodeIntegerForKey:@"payloadOffset"];
  self->_payloadOffset = v8;
  unint64_t v9 = [v4 decodeIntegerForKey:@"count"];
  self->_count = v9;
  unint64_t v10 = [v4 decodeIntegerForKey:@"stride"];
  self->_stride = v10;
  if (HIDWORD(v10) || HIDWORD(v9) || HIDWORD(v8)) {
    v13 = {;
  }
    [v4 failWithError:v13];
LABEL_8:

    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if (!v7) {
    v13 = {;
  }
    [v4 failWithError:v13];
    goto LABEL_8;
  }
  uint64_t v12 = self;
LABEL_9:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_payloadOffset forKey:@"payloadOffset"];
  [v4 encodeInt:self->_count forKey:@"count"];
  [v4 encodeInt:self->_stride forKey:@"stride"];
  [v4 encodeObject:self->_name forKey:@"name"];
}

- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4
{
  unint64_t payloadOffset = self->_payloadOffset;
  unint64_t v7 = [(REAttributeDescriptor *)self bufferSize];
  if (v7 && !__CFADD__(payloadOffset, v7) && payloadOffset < a3 && payloadOffset + v7 <= a3) {
    return 1;
  }
  return 0;
}

- (unint64_t)bufferSize
{
  return self->_stride * self->_count;
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
    unint64_t v8 = self->_name;
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

- (void).cxx_destruct
{
}

@end