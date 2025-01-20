@interface SCATModernMenuCustomGesturesSheet
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (SCATMenuCustomGestureItemsViewDelegate)delegate;
- (SCATModernMenuCustomGesturesSheet)initWithType:(int)a3 menu:(id)a4;
- (id)backTitle;
- (id)makeMenuItemsIfNeeded;
- (int)type;
- (void)_loadGestures;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sheetWillAppear:(BOOL)a3;
@end

@implementation SCATModernMenuCustomGesturesSheet

- (SCATModernMenuCustomGesturesSheet)initWithType:(int)a3 menu:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuCustomGesturesSheet;
  result = [(SCATModernMenuSheet *)&v6 initWithMenu:a4];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (void)sheetWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuCustomGesturesSheet;
  [(SCATModernMenuSheet *)&v6 sheetWillAppear:a3];
  [(SCATModernMenuCustomGesturesSheet *)self _loadGestures];
  [(SCATModernMenuSheet *)self invalidateMenuItems];
  v4 = [(SCATModernMenuSheet *)self menu];
  v5 = [v4 menuVisualProvider];
  [v5 reloadMenuVisuals];
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (char *)[(NSMutableArray *)self->_gestures count];
  id v26 = +[NSMutableArray arrayWithCapacity:v3];
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = [(NSMutableArray *)self->_gestures objectAtIndex:i];
      BOOL v6 = self->_type == 1;
      v7 = [v5 name];
      if ([v5 hasLocalizableName])
      {
        uint64_t v8 = sub_100040EC8(v7);

        v7 = (void *)v8;
      }
      uint64_t v9 = 2 * v6;
      v10 = objc_msgSend(@"gestures_replay", "stringByAppendingFormat:", @"%lu", i);
      v11 = +[SCATModernMenuItem itemWithIdentifier:v10 delegate:self title:v7 imageName:0 activateBehavior:v9];

      [v11 setCustomGesture:v5];
      [v26 addObject:v11];
    }
  }
  if (!self->_type)
  {
    v12 = sub_100040EC8(@"ADD_IN_SETTINGS");
    LOBYTE(v25) = 0;
    v13 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_create" delegate:self title:v12 imageName:0 activateBehavior:2 allowedWithGuidedAccess:0 allowedWithAssistiveAccess:v25];
    [v26 addObject:v13];

    v14 = +[AXSettings sharedInstance];
    v15 = [v14 assistiveTouchRecentGestures];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    v18 = v16;
    if (v17)
    {
      id v19 = v17;
      int v20 = 0;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v16);
          }
          v20 |= [(NSMutableArray *)self->_gestures containsObject:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)] ^ 1;
        }
        id v19 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v19);

      if ((v20 & 1) == 0) {
        goto LABEL_17;
      }
      v18 = sub_100040EC8(@"ADD_RECENT");
      v23 = +[SCATModernMenuItem itemWithIdentifier:@"gestures_addRecent" delegate:self title:v18 imageName:0 activateBehavior:2];
      [v26 addObject:v23];
    }
LABEL_17:
  }

  return v26;
}

