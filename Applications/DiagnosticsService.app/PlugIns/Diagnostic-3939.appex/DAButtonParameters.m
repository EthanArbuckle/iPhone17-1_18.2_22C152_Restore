@interface DAButtonParameters
- (DAButtonParameters)initWithDictionary:(id)a3;
- (NSArray)segments;
- (void)setSegments:(id)a3;
@end

@implementation DAButtonParameters

- (DAButtonParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v14 = 0;
  v13.receiver = self;
  v13.super_class = (Class)DAButtonParameters;
  v5 = [(DAParameters *)&v13 initWithDictionary:v4];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = +[NSSet setWithObject:objc_opt_class()];
    v8 = [v4 dk_arrayFromRequiredKey:@"segments" types:v7 maxLength:100 failed:&v14];

    uint64_t v9 = +[DASpecification specificationFromArray:v8];
    segments = v6->_segments;
    v6->_segments = (NSArray *)v9;

    BOOL v11 = v14 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  if (!v6->_segments || !v11)
  {

    v6 = 0;
  }

  return v6;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end