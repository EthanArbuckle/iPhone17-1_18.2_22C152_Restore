@interface TamaleMapsUIHelper
+ (id)sharedHelper;
- (MKMapItem)mapItem;
- (TamaleMapsUIHelper)init;
- (id)buildButtonLayout;
- (void)performActionFromPlaceActionRowItemViewModel:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation TamaleMapsUIHelper

+ (id)sharedHelper
{
  if (qword_10052EF10 != -1) {
    dispatch_once(&qword_10052EF10, &stru_1004E4590);
  }
  v2 = (void *)qword_10052EF18;

  return v2;
}

- (TamaleMapsUIHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)TamaleMapsUIHelper;
  v2 = [(TamaleMapsUIHelper *)&v6 init];
  if (v2)
  {
    v3 = (MUPlaceViewController *)[objc_alloc((Class)MUPlaceViewController) initWithMapItem:0];
    placeCardVC = v2->_placeCardVC;
    v2->_placeCardVC = v3;
  }
  return v2;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
  id v5 = a3;
  [(MUPlaceViewController *)self->_placeCardVC setMapItem:self->_mapItem];
  objc_super v6 = [(MKMapItem *)self->_mapItem _placecardLayout];
  v7 = [v6 modules];
  sub_100007544(v7, &stru_1004E45D0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [v12 configuration];
  v9 = [v8 unifiedActionConfig];

  v10 = [(MUPlaceViewController *)self->_placeCardVC unifiedActionRowConfigurationWithButtonModuleConfiguration:v9];
  configuration = self->_configuration;
  self->_configuration = v10;
}

- (id)buildButtonLayout
{
  id v2 = [objc_alloc((Class)MUPlaceUnifiedActionRowLayoutBuilder) initWithConfiguration:self->_configuration delegate:self];
  v3 = [v2 buildButtonLayout];

  return v3;
}

- (void)performActionFromPlaceActionRowItemViewModel:(id)a3
{
  configuration = self->_configuration;
  id v4 = a3;
  id v7 = [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)configuration actionManager];
  id v5 = [v4 actionRowItem];

  objc_super v6 = [v5 resolvedActionItem];
  [v7 performAction:v6 options:0 completion:&stru_1004E45F0];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeCardVC, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end