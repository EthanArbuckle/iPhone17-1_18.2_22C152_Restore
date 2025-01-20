@interface NSCollectionLayoutSize
+ (NSCollectionLayoutSize)sizeWithAbsoluteSize:(CGSize)a3;
+ (NSCollectionLayoutSize)sizeWithContainerSize;
+ (NSCollectionLayoutSize)sizeWithContainerWidthFactor:(double)a3 containerHeightFactor:(double)a4;
+ (NSCollectionLayoutSize)sizeWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5;
+ (NSCollectionLayoutSize)sizeWithWidth:(double)a3 widthSemantic:(int64_t)a4 height:(double)a5 heightSemantic:(int64_t)a6;
+ (NSCollectionLayoutSize)sizeWithWidthDimension:(NSCollectionLayoutDimension *)width heightDimension:(NSCollectionLayoutDimension *)height;
- (BOOL)_isEstimatedForAxis:(unint64_t)a3;
- (BOOL)isContainerSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEstimated;
- (CGSize)_effectiveSizeForContainer:(id)a3 displayScale:(double)a4 ignoringInsets:(BOOL)a5;
- (CGSize)size;
- (NSCollectionLayoutDimension)heightDimension;
- (NSCollectionLayoutDimension)widthDimension;
- (NSCollectionLayoutSize)initWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5 width:(id)a6 height:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)heightSemantic;
- (int64_t)widthSemantic;
- (unint64_t)_axesUniformAcrossSiblings;
- (unint64_t)_containerSizeDependentAxes;
- (void)setHeightDimension:(id)a3;
- (void)setHeightSemantic:(int64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setWidthDimension:(id)a3;
- (void)setWidthSemantic:(int64_t)a3;
@end

@implementation NSCollectionLayoutSize

- (unint64_t)_containerSizeDependentAxes
{
  int64_t widthSemantic = self->_widthSemantic;
  int64_t heightSemantic = self->_heightSemantic;
  unint64_t v5 = widthSemantic == 1 || heightSemantic == 1;
  if (heightSemantic == 2 || widthSemantic == 2) {
    return v5 | 2;
  }
  else {
    return v5;
  }
}

- (unint64_t)_axesUniformAcrossSiblings
{
  if (self->_heightSemantic == 4) {
    return (self->_widthSemantic == 4) | 2;
  }
  else {
    return self->_widthSemantic == 4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightDimension, 0);
  objc_storeStrong((id *)&self->_widthDimension, 0);
}

- (CGSize)_effectiveSizeForContainer:(id)a3 displayScale:(double)a4 ignoringInsets:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  [v9 contentInsets];
  double v14 = v12 + v13;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  *(double *)&v33[4] = a4;
  if (v5) {
    double v14 = 0.0;
  }
  v33[2] = __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke;
  v33[3] = &__block_descriptor_40_e8_d16__0d8l;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v25 = __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2;
  v26 = &unk_2640B2D40;
  double v15 = v10 + v11;
  if (v5) {
    double v15 = 0.0;
  }
  v28 = self;
  v29 = v33;
  double v30 = v15;
  double v31 = v14;
  SEL v32 = a2;
  id v27 = v9;
  double width = self->_size.width;
  int64_t widthSemantic = self->_widthSemantic;
  id v18 = v9;
  __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2((uint64_t)v24, widthSemantic, width);
  double v20 = v19;
  double v21 = ((double (*)(void *, int64_t, double))v25)(v24, self->_heightSemantic, self->_size.height);

  double v22 = v20;
  double v23 = v21;
  result.height = v23;
  result.double width = v22;
  return result;
}

