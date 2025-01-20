void sub_1DD451498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_activity_scope_state_s a9, char a10)
{
  os_activity_scope_leave(&a9);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1DD4515DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void sub_1DD4515FC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[ENLog groupContext];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E4C4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_DEFAULT, "Loaded database -- Done {description: %{public}@", buf, 0xCu);
  }

  v9 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DD451778;
  v12[3] = &unk_1E6CC4DD0;
  id v10 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v10;
  id v11 = v6;
  dispatch_async(v9, v12);
}

uint64_t sub_1DD451778(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1DD4518D8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1DD4519C4;
  v4[3] = &unk_1E6CC4E20;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  [v5 _participantsForCypher:v3 completion:v4];
}

void sub_1DD4519C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [_ENGroupInfo alloc];
  id v5 = [*(id *)(a1 + 32) accountIdentity];
  id v7 = [(_ENGroupInfo *)v4 initWithAccountIdentity:v5 paricipants:v3 sharedApplicationData:*(void *)(a1 + 40)];

  id v6 = [[ENGroup alloc] initWithGroupInfo:v7 groupID:*(void *)(a1 + 48) cypher:*(void *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_1DD451BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void sub_1DD451BEC(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = +[ENCDGroup groupFromGroup:v3 insertIntoManagedObjectContext:v5];
  id v14 = 0;
  int v7 = [v5 save:&v14];

  id v8 = v14;
  id v9 = +[ENLog groupContext];
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1DD450000, v10, OS_LOG_TYPE_DEFAULT, "Saved group -- Done {group: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    sub_1DD45E52C(v4, (uint64_t)v8, v10);
  }

  id v11 = [*(id *)(a1 + 40) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DD451DA4;
  v12[3] = &unk_1E6CC4E70;
  id v13 = *(id *)(a1 + 48);
  dispatch_async(v11, v12);
}

uint64_t sub_1DD451DA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD451F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_1DD451F24(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ENCDGroup fetchRequest];
  id v5 = +[ENCDGroup predicateForGroupID:*(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = +[ENLog groupContext];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1DD45E610(v4);
  }

  id v30 = 0;
  int v7 = [v3 executeFetchRequest:v4 error:&v30];

  id v8 = v30;
  id v9 = +[ENLog groupContext];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v7 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = v10;
    _os_log_impl(&dword_1DD450000, v9, OS_LOG_TYPE_INFO, "Fetched by groupIDs {cdGroups.count: %ld}", buf, 0xCu);
  }

  if (v7)
  {
    id v11 = [v7 firstObject];
    v12 = v11;
    if (v11)
    {
      id v13 = *(void **)(a1 + 40);
      id v14 = [v11 cypher];
      v15 = [v12 groupID];
      id v16 = [v12 sharedApplicationData];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1DD4522FC;
      v28[3] = &unk_1E6CC4EC0;
      uint64_t v17 = *(void *)(a1 + 48);
      v28[4] = *(void *)(a1 + 40);
      id v29 = *(id *)(a1 + 56);
      [v13 _groupFromCypher:v14 groupID:v15 applicationData:v16 context:v17 completion:v28];

      v18 = v29;
    }
    else
    {
      v21 = +[ENLog groupContext];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v22;
        _os_log_impl(&dword_1DD450000, v21, OS_LOG_TYPE_DEFAULT, "Group not found -- Done {groupID: %{public}@}", buf, 0xCu);
      }

      v23 = [*(id *)(a1 + 40) queue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1DD452370;
      v26[3] = &unk_1E6CC4E70;
      id v27 = *(id *)(a1 + 56);
      dispatch_async(v23, v26);

      v18 = v27;
    }
  }
  else
  {
    v19 = +[ENLog groupContext];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E5A8();
    }

    v20 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DD452384;
    block[3] = &unk_1E6CC4E70;
    id v25 = *(id *)(a1 + 56);
    dispatch_async(v20, block);

    v12 = v25;
  }
}

