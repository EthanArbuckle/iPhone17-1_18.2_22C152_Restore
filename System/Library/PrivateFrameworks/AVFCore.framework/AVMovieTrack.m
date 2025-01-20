@interface AVMovieTrack
+ (BOOL)expectsPropertyRevisedNotifications;
- (AVMediaDataStorage)mediaDataStorage;
- (CMTimeRange)mediaDecodeTimeRange;
- (CMTimeRange)mediaPresentationTimeRange;
- (NSInteger)alternateGroupID;
- (id)description;
@end

@implementation AVMovieTrack

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

- (AVMediaDataStorage)mediaDataStorage
{
  return 0;
}

- (CMTimeRange)mediaPresentationTimeRange
{
  v4.receiver = self;
  v4.super_class = (Class)AVMovieTrack;
  return (CMTimeRange *)[(CMTimeRange *)&v4 mediaPresentationTimeRange];
}

- (CMTimeRange)mediaDecodeTimeRange
{
  v4.receiver = self;
  v4.super_class = (Class)AVMovieTrack;
  return (CMTimeRange *)[(CMTimeRange *)&v4 mediaDecodeTimeRange];
}

- (NSInteger)alternateGroupID
{
  v3.receiver = self;
  v3.super_class = (Class)AVMovieTrack;
  return [(AVAssetTrack *)&v3 alternateGroupID];
}

- (id)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(AVAssetTrack *)self trackID];
  v7 = [(AVAssetTrack *)self mediaType];
  v8 = [v3 stringWithFormat:@"<%@: %p, trackID = %d, mediaType = %@>", v5, self, v6, v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end