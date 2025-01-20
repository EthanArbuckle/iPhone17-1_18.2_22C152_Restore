@interface UITextView(DataDetectorsOperationExtensions)
- (DDTextKitOperation)dd_newOperation;
- (uint64_t)dd_ignoreSignatures;
@end

@implementation UITextView(DataDetectorsOperationExtensions)

- (DDTextKitOperation)dd_newOperation
{
  v2 = [[DDTextKitOperation alloc] initWithContainer:a1];
  -[DDOperation setIgnoreSignatures:](v2, "setIgnoreSignatures:", objc_msgSend(a1, "dd_ignoreSignatures"));
  return v2;
}

- (uint64_t)dd_ignoreSignatures
{
  return 0;
}

@end