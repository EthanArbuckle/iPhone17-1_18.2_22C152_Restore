@interface AVMutableMovieInternal
@end

@implementation AVMutableMovieInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->makeTracksArrayOnce, 0);
  objc_storeStrong((id *)&self->tracks, 0);
  objc_storeStrong((id *)&self->metadataWaitingSemaphore, 0);
  objc_storeStrong((id *)&self->trackWaitingSemaphore, 0);
  objc_storeStrong((id *)&self->initializationOptions, 0);
  objc_storeStrong((id *)&self->data, 0);
  objc_storeStrong((id *)&self->URL, 0);
}

@end