void sub_1DD4522FC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1DD452370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1DD452384(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD4524E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
}

void sub_1DD452508(uint64_t a1, void *a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ENCDGroup fetchRequest];
  id v5 = +[ENCDGroup predicateForStableGroupID:*(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  id v6 = (void *)MEMORY[0x1E4F29008];
  int v7 = NSStringFromSelector(sel_groupIDGeneration);
  id v8 = [v6 sortDescriptorWithKey:v7 ascending:0];
  v37[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v4 setSortDescriptors:v9];

  uint64_t v10 = +[ENLog groupContext];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1DD45E610(v4);
  }

  id v34 = 0;
  id v11 = [v3 executeFetchRequest:v4 error:&v34];

  id v12 = v34;
  id v13 = +[ENLog groupContext];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v11 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = v14;
    _os_log_impl(&dword_1DD450000, v13, OS_LOG_TYPE_INFO, "Fetched by groupIDs {cdGroups.count: %ld}", buf, 0xCu);
  }

  if (v11)
  {
    v15 = [v11 firstObject];
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = *(void **)(a1 + 40);
      v18 = [v15 cypher];
      v19 = [v16 groupID];
      v20 = [v16 sharedApplicationData];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_1DD452958;
      v32[3] = &unk_1E6CC4EC0;
      uint64_t v21 = *(void *)(a1 + 48);
      v32[4] = *(void *)(a1 + 40);
      id v33 = *(id *)(a1 + 56);
      [v17 _groupFromCypher:v18 groupID:v19 applicationData:v20 context:v21 completion:v32];

      uint64_t v22 = v33;
    }
    else
    {
      id v25 = +[ENLog groupContext];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v36 = v26;
        _os_log_impl(&dword_1DD450000, v25, OS_LOG_TYPE_DEFAULT, "Group not found -- Done {stableGroupID: %{public}@}", buf, 0xCu);
      }

      id v27 = [*(id *)(a1 + 40) queue];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1DD452A44;
      v30[3] = &unk_1E6CC4E70;
      id v31 = *(id *)(a1 + 56);
      dispatch_async(v27, v30);

      uint64_t v22 = v31;
    }
  }
  else
  {
    v23 = +[ENLog groupContext];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E5A8();
    }

    v24 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DD452A58;
    block[3] = &unk_1E6CC4E70;
    id v29 = *(id *)(a1 + 56);
    dispatch_async(v24, block);

    id v16 = v29;
  }
}

void sub_1DD452958(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[ENLog groupContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Group found -- Done {group: %{private}@}", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1DD452A44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1DD452A58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD452B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void sub_1DD452BA0(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ENCDGroup fetchRequest];
  [v4 setFetchBatchSize:0];
  id v25 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v25];
  id v6 = v25;
  id v7 = +[ENLog groupContext];
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v5 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v9;
      _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_INFO, "Deleting fetched objects {count: %ld}", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          [v3 deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    v15 = +[ENLog groupContext];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD450000, v15, OS_LOG_TYPE_INFO, "Saving", buf, 2u);
    }

    id v20 = v6;
    int v16 = [v3 save:&v20];
    id v17 = v20;

    v18 = +[ENLog groupContext];
    uint64_t v8 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_INFO, "Saved -- Done", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      sub_1DD45E6FC();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E694();
    }
    id v17 = v6;
  }

  v19 = [*(id *)(a1 + 32) queue];
  dispatch_async(v19, *(dispatch_block_t *)(a1 + 40));
}

void sub_1DD453038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
}

