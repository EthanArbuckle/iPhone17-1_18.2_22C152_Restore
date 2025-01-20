@interface ASCStarRatingView
+ (id)greyFill;
- (ASCStarRatingView)initWithCoder:(id)a3;
- (ASCStarRatingView)initWithFrame:(CGRect)a3;
- (ASCStarRatingView)initWithMaxNumberOfStars:(int64_t)a3 starSize:(int64_t)a4 andFill:(BOOL)a5;
- (ASCStarRow)filledStarRowView;
- (ASCStarRow)hollowStarRowView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeWithStarSize:(int64_t)a3 andNumberOfStars:(int64_t)a4;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIColor)starColor;
- (double)rating;
- (id)accessibilityLabel;
- (int64_t)maxNumberOfStars;
- (int64_t)starSize;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setRating:(double)a3;
@end

@implementation ASCStarRatingView

+ (id)greyFill
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.556862745 green:0.556862745 blue:0.57254902 alpha:1.0];
}

- (ASCStarRatingView)initWithMaxNumberOfStars:(int64_t)a3 starSize:(int64_t)a4 andFill:(BOOL)a5
{
  v18.receiver = self;
  v18.super_class = (Class)ASCStarRatingView;
  v7 = -[ASCStarRatingView initWithFrame:](&v18, sel_initWithFrame_, a3, a4, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7->_rating = 0.0;
  v7->_maxNumberOfStars = a3;
  v7->_starSize = a4;
  v8 = [ASCStarRow alloc];
  v9 = [MEMORY[0x1E4FB1618] grayColor];
  double v10 = (double)a3;
  uint64_t v11 = [(ASCStarRow *)v8 initWithStarSize:a4 fill:1 starColor:v9 andMaxNumberOfStars:(double)a3];
  filledStarRowView = v7->_filledStarRowView;
  v7->_filledStarRowView = (ASCStarRow *)v11;

  v13 = [ASCStarRow alloc];
  v14 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v15 = [(ASCStarRow *)v13 initWithStarSize:a4 fill:0 starColor:v14 andMaxNumberOfStars:v10];
  hollowStarRowView = v7->_hollowStarRowView;
  v7->_hollowStarRowView = (ASCStarRow *)v15;

  [(ASCStarRow *)v7->_filledStarRowView setNumberOfStarsInRow:v7->_rating];
  [(ASCStarRow *)v7->_hollowStarRowView setNumberOfStarsInRow:(double)v7->_maxNumberOfStars];
  [(ASCStarRatingView *)v7 addSubview:v7->_filledStarRowView];
  [(ASCStarRatingView *)v7 addSubview:v7->_hollowStarRowView];
  return v7;
}

- (ASCStarRatingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (ASCStarRatingView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setRating:(double)a3
{
  if (self->_rating != a3)
  {
    double maxNumberOfStars = 0.0;
    if (a3 >= 0.0)
    {
      double maxNumberOfStars = (double)self->_maxNumberOfStars;
      if (maxNumberOfStars >= a3) {
        double maxNumberOfStars = a3;
      }
    }
    self->_rating = maxNumberOfStars;
    -[ASCStarRow setNumberOfStarsInRow:](self->_filledStarRowView, "setNumberOfStarsInRow:");
  }
}

- (CGSize)intrinsicContentSize
{
  -[ASCStarRatingView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[ASCStarRatingView sizeWithStarSize:andNumberOfStars:](self, "sizeWithStarSize:andNumberOfStars:", self->_starSize, self->_maxNumberOfStars, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v4 = -[ASCStarRatingView sizeThatFits:](self, "sizeThatFits:", a4, a3.width, a3.height);

  MEMORY[0x1F4129E50](v4);
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)ASCStarRatingView;
  [(ASCStarRatingView *)&v23 layoutSubviews];
  [(ASCStarRow *)self->_hollowStarRowView frame];
  double v4 = v3;
  [(ASCStarRow *)self->_hollowStarRowView frame];
  double v6 = v5;
  [(ASCStarRow *)self->_filledStarRowView frame];
  double v8 = v7;
  [(ASCStarRow *)self->_filledStarRowView frame];
  -[ASCStarRow setFrame:](self->_filledStarRowView, "setFrame:", v4, v6, v8);
  filledStarRowView = self->_filledStarRowView;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v21[0] = *MEMORY[0x1E4F1DAB8];
  long long v18 = v21[0];
  v21[1] = v19;
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v17 = v22;
  [(ASCStarRow *)filledStarRowView setTransform:v21];
  [(ASCStarRow *)self->_hollowStarRowView frame];
  double v11 = v10;
  [(ASCStarRow *)self->_hollowStarRowView frame];
  double v13 = v12;
  [(ASCStarRow *)self->_filledStarRowView frame];
  double v15 = v14;
  [(ASCStarRow *)self->_filledStarRowView frame];
  -[ASCStarRow setFrame:](self->_hollowStarRowView, "setFrame:", v11, v13, v15);
  hollowStarRowView = self->_hollowStarRowView;
  v20[0] = v18;
  v20[1] = v19;
  v20[2] = v17;
  [(ASCStarRow *)hollowStarRowView setTransform:v20];
}

- (CGSize)sizeWithStarSize:(int64_t)a3 andNumberOfStars:(int64_t)a4
{
  +[ASCStarRow sizeForStarRowWithSizeOfStar:a3 andNumberOfStars:(double)a4];
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)accessibilityLabel
{
  [(ASCStarRatingView *)self rating];
  float v3 = v2;

  return ASCAXStarRatingStringForRating(v3);
}

- (double)rating
{
  return self->_rating;
}

- (int64_t)maxNumberOfStars
{
  return self->_maxNumberOfStars;
}

- (int64_t)starSize
{
  return self->_starSize;
}

- (ASCStarRow)hollowStarRowView
{
  return self->_hollowStarRowView;
}

- (ASCStarRow)filledStarRowView
{
  return self->_filledStarRowView;
}

- (UIColor)starColor
{
  return self->_starColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starColor, 0);
  objc_storeStrong((id *)&self->_filledStarRowView, 0);

  objc_storeStrong((id *)&self->_hollowStarRowView, 0);
}

@end