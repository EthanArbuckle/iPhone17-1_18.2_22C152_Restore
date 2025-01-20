@interface ATXHeroAndClipDefaultSampler
- (BOOL)_isEventEligibleForSampling:(id)a3;
- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4;
@end

@implementation ATXHeroAndClipDefaultSampler

- (BOOL)_isEventEligibleForSampling:(id)a3
{
  id v3 = a3;
  v4 = [v3 location];
  v5 = [MEMORY[0x1E4F935D0] sharedInstance];
  int v6 = [v5 isLocationNearKnownTypeLocationOfInterest:v4] ^ 1;

  v7 = +[_ATXGlobals sharedInstance];
  if (([v3 isClip] & 1) == 0)
  {
    v8 = [v3 bundleId];
    v9 = [v7 launchAndLocationHarvesterAppBlacklist];
    BOOL v10 = +[ATXLaunchAndLocationFilterer appBundleIdIsBlacklisted:v8 blacklist:v9];

    v11 = [v3 bundleId];
    v12 = [v7 launchAndLocationHarvesterGenreIdBlacklist];
    v6 &= (v10 | +[ATXLaunchAndLocationFilterer genreIdIsBlacklistedGivenAppBundleId:v11 blacklist:v12]) ^ 1;
  }
  v13 = [v4 timestamp];
  BOOL v14 = v6 & !+[ATXLaunchAndLocationFilterer locationIsStaleOrNotAccurateEnough:v4 now:v13];

  return v14;
}

- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4
{
  id v6 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__ATXHeroAndClipDefaultSampler_sampleEvents_numToSample___block_invoke;
  v19[3] = &unk_1E68ACED8;
  v19[4] = self;
  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v19];
  v8 = [v6 filteredArrayUsingPredicate:v7];

  unint64_t v9 = [v8 count];
  if (v9 < a4) {
    a4 = v9;
  }
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count])
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [NSNumber numberWithDouble:1.0];
      [v10 setObject:v12 atIndexedSubscript:v11];

      ++v11;
    }
    while (v11 < [v8 count]);
  }
  v13 = [MEMORY[0x1E4F4B658] sampleWeightedArray:v10 numToSample:a4];
  BOOL v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v15 = 0;
    do
    {
      v16 = [v13 objectAtIndexedSubscript:v15];
      v17 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));
      [v14 setObject:v17 atIndexedSubscript:v15];

      ++v15;
    }
    while (a4 != v15);
  }

  return v14;
}

uint64_t __57__ATXHeroAndClipDefaultSampler_sampleEvents_numToSample___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isEventEligibleForSampling:a2];
}

@end