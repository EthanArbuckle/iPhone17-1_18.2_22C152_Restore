@interface VCPFrameScoreFilter
- (VCPFrameScoreFilter)initWithFilterTabs:(int)a3 distanceVariance:(float)a4 diffVariance:(float)a5;
- (float)processFrameScore:(float)a3 validScore:(BOOL)a4;
- (void)dealloc;
@end

@implementation VCPFrameScoreFilter

- (VCPFrameScoreFilter)initWithFilterTabs:(int)a3 distanceVariance:(float)a4 diffVariance:(float)a5
{
  v10.receiver = self;
  v10.super_class = (Class)VCPFrameScoreFilter;
  v8 = [(VCPFrameScoreFilter *)&v10 init];
  if (v8)
  {
    v8->_numFilterTabs = a3;
    v8->_distanceVariance = a4;
    v8->_diffVariance = a5;
    v8->_numOfScores = 0;
    operator new[]();
  }

  return 0;
}

- (void)dealloc
{
  scoreArray = self->_scoreArray;
  if (scoreArray) {
    MEMORY[0x1C186C790](scoreArray, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPFrameScoreFilter;
  [(VCPFrameScoreFilter *)&v4 dealloc];
}

- (float)processFrameScore:(float)a3 validScore:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t numOfScores = self->_numOfScores;
  if ((int)numOfScores < 1)
  {
    float v13 = 0.0;
    float v12 = 0.0;
  }
  else
  {
    uint64_t v8 = 0;
    float v9 = self->_distanceVariance * self->_distanceVariance;
    float v10 = self->_diffVariance * self->_diffVariance;
    scoreArray = self->_scoreArray;
    float v12 = 0.0;
    float v13 = 0.0;
    do
    {
      uint64_t v14 = v8 + 1;
      float v15 = expf((float)((float)((float)(v8 + 1) * -0.5) * (float)(v8 + 1)) / v9);
      float v16 = scoreArray[v8];
      float v17 = vabds_f32(a3, v16);
      if (!v4) {
        float v17 = 0.0;
      }
      float v18 = v15 * expf((float)(v17 * (float)(v17 * -0.5)) / v10);
      float v12 = v12 + (float)(v16 * v18);
      float v13 = v13 + v18;
      ++v8;
    }
    while (numOfScores != v14);
  }
  int numFilterTabs = self->_numFilterTabs;
  v20 = self->_scoreArray;
  if (numFilterTabs > 1)
  {
    unint64_t v21 = self->_numFilterTabs;
    do
      v20[(v21 - 1)] = v20[(v21 - 2)];
    while (v21-- > 2);
  }
  float v23 = v13 + 1.0;
  if (!v4) {
    float v23 = v13;
  }
  float v24 = -0.0;
  if (v4) {
    float v24 = a3;
  }
  float v25 = (float)(v24 + v12) / v23;
  if (v23 <= 0.0) {
    float result = a3;
  }
  else {
    float result = v25;
  }
  if (v4) {
    float v27 = a3;
  }
  else {
    float v27 = result;
  }
  float *v20 = v27;
  if (numFilterTabs >= (int)numOfScores + 1) {
    int numFilterTabs = numOfScores + 1;
  }
  self->_uint64_t numOfScores = numFilterTabs;
  return result;
}

@end