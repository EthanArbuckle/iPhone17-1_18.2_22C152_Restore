@interface MPCNullQueueFeeder
@end

@implementation MPCNullQueueFeeder

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_4;
  v4[3] = &unk_2643C5198;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 applyChanges:v2 identifierSetLookupBlock:v4];
}

__CFString *__48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_MPCNullPlaybackContext.m" lineNumber:137 description:@"No item lookups allowed for _MPCNullQueueFeeder."];

  return &stru_26CBCA930;
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_MPCNullPlaybackContext.m" lineNumber:132 description:@"No identifier set lookups allowed for _MPCNullQueueFeeder."];

  v3 = (void *)MEMORY[0x263F11DB0];

  return [v3 emptyIdentifierSet];
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_2()
{
  return 0;
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke()
{
  return 0;
}

@end