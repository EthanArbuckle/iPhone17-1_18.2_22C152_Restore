@interface BMSiriMusicInferenceTrainingDependentSignals
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48;
- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48 usageScoreRadio:(id)a49 usageScoreMusicWithoutRadio:(id)a50 rawMediaTypeUsageSignalRadio:(id)a51 rawMediaTypeUsageSignalMusicWithoutRadio:(id)a52;
- (BMSiriMusicInferenceTrainingDependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCompoundActiveBundleScore;
- (BOOL)hasCompoundMediaTypeBundleScore;
- (BOOL)hasEntitySearchBundleRecencyS;
- (BOOL)hasEntitySearchBundleScore;
- (BOOL)hasIsAppFirstParty;
- (BOOL)hasIsClientForegroundActiveBundle;
- (BOOL)hasIsDisambiguationSelectedApp;
- (BOOL)hasIsForegroundBundle;
- (BOOL)hasIsModelPredictedApp;
- (BOOL)hasIsNowPlayingBundle;
- (BOOL)hasIsNowPlayingBundlePSE1;
- (BOOL)hasIsNowPlayingBundlePSE2;
- (BOOL)hasIsNowPlayingLastBundle;
- (BOOL)hasIsRawLastNowPlayingCoreDuet;
- (BOOL)hasIsRawMediaCategoryAudiobookSignal;
- (BOOL)hasIsRawMediaCategoryMusicSignal;
- (BOOL)hasIsRawMediaCategoryPodcastSignal;
- (BOOL)hasIsRawMediaCategoryRadioSignal;
- (BOOL)hasIsRawMediaCategoryVideoSignal;
- (BOOL)hasIsRequestedApp;
- (BOOL)hasIsSupportedFlag;
- (BOOL)hasIsSupportedUnicornMatchFlag;
- (BOOL)hasIsUnicornFlag;
- (BOOL)hasNowPlayingBundleCount;
- (BOOL)hasNowPlayingBundleRecencyS;
- (BOOL)hasNowPlayingBundleScore;
- (BOOL)hasNowPlayingUsage14Days;
- (BOOL)hasNowPlayingUsage1Day;
- (BOOL)hasNowPlayingUsage7Days;
- (BOOL)hasRawEntitySearchRecency;
- (BOOL)hasRawMediaTypeUsageSignalBook;
- (BOOL)hasRawMediaTypeUsageSignalMusic;
- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio;
- (BOOL)hasRawMediaTypeUsageSignalPodcast;
- (BOOL)hasRawMediaTypeUsageSignalRadio;
- (BOOL)hasRawMediaTypeUsageSignalVideo;
- (BOOL)hasRawNowPlayingCountCoreDuet10Min;
- (BOOL)hasRawNowPlayingCountCoreDuet1Day;
- (BOOL)hasRawNowPlayingCountCoreDuet1Hr;
- (BOOL)hasRawNowPlayingCountCoreDuet28Day;
- (BOOL)hasRawNowPlayingCountCoreDuet2Min;
- (BOOL)hasRawNowPlayingCountCoreDuet6Hr;
- (BOOL)hasRawNowPlayingCountCoreDuet7Day;
- (BOOL)hasRawNowPlayingRecencyCD;
- (BOOL)hasUsageScoreBooks;
- (BOOL)hasUsageScoreMusic;
- (BOOL)hasUsageScoreMusicWithoutRadio;
- (BOOL)hasUsageScorePodcasts;
- (BOOL)hasUsageScoreRadio;
- (BOOL)hasVq21Score;
- (BOOL)isAppFirstParty;
- (BOOL)isClientForegroundActiveBundle;
- (BOOL)isDisambiguationSelectedApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegroundBundle;
- (BOOL)isModelPredictedApp;
- (BOOL)isNowPlayingBundle;
- (BOOL)isNowPlayingBundlePSE1;
- (BOOL)isNowPlayingBundlePSE2;
- (BOOL)isNowPlayingLastBundle;
- (BOOL)isRawLastNowPlayingCoreDuet;
- (BOOL)isRawMediaCategoryAudiobookSignal;
- (BOOL)isRawMediaCategoryMusicSignal;
- (BOOL)isRawMediaCategoryPodcastSignal;
- (BOOL)isRawMediaCategoryRadioSignal;
- (BOOL)isRawMediaCategoryVideoSignal;
- (BOOL)isRequestedApp;
- (BOOL)isSupportedFlag;
- (BOOL)isSupportedUnicornMatchFlag;
- (BOOL)isUnicornFlag;
- (NSString)description;
- (double)compoundActiveBundleScore;
- (double)compoundMediaTypeBundleScore;
- (double)entitySearchBundleRecencyS;
- (double)entitySearchBundleScore;
- (double)nowPlayingBundleRecencyS;
- (double)nowPlayingBundleScore;
- (double)usageScoreBooks;
- (double)usageScoreMusic;
- (double)usageScoreMusicWithoutRadio;
- (double)usageScorePodcasts;
- (double)usageScoreRadio;
- (double)vq21Score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)nowPlayingBundleCount;
- (int)nowPlayingUsage14Days;
- (int)nowPlayingUsage1Day;
- (int)nowPlayingUsage7Days;
- (int)rawEntitySearchRecency;
- (int)rawMediaTypeUsageSignalBook;
- (int)rawMediaTypeUsageSignalMusic;
- (int)rawMediaTypeUsageSignalMusicWithoutRadio;
- (int)rawMediaTypeUsageSignalPodcast;
- (int)rawMediaTypeUsageSignalRadio;
- (int)rawMediaTypeUsageSignalVideo;
- (int)rawNowPlayingCountCoreDuet10Min;
- (int)rawNowPlayingCountCoreDuet1Day;
- (int)rawNowPlayingCountCoreDuet1Hr;
- (int)rawNowPlayingCountCoreDuet28Day;
- (int)rawNowPlayingCountCoreDuet2Min;
- (int)rawNowPlayingCountCoreDuet6Hr;
- (int)rawNowPlayingCountCoreDuet7Day;
- (int)rawNowPlayingRecencyCD;
- (unsigned)dataVersion;
- (void)setHasCompoundActiveBundleScore:(BOOL)a3;
- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3;
- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3;
- (void)setHasEntitySearchBundleScore:(BOOL)a3;
- (void)setHasIsAppFirstParty:(BOOL)a3;
- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3;
- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3;
- (void)setHasIsForegroundBundle:(BOOL)a3;
- (void)setHasIsModelPredictedApp:(BOOL)a3;
- (void)setHasIsNowPlayingBundle:(BOOL)a3;
- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3;
- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3;
- (void)setHasIsNowPlayingLastBundle:(BOOL)a3;
- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3;
- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3;
- (void)setHasIsRequestedApp:(BOOL)a3;
- (void)setHasIsSupportedFlag:(BOOL)a3;
- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3;
- (void)setHasIsUnicornFlag:(BOOL)a3;
- (void)setHasNowPlayingBundleCount:(BOOL)a3;
- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3;
- (void)setHasNowPlayingBundleScore:(BOOL)a3;
- (void)setHasNowPlayingUsage14Days:(BOOL)a3;
- (void)setHasNowPlayingUsage1Day:(BOOL)a3;
- (void)setHasNowPlayingUsage7Days:(BOOL)a3;
- (void)setHasRawEntitySearchRecency:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3;
- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3;
- (void)setHasUsageScoreBooks:(BOOL)a3;
- (void)setHasUsageScoreMusic:(BOOL)a3;
- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3;
- (void)setHasUsageScorePodcasts:(BOOL)a3;
- (void)setHasUsageScoreRadio:(BOOL)a3;
- (void)setHasVq21Score:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriMusicInferenceTrainingDependentSignals

- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalMusicWithoutRadio = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_hasRawMediaTypeUsageSignalMusicWithoutRadio;
}

- (int)rawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_rawMediaTypeUsageSignalMusicWithoutRadio;
}

- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalRadio = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalRadio
{
  return self->_hasRawMediaTypeUsageSignalRadio;
}

- (int)rawMediaTypeUsageSignalRadio
{
  return self->_rawMediaTypeUsageSignalRadio;
}

- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3
{
  self->_hasUsageScoreMusicWithoutRadio = a3;
}

- (BOOL)hasUsageScoreMusicWithoutRadio
{
  return self->_hasUsageScoreMusicWithoutRadio;
}

- (double)usageScoreMusicWithoutRadio
{
  return self->_usageScoreMusicWithoutRadio;
}

- (void)setHasUsageScoreRadio:(BOOL)a3
{
  self->_hasUsageScoreRadio = a3;
}

- (BOOL)hasUsageScoreRadio
{
  return self->_hasUsageScoreRadio;
}

- (double)usageScoreRadio
{
  return self->_usageScoreRadio;
}

- (void)setHasIsModelPredictedApp:(BOOL)a3
{
  self->_hasIsModelPredictedApp = a3;
}

- (BOOL)hasIsModelPredictedApp
{
  return self->_hasIsModelPredictedApp;
}

- (BOOL)isModelPredictedApp
{
  return self->_isModelPredictedApp;
}

- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3
{
  self->_hasIsDisambiguationSelectedApp = a3;
}

- (BOOL)hasIsDisambiguationSelectedApp
{
  return self->_hasIsDisambiguationSelectedApp;
}

- (BOOL)isDisambiguationSelectedApp
{
  return self->_isDisambiguationSelectedApp;
}

- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3
{
  self->_hasIsSupportedUnicornMatchFlag = a3;
}

- (BOOL)hasIsSupportedUnicornMatchFlag
{
  return self->_hasIsSupportedUnicornMatchFlag;
}

- (BOOL)isSupportedUnicornMatchFlag
{
  return self->_isSupportedUnicornMatchFlag;
}

- (void)setHasIsUnicornFlag:(BOOL)a3
{
  self->_hasIsUnicornFlag = a3;
}

- (BOOL)hasIsUnicornFlag
{
  return self->_hasIsUnicornFlag;
}

- (BOOL)isUnicornFlag
{
  return self->_isUnicornFlag;
}

- (void)setHasIsSupportedFlag:(BOOL)a3
{
  self->_hasIsSupportedFlag = a3;
}

- (BOOL)hasIsSupportedFlag
{
  return self->_hasIsSupportedFlag;
}

- (BOOL)isSupportedFlag
{
  return self->_isSupportedFlag;
}

- (void)setHasVq21Score:(BOOL)a3
{
  self->_hasVq21Score = a3;
}

- (BOOL)hasVq21Score
{
  return self->_hasVq21Score;
}

- (double)vq21Score
{
  return self->_vq21Score;
}

- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3
{
  self->_hasIsNowPlayingBundlePSE2 = a3;
}

- (BOOL)hasIsNowPlayingBundlePSE2
{
  return self->_hasIsNowPlayingBundlePSE2;
}

- (BOOL)isNowPlayingBundlePSE2
{
  return self->_isNowPlayingBundlePSE2;
}

- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3
{
  self->_hasIsNowPlayingBundlePSE1 = a3;
}

- (BOOL)hasIsNowPlayingBundlePSE1
{
  return self->_hasIsNowPlayingBundlePSE1;
}

- (BOOL)isNowPlayingBundlePSE1
{
  return self->_isNowPlayingBundlePSE1;
}

- (void)setHasIsRequestedApp:(BOOL)a3
{
  self->_hasIsRequestedApp = a3;
}

- (BOOL)hasIsRequestedApp
{
  return self->_hasIsRequestedApp;
}

- (BOOL)isRequestedApp
{
  return self->_isRequestedApp;
}

- (void)setHasIsAppFirstParty:(BOOL)a3
{
  self->_hasIsAppFirstParty = a3;
}

- (BOOL)hasIsAppFirstParty
{
  return self->_hasIsAppFirstParty;
}

- (BOOL)isAppFirstParty
{
  return self->_isAppFirstParty;
}

- (void)setHasUsageScorePodcasts:(BOOL)a3
{
  self->_hasUsageScorePodcasts = a3;
}

- (BOOL)hasUsageScorePodcasts
{
  return self->_hasUsageScorePodcasts;
}

- (double)usageScorePodcasts
{
  return self->_usageScorePodcasts;
}

- (void)setHasUsageScoreMusic:(BOOL)a3
{
  self->_hasUsageScoreMusic = a3;
}

- (BOOL)hasUsageScoreMusic
{
  return self->_hasUsageScoreMusic;
}

- (double)usageScoreMusic
{
  return self->_usageScoreMusic;
}

- (void)setHasUsageScoreBooks:(BOOL)a3
{
  self->_hasUsageScoreBooks = a3;
}

- (BOOL)hasUsageScoreBooks
{
  return self->_hasUsageScoreBooks;
}

- (double)usageScoreBooks
{
  return self->_usageScoreBooks;
}

- (void)setHasRawEntitySearchRecency:(BOOL)a3
{
  self->_hasRawEntitySearchRecency = a3;
}

- (BOOL)hasRawEntitySearchRecency
{
  return self->_hasRawEntitySearchRecency;
}

- (int)rawEntitySearchRecency
{
  return self->_rawEntitySearchRecency;
}

- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3
{
  self->_hasRawNowPlayingRecencyCD = a3;
}

- (BOOL)hasRawNowPlayingRecencyCD
{
  return self->_hasRawNowPlayingRecencyCD;
}

- (int)rawNowPlayingRecencyCD
{
  return self->_rawNowPlayingRecencyCD;
}

- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet7Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet7Day
{
  return self->_hasRawNowPlayingCountCoreDuet7Day;
}

- (int)rawNowPlayingCountCoreDuet7Day
{
  return self->_rawNowPlayingCountCoreDuet7Day;
}

- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet6Hr = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet6Hr
{
  return self->_hasRawNowPlayingCountCoreDuet6Hr;
}

- (int)rawNowPlayingCountCoreDuet6Hr
{
  return self->_rawNowPlayingCountCoreDuet6Hr;
}

- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet2Min = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet2Min
{
  return self->_hasRawNowPlayingCountCoreDuet2Min;
}

- (int)rawNowPlayingCountCoreDuet2Min
{
  return self->_rawNowPlayingCountCoreDuet2Min;
}

- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet28Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet28Day
{
  return self->_hasRawNowPlayingCountCoreDuet28Day;
}

- (int)rawNowPlayingCountCoreDuet28Day
{
  return self->_rawNowPlayingCountCoreDuet28Day;
}

- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet1Hr = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Hr
{
  return self->_hasRawNowPlayingCountCoreDuet1Hr;
}

- (int)rawNowPlayingCountCoreDuet1Hr
{
  return self->_rawNowPlayingCountCoreDuet1Hr;
}

- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet1Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Day
{
  return self->_hasRawNowPlayingCountCoreDuet1Day;
}

- (int)rawNowPlayingCountCoreDuet1Day
{
  return self->_rawNowPlayingCountCoreDuet1Day;
}

- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3
{
  self->_hasRawNowPlayingCountCoreDuet10Min = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet10Min
{
  return self->_hasRawNowPlayingCountCoreDuet10Min;
}

- (int)rawNowPlayingCountCoreDuet10Min
{
  return self->_rawNowPlayingCountCoreDuet10Min;
}

- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalVideo = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalVideo
{
  return self->_hasRawMediaTypeUsageSignalVideo;
}

- (int)rawMediaTypeUsageSignalVideo
{
  return self->_rawMediaTypeUsageSignalVideo;
}

- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalPodcast = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalPodcast
{
  return self->_hasRawMediaTypeUsageSignalPodcast;
}

- (int)rawMediaTypeUsageSignalPodcast
{
  return self->_rawMediaTypeUsageSignalPodcast;
}

- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalMusic = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusic
{
  return self->_hasRawMediaTypeUsageSignalMusic;
}

- (int)rawMediaTypeUsageSignalMusic
{
  return self->_rawMediaTypeUsageSignalMusic;
}

- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3
{
  self->_hasRawMediaTypeUsageSignalBook = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalBook
{
  return self->_hasRawMediaTypeUsageSignalBook;
}

- (int)rawMediaTypeUsageSignalBook
{
  return self->_rawMediaTypeUsageSignalBook;
}

- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryVideoSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryVideoSignal
{
  return self->_hasIsRawMediaCategoryVideoSignal;
}

- (BOOL)isRawMediaCategoryVideoSignal
{
  return self->_isRawMediaCategoryVideoSignal;
}

- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryRadioSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryRadioSignal
{
  return self->_hasIsRawMediaCategoryRadioSignal;
}

- (BOOL)isRawMediaCategoryRadioSignal
{
  return self->_isRawMediaCategoryRadioSignal;
}

- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryPodcastSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryPodcastSignal
{
  return self->_hasIsRawMediaCategoryPodcastSignal;
}

- (BOOL)isRawMediaCategoryPodcastSignal
{
  return self->_isRawMediaCategoryPodcastSignal;
}

- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryMusicSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryMusicSignal
{
  return self->_hasIsRawMediaCategoryMusicSignal;
}

- (BOOL)isRawMediaCategoryMusicSignal
{
  return self->_isRawMediaCategoryMusicSignal;
}

- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  self->_hasIsRawMediaCategoryAudiobookSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryAudiobookSignal
{
  return self->_hasIsRawMediaCategoryAudiobookSignal;
}

- (BOOL)isRawMediaCategoryAudiobookSignal
{
  return self->_isRawMediaCategoryAudiobookSignal;
}

- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  self->_hasIsRawLastNowPlayingCoreDuet = a3;
}

- (BOOL)hasIsRawLastNowPlayingCoreDuet
{
  return self->_hasIsRawLastNowPlayingCoreDuet;
}

- (BOOL)isRawLastNowPlayingCoreDuet
{
  return self->_isRawLastNowPlayingCoreDuet;
}

- (void)setHasNowPlayingUsage14Days:(BOOL)a3
{
  self->_hasNowPlayingUsage14Days = a3;
}

- (BOOL)hasNowPlayingUsage14Days
{
  return self->_hasNowPlayingUsage14Days;
}

- (int)nowPlayingUsage14Days
{
  return self->_nowPlayingUsage14Days;
}

- (void)setHasNowPlayingUsage7Days:(BOOL)a3
{
  self->_hasNowPlayingUsage7Days = a3;
}

- (BOOL)hasNowPlayingUsage7Days
{
  return self->_hasNowPlayingUsage7Days;
}

- (int)nowPlayingUsage7Days
{
  return self->_nowPlayingUsage7Days;
}

- (void)setHasNowPlayingUsage1Day:(BOOL)a3
{
  self->_hasNowPlayingUsage1Day = a3;
}

- (BOOL)hasNowPlayingUsage1Day
{
  return self->_hasNowPlayingUsage1Day;
}

- (int)nowPlayingUsage1Day
{
  return self->_nowPlayingUsage1Day;
}

- (void)setHasIsNowPlayingLastBundle:(BOOL)a3
{
  self->_hasIsNowPlayingLastBundle = a3;
}

- (BOOL)hasIsNowPlayingLastBundle
{
  return self->_hasIsNowPlayingLastBundle;
}

- (BOOL)isNowPlayingLastBundle
{
  return self->_isNowPlayingLastBundle;
}

- (void)setHasNowPlayingBundleScore:(BOOL)a3
{
  self->_hasNowPlayingBundleScore = a3;
}

- (BOOL)hasNowPlayingBundleScore
{
  return self->_hasNowPlayingBundleScore;
}

- (double)nowPlayingBundleScore
{
  return self->_nowPlayingBundleScore;
}

- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3
{
  self->_hasNowPlayingBundleRecencyS = a3;
}

- (BOOL)hasNowPlayingBundleRecencyS
{
  return self->_hasNowPlayingBundleRecencyS;
}

- (double)nowPlayingBundleRecencyS
{
  return self->_nowPlayingBundleRecencyS;
}

- (void)setHasNowPlayingBundleCount:(BOOL)a3
{
  self->_hasNowPlayingBundleCount = a3;
}

- (BOOL)hasNowPlayingBundleCount
{
  return self->_hasNowPlayingBundleCount;
}

- (int)nowPlayingBundleCount
{
  return self->_nowPlayingBundleCount;
}

- (void)setHasIsNowPlayingBundle:(BOOL)a3
{
  self->_hasIsNowPlayingBundle = a3;
}

- (BOOL)hasIsNowPlayingBundle
{
  return self->_hasIsNowPlayingBundle;
}

- (BOOL)isNowPlayingBundle
{
  return self->_isNowPlayingBundle;
}

- (void)setHasIsForegroundBundle:(BOOL)a3
{
  self->_hasIsForegroundBundle = a3;
}

- (BOOL)hasIsForegroundBundle
{
  return self->_hasIsForegroundBundle;
}

- (BOOL)isForegroundBundle
{
  return self->_isForegroundBundle;
}

- (void)setHasEntitySearchBundleScore:(BOOL)a3
{
  self->_hasEntitySearchBundleScore = a3;
}

- (BOOL)hasEntitySearchBundleScore
{
  return self->_hasEntitySearchBundleScore;
}

- (double)entitySearchBundleScore
{
  return self->_entitySearchBundleScore;
}

- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3
{
  self->_hasEntitySearchBundleRecencyS = a3;
}

- (BOOL)hasEntitySearchBundleRecencyS
{
  return self->_hasEntitySearchBundleRecencyS;
}

- (double)entitySearchBundleRecencyS
{
  return self->_entitySearchBundleRecencyS;
}

- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3
{
  self->_hasCompoundMediaTypeBundleScore = a3;
}

- (BOOL)hasCompoundMediaTypeBundleScore
{
  return self->_hasCompoundMediaTypeBundleScore;
}

- (double)compoundMediaTypeBundleScore
{
  return self->_compoundMediaTypeBundleScore;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  self->_hasCompoundActiveBundleScore = a3;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return self->_hasCompoundActiveBundleScore;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3
{
  self->_hasIsClientForegroundActiveBundle = a3;
}

- (BOOL)hasIsClientForegroundActiveBundle
{
  return self->_hasIsClientForegroundActiveBundle;
}

- (BOOL)isClientForegroundActiveBundle
{
  return self->_isClientForegroundActiveBundle;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v80 = 0;
    goto LABEL_255;
  }
  id v5 = v4;
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsClientForegroundActiveBundle](self, "hasIsClientForegroundActiveBundle")|| [v5 hasIsClientForegroundActiveBundle])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsClientForegroundActiveBundle])goto LABEL_252; {
    if (![v5 hasIsClientForegroundActiveBundle])
    }
      goto LABEL_252;
    int v6 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isClientForegroundActiveBundle];
    if (v6 != [v5 isClientForegroundActiveBundle]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundActiveBundleScore](self, "hasCompoundActiveBundleScore")|| [v5 hasCompoundActiveBundleScore])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasCompoundActiveBundleScore])goto LABEL_252; {
    if (![v5 hasCompoundActiveBundleScore])
    }
      goto LABEL_252;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundActiveBundleScore];
    double v8 = v7;
    [v5 compoundActiveBundleScore];
    if (v8 != v9) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasCompoundMediaTypeBundleScore](self, "hasCompoundMediaTypeBundleScore")|| [v5 hasCompoundMediaTypeBundleScore])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasCompoundMediaTypeBundleScore])goto LABEL_252; {
    if (![v5 hasCompoundMediaTypeBundleScore])
    }
      goto LABEL_252;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundMediaTypeBundleScore];
    double v11 = v10;
    [v5 compoundMediaTypeBundleScore];
    if (v11 != v12) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasEntitySearchBundleRecencyS](self, "hasEntitySearchBundleRecencyS")|| [v5 hasEntitySearchBundleRecencyS])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasEntitySearchBundleRecencyS])goto LABEL_252; {
    if (![v5 hasEntitySearchBundleRecencyS])
    }
      goto LABEL_252;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleRecencyS];
    double v14 = v13;
    [v5 entitySearchBundleRecencyS];
    if (v14 != v15) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasEntitySearchBundleScore]
    || [v5 hasEntitySearchBundleScore])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasEntitySearchBundleScore]) {
      goto LABEL_252;
    }
    if (![v5 hasEntitySearchBundleScore]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleScore];
    double v17 = v16;
    [v5 entitySearchBundleScore];
    if (v17 != v18) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsForegroundBundle]
    || [v5 hasIsForegroundBundle])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsForegroundBundle]) {
      goto LABEL_252;
    }
    if (![v5 hasIsForegroundBundle]) {
      goto LABEL_252;
    }
    int v19 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isForegroundBundle];
    if (v19 != [v5 isForegroundBundle]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundle]
    || [v5 hasIsNowPlayingBundle])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundle]) {
      goto LABEL_252;
    }
    if (![v5 hasIsNowPlayingBundle]) {
      goto LABEL_252;
    }
    int v20 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isNowPlayingBundle];
    if (v20 != [v5 isNowPlayingBundle]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleCount]
    || [v5 hasNowPlayingBundleCount])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleCount]) {
      goto LABEL_252;
    }
    if (![v5 hasNowPlayingBundleCount]) {
      goto LABEL_252;
    }
    int v21 = [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleCount];
    if (v21 != [v5 nowPlayingBundleCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleRecencyS]
    || [v5 hasNowPlayingBundleRecencyS])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleRecencyS])goto LABEL_252; {
    if (![v5 hasNowPlayingBundleRecencyS])
    }
      goto LABEL_252;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleRecencyS];
    double v23 = v22;
    [v5 nowPlayingBundleRecencyS];
    if (v23 != v24) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleScore]
    || [v5 hasNowPlayingBundleScore])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleScore]) {
      goto LABEL_252;
    }
    if (![v5 hasNowPlayingBundleScore]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleScore];
    double v26 = v25;
    [v5 nowPlayingBundleScore];
    if (v26 != v27) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingLastBundle]
    || [v5 hasIsNowPlayingLastBundle])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingLastBundle]) {
      goto LABEL_252;
    }
    if (![v5 hasIsNowPlayingLastBundle]) {
      goto LABEL_252;
    }
    int v28 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isNowPlayingLastBundle];
    if (v28 != [v5 isNowPlayingLastBundle]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage1Day]
    || [v5 hasNowPlayingUsage1Day])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage1Day]) {
      goto LABEL_252;
    }
    if (![v5 hasNowPlayingUsage1Day]) {
      goto LABEL_252;
    }
    int v29 = [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingUsage1Day];
    if (v29 != [v5 nowPlayingUsage1Day]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage7Days]
    || [v5 hasNowPlayingUsage7Days])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage7Days]) {
      goto LABEL_252;
    }
    if (![v5 hasNowPlayingUsage7Days]) {
      goto LABEL_252;
    }
    int v30 = [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingUsage7Days];
    if (v30 != [v5 nowPlayingUsage7Days]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage14Days]
    || [v5 hasNowPlayingUsage14Days])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage14Days]) {
      goto LABEL_252;
    }
    if (![v5 hasNowPlayingUsage14Days]) {
      goto LABEL_252;
    }
    int v31 = [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingUsage14Days];
    if (v31 != [v5 nowPlayingUsage14Days]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawLastNowPlayingCoreDuet](self, "hasIsRawLastNowPlayingCoreDuet")|| [v5 hasIsRawLastNowPlayingCoreDuet])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawLastNowPlayingCoreDuet])goto LABEL_252; {
    if (![v5 hasIsRawLastNowPlayingCoreDuet])
    }
      goto LABEL_252;
    int v32 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawLastNowPlayingCoreDuet];
    if (v32 != [v5 isRawLastNowPlayingCoreDuet]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryAudiobookSignal](self, "hasIsRawMediaCategoryAudiobookSignal")|| [v5 hasIsRawMediaCategoryAudiobookSignal])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryAudiobookSignal])goto LABEL_252; {
    if (![v5 hasIsRawMediaCategoryAudiobookSignal])
    }
      goto LABEL_252;
    int v33 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawMediaCategoryAudiobookSignal];
    if (v33 != [v5 isRawMediaCategoryAudiobookSignal]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryMusicSignal](self, "hasIsRawMediaCategoryMusicSignal")|| [v5 hasIsRawMediaCategoryMusicSignal])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryMusicSignal])goto LABEL_252; {
    if (![v5 hasIsRawMediaCategoryMusicSignal])
    }
      goto LABEL_252;
    int v34 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawMediaCategoryMusicSignal];
    if (v34 != [v5 isRawMediaCategoryMusicSignal]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryPodcastSignal](self, "hasIsRawMediaCategoryPodcastSignal")|| [v5 hasIsRawMediaCategoryPodcastSignal])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryPodcastSignal])goto LABEL_252; {
    if (![v5 hasIsRawMediaCategoryPodcastSignal])
    }
      goto LABEL_252;
    int v35 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawMediaCategoryPodcastSignal];
    if (v35 != [v5 isRawMediaCategoryPodcastSignal]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryRadioSignal](self, "hasIsRawMediaCategoryRadioSignal")|| [v5 hasIsRawMediaCategoryRadioSignal])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryRadioSignal])goto LABEL_252; {
    if (![v5 hasIsRawMediaCategoryRadioSignal])
    }
      goto LABEL_252;
    int v36 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawMediaCategoryRadioSignal];
    if (v36 != [v5 isRawMediaCategoryRadioSignal]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsRawMediaCategoryVideoSignal](self, "hasIsRawMediaCategoryVideoSignal")|| [v5 hasIsRawMediaCategoryVideoSignal])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryVideoSignal])goto LABEL_252; {
    if (![v5 hasIsRawMediaCategoryVideoSignal])
    }
      goto LABEL_252;
    int v37 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRawMediaCategoryVideoSignal];
    if (v37 != [v5 isRawMediaCategoryVideoSignal]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalBook](self, "hasRawMediaTypeUsageSignalBook")|| [v5 hasRawMediaTypeUsageSignalBook])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalBook])goto LABEL_252; {
    if (![v5 hasRawMediaTypeUsageSignalBook])
    }
      goto LABEL_252;
    int v38 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalBook];
    if (v38 != [v5 rawMediaTypeUsageSignalBook]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusic](self, "hasRawMediaTypeUsageSignalMusic")|| [v5 hasRawMediaTypeUsageSignalMusic])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalMusic])goto LABEL_252; {
    if (![v5 hasRawMediaTypeUsageSignalMusic])
    }
      goto LABEL_252;
    int v39 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalMusic];
    if (v39 != [v5 rawMediaTypeUsageSignalMusic]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalPodcast](self, "hasRawMediaTypeUsageSignalPodcast")|| [v5 hasRawMediaTypeUsageSignalPodcast])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalPodcast])goto LABEL_252; {
    if (![v5 hasRawMediaTypeUsageSignalPodcast])
    }
      goto LABEL_252;
    int v40 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalPodcast];
    if (v40 != [v5 rawMediaTypeUsageSignalPodcast]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalVideo](self, "hasRawMediaTypeUsageSignalVideo")|| [v5 hasRawMediaTypeUsageSignalVideo])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalVideo])goto LABEL_252; {
    if (![v5 hasRawMediaTypeUsageSignalVideo])
    }
      goto LABEL_252;
    int v41 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalVideo];
    if (v41 != [v5 rawMediaTypeUsageSignalVideo]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet10Min](self, "hasRawNowPlayingCountCoreDuet10Min")|| [v5 hasRawNowPlayingCountCoreDuet10Min])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet10Min])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet10Min])
    }
      goto LABEL_252;
    int v42 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet10Min];
    if (v42 != [v5 rawNowPlayingCountCoreDuet10Min]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Day](self, "hasRawNowPlayingCountCoreDuet1Day")|| [v5 hasRawNowPlayingCountCoreDuet1Day])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet1Day])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet1Day])
    }
      goto LABEL_252;
    int v43 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet1Day];
    if (v43 != [v5 rawNowPlayingCountCoreDuet1Day]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet1Hr](self, "hasRawNowPlayingCountCoreDuet1Hr")|| [v5 hasRawNowPlayingCountCoreDuet1Hr])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet1Hr])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet1Hr])
    }
      goto LABEL_252;
    int v44 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet1Hr];
    if (v44 != [v5 rawNowPlayingCountCoreDuet1Hr]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet28Day](self, "hasRawNowPlayingCountCoreDuet28Day")|| [v5 hasRawNowPlayingCountCoreDuet28Day])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet28Day])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet28Day])
    }
      goto LABEL_252;
    int v45 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet28Day];
    if (v45 != [v5 rawNowPlayingCountCoreDuet28Day]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet2Min](self, "hasRawNowPlayingCountCoreDuet2Min")|| [v5 hasRawNowPlayingCountCoreDuet2Min])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet2Min])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet2Min])
    }
      goto LABEL_252;
    int v46 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet2Min];
    if (v46 != [v5 rawNowPlayingCountCoreDuet2Min]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet6Hr](self, "hasRawNowPlayingCountCoreDuet6Hr")|| [v5 hasRawNowPlayingCountCoreDuet6Hr])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet6Hr])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet6Hr])
    }
      goto LABEL_252;
    int v47 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet6Hr];
    if (v47 != [v5 rawNowPlayingCountCoreDuet6Hr]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawNowPlayingCountCoreDuet7Day](self, "hasRawNowPlayingCountCoreDuet7Day")|| [v5 hasRawNowPlayingCountCoreDuet7Day])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet7Day])goto LABEL_252; {
    if (![v5 hasRawNowPlayingCountCoreDuet7Day])
    }
      goto LABEL_252;
    int v48 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingCountCoreDuet7Day];
    if (v48 != [v5 rawNowPlayingCountCoreDuet7Day]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingRecencyCD]
    || [v5 hasRawNowPlayingRecencyCD])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingRecencyCD]) {
      goto LABEL_252;
    }
    if (![v5 hasRawNowPlayingRecencyCD]) {
      goto LABEL_252;
    }
    int v49 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawNowPlayingRecencyCD];
    if (v49 != [v5 rawNowPlayingRecencyCD]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawEntitySearchRecency]
    || [v5 hasRawEntitySearchRecency])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawEntitySearchRecency]) {
      goto LABEL_252;
    }
    if (![v5 hasRawEntitySearchRecency]) {
      goto LABEL_252;
    }
    int v50 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawEntitySearchRecency];
    if (v50 != [v5 rawEntitySearchRecency]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreBooks]
    || [v5 hasUsageScoreBooks])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreBooks]) {
      goto LABEL_252;
    }
    if (![v5 hasUsageScoreBooks]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreBooks];
    double v52 = v51;
    [v5 usageScoreBooks];
    if (v52 != v53) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreMusic]
    || [v5 hasUsageScoreMusic])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreMusic]) {
      goto LABEL_252;
    }
    if (![v5 hasUsageScoreMusic]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusic];
    double v55 = v54;
    [v5 usageScoreMusic];
    if (v55 != v56) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScorePodcasts]
    || [v5 hasUsageScorePodcasts])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScorePodcasts]) {
      goto LABEL_252;
    }
    if (![v5 hasUsageScorePodcasts]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScorePodcasts];
    double v58 = v57;
    [v5 usageScorePodcasts];
    if (v58 != v59) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsAppFirstParty]
    || [v5 hasIsAppFirstParty])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsAppFirstParty]) {
      goto LABEL_252;
    }
    if (![v5 hasIsAppFirstParty]) {
      goto LABEL_252;
    }
    int v60 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isAppFirstParty];
    if (v60 != [v5 isAppFirstParty]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRequestedApp]
    || [v5 hasIsRequestedApp])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRequestedApp]) {
      goto LABEL_252;
    }
    if (![v5 hasIsRequestedApp]) {
      goto LABEL_252;
    }
    int v61 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isRequestedApp];
    if (v61 != [v5 isRequestedApp]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE1]
    || [v5 hasIsNowPlayingBundlePSE1])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE1]) {
      goto LABEL_252;
    }
    if (![v5 hasIsNowPlayingBundlePSE1]) {
      goto LABEL_252;
    }
    int v62 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isNowPlayingBundlePSE1];
    if (v62 != [v5 isNowPlayingBundlePSE1]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE2]
    || [v5 hasIsNowPlayingBundlePSE2])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE2]) {
      goto LABEL_252;
    }
    if (![v5 hasIsNowPlayingBundlePSE2]) {
      goto LABEL_252;
    }
    int v63 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isNowPlayingBundlePSE2];
    if (v63 != [v5 isNowPlayingBundlePSE2]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasVq21Score]
    || [v5 hasVq21Score])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasVq21Score]) {
      goto LABEL_252;
    }
    if (![v5 hasVq21Score]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self vq21Score];
    double v65 = v64;
    [v5 vq21Score];
    if (v65 != v66) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsSupportedFlag]
    || [v5 hasIsSupportedFlag])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsSupportedFlag]) {
      goto LABEL_252;
    }
    if (![v5 hasIsSupportedFlag]) {
      goto LABEL_252;
    }
    int v67 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isSupportedFlag];
    if (v67 != [v5 isSupportedFlag]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsUnicornFlag]
    || [v5 hasIsUnicornFlag])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsUnicornFlag]) {
      goto LABEL_252;
    }
    if (![v5 hasIsUnicornFlag]) {
      goto LABEL_252;
    }
    int v68 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isUnicornFlag];
    if (v68 != [v5 isUnicornFlag]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsSupportedUnicornMatchFlag](self, "hasIsSupportedUnicornMatchFlag")|| [v5 hasIsSupportedUnicornMatchFlag])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsSupportedUnicornMatchFlag])goto LABEL_252; {
    if (![v5 hasIsSupportedUnicornMatchFlag])
    }
      goto LABEL_252;
    int v69 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isSupportedUnicornMatchFlag];
    if (v69 != [v5 isSupportedUnicornMatchFlag]) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasIsDisambiguationSelectedApp](self, "hasIsDisambiguationSelectedApp")|| [v5 hasIsDisambiguationSelectedApp])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsDisambiguationSelectedApp])goto LABEL_252; {
    if (![v5 hasIsDisambiguationSelectedApp])
    }
      goto LABEL_252;
    int v70 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isDisambiguationSelectedApp];
    if (v70 != [v5 isDisambiguationSelectedApp]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsModelPredictedApp]
    || [v5 hasIsModelPredictedApp])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsModelPredictedApp]) {
      goto LABEL_252;
    }
    if (![v5 hasIsModelPredictedApp]) {
      goto LABEL_252;
    }
    int v71 = [(BMSiriMusicInferenceTrainingDependentSignals *)self isModelPredictedApp];
    if (v71 != [v5 isModelPredictedApp]) {
      goto LABEL_252;
    }
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreRadio]
    || [v5 hasUsageScoreRadio])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreRadio]) {
      goto LABEL_252;
    }
    if (![v5 hasUsageScoreRadio]) {
      goto LABEL_252;
    }
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreRadio];
    double v73 = v72;
    [v5 usageScoreRadio];
    if (v73 != v74) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasUsageScoreMusicWithoutRadio](self, "hasUsageScoreMusicWithoutRadio")|| [v5 hasUsageScoreMusicWithoutRadio])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreMusicWithoutRadio])goto LABEL_252; {
    if (![v5 hasUsageScoreMusicWithoutRadio])
    }
      goto LABEL_252;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusicWithoutRadio];
    double v76 = v75;
    [v5 usageScoreMusicWithoutRadio];
    if (v76 != v77) {
      goto LABEL_252;
    }
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalRadio](self, "hasRawMediaTypeUsageSignalRadio")|| [v5 hasRawMediaTypeUsageSignalRadio])
  {
    if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalRadio])goto LABEL_252; {
    if (![v5 hasRawMediaTypeUsageSignalRadio])
    }
      goto LABEL_252;
    int v78 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalRadio];
    if (v78 != [v5 rawMediaTypeUsageSignalRadio]) {
      goto LABEL_252;
    }
  }
  if (!-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusicWithoutRadio](self, "hasRawMediaTypeUsageSignalMusicWithoutRadio")&& ![v5 hasRawMediaTypeUsageSignalMusicWithoutRadio])
  {
    BOOL v80 = 1;
    goto LABEL_253;
  }
  if (-[BMSiriMusicInferenceTrainingDependentSignals hasRawMediaTypeUsageSignalMusicWithoutRadio](self, "hasRawMediaTypeUsageSignalMusicWithoutRadio")&& [v5 hasRawMediaTypeUsageSignalMusicWithoutRadio])
  {
    int v79 = [(BMSiriMusicInferenceTrainingDependentSignals *)self rawMediaTypeUsageSignalMusicWithoutRadio];
    BOOL v80 = v79 == [v5 rawMediaTypeUsageSignalMusicWithoutRadio];
  }
  else
  {
LABEL_252:
    BOOL v80 = 0;
  }
LABEL_253:

LABEL_255:
  return v80;
}

