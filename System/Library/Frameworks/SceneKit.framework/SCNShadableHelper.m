@interface SCNShadableHelper
+ (BOOL)supportsSecureCoding;
- (BOOL)_bindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7;
- (BOOL)isOpaque;
- (NSArray)shaderModifiersArgumentsNames;
- (NSDictionary)shaderModifiers;
- (NSNumber)minimumLanguageVersion;
- (SCNProgram)program;
- (SCNShadableHelper)initWithCoder:(id)a3;
- (SCNShadableHelper)initWithOwner:(id)a3;
- (__C3DFXGLSLProgram)_programFromPassAtIndex:(int64_t)a3;
- (__C3DFXTechnique)_technique;
- (id)owner;
- (void)__CFObject;
- (void)_commonInit;
- (void)_customDecodingOfSCNShadableHelper:(id)a3;
- (void)_customEncodingOfSCNShadableHelper:(id)a3;
- (void)_parseAndSetShaderModifier:(id)a3;
- (void)_programDidChange:(id)a3;
- (void)_setC3DProgram;
- (void)_setC3DProgramDelegate;
- (void)_startObservingProgram;
- (void)_stopObservingProgram;
- (void)_unbindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7;
- (void)_updateAllC3DProgramInputs;
- (void)_updateC3DProgramInput:(__C3DFXGLSLProgram *)a3 forSymbol:(id)a4;
- (void)_updateC3DProgramInputForSymbol:(id)a3;
- (void)copyModifiersFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)ownerWillDie;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setProgram:(id)a3;
- (void)setShaderModifiers:(id)a3;
@end

@implementation SCNShadableHelper

void __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke_2(uint64_t a1)
{
}

- (void)__CFObject
{
  return objc_msgSend(self->_owner, "__CFObject");
}

uint64_t __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:a2];
}

- (SCNShadableHelper)initWithOwner:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNShadableHelper;
  v4 = [(SCNShadableHelper *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(SCNShadableHelper *)v4 _commonInit];
    v5->_owner = a3;
  }
  return v5;
}

- (void)_commonInit
{
  self->_symbolToBinder = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_symbolToUnbinder = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_argumentsNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
}

- (void)setShaderModifiers:(id)a3
{
  if (self->_program && [a3 count])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShadableHelper setShaderModifiers:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    shaderModifiers = self->_shaderModifiers;
    if (shaderModifiers != a3)
    {

      if ([a3 count])
      {
        v14 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:a3 copyItems:1];
      }
      else if (a3)
      {
        v14 = (NSDictionary *)MEMORY[0x263EFFA78];
      }
      else
      {
        v14 = 0;
      }
      self->_shaderModifiers = v14;
      id v15 = [(SCNShadableHelper *)self owner];
      v16 = self->_shaderModifiers;
      v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSDictionary count](v16, "count"));
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = ____arrayOfC3DModifiersFromDictionary_block_invoke;
      v19[3] = &unk_2640069F0;
      v19[4] = v17;
      v19[5] = v15;
      [(NSDictionary *)v16 enumerateKeysAndObjectsUsingBlock:v19];

      v18 = v17;
      self->_c3dShaderModifierCache = v18;
      [(SCNShadableHelper *)self _parseAndSetShaderModifier:v18];
    }
  }
}

- (id)owner
{
  return self->_owner;
}

- (void)_parseAndSetShaderModifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_argumentsNames removeAllObjects];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(a3);
        }
        Arguments = (void *)C3DShaderModifierGetArguments(*(void *)(*((void *)&v22 + 1) + 8 * i));
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke;
        v21[3] = &unk_264006110;
        v21[4] = self;
        [Arguments enumerateKeysAndObjectsUsingBlock:v21];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  p_owner = &self->_owner;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v11 = objc_msgSend(self->_owner, "__CFObject");
    uint64_t v12 = [self->_owner sceneRef];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke_2;
    v20[3] = &unk_264004FC0;
    v20[4] = a3;
    v20[5] = v11;
    +[SCNTransaction postCommandWithContext:v12 object:self applyBlock:v20];
  }
  else
  {
    v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCNShadableHelper _parseAndSetShaderModifier:]((uint64_t)p_owner, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)ownerWillDie
{
  self->_owner = 0;
}

