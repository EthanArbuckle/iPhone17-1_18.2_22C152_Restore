@interface MPModelPlaylistEntry
@end

@implementation MPModelPlaylistEntry

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) song];
  v3 = [*(id *)(a1 + 40) song];
  v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
    v29[3] = &unk_2643C06A8;
    v11 = &v30;
    v12 = &v31;
    v30 = v2;
    v31 = v4;
    id v13 = v4;
    id v14 = v2;
    v15 = v29;
LABEL_12:
    uint64_t v17 = objc_msgSend(v9, "copyWithIdentifiers:block:", v10, v15, v20, v21, v22, v23);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_13;
  }

  v6 = [*(id *)(a1 + 32) movie];
  v7 = [*(id *)(a1 + 40) movie];
  v8 = v7;
  if (v6 && v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v26[3] = &unk_2643C06A8;
    v11 = &v27;
    v12 = &v28;
    v27 = v6;
    v28 = v8;
    id v13 = v8;
    id v14 = v6;
    v15 = v26;
    goto LABEL_12;
  }

  id v14 = [*(id *)(a1 + 32) tvEpisode];
  uint64_t v16 = [*(id *)(a1 + 40) tvEpisode];
  id v13 = (id)v16;
  if (v14 && v16)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4;
    v23 = &unk_2643C06A8;
    v11 = &v24;
    id v14 = v14;
    id v24 = v14;
    v12 = &v25;
    id v13 = v13;
    id v25 = v13;
    v15 = &v20;
    goto LABEL_12;
  }
LABEL_13:
}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setSong:v5];
}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMovie:v5];
}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTvEpisode:v5];
}

@end