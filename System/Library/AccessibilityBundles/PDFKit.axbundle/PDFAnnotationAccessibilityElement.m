@interface PDFAnnotationAccessibilityElement
- (BOOL)_accessibilityIsButtonWidget;
- (BOOL)isAccessibilityElement;
- (CGPDFTaggedNode)nodeRef;
- (CGRect)accessibilityFrame;
- (NSMutableArray)cachedAXElements;
- (PDFAnnotation)annotation;
- (PDFAnnotationAccessibilityElement)initWithAccessibilityContainer:(id)a3 pdfNodeRef:(CGPDFTaggedNode *)a4 withPage:(id)a5;
- (id)_accessibilityAnnotationFieldType;
- (id)_accessibilityAnnotationType;
- (id)_accessibilityAnnotationWidgetTextLabel;
- (id)_accessibilityLineStyleStringForLineStyle:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (int)type;
- (unint64_t)accessibilityTraits;
- (void)_axAnnotationHit:(id)a3;
- (void)_axRemovedFromSuperview:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setCachedAXElements:(id)a3;
- (void)setNodeRef:(CGPDFTaggedNode *)a3;
@end

@implementation PDFAnnotationAccessibilityElement

- (PDFAnnotationAccessibilityElement)initWithAccessibilityContainer:(id)a3 pdfNodeRef:(CGPDFTaggedNode *)a4 withPage:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PDFAnnotationAccessibilityElement;
  v10 = [(AXPDFNodeElement *)&v27 initWithAccessibilityContainer:v8 withPage:v9];
  v11 = v10;
  if (v10)
  {
    [(PDFAnnotationAccessibilityElement *)v10 setNodeRef:a4];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    id v20 = v9;
    AXPerformSafeBlock();
    id v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
    [(PDFAnnotationAccessibilityElement *)v11 setAnnotation:v12];
  }
  v13 = [(PDFAnnotationAccessibilityElement *)v11 _accessibilityAnnotationFieldType];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F14848]];

  if (v14)
  {
    v15 = [(PDFAnnotationAccessibilityElement *)v11 annotation];
    int v16 = [v15 isListChoice];

    if (v16)
    {
      v17 = [MEMORY[0x263F08A00] defaultCenter];
      [v17 addObserver:v11 selector:sel__axAnnotationHit_ name:*MEMORY[0x263F148B8] object:0];

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 addObserver:v11 selector:sel__axRemovedFromSuperview_ name:AXPDFRemoveFromSuperviewNotification object:0];
    }
  }

  return v11;
}

uint64_t __88__PDFAnnotationAccessibilityElement_initWithAccessibilityContainer_pdfNodeRef_withPage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) fetchAnnotationFromTaggedNodeRef:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (void)_axAnnotationHit:(id)a3
{
  v4 = [a3 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F148B8]];

  if (v5)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(PDFAnnotationAccessibilityElement *)self setCachedAXElements:0];
  }
}

- (void)_axRemovedFromSuperview:(id)a3
{
  v4 = [a3 name];
  int v5 = [v4 isEqualToString:AXPDFRemoveFromSuperviewNotification];

  if (v5)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(PDFAnnotationAccessibilityElement *)self setCachedAXElements:0];
  }
}

- (BOOL)isAccessibilityElement
{
  v3 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationType];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F14800]];

  if (v4) {
    return 0;
  }
  int v5 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F14848]];

  if (!v6) {
    return 1;
  }
  v7 = [(PDFAnnotationAccessibilityElement *)self annotation];
  char v8 = [v7 isListChoice];

  return (v8 & 1) == 0;
}

