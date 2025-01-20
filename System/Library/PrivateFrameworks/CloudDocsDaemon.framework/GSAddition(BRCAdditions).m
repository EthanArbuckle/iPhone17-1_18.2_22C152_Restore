@interface GSAddition(BRCAdditions)
+ (BOOL)brc_parseAdditionFilename:()BRCAdditions mangledID:itemID:etag:session:;
+ (id)additionURLForName:()BRCAdditions storagePrefix:inConflictNamespace:;
- (uint64_t)brc_parseMangledID:()BRCAdditions itemID:etag:session:;
@end

@implementation GSAddition(BRCAdditions)

+ (id)additionURLForName:()BRCAdditions storagePrefix:inConflictNamespace:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = (void **)MEMORY[0x1E4F63BD0];
  if (!a5) {
    v7 = (void **)MEMORY[0x1E4F63BB8];
  }
  v8 = *v7;
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v17 = a4;
  v18 = v8;
  v19 = a3;
  v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = v8;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 arrayWithObjects:&v17 count:3];
  v15 = objc_msgSend(v9, "fileURLWithPathComponents:", v14, v17, v18, v19, v20);

  return v15;
}

+ (BOOL)brc_parseAdditionFilename:()BRCAdditions mangledID:itemID:etag:session:
{
  id v11 = a7;
  id v12 = objc_msgSend(a3, "brc_stringByDeletingPathExtension");
  id v13 = +[BRCItemID parseMangledItemIDString:v12 mangledID:a4 etag:a6 session:v11];

  if (a5) {
    objc_storeStrong(a5, v13);
  }

  return v13 != 0;
}

- (uint64_t)brc_parseMangledID:()BRCAdditions itemID:etag:session:
{
  v10 = (void *)MEMORY[0x1E4F63BD8];
  id v11 = a6;
  id v12 = [a1 name];
  uint64_t v13 = objc_msgSend(v10, "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v12, a3, a4, a5, v11);

  return v13;
}

@end