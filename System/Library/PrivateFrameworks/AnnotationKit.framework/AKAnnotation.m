@interface AKAnnotation
+ (AKAnnotation)annotationWithData:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)defaultPlaceholderText;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKAnnotation)childAnnotation;
- (AKAnnotation)init;
- (AKAnnotation)initWithCoder:(id)a3;
- (AKAnnotation)parentAnnotation;
- (BOOL)conformsToAKFilledAnnotationProtocol;
- (BOOL)conformsToAKFlippableAnnotationProtocol;
- (BOOL)conformsToAKParentAnnotationProtocol;
- (BOOL)conformsToAKRectangularAnnotationProtocol;
- (BOOL)conformsToAKRotatableAnnotationProtocol;
- (BOOL)conformsToAKStrokedAnnotationProtocol;
- (BOOL)conformsToAKTextAnnotationProtocol;
- (BOOL)editingDisabled;
- (BOOL)editsDisableAppearanceOverride;
- (BOOL)isBeingCopied;
- (BOOL)isDraggingHandle;
- (BOOL)isEdited;
- (BOOL)isEditingText;
- (BOOL)isFormField;
- (BOOL)isTranslating;
- (BOOL)isUsingAppearanceOverride;
- (BOOL)shouldBurnIn;
- (BOOL)shouldObserveEdits;
- (BOOL)shouldUseAppearanceOverride;
- (BOOL)shouldUsePlaceholderText;
- (BOOL)textIsClipped;
- (BOOL)textIsFixedHeight;
- (BOOL)textIsFixedWidth;
- (CGRect)drawingBounds;
- (CGRect)hitTestBounds;
- (CGRect)initialDrawingBoundsForAppearanceOverride;
- (CGRect)integralDrawingBounds;
- (NSDate)modificationDate;
- (NSString)UUID;
- (NSString)author;
- (NSString)customPlaceholderText;
- (NSString)displayName;
- (NSString)textContentType;
- (double)originalModelBaseScaleFactor;
- (id)appearanceOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (int64_t)akSerializationPlatform;
- (int64_t)akSerializationVersion;
- (int64_t)originalExifOrientation;
- (unint64_t)formContentType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAkSerializationPlatform:(int64_t)a3;
- (void)setAkSerializationVersion:(int64_t)a3;
- (void)setAppearanceOverride:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setChildAnnotation:(id)a3;
- (void)setCustomPlaceholderText:(id)a3;
- (void)setEditingDisabled:(BOOL)a3;
- (void)setEditsDisableAppearanceOverride:(BOOL)a3;
- (void)setFormContentType:(unint64_t)a3;
- (void)setInitialDrawingBoundsForAppearanceOverride:(CGRect)a3;
- (void)setIsBeingCopied:(BOOL)a3;
- (void)setIsDraggingHandle:(BOOL)a3;
- (void)setIsEdited:(BOOL)a3;
- (void)setIsEditingText:(BOOL)a3;
- (void)setIsFormField:(BOOL)a3;
- (void)setIsTranslating:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalExifOrientation:(int64_t)a3;
- (void)setOriginalModelBaseScaleFactor:(double)a3;
- (void)setParentAnnotation:(id)a3;
- (void)setShouldObserveEdits:(BOOL)a3;
- (void)setShouldUseAppearanceOverride:(BOOL)a3;
- (void)setShouldUsePlaceholderText:(BOOL)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextIsClipped:(BOOL)a3;
- (void)setTextIsFixedHeight:(BOOL)a3;
- (void)setTextIsFixedWidth:(BOOL)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKAnnotation

- (AKAnnotation)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKAnnotation;
  v2 = [(AKAnnotation *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v4;

    v2->_shouldUsePlaceholderText = 1;
    v2->_editsDisableAppearanceOverride = 1;
    v2->_conformsToAKStrokedAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA90C98];
    v2->_conformsToAKFilledAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA90D18];
    v2->_conformsToAKRectangularAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA90068];
    v2->_conformsToAKFlippableAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA915D0];
    v2->_conformsToAKRotatableAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA900F0];
    v2->_conformsToAKTextAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA912B8];
    v2->_conformsToAKParentAnnotationProtocol = [(AKAnnotation *)v2 conformsToProtocol:&unk_26EA914B8];
  }
  return v2;
}

