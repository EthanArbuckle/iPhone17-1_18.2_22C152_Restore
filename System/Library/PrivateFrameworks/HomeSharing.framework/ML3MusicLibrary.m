@interface ML3MusicLibrary
@end

@implementation ML3MusicLibrary

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_26423A500;
  uint64_t v7 = a1[6];
  v9 = a1[4];
  v8 = (void *)a1[5];
  id v15 = v6;
  uint64_t v16 = v7;
  id v13 = v5;
  id v14 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    BuildContainers(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

uint64_t __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_5(uint64_t result, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    a2 = 1;
  }
  *(unsigned char *)(v2 + 24) = a2;
  return result;
}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_7;
  block[3] = &unk_26423A5C0;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) error];
    id v3 = v2;
    if (v2)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      id v5 = v2;
      id v6 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v5;
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v6 = [*(id *)(a1 + 32) responseData];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    }
  }
  v8 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v8);
}

uint64_t __49__ML3MusicLibrary_HSAdditions__executeUpdateSQL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 executeUpdate:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = a1[5];
    id v10 = [v3 error];

    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v10);
  }
  else
  {
    id v6 = [v3 responseData];

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke_2;
    v11[3] = &unk_26423A488;
    v11[4] = a1[4];
    id v12 = v7;
    id v8 = v7;
    +[HSResponseDataParser enumerateItemsInResponseData:v6 usingHandler:v11];
    v9 = (void *)[MEMORY[0x263F57418] newWithPersistentID:a1[6] inLibrary:a1[4]];
    [v9 setTracksWithPersistentIDs:v8 notify:0];
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = (void *)(a2 + 16);
    uint64_t v6 = *MEMORY[0x263F573C0];
    do
    {
      if (*((_DWORD *)v5 - 4) == 1835624804)
      {
        unint64_t v7 = -1;
        id v8 = (unsigned __int8 *)*(v5 - 1);
        switch(*v5)
        {
          case 1:
            unint64_t v7 = *v8;
            break;
          case 2:
            unint64_t v7 = __rev16(*(unsigned __int16 *)v8);
            break;
          case 4:
            unint64_t v7 = bswap32(*(_DWORD *)v8);
            break;
          case 8:
            unint64_t v7 = (((unint64_t)*v8 << 56) | ((unint64_t)v8[1] << 48) | ((unint64_t)v8[2] << 40) | ((unint64_t)v8[3] << 32) | ((unint64_t)v8[4] << 24) | ((unint64_t)v8[5] << 16) | ((unint64_t)v8[6] << 8))
               + v8[7];
            break;
          default:
            break;
        }
        v9 = (void *)MEMORY[0x263F57470];
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = [MEMORY[0x263F57410] predicateWithProperty:v6 equalToInt64:v7];
        id v12 = [v9 anyInLibrary:v10 predicate:v11];

        if (v12)
        {
          id v13 = *(void **)(a1 + 40);
          id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
          [v13 addObject:v14];
        }
      }
      v5 += 4;
      --v3;
    }
    while (v3);
  }
}

uint64_t __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke(uint64_t result, float a2)
{
  if (*(void *)(result + 32))
  {
    *(float *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(float *)(*(void *)(*(void *)(result + 40)
                                                                                          + 8)
                                                                              + 24)
                                                                   + a2;
    return (*(uint64_t (**)(void, float))(*(void *)(result + 32) + 16))(*(void *)(result + 32), *(float *)(*(void *)(*(void *)(result + 40) + 8) + 24));
  }
  return result;
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_3;
  v12[3] = &unk_26423A500;
  uint64_t v7 = a1[6];
  v9 = a1[4];
  id v8 = (void *)a1[5];
  id v15 = v6;
  uint64_t v16 = v7;
  id v13 = v5;
  id v14 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:@"SELECT 1 FROM item LIMIT 1"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 hasAtLeastOneRow];
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || ([*(id *)(a1 + 32) updateOrderingLanguagesForCurrentLanguage],
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1065353216;
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if ([*(id *)(a1 + 32) responseCode] == 200
      && ([*(id *)(a1 + 32) error],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          v2,
          !v2))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v3 = [*(id *)(a1 + 32) responseData];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);
    }
    else
    {
      id v3 = [*(id *)(a1 + 32) error];
      if (v3)
      {
        id v4 = [*(id *)(a1 + 32) error];
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F087E8]);
        id v4 = (void *)[v5 initWithDomain:*MEMORY[0x263F573E0] code:0 userInfo:0];
      }
      id v6 = v4;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
    }
  }
  id v8 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v8);
}

@end