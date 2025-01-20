@interface SBContinuousExposeModuleController
- (BOOL)hideDock;
- (BOOL)hideStrip;
- (BOOL)isContinuousExposeEnabled;
- (BOOL)isContinuousExposeEverEnabled;
- (id)_defaults;
- (void)setContinuousExposeEnabled:(BOOL)a3;
- (void)setHideDock:(BOOL)a3;
- (void)setHideStrip:(BOOL)a3;
@end

@implementation SBContinuousExposeModuleController

- (id)_defaults
{
  return +[NSUserDefaults standardUserDefaults];
}

- (BOOL)isContinuousExposeEnabled
{
  v2 = [(SBContinuousExposeModuleController *)self _defaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SBChamoisWindowingEnabled"];

  return v3;
}

- (BOOL)isContinuousExposeEverEnabled
{
  v2 = [(SBContinuousExposeModuleController *)self _defaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SBChamoisWindowingEverEnabled"];

  return v3;
}

- (void)setContinuousExposeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(SBContinuousExposeModuleController *)self isContinuousExposeEverEnabled])
  {
    v5 = [(SBContinuousExposeModuleController *)self _defaults];
    CFStringRef v6 = @"SBChamoisWindowingEverEnabled";
    id v8 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    v5 = [(SBContinuousExposeModuleController *)self _defaults];
    CFStringRef v6 = @"SBChamoisWindowingEnabled";
    id v8 = v5;
    uint64_t v7 = v3;
  }
  [v5 setBool:v7 forKey:v6];
}

- (BOOL)hideStrip
{
  v2 = [(SBContinuousExposeModuleController *)self _defaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SBChamoisHideStrips"];

  return v3;
}

- (void)setHideStrip:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBContinuousExposeModuleController *)self _defaults];
  [v4 setBool:v3 forKey:@"SBChamoisHideStrips"];
}

- (BOOL)hideDock
{
  v2 = [(SBContinuousExposeModuleController *)self _defaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SBChamoisHideDock"];

  return v3;
}

- (void)setHideDock:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBContinuousExposeModuleController *)self _defaults];
  [v4 setBool:v3 forKey:@"SBChamoisHideDock"];
}

@end