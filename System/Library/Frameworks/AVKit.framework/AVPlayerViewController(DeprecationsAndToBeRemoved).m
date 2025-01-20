@interface AVPlayerViewController(DeprecationsAndToBeRemoved)
- (void)setDefaultPlaybackRate:()DeprecationsAndToBeRemoved;
@end

@implementation AVPlayerViewController(DeprecationsAndToBeRemoved)

- (void)setDefaultPlaybackRate:()DeprecationsAndToBeRemoved
{
  id v4 = [(AVPlayerViewController *)self playerController];
  [v4 setDefaultPlaybackRate:a3];
}

@end