- (CGRect)accessibilityFrame
{
  v3 = [(PDFAnnotationAccessibilityElement *)self annotation];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[AXPDFNodeElement axConvertBoundsFromPageToScreenCoordinates:](self, "axConvertBoundsFromPageToScreenCoordinates:", v5, v7, v9, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v21.receiver = self;
  v21.super_class = (Class)PDFAnnotationAccessibilityElement;
  unint64_t v3 = [(PDFAnnotationAccessibilityElement *)&v21 accessibilityTraits];
  double v4 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
  double v5 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationType];
  if (![(PDFAnnotationAccessibilityElement *)self _accessibilityIsButtonWidget])
  {
    if (![v4 isEqualToString:*MEMORY[0x263F14848]])
    {
      if (([v4 isEqualToString:*MEMORY[0x263F14858]] & 1) == 0
        && ([v5 isEqualToString:*MEMORY[0x263F147E0]] & 1) == 0
        && ![v5 isEqualToString:*MEMORY[0x263F14828]])
      {
        goto LABEL_18;
      }
      uint64_t v15 = *MEMORY[0x263F81408] | *MEMORY[0x263F21B60];
LABEL_17:
      v3 |= v15;
      goto LABEL_18;
    }
    double v12 = [(PDFAnnotationAccessibilityElement *)self annotation];
    char v13 = [v12 isListChoice];

    if (v13) {
      goto LABEL_18;
    }
    double v14 = (uint64_t *)MEMORY[0x263F21A88];
LABEL_16:
    uint64_t v15 = *v14;
    goto LABEL_17;
  }
  double v6 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v7 = [v6 widgetControlType];

  if (v7 == 2)
  {
    v3 |= *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF60] | *MEMORY[0x263F21C90];
    goto LABEL_18;
  }
  if (v7 != 1)
  {
    double v14 = (uint64_t *)MEMORY[0x263F1CEE8];
    goto LABEL_16;
  }
  uint64_t v8 = *MEMORY[0x263F813C8];
  double v9 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v10 = [v9 buttonWidgetState];

  uint64_t v11 = *MEMORY[0x263F1CF38];
  if (v10 != 1) {
    uint64_t v11 = 0;
  }
  v3 |= v8 | v11;
