@interface IPFeatureSentenceFragment
+ (id)fragmentWithRange:(_NSRange)a3 clusterType:(unint64_t)a4;
- (_NSRange)range;
- (double)probability_Confirmation;
- (double)probability_None;
- (double)probability_Proposal;
- (double)probability_Rejection;
- (id)description;
- (unint64_t)clusterType;
- (unint64_t)mainPolarity;
- (void)setClusterType:(unint64_t)a3;
- (void)setProbability_Confirmation:(double)a3;
- (void)setProbability_None:(double)a3;
- (void)setProbability_Proposal:(double)a3;
- (void)setProbability_Rejection:(double)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation IPFeatureSentenceFragment

+ (id)fragmentWithRange:(_NSRange)a3 clusterType:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = objc_alloc_init(IPFeatureSentenceFragment);
  -[IPFeatureSentenceFragment setRange:](v7, "setRange:", location, length);
  [(IPFeatureSentenceFragment *)v7 setClusterType:a4];
  return v7;
}

- (unint64_t)mainPolarity
{
  [(IPFeatureSentenceFragment *)self probability_None];
  double v4 = v3;
  [(IPFeatureSentenceFragment *)self probability_Rejection];
  double v6 = v5;
  [(IPFeatureSentenceFragment *)self probability_Proposal];
  double v8 = v7;
  [(IPFeatureSentenceFragment *)self probability_Confirmation];
  if (v4 > 0.5) {
    return 1;
  }
  if (v8 + v9 >= 0.66)
  {
    if (v9 <= v8) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else if (v6 >= 0.35)
  {
    return 4;
  }
  else if (v8 < 0.54 || v8 <= v6 || v8 <= v9)
  {
    if (v9 <= v6 || v9 <= v8 || v9 < 0.54) {
      return 5;
    }
    else {
      return 3;
    }
  }
  else
  {
    return 2;
  }
}

- (id)description
{
  double v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureSentenceFragment;
  double v4 = [(IPFeatureSentenceFragment *)&v9 description];
  double v5 = +[IPFeatureSentence humanReadableFeaturePolarity:[(IPFeatureSentenceFragment *)self mainPolarity]];
  double v6 = +[IPEventClassificationType humanReadableClusterType:[(IPFeatureSentenceFragment *)self clusterType]];
  double v7 = [v3 stringWithFormat:@"%@ MainPolarity:%@ Cluster:%@ \nprobability_None=%f \nprobability_Rejection=%f \nprobability_Proposal=%f \nprobability_Confirmation=%f", v4, v5, v6, *(void *)&self->_probability_None, *(void *)&self->_probability_Rejection, *(void *)&self->_probability_Proposal, *(void *)&self->_probability_Confirmation];

  return v7;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (unint64_t)clusterType
{
  return self->_clusterType;
}

- (void)setClusterType:(unint64_t)a3
{
  self->_clusterType = a3;
}

- (double)probability_None
{
  return self->_probability_None;
}

- (void)setProbability_None:(double)a3
{
  self->_probability_None = a3;
}

- (double)probability_Rejection
{
  return self->_probability_Rejection;
}

- (void)setProbability_Rejection:(double)a3
{
  self->_probability_Rejection = a3;
}

- (double)probability_Proposal
{
  return self->_probability_Proposal;
}

- (void)setProbability_Proposal:(double)a3
{
  self->_probability_Proposal = a3;
}

- (double)probability_Confirmation
{
  return self->_probability_Confirmation;
}

- (void)setProbability_Confirmation:(double)a3
{
  self->_probability_Confirmation = a3;
}

@end