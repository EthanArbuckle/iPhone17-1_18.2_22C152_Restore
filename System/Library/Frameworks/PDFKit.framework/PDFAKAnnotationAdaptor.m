@interface PDFAKAnnotationAdaptor
+ (Class)_akAnnotationSubclassForWidgetFieldType:(id)a3;
+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5;
+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5 updatePDFAnnotationIfNeeded:(BOOL)a6;
+ (id)_akAnnotationInstanceForPDFAnnotationSubtype:(id)a3 withOptionalWidgetFieldType:(id)a4;
+ (id)_pdfAnnotationInstanceForAKAnnotation:(id)a3;
+ (id)getPDFAnnotationAssociatedWith:(id)a3;
+ (id)newPDFAnnotationFromAKAnnotation:(id)a3;
+ (void)associatePDFAnnotation:(id)a3 withAKAnnotation:(id)a4;
- (AKAnnotation)akAnnotation;
- (PDFAKAnnotationAdaptor)initWithPDFAnnotation:(id)a3 andAKAnnotation:(id)a4;
- (PDFAnnotation)pdfAnnotation;
- (id)_colorFromColorOrArray:(id)a3;
- (void)_startObservingAnnotation;
- (void)_stopObservingAnnotation;
- (void)_syncAnnotationTextForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:(BOOL)a3;
- (void)_syncArrowHeadStyleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncAuthorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncBorder:(id)a3;
- (void)_syncBorderStyle:(id)a3;
- (void)_syncBoundingRectangleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncChildAnnotationForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncColor:(id)a3;
- (void)_syncColorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncContents:(id)a3;
- (void)_syncContentsForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncCornerRadiusForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncDashedForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncDate:(id)a3;
- (void)_syncDefaultAppearance:(id)a3;
- (void)_syncEndPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncEverythingToAKAnnotation;
- (void)_syncEverythingToPDFAnnotation;
- (void)_syncInteriorColor:(id)a3;
- (void)_syncLineEndingStyles:(id)a3;
- (void)_syncLinePoints:(id)a3;
- (void)_syncModificationDateForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncPage:(id)a3;
- (void)_syncParent:(id)a3;
- (void)_syncPopup:(id)a3;
- (void)_syncQuadding:(int64_t)a3;
- (void)_syncRect:(CGRect)a3;
- (void)_syncStartPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncStrokeWidthForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5;
- (void)_syncSubtype:(id)a3;
- (void)_syncTextLabel:(id)a3;
- (void)_syncWidgetFieldType:(id)a3;
- (void)_teardown;
- (void)_updateDashedPatternForStrokeWidth:(double)a3 isDashed:(BOOL)a4;
- (void)dealloc;
- (void)didRemoveValueForAnnotationKey:(id)a3;
- (void)didReplaceAllValuesWithNewDictionary:(id)a3 andOldDictionary:(id)a4;
- (void)didSetValue:(id)a3 forAnnotationKey:(id)a4;
- (void)invalidateAppearanceStream;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)teardown;
@end

@implementation PDFAKAnnotationAdaptor

+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5
{
  return +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:a3 andCGPDFAnnotation:a4 andPDFDictionary:a5 updatePDFAnnotationIfNeeded:1];
}

