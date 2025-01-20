@interface HUPocketButtonDescriptor
+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 target:(id)a5 action:(SEL)a6 userInfo:(id)a7;
+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 userInfo:(id)a5 block:(id)a6;
- (NSCopying)userInfo;
- (NSString)title;
- (SEL)action;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (id)block;
- (id)target;
- (unint64_t)style;
- (void)execute;
- (void)setAction:(SEL)a3;
- (void)setBlock:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTarget:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HUPocketButtonDescriptor

+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 target:(id)a5 action:(SEL)a6 userInfo:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  v14 = objc_opt_new();
  [v14 setTitle:v13];

  [v14 setStyle:a4];
  [v14 setTarget:v12];

  [v14 setAction:a6];
  [v14 setUserInfo:v11];

  return v14;
}

+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 userInfo:(id)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_opt_new();
  [v12 setTitle:v11];

  [v12 setStyle:a4];
  [v12 setBlock:v9];

  [v12 setUserInfo:v10];

  return v12;
}

- (UIColor)textColor
{
  v2 = [(HUPocketButtonDescriptor *)self style];
  if (v2 == (void *)1)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  else if (!v2)
  {
    v2 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }

  return (UIColor *)v2;
}

- (UIColor)backgroundColor
{
  if ([(HUPocketButtonDescriptor *)self style] == 1)
  {
    v2 = [MEMORY[0x1E4F428B8] clearColor];
  }
  else
  {
    v2 = 0;
  }

  return (UIColor *)v2;
}

- (void)execute
{
  v3 = [(HUPocketButtonDescriptor *)self block];

  if (v3)
  {
    v4 = [(HUPocketButtonDescriptor *)self block];
    v4[2](v4, self);
  }
  else
  {
    v4 = [(HUPocketButtonDescriptor *)self target];
    objc_msgSend(v4, "performSelector:withObject:", -[HUPocketButtonDescriptor action](self, "action"), self);
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSCopying)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end