@interface NSMutableDictionary(MediaAnalysis)
- (id)vcp_mutableResults;
- (uint64_t)vcp_addEntriesFromResults:()MediaAnalysis;
- (uint64_t)vcp_addFlags:()MediaAnalysis;
- (uint64_t)vcp_addStatsFlags:()MediaAnalysis;
- (uint64_t)vcp_addTypes:()MediaAnalysis;
- (uint64_t)vcp_appendResults:()MediaAnalysis;
- (uint64_t)vcp_setDateAnalyzed:()MediaAnalysis;
- (uint64_t)vcp_setDateModified:()MediaAnalysis;
- (void)vcp_appendResult:()MediaAnalysis forKey:;
- (void)vcp_removeResultForKey:()MediaAnalysis;
- (void)vcp_setFingerprint:()MediaAnalysis;
- (void)vcp_setFlags:()MediaAnalysis;
- (void)vcp_setQuality:()MediaAnalysis;
- (void)vcp_setResult:()MediaAnalysis forKey:;
- (void)vcp_setResults:()MediaAnalysis;
- (void)vcp_setStatsFlags:()MediaAnalysis;
- (void)vcp_setTypes:()MediaAnalysis;
- (void)vcp_setVersion:()MediaAnalysis;
@end

@implementation NSMutableDictionary(MediaAnalysis)

- (void)vcp_setVersion:()MediaAnalysis
{
  objc_msgSend(NSNumber, "numberWithInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");
}

- (uint64_t)vcp_setDateModified:()MediaAnalysis
{
  return [a1 setObject:a3 forKey:@"dateModified"];
}

- (uint64_t)vcp_setDateAnalyzed:()MediaAnalysis
{
  return [a1 setObject:a3 forKey:@"dateAnalyzed"];
}

- (void)vcp_setTypes:()MediaAnalysis
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");
}

- (void)vcp_setFlags:()MediaAnalysis
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");
}

- (void)vcp_setStatsFlags:()MediaAnalysis
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");
}

- (void)vcp_setQuality:()MediaAnalysis
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");
}

- (void)vcp_setFingerprint:()MediaAnalysis
{
  id v8 = a3;
  v4 = [v8 master];

  if (v4)
  {
    v5 = [v8 master];
    [a1 setObject:v5 forKey:@"masterFingerprint"];
  }
  else
  {
    [a1 removeObjectForKey:@"masterFingerprint"];
  }
  v6 = [v8 adjusted];

  if (v6)
  {
    v7 = [v8 adjusted];
    [a1 setObject:v7 forKey:@"adjustedFingerprint"];
  }
  else
  {
    [a1 removeObjectForKey:@"adjustedFingerprint"];
  }
}

- (uint64_t)vcp_addTypes:()MediaAnalysis
{
  uint64_t v4 = objc_msgSend(a1, "vcp_types") | a3;
  return objc_msgSend(a1, "vcp_setTypes:", v4);
}

- (uint64_t)vcp_addFlags:()MediaAnalysis
{
  uint64_t v4 = objc_msgSend(a1, "vcp_flags") | a3;
  return objc_msgSend(a1, "vcp_setFlags:", v4);
}

- (uint64_t)vcp_addStatsFlags:()MediaAnalysis
{
  uint64_t v4 = objc_msgSend(a1, "vcp_statsFlags") | a3;
  return objc_msgSend(a1, "vcp_setStatsFlags:", v4);
}

- (id)vcp_mutableResults
{
  id v2 = [a1 objectForKey:@"metadataRanges"];
  if (!v2)
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1 setObject:v2 forKey:@"metadataRanges"];
  }
  return v2;
}

- (void)vcp_setResult:()MediaAnalysis forKey:
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6 && [v9 count])
  {
    v7 = objc_msgSend(a1, "vcp_mutableResults");
    id v8 = (void *)[v9 mutableCopy];
    [v7 setObject:v8 forKey:v6];
  }
}

- (uint64_t)vcp_addEntriesFromResults:()MediaAnalysis
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NSMutableDictionary_MediaAnalysis__vcp_addEntriesFromResults___block_invoke;
  v4[3] = &unk_1E629BF48;
  v4[4] = a1;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)vcp_setResults:()MediaAnalysis
{
  id v4 = a3;
  [a1 removeObjectForKey:@"metadataRanges"];
  objc_msgSend(a1, "vcp_addEntriesFromResults:", v4);
}

- (void)vcp_appendResult:()MediaAnalysis forKey:
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6 && [v11 count])
  {
    v7 = objc_msgSend(a1, "vcp_mutableResults");
    id v8 = [v7 objectForKeyedSubscript:v6];
    id v9 = v8;
    if (v8)
    {
      [v8 addObjectsFromArray:v11];
    }
    else
    {
      v10 = (void *)[v11 mutableCopy];
      [v7 setObject:v10 forKey:v6];
    }
  }
}

- (uint64_t)vcp_appendResults:()MediaAnalysis
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NSMutableDictionary_MediaAnalysis__vcp_appendResults___block_invoke;
  v4[3] = &unk_1E629BF48;
  v4[4] = a1;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)vcp_removeResultForKey:()MediaAnalysis
{
  id v5 = a3;
  id v4 = objc_msgSend(a1, "vcp_mutableResults");
  [v4 removeObjectForKey:v5];
}

@end