+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5 updatePDFAnnotationIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = [v10 valueForAnnotationKey:@"/Subtype"];
  BOOL v12 = 0;
  if (!a4
    || !a5
    || (+[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:a4 andDictionary:a5], v13 = objc_claimAutoreleasedReturnValue(), BOOL v12 = v13 != 0, !v13))
  {
    if (![v11 length])
    {
      v13 = 0;
LABEL_14:
      v15 = 0;
      goto LABEL_15;
    }
    if ([v11 isEqualToString:@"/Widget"])
    {
      v14 = [v10 valueForAnnotationKey:@"/FT"];
      if ([v14 length])
      {
        v13 = [a1 _akAnnotationInstanceForPDFAnnotationSubtype:v11 withOptionalWidgetFieldType:v14];
      }
      else
      {
        v13 = 0;
      }

      if (!v13) {
        goto LABEL_14;
      }
    }
    else
    {
      v13 = [a1 _akAnnotationInstanceForPDFAnnotationSubtype:v11 withOptionalWidgetFieldType:0];
      if (!v13) {
        goto LABEL_14;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  v17 = (void *)[objc_alloc((Class)a1) initWithPDFAnnotation:v10 andAKAnnotation:v13];
  v15 = v17;
  if (v12)
  {
    [v17 _syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:0];
    if (v6) {
      [v15 _syncEverythingToPDFAnnotation];
    }
  }
  else
  {
    [v17 _syncEverythingToAKAnnotation];
  }
LABEL_15:

  return (PDFAKAnnotationAdaptor *)v15;
}

+ (id)newPDFAnnotationFromAKAnnotation:(id)a3
{
  id v5 = a3;
  if (GetDefaultsWriteAKEnabled())
  {
    BOOL v6 = [a1 _pdfAnnotationInstanceForAKAnnotation:v5];
    v7 = [MEMORY[0x263EFF9D0] null];

    if (v6 == v7)
    {
      id v9 = 0;
    }
    else
    {
      [v6 setupAKAnnotationAdaptorIfNecessary];
      v8 = [v6 akAnnotationAdaptor];
      [v8 _stopObservingAnnotation];
      objc_storeStrong((id *)(v8[1] + 24), a3);
      [v8 _syncEverythingToPDFAnnotation];
      [v8 _startObservingAnnotation];
      id v9 = v6;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (PDFAKAnnotationAdaptor)initWithPDFAnnotation:(id)a3 andAKAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFAKAnnotationAdaptor;
  v8 = [(PDFAKAnnotationAdaptor *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = v8->_private;
    v8->_private = (PDFAKAnnotationAdaptorPrivate *)v9;

    objc_storeWeak((id *)&v8->_private->pdfAnnotation, v6);
    objc_storeStrong((id *)&v8->_private->akAnnotation, a4);
    if (v7)
    {
      [(id)objc_opt_class() associatePDFAnnotation:v6 withAKAnnotation:v7];
      [(PDFAKAnnotationAdaptor *)v8 _startObservingAnnotation];
    }
  }

  return v8;
}

- (void)dealloc
{
  if (!self->_private->isTornDown)
  {
    if ([MEMORY[0x263F08B88] isMainThread]) {
      [(PDFAKAnnotationAdaptor *)self _teardown];
    }
    else {
      NSLog(&cfstr_SCalledFromABa.isa, "-[PDFAKAnnotationAdaptor dealloc]");
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKAnnotationAdaptor;
  [(PDFAKAnnotationAdaptor *)&v3 dealloc];
}

- (void)teardown
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFAKAnnotationAdaptor *)self _teardown];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__PDFAKAnnotationAdaptor_teardown__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __34__PDFAKAnnotationAdaptor_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardown];
}

- (void)_teardown
{
  v2 = self->_private;
  if (v2 && !v2->isTornDown)
  {
    v2->isTornDown = 1;
    [(PDFAKAnnotationAdaptor *)self _stopObservingAnnotation];
    v4 = self->_private;
    akAnnotation = v4->akAnnotation;
    v4->akAnnotation = 0;

    p_pdfAnnotation = &self->_private->pdfAnnotation;
    objc_storeWeak((id *)p_pdfAnnotation, 0);
  }
}

- (PDFAnnotation)pdfAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);

  return (PDFAnnotation *)WeakRetained;
}

- (AKAnnotation)akAnnotation
{
  return self->_private->akAnnotation;
}

+ (id)getPDFAnnotationAssociatedWith:(id)a3
{
  objc_super v3 = objc_getAssociatedObject(a3, @"PDFAnnotationAssociatedObjectKey");
  v4 = [v3 weakObjectValue];

  return v4;
}

+ (void)associatePDFAnnotation:(id)a3 withAKAnnotation:(id)a4
{
  id v5 = (void *)MEMORY[0x263F08D40];
  id v6 = a4;
  id v7 = [v5 valueWithWeakObject:a3];
  objc_setAssociatedObject(v6, @"PDFAnnotationAssociatedObjectKey", v7, (void *)0x301);
}

- (void)didSetValue:(id)a3 forAnnotationKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v6;
  v8 = self->_private;
  if (!v8->isSyncingFromAKAnnotation)
  {
    BOOL isSyncingFromPDFAnnotation = v8->isSyncingFromPDFAnnotation;
    v8->BOOL isSyncingFromPDFAnnotation = 1;
    if ([v6 isEqualToString:@"/Subtype"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncSubtype:v12];
    }
    else if ([v7 isEqualToString:@"/Rect"])
    {
      [v12 PDFKitPDFRectValue];
      -[PDFAKAnnotationAdaptor _syncRect:](self, "_syncRect:");
    }
    else if ([v7 isEqualToString:@"/L"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncLinePoints:v12];
    }
    else if ([v7 isEqualToString:@"/C"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncColor:v12];
    }
    else if ([v7 isEqualToString:@"/IC"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncInteriorColor:v12];
    }
    else if ([v7 isEqualToString:@"/Contents"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncContents:v12];
    }
    else if ([v7 isEqualToString:@"/T"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncTextLabel:v12];
    }
    else if ([v7 isEqualToString:@"/Border"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncBorder:v12];
    }
    else if ([v7 isEqualToString:@"/BS"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncBorderStyle:v12];
    }
    else if ([v7 isEqualToString:@"/LE"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncLineEndingStyles:v12];
    }
    else if ([v7 isEqualToString:@"/Q"])
    {
      uint64_t v10 = [v12 integerValue];
      if (v10 == 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2 * (v10 == 2);
      }
      [(PDFAKAnnotationAdaptor *)self _syncQuadding:v11];
    }
    else if ([v7 isEqualToString:@"/InkList"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncInklist:v12];
    }
    else if ([v7 isEqualToString:@"/Name"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncIconName:v12];
    }
    else if ([v7 isEqualToString:@"/H"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncHighlightingMode:v12];
    }
    else if ([v7 isEqualToString:@"/AP"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:0];
    }
    else if ([v7 isEqualToString:@"/AS"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncAppearanceState:v12];
    }
    else if ([v7 isEqualToString:@"/DA"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncDefaultAppearance:v12];
    }
    else if ([v7 isEqualToString:@"/F"])
    {
      -[PDFAKAnnotationAdaptor _syncFlags:](self, "_syncFlags:", [v12 unsignedLongValue]);
    }
    else if ([v7 isEqualToString:@"/M"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncDate:v12];
    }
    else if ([v7 isEqualToString:@"/NM"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncName:v12];
    }
    else if ([v7 isEqualToString:@"/P"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncPage:v12];
    }
    else if ([v7 isEqualToString:@"/A"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncAction:v12];
    }
    else if ([v7 isEqualToString:@"/AA"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncAdditionalAction:v12];
    }
    else if ([v7 isEqualToString:@"/Dest"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncDestination:v12];
    }
    else if ([v7 isEqualToString:@"/Open"])
    {
      -[PDFAKAnnotationAdaptor _syncOpen:](self, "_syncOpen:", [v12 BOOLValue]);
    }
    else if ([v7 isEqualToString:@"/Parent"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncParent:v12];
    }
    else if ([v7 isEqualToString:@"/Popup"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncPopup:v12];
    }
    else if ([v7 isEqualToString:@"/DV"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetDefaultValue:v12];
    }
    else if ([v7 isEqualToString:@"/Ff"])
    {
      -[PDFAKAnnotationAdaptor _syncWidgetFieldFlags:](self, "_syncWidgetFieldFlags:", [v12 unsignedLongValue]);
    }
    else if ([v7 isEqualToString:@"/FT"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetFieldType:v12];
    }
    else if ([v7 isEqualToString:@"/MK"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetAppearance:v12];
    }
    else if ([v7 isEqualToString:@"/MaxLen"])
    {
      -[PDFAKAnnotationAdaptor _syncWidgetMaxLen:](self, "_syncWidgetMaxLen:", [v12 unsignedLongValue]);
    }
    else if ([v7 isEqualToString:@"/Opt"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetOptions:v12];
    }
    else if ([v7 isEqualToString:@"/TU"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetTextLabelUI:v12];
    }
    else if ([v7 isEqualToString:@"/V"])
    {
      [(PDFAKAnnotationAdaptor *)self _syncWidgetValue:v12];
    }
    self->_private->BOOL isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
  }
}

- (void)didRemoveValueForAnnotationKey:(id)a3
{
  objc_super v3 = self->_private;
  if (!v3->isSyncingFromAKAnnotation)
  {
    BOOL isSyncingFromPDFAnnotation = v3->isSyncingFromPDFAnnotation;
    v3->BOOL isSyncingFromPDFAnnotation = 1;
    [(PDFAKAnnotationAdaptor *)self didSetValue:0 forAnnotationKey:a3];
    self->_private->BOOL isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
  }
}

- (void)didReplaceAllValuesWithNewDictionary:(id)a3 andOldDictionary:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = self->_private;
  if (!v7->isSyncingFromAKAnnotation)
  {
    BOOL isSyncingFromPDFAnnotation = v7->isSyncingFromPDFAnnotation;
    v7->BOOL isSyncingFromPDFAnnotation = 1;
    uint64_t v9 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v10 = [a4 allKeys];
    uint64_t v11 = [v9 setWithArray:v10];

    id v12 = (void *)MEMORY[0x263EFF9C0];
    v13 = [v6 allKeys];
    v14 = [v12 setWithArray:v13];
    [v11 minusSet:v14];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          [(PDFAKAnnotationAdaptor *)self didSetValue:0 forAnnotationKey:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v17);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v20 = objc_msgSend(v6, "allKeys", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v26 = [v6 objectForKey:v25];
          [(PDFAKAnnotationAdaptor *)self didSetValue:v26 forAnnotationKey:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v22);
    }

    [(PDFAKAnnotationAdaptor *)self _syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:1];
    self->_private->BOOL isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
  }
}

- (void)invalidateAppearanceStream
{
  v2 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  if (v2)
  {
    id v4 = v2;
    [v2 setDictionaryRef:0];
    objc_super v3 = [v4 page];
    [v3 changedAnnotation:v4];

    v2 = v4;
  }
}

