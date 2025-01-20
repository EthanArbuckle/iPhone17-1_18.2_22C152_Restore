@interface PatternPlayerBase
- (BOOL)needsResetForAction:(unsigned __int8)a3;
- (CHHapticEngine)engine;
- (NSString)patternID;
- (double)patternDuration;
- (void)setEngine:(id)a3;
@end

@implementation PatternPlayerBase

- (NSString)patternID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)needsResetForAction:(unsigned __int8)a3
{
  int previousAction = self->_previousAction;
  self->_int previousAction = a3;
  if (previousAction == 2) {
    return a3 == 2;
  }
  else {
    return previousAction != 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternID, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (CHHapticEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (CHHapticEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (double)patternDuration
{
  return self->_patternDuration;
}

@end