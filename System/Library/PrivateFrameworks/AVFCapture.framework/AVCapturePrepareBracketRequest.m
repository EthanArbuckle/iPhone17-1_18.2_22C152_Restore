@interface AVCapturePrepareBracketRequest
+ (id)prepareBracketRequestWithCompletionBlock:(id)a3 settings:(id)a4;
- (FigCaptureStillImageSettings)settings;
- (id)_initWithCompletionBlock:(id)a3 settings:(id)a4;
- (id)completionBlock;
- (void)dealloc;
@end

@implementation AVCapturePrepareBracketRequest

+ (id)prepareBracketRequestWithCompletionBlock:(id)a3 settings:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithCompletionBlock:a3 settings:a4];

  return v4;
}

- (id)_initWithCompletionBlock:(id)a3 settings:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCapturePrepareBracketRequest;
  v6 = [(AVCapturePrepareBracketRequest *)&v8 init];
  if (v6)
  {
    v6->_completionBlock = (id)[a3 copy];
    v6->_settings = (FigCaptureStillImageSettings *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePrepareBracketRequest;
  [(AVCapturePrepareBracketRequest *)&v3 dealloc];
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (FigCaptureStillImageSettings)settings
{
  return self->_settings;
}

@end