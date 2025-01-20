@interface CDMRegexEntry
- (CDMRegexEntry)initWithRegex:(id)a3 label:(id)a4;
- (NSRegularExpression)regularExpression;
- (NSString)label;
@end

@implementation CDMRegexEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

- (NSString)label
{
  return self->_label;
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (CDMRegexEntry)initWithRegex:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMRegexEntry;
  v9 = [(CDMRegexEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_regularExpression, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

@end