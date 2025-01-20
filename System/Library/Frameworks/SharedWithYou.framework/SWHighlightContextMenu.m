@interface SWHighlightContextMenu
- (NSString)identifier;
- (NSString)title;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SWHighlightContextMenu

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end