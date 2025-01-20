@interface CKMenuItemObject
- (CKMenuItemObject)initWithTitle:(id)a3 imageName:(id)a4 handler:(id)a5;
- (NSString)imageName;
- (NSString)title;
- (id)handler;
- (id)uiAction;
- (void)setHandler:(id)a3;
- (void)setImageName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CKMenuItemObject

- (CKMenuItemObject)initWithTitle:(id)a3 imageName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKMenuItemObject;
  v11 = [(CKMenuItemObject *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CKMenuItemObject *)v11 setTitle:v8];
    [(CKMenuItemObject *)v12 setImageName:v9];
    [(CKMenuItemObject *)v12 setHandler:v10];
  }

  return v12;
}

- (id)uiAction
{
  v3 = (void *)MEMORY[0x1E4F42A80];
  v4 = [(CKMenuItemObject *)self imageName];
  v5 = [v3 systemImageNamed:v4];

  v6 = (void *)MEMORY[0x1E4F426E8];
  v7 = [(CKMenuItemObject *)self title];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__CKMenuItemObject_uiAction__block_invoke;
  v10[3] = &unk_1E56211C8;
  v10[4] = self;
  id v8 = [v6 actionWithTitle:v7 image:v5 identifier:0 handler:v10];

  return v8;
}

void __28__CKMenuItemObject_uiAction__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) handler];
  v1[2]();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end