- (NSArray)shaderModifiersArgumentsNames
{
  v2 = (void *)[(NSMutableArray *)self->_argumentsNames copy];

  return (NSArray *)v2;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "_owner == nil";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Must call -[SCNShadableHelper ownerWillDie] before releasing it !", (uint8_t *)&v1, 0xCu);
}

- (void)_startObservingProgram
{
  if (self->_program)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    program = self->_program;
    [v3 addObserver:self selector:sel__programDidChange_ name:@"SCNProgramDidChangeNotification" object:program];
  }
}

- (void)_stopObservingProgram
{
  if (self->_program)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    program = self->_program;
    [v3 removeObserver:self name:@"SCNProgramDidChangeNotification" object:program];
  }
}

- (void)setProgram:(id)a3
{
  if (a3 && [(NSDictionary *)self->_shaderModifiers count])
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShadableHelper setProgram:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (self->_program != a3)
  {
    [(SCNShadableHelper *)self _stopObservingProgram];

    self->_program = (SCNProgram *)a3;
    uint64_t v13 = [self->_owner sceneRef];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__SCNShadableHelper_setProgram___block_invoke;
    v14[3] = &unk_264005010;
    v14[4] = self;
    +[SCNTransaction postCommandWithContext:v13 object:self applyBlock:v14];
  }
}

uint64_t __32__SCNShadableHelper_setProgram___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setC3DProgram];
  v2 = *(void **)(a1 + 32);

  return [v2 _startObservingProgram];
}

- (SCNProgram)program
{
  v2 = self->_program;

  return v2;
}

- (BOOL)isOpaque
{
  return [(SCNProgram *)self->_program isOpaque];
}

- (BOOL)_bindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v11 = [(NSDictionary *)self->_symbolToBinder objectForKey:a3];
  id v12 = v11;
  if (v11) {
    (*((void (**)(id, uint64_t, uint64_t, id, id))v11 + 2))(v11, v9, v10, a6, a7);
  }
  return v12 != 0;
}

- (void)_unbindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7
{
  if (-[NSDictionary objectForKey:](self->_symbolToBinder, "objectForKey:"))
  {
    uint64_t v9 = [(NSDictionary *)self->_symbolToUnbinder objectForKey:a3];
    if (v9)
    {
      uint64_t v10 = (void (*)(void))v9[2];
      v10();
    }
  }
}

- (NSDictionary)shaderModifiers
{
  v2 = self->_shaderModifiers;

  return v2;
}

- (void)copyModifiersFrom:(id)a3
{
  v4 = (void *)*((void *)a3 + 4);
  uint64_t v5 = (NSDictionary *)[a3 shaderModifiers];
  uint64_t v6 = v5;
  if (v4)
  {
    if (self->_program && [(NSDictionary *)v5 count])
    {
      uint64_t v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNShadableHelper setShaderModifiers:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    else
    {
      shaderModifiers = self->_shaderModifiers;
      if (shaderModifiers != v6)
      {

        if ([(NSDictionary *)v6 count])
        {
          uint64_t v16 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:v6 copyItems:1];
        }
        else if (v6)
        {
          uint64_t v16 = (NSDictionary *)MEMORY[0x263EFFA78];
        }
        else
        {
          uint64_t v16 = 0;
        }
        self->_shaderModifiers = v16;

        self->_c3dShaderModifierCache = (NSArray *)v4;
        [(SCNShadableHelper *)self _parseAndSetShaderModifier:v4];
      }
    }
  }
  else
  {
    [(SCNShadableHelper *)self setShaderModifiers:v5];
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion != a3)
  {

    self->_minimumLanguageVersion = (NSNumber *)a3;
    uint64_t v6 = [self->_owner sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) owner];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = (CFTypeRef *)objc_msgSend(v2, "__CFObject");
    CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 40);
    C3DEntitySetShadableMinimumMTLLanguageVersion(v3, v4);
  }
  else
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke_cold_1();
    }
  }
}

