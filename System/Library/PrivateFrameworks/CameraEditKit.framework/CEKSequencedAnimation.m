@interface CEKSequencedAnimation
- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5;
- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5 completion:(id)a6;
- (NSString)identifier;
- (double)duration;
- (id)completionHandler;
- (id)updateHandler;
@end

@implementation CEKSequencedAnimation

- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CEKSequencedAnimation;
  v14 = [(CEKSequencedAnimation *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_duration = a4;
    v16 = _Block_copy(v12);
    id updateHandler = v15->_updateHandler;
    v15->_id updateHandler = v16;

    v18 = _Block_copy(v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v18;

    v20 = v15;
  }

  return v15;
}

- (CEKSequencedAnimation)initWithWithIdentifier:(id)a3 duration:(double)a4 updateHandler:(id)a5
{
  return [(CEKSequencedAnimation *)self initWithWithIdentifier:a3 duration:a5 updateHandler:0 completion:a4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end