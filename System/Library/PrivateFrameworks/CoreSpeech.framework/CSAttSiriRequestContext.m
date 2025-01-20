@interface CSAttSiriRequestContext
+ (BOOL)supportsSecureCoding;
- (CSAttSiriRequestContext)initWithCoder:(id)a3;
- (CSAttSiriRequestContext)initWithRequestSource:(unint64_t)a3;
- (id)description;
- (unint64_t)reqSrc;
- (void)encodeWithCoder:(id)a3;
- (void)setReqSrc:(unint64_t)a3;
@end

@implementation CSAttSiriRequestContext

- (void)setReqSrc:(unint64_t)a3
{
  self->_reqSrc = a3;
}

- (unint64_t)reqSrc
{
  return self->_reqSrc;
}

- (id)description
{
  unint64_t v2 = self->_reqSrc - 1;
  if (v2 > 2) {
    return @"SiriFollowupforIdleAndQuiet";
  }
  else {
    return *(&off_10024E5C0 + v2);
  }
}

- (CSAttSiriRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSAttSiriRequestContext;
  v5 = [(CSAttSiriRequestContext *)&v7 init];
  if (v5) {
    v5->_reqSrc = (unint64_t)[v4 decodeIntegerForKey:@"CSAttSiriRequestSourceKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CSAttSiriRequestContext)initWithRequestSource:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSAttSiriRequestContext;
  result = [(CSAttSiriRequestContext *)&v5 init];
  if (result) {
    result->_reqSrc = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end