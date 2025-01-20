@interface TDNamedAssetImportInfo
- ($01BB1521EC52D44A8E7628F5261DCEC8)sliceInsets;
- (BOOL)cubeMap;
- (BOOL)isFlippable;
- (BOOL)isTemplate;
- (BOOL)optOutOfThinning;
- (BOOL)preserveForArchiveOnly;
- (BOOL)preservesVectorRepresentation;
- (CGRect)alignmentRect;
- (CGSize)canvasSize;
- (CGSize)physicalSizeInMeters;
- (CGSize)resizableSliceSize;
- (NSArray)backgroundColorComponents;
- (NSArray)colorComponents;
- (NSArray)containedImageNames;
- (NSArray)layerReferences;
- (NSArray)textureInfos;
- (NSDate)modificationDate;
- (NSSet)tags;
- (NSString)appearanceName;
- (NSString)backgroundColorName;
- (NSString)fontName;
- (NSString)foregroundColorName;
- (NSString)localizationName;
- (NSString)name;
- (NSString)systemColorName;
- (NSString)universalTypeIdentifier;
- (NSURL)fileURL;
- (NSValue)iconSize;
- (TDNamedAssetImportInfo)init;
- (__n128)setTransformation:(__n128)a3;
- (__n128)transformation;
- (double)fontSize;
- (double)lossyCompressionQuality;
- (double)maxPointSize;
- (double)minPointSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)objectVersion;
- (int64_t)appearanceIdentifier;
- (int64_t)backgroundColorSpaceID;
- (int64_t)colorSpaceID;
- (int64_t)compressionType;
- (int64_t)displayGamut;
- (int64_t)graphicsFeatureSetClass;
- (int64_t)idiom;
- (int64_t)layoutDirection;
- (int64_t)localizationIdentifier;
- (int64_t)nameIdentifier;
- (int64_t)renditionSubtype;
- (int64_t)renditionType;
- (int64_t)resizingMode;
- (int64_t)scalingStyle;
- (int64_t)sizeClassHorizontal;
- (int64_t)sizeClassVertical;
- (int64_t)subtype;
- (int64_t)templateRenderingMode;
- (int64_t)textAlignment;
- (int64_t)textureInterpretation;
- (int64_t)texturePixelFormat;
- (int64_t)vectorGlyphRenderingMode;
- (signed)autoscalingType;
- (unint64_t)arrayIndex;
- (unint64_t)graphicsClass;
- (unint64_t)memoryClass;
- (unint64_t)scaleFactor;
- (unint64_t)textureDepth;
- (unint64_t)textureHeight;
- (unint64_t)textureWidth;
- (void)dealloc;
- (void)setAlignmentRect:(CGRect)a3;
- (void)setAppearanceIdentifier:(int64_t)a3;
- (void)setAppearanceName:(id)a3;
- (void)setArrayIndex:(unint64_t)a3;
- (void)setAutoscalingType:(signed __int16)a3;
- (void)setBackgroundColorComponents:(id)a3;
- (void)setBackgroundColorName:(id)a3;
- (void)setBackgroundColorSpaceID:(int64_t)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setColorComponents:(id)a3;
- (void)setColorSpaceID:(int64_t)a3;
- (void)setCompressionType:(int64_t)a3;
- (void)setContainedImageNames:(id)a3;
- (void)setCubeMap:(BOOL)a3;
- (void)setDisplayGamut:(int64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setForegroundColorName:(id)a3;
- (void)setGraphicsClass:(unint64_t)a3;
- (void)setGraphicsFeatureSetClass:(int64_t)a3;
- (void)setIconSize:(id)a3;
- (void)setIdiom:(int64_t)a3;
- (void)setIsFlippable:(BOOL)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setLayerReferences:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLocalizationIdentifier:(int64_t)a3;
- (void)setLocalizationName:(id)a3;
- (void)setLossyCompressionQuality:(double)a3;
- (void)setMaxPointSize:(double)a3;
- (void)setMemoryClass:(unint64_t)a3;
- (void)setMinPointSize:(double)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNameIdentifier:(int64_t)a3;
- (void)setObjectVersion:(int)a3;
- (void)setOptOutOfThinning:(BOOL)a3;
- (void)setPhysicalSizeInMeters:(CGSize)a3;
- (void)setPreserveForArchiveOnly:(BOOL)a3;
- (void)setPreservesVectorRepresentation:(BOOL)a3;
- (void)setRenditionType:(int64_t)a3;
- (void)setResizableSliceSize:(CGSize)a3;
- (void)setResizingMode:(int64_t)a3;
- (void)setScaleFactor:(unint64_t)a3;
- (void)setScalingStyle:(int64_t)a3;
- (void)setSizeClassHorizontal:(int64_t)a3;
- (void)setSizeClassVertical:(int64_t)a3;
- (void)setSliceInsets:(id)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setSystemColorName:(id)a3;
- (void)setTags:(id)a3;
- (void)setTemplateRenderingMode:(int64_t)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextureDepth:(unint64_t)a3;
- (void)setTextureHeight:(unint64_t)a3;
- (void)setTextureInfos:(id)a3;
- (void)setTextureInterpretation:(int64_t)a3;
- (void)setTexturePixelFormat:(int64_t)a3;
- (void)setTextureWidth:(unint64_t)a3;
- (void)setUniversalTypeIdentifier:(id)a3;
- (void)setVectorGlyphRenderingMode:(int64_t)a3;
- (void)verify;
@end

@implementation TDNamedAssetImportInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TDNamedAssetImportInfo allocWithZone:a3] init];
  [(TDNamedAssetImportInfo *)v4 setName:[(TDNamedAssetImportInfo *)self name]];
  [(TDNamedAssetImportInfo *)v4 setNameIdentifier:[(TDNamedAssetImportInfo *)self nameIdentifier]];
  [(TDNamedAssetImportInfo *)v4 setFileURL:[(TDNamedAssetImportInfo *)self fileURL]];
  [(TDNamedAssetImportInfo *)v4 setModificationDate:[(TDNamedAssetImportInfo *)self modificationDate]];
  [(TDNamedAssetImportInfo *)v4 setIdiom:[(TDNamedAssetImportInfo *)self idiom]];
  [(TDNamedAssetImportInfo *)v4 setSubtype:[(TDNamedAssetImportInfo *)self subtype]];
  [(TDNamedAssetImportInfo *)v4 setScaleFactor:[(TDNamedAssetImportInfo *)self scaleFactor]];
  [(TDNamedAssetImportInfo *)self sliceInsets];
  -[TDNamedAssetImportInfo setSliceInsets:](v4, "setSliceInsets:");
  [(TDNamedAssetImportInfo *)v4 setRenditionType:[(TDNamedAssetImportInfo *)self renditionType]];
  [(TDNamedAssetImportInfo *)v4 setResizingMode:[(TDNamedAssetImportInfo *)self resizingMode]];
  [(TDNamedAssetImportInfo *)self resizableSliceSize];
  -[TDNamedAssetImportInfo setResizableSliceSize:](v4, "setResizableSliceSize:");
  [(TDNamedAssetImportInfo *)v4 setPreservesVectorRepresentation:[(TDNamedAssetImportInfo *)self preservesVectorRepresentation]];
  [(TDNamedAssetImportInfo *)v4 setIsTemplate:[(TDNamedAssetImportInfo *)self isTemplate]];
  [(TDNamedAssetImportInfo *)v4 setTemplateRenderingMode:[(TDNamedAssetImportInfo *)self templateRenderingMode]];
  [(TDNamedAssetImportInfo *)v4 setOptOutOfThinning:[(TDNamedAssetImportInfo *)self optOutOfThinning]];
  [(TDNamedAssetImportInfo *)v4 setPreserveForArchiveOnly:[(TDNamedAssetImportInfo *)self preserveForArchiveOnly]];
  [(TDNamedAssetImportInfo *)self alignmentRect];
  -[TDNamedAssetImportInfo setAlignmentRect:](v4, "setAlignmentRect:");
  [(TDNamedAssetImportInfo *)v4 setSizeClassHorizontal:[(TDNamedAssetImportInfo *)self sizeClassHorizontal]];
  [(TDNamedAssetImportInfo *)v4 setSizeClassVertical:[(TDNamedAssetImportInfo *)self sizeClassVertical]];
  [(TDNamedAssetImportInfo *)v4 setDisplayGamut:[(TDNamedAssetImportInfo *)self displayGamut]];
  [(TDNamedAssetImportInfo *)v4 setLayoutDirection:[(TDNamedAssetImportInfo *)self layoutDirection]];
  [(TDNamedAssetImportInfo *)v4 setIsFlippable:[(TDNamedAssetImportInfo *)self isFlippable]];
  [(TDNamedAssetImportInfo *)v4 setMemoryClass:[(TDNamedAssetImportInfo *)self memoryClass]];
  [(TDNamedAssetImportInfo *)v4 setGraphicsFeatureSetClass:[(TDNamedAssetImportInfo *)self graphicsFeatureSetClass]];
  [(TDNamedAssetImportInfo *)v4 setCompressionType:[(TDNamedAssetImportInfo *)self compressionType]];
  [(TDNamedAssetImportInfo *)self lossyCompressionQuality];
  -[TDNamedAssetImportInfo setLossyCompressionQuality:](v4, "setLossyCompressionQuality:");
  [(TDNamedAssetImportInfo *)v4 setTags:[(TDNamedAssetImportInfo *)self tags]];
  [(TDNamedAssetImportInfo *)v4 setUniversalTypeIdentifier:[(TDNamedAssetImportInfo *)self universalTypeIdentifier]];
  [(TDNamedAssetImportInfo *)v4 setContainedImageNames:(id)[(NSArray *)[(TDNamedAssetImportInfo *)self containedImageNames] copy]];
  [(TDNamedAssetImportInfo *)self canvasSize];
  -[TDNamedAssetImportInfo setCanvasSize:](v4, "setCanvasSize:");
  [(TDNamedAssetImportInfo *)self physicalSizeInMeters];
  -[TDNamedAssetImportInfo setPhysicalSizeInMeters:](v4, "setPhysicalSizeInMeters:");
  [(TDNamedAssetImportInfo *)v4 setLayerReferences:[(TDNamedAssetImportInfo *)self layerReferences]];
  [(TDNamedAssetImportInfo *)v4 setTextureWidth:[(TDNamedAssetImportInfo *)self textureWidth]];
  [(TDNamedAssetImportInfo *)v4 setTextureHeight:[(TDNamedAssetImportInfo *)self textureHeight]];
  [(TDNamedAssetImportInfo *)v4 setTextureDepth:[(TDNamedAssetImportInfo *)self textureDepth]];
  [(TDNamedAssetImportInfo *)v4 setCubeMap:[(TDNamedAssetImportInfo *)self cubeMap]];
  [(TDNamedAssetImportInfo *)v4 setArrayIndex:[(TDNamedAssetImportInfo *)self arrayIndex]];
  [(TDNamedAssetImportInfo *)v4 setTexturePixelFormat:[(TDNamedAssetImportInfo *)self texturePixelFormat]];
  [(TDNamedAssetImportInfo *)v4 setTextureInterpretation:[(TDNamedAssetImportInfo *)self textureInterpretation]];
  [(TDNamedAssetImportInfo *)v4 setTextureInfos:(id)[(NSArray *)[(TDNamedAssetImportInfo *)self textureInfos] copy]];
  [(TDNamedAssetImportInfo *)v4 setColorSpaceID:[(TDNamedAssetImportInfo *)self colorSpaceID]];
  [(TDNamedAssetImportInfo *)v4 setColorComponents:[(TDNamedAssetImportInfo *)self colorComponents]];
  [(TDNamedAssetImportInfo *)v4 setIconSize:(id)[(NSValue *)[(TDNamedAssetImportInfo *)self iconSize] copy]];
  [(TDNamedAssetImportInfo *)v4 setFontName:[(TDNamedAssetImportInfo *)self fontName]];
  [(TDNamedAssetImportInfo *)v4 setForegroundColorName:[(TDNamedAssetImportInfo *)self foregroundColorName]];
  [(TDNamedAssetImportInfo *)v4 setBackgroundColorName:[(TDNamedAssetImportInfo *)self backgroundColorName]];
  [(TDNamedAssetImportInfo *)v4 setBackgroundColorSpaceID:[(TDNamedAssetImportInfo *)self backgroundColorSpaceID]];
  [(TDNamedAssetImportInfo *)v4 setBackgroundColorComponents:[(TDNamedAssetImportInfo *)self backgroundColorComponents]];
  [(TDNamedAssetImportInfo *)v4 setTextAlignment:[(TDNamedAssetImportInfo *)self textAlignment]];
  [(TDNamedAssetImportInfo *)v4 setScalingStyle:[(TDNamedAssetImportInfo *)self scalingStyle]];
  [(TDNamedAssetImportInfo *)self maxPointSize];
  -[TDNamedAssetImportInfo setMaxPointSize:](v4, "setMaxPointSize:");
  [(TDNamedAssetImportInfo *)self minPointSize];
  -[TDNamedAssetImportInfo setMinPointSize:](v4, "setMinPointSize:");
  [(TDNamedAssetImportInfo *)v4 setAppearanceName:[(TDNamedAssetImportInfo *)self appearanceName]];
  [(TDNamedAssetImportInfo *)v4 setAppearanceIdentifier:[(TDNamedAssetImportInfo *)self appearanceIdentifier]];
  [(TDNamedAssetImportInfo *)v4 setLocalizationName:[(TDNamedAssetImportInfo *)self localizationName]];
  [(TDNamedAssetImportInfo *)v4 setLocalizationIdentifier:[(TDNamedAssetImportInfo *)self localizationIdentifier]];
  [(TDNamedAssetImportInfo *)self transformation];
  -[TDNamedAssetImportInfo setTransformation:](v4, "setTransformation:");
  [(TDNamedAssetImportInfo *)v4 setObjectVersion:[(TDNamedAssetImportInfo *)self objectVersion]];
  return v4;
}

