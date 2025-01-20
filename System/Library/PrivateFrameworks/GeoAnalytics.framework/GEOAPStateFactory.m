@interface GEOAPStateFactory
+ (id)sharedFactory;
- (GEOAPStateFactory)init;
- (NSString)countryCode;
- (double)_monthResolution:(double)a3;
- (id)_emptyUserSessionState;
- (id)actionButtonDetails;
- (id)applicationIdentifier;
- (id)carPlay;
- (id)carPlayLimited;
- (id)curatedCollection;
- (id)curatedCollectionRedacted;
- (id)deviceConnection;
- (id)deviceConnectionLimited;
- (id)deviceIdentifier;
- (id)deviceIdentifierHardwareClass;
- (id)deviceIndentifierInternal;
- (id)deviceLocale;
- (id)deviceLocaleLimited;
- (id)deviceSettings_DailySettings;
- (id)deviceSettings_Long;
- (id)deviceSettings_Min;
- (id)deviceSettings_Short;
- (id)experimentsIncludingClientConfig:(uint64_t)a1;
- (id)extension;
- (id)impressionObject;
- (id)lookAroundSummary;
- (id)lookAroundView;
- (id)mapLaunch;
- (id)mapRestore;
- (id)mapSettings;
- (id)mapSettingsDetailed;
- (id)mapSettingsShort;
- (id)mapUI;
- (id)mapUIShown;
- (id)mapView;
- (id)mapViewLocation;
- (id)mapsPlaceIds;
- (id)mapsServer;
- (id)mapsUser;
- (id)market;
- (id)muninResourceLog;
- (id)offline;
- (id)pairedDevice;
- (id)pairedDeviceLong;
- (id)photoSubmissionDetails;
- (id)placeCard;
- (id)placeCardRap;
- (id)placeCardReveal;
- (id)ratingPhotoSubmissionDetails;
- (id)ratingSubmissionDetails;
- (id)route;
- (id)searchResults;
- (id)stateForType:(int64_t)a3;
- (id)suggestions;
- (id)tapEvent;
- (id)tileSet;
- (id)ugc;
- (int)_launchActionFromAPLaunchAction:(int)a3;
- (int)_privacyAllowedActionFromActualAction:(int)a3;
- (int)_rapPlaceCardTypeForRawType:(int)a3;
- (int)logMsgStateTypeForType:(int64_t)a3;
- (void)_updateOfflineVersionInfo;
- (void)dealloc;
- (void)deviceCountryChanged:(id)a3;
- (void)sessionStateForType:(int)a3 callback:(id)a4;
- (void)sessionStateForType:(int)a3 onQueue:(id)a4 callback:(id)a5;
- (void)sessionStateForType:(int)a3 sessionAppId:(id)a4 onQueue:(id)a5 callback:(id)a6;
- (void)setCountryCode:(id)a3;
@end

@implementation GEOAPStateFactory

void __28__GEOAPStateFactory_mapView__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapViewMapType])
  {
    uint64_t v2 = [*(id *)(a1 + 32) mapViewMapType];
    v3 = [*(id *)(a1 + 40) mapView];
    [v3 setMapType:v2];
  }
  if ([*(id *)(a1 + 32) hasMapViewViewMode])
  {
    uint64_t v4 = [*(id *)(a1 + 32) mapViewViewMode];
    v5 = [*(id *)(a1 + 40) mapView];
    [v5 setViewMode:v4];
  }
  if ([*(id *)(a1 + 32) hasMapViewZoomLevel])
  {
    [*(id *)(a1 + 32) mapViewZoomLevel];
    double v7 = v6;
    v8 = [*(id *)(a1 + 40) mapView];
    [v8 setZoomLevel:v7];
  }
  if ([*(id *)(a1 + 32) hasMapViewStyleZoomLevel])
  {
    [*(id *)(a1 + 32) mapViewStyleZoomLevel];
    double v10 = v9;
    v11 = [*(id *)(a1 + 40) mapView];
    [v11 setStyleZoomLevel:v10];
  }
  if ([*(id *)(a1 + 32) hasMapViewIsAdvancedMap])
  {
    uint64_t v12 = [*(id *)(a1 + 32) mapViewIsAdvancedMap];
    v13 = [*(id *)(a1 + 40) mapView];
    [v13 setIsAdvancedMap:v12];
  }
  if ([*(id *)(a1 + 32) hasMapViewIsGlobeProjection])
  {
    uint64_t v14 = [*(id *)(a1 + 32) mapViewIsGlobeProjection];
    v15 = [*(id *)(a1 + 40) mapView];
    [v15 setIsGlobeProjection:v14];
  }
  v16 = [*(id *)(a1 + 32) mapViewMapRegion];
  v17 = [*(id *)(a1 + 40) mapView];
  [v17 setMapRegion:v16];

  if ([*(id *)(a1 + 32) hasMapViewPitch])
  {
    [*(id *)(a1 + 32) mapViewPitch];
    double v19 = v18;
    id v20 = [*(id *)(a1 + 40) mapView];
    [v20 setPitch:v19];
  }
}

+ (id)sharedFactory
{
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  }
  uint64_t v2 = (void *)qword_26B2018B8;
  return v2;
}

