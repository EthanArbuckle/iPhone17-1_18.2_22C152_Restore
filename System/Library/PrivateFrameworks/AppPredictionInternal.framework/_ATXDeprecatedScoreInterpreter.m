@interface _ATXDeprecatedScoreInterpreter
- (NSSet)subscoreNames;
- (_ATXDeprecatedScoreInterpreter)initWithParseRoot:(id)a3;
- (double)_evalVariable:(id)a3 withCtx:(id)a4;
- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4;
- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4;
- (unint64_t)instructionCount;
- (void)_compileRoot:(id)a3;
@end

@implementation _ATXDeprecatedScoreInterpreter

- (unint64_t)instructionCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  varPrograms = self->_varPrograms;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50___ATXDeprecatedScoreInterpreter_instructionCount__block_invoke;
  v5[3] = &unk_1E68B5060;
  v5[4] = &v6;
  [(NSDictionary *)varPrograms enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)subscoreNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(NSDictionary *)self->_varPrograms allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (_ATXDeprecatedScoreInterpreter)initWithParseRoot:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ATXDeprecatedScoreInterpreter;
  v5 = [(_ATXDeprecatedScoreInterpreter *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(_ATXDeprecatedScoreInterpreter *)v5 _compileRoot:v4];
  }

  return v6;
}

- (void)_compileRoot:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = objc_opt_new();
  v17 = objc_opt_new();
  v15 = self;
  objc_initWeak(&location, self);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v25 = 0;
        v26 = (id *)&v25;
        uint64_t v27 = 0x3042000000;
        v28 = __Block_byref_object_copy__97;
        v29 = __Block_byref_object_dispose__97;
        id v30 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke;
        aBlock[3] = &unk_1E68B5168;
        id v21 = v18;
        id v22 = v17;
        objc_copyWeak(&v24, &location);
        v23 = &v25;
        uint64_t v9 = _Block_copy(aBlock);
        objc_storeWeak(v26 + 5, v9);
        id WeakRetained = objc_loadWeakRetained(v26 + 5);
        v11 = [v5 objectForKeyedSubscript:v8];
        v12 = compiledExpressionInstructions(WeakRetained, v11);
        [v19 setObject:v12 forKeyedSubscript:v8];

        objc_destroyWeak(&v24);
        _Block_object_dispose(&v25, 8);
        objc_destroyWeak(&v30);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [v19 copy];
  varPrograms = v15->_varPrograms;
  v15->_varPrograms = (NSDictionary *)v13;

  objc_destroyWeak(&location);
}

- (double)_evalVariable:(id)a3 withCtx:(id)a4
{
  id v6 = a3;
  v7 = (id *)a4;
  if (!v6)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:]"];
    [v28 handleFailureInFunction:v29, @"_ATXDeprecatedScoreInterpreter.m", 644, @"Invalid parameter not satisfying: %@", @"varName" file lineNumber description];
  }
  uint64_t v8 = [(NSDictionary *)self->_varPrograms objectForKeyedSubscript:v6];
  if (!v8)
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:]"];
    [v16 handleFailureInFunction:v17, @"_ATXDeprecatedScoreInterpreter.m", 649, @"Invalid parameter not satisfying: %@", @"instructions" file lineNumber description];
  }
  double v18 = runInstructionsAndPopResult(v8, v7);
  double v19 = fabs(v18);
  if (v19 >= INFINITY && v19 <= INFINITY)
  {
    v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)v6, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  [v7[503] setScore:v6 forKey:v18];

  return v18;
}

- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [_ATXDeprecatedScoreInterpreterCtx alloc];
  uint64_t v9 = +[ATXScoreDict scoreDictFromDictionary:v6];
  uint64_t v10 = [(_ATXDeprecatedScoreInterpreterCtx *)v8 initWithInputScores:v9 intentType:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_varPrograms;
  uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:](self, "_evalVariable:withCtx:", *(void *)(*((void *)&v18 + 1) + 8 * i), v10, (void)v18);
      }
      uint64_t v13 = [(NSDictionary *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  uint64_t v16 = [v10[503] toDictionary];

  return v16;
}

- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[_ATXDeprecatedScoreInterpreterCtx alloc] initWithInputScores:v6 intentType:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_varPrograms;
  uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:](self, "_evalVariable:withCtx:", *(void *)(*((void *)&v16 + 1) + 8 * v13++), v8, (void)v16);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  uint64_t v14 = v8->subscores;
  return v14;
}

- (void).cxx_destruct
{
}

- (void)_evalVariable:(uint64_t)a3 withCtx:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end