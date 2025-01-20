@interface CCMediaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCMediaAlbum)album;
- (CCMediaAlbumArtist)albumArtist;
- (CCMediaAudiobook)audiobook;
- (CCMediaAudiobookArtist)audiobookArtist;
- (CCMediaContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5;
- (CCMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCMediaGenre)genre;
- (CCMediaMovie)movie;
- (CCMediaMusicVideo)musicVideo;
- (CCMediaPlaylist)playlist;
- (CCMediaSong)song;
- (CCMediaSongArtist)songArtist;
- (CCMediaTVEpisode)TVEpisode;
- (CCMediaTVShow)TVShow;
- (id)jsonDictionary;
- (unsigned)entityType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCMediaContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiobook, 0);
  objc_storeStrong((id *)&self->_audiobookArtist, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_TVEpisode, 0);
  objc_storeStrong((id *)&self->_TVShow, 0);
  objc_storeStrong((id *)&self->_musicVideo, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (CCMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v106[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"albumArtist"];
    if (v9)
    {
      v106[0] = 0;
      v10 = [[CCMediaAlbumArtist alloc] initWithJSONDictionary:v9 error:v106];
      id v11 = v106[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        v38 = 0;
LABEL_106:

        goto LABEL_107;
      }

      v9 = v10;
    }
    v12 = [v6 objectForKeyedSubscript:@"songArtist"];
    if (v12)
    {
      v13 = [CCMediaSongArtist alloc];
      id v105 = 0;
      v14 = [(CCMediaSongArtist *)v13 initWithJSONDictionary:v12 error:&v105];
      v15 = (CCMediaAlbumArtist *)v105;
      v10 = v15;
      if (!v14 || v15)
      {
        CCSetError();
        v38 = 0;
LABEL_105:

        goto LABEL_106;
      }

      v12 = v14;
    }
    v10 = [v6 objectForKeyedSubscript:@"album"];
    if (v10)
    {
      v16 = [CCMediaAlbum alloc];
      id v104 = 0;
      v17 = [(CCMediaAlbum *)v16 initWithJSONDictionary:v10 error:&v104];
      v18 = (CCMediaSongArtist *)v104;
      v14 = v18;
      if (!v17 || v18)
      {
        CCSetError();
        v38 = 0;
LABEL_104:

        goto LABEL_105;
      }

      v10 = (CCMediaAlbumArtist *)v17;
    }
    v14 = [v6 objectForKeyedSubscript:@"genre"];
    if (v14)
    {
      v19 = [CCMediaGenre alloc];
      id v103 = 0;
      v20 = [(CCMediaGenre *)v19 initWithJSONDictionary:v14 error:&v103];
      v21 = (CCMediaAlbum *)v103;
      v17 = v21;
      if (!v20 || v21)
      {
        CCSetError();
        v38 = 0;
LABEL_103:

        goto LABEL_104;
      }

      v14 = (CCMediaSongArtist *)v20;
    }
    v17 = [v6 objectForKeyedSubscript:@"song"];
    if (v17)
    {
      v93 = v14;
      v22 = self;
      v23 = [CCMediaSong alloc];
      id v102 = 0;
      v24 = v17;
      uint64_t v25 = [(CCMediaSong *)v23 initWithJSONDictionary:v17 error:&v102];
      v26 = (CCMediaGenre *)v102;
      v27 = v26;
      if (!v25 || v26)
      {
        CCSetError();
        v39 = (void *)v25;
        v38 = 0;
        v20 = v27;
        v17 = v24;
        self = v22;
        v14 = v93;
LABEL_102:

        goto LABEL_103;
      }
      v17 = (CCMediaAlbum *)v25;

      self = v22;
      v14 = v93;
    }
    uint64_t v28 = [v6 objectForKeyedSubscript:@"playlist"];
    v91 = v17;
    if (v28)
    {
      v29 = [CCMediaPlaylist alloc];
      id v101 = 0;
      v30 = (CCMediaGenre *)v28;
      uint64_t v28 = [(CCMediaPlaylist *)v29 initWithJSONDictionary:v28 error:&v101];
      id v31 = v101;
      v94 = (void *)v28;
      if (!v28 || v31)
      {
        v92 = v31;
        CCSetError();
        v38 = 0;
        v20 = v30;
        v17 = v91;
        goto LABEL_101;
      }

      v17 = v91;
    }
    uint64_t v32 = [v6 objectForKeyedSubscript:@"musicVideo"];
    if (!v32)
    {
      v92 = 0;
LABEL_38:
      uint64_t v40 = [v6 objectForKeyedSubscript:@"TVShow"];
      v82 = (CCMediaGenre *)v28;
      if (v40)
      {
        v41 = (void *)v40;
        v42 = [CCMediaTVShow alloc];
        id v99 = 0;
        v94 = v41;
        uint64_t v43 = [(CCMediaTVShow *)v42 initWithJSONDictionary:v41 error:&v99];
        id v44 = v99;
        if (!v43 || v44)
        {
          v84 = (void *)v43;
          v90 = v44;
          CCSetError();
          v38 = 0;
          v20 = v82;

LABEL_100:
          goto LABEL_101;
        }

        v94 = (void *)v43;
      }
      else
      {
        v94 = 0;
      }
      uint64_t v45 = [v6 objectForKeyedSubscript:@"TVEpisode"];
      if (v45)
      {
        v46 = (void *)v45;
        v47 = [CCMediaTVEpisode alloc];
        id v98 = 0;
        v90 = v46;
        uint64_t v48 = [(CCMediaTVEpisode *)v47 initWithJSONDictionary:v46 error:&v98];
        id v49 = v98;
        v83 = (void *)v48;
        if (!v48 || v49)
        {
          v85 = v49;
          CCSetError();
          v38 = 0;
          v20 = v82;
          goto LABEL_98;
        }

        v90 = (void *)v48;
      }
      else
      {
        v90 = 0;
      }
      uint64_t v50 = [v6 objectForKeyedSubscript:@"movie"];
      if (v50)
      {
        v51 = (void *)v50;
        v52 = [CCMediaMovie alloc];
        id v97 = 0;
        v85 = v51;
        uint64_t v53 = [(CCMediaMovie *)v52 initWithJSONDictionary:v51 error:&v97];
        id v54 = v97;
        v81 = (void *)v53;
        if (!v53 || v54)
        {
          v83 = v54;
          CCSetError();
          v38 = 0;
          v20 = v82;
LABEL_97:

LABEL_98:
          goto LABEL_100;
        }

        v85 = (void *)v53;
      }
      else
      {
        v85 = 0;
      }
      v20 = v82;
      uint64_t v55 = [v6 objectForKeyedSubscript:@"audiobookArtist"];
      if (v55)
      {
        v83 = (void *)v55;
        v56 = [CCMediaAudiobookArtist alloc];
        id v96 = 0;
        uint64_t v86 = [(CCMediaAudiobookArtist *)v56 initWithJSONDictionary:v83 error:&v96];
        id v57 = v96;
        if (!v86 || v57)
        {
          v81 = v57;
          CCSetError();
          v38 = 0;
          v64 = (void *)v86;
          goto LABEL_96;
        }

        v83 = (void *)v86;
      }
      else
      {
        v83 = 0;
      }
      uint64_t v58 = [v6 objectForKeyedSubscript:@"audiobook"];
      if (!v58)
      {
        v63 = 0;
        goto LABEL_68;
      }
      v59 = (void *)v58;
      v60 = [CCMediaAudiobook alloc];
      id v95 = 0;
      v81 = v59;
      uint64_t v61 = [(CCMediaAudiobook *)v60 initWithJSONDictionary:v59 error:&v95];
      id v62 = v95;
      v87 = (void *)v61;
      if (v61 && !v62)
      {

        v63 = (void *)v61;
        v20 = v82;
LABEL_68:
        v81 = v63;
        if (v9)
        {
          v65 = v9;
          int v66 = 1;
        }
        else
        {
          int v66 = 0;
        }
        v88 = v9;
        if (v12)
        {
          v88 = v12;

          int v66 = 2;
        }
        if (v10)
        {
          v71 = v10;

          int v66 = 3;
          v88 = v71;
        }
        if (v14)
        {
          v72 = v14;

          int v66 = 4;
          v88 = (CCMediaAlbumArtist *)v72;
        }
        if (v17)
        {
          v73 = v17;

          int v66 = 5;
          v88 = (CCMediaAlbumArtist *)v73;
        }
        if (v20)
        {
          v74 = v20;

          int v66 = 6;
          v88 = (CCMediaAlbumArtist *)v74;
        }
        if (v92)
        {
          v75 = v92;

          int v66 = 7;
          v88 = v75;
        }
        if (v94)
        {
          v76 = v94;

          int v66 = 8;
          v88 = v76;
        }
        if (v90)
        {
          v77 = v90;

          int v66 = 9;
          v88 = v77;
        }
        if (v85)
        {
          v78 = v85;

          int v66 = 10;
          v88 = v78;
        }
        if (v83)
        {
          v79 = v83;

          int v66 = 11;
          v88 = v79;
        }
        if (v81)
        {
          v70 = v81;

          unsigned int v80 = 12;
          v88 = v70;
        }
        else
        {
          unsigned int v80 = v66;
        }
        v68 = [[CCMediaContent alloc] initWithEntity:v88 entityType:v80 error:a4];
        v64 = v88;
        v38 = v68;
        goto LABEL_96;
      }
      id v67 = v62;
      CCSetError();

      v38 = 0;
      v64 = v67;
      v20 = v82;
LABEL_96:

      goto LABEL_97;
    }
    v33 = (CCMediaGenre *)v28;
    v34 = (void *)v32;
    v35 = [CCMediaMusicVideo alloc];
    id v100 = 0;
    v92 = v34;
    uint64_t v36 = [(CCMediaMusicVideo *)v35 initWithJSONDictionary:v34 error:&v100];
    id v37 = v100;
    if (v36 && !v37)
    {

      v92 = (void *)v36;
      uint64_t v28 = (uint64_t)v33;
      v17 = v91;
      goto LABEL_38;
    }
    v89 = (void *)v36;
    v94 = v37;
    CCSetError();
    v38 = 0;
    v20 = v33;
    v17 = v91;

LABEL_101:
    v39 = v92;
    goto LABEL_102;
  }
  CCSetError();
  v38 = 0;
LABEL_107:

  return v38;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_albumArtist)
  {
    v4 = [(CCMediaContent *)self albumArtist];
    v5 = [v4 jsonDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"albumArtist"];
  }
  if (self->_songArtist)
  {
    id v6 = [(CCMediaContent *)self songArtist];
    v7 = [v6 jsonDictionary];
    [v3 setObject:v7 forKeyedSubscript:@"songArtist"];
  }
  if (self->_album)
  {
    id v8 = [(CCMediaContent *)self album];
    v9 = [v8 jsonDictionary];
    [v3 setObject:v9 forKeyedSubscript:@"album"];
  }
  if (self->_genre)
  {
    v10 = [(CCMediaContent *)self genre];
    id v11 = [v10 jsonDictionary];
    [v3 setObject:v11 forKeyedSubscript:@"genre"];
  }
  if (self->_song)
  {
    v12 = [(CCMediaContent *)self song];
    v13 = [v12 jsonDictionary];
    [v3 setObject:v13 forKeyedSubscript:@"song"];
  }
  if (self->_playlist)
  {
    v14 = [(CCMediaContent *)self playlist];
    v15 = [v14 jsonDictionary];
    [v3 setObject:v15 forKeyedSubscript:@"playlist"];
  }
  if (self->_musicVideo)
  {
    v16 = [(CCMediaContent *)self musicVideo];
    v17 = [v16 jsonDictionary];
    [v3 setObject:v17 forKeyedSubscript:@"musicVideo"];
  }
  if (self->_TVShow)
  {
    v18 = [(CCMediaContent *)self TVShow];
    v19 = [v18 jsonDictionary];
    [v3 setObject:v19 forKeyedSubscript:@"TVShow"];
  }
  if (self->_TVEpisode)
  {
    v20 = [(CCMediaContent *)self TVEpisode];
    v21 = [v20 jsonDictionary];
    [v3 setObject:v21 forKeyedSubscript:@"TVEpisode"];
  }
  if (self->_movie)
  {
    v22 = [(CCMediaContent *)self movie];
    v23 = [v22 jsonDictionary];
    [v3 setObject:v23 forKeyedSubscript:@"movie"];
  }
  if (self->_audiobookArtist)
  {
    v24 = [(CCMediaContent *)self audiobookArtist];
    uint64_t v25 = [v24 jsonDictionary];
    [v3 setObject:v25 forKeyedSubscript:@"audiobookArtist"];
  }
  if (self->_audiobook)
  {
    v26 = [(CCMediaContent *)self audiobook];
    v27 = [v26 jsonDictionary];
    [v3 setObject:v27 forKeyedSubscript:@"audiobook"];
  }
  uint64_t v28 = (void *)[v3 copy];

  return v28;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v17 = (void (**)(id, void *))a3;
  if (self->_albumArtist)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18541 subMessageValue:self->_albumArtist];
    v17[2](v17, v5);
  }
  if (self->_songArtist)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18542 subMessageValue:self->_songArtist];
    v17[2](v17, v6);
  }
  if (self->_album)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18543 subMessageValue:self->_album];
    v17[2](v17, v7);
  }
  if (self->_genre)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18544 subMessageValue:self->_genre];
    v17[2](v17, v8);
  }
  if (self->_song)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18545 subMessageValue:self->_song];
    v17[2](v17, v9);
  }
  if (self->_playlist)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18546 subMessageValue:self->_playlist];
    v17[2](v17, v10);
  }
  if (self->_musicVideo)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18547 subMessageValue:self->_musicVideo];
    v17[2](v17, v11);
  }
  if (self->_TVShow)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18548 subMessageValue:self->_TVShow];
    v17[2](v17, v12);
  }
  if (self->_TVEpisode)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18549 subMessageValue:self->_TVEpisode];
    v17[2](v17, v13);
  }
  if (self->_movie)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18550 subMessageValue:self->_movie];
    v17[2](v17, v14);
  }
  if (self->_audiobookArtist)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18551 subMessageValue:self->_audiobookArtist];
    v17[2](v17, v15);
  }
  if (self->_audiobook)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18552 subMessageValue:self->_audiobook];
    v17[2](v17, v16);
  }
}

