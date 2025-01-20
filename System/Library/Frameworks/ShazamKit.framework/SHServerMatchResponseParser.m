@interface SHServerMatchResponseParser
+ (id)matcherResponseFromServerData:(id)a3 signature:(id)a4 location:(id)a5 context:(id)a6;
+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 signatureStartDate:(id)a5 campaignToken:(id)a6 location:(id)a7;
@end

@implementation SHServerMatchResponseParser

+ (id)matcherResponseFromServerData:(id)a3 signature:(id)a4 location:(id)a5 context:(id)a6
{
  id v10 = a4;
  id v90 = a5;
  id v91 = a6;
  id v96 = 0;
  v11 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v96];
  id v12 = v96;
  if (v11)
  {
    v13 = [v11 objectForKeyedSubscript:@"errors"];
    v14 = [v13 firstObject];

    if (v14) {
      v15 = [[SHServerErrorResponse alloc] initWithErrorDictionary:v14];
    }
    else {
      v15 = 0;
    }
    v18 = [v11 objectForKeyedSubscript:@"results"];
    if (v18)
    {
      v19 = [[SHServerResultsResponse alloc] initWithResultsDictionary:v18];
      if (v19) {
        goto LABEL_16;
      }
    }
    else
    {
      v19 = 0;
    }
    if (v15)
    {
      v20 = sh_log_object();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [(SHServerErrorResponse *)v15 error];
        *(_DWORD *)buf = 138412290;
        id v99 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Server response parser: Error, %@", buf, 0xCu);
      }
      id v22 = objc_alloc((Class)SHMatcherResponse);
      [v91 defaultRecordingIntermissionInSeconds];
      double v24 = v23;
      [v91 defaultRecordingSignatureOffsetInSeconds];
      double v26 = v25;
      v27 = [(SHServerErrorResponse *)v15 error];
      double v28 = 0.0;
      v29 = v22;
      double v30 = v24;
      double v31 = v26;
      goto LABEL_21;
    }
LABEL_16:
    if (!v19 || !v15)
    {
      v27 = [v11 objectForKeyedSubscript:@"resources"];
      v45 = sh_log_object();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        [(SHServerResultsResponse *)v19 recordingIntermissionSeconds];
        v47 = v46;
        [(SHServerResultsResponse *)v19 retrySeconds];
        *(_DWORD *)buf = 134218240;
        id v99 = v47;
        __int16 v100 = 2048;
        uint64_t v101 = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Server response parser: Returning results, recording intermission %f, retry %f", buf, 0x16u);
      }

      if (v27)
      {
        v84 = v18;
        v85 = v15;
        v86 = v14;
        id v87 = v12;
        v88 = v11;
        v49 = v27;
        v50 = v19;
        v51 = v10;
        v82 = v49;
        v52 = [[SHServerResourcesResponse alloc] initWithResourcesDictionary:v49];
        v83 = v50;
        v53 = [(SHServerResultsResponse *)v50 shazamIDs];
        v54 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v53 count]);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id obj = v53;
        id v55 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v93;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(void *)v93 != v57) {
                objc_enumerationMutation(obj);
              }
              uint64_t v59 = *(void *)(*((void *)&v92 + 1) + 8 * i);
              v60 = [v51 audioStartDate];
              v61 = [v91 campaignToken];
              v62 = [a1 mediaItemFromResourcesResponse:v52 shazamID:v59 signatureStartDate:v60 campaignToken:v61 location:v90];

              [v54 addObject:v62];
            }
            id v56 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
          }
          while (v56);
        }

        if ([v54 count])
        {
          id v10 = v51;
          id v63 = [objc_alloc((Class)SHMatch) initWithMediaItems:v54 forSignature:v51];
          v64 = sh_log_object();
          id v12 = v87;
          v18 = v84;
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v99 = v63;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Server response parser: has match %@", buf, 0xCu);
          }

          v19 = v83;
          [(SHServerResultsResponse *)v83 recordingIntermissionSeconds];
          double v66 = v65;
          [(SHServerResultsResponse *)v83 recordingSignatureOffsetSeconds];
          double v68 = v67;
          [(SHServerResultsResponse *)v83 retrySeconds];
          v17 = +[SHMatcherResponse matchWithRecordingIntermission:v63 recordingSignatureOffset:v66 retrySeconds:v68 match:v69];
        }
        else
        {
          v76 = sh_log_object();
          id v10 = v51;
          id v12 = v87;
          v18 = v84;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Server response parser: has no match", buf, 2u);
          }

          v19 = v83;
          [(SHServerResultsResponse *)v83 recordingIntermissionSeconds];
          double v78 = v77;
          [(SHServerResultsResponse *)v83 recordingSignatureOffsetSeconds];
          double v80 = v79;
          [(SHServerResultsResponse *)v83 retrySeconds];
          v17 = +[SHMatcherResponse noMatchWithRecordingIntermission:v10 recordingSignatureOffset:v78 retrySeconds:v80 signature:v81];
        }
        v11 = v88;

        v15 = v85;
        v14 = v86;
        v27 = v82;
        goto LABEL_23;
      }
      v70 = sh_log_object();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Server response parser: has no match", buf, 2u);
      }

      [(SHServerResultsResponse *)v19 recordingIntermissionSeconds];
      double v72 = v71;
      [(SHServerResultsResponse *)v19 recordingSignatureOffsetSeconds];
      double v74 = v73;
      [(SHServerResultsResponse *)v19 retrySeconds];
      id v43 = +[SHMatcherResponse noMatchWithRecordingIntermission:v10 recordingSignatureOffset:v72 retrySeconds:v74 signature:v75];
