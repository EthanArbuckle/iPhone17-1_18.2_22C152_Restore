@interface MessageListStatusIndicatorManager
+ (id)log;
- (CGRect)_layoutHorizontalStatusIndicatorViewsInRect:(CGRect)a3 contentView:(id)a4 midX:(double)MidX pointY:(double)a6 shouldAlignWithCenter:(BOOL)a7;
- (LayoutStatusIndicatorInfo)layoutStatusIndicatorViewsInRect:(SEL)a3 contentView:(CGRect)a4 verticalPositions:(id)a5 avatarVerticalPostions:(id)a6 horizontalPoint:(id)a7 shouldAlignWithCenter:(CGPoint)a8;
- (NSArray)statusIndicatorViews;
- (id)_accessibilityIdentifierForTier:(unint64_t)a3;
- (id)_createStatusIndicatorViews:(unint64_t)a3;
- (id)horizontalStatusIndicatorViews;
- (id)primaryStatusIndicatorImage;
- (id)verticalStatusIndicatorViews;
- (unint64_t)tierForIndicator:(unint64_t)a3;
- (void)_setUpIndicatorViews;
- (void)prepareForReuse;
@end

@implementation MessageListStatusIndicatorManager

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_39A8;
  block[3] = &unk_18638;
  block[4] = a1;
  if (qword_1F018 != -1) {
    dispatch_once(&qword_1F018, block);
  }
  v2 = (void *)qword_1F010;

  return v2;
}

- (NSArray)statusIndicatorViews
{
  id v2 = [(NSMutableArray *)self->_statusIndicatorViews copy];

  return (NSArray *)v2;
}

- (id)primaryStatusIndicatorImage
{
  uint64_t v3 = 0;
  do
  {
    v4 = [(MessageStatusIndicatorManager *)self statusIndicatorImageWithOptionsMask:qword_11250[v3]];
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 2;
    }
    ++v3;
  }
  while (!v5);

  return v4;
}

- (unint64_t)tierForIndicator:(unint64_t)a3
{
  unint64_t result = 0;
  v4 = &qword_11250;
  for (i = &qword_11250; ; ++i)
  {
    v6 = result >= 3 ? v4 : i;
    if ((*v6 & a3) != 0) {
      break;
    }
    ++result;
    ++v4;
    if (result == 12) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id)_accessibilityIdentifierForTier:(unint64_t)a3
{
  uint64_t v3 = &qword_11250[a3];
  if (a3 >= 3) {
    uint64_t v3 = (uint64_t *)((char *)&unk_11268 + 8 * a3 - 24);
  }
  uint64_t v4 = *v3;
  if (v4)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewUnread;
    goto LABEL_15;
  }
  if ((v4 & 4) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewFlagged;
    goto LABEL_15;
  }
  if ((v4 & 2) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewVIP;
    goto LABEL_15;
  }
  if ((v4 & 0x100) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewBlockedSender;
    goto LABEL_15;
  }
  if ((v4 & 0x20) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewAttachment;
    goto LABEL_15;
  }
  if ((v4 & 0x18) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewRepliedForwarded;
LABEL_15:
    id v6 = *v5;
    goto LABEL_16;
  }
  if ((v4 & 0x40) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewNotify;
    goto LABEL_15;
  }
  if ((v4 & 0x80) != 0)
  {
    BOOL v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewMute;
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_16:

  return v6;
}

- (void)_setUpIndicatorViews
{
  statusIndicatorViews = self->_statusIndicatorViews;
  if (statusIndicatorViews) {
    [(NSMutableArray *)statusIndicatorViews makeObjectsPerformSelector:"removeFromSuperview"];
  }
  uint64_t v4 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:12];
  BOOL v5 = self->_statusIndicatorViews;
  self->_statusIndicatorViews = v4;

  for (uint64_t i = 0; i != 12; ++i)
  {
    id v7 = objc_alloc_init((Class)UIImageView);
    v8 = [(MessageListStatusIndicatorManager *)self _accessibilityIdentifierForTier:i];
    [v7 setAccessibilityIdentifier:v8];

    [(NSMutableArray *)self->_statusIndicatorViews addObject:v7];
  }
}

