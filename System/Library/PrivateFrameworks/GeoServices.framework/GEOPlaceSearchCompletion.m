@interface GEOPlaceSearchCompletion
@end

@implementation GEOPlaceSearchCompletion

void __74___GEOPlaceSearchCompletion_initWithResponse_traits_sessionData_mapItems___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 resultType] == 2 && objc_msgSend(v5, "hasCollection"))
  {
    id v3 = v5;
    v4 = (id *)(a1 + 32);
LABEL_7:
    [*v4 addObject:v3];
    goto LABEL_8;
  }
  if ([v5 resultType] == 3 && objc_msgSend(v5, "hasPublisher"))
  {
    id v3 = v5;
    v4 = (id *)(a1 + 40);
    goto LABEL_7;
  }
LABEL_8:
}

@end