- (void)dealloc
{
  CGPDFDocumentRelease(self->_appearanceOverridePDF);
  if ([(AKAnnotation *)self shouldObserveEdits]) {
    [(AKAnnotation *)self setShouldObserveEdits:0];
  }
  if ([(AKAnnotation *)self shouldUseAppearanceOverride]) {
    [(AKAnnotation *)self setShouldUseAppearanceOverride:0];
  }
  [(AKAnnotation *)self setAppearanceOverride:0];
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotation;
  [(AKAnnotation *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [(AKAnnotation *)self dataRepresentation];
  if (v3)
  {
    uint64_t v4 = +[AKAnnotation annotationWithData:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  return (id)[MEMORY[0x263EFFA08] set];
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"rotationAngle"];
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"rotationAngle"])
  {
    uint64_t v4 = +[AKController akBundle];
    v5 = v4;
    v6 = @"Rotation";
LABEL_3:
    objc_super v7 = [v4 localizedStringForKey:v6 value:&stru_26EA57918 table:@"AnnotationStrings"];

    goto LABEL_12;
  }
  if (([v3 isEqualToString:@"isEdited"] & 1) != 0
    || ([v3 isEqualToString:@"shouldObserveEdits"] & 1) != 0
    || ([v3 isEqualToString:@"shouldUseAppearanceOverride"] & 1) != 0)
  {
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"childAnnotation"])
  {
    uint64_t v4 = +[AKController akBundle];
    v5 = v4;
    v6 = @"Note";
    goto LABEL_3;
  }
  if (([v3 isEqualToString:@"author"] & 1) != 0
    || ([v3 isEqualToString:@"modificationDate"] & 1) != 0)
  {
LABEL_11:
    objc_super v7 = &stru_26EA57918;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass (key: %@"), "+[AKAnnotation displayNameForUndoablePropertyChangeWithKey:]", v3;
    objc_super v7 = 0;
  }
LABEL_12:

  return v7;
}

+ (id)defaultPlaceholderText
{
  return 0;
}

+ (AKAnnotation)annotationWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    v5 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2376DA528();
    }
    goto LABEL_10;
  }
  if (![v3 length])
  {
    v5 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2376DA55C();
    }
    goto LABEL_10;
  }
  v5 = [objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
  if (!v5)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
  if (!v6)
  {
    objc_super v7 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_2376DA590();
    }

    v6 = 0;
  }
  [v5 finishDecoding];
LABEL_15:

  return (AKAnnotation *)v6;
}

- (id)dataRepresentation
{
  id v6 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:0 error:&v6];
  id v3 = v6;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2376DA6C8((uint64_t)v3, v4);
    }
LABEL_4:

    goto LABEL_6;
  }
  if (![v2 length])
  {
    uint64_t v4 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2376DA694();
    }
    goto LABEL_4;
  }
LABEL_6:

  return v2;
}

- (NSString)displayName
{
  return 0;
}

- (BOOL)shouldBurnIn
{
  return 0;
}

- (id)keysForValuesToObserveForUndo
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  [v3 addObject:@"isEdited"];
  [v3 addObject:@"shouldObserveEdits"];
  [v3 addObject:@"shouldUseAppearanceOverride"];
  [v3 addObject:@"author"];
  [v3 addObject:@"modificationDate"];
  if ([(AKAnnotation *)self conformsToAKRotatableAnnotationProtocol]) {
    [v3 addObject:@"rotationAngle"];
  }
  if ([(AKAnnotation *)self conformsToAKParentAnnotationProtocol]) {
    [v3 addObject:@"childAnnotation"];
  }

  return v3;
}

- (id)keysForValuesToObserveForRedrawing
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"drawingBounds", @"isEditingText", 0);
}

- (id)keysForValuesToObserveForAdornments
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"drawingBounds", @"isEditingText", 0);
}

- (void)setOriginalModelBaseScaleFactor:(double)a3
{
  self->_originalModelBaseScaleFactor = a3;
}

- (void)setOriginalExifOrientation:(int64_t)a3
{
  self->_originalExifOrientation = a3;
}

