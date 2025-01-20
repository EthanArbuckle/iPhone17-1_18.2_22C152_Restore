@interface CKDResponseBodyParser
- (BOOL)testRepeatedParseResults;
- (CKDResponseBodyParser)initWithQoS:(int64_t)a3;
- (NSError)parserError;
- (NSMutableData)parserData;
- (OS_dispatch_queue)parseQueue;
- (id)objectParsedBlock;
- (int64_t)qualityOfService;
- (void)finishWithCompletion:(id)a3;
- (void)processData:(id)a3 completionHandler:(id)a4;
- (void)setObjectParsedBlock:(id)a3;
- (void)setParserData:(id)a3;
- (void)setParserError:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTestRepeatedParseResults:(BOOL)a3;
@end

@implementation CKDResponseBodyParser

- (CKDResponseBodyParser)initWithQoS:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKDResponseBodyParser;
  result = [(CKDResponseBodyParser *)&v5 init];
  if (result) {
    result->_qualityOfService = a3;
  }
  return result;
}

- (OS_dispatch_queue)parseQueue
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_parseQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_msgSend_qualityOfService(v2, v4, v5);
    dispatch_qos_class_t v6 = CKQoSClassFromNSQualityOfService();
    v7 = dispatch_queue_attr_make_with_qos_class(v3, v6, 0);

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    objc_msgSend_stringByAppendingString_(@"com.apple.cloudkit.parser.", v10, (uint64_t)v9);
    id v11 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)objc_msgSend_UTF8String(v11, v12, v13);
    dispatch_queue_t v15 = dispatch_queue_create(v14, v7);
    parseQueue = v2->_parseQueue;
    v2->_parseQueue = (OS_dispatch_queue *)v15;
  }
  objc_sync_exit(v2);

  v17 = v2->_parseQueue;
  return v17;
}

- (NSMutableData)parserData
{
  v4 = objc_msgSend_parseQueue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  parserData = self->_parserData;
  return parserData;
}

- (void)setParserData:(id)a3
{
  v4 = (NSMutableData *)a3;
  v7 = objc_msgSend_parseQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  parserData = self->_parserData;
  self->_parserData = v4;
}

- (void)processData:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1A018]);
  uint64_t v8 = objc_opt_class();
  id v10 = (id)objc_msgSend_initWithCode_format_(v7, v9, 12, @"This method must be subclassed in class %@", v8);
  objc_exception_throw(v10);
}

- (void)finishWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1A018]);
  uint64_t v5 = objc_opt_class();
  id v7 = (id)objc_msgSend_initWithCode_format_(v4, v6, 12, @"This method must be subclassed in class %@", v5);
  objc_exception_throw(v7);
}

- (NSError)parserError
{
  return self->_parserError;
}

- (void)setParserError:(id)a3
{
}

- (BOOL)testRepeatedParseResults
{
  return self->_testRepeatedParseResults;
}

- (void)setTestRepeatedParseResults:(BOOL)a3
{
  self->_testRepeatedParseResults = a3;
}

- (id)objectParsedBlock
{
  return self->_objectParsedBlock;
}

- (void)setObjectParsedBlock:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectParsedBlock, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_parserData, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
}

@end