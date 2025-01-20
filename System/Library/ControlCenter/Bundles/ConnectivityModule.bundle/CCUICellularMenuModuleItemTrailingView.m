@interface CCUICellularMenuModuleItemTrailingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation CCUICellularMenuModuleItemTrailingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_subviews(self, a2, v3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v21;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_sizeThatFits_(*(void **)(*((void *)&v20 + 1) + 8 * i), v9, v10, width, height);
        double v13 = v13 + v15;
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }
  if ((unint64_t)objc_msgSend_count(v6, v9, v10) >= 2) {
    double v13 = v13 + (double)(unint64_t)(objc_msgSend_count(v6, v16, v17) - 1) * 7.0;
  }

  double v18 = v13;
  double v19 = height;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)CCUICellularMenuModuleItemTrailingView;
  [(CCUICellularMenuModuleItemTrailingView *)&v33 layoutSubviews];
  v5 = objc_msgSend_subviews(self, v3, v4);
  if (objc_msgSend_count(v5, v6, v7))
  {
    int shouldReverseLayoutDirection = objc_msgSend__shouldReverseLayoutDirection(self, v8, v9);
    objc_msgSend_bounds(self, v11, v12);
    double v19 = v17;
    double v20 = v18;
    double MaxX = 0.0;
    if ((shouldReverseLayoutDirection & 1) == 0) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v15);
    }
    uint64_t v22 = objc_msgSend_count(v5, v13, v14);
    if (v22)
    {
      uint64_t v24 = v22 - 1;
      do
      {
        uint64_t v25 = objc_msgSend_objectAtIndex_(v5, v23, v24);
        objc_msgSend_sizeThatFits_(v25, v26, v27, v19, v20);
        double v29 = v28;
        if (shouldReverseLayoutDirection) {
          double v28 = 0.0;
        }
        double v30 = MaxX - v28;
        if (shouldReverseLayoutDirection) {
          double MaxX = v29 + v30 + 7.0;
        }
        else {
          double MaxX = v30 + -7.0;
        }
        UIRectCenteredYInRectScale();
        objc_msgSend_setFrame_(v25, v31, v32, 0);

        --v24;
      }
      while (v24 != -1);
    }
  }
}

@end