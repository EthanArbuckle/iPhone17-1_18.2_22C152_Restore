@interface ADSAEAssetsAvailabilityObserver
- (ADSAEAssetsAvailabilityObserver)init;
- (ADSAEAssetsAvailabilityObserver)initWithGMAvailabilityWrapperClass:(Class)a3;
- (BOOL)saeAssetsForCurrentLocaleAvailable;
- (void)assetManager:(id)a3 didChangeLanguageCode:(id)a4;
- (void)assetManagerDidChangeAssetAvailability:(id)a3;
- (void)refreshAssetsAvailabilityWithAssetManager:(id)a3;
- (void)setSaeAssetsForCurrentLocaleAvailable:(BOOL)a3;
@end

@implementation ADSAEAssetsAvailabilityObserver

- (void)setSaeAssetsForCurrentLocaleAvailable:(BOOL)a3
{
  self->_saeAssetsForCurrentLocaleAvailable = a3;
}

- (BOOL)saeAssetsForCurrentLocaleAvailable
{
  return self->_saeAssetsForCurrentLocaleAvailable;
}

- (void)assetManager:(id)a3 didChangeLanguageCode:(id)a4
{
}

- (void)assetManagerDidChangeAssetAvailability:(id)a3
{
}

- (void)refreshAssetsAvailabilityWithAssetManager:(id)a3
{
  id v4 = a3;
  v5 = +[ADPreferences sharedPreferences];
  v6 = [v5 languageCode];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100186538;
  v8[3] = &unk_10050DCE0;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [v4 fetchAssetsAvailabilityForLanguage:v7 completion:v8];
}

- (ADSAEAssetsAvailabilityObserver)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v3 = (void *)qword_100585D60;
  uint64_t v10 = qword_100585D60;
  if (!qword_100585D60)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001868D4;
    v6[3] = &unk_10050E318;
    v6[4] = &v7;
    sub_1001868D4((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  return [(ADSAEAssetsAvailabilityObserver *)self initWithGMAvailabilityWrapperClass:v4];
}

- (ADSAEAssetsAvailabilityObserver)initWithGMAvailabilityWrapperClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADSAEAssetsAvailabilityObserver;
  result = [(ADSAEAssetsAvailabilityObserver *)&v5 init];
  if (result) {
    result->_gmAvailabilityWrapperClass = a3;
  }
  return result;
}

@end