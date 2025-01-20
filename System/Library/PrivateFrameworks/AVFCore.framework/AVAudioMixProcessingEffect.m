@interface AVAudioMixProcessingEffect
+ (id)processingEffectWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6;
- (AVAudioMixProcessingEffect)initWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValueSupported:(id)a3 exceptionReasonOut:(id *)a4;
- (NSArray)parameterSchedule;
- (NSDictionary)properties;
- (NSString)DSPGraphText;
- (NSString)identifier;
- (id)_figAudioProperties;
- (id)_figSchedule;
- (id)_fourCCToFigPropertyDict;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAudioMixProcessingEffect

- (BOOL)isValueSupported:(id)a3 exceptionReasonOut:(id *)a4
{
  if (isValueSupported_exceptionReasonOut__sSupportedValueTypesOnce != -1) {
    dispatch_once(&isValueSupported_exceptionReasonOut__sSupportedValueTypesOnce, &__block_literal_global_13);
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_106;
  v13[3] = &unk_1E57B4A50;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = &v20;
  v13[7] = &v14;
  [(id)isValueSupported_exceptionReasonOut__sSupportedValueTypes enumerateObjectsUsingBlock:v13];
  v7 = v21;
  int v8 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((unsigned char *)v21 + 24))
  {
    v9 = v15;
    v10 = @"Unsupported type sent as value for property";
    if (v15[5]) {
      v10 = (__CFString *)v15[5];
    }
    *a4 = v10;
    v9[5] = 0;
    int v8 = *((unsigned __int8 *)v7 + 24);
  }
  BOOL v11 = v8 != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

id __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:5];
  id result = (id)objc_msgSend(v0, "setWithArray:", v1, v3, v4, v5, v6);
  isValueSupported_exceptionReasonOut__sSupportedValueTypes = (uint64_t)result;
  return result;
}

uint64_t __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_106(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v7 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t result = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (result)
      {
        uint64_t v8 = result;
        uint64_t v9 = *(void *)v16;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v7);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) isValueSupported:*(void *)(*((void *)&v15 + 1) + 8 * v10) exceptionReasonOut:0];
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              uint64_t result = (uint64_t)(id)[NSString stringWithFormat:@"array containing value with type %@ is not supported", objc_opt_class()];
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
              return result;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t result = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          uint64_t v8 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        BOOL v11 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_2;
        v12[3] = &unk_1E57B4A28;
        long long v13 = *(_OWORD *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 56);
        return [v11 enumerateKeysAndObjectsUsingBlock:v12];
      }
    }
  }
  return result;
}

id __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isValueSupported:a2 exceptionReasonOut:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = @"dictionary with key of type %@ is not supported";
    goto LABEL_5;
  }
  id result = (id)[*(id *)(a1 + 32) isValueSupported:a3 exceptionReasonOut:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = @"dictionary with value of type %@ is not supported";
LABEL_5:
    id result = (id)objc_msgSend(NSString, "stringWithFormat:", v8, objc_opt_class());
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

+ (id)processingEffectWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6
{
  uint64_t v6 = [[AVAudioMixProcessingEffect alloc] initWithDSPGraphText:a3 properties:a4 parameterSchedule:a5 identifier:a6];
  return v6;
}

- (AVAudioMixProcessingEffect)initWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)AVAudioMixProcessingEffect;
  BOOL v11 = [(AVAudioMixEffect *)&v35 init];
  if (v11)
  {
    v11->_identifier = (NSString *)[a6 copy];
    v11->_graphText = (NSString *)[a3 copy];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__13;
    v33 = __Block_byref_object_dispose__13;
    uint64_t v34 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke;
    v28[3] = &unk_1E57B4A78;
    v28[4] = v11;
    v28[5] = &v29;
    [a4 enumerateKeysAndObjectsUsingBlock:v28];
    uint64_t v17 = v30[5];
    if (v17)
    {
      char v23 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v11, a2, v17, v12, v13, v14, v15, v16, v24), 0);
      objc_exception_throw(v23);
    }
    v11->_properties = (NSDictionary *)[a4 copy];
    v11->_scheduleEntries = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [a5 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(a5);
          }
          uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * v20) copy];
          -[NSMutableArray insertObject:atIndex:](v11->_scheduleEntries, "insertObject:atIndex:", v21, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v11->_scheduleEntries, "indexOfObject:inSortedRange:options:usingComparator:", v21, 0, [(NSMutableArray *)v11->_scheduleEntries count], 1024, &__block_literal_global_130));
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [a5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v18);
    }
    _Block_object_dispose(&v29, 8);
  }
  return v11;
}

uint64_t __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  if ((unint64_t)[a2 unsignedLongLongValue] >> 32)
  {
    uint64_t result = (uint64_t)(id)[NSString stringWithFormat:@"key %@ in properties dictionary is not FourCC", a2];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    char v9 = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isValueSupported:a3 exceptionReasonOut:*(void *)(*(void *)(a1 + 40) + 8) + 40];
    char v9 = result ^ 1;
  }
  *a4 = v9;
  return result;
}

