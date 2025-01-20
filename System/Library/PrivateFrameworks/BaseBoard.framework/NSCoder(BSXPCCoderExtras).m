@interface NSCoder(BSXPCCoderExtras)
- (id)decodeCollectionOfClass:()BSXPCCoderExtras containingClass:forKey:;
- (uint64_t)decodeStringForKey:()BSXPCCoderExtras;
- (void)encodeCollection:()BSXPCCoderExtras forKey:;
@end

@implementation NSCoder(BSXPCCoderExtras)

- (void)encodeCollection:()BSXPCCoderExtras forKey:
{
  v6 = [a3 objectEnumerator];
  id v7 = [v6 allObjects];

  [a1 encodeObject:v7 forKey:a4];
}

- (id)decodeCollectionOfClass:()BSXPCCoderExtras containingClass:forKey:
{
  v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a4, 0);
  v9 = [a1 decodeObjectOfClasses:v8 forKey:a5];

  if ([v9 isNSArray]) {
    v10 = (void *)[[a3 alloc] initWithArray:v9];
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)decodeStringForKey:()BSXPCCoderExtras
{
  uint64_t v5 = objc_opt_class();
  return [a1 decodeObjectOfClass:v5 forKey:a3];
}

@end