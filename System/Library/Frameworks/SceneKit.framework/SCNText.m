@interface SCNText
+ (BOOL)supportsSecureCoding;
+ (SCNText)textWithString:(id)string extrusionDepth:(CGFloat)extrusionDepth;
+ (id)text;
- ($2F63D0465F04E4DFD1C06D3083502DB8)params;
- (BOOL)_wantsSeparateGeometryElements;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (BOOL)isWrapped;
- (CGFloat)chamferRadius;
- (CGFloat)extrusionDepth;
- (CGFloat)flatness;
- (CGRect)containerFrame;
- (NSString)alignmentMode;
- (NSString)truncationMode;
- (SCNText)init;
- (SCNText)initWithCoder:(id)a3;
- (SCNText)initWithTextGeometryRef:(__C3DTextGeometry *)a3;
- (UIBezierPath)chamferProfile;
- (UIFont)font;
- (double)discretizedStraightLineMaxLength;
- (id)copy;
- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationTextGeometryWithTextGeometryRef:(__C3DTextGeometry *)a3;
- (id)patchFont:(id)a3;
- (id)presentationGeometry;
- (id)string;
- (int64_t)primitiveType;
- (void)_customDecodingOfSCNText:(id)a3;
- (void)_customEncodingOfSCNText:(id)a3;
- (void)_syncObjCModel:(__C3DTextGeometry *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignmentMode:(NSString *)alignmentMode;
- (void)setChamferProfile:(UIBezierPath *)chamferProfile;
- (void)setChamferRadius:(CGFloat)chamferRadius;
- (void)setContainerFrame:(CGRect)containerFrame;
- (void)setDiscretizedStraightLineMaxLength:(double)a3;
- (void)setExtrusionDepth:(CGFloat)extrusionDepth;
- (void)setFlatness:(CGFloat)flatness;
- (void)setFont:(UIFont *)font;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setString:(id)string;
- (void)setTruncationMode:(NSString *)truncationMode;
- (void)setWrapped:(BOOL)wrapped;
- (void)set_wantsSeparateGeometryElements:(BOOL)a3;
@end

@implementation SCNText

- (void)_syncObjCModel:(__C3DTextGeometry *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNText;
  [(SCNGeometry *)&v15 _syncObjCModel];
  self->_primitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)a3);
  float Flatness = C3DShapeGeometryGetFlatness((uint64_t)a3);
  self->_flatness = Flatness;
  float ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)a3);
  self->_chamferRadius = ChamferRadius;
  float ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)a3);
  self->_extrusionDepth = ExtrusionDepth;
  self->_chamferProfile = (UIBezierPath *)C3DShapeGeometryGetObjCChamferProfile((uint64_t)a3);
  float DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = DiscretizedStraightLineMaxLength;
  self->_alignmentMode = C3DTextGeometryGetAlignmentMode((uint64_t)a3);
  self->_truncationMode = C3DTextGeometryGetTruncationMode((uint64_t)a3);
  self->_string = (id)C3DTextGeometryGetString((uint64_t)a3);
  self->_font = (UIFont *)[(SCNText *)self patchFont:C3DTextGeometryGetFont((uint64_t)a3)];
  self->_useCustomContainerFrame = C3DTextGeometryGetUseCustomContainerFrame((uint64_t)a3);
  self->_customContainerFrame.origin.x = C3DTextGeometryGetCustomContainerFrame((uint64_t)a3);
  self->_customContainerFrame.origin.y = v9;
  self->_customContainerFrame.size.width = v10;
  self->_customContainerFrame.size.height = v11;
  self->_wrapped = C3DTextGeometryGetWrapped((uint64_t)a3);
  self->__wantsSeparateGeometryElements = C3DTextGeometryGetUseSeparateGeometryElements((uint64_t)a3);
  v12 = self->_font;
  id v13 = self->_string;
  v14 = self->_chamferProfile;
}

