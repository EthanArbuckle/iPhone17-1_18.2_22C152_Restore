@interface WFShazamMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)isExplicit;
- (NSString)appleMusicID;
- (NSString)artist;
- (NSString)lyricsSnippet;
- (NSString)lyricsSnippetSynced;
- (NSString)title;
- (NSString)wfName;
- (NSURL)appleMusicURL;
- (NSURL)artworkURL;
- (NSURL)shazamURL;
- (NSURL)videoURL;
- (WFShazamMedia)initWithCoder:(id)a3;
- (WFShazamMedia)initWithMediaItem:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShazamMedia

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsSnippetSynced, 0);
  objc_storeStrong((id *)&self->_lyricsSnippet, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_appleMusicURL, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_appleMusicID, 0);
}

- (NSString)lyricsSnippetSynced
{
  return self->_lyricsSnippetSynced;
}

- (NSString)lyricsSnippet
{
  return self->_lyricsSnippet;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (NSURL)appleMusicURL
{
  return self->_appleMusicURL;
}

- (NSURL)shazamURL
{
  return self->_shazamURL;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)appleMusicID
{
  return self->_appleMusicID;
}

- (void)encodeWithCoder:(id)a3
{
  appleMusicID = self->_appleMusicID;
  id v5 = a3;
  [v5 encodeObject:appleMusicID forKey:@"appleMusicID"];
  [v5 encodeObject:self->_artist forKey:@"artist"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_artworkURL forKey:@"artworkURL"];
  [v5 encodeObject:self->_shazamURL forKey:@"shazamURL"];
  [v5 encodeObject:self->_appleMusicURL forKey:@"appleMusicURL"];
  [v5 encodeBool:self->_isExplicit forKey:@"isExplicit"];
  [v5 encodeObject:self->_videoURL forKey:@"videoURL"];
  [v5 encodeObject:self->_lyricsSnippet forKey:@"lyricsSnippet"];
  [v5 encodeObject:self->_lyricsSnippetSynced forKey:@"lyricsSnippetSynced"];
}

- (WFShazamMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFShazamMedia *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleMusicID"];
  appleMusicID = v5->_appleMusicID;
  v5->_appleMusicID = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artist"];
  artist = v5->_artist;
  v5->_artist = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURL"];
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = (NSURL *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shazamURL"];
  shazamURL = v5->_shazamURL;
  v5->_shazamURL = (NSURL *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleMusicURL"];
  appleMusicURL = v5->_appleMusicURL;
  v5->_appleMusicURL = (NSURL *)v16;

  v5->_isExplicit = [v4 decodeBoolForKey:@"isExplicit"];
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoURL"];
  videoURL = v5->_videoURL;
  v5->_videoURL = (NSURL *)v18;

  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lyricsSnippet"];
  lyricsSnippet = v5->_lyricsSnippet;
  v5->_lyricsSnippet = (NSString *)v20;

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lyricsSnippetSynced"];

  lyricsSnippetSynced = v5->_lyricsSnippetSynced;
  v5->_lyricsSnippetSynced = (NSString *)v22;

  return v5;
}

- (NSString)wfName
{
  artist = self->_artist;
  title = self->_title;
  if (title)
  {
    if (artist)
    {
      id v4 = [NSString stringWithFormat:@"%@ - %@", artist, title];
    }
    else
    {
      id v4 = title;
    }
  }
  else if (artist)
  {
    id v4 = artist;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFShazamMedia *)self wfName];
  v7 = (void *)v6;
  uint64_t v8 = @"match undefined";
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  v9 = [v3 stringWithFormat:@"<%@: %p, name: %@>", v5, self, v8];

  return v9;
}

- (WFShazamMedia)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WFShazamMedia;
  id v5 = [(WFShazamMedia *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 appleMusicID];
    uint64_t v7 = [v6 copy];
    appleMusicID = v5->_appleMusicID;
    v5->_appleMusicID = (NSString *)v7;

    v9 = [v4 artist];
    uint64_t v10 = [v9 copy];
    artist = v5->_artist;
    v5->_artist = (NSString *)v10;

    uint64_t v12 = [v4 title];
    uint64_t v13 = [v12 copy];
    title = v5->_title;
    v5->_title = (NSString *)v13;

    v15 = [v4 artworkURL];
    uint64_t v16 = [v15 copy];
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v16;

    uint64_t v18 = [v4 webURL];
    uint64_t v19 = [v18 copy];
    shazamURL = v5->_shazamURL;
    v5->_shazamURL = (NSURL *)v19;

    v21 = [v4 appleMusicURL];
    uint64_t v22 = [v21 copy];
    appleMusicURL = v5->_appleMusicURL;
    v5->_appleMusicURL = (NSURL *)v22;

    v5->_isExplicit = [v4 explicitContent];
    v24 = [v4 videoURL];
    uint64_t v25 = [v24 copy];
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v25;

    v27 = [v4 lyricsSnippet];
    uint64_t v28 = [v27 copy];
    lyricsSnippet = v5->_lyricsSnippet;
    v5->_lyricsSnippet = (NSString *)v28;

    id v30 = v4;
    if (v30)
    {
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2050000000;
      v31 = (void *)getSHMatchedMediaItemClass_softClass;
      uint64_t v45 = getSHMatchedMediaItemClass_softClass;
      if (!getSHMatchedMediaItemClass_softClass)
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __getSHMatchedMediaItemClass_block_invoke;
        v41[3] = &unk_264E5EC88;
        v41[4] = &v42;
        __getSHMatchedMediaItemClass_block_invoke((uint64_t)v41);
        v31 = (void *)v43[3];
      }
      id v32 = v31;
      _Block_object_dispose(&v42, 8);
      if (objc_opt_isKindOfClass()) {
        v33 = v30;
      }
      else {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
    id v34 = v33;

    v35 = [v34 syncedLyricsSnippet];

    uint64_t v36 = [v35 copy];
    lyricsSnippetSynced = v5->_lyricsSnippetSynced;
    v5->_lyricsSnippetSynced = (NSString *)v36;

    v38 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end