@interface CNUIAvatarLayoutManager
+ (CGRect)avatarBadgeRectForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5;
+ (double)frameForBadgeWithFrame:(double)a3 onAvatarFrame:(double)a4 withPosition:(CGFloat)a5 mediaContextFrame:(CGFloat)a6 isRTL:(CGFloat)a7;
+ (id)avatarBadgeLayerForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5;
+ (id)avatarViewLayoutConfigurationsDictionaryForType:(unint64_t)a3;
+ (id)avatarViewLayoutConfigurationsForType:(unint64_t)a3 withLayoutDelegate:(id)a4;
+ (id)avatarViewLayoutItemConfigurations:(id)a3;
+ (id)avatarViewLayoutItemConfigurations:(id)a3 withLayoutDelegate:(id)a4;
+ (id)identifierForLayoutType:(unint64_t)a3;
+ (id)layoutConfigurationsForType:(unint64_t)a3 withItemCount:(int64_t)a4;
+ (id)layoutConfigurationsForType:(unint64_t)a3 withItemCount:(int64_t)a4 withLayoutDelegate:(id)a5;
+ (int64_t)maxAvatarCountForType:(unint64_t)a3;
+ (void)applyAvatarBadgeStylingToLayer:(id)a3 badgeType:(unint64_t)a4;
+ (void)cropAvatarBadgeLayer:(id)a3 withCropStyle:(unint64_t)a4;
@end

@implementation CNUIAvatarLayoutManager

+ (id)layoutConfigurationsForType:(unint64_t)a3 withItemCount:(int64_t)a4
{
  return +[CNUIAvatarLayoutManager layoutConfigurationsForType:a3 withItemCount:a4 withLayoutDelegate:0];
}

+ (id)avatarViewLayoutConfigurationsDictionaryForType:(unint64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsDictionaryForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (avatarViewLayoutConfigurationsDictionaryForType__onceToken != -1) {
    dispatch_once(&avatarViewLayoutConfigurationsDictionaryForType__onceToken, block);
  }
  v4 = (void *)avatarViewLayoutConfigurationsDictionaryForType__jsonContents;
  v5 = +[CNUIAvatarLayoutManager identifierForLayoutType:a3];
  v6 = [v4 valueForKey:v5];

  return v6;
}

+ (id)identifierForLayoutType:(unint64_t)a3
{
  v3 = @"PlanetsAvatarLayoutConfigurations";
  if (a3 == 1) {
    v3 = @"PlanetsAvatarLayoutAdHocConfigurations";
  }
  if (a3 == 2) {
    return @"SnowglobeAvatarLayoutConfigurations";
  }
  else {
    return v3;
  }
}

+ (id)avatarViewLayoutItemConfigurations:(id)a3
{
  return +[CNUIAvatarLayoutManager avatarViewLayoutItemConfigurations:a3 withLayoutDelegate:0];
}

void __75__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsDictionaryForType___block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v0 pathForResource:@"CNUIIdentityAvatarConfiguration" ofType:@"json"];

  v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
  uint64_t v2 = [MEMORY[0x263F08900] JSONObjectWithData:v1 options:0 error:0];
  v3 = (void *)avatarViewLayoutConfigurationsDictionaryForType__jsonContents;
  avatarViewLayoutConfigurationsDictionaryForType__jsonContents = v2;
}

+ (id)layoutConfigurationsForType:(unint64_t)a3 withItemCount:(int64_t)a4 withLayoutDelegate:(id)a5
{
  id v7 = a5;
  v8 = [(id)objc_opt_class() avatarViewLayoutConfigurationsForType:a3 withLayoutDelegate:v7];

  unint64_t v9 = +[CNUIPRLikenessResolver maxContacts];
  if (v9 >= a4) {
    int64_t v10 = a4;
  }
  else {
    int64_t v10 = v9;
  }
  unint64_t v11 = v10 - 1;
  if (v10 < 1 || v11 >= [v8 count])
  {
    v12 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v12 = [v8 objectAtIndex:v11];
  }

  return v12;
}

+ (id)avatarViewLayoutConfigurationsForType:(unint64_t)a3 withLayoutDelegate:(id)a4
{
  id v6 = a4;
  id v7 = +[CNUIAvatarLayoutManager avatarViewLayoutConfigurationsDictionaryForType:a3];
  v8 = [v7 objectForKeyedSubscript:@"configurations"];
  unint64_t v9 = v8;
  switch(a3)
  {
    case 2uLL:
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke_3;
      v15[3] = &unk_2640193A0;
      v17[1] = a1;
      int64_t v10 = &v16;
      id v16 = v8;
      unint64_t v11 = (id *)v17;
      v17[0] = v6;
      if (avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_4 != -1) {
        dispatch_once(&avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_4, v15);
      }
      v12 = &avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_4;
      goto LABEL_13;
    case 1uLL:
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke_2;
      v18[3] = &unk_2640193A0;
      v20[1] = a1;
      int64_t v10 = &v19;
      id v19 = v8;
      unint64_t v11 = (id *)v20;
      v20[0] = v6;
      if (avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_3 != -1) {
        dispatch_once(&avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_3, v18);
      }
      v12 = &avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_3;
      goto LABEL_13;
    case 0uLL:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke;
      block[3] = &unk_2640193A0;
      v23[1] = a1;
      int64_t v10 = &v22;
      id v22 = v8;
      unint64_t v11 = (id *)v23;
      v23[0] = v6;
      if (avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_2 != -1) {
        dispatch_once(&avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_token_2, block);
      }
      v12 = &avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_2;
LABEL_13:
      id v13 = (id)*v12;

      goto LABEL_15;
  }
  id v13 = (id)MEMORY[0x263EFFA68];
LABEL_15:

  return v13;
}