- (SCNText)init
{
  v3 = (const void *)C3DTextGeometryCreate();
  v7.receiver = self;
  v7.super_class = (Class)SCNText;
  v4 = [(SCNGeometry *)&v7 initWithGeometryRef:v3];
  v5 = v4;
  if (v4) {
    [(SCNText *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNText)initWithTextGeometryRef:(__C3DTextGeometry *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNText;
  v3 = [(SCNGeometry *)&v6 initWithGeometryRef:a3];
  v4 = v3;
  if (v3) {
    [(SCNText *)v3 _syncObjCModel:[(SCNGeometry *)v3 geometryRef]];
  }
  return v4;
}

- (id)initPresentationTextGeometryWithTextGeometryRef:(__C3DTextGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNText;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationGeometry
{
  id v2 = [[SCNText alloc] initPresentationTextGeometryWithTextGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (id)text
{
  return (id)[a1 textWithString:0 extrusionDepth:0.0];
}

+ (SCNText)textWithString:(id)string extrusionDepth:(CGFloat)extrusionDepth
{
  objc_super v6 = (SCNText *)objc_alloc_init((Class)a1);
  [(SCNText *)v6 setExtrusionDepth:extrusionDepth];
  [(SCNText *)v6 setString:string];
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  id v5 = [(SCNText *)self string];
  [(SCNText *)self extrusionDepth];
  return (id)[v3 stringWithFormat:@"<%@ | string=%@ extrusionDepth=%.3f> ", v4, v5, v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  Copy = (const void *)C3DTextGeometryCreateCopy([(SCNGeometry *)self geometryRef]);
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTextGeometryRef:Copy];
  CFRelease(Copy);
  [v5 _setupObjCModelFrom:self];
  return v5;
}

- (id)copy
{
  return [(SCNText *)self copyWithZone:0];
}

- (BOOL)_wantsSeparateGeometryElements
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->__wantsSeparateGeometryElements;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  char UseSeparateGeometryElements = C3DTextGeometryGetUseSeparateGeometryElements((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return UseSeparateGeometryElements;
}

- (void)set_wantsSeparateGeometryElements:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText set_wantsSeparateGeometryElements:]();
    }
  }
  else if (self->__wantsSeparateGeometryElements != v3)
  {
    self->__wantsSeparateGeometryElements = v3;
    uint64_t v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__SCNText_set_wantsSeparateGeometryElements___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = v3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __45__SCNText_set_wantsSeparateGeometryElements___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DTextGeometrySetUseSeparateGeometryElements(v2, v3);
}

- (CGFloat)chamferRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_chamferRadius;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ChamferRadius;
}

- (void)setChamferRadius:(CGFloat)chamferRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setChamferRadius:]();
    }
  }
  else
  {
    double v6 = fmax(chamferRadius, 0.0);
    if (v6 != self->_chamferRadius)
    {
      float v7 = v6;
      self->_chamferRadius = v7;
      BOOL v8 = [(SCNGeometry *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __28__SCNText_setChamferRadius___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:v8 object:self key:@"chamferRadius" applyBlock:v9];
    }
  }
}

void __28__SCNText_setChamferRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);
  double v4 = v3;

  C3DShapeGeometrySetChamferRadius(v2, v4);
}

- (double)discretizedStraightLineMaxLength
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_discretizedStraightLineMaxLength;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return DiscretizedStraightLineMaxLength;
}

- (void)setDiscretizedStraightLineMaxLength:(double)a3
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setDiscretizedStraightLineMaxLength:]();
    }
  }
  else
  {
    double v6 = fmax(a3, 0.0);
    if (v6 != self->_discretizedStraightLineMaxLength)
    {
      float v7 = v6;
      self->_discretizedStraightLineMaxLength = v7;
      BOOL v8 = [(SCNGeometry *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__SCNText_setDiscretizedStraightLineMaxLength___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
    }
  }
}

void __47__SCNText_setDiscretizedStraightLineMaxLength___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);
  double v4 = v3;

  C3DShapeGeometrySetDiscretizedStraightLineMaxLength(v2, v4);
}

