@interface GDGraphSong
- (GDGraphQuantityRelationship)duration;
- (GDGraphSong)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 artistNameField:(id)a5 albumNameField:(id)a6 genreField:(id)a7 durationField:(id)a8 identifiersField:(id)a9 songAdamIdField:(id)a10 albumAdamIdField:(id)a11 artistAdamIdField:(id)a12 allNameField:(id)a13 allArtistNameField:(id)a14 allAlbumNameField:(id)a15 allGenreField:(id)a16 allDurationField:(id)a17 allSongAdamIdField:(id)a18 allAlbumAdamIdField:(id)a19 allArtistAdamIdField:(id)a20;
- (GDGraphSongEntityIdentifier)entityIdentifier;
- (NSArray)allAlbumAdamId;
- (NSArray)allAlbumName;
- (NSArray)allArtistAdamId;
- (NSArray)allArtistName;
- (NSArray)allDuration;
- (NSArray)allGenre;
- (NSArray)allName;
- (NSArray)allSongAdamId;
- (NSArray)identifiers;
- (NSString)albumAdamId;
- (NSString)albumName;
- (NSString)artistAdamId;
- (NSString)artistName;
- (NSString)genre;
- (NSString)name;
- (NSString)songAdamId;
@end

@implementation GDGraphSong

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allArtistAdamId, 0);
  objc_storeStrong((id *)&self->_allAlbumAdamId, 0);
  objc_storeStrong((id *)&self->_allSongAdamId, 0);
  objc_storeStrong((id *)&self->_allDuration, 0);
  objc_storeStrong((id *)&self->_allGenre, 0);
  objc_storeStrong((id *)&self->_allAlbumName, 0);
  objc_storeStrong((id *)&self->_allArtistName, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_artistAdamId, 0);
  objc_storeStrong((id *)&self->_albumAdamId, 0);
  objc_storeStrong((id *)&self->_songAdamId, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allArtistAdamId
{
  return self->_allArtistAdamId;
}

- (NSArray)allAlbumAdamId
{
  return self->_allAlbumAdamId;
}

- (NSArray)allSongAdamId
{
  return self->_allSongAdamId;
}

- (NSArray)allDuration
{
  return self->_allDuration;
}

- (NSArray)allGenre
{
  return self->_allGenre;
}

- (NSArray)allAlbumName
{
  return self->_allAlbumName;
}

- (NSArray)allArtistName
{
  return self->_allArtistName;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSString)artistAdamId
{
  return self->_artistAdamId;
}

- (NSString)albumAdamId
{
  return self->_albumAdamId;
}

- (NSString)songAdamId
{
  return self->_songAdamId;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (GDGraphQuantityRelationship)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphSongEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphSong)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 artistNameField:(id)a5 albumNameField:(id)a6 genreField:(id)a7 durationField:(id)a8 identifiersField:(id)a9 songAdamIdField:(id)a10 albumAdamIdField:(id)a11 artistAdamIdField:(id)a12 allNameField:(id)a13 allArtistNameField:(id)a14 allAlbumNameField:(id)a15 allGenreField:(id)a16 allDurationField:(id)a17 allSongAdamIdField:(id)a18 allAlbumAdamIdField:(id)a19 allArtistAdamIdField:(id)a20
{
  id v51 = a3;
  id v36 = a4;
  id v50 = a4;
  id v37 = a5;
  id v49 = a5;
  id v38 = a6;
  id v48 = a6;
  id v39 = a7;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a11;
  id v42 = a12;
  id v41 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  id v31 = a20;
  v52.receiver = self;
  v52.super_class = (Class)GDGraphSong;
  v32 = [(GDGraphSong *)&v52 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_entityIdentifier, a3);
    objc_storeStrong((id *)&v33->_name, v36);
    objc_storeStrong((id *)&v33->_artistName, v37);
    objc_storeStrong((id *)&v33->_albumName, v38);
    objc_storeStrong((id *)&v33->_genre, v39);
    objc_storeStrong((id *)&v33->_duration, a8);
    objc_storeStrong((id *)&v33->_identifiers, a9);
    objc_storeStrong((id *)&v33->_songAdamId, a10);
    objc_storeStrong((id *)&v33->_albumAdamId, a11);
    objc_storeStrong((id *)&v33->_artistAdamId, a12);
    objc_storeStrong((id *)&v33->_allName, a13);
    objc_storeStrong((id *)&v33->_allArtistName, a14);
    objc_storeStrong((id *)&v33->_allAlbumName, a15);
    objc_storeStrong((id *)&v33->_allGenre, a16);
    objc_storeStrong((id *)&v33->_allDuration, a17);
    objc_storeStrong((id *)&v33->_allSongAdamId, a18);
    objc_storeStrong((id *)&v33->_allAlbumAdamId, a19);
    objc_storeStrong((id *)&v33->_allArtistAdamId, a20);
  }

  return v33;
}

@end