- (void)_syncSubtype:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"/Widget"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    id v6 = [WeakRetained valueForAnnotationKey:@"/FT"];

    if (!v6 || ![v6 length])
    {
      id v7 = 0;
      goto LABEL_11;
    }
    id v7 = [(id)objc_opt_class() _akAnnotationInstanceForPDFAnnotationSubtype:v4 withOptionalWidgetFieldType:v6];
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() _akAnnotationInstanceForPDFAnnotationSubtype:v4 withOptionalWidgetFieldType:0];
    id v6 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
  v8 = [MEMORY[0x263EFF9D0] null];

  uint64_t v9 = self->_private;
  if (v7 == v8)
  {
    id v10 = objc_loadWeakRetained((id *)&v9->pdfAnnotation);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PDFAKAnnotationAdaptor__syncSubtype___block_invoke;
    block[3] = &unk_264203940;
    id v13 = v10;
    id v11 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    objc_storeStrong((id *)&v9->akAnnotation, v7);
    [(PDFAKAnnotationAdaptor *)self _startObservingAnnotation];
  }
LABEL_11:
}

uint64_t __39__PDFAKAnnotationAdaptor__syncSubtype___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAKAnnotationAdaptor];
}

- (void)_syncWidgetFieldType:(id)a3
{
  uint64_t isKindOfClass = (uint64_t)a3;
  uint64_t v5 = isKindOfClass;
  if (isKindOfClass)
  {
    uint64_t v14 = isKindOfClass;
    uint64_t isKindOfClass = [(id)isKindOfClass length];
    uint64_t v5 = v14;
    if (isKindOfClass)
    {
      id v6 = self->_private;
      if (v6->akAnnotation)
      {
        uint64_t v7 = [(id)objc_opt_class() _akAnnotationSubclassForWidgetFieldType:v14];
        id v6 = self->_private;
        if (v7)
        {
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          uint64_t v5 = v14;
          if (isKindOfClass) {
            goto LABEL_13;
          }
          id v6 = self->_private;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&v6->pdfAnnotation);
      uint64_t v9 = [WeakRetained valueForAnnotationKey:@"/Subtype"];

      if ([v9 isEqualToString:@"/Widget"])
      {
        id v10 = [(id)objc_opt_class() _akAnnotationInstanceForPDFAnnotationSubtype:v9 withOptionalWidgetFieldType:v14];
        if (v10)
        {
          id v11 = self->_private;
          akAnnotation = v11->akAnnotation;
          v11->akAnnotation = v10;
          id v13 = v10;

          [(PDFAKAnnotationAdaptor *)self _startObservingAnnotation];
        }
      }
      else if (v9)
      {
        NSLog(&cfstr_SSettingWidget.isa, "-[PDFAKAnnotationAdaptor _syncWidgetFieldType:]", v14, v9);
      }

      uint64_t v5 = v14;
    }
  }
LABEL_13:

  MEMORY[0x270F9A758](isKindOfClass, v5);
}

- (void)_syncEverythingToAKAnnotation
{
  objc_super v3 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v4 = [v3 annotationKeyValues];
  uint64_t v5 = (void *)[v4 mutableCopy];
  id v6 = [v3 valueForAnnotationKey:@"/Subtype"];
  uint64_t v7 = (CGPDFDictionary *)[v3 sourceDictionary];
  CGPDFDictionaryRef value = 0;
  [v5 removeObjectForKey:@"/Subtype"];
  [v5 removeObjectForKey:@"/AP"];
  [v5 removeObjectForKey:@"/P"];
  BOOL Dictionary = CGPDFDictionaryGetDictionary(v7, "AAPL:AKExtras", &value);
  if (([v6 isEqualToString:@"/FreeText"] & 1) == 0
    && ([v6 isEqualToString:@"/Text"] & 1) == 0
    && ((Dictionary | [v6 isEqualToString:@"/Popup"]) & 1) == 0)
  {
    [v5 removeObjectForKey:@"/Contents"];
  }
  [(PDFAKAnnotationAdaptor *)self didReplaceAllValuesWithNewDictionary:v5 andOldDictionary:MEMORY[0x263EFFA78]];
  uint64_t v9 = [v4 objectForKey:@"/P"];
  if (v9) {
    [(PDFAKAnnotationAdaptor *)self didSetValue:v9 forAnnotationKey:@"/P"];
  }
}

- (void)_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v6 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  uint64_t v7 = self->_private;
  BOOL isSyncingFromPDFAnnotation = v7->isSyncingFromPDFAnnotation;
  v7->BOOL isSyncingFromPDFAnnotation = 1;
  if ([v5 appearance:0])
  {
    uint64_t v9 = [v5 page];
    if (!v9)
    {
      NSLog(&cfstr_CouldNotSyncAp.isa);
      goto LABEL_12;
    }
    id v10 = v9;
    id v11 = [v9 akPageAdaptor];
    [v11 initializeExifAndScaleOnAnnotation:v6];

    objc_initWeak(&location, v5);
    objc_initWeak(&from, v6);
    [v5 bounds];
    id v13 = v12;
    id v15 = v14;
    uint64_t v17 = v16;
    v19 = v18;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __90__PDFAKAnnotationAdaptor__syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride___block_invoke;
    long long v27 = &unk_264204290;
    objc_copyWeak(&v28, &location);
    v29[1] = v13;
    v29[2] = v15;
    v29[3] = v17;
    v29[4] = v19;
    objc_copyWeak(v29, &from);
    [v6 setAppearanceOverride:&v24];
    if (v3)
    {
      v20 = objc_msgSend(v5, "valueForAnnotationKey:", @"/Subtype", v24, v25, v26, v27);
      if (([v20 isEqualToString:@"/Stamp"] & 1) != 0
        || ([v20 isEqualToString:@"/Ink"] & 1) != 0)
      {
        uint64_t v21 = 0;
      }
      else if ([v20 isEqualToString:@"/Widget"])
      {
        uint64_t v22 = [v5 valueForAnnotationKey:@"/FT"];
        int v23 = [v22 isEqualToString:@"/Sig"];

        uint64_t v21 = v23 ^ 1u;
      }
      else
      {
        uint64_t v21 = 1;
      }
      [v6 setEditsDisableAppearanceOverride:v21];
    }
    objc_destroyWeak(v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    [v6 setAppearanceOverride:0];
  }
  self->_private->BOOL isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
LABEL_12:
}

void __90__PDFAKAnnotationAdaptor__syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride___block_invoke(uint64_t a1, CGContext *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained appearance:0];
    if (v6)
    {
      uint64_t v7 = v6;
      CGContextSaveGState(a2);
      BOOL v8 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
      uint64_t v9 = [v5 page];
      [v9 boundsForBox:0];
      CGFloat v11 = v10;
      CGFloat v13 = v12;

      if (v11 != *MEMORY[0x263F00148] || v13 != *(double *)(MEMORY[0x263F00148] + 8))
      {
        CGAffineTransformMakeTranslation(&v17, v11, v13);
        CGContextConcatCTM(a2, &v17);
      }
      objc_msgSend(v5, "drawAppearance:withBox:inContext:inRect:scaleProportional:", v7, 0, a2, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:v8];
      CGContextRestoreGState(a2);
    }
    else
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v16 = v15;
      if (v15) {
        [v15 setAppearanceOverride:0];
      }
    }
  }
}