- (id)stateForType:(int64_t)a3
{
  uint64_t v4 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v4 = -[GEOAPStateFactory deviceIdentifier]((id *)&self->super.isa);
      break;
    case 1:
      uint64_t v4 = -[GEOAPStateFactory deviceIndentifierInternal]((id *)&self->super.isa);
      break;
    case 2:
    case 65:
      uint64_t v4 = -[GEOAPStateFactory applicationIdentifier]((id *)&self->super.isa);
      break;
    case 3:
      uint64_t v4 = -[GEOAPStateFactory deviceLocale]((uint64_t)self);
      break;
    case 4:
      uint64_t v4 = -[GEOAPStateFactory deviceLocaleLimited]((uint64_t)self);
      break;
    case 5:
      uint64_t v4 = -[GEOAPStateFactory carPlay]((uint64_t)self);
      break;
    case 6:
      uint64_t v4 = -[GEOAPStateFactory carPlayLimited]((uint64_t)self);
      break;
    case 7:
      uint64_t v4 = -[GEOAPStateFactory pairedDevice]((uint64_t)self);
      break;
    case 8:
      uint64_t v4 = -[GEOAPStateFactory extension]((uint64_t)self);
      break;
    case 9:
      uint64_t v4 = -[GEOAPStateFactory mapView]((uint64_t)self);
      break;
    case 10:
      uint64_t v4 = -[GEOAPStateFactory mapViewLocation]((uint64_t)self);
      break;
    case 11:
      uint64_t v4 = -[GEOAPStateFactory mapSettings]((uint64_t)self);
      break;
    case 12:
      uint64_t v4 = -[GEOAPStateFactory mapSettingsDetailed]((uint64_t)self);
      break;
    case 13:
      uint64_t v4 = -[GEOAPStateFactory mapUI]((uint64_t)self);
      break;
    case 14:
      uint64_t v4 = [(GEOAPStateFactory *)self mapUIShown];
      break;
    case 15:
      v5 = self;
      int v6 = 0;
      goto LABEL_19;
    case 16:
      v5 = self;
      int v6 = 1;
LABEL_19:
      uint64_t v4 = -[GEOAPStateFactory experimentsIncludingClientConfig:]((uint64_t)v5, v6);
      break;
    case 17:
      uint64_t v4 = -[GEOAPStateFactory placeCard]((uint64_t)self);
      break;
    case 18:
      uint64_t v4 = [(GEOAPStateFactory *)self placeCardReveal];
      break;
    case 19:
      uint64_t v4 = -[GEOAPStateFactory route]((uint64_t)self);
      break;
    case 20:
      uint64_t v4 = -[GEOAPStateFactory mapsServer]((uint64_t)self);
      break;
    case 21:
      uint64_t v4 = -[GEOAPStateFactory tileSet]((uint64_t)self);
      break;
    case 24:
      uint64_t v7 = 503;
      goto LABEL_30;
    case 25:
      uint64_t v7 = 708;
      goto LABEL_30;
    case 26:
      uint64_t v4 = -[GEOAPStateFactory mapRestore]((uint64_t)self);
      break;
    case 27:
      uint64_t v4 = -[GEOAPStateFactory suggestions]((uint64_t)self);
      break;
    case 28:
      uint64_t v7 = 712;
LABEL_30:
      uint64_t v4 = createStateWithType(v7);
      break;
    case 29:
      uint64_t v4 = -[GEOAPStateFactory deviceConnection](self);
      break;
    case 30:
      uint64_t v4 = -[GEOAPStateFactory deviceConnectionLimited](self);
      break;
    case 31:
      uint64_t v4 = -[GEOAPStateFactory lookAroundSummary]((uint64_t)self);
      break;
    case 32:
      uint64_t v4 = -[GEOAPStateFactory lookAroundView]((uint64_t)self);
      break;
    case 33:
      uint64_t v4 = -[GEOAPStateFactory muninResourceLog]((uint64_t)self);
      break;
    case 34:
      uint64_t v4 = -[GEOAPStateFactory deviceSettings_Min]((uint64_t)self);
      break;
    case 35:
      uint64_t v4 = -[GEOAPStateFactory deviceSettings_Short](self);
      break;
    case 36:
      uint64_t v4 = -[GEOAPStateFactory deviceSettings_Long]((uint64_t)self);
      break;
    case 37:
      uint64_t v4 = -[GEOAPStateFactory deviceSettings_DailySettings]((uint64_t)self);
      break;
    case 38:
      uint64_t v4 = -[GEOAPStateFactory curatedCollection]((uint64_t)self);
      break;
    case 39:
      uint64_t v4 = [(GEOAPStateFactory *)self curatedCollectionRedacted];
      break;
    case 40:
      uint64_t v4 = -[GEOAPStateFactory ugc]((uint64_t)self);
      break;
    case 41:
      uint64_t v4 = -[GEOAPStateFactory mapLaunch](self);
      break;
    case 42:
      uint64_t v4 = -[GEOAPStateFactory market]((uint64_t)self);
      break;
    case 43:
      uint64_t v4 = -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
      break;
    case 48:
      uint64_t v4 = -[GEOAPStateFactory mapsUser](self);
      break;
    case 49:
      uint64_t v4 = -[GEOAPStateFactory deviceIdentifierHardwareClass]((uint64_t)self);
      break;
    case 54:
      uint64_t v4 = [(GEOAPStateFactory *)self searchResults];
      break;
    case 56:
      uint64_t v4 = [(GEOAPStateFactory *)self impressionObject];
      break;
    case 57:
      uint64_t v4 = -[GEOAPStateFactory tapEvent]((uint64_t)self);
      break;
    case 58:
      uint64_t v4 = -[GEOAPStateFactory actionButtonDetails]((uint64_t)self);
      break;
    case 60:
      uint64_t v4 = -[GEOAPStateFactory photoSubmissionDetails]((uint64_t)self);
      break;
    case 61:
      uint64_t v4 = -[GEOAPStateFactory ratingSubmissionDetails]((uint64_t)self);
      break;
    case 62:
      uint64_t v4 = -[GEOAPStateFactory ratingPhotoSubmissionDetails]((uint64_t)self);
      break;
    case 64:
      uint64_t v4 = -[GEOAPStateFactory mapSettingsShort]((uint64_t)self);
      break;
    case 66:
      uint64_t v4 = -[GEOAPStateFactory pairedDeviceLong]((uint64_t)self);
      break;
    case 67:
      uint64_t v4 = [(GEOAPStateFactory *)self placeCardRap];
      break;
    case 68:
      uint64_t v4 = [(GEOAPStateFactory *)self mapsPlaceIds];
      break;
    case 70:
      uint64_t v4 = -[GEOAPStateFactory offline]((uint64_t)self);
      break;
    default:
      break;
  }
  return v4;
}

- (int)logMsgStateTypeForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x46) {
    return 0;
  }
  else {
    return dword_24FEFA5BC[a3];
  }
}

- (id)placeCard
{
  if (a1)
  {
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    uint64_t v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    v1 = +[GEOAPSharedStateData sharedData];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __30__GEOAPStateFactory_placeCard__block_invoke;
    v5[3] = &unk_265345378;
    id v2 = v1;
    id v6 = v2;
    uint64_t v7 = &v8;
    [v2 performPlaceCardStateUpdate:v5];
    id v3 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)offline
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [MEMORY[0x263F41B60] sharedNoCreate];
    id v3 = v2;
    if (!v2)
    {
      id v5 = 0;
LABEL_26:

      goto LABEL_27;
    }
    __int16 v4 = [v2 state];
    id v5 = objc_alloc_init(MEMORY[0x263F41978]);
    [v5 setStateType:713];
    id v6 = objc_alloc_init(MEMORY[0x263F41A78]);
    [v5 setOffline:v6];

    if (v4 >= 3u)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        LODWORD(v28) = 67109120;
        HIDWORD(v28) = v4;
        _os_log_fault_impl(&dword_24FE56000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v28, 8u);
      }
      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = (v4 & 7) == 2;
    }
    uint64_t v8 = [v5 offline];
    [v8 setIsMapsInOfflineMode:v7];

    double v9 = [v5 offline];
    LODWORD(v8) = [v9 isMapsInOfflineMode];

    if (!v8) {
      goto LABEL_26;
    }
    if (v4 < 2u) {
      goto LABEL_18;
    }
    if (v4 == 2)
    {
      if (HIBYTE(v4) < 3u)
      {
        BOOL v10 = (v4 & 0x700) == 512;
LABEL_19:
        uint64_t v14 = objc_msgSend(v5, "offline", v28, v29);
        [v14 setIsOnlyUseOffline:v10];

        unsigned int v15 = [v3 offlineRegionCount];
        if (v15 >= 2) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = v15;
        }
        v17 = [v5 offline];
        [v17 setNumberOfDownloadedRegions:v16];

        double v18 = [MEMORY[0x263F41B40] sharedNetworkObserver];
        uint64_t v19 = [v18 isNetworkReachable];
        id v20 = [v5 offline];
        [v20 setIsNetworkConnected:v19];

        v21 = *(void **)(a1 + 48);
        if (v21)
        {
          uint64_t v22 = [v21 unsignedLongLongValue];
          v23 = [v5 offline];
          [v23 setSearchOdsVersion:v22];
        }
        v24 = *(void **)(a1 + 56);
        if (v24)
        {
          uint64_t v25 = [v24 unsignedLongLongValue];
          v26 = [v5 offline];
          [v26 setRoutingOdsVersion:v25];
        }
        goto LABEL_26;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
LABEL_18:
        BOOL v10 = 0;
        goto LABEL_19;
      }
      LODWORD(v28) = 67109120;
      HIDWORD(v28) = HIBYTE(v4);
      uint64_t v12 = &_os_log_internal;
      id v13 = "Unreachable reached: invalid offline reason value %x";
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_18;
      }
      LODWORD(v28) = 67109120;
      HIDWORD(v28) = v4;
      uint64_t v12 = &_os_log_internal;
      id v13 = "Unreachable reached: invalid offline mode value %x";
    }
    _os_log_fault_impl(&dword_24FE56000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v28, 8u);
    goto LABEL_18;
  }
  id v5 = 0;
LABEL_27:
  return v5;
}

