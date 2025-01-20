@interface CEKAnimationGeneratorAnimation
- (CEKAnimationGeneratorAnimation)initWithStartTime:(double)a3 duration:(double)a4 updateHandler:(id)a5 completionHandler:(id)a6;
- (double)duration;
- (double)startTime;
- (id)completionHandler;
- (id)updateHandler;
@end

@implementation CEKAnimationGeneratorAnimation

- (CEKAnimationGeneratorAnimation)initWithStartTime:(double)a3 duration:(double)a4 updateHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CEKAnimationGeneratorAnimation;
  v12 = [(CEKAnimationGeneratorAnimation *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_startTime = a3;
    v12->_duration = a4;
    uint64_t v14 = [v10 copy];
    id updateHandler = v13->_updateHandler;
    v13->_id updateHandler = (id)v14;

    uint64_t v16 = [v11 copy];
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v16;

    v18 = v13;
  }

  return v13;
}

- (double)startTime
{
  return self->_startTime;
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
}

@end