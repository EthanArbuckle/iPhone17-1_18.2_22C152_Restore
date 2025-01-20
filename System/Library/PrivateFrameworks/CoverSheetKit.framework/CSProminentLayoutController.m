@interface CSProminentLayoutController
+ (CGRect)boundsForElements:(unint64_t)a3;
+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4;
+ (CGRect)editingBoundsForElements:(unint64_t)a3;
+ (CGRect)editingFrameForElements:(unint64_t)a3;
+ (CGRect)frameForElements:(unint64_t)a3;
+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4;
+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 forcePortraitBounds:(BOOL)a5;
+ (CGRect)tightBoundsForElements:(unint64_t)a3;
+ (CGRect)tightFrameForElements:(unint64_t)a3;
+ (double)_landscapeReductionFactor;
+ (double)_safeAreaTopInset:(unint64_t)a3;
+ (double)complicationElementBoundingHeight;
+ (double)complicationElementBoundingTopY;
+ (double)complicationElementEditingOffset;
+ (double)complicationElementEditingReticleInset;
+ (double)fontSizeForElementType:(unint64_t)a3 isLandscapeVariant:(BOOL)a4;
+ (double)fontWeightForElementType:(unint64_t)a3;
+ (double)fontWeightForElementType:(unint64_t)a3 familyName:(id)a4;
+ (double)landscapePadSubtitleElementBoundingTopY;
+ (double)landscapePadTimeElementBoundingTopY;
+ (double)leadingLandscapeLayoutInset;
+ (double)leadingPortraitLayoutInset;
+ (double)reticlePortraitLayoutInset;
+ (double)reticleSpacing;
+ (double)subtitleElementBoundingTopY;
+ (double)subtitleElementFontSize;
+ (double)timeElementBoundingHeight;
+ (double)timeElementBoundingTopY;
+ (double)timeElementFontSize;
+ (double)timeElementReticleInset;
+ (double)timeTightBoundingHeight;
- (BOOL)_isPortraitForBoundingRect:(CGRect)a3;
- (BOOL)fourDigitTime;
- (BOOL)shouldCenterElementsInBoundingRect:(CGRect)a3;
- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4 variant:(unint64_t)a5;
- (CGRect)_quickActionLeadingElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CGRect)_quickActionTrailingElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CGRect)_quickActionsFrameWithMinX:(double)a3 boundingRect:(CGRect)a4;
- (CGRect)_quickActionsLeadingFrameWithBoundingRect:(CGRect)a3;
- (CGRect)_quickActionsTrailingFrameWithBoundingRect:(CGRect)a3;
- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5;
- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)complicationRowElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CGRect)complicationSidebarElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CGRect)editingBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)editingFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)editingNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)editingNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)editingReticleFrameForElement:(unint64_t)a3 withBoundingRect:(CGRect)result;
- (CGRect)elementHorizontalFrameInBoundingRect:(CGRect)a3 forElementType:(unint64_t)a4;
- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5;
- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)normalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)normalizedBoundsForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5;
- (CGRect)normalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)normalizedFrameForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5;
- (CGRect)subtitleElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CGRect)tightBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)tightFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)tightNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)tightNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4;
- (CGRect)timeElementEditingReticleFrameWithBoundingRect:(CGRect)a3;
- (CSProminentLayoutController)initWithTraitEnvironment:(id)a3;
- (UITraitEnvironment)traitEnvironment;
- (double)_padElementWidth;
- (double)leadingLandscapeLayoutInset;
- (double)leadingPortraitLayoutInset;
- (double)padTimeElementBoundingWidth;
- (double)subtitleElementBoundingHeight;
- (double)subtitleElementEditingOffset;
- (int64_t)numberingSystem;
- (void)setFourDigitTime:(BOOL)a3;
- (void)setNumberingSystem:(int64_t)a3;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation CSProminentLayoutController

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (CSProminentLayoutController)initWithTraitEnvironment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSProminentLayoutController;
  v5 = [(CSProminentLayoutController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_traitEnvironment, v4);
  }

  return v6;
}

