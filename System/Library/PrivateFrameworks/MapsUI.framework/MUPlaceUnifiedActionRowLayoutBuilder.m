@interface MUPlaceUnifiedActionRowLayoutBuilder
- (MUPlaceUnifiedActionRowLayoutBuilder)initWithConfiguration:(id)a3 delegate:(id)a4;
- (MUPlaceUnifiedActionRowLayoutBuilderDelegate)delegate;
- (MUPlaceUnifiedActionRowSectionControllerConfiguration)configuration;
- (id)_actionItemViewModelWithPlaceActionItem:(id)a3;
- (id)_buildSARLayout;
- (id)_buildServerControlledLayoutWithConfiguration:(id)a3;
- (id)_buildStaticLayout;
- (id)_contactActionRowViewModel;
- (id)_directionsViewModel;
- (id)_moreActionsViewModelWithGroupedButton:(id)a3 excludedSystemActionsTypes:(id)a4;
- (id)_moreActionsViewModelWithPartnerActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5;
- (id)_partnerActionViewModelWithPartnerActionIndex:(unint64_t)a3;
- (id)buildButtonLayout;
- (id)downloadOfflineViewModel;
- (void)setConfiguration:(id)a3;
@end

@implementation MUPlaceUnifiedActionRowLayoutBuilder

- (MUPlaceUnifiedActionRowLayoutBuilder)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceUnifiedActionRowLayoutBuilder;
  v9 = [(MUPlaceUnifiedActionRowLayoutBuilder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)buildButtonLayout
{
  v3 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  int v4 = [v3 isSearchAlongRoute];

  if (v4)
  {
    uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _buildSARLayout];
  }
  else
  {
    v6 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    id v7 = [v6 buttonModuleConfiguration];

    if (v7)
    {
      id v8 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
      v9 = [v8 buttonModuleConfiguration];
      v10 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _buildServerControlledLayoutWithConfiguration:v9];

      goto LABEL_7;
    }
    uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _buildStaticLayout];
  }
  v10 = (void *)v5;
LABEL_7:
  return v10;
}

- (id)_buildStaticLayout
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  int v4 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _directionsViewModel];
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v4);

  if (!GEOSupportsOfflineMaps()) {
    goto LABEL_7;
  }
  uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  int v6 = [v5 canShowDownloadOffline];
  if (!v6)
  {
LABEL_6:

    goto LABEL_8;
  }
  id v7 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
  id v8 = [v7 mapItem];
  v9 = [v8 _geoMapItem];
  int v10 = [v9 supportsOfflineMaps];

  if (v10)
  {
    v11 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    int v12 = [v11 shouldPromoteDownloadOffline];

    if (v12)
    {
      uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self downloadOfflineViewModel];
      objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v5);
      goto LABEL_6;
    }
    int v6 = 1;
  }
  else
  {
LABEL_7:
    int v6 = 0;
  }
LABEL_8:
  v13 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  v14 = [v13 secondaryActionButtonController];

  if (v14)
  {
    v15 = [MUPlaceActionControlledItemViewModel alloc];
    v16 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    v17 = [v16 secondaryActionButtonController];
    v18 = [(MUPlaceActionControlledItemViewModel *)v15 initWithPlaceActionController:v17];
    objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v18);
  }
  v19 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  int v20 = [v19 shouldShowContactsAction];

  if (v20)
  {
    v21 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _contactActionRowViewModel];
    objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v21);
  }
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1EE405138];
  if (v6)
  {
    v23 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    char v24 = [v23 shouldPromoteDownloadOffline];

    if ((v24 & 1) == 0) {
      [v22 addObjectsFromArray:&unk_1EE405150];
    }
  }
  v25 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
  v26 = [v25 mapItem];
  v27 = [v26 _geoMapItem];
  v28 = [v27 _externalActionLinks];
  v29 = (void *)[v22 copy];
  v30 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _moreActionsViewModelWithPartnerActions:v28 promotedSystemActionTypes:v29 excludedSystemActionTypes:MEMORY[0x1E4F1CBF0]];
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v30);

  v31 = (void *)[v3 copy];
  return v31;
}