void __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  switch(a2)
  {
    case 0:
    case 3:
    case 4:
      return;
    case 1:
      uint64_t v5 = *(void *)(a1 + 48);
      [*(id *)(a1 + 32) contentSize];
      v6.n128_f64[0] = v6.n128_f64[0] - *(double *)(a1 + 56);
      goto LABEL_5;
    case 2:
      uint64_t v5 = *(void *)(a1 + 48);
      [*(id *)(a1 + 32) contentSize];
      v6.n128_f64[0] = v8 - *(double *)(a1 + 64);
LABEL_5:
      v6.n128_f64[0] = v6.n128_f64[0] * a3;
      id v9 = *(void (**)(uint64_t, __n128))(v5 + 16);
      v9(v5, v6);
      break;
    default:
      v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"NSCollectionLayoutItem.m" lineNumber:2023 description:@"Unhandled dimensionSemantic."];

      break;
  }
}

double __81__NSCollectionLayoutSize__effectiveSizeForContainer_displayScale_ignoringInsets___block_invoke(uint64_t a1, double result)
{
  double v2 = *(double *)(a1 + 32);
  if (v2 > 0.0) {
    return floor(v2 * result) / v2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(NSCollectionLayoutSize *)self size];
  double v6 = v5;
  double v8 = v7;
  int64_t v9 = [(NSCollectionLayoutSize *)self widthSemantic];
  int64_t v10 = [(NSCollectionLayoutSize *)self heightSemantic];
  double v11 = [(NSCollectionLayoutSize *)self widthDimension];
  double v12 = [(NSCollectionLayoutSize *)self heightDimension];
  double v13 = objc_msgSend(v4, "initWithSize:widthSemantic:heightSemantic:width:height:", v9, v10, v11, v12, v6, v8);

  return v13;
}

- (BOOL)_isEstimatedForAxis:(unint64_t)a3
{
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"NSCollectionLayoutItem.m", 2043, @"Invalid parameter not satisfying: %@", @"axis == CVCAxisHorizontal || axis == CVCAxisVertical" object file lineNumber description];

    goto LABEL_5;
  }
  if (a3 != 2)
  {
LABEL_5:
    v4 = [(NSCollectionLayoutSize *)self widthDimension];
    goto LABEL_6;
  }
  v4 = [(NSCollectionLayoutSize *)self heightDimension];
LABEL_6:
  double v7 = v4;
  char v8 = [v4 isEstimated];

  return v8;
}

- (NSCollectionLayoutDimension)widthDimension
{
  return self->_widthDimension;
}

- (NSCollectionLayoutDimension)heightDimension
{
  return self->_heightDimension;
}

- (NSCollectionLayoutSize)initWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5 width:(id)a6 height:(id)a7
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NSCollectionLayoutSize;
  v16 = [(NSCollectionLayoutSize *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_size.CGFloat width = width;
    v16->_size.CGFloat height = height;
    v16->_int64_t widthSemantic = a4;
    v16->_int64_t heightSemantic = a5;
    objc_storeStrong((id *)&v16->_widthDimension, a6);
    objc_storeStrong((id *)&v17->_heightDimension, a7);
  }

  return v17;
}

- (int64_t)widthSemantic
{
  return self->_widthSemantic;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)heightSemantic
{
  return self->_heightSemantic;
}