- (id)market
{
  if (a1)
  {
    v1 = +[GEOAPSharedStateData sharedData];
    id v2 = objc_alloc_init(MEMORY[0x263F41978]);
    [v2 setStateType:722];
    id v3 = objc_alloc_init(MEMORY[0x263F41A60]);
    [v2 setMarket:v3];

    __int16 v4 = [v1 bestCurrentMetro];
    id v5 = [v2 market];
    [v5 setMarket:v4];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)deviceLocale
{
  if (a1)
  {
    v1 = -[GEOAPStateFactory deviceLocaleLimited](a1);
    id v2 = +[GEOAPSharedStateData sharedData];
    id v3 = [v2 deviceInputLocale];
    __int16 v4 = [v1 deviceLocale];
    [v4 setDeviceInputLocale:v3];

    id v5 = +[GEOAPSharedStateData sharedData];
    id v6 = [v5 deviceOutputLocale];
    BOOL v7 = [v1 deviceLocale];
    [v7 setDeviceOutputLocale:v6];
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceLocaleLimited
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:402];
    id v2 = objc_alloc_init(MEMORY[0x263F419D0]);
    [v1 setDeviceLocale:v2];

    id v3 = [MEMORY[0x263EFF960] preferredLanguages];
    __int16 v4 = [v3 firstObject];
    id v5 = [v1 deviceLocale];
    [v5 setDeviceSettingsLocale:v4];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)deviceIdentifier
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)deviceConnectionLimited
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F41978]);
    [v2 setStateType:403];
    id v3 = objc_alloc_init(MEMORY[0x263F419C0]);
    [v2 setDeviceConnection:v3];

    __int16 v4 = [a1 countryCode];
    id v5 = [v2 deviceConnection];
    [v5 setDeviceCountryCode:v4];

    id v6 = [MEMORY[0x263F41B40] sharedNetworkObserver];
    if ([v6 isNetworkReachable])
    {
      if ([v6 isWiFiConnection])
      {
        BOOL v7 = [v2 deviceConnection];
        uint64_t v8 = v7;
        uint64_t v9 = 3;
      }
      else
      {
        int v10 = [v6 isCellConnection];
        BOOL v7 = [v2 deviceConnection];
        uint64_t v8 = v7;
        if (v10) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 0;
        }
      }
    }
    else
    {
      BOOL v7 = [v2 deviceConnection];
      uint64_t v8 = v7;
      uint64_t v9 = 1;
    }
    [v7 setDeviceNetworkConnectivity:v9];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)applicationIdentifier
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)suggestions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasSuggestionsData])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:710];
      id v3 = objc_alloc_init(MEMORY[0x263F41AC0]);
      [v2 setSuggestions:v3];

      if ([v1 hasSuggestionsSearchString])
      {
        __int16 v4 = [v1 suggestionsSearchString];
        id v5 = [v2 suggestions];
        [v5 setSearchString:v4];
      }
      if ([v1 hasSuggestionsAcSequenceNumber])
      {
        uint64_t v6 = [v1 suggestionsAcSequenceNumber];
        BOOL v7 = [v2 suggestions];
        [v7 setAcSequenceNumber:v6];
      }
      if ([v1 hasSuggestionsSelectedIndex])
      {
        uint64_t v8 = [v1 suggestionsSelectedIndex];
        uint64_t v9 = [v2 suggestions];
        [v9 setSelectedIndex:v8];
      }
      if ([v1 hasSuggestionsSearchFieldType])
      {
        uint64_t v10 = [v1 suggestionsSearchFieldType];
        v11 = [v2 suggestions];
        [v11 setSearchFieldType:v10];
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v12 = objc_msgSend(v1, "suggestionsDisplayedResults", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            double v18 = [v2 suggestions];
            [v18 addDisplayedResult:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)route
{
  if (a1)
  {
    uint64_t v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasRouteRouteDetails])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:703];
      id v3 = objc_alloc_init(MEMORY[0x263F41AA0]);
      [v2 setRoute:v3];

      __int16 v4 = [v1 routeRouteDetails];
      id v5 = [v2 route];
      [v5 setRouteDetails:v4];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)pairedDevice
{
  if (a1)
  {
    uint64_t v1 = +[GEONanoInfo sharedInfo];
    id v2 = [v1 hasPairedDeviceIfAvailable];
    id v3 = v2;
    if (v2 && [v2 BOOLValue])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F41978]);
      [v4 setStateType:405];
      id v5 = objc_alloc_init(MEMORY[0x263F41A80]);
      [v4 setPairedDevice:v5];

      uint64_t v6 = [v4 pairedDevice];
      [v6 setType:1];

      id v7 = objc_alloc_init(MEMORY[0x263F419C8]);
      uint64_t v8 = [v4 pairedDevice];
      [v8 setPairedDeviceIdentifier:v7];

      uint64_t v9 = [v1 deviceOsVersionIfAvailable];
      uint64_t v10 = [v4 pairedDevice];
      v11 = [v10 pairedDeviceIdentifier];
      [v11 setDeviceOsVersion:v9];

      uint64_t v12 = [v1 deviceProductType];
      uint64_t v13 = [v4 pairedDevice];
      uint64_t v14 = [v13 pairedDeviceIdentifier];
      [v14 setDeviceHwIdentifier:v12];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)mapsServer
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasMapsServerData])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:705];
      id v3 = objc_alloc_init(MEMORY[0x263F41A50]);
      [v2 setMapsServer:v3];

      if ([v1 hasMapsServerMetadata])
      {
        id v4 = [v1 mapsServerMetadata];
        id v5 = [v2 mapsServer];
        [v5 setServerMetadata:v4];
      }
      else
      {
        id v6 = objc_alloc_init(MEMORY[0x263F41B28]);
        id v7 = [v2 mapsServer];
        [v7 setServerMetadata:v6];

        uint64_t v8 = [v1 mapsServerMetadataSuggestionEntryTappedOn];
        uint64_t v9 = [v2 mapsServer];
        uint64_t v10 = [v9 serverMetadata];
        [v10 setSuggestionEntryMetadataTappedOn:v8];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v4 = objc_msgSend(v1, "mapsServerMetadataSuggestionEntryDisplayeds", 0);
        uint64_t v11 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v4);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v16 = [v2 mapsServer];
              uint64_t v17 = [v16 serverMetadata];
              [v17 addSuggestionEntryMetadataDisplayed:v15];
            }
            uint64_t v12 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v12);
        }
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)mapViewLocation
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:502];
    id v2 = objc_alloc_init(MEMORY[0x263F41A38]);
    [v1 setMapViewLocation:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__GEOAPStateFactory_mapViewLocation__block_invoke;
    v9[3] = &unk_265345350;
    id v10 = v3;
    id v4 = v1;
    id v11 = v4;
    id v5 = v3;
    [v5 performMapViewStateUpdate:v9];
    id v6 = v11;
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)mapView
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:501];
    id v2 = objc_alloc_init(MEMORY[0x263F41A30]);
    [v1 setMapView:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __28__GEOAPStateFactory_mapView__block_invoke;
    v9[3] = &unk_265345350;
    id v10 = v3;
    id v4 = v1;
    id v11 = v4;
    id v5 = v3;
    [v5 performMapViewStateUpdate:v9];
    id v6 = v11;
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)mapUI
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:505];
    id v2 = objc_alloc_init(MEMORY[0x263F41A20]);
    [v1 setMapUi:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    if ([v3 hasMapUiLayoutInfo])
    {
      uint64_t v4 = [v3 layoutInfoAsGEOLayoutInfo];
      id v5 = [v1 mapUi];
      [v5 setLayoutInfo:v4];
    }
    if ([v3 hasMapUiLayoutStyle])
    {
      uint64_t v6 = [v3 layoutStyleAsGEOLayoutStyle];
      id v7 = [v1 mapUi];
      [v7 setLayoutStyle:v6];
    }
    if ([v3 hasMapUiNumberOfMapsWindows])
    {
      if ([v3 mapUiNumberOfMapsWindows] > 3) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = [v3 mapUiNumberOfMapsWindows];
      }
      uint64_t v9 = [v1 mapUi];
      [v9 setNumberOfMapsWindows:v8];
    }
    if ([v3 hasWindowSize])
    {
      switch([v3 windowSize])
      {
        case 0u:
          id v10 = [v1 mapUi];
          id v11 = v10;
          uint64_t v12 = 1;
          goto LABEL_17;
        case 1u:
          id v10 = [v1 mapUi];
          id v11 = v10;
          uint64_t v12 = 2;
          goto LABEL_17;
        case 2u:
          id v10 = [v1 mapUi];
          id v11 = v10;
          uint64_t v12 = 3;
          goto LABEL_17;
        case 3u:
          id v10 = [v1 mapUi];
          id v11 = v10;
          uint64_t v12 = 4;
LABEL_17:
          [v10 setWindowSize:v12];

          break;
        default:
          break;
      }
    }
    if ([v3 hasLandscape])
    {
      uint64_t v13 = [v3 landscape];
      uint64_t v14 = [v1 mapUi];
      [v14 setLandscape:v13];
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)mapUIShown
{
  id v2 = objc_alloc_init(MEMORY[0x263F41978]);
  [v2 setStateType:506];
  id v3 = objc_alloc_init(MEMORY[0x263F41A28]);
  [v2 setMapUiShown:v3];

  uint64_t v4 = +[GEOAPSharedStateData sharedData];
  uint64_t v5 = [v4 mapUiShownAqiShown];
  uint64_t v6 = [v2 mapUiShown];
  [v6 setIsAirQualityShown:v5];

  uint64_t v7 = [v4 mapUiShownWeatherShown];
  uint64_t v8 = [v2 mapUiShown];
  [v8 setIsWeatherShown:v7];

  uint64_t v9 = [v4 venueExperienceShown];
  id v10 = [v2 mapUiShown];
  [v10 setIsVenueExperienceShown:v9];

  uint64_t v11 = [v4 activeNavModeAsGEOTransportType];
  uint64_t v12 = [v2 mapUiShown];
  [v12 setActiveNavMode:v11];

  if ([v4 hasLookAroundEntryIconShown])
  {
    uint64_t v13 = [v4 lookAroundEntryIconShown];
    uint64_t v14 = [v2 mapUiShown];
    [v14 setIsLookAroundEntryIconShown:v13];
  }
  return v2;
}