- (id)_buildSARLayout
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  int v4 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _directionsViewModel];
  objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v4);

  uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  int v6 = [v5 actionManager];
  id v7 = [v6 createSearchAlongRouteActions];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = -[MUPlaceUnifiedActionRowLayoutBuilder _actionItemViewModelWithPlaceActionItem:](self, "_actionItemViewModelWithPlaceActionItem:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        objc_msgSend(v3, "_mapsui_addObjectIfNotNil:", v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)_buildServerControlledLayoutWithConfiguration:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v29 = v4;
  id obj = [v4 buttonItems];
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (2)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      switch([v10 buttonType])
      {
        case 1u:
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
        case 9u:
        case 0xBu:
        case 0xCu:
        case 0xDu:
        case 0xEu:
          int v12 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
          v13 = [v12 actionManager];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v15 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
            long long v16 = [v15 actionManager];
            long long v17 = [v16 actionItemForButtonItem:v10];

            long long v18 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _actionItemViewModelWithPlaceActionItem:v17];
            long long v19 = NSNumber;
            int v20 = [v17 resolvedActionItem];
            uint64_t v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "type"));
            [v11 addObject:v21];

            goto LABEL_9;
          }
          goto LABEL_11;
        case 7u:
          id v23 = v10;
          int v24 = [v23 groupType];
          if (v24 == 1)
          {
            uint64_t v25 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _moreActionsViewModelWithGroupedButton:v23 excludedSystemActionsTypes:v11];
          }
          else
          {
            if (v24 != 2)
            {
              long long v18 = 0;
              goto LABEL_22;
            }
            uint64_t v25 = -[MUPlaceUnifiedActionRowLayoutBuilder _partnerActionViewModelWithPartnerActionIndex:](self, "_partnerActionViewModelWithPartnerActionIndex:", [v23 actionDataIndex]);
          }
          long long v18 = (void *)v25;
LABEL_22:

          goto LABEL_9;
        case 8u:
          uint64_t v22 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _directionsViewModel];
          goto LABEL_15;
        case 0xAu:
          uint64_t v22 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self downloadOfflineViewModel];
LABEL_15:
          long long v18 = (void *)v22;
LABEL_9:
          if (v18)
          {
            [v5 addObject:v18];
          }
          goto LABEL_11;
        default:
