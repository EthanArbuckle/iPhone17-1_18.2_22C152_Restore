@interface CLSPersonIdentityResult
+ (id)personResultWithPerson:(id)a3 andConfidence:(float)a4;
- (BOOL)isSamePersonAsResult:(id)a3;
- (CLSPersonIdentity)person;
- (float)confidence;
- (id)description;
- (void)mergeWithResult:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setPerson:(id)a3;
@end

@implementation CLSPersonIdentityResult

- (void).cxx_destruct
{
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setPerson:(id)a3
{
}

- (CLSPersonIdentity)person
{
  return self->_person;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ (%f)", self->_person, self->_confidence];
}

- (void)mergeWithResult:(id)a3
{
  id v8 = a3;
  v4 = [(CLSPersonIdentityResult *)self person];
  v5 = [v8 person];
  [v4 mergeWithPerson:v5];

  [v8 confidence];
  if (v6 > self->_confidence)
  {
    [v8 confidence];
    self->_confidence = v7;
  }
}

- (BOOL)isSamePersonAsResult:(id)a3
{
  id v4 = a3;
  v5 = [(CLSPersonIdentityResult *)self person];
  float v6 = [v4 person];

  LOBYTE(v4) = [v5 isSamePersonAs:v6];
  return (char)v4;
}

+ (id)personResultWithPerson:(id)a3 andConfidence:(float)a4
{
  id v5 = a3;
  float v6 = objc_alloc_init(CLSPersonIdentityResult);
  [(CLSPersonIdentityResult *)v6 setPerson:v5];

  *(float *)&double v7 = a4;
  [(CLSPersonIdentityResult *)v6 setConfidence:v7];
  return v6;
}

@end