@interface BWNodeOutputMediaConfiguration
- (BOOL)isDrivenByInputWithIndex:(unint64_t)a3;
- (BOOL)performsAttachedMediaRemapping;
- (BOOL)pixelBufferPoolProvidesBackPressure;
- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations;
- (BOOL)providesDataBufferPool;
- (BOOL)providesPixelBufferPool;
- (BWFormatRequirements)formatRequirements;
- (BWNodeOutputMediaConfiguration)init;
- (NSArray)indexesOfInputsWhichDrivesThisOutput;
- (NSString)attachedMediaKeyOfInputWhichDrivesThisOutput;
- (int)indexOfInputWhichDrivesThisOutput;
- (int)owningNodeIndefinitelyHeldBufferCount;
- (int)owningNodeRetainedBufferCount;
- (int)passthroughMode;
- (void)_setAssociatedAttachedMediaKey:(id)a3;
- (void)dealloc;
- (void)setAttachedMediaKeyOfInputWhichDrivesThisOutput:(id)a3;
- (void)setFormatRequirements:(id)a3;
- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3;
- (void)setIndexesOfInputsWhichDrivesThisOutput:(id)a3;
- (void)setOwningNodeIndefinitelyHeldBufferCount:(int)a3;
- (void)setOwningNodeRetainedBufferCount:(int)a3;
- (void)setPassthroughMode:(int)a3;
- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3;
- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3;
- (void)setProvidesDataBufferPool:(BOOL)a3;
- (void)setProvidesPixelBufferPool:(BOOL)a3;
@end

@implementation BWNodeOutputMediaConfiguration

- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3
{
  self->_pixelBufferPoolReportSlowBackPressureAllocations = a3;
}

- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3
{
  self->_pixelBufferPoolProvidesBackPressure = a3;
}

- (BWFormatRequirements)formatRequirements
{
  return self->_formatRequirements;
}

- (BOOL)isDrivenByInputWithIndex:(unint64_t)a3
{
  indexesOfInputsWhichDrivesThisOutput = self->_indexesOfInputsWhichDrivesThisOutput;
  if (!indexesOfInputsWhichDrivesThisOutput) {
    return a3 == 0;
  }
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  return [(NSArray *)indexesOfInputsWhichDrivesThisOutput containsObject:v4];
}

- (BOOL)performsAttachedMediaRemapping
{
  return self->_performsAttachedMediaRemapping;
}

- (int)passthroughMode
{
  return self->_passthroughMode;
}

- (int)indexOfInputWhichDrivesThisOutput
{
  NSUInteger v3 = [(NSArray *)self->_indexesOfInputsWhichDrivesThisOutput count];
  if (v3)
  {
    id v4 = [(NSArray *)self->_indexesOfInputsWhichDrivesThisOutput lastObject];
    LODWORD(v3) = [v4 intValue];
  }
  return v3;
}

- (void)setPassthroughMode:(int)a3
{
  self->_passthroughMode = a3;
}

- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5[1] = *MEMORY[0x1E4F143B8];

  self->_indexesOfInputsWhichDrivesThisOutput = 0;
  if (v3)
  {
    v5[0] = [NSNumber numberWithInt:v3];
    self->_indexesOfInputsWhichDrivesThisOutput = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
}

- (void)setProvidesPixelBufferPool:(BOOL)a3
{
  self->_providesPixelBufferPool = a3;
}

- (BWNodeOutputMediaConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaConfiguration;
  result = [(BWNodeOutputMediaConfiguration *)&v3 init];
  if (result)
  {
    result->_passthroughMode = 0;
    result->_performsAttachedMediaRemapping = 0;
  }
  return result;
}

- (void)_setAssociatedAttachedMediaKey:(id)a3
{
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = @"Associated attached media key must not be nil";
    goto LABEL_8;
  }
  if (self->_associatedAttachedMediaKey)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = @"Associated attached media key can only be set once";
LABEL_8:
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
  }
  associatedAttachedMediaKey = (NSString *)[a3 copy];
  self->_associatedAttachedMediaKey = associatedAttachedMediaKey;
  attachedMediaKeyOfInputWhichDrivesThisOutput = self->_attachedMediaKeyOfInputWhichDrivesThisOutput;
  if (!attachedMediaKeyOfInputWhichDrivesThisOutput)
  {
    attachedMediaKeyOfInputWhichDrivesThisOutput = (NSString *)[a3 copy];
    self->_attachedMediaKeyOfInputWhichDrivesThisOutput = attachedMediaKeyOfInputWhichDrivesThisOutput;
    associatedAttachedMediaKey = self->_associatedAttachedMediaKey;
  }
  self->_performsAttachedMediaRemapping = ![(NSString *)associatedAttachedMediaKey isEqualToString:attachedMediaKeyOfInputWhichDrivesThisOutput];
}

- (void)setProvidesDataBufferPool:(BOOL)a3
{
  self->_providesDataBufferPool = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaConfiguration;
  [(BWNodeOutputMediaConfiguration *)&v3 dealloc];
}

- (BOOL)providesPixelBufferPool
{
  return self->_providesPixelBufferPool;
}

- (int)owningNodeRetainedBufferCount
{
  return self->_owningNodeRetainedBufferCount;
}

- (BOOL)providesDataBufferPool
{
  return self->_providesDataBufferPool;
}

- (int)owningNodeIndefinitelyHeldBufferCount
{
  return self->_owningNodeIndefinitelyHeldBufferCount;
}

- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations
{
  return self->_pixelBufferPoolReportSlowBackPressureAllocations;
}

- (NSString)attachedMediaKeyOfInputWhichDrivesThisOutput
{
  return self->_attachedMediaKeyOfInputWhichDrivesThisOutput;
}

- (void)setFormatRequirements:(id)a3
{
}

- (BOOL)pixelBufferPoolProvidesBackPressure
{
  return self->_pixelBufferPoolProvidesBackPressure;
}

- (void)setOwningNodeRetainedBufferCount:(int)a3
{
  self->_owningNodeRetainedBufferCount = a3;
}

- (void)setIndexesOfInputsWhichDrivesThisOutput:(id)a3
{
  self->_indexesOfInputsWhichDrivesThisOutput = 0;
  if (a3
    && ([a3 count] == 1
     && !objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "isEqual:", &unk_1EFAFF8D0)
     || (unint64_t)[a3 count] >= 2))
  {
    self->_indexesOfInputsWhichDrivesThisOutput = (NSArray *)a3;
  }
}

- (void)setAttachedMediaKeyOfInputWhichDrivesThisOutput:(id)a3
{
  self->_attachedMediaKeyOfInputWhichDrivesThisOutput = (NSString *)[a3 copy];
  self->_performsAttachedMediaRemapping = ![(NSString *)self->_associatedAttachedMediaKey isEqualToString:a3];
}

- (NSArray)indexesOfInputsWhichDrivesThisOutput
{
  v2 = self->_indexesOfInputsWhichDrivesThisOutput;
  return v2;
}

- (void)setOwningNodeIndefinitelyHeldBufferCount:(int)a3
{
  self->_owningNodeIndefinitelyHeldBufferCount = a3;
}

@end