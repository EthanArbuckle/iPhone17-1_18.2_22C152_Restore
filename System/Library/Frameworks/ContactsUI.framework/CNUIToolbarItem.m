@interface CNUIToolbarItem
- (BOOL)isCancel;
- (BOOL)isDefault;
- (NSString)title;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setIsCancel:(BOOL)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNUIToolbarItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setActionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setIsCancel:(BOOL)a3
{
  self->_isCancel = a3;
}

- (BOOL)isCancel
{
  return self->_isCancel;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

@end