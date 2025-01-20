@interface GEOTransitNearbySchedule
@end

@implementation GEOTransitNearbySchedule

void __132___GEOTransitNearbySchedule_nearbyScheduleCategoriesFromSchedule_departureSequenceContainers_scheduledDepartureSequences_incidents___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKeyedSubscript:v5];
}

@end