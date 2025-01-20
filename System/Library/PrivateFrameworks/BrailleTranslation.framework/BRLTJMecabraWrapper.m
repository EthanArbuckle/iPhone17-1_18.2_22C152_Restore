@interface BRLTJMecabraWrapper
- (BOOL)moveToNextCandidate;
- (BRLTJMecabraWrapper)init;
- (BRLTJMecabraWrapper)initWithUnitTesting:(BOOL)a3;
- (id)getCurrentCandidateAnalysisString;
- (id)getCurrentCandidateSurface;
- (void)analyzeString:(id)a3;
- (void)dealloc;
- (void)learnCandidate:(id)a3;
@end

@implementation BRLTJMecabraWrapper

- (BRLTJMecabraWrapper)initWithUnitTesting:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BRLTJMecabraWrapper;
  v4 = [(BRLTJMecabraWrapper *)&v15 init];
  if (v4)
  {
    v5 = NSHomeDirectory();
    v6 = [v5 stringByAppendingPathComponent:@"/Library/Accessibility/brailleLearningDict_ja"];

    v7 = [MEMORY[0x263F08850] defaultManager];
    char v8 = [v7 fileExistsAtPath:v6];

    if ((v8 & 1) == 0)
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      [v9 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:0 error:0];
    }
    if (!a3) {
      [NSURL fileURLWithPath:v6];
    }
    v4->_mecabra = (__Mecabra *)MecabraCreateWithOptions();
    v4->_context = (__MecabraContext *)MecabraContextCreateMutable();
    uint64_t v10 = objc_opt_new();
    candidateRefForSurface = v4->_candidateRefForSurface;
    v4->_candidateRefForSurface = (NSMutableDictionary *)v10;

    v4->_reachedEnd = v4->_mecabra == 0;
    currentAnalysis = v4->_currentAnalysis;
    v4->_currentAnalysis = (NSString *)&stru_26CCBD108;

    currentSurface = v4->_currentSurface;
    v4->_currentSurface = (NSString *)&stru_26CCBD108;
  }
  return v4;
}

- (BRLTJMecabraWrapper)init
{
  return [(BRLTJMecabraWrapper *)self initWithUnitTesting:0];
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
  v3.super_class = (Class)BRLTJMecabraWrapper;
  [(BRLTJMecabraWrapper *)&v3 dealloc];
}

- (void)analyzeString:(id)a3
{
  id v5 = a3;
  if (self->_mecabra)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_string, a3);
    MecabraAnalyzeStringWithContext();
    id v5 = v6;
  }
}

- (BOOL)moveToNextCandidate
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
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
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

- (void)learnCandidate:(id)a3
{
  if ([(NSMutableDictionary *)self->_candidateRefForSurface objectForKey:a3]) {
    MecabraContextAddInlineCandidate();
  }
  mecabra = self->_mecabra;
  context = self->_context;
  MEMORY[0x270F99CE0](mecabra, context);
}

- (id)getCurrentCandidateAnalysisString
{
  return self->_currentAnalysis;
}

- (id)getCurrentCandidateSurface
{
  return self->_currentSurface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSurface, 0);
  objc_storeStrong((id *)&self->_currentAnalysis, 0);
  objc_storeStrong((id *)&self->_candidateRefForSurface, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end