- (id)jsonDictionary
{
  v183[50] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsClientForegroundActiveBundle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasCompoundActiveBundleScore]|| ([(BMSiriMusicInferenceTrainingDependentSignals *)self compoundActiveBundleScore], fabs(v4) == INFINITY))
  {
    id v6 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundActiveBundleScore];
    id v5 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundActiveBundleScore];
    objc_msgSend(v5, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasCompoundMediaTypeBundleScore]|| ([(BMSiriMusicInferenceTrainingDependentSignals *)self compoundMediaTypeBundleScore], fabs(v7) == INFINITY))
  {
    id v9 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundMediaTypeBundleScore];
    double v8 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundMediaTypeBundleScore];
    objc_msgSend(v8, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasEntitySearchBundleRecencyS]|| ([(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleRecencyS], fabs(v10) == INFINITY))
  {
    id v12 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleRecencyS];
    double v11 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleRecencyS];
    objc_msgSend(v11, "numberWithDouble:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasEntitySearchBundleScore]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleScore],
        fabs(v13) == INFINITY))
  {
    id v15 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleScore];
    double v14 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleScore];
    objc_msgSend(v14, "numberWithDouble:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsForegroundBundle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
    id v141 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v141 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleRecencyS]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleRecencyS],
        fabs(v18) == INFINITY))
  {
    id v140 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleRecencyS];
    int v19 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleRecencyS];
    objc_msgSend(v19, "numberWithDouble:");
    id v140 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingBundleScore]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleScore],
        fabs(v20) == INFINITY))
  {
    id v181 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleScore];
    int v21 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleScore];
    objc_msgSend(v21, "numberWithDouble:");
    id v181 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingLastBundle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
    id v180 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v180 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage1Day])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
    id v179 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v179 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage7Days])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
    id v178 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v178 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasNowPlayingUsage14Days])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
    id v177 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v177 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawLastNowPlayingCoreDuet])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
    id v176 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v176 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryAudiobookSignal])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
    id v175 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v175 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryMusicSignal])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
    id v174 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v174 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryPodcastSignal])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
    id v173 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v173 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryRadioSignal])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
    id v172 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v172 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRawMediaCategoryVideoSignal])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
    id v171 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v171 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalBook])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
    id v170 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v170 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalMusic])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
    id v169 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v169 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalPodcast])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
    id v168 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v168 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalVideo])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
    id v167 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v167 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet10Min])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
    id v166 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v166 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet1Day])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
    id v165 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v165 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet1Hr])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
    id v164 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v164 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet28Day])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
    id v163 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v163 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet2Min])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
    id v162 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v162 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet6Hr])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
    id v161 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v161 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingCountCoreDuet7Day])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
    id v160 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v160 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawNowPlayingRecencyCD])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
    id v159 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v159 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawEntitySearchRecency])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
    id v158 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v158 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreBooks]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreBooks], fabs(v22) == INFINITY))
  {
    id v157 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreBooks];
    double v23 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreBooks];
    objc_msgSend(v23, "numberWithDouble:");
    id v157 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreMusic]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusic], fabs(v24) == INFINITY))
  {
    id v156 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusic];
    double v25 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusic];
    objc_msgSend(v25, "numberWithDouble:");
    id v156 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScorePodcasts]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self usageScorePodcasts],
        fabs(v26) == INFINITY))
  {
    id v155 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScorePodcasts];
    double v27 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScorePodcasts];
    objc_msgSend(v27, "numberWithDouble:");
    id v155 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsAppFirstParty])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
    id v154 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v154 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsRequestedApp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
    id v153 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v153 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE1])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
    id v152 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v152 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsNowPlayingBundlePSE2])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
    id v151 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v151 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasVq21Score]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self vq21Score], fabs(v28) == INFINITY))
  {
    id v150 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self vq21Score];
    int v29 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self vq21Score];
    objc_msgSend(v29, "numberWithDouble:");
    id v150 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsSupportedFlag])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
    id v149 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v149 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsUnicornFlag])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
    id v148 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v148 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsSupportedUnicornMatchFlag])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
    id v147 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v147 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsDisambiguationSelectedApp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
    id v146 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v146 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasIsModelPredictedApp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
    id v145 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v145 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreRadio]
    || ([(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreRadio], fabs(v30) == INFINITY))
  {
    id v144 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreRadio];
    int v31 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreRadio];
    objc_msgSend(v31, "numberWithDouble:");
    id v144 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriMusicInferenceTrainingDependentSignals *)self hasUsageScoreMusicWithoutRadio]|| ([(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusicWithoutRadio], fabs(v32) == INFINITY))
  {
    id v143 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusicWithoutRadio];
    int v33 = NSNumber;
    [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusicWithoutRadio];
    objc_msgSend(v33, "numberWithDouble:");
    id v143 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalRadio])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
    id v142 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v142 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingDependentSignals *)self hasRawMediaTypeUsageSignalMusicWithoutRadio])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
    id v139 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v139 = 0;
  }
  v182[0] = @"isClientForegroundActiveBundle";
  uint64_t v34 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v133 = (void *)v34;
  v183[0] = v34;
  v182[1] = @"compoundActiveBundleScore";
  uint64_t v35 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v132 = (void *)v35;
  v183[1] = v35;
  v182[2] = @"compoundMediaTypeBundleScore";
  uint64_t v36 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v131 = (void *)v36;
  v183[2] = v36;
  v182[3] = @"entitySearchBundleRecencyS";
  uint64_t v37 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v130 = (void *)v37;
  v183[3] = v37;
  v182[4] = @"entitySearchBundleScore";
  uint64_t v38 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v129 = (void *)v38;
  v183[4] = v38;
  v182[5] = @"isForegroundBundle";
  uint64_t v39 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v128 = (void *)v39;
  v183[5] = v39;
  v182[6] = @"isNowPlayingBundle";
  uint64_t v40 = (uint64_t)v17;
  if (!v17)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v135 = v17;
  v127 = (void *)v40;
  v183[6] = v40;
  v182[7] = @"nowPlayingBundleCount";
  uint64_t v41 = (uint64_t)v141;
  if (!v141)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  int v42 = v15;
  v126 = (void *)v41;
  v183[7] = v41;
  v182[8] = @"nowPlayingBundleRecencyS";
  uint64_t v43 = (uint64_t)v140;
  if (!v140)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  id v44 = v12;
  v125 = (void *)v43;
  v183[8] = v43;
  v182[9] = @"nowPlayingBundleScore";
  int v45 = v181;
  if (!v181)
  {
    int v45 = [MEMORY[0x1E4F1CA98] null];
  }
  id v46 = v3;
  v183[9] = v45;
  v182[10] = @"isNowPlayingLastBundle";
  uint64_t v47 = (uint64_t)v180;
  if (!v180)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[10] = v47;
  v182[11] = @"nowPlayingUsage1Day";
  uint64_t v48 = (uint64_t)v179;
  if (!v179)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[11] = v48;
  v182[12] = @"nowPlayingUsage7Days";
  uint64_t v49 = (uint64_t)v178;
  if (!v178)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  int v50 = (void *)v49;
  v183[12] = v49;
  v182[13] = @"nowPlayingUsage14Days";
  uint64_t v51 = (uint64_t)v177;
  if (!v177)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v122 = (void *)v51;
  v183[13] = v51;
  v182[14] = @"isRawLastNowPlayingCoreDuet";
  uint64_t v52 = (uint64_t)v176;
  if (!v176)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v121 = (void *)v52;
  v183[14] = v52;
  v182[15] = @"isRawMediaCategoryAudiobookSignal";
  uint64_t v53 = (uint64_t)v175;
  if (!v175)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v120 = (void *)v53;
  v183[15] = v53;
  v182[16] = @"isRawMediaCategoryMusicSignal";
  uint64_t v54 = (uint64_t)v174;
  if (!v174)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v119 = (void *)v54;
  v183[16] = v54;
  v182[17] = @"isRawMediaCategoryPodcastSignal";
  uint64_t v55 = (uint64_t)v173;
  if (!v173)
  {
    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v118 = (void *)v55;
  v183[17] = v55;
  v182[18] = @"isRawMediaCategoryRadioSignal";
  uint64_t v56 = (uint64_t)v172;
  if (!v172)
  {
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v56;
  v183[18] = v56;
  v182[19] = @"isRawMediaCategoryVideoSignal";
  uint64_t v57 = (uint64_t)v171;
  if (!v171)
  {
    uint64_t v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v57;
  v183[19] = v57;
  v182[20] = @"rawMediaTypeUsageSignalBook";
  uint64_t v58 = (uint64_t)v170;
  if (!v170)
  {
    uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v115 = (void *)v58;
  v183[20] = v58;
  v182[21] = @"rawMediaTypeUsageSignalMusic";
  uint64_t v59 = (uint64_t)v169;
  if (!v169)
  {
    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v59;
  v183[21] = v59;
  v182[22] = @"rawMediaTypeUsageSignalPodcast";
  uint64_t v60 = (uint64_t)v168;
  if (!v168)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = (void *)v60;
  v183[22] = v60;
  v182[23] = @"rawMediaTypeUsageSignalVideo";
  uint64_t v61 = (uint64_t)v167;
  if (!v167)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = (void *)v61;
  v183[23] = v61;
  v182[24] = @"rawNowPlayingCountCoreDuet10Min";
  uint64_t v62 = (uint64_t)v166;
  if (!v166)
  {
    uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v111 = (void *)v62;
  v183[24] = v62;
  v182[25] = @"rawNowPlayingCountCoreDuet1Day";
  uint64_t v63 = (uint64_t)v165;
  if (!v165)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v63;
  v183[25] = v63;
  v182[26] = @"rawNowPlayingCountCoreDuet1Hr";
  uint64_t v64 = (uint64_t)v164;
  if (!v164)
  {
    uint64_t v64 = [MEMORY[0x1E4F1CA98] null];
  }
  v109 = (void *)v64;
  v183[26] = v64;
  v182[27] = @"rawNowPlayingCountCoreDuet28Day";
  uint64_t v65 = (uint64_t)v163;
  if (!v163)
  {
    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v65;
  v183[27] = v65;
  v182[28] = @"rawNowPlayingCountCoreDuet2Min";
  uint64_t v66 = (uint64_t)v162;
  if (!v162)
  {
    uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = (void *)v66;
  v183[28] = v66;
  v182[29] = @"rawNowPlayingCountCoreDuet6Hr";
  uint64_t v67 = (uint64_t)v161;
  if (!v161)
  {
    uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
  }
  v106 = (void *)v67;
  v183[29] = v67;
  v182[30] = @"rawNowPlayingCountCoreDuet7Day";
  uint64_t v68 = (uint64_t)v160;
  if (!v160)
  {
    uint64_t v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v68;
  v183[30] = v68;
  v182[31] = @"rawNowPlayingRecencyCD";
  uint64_t v69 = (uint64_t)v159;
  if (!v159)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
  }
  v104 = (void *)v69;
  v183[31] = v69;
  v182[32] = @"rawEntitySearchRecency";
  uint64_t v70 = (uint64_t)v158;
  if (!v158)
  {
    uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v103 = (void *)v70;
  v183[32] = v70;
  v182[33] = @"usageScoreBooks";
  uint64_t v71 = (uint64_t)v157;
  if (!v157)
  {
    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = (void *)v71;
  v183[33] = v71;
  v182[34] = @"usageScoreMusic";
  uint64_t v72 = (uint64_t)v156;
  if (!v156)
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v72;
  v183[34] = v72;
  v182[35] = @"usageScorePodcasts";
  uint64_t v73 = (uint64_t)v155;
  if (!v155)
  {
    uint64_t v73 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v73;
  v183[35] = v73;
  v182[36] = @"isAppFirstParty";
  uint64_t v74 = (uint64_t)v154;
  if (!v154)
  {
    uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v74;
  v183[36] = v74;
  v182[37] = @"isRequestedApp";
  uint64_t v75 = (uint64_t)v153;
  if (!v153)
  {
    uint64_t v75 = [MEMORY[0x1E4F1CA98] null];
  }
  v98 = (void *)v75;
  v183[37] = v75;
  v182[38] = @"isNowPlayingBundlePSE1";
  uint64_t v76 = (uint64_t)v152;
  if (!v152)
  {
    uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v76;
  v183[38] = v76;
  v182[39] = @"isNowPlayingBundlePSE2";
  uint64_t v77 = (uint64_t)v151;
  if (!v151)
  {
    uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
  }
  v138 = v9;
  v96 = (void *)v77;
  v183[39] = v77;
  v182[40] = @"vq21Score";
  uint64_t v78 = (uint64_t)v150;
  if (!v150)
  {
    uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v78;
  v183[40] = v78;
  v182[41] = @"isSupportedFlag";
  uint64_t v79 = (uint64_t)v149;
  if (!v149)
  {
    uint64_t v79 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)v79;
  v183[41] = v79;
  v182[42] = @"isUnicornFlag";
  uint64_t v80 = (uint64_t)v148;
  if (!v148)
  {
    uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
  }
  v123 = (void *)v48;
  v93 = (void *)v80;
  v183[42] = v80;
  v182[43] = @"isSupportedUnicornMatchFlag";
  uint64_t v81 = (uint64_t)v147;
  if (!v147)
  {
    uint64_t v81 = [MEMORY[0x1E4F1CA98] null];
  }
  v137 = v16;
  v92 = (void *)v81;
  v183[43] = v81;
  v182[44] = @"isDisambiguationSelectedApp";
  uint64_t v82 = (uint64_t)v146;
  v83 = v46;
  if (!v146)
  {
    uint64_t v82 = [MEMORY[0x1E4F1CA98] null];
  }
  v124 = (void *)v47;
  v91 = (void *)v82;
  v183[44] = v82;
  v182[45] = @"isModelPredictedApp";
  v84 = v145;
  if (!v145)
  {
    v84 = [MEMORY[0x1E4F1CA98] null];
  }
  v136 = v44;
  v183[45] = v84;
  v182[46] = @"usageScoreRadio";
  v85 = v144;
  if (!v144)
  {
    v85 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[46] = v85;
  v182[47] = @"usageScoreMusicWithoutRadio";
  v86 = v143;
  if (!v143)
  {
    v86 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[47] = v86;
  v182[48] = @"rawMediaTypeUsageSignalRadio";
  v87 = v142;
  if (!v142)
  {
    v87 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[48] = v87;
  v182[49] = @"rawMediaTypeUsageSignalMusicWithoutRadio";
  v88 = v139;
  if (!v139)
  {
    v88 = [MEMORY[0x1E4F1CA98] null];
  }
  v183[49] = v88;
  id v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:v182 count:50];
  if (!v139) {

  }
  v89 = v50;
  if (!v142)
  {

    v89 = v50;
  }
  if (!v143)
  {

    v89 = v50;
  }
  if (!v144)
  {

    v89 = v50;
  }
  if (!v145)
  {

    v89 = v50;
  }
  if (!v146)
  {

    v89 = v50;
  }
  if (!v147)
  {

    v89 = v50;
  }
  if (!v148)
  {

    v89 = v50;
  }
  if (!v149)
  {

    v89 = v50;
  }
  if (!v150)
  {

    v89 = v50;
  }
  if (!v151)
  {

    v89 = v50;
  }
  if (!v152)
  {

    v89 = v50;
  }
  if (!v153)
  {

    v89 = v50;
  }
  if (!v154)
  {

    v89 = v50;
  }
  if (!v155)
  {

    v89 = v50;
  }
  if (!v156)
  {

    v89 = v50;
  }
  if (!v157)
  {

    v89 = v50;
  }
  if (!v158)
  {

    v89 = v50;
  }
  if (!v159)
  {

    v89 = v50;
  }
  if (!v160)
  {

    v89 = v50;
  }
  if (!v161)
  {

    v89 = v50;
  }
  if (!v162)
  {

    v89 = v50;
  }
  if (!v163)
  {

    v89 = v50;
  }
  if (!v164)
  {

    v89 = v50;
  }
  if (!v165)
  {

    v89 = v50;
  }
  if (!v166)
  {

    v89 = v50;
  }
  if (!v167)
  {

    v89 = v50;
  }
  if (!v168)
  {

    v89 = v50;
  }
  if (!v169)
  {

    v89 = v50;
  }
  if (!v170)
  {

    v89 = v50;
  }
  if (!v171)
  {

    v89 = v50;
  }
  if (!v172)
  {

    v89 = v50;
  }
  if (!v173)
  {

    v89 = v50;
  }
  if (!v174)
  {

    v89 = v50;
  }
  if (!v175)
  {

    v89 = v50;
  }
  if (!v176)
  {

    v89 = v50;
  }
  if (!v177)
  {

    v89 = v50;
  }
  if (!v178) {

  }
  if (!v179) {
  if (!v180)
  }

  if (v181)
  {
    if (v140) {
      goto LABEL_345;
    }
  }
  else
  {

    if (v140)
    {
LABEL_345:
      if (v141) {
        goto LABEL_346;
      }
      goto LABEL_358;
    }
  }

  if (v141)
  {
LABEL_346:
    if (v135) {
      goto LABEL_347;
    }
    goto LABEL_359;
  }
LABEL_358:

  if (v135)
  {
LABEL_347:
    if (v137) {
      goto LABEL_348;
    }
    goto LABEL_360;
  }
LABEL_359:

  if (v137)
  {
LABEL_348:
    if (v42) {
      goto LABEL_349;
    }
    goto LABEL_361;
  }
LABEL_360:

  if (v42)
  {
LABEL_349:
    if (v136) {
      goto LABEL_350;
    }
    goto LABEL_362;
  }
LABEL_361:

  if (v136)
  {
LABEL_350:
    if (v138) {
      goto LABEL_351;
    }
    goto LABEL_363;
  }
LABEL_362:

  if (v138)
  {
LABEL_351:
    if (v6) {
      goto LABEL_352;
    }
LABEL_364:

    if (v83) {
      goto LABEL_353;
    }
    goto LABEL_365;
  }
LABEL_363:

  if (!v6) {
    goto LABEL_364;
  }
LABEL_352:
  if (v83) {
    goto LABEL_353;
  }
LABEL_365:

LABEL_353:

  return v134;
}

- (BMSiriMusicInferenceTrainingDependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v711[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"isClientForegroundActiveBundle"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v611 = [v6 objectForKeyedSubscript:@"compoundActiveBundleScore"];
    if (!v611 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v610 = v8;
      id v9 = a4;
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v610 = v8;
      id v9 = a4;
      id v10 = v611;
LABEL_7:
      double v11 = [v6 objectForKeyedSubscript:@"compoundMediaTypeBundleScore"];
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v607 = v10;
        id v12 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v607 = v10;
        id v12 = v11;
LABEL_10:
        double v13 = [v6 objectForKeyedSubscript:@"entitySearchBundleRecencyS"];
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v601 = v13;
          id v608 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v601 = v13;
          id v608 = v13;
LABEL_13:
          uint64_t v14 = [v6 objectForKeyedSubscript:@"entitySearchBundleScore"];
          v604 = (void *)v14;
          if (!v14 || (id v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v602 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v602 = v15;
LABEL_16:
            uint64_t v16 = [v6 objectForKeyedSubscript:@"isForegroundBundle"];
            v600 = (void *)v16;
            if (!v16 || (id v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v557 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v557 = v17;
LABEL_19:
              uint64_t v18 = [v6 objectForKeyedSubscript:@"isNowPlayingBundle"];
              v599 = (void *)v18;
              if (!v18 || (int v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v597 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v597 = v19;
LABEL_22:
                uint64_t v20 = [v6 objectForKeyedSubscript:@"nowPlayingBundleCount"];
                v556 = (void *)v20;
                if (!v20 || (int v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v552 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v552 = v21;
LABEL_25:
                  uint64_t v22 = [v6 objectForKeyedSubscript:@"nowPlayingBundleRecencyS"];
                  v551 = (void *)v22;
                  if (!v22 || (double v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v24 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v24 = v23;
LABEL_28:
                    uint64_t v25 = [v6 objectForKeyedSubscript:@"nowPlayingBundleScore"];
                    v549 = (void *)v25;
                    if (!v25 || (double v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v544 = 0;
LABEL_31:
                      uint64_t v27 = [v6 objectForKeyedSubscript:@"isNowPlayingLastBundle"];
                      v547 = (void *)v27;
                      if (v27 && (double v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v9)
                          {
                            id v545 = 0;
                            uint64_t v38 = 0;
                            uint64_t v48 = v601;
                            id v8 = v610;
LABEL_455:
                            id v157 = v544;
                            goto LABEL_456;
                          }
                          id v169 = v9;
                          id v546 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v564 = v12;
                          uint64_t v170 = *MEMORY[0x1E4F502C8];
                          uint64_t v690 = *MEMORY[0x1E4F28568];
                          id v171 = [NSString alloc];
                          uint64_t v434 = objc_opt_class();
                          id v172 = v171;
                          id v8 = v610;
                          uint64_t v173 = [v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v434, @"isNowPlayingLastBundle"];
                          uint64_t v691 = v173;
                          uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v691 forKeys:&v690 count:1];
                          uint64_t v175 = v170;
                          id v12 = v564;
                          v543 = (void *)v174;
                          id v176 = (id)objc_msgSend(v546, "initWithDomain:code:userInfo:", v175, 2);
                          uint64_t v38 = 0;
                          id v545 = 0;
                          *id v169 = v176;
                          id v177 = (void *)v173;
                          uint64_t v48 = v601;
                          goto LABEL_454;
                        }
                        id v545 = v28;
                      }
                      else
                      {
                        id v545 = 0;
                      }
                      uint64_t v29 = [v6 objectForKeyedSubscript:@"nowPlayingUsage1Day"];
                      id v540 = v24;
                      v543 = (void *)v29;
                      if (!v29 || (double v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        int v31 = 0;
LABEL_37:
                        double v32 = [v6 objectForKeyedSubscript:@"nowPlayingUsage7Days"];
                        v539 = v31;
                        v541 = v32;
                        if (!v32) {
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          double v32 = 0;
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          double v32 = v32;
LABEL_85:
                          uint64_t v89 = [v6 objectForKeyedSubscript:@"nowPlayingUsage14Days"];
                          v537 = v32;
                          v538 = (void *)v89;
                          if (!v89 || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v535 = 0;
                            goto LABEL_88;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v535 = v90;
LABEL_88:
                            uint64_t v91 = [v6 objectForKeyedSubscript:@"isRawLastNowPlayingCoreDuet"];
                            v536 = (void *)v91;
                            if (!v91 || (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v533 = 0;
                              goto LABEL_91;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v533 = v92;
LABEL_91:
                              uint64_t v93 = [v6 objectForKeyedSubscript:@"isRawMediaCategoryAudiobookSignal"];
                              v534 = (void *)v93;
                              if (!v93 || (v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v532 = 0;
LABEL_94:
                                uint64_t v95 = [v6 objectForKeyedSubscript:@"isRawMediaCategoryMusicSignal"];
                                v531 = (void *)v95;
                                if (v95 && (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v9)
                                    {
                                      id v530 = 0;
                                      uint64_t v38 = 0;
                                      uint64_t v48 = v601;
                                      id v8 = v610;
LABEL_448:
                                      v197 = v533;
                                      goto LABEL_449;
                                    }
                                    v214 = v9;
                                    id v215 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v570 = v12;
                                    uint64_t v216 = *MEMORY[0x1E4F502C8];
                                    uint64_t v678 = *MEMORY[0x1E4F28568];
                                    id v217 = [NSString alloc];
                                    uint64_t v440 = objc_opt_class();
                                    v218 = v217;
                                    id v8 = v610;
                                    v219 = (void *)[v218 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v440, @"isRawMediaCategoryMusicSignal"];
                                    v679 = v219;
                                    uint64_t v220 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v679 forKeys:&v678 count:1];
                                    uint64_t v221 = v216;
                                    id v12 = v570;
                                    v529 = (void *)v220;
                                    uint64_t v38 = 0;
                                    id v530 = 0;
                                    id *v214 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v221, 2);
                                    uint64_t v48 = v601;
                                    goto LABEL_267;
                                  }
                                  id v530 = v96;
                                }
                                else
                                {
                                  id v530 = 0;
                                }
                                uint64_t v97 = [v6 objectForKeyedSubscript:@"isRawMediaCategoryPodcastSignal"];
                                v529 = (void *)v97;
                                if (!v97 || (v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v526 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v526 = v98;
LABEL_100:
                                  uint64_t v99 = [v6 objectForKeyedSubscript:@"isRawMediaCategoryRadioSignal"];
                                  v528 = (void *)v99;
                                  if (!v99
                                    || (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v527 = 0;
                                    goto LABEL_103;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v527 = v100;
LABEL_103:
                                    uint64_t v101 = [v6 objectForKeyedSubscript:@"isRawMediaCategoryVideoSignal"];
                                    v525 = (void *)v101;
                                    if (!v101
                                      || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v524 = 0;
                                      goto LABEL_106;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v524 = v102;
LABEL_106:
                                      uint64_t v103 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalBook"];
                                      v523 = (void *)v103;
                                      if (!v103
                                        || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v522 = 0;
                                        goto LABEL_109;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v522 = v104;
LABEL_109:
                                        uint64_t v105 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalMusic"];
                                        v521 = (void *)v105;
                                        if (!v105
                                          || (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v520 = 0;
LABEL_112:
                                          uint64_t v107 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalPodcast"];
                                          v518 = (void *)v107;
                                          if (v107
                                            && (v108 = (void *)v107,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) == 0))
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v9)
                                              {
                                                id v517 = 0;
                                                uint64_t v38 = 0;
                                                uint64_t v48 = v601;
                                                id v8 = v610;
LABEL_441:
                                                v219 = v526;
                                                goto LABEL_442;
                                              }
                                              v257 = v9;
                                              id v258 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v576 = v12;
                                              uint64_t v259 = *MEMORY[0x1E4F502C8];
                                              uint64_t v666 = *MEMORY[0x1E4F28568];
                                              id v260 = [NSString alloc];
                                              uint64_t v446 = objc_opt_class();
                                              v261 = v260;
                                              id v8 = v610;
                                              v262 = (void *)[v261 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v446, @"rawMediaTypeUsageSignalPodcast"];
                                              v667 = v262;
                                              uint64_t v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v667 forKeys:&v666 count:1];
                                              uint64_t v264 = v259;
                                              id v12 = v576;
                                              v516 = (void *)v263;
                                              uint64_t v38 = 0;
                                              id v517 = 0;
                                              id *v257 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v264, 2);
                                              uint64_t v48 = v601;
                                              goto LABEL_298;
                                            }
                                            id v517 = v108;
                                          }
                                          else
                                          {
                                            id v517 = 0;
                                          }
                                          uint64_t v109 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalVideo"];
                                          v516 = (void *)v109;
                                          if (!v109
                                            || (v110 = (void *)v109,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v519 = 0;
LABEL_118:
                                            uint64_t v111 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet10Min"];
                                            v515 = (void *)v111;
                                            if (v111
                                              && (v112 = (void *)v111,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v9)
                                                {
                                                  id v514 = 0;
                                                  uint64_t v38 = 0;
                                                  uint64_t v48 = v601;
                                                  id v8 = v610;
LABEL_438:
                                                  v262 = v519;
                                                  goto LABEL_439;
                                                }
                                                v272 = v9;
                                                id v273 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                id v578 = v12;
                                                uint64_t v274 = *MEMORY[0x1E4F502C8];
                                                uint64_t v662 = *MEMORY[0x1E4F28568];
                                                id v275 = [NSString alloc];
                                                uint64_t v448 = objc_opt_class();
                                                v276 = v275;
                                                id v8 = v610;
                                                v277 = (void *)[v276 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v448, @"rawNowPlayingCountCoreDuet10Min"];
                                                v663 = v277;
                                                uint64_t v278 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v663 forKeys:&v662 count:1];
                                                uint64_t v279 = v274;
                                                id v12 = v578;
                                                v513 = (void *)v278;
                                                uint64_t v38 = 0;
                                                id v514 = 0;
                                                id *v272 = (id)objc_msgSend(v273, "initWithDomain:code:userInfo:", v279, 2);
                                                uint64_t v48 = v601;
                                                goto LABEL_309;
                                              }
                                              id v514 = v112;
                                            }
                                            else
                                            {
                                              id v514 = 0;
                                            }
                                            uint64_t v113 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet1Day"];
                                            v513 = (void *)v113;
                                            if (!v113
                                              || (v114 = (void *)v113,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v510 = 0;
LABEL_124:
                                              uint64_t v115 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet1Hr"];
                                              v512 = (void *)v115;
                                              if (v115
                                                && (v116 = (void *)v115,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  if (!v9)
                                                  {
                                                    id v511 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
LABEL_435:
                                                    v277 = v510;
                                                    goto LABEL_436;
                                                  }
                                                  v287 = v9;
                                                  id v288 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v580 = v12;
                                                  uint64_t v289 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v658 = *MEMORY[0x1E4F28568];
                                                  id v290 = [NSString alloc];
                                                  uint64_t v450 = objc_opt_class();
                                                  v291 = v290;
                                                  id v8 = v610;
                                                  id v292 = v533;
                                                  id v508 = (id)[v291 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v450, @"rawNowPlayingCountCoreDuet1Hr"];
                                                  id v659 = v508;
                                                  uint64_t v293 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v659 forKeys:&v658 count:1];
                                                  uint64_t v294 = v289;
                                                  id v12 = v580;
                                                  v509 = (void *)v293;
                                                  uint64_t v38 = 0;
                                                  id v511 = 0;
                                                  id *v287 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v294, 2);
                                                  uint64_t v48 = v601;
                                                  double v32 = v537;
LABEL_434:
                                                  id v533 = v292;

                                                  goto LABEL_435;
                                                }
                                                id v511 = v116;
                                              }
                                              else
                                              {
                                                id v511 = 0;
                                              }
                                              uint64_t v117 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet28Day"];
                                              v509 = (void *)v117;
                                              if (v117
                                                && (v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  id v295 = v519;
                                                  if (!v9)
                                                  {
                                                    id v508 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
LABEL_433:
                                                    id v292 = v533;
                                                    goto LABEL_434;
                                                  }
                                                  v296 = v9;
                                                  id v297 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v581 = v12;
                                                  uint64_t v298 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v656 = *MEMORY[0x1E4F28568];
                                                  id v299 = [NSString alloc];
                                                  uint64_t v451 = objc_opt_class();
                                                  v300 = v299;
                                                  id v8 = v610;
                                                  id v506 = (id)[v300 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v451, @"rawNowPlayingCountCoreDuet28Day"];
                                                  id v657 = v506;
                                                  uint64_t v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v657 forKeys:&v656 count:1];
                                                  uint64_t v302 = v298;
                                                  id v12 = v581;
                                                  v507 = (void *)v301;
                                                  uint64_t v38 = 0;
                                                  id v508 = 0;
                                                  id *v296 = (id)objc_msgSend(v297, "initWithDomain:code:userInfo:", v302, 2);
                                                  uint64_t v48 = v601;
                                                  double v32 = v537;
                                                  goto LABEL_432;
                                                }
                                                id v508 = v118;
                                              }
                                              else
                                              {
                                                id v508 = 0;
                                              }
                                              uint64_t v119 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet2Min"];
                                              v507 = (void *)v119;
                                              if (!v119
                                                || (v120 = (void *)v119,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v506 = 0;
                                                goto LABEL_133;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v506 = v120;
LABEL_133:
                                                uint64_t v121 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet6Hr"];
                                                v505 = (void *)v121;
                                                if (!v121
                                                  || (v122 = (void *)v121,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v504 = 0;
                                                  goto LABEL_136;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v504 = v122;
LABEL_136:
                                                  uint64_t v123 = [v6 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet7Day"];
                                                  v503 = (void *)v123;
                                                  if (!v123
                                                    || (v124 = (void *)v123,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v502 = 0;
                                                    goto LABEL_139;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v502 = v124;
LABEL_139:
                                                    uint64_t v125 = [v6 objectForKeyedSubscript:@"rawNowPlayingRecencyCD"];
                                                    v501 = (void *)v125;
                                                    if (!v125
                                                      || (v126 = (void *)v125,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v500 = 0;
                                                      goto LABEL_142;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v500 = v126;
LABEL_142:
                                                      uint64_t v127 = [v6 objectForKeyedSubscript:@"rawEntitySearchRecency"];
                                                      v499 = (void *)v127;
                                                      if (!v127
                                                        || (v128 = (void *)v127,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v498 = 0;
LABEL_145:
                                                        uint64_t v129 = [v6 objectForKeyedSubscript:@"usageScoreBooks"];
                                                        v497 = (void *)v129;
                                                        if (v129
                                                          && (v130 = (void *)v129,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v496 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_426:
                                                              id v295 = v519;
                                                              goto LABEL_427;
                                                            }
                                                            v338 = v9;
                                                            id v339 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v587 = v12;
                                                            uint64_t v340 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v644 = *MEMORY[0x1E4F28568];
                                                            id v341 = [NSString alloc];
                                                            uint64_t v457 = objc_opt_class();
                                                            v342 = v341;
                                                            id v8 = v610;
                                                            id v495 = (id)[v342 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v457, @"usageScoreBooks"];
                                                            id v645 = v495;
                                                            v343 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v645 forKeys:&v644 count:1];
                                                            uint64_t v344 = v340;
                                                            id v12 = v587;
                                                            uint64_t v38 = 0;
                                                            id v496 = 0;
                                                            id *v338 = (id)[v339 initWithDomain:v344 code:2 userInfo:v343];
                                                            uint64_t v48 = v601;
                                                            double v32 = v537;
LABEL_425:

                                                            goto LABEL_426;
                                                          }
                                                          id v496 = v130;
                                                        }
                                                        else
                                                        {
                                                          id v496 = 0;
                                                        }
                                                        uint64_t v131 = [v6 objectForKeyedSubscript:@"usageScoreMusic"];
                                                        v494 = (void *)v131;
                                                        if (v131
                                                          && (v132 = (void *)v131,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v495 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_424:
                                                              v343 = v494;
                                                              goto LABEL_425;
                                                            }
                                                            v345 = v9;
                                                            id v346 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v588 = v12;
                                                            uint64_t v347 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v642 = *MEMORY[0x1E4F28568];
                                                            id v348 = [NSString alloc];
                                                            uint64_t v458 = objc_opt_class();
                                                            v349 = v348;
                                                            id v8 = v610;
                                                            id v493 = (id)[v349 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v458, @"usageScoreMusic"];
                                                            id v643 = v493;
                                                            v350 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v643 forKeys:&v642 count:1];
                                                            uint64_t v351 = v347;
                                                            id v12 = v588;
                                                            uint64_t v38 = 0;
                                                            id v495 = 0;
                                                            id *v345 = (id)[v346 initWithDomain:v351 code:2 userInfo:v350];
                                                            uint64_t v48 = v601;
                                                            double v32 = v537;
LABEL_423:

                                                            goto LABEL_424;
                                                          }
                                                          id v495 = v132;
                                                        }
                                                        else
                                                        {
                                                          id v495 = 0;
                                                        }
                                                        uint64_t v133 = [v6 objectForKeyedSubscript:@"usageScorePodcasts"];
                                                        v492 = (void *)v133;
                                                        if (v133
                                                          && (id v134 = (void *)v133,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v493 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_422:
                                                              v350 = v492;
                                                              goto LABEL_423;
                                                            }
                                                            v352 = v9;
                                                            id v353 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v589 = v12;
                                                            uint64_t v354 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v640 = *MEMORY[0x1E4F28568];
                                                            id v355 = [NSString alloc];
                                                            uint64_t v459 = objc_opt_class();
                                                            v356 = v355;
                                                            id v8 = v610;
                                                            id v357 = v519;
                                                            id v490 = (id)[v356 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v459, @"usageScorePodcasts"];
                                                            id v641 = v490;
                                                            uint64_t v358 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v641 forKeys:&v640 count:1];
                                                            uint64_t v359 = v354;
                                                            id v12 = v589;
                                                            v491 = (void *)v358;
                                                            uint64_t v38 = 0;
                                                            id v493 = 0;
                                                            id *v352 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v359, 2);
                                                            uint64_t v48 = v601;
                                                            goto LABEL_365;
                                                          }
                                                          id v493 = v134;
                                                        }
                                                        else
                                                        {
                                                          id v493 = 0;
                                                        }
                                                        uint64_t v135 = [v6 objectForKeyedSubscript:@"isAppFirstParty"];
                                                        v491 = (void *)v135;
                                                        if (!v135
                                                          || (v136 = (void *)v135,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v490 = 0;
LABEL_157:
                                                          uint64_t v137 = [v6 objectForKeyedSubscript:@"isRequestedApp"];
                                                          v488 = (void *)v137;
                                                          if (v137
                                                            && (v138 = (void *)v137,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              if (!v9)
                                                              {
                                                                id v489 = 0;
                                                                uint64_t v38 = 0;
                                                                uint64_t v48 = v601;
                                                                id v8 = v610;
LABEL_419:
                                                                id v357 = v519;
                                                                goto LABEL_420;
                                                              }
                                                              v367 = v9;
                                                              id v368 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              id v591 = v12;
                                                              uint64_t v369 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v636 = *MEMORY[0x1E4F28568];
                                                              id v370 = [NSString alloc];
                                                              uint64_t v461 = objc_opt_class();
                                                              v371 = v370;
                                                              id v8 = v610;
                                                              id v149 = (void *)[v371 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v461, @"isRequestedApp"];
                                                              v637 = v149;
                                                              uint64_t v372 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v637 forKeys:&v636 count:1];
                                                              uint64_t v373 = v369;
                                                              id v12 = v591;
                                                              v485 = (void *)v372;
                                                              uint64_t v38 = 0;
                                                              id v489 = 0;
                                                              id *v367 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                              uint64_t v48 = v601;
                                                              goto LABEL_376;
                                                            }
                                                            id v489 = v138;
                                                          }
                                                          else
                                                          {
                                                            id v489 = 0;
                                                          }
                                                          uint64_t v139 = [v6 objectForKeyedSubscript:@"isNowPlayingBundlePSE1"];
                                                          v485 = (void *)v139;
                                                          if (!v139
                                                            || (id v140 = (void *)v139,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v486 = 0;
                                                            goto LABEL_163;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v486 = v140;
LABEL_163:
                                                            uint64_t v141 = [v6 objectForKeyedSubscript:@"isNowPlayingBundlePSE2"];
                                                            v484 = (void *)v141;
                                                            if (!v141
                                                              || (id v142 = (void *)v141,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v487 = 0;
                                                              goto LABEL_166;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v487 = v142;
LABEL_166:
                                                              uint64_t v143 = [v6 objectForKeyedSubscript:@"vq21Score"];
                                                              v481 = (void *)v143;
                                                              if (!v143
                                                                || (id v144 = (void *)v143,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v482 = 0;
                                                                goto LABEL_169;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v482 = v144;
LABEL_169:
                                                                uint64_t v145 = [v6 objectForKeyedSubscript:@"isSupportedFlag"];
                                                                v480 = (void *)v145;
                                                                if (!v145
                                                                  || (id v146 = (void *)v145,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v483 = 0;
                                                                  goto LABEL_172;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v483 = v146;
LABEL_172:
                                                                  uint64_t v147 = [v6 objectForKeyedSubscript:@"isUnicornFlag"];
                                                                  v479 = (void *)v147;
                                                                  if (!v147
                                                                    || (id v148 = (void *)v147,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v548 = 0;
                                                                    goto LABEL_175;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v548 = v148;
LABEL_175:
                                                                    v477 = [v6 objectForKeyedSubscript:@"isSupportedUnicornMatchFlag"];
                                                                    if (!v477
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v478 = 0;
LABEL_178:
                                                                      [v6 objectForKeyedSubscript:@"isDisambiguationSelectedApp"];
                                                                      v475 = id v149 = v486;
                                                                      if (v475
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v404 = self;
                                                                          if (!v9)
                                                                          {
                                                                            id v476 = 0;
                                                                            uint64_t v38 = 0;
                                                                            uint64_t v48 = v601;
                                                                            id v8 = v610;
                                                                            goto LABEL_412;
                                                                          }
                                                                          id v405 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v406 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v622 = *MEMORY[0x1E4F28568];
                                                                          id v474 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDisambiguationSelectedApp"];
                                                                          id v623 = v474;
                                                                          v473 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v623 forKeys:&v622 count:1];
                                                                          id v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v476 = 0;
                                                                          *id v9 = v407;
                                                                          self = v404;
                                                                          uint64_t v48 = v601;
                                                                          id v8 = v610;
                                                                          goto LABEL_411;
                                                                        }
                                                                        id v476 = v475;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v476 = 0;
                                                                      }
                                                                      v473 = [v6 objectForKeyedSubscript:@"isModelPredictedApp"];
                                                                      if (v473
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v409 = v11;
                                                                          if (!v9)
                                                                          {
                                                                            id v474 = 0;
                                                                            uint64_t v38 = 0;
                                                                            uint64_t v48 = v601;
                                                                            id v8 = v610;
                                                                            id v149 = v486;
                                                                            goto LABEL_411;
                                                                          }
                                                                          id v410 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v411 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v620 = *MEMORY[0x1E4F28568];
                                                                          id v472 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isModelPredictedApp"];
                                                                          id v621 = v472;
                                                                          v471 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v621 forKeys:&v620 count:1];
                                                                          id v412 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v474 = 0;
                                                                          *id v9 = v412;
                                                                          goto LABEL_470;
                                                                        }
                                                                        id v474 = v473;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v474 = 0;
                                                                      }
                                                                      v471 = [v6 objectForKeyedSubscript:@"usageScoreRadio"];
                                                                      if (!v471
                                                                        || (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v472 = 0;
                                                                        goto LABEL_187;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v472 = v471;
LABEL_187:
                                                                        v469 = [v6 objectForKeyedSubscript:@"usageScoreMusicWithoutRadio"];
                                                                        if (!v469
                                                                          || (objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v470 = 0;
                                                                          id v150 = v487;
                                                                          id v151 = v489;
LABEL_190:
                                                                          id v487 = v150;
                                                                          id v486 = v149;
                                                                          id v489 = v151;
                                                                          id v152 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalRadio"];
                                                                          v468 = v152;
                                                                          if (!v152)
                                                                          {
LABEL_379:
                                                                            id v402 = [v6 objectForKeyedSubscript:@"rawMediaTypeUsageSignalMusicWithoutRadio"];
                                                                            v466 = v402;
                                                                            v467 = v152;
                                                                            if (!v402)
                                                                            {
LABEL_382:
                                                                              uint64_t v48 = v601;
                                                                              id v8 = v610;
                                                                              id v403 = v533;
LABEL_383:
                                                                              v465 = v402;
                                                                              id v533 = v403;
                                                                              self = objc_retain(-[BMSiriMusicInferenceTrainingDependentSignals initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:](self, "initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMe"
                                                                                         "diaTypeUsageSignalBook:rawMedia"
                                                                                         "TypeUsageSignalMusic:rawMediaTy"
                                                                                         "peUsageSignalPodcast:rawMediaTy"
                                                                                         "peUsageSignalVideo:rawNowPlayin"
                                                                                         "gCountCoreDuet10Min:rawNowPlayi"
                                                                                         "ngCountCoreDuet1Day:rawNowPlayi"
                                                                                         "ngCountCoreDuet1Hr:rawNowPlayin"
                                                                                         "gCountCoreDuet28Day:rawNowPlayi"
                                                                                         "ngCountCoreDuet2Min:rawNowPlayi"
                                                                                         "ngCountCoreDuet6Hr:rawNowPlayin"
                                                                                         "gCountCoreDuet7Day:rawNowPlayin"
                                                                                         "gRecencyCD:rawEntitySearchRecen"
                                                                                         "cy:usageScoreBooks:usageScoreMu"
                                                                                         "sic:usageScorePodcasts:isAppFir"
                                                                                         "stParty:isRequestedApp:isNowPla"
                                                                                         "yingBundlePSE1:isNowPlayingBund"
                                                                                         "lePSE2:vq21Score:isSupportedFla"
                                                                                         "g:isUnicornFlag:isSupportedUnic"
                                                                                         "ornMatchFlag:isDisambiguationSe"
                                                                                         "lectedApp:isModelPredictedApp:u"
                                                                                         "sageScoreRadio:usageScoreMusicW"
                                                                                         "ithoutRadio:rawMediaTypeUsageSi"
                                                                                         "gnalRadio:rawMediaTypeUsageSign"
                                                                                         "alMusicWithoutRadio:",
                                                                                         v8,
                                                                                         v607,
                                                                                         v12,
                                                                                         v608,
                                                                                         v602,
                                                                                         v557,
                                                                                         v597,
                                                                                         v552,
                                                                                         v540,
                                                                                         v544,
                                                                                         v545,
                                                                                         v539,
                                                                                         v32,
                                                                                         v535,
                                                                                         v403,
                                                                                         v532,
                                                                                         v530,
                                                                                         v526,
                                                                                         v527,
                                                                                         v524,
                                                                                         v522,
                                                                                         v520,
                                                                                         v517,
                                                                                         v519,
                                                                                         v514,
                                                                                         v510,
                                                                                         v511,
                                                                                         v508,
                                                                                         v506,
                                                                                         v504,
                                                                                         v502,
                                                                                         v500,
                                                                                         v498,
                                                                                         v496,
                                                                                         v495,
                                                                                         v493,
                                                                                         v490,
                                                                                         v489,
                                                                                         v486,
                                                                                         v487,
                                                                                         v482,
                                                                                         v483,
                                                                                         v548,
                                                                                         v478,
                                                                                         v476,
                                                                                         v474,
                                                                                         v472,
                                                                                         v470,
                                                                                         v152,
                                                                                         v402));
                                                                              uint64_t v38 = self;
LABEL_407:

LABEL_408:
                                                                              id v149 = v486;

LABEL_409:
LABEL_410:

LABEL_411:
                                                                              goto LABEL_412;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v402 = 0;
                                                                              goto LABEL_382;
                                                                            }
                                                                            v408 = self;
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v402 = v466;
                                                                              id v8 = v610;
                                                                              uint64_t v48 = v601;
                                                                              id v403 = v533;
                                                                              goto LABEL_383;
                                                                            }
                                                                            if (v9)
                                                                            {
                                                                              id v423 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v596 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v612 = *MEMORY[0x1E4F28568];
                                                                              v424 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rawMediaTypeUsageSignalMusicWithoutRadio"];
                                                                              v613 = v424;
                                                                              v425 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v613 forKeys:&v612 count:1];
                                                                              *id v9 = (id)[v423 initWithDomain:v596 code:2 userInfo:v425];
                                                                            }
                                                                            v465 = 0;
                                                                            uint64_t v38 = 0;
                                                                            self = v408;
                                                                            id v8 = v610;
LABEL_406:
                                                                            uint64_t v48 = v601;
                                                                            double v32 = v537;
                                                                            goto LABEL_407;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v152 = 0;
                                                                            goto LABEL_379;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v152 = v152;
                                                                            goto LABEL_379;
                                                                          }
                                                                          id v595 = v12;
                                                                          id v555 = v6;
                                                                          v416 = v610;
                                                                          if (v9)
                                                                          {
                                                                            id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v421 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v614 = *MEMORY[0x1E4F28568];
                                                                            v465 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rawMediaTypeUsageSignalRadio"];
                                                                            v615 = v465;
                                                                            v466 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v615 forKeys:&v614 count:1];
                                                                            id v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                            uint64_t v38 = 0;
                                                                            v467 = 0;
                                                                            *id v9 = v422;
                                                                            id v8 = v610;
                                                                            id v6 = v555;
                                                                            goto LABEL_406;
                                                                          }
                                                                          v467 = 0;
                                                                          uint64_t v38 = 0;
LABEL_474:
                                                                          id v8 = v416;
                                                                          id v6 = v555;
                                                                          id v12 = v595;
                                                                          uint64_t v48 = v601;
                                                                          goto LABEL_408;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v470 = v469;
                                                                          id v151 = v489;
                                                                          id v149 = v486;
                                                                          id v150 = v487;
                                                                          goto LABEL_190;
                                                                        }
                                                                        id v595 = v12;
                                                                        id v555 = v6;
                                                                        v416 = v610;
                                                                        if (v9)
                                                                        {
                                                                          id v417 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v418 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v616 = *MEMORY[0x1E4F28568];
                                                                          v467 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"usageScoreMusicWithoutRadio"];
                                                                          v617 = v467;
                                                                          v468 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v617 forKeys:&v616 count:1];
                                                                          id v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v470 = 0;
                                                                          *id v9 = v419;
                                                                          goto LABEL_474;
                                                                        }
                                                                        id v470 = 0;
                                                                        uint64_t v38 = 0;
                                                                        id v8 = v610;
                                                                        id v6 = v555;
                                                                        uint64_t v48 = v601;
LABEL_472:
                                                                        double v32 = v537;
                                                                        id v149 = v486;
                                                                        goto LABEL_409;
                                                                      }
                                                                      v409 = v11;
                                                                      if (v9)
                                                                      {
                                                                        id v413 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v414 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v618 = *MEMORY[0x1E4F28568];
                                                                        id v470 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"usageScoreRadio"];
                                                                        id v619 = v470;
                                                                        v469 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v619 forKeys:&v618 count:1];
                                                                        id v415 = (id)objc_msgSend(v413, "initWithDomain:code:userInfo:", v414, 2);
                                                                        uint64_t v38 = 0;
                                                                        id v472 = 0;
                                                                        *id v9 = v415;
                                                                        uint64_t v48 = v601;
                                                                        id v8 = v610;
                                                                        goto LABEL_472;
                                                                      }
                                                                      id v472 = 0;
                                                                      uint64_t v38 = 0;
LABEL_470:
                                                                      uint64_t v48 = v601;
                                                                      id v8 = v610;
                                                                      double v11 = v409;
                                                                      double v32 = v537;
                                                                      id v149 = v486;
                                                                      goto LABEL_410;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v478 = v477;
                                                                      goto LABEL_178;
                                                                    }
                                                                    v395 = self;
                                                                    if (v9)
                                                                    {
                                                                      id v400 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v401 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v624 = *MEMORY[0x1E4F28568];
                                                                      id v476 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSupportedUnicornMatchFlag"];
                                                                      id v625 = v476;
                                                                      v475 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v625 forKeys:&v624 count:1];
                                                                      uint64_t v38 = 0;
                                                                      id v478 = 0;
                                                                      *id v9 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v401, 2);
                                                                      self = v395;
                                                                      uint64_t v48 = v601;
                                                                      id v8 = v610;
                                                                      id v149 = v486;
LABEL_412:

                                                                      goto LABEL_413;
                                                                    }
                                                                    id v478 = 0;
                                                                    uint64_t v38 = 0;
LABEL_402:
                                                                    self = v395;
                                                                    uint64_t v48 = v601;
                                                                    id v8 = v610;
                                                                    id v149 = v486;
LABEL_413:

                                                                    goto LABEL_414;
                                                                  }
                                                                  v395 = self;
                                                                  if (v9)
                                                                  {
                                                                    id v398 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v399 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v626 = *MEMORY[0x1E4F28568];
                                                                    id v478 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUnicornFlag"];
                                                                    id v627 = v478;
                                                                    v477 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v627 forKeys:&v626 count:1];
                                                                    uint64_t v38 = 0;
                                                                    id v548 = 0;
                                                                    *id v9 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v399, 2);
                                                                    goto LABEL_402;
                                                                  }
                                                                  id v548 = 0;
                                                                  uint64_t v38 = 0;
LABEL_398:
                                                                  self = v395;
                                                                  uint64_t v48 = v601;
                                                                  id v8 = v610;
                                                                  id v149 = v486;
LABEL_414:

                                                                  goto LABEL_415;
                                                                }
                                                                v395 = self;
                                                                if (v9)
                                                                {
                                                                  id v396 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v397 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v628 = *MEMORY[0x1E4F28568];
                                                                  id v548 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSupportedFlag"];
                                                                  id v629 = v548;
                                                                  v479 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v629 forKeys:&v628 count:1];
                                                                  uint64_t v38 = 0;
                                                                  id v483 = 0;
                                                                  *id v9 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v397, 2);
                                                                  goto LABEL_398;
                                                                }
                                                                id v483 = 0;
                                                                uint64_t v38 = 0;
                                                                uint64_t v48 = v601;
                                                                id v8 = v610;
                                                                id v149 = v486;
LABEL_415:

                                                                goto LABEL_416;
                                                              }
                                                              if (v9)
                                                              {
                                                                v388 = v9;
                                                                id v389 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                id v594 = v12;
                                                                uint64_t v390 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v630 = *MEMORY[0x1E4F28568];
                                                                id v391 = [NSString alloc];
                                                                uint64_t v464 = objc_opt_class();
                                                                v392 = v391;
                                                                id v8 = v610;
                                                                id v149 = v486;
                                                                id v483 = (id)[v392 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v464, @"vq21Score"];
                                                                id v631 = v483;
                                                                uint64_t v393 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v631 forKeys:&v630 count:1];
                                                                uint64_t v394 = v390;
                                                                id v12 = v594;
                                                                v480 = (void *)v393;
                                                                uint64_t v38 = 0;
                                                                id v482 = 0;
                                                                id *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v394, 2);
                                                                uint64_t v48 = v601;
                                                                double v32 = v537;
                                                                goto LABEL_415;
                                                              }
                                                              id v482 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
                                                              id v149 = v486;
LABEL_416:

                                                              goto LABEL_417;
                                                            }
                                                            if (v9)
                                                            {
                                                              v381 = v9;
                                                              id v382 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              id v593 = v12;
                                                              uint64_t v383 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v632 = *MEMORY[0x1E4F28568];
                                                              id v384 = [NSString alloc];
                                                              uint64_t v463 = objc_opt_class();
                                                              v385 = v384;
                                                              id v8 = v610;
                                                              id v149 = v486;
                                                              id v482 = (id)[v385 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v463, @"isNowPlayingBundlePSE2"];
                                                              id v633 = v482;
                                                              uint64_t v386 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v633 forKeys:&v632 count:1];
                                                              uint64_t v387 = v383;
                                                              id v12 = v593;
                                                              v481 = (void *)v386;
                                                              uint64_t v38 = 0;
                                                              id v487 = 0;
                                                              id *v381 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v387, 2);
                                                              uint64_t v48 = v601;
                                                              double v32 = v537;
                                                              goto LABEL_416;
                                                            }
                                                            id v487 = 0;
                                                            uint64_t v38 = 0;
                                                            uint64_t v48 = v601;
                                                            id v8 = v610;
                                                            id v149 = v486;
LABEL_417:

                                                            goto LABEL_418;
                                                          }
                                                          if (v9)
                                                          {
                                                            v374 = v9;
                                                            id v375 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v592 = v12;
                                                            uint64_t v376 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v634 = *MEMORY[0x1E4F28568];
                                                            id v377 = [NSString alloc];
                                                            uint64_t v462 = objc_opt_class();
                                                            v378 = v377;
                                                            id v8 = v610;
                                                            id v487 = (id)[v378 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v462, @"isNowPlayingBundlePSE1"];
                                                            id v635 = v487;
                                                            uint64_t v379 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v635 forKeys:&v634 count:1];
                                                            uint64_t v380 = v376;
                                                            id v12 = v592;
                                                            v484 = (void *)v379;
                                                            uint64_t v38 = 0;
                                                            id v149 = 0;
                                                            id *v374 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v380, 2);
                                                            uint64_t v48 = v601;
                                                            double v32 = v537;
                                                            goto LABEL_417;
                                                          }
                                                          id v149 = 0;
                                                          uint64_t v38 = 0;
                                                          uint64_t v48 = v601;
                                                          id v8 = v610;
LABEL_376:
                                                          double v32 = v537;
LABEL_418:

                                                          goto LABEL_419;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v490 = v136;
                                                          goto LABEL_157;
                                                        }
                                                        id v357 = v519;
                                                        if (v9)
                                                        {
                                                          v360 = v9;
                                                          id v361 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          id v590 = v12;
                                                          uint64_t v362 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v638 = *MEMORY[0x1E4F28568];
                                                          id v363 = [NSString alloc];
                                                          uint64_t v460 = objc_opt_class();
                                                          v364 = v363;
                                                          id v8 = v610;
                                                          id v489 = (id)[v364 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v460, @"isAppFirstParty"];
                                                          id v639 = v489;
                                                          uint64_t v365 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v639 forKeys:&v638 count:1];
                                                          uint64_t v366 = v362;
                                                          id v12 = v590;
                                                          v488 = (void *)v365;
                                                          uint64_t v38 = 0;
                                                          id v490 = 0;
                                                          id *v360 = (id)objc_msgSend(v361, "initWithDomain:code:userInfo:", v366, 2);
                                                          uint64_t v48 = v601;
                                                          double v32 = v537;
LABEL_420:

                                                          goto LABEL_421;
                                                        }
                                                        id v490 = 0;
                                                        uint64_t v38 = 0;
                                                        uint64_t v48 = v601;
                                                        id v8 = v610;
LABEL_365:
                                                        double v32 = v537;
LABEL_421:
                                                        id v519 = v357;

                                                        goto LABEL_422;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v498 = v128;
                                                        goto LABEL_145;
                                                      }
                                                      if (v9)
                                                      {
                                                        v331 = v9;
                                                        id v332 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        id v586 = v12;
                                                        uint64_t v333 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v646 = *MEMORY[0x1E4F28568];
                                                        id v334 = [NSString alloc];
                                                        uint64_t v456 = objc_opt_class();
                                                        v335 = v334;
                                                        id v8 = v610;
                                                        id v295 = v519;
                                                        id v496 = (id)[v335 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v456, @"rawEntitySearchRecency"];
                                                        id v647 = v496;
                                                        uint64_t v336 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v647 forKeys:&v646 count:1];
                                                        uint64_t v337 = v333;
                                                        id v12 = v586;
                                                        v497 = (void *)v336;
                                                        uint64_t v38 = 0;
                                                        id v498 = 0;
                                                        id *v331 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                        uint64_t v48 = v601;
                                                        double v32 = v537;
LABEL_427:

                                                        goto LABEL_428;
                                                      }
                                                      id v498 = 0;
                                                      uint64_t v38 = 0;
                                                      uint64_t v48 = v601;
                                                      id v8 = v610;
                                                      id v295 = v519;
LABEL_428:

                                                      goto LABEL_429;
                                                    }
                                                    if (v9)
                                                    {
                                                      v324 = v9;
                                                      id v325 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      id v585 = v12;
                                                      uint64_t v326 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v648 = *MEMORY[0x1E4F28568];
                                                      id v327 = [NSString alloc];
                                                      uint64_t v455 = objc_opt_class();
                                                      v328 = v327;
                                                      id v8 = v610;
                                                      id v295 = v519;
                                                      id v498 = (id)[v328 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v455, @"rawNowPlayingRecencyCD"];
                                                      id v649 = v498;
                                                      uint64_t v329 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v649 forKeys:&v648 count:1];
                                                      uint64_t v330 = v326;
                                                      id v12 = v585;
                                                      v499 = (void *)v329;
                                                      uint64_t v38 = 0;
                                                      id v500 = 0;
                                                      id *v324 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v330, 2);
                                                      uint64_t v48 = v601;
                                                      double v32 = v537;
                                                      goto LABEL_428;
                                                    }
                                                    id v500 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
                                                    id v295 = v519;
LABEL_429:

                                                    goto LABEL_430;
                                                  }
                                                  if (v9)
                                                  {
                                                    v317 = v9;
                                                    id v318 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    id v584 = v12;
                                                    uint64_t v319 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v650 = *MEMORY[0x1E4F28568];
                                                    id v320 = [NSString alloc];
                                                    uint64_t v454 = objc_opt_class();
                                                    v321 = v320;
                                                    id v8 = v610;
                                                    id v295 = v519;
                                                    id v500 = (id)[v321 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v454, @"rawNowPlayingCountCoreDuet7Day"];
                                                    id v651 = v500;
                                                    uint64_t v322 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v651 forKeys:&v650 count:1];
                                                    uint64_t v323 = v319;
                                                    id v12 = v584;
                                                    v501 = (void *)v322;
                                                    uint64_t v38 = 0;
                                                    id v502 = 0;
                                                    id *v317 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v323, 2);
                                                    uint64_t v48 = v601;
                                                    double v32 = v537;
                                                    goto LABEL_429;
                                                  }
                                                  id v502 = 0;
                                                  uint64_t v38 = 0;
                                                  uint64_t v48 = v601;
                                                  id v8 = v610;
                                                  id v295 = v519;
LABEL_430:

                                                  goto LABEL_431;
                                                }
                                                if (v9)
                                                {
                                                  v310 = v9;
                                                  id v311 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v583 = v12;
                                                  uint64_t v312 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v652 = *MEMORY[0x1E4F28568];
                                                  id v313 = [NSString alloc];
                                                  uint64_t v453 = objc_opt_class();
                                                  v314 = v313;
                                                  id v8 = v610;
                                                  id v295 = v519;
                                                  id v502 = (id)[v314 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v453, @"rawNowPlayingCountCoreDuet6Hr"];
                                                  id v653 = v502;
                                                  uint64_t v315 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v653 forKeys:&v652 count:1];
                                                  uint64_t v316 = v312;
                                                  id v12 = v583;
                                                  v503 = (void *)v315;
                                                  uint64_t v38 = 0;
                                                  id v504 = 0;
                                                  id *v310 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v316, 2);
                                                  uint64_t v48 = v601;
                                                  double v32 = v537;
                                                  goto LABEL_430;
                                                }
                                                id v504 = 0;
                                                uint64_t v38 = 0;
                                                uint64_t v48 = v601;
                                                id v8 = v610;
                                                id v295 = v519;
LABEL_431:

                                                goto LABEL_432;
                                              }
                                              if (v9)
                                              {
                                                v303 = v9;
                                                id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                id v582 = v12;
                                                uint64_t v305 = *MEMORY[0x1E4F502C8];
                                                uint64_t v654 = *MEMORY[0x1E4F28568];
                                                id v306 = [NSString alloc];
                                                uint64_t v452 = objc_opt_class();
                                                v307 = v306;
                                                id v8 = v610;
                                                id v295 = v519;
                                                id v504 = (id)[v307 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v452, @"rawNowPlayingCountCoreDuet2Min"];
                                                id v655 = v504;
                                                uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v655 forKeys:&v654 count:1];
                                                uint64_t v309 = v305;
                                                id v12 = v582;
                                                v505 = (void *)v308;
                                                uint64_t v38 = 0;
                                                id v506 = 0;
                                                id *v303 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v309, 2);
                                                uint64_t v48 = v601;
                                                double v32 = v537;
                                                goto LABEL_431;
                                              }
                                              id v506 = 0;
                                              uint64_t v38 = 0;
                                              uint64_t v48 = v601;
                                              id v8 = v610;
                                              id v295 = v519;
LABEL_432:
                                              id v519 = v295;

                                              goto LABEL_433;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v510 = v114;
                                              goto LABEL_124;
                                            }
                                            if (v9)
                                            {
                                              v280 = v9;
                                              id v281 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v579 = v12;
                                              uint64_t v282 = *MEMORY[0x1E4F502C8];
                                              uint64_t v660 = *MEMORY[0x1E4F28568];
                                              id v283 = [NSString alloc];
                                              uint64_t v449 = objc_opt_class();
                                              v284 = v283;
                                              id v8 = v610;
                                              id v511 = (id)[v284 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v449, @"rawNowPlayingCountCoreDuet1Day"];
                                              id v661 = v511;
                                              uint64_t v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v661 forKeys:&v660 count:1];
                                              uint64_t v286 = v282;
                                              id v12 = v579;
                                              v512 = (void *)v285;
                                              uint64_t v38 = 0;
                                              v277 = 0;
                                              id *v280 = (id)objc_msgSend(v281, "initWithDomain:code:userInfo:", v286, 2);
                                              uint64_t v48 = v601;
                                              double v32 = v537;
LABEL_436:

                                              goto LABEL_437;
                                            }
                                            v277 = 0;
                                            uint64_t v38 = 0;
                                            uint64_t v48 = v601;
                                            id v8 = v610;
LABEL_309:
                                            double v32 = v537;
LABEL_437:

                                            goto LABEL_438;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v519 = v110;
                                            goto LABEL_118;
                                          }
                                          if (v9)
                                          {
                                            v265 = v9;
                                            id v266 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            id v577 = v12;
                                            uint64_t v267 = *MEMORY[0x1E4F502C8];
                                            uint64_t v664 = *MEMORY[0x1E4F28568];
                                            id v268 = [NSString alloc];
                                            uint64_t v447 = objc_opt_class();
                                            v269 = v268;
                                            id v8 = v610;
                                            id v514 = (id)[v269 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v447, @"rawMediaTypeUsageSignalVideo"];
                                            id v665 = v514;
                                            uint64_t v270 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v665 forKeys:&v664 count:1];
                                            uint64_t v271 = v267;
                                            id v12 = v577;
                                            v515 = (void *)v270;
                                            uint64_t v38 = 0;
                                            v262 = 0;
                                            id *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                            uint64_t v48 = v601;
                                            double v32 = v537;
LABEL_439:

                                            goto LABEL_440;
                                          }
                                          v262 = 0;
                                          uint64_t v38 = 0;
                                          uint64_t v48 = v601;
                                          id v8 = v610;
LABEL_298:
                                          double v32 = v537;
LABEL_440:

                                          goto LABEL_441;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v520 = v106;
                                          goto LABEL_112;
                                        }
                                        if (v9)
                                        {
                                          v250 = v9;
                                          id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          id v575 = v12;
                                          uint64_t v252 = *MEMORY[0x1E4F502C8];
                                          uint64_t v668 = *MEMORY[0x1E4F28568];
                                          id v253 = [NSString alloc];
                                          uint64_t v445 = objc_opt_class();
                                          v254 = v253;
                                          id v8 = v610;
                                          v219 = v526;
                                          id v517 = (id)[v254 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v445, @"rawMediaTypeUsageSignalMusic"];
                                          id v669 = v517;
                                          uint64_t v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v669 forKeys:&v668 count:1];
                                          uint64_t v256 = v252;
                                          id v12 = v575;
                                          v518 = (void *)v255;
                                          uint64_t v38 = 0;
                                          id v520 = 0;
                                          id *v250 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v256, 2);
                                          uint64_t v48 = v601;
                                          double v32 = v537;
LABEL_442:

                                          goto LABEL_443;
                                        }
                                        id v520 = 0;
                                        uint64_t v38 = 0;
                                        uint64_t v48 = v601;
                                        id v8 = v610;
                                        v219 = v526;
