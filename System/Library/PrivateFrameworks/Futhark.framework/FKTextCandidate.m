@interface FKTextCandidate
- (FKTextCandidate)initWithText:(id)a3 confidence:(float)a4;
- (NSString)text;
- (float)confidence;
- (void)dealloc;
@end

@implementation FKTextCandidate

- (FKTextCandidate)initWithText:(id)a3 confidence:(float)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FKTextCandidate;
  v6 = [(FKTextCandidate *)&v8 init];
  if (v6)
  {
    v6->_text = (NSString *)a3;
    v6->_confidence = a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_text = 0;
  v3.receiver = self;
  v3.super_class = (Class)FKTextCandidate;
  [(FKTextCandidate *)&v3 dealloc];
}

- (NSString)text
{
  return self->_text;
}

- (float)confidence
{
  return self->_confidence;
}

@end