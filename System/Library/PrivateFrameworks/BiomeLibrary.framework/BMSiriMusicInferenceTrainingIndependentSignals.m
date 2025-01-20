@interface BMSiriMusicInferenceTrainingIndependentSignals
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriMusicInferenceTrainingIndependentSignals)initWithClientDayOfWeek:(id)a3 rawClientHourOfDay:(id)a4 isMediaAlbumPresent:(id)a5 isMediaArtistPresent:(id)a6 isMediaGenrePresent:(id)a7 isMediaMoodPresent:(id)a8 isMediaNamePresent:(id)a9 isMediaReleaseDatePresent:(id)a10 nowPlayingLastBundleRecencyS:(id)a11 rawLanguage:(id)a12 rawLocale:(id)a13 rawRegion:(id)a14 isClientDaylight:(id)a15 isClientNavigating:(id)a16 isClientWorkout:(id)a17 mediaType:(id)a18 nowPlayingState:(id)a19 isPireneRequest:(id)a20 foregroundBundleRecencyS:(id)a21 mediaParsecCategory:(id)a22 sirikitResponseCode:(id)a23 appSelectionUses:(id)a24 modelVersion:(id)a25 resolutionType:(int)a26;
- (BMSiriMusicInferenceTrainingIndependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAppSelectionUses;
- (BOOL)hasClientDayOfWeek;
- (BOOL)hasForegroundBundleRecencyS;
- (BOOL)hasIsClientDaylight;
- (BOOL)hasIsClientNavigating;
- (BOOL)hasIsClientWorkout;
- (BOOL)hasIsMediaAlbumPresent;
- (BOOL)hasIsMediaArtistPresent;
- (BOOL)hasIsMediaGenrePresent;
- (BOOL)hasIsMediaMoodPresent;
- (BOOL)hasIsMediaNamePresent;
- (BOOL)hasIsMediaReleaseDatePresent;
- (BOOL)hasIsPireneRequest;
- (BOOL)hasMediaParsecCategory;
- (BOOL)hasMediaType;
- (BOOL)hasModelVersion;
- (BOOL)hasNowPlayingLastBundleRecencyS;
- (BOOL)hasNowPlayingState;
- (BOOL)hasRawClientHourOfDay;
- (BOOL)hasRawLanguage;
- (BOOL)hasRawLocale;
- (BOOL)hasRawRegion;
- (BOOL)hasSirikitResponseCode;
- (BOOL)isClientDaylight;
- (BOOL)isClientNavigating;
- (BOOL)isClientWorkout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaAlbumPresent;
- (BOOL)isMediaArtistPresent;
- (BOOL)isMediaGenrePresent;
- (BOOL)isMediaMoodPresent;
- (BOOL)isMediaNamePresent;
- (BOOL)isMediaReleaseDatePresent;
- (BOOL)isPireneRequest;
- (NSString)description;
- (double)foregroundBundleRecencyS;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)appSelectionUses;
- (int)clientDayOfWeek;
- (int)mediaParsecCategory;
- (int)mediaType;
- (int)nowPlayingLastBundleRecencyS;
- (int)nowPlayingState;
- (int)rawClientHourOfDay;
- (int)resolutionType;
- (int)sirikitResponseCode;
- (int64_t)rawLanguage;
- (int64_t)rawLocale;
- (int64_t)rawRegion;
- (unsigned)dataVersion;
- (unsigned)modelVersion;
- (void)setHasAppSelectionUses:(BOOL)a3;
- (void)setHasClientDayOfWeek:(BOOL)a3;
- (void)setHasForegroundBundleRecencyS:(BOOL)a3;
- (void)setHasIsClientDaylight:(BOOL)a3;
- (void)setHasIsClientNavigating:(BOOL)a3;
- (void)setHasIsClientWorkout:(BOOL)a3;
- (void)setHasIsMediaAlbumPresent:(BOOL)a3;
- (void)setHasIsMediaArtistPresent:(BOOL)a3;
- (void)setHasIsMediaGenrePresent:(BOOL)a3;
- (void)setHasIsMediaMoodPresent:(BOOL)a3;
- (void)setHasIsMediaNamePresent:(BOOL)a3;
- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3;
- (void)setHasIsPireneRequest:(BOOL)a3;
- (void)setHasMediaParsecCategory:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3;
- (void)setHasNowPlayingState:(BOOL)a3;
- (void)setHasRawClientHourOfDay:(BOOL)a3;
- (void)setHasRawLanguage:(BOOL)a3;
- (void)setHasRawLocale:(BOOL)a3;
- (void)setHasRawRegion:(BOOL)a3;
- (void)setHasSirikitResponseCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriMusicInferenceTrainingIndependentSignals

- (int)resolutionType
{
  return self->_resolutionType;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return self->_hasModelVersion;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  self->_hasAppSelectionUses = a3;
}

- (BOOL)hasAppSelectionUses
{
  return self->_hasAppSelectionUses;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  self->_hasSirikitResponseCode = a3;
}

