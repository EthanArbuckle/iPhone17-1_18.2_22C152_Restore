@interface _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation
- (MPMediaItem)mediaItem;
- (int64_t)keepLocal;
- (unint64_t)keepLocalConstraints;
- (void)execute;
- (void)setKeepLocal:(int64_t)a3;
- (void)setKeepLocalConstraints:(unint64_t)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation

- (void).cxx_destruct
{
}

- (void)setKeepLocalConstraints:(unint64_t)a3
{
  self->_keepLocalConstraints = a3;
}

- (unint64_t)keepLocalConstraints
{
  return self->_keepLocalConstraints;
}

- (void)setKeepLocal:(int64_t)a3
{
  self->_keepLocal = a3;
}

- (int64_t)keepLocal
{
  return self->_keepLocal;
}

- (void)setMediaItem:(id)a3
{
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)execute
{
  v2 = self;
  mediaItem = v2->_mediaItem;
  v4 = [NSNumber numberWithUnsignedInteger:v2->_keepLocalConstraints];
  [(MPMediaItem *)mediaItem setValue:v4 forProperty:@"keepLocalConstraints"];

  v5 = v2->_mediaItem;
  v6 = [NSNumber numberWithInteger:v2->_keepLocal];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___MPModelLibraryKeepLocalChangeRequestUpdateItemOperation_execute__block_invoke;
  v8[3] = &unk_1E57FA170;
  v9 = v2;
  v7 = v2;
  [(MPMediaItem *)v5 setValue:v6 forProperty:@"keepLocal" withCompletionBlock:v8];
}

@end