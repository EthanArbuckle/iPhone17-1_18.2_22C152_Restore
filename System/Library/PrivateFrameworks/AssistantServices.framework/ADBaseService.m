@interface ADBaseService
- (ADBaseService)init;
- (SEL)_selectorForCommandClass:(id)a3 andDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_registerCommandClass:(id)a3 forDomain:(id)a4 withSelector:(SEL)a5 forRegistry:(id)a6;
- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADBaseService

- (void).cxx_destruct
{
}

- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Command not supported"];
    (*((void (**)(id, id, void))a5 + 2))(v6, v7, 0);
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v13 = a4;
  id v9 = a6;
  id v10 = a3;
  v11 = [v10 encodedClassName];
  v12 = [(ADBaseService *)self _selectorForCommandClass:v11 andDomain:v13];

  if (v12) {
    objc_msgSend(self, v12, v10, v9);
  }
  else {
    [(ADBaseService *)self _unhandledCommand:v10 forDomain:v13 completion:v9];
  }
}

- (id)commandsForDomain:(id)a3
{
  v3 = [(NSDictionary *)self->_commandRegistry objectForKey:a3];
  v4 = [v3 allKeys];

  return v4;
}

- (id)domains
{
  return [(NSDictionary *)self->_commandRegistry allKeys];
}

- (SEL)_selectorForCommandClass:(id)a3 andDomain:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_commandRegistry objectForKey:a4];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:v6];
    id v10 = v9;
    if (v9) {
      v11 = (const char *)[v9 pointerValue];
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_registerCommandClass:(id)a3 forDomain:(id)a4 withSelector:(SEL)a5 forRegistry:(id)a6
{
  id v13 = a4;
  id v9 = a6;
  if (v9)
  {
    id v10 = a3;
    v11 = [v9 objectForKey:v13];
    if (!v11)
    {
      v11 = +[NSMutableDictionary dictionary];
      [v9 setObject:v11 forKey:v13];
    }
    v12 = +[NSValue valueWithPointer:a5];
    [v11 setObject:v12 forKey:v10];
  }
}

- (ADBaseService)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADBaseService;
  v2 = [(ADBaseService *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(ADService *)v2 setIdentifier:v4];

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(ADBaseService *)v2 _registerCommandHandlersWithRegistry:v5];
    id v6 = (NSDictionary *)[v5 copy];
    commandRegistry = v2->_commandRegistry;
    v2->_commandRegistry = v6;
  }
  return v2;
}

@end