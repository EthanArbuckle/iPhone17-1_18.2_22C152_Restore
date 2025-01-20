@interface HSObserverStage
- (HSObserverStage)initWithName:(id)a3 handler:(id)a4;
- (id)name;
- (void)handleConsume:(id)a3;
@end

@implementation HSObserverStage

- (void)handleConsume:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(void))v5->_handler + 2))();
  v3.receiver = v5;
  v3.super_class = (Class)HSObserverStage;
  [(HSStage *)&v3 handleConsume:location[0]];
  objc_storeStrong(location, 0);
}

- (HSObserverStage)initWithName:(id)a3 handler:(id)a4
{
  id v15 = self;
  SEL v14 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (!v12)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v9 handleFailureInMethod:v14, v15, @"HSObserverStage.mm", 9, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v4 = v15;
  id v15 = 0;
  v11.receiver = v4;
  v11.super_class = (Class)HSObserverStage;
  v8 = [(HSStage *)&v11 init];
  id v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
  {
    objc_storeStrong((id *)v15 + 15, location);
    id v5 = objc_retainBlock(v12);
    v6 = (void *)*((void *)v15 + 16);
    *((void *)v15 + 16) = v5;

    v16 = (HSObserverStage *)v15;
  }
  else
  {
    v16 = 0;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  return v16;
}

- (id)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end