- (NSNumber)minimumLanguageVersion
{
  return self->_minimumLanguageVersion;
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  id v6 = (id)[a4 copy];
  if (v6)
  {
    id v7 = v6;
    symbolToBinder = self->_symbolToBinder;
    [(NSDictionary *)symbolToBinder setValue:v7 forKey:a3];
  }
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  id v6 = (id)[a4 copy];
  if (v6)
  {
    id v7 = v6;
    symbolToUnbinder = self->_symbolToUnbinder;
    [(NSDictionary *)symbolToUnbinder setValue:v7 forKey:a3];
  }
}

- (void)_programDidChange:(id)a3
{
  uint64_t v5 = [self->_owner sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SCNShadableHelper__programDidChange___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __39__SCNShadableHelper__programDidChange___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) userInfo];
  if (v2)
  {
    uint64_t v3 = [v2 valueForKey:@"parameter"];
    if (v3) {
      [*(id *)(a1 + 40) _updateC3DProgramInputForSymbol:v3];
    }
  }
  else
  {
    [*(id *)(a1 + 40) _setC3DProgram];
  }
  CFDictionaryRef v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "owner"), "sceneRef");

  return [v4 postNotificationName:@"kC3DSceneDidUpdateNotification" object:v5];
}

- (__C3DFXTechnique)_technique
{
  result = (__C3DFXTechnique *)[self->_owner materialRef];
  if (result)
  {
    return (__C3DFXTechnique *)C3DMaterialGetTechnique((uint64_t)result);
  }
  return result;
}

- (__C3DFXGLSLProgram)_programFromPassAtIndex:(int64_t)a3
{
  result = [(SCNShadableHelper *)self _technique];
  if (result)
  {
    return (__C3DFXGLSLProgram *)C3DFXTechniqueGetSingleProgram((uint64_t)result);
  }
  return result;
}

- (void)_updateC3DProgramInput:(__C3DFXGLSLProgram *)a3 forSymbol:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t PassAtIndex = C3DFXTechniqueGetPassAtIndex((uint64_t)[(SCNShadableHelper *)self _technique], 0);
  InputWithName = C3DFXPassGetInputWithName(PassAtIndex, a4);
  uint64_t v9 = InputWithName;
  if (InputWithName
    || (uint64_t v9 = C3DFXPassAddInputWithName(PassAtIndex, a4), C3DFXPassInputSetSymbolName((uint64_t)v9, a4), v9))
  {
    int v10 = _fxSemanticFromSemanticString([(SCNProgram *)self->_program semanticForSymbol:a4]);
    C3DFXPassInputSetSemantic((uint64_t)v9, v10);
    int v11 = objc_msgSend((id)objc_msgSend(-[SCNProgram _optionsForSymbol:](self->_program, "_optionsForSymbol:", a4), "valueForKey:", @"mappingChannel"), "intValue");
    if (v11 >= 7) {
      unsigned int v12 = 7;
    }
    else {
      unsigned int v12 = v11;
    }
    C3DFXPassInputSetChannelIndex((uint64_t)v9, v12);
    int v13 = C3DVertexAttribFromParameterSemantic(v10, v12);
    if (v13 == 14)
    {
      if (!InputWithName)
      {
        NextUniformIndex = (char *)C3DFXGLSLProgramGetNextUniformIndex(a3);
        C3DFXPassInputSetUniformIndex((uint64_t)v9, (uint64_t)NextUniformIndex);
        C3DFXGLSLProgramSetUniformIndex((CFMutableDictionaryRef *)a3, a4, NextUniformIndex);
      }
    }
    else
    {
      C3DFXGLSLProgramSetAttributeIndex((CFMutableDictionaryRef *)a3, a4, v13);
    }
  }
  else
  {
    uint64_t v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = a4;
      _os_log_impl(&dword_20B249000, v15, OS_LOG_TYPE_DEFAULT, "Warning: _updateC3DProgramInput can't find input named %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_updateC3DProgramInputForSymbol:(id)a3
{
  uint64_t v5 = [(SCNShadableHelper *)self _programFromPassAtIndex:0];
  if (v5)
  {
    [(SCNShadableHelper *)self _updateC3DProgramInput:v5 forSymbol:a3];
  }
}

- (void)_updateAllC3DProgramInputs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SCNShadableHelper *)self _programFromPassAtIndex:0];
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(SCNProgram *)self->_program _allSymbolsWithSceneKitSemantic];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(SCNShadableHelper *)self _updateC3DProgramInput:v4 forSymbol:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_setC3DProgramDelegate
{
  uint64_t v3 = [(SCNShadableHelper *)self _programFromPassAtIndex:0];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    *(void *)&long long v6 = _programBindValueForSymbolCallback;
    *((void *)&v6 + 1) = _programDelegateUnbindValueForSymbolCallback;
    uint64_t v7 = _programDelegateHandleErrorCallback;
    uint64_t v8 = _programDelegateIsOpaqueCallback;
    id v5 = (const void *)C3DFXProgramDelegateCreate(&v6, self);
    C3DFXProgramSetDelegate(v4, v5);
    CFRelease(v5);
  }
}