LABEL_443:

                                        goto LABEL_444;
                                      }
                                      if (v9)
                                      {
                                        v243 = v9;
                                        id v244 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        id v574 = v12;
                                        uint64_t v245 = *MEMORY[0x1E4F502C8];
                                        uint64_t v670 = *MEMORY[0x1E4F28568];
                                        id v246 = [NSString alloc];
                                        uint64_t v444 = objc_opt_class();
                                        v247 = v246;
                                        id v8 = v610;
                                        v219 = v526;
                                        id v520 = (id)[v247 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v444, @"rawMediaTypeUsageSignalBook"];
                                        id v671 = v520;
                                        uint64_t v248 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v671 forKeys:&v670 count:1];
                                        uint64_t v249 = v245;
                                        id v12 = v574;
                                        v521 = (void *)v248;
                                        uint64_t v38 = 0;
                                        id v522 = 0;
                                        id *v243 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v249, 2);
                                        uint64_t v48 = v601;
                                        double v32 = v537;
                                        goto LABEL_443;
                                      }
                                      id v522 = 0;
                                      uint64_t v38 = 0;
                                      uint64_t v48 = v601;
                                      id v8 = v610;
                                      v219 = v526;
LABEL_444:

                                      goto LABEL_445;
                                    }
                                    if (v9)
                                    {
                                      v236 = v9;
                                      id v237 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      id v573 = v12;
                                      uint64_t v238 = *MEMORY[0x1E4F502C8];
                                      uint64_t v672 = *MEMORY[0x1E4F28568];
                                      id v239 = [NSString alloc];
                                      uint64_t v443 = objc_opt_class();
                                      v240 = v239;
                                      id v8 = v610;
                                      v219 = v526;
                                      id v522 = (id)[v240 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v443, @"isRawMediaCategoryVideoSignal"];
                                      id v673 = v522;
                                      uint64_t v241 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v673 forKeys:&v672 count:1];
                                      uint64_t v242 = v238;
                                      id v12 = v573;
                                      v523 = (void *)v241;
                                      uint64_t v38 = 0;
                                      id v524 = 0;
                                      id *v236 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v242, 2);
                                      uint64_t v48 = v601;
                                      double v32 = v537;
                                      goto LABEL_444;
                                    }
                                    id v524 = 0;
                                    uint64_t v38 = 0;
                                    uint64_t v48 = v601;
                                    id v8 = v610;
                                    v219 = v526;