- (id)mapSettingsShort
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:504];
    id v2 = +[GEOAPSharedStateData sharedData];
    id v3 = [v2 stateMapSettingsShort];
    [v1 setMapSettings:v3];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)experimentsIncludingClientConfig:(uint64_t)a1
{
  if (a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F41978]);
    [v3 setStateType:602];
    id v4 = objc_alloc_init(MEMORY[0x263F419E8]);
    [v3 setExperiments:v4];

    if (a2)
    {
      uint64_t v5 = [MEMORY[0x263F41788] sharedConfiguration];
      uint64_t v6 = [v5 clientConfig];
      uint64_t v7 = [v3 experiments];
      [v7 setClientAbExperimentAssignment:v6];
    }
    id v8 = objc_alloc_init(MEMORY[0x263F41B68]);
    uint64_t v9 = [v3 experiments];
    [v9 setDatasetAbStatus:v8];

    id v10 = [MEMORY[0x263F41788] sharedConfiguration];
    uint64_t v11 = [v10 experimentsInfo];
    uint64_t v12 = [v11 mapsAbClientMetadata];
    uint64_t v13 = [v12 clientDatasetMetadata];
    uint64_t v14 = [v13 datasetId];
    uint64_t v15 = [v3 experiments];
    uint64_t v16 = [v15 datasetAbStatus];
    [v16 setDatasetId:v14];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)deviceSettings_Short
{
  if (a1)
  {
    a1 = -[GEOAPStateFactory deviceSettings_Min]((uint64_t)a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)deviceSettings_Min
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:407];
    id v2 = objc_alloc_init(MEMORY[0x263F419D8]);
    [v1 setDeviceSettings:v2];

    id v3 = [MEMORY[0x263F41B90] sharedPlatform];
    uint64_t v4 = [v3 supportsAdvancedMap];
    uint64_t v5 = [v1 deviceSettings];
    [v5 setSupportsAdvancedMap:v4];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)carPlay
{
  if (a1)
  {
    id v1 = -[GEOAPStateFactory carPlayLimited](a1);
    id v2 = +[GEOAPSharedStateData sharedData];
    id v3 = [v2 carPlayInfo];
    uint64_t v4 = [v1 carPlay];
    [v4 setCarInfo:v3];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)carPlayLimited
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:404];
    id v2 = objc_alloc_init(MEMORY[0x263F419B0]);
    [v1 setCarPlay:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    uint64_t v4 = [v3 hasCarPlayInfo];
    uint64_t v5 = [v1 carPlay];
    [v5 setIsConnected:v4];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (void)sessionStateForType:(int)a3 callback:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
  uint64_t v8 = 0;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v9 = 0;
  id v10 = v7;
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 19:
      goto LABEL_7;
    case 2:
      uint64_t v11 = objc_msgSend(MEMORY[0x263F41C70], "sharedInstance", 0);
      uint64_t v12 = v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_4;
      v13[3] = &unk_265345468;
      v13[4] = v7;
      v13[5] = &v17;
      [v11 fifteenMonthDeviceSessionValues:v13];
      goto LABEL_6;
    case 5:
      uint64_t v11 = objc_msgSend(MEMORY[0x263F41C70], "sharedInstance", 0);
      uint64_t v12 = v16;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke;
      v16[3] = &unk_2653453F0;
      v16[4] = v7;
      v16[5] = &v17;
      [v11 shortSessionValues:v16];
      goto LABEL_6;
    case 6:
    case 15:
      uint64_t v11 = objc_msgSend(MEMORY[0x263F41C70], "sharedInstance", 0);
      uint64_t v12 = v15;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_2;
      v15[3] = &unk_265345418;
      v15[4] = v7;
      v15[5] = &v17;
      [v11 shortAndNavSessionValues:v15];
      goto LABEL_6;
    case 8:
    case 14:
      uint64_t v11 = objc_msgSend(MEMORY[0x263F41BB8], "sharedManager", 0);
      uint64_t v12 = v14;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_3;
      v14[3] = &unk_265345440;
      v14[4] = v7;
      [v11 referenceTimeResult:v14];
LABEL_6:

      id v10 = (void *)v12[4];
      uint64_t v9 = v7;
LABEL_7:

      uint64_t v8 = *((unsigned int *)v18 + 6);
      uint64_t v7 = v9;
      break;
    default:
      break;
  }
  v6[2](v6, v7, v8);
  _Block_object_dispose(&v17, 8);
}

- (id)_emptyUserSessionState
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:601];
    id v2 = objc_alloc_init(MEMORY[0x263F41AF8]);
    [v1 setUserSession:v2];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_3(uint64_t a1, double a2)
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F417C0]) initWithCFAbsoluteTime:a2];
  id v3 = [*(id *)(a1 + 32) userSession];
  [v3 setEventTime:v4];
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8)
{
  uint64_t v16 = [*(id *)(a1 + 32) userSession];
  objc_msgSend(v16, "setSessionId:", a3, a4);

  uint64_t v17 = [*(id *)(a1 + 32) userSession];
  [v17 setSessionEpoch:a2];

  double v18 = [*(id *)(a1 + 32) userSession];
  [v18 setRelativeTimestamp:a8];

  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F417C0]) initWithCFAbsoluteTime:a6];
  int v20 = [*(id *)(a1 + 32) userSession];
  [v20 setEventTime:v19];

  long long v21 = [*(id *)(a1 + 32) userSession];
  [v21 setHasRotated:a5];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a7;
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  int v20 = [*(id *)(a1 + 32) userSession];
  objc_msgSend(v20, "setSessionId:", a2, a3);

  long long v21 = [*(id *)(a1 + 32) userSession];
  [v21 setRelativeTimestamp:a9];

  long long v22 = [*(id *)(a1 + 32) userSession];
  [v22 setSequenceNumber:a4];

  if (a10 != 0.0)
  {
    long long v23 = [*(id *)(a1 + 32) userSession];
    objc_msgSend(v23, "setNavSessionId:", a5, a6);

    uint64_t v24 = [*(id *)(a1 + 32) userSession];
    [v24 setNavSessionRelativeTimestamp:a10];
  }
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F417C0]) initWithCFAbsoluteTime:a7];
  v26 = [*(id *)(a1 + 32) userSession];
  [v26 setEventTime:v25];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a8;
}

uint64_t __34__GEOAPStateFactory_sharedFactory__block_invoke()
{
  qword_26B2018B8 = objc_alloc_init(GEOAPStateFactory);
  return MEMORY[0x270F9A758]();
}

