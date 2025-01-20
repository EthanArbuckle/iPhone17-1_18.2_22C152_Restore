@interface BuddyExpressWalletFeatureCardView
- (BuddyExpressWalletFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (CGSize)setupAssistantCredentialCardArtSize;
- (NSMutableDictionary)featureCardCellMap;
- (void)addCardCell:(id)a3;
- (void)setFeatureCardCellMap:(id)a3;
- (void)setupAssistantCredentialUpdatedCardArt:(id)a3;
@end

@implementation BuddyExpressWalletFeatureCardView

- (BuddyExpressWalletFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v7 = v17;
  id v17 = 0;
  v13.receiver = v7;
  v13.super_class = (Class)BuddyExpressWalletFeatureCardView;
  v8 = [(BuddyExpressSetupFeatureCardView *)&v13 initWithTitle:location[0] subtitle:v15 icon:v14];
  id v17 = v8;
  objc_storeStrong(&v17, v8);
  if (v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    v10 = (void *)*((void *)v17 + 7);
    *((void *)v17 + 7) = v9;
  }
  v11 = (BuddyExpressWalletFeatureCardView *)v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v11;
}

- (void)addCardCell:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] uniqueIdentifier];

  if (v3)
  {
    id v4 = location[0];
    v5 = [(BuddyExpressWalletFeatureCardView *)v9 featureCardCellMap];
    id v6 = [location[0] uniqueIdentifier];
    [(NSMutableDictionary *)v5 setObject:v4 forKeyedSubscript:v6];
  }
  v7.receiver = v9;
  v7.super_class = (Class)BuddyExpressWalletFeatureCardView;
  [(BuddyExpressSetupFeatureCardView *)&v7 addCardCell:location[0]];
  objc_storeStrong(location, 0);
}

- (CGSize)setupAssistantCredentialCardArtSize
{
  double v2 = sub_1000AC984();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setupAssistantCredentialUpdatedCardArt:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(BuddyExpressWalletFeatureCardView *)v9 featureCardCellMap];
  id v4 = [location[0] uniqueIdentifier];
  id v7 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:v4];

  if (v7)
  {
    id v5 = [v7 accessoryView];
    id v6 = [location[0] passSnapshot];
    [v5 setImage:v6];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableDictionary)featureCardCellMap
{
  return self->_featureCardCellMap;
}

- (void)setFeatureCardCellMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end