- (CGFloat)extrusionDepth
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_extrusionDepth;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ExtrusionDepth;
}

- (void)setExtrusionDepth:(CGFloat)extrusionDepth
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setExtrusionDepth:]();
    }
  }
  else
  {
    double v6 = fmax(extrusionDepth, 0.0);
    if (v6 != self->_extrusionDepth)
    {
      float v7 = v6;
      self->_extrusionDepth = v7;
      BOOL v8 = [(SCNGeometry *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __29__SCNText_setExtrusionDepth___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:v8 object:self key:@"extrusionDepth" applyBlock:v9];
    }
  }
}

void __29__SCNText_setExtrusionDepth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);
  double v4 = v3;

  C3DShapeGeometrySetExtrusionDepth(v2, v4);
}

- (CGFloat)flatness
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_flatness;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double Flatness = C3DShapeGeometryGetFlatness((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Flatness;
}

- (void)setFlatness:(CGFloat)flatness
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setFlatness:]();
    }
  }
  else if (self->_flatness != flatness)
  {
    float v6 = flatness;
    self->_flatness = v6;
    float v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __23__SCNText_setFlatness___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = flatness;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

float __23__SCNText_setFlatness___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);
  double v4 = v3;

  return C3DShapeGeometrySetFlatness(v2, v4);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_primitiveType;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  int64_t PrimitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return PrimitiveType;
}

- (void)setPrimitiveType:(int64_t)a3
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setPrimitiveType:]();
    }
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    float v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNText_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __28__SCNText_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  unsigned __int8 v3 = *(unsigned char *)(a1 + 40);

  C3DShapeGeometrySetPrimitiveType(v2, v3);
}

- (id)string
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    unsigned __int8 v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    String = (void *)C3DTextGeometryGetString((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    String = self->_string;
  }
  float v6 = (void *)[String copy];

  return v6;
}

- (void)setString:(id)string
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setString:]();
    }
  }
  else
  {
    id v6 = self->_string;
    if (v6 != string)
    {

      self->_string = (id)[string copy];
      float v7 = [(SCNGeometry *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __21__SCNText_setString___block_invoke;
      v8[3] = &unk_264005010;
      v8[4] = self;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
    }
  }
}

void __21__SCNText_setString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 200);

  C3DTextGeometrySetString(v2, v3);
}

- (BOOL)isWrapped
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_wrapped;
  }
  unsigned __int8 v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  char Wrapped = C3DTextGeometryGetWrapped((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Wrapped;
}

- (void)setWrapped:(BOOL)wrapped
{
  BOOL v3 = wrapped;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNText setWrapped:]();
    }
  }
  else if (self->_wrapped != v3)
  {
    self->_wrapped = v3;
    id v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __22__SCNText_setWrapped___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = v3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __22__SCNText_setWrapped___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DTextGeometrySetWrapped(v2, v3);
}

- (id)patchFont:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "fontName"), "hasPrefix:", @".SFUI"))
  {
    uint64_t v4 = (void *)MEMORY[0x263F1C658];
    [v3 pointSize];
    id v3 = (id)objc_msgSend(v4, "fontWithName:size:", @"HelveticaNeue");
    if (!v3) {
      return v3;
    }
  }
  if (!objc_msgSend((id)objc_msgSend(v3, "fontName"), "hasPrefix:", @".SFNS")) {
    return v3;
  }
  id v5 = (void *)MEMORY[0x263F1C658];
  [v3 pointSize];

  return (id)objc_msgSend(v5, "fontWithName:size:", @"HelveticaNeue");
}