uint64_t __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    [a2 time];
    if (a3)
    {
LABEL_3:
      [a3 time];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&time2, 0, sizeof(time2));
LABEL_6:
  if (CMTimeCompare(&time1, &time2) < 0) {
    return -1;
  }
  if (!a2)
  {
    memset(&v7, 0, sizeof(v7));
    if (a3) {
      goto LABEL_9;
    }
LABEL_12:
    memset(&v6, 0, sizeof(v6));
    return CMTimeCompare(&v7, &v6) > 0;
  }
  [a2 time];
  if (!a3) {
    goto LABEL_12;
  }
LABEL_9:
  [a3 time];
  return CMTimeCompare(&v7, &v6) > 0;
}

- (void)dealloc
{
  graphText = self->_graphText;
  if (graphText) {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixProcessingEffect;
  [(AVAudioMixProcessingEffect *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  if (a3 == self)
  {
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  int v5 = [(NSString *)self->_identifier isEqual:*((void *)a3 + 2)];
  if (v5)
  {
    int v5 = [(NSMutableArray *)self->_scheduleEntries isEqual:*((void *)a3 + 4)];
    if (v5)
    {
      int v5 = [(NSDictionary *)self->_properties isEqual:*((void *)a3 + 5)];
      if (v5)
      {
        graphText = self->_graphText;
        if (!graphText || !*((void *)a3 + 3)) {
          goto LABEL_10;
        }
        uint64_t v7 = [(NSString *)graphText hash];
        if (v7 == [*((id *)a3 + 3) hash])
        {
          int v5 = [(NSString *)self->_graphText isEqual:*((void *)a3 + 3)];
          if (v5) {
            goto LABEL_10;
          }
          return v5;
        }
LABEL_11:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger graphText = (NSUInteger)self->_graphText;
  if (graphText) {
    NSUInteger graphText = [(id)graphText hash];
  }
  unint64_t v5 = graphText ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_scheduleEntries hash];
  return v5 ^ v6 ^ [(NSDictionary *)self->_properties hash];
}

- (id)_fourCCToFigPropertyDict
{
  if (_fourCCToFigPropertyDict_sFourCCToFigPropertyDictOnce != -1) {
    dispatch_once(&_fourCCToFigPropertyDict_sFourCCToFigPropertyDictOnce, &__block_literal_global_132);
  }
  return (id)_fourCCToFigPropertyDict_sFourCCToFigPropertyDict;
}

id __54__AVAudioMixProcessingEffect__fourCCToFigPropertyDict__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v1 = *MEMORY[0x1E4F326C8];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:1735554168];
  uint64_t v3 = *MEMORY[0x1E4F326D0];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:1886548848];
  id result = (id)objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", v1, v2, v3, v4, *MEMORY[0x1E4F326C0], objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", 1635087216), 0);
  _fourCCToFigPropertyDict_sFourCCToFigPropertyDict = (uint64_t)result;
  return result;
}

- (id)_figAudioProperties
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (self->_graphText)
  {
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:1634758764];
    [v3 setValue:v4 forKey:*MEMORY[0x1E4F326A0]];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:1685287015];
    [v3 setValue:v5 forKey:*MEMORY[0x1E4F326A8]];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    [v3 setValue:v6 forKey:*MEMORY[0x1E4F326B0]];
    id v7 = [(AVAudioMixProcessingEffect *)self _fourCCToFigPropertyDict];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v8, "setValue:forKey:", self->_graphText, objc_msgSend(v7, "objectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", 1735554168)));
    properties = self->_properties;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__AVAudioMixProcessingEffect__figAudioProperties__block_invoke;
    v11[3] = &unk_1E57B4AA0;
    v11[4] = v8;
    v11[5] = v7;
    [(NSDictionary *)properties enumerateKeysAndObjectsUsingBlock:v11];
    [v3 setValue:v8 forKey:*MEMORY[0x1E4F326B8]];
  }
  return v3;
}

uint64_t __49__AVAudioMixProcessingEffect__figAudioProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:a2];
  return [v4 setValue:a3 forKey:v5];
}

- (id)_figSchedule
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(AVAudioMixProcessingEffect *)self parameterSchedule];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_figSchedule"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSString)identifier
{
  uint64_t v2 = self->_identifier;
  return v2;
}

- (NSString)DSPGraphText
{
  NSUInteger graphText = self->_graphText;
  if (!graphText) {
    return 0;
  }
  uint64_t v3 = graphText;
  return v3;
}

- (NSArray)parameterSchedule
{
  uint64_t v2 = self->_scheduleEntries;
  return (NSArray *)v2;
}

- (NSDictionary)properties
{
  uint64_t v2 = self->_properties;
  return v2;
}

- (id)description
{
  if (self->_graphText) {
    return (id)[NSString stringWithFormat:@"DSPG(%p) identifier=%@", self, -[AVAudioMixProcessingEffect identifier](self, "identifier")];
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN(%p)", self, v3);
  }
}

@end