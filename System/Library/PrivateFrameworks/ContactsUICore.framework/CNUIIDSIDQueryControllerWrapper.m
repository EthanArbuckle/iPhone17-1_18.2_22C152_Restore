@interface CNUIIDSIDQueryControllerWrapper
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (CNUIIDSIDQueryControllerWrapper)initWithController:(id)a3;
- (IDSIDQueryController)controller;
@end

@implementation CNUIIDSIDQueryControllerWrapper

- (CNUIIDSIDQueryControllerWrapper)initWithController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIIDSIDQueryControllerWrapper;
  v6 = [(CNUIIDSIDQueryControllerWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(CNUIIDSIDQueryControllerWrapper *)self controller];
  char v18 = [v17 refreshIDStatusForDestinations:v16 service:v15 listenerID:v14 queue:v13 completionBlock:v12];

  return v18;
}

- (IDSIDQueryController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
}

@end