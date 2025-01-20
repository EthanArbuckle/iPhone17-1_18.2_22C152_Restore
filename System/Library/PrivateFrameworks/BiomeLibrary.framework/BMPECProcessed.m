@interface BMPECProcessed
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPECProcessed)initWithArtAssetProcessedCount:(id)a3 natureAssetProcessedCount:(id)a4 animalsAssetProcessedCount:(id)a5 birdsAssetProcessedCount:(id)a6 insectsAssetProcessedCount:(id)a7 reptilesAssetProcessedCount:(id)a8 mammalsAssetProcessedCount:(id)a9 landmarkAssetProcessedCount:(id)a10 naturalLandmarkProcessedAssetCount:(id)a11 mediaAssetProcessedCount:(id)a12 bookAssetProcessedCount:(id)a13 albumAssetProcessedCount:(id)a14 catsAssetProcessedCount:(id)a15 dogsAssetProcessedCount:(id)a16 apparelAssetProcessedCount:(id)a17 foodAssetProcessedCount:(id)a18 storefrontAssetProcessedCount:(id)a19 signSymbolAssetProcessedCount:(id)a20 laundryCareSymbolAssetProcessedCount:(id)a21 autoSymbolAssetProcessedCount:(id)a22 brandLogoSymbolAssetProcessedCount:(id)a23 object2DAssetProcessedCount:(id)a24 barcodeDetectionAssetProcessedCount:(id)a25 sculptureAssetProcessedCount:(id)a26 skylineAssetProcessedCount:(id)a27 artAssetSuccessesCount:(id)a28 natureAssetSuccessesCount:(id)a29 animalsAssetSuccessesCount:(id)a30 birdsAssetSuccessesCount:(id)a31 insectsAssetSuccessesCount:(id)a32 reptilesAssetSuccessesCount:(id)a33 mammalsAssetSuccessesCount:(id)a34 landmarkAssetSuccessesCount:(id)a35 naturalLandmarkSuccessesAssetCount:(id)a36 mediaAssetSuccessesCount:(id)a37 bookAssetSuccessesCount:(id)a38 albumAssetSuccessesCount:(id)a39 catsAssetSuccessesCount:(id)a40 dogsAssetSuccessesCount:(id)a41 apparelAssetSuccessesCount:(id)a42 foodAssetSuccessesCount:(id)a43 storefrontAssetSuccessesCount:(id)a44 signSymbolAssetSuccessesCount:(id)a45 laundryCareSymbolAssetSuccessesCount:(id)a46 autoSymbolAssetSuccessesCount:(id)a47 brandLogoSymbolAssetSuccessesCount:(id)a48 object2DAssetSuccessesCount:(id)a49 barcodeDetectionAssetSuccessesCount:(id)a50 sculptureAssetSuccessesCount:(id)a51 skylineAssetSuccessesCount:(id)a52;
- (BMPECProcessed)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAlbumAssetProcessedCount;
- (BOOL)hasAlbumAssetSuccessesCount;
- (BOOL)hasAnimalsAssetProcessedCount;
- (BOOL)hasAnimalsAssetSuccessesCount;
- (BOOL)hasApparelAssetProcessedCount;
- (BOOL)hasApparelAssetSuccessesCount;
- (BOOL)hasArtAssetProcessedCount;
- (BOOL)hasArtAssetSuccessesCount;
- (BOOL)hasAutoSymbolAssetProcessedCount;
- (BOOL)hasAutoSymbolAssetSuccessesCount;
- (BOOL)hasBarcodeDetectionAssetProcessedCount;
- (BOOL)hasBarcodeDetectionAssetSuccessesCount;
- (BOOL)hasBirdsAssetProcessedCount;
- (BOOL)hasBirdsAssetSuccessesCount;
- (BOOL)hasBookAssetProcessedCount;
- (BOOL)hasBookAssetSuccessesCount;
- (BOOL)hasBrandLogoSymbolAssetProcessedCount;
- (BOOL)hasBrandLogoSymbolAssetSuccessesCount;
- (BOOL)hasCatsAssetProcessedCount;
- (BOOL)hasCatsAssetSuccessesCount;
- (BOOL)hasDogsAssetProcessedCount;
- (BOOL)hasDogsAssetSuccessesCount;
- (BOOL)hasFoodAssetProcessedCount;
- (BOOL)hasFoodAssetSuccessesCount;
- (BOOL)hasInsectsAssetProcessedCount;
- (BOOL)hasInsectsAssetSuccessesCount;
- (BOOL)hasLandmarkAssetProcessedCount;
- (BOOL)hasLandmarkAssetSuccessesCount;
- (BOOL)hasLaundryCareSymbolAssetProcessedCount;
- (BOOL)hasLaundryCareSymbolAssetSuccessesCount;
- (BOOL)hasMammalsAssetProcessedCount;
- (BOOL)hasMammalsAssetSuccessesCount;
- (BOOL)hasMediaAssetProcessedCount;
- (BOOL)hasMediaAssetSuccessesCount;
- (BOOL)hasNaturalLandmarkProcessedAssetCount;
- (BOOL)hasNaturalLandmarkSuccessesAssetCount;
- (BOOL)hasNatureAssetProcessedCount;
- (BOOL)hasNatureAssetSuccessesCount;
- (BOOL)hasObject2DAssetProcessedCount;
- (BOOL)hasObject2DAssetSuccessesCount;
- (BOOL)hasReptilesAssetProcessedCount;
- (BOOL)hasReptilesAssetSuccessesCount;
- (BOOL)hasSculptureAssetProcessedCount;
- (BOOL)hasSculptureAssetSuccessesCount;
- (BOOL)hasSignSymbolAssetProcessedCount;
- (BOOL)hasSignSymbolAssetSuccessesCount;
- (BOOL)hasSkylineAssetProcessedCount;
- (BOOL)hasSkylineAssetSuccessesCount;
- (BOOL)hasStorefrontAssetProcessedCount;
- (BOOL)hasStorefrontAssetSuccessesCount;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)albumAssetProcessedCount;
- (int)albumAssetSuccessesCount;
- (int)animalsAssetProcessedCount;
- (int)animalsAssetSuccessesCount;
- (int)apparelAssetProcessedCount;
- (int)apparelAssetSuccessesCount;
- (int)artAssetProcessedCount;
- (int)artAssetSuccessesCount;
- (int)autoSymbolAssetProcessedCount;
- (int)autoSymbolAssetSuccessesCount;
- (int)barcodeDetectionAssetProcessedCount;
- (int)barcodeDetectionAssetSuccessesCount;
- (int)birdsAssetProcessedCount;
- (int)birdsAssetSuccessesCount;
- (int)bookAssetProcessedCount;
- (int)bookAssetSuccessesCount;
- (int)brandLogoSymbolAssetProcessedCount;
- (int)brandLogoSymbolAssetSuccessesCount;
- (int)catsAssetProcessedCount;
- (int)catsAssetSuccessesCount;
- (int)dogsAssetProcessedCount;
- (int)dogsAssetSuccessesCount;
- (int)foodAssetProcessedCount;
- (int)foodAssetSuccessesCount;
- (int)insectsAssetProcessedCount;
- (int)insectsAssetSuccessesCount;
- (int)landmarkAssetProcessedCount;
- (int)landmarkAssetSuccessesCount;
- (int)laundryCareSymbolAssetProcessedCount;
- (int)laundryCareSymbolAssetSuccessesCount;
- (int)mammalsAssetProcessedCount;
- (int)mammalsAssetSuccessesCount;
- (int)mediaAssetProcessedCount;
- (int)mediaAssetSuccessesCount;
- (int)naturalLandmarkProcessedAssetCount;
- (int)naturalLandmarkSuccessesAssetCount;
- (int)natureAssetProcessedCount;
- (int)natureAssetSuccessesCount;
- (int)object2DAssetProcessedCount;
- (int)object2DAssetSuccessesCount;
- (int)reptilesAssetProcessedCount;
- (int)reptilesAssetSuccessesCount;
- (int)sculptureAssetProcessedCount;
- (int)sculptureAssetSuccessesCount;
- (int)signSymbolAssetProcessedCount;
- (int)signSymbolAssetSuccessesCount;
- (int)skylineAssetProcessedCount;
- (int)skylineAssetSuccessesCount;
- (int)storefrontAssetProcessedCount;
- (int)storefrontAssetSuccessesCount;
- (unsigned)dataVersion;
- (void)setHasAlbumAssetProcessedCount:(BOOL)a3;
- (void)setHasAlbumAssetSuccessesCount:(BOOL)a3;
- (void)setHasAnimalsAssetProcessedCount:(BOOL)a3;
- (void)setHasAnimalsAssetSuccessesCount:(BOOL)a3;
- (void)setHasApparelAssetProcessedCount:(BOOL)a3;
- (void)setHasApparelAssetSuccessesCount:(BOOL)a3;
- (void)setHasArtAssetProcessedCount:(BOOL)a3;
- (void)setHasArtAssetSuccessesCount:(BOOL)a3;
- (void)setHasAutoSymbolAssetProcessedCount:(BOOL)a3;
- (void)setHasAutoSymbolAssetSuccessesCount:(BOOL)a3;
- (void)setHasBarcodeDetectionAssetProcessedCount:(BOOL)a3;
- (void)setHasBarcodeDetectionAssetSuccessesCount:(BOOL)a3;
- (void)setHasBirdsAssetProcessedCount:(BOOL)a3;
- (void)setHasBirdsAssetSuccessesCount:(BOOL)a3;
- (void)setHasBookAssetProcessedCount:(BOOL)a3;
- (void)setHasBookAssetSuccessesCount:(BOOL)a3;
- (void)setHasBrandLogoSymbolAssetProcessedCount:(BOOL)a3;
- (void)setHasBrandLogoSymbolAssetSuccessesCount:(BOOL)a3;
- (void)setHasCatsAssetProcessedCount:(BOOL)a3;
- (void)setHasCatsAssetSuccessesCount:(BOOL)a3;
- (void)setHasDogsAssetProcessedCount:(BOOL)a3;
- (void)setHasDogsAssetSuccessesCount:(BOOL)a3;
- (void)setHasFoodAssetProcessedCount:(BOOL)a3;
- (void)setHasFoodAssetSuccessesCount:(BOOL)a3;
- (void)setHasInsectsAssetProcessedCount:(BOOL)a3;
- (void)setHasInsectsAssetSuccessesCount:(BOOL)a3;
- (void)setHasLandmarkAssetProcessedCount:(BOOL)a3;
- (void)setHasLandmarkAssetSuccessesCount:(BOOL)a3;
- (void)setHasLaundryCareSymbolAssetProcessedCount:(BOOL)a3;
- (void)setHasLaundryCareSymbolAssetSuccessesCount:(BOOL)a3;
- (void)setHasMammalsAssetProcessedCount:(BOOL)a3;
- (void)setHasMammalsAssetSuccessesCount:(BOOL)a3;
- (void)setHasMediaAssetProcessedCount:(BOOL)a3;
- (void)setHasMediaAssetSuccessesCount:(BOOL)a3;
- (void)setHasNaturalLandmarkProcessedAssetCount:(BOOL)a3;
- (void)setHasNaturalLandmarkSuccessesAssetCount:(BOOL)a3;
- (void)setHasNatureAssetProcessedCount:(BOOL)a3;
- (void)setHasNatureAssetSuccessesCount:(BOOL)a3;
- (void)setHasObject2DAssetProcessedCount:(BOOL)a3;
- (void)setHasObject2DAssetSuccessesCount:(BOOL)a3;
- (void)setHasReptilesAssetProcessedCount:(BOOL)a3;
- (void)setHasReptilesAssetSuccessesCount:(BOOL)a3;
- (void)setHasSculptureAssetProcessedCount:(BOOL)a3;
- (void)setHasSculptureAssetSuccessesCount:(BOOL)a3;
- (void)setHasSignSymbolAssetProcessedCount:(BOOL)a3;
- (void)setHasSignSymbolAssetSuccessesCount:(BOOL)a3;
- (void)setHasSkylineAssetProcessedCount:(BOOL)a3;
- (void)setHasSkylineAssetSuccessesCount:(BOOL)a3;
- (void)setHasStorefrontAssetProcessedCount:(BOOL)a3;
- (void)setHasStorefrontAssetSuccessesCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPECProcessed

- (void)setHasSkylineAssetSuccessesCount:(BOOL)a3
{
  self->_hasSkylineAssetSuccessesCount = a3;
}

- (BOOL)hasSkylineAssetSuccessesCount
{
  return self->_hasSkylineAssetSuccessesCount;
}

- (int)skylineAssetSuccessesCount
{
  return self->_skylineAssetSuccessesCount;
}

- (void)setHasSculptureAssetSuccessesCount:(BOOL)a3
{
  self->_hasSculptureAssetSuccessesCount = a3;
}

- (BOOL)hasSculptureAssetSuccessesCount
{
  return self->_hasSculptureAssetSuccessesCount;
}

- (int)sculptureAssetSuccessesCount
{
  return self->_sculptureAssetSuccessesCount;
}

- (void)setHasBarcodeDetectionAssetSuccessesCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetSuccessesCount = a3;
}

- (BOOL)hasBarcodeDetectionAssetSuccessesCount
{
  return self->_hasBarcodeDetectionAssetSuccessesCount;
}

- (int)barcodeDetectionAssetSuccessesCount
{
  return self->_barcodeDetectionAssetSuccessesCount;
}

- (void)setHasObject2DAssetSuccessesCount:(BOOL)a3
{
  self->_hasObject2DAssetSuccessesCount = a3;
}

- (BOOL)hasObject2DAssetSuccessesCount
{
  return self->_hasObject2DAssetSuccessesCount;
}

- (int)object2DAssetSuccessesCount
{
  return self->_object2DAssetSuccessesCount;
}

- (void)setHasBrandLogoSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetSuccessesCount = a3;
}

- (BOOL)hasBrandLogoSymbolAssetSuccessesCount
{
  return self->_hasBrandLogoSymbolAssetSuccessesCount;
}

- (int)brandLogoSymbolAssetSuccessesCount
{
  return self->_brandLogoSymbolAssetSuccessesCount;
}

- (void)setHasAutoSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetSuccessesCount = a3;
}

- (BOOL)hasAutoSymbolAssetSuccessesCount
{
  return self->_hasAutoSymbolAssetSuccessesCount;
}

- (int)autoSymbolAssetSuccessesCount
{
  return self->_autoSymbolAssetSuccessesCount;
}

- (void)setHasLaundryCareSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetSuccessesCount = a3;
}

- (BOOL)hasLaundryCareSymbolAssetSuccessesCount
{
  return self->_hasLaundryCareSymbolAssetSuccessesCount;
}

- (int)laundryCareSymbolAssetSuccessesCount
{
  return self->_laundryCareSymbolAssetSuccessesCount;
}

- (void)setHasSignSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasSignSymbolAssetSuccessesCount = a3;
}

- (BOOL)hasSignSymbolAssetSuccessesCount
{
  return self->_hasSignSymbolAssetSuccessesCount;
}

- (int)signSymbolAssetSuccessesCount
{
  return self->_signSymbolAssetSuccessesCount;
}

- (void)setHasStorefrontAssetSuccessesCount:(BOOL)a3
{
  self->_hasStorefrontAssetSuccessesCount = a3;
}

- (BOOL)hasStorefrontAssetSuccessesCount
{
  return self->_hasStorefrontAssetSuccessesCount;
}

- (int)storefrontAssetSuccessesCount
{
  return self->_storefrontAssetSuccessesCount;
}

- (void)setHasFoodAssetSuccessesCount:(BOOL)a3
{
  self->_hasFoodAssetSuccessesCount = a3;
}

- (BOOL)hasFoodAssetSuccessesCount
{
  return self->_hasFoodAssetSuccessesCount;
}

- (int)foodAssetSuccessesCount
{
  return self->_foodAssetSuccessesCount;
}

- (void)setHasApparelAssetSuccessesCount:(BOOL)a3
{
  self->_hasApparelAssetSuccessesCount = a3;
}

- (BOOL)hasApparelAssetSuccessesCount
{
  return self->_hasApparelAssetSuccessesCount;
}

- (int)apparelAssetSuccessesCount
{
  return self->_apparelAssetSuccessesCount;
}

- (void)setHasDogsAssetSuccessesCount:(BOOL)a3
{
  self->_hasDogsAssetSuccessesCount = a3;
}

- (BOOL)hasDogsAssetSuccessesCount
{
  return self->_hasDogsAssetSuccessesCount;
}

- (int)dogsAssetSuccessesCount
{
  return self->_dogsAssetSuccessesCount;
}

- (void)setHasCatsAssetSuccessesCount:(BOOL)a3
{
  self->_hasCatsAssetSuccessesCount = a3;
}

- (BOOL)hasCatsAssetSuccessesCount
{
  return self->_hasCatsAssetSuccessesCount;
}

- (int)catsAssetSuccessesCount
{
  return self->_catsAssetSuccessesCount;
}

- (void)setHasAlbumAssetSuccessesCount:(BOOL)a3
{
  self->_hasAlbumAssetSuccessesCount = a3;
}

- (BOOL)hasAlbumAssetSuccessesCount
{
  return self->_hasAlbumAssetSuccessesCount;
}

- (int)albumAssetSuccessesCount
{
  return self->_albumAssetSuccessesCount;
}

- (void)setHasBookAssetSuccessesCount:(BOOL)a3
{
  self->_hasBookAssetSuccessesCount = a3;
}

- (BOOL)hasBookAssetSuccessesCount
{
  return self->_hasBookAssetSuccessesCount;
}

- (int)bookAssetSuccessesCount
{
  return self->_bookAssetSuccessesCount;
}

- (void)setHasMediaAssetSuccessesCount:(BOOL)a3
{
  self->_hasMediaAssetSuccessesCount = a3;
}

- (BOOL)hasMediaAssetSuccessesCount
{
  return self->_hasMediaAssetSuccessesCount;
}

- (int)mediaAssetSuccessesCount
{
  return self->_mediaAssetSuccessesCount;
}

- (void)setHasNaturalLandmarkSuccessesAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkSuccessesAssetCount = a3;
}

- (BOOL)hasNaturalLandmarkSuccessesAssetCount
{
  return self->_hasNaturalLandmarkSuccessesAssetCount;
}

- (int)naturalLandmarkSuccessesAssetCount
{
  return self->_naturalLandmarkSuccessesAssetCount;
}

- (void)setHasLandmarkAssetSuccessesCount:(BOOL)a3
{
  self->_hasLandmarkAssetSuccessesCount = a3;
}

- (BOOL)hasLandmarkAssetSuccessesCount
{
  return self->_hasLandmarkAssetSuccessesCount;
}

- (int)landmarkAssetSuccessesCount
{
  return self->_landmarkAssetSuccessesCount;
}

- (void)setHasMammalsAssetSuccessesCount:(BOOL)a3
{
  self->_hasMammalsAssetSuccessesCount = a3;
}

- (BOOL)hasMammalsAssetSuccessesCount
{
  return self->_hasMammalsAssetSuccessesCount;
}

- (int)mammalsAssetSuccessesCount
{
  return self->_mammalsAssetSuccessesCount;
}

- (void)setHasReptilesAssetSuccessesCount:(BOOL)a3
{
  self->_hasReptilesAssetSuccessesCount = a3;
}

- (BOOL)hasReptilesAssetSuccessesCount
{
  return self->_hasReptilesAssetSuccessesCount;
}

- (int)reptilesAssetSuccessesCount
{
  return self->_reptilesAssetSuccessesCount;
}

- (void)setHasInsectsAssetSuccessesCount:(BOOL)a3
{
  self->_hasInsectsAssetSuccessesCount = a3;
}

- (BOOL)hasInsectsAssetSuccessesCount
{
  return self->_hasInsectsAssetSuccessesCount;
}

- (int)insectsAssetSuccessesCount
{
  return self->_insectsAssetSuccessesCount;
}

- (void)setHasBirdsAssetSuccessesCount:(BOOL)a3
{
  self->_hasBirdsAssetSuccessesCount = a3;
}

- (BOOL)hasBirdsAssetSuccessesCount
{
  return self->_hasBirdsAssetSuccessesCount;
}

- (int)birdsAssetSuccessesCount
{
  return self->_birdsAssetSuccessesCount;
}

- (void)setHasAnimalsAssetSuccessesCount:(BOOL)a3
{
  self->_hasAnimalsAssetSuccessesCount = a3;
}

- (BOOL)hasAnimalsAssetSuccessesCount
{
  return self->_hasAnimalsAssetSuccessesCount;
}

- (int)animalsAssetSuccessesCount
{
  return self->_animalsAssetSuccessesCount;
}

- (void)setHasNatureAssetSuccessesCount:(BOOL)a3
{
  self->_hasNatureAssetSuccessesCount = a3;
}

- (BOOL)hasNatureAssetSuccessesCount
{
  return self->_hasNatureAssetSuccessesCount;
}

- (int)natureAssetSuccessesCount
{
  return self->_natureAssetSuccessesCount;
}

- (void)setHasArtAssetSuccessesCount:(BOOL)a3
{
  self->_hasArtAssetSuccessesCount = a3;
}

- (BOOL)hasArtAssetSuccessesCount
{
  return self->_hasArtAssetSuccessesCount;
}

- (int)artAssetSuccessesCount
{
  return self->_artAssetSuccessesCount;
}

- (void)setHasSkylineAssetProcessedCount:(BOOL)a3
{
  self->_hasSkylineAssetProcessedCount = a3;
}

- (BOOL)hasSkylineAssetProcessedCount
{
  return self->_hasSkylineAssetProcessedCount;
}

- (int)skylineAssetProcessedCount
{
  return self->_skylineAssetProcessedCount;
}

- (void)setHasSculptureAssetProcessedCount:(BOOL)a3
{
  self->_hasSculptureAssetProcessedCount = a3;
}

- (BOOL)hasSculptureAssetProcessedCount
{
  return self->_hasSculptureAssetProcessedCount;
}

- (int)sculptureAssetProcessedCount
{
  return self->_sculptureAssetProcessedCount;
}

- (void)setHasBarcodeDetectionAssetProcessedCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetProcessedCount = a3;
}

- (BOOL)hasBarcodeDetectionAssetProcessedCount
{
  return self->_hasBarcodeDetectionAssetProcessedCount;
}

- (int)barcodeDetectionAssetProcessedCount
{
  return self->_barcodeDetectionAssetProcessedCount;
}

- (void)setHasObject2DAssetProcessedCount:(BOOL)a3
{
  self->_hasObject2DAssetProcessedCount = a3;
}

- (BOOL)hasObject2DAssetProcessedCount
{
  return self->_hasObject2DAssetProcessedCount;
}

- (int)object2DAssetProcessedCount
{
  return self->_object2DAssetProcessedCount;
}

- (void)setHasBrandLogoSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetProcessedCount = a3;
}

- (BOOL)hasBrandLogoSymbolAssetProcessedCount
{
  return self->_hasBrandLogoSymbolAssetProcessedCount;
}

- (int)brandLogoSymbolAssetProcessedCount
{
  return self->_brandLogoSymbolAssetProcessedCount;
}

- (void)setHasAutoSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetProcessedCount = a3;
}

- (BOOL)hasAutoSymbolAssetProcessedCount
{
  return self->_hasAutoSymbolAssetProcessedCount;
}

- (int)autoSymbolAssetProcessedCount
{
  return self->_autoSymbolAssetProcessedCount;
}

- (void)setHasLaundryCareSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetProcessedCount = a3;
}

- (BOOL)hasLaundryCareSymbolAssetProcessedCount
{
  return self->_hasLaundryCareSymbolAssetProcessedCount;
}

- (int)laundryCareSymbolAssetProcessedCount
{
  return self->_laundryCareSymbolAssetProcessedCount;
}

- (void)setHasSignSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasSignSymbolAssetProcessedCount = a3;
}

- (BOOL)hasSignSymbolAssetProcessedCount
{
  return self->_hasSignSymbolAssetProcessedCount;
}

- (int)signSymbolAssetProcessedCount
{
  return self->_signSymbolAssetProcessedCount;
}

- (void)setHasStorefrontAssetProcessedCount:(BOOL)a3
{
  self->_hasStorefrontAssetProcessedCount = a3;
}

- (BOOL)hasStorefrontAssetProcessedCount
{
  return self->_hasStorefrontAssetProcessedCount;
}

- (int)storefrontAssetProcessedCount
{
  return self->_storefrontAssetProcessedCount;
}

- (void)setHasFoodAssetProcessedCount:(BOOL)a3
{
  self->_hasFoodAssetProcessedCount = a3;
}

- (BOOL)hasFoodAssetProcessedCount
{
  return self->_hasFoodAssetProcessedCount;
}

- (int)foodAssetProcessedCount
{
  return self->_foodAssetProcessedCount;
}

- (void)setHasApparelAssetProcessedCount:(BOOL)a3
{
  self->_hasApparelAssetProcessedCount = a3;
}

