@interface AVPointCloudData
+ (void)initialize;
- (ADJasperPointCloud)jasperPointCloud;
- (AVPointCloudData)initWithDataBuffer:(__CVBuffer *)a3;
- (__CVBuffer)pointCloudDataBuffer;
- (const)bankIdentifiers;
- (const)confidenceScores;
- (const)spotIdentifiers;
- (id)debugDescription;
- (id)description;
- (int64_t)pointCount;
- (int64_t)projectorMode;
- (uint64_t)points;
- (uint64_t)pointsAndConfidenceScores;
- (unsigned)pointCloudFormatType;
- (void)dealloc;
@end

@implementation AVPointCloudData

+ (void)initialize
{
}

- (id)debugDescription
{
  [(AVPointCloudData *)self pointCloudFormatType];
  uint64_t v3 = AVStringForOSType();
  int64_t v4 = [(AVPointCloudData *)self pointCount];
  v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"'%@' %d points", v3, v4];
  if ((int)v4 >= 1) {
    [v5 appendFormat:@", bank:%d", *(unsigned __int8 *)-[AVPointCloudData bankIdentifiers](self, "bankIdentifiers")];
  }
  v6 = NSString;

  return (id)[v6 stringWithString:v5];
}

- (id)description
{
  uint64_t v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVPointCloudData debugDescription](self, "debugDescription")];
}

- (void)dealloc
{
  dataBuffer = self->_dataBuffer;
  if (dataBuffer) {
    CFRelease(dataBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPointCloudData;
  [(AVPointCloudData *)&v4 dealloc];
}

- (ADJasperPointCloud)jasperPointCloud
{
  result = self->_jasperPointCloud;
  if (!result)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__1;
    v10 = __Block_byref_object_dispose__1;
    objc_super v4 = (void *)getADJasperPointCloudClass_softClass;
    uint64_t v11 = getADJasperPointCloudClass_softClass;
    if (!getADJasperPointCloudClass_softClass)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __getADJasperPointCloudClass_block_invoke;
      v5[3] = &unk_1E5A72EF8;
      v5[4] = &v6;
      __getADJasperPointCloudClass_block_invoke((uint64_t)v5);
      objc_super v4 = (void *)v7[5];
    }
    _Block_object_dispose(&v6, 8);
    result = (ADJasperPointCloud *)(id)[v4 makeWithDataBuffer:self->_dataBuffer];
    self->_jasperPointCloud = result;
  }
  return result;
}

- (unsigned)pointCloudFormatType
{
  dataBuffer = self->_dataBuffer;
  if (dataBuffer) {
    LODWORD(dataBuffer) = MEMORY[0x1F40DFBE0](dataBuffer, a2);
  }
  return dataBuffer;
}

- (int64_t)pointCount
{
  return (int)[(ADJasperPointCloud *)[(AVPointCloudData *)self jasperPointCloud] length];
}

- (uint64_t)points
{
  if ([a1 pointCloudFormatType] != 1785950320) {
    return 0;
  }
  v2 = (void *)[a1 jasperPointCloud];

  return [v2 points];
}

- (const)confidenceScores
{
  if ([(AVPointCloudData *)self pointCloudFormatType] != 1785950320) {
    return 0;
  }
  uint64_t v3 = [(AVPointCloudData *)self jasperPointCloud];

  return (const float *)[(ADJasperPointCloud *)v3 confidences];
}

- (uint64_t)pointsAndConfidenceScores
{
  return 0;
}

- (const)spotIdentifiers
{
  if ([(AVPointCloudData *)self pointCloudFormatType] != 1785950320) {
    return 0;
  }
  uint64_t v3 = [(AVPointCloudData *)self jasperPointCloud];

  return (const char *)[(ADJasperPointCloud *)v3 spotIds];
}

- (const)bankIdentifiers
{
  if ([(AVPointCloudData *)self pointCloudFormatType] != 1785950320) {
    return 0;
  }
  uint64_t v3 = [(AVPointCloudData *)self jasperPointCloud];

  return (const char *)[(ADJasperPointCloud *)v3 bankIds];
}

- (__CVBuffer)pointCloudDataBuffer
{
  return self->_dataBuffer;
}

- (int64_t)projectorMode
{
  return self->_projectorMode;
}

- (AVPointCloudData)initWithDataBuffer:(__CVBuffer *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPointCloudData;
  objc_super v4 = [(AVPointCloudData *)&v8 init];
  if (v4)
  {
    if (a3) {
      v5 = (__CVBuffer *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_dataBuffer = v5;
    uint64_t v6 = (void *)CVBufferCopyAttachment(v5, (CFStringRef)*MEMORY[0x1E4F51480], 0);
    if (v6) {
      uint64_t v6 = (void *)CFAutorelease(v6);
    }
    v4->_projectorMode = (int)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F52428]), "intValue");
  }
  return v4;
}

@end