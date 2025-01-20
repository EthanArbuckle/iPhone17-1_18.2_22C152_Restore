@interface LSContainerAddWithNode
@end

@implementation LSContainerAddWithNode

void ___LSContainerAddWithNode_block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v44 = 0;
  id v45 = 0;
  __int16 v43 = 0;
  v2 = *(void **)(a1 + 32);
  id v42 = 0;
  BOOL v3 = _LSCreateContainerNodesAndFlagsForNode(v2, &v45, &v44, &v43, &v42);
  id v4 = v42;
  if (v45) {
    BOOL v5 = v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v41 = v4;
    v6 = [v45 bookmarkDataRelativeToNode:0 error:&v41];
    id v7 = v41;

    BOOL v3 = v6 != 0;
    id v4 = v7;
  }
  else
  {
    v6 = 0;
  }
  if (!v3 || v44 == 0)
  {
    v9 = 0;
  }
  else
  {
    id v40 = v4;
    v9 = [v44 bookmarkDataRelativeToNode:0 error:&v40];
    id v10 = v40;

    if (!v9)
    {
      v11 = _LSDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v44;
        _os_log_impl(&dword_182959000, v11, OS_LOG_TYPE_INFO, "_LSContainerAddWithNode(%{private}@, failed to get bookmarkData for diskImageNode %{private}@ but registering this container anyway.", buf, 0x16u);
      }

      v9 = 0;
    }
    id v4 = v10;
  }
  uint64_t v39 = 0;
  id v13 = v45;
  if (v45) {
    BOOL v14 = v3;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v38 = v4;
    int v15 = [v45 getVolumeIdentifier:&v39 error:&v38];
    id v36 = v38;

    if (v15)
    {
      id v13 = v45;
      uint64_t v16 = v39;
LABEL_26:
      __int16 v17 = v43;
      int v18 = *(unsigned __int8 *)(a1 + 56);
      long long v37 = *(_OWORD *)(a1 + 40);
      id v19 = v13;
      v35 = v6;
      id v20 = v6;
      id v21 = v9;
      id v22 = (id)v37;
      MEMORY[0x185310450](v22, v23);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke;
      v49 = &unk_1E522DFB0;
      id v24 = v19;
      __int16 v55 = v17;
      id v50 = v24;
      uint64_t v54 = v16;
      id v25 = v22;
      long long v53 = v37;
      id v26 = v20;
      id v51 = v26;
      id v27 = v21;
      id v52 = v27;
      uint64_t v28 = MEMORY[0x18530F950](buf);
      v6 = v35;
      v29 = (void *)v28;
      if (v18)
      {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
      }
      else
      {
        v34 = +[LSDBExecutionContext sharedServerInstance]();
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_37;
        v46[3] = &unk_1E522D260;
        id v47 = v29;
        -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v34, v46);
      }
      id v4 = v36;
      goto LABEL_34;
    }
    id v4 = v36;
  }
  else if (v3)
  {
    uint64_t v16 = 0;
    id v36 = v4;
    goto LABEL_26;
  }
  v30 = _LSDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    int v32 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v32;
    _os_log_impl(&dword_182959000, v30, OS_LOG_TYPE_INFO, "_LSContainerAddWithNode(%{private}@ sync=%{BOOL}d) failed to add container.", buf, 0x12u);
  }

  uint64_t v33 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_34:
  MEMORY[0x185310460](v33);
}

uint64_t ___LSContainerAddWithNode_block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___LSContainerAddWithNode_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end