- (BOOL)hasApparelAssetProcessedCount
{
  return self->_hasApparelAssetProcessedCount;
}

- (int)apparelAssetProcessedCount
{
  return self->_apparelAssetProcessedCount;
}

- (void)setHasDogsAssetProcessedCount:(BOOL)a3
{
  self->_hasDogsAssetProcessedCount = a3;
}

- (BOOL)hasDogsAssetProcessedCount
{
  return self->_hasDogsAssetProcessedCount;
}

- (int)dogsAssetProcessedCount
{
  return self->_dogsAssetProcessedCount;
}

- (void)setHasCatsAssetProcessedCount:(BOOL)a3
{
  self->_hasCatsAssetProcessedCount = a3;
}

- (BOOL)hasCatsAssetProcessedCount
{
  return self->_hasCatsAssetProcessedCount;
}

- (int)catsAssetProcessedCount
{
  return self->_catsAssetProcessedCount;
}

- (void)setHasAlbumAssetProcessedCount:(BOOL)a3
{
  self->_hasAlbumAssetProcessedCount = a3;
}

- (BOOL)hasAlbumAssetProcessedCount
{
  return self->_hasAlbumAssetProcessedCount;
}

- (int)albumAssetProcessedCount
{
  return self->_albumAssetProcessedCount;
}

- (void)setHasBookAssetProcessedCount:(BOOL)a3
{
  self->_hasBookAssetProcessedCount = a3;
}

- (BOOL)hasBookAssetProcessedCount
{
  return self->_hasBookAssetProcessedCount;
}

- (int)bookAssetProcessedCount
{
  return self->_bookAssetProcessedCount;
}

- (void)setHasMediaAssetProcessedCount:(BOOL)a3
{
  self->_hasMediaAssetProcessedCount = a3;
}

- (BOOL)hasMediaAssetProcessedCount
{
  return self->_hasMediaAssetProcessedCount;
}

- (int)mediaAssetProcessedCount
{
  return self->_mediaAssetProcessedCount;
}

- (void)setHasNaturalLandmarkProcessedAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkProcessedAssetCount = a3;
}

- (BOOL)hasNaturalLandmarkProcessedAssetCount
{
  return self->_hasNaturalLandmarkProcessedAssetCount;
}

- (int)naturalLandmarkProcessedAssetCount
{
  return self->_naturalLandmarkProcessedAssetCount;
}

- (void)setHasLandmarkAssetProcessedCount:(BOOL)a3
{
  self->_hasLandmarkAssetProcessedCount = a3;
}

- (BOOL)hasLandmarkAssetProcessedCount
{
  return self->_hasLandmarkAssetProcessedCount;
}

- (int)landmarkAssetProcessedCount
{
  return self->_landmarkAssetProcessedCount;
}

- (void)setHasMammalsAssetProcessedCount:(BOOL)a3
{
  self->_hasMammalsAssetProcessedCount = a3;
}

- (BOOL)hasMammalsAssetProcessedCount
{
  return self->_hasMammalsAssetProcessedCount;
}

- (int)mammalsAssetProcessedCount
{
  return self->_mammalsAssetProcessedCount;
}

- (void)setHasReptilesAssetProcessedCount:(BOOL)a3
{
  self->_hasReptilesAssetProcessedCount = a3;
}

- (BOOL)hasReptilesAssetProcessedCount
{
  return self->_hasReptilesAssetProcessedCount;
}

- (int)reptilesAssetProcessedCount
{
  return self->_reptilesAssetProcessedCount;
}

- (void)setHasInsectsAssetProcessedCount:(BOOL)a3
{
  self->_hasInsectsAssetProcessedCount = a3;
}

- (BOOL)hasInsectsAssetProcessedCount
{
  return self->_hasInsectsAssetProcessedCount;
}

- (int)insectsAssetProcessedCount
{
  return self->_insectsAssetProcessedCount;
}

- (void)setHasBirdsAssetProcessedCount:(BOOL)a3
{
  self->_hasBirdsAssetProcessedCount = a3;
}

- (BOOL)hasBirdsAssetProcessedCount
{
  return self->_hasBirdsAssetProcessedCount;
}

- (int)birdsAssetProcessedCount
{
  return self->_birdsAssetProcessedCount;
}

- (void)setHasAnimalsAssetProcessedCount:(BOOL)a3
{
  self->_hasAnimalsAssetProcessedCount = a3;
}

- (BOOL)hasAnimalsAssetProcessedCount
{
  return self->_hasAnimalsAssetProcessedCount;
}

- (int)animalsAssetProcessedCount
{
  return self->_animalsAssetProcessedCount;
}

- (void)setHasNatureAssetProcessedCount:(BOOL)a3
{
  self->_hasNatureAssetProcessedCount = a3;
}

- (BOOL)hasNatureAssetProcessedCount
{
  return self->_hasNatureAssetProcessedCount;
}

- (int)natureAssetProcessedCount
{
  return self->_natureAssetProcessedCount;
}

- (void)setHasArtAssetProcessedCount:(BOOL)a3
{
  self->_hasArtAssetProcessedCount = a3;
}

- (BOOL)hasArtAssetProcessedCount
{
  return self->_hasArtAssetProcessedCount;
}

