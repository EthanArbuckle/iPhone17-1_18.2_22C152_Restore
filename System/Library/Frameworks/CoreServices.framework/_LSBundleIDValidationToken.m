@interface _LSBundleIDValidationToken
+ (BOOL)isToken:(void *)a3 correctForBundleIdentifier:(void *)a4 connection:;
+ (BOOL)supportsSecureCoding;
- (id)initWithBundleIdentifier:(id)a1;
@end

@implementation _LSBundleIDValidationToken

- (id)initWithBundleIdentifier:(id)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3) {
      v3 = &stru_1ECB1A570;
    }
    v5 = [(__CFString *)v3 dataUsingEncoding:4];
    v7.receiver = a1;
    v7.super_class = (Class)_LSBundleIDValidationToken;
    a1 = objc_msgSendSuper2(&v7, sel_initWithPayload_, v5);
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isToken:(void *)a3 correctForBundleIdentifier:(void *)a4 connection:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (v6)
  {
    if (!v7
      || ([v7 dataUsingEncoding:4],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = -[_LSValidationToken isCorrectForPayload:]((uint64_t)v6, v9),
          v9,
          (v10 & 1) == 0))
    {
      v11 = [v8 _xpcConnection];
      v12 = (void *)_LSCopyBundleIdentifierForXPCConnection(v11, 1);

      v13 = [v12 dataUsingEncoding:4];
      BOOL v14 = v13 && (-[_LSValidationToken isCorrectForPayload:]((uint64_t)v6, v13) & 1) != 0;

      goto LABEL_12;
    }
  }
  else if (v8)
  {
    v12 = [v8 _xpcConnection];
    BOOL v14 = _LSXPCConnectionMayMapDatabase(v12) != 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

@end