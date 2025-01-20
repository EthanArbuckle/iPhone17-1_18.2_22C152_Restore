@interface BOMBomNewFromDirectory
@end

@implementation BOMBomNewFromDirectory

void __BOMBomNewFromDirectory_parallel_block_invoke(uint64_t a1)
{
  ActualPath = (char *)BOMCopierSourceEntryGetActualPath(*(void *)(a1 + 40));
  Name = BOMCopierSourceEntryGetName(*(void **)(a1 + 40));
  v4 = BOMFSObjectNewFromPathWithSys(ActualPath, *(_WORD *)(a1 + 64), *(unsigned int (***)(void, char *, long long *))(a1 + 48));
  if (v4)
  {
    v5 = v4;
    BOMFSObjectSetPathName((uint64_t)v4, Name, 1);
    *(void *)(*(void *)(a1 + 56) + 8) = v5;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Could not create BOMFSObject for %s\n", ActualPath);
    uint64_t v6 = *(void *)(a1 + 56);
    *(unsigned char *)(v6 + 52) = 1;
    *(void *)(v6 + 56) = strdup(ActualPath);
    *(void *)(*(void *)(a1 + 56) + 64) = strdup(Name);
  }
  v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (v7)
  {
    dispatch_group_leave(v7);
  }
}

@end