- (id)mapsUser
{
  if (a1)
  {
    id v2 = +[GEOAPSharedStateData sharedData];
    id v3 = objc_alloc_init(MEMORY[0x263F41978]);
    [v3 setStateType:2];
    id v4 = objc_alloc_init(MEMORY[0x263F41AF0]);
    [v3 setUser:v4];

    uint64_t v5 = [MEMORY[0x263F41C70] sharedInstance];
    [v5 _getMapsUserStartDate];
    double v7 = v6;

    if (v7 != 0.0)
    {
      [a1 _monthResolution:v7];
      double v9 = v8;
      id v10 = [v3 user];
      [v10 setBestMapsUseStartDate:v9];
    }
    if (_GEOConfigHasValue())
    {
      GEOConfigGetDouble();
      objc_msgSend(a1, "_monthResolution:");
      double v12 = v11;
      uint64_t v13 = [v3 user];
      [v13 setMapsUseStartDate:v12];
    }
    uint64_t BOOL = GEOConfigGetBOOL();
    uint64_t v15 = [v3 user];
    [v15 setIsSignedInWithDsid:BOOL];

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __29__GEOAPStateFactory_mapsUser__block_invoke;
    v25[3] = &unk_2653453C8;
    v25[4] = &v32;
    v25[5] = &v26;
    [v2 bestUserHomeLocation:v25];
    uint64_t v16 = v27[5];
    uint64_t v17 = [v3 user];
    [v17 setHomeMetroRegion:v16];

    uint64_t v18 = v33[5];
    uint64_t v19 = [v3 user];
    [v19 setHomeCountryCode:v18];

    int v20 = [v2 bestCurrentMetro];
    long long v21 = v20;
    if (v20 && v27[5])
    {
      int v22 = objc_msgSend(v20, "isEqualToString:");
      long long v23 = [v3 user];
      [v23 setIsTourist:v22 ^ 1u];
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __29__GEOAPStateFactory_mapsUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (GEOAPStateFactory)init
{
  v36.receiver = self;
  v36.super_class = (Class)GEOAPStateFactory;
  id v2 = [(GEOAPStateFactory *)&v36 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

    id v5 = [MEMORY[0x263F41B90] sharedPlatform];
    id v6 = createDeviceIdentifierInternalState();
    uint64_t v7 = [v5 osAndBuildVersion];
    double v8 = [v6 deviceIdentifier];
    [v8 setDeviceOsVersion:v7];

    uint64_t v9 = [v5 hardwareIdentifier];
    id v10 = [v6 deviceIdentifier];
    [v10 setDeviceHwIdentifier:v9];

    deviceIdentifierState = v2->_deviceIdentifierState;
    v2->_deviceIdentifierState = (GEOLogMsgState *)v6;

    uint64_t v12 = createDeviceIdentifierInternalState();
    deviceIdentifierInternalState = v2->_deviceIdentifierInternalState;
    v2->_deviceIdentifierInternalState = (GEOLogMsgState *)v12;

    id v14 = objc_alloc_init(MEMORY[0x263F41978]);
    [v14 setStateType:301];
    id v15 = objc_alloc_init(MEMORY[0x263F419A8]);
    [v14 setApplicationIdentifier:v15];

    uint64_t v16 = GEOApplicationIdentifierOrProcessName();
    uint64_t v17 = [v14 applicationIdentifier];
    [v17 setAppIdentifier:v16];

    uint64_t v18 = [MEMORY[0x263F41B90] sharedPlatform];
    LODWORD(v17) = [v18 isInternalInstall];

    if (v17)
    {
      uint64_t v19 = [MEMORY[0x263F08AB0] processInfo];
      int v20 = [v19 processName];
      long long v21 = [v14 applicationIdentifier];
      [v21 setProcessName:v20];
    }
    int v22 = [v14 applicationIdentifier];
    long long v23 = [v22 appIdentifier];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __createApplicationIdentifierState_block_invoke;
    v37[3] = &unk_2653454B8;
    id v24 = v14;
    id v38 = v24;
    +[GEOAPUtils appTypeForAppId:v23 resultBlock:v37];

    applicationIdentifierState = v2->_applicationIdentifierState;
    v2->_applicationIdentifierState = (GEOLogMsgState *)v24;

    uint64_t v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v2 selector:sel_deviceCountryChanged_ name:*MEMORY[0x263F41650] object:0];

    v27 = [MEMORY[0x263F41770] sharedConfiguration];
    uint64_t v28 = [v27 countryCode];
    countryCode = v2->_countryCode;
    v2->_countryCode = (NSString *)v28;

    offlineSearchODSVersion = v2->_offlineSearchODSVersion;
    v2->_offlineSearchODSVersion = 0;

    offlineDirectionsODSVersion = v2->_offlineDirectionsODSVersion;
    v2->_offlineDirectionsODSVersion = 0;

    id v32 = [NSString alloc];
    v33 = (void *)[v32 initWithUTF8String:*MEMORY[0x263F41690]];
    uint64_t v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v2 selector:sel_offlineDataActiceVersionChanged_ name:v33 object:0];

    [(GEOAPStateFactory *)v2 _updateOfflineVersionInfo];
  }
  return v2;
}

- (id)deviceIdentifierHardwareClass
{
  if (a1)
  {
    id v1 = (void *)[*(id *)(a1 + 16) copy];
    id v2 = [MEMORY[0x263F41B90] sharedPlatform];
    uint64_t v3 = [v2 hardwareClass];
    id v4 = [v1 deviceIdentifier];
    [v4 setDeviceHwIdentifier:v3];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (void)_updateOfflineVersionInfo
{
  uint64_t v3 = [MEMORY[0x263F41B58] sharedInstance];
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke;
  v5[3] = &unk_265345328;
  void v5[4] = self;
  [v3 getOfflineVersionMetadataWithCallbackQueue:isolationQueue callback:v5];
}

void __30__GEOAPStateFactory_placeCard__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasPlaceCardStateData] & 1) == 0
    && ![*(id *)(a1 + 32) hasPlaceCardState])
  {
    return;
  }
  id v2 = objc_alloc_init(MEMORY[0x263F41978]);
  [v2 setStateType:702];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(a1 + 32) hasPlaceCardState])
  {
    id v105 = [*(id *)(a1 + 32) placeCardState];
    id v5 = (void *)[v105 copy];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPlaceCard:v5];