- (CCMediaAudiobook)audiobook
{
  v2 = (void *)[(CCMediaAudiobook *)self->_audiobook copy];
  return (CCMediaAudiobook *)v2;
}

- (CCMediaAudiobookArtist)audiobookArtist
{
  v2 = (void *)[(CCMediaAudiobookArtist *)self->_audiobookArtist copy];
  return (CCMediaAudiobookArtist *)v2;
}

- (CCMediaMovie)movie
{
  v2 = (void *)[(CCMediaMovie *)self->_movie copy];
  return (CCMediaMovie *)v2;
}

- (CCMediaTVEpisode)TVEpisode
{
  v2 = (void *)[(CCMediaTVEpisode *)self->_TVEpisode copy];
  return (CCMediaTVEpisode *)v2;
}

- (CCMediaTVShow)TVShow
{
  v2 = (void *)[(CCMediaTVShow *)self->_TVShow copy];
  return (CCMediaTVShow *)v2;
}

- (CCMediaMusicVideo)musicVideo
{
  v2 = (void *)[(CCMediaMusicVideo *)self->_musicVideo copy];
  return (CCMediaMusicVideo *)v2;
}

- (CCMediaPlaylist)playlist
{
  v2 = (void *)[(CCMediaPlaylist *)self->_playlist copy];
  return (CCMediaPlaylist *)v2;
}

