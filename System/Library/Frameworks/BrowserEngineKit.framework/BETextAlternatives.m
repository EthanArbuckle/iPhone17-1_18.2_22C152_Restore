@interface BETextAlternatives
- (BOOL)isLowConfidence;
- (NSArray)alternativeStrings;
- (NSString)primaryString;
- (NSTextAlternatives)backingTextAlternatives;
- (id)_initWithNSTextAlternatives:(id)a3;
- (void)noteSelectedAlternativeString:(id)a3;
@end

@implementation BETextAlternatives

- (id)_initWithNSTextAlternatives:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextAlternatives;
  v6 = [(BETextAlternatives *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingTextAlternatives, a3);
  }

  return v7;
}

- (void)noteSelectedAlternativeString:(id)a3
{
  id v4 = a3;
  id v5 = [(BETextAlternatives *)self backingTextAlternatives];
  [v5 noteSelectedAlternativeString:v4];
}

- (NSString)primaryString
{
  return [(NSTextAlternatives *)self->_backingTextAlternatives primaryString];
}

- (NSArray)alternativeStrings
{
  return [(NSTextAlternatives *)self->_backingTextAlternatives alternativeStrings];
}

- (BOOL)isLowConfidence
{
  return [(NSTextAlternatives *)self->_backingTextAlternatives isLowConfidence];
}

- (NSTextAlternatives)backingTextAlternatives
{
  return self->_backingTextAlternatives;
}

- (void).cxx_destruct
{
}

@end