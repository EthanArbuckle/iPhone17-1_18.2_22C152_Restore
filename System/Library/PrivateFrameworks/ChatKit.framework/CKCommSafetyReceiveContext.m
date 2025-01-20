@interface CKCommSafetyReceiveContext
+ (NSString)contextKey;
+ (id)contextWithIndexPath:(id)a3;
+ (id)contextWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4;
- (BOOL)shouldTargetAssociatedMessages;
- (CKCommSafetyReceiveContext)initWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4;
- (NSIndexPath)indexPath;
@end

@implementation CKCommSafetyReceiveContext

+ (NSString)contextKey
{
  return (NSString *)@"CKCommSafetyContextKeyReceive";
}

+ (id)contextWithIndexPath:(id)a3
{
  id v3 = a3;
  v4 = [[CKCommSafetyReceiveContext alloc] initWithIndexPath:v3 shouldTargetAssociatedMessages:0];

  return v4;
}

+ (id)contextWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[CKCommSafetyReceiveContext alloc] initWithIndexPath:v5 shouldTargetAssociatedMessages:v4];

  return v6;
}

- (CKCommSafetyReceiveContext)initWithIndexPath:(id)a3 shouldTargetAssociatedMessages:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKCommSafetyReceiveContext;
  v8 = [(CKCommSafetyReceiveContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_indexPath, a3);
    v9->_shouldTargetAssociatedMessages = a4;
  }

  return v9;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (BOOL)shouldTargetAssociatedMessages
{
  return self->_shouldTargetAssociatedMessages;
}

- (void).cxx_destruct
{
}

@end