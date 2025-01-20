@interface MTRChannelClusterSeriesInfoStruct
- (MTRChannelClusterSeriesInfoStruct)init;
- (NSString)episode;
- (NSString)season;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEpisode:(id)a3;
- (void)setSeason:(id)a3;
@end

@implementation MTRChannelClusterSeriesInfoStruct

- (MTRChannelClusterSeriesInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterSeriesInfoStruct;
  v2 = [(MTRChannelClusterSeriesInfoStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    season = v2->_season;
    v2->_season = (NSString *)&stru_26F969DC8;

    episode = v3->_episode;
    v3->_episode = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterSeriesInfoStruct);
  objc_super v7 = objc_msgSend_season(self, v5, v6);
  objc_msgSend_setSeason_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_episode(self, v9, v10);
  objc_msgSend_setEpisode_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: season:%@; episode:%@; >",
    v5,
    self->_season,
  objc_super v7 = self->_episode);

  return v7;
}

- (NSString)season
{
  return self->_season;
}

- (void)setSeason:(id)a3
{
}

- (NSString)episode
{
  return self->_episode;
}

- (void)setEpisode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episode, 0);

  objc_storeStrong((id *)&self->_season, 0);
}

@end