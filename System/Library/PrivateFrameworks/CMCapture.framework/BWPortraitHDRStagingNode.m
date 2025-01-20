@interface BWPortraitHDRStagingNode
+ (void)initialize;
- (BWPortraitHDRStagingNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (void)bufferReceivedWithFlags:(unsigned int)a3 error:(int)a4;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWPortraitHDRStagingNode

+ (void)initialize
{
}

- (BWPortraitHDRStagingNode)init
{
  v8.receiver = self;
  v8.super_class = (Class)BWPortraitHDRStagingNode;
  v2 = [(BWNode *)&v8 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v3 setFormatRequirements:v4];

    [(BWNodeInput *)v3 setPassthroughMode:1];
    [(BWNode *)v2 addInput:v3];

    v5 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v5 setFormatRequirements:v6];
    [(BWNodeOutput *)v5 setPassthroughMode:1];

    [(BWNode *)v2 addOutput:v5];
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  stagedBuffer = self->_stagedBuffer;
  if (stagedBuffer) {
    CFRelease(stagedBuffer);
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWPortraitHDRStagingNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Coordinator";
}

- (id)nodeSubType
{
  return @"PortraitHDRStagingNode";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)bufferReceivedWithFlags:(unsigned int)a3 error:(int)a4
{
  char v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v5 & 0x40 | a4 && (self->_passthroughBuffer = 1, (objc_super v8 = self->_stagedBuffer) != 0))
  {
    CFTypeRef v9 = CFRetain(v8);
    stagedBuffer = self->_stagedBuffer;
    if (stagedBuffer)
    {
      CFRelease(stagedBuffer);
      self->_stagedBuffer = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if (v9)
    {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:v9];
      CFRelease(v9);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int v6 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntegerValue");
  v7 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  os_unfair_lock_lock(&self->_lock);
  int64_t settingsID = self->_settingsID;
  if (settingsID != [v7 settingsID])
  {
    self->_passthroughBuffer = 0;
    self->_int64_t settingsID = [v7 settingsID];
  }
  CFTypeRef v9 = CMGetAttachment(a3, @"PhotoManifest", 0);
  if (v6
    && (v10 = (void *)v9, [v7 deliverOriginalImage])
    && ([v7 captureFlags] & 0x800) != 0
    && (unint64_t)objc_msgSend((id)objc_msgSend(v10, "photoDescriptors"), "count") >= 3
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "photoDescriptors"), "objectAtIndexedSubscript:", 2), "processingFlags") ^ v6) & 3) == 0&& !self->_passthroughBuffer)
  {
    stagedBuffer = self->_stagedBuffer;
    self->_stagedBuffer = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (stagedBuffer) {
      CFRelease(stagedBuffer);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    output = self->super._output;
    [(BWNodeOutput *)output emitSampleBuffer:a3];
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWPortraitHDRStagingNode bufferReceivedWithFlags:error:](self, "bufferReceivedWithFlags:error:", 0, [a3 errorCode]);
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

@end