- (int)artAssetProcessedCount
{
  return self->_artAssetProcessedCount;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v56 = 0;
    goto LABEL_255;
  }
  id v5 = v4;
  if ([(BMPECProcessed *)self hasArtAssetProcessedCount]
    || [v5 hasArtAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasArtAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasArtAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v6 = [(BMPECProcessed *)self artAssetProcessedCount];
    if (v6 != [v5 artAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasNatureAssetProcessedCount]
    || [v5 hasNatureAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasNatureAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasNatureAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v7 = [(BMPECProcessed *)self natureAssetProcessedCount];
    if (v7 != [v5 natureAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAnimalsAssetProcessedCount]
    || [v5 hasAnimalsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasAnimalsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAnimalsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v8 = [(BMPECProcessed *)self animalsAssetProcessedCount];
    if (v8 != [v5 animalsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBirdsAssetProcessedCount]
    || [v5 hasBirdsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasBirdsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBirdsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v9 = [(BMPECProcessed *)self birdsAssetProcessedCount];
    if (v9 != [v5 birdsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasInsectsAssetProcessedCount]
    || [v5 hasInsectsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasInsectsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasInsectsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v10 = [(BMPECProcessed *)self insectsAssetProcessedCount];
    if (v10 != [v5 insectsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasReptilesAssetProcessedCount]
    || [v5 hasReptilesAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasReptilesAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasReptilesAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v11 = [(BMPECProcessed *)self reptilesAssetProcessedCount];
    if (v11 != [v5 reptilesAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasMammalsAssetProcessedCount]
    || [v5 hasMammalsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasMammalsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasMammalsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v12 = [(BMPECProcessed *)self mammalsAssetProcessedCount];
    if (v12 != [v5 mammalsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasLandmarkAssetProcessedCount]
    || [v5 hasLandmarkAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasLandmarkAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasLandmarkAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v13 = [(BMPECProcessed *)self landmarkAssetProcessedCount];
    if (v13 != [v5 landmarkAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasNaturalLandmarkProcessedAssetCount]
    || [v5 hasNaturalLandmarkProcessedAssetCount])
  {
    if (![(BMPECProcessed *)self hasNaturalLandmarkProcessedAssetCount]) {
      goto LABEL_252;
    }
    if (![v5 hasNaturalLandmarkProcessedAssetCount]) {
      goto LABEL_252;
    }
    int v14 = [(BMPECProcessed *)self naturalLandmarkProcessedAssetCount];
    if (v14 != [v5 naturalLandmarkProcessedAssetCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasMediaAssetProcessedCount]
    || [v5 hasMediaAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasMediaAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasMediaAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v15 = [(BMPECProcessed *)self mediaAssetProcessedCount];
    if (v15 != [v5 mediaAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBookAssetProcessedCount]
    || [v5 hasBookAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasBookAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBookAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v16 = [(BMPECProcessed *)self bookAssetProcessedCount];
    if (v16 != [v5 bookAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAlbumAssetProcessedCount]
    || [v5 hasAlbumAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasAlbumAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAlbumAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v17 = [(BMPECProcessed *)self albumAssetProcessedCount];
    if (v17 != [v5 albumAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasCatsAssetProcessedCount]
    || [v5 hasCatsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasCatsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasCatsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v18 = [(BMPECProcessed *)self catsAssetProcessedCount];
    if (v18 != [v5 catsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasDogsAssetProcessedCount]
    || [v5 hasDogsAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasDogsAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasDogsAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v19 = [(BMPECProcessed *)self dogsAssetProcessedCount];
    if (v19 != [v5 dogsAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasApparelAssetProcessedCount]
    || [v5 hasApparelAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasApparelAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasApparelAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v20 = [(BMPECProcessed *)self apparelAssetProcessedCount];
    if (v20 != [v5 apparelAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasFoodAssetProcessedCount]
    || [v5 hasFoodAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasFoodAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasFoodAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v21 = [(BMPECProcessed *)self foodAssetProcessedCount];
    if (v21 != [v5 foodAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasStorefrontAssetProcessedCount]
    || [v5 hasStorefrontAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasStorefrontAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasStorefrontAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v22 = [(BMPECProcessed *)self storefrontAssetProcessedCount];
    if (v22 != [v5 storefrontAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasSignSymbolAssetProcessedCount]
    || [v5 hasSignSymbolAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasSignSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasSignSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v23 = [(BMPECProcessed *)self signSymbolAssetProcessedCount];
    if (v23 != [v5 signSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasLaundryCareSymbolAssetProcessedCount]
    || [v5 hasLaundryCareSymbolAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasLaundryCareSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasLaundryCareSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v24 = [(BMPECProcessed *)self laundryCareSymbolAssetProcessedCount];
    if (v24 != [v5 laundryCareSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAutoSymbolAssetProcessedCount]
    || [v5 hasAutoSymbolAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasAutoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAutoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v25 = [(BMPECProcessed *)self autoSymbolAssetProcessedCount];
    if (v25 != [v5 autoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBrandLogoSymbolAssetProcessedCount]
    || [v5 hasBrandLogoSymbolAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasBrandLogoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBrandLogoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v26 = [(BMPECProcessed *)self brandLogoSymbolAssetProcessedCount];
    if (v26 != [v5 brandLogoSymbolAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasObject2DAssetProcessedCount]
    || [v5 hasObject2DAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasObject2DAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasObject2DAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v27 = [(BMPECProcessed *)self object2DAssetProcessedCount];
    if (v27 != [v5 object2DAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBarcodeDetectionAssetProcessedCount]
    || [v5 hasBarcodeDetectionAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasBarcodeDetectionAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBarcodeDetectionAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v28 = [(BMPECProcessed *)self barcodeDetectionAssetProcessedCount];
    if (v28 != [v5 barcodeDetectionAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasSculptureAssetProcessedCount]
    || [v5 hasSculptureAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasSculptureAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasSculptureAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v29 = [(BMPECProcessed *)self sculptureAssetProcessedCount];
    if (v29 != [v5 sculptureAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasSkylineAssetProcessedCount]
    || [v5 hasSkylineAssetProcessedCount])
  {
    if (![(BMPECProcessed *)self hasSkylineAssetProcessedCount]) {
      goto LABEL_252;
    }
    if (![v5 hasSkylineAssetProcessedCount]) {
      goto LABEL_252;
    }
    int v30 = [(BMPECProcessed *)self skylineAssetProcessedCount];
    if (v30 != [v5 skylineAssetProcessedCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasArtAssetSuccessesCount]
    || [v5 hasArtAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasArtAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasArtAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v31 = [(BMPECProcessed *)self artAssetSuccessesCount];
    if (v31 != [v5 artAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasNatureAssetSuccessesCount]
    || [v5 hasNatureAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasNatureAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasNatureAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v32 = [(BMPECProcessed *)self natureAssetSuccessesCount];
    if (v32 != [v5 natureAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAnimalsAssetSuccessesCount]
    || [v5 hasAnimalsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasAnimalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAnimalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v33 = [(BMPECProcessed *)self animalsAssetSuccessesCount];
    if (v33 != [v5 animalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBirdsAssetSuccessesCount]
    || [v5 hasBirdsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasBirdsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBirdsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v34 = [(BMPECProcessed *)self birdsAssetSuccessesCount];
    if (v34 != [v5 birdsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasInsectsAssetSuccessesCount]
    || [v5 hasInsectsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasInsectsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasInsectsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v35 = [(BMPECProcessed *)self insectsAssetSuccessesCount];
    if (v35 != [v5 insectsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasReptilesAssetSuccessesCount]
    || [v5 hasReptilesAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasReptilesAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasReptilesAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v36 = [(BMPECProcessed *)self reptilesAssetSuccessesCount];
    if (v36 != [v5 reptilesAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasMammalsAssetSuccessesCount]
    || [v5 hasMammalsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasMammalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasMammalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v37 = [(BMPECProcessed *)self mammalsAssetSuccessesCount];
    if (v37 != [v5 mammalsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasLandmarkAssetSuccessesCount]
    || [v5 hasLandmarkAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasLandmarkAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasLandmarkAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v38 = [(BMPECProcessed *)self landmarkAssetSuccessesCount];
    if (v38 != [v5 landmarkAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasNaturalLandmarkSuccessesAssetCount]
    || [v5 hasNaturalLandmarkSuccessesAssetCount])
  {
    if (![(BMPECProcessed *)self hasNaturalLandmarkSuccessesAssetCount]) {
      goto LABEL_252;
    }
    if (![v5 hasNaturalLandmarkSuccessesAssetCount]) {
      goto LABEL_252;
    }
    int v39 = [(BMPECProcessed *)self naturalLandmarkSuccessesAssetCount];
    if (v39 != [v5 naturalLandmarkSuccessesAssetCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasMediaAssetSuccessesCount]
    || [v5 hasMediaAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasMediaAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasMediaAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v40 = [(BMPECProcessed *)self mediaAssetSuccessesCount];
    if (v40 != [v5 mediaAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBookAssetSuccessesCount]
    || [v5 hasBookAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasBookAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBookAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v41 = [(BMPECProcessed *)self bookAssetSuccessesCount];
    if (v41 != [v5 bookAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAlbumAssetSuccessesCount]
    || [v5 hasAlbumAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasAlbumAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAlbumAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v42 = [(BMPECProcessed *)self albumAssetSuccessesCount];
    if (v42 != [v5 albumAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasCatsAssetSuccessesCount]
    || [v5 hasCatsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasCatsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasCatsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v43 = [(BMPECProcessed *)self catsAssetSuccessesCount];
    if (v43 != [v5 catsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasDogsAssetSuccessesCount]
    || [v5 hasDogsAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasDogsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasDogsAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v44 = [(BMPECProcessed *)self dogsAssetSuccessesCount];
    if (v44 != [v5 dogsAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasApparelAssetSuccessesCount]
    || [v5 hasApparelAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasApparelAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasApparelAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v45 = [(BMPECProcessed *)self apparelAssetSuccessesCount];
    if (v45 != [v5 apparelAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasFoodAssetSuccessesCount]
    || [v5 hasFoodAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasFoodAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasFoodAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v46 = [(BMPECProcessed *)self foodAssetSuccessesCount];
    if (v46 != [v5 foodAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasStorefrontAssetSuccessesCount]
    || [v5 hasStorefrontAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasStorefrontAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasStorefrontAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v47 = [(BMPECProcessed *)self storefrontAssetSuccessesCount];
    if (v47 != [v5 storefrontAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasSignSymbolAssetSuccessesCount]
    || [v5 hasSignSymbolAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasSignSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasSignSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v48 = [(BMPECProcessed *)self signSymbolAssetSuccessesCount];
    if (v48 != [v5 signSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasLaundryCareSymbolAssetSuccessesCount]
    || [v5 hasLaundryCareSymbolAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasLaundryCareSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasLaundryCareSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v49 = [(BMPECProcessed *)self laundryCareSymbolAssetSuccessesCount];
    if (v49 != [v5 laundryCareSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasAutoSymbolAssetSuccessesCount]
    || [v5 hasAutoSymbolAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasAutoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasAutoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v50 = [(BMPECProcessed *)self autoSymbolAssetSuccessesCount];
    if (v50 != [v5 autoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBrandLogoSymbolAssetSuccessesCount]
    || [v5 hasBrandLogoSymbolAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasBrandLogoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBrandLogoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v51 = [(BMPECProcessed *)self brandLogoSymbolAssetSuccessesCount];
    if (v51 != [v5 brandLogoSymbolAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasObject2DAssetSuccessesCount]
    || [v5 hasObject2DAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasObject2DAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasObject2DAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v52 = [(BMPECProcessed *)self object2DAssetSuccessesCount];
    if (v52 != [v5 object2DAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasBarcodeDetectionAssetSuccessesCount]
    || [v5 hasBarcodeDetectionAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasBarcodeDetectionAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasBarcodeDetectionAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v53 = [(BMPECProcessed *)self barcodeDetectionAssetSuccessesCount];
    if (v53 != [v5 barcodeDetectionAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if ([(BMPECProcessed *)self hasSculptureAssetSuccessesCount]
    || [v5 hasSculptureAssetSuccessesCount])
  {
    if (![(BMPECProcessed *)self hasSculptureAssetSuccessesCount]) {
      goto LABEL_252;
    }
    if (![v5 hasSculptureAssetSuccessesCount]) {
      goto LABEL_252;
    }
    int v54 = [(BMPECProcessed *)self sculptureAssetSuccessesCount];
    if (v54 != [v5 sculptureAssetSuccessesCount]) {
      goto LABEL_252;
    }
  }
  if (![(BMPECProcessed *)self hasSkylineAssetSuccessesCount]
    && ![v5 hasSkylineAssetSuccessesCount])
  {
    BOOL v56 = 1;
    goto LABEL_253;
  }
  if ([(BMPECProcessed *)self hasSkylineAssetSuccessesCount]
    && [v5 hasSkylineAssetSuccessesCount])
  {
    int v55 = [(BMPECProcessed *)self skylineAssetSuccessesCount];
    BOOL v56 = v55 == [v5 skylineAssetSuccessesCount];
  }
  else
  {
LABEL_252:
    BOOL v56 = 0;
  }
LABEL_253:

LABEL_255:
  return v56;
}

- (id)jsonDictionary
{
  v157[50] = *MEMORY[0x1E4F143B8];
  if ([(BMPECProcessed *)self hasArtAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed artAssetProcessedCount](self, "artAssetProcessedCount"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMPECProcessed *)self hasNatureAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed natureAssetProcessedCount](self, "natureAssetProcessedCount"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMPECProcessed *)self hasAnimalsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed animalsAssetProcessedCount](self, "animalsAssetProcessedCount"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMPECProcessed *)self hasBirdsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed birdsAssetProcessedCount](self, "birdsAssetProcessedCount"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMPECProcessed *)self hasInsectsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed insectsAssetProcessedCount](self, "insectsAssetProcessedCount"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMPECProcessed *)self hasReptilesAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed reptilesAssetProcessedCount](self, "reptilesAssetProcessedCount"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMPECProcessed *)self hasMammalsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mammalsAssetProcessedCount](self, "mammalsAssetProcessedCount"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMPECProcessed *)self hasLandmarkAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed landmarkAssetProcessedCount](self, "landmarkAssetProcessedCount"));
    id v155 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v155 = 0;
  }
  if ([(BMPECProcessed *)self hasNaturalLandmarkProcessedAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed naturalLandmarkProcessedAssetCount](self, "naturalLandmarkProcessedAssetCount"));
    id v154 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v154 = 0;
  }
  if ([(BMPECProcessed *)self hasMediaAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mediaAssetProcessedCount](self, "mediaAssetProcessedCount"));
    id v153 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v153 = 0;
  }
  if ([(BMPECProcessed *)self hasBookAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed bookAssetProcessedCount](self, "bookAssetProcessedCount"));
    id v152 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v152 = 0;
  }
  if ([(BMPECProcessed *)self hasAlbumAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed albumAssetProcessedCount](self, "albumAssetProcessedCount"));
    id v151 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v151 = 0;
  }
  if ([(BMPECProcessed *)self hasCatsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed catsAssetProcessedCount](self, "catsAssetProcessedCount"));
    id v150 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v150 = 0;
  }
  if ([(BMPECProcessed *)self hasDogsAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed dogsAssetProcessedCount](self, "dogsAssetProcessedCount"));
    id v149 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v149 = 0;
  }
  if ([(BMPECProcessed *)self hasApparelAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed apparelAssetProcessedCount](self, "apparelAssetProcessedCount"));
    id v148 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v148 = 0;
  }
  if ([(BMPECProcessed *)self hasFoodAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed foodAssetProcessedCount](self, "foodAssetProcessedCount"));
    id v147 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v147 = 0;
  }
  if ([(BMPECProcessed *)self hasStorefrontAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed storefrontAssetProcessedCount](self, "storefrontAssetProcessedCount"));
    id v146 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v146 = 0;
  }
  if ([(BMPECProcessed *)self hasSignSymbolAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed signSymbolAssetProcessedCount](self, "signSymbolAssetProcessedCount"));
    id v145 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v145 = 0;
  }
  if ([(BMPECProcessed *)self hasLaundryCareSymbolAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetProcessedCount](self, "laundryCareSymbolAssetProcessedCount"));
    id v144 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v144 = 0;
  }
  if ([(BMPECProcessed *)self hasAutoSymbolAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed autoSymbolAssetProcessedCount](self, "autoSymbolAssetProcessedCount"));
    id v143 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v143 = 0;
  }
  if ([(BMPECProcessed *)self hasBrandLogoSymbolAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetProcessedCount](self, "brandLogoSymbolAssetProcessedCount"));
    id v142 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v142 = 0;
  }
  if ([(BMPECProcessed *)self hasObject2DAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed object2DAssetProcessedCount](self, "object2DAssetProcessedCount"));
    id v141 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v141 = 0;
  }
  if ([(BMPECProcessed *)self hasBarcodeDetectionAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetProcessedCount](self, "barcodeDetectionAssetProcessedCount"));
    id v140 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v140 = 0;
  }
  if ([(BMPECProcessed *)self hasSculptureAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed sculptureAssetProcessedCount](self, "sculptureAssetProcessedCount"));
    id v139 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v139 = 0;
  }
  if ([(BMPECProcessed *)self hasSkylineAssetProcessedCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed skylineAssetProcessedCount](self, "skylineAssetProcessedCount"));
    id v138 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v138 = 0;
  }
  if ([(BMPECProcessed *)self hasArtAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed artAssetSuccessesCount](self, "artAssetSuccessesCount"));
    id v137 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v137 = 0;
  }
  if ([(BMPECProcessed *)self hasNatureAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed natureAssetSuccessesCount](self, "natureAssetSuccessesCount"));
    id v136 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v136 = 0;
  }
  if ([(BMPECProcessed *)self hasAnimalsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed animalsAssetSuccessesCount](self, "animalsAssetSuccessesCount"));
    id v135 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v135 = 0;
  }
  if ([(BMPECProcessed *)self hasBirdsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed birdsAssetSuccessesCount](self, "birdsAssetSuccessesCount"));
    id v134 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v134 = 0;
  }
  if ([(BMPECProcessed *)self hasInsectsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed insectsAssetSuccessesCount](self, "insectsAssetSuccessesCount"));
    id v133 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v133 = 0;
  }
  if ([(BMPECProcessed *)self hasReptilesAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed reptilesAssetSuccessesCount](self, "reptilesAssetSuccessesCount"));
    id v132 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v132 = 0;
  }
  if ([(BMPECProcessed *)self hasMammalsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mammalsAssetSuccessesCount](self, "mammalsAssetSuccessesCount"));
    id v131 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v131 = 0;
  }
  if ([(BMPECProcessed *)self hasLandmarkAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed landmarkAssetSuccessesCount](self, "landmarkAssetSuccessesCount"));
    id v130 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v130 = 0;
  }
  if ([(BMPECProcessed *)self hasNaturalLandmarkSuccessesAssetCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed naturalLandmarkSuccessesAssetCount](self, "naturalLandmarkSuccessesAssetCount"));
    id v129 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v129 = 0;
  }
  if ([(BMPECProcessed *)self hasMediaAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mediaAssetSuccessesCount](self, "mediaAssetSuccessesCount"));
    id v128 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v128 = 0;
  }
  if ([(BMPECProcessed *)self hasBookAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed bookAssetSuccessesCount](self, "bookAssetSuccessesCount"));
    id v127 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v127 = 0;
  }
  if ([(BMPECProcessed *)self hasAlbumAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed albumAssetSuccessesCount](self, "albumAssetSuccessesCount"));
    id v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v126 = 0;
  }
  if ([(BMPECProcessed *)self hasCatsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed catsAssetSuccessesCount](self, "catsAssetSuccessesCount"));
    id v125 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v125 = 0;
  }
  if ([(BMPECProcessed *)self hasDogsAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed dogsAssetSuccessesCount](self, "dogsAssetSuccessesCount"));
    id v124 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v124 = 0;
  }
  if ([(BMPECProcessed *)self hasApparelAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed apparelAssetSuccessesCount](self, "apparelAssetSuccessesCount"));
    id v123 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v123 = 0;
  }
  if ([(BMPECProcessed *)self hasFoodAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed foodAssetSuccessesCount](self, "foodAssetSuccessesCount"));
    id v122 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v122 = 0;
  }
  if ([(BMPECProcessed *)self hasStorefrontAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed storefrontAssetSuccessesCount](self, "storefrontAssetSuccessesCount"));
    id v121 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v121 = 0;
  }
  if ([(BMPECProcessed *)self hasSignSymbolAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed signSymbolAssetSuccessesCount](self, "signSymbolAssetSuccessesCount"));
    id v120 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v120 = 0;
  }
  if ([(BMPECProcessed *)self hasLaundryCareSymbolAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetSuccessesCount](self, "laundryCareSymbolAssetSuccessesCount"));
    id v119 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v119 = 0;
  }
  if ([(BMPECProcessed *)self hasAutoSymbolAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed autoSymbolAssetSuccessesCount](self, "autoSymbolAssetSuccessesCount"));
    id v118 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v118 = 0;
  }
  if ([(BMPECProcessed *)self hasBrandLogoSymbolAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetSuccessesCount](self, "brandLogoSymbolAssetSuccessesCount"));
    id v117 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v117 = 0;
  }
  if ([(BMPECProcessed *)self hasObject2DAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed object2DAssetSuccessesCount](self, "object2DAssetSuccessesCount"));
    id v116 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v116 = 0;
  }
  if ([(BMPECProcessed *)self hasBarcodeDetectionAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetSuccessesCount](self, "barcodeDetectionAssetSuccessesCount"));
    id v115 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v115 = 0;
  }
  if ([(BMPECProcessed *)self hasSculptureAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed sculptureAssetSuccessesCount](self, "sculptureAssetSuccessesCount"));
    id v114 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v114 = 0;
  }
  if ([(BMPECProcessed *)self hasSkylineAssetSuccessesCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed skylineAssetSuccessesCount](self, "skylineAssetSuccessesCount"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v156[0] = @"artAssetProcessedCount";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v11;
  v157[0] = v11;
  v156[1] = @"natureAssetProcessedCount";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v104 = (void *)v12;
  v157[1] = v12;
  v156[2] = @"animalsAssetProcessedCount";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v103 = (void *)v13;
  v157[2] = v13;
  v156[3] = @"birdsAssetProcessedCount";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = (void *)v14;
  v157[3] = v14;
  v156[4] = @"insectsAssetProcessedCount";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v15;
  v157[4] = v15;
  v156[5] = @"reptilesAssetProcessedCount";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v16;
  v157[5] = v16;
  v156[6] = @"mammalsAssetProcessedCount";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v17;
  v157[6] = v17;
  v156[7] = @"landmarkAssetProcessedCount";
  uint64_t v18 = (uint64_t)v155;
  if (!v155)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[7] = v18;
  v156[8] = @"naturalLandmarkProcessedAssetCount";
  uint64_t v19 = (uint64_t)v154;
  if (!v154)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[8] = v19;
  v156[9] = @"mediaAssetProcessedCount";
  uint64_t v20 = (uint64_t)v153;
  if (!v153)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v20;
  v157[9] = v20;
  v156[10] = @"bookAssetProcessedCount";
  uint64_t v21 = (uint64_t)v152;
  if (!v152)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = v7;
  v109 = (void *)v21;
  v157[10] = v21;
  v156[11] = @"albumAssetProcessedCount";
  uint64_t v22 = (uint64_t)v151;
  if (!v151)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v23 = v6;
  v96 = (void *)v22;
  v157[11] = v22;
  v156[12] = @"catsAssetProcessedCount";
  uint64_t v24 = (uint64_t)v150;
  if (!v150)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v24;
  v157[12] = v24;
  v156[13] = @"dogsAssetProcessedCount";
  uint64_t v26 = (uint64_t)v149;
  if (!v149)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v26;
  v157[13] = v26;
  v156[14] = @"apparelAssetProcessedCount";
  uint64_t v27 = (uint64_t)v148;
  if (!v148)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)v27;
  v157[14] = v27;
  v156[15] = @"foodAssetProcessedCount";
  uint64_t v28 = (uint64_t)v147;
  if (!v147)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v93 = (void *)v28;
  v157[15] = v28;
  v156[16] = @"storefrontAssetProcessedCount";
  uint64_t v29 = (uint64_t)v146;
  if (!v146)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)v29;
  v157[16] = v29;
  v156[17] = @"signSymbolAssetProcessedCount";
  uint64_t v30 = (uint64_t)v145;
  if (!v145)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)v30;
  v157[17] = v30;
  v156[18] = @"laundryCareSymbolAssetProcessedCount";
  uint64_t v31 = (uint64_t)v144;
  if (!v144)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v90 = (void *)v31;
  v157[18] = v31;
  v156[19] = @"autoSymbolAssetProcessedCount";
  uint64_t v32 = (uint64_t)v143;
  if (!v143)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)v32;
  v157[19] = v32;
  v156[20] = @"brandLogoSymbolAssetProcessedCount";
  uint64_t v33 = (uint64_t)v142;
  if (!v142)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v88 = (void *)v33;
  v157[20] = v33;
  v156[21] = @"object2DAssetProcessedCount";
  uint64_t v34 = (uint64_t)v141;
  if (!v141)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = (void *)v34;
  v157[21] = v34;
  v156[22] = @"barcodeDetectionAssetProcessedCount";
  uint64_t v35 = (uint64_t)v140;
  if (!v140)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)v35;
  v157[22] = v35;
  v156[23] = @"sculptureAssetProcessedCount";
  uint64_t v36 = (uint64_t)v139;
  if (!v139)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)v36;
  v157[23] = v36;
  v156[24] = @"skylineAssetProcessedCount";
  uint64_t v37 = (uint64_t)v138;
  if (!v138)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = (void *)v37;
  v157[24] = v37;
  v156[25] = @"artAssetSuccessesCount";
  uint64_t v38 = (uint64_t)v137;
  if (!v137)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)v38;
  v157[25] = v38;
  v156[26] = @"natureAssetSuccessesCount";
  uint64_t v39 = (uint64_t)v136;
  if (!v136)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)v39;
  v157[26] = v39;
  v156[27] = @"animalsAssetSuccessesCount";
  uint64_t v40 = (uint64_t)v135;
  if (!v135)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v81 = (void *)v40;
  v157[27] = v40;
  v156[28] = @"birdsAssetSuccessesCount";
  uint64_t v41 = (uint64_t)v134;
  if (!v134)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = (void *)v41;
  v157[28] = v41;
  v156[29] = @"insectsAssetSuccessesCount";
  uint64_t v42 = (uint64_t)v133;
  if (!v133)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)v42;
  v157[29] = v42;
  v156[30] = @"reptilesAssetSuccessesCount";
  uint64_t v43 = (uint64_t)v132;
  if (!v132)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = (void *)v43;
  v157[30] = v43;
  v156[31] = @"mammalsAssetSuccessesCount";
  uint64_t v44 = (uint64_t)v131;
  if (!v131)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v44;
  v157[31] = v44;
  v156[32] = @"landmarkAssetSuccessesCount";
  uint64_t v45 = (uint64_t)v130;
  if (!v130)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)v45;
  v157[32] = v45;
  v156[33] = @"naturalLandmarkSuccessesAssetCount";
  uint64_t v46 = (uint64_t)v129;
  if (!v129)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v46;
  v157[33] = v46;
  v156[34] = @"mediaAssetSuccessesCount";
  uint64_t v47 = (uint64_t)v128;
  if (!v128)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v47;
  v157[34] = v47;
  v156[35] = @"bookAssetSuccessesCount";
  uint64_t v48 = (uint64_t)v127;
  if (!v127)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v48;
  v157[35] = v48;
  v156[36] = @"albumAssetSuccessesCount";
  uint64_t v49 = (uint64_t)v126;
  if (!v126)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)v49;
  v157[36] = v49;
  v156[37] = @"catsAssetSuccessesCount";
  uint64_t v50 = (uint64_t)v125;
  if (!v125)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v50;
  v157[37] = v50;
  v156[38] = @"dogsAssetSuccessesCount";
  uint64_t v51 = (uint64_t)v124;
  if (!v124)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = v3;
  v70 = (void *)v51;
  v157[38] = v51;
  v156[39] = @"apparelAssetSuccessesCount";
  uint64_t v52 = (uint64_t)v123;
  if (!v123)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v52;
  v157[39] = v52;
  v156[40] = @"foodAssetSuccessesCount";
  uint64_t v53 = (uint64_t)v122;
  if (!v122)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v53;
  v157[40] = v53;
  v156[41] = @"storefrontAssetSuccessesCount";
  uint64_t v54 = (uint64_t)v121;
  if (!v121)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v111 = v9;
  v67 = (void *)v54;
  v157[41] = v54;
  v156[42] = @"signSymbolAssetSuccessesCount";
  uint64_t v55 = (uint64_t)v120;
  if (!v120)
  {
    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v98 = (void *)v18;
  v66 = (void *)v55;
  v157[42] = v55;
  v156[43] = @"laundryCareSymbolAssetSuccessesCount";
  uint64_t v56 = (uint64_t)v119;
  if (!v119)
  {
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v19;
  v65 = (void *)v56;
  v157[43] = v56;
  v156[44] = @"autoSymbolAssetSuccessesCount";
  v57 = v118;
  if (!v118)
  {
    v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[44] = v57;
  v156[45] = @"brandLogoSymbolAssetSuccessesCount";
  v58 = v117;
  if (!v117)
  {
    v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = v10;
  v108 = v8;
  v157[45] = v58;
  v156[46] = @"object2DAssetSuccessesCount";
  v59 = v116;
  if (!v116)
  {
    v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[46] = v59;
  v156[47] = @"barcodeDetectionAssetSuccessesCount";
  v60 = v115;
  if (!v115)
  {
    v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[47] = v60;
  v156[48] = @"sculptureAssetSuccessesCount";
  v61 = v114;
  if (!v114)
  {
    v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[48] = v61;
  v156[49] = @"skylineAssetSuccessesCount";
  v62 = v113;
  if (!v113)
  {
    v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v157[49] = v62;
  id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:50];
  if (!v113) {

  }
  v63 = v25;
  if (!v114)
  {

    v63 = v25;
  }
  if (!v115)
  {

    v63 = v25;
  }
  if (!v116)
  {

    v63 = v25;
  }
  if (!v117)
  {

    v63 = v25;
  }
  if (!v118)
  {

    v63 = v25;
  }
  if (!v119)
  {

    v63 = v25;
  }
  if (!v120)
  {

    v63 = v25;
  }
  if (!v121)
  {

    v63 = v25;
  }
  if (!v122)
  {

    v63 = v25;
  }
  if (!v123)
  {

    v63 = v25;
  }
  if (!v124)
  {

    v63 = v25;
  }
  if (!v125)
  {

    v63 = v25;
  }
  if (!v126)
  {

    v63 = v25;
  }
  if (!v127)
  {

    v63 = v25;
  }
  if (!v128)
  {

    v63 = v25;
  }
  if (!v129)
  {

    v63 = v25;
  }
  if (!v130)
  {

    v63 = v25;
  }
  if (!v131)
  {

    v63 = v25;
  }
  if (!v132)
  {

    v63 = v25;
  }
  if (!v133)
  {

    v63 = v25;
  }
  if (!v134)
  {

    v63 = v25;
  }
  if (!v135)
  {

    v63 = v25;
  }
  if (!v136)
  {

    v63 = v25;
  }
  if (!v137)
  {

    v63 = v25;
  }
  if (!v138)
  {

    v63 = v25;
  }
  if (!v139)
  {

    v63 = v25;
  }
  if (!v140)
  {

    v63 = v25;
  }
  if (!v141)
  {

    v63 = v25;
  }
  if (!v142)
  {

    v63 = v25;
  }
  if (!v143)
  {

    v63 = v25;
  }
  if (!v144)
  {

    v63 = v25;
  }
  if (!v145)
  {

    v63 = v25;
  }
  if (!v146)
  {

    v63 = v25;
  }
  if (!v147)
  {

    v63 = v25;
  }
  if (!v148)
  {

    v63 = v25;
  }
  if (!v149)
  {

    v63 = v25;
  }
  if (!v150) {

  }
  if (!v151) {
  if (!v152)
  }

  if (!v153) {
  if (!v154)
  }

  if (v155)
  {
    if (v111) {
      goto LABEL_337;
    }
  }
  else
  {

    if (v111)
    {
LABEL_337:
      if (v108) {
        goto LABEL_338;
      }
      goto LABEL_348;
    }
  }

  if (v108)
  {
LABEL_338:
    if (v107) {
      goto LABEL_339;
    }
    goto LABEL_349;
  }
LABEL_348:

  if (v107)
  {
LABEL_339:
    if (v23) {
      goto LABEL_340;
    }
    goto LABEL_350;
  }
LABEL_349:

  if (v23)
  {
LABEL_340:
    if (v5) {
      goto LABEL_341;
    }
    goto LABEL_351;
  }
LABEL_350:

  if (v5)
  {
LABEL_341:
    if (v4) {
      goto LABEL_342;
    }
LABEL_352:

    if (v112) {
      goto LABEL_343;
    }
    goto LABEL_353;
  }
LABEL_351:

  if (!v4) {
    goto LABEL_352;
  }
LABEL_342:
  if (v112) {
    goto LABEL_343;
  }
LABEL_353:

LABEL_343:

  return v106;
}

- (BMPECProcessed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v711[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"artAssetProcessedCount"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v611 = [v6 objectForKeyedSubscript:@"natureAssetProcessedCount"];
    if (!v611 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v610 = v8;
      id v9 = a4;
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v610 = v8;
      id v9 = a4;
      id v10 = v611;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"animalsAssetProcessedCount"];
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v607 = v10;
        id v12 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v607 = v10;
        id v12 = v11;
LABEL_10:
        uint64_t v13 = [v6 objectForKeyedSubscript:@"birdsAssetProcessedCount"];
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v601 = v13;
          id v608 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v601 = v13;
          id v608 = v13;
LABEL_13:
          uint64_t v14 = [v6 objectForKeyedSubscript:@"insectsAssetProcessedCount"];
          v604 = (void *)v14;
          if (!v14 || (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v602 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v602 = v15;
LABEL_16:
            uint64_t v16 = [v6 objectForKeyedSubscript:@"reptilesAssetProcessedCount"];
            v600 = (void *)v16;
            if (!v16 || (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v557 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v557 = v17;
LABEL_19:
              uint64_t v18 = [v6 objectForKeyedSubscript:@"mammalsAssetProcessedCount"];
              v599 = (void *)v18;
              if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v597 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v597 = v19;
LABEL_22:
                uint64_t v20 = [v6 objectForKeyedSubscript:@"landmarkAssetProcessedCount"];
                v556 = (void *)v20;
                if (!v20 || (uint64_t v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v552 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v552 = v21;
LABEL_25:
                  uint64_t v22 = [v6 objectForKeyedSubscript:@"naturalLandmarkProcessedAssetCount"];
                  v551 = (void *)v22;
                  if (!v22 || (int v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v24 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v24 = v23;
LABEL_28:
                    uint64_t v25 = [v6 objectForKeyedSubscript:@"mediaAssetProcessedCount"];
                    v549 = (void *)v25;
                    if (!v25 || (uint64_t v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v544 = 0;
LABEL_31:
                      uint64_t v27 = [v6 objectForKeyedSubscript:@"bookAssetProcessedCount"];
                      v547 = (void *)v27;
                      if (v27 && (uint64_t v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v9)
                          {
                            id v545 = 0;
                            uint64_t v38 = 0;
                            uint64_t v48 = v601;
                            id v8 = v610;
LABEL_455:
                            v157 = v544;
                            goto LABEL_456;
                          }
                          v169 = v9;
                          id v546 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v564 = v12;
                          uint64_t v170 = *MEMORY[0x1E4F502C8];
                          uint64_t v690 = *MEMORY[0x1E4F28568];
                          id v171 = [NSString alloc];
                          uint64_t v434 = objc_opt_class();
                          v172 = v171;
                          id v8 = v610;
                          uint64_t v173 = [v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v434, @"bookAssetProcessedCount"];
                          uint64_t v691 = v173;
                          uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v691 forKeys:&v690 count:1];
                          uint64_t v175 = v170;
                          id v12 = v564;
                          v543 = (void *)v174;
                          id v176 = (id)objc_msgSend(v546, "initWithDomain:code:userInfo:", v175, 2);
                          uint64_t v38 = 0;
                          id v545 = 0;
                          id *v169 = v176;
                          v177 = (void *)v173;
                          uint64_t v48 = v601;
                          goto LABEL_454;
                        }
                        id v545 = v28;
                      }
                      else
                      {
                        id v545 = 0;
                      }
                      uint64_t v29 = [v6 objectForKeyedSubscript:@"albumAssetProcessedCount"];
                      id v540 = v24;
                      v543 = (void *)v29;
                      if (!v29 || (uint64_t v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        uint64_t v31 = 0;
LABEL_37:
                        uint64_t v32 = [v6 objectForKeyedSubscript:@"catsAssetProcessedCount"];
                        v539 = v31;
                        v541 = v32;
                        if (!v32) {
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v32 = 0;
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v32 = v32;
LABEL_85:
                          uint64_t v89 = [v6 objectForKeyedSubscript:@"dogsAssetProcessedCount"];
                          v537 = v32;
                          v538 = (void *)v89;
                          if (!v89 || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v535 = 0;
                            goto LABEL_88;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v535 = v90;
LABEL_88:
                            uint64_t v91 = [v6 objectForKeyedSubscript:@"apparelAssetProcessedCount"];
                            v536 = (void *)v91;
                            if (!v91 || (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v533 = 0;
                              goto LABEL_91;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v533 = v92;
LABEL_91:
                              uint64_t v93 = [v6 objectForKeyedSubscript:@"foodAssetProcessedCount"];
                              v534 = (void *)v93;
                              if (!v93 || (v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v532 = 0;
LABEL_94:
                                uint64_t v95 = [v6 objectForKeyedSubscript:@"storefrontAssetProcessedCount"];
                                v531 = (void *)v95;
                                if (v95 && (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v9)
                                    {
                                      id v530 = 0;
                                      uint64_t v38 = 0;
                                      uint64_t v48 = v601;
                                      id v8 = v610;
LABEL_448:
                                      v197 = v533;
                                      goto LABEL_449;
                                    }
                                    v214 = v9;
                                    id v215 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v570 = v12;
                                    uint64_t v216 = *MEMORY[0x1E4F502C8];
                                    uint64_t v678 = *MEMORY[0x1E4F28568];
                                    id v217 = [NSString alloc];
                                    uint64_t v440 = objc_opt_class();
                                    v218 = v217;
                                    id v8 = v610;
                                    v219 = (void *)[v218 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v440, @"storefrontAssetProcessedCount"];
                                    v679 = v219;
                                    uint64_t v220 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v679 forKeys:&v678 count:1];
                                    uint64_t v221 = v216;
                                    id v12 = v570;
                                    v529 = (void *)v220;
                                    uint64_t v38 = 0;
                                    id v530 = 0;
                                    id *v214 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v221, 2);
                                    uint64_t v48 = v601;
                                    goto LABEL_267;
                                  }
                                  id v530 = v96;
                                }
                                else
                                {
                                  id v530 = 0;
                                }
                                uint64_t v97 = [v6 objectForKeyedSubscript:@"signSymbolAssetProcessedCount"];
                                v529 = (void *)v97;
                                if (!v97 || (v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v526 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v526 = v98;
LABEL_100:
                                  uint64_t v99 = [v6 objectForKeyedSubscript:@"laundryCareSymbolAssetProcessedCount"];
                                  v528 = (void *)v99;
                                  if (!v99
                                    || (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v527 = 0;
                                    goto LABEL_103;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v527 = v100;
LABEL_103:
                                    uint64_t v101 = [v6 objectForKeyedSubscript:@"autoSymbolAssetProcessedCount"];
                                    v525 = (void *)v101;
                                    if (!v101
                                      || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v524 = 0;
                                      goto LABEL_106;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v524 = v102;
LABEL_106:
                                      uint64_t v103 = [v6 objectForKeyedSubscript:@"brandLogoSymbolAssetProcessedCount"];
                                      v523 = (void *)v103;
                                      if (!v103
                                        || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v522 = 0;
                                        goto LABEL_109;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v522 = v104;
LABEL_109:
                                        uint64_t v105 = [v6 objectForKeyedSubscript:@"object2DAssetProcessedCount"];
                                        v521 = (void *)v105;
                                        if (!v105
                                          || (id v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v520 = 0;
LABEL_112:
                                          uint64_t v107 = [v6 objectForKeyedSubscript:@"barcodeDetectionAssetProcessedCount"];
                                          v518 = (void *)v107;
                                          if (v107
                                            && (v108 = (void *)v107,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) == 0))
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v9)
                                              {
                                                id v517 = 0;
                                                uint64_t v38 = 0;
                                                uint64_t v48 = v601;
                                                id v8 = v610;
LABEL_441:
                                                v219 = v526;
                                                goto LABEL_442;
                                              }
                                              v257 = v9;
                                              id v258 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v576 = v12;
                                              uint64_t v259 = *MEMORY[0x1E4F502C8];
                                              uint64_t v666 = *MEMORY[0x1E4F28568];
                                              id v260 = [NSString alloc];
                                              uint64_t v446 = objc_opt_class();
                                              v261 = v260;
                                              id v8 = v610;
                                              v262 = (void *)[v261 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v446, @"barcodeDetectionAssetProcessedCount"];
                                              v667 = v262;
                                              uint64_t v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v667 forKeys:&v666 count:1];
                                              uint64_t v264 = v259;
                                              id v12 = v576;
                                              v516 = (void *)v263;
                                              uint64_t v38 = 0;
                                              id v517 = 0;
                                              id *v257 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v264, 2);
                                              uint64_t v48 = v601;
                                              goto LABEL_298;
                                            }
                                            id v517 = v108;
                                          }
                                          else
                                          {
                                            id v517 = 0;
                                          }
                                          uint64_t v109 = [v6 objectForKeyedSubscript:@"sculptureAssetProcessedCount"];
                                          v516 = (void *)v109;
                                          if (!v109
                                            || (v110 = (void *)v109,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v519 = 0;
LABEL_118:
                                            uint64_t v111 = [v6 objectForKeyedSubscript:@"skylineAssetProcessedCount"];
                                            v515 = (void *)v111;
                                            if (v111
                                              && (v112 = (void *)v111,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v9)
                                                {
                                                  id v514 = 0;
                                                  uint64_t v38 = 0;
                                                  uint64_t v48 = v601;
                                                  id v8 = v610;
LABEL_438:
                                                  v262 = v519;
                                                  goto LABEL_439;
                                                }
                                                v272 = v9;
                                                id v273 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                id v578 = v12;
                                                uint64_t v274 = *MEMORY[0x1E4F502C8];
                                                uint64_t v662 = *MEMORY[0x1E4F28568];
                                                id v275 = [NSString alloc];
                                                uint64_t v448 = objc_opt_class();
                                                v276 = v275;
                                                id v8 = v610;
                                                v277 = (void *)[v276 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v448, @"skylineAssetProcessedCount"];
                                                v663 = v277;
                                                uint64_t v278 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v663 forKeys:&v662 count:1];
                                                uint64_t v279 = v274;
                                                id v12 = v578;
                                                v513 = (void *)v278;
                                                uint64_t v38 = 0;
                                                id v514 = 0;
                                                id *v272 = (id)objc_msgSend(v273, "initWithDomain:code:userInfo:", v279, 2);
                                                uint64_t v48 = v601;
                                                goto LABEL_309;
                                              }
                                              id v514 = v112;
                                            }
                                            else
                                            {
                                              id v514 = 0;
                                            }
                                            uint64_t v113 = [v6 objectForKeyedSubscript:@"artAssetSuccessesCount"];
                                            v513 = (void *)v113;
                                            if (!v113
                                              || (id v114 = (void *)v113,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v510 = 0;
LABEL_124:
                                              uint64_t v115 = [v6 objectForKeyedSubscript:@"natureAssetSuccessesCount"];
                                              v512 = (void *)v115;
                                              if (v115
                                                && (id v116 = (void *)v115,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  if (!v9)
                                                  {
                                                    id v511 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
LABEL_435:
                                                    v277 = v510;
                                                    goto LABEL_436;
                                                  }
                                                  v287 = v9;
                                                  id v288 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v580 = v12;
                                                  uint64_t v289 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v658 = *MEMORY[0x1E4F28568];
                                                  id v290 = [NSString alloc];
                                                  uint64_t v450 = objc_opt_class();
                                                  v291 = v290;
                                                  id v8 = v610;
                                                  id v292 = v533;
                                                  id v508 = (id)[v291 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v450, @"natureAssetSuccessesCount"];
                                                  id v659 = v508;
                                                  uint64_t v293 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v659 forKeys:&v658 count:1];
                                                  uint64_t v294 = v289;
                                                  id v12 = v580;
                                                  v509 = (void *)v293;
                                                  uint64_t v38 = 0;
                                                  id v511 = 0;
                                                  id *v287 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v294, 2);
                                                  uint64_t v48 = v601;
                                                  uint64_t v32 = v537;
LABEL_434:
                                                  id v533 = v292;

                                                  goto LABEL_435;
                                                }
                                                id v511 = v116;
                                              }
                                              else
                                              {
                                                id v511 = 0;
                                              }
                                              uint64_t v117 = [v6 objectForKeyedSubscript:@"animalsAssetSuccessesCount"];
                                              v509 = (void *)v117;
                                              if (v117
                                                && (id v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  id v295 = v519;
                                                  if (!v9)
                                                  {
                                                    id v508 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
LABEL_433:
                                                    id v292 = v533;
                                                    goto LABEL_434;
                                                  }
                                                  v296 = v9;
                                                  id v297 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v581 = v12;
                                                  uint64_t v298 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v656 = *MEMORY[0x1E4F28568];
                                                  id v299 = [NSString alloc];
                                                  uint64_t v451 = objc_opt_class();
                                                  v300 = v299;
                                                  id v8 = v610;
                                                  id v506 = (id)[v300 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v451, @"animalsAssetSuccessesCount"];
                                                  id v657 = v506;
                                                  uint64_t v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v657 forKeys:&v656 count:1];
                                                  uint64_t v302 = v298;
                                                  id v12 = v581;
                                                  v507 = (void *)v301;
                                                  uint64_t v38 = 0;
                                                  id v508 = 0;
                                                  id *v296 = (id)objc_msgSend(v297, "initWithDomain:code:userInfo:", v302, 2);
                                                  uint64_t v48 = v601;
                                                  uint64_t v32 = v537;
                                                  goto LABEL_432;
                                                }
                                                id v508 = v118;
                                              }
                                              else
                                              {
                                                id v508 = 0;
                                              }
                                              uint64_t v119 = [v6 objectForKeyedSubscript:@"birdsAssetSuccessesCount"];
                                              v507 = (void *)v119;
                                              if (!v119
                                                || (id v120 = (void *)v119,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v506 = 0;
                                                goto LABEL_133;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v506 = v120;
LABEL_133:
                                                uint64_t v121 = [v6 objectForKeyedSubscript:@"insectsAssetSuccessesCount"];
                                                v505 = (void *)v121;
                                                if (!v121
                                                  || (id v122 = (void *)v121,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v504 = 0;
                                                  goto LABEL_136;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v504 = v122;
LABEL_136:
                                                  uint64_t v123 = [v6 objectForKeyedSubscript:@"reptilesAssetSuccessesCount"];
                                                  v503 = (void *)v123;
                                                  if (!v123
                                                    || (id v124 = (void *)v123,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v502 = 0;
                                                    goto LABEL_139;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v502 = v124;
LABEL_139:
                                                    uint64_t v125 = [v6 objectForKeyedSubscript:@"mammalsAssetSuccessesCount"];
                                                    v501 = (void *)v125;
                                                    if (!v125
                                                      || (id v126 = (void *)v125,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v500 = 0;
                                                      goto LABEL_142;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v500 = v126;
LABEL_142:
                                                      uint64_t v127 = [v6 objectForKeyedSubscript:@"landmarkAssetSuccessesCount"];
                                                      v499 = (void *)v127;
                                                      if (!v127
                                                        || (id v128 = (void *)v127,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v498 = 0;
LABEL_145:
                                                        uint64_t v129 = [v6 objectForKeyedSubscript:@"naturalLandmarkSuccessesAssetCount"];
                                                        v497 = (void *)v129;
                                                        if (v129
                                                          && (id v130 = (void *)v129,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v496 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_426:
                                                              id v295 = v519;
                                                              goto LABEL_427;
                                                            }
                                                            v338 = v9;
                                                            id v339 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v587 = v12;
                                                            uint64_t v340 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v644 = *MEMORY[0x1E4F28568];
                                                            id v341 = [NSString alloc];
                                                            uint64_t v457 = objc_opt_class();
                                                            v342 = v341;
                                                            id v8 = v610;
                                                            id v495 = (id)[v342 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v457, @"naturalLandmarkSuccessesAssetCount"];
                                                            id v645 = v495;
                                                            v343 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v645 forKeys:&v644 count:1];
                                                            uint64_t v344 = v340;
                                                            id v12 = v587;
                                                            uint64_t v38 = 0;
                                                            id v496 = 0;
                                                            id *v338 = (id)[v339 initWithDomain:v344 code:2 userInfo:v343];
                                                            uint64_t v48 = v601;
                                                            uint64_t v32 = v537;
LABEL_425:

                                                            goto LABEL_426;
                                                          }
                                                          id v496 = v130;
                                                        }
                                                        else
                                                        {
                                                          id v496 = 0;
                                                        }
                                                        uint64_t v131 = [v6 objectForKeyedSubscript:@"mediaAssetSuccessesCount"];
                                                        v494 = (void *)v131;
                                                        if (v131
                                                          && (id v132 = (void *)v131,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v495 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_424:
                                                              v343 = v494;
                                                              goto LABEL_425;
                                                            }
                                                            v345 = v9;
                                                            id v346 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v588 = v12;
                                                            uint64_t v347 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v642 = *MEMORY[0x1E4F28568];
                                                            id v348 = [NSString alloc];
                                                            uint64_t v458 = objc_opt_class();
                                                            v349 = v348;
                                                            id v8 = v610;
                                                            id v493 = (id)[v349 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v458, @"mediaAssetSuccessesCount"];
                                                            id v643 = v493;
                                                            v350 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v643 forKeys:&v642 count:1];
                                                            uint64_t v351 = v347;
                                                            id v12 = v588;
                                                            uint64_t v38 = 0;
                                                            id v495 = 0;
                                                            id *v345 = (id)[v346 initWithDomain:v351 code:2 userInfo:v350];
                                                            uint64_t v48 = v601;
                                                            uint64_t v32 = v537;
LABEL_423:

                                                            goto LABEL_424;
                                                          }
                                                          id v495 = v132;
                                                        }
                                                        else
                                                        {
                                                          id v495 = 0;
                                                        }
                                                        uint64_t v133 = [v6 objectForKeyedSubscript:@"bookAssetSuccessesCount"];
                                                        v492 = (void *)v133;
                                                        if (v133
                                                          && (id v134 = (void *)v133,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              id v493 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
LABEL_422:
                                                              v350 = v492;
                                                              goto LABEL_423;
                                                            }
                                                            v352 = v9;
                                                            id v353 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v589 = v12;
                                                            uint64_t v354 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v640 = *MEMORY[0x1E4F28568];
                                                            id v355 = [NSString alloc];
                                                            uint64_t v459 = objc_opt_class();
                                                            v356 = v355;
                                                            id v8 = v610;
                                                            id v357 = v519;
                                                            id v490 = (id)[v356 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v459, @"bookAssetSuccessesCount"];
                                                            id v641 = v490;
                                                            uint64_t v358 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v641 forKeys:&v640 count:1];
                                                            uint64_t v359 = v354;
                                                            id v12 = v589;
                                                            v491 = (void *)v358;
                                                            uint64_t v38 = 0;
                                                            id v493 = 0;
                                                            id *v352 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v359, 2);
                                                            uint64_t v48 = v601;
                                                            goto LABEL_365;
                                                          }
                                                          id v493 = v134;
                                                        }
                                                        else
                                                        {
                                                          id v493 = 0;
                                                        }
                                                        uint64_t v135 = [v6 objectForKeyedSubscript:@"albumAssetSuccessesCount"];
                                                        v491 = (void *)v135;
                                                        if (!v135
                                                          || (id v136 = (void *)v135,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v490 = 0;
LABEL_157:
                                                          uint64_t v137 = [v6 objectForKeyedSubscript:@"catsAssetSuccessesCount"];
                                                          v488 = (void *)v137;
                                                          if (v137
                                                            && (id v138 = (void *)v137,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              if (!v9)
                                                              {
                                                                id v489 = 0;
                                                                uint64_t v38 = 0;
                                                                uint64_t v48 = v601;
                                                                id v8 = v610;
LABEL_419:
                                                                id v357 = v519;
                                                                goto LABEL_420;
                                                              }
                                                              v367 = v9;
                                                              id v368 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              id v591 = v12;
                                                              uint64_t v369 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v636 = *MEMORY[0x1E4F28568];
                                                              id v370 = [NSString alloc];
                                                              uint64_t v461 = objc_opt_class();
                                                              v371 = v370;
                                                              id v8 = v610;
                                                              id v149 = (void *)[v371 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v461, @"catsAssetSuccessesCount"];
                                                              v637 = v149;
                                                              uint64_t v372 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v637 forKeys:&v636 count:1];
                                                              uint64_t v373 = v369;
                                                              id v12 = v591;
                                                              v485 = (void *)v372;
                                                              uint64_t v38 = 0;
                                                              id v489 = 0;
                                                              id *v367 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                              uint64_t v48 = v601;
                                                              goto LABEL_376;
                                                            }
                                                            id v489 = v138;
                                                          }
                                                          else
                                                          {
                                                            id v489 = 0;
                                                          }
                                                          uint64_t v139 = [v6 objectForKeyedSubscript:@"dogsAssetSuccessesCount"];
                                                          v485 = (void *)v139;
                                                          if (!v139
                                                            || (id v140 = (void *)v139,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v486 = 0;
                                                            goto LABEL_163;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v486 = v140;
LABEL_163:
                                                            uint64_t v141 = [v6 objectForKeyedSubscript:@"apparelAssetSuccessesCount"];
                                                            v484 = (void *)v141;
                                                            if (!v141
                                                              || (id v142 = (void *)v141,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v487 = 0;
                                                              goto LABEL_166;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v487 = v142;
LABEL_166:
                                                              uint64_t v143 = [v6 objectForKeyedSubscript:@"foodAssetSuccessesCount"];
                                                              v481 = (void *)v143;
                                                              if (!v143
                                                                || (id v144 = (void *)v143,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v482 = 0;
                                                                goto LABEL_169;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v482 = v144;
LABEL_169:
                                                                uint64_t v145 = [v6 objectForKeyedSubscript:@"storefrontAssetSuccessesCount"];
                                                                v480 = (void *)v145;
                                                                if (!v145
                                                                  || (id v146 = (void *)v145,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v483 = 0;
                                                                  goto LABEL_172;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v483 = v146;
LABEL_172:
                                                                  uint64_t v147 = [v6 objectForKeyedSubscript:@"signSymbolAssetSuccessesCount"];
                                                                  v479 = (void *)v147;
                                                                  if (!v147
                                                                    || (id v148 = (void *)v147,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v548 = 0;
                                                                    goto LABEL_175;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v548 = v148;
LABEL_175:
                                                                    v477 = [v6 objectForKeyedSubscript:@"laundryCareSymbolAssetSuccessesCount"];
                                                                    if (!v477
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v478 = 0;
LABEL_178:
                                                                      [v6 objectForKeyedSubscript:@"autoSymbolAssetSuccessesCount"];
                                                                      v475 = id v149 = v486;
                                                                      if (v475
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v404 = self;
                                                                          if (!v9)
                                                                          {
                                                                            id v476 = 0;
                                                                            uint64_t v38 = 0;
                                                                            uint64_t v48 = v601;
                                                                            id v8 = v610;
                                                                            goto LABEL_412;
                                                                          }
                                                                          id v405 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v406 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v622 = *MEMORY[0x1E4F28568];
                                                                          id v474 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"autoSymbolAssetSuccessesCount"];
                                                                          id v623 = v474;
                                                                          v473 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v623 forKeys:&v622 count:1];
                                                                          id v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v476 = 0;
                                                                          *id v9 = v407;
                                                                          self = v404;
                                                                          uint64_t v48 = v601;
                                                                          id v8 = v610;
                                                                          goto LABEL_411;
                                                                        }
                                                                        id v476 = v475;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v476 = 0;
                                                                      }
                                                                      v473 = [v6 objectForKeyedSubscript:@"brandLogoSymbolAssetSuccessesCount"];
                                                                      if (v473
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v409 = v11;
                                                                          if (!v9)
                                                                          {
                                                                            id v474 = 0;
                                                                            uint64_t v38 = 0;
                                                                            uint64_t v48 = v601;
                                                                            id v8 = v610;
                                                                            id v149 = v486;
                                                                            goto LABEL_411;
                                                                          }
                                                                          id v410 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v411 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v620 = *MEMORY[0x1E4F28568];
                                                                          id v472 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brandLogoSymbolAssetSuccessesCount"];
                                                                          id v621 = v472;
                                                                          v471 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v621 forKeys:&v620 count:1];
                                                                          id v412 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v474 = 0;
                                                                          *id v9 = v412;
                                                                          goto LABEL_470;
                                                                        }
                                                                        id v474 = v473;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v474 = 0;
                                                                      }
                                                                      v471 = [v6 objectForKeyedSubscript:@"object2DAssetSuccessesCount"];
                                                                      if (!v471
                                                                        || (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v472 = 0;
                                                                        goto LABEL_187;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v472 = v471;
LABEL_187:
                                                                        v469 = [v6 objectForKeyedSubscript:@"barcodeDetectionAssetSuccessesCount"];
                                                                        if (!v469
                                                                          || (objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v470 = 0;
                                                                          id v150 = v487;
                                                                          id v151 = v489;
LABEL_190:
                                                                          id v487 = v150;
                                                                          id v486 = v149;
                                                                          id v489 = v151;
                                                                          id v152 = [v6 objectForKeyedSubscript:@"sculptureAssetSuccessesCount"];
                                                                          v468 = v152;
                                                                          if (!v152)
                                                                          {
LABEL_379:
                                                                            id v402 = [v6 objectForKeyedSubscript:@"skylineAssetSuccessesCount"];
                                                                            v466 = v402;
                                                                            v467 = v152;
                                                                            if (!v402)
                                                                            {
LABEL_382:
                                                                              uint64_t v48 = v601;
                                                                              id v8 = v610;
                                                                              id v403 = v533;
LABEL_383:
                                                                              v465 = v402;
                                                                              id v533 = v403;
                                                                              self = objc_retain(-[BMPECProcessed initWithArtAssetProcessedCount:natureAssetProcessedCount:animalsAssetProcessedCount:birdsAssetProcessedCount:insectsAssetProcessedCount:reptilesAssetProcessedCount:mammalsAssetProcessedCount:landmarkAssetProcessedCount:naturalLandmarkProcessedAssetCount:mediaAssetProcessedCount:bookAssetProcessedCount:albumAssetProcessedCount:catsAssetProcessedCount:dogsAssetProcessedCount:apparelAssetProcessedCount:foodAssetProcessedCount:storefrontAssetProcessedCount:signSymbolAssetProcessedCount:laundryCareSymbolAssetProcessedCount:autoSymbolAssetProcessedCount:brandLogoSymbolAssetProcessedCount:object2DAssetProcessedCount:barcodeDetectionAssetProcessedCount:sculptureAssetProcessedCount:skylineAssetProcessedCount:artAssetSuccessesCount:natureAssetSuccessesCount:animalsAssetSuccessesCount:birdsAssetSuccessesCount:insectsAssetSuccessesCount:reptilesAssetSuccessesCount:mammalsAssetSuccessesCount:landmarkAssetSuccessesCount:naturalLandmarkSuccessesAssetCount:mediaAssetSuccessesCount:bookAssetSuccessesCount:albumAssetSuccessesCount:catsAssetSuccessesCount:dogsAssetSuccessesCount:apparelAssetSuccessesCount:foodAssetSuccessesCount:storefrontAssetSuccessesCount:signSymbolAssetSuccessesCount:laundryCareSymbolAssetSuccessesCount:autoSymbolAssetSuccessesCount:brandLogoSymbolAssetSuccessesCount:object2DAssetSuccessesCount:barcodeDetectionAssetSuccessesCount:sculptureAssetSuccessesCount:skylineAssetSuccessesCount:](self, "initWithArtAssetProcessedCount:natureAssetProcessedCount:animalsAssetProcessedCount:birdsAssetProcessedCount:insectsAssetProcessedCount:reptilesAssetProcessedCount:mammalsAssetProcessedCount:landmarkAssetProcessedCount:naturalLandmarkProcessedAssetCount:mediaAssetProcessedCount:bookAssetProcessedCount:albumAssetProcessedCount:catsAssetProcessedCount:dogsAssetProcessedCount:apparelAssetProcessedCount:foodAssetProcessedCount:storefrontAssetProcessedCount:signSymbolAssetProcessedCount:laundryCareSymbolAssetProcessedCount:aut"
                                                                                         "oSymbolAssetProcessedCount:bran"
                                                                                         "dLogoSymbolAssetProcessedCount:"
                                                                                         "object2DAssetProcessedCount:bar"
                                                                                         "codeDetectionAssetProcessedCoun"
                                                                                         "t:sculptureAssetProcessedCount:"
                                                                                         "skylineAssetProcessedCount:artA"
                                                                                         "ssetSuccessesCount:natureAssetS"
                                                                                         "uccessesCount:animalsAssetSucce"
                                                                                         "ssesCount:birdsAssetSuccessesCo"
                                                                                         "unt:insectsAssetSuccessesCount:"
                                                                                         "reptilesAssetSuccessesCount:mam"
                                                                                         "malsAssetSuccessesCount:landmar"
                                                                                         "kAssetSuccessesCount:naturalLan"
                                                                                         "dmarkSuccessesAssetCount:mediaA"
                                                                                         "ssetSuccessesCount:bookAssetSuc"
                                                                                         "cessesCount:albumAssetSuccesses"
                                                                                         "Count:catsAssetSuccessesCount:d"
                                                                                         "ogsAssetSuccessesCount:apparelA"
                                                                                         "ssetSuccessesCount:foodAssetSuc"
                                                                                         "cessesCount:storefrontAssetSucc"
                                                                                         "essesCount:signSymbolAssetSucce"
                                                                                         "ssesCount:laundryCareSymbolAsse"
                                                                                         "tSuccessesCount:autoSymbolAsset"
                                                                                         "SuccessesCount:brandLogoSymbolA"
                                                                                         "ssetSuccessesCount:object2DAsse"
                                                                                         "tSuccessesCount:barcodeDetectio"
                                                                                         "nAssetSuccessesCount:sculptureA"
                                                                                         "ssetSuccessesCount:skylineAssetSuccessesCount:",
                                                                                         v8,
                                                                                         v607,
                                                                                         v12,
                                                                                         v608,
                                                                                         v602,
                                                                                         v557,
                                                                                         v597,
                                                                                         v552,
                                                                                         v540,
                                                                                         v544,
                                                                                         v545,
                                                                                         v539,
                                                                                         v32,
                                                                                         v535,
                                                                                         v403,
                                                                                         v532,
                                                                                         v530,
                                                                                         v526,
                                                                                         v527,
                                                                                         v524,
                                                                                         v522,
                                                                                         v520,
                                                                                         v517,
                                                                                         v519,
                                                                                         v514,
                                                                                         v510,
                                                                                         v511,
                                                                                         v508,
                                                                                         v506,
                                                                                         v504,
                                                                                         v502,
                                                                                         v500,
                                                                                         v498,
                                                                                         v496,
                                                                                         v495,
                                                                                         v493,
                                                                                         v490,
                                                                                         v489,
                                                                                         v486,
                                                                                         v487,
                                                                                         v482,
                                                                                         v483,
                                                                                         v548,
                                                                                         v478,
                                                                                         v476,
                                                                                         v474,
                                                                                         v472,
                                                                                         v470,
                                                                                         v152,
                                                                                         v402));
                                                                              uint64_t v38 = self;
LABEL_407:

LABEL_408:
                                                                              id v149 = v486;

LABEL_409:
LABEL_410:

LABEL_411:
                                                                              goto LABEL_412;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v402 = 0;
                                                                              goto LABEL_382;
                                                                            }
                                                                            v408 = self;
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v402 = v466;
                                                                              id v8 = v610;
                                                                              uint64_t v48 = v601;
                                                                              id v403 = v533;
                                                                              goto LABEL_383;
                                                                            }
                                                                            if (v9)
                                                                            {
                                                                              id v423 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v596 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v612 = *MEMORY[0x1E4F28568];
                                                                              v424 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"skylineAssetSuccessesCount"];
                                                                              v613 = v424;
                                                                              v425 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v613 forKeys:&v612 count:1];
                                                                              *id v9 = (id)[v423 initWithDomain:v596 code:2 userInfo:v425];
                                                                            }
                                                                            v465 = 0;
                                                                            uint64_t v38 = 0;
                                                                            self = v408;
                                                                            id v8 = v610;
LABEL_406:
                                                                            uint64_t v48 = v601;
                                                                            uint64_t v32 = v537;
                                                                            goto LABEL_407;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v152 = 0;
                                                                            goto LABEL_379;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v152 = v152;
                                                                            goto LABEL_379;
                                                                          }
                                                                          id v595 = v12;
                                                                          id v555 = v6;
                                                                          v416 = v610;
                                                                          if (v9)
                                                                          {
                                                                            id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v421 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v614 = *MEMORY[0x1E4F28568];
                                                                            v465 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sculptureAssetSuccessesCount"];
                                                                            v615 = v465;
                                                                            v466 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v615 forKeys:&v614 count:1];
                                                                            id v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                            uint64_t v38 = 0;
                                                                            v467 = 0;
                                                                            *id v9 = v422;
                                                                            id v8 = v610;
                                                                            id v6 = v555;
                                                                            goto LABEL_406;
                                                                          }
                                                                          v467 = 0;
                                                                          uint64_t v38 = 0;
LABEL_474:
                                                                          id v8 = v416;
                                                                          id v6 = v555;
                                                                          id v12 = v595;
                                                                          uint64_t v48 = v601;
                                                                          goto LABEL_408;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v470 = v469;
                                                                          id v151 = v489;
                                                                          id v149 = v486;
                                                                          id v150 = v487;
                                                                          goto LABEL_190;
                                                                        }
                                                                        id v595 = v12;
                                                                        id v555 = v6;
                                                                        v416 = v610;
                                                                        if (v9)
                                                                        {
                                                                          id v417 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v418 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v616 = *MEMORY[0x1E4F28568];
                                                                          v467 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"barcodeDetectionAssetSuccessesCount"];
                                                                          v617 = v467;
                                                                          v468 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v617 forKeys:&v616 count:1];
                                                                          id v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                          uint64_t v38 = 0;
                                                                          id v470 = 0;
                                                                          *id v9 = v419;
                                                                          goto LABEL_474;
                                                                        }
                                                                        id v470 = 0;
                                                                        uint64_t v38 = 0;
                                                                        id v8 = v610;
                                                                        id v6 = v555;
                                                                        uint64_t v48 = v601;
LABEL_472:
                                                                        uint64_t v32 = v537;
                                                                        id v149 = v486;
                                                                        goto LABEL_409;
                                                                      }
                                                                      v409 = v11;
                                                                      if (v9)
                                                                      {
                                                                        id v413 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v414 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v618 = *MEMORY[0x1E4F28568];
                                                                        id v470 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"object2DAssetSuccessesCount"];
                                                                        id v619 = v470;
                                                                        v469 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v619 forKeys:&v618 count:1];
                                                                        id v415 = (id)objc_msgSend(v413, "initWithDomain:code:userInfo:", v414, 2);
                                                                        uint64_t v38 = 0;
                                                                        id v472 = 0;
                                                                        *id v9 = v415;
                                                                        uint64_t v48 = v601;
                                                                        id v8 = v610;
                                                                        goto LABEL_472;
                                                                      }
                                                                      id v472 = 0;
                                                                      uint64_t v38 = 0;
LABEL_470:
                                                                      uint64_t v48 = v601;
                                                                      id v8 = v610;
                                                                      uint64_t v11 = v409;
                                                                      uint64_t v32 = v537;
                                                                      id v149 = v486;
                                                                      goto LABEL_410;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v478 = v477;
                                                                      goto LABEL_178;
                                                                    }
                                                                    v395 = self;
                                                                    if (v9)
                                                                    {
                                                                      id v400 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v401 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v624 = *MEMORY[0x1E4F28568];
                                                                      id v476 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"laundryCareSymbolAssetSuccessesCount"];
                                                                      id v625 = v476;
                                                                      v475 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v625 forKeys:&v624 count:1];
                                                                      uint64_t v38 = 0;
                                                                      id v478 = 0;
                                                                      *id v9 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v401, 2);
                                                                      self = v395;
                                                                      uint64_t v48 = v601;
                                                                      id v8 = v610;
                                                                      id v149 = v486;
LABEL_412:

                                                                      goto LABEL_413;
                                                                    }
                                                                    id v478 = 0;
                                                                    uint64_t v38 = 0;
LABEL_402:
                                                                    self = v395;
                                                                    uint64_t v48 = v601;
                                                                    id v8 = v610;
                                                                    id v149 = v486;
LABEL_413:

                                                                    goto LABEL_414;
                                                                  }
                                                                  v395 = self;
                                                                  if (v9)
                                                                  {
                                                                    id v398 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v399 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v626 = *MEMORY[0x1E4F28568];
                                                                    id v478 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"signSymbolAssetSuccessesCount"];
                                                                    id v627 = v478;
                                                                    v477 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v627 forKeys:&v626 count:1];
                                                                    uint64_t v38 = 0;
                                                                    id v548 = 0;
                                                                    *id v9 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v399, 2);
                                                                    goto LABEL_402;
                                                                  }
                                                                  id v548 = 0;
                                                                  uint64_t v38 = 0;
LABEL_398:
                                                                  self = v395;
                                                                  uint64_t v48 = v601;
                                                                  id v8 = v610;
                                                                  id v149 = v486;
LABEL_414:

                                                                  goto LABEL_415;
                                                                }
                                                                v395 = self;
                                                                if (v9)
                                                                {
                                                                  id v396 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v397 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v628 = *MEMORY[0x1E4F28568];
                                                                  id v548 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"storefrontAssetSuccessesCount"];
                                                                  id v629 = v548;
                                                                  v479 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v629 forKeys:&v628 count:1];
                                                                  uint64_t v38 = 0;
                                                                  id v483 = 0;
                                                                  *id v9 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v397, 2);
                                                                  goto LABEL_398;
                                                                }
                                                                id v483 = 0;
                                                                uint64_t v38 = 0;
                                                                uint64_t v48 = v601;
                                                                id v8 = v610;
                                                                id v149 = v486;
LABEL_415:

                                                                goto LABEL_416;
                                                              }
                                                              if (v9)
                                                              {
                                                                v388 = v9;
                                                                id v389 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                id v594 = v12;
                                                                uint64_t v390 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v630 = *MEMORY[0x1E4F28568];
                                                                id v391 = [NSString alloc];
                                                                uint64_t v464 = objc_opt_class();
                                                                v392 = v391;
                                                                id v8 = v610;
                                                                id v149 = v486;
                                                                id v483 = (id)[v392 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v464, @"foodAssetSuccessesCount"];
                                                                id v631 = v483;
                                                                uint64_t v393 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v631 forKeys:&v630 count:1];
                                                                uint64_t v394 = v390;
                                                                id v12 = v594;
                                                                v480 = (void *)v393;
                                                                uint64_t v38 = 0;
                                                                id v482 = 0;
                                                                id *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v394, 2);
                                                                uint64_t v48 = v601;
                                                                uint64_t v32 = v537;
                                                                goto LABEL_415;
                                                              }
                                                              id v482 = 0;
                                                              uint64_t v38 = 0;
                                                              uint64_t v48 = v601;
                                                              id v8 = v610;
                                                              id v149 = v486;
LABEL_416:

                                                              goto LABEL_417;
                                                            }
                                                            if (v9)
                                                            {
                                                              v381 = v9;
                                                              id v382 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              id v593 = v12;
                                                              uint64_t v383 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v632 = *MEMORY[0x1E4F28568];
                                                              id v384 = [NSString alloc];
                                                              uint64_t v463 = objc_opt_class();
                                                              v385 = v384;
                                                              id v8 = v610;
                                                              id v149 = v486;
                                                              id v482 = (id)[v385 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v463, @"apparelAssetSuccessesCount"];
                                                              id v633 = v482;
                                                              uint64_t v386 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v633 forKeys:&v632 count:1];
                                                              uint64_t v387 = v383;
                                                              id v12 = v593;
                                                              v481 = (void *)v386;
                                                              uint64_t v38 = 0;
                                                              id v487 = 0;
                                                              id *v381 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v387, 2);
                                                              uint64_t v48 = v601;
                                                              uint64_t v32 = v537;
                                                              goto LABEL_416;
                                                            }
                                                            id v487 = 0;
                                                            uint64_t v38 = 0;
                                                            uint64_t v48 = v601;
                                                            id v8 = v610;
                                                            id v149 = v486;
LABEL_417:

                                                            goto LABEL_418;
                                                          }
                                                          if (v9)
                                                          {
                                                            v374 = v9;
                                                            id v375 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v592 = v12;
                                                            uint64_t v376 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v634 = *MEMORY[0x1E4F28568];
                                                            id v377 = [NSString alloc];
                                                            uint64_t v462 = objc_opt_class();
                                                            v378 = v377;
                                                            id v8 = v610;
                                                            id v487 = (id)[v378 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v462, @"dogsAssetSuccessesCount"];
                                                            id v635 = v487;
                                                            uint64_t v379 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v635 forKeys:&v634 count:1];
                                                            uint64_t v380 = v376;
                                                            id v12 = v592;
                                                            v484 = (void *)v379;
                                                            uint64_t v38 = 0;
                                                            id v149 = 0;
                                                            id *v374 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v380, 2);
                                                            uint64_t v48 = v601;
                                                            uint64_t v32 = v537;
                                                            goto LABEL_417;
                                                          }
                                                          id v149 = 0;
                                                          uint64_t v38 = 0;
                                                          uint64_t v48 = v601;
                                                          id v8 = v610;
LABEL_376:
                                                          uint64_t v32 = v537;
LABEL_418:

                                                          goto LABEL_419;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v490 = v136;
                                                          goto LABEL_157;
                                                        }
                                                        id v357 = v519;
                                                        if (v9)
                                                        {
                                                          v360 = v9;
                                                          id v361 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          id v590 = v12;
                                                          uint64_t v362 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v638 = *MEMORY[0x1E4F28568];
                                                          id v363 = [NSString alloc];
                                                          uint64_t v460 = objc_opt_class();
                                                          v364 = v363;
                                                          id v8 = v610;
                                                          id v489 = (id)[v364 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v460, @"albumAssetSuccessesCount"];
                                                          id v639 = v489;
                                                          uint64_t v365 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v639 forKeys:&v638 count:1];
                                                          uint64_t v366 = v362;
                                                          id v12 = v590;
                                                          v488 = (void *)v365;
                                                          uint64_t v38 = 0;
                                                          id v490 = 0;
                                                          id *v360 = (id)objc_msgSend(v361, "initWithDomain:code:userInfo:", v366, 2);
                                                          uint64_t v48 = v601;
                                                          uint64_t v32 = v537;
LABEL_420:

                                                          goto LABEL_421;
                                                        }
                                                        id v490 = 0;
                                                        uint64_t v38 = 0;
                                                        uint64_t v48 = v601;
                                                        id v8 = v610;
LABEL_365:
                                                        uint64_t v32 = v537;
LABEL_421:
                                                        id v519 = v357;

                                                        goto LABEL_422;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v498 = v128;
                                                        goto LABEL_145;
                                                      }
                                                      if (v9)
                                                      {
                                                        v331 = v9;
                                                        id v332 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        id v586 = v12;
                                                        uint64_t v333 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v646 = *MEMORY[0x1E4F28568];
                                                        id v334 = [NSString alloc];
                                                        uint64_t v456 = objc_opt_class();
                                                        v335 = v334;
                                                        id v8 = v610;
                                                        id v295 = v519;
                                                        id v496 = (id)[v335 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v456, @"landmarkAssetSuccessesCount"];
                                                        id v647 = v496;
                                                        uint64_t v336 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v647 forKeys:&v646 count:1];
                                                        uint64_t v337 = v333;
                                                        id v12 = v586;
                                                        v497 = (void *)v336;
                                                        uint64_t v38 = 0;
                                                        id v498 = 0;
                                                        id *v331 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                        uint64_t v48 = v601;
                                                        uint64_t v32 = v537;
LABEL_427:

                                                        goto LABEL_428;
                                                      }
                                                      id v498 = 0;
                                                      uint64_t v38 = 0;
                                                      uint64_t v48 = v601;
                                                      id v8 = v610;
                                                      id v295 = v519;
LABEL_428:

                                                      goto LABEL_429;
                                                    }
                                                    if (v9)
                                                    {
                                                      v324 = v9;
                                                      id v325 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      id v585 = v12;
                                                      uint64_t v326 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v648 = *MEMORY[0x1E4F28568];
                                                      id v327 = [NSString alloc];
                                                      uint64_t v455 = objc_opt_class();
                                                      v328 = v327;
                                                      id v8 = v610;
                                                      id v295 = v519;
                                                      id v498 = (id)[v328 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v455, @"mammalsAssetSuccessesCount"];
                                                      id v649 = v498;
                                                      uint64_t v329 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v649 forKeys:&v648 count:1];
                                                      uint64_t v330 = v326;
                                                      id v12 = v585;
                                                      v499 = (void *)v329;
                                                      uint64_t v38 = 0;
                                                      id v500 = 0;
                                                      id *v324 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v330, 2);
                                                      uint64_t v48 = v601;
                                                      uint64_t v32 = v537;
                                                      goto LABEL_428;
                                                    }
                                                    id v500 = 0;
                                                    uint64_t v38 = 0;
                                                    uint64_t v48 = v601;
                                                    id v8 = v610;
                                                    id v295 = v519;
LABEL_429:

                                                    goto LABEL_430;
                                                  }
                                                  if (v9)
                                                  {
                                                    v317 = v9;
                                                    id v318 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    id v584 = v12;
                                                    uint64_t v319 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v650 = *MEMORY[0x1E4F28568];
                                                    id v320 = [NSString alloc];
                                                    uint64_t v454 = objc_opt_class();
                                                    v321 = v320;
                                                    id v8 = v610;
                                                    id v295 = v519;
                                                    id v500 = (id)[v321 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v454, @"reptilesAssetSuccessesCount"];
                                                    id v651 = v500;
                                                    uint64_t v322 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v651 forKeys:&v650 count:1];
                                                    uint64_t v323 = v319;
                                                    id v12 = v584;
                                                    v501 = (void *)v322;
                                                    uint64_t v38 = 0;
                                                    id v502 = 0;
                                                    id *v317 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v323, 2);
                                                    uint64_t v48 = v601;
                                                    uint64_t v32 = v537;
                                                    goto LABEL_429;
                                                  }
                                                  id v502 = 0;
                                                  uint64_t v38 = 0;
                                                  uint64_t v48 = v601;
                                                  id v8 = v610;
                                                  id v295 = v519;
LABEL_430:

                                                  goto LABEL_431;
                                                }
                                                if (v9)
                                                {
                                                  v310 = v9;
                                                  id v311 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v583 = v12;
                                                  uint64_t v312 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v652 = *MEMORY[0x1E4F28568];
                                                  id v313 = [NSString alloc];
                                                  uint64_t v453 = objc_opt_class();
                                                  v314 = v313;
                                                  id v8 = v610;
                                                  id v295 = v519;
                                                  id v502 = (id)[v314 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v453, @"insectsAssetSuccessesCount"];
                                                  id v653 = v502;
                                                  uint64_t v315 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v653 forKeys:&v652 count:1];
                                                  uint64_t v316 = v312;
                                                  id v12 = v583;
                                                  v503 = (void *)v315;
                                                  uint64_t v38 = 0;
                                                  id v504 = 0;
                                                  id *v310 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v316, 2);
                                                  uint64_t v48 = v601;
                                                  uint64_t v32 = v537;
                                                  goto LABEL_430;
                                                }
                                                id v504 = 0;
                                                uint64_t v38 = 0;
                                                uint64_t v48 = v601;
                                                id v8 = v610;
                                                id v295 = v519;
LABEL_431:

                                                goto LABEL_432;
                                              }
                                              if (v9)
                                              {
                                                v303 = v9;
                                                id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                id v582 = v12;
                                                uint64_t v305 = *MEMORY[0x1E4F502C8];
                                                uint64_t v654 = *MEMORY[0x1E4F28568];
                                                id v306 = [NSString alloc];
                                                uint64_t v452 = objc_opt_class();
                                                v307 = v306;
                                                id v8 = v610;
                                                id v295 = v519;
                                                id v504 = (id)[v307 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v452, @"birdsAssetSuccessesCount"];
                                                id v655 = v504;
                                                uint64_t v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v655 forKeys:&v654 count:1];
                                                uint64_t v309 = v305;
                                                id v12 = v582;
                                                v505 = (void *)v308;
                                                uint64_t v38 = 0;
                                                id v506 = 0;
                                                id *v303 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v309, 2);
                                                uint64_t v48 = v601;
                                                uint64_t v32 = v537;
                                                goto LABEL_431;
                                              }
                                              id v506 = 0;
                                              uint64_t v38 = 0;
                                              uint64_t v48 = v601;
                                              id v8 = v610;
                                              id v295 = v519;
LABEL_432:
                                              id v519 = v295;

                                              goto LABEL_433;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v510 = v114;
                                              goto LABEL_124;
                                            }
                                            if (v9)
                                            {
                                              v280 = v9;
                                              id v281 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v579 = v12;
                                              uint64_t v282 = *MEMORY[0x1E4F502C8];
                                              uint64_t v660 = *MEMORY[0x1E4F28568];
                                              id v283 = [NSString alloc];
                                              uint64_t v449 = objc_opt_class();
                                              v284 = v283;
                                              id v8 = v610;
                                              id v511 = (id)[v284 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v449, @"artAssetSuccessesCount"];
                                              id v661 = v511;
                                              uint64_t v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v661 forKeys:&v660 count:1];
                                              uint64_t v286 = v282;
                                              id v12 = v579;
                                              v512 = (void *)v285;
                                              uint64_t v38 = 0;
                                              v277 = 0;
                                              id *v280 = (id)objc_msgSend(v281, "initWithDomain:code:userInfo:", v286, 2);
                                              uint64_t v48 = v601;
                                              uint64_t v32 = v537;
LABEL_436:

                                              goto LABEL_437;
                                            }
                                            v277 = 0;
                                            uint64_t v38 = 0;
                                            uint64_t v48 = v601;
                                            id v8 = v610;
LABEL_309:
                                            uint64_t v32 = v537;
LABEL_437:

                                            goto LABEL_438;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v519 = v110;
                                            goto LABEL_118;
                                          }
                                          if (v9)
                                          {
                                            v265 = v9;
                                            id v266 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            id v577 = v12;
                                            uint64_t v267 = *MEMORY[0x1E4F502C8];
                                            uint64_t v664 = *MEMORY[0x1E4F28568];
                                            id v268 = [NSString alloc];
                                            uint64_t v447 = objc_opt_class();
                                            v269 = v268;
                                            id v8 = v610;
                                            id v514 = (id)[v269 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v447, @"sculptureAssetProcessedCount"];
                                            id v665 = v514;
                                            uint64_t v270 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v665 forKeys:&v664 count:1];
                                            uint64_t v271 = v267;
                                            id v12 = v577;
                                            v515 = (void *)v270;
                                            uint64_t v38 = 0;
                                            v262 = 0;
                                            id *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                            uint64_t v48 = v601;
                                            uint64_t v32 = v537;
LABEL_439:

                                            goto LABEL_440;
                                          }
                                          v262 = 0;
                                          uint64_t v38 = 0;
                                          uint64_t v48 = v601;
                                          id v8 = v610;
LABEL_298:
                                          uint64_t v32 = v537;
LABEL_440:

                                          goto LABEL_441;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v520 = v106;
                                          goto LABEL_112;
                                        }
                                        if (v9)
                                        {
                                          v250 = v9;
                                          id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          id v575 = v12;
                                          uint64_t v252 = *MEMORY[0x1E4F502C8];
                                          uint64_t v668 = *MEMORY[0x1E4F28568];
                                          id v253 = [NSString alloc];
                                          uint64_t v445 = objc_opt_class();
                                          v254 = v253;
                                          id v8 = v610;
                                          v219 = v526;
                                          id v517 = (id)[v254 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v445, @"object2DAssetProcessedCount"];
                                          id v669 = v517;
                                          uint64_t v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v669 forKeys:&v668 count:1];
                                          uint64_t v256 = v252;
                                          id v12 = v575;
                                          v518 = (void *)v255;
                                          uint64_t v38 = 0;
                                          id v520 = 0;
                                          id *v250 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v256, 2);
                                          uint64_t v48 = v601;
                                          uint64_t v32 = v537;
LABEL_442:

                                          goto LABEL_443;
                                        }
                                        id v520 = 0;
                                        uint64_t v38 = 0;
                                        uint64_t v48 = v601;
                                        id v8 = v610;
                                        v219 = v526;
LABEL_443:

                                        goto LABEL_444;
                                      }
                                      if (v9)
                                      {
                                        v243 = v9;
                                        id v244 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        id v574 = v12;
                                        uint64_t v245 = *MEMORY[0x1E4F502C8];
                                        uint64_t v670 = *MEMORY[0x1E4F28568];
                                        id v246 = [NSString alloc];
                                        uint64_t v444 = objc_opt_class();
                                        v247 = v246;
                                        id v8 = v610;
                                        v219 = v526;
                                        id v520 = (id)[v247 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v444, @"brandLogoSymbolAssetProcessedCount"];
                                        id v671 = v520;
                                        uint64_t v248 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v671 forKeys:&v670 count:1];
                                        uint64_t v249 = v245;
                                        id v12 = v574;
                                        v521 = (void *)v248;
                                        uint64_t v38 = 0;
                                        id v522 = 0;
                                        id *v243 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v249, 2);
                                        uint64_t v48 = v601;
                                        uint64_t v32 = v537;
                                        goto LABEL_443;
                                      }
                                      id v522 = 0;
                                      uint64_t v38 = 0;
                                      uint64_t v48 = v601;
                                      id v8 = v610;
                                      v219 = v526;
LABEL_444:

                                      goto LABEL_445;
                                    }
                                    if (v9)
                                    {
                                      v236 = v9;
                                      id v237 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      id v573 = v12;
                                      uint64_t v238 = *MEMORY[0x1E4F502C8];
                                      uint64_t v672 = *MEMORY[0x1E4F28568];
                                      id v239 = [NSString alloc];
                                      uint64_t v443 = objc_opt_class();
                                      v240 = v239;
                                      id v8 = v610;
                                      v219 = v526;
                                      id v522 = (id)[v240 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v443, @"autoSymbolAssetProcessedCount"];
                                      id v673 = v522;
                                      uint64_t v241 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v673 forKeys:&v672 count:1];
                                      uint64_t v242 = v238;
                                      id v12 = v573;
                                      v523 = (void *)v241;
                                      uint64_t v38 = 0;
                                      id v524 = 0;
                                      id *v236 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v242, 2);
                                      uint64_t v48 = v601;
                                      uint64_t v32 = v537;
                                      goto LABEL_444;
                                    }
                                    id v524 = 0;
                                    uint64_t v38 = 0;
                                    uint64_t v48 = v601;
                                    id v8 = v610;
                                    v219 = v526;
LABEL_445:

                                    goto LABEL_446;
                                  }
                                  if (v9)
                                  {
                                    v229 = v9;
                                    id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v572 = v12;
                                    uint64_t v231 = *MEMORY[0x1E4F502C8];
                                    uint64_t v674 = *MEMORY[0x1E4F28568];
                                    id v232 = [NSString alloc];
                                    uint64_t v442 = objc_opt_class();
                                    v233 = v232;
                                    id v8 = v610;
                                    v219 = v526;
                                    id v524 = (id)[v233 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v442, @"laundryCareSymbolAssetProcessedCount"];
                                    id v675 = v524;
                                    uint64_t v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v675 forKeys:&v674 count:1];
                                    uint64_t v235 = v231;
                                    id v12 = v572;
                                    v525 = (void *)v234;
                                    uint64_t v38 = 0;
                                    id v527 = 0;
                                    id *v229 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v235, 2);
                                    uint64_t v48 = v601;
                                    uint64_t v32 = v537;
                                    goto LABEL_445;
                                  }
                                  id v527 = 0;
                                  uint64_t v38 = 0;
                                  uint64_t v48 = v601;
                                  id v8 = v610;
                                  v219 = v526;
LABEL_446:

                                  goto LABEL_447;
                                }
                                if (v9)
                                {
                                  v222 = v9;
                                  id v223 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  id v571 = v12;
                                  uint64_t v224 = *MEMORY[0x1E4F502C8];
                                  uint64_t v676 = *MEMORY[0x1E4F28568];
                                  id v225 = [NSString alloc];
                                  uint64_t v441 = objc_opt_class();
                                  v226 = v225;
                                  id v8 = v610;
                                  id v527 = (id)[v226 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v441, @"signSymbolAssetProcessedCount"];
                                  id v677 = v527;
                                  uint64_t v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v677 forKeys:&v676 count:1];
                                  uint64_t v228 = v224;
                                  id v12 = v571;
                                  v528 = (void *)v227;
                                  uint64_t v38 = 0;
                                  v219 = 0;
                                  id *v222 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v228, 2);
                                  uint64_t v48 = v601;
                                  uint64_t v32 = v537;
                                  goto LABEL_446;
                                }
                                v219 = 0;
                                uint64_t v38 = 0;
                                uint64_t v48 = v601;
                                id v8 = v610;
LABEL_267:
                                uint64_t v32 = v537;
LABEL_447:

                                goto LABEL_448;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v532 = v94;
                                goto LABEL_94;
                              }
                              if (v9)
                              {
                                v207 = v9;
                                id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v569 = v12;
                                uint64_t v209 = *MEMORY[0x1E4F502C8];
                                uint64_t v680 = *MEMORY[0x1E4F28568];
                                id v210 = [NSString alloc];
                                uint64_t v439 = objc_opt_class();
                                v211 = v210;
                                id v8 = v610;
                                v197 = v533;
                                id v530 = (id)[v211 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v439, @"foodAssetProcessedCount"];
                                id v681 = v530;
                                uint64_t v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v681 forKeys:&v680 count:1];
                                uint64_t v213 = v209;
                                id v12 = v569;
                                v531 = (void *)v212;
                                uint64_t v38 = 0;
                                id v532 = 0;
                                id *v207 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v213, 2);
                                uint64_t v48 = v601;
                                uint64_t v32 = v537;
LABEL_449:

                                goto LABEL_450;
                              }
                              id v532 = 0;
                              uint64_t v38 = 0;
                              uint64_t v48 = v601;
                              id v8 = v610;
                              v197 = v533;
LABEL_450:

                              goto LABEL_451;
                            }
                            if (v9)
                            {
                              v200 = v9;
                              id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                              id v568 = v12;
                              uint64_t v202 = *MEMORY[0x1E4F502C8];
                              uint64_t v682 = *MEMORY[0x1E4F28568];
                              id v203 = [NSString alloc];
                              uint64_t v438 = objc_opt_class();
                              v204 = v203;
                              id v8 = v610;
                              id v532 = (id)[v204 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v438, @"apparelAssetProcessedCount"];
                              id v683 = v532;
                              uint64_t v205 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v683 forKeys:&v682 count:1];
                              uint64_t v206 = v202;
                              id v12 = v568;
                              v534 = (void *)v205;
                              uint64_t v38 = 0;
                              v197 = 0;
                              id *v200 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v206, 2);
                              uint64_t v48 = v601;
                              uint64_t v32 = v537;
                              goto LABEL_450;
                            }
                            v197 = 0;
                            uint64_t v38 = 0;
                            uint64_t v48 = v601;
                            id v8 = v610;
LABEL_251:
                            uint64_t v32 = v537;
LABEL_451:

                            v189 = v535;
                            goto LABEL_452;
                          }
                          if (v9)
                          {
                            v192 = v9;
                            id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                            id v567 = v12;
                            uint64_t v194 = *MEMORY[0x1E4F502C8];
                            uint64_t v684 = *MEMORY[0x1E4F28568];
                            id v195 = [NSString alloc];
                            uint64_t v437 = objc_opt_class();
                            v196 = v195;
                            id v8 = v610;
                            v197 = (void *)[v196 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v437, @"dogsAssetProcessedCount"];
                            v685 = v197;
                            uint64_t v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v685 forKeys:&v684 count:1];
                            uint64_t v199 = v194;
                            id v12 = v567;
                            v536 = (void *)v198;
                            uint64_t v38 = 0;
                            id v535 = 0;
                            id *v192 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v199, 2);
                            uint64_t v48 = v601;
                            goto LABEL_251;
                          }
                          v189 = 0;
                          uint64_t v38 = 0;
                          uint64_t v48 = v601;
                          id v8 = v610;
