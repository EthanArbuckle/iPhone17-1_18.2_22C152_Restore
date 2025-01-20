@interface BMPerBatchDomainSpecificAssetCounts
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPerBatchDomainSpecificAssetCounts)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPerBatchDomainSpecificAssetCounts)initWithParsedAssetCount:(id)a3 anyDomainAssetCount:(id)a4 artAssetCount:(id)a5 natureAssetCount:(id)a6 animalsAssetCount:(id)a7 birdsAssetCount:(id)a8 insectsAssetCount:(id)a9 reptilesAssetCount:(id)a10 mammalsAssetCount:(id)a11 landmarkAssetCount:(id)a12 naturalLandmarkAssetCount:(id)a13 mediaAssetCount:(id)a14 bookAssetCount:(id)a15 albumAssetCount:(id)a16 catsAssetCount:(id)a17 dogsAssetCount:(id)a18 apparelAssetCount:(id)a19 foodAssetCount:(id)a20 storefrontAssetCount:(id)a21 signSymbolAssetCount:(id)a22 laundryCareSymbolAssetCount:(id)a23 autoSymbolAssetCount:(id)a24 brandLogoSymbolAssetCount:(id)a25 object2DAssetCount:(id)a26 barcodeDetectionAssetCount:(id)a27 sculptureAssetCount:(id)a28 skylineAssetCount:(id)a29;
- (BOOL)hasAlbumAssetCount;
- (BOOL)hasAnimalsAssetCount;
- (BOOL)hasAnyDomainAssetCount;
- (BOOL)hasApparelAssetCount;
- (BOOL)hasArtAssetCount;
- (BOOL)hasAutoSymbolAssetCount;
- (BOOL)hasBarcodeDetectionAssetCount;
- (BOOL)hasBirdsAssetCount;
- (BOOL)hasBookAssetCount;
- (BOOL)hasBrandLogoSymbolAssetCount;
- (BOOL)hasCatsAssetCount;
- (BOOL)hasDogsAssetCount;
- (BOOL)hasFoodAssetCount;
- (BOOL)hasInsectsAssetCount;
- (BOOL)hasLandmarkAssetCount;
- (BOOL)hasLaundryCareSymbolAssetCount;
- (BOOL)hasMammalsAssetCount;
- (BOOL)hasMediaAssetCount;
- (BOOL)hasNaturalLandmarkAssetCount;
- (BOOL)hasNatureAssetCount;
- (BOOL)hasObject2DAssetCount;
- (BOOL)hasParsedAssetCount;
- (BOOL)hasReptilesAssetCount;
- (BOOL)hasSculptureAssetCount;
- (BOOL)hasSignSymbolAssetCount;
- (BOOL)hasSkylineAssetCount;
- (BOOL)hasStorefrontAssetCount;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)albumAssetCount;
- (int)animalsAssetCount;
- (int)anyDomainAssetCount;
- (int)apparelAssetCount;
- (int)artAssetCount;
- (int)autoSymbolAssetCount;
- (int)barcodeDetectionAssetCount;
- (int)birdsAssetCount;
- (int)bookAssetCount;
- (int)brandLogoSymbolAssetCount;
- (int)catsAssetCount;
- (int)dogsAssetCount;
- (int)foodAssetCount;
- (int)insectsAssetCount;
- (int)landmarkAssetCount;
- (int)laundryCareSymbolAssetCount;
- (int)mammalsAssetCount;
- (int)mediaAssetCount;
- (int)naturalLandmarkAssetCount;
- (int)natureAssetCount;
- (int)object2DAssetCount;
- (int)parsedAssetCount;
- (int)reptilesAssetCount;
- (int)sculptureAssetCount;
- (int)signSymbolAssetCount;
- (int)skylineAssetCount;
- (int)storefrontAssetCount;
- (unsigned)dataVersion;
- (void)setHasAlbumAssetCount:(BOOL)a3;
- (void)setHasAnimalsAssetCount:(BOOL)a3;
- (void)setHasAnyDomainAssetCount:(BOOL)a3;
- (void)setHasApparelAssetCount:(BOOL)a3;
- (void)setHasArtAssetCount:(BOOL)a3;
- (void)setHasAutoSymbolAssetCount:(BOOL)a3;
- (void)setHasBarcodeDetectionAssetCount:(BOOL)a3;
- (void)setHasBirdsAssetCount:(BOOL)a3;
- (void)setHasBookAssetCount:(BOOL)a3;
- (void)setHasBrandLogoSymbolAssetCount:(BOOL)a3;
- (void)setHasCatsAssetCount:(BOOL)a3;
- (void)setHasDogsAssetCount:(BOOL)a3;
- (void)setHasFoodAssetCount:(BOOL)a3;
- (void)setHasInsectsAssetCount:(BOOL)a3;
- (void)setHasLandmarkAssetCount:(BOOL)a3;
- (void)setHasLaundryCareSymbolAssetCount:(BOOL)a3;
- (void)setHasMammalsAssetCount:(BOOL)a3;
- (void)setHasMediaAssetCount:(BOOL)a3;
- (void)setHasNaturalLandmarkAssetCount:(BOOL)a3;
- (void)setHasNatureAssetCount:(BOOL)a3;
- (void)setHasObject2DAssetCount:(BOOL)a3;
- (void)setHasParsedAssetCount:(BOOL)a3;
- (void)setHasReptilesAssetCount:(BOOL)a3;
- (void)setHasSculptureAssetCount:(BOOL)a3;
- (void)setHasSignSymbolAssetCount:(BOOL)a3;
- (void)setHasSkylineAssetCount:(BOOL)a3;
- (void)setHasStorefrontAssetCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPerBatchDomainSpecificAssetCounts

- (void)setHasSkylineAssetCount:(BOOL)a3
{
  self->_hasSkylineAssetCount = a3;
}

- (BOOL)hasSkylineAssetCount
{
  return self->_hasSkylineAssetCount;
}

- (int)skylineAssetCount
{
  return self->_skylineAssetCount;
}

- (void)setHasSculptureAssetCount:(BOOL)a3
{
  self->_hasSculptureAssetCount = a3;
}

- (BOOL)hasSculptureAssetCount
{
  return self->_hasSculptureAssetCount;
}

- (int)sculptureAssetCount
{
  return self->_sculptureAssetCount;
}

- (void)setHasBarcodeDetectionAssetCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetCount = a3;
}

- (BOOL)hasBarcodeDetectionAssetCount
{
  return self->_hasBarcodeDetectionAssetCount;
}

- (int)barcodeDetectionAssetCount
{
  return self->_barcodeDetectionAssetCount;
}

- (void)setHasObject2DAssetCount:(BOOL)a3
{
  self->_hasObject2DAssetCount = a3;
}

- (BOOL)hasObject2DAssetCount
{
  return self->_hasObject2DAssetCount;
}

- (int)object2DAssetCount
{
  return self->_object2DAssetCount;
}

- (void)setHasBrandLogoSymbolAssetCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetCount = a3;
}

- (BOOL)hasBrandLogoSymbolAssetCount
{
  return self->_hasBrandLogoSymbolAssetCount;
}

- (int)brandLogoSymbolAssetCount
{
  return self->_brandLogoSymbolAssetCount;
}

- (void)setHasAutoSymbolAssetCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetCount = a3;
}

- (BOOL)hasAutoSymbolAssetCount
{
  return self->_hasAutoSymbolAssetCount;
}

- (int)autoSymbolAssetCount
{
  return self->_autoSymbolAssetCount;
}

- (void)setHasLaundryCareSymbolAssetCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetCount = a3;
}

- (BOOL)hasLaundryCareSymbolAssetCount
{
  return self->_hasLaundryCareSymbolAssetCount;
}

- (int)laundryCareSymbolAssetCount
{
  return self->_laundryCareSymbolAssetCount;
}

- (void)setHasSignSymbolAssetCount:(BOOL)a3
{
  self->_hasSignSymbolAssetCount = a3;
}

- (BOOL)hasSignSymbolAssetCount
{
  return self->_hasSignSymbolAssetCount;
}

- (int)signSymbolAssetCount
{
  return self->_signSymbolAssetCount;
}

- (void)setHasStorefrontAssetCount:(BOOL)a3
{
  self->_hasStorefrontAssetCount = a3;
}

- (BOOL)hasStorefrontAssetCount
{
  return self->_hasStorefrontAssetCount;
}

- (int)storefrontAssetCount
{
  return self->_storefrontAssetCount;
}

- (void)setHasFoodAssetCount:(BOOL)a3
{
  self->_hasFoodAssetCount = a3;
}

- (BOOL)hasFoodAssetCount
{
  return self->_hasFoodAssetCount;
}

- (int)foodAssetCount
{
  return self->_foodAssetCount;
}

- (void)setHasApparelAssetCount:(BOOL)a3
{
  self->_hasApparelAssetCount = a3;
}

- (BOOL)hasApparelAssetCount
{
  return self->_hasApparelAssetCount;
}

- (int)apparelAssetCount
{
  return self->_apparelAssetCount;
}

- (void)setHasDogsAssetCount:(BOOL)a3
{
  self->_hasDogsAssetCount = a3;
}

- (BOOL)hasDogsAssetCount
{
  return self->_hasDogsAssetCount;
}

- (int)dogsAssetCount
{
  return self->_dogsAssetCount;
}

- (void)setHasCatsAssetCount:(BOOL)a3
{
  self->_hasCatsAssetCount = a3;
}

- (BOOL)hasCatsAssetCount
{
  return self->_hasCatsAssetCount;
}

- (int)catsAssetCount
{
  return self->_catsAssetCount;
}

- (void)setHasAlbumAssetCount:(BOOL)a3
{
  self->_hasAlbumAssetCount = a3;
}

- (BOOL)hasAlbumAssetCount
{
  return self->_hasAlbumAssetCount;
}

- (int)albumAssetCount
{
  return self->_albumAssetCount;
}

- (void)setHasBookAssetCount:(BOOL)a3
{
  self->_hasBookAssetCount = a3;
}

- (BOOL)hasBookAssetCount
{
  return self->_hasBookAssetCount;
}

- (int)bookAssetCount
{
  return self->_bookAssetCount;
}

- (void)setHasMediaAssetCount:(BOOL)a3
{
  self->_hasMediaAssetCount = a3;
}

- (BOOL)hasMediaAssetCount
{
  return self->_hasMediaAssetCount;
}

- (int)mediaAssetCount
{
  return self->_mediaAssetCount;
}

- (void)setHasNaturalLandmarkAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkAssetCount = a3;
}

- (BOOL)hasNaturalLandmarkAssetCount
{
  return self->_hasNaturalLandmarkAssetCount;
}

- (int)naturalLandmarkAssetCount
{
  return self->_naturalLandmarkAssetCount;
}

- (void)setHasLandmarkAssetCount:(BOOL)a3
{
  self->_hasLandmarkAssetCount = a3;
}

- (BOOL)hasLandmarkAssetCount
{
  return self->_hasLandmarkAssetCount;
}

- (int)landmarkAssetCount
{
  return self->_landmarkAssetCount;
}

- (void)setHasMammalsAssetCount:(BOOL)a3
{
  self->_hasMammalsAssetCount = a3;
}

- (BOOL)hasMammalsAssetCount
{
  return self->_hasMammalsAssetCount;
}

- (int)mammalsAssetCount
{
  return self->_mammalsAssetCount;
}

- (void)setHasReptilesAssetCount:(BOOL)a3
{
  self->_hasReptilesAssetCount = a3;
}

- (BOOL)hasReptilesAssetCount
{
  return self->_hasReptilesAssetCount;
}

- (int)reptilesAssetCount
{
  return self->_reptilesAssetCount;
}

