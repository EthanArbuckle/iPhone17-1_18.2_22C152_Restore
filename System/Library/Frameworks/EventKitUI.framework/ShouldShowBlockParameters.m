@interface ShouldShowBlockParameters
- (NSArray)events;
- (ShouldShowBlockParameters)initWithEvents:(id)a3 presentationController:(id)a4;
- (UIViewController)presentationController;
@end

@implementation ShouldShowBlockParameters

- (ShouldShowBlockParameters)initWithEvents:(id)a3 presentationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ShouldShowBlockParameters;
  v9 = [(ShouldShowBlockParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_events, a3);
    objc_storeStrong((id *)&v10->_presentationController, a4);
  }

  return v10;
}

- (NSArray)events
{
  return self->_events;
}

- (UIViewController)presentationController
{
  return self->_presentationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end