uint64_t __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke(uint64_t a1)
{
  avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_2 = [(id)objc_opt_class() avatarViewLayoutItemConfigurations:*(void *)(a1 + 32) withLayoutDelegate:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke_2(uint64_t a1)
{
  avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_3 = [(id)objc_opt_class() avatarViewLayoutItemConfigurations:*(void *)(a1 + 32) withLayoutDelegate:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

uint64_t __84__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType_withLayoutDelegate___block_invoke_3(uint64_t a1)
{
  avatarViewLayoutConfigurationsForType_withLayoutDelegate__cn_once_object_4 = [(id)objc_opt_class() avatarViewLayoutItemConfigurations:*(void *)(a1 + 32) withLayoutDelegate:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

+ (id)avatarViewLayoutItemConfigurations:(id)a3 withLayoutDelegate:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations_withLayoutDelegate___block_invoke;
  v9[3] = &unk_2640193F0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "_cn_map:", v9);

  return v7;
}

id __81__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations_withLayoutDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"baseSize"];
  [v4 floatValue];
  double v6 = v5;

  id v7 = [v3 objectForKeyedSubscript:@"itemConfigurations"];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations_withLayoutDelegate___block_invoke_2;
  v10[3] = &unk_2640193C8;
  double v12 = v6;
  id v11 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "_cn_map:", v10);

  return v8;
}

CNUIAvatarLayoutItemConfiguration *__81__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations_withLayoutDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 valueForKey:@"size"];
  [v4 floatValue];
  double v6 = v5;

  id v7 = [v3 valueForKey:@"x"];
  [v7 floatValue];
  double v9 = v8;

  id v10 = [v3 valueForKey:@"y"];

  [v10 floatValue];
  double v12 = v11;

  id v13 = [[CNUIAvatarLayoutItemConfiguration alloc] initWithSize:*(void *)(a1 + 32) x:v6 y:v9 baseSize:v12 withLayoutDelegate:*(double *)(a1 + 40)];
  return v13;
}

+ (int64_t)maxAvatarCountForType:(unint64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CNUIAvatarLayoutManager_maxAvatarCountForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  if (maxAvatarCountForType__onceToken != -1) {
    dispatch_once(&maxAvatarCountForType__onceToken, block);
  }
  return maxAvatarCountForType__maxAvatarCount;
}

void __49__CNUIAvatarLayoutManager_maxAvatarCountForType___block_invoke(uint64_t a1)
{
  id v2 = +[CNUIAvatarLayoutManager avatarViewLayoutConfigurationsDictionaryForType:*(void *)(a1 + 32)];
  v1 = [v2 valueForKey:@"maxAvatarCount"];
  maxAvatarCountForType__maxAvatarCount = [v1 integerValue];
}

+ (id)avatarBadgeLayerForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v11 = [MEMORY[0x263F157E8] layer];
  objc_msgSend((id)objc_opt_class(), "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", a4, v5, x, y, width, height);
  objc_msgSend(v11, "setFrame:");
  [(id)objc_opt_class() applyAvatarBadgeStylingToLayer:v11 badgeType:a4];
  return v11;
}

+ (CGRect)avatarBadgeRectForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (!a4)
  {
    double v13 = 0.35;
LABEL_12:
    double v10 = a3.size.width * v13;
    double v14 = x;
    double v12 = CGRectGetMaxX(a3) - v10;
    v18.origin.double x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = width;
    v18.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v18);
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    double v13 = 0.25;
    goto LABEL_12;
  }
  if (a4 != 2)
  {
    double v12 = *MEMORY[0x263F001A8];
    double MinY = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    goto LABEL_15;
  }
  BOOL v9 = a5;
  if (a3.size.width * 0.85 >= a3.size.height * 0.85) {
    double v10 = a3.size.height * 0.85;
  }
  else {
    double v10 = a3.size.width * 0.85;
  }
  double MinY = CGRectGetMidY(a3) + v10 * -0.5;
  if (v9) {
    double v12 = x - v10 * 0.75;
  }
  else {
    double v12 = x + width * 0.75;
  }
LABEL_13:
  double v15 = v10;
LABEL_15:
  double v16 = v12;
  double v17 = v10;
  result.size.CGFloat height = v17;
  result.size.double width = v15;
  result.origin.CGFloat y = MinY;
  result.origin.double x = v16;
  return result;
}

