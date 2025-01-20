@interface HUGridCameraCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (double)cameraViewAspectRatio;
- (double)cellHeight;
- (double)headerHorizontalInnerMargins;
- (double)headerViewHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCameraViewAspectRatio:(double)a3;
- (void)setCellHeight:(double)a3;
- (void)setHeaderHorizontalInnerMargins:(double)a3;
- (void)setHeaderViewHeight:(double)a3;
@end

@implementation HUGridCameraCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HUGridCameraCellLayoutOptions;
  v4 = objc_msgSendSuper2(&v9, sel_defaultOptionsForCellSizeSubclass_);
  v10[0] = &unk_1F19B5030;
  v10[1] = &unk_1F19B5018;
  v11[0] = &unk_1F19B63E0;
  v11[1] = &unk_1F19B6400;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  double v6 = HUConstantForCellSizeSubclass(a3, v5);

  v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:v6 weight:*MEMORY[0x1E4F43908]];
  [v4 setFont:v7];

  [v4 setHeaderViewHeight:36.0];
  [v4 setCameraViewAspectRatio:1.77777778];
  [v4 setHeaderHorizontalInnerMargins:10.0];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridCameraCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v6 copyWithZone:a3];
  [(HUGridCameraCellLayoutOptions *)self headerViewHeight];
  objc_msgSend(v4, "setHeaderViewHeight:");
  [(HUGridCameraCellLayoutOptions *)self cameraViewAspectRatio];
  objc_msgSend(v4, "setCameraViewAspectRatio:");
  [(HUGridCameraCellLayoutOptions *)self headerHorizontalInnerMargins];
  objc_msgSend(v4, "setHeaderHorizontalInnerMargins:");
  [(HUGridCameraCellLayoutOptions *)self cellHeight];
  objc_msgSend(v4, "setCellHeight:");
  return v4;
}

- (void)setHeaderViewHeight:(double)a3
{
  self->_headerViewHeight = a3;
}

- (void)setHeaderHorizontalInnerMargins:(double)a3
{
  self->_headerHorizontalInnerMargins = a3;
}

- (void)setCameraViewAspectRatio:(double)a3
{
  self->_cameraViewAspectRatio = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (double)headerViewHeight
{
  return self->_headerViewHeight;
}

- (double)headerHorizontalInnerMargins
{
  return self->_headerHorizontalInnerMargins;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (double)cameraViewAspectRatio
{
  return self->_cameraViewAspectRatio;
}

@end