- (void)_syncBorder:(id)a3
{
  id v26 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  uint64_t v5 = [v4 valueForAnnotationKey:@"/BS"];

  if (!v5)
  {
    uint64_t v6 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    if (!v26)
    {
      if (objc_opt_respondsToSelector()) {
        [v6 setStrokeWidth:1.0];
      }
      if (objc_opt_respondsToSelector()) {
        [v6 setCornerRadius:0.0];
      }
      if (objc_opt_respondsToSelector()) {
        [v6 setDashed:0];
      }
      goto LABEL_37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v26;
      if (objc_opt_respondsToSelector())
      {
        [v7 lineWidth];
        objc_msgSend(v6, "setStrokeWidth:");
      }
      if (objc_opt_respondsToSelector())
      {
        [v7 horizontalCornerRadius];
        double v9 = v8;
        [v7 verticalCornerRadius];
        if (v9 >= v10) {
          double v10 = v9;
        }
        [v6 setCornerRadius:v10];
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_36;
      }
      if ([v7 style] == 1)
      {
        BOOL v11 = 1;
      }
      else
      {
        int v23 = [v7 dashPattern];
        BOOL v11 = (unint64_t)[v23 count] > 1;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(&cfstr_SUnexpectedBor.isa, "-[PDFAKAnnotationAdaptor _syncBorder:]", v26);
LABEL_37:

        goto LABEL_38;
      }
      id v7 = v26;
      unint64_t v12 = [v7 count];
      if (v12 < 3)
      {
        BOOL v11 = 0;
        double v19 = 0.0;
        double v22 = 1.0;
        double v16 = 0.0;
      }
      else
      {
        unint64_t v13 = v12;
        uint64_t v14 = [v7 objectAtIndex:0];
        [v14 doubleValue];
        double v16 = v15;

        CGAffineTransform v17 = [v7 objectAtIndex:1];
        [v17 doubleValue];
        double v19 = v18;

        v20 = [v7 objectAtIndex:2];
        [v20 doubleValue];
        double v22 = v21;

        if (v13 == 3)
        {
          BOOL v11 = 0;
        }
        else
        {
          uint64_t v24 = [v7 objectAtIndex:3];
          BOOL v11 = v24 != 0;
        }
      }
      if (objc_opt_respondsToSelector()) {
        [v6 setStrokeWidth:v22];
      }
      if (objc_opt_respondsToSelector())
      {
        if (v16 >= v19) {
          double v25 = v16;
        }
        else {
          double v25 = v19;
        }
        [v6 setCornerRadius:v25];
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    [v6 setDashed:v11];
    goto LABEL_36;
  }
LABEL_38:
}

- (void)_syncBorderStyle:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    uint64_t v5 = [v8 objectForKey:@"/W"];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v5 doubleValue];
      objc_msgSend(v4, "setStrokeWidth:");
    }
    uint64_t v6 = [v8 objectForKey:@"/S"];

    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v4, "setDashed:", objc_msgSend(v6, "isEqualToString:", @"/D"));
    }
    if (objc_opt_respondsToSelector()) {
      [v4 setCornerRadius:0.0];
    }
  }
  else
  {
    id v7 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    id v4 = [v7 valueForAnnotationKey:@"/Border"];

    [(PDFAKAnnotationAdaptor *)self _syncBorder:v4];
  }
}

- (void)_syncColor:(id)a3
{
  id v9 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  uint64_t v5 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  uint64_t v6 = [v4 valueForAnnotationKey:@"/Subtype"];
  int v7 = [v6 isEqualToString:@"/FreeText"];

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_7;
    }
    id v8 = [(PDFAKAnnotationAdaptor *)self _colorFromColorOrArray:v9];
    [v5 setFillColor:v8];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_7;
    }
    id v8 = [(PDFAKAnnotationAdaptor *)self _colorFromColorOrArray:v9];
    [v5 setStrokeColor:v8];
  }

LABEL_7:
}

- (void)_syncInteriorColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(PDFAKAnnotationAdaptor *)self _colorFromColorOrArray:v6];
    [v4 setFillColor:v5];
  }
}

- (void)_syncContents:(id)a3
{
  id v8 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  if ([v4 conformsToProtocol:&unk_26C57C8E8])
  {
    id v5 = v4;
    if (v8)
    {
      id v6 = [v5 typingAttributes];
      int v7 = (void *)[objc_alloc(MEMORY[0x263F82390]) initWithString:v8 attributes:v6];
      [v5 setAnnotationText:v7];
    }
    else
    {
      [v5 setAnnotationText:0];
    }
  }
}

- (void)_syncDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  [v5 setModificationDate:v4];
}

- (void)_syncPage:(id)a3
{
  if (a3)
  {
    id v6 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    id v4 = [v6 appearanceOverride];

    if (!v4)
    {
      id v5 = [MEMORY[0x263EFF9D0] null];
      [(PDFAKAnnotationAdaptor *)self didSetValue:v5 forAnnotationKey:@"/AP"];
    }
  }
}

- (void)_syncRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "setRectangle:", x, y, width, height);
  }
}

- (void)_syncDefaultAppearance:(id)a3
{
  id v19 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  if ([v4 conformsToProtocol:&unk_26C57C8E8])
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    uint64_t v7 = [WeakRetained getFontFromAppearanceNSString:v19];
    uint64_t v8 = [WeakRetained getColorFromAppearanceNSString:v19];
    if (v7 | v8)
    {
      id v9 = [v5 annotationText];
      double v10 = [v5 typingAttributes];
      BOOL v11 = (void *)[v9 mutableCopy];
      double v18 = v10;
      unint64_t v12 = (void *)[v10 mutableCopy];
      uint64_t v13 = [v9 length];
      if (v7)
      {
        uint64_t v14 = *MEMORY[0x263F82270];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F82270], v7, 0, v13);
        [v12 setObject:v7 forKey:v14];
      }
      if (v8)
      {
        uint64_t v15 = *MEMORY[0x263F82278];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F82278], v8, 0, v13);
        [v12 setObject:v8 forKey:v15];
      }
      double v16 = (void *)[objc_alloc(MEMORY[0x263F82390]) initWithAttributedString:v11];
      [v5 setAnnotationText:v16];

      CGAffineTransform v17 = (void *)[v12 copy];
      [v5 setTypingAttributes:v17];
    }
  }
}

