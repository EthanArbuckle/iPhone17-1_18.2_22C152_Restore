@interface AVCaptionConversionValidator
+ (AVCaptionConversionValidator)captionConversionValidatorWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings;
+ (id)mutableCaptionArray;
- (AVCaptionConversionValidator)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings;
- (AVCaptionConversionValidatorStatus)status;
- (BOOL)_isConversionToClosedCaptions:(id)a3;
- (CMTimeRange)timeRange;
- (NSArray)captions;
- (NSArray)warnings;
- (void)_completeValidation;
- (void)_issueWarningForFigDictionary:(__CFDictionary *)a3;
- (void)dealloc;
- (void)stopValidating;
- (void)validateCaptionConversionWithWarningHandler:(void *)handler;
@end

@implementation AVCaptionConversionValidator

+ (AVCaptionConversionValidator)captionConversionValidatorWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings
{
  id v8 = objc_alloc((Class)objc_opt_class());
  long long v9 = *(_OWORD *)&timeRange->start.epoch;
  v11[0] = *(_OWORD *)&timeRange->start.value;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&timeRange->duration.timescale;
  return (AVCaptionConversionValidator *)(id)[v8 initWithCaptions:captions timeRange:v11 conversionSettings:conversionSettings];
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

- (AVCaptionConversionValidator)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptionConversionValidator *)self _isConversionToClosedCaptions:conversionSettings])
  {
    v28 = self;
    v34 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports conversions only to mediaType 'clcp' and mediaSubType 'c608'", v29, v30, v31, v32, v33, (uint64_t)v35.receiver), 0 reason userInfo];
    objc_exception_throw(v34);
  }
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](captions, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v11 = [(NSArray *)captions countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(captions);
        }
        v15 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v14) copy];
        if (v15) {
          [v10 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)captions countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }
  v35.receiver = self;
  v35.super_class = (Class)AVCaptionConversionValidator;
  v16 = [(AVCaptionConversionValidator *)&v35 init];
  if (v16)
  {
    v17 = malloc_type_calloc(1uLL, 0x68uLL, 0x10800408555C317uLL);
    v16->_validatorInternal = v17;
    if (v17)
    {
      *(void *)v16->_validatorInternal = [[AVWeakReference alloc] initWithReferencedObject:v16];
      uint64_t v18 = [v10 copy];
      validatorInternal = v16->_validatorInternal;
      validatorInternal[1] = v18;
      long long v20 = *(_OWORD *)&timeRange->start.value;
      long long v21 = *(_OWORD *)&timeRange->duration.timescale;
      *((_OWORD *)validatorInternal + 2) = *(_OWORD *)&timeRange->start.epoch;
      *((_OWORD *)validatorInternal + 3) = v21;
      *((_OWORD *)validatorInternal + 1) = v20;
      uint64_t v22 = [(NSDictionary *)conversionSettings copy];
      v23 = v16->_validatorInternal;
      v23[8] = v22;
      v23[11] = 0;
      v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v25 = dispatch_queue_create("com.apple.avcaptionconversionvalidator", v24);
      v26 = v16->_validatorInternal;
      v26[9] = v25;
      v26[10] = 0;
      *((void *)v16->_validatorInternal + 12) = (id)[MEMORY[0x1E4F1CA48] array];
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  validatorInternal = (id *)self->_validatorInternal;
  if (validatorInternal)
  {

    v4 = (dispatch_object_t *)self->_validatorInternal;
    if (v4[9])
    {
      dispatch_release(v4[9]);
      v4 = (dispatch_object_t *)self->_validatorInternal;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptionConversionValidator;
  [(AVCaptionConversionValidator *)&v5 dealloc];
}

- (AVCaptionConversionValidatorStatus)status
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = *((void *)self->_validatorInternal + 9);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptionConversionValidator_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  AVCaptionConversionValidatorStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVCaptionConversionValidator_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 88);
  return result;
}

- (NSArray)captions
{
  return (NSArray *)*((void *)self->_validatorInternal + 1);
}

- (CMTimeRange)timeRange
{
  AVCaptionConversionValidatorStatus v3 = *(_OWORD **)&self->start.timescale;
  long long v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (void)_completeValidation
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  uint64_t v10 = 0;
  v2 = *((void *)self->_validatorInternal + 9);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVCaptionConversionValidator__completeValidation__block_invoke;
  v4[3] = &unk_1E57B2160;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  uint64_t v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __51__AVCaptionConversionValidator__completeValidation__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) <= 1)
  {
    *(void *)(v1 + 88) = 2;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 80);
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 80) = 0;
  }
  return result;
}

