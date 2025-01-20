@interface BWSoftISPProcessorControllerRequest
- (BOOL)readyForProcessing;
- (BWSoftISPProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4;
- (id)description;
- (opaqueCMSampleBuffer)outputFrame;
- (unint64_t)outputType;
- (unint64_t)uniqueID;
- (void)dealloc;
- (void)setOutputFrame:(opaqueCMSampleBuffer *)a3;
@end

@implementation BWSoftISPProcessorControllerRequest

- (BWSoftISPProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BWSoftISPProcessorControllerRequest;
  v4 = [(BWStillImageProcessorControllerRequest *)&v6 initWithInput:a3 delegate:a4];
  if (v4)
  {
    self;
    v4->_uniqueID = ++uniqueID_sCurrentUniqueID;
  }
  return v4;
}

- (void)dealloc
{
  outputFrame = self->_outputFrame;
  if (outputFrame) {
    CFRelease(outputFrame);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWSoftISPProcessorControllerRequest;
  [(BWStillImageProcessorControllerRequest *)&v4 dealloc];
}

- (unint64_t)outputType
{
  return 1;
}

- (BOOL)readyForProcessing
{
  return [(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)self input] frame] != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)BWSoftISPProcessorControllerRequest;
  return (id)[NSString stringWithFormat:@"%@, UniqueID:%llu", -[BWStillImageProcessorControllerRequest description](&v3, sel_description), self->_uniqueID];
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (opaqueCMSampleBuffer)outputFrame
{
  return self->_outputFrame;
}

- (void)setOutputFrame:(opaqueCMSampleBuffer *)a3
{
}

@end