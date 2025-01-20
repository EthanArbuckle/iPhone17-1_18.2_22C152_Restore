@interface BWNodeOutputMediaProperties
- (BWDataBufferPool)liveDataBufferPool;
- (BWDataBufferPool)preparedDataBufferPool;
- (BWFormat)liveFormat;
- (BWFormat)resolvedFormat;
- (BWPixelBufferPool)livePixelBufferPool;
- (BWPixelBufferPool)preparedPixelBufferPool;
- (BWPointCloudFormat)resolvedPointCloudFormat;
- (BWVideoFormat)liveVideoFormat;
- (BWVideoFormat)resolvedVideoFormat;
- (int)liveDataBufferPoolSize;
- (int)livePixelBufferPoolSize;
- (int)preparedDataBufferPoolSize;
- (int)preparedPixelBufferPoolSize;
- (int)resolvedRetainedBufferCount;
- (unsigned)mediaType;
- (void)_setOwningNodeOutput:(id)a3 associatedAttachedMediaKey:(id)a4;
- (void)dealloc;
- (void)setLiveDataBufferPool:(id)a3;
- (void)setLiveDataBufferPoolSize:(int)a3;
- (void)setLiveFormat:(id)a3;
- (void)setLivePixelBufferPool:(id)a3;
- (void)setLivePixelBufferPoolSize:(int)a3;
- (void)setNodePreparedDataBufferPool:(id)a3;
- (void)setNodePreparedPixelBufferPool:(id)a3;
- (void)setPreparedDataBufferPool:(id)a3;
- (void)setPreparedDataBufferPoolSize:(int)a3;
- (void)setPreparedPixelBufferPool:(id)a3;
- (void)setPreparedPixelBufferPoolSize:(int)a3;
- (void)setPreparedSharedDataBufferPool:(id)a3;
- (void)setPreparedSharedPixelBufferPool:(id)a3;
- (void)setResolvedFormat:(id)a3;
- (void)setResolvedRetainedBufferCount:(int)a3;
@end

@implementation BWNodeOutputMediaProperties

- (BWFormat)resolvedFormat
{
  return self->_resolvedFormat;
}

- (void)setResolvedFormat:(id)a3
{
  resolvedFormat = self->_resolvedFormat;
  if (resolvedFormat != a3)
  {

    self->_resolvedFormat = (BWFormat *)a3;
    v6 = [(BWNodeOutput *)self->_owningNodeOutput node];
    associatedAttachedMediaKey = self->_associatedAttachedMediaKey;
    owningNodeOutput = self->_owningNodeOutput;
    [(BWNode *)v6 didSelectFormat:a3 forOutput:owningNodeOutput forAttachedMediaKey:associatedAttachedMediaKey];
  }
}

- (void)_setOwningNodeOutput:(id)a3 associatedAttachedMediaKey:(id)a4
{
  if (!a3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = @"Owning BWNodeOutput must not be nil";
    goto LABEL_8;
  }
  if (self->_owningNodeOutput)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3A8];
    v6 = @"Can only be owned by one BWNodeOutput";
    goto LABEL_8;
  }
  if (!a4)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    v6 = @"Associated attached media key must not be nil";
LABEL_8:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }
  self->_owningNodeOutput = (BWNodeOutput *)a3;
  self->_associatedAttachedMediaKey = (NSString *)[a4 copy];
}

- (BWVideoFormat)resolvedVideoFormat
{
  if ([(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsVideo]) {
    return (BWVideoFormat *)self->_resolvedFormat;
  }
  else {
    return 0;
  }
}

- (BWFormat)liveFormat
{
  return self->_liveFormat;
}

- (void)setPreparedPixelBufferPoolSize:(int)a3
{
  self->_preparedPixelBufferPoolSize = a3;
}

- (int)resolvedRetainedBufferCount
{
  return self->_resolvedRetainedBufferCount;
}

- (void)setPreparedPixelBufferPool:(id)a3
{
}

- (int)preparedPixelBufferPoolSize
{
  return self->_preparedPixelBufferPoolSize;
}

- (void)setLiveFormat:(id)a3
{
}

- (BWPixelBufferPool)preparedPixelBufferPool
{
  return self->_preparedPixelBufferPool;
}

- (void)setLivePixelBufferPoolSize:(int)a3
{
  self->_livePixelBufferPoolSize = a3;
}

- (void)setLivePixelBufferPool:(id)a3
{
  self->_livePixelBufferPool = (BWPixelBufferPool *)a3;
}

- (void)setResolvedRetainedBufferCount:(int)a3
{
  self->_resolvedRetainedBufferCount = a3;
}

- (void)setPreparedSharedPixelBufferPool:(id)a3
{
  if (![(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsVideo])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called for video media type";
    goto LABEL_12;
  }
  if ((objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool") & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Shared pools are not supported for providesPixelBufferPool = NO";
    goto LABEL_12;
  }
  if ([(BWNodeOutput *)self->_owningNodeOutput _passthroughModeForAttachedMediaKey:self->_associatedAttachedMediaKey] != 2)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Only outputs where passthroughMode = BWNodeOutputPassthroughModeConditional have shared pools";
    goto LABEL_12;
  }
  if (self->_preparedPixelBufferPool)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Already have prepared pixel buffer pool";
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Shared pool must not be nil";
LABEL_12:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }
  self->_preparedPixelBufferPool = (BWPixelBufferPool *)a3;
}