- (TDNamedAssetImportInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)TDNamedAssetImportInfo;
  v2 = [(TDNamedAssetImportInfo *)&v4 init];
  [(TDNamedAssetImportInfo *)v2 setResizingMode:1];
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TDNamedAssetImportInfo;
  [(TDNamedAssetImportInfo *)&v3 dealloc];
}

- (void)verify
{
  if ([(TDNamedAssetImportInfo *)self preserveForArchiveOnly])
  {
    if ([(TDNamedAssetImportInfo *)self renditionType] == 1007) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDNamedAssetImportInfo.m", 130, @"Can't have Texture and preservation %@", self);
    }
    if ([(TDNamedAssetImportInfo *)self renditionType] == 1017) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDNamedAssetImportInfo.m", 131, @"Can't have VectorGlyphs and preservation %@", self);
    }
    if ([(TDNamedAssetImportInfo *)self renditionType] == 1002) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDNamedAssetImportInfo.m", 132, @"Can't have LayerStacks and preservation %@", self);
    }
    if ([(TDNamedAssetImportInfo *)self renditionType] == 1018) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDNamedAssetImportInfo.m", 133, @"Can't have SolidLayerStacks and preservation %@", self);
    }
    if ([(TDNamedAssetImportInfo *)self renditionType] == 1004) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDNamedAssetImportInfo.m", 134, @"Can't have Packed and preservation %@", self);
    }
  }
}

