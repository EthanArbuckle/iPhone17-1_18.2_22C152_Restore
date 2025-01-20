@interface SHHapticsEndpointRequest
- (BOOL)hasRequestAppleMusicID;
- (BOOL)hasRequestISRC;
- (NSURLRequest)urlRequest;
- (SHHapticsEndpoint)hapticsEndpoint;
- (SHHapticsEndpointRequest)initWithRequestMediaItem:(id)a3 hapticsEndpoint:(id)a4;
- (SHMediaItem)mediaItem;
- (id)constructURLRequest;
@end

@implementation SHHapticsEndpointRequest

- (SHHapticsEndpointRequest)initWithRequestMediaItem:(id)a3 hapticsEndpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHHapticsEndpointRequest;
  v9 = [(SHHapticsEndpointRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_hapticsEndpoint, a4);
    uint64_t v11 = [(SHHapticsEndpointRequest *)v10 constructURLRequest];
    urlRequest = v10->_urlRequest;
    v10->_urlRequest = (NSURLRequest *)v11;
  }
  return v10;
}

- (id)constructURLRequest
{
  v3 = [(SHHapticsEndpointRequest *)self hapticsEndpoint];
  v4 = [v3 adamIDURL];

  v5 = [(SHHapticsEndpointRequest *)self hapticsEndpoint];
  v6 = [v5 isrcURL];

  if ([(SHHapticsEndpointRequest *)self hasRequestAppleMusicID] && v4)
  {
    [v4 updateToken:11 withValue:@"songs"];
    id v7 = [(SHHapticsEndpointRequest *)self mediaItem];
    id v8 = [v7 appleMusicID];
    [v4 updateToken:12 withValue:v8];
    v9 = v4;
  }
  else
  {
    if (![(SHHapticsEndpointRequest *)self hasRequestISRC] || !v6)
    {
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_super v14 = [v4 URLRepresentation];
        v15 = [v6 URLRepresentation];
        int v19 = 138412546;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Haptics endpoints: AdamID:%@, ISRC: %@", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v11 = sh_log_object();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(SHHapticsEndpointRequest *)self mediaItem];
        v17 = [v16 properties];
        int v19 = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Did not find apple music ID or ISRC from media item: %@ to create haptics endpoint request.", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_15;
    }
    [v6 updateToken:11 withValue:@"isrc"];
    id v7 = [(SHHapticsEndpointRequest *)self mediaItem];
    id v8 = [v7 isrc];
    [v6 updateToken:12 withValue:v8];
    v9 = v6;
  }

  uint64_t v10 = [v9 URLRepresentation];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = +[NSURLRequest requestWithURL:v10];
    goto LABEL_16;
  }
  uint64_t v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Haptics request URL could not be constructed.", (uint8_t *)&v19, 2u);
  }
LABEL_15:
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)hasRequestAppleMusicID
{
  v2 = [(SHHapticsEndpointRequest *)self mediaItem];
  v3 = [v2 appleMusicID];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)hasRequestISRC
{
  v2 = [(SHHapticsEndpointRequest *)self mediaItem];
  v3 = [v2 isrc];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (SHHapticsEndpoint)hapticsEndpoint
{
  return self->_hapticsEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticsEndpoint, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);

  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end