- (void)setHasInsectsAssetCount:(BOOL)a3
{
  self->_hasInsectsAssetCount = a3;
}

- (BOOL)hasInsectsAssetCount
{
  return self->_hasInsectsAssetCount;
}

- (int)insectsAssetCount
{
  return self->_insectsAssetCount;
}

- (void)setHasBirdsAssetCount:(BOOL)a3
{
  self->_hasBirdsAssetCount = a3;
}

- (BOOL)hasBirdsAssetCount
{
  return self->_hasBirdsAssetCount;
}

- (int)birdsAssetCount
{
  return self->_birdsAssetCount;
}

- (void)setHasAnimalsAssetCount:(BOOL)a3
{
  self->_hasAnimalsAssetCount = a3;
}

- (BOOL)hasAnimalsAssetCount
{
  return self->_hasAnimalsAssetCount;
}

- (int)animalsAssetCount
{
  return self->_animalsAssetCount;
}

- (void)setHasNatureAssetCount:(BOOL)a3
{
  self->_hasNatureAssetCount = a3;
}

- (BOOL)hasNatureAssetCount
{
  return self->_hasNatureAssetCount;
}

- (int)natureAssetCount
{
  return self->_natureAssetCount;
}

- (void)setHasArtAssetCount:(BOOL)a3
{
  self->_hasArtAssetCount = a3;
}

- (BOOL)hasArtAssetCount
{
  return self->_hasArtAssetCount;
}

- (int)artAssetCount
{
  return self->_artAssetCount;
}

- (void)setHasAnyDomainAssetCount:(BOOL)a3
{
  self->_hasAnyDomainAssetCount = a3;
}

- (BOOL)hasAnyDomainAssetCount
{
  return self->_hasAnyDomainAssetCount;
}

- (int)anyDomainAssetCount
{
  return self->_anyDomainAssetCount;
}

- (void)setHasParsedAssetCount:(BOOL)a3
{
  self->_hasParsedAssetCount = a3;
}

- (BOOL)hasParsedAssetCount
{
  return self->_hasParsedAssetCount;
}

- (int)parsedAssetCount
{
  return self->_parsedAssetCount;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasParsedAssetCount]
      || [v5 hasParsedAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasParsedAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasParsedAssetCount]) {
        goto LABEL_138;
      }
      int v6 = [(BMPerBatchDomainSpecificAssetCounts *)self parsedAssetCount];
      if (v6 != [v5 parsedAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAnyDomainAssetCount]
      || [v5 hasAnyDomainAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasAnyDomainAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasAnyDomainAssetCount]) {
        goto LABEL_138;
      }
      int v7 = [(BMPerBatchDomainSpecificAssetCounts *)self anyDomainAssetCount];
      if (v7 != [v5 anyDomainAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasArtAssetCount]
      || [v5 hasArtAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasArtAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasArtAssetCount]) {
        goto LABEL_138;
      }
      int v8 = [(BMPerBatchDomainSpecificAssetCounts *)self artAssetCount];
      if (v8 != [v5 artAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasNatureAssetCount]
      || [v5 hasNatureAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasNatureAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasNatureAssetCount]) {
        goto LABEL_138;
      }
      int v9 = [(BMPerBatchDomainSpecificAssetCounts *)self natureAssetCount];
      if (v9 != [v5 natureAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAnimalsAssetCount]
      || [v5 hasAnimalsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasAnimalsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasAnimalsAssetCount]) {
        goto LABEL_138;
      }
      int v10 = [(BMPerBatchDomainSpecificAssetCounts *)self animalsAssetCount];
      if (v10 != [v5 animalsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBirdsAssetCount]
      || [v5 hasBirdsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasBirdsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasBirdsAssetCount]) {
        goto LABEL_138;
      }
      int v11 = [(BMPerBatchDomainSpecificAssetCounts *)self birdsAssetCount];
      if (v11 != [v5 birdsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasInsectsAssetCount]
      || [v5 hasInsectsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasInsectsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasInsectsAssetCount]) {
        goto LABEL_138;
      }
      int v12 = [(BMPerBatchDomainSpecificAssetCounts *)self insectsAssetCount];
      if (v12 != [v5 insectsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasReptilesAssetCount]
      || [v5 hasReptilesAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasReptilesAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasReptilesAssetCount]) {
        goto LABEL_138;
      }
      int v13 = [(BMPerBatchDomainSpecificAssetCounts *)self reptilesAssetCount];
      if (v13 != [v5 reptilesAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasMammalsAssetCount]
      || [v5 hasMammalsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasMammalsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasMammalsAssetCount]) {
        goto LABEL_138;
      }
      int v14 = [(BMPerBatchDomainSpecificAssetCounts *)self mammalsAssetCount];
      if (v14 != [v5 mammalsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasLandmarkAssetCount]
      || [v5 hasLandmarkAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasLandmarkAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasLandmarkAssetCount]) {
        goto LABEL_138;
      }
      int v15 = [(BMPerBatchDomainSpecificAssetCounts *)self landmarkAssetCount];
      if (v15 != [v5 landmarkAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasNaturalLandmarkAssetCount]
      || [v5 hasNaturalLandmarkAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasNaturalLandmarkAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasNaturalLandmarkAssetCount]) {
        goto LABEL_138;
      }
      int v16 = [(BMPerBatchDomainSpecificAssetCounts *)self naturalLandmarkAssetCount];
      if (v16 != [v5 naturalLandmarkAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasMediaAssetCount]
      || [v5 hasMediaAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasMediaAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasMediaAssetCount]) {
        goto LABEL_138;
      }
      int v17 = [(BMPerBatchDomainSpecificAssetCounts *)self mediaAssetCount];
      if (v17 != [v5 mediaAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBookAssetCount]
      || [v5 hasBookAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasBookAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasBookAssetCount]) {
        goto LABEL_138;
      }
      int v18 = [(BMPerBatchDomainSpecificAssetCounts *)self bookAssetCount];
      if (v18 != [v5 bookAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAlbumAssetCount]
      || [v5 hasAlbumAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasAlbumAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasAlbumAssetCount]) {
        goto LABEL_138;
      }
      int v19 = [(BMPerBatchDomainSpecificAssetCounts *)self albumAssetCount];
      if (v19 != [v5 albumAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasCatsAssetCount]
      || [v5 hasCatsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasCatsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasCatsAssetCount]) {
        goto LABEL_138;
      }
      int v20 = [(BMPerBatchDomainSpecificAssetCounts *)self catsAssetCount];
      if (v20 != [v5 catsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasDogsAssetCount]
      || [v5 hasDogsAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasDogsAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasDogsAssetCount]) {
        goto LABEL_138;
      }
      int v21 = [(BMPerBatchDomainSpecificAssetCounts *)self dogsAssetCount];
      if (v21 != [v5 dogsAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasApparelAssetCount]
      || [v5 hasApparelAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasApparelAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasApparelAssetCount]) {
        goto LABEL_138;
      }
      int v22 = [(BMPerBatchDomainSpecificAssetCounts *)self apparelAssetCount];
      if (v22 != [v5 apparelAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasFoodAssetCount]
      || [v5 hasFoodAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasFoodAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasFoodAssetCount]) {
        goto LABEL_138;
      }
      int v23 = [(BMPerBatchDomainSpecificAssetCounts *)self foodAssetCount];
      if (v23 != [v5 foodAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasStorefrontAssetCount]
      || [v5 hasStorefrontAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasStorefrontAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasStorefrontAssetCount]) {
        goto LABEL_138;
      }
      int v24 = [(BMPerBatchDomainSpecificAssetCounts *)self storefrontAssetCount];
      if (v24 != [v5 storefrontAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSignSymbolAssetCount]
      || [v5 hasSignSymbolAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasSignSymbolAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasSignSymbolAssetCount]) {
        goto LABEL_138;
      }
      int v25 = [(BMPerBatchDomainSpecificAssetCounts *)self signSymbolAssetCount];
      if (v25 != [v5 signSymbolAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasLaundryCareSymbolAssetCount]
      || [v5 hasLaundryCareSymbolAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasLaundryCareSymbolAssetCount])goto LABEL_138; {
      if (![v5 hasLaundryCareSymbolAssetCount])
      }
        goto LABEL_138;
      int v26 = [(BMPerBatchDomainSpecificAssetCounts *)self laundryCareSymbolAssetCount];
      if (v26 != [v5 laundryCareSymbolAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAutoSymbolAssetCount]
      || [v5 hasAutoSymbolAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasAutoSymbolAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasAutoSymbolAssetCount]) {
        goto LABEL_138;
      }
      int v27 = [(BMPerBatchDomainSpecificAssetCounts *)self autoSymbolAssetCount];
      if (v27 != [v5 autoSymbolAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBrandLogoSymbolAssetCount]
      || [v5 hasBrandLogoSymbolAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasBrandLogoSymbolAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasBrandLogoSymbolAssetCount]) {
        goto LABEL_138;
      }
      int v28 = [(BMPerBatchDomainSpecificAssetCounts *)self brandLogoSymbolAssetCount];
      if (v28 != [v5 brandLogoSymbolAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasObject2DAssetCount]
      || [v5 hasObject2DAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasObject2DAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasObject2DAssetCount]) {
        goto LABEL_138;
      }
      int v29 = [(BMPerBatchDomainSpecificAssetCounts *)self object2DAssetCount];
      if (v29 != [v5 object2DAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBarcodeDetectionAssetCount]
      || [v5 hasBarcodeDetectionAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasBarcodeDetectionAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasBarcodeDetectionAssetCount]) {
        goto LABEL_138;
      }
      int v30 = [(BMPerBatchDomainSpecificAssetCounts *)self barcodeDetectionAssetCount];
      if (v30 != [v5 barcodeDetectionAssetCount]) {
        goto LABEL_138;
      }
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSculptureAssetCount]
      || [v5 hasSculptureAssetCount])
    {
      if (![(BMPerBatchDomainSpecificAssetCounts *)self hasSculptureAssetCount]) {
        goto LABEL_138;
      }
      if (![v5 hasSculptureAssetCount]) {
        goto LABEL_138;
      }
      int v31 = [(BMPerBatchDomainSpecificAssetCounts *)self sculptureAssetCount];
      if (v31 != [v5 sculptureAssetCount]) {
        goto LABEL_138;
      }
    }
    if (![(BMPerBatchDomainSpecificAssetCounts *)self hasSkylineAssetCount]
      && ![v5 hasSkylineAssetCount])
    {
      BOOL v33 = 1;
      goto LABEL_139;
    }
    if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSkylineAssetCount]
      && [v5 hasSkylineAssetCount])
    {
      int v32 = [(BMPerBatchDomainSpecificAssetCounts *)self skylineAssetCount];
      BOOL v33 = v32 == [v5 skylineAssetCount];
    }
    else
    {
LABEL_138:
      BOOL v33 = 0;
    }
LABEL_139:

    goto LABEL_140;
  }
  BOOL v33 = 0;
LABEL_140:

  return v33;
}

