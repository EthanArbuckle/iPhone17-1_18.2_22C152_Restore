@interface AVPlayerMediaSelectionCriteria
- (AVPlayerMediaSelectionCriteria)init;
- (AVPlayerMediaSelectionCriteria)initWithFigDictionary:(id)a3;
- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics;
- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 fallbackPreferredLanguages:(id)a5 fallbackPreferredMediaCharacteristics:(id)a6 captionDisplayType:(int64_t)a7;
- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6;
- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6 preferMultichannelAudio:(BOOL)a7 precludeMultichannelAudio:(BOOL)a8;
- (AVPlayerMediaSelectionCriteria)initWithPremiumMediaCharacteristics:(id)a3 preferredLanguages:(id)a4 preferredMediaCharacteristics:(id)a5;
- (AVPlayerMediaSelectionCriteria)initWithPrincipalMediaCharacteristics:(NSArray *)principalMediaCharacteristics preferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics;
- (BOOL)precludeMultichannelAudio;
- (BOOL)preferMultichannelAudio;
- (NSArray)preferredLanguages;
- (NSArray)preferredMediaCharacteristics;
- (NSArray)principalMediaCharacteristics;
- (id)_fallbackPreferredLanguages;
- (id)_fallbackPreferredMediaCharacteristics;
- (id)_precludedMediaCharacteristics;
- (id)description;
- (id)figDictionary;
- (id)precludedMediaSubTypes;
- (id)preferredMediaSubTypes;
- (id)premiumMediaCharacteristics;
- (void)dealloc;
@end

@implementation AVPlayerMediaSelectionCriteria

- (AVPlayerMediaSelectionCriteria)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerMediaSelectionCriteria;
  v2 = [(AVPlayerMediaSelectionCriteria *)&v5 init];
  if (v2)
  {
    v3 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->_criteriaInternal = v3;
    if (v3)
    {
      uint64_t v7 = *MEMORY[0x1E4F33F80];
      uint64_t v6 = *MEMORY[0x1E4F346F0];
      v8[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
      *(void *)v2->_criteriaInternal = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics
{
  uint64_t v7 = [(AVPlayerMediaSelectionCriteria *)self init];
  if (v7)
  {
    v19 = 0;
    if (publicCriteriaAreExceptional(preferredLanguages, preferredMediaCharacteristics, 0, 0, &v19))
    {
      v11 = v7;
      v17 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, (uint64_t)v19, v12, v13, v14, v15, v16, v18), 0);
      objc_exception_throw(v17);
    }
    v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v7->_criteriaInternal];
    v9 = v8;
    if (preferredLanguages) {
      [v8 setValue:preferredLanguages forKey:*MEMORY[0x1E4F33FA0]];
    }
    if (preferredMediaCharacteristics) {
      [v9 setValue:AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(preferredMediaCharacteristics) forKey:*MEMORY[0x1E4F33F98]];
    }

    *(void *)v7->_criteriaInternal = [v9 copy];
  }
  return v7;
}

