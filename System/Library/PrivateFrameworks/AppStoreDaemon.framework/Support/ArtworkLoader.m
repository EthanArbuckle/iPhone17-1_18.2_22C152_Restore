@interface ArtworkLoader
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
@end

@implementation ArtworkLoader

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if ([(NSURLSession *)v7->_enforcedSession isEqual:v10])
  {
    enforcedSession = v7->_enforcedSession;
    v7->_enforcedSession = 0;
  }
  if ([(NSURLSession *)v7->_unenforcedSession isEqual:v10])
  {
    unenforcedSession = v7->_unenforcedSession;
    v7->_unenforcedSession = 0;
  }
  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_unenforcedSession, 0);
  objc_storeStrong((id *)&self->_enforcedSession, 0);
}

@end