void sub_1DD453068(id *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ENCDGroup fetchRequest];
  [v4 setFetchBatchSize:0];
  id v5 = [a1[4] stableGroupID];
  id v6 = +[ENCDGroup predicateForStableGroupID:v5];
  [v4 setPredicate:v6];

  id v27 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v27];
  id v8 = v27;
  uint64_t v9 = +[ENLog groupContext];
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1DD450000, v10, OS_LOG_TYPE_INFO, "Deleting fetched objects {count: %ld}", buf, 0xCu);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          [v3 deleteObject:*(void *)(*((void *)&v23 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    id v17 = +[ENLog groupContext];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD450000, v17, OS_LOG_TYPE_INFO, "Saving", buf, 2u);
    }

    id v22 = v8;
    int v18 = [v3 save:&v22];
    id v19 = v22;

    id v20 = +[ENLog groupContext];
    id v10 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v10, OS_LOG_TYPE_INFO, "Saved -- Done", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      sub_1DD45E6FC();
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E694();
    }
    id v19 = v8;
  }

  long long v21 = [a1[5] queue];
  dispatch_async(v21, a1[6]);
}

void sub_1DD4534A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void sub_1DD4534C4(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ENCDGroup fetchRequest];
  id v45 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v45];
  id v6 = v45;
  id v7 = +[ENLog groupContext];
  id v8 = v7;
  if (v5)
  {
    id v25 = v6;
    id v28 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [0 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v48 = v9;
      _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_INFO, "Fetch finished {result.count: %ld}", buf, 0xCu);
    }
    id v27 = v4;

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(0, "count"));
    id v10 = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v26 = v5;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v30 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
          dispatch_group_enter(v10);
          uint64_t v15 = *(void **)(a1 + 32);
          uint64_t v16 = [v14 cypher];
          id v17 = [v14 groupID];
          int v18 = [v14 sharedApplicationData];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = sub_1DD453900;
          v35[3] = &unk_1E6CC4F38;
          uint64_t v19 = *(void *)(a1 + 40);
          v35[4] = *(void *)(a1 + 32);
          id v36 = v31;
          v37 = v10;
          [v15 _groupFromCypher:v16 groupID:v17 applicationData:v18 context:v19 completion:v35];

          ++v13;
        }
        while (v12 != v13);
        uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v12);
    }

    id v20 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DD453970;
    block[3] = &unk_1E6CC4DD0;
    id v21 = *(id *)(a1 + 48);
    id v33 = v31;
    id v34 = v21;
    id v22 = v31;
    dispatch_group_notify(v10, v20, block);

    v4 = v27;
    id v3 = v28;
    id v6 = v25;
    id v5 = v26;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E764();
    }

    long long v23 = [*(id *)(a1 + 32) queue];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_1DD4538EC;
    v42[3] = &unk_1E6CC4DD0;
    long long v24 = *(id *)(a1 + 48);
    id v43 = 0;
    v44 = v24;
    dispatch_async(v23, v42);

    id v10 = v44;
  }
}

uint64_t sub_1DD4538EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1DD453900(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 queue];
  dispatch_assert_queue_V2(v5);

  [*(id *)(a1 + 40) addObject:v4];
  id v6 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v6);
}

uint64_t sub_1DD453970(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1DD4539F0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1DD453A28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1DD453A50(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1DD453AF8(uint64_t a1)
{
  return [(id)qword_1EAB21C28 addObject:*(void *)(a1 + 32)];
}

void sub_1DD453C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD453C1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD453C2C(uint64_t a1)
{
}

uint64_t sub_1DD453C34(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)qword_1EAB21C28 copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD453CD4()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Engram.ENKey", MEMORY[0x1E4F14430]);
  v1 = (void *)qword_1EAB21C38;
  qword_1EAB21C38 = (uint64_t)v0;

  qword_1EAB21C28 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return MEMORY[0x1F41817F8]();
}

void sub_1DD455FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,os_activity_scope_state_s state)
{
}

void sub_1DD456000(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DD4560CC;
  v9[3] = &unk_1E6CC4F38;
  v9[4] = v6;
  id v10 = v4;
  id v11 = v3;
  id v7 = v3;
  id v8 = v4;
  [v8 groupContext:v6 latestCachedGroupWithStableID:v5 completion:v9];
}