+ (NSCollectionLayoutSize)sizeWithWidthDimension:(NSCollectionLayoutDimension *)width heightDimension:(NSCollectionLayoutDimension *)height
{
  double v6 = height;
  double v7 = width;
  uint64_t v8 = [(NSCollectionLayoutDimension *)v7 semantic];
  uint64_t v9 = [(NSCollectionLayoutDimension *)v6 semantic];
  [(NSCollectionLayoutDimension *)v7 dimension];
  double v11 = v10;
  [(NSCollectionLayoutDimension *)v6 dimension];
  double v13 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", v8, v9, v7, v6, v11, v12);

  return (NSCollectionLayoutSize *)v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutSize *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(NSCollectionLayoutSize *)self widthDimension],
          double v5 = objc_claimAutoreleasedReturnValue(),
          [(NSCollectionLayoutSize *)v4 widthDimension],
          double v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = __objectEqual(v5, v6),
          v6,
          v5,
          v7))
    {
      uint64_t v8 = [(NSCollectionLayoutSize *)self heightDimension];
      uint64_t v9 = [(NSCollectionLayoutSize *)v4 heightDimension];
      char v10 = __objectEqual(v8, v9);
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isEstimated
{
  int64_t widthSemantic = self->_widthSemantic;
  if (widthSemantic == 3) {
    return 1;
  }
  return widthSemantic == 4 || (unint64_t)(self->_heightSemantic - 3) < 2;
}

- (id)description
{
  unint64_t widthSemantic = self->_widthSemantic;
  if (widthSemantic > 4) {
    v3 = &stru_26C0F8F98;
  }
  else {
    v3 = off_2640B2DE0[widthSemantic];
  }
  unint64_t heightSemantic = self->_heightSemantic;
  if (heightSemantic > 4) {
    double v5 = &stru_26C0F8F98;
  }
  else {
    double v5 = off_2640B2DE0[heightSemantic];
  }
  return (id)[NSString stringWithFormat:@"{%@(%g), %@(%g)}", v3, *(void *)&self->_size.width, v5, *(void *)&self->_size.height];
}

+ (NSCollectionLayoutSize)sizeWithContainerSize
{
  v3 = +[NSCollectionLayoutDimension _dimensionWithDimension:1 semantic:1.0];
  v4 = +[NSCollectionLayoutDimension _dimensionWithDimension:2 semantic:1.0];
  double v5 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", objc_msgSend(v3, "semantic"), objc_msgSend(v4, "semantic"), v3, v4, 1.0, 1.0);

  return (NSCollectionLayoutSize *)v5;
}

- (BOOL)isContainerSize
{
  return self->_widthSemantic == 1
      && fabs(self->_size.width + -1.0) < 2.22044605e-16
      && self->_heightSemantic == 2
      && fabs(self->_size.height + -1.0) < 2.22044605e-16;
}

+ (NSCollectionLayoutSize)sizeWithAbsoluteSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 0);
  int v7 = +[NSCollectionLayoutDimension _dimensionWithDimension:0 semantic:height];
  uint64_t v8 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", 0, 0, v6, v7, width, height);

  return (NSCollectionLayoutSize *)v8;
}

+ (NSCollectionLayoutSize)sizeWithContainerWidthFactor:(double)a3 containerHeightFactor:(double)a4
{
  int v7 = +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  uint64_t v8 = +[NSCollectionLayoutDimension _dimensionWithDimension:2 semantic:a4];
  uint64_t v9 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", 1, 2, v7, v8, a3, a4);

  return (NSCollectionLayoutSize *)v9;
}

+ (NSCollectionLayoutSize)sizeWithSize:(CGSize)a3 widthSemantic:(int64_t)a4 heightSemantic:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  char v10 = +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  double v11 = +[NSCollectionLayoutDimension _dimensionWithDimension:2 semantic:height];
  double v12 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", a4, a5, v10, v11, width, height);

  return (NSCollectionLayoutSize *)v12;
}

+ (NSCollectionLayoutSize)sizeWithWidth:(double)a3 widthSemantic:(int64_t)a4 height:(double)a5 heightSemantic:(int64_t)a6
{
  double v11 = +[NSCollectionLayoutDimension _dimensionWithDimension:semantic:](NSCollectionLayoutDimension, "_dimensionWithDimension:semantic:", 1);
  double v12 = +[NSCollectionLayoutDimension _dimensionWithDimension:2 semantic:a5];
  double v13 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:widthSemantic:heightSemantic:width:height:", a4, a6, v11, v12, a3, a5);

  return (NSCollectionLayoutSize *)v13;
}

- (void)setWidthDimension:(id)a3
{
}

- (void)setHeightDimension:(id)a3
{
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setWidthSemantic:(int64_t)a3
{
  self->_unint64_t widthSemantic = a3;
}

- (void)setHeightSemantic:(int64_t)a3
{
  self->_unint64_t heightSemantic = a3;
}

@end