- (void)_issueWarningForFigDictionary:(__CFDictionary *)a3
{
  long long v4 = +[AVCaptionConversionWarning captionConversionWarningWithFigDictionary:a3];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  uint64_t v14 = __Block_byref_object_dispose__1;
  uint64_t v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  uint64_t v5 = *((void *)self->_validatorInternal + 9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AVCaptionConversionValidator__issueWarningForFigDictionary___block_invoke;
  v7[3] = &unk_1E57B22E0;
  v7[6] = v8;
  v7[7] = &v10;
  v7[4] = self;
  v7[5] = v4;
  dispatch_sync(v5, v7);
  if (v4)
  {
    uint64_t v6 = v11[5];
    if (v6) {
      (*(void (**)(uint64_t, AVCaptionConversionWarning *))(v6 + 16))(v6, v4);
    }
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
}

void *__62__AVCaptionConversionValidator__issueWarningForFigDictionary___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(void *)(*(void *)(result[4] + 8) + 88) < 2;
  if (*(unsigned char *)(*(void *)(result[6] + 8) + 24))
  {
    *(void *)(*(void *)(result[7] + 8) + 40) = *(void *)(*(void *)(result[4] + 8) + 80);
    if (result[5]) {
      return objc_msgSend(*(id *)(*(void *)(result[4] + 8) + 96), "addObject:");
    }
  }
  return result;
}

- (void)validateCaptionConversionWithWarningHandler:(void *)handler
{
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  CFTypeRef v28 = 0;
  uint64_t v6 = *((void *)self->_validatorInternal + 9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke;
  block[3] = &unk_1E57B2160;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(v6, block);
  if (*((unsigned char *)v30 + 24))
  {
    uint64_t v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after caption conversion validation has started", v7, v8, v9, v10, v11, v23[0]), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  if (!-[AVCaptionConversionValidator _isConversionToClosedCaptions:](self, "_isConversionToClosedCaptions:", *((void *)self->_validatorInternal + 8))|| (uint64_t v12 = *(void *)self->_validatorInternal, v25 = handleCaptionConversionWarning, v26 = v12, *((void *)self->_validatorInternal + 10) = [handler copy], v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80], FigCLCPCaptionConversionValidatorCreate()))
  {
    CFDictionaryRef v16 = 0;
  }
  else
  {
    validatorInternal = self->_validatorInternal;
    long long v15 = validatorInternal[2];
    *(_OWORD *)&range.start.value = validatorInternal[1];
    *(_OWORD *)&range.start.epoch = v15;
    *(_OWORD *)&range.duration.timescale = validatorInternal[3];
    CFDictionaryRef v16 = CMTimeRangeCopyAsDictionary(&range, v13);
    uint64_t CMBaseObject = FigCaptionConversionValidatorGetCMBaseObject();
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    long long v20 = *(unsigned int (**)(uint64_t, void, CFDictionaryRef))(v19 + 56);
    if (v20 && !v20(CMBaseObject, *MEMORY[0x1E4F32810], v16))
    {
      CFRetain(v28);
      global_queue = dispatch_get_global_queue(0, 0);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = (uint64_t)__76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke_2;
      v23[3] = (uint64_t)&unk_1E57B2228;
      v23[4] = v12;
      v23[5] = (uint64_t)v28;
      dispatch_async(global_queue, v23);
      goto LABEL_12;
    }
  }
  [(AVCaptionConversionValidator *)self stopValidating];
LABEL_12:
  if (v16) {
    CFRelease(v16);
  }
  if (v28) {
    CFRelease(v28);
  }
  _Block_object_dispose(&v29, 8);
}

uint64_t __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) < 1) {
    *(void *)(v1 + 88) = 1;
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "captions");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = objc_msgSend(v8, "_figCaptionData", v20, v21, v22);
        if (v8)
        {
          [v8 timeRange];
        }
        else
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v20 = 0u;
        }
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        CFAllocatorRef v13 = *(void (**)(uint64_t, uint64_t, _OWORD *, void))(v12 + 8);
        if (v13)
        {
          v27[0] = v20;
          v27[1] = v21;
          v27[2] = v22;
          v13(v9, v10, v27, 0);
        }
        if (++v5 == 25)
        {
          uint64_t v14 = (void *)[*(id *)(a1 + 32) referencedObject];
          if (!v14 || [v14 status] > 1) {
            goto LABEL_20;
          }
          int v5 = 0;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }
LABEL_20:
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(void (**)(uint64_t, void))(v17 + 16);
  if (v18) {
    v18(v15, 0);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_completeValidation");
}

- (void)stopValidating
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  uint64_t v10 = 0;
  v2 = *((void *)self->_validatorInternal + 9);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptionConversionValidator_stopValidating__block_invoke;
  v4[3] = &unk_1E57B2160;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  uint64_t v3 = (void *)v6[5];
  if (v3) {

  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __46__AVCaptionConversionValidator_stopValidating__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) <= 1)
  {
    *(void *)(v1 + 88) = 3;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 80);
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 80) = 0;
  }
  return result;
}

- (NSArray)warnings
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__16;
  uint64_t v11 = 0;
  v2 = *((void *)self->_validatorInternal + 9);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptionConversionValidator_warnings__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  uint64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVCaptionConversionValidator_warnings__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 96) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)mutableCaptionArray
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

@end