@interface CPLQuarantineFeedbackMessage
+ (id)feedbackType;
- (CPLQuarantineFeedbackMessage)initWithClass:(Class)a3 reason:(id)a4 libraryIdentifier:(id)a5;
- (Class)recordClass;
- (NSString)reason;
- (id)serverMessage;
@end

@implementation CPLQuarantineFeedbackMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (NSString)reason
{
  return self->_reason;
}

- (id)serverMessage
{
  v9.receiver = self;
  v9.super_class = (Class)CPLQuarantineFeedbackMessage;
  v3 = [(CPLFeedbackMessage *)&v9 serverMessage];
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v4 setKey:@"recordType"];
  Class recordClass = self->_recordClass;
  if (_CPLFeedbackRecordClassForClass_onceToken != -1) {
    dispatch_once(&_CPLFeedbackRecordClassForClass_onceToken, &__block_literal_global_2490);
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2491;
  v15 = __Block_byref_object_dispose__2492;
  id v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___CPLFeedbackRecordClassForClass_block_invoke_28;
  block[3] = &unk_1E60A7260;
  block[4] = &v11;
  block[5] = recordClass;
  dispatch_sync((dispatch_queue_t)_CPLFeedbackRecordClassForClass_queue, block);
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  [(CPLServerFeedbackKeyAndValue *)v4 setValue:v6];
  [v3 addKeysAndValues:v4];
  v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  [(CPLServerFeedbackKeyAndValue *)v7 setKey:@"reason"];
  [(CPLServerFeedbackKeyAndValue *)v7 setValue:self->_reason];
  [v3 addKeysAndValues:v7];

  return v3;
}

- (CPLQuarantineFeedbackMessage)initWithClass:(Class)a3 reason:(id)a4 libraryIdentifier:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLQuarantineFeedbackMessage;
  objc_super v9 = [(CPLFeedbackMessage *)&v14 initWithLibraryIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordClass, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

+ (id)feedbackType
{
  return @"quarantine";
}

@end