+ (CGRect)frameForElements:(unint64_t)a3
{
  [a1 frameForElements:a3 variant:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3
{
  [a1 boundsForElements:a3 variant:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  [a1 frameForElements:a3 variant:a4 forcePortraitBounds:0];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 forcePortraitBounds:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  if (!frameForElements_variant_forcePortraitBounds__mainScreenLayoutController)
  {
    v9 = [[CSProminentLayoutController alloc] initWithTraitEnvironment:v8];
    v10 = (void *)frameForElements_variant_forcePortraitBounds__mainScreenLayoutController;
    frameForElements_variant_forcePortraitBounds__mainScreenLayoutController = (uint64_t)v9;
  }
  [v8 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = v11;
  if (v5 && v17 > v11)
  {
    double v11 = v17;
    double v19 = v13;
  }
  else
  {
    double v18 = v17;
    double v19 = v15;
    double v15 = v13;
  }
  objc_msgSend((id)frameForElements_variant_forcePortraitBounds__mainScreenLayoutController, "frameForElements:variant:withBoundingRect:", a3, a4, v15, v19, v18, v11);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  [a1 frameForElements:a3 variant:a4];
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  char v10 = a3;
  CGFloat v13 = *MEMORY[0x1E4F1DB20];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3)
  {
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 1, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    v64.origin.double x = v24;
    v64.origin.double y = v25;
    v64.size.double width = v26;
    v64.size.double height = v27;
    v50.origin.double x = v13;
    v50.origin.double y = v12;
    v50.size.double width = v15;
    v50.size.double height = v14;
    CGRect v51 = CGRectUnion(v50, v64);
    CGFloat v13 = v51.origin.x;
    CGFloat v12 = v51.origin.y;
    CGFloat v15 = v51.size.width;
    CGFloat v14 = v51.size.height;
    if ((v10 & 2) == 0)
    {
LABEL_3:
      if ((v10 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 2, a4, x, y, width, height);
  v65.origin.double x = v28;
  v65.origin.double y = v29;
  v65.size.double width = v30;
  v65.size.double height = v31;
  v52.origin.double x = v13;
  v52.origin.double y = v12;
  v52.size.double width = v15;
  v52.size.double height = v14;
  CGRect v53 = CGRectUnion(v52, v65);
  CGFloat v13 = v53.origin.x;
  CGFloat v12 = v53.origin.y;
  CGFloat v15 = v53.size.width;
  CGFloat v14 = v53.size.height;
  if ((v10 & 4) == 0)
  {
LABEL_4:
    if ((v10 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 4, a4, x, y, width, height);
  v66.origin.double x = v32;
  v66.origin.double y = v33;
  v66.size.double width = v34;
  v66.size.double height = v35;
  v54.origin.double x = v13;
  v54.origin.double y = v12;
  v54.size.double width = v15;
  v54.size.double height = v14;
  CGRect v55 = CGRectUnion(v54, v66);
  CGFloat v13 = v55.origin.x;
  CGFloat v12 = v55.origin.y;
  CGFloat v15 = v55.size.width;
  CGFloat v14 = v55.size.height;
  if ((v10 & 8) == 0)
  {
LABEL_5:
    if ((v10 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 8, a4, x, y, width, height);
  v67.origin.double x = v36;
  v67.origin.double y = v37;
  v67.size.double width = v38;
  v67.size.double height = v39;
  v56.origin.double x = v13;
  v56.origin.double y = v12;
  v56.size.double width = v15;
  v56.size.double height = v14;
  CGRect v57 = CGRectUnion(v56, v67);
  CGFloat v13 = v57.origin.x;
  CGFloat v12 = v57.origin.y;
  CGFloat v15 = v57.size.width;
  CGFloat v14 = v57.size.height;
  if ((v10 & 0x10) == 0)
  {
LABEL_6:
    if ((v10 & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 64, a4, x, y, width, height);
    v69.origin.double x = v44;
    v69.origin.double y = v45;
    v69.size.double width = v46;
    v69.size.double height = v47;
    v60.origin.double x = v13;
    v60.origin.double y = v12;
    v60.size.double width = v15;
    v60.size.double height = v14;
    CGRect v61 = CGRectUnion(v60, v69);
    CGFloat v13 = v61.origin.x;
    CGFloat v12 = v61.origin.y;
    CGFloat v15 = v61.size.width;
    CGFloat v14 = v61.size.height;
    if ((v10 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 16, a4, x, y, width, height);
  v68.origin.double x = v40;
  v68.origin.double y = v41;
  v68.size.double width = v42;
  v68.size.double height = v43;
  v58.origin.double x = v13;
  v58.origin.double y = v12;
  v58.size.double width = v15;
  v58.size.double height = v14;
  CGRect v59 = CGRectUnion(v58, v68);
  CGFloat v13 = v59.origin.x;
  CGFloat v12 = v59.origin.y;
  CGFloat v15 = v59.size.width;
  CGFloat v14 = v59.size.height;
  if ((v10 & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if (v10 < 0)
  {
LABEL_8:
    -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", 128, a4, x, y, width, height);
    v63.origin.double x = v16;
    v63.origin.double y = v17;
    v63.size.double width = v18;
    v63.size.double height = v19;
    v48.origin.double x = v13;
    v48.origin.double y = v12;
    v48.size.double width = v15;
    v48.size.double height = v14;
    CGRect v49 = CGRectUnion(v48, v63);
    CGFloat v13 = v49.origin.x;
    CGFloat v12 = v49.origin.y;
    CGFloat v15 = v49.size.width;
    CGFloat v14 = v49.size.height;
  }
LABEL_9:
  double v20 = v13;
  double v21 = v12;
  double v22 = v15;
  double v23 = v14;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)normalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)normalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)normalizedFrameForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, a4, a5.origin.x, a5.origin.y);
  double v8 = v7 / width;
  double v10 = v9 / height;
  double v12 = v11 / width;
  double v14 = v13 / height;
  result.size.double height = v14;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v8;
  return result;
}

- (CGRect)normalizedBoundsForElements:(unint64_t)a3 variant:(unint64_t)a4 inBoundingRect:(CGRect)a5
{
  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)tightFrameForElements:(unint64_t)a3
{
  [a1 frameForElements:a3 variant:1];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (CGRect)tightBoundsForElements:(unint64_t)a3
{
  [a1 boundsForElements:a3 variant:1];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)tightFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)tightBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)tightNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)tightNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (CGRect)editingFrameForElements:(unint64_t)a3
{
  [a1 frameForElements:a3 variant:2];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (CGRect)editingBoundsForElements:(unint64_t)a3
{
  [a1 boundsForElements:a3 variant:2];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)editingFrameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)editingBoundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)editingNormalizedFrameForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedFrameForElements:variant:inBoundingRect:](self, "normalizedFrameForElements:variant:inBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)editingNormalizedBoundsForElements:(unint64_t)a3 inBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController normalizedBoundsForElements:variant:inBoundingRect:](self, "normalizedBoundsForElements:variant:inBoundingRect:", a3, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[CSProminentLayoutController _frameForElement:withBoundingRect:variant:](self, "_frameForElement:withBoundingRect:variant:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_frameForElement:(unint64_t)a3 withBoundingRect:(CGRect)a4 variant:(unint64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a5 == 3)
  {
    -[CSProminentLayoutController editingReticleFrameForElement:withBoundingRect:](self, "editingReticleFrameForElement:withBoundingRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    double MinX = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    goto LABEL_44;
  }
  -[CSProminentLayoutController elementHorizontalFrameInBoundingRect:forElementType:](self, "elementHorizontalFrameInBoundingRect:forElementType:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  CGFloat v21 = v20;
  CGFloat v91 = v22;
  CGFloat v93 = v23;
  CGFloat v25 = v24;
  CGFloat v26 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v27 = [v26 deviceClass];

  BOOL v28 = -[CSProminentLayoutController _isPortraitForBoundingRect:](self, "_isPortraitForBoundingRect:", x, y, width, height);
  if ((uint64_t)a3 <= 15)
  {
    BOOL v29 = v28;
    double v14 = 0.0;
    double v18 = 0.0;
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
        goto LABEL_16;
      case 1uLL:
        [(id)objc_opt_class() timeElementBoundingHeight];
        double v18 = v44;
        CGFloat v45 = objc_opt_class();
        if (v29)
        {
          [v45 timeElementBoundingTopY];
LABEL_31:
          double v14 = v46;
          goto LABEL_39;
        }
        if (v27 == 2)
        {
          [v45 landscapePadTimeElementBoundingTopY];
          goto LABEL_31;
        }
        [v45 timeElementBoundingTopY];
        double v78 = v77;
        [(id)objc_opt_class() subtitleElementBoundingTopY];
        double v80 = v78 - v79;
        [(CSProminentLayoutController *)self leadingLandscapeLayoutInset];
        double v14 = v80 + floor(v81 * 0.666666667);
LABEL_39:
        if (a5 == 1) {
          [(id)objc_opt_class() timeTightBoundingHeight];
        }
        goto LABEL_41;
      case 2uLL:
      case 4uLL:
        [(CSProminentLayoutController *)self subtitleElementBoundingHeight];
        double v18 = v30;
        if (v29)
        {
          [(id)objc_opt_class() subtitleElementBoundingTopY];
LABEL_23:
          double v14 = v31;
          goto LABEL_33;
        }
        if (v27 == 2)
        {
          [(id)objc_opt_class() landscapePadSubtitleElementBoundingTopY];
          goto LABEL_23;
        }
        [(CSProminentLayoutController *)self leadingLandscapeLayoutInset];
        double v14 = floor(v76 * 0.75);
LABEL_33:
        if (a5 == 2)
        {
          [(CSProminentLayoutController *)self subtitleElementEditingOffset];
LABEL_35:
          double v14 = v14 + v49;
        }
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_41;
      case 8uLL:
        [(id)objc_opt_class() complicationElementBoundingHeight];
        double v18 = v47;
        [(id)objc_opt_class() complicationElementBoundingTopY];
        double v14 = v48;
        if (a5 != 2) {
          goto LABEL_41;
        }
        [(id)objc_opt_class() complicationElementEditingOffset];
        goto LABEL_35;
      default:
        double v14 = 0.0;
        double v18 = 0.0;
        goto LABEL_41;
    }
    goto LABEL_41;
  }
  if ((uint64_t)a3 > 62)
  {
    if (a3 != 63)
    {
      if (a3 == 64)
      {
        -[CSProminentLayoutController _quickActionsLeadingFrameWithBoundingRect:](self, "_quickActionsLeadingFrameWithBoundingRect:", x, y, width, height);
        double v51 = v50;
        double v14 = v52;
        double v16 = v53;
        double v18 = v54;
        -[CSProminentLayoutController _quickActionsTrailingFrameWithBoundingRect:](self, "_quickActionsTrailingFrameWithBoundingRect:", x, y, width, height);
        double MinX = v55;
        double v57 = v56;
        double v59 = v58;
        double v61 = v60;
        if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
        {
          double v18 = v61;
          double v16 = v59;
          double v14 = v57;
        }
        else
        {
          double MinX = v51;
        }
        goto LABEL_44;
      }
      double v14 = 0.0;
      double v18 = 0.0;
      if (a3 == 128)
      {
        -[CSProminentLayoutController _quickActionsLeadingFrameWithBoundingRect:](self, "_quickActionsLeadingFrameWithBoundingRect:", x, y, width, height);
        double v33 = v32;
        double v14 = v34;
        double v16 = v35;
        double v18 = v36;
        -[CSProminentLayoutController _quickActionsTrailingFrameWithBoundingRect:](self, "_quickActionsTrailingFrameWithBoundingRect:", x, y, width, height);
        double MinX = v37;
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
        {
          double MinX = v33;
        }
        else
        {
          double v18 = v43;
          double v16 = v41;
          double v14 = v39;
        }
        goto LABEL_44;
      }
      goto LABEL_41;
    }
LABEL_16:
    double MinX = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_44;
  }
  if (a3 == 16)
  {
    [(id)objc_opt_class() landscapePadSubtitleElementBoundingTopY];
    double v14 = v62;
    +[CSGraphicComplicationLayoutProvider complicationEdgeInset];
    double v64 = v63 + v63;
    +[CSGraphicComplicationLayoutProvider gridUnitSize];
    double v66 = v64 + v65 * 2.0;
    +[CSGraphicComplicationLayoutProvider interComplicationSpacing];
    double v16 = v66 + v67;
    CGRect v68 = [MEMORY[0x1E4FB1BA8] mainScreen];
    CGRect v69 = [v68 fixedCoordinateSpace];
    [v69 bounds];
    CGFloat v92 = v71;
    CGFloat v94 = v70;
    CGFloat v73 = v72;
    CGFloat v75 = v74;

    CGAffineTransformMakeRotation(&v95, 1.57079633);
    v96.origin.double y = v92;
    v96.origin.double x = v94;
    v96.size.double width = v73;
    v96.size.double height = v75;
    CGRect v97 = CGRectApplyAffineTransform(v96, &v95);
    double v18 = v97.size.height - v14 * 2.0;
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
    {
      v98.origin.double x = x;
      v98.origin.double y = y;
      v98.size.double width = width;
      v98.size.double height = height;
      double MinX = CGRectGetMaxX(v98) - (v16 + 44.0);
    }
    else
    {
      double MinX = 44.0;
    }
    goto LABEL_44;
  }
  double v14 = 0.0;
  double v18 = 0.0;
  if (a3 == 32) {
    goto LABEL_16;
  }
LABEL_41:
  v99.origin.double x = v21;
  v99.origin.double y = v91;
  v99.size.double width = v93;
  v99.size.double height = v25;
  double MinX = CGRectGetMinX(v99);
  CGFloat v82 = v21;
  v100.origin.double x = v21;
  v100.origin.double y = v91;
  v100.size.double width = v93;
  v100.size.double height = v25;
  double v16 = CGRectGetWidth(v100);
  if (a5 == 1 && (BSFloatIsZero() & 1) == 0)
  {
    v83 = [(CSProminentLayoutController *)self traitEnvironment];
    v84 = [v83 traitCollection];
    [v84 displayScale];

    UIRoundToScale();
    double v14 = v85;
    UIRoundToScale();
    double v18 = v86;
    v101.origin.double x = v82;
    v101.origin.double y = v91;
    v101.size.double width = v93;
    v101.size.double height = v25;
    double MinX = CGRectGetMinX(v101);
    v102.origin.double x = v82;
    v102.origin.double y = v91;
    v102.size.double width = v93;
    v102.size.double height = v25;
    double v16 = CGRectGetWidth(v102);
  }
LABEL_44:
  double v87 = MinX;
  double v88 = v14;
  double v89 = v16;
  double v90 = v18;
  result.size.double height = v90;
  result.size.double width = v89;
  result.origin.double y = v88;
  result.origin.double x = v87;
  return result;
}

- (CGRect)_quickActionsFrameWithMinX:(double)a3 boundingRect:(CGRect)a4
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  +[CSProminentButtonsView _buttonOutsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  +[CSProminentButtonsView _buttonDiameter];
  double v15 = v14;
  +[CSProminentButtonsView _buttonInsetY];
  double v17 = v16;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v18 = CGRectGetHeight(v25) - v17 - (v7 + v15);
  double v19 = v13 + v9 + v15;
  double v20 = v11 + v7 + v15;
  double v21 = a3;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)_quickActionsLeadingFrameWithBoundingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  +[CSProminentButtonsView _buttonInsetX];
  double v9 = v8;
  +[CSProminentButtonsView _leadingOutset];
  double v11 = v9 - v10;

  -[CSProminentLayoutController _quickActionsFrameWithMinX:boundingRect:](self, "_quickActionsFrameWithMinX:boundingRect:", v11, x, y, width, height);
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_quickActionsTrailingFrameWithBoundingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  +[CSProminentButtonsView _buttonInsetX];
  double v10 = v8 - v9;
  +[CSProminentButtonsView _buttonDiameter];
  double v12 = v11;
  +[CSProminentButtonsView _leadingOutset];
  double v14 = v10 - (v12 + v13);

  -[CSProminentLayoutController _quickActionsFrameWithMinX:boundingRect:](self, "_quickActionsFrameWithMinX:boundingRect:", v14, x, y, width, height);
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

+ (double)_landscapeReductionFactor
{
  BOOL v2 = +[CSDeviceDetermination isCategoryPad:](CSDeviceDetermination, "isCategoryPad:", +[CSDeviceDetermination effectiveCategory]);
  double result = 0.7;
  if (v2) {
    return 1.0;
  }
  return result;
}

+ (double)fontSizeForElementType:(unint64_t)a3 isLandscapeVariant:(BOOL)a4
{
  if (a3 == 4 || a3 == 2)
  {
    [a1 subtitleElementFontSize];
  }
  else if (a3 == 1)
  {
    BOOL v5 = a4;
    [a1 timeElementFontSize];
    double v7 = v6;
    double v8 = 1.0;
    if (v5) {
      objc_msgSend(a1, "_landscapeReductionFactor", 1.0);
    }
    return round(v7 * v8);
  }
  else
  {
    return 0.0;
  }
  return result;
}

+ (double)fontWeightForElementType:(unint64_t)a3
{
  if ((uint64_t)a3 > 31)
  {
    if (a3 - 63 < 2 || a3 == 32 || a3 == 128)
    {
LABEL_9:
      double v3 = (double *)MEMORY[0x1E4FB09D8];
      return *v3;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
      case 8uLL:
        goto LABEL_9;
      case 1uLL:
        double v3 = (double *)MEMORY[0x1E4FB09E0];
        return *v3;
      case 2uLL:
      case 4uLL:
        double v3 = (double *)MEMORY[0x1E4FB09D0];
        return *v3;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      default:
        if (a3 == 16) {
          goto LABEL_9;
        }
        break;
    }
  }
  return result;
}

+ (double)fontWeightForElementType:(unint64_t)a3 familyName:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if ((uint64_t)a3 > 31)
  {
    if (a3 - 63 < 2 || a3 == 32 || a3 == 128)
    {
LABEL_9:
      double v8 = (double *)MEMORY[0x1E4FB09D8];
LABEL_10:
      double v4 = *v8;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 0uLL:
      case 8uLL:
        goto LABEL_9;
      case 1uLL:
        if ([v6 containsString:@"Rail"]) {
          double v8 = (double *)MEMORY[0x1E4FB09B8];
        }
        else {
          double v8 = (double *)MEMORY[0x1E4FB09E0];
        }
        goto LABEL_10;
      case 2uLL:
      case 4uLL:
        double v8 = (double *)MEMORY[0x1E4FB09D0];
        goto LABEL_10;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      default:
        if (a3 == 16) {
          goto LABEL_9;
        }
        break;
    }
  }

  return v4;
}

+ (double)timeElementFontSize
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  if (v2 - 2 > 0x1D) {
    return 84.0;
  }
  else {
    return dbl_1ADA42860[v2 - 2];
  }
}

+ (double)subtitleElementFontSize
{
  BOOL v2 = +[CSDeviceDetermination isCategoryPhone:](CSDeviceDetermination, "isCategoryPhone:", +[CSDeviceDetermination effectiveCategory]);
  double result = 23.0;
  if (v2) {
    return 22.0;
  }
  return result;
}

+ (double)timeElementBoundingHeight
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  if (v2 - 2 > 0x1D) {
    return 100.0;
  }
  else {
    return dbl_1ADA42950[v2 - 2];
  }
}

+ (double)timeTightBoundingHeight
{
  [a1 timeElementFontSize];
  double v4 = v3;
  [a1 fontWeightForElementType:1];
  id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v4 weight:v5];
  [v6 capHeight];
  double v8 = v7;

  return v8;
}

+ (double)timeElementBoundingTopY
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory];
  double result = 72.0;
  switch(v3)
  {
    case 0uLL:
    case 1uLL:
    case 0xCuLL:
    case 0xEuLL:
      return result;
    case 2uLL:
      return 71.0;
    case 3uLL:
      return 90.0;
    case 4uLL:
    case 8uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 72.0);
      double v6 = 55.0;
      goto LABEL_19;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 72.0);
      uint64_t v7 = 0x4051000000000000;
      goto LABEL_15;
    case 6uLL:
      return 101.0;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 72.0);
      uint64_t v7 = 0x404D000000000000;
      goto LABEL_15;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 72.0);
      double v6 = 65.0;
      goto LABEL_19;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 72.0);
      double v6 = 48.666666;
      goto LABEL_19;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 72.0);
      uint64_t v7 = 0x404A000000000000;
