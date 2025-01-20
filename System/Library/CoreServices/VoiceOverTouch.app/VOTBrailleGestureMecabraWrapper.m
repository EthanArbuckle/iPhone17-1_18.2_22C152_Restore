@interface VOTBrailleGestureMecabraWrapper
- (BOOL)_moveToNextRawCandidate;
- (BOOL)moveToNextCandidate;
- (VOTBrailleGestureMecabraWrapper)initWithLanguage:(id)a3;
- (id)currentCandidateAnalysisString;
- (id)currentCandidateSurfaceString;
- (void)anlayzeString:(id)a3;
- (void)dealloc;
- (void)didSelectCandidateWithSurfaceString:(id)a3;
@end

@implementation VOTBrailleGestureMecabraWrapper

- (VOTBrailleGestureMecabraWrapper)initWithLanguage:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VOTBrailleGestureMecabraWrapper;
  v3 = [(VOTBrailleGestureMecabraWrapper *)&v14 init];
  if (v3)
  {
    v4 = NSHomeDirectory();
    v5 = [v4 stringByAppendingPathComponent:@"/Library/Accessibility/brailleLearningDict_ja"];

    v6 = +[NSFileManager defaultManager];
    unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

    if ((v7 & 1) == 0)
    {
      v8 = +[NSFileManager defaultManager];
      [v8 createDirectoryAtPath:v5 withIntermediateDirectories:0 attributes:0 error:0];
    }
    +[NSURL fileURLWithPath:v5];
    v3->_mecabra = (__Mecabra *)MecabraCreateWithOptions();
    v3->_context = (__MecabraContext *)MecabraContextCreateMutable();
    uint64_t v9 = objc_opt_new();
    candidateRefForSurface = v3->_candidateRefForSurface;
    v3->_candidateRefForSurface = (NSMutableDictionary *)v9;

    v3->_reachedEnd = v3->_mecabra == 0;
    currentAnalysis = v3->_currentAnalysis;
    v3->_currentAnalysis = (NSString *)&stru_1001B7888;

    currentSurface = v3->_currentSurface;
    v3->_currentSurface = (NSString *)&stru_1001B7888;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_mecabra) {
    MecabraRelease();
  }
  if (self->_context) {
    MecabraContextRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)VOTBrailleGestureMecabraWrapper;
  [(VOTBrailleGestureMecabraWrapper *)&v3 dealloc];
}

- (void)anlayzeString:(id)a3
{
  id v5 = a3;
  if (self->_mecabra)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_string, a3);
    v6 = (NSMutableDictionary *)objc_opt_new();
    candidateRefForSurface = self->_candidateRefForSurface;
    self->_candidateRefForSurface = v6;

    self->_reachedEnd = 0;
    objc_storeStrong((id *)&self->_currentAnalysis, a3);
    objc_storeStrong((id *)&self->_currentSurface, a3);
    MecabraAnalyzeStringWithContext();
    id v5 = v8;
  }
}

- (BOOL)moveToNextCandidate
{
  while (1)
  {
    [(VOTBrailleGestureMecabraWrapper *)self _moveToNextRawCandidate];
    if (self->_reachedEnd) {
      break;
    }
    objc_super v3 = [(NSString *)self->_string length];
    if (v3 == (void *)[(NSString *)self->_currentAnalysis length]) {
      return !self->_reachedEnd;
    }
  }
  return 0;
}

- (BOOL)_moveToNextRawCandidate
{
  if (self->_reachedEnd)
  {
    LOBYTE(NextCandidate) = 0;
  }
  else
  {
    uint64_t NextCandidate = MecabraGetNextCandidate();
    if (NextCandidate)
    {
      uint64_t v4 = NextCandidate;
      MecabraCandidateGetAnalysisString();
      id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentAnalysis = self->_currentAnalysis;
      self->_currentAnalysis = v5;

      MecabraCandidateGetSurface();
      unsigned __int8 v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentSurface = self->_currentSurface;
      self->_currentSurface = v7;

      [(NSMutableDictionary *)self->_candidateRefForSurface setObject:v4 forKeyedSubscript:self->_currentSurface];
      LOBYTE(NextCandidate) = 1;
    }
    else
    {
      self->_reachedEnd = 1;
    }
  }
  return NextCandidate;
}

- (id)currentCandidateAnalysisString
{
  return self->_currentAnalysis;
}

- (id)currentCandidateSurfaceString
{
  return self->_currentSurface;
}

- (void)didSelectCandidateWithSurfaceString:(id)a3
{
  if ([(NSMutableDictionary *)self->_candidateRefForSurface objectForKey:a3]) {
    MecabraContextAddInlineCandidate();
  }
  mecabra = self->_mecabra;
  context = self->_context;

  _MecabraAcceptInlineCandidates(mecabra, context);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSurface, 0);
  objc_storeStrong((id *)&self->_currentAnalysis, 0);
  objc_storeStrong((id *)&self->_candidateRefForSurface, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end