@interface MTLCompileOptionsInternal
- (BOOL)allowReferencingUndefinedSymbols;
- (BOOL)compileTimeStatisticsEnabled;
- (BOOL)debuggingEnabled;
- (BOOL)enableLogging;
- (BOOL)fastMathEnabled;
- (BOOL)glBufferBindPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)preserveInvariance;
- (BOOL)tracingEnabled;
- (MTLCompileOptionsInternal)init;
- (id)additionalCompilerArguments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)exportDictionary;
- (id)formattedDescription:(unint64_t)a3;
- (id)installName;
- (id)libraries;
- (id)preprocessorMacros;
- (int64_t)compileSymbolVisibility;
- (int64_t)libraryType;
- (int64_t)mathFloatingPointFunctions;
- (int64_t)mathMode;
- (int64_t)optimizationLevel;
- (unint64_t)hash;
- (unint64_t)languageVersion;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unsigned)sourceLanguage;
- (void)dealloc;
- (void)importDictionary:(id)a3;
- (void)setAdditionalCompilerArguments:(id)a3;
- (void)setAllowReferencingUndefinedSymbols:(BOOL)a3;
- (void)setCompileSymbolVisibility:(int64_t)a3;
- (void)setCompileTimeStatisticsEnabled:(BOOL)a3;
- (void)setDebuggingEnabled:(BOOL)a3;
- (void)setEnableLogging:(BOOL)a3;
- (void)setFastMathEnabled:(BOOL)a3;
- (void)setGlBufferBindPoints:(BOOL)a3;
- (void)setInstallName:(id)a3;
- (void)setLanguageVersion:(unint64_t)a3;
- (void)setLibraries:(id)a3;
- (void)setLibraryType:(int64_t)a3;
- (void)setMathFloatingPointFunctions:(int64_t)a3;
- (void)setMathMode:(int64_t)a3;
- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3;
- (void)setOptimizationLevel:(int64_t)a3;
- (void)setPreprocessorMacros:(id)a3;
- (void)setPreserveInvariance:(BOOL)a3;
- (void)setSourceLanguage:(unsigned __int8)a3;
- (void)setTracingEnabled:(BOOL)a3;
@end

@implementation MTLCompileOptionsInternal

- (void)setLanguageVersion:(unint64_t)a3
{
  self->_userSetLanguageVersion = 1;
  self->_languageVersion = a3;
}

- (int64_t)libraryType
{
  return self->_libraryType;
}

- (int64_t)optimizationLevel
{
  return self->_optimizationLevel;
}

- (unsigned)sourceLanguage
{
  return self->_sourceLanguage;
}

- (BOOL)tracingEnabled
{
  return self->_tracingEnabled;
}

- (BOOL)preserveInvariance
{
  return self->_preserveInvariance;
}

- (id)preprocessorMacros
{
  return self->_preprocessorMacros;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_maxTotalThreadsPerThreadgroup;
}

- (int64_t)mathMode
{
  return self->_mathMode;
}

- (int64_t)mathFloatingPointFunctions
{
  return self->_mathFloatingPointFunctions;
}

- (id)libraries
{
  return self->_libraries;
}

- (unint64_t)languageVersion
{
  return self->_languageVersion;
}

- (id)installName
{
  return self->_installName;
}

- (BOOL)glBufferBindPoints
{
  return self->_glBufferBindPoints;
}

- (BOOL)fastMathEnabled
{
  return self->_mathMode == 2 && self->_mathFloatingPointFunctions == 0;
}

- (BOOL)enableLogging
{
  return self->_enableLogging;
}

- (BOOL)debuggingEnabled
{
  return self->_debuggingEnabled;
}

- (BOOL)compileTimeStatisticsEnabled
{
  return self->_compileTimeStatisticsEnabled;
}

- (int64_t)compileSymbolVisibility
{
  return self->_compileSymbolVisibility;
}

- (BOOL)allowReferencingUndefinedSymbols
{
  return self->_allowReferencingUndefinedSymbols;
}