- (void)_syncQuadding:(int64_t)a3
{
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  if (![v4 conformsToProtocol:&unk_26C57C8E8]) {
    goto LABEL_21;
  }
  id v5 = v4;
  id v6 = [v5 annotationText];
  uint64_t v7 = v6;
  if (!v6)
  {
    int v11 = 0;
    uint64_t v9 = *MEMORY[0x263F822A8];
    goto LABEL_8;
  }
  uint64_t v8 = [v6 length];
  uint64_t v9 = *MEMORY[0x263F822A8];
  if (!v8)
  {
    int v11 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [v7 attribute:*MEMORY[0x263F822A8] atIndex:0 effectiveRange:0];
  int v11 = 1;
  if (!v10)
  {
LABEL_8:
    uint64_t v14 = [v5 typingAttributes];
    unint64_t v12 = [v14 objectForKey:v9];

    if (!v12)
    {
      unint64_t v12 = [MEMORY[0x263F82370] defaultParagraphStyle];
    }
    char v13 = 1;
    goto LABEL_11;
  }
  unint64_t v12 = (void *)v10;
  char v13 = 0;
LABEL_11:
  if ([v12 alignment] != a3)
  {
    char v24 = v13;
    int v25 = v11;
    id v28 = v7;
    long long v27 = [v5 typingAttributes];
    uint64_t v15 = (void *)[v27 mutableCopy];
    double v16 = [v5 typingAttributes];
    CGAffineTransform v17 = [v16 objectForKey:v9];
    double v18 = (void *)[v17 mutableCopy];

    if (!v18)
    {
      id v19 = [MEMORY[0x263F82370] defaultParagraphStyle];
      double v18 = (void *)[v19 mutableCopy];
    }
    [v18 setAlignment:a3];
    [v15 setObject:v18 forKey:v9];
    v20 = (void *)[v15 copy];
    [v5 setTypingAttributes:v20];

    if (v25)
    {
      double v21 = (void *)[v28 mutableCopy];
      uint64_t v26 = [v28 length];
      if (v24)
      {
        double v22 = (void *)[v18 copy];
        objc_msgSend(v21, "addAttribute:value:range:", v9, v22, 0, v26);
      }
      else
      {
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __40__PDFAKAnnotationAdaptor__syncQuadding___block_invoke;
        v29[3] = &unk_2642042B8;
        int64_t v31 = a3;
        id v30 = v21;
        objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v26, 0x100000, v29);
      }
      int v23 = (void *)[objc_alloc(MEMORY[0x263F82390]) initWithAttributedString:v21];
      [v5 setAnnotationText:v23];
    }
  }

LABEL_21:
}

void __40__PDFAKAnnotationAdaptor__syncQuadding___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)[a2 mutableCopy];
  [v7 setAlignment:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F822A8], v7, a3, a4);
}

- (void)_syncLinePoints:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    id v5 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    AKArrowAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [v19 objectAtIndex:0];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = [v19 objectAtIndex:1];
      [v10 doubleValue];
      double v12 = v11;

      char v13 = [v19 objectAtIndex:2];
      [v13 doubleValue];
      double v15 = v14;

      double v16 = [v19 objectAtIndex:3];
      [v16 doubleValue];
      double v18 = v17;

      objc_msgSend(v6, "setStartPoint:", v9, v12);
      objc_msgSend(v6, "setEndPoint:", v15, v18);
      objc_msgSend(v6, "setMidPoint:", (v9 + v15) * 0.5, (v12 + v18) * 0.5);
    }
    id v4 = v19;
  }
}

- (void)_syncLineEndingStyles:(id)a3
{
  id v13 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  AKArrowAnnotationClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v13 objectAtIndex:0];
    id v7 = [v13 objectAtIndex:1];
    int v8 = [v6 isEqualToString:@"/None"];
    int v9 = [v7 isEqualToString:@"/None"];
    uint64_t v10 = 3;
    if (v8 | v9) {
      uint64_t v10 = 1;
    }
    uint64_t v11 = 2;
    if (v9) {
      uint64_t v11 = 0;
    }
    if (v8) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    [v5 setArrowHeadStyle:v12];
  }
}

- (void)_syncParent:(id)a3
{
  id v12 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v12;
  }
  else
  {
    int v8 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    int v9 = [v8 page];
    id v7 = [v9 annotationWithUUID:v12];
  }
  uint64_t v10 = [v7 akAnnotationAdaptor];
  uint64_t v11 = [v10 akAnnotation];

  if ([v4 conformsToProtocol:&unk_26C57C948]
    && (([v11 conformsToProtocol:&unk_26C57C9A8] & 1) != 0 || !v11))
  {
    [v4 setParentAnnotation:v11];
  }
}

- (void)_syncPopup:(id)a3
{
  id v12 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v12;
  }
  else
  {
    int v8 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    int v9 = [v8 page];
    id v7 = [v9 annotationWithUUID:v12];
  }
  uint64_t v10 = [v7 akAnnotationAdaptor];
  uint64_t v11 = [v10 akAnnotation];

  if ([v4 conformsToProtocol:&unk_26C57C9A8]
    && (([v11 conformsToProtocol:&unk_26C57C948] & 1) != 0 || !v11))
  {
    [v4 setChildAnnotation:v11];
  }
}

- (void)_syncTextLabel:(id)a3
{
  id v6 = a3;
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  id v5 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  if ([v5 isMarkupAnnotation])
  {
    [v4 setAuthor:v6];
  }
  else
  {
    AKTextFieldAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setFieldName:v6];
    }
  }
}

- (void)_syncEverythingToPDFAnnotation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
  id v5 = self->_private;
  BOOL isSyncingFromAKAnnotation = v5->isSyncingFromAKAnnotation;
  v5->BOOL isSyncingFromAKAnnotation = 1;
  id v6 = (void *)MEMORY[0x263F08D40];
  [v4 drawingBounds];
  objc_msgSend(v6, "PDFKitValueWithPDFRect:");
  char v24 = v26 = v3;
  objc_msgSend(v3, "setValue:forAnnotationKey:");
  id v7 = [v4 keysForValuesToObserveForUndo];
  int v8 = (void *)[v7 mutableCopy];

  int v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C52E640];
  [v8 minusSet:v9];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    uint64_t v13 = *MEMORY[0x263F081B0];
    uint64_t v14 = *MEMORY[0x263F081B8];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = [v4 valueForKey:v16];
        double v18 = (void *)v17;
        if (v17)
        {
          v34[0] = v13;
          v34[1] = v14;
          v35[0] = &unk_26C52E2F8;
          v35[1] = v17;
          id v19 = NSDictionary;
          v20 = (void **)v35;
          double v21 = v34;
          uint64_t v22 = 2;
        }
        else
        {
          uint64_t v32 = v13;
          long long v33 = &unk_26C52E310;
          id v19 = NSDictionary;
          v20 = &v33;
          double v21 = &v32;
          uint64_t v22 = 1;
        }
        int v23 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
        [(PDFAKAnnotationAdaptor *)self observeValueForKeyPath:v16 ofObject:v4 change:v23 context:@"PDFAKAnnotationAdaptor.annotationPropertyObservationContext"];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v11);
  }

  self->_private->BOOL isSyncingFromAKAnnotation = isSyncingFromAKAnnotation;
}

