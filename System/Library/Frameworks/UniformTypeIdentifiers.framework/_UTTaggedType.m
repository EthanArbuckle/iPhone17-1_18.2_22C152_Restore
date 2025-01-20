@interface _UTTaggedType
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_isCoreType;
- (BOOL)_isExported;
- (BOOL)_isImported;
- (BOOL)_isWildcard;
- (BOOL)conformsToType:(id)a3;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isPublicType;
- (Class)classForCoder;
- (id)_childTypes;
- (id)_localizedDescriptionDictionary;
- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3;
- (id)_parentTypes;
- (id)_preferredTagOfClass:(id)a3;
- (id)_subtypes;
- (id)_typeRecord;
- (id)identifier;
- (id)localizedDescription;
- (id)referenceURL;
- (id)supertypes;
- (id)tags;
- (id)version;
- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4;
@end

@implementation _UTTaggedType

+ (void)initialize
{
  if (qword_1EB20A648 != -1) {
    dispatch_once(&qword_1EB20A648, &__block_literal_global_0);
  }
}

- (id)identifier
{
  uint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  uint64_t v4 = 0xFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0) {
    uint64_t v4 = 0xFFFFFFFFFFFFFLL;
  }
  __int16 v9 = v3 >> 35;
  *(_DWORD *)__s1 = v3 >> 3;
  char v10 = (v4 & (v3 >> 3)) >> 48;
  v5 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s1, strnlen(__s1, 6uLL), 4, 0);
  DynamicIdentifierForTaggedPointerObject = (void *)_UTTypeCreateDynamicIdentifierForTaggedPointerObject();

  return DynamicIdentifierForTaggedPointerObject;
}

- (id)localizedDescription
{
  return 0;
}

- (id)version
{
  return 0;
}

- (id)referenceURL
{
  return 0;
}

- (BOOL)isDynamic
{
  return 1;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isPublicType
{
  return 0;
}

- (id)_typeRecord
{
  return 0;
}

- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UTTaggedType.mm", 119, @"Invalid parameter not satisfying: %@", @"preferredLocalizations != nil" object file lineNumber description];
  }
  return 0;
}

- (id)_localizedDescriptionDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)_parentTypes
{
  unint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    unint64_t v2 = 0xC000000000000007;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  if ((v3 & 0x8000000000000) != 0) {
    v5 = &off_1EB209CF0;
  }
  else {
    v5 = &off_1EB2090D0;
  }
  v6 = (void *)[v4 initWithObject:v5];

  return v6;
}

- (id)_childTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)_subtypes
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)_isExported
{
  return 0;
}

- (BOOL)_isImported
{
  return 0;
}

- (BOOL)_isWildcard
{
  return 0;
}

- (BOOL)_isCoreType
{
  return 0;
}

- (id)_preferredTagOfClass:(id)a3
{
  if ([a3 isEqual:@"public.filename-extension"])
  {
    uint64_t v4 = *MEMORY[0x1E4FBA8E0];
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v4 = 0;
    }
    unint64_t v5 = v4 ^ (unint64_t)self;
    uint64_t v6 = 0xFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0) {
      uint64_t v6 = 0xFFFFFFFFFFFFFLL;
    }
    __int16 v10 = v5 >> 35;
    *(_DWORD *)__s1 = v5 >> 3;
    char v11 = (v6 & (v5 >> 3)) >> 48;
    v7 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", __s1, strnlen(__s1, 6uLL), 4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)conformsToType:(id)a3
{
  if (!a3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UTTaggedType.mm", 193, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }
  if (a3 == self) {
    return 1;
  }
  if ([a3 isDynamic])
  {
    unint64_t v5 = [a3 identifier];
    uint64_t v6 = [(_UTTaggedType *)self identifier];
    BOOL v7 = _UTIdentifiersAreEqual(v5, v6);

    return v7;
  }
  unint64_t v9 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    unint64_t v9 = 0xC000000000000007;
  }
  if (((v9 ^ (unint64_t)self) & 0x8000000000000) != 0)
  {
    BOOL v7 = 1;
    if (a3 == &UniformTypeIdentifiers::CoreTypes::constants || a3 == &off_1EB209CF0 || a3 == &off_1EB2090F0) {
      return v7;
    }
    __int16 v10 = &off_1EB209CF0;
  }
  else
  {
    BOOL v7 = 1;
    if (a3 == &off_1EB2090D0 || a3 == &UniformTypeIdentifiers::CoreTypes::constants) {
      return v7;
    }
    __int16 v10 = &off_1EB2090D0;
  }

  return [v10 conformsToType:a3];
}

- (id)supertypes
{
  unint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    unint64_t v2 = 0xC000000000000007;
  }
  if (((v2 ^ (unint64_t)self) & 0x8000000000000) != 0)
  {
    BOOL v7 = &UniformTypeIdentifiers::CoreTypes::constants;
    v12 = &UniformTypeIdentifiers::CoreTypes::constants;
    v8 = &off_1EB2090F0;
    v13 = &off_1EB2090F0;
    unint64_t v9 = &off_1EB209CF0;
    v14 = &off_1EB209CF0;
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v12 count:3];
    for (uint64_t i = 2; i != -1; --i)
  }
  else
  {
    unint64_t v3 = &UniformTypeIdentifiers::CoreTypes::constants;
    v12 = &UniformTypeIdentifiers::CoreTypes::constants;
    uint64_t v4 = &off_1EB2090D0;
    v13 = &off_1EB2090D0;
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v12 count:2];
    for (uint64_t j = 1; j != -1; --j)
  }

  return v5;
}

- (id)tags
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = @"public.filename-extension";
  unint64_t v2 = [(UTType *)self preferredFilenameExtension];
  uint64_t v6 = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v4;
}

- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  unint64_t v2 = UTType;
  return (Class)UTType;
}

@end