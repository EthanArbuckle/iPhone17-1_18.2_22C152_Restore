@interface _BGContinuedProcessingTask
- (NSProgress)internalProgress;
- (NSString)reason;
- (NSString)title;
- (id)_descriptionUpdateHandler;
- (id)_initWithIdentifier:(id)a3 activity:(id)a4;
- (id)_progressHandler;
- (id)description;
- (void)_setDescriptionUpdateHandler:(id)a3;
- (void)_setProgressHandler:(id)a3;
- (void)setInternalProgress:(id)a3;
- (void)setReason:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateProgress:(id)a3;
- (void)updateTitle:(id)a3 withReason:(id)a4;
@end

@implementation _BGContinuedProcessingTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_BGContinuedProcessingTask;
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

- (void)updateTitle:(id)a3 withReason:(id)a4
{
  id v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  uint64_t v8 = [(_BGContinuedProcessingTask *)self _descriptionUpdateHandler];

  if (v8)
  {
    v9 = [(_BGContinuedProcessingTask *)self _descriptionUpdateHandler];
    ((void (**)(void, NSString *, NSString *))v9)[2](v9, v6, v7);
  }
  title = self->_title;
  self->_title = v6;
  v12 = v6;

  reason = self->_reason;
  self->_reason = v7;
}

- (void)updateProgress:(id)a3
{
  id v6 = a3;
  v4 = [(_BGContinuedProcessingTask *)self _progressHandler];

  if (v4)
  {
    v5 = [(_BGContinuedProcessingTask *)self _progressHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(BGTask *)self identifier];
  v5 = [(_BGContinuedProcessingTask *)self title];
  id v6 = [(_BGContinuedProcessingTask *)self reason];
  v7 = [v3 stringWithFormat:@"<BGContinuedProcessingTask: %@ (%@, %@)>", v4, v5, v6];

  return v7;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReason:(id)a3
{
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setProgressHandler:(id)a3
{
}

- (id)_descriptionUpdateHandler
{
  return self->__descriptionUpdateHandler;
}

- (void)_setDescriptionUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__descriptionUpdateHandler, 0);
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end