- (void)_startObservingAnnotation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (GetDefaultsWriteAKEnabled())
  {
    BOOL v3 = self->_private;
    if (!v3->isObservingAKAnnotation)
    {
      v3->isObservingAKAnnotation = 1;
      id v4 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
      id v5 = [v4 keysForValuesToObserveForUndo];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [v4 addObserver:self forKeyPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) options:3 context:@"PDFAKAnnotationAdaptor.annotationPropertyObservationContext"];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)_stopObservingAnnotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (GetDefaultsWriteAKEnabled() && self->_private->isObservingAKAnnotation)
  {
    BOOL v3 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    id v4 = [v3 keysForValuesToObserveForUndo];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    self->_private->isObservingAKAnnotation = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"PDFAKAnnotationAdaptor.annotationPropertyObservationContext")
  {
    if (self->_private->isSyncingFromPDFAnnotation) {
      goto LABEL_44;
    }
    id v13 = v11;
    uint64_t v14 = [(PDFAKAnnotationAdaptor *)self akAnnotation];
    uint64_t v15 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v16 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    if (!v15 || [v15 isEqual:v16])
    {
      uint64_t v17 = [v12 objectForKey:*MEMORY[0x263F081B0]];
      if ([v17 integerValue] == 3)
      {
      }
      else
      {
        int v18 = [v10 isEqualToString:@"drawing"];

        if (!v18)
        {
LABEL_43:

          goto LABEL_44;
        }
      }
    }
    id v19 = self->_private;
    BOOL isSyncingFromAKAnnotation = v19->isSyncingFromAKAnnotation;
    v19->BOOL isSyncingFromAKAnnotation = 1;
    if (([v10 isEqualToString:@"isEdited"] & 1) != 0
      || ([v10 isEqualToString:@"shouldObserveEdits"] & 1) != 0)
    {
LABEL_42:
      self->_private->BOOL isSyncingFromAKAnnotation = isSyncingFromAKAnnotation;
      goto LABEL_43;
    }
    if (([v10 isEqualToString:@"typingAttributes"] & 1) == 0
      && ([v10 isEqualToString:@"shouldUseAppearanceOverride"] & 1) == 0
      && ([v10 isEqualToString:@"horizontallyFlipped"] & 1) == 0
      && ([v10 isEqualToString:@"verticallyFlipped"] & 1) == 0
      && ([v10 isEqualToString:@"magnification"] & 1) == 0
      && ([v10 isEqualToString:@"brushStyle"] & 1) == 0
      && ([v10 isEqualToString:@"image"] & 1) == 0
      && ([v10 isEqualToString:@"drawing"] & 1) == 0)
    {
      if (([v10 isEqualToString:@"midPoint"] & 1) == 0
        && ([v10 isEqualToString:@"arrowHeadLength"] & 1) == 0
        && ([v10 isEqualToString:@"arrowHeadWidth"] & 1) == 0
        && ([v10 isEqualToString:@"arrowLineWidth"] & 1) == 0
        && ([v10 isEqualToString:@"pointyBitPoint"] & 1) == 0
        && ([v10 isEqualToString:@"pointyBitBaseWidthAngle"] & 1) == 0
        && ([v10 isEqualToString:@"rotationAngle"] & 1) == 0
        && ([v10 isEqualToString:@"pointCount"] & 1) == 0
        && ([v10 isEqualToString:@"innerRadiusFactor"] & 1) == 0
        && ([v10 isEqualToString:@"hasShadow"] & 1) == 0
        && ([v10 isEqualToString:@"signature"] & 1) == 0)
      {
        if ([v10 isEqualToString:@"author"])
        {
          [(PDFAKAnnotationAdaptor *)self _syncAuthorForAnnotation:v13 withKey:v10 andNewValue:v15];
        }
        else if ([v10 isEqualToString:@"modificationDate"])
        {
          [(PDFAKAnnotationAdaptor *)self _syncModificationDateForAnnotation:v13 withKey:v10 andNewValue:v15];
        }
        else if ([v10 isEqualToString:@"annotationText"])
        {
          [(PDFAKAnnotationAdaptor *)self _syncAnnotationTextForAnnotation:v13 withKey:v10 andNewValue:v15];
        }
        else if ([v10 isEqualToString:@"contents"])
        {
          [(PDFAKAnnotationAdaptor *)self _syncContentsForAnnotation:v13 withKey:v10 andNewValue:v15];
        }
        else if (([v10 isEqualToString:@"rectangle"] & 1) == 0)
        {
          if ([v10 isEqualToString:@"startPoint"])
          {
            [(PDFAKAnnotationAdaptor *)self _syncStartPointForAnnotation:v13 withKey:v10 andNewValue:v15];
          }
          else if ([v10 isEqualToString:@"endPoint"])
          {
            [(PDFAKAnnotationAdaptor *)self _syncEndPointForAnnotation:v13 withKey:v10 andNewValue:v15];
          }
          else if ([v10 isEqualToString:@"strokeWidth"])
          {
            [(PDFAKAnnotationAdaptor *)self _syncStrokeWidthForAnnotation:v13 withKey:v10 andNewValue:v15];
          }
          else
          {
            if (([v10 isEqualToString:@"strokeColor"] & 1) != 0
              || ([v10 isEqualToString:@"fillColor"] & 1) != 0
              || [v10 isEqualToString:@"color"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncColorForAnnotation:v13 withKey:v10 andNewValue:v15];
              goto LABEL_39;
            }
            if ([v10 isEqualToString:@"arrowHeadStyle"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncArrowHeadStyleForAnnotation:v13 withKey:v10 andNewValue:v15];
            }
            else if ([v10 isEqualToString:@"dashed"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncDashedForAnnotation:v13 withKey:v10 andNewValue:v15];
            }
            else if ([v10 isEqualToString:@"cornerRadius"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncCornerRadiusForAnnotation:v13 withKey:v10 andNewValue:v15];
            }
            else if ([v10 isEqualToString:@"path"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncInkPathForAnnotation:v13 withKey:v10 andNewValue:v15];
            }
            else if ([v10 isEqualToString:@"childAnnotation"])
            {
              [(PDFAKAnnotationAdaptor *)self _syncChildAnnotationForAnnotation:v13 withKey:v10 andNewValue:v15];
            }
            else
            {
              NSLog(&cfstr_UnhandledAkPro.isa, v10);
            }
          }
        }
      }
      [(PDFAKAnnotationAdaptor *)self _syncBoundingRectangleForAnnotation:v13 withKey:v10 andNewValue:v15];
    }
LABEL_39:
    [(PDFAKAnnotationAdaptor *)self _invalidateAppearanceStreamForAnnotation:v13 withKey:v10 andNewValue:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    if ([WeakRetained isFullyConstructed])
    {
      [WeakRetained page];
      long long v27 = v15;
      uint64_t v22 = v16;
      id v23 = v13;
      char v24 = v14;
      v26 = BOOL v25 = isSyncingFromAKAnnotation;
      [v26 postAnnotationsChangedNotification];

      BOOL isSyncingFromAKAnnotation = v25;
      uint64_t v14 = v24;
      id v13 = v23;
      uint64_t v16 = v22;
      uint64_t v15 = v27;
    }

    goto LABEL_42;
  }
  v28.receiver = self;
  v28.super_class = (Class)PDFAKAnnotationAdaptor;
  [(PDFAKAnnotationAdaptor *)&v28 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_44:
}

- (void)_syncBoundingRectangleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v6 = a3;
  id v16 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  [v6 drawingBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v8, v10, v12, v14);
  [v16 setValue:v15 forAnnotationKey:@"/Rect"];
}

- (void)_syncAuthorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v8 = v6;
    double v7 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    if ([v7 isMarkupAnnotation]) {
      [v7 setValue:v8 forAnnotationKey:@"/T"];
    }

    id v6 = v8;
  }
}

- (void)_syncModificationDateForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    [v6 setValue:v7 forAnnotationKey:@"/M"];
  }
}

- (void)_syncAnnotationTextForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v13 = a5;
  id v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v7 = [MEMORY[0x263EFF9D0] null];

  id v8 = v13;
  if (v7 == v13)
  {

    id v8 = 0;
  }
  id v14 = v8;
  double v9 = [v8 string];
  double v10 = @"/Contents";
  double v11 = [v6 valueForAnnotationKey:@"/Subtype"];
  if ([v11 isEqualToString:@"/Widget"])
  {
    double v12 = @"/V";

    double v10 = v12;
  }
  if (v9) {
    [v6 setValue:v9 forAnnotationKey:v10];
  }
  else {
    [v6 removeValueForAnnotationKey:v10];
  }
}

