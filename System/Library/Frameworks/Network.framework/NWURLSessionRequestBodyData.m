@interface NWURLSessionRequestBodyData
- (int64_t)countOfBytesSent;
- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionRequestBodyData

- (void).cxx_destruct
{
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, dispatch_data_t, BOOL, void))a5;
  v12 = v7;
  if (self && (size_t offset = self->_offset, offset < self->_length))
  {
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_data, offset, a4);
    unint64_t length = self->_length;
    unint64_t v11 = self->_offset + a4;
    self->_size_t offset = v11;
    v12[2](v12, subrange, v11 >= length, 0);
  }
  else
  {
    v7[2](v7, 0, 1, 0);
  }
}

- (int64_t)countOfBytesSent
{
  if (self)
  {
    if (*(void *)(self + 24) >= *(void *)(self + 16)) {
      return *(void *)(self + 16);
    }
    else {
      return *(void *)(self + 24);
    }
  }
  return self;
}

@end