- (id)jsonDictionary
{
  v90[27] = *MEMORY[0x1E4F143B8];
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasParsedAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts parsedAssetCount](self, "parsedAssetCount"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAnyDomainAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts anyDomainAssetCount](self, "anyDomainAssetCount"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasArtAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts artAssetCount](self, "artAssetCount"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasNatureAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts natureAssetCount](self, "natureAssetCount"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAnimalsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts animalsAssetCount](self, "animalsAssetCount"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBirdsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts birdsAssetCount](self, "birdsAssetCount"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasInsectsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts insectsAssetCount](self, "insectsAssetCount"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasReptilesAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts reptilesAssetCount](self, "reptilesAssetCount"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasMammalsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mammalsAssetCount](self, "mammalsAssetCount"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasLandmarkAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts landmarkAssetCount](self, "landmarkAssetCount"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v86 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasNaturalLandmarkAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts naturalLandmarkAssetCount](self, "naturalLandmarkAssetCount"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasMediaAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mediaAssetCount](self, "mediaAssetCount"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBookAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts bookAssetCount](self, "bookAssetCount"));
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v83 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAlbumAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts albumAssetCount](self, "albumAssetCount"));
    id v82 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v82 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasCatsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts catsAssetCount](self, "catsAssetCount"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v81 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasDogsAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts dogsAssetCount](self, "dogsAssetCount"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasApparelAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts apparelAssetCount](self, "apparelAssetCount"));
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v79 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasFoodAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts foodAssetCount](self, "foodAssetCount"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasStorefrontAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts storefrontAssetCount](self, "storefrontAssetCount"));
    id v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v77 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSignSymbolAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts signSymbolAssetCount](self, "signSymbolAssetCount"));
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v76 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasLaundryCareSymbolAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts laundryCareSymbolAssetCount](self, "laundryCareSymbolAssetCount"));
    id v75 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v75 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasAutoSymbolAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts autoSymbolAssetCount](self, "autoSymbolAssetCount"));
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBrandLogoSymbolAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts brandLogoSymbolAssetCount](self, "brandLogoSymbolAssetCount"));
    id v73 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v73 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasObject2DAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts object2DAssetCount](self, "object2DAssetCount"));
    id v72 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v72 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasBarcodeDetectionAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts barcodeDetectionAssetCount](self, "barcodeDetectionAssetCount"));
    id v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v71 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSculptureAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts sculptureAssetCount](self, "sculptureAssetCount"));
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v70 = 0;
  }
  if ([(BMPerBatchDomainSpecificAssetCounts *)self hasSkylineAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts skylineAssetCount](self, "skylineAssetCount"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v89[0] = @"parsedAssetCount";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v11;
  v90[0] = v11;
  v89[1] = @"anyDomainAssetCount";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v12;
  v90[1] = v12;
  v89[2] = @"artAssetCount";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v13;
  v90[2] = v13;
  v89[3] = @"natureAssetCount";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v14;
  v90[3] = v14;
  v89[4] = @"animalsAssetCount";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v15;
  v90[4] = v15;
  v89[5] = @"birdsAssetCount";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v16;
  v90[5] = v16;
  v89[6] = @"insectsAssetCount";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v17;
  v90[6] = v17;
  v89[7] = @"reptilesAssetCount";
  uint64_t v18 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[7] = v18;
  v89[8] = @"mammalsAssetCount";
  uint64_t v19 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[8] = v19;
  v89[9] = @"landmarkAssetCount";
  uint64_t v20 = (uint64_t)v86;
  if (!v86)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = v9;
  v53 = (void *)v20;
  v90[9] = v20;
  v89[10] = @"naturalLandmarkAssetCount";
  uint64_t v21 = (uint64_t)v85;
  if (!v85)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  id v22 = v7;
  v66 = (void *)v21;
  v90[10] = v21;
  v89[11] = @"mediaAssetCount";
  uint64_t v23 = (uint64_t)v84;
  if (!v84)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = v3;
  v65 = (void *)v23;
  v90[11] = v23;
  v89[12] = @"bookAssetCount";
  uint64_t v25 = (uint64_t)v83;
  if (!v83)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v25;
  v90[12] = v25;
  v89[13] = @"albumAssetCount";
  uint64_t v27 = (uint64_t)v82;
  if (!v82)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v27;
  v90[13] = v27;
  v89[14] = @"catsAssetCount";
  uint64_t v28 = (uint64_t)v81;
  if (!v81)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v28;
  v90[14] = v28;
  v89[15] = @"dogsAssetCount";
  uint64_t v29 = (uint64_t)v80;
  if (!v80)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v29;
  v90[15] = v29;
  v89[16] = @"apparelAssetCount";
  uint64_t v30 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = v4;
  v49 = (void *)v30;
  v90[16] = v30;
  v89[17] = @"foodAssetCount";
  uint64_t v31 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v31;
  v90[17] = v31;
  v89[18] = @"storefrontAssetCount";
  uint64_t v32 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = v5;
  v47 = (void *)v32;
  v90[18] = v32;
  v89[19] = @"signSymbolAssetCount";
  uint64_t v33 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v33;
  v90[19] = v33;
  v89[20] = @"laundryCareSymbolAssetCount";
  uint64_t v34 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = v10;
  v45 = (void *)v34;
  v90[20] = v34;
  v89[21] = @"autoSymbolAssetCount";
  uint64_t v35 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v19;
  v44 = (void *)v35;
  v90[21] = v35;
  v89[22] = @"brandLogoSymbolAssetCount";
  v36 = v73;
  if (!v73)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v18;
  v90[22] = v36;
  v89[23] = @"object2DAssetCount";
  v37 = v72;
  if (!v72)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = v22;
  v90[23] = v37;
  v89[24] = @"barcodeDetectionAssetCount";
  v39 = v71;
  if (!v71)
  {
    v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[24] = v39;
  v89[25] = @"sculptureAssetCount";
  v40 = v70;
  if (!v70)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[25] = v40;
  v89[26] = @"skylineAssetCount";
  v41 = v69;
  if (!v69)
  {
    v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v90[26] = v41;
  id v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:27];
  if (!v69) {

  }
  v42 = v26;
  if (!v70)
  {

    v42 = v26;
  }
  if (!v71)
  {

    v42 = v26;
  }
  if (!v72)
  {

    v42 = v26;
  }
  if (!v73)
  {

    v42 = v26;
  }
  if (!v74)
  {

    v42 = v26;
  }
  if (!v75)
  {

    v42 = v26;
  }
  if (!v76)
  {

    v42 = v26;
  }
  if (!v77)
  {

    v42 = v26;
  }
  if (!v78)
  {

    v42 = v26;
  }
  if (!v79)
  {

    v42 = v26;
  }
  if (!v80)
  {

    v42 = v26;
  }
  if (!v81)
  {

    v42 = v26;
  }
  if (!v82)
  {

    v42 = v26;
  }
  if (!v83) {

  }
  if (!v84) {
  if (!v85)
  }

  if (!v86) {
  if (!v87)
  }

  if (v88)
  {
    if (v64) {
      goto LABEL_176;
    }
  }
  else
  {

    if (v64)
    {
LABEL_176:
      if (v8) {
        goto LABEL_177;
      }
      goto LABEL_187;
    }
  }

  if (v8)
  {
LABEL_177:
    if (v38) {
      goto LABEL_178;
    }
    goto LABEL_188;
  }
LABEL_187:

  if (v38)
  {
LABEL_178:
    if (v6) {
      goto LABEL_179;
    }
    goto LABEL_189;
  }
LABEL_188:

  if (v6)
  {
LABEL_179:
    if (v67) {
      goto LABEL_180;
    }
    goto LABEL_190;
  }
LABEL_189:

  if (v67)
  {
LABEL_180:
    if (v68) {
      goto LABEL_181;
    }
LABEL_191:

    if (v24) {
      goto LABEL_182;
    }
    goto LABEL_192;
  }
LABEL_190:

  if (!v68) {
    goto LABEL_191;
  }
LABEL_181:
  if (v24) {
    goto LABEL_182;
  }
LABEL_192:

LABEL_182:

  return v63;
}

- (BMPerBatchDomainSpecificAssetCounts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v302[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"parsedAssetCount"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v247 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v247 = v6;
LABEL_4:
    id v7 = [v5 objectForKeyedSubscript:@"anyDomainAssetCount"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v246 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v246 = v7;
LABEL_7:
      id v8 = [v5 objectForKeyedSubscript:@"artAssetCount"];
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v245 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v245 = v8;
LABEL_10:
        id v9 = [v5 objectForKeyedSubscript:@"natureAssetCount"];
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v238 = a4;
          v239 = v9;
          id v243 = 0;
LABEL_13:
          id v10 = [v5 objectForKeyedSubscript:@"animalsAssetCount"];
          if (!v10)
          {
            id v235 = 0;
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v235 = v10;
            id v10 = 0;
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v235 = v10;
            id v10 = v10;
LABEL_27:
            uint64_t v11 = [v5 objectForKeyedSubscript:@"birdsAssetCount"];
            v241 = v10;
            v237 = (void *)v11;
            if (!v11 || (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v236 = 0;
              goto LABEL_30;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v236 = v12;
LABEL_30:
              uint64_t v13 = [v5 objectForKeyedSubscript:@"insectsAssetCount"];
              v234 = (void *)v13;
              if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v233 = 0;
                goto LABEL_33;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v233 = v14;
LABEL_33:
                uint64_t v15 = [v5 objectForKeyedSubscript:@"reptilesAssetCount"];
                if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v16 = 0;
                  goto LABEL_36;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v16 = v15;
LABEL_36:
                  uint64_t v17 = [v5 objectForKeyedSubscript:@"mammalsAssetCount"];
                  v226 = v15;
                  v231 = (void *)v17;
                  if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v229 = 0;
                    goto LABEL_39;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v229 = v18;
LABEL_39:
                    uint64_t v19 = [v5 objectForKeyedSubscript:@"landmarkAssetCount"];
                    v227 = (void *)v19;
                    if (!v19 || (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v224 = 0;
                      goto LABEL_42;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v224 = v20;
LABEL_42:
                      uint64_t v21 = [v5 objectForKeyedSubscript:@"naturalLandmarkAssetCount"];
                      v223 = (void *)v21;
                      if (!v21 || (id v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v221 = 0;
                        goto LABEL_45;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v221 = v22;
LABEL_45:
                        uint64_t v23 = [v5 objectForKeyedSubscript:@"mediaAssetCount"];
                        v220 = (void *)v23;
                        if (!v23 || (int v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v218 = 0;
                          goto LABEL_48;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v218 = v24;
LABEL_48:
                          uint64_t v25 = [v5 objectForKeyedSubscript:@"bookAssetCount"];
                          v217 = (void *)v25;
                          if (!v25 || (int v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v215 = 0;
                            goto LABEL_51;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v215 = v26;
LABEL_51:
                            uint64_t v27 = [v5 objectForKeyedSubscript:@"albumAssetCount"];
                            v214 = (void *)v27;
                            if (!v27 || (uint64_t v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v212 = 0;
                              goto LABEL_54;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v212 = v28;
LABEL_54:
                              uint64_t v29 = [v5 objectForKeyedSubscript:@"catsAssetCount"];
                              v209 = (void *)v29;
                              if (!v29 || (uint64_t v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v210 = 0;
                                goto LABEL_57;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v210 = v30;
LABEL_57:
                                uint64_t v31 = [v5 objectForKeyedSubscript:@"dogsAssetCount"];
                                v206 = (void *)v31;
                                if (!v31 || (uint64_t v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v207 = 0;
                                  goto LABEL_60;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v207 = v32;
LABEL_60:
                                  uint64_t v33 = [v5 objectForKeyedSubscript:@"apparelAssetCount"];
                                  v203 = (void *)v33;
                                  if (!v33
                                    || (uint64_t v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v204 = 0;
                                    goto LABEL_63;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v204 = v34;
LABEL_63:
                                    uint64_t v35 = [v5 objectForKeyedSubscript:@"foodAssetCount"];
                                    v200 = (void *)v35;
                                    if (!v35
                                      || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v201 = 0;
                                      goto LABEL_66;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v201 = v36;
LABEL_66:
                                      uint64_t v37 = [v5 objectForKeyedSubscript:@"storefrontAssetCount"];
                                      v197 = (void *)v37;
                                      if (!v37
                                        || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v198 = 0;
                                        goto LABEL_69;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v198 = v38;
LABEL_69:
                                        uint64_t v39 = [v5 objectForKeyedSubscript:@"signSymbolAssetCount"];
                                        v194 = (void *)v39;
                                        if (!v39
                                          || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v195 = 0;
                                          goto LABEL_72;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v195 = v40;
LABEL_72:
                                          uint64_t v41 = [v5 objectForKeyedSubscript:@"laundryCareSymbolAssetCount"];
                                          v191 = (void *)v41;
                                          if (!v41
                                            || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v192 = 0;
                                            goto LABEL_75;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v192 = v42;
LABEL_75:
                                            uint64_t v43 = [v5 objectForKeyedSubscript:@"autoSymbolAssetCount"];
                                            v188 = (void *)v43;
                                            if (!v43
                                              || (v44 = (void *)v43,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v189 = 0;
                                              goto LABEL_78;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v189 = v44;
LABEL_78:
                                              uint64_t v45 = [v5 objectForKeyedSubscript:@"brandLogoSymbolAssetCount"];
                                              v185 = (void *)v45;
                                              if (!v45
                                                || (v46 = (void *)v45,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v186 = 0;
                                                goto LABEL_81;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v186 = v46;
LABEL_81:
                                                uint64_t v47 = [v5 objectForKeyedSubscript:@"object2DAssetCount"];
                                                v180 = (void *)v47;
                                                if (!v47
                                                  || (v48 = (void *)v47,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v183 = 0;
                                                  goto LABEL_84;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v183 = v48;
LABEL_84:
                                                  uint64_t v49 = [v5 objectForKeyedSubscript:@"barcodeDetectionAssetCount"];
                                                  v177 = (void *)v49;
                                                  if (!v49
                                                    || (v50 = (void *)v49,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v181 = 0;
                                                    goto LABEL_87;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v181 = v50;
LABEL_87:
                                                    uint64_t v51 = [v5 objectForKeyedSubscript:@"sculptureAssetCount"];
                                                    v176 = (void *)v51;
                                                    if (!v51
                                                      || (v52 = (void *)v51,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v178 = 0;
LABEL_90:
                                                      id v53 = [v5 objectForKeyedSubscript:@"skylineAssetCount"];
                                                      v175 = v53;
                                                      if (!v53)
                                                      {
LABEL_93:
                                                        v55 = v239;
LABEL_94:
                                                        v56 = v53;
                                                        v57 = objc_retain(-[BMPerBatchDomainSpecificAssetCounts initWithParsedAssetCount:anyDomainAssetCount:artAssetCount:natureAssetCount:animalsAssetCount:birdsAssetCount:insectsAssetCount:reptilesAssetCount:mammalsAssetCount:landmarkAssetCount:naturalLandmarkAssetCount:mediaAssetCount:bookAssetCount:albumAssetCount:catsAssetCount:dogsAssetCount:apparelAssetCount:foodAssetCount:storefrontAssetCount:signSymbolAssetCount:laundryCareSymbolAssetCount:autoSymbolAssetCount:brandLogoSymbolAssetCount:object2DAssetCount:barcodeDetectionAssetCount:sculptureAssetCount:skylineAssetCount:](self, "initWithParsedAssetCount:anyDomainAssetCount:artAssetCount:natureAssetCount:animalsAssetCount:birdsAssetCount:insectsAssetCount:reptilesAssetCount:mammalsAssetCount:landmarkAssetCount:naturalLandmarkAssetCount:mediaAssetCount:bookAssetCount:albumAssetCount:catsAssetCount:dogsAssetCount:apparelAssetCount:foodAssetCount:storefrontAssetCount:signSymbolAssetCount:laundryCareSymbolAssetCount:autoSymbolAssetCount:brandLogoSymbolAssetCount:object2DAssetCount:barcodeDetectionAssetCount:sculptureAssetCount:skylineAssetCount:", v247, v246, v245, v243, v10, v236, v233,
                                                                  v16,
                                                                  v229,
                                                                  v224,
                                                                  v221,
                                                                  v218,
                                                                  v215,
                                                                  v212,
                                                                  v210,
                                                                  v207,
                                                                  v204,
                                                                  v201,
                                                                  v198,
                                                                  v195,
                                                                  v192,
                                                                  v189,
                                                                  v186,
                                                                  v183,
                                                                  v181,
                                                                  v178,
                                                                  v53));
                                                        self = v57;
                                                        id v10 = v235;
LABEL_230:

LABEL_231:
LABEL_232:

LABEL_233:
LABEL_234:

LABEL_235:
                                                        goto LABEL_236;
                                                      }
                                                      v54 = v53;
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v53 = 0;
                                                        goto LABEL_93;
                                                      }
                                                      objc_opt_class();
                                                      v55 = v239;
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v53 = v54;
                                                        goto LABEL_94;
                                                      }
                                                      if (v238)
                                                      {
                                                        id v167 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        id v168 = v16;
                                                        uint64_t v169 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v249 = *MEMORY[0x1E4F28568];
                                                        v170 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"skylineAssetCount"];
                                                        v250 = v170;
                                                        v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v250 forKeys:&v249 count:1];
                                                        v172 = v167;
                                                        v55 = v239;
                                                        uint64_t v173 = v169;
                                                        id v16 = v168;
                                                        id *v238 = (id)[v172 initWithDomain:v173 code:2 userInfo:v171];
                                                      }
                                                      v56 = 0;
                                                      v57 = 0;
LABEL_229:
                                                      id v10 = v235;
                                                      uint64_t v15 = v226;
                                                      goto LABEL_230;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v178 = v52;
                                                      goto LABEL_90;
                                                    }
                                                    if (v238)
                                                    {
                                                      id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      id v162 = v16;
                                                      uint64_t v163 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v251 = *MEMORY[0x1E4F28568];
                                                      v56 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sculptureAssetCount"];
                                                      v252 = v56;
                                                      uint64_t v164 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v252 forKeys:&v251 count:1];
                                                      uint64_t v165 = v163;
                                                      id v16 = v162;
                                                      v175 = (void *)v164;
                                                      id v166 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v165, 2);
                                                      v57 = 0;
                                                      id v178 = 0;
                                                      id *v238 = v166;
                                                      v55 = v239;
                                                      goto LABEL_229;
                                                    }
                                                    id v178 = 0;
                                                    v57 = 0;
LABEL_266:
                                                    v55 = v239;
                                                    id v10 = v235;
                                                    goto LABEL_231;
                                                  }
                                                  if (v238)
                                                  {
                                                    id v182 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    id v157 = v16;
                                                    uint64_t v158 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v253 = *MEMORY[0x1E4F28568];
                                                    id v178 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"barcodeDetectionAssetCount"];
                                                    id v254 = v178;
                                                    uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v254 forKeys:&v253 count:1];
                                                    uint64_t v160 = v158;
                                                    id v16 = v157;
                                                    v176 = (void *)v159;
                                                    id v161 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v160, 2);
                                                    v57 = 0;
                                                    id v181 = 0;
                                                    id *v238 = v161;
                                                    goto LABEL_266;
                                                  }
                                                  id v181 = 0;
                                                  v57 = 0;
LABEL_264:
                                                  v55 = v239;
                                                  id v10 = v235;
                                                  goto LABEL_232;
                                                }
                                                if (v238)
                                                {
                                                  id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v152 = v16;
                                                  uint64_t v153 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v255 = *MEMORY[0x1E4F28568];
                                                  id v181 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"object2DAssetCount"];
                                                  id v256 = v181;
                                                  uint64_t v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v256 forKeys:&v255 count:1];
                                                  uint64_t v155 = v153;
                                                  id v16 = v152;
                                                  v177 = (void *)v154;
                                                  id v156 = (id)objc_msgSend(v184, "initWithDomain:code:userInfo:", v155, 2);
                                                  v57 = 0;
                                                  id v183 = 0;
                                                  id *v238 = v156;
                                                  goto LABEL_264;
                                                }
                                                id v183 = 0;
                                                v57 = 0;
LABEL_262:
                                                v55 = v239;
                                                id v10 = v235;
                                                goto LABEL_233;
                                              }
                                              if (v238)
                                              {
                                                id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                id v147 = v16;
                                                uint64_t v148 = *MEMORY[0x1E4F502C8];
                                                uint64_t v257 = *MEMORY[0x1E4F28568];
                                                id v183 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brandLogoSymbolAssetCount"];
                                                id v258 = v183;
                                                uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
                                                uint64_t v150 = v148;
                                                id v16 = v147;
                                                v180 = (void *)v149;
                                                id v151 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v150, 2);
                                                v57 = 0;
                                                id v186 = 0;
                                                id *v238 = v151;
                                                goto LABEL_262;
                                              }
                                              id v186 = 0;
                                              v57 = 0;
LABEL_260:
                                              v55 = v239;
                                              id v10 = v235;
                                              goto LABEL_234;
                                            }
                                            if (v238)
                                            {
                                              id v190 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v142 = v16;
                                              uint64_t v143 = *MEMORY[0x1E4F502C8];
                                              uint64_t v259 = *MEMORY[0x1E4F28568];
                                              id v186 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"autoSymbolAssetCount"];
                                              id v260 = v186;
                                              uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v260 forKeys:&v259 count:1];
                                              uint64_t v145 = v143;
                                              id v16 = v142;
                                              v185 = (void *)v144;
                                              id v146 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v145, 2);
                                              v57 = 0;
                                              id v189 = 0;
                                              id *v238 = v146;
                                              goto LABEL_260;
                                            }
                                            id v189 = 0;
                                            v57 = 0;
LABEL_258:
                                            v55 = v239;
                                            id v10 = v235;
                                            goto LABEL_235;
                                          }
                                          if (v238)
                                          {
                                            id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            id v137 = v16;
                                            uint64_t v138 = *MEMORY[0x1E4F502C8];
                                            uint64_t v261 = *MEMORY[0x1E4F28568];
                                            id v189 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"laundryCareSymbolAssetCount"];
                                            id v262 = v189;
                                            uint64_t v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v262 forKeys:&v261 count:1];
                                            uint64_t v140 = v138;
                                            id v16 = v137;
                                            v188 = (void *)v139;
                                            id v141 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v140, 2);
                                            v57 = 0;
                                            id v192 = 0;
                                            id *v238 = v141;
                                            goto LABEL_258;
                                          }
                                          id v192 = 0;
                                          v57 = 0;
LABEL_225:
                                          v55 = v239;
                                          id v10 = v235;
LABEL_236:

                                          goto LABEL_237;
                                        }
                                        if (v238)
                                        {
                                          id v196 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          id v132 = v16;
                                          uint64_t v133 = *MEMORY[0x1E4F502C8];
                                          uint64_t v263 = *MEMORY[0x1E4F28568];
                                          id v192 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"signSymbolAssetCount"];
                                          id v264 = v192;
                                          uint64_t v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v264 forKeys:&v263 count:1];
                                          uint64_t v135 = v133;
                                          id v16 = v132;
                                          v191 = (void *)v134;
                                          id v136 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v135, 2);
                                          v57 = 0;
                                          id v195 = 0;
                                          id *v238 = v136;
                                          goto LABEL_225;
                                        }
                                        id v195 = 0;
                                        v57 = 0;
LABEL_221:
                                        v55 = v239;
                                        id v10 = v235;
LABEL_237:

                                        goto LABEL_238;
                                      }
                                      if (v238)
                                      {
                                        id v199 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        id v127 = v16;
                                        uint64_t v128 = *MEMORY[0x1E4F502C8];
                                        uint64_t v265 = *MEMORY[0x1E4F28568];
                                        id v195 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"storefrontAssetCount"];
                                        id v266 = v195;
                                        uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v266 forKeys:&v265 count:1];
                                        uint64_t v130 = v128;
                                        id v16 = v127;
                                        v194 = (void *)v129;
                                        id v131 = (id)objc_msgSend(v199, "initWithDomain:code:userInfo:", v130, 2);
                                        v57 = 0;
                                        id v198 = 0;
                                        id *v238 = v131;
                                        goto LABEL_221;
                                      }
                                      id v198 = 0;
                                      v57 = 0;
LABEL_217:
                                      v55 = v239;
                                      id v10 = v235;
LABEL_238:

                                      goto LABEL_239;
                                    }
                                    if (v238)
                                    {
                                      id v202 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      id v122 = v16;
                                      uint64_t v123 = *MEMORY[0x1E4F502C8];
                                      uint64_t v267 = *MEMORY[0x1E4F28568];
                                      id v198 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"foodAssetCount"];
                                      id v268 = v198;
                                      uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:&v267 count:1];
                                      uint64_t v125 = v123;
                                      id v16 = v122;
                                      v197 = (void *)v124;
                                      id v126 = (id)objc_msgSend(v202, "initWithDomain:code:userInfo:", v125, 2);
                                      v57 = 0;
                                      id v201 = 0;
                                      id *v238 = v126;
                                      goto LABEL_217;
                                    }
                                    id v201 = 0;
                                    v57 = 0;
LABEL_213:
                                    v55 = v239;
                                    id v10 = v235;
LABEL_239:

                                    goto LABEL_240;
                                  }
                                  if (v238)
                                  {
                                    id v205 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v117 = v16;
                                    uint64_t v118 = *MEMORY[0x1E4F502C8];
                                    uint64_t v269 = *MEMORY[0x1E4F28568];
                                    id v201 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"apparelAssetCount"];
                                    id v270 = v201;
                                    uint64_t v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v270 forKeys:&v269 count:1];
                                    uint64_t v120 = v118;
                                    id v16 = v117;
                                    v200 = (void *)v119;
                                    id v121 = (id)objc_msgSend(v205, "initWithDomain:code:userInfo:", v120, 2);
                                    v57 = 0;
                                    id v204 = 0;
                                    id *v238 = v121;
                                    goto LABEL_213;
                                  }
                                  id v204 = 0;
                                  v57 = 0;
LABEL_207:
                                  v55 = v239;
                                  id v10 = v235;
LABEL_240:

                                  goto LABEL_241;
                                }
                                if (v238)
                                {
                                  id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  id v112 = v16;
                                  uint64_t v113 = *MEMORY[0x1E4F502C8];
                                  uint64_t v271 = *MEMORY[0x1E4F28568];
                                  id v204 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dogsAssetCount"];
                                  id v272 = v204;
                                  uint64_t v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
                                  uint64_t v115 = v113;
                                  id v16 = v112;
                                  v203 = (void *)v114;
                                  id v116 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v115, 2);
                                  v57 = 0;
                                  id v207 = 0;
                                  id *v238 = v116;
                                  goto LABEL_207;
                                }
                                id v207 = 0;
                                v57 = 0;
