@interface AVMovieInternal
@end

@implementation AVMovieInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->makeTracksArrayOnce, 0);
  objc_storeStrong((id *)&self->tracks, 0);
  objc_storeStrong((id *)&self->initializationOptions, 0);
  objc_storeStrong((id *)&self->data, 0);
  objc_storeStrong((id *)&self->URL, 0);
  objc_storeStrong((id *)&self->loader, 0);
}

@end