@interface SHServerLyricsResponse
- (NSDictionary)lyricsDictionary;
- (SHServerLyricsResponse)initWithLyricsDictionary:(id)a3;
- (id)itemForIdentifiers:(id)a3;
- (void)setLyricsDictionary:(id)a3;
@end

@implementation SHServerLyricsResponse

- (SHServerLyricsResponse)initWithLyricsDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHServerLyricsResponse;
  v6 = [(SHServerLyricsResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lyricsDictionary, a3);
  }

  return v7;
}

- (id)itemForIdentifiers:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(SHServerLyricsResponse *)self lyricsDictionary];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          v13 = [SHLyricsResponseItem alloc];
          v14 = [(SHServerLyricsResponse *)self lyricsDictionary];
          v15 = [v14 objectForKeyedSubscript:v9];
          v12 = [(SHLyricsResponseItem *)v13 initWithLyricsItemDictionary:v15];

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (NSDictionary)lyricsDictionary
{
  return self->_lyricsDictionary;
}

- (void)setLyricsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end