@interface BWColorConstancyProcessorControllerInput
- (BOOL)addFrameFailed;
- (opaqueCMSampleBuffer)ambientFrame;
- (opaqueCMSampleBuffer)flashFrame;
- (void)addFrame:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
@end

@implementation BWColorConstancyProcessorControllerInput

- (void)dealloc
{
  flashFrame = self->_flashFrame;
  if (flashFrame) {
    CFRelease(flashFrame);
  }
  ambientFrame = self->_ambientFrame;
  if (ambientFrame) {
    CFRelease(ambientFrame);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWColorConstancyProcessorControllerInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3
{
  objc_super v5 = [(BWStillImageProcessorControllerInput *)self delegate];
  if (!self->_addFrameFailed)
  {
    if (a3)
    {
      v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (v6)
      {
        v7 = v6;
        int v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F53CA0]), "BOOLValue");
        int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53F10]), "BOOLValue");
        if (v8)
        {
          if (!self->_ambientFrame)
          {
            self->_ambientFrame = a3;
            CFRetain(a3);
            [(BWStillImageProcessorControllerInputUpdatesDelegate *)v5 input:self addAmbientFrame:self->_ambientFrame];
            goto LABEL_10;
          }
        }
        else if (v9 && !self->_flashFrame)
        {
          self->_flashFrame = a3;
          CFRetain(a3);
          [(BWStillImageProcessorControllerInputUpdatesDelegate *)v5 input:self addFlashFrame:self->_flashFrame];
LABEL_10:
          if (!self->_addFrameFailed) {
            return;
          }
          goto LABEL_13;
        }
      }
    }
    self->_addFrameFailed = 1;
  }
LABEL_13:
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v5 inputAddFrameFailed:self];
}

- (opaqueCMSampleBuffer)flashFrame
{
  return self->_flashFrame;
}

- (opaqueCMSampleBuffer)ambientFrame
{
  return self->_ambientFrame;
}

- (BOOL)addFrameFailed
{
  return self->_addFrameFailed;
}

@end