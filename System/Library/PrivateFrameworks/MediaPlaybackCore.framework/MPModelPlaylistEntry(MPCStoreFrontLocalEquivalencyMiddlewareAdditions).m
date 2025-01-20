@interface MPModelPlaylistEntry(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)
- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions;
@end

@implementation MPModelPlaylistEntry(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6859;
  v16 = __Block_byref_object_dispose__6860;
  id v17 = a1;
  v5 = (void *)MEMORY[0x263F11F78];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke;
  v9[3] = &unk_2643C4648;
  v9[4] = v17;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 performWithoutEnforcement:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

@end