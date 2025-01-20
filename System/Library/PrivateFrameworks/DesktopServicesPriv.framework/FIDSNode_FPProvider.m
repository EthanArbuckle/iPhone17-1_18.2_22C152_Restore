@interface FIDSNode_FPProvider
+ (id)makeWithCoder:(id)a3;
- (BOOL)isFPv2;
- (BOOL)isUsingFPFS;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIDSNode_FPProvider

+ (id)makeWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FI Domain"];
  v5 = static_objc_cast<NSString,objc_object * {__strong}>(v4);

  v6 = [v5 identifier];
  if ([v6 length])
  {
    v7 = v6;
    v12.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v12, v7);

    TNode::RootNodeForFPDomain((TNode *)&v12, 0, (TNodePtr *)&v13);
    v8 = (TNode *)TNodeFromFINode(v13);
    v9 = FIDSNodeFromTNode(v8);
    v10 = static_objc_cast<NSString,objc_object * {__strong}>(v9);

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v12.fString.fRef);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FIDSNode_FPProvider;
  [(FIDSNode *)&v6 encodeWithCoder:v4];
  v5 = [(FIDSNode *)self fpDomain];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"FI Domain"];
  }
}

- (BOOL)isUsingFPFS
{
  v2 = [(FIDSNode *)self fiDomain];
  char v3 = [v2 isUsingFPFS];

  return v3;
}

- (BOOL)isFPv2
{
  v2 = [(FIDSNode *)self fiDomain];
  char v3 = [v2 isFPv2];

  return v3;
}

@end