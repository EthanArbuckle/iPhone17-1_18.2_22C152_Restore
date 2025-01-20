@interface SHLyricsResponseItem
- (MSVLyricsSongInfo)songInfo;
- (NSArray)lyricLines;
- (NSArray)songwriters;
- (NSArray)staticLyrics;
- (NSString)lyricsSnippet;
- (SHLyricsResponseItem)initWithLyricsItemDictionary:(id)a3;
- (id)snippetFromOffset:(double)a3;
- (void)parseTTMLFromLyricsItemDictionary:(id)a3;
- (void)setSongInfo:(id)a3;
@end

@implementation SHLyricsResponseItem

- (SHLyricsResponseItem)initWithLyricsItemDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHLyricsResponseItem;
  v5 = [(SHLyricsResponseItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SHLyricsResponseItem *)v5 parseTTMLFromLyricsItemDictionary:v4];
  }

  return v6;
}

- (NSArray)lyricLines
{
  v3 = [(SHLyricsResponseItem *)self songInfo];
  id v4 = [v3 lyricsLines];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(SHLyricsResponseItem *)self songInfo];
  v7 = [v6 lyricsLines];

  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 lyricsText];
        v14 = [v13 string];
        [v12 startTime];
        v15 = +[SHLyricLine lyricLineWithText:offset:](SHLyricLine, "lyricLineWithText:offset:", v14);
        [v5 addObject:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v16 = [v5 copy];

  return (NSArray *)v16;
}

- (NSString)lyricsSnippet
{
  return (NSString *)[(SHLyricsResponseItem *)self snippetFromOffset:0.0];
}

- (NSArray)staticLyrics
{
  v3 = [(SHLyricsResponseItem *)self songInfo];
  id v4 = [v3 lyricsLines];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(SHLyricsResponseItem *)self songInfo];
  v7 = [v6 lyricsLines];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) lyricsText];
        v13 = [v12 string];
        [v5 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [v5 copy];

  return (NSArray *)v14;
}

- (NSArray)songwriters
{
  v3 = [(SHLyricsResponseItem *)self songInfo];
  id v4 = [v3 songwriters];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(SHLyricsResponseItem *)self songInfo];
  v7 = [v6 songwriters];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) name];
        [v5 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v5 copy];

  return (NSArray *)v13;
}

- (void)parseTTMLFromLyricsItemDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"ttml"];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ttml"];
    v7 = [v6 dataUsingEncoding:4];

    id v8 = [objc_alloc((Class)MSVLyricsTTMLParser) initWithTTMLData:v7];
    id v13 = 0;
    id v9 = [v8 parseWithError:&v13];
    id v10 = v13;
    songInfo = self->_songInfo;
    self->_songInfo = v9;

    if (v10)
    {
      v12 = sh_log_object();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to parse lyrics song info %@", buf, 0xCu);
      }
    }
  }
}

- (id)snippetFromOffset:(double)a3
{
  v5 = [(SHLyricsResponseItem *)self songInfo];
  v6 = [v5 lyricsLineStartingBeforeTimeOffset:a3];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableString);
  }
  else
  {
    id v8 = [(SHLyricsResponseItem *)self songInfo];
    id v9 = [v8 lyricsLines];
    v6 = [v9 firstObject];

    id v7 = objc_alloc_init((Class)NSMutableString);
    if (!v6) {
      goto LABEL_7;
    }
  }
  do
  {
    id v10 = (char *)[v7 length];
    v11 = [v6 lyricsText];
    v12 = &v10[(void)[v11 length]];

    if ((unint64_t)v12 > 0x95) {
      break;
    }
    id v13 = [v6 lyricsText];
    id v14 = [v13 string];
    id v15 = +[NSString stringWithFormat:@"%@\n", v14];
    [v7 appendString:v15];

    uint64_t v16 = [v6 nextLine];

    v6 = (void *)v16;
  }
  while (v16);

LABEL_7:
  long long v17 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  long long v18 = [v7 stringByTrimmingCharactersInSet:v17];
  id v19 = [v18 copy];

  return v19;
}

- (MSVLyricsSongInfo)songInfo
{
  return self->_songInfo;
}

- (void)setSongInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end