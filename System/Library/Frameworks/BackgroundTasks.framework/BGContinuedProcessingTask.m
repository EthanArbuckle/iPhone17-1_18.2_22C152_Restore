@interface BGContinuedProcessingTask
- (NSString)reason;
- (NSString)title;
- (id)_initWithIdentifier:(id)a3 activity:(id)a4;
- (id)_progressHandler;
- (id)description;
- (void)_setProgressHandler:(id)a3;
- (void)setReason:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateProgress:(id)a3;
@end

@implementation BGContinuedProcessingTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BGContinuedProcessingTask;
  v7 = [(BGTask *)&v13 _initWithIdentifier:a3 activity:v6];
  if (v7)
  {
    uint64_t v8 = [v6 clientProvidedTitle];
    v9 = (void *)v7[7];
    v7[7] = v8;

    uint64_t v10 = [v6 clientProvidedReason];
    v11 = (void *)v7[8];
    v7[8] = v10;
  }
  return v7;
}

- (void)updateProgress:(id)a3
{
  id v6 = a3;
  v4 = [(BGContinuedProcessingTask *)self _progressHandler];

  if (v4)
  {
    v5 = [(BGContinuedProcessingTask *)self _progressHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(BGTask *)self identifier];
  v5 = [(BGContinuedProcessingTask *)self title];
  id v6 = [(BGContinuedProcessingTask *)self reason];
  v7 = [v3 stringWithFormat:@"<BGContinuedProcessingTask: %@ (%@, %@)>", v4, v5, v6];

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end