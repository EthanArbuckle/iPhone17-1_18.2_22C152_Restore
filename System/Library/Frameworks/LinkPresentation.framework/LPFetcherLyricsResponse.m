@interface LPFetcherLyricsResponse
- (LPFetcherLyricsResponse)initWithLyrics:(id)a3 fetcher:(id)a4;
- (LPLyricExcerptMetadata)lyrics;
@end

@implementation LPFetcherLyricsResponse

- (LPFetcherLyricsResponse)initWithLyrics:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherLyricsResponse;
  v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lyrics, a3);
    v10 = v9;
  }

  return v9;
}

- (LPLyricExcerptMetadata)lyrics
{
  return self->_lyrics;
}

- (void).cxx_destruct
{
}

@end