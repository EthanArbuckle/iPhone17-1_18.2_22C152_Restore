@interface AVMediaFileType
+ (AVMediaFileType)mediaFileTypeWithFileTypeIdentifier:(id)a3;
+ (__CFString)figFileTypeProfileFromAVFileTypeProfile:(id)a3;
+ (id)_mediaFileTypeWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4;
+ (id)allFileTypeIdentifiers;
+ (id)isoFileTypes;
+ (void)initialize;
- (AVMediaFileType)initWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4;
- (BOOL)supportsFormat:(opaqueCMFormatDescription *)a3;
- (BOOL)supportsOutputSettings:(id)a3 reason:(id *)a4;
- (BOOL)supportsSampleReferences;
- (NSSet)supportedMediaTypes;
- (NSString)UTI;
- (NSString)defaultFileExtension;
- (NSString)figFormatReaderFileFormat;
- (id)description;
- (unsigned)audioFileTypeID;
- (void)dealloc;
@end

@implementation AVMediaFileType

+ (id)allFileTypeIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(id)sFigFileFormatsForUTIs allKeys];
  return (id)[v2 setWithArray:v3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    sFigFileFormatsForUTIs = objc_msgSend(v2, "initWithObjectsAndKeys:", *MEMORY[0x1E4F32C58], @"com.apple.quicktime-movie", *MEMORY[0x1E4F32C48], @"public.mpeg-4", *MEMORY[0x1E4F32C20], @"public.3gpp", *MEMORY[0x1E4F32C88], @"com.apple.m4v-video", *MEMORY[0x1E4F32C80], @"com.apple.m4a-audio", *MEMORY[0x1E4F32C38], @"com.apple.immersive-video", *MEMORY[0x1E4F32C40], @"com.apple.coreaudio-format", *MEMORY[0x1E4F32C68], @"com.microsoft.waveform-audio", *MEMORY[0x1E4F32C28],
                               @"public.aiff-audio",
                               *MEMORY[0x1E4F32C28],
                               @"public.aifc-audio",
                               *MEMORY[0x1E4F32C30],
                               @"org.3gpp.adaptive-multi-rate-audio",
                               *MEMORY[0x1E4F32C78],
                               @"com.apple.itunes-timed-text",
                               *MEMORY[0x1E4F32C60],
                               @"com.scenarist.closed-caption",
                               *MEMORY[0x1E4F32C70],
                               @"org.w3.webvtt",
                               0);
  }
}

+ (AVMediaFileType)mediaFileTypeWithFileTypeIdentifier:(id)a3
{
  return (AVMediaFileType *)[a1 _mediaFileTypeWithFileTypeIdentifier:a3 exceptionReason:0];
}

+ (id)_mediaFileTypeWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFileTypeIdentifier:a3 exceptionReason:a4];
  return v4;
}

