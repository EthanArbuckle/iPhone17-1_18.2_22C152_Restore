@interface ASCAppOfferSavedState
- (ASCAppOfferSavedState)initWithState:(id)a3 metadata:(id)a4 flags:(int64_t)a5;
- (ASCOfferMetadata)metadata;
- (BOOL)isActionable;
- (BOOL)isLoadingFullState;
- (NSString)state;
- (int64_t)flags;
@end

@implementation ASCAppOfferSavedState

- (ASCAppOfferSavedState)initWithState:(id)a3 metadata:(id)a4 flags:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCAppOfferSavedState;
  v10 = [(ASCAppOfferSavedState *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    state = v10->_state;
    v10->_state = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    metadata = v10->_metadata;
    v10->_metadata = (ASCOfferMetadata *)v13;

    v10->_flags = a5;
  }

  return v10;
}

- (BOOL)isLoadingFullState
{
  return [(ASCAppOfferSavedState *)self flags] & 1;
}

- (BOOL)isActionable
{
  return ((unint64_t)[(ASCAppOfferSavedState *)self flags] >> 1) & 1;
}

- (NSString)state
{
  return self->_state;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (int64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end