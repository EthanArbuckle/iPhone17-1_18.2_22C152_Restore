@interface AVTPuppetStore
+ (id)createPuppetRecords;
- (AVTPuppetStore)initWithEnvironment:(id)a3;
- (NSArray)puppetRecords;
- (id)allAvatarPuppetsExcluding:(id)a3 error:(id *)a4;
- (id)allAvatarPuppetsWithError:(id *)a3;
- (id)allPuppetRecords;
- (id)avatarPuppetsForFetchRequest:(id)a3 error:(id *)a4;
- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)primaryAvatarPuppet;
- (void)loadPuppetRecordsIfNeeded;
- (void)setPuppetRecords:(id)a3;
@end

@implementation AVTPuppetStore

- (AVTPuppetStore)initWithEnvironment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTPuppetStore;
  return [(AVTPuppetStore *)&v4 init];
}

- (id)allPuppetRecords
{
  [(AVTPuppetStore *)self loadPuppetRecordsIfNeeded];
  v3 = [(AVTPuppetStore *)self puppetRecords];
  objc_super v4 = (void *)[v3 copy];

  return v4;
}

- (void)loadPuppetRecordsIfNeeded
{
  v3 = [(AVTPuppetStore *)self puppetRecords];

  if (!v3)
  {
    id v4 = [(id)objc_opt_class() createPuppetRecords];
    [(AVTPuppetStore *)self setPuppetRecords:v4];
  }
}

+ (id)createPuppetRecords
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(MEMORY[0x263F29640], "animojiNames", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [[AVTAvatarPuppetRecord alloc] initWithPuppetName:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)avatarPuppetsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(AVTPuppetStore *)self loadPuppetRecordsIfNeeded];
  uint64_t v7 = [v6 criteria];
  v8 = (void *)MEMORY[0x263EFFA68];
  switch(v7)
  {
    case 0:
    case 3:
      uint64_t v9 = [(AVTPuppetStore *)self allAvatarPuppetsWithError:a4];
      goto LABEL_7;
    case 1:
    case 2:
      long long v10 = [v6 identifiers];
      uint64_t v11 = [(AVTPuppetStore *)self avatarsWithIdentifiers:v10 error:a4];
      goto LABEL_5;
    case 5:
      uint64_t v9 = [(AVTPuppetStore *)self primaryAvatarPuppet];
LABEL_7:
      v8 = (void *)v9;
      break;
    case 6:
    case 7:
      long long v10 = [v6 excludingIdentifiers];
      uint64_t v11 = [(AVTPuppetStore *)self allAvatarPuppetsExcluding:v10 error:a4];
LABEL_5:
      v8 = (void *)v11;

      break;
    default:
      break;
  }

  return v8;
}

- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4
{
  v18 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [(AVTPuppetStore *)self puppetRecords];
        long long v12 = +[AVTAvatarPuppetRecord matchingIdentifierTest:v10];
        uint64_t v13 = [v11 indexOfObjectPassingTest:v12];

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v19 addObject:v10];
        }
        else
        {
          v14 = [(AVTPuppetStore *)self puppetRecords];
          uint64_t v15 = [v14 objectAtIndexedSubscript:v13];
          [v20 addObject:v15];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  if ([v20 count])
  {
    v16 = (void *)[v20 copy];
  }
  else if (v18)
  {
    +[AVTError errorWithCode:404 userInfo:0];
    v16 = 0;
    id *v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)allAvatarPuppetsExcluding:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVTPuppetStore *)self puppetRecords];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__AVTPuppetStore_allAvatarPuppetsExcluding_error___block_invoke;
  v14[3] = &unk_2647C3658;
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = [v7 indexesOfObjectsPassingTest:v14];

  uint64_t v10 = [(AVTPuppetStore *)self puppetRecords];
  uint64_t v11 = [v10 objectsAtIndexes:v9];

  if ([v11 count])
  {
    long long v12 = (void *)[v11 copy];
  }
  else if (a4)
  {
    +[AVTError errorWithCode:404 userInfo:0];
    long long v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

BOOL __50__AVTPuppetStore_allAvatarPuppetsExcluding_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  BOOL v4 = [v2 indexOfObject:v3] == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)allAvatarPuppetsWithError:(id *)a3
{
  v3 = [(AVTPuppetStore *)self puppetRecords];
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (id)primaryAvatarPuppet
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [(AVTPuppetStore *)self puppetRecords];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AVTPuppetStore *)self puppetRecords];
    id v6 = [v5 firstObject];
    uint64_t v7 = (void *)[v6 copy];
    v10[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (NSArray)puppetRecords
{
  return self->_puppetRecords;
}

- (void)setPuppetRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end