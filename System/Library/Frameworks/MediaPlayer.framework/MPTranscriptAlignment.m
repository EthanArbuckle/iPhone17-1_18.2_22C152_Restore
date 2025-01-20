@interface MPTranscriptAlignment
- (BOOL)matchedBeginning;
- (BOOL)matchedEnd;
- (MPTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8;
- (double)playerEndTime;
- (double)playerStartTime;
- (double)referenceEndTime;
- (double)referenceStartTime;
- (id)description;
@end

@implementation MPTranscriptAlignment

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(MPTranscriptAlignment *)self playerStartTime];
  uint64_t v7 = v6;
  [(MPTranscriptAlignment *)self playerEndTime];
  uint64_t v9 = v8;
  [(MPTranscriptAlignment *)self referenceStartTime];
  uint64_t v11 = v10;
  [(MPTranscriptAlignment *)self referenceEndTime];
  v13 = [v3 stringWithFormat:@"<%@: %p, Player: [%0.2f, %0.2f], Reference: [%0.2f, %0.2f]>", v5, self, v7, v9, v11, v12];

  return v13;
}

- (MPTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)MPTranscriptAlignment;
  result = [(MPTranscriptAlignment *)&v15 init];
  if (result)
  {
    result->_playerStartTime = a3;
    result->_playerEndTime = a4;
    result->_referenceStartTime = a5;
    result->_referenceEndTime = a6;
    result->_matchedBeginning = a7;
    result->_matchedEnd = a8;
  }
  return result;
}

@end