LABEL_11:

          if (v7 != ++v9) {
            continue;
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          uint64_t v7 = v26;
          if (!v26) {
            goto LABEL_24;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_24:

  v27 = (void *)[v5 copy];
  return v27;
}

- (id)_directionsViewModel
{
  v3 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  uint64_t v4 = [v3 primaryButtonType];

  if ((unint64_t)(v4 - 1) > 1)
  {
    if (v4 == 4)
    {
      uint64_t v9 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
      int v10 = [v9 isSearchAlongRoute];

      id v11 = [MUPlaceAddStopActionRowItemViewModel alloc];
      int v12 = v11;
      if (v10)
      {
        v13 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
        v14 = [v13 etaProvider];
        v15 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
        long long v16 = [v15 mapItem];
        long long v17 = [v16 _detourInfo];
        long long v18 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
        uint64_t v8 = -[MUPlaceAddStopActionRowItemViewModel initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:](v12, "initWithSearchAlongRoute:ETAProvider:detourInfo:canShowDetourTime:", 1, v14, v17, [v18 canShowDetourTime]);
      }
      else
      {
        uint64_t v8 = [(MUPlaceAddStopActionRowItemViewModel *)v11 initWithSearchAlongRoute:0 ETAProvider:0 detourInfo:0 canShowDetourTime:0];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v5 = [MUDirectionsActionRowItemViewModel alloc];
    uint64_t v6 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    uint64_t v7 = [v6 etaProvider];
    uint64_t v8 = [(MUDirectionsActionRowItemViewModel *)v5 initWithETAProvider:v7];
  }
  return v8;
}

- (id)downloadOfflineViewModel
{
  if (GEOSupportsOfflineMaps()
    && ([(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 canShowDownloadOffline],
        v3,
        v4))
  {
    uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
      uint64_t v8 = [v7 offlineMapProvider];
    }
    else
    {
      uint64_t v8 = 0;
    }
    offlineViewModel = self->_offlineViewModel;
    if (!offlineViewModel
      || ([(MUDownloadOfflineActionRowItemViewModel *)offlineViewModel offlineMapProvider],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v8 != v11))
    {
      int v12 = [[MUDownloadOfflineActionRowItemViewModel alloc] initWithOfflineMapProvider:v8];
      v13 = self->_offlineViewModel;
      self->_offlineViewModel = v12;
    }
    uint64_t v9 = self->_offlineViewModel;
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_contactActionRowViewModel
{
  if (MapsFeature_IsEnabled_MapsWally()
    && ([(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 shouldShowContactsAction],
        v3,
        v4))
  {
    uint64_t v5 = objc_alloc_init(MUViewContactActionRowItemViewModel);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_partnerActionViewModelWithPartnerActionIndex:(unint64_t)a3
{
  uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
    uint64_t v8 = [v7 analyticsHandler];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
  int v10 = [v9 mapItem];
  id v11 = [v10 _geoMapItem];
  int v12 = [v11 _externalActionLinks];

  if ([v12 count] <= a3)
  {
    uint64_t v21 = 0;
  }
  else
  {
    id v23 = [MUPlaceExternalActionViewModel alloc];
    v13 = [v12 objectAtIndexedSubscript:a3];
    v14 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    v15 = [v14 amsResultProvider];
    long long v16 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    long long v17 = [v16 artworkCache];
    long long v18 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    [v18 externalActionHandler];
    int v20 = v19 = v8;
    uint64_t v21 = [(MUPlaceExternalActionViewModel *)v23 initWithExternalAction:v13 amsResultProvider:v15 iconCache:v17 actionHandler:v20 analyticsHandler:v19];

    uint64_t v8 = v19;
  }

  return v21;
}

- (id)_actionItemViewModelWithPlaceActionItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
      uint64_t v8 = [v7 menuProvider];
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [[MUPlaceActionRowItemViewModel alloc] initWithActionRowItem:v4 menuProvider:v8 style:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_moreActionsViewModelWithGroupedButton:(id)a3 excludedSystemActionsTypes:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v32 = v5;
  id obj = [v5 buttonItems];
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    int v10 = self;
    long long v34 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        unsigned int v13 = [v12 buttonType];
        if (v13 <= 0xE)
        {
          if (((1 << v13) & 0x7F7E) != 0)
          {
            v14 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
            v15 = [v14 actionManager];
            id v16 = [v15 actionItemForButtonItem:v12];

            if ([v12 buttonType] == 13
              || [v12 buttonType] == 14)
            {
              long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
              [v6 addObject:v17];
            }
            long long v18 = NSNumber;
            long long v19 = [v16 resolvedActionItem];
            int v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "type"));
            [v6 addObject:v20];
LABEL_12:

            self = v10;
            goto LABEL_13;
          }
          if (v13 == 7)
          {
            id v16 = v12;
            if ([v16 groupType] == 2)
            {
              unint64_t v37 = [v16 actionDataIndex];
              uint64_t v21 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
              uint64_t v22 = [v21 mapItem];
              id v23 = [v22 _geoMapItem];
              int v24 = [v23 _externalActionLinks];
              unint64_t v35 = [v24 count];

              if (v37 < v35)
              {
                long long v19 = [(MUPlaceUnifiedActionRowLayoutBuilder *)v34 delegate];
                int v20 = [v19 mapItem];
                uint64_t v36 = [v20 _geoMapItem];
                uint64_t v25 = [v36 _externalActionLinks];
                uint64_t v26 = [v25 objectAtIndexedSubscript:v37];
                [v33 addObject:v26];

                goto LABEL_12;
              }
              self = v34;
            }
LABEL_13:
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v27 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v8 = v27;
    }
    while (v27);
  }

  v28 = (void *)[v33 copy];
  v29 = (void *)[v6 copy];
  v30 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self _moreActionsViewModelWithPartnerActions:v28 promotedSystemActionTypes:v29 excludedSystemActionTypes:MEMORY[0x1E4F1CBF0]];

  return v30;
}

- (id)_moreActionsViewModelWithPartnerActions:(id)a3 promotedSystemActionTypes:(id)a4 excludedSystemActionTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
  int v12 = [v11 showMoreButtonIfAvailable];

  if (v12)
  {
    uint64_t v32 = [v10 arrayByAddingObjectsFromArray:&unk_1EE405168];

    unsigned int v13 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self delegate];
      uint64_t v16 = [v15 analyticsHandler];
    }
    else
    {
      uint64_t v16 = 0;
    }
    v29 = (void *)v16;
    id v33 = v8;
    long long v18 = [MUPlaceMoreActionsViewModel alloc];
    long long v31 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    long long v19 = [v31 moreActionsProvider];
    v30 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    int v20 = [v30 amsResultProvider];
    [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    v22 = id v21 = v9;
    id v23 = [v22 artworkCache];
    int v24 = [(MUPlaceUnifiedActionRowLayoutBuilder *)self configuration];
    uint64_t v25 = [v24 externalActionHandler];
    uint64_t v28 = v16;
    uint64_t v26 = v18;
    id v10 = (id)v32;
    id v8 = v33;
    long long v17 = [(MUPlaceMoreActionsViewModel *)v26 initWithGroupedExternalActions:v33 promotedSystemActionTypes:v21 excludedSystemActionTypes:v32 menuActionProvider:v19 amsResultProvider:v20 iconCache:v23 externalActionHandler:v25 analyticsHandler:v28];

    id v9 = v21;
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (MUPlaceUnifiedActionRowLayoutBuilderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceUnifiedActionRowLayoutBuilderDelegate *)WeakRetained;
}

- (MUPlaceUnifiedActionRowSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offlineViewModel, 0);
}

@end