@interface MRUNowPlayingQueueHandoffCoordinator
- (BOOL)hideArtwork;
- (CGSize)artworkSize;
- (MRNowPlayingPlayerResponse)response;
- (MRUNowPlayingQueueHandoffCoordinatorDelegate)delegate;
- (id)description;
- (id)stateDescription:(int64_t)a3;
- (int64_t)state;
- (void)beginTransition;
- (void)completeHandoff;
- (void)endTransition;
- (void)setArtworkSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setHideArtwork:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setupTransition;
@end

@implementation MRUNowPlayingQueueHandoffCoordinator

- (id)description
{
  v3 = NSStringFromCGSize(self->_artworkSize);
  v4 = [(MRUNowPlayingQueueHandoffCoordinator *)self stateDescription:self->_state];
  v5 = [NSString stringWithFormat:@"%@ state: %@ | artwork size: %@ | response: %@", objc_opt_class(), v4, v3, self->_response];

  return v5;
}

- (void)setResponse:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_response, a3);
  if (self->_state != 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained queueHandoffCoordinator:self didChangeResponse:v6];
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained queueHandoffCoordinator:self didChangeState:a3];
  }
}

- (void)setupTransition
{
}

- (void)beginTransition
{
}

- (void)endTransition
{
}

- (void)completeHandoff
{
}

- (id)stateDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Prepare";
  }
  else {
    return off_1E5F0E5E0[a3 - 1];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (MRNowPlayingPlayerResponse)response
{
  return self->_response;
}

- (BOOL)hideArtwork
{
  return self->_hideArtwork;
}

- (void)setHideArtwork:(BOOL)a3
{
  self->_hideArtwork = a3;
}

- (CGSize)artworkSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  self->_artworkSize = a3;
}

- (MRUNowPlayingQueueHandoffCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUNowPlayingQueueHandoffCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_response, 0);
}

@end