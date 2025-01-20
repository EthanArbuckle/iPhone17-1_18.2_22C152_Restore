@interface SCATModernMenuSideAppSheet
+ (BOOL)handleActivateSideAppMenuItemWithIdentifier:(id)a3;
+ (id)makeSideAppMenuItemForGesture:(unint64_t)a3 delegate:(id)a4;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuSideAppSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[AXSpringBoardServer server];
  v4 = [v3 allowedMedusaGestures];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend((id)objc_opt_class(), "makeSideAppMenuItemForGesture:delegate:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (void)v13), self);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)makeSideAppMenuItemForGesture:(unint64_t)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = sub_100040D84(a3);
  if (a3 > 0x10) {
    id v7 = 0;
  }
  else {
    id v7 = off_1001ADC00[a3];
  }
  id v8 = objc_msgSend(@"sideApp_gesture", "stringByAppendingFormat:", @"%lu", a3);
  uint64_t v9 = +[SCATModernMenuItem itemWithIdentifier:v8 delegate:v5 title:v6 imageName:v7 activateBehavior:0];

  [v9 setShouldFlipForRTL:1];

  return v9;
}

+ (BOOL)handleActivateSideAppMenuItemWithIdentifier:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 hasPrefix:@"sideApp_gesture"];
  if (v4)
  {
    id v5 = [v3 substringFromIndex:objc_msgSend(@"sideApp_gesture", "length")];
    id v6 = [v5 integerValue];

    id v7 = +[AXSpringBoardServer server];
    [v7 performMedusaGesture:v6];
  }
  return v4;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 identifier];
  LOBYTE(v5) = [(id)v5 handleActivateSideAppMenuItemWithIdentifier:v6];

  if ((v5 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SCATModernMenuSideAppSheet;
    [(SCATModernMenuSheet *)&v7 menuItemWasActivated:v4];
  }
}

@end