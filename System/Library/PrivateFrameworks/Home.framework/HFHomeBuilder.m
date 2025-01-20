@interface HFHomeBuilder
+ (Class)homeKitRepresentationClass;
- (HFHomeBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFWallpaperEditCollectionBuilder)wallpaperBuilder;
- (NSString)name;
- (NSString)userNotes;
- (id)commitItem;
- (id)createHome;
- (id)performValidation;
- (id)updateName;
- (id)updateUserNotes;
- (void)setHome:(id)a3;
- (void)setName:(id)a3;
- (void)setUserNotes:(id)a3;
- (void)setWallpaperBuilder:(id)a3;
@end

@implementation HFHomeBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFHomeBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFHomeBuilder;
  v7 = [(HFItemBuilder *)&v17 initWithExistingObject:a3 inHome:v6];
  if (v7)
  {
    uint64_t v8 = [v6 name];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v6, "hf_notesApplicationData");
    userNotes = v7->_userNotes;
    v7->_userNotes = (NSString *)v10;

    if (+[HFExecutionEnvironment isHomeApp])
    {
      v12 = +[HFWallpaperManager sharedInstance];
      int v13 = [v12 wallpaperSourceRegistered];

      if (v13)
      {
        v14 = [[HFWallpaperEditCollectionBuilder alloc] initWithHomeKitObject:v6];
        wallpaperBuilder = v7->_wallpaperBuilder;
        v7->_wallpaperBuilder = v14;
      }
    }
  }

  return v7;
}

- (void)setHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemBuilder *)self home];

  if (v5 != v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HFHomeBuilder;
    [(HFItemBuilder *)&v12 setHome:v4];
    uint64_t v6 = [(id)objc_opt_class() homeKitRepresentationClass];
    id v7 = v4;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = v7;
      if (v8) {
        goto LABEL_9;
      }
      uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
    v9 = 0;
LABEL_9:

    [(HFItemBuilder *)self setHomeKitRepresentation:v9];
  }
}

- (id)commitItem
{
  v3 = [(HFItemBuilder *)self home];
  BOOL v4 = v3 == 0;

  id v5 = [(HFHomeBuilder *)self performValidation];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __27__HFHomeBuilder_commitItem__block_invoke;
  v17[3] = &unk_264097568;
  BOOL v18 = v4;
  v17[4] = self;
  uint64_t v6 = [v5 flatMap:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __27__HFHomeBuilder_commitItem__block_invoke_2;
  v16[3] = &unk_26408CDC8;
  v16[4] = self;
  id v7 = [v6 flatMap:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __27__HFHomeBuilder_commitItem__block_invoke_3;
  v15[3] = &unk_26408CDC8;
  v15[4] = self;
  uint64_t v8 = [v7 flatMap:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __27__HFHomeBuilder_commitItem__block_invoke_4;
  v14[3] = &unk_26408CDC8;
  v14[4] = self;
  v9 = [v8 flatMap:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __27__HFHomeBuilder_commitItem__block_invoke_5;
  v12[3] = &unk_264097590;
  BOOL v13 = v4;
  v12[4] = self;
  uint64_t v10 = [v9 recover:v12];

  return v10;
}

id __27__HFHomeBuilder_commitItem__block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    [v2 createHome];
  }
  else {
  v3 = [v2 updateName];
  }
  return v3;
}

id __27__HFHomeBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) wallpaperBuilder];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) wallpaperBuilder];
    BOOL v4 = [v3 commitWallpaper];
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v4;
}

uint64_t __27__HFHomeBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUserNotes];
}

id __27__HFHomeBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  int v1 = (void *)MEMORY[0x263F58190];
  v2 = [*(id *)(a1 + 32) home];
  v3 = [v1 futureWithResult:v2];

  return v3;
}

id __27__HFHomeBuilder_commitItem__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x263F58190];
  if (*(unsigned char *)(a1 + 40)) {
    id v5 = HFOperationAddHome;
  }
  else {
    id v5 = HFOperationEditHome;
  }
  uint64_t v6 = *v5;
  id v7 = [*(id *)(a1 + 32) name];
  uint64_t v8 = [v7 length];
  if (v8)
  {
    v9 = [*(id *)(a1 + 32) name];
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v9);
  v11 = [v4 futureWithError:v10];

  if (v8) {
  return v11;
  }
}

