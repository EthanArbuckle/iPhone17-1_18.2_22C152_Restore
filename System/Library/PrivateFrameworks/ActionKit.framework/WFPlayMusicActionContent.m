@interface WFPlayMusicActionContent
- (MPMediaItemCollection)mediaCollection;
- (MPPlaybackArchive)playbackArchive;
- (NSArray)storeIDs;
- (WFPlayMusicActionContent)initWithMediaCollection:(id)a3;
- (WFPlayMusicActionContent)initWithPlaybackArchive:(id)a3;
- (WFPlayMusicActionContent)initWithStoreIDs:(id)a3;
- (id)contentDestinationWithError:(id *)a3;
- (void)setMediaCollection:(id)a3;
- (void)setPlaybackArchive:(id)a3;
- (void)setStoreIDs:(id)a3;
@end

@implementation WFPlayMusicActionContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaCollection, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
}

- (void)setPlaybackArchive:(id)a3
{
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setMediaCollection:(id)a3
{
}

- (MPMediaItemCollection)mediaCollection
{
  return self->_mediaCollection;
}

- (void)setStoreIDs:(id)a3
{
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (WFPlayMusicActionContent)initWithPlaybackArchive:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  v6 = [(WFPlayMusicActionContent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackArchive, a3);
    v8 = v7;
  }

  return v7;
}

- (WFPlayMusicActionContent)initWithMediaCollection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  v6 = [(WFPlayMusicActionContent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaCollection, a3);
    v8 = v7;
  }

  return v7;
}

- (WFPlayMusicActionContent)initWithStoreIDs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  id v5 = [(WFPlayMusicActionContent *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

@end