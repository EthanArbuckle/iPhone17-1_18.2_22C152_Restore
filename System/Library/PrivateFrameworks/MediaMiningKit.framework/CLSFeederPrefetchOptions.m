@interface CLSFeederPrefetchOptions
+ (id)feederPrefetchOptionsWithDefaultMode:(unint64_t)a3;
- (CLSFeederPrefetchOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)faceInformationPrefetchMode;
- (unint64_t)locationPrefetchMode;
- (unint64_t)personCountPrefetchMode;
- (unint64_t)personsPrefetchMode;
- (unint64_t)scenesPrefetchMode;
- (void)mergeWithFeederPrefetchOptions:(id)a3;
- (void)setFaceInformationPrefetchMode:(unint64_t)a3;
- (void)setLocationPrefetchMode:(unint64_t)a3;
- (void)setPersonCountPrefetchMode:(unint64_t)a3;
- (void)setPersonsPrefetchMode:(unint64_t)a3;
- (void)setScenesPrefetchMode:(unint64_t)a3;
@end

@implementation CLSFeederPrefetchOptions

- (void)setLocationPrefetchMode:(unint64_t)a3
{
  self->_locationPrefetchMode = a3;
}

- (unint64_t)locationPrefetchMode
{
  return self->_locationPrefetchMode;
}

- (void)setFaceInformationPrefetchMode:(unint64_t)a3
{
  self->_faceInformationPrefetchMode = a3;
}

- (unint64_t)faceInformationPrefetchMode
{
  return self->_faceInformationPrefetchMode;
}

- (void)setScenesPrefetchMode:(unint64_t)a3
{
  self->_scenesPrefetchMode = a3;
}

- (unint64_t)scenesPrefetchMode
{
  return self->_scenesPrefetchMode;
}

- (void)setPersonsPrefetchMode:(unint64_t)a3
{
  self->_personsPrefetchMode = a3;
}

- (unint64_t)personsPrefetchMode
{
  return self->_personsPrefetchMode;
}

- (void)setPersonCountPrefetchMode:(unint64_t)a3
{
  self->_personCountPrefetchMode = a3;
}

- (unint64_t)personCountPrefetchMode
{
  return self->_personCountPrefetchMode;
}

- (void)mergeWithFeederPrefetchOptions:(id)a3
{
  unint64_t personCountPrefetchMode = self->_personCountPrefetchMode;
  id v5 = a3;
  unint64_t v6 = [v5 personCountPrefetchMode];
  if (personCountPrefetchMode <= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = personCountPrefetchMode;
  }
  self->_unint64_t personCountPrefetchMode = v7;
  unint64_t personsPrefetchMode = self->_personsPrefetchMode;
  unint64_t v9 = [v5 personsPrefetchMode];
  if (personsPrefetchMode <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = personsPrefetchMode;
  }
  self->_unint64_t personsPrefetchMode = v10;
  unint64_t scenesPrefetchMode = self->_scenesPrefetchMode;
  unint64_t v12 = [v5 scenesPrefetchMode];
  if (scenesPrefetchMode <= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = scenesPrefetchMode;
  }
  self->_unint64_t scenesPrefetchMode = v13;
  unint64_t faceInformationPrefetchMode = self->_faceInformationPrefetchMode;
  unint64_t v15 = [v5 faceInformationPrefetchMode];
  if (faceInformationPrefetchMode <= v15) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = faceInformationPrefetchMode;
  }
  self->_unint64_t faceInformationPrefetchMode = v16;
  unint64_t locationPrefetchMode = self->_locationPrefetchMode;
  unint64_t v18 = [v5 locationPrefetchMode];

  if (locationPrefetchMode <= v18) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = locationPrefetchMode;
  }
  self->_unint64_t locationPrefetchMode = v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((void *)result + 1) = self->_personCountPrefetchMode;
  *((void *)result + 2) = self->_personsPrefetchMode;
  *((void *)result + 3) = self->_scenesPrefetchMode;
  *((void *)result + 4) = self->_faceInformationPrefetchMode;
  *((void *)result + 5) = self->_locationPrefetchMode;
  return result;
}

- (CLSFeederPrefetchOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSFeederPrefetchOptions;
  id result = [(CLSFeederPrefetchOptions *)&v3 init];
  if (result)
  {
    result->_unint64_t locationPrefetchMode = 0;
    *(_OWORD *)&result->_unint64_t scenesPrefetchMode = 0u;
    *(_OWORD *)&result->_unint64_t personCountPrefetchMode = 0u;
  }
  return result;
}

+ (id)feederPrefetchOptionsWithDefaultMode:(unint64_t)a3
{
  v4 = objc_alloc_init(CLSFeederPrefetchOptions);
  v4->_unint64_t personCountPrefetchMode = a3;
  v4->_unint64_t personsPrefetchMode = a3;
  v4->_unint64_t scenesPrefetchMode = a3;
  v4->_unint64_t faceInformationPrefetchMode = a3;
  v4->_unint64_t locationPrefetchMode = a3;
  return v4;
}

@end