- (void)_syncContentsForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v11 = a5;
  id v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v7 = [v6 valueForAnnotationKey:@"/Subtype"];
  if (([v7 isEqualToString:@"/Text"] & 1) != 0
    || [v7 isEqualToString:@"/Popup"])
  {
    id v8 = v11;
    [v6 setValue:v8 forAnnotationKey:@"/Contents"];
    if ([v7 isEqualToString:@"/Popup"])
    {
      double v9 = [v6 parent];

      if (v9)
      {
        double v10 = [v6 parent];
        [v10 setValue:v8 forAnnotationKey:@"/Contents"];
      }
    }
  }
  else
  {
    NSLog(&cfstr_SWasnTExpectin.isa, "-[PDFAKAnnotationAdaptor _syncContentsForAnnotation:withKey:andNewValue:]");
  }
}

- (void)_syncStartPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v13 = a5;
  id v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  [v13 PDFKitPDFPointValue];
  objc_msgSend(v6, "setStartPoint:", v11 - v8, v12 - v10);
}

- (void)_syncEndPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v13 = a5;
  id v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  [v13 PDFKitPDFPointValue];
  objc_msgSend(v6, "setEndPoint:", v11 - v8, v12 - v10);
}

- (void)_syncStrokeWidthForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v17 = a3;
  [a5 doubleValue];
  double v8 = v7;
  if (objc_opt_respondsToSelector()) {
    int v9 = [v17 isDashed];
  }
  else {
    int v9 = 0;
  }
  double v10 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  double v11 = [v10 valueForAnnotationKey:@"/Border"];
  if (!v11)
  {
    double v11 = objc_alloc_init(PDFBorder);
    [v10 setValue:v11 forAnnotationKey:@"/Border"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PDFBorder *)v11 setLineWidth:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = (void *)[(PDFBorder *)v11 mutableCopy];
      if ((unint64_t)[v12 count] >= 3)
      {
        id v13 = [NSNumber numberWithDouble:v8];
        [v12 replaceObjectAtIndex:2 withObject:v13];
        [v10 setValue:v12 forAnnotationKey:@"/Border"];
      }
    }
  }
  id v14 = [v10 valueForAnnotationKey:@"/BS"];

  if (v14)
  {
    uint64_t v15 = (void *)[v14 mutableCopy];
    id v16 = [NSNumber numberWithDouble:v8];
    [v15 setObject:v16 forKey:@"/W"];

    [v10 setValue:v15 forAnnotationKey:@"/BS"];
  }
  if (v9) {
    [(PDFAKAnnotationAdaptor *)self _updateDashedPatternForStrokeWidth:1 isDashed:v8];
  }
}

- (void)_syncColorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if (([v12 isEqualToString:@"strokeColor"] & 1) == 0)
  {
    if ([v12 isEqualToString:@"fillColor"])
    {
      double v8 = &PDFAnnotationKeyInteriorColor;
      goto LABEL_6;
    }
    if (![v12 isEqualToString:@"color"]) {
      goto LABEL_8;
    }
  }
  double v8 = &PDFAnnotationKeyColor;
LABEL_6:
  id v9 = *(id *)v8;
  if (v9)
  {
    double v10 = v9;
    double v11 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    [v11 setValue:v7 forAnnotationKey:v10];
  }
LABEL_8:
}

- (void)_syncArrowHeadStyleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(a5, "integerValue", a3, a4);
  id v7 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  uint64_t v8 = v6 - 1;
  if ((unint64_t)(v6 - 1) > 2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = qword_214422E48[v8];
    uint64_t v10 = qword_214422E60[v8];
  }
  double v11 = +[PDFAnnotation nameForLineStyle:v9];
  id v12 = +[PDFAnnotation nameForLineStyle:v10];
  v14[0] = v11;
  v14[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [v7 setValue:v13 forAnnotationKey:@"/LE"];
}

- (void)_syncDashedForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v13 = a3;
  uint64_t v7 = [a5 BOOLValue];
  if (objc_opt_respondsToSelector())
  {
    [v13 strokeWidth];
    double v9 = v8;
  }
  else
  {
    uint64_t v10 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
    double v11 = [v10 valueForAnnotationKey:@"/Border"];

    if (v11)
    {
      [v11 lineWidth];
      double v9 = v12;
    }
    else
    {
      double v9 = 1.0;
    }
  }
  [(PDFAKAnnotationAdaptor *)self _updateDashedPatternForStrokeWidth:v7 isDashed:v9];
}

- (void)_updateDashedPatternForStrokeWidth:(double)a3 isDashed:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x263EF8340];
  if (a3 <= 0.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = a3;
  }
  uint64_t v6 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  uint64_t v7 = [v6 valueForAnnotationKey:@"/Border"];
  if (!v7)
  {
    uint64_t v7 = objc_alloc_init(PDFBorder);
    [v6 setValue:v7 forAnnotationKey:@"/Border"];
  }
  if (v4)
  {
    double v8 = [NSNumber numberWithDouble:v5 * 3.0 + 4.0];
    v16[0] = v8;
    double v9 = [NSNumber numberWithDouble:v5 + 7.0];
    v16[1] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = v7;
    [(PDFBorder *)v11 setStyle:v4];
    [(PDFBorder *)v11 setDashPattern:v10];
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v10)
  {
    double v11 = (PDFBorder *)[(PDFBorder *)v7 mutableCopy];
    if ((unint64_t)[(PDFBorder *)v11 count] >= 4)
    {
      [(PDFBorder *)v11 replaceObjectAtIndex:3 withObject:v10];
      [v6 setValue:v11 forAnnotationKey:@"/Border"];
    }
    goto LABEL_11;
  }
LABEL_12:
  double v12 = [v6 valueForAnnotationKey:@"/BS"];

  if (v12)
  {
    id v13 = (void *)[v12 mutableCopy];
    id v14 = v13;
    if (v4)
    {
      [v13 setObject:@"/D" forKey:@"/S"];
      uint64_t v15 = [v10 copy];

      [v14 setObject:v15 forKey:@"/D"];
      uint64_t v10 = (void *)v15;
    }
    else
    {
      [v13 setObject:@"/S" forKey:@"/S"];
      [v14 removeObjectForKey:@"/D"];
    }
    [v6 setValue:v14 forAnnotationKey:@"/BS"];
  }
}