LABEL_68:

    return;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F41A88]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPlaceCard:v6];

  if ([*(id *)(a1 + 32) placeCardPossibleActionsCount]
    && [*(id *)(a1 + 32) placeCardPossibleActionsCount])
  {
    unint64_t v7 = 0;
    do
    {
      double v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      objc_msgSend(v8, "addPossibleAction:", *(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "placeCardPossibleActions") + 4 * v7));

      ++v7;
    }
    while (v7 < [*(id *)(a1 + 32) placeCardPossibleActionsCount]);
  }
  if ([*(id *)(a1 + 32) placeCardUnactionableUiElementsCount]
    && [*(id *)(a1 + 32) placeCardUnactionableUiElementsCount])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      objc_msgSend(v10, "addUnactionableUiElement:", *(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "placeCardUnactionableUiElements") + 4 * v9));

      ++v9;
    }
    while (v9 < [*(id *)(a1 + 32) placeCardUnactionableUiElementsCount]);
  }
  if ([*(id *)(a1 + 32) hasPlaceCardPlaceCardType])
  {
    uint64_t v11 = [*(id *)(a1 + 32) placeCardPlaceCardType];
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v12 setPlacecardType:v11];
  }
  if ([*(id *)(a1 + 32) hasPlaceCardPlaceCardCategory])
  {
    uint64_t v13 = [*(id *)(a1 + 32) placeCardPlaceCardCategory];
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v14 setPlacecardCategory:v13];
  }
  if ([*(id *)(a1 + 32) hasPlaceCardTransitAdvisoryBanner])
  {
    uint64_t v15 = [*(id *)(a1 + 32) placeCardTransitAdvisoryBanner];
    uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v16 setTransitAdvisoryBanner:v15];
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails"))
  {
    id v17 = objc_alloc_init(MEMORY[0x263F41B70]);
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v18 setPlaceActionDetails:v17];

    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsActionUrl])
    {
      uint64_t v19 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsActionUrl];
      int v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      long long v21 = [v20 placeActionDetails];
      [v21 setActionUrl:v19];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsAnimationId])
    {
      uint64_t v22 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsAnimationId];
      long long v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      id v24 = [v23 placeActionDetails];
      [v24 setAnimationID:v22];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsBusinessId])
    {
      uint64_t v25 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsBusinessId];
      uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v27 = [v26 placeActionDetails];
      [v27 setBusinessID:v25];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsDestinationApp])
    {
      uint64_t v28 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsDestinationApp];
      uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v30 = [v29 placeActionDetails];
      [v30 setDestinationApp:v28];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsPhotoId])
    {
      id v31 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsPhotoId];
      id v32 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v33 = [v32 placeActionDetails];
      [v33 setPhotoId:v31];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsPlaceId])
    {
      uint64_t v34 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsPlaceId];
      v35 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      objc_super v36 = [v35 placeActionDetails];
      [v36 setPlaceID:v34];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsRichProviderId])
    {
      id v37 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsRichProviderId];
      id v38 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v39 = [v38 placeActionDetails];
      [v39 setRichProviderId:v37];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp])
    {
      [*(id *)(a1 + 32) placeCardPlaceActionDetailsSearchResponseRelativeTimestamp];
      double v41 = v40;
      v42 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v43 = [v42 placeActionDetails];
      [v43 setSearchResponseRelativeTimestamp:v41];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTargetId])
    {
      uint64_t v44 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTargetId];
      v45 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v46 = [v45 placeActionDetails];
      [v46 setTargetID:v44];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsLocalSearchProviderId])
    {
      uint64_t v47 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsLocalSearchProviderId];
      v48 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v49 = [v48 placeActionDetails];
      [v49 setLocalSearchProviderID:v47];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsResultIndex])
    {
      uint64_t v50 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsResultIndex];
      v51 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v52 = [v51 placeActionDetails];
      [v52 setResultIndex:v50];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsShowcaseId])
    {
      v53 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsShowcaseId];
      v54 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v55 = [v54 placeActionDetails];
      [v55 setShowcaseId:v53];
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails_TransitPlaceCard"))
  {
    v56 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    v57 = [v56 placeActionDetails];

    if (!v57)
    {
      id v58 = objc_alloc_init(MEMORY[0x263F41B70]);
      v59 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      [v59 setPlaceActionDetails:v58];
    }
    id v60 = objc_alloc_init(MEMORY[0x263F41C68]);
    v61 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    v62 = [v61 placeActionDetails];
    [v62 setTransitPlaceCard:v60];

    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType])
    {
      v63 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTransitPlaceCardIncidentType];
      v64 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v65 = [v64 placeActionDetails];
      v66 = [v65 transitPlaceCard];
      [v66 setIncidentType:v63];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName])
    {
      v67 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName];
      v68 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v69 = [v68 placeActionDetails];
      v70 = [v69 transitPlaceCard];
      [v70 setTransitSystemName:v67];
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence"))
  {
    v71 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    v72 = [v71 placeActionDetails];

    if (!v72)
    {
      id v73 = objc_alloc_init(MEMORY[0x263F41B70]);
      v74 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      [v74 setPlaceActionDetails:v73];
    }
    v75 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    v76 = [v75 placeActionDetails];
    v77 = [v76 transitPlaceCard];

    if (!v77)
    {
      id v78 = objc_alloc_init(MEMORY[0x263F41C68]);
      v79 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v80 = [v79 placeActionDetails];
      [v80 setTransitPlaceCard:v78];
    }
    id v81 = objc_alloc_init(MEMORY[0x263F41C60]);
    v82 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    v83 = [v82 placeActionDetails];
    v84 = [v83 transitPlaceCard];
    [v84 setTransitDepartureSequenceUsage:v81];

    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId])
    {
      uint64_t v85 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId];
      v86 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v87 = [v86 placeActionDetails];
      v88 = [v87 transitPlaceCard];
      v89 = [v88 transitDepartureSequenceUsage];
      [v89 setLineId:v85];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign])
    {
      v90 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign];
      v91 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v92 = [v91 placeActionDetails];
      v93 = [v92 transitPlaceCard];
      v94 = [v93 transitDepartureSequenceUsage];
      [v94 setHeadsign:v90];
    }
    if ([*(id *)(a1 + 32) hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection])
    {
      v95 = [*(id *)(a1 + 32) placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection];
      v96 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
      v97 = [v96 placeActionDetails];
      v98 = [v97 transitPlaceCard];
      v99 = [v98 transitDepartureSequenceUsage];
      [v99 setDirection:v95];
    }
  }
  if ([*(id *)(a1 + 32) hasPlaceCardIsPersonPlacecard])
  {
    uint64_t v100 = [*(id *)(a1 + 32) placeCardIsPersonPlacecard];
    v101 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v101 setIsPersonPlacecard:v100];
  }
  if ([*(id *)(a1 + 32) hasPlaceCardIsPersonAddressAvailable])
  {
    uint64_t v102 = [*(id *)(a1 + 32) placeCardIsPersonAddressAvailable];
    v103 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v103 setIsPersonAddressAvailable:v102];
  }
  if ([*(id *)(a1 + 32) hasPlaceCardIsPersonLocationShared])
  {
    uint64_t v104 = [*(id *)(a1 + 32) placeCardIsPersonLocationShared];
    id v105 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v105 setIsPersonLocationShared:v104];
    goto LABEL_68;
  }
}

void __36__GEOAPStateFactory_mapViewLocation__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasMapViewLocationPuckInViewport])
  {
    uint64_t v2 = [*(id *)(a1 + 32) mapViewLocationPuckInViewport];
    uint64_t v3 = [*(id *)(a1 + 40) mapViewLocation];
    [v3 setIsCurrentLocationInViewport:v2];
  }
  if ([*(id *)(a1 + 32) hasMapViewLocationIsTourist])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F41C50]);
    id v5 = [*(id *)(a1 + 40) mapViewLocation];
    [v5 setTouristInfo:v4];

    uint64_t v6 = [*(id *)(a1 + 32) mapViewLocationIsTourist];
    id v8 = [*(id *)(a1 + 40) mapViewLocation];
    unint64_t v7 = [v8 touristInfo];
    [v7 setIsTourist:v6];
  }
}

- (void)deviceCountryChanged:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:*MEMORY[0x263F41658]];
  if (v4) {
    [(GEOAPStateFactory *)self setCountryCode:v4];
  }
}

- (void)setCountryCode:(id)a3
{
}

- (id)mapLaunch
{
  if (a1)
  {
    uint64_t v2 = +[GEOAPSharedStateData sharedData];
    if ([v2 hasMapLaunchData])
    {
      id v3 = objc_alloc_init(MEMORY[0x263F41978]);
      [v3 setStateType:718];
      id v4 = objc_alloc_init(MEMORY[0x263F41A08]);
      [v3 setMapLaunch:v4];

      if ([v2 hasMapLaunchSourceAppId])
      {
        id v5 = [v2 mapLaunchSourceAppId];
        uint64_t v6 = [v3 mapLaunch];
        [v6 setSourceAppId:v5];
      }
      if ([v2 hasMapLaunchLaunchUri])
      {
        unint64_t v7 = [v2 mapLaunchLaunchUri];
        id v8 = [v3 mapLaunch];
        [v8 setLaunchUri:v7];
      }
      if ([v2 hasMapLaunchReferringWebsite])
      {
        unint64_t v9 = [v2 mapLaunchReferringWebsite];
        id v10 = [v3 mapLaunch];
        [v10 setReferringWebsite:v9];
      }
      if ([v2 hasMapLaunchIsHandoff])
      {
        uint64_t v11 = [v2 mapLaunchIsHandoff];
        uint64_t v12 = [v3 mapLaunch];
        [v12 setIsHandoff:v11];
      }
      if ([v2 hasMapLaunchSourceHandoffDevice])
      {
        uint64_t v13 = [v2 mapLaunchSourceHandoffDevice];
        id v14 = [v3 mapLaunch];
        [v14 setSourceHandoffDevice:v13];
      }
      if ([v2 hasMapLaunchAction])
      {
        uint64_t v15 = objc_msgSend(a1, "_launchActionFromAPLaunchAction:", objc_msgSend(v2, "mapLaunchAction"));
        uint64_t v16 = [MEMORY[0x263F41B90] sharedPlatform];
        int v17 = [v16 isInternalInstall];

        if (v17)
        {
          uint64_t v18 = [v3 mapLaunch];
          [v18 setLaunchActionInternal:v15];
        }
        uint64_t v19 = [a1 _privacyAllowedActionFromActualAction:v15];
        int v20 = [v3 mapLaunch];
        [v20 setLaunchAction:v19];
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke_2;
  v3[3] = &unk_265345300;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateLayerVersions:v3];
}

- (id)mapRestore
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasMapRestoreData])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:709];
      id v3 = objc_alloc_init(MEMORY[0x263F41A10]);
      [v2 setMapRestore:v3];

      id v4 = objc_alloc_init(MEMORY[0x263F41C20]);
      if ([v1 hasRestoreUiTarget]) {
        objc_msgSend(v4, "setUiTarget:", objc_msgSend(v1, "restoreUiTarget"));
      }
      if ([v1 hasRestoreLayoutStyle]) {
        objc_msgSend(v4, "setLayoutStyle:", objc_msgSend(v1, "restoreLayoutStyle"));
      }
      if ([v1 hasRestoreLayoutInfo]) {
        objc_msgSend(v4, "setLayoutInfo:", objc_msgSend(v1, "restoreLayoutInfo"));
      }
      id v5 = [v2 mapRestore];
      [v5 addTargetLayout:v4];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOAPStateFactory;
  [(GEOAPStateFactory *)&v4 dealloc];
}

