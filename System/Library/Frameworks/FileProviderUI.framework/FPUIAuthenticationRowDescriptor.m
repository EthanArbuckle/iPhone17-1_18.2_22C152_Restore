@interface FPUIAuthenticationRowDescriptor
+ (Class)defaultCellClass;
+ (id)defaultCellReuseIdentifier;
- (Class)cellClass;
- (FPUIAuthenticationRowDescriptor)init;
- (NSString)cellReuseIdentifier;
- (double)rowHeight;
- (double)shouldHighlight;
- (id)accessoryButtonTapHandler;
- (id)cellCustomizationHandler;
- (id)cellWillDisplayHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectionHandler;
- (int64_t)cellSelectionStyle;
- (void)setAccessoryButtonTapHandler:(id)a3;
- (void)setCellClass:(Class)a3;
- (void)setCellCustomizationHandler:(id)a3;
- (void)setCellReuseIdentifier:(id)a3;
- (void)setCellSelectionStyle:(int64_t)a3;
- (void)setCellWillDisplayHandler:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setShouldHighlight:(double)a3;
@end

@implementation FPUIAuthenticationRowDescriptor

+ (Class)defaultCellClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultCellReuseIdentifier
{
  return @"UITableViewCellReuseIdentifier";
}

- (FPUIAuthenticationRowDescriptor)init
{
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationRowDescriptor;
  v2 = [(FPUIAuthenticationRowDescriptor *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_rowHeight = *(double *)MEMORY[0x263F1D600];
    v2->_shouldHighlight = 1.0;
    uint64_t v4 = [(id)objc_opt_class() defaultCellClass];
    Class cellClass = v3->_cellClass;
    v3->_Class cellClass = (Class)v4;

    uint64_t v6 = [(id)objc_opt_class() defaultCellReuseIdentifier];
    cellReuseIdentifier = v3->_cellReuseIdentifier;
    v3->_cellReuseIdentifier = (NSString *)v6;

    v3->_cellSelectionStyle = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  *(double *)(v4 + 8) = self->_rowHeight;
  *(double *)(v4 + 16) = self->_shouldHighlight;
  uint64_t v5 = [self->_selectionHandler copy];
  uint64_t v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(objc_class *)self->_cellClass copy];
  v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  uint64_t v9 = [(NSString *)self->_cellReuseIdentifier copy];
  v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v9;

  uint64_t v11 = [self->_cellCustomizationHandler copy];
  v12 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v11;

  uint64_t v13 = [self->_cellWillDisplayHandler copy];
  v14 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v13;

  return (id)v4;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)shouldHighlight
{
  return self->_shouldHighlight;
}

- (void)setShouldHighlight:(double)a3
{
  self->_shouldHighlight = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)accessoryButtonTapHandler
{
  return self->_accessoryButtonTapHandler;
}

- (void)setAccessoryButtonTapHandler:(id)a3
{
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (void)setCellClass:(Class)a3
{
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (void)setCellReuseIdentifier:(id)a3
{
}

- (id)cellCustomizationHandler
{
  return self->_cellCustomizationHandler;
}

- (void)setCellCustomizationHandler:(id)a3
{
}

- (id)cellWillDisplayHandler
{
  return self->_cellWillDisplayHandler;
}

- (void)setCellWillDisplayHandler:(id)a3
{
}

- (int64_t)cellSelectionStyle
{
  return self->_cellSelectionStyle;
}

- (void)setCellSelectionStyle:(int64_t)a3
{
  self->_cellSelectionStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellWillDisplayHandler, 0);
  objc_storeStrong(&self->_cellCustomizationHandler, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
  objc_storeStrong(&self->_accessoryButtonTapHandler, 0);

  objc_storeStrong(&self->_selectionHandler, 0);
}

@end