void sub_1DD4560CC(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[ENLog groupContext];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543618;
      id v10 = v3;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Found cached group -- Done {group: %{public}@, ware: %{public}@}", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 48) stopWithResult:v3];
  }
  else
  {
    if (v6)
    {
      id v8 = *(void **)(a1 + 40);
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Did not find group -- Continue {ware: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 48) continueWithResult:0];
  }
}

void sub_1DD456214(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (v4 == 1)
  {
    __int16 v11 = +[ENLog groupContext];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v3 error];
      *(_DWORD *)buf = 138543362;
      int v18 = v12;
      _os_log_impl(&dword_1DD450000, v11, OS_LOG_TYPE_DEFAULT, "Error featching group -- Fail {error: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    id v10 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v10);
    goto LABEL_10;
  }
  if (!v4)
  {
    uint64_t v5 = [v3 value];

    BOOL v6 = +[ENLog groupContext];
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = [v3 value];
        *(_DWORD *)buf = 138543362;
        int v18 = v8;
        _os_log_impl(&dword_1DD450000, v7, OS_LOG_TYPE_INFO, "Found group -- Done {group: %{public}@}", buf, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v3 value];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD450000, v7, OS_LOG_TYPE_DEFAULT, "Group not found -- Done", buf, 2u);
      }

      if (*(void *)(a1 + 32))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      }
      else
      {
        id v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = +[ENGroupContext _errorWithNotFoundItems:v10];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
    }
LABEL_10:
  }
}

void sub_1DD456660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
}

void sub_1DD456690(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  if (!a2 || v5)
  {
    uint64_t v9 = [v6 groupID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1DD456AF8;
    v10[3] = &unk_1E6CC50C8;
    id v11 = v5;
    id v12 = *(id *)(a1 + 48);
    [v7 _fetchGroupWithGroupID:v9 skipCache:1 completion:v10];

    id v8 = v11;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1DD4567F4;
    v13[3] = &unk_1E6CC50A0;
    v13[4] = v7;
    id v14 = v6;
    id v15 = *(id *)(a1 + 48);
    [v7 _validateCachedGroup:a2 isParentOfGroup:v14 completion:v13];

    id v8 = v14;
  }
}

void sub_1DD4567F4(uint64_t a1, int a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1DD456924;
    v10[3] = &unk_1E6CC5050;
    id v5 = &v11;
    id v6 = v3;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    [v4 _cacheGroup:v6 completion:v10];
    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v7 = [v3 groupID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1DD456A08;
    v8[3] = &unk_1E6CC5078;
    id v5 = &v9;
    id v9 = *(id *)(a1 + 48);
    [v4 _fetchGroupWithGroupID:v7 skipCache:1 completion:v8];
  }
}

void sub_1DD456924(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[ENLog groupContext];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543619;
    id v7 = v3;
    __int16 v8 = 2113;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DD450000, v4, OS_LOG_TYPE_DEFAULT, "Cached Incoming Group {error: %{public}@, group: %{private}@}", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD456A08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[ENLog groupContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543619;
    id v9 = v6;
    __int16 v10 = 2113;
    id v11 = v5;
    _os_log_impl(&dword_1DD450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to validate Incoming Group, fetched from server instead {error: %{public}@, group: %{private}@}", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD456AF8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[ENLog groupContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543619;
    uint64_t v10 = v8;
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1DD450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch cached group, fetched from server instead {error: %{public}@, group: %{private}@}", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD45731C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD4573D4;
  v7[3] = &unk_1E6CC5118;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 groupContext:v5 fetchAllKnownGroups:v7];
}

void sub_1DD4573D4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [*(id *)(a1 + 40) currentResult];
  [v6 addObjectsFromArray:v4];

  id v7 = *(void **)(a1 + 40);
  id v8 = [v7 currentResult];
  [v7 continueWithResult:v8];
}

void sub_1DD45747C(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 state];
  if (v3 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = [v7 error];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [v7 value];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }

LABEL_6:
}