- (id)performValidation
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F58190];
  BOOL v4 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  v10[0] = v4;
  id v5 = [(HFHomeBuilder *)self name];
  uint64_t v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v3 chainFutures:v7];

  return v8;
}

- (id)createHome
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  BOOL v4 = [v3 homeManager];

  id v5 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __27__HFHomeBuilder_createHome__block_invoke;
  v13[3] = &unk_264090378;
  id v6 = v4;
  id v14 = v6;
  v15 = self;
  id v7 = [v5 futureWithCompletionHandlerAdapterBlock:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __27__HFHomeBuilder_createHome__block_invoke_2;
  v11[3] = &unk_2640975E0;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 flatMap:v11];

  return v9;
}

void __27__HFHomeBuilder_createHome__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 name];
  [v2 addHomeWithName:v5 completionHandler:v4];
}

id __27__HFHomeBuilder_createHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_msgSend(v3, "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:", 1);
  id v5 = (id)objc_msgSend(v3, "hf_setHomeHasMigratedServicesToAccessories:", 1);
  [*(id *)(a1 + 32) setHome:v3];
  id v6 = [*(id *)(a1 + 32) wallpaperBuilder];
  [v6 setHkObject:v3];

  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  BOOL v13 = __27__HFHomeBuilder_createHome__block_invoke_3;
  id v14 = &unk_2640975B8;
  id v15 = *(id *)(a1 + 40);
  id v16 = v3;
  id v8 = v3;
  [v7 dispatchHomeManagerObserverMessage:&v11 sender:0];

  v9 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v8, v11, v12, v13, v14);

  return v9;
}

uint64_t __27__HFHomeBuilder_createHome__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 homeManager:*(void *)(a1 + 32) didAddHome:*(void *)(a1 + 40)];
}

- (id)updateName
{
  id v3 = [(HFItemBuilder *)self home];
  id v4 = [v3 name];
  id v5 = [(HFHomeBuilder *)self name];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __27__HFHomeBuilder_updateName__block_invoke;
    v12[3] = &unk_26408CD50;
    v12[4] = self;
    id v8 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v12];
    id v9 = (id)[v8 addFailureBlock:&__block_literal_global_135];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __27__HFHomeBuilder_updateName__block_invoke_3;
    v11[3] = &unk_26408CDC8;
    v11[4] = self;
    id v7 = [v8 flatMap:v11];
  }
  return v7;
}

void __27__HFHomeBuilder_updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 home];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 updateName:v5 completionHandler:v4];
}

void __27__HFHomeBuilder_updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFHomeBuilder.updateName"];
}

id __27__HFHomeBuilder_updateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__HFHomeBuilder_updateName__block_invoke_4;
  v7[3] = &unk_26408CDA0;
  v7[4] = *(void *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v7 sender:0];

  id v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

void __27__HFHomeBuilder_updateName__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 homeDidUpdateName:v3];
  }
}

- (id)updateUserNotes
{
  id v3 = [(HFItemBuilder *)self home];
  uint64_t v4 = objc_msgSend(v3, "hf_notesApplicationData");

  uint64_t v5 = [(HFHomeBuilder *)self userNotes];
  if (v5 | v4
    && (id v6 = (void *)v5,
        [(HFHomeBuilder *)self userNotes],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:v4],
        v7,
        v6,
        !v8))
  {
    uint64_t v10 = [(HFItemBuilder *)self home];
    uint64_t v11 = [(HFHomeBuilder *)self userNotes];
    id v9 = objc_msgSend(v10, "hf_setNotesApplicationData:", v11);
  }
  else
  {
    id v9 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)userNotes
{
  return self->_userNotes;
}

- (void)setUserNotes:(id)a3
{
}

- (HFWallpaperEditCollectionBuilder)wallpaperBuilder
{
  return self->_wallpaperBuilder;
}

- (void)setWallpaperBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperBuilder, 0);
  objc_storeStrong((id *)&self->_userNotes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end