- (CGRect)hitTestBounds
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", "-[AKAnnotation hitTestBounds]");
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)drawingBounds
{
  +[AKAnnotationRenderer drawingBoundsOfAnnotation:self];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)integralDrawingBounds
{
  [(AKAnnotation *)self drawingBounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  if (!CGRectIsInfinite(v14))
  {
    +[AKGeometryHelper stableIntegralRectForRect:](AKGeometryHelper, "stableIntegralRectForRect:", x, y, width, height);
    double x = v6;
    double y = v7;
    double width = v8;
    double height = v9;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
}

- (void)translateBy:(CGPoint)a3
{
}

- (void)setShouldObserveEdits:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_isObservingForIsEdited == a3) {
    return;
  }
  self->_isObservingForIsEdited = a3;
  BOOL v4 = !self->_isReallyObservingForIsEdited || a3;
  BOOL v5 = !self->_isReallyObservingForIsEdited && a3;
  double v6 = [(AKAnnotation *)self keysForValuesToObserveForUndo];
  if (qword_268925328 == -1)
  {
    if (!v4)
    {
LABEL_10:
      self->_isReallyObservingForIsEdited = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            if (([(id)qword_268925320 containsObject:v12] & 1) == 0) {
              [(AKAnnotation *)self removeObserver:self forKeyPath:v12 context:@"AKAnnotation.annotationPropertyObservationForIsEditedContext"];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    dispatch_once(&qword_268925328, &unk_26EA57638);
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23769B830;
    block[3] = &unk_264CDB188;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldObserveEdits
{
  return self->_isObservingForIsEdited;
}

- (void)setAppearanceOverride:(id)a3
{
  id v4 = a3;
  id appearanceOverride = self->_appearanceOverride;
  if (v4)
  {
    double v6 = v4;
    uint64_t v11 = [v4 copy];

    id v7 = (void *)MEMORY[0x237E1E250](v11);
    id v8 = self->_appearanceOverride;
    self->_id appearanceOverride = v7;

    if (!appearanceOverride)
    {
      [(AKAnnotation *)self setShouldUseAppearanceOverride:1];
      [(AKAnnotation *)self drawingBounds];
      -[AKAnnotation setInitialDrawingBoundsForAppearanceOverride:](self, "setInitialDrawingBoundsForAppearanceOverride:");
    }
    uint64_t v9 = (void *)v11;
  }
  else
  {
    if (appearanceOverride) {
      [(AKAnnotation *)self setShouldUseAppearanceOverride:0];
    }
    id v10 = self->_appearanceOverride;
    self->_id appearanceOverride = 0;

    uint64_t v9 = 0;
  }
}

- (id)appearanceOverride
{
  double v2 = (void *)MEMORY[0x237E1E250](self->_appearanceOverride, a2);

  return v2;
}

- (BOOL)isUsingAppearanceOverride
{
  if (![(AKAnnotation *)self shouldUseAppearanceOverride]) {
    return 0;
  }
  double v3 = [(AKAnnotation *)self appearanceOverride];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setShouldUseAppearanceOverride:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_shouldUseAppearanceOverride == a3) {
    return;
  }
  self->_shouldUseAppearanceOverride = a3;
  BOOL v4 = !self->_isObservingForAppearance || a3;
  BOOL v5 = !self->_isObservingForAppearance && a3;
  double v6 = [(AKAnnotation *)self keysForValuesToObserveForUndo];
  if (qword_268925338 == -1)
  {
    if (!v4)
    {
LABEL_10:
      self->_isObservingForAppearance = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            if (([(id)qword_268925330 containsObject:v12] & 1) == 0) {
              [(AKAnnotation *)self removeObserver:self forKeyPath:v12 context:@"AKAnnotation.annotationPropertyObservationForAppearanceContext"];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    dispatch_once(&qword_268925338, &unk_26EA576F8);
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23769BD2C;
    block[3] = &unk_264CDB188;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldUseAppearanceOverride
{
  return self->_shouldUseAppearanceOverride;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = v12;
  if (a6 == @"AKAnnotation.annotationPropertyObservationForIsEditedContext")
  {
    id v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    id v15 = [v13 objectForKey:*MEMORY[0x263F081C8]];
    if (([v14 isEqual:v15] & 1) == 0)
    {
      if (![(AKAnnotation *)self isEdited]) {
        [(AKAnnotation *)self setIsEdited:1];
      }
      if ([(AKAnnotation *)self shouldObserveEdits]) {
        [(AKAnnotation *)self setShouldObserveEdits:0];
      }
    }
    goto LABEL_14;
  }
  if (a6 == @"AKAnnotation.annotationPropertyObservationForAppearanceContext")
  {
    if (![(AKAnnotation *)self editsDisableAppearanceOverride]) {
      goto LABEL_15;
    }
    sub_2376C9528();
    id v14 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    id v15 = [v13 objectForKey:*MEMORY[0x263F081C8]];
    int v16 = [v14 isEqual:v15];
    if ([v10 isEqualToString:@"rectangle"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [v15 akRectValue];
      double v18 = v17;
      double v20 = v19;
      [v14 akRectValue];
      BOOL v22 = v18 == v21;
      if (v20 != v23) {
        BOOL v22 = 0;
      }
      if ((v22 | v16)) {
        goto LABEL_14;
      }
    }
    else if (v16)
    {
LABEL_14:

      goto LABEL_15;
    }
    [(AKAnnotation *)self setShouldUseAppearanceOverride:0];
    goto LABEL_14;
  }
  v24.receiver = self;
  v24.super_class = (Class)AKAnnotation;
  [(AKAnnotation *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_15:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ((sub_2376C9528() & 1) == 0)
  {
    [(AKAnnotation *)self setAkSerializationVersion:2];
    [(AKAnnotation *)self setAkSerializationPlatform:2];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation akSerializationVersion](self, "akSerializationVersion"), @"akVers");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation akSerializationPlatform](self, "akSerializationPlatform"), @"akPlat");
  BOOL v5 = [(AKAnnotation *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  [(AKAnnotation *)self originalModelBaseScaleFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"originalModelBaseScaleFactor");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation originalExifOrientation](self, "originalExifOrientation"), @"originalExifOrientation");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsClipped](self, "textIsClipped"), @"textIsClipped");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsFixedWidth](self, "textIsFixedWidth"), @"textIsFixedWidth");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsFixedHeight](self, "textIsFixedHeight"), @"textIsFixedHeight");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation shouldUsePlaceholderText](self, "shouldUsePlaceholderText"), @"shouldUsePlaceholderText");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation formContentType](self, "formContentType"), @"formContentType");
  double v6 = [(AKAnnotation *)self customPlaceholderText];
  [v4 encodeObject:v6 forKey:@"customPlaceholderText"];

  id v7 = [(AKAnnotation *)self author];

  if (v7)
  {
    uint64_t v8 = [(AKAnnotation *)self author];
    [v4 encodeObject:v8 forKey:@"author"];
  }
  uint64_t v9 = [(AKAnnotation *)self modificationDate];

  if (v9)
  {
    id v10 = [(AKAnnotation *)self modificationDate];
    [v4 encodeObject:v10 forKey:@"modificationDate"];
  }
  id v11 = [(AKAnnotation *)self parentAnnotation];
  id v12 = v11;
  if (v11)
  {
    double v13 = [v11 UUID];
    [v4 encodeObject:v13 forKey:@"parentAnnotation.UUID"];
  }
  id v14 = [(AKAnnotation *)self childAnnotation];
  id v15 = v14;
  if (v14)
  {
    int v16 = [v14 UUID];
    [v4 encodeObject:v16 forKey:@"childAnnotation.UUID"];
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation editsDisableAppearanceOverride](self, "editsDisableAppearanceOverride"), @"editsDisableAppearanceOverride");
  if ([(AKAnnotation *)self isBeingCopied])
  {
    double v17 = [(AKAnnotation *)self appearanceOverride];
    if (v17 && [(AKAnnotation *)self shouldUseAppearanceOverride])
    {
      BOOL v18 = [(AKAnnotation *)self editsDisableAppearanceOverride];

      if (v18) {
        goto LABEL_20;
      }
      double v17 = [MEMORY[0x263EFF990] data];
      CGDataConsumerRef v19 = CGDataConsumerCreateWithCFData((CFMutableDataRef)v17);
      if (v19)
      {
        double v20 = v19;
        [(AKAnnotation *)self initialDrawingBoundsForAppearanceOverride];
        double v22 = v21;
        double v24 = v23;
        v30.origin.double x = 0.0;
        v30.origin.double y = 0.0;
        v30.size.double width = v25;
        v30.size.double height = v26;
        v27 = CGPDFContextCreate(v20, &v30, 0);
        if (v27)
        {
          v28 = v27;
          CGPDFContextBeginPage(v27, 0);
          CGContextTranslateCTM(v28, -v22, -v24);
          v29 = [(AKAnnotation *)self appearanceOverride];
          ((void (**)(void, CGContext *))v29)[2](v29, v28);

          CGPDFContextEndPage(v28);
          CGContextFlush(v28);
          CGPDFContextClose(v28);
          [v4 encodeObject:v17 forKey:@"appearanceOverridePDF"];
          CFRelease(v28);
        }
        CFRelease(v20);
      }
    }
  }