void sub_1DD457670(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD457728;
  v7[3] = &unk_1E6CC5190;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 deleteAllKnownGroupsForGroupContext:v5 completion:v7];
}

uint64_t sub_1DD457728(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 40);
  return [v3 continueWithResult:&stru_1F38A4580];
}

uint64_t sub_1DD45777C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD4578FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DD4579B8;
  v8[3] = &unk_1E6CC5190;
  void v8[4] = v6;
  id v9 = v3;
  id v7 = v3;
  [v4 deleteCachedValueForForGroupContext:v6 withGroupID:v5 completion:v8];
}

uint64_t sub_1DD4579B8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 40);
  return [v3 continueWithResult:&stru_1F38A4580];
}

uint64_t sub_1DD457A0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DD457B00(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 queue];
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD457D40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 queue];
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD45809C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,os_activity_scope_state_s state)
{
}

void sub_1DD4580D4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1DD458168;
  v3[3] = &unk_1E6CC50C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _qFetchDataSourceGroupWithGroupID:v2 completion:v3];
}

void sub_1DD458168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1DD458254;
    v9[3] = &unk_1E6CC51E0;
    id v10 = v5;
    id v11 = v7;
    [v8 _cacheGroup:v10 completion:v9];
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v7, v6);
}

void sub_1DD458254(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ENLog groupContext];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DD450000, v2, OS_LOG_TYPE_INFO, "Finished caching group {group: %@, error: %@}", (uint8_t *)&v5, 0x16u);
  }
}

void sub_1DD458310(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  int v5 = +[ENLog groupContext];
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD450000, v6, OS_LOG_TYPE_INFO, "Found cached group", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v7 = 0;
      _os_log_impl(&dword_1DD450000, v6, OS_LOG_TYPE_DEFAULT, "Group not cached", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1DD4584F8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD4587D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = a3;
  id v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD458B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1DD458B50(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  id v5 = +[ENLog groupContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Caching {cache: %{public}@}", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DD458C90;
  v9[3] = &unk_1E6CC5190;
  void v9[4] = v7;
  id v10 = v3;
  id v8 = v3;
  [v4 groupContext:v7 cacheGroup:v6 completion:v9];
}

uint64_t sub_1DD458C90(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 40);
  return [v3 continueWithResult:&stru_1F38A4580];
}

uint64_t sub_1DD458CE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD458CF4(uint64_t a1)
{
}

void sub_1DD458CFC(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v4 = [v3 groupID];
  id v5 = [*(id *)(a1 + 32) groupID];
  id v14 = 0;
  int v6 = [v4 compare:v5 withResult:&v15 error:&v14];
  id v7 = v14;

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15 == -1;
  }
  else
  {
    id v8 = +[ENLog groupContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v3 groupID];
      id v10 = [*(id *)(a1 + 32) groupID];
      *(_DWORD *)buf = 138543874;
      id v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_DEFAULT, "Failed to compare groupIDs {error: %{public}@, lastestGroup.groupID: %{public}@, group.groupID: %{public}@}", buf, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;
}

void sub_1DD458E90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[ENLog groupContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Finished caching", v9, 2u);
  }

  uint64_t v6 = [v3 state];
  if (v6 == 1)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [v3 error];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else if (!v6)
  {
    [*(id *)(a1 + 32) _qDidCacheGroup:*(void *)(a1 + 40)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      [*(id *)(a1 + 32) _qDidUpdateGroup:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withGroup:*(void *)(a1 + 40)];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_1DD459060(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 middlewareCacheCostForContext:v5];
  uint64_t v8 = [v6 middlewareCacheCostForContext:*(void *)(a1 + 32)];

  uint64_t v9 = [NSNumber numberWithInteger:v7];
  id v10 = [NSNumber numberWithInteger:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

void sub_1DD459758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
}

void sub_1DD4597A0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v6 domain];
  if ([v8 isEqualToString:@"ENGroupContextErrorDomain"]) {
    BOOL v9 = [v6 code] == -2100;
  }
  else {
    BOOL v9 = 0;
  }

  if (v6)
  {
    if (v5) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10)
    {
LABEL_9:
      uint64_t v11 = +[ENLog groupContext];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1DD45E844((uint64_t)v5, (uint64_t)v6, v11);
      }

      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_20;
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  id v13 = +[ENLog groupContext];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 138477827;
    id v17 = v5;
    _os_log_impl(&dword_1DD450000, v13, OS_LOG_TYPE_INFO, "Created group {group: %{private}@}", (uint8_t *)&v16, 0xCu);
  }

  [*(id *)(a1 + 32) _qDidCreateGroup:v5];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    [*(id *)(a1 + 32) _qDidUpdateGroup:v14 withGroup:v5];
  }
  uint64_t v15 = +[ENLog groupContext];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DD450000, v15, OS_LOG_TYPE_INFO, "Caching new group", (uint8_t *)&v16, 2u);
  }

  [*(id *)(a1 + 32) _cacheGroup:v5 completion:&unk_1F38A42E0];
  id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_20:
  v12();
}