LABEL_15:
      double v6 = *(double *)&v7;
      goto LABEL_19;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 72.0);
      double v6 = 70.0;
      goto LABEL_19;
    case 0x11uLL:
    case 0x13uLL:
      return 77.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 72.0);
      double v6 = 40.33333;
      goto LABEL_19;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 72.0);
      double v6 = 47.33333;
LABEL_19:
      double result = v5 + v6;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1FuLL:
      double result = 122.0;
      break;
    case 0x18uLL:
    case 0x1DuLL:
    case 0x1EuLL:
      double result = 134.0;
      break;
    default:
      double result = 84.0;
      break;
  }
  return result;
}

+ (double)landscapePadTimeElementBoundingTopY
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory] - 21;
  if (v3 < 0xB) {
    return dbl_1ADA42A40[v3];
  }

  [a1 timeElementBoundingTopY];
  return result;
}

- (double)padTimeElementBoundingWidth
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory];
  double result = 594.0;
  if (v3 <= 0x1F)
  {
    if (((1 << v3) & 0x9EE00000) != 0)
    {
      switch(self->_numberingSystem)
      {
        case 2:
          BOOL v5 = !self->_fourDigitTime;
          double v6 = (double *)&unk_1ADA42820;
          break;
        case 4:
          BOOL v5 = !self->_fourDigitTime;
          double v6 = (double *)&unk_1ADA42810;
          break;
        default:
          BOOL v5 = !self->_fourDigitTime;
          double v6 = (double *)&unk_1ADA42830;
          break;
      }
      return v6[v5];
    }
    else if (((1 << v3) & 0x61000000) != 0)
    {
      switch(self->_numberingSystem)
      {
        case 2:
          BOOL v5 = !self->_fourDigitTime;
          double v6 = (double *)&unk_1ADA42840;
          return v6[v5];
        case 4:
          double result = 594.0;
          if (!self->_fourDigitTime) {
            double result = 464.0;
          }
          break;
        default:
          BOOL v5 = !self->_fourDigitTime;
          double v6 = (double *)&unk_1ADA42850;
          return v6[v5];
      }
    }
  }
  return result;
}

