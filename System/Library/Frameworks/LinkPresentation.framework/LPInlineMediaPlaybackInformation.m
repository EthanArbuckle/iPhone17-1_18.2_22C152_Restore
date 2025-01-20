@interface LPInlineMediaPlaybackInformation
+ (id)_inlineiTunesMediaPlaybackInformationWithType:(unint64_t)a3 storeIdentifier:(id)a4 storefrontIdentifier:(id)a5 offers:(id)a6 previewURL:(id)a7 lyricExcerpt:(id)a8;
+ (id)albumPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5;
+ (id)audioBookPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 previewURL:(id)a5 persistentIdentifier:(id)a6;
+ (id)audioFilePlaybackInformationWithAudio:(id)a3;
+ (id)playlistPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4;
+ (id)podcastEpisodePlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5;
+ (id)podcastPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5;
+ (id)radioPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4;
+ (id)songPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5 previewURL:(id)a6 lyricExcerpt:(id)a7;
- (BOOL)isAvailableForAnonymousDownload;
- (LPAudio)audio;
- (LPLyricExcerptMetadata)lyricExcerpt;
- (NSArray)offers;
- (NSString)persistentIdentifier;
- (NSString)storeIdentifier;
- (NSString)storefrontIdentifier;
- (NSURL)previewURL;
- (unint64_t)availability;
- (unint64_t)type;
@end

@implementation LPInlineMediaPlaybackInformation

+ (id)_inlineiTunesMediaPlaybackInformationWithType:(unint64_t)a3 storeIdentifier:(id)a4 storefrontIdentifier:(id)a5 offers:(id)a6 previewURL:(id)a7 lyricExcerpt:(id)a8
{
  unint64_t v14 = (unint64_t)a4;
  id v20 = a5;
  id v19 = a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a8;
  if (v14 | v15)
  {
    v17 = objc_alloc_init(LPInlineMediaPlaybackInformation);
    v17->_type = a3;
    objc_storeStrong((id *)&v17->_storeIdentifier, a4);
    objc_storeStrong((id *)&v17->_storefrontIdentifier, a5);
    objc_storeStrong((id *)&v17->_offers, a6);
    objc_storeStrong((id *)&v17->_previewURL, a7);
    objc_storeStrong((id *)&v17->_lyricExcerpt, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)songPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5 previewURL:(id)a6 lyricExcerpt:(id)a7
{
  v7 = [a1 _inlineiTunesMediaPlaybackInformationWithType:0 storeIdentifier:a3 storefrontIdentifier:a4 offers:a5 previewURL:a6 lyricExcerpt:a7];

  return v7;
}

+ (id)albumPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  v5 = [a1 _inlineiTunesMediaPlaybackInformationWithType:1 storeIdentifier:a3 storefrontIdentifier:a4 offers:a5 previewURL:0 lyricExcerpt:0];

  return v5;
}

+ (id)radioPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4
{
  v4 = [a1 _inlineiTunesMediaPlaybackInformationWithType:2 storeIdentifier:a3 storefrontIdentifier:a4 offers:0 previewURL:0 lyricExcerpt:0];

  return v4;
}

+ (id)podcastPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  v5 = [a1 _inlineiTunesMediaPlaybackInformationWithType:3 storeIdentifier:a3 storefrontIdentifier:a4 offers:a5 previewURL:0 lyricExcerpt:0];

  return v5;
}

+ (id)podcastEpisodePlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  v5 = [a1 _inlineiTunesMediaPlaybackInformationWithType:4 storeIdentifier:a3 storefrontIdentifier:a4 offers:a5 previewURL:0 lyricExcerpt:0];

  return v5;
}

+ (id)playlistPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4
{
  v4 = [a1 _inlineiTunesMediaPlaybackInformationWithType:5 storeIdentifier:a3 storefrontIdentifier:a4 offers:0 previewURL:0 lyricExcerpt:0];

  return v4;
}

+ (id)audioBookPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 previewURL:(id)a5 persistentIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (unint64_t)a5;
  unint64_t v13 = (unint64_t)a6;
  if (v12 | v13)
  {
    unint64_t v14 = objc_alloc_init(LPInlineMediaPlaybackInformation);
    v14->_type = 6;
    objc_storeStrong((id *)&v14->_storeIdentifier, a3);
    objc_storeStrong((id *)&v14->_storefrontIdentifier, a4);
    objc_storeStrong((id *)&v14->_previewURL, a5);
    objc_storeStrong((id *)&v14->_persistentIdentifier, a6);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

+ (id)audioFilePlaybackInformationWithAudio:(id)a3
{
  v3 = (LPAudio *)a3;
  v4 = objc_alloc_init(LPInlineMediaPlaybackInformation);
  v4->_type = 7;
  audio = v4->_audio;
  v4->_audio = v3;

  return v4;
}

- (unint64_t)availability
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  offers = self->_offers;
  if (!offers || ![(NSArray *)offers count]) {
    return 3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_offers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5)
  {

    return 3;
  }
  char v6 = 0;
  int v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (objc_msgSend(v10, "isEqualToString:", @"buy", (void)v13)) {
        char v6 = 1;
      }
      else {
        v7 |= [v10 isEqualToString:@"subscription"];
      }
    }
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v5);

  unint64_t v11 = 2;
  if ((v6 & 1) == 0) {
    unint64_t v11 = 3;
  }
  if (v7) {
    unint64_t v11 = 0;
  }
  if (v7 & v6) {
    return 1;
  }
  else {
    return v11;
  }
}

- (BOOL)isAvailableForAnonymousDownload
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_offers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isEqualToString:", @"anonymousDownload", (void)v8))
        {
          BOOL v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSArray)offers
{
  return self->_offers;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (LPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);

  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end