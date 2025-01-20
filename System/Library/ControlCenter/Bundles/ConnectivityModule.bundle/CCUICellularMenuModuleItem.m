@interface CCUICellularMenuModuleItem
- (NSString)shortLabel;
- (id)indicatorView;
- (void)setShortLabel:(id)a3;
@end

@implementation CCUICellularMenuModuleItem

- (id)indicatorView
{
  v3 = objc_alloc_init(CCUICellularMenuModuleItemIndicatorView);
  v6 = objc_msgSend_indicatorLabel(v3, v4, v5);
  v9 = objc_msgSend_shortLabel(self, v7, v8);
  objc_msgSend_setText_(v6, v10, (uint64_t)v9);

  return v3;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (void)setShortLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end