LABEL_201:
                                v55 = v239;
                                id v10 = v235;
LABEL_241:

                                goto LABEL_242;
                              }
                              if (v238)
                              {
                                id v211 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v107 = v16;
                                uint64_t v108 = *MEMORY[0x1E4F502C8];
                                uint64_t v273 = *MEMORY[0x1E4F28568];
                                id v207 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"catsAssetCount"];
                                id v274 = v207;
                                uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v274 forKeys:&v273 count:1];
                                uint64_t v110 = v108;
                                id v16 = v107;
                                v206 = (void *)v109;
                                id v111 = (id)objc_msgSend(v211, "initWithDomain:code:userInfo:", v110, 2);
                                v57 = 0;
                                id v210 = 0;
                                id *v238 = v111;
                                goto LABEL_201;
                              }
                              id v210 = 0;
                              v57 = 0;
LABEL_195:
                              v55 = v239;
                              id v10 = v235;
LABEL_242:

                              goto LABEL_243;
                            }
                            if (v238)
                            {
                              id v213 = objc_alloc(MEMORY[0x1E4F28C58]);
                              id v102 = v16;
                              uint64_t v103 = *MEMORY[0x1E4F502C8];
                              uint64_t v275 = *MEMORY[0x1E4F28568];
                              id v210 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"albumAssetCount"];
                              id v276 = v210;
                              uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v276 forKeys:&v275 count:1];
                              uint64_t v105 = v103;
                              id v16 = v102;
                              v209 = (void *)v104;
                              id v106 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v105, 2);
                              v57 = 0;
                              id v212 = 0;
                              id *v238 = v106;
                              goto LABEL_195;
                            }
                            id v212 = 0;
                            v57 = 0;
