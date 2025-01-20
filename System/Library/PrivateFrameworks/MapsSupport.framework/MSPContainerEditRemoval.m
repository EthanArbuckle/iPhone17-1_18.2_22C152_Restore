@interface MSPContainerEditRemoval
@end

@implementation MSPContainerEditRemoval

id __94___MSPContainerEditRemoval_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (!v4)
  {
    v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v4;
}

@end