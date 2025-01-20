@interface SHLMutableLibraryTrack
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHLMutableLibraryTrack

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[SHLLibraryTrack allocWithZone:a3];

  return [(SHLLibraryTrack *)v4 initWithLibraryTrack:self];
}

@end