- (UIFont)font
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    id v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    Font = (UIFont *)C3DTextGeometryGetFont((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
    if (Font) {
      return Font;
    }
  }
  else
  {
    Font = self->_font;
    if (Font) {
      return Font;
    }
  }

  return (UIFont *)C3DTextGeometryGetDefaultFont();
}

- (void)setFont:(UIFont *)font
{
  if (self->_font != font)
  {
    id v4 = -[SCNText patchFont:](self, "patchFont:");

    self->_font = (UIFont *)v4;
    id v5 = [(SCNGeometry *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __19__SCNText_setFont___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = v4;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __19__SCNText_setFont___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  id v3 = *(void **)(a1 + 40);

  C3DTextGeometrySetFont(v2, v3);
}

- (CGRect)containerFrame
{
  if (![(SCNGeometry *)self isPresentationInstance])
  {
    if (self->_useCustomContainerFrame)
    {
      p_customContainerFrame = &self->_customContainerFrame;
LABEL_11:
      double x = p_customContainerFrame->origin.x;
      CGFloat y = p_customContainerFrame->origin.y;
      CGFloat width = p_customContainerFrame->size.width;
      CGFloat height = p_customContainerFrame->size.height;
      goto LABEL_12;
    }
LABEL_10:
    p_customContainerFrame = (CGRect *)MEMORY[0x263F001A8];
    goto LABEL_11;
  }
  id v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  char UseCustomContainerFrame = C3DTextGeometryGetUseCustomContainerFrame((uint64_t)[(SCNGeometry *)self geometryRef]);
  double x = C3DTextGeometryGetCustomContainerFrame((uint64_t)[(SCNGeometry *)self geometryRef]);
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (v4) {
    C3DSceneUnlock(v4);
  }
  if ((UseCustomContainerFrame & 1) == 0) {
    goto LABEL_10;
  }
LABEL_12:
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)setContainerFrame:(CGRect)containerFrame
{
  CGFloat height = containerFrame.size.height;
  CGFloat width = containerFrame.size.width;
  CGFloat y = containerFrame.origin.y;
  CGFloat x = containerFrame.origin.x;
  if (!self->_useCustomContainerFrame || !CGRectEqualToRect(self->_customContainerFrame, containerFrame))
  {
    if ([(SCNGeometry *)self isPresentationInstance])
    {
      BOOL v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SCNText setContainerFrame:]();
      }
    }
    else
    {
      self->_useCustomContainerFrame = 1;
      self->_customContainerFrame.origin.CGFloat x = x;
      self->_customContainerFrame.origin.CGFloat y = y;
      self->_customContainerFrame.size.CGFloat width = width;
      self->_customContainerFrame.size.CGFloat height = height;
      double v9 = [(SCNGeometry *)self sceneRef];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __29__SCNText_setContainerFrame___block_invoke;
      v10[3] = &unk_264005010;
      v10[4] = self;
      +[SCNTransaction postCommandWithContext:v9 object:self applyBlock:v10];
    }
  }
}

void __29__SCNText_setContainerFrame___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetUseCustomContainerFrame([*(id *)(a1 + 32) geometryRef], 1);
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  CGFloat v3 = *(double *)(*(void *)(a1 + 32) + 232);
  CGFloat v4 = *(double *)(*(void *)(a1 + 32) + 240);
  CGFloat v5 = *(double *)(*(void *)(a1 + 32) + 248);
  CGFloat v6 = *(double *)(*(void *)(a1 + 32) + 256);

  C3DTextGeometrySetCustomContainerFrame(v2, v3, v4, v5, v6);
}

- (NSString)truncationMode
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    CGFloat v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    int TruncationMode = C3DTextGeometryGetTruncationMode((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    int TruncationMode = self->_truncationMode;
  }

  return (NSString *)CATextTruncationModeFromC3DTextTruncationMode(TruncationMode);
}

