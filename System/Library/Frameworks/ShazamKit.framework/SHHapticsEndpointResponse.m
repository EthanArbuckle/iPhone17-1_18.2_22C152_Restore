@interface SHHapticsEndpointResponse
- (NSArray)spatialOffsets;
- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 networkDownloadResponse:(id)a4;
- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 spatialOffsets:(id)a4 networkDownloadResponse:(id)a5;
- (SHMediaItem)mediaItem;
- (SHNetworkDownloadResponse)networkDownloadResponse;
@end

@implementation SHHapticsEndpointResponse

- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 spatialOffsets:(id)a4 networkDownloadResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHHapticsEndpointResponse;
  v12 = [(SHHapticsEndpointResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    objc_storeStrong((id *)&v13->_spatialOffsets, a4);
    objc_storeStrong((id *)&v13->_networkDownloadResponse, a5);
  }

  return v13;
}

- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 networkDownloadResponse:(id)a4
{
  return [(SHHapticsEndpointResponse *)self initWithRequestMediaItem:a3 spatialOffsets:&__NSArray0__struct networkDownloadResponse:a4];
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSArray)spatialOffsets
{
  return self->_spatialOffsets;
}

- (SHNetworkDownloadResponse)networkDownloadResponse
{
  return self->_networkDownloadResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkDownloadResponse, 0);
  objc_storeStrong((id *)&self->_spatialOffsets, 0);

  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end