- (CGRect)_layoutHorizontalStatusIndicatorViewsInRect:(CGRect)a3 contentView:(id)a4 midX:(double)MidX pointY:(double)a6 shouldAlignWithCenter:(BOOL)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v50 = a4;
  if (pthread_main_np() != 1)
  {
    v49 = +[NSAssertionHandler currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"MessageListStatusIndicatorManager.m" lineNumber:151 description:@"Current thread must be main"];
  }
  unsigned int v16 = objc_msgSend(v50, "mf_prefersRightToLeftInterfaceLayout");
  [(MessageStatusIndicatorManager *)self midXToMidXSpacing];
  v55[1] = 3221225472;
  v55[0] = _NSConcreteStackBlock;
  v55[2] = sub_4068;
  v55[3] = &unk_18660;
  if (!v16) {
    double v17 = -v17;
  }
  double v57 = v17;
  BOOL v59 = a7;
  id v18 = v50;
  id v56 = v18;
  double v58 = a6;
  v19 = objc_retainBlock(v55);
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;
  if (v16) {
    double MinX = CGRectGetMinX(*(CGRect *)&v20);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v20);
  }
  [(MessageListStatusIndicatorManager *)self horizontalStatusIndicatorViews];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [v25 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v26)
  {
    char v27 = 0;
    uint64_t v28 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v31 = [v30 image];
        [v31 size];
        double v33 = v32;
        double v35 = v34;

        CGFloat v36 = ((double (*)(void *, void, double, double, double, double, double))v19[2])(v19, v27 & 1, 0.0, 0.0, v33, v35, MidX);
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        objc_msgSend(v30, "setFrame:");
        [v30 frame];
        MidX = CGRectGetMidX(v61);
        v43 = [v30 superview];
        BOOL v44 = v43 == 0;

        if (v44) {
          [v18 addSubview:v30];
        }
        char v27 = 1;
      }
      id v26 = [v25 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v26);
  }
  else
  {
    CGFloat v36 = CGRectZero.origin.x;
    CGFloat v38 = CGRectZero.origin.y;
    CGFloat v40 = CGRectZero.size.width;
    CGFloat v42 = CGRectZero.size.height;
  }

  double v45 = v36;
  double v46 = v38;
  double v47 = v40;
  double v48 = v42;
  result.size.CGFloat height = v48;
  result.size.CGFloat width = v47;
  result.origin.CGFloat y = v46;
  result.origin.CGFloat x = v45;
  return result;
}

- (id)verticalStatusIndicatorViews
{
  return [(MessageListStatusIndicatorManager *)self _createStatusIndicatorViews:1];
}

- (id)horizontalStatusIndicatorViews
{
  return [(MessageListStatusIndicatorManager *)self _createStatusIndicatorViews:2];
}

