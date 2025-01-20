@interface PHResourceChooserListResourceInfo
- (BOOL)canDownload;
- (BOOL)isDerivative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHintBased;
- (BOOL)isOriginalResource;
- (BOOL)isPrimaryFormat;
- (BOOL)locallyGeneratableOnDemand;
- (CGSize)approximateSizeFromAsset:(id)a3;
- (PHResourceChooserListResourceInfo)initWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15;
- (PLResourceDataStore)store;
- (PLResourceDataStoreKey)dataStoreKey;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (float)resourceScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int)qualitySortValue;
- (signed)localAvailability;
- (signed)localAvailabilityTarget;
- (unint64_t)hash;
- (unsigned)recipeID;
- (unsigned)resourceType;
- (unsigned)version;
- (void)populateWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15;
- (void)prepareForReuse;
@end

@implementation PHResourceChooserListResourceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

- (float)resourceScale
{
  return self->_resourceScale;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (PLResourceDataStore)store
{
  return self->_store;
}

- (unsigned)version
{
  return self->_version;
}

- (PHResourceChooserListResourceInfo)initWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15
{
  BOOL v15 = a9;
  BOOL v16 = a8;
  uint64_t v17 = *(void *)&a7;
  uint64_t v19 = *(void *)&a5;
  uint64_t v20 = *(void *)&a4;
  uint64_t v21 = *(void *)&a3;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v31.receiver = self;
  v31.super_class = (Class)PHResourceChooserListResourceInfo;
  v26 = [(PHResourceChooserListResourceInfo *)&v31 init];
  v27 = v26;
  if (v26)
  {
    LOWORD(v30) = a15;
    LOWORD(v29) = __PAIR16__(a11, a10);
    -[PHResourceChooserListResourceInfo populateWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v26, "populateWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v21, v20, v19, v17, v16, v15, a6, v29, v23, v24, v25, v30);
  }

  return v27;
}

- (void)populateWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15
{
  uint64_t v21 = (PLUniformTypeIdentifier *)a12;
  v22 = (PLResourceDataStore *)a13;
  id v23 = (PLResourceDataStoreKey *)a14;
  self->_recipeID = a4;
  self->_resourceType = a3;
  self->_version = a5;
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = v21;
  id v25 = v21;

  float v26 = a6;
  self->_resourceScale = v26;
  self->_qualitySortValue = a7;
  self->_isDerivative = a8;
  self->_isPrimaryFormat = a9;
  self->_canDownload = a10;
  self->_isHintBased = a11;
  store = self->_store;
  self->_store = v22;
  v28 = v22;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = v23;

  self->_localAvailabilityTarget = a15;
}

- (BOOL)isHintBased
{
  return self->_isHintBased;
}

- (CGSize)approximateSizeFromAsset:(id)a3
{
  id v4 = a3;
  if ([v4 hasAdjustments]
    && ![(PHResourceChooserListResourceInfo *)self version])
  {
    [v4 originalUnorientedSize];
  }
  else
  {
    [v4 unorientedSize];
  }
  [(PHResourceChooserListResourceInfo *)self resourceScale];
  PLApproximateResourceSizeFromScale();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isDerivative
{
  return self->_isDerivative;
}

- (BOOL)isPrimaryFormat
{
  return self->_isPrimaryFormat;
}

- (BOOL)canDownload
{
  return self->_canDownload;
}

- (signed)localAvailabilityTarget
{
  return self->_localAvailabilityTarget;
}

- (int)qualitySortValue
{
  return self->_qualitySortValue;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PHResourceChooserListResourceInfo alloc];
  LOWORD(v7) = self->_localAvailabilityTarget;
  LOWORD(v6) = *(_WORD *)&self->_canDownload;
  return -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v4, "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", self->_resourceType, self->_recipeID, self->_version, self->_qualitySortValue, self->_isDerivative, self->_isPrimaryFormat, self->_resourceScale, v6, self->_uniformTypeIdentifier, self->_store, self->_dataStoreKey, v7);
}

- (void)prepareForReuse
{
  *(_DWORD *)&self->_isDerivative = 0;
  *(void *)&self->_recipeID = 0;
  *(void *)&self->_version = 0;
  self->_qualitySortValue = 0;
  store = self->_store;
  self->_store = 0;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = 0;

  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = 0;

  self->_localAvailabilityTarget = 0;
}

- (BOOL)locallyGeneratableOnDemand
{
  unsigned int v3 = [(PHResourceChooserListResourceInfo *)self recipeID];
  int v4 = [(PHResourceChooserListResourceInfo *)self localAvailabilityTarget];
  BOOL result = 1;
  if (v3 - 65938 > 8 || ((1 << (v3 + 110)) & 0x141) == 0)
  {
    BOOL v7 = v4 == 1 && v3 != 65747;
    return v3 == 65749 || v7;
  }
  return result;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PHResourceChooserListResourceInfo *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PHResourceChooserListResourceInfo *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (signed)localAvailability
{
  v2 = [(PHResourceChooserListResourceInfo *)self dataStoreKey];

  if (v2) {
    return 1;
  }
  else {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (PHResourceChooserListResourceInfo *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      BOOL v6 = [(PHResourceChooserListResourceInfo *)self isHintBased];
      BOOL v7 = v6 ^ [(PHResourceChooserListResourceInfo *)v5 isHintBased] ^ 1;
      unsigned int v8 = [(PHResourceChooserListResourceInfo *)self resourceType];
      if (v8 == [(PHResourceChooserListResourceInfo *)v5 resourceType])
      {
        unsigned int v9 = [(PHResourceChooserListResourceInfo *)self recipeID];
        if (v9 == [(PHResourceChooserListResourceInfo *)v5 recipeID])
        {
          unsigned int v10 = [(PHResourceChooserListResourceInfo *)self version];
          if (v10 == [(PHResourceChooserListResourceInfo *)v5 version])
          {
            [(PHResourceChooserListResourceInfo *)self resourceScale];
            float v12 = v11;
            [(PHResourceChooserListResourceInfo *)v5 resourceScale];
            if (v12 == v13)
            {
              BOOL v14 = [(PHResourceChooserListResourceInfo *)self isDerivative];
              if (v14 == [(PHResourceChooserListResourceInfo *)v5 isDerivative])
              {
                BOOL v15 = [(PHResourceChooserListResourceInfo *)self isPrimaryFormat];
                if (v15 == [(PHResourceChooserListResourceInfo *)v5 isPrimaryFormat])
                {
                  BOOL v16 = [(PHResourceChooserListResourceInfo *)self canDownload];
                  if (v16 == [(PHResourceChooserListResourceInfo *)v5 canDownload])
                  {
                    int v17 = [(PHResourceChooserListResourceInfo *)self localAvailabilityTarget];
                    if (v17 == [(PHResourceChooserListResourceInfo *)v5 localAvailabilityTarget])
                    {
                      v18 = [(PHResourceChooserListResourceInfo *)self store];
                      uint64_t v19 = [(PHResourceChooserListResourceInfo *)v5 store];
                      if (PLObjectIsEqual())
                      {
                        uint64_t v20 = [(PHResourceChooserListResourceInfo *)self dataStoreKey];
                        uint64_t v21 = [(PHResourceChooserListResourceInfo *)v5 dataStoreKey];
                        PLObjectIsEqual();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  BOOL v3 = [(PHResourceChooserListResourceInfo *)self isHintBased];
  unsigned int v4 = [(PHResourceChooserListResourceInfo *)self recipeID] ^ v3;
  unsigned int v5 = [(PHResourceChooserListResourceInfo *)self version];
  uint64_t v6 = v4 ^ v5 ^ [(PHResourceChooserListResourceInfo *)self resourceType];
  BOOL v7 = [(PHResourceChooserListResourceInfo *)self dataStoreKey];
  uint64_t v8 = [v7 hash];
  unsigned int v9 = [(PHResourceChooserListResourceInfo *)self store];
  unint64_t v10 = v8 ^ [v9 hash] ^ v6;

  return v10;
}

@end