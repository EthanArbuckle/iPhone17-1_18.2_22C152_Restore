@interface AVTGroupDialCell
+ (id)boldLabelFont;
+ (id)cellIdentifier;
+ (id)labelFont;
- (AVTGroupDialCell)initWithFrame:(CGRect)a3;
- (NSString)string;
- (NSTimer)shimmerTimer;
- (UILabel)label;
- (void)cancelShimmerTimer;
- (void)prepareForReuse;
- (void)setActiveItem:(BOOL)a3 animated:(BOOL)a4;
- (void)setShimmerTimer:(id)a3;
- (void)setString:(id)a3;
- (void)shimmerOnceWithCompletion:(id)a3;
- (void)startShimmering;
- (void)stopShimmeringAnimated:(BOOL)a3;
@end

@implementation AVTGroupDialCell

+ (id)cellIdentifier
{
  return @"AVTGroupDialCell";
}

+ (id)labelFont
{
  return +[AVTUIFontRepository groupDialLabelFont];
}

+ (id)boldLabelFont
{
  return +[AVTUIFontRepository groupDialBoldLabelFont];
}

- (AVTGroupDialCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTGroupDialCell;
  v3 = -[AVTGroupDialCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    [(AVTGroupDialCell *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTextAlignment:1];
    v7 = [(id)objc_opt_class() labelFont];
    [(UILabel *)v3->_label setFont:v7];

    v8 = +[AVTUIColorRepository groupDialCellTextColor];
    [(UILabel *)v3->_label setTextColor:v8];

    [(UILabel *)v3->_label setAutoresizingMask:18];
    v9 = [(AVTGroupDialCell *)v3 contentView];
    [v9 addSubview:v3->_label];
  }
  return v3;
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)AVTGroupDialCell;
  [(AVTGroupDialCell *)&v9 prepareForReuse];
  v3 = [(id)objc_opt_class() labelFont];
  id v4 = [(AVTGroupDialCell *)self label];
  [v4 setFont:v3];

  uint64_t v5 = +[AVTUIColorRepository groupDialCellTextColor];
  v6 = [(AVTGroupDialCell *)self label];
  [v6 setTextColor:v5];

  v7 = [(AVTGroupDialCell *)self label];
  v8 = [v7 layer];
  [v8 removeAllAnimations];

  [(AVTGroupDialCell *)self cancelShimmerTimer];
}

- (void)setString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_string, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_string, a3);
    uint64_t v5 = [(AVTGroupDialCell *)self label];
    [v5 setText:v6];
  }
}

- (void)setActiveItem:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(AVTGroupDialCell *)self cancelShimmerTimer];
  v7 = [(AVTGroupDialCell *)self label];
  v8 = [v7 layer];
  [v8 removeAllAnimations];

  objc_super v9 = (void *)MEMORY[0x263F1CB60];
  v10 = [(AVTGroupDialCell *)self label];
  double v11 = 0.2;
  v12[1] = 3221225472;
  v12[0] = MEMORY[0x263EF8330];
  v12[2] = __43__AVTGroupDialCell_setActiveItem_animated___block_invoke;
  v12[3] = &unk_263FF1318;
  if (!v4) {
    double v11 = 0.0;
  }
  v12[4] = self;
  BOOL v13 = a3;
  [v9 transitionWithView:v10 duration:5242880 options:v12 animations:0 completion:v11];
}

void __43__AVTGroupDialCell_setActiveItem_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = objc_opt_class();
  if (v2) {
    [v3 boldLabelFont];
  }
  else {
  BOOL v4 = [v3 labelFont];
  }
  uint64_t v5 = [*(id *)(a1 + 32) label];
  [v5 setFont:v4];

  if (*(unsigned char *)(a1 + 40)) {
    +[AVTUIColorRepository groupDialCellSelectedTextColor];
  }
  else {
  id v7 = +[AVTUIColorRepository groupDialCellTextColor];
  }
  id v6 = [*(id *)(a1 + 32) label];
  [v6 setTextColor:v7];
}

