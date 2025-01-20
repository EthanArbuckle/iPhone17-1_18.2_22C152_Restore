@interface PersonalAudioVisualizerView
- (CAShapeLayer)baseLine;
- (CGSize)intrinsicContentSize;
- (NSMutableArray)levels;
- (PersonalAudioVisualizerView)initWithTuningIndex:(unint64_t)a3;
- (unint64_t)numberOfPips;
- (unint64_t)tuningIndex;
- (void)setBaseLine:(id)a3;
- (void)setLevels:(id)a3;
- (void)setTuningIndex:(unint64_t)a3;
- (void)updateWithMagnitudes:(id)a3;
@end

@implementation PersonalAudioVisualizerView

- (unint64_t)numberOfPips
{
  return 30;
}

- (PersonalAudioVisualizerView)initWithTuningIndex:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PersonalAudioVisualizerView;
  v4 = [(PersonalAudioVisualizerView *)&v18 init];
  v5 = v4;
  if (v4)
  {
    [(PersonalAudioVisualizerView *)v4 setTuningIndex:a3];
    v6 = +[NSMutableArray array];
    unint64_t v7 = [(PersonalAudioVisualizerView *)v5 numberOfPips];
    if (v7)
    {
      unint64_t v8 = v7;
      do
      {
        id v9 = objc_alloc_init((Class)CAShapeLayer);
        id v10 = +[UIColor systemGrayColor];
        objc_msgSend(v9, "setFillColor:", objc_msgSend(v10, "CGColor"));

        v11 = [(PersonalAudioVisualizerView *)v5 layer];
        [v11 addSublayer:v9];

        [v6 addObject:v9];
        --v8;
      }
      while (v8);
    }
    [(PersonalAudioVisualizerView *)v5 setLevels:v6];
    v12 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    baseLine = v5->_baseLine;
    v5->_baseLine = v12;

    v14 = v5->_baseLine;
    id v15 = +[UIColor systemLightGrayColor];
    -[CAShapeLayer setFillColor:](v14, "setFillColor:", [v15 CGColor]);

    v16 = [(PersonalAudioVisualizerView *)v5 layer];
    [v16 addSublayer:v5->_baseLine];
  }
  return v5;
}

- (void)updateWithMagnitudes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 300.0;
  double v3 = 115.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
}

- (CAShapeLayer)baseLine
{
  return self->_baseLine;
}

- (void)setBaseLine:(id)a3
{
}

- (unint64_t)tuningIndex
{
  return self->_tuningIndex;
}

- (void)setTuningIndex:(unint64_t)a3
{
  self->_tuningIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLine, 0);

  objc_storeStrong((id *)&self->_levels, 0);
}

@end