void sub_1DD4599D0(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[ENLog groupContext];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1DD450000, v3, OS_LOG_TYPE_INFO, "Finished caching {error: %@}", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1DD459C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 currentItem];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DD459CEC;
  v9[3] = &unk_1E6CC4F38;
  void v9[4] = v6;
  id v10 = v4;
  id v11 = v3;
  id v7 = v3;
  id v8 = v4;
  [v8 groupContext:v6 cachedGroupWithID:v5 completion:v9];
}

void sub_1DD459CEC(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[ENLog groupContext];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Found cached group -- Done {group: %{public}@, ware: %{public}@}", (uint8_t *)&v11, 0x16u);
    }

    id v8 = *(void **)(a1 + 32);
    BOOL v9 = [*(id *)(a1 + 48) visitedItems];
    [v8 _qCacheGroup:v3 toMiddlewares:v9 completion:&unk_1F38A42A0];

    [*(id *)(a1 + 48) stopWithResult:v3];
  }
  else
  {
    if (v6)
    {
      id v10 = *(void **)(a1 + 40);
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1DD450000, v5, OS_LOG_TYPE_INFO, "Did not find group -- Continue {ware: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 48) continueWithResult:0];
  }
}

void sub_1DD459E68(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 state];
  if (v3 == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [v6 value];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1DD45A030(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = +[ENLog groupContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E8CC((uint64_t)v6, v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DD45B0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
}

uint64_t sub_1DD45B4A4()
{
  qword_1EAB21C40 = (uint64_t)os_log_create("com.apple.ENLog", "groupContext");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD45B53C()
{
  qword_1EAB21C50 = (uint64_t)os_log_create("com.apple.ENLog", "groupContextCache");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD45B5D4()
{
  qword_1EAB21C60 = (uint64_t)os_log_create("com.apple.ENLog", "groupContextDataSource");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD45B66C()
{
  qword_1EAB21C70 = (uint64_t)os_log_create("com.apple.ENLog", "utilities");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD45B704()
{
  qword_1EAB21C80 = (uint64_t)os_log_create("com.apple.ENLog", "groupID");
  return MEMORY[0x1F41817F8]();
}

void sub_1DD45B83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_1DD45B854(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = [v5 groupID];
  id v8 = [v6 groupID];
  id v14 = 0;
  char v9 = [v7 compare:v8 withResult:&v15 error:&v14];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    int v11 = +[ENLog groupContext];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      id v17 = v5;
      __int16 v18 = 2113;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_1DD450000, v11, OS_LOG_TYPE_DEFAULT, "Failed to compare groups {group1: %{private}@, group2: %{private}@, error: %{public}@}", buf, 0x20u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  unint64_t v12 = v15;

  return v12;
}

void sub_1DD45C724(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[ENLog utilities];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1DD450000, v4, OS_LOG_TYPE_INFO, "Reduce -- Finished {result: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _completeWithResult:v3];
}

void sub_1DD45CBA0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x1E4F59E18];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithError:v4];

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void sub_1DD45CC20(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x1E4F59E18];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithSuccess:v4];

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void sub_1DD45CCA0(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = (objc_class *)MEMORY[0x1E4F59E18];
  id v7 = a2;
  id v8 = (id)[[v6 alloc] initWithSuccess:v7];

  [v3 _reduceWithPending:v4 visited:v5 currentResult:v8 completion:a1[7]];
}

uint64_t sub_1DD45DA04(uint64_t a1)
{
  return [(id)qword_1EAB21C90 addObject:*(void *)(a1 + 32)];
}

void sub_1DD45DB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD45DB28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD45DB38(uint64_t a1)
{
}

uint64_t sub_1DD45DB40(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)qword_1EAB21C90 copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DD45DBE0()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Engram.ENCypher", MEMORY[0x1E4F14430]);
  v1 = (void *)qword_1EAB21CA0;
  qword_1EAB21CA0 = (uint64_t)v0;

  qword_1EAB21C90 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  return MEMORY[0x1F41817F8]();
}

void sub_1DD45E4C4()
{
  sub_1DD453A10();
  sub_1DD4539F0(&dword_1DD450000, v0, v1, "Failed to load database -- Fail {description: %{public}@, error: %{public}@}");
}

void sub_1DD45E52C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138478083;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_1DD4539F0(&dword_1DD450000, a2, a3, "Failed to save group -- Fail {group: %{private}@, error: %{public}@}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void sub_1DD45E5A8()
{
  sub_1DD453A10();
  sub_1DD4539F0(&dword_1DD450000, v0, v1, "Failed to fetch coredataGroups -- Fail {error: %{public}@, request: %{public}@}");
}

void sub_1DD45E610(void *a1)
{
  os_log_t v1 = [a1 predicate];
  sub_1DD453A44();
  sub_1DD453A50(&dword_1DD450000, v2, v3, "Fetching by groupIDs {predicate: %@}", v4, v5, v6, v7, v8);
}

void sub_1DD45E694()
{
  sub_1DD453A44();
  sub_1DD453A28(&dword_1DD450000, v0, v1, "Failed to fetch objects to delete {error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1DD45E6FC()
{
  sub_1DD453A44();
  sub_1DD453A28(&dword_1DD450000, v0, v1, "Failed to save Context {error: %{public}@}", v2, v3, v4, v5, v6);
}

void sub_1DD45E764()
{
  sub_1DD453A44();
  sub_1DD453A28(&dword_1DD450000, v0, v1, "Failed to fetch {error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1DD45E7CC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD450000, a2, OS_LOG_TYPE_ERROR, "ENGroupID initWithDataRepresentation - wrong data size -- Failed {data: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1DD45E844(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1DD450000, log, OS_LOG_TYPE_FAULT, "Failed to create group {groupInfo: %{private}@, error: %{public}@}", (uint8_t *)&v3, 0x16u);
}

void sub_1DD45E8CC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DD450000, a2, OS_LOG_TYPE_FAULT, "Failed to get group {error: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1DD45E944(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  __int16 v5 = [a2 identifier];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  char v9 = v5;
  _os_log_fault_impl(&dword_1DD450000, a3, OS_LOG_TYPE_FAULT, "ENCypher_AES128 cypher mismatch {identifier: %@, expectedIdentifier: %@}", (uint8_t *)&v6, 0x16u);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cut_arc_os_release()
{
  return MEMORY[0x1F4112A88]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}