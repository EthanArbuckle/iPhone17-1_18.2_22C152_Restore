@interface AVMediaFileOutputSettingsValidator
+ (id)mediaFileOutputSettingsValidatorForFileType:(id)a3;
+ (void)initialize;
- (AVMediaFileOutputSettingsValidator)init;
- (AVMediaFileOutputSettingsValidator)initWithFileType:(id)a3;
- (AVMediaFileType)fileType;
- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4;
- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4;
- (void)dealloc;
@end

@implementation AVMediaFileOutputSettingsValidator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v7 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    sAVMediaFileOutputSettingsValidatorClassesForFileType = objc_msgSend(v8, "initWithObjectsAndKeys:", v7, @"com.microsoft.waveform-audio", v6, @"public.aiff-audio", v2, @"public.aifc-audio", v3, @"public.mpeg-4", v4, @"com.apple.m4v-video", v5, @"com.apple.m4a-audio", objc_opt_class(), @"public.3gpp", 0);
  }
}

+ (id)mediaFileOutputSettingsValidatorForFileType:(id)a3
{
  uint64_t v4 = (objc_class *)objc_msgSend((id)sAVMediaFileOutputSettingsValidatorClassesForFileType, "objectForKey:", objc_msgSend(a3, "UTI"));
  if (!v4) {
    uint64_t v4 = (objc_class *)objc_opt_class();
  }
  uint64_t v5 = (void *)[[v4 alloc] initWithFileType:a3];
  return v5;
}

- (AVMediaFileOutputSettingsValidator)init
{
  return [(AVMediaFileOutputSettingsValidator *)self initWithFileType:0];
}

- (AVMediaFileOutputSettingsValidator)initWithFileType:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVMediaFileOutputSettingsValidator;
  uint64_t v5 = [(AVMediaFileOutputSettingsValidator *)&v15 init];
  uint64_t v6 = objc_opt_class();
  AVRequireConcreteObject(v5, a2, v6);
  if (!a3)
  {
    id v8 = v5;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"fileType != nil"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if (v5) {
    v5->_fileType = (AVMediaFileType *)objc_msgSend(a3, "copyWithZone:", -[AVMediaFileOutputSettingsValidator zone](v5, "zone"));
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMediaFileOutputSettingsValidator;
  [(AVMediaFileOutputSettingsValidator *)&v3 dealloc];
}

- (AVMediaFileType)fileType
{
  return self->_fileType;
}

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  uint64_t v6 = (void *)[a3 audioSettingsDictionary];
  uint64_t v7 = [(AVMediaFileOutputSettingsValidator *)self fileType];
  id v8 = (void *)[v6 objectForKey:*MEMORY[0x1E4F151E0]];
  if (!v8
    || (unsigned int v9 = [v8 unsignedIntValue], (v10 = -[AVMediaFileType audioFileTypeID](v7, "audioFileTypeID")) == 0))
  {
LABEL_12:
    uint64_t v13 = 0;
    int v14 = 1;
    goto LABEL_13;
  }
  UInt32 outDataSize = 0;
  unsigned int inSpecifier = v10;
  if (AudioFileGetGlobalInfoSize(0x666D6964u, 4u, &inSpecifier, &outDataSize))
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = (char *)malloc_type_malloc(outDataSize, 0x3C438C3uLL);
    if (v11 && !AudioFileGetGlobalInfo(0x666D6964u, 4u, &inSpecifier, &outDataSize, v11) && outDataSize >= 4)
    {
      uint64_t v12 = 0;
      while (*(_DWORD *)&v11[v12] != v9)
      {
        v12 += 4;
        if ((outDataSize & 0xFFFFFFFC) == v12) {
          goto LABEL_10;
        }
      }
      free(v11);
      goto LABEL_12;
    }
  }
LABEL_10:
  free(v11);
  uint64_t v13 = (__CFString *)[NSString stringWithFormat:@"Format ID '%@' is not compatible with file type %@", AVStringForOSType(v9), -[AVMediaFileType UTI](v7, "UTI")];
  int v14 = 0;
LABEL_13:
  objc_super v15 = (void *)[v6 objectForKey:*MEMORY[0x1E4F15218]];
  if (v14)
  {
    if (v15)
    {
      int v16 = [v15 BOOLValue];
      LOBYTE(v14) = v16 ^ 1;
      if (v16) {
        uint64_t v13 = @"Cannot write non-interleaved audio to a file";
      }
    }
  }
  if (a4) {
    *a4 = v13;
  }
  return v14;
}

- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

@end