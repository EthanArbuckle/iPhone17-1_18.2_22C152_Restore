@interface AKTSDPathCut
- (AKTSDPathCut)initWithSegment:(int64_t)a3 atT:(double)a4 withSkew:(double)a5;
- (double)skew;
- (double)t;
- (id)description;
- (int64_t)segment;
@end

@implementation AKTSDPathCut

- (AKTSDPathCut)initWithSegment:(int64_t)a3 atT:(double)a4 withSkew:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AKTSDPathCut;
  result = [(AKTSDPathCut *)&v9 init];
  if (result)
  {
    result->mSegment = a3;
    result->mT = a4;
    result->mSkew = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"cut on seg %ld at %f skew %f", self->mSegment, *(void *)&self->mT, *(void *)&self->mSkew);
}

- (int64_t)segment
{
  return self->mSegment;
}

- (double)t
{
  return self->mT;
}

- (double)skew
{
  return self->mSkew;
}

@end