- (BOOL)hasSirikitResponseCode
{
  return self->_hasSirikitResponseCode;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (void)setHasMediaParsecCategory:(BOOL)a3
{
  self->_hasMediaParsecCategory = a3;
}

- (BOOL)hasMediaParsecCategory
{
  return self->_hasMediaParsecCategory;
}

- (int)mediaParsecCategory
{
  return self->_mediaParsecCategory;
}

- (void)setHasForegroundBundleRecencyS:(BOOL)a3
{
  self->_hasForegroundBundleRecencyS = a3;
}

- (BOOL)hasForegroundBundleRecencyS
{
  return self->_hasForegroundBundleRecencyS;
}

- (double)foregroundBundleRecencyS
{
  return self->_foregroundBundleRecencyS;
}

- (void)setHasIsPireneRequest:(BOOL)a3
{
  self->_hasIsPireneRequest = a3;
}

- (BOOL)hasIsPireneRequest
{
  return self->_hasIsPireneRequest;
}

- (BOOL)isPireneRequest
{
  return self->_isPireneRequest;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  self->_hasNowPlayingState = a3;
}

- (BOOL)hasNowPlayingState
{
  return self->_hasNowPlayingState;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (void)setHasIsClientWorkout:(BOOL)a3
{
  self->_hasIsClientWorkout = a3;
}

- (BOOL)hasIsClientWorkout
{
  return self->_hasIsClientWorkout;
}

- (BOOL)isClientWorkout
{
  return self->_isClientWorkout;
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  self->_hasIsClientNavigating = a3;
}

- (BOOL)hasIsClientNavigating
{
  return self->_hasIsClientNavigating;
}

- (BOOL)isClientNavigating
{
  return self->_isClientNavigating;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  self->_hasIsClientDaylight = a3;
}

- (BOOL)hasIsClientDaylight
{
  return self->_hasIsClientDaylight;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (void)setHasRawRegion:(BOOL)a3
{
  self->_hasRawRegion = a3;
}

- (BOOL)hasRawRegion
{
  return self->_hasRawRegion;
}

- (int64_t)rawRegion
{
  return self->_rawRegion;
}

- (void)setHasRawLocale:(BOOL)a3
{
  self->_hasRawLocale = a3;
}

- (BOOL)hasRawLocale
{
  return self->_hasRawLocale;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  self->_hasRawLanguage = a3;
}

- (BOOL)hasRawLanguage
{
  return self->_hasRawLanguage;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3
{
  self->_hasNowPlayingLastBundleRecencyS = a3;
}

- (BOOL)hasNowPlayingLastBundleRecencyS
{
  return self->_hasNowPlayingLastBundleRecencyS;
}

- (int)nowPlayingLastBundleRecencyS
{
  return self->_nowPlayingLastBundleRecencyS;
}

- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3
{
  self->_hasIsMediaReleaseDatePresent = a3;
}

- (BOOL)hasIsMediaReleaseDatePresent
{
  return self->_hasIsMediaReleaseDatePresent;
}

- (BOOL)isMediaReleaseDatePresent
{
  return self->_isMediaReleaseDatePresent;
}

- (void)setHasIsMediaNamePresent:(BOOL)a3
{
  self->_hasIsMediaNamePresent = a3;
}

- (BOOL)hasIsMediaNamePresent
{
  return self->_hasIsMediaNamePresent;
}

- (BOOL)isMediaNamePresent
{
  return self->_isMediaNamePresent;
}

- (void)setHasIsMediaMoodPresent:(BOOL)a3
{
  self->_hasIsMediaMoodPresent = a3;
}

- (BOOL)hasIsMediaMoodPresent
{
  return self->_hasIsMediaMoodPresent;
}

- (BOOL)isMediaMoodPresent
{
  return self->_isMediaMoodPresent;
}

- (void)setHasIsMediaGenrePresent:(BOOL)a3
{
  self->_hasIsMediaGenrePresent = a3;
}

- (BOOL)hasIsMediaGenrePresent
{
  return self->_hasIsMediaGenrePresent;
}

- (BOOL)isMediaGenrePresent
{
  return self->_isMediaGenrePresent;
}

- (void)setHasIsMediaArtistPresent:(BOOL)a3
{
  self->_hasIsMediaArtistPresent = a3;
}

- (BOOL)hasIsMediaArtistPresent
{
  return self->_hasIsMediaArtistPresent;
}

- (BOOL)isMediaArtistPresent
{
  return self->_isMediaArtistPresent;
}

- (void)setHasIsMediaAlbumPresent:(BOOL)a3
{
  self->_hasIsMediaAlbumPresent = a3;
}

- (BOOL)hasIsMediaAlbumPresent
{
  return self->_hasIsMediaAlbumPresent;
}

- (BOOL)isMediaAlbumPresent
{
  return self->_isMediaAlbumPresent;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  self->_hasRawClientHourOfDay = a3;
}

- (BOOL)hasRawClientHourOfDay
{
  return self->_hasRawClientHourOfDay;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  self->_hasClientDayOfWeek = a3;
}

- (BOOL)hasClientDayOfWeek
{
  return self->_hasClientDayOfWeek;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasClientDayOfWeek]
      || [v5 hasClientDayOfWeek])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasClientDayOfWeek]) {
        goto LABEL_119;
      }
      if (![v5 hasClientDayOfWeek]) {
        goto LABEL_119;
      }
      int v6 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self clientDayOfWeek];
      if (v6 != [v5 clientDayOfWeek]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawClientHourOfDay]
      || [v5 hasRawClientHourOfDay])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawClientHourOfDay]) {
        goto LABEL_119;
      }
      if (![v5 hasRawClientHourOfDay]) {
        goto LABEL_119;
      }
      int v7 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self rawClientHourOfDay];
      if (v7 != [v5 rawClientHourOfDay]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaAlbumPresent]
      || [v5 hasIsMediaAlbumPresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaAlbumPresent]) {
        goto LABEL_119;
      }
      if (![v5 hasIsMediaAlbumPresent]) {
        goto LABEL_119;
      }
      int v8 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaAlbumPresent];
      if (v8 != [v5 isMediaAlbumPresent]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaArtistPresent]
      || [v5 hasIsMediaArtistPresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaArtistPresent]) {
        goto LABEL_119;
      }
      if (![v5 hasIsMediaArtistPresent]) {
        goto LABEL_119;
      }
      int v9 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaArtistPresent];
      if (v9 != [v5 isMediaArtistPresent]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaGenrePresent]
      || [v5 hasIsMediaGenrePresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaGenrePresent]) {
        goto LABEL_119;
      }
      if (![v5 hasIsMediaGenrePresent]) {
        goto LABEL_119;
      }
      int v10 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaGenrePresent];
      if (v10 != [v5 isMediaGenrePresent]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaMoodPresent]
      || [v5 hasIsMediaMoodPresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaMoodPresent]) {
        goto LABEL_119;
      }
      if (![v5 hasIsMediaMoodPresent]) {
        goto LABEL_119;
      }
      int v11 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaMoodPresent];
      if (v11 != [v5 isMediaMoodPresent]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaNamePresent]
      || [v5 hasIsMediaNamePresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaNamePresent]) {
        goto LABEL_119;
      }
      if (![v5 hasIsMediaNamePresent]) {
        goto LABEL_119;
      }
      int v12 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaNamePresent];
      if (v12 != [v5 isMediaNamePresent]) {
        goto LABEL_119;
      }
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasIsMediaReleaseDatePresent](self, "hasIsMediaReleaseDatePresent")|| [v5 hasIsMediaReleaseDatePresent])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaReleaseDatePresent])goto LABEL_119; {
      if (![v5 hasIsMediaReleaseDatePresent])
      }
        goto LABEL_119;
      int v13 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isMediaReleaseDatePresent];
      if (v13 != [v5 isMediaReleaseDatePresent]) {
        goto LABEL_119;
      }
    }
    if (-[BMSiriMusicInferenceTrainingIndependentSignals hasNowPlayingLastBundleRecencyS](self, "hasNowPlayingLastBundleRecencyS")|| [v5 hasNowPlayingLastBundleRecencyS])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasNowPlayingLastBundleRecencyS])goto LABEL_119; {
      if (![v5 hasNowPlayingLastBundleRecencyS])
      }
        goto LABEL_119;
      int v14 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self nowPlayingLastBundleRecencyS];
      if (v14 != [v5 nowPlayingLastBundleRecencyS]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLanguage]
      || [v5 hasRawLanguage])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLanguage]) {
        goto LABEL_119;
      }
      if (![v5 hasRawLanguage]) {
        goto LABEL_119;
      }
      int64_t v15 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self rawLanguage];
      if (v15 != [v5 rawLanguage]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLocale]
      || [v5 hasRawLocale])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLocale]) {
        goto LABEL_119;
      }
      if (![v5 hasRawLocale]) {
        goto LABEL_119;
      }
      int64_t v16 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self rawLocale];
      if (v16 != [v5 rawLocale]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawRegion]
      || [v5 hasRawRegion])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawRegion]) {
        goto LABEL_119;
      }
      if (![v5 hasRawRegion]) {
        goto LABEL_119;
      }
      int64_t v17 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self rawRegion];
      if (v17 != [v5 rawRegion]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientDaylight]
      || [v5 hasIsClientDaylight])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientDaylight]) {
        goto LABEL_119;
      }
      if (![v5 hasIsClientDaylight]) {
        goto LABEL_119;
      }
      int v18 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isClientDaylight];
      if (v18 != [v5 isClientDaylight]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientNavigating]
      || [v5 hasIsClientNavigating])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientNavigating]) {
        goto LABEL_119;
      }
      if (![v5 hasIsClientNavigating]) {
        goto LABEL_119;
      }
      int v19 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isClientNavigating];
      if (v19 != [v5 isClientNavigating]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientWorkout]
      || [v5 hasIsClientWorkout])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientWorkout]) {
        goto LABEL_119;
      }
      if (![v5 hasIsClientWorkout]) {
        goto LABEL_119;
      }
      int v20 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isClientWorkout];
      if (v20 != [v5 isClientWorkout]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasMediaType]
      || [v5 hasMediaType])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasMediaType]) {
        goto LABEL_119;
      }
      if (![v5 hasMediaType]) {
        goto LABEL_119;
      }
      int v21 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self mediaType];
      if (v21 != [v5 mediaType]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasNowPlayingState]
      || [v5 hasNowPlayingState])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasNowPlayingState]) {
        goto LABEL_119;
      }
      if (![v5 hasNowPlayingState]) {
        goto LABEL_119;
      }
      int v22 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self nowPlayingState];
      if (v22 != [v5 nowPlayingState]) {
        goto LABEL_119;
      }
    }
    if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsPireneRequest]
      || [v5 hasIsPireneRequest])
    {
      if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsPireneRequest]) {
        goto LABEL_119;
      }
      if (![v5 hasIsPireneRequest]) {
        goto LABEL_119;
      }
      int v23 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self isPireneRequest];
      if (v23 != [v5 isPireneRequest]) {
        goto LABEL_119;
      }
    }
    if ((!-[BMSiriMusicInferenceTrainingIndependentSignals hasForegroundBundleRecencyS](self, "hasForegroundBundleRecencyS")&& ![v5 hasForegroundBundleRecencyS]|| -[BMSiriMusicInferenceTrainingIndependentSignals hasForegroundBundleRecencyS](self, "hasForegroundBundleRecencyS")&& objc_msgSend(v5, "hasForegroundBundleRecencyS")&& (-[BMSiriMusicInferenceTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS"), double v25 = v24, objc_msgSend(v5, "foregroundBundleRecencyS"), v25 == v26))&& (!-[BMSiriMusicInferenceTrainingIndependentSignals hasMediaParsecCategory](self, "hasMediaParsecCategory")&& !objc_msgSend(v5, "hasMediaParsecCategory")|| -[BMSiriMusicInferenceTrainingIndependentSignals hasMediaParsecCategory](self, "hasMediaParsecCategory")&& objc_msgSend(v5, "hasMediaParsecCategory")&& (v27 = -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"), v27 == objc_msgSend(v5, "mediaParsecCategory")))&& (!-[BMSiriMusicInferenceTrainingIndependentSignals hasSirikitResponseCode](self, "hasSirikitResponseCode")&& !objc_msgSend(v5, "hasSirikitResponseCode")
       || [(BMSiriMusicInferenceTrainingIndependentSignals *)self hasSirikitResponseCode]
       && [v5 hasSirikitResponseCode]
       && (int v28 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self sirikitResponseCode],
           v28 == [v5 sirikitResponseCode]))
      && (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasAppSelectionUses]
       && ![v5 hasAppSelectionUses]
       || [(BMSiriMusicInferenceTrainingIndependentSignals *)self hasAppSelectionUses]
       && [v5 hasAppSelectionUses]
       && (int v29 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self appSelectionUses],
           v29 == [v5 appSelectionUses]))
      && (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasModelVersion]
       && ![v5 hasModelVersion]
       || [(BMSiriMusicInferenceTrainingIndependentSignals *)self hasModelVersion]
       && [v5 hasModelVersion]
       && (unsigned int v30 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self modelVersion],
           v30 == [v5 modelVersion])))
    {
      int v31 = [(BMSiriMusicInferenceTrainingIndependentSignals *)self resolutionType];
      BOOL v32 = v31 == [v5 resolutionType];
    }
    else
    {
LABEL_119:
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (id)jsonDictionary
{
  v84[24] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasClientDayOfWeek])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawClientHourOfDay])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaAlbumPresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaArtistPresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaGenrePresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaMoodPresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaNamePresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsMediaReleaseDatePresent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
    id v82 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v82 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasNowPlayingLastBundleRecencyS])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v81 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLanguage])
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawLocale])
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLocale](self, "rawLocale"));
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v79 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasRawRegion])
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawRegion](self, "rawRegion"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientDaylight])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
    id v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v77 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientNavigating])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v76 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsClientWorkout])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
    id v75 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v75 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasMediaType])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaType](self, "mediaType"));
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasNowPlayingState])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
    id v73 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v73 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasIsPireneRequest])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
    id v72 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v72 = 0;
  }
  if (![(BMSiriMusicInferenceTrainingIndependentSignals *)self hasForegroundBundleRecencyS]|| ([(BMSiriMusicInferenceTrainingIndependentSignals *)self foregroundBundleRecencyS], fabs(v10) == INFINITY))
  {
    id v71 = 0;
  }
  else
  {
    [(BMSiriMusicInferenceTrainingIndependentSignals *)self foregroundBundleRecencyS];
    int v11 = NSNumber;
    [(BMSiriMusicInferenceTrainingIndependentSignals *)self foregroundBundleRecencyS];
    objc_msgSend(v11, "numberWithDouble:");
    id v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasMediaParsecCategory])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v70 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasSirikitResponseCode])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v69 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasAppSelectionUses])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  if ([(BMSiriMusicInferenceTrainingIndependentSignals *)self hasModelVersion])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriMusicInferenceTrainingIndependentSignals modelVersion](self, "modelVersion"));
    id v67 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v67 = 0;
  }
  v66 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals resolutionType](self, "resolutionType"));
  v83[0] = @"clientDayOfWeek";
  uint64_t v12 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v12;
  v84[0] = v12;
  v83[1] = @"rawClientHourOfDay";
  uint64_t v13 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v13;
  v84[1] = v13;
  v83[2] = @"isMediaAlbumPresent";
  uint64_t v14 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v14;
  v84[2] = v14;
  v83[3] = @"isMediaArtistPresent";
  uint64_t v15 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v15;
  v84[3] = v15;
  v83[4] = @"isMediaGenrePresent";
  uint64_t v16 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v16;
  v84[4] = v16;
  v83[5] = @"isMediaMoodPresent";
  uint64_t v17 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v17;
  v84[5] = v17;
  v83[6] = @"isMediaNamePresent";
  uint64_t v18 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = v9;
  v52 = (void *)v18;
  v84[6] = v18;
  v83[7] = @"isMediaReleaseDatePresent";
  uint64_t v20 = (uint64_t)v82;
  if (!v82)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v21 = v6;
  v84[7] = v20;
  v83[8] = @"nowPlayingLastBundleRecencyS";
  int v22 = v81;
  if (!v81)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  id v23 = v4;
  v84[8] = v22;
  v83[9] = @"rawLanguage";
  uint64_t v24 = (uint64_t)v80;
  if (!v80)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  id v25 = v3;
  v60 = (void *)v24;
  v84[9] = v24;
  v83[10] = @"rawLocale";
  uint64_t v26 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v27 = (void *)v26;
  v84[10] = v26;
  v83[11] = @"rawRegion";
  uint64_t v28 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v28;
  v84[11] = v28;
  v83[12] = @"isClientDaylight";
  uint64_t v29 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v29;
  v84[12] = v29;
  v83[13] = @"isClientNavigating";
  uint64_t v30 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v30;
  v84[13] = v30;
  v83[14] = @"isClientWorkout";
  uint64_t v31 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = v5;
  v48 = (void *)v31;
  v84[14] = v31;
  v83[15] = @"mediaType";
  uint64_t v32 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v32;
  v84[15] = v32;
  v83[16] = @"nowPlayingState";
  uint64_t v33 = (uint64_t)v73;
  if (!v73)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v33;
  v84[16] = v33;
  v83[17] = @"isPireneRequest";
  uint64_t v34 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = v8;
  v45 = (void *)v34;
  v84[17] = v34;
  v83[18] = @"foregroundBundleRecencyS";
  uint64_t v35 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = v7;
  v62 = v25;
  v44 = (void *)v35;
  v84[18] = v35;
  v83[19] = @"mediaParsecCategory";
  v36 = v70;
  if (!v70)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = v23;
  v84[19] = v36;
  v83[20] = @"sirikitResponseCode";
  v37 = v69;
  if (!v69)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v84[20] = v37;
  v83[21] = @"appSelectionUses";
  v38 = v68;
  if (!v68)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v20;
  v84[21] = v38;
  v83[22] = @"modelVersion";
  v40 = v67;
  if (!v67)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v84[22] = v40;
  v83[23] = @"resolutionType";
  v41 = v66;
  if (!v66)
  {
    v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v84[23] = v41;
  id v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:24];
  if (!v66) {

  }
  v42 = v27;
  if (!v67)
  {

    v42 = v27;
  }
  if (!v68)
  {

    v42 = v27;
  }
  if (!v69)
  {

    v42 = v27;
  }
  if (!v70)
  {

    v42 = v27;
  }
  if (!v71)
  {

    v42 = v27;
  }
  if (!v72)
  {

    v42 = v27;
  }
  if (!v73)
  {

    v42 = v27;
  }
  if (!v74)
  {

    v42 = v27;
  }
  if (!v75)
  {

    v42 = v27;
  }
  if (!v76)
  {

    v42 = v27;
  }
  if (!v77)
  {

    v42 = v27;
  }
  if (!v78)
  {

    v42 = v27;
  }
  if (!v79) {

  }
  if (!v80) {
  if (!v81)
  }

  if (v82)
  {
    if (v19) {
      goto LABEL_153;
    }
  }
  else
  {

    if (v19)
    {
LABEL_153:
      if (v63) {
        goto LABEL_154;
      }
      goto LABEL_164;
    }
  }

  if (v63)
  {
LABEL_154:
    if (v64) {
      goto LABEL_155;
    }
    goto LABEL_165;
  }
