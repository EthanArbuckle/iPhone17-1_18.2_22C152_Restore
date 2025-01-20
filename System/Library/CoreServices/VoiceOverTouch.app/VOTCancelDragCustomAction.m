@interface VOTCancelDragCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (VOTCancelDragCustomAction)init;
- (id)name;
- (unint64_t)hash;
@end

@implementation VOTCancelDragCustomAction

- (VOTCancelDragCustomAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTCancelDragCustomAction;
  return [(VOTCancelDragCustomAction *)&v3 init];
}

- (id)name
{
  return sub_100051804(off_1001EA9E8, @"cancel.drag", 0);
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return 0;
}

- (BOOL)isValidForContext:(id)a3
{
  return [a3 dragSessionActive];
}

- (BOOL)performWithContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 dragSessionActive];
  if (v4) {
    [v3 cancelDrag];
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