@interface UIView(NUIPrivate)
- (double)calculateLayoutSizeFittingSize:()NUIPrivate;
- (id)debugSizeCacheDict;
- (uint64_t)canUseFastLayoutSizeCalulation;
- (uint64_t)debugSizeCache;
@end

@implementation UIView(NUIPrivate)

- (double)calculateLayoutSizeFittingSize:()NUIPrivate
{
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if (IfNeeded->_minSize.width == IfNeeded->_maxSize.width
    && (v7 = IfNeeded, [(objc_object *)a1 canUseFastLayoutSizeCalulation]))
  {
    double width = v7->_minSize.width;
    objc_msgSend((id)-[objc_object _fontInfoForBaselineSpacing](a1, "_fontInfoForBaselineSpacing"), "lineHeight");
    [(objc_object *)a1 _currentScreenScale];
  }
  else
  {
    if (![(objc_object *)a1 _wantsAutolayout]) {
      goto LABEL_8;
    }
    if (_NUIViewIsSwiftUISPICompatible(UIView *)::onceToken != -1) {
      dispatch_once(&_NUIViewIsSwiftUISPICompatible(UIView *)::onceToken, &__block_literal_global_104);
    }
    uint64_t v9 = [(objc_object *)a1 methodForSelector:sel__layoutSizeThatFits_fixedAxes_];
    if (v9 == _NUIViewIsSwiftUISPICompatible(UIView *)::baseLayoutSizeImp)
    {
      if (([(id)_NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet containsObject:a1] & 1) == 0)
      {
        uint64_t v21 = [NSString stringWithFormat:@"Arranged subview %@ wants autolayout. It must be wrapped in a _UIConstraintBasedLayoutHostingView or override _layoutSizeThatFits:fixedAxes:.", a1];
        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v23 = _NUILog();
        v24 = v23;
        if (has_internal_diagnostics)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:](v21, v24);
          }
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:](v21, v24);
        }
        [(id)_NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet addObject:a1];
      }
      -[objc_object systemLayoutSizeFittingSize:](a1, "systemLayoutSizeFittingSize:", a2, a3);
      return v25;
    }
    else
    {
LABEL_8:
      [(objc_object *)a1 alignmentRectInsets];
      double v14 = v12 + v13;
      double v15 = a2 - (v12 + v13);
      if (v15 >= 0.0) {
        double v16 = v15;
      }
      else {
        double v16 = 0.0;
      }
      double v17 = a3 - (v10 + v11);
      if (v17 >= 0.0) {
        double v18 = v17;
      }
      else {
        double v18 = 0.0;
      }
      -[objc_object _layoutSizeThatFits:fixedAxes:](a1, "_layoutSizeThatFits:fixedAxes:", 0, v16, v18);
      return v19 + v14;
    }
  }
  return width;
}

- (id)debugSizeCacheDict
{
  v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  begin = (double *)IfNeeded->_sizeCache.__begin_;
  for (i = (double *)IfNeeded->_sizeCache.__end_; begin != i; begin += 4)
  {
    double v6 = *begin;
    double v7 = begin[1];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", begin[2], begin[3]);
    objc_msgSend(v2, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v6, v7));
  }
  uint64_t v9 = (void *)[v2 copy];
  return v9;
}

- (uint64_t)debugSizeCache
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)[v2 stringWithFormat:@"<%@ %p size cache:\n", NSStringFromClass(v3), a1];
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  begin = (CGSize *)IfNeeded->_sizeCache.__begin_;
  for (i = (CGSize *)IfNeeded->_sizeCache.__end_; begin != i; begin += 2)
  {
    CGFloat width = begin[1].width;
    CGFloat height = begin[1].height;
    double v10 = NSStringFromCGSize(*begin);
    v13.CGFloat width = width;
    v13.CGFloat height = height;
    [v4 appendFormat:@"\t%@ : %@\n", v10, NSStringFromCGSize(v13)];
  }
  return [v4 stringByAppendingString:@">"];
}

- (uint64_t)canUseFastLayoutSizeCalulation
{
  return 0;
}

- (void)calculateLayoutSizeFittingSize:()NUIPrivate .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE653000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)calculateLayoutSizeFittingSize:()NUIPrivate .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE653000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end