LABEL_445:

                                    goto LABEL_446;
                                  }
                                  if (v9)
                                  {
                                    v229 = v9;
                                    id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v572 = v12;
                                    uint64_t v231 = *MEMORY[0x1E4F502C8];
                                    uint64_t v674 = *MEMORY[0x1E4F28568];
                                    id v232 = [NSString alloc];
                                    uint64_t v442 = objc_opt_class();
                                    v233 = v232;
                                    id v8 = v610;
                                    v219 = v526;
                                    id v524 = (id)[v233 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v442, @"isRawMediaCategoryRadioSignal"];
                                    id v675 = v524;
                                    uint64_t v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v675 forKeys:&v674 count:1];
                                    uint64_t v235 = v231;
                                    id v12 = v572;
                                    v525 = (void *)v234;
                                    uint64_t v38 = 0;
                                    id v527 = 0;
                                    id *v229 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v235, 2);
                                    uint64_t v48 = v601;
                                    double v32 = v537;
                                    goto LABEL_445;
                                  }
                                  id v527 = 0;
                                  uint64_t v38 = 0;
                                  uint64_t v48 = v601;
                                  id v8 = v610;
                                  v219 = v526;
LABEL_446:

                                  goto LABEL_447;
                                }
                                if (v9)
                                {
                                  v222 = v9;
                                  id v223 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  id v571 = v12;
                                  uint64_t v224 = *MEMORY[0x1E4F502C8];
                                  uint64_t v676 = *MEMORY[0x1E4F28568];
                                  id v225 = [NSString alloc];
                                  uint64_t v441 = objc_opt_class();
                                  v226 = v225;
                                  id v8 = v610;
                                  id v527 = (id)[v226 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v441, @"isRawMediaCategoryPodcastSignal"];
                                  id v677 = v527;
                                  uint64_t v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v677 forKeys:&v676 count:1];
                                  uint64_t v228 = v224;
                                  id v12 = v571;
                                  v528 = (void *)v227;
                                  uint64_t v38 = 0;
                                  v219 = 0;
                                  id *v222 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v228, 2);
                                  uint64_t v48 = v601;
                                  double v32 = v537;
                                  goto LABEL_446;
                                }
                                v219 = 0;
                                uint64_t v38 = 0;
                                uint64_t v48 = v601;
                                id v8 = v610;
LABEL_267:
                                double v32 = v537;
LABEL_447:

                                goto LABEL_448;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v532 = v94;
                                goto LABEL_94;
                              }
                              if (v9)
                              {
                                v207 = v9;
                                id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v569 = v12;
                                uint64_t v209 = *MEMORY[0x1E4F502C8];
                                uint64_t v680 = *MEMORY[0x1E4F28568];
                                id v210 = [NSString alloc];
                                uint64_t v439 = objc_opt_class();
                                v211 = v210;
                                id v8 = v610;
                                v197 = v533;
                                id v530 = (id)[v211 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v439, @"isRawMediaCategoryAudiobookSignal"];
                                id v681 = v530;
                                uint64_t v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v681 forKeys:&v680 count:1];
                                uint64_t v213 = v209;
                                id v12 = v569;
                                v531 = (void *)v212;
                                uint64_t v38 = 0;
                                id v532 = 0;
                                id *v207 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v213, 2);
                                uint64_t v48 = v601;
                                double v32 = v537;
LABEL_449:

                                goto LABEL_450;
                              }
                              id v532 = 0;
                              uint64_t v38 = 0;
                              uint64_t v48 = v601;
                              id v8 = v610;
                              v197 = v533;
LABEL_450:

                              goto LABEL_451;
                            }
                            if (v9)
                            {
                              v200 = v9;
                              id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                              id v568 = v12;
                              uint64_t v202 = *MEMORY[0x1E4F502C8];
                              uint64_t v682 = *MEMORY[0x1E4F28568];
                              id v203 = [NSString alloc];
                              uint64_t v438 = objc_opt_class();
                              v204 = v203;
                              id v8 = v610;
                              id v532 = (id)[v204 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v438, @"isRawLastNowPlayingCoreDuet"];
                              id v683 = v532;
                              uint64_t v205 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v683 forKeys:&v682 count:1];
                              uint64_t v206 = v202;
                              id v12 = v568;
                              v534 = (void *)v205;
                              uint64_t v38 = 0;
                              v197 = 0;
                              id *v200 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v206, 2);
                              uint64_t v48 = v601;
                              double v32 = v537;
                              goto LABEL_450;
                            }
                            v197 = 0;
                            uint64_t v38 = 0;
                            uint64_t v48 = v601;
                            id v8 = v610;
LABEL_251:
                            double v32 = v537;
LABEL_451:

                            v189 = v535;
                            goto LABEL_452;
                          }
                          if (v9)
                          {
                            v192 = v9;
                            id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                            id v567 = v12;
                            uint64_t v194 = *MEMORY[0x1E4F502C8];
                            uint64_t v684 = *MEMORY[0x1E4F28568];
                            id v195 = [NSString alloc];
                            uint64_t v437 = objc_opt_class();
                            v196 = v195;
                            id v8 = v610;
                            v197 = (void *)[v196 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v437, @"nowPlayingUsage14Days"];
                            v685 = v197;
                            uint64_t v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v685 forKeys:&v684 count:1];
                            uint64_t v199 = v194;
                            id v12 = v567;
                            v536 = (void *)v198;
                            uint64_t v38 = 0;
                            id v535 = 0;
                            id *v192 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v199, 2);
                            uint64_t v48 = v601;
                            goto LABEL_251;
                          }
                          v189 = 0;
                          uint64_t v38 = 0;
                          uint64_t v48 = v601;
                          id v8 = v610;
LABEL_452:

                          goto LABEL_453;
                        }
                        double v32 = v9;
                        if (v9)
                        {
                          id v185 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v566 = v12;
                          uint64_t v186 = *MEMORY[0x1E4F502C8];
                          uint64_t v686 = *MEMORY[0x1E4F28568];
                          id v187 = [NSString alloc];
                          uint64_t v436 = objc_opt_class();
                          v188 = v187;
                          id v8 = v610;
                          v189 = (void *)[v188 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v436, @"nowPlayingUsage7Days"];
                          v687 = v189;
                          uint64_t v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v687 forKeys:&v686 count:1];
                          uint64_t v191 = v186;
                          id v12 = v566;
                          v538 = (void *)v190;
                          uint64_t v38 = 0;
                          *double v32 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v191, 2);
                          double v32 = 0;
                          uint64_t v48 = v601;
                          goto LABEL_452;
                        }
                        uint64_t v38 = 0;
                        uint64_t v48 = v601;
                        id v8 = v610;
LABEL_453:

                        id v24 = v540;
                        id v177 = v539;
                        goto LABEL_454;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v31 = v30;
                        goto LABEL_37;
                      }
                      id v177 = v9;
                      if (v9)
                      {
                        id v542 = objc_alloc(MEMORY[0x1E4F28C58]);
                        id v565 = v12;
                        uint64_t v178 = *MEMORY[0x1E4F502C8];
                        uint64_t v688 = *MEMORY[0x1E4F28568];
                        id v179 = [NSString alloc];
                        uint64_t v435 = objc_opt_class();
                        id v180 = v179;
                        id v8 = v610;
                        uint64_t v181 = [v180 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v435, @"nowPlayingUsage1Day"];
                        uint64_t v689 = v181;
                        uint64_t v182 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v689 forKeys:&v688 count:1];
                        v183 = v542;
                        uint64_t v184 = v178;
                        id v12 = v565;
                        v541 = (void *)v182;
                        uint64_t v38 = 0;
                        v539 = 0;
                        *id v177 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
                        double v32 = (void *)v181;
                        uint64_t v48 = v601;
                        goto LABEL_453;
                      }
                      uint64_t v38 = 0;
                      uint64_t v48 = v601;
                      id v8 = v610;
LABEL_454:

                      goto LABEL_455;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v544 = v26;
                      goto LABEL_31;
                    }
                    if (v9)
                    {
                      id v161 = v9;
                      id v162 = objc_alloc(MEMORY[0x1E4F28C58]);
                      id v563 = v12;
                      uint64_t v163 = *MEMORY[0x1E4F502C8];
                      uint64_t v692 = *MEMORY[0x1E4F28568];
                      id v164 = [NSString alloc];
                      uint64_t v433 = objc_opt_class();
                      id v165 = v164;
                      id v8 = v610;
                      id v545 = (id)[v165 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v433, @"nowPlayingBundleScore"];
                      id v693 = v545;
                      uint64_t v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v693 forKeys:&v692 count:1];
                      uint64_t v167 = v163;
                      id v12 = v563;
                      v547 = (void *)v166;
                      id v168 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v167, 2);
                      uint64_t v38 = 0;
                      id v157 = 0;
                      *id v161 = v168;
                      uint64_t v48 = v601;