- (id)additionalCompilerArguments
{
  return self->_additionalCompilerArguments;
}

- (void)setPreprocessorMacros:(id)a3
{
  preprocessorMacros = self->_preprocessorMacros;
  if (preprocessorMacros != a3)
  {

    self->_preprocessorMacros = (NSDictionary *)[a3 copy];
  }
}

- (void)setAdditionalCompilerArguments:(id)a3
{
  additionalCompilerArguments = self->_additionalCompilerArguments;
  if (additionalCompilerArguments != a3)
  {

    self->_additionalCompilerArguments = (NSString *)[a3 copy];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCompileOptionsInternal;
  [(MTLCompileOptionsInternal *)&v3 dealloc];
}

- (MTLCompileOptionsInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLCompileOptionsInternal;
  v2 = [(MTLCompileOptionsInternal *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_mathMode = 2;
    v2->_mathFloatingPointFunctions = 0;
    if (getDefaultLanguageVersion(int)::pred != -1) {
      dispatch_once(&getDefaultLanguageVersion(int)::pred, &__block_literal_global_1678);
    }
    uint64_t v4 = getDefaultLanguageVersion(int)::maxAllowedMTLLanguageVersion;
    if ((unint64_t)getDefaultLanguageVersion(int)::maxAllowedMTLLanguageVersion >= 0x30002) {
      uint64_t v4 = 196610;
    }
    v3->_languageVersion = v4;
    v3->_tracingEnabled = 0;
    v3->_compileTimeStatisticsEnabled = 0;
    v3->_additionalCompilerArguments = 0;
    v3->_sourceLanguage = 0;
    v3->_libraryType = 0;
    v3->_libraries = 0;
    v3->_preserveInvariance = 0;
    v3->_optimizationLevel = 0;
    v3->_compileSymbolVisibility = 0;
    v3->_allowReferencingUndefinedSymbols = 0;
    v3->_maxTotalThreadsPerThreadgroup = 0;
    v3->_enableLogging = 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    preprocessorMacros = self->_preprocessorMacros;
    if (preprocessorMacros == *((NSDictionary **)a3 + 2)
      || (int v6 = -[NSDictionary isEqual:](preprocessorMacros, "isEqual:")) != 0)
    {
      if (self->_mathMode != *((void *)a3 + 3)
        || self->_mathFloatingPointFunctions != *((void *)a3 + 4)
        || self->_debuggingEnabled != *((unsigned __int8 *)a3 + 42)
        || self->_glBufferBindPoints != *((unsigned __int8 *)a3 + 40)
        || self->_tracingEnabled != *((unsigned __int8 *)a3 + 41)
        || self->_compileTimeStatisticsEnabled != *((unsigned __int8 *)a3 + 56))
      {
        goto LABEL_3;
      }
      additionalCompilerArguments = self->_additionalCompilerArguments;
      if (additionalCompilerArguments == *((NSString **)a3 + 8)
        || (int v6 = -[NSString isEqualToString:](additionalCompilerArguments, "isEqualToString:")) != 0)
      {
        if (self->_userSetLanguageVersion != *((unsigned __int8 *)a3 + 8)
          || self->_languageVersion != *((void *)a3 + 6)
          || self->_optimizationLevel != *((void *)a3 + 14)
          || self->_sourceLanguage != *((unsigned __int8 *)a3 + 72)
          || self->_libraryType != *((void *)a3 + 10))
        {
          goto LABEL_3;
        }
        int v9 = MTLCompareArray(self->_libraries, *((void **)a3 + 11), 1, 0);
        LOBYTE(v6) = 0;
        if (v9)
        {
          installName = self->_installName;
          if (installName == *((NSString **)a3 + 12)
            || (int v6 = -[NSString isEqualToString:](installName, "isEqualToString:")) != 0)
          {
            if (self->_preserveInvariance != *((unsigned __int8 *)a3 + 104)
              || self->_compileSymbolVisibility != *((void *)a3 + 15)
              || self->_allowReferencingUndefinedSymbols != *((unsigned __int8 *)a3 + 128)
              || self->_maxTotalThreadsPerThreadgroup != *((void *)a3 + 17))
            {
              goto LABEL_3;
            }
            LOBYTE(v6) = self->_enableLogging == *((unsigned __int8 *)a3 + 144);
          }
        }
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  bzero(v11, 0x88uLL);
  uint64_t v3 = [(NSDictionary *)self->_preprocessorMacros hash];
  int64_t mathMode = self->_mathMode;
  int64_t mathFloatingPointFunctions = self->_mathFloatingPointFunctions;
  v11[0] = v3;
  v11[1] = mathMode;
  v11[2] = mathFloatingPointFunctions;
  BOOL debuggingEnabled = self->_debuggingEnabled;
  BOOL glBufferBindPoints = self->_glBufferBindPoints;
  BOOL userSetLanguageVersion = self->_userSetLanguageVersion;
  unint64_t languageVersion = self->_languageVersion;
  LOBYTE(mathFloatingPointFunctions) = self->_compileTimeStatisticsEnabled;
  BOOL tracingEnabled = self->_tracingEnabled;
  char v17 = mathFloatingPointFunctions;
  NSUInteger v18 = [(NSString *)self->_additionalCompilerArguments hash];
  int64_t libraryType = self->_libraryType;
  unsigned __int8 sourceLanguage = self->_sourceLanguage;
  int64_t v20 = libraryType;
  uint64_t v21 = MTLHashArray(self->_libraries, 1, 0);
  NSUInteger v22 = [(NSString *)self->_installName hash];
  int64_t optimizationLevel = self->_optimizationLevel;
  int64_t compileSymbolVisibility = self->_compileSymbolVisibility;
  BOOL preserveInvariance = self->_preserveInvariance;
  BOOL allowReferencingUndefinedSymbols = self->_allowReferencingUndefinedSymbols;
  int64_t v24 = optimizationLevel;
  int64_t v25 = compileSymbolVisibility;
  BOOL v26 = allowReferencingUndefinedSymbols;
  unint64_t maxTotalThreadsPerThreadgroup = self->_maxTotalThreadsPerThreadgroup;
  BOOL enableLogging = self->_enableLogging;
  return _MTLHashState((int *)v11, 0x88uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    *(void *)(v5 + 16) = [(NSDictionary *)self->_preprocessorMacros copyWithZone:a3];
    *(void *)(v5 + 24) = self->_mathMode;
    *(void *)(v5 + 32) = self->_mathFloatingPointFunctions;
    *(unsigned char *)(v5 + 42) = self->_debuggingEnabled;
    *(unsigned char *)(v5 + 40) = self->_glBufferBindPoints;
    *(unsigned char *)(v5 + 8) = self->_userSetLanguageVersion;
    *(void *)(v5 + 48) = self->_languageVersion;
    *(unsigned char *)(v5 + 41) = self->_tracingEnabled;
    *(unsigned char *)(v5 + 56) = self->_compileTimeStatisticsEnabled;
    *(void *)(v5 + 64) = [(NSString *)self->_additionalCompilerArguments copy];
    *(unsigned char *)(v5 + 72) = self->_sourceLanguage;
    *(void *)(v5 + 80) = self->_libraryType;
    *(void *)(v5 + 88) = [(NSArray *)self->_libraries copy];
    *(void *)(v5 + 96) = [(NSString *)self->_installName copy];
    *(unsigned char *)(v5 + 104) = self->_preserveInvariance;
    *(void *)(v5 + 112) = self->_optimizationLevel;
    *(void *)(v5 + 120) = self->_compileSymbolVisibility;
    *(unsigned char *)(v5 + 128) = self->_allowReferencingUndefinedSymbols;
    *(void *)(v5 + 136) = self->_maxTotalThreadsPerThreadgroup;
    *(unsigned char *)(v5 + 144) = self->_enableLogging;
  }
  return (id)v5;
}

- (void)setLibraries:(id)a3
{
  libraries = self->_libraries;
  if (libraries != a3)
  {

    self->_libraries = (NSArray *)[a3 copy];
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  unsigned int languageVersion = self->_languageVersion;
  preprocessorMacros = self->_preprocessorMacros;
  if (preprocessorMacros
    && (v8 = [(NSDictionary *)preprocessorMacros allKeys],
        int v9 = [(NSDictionary *)self->_preprocessorMacros allValues],
        [(NSDictionary *)self->_preprocessorMacros count]))
  {
    uint64_t v10 = 0;
    v11 = &stru_1ECAC84A8;
    unsigned int v12 = 1;
    do
    {
      v36[0] = v6;
      v36[1] = [(NSArray *)v8 objectAtIndexedSubscript:v10];
      v36[2] = @"=";
      v36[3] = [(NSArray *)v9 objectAtIndexedSubscript:v10];
      v11 = (__CFString *)-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v36, 4), "componentsJoinedByString:", @" "));
      uint64_t v10 = v12;
    }
    while ([(NSDictionary *)self->_preprocessorMacros count] > v12++);
  }
  else
  {
    v11 = &stru_1ECAC84A8;
  }
  v14 = NSString;
  v34.receiver = self;
  v34.super_class = (Class)MTLCompileOptionsInternal;
  id v15 = [(MTLCompileOptionsInternal *)&v34 description];
  v35[0] = v5;
  v35[1] = @"preprocessorMacros:";
  if (v11) {
    v16 = v11;
  }
  else {
    v16 = @"<null>";
  }
  v35[2] = v16;
  v35[3] = v5;
  v35[4] = @"mathMode =";
  unint64_t mathMode = self->_mathMode;
  NSUInteger v18 = @"<unknown>";
  if (mathMode <= 2) {
    NSUInteger v18 = (__CFString *)*((void *)&off_1E5221728 + mathMode);
  }
  v35[5] = v18;
  v35[6] = v5;
  int64_t mathFloatingPointFunctions = self->_mathFloatingPointFunctions;
  int64_t v20 = @"MTLMathFloatingPointFunctionsFast";
  if (mathFloatingPointFunctions) {
    int64_t v20 = @"<unknown>";
  }
  BOOL v21 = mathFloatingPointFunctions == 1;
  NSUInteger v22 = @"MTLMathFloatingPointFunctionsPrecise";
  if (!v21) {
    NSUInteger v22 = v20;
  }
  v35[7] = @"mathFloatingPointFunctions =";
  v35[8] = v22;
  v35[9] = v5;
  v35[10] = @"preserveInvariance =";
  uint64_t v23 = [NSNumber numberWithBool:self->_preserveInvariance];
  int64_t optimizationLevel = self->_optimizationLevel;
  v35[11] = v23;
  v35[12] = v5;
  int64_t v25 = @"MTLLibraryOptimizationLevelSize";
  if (optimizationLevel != 1) {
    int64_t v25 = @"<unknown>";
  }
  BOOL v21 = optimizationLevel == 0;
  BOOL v26 = @"MTLLibraryOptimizationLevelDefault";
  if (!v21) {
    BOOL v26 = v25;
  }
  v35[13] = @"optimizationLevel =";
  v35[14] = v26;
  int64_t libraryType = self->_libraryType;
  v35[15] = v5;
  v35[16] = @"libraryType =";
  v28 = @"MTLLibraryTypeDynamic";
  if (libraryType != 1) {
    v28 = @"<unknown>";
  }
  if (libraryType) {
    v29 = v28;
  }
  else {
    v29 = @"MTLLibraryTypeExecutable";
  }
  v35[17] = v29;
  v35[18] = v5;
  installName = (__CFString *)self->_installName;
  if (!installName) {
    installName = @"<null>";
  }
  v35[19] = @"installName =";
  v35[20] = installName;
  v35[21] = v5;
  v35[22] = @"int64_t compileSymbolVisibility = ";
  v35[23] = [NSNumber numberWithInteger:self->_compileSymbolVisibility];
  v35[24] = v5;
  v35[25] = @"BOOL allowReferencingUndefinedSymbols = ";
  v35[26] = [NSNumber numberWithBool:self->_allowReferencingUndefinedSymbols];
  v35[27] = v5;
  v35[28] = @"unint64_t maxTotalThreadsPerThreadgroup = ";
  v35[29] = [NSNumber numberWithUnsignedInteger:self->_maxTotalThreadsPerThreadgroup];
  v35[30] = v5;
  v35[31] = @"enableLogging =";
  v35[32] = [NSNumber numberWithBool:self->_enableLogging];
  v35[33] = v5;
  v35[34] = @"languageVersion =";
  if (self->_userSetLanguageVersion) {
    v31 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%u:%u", HIWORD(languageVersion), (unsigned __int16)languageVersion);
  }
  else {
    v31 = @"default";
  }
  v35[35] = v31;
  return (id)[v14 stringWithFormat:@"%@%@", v15, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 36), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLCompileOptionsInternal *)self formattedDescription:0];
}

- (id)exportDictionary
{
  v13[20] = *MEMORY[0x1E4F143B8];
  v12[0] = @"preprocessorMacros";
  id v3 = [(MTLCompileOptionsInternal *)self preprocessorMacros];
  id v4 = (id)MEMORY[0x1E4F1CC08];
  if (v3) {
    id v4 = v3;
  }
  v13[0] = v4;
  v12[1] = @"fastMathEnabled";
  v13[1] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal fastMathEnabled](self, "fastMathEnabled"));
  v12[2] = @"mathMode";
  v13[2] = objc_msgSend(NSNumber, "numberWithInteger:", -[MTLCompileOptionsInternal mathMode](self, "mathMode"));
  v12[3] = @"mathFloatingPointFunctions";
  v13[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[MTLCompileOptionsInternal mathFloatingPointFunctions](self, "mathFloatingPointFunctions"));
  v12[4] = @"languageVersion";
  v13[4] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal languageVersion](self, "languageVersion"));
  v12[5] = @"tracingEnabled";
  v13[5] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal tracingEnabled](self, "tracingEnabled"));
  v12[6] = @"glBufferBindPoints";
  v13[6] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal glBufferBindPoints](self, "glBufferBindPoints"));
  v12[7] = @"debuggingEnabled";
  v13[7] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal debuggingEnabled](self, "debuggingEnabled"));
  v12[8] = @"compileTimeStatisticsEnabled";
  v13[8] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal compileTimeStatisticsEnabled](self, "compileTimeStatisticsEnabled"));
  v12[9] = @"additionalCompilerArguments";
  uint64_t v5 = [(MTLCompileOptionsInternal *)self additionalCompilerArguments];
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &stru_1ECAC84A8;
  }
  v13[9] = v6;
  v12[10] = @"sourceLanguage";
  v13[10] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal sourceLanguage](self, "sourceLanguage"));
  v12[11] = @"type";
  v13[11] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal libraryType](self, "libraryType"));
  v12[12] = @"libraries";
  id v7 = [(MTLCompileOptionsInternal *)self libraries];
  id v8 = (id)MEMORY[0x1E4F1CBF0];
  if (v7) {
    id v8 = v7;
  }
  v13[12] = v8;
  v12[13] = @"installName";
  int v9 = [(MTLCompileOptionsInternal *)self installName];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_1ECAC84A8;
  }
  v13[13] = v10;
  v12[14] = @"preserveInvariance";
  v13[14] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal preserveInvariance](self, "preserveInvariance"));
  v12[15] = @"optimizationLevel";
  v13[15] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal optimizationLevel](self, "optimizationLevel"));
  v12[16] = @"compileSymbolVisibility";
  v13[16] = objc_msgSend(NSNumber, "numberWithInteger:", -[MTLCompileOptionsInternal compileSymbolVisibility](self, "compileSymbolVisibility"));
  v12[17] = @"allowReferencingUndefinedSymbols";
  v13[17] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal allowReferencingUndefinedSymbols](self, "allowReferencingUndefinedSymbols"));
  v12[18] = @"maxTotalThreadsPerThreadgroup";
  v13[18] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MTLCompileOptionsInternal maxTotalThreadsPerThreadgroup](self, "maxTotalThreadsPerThreadgroup"));
  v12[19] = @"enableLogging";
  v13[19] = objc_msgSend(NSNumber, "numberWithBool:", -[MTLCompileOptionsInternal enableLogging](self, "enableLogging"));
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:20];
}