- (AVMediaFileType)initWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4
{
  v20.receiver = self;
  v20.super_class = (Class)AVMediaFileType;
  v7 = [(AVMediaFileType *)&v20 init];
  v8 = v7;
  if (!a3)
  {
    v13 = v7;
    v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)"UTI != nil"), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  if (v7)
  {
    v7->_uti = (NSString *)objc_msgSend(a3, "copyWithZone:", -[AVMediaFileType zone](v7, "zone"));
    v9 = (void *)[(id)objc_opt_class() allFileTypeIdentifiers];
    if ([v9 containsObject:v8->_uti])
    {
      v10 = objc_alloc_init(AVDispatchOnce);
      v11 = 0;
      v8->_supportsSampleReferencesOnce = v10;
      if (!a4) {
        return v8;
      }
    }
    else
    {

      v11 = (void *)[NSString stringWithFormat:@"Invalid file type UTI.  Available file types are: %@", objc_msgSend((id)objc_msgSend(v9, "allObjects"), "componentsJoinedByString:", @", ")];
      v8 = 0;
      if (!a4) {
        return v8;
      }
    }
    goto LABEL_7;
  }
  v11 = 0;
  if (a4) {
LABEL_7:
  }
    *a4 = v11;
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMediaFileType;
  [(AVMediaFileType *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, UTI = %@>", NSStringFromClass(v4), self, -[AVMediaFileType UTI](self, "UTI")];
}

- (NSString)defaultFileExtension
{
  id v2 = [(AVMediaFileType *)self UTI];
  if ([(NSString *)v2 isEqualToString:@"com.apple.itunes-timed-text"]) {
    return (NSString *)@"itt";
  }
  if ([(NSString *)v2 isEqualToString:@"com.scenarist.closed-caption"]) {
    return (NSString *)@"scc";
  }
  if ([(NSString *)v2 isEqualToString:@"org.w3.webvtt"]) {
    return (NSString *)@"vtt";
  }
  if ([(NSString *)v2 isEqualToString:@"com.apple.immersive-video"]) {
    return (NSString *)@"aivu";
  }
  v4 = (void *)[MEMORY[0x1E4F442D8] typeWithIdentifier:v2];
  return (NSString *)[v4 preferredFilenameExtension];
}

- (NSSet)supportedMediaTypes
{
  id v2 = [(AVMediaFileType *)self UTI];
  if (([(NSString *)v2 isEqual:@"com.apple.coreaudio-format"] & 1) == 0
    && ([(NSString *)v2 isEqual:@"com.microsoft.waveform-audio"] & 1) == 0
    && ([(NSString *)v2 isEqual:@"public.aiff-audio"] & 1) == 0
    && ([(NSString *)v2 isEqual:@"public.aifc-audio"] & 1) == 0
    && ![(NSString *)v2 isEqual:@"org.3gpp.adaptive-multi-rate-audio"])
  {
    if ([(NSString *)v2 isEqual:@"com.apple.itunes-timed-text"])
    {
      objc_super v3 = (void *)MEMORY[0x1E4F1CAD0];
    }
    else
    {
      if ([(NSString *)v2 isEqual:@"com.scenarist.closed-caption"])
      {
        objc_super v3 = (void *)MEMORY[0x1E4F1CAD0];
        v4 = &AVMediaTypeClosedCaption;
        goto LABEL_7;
      }
      int v7 = [(NSString *)v2 isEqual:@"org.w3.webvtt"];
      objc_super v3 = (void *)MEMORY[0x1E4F1CAD0];
      if (!v7) {
        return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"vide", @"soun", @"clcp", @"text", @"sbtl", @"tmcd", @"meta", @"hapt", @"auxv", @"scen", 0);
      }
    }
    v4 = &AVMediaTypeText;
    goto LABEL_7;
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = &AVMediaTypeAudio;
LABEL_7:
  AVMediaType v5 = *v4;
  return (NSSet *)[v3 setWithObject:v5];
}

- (BOOL)supportsSampleReferences
{
  objc_super v3 = [(AVMediaFileType *)self UTI];
  supportsSampleReferencesOnce = self->_supportsSampleReferencesOnce;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AVMediaFileType_supportsSampleReferences__block_invoke;
  v6[3] = &unk_1E57B2228;
  v6[4] = self;
  v6[5] = v3;
  [(AVDispatchOnce *)supportsSampleReferencesOnce runBlockOnce:v6];
  return self->_supportsSampleReferences;
}

uint64_t __43__AVMediaFileType_supportsSampleReferences__block_invoke(uint64_t a1)
{
  uint64_t result = MEMORY[0x199714540](*(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = result != 0;
  return result;
}

- (NSString)UTI
{
  return self->_uti;
}

- (NSString)figFormatReaderFileFormat
{
  id v2 = (void *)sFigFileFormatsForUTIs;
  objc_super v3 = [(AVMediaFileType *)self UTI];
  return (NSString *)[v2 objectForKey:v3];
}

- (unsigned)audioFileTypeID
{
  inSpecifier = [(AVMediaFileType *)self UTI];
  UInt32 outDataSize = 0;
  if (AudioFileGetGlobalInfoSize(0x74757469u, 8u, &inSpecifier, &outDataSize) || outDataSize < 4)
  {
    unsigned int v3 = 0;
    id v2 = 0;
  }
  else
  {
    id v2 = (unsigned int *)malloc_type_malloc(outDataSize, 0xF6E8CF9uLL);
    if (!v2 || AudioFileGetGlobalInfo(0x74757469u, 8u, &inSpecifier, &outDataSize, v2)) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = *v2;
    }
  }
  free(v2);
  return v3;
}

- (BOOL)supportsOutputSettings:(id)a3 reason:(id *)a4
{
  id v6 = +[AVMediaFileOutputSettingsValidator mediaFileOutputSettingsValidatorForFileType:self];
  return [a3 validateUsingOutputSettingsValidator:v6 reason:a4];
}

- (BOOL)supportsFormat:(opaqueCMFormatDescription *)a3
{
  if (!a3)
  {
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"formatDesc != NULL"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  v10 = [(AVMediaFileType *)self UTI];
  if ([(NSString *)v10 isEqualToString:@"com.apple.quicktime-movie"]) {
    goto LABEL_3;
  }
  if (![(NSString *)v10 isEqualToString:@"public.mpeg-4"])
  {
    if ([(NSString *)v10 isEqualToString:@"com.apple.m4v-video"])
    {
      signed int MediaType = CMFormatDescriptionGetMediaType(a3);
      LOBYTE(v11) = 1;
      if (MediaType <= 1936684397)
      {
LABEL_24:
        if (MediaType == 1668047728) {
          return (char)v11;
        }
        goto LABEL_25;
      }
      if (MediaType != 1986618469)
      {
        if (MediaType == 1952807028) {
          return (char)v11;
        }
        if (MediaType != 1936684398) {
          goto LABEL_81;
        }
        signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
        LOBYTE(v11) = 1;
        if (MediaSubType > 1700998450)
        {
          if (MediaSubType == 1700998451) {
            return (char)v11;
          }
          int v14 = 1970495843;
        }
        else
        {
          if (MediaSubType == 1633772320) {
            return (char)v11;
          }
          int v14 = 1633889587;
        }
        goto LABEL_80;
      }
      signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
      LOBYTE(v11) = 1;
      if (MediaSubType <= 1752589104)
      {
        if (MediaSubType == 1635148593) {
          return (char)v11;
        }
        int v14 = 1685481521;
        goto LABEL_80;
      }
LABEL_66:
      if (MediaSubType == 1752589105) {
        return (char)v11;
      }
      int v14 = 1785750887;
      goto LABEL_80;
    }
    if ([(NSString *)v10 isEqualToString:@"com.apple.m4a-audio"])
    {
      signed int MediaType = CMFormatDescriptionGetMediaType(a3);
      LOBYTE(v11) = 1;
      if (MediaType <= 1936684397)
      {
        if (MediaType == 1668047728) {
          return (char)v11;
        }
        if (MediaType == 1751216244)
        {
          signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
          LOBYTE(v11) = 1;
          if (MediaSubType == 1634230640 || MediaSubType == 1634230642) {
            return (char)v11;
          }
          int v14 = 1651866234;
          goto LABEL_80;
        }
LABEL_25:
        if (MediaType != 1935832172 || CMFormatDescriptionGetMediaSubType(a3) != 1954034535)
        {
LABEL_81:
          v11 = [(AVMediaFileType *)self figFormatReaderFileFormat];
          if (v11) {
            LOBYTE(v11) = FigRemakerCanFileTypeSupportFormatDescription() != 0;
          }
          return (char)v11;
        }
LABEL_3:
        LOBYTE(v11) = 1;
        return (char)v11;
      }
      if (MediaType != 1986618469)
      {
        if (MediaType == 1952807028) {
          return (char)v11;
        }
        if (MediaType != 1936684398) {
          goto LABEL_81;
        }
        signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
        LOBYTE(v11) = 1;
        if (MediaSubType == 1633772320) {
          return (char)v11;
        }
        int v15 = 1633889587;
LABEL_76:
        if (MediaSubType == v15) {
          return (char)v11;
        }
        int v14 = 1700998451;
        goto LABEL_80;
      }
      signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
      LOBYTE(v11) = 1;
      if (MediaSubType == 1635148593) {
        return (char)v11;
      }
      goto LABEL_66;
    }
    if ([(NSString *)v10 isEqualToString:@"com.apple.immersive-video"]) {
      goto LABEL_3;
    }
    if ([(NSString *)v10 isEqualToString:@"com.apple.itunes-timed-text"])
    {
LABEL_37:
      LOBYTE(v11) = 0;
      return (char)v11;
    }
    if ([(NSString *)v10 isEqualToString:@"com.scenarist.closed-caption"])
    {
      if (CMFormatDescriptionGetMediaType(a3) != 1668047728) {
        goto LABEL_37;
      }
      LODWORD(v11) = CMFormatDescriptionGetMediaSubType(a3);
      int v16 = 1664495672;
    }
    else
    {
      if (![(NSString *)v10 isEqualToString:@"org.w3.webvtt"]) {
        goto LABEL_81;
      }
      if (CMFormatDescriptionGetMediaType(a3) != 1952807028) {
        goto LABEL_37;
      }
      LODWORD(v11) = CMFormatDescriptionGetMediaSubType(a3);
      int v16 = 2004251764;
    }
    LOBYTE(v11) = v11 == v16;
    return (char)v11;
  }
  signed int MediaType = CMFormatDescriptionGetMediaType(a3);
  LOBYTE(v11) = 1;
  if (MediaType <= 1936684397) {
    goto LABEL_24;
  }
  if (MediaType == 1986618469)
  {
    signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
    LOBYTE(v11) = 1;
    if (MediaSubType > 1785750886)
    {
      if (MediaSubType == 1785750887) {
        return (char)v11;
      }
      int v14 = 1836070006;
    }
    else
    {
      if (MediaSubType == 1635148593) {
        return (char)v11;
      }
      int v14 = 1752589105;
    }
    goto LABEL_80;
  }
  if (MediaType == 1952807028) {
    return (char)v11;
  }
  if (MediaType != 1936684398) {
    goto LABEL_81;
  }
  signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  LOBYTE(v11) = 1;
  if (MediaSubType > 1667326831)
  {
    if (MediaSubType > 1902207847)
    {
      if (MediaSubType <= 1970495842)
      {
        if (MediaSubType == 1902207848) {
          return (char)v11;
        }
        int v14 = 1902207856;
      }
      else
      {
        if (MediaSubType == 1970495843 || MediaSubType == 2053202792) {
          return (char)v11;
        }
        int v14 = 2053202800;
      }
      goto LABEL_80;
    }
    if (MediaSubType > 1885430114)
    {
      if (MediaSubType == 1885430115 || MediaSubType == 1885430632) {
        return (char)v11;
      }
      int v14 = 1885430640;
      goto LABEL_80;
    }
    int v15 = 1667326832;
    goto LABEL_76;
  }
  if (MediaSubType > 1633889586)
  {
    if (MediaSubType == 1633889587 || MediaSubType == 1634492771) {
      return (char)v11;
    }
    int v14 = 1667326824;
    goto LABEL_80;
  }
  if (((MediaSubType - 1633772389) > 0xB || ((1 << (MediaSubType - 101)) & 0x80F) == 0)
    && MediaSubType != 1633771875)
  {
    int v14 = 1633772320;
LABEL_80:
    if (MediaSubType == v14) {
      return (char)v11;
    }
    goto LABEL_81;
  }
  return (char)v11;
}

+ (id)isoFileTypes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"public.mpeg-4", @"com.apple.m4a-audio", @"com.apple.m4v-video", @"public.3gpp", @"public.3gpp2", 0);
}

+ (__CFString)figFileTypeProfileFromAVFileTypeProfile:(id)a3
{
  if ([a3 isEqual:@"MPEG4AppleHLS"]) {
    return (__CFString *)*MEMORY[0x1E4F32AE8];
  }
  if ([a3 isEqual:@"MPEG4CMAFCompliant"]) {
    return (__CFString *)*MEMORY[0x1E4F32AF0];
  }
  return 0;
}

@end