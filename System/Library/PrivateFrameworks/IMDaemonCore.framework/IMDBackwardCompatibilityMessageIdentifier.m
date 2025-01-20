@interface IMDBackwardCompatibilityMessageIdentifier
+ (IMDBackwardCompatibilityMessageIdentifier)sharedIdentifier;
- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4;
- (IMDBackwardCompatibilityMessageIdentifier)init;
- (__IMDBackwardCompatibilityMessageIdentifier)swiftImplementation;
- (void)setSwiftImplementation:(id)a3;
@end

@implementation IMDBackwardCompatibilityMessageIdentifier

+ (IMDBackwardCompatibilityMessageIdentifier)sharedIdentifier
{
  if (qword_1EBE2BF20 != -1) {
    dispatch_once(&qword_1EBE2BF20, &unk_1F3390820);
  }
  v2 = (void *)qword_1EBE2BF28;

  return (IMDBackwardCompatibilityMessageIdentifier *)v2;
}

- (IMDBackwardCompatibilityMessageIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDBackwardCompatibilityMessageIdentifier;
  v2 = [(IMDBackwardCompatibilityMessageIdentifier *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(__IMDBackwardCompatibilityMessageIdentifier);
    swiftImplementation = v2->_swiftImplementation;
    v2->_swiftImplementation = v3;
  }
  return v2;
}

- (BOOL)isIgnorableBackwardCompatibilityMessage:(id)a3 inChat:(id)a4
{
  return [(__IMDBackwardCompatibilityMessageIdentifier *)self->_swiftImplementation isIgnorableBackwardCompatibilityMessage:a3 inChat:a4];
}

- (__IMDBackwardCompatibilityMessageIdentifier)swiftImplementation
{
  return self->_swiftImplementation;
}

- (void)setSwiftImplementation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end