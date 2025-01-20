@interface SGTokenDistanceMappingTransformer
+ (BOOL)debugAppendText:(id)a3;
+ (id)transformArray:(id)a3 withTargetIndex:(unint64_t)a4 maximumDistance:(unint64_t)a5;
+ (id)withTarget:(id)a3 maxDistance:(unint64_t)a4;
+ (void)debugSetContext:(id)a3;
+ (void)debugStoreContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenDistanceMappingTransformer:(id)a3;
- (NSString)targetString;
- (SGTokenDistanceMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (SGTokenDistanceMappingTransformer)initWithTarget:(id)a3 maxDistance:(unint64_t)a4;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (unint64_t)maxDistance;
- (void)setMaxDistance:(unint64_t)a3;
- (void)setTargetString:(id)a3;
@end

@implementation SGTokenDistanceMappingTransformer

- (void).cxx_destruct
{
}

- (void)setMaxDistance:(unint64_t)a3
{
  self->_maxDistance = a3;
}

- (unint64_t)maxDistance
{
  return self->_maxDistance;
}

- (void)setTargetString:(id)a3
{
}

- (NSString)targetString
{
  return self->_targetString;
}

- (unint64_t)hash
{
  v3 = [(SGTokenDistanceMappingTransformer *)self targetString];
  uint64_t v4 = [v3 hash];

  return [(SGTokenDistanceMappingTransformer *)self maxDistance] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGTokenDistanceMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGTokenDistanceMappingTransformer *)self isEqualToTokenDistanceMappingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToTokenDistanceMappingTransformer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SGTokenDistanceMappingTransformer *)self targetString];
    v8 = [v6 targetString];
    if (v7 == v8
      || ([(SGTokenDistanceMappingTransformer *)self targetString],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 targetString],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      unint64_t v10 = [(SGTokenDistanceMappingTransformer *)self maxDistance];
      BOOL v9 = v10 == [v6 maxDistance];
      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = 0;
    }

    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (SGTokenDistanceMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"TARGET_STRING"];
  v8 = [v6 objectForKeyedSubscript:@"MAC_DISTANCE"];

  BOOL v9 = -[SGTokenDistanceMappingTransformer initWithTarget:maxDistance:](self, "initWithTarget:maxDistance:", v7, [v8 unsignedIntegerValue]);
  return v9;
}

- (id)toPlistWithChunks:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"TARGET_STRING";
  uint64_t v4 = [(SGTokenDistanceMappingTransformer *)self targetString];
  v8[1] = @"MAC_DISTANCE";
  v9[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance"));
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGTokenDistanceMappingTransformer transform:]", "SGTokenDistanceMappingTransformer.m", 47, "[input isKindOfClass:[NSArray class]]");
  }
  if ([v4 count])
  {
    v5 = [(SGTokenDistanceMappingTransformer *)self targetString];
    uint64_t v6 = [v4 indexOfObject:v5];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    objc_msgSend((id)objc_opt_class(), "transformArray:withTargetIndex:maximumDistance:", v4, v7, -[SGTokenDistanceMappingTransformer maxDistance](self, "maxDistance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }
  BOOL v9 = v8;

  return v9;
}

- (SGTokenDistanceMappingTransformer)initWithTarget:(id)a3 maxDistance:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGTokenDistanceMappingTransformer;
  uint64_t v7 = [(SGTokenDistanceMappingTransformer *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    [(SGTokenDistanceMappingTransformer *)v7 setTargetString:v6];
    [(SGTokenDistanceMappingTransformer *)v8 setMaxDistance:a4];
  }

  return v8;
}

+ (BOOL)debugAppendText:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_variant_has_internal_diagnostics() && [v3 length])
  {
    objc_sync_enter(@"SuggestionsMLDebugContextDataKey");
    id v4 = +[SGPaths suggestionsDirectoryFile:@"assertion_context"];
    v5 = [v3 stringByAppendingString:@"\n------\n"];
    id v6 = [v5 dataUsingEncoding:4];

    uint64_t v7 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v4];
    id v8 = v7;
    if (v7)
    {
      [v7 seekToEndOfFile];
      [v8 writeData:v6];
      [v8 closeFile];
      char v9 = 1;
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F28370];
      v14[0] = *MEMORY[0x1E4F28348];
      objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v9 = [v11 createFileAtPath:v4 contents:v6 attributes:v10];
    }
    objc_sync_exit(@"SuggestionsMLDebugContextDataKey");
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (void)debugStoreContext
{
  if (os_variant_has_internal_diagnostics())
  {
    id v3 = [MEMORY[0x1E4F29060] currentThread];
    id v5 = [v3 threadDictionary];

    id v4 = [v5 objectForKeyedSubscript:@"SuggestionsMLDebugContextDataKey"];
    [a1 debugAppendText:v4];
  }
}

+ (void)debugSetContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    id v3 = [MEMORY[0x1E4F29060] currentThread];
    id v4 = [v3 threadDictionary];

    if ([v5 length]) {
      [v4 setObject:v5 forKeyedSubscript:@"SuggestionsMLDebugContextDataKey"];
    }
    else {
      [v4 removeObjectForKey:@"SuggestionsMLDebugContextDataKey"];
    }
  }
}

+ (id)transformArray:(id)a3 withTargetIndex:(unint64_t)a4 maximumDistance:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] <= a4)
  {
    [a1 debugStoreContext];
    char v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v18 = a4;
      __int16 v19 = 2048;
      uint64_t v20 = [v8 count];
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGTokenDistanceMappingTransformer: index=%lu, count=%lu", buf, 0x16u);
    }

    if ([v8 count] <= a4) {
      __assert_rtn("+[SGTokenDistanceMappingTransformer transformArray:withTargetIndex:maximumDistance:]", "SGTokenDistanceMappingTransformer.m", 66, "index < input.count");
    }
  }
  objc_super v10 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__SGTokenDistanceMappingTransformer_transformArray_withTargetIndex_maximumDistance___block_invoke;
  v13[3] = &unk_1E65B9198;
  unint64_t v15 = a4;
  unint64_t v16 = a5;
  id v11 = v10;
  id v14 = v11;
  [v8 enumerateObjectsUsingBlock:v13];

  return v11;
}

void __84__SGTokenDistanceMappingTransformer_transformArray_withTargetIndex_maximumDistance___block_invoke(uint64_t a1, void *a2, int a3)
{
  LODWORD(v4) = a3 - *(_DWORD *)(a1 + 40);
  if ((v4 & 0x80000000) == 0) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = (*(_DWORD *)(a1 + 40) - a3);
  }
  if (*(void *)(a1 + 48) > v4)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = (id)[[v7 alloc] initWithFormat:@"%@__%d", v8, (*(_DWORD *)(a1 + 40) - a3)];

    [v6 addObject:v9];
  }
}

+ (id)withTarget:(id)a3 maxDistance:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[SGTokenDistanceMappingTransformer alloc] initWithTarget:v5 maxDistance:a4];

  return v6;
}

@end