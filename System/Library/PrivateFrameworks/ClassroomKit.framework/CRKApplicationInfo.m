@interface CRKApplicationInfo
+ (id)bundleIdentifierFromDictionaryRepresentation:(id)a3;
+ (id)bundleIdentifiersFromDictionaryRepresentations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CRKApplicationInfo)initWithBundleIdentifier:(id)a3 shortVersionString:(id)a4;
- (CRKApplicationInfo)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleIdentifier;
- (NSString)shortVersionString;
- (unint64_t)hash;
@end

@implementation CRKApplicationInfo

- (CRKApplicationInfo)initWithBundleIdentifier:(id)a3 shortVersionString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKApplicationInfo;
  v8 = [(CRKApplicationInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    shortVersionString = v8->_shortVersionString;
    v8->_shortVersionString = (NSString *)v11;
  }
  return v8;
}

- (CRKApplicationInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
  id v6 = [v4 objectForKeyedSubscript:@"shortVersionString"];

  id v7 = [(CRKApplicationInfo *)self initWithBundleIdentifier:v5 shortVersionString:v6];
  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(CRKApplicationInfo *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"bundleIdentifier"];

  v5 = [(CRKApplicationInfo *)self shortVersionString];

  if (v5)
  {
    id v6 = [(CRKApplicationInfo *)self shortVersionString];
    [v3 setObject:v6 forKeyedSubscript:@"shortVersionString"];
  }
  id v7 = (void *)[v3 copy];

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  id v6 = (void *)0x2646F2000;
  if (![v5 isMemberOfClass:objc_opt_class()])
  {
    char v10 = 0;
    goto LABEL_22;
  }
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[CRKApplicationInfo isEqual:]"];
    v17 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v17);
    v18 = (objc_class *)objc_opt_class();
    v3 = NSStringFromClass(v18);
    [v15 handleFailureInFunction:v16, @"CRKApplicationInfo.m", 49, @"expected %@, got %@", v6, v3 file lineNumber description];
  }
  v8 = [(CRKApplicationInfo *)self bundleIdentifier];
  if (v8 || ([v7 bundleIdentifier], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(CRKApplicationInfo *)self bundleIdentifier];
    v3 = [v7 bundleIdentifier];
    if (![v6 isEqual:v3])
    {
      char v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v9 = 1;
  }
  else
  {
    v20 = 0;
    int v9 = 0;
  }
  uint64_t v11 = [(CRKApplicationInfo *)self shortVersionString];
  if (v11 || ([v7 shortVersionString], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(CRKApplicationInfo *)self shortVersionString];
    v13 = [v7 shortVersionString];
    char v10 = [v12 isEqual:v13];

    if (v11) {
      goto LABEL_17;
    }
  }
  else
  {
    v19 = 0;
    char v10 = 1;
  }

LABEL_17:
  if (v9) {
    goto LABEL_18;
  }
LABEL_19:
  if (!v8) {

  }
LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRKApplicationInfo *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKApplicationInfo *)self shortVersionString];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (id)bundleIdentifierFromDictionaryRepresentation:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"bundleIdentifier"];
}

+ (id)bundleIdentifiersFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_107);
}

uint64_t __69__CRKApplicationInfo_bundleIdentifiersFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"bundleIdentifier"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end