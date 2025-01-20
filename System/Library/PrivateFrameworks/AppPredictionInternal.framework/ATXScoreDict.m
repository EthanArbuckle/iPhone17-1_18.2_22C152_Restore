@interface ATXScoreDict
+ (id)scoreDictFromDictionary:(id)a3;
- (ATXScoreDict)init;
- (ATXScoreDict)initWithDefaultValueForKeys:(id)a3;
- (ATXScoreDict)initWithDefaultValueForScoreTypeKeys;
- (NSString)description;
- (double)scoreForKey:(id)a3 found:(BOOL *)a4;
- (id)toDictionary;
- (unint64_t)count;
- (void)atx_writeToFile:(__sFILE *)a3;
- (void)dealloc;
- (void)getKeys:(id *)a3 count:(unint64_t)a4;
- (void)setScore:(double)a3 forKey:(id)a4;
@end

@implementation ATXScoreDict

- (void)atx_writeToFile:(__sFILE *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(ATXScoreDict *)self count];
  v6 = (void *)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v6, 8 * v5);
  [(ATXScoreDict *)self getKeys:v6 count:v5];
  CFQSortArray();
  fwrite("{\n", 2uLL, 1uLL, a3);
  for (; v5; --v5)
  {
    printQuotedString(a3, (void *)*v6);
    fwrite(": ", 2uLL, 1uLL, a3);
    v7 = NSNumber;
    [(ATXScoreDict *)self scoreForKey:*v6 found:0];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    objc_msgSend(v8, "atx_writeToFile:", a3);
    if (v5 != 1) {
      fputc(44, a3);
    }
    fputc(10, a3);

    ++v6;
  }
  fputc(125, a3);
}

- (ATXScoreDict)init
{
  v4.receiver = self;
  v4.super_class = (Class)ATXScoreDict;
  v2 = [(ATXScoreDict *)&v4 init];
  if (v2) {
    v2->_dict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], &kValueSlotDictionaryValueCallBacks);
  }
  return v2;
}

- (ATXScoreDict)initWithDefaultValueForKeys:(id)a3
{
  id v5 = a3;
  v6 = [(ATXScoreDict *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultKeys, a3);
  }

  return v7;
}

- (ATXScoreDict)initWithDefaultValueForScoreTypeKeys
{
  if (initWithDefaultValueForScoreTypeKeys_onceToken != -1) {
    dispatch_once(&initWithDefaultValueForScoreTypeKeys_onceToken, &__block_literal_global_196);
  }
  uint64_t v3 = initWithDefaultValueForScoreTypeKeys_keyNames;
  return [(ATXScoreDict *)self initWithDefaultValueForKeys:v3];
}

void __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:817];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke_2;
  v4[3] = &unk_1E68B4A00;
  id v5 = v0;
  id v1 = v0;
  +[_ATXScoreTypes iterScoreInputsWithBlock:v4];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)initWithDefaultValueForScoreTypeKeys_keyNames;
  initWithDefaultValueForScoreTypeKeys_keyNames = v2;
}

void __52__ATXScoreDict_initWithDefaultValueForScoreTypeKeys__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[_ATXScoreTypes stringForScoreInput:a2];
  [v2 addObject:v3];
}

- (void)dealloc
{
  dict = self->_dict;
  if (dict) {
    CFRelease(dict);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXScoreDict;
  [(ATXScoreDict *)&v4 dealloc];
}

- (void)setScore:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  key = v6;
  if (a3 != -31337.0
    || (BOOL v7 = -[NSSet containsObject:](self->_defaultKeys, "containsObject:", v6, -31337.0), v8 = key, !v7))
  {
    double v9 = -0.0;
    if (a3 != 0.0) {
      double v9 = a3;
    }
    CFDictionarySetValue(self->_dict, key, *(const void **)&v9);
    v8 = key;
  }
}

- (double)scoreForKey:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  double v7 = COERCE_DOUBLE(CFDictionaryGetValue(self->_dict, v6));
  if (v7 == 0.0)
  {
    if (a4) {
      *a4 = [(NSSet *)self->_defaultKeys containsObject:v6];
    }
    double v9 = -31337.0;
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    if (v7 == 0.0 && v7 < 0.0) {
      double v9 = 0.0;
    }
    else {
      double v9 = v7;
    }
  }

  return v9;
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dict);
}

- (id)toDictionary
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:CFDictionaryGetCount(self->_dict)];
  CFDictionaryApplyFunction(self->_dict, (CFDictionaryApplierFunction)toDictionaryApplier, v3);
  return v3;
}

- (NSString)description
{
  uint64_t v2 = [(ATXScoreDict *)self toDictionary];
  id v3 = [v2 description];

  return (NSString *)v3;
}

+ (id)scoreDictFromDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v13);
        [v11 doubleValue];
        objc_msgSend(v4, "setScore:forKey:", v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)getKeys:(id *)a3 count:(unint64_t)a4
{
}

- (void).cxx_destruct
{
}

@end