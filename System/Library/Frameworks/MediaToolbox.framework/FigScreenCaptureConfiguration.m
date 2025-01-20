@interface FigScreenCaptureConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameInterval;
- (BOOL)includePrivateContent;
- (CGSize)size;
- (FigScreenCaptureConfiguration)init;
- (NSString)clientName;
- (OpaqueFigSimpleMutex)getLock;
- (__CFDictionary)getFVDOptions;
- (id)contentIDs;
- (id)description;
- (int64_t)displayID;
- (int64_t)imagePoolSize;
- (int64_t)numOfIdleFrames;
- (unint64_t)preset;
- (unsigned)pixelFormat;
- (void)dealloc;
- (void)setClientName:(id)a3;
- (void)setContentIDs:(id)a3;
- (void)setDisplayID:(int64_t)a3;
- (void)setImagePoolSize:(int64_t)a3;
- (void)setIncludePrivateContent:(BOOL)a3;
- (void)setMinFrameInterval:(id *)a3;
- (void)setNumOfIdleFrames:(int64_t)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setPreset:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation FigScreenCaptureConfiguration

- (FigScreenCaptureConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigScreenCaptureConfiguration;
  v2 = [(FigScreenCaptureConfiguration *)&v4 init];
  if (v2)
  {
    v2->_fvdOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    CFDictionarySetValue(v2->_fvdOptions, @"usage", @"Uncompressed");
    v2->_preset = 0;
    CFDictionarySetValue(v2->_fvdOptions, @"ScreenRecording", (const void *)*MEMORY[0x1E4F1CFD0]);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v2->_fvdOptions, @"DisplayLabel", @"ScreenCapture");
  }
  return v2;
}

- (void)dealloc
{
  fvdOptions = self->_fvdOptions;
  if (fvdOptions)
  {
    CFRelease(fvdOptions);
    self->_fvdOptions = 0;
  }
  FigSimpleMutexDestroy();
  self->_lock = 0;
  v4.receiver = self;
  v4.super_class = (Class)FigScreenCaptureConfiguration;
  [(FigScreenCaptureConfiguration *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, options = %@>", NSStringFromClass(v4), self, -[__CFDictionary description](self->_fvdOptions, "description")];
}

- (__CFDictionary)getFVDOptions
{
  return self->_fvdOptions;
}

- (OpaqueFigSimpleMutex)getLock
{
  return self->_lock;
}

- (void)setSize:(CGSize)a3
{
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
  MEMORY[0x19970E910](self->_lock);
  v5 = (void *)CFDictionaryGetValue(self->_fvdOptions, @"deviceInfo");
  if (v5)
  {
    id value = v5;
    id v6 = v5;
  }
  else
  {
    id value = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [value setObject:DictionaryRepresentation forKeyedSubscript:@"displaySizeInPixels"];
  CFDictionarySetValue(self->_fvdOptions, @"deviceInfo", value);
  MEMORY[0x19970E930](self->_lock);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
}

- (CGSize)size
{
  long long v5 = *MEMORY[0x1E4F1DB30];
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionaryGetValue();
  FigCFDictionaryGetCGSizeIfPresent();
  MEMORY[0x19970E930](self->_lock);
  double v4 = *((double *)&v5 + 1);
  double v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setMinFrameInterval:(id *)a3
{
  CMTime v4 = *(CMTime *)a3;
  CMTimeGetSeconds(&v4);
  MEMORY[0x19970E910](self->_lock);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  MEMORY[0x19970E930](self->_lock);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameInterval
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 60);
}

- (void)setPixelFormat:(unsigned int)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionarySetInt();

  JUMPOUT(0x19970E930);
}

- (unsigned)pixelFormat
{
  return 0;
}

- (void)setPreset:(unint64_t)a3
{
  unint64_t v3 = a3;
  long long v5 = convertPresetEnumToUsageModeString(a3);
  if (v3 - 7 <= 3)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    long long v5 = 0;
  }
  if (v5) {
    v7 = v5;
  }
  else {
    v7 = @"Uncompressed";
  }
  if (!v5) {
    unint64_t v3 = 0;
  }
  MEMORY[0x19970E910](self->_lock);
  CFDictionarySetValue(self->_fvdOptions, @"usage", v7);
  self->_preset = v3;
  MEMORY[0x19970E930](self->_lock);
}

- (unint64_t)preset
{
  MEMORY[0x19970E910](self->_lock, a2);
  unint64_t preset = self->_preset;
  MEMORY[0x19970E930](self->_lock);
  return preset;
}

- (void)setNumOfIdleFrames:(int64_t)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionarySetInt();

  JUMPOUT(0x19970E930);
}

- (int64_t)numOfIdleFrames
{
  return 0;
}

- (void)setImagePoolSize:(int64_t)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionarySetInt();

  JUMPOUT(0x19970E930);
}

- (int64_t)imagePoolSize
{
  return 0;
}

- (void)setClientName:(id)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3) {
    CFDictionarySetValue(fvdOptions, @"clientName", a3);
  }
  else {
    CFDictionaryRemoveValue(fvdOptions, @"clientName");
  }

  JUMPOUT(0x19970E930);
}

- (NSString)clientName
{
  MEMORY[0x19970E910](self->_lock, a2);
  Value = (NSString *)FigCFDictionaryGetValue();
  MEMORY[0x19970E930](self->_lock);
  return Value;
}

- (void)setContentIDs:(id)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3) {
    CFDictionarySetValue(fvdOptions, @"ContentIDs", a3);
  }
  else {
    CFDictionaryRemoveValue(fvdOptions, @"ContentIDs");
  }
  FigCFDictionarySetInt32();

  JUMPOUT(0x19970E930);
}

- (id)contentIDs
{
  MEMORY[0x19970E910](self->_lock, a2);
  Value = (void *)FigCFDictionaryGetValue();
  MEMORY[0x19970E930](self->_lock);
  return Value;
}

- (void)setIncludePrivateContent:(BOOL)a3
{
  BOOL v3 = a3;
  MEMORY[0x19970E910](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (v3) {
    CFDictionarySetValue(fvdOptions, @"IncludePrivateContent", (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  else {
    CFDictionaryRemoveValue(fvdOptions, @"IncludePrivateContent");
  }

  JUMPOUT(0x19970E930);
}

- (BOOL)includePrivateContent
{
  return 0;
}

- (void)setDisplayID:(int64_t)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionarySetInt32();

  JUMPOUT(0x19970E930);
}

- (int64_t)displayID
{
  return 1;
}

@end