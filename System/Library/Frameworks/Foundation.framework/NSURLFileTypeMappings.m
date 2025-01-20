@interface NSURLFileTypeMappings
+ (id)sharedMappings;
- (id)MIMETypeForExtension:(id)a3;
- (id)extensionsForMIMEType:(id)a3;
- (id)preferredExtensionForMIMEType:(id)a3;
@end

@implementation NSURLFileTypeMappings

+ (id)sharedMappings
{
  if (_MergedGlobals_124 != -1) {
    dispatch_once(&_MergedGlobals_124, &__block_literal_global_52);
  }
  return (id)qword_1EB1ED860;
}

NSURLFileTypeMappings *__39__NSURLFileTypeMappings_sharedMappings__block_invoke()
{
  result = objc_alloc_init(NSURLFileTypeMappings);
  qword_1EB1ED860 = (uint64_t)result;
  return result;
}

- (id)MIMETypeForExtension:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)[&unk_1ECAB8778 objectForKey:v4];
  if (!result && self && v4)
  {
    v6 = (void *)[(objc_class *)UTTypeClass() typeWithFilenameExtension:v4];
    return (id)[v6 preferredMIMEType];
  }
  return result;
}

- (id)preferredExtensionForMIMEType:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)objc_msgSend((id)objc_msgSend(&unk_1ECAB87A0, "objectForKey:", v4), "objectAtIndex:", 0);
  if (!result && self && v4)
  {
    v6 = (void *)[(objc_class *)UTTypeClass() typeWithMIMEType:v4];
    return (id)[v6 preferredFilenameExtension];
  }
  return result;
}

- (id)extensionsForMIMEType:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 lowercaseString];
  id result = (id)[&unk_1ECAB87C8 objectForKey:v4];
  if (!result && self && v4)
  {
    id result = (id)objc_msgSend((id)-[objc_class typeWithMIMEType:](UTTypeClass(), "typeWithMIMEType:", v4), "preferredFilenameExtension");
    if (result)
    {
      v6[0] = result;
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
  }
  return result;
}

@end