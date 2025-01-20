@interface NSArray(TaskLoop)
- (void)enumerateTaskParallelly:()TaskLoop blockCompleteAllTask:;
@end

@implementation NSArray(TaskLoop)

- (void)enumerateTaskParallelly:()TaskLoop blockCompleteAllTask:
{
  id v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke;
  v25[3] = &unk_2647A51E8;
  id v13 = v6;
  id v27 = v13;
  id v9 = v8;
  id v26 = v9;
  [a1 enumerateObjectsUsingBlock:v25];
  v10 = objc_opt_new();
  if (v9 && objc_msgSend(v9, "count", v13))
  {
    if ([v9 count])
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__7007;
        v23 = __Block_byref_object_dispose__7008;
        id v24 = [v9 objectAtIndexedSubscript:v11];
        uint64_t v12 = v20[5];
        if (v12)
        {
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2;
          v14[3] = &unk_2647A5210;
          id v15 = v10;
          v18 = &v19;
          id v16 = v9;
          v17 = v7;
          (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v14);
        }
        _Block_object_dispose(&v19, 8);

        ++v11;
      }
      while ([v9 count] > v11);
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

@end