@interface HKCFGNonTerminal
@end

@implementation HKCFGNonTerminal

uint64_t __72___HKCFGNonTerminal__tryNodesForExpressions_nodes_context_solutionTest___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) _tryNodesForExpressions:*(void *)(a1 + 48) nodes:*(void *)(a1 + 32) context:*(void *)(a1 + 56) solutionTest:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) removeObject:v4];

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

uint64_t __55___HKCFGNonTerminal__tryNodesWithContext_solutionTest___block_invoke(uint64_t a1)
{
  v2 = +[_HKCFGNonTerminalNode nodeWithChildren:rule:rangeOfString:](_HKCFGNonTerminalNode, "nodeWithChildren:rule:rangeOfString:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 80), [*(id *)(a1 + 32) scanLocation] - *(void *)(a1 + 80));
  [*(id *)(a1 + 56) addObject:v2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

  return v3;
}

uint64_t __43___HKCFGNonTerminal__parseTreeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [*(id *)(a1 + 32) scanner];
  uint64_t v6 = [v5 isAtEnd];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v6;
}

@end