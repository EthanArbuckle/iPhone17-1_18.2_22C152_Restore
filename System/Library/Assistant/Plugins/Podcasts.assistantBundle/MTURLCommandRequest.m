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
  v12.receiver = self;
  v12.super_class = (Class)MTURLCommandRequest;
  v6 = [(MTURLCommandRequest *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_urlString, a3);
    objc_msgSend__loadQueryParameterValuesFromString_(v7, v8, (uint64_t)v5, v9, v10);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  uint64_t v9 = objc_msgSend_copy(self->_urlString, v5, v6, v7, v8);
  uint64_t v10 = (void *)v4[1];
  v4[1] = v9;

  v4[2] = self->_commandType;
  v4[3] = self->_playQueueType;
  v4[4] = self->_playReason;
  v4[5] = self->_playbackOrder;
  v4[6] = self->_playContext;
  v4[7] = self->_playContextSortType;
  uint64_t v15 = objc_msgSend_copy(self->_podcastUuid, v11, v12, v13, v14);
  v16 = (void *)v4[8];
  v4[8] = v15;

  uint64_t v21 = objc_msgSend_copy(self->_podcastFeedUrl, v17, v18, v19, v20);
  v22 = (void *)v4[9];
  v4[9] = v21;

  uint64_t v27 = objc_msgSend_copy(self->_episodeUuid, v23, v24, v25, v26);
  v28 = (void *)v4[10];
  v4[10] = v27;

  uint64_t v33 = objc_msgSend_copy(self->_podcastAdamId, v29, v30, v31, v32);
  v34 = (void *)v4[11];
  v4[11] = v33;

  uint64_t v39 = objc_msgSend_copy(self->_episodeAdamId, v35, v36, v37, v38);
  v40 = (void *)v4[12];
  v4[12] = v39;

  uint64_t v45 = objc_msgSend_copy(self->_stationUuid, v41, v42, v43, v44);
  v46 = (void *)v4[13];
  v4[13] = v45;

  uint64_t v51 = objc_msgSend_copy(self->_requesterDsid, v47, v48, v49, v50);
  v52 = (void *)v4[14];
  v4[14] = v51;

  return v4;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  id result = (id)objc_msgSend_copy(self, a2, a3, v3, v4);
  *((void *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  id v142 = a3;
  uint64_t v7 = objc_msgSend_URLWithString_(NSURL, v4, (uint64_t)v142, v5, v6);
  uint64_t v12 = objc_msgSend_query(v7, v8, v9, v10, v11);
  v16 = objc_msgSend___queryStringToQueryDictionary_(MTPlaybackIdentifierUtil, v13, (uint64_t)v12, v14, v15);

  uint64_t v21 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v17, v18, v19, v20);
  char isSubscribeCommandURLString = objc_msgSend_isSubscribeCommandURLString_(v21, v22, (uint64_t)v142, v23, v24);

  if (isSubscribeCommandURLString)
  {
    unint64_t v30 = 1;
  }
  else
  {
    uint64_t v31 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
    char isLocalSetPlaybackQueueURLString = objc_msgSend_isLocalSetPlaybackQueueURLString_(v31, v32, (uint64_t)v142, v33, v34);

    if (isLocalSetPlaybackQueueURLString)
    {
      unint64_t v30 = 2;
    }
    else
    {
      uint64_t v36 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
      int isUniversalPlaybackIdentifierURLString = objc_msgSend_isUniversalPlaybackIdentifierURLString_(v36, v37, (uint64_t)v142, v38, v39);

      if (!isUniversalPlaybackIdentifierURLString) {
        goto LABEL_8;
      }
      unint64_t v30 = 3;
    }
  }
  self->_commandType = v30;
LABEL_8:
  v41 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
  self->_unint64_t playQueueType = objc_msgSend__playQueueTypeForRequestURL_(v41, v42, (uint64_t)v7, v43, v44);

  uint64_t v49 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v45, v46, v47, v48);
  v53 = objc_msgSend_objectForKeyedSubscript_(v16, v50, @"playbackOrder", v51, v52);
  self->_playbackOrder = objc_msgSend__episodeOrderFromString_(v49, v54, (uint64_t)v53, v55, v56);

  v61 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v57, v58, v59, v60);
  v65 = objc_msgSend_objectForKeyedSubscript_(v16, v62, @"playReason", v63, v64);
  self->_playReason = objc_msgSend__playReasonFromString_(v61, v66, (uint64_t)v65, v67, v68);

  v73 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v69, v70, v71, v72);
  v77 = objc_msgSend_objectForKeyedSubscript_(v16, v74, @"context", v75, v76);
  self->_playContext = objc_msgSend__episodeContextFromString_(v73, v78, (uint64_t)v77, v79, v80);

  v85 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v81, v82, v83, v84);
  v89 = objc_msgSend_objectForKeyedSubscript_(v16, v86, @"contextSortType", v87, v88);
  self->_playContextSortType = objc_msgSend__episodeContextSortFromString_(v85, v90, (uint64_t)v89, v91, v92);

  unint64_t playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    objc_msgSend_objectForKeyedSubscript_(v16, v93, @"uuid", v94, v95);
    v110 = (NSString *)objc_claimAutoreleasedReturnValue();
    stationUuid = self->_stationUuid;
    self->_stationUuid = v110;

    objc_msgSend_objectForKeyedSubscript_(v16, v112, @"episodeUuid", v113, v114);
    v115 = (NSString *)objc_claimAutoreleasedReturnValue();
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v115;
  }
  else
  {
    if (playQueueType != 2) {
      goto LABEL_13;
    }
    objc_msgSend_objectForKeyedSubscript_(v16, v93, @"uuid", v94, v95);
    v97 = (NSString *)objc_claimAutoreleasedReturnValue();
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v97;

    objc_msgSend_objectForKeyedSubscript_(v16, v99, @"episodeUuid", v100, v101);
    v102 = (NSString *)objc_claimAutoreleasedReturnValue();
    v103 = self->_episodeUuid;
    self->_episodeUuid = v102;

    objc_msgSend__lookupPodcastUuidIfNecessaryFromURLString_(self, v104, (uint64_t)v142, v105, v106);
  }
  objc_msgSend__lookupEpisodeUuidIfNecessaryFromURLString_(self, v107, (uint64_t)v142, v108, v109);
LABEL_13:
  objc_msgSend_objectForKeyedSubscript_(v16, v93, @"storeCollectionId", v94, v95);
  v117 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v117;

  objc_msgSend_objectForKeyedSubscript_(v16, v119, @"storeTrackId", v120, v121);
  v122 = (NSString *)objc_claimAutoreleasedReturnValue();
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v122;

  v127 = objc_msgSend_objectForKeyedSubscript_(v16, v124, @"podcastFeedUrl", v125, v126);
  v131 = objc_msgSend___stringByRemovingPercentEscapes_(MTPlaybackIdentifierUtil, v128, (uint64_t)v127, v129, v130);

  objc_msgSend___stringByRemovingPercentEscapes_(MTPlaybackIdentifierUtil, v132, (uint64_t)v131, v133, v134);
  v135 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v135;

  objc_msgSend_objectForKeyedSubscript_(v16, v137, @"enqueuerDSID", v138, v139);
  v140 = (NSString *)objc_claimAutoreleasedReturnValue();
  requesterDsid = self->_requesterDsid;
  self->_requesterDsid = v140;
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