LABEL_189:
                            v55 = v239;
                            id v10 = v235;
LABEL_243:

                            goto LABEL_244;
                          }
                          if (v238)
                          {
                            id v216 = objc_alloc(MEMORY[0x1E4F28C58]);
                            id v97 = v16;
                            uint64_t v98 = *MEMORY[0x1E4F502C8];
                            uint64_t v277 = *MEMORY[0x1E4F28568];
                            id v212 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bookAssetCount"];
                            id v278 = v212;
                            uint64_t v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v278 forKeys:&v277 count:1];
                            uint64_t v100 = v98;
                            id v16 = v97;
                            v214 = (void *)v99;
                            id v101 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v100, 2);
                            v57 = 0;
                            id v215 = 0;
                            id *v238 = v101;
                            goto LABEL_189;
                          }
                          id v215 = 0;
                          v57 = 0;
LABEL_183:
                          v55 = v239;
                          id v10 = v235;
LABEL_244:

                          goto LABEL_245;
                        }
                        if (v238)
                        {
                          id v219 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v92 = v16;
                          uint64_t v93 = *MEMORY[0x1E4F502C8];
                          uint64_t v279 = *MEMORY[0x1E4F28568];
                          id v215 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaAssetCount"];
                          id v280 = v215;
                          uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v280 forKeys:&v279 count:1];
                          uint64_t v95 = v93;
                          id v16 = v92;
                          v217 = (void *)v94;
                          id v96 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v95, 2);
                          v57 = 0;
                          id v218 = 0;
                          id *v238 = v96;
                          goto LABEL_183;
                        }
                        id v218 = 0;
                        v57 = 0;
LABEL_177:
                        v55 = v239;
                        id v10 = v235;
LABEL_245:

                        goto LABEL_246;
                      }
                      if (v238)
                      {
                        id v222 = objc_alloc(MEMORY[0x1E4F28C58]);
                        id v87 = v16;
                        uint64_t v88 = *MEMORY[0x1E4F502C8];
                        uint64_t v281 = *MEMORY[0x1E4F28568];
                        id v218 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"naturalLandmarkAssetCount"];
                        id v282 = v218;
                        uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v282 forKeys:&v281 count:1];
                        uint64_t v90 = v88;
                        id v16 = v87;
                        v220 = (void *)v89;
                        id v91 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v90, 2);
                        v57 = 0;
                        id v221 = 0;
                        id *v238 = v91;
                        goto LABEL_177;
                      }
                      id v221 = 0;
                      v57 = 0;
LABEL_171:
                      v55 = v239;
                      id v10 = v235;
LABEL_246:

                      goto LABEL_247;
                    }
                    if (v238)
                    {
                      id v225 = objc_alloc(MEMORY[0x1E4F28C58]);
                      id v82 = v16;
                      uint64_t v83 = *MEMORY[0x1E4F502C8];
                      uint64_t v283 = *MEMORY[0x1E4F28568];
                      id v221 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"landmarkAssetCount"];
                      id v284 = v221;
                      uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v284 forKeys:&v283 count:1];
                      uint64_t v85 = v83;
                      id v16 = v82;
                      v223 = (void *)v84;
                      id v86 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v85, 2);
                      v57 = 0;
                      id v224 = 0;
                      id *v238 = v86;
                      goto LABEL_171;
                    }
                    id v224 = 0;
                    v57 = 0;
LABEL_165:
                    v55 = v239;
                    id v10 = v235;
LABEL_247:

                    goto LABEL_248;
                  }
                  if (v238)
                  {
                    id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v77 = v16;
                    uint64_t v78 = *MEMORY[0x1E4F502C8];
                    uint64_t v285 = *MEMORY[0x1E4F28568];
                    id v224 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mammalsAssetCount"];
                    id v286 = v224;
                    uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
                    uint64_t v80 = v78;
                    id v16 = v77;
                    v227 = (void *)v79;
                    id v81 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v80, 2);
                    v57 = 0;
                    id v229 = 0;
                    id *v238 = v81;
                    goto LABEL_165;
                  }
                  id v229 = 0;
                  v57 = 0;
                  v55 = v239;
                  id v10 = v235;
LABEL_248:

                  goto LABEL_249;
                }
                id v16 = v238;
                if (v238)
                {
                  id v232 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v228 = *MEMORY[0x1E4F502C8];
                  uint64_t v287 = *MEMORY[0x1E4F28568];
                  id v229 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"reptilesAssetCount"];
                  id v288 = v229;
                  uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
                  id v76 = v232;
                  v231 = (void *)v75;
                  v57 = 0;
                  id *v238 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v228, 2);
                  id v16 = 0;
                  v55 = v239;
                  id v10 = v235;
                  goto LABEL_248;
                }
                v57 = 0;
LABEL_154:
                v55 = v239;
                id v10 = v235;
LABEL_249:

                goto LABEL_250;
              }
              if (v238)
              {
                id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v71 = *MEMORY[0x1E4F502C8];
                uint64_t v289 = *MEMORY[0x1E4F28568];
                uint64_t v72 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"insectsAssetCount"];
                uint64_t v290 = v72;
                uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v290 forKeys:&v289 count:1];
                uint64_t v74 = v71;
                id v16 = (id)v72;
                v57 = 0;
                id v233 = 0;
                id *v238 = (id)[v70 initWithDomain:v74 code:2 userInfo:v73];
                uint64_t v15 = (void *)v73;
                goto LABEL_154;
              }
              id v233 = 0;
              v57 = 0;
LABEL_148:
              v55 = v239;
              id v10 = v235;
LABEL_250:

              goto LABEL_251;
            }
            if (v238)
            {
              id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v69 = *MEMORY[0x1E4F502C8];
              uint64_t v291 = *MEMORY[0x1E4F28568];
              id v233 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"birdsAssetCount"];
              id v292 = v233;
              v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
              v57 = 0;
              id v236 = 0;
              id *v238 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2);
              goto LABEL_148;
            }
            id v236 = 0;
            v57 = 0;
            v55 = v239;
            id v10 = v235;
LABEL_251:

            goto LABEL_252;
          }
          if (v238)
          {
            id v242 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v66 = *MEMORY[0x1E4F502C8];
            uint64_t v293 = *MEMORY[0x1E4F28568];
            id v236 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"animalsAssetCount"];
            id v294 = v236;
            v237 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v294 forKeys:&v293 count:1];
            id v67 = (id)objc_msgSend(v242, "initWithDomain:code:userInfo:", v66, 2);
            v57 = 0;
            v241 = 0;
            id *v238 = v67;
            v55 = v239;
            goto LABEL_251;
          }
          v241 = 0;
          v57 = 0;
          v55 = v239;
LABEL_252:

          goto LABEL_253;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v238 = a4;
          v239 = v9;
          id v243 = v9;
          goto LABEL_13;
        }
        v55 = v9;
        if (a4)
        {
          id v244 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v240 = *MEMORY[0x1E4F502C8];
          uint64_t v295 = *MEMORY[0x1E4F28568];
          v64 = a4;
          v241 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"natureAssetCount"];
          v296 = v241;
          id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v296 forKeys:&v295 count:1];
          id v65 = (id)[v244 initWithDomain:v240 code:2 userInfo:v10];
          v57 = 0;
          id v243 = 0;
          id *v64 = v65;
          goto LABEL_252;
        }
        id v243 = 0;
        v57 = 0;
