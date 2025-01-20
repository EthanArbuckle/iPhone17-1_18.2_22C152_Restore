@interface MPCModelRadioGetTracksResponse
- (MPCModelRadioGetTracksResponse)initWithTracks:(id)a3 tracklistAction:(int64_t)a4;
- (MPSectionedCollection)tracks;
- (id)description;
- (int64_t)tracklistAction;
@end

@implementation MPCModelRadioGetTracksResponse

- (void).cxx_destruct
{
}

- (MPSectionedCollection)tracks
{
  return self->_tracks;
}

- (int64_t)tracklistAction
{
  return self->_tracklistAction;
}

- (id)description
{
  v3 = NSString;
  int64_t tracklistAction = self->_tracklistAction;
  if (tracklistAction)
  {
    if (tracklistAction == 1)
    {
      v5 = @"Replace";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown-%ld", self->_tracklistAction);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"Append";
  }
  uint64_t v6 = [(MPSectionedCollection *)self->_tracks totalItemCount];
  v7 = [(MPSectionedCollection *)self->_tracks allItems];
  v8 = [v3 stringWithFormat:@"<MPCModelRadioGetTracksResponse: %p action=%@> tracks.count=%ld tracks=%@", self, v5, v6, v7];

  return v8;
}

- (MPCModelRadioGetTracksResponse)initWithTracks:(id)a3 tracklistAction:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelRadioGetTracksResponse;
  v7 = [(MPCModelRadioGetTracksResponse *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_int64_t tracklistAction = a4;
    uint64_t v9 = [v6 copy];
    tracks = v8->_tracks;
    v8->_tracks = (MPSectionedCollection *)v9;
  }
  return v8;
}

@end