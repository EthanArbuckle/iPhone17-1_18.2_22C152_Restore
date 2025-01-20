@interface SHServerGetResponseParser
+ (id)hapticSongItemFromResourcesResponse:(id)a3 hapticItemIDs:(id)a4 songDuration:(double)a5;
+ (id)hapticSongItemFromServerData:(id)a3 songDuration:(double)a4 error:(id *)a5;
+ (id)mediaDictionaryFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5;
+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5;
+ (id)mediaItemsFromServerData:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation SHServerGetResponseParser

+ (id)mediaItemsFromServerData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v42 = 0;
  v9 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v42];
  id v10 = v42;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:@"errors"];
    v12 = [v11 firstObject];

    if (v12)
    {
      v13 = [[SHServerErrorResponse alloc] initWithErrorDictionary:v12];
      v14 = [(SHServerErrorResponse *)v13 error];
      +[SHCoreError annotateError:a5 withError:v14];
      id v15 = 0;
    }
    else
    {
      v13 = [v9 objectForKeyedSubscript:@"data"];
      if (v13) {
        v14 = [[SHServerDataResponse alloc] initWithDataArray:v13];
      }
      else {
        v14 = 0;
      }
      v17 = [v9 objectForKeyedSubscript:@"resources"];
      if (v17)
      {
        v35 = v13;
        v32 = a5;
        id v36 = v10;
        v37 = v9;
        v33 = v17;
        v18 = [[SHServerResourcesResponse alloc] initWithResourcesDictionary:v17];
        v34 = v14;
        v19 = [(SHServerDataResponse *)v14 shazamIDs];
        v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v21 = v19;
        id v22 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v39;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v39 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              v27 = [v8 campaignToken];
              v28 = [a1 mediaItemFromResourcesResponse:v18 shazamID:v26 campaignToken:v27];

              [v20 addObject:v28];
            }
            id v23 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v23);
        }

        if ([v20 count])
        {
          id v15 = v20;
          v12 = 0;
          id v10 = v36;
        }
        else
        {
          v30 = sh_log_object();
          v12 = 0;
          id v10 = v36;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Server response parser: has no media items", buf, 2u);
          }

          +[SHError annotateClientError:v32 code:202 underlyingError:0];
          id v15 = 0;
        }

        v9 = v37;
        v14 = v34;
        v13 = v35;
        v17 = v33;
      }
      else
      {
        v29 = sh_log_object();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Server response parser: has no match", buf, 2u);
        }

        +[SHError annotateClientError:a5 code:202 underlyingError:0];
        id v15 = 0;
      }
    }
  }
  else
  {
    v16 = sh_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Server response parser: No response %@", buf, 0xCu);
    }

    +[SHError annotateClientError:a5 code:202 underlyingError:v10];
    id v15 = 0;
  }

  return v15;
}

+ (id)hapticSongItemFromServerData:(id)a3 songDuration:(double)a4 error:(id *)a5
{
  id v22 = 0;
  v7 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v22];
  id v8 = v22;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"errors"];
    id v10 = [v9 firstObject];

    if (v10)
    {
      v11 = [[SHServerErrorResponse alloc] initWithErrorDictionary:v10];
      v12 = [(SHServerErrorResponse *)v11 error];
      +[SHCoreError annotateError:a5 withError:v12];
      v13 = 0;
    }
    else
    {
      v11 = [v7 objectForKeyedSubscript:@"data"];
      if (v11) {
        v12 = [[SHServerDataResponse alloc] initWithDataArray:v11];
      }
      else {
        v12 = 0;
      }
      id v15 = [v7 objectForKeyedSubscript:@"resources"];
      if (v15)
      {
        v16 = [[SHServerResourcesResponse alloc] initWithResourcesDictionary:v15];
        v17 = [(SHServerDataResponse *)v12 hapticItemIDs];
        v13 = [(id)objc_opt_class() hapticSongItemFromResourcesResponse:v16 hapticItemIDs:v17 songDuration:a4];
        v18 = [v13 hapticsURL];

        if (!v18)
        {
          v19 = sh_log_object();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Server response parser: has no song haptic items", buf, 2u);
          }
        }
      }
      else
      {
        v20 = sh_log_object();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Server response parser: has no song haptic resources", buf, 2u);
        }

        +[SHError annotateClientError:a5 code:600 underlyingError:0];
        v13 = 0;
      }
    }
  }
  else
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Server response parser: No response %@", buf, 0xCu);
    }

    +[SHError annotateClientError:a5 code:600 underlyingError:v8];
    v13 = 0;
  }

  return v13;
}

+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SHServerGetResponseParser mediaDictionaryFromResourcesResponse:v9 shazamID:v8 campaignToken:v7];
  v11 = +[SHMediaItem mediaItemWithProperties:v10];
  v12 = [v9 shazamResponse];
  v13 = [v12 itemForIdentifier:v8];

  v14 = [v9 songsResponse];

  id v15 = [v13 songRelationIDs];
  v16 = [v14 itemForIdentifiers:v15];

  v17 = [v16 rawResponseWithCampaignToken:v7];

  objc_msgSend(v11, "set_rawResponseSongs:", v17);

  return v11;
}

