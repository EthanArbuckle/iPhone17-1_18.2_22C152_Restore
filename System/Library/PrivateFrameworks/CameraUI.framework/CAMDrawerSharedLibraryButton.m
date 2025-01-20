@interface CAMDrawerSharedLibraryButton
- (BOOL)isMenuItemSelected:(id)a3;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)controlType;
- (int64_t)sharedLibraryMode;
- (void)didSelectMenuItem:(id)a3;
- (void)setSharedLibraryMode:(int64_t)a3;
- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerSharedLibraryButton

- (int64_t)controlType
{
  return 14;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
}

- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    [(CAMControlDrawerButton *)self updateImageAnimated:a4];
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  v4 = [a3 value];
  char v5 = CAMSharedLibraryModeIsOn([v4 integerValue]);
  LOBYTE(self) = v5 ^ CAMSharedLibraryModeIsOn([(CAMDrawerSharedLibraryButton *)self sharedLibraryMode]) ^ 1;

  return (char)self;
}

- (id)loadMenuItems
{
  v2 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v3 = [CAMControlDrawerMenuItem alloc];
  v4 = CAMLocalizedFrameworkString(@"SHARED", 0);
  char v5 = [(CAMControlDrawerMenuItem *)v3 initWithTitle:v4 value:&unk_26BDDE880];

  [v2 addObject:v5];
  v6 = [CAMControlDrawerMenuItem alloc];
  v7 = CAMLocalizedFrameworkString(@"PERSONAL", 0);
  v8 = [(CAMControlDrawerMenuItem *)v6 initWithTitle:v7 value:&unk_26BDDE8C8];

  [v2 addObject:v8];
  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerSharedLibraryButton *)self sharedLibraryMode];
  v6 = [v4 value];

  uint64_t v7 = [v6 integerValue];
  if (v5 != v7)
  {
    [(CAMDrawerSharedLibraryButton *)self setSharedLibraryMode:v7 animated:1];
    [(CAMDrawerSharedLibraryButton *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  unint64_t v2 = [(CAMDrawerSharedLibraryButton *)self sharedLibraryMode];
  return CAMSharedLibraryModeIsOn(v2);
}

- (id)imageNameForCurrentState
{
  return @"person.2.fill";
}

- (BOOL)shouldShowSlashForCurrentState
{
  return CAMSharedLibraryModeIsOn([(CAMDrawerSharedLibraryButton *)self sharedLibraryMode]) ^ 1;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end