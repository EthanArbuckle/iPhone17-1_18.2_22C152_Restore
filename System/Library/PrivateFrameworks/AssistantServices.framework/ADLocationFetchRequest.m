@interface ADLocationFetchRequest
- (ADLocationFetchRequest)initWithClientFetchRequest:(id)a3 completion:(id)a4;
- (double)desiredAccuracy;
- (id)completion;
- (unint64_t)style;
- (void)setCompletion:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation ADLocationFetchRequest

- (void).cxx_destruct
{
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (ADLocationFetchRequest)initWithClientFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ADLocationFetchRequest;
  v8 = [(ADLocationFetchRequest *)&v13 init];
  if (v8)
  {
    [v6 desiredAccuracy];
    v8->_desiredAccuracy = v9;
    v8->_style = (unint64_t)[v6 style];
    id v10 = objc_retainBlock(v7);
    id completion = v8->_completion;
    v8->_id completion = v10;
  }
  return v8;
}

@end