LABEL_452:

                          goto LABEL_453;
                        }
                        uint64_t v32 = v9;
                        if (v9)
                        {
                          id v185 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v566 = v12;
                          uint64_t v186 = *MEMORY[0x1E4F502C8];
                          uint64_t v686 = *MEMORY[0x1E4F28568];
                          id v187 = [NSString alloc];
                          uint64_t v436 = objc_opt_class();
                          v188 = v187;
                          id v8 = v610;
                          v189 = (void *)[v188 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v436, @"catsAssetProcessedCount"];
                          v687 = v189;
                          uint64_t v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v687 forKeys:&v686 count:1];
                          uint64_t v191 = v186;
                          id v12 = v566;
                          v538 = (void *)v190;
                          uint64_t v38 = 0;
                          *uint64_t v32 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v191, 2);
                          uint64_t v32 = 0;
                          uint64_t v48 = v601;
                          goto LABEL_452;
                        }
                        uint64_t v38 = 0;
                        uint64_t v48 = v601;
                        id v8 = v610;
LABEL_453:

                        id v24 = v540;
                        v177 = v539;
                        goto LABEL_454;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v31 = v30;
                        goto LABEL_37;
                      }
                      v177 = v9;
                      if (v9)
                      {
                        id v542 = objc_alloc(MEMORY[0x1E4F28C58]);
                        id v565 = v12;
                        uint64_t v178 = *MEMORY[0x1E4F502C8];
                        uint64_t v688 = *MEMORY[0x1E4F28568];
                        id v179 = [NSString alloc];
                        uint64_t v435 = objc_opt_class();
                        v180 = v179;
                        id v8 = v610;
                        uint64_t v181 = [v180 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v435, @"albumAssetProcessedCount"];
                        uint64_t v689 = v181;
                        uint64_t v182 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v689 forKeys:&v688 count:1];
                        v183 = v542;
                        uint64_t v184 = v178;
                        id v12 = v565;
                        v541 = (void *)v182;
                        uint64_t v38 = 0;
                        v539 = 0;
                        void *v177 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
                        uint64_t v32 = (void *)v181;
                        uint64_t v48 = v601;
                        goto LABEL_453;
                      }
                      uint64_t v38 = 0;
                      uint64_t v48 = v601;
                      id v8 = v610;