- (id)_createStatusIndicatorViews:(unint64_t)a3
{
  if (pthread_main_np() != 1)
  {
    id v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MessageListStatusIndicatorManager.m" lineNumber:202 description:@"Current thread must be main"];
  }
  if (a3 == 3)
  {
    id v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MessageListStatusIndicatorManager.m" lineNumber:203 description:@"Cannot create status indicator views for MessageStatusIndicatorPositionsAll"];
  }
  statusIndicatorViews = self->_statusIndicatorViews;
  if (!statusIndicatorViews || [(NSMutableArray *)statusIndicatorViews count] != &dword_C) {
    [(MessageListStatusIndicatorManager *)self _setUpIndicatorViews];
  }
  if ([(MessageStatusIndicatorManager *)self effectiveIndicatorOptions])
  {
    id v28 = +[NSMutableArray array];
    uint64_t v27 = (uint64_t)&v27;
    if (a3 == 2) {
      unint64_t v7 = 3;
    }
    else {
      unint64_t v7 = 0;
    }
    uint64_t v8 = (((uint64_t)(a3 << 63) >> 63) & 3) + (((uint64_t)(a3 << 62) >> 63) & 9);
    if (v8)
    {
      v9 = (uint64_t *)((char *)&unk_11268 + 8 * v7 - 24);
      v10 = &qword_11250[v7];
      do
      {
        if (v7 >= 3) {
          v11 = v9;
        }
        else {
          v11 = v10;
        }
        uint64_t v12 = *v11;
        v13 = -[MessageStatusIndicatorManager statusIndicatorColorWithOptionsMask:](self, "statusIndicatorColorWithOptionsMask:", *v11, v27);
        v14 = [(MessageStatusIndicatorManager *)self statusIndicatorImageWithOptionsMask:v12];
        v15 = [(NSMutableArray *)self->_statusIndicatorViews objectAtIndexedSubscript:v7];
        unsigned int v16 = v15;
        if (v14)
        {
          [v15 setImage:v14];
          [v16 setTintColor:v13];
          [v16 setTintAdjustmentMode:1];
          long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v29[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
          v29[1] = v17;
          v29[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          [v16 setTransform:v29];
          double v18 = 1.0;
          [v28 addObject:v16];
        }
        else
        {
          double v18 = 0.0;
        }
        objc_msgSend(v16, "mf_setAlpha:", v18);

        ++v9;
        ++v10;
        ++v7;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v19 = self->_statusIndicatorViews;
    id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v31;
      do
      {
        CGFloat v22 = 0;
        do
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v22), "mf_setAlpha:", 0.0);
          CGFloat v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v28 = &__NSArray0__struct;
  }
  id v23 = v28;

  return v23;
}

- (LayoutStatusIndicatorInfo)layoutStatusIndicatorViewsInRect:(SEL)a3 contentView:(CGRect)a4 verticalPositions:(id)a5 avatarVerticalPostions:(id)a6 horizontalPoint:(id)a7 shouldAlignWithCenter:(CGPoint)a8
{
  BOOL v49 = a9;
  CGPoint v48 = a8;
  double y = a4.origin.y;
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  id v54 = a5;
  id v52 = a6;
  id v15 = a7;
  if (pthread_main_np() != 1)
  {
    double v47 = +[NSAssertionHandler currentHandler];
    [v47 handleFailureInMethod:a3 object:self file:@"MessageListStatusIndicatorManager.m" lineNumber:249 description:@"Current thread must be main"];
  }
  CGSize size = CGRectZero.size;
  retstr->var0.origin = CGRectZero.origin;
  retstr->var0.CGSize size = size;
  retstr->var1 = 0;
  double v17 = x;
  size.double width = y;
  double v18 = width;
  double v19 = height;
  double MinY = CGRectGetMinY(*(CGRect *)((char *)&size - 8));
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  double MaxY = CGRectGetMaxY(v56);
  CGFloat v22 = [(MessageListStatusIndicatorManager *)self verticalStatusIndicatorViews];
  id v23 = [v15 count];
  v24 = v52;
  if (v23) {
    v24 = v15;
  }
  id v25 = v24;
  if (!v49) {
    [v15 count];
  }
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  unint64_t v28 = 0;
  while (v27 < (unint64_t)objc_msgSend(v22, "count", *(void *)&v48.x, *(void *)&v48.y))
  {
    v29 = [v22 objectAtIndex:v27];
    long long v30 = [v29 image];
    [v30 size];
    double v32 = v31;
    double v34 = v33;

    UIRoundToViewScale();
    double v36 = v35;
    if (v28 >= (unint64_t)[v25 count]
      || ([v25 objectAtIndex:v28],
          double v37 = objc_claimAutoreleasedReturnValue(),
          [v37 floatValue],
          float v39 = v38,
          ++v28,
          v37,
          v39 == 0.0))
    {
      [v29 setAlpha:0.0];
    }
    else
    {
      UIRoundToViewScale();
      double MinY = v39 - v41;
      retstr->var1 = ++v26;
    }
    objc_msgSend(v29, "setFrame:", x + v36, MinY, v32, v34);
    [v29 frame];
    if (CGRectGetMaxY(v57) > MaxY)
    {
      [v29 setAlpha:0.0];
      retstr->var1 = v26 - 1;

      break;
    }
    CGFloat v40 = [v29 superview];

    if (!v40) {
      [v54 addSubview:v29];
    }

    ++v27;
  }
  -[MessageListStatusIndicatorManager _layoutHorizontalStatusIndicatorViewsInRect:contentView:midX:pointY:shouldAlignWithCenter:](self, "_layoutHorizontalStatusIndicatorViewsInRect:contentView:midX:pointY:shouldAlignWithCenter:", v54, v49, x, y, width, height, v48.x, v48.y);
  retstr->var0.origin.double x = v42;
  retstr->var0.origin.double y = v43;
  retstr->var0.size.double width = v44;
  retstr->var0.size.double height = v45;

  return result;
}

- (void)prepareForReuse
{
  [(MessageStatusIndicatorManager *)self setFlagColors:0];
  [(MessageStatusIndicatorManager *)self setIndicatorOptions:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_statusIndicatorViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setImage:", 0, (void)v8);
        [v7 removeFromSuperview];
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end