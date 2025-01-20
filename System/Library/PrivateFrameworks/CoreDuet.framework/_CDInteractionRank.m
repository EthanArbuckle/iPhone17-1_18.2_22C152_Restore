@interface _CDInteractionRank
- (NSSet)reasons;
- (double)score;
- (void)setReasons:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation _CDInteractionRank

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSSet)reasons
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end