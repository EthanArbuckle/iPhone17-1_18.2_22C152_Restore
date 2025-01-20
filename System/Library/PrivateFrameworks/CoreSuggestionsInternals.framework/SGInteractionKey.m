@interface SGInteractionKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (SGInteractionKey)initWithBundleId:(id)a3 personHandle:(id)a4;
- (id)description;
@end

@implementation SGInteractionKey

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGInteractionKey *)self bundleId];
  v5 = [(SGInteractionKey *)self personHandle];
  v6 = (void *)[v3 initWithFormat:@"<SGInteractionKey bundleId:%@ personHandle:%@>", v4, v5];

  return v6;
}

- (SGInteractionKey)initWithBundleId:(id)a3 personHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGInteractionKey.m", 26, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGInteractionKey.m", 27, @"Invalid parameter not satisfying: %@", @"personHandle" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)SGInteractionKey;
  v10 = [(SGMessageKey *)&v14 initWithSource:v7 uniqueIdentifier:v9];

  return v10;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 16;
}

@end