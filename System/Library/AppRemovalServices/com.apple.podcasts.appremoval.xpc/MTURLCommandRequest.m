@interface MTURLCommandRequest
- (MTURLCommandRequest)initWithURLString:(id)a3;
- (NSString)episodeAdamId;
- (NSString)episodeUuid;
- (NSString)podcastAdamId;
- (NSString)podcastFeedUrl;
- (NSString)podcastUuid;
- (NSString)requesterDsid;
- (NSString)stationUuid;
- (NSString)urlString;
- (id)copyWithPlayReason:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)playContext;
- (int64_t)playContextSortType;
- (int64_t)playbackOrder;
- (unint64_t)commandType;
- (unint64_t)playQueueType;
- (unint64_t)playReason;
- (void)_loadQueryParameterValuesFromString:(id)a3;
@end

@implementation MTURLCommandRequest

- (MTURLCommandRequest)initWithURLString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLCommandRequest;
  v6 = [(MTURLCommandRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_urlString, a3);
    [(MTURLCommandRequest *)v7 _loadQueryParameterValuesFromString:v5];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  id v5 = [(NSString *)self->_urlString copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = self->_commandType;
  v4[3] = self->_playQueueType;
  v4[4] = self->_playReason;
  v4[5] = self->_playbackOrder;
  v4[6] = self->_playContext;
  v4[7] = self->_playContextSortType;
  id v7 = [(NSString *)self->_podcastUuid copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  id v9 = [(NSString *)self->_podcastFeedUrl copy];
  v10 = (void *)v4[9];
  v4[9] = v9;

  id v11 = [(NSString *)self->_episodeUuid copy];
  v12 = (void *)v4[10];
  v4[10] = v11;

  id v13 = [(NSString *)self->_podcastAdamId copy];
  v14 = (void *)v4[11];
  v4[11] = v13;

  id v15 = [(NSString *)self->_episodeAdamId copy];
  v16 = (void *)v4[12];
  v4[12] = v15;

  id v17 = [(NSString *)self->_stationUuid copy];
  v18 = (void *)v4[13];
  v4[13] = v17;

  id v19 = [(NSString *)self->_requesterDsid copy];
  v20 = (void *)v4[14];
  v4[14] = v19;

  return v4;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  id result = [(MTURLCommandRequest *)self copy];
  *((void *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  id v42 = a3;
  v4 = +[NSURL URLWithString:v42];
  id v5 = [v4 query];
  v6 = +[MTPlaybackIdentifierUtil __queryStringToQueryDictionary:v5];

  id v7 = +[MTPlaybackIdentifierUtil sharedInstance];
  unsigned __int8 v8 = [v7 isSubscribeCommandURLString:v42];

  if (v8)
  {
    unint64_t v9 = 1;
  }
  else
  {
    v10 = +[MTPlaybackIdentifierUtil sharedInstance];
    unsigned __int8 v11 = [v10 isLocalSetPlaybackQueueURLString:v42];

    if (v11)
    {
      unint64_t v9 = 2;
    }
    else
    {
      v12 = +[MTPlaybackIdentifierUtil sharedInstance];
      unsigned int v13 = [v12 isUniversalPlaybackIdentifierURLString:v42];

      if (!v13) {
        goto LABEL_8;
      }
      unint64_t v9 = 3;
    }
  }
  self->_commandType = v9;
LABEL_8:
  v14 = +[MTPlaybackIdentifierUtil sharedInstance];
  self->_unint64_t playQueueType = (unint64_t)[v14 _playQueueTypeForRequestURL:v4];

  id v15 = +[MTPlaybackIdentifierUtil sharedInstance];
  v16 = [v6 objectForKeyedSubscript:@"playbackOrder"];
  self->_playbackOrder = (int64_t)[v15 _episodeOrderFromString:v16];

  id v17 = +[MTPlaybackIdentifierUtil sharedInstance];
  v18 = [v6 objectForKeyedSubscript:@"playReason"];
  self->_playReason = (unint64_t)[v17 _playReasonFromString:v18];

  id v19 = +[MTPlaybackIdentifierUtil sharedInstance];
  v20 = [v6 objectForKeyedSubscript:@"context"];
  self->_playContext = (int64_t)[v19 _episodeContextFromString:v20];

  v21 = +[MTPlaybackIdentifierUtil sharedInstance];
  v22 = [v6 objectForKeyedSubscript:@"contextSortType"];
  self->_playContextSortType = (int64_t)[v21 _episodeContextSortFromString:v22];

  unint64_t playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    v28 = [v6 objectForKeyedSubscript:@"uuid"];
    stationUuid = self->_stationUuid;
    self->_stationUuid = v28;

    v30 = [v6 objectForKeyedSubscript:@"episodeUuid"];
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v30;
  }
  else
  {
    if (playQueueType != 2) {
      goto LABEL_13;
    }
    v24 = [v6 objectForKeyedSubscript:@"uuid"];
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v24;

    v26 = [v6 objectForKeyedSubscript:@"episodeUuid"];
    v27 = self->_episodeUuid;
    self->_episodeUuid = v26;

    [(MTURLCommandRequest *)self _lookupPodcastUuidIfNecessaryFromURLString:v42];
  }
  [(MTURLCommandRequest *)self _lookupEpisodeUuidIfNecessaryFromURLString:v42];
LABEL_13:
  v32 = [v6 objectForKeyedSubscript:@"storeCollectionId"];
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v32;

  v34 = [v6 objectForKeyedSubscript:@"storeTrackId"];
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v34;

  v36 = [v6 objectForKeyedSubscript:@"podcastFeedUrl"];
  v37 = +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:v36];

  v38 = +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:v37];
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v38;

  v40 = [v6 objectForKeyedSubscript:@"enqueuerDSID"];
  requesterDsid = self->_requesterDsid;
  self->_requesterDsid = v40;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (unint64_t)commandType
{
  return self->_commandType;
}

- (unint64_t)playQueueType
{
  return self->_playQueueType;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (int64_t)playContext
{
  return self->_playContext;
}

- (int64_t)playContextSortType
{
  return self->_playContextSortType;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (NSString)podcastAdamId
{
  return self->_podcastAdamId;
}

- (NSString)episodeAdamId
{
  return self->_episodeAdamId;
}

- (NSString)stationUuid
{
  return self->_stationUuid;
}

- (NSString)requesterDsid
{
  return self->_requesterDsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterDsid, 0);
  objc_storeStrong((id *)&self->_stationUuid, 0);
  objc_storeStrong((id *)&self->_episodeAdamId, 0);
  objc_storeStrong((id *)&self->_podcastAdamId, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end