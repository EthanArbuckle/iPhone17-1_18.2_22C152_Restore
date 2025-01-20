@interface AVTFunCamAvatarPickerStyle
+ (id)defaultLayoutStyle;
+ (id)insetProviderForConstant:(double)a3;
- (AVTFunCamAvatarPickerStyle)initWithCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interitemSpacing:(double)a5 gridEdgeInsets:(UIEdgeInsets)a6;
- (CGSize)cellSize;
- (CGSize)engagedCellSize;
- (UIEdgeInsets)gridEdgeInsets;
- (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4;
- (double)interitemSpacing;
- (id)imageItemInsetsForGrid;
- (id)imageItemInsetsForList;
- (void)setCellSize:(CGSize)a3;
- (void)setEngagedCellSize:(CGSize)a3;
- (void)setGridEdgeInsets:(UIEdgeInsets)a3;
- (void)setInteritemSpacing:(double)a3;
@end

@implementation AVTFunCamAvatarPickerStyle

+ (id)insetProviderForConstant:(double)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__AVTFunCamAvatarPickerStyle_insetProviderForConstant___block_invoke;
  v5[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v5[4] = a3;
  v3 = (void *)[v5 copy];
  return v3;
}

double __55__AVTFunCamAvatarPickerStyle_insetProviderForConstant___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

+ (id)defaultLayoutStyle
{
  v2 = -[AVTFunCamAvatarPickerStyle initWithCellSize:engagedCellSize:interitemSpacing:gridEdgeInsets:]([AVTFunCamAvatarPickerStyle alloc], "initWithCellSize:engagedCellSize:interitemSpacing:gridEdgeInsets:", 74.0, 74.0, 108.0, 108.0, 16.0, 0, 0x4020000000000000, 0, 0x4020000000000000);
  return v2;
}

- (AVTFunCamAvatarPickerStyle)initWithCellSize:(CGSize)a3 engagedCellSize:(CGSize)a4 interitemSpacing:(double)a5 gridEdgeInsets:(UIEdgeInsets)a6
{
  double height = a4.height;
  CGFloat width = a4.width;
  double v9 = a3.height;
  CGFloat v10 = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)AVTFunCamAvatarPickerStyle;
  result = [(AVTFunCamAvatarPickerStyle *)&v12 init];
  if (result)
  {
    result->_cellSize.double height = v9 + 14.0;
    result->_engagedCellSize.CGFloat width = width;
    result->_interitemSpacing = a5;
    result->_cellSize.CGFloat width = v10;
    result->_engagedCellSize.double height = height + 14.0;
    result->_gridEdgeInsets = a6;
  }
  return result;
}

- (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  [(AVTFunCamAvatarPickerStyle *)self gridEdgeInsets];
  double v7 = v6;
  [(AVTFunCamAvatarPickerStyle *)self gridEdgeInsets];
  double result = floor((a3 - (v7 + v8)) * 0.25);
  if (result < 50.0) {
    return 50.0;
  }
  return result;
}

- (id)imageItemInsetsForList
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__AVTFunCamAvatarPickerStyle_imageItemInsetsForList__block_invoke;
  v4[3] = &unk_263FF25A0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x210530210](v4, a2);
  return v2;
}

double __52__AVTFunCamAvatarPickerStyle_imageItemInsetsForList__block_invoke(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) cellSize];
  double v5 = a2 - v4;
  [*(id *)(a1 + 32) engagedCellSize];
  double v7 = v6;
  [*(id *)(a1 + 32) cellSize];
  return (a2 - (v5 / (v7 - v8) * -0.0445445445 + 0.72972973) * a2) * 0.5;
}

- (id)imageItemInsetsForGrid
{
  v2 = objc_opt_class();
  return (id)[v2 insetProviderForConstant:18.0];
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)engagedCellSize
{
  double width = self->_engagedCellSize.width;
  double height = self->_engagedCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEngagedCellSize:(CGSize)a3
{
  self->_engagedCellSize = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIEdgeInsets)gridEdgeInsets
{
  double top = self->_gridEdgeInsets.top;
  double left = self->_gridEdgeInsets.left;
  double bottom = self->_gridEdgeInsets.bottom;
  double right = self->_gridEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGridEdgeInsets:(UIEdgeInsets)a3
{
  self->_gridEdgeInsets = a3;
}

@end