LABEL_456:

                      goto LABEL_457;
                    }
                    id v157 = 0;
                    uint64_t v38 = 0;
                    uint64_t v48 = v601;
                    id v8 = v610;
LABEL_457:

                    uint64_t v63 = v557;
                    goto LABEL_458;
                  }
                  if (v9)
                  {
                    id v153 = v9;
                    id v550 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v562 = v12;
                    uint64_t v154 = *MEMORY[0x1E4F502C8];
                    uint64_t v694 = *MEMORY[0x1E4F28568];
                    id v155 = [NSString alloc];
                    uint64_t v432 = objc_opt_class();
                    id v156 = v155;
                    id v8 = v610;
                    id v157 = (void *)[v156 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v432, @"nowPlayingBundleRecencyS"];
                    v695 = v157;
                    uint64_t v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v695 forKeys:&v694 count:1];
                    id v159 = v550;
                    uint64_t v160 = v154;
                    id v12 = v562;
                    v549 = (void *)v158;
                    uint64_t v38 = 0;
                    id v24 = 0;
                    *id v153 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                    uint64_t v48 = v601;
                    goto LABEL_457;
                  }
                  id v24 = 0;
                  uint64_t v38 = 0;
                  uint64_t v48 = v601;
                  uint64_t v63 = v557;
                  id v8 = v610;
LABEL_458:

                  goto LABEL_459;
                }
                if (v9)
                {
                  uint64_t v82 = v9;
                  id v553 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v561 = v12;
                  uint64_t v83 = *MEMORY[0x1E4F502C8];
                  uint64_t v696 = *MEMORY[0x1E4F28568];
                  id v84 = [NSString alloc];
                  uint64_t v431 = objc_opt_class();
                  v85 = v84;
                  id v8 = v610;
                  uint64_t v63 = v557;
                  id v24 = (id)[v85 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v431, @"nowPlayingBundleCount"];
                  id v697 = v24;
                  uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v697 forKeys:&v696 count:1];
                  uint64_t v87 = v83;
                  id v12 = v561;
                  v551 = (void *)v86;
                  id v88 = (id)objc_msgSend(v553, "initWithDomain:code:userInfo:", v87, 2);
                  uint64_t v38 = 0;
                  id v552 = 0;
                  *uint64_t v82 = v88;
                  uint64_t v48 = v601;
                  goto LABEL_458;
                }
                id v552 = 0;
                uint64_t v38 = 0;
                uint64_t v48 = v601;
                uint64_t v63 = v557;
                id v8 = v610;
LABEL_459:

                goto LABEL_460;
              }
              if (v9)
              {
                uint64_t v75 = v9;
                id v598 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v560 = v12;
                uint64_t v76 = *MEMORY[0x1E4F502C8];
                uint64_t v698 = *MEMORY[0x1E4F28568];
                id v77 = [NSString alloc];
                uint64_t v430 = objc_opt_class();
                uint64_t v78 = v77;
                id v8 = v610;
                uint64_t v63 = v557;
                id v552 = (id)[v78 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v430, @"isNowPlayingBundle"];
                id v699 = v552;
                uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v699 forKeys:&v698 count:1];
                uint64_t v80 = v76;
                id v12 = v560;
                v556 = (void *)v79;
                id v81 = (id)objc_msgSend(v598, "initWithDomain:code:userInfo:", v80, 2);
                uint64_t v38 = 0;
                id v597 = 0;
                *uint64_t v75 = v81;
                uint64_t v48 = v601;
                goto LABEL_459;
              }
              id v597 = 0;
              uint64_t v38 = 0;
              uint64_t v48 = v601;
              uint64_t v63 = v557;
              id v8 = v610;
LABEL_460:

              goto LABEL_461;
            }
            if (v9)
            {
              uint64_t v67 = v9;
              id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v559 = v12;
              uint64_t v69 = *MEMORY[0x1E4F502C8];
              uint64_t v700 = *MEMORY[0x1E4F28568];
              id v70 = [NSString alloc];
              uint64_t v429 = objc_opt_class();
              uint64_t v71 = v70;
              id v8 = v610;
              id v597 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v429, @"isForegroundBundle"];
              id v701 = v597;
              uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v701 forKeys:&v700 count:1];
              uint64_t v73 = v69;
              id v12 = v559;
              v599 = (void *)v72;
              id v74 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
              uint64_t v38 = 0;
              uint64_t v63 = 0;
              *uint64_t v67 = v74;
              uint64_t v48 = v601;
              goto LABEL_460;
            }
            uint64_t v63 = 0;
            uint64_t v38 = 0;
            uint64_t v48 = v601;
            id v8 = v610;
LABEL_461:

            id v10 = v607;
            goto LABEL_462;
          }
          if (v9)
          {
            uint64_t v57 = v9;
            id v603 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v558 = v12;
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v702 = *MEMORY[0x1E4F28568];
            id v59 = [NSString alloc];
            uint64_t v428 = objc_opt_class();
            uint64_t v60 = v59;
            id v8 = v610;
            uint64_t v61 = v11;
            uint64_t v62 = v57;
            uint64_t v63 = (void *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v428, @"entitySearchBundleScore"];
            v703 = v63;
            uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v703 forKeys:&v702 count:1];
            uint64_t v65 = v58;
            id v12 = v558;
            v600 = (void *)v64;
            id v66 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v65, 2);
            uint64_t v38 = 0;
            id v602 = 0;
            *uint64_t v62 = v66;
            double v11 = v61;
            uint64_t v48 = v601;
            goto LABEL_461;
          }
          id v602 = 0;
          uint64_t v38 = 0;
          uint64_t v48 = v601;
          id v10 = v607;
          id v8 = v610;
LABEL_462:

          goto LABEL_463;
        }
        uint64_t v48 = v13;
        if (v9)
        {
          id v609 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v606 = *MEMORY[0x1E4F502C8];
          uint64_t v704 = *MEMORY[0x1E4F28568];
          int v50 = v11;
          uint64_t v51 = v9;
          id v52 = [NSString alloc];
          uint64_t v427 = objc_opt_class();
          uint64_t v53 = v52;
          id v8 = v610;
          id v10 = v607;
          id v602 = (id)[v53 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v427, @"entitySearchBundleRecencyS"];
          id v705 = v602;
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v705 forKeys:&v704 count:1];
          uint64_t v55 = v606;
          v604 = (void *)v54;
          id v56 = (id)objc_msgSend(v609, "initWithDomain:code:userInfo:", v55, 2);
          uint64_t v38 = 0;
          id v608 = 0;
          *uint64_t v51 = v56;
          double v11 = v50;
          goto LABEL_462;
        }
        id v608 = 0;
        uint64_t v38 = 0;
        id v10 = v607;
        id v8 = v610;
LABEL_463:

        goto LABEL_464;
      }
      if (v9)
      {
        id v605 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v706 = *MEMORY[0x1E4F28568];
        id v608 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"compoundMediaTypeBundleScore"];
        id v707 = v608;
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v707 forKeys:&v706 count:1];
        id v49 = (id)[v605 initWithDomain:v47 code:2 userInfo:v48];
        uint64_t v38 = 0;
        id v12 = 0;
        *id v9 = v49;
        id v8 = v610;
        goto LABEL_463;
      }
      id v12 = 0;
      uint64_t v38 = 0;
      id v8 = v610;
LABEL_464:

      goto LABEL_465;
    }
    if (a4)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v708 = *MEMORY[0x1E4F28568];
      id v554 = v6;
      uint64_t v41 = v7;
      int v42 = self;
      id v43 = v8;
      id v44 = a4;
      uint64_t v45 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"compoundActiveBundleScore"];
      uint64_t v709 = v45;
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v709 forKeys:&v708 count:1];
      uint64_t v46 = v40;
      id v12 = (id)v45;
      uint64_t v38 = 0;
      id v10 = 0;
      *id v44 = (id)[v39 initWithDomain:v46 code:2 userInfo:v11];
      id v8 = v43;
      self = v42;
      double v7 = v41;
      id v6 = v554;
      goto LABEL_464;
    }
    id v10 = 0;
    uint64_t v38 = 0;
LABEL_465:

    goto LABEL_466;
  }
  if (a4)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v34 = *MEMORY[0x1E4F502C8];
    uint64_t v710 = *MEMORY[0x1E4F28568];
    uint64_t v35 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isClientForegroundActiveBundle"];
    v711[0] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v711 forKeys:&v710 count:1];
    uint64_t v37 = v33;
    id v10 = (id)v35;
    v611 = (void *)v36;
    uint64_t v38 = 0;
    id v8 = 0;
    *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2);
    goto LABEL_465;
  }
  uint64_t v38 = 0;
  id v8 = 0;
LABEL_466:

  return v38;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMSiriMusicInferenceTrainingDependentSignals *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsClientForegroundActiveBundle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasCompoundActiveBundleScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasCompoundMediaTypeBundleScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasEntitySearchBundleRecencyS)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasEntitySearchBundleScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasIsForegroundBundle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsNowPlayingBundle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasNowPlayingBundleCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNowPlayingBundleRecencyS)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasNowPlayingBundleScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasIsNowPlayingLastBundle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasNowPlayingUsage1Day)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNowPlayingUsage7Days)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNowPlayingUsage14Days)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasIsRawLastNowPlayingCoreDuet)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryAudiobookSignal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryMusicSignal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryPodcastSignal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryRadioSignal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRawMediaCategoryVideoSignal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalBook)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalMusic)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalPodcast)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalVideo)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet10Min)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet1Day)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet1Hr)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet28Day)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet2Min)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet6Hr)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingCountCoreDuet7Day)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawNowPlayingRecencyCD)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawEntitySearchRecency)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasUsageScoreBooks)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasUsageScoreMusic)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasUsageScorePodcasts)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasIsAppFirstParty)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsRequestedApp)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsNowPlayingBundlePSE1)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsNowPlayingBundlePSE2)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasVq21Score)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasIsSupportedFlag)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsUnicornFlag)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsSupportedUnicornMatchFlag)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsDisambiguationSelectedApp)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsModelPredictedApp)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasUsageScoreRadio)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasUsageScoreMusicWithoutRadio)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalRadio)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRawMediaTypeUsageSignalMusicWithoutRadio)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v299.receiver = self;
  v299.super_class = (Class)BMSiriMusicInferenceTrainingDependentSignals;
  id v5 = [(BMEventBase *)&v299 init];
  if (!v5) {
    goto LABEL_506;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasIsClientForegroundActiveBundle = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_325;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_327;
            }
          }
          v4[*v8] = 1;
LABEL_325:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_327:
          BOOL v293 = v22 != 0;
          uint64_t v294 = 16;
          goto LABEL_468;
        case 2u:
          v5->_hasCompoundActiveBundleScore = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 168;
          goto LABEL_502;
        case 3u:
          v5->_hasCompoundMediaTypeBundleScore = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 176;
          goto LABEL_502;
        case 4u:
          v5->_hasEntitySearchBundleRecencyS = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 184;
          goto LABEL_502;
        case 5u:
          v5->_hasEntitySearchBundleScore = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 192;
          goto LABEL_502;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasIsForegroundBundle = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  uint64_t v38 = 0;
                  goto LABEL_331;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v38 = 0;
          }
