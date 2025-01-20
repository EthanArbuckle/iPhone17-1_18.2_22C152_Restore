@interface MTRChannelClusterProgramStruct
- (MTRChannelClusterChannelInfoStruct)channel;
- (MTRChannelClusterProgramStruct)init;
- (MTRChannelClusterSeriesInfoStruct)seriesInfo;
- (NSArray)audioLanguages;
- (NSArray)castList;
- (NSArray)categoryList;
- (NSArray)externalIDList;
- (NSArray)ratings;
- (NSNumber)endTime;
- (NSNumber)recordingFlag;
- (NSNumber)startTime;
- (NSString)descriptionString;
- (NSString)dvbiUrl;
- (NSString)identifier;
- (NSString)parentalGuidanceText;
- (NSString)posterArtUrl;
- (NSString)releaseDate;
- (NSString)subtitle;
- (NSString)thumbnailUrl;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioLanguages:(id)a3;
- (void)setCastList:(id)a3;
- (void)setCategoryList:(id)a3;
- (void)setChannel:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setDvbiUrl:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setExternalIDList:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentalGuidanceText:(id)a3;
- (void)setPosterArtUrl:(id)a3;
- (void)setRatings:(id)a3;
- (void)setRecordingFlag:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSeriesInfo:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailUrl:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTRChannelClusterProgramStruct

- (MTRChannelClusterProgramStruct)init
{
  v25.receiver = self;
  v25.super_class = (Class)MTRChannelClusterProgramStruct;
  v2 = [(MTRChannelClusterProgramStruct *)&v25 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_26F969DC8;

    uint64_t v5 = objc_opt_new();
    channel = v3->_channel;
    v3->_channel = (MTRChannelClusterChannelInfoStruct *)v5;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_26F9C8620;

    endTime = v3->_endTime;
    v3->_endTime = (NSNumber *)&unk_26F9C8620;

    title = v3->_title;
    v3->_title = (NSString *)&stru_26F969DC8;

    subtitle = v3->_subtitle;
    v3->_subtitle = 0;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = 0;

    audioLanguages = v3->_audioLanguages;
    v3->_audioLanguages = 0;

    ratings = v3->_ratings;
    v3->_ratings = 0;

    thumbnailUrl = v3->_thumbnailUrl;
    v3->_thumbnailUrl = 0;

    posterArtUrl = v3->_posterArtUrl;
    v3->_posterArtUrl = 0;

    dvbiUrl = v3->_dvbiUrl;
    v3->_dvbiUrl = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

    parentalGuidanceText = v3->_parentalGuidanceText;
    v3->_parentalGuidanceText = 0;

    recordingFlag = v3->_recordingFlag;
    v3->_recordingFlag = 0;

    seriesInfo = v3->_seriesInfo;
    v3->_seriesInfo = 0;

    categoryList = v3->_categoryList;
    v3->_categoryList = 0;

    castList = v3->_castList;
    v3->_castList = 0;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterProgramStruct);
  v7 = objc_msgSend_identifier(self, v5, v6);
  objc_msgSend_setIdentifier_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_channel(self, v9, v10);
  objc_msgSend_setChannel_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_startTime(self, v13, v14);
  objc_msgSend_setStartTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_endTime(self, v17, v18);
  objc_msgSend_setEndTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_title(self, v21, v22);
  objc_msgSend_setTitle_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_subtitle(self, v25, v26);
  objc_msgSend_setSubtitle_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_descriptionString(self, v29, v30);
  objc_msgSend_setDescriptionString_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_audioLanguages(self, v33, v34);
  objc_msgSend_setAudioLanguages_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_ratings(self, v37, v38);
  objc_msgSend_setRatings_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_thumbnailUrl(self, v41, v42);
  objc_msgSend_setThumbnailUrl_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_posterArtUrl(self, v45, v46);
  objc_msgSend_setPosterArtUrl_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_dvbiUrl(self, v49, v50);
  objc_msgSend_setDvbiUrl_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_releaseDate(self, v53, v54);
  objc_msgSend_setReleaseDate_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_parentalGuidanceText(self, v57, v58);
  objc_msgSend_setParentalGuidanceText_(v4, v60, (uint64_t)v59);

  v63 = objc_msgSend_recordingFlag(self, v61, v62);
  objc_msgSend_setRecordingFlag_(v4, v64, (uint64_t)v63);

  v67 = objc_msgSend_seriesInfo(self, v65, v66);
  objc_msgSend_setSeriesInfo_(v4, v68, (uint64_t)v67);

  v71 = objc_msgSend_categoryList(self, v69, v70);
  objc_msgSend_setCategoryList_(v4, v72, (uint64_t)v71);

  v75 = objc_msgSend_castList(self, v73, v74);
  objc_msgSend_setCastList_(v4, v76, (uint64_t)v75);

  v79 = objc_msgSend_externalIDList(self, v77, v78);
  objc_msgSend_setExternalIDList_(v4, v80, (uint64_t)v79);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: identifier:%@; channel:%@; startTime:%@; endTime:%@; title:%@; subtitle:%@; descriptionString:%@; audioLanguages:%@; ratings:%@; thumbnailUrl:%@; posterArtUrl:%@; dvbiUrl:%@; releaseDate:%@; parentalGuidanceText:%@; recordingFlag:%@; seriesInfo:%@; categoryList:%@; castList:%@; externalIDList:%@; >",
    v5,
    self->_identifier,
    self->_channel,
    self->_startTime,
    self->_endTime,
    self->_title,
    self->_subtitle,
    self->_descriptionString,
    self->_audioLanguages,
    self->_ratings,
    self->_thumbnailUrl,
    self->_posterArtUrl,
    self->_dvbiUrl,
    self->_releaseDate,
    self->_parentalGuidanceText,
    self->_recordingFlag,
    self->_seriesInfo,
    self->_categoryList,
    self->_castList,
  v7 = self->_externalIDList);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (MTRChannelClusterChannelInfoStruct)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
}

- (NSArray)audioLanguages
{
  return self->_audioLanguages;
}

- (void)setAudioLanguages:(id)a3
{
}

- (NSArray)ratings
{
  return self->_ratings;
}

- (void)setRatings:(id)a3
{
}

- (NSString)thumbnailUrl
{
  return self->_thumbnailUrl;
}

- (void)setThumbnailUrl:(id)a3
{
}

- (NSString)posterArtUrl
{
  return self->_posterArtUrl;
}

- (void)setPosterArtUrl:(id)a3
{
}

- (NSString)dvbiUrl
{
  return self->_dvbiUrl;
}

- (void)setDvbiUrl:(id)a3
{
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)parentalGuidanceText
{
  return self->_parentalGuidanceText;
}

- (void)setParentalGuidanceText:(id)a3
{
}

- (NSNumber)recordingFlag
{
  return self->_recordingFlag;
}

- (void)setRecordingFlag:(id)a3
{
}

- (MTRChannelClusterSeriesInfoStruct)seriesInfo
{
  return self->_seriesInfo;
}

- (void)setSeriesInfo:(id)a3
{
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
}

- (NSArray)castList
{
  return self->_castList;
}

- (void)setCastList:(id)a3
{
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_castList, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_seriesInfo, 0);
  objc_storeStrong((id *)&self->_recordingFlag, 0);
  objc_storeStrong((id *)&self->_parentalGuidanceText, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dvbiUrl, 0);
  objc_storeStrong((id *)&self->_posterArtUrl, 0);
  objc_storeStrong((id *)&self->_thumbnailUrl, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_audioLanguages, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end