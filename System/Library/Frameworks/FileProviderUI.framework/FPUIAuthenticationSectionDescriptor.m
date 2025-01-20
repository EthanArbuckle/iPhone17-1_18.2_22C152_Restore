@interface FPUIAuthenticationSectionDescriptor
- (BOOL)isActive;
- (BOOL)shouldHighlightRows;
- (Class)footerViewClass;
- (Class)headerViewClass;
- (Class)rowCellClass;
- (FPUIAuthenticationSectionDescriptor)init;
- (NSString)footerTitle;
- (NSString)footerViewReuseIdentifier;
- (NSString)headerTitle;
- (NSString)headerViewReuseIdentifier;
- (NSString)rowCellReuseIdentifier;
- (double)footerHeight;
- (double)headerHeight;
- (id)footerViewCustomizationBlock;
- (id)headerViewCustomizationBlock;
- (void)setActive:(BOOL)a3;
- (void)setFooterHeight:(double)a3;
- (void)setFooterTitle:(id)a3;
- (void)setFooterViewClass:(Class)a3;
- (void)setFooterViewCustomizationBlock:(id)a3;
- (void)setFooterViewReuseIdentifier:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderViewClass:(Class)a3;
- (void)setHeaderViewCustomizationBlock:(id)a3;
- (void)setHeaderViewReuseIdentifier:(id)a3;
- (void)setRowCellClass:(Class)a3;
- (void)setRowCellReuseIdentifier:(id)a3;
- (void)setShouldHighlightRows:(BOOL)a3;
@end

@implementation FPUIAuthenticationSectionDescriptor

- (FPUIAuthenticationSectionDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationSectionDescriptor;
  result = [(FPUIAuthenticationSectionDescriptor *)&v3 init];
  if (result)
  {
    result->_headerHeight = *(double *)MEMORY[0x263F1D600];
    *(_WORD *)&result->_shouldHighlightRows = 257;
  }
  return result;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (BOOL)shouldHighlightRows
{
  return self->_shouldHighlightRows;
}

- (void)setShouldHighlightRows:(BOOL)a3
{
  self->_shouldHighlightRows = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (Class)headerViewClass
{
  return self->_headerViewClass;
}

- (void)setHeaderViewClass:(Class)a3
{
}

- (NSString)headerViewReuseIdentifier
{
  return self->_headerViewReuseIdentifier;
}

- (void)setHeaderViewReuseIdentifier:(id)a3
{
}

- (id)headerViewCustomizationBlock
{
  return self->_headerViewCustomizationBlock;
}

- (void)setHeaderViewCustomizationBlock:(id)a3
{
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
}

- (Class)footerViewClass
{
  return self->_footerViewClass;
}

- (void)setFooterViewClass:(Class)a3
{
}

- (NSString)footerViewReuseIdentifier
{
  return self->_footerViewReuseIdentifier;
}

- (void)setFooterViewReuseIdentifier:(id)a3
{
}

- (id)footerViewCustomizationBlock
{
  return self->_footerViewCustomizationBlock;
}

- (void)setFooterViewCustomizationBlock:(id)a3
{
}

- (Class)rowCellClass
{
  return self->_rowCellClass;
}

- (void)setRowCellClass:(Class)a3
{
}

- (NSString)rowCellReuseIdentifier
{
  return self->_rowCellReuseIdentifier;
}

- (void)setRowCellReuseIdentifier:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowCellClass, 0);
  objc_storeStrong(&self->_footerViewCustomizationBlock, 0);
  objc_storeStrong((id *)&self->_footerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_footerViewClass, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong(&self->_headerViewCustomizationBlock, 0);
  objc_storeStrong((id *)&self->_headerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_headerViewClass, 0);

  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end