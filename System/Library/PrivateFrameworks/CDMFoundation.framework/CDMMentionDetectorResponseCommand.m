@interface CDMMentionDetectorResponseCommand
- (CDMMentionDetectorResponseCommand)initWithResponse:(id)a3;
- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse)response;
@end

@implementation CDMMentionDetectorResponseCommand

- (void).cxx_destruct
{
}

- (SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse)response
{
  return self->_response;
}

- (CDMMentionDetectorResponseCommand)initWithResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionDetectorResponseCommand;
  v5 = [(CDMBaseCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_DETECTORMentionDetectorResponse *)v6;
  }
  return v5;
}

@end