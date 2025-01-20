@interface VSSubscriptionSource
+ (BOOL)supportsSecureCoding;
+ (id)currentSource;
+ (id)subscriptionSourceForAppWithBundleID:(id)a3;
+ (id)subscriptionSourceForWebsiteWithDomainName:(id)a3;
+ (id)subscriptionSourceForWebsiteWithURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (VSSubscriptionSource)init;
- (VSSubscriptionSource)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKind:(int64_t)a3;
@end

@implementation VSSubscriptionSource

+ (id)currentSource
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  v4 = +[VSOptional optionalWithObject:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__VSSubscriptionSource_currentSource__block_invoke;
  v9[3] = &unk_1E6BD36F8;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__VSSubscriptionSource_currentSource__block_invoke_2;
  v8[3] = &unk_1E6BD37D0;
  v8[4] = &v10;
  [v4 conditionallyUnwrapObject:v9 otherwise:v8];

  v5 = (void *)v11[5];
  if (!v5)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The source parameter must not be nil."];
    v5 = (void *)v11[5];
  }
  id v6 = v5;

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __37__VSSubscriptionSource_currentSource__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = +[VSSubscriptionSource subscriptionSourceForAppWithBundleID:a2];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __37__VSSubscriptionSource_currentSource__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v7 = [v2 processName];

  uint64_t v3 = +[VSSubscriptionSource subscriptionSourceForAppWithBundleID:v7];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)subscriptionSourceForWebsiteWithURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The webURL parameter must not be nil."];
  }
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "+[VSSubscriptionSource subscriptionSourceForWebsiteWithURL:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "%s: Generated webURL: %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [v4 host];
  id v7 = +[VSOptional optionalWithObject:v6];

  v8 = [v7 forceUnwrapObject];
  v9 = [a1 subscriptionSourceForWebsiteWithDomainName:v8];

  return v9;
}

+ (id)subscriptionSourceForWebsiteWithDomainName:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The domainName parameter must not be nil."];
  }
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "+[VSSubscriptionSource subscriptionSourceForWebsiteWithDomainName:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = objc_alloc_init((Class)a1);
  [v6 setKind:1];
  [v6 setIdentifier:v4];

  return v6;
}

+ (id)subscriptionSourceForAppWithBundleID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The bundleID parameter must not be nil."];
  }
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "+[VSSubscriptionSource subscriptionSourceForAppWithBundleID:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = objc_alloc_init((Class)a1);
  [v6 setKind:0];
  [v6 setIdentifier:v4];

  return v6;
}

- (VSSubscriptionSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSSubscriptionSource;
  v2 = [(VSSubscriptionSource *)&v5 init];
  if (v2)
  {
    uint64_t v3 = VSSubscriptionSourceValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSSubscriptionSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSSubscriptionSource;
  objc_super v5 = [(VSSubscriptionSource *)&v8 init];
  if (v5)
  {
    id v6 = VSSubscriptionSourceValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSSubscriptionSourceValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSSubscriptionSourceValueType();
  id v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = VSSubscriptionSourceValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSSubscriptionSourceValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  uint64_t v3 = VSSubscriptionSourceValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end