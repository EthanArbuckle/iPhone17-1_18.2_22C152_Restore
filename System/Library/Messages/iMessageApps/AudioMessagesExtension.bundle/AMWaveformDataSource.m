@interface AMWaveformDataSource
- (AMWaveformDataSource)initWithWaveformGenerator:(id)a3;
- (NSMutableArray)waveformSegments;
- (id)waveformSegmentsIntersectingTimeRange:(id)a3;
- (void)appendAveragePowerLevelsByDigestingWaveformSegment:(id)a3;
- (void)beginLoading;
- (void)reset;
- (void)setWaveformSegments:(id)a3;
- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformGeneratorWillBeginLoading:(id)a3;
@end

@implementation AMWaveformDataSource

- (AMWaveformDataSource)initWithWaveformGenerator:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMWaveformDataSource;
  v3 = [(RCWaveformDataSource *)&v7 initWithWaveformGenerator:a3 generatedWaveformOutputURL:0];
  if (v3)
  {
    uint64_t v4 = +[NSMutableArray array];
    waveformSegments = v3->_waveformSegments;
    v3->_waveformSegments = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)beginLoading
{
  v3 = [(RCWaveformDataSource *)self waveformGenerator];
  [v3 beginLoading];

  id v4 = [(RCWaveformDataSource *)self waveformGenerator];
  [v4 addSegmentOutputObserver:self];
}

- (id)waveformSegmentsIntersectingTimeRange:(id)a3
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_waveformSegments, a3.var0, a3.var1);
}

- (void)appendAveragePowerLevelsByDigestingWaveformSegment:(id)a3
{
  id v4 = a3;
  v5 = [(RCWaveformDataSource *)self waveformGenerator];
  v6 = (char *)[v5 state];

  if (v6 == (unsigned char *)&def_3AC7C + 1)
  {
    objc_super v7 = [(RCWaveformDataSource *)self waveformGenerator];
    id v9 = v4;
    v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v7 appendAveragePowerLevelsByDigestingWaveformSegments:v8];
  }
}

- (void)reset
{
}

- (void)waveformGeneratorWillBeginLoading:(id)a3
{
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
}

- (NSMutableArray)waveformSegments
{
  return self->_waveformSegments;
}

- (void)setWaveformSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end