- (void)stopShimmeringAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTGroupDialCell *)self cancelShimmerTimer];
  uint64_t v5 = (void *)MEMORY[0x263F1CB60];
  id v6 = [(AVTGroupDialCell *)self label];
  double v7 = 0.0;
  if (v3) {
    double v7 = 1.0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke;
  v9[3] = &unk_263FF03D8;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke_2;
  v8[3] = &unk_263FF04A0;
  v8[4] = self;
  [v5 transitionWithView:v6 duration:5242884 options:v9 animations:v8 completion:v7];
}

void __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke(uint64_t a1)
{
  id v3 = +[AVTUIColorRepository groupDialCellTextColor];
  int v2 = [*(id *)(a1 + 32) label];
  [v2 setTextColor:v3];
}

void __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) label];
  v1 = [v2 layer];
  [v1 removeAllAnimations];
}

- (void)startShimmering
{
  [(AVTGroupDialCell *)self cancelShimmerTimer];
  id v3 = [(AVTGroupDialCell *)self label];
  BOOL v4 = [v3 layer];
  [v4 removeAllAnimations];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__AVTGroupDialCell_startShimmering__block_invoke;
  v5[3] = &unk_263FF04A0;
  v5[4] = self;
  [(AVTGroupDialCell *)self shimmerOnceWithCompletion:v5];
}

uint64_t __35__AVTGroupDialCell_startShimmering__block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    id v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __35__AVTGroupDialCell_startShimmering__block_invoke_2;
    v3[3] = &unk_263FF04A0;
    v3[4] = v2;
    return [v2 shimmerOnceWithCompletion:v3];
  }
  return result;
}

uint64_t __35__AVTGroupDialCell_startShimmering__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    id v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __35__AVTGroupDialCell_startShimmering__block_invoke_3;
    v3[3] = &unk_263FF04A0;
    v3[4] = v2;
    return [v2 shimmerOnceWithCompletion:v3];
  }
  return result;
}

void __35__AVTGroupDialCell_startShimmering__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = (void *)MEMORY[0x263EFFA20];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    double v7 = __35__AVTGroupDialCell_startShimmering__block_invoke_4;
    v8 = &unk_263FF1340;
    objc_copyWeak(&v9, &location);
    BOOL v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:8.0];
    objc_msgSend(*(id *)(a1 + 32), "setShimmerTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __35__AVTGroupDialCell_startShimmering__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startShimmering];
}

- (void)cancelShimmerTimer
{
  id v3 = [(AVTGroupDialCell *)self shimmerTimer];
  [v3 invalidate];

  [(AVTGroupDialCell *)self setShimmerTimer:0];
}

- (void)shimmerOnceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F1CB60];
  uint64_t v6 = [(AVTGroupDialCell *)self label];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke;
  v10[3] = &unk_263FF03D8;
  v10[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_2;
  v8[3] = &unk_263FF1368;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 transitionWithView:v6 duration:5242884 options:v10 animations:v8 completion:1.0];
}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = +[AVTUIColorRepository groupDialCellShimmeringTextColor];
  id v2 = [*(id *)(a1 + 32) label];
  [v2 setTextColor:v3];
}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x263F1CB60];
    id v4 = [*(id *)(a1 + 32) label];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_3;
    v6[3] = &unk_263FF03D8;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    [v3 transitionWithView:v4 duration:5242884 options:v6 animations:v5 completion:1.0];
  }
}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_3(uint64_t a1)
{
  id v3 = +[AVTUIColorRepository groupDialCellTextColor];
  id v2 = [*(id *)(a1 + 32) label];
  [v2 setTextColor:v3];
}

- (NSString)string
{
  return self->_string;
}

- (UILabel)label
{
  return self->_label;
}

- (NSTimer)shimmerTimer
{
  return self->_shimmerTimer;
}

- (void)setShimmerTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shimmerTimer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end