- (void)importDictionary:(id)a3
{
  uint64_t v5 = [a3 objectForKeyedSubscript:@"preprocessorMacros"];
  if (v5) {
    [(MTLCompileOptionsInternal *)self setPreprocessorMacros:v5];
  }
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"fastMathEnabled"];
  if (v6) {
    -[MTLCompileOptionsInternal setFastMathEnabled:](self, "setFastMathEnabled:", [v6 BOOLValue]);
  }
  id v7 = (void *)[a3 objectForKeyedSubscript:@"mathMode"];
  if (v7) {
    -[MTLCompileOptionsInternal setMathMode:](self, "setMathMode:", [v7 unsignedLongValue]);
  }
  id v8 = (void *)[a3 objectForKeyedSubscript:@"mathFloatingPointFunctions"];
  if (v8) {
    -[MTLCompileOptionsInternal setMathFloatingPointFunctions:](self, "setMathFloatingPointFunctions:", [v8 unsignedLongValue]);
  }
  int v9 = (void *)[a3 objectForKeyedSubscript:@"languageVersion"];
  if (v9) {
    -[MTLCompileOptionsInternal setLanguageVersion:](self, "setLanguageVersion:", [v9 unsignedLongValue]);
  }
  uint64_t v10 = (void *)[a3 objectForKeyedSubscript:@"tracingEnabled"];
  if (v10) {
    -[MTLCompileOptionsInternal setTracingEnabled:](self, "setTracingEnabled:", [v10 BOOLValue]);
  }
  v11 = (void *)[a3 objectForKeyedSubscript:@"glBufferBindPoints"];
  if (v11) {
    -[MTLCompileOptionsInternal setGlBufferBindPoints:](self, "setGlBufferBindPoints:", [v11 BOOLValue]);
  }
  unsigned int v12 = (void *)[a3 objectForKeyedSubscript:@"debuggingEnabled"];
  if (v12) {
    -[MTLCompileOptionsInternal setDebuggingEnabled:](self, "setDebuggingEnabled:", [v12 BOOLValue]);
  }
  v13 = (void *)[a3 objectForKeyedSubscript:@"compileTimeStatisticsEnabled"];
  if (v13) {
    -[MTLCompileOptionsInternal setCompileTimeStatisticsEnabled:](self, "setCompileTimeStatisticsEnabled:", [v13 BOOLValue]);
  }
  uint64_t v14 = [a3 objectForKeyedSubscript:@"additionalCompilerArguments"];
  if (v14) {
    [(MTLCompileOptionsInternal *)self setAdditionalCompilerArguments:v14];
  }
  id v15 = (void *)[a3 objectForKeyedSubscript:@"sourceLanguage"];
  if (v15) {
    -[MTLCompileOptionsInternal setSourceLanguage:](self, "setSourceLanguage:", [v15 unsignedLongValue]);
  }
  v16 = (void *)[a3 objectForKeyedSubscript:@"libraryType"];
  if (v16) {
    -[MTLCompileOptionsInternal setLibraryType:](self, "setLibraryType:", [v16 unsignedLongValue]);
  }
  uint64_t v17 = [a3 objectForKeyedSubscript:@"libraries"];
  if (v17) {
    [(MTLCompileOptionsInternal *)self setLibraries:v17];
  }
  uint64_t v18 = [a3 objectForKeyedSubscript:@"installName"];
  if (v18) {
    [(MTLCompileOptionsInternal *)self setInstallName:v18];
  }
  v19 = (void *)[a3 objectForKeyedSubscript:@"preserveInvariance"];
  if (v19) {
    -[MTLCompileOptionsInternal setPreserveInvariance:](self, "setPreserveInvariance:", [v19 BOOLValue]);
  }
  int64_t v20 = (void *)[a3 objectForKeyedSubscript:@"optimizationLevel"];
  if (v20) {
    -[MTLCompileOptionsInternal setOptimizationLevel:](self, "setOptimizationLevel:", [v20 unsignedLongValue]);
  }
  BOOL v21 = (void *)[a3 objectForKeyedSubscript:@"compileSymbolVisibility"];
  if (v21) {
    -[MTLCompileOptionsInternal setCompileSymbolVisibility:](self, "setCompileSymbolVisibility:", [v21 unsignedLongValue]);
  }
  NSUInteger v22 = (void *)[a3 objectForKeyedSubscript:@"allowReferencingUndefinedSymbols"];
  if (v22) {
    -[MTLCompileOptionsInternal setAllowReferencingUndefinedSymbols:](self, "setAllowReferencingUndefinedSymbols:", [v22 BOOLValue]);
  }
  uint64_t v23 = (void *)[a3 objectForKeyedSubscript:@"maxTotalThreadsPerThreadgroup"];
  if (v23) {
    -[MTLCompileOptionsInternal setMaxTotalThreadsPerThreadgroup:](self, "setMaxTotalThreadsPerThreadgroup:", [v23 unsignedLongValue]);
  }
  int64_t v24 = (void *)[a3 objectForKeyedSubscript:@"enableLogging"];
  if (v24)
  {
    uint64_t v25 = [v24 BOOLValue];
    [(MTLCompileOptionsInternal *)self setEnableLogging:v25];
  }
}

