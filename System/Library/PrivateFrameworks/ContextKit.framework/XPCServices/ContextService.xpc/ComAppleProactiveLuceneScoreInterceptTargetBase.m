@interface ComAppleProactiveLuceneScoreInterceptTargetBase
- (BOOL)isEnabled;
- (BOOL)isScoringModified;
- (ComAppleProactiveLuceneScoreInterceptTargetBase)init;
- (void)setEnabledWithBoolean:(BOOL)a3;
- (void)setScoringModifiedWithBoolean:(BOOL)a3;
@end

@implementation ComAppleProactiveLuceneScoreInterceptTargetBase

- (BOOL)isScoringModified
{
  return self->scoringModified_;
}

- (void)setScoringModifiedWithBoolean:(BOOL)a3
{
  self->scoringModified_ = a3;
}

- (BOOL)isEnabled
{
  return self->enabled_;
}

- (void)setEnabledWithBoolean:(BOOL)a3
{
  self->enabled_ = a3;
}

- (ComAppleProactiveLuceneScoreInterceptTargetBase)init
{
  *(_WORD *)&self->enabled_ = 0;
  return self;
}

@end