@interface UTType(DOCNode)
- (uint64_t)_doc_fileTypeCompare:()DOCNode;
- (uint64_t)doc_conformsToFolder;
@end

@implementation UTType(DOCNode)

- (uint64_t)_doc_fileTypeCompare:()DOCNode
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "doc_conformsToFolder");
  unsigned int v6 = objc_msgSend(v4, "doc_conformsToFolder");
  if ((v5 & 1) != 0 || v6)
  {
    if ((v5 ^ 1 | v6) == 1) {
      uint64_t v9 = (v5 ^ 1) & v6;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else if (a1 == v4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v7 = [a1 identifier];
    v8 = [v4 identifier];
    uint64_t v9 = [v7 compare:v8];
  }
  return v9;
}

- (uint64_t)doc_conformsToFolder
{
  if (doc_conformsToFolder_onceToken != -1) {
    dispatch_once(&doc_conformsToFolder_onceToken, &__block_literal_global_312);
  }
  v2 = (void *)doc_conformsToFolder__folderUTICache;
  v3 = [a1 identifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    if ([a1 conformsToType:*MEMORY[0x263F1DAB0]]) {
      uint64_t v5 = [a1 conformsToType:*MEMORY[0x263F1DC10]] ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
    unsigned int v6 = (void *)doc_conformsToFolder__folderUTICache;
    v7 = [NSNumber numberWithBool:v5];
    v8 = [a1 identifier];
    [v6 setObject:v7 forKey:v8];
  }
  return v5;
}

@end