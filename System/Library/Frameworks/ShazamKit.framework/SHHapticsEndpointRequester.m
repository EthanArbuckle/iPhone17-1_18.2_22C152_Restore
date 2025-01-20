@interface SHHapticsEndpointRequester
- (BOOL)allowsCachedAssets;
- (SHHapticsEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4;
- (SHHapticsEndpointRequester)initWithNetworkRequester:(id)a3;
- (SHNetworkRecognitionRequester)endpointRequester;
- (id)cachedHapticsResponseForSongItem:(id)a3 representingMediaItem:(id)a4;
- (id)hapticSongItemFromResponse:(id)a3 songDuration:(double)a4 error:(id *)a5;
- (id)hapticsDownloadRequestFromDownloadURL:(id)a3;
- (id)updateMediaItem:(id)a3 withSongItem:(id)a4;
- (void)invalidate;
- (void)performHapticsTrackAvailabilityRequest:(id)a3 completionHandler:(id)a4;
- (void)performRequests:(id)a3 completionHandler:(id)a4;
- (void)setAllowsCachedAssets:(BOOL)a3;
@end

@implementation SHHapticsEndpointRequester

- (SHHapticsEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v6 = a3;
  v7 = [[SHAMSEndpointRequester alloc] initWithClientIdentifier:v6 clientType:a4];

  v8 = [(SHHapticsEndpointRequester *)self initWithNetworkRequester:v7];
  return v8;
}

- (SHHapticsEndpointRequester)initWithNetworkRequester:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHHapticsEndpointRequester;
  id v6 = [(SHHapticsEndpointRequester *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointRequester, a3);
    v7->_allowsCachedAssets = 0;
  }

  return v7;
}

- (void)performHapticsTrackAvailabilityRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [v6 urlRequest];
  BOOL v9 = v8 == 0;

  v10 = sh_log_object();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = [v6 mediaItem];
      v19 = [v18 properties];
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Cannot check if a haptic track is available. Media item: %@ does not have required Apple Music ID or ISRC", buf, 0xCu);
    }
    v20 = [v6 mediaItem];
    v21 = [v20 properties];
    v22 = +[NSString stringWithFormat:@"Failed to check if a haptic track is available for media item %@. Check that AdamID or ISRC is valid.", v21];

    NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
    v34 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v24 = +[SHError errorWithCode:600 underlyingError:0 keyOverrides:v23];

    v7[2](v7, 0, v24);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [v6 mediaItem];
      v13 = [v12 appleMusicID];
      v14 = [v6 mediaItem];
      v15 = [v14 isrc];
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetching haptic song attributes to check for haptics availability. AdamID:%@ <-> ISRC: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v16 = [(SHHapticsEndpointRequester *)self endpointRequester];
    v17 = [v6 urlRequest];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000BB44;
    v25[3] = &unk_100074F70;
    objc_copyWeak(&v28, (id *)buf);
    id v26 = v6;
    v27 = v7;
    [v16 performRequest:v17 withReply:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)performRequests:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  group = dispatch_group_create();
  v29 = v5;
  if (group)
  {
    queue = dispatch_queue_create("com.apple.ShazamKit.HapticEndpointRequester", 0);
    NSErrorUserInfoKey v33 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v5;
    id v35 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v35)
    {
      uint64_t v32 = *(void *)v51;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v51 != v32) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          BOOL v9 = [v7 urlRequest];
          BOOL v10 = v9 == 0;

          v11 = sh_log_object();
          v12 = v11;
          if (v10)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v19 = [v7 mediaItem];
              v20 = [v19 properties];
              *(_DWORD *)buf = 138412290;
              v55 = v20;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Haptics fetch request for media item: %@ does not have required Apple Music ID or ISRC", buf, 0xCu);
            }
            v21 = [v7 mediaItem];
            v22 = [v21 properties];
            v23 = +[NSString stringWithFormat:@"Failed to fetch haptics for media item %@. Check AdamID or ISRC is valid.", v22];

            NSErrorUserInfoKey v58 = NSDebugDescriptionErrorKey;
            v59 = v23;
            v24 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            v25 = +[SHError errorWithCode:600 underlyingError:0 keyOverrides:v24];

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000C3A4;
            block[3] = &unk_100074F98;
            id v47 = v33;
            v48 = v7;
            id v49 = v25;
            id v26 = v25;
            dispatch_sync(queue, block);
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v13 = [v7 mediaItem];
              v14 = [v13 appleMusicID];
              v15 = [v7 mediaItem];
              v16 = [v15 isrc];
              *(_DWORD *)buf = 138412546;
              v55 = v14;
              __int16 v56 = 2112;
              v57 = v16;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Fetching haptic song attributes. AdamID:%@ <-> ISRC: %@", buf, 0x16u);
            }
            dispatch_group_enter(group);
            objc_initWeak((id *)buf, self);
            v17 = [(SHHapticsEndpointRequester *)self endpointRequester];
            v18 = [v7 urlRequest];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_10000C454;
            v41[3] = &unk_100075060;
            objc_copyWeak(&v45, (id *)buf);
            v41[4] = v7;
            v42 = queue;
            id v43 = v33;
            v44 = group;
            [v17 performRequest:v18 withReply:v41];

            objc_destroyWeak(&v45);
            objc_destroyWeak((id *)buf);
          }
        }
        id v35 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v35);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000CC50;
    v38[3] = &unk_100075088;
    id v39 = v33;
    id v40 = v30;
    id v27 = v33;
    dispatch_group_notify(group, queue, v38);
  }
  else
  {
    id v28 = sh_log_object();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to create dispatch group for haptic fetch requests", buf, 2u);
    }

    NSErrorUserInfoKey v61 = NSDebugDescriptionErrorKey;
    CFStringRef v62 = @"Failed to start paginated network request";
    queue = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    id v27 = +[SHError errorWithCode:500 underlyingError:0 keyOverrides:queue];
    (*((void (**)(id, void, id))v30 + 2))(v30, 0, v27);
  }
}

