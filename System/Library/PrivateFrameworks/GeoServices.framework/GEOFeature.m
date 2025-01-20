@interface GEOFeature
- (BOOL)hasBusinessID;
- (GEOFeatureStyleAttributes)attributes;
- (GEOVectorTile)containingTile;
- (const)name;
- (float)minZoomRank;
- (id).cxx_construct;
- (id)init:(void *)a3 withVectorTile:(id)a4;
- (int)type;
- (unint64_t)businessID;
- (unint64_t)featureID;
- (unint64_t)flyoverAnimationID;
- (unint64_t)labelCount;
- (unint64_t)labelOffset;
- (unint64_t)shieldCount;
- (unint64_t)shieldOffset;
- (unsigned)styleID;
- (void)_setType:(int)a3;
- (void)dealloc;
- (void)get;
@end

@implementation GEOFeature

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GEOFeature;
  v7 = [(GEOFeature *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_feature = a3;
    objc_storeWeak((id *)&v7->_containingTile, v6);
  }

  return v8;
}

- (void)dealloc
{
  self->_feature = 0;
  v2.receiver = self;
  v2.super_class = (Class)GEOFeature;
  [(GEOFeature *)&v2 dealloc];
}

- (void)get
{
  return self->_feature;
}

- (GEOVectorTile)containingTile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingTile);

  return (GEOVectorTile *)WeakRetained;
}

- (const)name
{
  feature = self->_feature;
  if (feature) {
    return (const char *)*((void *)feature + 2);
  }
  else {
    return 0;
  }
}

- (unint64_t)labelOffset
{
  feature = (unsigned int *)self->_feature;
  if (feature) {
    return feature[14];
  }
  else {
    return 0;
  }
}

- (unint64_t)labelCount
{
  feature = (unsigned __int8 *)self->_feature;
  if (feature) {
    return feature[73];
  }
  else {
    return 0;
  }
}

- (unint64_t)shieldOffset
{
  feature = (unsigned int *)self->_feature;
  if (feature) {
    return feature[15];
  }
  else {
    return 0;
  }
}

- (unint64_t)shieldCount
{
  feature = (unsigned __int8 *)self->_feature;
  if (feature) {
    return feature[72];
  }
  else {
    return 0;
  }
}

- (unsigned)styleID
{
  return 0;
}

- (unint64_t)featureID
{
  feature = self->_feature;
  if (feature) {
    return feature[5];
  }
  else {
    return 0;
  }
}

- (BOOL)hasBusinessID
{
  feature = self->_feature;
  return feature && feature[75] != 0;
}

- (unint64_t)businessID
{
  feature = self->_feature;
  if (feature) {
    return feature[6];
  }
  else {
    return 0;
  }
}

- (float)minZoomRank
{
  feature = (float *)self->_feature;
  if (feature) {
    return feature[17];
  }
  else {
    return 0.0;
  }
}

- (unint64_t)flyoverAnimationID
{
  return 0;
}

- (GEOFeatureStyleAttributes)attributes
{
  p_initAttributesFlag = &self->_initAttributesFlag;
  v3 = self;
  id v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initAttributesFlag, memory_order_acquire) != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initAttributesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOFeature attributes]::$_0 &&>>);
  }

  cached_attributes = v3->_cached_attributes;

  return cached_attributes;
}

- (int)type
{
  return self->_type;
}

- (void)_setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_attributes, 0);

  objc_destroyWeak((id *)&self->_containingTile);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end