- (void)_setC3DProgram
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "mat";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

CFHashCode __35__SCNShadableHelper__setC3DProgram__block_invoke(uint64_t a1)
{
  int v1 = (void *)[*(id *)(a1 + 32) libraryProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [v1 _libraryHash];
  }
  else if (v1)
  {
    return CFHash(v1);
  }
  else
  {
    return 0;
  }
}

uint64_t __35__SCNShadableHelper__setC3DProgram__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) libraryProvider];

  return [v3 libraryForDevice:a2];
}

void __35__SCNShadableHelper__setC3DProgram__block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
}

void __35__SCNShadableHelper__setC3DProgram__block_invoke_4(uint64_t a1, int a2, const void *a3, int a4)
{
  uint64_t v8 = *(const void **)(a1 + 32);
  if (v8 && (Shader = (const void *)C3DFXGLSLProgramGetShader(v8, a2)) != 0)
  {
    uint64_t v10 = (uint64_t)Shader;
    C3DFXGLSLProgramSetShader(*(char **)(a1 + 48), Shader);
    C3DFXShaderSetSource(v10, a3);
  }
  else if (a3 || a4)
  {
    long long v11 = (const void *)C3DFXShaderCreate(a2);
    C3DFXGLSLProgramSetShader(*(char **)(a1 + 40), v11);
    C3DFXShaderSetSource((uint64_t)v11, a3);
    CFRelease(v11);
  }
}

- (void)_customEncodingOfSCNShadableHelper:(id)a3
{
  id owner = self->_owner;
  if (owner) {
    [a3 encodeObject:owner forKey:@"owner"];
  }
}

- (void)_customDecodingOfSCNShadableHelper:(id)a3
{
  self->_id owner = (id)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"owner"];
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNShadableHelper _customEncodingOfSCNShadableHelper:](self, "_customEncodingOfSCNShadableHelper:");
  program = self->_program;
  if (program) {
    [a3 encodeObject:program forKey:@"program"];
  }
  shaderModifiers = self->_shaderModifiers;
  if (shaderModifiers) {
    [a3 encodeObject:shaderModifiers forKey:@"shaderModifiers"];
  }
  if (self->_minimumLanguageVersion)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SCNShadableHelper)initWithCoder:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)SCNShadableHelper;
  uint64_t v4 = [(SCNShadableHelper *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    [(SCNShadableHelper *)v4 _commonInit];
    BOOL v6 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNShadableHelper *)v5 _customDecodingOfSCNShadableHelper:a3];
    if (v5->_owner)
    {
      -[SCNShadableHelper setProgram:](v5, "setProgram:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"program"]);
      uint64_t v7 = (void *)MEMORY[0x263EFFA08];
      v10[0] = objc_opt_class();
      v10[1] = objc_opt_class();
      -[SCNShadableHelper setShaderModifiers:](v5, "setShaderModifiers:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 2)), @"shaderModifiers"));
      -[SCNShadableHelper setMinimumLanguageVersion:](v5, "setMinimumLanguageVersion:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"minimumLanguageVersion"]);
    }
    [(SCNShadableHelper *)v5 _didDecodeSCNShadableHelper:a3];
    +[SCNTransaction setImmediateMode:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProgram:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_parseAndSetShaderModifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShaderModifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: ShaderModifiers - unkwnown supporting class '%@'", v2, v3, v4, v5, v6);
}

@end