LABEL_20:
  if ([(AKAnnotation *)self conformsToAKRotatableAnnotationProtocol])
  {
    [(AKAnnotation *)self rotationAngle];
    objc_msgSend(v4, "encodeDouble:forKey:", @"rotationAngle");
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation isFormField](self, "isFormField"), @"AKIsFormFieldKey");
}

- (AKAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKAnnotation *)self init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"akVers"]) {
      uint64_t v6 = [v4 decodeIntegerForKey:@"akVers"];
    }
    else {
      uint64_t v6 = 0;
    }
    [(AKAnnotation *)v5 setAkSerializationVersion:v6];
    if ([v4 containsValueForKey:@"akPlat"]) {
      uint64_t v7 = [v4 decodeIntegerForKey:@"akPlat"];
    }
    else {
      uint64_t v7 = 0;
    }
    [(AKAnnotation *)v5 setAkSerializationPlatform:v7];
    if ([v4 containsValueForKey:@"UUID"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v8;
    }
    int v10 = [v4 containsValueForKey:@"originalModelBaseScaleFactor"];
    double v11 = 1.0;
    if (v10) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"originalModelBaseScaleFactor", 1.0);
    }
    [(AKAnnotation *)v5 setOriginalModelBaseScaleFactor:v11];
    if ([v4 containsValueForKey:@"originalExifOrientation"]) {
      uint64_t v12 = [v4 decodeIntegerForKey:@"originalExifOrientation"];
    }
    else {
      uint64_t v12 = 1;
    }
    [(AKAnnotation *)v5 setOriginalExifOrientation:v12];
    -[AKAnnotation setTextIsClipped:](v5, "setTextIsClipped:", [v4 decodeBoolForKey:@"textIsClipped"]);
    -[AKAnnotation setTextIsFixedWidth:](v5, "setTextIsFixedWidth:", [v4 decodeBoolForKey:@"textIsFixedWidth"]);
    -[AKAnnotation setTextIsFixedHeight:](v5, "setTextIsFixedHeight:", [v4 decodeBoolForKey:@"textIsFixedHeight"]);
    if ([v4 containsValueForKey:@"shouldUsePlaceholderText"]) {
      uint64_t v13 = [v4 decodeBoolForKey:@"shouldUsePlaceholderText"];
    }
    else {
      uint64_t v13 = 0;
    }
    [(AKAnnotation *)v5 setShouldUsePlaceholderText:v13];
    if ([v4 containsValueForKey:@"formContentType"]) {
      -[AKAnnotation setFormContentType:](v5, "setFormContentType:", (int)[v4 decodeIntForKey:@"formContentType"]);
    }
    if ([v4 containsValueForKey:@"customPlaceholderText"])
    {
      id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customPlaceholderText"];
      [(AKAnnotation *)v5 setCustomPlaceholderText:v14];
    }
    else
    {
      [(AKAnnotation *)v5 setCustomPlaceholderText:0];
    }
    if ([v4 containsValueForKey:@"author"])
    {
      id v15 = self;
      int v16 = [v4 decodeObjectOfClass:v15 forKey:@"author"];
      [(AKAnnotation *)v5 setAuthor:v16];
    }
    if ([v4 containsValueForKey:@"modificationDate"])
    {
      double v17 = self;
      BOOL v18 = [v4 decodeObjectOfClass:v17 forKey:@"modificationDate"];
      [(AKAnnotation *)v5 setModificationDate:v18];
    }
    if ([v4 containsValueForKey:@"parentAnnotation.UUID"])
    {
      CGDataConsumerRef v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentAnnotation.UUID"];
      objc_setAssociatedObject(v5, @"AKAnnotation.parentAnnotationUUIDAssociatedObjectKey", v19, (void *)0x301);
    }
    if ([v4 containsValueForKey:@"childAnnotation.UUID"])
    {
      double v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childAnnotation.UUID"];
      objc_setAssociatedObject(v5, @"AKAnnotation.childAnnotationUUIDAssociatedObjectKey", v20, (void *)0x301);
    }
    if ([v4 containsValueForKey:@"editsDisableAppearanceOverride"]) {
      -[AKAnnotation setEditsDisableAppearanceOverride:](v5, "setEditsDisableAppearanceOverride:", [v4 decodeBoolForKey:@"editsDisableAppearanceOverride"]);
    }
    if ([v4 containsValueForKey:@"appearanceOverridePDF"])
    {
      double v21 = self;
      CFDataRef v22 = [v4 decodeObjectOfClass:v21 forKey:@"appearanceOverridePDF"];

      if (v22)
      {
        double v23 = CGDataProviderCreateWithCFData(v22);
        if (v23)
        {
          double v24 = v23;
          CGFloat v25 = CGPDFDocumentCreateWithProvider(v23);
          v5->_appearanceOverridePDF = v25;
          if (v25)
          {
            CGPDFPageRef Page = CGPDFDocumentGetPage(v25, 1uLL);
            if (Page)
            {
              v27 = Page;
              objc_initWeak(&location, v5);
              uint64_t v29 = MEMORY[0x263EF8330];
              uint64_t v30 = 3221225472;
              v31 = sub_23769CA7C;
              v32 = &unk_264CDB9B8;
              objc_copyWeak(&v33, &location);
              [(AKAnnotation *)v5 setAppearanceOverride:&v29];
              CGRect BoxRect = CGPDFPageGetBoxRect(v27, kCGPDFMediaBox);
              -[AKAnnotation setInitialDrawingBoundsForAppearanceOverride:](v5, "setInitialDrawingBoundsForAppearanceOverride:", BoxRect.origin.x, BoxRect.origin.y, BoxRect.size.width, BoxRect.size.height, v29, v30, v31, v32);
              objc_destroyWeak(&v33);
              objc_destroyWeak(&location);
            }
          }
          CFRelease(v24);
        }
      }
    }
    if ([v4 containsValueForKey:@"rotationAngle"]
      && [(AKAnnotation *)v5 conformsToAKRotatableAnnotationProtocol])
    {
      [v4 decodeDoubleForKey:@"rotationAngle"];
      -[AKAnnotation setRotationAngle:](v5, "setRotationAngle:");
    }
    if ([v4 containsValueForKey:@"AKIsFormFieldKey"]) {
      -[AKAnnotation setIsFormField:](v5, "setIsFormField:", [v4 decodeBoolForKey:@"AKIsFormFieldKey"]);
    }
  }

  return v5;
}

