@interface SHServerMusicVideoResponse
- (NSDictionary)musicVideoDictionary;
- (SHServerMusicVideoResponse)initWithMusicVideoDictionary:(id)a3;
- (id)itemForIdentifiers:(id)a3;
- (void)setMusicVideoDictionary:(id)a3;
@end

@implementation SHServerMusicVideoResponse

- (SHServerMusicVideoResponse)initWithMusicVideoDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHServerMusicVideoResponse;
  v6 = [(SHServerMusicVideoResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_musicVideoDictionary, a3);
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
        v10 = [(SHServerMusicVideoResponse *)self musicVideoDictionary];
        v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          v13 = [SHMusicVideoResponseItem alloc];
          v14 = [(SHServerMusicVideoResponse *)self musicVideoDictionary];
          v15 = [v14 objectForKeyedSubscript:v9];
          v12 = [(SHMusicVideoResponseItem *)v13 initWithMusicVideoItemDictionary:v15];

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

- (NSDictionary)musicVideoDictionary
{
  return self->_musicVideoDictionary;
}

- (void)setMusicVideoDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end