- (double)subtitleElementBoundingHeight
{
  return 36.0;
}

- (double)subtitleElementEditingOffset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = -10.0;
  if (v2 <= 0x14) {
    return dbl_1ADA42A98[v2];
  }
  return result;
}

+ (double)subtitleElementBoundingTopY
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory];
  double result = 45.0;
  switch(v3)
  {
    case 0uLL:
    case 1uLL:
    case 0xCuLL:
    case 0xEuLL:
      return result;
    case 2uLL:
      double v7 = 48.0;
      goto LABEL_9;
    case 3uLL:
      return 66.0;
    case 4uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 45.0);
      *(double *)&uint64_t v6 = 32.0;
      goto LABEL_13;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 45.0);
      double v8 = 47.0;
      goto LABEL_14;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 45.0);
      double v8 = 35.0;
      goto LABEL_14;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 45.0);
      *(double *)&uint64_t v6 = 42.0;
LABEL_13:
      double v8 = *(double *)&v6;
      goto LABEL_14;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 45.0);
      double v8 = 24.0;
      goto LABEL_14;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 45.0);
      double v8 = 27.0;
      goto LABEL_14;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 45.0);
      double v8 = 49.0;
      goto LABEL_14;
    case 0x11uLL:
    case 0x13uLL:
      return 59.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 45.0);
      double v8 = 21.666666;
      goto LABEL_14;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 45.0);
      double v8 = 26.0;
