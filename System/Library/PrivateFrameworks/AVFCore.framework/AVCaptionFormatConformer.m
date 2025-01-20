@interface AVCaptionFormatConformer
+ (AVCaptionFormatConformer)captionFormatConformerWithConversionSettings:(NSDictionary *)conversionSettings;
- (AVCaption)conformedCaptionForCaption:(AVCaption *)caption error:(NSError *)outError;
- (AVCaptionFormatConformer)initWithConversionSettings:(NSDictionary *)conversionSettings;
- (BOOL)_isConversionToClosedCaptions:(id)a3;
- (BOOL)conformsCaptionTimeRange;
- (void)dealloc;
- (void)setConformsCaptionTimeRange:(BOOL)a3;
@end

@implementation AVCaptionFormatConformer

+ (AVCaptionFormatConformer)captionFormatConformerWithConversionSettings:(NSDictionary *)conversionSettings
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConversionSettings:conversionSettings];
  return (AVCaptionFormatConformer *)v3;
}

- (BOOL)_isConversionToClosedCaptions:(id)a3
{
  BOOL result = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCaptionMediaTypeKey"), "isEqualToString:", @"clcp"))
  {
    v4 = (void *)[a3 objectForKeyedSubscript:@"AVCaptionMediaSubTypeKey"];
    if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", 1664495672)) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCaptionMediaSubTypeKey"), "isEqual:", @"c608") & 1) != 0)
    {
      return 1;
    }
  }
  return result;
}

- (AVCaptionFormatConformer)initWithConversionSettings:(NSDictionary *)conversionSettings
{
  if (![(AVCaptionFormatConformer *)self _isConversionToClosedCaptions:conversionSettings])
  {
    v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports conversions only to mediaType 'clcp' and mediaSubType 'c608'", v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptionFormatConformer;
  v5 = [(AVCaptionFormatConformer *)&v15 init];
  if (v5)
  {
    v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x10200405F07FB98uLL);
    v5->_conformerInternal = v6;
    if (!v6 || FigCLCPCaptionFormatConformerCreate())
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  conformerInternal = (CFTypeRef *)self->_conformerInternal;
  if (conformerInternal)
  {
    if (*conformerInternal)
    {
      CFRelease(*conformerInternal);
      conformerInternal = (CFTypeRef *)self->_conformerInternal;
    }
    free(conformerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptionFormatConformer;
  [(AVCaptionFormatConformer *)&v4 dealloc];
}

- (BOOL)conformsCaptionTimeRange
{
  return *((unsigned char *)self->_conformerInternal + 8);
}

- (void)setConformsCaptionTimeRange:(BOOL)a3
{
  *((unsigned char *)self->_conformerInternal + 8) = a3;
}

- (AVCaption)conformedCaptionForCaption:(AVCaption *)caption error:(NSError *)outError
{
  v7 = [(AVCaption *)caption _figCaptionData];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  if (caption) {
    [(AVCaption *)caption timeRange];
  }
  CFTypeRef cf = 0;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v24[0] = *MEMORY[0x1E4F1FA20];
  v24[1] = v8;
  v24[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  uint64_t v9 = *(void *)self->_conformerInternal;
  long long v21 = v26;
  long long v22 = v27;
  long long v23 = v28;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, OpaqueFigCaptionData *, _OWORD *, CFTypeRef *, _OWORD *, void))(v11 + 8);
  if (!v12)
  {
    signed int v13 = -12782;
    if (outError) {
      goto LABEL_9;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_15;
  }
  v29[0] = v21;
  v29[1] = v22;
  v29[2] = v23;
  signed int v13 = v12(v9, v7, v29, &cf, v24, 0);
  if (v13)
  {
    if (outError)
    {
LABEL_9:
      v14 = 0;
      *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v13, 0);
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  objc_super v15 = [AVCaption alloc];
  v16 = &v26;
  if (*((unsigned char *)self->_conformerInternal + 8)) {
    v16 = v24;
  }
  long long v17 = v16[2];
  long long v18 = *v16;
  v20[1] = v16[1];
  v20[2] = v17;
  v20[0] = v18;
  v14 = [(AVCaption *)v15 initWithFigCaptionData:cf timeRange:v20];
LABEL_15:
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

@end