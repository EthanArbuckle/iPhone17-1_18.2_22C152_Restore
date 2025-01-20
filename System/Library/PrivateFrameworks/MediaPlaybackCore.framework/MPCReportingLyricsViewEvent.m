@interface MPCReportingLyricsViewEvent
- (BOOL)continuityCameraUsed;
- (MPModelPlayEvent)modelPlayEvent;
- (MPModelSong)modelSong;
- (NSData)recommendationData;
- (NSString)featureName;
- (NSString)language;
- (NSString)lyricsID;
- (NSString)queueGroupingID;
- (double)visibleDuration;
- (int64_t)displayType;
- (int64_t)displayedCharacterCount;
- (int64_t)sourceType;
- (int64_t)userPreferenceSyllable;
- (void)setContinuityCameraUsed:(BOOL)a3;
- (void)setDisplayType:(int64_t)a3;
- (void)setDisplayedCharacterCount:(int64_t)a3;
- (void)setFeatureName:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLyricsID:(id)a3;
- (void)setModelPlayEvent:(id)a3;
- (void)setModelSong:(id)a3;
- (void)setQueueGroupingID:(id)a3;
- (void)setRecommendationData:(id)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setUserPreferenceSyllable:(int64_t)a3;
- (void)setVisibleDuration:(double)a3;
@end

@implementation MPCReportingLyricsViewEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);

  objc_storeStrong((id *)&self->_modelSong, 0);
}

- (void)setUserPreferenceSyllable:(int64_t)a3
{
  self->_userPreferenceSyllable = a3;
}

- (int64_t)userPreferenceSyllable
{
  return self->_userPreferenceSyllable;
}

- (void)setContinuityCameraUsed:(BOOL)a3
{
  self->_continuityCameraUsed = a3;
}

- (BOOL)continuityCameraUsed
{
  return self->_continuityCameraUsed;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setRecommendationData:(id)a3
{
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setQueueGroupingID:(id)a3
{
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setFeatureName:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setDisplayedCharacterCount:(int64_t)a3
{
  self->_displayedCharacterCount = a3;
}

- (int64_t)displayedCharacterCount
{
  return self->_displayedCharacterCount;
}

- (void)setDisplayType:(int64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (void)setVisibleDuration:(double)a3
{
  self->_visibleDuration = a3;
}

- (double)visibleDuration
{
  return self->_visibleDuration;
}

- (void)setLyricsID:(id)a3
{
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setModelPlayEvent:(id)a3
{
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

- (void)setModelSong:(id)a3
{
}

- (MPModelSong)modelSong
{
  return self->_modelSong;
}

@end