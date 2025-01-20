@interface AXAlertAction
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (int64_t)buttonIndex;
- (void)setButtonIndex:(int64_t)a3;
@end

@implementation AXAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AXAlertAction;
  v6 = objc_msgSendSuper2(&v9, sel_actionWithTitle_style_handler_, a3, a4, a5);
  v7 = v6;
  if (a4 == 1) {
    [v6 setButtonIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v7;
}

- (int64_t)buttonIndex
{
  return self->buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->buttonIndex = a3;
}

@end