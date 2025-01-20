@interface FigDisplayConfiguration
- (CGSize)canvasSize;
- (CGSize)maxDisplaySize;
- (FigDisplayConfiguration)init;
- (NSString)clientName;
- (NSString)displayLabel;
- (OpaqueFigSimpleMutex)getLock;
- (__CFDictionary)getFVDOptions;
- (id)description;
- (int64_t)clientPID;
- (int64_t)displayMode;
- (int64_t)imagePoolSize;
- (int64_t)numOfIdleFrames;
- (int64_t)preferredUIScaleFactor;
- (unint64_t)preset;
- (unsigned)refreshRate;
- (void)dealloc;
- (void)setCanvasSize:(CGSize)a3;
- (void)setClientName:(id)a3;
- (void)setClientPID:(int64_t)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setImagePoolSize:(int64_t)a3;
- (void)setMaxDisplaySize:(CGSize)a3;
- (void)setNumOfIdleFrames:(int64_t)a3;
- (void)setPreferredUIScaleFactor:(int64_t)a3;
- (void)setPreset:(unint64_t)a3;
- (void)setRefreshRate:(unsigned int)a3;
@end

@implementation FigDisplayConfiguration

- (FigDisplayConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigDisplayConfiguration;
  v2 = [(FigDisplayConfiguration *)&v4 init];
  if (v2)
  {
    v2->_fvdOptions = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    CFDictionarySetValue(v2->_fvdOptions, @"usage", @"Uncompressed");
    v2->_preset = 0;
    CFDictionarySetValue(v2->_fvdOptions, @"DisplayLabel", @"FigScreenCaptureController Display");
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
  v4.super_class = (Class)FigDisplayConfiguration;
  [(FigDisplayConfiguration *)&v4 dealloc];
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

- (void)setMaxDisplaySize:(CGSize)a3
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

- (CGSize)maxDisplaySize
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

- (void)setRefreshRate:(unsigned int)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();

  JUMPOUT(0x19970E930);
}

- (unsigned)refreshRate
{
  return 60;
}

- (void)setPreset:(unint64_t)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  long long v5 = convertPresetEnumToUsageModeString(a3);
  if (v5) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = 0;
  }
  MEMORY[0x19970E910](self->_lock);
  if (v6 - 7 <= 3)
  {
    Value = (void *)CFDictionaryGetValue(self->_fvdOptions, @"deviceInfo");
    if (Value)
    {
      id v8 = Value;
      id v9 = Value;
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (v6 - 9 > 1)
    {
      v15 = @"HDRMode";
      v16 = @"HDR10";
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = &v16;
      v12 = &v15;
    }
    else
    {
      v17 = @"HDRMode";
      v18[0] = @"DoVi";
      v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = (__CFString **)v18;
      v12 = &v17;
    }
    v13 = (const void *)[v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    [v8 setObject:v13 forKeyedSubscript:@"HDRInfo"];
    CFDictionarySetValue(self->_fvdOptions, @"HDRInfo", v13);
    CFDictionarySetValue(self->_fvdOptions, @"deviceInfo", v8);
  }
  if (v5) {
    v14 = v5;
  }
  else {
    v14 = @"Uncompressed";
  }
  CFDictionarySetValue(self->_fvdOptions, @"usage", v14);
  self->_preset = v6;
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

- (void)setClientPID:(int64_t)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  if (a3 < 1)
  {
    CFDictionaryRemoveValue(self->_fvdOptions, @"clientPID");
    CFDictionaryRemoveValue(self->_fvdOptions, @"MirroringMode");
  }
  else
  {
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
  }

  JUMPOUT(0x19970E930);
}

- (int64_t)clientPID
{
  return 0;
}

- (void)setDisplayMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 3 && a3 != 2)
  {
    MEMORY[0x19970E910](self->_lock, a2);
    FigCFDictionarySetInt();
    JUMPOUT(0x19970E930);
  }
}

- (int64_t)displayMode
{
  return 0;
}

- (void)setDisplayLabel:(id)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  fvdOptions = self->_fvdOptions;
  if (a3) {
    CFDictionarySetValue(fvdOptions, @"DisplayLabel", a3);
  }
  else {
    CFDictionaryRemoveValue(fvdOptions, @"DisplayLabel");
  }

  JUMPOUT(0x19970E930);
}

- (NSString)displayLabel
{
  MEMORY[0x19970E910](self->_lock, a2);
  Value = (NSString *)FigCFDictionaryGetValue();
  MEMORY[0x19970E930](self->_lock);
  return Value;
}

- (void)setCanvasSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  MEMORY[0x19970E910](self->_lock, a2);
  if (width > 0.0 && height > 0.0)
  {
    FigCFDictionarySetInt();
    FigCFDictionarySetInt();
  }

  JUMPOUT(0x19970E930);
}

- (CGSize)canvasSize
{
  MEMORY[0x19970E910](self->_lock, a2);
  FigCFDictionaryGetInt32IfPresent();
  FigCFDictionaryGetInt32IfPresent();
  MEMORY[0x19970E930](self->_lock);
  double v3 = (double)0;
  double v4 = (double)0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setPreferredUIScaleFactor:(int64_t)a3
{
  MEMORY[0x19970E910](self->_lock, a2);
  long long v5 = (void *)CFDictionaryGetValue(self->_fvdOptions, @"deviceInfo");
  if (v5)
  {
    id value = v5;
    id v6 = v5;
  }
  else
  {
    id value = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3), @"preferredUIScale");
  CFDictionarySetValue(self->_fvdOptions, @"deviceInfo", value);
  MEMORY[0x19970E930](self->_lock);
}

- (int64_t)preferredUIScaleFactor
{
  return 0;
}

@end