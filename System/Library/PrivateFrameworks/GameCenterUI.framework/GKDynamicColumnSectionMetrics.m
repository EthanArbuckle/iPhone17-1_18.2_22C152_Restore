@interface GKDynamicColumnSectionMetrics
+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4;
+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4 forIdiom:(int64_t)a5;
- (CGSize)itemSizeForCollectionView:(id)a3;
- (GKDynamicColumnSectionMetrics)initWithIdiom:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)columnsInLandscape;
- (unint64_t)columnsInPortrait;
- (void)setColumnsInLandscape:(unint64_t)a3;
- (void)setColumnsInPortrait:(unint64_t)a3;
- (void)updateColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4;
@end

@implementation GKDynamicColumnSectionMetrics

+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4 forIdiom:(int64_t)a5
{
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdiom:a5];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = NSString;
    v10 = [NSString stringWithFormat:@"Assertion failed"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v12 = [v11 lastPathComponent];
    v13 = [v9 stringWithFormat:@"%@ (portraitColumnCount > 0)\n[%s (%s:%d)]", v10, "+[GKDynamicColumnSectionMetrics dynamicColumnSectionMetricsWithColumnsInPortrait:columnsInLandscape:forIdiom:]", objc_msgSend(v12, "UTF8String"), 637];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v13 format];
    if (a4) {
      goto LABEL_3;
    }
  }
  v14 = NSString;
  v15 = [NSString stringWithFormat:@"Assertion failed"];
  v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
  id v17 = [v16 lastPathComponent];
  v18 = [v14 stringWithFormat:@"%@ (landscapeColumnCount > 0)\n[%s (%s:%d)]", v15, "+[GKDynamicColumnSectionMetrics dynamicColumnSectionMetricsWithColumnsInPortrait:columnsInLandscape:forIdiom:]", objc_msgSend(v17, "UTF8String"), 638];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v18 format];
LABEL_3:
  [v7 setColumnsInPortrait:a3];
  [v7 setColumnsInLandscape:a4];

  return v7;
}

+ (id)dynamicColumnSectionMetricsWithColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4
{
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v9 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = !v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (id)[a1 dynamicColumnSectionMetricsWithColumnsInPortrait:a3 columnsInLandscape:a4 forIdiom:v10];
}

- (GKDynamicColumnSectionMetrics)initWithIdiom:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDynamicColumnSectionMetrics;
  result = -[GKSectionMetrics initWithIdiom:](&v6, sel_initWithIdiom_);
  if (result)
  {
    result->_columnsInLandscape = 2;
    unint64_t v5 = 1;
    if (a3 == 1) {
      unint64_t v5 = 2;
    }
    result->_columnsInPortrait = v5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKDynamicColumnSectionMetrics;
  id v4 = [(GKSectionMetrics *)&v7 copyWithZone:a3];
  unint64_t v5 = v4;
  if (v4)
  {
    [v4 setColumnsInPortrait:self->_columnsInPortrait];
    [v5 setColumnsInLandscape:self->_columnsInLandscape];
  }
  return v5;
}

- (CGSize)itemSizeForCollectionView:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GKDynamicColumnSectionMetrics;
  id v4 = a3;
  [(GKSectionMetrics *)&v18 itemSizeForCollectionView:v4];
  double v6 = v5;
  objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v18.receiver, v18.super_class);
  unint64_t v8 = [v7 statusBarOrientation] - 3;

  BOOL v9 = &OBJC_IVAR___GKDynamicColumnSectionMetrics__columnsInPortrait;
  if (v8 < 2) {
    BOOL v9 = &OBJC_IVAR___GKDynamicColumnSectionMetrics__columnsInLandscape;
  }
  unint64_t v10 = *(unint64_t *)((char *)&self->super.super.super.isa + *v9);
  [v4 bounds];
  double v12 = v11;

  [(GKSectionMetrics *)self padding];
  float v15 = (v12 - (v13 + v14)) / (double)v10;
  double v16 = floorf(v15);
  double v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)updateColumnsInPortrait:(unint64_t)a3 columnsInLandscape:(unint64_t)a4
{
  [(GKDynamicColumnSectionMetrics *)self setColumnsInLandscape:a4];

  [(GKDynamicColumnSectionMetrics *)self setColumnsInPortrait:a3];
}

- (unint64_t)columnsInPortrait
{
  return self->_columnsInPortrait;
}

- (void)setColumnsInPortrait:(unint64_t)a3
{
  self->_columnsInPortrait = a3;
}

- (unint64_t)columnsInLandscape
{
  return self->_columnsInLandscape;
}

- (void)setColumnsInLandscape:(unint64_t)a3
{
  self->_columnsInLandscape = a3;
}

@end