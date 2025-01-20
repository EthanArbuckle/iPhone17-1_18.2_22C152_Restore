@interface BWPointCloudFormatRequirements
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)memoryPoolUseAllowed;
- (BWPointCloudFormatRequirements)init;
- (BWPointCloudFormatRequirements)initWithCoder:(id)a3;
- (Class)formatClass;
- (NSArray)supportedDataFormats;
- (NSDictionary)dataBufferAttributes;
- (id)description;
- (unint64_t)dataBufferSize;
- (unint64_t)hash;
- (unint64_t)maxPoints;
- (unsigned)mediaType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDataBufferSize:(unint64_t)a3;
- (void)setMaxPoints:(unint64_t)a3;
- (void)setMemoryPoolUseAllowed:(BOOL)a3;
- (void)setSupportedDataFormats:(id)a3;
@end

@implementation BWPointCloudFormatRequirements

- (Class)formatClass
{
  return (Class)objc_opt_class();
}

- (NSDictionary)dataBufferAttributes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F249A8];
  v4[0] = MEMORY[0x1E4F1CC38];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (BWPointCloudFormatRequirements)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormatRequirements;
  return [(BWFormatRequirements *)&v3 init];
}

- (unint64_t)maxPoints
{
  return self->_maxPoints;
}

- (NSArray)supportedDataFormats
{
  return self->_supportedDataFormats;
}

- (unint64_t)dataBufferSize
{
  return self->_dataBufferSize;
}

- (void)setSupportedDataFormats:(id)a3
{
}

- (void)setMaxPoints:(unint64_t)a3
{
  self->_maxPoints = a3;
}

- (void)setDataBufferSize:(unint64_t)a3
{
  self->_dataBufferSize = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormatRequirements;
  [(BWPointCloudFormatRequirements *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWPointCloudFormatRequirements)initWithCoder:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v4 = [(BWPointCloudFormatRequirements *)self init];
  if (v4)
  {
    v4->_maxPoints = [a3 decodeInt64ForKey:@"maxPoints"];
    v4->_dataBufferSize = [a3 decodeInt64ForKey:@"dataBufferSize"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v4->_supportedDataFormats = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 2)), @"supportedDataFormats");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_maxPoints forKey:@"maxPoints"];
  [a3 encodeInt64:self->_dataBufferSize forKey:@"dataBufferSize"];
  supportedDataFormats = self->_supportedDataFormats;
  [a3 encodeObject:supportedDataFormats forKey:@"supportedDataFormats"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [a3 maxPoints] != self->_maxPoints
    || [a3 dataBufferSize] != self->_dataBufferSize)
  {
    return 0;
  }
  if ((NSArray *)[a3 supportedDataFormats] == self->_supportedDataFormats) {
    return 1;
  }
  return objc_msgSend((id)objc_msgSend(a3, "supportedDataFormats"), "isEqual:", self->_supportedDataFormats);
}

- (unint64_t)hash
{
  return [(NSArray *)self->_supportedDataFormats hash];
}

- (unsigned)mediaType
{
  return 1885564004;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:0];
  v4 = v3;
  if (self->_maxPoints) {
    objc_msgSend(v3, "appendFormat:", @"%i", self->_maxPoints);
  }
  else {
    [v3 appendString:@"[any points]"];
  }
  [v4 appendString:@", "];
  if ([(NSArray *)self->_supportedDataFormats count])
  {
    if ([(NSArray *)self->_supportedDataFormats count] == 1)
    {
      v5 = BWStringFromCVPixelFormatType(objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_supportedDataFormats, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
    }
    else
    {
      [v4 appendString:@"["];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      supportedDataFormats = self->_supportedDataFormats;
      uint64_t v7 = [(NSArray *)supportedDataFormats countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        int v9 = 0;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(supportedDataFormats);
            }
            v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (-v9 != i) {
              [v4 appendString:@", "];
            }
            objc_msgSend(v4, "appendString:", BWStringFromCVPixelFormatType(objc_msgSend(v12, "unsignedIntValue")));
          }
          v9 += v8;
          uint64_t v8 = [(NSArray *)supportedDataFormats countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
      v5 = @"]";
    }
  }
  else
  {
    v5 = @"[any format]";
  }
  [v4 appendString:v5];
  return v4;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

@end