@interface OSLogIndexSortedByBoot
@end

@implementation OSLogIndexSortedByBoot

uint64_t ___OSLogIndexSortedByBoot_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = **(void ***)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = _os_trace_uuid_map_lookup(v5, (void *)[a2 bootUUID]);
  v8 = **(void ***)(a1 + 32);
  v9 = (void *)[v6 bootUUID];

  unint64_t v10 = _os_trace_uuid_map_lookup(v8, v9);
  if (v7 == v10) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 40) & 8) != 0)
  {
    if (v7 > v10) {
      return -1;
    }
    else {
      return 1;
    }
  }
  else if (v7 < v10)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

BOOL ___OSLogIndexSortedByBoot_block_invoke(uint64_t a1, void *a2)
{
  return _os_trace_uuid_map_lookup(**(void ***)(a1 + 32), (void *)[a2 bootUUID]) != 0;
}

@end