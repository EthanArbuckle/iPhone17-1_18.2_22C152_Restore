@interface CalStructuredDataArchiver
+ (NSSet)defaultPermittedClasses;
+ (id)archiveDictionary:(id)a3 error:(id *)a4;
+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 error:(id *)a5;
+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6;
+ (id)unarchiveDictionaryFromData:(id)a3 error:(id *)a4;
+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 error:(id *)a5;
+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6;
@end

@implementation CalStructuredDataArchiver

+ (NSSet)defaultPermittedClasses
{
  if (defaultPermittedClasses_onceToken != -1) {
    dispatch_once(&defaultPermittedClasses_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)defaultPermittedClasses_permittedClasses;

  return (NSSet *)v2;
}

void __52__CalStructuredDataArchiver_defaultPermittedClasses__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:9];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11);
  v3 = (void *)defaultPermittedClasses_permittedClasses;
  defaultPermittedClasses_permittedClasses = v2;
}

+ (id)unarchiveDictionaryFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 defaultPermittedClasses];
  uint64_t v8 = [a1 unarchiveDictionaryFromData:v6 permittedClasses:v7 strict:0 error:a4];

  return v8;
}

+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 error:(id *)a5
{
  return (id)[a1 unarchiveDictionaryFromData:a3 permittedClasses:a4 strict:0 error:a5];
}

+ (id)unarchiveDictionaryFromData:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    if (v7) {
      [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v10 fromData:v9 error:a6];
    }
    else {
    uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v9 error:a6];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)archiveDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 defaultPermittedClasses];
  uint64_t v8 = [a1 archiveDictionary:v6 permittedClasses:v7 strict:0 error:a4];

  return v8;
}

+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 error:(id *)a5
{
  return (id)[a1 archiveDictionary:a3 permittedClasses:a4 strict:0 error:a5];
}

+ (id)archiveDictionary:(id)a3 permittedClasses:(id)a4 strict:(BOOL)a5 error:(id *)a6
{
  if (a3)
  {
    BOOL v7 = [MEMORY[0x1E4F28DB0] CalArchivedDataWithRootObject:a3 ofClasses:a4 strict:a5 error:a6];
  }
  else
  {
    BOOL v7 = 0;
  }
  return v7;
}

@end