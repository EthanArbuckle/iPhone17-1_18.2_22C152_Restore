@interface CopyProperty
@end

@implementation CopyProperty

uint64_t __routingContextResilientRemote_CopyProperty_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8) {
    return 4294954514;
  }
  return v8(a2, v3, v4, v5);
}

uint64_t __central_CopyProperty_block_invoke(void *a1)
{
  uint64_t v3 = a1[5];
  v2 = (const void *)a1[6];
  uint64_t v5 = a1[7];
  uint64_t v4 = (void *)a1[8];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    uint64_t result = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v7 = DerivedStorage;
  v8 = (const void *)*MEMORY[0x1E4F210A0];
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F210A0]) || CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D28]))
  {
    int EntityDoingActivity = _FigEndpointCentralGetEntityDoingActivity(v3, @"TurnByTurnNavigation");
    int v10 = CFEqual(v2, v8);
    v11 = (const void **)MEMORY[0x1E4F1CFD0];
    if (v10) {
      BOOL v12 = EntityDoingActivity == 2;
    }
    else {
      BOOL v12 = 0;
    }
    if (!v12)
    {
      int v13 = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D28]);
      if (EntityDoingActivity != 1 || v13 == 0) {
        v11 = (const void **)MEMORY[0x1E4F1CFC8];
      }
    }
    v15 = *v11;
    goto LABEL_15;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D30]))
  {
    int v18 = _FigEndpointCentralGetEntityDoingActivity(v3, @"Speech");
    v19 = (const void **)MEMORY[0x1E4F1CFD0];
    v20 = (const void **)MEMORY[0x1E4F1CFC8];
    BOOL v21 = v18 == 1;
LABEL_25:
    if (!v21) {
      v19 = v20;
    }
    v15 = *v19;
    goto LABEL_15;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D40]))
  {
    v22 = @"Screen";
LABEL_24:
    int v23 = _FigEndpointCentralEntityHoldsResource(v3, @"Car", (uint64_t)v22);
    v19 = (const void **)MEMORY[0x1E4F1CFC8];
    v20 = (const void **)MEMORY[0x1E4F1CFD0];
    BOOL v21 = v23 == 0;
    goto LABEL_25;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D38]))
  {
    v22 = @"MainAudio";
    goto LABEL_24;
  }
  uint64_t v24 = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20D48]);
  if (v24)
  {
    if (!MX_FeatureFlags_IsAirPlayDaemonEnabled(v24, v25))
    {
      uint64_t result = 4294954509;
      goto LABEL_17;
    }
    v15 = (const void *)*((void *)v7 + 1);
    if (!v15)
    {
      CFTypeRef v16 = 0;
      goto LABEL_16;
    }
LABEL_15:
    CFTypeRef v16 = CFRetain(v15);
LABEL_16:
    uint64_t result = 0;
    *uint64_t v4 = v16;
    goto LABEL_17;
  }
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 0;
  }
  v29 = *(uint64_t (**)(uint64_t, const void *, uint64_t, void *))(v28 + 48);
  if (v29) {
    uint64_t result = v29(CMBaseObject, v2, v5, v4);
  }
  else {
    uint64_t result = 4294954514;
  }
LABEL_17:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void __routingContext_CopyProperty_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"currentGroupID"))
  {
    v2 = *(void **)(a1 + 56);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    FigRoutingManagerCopyCurrentGroupUUID(v3, v2);
  }
  else
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), @"associatedAudioDevice"))
    {
      CMBaseObjectGetDerivedStorage();
      **(void **)(a1 + 56) = 0;
      return;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 40), @"isWHASilentPrimary"))
    {
      int IsConfigurationWHASilentPrimary = FigRoutingManagerIsConfigurationWHASilentPrimary(*(void *)(*(void *)(a1 + 48) + 8));
      uint64_t v5 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
      if (!IsConfigurationWHASilentPrimary) {
        uint64_t v5 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
      }
      **(void **)(a1 + 56) = CFRetain(*v5);
    }
    else
    {
      if (CFEqual(*(CFTypeRef *)(a1 + 40), @"selectedEndpointsForDiagnostics"))
      {
        CFDictionaryRef theDict = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigRoutingManagerContextUtilities_CopyNonControlPickedContexts((uint64_t)&theDict);
        if (theDict)
        {
          MutableCopy = (void *)FigCFArrayCreateMutableCopy();
          CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)routingContext_collectPickedEndpoints, MutableCopy);
        }
        else
        {
          MutableCopy = 0;
        }
        **(void **)(a1 + 56) = MutableCopy;
      }
      else
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 40), @"IsAnyRoutePickedOrBeingPicked"))
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12784;
          return;
        }
        CFDictionaryRef theDict = 0;
        FigRoutingManagerCopyPickedEndpointForRoutingContext(*(void *)(*(void *)(a1 + 48) + 8), (CFTypeRef *)&theDict);
        if (!theDict) {
          return;
        }
        **(void **)(a1 + 56) = CFRetain((CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      }
      if (theDict) {
        CFRelease(theDict);
      }
    }
  }
}

uint64_t __endpointAggregate_CopyProperty_block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7) {
    return 4294954514;
  }
  return v7(CMBaseObject, v1, v2, v3);
}

@end