- (id)hapticSongItemFromResponse:(id)a3 songDuration:(double)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [v7 data];

  if (v8)
  {
    BOOL v9 = [v7 data];
    BOOL v10 = +[SHServerGetResponseParser hapticSongItemFromServerData:v9 songDuration:a5 error:a4];
  }
  else
  {
    v11 = sh_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v7 error];
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No network response for haptics song attributes fetch. Error %@", (uint8_t *)&v17, 0xCu);
    }
    v13 = [v7 error];
    v14 = [v13 underlyingErrors];
    v15 = [v14 firstObject];
    +[SHError annotateClientError:a5 code:600 underlyingError:v15];

    BOOL v10 = 0;
  }

  return v10;
}

- (id)updateMediaItem:(id)a3 withSongItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 appleMusicID];
  if (v7)
  {

LABEL_3:
    id v8 = v5;
    goto LABEL_6;
  }
  BOOL v9 = [v6 appleMusicID];

  if (!v9) {
    goto LABEL_3;
  }
  BOOL v10 = [v5 properties];
  v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  v12 = [v6 appleMusicID];
  [v11 setObject:v12 forKeyedSubscript:SHMediaItemAppleMusicID];

  id v13 = [v11 copy];
  id v8 = +[SHMediaItem mediaItemWithProperties:v13];

LABEL_6:

  return v8;
}

- (id)hapticsDownloadRequestFromDownloadURL:(id)a3
{
  v3 = +[NSMutableURLRequest requestWithURL:a3];
  [v3 setHTTPMethod:@"GET"];
  [v3 setValue:@"x-apple-archive" forHTTPHeaderField:@"Accept-Encoding"];
  id v4 = [v3 copy];

  return v4;
}

- (id)cachedHapticsResponseForSongItem:(id)a3 representingMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 appleMusicID];
  if (v8 || ([v7 appleMusicID], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v9 = +[SHNetworkDownloadUtilities cachedFileURLWithFilename:v8 type:UTTypeAppleArchive];
    if (v9)
    {
      BOOL v10 = [[SHNetworkDownloadResponse alloc] initWithDownloadedFileLocation:v9 urlResponse:0 error:0];
      v11 = [SHHapticsEndpointResponse alloc];
      v12 = [(SHHapticsEndpointRequester *)self updateMediaItem:v7 withSongItem:v6];
      id v13 = [(SHHapticsEndpointResponse *)v11 initWithRequestMediaItem:v12 networkDownloadResponse:v10];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)invalidate
{
  id v2 = [(SHHapticsEndpointRequester *)self endpointRequester];
  [v2 invalidate];
}

- (SHNetworkRecognitionRequester)endpointRequester
{
  return self->_endpointRequester;
}

- (BOOL)allowsCachedAssets
{
  return self->_allowsCachedAssets;
}

- (void)setAllowsCachedAssets:(BOOL)a3
{
  self->_allowsCachedAssets = a3;
}

- (void).cxx_destruct
{
}

@end