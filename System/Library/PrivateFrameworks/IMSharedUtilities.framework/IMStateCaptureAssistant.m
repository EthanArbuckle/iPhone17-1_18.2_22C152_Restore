@interface IMStateCaptureAssistant
+ (unint64_t)registerStateCaptureBlockWithObject:(id)a3 title:(id)a4 queue:(id)a5;
- (IMStateCaptureAssistant)initWithObject:(id)a3 title:(id)a4 queue:(id)a5;
- (unint64_t)handle;
- (void)dealloc;
- (void)deregister;
- (void)setHandle:(unint64_t)a3;
@end

@implementation IMStateCaptureAssistant

- (IMStateCaptureAssistant)initWithObject:(id)a3 title:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMStateCaptureAssistant;
  v11 = [(IMStateCaptureAssistant *)&v13 init];
  if (v11) {
    v11->_handle = [(id)objc_opt_class() registerStateCaptureBlockWithObject:v8 title:v9 queue:v10];
  }

  return v11;
}

+ (unint64_t)registerStateCaptureBlockWithObject:(id)a3 title:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 || (dispatch_get_global_queue(-32768, 0), (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id location = 0;
    objc_initWeak(&location, v7);
    id v10 = (void *)[v8 copy];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      objc_super v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    objc_copyWeak(&v17, &location);
    id v8 = v14;
    unint64_t v15 = os_state_add_handler();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  [(IMStateCaptureAssistant *)self deregister];
  v3.receiver = self;
  v3.super_class = (Class)IMStateCaptureAssistant;
  [(IMStateCaptureAssistant *)&v3 dealloc];
}

- (void)deregister
{
  if (self->_handle)
  {
    os_state_remove_handler();
    self->_handle = 0;
  }
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

@end