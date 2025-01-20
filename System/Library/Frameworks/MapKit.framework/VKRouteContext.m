@interface VKRouteContext
@end

@implementation VKRouteContext

void __95__VKRouteContext_MKMapViewRouteContextUpdates___setRouteContextAnnotationTexts_forLegsInRoute___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if ([v5 length])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB3A80]) initWithEtaText:v5 etaAdvisoryStyleAttributes:0 routeEtaType:3];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3A88]), "initWithEtaDescription:start:end:", v6, objc_msgSend(v8, "startRouteCoordinate"), objc_msgSend(v8, "endRouteCoordinate"));
    [*(id *)(a1 + 40) addObject:v7];
  }
}

@end