- (void)setTruncationMode:(NSString *)truncationMode
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(NSString *)truncationMode isEqualToString:*MEMORY[0x263F16028]]) {
    goto LABEL_2;
  }
  if ([(NSString *)truncationMode isEqualToString:*MEMORY[0x263F16030]])
  {
    int v5 = 1;
  }
  else if ([(NSString *)truncationMode isEqualToString:*MEMORY[0x263F16018]])
  {
    int v5 = 2;
  }
  else if ([(NSString *)truncationMode isEqualToString:*MEMORY[0x263F16020]])
  {
    int v5 = 3;
  }
  else
  {
    CGFloat v6 = scn_default_log();
    int v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v11 = truncationMode;
      _os_log_impl(&dword_20B249000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unknown truncation mode %@", buf, 0xCu);
LABEL_2:
      int v5 = 0;
    }
  }
  if (self->_truncationMode != v5)
  {
    self->_truncationMode = v5;
    double v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__SCNText_setTruncationMode___block_invoke;
    v8[3] = &unk_264009038;
    v8[4] = self;
    int v9 = v5;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

void __29__SCNText_setTruncationMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DTextGeometrySetTruncationMode(v2, v3);
}

- (NSString)alignmentMode
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    int v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    int AlignmentMode = C3DTextGeometryGetAlignmentMode((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    int AlignmentMode = self->_alignmentMode;
  }

  return (NSString *)CATextAlignmentModeFromC3DTextAlignmentMode(AlignmentMode);
}

- (void)setAlignmentMode:(NSString *)alignmentMode
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(NSString *)alignmentMode isEqualToString:*MEMORY[0x263F15940]]) {
    goto LABEL_2;
  }
  if ([(NSString *)alignmentMode isEqualToString:*MEMORY[0x263F15938]])
  {
    int v5 = 1;
  }
  else if ([(NSString *)alignmentMode isEqualToString:*MEMORY[0x263F15948]])
  {
    int v5 = 2;
  }
  else if ([(NSString *)alignmentMode isEqualToString:*MEMORY[0x263F15928]])
  {
    int v5 = 3;
  }
  else if ([(NSString *)alignmentMode isEqualToString:*MEMORY[0x263F15930]])
  {
    int v5 = 4;
  }
  else
  {
    CGFloat v6 = scn_default_log();
    int v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v11 = alignmentMode;
      _os_log_impl(&dword_20B249000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unknown alignment mode %@", buf, 0xCu);
LABEL_2:
      int v5 = 0;
    }
  }
  if (self->_alignmentMode != v5)
  {
    self->_alignmentMode = v5;
    double v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__SCNText_setAlignmentMode___block_invoke;
    v8[3] = &unk_264009038;
    v8[4] = self;
    int v9 = v5;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

void __28__SCNText_setAlignmentMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DTextGeometrySetAlignmentMode(v2, v3);
}

- (UIBezierPath)chamferProfile
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    int v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    ObjCChamferProfile = (void *)C3DShapeGeometryGetObjCChamferProfile((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    ObjCChamferProfile = self->_chamferProfile;
  }
  CGFloat v6 = (void *)[ObjCChamferProfile copy];

  return (UIBezierPath *)v6;
}

- (void)setChamferProfile:(UIBezierPath *)chamferProfile
{
  self->_chamferProfile = (UIBezierPath *)[(UIBezierPath *)chamferProfile copy];
  int v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__SCNText_setChamferProfile___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = chamferProfile;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __29__SCNText_setChamferProfile___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(void **)(a1 + 40);

  C3DShapeGeometrySetObjCChamferProfile(v2, v3);
}

