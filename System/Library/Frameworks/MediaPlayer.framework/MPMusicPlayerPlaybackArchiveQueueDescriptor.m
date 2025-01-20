@interface MPMusicPlayerPlaybackArchiveQueueDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithCoder:(id)a3;
- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithPlaybackArchive:(id)a3;
- (MPPlaybackArchive)playbackArchive;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerPlaybackArchiveQueueDescriptor

- (void).cxx_destruct
{
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (BOOL)isEmpty
{
  return self->_playbackArchive == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  v4 = [(MPMusicPlayerQueueDescriptor *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 11, self->_playbackArchive);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  id v4 = a3;
  [(MPMusicPlayerQueueDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackArchive, @"playbackArchive", v5.receiver, v5.super_class);
}

- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackArchive"];
    playbackArchive = v5->_playbackArchive;
    v5->_playbackArchive = (MPPlaybackArchive *)v6;
  }
  return v5;
}

- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithPlaybackArchive:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playbackArchive = v5->_playbackArchive;
    v5->_playbackArchive = (MPPlaybackArchive *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end