+ (void)applyAvatarBadgeStylingToLayer:(id)a3 badgeType:(unint64_t)a4
{
  id v5 = a3;
  if (a4 <= 2)
  {
    id v6 = v5;
    [(id)objc_opt_class() cropAvatarBadgeLayer:v5 withCropStyle:qword_20B7DB6A8[a4]];
    id v5 = v6;
  }
}

+ (void)cropAvatarBadgeLayer:(id)a3 withCropStyle:(unint64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v12 = v5;
    [v5 bounds];
    double v10 = v11 * 0.25;
  }
  else
  {
    if (a4) {
      goto LABEL_9;
    }
    id v12 = v5;
    [v5 bounds];
    double v7 = v6;
    [v12 bounds];
    if (v7 >= v8) {
      double v9 = v7;
    }
    else {
      double v9 = v8;
    }
    double v10 = v9 * 0.5;
  }
  [v12 setCornerRadius:v10];
  [v12 setMasksToBounds:1];
  id v5 = v12;
LABEL_9:
}

+ (double)frameForBadgeWithFrame:(double)a3 onAvatarFrame:(double)a4 withPosition:(CGFloat)a5 mediaContextFrame:(CGFloat)a6 isRTL:(CGFloat)a7
{
  switch(a11)
  {
    case 0:
      double v52 = a4;
      CGFloat v25 = a5;
      if (a12)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v25);
        v55.origin.double x = a5;
        v55.origin.CGFloat y = a6;
        v55.size.double width = a7;
        v55.size.CGFloat height = a8;
        double MinY = CGRectGetMinY(v55);
        v56.origin.double x = a13;
        v56.origin.CGFloat y = a14;
        v56.size.CGFloat height = a16;
        v56.size.double width = a15;
        BOOL v31 = CGRectEqualToRect(v56, *MEMORY[0x263F001A8]);
        a4 = v52;
        if (!v31) {
          double MinX = MinX - (a15 + a3 * -0.5);
        }
      }
      else
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v25) - a3;
        v62.origin.double x = a5;
        v62.origin.CGFloat y = a6;
        v62.size.double width = a7;
        v62.size.CGFloat height = a8;
        double MinY = CGRectGetMinY(v62);
        v63.origin.double x = a13;
        v63.origin.CGFloat y = a14;
        v63.size.CGFloat height = a16;
        v63.size.double width = a15;
        BOOL v46 = CGRectEqualToRect(v63, *MEMORY[0x263F001A8]);
        a4 = v52;
        if (!v46) {
          double MinX = a15 + a3 * -0.5 + MinX;
        }
      }
      break;
    case 1:
      CGFloat v41 = a5;
      double v44 = a4;
      if (a12) {
        double MinX = CGRectGetMaxX(*(CGRect *)&v41) - a3;
      }
      else {
        double MinX = CGRectGetMinX(*(CGRect *)&v41);
      }
      v64.origin.double x = a5;
      v64.origin.CGFloat y = a6;
      v64.size.double width = a7;
      v64.size.CGFloat height = a8;
      CGFloat v47 = CGRectGetMinY(v64);
      a4 = v44;
      double MinY = v47;
      break;
    case 2:
      double v53 = a4;
      CGFloat v32 = a5;
      if (a12)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v32);
        v57.origin.double x = a5;
        v57.origin.CGFloat y = a6;
        v57.size.double width = a7;
        v57.size.CGFloat height = a8;
        double MinY = CGRectGetMaxY(v57) - a3;
        v58.origin.double x = a13;
        v58.origin.CGFloat y = a14;
        v58.size.CGFloat height = a16;
        v58.size.double width = a15;
        if (!CGRectEqualToRect(v58, *MEMORY[0x263F001A8])) {
          double MinX = MinX - (a15 + a3 * -0.5);
        }
      }
      else
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v32) - a3;
        v59.origin.double x = a5;
        v59.origin.CGFloat y = a6;
        v59.size.double width = a7;
        v59.size.CGFloat height = a8;
        double MinY = CGRectGetMaxY(v59) - a3;
        v60.origin.double x = a13;
        v60.origin.CGFloat y = a14;
        v60.size.CGFloat height = a16;
        v60.size.double width = a15;
        if (!CGRectEqualToRect(v60, *MEMORY[0x263F001A8])) {
          double MinX = a15 + a3 * -0.5 + MinX;
        }
      }
      a4 = v53;
      break;
    case 3:
      double v36 = a4;
      CGFloat v37 = a5;
      if (a12) {
        double MinX = CGRectGetMaxX(*(CGRect *)&v37) - a3;
      }
      else {
        double MinX = CGRectGetMinX(*(CGRect *)&v37);
      }
      v61.origin.double x = a5;
      v61.origin.CGFloat y = a6;
      v61.size.double width = a7;
      v61.size.CGFloat height = a8;
      double MinY = CGRectGetMaxY(v61) - a3;
      a4 = v36;
      break;
    default:
      double MinY = a16;
      double MinX = a15;
      break;
  }
  double v48 = MinX;
  double v49 = MinY;
  double v50 = a3;
  *(void *)&double result = (unint64_t)CGRectIntegral(*(CGRect *)(&a4 - 3));
  return result;
}

@end