@interface FBSDataResetRequest
- (FBSDataResetRequest)initWithMode:(int64_t)a3 options:(int64_t)a4 reason:(id)a5;
- (NSString)reason;
- (int64_t)mode;
- (int64_t)options;
- (void)setMode:(int64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation FBSDataResetRequest

- (FBSDataResetRequest)initWithMode:(int64_t)a3 options:(int64_t)a4 reason:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FBSDataResetRequest;
  v9 = [(FBSDataResetRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(FBSDataResetRequest *)v9 setMode:a3];
    [(FBSDataResetRequest *)v10 setOptions:a4];
    [(FBSDataResetRequest *)v10 setReason:v8];
  }

  return v10;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end