LABEL_331:
          BOOL v293 = v38 != 0;
          uint64_t v294 = 22;
          goto LABEL_468;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          v5->_hasIsNowPlayingBundle = 1;
          while (2)
          {
            uint64_t v46 = *v6;
            uint64_t v47 = *(void *)&v4[v46];
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v47);
              *(void *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                BOOL v17 = v44++ >= 9;
                if (v17)
                {
                  uint64_t v45 = 0;
                  goto LABEL_335;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v45 = 0;
          }
LABEL_335:
          BOOL v293 = v45 != 0;
          uint64_t v294 = 24;
          goto LABEL_468;
        case 8u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          v5->_hasNowPlayingBundleCount = 1;
          while (2)
          {
            uint64_t v53 = *v6;
            uint64_t v54 = *(void *)&v4[v53];
            unint64_t v55 = v54 + 1;
            if (v54 == -1 || v55 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)&v4[*v9] + v54);
              *(void *)&v4[v53] = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                BOOL v17 = v51++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_339;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_339:
          uint64_t v295 = 92;
          goto LABEL_477;
        case 9u:
          v5->_hasNowPlayingBundleRecencyS = 1;
          uint64_t v57 = *v6;
          unint64_t v58 = *(void *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v58);
            *(void *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 200;
          goto LABEL_502;
        case 0xAu:
          v5->_hasNowPlayingBundleScore = 1;
          uint64_t v59 = *v6;
          unint64_t v60 = *(void *)&v4[v59];
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v60);
            *(void *)&v4[v59] = v60 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 208;
          goto LABEL_502;
        case 0xBu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          v5->_hasIsNowPlayingLastBundle = 1;
          while (2)
          {
            uint64_t v64 = *v6;
            uint64_t v65 = *(void *)&v4[v64];
            unint64_t v66 = v65 + 1;
            if (v65 == -1 || v66 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)&v4[*v9] + v65);
              *(void *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                BOOL v17 = v62++ >= 9;
                if (v17)
                {
                  uint64_t v63 = 0;
                  goto LABEL_343;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v63 = 0;
          }
LABEL_343:
          BOOL v293 = v63 != 0;
          uint64_t v294 = 29;
          goto LABEL_468;
        case 0xCu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v52 = 0;
          v5->_hasNowPlayingUsage1Day = 1;
          while (2)
          {
            uint64_t v70 = *v6;
            uint64_t v71 = *(void *)&v4[v70];
            unint64_t v72 = v71 + 1;
            if (v71 == -1 || v72 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)&v4[*v9] + v71);
              *(void *)&v4[v70] = v72;
              v52 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                BOOL v17 = v69++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_347;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_347:
          uint64_t v295 = 96;
          goto LABEL_477;
        case 0xDu:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v52 = 0;
          v5->_hasNowPlayingUsage7Days = 1;
          while (2)
          {
            uint64_t v76 = *v6;
            uint64_t v77 = *(void *)&v4[v76];
            unint64_t v78 = v77 + 1;
            if (v77 == -1 || v78 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v79 = *(unsigned char *)(*(void *)&v4[*v9] + v77);
              *(void *)&v4[v76] = v78;
              v52 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                BOOL v17 = v75++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_351;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_351:
          uint64_t v295 = 100;
          goto LABEL_477;
        case 0xEu:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v52 = 0;
          v5->_hasNowPlayingUsage14Days = 1;
          while (2)
          {
            uint64_t v82 = *v6;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v9] + v83);
              *(void *)&v4[v82] = v84;
              v52 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                BOOL v17 = v81++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_355;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_355:
          uint64_t v295 = 104;
          goto LABEL_477;
        case 0xFu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasIsRawLastNowPlayingCoreDuet = 1;
          while (2)
          {
            uint64_t v89 = *v6;
            uint64_t v90 = *(void *)&v4[v89];
            unint64_t v91 = v90 + 1;
            if (v90 == -1 || v91 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v90);
              *(void *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                BOOL v17 = v87++ >= 9;
                if (v17)
                {
                  uint64_t v88 = 0;
                  goto LABEL_359;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v88 = 0;
          }
LABEL_359:
          BOOL v293 = v88 != 0;
          uint64_t v294 = 34;
          goto LABEL_468;
        case 0x10u:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasIsRawMediaCategoryAudiobookSignal = 1;
          while (2)
          {
            uint64_t v96 = *v6;
            uint64_t v97 = *(void *)&v4[v96];
            unint64_t v98 = v97 + 1;
            if (v97 == -1 || v98 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)&v4[*v9] + v97);
              *(void *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                BOOL v17 = v94++ >= 9;
                if (v17)
                {
                  uint64_t v95 = 0;
                  goto LABEL_363;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v95 = 0;
          }
LABEL_363:
          BOOL v293 = v95 != 0;
          uint64_t v294 = 36;
          goto LABEL_468;
        case 0x11u:
          char v100 = 0;
          unsigned int v101 = 0;
          uint64_t v102 = 0;
          v5->_hasIsRawMediaCategoryMusicSignal = 1;
          while (2)
          {
            uint64_t v103 = *v6;
            uint64_t v104 = *(void *)&v4[v103];
            unint64_t v105 = v104 + 1;
            if (v104 == -1 || v105 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v106 = *(unsigned char *)(*(void *)&v4[*v9] + v104);
              *(void *)&v4[v103] = v105;
              v102 |= (unint64_t)(v106 & 0x7F) << v100;
              if (v106 < 0)
              {
                v100 += 7;
                BOOL v17 = v101++ >= 9;
                if (v17)
                {
                  uint64_t v102 = 0;
                  goto LABEL_367;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v102 = 0;
          }
LABEL_367:
          BOOL v293 = v102 != 0;
          uint64_t v294 = 38;
          goto LABEL_468;
        case 0x12u:
          char v107 = 0;
          unsigned int v108 = 0;
          uint64_t v109 = 0;
          v5->_hasIsRawMediaCategoryPodcastSignal = 1;
          while (2)
          {
            uint64_t v110 = *v6;
            uint64_t v111 = *(void *)&v4[v110];
            unint64_t v112 = v111 + 1;
            if (v111 == -1 || v112 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v113 = *(unsigned char *)(*(void *)&v4[*v9] + v111);
              *(void *)&v4[v110] = v112;
              v109 |= (unint64_t)(v113 & 0x7F) << v107;
              if (v113 < 0)
              {
                v107 += 7;
                BOOL v17 = v108++ >= 9;
                if (v17)
                {
                  uint64_t v109 = 0;
                  goto LABEL_371;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v109 = 0;
          }
LABEL_371:
          BOOL v293 = v109 != 0;
          uint64_t v294 = 40;
          goto LABEL_468;
        case 0x13u:
          char v114 = 0;
          unsigned int v115 = 0;
          uint64_t v116 = 0;
          v5->_hasIsRawMediaCategoryRadioSignal = 1;
          while (2)
          {
            uint64_t v117 = *v6;
            uint64_t v118 = *(void *)&v4[v117];
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)&v4[*v9] + v118);
              *(void *)&v4[v117] = v119;
              v116 |= (unint64_t)(v120 & 0x7F) << v114;
              if (v120 < 0)
              {
                v114 += 7;
                BOOL v17 = v115++ >= 9;
                if (v17)
                {
                  uint64_t v116 = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v116 = 0;
          }
LABEL_375:
          BOOL v293 = v116 != 0;
          uint64_t v294 = 42;
          goto LABEL_468;
        case 0x14u:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v123 = 0;
          v5->_hasIsRawMediaCategoryVideoSignal = 1;
          while (2)
          {
            uint64_t v124 = *v6;
            uint64_t v125 = *(void *)&v4[v124];
            unint64_t v126 = v125 + 1;
            if (v125 == -1 || v126 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)&v4[*v9] + v125);
              *(void *)&v4[v124] = v126;
              v123 |= (unint64_t)(v127 & 0x7F) << v121;
              if (v127 < 0)
              {
                v121 += 7;
                BOOL v17 = v122++ >= 9;
                if (v17)
                {
                  uint64_t v123 = 0;
                  goto LABEL_379;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v123 = 0;
          }
LABEL_379:
          BOOL v293 = v123 != 0;
          uint64_t v294 = 44;
          goto LABEL_468;
        case 0x15u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalBook = 1;
          while (2)
          {
            uint64_t v130 = *v6;
            uint64_t v131 = *(void *)&v4[v130];
            unint64_t v132 = v131 + 1;
            if (v131 == -1 || v132 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)&v4[*v9] + v131);
              *(void *)&v4[v130] = v132;
              v52 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v17 = v129++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_383;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_383:
          uint64_t v295 = 108;
          goto LABEL_477;
        case 0x16u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalMusic = 1;
          while (2)
          {
            uint64_t v136 = *v6;
            uint64_t v137 = *(void *)&v4[v136];
            unint64_t v138 = v137 + 1;
            if (v137 == -1 || v138 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)&v4[*v9] + v137);
              *(void *)&v4[v136] = v138;
              v52 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v17 = v135++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_387;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_387:
          uint64_t v295 = 112;
          goto LABEL_477;
        case 0x17u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalPodcast = 1;
          while (2)
          {
            uint64_t v142 = *v6;
            uint64_t v143 = *(void *)&v4[v142];
            unint64_t v144 = v143 + 1;
            if (v143 == -1 || v144 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)&v4[*v9] + v143);
              *(void *)&v4[v142] = v144;
              v52 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v17 = v141++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_391;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_391:
          uint64_t v295 = 116;
          goto LABEL_477;
        case 0x18u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalVideo = 1;
          while (2)
          {
            uint64_t v148 = *v6;
            uint64_t v149 = *(void *)&v4[v148];
            unint64_t v150 = v149 + 1;
            if (v149 == -1 || v150 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)&v4[*v9] + v149);
              *(void *)&v4[v148] = v150;
              v52 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v17 = v147++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_395;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_395:
          uint64_t v295 = 120;
          goto LABEL_477;
        case 0x19u:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet10Min = 1;
          while (2)
          {
            uint64_t v154 = *v6;
            uint64_t v155 = *(void *)&v4[v154];
            unint64_t v156 = v155 + 1;
            if (v155 == -1 || v156 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)&v4[*v9] + v155);
              *(void *)&v4[v154] = v156;
              v52 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v17 = v153++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_399:
          uint64_t v295 = 124;
          goto LABEL_477;
        case 0x1Au:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet1Day = 1;
          while (2)
          {
            uint64_t v160 = *v6;
            uint64_t v161 = *(void *)&v4[v160];
            unint64_t v162 = v161 + 1;
            if (v161 == -1 || v162 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)&v4[*v9] + v161);
              *(void *)&v4[v160] = v162;
              v52 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v17 = v159++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_403;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_403:
          uint64_t v295 = 128;
          goto LABEL_477;
        case 0x1Bu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet1Hr = 1;
          while (2)
          {
            uint64_t v166 = *v6;
            uint64_t v167 = *(void *)&v4[v166];
            unint64_t v168 = v167 + 1;
            if (v167 == -1 || v168 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)&v4[*v9] + v167);
              *(void *)&v4[v166] = v168;
              v52 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v17 = v165++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_407;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_407:
          uint64_t v295 = 132;
          goto LABEL_477;
        case 0x1Cu:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet28Day = 1;
          while (2)
          {
            uint64_t v172 = *v6;
            uint64_t v173 = *(void *)&v4[v172];
            unint64_t v174 = v173 + 1;
            if (v173 == -1 || v174 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v175 = *(unsigned char *)(*(void *)&v4[*v9] + v173);
              *(void *)&v4[v172] = v174;
              v52 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v17 = v171++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_411:
          uint64_t v295 = 136;
          goto LABEL_477;
        case 0x1Du:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet2Min = 1;
          while (2)
          {
            uint64_t v178 = *v6;
            uint64_t v179 = *(void *)&v4[v178];
            unint64_t v180 = v179 + 1;
            if (v179 == -1 || v180 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v181 = *(unsigned char *)(*(void *)&v4[*v9] + v179);
              *(void *)&v4[v178] = v180;
              v52 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v17 = v177++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_415;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_415:
          uint64_t v295 = 140;
          goto LABEL_477;
        case 0x1Eu:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet6Hr = 1;
          while (2)
          {
            uint64_t v184 = *v6;
            uint64_t v185 = *(void *)&v4[v184];
            unint64_t v186 = v185 + 1;
            if (v185 == -1 || v186 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v187 = *(unsigned char *)(*(void *)&v4[*v9] + v185);
              *(void *)&v4[v184] = v186;
              v52 |= (unint64_t)(v187 & 0x7F) << v182;
              if (v187 < 0)
              {
                v182 += 7;
                BOOL v17 = v183++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_419;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_419:
          uint64_t v295 = 144;
          goto LABEL_477;
        case 0x1Fu:
          char v188 = 0;
          unsigned int v189 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingCountCoreDuet7Day = 1;
          while (2)
          {
            uint64_t v190 = *v6;
            uint64_t v191 = *(void *)&v4[v190];
            unint64_t v192 = v191 + 1;
            if (v191 == -1 || v192 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v193 = *(unsigned char *)(*(void *)&v4[*v9] + v191);
              *(void *)&v4[v190] = v192;
              v52 |= (unint64_t)(v193 & 0x7F) << v188;
              if (v193 < 0)
              {
                v188 += 7;
                BOOL v17 = v189++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_423:
          uint64_t v295 = 148;
          goto LABEL_477;
        case 0x20u:
          char v194 = 0;
          unsigned int v195 = 0;
          uint64_t v52 = 0;
          v5->_hasRawNowPlayingRecencyCD = 1;
          while (2)
          {
            uint64_t v196 = *v6;
            uint64_t v197 = *(void *)&v4[v196];
            unint64_t v198 = v197 + 1;
            if (v197 == -1 || v198 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v199 = *(unsigned char *)(*(void *)&v4[*v9] + v197);
              *(void *)&v4[v196] = v198;
              v52 |= (unint64_t)(v199 & 0x7F) << v194;
              if (v199 < 0)
              {
                v194 += 7;
                BOOL v17 = v195++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_427;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_427:
          uint64_t v295 = 152;
          goto LABEL_477;
        case 0x21u:
          char v200 = 0;
          unsigned int v201 = 0;
          uint64_t v52 = 0;
          v5->_hasRawEntitySearchRecency = 1;
          while (2)
          {
            uint64_t v202 = *v6;
            uint64_t v203 = *(void *)&v4[v202];
            unint64_t v204 = v203 + 1;
            if (v203 == -1 || v204 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v205 = *(unsigned char *)(*(void *)&v4[*v9] + v203);
              *(void *)&v4[v202] = v204;
              v52 |= (unint64_t)(v205 & 0x7F) << v200;
              if (v205 < 0)
              {
                v200 += 7;
                BOOL v17 = v201++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_431;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_431:
          uint64_t v295 = 156;
          goto LABEL_477;
        case 0x22u:
          v5->_hasUsageScoreBooks = 1;
          uint64_t v206 = *v6;
          unint64_t v207 = *(void *)&v4[v206];
          if (v207 <= 0xFFFFFFFFFFFFFFF7 && v207 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v207);
            *(void *)&v4[v206] = v207 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 216;
          goto LABEL_502;
        case 0x23u:
          v5->_hasUsageScoreMusic = 1;
          uint64_t v208 = *v6;
          unint64_t v209 = *(void *)&v4[v208];
          if (v209 <= 0xFFFFFFFFFFFFFFF7 && v209 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v209);
            *(void *)&v4[v208] = v209 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 224;
          goto LABEL_502;
        case 0x24u:
          v5->_hasUsageScorePodcasts = 1;
          uint64_t v210 = *v6;
          unint64_t v211 = *(void *)&v4[v210];
          if (v211 <= 0xFFFFFFFFFFFFFFF7 && v211 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v211);
            *(void *)&v4[v210] = v211 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 232;
          goto LABEL_502;
        case 0x25u:
          char v212 = 0;
          unsigned int v213 = 0;
          uint64_t v214 = 0;
          v5->_hasIsAppFirstParty = 1;
          while (2)
          {
            uint64_t v215 = *v6;
            uint64_t v216 = *(void *)&v4[v215];
            unint64_t v217 = v216 + 1;
            if (v216 == -1 || v217 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v218 = *(unsigned char *)(*(void *)&v4[*v9] + v216);
              *(void *)&v4[v215] = v217;
              v214 |= (unint64_t)(v218 & 0x7F) << v212;
              if (v218 < 0)
              {
                v212 += 7;
                BOOL v17 = v213++ >= 9;
                if (v17)
                {
                  uint64_t v214 = 0;
                  goto LABEL_435;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v214 = 0;
          }
LABEL_435:
          BOOL v293 = v214 != 0;
          uint64_t v294 = 62;
          goto LABEL_468;
        case 0x26u:
          char v219 = 0;
          unsigned int v220 = 0;
          uint64_t v221 = 0;
          v5->_hasIsRequestedApp = 1;
          while (2)
          {
            uint64_t v222 = *v6;
            uint64_t v223 = *(void *)&v4[v222];
            unint64_t v224 = v223 + 1;
            if (v223 == -1 || v224 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v225 = *(unsigned char *)(*(void *)&v4[*v9] + v223);
              *(void *)&v4[v222] = v224;
              v221 |= (unint64_t)(v225 & 0x7F) << v219;
              if (v225 < 0)
              {
                v219 += 7;
                BOOL v17 = v220++ >= 9;
                if (v17)
                {
                  uint64_t v221 = 0;
                  goto LABEL_439;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v221 = 0;
          }
LABEL_439:
          BOOL v293 = v221 != 0;
          uint64_t v294 = 64;
          goto LABEL_468;
        case 0x27u:
          char v226 = 0;
          unsigned int v227 = 0;
          uint64_t v228 = 0;
          v5->_hasIsNowPlayingBundlePSE1 = 1;
          while (2)
          {
            uint64_t v229 = *v6;
            uint64_t v230 = *(void *)&v4[v229];
            unint64_t v231 = v230 + 1;
            if (v230 == -1 || v231 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v232 = *(unsigned char *)(*(void *)&v4[*v9] + v230);
              *(void *)&v4[v229] = v231;
              v228 |= (unint64_t)(v232 & 0x7F) << v226;
              if (v232 < 0)
              {
                v226 += 7;
                BOOL v17 = v227++ >= 9;
                if (v17)
                {
                  uint64_t v228 = 0;
                  goto LABEL_443;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v228 = 0;
          }
LABEL_443:
          BOOL v293 = v228 != 0;
          uint64_t v294 = 66;
          goto LABEL_468;
        case 0x28u:
          char v233 = 0;
          unsigned int v234 = 0;
          uint64_t v235 = 0;
          v5->_hasIsNowPlayingBundlePSE2 = 1;
          while (2)
          {
            uint64_t v236 = *v6;
            uint64_t v237 = *(void *)&v4[v236];
            unint64_t v238 = v237 + 1;
            if (v237 == -1 || v238 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v239 = *(unsigned char *)(*(void *)&v4[*v9] + v237);
              *(void *)&v4[v236] = v238;
              v235 |= (unint64_t)(v239 & 0x7F) << v233;
              if (v239 < 0)
              {
                v233 += 7;
                BOOL v17 = v234++ >= 9;
                if (v17)
                {
                  uint64_t v235 = 0;
                  goto LABEL_447;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v235 = 0;
          }
LABEL_447:
          BOOL v293 = v235 != 0;
          uint64_t v294 = 68;
          goto LABEL_468;
        case 0x29u:
          v5->_hasVq21Score = 1;
          uint64_t v240 = *v6;
          unint64_t v241 = *(void *)&v4[v240];
          if (v241 <= 0xFFFFFFFFFFFFFFF7 && v241 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v241);
            *(void *)&v4[v240] = v241 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 240;
          goto LABEL_502;
        case 0x2Au:
          char v242 = 0;
          unsigned int v243 = 0;
          uint64_t v244 = 0;
          v5->_hasIsSupportedFlag = 1;
          while (2)
          {
            uint64_t v245 = *v6;
            uint64_t v246 = *(void *)&v4[v245];
            unint64_t v247 = v246 + 1;
            if (v246 == -1 || v247 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v248 = *(unsigned char *)(*(void *)&v4[*v9] + v246);
              *(void *)&v4[v245] = v247;
              v244 |= (unint64_t)(v248 & 0x7F) << v242;
              if (v248 < 0)
              {
                v242 += 7;
                BOOL v17 = v243++ >= 9;
                if (v17)
                {
                  uint64_t v244 = 0;
                  goto LABEL_451;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v244 = 0;
          }
LABEL_451:
          BOOL v293 = v244 != 0;
          uint64_t v294 = 71;
          goto LABEL_468;
        case 0x2Bu:
          char v249 = 0;
          unsigned int v250 = 0;
          uint64_t v251 = 0;
          v5->_hasIsUnicornFlag = 1;
          while (2)
          {
            uint64_t v252 = *v6;
            uint64_t v253 = *(void *)&v4[v252];
            unint64_t v254 = v253 + 1;
            if (v253 == -1 || v254 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v255 = *(unsigned char *)(*(void *)&v4[*v9] + v253);
              *(void *)&v4[v252] = v254;
              v251 |= (unint64_t)(v255 & 0x7F) << v249;
              if (v255 < 0)
              {
                v249 += 7;
                BOOL v17 = v250++ >= 9;
                if (v17)
                {
                  uint64_t v251 = 0;
                  goto LABEL_455;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v251 = 0;
          }
LABEL_455:
          BOOL v293 = v251 != 0;
          uint64_t v294 = 73;
          goto LABEL_468;
        case 0x2Cu:
          char v256 = 0;
          unsigned int v257 = 0;
          uint64_t v258 = 0;
          v5->_hasIsSupportedUnicornMatchFlag = 1;
          while (2)
          {
            uint64_t v259 = *v6;
            uint64_t v260 = *(void *)&v4[v259];
            unint64_t v261 = v260 + 1;
            if (v260 == -1 || v261 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v262 = *(unsigned char *)(*(void *)&v4[*v9] + v260);
              *(void *)&v4[v259] = v261;
              v258 |= (unint64_t)(v262 & 0x7F) << v256;
              if (v262 < 0)
              {
                v256 += 7;
                BOOL v17 = v257++ >= 9;
                if (v17)
                {
                  uint64_t v258 = 0;
                  goto LABEL_459;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v258 = 0;
          }
LABEL_459:
          BOOL v293 = v258 != 0;
          uint64_t v294 = 75;
          goto LABEL_468;
        case 0x2Du:
          char v263 = 0;
          unsigned int v264 = 0;
          uint64_t v265 = 0;
          v5->_hasIsDisambiguationSelectedApp = 1;
          while (2)
          {
            uint64_t v266 = *v6;
            uint64_t v267 = *(void *)&v4[v266];
            unint64_t v268 = v267 + 1;
            if (v267 == -1 || v268 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v269 = *(unsigned char *)(*(void *)&v4[*v9] + v267);
              *(void *)&v4[v266] = v268;
              v265 |= (unint64_t)(v269 & 0x7F) << v263;
              if (v269 < 0)
              {
                v263 += 7;
                BOOL v17 = v264++ >= 9;
                if (v17)
                {
                  uint64_t v265 = 0;
                  goto LABEL_463;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v265 = 0;
          }
LABEL_463:
          BOOL v293 = v265 != 0;
          uint64_t v294 = 77;
          goto LABEL_468;
        case 0x2Eu:
          char v270 = 0;
          unsigned int v271 = 0;
          uint64_t v272 = 0;
          v5->_hasIsModelPredictedApp = 1;
          while (2)
          {
            uint64_t v273 = *v6;
            uint64_t v274 = *(void *)&v4[v273];
            unint64_t v275 = v274 + 1;
            if (v274 == -1 || v275 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v276 = *(unsigned char *)(*(void *)&v4[*v9] + v274);
              *(void *)&v4[v273] = v275;
              v272 |= (unint64_t)(v276 & 0x7F) << v270;
              if (v276 < 0)
              {
                v270 += 7;
                BOOL v17 = v271++ >= 9;
                if (v17)
                {
                  uint64_t v272 = 0;
                  goto LABEL_467;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v272 = 0;
          }
LABEL_467:
          BOOL v293 = v272 != 0;
          uint64_t v294 = 79;
LABEL_468:
          *((unsigned char *)&v5->super.super.isa + v294) = v293;
          continue;
        case 0x2Fu:
          v5->_hasUsageScoreRadio = 1;
          uint64_t v277 = *v6;
          unint64_t v278 = *(void *)&v4[v277];
          if (v278 <= 0xFFFFFFFFFFFFFFF7 && v278 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v278);
            *(void *)&v4[v277] = v278 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 248;
          goto LABEL_502;
        case 0x30u:
          v5->_hasUsageScoreMusicWithoutRadio = 1;
          uint64_t v279 = *v6;
          unint64_t v280 = *(void *)&v4[v279];
          if (v280 <= 0xFFFFFFFFFFFFFFF7 && v280 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v29 = *(objc_class **)(*(void *)&v4[*v9] + v280);
            *(void *)&v4[v279] = v280 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v29 = 0;
          }
          uint64_t v296 = 256;
LABEL_502:
          *(Class *)((char *)&v5->super.super.isa + v296) = v29;
          continue;
        case 0x31u:
          char v281 = 0;
          unsigned int v282 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalRadio = 1;
          while (2)
          {
            uint64_t v283 = *v6;
            uint64_t v284 = *(void *)&v4[v283];
            unint64_t v285 = v284 + 1;
            if (v284 == -1 || v285 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v286 = *(unsigned char *)(*(void *)&v4[*v9] + v284);
              *(void *)&v4[v283] = v285;
              v52 |= (unint64_t)(v286 & 0x7F) << v281;
              if (v286 < 0)
              {
                v281 += 7;
                BOOL v17 = v282++ >= 9;
                if (v17)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_472;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v52) = 0;
          }
LABEL_472:
          uint64_t v295 = 160;
          goto LABEL_477;
        case 0x32u:
          char v287 = 0;
          unsigned int v288 = 0;
          uint64_t v52 = 0;
          v5->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_505;
          }
          continue;
      }
      while (1)
      {
        uint64_t v289 = *v6;
        uint64_t v290 = *(void *)&v4[v289];
        unint64_t v291 = v290 + 1;
        if (v290 == -1 || v291 > *(void *)&v4[*v7]) {
          break;
        }
        char v292 = *(unsigned char *)(*(void *)&v4[*v9] + v290);
        *(void *)&v4[v289] = v291;
        v52 |= (unint64_t)(v292 & 0x7F) << v287;
        if ((v292 & 0x80) == 0) {
          goto LABEL_474;
        }
        v287 += 7;
        BOOL v17 = v288++ >= 9;
        if (v17)
        {
          LODWORD(v52) = 0;
          goto LABEL_476;
        }
      }
      v4[*v8] = 1;
LABEL_474:
      if (v4[*v8]) {
        LODWORD(v52) = 0;
      }
LABEL_476:
      uint64_t v295 = 164;
LABEL_477:
      *(_DWORD *)((char *)&v5->super.super.isa + v295) = v52;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_505:
  }
    id v297 = 0;
  else {
LABEL_506:
  }
    id v297 = v5;

  return v297;
}

- (NSString)description
{
  id v30 = [NSString alloc];
  uint64_t v64 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
  id v3 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundActiveBundleScore];
  char v67 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self compoundMediaTypeBundleScore];
  unint64_t v66 = objc_msgSend(v4, "numberWithDouble:");
  id v5 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleRecencyS];
  uint64_t v65 = objc_msgSend(v5, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self entitySearchBundleScore];
  char v61 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v63 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
  unsigned int v62 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
  unint64_t v60 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
  double v7 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleRecencyS];
  uint64_t v57 = objc_msgSend(v7, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self nowPlayingBundleScore];
  uint64_t v59 = objc_msgSend(v8, "numberWithDouble:");
  char v56 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
  unint64_t v58 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
  uint64_t v53 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
  unint64_t v55 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
  uint64_t v52 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
  char v50 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
  unsigned int v51 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
  char v49 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
  uint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
  unsigned int v44 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
  unint64_t v48 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
  char v43 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
  uint64_t v45 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
  char v42 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
  unint64_t v41 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
  uint64_t v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
  uint64_t v38 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
  unint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
  unsigned int v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
  id v9 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreBooks];
  char v36 = objc_msgSend(v9, "numberWithDouble:");
  char v10 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusic];
  unint64_t v35 = objc_msgSend(v10, "numberWithDouble:");
  unsigned int v11 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScorePodcasts];
  uint64_t v27 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
  char v26 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
  unint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
  unint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
  unint64_t v12 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self vq21Score];
  uint64_t v32 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
  unsigned int v21 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
  uint64_t v14 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreRadio];
  unint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  char v16 = NSNumber;
  [(BMSiriMusicInferenceTrainingDependentSignals *)self usageScoreMusicWithoutRadio];
  BOOL v17 = objc_msgSend(v16, "numberWithDouble:");
  int v18 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
  int v19 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
  id v31 = (id)objc_msgSend(v30, "initWithFormat:", @"BMSiriMusicInferenceTrainingDependentSignals with isClientForegroundActiveBundle: %@, compoundActiveBundleScore: %@, compoundMediaTypeBundleScore: %@, entitySearchBundleRecencyS: %@, entitySearchBundleScore: %@, isForegroundBundle: %@, isNowPlayingBundle: %@, nowPlayingBundleCount: %@, nowPlayingBundleRecencyS: %@, nowPlayingBundleScore: %@, isNowPlayingLastBundle: %@, nowPlayingUsage1Day: %@, nowPlayingUsage7Days: %@, nowPlayingUsage14Days: %@, isRawLastNowPlayingCoreDuet: %@, isRawMediaCategoryAudiobookSignal: %@, isRawMediaCategoryMusicSignal: %@, isRawMediaCategoryPodcastSignal: %@, isRawMediaCategoryRadioSignal: %@, isRawMediaCategoryVideoSignal: %@, rawMediaTypeUsageSignalBook: %@, rawMediaTypeUsageSignalMusic: %@, rawMediaTypeUsageSignalPodcast: %@, rawMediaTypeUsageSignalVideo: %@, rawNowPlayingCountCoreDuet10Min: %@, rawNowPlayingCountCoreDuet1Day: %@, rawNowPlayingCountCoreDuet1Hr: %@, rawNowPlayingCountCoreDuet28Day: %@, rawNowPlayingCountCoreDuet2Min: %@, rawNowPlayingCountCoreDuet6Hr: %@, rawNowPlayingCountCoreDuet7Day: %@, rawNowPlayingRecencyCD: %@, rawEntitySearchRecency: %@, usageScoreBooks: %@, usageScoreMusic: %@, usageScorePodcasts: %@, isAppFirstParty: %@, isRequestedApp: %@, isNowPlayingBundlePSE1: %@, isNowPlayingBundlePSE2: %@, vq21Score: %@, isSupportedFlag: %@, isUnicornFlag: %@, isSupportedUnicornMatchFlag: %@, isDisambiguationSelectedApp: %@, isModelPredictedApp: %@, usageScoreRadio: %@, usageScoreMusicWithoutRadio: %@, rawMediaTypeUsageSignalRadio: %@, rawMediaTypeUsageSignalMusicWithoutRadio: %@", v64, v67, v66, v65, v61, v63, v62, v60, v57, v59, v56, v58, v53, v55, v52, v50,
              v54,
              v51,
              v47,
              v49,
              v46,
              v44,
              v48,
              v43,
              v45,
              v42,
              v41,
              v40,
              v38,
              v29,
              v39,
              v28,
              v37,
              v36,
              v35,
              v27,
              v34,
              v26,
              v33,
              v25,
              v32,
              v24,
              v23,
              v22,
              v21,
              v13,
              v15,
              v17,
              v18,
              v19);

  return (NSString *)v31;
}

- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48 usageScoreRadio:(id)a49 usageScoreMusicWithoutRadio:(id)a50 rawMediaTypeUsageSignalRadio:(id)a51 rawMediaTypeUsageSignalMusicWithoutRadio:(id)a52
{
  id v141 = a3;
  id v140 = a4;
  id v139 = a5;
  id v138 = a6;
  id v137 = a7;
  id v136 = a8;
  id v134 = a9;
  id v56 = a10;
  id v133 = a11;
  id v132 = a12;
  id v131 = a13;
  id v130 = a14;
  id v129 = a15;
  id v128 = a16;
  id v127 = a17;
  id v126 = a18;
  id v125 = a19;
  id v124 = a20;
  id v123 = a21;
  id v122 = a22;
  id v121 = a23;
  id v120 = a24;
  id v119 = a25;
  id v118 = a26;
  id v117 = a27;
  id v116 = a28;
  id v115 = a29;
  id v114 = a30;
  id v113 = a31;
  id v112 = a32;
  id v111 = a33;
  id v110 = a34;
  id v109 = a35;
  id v108 = a36;
  id v107 = a37;
  id v106 = a38;
  id v105 = a39;
  id v104 = a40;
  id v103 = a41;
  id v102 = a42;
  id v101 = a43;
  id v100 = a44;
  id v57 = a45;
  id v58 = a46;
  id v59 = a47;
  id v60 = a48;
  id v61 = a49;
  id v62 = a50;
  id v63 = a51;
  id v64 = a52;
  v142.receiver = self;
  v142.super_class = (Class)BMSiriMusicInferenceTrainingDependentSignals;
  uint64_t v65 = [(BMEventBase *)&v142 init];

  if (v65)
  {
    v65->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v141)
    {
      v65->_hasIsClientForegroundActiveBundle = 1;
      v65->_isClientForegroundActiveBundle = [v141 BOOLValue];
    }
    else
    {
      v65->_hasIsClientForegroundActiveBundle = 0;
      v65->_isClientForegroundActiveBundle = 0;
    }
    if (v140)
    {
      v65->_hasCompoundActiveBundleScore = 1;
      [v140 doubleValue];
    }
    else
    {
      v65->_hasCompoundActiveBundleScore = 0;
      double v66 = -1.0;
    }
    v65->_compoundActiveBundleScore = v66;
    if (v139)
    {
      v65->_hasCompoundMediaTypeBundleScore = 1;
      [v139 doubleValue];
    }
    else
    {
      v65->_hasCompoundMediaTypeBundleScore = 0;
      double v67 = -1.0;
    }
    v65->_compoundMediaTypeBundleScore = v67;
    if (v138)
    {
      v65->_hasEntitySearchBundleRecencyS = 1;
      [v138 doubleValue];
    }
    else
    {
      v65->_hasEntitySearchBundleRecencyS = 0;
      double v68 = -1.0;
    }
    v65->_entitySearchBundleRecencyS = v68;
    if (v137)
    {
      v65->_hasEntitySearchBundleScore = 1;
      [v137 doubleValue];
    }
    else
    {
      v65->_hasEntitySearchBundleScore = 0;
      double v69 = -1.0;
    }
    v65->_entitySearchBundleScore = v69;
    if (v136)
    {
      v65->_hasIsForegroundBundle = 1;
      v65->_isForegroundBundle = [v136 BOOLValue];
    }
    else
    {
      v65->_hasIsForegroundBundle = 0;
      v65->_isForegroundBundle = 0;
    }
    if (v134)
    {
      v65->_hasIsNowPlayingBundle = 1;
      v65->_isNowPlayingBundle = [v134 BOOLValue];
    }
    else
    {
      v65->_hasIsNowPlayingBundle = 0;
      v65->_isNowPlayingBundle = 0;
    }
    if (v56)
    {
      v65->_hasNowPlayingBundleCount = 1;
      int v70 = [v56 intValue];
    }
    else
    {
      v65->_hasNowPlayingBundleCount = 0;
      int v70 = -1;
    }
    v65->_nowPlayingBundleCount = v70;
    if (v133)
    {
      v65->_hasNowPlayingBundleRecencyS = 1;
      [v133 doubleValue];
    }
    else
    {
      v65->_hasNowPlayingBundleRecencyS = 0;
      double v71 = -1.0;
    }
    v65->_nowPlayingBundleRecencyS = v71;
    if (v132)
    {
      v65->_hasNowPlayingBundleScore = 1;
      [v132 doubleValue];
    }
    else
    {
      v65->_hasNowPlayingBundleScore = 0;
      double v72 = -1.0;
    }
    v65->_nowPlayingBundleScore = v72;
    if (v131)
    {
      v65->_hasIsNowPlayingLastBundle = 1;
      v65->_isNowPlayingLastBundle = [v131 BOOLValue];
    }
    else
    {
      v65->_hasIsNowPlayingLastBundle = 0;
      v65->_isNowPlayingLastBundle = 0;
    }
    if (v130)
    {
      v65->_hasNowPlayingUsage1Day = 1;
      int v73 = [v130 intValue];
    }
    else
    {
      v65->_hasNowPlayingUsage1Day = 0;
      int v73 = -1;
    }
    v65->_nowPlayingUsage1Day = v73;
    if (v129)
    {
      v65->_hasNowPlayingUsage7Days = 1;
      int v74 = [v129 intValue];
    }
    else
    {
      v65->_hasNowPlayingUsage7Days = 0;
      int v74 = -1;
    }
    v65->_nowPlayingUsage7Days = v74;
    if (v128)
    {
      v65->_hasNowPlayingUsage14Days = 1;
      int v75 = [v128 intValue];
    }
    else
    {
      v65->_hasNowPlayingUsage14Days = 0;
      int v75 = -1;
    }
    v65->_nowPlayingUsage14Days = v75;
    if (v127)
    {
      v65->_hasIsRawLastNowPlayingCoreDuet = 1;
      v65->_isRawLastNowPlayingCoreDuet = [v127 BOOLValue];
    }
    else
    {
      v65->_hasIsRawLastNowPlayingCoreDuet = 0;
      v65->_isRawLastNowPlayingCoreDuet = 0;
    }
    if (v126)
    {
      v65->_hasIsRawMediaCategoryAudiobookSignal = 1;
      v65->_isRawMediaCategoryAudiobookSignal = [v126 BOOLValue];
    }
    else
    {
      v65->_hasIsRawMediaCategoryAudiobookSignal = 0;
      v65->_isRawMediaCategoryAudiobookSignal = 0;
    }
    if (v125)
    {
      v65->_hasIsRawMediaCategoryMusicSignal = 1;
      v65->_isRawMediaCategoryMusicSignal = [v125 BOOLValue];
    }
    else
    {
      v65->_hasIsRawMediaCategoryMusicSignal = 0;
      v65->_isRawMediaCategoryMusicSignal = 0;
    }
    if (v124)
    {
      v65->_hasIsRawMediaCategoryPodcastSignal = 1;
      v65->_isRawMediaCategoryPodcastSignal = [v124 BOOLValue];
    }
    else
    {
      v65->_hasIsRawMediaCategoryPodcastSignal = 0;
      v65->_isRawMediaCategoryPodcastSignal = 0;
    }
    if (v123)
    {
      v65->_hasIsRawMediaCategoryRadioSignal = 1;
      v65->_isRawMediaCategoryRadioSignal = [v123 BOOLValue];
    }
    else
    {
      v65->_hasIsRawMediaCategoryRadioSignal = 0;
      v65->_isRawMediaCategoryRadioSignal = 0;
    }
    if (v122)
    {
      v65->_hasIsRawMediaCategoryVideoSignal = 1;
      v65->_isRawMediaCategoryVideoSignal = [v122 BOOLValue];
    }
    else
    {
      v65->_hasIsRawMediaCategoryVideoSignal = 0;
      v65->_isRawMediaCategoryVideoSignal = 0;
    }
    if (v121)
    {
      v65->_hasRawMediaTypeUsageSignalBook = 1;
      int v76 = [v121 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalBook = 0;
      int v76 = -1;
    }
    v65->_rawMediaTypeUsageSignalBook = v76;
    if (v120)
    {
      v65->_hasRawMediaTypeUsageSignalMusic = 1;
      int v77 = [v120 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalMusic = 0;
      int v77 = -1;
    }
    v65->_rawMediaTypeUsageSignalMusic = v77;
    if (v119)
    {
      v65->_hasRawMediaTypeUsageSignalPodcast = 1;
      int v78 = [v119 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalPodcast = 0;
      int v78 = -1;
    }
    v65->_rawMediaTypeUsageSignalPodcast = v78;
    if (v118)
    {
      v65->_hasRawMediaTypeUsageSignalVideo = 1;
      int v79 = [v118 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalVideo = 0;
      int v79 = -1;
    }
    v65->_rawMediaTypeUsageSignalVideo = v79;
    if (v117)
    {
      v65->_hasRawNowPlayingCountCoreDuet10Min = 1;
      int v80 = [v117 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet10Min = 0;
      int v80 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet10Min = v80;
    if (v116)
    {
      v65->_hasRawNowPlayingCountCoreDuet1Day = 1;
      int v81 = [v116 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet1Day = 0;
      int v81 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet1Day = v81;
    if (v115)
    {
      v65->_hasRawNowPlayingCountCoreDuet1Hr = 1;
      int v82 = [v115 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet1Hr = 0;
      int v82 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet1Hr = v82;
    if (v114)
    {
      v65->_hasRawNowPlayingCountCoreDuet28Day = 1;
      int v83 = [v114 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet28Day = 0;
      int v83 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet28Day = v83;
    if (v113)
    {
      v65->_hasRawNowPlayingCountCoreDuet2Min = 1;
      int v84 = [v113 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet2Min = 0;
      int v84 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet2Min = v84;
    if (v112)
    {
      v65->_hasRawNowPlayingCountCoreDuet6Hr = 1;
      int v85 = [v112 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet6Hr = 0;
      int v85 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet6Hr = v85;
    if (v111)
    {
      v65->_hasRawNowPlayingCountCoreDuet7Day = 1;
      int v86 = [v111 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingCountCoreDuet7Day = 0;
      int v86 = -1;
    }
    v65->_rawNowPlayingCountCoreDuet7Day = v86;
    if (v110)
    {
      v65->_hasRawNowPlayingRecencyCD = 1;
      int v87 = [v110 intValue];
    }
    else
    {
      v65->_hasRawNowPlayingRecencyCD = 0;
      int v87 = -1;
    }
    v65->_rawNowPlayingRecencyCD = v87;
    if (v109)
    {
      v65->_hasRawEntitySearchRecency = 1;
      int v88 = [v109 intValue];
    }
    else
    {
      v65->_hasRawEntitySearchRecency = 0;
      int v88 = -1;
    }
    v65->_rawEntitySearchRecency = v88;
    if (v108)
    {
      v65->_hasUsageScoreBooks = 1;
      [v108 doubleValue];
    }
    else
    {
      v65->_hasUsageScoreBooks = 0;
      double v89 = -1.0;
    }
    v65->_usageScoreBooks = v89;
    if (v107)
    {
      v65->_hasUsageScoreMusic = 1;
      [v107 doubleValue];
    }
    else
    {
      v65->_hasUsageScoreMusic = 0;
      double v90 = -1.0;
    }
    v65->_usageScoreMusic = v90;
    if (v106)
    {
      v65->_hasUsageScorePodcasts = 1;
      [v106 doubleValue];
    }
    else
    {
      v65->_hasUsageScorePodcasts = 0;
      double v91 = -1.0;
    }
    v65->_usageScorePodcasts = v91;
    if (v105)
    {
      v65->_hasIsAppFirstParty = 1;
      v65->_isAppFirstParty = [v105 BOOLValue];
    }
    else
    {
      v65->_hasIsAppFirstParty = 0;
      v65->_isAppFirstParty = 0;
    }
    if (v104)
    {
      v65->_hasIsRequestedApp = 1;
      v65->_isRequestedApp = [v104 BOOLValue];
    }
    else
    {
      v65->_hasIsRequestedApp = 0;
      v65->_isRequestedApp = 0;
    }
    if (v103)
    {
      v65->_hasIsNowPlayingBundlePSE1 = 1;
      v65->_isNowPlayingBundlePSE1 = [v103 BOOLValue];
    }
    else
    {
      v65->_hasIsNowPlayingBundlePSE1 = 0;
      v65->_isNowPlayingBundlePSE1 = 0;
    }
    if (v102)
    {
      v65->_hasIsNowPlayingBundlePSE2 = 1;
      v65->_isNowPlayingBundlePSE2 = [v102 BOOLValue];
    }
    else
    {
      v65->_hasIsNowPlayingBundlePSE2 = 0;
      v65->_isNowPlayingBundlePSE2 = 0;
    }
    if (v101)
    {
      v65->_hasVq21Score = 1;
      [v101 doubleValue];
    }
    else
    {
      v65->_hasVq21Score = 0;
      double v92 = -1.0;
    }
    v65->_vq21Score = v92;
    if (v100)
    {
      v65->_hasIsSupportedFlag = 1;
      v65->_isSupportedFlag = [v100 BOOLValue];
    }
    else
    {
      v65->_hasIsSupportedFlag = 0;
      v65->_isSupportedFlag = 0;
    }
    if (v57)
    {
      v65->_hasIsUnicornFlag = 1;
      v65->_isUnicornFlag = [v57 BOOLValue];
    }
    else
    {
      v65->_hasIsUnicornFlag = 0;
      v65->_isUnicornFlag = 0;
    }
    if (v58)
    {
      v65->_hasIsSupportedUnicornMatchFlag = 1;
      v65->_isSupportedUnicornMatchFlag = [v58 BOOLValue];
    }
    else
    {
      v65->_hasIsSupportedUnicornMatchFlag = 0;
      v65->_isSupportedUnicornMatchFlag = 0;
    }
    if (v59)
    {
      v65->_hasIsDisambiguationSelectedApp = 1;
      v65->_isDisambiguationSelectedApp = [v59 BOOLValue];
    }
    else
    {
      v65->_hasIsDisambiguationSelectedApp = 0;
      v65->_isDisambiguationSelectedApp = 0;
    }
    if (v60)
    {
      v65->_hasIsModelPredictedApp = 1;
      v65->_isModelPredictedApp = [v60 BOOLValue];
    }
    else
    {
      v65->_hasIsModelPredictedApp = 0;
      v65->_isModelPredictedApp = 0;
    }
    if (v61)
    {
      v65->_hasUsageScoreRadio = 1;
      [v61 doubleValue];
    }
    else
    {
      v65->_hasUsageScoreRadio = 0;
      double v93 = -1.0;
    }
    v65->_usageScoreRadio = v93;
    if (v62)
    {
      v65->_hasUsageScoreMusicWithoutRadio = 1;
      [v62 doubleValue];
    }
    else
    {
      v65->_hasUsageScoreMusicWithoutRadio = 0;
      double v94 = -1.0;
    }
    v65->_usageScoreMusicWithoutRadio = v94;
    if (v63)
    {
      v65->_hasRawMediaTypeUsageSignalRadio = 1;
      int v95 = [v63 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalRadio = 0;
      int v95 = -1;
    }
    v65->_rawMediaTypeUsageSignalRadio = v95;
    if (v64)
    {
      v65->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 1;
      int v96 = [v64 intValue];
    }
    else
    {
      v65->_hasRawMediaTypeUsageSignalMusicWithoutRadio = 0;
      int v96 = -1;
    }
    v65->_rawMediaTypeUsageSignalMusicWithoutRadio = v96;
  }
  uint64_t v97 = v65;

  return v97;
}

+ (id)protoFields
{
  v54[50] = *MEMORY[0x1E4F143B8];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isClientForegroundActiveBundle" number:1 type:12 subMessageClass:0];
  v54[0] = v53;
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"compoundActiveBundleScore" number:2 type:0 subMessageClass:0];
  v54[1] = v52;
  unsigned int v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"compoundMediaTypeBundleScore" number:3 type:0 subMessageClass:0];
  v54[2] = v51;
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entitySearchBundleRecencyS" number:4 type:0 subMessageClass:0];
  v54[3] = v50;
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entitySearchBundleScore" number:5 type:0 subMessageClass:0];
  v54[4] = v49;
  unint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isForegroundBundle" number:6 type:12 subMessageClass:0];
  v54[5] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNowPlayingBundle" number:7 type:12 subMessageClass:0];
  v54[6] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingBundleCount" number:8 type:2 subMessageClass:0];
  v54[7] = v46;
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingBundleRecencyS" number:9 type:0 subMessageClass:0];
  v54[8] = v45;
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingBundleScore" number:10 type:0 subMessageClass:0];
  v54[9] = v44;
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNowPlayingLastBundle" number:11 type:12 subMessageClass:0];
  v54[10] = v43;
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingUsage1Day" number:12 type:2 subMessageClass:0];
  v54[11] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingUsage7Days" number:13 type:2 subMessageClass:0];
  v54[12] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingUsage14Days" number:14 type:2 subMessageClass:0];
  v54[13] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawLastNowPlayingCoreDuet" number:15 type:12 subMessageClass:0];
  v54[14] = v39;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawMediaCategoryAudiobookSignal" number:16 type:12 subMessageClass:0];
  v54[15] = v38;
  unsigned int v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawMediaCategoryMusicSignal" number:17 type:12 subMessageClass:0];
  v54[16] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawMediaCategoryPodcastSignal" number:18 type:12 subMessageClass:0];
  v54[17] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawMediaCategoryRadioSignal" number:19 type:12 subMessageClass:0];
  v54[18] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRawMediaCategoryVideoSignal" number:20 type:12 subMessageClass:0];
  v54[19] = v34;
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalBook" number:21 type:2 subMessageClass:0];
  v54[20] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalMusic" number:22 type:2 subMessageClass:0];
  v54[21] = v32;
  id v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalPodcast" number:23 type:2 subMessageClass:0];
  v54[22] = v31;
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalVideo" number:24 type:2 subMessageClass:0];
  v54[23] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet10Min" number:25 type:2 subMessageClass:0];
  v54[24] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet1Day" number:26 type:2 subMessageClass:0];
  v54[25] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet1Hr" number:27 type:2 subMessageClass:0];
  v54[26] = v27;
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet28Day" number:28 type:2 subMessageClass:0];
  v54[27] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet2Min" number:29 type:2 subMessageClass:0];
  v54[28] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet6Hr" number:30 type:2 subMessageClass:0];
  v54[29] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingCountCoreDuet7Day" number:31 type:2 subMessageClass:0];
  v54[30] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawNowPlayingRecencyCD" number:32 type:2 subMessageClass:0];
  v54[31] = v22;
  unsigned int v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawEntitySearchRecency" number:33 type:2 subMessageClass:0];
  v54[32] = v21;
  char v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageScoreBooks" number:34 type:0 subMessageClass:0];
  v54[33] = v20;
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageScoreMusic" number:35 type:0 subMessageClass:0];
  v54[34] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageScorePodcasts" number:36 type:0 subMessageClass:0];
  v54[35] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAppFirstParty" number:37 type:12 subMessageClass:0];
  v54[36] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRequestedApp" number:38 type:12 subMessageClass:0];
  v54[37] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNowPlayingBundlePSE1" number:39 type:12 subMessageClass:0];
  v54[38] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNowPlayingBundlePSE2" number:40 type:12 subMessageClass:0];
  v54[39] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"vq21Score" number:41 type:0 subMessageClass:0];
  v54[40] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSupportedFlag" number:42 type:12 subMessageClass:0];
  v54[41] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUnicornFlag" number:43 type:12 subMessageClass:0];
  v54[42] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSupportedUnicornMatchFlag" number:44 type:12 subMessageClass:0];
  v54[43] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDisambiguationSelectedApp" number:45 type:12 subMessageClass:0];
  v54[44] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isModelPredictedApp" number:46 type:12 subMessageClass:0];
  v54[45] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageScoreRadio" number:47 type:0 subMessageClass:0];
  v54[46] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageScoreMusicWithoutRadio" number:48 type:0 subMessageClass:0];
  v54[47] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalRadio" number:49 type:2 subMessageClass:0];
  v54[48] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMediaTypeUsageSignalMusicWithoutRadio" number:50 type:2 subMessageClass:0];
  v54[49] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4140;
}

+ (id)columns
{
  v54[50] = *MEMORY[0x1E4F143B8];
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isClientForegroundActiveBundle" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"compoundActiveBundleScore" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  unsigned int v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"compoundMediaTypeBundleScore" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entitySearchBundleRecencyS" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entitySearchBundleScore" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  unint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isForegroundBundle" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNowPlayingBundle" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingBundleCount" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingBundleRecencyS" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingBundleScore" dataType:1 requestOnly:0 fieldNumber:10 protoDataType:0 convertedType:0];
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNowPlayingLastBundle" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingUsage1Day" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingUsage7Days" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:2 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingUsage14Days" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:2 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawLastNowPlayingCoreDuet" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawMediaCategoryAudiobookSignal" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  unsigned int v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawMediaCategoryMusicSignal" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawMediaCategoryPodcastSignal" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:12 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawMediaCategoryRadioSignal" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRawMediaCategoryVideoSignal" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalBook" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalMusic" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  id v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalPodcast" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalVideo" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet10Min" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet1Day" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:2 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet1Hr" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:2 convertedType:0];
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet28Day" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:2 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet2Min" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:2 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet6Hr" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:2 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingCountCoreDuet7Day" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:2 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawNowPlayingRecencyCD" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:2 convertedType:0];
  unsigned int v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawEntitySearchRecency" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:2 convertedType:0];
  char v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageScoreBooks" dataType:1 requestOnly:0 fieldNumber:34 protoDataType:0 convertedType:0];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageScoreMusic" dataType:1 requestOnly:0 fieldNumber:35 protoDataType:0 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageScorePodcasts" dataType:1 requestOnly:0 fieldNumber:36 protoDataType:0 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAppFirstParty" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:12 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRequestedApp" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:12 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNowPlayingBundlePSE1" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNowPlayingBundlePSE2" dataType:0 requestOnly:0 fieldNumber:40 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"vq21Score" dataType:1 requestOnly:0 fieldNumber:41 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSupportedFlag" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUnicornFlag" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSupportedUnicornMatchFlag" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDisambiguationSelectedApp" dataType:0 requestOnly:0 fieldNumber:45 protoDataType:12 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isModelPredictedApp" dataType:0 requestOnly:0 fieldNumber:46 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageScoreRadio" dataType:1 requestOnly:0 fieldNumber:47 protoDataType:0 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageScoreMusicWithoutRadio" dataType:1 requestOnly:0 fieldNumber:48 protoDataType:0 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalRadio" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:2 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMediaTypeUsageSignalMusicWithoutRadio" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:2 convertedType:0];
  v54[0] = v52;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v48;
  v54[6] = v47;
  v54[7] = v46;
  v54[8] = v45;
  v54[9] = v44;
  v54[10] = v43;
  v54[11] = v42;
  v54[12] = v41;
  v54[13] = v40;
  v54[14] = v39;
  v54[15] = v38;
  v54[16] = v37;
  v54[17] = v36;
  v54[18] = v35;
  v54[19] = v34;
  v54[20] = v33;
  v54[21] = v32;
  v54[22] = v31;
  v54[23] = v30;
  v54[24] = v29;
  v54[25] = v28;
  v54[26] = v27;
  v54[27] = v26;
  v54[28] = v25;
  v54[29] = v24;
  v54[30] = v23;
  v54[31] = v22;
  v54[32] = v21;
  v54[33] = v20;
  v54[34] = v19;
  v54[35] = v18;
  v54[36] = v17;
  v54[37] = v16;
  v54[38] = v15;
  v54[39] = v14;
  v54[40] = v2;
  v54[41] = v3;
  v54[42] = v4;
  v54[43] = v5;
  v54[44] = v6;
  v54[45] = v7;
  v54[46] = v8;
  v54[47] = v13;
  v54[48] = v9;
  v54[49] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriMusicInferenceTrainingDependentSignals alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[22] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriMusicInferenceTrainingDependentSignals)initWithIsClientForegroundActiveBundle:(id)a3 compoundActiveBundleScore:(id)a4 compoundMediaTypeBundleScore:(id)a5 entitySearchBundleRecencyS:(id)a6 entitySearchBundleScore:(id)a7 isForegroundBundle:(id)a8 isNowPlayingBundle:(id)a9 nowPlayingBundleCount:(id)a10 nowPlayingBundleRecencyS:(id)a11 nowPlayingBundleScore:(id)a12 isNowPlayingLastBundle:(id)a13 nowPlayingUsage1Day:(id)a14 nowPlayingUsage7Days:(id)a15 nowPlayingUsage14Days:(id)a16 isRawLastNowPlayingCoreDuet:(id)a17 isRawMediaCategoryAudiobookSignal:(id)a18 isRawMediaCategoryMusicSignal:(id)a19 isRawMediaCategoryPodcastSignal:(id)a20 isRawMediaCategoryRadioSignal:(id)a21 isRawMediaCategoryVideoSignal:(id)a22 rawMediaTypeUsageSignalBook:(id)a23 rawMediaTypeUsageSignalMusic:(id)a24 rawMediaTypeUsageSignalPodcast:(id)a25 rawMediaTypeUsageSignalVideo:(id)a26 rawNowPlayingCountCoreDuet10Min:(id)a27 rawNowPlayingCountCoreDuet1Day:(id)a28 rawNowPlayingCountCoreDuet1Hr:(id)a29 rawNowPlayingCountCoreDuet28Day:(id)a30 rawNowPlayingCountCoreDuet2Min:(id)a31 rawNowPlayingCountCoreDuet6Hr:(id)a32 rawNowPlayingCountCoreDuet7Day:(id)a33 rawNowPlayingRecencyCD:(id)a34 rawEntitySearchRecency:(id)a35 usageScoreBooks:(id)a36 usageScoreMusic:(id)a37 usageScorePodcasts:(id)a38 isAppFirstParty:(id)a39 isRequestedApp:(id)a40 isNowPlayingBundlePSE1:(id)a41 isNowPlayingBundlePSE2:(id)a42 vq21Score:(id)a43 isSupportedFlag:(id)a44 isUnicornFlag:(id)a45 isSupportedUnicornMatchFlag:(id)a46 isDisambiguationSelectedApp:(id)a47 isModelPredictedApp:(id)a48
{
  return -[BMSiriMusicInferenceTrainingDependentSignals initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:](self, "initWithIsClientForegroundActiveBundle:compoundActiveBundleScore:compoundMediaTypeBundleScore:entitySearchBundleRecencyS:entitySearchBundleScore:isForegroundBundle:isNowPlayingBundle:nowPlayingBundleCount:nowPlayingBundleRecencyS:nowPlayingBundleScore:isNowPlayingLastBundle:nowPlayingUsage1Day:nowPlayingUsage7Days:nowPlayingUsage14Days:isRawLastNowPlayingCoreDuet:isRawMediaCategoryAudiobookSignal:isRawMediaCategoryMusicSignal:isRawMediaCategoryPodcastSignal:isRawMediaCategoryRadioSignal:isRawMediaCategoryVideoSignal:rawMediaTypeUsageSignalBook:rawMediaTypeUsageSignalMusic:rawMediaTypeUsageSignalPodcast:rawMediaTypeUsageSignalVideo:rawNowPlayingCountCoreDuet10Min:rawNowPlayingCountCoreDuet1Day:rawNowPlayingCountCoreDuet1Hr:rawNowPlayingCountCoreDuet28Day:rawNowPlayingCountCoreDuet2Min:rawNowPlayingCountCoreDuet6Hr:rawNowPlayingCountCoreDuet7Day:rawNowPlayingRecencyCD:rawEntitySearchRecency:usageScoreBooks:usageScoreMusic:usageScorePodcasts:isAppFirstParty:isRequestedApp:isNowPlayingBundlePSE1:isNowPlayingBundlePSE2:vq21Score:isSupportedFlag:isUnicornFlag:isSupportedUnicornMatchFlag:isDisambiguationSelectedApp:isModelPredictedApp:usageScoreRadio:usageScoreMusicWithoutRadio:rawMediaTypeUsageSignalRadio:rawMediaTypeUsageSignalMusicWithoutRadio:", a3, a4, a5, a6, a7, a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           0,
           0,
           0,
           0);
}

@end