LABEL_454:

                      goto LABEL_455;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v544 = v26;
                      goto LABEL_31;
                    }
                    if (v9)
                    {
                      v161 = v9;
                      id v162 = objc_alloc(MEMORY[0x1E4F28C58]);
                      id v563 = v12;
                      uint64_t v163 = *MEMORY[0x1E4F502C8];
                      uint64_t v692 = *MEMORY[0x1E4F28568];
                      id v164 = [NSString alloc];
                      uint64_t v433 = objc_opt_class();
                      v165 = v164;
                      id v8 = v610;
                      id v545 = (id)[v165 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v433, @"mediaAssetProcessedCount"];
                      id v693 = v545;
                      uint64_t v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v693 forKeys:&v692 count:1];
                      uint64_t v167 = v163;
                      id v12 = v563;
                      v547 = (void *)v166;
                      id v168 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v167, 2);
                      uint64_t v38 = 0;
                      v157 = 0;
                      id *v161 = v168;
                      uint64_t v48 = v601;
LABEL_456:

                      goto LABEL_457;
                    }
                    v157 = 0;
                    uint64_t v38 = 0;
                    uint64_t v48 = v601;
                    id v8 = v610;
LABEL_457:

                    v63 = v557;
                    goto LABEL_458;
                  }
                  if (v9)
                  {
                    id v153 = v9;
                    id v550 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v562 = v12;
                    uint64_t v154 = *MEMORY[0x1E4F502C8];
                    uint64_t v694 = *MEMORY[0x1E4F28568];
                    id v155 = [NSString alloc];
                    uint64_t v432 = objc_opt_class();
                    v156 = v155;
                    id v8 = v610;
                    v157 = (void *)[v156 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v432, @"naturalLandmarkProcessedAssetCount"];
                    v695 = v157;
                    uint64_t v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v695 forKeys:&v694 count:1];
                    v159 = v550;
                    uint64_t v160 = v154;
                    id v12 = v562;
                    v549 = (void *)v158;
                    uint64_t v38 = 0;
                    id v24 = 0;
                    *id v153 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                    uint64_t v48 = v601;
                    goto LABEL_457;
                  }
                  id v24 = 0;
                  uint64_t v38 = 0;
                  uint64_t v48 = v601;
                  v63 = v557;
                  id v8 = v610;
