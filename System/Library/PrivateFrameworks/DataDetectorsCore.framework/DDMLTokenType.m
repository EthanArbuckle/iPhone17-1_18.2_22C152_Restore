@interface DDMLTokenType
- (BOOL)beginning;
- (DDMLTokenType)initWithClassification:(int)a3 beginning:(BOOL)a4;
- (id)debugDescription;
- (int)classification;
@end

@implementation DDMLTokenType

- (BOOL)beginning
{
  return self->_beginning;
}

- (int)classification
{
  return self->_classification;
}

- (DDMLTokenType)initWithClassification:(int)a3 beginning:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DDMLTokenType;
  result = [(DDMLTokenType *)&v7 init];
  if (result)
  {
    result->_classification = a3;
    result->_beginning = a4;
  }
  return result;
}

- (id)debugDescription
{
  if ([(DDMLTokenType *)self classification] == 10)
  {
    v3 = @"0";
  }
  else
  {
    v4 = NSString;
    if ([(DDMLTokenType *)self beginning]) {
      v5 = @"B";
    }
    else {
      v5 = @"I";
    }
    unsigned int v6 = [(DDMLTokenType *)self classification];
    if (v6 > 0xA) {
      objc_super v7 = 0;
    }
    else {
      objc_super v7 = off_1E5984E70[v6];
    }
    v8 = v7;
    v3 = [v4 stringWithFormat:@"%@-%@", v5, v8];
  }

  return v3;
}

@end