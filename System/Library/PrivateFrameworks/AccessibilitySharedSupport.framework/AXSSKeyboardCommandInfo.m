@interface AXSSKeyboardCommandInfo
+ (id)infoWithDownHandler:(id)a3 upHandler:(id)a4;
+ (id)infoWithHandler:(id)a3;
- (BOOL)handlesBothDownAndUp;
- (id)_initWithHandler:(id)a3 downHandler:(id)a4 upHandler:(id)a5 handlesBothDownAndUp:(BOOL)a6;
- (id)downHandler;
- (id)handler;
- (id)upHandler;
@end

@implementation AXSSKeyboardCommandInfo

+ (id)infoWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithHandler:v4 downHandler:0 upHandler:0 handlesBothDownAndUp:0];

  return v5;
}

+ (id)infoWithDownHandler:(id)a3 upHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithHandler:0 downHandler:v7 upHandler:v6 handlesBothDownAndUp:1];

  return v8;
}

- (id)_initWithHandler:(id)a3 downHandler:(id)a4 upHandler:(id)a5 handlesBothDownAndUp:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXSSKeyboardCommandInfo;
  v13 = [(AXSSKeyboardCommandInfo *)&v21 init];
  if (v13)
  {
    uint64_t v14 = MEMORY[0x1B3EC2350](v10);
    id handler = v13->_handler;
    v13->_id handler = (id)v14;

    uint64_t v16 = MEMORY[0x1B3EC2350](v11);
    id downHandler = v13->_downHandler;
    v13->_id downHandler = (id)v16;

    uint64_t v18 = MEMORY[0x1B3EC2350](v12);
    id upHandler = v13->_upHandler;
    v13->_id upHandler = (id)v18;

    v13->_handlesBothDownAndUp = a6;
  }

  return v13;
}

- (BOOL)handlesBothDownAndUp
{
  return self->_handlesBothDownAndUp;
}

- (id)handler
{
  return self->_handler;
}

- (id)downHandler
{
  return self->_downHandler;
}

- (id)upHandler
{
  return self->_upHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upHandler, 0);
  objc_storeStrong(&self->_downHandler, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end