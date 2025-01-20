@interface CSSinglePhraseResult
- (BOOL)isRunningQuasar;
- (BOOL)isSecondChance;
- (BOOL)isSecondChanceCandidate;
- (CSKeywordAnalyzerNDAPIResult)ndapiResult;
- (CSSinglePhraseResult)initWithPhId:(unint64_t)a3 keywordDetectorDecision:(unint64_t)a4 combinedScore:(float)a5 ndapiScore:(float)a6 ndapiResult:(id)a7 recognizerScore:(float)a8 isSecondChance:(BOOL)a9 isSecondChanceCandidate:(BOOL)a10 isRunningQuasar:(BOOL)a11;
- (float)combinedScore;
- (float)ndapiScore;
- (float)recognizerScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)decision;
- (unint64_t)phId;
@end

@implementation CSSinglePhraseResult

- (void).cxx_destruct
{
}

- (BOOL)isRunningQuasar
{
  return self->_isRunningQuasar;
}

- (BOOL)isSecondChanceCandidate
{
  return self->_isSecondChanceCandidate;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (float)recognizerScore
{
  return self->_recognizerScore;
}

- (CSKeywordAnalyzerNDAPIResult)ndapiResult
{
  return self->_ndapiResult;
}

- (float)ndapiScore
{
  return self->_ndapiScore;
}

- (float)combinedScore
{
  return self->_combinedScore;
}

- (unint64_t)decision
{
  return self->_decision;
}

- (unint64_t)phId
{
  return self->_phId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CSSinglePhraseResult alloc];
  unint64_t phId = self->_phId;
  unint64_t decision = self->_decision;
  float combinedScore = self->_combinedScore;
  float ndapiScore = self->_ndapiScore;
  v9 = (void *)[(CSKeywordAnalyzerNDAPIResult *)self->_ndapiResult copy];
  *(float *)&double v10 = self->_recognizerScore;
  *(float *)&double v11 = combinedScore;
  *(float *)&double v12 = ndapiScore;
  v13 = [(CSSinglePhraseResult *)v4 initWithPhId:phId keywordDetectorDecision:decision combinedScore:v9 ndapiScore:self->_isSecondChance ndapiResult:self->_isSecondChanceCandidate recognizerScore:self->_isRunningQuasar isSecondChance:v11 isSecondChanceCandidate:v12 isRunningQuasar:v10];

  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"[_unint64_t phId = %lu]", self->_phId);
  objc_msgSend(v3, "appendFormat:", @"[_unint64_t decision = %lu]", self->_decision);
  objc_msgSend(v3, "appendFormat:", @"[_float combinedScore = %f]", self->_combinedScore);
  objc_msgSend(v3, "appendFormat:", @"[_float ndapiScore = %f]", self->_ndapiScore);
  [v3 appendFormat:@"[_ndapiResult = %@]", self->_ndapiResult];
  objc_msgSend(v3, "appendFormat:", @"[_recognizerScore = %f]", self->_recognizerScore);
  objc_msgSend(v3, "appendFormat:", @"[_isSecondChance = %i]", self->_isSecondChance);
  objc_msgSend(v3, "appendFormat:", @"[_isSecondChanceCandidate = %i]", self->_isSecondChanceCandidate);
  objc_msgSend(v3, "appendFormat:", @"[_isRunningQuasar = %i]", self->_isRunningQuasar);
  return v3;
}

- (CSSinglePhraseResult)initWithPhId:(unint64_t)a3 keywordDetectorDecision:(unint64_t)a4 combinedScore:(float)a5 ndapiScore:(float)a6 ndapiResult:(id)a7 recognizerScore:(float)a8 isSecondChance:(BOOL)a9 isSecondChanceCandidate:(BOOL)a10 isRunningQuasar:(BOOL)a11
{
  id v21 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CSSinglePhraseResult;
  v22 = [(CSSinglePhraseResult *)&v25 init];
  v23 = v22;
  if (v22)
  {
    v22->_unint64_t phId = a3;
    v22->_unint64_t decision = a4;
    v22->_float combinedScore = a5;
    v22->_float ndapiScore = a6;
    objc_storeStrong((id *)&v22->_ndapiResult, a7);
    v23->_recognizerScore = a8;
    v23->_isSecondChance = a9;
    v23->_isSecondChanceCandidate = a10;
    v23->_isRunningQuasar = a11;
  }

  return v23;
}

@end