- (void)_syncCornerRadiusForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  objc_msgSend(a5, "doubleValue", a3, a4);
  double v7 = v6;
  id v12 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  double v8 = [v12 valueForAnnotationKey:@"/Border"];
  if (!v8)
  {
    double v8 = objc_alloc_init(PDFBorder);
    [v12 setValue:v8 forAnnotationKey:@"/Border"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = v8;
    [(PDFBorder *)v9 setHorizontalCornerRadius:v7];
    [(PDFBorder *)v9 setVerticalCornerRadius:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    double v9 = (PDFBorder *)[(PDFBorder *)v8 mutableCopy];
    if ((unint64_t)[(PDFBorder *)v9 count] >= 2)
    {
      uint64_t v10 = [NSNumber numberWithDouble:v7];
      double v11 = [NSNumber numberWithDouble:v7];
      [(PDFBorder *)v9 replaceObjectAtIndex:0 withObject:v10];
      [(PDFBorder *)v9 replaceObjectAtIndex:1 withObject:v11];
      [v12 setValue:v9 forAnnotationKey:@"/Border"];
    }
  }

LABEL_9:
}

- (void)_syncChildAnnotationForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a5;
  double v7 = [(PDFAKAnnotationAdaptor *)self pdfAnnotation];
  id v8 = [MEMORY[0x263EFF9D0] null];

  if (v8 != v6)
  {
    id v9 = v6;
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = v7;
      id v12 = [v11 page];
      id v13 = v12;
      if (v12)
      {
        uint64_t v22 = v11;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = [v12 annotations];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v24;
LABEL_6:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v23 + 1) + 8 * v18) akAnnotationAdaptor];
            v20 = [v19 akAnnotation];

            if (v20 == v10) {
              break;
            }

            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
              if (v16) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }
          double v21 = [v19 pdfAnnotation];

          id v11 = v22;
          if (!v21) {
            goto LABEL_16;
          }
          [v22 setPopupInternal:v21 scanPage:0];

          goto LABEL_17;
        }
LABEL_12:

        id v11 = v22;
      }
LABEL_16:
      NSLog(&cfstr_SDidNotFindPdf.isa, "-[PDFAKAnnotationAdaptor _syncChildAnnotationForAnnotation:withKey:andNewValue:]", v10);
LABEL_17:

      goto LABEL_18;
    }
  }
  [v7 setPopupInternal:0 scanPage:0];
LABEL_18:
}

+ (id)_akAnnotationInstanceForPDFAnnotationSubtype:(id)a3 withOptionalWidgetFieldType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"/Link"]
    || [v6 isEqualToString:@"/Text"])
  {
    goto LABEL_3;
  }
  if ([v6 isEqualToString:@"/FreeText"])
  {
    AKTextBoxAnnotationClass();
  }
  else if ([v6 isEqualToString:@"/Line"])
  {
    AKArrowAnnotationClass();
  }
  else if ([v6 isEqualToString:@"/Square"])
  {
    AKRectAnnotationClass();
  }
  else if ([v6 isEqualToString:@"/Circle"])
  {
    AKOvalAnnotationClass();
  }
  else
  {
    if ([v6 isEqualToString:@"/Highlight"]
      || [v6 isEqualToString:@"/Underline"]
      || [v6 isEqualToString:@"/StrikeOut"])
    {
      goto LABEL_3;
    }
    if ([v6 isEqualToString:@"/Ink"]
      || ([v6 isEqualToString:@"/Stamp"] & 1) != 0
      || [v6 isEqualToString:@"/SN"])
    {
      AKImageAnnotationClass();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"/Popup"]
      || [v6 isEqualToString:@"/Redact"])
    {
      goto LABEL_3;
    }
    if (![v6 isEqualToString:@"/Widget"])
    {
      if (![v6 isEqualToString:@"/Redact"]) {
        NSLog(&cfstr_SUnhandledAnno.isa, "+[PDFAKAnnotationAdaptor _akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:]", v6);
      }
      goto LABEL_3;
    }
    if (![a1 _akAnnotationSubclassForWidgetFieldType:v7])
    {
LABEL_3:
      uint64_t v8 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_13;
    }
  }
LABEL_12:
  uint64_t v8 = objc_opt_new();
LABEL_13:
  id v9 = (void *)v8;

  return v9;
}

+ (Class)_akAnnotationSubclassForWidgetFieldType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"/Btn"] & 1) != 0
    || ([v3 isEqualToString:@"/Tx"] & 1) != 0
    || ([v3 isEqualToString:@"/Ch"] & 1) != 0)
  {
    goto LABEL_7;
  }
  if (![v3 isEqualToString:@"/Sig"])
  {
    NSLog(&cfstr_SUnhandledWidg.isa, "+[PDFAKAnnotationAdaptor _akAnnotationSubclassForWidgetFieldType:]", v3);
LABEL_7:
    id v4 = 0;
    goto LABEL_8;
  }
  id v4 = AKImageAnnotationClass();
LABEL_8:
  double v5 = (objc_class *)v4;

  return v5;
}

+ (id)_pdfAnnotationInstanceForAKAnnotation:(id)a3
{
  id v3 = a3;
  id v4 = [PDFAnnotation alloc];
  double v5 = -[PDFAnnotation initWithBounds:forType:withProperties:](v4, "initWithBounds:forType:withProperties:", &stru_26C516768, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  AKTextBoxAnnotationClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = &PDFAnnotationSubtypeFreeText;
LABEL_26:
    [(PDFAnnotation *)v5 setValue:*v6 forAnnotationKey:@"/Subtype"];
    goto LABEL_27;
  }
  AKRectAnnotationClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = &PDFAnnotationSubtypeSquare;
    goto LABEL_26;
  }
  AKRedactionRectAnnotationClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PDFAnnotation *)v5 setValue:@"/Square" forAnnotationKey:@"/Subtype"];
    if (GetDefaultsWriteHighlightRedactions()) {
      [v3 setIsHighlighted:1];
    }
  }
  else
  {
    AKOvalAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = &PDFAnnotationSubtypeCircle;
      goto LABEL_26;
    }
    AKArrowShapeAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKArrowAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = &PDFAnnotationSubtypeLine;
      goto LABEL_26;
    }
    AKDoodleAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKInkAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PDFAnnotation *)v5 setValue:@"/Square" forAnnotationKey:@"/Subtype"];
      id v7 = objc_alloc_init(PDFBorder);
      [(PDFBorder *)v7 setLineWidth:0.0];
      [(PDFAnnotation *)v5 setValue:v7 forAnnotationKey:@"/Border"];
      uint64_t v8 = [MEMORY[0x263F825C8] clearColor];
      [(PDFAnnotation *)v5 setValue:v8 forAnnotationKey:@"/C"];
      [(PDFAnnotation *)v5 setValue:v8 forAnnotationKey:@"/IC"];
      [(PDFAnnotation *)v5 setReadOnlyAnnotation:1];
      [(PDFAnnotation *)v5 setLocked:1];
      [(PDFAnnotation *)v5 setContentsLocked:1];

      goto LABEL_27;
    }
    AKLoupeAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKThoughtBubbleAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKSpeechBubbleAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKTriangleAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKPolygonAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_25;
    }
    AKStarAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (AKHeartAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (AKBorderMaskAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (AKImageAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_25:
      id v6 = &PDFAnnotationSubtypeStamp;
      goto LABEL_26;
    }
    AKSignatureAnnotationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PDFAnnotation *)v5 setValue:@"/SN" forAnnotationKey:@"/Subtype"];
      [(PDFAnnotation *)v5 setShouldBurnIn:1];
    }
    else
    {
      AKCropAnnotationClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [MEMORY[0x263EFF9D0] null];

        double v5 = (PDFAnnotation *)v11;
      }
    }
  }
LABEL_27:
  if (v5)
  {
    id v9 = [MEMORY[0x263EFF9D0] null];

    if (v9 != v5) {
      -[PDFAnnotation setShouldBurnIn:](v5, "setShouldBurnIn:", [v3 shouldBurnIn]);
    }
  }

  return v5;
}

- (id)_colorFromColorOrArray:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    PDFColorCreateFromNSArray(v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end