LABEL_458:

                  goto LABEL_459;
                }
                if (v9)
                {
                  v82 = v9;
                  id v553 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v561 = v12;
                  uint64_t v83 = *MEMORY[0x1E4F502C8];
                  uint64_t v696 = *MEMORY[0x1E4F28568];
                  id v84 = [NSString alloc];
                  uint64_t v431 = objc_opt_class();
                  v85 = v84;
                  id v8 = v610;
                  v63 = v557;
                  id v24 = (id)[v85 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v431, @"landmarkAssetProcessedCount"];
                  id v697 = v24;
                  uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v697 forKeys:&v696 count:1];
                  uint64_t v87 = v83;
                  id v12 = v561;
                  v551 = (void *)v86;
                  id v88 = (id)objc_msgSend(v553, "initWithDomain:code:userInfo:", v87, 2);
                  uint64_t v38 = 0;
                  id v552 = 0;
                  id *v82 = v88;
                  uint64_t v48 = v601;
                  goto LABEL_458;
                }
                id v552 = 0;
                uint64_t v38 = 0;
                uint64_t v48 = v601;
                v63 = v557;
                id v8 = v610;
LABEL_459:

                goto LABEL_460;
              }
              if (v9)
              {
                v75 = v9;
                id v598 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v560 = v12;
                uint64_t v76 = *MEMORY[0x1E4F502C8];
                uint64_t v698 = *MEMORY[0x1E4F28568];
                id v77 = [NSString alloc];
                uint64_t v430 = objc_opt_class();
                v78 = v77;
                id v8 = v610;
                v63 = v557;
                id v552 = (id)[v78 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v430, @"mammalsAssetProcessedCount"];
                id v699 = v552;
                uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v699 forKeys:&v698 count:1];
                uint64_t v80 = v76;
                id v12 = v560;
                v556 = (void *)v79;
                id v81 = (id)objc_msgSend(v598, "initWithDomain:code:userInfo:", v80, 2);
                uint64_t v38 = 0;
                id v597 = 0;
                id *v75 = v81;
                uint64_t v48 = v601;
                goto LABEL_459;
              }
              id v597 = 0;
              uint64_t v38 = 0;
              uint64_t v48 = v601;
              v63 = v557;
              id v8 = v610;
LABEL_460:

              goto LABEL_461;
            }
            if (v9)
            {
              v67 = v9;
              id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v559 = v12;
              uint64_t v69 = *MEMORY[0x1E4F502C8];
              uint64_t v700 = *MEMORY[0x1E4F28568];
              id v70 = [NSString alloc];
              uint64_t v429 = objc_opt_class();
              v71 = v70;
              id v8 = v610;
              id v597 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v429, @"reptilesAssetProcessedCount"];
              id v701 = v597;
              uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v701 forKeys:&v700 count:1];
              uint64_t v73 = v69;
              id v12 = v559;
              v599 = (void *)v72;
              id v74 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
              uint64_t v38 = 0;
              v63 = 0;
              id *v67 = v74;
              uint64_t v48 = v601;
              goto LABEL_460;
            }
            v63 = 0;
            uint64_t v38 = 0;
            uint64_t v48 = v601;
            id v8 = v610;
LABEL_461:

            id v10 = v607;
            goto LABEL_462;
          }
          if (v9)
          {
            v57 = v9;
            id v603 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v558 = v12;
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v702 = *MEMORY[0x1E4F28568];
            id v59 = [NSString alloc];
            uint64_t v428 = objc_opt_class();
            v60 = v59;
            id v8 = v610;
            v61 = v11;
            v62 = v57;
            v63 = (void *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v428, @"insectsAssetProcessedCount"];
            v703 = v63;
            uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v703 forKeys:&v702 count:1];
            uint64_t v65 = v58;
            id v12 = v558;
            v600 = (void *)v64;
            id v66 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v65, 2);
            uint64_t v38 = 0;
            id v602 = 0;
            id *v62 = v66;
            uint64_t v11 = v61;
            uint64_t v48 = v601;
            goto LABEL_461;
          }
          id v602 = 0;
          uint64_t v38 = 0;
          uint64_t v48 = v601;
          id v10 = v607;
          id v8 = v610;
LABEL_462:

          goto LABEL_463;
        }
        uint64_t v48 = v13;
        if (v9)
        {
          id v609 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v606 = *MEMORY[0x1E4F502C8];
          uint64_t v704 = *MEMORY[0x1E4F28568];
          uint64_t v50 = v11;
          uint64_t v51 = v9;
          id v52 = [NSString alloc];
          uint64_t v427 = objc_opt_class();
          uint64_t v53 = v52;
          id v8 = v610;
          id v10 = v607;
          id v602 = (id)[v53 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v427, @"birdsAssetProcessedCount"];
          id v705 = v602;
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v705 forKeys:&v704 count:1];
          uint64_t v55 = v606;
          v604 = (void *)v54;
          id v56 = (id)objc_msgSend(v609, "initWithDomain:code:userInfo:", v55, 2);
          uint64_t v38 = 0;
          id v608 = 0;
          *uint64_t v51 = v56;
          uint64_t v11 = v50;
          goto LABEL_462;
        }
        id v608 = 0;
        uint64_t v38 = 0;
        id v10 = v607;
        id v8 = v610;
LABEL_463:

        goto LABEL_464;
      }
      if (v9)
      {
        id v605 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v706 = *MEMORY[0x1E4F28568];
        id v608 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"animalsAssetProcessedCount"];
        id v707 = v608;
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v707 forKeys:&v706 count:1];
        id v49 = (id)[v605 initWithDomain:v47 code:2 userInfo:v48];
        uint64_t v38 = 0;
        id v12 = 0;
        *id v9 = v49;
        id v8 = v610;
        goto LABEL_463;
      }
      id v12 = 0;
      uint64_t v38 = 0;
      id v8 = v610;
LABEL_464:

      goto LABEL_465;
    }
    if (a4)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v708 = *MEMORY[0x1E4F28568];
      id v554 = v6;
      uint64_t v41 = v7;
      uint64_t v42 = self;
      id v43 = v8;
      uint64_t v44 = a4;
      uint64_t v45 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"natureAssetProcessedCount"];
      uint64_t v709 = v45;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v709 forKeys:&v708 count:1];
      uint64_t v46 = v40;
      id v12 = (id)v45;
      uint64_t v38 = 0;
      id v10 = 0;
      *uint64_t v44 = (id)[v39 initWithDomain:v46 code:2 userInfo:v11];
      id v8 = v43;
      self = v42;
      id v7 = v41;
      id v6 = v554;
      goto LABEL_464;
    }
    id v10 = 0;
    uint64_t v38 = 0;
LABEL_465:

    goto LABEL_466;
  }
  if (a4)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v34 = *MEMORY[0x1E4F502C8];
    uint64_t v710 = *MEMORY[0x1E4F28568];
    uint64_t v35 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"artAssetProcessedCount"];
    v711[0] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v711 forKeys:&v710 count:1];
    uint64_t v37 = v33;
    id v10 = (id)v35;
    v611 = (void *)v36;
    uint64_t v38 = 0;
    id v8 = 0;
    *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2);
    goto LABEL_465;
  }
  uint64_t v38 = 0;
  id v8 = 0;