LABEL_14:
      double result = v5 + v8;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1FuLL:
      double result = 85.0;
      break;
    case 0x18uLL:
    case 0x1DuLL:
    case 0x1EuLL:
      double v7 = 96.0;
LABEL_9:
      double result = v7;
      break;
    default:
      double result = 79.0;
      break;
  }
  return result;
}

+ (double)landscapePadSubtitleElementBoundingTopY
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory] - 21;
  if (v3 < 0xB) {
    return dbl_1ADA42B40[v3];
  }

  [a1 subtitleElementBoundingTopY];
  return result;
}

- (CGRect)editingReticleFrameForElement:(unint64_t)a3 withBoundingRect:(CGRect)result
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 62)
    {
      if (a3 == 16)
      {
        -[CSProminentLayoutController complicationSidebarElementEditingReticleFrameWithBoundingRect:](self, "complicationSidebarElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
        goto LABEL_16;
      }
      if (a3 != 32) {
        goto LABEL_17;
      }
    }
    else if (a3 != 63)
    {
      if (a3 == 64)
      {
        -[CSProminentLayoutController _quickActionLeadingElementEditingReticleFrameWithBoundingRect:](self, "_quickActionLeadingElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      }
      else
      {
        if (a3 != 128) {
          goto LABEL_17;
        }
        -[CSProminentLayoutController _quickActionTrailingElementEditingReticleFrameWithBoundingRect:](self, "_quickActionTrailingElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      }
LABEL_16:
      double v4 = v5;
      goto LABEL_17;
    }
LABEL_11:
    result.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB20];
    result.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8);
    result.size.double width = *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16);
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_17;
  }
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0uLL:
      goto LABEL_11;
    case 1uLL:
      -[CSProminentLayoutController timeElementEditingReticleFrameWithBoundingRect:](self, "timeElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      -[CSProminentLayoutController subtitleElementEditingReticleFrameWithBoundingRect:](self, "subtitleElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    case 8uLL:
      -[CSProminentLayoutController complicationRowElementEditingReticleFrameWithBoundingRect:](self, "complicationRowElementEditingReticleFrameWithBoundingRect:", result.origin.x, result.origin.y, result.size.width, result.size.height);
      goto LABEL_16;
    default:
      break;
  }
LABEL_17:
  double v6 = v4;
  result.size.double height = v6;
  return result;
}