LABEL_253:

        goto LABEL_254;
      }
      if (a4)
      {
        id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v63 = *MEMORY[0x1E4F502C8];
        uint64_t v297 = *MEMORY[0x1E4F28568];
        id v243 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"artAssetCount"];
        id v298 = v243;
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v298 forKeys:&v297 count:1];
        v57 = 0;
        id v245 = 0;
        *a4 = (id)[v62 initWithDomain:v63 code:2 userInfo:v55];
        goto LABEL_253;
      }
      id v245 = 0;
      v57 = 0;
LABEL_254:

      goto LABEL_255;
    }
    if (a4)
    {
      id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v61 = *MEMORY[0x1E4F502C8];
      uint64_t v299 = *MEMORY[0x1E4F28568];
      id v245 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"anyDomainAssetCount"];
      id v300 = v245;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
      v57 = 0;
      id v246 = 0;
      *a4 = (id)[v60 initWithDomain:v61 code:2 userInfo:v8];
      goto LABEL_254;
    }
    id v246 = 0;
    v57 = 0;
LABEL_255:

    goto LABEL_256;
  }
  if (a4)
  {
    id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v59 = *MEMORY[0x1E4F502C8];
    uint64_t v301 = *MEMORY[0x1E4F28568];
    id v246 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"parsedAssetCount"];
    v302[0] = v246;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v302 forKeys:&v301 count:1];
    v57 = 0;
    id v247 = 0;
    *a4 = (id)[v58 initWithDomain:v59 code:2 userInfo:v7];
    goto LABEL_255;
  }
  v57 = 0;
  id v247 = 0;
LABEL_256:

  return v57;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPerBatchDomainSpecificAssetCounts *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasParsedAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAnyDomainAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasArtAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNatureAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAnimalsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBirdsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasInsectsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasReptilesAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMammalsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLandmarkAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNaturalLandmarkAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMediaAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBookAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAlbumAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCatsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDogsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasApparelAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasFoodAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasStorefrontAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSignSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAutoSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasObject2DAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSculptureAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSkylineAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v160.receiver = self;
  v160.super_class = (Class)BMPerBatchDomainSpecificAssetCounts;
  id v5 = [(BMEventBase *)&v160 init];
  if (!v5) {
    goto LABEL_274;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasParsedAssetCount = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
              goto LABEL_238;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              break;
            }
            int v25 = 0;
            v19 += 7;
            int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
            BOOL v27 = v20++ > 8;
            if (v27) {
              goto LABEL_242;
            }
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
          goto LABEL_239;
        case 2u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v21 = 0;
          v5->_hasAnyDomainAssetCount = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
              goto LABEL_238;
            }
            char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              int v25 = 0;
              v28 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
              BOOL v27 = v29++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
          goto LABEL_239;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v21 = 0;
          v5->_hasArtAssetCount = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
              goto LABEL_238;
            }
            char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v36 + 1;
            v21 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              int v25 = 0;
              v33 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
              BOOL v27 = v34++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
          goto LABEL_239;
        case 4u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v21 = 0;
          v5->_hasNatureAssetCount = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            unint64_t v41 = *(void *)&v4[v40];
            if (v41 == -1 || v41 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
              goto LABEL_238;
            }
            char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 1;
            v21 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              int v25 = 0;
              v38 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
              BOOL v27 = v39++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
          goto LABEL_239;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v21 = 0;
          v5->_hasAnimalsAssetCount = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            unint64_t v46 = *(void *)&v4[v45];
            if (v46 == -1 || v46 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
              goto LABEL_238;
            }
            char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
            *(void *)&v4[v45] = v46 + 1;
            v21 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              int v25 = 0;
              v43 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
              BOOL v27 = v44++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
          goto LABEL_239;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v21 = 0;
          v5->_hasBirdsAssetCount = 1;
          while (2)
          {
            uint64_t v50 = *v6;
            unint64_t v51 = *(void *)&v4[v50];
            if (v51 == -1 || v51 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
              goto LABEL_238;
            }
            char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
            *(void *)&v4[v50] = v51 + 1;
            v21 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              int v25 = 0;
              v48 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
              BOOL v27 = v49++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
          goto LABEL_239;
        case 7u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v21 = 0;
          v5->_hasInsectsAssetCount = 1;
          while (2)
          {
            uint64_t v55 = *v6;
            unint64_t v56 = *(void *)&v4[v55];
            if (v56 == -1 || v56 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
              goto LABEL_238;
            }
            char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v56);
            *(void *)&v4[v55] = v56 + 1;
            v21 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              int v25 = 0;
              v53 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
              BOOL v27 = v54++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
          goto LABEL_239;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v21 = 0;
          v5->_hasReptilesAssetCount = 1;
          while (2)
          {
            uint64_t v60 = *v6;
            unint64_t v61 = *(void *)&v4[v60];
            if (v61 == -1 || v61 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
              goto LABEL_238;
            }
            char v62 = *(unsigned char *)(*(void *)&v4[*v9] + v61);
            *(void *)&v4[v60] = v61 + 1;
            v21 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              int v25 = 0;
              v58 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
              BOOL v27 = v59++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
          goto LABEL_239;
        case 9u:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v21 = 0;
          v5->_hasMammalsAssetCount = 1;
          while (2)
          {
            uint64_t v65 = *v6;
            unint64_t v66 = *(void *)&v4[v65];
            if (v66 == -1 || v66 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
              goto LABEL_238;
            }
            char v67 = *(unsigned char *)(*(void *)&v4[*v9] + v66);
            *(void *)&v4[v65] = v66 + 1;
            v21 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              int v25 = 0;
              v63 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
              BOOL v27 = v64++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
          goto LABEL_239;
        case 0xAu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v21 = 0;
          v5->_hasLandmarkAssetCount = 1;
          while (2)
          {
            uint64_t v70 = *v6;
            unint64_t v71 = *(void *)&v4[v70];
            if (v71 == -1 || v71 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
              goto LABEL_238;
            }
            char v72 = *(unsigned char *)(*(void *)&v4[*v9] + v71);
            *(void *)&v4[v70] = v71 + 1;
            v21 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              int v25 = 0;
              v68 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
              BOOL v27 = v69++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
          goto LABEL_239;
        case 0xBu:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v21 = 0;
          v5->_hasNaturalLandmarkAssetCount = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            unint64_t v76 = *(void *)&v4[v75];
            if (v76 == -1 || v76 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
              goto LABEL_238;
            }
            char v77 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
            *(void *)&v4[v75] = v76 + 1;
            v21 |= (unint64_t)(v77 & 0x7F) << v73;
            if (v77 < 0)
            {
              int v25 = 0;
              v73 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
              BOOL v27 = v74++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
          goto LABEL_239;
        case 0xCu:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v21 = 0;
          v5->_hasMediaAssetCount = 1;
          while (2)
          {
            uint64_t v80 = *v6;
            unint64_t v81 = *(void *)&v4[v80];
            if (v81 == -1 || v81 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
              goto LABEL_238;
            }
            char v82 = *(unsigned char *)(*(void *)&v4[*v9] + v81);
            *(void *)&v4[v80] = v81 + 1;
            v21 |= (unint64_t)(v82 & 0x7F) << v78;
            if (v82 < 0)
            {
              int v25 = 0;
              v78 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
              BOOL v27 = v79++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
          goto LABEL_239;
        case 0xDu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v21 = 0;
          v5->_hasBookAssetCount = 1;
          while (2)
          {
            uint64_t v85 = *v6;
            unint64_t v86 = *(void *)&v4[v85];
            if (v86 == -1 || v86 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
              goto LABEL_238;
            }
            char v87 = *(unsigned char *)(*(void *)&v4[*v9] + v86);
            *(void *)&v4[v85] = v86 + 1;
            v21 |= (unint64_t)(v87 & 0x7F) << v83;
            if (v87 < 0)
            {
              int v25 = 0;
              v83 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
              BOOL v27 = v84++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
          goto LABEL_239;
        case 0xEu:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v21 = 0;
          v5->_hasAlbumAssetCount = 1;
          while (2)
          {
            uint64_t v90 = *v6;
            unint64_t v91 = *(void *)&v4[v90];
            if (v91 == -1 || v91 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
              goto LABEL_238;
            }
            char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v91);
            *(void *)&v4[v90] = v91 + 1;
            v21 |= (unint64_t)(v92 & 0x7F) << v88;
            if (v92 < 0)
            {
              int v25 = 0;
              v88 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
              BOOL v27 = v89++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
          goto LABEL_239;
        case 0xFu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v21 = 0;
          v5->_hasCatsAssetCount = 1;
          while (2)
          {
            uint64_t v95 = *v6;
            unint64_t v96 = *(void *)&v4[v95];
            if (v96 == -1 || v96 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
              goto LABEL_238;
            }
            char v97 = *(unsigned char *)(*(void *)&v4[*v9] + v96);
            *(void *)&v4[v95] = v96 + 1;
            v21 |= (unint64_t)(v97 & 0x7F) << v93;
            if (v97 < 0)
            {
              int v25 = 0;
              v93 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
              BOOL v27 = v94++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
          goto LABEL_239;
        case 0x10u:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v21 = 0;
          v5->_hasDogsAssetCount = 1;
          while (2)
          {
            uint64_t v100 = *v6;
            unint64_t v101 = *(void *)&v4[v100];
            if (v101 == -1 || v101 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
              goto LABEL_238;
            }
            char v102 = *(unsigned char *)(*(void *)&v4[*v9] + v101);
            *(void *)&v4[v100] = v101 + 1;
            v21 |= (unint64_t)(v102 & 0x7F) << v98;
            if (v102 < 0)
            {
              int v25 = 0;
              v98 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
              BOOL v27 = v99++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
          goto LABEL_239;
        case 0x11u:
          char v103 = 0;
          unsigned int v104 = 0;
          uint64_t v21 = 0;
          v5->_hasApparelAssetCount = 1;
          while (2)
          {
            uint64_t v105 = *v6;
            unint64_t v106 = *(void *)&v4[v105];
            if (v106 == -1 || v106 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
              goto LABEL_238;
            }
            char v107 = *(unsigned char *)(*(void *)&v4[*v9] + v106);
            *(void *)&v4[v105] = v106 + 1;
            v21 |= (unint64_t)(v107 & 0x7F) << v103;
            if (v107 < 0)
            {
              int v25 = 0;
              v103 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
              BOOL v27 = v104++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
          goto LABEL_239;
        case 0x12u:
          char v108 = 0;
          unsigned int v109 = 0;
          uint64_t v21 = 0;
          v5->_hasFoodAssetCount = 1;
          while (2)
          {
            uint64_t v110 = *v6;
            unint64_t v111 = *(void *)&v4[v110];
            if (v111 == -1 || v111 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
              goto LABEL_238;
            }
            char v112 = *(unsigned char *)(*(void *)&v4[*v9] + v111);
            *(void *)&v4[v110] = v111 + 1;
            v21 |= (unint64_t)(v112 & 0x7F) << v108;
            if (v112 < 0)
            {
              int v25 = 0;
              v108 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
              BOOL v27 = v109++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
          goto LABEL_239;
        case 0x13u:
          char v113 = 0;
          unsigned int v114 = 0;
          uint64_t v21 = 0;
          v5->_hasStorefrontAssetCount = 1;
          while (2)
          {
            uint64_t v115 = *v6;
            unint64_t v116 = *(void *)&v4[v115];
            if (v116 == -1 || v116 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
              goto LABEL_238;
            }
            char v117 = *(unsigned char *)(*(void *)&v4[*v9] + v116);
            *(void *)&v4[v115] = v116 + 1;
            v21 |= (unint64_t)(v117 & 0x7F) << v113;
            if (v117 < 0)
            {
              int v25 = 0;
              v113 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
              BOOL v27 = v114++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
          goto LABEL_239;
        case 0x14u:
          char v118 = 0;
          unsigned int v119 = 0;
          uint64_t v21 = 0;
          v5->_hasSignSymbolAssetCount = 1;
          while (2)
          {
            uint64_t v120 = *v6;
            unint64_t v121 = *(void *)&v4[v120];
            if (v121 == -1 || v121 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
              goto LABEL_238;
            }
            char v122 = *(unsigned char *)(*(void *)&v4[*v9] + v121);
            *(void *)&v4[v120] = v121 + 1;
            v21 |= (unint64_t)(v122 & 0x7F) << v118;
            if (v122 < 0)
            {
              int v25 = 0;
              v118 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
              BOOL v27 = v119++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
          goto LABEL_239;
        case 0x15u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v21 = 0;
          v5->_hasLaundryCareSymbolAssetCount = 1;
          while (2)
          {
            uint64_t v125 = *v6;
            unint64_t v126 = *(void *)&v4[v125];
            if (v126 == -1 || v126 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
              goto LABEL_238;
            }
            char v127 = *(unsigned char *)(*(void *)&v4[*v9] + v126);
            *(void *)&v4[v125] = v126 + 1;
            v21 |= (unint64_t)(v127 & 0x7F) << v123;
            if (v127 < 0)
            {
              int v25 = 0;
              v123 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
              BOOL v27 = v124++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
          goto LABEL_239;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v21 = 0;
          v5->_hasAutoSymbolAssetCount = 1;
          while (2)
          {
            uint64_t v130 = *v6;
            unint64_t v131 = *(void *)&v4[v130];
            if (v131 == -1 || v131 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
              goto LABEL_238;
            }
            char v132 = *(unsigned char *)(*(void *)&v4[*v9] + v131);
            *(void *)&v4[v130] = v131 + 1;
            v21 |= (unint64_t)(v132 & 0x7F) << v128;
            if (v132 < 0)
            {
              int v25 = 0;
              v128 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
              BOOL v27 = v129++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
          goto LABEL_239;
        case 0x17u:
          char v133 = 0;
          unsigned int v134 = 0;
          uint64_t v21 = 0;
          v5->_hasBrandLogoSymbolAssetCount = 1;
          while (2)
          {
            uint64_t v135 = *v6;
            unint64_t v136 = *(void *)&v4[v135];
            if (v136 == -1 || v136 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
              goto LABEL_238;
            }
            char v137 = *(unsigned char *)(*(void *)&v4[*v9] + v136);
            *(void *)&v4[v135] = v136 + 1;
            v21 |= (unint64_t)(v137 & 0x7F) << v133;
            if (v137 < 0)
            {
              int v25 = 0;
              v133 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
              BOOL v27 = v134++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
          goto LABEL_239;
        case 0x18u:
          char v138 = 0;
          unsigned int v139 = 0;
          uint64_t v21 = 0;
          v5->_hasObject2DAssetCount = 1;
          while (2)
          {
            uint64_t v140 = *v6;
            unint64_t v141 = *(void *)&v4[v140];
            if (v141 == -1 || v141 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
              goto LABEL_238;
            }
            char v142 = *(unsigned char *)(*(void *)&v4[*v9] + v141);
            *(void *)&v4[v140] = v141 + 1;
            v21 |= (unint64_t)(v142 & 0x7F) << v138;
            if (v142 < 0)
            {
              int v25 = 0;
              v138 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
              BOOL v27 = v139++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
          goto LABEL_239;
        case 0x19u:
          char v143 = 0;
          unsigned int v144 = 0;
          uint64_t v21 = 0;
          v5->_hasBarcodeDetectionAssetCount = 1;
          while (2)
          {
            uint64_t v145 = *v6;
            unint64_t v146 = *(void *)&v4[v145];
            if (v146 == -1 || v146 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
              goto LABEL_238;
            }
            char v147 = *(unsigned char *)(*(void *)&v4[*v9] + v146);
            *(void *)&v4[v145] = v146 + 1;
            v21 |= (unint64_t)(v147 & 0x7F) << v143;
            if (v147 < 0)
            {
              int v25 = 0;
              v143 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
              BOOL v27 = v144++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
          goto LABEL_239;
        case 0x1Au:
          char v148 = 0;
          unsigned int v149 = 0;
          uint64_t v21 = 0;
          v5->_hasSculptureAssetCount = 1;
          while (2)
          {
            uint64_t v150 = *v6;
            unint64_t v151 = *(void *)&v4[v150];
            if (v151 == -1 || v151 >= *(void *)&v4[*v7])
            {
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
              goto LABEL_238;
            }
            char v152 = *(unsigned char *)(*(void *)&v4[*v9] + v151);
            *(void *)&v4[v150] = v151 + 1;
            v21 |= (unint64_t)(v152 & 0x7F) << v148;
            if (v152 < 0)
            {
              int v25 = 0;
              v148 += 7;
              int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
              BOOL v27 = v149++ > 8;
              if (v27) {
                goto LABEL_242;
              }
              continue;
            }
            break;
          }
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
          goto LABEL_239;
        case 0x1Bu:
          char v153 = 0;
          unsigned int v154 = 0;
          uint64_t v21 = 0;
          v5->_hasSkylineAssetCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_273;
          }
          continue;
      }
      while (1)
      {
        uint64_t v155 = *v6;
        unint64_t v156 = *(void *)&v4[v155];
        if (v156 == -1 || v156 >= *(void *)&v4[*v7]) {
          break;
        }
        char v157 = *(unsigned char *)(*(void *)&v4[*v9] + v156);
        *(void *)&v4[v155] = v156 + 1;
        v21 |= (unint64_t)(v157 & 0x7F) << v153;
        if ((v157 & 0x80) == 0)
        {
          int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
          goto LABEL_239;
        }
        int v25 = 0;
        v153 += 7;
        int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
        BOOL v27 = v154++ > 8;
        if (v27) {
          goto LABEL_242;
        }
      }
      int v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
LABEL_238:
      v4[*v8] = 1;
LABEL_239:
      int v25 = v4[*v8] ? 0 : v21;
LABEL_242:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_273:
  }
    uint64_t v158 = 0;
  else {
LABEL_274:
  }
    uint64_t v158 = v5;

  return v158;
}

- (NSString)description
{
  id v19 = [NSString alloc];
  char v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts parsedAssetCount](self, "parsedAssetCount"));
  unint64_t v31 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts anyDomainAssetCount](self, "anyDomainAssetCount"));
  uint64_t v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts artAssetCount](self, "artAssetCount"));
  unsigned int v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts natureAssetCount](self, "natureAssetCount"));
  char v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts animalsAssetCount](self, "animalsAssetCount"));
  BOOL v27 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts birdsAssetCount](self, "birdsAssetCount"));
  int v26 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts insectsAssetCount](self, "insectsAssetCount"));
  int v25 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts reptilesAssetCount](self, "reptilesAssetCount"));
  char v24 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mammalsAssetCount](self, "mammalsAssetCount"));
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts landmarkAssetCount](self, "landmarkAssetCount"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts naturalLandmarkAssetCount](self, "naturalLandmarkAssetCount"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mediaAssetCount](self, "mediaAssetCount"));
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts bookAssetCount](self, "bookAssetCount"));
  int v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts albumAssetCount](self, "albumAssetCount"));
  id v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts catsAssetCount](self, "catsAssetCount"));
  char v15 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts dogsAssetCount](self, "dogsAssetCount"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts apparelAssetCount](self, "apparelAssetCount"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts foodAssetCount](self, "foodAssetCount"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts storefrontAssetCount](self, "storefrontAssetCount"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts signSymbolAssetCount](self, "signSymbolAssetCount"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts laundryCareSymbolAssetCount](self, "laundryCareSymbolAssetCount"));
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts autoSymbolAssetCount](self, "autoSymbolAssetCount"));
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts brandLogoSymbolAssetCount](self, "brandLogoSymbolAssetCount"));
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts object2DAssetCount](self, "object2DAssetCount"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts barcodeDetectionAssetCount](self, "barcodeDetectionAssetCount"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts sculptureAssetCount](self, "sculptureAssetCount"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts skylineAssetCount](self, "skylineAssetCount"));
  unsigned int v20 = objc_msgSend(v19, "initWithFormat:", @"BMPerBatchDomainSpecificAssetCounts with parsedAssetCount: %@, anyDomainAssetCount: %@, artAssetCount: %@, natureAssetCount: %@, animalsAssetCount: %@, birdsAssetCount: %@, insectsAssetCount: %@, reptilesAssetCount: %@, mammalsAssetCount: %@, landmarkAssetCount: %@, naturalLandmarkAssetCount: %@, mediaAssetCount: %@, bookAssetCount: %@, albumAssetCount: %@, catsAssetCount: %@, dogsAssetCount: %@, apparelAssetCount: %@, foodAssetCount: %@, storefrontAssetCount: %@, signSymbolAssetCount: %@, laundryCareSymbolAssetCount: %@, autoSymbolAssetCount: %@, brandLogoSymbolAssetCount: %@, object2DAssetCount: %@, barcodeDetectionAssetCount: %@, sculptureAssetCount: %@, skylineAssetCount: %@", v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v10,
                  v9,
                  v8,
                  v3,
                  v4,
                  v5,
                  v6);

  return (NSString *)v20;
}