- (id)backTitle
{
  return sub_100040EC8(@"BACK_TO_GESTURES");
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  unsigned int v6 = [v5 hasPrefix:@"gestures_replay"];
  if (v6)
  {
    v7 = [(SCATModernMenuCustomGesturesSheet *)self delegate];
    uint64_t v8 = [v7 contextForCustomGestureItemsViewController:self];

    uint64_t v9 = [v4 customGesture];
    +[SCATModernMenuItem imageSize];
    double v11 = v10;
    double v13 = v12;
    [v8 frame];
    double v15 = v14;
    double v17 = v16;
    id v18 = v9;
    id v19 = +[UIScreen mainScreen];
    [v19 scale];
    CGFloat v21 = v20;
    v58.width = v11;
    v58.height = v13;
    UIGraphicsBeginImageContextWithOptions(v58, 0, v21);

    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    if (CurrentContext)
    {
      v23 = CurrentContext;
      char v48 = v6;
      v46 = v8;
      v47 = v5;
      if ([v18 shouldPerformAtOriginalLocation])
      {
        id v24 = +[SCATStyleProvider sharedStyleProvider];
        id v25 = [v24 scannerBlueColor];
        id v26 = (CGColor *)[v25 CGColor];
      }
      else
      {
        id v24 = +[UIColor whiteColor];
        id v26 = (CGColor *)[v24 CGColor];
      }
      id v49 = v4;

      CGContextSetStrokeColorWithColor(v23, v26);
      CGContextSetLineWidth(v23, 5.0);
      long long v28 = +[NSMutableSet set];
      long long v29 = (char *)[v18 numberOfEvents];
      if (v29)
      {
        for (i = 0; i != v29; ++i)
        {
          v31 = [v18 fingerIdentifiersAtEventIndex:i];
          [v28 addObjectsFromArray:v31];
        }
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v28;
      id v52 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v52)
      {
        double v32 = v11 / v15;
        uint64_t v51 = *(void *)v54;
        double v33 = v13 / v17;
        do
        {
          for (j = 0; j != v52; j = (char *)j + 1)
          {
            if (*(void *)v54 != v51) {
              objc_enumerationMutation(obj);
            }
            if (v29)
            {
              v35 = 0;
              LOBYTE(v36) = 0;
              uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
              do
              {
                char v38 = v36;
                v39 = [v18 fingerIdentifiersAtEventIndex:v35];
                unsigned int v36 = [v39 containsObject:v37];

                if (v36)
                {
                  [v18 pointForFingerIdentifier:v37 atEventIndex:v35];
                  double v42 = v32 * v40;
                  double v43 = v33 * v41;
                  if (v38)
                  {
                    CGContextAddLineToPoint(v23, v32 * v40, v33 * v41);
                  }
                  else
                  {
                    v44 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v32 * v40, v33 * v41, 5.0, 0.0, 6.28318531);
                    [v44 setLineWidth:2.0];
                    [v44 stroke];
                    CGContextBeginPath(v23);
                    CGContextMoveToPoint(v23, v42, v43);
                  }
                }
                else if (v38)
                {
                  CGContextStrokePath(v23);
                }
                ++v35;
              }
              while (v29 != v35);
              if (v36) {
                CGContextStrokePath(v23);
              }
            }
          }
          id v52 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v52);
      }

      long long v27 = UIGraphicsGetImageFromCurrentImageContext();

      id v4 = v49;
      LOBYTE(v6) = v48;
      uint64_t v8 = v46;
      v5 = v47;
    }
    else
    {
      long long v27 = 0;
    }
    UIGraphicsEndImageContext();

    [v4 setImage:v27];
  }

  return v6 ^ 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 hasPrefix:@"gestures_replay"]
    && ([v5 substringFromIndex:objc_msgSend(@"gestures_replay", "length")],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 integerValue],
        v6,
        v7 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = [(SCATModernMenuCustomGesturesSheet *)self delegate];
    double v10 = [(NSMutableArray *)self->_gestures objectAtIndexedSubscript:v7];
    [v9 customGestureItemsViewController:self didChooseGesture:v10];
  }
  else
  {
    if ([v5 isEqualToString:@"gestures_addRecent"])
    {
      uint64_t v8 = [(SCATModernMenuCustomGesturesSheet *)self delegate];
      [v8 didChooseAddRecentInCustomGestureItemsViewController:self];
    }
    else
    {
      if (![v5 isEqualToString:@"gestures_create"])
      {
        v11.receiver = self;
        v11.super_class = (Class)SCATModernMenuCustomGesturesSheet;
        [(SCATModernMenuSheet *)&v11 menuItemWasActivated:v4];
        goto LABEL_10;
      }
      uint64_t v8 = [(SCATModernMenuCustomGesturesSheet *)self delegate];
      [v8 didChooseCreateInCustomGestureItemsViewController:self];
    }
  }
LABEL_10:
}

- (void)_loadGestures
{
  v3 = +[AXSettings sharedInstance];
  id v4 = v3;
  int type = self->_type;
  if (!type)
  {
    unsigned int v6 = [v3 assistiveTouchSavedGestures];
    goto LABEL_5;
  }
  if (type == 1)
  {
    unsigned int v6 = [v3 assistiveTouchRecentGestures];
LABEL_5:
    id v7 = v6;
    uint64_t v8 = (NSMutableArray *)[v6 mutableCopy];
    gestures = self->_gestures;
    self->_gestures = v8;

    goto LABEL_7;
  }
  uint64_t v15 = self->_type;
  _AXAssert();
LABEL_7:
  if (self->_type == 1)
  {
    double v10 = [v4 assistiveTouchSavedGestures];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSMutableArray removeObject:](self->_gestures, "removeObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), v15);
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (SCATMenuCustomGestureItemsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMenuCustomGestureItemsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_gestures, 0);
}

@end