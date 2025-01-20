@interface INInteraction
@end

@implementation INInteraction

uint64_t __66__INInteraction_IntentsCore__inc_associateFileURLsWithAuditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFileURL]) {
    INFileURLSetAssociatedAuditToken();
  }

  return 0;
}

@end