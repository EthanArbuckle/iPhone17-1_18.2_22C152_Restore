@interface _DPPListHelper
+ (id)loadPropertyListFromPath:(id)a3 overridePath:(id)a4 usingBlock:(id)a5;
@end

@implementation _DPPListHelper

+ (id)loadPropertyListFromPath:(id)a3 overridePath:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E019F810]();
  v11 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v7];
  if (+[_DPDeviceInfo isInternalBuild])
  {
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v8];
    [v11 addEntriesFromDictionary:v12];
  }
  v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __67___DPPListHelper_loadPropertyListFromPath_overridePath_usingBlock___block_invoke;
  v21 = &unk_1E6C44520;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  id v15 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:&v18];
  v16 = objc_msgSend(v15, "copy", v18, v19, v20, v21);

  return v16;
}

@end