- (int64_t)renditionSubtype
{
  if ([(TDNamedAssetImportInfo *)self resizingMode])
  {
    if ([(TDNamedAssetImportInfo *)self resizingMode] == 1)
    {
      unint64_t v3 = [(TDNamedAssetImportInfo *)self renditionType];
      if (v3 < 4)
      {
        objc_super v4 = &unk_235184A08;
        return v4[v3];
      }
    }
  }
  else
  {
    unint64_t v3 = [(TDNamedAssetImportInfo *)self renditionType];
    if (v3 < 4)
    {
      objc_super v4 = &unk_2351849E8;
      return v4[v3];
    }
  }
  return 0;
}

- (BOOL)isTemplate
{
  return (unint64_t)([(TDNamedAssetImportInfo *)self templateRenderingMode] - 1) < 2;
}

- (void)setIsTemplate:(BOOL)a3
{
}

- (id)description
{
  v60.receiver = self;
  v60.super_class = (Class)TDNamedAssetImportInfo;
  id v59 = [(TDNamedAssetImportInfo *)&v60 description];
  [(TDNamedAssetImportInfo *)self sliceInsets];
  uint64_t v58 = objc_msgSend(NSString, "stringWithFormat:", @"\nEdge insets top: %f left: %f bottom: %f right: %f", v3, v4, v5, v6);
  [(TDNamedAssetImportInfo *)self resizableSliceSize];
  v57 = NSStringFromSize(v61);
  int64_t v7 = [(TDNamedAssetImportInfo *)self displayGamut];
  if ([(TDNamedAssetImportInfo *)self layoutDirection] == 5)
  {
    v8 = @"Left to Right";
  }
  else
  {
    int64_t v9 = [(TDNamedAssetImportInfo *)self layoutDirection];
    v8 = @"Any direction";
    if (v9 == 4) {
      v8 = @"Right to Left";
    }
  }
  v53 = v8;
  v10 = @"P3";
  if (!v7) {
    v10 = @"sRGB";
  }
  v50 = v10;
  v56 = NSString;
  v55 = [(TDNamedAssetImportInfo *)self name];
  int64_t v54 = [(TDNamedAssetImportInfo *)self nameIdentifier];
  v52 = [(TDNamedAssetImportInfo *)self appearanceName];
  int64_t v51 = [(TDNamedAssetImportInfo *)self appearanceIdentifier];
  v49 = [(TDNamedAssetImportInfo *)self localizationName];
  int64_t v48 = [(TDNamedAssetImportInfo *)self localizationIdentifier];
  uint64_t v47 = [(NSURL *)[(TDNamedAssetImportInfo *)self fileURL] description];
  v46 = [(NSDate *)[(TDNamedAssetImportInfo *)self modificationDate] description];
  int64_t v45 = [(TDNamedAssetImportInfo *)self idiom];
  int64_t v44 = [(TDNamedAssetImportInfo *)self subtype];
  unint64_t v43 = [(TDNamedAssetImportInfo *)self scaleFactor];
  int64_t v42 = [(TDNamedAssetImportInfo *)self renditionType];
  int64_t v41 = [(TDNamedAssetImportInfo *)self resizingMode];
  BOOL v40 = [(TDNamedAssetImportInfo *)self isTemplate];
  BOOL v39 = [(TDNamedAssetImportInfo *)self preservesVectorRepresentation];
  int64_t v38 = [(TDNamedAssetImportInfo *)self templateRenderingMode];
  BOOL v37 = [(TDNamedAssetImportInfo *)self optOutOfThinning];
  [(TDNamedAssetImportInfo *)self alignmentRect];
  v36 = NSStringFromRect(v63);
  int64_t v35 = [(TDNamedAssetImportInfo *)self sizeClassHorizontal];
  int64_t v34 = [(TDNamedAssetImportInfo *)self sizeClassVertical];
  BOOL v33 = [(TDNamedAssetImportInfo *)self isFlippable];
  unint64_t v32 = [(TDNamedAssetImportInfo *)self memoryClass];
  int64_t v31 = [(TDNamedAssetImportInfo *)self graphicsFeatureSetClass];
  int64_t v30 = [(TDNamedAssetImportInfo *)self compressionType];
  [(TDNamedAssetImportInfo *)self lossyCompressionQuality];
  uint64_t v12 = v11;
  v29 = [(NSSet *)[(TDNamedAssetImportInfo *)self tags] description];
  v28 = [(TDNamedAssetImportInfo *)self universalTypeIdentifier];
  v27 = [(NSArray *)[(TDNamedAssetImportInfo *)self containedImageNames] description];
  [(TDNamedAssetImportInfo *)self canvasSize];
  v26 = NSStringFromSize(v62);
  v25 = [(NSArray *)[(TDNamedAssetImportInfo *)self layerReferences] description];
  int64_t v13 = [(TDNamedAssetImportInfo *)self renditionSubtype];
  int64_t v14 = [(TDNamedAssetImportInfo *)self compressionType];
  BOOL v15 = [(TDNamedAssetImportInfo *)self cubeMap];
  unint64_t v16 = [(TDNamedAssetImportInfo *)self textureWidth];
  unint64_t v17 = [(TDNamedAssetImportInfo *)self textureHeight];
  int64_t v18 = [(TDNamedAssetImportInfo *)self texturePixelFormat];
  v19 = [(TDNamedAssetImportInfo *)self textureInfos];
  uint64_t v20 = [(NSValue *)[(TDNamedAssetImportInfo *)self iconSize] description];
  v21 = [(TDNamedAssetImportInfo *)self fontName];
  [(TDNamedAssetImportInfo *)self fontSize];
  uint64_t v23 = objc_msgSend(v56, "stringWithFormat:", @"\n\tname: %@ \n\tnameIdentifier: %d \n\tappearance: %@ \n\tappearanceIdentifier: %d \n\tlocalization: %@ \n\tlocalizationIdentifier: %d \n\tfileURL: %@ \n\tmodificationDate: %@   \n\tidiom: %d \n\tsubtype: %d \n\tscaleFactor: %d \n\tsliceInsets: %@ \n\trenditionType: %d  \n\tresizingMode: %d \n\tresizableSliceSize: %@    \n\tisTemplate: %d \n\tpreservesVectorRepresentation: %d\n\ttemplateRenderingMode: %d \n\toptOutOfThinning: %d \n\talignmentRect: %@ \n\tsizeClassHorizontal: %d \n\tsizeClassVertical: %d  \n\tdisplayGamut: %@ \n\tlayoutDirection: %@   \n\tisFlippable: %d   \n\tmemoryClass: %d \n\tgraphicsFeatureSetClass: %d \n\tcompressionType: %d \n\tlossyCompressionQuality: %f    \n\ttags: %@ \n\tuniversalTypeIdentifier: %@ \n\tcontainedImageNames: %@    \n\tcanvasSize: %@ \n\tlayerReferences: %@ \n\trenditionSubtype: %d \n\tcompressionType: %d\n\tcubeMap: %d\n\ttextureWidth: %d\n\ttextureHeight: %d\n\ttexturePixelFormat: %d textureImportInfos:%@ \n\ticonSize: %@\n\tfontName: %@\n\tfontSize: %d", v55, v54, v52, v51, v49, v48, v47, v46, v45, v44, v43, v58, v42, v41, v57, v40,
          v39,
          v38,
          v37,
          v36,
          v35,
          v34,
          v50,
          v53,
          v33,
          v32,
          v31,
          v30,
          v12,
          v29,
          v28,
          v27,
          v26,
          v25,
          v13,
          v14,
          v15,
          v16,
          v17,
          v18,
          v19,
          v20,
          v21,
          (int)v22);
  return (id)[NSString stringWithFormat:@"%@  %@", v59, v23];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)nameIdentifier
{
  return self->_nameIdentifier;
}

