@interface QLCacheFileProviderFileIdentifier
+ (BOOL)supportsSecureCoding;
+ (Class)versionedFileIdentifierClass;
+ (NSMutableSet)knownFileProviderIdentifiersSoFar;
- (BOOL)isEqual:(id)a3;
- (FPItemID)itemID;
- (QLCacheFileProviderFileIdentifier)initWithCoder:(id)a3;
- (QLCacheFileProviderFileIdentifier)initWithItemID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLCacheFileProviderFileIdentifier

- (unint64_t)hash
{
  return [(FPItemID *)self->_itemID hash];
}

- (void).cxx_destruct
{
}

- (FPItemID)itemID
{
  return (FPItemID *)objc_getProperty(self, a2, 8, 1);
}

+ (Class)versionedFileIdentifierClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(FPItemID *)self->_itemID isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (QLCacheFileProviderFileIdentifier)initWithItemID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCacheFileProviderFileIdentifier;
  v6 = [(QLCacheFileProviderFileIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemID, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  itemID = self->_itemID;

  return (id)[v4 initWithItemID:itemID];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (NSMutableSet)knownFileProviderIdentifiersSoFar
{
  if (knownFileProviderIdentifiersSoFar_once != -1) {
    dispatch_once(&knownFileProviderIdentifiersSoFar_once, &__block_literal_global_0);
  }
  v2 = (void *)knownFileProviderIdentifiersSoFar_s;

  return (NSMutableSet *)v2;
}

- (QLCacheFileProviderFileIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getFPItemIDClass_softClass;
  uint64_t v14 = getFPItemIDClass_softClass;
  if (!getFPItemIDClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getFPItemIDClass_block_invoke;
    v10[3] = &unk_1E6009910;
    v10[4] = &v11;
    __getFPItemIDClass_block_invoke((uint64_t)v10);
    id v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ii"];
  v8 = [(QLCacheFileProviderFileIdentifier *)self initWithItemID:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __70__QLCacheFileProviderFileIdentifier_knownFileProviderIdentifiersSoFar__block_invoke()
{
  knownFileProviderIdentifiersSoFar_s = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);

  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<uFI:%@>", self->_itemID];
}

@end