LABEL_18:
  int v16 = [(PDFAnnotationAccessibilityElement *)self annotation];
  int v17 = [v16 isPasswordField];

  uint64_t v18 = *MEMORY[0x263F813D8];
  if (!v17) {
    uint64_t v18 = 0;
  }
  unint64_t v19 = v18 | v3;

  return v19;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
  double v4 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationType];
  if (![v4 isEqualToString:*MEMORY[0x263F147F8]])
  {
    if ([v4 isEqualToString:*MEMORY[0x263F147E8]])
    {
      double v9 = @"highlight.annotation";
      goto LABEL_6;
    }
    if (([v4 isEqualToString:*MEMORY[0x263F147E0]] & 1) == 0
      && ![v4 isEqualToString:*MEMORY[0x263F14828]])
    {
      if ([v4 isEqualToString:*MEMORY[0x263F14810]])
      {
        double v9 = @"square.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F147D8]])
      {
        double v9 = @"circle.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F14830]])
      {
        double v9 = @"underline.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F14820]])
      {
        double v9 = @"strike.out.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F147F0]])
      {
        double v9 = @"ink.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F14818]])
      {
        double v9 = @"stamp.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F14808]])
      {
        double v9 = @"popup.annotation";
        goto LABEL_6;
      }
      if ([v4 isEqualToString:*MEMORY[0x263F14838]])
      {
        if ([v3 isEqualToString:*MEMORY[0x263F14858]])
        {
          double v14 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationWidgetTextLabel];
          v39 = [(PDFAnnotationAccessibilityElement *)self annotation];
          v40 = [v39 caption];
          v41 = [(PDFAnnotationAccessibilityElement *)self annotation];
          v46 = [v41 contents];
          v48 = @"__AXStringForVariablesSentinel";
          v44 = v40;
          uint64_t v11 = __UIAXStringForVariables();

          goto LABEL_53;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F14850]])
        {
          double v9 = @"signature.annotation";
          goto LABEL_6;
        }
        if ([v3 isEqualToString:*MEMORY[0x263F14840]])
        {
          v42 = [(PDFAnnotationAccessibilityElement *)self annotation];
          uint64_t v43 = [v42 widgetControlType];

          if (!v43)
          {
            double v14 = [(PDFAnnotationAccessibilityElement *)self annotation];
            uint64_t v24 = [v14 caption];
LABEL_51:
            uint64_t v11 = (void *)v24;
            goto LABEL_53;
          }
          if (v43 == 2)
          {
            uint64_t v10 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationWidgetTextLabel];
            goto LABEL_7;
          }
        }
      }
      uint64_t v11 = 0;
      goto LABEL_54;
    }
    char v13 = [(PDFAnnotationAccessibilityElement *)self annotation];
    double v14 = [v13 valueForAnnotationKey:*MEMORY[0x263F14798]];

    if ([v14 isEqualToString:@"/Comment"])
    {
      uint64_t v15 = @"comment.icon";
    }
    else if ([v14 isEqualToString:@"/Key"])
    {
      uint64_t v15 = @"key.icon";
    }
    else if ([v14 isEqualToString:@"/Note"])
    {
      uint64_t v15 = @"note.icon";
    }
    else if ([v14 isEqualToString:@"/Help"])
    {
      uint64_t v15 = @"help.icon";
    }
    else if ([v14 isEqualToString:@"/NewParagraph"])
    {
      uint64_t v15 = @"newparagraph.icon";
    }
    else if ([v14 isEqualToString:@"/Paragraph"])
    {
      uint64_t v15 = @"paragraph.icon";
    }
    else
    {
      if (![v14 isEqualToString:@"/Insert"])
      {
LABEL_49:
        v22 = [(PDFAnnotationAccessibilityElement *)self annotation];
        unint64_t v23 = [v22 iconType];

        if (v23 > 6)
        {
          uint64_t v11 = 0;
          goto LABEL_53;
        }
        uint64_t v24 = accessibilityLocalizedString(off_26513FC30[v23]);
        goto LABEL_51;
      }
      uint64_t v15 = @"insert.icon";
    }
    uint64_t v11 = accessibilityLocalizedString(v15);
    if (v11)
    {
LABEL_53:

      goto LABEL_54;
    }
    goto LABEL_49;
  }
  double v5 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v6 = [v5 startLineStyle];

  uint64_t v7 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v8 = [v7 endLineStyle];

  if (!(v6 | v8))
  {
    double v9 = @"line.annotation";
LABEL_6:
    uint64_t v10 = accessibilityLocalizedString(v9);
LABEL_7:
    uint64_t v11 = (void *)v10;
    goto LABEL_54;
  }
  if (v6 && v8)
  {
    double v12 = @"double.headed.arrow.annotation";
  }
  else
  {
    if (!(v6 | v8))
    {
      int v16 = 0;
      goto LABEL_23;
    }
    double v12 = @"single.headed.arrow.annotation";
  }
  int v16 = accessibilityLocalizedString(v12);
LABEL_23:
  if (v8) {
    BOOL v17 = v6 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    uint64_t v18 = v8;
  }
  else {
    uint64_t v18 = v6;
  }
  unint64_t v19 = [(PDFAnnotationAccessibilityElement *)self _accessibilityLineStyleStringForLineStyle:v18];
  id v20 = NSString;
  objc_super v21 = accessibilityLocalizedString(@"line.style");
  uint64_t v11 = objc_msgSend(v20, "stringWithFormat:", v21, v16, v19);

LABEL_54:
  v25 = [(PDFAnnotationAccessibilityElement *)self annotation];
  int v26 = [v25 isTextMarkupAnnotation];

  if (v26)
  {
    objc_super v27 = [(PDFAnnotationAccessibilityElement *)self annotation];
    v28 = [v27 textMarkupString];
    v45 = v11;
    v47 = @"__AXStringForVariablesSentinel";
    uint64_t v29 = __UIAXStringForVariables();

    uint64_t v11 = (void *)v29;
  }
  v30 = [(PDFAnnotationAccessibilityElement *)self annotation];
  if ([v30 isNoteAnnotation])
  {
    v31 = [(PDFAnnotationAccessibilityElement *)self annotation];
    v32 = [v31 contents];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [(PDFAnnotationAccessibilityElement *)self annotation];
      v34 = [v33 contents];
      uint64_t v35 = [v34 length];

      if (!v35) {
        goto LABEL_62;
      }
      v30 = [(PDFAnnotationAccessibilityElement *)self annotation];
      v31 = [v30 contents];
      __UIAXStringForVariables();
      uint64_t v11 = v32 = v11;
    }
  }
LABEL_62:
  if (v11)
  {
    id v36 = v11;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)PDFAnnotationAccessibilityElement;
    id v36 = [(PDFAnnotationAccessibilityElement *)&v49 accessibilityLabel];
  }
  v37 = v36;

  return v37;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
  double v4 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationType];
  uint64_t v5 = *MEMORY[0x263F14838];
  if (![v4 isEqualToString:*MEMORY[0x263F14838]])
  {
    int v9 = [v4 isEqualToString:*MEMORY[0x263F14818]];
    uint64_t v10 = [(PDFAnnotationAccessibilityElement *)self annotation];
    uint64_t v11 = v10;
    if (v9)
    {
      double v12 = [v10 valueForAnnotationKey:*MEMORY[0x263F14798]];
      v51 = [v12 stringByReplacingOccurrencesOfString:@"/" withString:&stru_26F759EA8];
    }
    else
    {
      v51 = [v10 valueForAnnotationKey:*MEMORY[0x263F14788]];
    }

    char v13 = [(PDFAnnotationAccessibilityElement *)self annotation];
    double v14 = [v13 border];

    unint64_t v15 = [v14 style];
    [v14 lineWidth];
    double v17 = v16;
    if (([v4 isEqualToString:*MEMORY[0x263F147D8]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263F147F0]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263F147F8]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x263F14810]])
    {
      if (v15 > 4)
      {
        v50 = 0;
      }
      else
      {
        v50 = accessibilityLocalizedString(off_26513FCA0[v15]);
      }
      uint64_t v18 = @"thick.line";
      if (v17 < 8.5) {
        uint64_t v18 = @"medium.line";
      }
      if (v17 >= 2.5) {
        unint64_t v19 = v18;
      }
      else {
        unint64_t v19 = @"thin.line";
      }
      v54 = accessibilityLocalizedString(v19);
    }
    else
    {
      v50 = 0;
      v54 = 0;
    }
    id v20 = [(PDFAnnotationAccessibilityElement *)self annotation];
    objc_super v21 = [v20 font];

    v56 = v3;
    v55 = v14;
    v52 = v21;
    uint64_t v49 = *MEMORY[0x263F147E0];
    if (([v4 isEqualToString:*MEMORY[0x263F147E0]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263F14828]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263F14808]] & 1) != 0
      || [v4 isEqualToString:v5]
      && (([v3 isEqualToString:*MEMORY[0x263F14858]] & 1) != 0
       || ([v3 isEqualToString:*MEMORY[0x263F14840]] & 1) != 0
       || [v3 isEqualToString:*MEMORY[0x263F14848]]))
    {
      v22 = [v21 fontName];
      unint64_t v23 = NSString;
      uint64_t v24 = accessibilityLocalizedString(@"stroke.fontsize.value");
      v25 = NSNumber;
      [v21 pointSize];
      int v26 = objc_msgSend(v25, "numberWithDouble:");
      v47 = objc_msgSend(v23, "stringWithFormat:", v24, v26);
      v48 = @"__AXStringForVariablesSentinel";
      v53 = __UIAXStringForVariables();
    }
    else
    {
      v53 = 0;
    }
    objc_super v27 = [(PDFAnnotationAccessibilityElement *)self annotation];
    unint64_t v28 = [v27 alignment];

    if ([v4 isEqualToString:v5]
      && ([v56 isEqualToString:*MEMORY[0x263F14858]] & 1) != 0)
    {
      if (v28 > 3)
      {
        uint64_t v29 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v29 = 0;
      if (![v4 isEqualToString:v49] || v28 >= 4)
      {
LABEL_37:
        v30 = [(PDFAnnotationAccessibilityElement *)self annotation];
        v31 = [v30 userName];
        uint64_t v32 = [v31 length];

        if (v32)
        {
          v33 = NSString;
          v34 = accessibilityLocalizedString(@"annotation.creator.username.format");
          uint64_t v35 = [(PDFAnnotationAccessibilityElement *)self annotation];
          id v36 = [v35 userName];
          v37 = objc_msgSend(v33, "stringWithFormat:", v34, v36);
        }
        else
        {
          v37 = 0;
        }
        v38 = [(PDFAnnotationAccessibilityElement *)self annotation];
        v39 = [v38 color];

        v40 = (void *)v29;
        if (v39)
        {
          v41 = AXColorStringForColor();
        }
        else
        {
          v41 = 0;
        }
        __UIAXStringForVariables();
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        unint64_t v3 = v56;
        goto LABEL_44;
      }
    }
    uint64_t v29 = accessibilityLocalizedString(off_26513FC80[v28]);
    goto LABEL_37;
  }
  if (([v3 isEqualToString:*MEMORY[0x263F14858]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F14848]])
  {
    uint64_t v6 = [(PDFAnnotationAccessibilityElement *)self annotation];
    uint64_t v7 = [v6 widgetStringValue];
LABEL_5:
    uint64_t v8 = (__CFString *)v7;

    goto LABEL_44;
  }
  uint64_t v43 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v44 = [v43 widgetControlType];

  v45 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v6 = v45;
  if (v44 != 2)
  {
    uint64_t v7 = [v45 buttonWidgetStateString];
    goto LABEL_5;
  }
  uint64_t v46 = [v45 buttonWidgetState];

  if ((unint64_t)(v46 + 1) >= 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_26513FC68[v46 + 1];
  }
