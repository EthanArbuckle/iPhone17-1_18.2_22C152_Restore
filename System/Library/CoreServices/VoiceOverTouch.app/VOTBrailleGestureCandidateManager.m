@interface VOTBrailleGestureCandidateManager
- (BOOL)hasNextCandidate;
- (BOOL)hasPreviousCandidate;
- (BOOL)isActive;
- (NSString)currentCandidateAnalysisString;
- (NSString)currentCandidateSurfaceString;
- (VOTBrailleGestureCandidateManager)init;
- (void)analyzeString:(id)a3 language:(id)a4;
- (void)deactivate;
- (void)didSelectCurrentCandidate;
- (void)moveToNextCandidate;
- (void)moveToPreviousCandidate;
@end

@implementation VOTBrailleGestureCandidateManager

- (VOTBrailleGestureCandidateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VOTBrailleGestureCandidateManager;
  v2 = [(VOTBrailleGestureCandidateManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_isActive = 0;
    v4 = v2;
  }

  return v3;
}

- (void)analyzeString:(id)a3 language:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = v6;
  self->_isActive = 1;
  if (!self->_mecabra || !self->_language || (objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    v8 = [[VOTBrailleGestureMecabraWrapper alloc] initWithLanguage:v7];
    mecabra = self->_mecabra;
    self->_mecabra = v8;

    objc_storeStrong((id *)&self->_language, a4);
  }
  [(VOTBrailleGestureMecabraWrapper *)self->_mecabra anlayzeString:v19];
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  analyzeStrings = self->_analyzeStrings;
  self->_analyzeStrings = v10;

  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  surfaceStrings = self->_surfaceStrings;
  self->_surfaceStrings = v12;

  unsigned int v14 = [(VOTBrailleGestureMecabraWrapper *)self->_mecabra moveToNextCandidate];
  v15 = self->_analyzeStrings;
  if (v14)
  {
    v16 = [(VOTBrailleGestureMecabraWrapper *)self->_mecabra currentCandidateAnalysisString];
    [(NSMutableArray *)v15 addObject:v16];

    v17 = self->_surfaceStrings;
    v18 = [(VOTBrailleGestureMecabraWrapper *)self->_mecabra currentCandidateSurfaceString];
    [(NSMutableArray *)v17 addObject:v18];
  }
  else
  {
    [(NSMutableArray *)self->_analyzeStrings addObject:v19];
    [(NSMutableArray *)self->_surfaceStrings addObject:&stru_1001B7888];
  }
  self->_currentIndex = 0;
}

- (void)deactivate
{
  self->_isActive = 0;
  analyzeStrings = self->_analyzeStrings;
  self->_analyzeStrings = 0;

  surfaceStrings = self->_surfaceStrings;
  self->_surfaceStrings = 0;

  self->_currentIndex = 0;
}

- (BOOL)hasNextCandidate
{
  if (self->_isActive)
  {
    currentIndex = (unsigned char *)self->_currentIndex;
    if (currentIndex != (char *)[(NSMutableArray *)self->_analyzeStrings count] - 1) {
      return 1;
    }
    if ([(VOTBrailleGestureMecabraWrapper *)self->_mecabra moveToNextCandidate])
    {
      analyzeStrings = self->_analyzeStrings;
      v5 = [(VOTBrailleGestureMecabraWrapper *)self->_mecabra currentCandidateAnalysisString];
      [(NSMutableArray *)analyzeStrings addObject:v5];

      surfaceStrings = self->_surfaceStrings;
      v7 = [(VOTBrailleGestureMecabraWrapper *)self->_mecabra currentCandidateSurfaceString];
      [(NSMutableArray *)surfaceStrings addObject:v7];

      return 1;
    }
    v9 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Candidate Manager: no more candidates", v10, 2u);
    }
  }
  return 0;
}

- (BOOL)hasPreviousCandidate
{
  return self->_isActive && self->_currentIndex > 0;
}

- (void)moveToNextCandidate
{
  if (self->_isActive)
  {
    if ([(VOTBrailleGestureCandidateManager *)self hasNextCandidate]) {
      ++self->_currentIndex;
    }
  }
}

- (void)moveToPreviousCandidate
{
  if (self->_isActive)
  {
    if ([(VOTBrailleGestureCandidateManager *)self hasPreviousCandidate]) {
      --self->_currentIndex;
    }
  }
}

- (NSString)currentCandidateAnalysisString
{
  if (self->_isActive)
  {
    v2 = [(NSMutableArray *)self->_analyzeStrings objectAtIndex:self->_currentIndex];
  }
  else
  {
    v2 = &stru_1001B7888;
  }

  return (NSString *)v2;
}

- (NSString)currentCandidateSurfaceString
{
  if (self->_isActive)
  {
    v2 = [(NSMutableArray *)self->_surfaceStrings objectAtIndex:self->_currentIndex];
  }
  else
  {
    v2 = &stru_1001B7888;
  }

  return (NSString *)v2;
}

- (void)didSelectCurrentCandidate
{
  if (self->_isActive)
  {
    mecabra = self->_mecabra;
    id v3 = [(VOTBrailleGestureCandidateManager *)self currentCandidateSurfaceString];
    [(VOTBrailleGestureMecabraWrapper *)mecabra didSelectCandidateWithSurfaceString:v3];
  }
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfaceStrings, 0);
  objc_storeStrong((id *)&self->_analyzeStrings, 0);
  objc_storeStrong((id *)&self->_mecabra, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end