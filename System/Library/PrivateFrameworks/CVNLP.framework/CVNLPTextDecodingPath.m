@interface CVNLPTextDecodingPath
+ (id)defaultPathScoringFunction;
+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3;
+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3 pruneProblematicMixedScriptWordPaths:(BOOL)a4;
+ (id)defaultPathScoringFunctionPruneProblematicMixedScriptWordPaths:(BOOL)a3;
- (BOOL)hasProblematicMixedScriptWords;
- (CVNLPTextDecodingPath)init;
- (CVNLPTextDecodingPath)initWithCharacterLanguageModelLogProbability:(double)a3 wordLanguageModelLogProbability:(double)a4 lexiconScore:(double)a5 hasProblematicMixedScriptWords:(BOOL)a6 string:(id)a7;
- (NSString)string;
- (double)characterLanguageModelLogProbability;
- (double)lexiconScore;
- (double)modelLogProbability;
- (double)wordLanguageModelLogProbability;
- (int64_t)characterCount;
- (int64_t)pseudoSpaceCount;
- (int64_t)tokenCount;
@end

@implementation CVNLPTextDecodingPath

- (CVNLPTextDecodingPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)CVNLPTextDecodingPath;
  v2 = [(CVNLPTextDecodingPath *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasProblematicMixedScriptWords = 0;
    *(_OWORD *)&v2->_modelLogProbability = 0u;
    *(_OWORD *)&v2->_wordLanguageModelLogProbability = 0u;
    *(_OWORD *)&v2->_characterCount = 0u;
    string = v2->_string;
    v2->_tokenCount = 0;
    v2->_string = (NSString *)&stru_1F0D56340;
  }
  return v3;
}

- (CVNLPTextDecodingPath)initWithCharacterLanguageModelLogProbability:(double)a3 wordLanguageModelLogProbability:(double)a4 lexiconScore:(double)a5 hasProblematicMixedScriptWords:(BOOL)a6 string:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CVNLPTextDecodingPath;
  v14 = [(CVNLPTextDecodingPath *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_characterLanguageModelLogProbability = a3;
    v14->_wordLanguageModelLogProbability = a4;
    v14->_lexiconScore = a5;
    v14->_hasProblematicMixedScriptWords = a6;
    objc_storeStrong((id *)&v14->_string, a7);
  }

  return v15;
}

+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  objc_super v6 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_pruneProblematicMixedScriptWordPaths_(v4, v5, (uint64_t)v3, 0);

  return v6;
}

+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3 pruneProblematicMixedScriptWordPaths:(BOOL)a4
{
  id v5 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B4C58D6C;
  v13[3] = &unk_1E60A3B10;
  BOOL v15 = a4;
  id v14 = v5;
  id v6 = v5;
  v7 = (void *)MEMORY[0x1BA9931A0](v13);
  v11 = (void *)MEMORY[0x1BA9931A0](v7, v8, v9, v10);

  return v11;
}

+ (id)defaultPathScoringFunction
{
  uint64_t v2 = objc_opt_class();
  return (id)MEMORY[0x1F4181798](v2, sel_defaultPathScoringFunctionPruneProblematicMixedScriptWordPaths_, 0, v3);
}

+ (id)defaultPathScoringFunctionPruneProblematicMixedScriptWordPaths:(BOOL)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B4C58F88;
  v6[3] = &unk_1E60A3B30;
  BOOL v7 = a3;
  uint64_t v3 = (void *)MEMORY[0x1BA9931A0](v6, a2);
  v4 = (void *)MEMORY[0x1BA9931A0]();

  return v4;
}

- (double)modelLogProbability
{
  return self->_modelLogProbability;
}

- (double)characterLanguageModelLogProbability
{
  return self->_characterLanguageModelLogProbability;
}

- (double)wordLanguageModelLogProbability
{
  return self->_wordLanguageModelLogProbability;
}

- (double)lexiconScore
{
  return self->_lexiconScore;
}

- (BOOL)hasProblematicMixedScriptWords
{
  return self->_hasProblematicMixedScriptWords;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (int64_t)pseudoSpaceCount
{
  return self->_pseudoSpaceCount;
}

- (int64_t)tokenCount
{
  return self->_tokenCount;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end