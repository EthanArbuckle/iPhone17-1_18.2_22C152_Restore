@interface IDSCKModifyRecordsOperation
+ (Class)__class;
+ (id)alloc;
- (id)modifyRecordsCompletionBlock;
- (int64_t)savePolicy;
- (void)setModifyRecordsCompletionBlock:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
@end

@implementation IDSCKModifyRecordsOperation

+ (Class)__class
{
  if (qword_1E944F510 != -1) {
    dispatch_once(&qword_1E944F510, &unk_1EEFCDA38);
  }
  v2 = (void *)qword_1E944F508;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (id)modifyRecordsCompletionBlock
{
  return self->_modifyRecordsCompletionBlock;
}

- (void)setModifyRecordsCompletionBlock:(id)a3
{
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (void).cxx_destruct
{
}

@end