@interface CPLTestFeedbackMessage
+ (id)feedbackType;
- (CPLTestFeedbackMessage)initWithTestMessage:(id)a3 libraryIdentifier:(id)a4;
- (NSString)testMessage;
- (id)serverMessage;
@end

@implementation CPLTestFeedbackMessage

- (void).cxx_destruct
{
}

- (NSString)testMessage
{
  return self->_testMessage;
}

- (id)serverMessage
{
  v6.receiver = self;
  v6.super_class = (Class)CPLTestFeedbackMessage;
  v3 = [(CPLFeedbackMessage *)&v6 serverMessage];
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v4 setKey:@"message"];
  [(CPLServerFeedbackKeyAndValue *)v4 setValue:self->_testMessage];
  [v3 addKeysAndValues:v4];

  return v3;
}

- (CPLTestFeedbackMessage)initWithTestMessage:(id)a3 libraryIdentifier:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLTestFeedbackMessage;
  v7 = [(CPLFeedbackMessage *)&v11 initWithLibraryIdentifier:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    testMessage = v7->_testMessage;
    v7->_testMessage = (NSString *)v8;
  }
  return v7;
}

+ (id)feedbackType
{
  return @"test";
}

@end