- (AVPlayerMediaSelectionCriteria)initWithPrincipalMediaCharacteristics:(NSArray *)principalMediaCharacteristics preferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics
{
  uint64_t v7 = [(AVPlayerMediaSelectionCriteria *)self initWithPreferredLanguages:preferredLanguages preferredMediaCharacteristics:preferredMediaCharacteristics];
  if (v7)
  {
    uint64_t v18 = 0;
    if (publicCriteriaAreExceptional(0, 0, principalMediaCharacteristics, 0, &v18))
    {
      v10 = v7;
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, (uint64_t)v18, v11, v12, v13, v14, v15, v17), 0);
      objc_exception_throw(v16);
    }
    v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v7->_criteriaInternal];
    if (principalMediaCharacteristics) {
      [v8 setValue:AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(principalMediaCharacteristics) forKey:*MEMORY[0x1E4F33FB8]];
    }

    *(void *)v7->_criteriaInternal = [v8 copy];
  }
  return v7;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v9 = [(AVPlayerMediaSelectionCriteria *)self initWithPreferredLanguages:a3 preferredMediaCharacteristics:a4];
  if (v9)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v10 = [a5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      uint64_t v13 = @"preferredMediaSubTypes must contain only items of type NSNumber";
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(a5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_24:
            v22 = v9;
            v28 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)v13, v23, v24, v25, v26, v27, v29), 0);
            objc_exception_throw(v28);
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [a5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = [a6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      uint64_t v13 = @"precludedMediaSubTypes must contain only items of type NSNumber";
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(a6);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_24;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [a6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v16);
    }
    v19 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v9->_criteriaInternal];
    v20 = v19;
    if (a5) {
      [v19 setValue:a5 forKey:*MEMORY[0x1E4F33FA8]];
    }
    if (a6) {
      [v20 setValue:a6 forKey:*MEMORY[0x1E4F33F88]];
    }

    *(void *)v9->_criteriaInternal = [v20 copy];
  }
  return v9;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6 preferMultichannelAudio:(BOOL)a7 precludeMultichannelAudio:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = [(AVPlayerMediaSelectionCriteria *)self initWithPreferredLanguages:a3 preferredMediaCharacteristics:a4 preferredMediaSubTypes:a5 precludedMediaSubTypes:a6];
  if (v10)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v10->_criteriaInternal];
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v9];
    [v11 setValue:v12 forKey:*MEMORY[0x1E4F33F90]];
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    [v11 setValue:v13 forKey:*MEMORY[0x1E4F33F78]];

    *(void *)v10->_criteriaInternal = [v11 copy];
  }
  return v10;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 fallbackPreferredLanguages:(id)a5 fallbackPreferredMediaCharacteristics:(id)a6 captionDisplayType:(int64_t)a7
{
  uint64_t v12 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:");
  if (v12)
  {
    if ((unint64_t)a3 | (unint64_t)a4) {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v12->_criteriaInternal];
    }
    else {
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v14 = v13;
    if (a5) {
      [v13 setValue:a5 forKey:*MEMORY[0x1E4F33F70]];
    }
    if (a6) {
      [v14 setValue:AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(a6) forKey:*MEMORY[0x1E4F33F68]];
    }
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInt:a7];
    [v14 setValue:v15 forKey:*MEMORY[0x1E4F33F60]];

    *(void *)v12->_criteriaInternal = [v14 copy];
  }
  return v12;
}

- (AVPlayerMediaSelectionCriteria)initWithPremiumMediaCharacteristics:(id)a3 preferredLanguages:(id)a4 preferredMediaCharacteristics:(id)a5
{
  BOOL v9 = [(AVPlayerMediaSelectionCriteria *)self initWithPreferredLanguages:a4 preferredMediaCharacteristics:a5];
  if (v9)
  {
    if ((unint64_t)a4 | (unint64_t)a5) {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)v9->_criteriaInternal];
    }
    else {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v11 = (void *)v10;
    v21 = 0;
    if (publicCriteriaAreExceptional(0, 0, 0, a3, &v21))
    {
      uint64_t v13 = v9;
      v19 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)v21, v14, v15, v16, v17, v18, v20), 0);
      objc_exception_throw(v19);
    }
    if (a3) {
      [v11 setValue:AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(a3) forKey:*MEMORY[0x1E4F33FB0]];
    }

    *(void *)v9->_criteriaInternal = [v11 copy];
  }
  return v9;
}

- (void)dealloc
{
  criteriaInternal = (id *)self->_criteriaInternal;
  if (criteriaInternal)
  {

    free(self->_criteriaInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerMediaSelectionCriteria;
  [(AVPlayerMediaSelectionCriteria *)&v4 dealloc];
}

- (NSArray)preferredLanguages
{
  result = (NSArray *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33FA0]];
  if (!result)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v3 array];
  }
  return result;
}

- (NSArray)preferredMediaCharacteristics
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F98]];
  if (v2)
  {
    return (NSArray *)AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v4 array];
  }
}

- (NSArray)principalMediaCharacteristics
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33FB8]];
  if (v2)
  {
    return (NSArray *)AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v4 array];
  }
}

- (id)premiumMediaCharacteristics
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33FB0]];
  if (v2)
  {
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v4 array];
  }
}

- (id)_precludedMediaCharacteristics
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F80]];
  if (v2)
  {
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v4 array];
  }
}

- (id)_fallbackPreferredMediaCharacteristics
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F68]];
  if (v2)
  {
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  }
  else
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v4 array];
  }
}

- (id)_fallbackPreferredLanguages
{
  id result = (id)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F70]];
  if (!result)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v3 array];
  }
  return result;
}

- (id)preferredMediaSubTypes
{
  id result = (id)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33FA8]];
  if (!result)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v3 array];
  }
  return result;
}

- (id)precludedMediaSubTypes
{
  id result = (id)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F88]];
  if (!result)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v3 array];
  }
  return result;
}

- (BOOL)preferMultichannelAudio
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F90]];
  return [v2 BOOLValue];
}

