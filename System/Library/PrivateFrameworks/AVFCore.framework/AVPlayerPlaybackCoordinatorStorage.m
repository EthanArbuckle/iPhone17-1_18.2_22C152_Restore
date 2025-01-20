@interface AVPlayerPlaybackCoordinatorStorage
- (AVPlayerPlaybackCoordinatorStorage)init;
- (void)dealloc;
@end

@implementation AVPlayerPlaybackCoordinatorStorage

- (AVPlayerPlaybackCoordinatorStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerPlaybackCoordinatorStorage;
  v2 = [(AVPlayerPlaybackCoordinatorStorage *)&v5 init];
  if (v2)
  {
    v2->rwQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.playerplaybackcoordinator.storage");
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->coordinationMediumDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)dealloc
{
  rwQueue = self->rwQueue;
  if (rwQueue) {
    dispatch_release(rwQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerPlaybackCoordinatorStorage;
  [(AVPlayerPlaybackCoordinatorStorage *)&v4 dealloc];
}

@end