- (CCMediaSong)song
{
  v2 = (void *)[(CCMediaSong *)self->_song copy];
  return (CCMediaSong *)v2;
}

- (CCMediaGenre)genre
{
  v2 = (void *)[(CCMediaGenre *)self->_genre copy];
  return (CCMediaGenre *)v2;
}

- (CCMediaAlbum)album
{
  v2 = (void *)[(CCMediaAlbum *)self->_album copy];
  return (CCMediaAlbum *)v2;
}

- (CCMediaSongArtist)songArtist
{
  v2 = (void *)[(CCMediaSongArtist *)self->_songArtist copy];
  return (CCMediaSongArtist *)v2;
}

- (CCMediaAlbumArtist)albumArtist
{
  v2 = (void *)[(CCMediaAlbumArtist *)self->_albumArtist copy];
  return (CCMediaAlbumArtist *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_60;
  }
  id v10 = 0;
  id v11 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v6[*v9]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12) {
      break;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v7;
      unint64_t v17 = *(void *)&v6[v16];
      if (v17 == -1 || v17 >= *(void *)&v6[*v8]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v6[*v11] + v17);
      *(void *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0) {
        goto LABEL_17;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        if (*(void *)&v6[*v9]) {
          goto LABEL_61;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_61;
    }
LABEL_18:
    switch((v15 >> 3))
    {
      case 1u:
        v20 = [CCMediaAlbumArtist alloc];
        v21 = CCPBReaderReadDataNoCopy();
        id v163 = 0;
        v22 = [(CCItemMessage *)v20 initWithData:v21 error:&v163];
        id v10 = v163;
        albumArtist = self->_albumArtist;
        self->_albumArtist = v22;

        if (!v10)
        {
          self->_entityType = 1;
          songArtist = self->_songArtist;
          self->_songArtist = 0;

          goto LABEL_25;
        }
        break;
      case 2u:
        uint64_t v25 = [CCMediaSongArtist alloc];
        v26 = CCPBReaderReadDataNoCopy();
        id v162 = 0;
        v27 = [(CCItemMessage *)v25 initWithData:v26 error:&v162];
        id v10 = v162;
        uint64_t v28 = self->_songArtist;
        self->_songArtist = v27;

        if (!v10)
        {
          v29 = self->_albumArtist;
          self->_albumArtist = 0;

          self->_entityType = 2;
LABEL_25:
          album = self->_album;
          self->_album = 0;

          goto LABEL_28;
        }
        break;
      case 3u:
        id v31 = [CCMediaAlbum alloc];
        uint64_t v32 = CCPBReaderReadDataNoCopy();
        id v161 = 0;
        v33 = [(CCItemMessage *)v31 initWithData:v32 error:&v161];
        id v10 = v161;
        v34 = self->_album;
        self->_album = v33;

        if (!v10)
        {
          v35 = self->_albumArtist;
          self->_albumArtist = 0;

          uint64_t v36 = self->_songArtist;
          self->_songArtist = 0;

          self->_entityType = 3;
LABEL_28:
          genre = self->_genre;
          self->_genre = 0;

          goto LABEL_31;
        }
        break;
      case 4u:
        v38 = [CCMediaGenre alloc];
        v39 = CCPBReaderReadDataNoCopy();
        id v160 = 0;
        uint64_t v40 = [(CCItemMessage *)v38 initWithData:v39 error:&v160];
        id v10 = v160;
        v41 = self->_genre;
        self->_genre = v40;

        if (!v10)
        {
          v42 = self->_albumArtist;
          self->_albumArtist = 0;

          uint64_t v43 = self->_songArtist;
          self->_songArtist = 0;

          id v44 = self->_album;
          self->_album = 0;

          self->_entityType = 4;
LABEL_31:
          song = self->_song;
          self->_song = 0;

          goto LABEL_34;
        }
        break;
      case 5u:
        v46 = [CCMediaSong alloc];
        v47 = CCPBReaderReadDataNoCopy();
        id v159 = 0;
        uint64_t v48 = [(CCItemMessage *)v46 initWithData:v47 error:&v159];
        id v10 = v159;
        id v49 = self->_song;
        self->_song = v48;

        if (!v10)
        {
          uint64_t v50 = self->_albumArtist;
          self->_albumArtist = 0;

          v51 = self->_songArtist;
          self->_songArtist = 0;

          v52 = self->_album;
          self->_album = 0;

          uint64_t v53 = self->_genre;
          self->_genre = 0;

          self->_entityType = 5;
LABEL_34:
          playlist = self->_playlist;
          self->_playlist = 0;

          goto LABEL_35;
        }
        break;
      case 6u:
        uint64_t v61 = [CCMediaPlaylist alloc];
        id v62 = CCPBReaderReadDataNoCopy();
        id v158 = 0;
        v63 = [(CCItemMessage *)v61 initWithData:v62 error:&v158];
        id v10 = v158;
        v64 = self->_playlist;
        self->_playlist = v63;

        if (!v10)
        {
          v65 = self->_albumArtist;
          self->_albumArtist = 0;

          int v66 = self->_songArtist;
          self->_songArtist = 0;

          id v67 = self->_album;
          self->_album = 0;

          v68 = self->_genre;
          self->_genre = 0;

          v69 = self->_song;
          self->_song = 0;

          self->_entityType = 6;
LABEL_35:
          musicVideo = self->_musicVideo;
          self->_musicVideo = 0;

          goto LABEL_36;
        }
        break;
      case 7u:
        v70 = [CCMediaMusicVideo alloc];
        v71 = CCPBReaderReadDataNoCopy();
        id v157 = 0;
        v72 = [(CCItemMessage *)v70 initWithData:v71 error:&v157];
        id v10 = v157;
        v73 = self->_musicVideo;
        self->_musicVideo = v72;

        if (!v10)
        {
          v74 = self->_albumArtist;
          self->_albumArtist = 0;

          v75 = self->_songArtist;
          self->_songArtist = 0;

          v76 = self->_album;
          self->_album = 0;

          v77 = self->_genre;
          self->_genre = 0;

          v78 = self->_song;
          self->_song = 0;

          v79 = self->_playlist;
          self->_playlist = 0;

          self->_entityType = 7;
LABEL_36:
          TVShow = self->_TVShow;
          self->_TVShow = 0;

          goto LABEL_37;
        }
        break;
      case 8u:
        unsigned int v80 = [CCMediaTVShow alloc];
        v81 = CCPBReaderReadDataNoCopy();
        id v156 = 0;
        v82 = [(CCItemMessage *)v80 initWithData:v81 error:&v156];
        id v10 = v156;
        v83 = self->_TVShow;
        self->_TVShow = v82;

        if (!v10)
        {
          v84 = self->_albumArtist;
          self->_albumArtist = 0;

          v85 = self->_songArtist;
          self->_songArtist = 0;

          uint64_t v86 = self->_album;
          self->_album = 0;

          v87 = self->_genre;
          self->_genre = 0;

          v88 = self->_song;
          self->_song = 0;

          v89 = self->_playlist;
          self->_playlist = 0;

          v90 = self->_musicVideo;
          self->_musicVideo = 0;

          self->_entityType = 8;
LABEL_37:
          TVEpisode = self->_TVEpisode;
          self->_TVEpisode = 0;

          goto LABEL_38;
        }
        break;
      case 9u:
        v91 = [CCMediaTVEpisode alloc];
        v92 = CCPBReaderReadDataNoCopy();
        id v155 = 0;
        v93 = [(CCItemMessage *)v91 initWithData:v92 error:&v155];
        id v10 = v155;
        v94 = self->_TVEpisode;
        self->_TVEpisode = v93;

        if (!v10)
        {
          id v95 = self->_albumArtist;
          self->_albumArtist = 0;

          id v96 = self->_songArtist;
          self->_songArtist = 0;

          id v97 = self->_album;
          self->_album = 0;

          id v98 = self->_genre;
          self->_genre = 0;

          id v99 = self->_song;
          self->_song = 0;

          id v100 = self->_playlist;
          self->_playlist = 0;

          id v101 = self->_musicVideo;
          self->_musicVideo = 0;

          id v102 = self->_TVShow;
          self->_TVShow = 0;

          self->_entityType = 9;
LABEL_38:
          movie = self->_movie;
          self->_movie = 0;

          goto LABEL_39;
        }
        break;
      case 0xAu:
        id v103 = [CCMediaMovie alloc];
        id v104 = CCPBReaderReadDataNoCopy();
        id v154 = 0;
        id v105 = [(CCItemMessage *)v103 initWithData:v104 error:&v154];
        id v10 = v154;
        v106 = self->_movie;
        self->_movie = v105;

        if (!v10)
        {
          v107 = self->_albumArtist;
          self->_albumArtist = 0;

          v108 = self->_songArtist;
          self->_songArtist = 0;

          v109 = self->_album;
          self->_album = 0;

          v110 = self->_genre;
          self->_genre = 0;

          v111 = self->_song;
          self->_song = 0;

          v112 = self->_playlist;
          self->_playlist = 0;

          v113 = self->_musicVideo;
          self->_musicVideo = 0;

          v114 = self->_TVShow;
          self->_TVShow = 0;

          v115 = self->_TVEpisode;
          self->_TVEpisode = 0;

          self->_entityType = 10;
LABEL_39:
          audiobookArtist = self->_audiobookArtist;
          self->_audiobookArtist = 0;

          goto LABEL_40;
        }
        break;
      case 0xBu:
        v116 = [CCMediaAudiobookArtist alloc];
        v117 = CCPBReaderReadDataNoCopy();
        id v153 = 0;
        v118 = [(CCItemMessage *)v116 initWithData:v117 error:&v153];
        id v10 = v153;
        v119 = self->_audiobookArtist;
        self->_audiobookArtist = v118;

        if (!v10)
        {
          v120 = self->_albumArtist;
          self->_albumArtist = 0;

          v121 = self->_songArtist;
          self->_songArtist = 0;

          v122 = self->_album;
          self->_album = 0;

          v123 = self->_genre;
          self->_genre = 0;

          v124 = self->_song;
          self->_song = 0;

          v125 = self->_playlist;
          self->_playlist = 0;

          v126 = self->_musicVideo;
          self->_musicVideo = 0;

          v127 = self->_TVShow;
          self->_TVShow = 0;

          v128 = self->_TVEpisode;
          self->_TVEpisode = 0;

          v129 = self->_movie;
          self->_movie = 0;

          self->_entityType = 11;
LABEL_40:
          audiobook = self->_audiobook;
          self->_audiobook = 0;
        }
        break;
      case 0xCu:
        v130 = [CCMediaAudiobook alloc];
        v131 = CCPBReaderReadDataNoCopy();
        id v152 = 0;
        v132 = [(CCItemMessage *)v130 initWithData:v131 error:&v152];
        id v10 = v152;
        v133 = self->_audiobook;
        self->_audiobook = v132;

        if (!v10)
        {
          v134 = self->_albumArtist;
          self->_albumArtist = 0;

          v135 = self->_songArtist;
          self->_songArtist = 0;

          v136 = self->_album;
          self->_album = 0;

          v137 = self->_genre;
          self->_genre = 0;

          v138 = self->_song;
          self->_song = 0;

          v139 = self->_playlist;
          self->_playlist = 0;

          v140 = self->_musicVideo;
          self->_musicVideo = 0;

          v141 = self->_TVShow;
          self->_TVShow = 0;

          v142 = self->_TVEpisode;
          self->_TVEpisode = 0;

          v143 = self->_movie;
          self->_movie = 0;

          v144 = self->_audiobookArtist;
          self->_audiobookArtist = 0;

          self->_entityType = 12;
        }
        break;
      default:
        if (CCPBReaderSkipValueWithTag())
        {
          id v10 = 0;
        }
        else
        {
          v145 = (objc_class *)objc_opt_class();
          v146 = NSStringFromClass(v145);
          CCSkipFieldErrorForMessage();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_60:
    if (!*(void *)&v6[*v9])
    {
      id v10 = 0;
      BOOL v150 = 1;
      goto LABEL_64;
    }
LABEL_61:
    v147 = (objc_class *)objc_opt_class();
    v148 = NSStringFromClass(v147);
    v149 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
  }
  BOOL v150 = 0;
LABEL_64:

  return v150;
}

- (CCMediaContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (IsInstanceOfExpectedClass) {
      goto LABEL_48;
    }
LABEL_50:
    CCSetError();
    uint64_t v25 = 0;
    goto LABEL_51;
  }
  if (v8 && a4 == 2)
  {
    objc_opt_class();
    int v12 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v12) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 3)
  {
    objc_opt_class();
    int v13 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v13) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 4)
  {
    objc_opt_class();
    int v14 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v14) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 5)
  {
    objc_opt_class();
    int v15 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v15) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 6)
  {
    objc_opt_class();
    int v16 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v16) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 7)
  {
    objc_opt_class();
    int v17 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v17) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 8)
  {
    objc_opt_class();
    int v18 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v18) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 9)
  {
    objc_opt_class();
    int v19 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v19) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 10)
  {
    objc_opt_class();
    int v20 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v20) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  if (v8 && a4 == 11)
  {
    objc_opt_class();
    int v21 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v21) {
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  id v11 = 0;
  if (!v8 || a4 != 12) {
    goto LABEL_49;
  }
  objc_opt_class();
  uint64_t v27 = 0;
  int v22 = CCValidateIsInstanceOfExpectedClass();
  id v11 = 0;
  if (!v22) {
    goto LABEL_50;
  }
LABEL_48:
  v23 = [v8 data];
  CCPBDataWriterWriteDataField();

LABEL_49:
  v24 = objc_msgSend(v9, "immutableData", v27);
  self = [(CCItemMessage *)self initWithData:v24 error:a5];

  uint64_t v25 = self;
LABEL_51:

  return v25;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 18540) > 0x1A) {
    return 0;
  }
  else {
    return off_26539C808[(unsigned __int16)(a3 - 18540)];
  }
}

+ (unsigned)itemType
{
  return 18540;
}

@end