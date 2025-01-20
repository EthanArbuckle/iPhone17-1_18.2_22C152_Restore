@interface MREResult
- (MREResult)initWithTrackId:(unint64_t)a3 offset:(double)a4 timeSkew:(id)a5 freqSkew:(id)a6 score:(id)a7;
- (NSNumber)freqSkew;
- (NSNumber)score;
- (NSNumber)timeSkew;
- (double)offset;
- (unint64_t)trackID;
- (void)dealloc;
@end

@implementation MREResult

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MREResult;
  [(MREResult *)&v3 dealloc];
}

- (MREResult)initWithTrackId:(unint64_t)a3 offset:(double)a4 timeSkew:(id)a5 freqSkew:(id)a6 score:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)MREResult;
  v12 = [(MREResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_offset = a4;
    v12->_timeSkew = (NSNumber *)a5;
    v13->_freqSkew = (NSNumber *)a6;
    v13->_trackID = a3;
    v13->_score = (NSNumber *)a7;
  }
  return v13;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (double)offset
{
  return self->_offset;
}

- (NSNumber)timeSkew
{
  return self->_timeSkew;
}

- (NSNumber)freqSkew
{
  return self->_freqSkew;
}

- (NSNumber)score
{
  return self->_score;
}

@end