@interface MPModelSong(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)
- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions;
@end

@implementation MPModelSong(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions
{
  id v4 = a3;
  v5 = [a1 identifiers];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke;
  v13[3] = &unk_2643C49D8;
  id v6 = v4;
  id v14 = v6;
  v7 = (void *)[v5 copyWithSource:@"StoreFrontLocalEquivalency" block:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4;
  v11[3] = &unk_2643C06D0;
  id v12 = v6;
  id v8 = v6;
  v9 = (void *)[a1 copyWithIdentifiers:v7 block:v11];

  return v9;
}

@end