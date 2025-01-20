@interface DAStateRange
- (DAStateRange)initWithDictionary:(id)a3;
- (_NSRange)displayAssetRange;
- (_NSRange)transitionAssetRange;
- (void)setDisplayAssetRange:(_NSRange)a3;
- (void)setTransitionAssetRange:(_NSRange)a3;
@end

@implementation DAStateRange

- (DAStateRange)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v19 = 0;
  v18.receiver = self;
  v18.super_class = (Class)DAStateRange;
  v5 = [(DASpecification *)&v18 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 dk_dictionaryFromRequiredKey:@"displayAssetRange" failed:&v19];
    v7 = [v6 dk_numberFromRequiredKey:@"start" lowerBound:&off_100011118 upperBound:&off_100011130 failed:&v19];
    signed int v8 = [v7 intValue];

    v9 = [v6 dk_numberFromRequiredKey:@"finish" lowerBound:&off_100011118 upperBound:&off_100011130 failed:&v19];
    unsigned int v10 = [v9 intValue];

    v5->_displayAssetRange.location = v8;
    v5->_displayAssetRange.length = (int)(v10 - v8 + 1);
    v11 = [v4 dk_dictionaryFromKey:@"transitionAssetRange" defaultValue:0 failed:&v19];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 dk_numberFromRequiredKey:@"start" lowerBound:&off_100011118 upperBound:&off_100011130 failed:&v19];
      signed int v14 = [v13 intValue];

      v15 = [v12 dk_numberFromRequiredKey:@"finish" lowerBound:&off_100011118 upperBound:&off_100011130 failed:&v19];
      unsigned int v16 = [v15 intValue];

      v5->_transitionAssetRange.location = v14;
      v5->_transitionAssetRange.length = (int)(v16 - v14 + 1);
    }
    else
    {
      v5->_transitionAssetRange.location = 0;
      v5->_transitionAssetRange.length = 0;
    }

    if (v19)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (_NSRange)displayAssetRange
{
  p_displayAssetRange = &self->_displayAssetRange;
  NSUInteger location = self->_displayAssetRange.location;
  NSUInteger length = p_displayAssetRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDisplayAssetRange:(_NSRange)a3
{
  self->_displayAssetRange = a3;
}

- (_NSRange)transitionAssetRange
{
  p_transitionAssetRange = &self->_transitionAssetRange;
  NSUInteger location = self->_transitionAssetRange.location;
  NSUInteger length = p_transitionAssetRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTransitionAssetRange:(_NSRange)a3
{
  self->_transitionAssetRange = a3;
}

@end