uint64_t __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2 = result;
  if (a2 == 7)
  {
    *(void *)(*(void *)(v2 + 32) + 48) = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  }
  else
  {
    if (a2 != 2) {
      return result;
    }
    *(void *)(*(void *)(v2 + 32) + 56) = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  }
  return MEMORY[0x270F9A758]();
}

- (id)deviceIndentifierInternal
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)deviceConnection
{
  if (a1)
  {
    uint64_t v1 = -[GEOAPStateFactory deviceConnectionLimited](a1);
    uint64_t v2 = [v1 deviceConnection];
    [v2 setCellularDataState:4];

    id v3 = [v1 deviceConnection];
    [v3 setDeviceCarrierName:0];
  }
  else
  {
    uint64_t v1 = 0;
  }
  return v1;
}

- (id)deviceSettings_DailySettings
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:407];
    id v2 = objc_alloc_init(MEMORY[0x263F419D8]);
    [v1 setDeviceSettings:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    int v4 = [v3 hasDeviceInDarkMode];

    if (v4)
    {
      id v5 = +[GEOAPSharedStateData sharedData];
      uint64_t v6 = [v5 deviceInDarkMode];
      unint64_t v7 = [v1 deviceSettings];
      [v7 setDeviceDarkMode:v6];
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)deviceSettings_Long
{
  if (a1)
  {
    id v1 = -[GEOAPStateFactory deviceSettings_Min](a1);
    id v2 = +[GEONanoInfo sharedInfo];
    id v3 = +[GEOAPSharedStateData sharedData];
    int v4 = [v3 hasDeviceInDarkMode];

    if (v4)
    {
      id v5 = +[GEOAPSharedStateData sharedData];
      uint64_t v6 = [v5 deviceInDarkMode];
      unint64_t v7 = [v1 deviceSettings];
      [v7 setDeviceDarkMode:v6];
    }
    id v8 = [v2 hasPairedDeviceIfAvailable];
    unint64_t v9 = v8;
    if (v8 && [v8 BOOLValue])
    {
      id v10 = [v2 deviceIsAltAcctIfAvailable];
      uint64_t v11 = [v10 BOOLValue];
      uint64_t v12 = [v1 deviceSettings];
      [v12 setIsAltAccountPairedDevice:v11];
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)pairedDeviceLong
{
  if (a1)
  {
    id v1 = +[GEONanoInfo sharedInfo];
    id v2 = [v1 hasPairedDeviceIfAvailable];
    id v3 = v2;
    if (v2 && [v2 BOOLValue])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F41978]);
      [v4 setStateType:405];
      id v5 = objc_alloc_init(MEMORY[0x263F41A80]);
      [v4 setPairedDevice:v5];

      uint64_t v6 = [v4 pairedDevice];
      [v6 setType:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)extension
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:406];
    id v2 = objc_alloc_init(MEMORY[0x263F419F0]);
    [v1 setExtension:v2];

    id v3 = +[GEOAPSharedStateData sharedData];
    if ([v3 hasTableBookingAppInstalled])
    {
      uint64_t v4 = [v3 tableBookingAppInstalled];
      id v5 = [v1 extension];
      [v5 setHasTableBookingAppInstalled:v4];

      if ([v3 hasTableBookingAppEnabled])
      {
        uint64_t v6 = [v3 tableBookingAppEnabled];
        unint64_t v7 = [v1 extension];
        [v7 setHasTableBookingAppEnabled:v6];
      }
    }
    if ([v3 hasRideBookingAppInstalled])
    {
      uint64_t v8 = [v3 rideBookingAppInstalled];
      unint64_t v9 = [v1 extension];
      [v9 setHasRideBookingAppInstalled:v8];

      if ([v3 hasRideBookingAppEnabled])
      {
        uint64_t v10 = [v3 rideBookingAppEnabled];
        uint64_t v11 = [v1 extension];
        [v11 setHasRideBookingAppEnabled:v10];
      }
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)mapSettingsDetailed
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:504];
    id v2 = +[GEOAPSharedStateData sharedData];
    id v3 = [v2 stateMapSettings];
    [v1 setMapSettings:v3];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)mapSettings
{
  if (a1)
  {
    id v1 = -[GEOAPStateFactory mapSettingsDetailed](a1);
    id v2 = [v1 mapSettings];
    [v2 setHasWalkingAvoidHills:0];

    id v3 = [v1 mapSettings];
    [v3 setHasWalkingAvoidBusyRoads:0];

    uint64_t v4 = [v1 mapSettings];
    [v4 setHasWalkingAvoidStairs:0];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)searchResults
{
  id v2 = objc_alloc_init(MEMORY[0x263F41978]);
  [v2 setStateType:8];
  id v3 = +[GEOAPSharedStateData sharedData];
  uint64_t v4 = [v3 searchResultsState];
  [v2 setSearchResults:v4];

  return v2;
}

- (id)mapsPlaceIds
{
  id v2 = objc_alloc_init(MEMORY[0x263F41978]);
  [v2 setStateType:729];
  id v3 = +[GEOAPSharedStateData sharedData];
  uint64_t v4 = [v3 mapsPlaceIdsState];
  [v2 setMapsPlaceIds:v4];

  return v2;
}

- (id)impressionObject
{
  id v2 = objc_alloc_init(MEMORY[0x263F41978]);
  [v2 setStateType:10];
  id v3 = +[GEOAPSharedStateData sharedData];
  uint64_t v4 = [v3 stateImpressionObject];
  [v2 setImpressionObject:v4];

  return v2;
}

- (id)placeCardReveal
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  -[GEOAPStateFactory placeCard]((uint64_t)self);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[GEOAPSharedStateData sharedData];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__GEOAPStateFactory_placeCardReveal__block_invoke;
  v6[3] = &unk_265345378;
  id v3 = v2;
  id v7 = v3;
  uint64_t v8 = &v9;
  [v3 performPlaceCardStateUpdate:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __36__GEOAPStateFactory_placeCardReveal__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placeCardRevealedPlaceCardModules];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v4 = objc_alloc_init(MEMORY[0x263F41978]);
      [v4 setStateType:702];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    id v9 = [*(id *)(a1 + 32) placeCardRevealedPlaceCardModules];
    id v7 = (void *)[v9 copy];
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) placeCard];
    [v8 setRevealedModules:v7];
  }
}

- (id)placeCardRap
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v3 = +[GEOAPSharedStateData sharedData];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__GEOAPStateFactory_placeCardRap__block_invoke;
  v7[3] = &unk_2653453A0;
  id v4 = v3;
  id v9 = self;
  uint64_t v10 = &v11;
  id v8 = v4;
  [v4 performPlaceCardStateUpdate:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __33__GEOAPStateFactory_placeCardRap__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasPlaceCardStateData] & 1) != 0
    || [*(id *)(a1 + 32) hasPlaceCardState])
  {
    id v2 = objc_alloc_init(MEMORY[0x263F41978]);
    [v2 setStateType:702];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = objc_alloc_init(MEMORY[0x263F41A88]);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPlaceCard:v5];

    if ([*(id *)(a1 + 32) hasPlaceCardState])
    {
      uint64_t v6 = [*(id *)(a1 + 32) placeCardState];
      int v7 = [v6 hasPlacecardType];

      if (v7)
      {
        id v8 = *(void **)(a1 + 40);
        id v11 = [*(id *)(a1 + 32) placeCardState];
        uint64_t v9 = objc_msgSend(v8, "_rapPlaceCardTypeForRawType:", objc_msgSend(v11, "placecardType"));
        uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) placeCard];
        [v10 setPlacecardType:v9];
      }
    }
  }
}