+ (id)hapticSongItemFromResourcesResponse:(id)a3 hapticItemIDs:(id)a4 songDuration:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v42 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Converting duration of %f from seconds to milliseconds", buf, 0xCu);
  }

  double v10 = fmax(a5 * 1000.0, 0.0);
  v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Parsing song using new duration %fms", buf, 0xCu);
  }

  if ([v8 count] == (id)1)
  {
    v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Only one song item in response, returning its haptics url.", buf, 2u);
    }

    id v13 = [v7 songsResponse];
    v14 = [v8 firstObject];
    v47 = v14;
    id v15 = +[NSArray arrayWithObjects:&v47 count:1];
    v16 = [v13 itemForIdentifiers:v15];
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v8;
    id v17 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v17)
    {
      id v18 = v17;
      id v36 = v8;
      v16 = 0;
      uint64_t v19 = *(void *)v38;
      double v20 = 1.79769313e308;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          id v23 = [v7 songsResponse];
          uint64_t v45 = v22;
          id v24 = +[NSArray arrayWithObjects:&v45 count:1];
          v25 = [v23 itemForIdentifiers:v24];

          uint64_t v26 = [v25 durationInMilliseconds];
          [v26 doubleValue];
          double v28 = vabdd_f64(v10, v27);

          if (v28 < v20)
          {
            v29 = [v25 hapticsURL];

            if (v29)
            {
              v30 = sh_log_object();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v31 = [v25 hapticsURL];
                *(_DWORD *)buf = 134218242;
                double v42 = v28;
                __int16 v43 = 2112;
                v44 = v31;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "New difference %f is smaller than existing difference, setting hapticsURL to: %@", buf, 0x16u);
              }
              id v32 = v25;

              v16 = v32;
            }
          }
          v33 = [v25 hapticsURL];

          if (v33)
          {
            v34 = sh_log_object();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Song item has haptics url, setting new minimum difference", buf, 2u);
            }

            double v20 = fmin(v20, v28);
          }
        }
        id v18 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v18);
      id v8 = v36;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (id)mediaDictionaryFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  double v10 = +[NSMutableDictionary dictionary];
  v11 = [v7 shazamResponse];
  v12 = [v11 itemForIdentifier:v9];

  id v13 = [v12 shazamID];
  [v10 setValue:v13 forKey:SHMediaItemShazamID];

  v14 = [v12 shazamURL];
  [v10 setValue:v14 forKey:SHMediaItemWebURL];

  id v15 = [v12 title];
  [v10 setValue:v15 forKey:SHMediaItemTitle];

  v16 = [v12 artistName];
  [v10 setValue:v16 forKey:SHMediaItemSubtitle];

  id v17 = [v12 artistName];
  [v10 setValue:v17 forKey:SHMediaItemArtist];

  id v18 = [v12 shazamCount];
  [v10 setValue:v18 forKey:SHMediaItemShazamCount];

  uint64_t v19 = [v12 songRelationIDs];
  id v20 = [v19 count];

  if (v20)
  {
    id v21 = [v7 songsResponse];
    uint64_t v22 = [v12 songRelationIDs];
    id v23 = [v21 itemForIdentifiers:v22];

    id v24 = [v23 appleMusicID];
    [v10 setValue:v24 forKey:SHMediaItemAppleMusicID];

    v25 = [v23 artworkURL];
    SHMediaItemProperty v26 = SHMediaItemArtworkURL;
    [v10 setValue:v25 forKey:SHMediaItemArtworkURL];

    double v27 = [v23 genreNames];
    [v10 setValue:v27 forKey:SHMediaItemGenres];

    double v28 = [v23 releaseDate];
    [v10 setValue:v28 forKey:SHMediaItemReleaseDate];

    v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 isExplicitContent]);
    [v10 setValue:v29 forKey:SHMediaItemExplicitContent];

    v30 = [v23 albumName];
    [v10 setValue:v30 forKey:SHMediaItemAlbumName];

    v31 = [v23 isrc];
    [v10 setValue:v31 forKey:SHMediaItemISRC];

    id v32 = [v23 appleMusicURLString];

    if (v32)
    {
      id v33 = objc_alloc((Class)SHTokenizedURL);
      v34 = [v23 appleMusicURLString];
      id v35 = [v33 initWithString:v34];

      if ([v35 containsTokens]) {
        [v35 updateToken:5 withValue:v8];
      }
      id v36 = [v35 URLRepresentation];
      [v10 setValue:v36 forKey:SHMediaItemAppleMusicURL];
    }
    long long v37 = [v23 lyricsRelationIDs];
    id v38 = [v37 count];

    if (v38)
    {
      long long v39 = [v7 lyricsResponse];
      long long v40 = [v23 lyricsRelationIDs];
      long long v41 = [v39 itemForIdentifiers:v40];

      double v42 = [v41 lyricsSnippet];
      [v10 setValue:v42 forKey:SHMediaItemLyricsSnippet];

      __int16 v43 = [v41 staticLyrics];
      [v10 setValue:v43 forKey:SHMediaItemStaticLyricLines];
    }
    v44 = [v23 musicVideoRelationIDs];
    id v45 = [v44 count];

    if (v45)
    {
      v46 = [v7 musicVideoResponse];
      v47 = [v23 musicVideoRelationIDs];
      v48 = [v46 itemForIdentifiers:v47];

      v49 = [v48 url];
      [v10 setValue:v49 forKey:SHMediaItemVideoURL];
    }
  }
  else
  {
    SHMediaItemProperty v26 = SHMediaItemArtworkURL;
  }
  v50 = [v10 objectForKeyedSubscript:v26];

  if (!v50)
  {
    v51 = [v12 artworkURL];
    [v10 setValue:v51 forKey:v26];
  }
  id v52 = [v10 copy];

  return v52;
}

@end