- (CGRect)timeElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 1, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v13 = [v12 deviceClass];

  if (v13 == 2)
  {
    v20.origin.double x = v5;
    v20.origin.double y = v7;
    v20.size.double width = v9;
    v20.size.double height = v11;
    double Width = CGRectGetWidth(v20);
    [(CSProminentLayoutController *)self padTimeElementBoundingWidth];
    double v16 = (Width - v15) * 0.5;
  }
  else
  {
    [(id)objc_opt_class() reticlePortraitLayoutInset];
    double v16 = v17 - v5;
  }
  [(id)objc_opt_class() timeElementReticleInset];
  CGFloat v19 = v18;
  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  return CGRectInset(v21, v16, v19);
}

- (CGRect)subtitleElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 2, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v12 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  if ([v12 deviceClass] == 2) {
    double v13 = 40.0;
  }
  else {
    double v13 = 32.0;
  }

  [(CSProminentLayoutController *)self subtitleElementBoundingHeight];
  double v15 = v13 - v14;
  double v16 = v11 + v15;
  double v17 = v7 + v15 * -0.5;
  double v18 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v19 = [v18 deviceClass];

  if (v19 == 2)
  {
    v24.origin.double x = v5;
    v24.origin.double y = v17;
    v24.size.double width = v9;
    v24.size.double height = v16;
    double Width = CGRectGetWidth(v24);
    [(CSProminentLayoutController *)self _padElementWidth];
    double v22 = (Width - v21) * 0.5;
  }
  else
  {
    [(id)objc_opt_class() reticlePortraitLayoutInset];
    double v22 = v23 - v5;
  }
  v25.origin.double x = v5;
  v25.origin.double y = v17;
  v25.size.double width = v9;
  v25.size.double height = v16;
  return CGRectInset(v25, v22, 0.0);
}

