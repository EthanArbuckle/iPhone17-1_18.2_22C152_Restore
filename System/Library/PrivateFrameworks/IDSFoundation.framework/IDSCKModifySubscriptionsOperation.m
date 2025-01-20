@interface IDSCKModifySubscriptionsOperation
+ (Class)__class;
+ (id)alloc;
- (id)modifySubscriptionsCompletionBlock;
- (void)setModifySubscriptionsCompletionBlock:(id)a3;
@end

@implementation IDSCKModifySubscriptionsOperation

+ (Class)__class
{
  if (qword_1E944F600 != -1) {
    dispatch_once(&qword_1E944F600, &unk_1EEFCE3D8);
  }
  v2 = (void *)qword_1E944F5F8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (id)modifySubscriptionsCompletionBlock
{
  return self->_modifySubscriptionsCompletionBlock;
}

- (void)setModifySubscriptionsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end