- (BOOL)conformsToAKStrokedAnnotationProtocol
{
  return self->_conformsToAKStrokedAnnotationProtocol;
}

- (BOOL)conformsToAKFilledAnnotationProtocol
{
  return self->_conformsToAKFilledAnnotationProtocol;
}

- (BOOL)conformsToAKRectangularAnnotationProtocol
{
  return self->_conformsToAKRectangularAnnotationProtocol;
}

- (BOOL)conformsToAKFlippableAnnotationProtocol
{
  return self->_conformsToAKFlippableAnnotationProtocol;
}

- (BOOL)conformsToAKRotatableAnnotationProtocol
{
  return self->_conformsToAKRotatableAnnotationProtocol;
}

- (BOOL)conformsToAKTextAnnotationProtocol
{
  return self->_conformsToAKTextAnnotationProtocol;
}

- (BOOL)conformsToAKParentAnnotationProtocol
{
  return self->_conformsToAKParentAnnotationProtocol;
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)customPlaceholderText
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCustomPlaceholderText:(id)a3
{
}

- (double)originalModelBaseScaleFactor
{
  return self->_originalModelBaseScaleFactor;
}

- (int64_t)originalExifOrientation
{
  return self->_originalExifOrientation;
}

- (BOOL)editsDisableAppearanceOverride
{
  return self->_editsDisableAppearanceOverride;
}

