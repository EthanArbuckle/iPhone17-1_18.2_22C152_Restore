@interface FKAScrollView
- (BOOL)canBecomeFocused;
- (id)_accessibilityKeyCommands;
- (void)_scrollDown:(id)a3;
- (void)_scrollInXDirection:(double)a3 yDirection:(double)a4;
- (void)_scrollUp:(id)a3;
@end

@implementation FKAScrollView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_scrollInXDirection:(double)a3 yDirection:(double)a4
{
  [(FKAScrollView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v34 = v7;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(FKAScrollView *)self contentSize];
  double v13 = v12;
  double v15 = v14;
  [(FKAScrollView *)self contentInset];
  double v19 = 0.0 - v18;
  double v21 = 0.0 - v20;
  double v22 = v13 - (-v17 - v18);
  double v23 = v15 - (-v16 - v20);
  [(FKAScrollView *)self contentOffset];
  double v35 = v25;
  double v37 = v24;
  v40.origin.x = v19;
  v40.origin.y = v21;
  v40.size.width = v22;
  v40.size.height = v23;
  double Width = CGRectGetWidth(v40);
  v41.origin.x = v6;
  v41.origin.y = v34;
  v41.size.width = v9;
  v41.size.height = v11;
  if (Width > CGRectGetWidth(v41))
  {
    v42.origin.x = v6;
    v42.origin.y = v34;
    v42.size.width = v9;
    v42.size.height = v11;
    double v27 = v37 + a3 * 0.5 * CGRectGetWidth(v42);
    v43.origin.x = v19;
    v43.origin.y = v21;
    v43.size.width = v22;
    v43.size.height = v23;
    double v38 = fmax(CGRectGetMinX(v43), v27);
    v44.origin.x = v19;
    v44.origin.y = v21;
    v44.size.width = v22;
    v44.size.height = v23;
    double MaxX = CGRectGetMaxX(v44);
    v45.origin.x = v6;
    v45.origin.y = v34;
    v45.size.width = v9;
    v45.size.height = v11;
    double v37 = fmin(MaxX - CGRectGetWidth(v45), v38);
  }
  v46.origin.x = v19;
  v46.origin.y = v21;
  v46.size.width = v22;
  v46.size.height = v23;
  double Height = CGRectGetHeight(v46);
  v47.origin.x = v6;
  v47.size.height = v11;
  v47.origin.y = v34;
  v47.size.width = v9;
  if (Height > CGRectGetHeight(v47))
  {
    v48.size.height = v11;
    v48.origin.x = v6;
    v48.origin.y = v34;
    v48.size.width = v9;
    double v30 = v35 + a4 * 0.5 * CGRectGetHeight(v48);
    v49.origin.x = v19;
    v49.origin.y = v21;
    v49.size.width = v22;
    v49.size.height = v23;
    double v36 = fmax(CGRectGetMinY(v49), v30);
    v50.origin.x = v19;
    v50.origin.y = v21;
    v50.size.width = v22;
    v50.size.height = v23;
    double MaxY = CGRectGetMaxY(v50);
    v51.origin.x = v6;
    v51.origin.y = v34;
    v51.size.width = v9;
    v51.size.height = v11;
    double v35 = fmin(MaxY - CGRectGetHeight(v51), v36);
  }
  -[FKAScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v37, v35);
}

- (void)_scrollUp:(id)a3
{
}

- (void)_scrollDown:(id)a3
{
}

- (id)_accessibilityKeyCommands
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0 action:sel__scrollUp_];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0 action:sel__scrollDown_];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

@end