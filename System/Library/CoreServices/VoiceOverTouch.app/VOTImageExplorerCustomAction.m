@interface VOTImageExplorerCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (VOTImageExplorerCustomAction)init;
- (id)name;
- (unint64_t)hash;
@end

@implementation VOTImageExplorerCustomAction

- (VOTImageExplorerCustomAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTImageExplorerCustomAction;
  return [(VOTImageExplorerCustomAction *)&v3 init];
}

- (id)name
{
  return sub_100051804(off_1001EA9E8, @"explore.image.features", 0);
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return 0;
}

- (BOOL)isValidForContext:(id)a3
{
  return [a3 isValidElementForImageExploration];
}

- (BOOL)performWithContext:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isValidElementForImageExploration];
  v5 = VOTLogImageExplorer();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      sub_10011DB68();
    }

    [v3 handleLaunchVoiceOverImageExplorer];
  }
  else
  {
    if (v6) {
      sub_10011DBFC();
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return (unint64_t)[v2 hash];
}

@end