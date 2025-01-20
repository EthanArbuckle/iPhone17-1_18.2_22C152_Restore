@interface CAMSharedLibraryStatusIndicator
- (BOOL)shouldFillOutlineForCurrentState;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForCurrentState;
- (int64_t)sharedLibraryMode;
- (unint64_t)customPointSizeForImageSymbol;
- (void)setSharedLibraryMode:(int64_t)a3;
- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMSharedLibraryStatusIndicator

- (void)setSharedLibraryMode:(int64_t)a3
{
}

- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (BOOL)shouldShowSlashForCurrentState
{
  return CAMSharedLibraryModeIsOn([(CAMSharedLibraryStatusIndicator *)self sharedLibraryMode]) ^ 1;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  unint64_t v2 = [(CAMSharedLibraryStatusIndicator *)self sharedLibraryMode];
  return CAMSharedLibraryModeIsOn(v2);
}

- (BOOL)shouldFillOutlineForCurrentState
{
  unint64_t v2 = [(CAMSharedLibraryStatusIndicator *)self sharedLibraryMode];
  return CAMSharedLibraryModeIsOn(v2);
}

- (id)imageNameForCurrentState
{
  return @"person.2.fill";
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (unint64_t)customPointSizeForImageSymbol
{
  return 13;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end