LABEL_44:

  return v8;
}

- (id)accessibilityElements
{
  unint64_t v3 = [(PDFAnnotationAccessibilityElement *)self cachedAXElements];
  if (!v3)
  {
    unint64_t v3 = [MEMORY[0x263EFF980] array];
    double v4 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F14848]];

    if (v5)
    {
      uint64_t v6 = [(PDFAnnotationAccessibilityElement *)self annotation];
      int v7 = [v6 isListChoice];

      if (v7)
      {
        uint64_t v8 = [(PDFAnnotationAccessibilityElement *)self annotation];
        int v9 = [v8 safeValueForKey:@"control"];

        if (v9
          && (objc_opt_class(),
              __UIAccessibilityCastAsClass(),
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              [v10 superview],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v10,
              v11))
        {
          double v12 = accessibilityLocalizedString(@"list.annotation");
          [v9 setAccessibilityLabel:v12];

          [v9 setAccessibilityContainerType:4];
          [v3 axSafelyAddObject:v9];
        }
        else
        {
          char v13 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
          [(PDFAnnotationAccessibilityElement *)self accessibilityFrame];
          objc_msgSend(v13, "setAccessibilityFrame:");
          double v14 = accessibilityLocalizedString(@"list.annotation");
          [v13 setAccessibilityLabel:v14];

          unint64_t v15 = [(PDFAnnotationAccessibilityElement *)self accessibilityValue];
          [v13 setAccessibilityValue:v15];

          double v16 = accessibilityLocalizedString(@"list.annotation.hint");
          [v13 setAccessibilityHint:v16];

          [v3 axSafelyAddObject:v13];
        }
      }
      [(PDFAnnotationAccessibilityElement *)self setCachedAXElements:v3];
    }
  }

  return v3;
}

- (id)_accessibilityLineStyleStringForLineStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = accessibilityLocalizedString(off_26513FCC8[a3 - 1]);
  }
  return v4;
}

- (id)_accessibilityAnnotationType
{
  v2 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v3 = [v2 valueForAnnotationKey:*MEMORY[0x263F147B0]];

  return v3;
}

- (id)_accessibilityAnnotationFieldType
{
  v2 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v3 = [v2 valueForAnnotationKey:*MEMORY[0x263F147B8]];

  return v3;
}

- (id)_accessibilityAnnotationWidgetTextLabel
{
  v2 = [(PDFAnnotationAccessibilityElement *)self annotation];
  uint64_t v3 = [v2 valueForAnnotationKey:*MEMORY[0x263F147C0]];

  return v3;
}

- (BOOL)_accessibilityIsButtonWidget
{
  v2 = [(PDFAnnotationAccessibilityElement *)self _accessibilityAnnotationFieldType];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F14840]];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(PDFAnnotationAccessibilityElement *)self accessibilityLabel];
  uint64_t v6 = [(PDFAnnotationAccessibilityElement *)self accessibilityValue];
  [(PDFAnnotationAccessibilityElement *)self accessibilityFrame];
  int v7 = NSStringFromCGRect(v12);
  uint64_t v8 = [(PDFAnnotationAccessibilityElement *)self annotation];
  int v9 = [v3 stringWithFormat:@"%@[%p] %@, %@ : %@\n\tAnnotation: %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (int)type
{
  return 507;
}

- (CGPDFTaggedNode)nodeRef
{
  return self->_nodeRef;
}

- (void)setNodeRef:(CGPDFTaggedNode *)a3
{
  self->_nodeRef = a3;
}

- (PDFAnnotation)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);

  return (PDFAnnotation *)WeakRetained;
}

- (void)setAnnotation:(id)a3
{
}

- (NSMutableArray)cachedAXElements
{
  return self->_cachedAXElements;
}

- (void)setCachedAXElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAXElements, 0);

  objc_destroyWeak((id *)&self->_annotation);
}

@end