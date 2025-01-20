@interface CCSetSyncPolicy
- (CCSetSyncPolicy)initWithPolicyDictionary:(id)a3 forSetIdentifier:(id)a4;
- (NSString)setIdentifier;
@end

@implementation CCSetSyncPolicy

- (CCSetSyncPolicy)initWithPolicyDictionary:(id)a3 forSetIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CCSetSyncPolicy;
  v8 = [(BMResourceSyncPolicy *)&v11 initWithPolicyDictionary:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_setIdentifier, a4);
  }

  return v9;
}

- (NSString)setIdentifier
{
  return self->_setIdentifier;
}

- (void).cxx_destruct
{
}

@end