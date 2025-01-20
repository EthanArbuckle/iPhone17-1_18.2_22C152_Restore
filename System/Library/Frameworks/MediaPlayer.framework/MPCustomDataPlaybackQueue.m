@interface MPCustomDataPlaybackQueue
+ (BOOL)supportsSecureCoding;
- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4;
- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4 options:(id)a5;
- (NSData)data;
- (NSString)identifier;
- (id)description;
@end

@implementation MPCustomDataPlaybackQueue

- (NSData)data
{
  [(MPRemotePlaybackQueue *)self _mediaRemotePlaybackQueue];
  v2 = (void *)MRSystemAppPlaybackQueueCopyCustomData();

  return (NSData *)v2;
}

- (NSString)identifier
{
  [(MPRemotePlaybackQueue *)self _mediaRemotePlaybackQueue];
  v2 = (void *)MRSystemAppPlaybackQueueCopyCustomDataIdentifier();

  return (NSString *)v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPCustomDataPlaybackQueue *)self identifier];
  v6 = [(MPCustomDataPlaybackQueue *)self data];
  v7 = [v3 stringWithFormat:@"<%@:%p identifier=%@ dataLength=%lu>", v4, self, v5, objc_msgSend(v6, "length")];

  return v7;
}

- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  MRSystemAppPlaybackQueueSetCustomData();
  v12 = [(MPRemotePlaybackQueue *)self initWithMediaRemotePlaybackQueue:v11 options:v8];

  return v12;
}

- (MPCustomDataPlaybackQueue)initWithIdentifier:(id)a3 data:(id)a4
{
  return [(MPCustomDataPlaybackQueue *)self initWithIdentifier:a3 data:a4 options:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end