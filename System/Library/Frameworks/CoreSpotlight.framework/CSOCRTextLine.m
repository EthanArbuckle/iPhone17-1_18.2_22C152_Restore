@interface CSOCRTextLine
- (BOOL)isTitle;
- (CGRect)textBounds;
- (CSOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4;
- (double)candidateConfidenceAtIndex:(int)a3;
- (id)candidateTextAtIndex:(int)a3;
- (id)description;
- (int64_t)candidateCount;
- (void)addCandidate:(id)a3 confidence:(double)a4;
- (void)appendToString:(id)a3;
@end

@implementation CSOCRTextLine

- (id)description
{
  if (self->_count)
  {
    v3 = [NSString stringWithFormat:@" score: %f string: %@", *(void *)&self->_scores[0], self->_strings[0]];
  }
  else
  {
    v3 = &stru_1EDBB3A50;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; t: %d (x: %f y: %f w: %f, h: %f)%@>",
    objc_opt_class(),
    self,
    self->_isTitle,
    *(void *)&self->_textBounds.origin.x,
    *(void *)&self->_textBounds.origin.y,
    *(void *)&self->_textBounds.size.width,
    *(void *)&self->_textBounds.size.height,
  v4 = v3);

  return v4;
}

- (CSOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CSOCRTextLine;
  result = [(CSOCRTextLine *)&v10 init];
  if (result)
  {
    result->_textBounds.origin.CGFloat x = x;
    result->_textBounds.origin.CGFloat y = y;
    result->_textBounds.size.CGFloat width = width;
    result->_textBounds.size.CGFloat height = height;
    result->_isTitle = a4;
  }
  return result;
}

- (void)addCandidate:(id)a3 confidence:(double)a4
{
  int64_t count = self->_count;
  if (count <= 2)
  {
    uint64_t v7 = [a3 copy];
    v8 = &self->super.isa + count;
    Class v9 = v8[1];
    v8[1] = (Class)v7;

    *((double *)v8 + 4) = a4;
    ++self->_count;
  }
}

- (int64_t)candidateCount
{
  return self->_count;
}

- (id)candidateTextAtIndex:(int)a3
{
  if (self->_count <= a3) {
    v3 = 0;
  }
  else {
    v3 = (void *)[(NSString *)self->_strings[a3] copy];
  }

  return v3;
}

- (double)candidateConfidenceAtIndex:(int)a3
{
  double result = 0.0;
  if (self->_count > a3) {
    return self->_scores[a3];
  }
  return result;
}

- (CGRect)textBounds
{
  double x = self->_textBounds.origin.x;
  double y = self->_textBounds.origin.y;
  double width = self->_textBounds.size.width;
  double height = self->_textBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)appendToString:(id)a3
{
  id v6 = a3;
  if (self->_count >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = v6;
      if (v4)
      {
        [v6 appendString:@"\n"];
        v5 = v6;
      }
      [v5 appendString:self->_strings[v4++]];
    }
    while (v4 < self->_count);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end