@interface IREligibilitySettings
- (BOOL)useBrokeredScanForMain;
- (BOOL)useBrokeredScanForSecondary;
- (NSNumber)downrankToNoneThr;
- (NSNumber)downrankToNoneWithIgnoringThr;
- (NSNumber)downrankToOneTapThr;
- (NSNumber)initialStateIsOneTap;
- (NSNumber)upRankToOneTapThr;
- (NSNumber)uprankToAutorouteThr;
- (void)setDownrankToNoneThr:(id)a3;
- (void)setDownrankToNoneWithIgnoringThr:(id)a3;
- (void)setDownrankToOneTapThr:(id)a3;
- (void)setInitialStateIsOneTap:(id)a3;
- (void)setUpRankToOneTapThr:(id)a3;
- (void)setUprankToAutorouteThr:(id)a3;
- (void)setUseBrokeredScanForMain:(BOOL)a3;
- (void)setUseBrokeredScanForSecondary:(BOOL)a3;
@end

@implementation IREligibilitySettings

- (NSNumber)upRankToOneTapThr
{
  return self->_upRankToOneTapThr;
}

- (void)setUpRankToOneTapThr:(id)a3
{
}

- (NSNumber)uprankToAutorouteThr
{
  return self->_uprankToAutorouteThr;
}

- (void)setUprankToAutorouteThr:(id)a3
{
}

- (NSNumber)downrankToNoneThr
{
  return self->_downrankToNoneThr;
}

- (void)setDownrankToNoneThr:(id)a3
{
}

- (NSNumber)downrankToNoneWithIgnoringThr
{
  return self->_downrankToNoneWithIgnoringThr;
}

- (void)setDownrankToNoneWithIgnoringThr:(id)a3
{
}

- (NSNumber)downrankToOneTapThr
{
  return self->_downrankToOneTapThr;
}

- (void)setDownrankToOneTapThr:(id)a3
{
}

- (NSNumber)initialStateIsOneTap
{
  return self->_initialStateIsOneTap;
}

- (void)setInitialStateIsOneTap:(id)a3
{
}

- (BOOL)useBrokeredScanForMain
{
  return self->_useBrokeredScanForMain;
}

- (void)setUseBrokeredScanForMain:(BOOL)a3
{
  self->_useBrokeredScanForMain = a3;
}

- (BOOL)useBrokeredScanForSecondary
{
  return self->_useBrokeredScanForSecondary;
}

- (void)setUseBrokeredScanForSecondary:(BOOL)a3
{
  self->_useBrokeredScanForSecondary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStateIsOneTap, 0);
  objc_storeStrong((id *)&self->_downrankToOneTapThr, 0);
  objc_storeStrong((id *)&self->_downrankToNoneWithIgnoringThr, 0);
  objc_storeStrong((id *)&self->_downrankToNoneThr, 0);
  objc_storeStrong((id *)&self->_uprankToAutorouteThr, 0);

  objc_storeStrong((id *)&self->_upRankToOneTapThr, 0);
}

@end