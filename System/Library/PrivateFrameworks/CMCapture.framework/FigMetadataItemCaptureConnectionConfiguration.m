@interface FigMetadataItemCaptureConnectionConfiguration
- (BOOL)isEqual:(id)a3;
- (FigMetadataItemCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (OpaqueCMClock)clock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sourceSubType;
- (opaqueCMFormatDescription)formatDescription;
- (void)dealloc;
- (void)setClock:(OpaqueCMClock *)a3;
- (void)setFormatDescription:(opaqueCMFormatDescription *)a3;
- (void)setSourceSubType:(int)a3;
@end

@implementation FigMetadataItemCaptureConnectionConfiguration

- (FigMetadataItemCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v10, sel_initWithXPCEncoding_);
    if (v4)
    {
      uint64_t v9 = 0;
      FigXPCMessageCopyCFData();
      int int64 = xpc_dictionary_get_int64(a3, "clock");
      if (int64 == 2)
      {
        CMAudioClockCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v4->_clock);
      }
      else if (int64 == 1)
      {
        CMClockRef HostTimeClock = CMClockGetHostTimeClock();
        v4->_clock = (OpaqueCMClock *)CFRetain(HostTimeClock);
      }
      int v7 = xpc_dictionary_get_int64(a3, "inputType");
      if ((v7 - 1) <= 2) {
        v4->_sourceSubType = v7;
      }
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v11.receiver = self;
  v11.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  CMBlockBufferRef blockBufferOut = 0;
  id v3 = [(FigCaptureConnectionConfiguration *)&v11 copyXPCEncoding];
  CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlockBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_formatDescription, 0, &blockBufferOut);
  size_t lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  size_t v8 = 0;
  CMBlockBufferGetDataPointer(blockBufferOut, 0, &lengthAtOffsetOut, &v8, &dataPointerOut);
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v5 = (void *)[v4 initWithBytes:dataPointerOut length:v8];
  FigXPCMessageSetCFData();

  CMClockGetHostTimeClock();
  if (FigCFEqual())
  {
    int64_t v6 = 1;
  }
  else
  {
    if (!self->_clock) {
      goto LABEL_6;
    }
    int64_t v6 = 2;
  }
  xpc_dictionary_set_int64(v3, "clock", v6);
LABEL_6:
  xpc_dictionary_set_int64(v3, "inputType", self->_sourceSubType);
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return v3;
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  clock = self->_clock;
  if (clock) {
    CFRelease(clock);
  }
  v5.receiver = self;
  v5.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  [(FigCaptureConnectionConfiguration *)&v5 dealloc];
}

- (id)description
{
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  if (v3 == [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType])id v4 = &stru_1EFA403E0; {
  else
  }
    id v4 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))];
  return (id)[MEMORY[0x1E4F28E78] stringWithFormat:@"MIC %p: <%@>%@ -> <%@>, SST: %d, E:%d", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigMetadataItemCaptureConnectionConfiguration sourceSubType](self, "sourceSubType"), -[FigCaptureConnectionConfiguration enabled](self, "enabled")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  id v4 = [(FigCaptureConnectionConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setFormatDescription:", -[FigMetadataItemCaptureConnectionConfiguration formatDescription](self, "formatDescription"));
  objc_msgSend(v4, "setClock:", -[FigMetadataItemCaptureConnectionConfiguration clock](self, "clock"));
  objc_msgSend(v4, "setSourceSubType:", -[FigMetadataItemCaptureConnectionConfiguration sourceSubType](self, "sourceSubType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  unsigned int v5 = -[FigCaptureConnectionConfiguration isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = CMFormatDescriptionEqual(-[FigMetadataItemCaptureConnectionConfiguration formatDescription](self, "formatDescription"), (CMFormatDescriptionRef)[a3 formatDescription]);
      if (v5)
      {
        [(FigMetadataItemCaptureConnectionConfiguration *)self clock];
        [a3 clock];
        unsigned int v5 = FigCFEqual();
        if (v5)
        {
          int v6 = [(FigMetadataItemCaptureConnectionConfiguration *)self sourceSubType];
          LOBYTE(v5) = v6 == [a3 sourceSubType];
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (void)setFormatDescription:(opaqueCMFormatDescription *)a3
{
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (void)setClock:(OpaqueCMClock *)a3
{
}

- (int)sourceSubType
{
  return self->_sourceSubType;
}

- (void)setSourceSubType:(int)a3
{
  self->_sourceSubType = a3;
}

@end