- ($2F63D0465F04E4DFD1C06D3083502DB8)params
{
  *(_OWORD *)&retstr->var7.origin.CGFloat y = 0u;
  *(_OWORD *)&retstr->var7.size.CGFloat height = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  CGRect result = ($2F63D0465F04E4DFD1C06D3083502DB8 *)[(SCNGeometry *)self isPresentationInstance];
  if (result)
  {
    C3DTextGeometryGetC3DKitParameters((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)v16);
    long long v6 = v16[5];
    *(_OWORD *)&retstr->var2 = v16[4];
    *(_OWORD *)&retstr->var5 = v6;
    long long v7 = v16[7];
    *(_OWORD *)&retstr->var7.origin.CGFloat y = v16[6];
    *(_OWORD *)&retstr->var7.size.CGFloat height = v7;
    long long v8 = v16[1];
    *(_OWORD *)&retstr->var0.var0 = v16[0];
    *(_OWORD *)&retstr->var0.var2 = v8;
    long long v9 = v16[3];
    *(_OWORD *)&retstr->var0.var4 = v16[2];
    *(_OWORD *)&retstr->var0.var6 = v9;
  }
  else
  {
    double chamferRadius = self->_chamferRadius;
    retstr->var0.var1 = self->_extrusionDepth;
    retstr->var0.var2 = chamferRadius;
    retstr->var0.var4 = self->_discretizedStraightLineMaxLength;
    CGPoint origin = self->_customContainerFrame.origin;
    retstr->var7.size = self->_customContainerFrame.size;
    retstr->var0.var0 = self->_primitiveType;
    chamferProfile = self->_chamferProfile;
    retstr->var0.var5 = 0;
    retstr->var0.var6 = chamferProfile;
    id string = self->_string;
    font = self->_font;
    retstr->var0.var3 = 0;
    int alignmentMode = self->_alignmentMode;
    retstr->var1 = string;
    retstr->var2 = font;
    LODWORD(string) = self->_truncationMode;
    retstr->var3 = alignmentMode;
    retstr->var4 = (int)string;
    retstr->var5 = self->_wrapped;
    retstr->var6 = self->_useCustomContainerFrame;
    retstr->var7.CGPoint origin = origin;
    retstr->var8 = self->_flatness;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  long long v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  DWORD2(v16) = 0;
  *(void *)&long long v16 = 0;
  DWORD2(v15) = 0;
  *(void *)&long long v15 = 0;
  long long v9 = [(SCNGeometry *)self geometryRef];
  if (self) {
    [(SCNText *)self params];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  BoundingBoCGFloat x = C3DTextGeometryGetBoundingBox((uint64_t)v9, &v16, &v15, v14);
  if (BoundingBox)
  {
    if (a3)
    {
      float v11 = *((float *)&v16 + 2);
      *(void *)&a3->CGFloat x = v16;
      a3->z = v11;
    }
    if (a4)
    {
      float v12 = *((float *)&v15 + 2);
      *(void *)&a4->CGFloat x = v15;
      a4->z = v12;
    }
  }
  if (v8) {
    C3DSceneUnlock(v8);
  }
  return BoundingBox;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  long long v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  long long v14 = 0uLL;
  long long v9 = [(SCNGeometry *)self geometryRef];
  if (self) {
    [(SCNText *)self params];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  int BoundingSphere = C3DTextGeometryGetBoundingSphere((uint64_t)v9, &v14, v13);
  if (BoundingSphere)
  {
    if (a3)
    {
      float v11 = *((float *)&v14 + 2);
      *(void *)&a3->CGFloat x = v14;
      a3->z = v11;
    }
    if (a4) {
      *a4 = *((float *)&v14 + 3);
    }
  }
  if (v8) {
    C3DSceneUnlock(v8);
  }
  return BoundingSphere;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNText;
  [(SCNGeometry *)&v3 dealloc];
}

- (void)_customDecodingOfSCNText:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  [(SCNText *)self setChamferProfile:SCNDecodeBezierPathForKey(a3, @"chamferProfile")];
  int v5 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  -[SCNText setString:](self, "setString:", SCNDecodeUnsafeObjectForKey(a3, @"string", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 2))));
  long long v6 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [(SCNText *)self setFont:[(SCNText *)self patchFont:SCNDecodeUnsafeObjectForKey(a3, @"font", v6)]];
  -[SCNText setAlignmentMode:](self, "setAlignmentMode:", CATextAlignmentModeFromC3DTextAlignmentMode([a3 decodeIntegerForKey:@"alignmentMode"]));
  -[SCNText setTruncationMode:](self, "setTruncationMode:", CATextTruncationModeFromC3DTextTruncationMode([a3 decodeIntegerForKey:@"truncationMode"]));
}