- (CGRect)complicationRowElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 8, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v13 = [v12 deviceClass];

  if (v13 == 2)
  {
    v28.origin.double x = v5;
    v28.origin.double y = v7;
    v28.size.double width = v9;
    v28.size.double height = v11;
    double Width = CGRectGetWidth(v28);
    [(CSProminentLayoutController *)self _padElementWidth];
    double v16 = (Width - v15) * 0.5;
    v29.origin.double x = v5;
    v29.origin.double y = v7;
    v29.size.double width = v9;
    v29.size.double height = v11;
    double Height = CGRectGetHeight(v29);
    [(id)objc_opt_class() complicationElementBoundingHeight];
    double v19 = (Height - v18) * 0.5;
    [(id)objc_opt_class() complicationElementEditingReticleInset];
    double v21 = v19 - v20;
    double v22 = v5;
    CGFloat v23 = v7;
    CGFloat v24 = v9;
    CGFloat v25 = v11;
    double v26 = v16;
  }
  else
  {
    [(id)objc_opt_class() reticlePortraitLayoutInset];
    double v26 = v27 - v5;
    double v22 = v5;
    CGFloat v23 = v7;
    CGFloat v24 = v9;
    CGFloat v25 = v11;
    double v21 = v26;
  }
  return CGRectInset(*(CGRect *)&v22, v26, v21);
}

- (CGRect)complicationSidebarElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 16, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return CGRectInset(*(CGRect *)&v3, -8.0, -8.0);
}

- (CGRect)_quickActionLeadingElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 64, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  +[CSProminentButtonsView _reticleOutset];
  CGFloat v12 = v11;
  uint64_t v13 = v4;
  uint64_t v14 = v6;
  uint64_t v15 = v8;
  uint64_t v16 = v10;

  return CGRectInset(*(CGRect *)&v13, v12, v12);
}

- (CGRect)_quickActionTrailingElementEditingReticleFrameWithBoundingRect:(CGRect)a3
{
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", 128, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  +[CSProminentButtonsView _reticleOutset];
  CGFloat v12 = v11;
  uint64_t v13 = v4;
  uint64_t v14 = v6;
  uint64_t v15 = v8;
  uint64_t v16 = v10;

  return CGRectInset(*(CGRect *)&v13, v12, v12);
}

+ (double)timeElementReticleInset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 11.0;
  if (v2 - 2 <= 0x1D) {
    return dbl_1ADA42B98[v2 - 2];
  }
  return result;
}

+ (double)complicationElementEditingReticleInset
{
  unint64_t v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v3 = [v2 deviceClass];

  double result = 0.0;
  if (v3 == 2) {
    return 14.0;
  }
  return result;
}

+ (double)reticleSpacing
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 5.0;
  if (v2 - 2 <= 0x12) {
    return dbl_1ADA42C88[v2 - 2];
  }
  return result;
}

+ (double)_safeAreaTopInset:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 3 <= 0x11) {
    return dbl_1ADA42D20[a3 - 3];
  }
  return result;
}

+ (double)reticlePortraitLayoutInset
{
  +[CSDeviceDetermination effectiveCategory];
  [a1 leadingPortraitLayoutInset];
  double result = v3 + -9.0;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

+ (double)leadingLandscapeLayoutInset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 0.0;
  if (v2 <= 0x14) {
    return dbl_1ADA42DB0[v2];
  }
  return result;
}

+ (double)leadingPortraitLayoutInset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 0.0;
  if (v2 <= 0x14) {
    return dbl_1ADA42E58[v2];
  }
  return result;
}

- (double)leadingPortraitLayoutInset
{
  unint64_t v2 = objc_opt_class();

  [v2 leadingPortraitLayoutInset];
  return result;
}

- (double)leadingLandscapeLayoutInset
{
  unint64_t v2 = objc_opt_class();

  [v2 leadingLandscapeLayoutInset];
  return result;
}

- (double)_padElementWidth
{
  +[CSGraphicComplicationLayoutProvider gridUnitSize];
  double v3 = v2;
  +[CSGraphicComplicationLayoutProvider complicationEdgeInset];
  double v5 = v4;
  +[CSGraphicComplicationLayoutProvider interComplicationSpacingExcludingInnerInset];
  double v7 = v6;
  +[CSGraphicComplicationLayoutProvider complicationEdgeInset];
  double v9 = v8;
  unint64_t v10 = +[CSDeviceDetermination effectiveCategory];
  BOOL v11 = v10 == 29 || v10 == 24;
  double result = 388.0;
  if (v11) {
    double result = 390.0;
  }
  if ((v3 + v5 * 2.0) * (double)4 + v7 * (double)3 + v9 + v9 >= result) {
    return (v3 + v5 * 2.0) * (double)4 + v7 * (double)3 + v9 + v9;
  }
  return result;
}