LABEL_466:

  return v38;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMPECProcessed *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasArtAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNatureAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAnimalsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBirdsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasInsectsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasReptilesAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMammalsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLandmarkAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNaturalLandmarkProcessedAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMediaAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBookAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAlbumAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCatsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDogsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasApparelAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasFoodAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasStorefrontAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSignSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAutoSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasObject2DAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSculptureAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSkylineAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasArtAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNatureAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAnimalsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBirdsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasInsectsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasReptilesAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMammalsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLandmarkAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasNaturalLandmarkSuccessesAssetCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMediaAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBookAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAlbumAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCatsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDogsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasApparelAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasFoodAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasStorefrontAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSignSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasAutoSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasObject2DAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSculptureAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSkylineAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v275.receiver = self;
  v275.super_class = (Class)BMPECProcessed;
  id v5 = [(BMEventBase *)&v275 init];
  if (!v5) {
    goto LABEL_481;
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
          v5->_hasArtAssetProcessedCount = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
              goto LABEL_422;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              break;
            }
            int v25 = 0;
            v19 += 7;
            uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
            BOOL v27 = v20++ > 8;
            if (v27) {
              goto LABEL_426;
            }
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
          goto LABEL_423;
        case 2u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v21 = 0;
          v5->_hasNatureAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
              goto LABEL_422;
            }
            char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              int v25 = 0;
              v28 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
              BOOL v27 = v29++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
          goto LABEL_423;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v21 = 0;
          v5->_hasAnimalsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
              goto LABEL_422;
            }
            char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v36 + 1;
            v21 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              int v25 = 0;
              v33 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
              BOOL v27 = v34++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
          goto LABEL_423;
        case 4u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v21 = 0;
          v5->_hasBirdsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            unint64_t v41 = *(void *)&v4[v40];
            if (v41 == -1 || v41 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
              goto LABEL_422;
            }
            char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 1;
            v21 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              int v25 = 0;
              v38 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
              BOOL v27 = v39++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
          goto LABEL_423;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v21 = 0;
          v5->_hasInsectsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            unint64_t v46 = *(void *)&v4[v45];
            if (v46 == -1 || v46 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
              goto LABEL_422;
            }
            char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v46);
            *(void *)&v4[v45] = v46 + 1;
            v21 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              int v25 = 0;
              v43 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
              BOOL v27 = v44++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
          goto LABEL_423;
        case 6u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v21 = 0;
          v5->_hasReptilesAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v50 = *v6;
            unint64_t v51 = *(void *)&v4[v50];
            if (v51 == -1 || v51 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
              goto LABEL_422;
            }
            char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
            *(void *)&v4[v50] = v51 + 1;
            v21 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              int v25 = 0;
              v48 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
              BOOL v27 = v49++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
          goto LABEL_423;
        case 7u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v21 = 0;
          v5->_hasMammalsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v55 = *v6;
            unint64_t v56 = *(void *)&v4[v55];
            if (v56 == -1 || v56 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
              goto LABEL_422;
            }
            char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v56);
            *(void *)&v4[v55] = v56 + 1;
            v21 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              int v25 = 0;
              v53 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
              BOOL v27 = v54++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
          goto LABEL_423;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v21 = 0;
          v5->_hasLandmarkAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v60 = *v6;
            unint64_t v61 = *(void *)&v4[v60];
            if (v61 == -1 || v61 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
              goto LABEL_422;
            }
            char v62 = *(unsigned char *)(*(void *)&v4[*v9] + v61);
            *(void *)&v4[v60] = v61 + 1;
            v21 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              int v25 = 0;
              v58 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
              BOOL v27 = v59++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
          goto LABEL_423;
        case 9u:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v21 = 0;
          v5->_hasNaturalLandmarkProcessedAssetCount = 1;
          while (2)
          {
            uint64_t v65 = *v6;
            unint64_t v66 = *(void *)&v4[v65];
            if (v66 == -1 || v66 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
              goto LABEL_422;
            }
            char v67 = *(unsigned char *)(*(void *)&v4[*v9] + v66);
            *(void *)&v4[v65] = v66 + 1;
            v21 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              int v25 = 0;
              v63 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
              BOOL v27 = v64++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
          goto LABEL_423;
        case 0xAu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v21 = 0;
          v5->_hasMediaAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v70 = *v6;
            unint64_t v71 = *(void *)&v4[v70];
            if (v71 == -1 || v71 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
              goto LABEL_422;
            }
            char v72 = *(unsigned char *)(*(void *)&v4[*v9] + v71);
            *(void *)&v4[v70] = v71 + 1;
            v21 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              int v25 = 0;
              v68 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
              BOOL v27 = v69++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
          goto LABEL_423;
        case 0xBu:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v21 = 0;
          v5->_hasBookAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            unint64_t v76 = *(void *)&v4[v75];
            if (v76 == -1 || v76 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
              goto LABEL_422;
            }
            char v77 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
            *(void *)&v4[v75] = v76 + 1;
            v21 |= (unint64_t)(v77 & 0x7F) << v73;
            if (v77 < 0)
            {
              int v25 = 0;
              v73 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
              BOOL v27 = v74++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
          goto LABEL_423;
        case 0xCu:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v21 = 0;
          v5->_hasAlbumAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v80 = *v6;
            unint64_t v81 = *(void *)&v4[v80];
            if (v81 == -1 || v81 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
              goto LABEL_422;
            }
            char v82 = *(unsigned char *)(*(void *)&v4[*v9] + v81);
            *(void *)&v4[v80] = v81 + 1;
            v21 |= (unint64_t)(v82 & 0x7F) << v78;
            if (v82 < 0)
            {
              int v25 = 0;
              v78 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
              BOOL v27 = v79++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
          goto LABEL_423;
        case 0xDu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v21 = 0;
          v5->_hasCatsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v85 = *v6;
            unint64_t v86 = *(void *)&v4[v85];
            if (v86 == -1 || v86 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
              goto LABEL_422;
            }
            char v87 = *(unsigned char *)(*(void *)&v4[*v9] + v86);
            *(void *)&v4[v85] = v86 + 1;
            v21 |= (unint64_t)(v87 & 0x7F) << v83;
            if (v87 < 0)
            {
              int v25 = 0;
              v83 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
              BOOL v27 = v84++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
          goto LABEL_423;
        case 0xEu:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v21 = 0;
          v5->_hasDogsAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v90 = *v6;
            unint64_t v91 = *(void *)&v4[v90];
            if (v91 == -1 || v91 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
              goto LABEL_422;
            }
            char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v91);
            *(void *)&v4[v90] = v91 + 1;
            v21 |= (unint64_t)(v92 & 0x7F) << v88;
            if (v92 < 0)
            {
              int v25 = 0;
              v88 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
              BOOL v27 = v89++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
          goto LABEL_423;
        case 0xFu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v21 = 0;
          v5->_hasApparelAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v95 = *v6;
            unint64_t v96 = *(void *)&v4[v95];
            if (v96 == -1 || v96 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
              goto LABEL_422;
            }
            char v97 = *(unsigned char *)(*(void *)&v4[*v9] + v96);
            *(void *)&v4[v95] = v96 + 1;
            v21 |= (unint64_t)(v97 & 0x7F) << v93;
            if (v97 < 0)
            {
              int v25 = 0;
              v93 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
              BOOL v27 = v94++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
          goto LABEL_423;
        case 0x10u:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v21 = 0;
          v5->_hasFoodAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v100 = *v6;
            unint64_t v101 = *(void *)&v4[v100];
            if (v101 == -1 || v101 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
              goto LABEL_422;
            }
            char v102 = *(unsigned char *)(*(void *)&v4[*v9] + v101);
            *(void *)&v4[v100] = v101 + 1;
            v21 |= (unint64_t)(v102 & 0x7F) << v98;
            if (v102 < 0)
            {
              int v25 = 0;
              v98 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
              BOOL v27 = v99++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
          goto LABEL_423;
        case 0x11u:
          char v103 = 0;
          unsigned int v104 = 0;
          uint64_t v21 = 0;
          v5->_hasStorefrontAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v105 = *v6;
            unint64_t v106 = *(void *)&v4[v105];
            if (v106 == -1 || v106 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
              goto LABEL_422;
            }
            char v107 = *(unsigned char *)(*(void *)&v4[*v9] + v106);
            *(void *)&v4[v105] = v106 + 1;
            v21 |= (unint64_t)(v107 & 0x7F) << v103;
            if (v107 < 0)
            {
              int v25 = 0;
              v103 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
              BOOL v27 = v104++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
          goto LABEL_423;
        case 0x12u:
          char v108 = 0;
          unsigned int v109 = 0;
          uint64_t v21 = 0;
          v5->_hasSignSymbolAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v110 = *v6;
            unint64_t v111 = *(void *)&v4[v110];
            if (v111 == -1 || v111 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            char v112 = *(unsigned char *)(*(void *)&v4[*v9] + v111);
            *(void *)&v4[v110] = v111 + 1;
            v21 |= (unint64_t)(v112 & 0x7F) << v108;
            if (v112 < 0)
            {
              int v25 = 0;
              v108 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
              BOOL v27 = v109++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x13u:
          char v113 = 0;
          unsigned int v114 = 0;
          uint64_t v21 = 0;
          v5->_hasLaundryCareSymbolAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v115 = *v6;
            unint64_t v116 = *(void *)&v4[v115];
            if (v116 == -1 || v116 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            char v117 = *(unsigned char *)(*(void *)&v4[*v9] + v116);
            *(void *)&v4[v115] = v116 + 1;
            v21 |= (unint64_t)(v117 & 0x7F) << v113;
            if (v117 < 0)
            {
              int v25 = 0;
              v113 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
              BOOL v27 = v114++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x14u:
          char v118 = 0;
          unsigned int v119 = 0;
          uint64_t v21 = 0;
          v5->_hasAutoSymbolAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v120 = *v6;
            unint64_t v121 = *(void *)&v4[v120];
            if (v121 == -1 || v121 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            char v122 = *(unsigned char *)(*(void *)&v4[*v9] + v121);
            *(void *)&v4[v120] = v121 + 1;
            v21 |= (unint64_t)(v122 & 0x7F) << v118;
            if (v122 < 0)
            {
              int v25 = 0;
              v118 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
              BOOL v27 = v119++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x15u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v21 = 0;
          v5->_hasBrandLogoSymbolAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v125 = *v6;
            unint64_t v126 = *(void *)&v4[v125];
            if (v126 == -1 || v126 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            char v127 = *(unsigned char *)(*(void *)&v4[*v9] + v126);
            *(void *)&v4[v125] = v126 + 1;
            v21 |= (unint64_t)(v127 & 0x7F) << v123;
            if (v127 < 0)
            {
              int v25 = 0;
              v123 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
              BOOL v27 = v124++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x16u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v21 = 0;
          v5->_hasObject2DAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v130 = *v6;
            unint64_t v131 = *(void *)&v4[v130];
            if (v131 == -1 || v131 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
              goto LABEL_422;
            }
            char v132 = *(unsigned char *)(*(void *)&v4[*v9] + v131);
            *(void *)&v4[v130] = v131 + 1;
            v21 |= (unint64_t)(v132 & 0x7F) << v128;
            if (v132 < 0)
            {
              int v25 = 0;
              v128 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
              BOOL v27 = v129++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
          goto LABEL_423;
        case 0x17u:
          char v133 = 0;
          unsigned int v134 = 0;
          uint64_t v21 = 0;
          v5->_hasBarcodeDetectionAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v135 = *v6;
            unint64_t v136 = *(void *)&v4[v135];
            if (v136 == -1 || v136 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
              goto LABEL_422;
            }
            char v137 = *(unsigned char *)(*(void *)&v4[*v9] + v136);
            *(void *)&v4[v135] = v136 + 1;
            v21 |= (unint64_t)(v137 & 0x7F) << v133;
            if (v137 < 0)
            {
              int v25 = 0;
              v133 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
              BOOL v27 = v134++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
          goto LABEL_423;
        case 0x18u:
          char v138 = 0;
          unsigned int v139 = 0;
          uint64_t v21 = 0;
          v5->_hasSculptureAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v140 = *v6;
            unint64_t v141 = *(void *)&v4[v140];
            if (v141 == -1 || v141 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
              goto LABEL_422;
            }
            char v142 = *(unsigned char *)(*(void *)&v4[*v9] + v141);
            *(void *)&v4[v140] = v141 + 1;
            v21 |= (unint64_t)(v142 & 0x7F) << v138;
            if (v142 < 0)
            {
              int v25 = 0;
              v138 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
              BOOL v27 = v139++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
          goto LABEL_423;
        case 0x19u:
          char v143 = 0;
          unsigned int v144 = 0;
          uint64_t v21 = 0;
          v5->_hasSkylineAssetProcessedCount = 1;
          while (2)
          {
            uint64_t v145 = *v6;
            unint64_t v146 = *(void *)&v4[v145];
            if (v146 == -1 || v146 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
              goto LABEL_422;
            }
            char v147 = *(unsigned char *)(*(void *)&v4[*v9] + v146);
            *(void *)&v4[v145] = v146 + 1;
            v21 |= (unint64_t)(v147 & 0x7F) << v143;
            if (v147 < 0)
            {
              int v25 = 0;
              v143 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
              BOOL v27 = v144++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
          goto LABEL_423;
        case 0x1Au:
          char v148 = 0;
          unsigned int v149 = 0;
          uint64_t v21 = 0;
          v5->_hasArtAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v150 = *v6;
            unint64_t v151 = *(void *)&v4[v150];
            if (v151 == -1 || v151 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
              goto LABEL_422;
            }
            char v152 = *(unsigned char *)(*(void *)&v4[*v9] + v151);
            *(void *)&v4[v150] = v151 + 1;
            v21 |= (unint64_t)(v152 & 0x7F) << v148;
            if (v152 < 0)
            {
              int v25 = 0;
              v148 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
              BOOL v27 = v149++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Bu:
          char v153 = 0;
          unsigned int v154 = 0;
          uint64_t v21 = 0;
          v5->_hasNatureAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v155 = *v6;
            unint64_t v156 = *(void *)&v4[v155];
            if (v156 == -1 || v156 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
              goto LABEL_422;
            }
            char v157 = *(unsigned char *)(*(void *)&v4[*v9] + v156);
            *(void *)&v4[v155] = v156 + 1;
            v21 |= (unint64_t)(v157 & 0x7F) << v153;
            if (v157 < 0)
            {
              int v25 = 0;
              v153 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
              BOOL v27 = v154++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Cu:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v21 = 0;
          v5->_hasAnimalsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v160 = *v6;
            unint64_t v161 = *(void *)&v4[v160];
            if (v161 == -1 || v161 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v162 = *(unsigned char *)(*(void *)&v4[*v9] + v161);
            *(void *)&v4[v160] = v161 + 1;
            v21 |= (unint64_t)(v162 & 0x7F) << v158;
            if (v162 < 0)
            {
              int v25 = 0;
              v158 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
              BOOL v27 = v159++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Du:
          char v163 = 0;
          unsigned int v164 = 0;
          uint64_t v21 = 0;
          v5->_hasBirdsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v165 = *v6;
            unint64_t v166 = *(void *)&v4[v165];
            if (v166 == -1 || v166 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v167 = *(unsigned char *)(*(void *)&v4[*v9] + v166);
            *(void *)&v4[v165] = v166 + 1;
            v21 |= (unint64_t)(v167 & 0x7F) << v163;
            if (v167 < 0)
            {
              int v25 = 0;
              v163 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
              BOOL v27 = v164++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Eu:
          char v168 = 0;
          unsigned int v169 = 0;
          uint64_t v21 = 0;
          v5->_hasInsectsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v170 = *v6;
            unint64_t v171 = *(void *)&v4[v170];
            if (v171 == -1 || v171 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v172 = *(unsigned char *)(*(void *)&v4[*v9] + v171);
            *(void *)&v4[v170] = v171 + 1;
            v21 |= (unint64_t)(v172 & 0x7F) << v168;
            if (v172 < 0)
            {
              int v25 = 0;
              v168 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
              BOOL v27 = v169++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Fu:
          char v173 = 0;
          unsigned int v174 = 0;
          uint64_t v21 = 0;
          v5->_hasReptilesAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v175 = *v6;
            unint64_t v176 = *(void *)&v4[v175];
            if (v176 == -1 || v176 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
              goto LABEL_422;
            }
            char v177 = *(unsigned char *)(*(void *)&v4[*v9] + v176);
            *(void *)&v4[v175] = v176 + 1;
            v21 |= (unint64_t)(v177 & 0x7F) << v173;
            if (v177 < 0)
            {
              int v25 = 0;
              v173 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
              BOOL v27 = v174++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
          goto LABEL_423;
        case 0x20u:
          char v178 = 0;
          unsigned int v179 = 0;
          uint64_t v21 = 0;
          v5->_hasMammalsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v180 = *v6;
            unint64_t v181 = *(void *)&v4[v180];
            if (v181 == -1 || v181 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v182 = *(unsigned char *)(*(void *)&v4[*v9] + v181);
            *(void *)&v4[v180] = v181 + 1;
            v21 |= (unint64_t)(v182 & 0x7F) << v178;
            if (v182 < 0)
            {
              int v25 = 0;
              v178 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
              BOOL v27 = v179++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
          goto LABEL_423;
        case 0x21u:
          char v183 = 0;
          unsigned int v184 = 0;
          uint64_t v21 = 0;
          v5->_hasLandmarkAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v185 = *v6;
            unint64_t v186 = *(void *)&v4[v185];
            if (v186 == -1 || v186 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
              goto LABEL_422;
            }
            char v187 = *(unsigned char *)(*(void *)&v4[*v9] + v186);
            *(void *)&v4[v185] = v186 + 1;
            v21 |= (unint64_t)(v187 & 0x7F) << v183;
            if (v187 < 0)
            {
              int v25 = 0;
              v183 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
              BOOL v27 = v184++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
          goto LABEL_423;
        case 0x22u:
          char v188 = 0;
          unsigned int v189 = 0;
          uint64_t v21 = 0;
          v5->_hasNaturalLandmarkSuccessesAssetCount = 1;
          while (2)
          {
            uint64_t v190 = *v6;
            unint64_t v191 = *(void *)&v4[v190];
            if (v191 == -1 || v191 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
              goto LABEL_422;
            }
            char v192 = *(unsigned char *)(*(void *)&v4[*v9] + v191);
            *(void *)&v4[v190] = v191 + 1;
            v21 |= (unint64_t)(v192 & 0x7F) << v188;
            if (v192 < 0)
            {
              int v25 = 0;
              v188 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
              BOOL v27 = v189++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
          goto LABEL_423;
        case 0x23u:
          char v193 = 0;
          unsigned int v194 = 0;
          uint64_t v21 = 0;
          v5->_hasMediaAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v195 = *v6;
            unint64_t v196 = *(void *)&v4[v195];
            if (v196 == -1 || v196 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
              goto LABEL_422;
            }
            char v197 = *(unsigned char *)(*(void *)&v4[*v9] + v196);
            *(void *)&v4[v195] = v196 + 1;
            v21 |= (unint64_t)(v197 & 0x7F) << v193;
            if (v197 < 0)
            {
              int v25 = 0;
              v193 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
              BOOL v27 = v194++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
          goto LABEL_423;
        case 0x24u:
          char v198 = 0;
          unsigned int v199 = 0;
          uint64_t v21 = 0;
          v5->_hasBookAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v200 = *v6;
            unint64_t v201 = *(void *)&v4[v200];
            if (v201 == -1 || v201 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
              goto LABEL_422;
            }
            char v202 = *(unsigned char *)(*(void *)&v4[*v9] + v201);
            *(void *)&v4[v200] = v201 + 1;
            v21 |= (unint64_t)(v202 & 0x7F) << v198;
            if (v202 < 0)
            {
              int v25 = 0;
              v198 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
              BOOL v27 = v199++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
          goto LABEL_423;
        case 0x25u:
          char v203 = 0;
          unsigned int v204 = 0;
          uint64_t v21 = 0;
          v5->_hasAlbumAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v205 = *v6;
            unint64_t v206 = *(void *)&v4[v205];
            if (v206 == -1 || v206 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
              goto LABEL_422;
            }
            char v207 = *(unsigned char *)(*(void *)&v4[*v9] + v206);
            *(void *)&v4[v205] = v206 + 1;
            v21 |= (unint64_t)(v207 & 0x7F) << v203;
            if (v207 < 0)
            {
              int v25 = 0;
              v203 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
              BOOL v27 = v204++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
          goto LABEL_423;
        case 0x26u:
          char v208 = 0;
          unsigned int v209 = 0;
          uint64_t v21 = 0;
          v5->_hasCatsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v210 = *v6;
            unint64_t v211 = *(void *)&v4[v210];
            if (v211 == -1 || v211 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v212 = *(unsigned char *)(*(void *)&v4[*v9] + v211);
            *(void *)&v4[v210] = v211 + 1;
            v21 |= (unint64_t)(v212 & 0x7F) << v208;
            if (v212 < 0)
            {
              int v25 = 0;
              v208 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
              BOOL v27 = v209++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
          goto LABEL_423;
        case 0x27u:
          char v213 = 0;
          unsigned int v214 = 0;
          uint64_t v21 = 0;
          v5->_hasDogsAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v215 = *v6;
            unint64_t v216 = *(void *)&v4[v215];
            if (v216 == -1 || v216 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
              goto LABEL_422;
            }
            char v217 = *(unsigned char *)(*(void *)&v4[*v9] + v216);
            *(void *)&v4[v215] = v216 + 1;
            v21 |= (unint64_t)(v217 & 0x7F) << v213;
            if (v217 < 0)
            {
              int v25 = 0;
              v213 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
              BOOL v27 = v214++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
          goto LABEL_423;
        case 0x28u:
          char v218 = 0;
          unsigned int v219 = 0;
          uint64_t v21 = 0;
          v5->_hasApparelAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v220 = *v6;
            unint64_t v221 = *(void *)&v4[v220];
            if (v221 == -1 || v221 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
              goto LABEL_422;
            }
            char v222 = *(unsigned char *)(*(void *)&v4[*v9] + v221);
            *(void *)&v4[v220] = v221 + 1;
            v21 |= (unint64_t)(v222 & 0x7F) << v218;
            if (v222 < 0)
            {
              int v25 = 0;
              v218 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
              BOOL v27 = v219++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
          goto LABEL_423;
        case 0x29u:
          char v223 = 0;
          unsigned int v224 = 0;
          uint64_t v21 = 0;
          v5->_hasFoodAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v225 = *v6;
            unint64_t v226 = *(void *)&v4[v225];
            if (v226 == -1 || v226 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
              goto LABEL_422;
            }
            char v227 = *(unsigned char *)(*(void *)&v4[*v9] + v226);
            *(void *)&v4[v225] = v226 + 1;
            v21 |= (unint64_t)(v227 & 0x7F) << v223;
            if (v227 < 0)
            {
              int v25 = 0;
              v223 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
              BOOL v27 = v224++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Au:
          char v228 = 0;
          unsigned int v229 = 0;
          uint64_t v21 = 0;
          v5->_hasStorefrontAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v230 = *v6;
            unint64_t v231 = *(void *)&v4[v230];
            if (v231 == -1 || v231 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
              goto LABEL_422;
            }
            char v232 = *(unsigned char *)(*(void *)&v4[*v9] + v231);
            *(void *)&v4[v230] = v231 + 1;
            v21 |= (unint64_t)(v232 & 0x7F) << v228;
            if (v232 < 0)
            {
              int v25 = 0;
              v228 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
              BOOL v27 = v229++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Bu:
          char v233 = 0;
          unsigned int v234 = 0;
          uint64_t v21 = 0;
          v5->_hasSignSymbolAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v235 = *v6;
            unint64_t v236 = *(void *)&v4[v235];
            if (v236 == -1 || v236 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            char v237 = *(unsigned char *)(*(void *)&v4[*v9] + v236);
            *(void *)&v4[v235] = v236 + 1;
            v21 |= (unint64_t)(v237 & 0x7F) << v233;
            if (v237 < 0)
            {
              int v25 = 0;
              v233 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
              BOOL v27 = v234++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Cu:
          char v238 = 0;
          unsigned int v239 = 0;
          uint64_t v21 = 0;
          v5->_hasLaundryCareSymbolAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v240 = *v6;
            unint64_t v241 = *(void *)&v4[v240];
            if (v241 == -1 || v241 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            char v242 = *(unsigned char *)(*(void *)&v4[*v9] + v241);
            *(void *)&v4[v240] = v241 + 1;
            v21 |= (unint64_t)(v242 & 0x7F) << v238;
            if (v242 < 0)
            {
              int v25 = 0;
              v238 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
              BOOL v27 = v239++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Du:
          char v243 = 0;
          unsigned int v244 = 0;
          uint64_t v21 = 0;
          v5->_hasAutoSymbolAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v245 = *v6;
            unint64_t v246 = *(void *)&v4[v245];
            if (v246 == -1 || v246 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            char v247 = *(unsigned char *)(*(void *)&v4[*v9] + v246);
            *(void *)&v4[v245] = v246 + 1;
            v21 |= (unint64_t)(v247 & 0x7F) << v243;
            if (v247 < 0)
            {
              int v25 = 0;
              v243 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
              BOOL v27 = v244++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Eu:
          char v248 = 0;
          unsigned int v249 = 0;
          uint64_t v21 = 0;
          v5->_hasBrandLogoSymbolAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v250 = *v6;
            unint64_t v251 = *(void *)&v4[v250];
            if (v251 == -1 || v251 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            char v252 = *(unsigned char *)(*(void *)&v4[*v9] + v251);
            *(void *)&v4[v250] = v251 + 1;
            v21 |= (unint64_t)(v252 & 0x7F) << v248;
            if (v252 < 0)
            {
              int v25 = 0;
              v248 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
              BOOL v27 = v249++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Fu:
          char v253 = 0;
          unsigned int v254 = 0;
          uint64_t v21 = 0;
          v5->_hasObject2DAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v255 = *v6;
            unint64_t v256 = *(void *)&v4[v255];
            if (v256 == -1 || v256 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
              goto LABEL_422;
            }
            char v257 = *(unsigned char *)(*(void *)&v4[*v9] + v256);
            *(void *)&v4[v255] = v256 + 1;
            v21 |= (unint64_t)(v257 & 0x7F) << v253;
            if (v257 < 0)
            {
              int v25 = 0;
              v253 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
              BOOL v27 = v254++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
          goto LABEL_423;
        case 0x30u:
          char v258 = 0;
          unsigned int v259 = 0;
          uint64_t v21 = 0;
          v5->_hasBarcodeDetectionAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v260 = *v6;
            unint64_t v261 = *(void *)&v4[v260];
            if (v261 == -1 || v261 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
              goto LABEL_422;
            }
            char v262 = *(unsigned char *)(*(void *)&v4[*v9] + v261);
            *(void *)&v4[v260] = v261 + 1;
            v21 |= (unint64_t)(v262 & 0x7F) << v258;
            if (v262 < 0)
            {
              int v25 = 0;
              v258 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
              BOOL v27 = v259++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
          goto LABEL_423;
        case 0x31u:
          char v263 = 0;
          unsigned int v264 = 0;
          uint64_t v21 = 0;
          v5->_hasSculptureAssetSuccessesCount = 1;
          while (2)
          {
            uint64_t v265 = *v6;
            unint64_t v266 = *(void *)&v4[v265];
            if (v266 == -1 || v266 >= *(void *)&v4[*v7])
            {
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
              goto LABEL_422;
            }
            char v267 = *(unsigned char *)(*(void *)&v4[*v9] + v266);
            *(void *)&v4[v265] = v266 + 1;
            v21 |= (unint64_t)(v267 & 0x7F) << v263;
            if (v267 < 0)
            {
              int v25 = 0;
              v263 += 7;
              uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
              BOOL v27 = v264++ > 8;
              if (v27) {
                goto LABEL_426;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
          goto LABEL_423;
        case 0x32u:
          char v268 = 0;
          unsigned int v269 = 0;
          uint64_t v21 = 0;
          v5->_hasSkylineAssetSuccessesCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_480;
          }
          continue;
      }
      while (1)
      {
        uint64_t v270 = *v6;
        unint64_t v271 = *(void *)&v4[v270];
        if (v271 == -1 || v271 >= *(void *)&v4[*v7]) {
          break;
        }
        char v272 = *(unsigned char *)(*(void *)&v4[*v9] + v271);
        *(void *)&v4[v270] = v271 + 1;
        v21 |= (unint64_t)(v272 & 0x7F) << v268;
        if ((v272 & 0x80) == 0)
        {
          uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
          goto LABEL_423;
        }
        int v25 = 0;
        v268 += 7;
        uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
        BOOL v27 = v269++ > 8;
        if (v27) {
          goto LABEL_426;
        }
      }
      uint64_t v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
LABEL_422:
      v4[*v8] = 1;
LABEL_423:
      int v25 = v4[*v8] ? 0 : v21;
LABEL_426:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_480:
  }
    id v273 = 0;
  else {
LABEL_481:
  }
    id v273 = v5;

  return v273;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  char v52 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed artAssetProcessedCount](self, "artAssetProcessedCount"));
  uint64_t v55 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed natureAssetProcessedCount](self, "natureAssetProcessedCount"));
  unsigned int v54 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed animalsAssetProcessedCount](self, "animalsAssetProcessedCount"));
  char v53 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed birdsAssetProcessedCount](self, "birdsAssetProcessedCount"));
  unsigned int v49 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed insectsAssetProcessedCount](self, "insectsAssetProcessedCount"));
  unint64_t v51 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed reptilesAssetProcessedCount](self, "reptilesAssetProcessedCount"));
  uint64_t v50 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mammalsAssetProcessedCount](self, "mammalsAssetProcessedCount"));
  char v48 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed landmarkAssetProcessedCount](self, "landmarkAssetProcessedCount"));
  uint64_t v45 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed naturalLandmarkProcessedAssetCount](self, "naturalLandmarkProcessedAssetCount"));
  char v47 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mediaAssetProcessedCount](self, "mediaAssetProcessedCount"));
  unsigned int v44 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed bookAssetProcessedCount](self, "bookAssetProcessedCount"));
  unint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed albumAssetProcessedCount](self, "albumAssetProcessedCount"));
  unint64_t v41 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed catsAssetProcessedCount](self, "catsAssetProcessedCount"));
  char v43 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed dogsAssetProcessedCount](self, "dogsAssetProcessedCount"));
  uint64_t v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed apparelAssetProcessedCount](self, "apparelAssetProcessedCount"));
  char v38 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed foodAssetProcessedCount](self, "foodAssetProcessedCount"));
  char v42 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed storefrontAssetProcessedCount](self, "storefrontAssetProcessedCount"));
  unsigned int v39 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed signSymbolAssetProcessedCount](self, "signSymbolAssetProcessedCount"));
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetProcessedCount](self, "laundryCareSymbolAssetProcessedCount"));
  char v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed autoSymbolAssetProcessedCount](self, "autoSymbolAssetProcessedCount"));
  unsigned int v34 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetProcessedCount](self, "brandLogoSymbolAssetProcessedCount"));
  char v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed object2DAssetProcessedCount](self, "object2DAssetProcessedCount"));
  unint64_t v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetProcessedCount](self, "barcodeDetectionAssetProcessedCount"));
  unint64_t v31 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed sculptureAssetProcessedCount](self, "sculptureAssetProcessedCount"));
  char v33 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed skylineAssetProcessedCount](self, "skylineAssetProcessedCount"));
  uint64_t v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed artAssetSuccessesCount](self, "artAssetSuccessesCount"));
  unsigned int v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed natureAssetSuccessesCount](self, "natureAssetSuccessesCount"));
  char v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed animalsAssetSuccessesCount](self, "animalsAssetSuccessesCount"));
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed birdsAssetSuccessesCount](self, "birdsAssetSuccessesCount"));
  int v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed insectsAssetSuccessesCount](self, "insectsAssetSuccessesCount"));
  BOOL v27 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed reptilesAssetSuccessesCount](self, "reptilesAssetSuccessesCount"));
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mammalsAssetSuccessesCount](self, "mammalsAssetSuccessesCount"));
  int v25 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed landmarkAssetSuccessesCount](self, "landmarkAssetSuccessesCount"));
  char v24 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed naturalLandmarkSuccessesAssetCount](self, "naturalLandmarkSuccessesAssetCount"));
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed mediaAssetSuccessesCount](self, "mediaAssetSuccessesCount"));
  char v15 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed bookAssetSuccessesCount](self, "bookAssetSuccessesCount"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed albumAssetSuccessesCount](self, "albumAssetSuccessesCount"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed catsAssetSuccessesCount](self, "catsAssetSuccessesCount"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed dogsAssetSuccessesCount](self, "dogsAssetSuccessesCount"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed apparelAssetSuccessesCount](self, "apparelAssetSuccessesCount"));
  unsigned int v20 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed foodAssetSuccessesCount](self, "foodAssetSuccessesCount"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed storefrontAssetSuccessesCount](self, "storefrontAssetSuccessesCount"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed signSymbolAssetSuccessesCount](self, "signSymbolAssetSuccessesCount"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetSuccessesCount](self, "laundryCareSymbolAssetSuccessesCount"));
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed autoSymbolAssetSuccessesCount](self, "autoSymbolAssetSuccessesCount"));
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetSuccessesCount](self, "brandLogoSymbolAssetSuccessesCount"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed object2DAssetSuccessesCount](self, "object2DAssetSuccessesCount"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetSuccessesCount](self, "barcodeDetectionAssetSuccessesCount"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed sculptureAssetSuccessesCount](self, "sculptureAssetSuccessesCount"));
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPECProcessed skylineAssetSuccessesCount](self, "skylineAssetSuccessesCount"));
  id v19 = (id)objc_msgSend(v18, "initWithFormat:", @"BMPECProcessed with artAssetProcessedCount: %@, natureAssetProcessedCount: %@, animalsAssetProcessedCount: %@, birdsAssetProcessedCount: %@, insectsAssetProcessedCount: %@, reptilesAssetProcessedCount: %@, mammalsAssetProcessedCount: %@, landmarkAssetProcessedCount: %@, naturalLandmarkProcessedAssetCount: %@, mediaAssetProcessedCount: %@, bookAssetProcessedCount: %@, albumAssetProcessedCount: %@, catsAssetProcessedCount: %@, dogsAssetProcessedCount: %@, apparelAssetProcessedCount: %@, foodAssetProcessedCount: %@, storefrontAssetProcessedCount: %@, signSymbolAssetProcessedCount: %@, laundryCareSymbolAssetProcessedCount: %@, autoSymbolAssetProcessedCount: %@, brandLogoSymbolAssetProcessedCount: %@, object2DAssetProcessedCount: %@, barcodeDetectionAssetProcessedCount: %@, sculptureAssetProcessedCount: %@, skylineAssetProcessedCount: %@, artAssetSuccessesCount: %@, natureAssetSuccessesCount: %@, animalsAssetSuccessesCount: %@, birdsAssetSuccessesCount: %@, insectsAssetSuccessesCount: %@, reptilesAssetSuccessesCount: %@, mammalsAssetSuccessesCount: %@, landmarkAssetSuccessesCount: %@, naturalLandmarkSuccessesAssetCount: %@, mediaAssetSuccessesCount: %@, bookAssetSuccessesCount: %@, albumAssetSuccessesCount: %@, catsAssetSuccessesCount: %@, dogsAssetSuccessesCount: %@, apparelAssetSuccessesCount: %@, foodAssetSuccessesCount: %@, storefrontAssetSuccessesCount: %@, signSymbolAssetSuccessesCount: %@, laundryCareSymbolAssetSuccessesCount: %@, autoSymbolAssetSuccessesCount: %@, brandLogoSymbolAssetSuccessesCount: %@, object2DAssetSuccessesCount: %@, barcodeDetectionAssetSuccessesCount: %@, sculptureAssetSuccessesCount: %@, skylineAssetSuccessesCount: %@", v52, v55, v54, v53, v49, v51, v50, v48, v45, v47, v44, v46, v41, v43, v40, v38,
              v42,
              v39,
              v35,
              v37,
              v34,
              v32,
              v36,
              v31,
              v33,
              v30,
              v29,
              v28,
              v26,
              v17,
              v27,
              v16,
              v25,
              v24,
              v23,
              v15,
              v22,
              v14,
              v21,
              v13,
              v20,
              v12,
              v11,
              v10,
              v9,
              v3,
              v4,
              v5,
              v6,
              v7);

  return (NSString *)v19;
}

