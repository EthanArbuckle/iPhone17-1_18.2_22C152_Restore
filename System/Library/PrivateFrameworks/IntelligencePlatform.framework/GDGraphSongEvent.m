@interface GDGraphSongEvent
- (GDGraphDateRelationship)date;
- (GDGraphSongEvent)initWithEntityIdentifierField:(id)a3 dateField:(id)a4 playbackStateField:(id)a5 songField:(id)a6 allDateField:(id)a7 allPlaybackStateField:(id)a8 allSongField:(id)a9;
- (GDGraphSongEventEntityIdentifier)entityIdentifier;
- (GDGraphSongRelationship)song;
- (NSArray)allDate;
- (NSArray)allPlaybackState;
- (NSArray)allSong;
- (NSString)playbackState;
@end

@implementation GDGraphSongEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSong, 0);
  objc_storeStrong((id *)&self->_allPlaybackState, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allSong
{
  return self->_allSong;
}

- (NSArray)allPlaybackState
{
  return self->_allPlaybackState;
}

- (NSArray)allDate
{
  return self->_allDate;
}

- (GDGraphSongRelationship)song
{
  return self->_song;
}

- (NSString)playbackState
{
  return self->_playbackState;
}

- (GDGraphDateRelationship)date
{
  return self->_date;
}

- (GDGraphSongEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphSongEvent)initWithEntityIdentifierField:(id)a3 dateField:(id)a4 playbackStateField:(id)a5 songField:(id)a6 allDateField:(id)a7 allPlaybackStateField:(id)a8 allSongField:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)GDGraphSongEvent;
  v18 = [(GDGraphSongEvent *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityIdentifier, a3);
    objc_storeStrong((id *)&v19->_date, a4);
    objc_storeStrong((id *)&v19->_playbackState, a5);
    objc_storeStrong((id *)&v19->_song, a6);
    objc_storeStrong((id *)&v19->_allDate, a7);
    objc_storeStrong((id *)&v19->_allPlaybackState, a8);
    objc_storeStrong((id *)&v19->_allSong, a9);
  }

  return v19;
}

@end