- (void)setEditsDisableAppearanceOverride:(BOOL)a3
{
  self->_editsDisableAppearanceOverride = a3;
}

- (BOOL)isEdited
{
  return self->_isEdited;
}

- (void)setIsEdited:(BOOL)a3
{
  self->_isEdited = a3;
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthor:(id)a3
{
}

- (BOOL)isTranslating
{
  return self->_isTranslating;
}

- (void)setIsTranslating:(BOOL)a3
{
  self->_isTranslating = a3;
}

- (BOOL)isDraggingHandle
{
  return self->_isDraggingHandle;
}

- (void)setIsDraggingHandle:(BOOL)a3
{
  self->_isDraggingHandle = a3;
}

- (BOOL)isFormField
{
  return self->_isFormField;
}

- (void)setIsFormField:(BOOL)a3
{
  self->_isFormField = a3;
}

- (int64_t)akSerializationVersion
{
  return self->_akSerializationVersion;
}

- (void)setAkSerializationVersion:(int64_t)a3
{
  self->_akSerializationVersion = a3;
}

- (int64_t)akSerializationPlatform
{
  return self->_akSerializationPlatform;
}

- (void)setAkSerializationPlatform:(int64_t)a3
{
  self->_akSerializationPlatform = a3;
}

- (BOOL)isEditingText
{
  return self->_isEditingText;
}

- (void)setIsEditingText:(BOOL)a3
{
  self->_isEditingText = a3;
}

- (BOOL)textIsClipped
{
  return self->_textIsClipped;
}

- (void)setTextIsClipped:(BOOL)a3
{
  self->_textIsClipped = a3;
}

- (BOOL)editingDisabled
{
  return self->_editingDisabled;
}

- (void)setEditingDisabled:(BOOL)a3
{
  self->_editingDisabled = a3;
}

- (AKAnnotation)parentAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnnotation);

  return (AKAnnotation *)WeakRetained;
}

