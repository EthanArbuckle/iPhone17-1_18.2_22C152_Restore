@interface AXMVisionFeatureAestheticsResult
+ (BOOL)supportsSecureCoding;
- (AXMVisionFeatureAestheticsResult)initWithCoder:(id)a3;
- (AXMVisionFeatureAestheticsResult)initWithVisionAestheticsObservation:(id)a3;
- (float)aestheticScore;
- (float)failureScore;
- (float)noiseScore;
- (float)pleasantCompositionScore;
- (float)wellChosenBackgroundScore;
- (float)wellFramedSubjectScore;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMVisionFeatureAestheticsResult

- (AXMVisionFeatureAestheticsResult)initWithVisionAestheticsObservation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMVisionFeatureAestheticsResult;
  v5 = [(AXMVisionFeatureAestheticsResult *)&v14 init];
  if (v5)
  {
    [v4 aestheticScore];
    v5->_aestheticScore = v6;
    [v4 wellFramedSubjectScore];
    v5->_wellFramedSubjectScore = v7;
    [v4 wellChosenBackgroundScore];
    v5->_wellChosenBackgroundScore = v8;
    [v4 noiseScore];
    v5->_noiseScore = v9;
    [v4 failureScore];
    v5->_failureScore = v10;
    [v4 pleasantCompositionScore];
    v5->_pleasantCompositionScore = v11;
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureAestheticsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMVisionFeatureAestheticsResult;
  v5 = [(AXMVisionFeatureAestheticsResult *)&v14 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"aestheticScore"];
    v5->_aestheticScore = v6;
    [v4 decodeFloatForKey:@"wellFramedSubjectScore"];
    v5->_wellFramedSubjectScore = v7;
    [v4 decodeFloatForKey:@"wellChosenBackgroundScore"];
    v5->_wellChosenBackgroundScore = v8;
    [v4 decodeFloatForKey:@"noiseScore"];
    v5->_noiseScore = v9;
    [v4 decodeFloatForKey:@"failureScore"];
    v5->_failureScore = v10;
    [v4 decodeFloatForKey:@"pleasantCompositionScore"];
    v5->_pleasantCompositionScore = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AXMVisionFeatureAestheticsResult *)self aestheticScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"aestheticScore");
  [(AXMVisionFeatureAestheticsResult *)self wellFramedSubjectScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"wellFramedSubjectScore");
  [(AXMVisionFeatureAestheticsResult *)self wellChosenBackgroundScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"wellChosenBackgroundScore");
  [(AXMVisionFeatureAestheticsResult *)self noiseScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"noiseScore");
  [(AXMVisionFeatureAestheticsResult *)self failureScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"failureScore");
  [(AXMVisionFeatureAestheticsResult *)self pleasantCompositionScore];
  objc_msgSend(v4, "encodeFloat:forKey:", @"pleasantCompositionScore");
}

- (id)description
{
  v3 = NSString;
  [(AXMVisionFeatureAestheticsResult *)self aestheticScore];
  double v5 = v4;
  [(AXMVisionFeatureAestheticsResult *)self wellFramedSubjectScore];
  double v7 = v6;
  [(AXMVisionFeatureAestheticsResult *)self wellChosenBackgroundScore];
  double v9 = v8;
  [(AXMVisionFeatureAestheticsResult *)self noiseScore];
  double v11 = v10;
  [(AXMVisionFeatureAestheticsResult *)self failureScore];
  double v13 = v12;
  [(AXMVisionFeatureAestheticsResult *)self pleasantCompositionScore];
  return (id)[v3 stringWithFormat:@"Aesthetics: aesthetic=%.2f wellFramedSubject=%.2f wellChosenBackground=%.2f noise=%.2f failure=%.2f pleasantComposition=%.2f", *(void *)&v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, v14];
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (float)wellChosenBackgroundScore
{
  return self->_wellChosenBackgroundScore;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

@end