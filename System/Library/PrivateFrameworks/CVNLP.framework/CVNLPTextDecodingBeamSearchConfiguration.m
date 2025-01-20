@interface CVNLPTextDecodingBeamSearchConfiguration
- (BOOL)pruneProblematicMixedScriptWordPaths;
- (BOOL)shouldApplyWordLMToLastWord;
- (BOOL)shouldOptimizeAlignment;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 beamWidth:(unint64_t)a4 pathCount:(unint64_t)a5 shouldOptimizeAlignment:(BOOL)a6;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 beamWidth:(unint64_t)a4 pathCount:(unint64_t)a5 shouldOptimizeAlignment:(BOOL)a6 pruneProblematicMixedScriptWordPaths:(BOOL)a7;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7 pruneProblematicMixedScriptWordPaths:(BOOL)a8;
- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7 pruneProblematicMixedScriptWordPaths:(BOOL)a8 shouldApplyWordLMToLastWord:(BOOL)a9;
- (id)scoringFunction;
- (unint64_t)beamWidth;
- (unint64_t)pathCount;
- (void)setBeamWidth:(unint64_t)a3;
- (void)setPathCount:(unint64_t)a3;
- (void)setPruneProblematicMixedScriptWordPaths:(BOOL)a3;
- (void)setShouldApplyWordLMToLastWord:(BOOL)a3;
- (void)setShouldOptimizeAlignment:(BOOL)a3;
@end

@implementation CVNLPTextDecodingBeamSearchConfiguration

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7 pruneProblematicMixedScriptWordPaths:(BOOL)a8 shouldApplyWordLMToLastWord:(BOOL)a9
{
  v15.receiver = self;
  v15.super_class = (Class)CVNLPTextDecodingBeamSearchConfiguration;
  result = [(CVNLPTextDecodingConfiguration *)&v15 initWithCommitActionBehavior:a3];
  if (result)
  {
    result->_beamWidth = a5;
    result->_pathCount = a6;
    result->_scoringFunction = a4;
    result->_shouldOptimizeAlignment = a7;
    result->_pruneProblematicMixedScriptWordPaths = a8;
  }
  return result;
}

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7 pruneProblematicMixedScriptWordPaths:(BOOL)a8
{
  char v9 = 0;
  return (CVNLPTextDecodingBeamSearchConfiguration *)objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_shouldApplyWordLMToLastWord_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, v9);
}

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6 shouldOptimizeAlignment:(BOOL)a7
{
  return (CVNLPTextDecodingBeamSearchConfiguration *)MEMORY[0x1F4181798](self, sel_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_, a3, a4);
}

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 scoringFunction:(id)a4 beamWidth:(unint64_t)a5 pathCount:(unint64_t)a6
{
  return (CVNLPTextDecodingBeamSearchConfiguration *)objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 0);
}

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 beamWidth:(unint64_t)a4 pathCount:(unint64_t)a5 shouldOptimizeAlignment:(BOOL)a6
{
  return (CVNLPTextDecodingBeamSearchConfiguration *)MEMORY[0x1F4181798](self, sel_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_, a3, 0);
}

- (CVNLPTextDecodingBeamSearchConfiguration)initWithCommitActionBehavior:(id)a3 beamWidth:(unint64_t)a4 pathCount:(unint64_t)a5 shouldOptimizeAlignment:(BOOL)a6 pruneProblematicMixedScriptWordPaths:(BOOL)a7
{
  return (CVNLPTextDecodingBeamSearchConfiguration *)MEMORY[0x1F4181798](self, sel_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_, a3, 0);
}

- (unint64_t)beamWidth
{
  return self->_beamWidth;
}

- (void)setBeamWidth:(unint64_t)a3
{
  self->_beamWidth = a3;
}

- (unint64_t)pathCount
{
  return self->_pathCount;
}

- (void)setPathCount:(unint64_t)a3
{
  self->_pathCount = a3;
}

- (BOOL)shouldOptimizeAlignment
{
  return self->_shouldOptimizeAlignment;
}

- (void)setShouldOptimizeAlignment:(BOOL)a3
{
  self->_shouldOptimizeAlignment = a3;
}

- (BOOL)pruneProblematicMixedScriptWordPaths
{
  return self->_pruneProblematicMixedScriptWordPaths;
}

- (void)setPruneProblematicMixedScriptWordPaths:(BOOL)a3
{
  self->_pruneProblematicMixedScriptWordPaths = a3;
}

- (BOOL)shouldApplyWordLMToLastWord
{
  return self->_shouldApplyWordLMToLastWord;
}

- (void)setShouldApplyWordLMToLastWord:(BOOL)a3
{
  self->_shouldApplyWordLMToLastWord = a3;
}

- (id)scoringFunction
{
  return self->_scoringFunction;
}

@end