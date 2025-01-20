@interface CUIKORContentImageRequest
- (CUIKORContentImageRequest)initWithId:(int64_t)a3 options:(unint64_t)a4 state:(id)a5 resultHandler:(id)a6;
- (CUIKOROccurrenceState)state;
- (id)resultHandler;
- (int64_t)requestId;
- (unint64_t)options;
@end

@implementation CUIKORContentImageRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (CUIKORContentImageRequest)initWithId:(int64_t)a3 options:(unint64_t)a4 state:(id)a5 resultHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CUIKORContentImageRequest;
  v12 = [(CUIKORContentImageRequest *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_requestId = a3;
    v12->_options = a4;
    uint64_t v14 = [v10 copy];
    state = v13->_state;
    v13->_state = (CUIKOROccurrenceState *)v14;

    uint64_t v16 = [v11 copy];
    id resultHandler = v13->_resultHandler;
    v13->_id resultHandler = (id)v16;
  }
  return v13;
}

- (CUIKOROccurrenceState)state
{
  return self->_state;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (int64_t)requestId
{
  return self->_requestId;
}

@end