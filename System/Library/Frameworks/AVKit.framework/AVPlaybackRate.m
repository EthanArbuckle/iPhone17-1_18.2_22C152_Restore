@interface AVPlaybackRate
- (AVPlaybackRate)initWithRate:(double)a3 localizedName:(id)a4 compactLocalizedName:(id)a5;
@end

@implementation AVPlaybackRate

- (AVPlaybackRate)initWithRate:(double)a3 localizedName:(id)a4 compactLocalizedName:(id)a5
{
  *(float *)&a3 = a3;
  return -[AVPlaybackSpeed initWithRate:localizedName:](self, "initWithRate:localizedName:", a4, a5, a3);
}

@end