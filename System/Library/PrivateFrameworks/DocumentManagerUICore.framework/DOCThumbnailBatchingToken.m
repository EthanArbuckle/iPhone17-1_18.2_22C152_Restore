@interface DOCThumbnailBatchingToken
- (void)_setInvalidated:(BOOL)a3;
- (void)dealloc;
@end

@implementation DOCThumbnailBatchingToken

- (void)_setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    [(DOCThumbnailBatchingToken *)self _setInvalidated:1];
    v3 = +[DOCThumbnailGenerator sharedGenerator];
    [v3 endBatching:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)DOCThumbnailBatchingToken;
  [(DOCThumbnailBatchingToken *)&v4 dealloc];
}

@end