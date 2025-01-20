@interface MPModelGenericObject
@end

@implementation MPModelGenericObject

void __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playlistEntry];
  v3 = [*(id *)(a1 + 40) playlistEntry];
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
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
    v35[3] = &unk_2643C0658;
    v11 = &v36;
    v12 = &v37;
    v36 = v2;
    v37 = v4;
    id v13 = v4;
    id v14 = v2;
    v15 = v35;
LABEL_9:
    uint64_t v16 = objc_msgSend(v9, "copyWithIdentifiers:block:", v10, v15, v23, v24, v25, v26);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    goto LABEL_10;
  }

  v6 = [*(id *)(a1 + 32) song];
  v7 = [*(id *)(a1 + 40) song];
  v8 = v7;
  if (v6 && v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v32[3] = &unk_2643C0658;
    v11 = &v33;
    v12 = &v34;
    v33 = v6;
    v34 = v8;
    id v13 = v8;
    id v14 = v6;
    v15 = v32;
    goto LABEL_9;
  }

  v19 = [*(id *)(a1 + 32) movie];
  v20 = [*(id *)(a1 + 40) movie];
  v21 = v20;
  if (v19 && v20)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4;
    v29[3] = &unk_2643C0658;
    v11 = &v30;
    v12 = &v31;
    v30 = v19;
    v31 = v21;
    id v13 = v21;
    id v14 = v19;
    v15 = v29;
    goto LABEL_9;
  }

  id v14 = [*(id *)(a1 + 32) tvEpisode];
  uint64_t v22 = [*(id *)(a1 + 40) tvEpisode];
  id v13 = (id)v22;
  if (v14 && v22)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v9 identifiers];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_5;
    v26 = &unk_2643C0658;
    v11 = &v27;
    id v14 = v14;
    id v27 = v14;
    v12 = &v28;
    id v13 = v13;
    id v28 = v13;
    v15 = &v23;
    goto LABEL_9;
  }
LABEL_10:
}

void __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setPlaylistEntry:v5];
}

void __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setSong:v5];
}

void __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setMovie:v5];
}

void __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTvEpisode:v5];
}

@end