- (void)setFastMathEnabled:(BOOL)a3
{
  int64_t v3 = 2;
  if (!a3) {
    int64_t v3 = 0;
  }
  self->_unint64_t mathMode = v3;
  self->_int64_t mathFloatingPointFunctions = !a3;
}

- (void)setMathMode:(int64_t)a3
{
  self->_unint64_t mathMode = a3;
}

- (void)setMathFloatingPointFunctions:(int64_t)a3
{
  self->_int64_t mathFloatingPointFunctions = a3;
}

- (void)setDebuggingEnabled:(BOOL)a3
{
  self->_BOOL debuggingEnabled = a3;
}

- (void)setGlBufferBindPoints:(BOOL)a3
{
  self->_BOOL glBufferBindPoints = a3;
}

- (void)setTracingEnabled:(BOOL)a3
{
  self->_BOOL tracingEnabled = a3;
}

- (void)setCompileTimeStatisticsEnabled:(BOOL)a3
{
  self->_compileTimeStatisticsEnabled = a3;
}

- (void)setSourceLanguage:(unsigned __int8)a3
{
  self->_unsigned __int8 sourceLanguage = a3;
}

- (void)setLibraryType:(int64_t)a3
{
  self->_int64_t libraryType = a3;
}

- (void)setInstallName:(id)a3
{
}

- (void)setPreserveInvariance:(BOOL)a3
{
  self->_BOOL preserveInvariance = a3;
}

- (void)setOptimizationLevel:(int64_t)a3
{
  self->_int64_t optimizationLevel = a3;
}

- (void)setCompileSymbolVisibility:(int64_t)a3
{
  self->_int64_t compileSymbolVisibility = a3;
}

- (void)setAllowReferencingUndefinedSymbols:(BOOL)a3
{
  self->_BOOL allowReferencingUndefinedSymbols = a3;
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  self->_unint64_t maxTotalThreadsPerThreadgroup = a3;
}

- (void)setEnableLogging:(BOOL)a3
{
  self->_BOOL enableLogging = a3;
}

@end