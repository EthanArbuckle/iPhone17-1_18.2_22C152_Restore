@interface IDSCKQueryOperation
+ (Class)__class;
+ (id)alloc;
- (id)completionBlock;
- (id)recordFetchedBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setRecordFetchedBlock:(id)a3;
@end

@implementation IDSCKQueryOperation

+ (Class)__class
{
  if (qword_1E944F520 != -1) {
    dispatch_once(&qword_1E944F520, &unk_1EEFCDBD8);
  }
  v2 = (void *)qword_1E944F518;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end