- (BMPerBatchDomainSpecificAssetCounts)initWithParsedAssetCount:(id)a3 anyDomainAssetCount:(id)a4 artAssetCount:(id)a5 natureAssetCount:(id)a6 animalsAssetCount:(id)a7 birdsAssetCount:(id)a8 insectsAssetCount:(id)a9 reptilesAssetCount:(id)a10 mammalsAssetCount:(id)a11 landmarkAssetCount:(id)a12 naturalLandmarkAssetCount:(id)a13 mediaAssetCount:(id)a14 bookAssetCount:(id)a15 albumAssetCount:(id)a16 catsAssetCount:(id)a17 dogsAssetCount:(id)a18 apparelAssetCount:(id)a19 foodAssetCount:(id)a20 storefrontAssetCount:(id)a21 signSymbolAssetCount:(id)a22 laundryCareSymbolAssetCount:(id)a23 autoSymbolAssetCount:(id)a24 brandLogoSymbolAssetCount:(id)a25 object2DAssetCount:(id)a26 barcodeDetectionAssetCount:(id)a27 sculptureAssetCount:(id)a28 skylineAssetCount:(id)a29
{
  id v90 = a3;
  id v89 = a4;
  id v88 = a5;
  id v87 = a6;
  id v86 = a7;
  id v85 = a8;
  id v84 = a9;
  id v83 = a10;
  id v82 = a11;
  id v81 = a12;
  id v80 = a13;
  id v79 = a14;
  id v78 = a15;
  id v77 = a16;
  id v76 = a17;
  id v75 = a18;
  id v74 = a19;
  id v73 = a20;
  id v34 = a21;
  id v35 = a22;
  id v36 = a23;
  id v37 = a24;
  id v38 = a25;
  id v39 = a26;
  id v40 = a27;
  id v41 = a28;
  id v42 = a29;
  v91.receiver = self;
  v91.super_class = (Class)BMPerBatchDomainSpecificAssetCounts;
  char v43 = [(BMEventBase *)&v91 init];
  if (v43)
  {
    v43->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v90)
    {
      v43->_hasParsedAssetCount = 1;
      int v44 = [v90 intValue];
    }
    else
    {
      v43->_hasParsedAssetCount = 0;
      int v44 = -1;
    }
    v43->_parsedAssetCount = v44;
    if (v89)
    {
      v43->_hasAnyDomainAssetCount = 1;
      int v45 = [v89 intValue];
    }
    else
    {
      v43->_hasAnyDomainAssetCount = 0;
      int v45 = -1;
    }
    v43->_anyDomainAssetCount = v45;
    if (v88)
    {
      v43->_hasArtAssetCount = 1;
      int v46 = [v88 intValue];
    }
    else
    {
      v43->_hasArtAssetCount = 0;
      int v46 = -1;
    }
    v43->_artAssetCount = v46;
    if (v87)
    {
      v43->_hasNatureAssetCount = 1;
      int v47 = [v87 intValue];
    }
    else
    {
      v43->_hasNatureAssetCount = 0;
      int v47 = -1;
    }
    v43->_natureAssetCount = v47;
    if (v86)
    {
      v43->_hasAnimalsAssetCount = 1;
      int v48 = [v86 intValue];
    }
    else
    {
      v43->_hasAnimalsAssetCount = 0;
      int v48 = -1;
    }
    v43->_animalsAssetCount = v48;
    if (v85)
    {
      v43->_hasBirdsAssetCount = 1;
      int v49 = [v85 intValue];
    }
    else
    {
      v43->_hasBirdsAssetCount = 0;
      int v49 = -1;
    }
    v43->_birdsAssetCount = v49;
    if (v84)
    {
      v43->_hasInsectsAssetCount = 1;
      int v50 = [v84 intValue];
    }
    else
    {
      v43->_hasInsectsAssetCount = 0;
      int v50 = -1;
    }
    v43->_insectsAssetCount = v50;
    if (v83)
    {
      v43->_hasReptilesAssetCount = 1;
      int v51 = [v83 intValue];
    }
    else
    {
      v43->_hasReptilesAssetCount = 0;
      int v51 = -1;
    }
    v43->_reptilesAssetCount = v51;
    if (v82)
    {
      v43->_hasMammalsAssetCount = 1;
      int v52 = [v82 intValue];
    }
    else
    {
      v43->_hasMammalsAssetCount = 0;
      int v52 = -1;
    }
    v43->_mammalsAssetCount = v52;
    if (v81)
    {
      v43->_hasLandmarkAssetCount = 1;
      int v53 = [v81 intValue];
    }
    else
    {
      v43->_hasLandmarkAssetCount = 0;
      int v53 = -1;
    }
    v43->_landmarkAssetCount = v53;
    if (v80)
    {
      v43->_hasNaturalLandmarkAssetCount = 1;
      int v54 = [v80 intValue];
    }
    else
    {
      v43->_hasNaturalLandmarkAssetCount = 0;
      int v54 = -1;
    }
    v43->_naturalLandmarkAssetCount = v54;
    if (v79)
    {
      v43->_hasMediaAssetCount = 1;
      int v55 = [v79 intValue];
    }
    else
    {
      v43->_hasMediaAssetCount = 0;
      int v55 = -1;
    }
    v43->_mediaAssetCount = v55;
    if (v78)
    {
      v43->_hasBookAssetCount = 1;
      int v56 = [v78 intValue];
    }
    else
    {
      v43->_hasBookAssetCount = 0;
      int v56 = -1;
    }
    v43->_bookAssetCount = v56;
    if (v77)
    {
      v43->_hasAlbumAssetCount = 1;
      int v57 = [v77 intValue];
    }
    else
    {
      v43->_hasAlbumAssetCount = 0;
      int v57 = -1;
    }
    v43->_albumAssetCount = v57;
    if (v76)
    {
      v43->_hasCatsAssetCount = 1;
      int v58 = [v76 intValue];
    }
    else
    {
      v43->_hasCatsAssetCount = 0;
      int v58 = -1;
    }
    v43->_catsAssetCount = v58;
    if (v75)
    {
      v43->_hasDogsAssetCount = 1;
      int v59 = [v75 intValue];
    }
    else
    {
      v43->_hasDogsAssetCount = 0;
      int v59 = -1;
    }
    v43->_dogsAssetCount = v59;
    if (v74)
    {
      v43->_hasApparelAssetCount = 1;
      int v60 = [v74 intValue];
    }
    else
    {
      v43->_hasApparelAssetCount = 0;
      int v60 = -1;
    }
    v43->_apparelAssetCount = v60;
    if (v73)
    {
      v43->_hasFoodAssetCount = 1;
      int v61 = [v73 intValue];
    }
    else
    {
      v43->_hasFoodAssetCount = 0;
      int v61 = -1;
    }
    v43->_foodAssetCount = v61;
    if (v34)
    {
      v43->_hasStorefrontAssetCount = 1;
      int v62 = [v34 intValue];
    }
    else
    {
      v43->_hasStorefrontAssetCount = 0;
      int v62 = -1;
    }
    v43->_storefrontAssetCount = v62;
    if (v35)
    {
      v43->_hasSignSymbolAssetCount = 1;
      int v63 = [v35 intValue];
    }
    else
    {
      v43->_hasSignSymbolAssetCount = 0;
      int v63 = -1;
    }
    v43->_signSymbolAssetCount = v63;
    if (v36)
    {
      v43->_hasLaundryCareSymbolAssetCount = 1;
      int v64 = [v36 intValue];
    }
    else
    {
      v43->_hasLaundryCareSymbolAssetCount = 0;
      int v64 = -1;
    }
    v43->_laundryCareSymbolAssetCount = v64;
    if (v37)
    {
      v43->_hasAutoSymbolAssetCount = 1;
      int v65 = [v37 intValue];
    }
    else
    {
      v43->_hasAutoSymbolAssetCount = 0;
      int v65 = -1;
    }
    v43->_autoSymbolAssetCount = v65;
    if (v38)
    {
      v43->_hasBrandLogoSymbolAssetCount = 1;
      int v66 = [v38 intValue];
    }
    else
    {
      v43->_hasBrandLogoSymbolAssetCount = 0;
      int v66 = -1;
    }
    v43->_brandLogoSymbolAssetCount = v66;
    if (v39)
    {
      v43->_hasObject2DAssetCount = 1;
      int v67 = [v39 intValue];
    }
    else
    {
      v43->_hasObject2DAssetCount = 0;
      int v67 = -1;
    }
    v43->_object2DAssetCount = v67;
    if (v40)
    {
      v43->_hasBarcodeDetectionAssetCount = 1;
      int v68 = [v40 intValue];
    }
    else
    {
      v43->_hasBarcodeDetectionAssetCount = 0;
      int v68 = -1;
    }
    v43->_barcodeDetectionAssetCount = v68;
    if (v41)
    {
      v43->_hasSculptureAssetCount = 1;
      int v69 = [v41 intValue];
    }
    else
    {
      v43->_hasSculptureAssetCount = 0;
      int v69 = -1;
    }
    v43->_sculptureAssetCount = v69;
    if (v42)
    {
      v43->_hasSkylineAssetCount = 1;
      int v70 = [v42 intValue];
    }
    else
    {
      v43->_hasSkylineAssetCount = 0;
      int v70 = -1;
    }
    v43->_skylineAssetCount = v70;
  }

  return v43;
}

