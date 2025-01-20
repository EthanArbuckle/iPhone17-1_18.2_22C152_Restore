@interface UIScrollView(_CRKCardViewVisibility)
- (BOOL)_crk_subviewIsVisible:()_CRKCardViewVisibility;
@end

@implementation UIScrollView(_CRKCardViewVisibility)

- (BOOL)_crk_subviewIsVisible:()_CRKCardViewVisibility
{
  id v4 = a3;
  [a1 contentOffset];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [a1 bounds];
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  CGFloat v13 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat v14 = CGRectGetHeight(v34);
  [v4 frame];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;

  uint64_t v23 = v6;
  uint64_t v24 = v8;
  CGFloat v25 = v13;
  CGFloat v26 = v14;
  uint64_t v27 = v16;
  uint64_t v28 = v18;
  uint64_t v29 = v20;
  uint64_t v30 = v22;

  return CGRectIntersectsRect(*(CGRect *)&v23, *(CGRect *)&v27);
}

@end