LABEL_164:

  if (v64)
  {
LABEL_155:
    if (v21) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }
LABEL_165:

  if (v21)
  {
LABEL_156:
    if (v65) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:

  if (v65)
  {
LABEL_157:
    if (v61) {
      goto LABEL_158;
    }
LABEL_168:

    if (v62) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_167:

  if (!v61) {
    goto LABEL_168;
  }
LABEL_158:
  if (v62) {
    goto LABEL_159;
  }
LABEL_169:

LABEL_159:

  return v59;
}

- (BMSiriMusicInferenceTrainingIndependentSignals)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v356[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v308 = [v6 objectForKeyedSubscript:@"clientDayOfWeek"];
  if (!v308 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v308;
LABEL_4:
    v307 = [v6 objectForKeyedSubscript:@"rawClientHourOfDay"];
    if (!v307 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v307;
LABEL_7:
      id v9 = [v6 objectForKeyedSubscript:@"isMediaAlbumPresent"];
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v306 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v306 = v9;
LABEL_10:
        uint64_t v10 = [v6 objectForKeyedSubscript:@"isMediaArtistPresent"];
        v305 = (void *)v10;
        if (!v10 || (int v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v303 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v303 = v11;
LABEL_13:
          uint64_t v12 = [v6 objectForKeyedSubscript:@"isMediaGenrePresent"];
          v300 = a4;
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v299 = v12;
            id v304 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v299 = v12;
            id v304 = v12;
LABEL_16:
            uint64_t v13 = [v6 objectForKeyedSubscript:@"isMediaMoodPresent"];
            if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v296 = v13;
              id v301 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v296 = v13;
              id v301 = v13;
LABEL_19:
              uint64_t v14 = [v6 objectForKeyedSubscript:@"isMediaNamePresent"];
              v297 = (void *)v14;
              if (!v14 || (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v298 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v298 = v15;
LABEL_22:
                uint64_t v16 = [v6 objectForKeyedSubscript:@"isMediaReleaseDatePresent"];
                v295 = (void *)v16;
                if (!v16 || (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v294 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v294 = v17;
LABEL_25:
                  uint64_t v18 = [v6 objectForKeyedSubscript:@"nowPlayingLastBundleRecencyS"];
                  v292 = (void *)v18;
                  if (!v18 || (int v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v291 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v291 = v19;
LABEL_28:
                    uint64_t v20 = [v6 objectForKeyedSubscript:@"rawLanguage"];
                    v290 = (void *)v20;
                    if (!v20 || (int v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v289 = 0;
                      goto LABEL_31;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v289 = v21;
LABEL_31:
                      uint64_t v22 = [v6 objectForKeyedSubscript:@"rawLocale"];
                      v287 = (void *)v22;
                      if (!v22 || (id v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v288 = 0;
                        goto LABEL_34;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v288 = v23;
LABEL_34:
                        uint64_t v24 = [v6 objectForKeyedSubscript:@"rawRegion"];
                        v285 = (void *)v24;
                        if (!v24 || (id v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v286 = 0;
                          goto LABEL_37;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v286 = v25;
LABEL_37:
                          uint64_t v26 = [v6 objectForKeyedSubscript:@"isClientDaylight"];
                          v283 = (void *)v26;
                          if (!v26 || (int v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v284 = 0;
                            goto LABEL_40;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v284 = v27;
LABEL_40:
                            uint64_t v28 = [v6 objectForKeyedSubscript:@"isClientNavigating"];
                            v281 = (void *)v28;
                            if (!v28 || (uint64_t v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v282 = 0;
                              goto LABEL_43;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v282 = v29;
LABEL_43:
                              uint64_t v30 = [v6 objectForKeyedSubscript:@"isClientWorkout"];
                              v279 = (void *)v30;
                              if (!v30 || (uint64_t v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v280 = 0;
                                goto LABEL_46;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v280 = v31;
LABEL_46:
                                uint64_t v32 = [v6 objectForKeyedSubscript:@"mediaType"];
                                v277 = (void *)v32;
                                if (!v32 || (uint64_t v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v278 = 0;
                                  goto LABEL_49;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v278 = v33;
LABEL_49:
                                  uint64_t v34 = [v6 objectForKeyedSubscript:@"nowPlayingState"];
                                  v275 = (void *)v34;
                                  if (!v34
                                    || (uint64_t v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v276 = 0;
                                    goto LABEL_52;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v276 = v35;
LABEL_52:
                                    uint64_t v36 = [v6 objectForKeyedSubscript:@"isPireneRequest"];
                                    v273 = (void *)v36;
                                    if (!v36
                                      || (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v274 = 0;
                                      goto LABEL_55;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v274 = v37;
LABEL_55:
                                      uint64_t v38 = [v6 objectForKeyedSubscript:@"foregroundBundleRecencyS"];
                                      v271 = (void *)v38;
                                      if (!v38
                                        || (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v272 = 0;
                                        goto LABEL_58;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v272 = v39;
LABEL_58:
                                        uint64_t v40 = [v6 objectForKeyedSubscript:@"mediaParsecCategory"];
                                        v268 = (void *)v40;
                                        if (!v40
                                          || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v270 = 0;
                                          goto LABEL_61;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v270 = v41;
LABEL_61:
                                          uint64_t v42 = [v6 objectForKeyedSubscript:@"sirikitResponseCode"];
                                          v266 = (void *)v42;
                                          if (!v42
                                            || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v269 = 0;
                                            goto LABEL_64;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v269 = v43;
LABEL_64:
                                            uint64_t v44 = [v6 objectForKeyedSubscript:@"appSelectionUses"];
                                            v265 = (void *)v44;
                                            if (!v44
                                              || (v45 = (void *)v44,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v267 = 0;
                                              goto LABEL_67;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v267 = v45;
LABEL_67:
                                              uint64_t v46 = [v6 objectForKeyedSubscript:@"modelVersion"];
                                              v263 = (void *)v46;
                                              if (!v46
                                                || (v47 = (void *)v46,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v264 = 0;
                                                goto LABEL_70;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v264 = v47;
LABEL_70:
                                                uint64_t v48 = [v6 objectForKeyedSubscript:@"resolutionType"];
                                                v262 = (void *)v48;
                                                if (!v48
                                                  || (v49 = (void *)v48,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v50 = 0;
                                                  v51 = v303;
                                                  v52 = v299;
LABEL_199:
                                                  uint64_t v13 = v296;
                                                  LODWORD(v261) = [v50 intValue];
                                                  self = objc_retain(-[BMSiriMusicInferenceTrainingIndependentSignals initWithClientDayOfWeek:rawClientHourOfDay:isMediaAlbumPresent:isMediaArtistPresent:isMediaGenrePresent:isMediaMoodPresent:isMediaNamePresent:isMediaReleaseDatePresent:nowPlayingLastBundleRecencyS:rawLanguage:rawLocale:rawRegion:isClientDaylight:isClientNavigating:isClientWorkout:mediaType:nowPlayingState:isPireneRequest:foregroundBundleRecencyS:mediaParsecCategory:sirikitResponseCode:appSelectionUses:modelVersion:resolutionType:](self, "initWithClientDayOfWeek:rawClientHourOfDay:isMediaAlbumPresent:isMediaArtistPresent:isMediaGenrePresent:isMediaMoodPresent:isMediaNamePresent:isMediaReleaseDatePresent:nowPlayingLastBundleRecencyS:rawLanguage:rawLocale:rawRegion:isClientDaylight:isClientNavigating:isClientWorkout:mediaType:nowPlayingState:isPireneRequest:foregroundBundleRecencyS:mediaParsecCategory:sirikitResponseCode:appSelectionUses:modelVersion:resolutionType:", v7, v8, v306, v51, v304, v301, v298, v294, v291,
                                                             v289,
                                                             v288,
                                                             v286,
                                                             v284,
                                                             v282,
                                                             v280,
                                                             v278,
                                                             v276,
                                                             v274,
                                                             v272,
                                                             v270,
                                                             v269,
                                                             v267,
                                                             v264,
                                                             v261));
                                                  v233 = v50;
                                                  v56 = self;
LABEL_200:

                                                  v224 = v264;
LABEL_201:

LABEL_202:
LABEL_203:

LABEL_204:
LABEL_205:

                                                  goto LABEL_206;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v50 = v49;
LABEL_198:
                                                  v51 = v303;
                                                  v52 = v299;

                                                  goto LABEL_199;
                                                }
                                                v234 = self;
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v235 = v49;
                                                  id v50 = [NSNumber numberWithInt:BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString(v235)];

                                                  goto LABEL_198;
                                                }
                                                if (v300)
                                                {
                                                  id v237 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v238 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v309 = *MEMORY[0x1E4F28568];
                                                  v239 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"resolutionType"];
                                                  v310 = v239;
                                                  v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v310 forKeys:&v309 count:1];
                                                  id *v300 = (id)[v237 initWithDomain:v238 code:2 userInfo:v240];
                                                }
                                                v233 = 0;
                                                v56 = 0;
                                                self = v234;
LABEL_235:
                                                v51 = v303;
                                                v52 = v299;
                                                uint64_t v13 = v296;
                                                goto LABEL_200;
                                              }
                                              if (v300)
                                              {
                                                id v225 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v226 = *MEMORY[0x1E4F502C8];
                                                uint64_t v311 = *MEMORY[0x1E4F28568];
                                                v227 = v9;
                                                id v228 = v8;
                                                id v229 = v7;
                                                v230 = self;
                                                id v231 = [NSString alloc];
                                                uint64_t v260 = objc_opt_class();
                                                v232 = v231;
                                                self = v230;
                                                id v7 = v229;
                                                id v8 = v228;
                                                id v9 = v227;
                                                v233 = (void *)[v232 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v260, @"modelVersion"];
                                                v312 = v233;
                                                v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v312 forKeys:&v311 count:1];
                                                id v264 = 0;
                                                v56 = 0;
                                                id *v300 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v226, 2);
                                                goto LABEL_235;
                                              }
                                              v224 = 0;
                                              v56 = 0;
LABEL_237:
                                              v51 = v303;
                                              v52 = v299;
                                              uint64_t v13 = v296;
                                              goto LABEL_201;
                                            }
                                            if (v300)
                                            {
                                              id v216 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v217 = *MEMORY[0x1E4F502C8];
                                              uint64_t v313 = *MEMORY[0x1E4F28568];
                                              v218 = v9;
                                              id v219 = v8;
                                              id v220 = v7;
                                              v221 = self;
                                              id v222 = [NSString alloc];
                                              uint64_t v259 = objc_opt_class();
                                              v223 = v222;
                                              self = v221;
                                              id v7 = v220;
                                              id v8 = v219;
                                              id v9 = v218;
                                              v224 = (void *)[v223 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v259, @"appSelectionUses"];
                                              v314 = v224;
                                              v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v314 forKeys:&v313 count:1];
                                              id v267 = 0;
                                              v56 = 0;
                                              id *v300 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v217, 2);
                                              goto LABEL_237;
                                            }
                                            id v267 = 0;
                                            v56 = 0;
LABEL_231:
                                            v51 = v303;
                                            v52 = v299;
                                            uint64_t v13 = v296;
                                            goto LABEL_202;
                                          }
                                          if (v300)
                                          {
                                            id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v209 = *MEMORY[0x1E4F502C8];
                                            uint64_t v315 = *MEMORY[0x1E4F28568];
                                            v210 = v9;
                                            id v211 = v8;
                                            id v212 = v7;
                                            v213 = self;
                                            id v214 = [NSString alloc];
                                            uint64_t v258 = objc_opt_class();
                                            v215 = v214;
                                            self = v213;
                                            id v7 = v212;
                                            id v8 = v211;
                                            id v9 = v210;
                                            id v267 = (id)[v215 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v258, @"sirikitResponseCode"];
                                            id v316 = v267;
                                            v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v316 forKeys:&v315 count:1];
                                            id v269 = 0;
                                            v56 = 0;
                                            id *v300 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v209, 2);
                                            goto LABEL_231;
                                          }
                                          id v269 = 0;
                                          v56 = 0;
LABEL_229:
                                          v51 = v303;
                                          v52 = v299;
                                          uint64_t v13 = v296;
                                          goto LABEL_203;
                                        }
                                        if (v300)
                                        {
                                          id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v201 = *MEMORY[0x1E4F502C8];
                                          uint64_t v317 = *MEMORY[0x1E4F28568];
                                          v202 = v9;
                                          id v203 = v8;
                                          id v204 = v7;
                                          v205 = self;
                                          id v206 = [NSString alloc];
                                          uint64_t v257 = objc_opt_class();
                                          v207 = v206;
                                          self = v205;
                                          id v7 = v204;
                                          id v8 = v203;
                                          id v9 = v202;
                                          id v269 = (id)[v207 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v257, @"mediaParsecCategory"];
                                          id v318 = v269;
                                          v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v318 forKeys:&v317 count:1];
                                          id v270 = 0;
                                          v56 = 0;
                                          id *v300 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v201, 2);
                                          goto LABEL_229;
                                        }
                                        id v270 = 0;
                                        v56 = 0;
LABEL_227:
                                        v51 = v303;
                                        v52 = v299;
                                        uint64_t v13 = v296;
                                        goto LABEL_204;
                                      }
                                      if (v300)
                                      {
                                        id v192 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v193 = *MEMORY[0x1E4F502C8];
                                        uint64_t v319 = *MEMORY[0x1E4F28568];
                                        v194 = v9;
                                        id v195 = v8;
                                        id v196 = v7;
                                        v197 = self;
                                        id v198 = [NSString alloc];
                                        uint64_t v256 = objc_opt_class();
                                        v199 = v198;
                                        self = v197;
                                        id v7 = v196;
                                        id v8 = v195;
                                        id v9 = v194;
                                        id v270 = (id)[v199 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v256, @"foregroundBundleRecencyS"];
                                        id v320 = v270;
                                        v268 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v320 forKeys:&v319 count:1];
                                        id v272 = 0;
                                        v56 = 0;
                                        id *v300 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v193, 2);
                                        goto LABEL_227;
                                      }
                                      id v272 = 0;
                                      v56 = 0;
LABEL_225:
                                      v51 = v303;
                                      v52 = v299;
                                      uint64_t v13 = v296;
                                      goto LABEL_205;
                                    }
                                    if (v300)
                                    {
                                      id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v185 = *MEMORY[0x1E4F502C8];
                                      uint64_t v321 = *MEMORY[0x1E4F28568];
                                      v186 = v9;
                                      id v187 = v8;
                                      id v188 = v7;
                                      v189 = self;
                                      id v190 = [NSString alloc];
                                      uint64_t v255 = objc_opt_class();
                                      v191 = v190;
                                      self = v189;
                                      id v7 = v188;
                                      id v8 = v187;
                                      id v9 = v186;
                                      id v272 = (id)[v191 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v255, @"isPireneRequest"];
                                      id v322 = v272;
                                      v271 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v322 forKeys:&v321 count:1];
                                      id v274 = 0;
                                      v56 = 0;
                                      id *v300 = (id)objc_msgSend(v184, "initWithDomain:code:userInfo:", v185, 2);
                                      goto LABEL_225;
                                    }
                                    id v274 = 0;
                                    v56 = 0;
LABEL_195:
                                    v51 = v303;
                                    v52 = v299;
                                    uint64_t v13 = v296;
LABEL_206:

                                    goto LABEL_207;
                                  }
                                  if (v300)
                                  {
                                    id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v177 = *MEMORY[0x1E4F502C8];
                                    uint64_t v323 = *MEMORY[0x1E4F28568];
                                    v178 = v9;
                                    id v179 = v8;
                                    id v180 = v7;
                                    v181 = self;
                                    id v182 = [NSString alloc];
                                    uint64_t v254 = objc_opt_class();
                                    v183 = v182;
                                    self = v181;
                                    id v7 = v180;
                                    id v8 = v179;
                                    id v9 = v178;
                                    id v274 = (id)[v183 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v254, @"nowPlayingState"];
                                    id v324 = v274;
                                    v273 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v324 forKeys:&v323 count:1];
                                    id v276 = 0;
                                    v56 = 0;
                                    id *v300 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", v177, 2);
                                    goto LABEL_195;
                                  }
                                  id v276 = 0;
                                  v56 = 0;
LABEL_191:
                                  v51 = v303;
                                  v52 = v299;
                                  uint64_t v13 = v296;
LABEL_207:

                                  goto LABEL_208;
                                }
                                if (v300)
                                {
                                  id v168 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v169 = *MEMORY[0x1E4F502C8];
                                  uint64_t v325 = *MEMORY[0x1E4F28568];
                                  v170 = v9;
                                  id v171 = v8;
                                  id v172 = v7;
                                  v173 = self;
                                  id v174 = [NSString alloc];
                                  uint64_t v253 = objc_opt_class();
                                  v175 = v174;
                                  self = v173;
                                  id v7 = v172;
                                  id v8 = v171;
                                  id v9 = v170;
                                  id v276 = (id)[v175 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v253, @"mediaType"];
                                  id v326 = v276;
                                  v275 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v326 forKeys:&v325 count:1];
                                  id v278 = 0;
                                  v56 = 0;
                                  id *v300 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v169, 2);
                                  goto LABEL_191;
                                }
                                id v278 = 0;
                                v56 = 0;
LABEL_187:
                                v51 = v303;
                                v52 = v299;
                                uint64_t v13 = v296;
LABEL_208:

                                goto LABEL_209;
                              }
                              if (v300)
                              {
                                id v160 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v161 = *MEMORY[0x1E4F502C8];
                                uint64_t v327 = *MEMORY[0x1E4F28568];
                                v162 = v9;
                                id v163 = v8;
                                id v164 = v7;
                                v165 = self;
                                id v166 = [NSString alloc];
                                uint64_t v252 = objc_opt_class();
                                v167 = v166;
                                self = v165;
                                id v7 = v164;
                                id v8 = v163;
                                id v9 = v162;
                                id v278 = (id)[v167 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v252, @"isClientWorkout"];
                                id v328 = v278;
                                v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v328 forKeys:&v327 count:1];
                                id v280 = 0;
                                v56 = 0;
                                id *v300 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
                                goto LABEL_187;
                              }
                              id v280 = 0;
                              v56 = 0;
LABEL_183:
                              v51 = v303;
                              v52 = v299;
                              uint64_t v13 = v296;
LABEL_209:

                              goto LABEL_210;
                            }
                            if (v300)
                            {
                              id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v153 = *MEMORY[0x1E4F502C8];
                              uint64_t v329 = *MEMORY[0x1E4F28568];
                              v154 = v9;
                              id v155 = v8;
                              id v156 = v7;
                              v157 = self;
                              id v158 = [NSString alloc];
                              uint64_t v251 = objc_opt_class();
                              v159 = v158;
                              self = v157;
                              id v7 = v156;
                              id v8 = v155;
                              id v9 = v154;
                              id v280 = (id)[v159 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v251, @"isClientNavigating"];
                              id v330 = v280;
                              v279 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v330 forKeys:&v329 count:1];
                              id v282 = 0;
                              v56 = 0;
                              id *v300 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v153, 2);
                              goto LABEL_183;
                            }
                            id v282 = 0;
                            v56 = 0;
LABEL_177:
                            v51 = v303;
                            v52 = v299;
                            uint64_t v13 = v296;
LABEL_210:

                            goto LABEL_211;
                          }
                          if (v300)
                          {
                            id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v145 = *MEMORY[0x1E4F502C8];
                            uint64_t v331 = *MEMORY[0x1E4F28568];
                            v146 = v9;
                            id v147 = v8;
                            id v148 = v7;
                            v149 = self;
                            id v150 = [NSString alloc];
                            uint64_t v250 = objc_opt_class();
                            v151 = v150;
                            self = v149;
                            id v7 = v148;
                            id v8 = v147;
                            id v9 = v146;
                            id v282 = (id)[v151 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v250, @"isClientDaylight"];
                            id v332 = v282;
                            v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
                            id v284 = 0;
                            v56 = 0;
                            id *v300 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v145, 2);
                            goto LABEL_177;
                          }
                          id v284 = 0;
                          v56 = 0;
LABEL_171:
                          v51 = v303;
                          v52 = v299;
                          uint64_t v13 = v296;
LABEL_211:

                          goto LABEL_212;
                        }
                        if (v300)
                        {
                          id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v137 = *MEMORY[0x1E4F502C8];
                          uint64_t v333 = *MEMORY[0x1E4F28568];
                          v138 = v9;
                          id v139 = v8;
                          id v140 = v7;
                          v141 = self;
                          id v142 = [NSString alloc];
                          uint64_t v249 = objc_opt_class();
                          v143 = v142;
                          self = v141;
                          id v7 = v140;
                          id v8 = v139;
                          id v9 = v138;
                          id v284 = (id)[v143 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v249, @"rawRegion"];
                          id v334 = v284;
                          v283 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
                          id v286 = 0;
                          v56 = 0;
                          id *v300 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v137, 2);
                          goto LABEL_171;
                        }
                        id v286 = 0;
                        v56 = 0;
LABEL_165:
                        v51 = v303;
                        v52 = v299;
                        uint64_t v13 = v296;
LABEL_212:

                        goto LABEL_213;
                      }
                      if (v300)
                      {
                        id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v129 = *MEMORY[0x1E4F502C8];
                        uint64_t v335 = *MEMORY[0x1E4F28568];
                        v130 = v9;
                        id v131 = v8;
                        id v132 = v7;
                        v133 = self;
                        id v134 = [NSString alloc];
                        uint64_t v248 = objc_opt_class();
                        v135 = v134;
                        self = v133;
                        id v7 = v132;
                        id v8 = v131;
                        id v9 = v130;
                        id v286 = (id)[v135 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v248, @"rawLocale"];
                        id v336 = v286;
                        v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v336 forKeys:&v335 count:1];
                        id v288 = 0;
                        v56 = 0;
                        id *v300 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
                        goto LABEL_165;
                      }
                      id v288 = 0;
                      v56 = 0;
LABEL_159:
                      v51 = v303;
                      v52 = v299;
                      uint64_t v13 = v296;
LABEL_213:

                      goto LABEL_214;
                    }
                    if (v300)
                    {
                      id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v121 = *MEMORY[0x1E4F502C8];
                      uint64_t v337 = *MEMORY[0x1E4F28568];
                      v122 = v9;
                      id v123 = v8;
                      id v124 = v7;
                      v125 = self;
                      id v126 = [NSString alloc];
                      uint64_t v247 = objc_opt_class();
                      v127 = v126;
                      self = v125;
                      id v7 = v124;
                      id v8 = v123;
                      id v9 = v122;
                      id v288 = (id)[v127 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v247, @"rawLanguage"];
                      id v338 = v288;
                      v287 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
                      id v289 = 0;
                      v56 = 0;
                      id *v300 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                      goto LABEL_159;
                    }
                    id v289 = 0;
                    v56 = 0;
LABEL_153:
                    v51 = v303;
                    v52 = v299;
                    uint64_t v13 = v296;
LABEL_214:

                    goto LABEL_215;
                  }
                  if (v300)
                  {
                    id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v113 = *MEMORY[0x1E4F502C8];
                    uint64_t v339 = *MEMORY[0x1E4F28568];
                    v114 = v9;
                    id v115 = v8;
                    id v116 = v7;
                    v117 = self;
                    id v118 = [NSString alloc];
                    uint64_t v246 = objc_opt_class();
                    v119 = v118;
                    self = v117;
                    id v7 = v116;
                    id v8 = v115;
                    id v9 = v114;
                    id v289 = (id)[v119 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v246, @"nowPlayingLastBundleRecencyS"];
                    id v340 = v289;
                    v290 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v340 forKeys:&v339 count:1];
                    id v291 = 0;
                    v56 = 0;
                    id *v300 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                    goto LABEL_153;
                  }
                  id v291 = 0;
                  v56 = 0;
