@interface CNComposeHeaderView(MessageUI)
- (double)mf_scribbleFrame;
@end

@implementation CNComposeHeaderView(MessageUI)

- (double)mf_scribbleFrame
{
  v2 = [a1 labelView];
  v3 = [a1 labelView];
  [v3 bounds];
  objc_msgSend(v2, "convertRect:toView:", a1);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  [a1 bounds];
  double MaxX = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  uint64_t v20 = [a1 effectiveUserInterfaceLayoutDirection];
  uint64_t v21 = v5;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  if (v20 == 1)
  {
    CGRectGetMinX(*(CGRect *)&v21);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    [a1 bounds];
    CGRectGetMaxX(v26);
  }
  v27.origin.x = MaxX;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  CGRectGetMinX(v27);
  return MaxX;
}

@end