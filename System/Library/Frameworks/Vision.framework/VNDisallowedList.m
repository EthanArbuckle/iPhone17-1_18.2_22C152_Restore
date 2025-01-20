@interface VNDisallowedList
+ (id)disallowedListFromUTF8StringArray:(const char *)a3;
+ (id)sceneNetV3;
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)allIdentifiers;
- (VNDisallowedList)initWithIdentifiers:(id)a3;
- (unint64_t)hash;
- (unint64_t)identifierCount;
@end

@implementation VNDisallowedList

+ (id)sceneNetV3
{
  if (sceneNetV3_onceToken != -1) {
    dispatch_once(&sceneNetV3_onceToken, &__block_literal_global_674);
  }
  v2 = (void *)sceneNetV3_ourPublicDisallowedList;

  return v2;
}

uint64_t __40__VNDisallowedList_SceneNet__sceneNetV3__block_invoke()
{
  sceneNetV3_ourPublicDisallowedList = +[VNDisallowedList disallowedListFromUTF8StringArray:_block_invoke_disallowedList];

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNDisallowedList *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSSet *)self->_identifiers isEqualToSet:v4->_identifiers];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_identifiers hash];
}

- (BOOL)containsIdentifier:(id)a3
{
  return [(NSSet *)self->_identifiers containsObject:a3];
}

- (NSSet)allIdentifiers
{
  v2 = (void *)[(NSSet *)self->_identifiers copy];

  return (NSSet *)v2;
}

- (unint64_t)identifierCount
{
  return [(NSSet *)self->_identifiers count];
}

- (VNDisallowedList)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNDisallowedList;
  BOOL v5 = [(VNDisallowedList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v6;
  }
  return v5;
}

+ (id)disallowedListFromUTF8StringArray:(const char *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a3 && *a3)
  {
    uint64_t v6 = a3 + 1;
    do
    {
      v7 = (void *)[[NSString alloc] initWithUTF8String:*(v6 - 1)];
      [v5 addObject:v7];
    }
    while (*v6++);
  }
  objc_super v9 = (void *)[objc_alloc((Class)a1) initWithIdentifiers:v5];

  return v9;
}

@end