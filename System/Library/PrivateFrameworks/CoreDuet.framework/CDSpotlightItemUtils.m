@interface CDSpotlightItemUtils
@end

@implementation CDSpotlightItemUtils

_CDContact *__45___CDSpotlightItemUtils__contactsForPersons___block_invoke(uint64_t a1, void *a2)
{
  return +[_CDSpotlightItemUtils _contactForPerson:](*(void *)(a1 + 32), a2);
}

uint64_t __33___CDSpotlightItemUtils_policies__block_invoke()
{
  uint64_t v0 = +[_CDInteractionPolicies interactionPolicies];
  uint64_t v1 = policies_policies;
  policies_policies = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

BOOL __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v6 = (void *)MEMORY[0x1E4F93BB8];
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    v8 = [v6 tupleWithFirst:v5 second:0];
  }
  else
  {
    v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    v8 = [v6 tupleWithFirst:v5 second:v7];
  }
  return v8;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F93BB8] tupleWithFirst:a2 second:0];
}

id __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v3 first];
  v6 = +[_CDSpotlightItemUtils _contactForPerson:](v4, v5);

  v7 = [v3 second];

  if (v7)
  {
    v8 = [v3 second];
    objc_msgSend(v6, "setParticipantStatus:", objc_msgSend(v8, "integerValue"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = objc_msgSend(v6, "identifier", (void)v19);
          v16 = [v14 identifier];
          int v17 = [v15 isEqual:v16];

          if (v17) {
            objc_msgSend(v14, "setParticipantStatus:", objc_msgSend(v6, "participantStatus"));
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v6;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_681(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = +[_CDSpotlightItemUtils shouldFilterEmailAddress:]((uint64_t)_CDSpotlightItemUtils, v2);

  return v3;
}

BOOL __69___CDSpotlightItemUtils_knowledgeEventsForSearchableItem_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceDate:a2];
  return v3 >= 0.0 && v3 <= *(double *)(a1 + 40);
}

uint64_t __50___CDSpotlightItemUtils_shouldFilterEmailAddress___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDE1E530];
  uint64_t v1 = shouldFilterEmailAddress___localPartBlackList;
  shouldFilterEmailAddress___localPartBlackList = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __51___CDSpotlightItemUtils_UTI__expectedSupportedUTIs__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v1 = (void *)expectedSupportedUTIs_hardCodedUTIs;
  expectedSupportedUTIs_hardCodedUTIs = (uint64_t)v0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[_CDSpotlightItemUtils mechanismUtiMap]();
  double v3 = objc_msgSend(v2, "allValues", 0);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(id)expectedSupportedUTIs_hardCodedUTIs addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v8 = (void *)expectedSupportedUTIs_hardCodedUTIs;
  self;
  return [v8 addObjectsFromArray:&unk_1EDE1E698];
}

void __45___CDSpotlightItemUtils_UTI__mechanismUtiMap__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1EDE1DAF0;
  id v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"public.message", @"public.url", @"com.apple.ichat.transcript", getkUTTypeMessage(), 0);
  uint64_t v1 = [v0 allObjects];
  v9[0] = v1;
  v8[1] = &unk_1EDE1DB08;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.ical.ics.event", @"public.calendar-event", getkUTTypeCalendarEvent(), 0);
  double v3 = [v2 allObjects];
  v9[1] = v3;
  v8[2] = &unk_1EDE1DB20;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.mail.emlx", getkUTTypeEmailMessage(), 0);
  uint64_t v5 = [v4 allObjects];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  uint64_t v7 = (void *)mechanismUtiMap_mechanismUtiMap;
  mechanismUtiMap_mechanismUtiMap = v6;
}

uint64_t __45___CDSpotlightItemUtils_UTI__utiConformCache__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = utiConformCache_utiConformCache;
  utiConformCache_utiConformCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end