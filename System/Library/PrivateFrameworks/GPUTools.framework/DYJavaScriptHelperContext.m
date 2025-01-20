@interface DYJavaScriptHelperContext
- (BOOL)evaluateScript:(id)a3;
- (BOOL)evaluateScriptCode:(id)a3;
- (BOOL)prepareCounterNames:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5;
- (BOOL)prepareCounterValues:(id)a3 softwareCounterValues:(id)a4;
- (DYJavaScriptHelperContext)init;
- (id)evaluateDerivedCounters;
- (id)generateJavascriptCode:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5;
- (void)exportCounterValues:(id)a3;
@end

@implementation DYJavaScriptHelperContext

- (DYJavaScriptHelperContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)DYJavaScriptHelperContext;
  v2 = [(DYJavaScriptHelperContext *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(DYJSScriptingContext);
    v2->_context = v3;
    [(JSContext *)[(DYJSScriptingContext *)v3 context] setObject:&__block_literal_global_1 forKeyedSubscript:@"ErrorLog"];
  }
  return v2;
}

uint64_t __33__DYJavaScriptHelperContext_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (FILE *)*MEMORY[0x263EF8348];
  v3 = (const char *)[a2 UTF8String];
  return fputs(v3, v2);
}

- (BOOL)evaluateScript:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, 0);
  if (v5)
  {
    context = self->_context;
    uint64_t v7 = [NSString stringWithContentsOfFile:a3 encoding:4 error:0];
    uint64_t v8 = [NSURL fileURLWithPath:a3];
    LOBYTE(v5) = [(DYJSScriptingContext *)context evaluteScript:v7 scriptURL:v8];
  }
  return v5;
}

- (BOOL)evaluateScriptCode:(id)a3
{
  return [(DYJSScriptingContext *)self->_context evaluteScript:a3 scriptURL:0];
}

- (void)exportCounterValues:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__DYJavaScriptHelperContext_exportCounterValues___block_invoke;
  v3[3] = &unk_265333CE8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __49__DYJavaScriptHelperContext_exportCounterValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setValue:a2 value:a3];
}

- (id)generateJavascriptCode:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[MEMORY[0x263F089D8] string];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(a3);
        }
        [v8 appendFormat:@"var %@ = 0;\n", *(void *)(*((void *)&v48 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [a3 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v10);
  }
  [v8 appendFormat:@"function _SetRawCounterValues() {\n"];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v45;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v8, "appendFormat:", @"\t%@ = _RawCounterValues[%lu];\n",
          *(void *)(*((void *)&v44 + 1) + 8 * v17),
          v15 + v17);
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [a3 countByEnumeratingWithState:&v44 objects:v55 count:16];
      v15 += v17;
    }
    while (v14);
  }
  [v8 appendFormat:@"}\n"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v18 = [a4 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(a4);
        }
        [v8 appendFormat:@"var %@ = 0;\n", *(void *)(*((void *)&v40 + 1) + 8 * v21++)];
      }
      while (v19 != v21);
      uint64_t v19 = [a4 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }
  [v8 appendFormat:@"function _SetSoftwareCounterValues() {\n"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v22 = [a4 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v8, "appendFormat:", @"\t%@ = _SoftwareCounterValues[%lu];\n",
          *(void *)(*((void *)&v36 + 1) + 8 * v26),
          v24 + v26);
        ++v26;
      }
      while (v23 != v26);
      uint64_t v23 = [a4 countByEnumeratingWithState:&v36 objects:v53 count:16];
      v24 += v26;
    }
    while (v23);
  }
  [v8 appendFormat:@"}\n"];
  [v8 appendString:@"var _DerivedCounterResult = [];\nfunction _EvaluteDerivedCounters() {\n"];
  [v8 appendFormat:@"\t_DerivedCounterResult = [];\n"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v27 = [a5 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(a5);
        }
        objc_msgSend(v8, "appendFormat:", @"\ttry { value = %@(); if (!isFinite(value)) { value = 0; } _DerivedCounterResult.push(value); } catch(err) { ErrorLog(err); _DerivedCounterResult.push(0); }\n",
          *(void *)(*((void *)&v32 + 1) + 8 * v30++));
      }
      while (v28 != v30);
      uint64_t v28 = [a5 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v28);
  }
  [v8 appendFormat:@"}\n"];
  return v8;
}

- (BOOL)prepareCounterNames:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5
{
  id v6 = [(DYJavaScriptHelperContext *)self generateJavascriptCode:a3 softwareCounterNames:a4 derivedCounterNames:a5];
  return [(DYJavaScriptHelperContext *)self evaluateScriptCode:v6];
}

- (BOOL)prepareCounterValues:(id)a3 softwareCounterValues:(id)a4
{
  id v6 = [(DYJSScriptingContext *)self->_context setValue:@"_SoftwareCounterValues" value:a4];
  if (v6)
  {
    [(DYJSScriptingContext *)self->_context callGlobalFunction:"_SetSoftwareCounterValues"];
    id v6 = [(DYJSScriptingContext *)self->_context setValue:@"_RawCounterValues" value:a3];
    if (v6)
    {
      [(DYJSScriptingContext *)self->_context callGlobalFunction:"_SetRawCounterValues"];
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (id)evaluateDerivedCounters
{
  [(DYJSScriptingContext *)self->_context callGlobalFunction:"_EvaluteDerivedCounters"];
  id v3 = [(DYJSScriptingContext *)self->_context getValue:@"_DerivedCounterResult"];
  return (id)[v3 toArray];
}

@end