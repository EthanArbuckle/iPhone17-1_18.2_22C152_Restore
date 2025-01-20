@interface BWPointCloudFormat
+ (BWPointCloudFormatRequirements)_formatRequirementsByResolvingFormatRequirements:(void *)a3 withFormatRequirements:;
+ (id)formatByResolvingRequirements:(id)a3;
+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4;
+ (void)initialize;
- (NSDictionary)dataBufferAttributes;
- (NSString)debugDescription;
- (NSString)description;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)dataBufferSize;
- (unint64_t)maxPoints;
- (unsigned)dataFormat;
- (unsigned)mediaType;
- (void)_initWithResolvedFormatRequirements:(void *)a1;
- (void)dealloc;
@end

@implementation BWPointCloudFormat

+ (id)formatByResolvingRequirements:(id)a3
{
  return (id)[a1 formatByResolvingRequirements:a3 printErrors:1];
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"requirements array must have 1 or more objects";
LABEL_20:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v17 userInfo:0]);
  }
  uint64_t v6 = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(a3);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = @"requirementsArray must contain BWPointCloudFormatRequirements objects";
        goto LABEL_20;
      }
      ++v10;
    }
    while (v8 != v10);
    uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);
LABEL_10:
  if (v6 == 1)
  {
    v11 = +[BWPointCloudFormat _formatRequirementsByResolvingFormatRequirements:withFormatRequirements:]((uint64_t)BWPointCloudFormat, (void *)[a3 firstObject], 0);
  }
  else
  {
    v11 = 0;
    for (uint64_t i = 1; v6 != i; ++i)
    {
      v14 = (void *)[a3 objectAtIndex:i];
      if (!v11) {
        v11 = (void *)[a3 objectAtIndex:i - 1];
      }
      id result = +[BWPointCloudFormat _formatRequirementsByResolvingFormatRequirements:withFormatRequirements:]((uint64_t)BWPointCloudFormat, v11, v14);
      v11 = result;
      if (!result) {
        return result;
      }
    }
  }
  return -[BWPointCloudFormat _initWithResolvedFormatRequirements:]([BWPointCloudFormat alloc], v11);
}

- (void)_initWithResolvedFormatRequirements:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWPointCloudFormat;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[4] = objc_msgSend((id)objc_msgSend(a2, "dataBufferAttributes"), "copy");
    *((_DWORD *)v3 + 6) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedDataFormats"), "firstObject"), "intValue");
    v3[1] = [a2 maxPoints];
    v3[2] = [a2 dataBufferSize];
  }
  return v3;
}

- (unsigned)dataFormat
{
  return self->_dataFormat;
}

- (unint64_t)dataBufferSize
{
  return self->_dataBufferSize;
}

- (NSDictionary)dataBufferAttributes
{
  return self->_dataBufferAttributes;
}

+ (BWPointCloudFormatRequirements)_formatRequirementsByResolvingFormatRequirements:(void *)a3 withFormatRequirements:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self;
  objc_super v5 = (void *)[a2 supportedDataFormats];
  uint64_t v6 = (void *)[a3 supportedDataFormats];
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if ([v6 containsObject:v12]) {
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else if ([v5 count])
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v7 = v6;
  }
  uint64_t v13 = [a2 maxPoints];
  uint64_t v14 = [a3 maxPoints];
  uint64_t v15 = v14;
  if (v13 && v14 && v13 != v14) {
    return 0;
  }
  uint64_t v16 = [a2 dataBufferSize];
  uint64_t v17 = [a3 dataBufferSize];
  uint64_t v18 = v17;
  if (v16)
  {
    if (v17 && v16 != v17) {
      return 0;
    }
  }
  long long v19 = objc_alloc_init(BWPointCloudFormatRequirements);
  [(BWPointCloudFormatRequirements *)v19 setSupportedDataFormats:v7];
  if (v13) {
    uint64_t v20 = v13;
  }
  else {
    uint64_t v20 = v15;
  }
  [(BWPointCloudFormatRequirements *)v19 setMaxPoints:v20];
  if (v16) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = v18;
  }
  [(BWPointCloudFormatRequirements *)v19 setDataBufferSize:v21];
  return v19;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormat;
  [(BWPointCloudFormat *)&v3 dealloc];
}

- (unsigned)mediaType
{
  return 1885564004;
}

- (NSString)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"%@, %ld points (%ld bytes)", BWStringFromCVPixelFormatType(self->_dataFormat), self->_maxPoints, self->_dataBufferSize];
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWPointCloudFormat description](self, "description")];
}

- (opaqueCMFormatDescription)formatDescription
{
  v8[2] = *MEMORY[0x1E4F143B8];
  CFTypeRef arg = 0;
  v7[0] = *MEMORY[0x1E4F21640];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWPointCloudFormat maxPoints](self, "maxPoints"));
  v7[1] = *MEMORY[0x1E4F1EE20];
  v8[0] = v3;
  v8[1] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v4 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(BWPointCloudFormat *)self mediaType], [(BWPointCloudFormat *)self dataFormat], v4, (CMFormatDescriptionRef *)&arg);
  id result = (opaqueCMFormatDescription *)arg;
  if (arg) {
    return (opaqueCMFormatDescription *)CFAutorelease(arg);
  }
  return result;
}

- (unint64_t)maxPoints
{
  return self->_maxPoints;
}

@end