@interface WFPHAssetCollectionDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3;
- (NSString)localIdentifier;
- (NSString)localizedTitle;
- (WFPHAssetCollectionDescriptor)initWithLocalIdentifier:(id)a3 localizedTitle:(id)a4;
@end

@implementation WFPHAssetCollectionDescriptor

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"localIdentifier"])
  {
    unint64_t v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFPHAssetCollectionDescriptor;
    unint64_t v5 = (unint64_t)objc_msgSendSuper2(&v7, sel_storageBehaviorForPropertyWithKey_, v4);
  }

  return v5;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(NSDictionary, "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (WFPHAssetCollectionDescriptor)initWithLocalIdentifier:(id)a3 localizedTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPHAssetCollectionDescriptor;
  v8 = [(MTLModel *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    localizedTitle = v8->_localizedTitle;
    v8->_localizedTitle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

@end