LABEL_22:
      v17 = v43;
LABEL_23:

      goto LABEL_24;
    }
    v32 = sh_log_object();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      [(SHServerResultsResponse *)v19 recordingIntermissionSeconds];
      v34 = v33;
      [(SHServerResultsResponse *)v19 retrySeconds];
      *(_DWORD *)buf = 134218240;
      id v99 = v34;
      __int16 v100 = 2048;
      uint64_t v101 = v35;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Server response parser: Error, returning results, recording intermission %f, retry %f", buf, 0x16u);
    }

    id v36 = objc_alloc((Class)SHMatcherResponse);
    [(SHServerResultsResponse *)v19 recordingIntermissionSeconds];
    double v38 = v37;
    [(SHServerResultsResponse *)v19 recordingSignatureOffsetSeconds];
    double v40 = v39;
    [(SHServerResultsResponse *)v19 retrySeconds];
    double v42 = v41;
    v27 = [(SHServerErrorResponse *)v15 error];
    v29 = v36;
    double v30 = v38;
    double v31 = v40;
    double v28 = v42;
LABEL_21:
    id v43 = [v29 initWithRecordingIntermission:0 recordingSignatureOffset:v10 retrySeconds:0 match:v27 signature:v30 runningAssociatedRequestID:v31 error:v28];
    goto LABEL_22;
  }
  v16 = sh_log_object();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v99 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Server response parser: No response %@", buf, 0xCu);
  }

  v14 = +[SHError errorWithCode:202 underlyingError:v12];
  v17 = +[SHMatcherResponse errorResponseForSignature:v10 error:v14];
LABEL_24:

  return v17;
}

+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 signatureStartDate:(id)a5 campaignToken:(id)a6 location:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = +[SHServerGetResponseParser mediaDictionaryFromResourcesResponse:v11 shazamID:v15 campaignToken:v14];
  id v17 = [v16 mutableCopy];

  v18 = [v11 shazamResponse];
  v19 = [v18 itemForIdentifier:v15];

  v20 = [v19 matchOffset];
  [v17 setValue:v20 forKey:SHMediaItemMatchOffset];

  v21 = [v19 speedSkew];
  [v17 setValue:v21 forKey:SHMediaItemSpeedSkew];

  id v22 = [v19 frequencySkew];
  [v17 setValue:v22 forKey:SHMediaItemFrequencySkew];

  [v17 setValue:v12 forKey:SHMediaItemAudioStartDate];
  [v17 setValue:v13 forKey:SHMediaItemMatchLocation];

  double v23 = [v19 songRelationIDs];
  id v24 = [v23 count];

  if (v24)
  {
    double v25 = [v11 songsResponse];
    double v26 = [v19 songRelationIDs];
    v27 = [v25 itemForIdentifiers:v26];

    double v28 = [v27 lyricsRelationIDs];
    id v29 = [v28 count];

    if (v29)
    {
      double v30 = [v11 lyricsResponse];
      double v31 = [v27 lyricsRelationIDs];
      v32 = [v30 itemForIdentifiers:v31];

      v33 = [v19 matchOffset];
      [v33 doubleValue];
      v34 = objc_msgSend(v32, "snippetFromOffset:");
      [v17 setValue:v34 forKey:SHMediaItemSyncedLyricsSnippet];

      uint64_t v35 = [v19 matchOffset];
      [v35 doubleValue];
      double v37 = [v12 dateByAddingTimeInterval:-v36];

      id v38 = objc_alloc((Class)SHSyncedLyrics);
      v49 = v32;
      [v32 lyricLines];
      id v39 = v11;
      id v40 = v14;
      v42 = id v41 = v12;
      id v43 = [v32 songwriters];
      id v29 = [v38 initWithLyricsStartDate:v37 lines:v42 songwriters:v43];

      id v12 = v41;
      id v14 = v40;
      id v11 = v39;
    }
  }
  else
  {
    id v29 = 0;
    v27 = 0;
  }
  id v44 = objc_alloc((Class)SHMatchedMediaItem);
  id v45 = [v17 copy];
  id v46 = [v44 initWithMatchedMediaItemDictionary:v45 syncedLyrics:v29];

  v47 = [v27 rawResponseWithCampaignToken:v14];

  objc_msgSend(v46, "set_rawResponseSongs:", v47);

  return v46;
}

@end