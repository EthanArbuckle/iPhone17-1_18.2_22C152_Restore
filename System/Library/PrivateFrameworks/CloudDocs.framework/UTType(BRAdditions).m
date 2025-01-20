@interface UTType(BRAdditions)
- (uint64_t)br_isAliasFileType;
- (uint64_t)br_isDirectoryType;
- (uint64_t)br_isDocumentType;
- (uint64_t)br_isFileType;
- (uint64_t)br_isPackageType;
- (uint64_t)br_isSymbolicLinkType;
@end

@implementation UTType(BRAdditions)

- (uint64_t)br_isDocumentType
{
  if (([a1 conformsToType:*MEMORY[0x1E4F443C8]] & 1) != 0
    || ([a1 conformsToType:*MEMORY[0x1E4F44308]] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [a1 conformsToType:*MEMORY[0x1E4F444D8]] ^ 1;
  }
}

- (uint64_t)br_isFileType
{
  return [a1 conformsToType:*MEMORY[0x1E4F44378]];
}

- (uint64_t)br_isPackageType
{
  return [a1 conformsToType:*MEMORY[0x1E4F44468]];
}

- (uint64_t)br_isSymbolicLinkType
{
  return [a1 conformsToType:*MEMORY[0x1E4F444D8]];
}

- (uint64_t)br_isAliasFileType
{
  return [a1 conformsToType:*MEMORY[0x1E4F44308]];
}

- (uint64_t)br_isDirectoryType
{
  return [a1 conformsToType:*MEMORY[0x1E4F443C8]];
}

@end