- (int)_rapPlaceCardTypeForRawType:(int)a3
{
  if ((a3 - 1) > 0x10) {
    return 0;
  }
  else {
    return dword_24FEFA4E8[a3 - 1];
  }
}

- (id)tapEvent
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasTapEventState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:11];
      uint64_t v3 = [v1 tapEventState];
      [v2 setTapEvent:v3];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)actionButtonDetails
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    id v2 = [v1 actionButtonDetailsState];
    if (v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x263F41978]);
      [v3 setStateType:12];
      [v3 setActionButtonDetails:v2];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)tileSet
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:706];
    id v2 = objc_alloc_init(MEMORY[0x263F41AD8]);
    [v1 setTileSet:v2];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)lookAroundSummary
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasLookaroundSessionStartTime]
      && [v1 hasLookaroundSessionEndTime])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:714];
      id v3 = objc_alloc_init(MEMORY[0x263F41AC8]);
      [v2 setSummaryLookAroundLog:v3];

      [v1 lookaroundSessionEndTime];
      double v5 = v4;
      [v1 lookaroundSessionStartTime];
      uint64_t v7 = (v5 - v6);
      if (v7 <= 0x257)
      {
        if (v7 < 0xB4)
        {
          if (v7 >= 0x3C) {
            uint64_t v7 = (v5 - v6) - (v5 - v6) % 0xAu;
          }
        }
        else
        {
          uint64_t v7 = 60 * vcvtps_u32_f32((float)v7 / 60.0);
        }
      }
      else
      {
        uint64_t v7 = 600;
      }
      id v8 = [v2 summaryLookAroundLog];
      [v8 setDurationSec:v7];

      uint64_t v9 = [v1 lookaroundSessionHadPanAction];
      uint64_t v10 = [v2 summaryLookAroundLog];
      [v10 setHadPanActions:v9];

      uint64_t v11 = [v1 lookaroundSessionHadMoveAction];
      uint64_t v12 = [v2 summaryLookAroundLog];
      [v12 setHadMoveActions:v11];

      uint64_t v13 = [v1 lookaroundSessionHadZoomAction];
      id v14 = [v2 summaryLookAroundLog];
      [v14 setHadZoomActions:v13];

      uint64_t v15 = [v1 lookaroundSessionHadTapPoiAction];
      id v16 = [v2 summaryLookAroundLog];
      [v16 setHadPoiTapActions:v15];

      uint64_t v17 = [v1 lookaroundSessionHadShareAction];
      uint64_t v18 = [v2 summaryLookAroundLog];
      [v18 setHadShareActions:v17];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)lookAroundView
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasLookAroundLocation])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:716];
      id v3 = objc_alloc_init(MEMORY[0x263F41A00]);
      [v2 setLookAroundView:v3];

      double v4 = [v1 lookAroundLocation];
      double v5 = [v2 lookAroundView];
      [v5 setLocation:v4];

      uint64_t v6 = [v1 lookAroundHeading];
      uint64_t v7 = [v2 lookAroundView];
      [v7 setHeading:v6];

      [v1 lookAroundZoom];
      double v9 = v8;
      uint64_t v10 = [v2 lookAroundView];
      [v10 setZoomLevel:v9];

      uint64_t v11 = [v1 lookAroundNumberPoisInView];
      uint64_t v12 = [v2 lookAroundView];
      [v12 setNumberPoisInView:v11];

      uint64_t v13 = [v1 lookAroundIsLabelingShown];
      id v14 = [v2 lookAroundView];
      [v14 setIsLabelingShown:v13];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)muninResourceLog
{
  if (a1)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F41978]);
    [v1 setStateType:717];
    id v2 = objc_alloc_init(MEMORY[0x263F41A68]);
    [v1 setMuninResource:v2];
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)curatedCollection
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasCuratedCollectionState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:719];
      id v3 = [v1 curatedCollectionState];
      double v4 = (void *)[v3 copy];
      [v2 setCuratedCollection:v4];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)curatedCollectionRedacted
{
  id v2 = +[GEOAPSharedStateData sharedData];
  if ([v2 hasCuratedCollectionState])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F41978]);
    [v3 setStateType:719];
    double v4 = [v2 curatedCollectionState];
    double v5 = (void *)[v4 copy];
    [v3 setCuratedCollection:v5];

    uint64_t v6 = [v3 curatedCollection];
    uint64_t v7 = [v6 collectionDetails];
    [v7 clearCollectionIds];

    double v8 = [v3 curatedCollection];
    double v9 = [v8 publisherDetails];
    [v9 clearPublisherIds];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)ugc
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasUgcPhotoState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:720];
      id v3 = [v1 ugcPhotoState];
      double v4 = (void *)[v3 copy];
      [v2 setUgcPhoto:v4];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (int)_privacyAllowedActionFromActualAction:(int)a3
{
  if ((a3 - 2) > 0x23) {
    return 0;
  }
  else {
    return dword_24FEFA52C[a3 - 2];
  }
}

- (int)_launchActionFromAPLaunchAction:(int)a3
{
  if ((a3 - 1) >= 0x28) {
    return 0;
  }
  else {
    return a3;
  }
}

- (double)_monthResolution:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  double v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v7 = [v5 components:12 fromDate:v6];
  double v8 = [v5 dateFromComponents:v7];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return v10;
}

- (id)photoSubmissionDetails
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasPhotoSubmissionDetailsState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:726];
      id v3 = [v1 photoSubmissionDetailsState];
      [v2 setArpPhotoSubmission:v3];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)ratingSubmissionDetails
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasRatingSubmissionDetailsState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:727];
      id v3 = [v1 ratingSubmissionDetailsState];
      [v2 setArpRatingSubmission:v3];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)ratingPhotoSubmissionDetails
{
  if (a1)
  {
    id v1 = +[GEOAPSharedStateData sharedData];
    if ([v1 hasRatingPhotoSubmissionDetailsState])
    {
      id v2 = objc_alloc_init(MEMORY[0x263F41978]);
      [v2 setStateType:728];
      id v3 = [v1 ratingPhotoSubmissionDetailsState];
      [v2 setArpRatingPhotoSubmission:v3];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  id v14 = [*(id *)(a1 + 32) userSession];
  objc_msgSend(v14, "setSessionId:", a2, a3);

  uint64_t v15 = [*(id *)(a1 + 32) userSession];
  [v15 setRelativeTimestamp:a7];

  id v16 = [*(id *)(a1 + 32) userSession];
  [v16 setSequenceNumber:a4];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F417C0]) initWithCFAbsoluteTime:a5];
  uint64_t v18 = [*(id *)(a1 + 32) userSession];
  [v18 setEventTime:v17];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a6;
}

- (void)sessionStateForType:(int)a3 onQueue:(id)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  GEOApplicationIdentifierOrProcessName();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOAPStateFactory *)self sessionStateForType:v6 sessionAppId:v10 onQueue:v9 callback:v8];
}

- (void)sessionStateForType:(int)a3 sessionAppId:(id)a4 onQueue:(id)a5 callback:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
  if ((a3 - 3) > 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_fault_impl(&dword_24FE56000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Assertion failed: __objc_no", v15, 2u);
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F41C70] sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__GEOAPStateFactory_sessionStateForType_sessionAppId_onQueue_callback___block_invoke;
    v16[3] = &unk_265345490;
    id v17 = v13;
    id v18 = v12;
    [v14 longSessionValuesForAppId:v10 completionQueue:v11 completion:v16];
  }
}

uint64_t __71__GEOAPStateFactory_sessionStateForType_sessionAppId_onQueue_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = [*(id *)(a1 + 32) userSession];
  objc_msgSend(v13, "setSessionId:", a2, a3);

  id v14 = (void *)[objc_alloc(MEMORY[0x263F417C0]) initWithCFAbsoluteTime:a4];
  uint64_t v15 = [*(id *)(a1 + 32) userSession];
  [v15 setEventTime:v14];

  id v16 = [*(id *)(a1 + 32) userSession];
  [v16 setRelativeTimestamp:floor(a6 / 300.0) * 300.0];

  id v17 = [*(id *)(a1 + 32) userSession];
  [v17 setAgeOfSessionIdInSeconds:floor(a7)];

  id v18 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v18();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDirectionsODSVersion, 0);
  objc_storeStrong((id *)&self->_offlineSearchODSVersion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_applicationIdentifierState, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierInternalState, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierState, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end