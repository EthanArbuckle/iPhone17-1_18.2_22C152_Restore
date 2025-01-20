@interface _DASInternalPolicyEvaluationMetadata
+ (id)metadataWithScore:(double)a3;
- (_DASInternalPolicyEvaluationMetadata)initWithScore:(double)a3 reason:(int64_t)a4 decision:(int64_t)a5;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)decision;
- (int64_t)reason;
- (void)setDecision:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setScore:(double)a3;
@end

@implementation _DASInternalPolicyEvaluationMetadata

+ (id)metadataWithScore:(double)a3
{
  v4 = objc_opt_new();
  [v4 setScore:a3];

  return v4;
}

- (_DASInternalPolicyEvaluationMetadata)initWithScore:(double)a3 reason:(int64_t)a4 decision:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_DASInternalPolicyEvaluationMetadata;
  result = [(_DASInternalPolicyEvaluationMetadata *)&v9 init];
  if (result)
  {
    result->_score = a3;
    result->_reason = a4;
    result->_decision = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_DASInternalPolicyEvaluationMetadata allocWithZone:a3];
  double score = self->_score;
  int64_t reason = self->_reason;
  int64_t decision = self->_decision;

  return [(_DASInternalPolicyEvaluationMetadata *)v4 initWithScore:reason reason:decision decision:score];
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_double score = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_int64_t reason = a3;
}

- (int64_t)decision
{
  return self->_decision;
}

- (void)setDecision:(int64_t)a3
{
  self->_int64_t decision = a3;
}

@end