LABEL_147:
                  v51 = v303;
                  v52 = v299;
                  uint64_t v13 = v296;
LABEL_215:

                  goto LABEL_216;
                }
                if (v300)
                {
                  id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v105 = *MEMORY[0x1E4F502C8];
                  uint64_t v341 = *MEMORY[0x1E4F28568];
                  v106 = v9;
                  id v107 = v8;
                  id v108 = v7;
                  v109 = self;
                  id v110 = [NSString alloc];
                  uint64_t v245 = objc_opt_class();
                  v111 = v110;
                  self = v109;
                  id v7 = v108;
                  id v8 = v107;
                  id v9 = v106;
                  id v291 = (id)[v111 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v245, @"isMediaReleaseDatePresent"];
                  id v342 = v291;
                  v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v342 forKeys:&v341 count:1];
                  id v294 = 0;
                  v56 = 0;
                  id *v300 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2);
                  goto LABEL_147;
                }
                id v294 = 0;
                v56 = 0;
LABEL_141:
                v51 = v303;
                v52 = v299;
                uint64_t v13 = v296;
LABEL_216:

                goto LABEL_217;
              }
              if (v300)
              {
                id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                v293 = v9;
                id v98 = v8;
                id v99 = v7;
                v100 = self;
                uint64_t v101 = *MEMORY[0x1E4F502C8];
                uint64_t v343 = *MEMORY[0x1E4F28568];
                id v294 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isMediaNamePresent"];
                id v344 = v294;
                uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v344 forKeys:&v343 count:1];
                uint64_t v103 = v101;
                self = v100;
                id v7 = v99;
                id v8 = v98;
                id v9 = v293;
                v295 = (void *)v102;
                id v298 = 0;
                v56 = 0;
                id *v300 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v103, 2);
                goto LABEL_141;
              }
              id v298 = 0;
              v56 = 0;
              v51 = v303;
              v52 = v299;
              uint64_t v13 = v296;