- (void)setNameIdentifier:(int64_t)a3
{
  self->_nameIdentifier = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiom = a3;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_scaleFactor = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)sliceInsets
{
  double top = self->_sliceInsets.top;
  double left = self->_sliceInsets.left;
  double bottom = self->_sliceInsets.bottom;
  double right = self->_sliceInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (void)setSliceInsets:(id)a3
{
  self->_sliceInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (int64_t)renditionType
{
  return self->_renditionType;
}

- (void)setRenditionType:(int64_t)a3
{
  self->_renditionType = a3;
}

- (int64_t)resizingMode
{
  return self->_resizingMode;
}

- (void)setResizingMode:(int64_t)a3
{
  self->_resizingMode = a3;
}

- (CGSize)resizableSliceSize
{
  double width = self->_resizableSliceSize.width;
  double height = self->_resizableSliceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResizableSliceSize:(CGSize)a3
{
  self->_resizableSliceSize = a3;
}

- (BOOL)preservesVectorRepresentation
{
  return self->_preservesVectorRepresentation;
}

- (void)setPreservesVectorRepresentation:(BOOL)a3
{
  self->_preservesVectorRepresentation = a3;
}

- (signed)autoscalingType
{
  return self->_autoscalingType;
}

- (void)setAutoscalingType:(signed __int16)a3
{
  self->_autoscalingType = a3;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (BOOL)optOutOfThinning
{
  return self->_optOutOfThinning;
}

- (void)setOptOutOfThinning:(BOOL)a3
{
  self->_optOutOfThinning = a3;
}

- (BOOL)preserveForArchiveOnly
{
  return self->_preserveForArchiveOnly;
}

- (void)setPreserveForArchiveOnly:(BOOL)a3
{
  self->_preserveForArchiveOnly = a3;
}

- (CGRect)alignmentRect
{
  double x = self->_alignmentRect.origin.x;
  double y = self->_alignmentRect.origin.y;
  double width = self->_alignmentRect.size.width;
  double height = self->_alignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAlignmentRect:(CGRect)a3
{
  self->_alignmentRect = a3;
}

- (int64_t)sizeClassHorizontal
{
  return self->_sizeClassHorizontal;
}

- (void)setSizeClassHorizontal:(int64_t)a3
{
  self->_sizeClassHorizontal = a3;
}

- (int64_t)sizeClassVertical
{
  return self->_sizeClassVertical;
}

- (void)setSizeClassVertical:(int64_t)a3
{
  self->_sizeClassVertical = a3;
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

- (void)setDisplayGamut:(int64_t)a3
{
  self->_displayGamut = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (BOOL)isFlippable
{
  return self->_isFlippable;
}

- (void)setIsFlippable:(BOOL)a3
{
  self->_isFlippable = a3;
}

- (unint64_t)memoryClass
{
  return self->_memoryClass;
}

- (void)setMemoryClass:(unint64_t)a3
{
  self->_memoryClass = a3;
}

- (unint64_t)graphicsClass
{
  return self->_graphicsClass;
}

- (void)setGraphicsClass:(unint64_t)a3
{
  self->_graphicsClass = a3;
}

- (int64_t)graphicsFeatureSetClass
{
  return self->_graphicsFeatureSetClass;
}

- (void)setGraphicsFeatureSetClass:(int64_t)a3
{
  self->_graphicsFeatureSetClass = a3;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  self->_compressionType = a3;
}

- (double)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (void)setLossyCompressionQuality:(double)a3
{
  self->_lossyCompressionQualitdouble y = a3;
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSString)universalTypeIdentifier
{
  return self->_universalTypeIdentifier;
}

- (void)setUniversalTypeIdentifier:(id)a3
{
}

- (NSArray)containedImageNames
{
  return self->_containedImageNames;
}

- (void)setContainedImageNames:(id)a3
{
}

- (CGSize)physicalSizeInMeters
{
  double width = self->_physicalSizeInMeters.width;
  double height = self->_physicalSizeInMeters.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPhysicalSizeInMeters:(CGSize)a3
{
  self->_physicalSizeInMeters = a3;
}

- (__n128)transformation
{
  return a1[33];
}

- (__n128)setTransformation:(__n128)a3
{
  result[33] = a2;
  result[34] = a3;
  result[35] = a4;
  result[36] = a5;
  return result;
}

- (int)objectVersion
{
  return self->_objectVersion;
}

- (void)setObjectVersion:(int)a3
{
  self->_objectVersion = a3;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_vectorGlyphRenderingMode;
}

- (void)setVectorGlyphRenderingMode:(int64_t)a3
{
  self->_vectorGlyphRenderingMode = a3;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSArray)layerReferences
{
  return self->_layerReferences;
}

- (void)setLayerReferences:(id)a3
{
}

- (unint64_t)textureWidth
{
  return self->_textureWidth;
}

- (void)setTextureWidth:(unint64_t)a3
{
  self->_textureWidth = a3;
}

- (unint64_t)textureHeight
{
  return self->_textureHeight;
}

- (void)setTextureHeight:(unint64_t)a3
{
  self->_textureHeight = a3;
}

- (unint64_t)textureDepth
{
  return self->_textureDepth;
}

- (void)setTextureDepth:(unint64_t)a3
{
  self->_textureDepth = a3;
}

- (BOOL)cubeMap
{
  return self->_cubeMap;
}

- (void)setCubeMap:(BOOL)a3
{
  self->_cubeMap = a3;
}

- (unint64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (void)setArrayIndex:(unint64_t)a3
{
  self->_arrayIndedouble x = a3;
}

- (int64_t)texturePixelFormat
{
  return self->_texturePixelFormat;
}

- (void)setTexturePixelFormat:(int64_t)a3
{
  self->_texturePixelFormat = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (NSArray)textureInfos
{
  return self->_textureInfos;
}

- (void)setTextureInfos:(id)a3
{
}

- (int64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(int64_t)a3
{
  self->_colorSpaceID = a3;
}

- (NSArray)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
{
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)foregroundColorName
{
  return self->_foregroundColorName;
}

- (void)setForegroundColorName:(id)a3
{
}

- (NSString)backgroundColorName
{
  return self->_backgroundColorName;
}

- (void)setBackgroundColorName:(id)a3
{
}

- (int64_t)backgroundColorSpaceID
{
  return self->_backgroundColorSpaceID;
}

- (void)setBackgroundColorSpaceID:(int64_t)a3
{
  self->_backgroundColorSpaceID = a3;
}

- (NSArray)backgroundColorComponents
{
  return self->_backgroundColorComponents;
}

- (void)setBackgroundColorComponents:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (int64_t)scalingStyle
{
  return self->_scalingStyle;
}

- (void)setScalingStyle:(int64_t)a3
{
  self->_scalingStyle = a3;
}

- (double)maxPointSize
{
  return self->_maxPointSize;
}

- (void)setMaxPointSize:(double)a3
{
  self->_maxPointSize = a3;
}

- (double)minPointSize
{
  return self->_minPointSize;
}

- (void)setMinPointSize:(double)a3
{
  self->_minPointSize = a3;
}

- (NSValue)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(id)a3
{
}

- (NSString)appearanceName
{
  return self->_appearanceName;
}

- (void)setAppearanceName:(id)a3
{
}

- (int64_t)appearanceIdentifier
{
  return self->_appearanceIdentifier;
}

- (void)setAppearanceIdentifier:(int64_t)a3
{
  self->_appearanceIdentifier = a3;
}

- (NSString)localizationName
{
  return self->_localizationName;
}

- (void)setLocalizationName:(id)a3
{
}

- (int64_t)localizationIdentifier
{
  return self->_localizationIdentifier;
}

- (void)setLocalizationIdentifier:(int64_t)a3
{
  self->_localizationIdentifier = a3;
}

@end