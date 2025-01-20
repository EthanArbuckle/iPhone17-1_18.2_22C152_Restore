@interface IDSCKFetchRecordZonesOperation
+ (Class)__class;
+ (id)alloc;
- (id)fetchRecordZonesCompletionBlock;
- (void)setFetchRecordZonesCompletionBlock:(id)a3;
@end

@implementation IDSCKFetchRecordZonesOperation

+ (Class)__class
{
  if (qword_1E944F5A0 != -1) {
    dispatch_once(&qword_1E944F5A0, &unk_1EEFCE1D8);
  }
  v2 = (void *)qword_1E944F598;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (id)fetchRecordZonesCompletionBlock
{
  return self->_fetchRecordZonesCompletionBlock;
}

- (void)setFetchRecordZonesCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end