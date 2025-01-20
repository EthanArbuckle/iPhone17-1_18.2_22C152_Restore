@interface NSObject(CNUtils)
- (void)cn_updateDictionaryForKey:()CNUtils withChanges:;
@end

@implementation NSObject(CNUtils)

- (void)cn_updateDictionaryForKey:()CNUtils withChanges:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 valueForKey:v7];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__NSObject_CNUtils__cn_updateDictionaryForKey_withChanges___block_invoke;
  v11[3] = &unk_1E549AD40;
  id v12 = v9;
  id v10 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
  [a1 setValue:v10 forKey:v7];
}

@end