LABEL_217:

              goto LABEL_218;
            }
            if (v300)
            {
              id v302 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v89 = *MEMORY[0x1E4F502C8];
              uint64_t v345 = *MEMORY[0x1E4F28568];
              v90 = v9;
              id v91 = v8;
              id v92 = v7;
              v93 = self;
              id v94 = [NSString alloc];
              uint64_t v244 = objc_opt_class();
              v95 = v94;
              self = v93;
              id v7 = v92;
              id v8 = v91;
              id v9 = v90;
              id v298 = (id)[v95 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v244, @"isMediaMoodPresent"];
              id v346 = v298;
              v297 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v346 forKeys:&v345 count:1];
              id v96 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v89, 2);
              id v301 = 0;
              v56 = 0;
              id *v300 = v96;
              v51 = v303;
              v52 = v299;
              goto LABEL_217;
            }
            id v301 = 0;
            v56 = 0;
            v51 = v303;
            v52 = v299;
LABEL_218:

            goto LABEL_219;
          }
          v52 = v12;
          if (a4)
          {
            id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v79 = *MEMORY[0x1E4F502C8];
            uint64_t v347 = *MEMORY[0x1E4F28568];
            id v80 = v9;
            id v81 = v8;
            id v82 = v7;
            v83 = self;
            id v84 = [NSString alloc];
            uint64_t v243 = objc_opt_class();
            v85 = v84;
            self = v83;
            id v7 = v82;
            id v8 = v81;
            id v9 = v80;
            id v301 = (id)[v85 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v243, @"isMediaGenrePresent"];
            id v348 = v301;
            uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v348 forKeys:&v347 count:1];
            uint64_t v87 = v79;
            uint64_t v13 = (void *)v86;
            id v88 = (id)[v78 initWithDomain:v87 code:2 userInfo:v86];
            id v304 = 0;
            v56 = 0;
            id *v300 = v88;
            v51 = v303;
            goto LABEL_218;
          }
          id v304 = 0;
          v56 = 0;
          v51 = v303;
LABEL_219:

          goto LABEL_220;
        }
        if (a4)
        {
          id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v349 = *MEMORY[0x1E4F28568];
          id v69 = v9;
          id v70 = v8;
          id v71 = v7;
          id v72 = self;
          id v73 = [NSString alloc];
          uint64_t v242 = objc_opt_class();
          id v74 = v73;
          self = v72;
          id v7 = v71;
          id v8 = v70;
          id v9 = v69;
          id v304 = (id)[v74 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v242, @"isMediaArtistPresent"];
          id v350 = v304;
          uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
          uint64_t v76 = v68;
          v52 = (void *)v75;
          id v77 = (id)[v67 initWithDomain:v76 code:2 userInfo:v75];
          v51 = 0;
          v56 = 0;
          *a4 = v77;
          goto LABEL_219;
        }
        v51 = 0;
        v56 = 0;
LABEL_220:

        goto LABEL_221;
      }
      if (a4)
      {
        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v351 = *MEMORY[0x1E4F28568];
        id v62 = v8;
        id v63 = v7;
        id v64 = [NSString alloc];
        uint64_t v241 = objc_opt_class();
        v65 = v64;
        id v7 = v63;
        id v8 = v62;
        v51 = (void *)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v241, @"isMediaAlbumPresent"];
        v352 = v51;
        v305 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v352 forKeys:&v351 count:1];
        id v66 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        id v306 = 0;
        v56 = 0;
        *a4 = v66;
        goto LABEL_220;
      }
      id v306 = 0;
      v56 = 0;
LABEL_221:

      goto LABEL_222;
    }
    if (a4)
    {
      id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v58 = *MEMORY[0x1E4F502C8];
      uint64_t v353 = *MEMORY[0x1E4F28568];
      id v306 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rawClientHourOfDay"];
      id v354 = v306;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v354 forKeys:&v353 count:1];
      id v59 = (id)[v57 initWithDomain:v58 code:2 userInfo:v9];
      id v8 = 0;
      v56 = 0;
      *a4 = v59;
      goto LABEL_221;
    }
    id v8 = 0;
    v56 = 0;
