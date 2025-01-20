@interface CATActiveIDSServiceConnectionContentRequestMissingData
+ (id)instanceWithDictionary:(id)a3;
- (CATActiveIDSServiceConnectionContentRequestMissingData)initWithExpectedSequenceNumber:(unint64_t)a3;
- (NSDictionary)dictionaryValue;
- (int64_t)contentType;
- (unint64_t)expectedSequenceNumber;
@end

@implementation CATActiveIDSServiceConnectionContentRequestMissingData

- (CATActiveIDSServiceConnectionContentRequestMissingData)initWithExpectedSequenceNumber:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CATActiveIDSServiceConnectionContentRequestMissingData;
  result = [(CATActiveIDSServiceConnectionContentRequestMissingData *)&v5 init];
  if (result) {
    result->_expectedSequenceNumber = a3;
  }
  return result;
}

- (int64_t)contentType
{
  return 5;
}

- (NSDictionary)dictionaryValue
{
  v6[1] = *MEMORY[0x263EF8340];
  objc_super v5 = @"ExpectedSequenceNumber";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentRequestMissingData expectedSequenceNumber](self, "expectedSequenceNumber"));
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"ExpectedSequenceNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithExpectedSequenceNumber:", objc_msgSend(v6, "unsignedIntegerValue"));
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)expectedSequenceNumber
{
  return self->_expectedSequenceNumber;
}

@end