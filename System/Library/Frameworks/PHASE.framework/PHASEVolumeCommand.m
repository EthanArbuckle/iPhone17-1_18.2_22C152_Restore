@interface PHASEVolumeCommand
- (id)initInternal;
@end

@implementation PHASEVolumeCommand

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEVolumeCommand;
  return [(PHASEVolumeCommand *)&v3 init];
}

@end