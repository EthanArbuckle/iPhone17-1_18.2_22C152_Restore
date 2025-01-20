@interface MPCRadioPlaybackIntentTracklistToken
+ (BOOL)supportsSecureCoding;
- (BOOL)continueListeningStation;
- (MPCModelRadioContentReference)nowPlayingContentReference;
- (MPCModelRadioContentReference)seedContentReference;
- (MPCRadioPlaybackIntentTracklistToken)initWithCoder:(id)a3;
- (MPModelRadioStation)radioStation;
- (NSURL)radioStationURL;
- (void)encodeWithCoder:(id)a3;
- (void)setContinueListeningStation:(BOOL)a3;
- (void)setNowPlayingContentReference:(id)a3;
- (void)setRadioStation:(id)a3;
- (void)setRadioStationURL:(id)a3;
- (void)setSeedContentReference:(id)a3;
@end

@implementation MPCRadioPlaybackIntentTracklistToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationURL, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);

  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
}

- (void)setRadioStationURL:(id)a3
{
}

- (NSURL)radioStationURL
{
  return self->_radioStationURL;
}

- (void)setRadioStation:(id)a3
{
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)setSeedContentReference:(id)a3
{
}

- (MPCModelRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setNowPlayingContentReference:(id)a3
{
}

- (MPCModelRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setContinueListeningStation:(BOOL)a3
{
  self->_continueListeningStation = a3;
}

- (BOOL)continueListeningStation
{
  return self->_continueListeningStation;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL continueListeningStation = self->_continueListeningStation;
  id v5 = a3;
  [v5 encodeBool:continueListeningStation forKey:@"continue-listening"];
  [v5 encodeObject:self->_radioStation forKey:@"station"];
  [v5 encodeObject:self->_radioStationURL forKey:@"url"];
}

- (MPCRadioPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCRadioPlaybackIntentTracklistToken *)self init];
  if (v5)
  {
    v5->_BOOL continueListeningStation = [v4 decodeBoolForKey:@"continue-listening"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"station"];
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPModelRadioStation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    radioStationURL = v5->_radioStationURL;
    v5->_radioStationURL = (NSURL *)v8;
  }
  return v5;
}

@end