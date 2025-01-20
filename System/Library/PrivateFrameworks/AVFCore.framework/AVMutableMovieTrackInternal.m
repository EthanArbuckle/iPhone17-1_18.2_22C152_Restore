@interface AVMutableMovieTrackInternal
@end

@implementation AVMutableMovieTrackInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->figAssetTrackNotificationListenerWeakReference, 0);
  objc_storeStrong((id *)&self->metadataWaitingSemaphore, 0);
}

@end