- (void)setNodePreparedPixelBufferPool:(id)a3
{
  if (![(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsVideo])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called for video media type";
    goto LABEL_10;
  }
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool"))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called when providesPixelBufferPool = NO";
    goto LABEL_10;
  }
  if (self->_preparedPixelBufferPool)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Already have prepared pixel buffer pool";
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Pool must not be nil";
LABEL_10:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }
  self->_preparedPixelBufferPool = (BWPixelBufferPool *)a3;
}

- (BWPixelBufferPool)livePixelBufferPool
{
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesPixelBufferPool")&& !self->_livePixelBufferPool&& !-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey)&& self->_liveFormat&& -[BWNodeOutput mediaTypeIsVideo](self->_owningNodeOutput, "mediaTypeIsVideo"))
  {
    self->_livePixelBufferPool = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", self->_liveFormat, self->_livePixelBufferPoolSize, [NSString stringWithFormat:@"%@ attached media key: %@", -[BWNodeOutput _poolName]((id *)&self->_owningNodeOutput->super.isa), self->_associatedAttachedMediaKey], -[BWNodeOutput memoryPool](self->_owningNodeOutput, "memoryPool"));
  }
  return self->_livePixelBufferPool;
}

- (BWPointCloudFormat)resolvedPointCloudFormat
{
  if ([(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsPointCloud]) {
    return (BWPointCloudFormat *)self->_resolvedFormat;
  }
  else {
    return 0;
  }
}

- (void)setNodePreparedDataBufferPool:(id)a3
{
  if (![(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsPointCloud])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called for point cloud media type";
    goto LABEL_10;
  }
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool"))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called when providesDataBufferPool = NO";
    goto LABEL_10;
  }
  if (self->_preparedDataBufferPool)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Already have prepared data buffer pool";
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Pool must not be nil";
LABEL_10:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }
  self->_preparedDataBufferPool = (BWDataBufferPool *)a3;
}

- (void)setPreparedDataBufferPoolSize:(int)a3
{
  self->_preparedDataBufferPoolSize = a3;
}

- (void)setPreparedDataBufferPool:(id)a3
{
}

- (void)setLiveDataBufferPoolSize:(int)a3
{
  self->_liveDataBufferPoolSize = a3;
}

- (void)setLiveDataBufferPool:(id)a3
{
  self->_liveDataBufferPool = (BWDataBufferPool *)a3;
}

- (BWDataBufferPool)preparedDataBufferPool
{
  return self->_preparedDataBufferPool;
}

- (int)preparedDataBufferPoolSize
{
  return self->_preparedDataBufferPoolSize;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutputMediaProperties;
  [(BWNodeOutputMediaProperties *)&v3 dealloc];
}

- (void)setPreparedSharedDataBufferPool:(id)a3
{
  if (![(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsPointCloud])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Can only be called for point cloud media type";
    goto LABEL_12;
  }
  if ((objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool") & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Shared pools are not supported for providesDataBufferPool = NO";
    goto LABEL_12;
  }
  if ([(BWNodeOutput *)self->_owningNodeOutput _passthroughModeForAttachedMediaKey:self->_associatedAttachedMediaKey] != 2)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Only outputs where passthroughMode = BWNodeOutputPassthroughModeConditional have shared pools";
    goto LABEL_12;
  }
  if (self->_preparedDataBufferPool)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Already have prepared data buffer pool";
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    v7 = @"Shared pool must not be nil";
LABEL_12:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }
  self->_preparedDataBufferPool = (BWDataBufferPool *)a3;
}

- (BWVideoFormat)liveVideoFormat
{
  if ([(BWNodeOutput *)self->_owningNodeOutput mediaTypeIsVideo]) {
    return (BWVideoFormat *)self->_liveFormat;
  }
  else {
    return 0;
  }
}

- (BWDataBufferPool)liveDataBufferPool
{
  if (objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->_owningNodeOutput, "mediaConfigurationForAttachedMediaKey:", self->_associatedAttachedMediaKey), "providesDataBufferPool")&& !self->_liveDataBufferPool&& !-[BWNodeOutput _passthroughModeForAttachedMediaKey:](self->_owningNodeOutput, "_passthroughModeForAttachedMediaKey:", self->_associatedAttachedMediaKey)&& self->_liveFormat&& -[BWNodeOutput mediaTypeIsPointCloud](self->_owningNodeOutput, "mediaTypeIsPointCloud"))
  {
    self->_liveDataBufferPool = -[BWDataBufferPool initWithFormat:capacity:name:clientProvidesPool:]([BWDataBufferPool alloc], "initWithFormat:capacity:name:clientProvidesPool:", self->_liveFormat, self->_liveDataBufferPoolSize, [NSString stringWithFormat:@"%@ attached media key: %@", -[BWNodeOutput _poolName]((id *)&self->_owningNodeOutput->super.isa), self->_associatedAttachedMediaKey], 0);
  }
  return self->_liveDataBufferPool;
}

- (int)livePixelBufferPoolSize
{
  return self->_livePixelBufferPoolSize;
}

- (int)liveDataBufferPoolSize
{
  return self->_liveDataBufferPoolSize;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

@end