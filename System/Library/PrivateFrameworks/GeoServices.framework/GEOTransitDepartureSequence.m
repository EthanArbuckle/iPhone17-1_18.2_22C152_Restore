@interface GEOTransitDepartureSequence
@end

@implementation GEOTransitDepartureSequence

void __59___GEOTransitDepartureSequence_firstDepartureValidForDate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (v9)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v10 = v6;
  objc_storeStrong(v8, a2);
  id v6 = v10;
  if (a3) {
LABEL_3:
  }
    *a3 = 1;
LABEL_4:
}

uint64_t __55___GEOTransitDepartureSequence_departuresValidForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __65___GEOTransitDepartureSequence_operatingHoursForDate_inTimeZone___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_MergedGlobals_289;
  _MergedGlobals_289 = v0;
}

@end