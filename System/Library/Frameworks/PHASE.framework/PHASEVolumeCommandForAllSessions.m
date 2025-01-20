@interface PHASEVolumeCommandForAllSessions
+ (id)new;
- (PHASEVolumeCommandForAllSessions)init;
- (id)description;
@end

@implementation PHASEVolumeCommandForAllSessions

- (PHASEVolumeCommandForAllSessions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEVolumeCommandForAllSessions;
  return (PHASEVolumeCommandForAllSessions *)[(PHASEVolumeCommand *)&v3 initInternal];
}

+ (id)new
{
  return objc_alloc_init(PHASEVolumeCommandForAllSessions);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"VolumeCommandForAllSessions"];
}

@end