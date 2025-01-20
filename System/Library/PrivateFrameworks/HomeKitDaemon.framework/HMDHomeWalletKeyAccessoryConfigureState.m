@interface HMDHomeWalletKeyAccessoryConfigureState
- (BOOL)readerKeyConfigureInProgress;
- (BOOL)readerKeyConfigured;
- (BOOL)shouldRetryReaderKeyConfigureOnFailure;
- (void)setReaderKeyConfigureInProgress:(BOOL)a3;
- (void)setReaderKeyConfigured:(BOOL)a3;
- (void)setShouldRetryReaderKeyConfigureOnFailure:(BOOL)a3;
@end

@implementation HMDHomeWalletKeyAccessoryConfigureState

- (void)setShouldRetryReaderKeyConfigureOnFailure:(BOOL)a3
{
  self->_shouldRetryReaderKeyConfigureOnFailure = a3;
}

- (BOOL)shouldRetryReaderKeyConfigureOnFailure
{
  return self->_shouldRetryReaderKeyConfigureOnFailure;
}

- (void)setReaderKeyConfigured:(BOOL)a3
{
  self->_readerKeyConfigured = a3;
}

- (BOOL)readerKeyConfigured
{
  return self->_readerKeyConfigured;
}

- (void)setReaderKeyConfigureInProgress:(BOOL)a3
{
  self->_readerKeyConfigureInProgress = a3;
}

- (BOOL)readerKeyConfigureInProgress
{
  return self->_readerKeyConfigureInProgress;
}

@end