LABEL_222:

    goto LABEL_223;
  }
  if (a4)
  {
    id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = *MEMORY[0x1E4F502C8];
    uint64_t v355 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clientDayOfWeek"];
    v356[0] = v8;
    v307 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v356 forKeys:&v355 count:1];
    id v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
    id v7 = 0;
    v56 = 0;
    *a4 = v55;
    goto LABEL_222;
  }
  id v7 = 0;
  v56 = 0;
LABEL_223:

  return v56;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMSiriMusicInferenceTrainingIndependentSignals *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasClientDayOfWeek) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasRawClientHourOfDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsMediaAlbumPresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaArtistPresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaGenrePresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaMoodPresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaNamePresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaReleaseDatePresent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasNowPlayingLastBundleRecencyS) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasRawLanguage) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasRawLocale) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasRawRegion) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_hasIsClientDaylight) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsClientNavigating) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsClientWorkout) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasMediaType) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNowPlayingState) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsPireneRequest) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasForegroundBundleRecencyS) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMediaParsecCategory) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasSirikitResponseCode) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasAppSelectionUses) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasModelVersion) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v195.receiver = self;
  v195.super_class = (Class)BMSiriMusicInferenceTrainingIndependentSignals;
  id v5 = [(BMEventBase *)&v195 init];
  if (!v5) {
    goto LABEL_289;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    int v11 = (int *)MEMORY[0x1E4F940B8];
    uint64_t v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v13 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v14 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v17 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v18 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v19 = 0;
      unsigned int v20 = 0;
      unint64_t v21 = 0;
      while (1)
      {
        uint64_t v22 = *v6;
        uint64_t v23 = *(void *)&v4[v22];
        unint64_t v24 = v23 + 1;
        if (v23 == -1 || v24 > *(void *)&v4[*v7]) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)&v4[*v11] + v23);
        *(void *)&v4[v22] = v24;
        v21 |= (unint64_t)(v25 & 0x7F) << v19;
        if ((v25 & 0x80) == 0) {
          goto LABEL_13;
        }
        v19 += 7;
        BOOL v26 = v20++ >= 9;
        if (v26)
        {
          unint64_t v21 = 0;
          int v27 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v27 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v21 = 0;
      }
LABEL_15:
      if (v27 || (v21 & 7) == 4) {
        break;
      }
      switch((v21 >> 3))
      {
        case 1u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v9[987]) = 1;
          while (1)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7]) {
              break;
            }
            char v35 = *(unsigned char *)(*(void *)&v4[*v11] + v33);
            *(void *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0) {
              goto LABEL_187;
            }
            v29 += 7;
            BOOL v26 = v30++ >= 9;
            if (v26)
            {
              LODWORD(v31) = 0;
              goto LABEL_189;
            }
          }
          v4[*v8] = 1;
