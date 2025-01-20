@interface MFComposeImageSizeView
- (MFComposeImageSizeView)initWithFrame:(CGRect)a3;
- (unint64_t)_insertIndexForScale:(unint64_t)a3;
- (unint64_t)_scaleLabelIndexForScale:(unint64_t)a3;
- (void)layoutSubviews;
- (void)removeSizeDescriptionForScale:(unint64_t)a3;
- (void)segmentedControlChanged;
- (void)setScale:(unint64_t)a3;
- (void)setSizeDescription:(id)a3 forScale:(unint64_t)a4;
@end

@implementation MFComposeImageSizeView

- (MFComposeImageSizeView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MFComposeImageSizeView;
  v3 = -[MFComposeImageSizeView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!sScaleLabels)
    {
      v4 = (void *)MEMORY[0x1E4F1C978];
      v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v21 = [v22 localizedStringForKey:@"SMALL_SIZE_BAR_TITLE" value:&stru_1F0817A00 table:@"Main"];
      v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = [v20 localizedStringForKey:@"MEDIUM_SIZE_BAR_TITLE" value:&stru_1F0817A00 table:@"Main"];
      v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = v4;
      v8 = [v6 localizedStringForKey:@"LARGE_SIZE_BAR_TITLE" value:&stru_1F0817A00 table:@"Main"];
      v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"ACTUAL_SIZE_BAR_TITLE" value:&stru_1F0817A00 table:@"Main"];
      uint64_t v11 = objc_msgSend(v7, "arrayWithObjects:", v21, v5, v8, v10, 0);
      v12 = (void *)sScaleLabels;
      sScaleLabels = v11;
    }
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visibleScales = v3->_visibleScales;
    v3->_visibleScales = v13;

    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"IMAGE_RESIZING_BAR_TITLE_EXPANDED" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeImageSizeView *)v3 setLabel:v16];

    v17 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = v17;

    [(UISegmentedControl *)v3->_segmentedControl addTarget:v3 action:sel_segmentedControlChanged forControlEvents:4096];
    [(MFComposeImageSizeView *)v3 addSubview:v3->_segmentedControl];
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MFComposeImageSizeView;
  [(MFComposeImageSizeView *)&v17 layoutSubviews];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(MFComposeImageSizeView *)self _contentRect];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGRectGetWidth(v18);
  v9 = [(MFComposeImageSizeView *)self labelView];
  [v9 frame];
  CGRectGetWidth(v19);

  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  if (v4 == 1) {
    double MinX = CGRectGetMinX(*(CGRect *)&v10);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v10);
  }
  [(MFComposeImageSizeView *)self bounds];
  UIRectCenteredYInRect();
  segmentedControl = self->_segmentedControl;
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  UIRectIntegralWithScale();
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:");
}

- (unint64_t)_scaleLabelIndexForScale:(unint64_t)a3
{
  unint64_t result = 0;
  while (MFImageScalingFlagConstants[result] != a3)
  {
    if (++result == 4) {
      return -1;
    }
  }
  return result;
}

- (unint64_t)_insertIndexForScale:(unint64_t)a3
{
  uint64_t v5 = 0;
  int v6 = 0;
  do
  {
    if (MFImageScalingFlagConstants[v5] == a3) {
      break;
    }
    visibleScales = self->_visibleScales;
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    LODWORD(visibleScales) = [(NSMutableArray *)visibleScales containsObject:v8];

    v6 += visibleScales ^ 1;
    ++v5;
  }
  while (v5 != 4);
  return (int)v5 - v6;
}

- (void)setSizeDescription:(id)a3 forScale:(unint64_t)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35 = objc_msgSend((id)sScaleLabels, "objectAtIndex:", -[MFComposeImageSizeView _scaleLabelIndexForScale:](self, "_scaleLabelIndexForScale:", a4));
  v32 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
  v33 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  uint64_t v39 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = v39;
  v40[0] = v32;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  uint64_t v37 = v7;
  v38 = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  [v35 sizeWithAttributes:v36];
  double v9 = v8;
  if (v6) {
    [v6 sizeWithAttributes:v34];
  }
  CGFloat v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  double v11 = v9 + 5.0;
  UIRectIntegralWithScale();
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v41.CGFloat width = v13;
  v41.CGFloat height = v15;
  UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  if (v17 <= 1.0) {
    double v18 = 0.0;
  }
  else {
    double v18 = 0.5;
  }

  CGRect v19 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v19 set];

  objc_msgSend(v35, "drawAtPoint:withAttributes:", v36, 0.0, 0.0);
  objc_msgSend(v6, "drawAtPoint:withAttributes:", v34, round(v11), v18);
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsPopContext();
  visibleScales = self->_visibleScales;
  v22 = [NSNumber numberWithUnsignedInteger:a4];
  int v23 = [(NSMutableArray *)visibleScales containsObject:v22];

  if (v23)
  {
    segmentedControl = self->_segmentedControl;
    v25 = self->_visibleScales;
    v26 = [NSNumber numberWithUnsignedInteger:a4];
    [(UISegmentedControl *)segmentedControl setImage:v20 forSegmentAtIndex:[(NSMutableArray *)v25 indexOfObject:v26]];
  }
  else
  {
    unint64_t v27 = [(MFComposeImageSizeView *)self _insertIndexForScale:a4];
    [(UISegmentedControl *)self->_segmentedControl insertSegmentWithImage:v20 atIndex:v27 animated:0];
    v28 = self->_visibleScales;
    v26 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableArray *)v28 insertObject:v26 atIndex:v27];
  }

  v29 = self->_segmentedControl;
  v30 = self->_visibleScales;
  v31 = [NSNumber numberWithUnsignedInteger:a4];
  [(UISegmentedControl *)v29 setEnabled:v6 != 0 forSegmentAtIndex:[(NSMutableArray *)v30 indexOfObject:v31]];
}

- (void)removeSizeDescriptionForScale:(unint64_t)a3
{
  visibleScales = self->_visibleScales;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [(NSMutableArray *)visibleScales indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(UISegmentedControl *)self->_segmentedControl removeSegmentAtIndex:v6 animated:0];
    uint64_t v7 = self->_visibleScales;
    [(NSMutableArray *)v7 removeObjectAtIndex:v6];
  }
}

- (void)setScale:(unint64_t)a3
{
  segmentedControl = self->_segmentedControl;
  visibleScales = self->_visibleScales;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  -[UISegmentedControl setSelectedSegmentIndex:](segmentedControl, "setSelectedSegmentIndex:", -[NSMutableArray indexOfObject:](visibleScales, "indexOfObject:"));
}

- (void)segmentedControlChanged
{
  v3 = [(NSMutableArray *)self->_visibleScales objectAtIndexedSubscript:[(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex]];
  uint64_t v4 = (int)[v3 intValue];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MFComposeImageSizeView_segmentedControlChanged__block_invoke;
  v5[3] = &unk_1E5F79178;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __49__MFComposeImageSizeView_segmentedControlChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 imageSizeView:*(void *)(a1 + 32) changedSelectedScaleTo:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleScales, 0);

  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end