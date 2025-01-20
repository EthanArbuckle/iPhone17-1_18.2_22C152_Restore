@interface CKAlertAction
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (id)__ck_handler;
- (void)set__ck_handler:(id)a3;
@end

@implementation CKAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CKAlertAction;
  id v7 = a5;
  v8 = objc_msgSendSuper2(&v10, sel_actionWithTitle_style_handler_, a3, a4, v7);
  objc_msgSend(v8, "set__ck_handler:", v7, v10.receiver, v10.super_class);

  return v8;
}

- (id)__ck_handler
{
  return self->___ck_handler;
}

- (void)set__ck_handler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end