- (void)setParentAnnotation:(id)a3
{
}

- (AKAnnotation)childAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childAnnotation);

  return (AKAnnotation *)WeakRetained;
}

- (void)setChildAnnotation:(id)a3
{
}

- (CGRect)initialDrawingBoundsForAppearanceOverride
{
  objc_copyStruct(v6, &self->_initialDrawingBoundsForAppearanceOverride, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setInitialDrawingBoundsForAppearanceOverride:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_initialDrawingBoundsForAppearanceOverride, &v3, 32, 1, 0);
}

- (BOOL)isBeingCopied
{
  return self->_isBeingCopied;
}

- (void)setIsBeingCopied:(BOOL)a3
{
  self->_isBeingCopied = a3;
}

- (BOOL)textIsFixedWidth
{
  return self->_textIsFixedWidth;
}

- (void)setTextIsFixedWidth:(BOOL)a3
{
  self->_textIsFixedWidth = a3;
}

- (BOOL)textIsFixedHeight
{
  return self->_textIsFixedHeight;
}

- (void)setTextIsFixedHeight:(BOOL)a3
{
  self->_textIsFixedHeight = a3;
}

- (BOOL)shouldUsePlaceholderText
{
  return self->_shouldUsePlaceholderText;
}

- (void)setShouldUsePlaceholderText:(BOOL)a3
{
  self->_shouldUsePlaceholderText = a3;
}

- (unint64_t)formContentType
{
  return self->_formContentType;
}

- (void)setFormContentType:(unint64_t)a3
{
  self->_formContentType = a3;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_childAnnotation);
  objc_destroyWeak((id *)&self->_parentAnnotation);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_customPlaceholderText, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong(&self->_appearanceOverride, 0);
}

@end