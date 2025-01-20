@interface CNContactStore(CallHistory)
- (id)contactsByContactHandleForContactHandles:()CallHistory keyDescriptors:error:;
@end

@implementation CNContactStore(CallHistory)

- (id)contactsByContactHandleForContactHandles:()CallHistory keyDescriptors:error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v10 = (void *)getCNContactFetchRequestClass_softClass;
    uint64_t v26 = getCNContactFetchRequestClass_softClass;
    if (!getCNContactFetchRequestClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCNContactFetchRequestClass_block_invoke;
      v28 = &unk_1E61C75B8;
      v29 = &v23;
      __getCNContactFetchRequestClass_block_invoke((uint64_t)buf);
      v10 = (void *)v24[3];
    }
    v11 = v10;
    _Block_object_dispose(&v23, 8);
    id v12 = [v11 alloc];
    v13 = objc_msgSend(v12, "initWithKeysToFetch:", v9, v23);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v14 = (void *)getCNContactClass_softClass;
    uint64_t v26 = getCNContactClass_softClass;
    if (!getCNContactClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCNContactClass_block_invoke;
      v28 = &unk_1E61C75B8;
      v29 = &v23;
      __getCNContactClass_block_invoke((uint64_t)buf);
      v14 = (void *)v24[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v23, 8);
    v16 = objc_msgSend(v15, "predicateForContactsMatchingHandleStrings:", v8, v23);
    [v13 setPredicate:v16];

    v17 = ch_framework_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B8E4A000, v17, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", buf, 0x16u);
    }

    v18 = [a1 executeFetchRequest:v13 error:a5];
    v19 = [v18 value];
    v20 = ch_framework_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v19 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v21;
      _os_log_impl(&dword_1B8E4A000, v20, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", buf, 0xCu);
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end