- (BOOL)precludeMultichannelAudio
{
  v2 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F78]];
  return [v2 BOOLValue];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  objc_super v4 = (objc_class *)objc_opt_class();
  objc_super v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  if ([(NSArray *)[(AVPlayerMediaSelectionCriteria *)self principalMediaCharacteristics] count])
  {
    uint64_t v6 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self principalMediaCharacteristics];
    [v5 appendString:objc_msgSend(v6, "stringWithFormat:", @", principalMediaCharacteristics = %@", (id)FigCFCopyCompactDescription())];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria premiumMediaCharacteristics](self, "premiumMediaCharacteristics"), "count"))
  {
    uint64_t v7 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self premiumMediaCharacteristics];
    [v5 appendString:objc_msgSend(v7, "stringWithFormat:", @", premiumMediaCharacteristics = %@", (id)FigCFCopyCompactDescription())];
  }
  if ([(NSArray *)[(AVPlayerMediaSelectionCriteria *)self preferredLanguages] count])
  {
    BOOL v8 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self preferredLanguages];
    [v5 appendString:objc_msgSend(v8, "stringWithFormat:", @", preferredLanguages = %@", (id)FigCFCopyCompactDescription())];
  }
  if ([(NSArray *)[(AVPlayerMediaSelectionCriteria *)self preferredMediaCharacteristics] count])
  {
    BOOL v9 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self preferredMediaCharacteristics];
    [v5 appendString:objc_msgSend(v9, "stringWithFormat:", @", preferredMediaCharacteristics = %@", (id)FigCFCopyCompactDescription())];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _precludedMediaCharacteristics](self, "_precludedMediaCharacteristics"), "count"))
  {
    uint64_t v10 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self _precludedMediaCharacteristics];
    [v5 appendString:objc_msgSend(v10, "stringWithFormat:", @", precludedMediaCharacteristics = %@", (id)FigCFCopyCompactDescription())];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _fallbackPreferredMediaCharacteristics](self, "_fallbackPreferredMediaCharacteristics"), "count"))
  {
    uint64_t v11 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self _fallbackPreferredMediaCharacteristics];
    [v5 appendString:objc_msgSend(v11, "stringWithFormat:", @", fallbackPreferredMediaCharacteristics = %@", (id)FigCFCopyCompactDescription())];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _fallbackPreferredLanguages](self, "_fallbackPreferredLanguages"), "count"))
  {
    uint64_t v12 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self _fallbackPreferredLanguages];
    [v5 appendString:objc_msgSend(v12, "stringWithFormat:", @", fallbackPreferredLanguages = %@", (id)FigCFCopyCompactDescription())];
  }
  uint64_t v13 = (void *)[*(id *)self->_criteriaInternal objectForKey:*MEMORY[0x1E4F33F60]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = NSString;
    unsigned int v15 = [v13 intValue];
    if (v15 > 2) {
      uint64_t v16 = @"Unknown";
    }
    else {
      uint64_t v16 = off_1E57B7298[v15];
    }
    [v5 appendString:objc_msgSend(v14, "stringWithFormat:", @", captionAppearanceDisplayType = %@", v16)];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria preferredMediaSubTypes](self, "preferredMediaSubTypes"), "count"))
  {
    uint64_t v17 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self preferredMediaSubTypes];
    [v5 appendString:objc_msgSend(v17, "stringWithFormat:", @", preferredMediaSubTypes = %@", (id)FigCFCopyCompactDescription())];
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria precludedMediaSubTypes](self, "precludedMediaSubTypes"), "count"))
  {
    uint64_t v18 = NSString;
    [(AVPlayerMediaSelectionCriteria *)self precludedMediaSubTypes];
    [v5 appendString:objc_msgSend(v18, "stringWithFormat:", @", precludedMediaSubTypes = %@", (id)FigCFCopyCompactDescription())];
  }
  if ([(AVPlayerMediaSelectionCriteria *)self preferMultichannelAudio]) {
    [v5 appendString:@", preferMultichannelAudio"];
  }
  if ([(AVPlayerMediaSelectionCriteria *)self precludeMultichannelAudio]) {
    [v5 appendString:@", precludeMultichannelAudio"];
  }
  [v5 appendString:@">"];
  return v5;
}

- (id)figDictionary
{
  v2 = *(void **)self->_criteriaInternal;
  if (v2)
  {
    v3 = (void *)[v2 copy];
    return v3;
  }
  else
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v5 dictionary];
  }
}

- (AVPlayerMediaSelectionCriteria)initWithFigDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerMediaSelectionCriteria;
  objc_super v4 = [(AVPlayerMediaSelectionCriteria *)&v7 init];
  if (v4)
  {
    objc_super v5 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v4->_criteriaInternal = v5;
    if (v5)
    {
      *(void *)v4->_criteriaInternal = [a3 copy];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

@end