- (BOOL)_isPortraitForBoundingRect:(CGRect)a3
{
  return a3.size.height >= a3.size.width;
}

- (BOOL)shouldCenterElementsInBoundingRect:(CGRect)a3
{
  BOOL v3 = -[CSProminentLayoutController _isPortraitForBoundingRect:](self, "_isPortraitForBoundingRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v5 = [v4 deviceClass];

  return v5 == 2 || v3;
}

- (CGRect)elementHorizontalFrameInBoundingRect:(CGRect)a3 forElementType:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v10 = [(CSProminentLayoutController *)self traitEnvironment];
  BOOL v11 = [v10 traitCollection];

  [(CSProminentLayoutController *)self leadingPortraitLayoutInset];
  double v13 = v12;
  [(CSProminentLayoutController *)self leadingLandscapeLayoutInset];
  double v15 = v14;
  if (-[CSProminentLayoutController shouldCenterElementsInBoundingRect:](self, "shouldCenterElementsInBoundingRect:", x, y, width, height))
  {
    uint64_t v16 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    int v17 = [v16 deviceClass];

    if (v17 == 2)
    {
      if (a4 == 1)
      {
        [(CSProminentLayoutController *)self padTimeElementBoundingWidth];
        double v19 = (width - v18) * 0.5;
      }
      else
      {
        [(CSProminentLayoutController *)self _padElementWidth];
        double v32 = width - (v31 + -16.0);
        if (v32 >= 0.0) {
          double v19 = v32 * 0.5;
        }
        else {
          double v19 = 0.0;
        }
      }
      double v27 = x;
      double v28 = y;
      double v29 = width;
      double v30 = height;
    }
    else
    {
      double v27 = x;
      double v28 = y;
      double v29 = width;
      double v30 = height;
      double v19 = v13;
    }
    CGRect v38 = CGRectInset(*(CGRect *)&v27, v19, 0.0);
    CGFloat v24 = v38.origin.x;
    CGFloat v25 = v38.origin.y;
    double v20 = v38.size.width;
    CGFloat v26 = v38.size.height;
  }
  else
  {
    [v11 layoutDirection];
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    double v20 = CGRectGetWidth(v37) / 3.0 - v15;
    double v21 = [(CSProminentLayoutController *)self traitEnvironment];
    double v22 = [v21 traitCollection];
    [v22 displayScale];

    UIRoundToScale();
    CGFloat v24 = v23;
    CGFloat v25 = 0.0;
    CGFloat v26 = 0.0;
  }

  double v33 = v24;
  double v34 = v25;
  double v35 = v20;
  double v36 = v26;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

+ (double)complicationElementBoundingHeight
{
  +[CSGraphicComplicationLayoutProvider complicationContainerHeight];
  return result;
}

+ (double)complicationElementEditingOffset
{
  unint64_t v2 = +[CSDeviceDetermination effectiveCategory];
  double result = 10.0;
  if (v2 <= 0x14) {
    return dbl_1ADA42F00[v2];
  }
  return result;
}

+ (double)complicationElementBoundingTopY
{
  unint64_t v3 = +[CSDeviceDetermination effectiveCategory];
  double result = 173.0;
  switch(v3)
  {
    case 0uLL:
    case 0xCuLL:
      return result;
    case 1uLL:
      return 170.0;
    case 2uLL:
      return 188.0;
    case 3uLL:
      return 190.0;
    case 4uLL:
    case 9uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 173.0);
      double v9 = 172.0;
      goto LABEL_20;
    case 5uLL:
    case 7uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", v3, 173.0);
      double v9 = 192.0;
      goto LABEL_20;
    case 6uLL:
      return 214.0;
    case 8uLL:
      return 219.0;
    case 0xAuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 10, 173.0);
      double v9 = 175.0;
      goto LABEL_20;
    case 0xBuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 11, 173.0);
      double v9 = 182.0;
      goto LABEL_20;
    case 0xDuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 13, 173.0);
      double v9 = 164.0;
      goto LABEL_20;
    case 0xEuLL:
      return 175.0;
    case 0xFuLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 15, 173.0);
      double v9 = 167.0;
      goto LABEL_20;
    case 0x10uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 16, 173.0);
      double v9 = 194.0;
      goto LABEL_20;
    case 0x11uLL:
      return 194.0;
    case 0x12uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 18, 173.0);
      double v9 = 162.0;
      goto LABEL_20;
    case 0x13uLL:
      double v10 = 200.0;
      goto LABEL_23;
    case 0x14uLL:
      objc_msgSend(a1, "_safeAreaTopInset:", 20, 173.0);
      double v9 = 170.0;
LABEL_20:
      double result = v8 + v9;
      break;
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
      objc_msgSend(a1, "timeElementBoundingTopY", v3, 173.0);
      double v6 = v5 + 13.0;
      [a1 timeElementBoundingHeight];
      double result = v6 + v7;
      break;
    default:
      double v10 = 84.0;
LABEL_23:
      double result = v10;
      break;
  }
  return result;
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);

  return (UITraitEnvironment *)WeakRetained;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (int64_t)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(int64_t)a3
{
  self->_numberingSystem = a3;
}

- (void).cxx_destruct
{
}

@end