- (void)_customEncodingOfSCNText:(id)a3
{
  SCNEncodeBezierPathForKey((uint64_t)a3, self->_chamferProfile, @"chamferProfile");
  SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_string, @"string");
  SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_font, @"font");
  [a3 encodeInteger:self->_alignmentMode forKey:@"alignmentMode"];
  uint64_t truncationMode = self->_truncationMode;

  [a3 encodeInteger:truncationMode forKey:@"truncationMode"];
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNText;
  -[SCNGeometry encodeWithCoder:](&v9, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNText *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [(SCNText *)self _customEncodingOfSCNText:a3];
  *(float *)&double v5 = self->_flatness;
  [a3 encodeFloat:@"flatness" forKey:v5];
  *(float *)&double v6 = self->_chamferRadius;
  [a3 encodeFloat:@"chamferRadius" forKey:v6];
  *(float *)&double v7 = self->_extrusionDepth;
  [a3 encodeFloat:@"extrusionDepth" forKey:v7];
  *(float *)&double v8 = self->_discretizedStraightLineMaxLength;
  [a3 encodeFloat:@"discretizedStraightLineMaxLength" forKey:v8];
  [a3 encodeInteger:self->_primitiveType forKey:@"primitiveType"];
  [a3 encodeBool:self->_wrapped forKey:@"wrapped"];
  [a3 encodeBool:self->_useCustomContainerFrame forKey:@"useCustomContainerFrame"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_customContainerFrame.origin.x, self->_customContainerFrame.origin.y, self->_customContainerFrame.size.width, self->_customContainerFrame.size.height), @"customContainerFrame");
  [a3 encodeBool:self->__wantsSeparateGeometryElements forKey:@"_wantsSeparateGeometryElements"];
}

- (SCNText)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNText;
  uint64_t v4 = -[SCNGeometry initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNText *)v4 _customDecodingOfSCNText:a3];
    [a3 decodeFloatForKey:@"flatness"];
    [(SCNText *)v4 setFlatness:v6];
    [a3 decodeFloatForKey:@"chamferRadius"];
    [(SCNText *)v4 setChamferRadius:v7];
    [a3 decodeFloatForKey:@"extrusionDepth"];
    [(SCNText *)v4 setExtrusionDepth:v8];
    [a3 decodeFloatForKey:@"discretizedStraightLineMaxLength"];
    [(SCNText *)v4 setDiscretizedStraightLineMaxLength:v9];
    -[SCNText setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"primitiveType"]);
    -[SCNText setWrapped:](v4, "setWrapped:", [a3 decodeBoolForKey:@"wrapped"]);
    v4->_useCustomContainerFrame = [a3 decodeBoolForKey:@"useCustomContainerFrame"];
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"customContainerFrame"), "CGRectValue");
    v4->_customContainerFrame.origin.CGFloat x = v10;
    v4->_customContainerFrame.origin.CGFloat y = v11;
    v4->_customContainerFrame.size.CGFloat width = v12;
    v4->_customContainerFrame.size.CGFloat height = v13;
    -[SCNText set_wantsSeparateGeometryElements:](v4, "set_wantsSeparateGeometryElements:", [a3 decodeBoolForKey:@"_wantsSeparateGeometryElements"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)set_wantsSeparateGeometryElements:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setChamferRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setDiscretizedStraightLineMaxLength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExtrusionDepth:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFlatness:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPrimitiveType:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setString:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWrapped:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setContainerFrame:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end