LABEL_187:
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_189:
          uint64_t v189 = v10[988];
          goto LABEL_276;
        case 2u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v12[989]) = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v11] + v45);
              *(void *)&v4[v44] = v46;
              v31 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v26 = v43++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_193:
          uint64_t v189 = v13[990];
          goto LABEL_276;
        case 3u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          *((unsigned char *)&v5->super.super.isa + v14[991]) = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v11] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v26 = v49++ >= 9;
                if (v26)
                {
                  uint64_t v50 = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_197:
          BOOL v190 = v50 != 0;
          uint64_t v191 = v15[992];
          goto LABEL_259;
        case 4u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          *((unsigned char *)&v5->super.super.isa + v16[993]) = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            uint64_t v59 = *(void *)&v4[v58];
            unint64_t v60 = v59 + 1;
            if (v59 == -1 || v60 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)&v4[*v11] + v59);
              *(void *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                BOOL v26 = v56++ >= 9;
                if (v26)
                {
                  uint64_t v57 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_201:
          BOOL v190 = v57 != 0;
          uint64_t v191 = v17[994];
          goto LABEL_259;
        case 5u:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          *((unsigned char *)&v5->super.super.isa + v18[995]) = 1;
          while (2)
          {
            uint64_t v65 = *v6;
            uint64_t v66 = *(void *)&v4[v65];
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)&v4[*v11] + v66);
              *(void *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                BOOL v26 = v63++ >= 9;
                if (v26)
                {
                  uint64_t v64 = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v64 = 0;
          }
LABEL_205:
          BOOL v190 = v64 != 0;
          uint64_t v191 = 22;
          goto LABEL_259;
        case 6u:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v71 = 0;
          v5->_hasIsMediaMoodPresent = 1;
          while (2)
          {
            uint64_t v72 = *v6;
            uint64_t v73 = *(void *)&v4[v72];
            unint64_t v74 = v73 + 1;
            if (v73 == -1 || v74 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)&v4[*v11] + v73);
              *(void *)&v4[v72] = v74;
              v71 |= (unint64_t)(v75 & 0x7F) << v69;
              if (v75 < 0)
              {
                v69 += 7;
                BOOL v26 = v70++ >= 9;
                if (v26)
                {
                  uint64_t v71 = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v71 = 0;
          }
LABEL_209:
          BOOL v190 = v71 != 0;
          uint64_t v191 = 24;
          goto LABEL_259;
        case 7u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v78 = 0;
          v5->_hasIsMediaNamePresent = 1;
          while (2)
          {
            uint64_t v79 = *v6;
            uint64_t v80 = *(void *)&v4[v79];
            unint64_t v81 = v80 + 1;
            if (v80 == -1 || v81 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)&v4[*v11] + v80);
              *(void *)&v4[v79] = v81;
              v78 |= (unint64_t)(v82 & 0x7F) << v76;
              if (v82 < 0)
              {
                v76 += 7;
                BOOL v26 = v77++ >= 9;
                if (v26)
                {
                  uint64_t v78 = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v78 = 0;
          }
LABEL_213:
          BOOL v190 = v78 != 0;
          uint64_t v191 = 26;
          goto LABEL_259;
        case 8u:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v85 = 0;
          v5->_hasIsMediaReleaseDatePresent = 1;
          while (2)
          {
            uint64_t v86 = *v6;
            uint64_t v87 = *(void *)&v4[v86];
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)&v4[*v11] + v87);
              *(void *)&v4[v86] = v88;
              v85 |= (unint64_t)(v89 & 0x7F) << v83;
              if (v89 < 0)
              {
                v83 += 7;
                BOOL v26 = v84++ >= 9;
                if (v26)
                {
                  uint64_t v85 = 0;
                  goto LABEL_217;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v85 = 0;
          }
LABEL_217:
          BOOL v190 = v85 != 0;
          uint64_t v191 = 28;
          goto LABEL_259;
        case 9u:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v31 = 0;
          v5->_hasNowPlayingLastBundleRecencyS = 1;
          while (2)
          {
            uint64_t v92 = *v6;
            uint64_t v93 = *(void *)&v4[v92];
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)&v4[*v11] + v93);
              *(void *)&v4[v92] = v94;
              v31 |= (unint64_t)(v95 & 0x7F) << v90;
              if (v95 < 0)
              {
                v90 += 7;
                BOOL v26 = v91++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_221:
          uint64_t v189 = 64;
          goto LABEL_276;
        case 0xAu:
          char v96 = 0;
          unsigned int v97 = 0;
          id v98 = 0;
          v5->_hasRawLanguage = 1;
          while (2)
          {
            uint64_t v99 = *v6;
            uint64_t v100 = *(void *)&v4[v99];
            unint64_t v101 = v100 + 1;
            if (v100 == -1 || v101 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v102 = *(unsigned char *)(*(void *)&v4[*v11] + v100);
              *(void *)&v4[v99] = v101;
              id v98 = (objc_class *)(((unint64_t)(v102 & 0x7F) << v96) | (unint64_t)v98);
              if (v102 < 0)
              {
                v96 += 7;
                BOOL v26 = v97++ >= 9;
                if (v26)
                {
                  id v98 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            id v98 = 0;
          }
LABEL_225:
          uint64_t v192 = 96;
          goto LABEL_234;
        case 0xBu:
          char v103 = 0;
          unsigned int v104 = 0;
          id v98 = 0;
          v5->_hasRawLocale = 1;
          while (2)
          {
            uint64_t v105 = *v6;
            uint64_t v106 = *(void *)&v4[v105];
            unint64_t v107 = v106 + 1;
            if (v106 == -1 || v107 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v108 = *(unsigned char *)(*(void *)&v4[*v11] + v106);
              *(void *)&v4[v105] = v107;
              id v98 = (objc_class *)(((unint64_t)(v108 & 0x7F) << v103) | (unint64_t)v98);
              if (v108 < 0)
              {
                v103 += 7;
                BOOL v26 = v104++ >= 9;
                if (v26)
                {
                  id v98 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            id v98 = 0;
          }
LABEL_229:
          uint64_t v192 = 104;
          goto LABEL_234;
        case 0xCu:
          char v109 = 0;
          unsigned int v110 = 0;
          id v98 = 0;
          v5->_hasRawRegion = 1;
          while (2)
          {
            uint64_t v111 = *v6;
            uint64_t v112 = *(void *)&v4[v111];
            unint64_t v113 = v112 + 1;
            if (v112 == -1 || v113 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v114 = *(unsigned char *)(*(void *)&v4[*v11] + v112);
              *(void *)&v4[v111] = v113;
              id v98 = (objc_class *)(((unint64_t)(v114 & 0x7F) << v109) | (unint64_t)v98);
              if (v114 < 0)
              {
                v109 += 7;
                BOOL v26 = v110++ >= 9;
                if (v26)
                {
                  id v98 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            id v98 = 0;
          }
LABEL_233:
          uint64_t v192 = 112;
LABEL_234:
          *(Class *)((char *)&v5->super.super.isa + v192) = v98;
          continue;
        case 0xDu:
          char v115 = 0;
          unsigned int v116 = 0;
          uint64_t v117 = 0;
          v5->_hasIsClientDaylight = 1;
          while (2)
          {
            uint64_t v118 = *v6;
            uint64_t v119 = *(void *)&v4[v118];
            unint64_t v120 = v119 + 1;
            if (v119 == -1 || v120 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v121 = *(unsigned char *)(*(void *)&v4[*v11] + v119);
              *(void *)&v4[v118] = v120;
              v117 |= (unint64_t)(v121 & 0x7F) << v115;
              if (v121 < 0)
              {
                v115 += 7;
                BOOL v26 = v116++ >= 9;
                if (v26)
                {
                  uint64_t v117 = 0;
                  goto LABEL_238;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v117 = 0;
          }
LABEL_238:
          BOOL v190 = v117 != 0;
          uint64_t v191 = 34;
          goto LABEL_259;
        case 0xEu:
          char v122 = 0;
          unsigned int v123 = 0;
          uint64_t v124 = 0;
          v5->_hasIsClientNavigating = 1;
          while (2)
          {
            uint64_t v125 = *v6;
            uint64_t v126 = *(void *)&v4[v125];
            unint64_t v127 = v126 + 1;
            if (v126 == -1 || v127 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v128 = *(unsigned char *)(*(void *)&v4[*v11] + v126);
              *(void *)&v4[v125] = v127;
              v124 |= (unint64_t)(v128 & 0x7F) << v122;
              if (v128 < 0)
              {
                v122 += 7;
                BOOL v26 = v123++ >= 9;
                if (v26)
                {
                  uint64_t v124 = 0;
                  goto LABEL_242;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v124 = 0;
          }
LABEL_242:
          BOOL v190 = v124 != 0;
          uint64_t v191 = 36;
          goto LABEL_259;
        case 0xFu:
          char v129 = 0;
          unsigned int v130 = 0;
          uint64_t v131 = 0;
          v5->_hasIsClientWorkout = 1;
          while (2)
          {
            uint64_t v132 = *v6;
            uint64_t v133 = *(void *)&v4[v132];
            unint64_t v134 = v133 + 1;
            if (v133 == -1 || v134 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v135 = *(unsigned char *)(*(void *)&v4[*v11] + v133);
              *(void *)&v4[v132] = v134;
              v131 |= (unint64_t)(v135 & 0x7F) << v129;
              if (v135 < 0)
              {
                v129 += 7;
                BOOL v26 = v130++ >= 9;
                if (v26)
                {
                  uint64_t v131 = 0;
                  goto LABEL_246;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v131 = 0;
          }
LABEL_246:
          BOOL v190 = v131 != 0;
          uint64_t v191 = 38;
          goto LABEL_259;
        case 0x10u:
          char v136 = 0;
          unsigned int v137 = 0;
          uint64_t v31 = 0;
          v5->_hasMediaType = 1;
          while (2)
          {
            uint64_t v138 = *v6;
            uint64_t v139 = *(void *)&v4[v138];
            unint64_t v140 = v139 + 1;
            if (v139 == -1 || v140 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v141 = *(unsigned char *)(*(void *)&v4[*v11] + v139);
              *(void *)&v4[v138] = v140;
              v31 |= (unint64_t)(v141 & 0x7F) << v136;
              if (v141 < 0)
              {
                v136 += 7;
                BOOL v26 = v137++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_250;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_250:
          uint64_t v189 = 68;
          goto LABEL_276;
        case 0x11u:
          char v142 = 0;
          unsigned int v143 = 0;
          uint64_t v31 = 0;
          v5->_hasNowPlayingState = 1;
          while (2)
          {
            uint64_t v144 = *v6;
            uint64_t v145 = *(void *)&v4[v144];
            unint64_t v146 = v145 + 1;
            if (v145 == -1 || v146 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v147 = *(unsigned char *)(*(void *)&v4[*v11] + v145);
              *(void *)&v4[v144] = v146;
              v31 |= (unint64_t)(v147 & 0x7F) << v142;
              if (v147 < 0)
              {
                v142 += 7;
                BOOL v26 = v143++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_254;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_254:
          uint64_t v189 = 72;
          goto LABEL_276;
        case 0x12u:
          char v148 = 0;
          unsigned int v149 = 0;
          uint64_t v150 = 0;
          v5->_hasIsPireneRequest = 1;
          while (2)
          {
            uint64_t v151 = *v6;
            uint64_t v152 = *(void *)&v4[v151];
            unint64_t v153 = v152 + 1;
            if (v152 == -1 || v153 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v154 = *(unsigned char *)(*(void *)&v4[*v11] + v152);
              *(void *)&v4[v151] = v153;
              v150 |= (unint64_t)(v154 & 0x7F) << v148;
              if (v154 < 0)
              {
                v148 += 7;
                BOOL v26 = v149++ >= 9;
                if (v26)
                {
                  uint64_t v150 = 0;
                  goto LABEL_258;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v150 = 0;
          }
LABEL_258:
          BOOL v190 = v150 != 0;
          uint64_t v191 = 42;
LABEL_259:
          *((unsigned char *)&v5->super.super.isa + v191) = v190;
          continue;
        case 0x13u:
          v5->_hasForegroundBundleRecencyS = 1;
          uint64_t v155 = *v6;
          unint64_t v156 = *(void *)&v4[v155];
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(void *)&v4[*v7])
          {
            double v157 = *(double *)(*(void *)&v4[*v11] + v156);
            *(void *)&v4[v155] = v156 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v157 = 0.0;
          }
          v5->_foregroundBundleRecencyS = v157;
          continue;
        case 0x14u:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v31 = 0;
          v5->_hasMediaParsecCategory = 1;
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
              char v163 = *(unsigned char *)(*(void *)&v4[*v11] + v161);
              *(void *)&v4[v160] = v162;
              v31 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v26 = v159++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_263;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_263:
          uint64_t v189 = 76;
          goto LABEL_276;
        case 0x15u:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v31 = 0;
          v5->_hasSirikitResponseCode = 1;
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
              char v169 = *(unsigned char *)(*(void *)&v4[*v11] + v167);
              *(void *)&v4[v166] = v168;
              v31 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v26 = v165++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_267;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_267:
          uint64_t v189 = 80;
          goto LABEL_276;
        case 0x16u:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v31 = 0;
          v5->_hasAppSelectionUses = 1;
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
              char v175 = *(unsigned char *)(*(void *)&v4[*v11] + v173);
              *(void *)&v4[v172] = v174;
              v31 |= (unint64_t)(v175 & 0x7F) << v170;
              if (v175 < 0)
              {
                v170 += 7;
                BOOL v26 = v171++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_271;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_271:
          uint64_t v189 = 84;
          goto LABEL_276;
        case 0x17u:
          char v176 = 0;
          unsigned int v177 = 0;
          uint64_t v31 = 0;
          v5->_hasModelVersion = 1;
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
              char v181 = *(unsigned char *)(*(void *)&v4[*v11] + v179);
              *(void *)&v4[v178] = v180;
              v31 |= (unint64_t)(v181 & 0x7F) << v176;
              if (v181 < 0)
              {
                v176 += 7;
                BOOL v26 = v177++ >= 9;
                if (v26)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_275;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_275:
          uint64_t v189 = 88;
LABEL_276:
          *(_DWORD *)((char *)&v5->super.super.isa + v189) = v31;
          continue;
        case 0x18u:
          char v182 = 0;
          unsigned int v183 = 0;
          uint64_t v184 = 0;
          break;
        default:
          uint64_t v36 = v9;
          v37 = v10;
          uint64_t v38 = v12;
          v39 = v13;
          uint64_t v40 = v14;
          int v41 = PBReaderSkipValueWithTag();
          uint64_t v14 = v40;
          id v8 = (int *)MEMORY[0x1E4F940C8];
          uint64_t v13 = v39;
          uint64_t v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          uint64_t v12 = v38;
          uint64_t v17 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          uint64_t v10 = v37;
          uint64_t v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          id v9 = v36;
          uint64_t v18 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          if (!v41) {
            goto LABEL_288;
          }
          continue;
      }
      while (1)
      {
        uint64_t v185 = *v6;
        uint64_t v186 = *(void *)&v4[v185];
        unint64_t v187 = v186 + 1;
        if (v186 == -1 || v187 > *(void *)&v4[*v7]) {
          break;
        }
        char v188 = *(unsigned char *)(*(void *)&v4[*v11] + v186);
        *(void *)&v4[v185] = v187;
        v184 |= (unint64_t)(v188 & 0x7F) << v182;
        if ((v188 & 0x80) == 0) {
          goto LABEL_280;
        }
        v182 += 7;
        BOOL v26 = v183++ >= 9;
        if (v26)
        {
          LODWORD(v184) = 0;
          goto LABEL_282;
        }
      }
      v4[*v8] = 1;
LABEL_280:
      if (v4[*v8]) {
        LODWORD(v184) = 0;
      }
LABEL_282:
      if (v184 >= 0xB) {
        LODWORD(v184) = 0;
      }
      v5->_resolutionType = v184;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_288:
  }
    uint64_t v193 = 0;
  else {
LABEL_289:
  }
    uint64_t v193 = v5;

  return v193;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  unsigned int v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  char v29 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
  int v27 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
  char v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
  BOOL v26 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
  unint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
  char v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawLocale](self, "rawLocale"));
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriMusicInferenceTrainingIndependentSignals rawRegion](self, "rawRegion"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaType](self, "mediaType"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
  int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriMusicInferenceTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
  id v3 = NSNumber;
  [(BMSiriMusicInferenceTrainingIndependentSignals *)self foregroundBundleRecencyS];
  uint64_t v10 = objc_msgSend(v3, "numberWithDouble:");
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriMusicInferenceTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriMusicInferenceTrainingIndependentSignals modelVersion](self, "modelVersion"));
  id v7 = BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeAsString([(BMSiriMusicInferenceTrainingIndependentSignals *)self resolutionType]);
  unint64_t v21 = objc_msgSend(v20, "initWithFormat:", @"BMSiriMusicInferenceTrainingIndependentSignals with clientDayOfWeek: %@, rawClientHourOfDay: %@, isMediaAlbumPresent: %@, isMediaArtistPresent: %@, isMediaGenrePresent: %@, isMediaMoodPresent: %@, isMediaNamePresent: %@, isMediaReleaseDatePresent: %@, nowPlayingLastBundleRecencyS: %@, rawLanguage: %@, rawLocale: %@, rawRegion: %@, isClientDaylight: %@, isClientNavigating: %@, isClientWorkout: %@, mediaType: %@, nowPlayingState: %@, isPireneRequest: %@, foregroundBundleRecencyS: %@, mediaParsecCategory: %@, sirikitResponseCode: %@, appSelectionUses: %@, modelVersion: %@, resolutionType: %@", v30, v28, v29, v27, v25, v26, v24, v19, v18, v23, v17, v16, v15, v22, v13, v12,
                  v14,
                  v11,
                  v10,
                  v9,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v21;
}

- (BMSiriMusicInferenceTrainingIndependentSignals)initWithClientDayOfWeek:(id)a3 rawClientHourOfDay:(id)a4 isMediaAlbumPresent:(id)a5 isMediaArtistPresent:(id)a6 isMediaGenrePresent:(id)a7 isMediaMoodPresent:(id)a8 isMediaNamePresent:(id)a9 isMediaReleaseDatePresent:(id)a10 nowPlayingLastBundleRecencyS:(id)a11 rawLanguage:(id)a12 rawLocale:(id)a13 rawRegion:(id)a14 isClientDaylight:(id)a15 isClientNavigating:(id)a16 isClientWorkout:(id)a17 mediaType:(id)a18 nowPlayingState:(id)a19 isPireneRequest:(id)a20 foregroundBundleRecencyS:(id)a21 mediaParsecCategory:(id)a22 sirikitResponseCode:(id)a23 appSelectionUses:(id)a24 modelVersion:(id)a25 resolutionType:(int)a26
{
  id v70 = a3;
  id v69 = a4;
  id v31 = a5;
  id v68 = a6;
  id v67 = a7;
  id v66 = a8;
  id v65 = a9;
  id v64 = a10;
  id v32 = a11;
  uint64_t v33 = v31;
  id v63 = a12;
  id v62 = a13;
  id v61 = a14;
  id v60 = a15;
  id v59 = a16;
  id v58 = a17;
  id v57 = a18;
  id v34 = a19;
  id v35 = a20;
  id v36 = a21;
  id v37 = a22;
  id v38 = a23;
  id v39 = a24;
  id v40 = a25;
  v71.receiver = self;
  v71.super_class = (Class)BMSiriMusicInferenceTrainingIndependentSignals;
  int v41 = [(BMEventBase *)&v71 init];
  if (v41)
  {
    v41->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v70)
    {
      v41->_hasClientDayOfWeek = 1;
      int v42 = [v70 intValue];
    }
    else
    {
      v41->_hasClientDayOfWeek = 0;
      int v42 = -1;
    }
    v41->_clientDayOfWeek = v42;
    if (v69)
    {
      v41->_hasRawClientHourOfDay = 1;
      int v43 = [v69 intValue];
    }
    else
    {
      v41->_hasRawClientHourOfDay = 0;
      int v43 = -1;
    }
    v41->_rawClientHourOfDay = v43;
    if (v33)
    {
      v41->_hasIsMediaAlbumPresent = 1;
      v41->_isMediaAlbumPresent = [v33 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaAlbumPresent = 0;
      v41->_isMediaAlbumPresent = 0;
    }
    if (v68)
    {
      v41->_hasIsMediaArtistPresent = 1;
      v41->_isMediaArtistPresent = [v68 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaArtistPresent = 0;
      v41->_isMediaArtistPresent = 0;
    }
    if (v67)
    {
      v41->_hasIsMediaGenrePresent = 1;
      v41->_isMediaGenrePresent = [v67 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaGenrePresent = 0;
      v41->_isMediaGenrePresent = 0;
    }
    if (v66)
    {
      v41->_hasIsMediaMoodPresent = 1;
      v41->_isMediaMoodPresent = [v66 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaMoodPresent = 0;
      v41->_isMediaMoodPresent = 0;
    }
    if (v65)
    {
      v41->_hasIsMediaNamePresent = 1;
      v41->_isMediaNamePresent = [v65 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaNamePresent = 0;
      v41->_isMediaNamePresent = 0;
    }
    if (v64)
    {
      v41->_hasIsMediaReleaseDatePresent = 1;
      v41->_isMediaReleaseDatePresent = [v64 BOOLValue];
    }
    else
    {
      v41->_hasIsMediaReleaseDatePresent = 0;
      v41->_isMediaReleaseDatePresent = 0;
    }
    if (v32)
    {
      v41->_hasNowPlayingLastBundleRecencyS = 1;
      int v44 = [v32 intValue];
    }
    else
    {
      v41->_hasNowPlayingLastBundleRecencyS = 0;
      int v44 = -1;
    }
    v41->_nowPlayingLastBundleRecencyS = v44;
    if (v63)
    {
      v41->_hasRawLanguage = 1;
      uint64_t v45 = [v63 longLongValue];
    }
    else
    {
      v41->_hasRawLanguage = 0;
      uint64_t v45 = -1;
    }
    v41->_rawLanguage = v45;
    if (v62)
    {
      v41->_hasRawLocale = 1;
      uint64_t v46 = [v62 longLongValue];
    }
    else
    {
      v41->_hasRawLocale = 0;
      uint64_t v46 = -1;
    }
    v41->_rawLocale = v46;
    if (v61)
    {
      v41->_hasRawRegion = 1;
      uint64_t v47 = [v61 longLongValue];
    }
    else
    {
      v41->_hasRawRegion = 0;
      uint64_t v47 = -1;
    }
    v41->_rawRegion = v47;
    if (v60)
    {
      v41->_hasIsClientDaylight = 1;
      v41->_isClientDaylight = [v60 BOOLValue];
    }
    else
    {
      v41->_hasIsClientDaylight = 0;
      v41->_isClientDaylight = 0;
    }
    if (v59)
    {
      v41->_hasIsClientNavigating = 1;
      v41->_isClientNavigating = [v59 BOOLValue];
    }
    else
    {
      v41->_hasIsClientNavigating = 0;
      v41->_isClientNavigating = 0;
    }
    if (v58)
    {
      v41->_hasIsClientWorkout = 1;
      v41->_isClientWorkout = [v58 BOOLValue];
    }
    else
    {
      v41->_hasIsClientWorkout = 0;
      v41->_isClientWorkout = 0;
    }
    if (v57)
    {
      v41->_hasMediaType = 1;
      int v48 = [v57 intValue];
    }
    else
    {
      v41->_hasMediaType = 0;
      int v48 = -1;
    }
    v41->_mediaType = v48;
    if (v34)
    {
      v41->_hasNowPlayingState = 1;
      int v49 = [v34 intValue];
    }
    else
    {
      v41->_hasNowPlayingState = 0;
      int v49 = -1;
    }
    v41->_nowPlayingState = v49;
    if (v35)
    {
      v41->_hasIsPireneRequest = 1;
      v41->_isPireneRequest = [v35 BOOLValue];
    }
    else
    {
      v41->_hasIsPireneRequest = 0;
      v41->_isPireneRequest = 0;
    }
    if (v36)
    {
      v41->_hasForegroundBundleRecencyS = 1;
      [v36 doubleValue];
    }
    else
    {
      v41->_hasForegroundBundleRecencyS = 0;
      double v50 = -1.0;
    }
    v41->_foregroundBundleRecencyS = v50;
    if (v37)
    {
      v41->_hasMediaParsecCategory = 1;
      int v51 = [v37 intValue];
    }
    else
    {
      v41->_hasMediaParsecCategory = 0;
      int v51 = -1;
    }
    v41->_mediaParsecCategory = v51;
    if (v38)
    {
      v41->_hasSirikitResponseCode = 1;
      int v52 = [v38 intValue];
    }
    else
    {
      v41->_hasSirikitResponseCode = 0;
      int v52 = -1;
    }
    v41->_sirikitResponseCode = v52;
    if (v39)
    {
      v41->_hasAppSelectionUses = 1;
      int v53 = [v39 intValue];
    }
    else
    {
      v41->_hasAppSelectionUses = 0;
      int v53 = -1;
    }
    v41->_appSelectionUses = v53;
    if (v40)
    {
      v41->_hasModelVersion = 1;
      unsigned int v54 = [v40 unsignedIntValue];
    }
    else
    {
      unsigned int v54 = 0;
      v41->_hasModelVersion = 0;
    }
    v41->_modelVersion = v54;
    v41->_resolutionType = a26;
  }

  return v41;
}

+ (id)protoFields
{
  v28[24] = *MEMORY[0x1E4F143B8];
  int v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientDayOfWeek" number:1 type:2 subMessageClass:0];
  v28[0] = v27;
  BOOL v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawClientHourOfDay" number:2 type:2 subMessageClass:0];
  v28[1] = v26;
  char v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaAlbumPresent" number:3 type:12 subMessageClass:0];
  v28[2] = v25;
  unint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaArtistPresent" number:4 type:12 subMessageClass:0];
  v28[3] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaGenrePresent" number:5 type:12 subMessageClass:0];
  v28[4] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaMoodPresent" number:6 type:12 subMessageClass:0];
  v28[5] = v22;
  unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaNamePresent" number:7 type:12 subMessageClass:0];
  v28[6] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaReleaseDatePresent" number:8 type:12 subMessageClass:0];
  v28[7] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingLastBundleRecencyS" number:9 type:2 subMessageClass:0];
  v28[8] = v19;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawLanguage" number:10 type:3 subMessageClass:0];
  v28[9] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawLocale" number:11 type:3 subMessageClass:0];
  v28[10] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawRegion" number:12 type:3 subMessageClass:0];
  v28[11] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isClientDaylight" number:13 type:12 subMessageClass:0];
  v28[12] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isClientNavigating" number:14 type:12 subMessageClass:0];
  v28[13] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isClientWorkout" number:15 type:12 subMessageClass:0];
  v28[14] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaType" number:16 type:2 subMessageClass:0];
  v28[15] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nowPlayingState" number:17 type:2 subMessageClass:0];
  v28[16] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPireneRequest" number:18 type:12 subMessageClass:0];
  v28[17] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"foregroundBundleRecencyS" number:19 type:0 subMessageClass:0];
  v28[18] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaParsecCategory" number:20 type:2 subMessageClass:0];
  v28[19] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sirikitResponseCode" number:21 type:2 subMessageClass:0];
  v28[20] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appSelectionUses" number:22 type:2 subMessageClass:0];
  v28[21] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:23 type:4 subMessageClass:0];
  v28[22] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resolutionType" number:24 type:4 subMessageClass:0];
  v28[23] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:24];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4128;
}

+ (id)columns
{
  v28[24] = *MEMORY[0x1E4F143B8];
  int v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientDayOfWeek" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  BOOL v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawClientHourOfDay" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  char v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaAlbumPresent" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  unint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaArtistPresent" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaGenrePresent" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaMoodPresent" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaNamePresent" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaReleaseDatePresent" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingLastBundleRecencyS" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawLanguage" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:3 convertedType:0];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawLocale" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:3 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawRegion" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:3 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isClientDaylight" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isClientNavigating" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isClientWorkout" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaType" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nowPlayingState" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPireneRequest" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:12 convertedType:0];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"foregroundBundleRecencyS" dataType:1 requestOnly:0 fieldNumber:19 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaParsecCategory" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sirikitResponseCode" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appSelectionUses" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resolutionType" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:4 convertedType:0];
  v28[0] = v27;
  v28[1] = v26;
  v28[2] = v25;
  v28[3] = v24;
  v28[4] = v23;
  v28[5] = v22;
  v28[6] = v21;
  v28[7] = v20;
  v28[8] = v19;
  v28[9] = v18;
  v28[10] = v17;
  v28[11] = v16;
  v28[12] = v15;
  v28[13] = v14;
  v28[14] = v2;
  v28[15] = v3;
  v28[16] = v4;
  v28[17] = v13;
  v28[18] = v12;
  v28[19] = v5;
  v28[20] = v6;
  v28[21] = v11;
  v28[22] = v7;
  v28[23] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:24];

  return v10;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriMusicInferenceTrainingIndependentSignals alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end