- (BMPECProcessed)initWithArtAssetProcessedCount:(id)a3 natureAssetProcessedCount:(id)a4 animalsAssetProcessedCount:(id)a5 birdsAssetProcessedCount:(id)a6 insectsAssetProcessedCount:(id)a7 reptilesAssetProcessedCount:(id)a8 mammalsAssetProcessedCount:(id)a9 landmarkAssetProcessedCount:(id)a10 naturalLandmarkProcessedAssetCount:(id)a11 mediaAssetProcessedCount:(id)a12 bookAssetProcessedCount:(id)a13 albumAssetProcessedCount:(id)a14 catsAssetProcessedCount:(id)a15 dogsAssetProcessedCount:(id)a16 apparelAssetProcessedCount:(id)a17 foodAssetProcessedCount:(id)a18 storefrontAssetProcessedCount:(id)a19 signSymbolAssetProcessedCount:(id)a20 laundryCareSymbolAssetProcessedCount:(id)a21 autoSymbolAssetProcessedCount:(id)a22 brandLogoSymbolAssetProcessedCount:(id)a23 object2DAssetProcessedCount:(id)a24 barcodeDetectionAssetProcessedCount:(id)a25 sculptureAssetProcessedCount:(id)a26 skylineAssetProcessedCount:(id)a27 artAssetSuccessesCount:(id)a28 natureAssetSuccessesCount:(id)a29 animalsAssetSuccessesCount:(id)a30 birdsAssetSuccessesCount:(id)a31 insectsAssetSuccessesCount:(id)a32 reptilesAssetSuccessesCount:(id)a33 mammalsAssetSuccessesCount:(id)a34 landmarkAssetSuccessesCount:(id)a35 naturalLandmarkSuccessesAssetCount:(id)a36 mediaAssetSuccessesCount:(id)a37 bookAssetSuccessesCount:(id)a38 albumAssetSuccessesCount:(id)a39 catsAssetSuccessesCount:(id)a40 dogsAssetSuccessesCount:(id)a41 apparelAssetSuccessesCount:(id)a42 foodAssetSuccessesCount:(id)a43 storefrontAssetSuccessesCount:(id)a44 signSymbolAssetSuccessesCount:(id)a45 laundryCareSymbolAssetSuccessesCount:(id)a46 autoSymbolAssetSuccessesCount:(id)a47 brandLogoSymbolAssetSuccessesCount:(id)a48 object2DAssetSuccessesCount:(id)a49 barcodeDetectionAssetSuccessesCount:(id)a50 sculptureAssetSuccessesCount:(id)a51 skylineAssetSuccessesCount:(id)a52
{
  id v160 = a3;
  id v159 = a4;
  id v158 = a5;
  id v157 = a6;
  id v156 = a7;
  id v155 = a8;
  id v153 = a9;
  id v152 = a10;
  id v151 = a11;
  id v150 = a12;
  id v149 = a13;
  id v148 = a14;
  id v147 = a15;
  id v146 = a16;
  id v145 = a17;
  id v144 = a18;
  id v143 = a19;
  id v142 = a20;
  id v141 = a21;
  id v140 = a22;
  id v139 = a23;
  id v138 = a24;
  id v137 = a25;
  id v136 = a26;
  id v135 = a27;
  id v134 = a28;
  id v133 = a29;
  id v132 = a30;
  id v131 = a31;
  id v130 = a32;
  id v129 = a33;
  id v128 = a34;
  id v127 = a35;
  id v126 = a36;
  id v125 = a37;
  id v124 = a38;
  id v123 = a39;
  id v122 = a40;
  id v121 = a41;
  id v120 = a42;
  id v119 = a43;
  id v56 = a44;
  id v57 = a45;
  id v58 = a46;
  id v59 = a47;
  id v60 = a48;
  id v61 = a49;
  id v62 = a50;
  id v63 = a51;
  id v64 = a52;
  v161.receiver = self;
  v161.super_class = (Class)BMPECProcessed;
  uint64_t v65 = [(BMEventBase *)&v161 init];

  if (v65)
  {
    v65->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v160)
    {
      v65->_hasArtAssetProcessedCount = 1;
      int v66 = [v160 intValue];
    }
    else
    {
      v65->_hasArtAssetProcessedCount = 0;
      int v66 = -1;
    }
    v65->_artAssetProcessedCount = v66;
    if (v159)
    {
      v65->_hasNatureAssetProcessedCount = 1;
      int v67 = [v159 intValue];
    }
    else
    {
      v65->_hasNatureAssetProcessedCount = 0;
      int v67 = -1;
    }
    v65->_natureAssetProcessedCount = v67;
    if (v158)
    {
      v65->_hasAnimalsAssetProcessedCount = 1;
      int v68 = [v158 intValue];
    }
    else
    {
      v65->_hasAnimalsAssetProcessedCount = 0;
      int v68 = -1;
    }
    v65->_animalsAssetProcessedCount = v68;
    if (v157)
    {
      v65->_hasBirdsAssetProcessedCount = 1;
      int v69 = [v157 intValue];
    }
    else
    {
      v65->_hasBirdsAssetProcessedCount = 0;
      int v69 = -1;
    }
    v65->_birdsAssetProcessedCount = v69;
    if (v156)
    {
      v65->_hasInsectsAssetProcessedCount = 1;
      int v70 = [v156 intValue];
    }
    else
    {
      v65->_hasInsectsAssetProcessedCount = 0;
      int v70 = -1;
    }
    v65->_insectsAssetProcessedCount = v70;
    if (v155)
    {
      v65->_hasReptilesAssetProcessedCount = 1;
      int v71 = [v155 intValue];
    }
    else
    {
      v65->_hasReptilesAssetProcessedCount = 0;
      int v71 = -1;
    }
    v65->_reptilesAssetProcessedCount = v71;
    if (v153)
    {
      v65->_hasMammalsAssetProcessedCount = 1;
      int v72 = [v153 intValue];
    }
    else
    {
      v65->_hasMammalsAssetProcessedCount = 0;
      int v72 = -1;
    }
    v65->_mammalsAssetProcessedCount = v72;
    if (v152)
    {
      v65->_hasLandmarkAssetProcessedCount = 1;
      int v73 = [v152 intValue];
    }
    else
    {
      v65->_hasLandmarkAssetProcessedCount = 0;
      int v73 = -1;
    }
    v65->_landmarkAssetProcessedCount = v73;
    if (v151)
    {
      v65->_hasNaturalLandmarkProcessedAssetCount = 1;
      int v74 = [v151 intValue];
    }
    else
    {
      v65->_hasNaturalLandmarkProcessedAssetCount = 0;
      int v74 = -1;
    }
    v65->_naturalLandmarkProcessedAssetCount = v74;
    if (v150)
    {
      v65->_hasMediaAssetProcessedCount = 1;
      int v75 = [v150 intValue];
    }
    else
    {
      v65->_hasMediaAssetProcessedCount = 0;
      int v75 = -1;
    }
    v65->_mediaAssetProcessedCount = v75;
    if (v149)
    {
      v65->_hasBookAssetProcessedCount = 1;
      int v76 = [v149 intValue];
    }
    else
    {
      v65->_hasBookAssetProcessedCount = 0;
      int v76 = -1;
    }
    v65->_bookAssetProcessedCount = v76;
    if (v148)
    {
      v65->_hasAlbumAssetProcessedCount = 1;
      int v77 = [v148 intValue];
    }
    else
    {
      v65->_hasAlbumAssetProcessedCount = 0;
      int v77 = -1;
    }
    v65->_albumAssetProcessedCount = v77;
    if (v147)
    {
      v65->_hasCatsAssetProcessedCount = 1;
      int v78 = [v147 intValue];
    }
    else
    {
      v65->_hasCatsAssetProcessedCount = 0;
      int v78 = -1;
    }
    v65->_catsAssetProcessedCount = v78;
    if (v146)
    {
      v65->_hasDogsAssetProcessedCount = 1;
      int v79 = [v146 intValue];
    }
    else
    {
      v65->_hasDogsAssetProcessedCount = 0;
      int v79 = -1;
    }
    v65->_dogsAssetProcessedCount = v79;
    if (v145)
    {
      v65->_hasApparelAssetProcessedCount = 1;
      int v80 = [v145 intValue];
    }
    else
    {
      v65->_hasApparelAssetProcessedCount = 0;
      int v80 = -1;
    }
    v65->_apparelAssetProcessedCount = v80;
    if (v144)
    {
      v65->_hasFoodAssetProcessedCount = 1;
      int v81 = [v144 intValue];
    }
    else
    {
      v65->_hasFoodAssetProcessedCount = 0;
      int v81 = -1;
    }
    v65->_foodAssetProcessedCount = v81;
    if (v143)
    {
      v65->_hasStorefrontAssetProcessedCount = 1;
      int v82 = [v143 intValue];
    }
    else
    {
      v65->_hasStorefrontAssetProcessedCount = 0;
      int v82 = -1;
    }
    v65->_storefrontAssetProcessedCount = v82;
    if (v142)
    {
      v65->_hasSignSymbolAssetProcessedCount = 1;
      int v83 = [v142 intValue];
    }
    else
    {
      v65->_hasSignSymbolAssetProcessedCount = 0;
      int v83 = -1;
    }
    v65->_signSymbolAssetProcessedCount = v83;
    if (v141)
    {
      v65->_hasLaundryCareSymbolAssetProcessedCount = 1;
      int v84 = [v141 intValue];
    }
    else
    {
      v65->_hasLaundryCareSymbolAssetProcessedCount = 0;
      int v84 = -1;
    }
    v65->_laundryCareSymbolAssetProcessedCount = v84;
    if (v140)
    {
      v65->_hasAutoSymbolAssetProcessedCount = 1;
      int v85 = [v140 intValue];
    }
    else
    {
      v65->_hasAutoSymbolAssetProcessedCount = 0;
      int v85 = -1;
    }
    v65->_autoSymbolAssetProcessedCount = v85;
    if (v139)
    {
      v65->_hasBrandLogoSymbolAssetProcessedCount = 1;
      int v86 = [v139 intValue];
    }
    else
    {
      v65->_hasBrandLogoSymbolAssetProcessedCount = 0;
      int v86 = -1;
    }
    v65->_brandLogoSymbolAssetProcessedCount = v86;
    if (v138)
    {
      v65->_hasObject2DAssetProcessedCount = 1;
      int v87 = [v138 intValue];
    }
    else
    {
      v65->_hasObject2DAssetProcessedCount = 0;
      int v87 = -1;
    }
    v65->_object2DAssetProcessedCount = v87;
    if (v137)
    {
      v65->_hasBarcodeDetectionAssetProcessedCount = 1;
      int v88 = [v137 intValue];
    }
    else
    {
      v65->_hasBarcodeDetectionAssetProcessedCount = 0;
      int v88 = -1;
    }
    v65->_barcodeDetectionAssetProcessedCount = v88;
    if (v136)
    {
      v65->_hasSculptureAssetProcessedCount = 1;
      int v89 = [v136 intValue];
    }
    else
    {
      v65->_hasSculptureAssetProcessedCount = 0;
      int v89 = -1;
    }
    v65->_sculptureAssetProcessedCount = v89;
    if (v135)
    {
      v65->_hasSkylineAssetProcessedCount = 1;
      int v90 = [v135 intValue];
    }
    else
    {
      v65->_hasSkylineAssetProcessedCount = 0;
      int v90 = -1;
    }
    v65->_skylineAssetProcessedCount = v90;
    if (v134)
    {
      v65->_hasArtAssetSuccessesCount = 1;
      int v91 = [v134 intValue];
    }
    else
    {
      v65->_hasArtAssetSuccessesCount = 0;
      int v91 = -1;
    }
    v65->_artAssetSuccessesCount = v91;
    if (v133)
    {
      v65->_hasNatureAssetSuccessesCount = 1;
      int v92 = [v133 intValue];
    }
    else
    {
      v65->_hasNatureAssetSuccessesCount = 0;
      int v92 = -1;
    }
    v65->_natureAssetSuccessesCount = v92;
    if (v132)
    {
      v65->_hasAnimalsAssetSuccessesCount = 1;
      int v93 = [v132 intValue];
    }
    else
    {
      v65->_hasAnimalsAssetSuccessesCount = 0;
      int v93 = -1;
    }
    v65->_animalsAssetSuccessesCount = v93;
    if (v131)
    {
      v65->_hasBirdsAssetSuccessesCount = 1;
      int v94 = [v131 intValue];
    }
    else
    {
      v65->_hasBirdsAssetSuccessesCount = 0;
      int v94 = -1;
    }
    v65->_birdsAssetSuccessesCount = v94;
    if (v130)
    {
      v65->_hasInsectsAssetSuccessesCount = 1;
      int v95 = [v130 intValue];
    }
    else
    {
      v65->_hasInsectsAssetSuccessesCount = 0;
      int v95 = -1;
    }
    v65->_insectsAssetSuccessesCount = v95;
    if (v129)
    {
      v65->_hasReptilesAssetSuccessesCount = 1;
      int v96 = [v129 intValue];
    }
    else
    {
      v65->_hasReptilesAssetSuccessesCount = 0;
      int v96 = -1;
    }
    v65->_reptilesAssetSuccessesCount = v96;
    if (v128)
    {
      v65->_hasMammalsAssetSuccessesCount = 1;
      int v97 = [v128 intValue];
    }
    else
    {
      v65->_hasMammalsAssetSuccessesCount = 0;
      int v97 = -1;
    }
    v65->_mammalsAssetSuccessesCount = v97;
    if (v127)
    {
      v65->_hasLandmarkAssetSuccessesCount = 1;
      int v98 = [v127 intValue];
    }
    else
    {
      v65->_hasLandmarkAssetSuccessesCount = 0;
      int v98 = -1;
    }
    v65->_landmarkAssetSuccessesCount = v98;
    if (v126)
    {
      v65->_hasNaturalLandmarkSuccessesAssetCount = 1;
      int v99 = [v126 intValue];
    }
    else
    {
      v65->_hasNaturalLandmarkSuccessesAssetCount = 0;
      int v99 = -1;
    }
    v65->_naturalLandmarkSuccessesAssetCount = v99;
    if (v125)
    {
      v65->_hasMediaAssetSuccessesCount = 1;
      int v100 = [v125 intValue];
    }
    else
    {
      v65->_hasMediaAssetSuccessesCount = 0;
      int v100 = -1;
    }
    v65->_mediaAssetSuccessesCount = v100;
    if (v124)
    {
      v65->_hasBookAssetSuccessesCount = 1;
      int v101 = [v124 intValue];
    }
    else
    {
      v65->_hasBookAssetSuccessesCount = 0;
      int v101 = -1;
    }
    v65->_bookAssetSuccessesCount = v101;
    if (v123)
    {
      v65->_hasAlbumAssetSuccessesCount = 1;
      int v102 = [v123 intValue];
    }
    else
    {
      v65->_hasAlbumAssetSuccessesCount = 0;
      int v102 = -1;
    }
    v65->_albumAssetSuccessesCount = v102;
    if (v122)
    {
      v65->_hasCatsAssetSuccessesCount = 1;
      int v103 = [v122 intValue];
    }
    else
    {
      v65->_hasCatsAssetSuccessesCount = 0;
      int v103 = -1;
    }
    v65->_catsAssetSuccessesCount = v103;
    if (v121)
    {
      v65->_hasDogsAssetSuccessesCount = 1;
      int v104 = [v121 intValue];
    }
    else
    {
      v65->_hasDogsAssetSuccessesCount = 0;
      int v104 = -1;
    }
    v65->_dogsAssetSuccessesCount = v104;
    if (v120)
    {
      v65->_hasApparelAssetSuccessesCount = 1;
      int v105 = [v120 intValue];
    }
    else
    {
      v65->_hasApparelAssetSuccessesCount = 0;
      int v105 = -1;
    }
    v65->_apparelAssetSuccessesCount = v105;
    if (v119)
    {
      v65->_hasFoodAssetSuccessesCount = 1;
      int v106 = [v119 intValue];
    }
    else
    {
      v65->_hasFoodAssetSuccessesCount = 0;
      int v106 = -1;
    }
    v65->_foodAssetSuccessesCount = v106;
    if (v56)
    {
      v65->_hasStorefrontAssetSuccessesCount = 1;
      int v107 = [v56 intValue];
    }
    else
    {
      v65->_hasStorefrontAssetSuccessesCount = 0;
      int v107 = -1;
    }
    v65->_storefrontAssetSuccessesCount = v107;
    if (v57)
    {
      v65->_hasSignSymbolAssetSuccessesCount = 1;
      int v108 = [v57 intValue];
    }
    else
    {
      v65->_hasSignSymbolAssetSuccessesCount = 0;
      int v108 = -1;
    }
    v65->_signSymbolAssetSuccessesCount = v108;
    if (v58)
    {
      v65->_hasLaundryCareSymbolAssetSuccessesCount = 1;
      int v109 = [v58 intValue];
    }
    else
    {
      v65->_hasLaundryCareSymbolAssetSuccessesCount = 0;
      int v109 = -1;
    }
    v65->_laundryCareSymbolAssetSuccessesCount = v109;
    if (v59)
    {
      v65->_hasAutoSymbolAssetSuccessesCount = 1;
      int v110 = [v59 intValue];
    }
    else
    {
      v65->_hasAutoSymbolAssetSuccessesCount = 0;
      int v110 = -1;
    }
    v65->_autoSymbolAssetSuccessesCount = v110;
    if (v60)
    {
      v65->_hasBrandLogoSymbolAssetSuccessesCount = 1;
      int v111 = [v60 intValue];
    }
    else
    {
      v65->_hasBrandLogoSymbolAssetSuccessesCount = 0;
      int v111 = -1;
    }
    v65->_brandLogoSymbolAssetSuccessesCount = v111;
    if (v61)
    {
      v65->_hasObject2DAssetSuccessesCount = 1;
      int v112 = [v61 intValue];
    }
    else
    {
      v65->_hasObject2DAssetSuccessesCount = 0;
      int v112 = -1;
    }
    v65->_object2DAssetSuccessesCount = v112;
    if (v62)
    {
      v65->_hasBarcodeDetectionAssetSuccessesCount = 1;
      int v113 = [v62 intValue];
    }
    else
    {
      v65->_hasBarcodeDetectionAssetSuccessesCount = 0;
      int v113 = -1;
    }
    v65->_barcodeDetectionAssetSuccessesCount = v113;
    if (v63)
    {
      v65->_hasSculptureAssetSuccessesCount = 1;
      int v114 = [v63 intValue];
    }
    else
    {
      v65->_hasSculptureAssetSuccessesCount = 0;
      int v114 = -1;
    }
    v65->_sculptureAssetSuccessesCount = v114;
    if (v64)
    {
      v65->_hasSkylineAssetSuccessesCount = 1;
      int v115 = [v64 intValue];
    }
    else
    {
      v65->_hasSkylineAssetSuccessesCount = 0;
      int v115 = -1;
    }
    v65->_skylineAssetSuccessesCount = v115;
  }
  unint64_t v116 = v65;

  return v116;
}

+ (id)protoFields
{
  v54[50] = *MEMORY[0x1E4F143B8];
  char v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"artAssetProcessedCount" number:1 type:2 subMessageClass:0];
  v54[0] = v53;
  char v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"natureAssetProcessedCount" number:2 type:2 subMessageClass:0];
  v54[1] = v52;
  unint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"animalsAssetProcessedCount" number:3 type:2 subMessageClass:0];
  v54[2] = v51;
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"birdsAssetProcessedCount" number:4 type:2 subMessageClass:0];
  v54[3] = v50;
  unsigned int v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"insectsAssetProcessedCount" number:5 type:2 subMessageClass:0];
  v54[4] = v49;
  char v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reptilesAssetProcessedCount" number:6 type:2 subMessageClass:0];
  v54[5] = v48;
  char v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mammalsAssetProcessedCount" number:7 type:2 subMessageClass:0];
  v54[6] = v47;
  unint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"landmarkAssetProcessedCount" number:8 type:2 subMessageClass:0];
  v54[7] = v46;
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"naturalLandmarkProcessedAssetCount" number:9 type:2 subMessageClass:0];
  v54[8] = v45;
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaAssetProcessedCount" number:10 type:2 subMessageClass:0];
  v54[9] = v44;
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bookAssetProcessedCount" number:11 type:2 subMessageClass:0];
  v54[10] = v43;
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"albumAssetProcessedCount" number:12 type:2 subMessageClass:0];
  v54[11] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"catsAssetProcessedCount" number:13 type:2 subMessageClass:0];
  v54[12] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dogsAssetProcessedCount" number:14 type:2 subMessageClass:0];
  v54[13] = v40;
  unsigned int v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"apparelAssetProcessedCount" number:15 type:2 subMessageClass:0];
  v54[14] = v39;
  char v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"foodAssetProcessedCount" number:16 type:2 subMessageClass:0];
  v54[15] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"storefrontAssetProcessedCount" number:17 type:2 subMessageClass:0];
  v54[16] = v37;
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"signSymbolAssetProcessedCount" number:18 type:2 subMessageClass:0];
  v54[17] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"laundryCareSymbolAssetProcessedCount" number:19 type:2 subMessageClass:0];
  v54[18] = v35;
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"autoSymbolAssetProcessedCount" number:20 type:2 subMessageClass:0];
  v54[19] = v34;
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brandLogoSymbolAssetProcessedCount" number:21 type:2 subMessageClass:0];
  v54[20] = v33;
  char v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"object2DAssetProcessedCount" number:22 type:2 subMessageClass:0];
  v54[21] = v32;
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"barcodeDetectionAssetProcessedCount" number:23 type:2 subMessageClass:0];
  v54[22] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sculptureAssetProcessedCount" number:24 type:2 subMessageClass:0];
  v54[23] = v30;
  unsigned int v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"skylineAssetProcessedCount" number:25 type:2 subMessageClass:0];
  v54[24] = v29;
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"artAssetSuccessesCount" number:26 type:2 subMessageClass:0];
  v54[25] = v28;
  BOOL v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"natureAssetSuccessesCount" number:27 type:2 subMessageClass:0];
  v54[26] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"animalsAssetSuccessesCount" number:28 type:2 subMessageClass:0];
  v54[27] = v26;
  int v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"birdsAssetSuccessesCount" number:29 type:2 subMessageClass:0];
  v54[28] = v25;
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"insectsAssetSuccessesCount" number:30 type:2 subMessageClass:0];
  v54[29] = v24;
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reptilesAssetSuccessesCount" number:31 type:2 subMessageClass:0];
  v54[30] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mammalsAssetSuccessesCount" number:32 type:2 subMessageClass:0];
  v54[31] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"landmarkAssetSuccessesCount" number:33 type:2 subMessageClass:0];
  v54[32] = v21;
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"naturalLandmarkSuccessesAssetCount" number:34 type:2 subMessageClass:0];
  v54[33] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaAssetSuccessesCount" number:35 type:2 subMessageClass:0];
  v54[34] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bookAssetSuccessesCount" number:36 type:2 subMessageClass:0];
  v54[35] = v18;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"albumAssetSuccessesCount" number:37 type:2 subMessageClass:0];
  v54[36] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"catsAssetSuccessesCount" number:38 type:2 subMessageClass:0];
  v54[37] = v16;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dogsAssetSuccessesCount" number:39 type:2 subMessageClass:0];
  v54[38] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"apparelAssetSuccessesCount" number:40 type:2 subMessageClass:0];
  v54[39] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"foodAssetSuccessesCount" number:41 type:2 subMessageClass:0];
  v54[40] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"storefrontAssetSuccessesCount" number:42 type:2 subMessageClass:0];
  v54[41] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"signSymbolAssetSuccessesCount" number:43 type:2 subMessageClass:0];
  v54[42] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"laundryCareSymbolAssetSuccessesCount" number:44 type:2 subMessageClass:0];
  v54[43] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"autoSymbolAssetSuccessesCount" number:45 type:2 subMessageClass:0];
  v54[44] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brandLogoSymbolAssetSuccessesCount" number:46 type:2 subMessageClass:0];
  v54[45] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"object2DAssetSuccessesCount" number:47 type:2 subMessageClass:0];
  v54[46] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"barcodeDetectionAssetSuccessesCount" number:48 type:2 subMessageClass:0];
  v54[47] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sculptureAssetSuccessesCount" number:49 type:2 subMessageClass:0];
  v54[48] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"skylineAssetSuccessesCount" number:50 type:2 subMessageClass:0];
  v54[49] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7578;
}

+ (id)columns
{
  v54[50] = *MEMORY[0x1E4F143B8];
  char v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"artAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  char v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"natureAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  unint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"animalsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"birdsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  unsigned int v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"insectsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  char v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reptilesAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  char v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mammalsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  unint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"landmarkAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"naturalLandmarkProcessedAssetCount" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:2 convertedType:0];
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bookAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"albumAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"catsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:2 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dogsAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:2 convertedType:0];
  unsigned int v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"apparelAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:2 convertedType:0];
  char v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"foodAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"storefrontAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:2 convertedType:0];
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"signSymbolAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:2 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"laundryCareSymbolAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:2 convertedType:0];
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"autoSymbolAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:2 convertedType:0];
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brandLogoSymbolAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  char v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"object2DAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"barcodeDetectionAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sculptureAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  unsigned int v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"skylineAssetProcessedCount" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"artAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:2 convertedType:0];
  BOOL v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"natureAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:2 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"animalsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:2 convertedType:0];
  int v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"birdsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:2 convertedType:0];
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"insectsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:2 convertedType:0];
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reptilesAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:2 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mammalsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:2 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"landmarkAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:2 convertedType:0];
  unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"naturalLandmarkSuccessesAssetCount" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:2 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:2 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bookAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:2 convertedType:0];
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"albumAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:2 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"catsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:2 convertedType:0];
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dogsAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:2 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"apparelAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:40 protoDataType:2 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"foodAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:41 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"storefrontAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"signSymbolAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"laundryCareSymbolAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"autoSymbolAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:45 protoDataType:2 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brandLogoSymbolAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:46 protoDataType:2 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"object2DAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:2 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"barcodeDetectionAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:2 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sculptureAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:2 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"skylineAssetSuccessesCount" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:2 convertedType:0];
  v54[0] = v52;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v48;
  v54[6] = v47;
  v54[7] = v46;
  v54[8] = v45;
  v54[9] = v44;
  v54[10] = v43;
  v54[11] = v42;
  v54[12] = v41;
  v54[13] = v40;
  v54[14] = v39;
  v54[15] = v38;
  v54[16] = v37;
  v54[17] = v36;
  v54[18] = v35;
  v54[19] = v34;
  v54[20] = v33;
  v54[21] = v32;
  v54[22] = v31;
  v54[23] = v30;
  v54[24] = v29;
  v54[25] = v28;
  v54[26] = v27;
  v54[27] = v26;
  v54[28] = v25;
  v54[29] = v24;
  v54[30] = v23;
  v54[31] = v22;
  v54[32] = v21;
  v54[33] = v20;
  v54[34] = v19;
  v54[35] = v18;
  v54[36] = v17;
  v54[37] = v16;
  v54[38] = v15;
  v54[39] = v14;
  v54[40] = v2;
  v54[41] = v3;
  v54[42] = v4;
  v54[43] = v5;
  v54[44] = v6;
  v54[45] = v7;
  v54[46] = v8;
  v54[47] = v13;
  v54[48] = v9;
  v54[49] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v12;
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

    id v8 = [[BMPECProcessed alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[17] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end