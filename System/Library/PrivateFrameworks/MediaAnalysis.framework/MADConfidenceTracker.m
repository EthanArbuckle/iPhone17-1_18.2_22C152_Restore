@interface MADConfidenceTracker
- (MADConfidenceTracker)init;
- (double)updateConfidence:(double)a3;
@end

@implementation MADConfidenceTracker

- (MADConfidenceTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADConfidenceTracker;
  v2 = [(MADConfidenceTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    history = v2->_history;
    v2->_history = (NSMutableArray *)v3;

    v2->_confidence = 0.0;
  }
  return v2;
}

- (double)updateConfidence:(double)a3
{
  unint64_t v5 = +[MADVideoRemoveBackgroundSettings visionTrimWindow];
  history = self->_history;
  v7 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)history addObject:v7];

  self->_confidence = self->_confidence + a3;
  unint64_t v8 = [(NSMutableArray *)self->_history count];
  v9 = self->_history;
  if (v8 <= v5)
  {
    uint64_t v12 = [(NSMutableArray *)v9 count];
    double result = 1.0;
    if (v12 != v5) {
      return result;
    }
  }
  else
  {
    v10 = [(NSMutableArray *)v9 objectAtIndexedSubscript:0];
    [v10 doubleValue];
    self->_confidence = self->_confidence - v11;

    [(NSMutableArray *)self->_history removeObjectAtIndex:0];
  }
  return self->_confidence / (double)v5;
}

- (void).cxx_destruct
{
}

@end