+ (id)protoFields
{
  v31[27] = *MEMORY[0x1E4F143B8];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parsedAssetCount" number:1 type:2 subMessageClass:0];
  v31[0] = v30;
  unsigned int v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"anyDomainAssetCount" number:2 type:2 subMessageClass:0];
  v31[1] = v29;
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"artAssetCount" number:3 type:2 subMessageClass:0];
  v31[2] = v28;
  BOOL v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"natureAssetCount" number:4 type:2 subMessageClass:0];
  v31[3] = v27;
  int v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"animalsAssetCount" number:5 type:2 subMessageClass:0];
  v31[4] = v26;
  int v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"birdsAssetCount" number:6 type:2 subMessageClass:0];
  v31[5] = v25;
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"insectsAssetCount" number:7 type:2 subMessageClass:0];
  v31[6] = v24;
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reptilesAssetCount" number:8 type:2 subMessageClass:0];
  v31[7] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mammalsAssetCount" number:9 type:2 subMessageClass:0];
  v31[8] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"landmarkAssetCount" number:10 type:2 subMessageClass:0];
  v31[9] = v21;
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"naturalLandmarkAssetCount" number:11 type:2 subMessageClass:0];
  v31[10] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaAssetCount" number:12 type:2 subMessageClass:0];
  v31[11] = v19;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bookAssetCount" number:13 type:2 subMessageClass:0];
  v31[12] = v18;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"albumAssetCount" number:14 type:2 subMessageClass:0];
  v31[13] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"catsAssetCount" number:15 type:2 subMessageClass:0];
  v31[14] = v16;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dogsAssetCount" number:16 type:2 subMessageClass:0];
  v31[15] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"apparelAssetCount" number:17 type:2 subMessageClass:0];
  v31[16] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"foodAssetCount" number:18 type:2 subMessageClass:0];
  v31[17] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"storefrontAssetCount" number:19 type:2 subMessageClass:0];
  v31[18] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"signSymbolAssetCount" number:20 type:2 subMessageClass:0];
  v31[19] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"laundryCareSymbolAssetCount" number:21 type:2 subMessageClass:0];
  v31[20] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"autoSymbolAssetCount" number:22 type:2 subMessageClass:0];
  v31[21] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brandLogoSymbolAssetCount" number:23 type:2 subMessageClass:0];
  v31[22] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"object2DAssetCount" number:24 type:2 subMessageClass:0];
  v31[23] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"barcodeDetectionAssetCount" number:25 type:2 subMessageClass:0];
  v31[24] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sculptureAssetCount" number:26 type:2 subMessageClass:0];
  v31[25] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"skylineAssetCount" number:27 type:2 subMessageClass:0];
  v31[26] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:27];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF63D8;
}

+ (id)columns
{
  v31[27] = *MEMORY[0x1E4F143B8];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"parsedAssetCount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  unsigned int v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"anyDomainAssetCount" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"artAssetCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  BOOL v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"natureAssetCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  int v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"animalsAssetCount" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  int v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"birdsAssetCount" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"insectsAssetCount" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reptilesAssetCount" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mammalsAssetCount" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"landmarkAssetCount" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:2 convertedType:0];
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"naturalLandmarkAssetCount" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaAssetCount" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bookAssetCount" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:2 convertedType:0];
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"albumAssetCount" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:2 convertedType:0];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"catsAssetCount" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:2 convertedType:0];
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dogsAssetCount" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"apparelAssetCount" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:2 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"foodAssetCount" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"storefrontAssetCount" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"signSymbolAssetCount" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"laundryCareSymbolAssetCount" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"autoSymbolAssetCount" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brandLogoSymbolAssetCount" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"object2DAssetCount" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"barcodeDetectionAssetCount" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sculptureAssetCount" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:2 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"skylineAssetCount" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:2 convertedType:0];
  v31[0] = v30;
  v31[1] = v29;
  v31[2] = v28;
  v31[3] = v27;
  v31[4] = v26;
  v31[5] = v25;
  v31[6] = v24;
  v31[7] = v23;
  v31[8] = v22;
  v31[9] = v21;
  v31[10] = v20;
  v31[11] = v19;
  v31[12] = v18;
  v31[13] = v17;
  v31[14] = v16;
  v31[15] = v15;
  v31[16] = v14;
  v31[17] = v2;
  v31[18] = v3;
  v31[19] = v4;
  v31[20] = v13;
  v31[21] = v5;
  v31[22] = v6;
  v31[23] = v7;
  v31[24] = v12;
  v31[25] = v8;
  v31[26] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:27];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPerBatchDomainSpecificAssetCounts alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[11] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end