@interface MUPlaceHeaderButtonsSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPlaceHeaderButtonsSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4;
- (MUPlaceHeaderButtonsSectionControllerDelegate)headerDelegate;
- (NSArray)sectionViews;
- (UIView)sectionView;
- (_MKPlaceActionButtonController)alternatePrimaryButtonController;
- (_MKPlaceActionButtonController)secondaryButtonController;
- (_MKPlaceItem)placeItem;
- (id)analyticsModule;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (int)analyticsModuleType;
- (unint64_t)primaryButtonType;
- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5;
- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3;
- (void)headerButtonsSectionControllerWillPresentMenu:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAlternatePrimaryButtonController:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setHeaderDelegate:(id)a3;
- (void)setPlaceItem:(id)a3;
- (void)setPrimaryButtonType:(unint64_t)a3;
- (void)setSecondaryButtonController:(id)a3;
@end

@implementation MUPlaceHeaderButtonsSectionController

- (MUPlaceHeaderButtonsSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mapItem];
  v28.receiver = self;
  v28.super_class = (Class)MUPlaceHeaderButtonsSectionController;
  v10 = [(MUPlaceSectionController *)&v28 initWithMapItem:v9];

  if (!v10) {
    goto LABEL_17;
  }
  v11 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderButtonsSectionControllerInit", "", v27, 2u);
  }

  p_placeItem = (id *)&v10->_placeItem;
  objc_storeStrong((id *)&v10->_placeItem, a3);
  p_configuration = (id *)&v10->_configuration;
  objc_storeStrong((id *)&v10->_configuration, a4);
  v14 = objc_alloc_init(MUHeaderButtonsViewConfiguration);
  [(MUHeaderButtonsViewConfiguration *)v14 setShowMoreButton:[(MUPlaceHeaderButtonsSectionControllerConfiguration *)v10->_configuration showMoreButton]];
  if ([(MUPlaceHeaderButtonsSectionControllerConfiguration *)v10->_configuration canShowDetourTime])
  {
    v15 = [*p_placeItem mapItem];
    v16 = [v15 _detourInfo];
    [v16 detourTime];
    -[MUHeaderButtonsViewConfiguration setDetourTime:](v14, "setDetourTime:");
  }
  else
  {
    [(MUHeaderButtonsViewConfiguration *)v14 setDetourTime:0.0];
  }
  v17 = [*p_configuration menuProvider];
  [(MUHeaderButtonsViewConfiguration *)v14 setMenuProvider:v17];

  v18 = [*p_placeItem mapItem];
  char v19 = [v18 _hasFlyover];

  if (v19)
  {
    v20 = &unk_1EE4051E0;
LABEL_13:
    [(MUHeaderButtonsViewConfiguration *)v14 setPossibleAnalyticActions:v20];
    goto LABEL_14;
  }
  if ([*p_placeItem options])
  {
    v20 = &unk_1EE4051F8;
    goto LABEL_13;
  }
  if (([*p_placeItem options] & 2) != 0)
  {
    v20 = &unk_1EE405210;
    goto LABEL_13;
  }
LABEL_14:
  v21 = [MUHeaderButtonsSectionController alloc];
  v22 = [*p_configuration etaProvider];
  uint64_t v23 = [(MUHeaderButtonsSectionController *)v21 initWithETAProvider:v22 headerButtonsConfiguration:v14];
  headerSectionController = v10->_headerSectionController;
  v10->_headerSectionController = (MUHeaderButtonsSectionController *)v23;

  [(MUHeaderButtonsSectionController *)v10->_headerSectionController setDelegate:v10];
  v25 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderButtonsSectionControllerInit", "", v27, 2u);
  }

LABEL_17:
  return v10;
}

- (UIView)sectionView
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController sectionView];
}

- (NSArray)sectionViews
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController sectionViews];
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = [(MUPlaceHeaderButtonsSectionControllerConfiguration *)self->_configuration buttonModuleConfiguration];
    int v5 = [v4 shouldSuppressDirections];

    if (v5)
    {
      v6 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: The module configuration requests suppressing directions, so overriding primary button type to None", v7, 2u);
      }

      a3 = 0;
    }
    else
    {
      a3 = 1;
    }
  }
  [(MUHeaderButtonsSectionController *)self->_headerSectionController setPrimaryButtonType:a3];
}

- (unint64_t)primaryButtonType
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController primaryButtonType];
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController secondaryButtonController];
}

- (void)setSecondaryButtonController:(id)a3
{
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController alternatePrimaryButtonController];
}

- (void)setPlaceItem:(id)a3
{
  int v5 = (_MKPlaceItem *)a3;
  p_placeItem = &self->_placeItem;
  if (self->_placeItem != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_placeItem, a3);
    p_placeItem = (_MKPlaceItem **)[(MUHeaderButtonsSectionController *)self->_headerSectionController setPrimaryButtonType:0];
    int v5 = v7;
  }
  MEMORY[0x1F41817F8](p_placeItem, v5);
}

- (BOOL)hasContent
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController hasContent];
}

- (void)setActive:(BOOL)a3
{
}

- (BOOL)isActive
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController isActive];
}

- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3
{
  id v4 = [(MUPlaceSectionController *)self delegate];
  [v4 placeSectionControllerDidUpdateContent:self];
}

- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  id v7 = a5;
  id v8 = [(MUPlaceHeaderButtonsSectionController *)self headerDelegate];
  [v8 placeHeaderButtonsSectionController:self didSelectPrimaryType:a4 withPresentationOptions:v7];
}

- (void)headerButtonsSectionControllerWillPresentMenu:(id)a3
{
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController analyticsDelegate];
}

- (id)infoCardChildPossibleActions
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController infoCardChildPossibleActions];
}

- (id)infoCardChildUnactionableUIElements
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController infoCardChildUnactionableUIElements];
}

- (id)analyticsModule
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController analyticsModule];
}

- (int)analyticsModuleType
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController analyticsModuleType];
}

- (BOOL)isImpressionable
{
  return 1;
}

- (id)revealedAnalyticsModule
{
  return [(MUHeaderButtonsSectionController *)self->_headerSectionController revealedAnalyticsModule];
}

- (MUPlaceHeaderButtonsSectionControllerDelegate)headerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);
  return (MUPlaceHeaderButtonsSectionControllerDelegate *)WeakRetained;
}

- (void)setHeaderDelegate:(id)a3
{
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_headerSectionController, 0);
}

@end