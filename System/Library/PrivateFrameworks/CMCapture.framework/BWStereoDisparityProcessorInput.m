@interface BWStereoDisparityProcessorInput
- (BOOL)emitAuxiliaryInput;
- (BOOL)equalizeTeleGainToMatchReference;
- (BWStereoDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWStereoDisparityProcessorInputDelegate)delegate;
- (NSSet)expectedPortTypes;
- (id)description;
- (opaqueCMSampleBuffer)auxiliarySbuf;
- (opaqueCMSampleBuffer)referenceSbuf;
- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEmitAuxiliaryInput:(BOOL)a3;
- (void)setEqualizeTeleGainToMatchReference:(BOOL)a3;
- (void)setExpectedPortTypes:(id)a3;
@end

@implementation BWStereoDisparityProcessorInput

- (void)dealloc
{
  referenceSbuf = self->_referenceSbuf;
  if (referenceSbuf) {
    CFRelease(referenceSbuf);
  }
  auxiliarySbuf = self->_auxiliarySbuf;
  if (auxiliarySbuf) {
    CFRelease(auxiliarySbuf);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWStereoDisparityProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (BWStereoDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWStereoDisparityProcessorInput;
  objc_super v5 = [(BWStillImageProcessorControllerInput *)&v8 initWithSettings:a3 portType:a4];
  if (v5)
  {
    BOOL v6 = (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x20000) != 0
      && objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureType") == 10;
    v5->_equalizeTeleGainToMatchReference = v6;
    v5->_emitAuxiliaryInput = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count") != 0;
    v5->_expectedPortTypes = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "portTypes"));
  }
  return v5;
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))uint64_t v5 = 48; {
    else
    }
      uint64_t v5 = 56;
    BOOL v6 = (CFTypeRef *)((char *)&self->super.super.isa + v5);
    v7 = *(Class *)((char *)&self->super.super.isa + v5);
    if (v7) {
      CFRelease(v7);
    }
    *BOOL v6 = CFRetain(a3);
    delegate = self->_delegate;
    [(BWStereoDisparityProcessorInputDelegate *)delegate inputReceivedNewInputData:self];
  }
  else
  {
    FigDebugAssert3();
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ : ref:%p aux:%p emitAux:%d eqTele:%d", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_referenceSbuf, self->_auxiliarySbuf, self->_emitAuxiliaryInput, self->_equalizeTeleGainToMatchReference];
}

- (BWStereoDisparityProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (opaqueCMSampleBuffer)referenceSbuf
{
  return self->_referenceSbuf;
}

- (opaqueCMSampleBuffer)auxiliarySbuf
{
  return self->_auxiliarySbuf;
}

- (BOOL)equalizeTeleGainToMatchReference
{
  return self->_equalizeTeleGainToMatchReference;
}

- (void)setEqualizeTeleGainToMatchReference:(BOOL)a3
{
  self->_equalizeTeleGainToMatchReference = a3;
}

- (BOOL)emitAuxiliaryInput
{
  return self->_emitAuxiliaryInput;
}

- (void)setEmitAuxiliaryInput:(BOOL)a3
{
  self->_emitAuxiliaryInput = a3;
}

- (NSSet)expectedPortTypes
{
  return self->_expectedPortTypes;
}

- (void)setExpectedPortTypes:(id)a3
{
}

@end