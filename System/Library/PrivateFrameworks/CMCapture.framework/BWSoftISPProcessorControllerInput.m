@interface BWSoftISPProcessorControllerInput
- (BOOL)gdcEnabled;
- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4 gdcEnabled:(BOOL)a5;
- (id)description;
- (int)processingMode;
- (opaqueCMSampleBuffer)frame;
- (void)addFrame:(opaqueCMSampleBuffer *)a3;
- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4;
- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4 transferOwnership:(BOOL)a5;
- (void)dealloc;
- (void)setFrame:(opaqueCMSampleBuffer *)a3;
@end

@implementation BWSoftISPProcessorControllerInput

- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  return [(BWSoftISPProcessorControllerInput *)self initWithSettings:a3 portType:a4 gdcEnabled:0];
}

- (BWSoftISPProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4 gdcEnabled:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BWSoftISPProcessorControllerInput;
  result = [(BWStillImageProcessorControllerInput *)&v7 initWithSettings:a3 portType:a4];
  if (result) {
    result->_gdcEnabled = a5;
  }
  return result;
}

- (void)dealloc
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWSoftISPProcessorControllerInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4
{
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 processingMode:(int)a4 transferOwnership:(BOOL)a5
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  if (!a5 && a3) {
    a3 = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  self->_frame = a3;
  self->_processingMode = a4;
  v10 = [(BWStillImageProcessorControllerInput *)self delegate];
  v11 = self->_frame;
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v10 input:self addFrame:v11];
}

- (id)description
{
  v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)BWSoftISPProcessorControllerInput;
  id v4 = [(BWStillImageProcessorControllerInput *)&v6 description];
  return (id)[v3 stringWithFormat:@"%@, processingMode:%@ frame:%@ gdcEnabled:%d", v4, objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_processingMode), BWVideoSampleBufferToDisplayString(), self->_gdcEnabled];
}

- (opaqueCMSampleBuffer)frame
{
  return self->_frame;
}

- (void)setFrame:(opaqueCMSampleBuffer *)a3
{
}

- (int)processingMode
{
  return self->_processingMode;
}

- (BOOL)gdcEnabled
{
  return self->_gdcEnabled;
}

@end