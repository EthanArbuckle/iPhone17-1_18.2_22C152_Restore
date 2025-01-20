@interface UICGPDFNodeAccessibilityElement
+ (BOOL)_containsOnlyTextChildren:(id)a3;
+ (BOOL)_isValidTextFieldElement:(id)a3;
- (BOOL)_accessibilityInsertAnnotation:(id)a3;
- (BOOL)_accessibilityRemoveAnnotation:(id)a3;
- (BOOL)_isContainerOfOnlyOneLinkNodeChild;
- (BOOL)_isSubFigure;
- (BOOL)_pdfElementHasLinkContainer;
- (BOOL)isAccessibilityElement;
- (CGPDFTaggedNode)nodeRef;
- (CGRect)_axConvertBoundsFromScreenCoordinatesToPageView:(CGRect)a3;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameForScrolling;
- (CGRect)bounds;
- (NSMutableArray)cachedAXCaptionChildrenNodesOfFigureNode;
- (NSMutableArray)cachedAXElements;
- (NSMutableArray)cachedAXFigureChildrenNodesOfTableCellNode;
- (NSMutableArray)cachedAXPDFLinkNodes;
- (NSMutableArray)cachedAXPDFLinks;
- (NSMutableArray)cachedAXPDFOtherLinks;
- (NSMutableArray)cachedAXPDFTableCellNodes;
- (NSString)altText;
- (NSString)listStyle;
- (UICGPDFNodeAccessibilityElement)initWithAccessibilityContainer:(id)a3 pdfNodeRef:(CGPDFTaggedNode *)a4 withPage:(id)a5;
- (_NSRange)accessibilityColumnRange;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityHeadingLevel;
- (id)_accessibilityLinks;
- (id)_accessibilityPDFCustomLinksRotor;
- (id)_accessibilityStringForListType:(int)a3;
- (id)_attributedAccessibilityLabelForNode:(CGPDFTaggedNode *)a3;
- (id)_findCaptionChildrenNodesOfFigureNode:(id)a3;
- (id)_findFigureChildrenNodesOfTableCellNode:(id)a3;
- (id)_findLabelChildNodeOfListItem:(id)a3;
- (id)_findLinkChildrenNodesOfNode:(id)a3;
- (id)_findOverlappingChild:(CGRect)a3 children:(id)a4;
- (id)_findTOCIChildNodeOfNode:(id)a3;
- (id)_findTableCellNodesOfTableNode:(id)a3 withHeadersOnly:(BOOL)a4;
- (id)_getPDFPageView;
- (id)_paragraphLinksInNode:(id)a3;
- (id)accessibilityCustomRotors;
- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)accessibilityElements;
- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3;
- (id)accessibilityHeaderElementsForRow:(unint64_t)a3;
- (id)accessibilityIdentification;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (int)type;
- (int64_t)accessibilityContainerType;
- (int64_t)listItemNumber;
- (unint64_t)_findTraitsForTableCellElements;
- (unint64_t)accessibilityColumnCount;
- (unint64_t)accessibilityRowCount;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetPDFCustomLinksRotor:(id)a3;
- (void)_axHandleUpdateVisibility:(id)a3;
- (void)_axInsertChild:(id)a3 atIndex:(unint64_t)a4;
- (void)_axRemoveChild:(id)a3;
- (void)dealloc;
- (void)setAltText:(id)a3;
- (void)setCachedAXCaptionChildrenNodesOfFigureNode:(id)a3;
- (void)setCachedAXElements:(id)a3;
- (void)setCachedAXFigureChildrenNodesOfTableCellNode:(id)a3;
- (void)setCachedAXPDFLinkNodes:(id)a3;
- (void)setCachedAXPDFLinks:(id)a3;
- (void)setCachedAXPDFOtherLinks:(id)a3;
- (void)setCachedAXPDFTableCellNodes:(id)a3;
- (void)setListItemNumber:(int64_t)a3;
- (void)setListStyle:(id)a3;
- (void)setNodeRef:(CGPDFTaggedNode *)a3;
@end

@implementation UICGPDFNodeAccessibilityElement

- (id)_accessibilityPDFCustomLinksRotor
{
}

- (void)_accessibilitySetPDFCustomLinksRotor:(id)a3
{
}

- (UICGPDFNodeAccessibilityElement)initWithAccessibilityContainer:(id)a3 pdfNodeRef:(CGPDFTaggedNode *)a4 withPage:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)UICGPDFNodeAccessibilityElement;
  v6 = [(AXPDFNodeElement *)&v9 initWithAccessibilityContainer:a3 withPage:a5];
  if (a4)
  {
    CGPDFTaggedNodeRetain();
    [(UICGPDFNodeAccessibilityElement *)v6 setNodeRef:a4];
    [(UICGPDFNodeAccessibilityElement *)v6 setAltText:CGPDFTaggedNodeGetAltText()];
  }
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:v6 selector:sel__axHandleUpdateVisibility_ name:AXPDFVisibiltyUpdatedNotification object:0];

  return v6;
}

- (void)dealloc
{
  if ([(UICGPDFNodeAccessibilityElement *)self nodeRef])
  {
    [(UICGPDFNodeAccessibilityElement *)self nodeRef];
    CGPDFTaggedNodeRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)UICGPDFNodeAccessibilityElement;
  [(UICGPDFNodeAccessibilityElement *)&v3 dealloc];
}

- (int)type
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];

  return CGPDFTaggedNodeGetType();
}

- (id)accessibilityElements
{
  objc_super v3 = [(UICGPDFNodeAccessibilityElement *)self cachedAXElements];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x263EFF980] array];
    [(UICGPDFNodeAccessibilityElement *)self nodeRef];
    if (CGPDFTaggedNodeGetType())
    {
      [(UICGPDFNodeAccessibilityElement *)self nodeRef];
      uint64_t ChildCount = CGPDFTaggedNodeGetChildCount();
      if (ChildCount)
      {
        unint64_t v5 = ChildCount;
        unint64_t v6 = 0;
        do
        {
          [(UICGPDFNodeAccessibilityElement *)self nodeRef];
          if (CGPDFTaggedNodeGetType() == 300
            || ([(UICGPDFNodeAccessibilityElement *)self nodeRef],
                CGPDFTaggedNodeGetChildAtIndex(),
                CGPDFTaggedNodeGetType() != 301))
          {
            [(UICGPDFNodeAccessibilityElement *)self nodeRef];
            uint64_t ChildAtIndex = CGPDFTaggedNodeGetChildAtIndex();
            if (CGPDFTaggedNodeGetType() == 800)
            {
              v14 = [PDFAnnotationAccessibilityElement alloc];
              v15 = [(AXPDFNodeElement *)self page];
              v7 = [(PDFAnnotationAccessibilityElement *)v14 initWithAccessibilityContainer:self pdfNodeRef:ChildAtIndex withPage:v15];
            }
            else
            {
              v16 = [UICGPDFNodeAccessibilityElement alloc];
              v17 = [(AXPDFNodeElement *)self page];
              v7 = [(UICGPDFNodeAccessibilityElement *)v16 initWithAccessibilityContainer:self pdfNodeRef:ChildAtIndex withPage:v17];

              [(UICGPDFNodeAccessibilityElement *)self nodeRef];
              if (CGPDFTaggedNodeGetType() == 300) {
                [(UICGPDFListContainerAccessibilityElement *)v7 setListItemNumber:v6];
              }
            }
            [v3 axSafelyAddObject:v7];
            ++v6;
          }
          else
          {
            v7 = [[UICGPDFListContainerAccessibilityElement alloc] initWithAccessibilityContainer:self];
            v8 = [MEMORY[0x263EFF980] array];
            if (v6 < v5)
            {
              do
              {
                objc_super v9 = [UICGPDFNodeAccessibilityElement alloc];
                [(UICGPDFNodeAccessibilityElement *)self nodeRef];
                uint64_t v10 = CGPDFTaggedNodeGetChildAtIndex();
                v11 = [(AXPDFNodeElement *)self page];
                v12 = [(UICGPDFNodeAccessibilityElement *)v9 initWithAccessibilityContainer:v7 pdfNodeRef:v10 withPage:v11];

                [(UICGPDFNodeAccessibilityElement *)v12 setListItemNumber:v6];
                [v8 axSafelyAddObject:v12];

                ++v6;
              }
              while (v5 != v6);
              unint64_t v6 = v5;
            }
            [(UICGPDFListContainerAccessibilityElement *)v7 setAccessibilityElements:v8];
            [v3 axSafelyAddObject:v7];
          }
        }
        while (v6 < v5);
      }
      [(UICGPDFNodeAccessibilityElement *)self setCachedAXElements:v3];
    }
  }

  return v3;
}

- (CGRect)accessibilityFrameForScrolling
{
  [(UICGPDFNodeAccessibilityElement *)self accessibilityFrame];

  return CGRectInset(*(CGRect *)&v2, 0.0, -80.0);
}

- (CGRect)bounds
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];

  CGPDFTaggedNodeGetBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  CGPDFTaggedNodeGetBounds();

  -[AXPDFNodeElement axConvertBoundsFromPageToScreenCoordinates:](self, "axConvertBoundsFromPageToScreenCoordinates:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)accessibilityLabel
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  int Type = CGPDFTaggedNodeGetType();
  if (Type == 301)
  {
    double v4 = [(UICGPDFNodeAccessibilityElement *)self _attributedAccessibilityLabelForNode:[(UICGPDFNodeAccessibilityElement *)self nodeRef]];
    double v5 = [(UICGPDFNodeAccessibilityElement *)self _findLabelChildNodeOfListItem:self];
    double v6 = v5;
    if (!v5)
    {
LABEL_21:

      goto LABEL_22;
    }
    [v5 nodeRef];
    CGPDFTaggedNodeGetTextRange();
    uint64_t v8 = v7;
    [(UICGPDFNodeAccessibilityElement *)self nodeRef];
    CGPDFTaggedNodeGetTextRange();
    uint64_t v10 = v9;
    [(UICGPDFNodeAccessibilityElement *)self nodeRef];
    v11 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityStringForListType:CGPDFTaggedNodeGetListStyle()];
    if (v11)
    {
      v12 = objc_msgSend(v4, "attributedSubstringFromRange:", v8, v10 - v8);

      [v12 setAttribute:v11 forKey:*MEMORY[0x263F217C0]];
      v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[UICGPDFNodeAccessibilityElement listItemNumber](self, "listItemNumber"));
      [v12 setAttribute:v13 forKey:*MEMORY[0x263F217B8]];

      double v4 = v12;
    }
LABEL_5:

    goto LABEL_21;
  }
  if ((Type & 0xFFFFFFFE) == 0x192)
  {
    double v4 = [(UICGPDFNodeAccessibilityElement *)self _attributedAccessibilityLabelForNode:[(UICGPDFNodeAccessibilityElement *)self nodeRef]];
    if (!v4)
    {
      double v4 = [MEMORY[0x263F21660] string];
    }
    double v6 = [(UICGPDFNodeAccessibilityElement *)self cachedAXFigureChildrenNodesOfTableCellNode];
    if (!v6)
    {
      double v6 = [(UICGPDFNodeAccessibilityElement *)self _findFigureChildrenNodesOfTableCellNode:self];
      v14 = (void *)[v6 mutableCopy];
      [(UICGPDFNodeAccessibilityElement *)self setCachedAXFigureChildrenNodesOfTableCellNode:v14];
    }
    if (![v6 count]) {
      goto LABEL_21;
    }
    v15 = UIAXStringForAllChildren();
    [v4 appendStringOrAXAttributedString:v15];
    goto LABEL_20;
  }
  if (Type == 107)
  {
    uint64_t v20 = accessibilityLocalizedString(@"table.of.contents");
  }
  else
  {
    if (Type == 700)
    {
      double v6 = [(UICGPDFNodeAccessibilityElement *)self cachedAXCaptionChildrenNodesOfFigureNode];
      if (!v6)
      {
        double v6 = [(UICGPDFNodeAccessibilityElement *)self _findCaptionChildrenNodesOfFigureNode:self];
        v16 = (void *)[v6 mutableCopy];
        [(UICGPDFNodeAccessibilityElement *)self setCachedAXCaptionChildrenNodesOfFigureNode:v16];
      }
      if (![v6 count])
      {
        v17 = [(UICGPDFNodeAccessibilityElement *)self altText];
        uint64_t v18 = [v17 length];

        if (!v18)
        {
          v11 = [(UICGPDFNodeAccessibilityElement *)self _attributedAccessibilityLabelForNode:[(UICGPDFNodeAccessibilityElement *)self nodeRef]];
          if ([v11 length])
          {
            id v21 = v11;
          }
          else
          {
            v24.receiver = self;
            v24.super_class = (Class)UICGPDFNodeAccessibilityElement;
            id v21 = [(UICGPDFNodeAccessibilityElement *)&v24 accessibilityLabel];
          }
          double v4 = v21;
          goto LABEL_5;
        }
      }
      v15 = [(UICGPDFNodeAccessibilityElement *)self altText];
      v22 = MEMORY[0x245659C00](v6);
      double v4 = __UIAXStringForVariables();

LABEL_20:
      goto LABEL_21;
    }
    if (+[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:self])
    {
      uint64_t v20 = [(UICGPDFNodeAccessibilityElement *)self _attributedAccessibilityLabelForNode:[(UICGPDFNodeAccessibilityElement *)self nodeRef]];
    }
    else
    {
      v23.receiver = self;
      v23.super_class = (Class)UICGPDFNodeAccessibilityElement;
      uint64_t v20 = [(UICGPDFNodeAccessibilityElement *)&v23 accessibilityLabel];
    }
  }
  double v4 = (void *)v20;
LABEL_22:

  return v4;
}

- (unint64_t)accessibilityTraits
{
  double v3 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityValueForKey:@"StoredTraits"];
  double v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 unsignedLongLongValue];
    goto LABEL_16;
  }
  v14.receiver = self;
  v14.super_class = (Class)UICGPDFNodeAccessibilityElement;
  unint64_t v6 = [(UICGPDFNodeAccessibilityElement *)&v14 accessibilityTraits];
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  int Type = CGPDFTaggedNodeGetType();
  if (Type <= 401)
  {
    if ((Type - 201) >= 7) {
      goto LABEL_7;
    }
    uint64_t v8 = (void *)MEMORY[0x263F1CEF8];
    goto LABEL_6;
  }
  switch(Type)
  {
    case 402:
      unint64_t v13 = [(UICGPDFNodeAccessibilityElement *)self _findTraitsForTableCellElements];
      v6 |= v13 | *MEMORY[0x263F1CEF8];
      break;
    case 403:
      v6 |= [(UICGPDFNodeAccessibilityElement *)self _findTraitsForTableCellElements];
      break;
    case 700:
      uint64_t v8 = (void *)MEMORY[0x263F1CF00];
LABEL_6:
      v6 |= *v8;
      break;
  }
LABEL_7:
  if ([(UICGPDFNodeAccessibilityElement *)self _isContainerOfOnlyOneLinkNodeChild]
    || [(UICGPDFNodeAccessibilityElement *)self _pdfElementHasLinkContainer])
  {
    v6 |= *MEMORY[0x263F1CF10];
  }
  if ([(AXPDFNodeElement *)self pdfViewRequiresPageTurning]
    && [(AXPDFNodeElement *)self isLastNodeInPage])
  {
    v6 |= *MEMORY[0x263F1CEF0];
  }
  BOOL v9 = [(UICGPDFNodeAccessibilityElement *)self isAccessibilityElement];
  uint64_t v10 = *MEMORY[0x263F813E8];
  if (v9) {
    uint64_t v10 = 0;
  }
  unint64_t v5 = v10 | v6;
  v11 = [NSNumber numberWithUnsignedLongLong:v5];
  [(UICGPDFNodeAccessibilityElement *)self _accessibilitySetRetainedValue:v11 forKey:@"StoredTraits"];

LABEL_16:
  return v5;
}

- (BOOL)isAccessibilityElement
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  CGPDFTaggedNodeGetBounds();
  if (CGRectIsNull(v13)) {
    return 0;
  }
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  int Type = CGPDFTaggedNodeGetType();
  BOOL v3 = 1;
  if (Type <= 401)
  {
    if (Type == 108)
    {
      uint64_t v10 = [(UICGPDFNodeAccessibilityElement *)self _findTOCIChildNodeOfNode:self];
      BOOL v3 = v10 == 0;

      return v3;
    }
    if (Type == 301) {
      return v3;
    }
  }
  else
  {
    if ((Type - 402) < 2) {
      return v3;
    }
    if (Type == 700)
    {
      unint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self cachedAXCaptionChildrenNodesOfFigureNode];
      unint64_t v6 = [(UICGPDFNodeAccessibilityElement *)self _attributedAccessibilityLabelForNode:[(UICGPDFNodeAccessibilityElement *)self nodeRef]];
      if ([v6 length])
      {
LABEL_13:

        return v3;
      }
      if (!v5)
      {
        unint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self _findCaptionChildrenNodesOfFigureNode:self];
        uint64_t v7 = (void *)[v5 mutableCopy];
        [(UICGPDFNodeAccessibilityElement *)self setCachedAXCaptionChildrenNodesOfFigureNode:v7];
      }
      uint64_t v8 = [(UICGPDFNodeAccessibilityElement *)self altText];
      if ([v8 length] || objc_msgSend(v5, "count"))
      {

LABEL_12:
        BOOL v3 = 1;
        goto LABEL_13;
      }
      [(UICGPDFNodeAccessibilityElement *)self nodeRef];
      if (CGPDFTaggedNodeIsImageFigure())
      {
        BOOL v11 = [(UICGPDFNodeAccessibilityElement *)self _isSubFigure];

        if (!v11) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      BOOL v3 = 0;
      goto LABEL_13;
    }
  }

  return +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:self];
}

- (id)accessibilityLanguage
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetLanguageText())
  {
    [(UICGPDFNodeAccessibilityElement *)self nodeRef];
    BOOL v3 = CGPDFTaggedNodeGetLanguageText();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UICGPDFNodeAccessibilityElement;
    BOOL v3 = [(UICGPDFNodeAccessibilityElement *)&v5 accessibilityLanguage];
  }

  return v3;
}

- (int64_t)accessibilityContainerType
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() == 400) {
    return 1;
  }
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() == 300) {
    return 2;
  }
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() == 107) {
    return 14;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICGPDFNodeAccessibilityElement;
  return [(UICGPDFNodeAccessibilityElement *)&v4 accessibilityContainerType];
}

- (id)accessibilityIdentification
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  int Type = CGPDFTaggedNodeGetType();
  int v3 = Type;
  if (Type > 399)
  {
    if (Type > 599)
    {
      if (Type > 699)
      {
        switch(Type)
        {
          case 700:
            return @"AX_Tagged_Node_Figure";
          case 701:
            return @"AX_Tagged_Node_Formula";
          case 702:
            return @"AX_Tagged_Node_Form";
          default:
            return @"AX_Tagged_Unknown";
        }
      }
      else
      {
        switch(Type)
        {
          case 600:
            id result = @"AX_Tagged_Node_Ruby";
            break;
          case 601:
            id result = @"AX_Tagged_Node_Ruby_B";
            break;
          case 602:
            id result = @"AX_Tagged_Node_Ruby_T";
            break;
          case 603:
            id result = @"AX_Tagged_Node_Ruby_Punctuation";
            break;
          case 604:
            id result = @"AX_Tagged_Node_Warichu";
            break;
          case 605:
            id result = @"AX_Tagged_Node_Warichu_T";
            break;
          case 606:
            id result = @"AX_Tagged_Node_Warichu_Punctuation";
            break;
          default:
            return @"AX_Tagged_Unknown";
        }
      }
    }
    else
    {
      switch(Type)
      {
        case 500:
          id result = @"AX_Tagged_Node_Span";
          break;
        case 501:
          id result = @"AX_Tagged_Node_Quote";
          break;
        case 502:
          id result = @"AX_Tagged_Node_Note";
          break;
        case 503:
          id result = @"AX_Tagged_Node_Reference";
          break;
        case 504:
          id result = @"AX_Tagged_Node_BibEntry";
          break;
        case 505:
          id result = @"AX_Tagged_Node_Code";
          break;
        case 506:
          id result = @"AX_Tagged_Node_Link";
          break;
        case 507:
          id result = @"AX_Tagged_Node_Annotation";
          break;
        default:
          switch(Type)
          {
            case 400:
              id result = @"AX_Tagged_Node_Table";
              break;
            case 401:
              id result = @"AX_Tagged_Node_Table_Row";
              break;
            case 402:
              id result = @"AX_Tagged_Node_Table_Header_Cell";
              break;
            case 403:
              id result = @"AX_Tagged_Node_Table_Data_Cell";
              break;
            case 404:
              id result = @"AX_Tagged_Node_Table_Header";
              break;
            case 405:
              id result = @"AX_Tagged_Node_Table_Body";
              break;
            case 406:
              id result = @"AX_Tagged_Node_Table_Footer";
              break;
            default:
              return @"AX_Tagged_Unknown";
          }
          break;
      }
    }
  }
  else
  {
    id result = @"AX_Tagged_Node_Paragraph";
    if (v3 > 199)
    {
      switch(v3)
      {
        case 200:
          return result;
        case 201:
          id result = @"AX_Tagged_Node_Heading";
          break;
        case 202:
          id result = @"AX_Tagged_Node_Heading_Level_1";
          break;
        case 203:
          id result = @"AX_Tagged_Node_Heading_Level_2";
          break;
        case 204:
          id result = @"AX_Tagged_Node_Heading_Level_3";
          break;
        case 205:
          id result = @"AX_Tagged_Node_Heading_Level_4";
          break;
        case 206:
          id result = @"AX_Tagged_Node_Heading_Level_5";
          break;
        case 207:
          id result = @"AX_Tagged_Node_Heading_Level_6";
          break;
        default:
          switch(v3)
          {
            case 300:
              id result = @"AX_Tagged_Node_List_Container";
              break;
            case 301:
              id result = @"AX_Tagged_Node_List_Item";
              break;
            case 302:
              id result = @"AX_Tagged_Node_List_Item_Label";
              break;
            case 303:
              id result = @"AX_Tagged_Node_List_Item_Body";
              break;
            default:
              return @"AX_Tagged_Unknown";
          }
          break;
      }
    }
    else
    {
      switch(v3)
      {
        case 'd':
          id result = @"AX_Tagged_Node_Document";
          break;
        case 'e':
          id result = @"AX_Tagged_Node_Part";
          break;
        case 'f':
          id result = @"AX_Tagged_Node_Art";
          break;
        case 'g':
          id result = @"AX_Tagged_Node_Sect";
          break;
        case 'h':
          id result = @"AX_Tagged_Node_Div";
          break;
        case 'i':
          id result = @"AX_Tagged_Node_BlockQuote";
          break;
        case 'j':
          id result = @"AX_Tagged_Node_Captioh";
          break;
        case 'k':
          id result = @"AX_Tagged_Node_Table_of_Contents";
          break;
        case 'l':
          id result = @"AX_Tagged_Node_Table_of_Contents_Item";
          break;
        case 'm':
          id result = @"AX_Tagged_Node_Index";
          break;
        case 'n':
          id result = @"AX_Tagged_Node_NonStruct";
          break;
        case 'o':
          id result = @"AX_Tagged_Node_Private";
          break;
        default:
          if (v3)
          {
            if (v3 != 1) {
              return @"AX_Tagged_Unknown";
            }
            id result = @"AX_Tagged_Node_Word";
          }
          break;
      }
    }
  }
  return result;
}

- (id)accessibilityCustomRotors
{
  v15[1] = *MEMORY[0x263EF8340];
  int v3 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityLinks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityPDFCustomLinksRotor];
    if (!v5)
    {
      objc_initWeak(&location, self);
      id v6 = objc_alloc(MEMORY[0x263F1C398]);
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      BOOL v11 = __60__UICGPDFNodeAccessibilityElement_accessibilityCustomRotors__block_invoke;
      v12 = &unk_26513FD40;
      objc_copyWeak(&v13, &location);
      objc_super v5 = (void *)[v6 initWithSystemType:1 itemSearchBlock:&v9];
      -[UICGPDFNodeAccessibilityElement _accessibilitySetPDFCustomLinksRotor:](self, "_accessibilitySetPDFCustomLinksRotor:", v5, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    v15[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __60__UICGPDFNodeAccessibilityElement_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    uint64_t v7 = [v6 _accessibilityLinks];

    if ([v7 count])
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v9 = [v8 _accessibilityCustomRotorResultHelper:v3 array:v7];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)accessibilityRowCount
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() != 400) {
    return 0;
  }
  id v3 = [(UICGPDFNodeAccessibilityElement *)self nodeRef];

  return MEMORY[0x270F1B6C0](v3);
}

- (unint64_t)accessibilityColumnCount
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() != 400) {
    return 0;
  }
  id v3 = [(UICGPDFNodeAccessibilityElement *)self nodeRef];

  return MEMORY[0x270F1B6B8](v3);
}

- (id)accessibilityHeaderElementsForRow:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_super v5 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  id v6 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFTableCellNodes];
  if (!v6)
  {
    id v6 = [(UICGPDFNodeAccessibilityElement *)self _findTableCellNodesOfTableNode:v5 withHeadersOnly:1];
    uint64_t v7 = (void *)[v6 mutableCopy];
    [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFTableCellNodes:v7];
  }
  id v8 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v14 accessibilityRowRange] == a3) {
          [v8 axSafelyAddObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        if (*(UICGPDFNodeAccessibilityElement **)(*((void *)&v23 + 1) + 8 * j) == self)
        {

          objc_msgSend(MEMORY[0x263EFF8C0], "array", (void)v23);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v20 = v15;
LABEL_22:
  id v21 = v20;

  return v21;
}

BOOL __69__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForRow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityContainerType] == 1;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v5 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityFindAncestor:&__block_literal_global_450 startWithSelf:0];
  id v6 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFTableCellNodes];
  if (!v6)
  {
    id v6 = [(UICGPDFNodeAccessibilityElement *)self _findTableCellNodesOfTableNode:v5 withHeadersOnly:1];
    uint64_t v7 = (void *)[v6 mutableCopy];
    [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFTableCellNodes:v7];
  }
  id v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_452, 1, (void)v18);
        if ([v14 accessibilityColumnRange] == a3 && v15 != 0) {
          [v8 axSafelyAddObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

BOOL __72__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForColumn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityContainerType] == 1;
}

BOOL __72__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForColumn___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 nodeRef];
    BOOL v3 = CGPDFTaggedNodeGetType() == 404;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(UICGPDFNodeAccessibilityElement *)self _accessibilityFindAncestor:&__block_literal_global_454 startWithSelf:0];
  [(UICGPDFNodeAccessibilityElement *)self _findTableCellNodesOfTableNode:v7 withHeadersOnly:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "nodeRef", (void)v16);
        if (CGPDFTaggedNodeGetTableCellColumnSpan() == a4)
        {
          [v13 nodeRef];
          if (CGPDFTaggedNodeGetTableCellRowSpan() == a3)
          {
            id v14 = v13;
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

BOOL __82__UICGPDFNodeAccessibilityElement_accessibilityDataTableCellElementForRow_column___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityContainerType] == 1;
}

- (_NSRange)accessibilityRowRange
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if ((int)CGPDFTaggedNodeGetType() < 401
    || ([(UICGPDFNodeAccessibilityElement *)self nodeRef], (int)CGPDFTaggedNodeGetType() > 406)
    || ([(UICGPDFNodeAccessibilityElement *)self nodeRef],
        NSUInteger TableCellRowSpan = CGPDFTaggedNodeGetTableCellRowSpan(),
        TableCellRowSpan == 0x7FFFFFFF)
    || TableCellRowSpan == -1)
  {
    NSUInteger v4 = 0;
    NSUInteger TableCellRowSpan = 0x7FFFFFFFLL;
  }
  result.length = v4;
  result.id location = TableCellRowSpan;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if ((int)CGPDFTaggedNodeGetType() < 401
    || ([(UICGPDFNodeAccessibilityElement *)self nodeRef], (int)CGPDFTaggedNodeGetType() > 406)
    || ([(UICGPDFNodeAccessibilityElement *)self nodeRef],
        NSUInteger TableCellColumnSpan = CGPDFTaggedNodeGetTableCellColumnSpan(),
        TableCellColumnSpan == 0x7FFFFFFF)
    || TableCellColumnSpan == -1)
  {
    NSUInteger v4 = 0;
    NSUInteger TableCellColumnSpan = 0x7FFFFFFFLL;
  }
  result.length = v4;
  result.id location = TableCellColumnSpan;
  return result;
}

- (void)_axHandleUpdateVisibility:(id)a3
{
  NSUInteger v4 = [a3 name];
  int v5 = [v4 isEqualToString:AXPDFVisibiltyUpdatedNotification];

  if (v5)
  {
    [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFOtherLinks:0];
  }
}

- (id)_accessibilityHeadingLevel
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  switch(CGPDFTaggedNodeGetType())
  {
    case 0xC9u:
      v5.receiver = self;
      v5.super_class = (Class)UICGPDFNodeAccessibilityElement;
      BOOL v3 = [(UICGPDFNodeAccessibilityElement *)&v5 _accessibilityHeadingLevel];
      break;
    case 0xCAu:
      BOOL v3 = &unk_26F75C438;
      break;
    case 0xCBu:
      BOOL v3 = &unk_26F75C450;
      break;
    case 0xCCu:
      BOOL v3 = &unk_26F75C468;
      break;
    case 0xCDu:
      BOOL v3 = &unk_26F75C480;
      break;
    case 0xCEu:
      BOOL v3 = &unk_26F75C498;
      break;
    case 0xCFu:
      BOOL v3 = &unk_26F75C4B0;
      break;
    default:
      BOOL v3 = 0;
      break;
  }

  return v3;
}

- (id)_accessibilityStringForListType:(int)a3
{
  if (a3 == 257)
  {
    NSUInteger v4 = accessibilityLocalizedString(@"bullet");
  }
  else
  {
    NSUInteger v4 = 0;
  }
  return v4;
}

+ (BOOL)_containsOnlyTextChildren:(id)a3
{
  uint64_t v3 = [a3 accessibilityElements];
  unint64_t v4 = [v3 count];
  if (v4 >= 0x64) {
    uint64_t v5 = 100;
  }
  else {
    uint64_t v5 = v4;
  }
  if (!v5)
  {
LABEL_20:
    int v13 = 2;
    char v14 = 1;
    goto LABEL_27;
  }
  uint64_t v6 = 0;
  int v7 = 0;
  while (1)
  {
    id v8 = [v3 objectAtIndex:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      int v13 = 1;
      goto LABEL_25;
    }
    int v10 = [v8 type];
    BOOL v11 = !v6 && v10 == 1;
    BOOL v12 = v11;
    v7 |= v12;
    if ((v7 & 1) == 0) {
      break;
    }
    if (v10 != 1)
    {
      if (v10 == 700)
      {
        [v8 nodeRef];
        char isKindOfClass = CGPDFTaggedNodeIsImageFigure();
      }
LABEL_24:
      int v13 = 2;
LABEL_25:
      char v14 = isKindOfClass ^ 1;
      goto LABEL_26;
    }
LABEL_19:

    if (v5 == ++v6) {
      goto LABEL_20;
    }
  }
  if (v10 != 200 && !IsCGPDFTaggedNodeTypeInline()) {
    goto LABEL_24;
  }
  if (+[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:v8])
  {
    goto LABEL_19;
  }
  char v14 = 0;
  int v13 = 2;
LABEL_26:

LABEL_27:
  return (v13 == 2) & v14;
}

- (id)_attributedAccessibilityLabelForNode:(CGPDFTaggedNode *)a3
{
  String = (void *)CGPDFTaggedNodeCreateString();
  uint64_t v5 = [MEMORY[0x263F21660] axAttributedStringWithString:String];
  uint64_t v6 = [(UICGPDFNodeAccessibilityElement *)self accessibilityLanguage];

  if (v6)
  {
    uint64_t TextRange = CGPDFTaggedNodeGetTextRange();
    uint64_t v9 = v8;
    if (TextRange == -1) {
      uint64_t v10 = 0x7FFFFFFFLL;
    }
    else {
      uint64_t v10 = TextRange;
    }
    BOOL v11 = [(UICGPDFNodeAccessibilityElement *)self accessibilityLanguage];
    objc_msgSend(v5, "setAttribute:forKey:withRange:", v11, *MEMORY[0x263F217F0], v10, v9);
  }
  BOOL v12 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFLinks];
  if ([v12 count])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__UICGPDFNodeAccessibilityElement__attributedAccessibilityLabelForNode___block_invoke;
    v14[3] = &unk_26513FD88;
    id v15 = v5;
    [v12 enumerateObjectsUsingBlock:v14];
  }

  return v5;
}

void __72__UICGPDFNodeAccessibilityElement__attributedAccessibilityLabelForNode___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 nodeRef];
    uint64_t TextRange = CGPDFTaggedNodeGetTextRange();
    if (TextRange == -1) {
      uint64_t v5 = 0x7FFFFFFFLL;
    }
    else {
      uint64_t v5 = TextRange;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v5 = [v6 range];
  }
  objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:withRange:", MEMORY[0x263EFFA88], *MEMORY[0x263F217B0], v5, v4);
LABEL_8:
}

- (BOOL)_isSubFigure
{
  uint64_t v3 = [(UICGPDFNodeAccessibilityElement *)self accessibilityContainer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self accessibilityContainer];
  [v5 nodeRef];
  if (CGPDFTaggedNodeGetType() == 700)
  {
    [v5 nodeRef];
    char IsImageFigure = CGPDFTaggedNodeIsImageFigure();
  }
  else
  {
    char IsImageFigure = 0;
  }

  return IsImageFigure;
}

+ (BOOL)_isValidTextFieldElement:(id)a3
{
  id v3 = a3;
  if (!v3 || (MEMORY[0x245659980](@"UICGPDFNodeAccessibilityElement"), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  uint64_t v4 = __UIAccessibilityCastAsClass();
  [v4 nodeRef];
  int Type = CGPDFTaggedNodeGetType();

  if (Type != 200)
  {
    if ((IsCGPDFTaggedNodeTypeHeader() & 1) == 0 && (IsCGPDFTaggedNodeTypeIllustration() & 1) == 0)
    {
      BOOL v6 = 0;
      IsCGPDFTaggedNodeTypeGroup();
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v6 = +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:v3];
LABEL_8:

  return v6;
}

- (id)_accessibilityLinks
{
  id v3 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFLinks];
  if (!v3)
  {
    if ([(UICGPDFNodeAccessibilityElement *)self isAccessibilityElement]
      && ![(UICGPDFNodeAccessibilityElement *)self _isContainerOfOnlyOneLinkNodeChild])
    {
      id v3 = [MEMORY[0x263EFF980] array];
      uint64_t v4 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFLinkNodes];
      if (!v4)
      {
        uint64_t v4 = [(UICGPDFNodeAccessibilityElement *)self _findLinkChildrenNodesOfNode:self];
        [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFLinkNodes:v4];
      }
      [v3 axSafelyAddObjectsFromArray:v4];
      uint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self _paragraphLinksInNode:self];
      [v3 axSafelyAddObjectsFromArray:v5];

      [v3 enumerateObjectsUsingBlock:&__block_literal_global_478];
      [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFLinks:v3];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

uint64_t __54__UICGPDFNodeAccessibilityElement__accessibilityLinks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessibilityTraits:*MEMORY[0x263F1CF10]];
}

- (BOOL)_isContainerOfOnlyOneLinkNodeChild
{
  [(UICGPDFNodeAccessibilityElement *)self nodeRef];
  if (CGPDFTaggedNodeGetType() == 506) {
    return 1;
  }
  uint64_t v4 = [(UICGPDFNodeAccessibilityElement *)self cachedAXPDFLinkNodes];
  if (!v4)
  {
    uint64_t v4 = [(UICGPDFNodeAccessibilityElement *)self _findLinkChildrenNodesOfNode:self];
    [(UICGPDFNodeAccessibilityElement *)self setCachedAXPDFLinkNodes:v4];
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self accessibilityLabel];
    BOOL v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v7 = [v5 stringByTrimmingCharactersInSet:v6];

    uint64_t v8 = [v4 objectAtIndex:0];
    uint64_t v9 = [(id)v8 accessibilityLabel];
    uint64_t v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    BOOL v11 = [v9 stringByTrimmingCharactersInSet:v10];

    LOBYTE(v8) = [v7 isEqualToString:v11];
    if (v8) {
      return 1;
    }
  }
  else
  {
  }
  BOOL v12 = [(UICGPDFNodeAccessibilityElement *)self _paragraphLinksInNode:self];
  if ([v12 count] == 1)
  {
    int v13 = [(UICGPDFNodeAccessibilityElement *)self accessibilityLabel];
    char v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v15 = [v13 stringByTrimmingCharactersInSet:v14];

    long long v16 = [v12 objectAtIndex:0];
    long long v17 = [v16 accessibilityLabel];
    long long v18 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    long long v19 = [v17 stringByTrimmingCharactersInSet:v18];

    char v3 = [v15 isEqualToString:v19];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_pdfElementHasLinkContainer
{
  id v2 = [(UICGPDFNodeAccessibilityElement *)self accessibilityContainer];
  objc_opt_class();
  BOOL v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    [v2 nodeRef];
    if (CGPDFTaggedNodeGetType() == 506) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (id)_getPDFPageView
{
  id v2 = [(UICGPDFNodeAccessibilityElement *)self accessibilityContainer];
  if (v2)
  {
    do
    {
      MEMORY[0x245659980](@"PDFPageView");
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 accessibilityContainer];

      id v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (CGRect)_axConvertBoundsFromScreenCoordinatesToPageView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(UICGPDFNodeAccessibilityElement *)self _getPDFPageView];
  uint64_t v9 = [(AXPDFNodeElement *)self pdfView];
  uint64_t v10 = [v8 safeValueForKey:@"page"];
  BOOL v11 = [v9 window];
  objc_msgSend(v11, "convertRect:toView:", v9, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v9, "convertRect:toPage:", v10, v13, v15, v17, v19);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (BOOL)_accessibilityInsertAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self accessibilityElements];
  [v4 accessibilityFrame];
  -[UICGPDFNodeAccessibilityElement _axConvertBoundsFromScreenCoordinatesToPageView:](self, "_axConvertBoundsFromScreenCoordinatesToPageView:");
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v14 = -[UICGPDFNodeAccessibilityElement _findOverlappingChild:children:](self, "_findOverlappingChild:children:", v5);
  double v15 = v14;
  if (v14)
  {
    if ([v14 type] == 200)
    {
      if (_accessibilityInsertAnnotation__onceToken != -1) {
        dispatch_once(&_accessibilityInsertAnnotation__onceToken, &__block_literal_global_488);
      }
      [v15 nodeRef];
      CGPDFTaggedNodeGetBounds();
      double x = v65.origin.x;
      v68.origin.double x = v7;
      v68.origin.double y = v9;
      v68.size.double width = v11;
      v68.size.double height = v13;
      CGRect v66 = CGRectIntersection(v65, v68);
      double v17 = v66.origin.x;
      double y = v66.origin.y;
      double width = v66.size.width;
      double height = v66.size.height;
      [(UICGPDFNodeAccessibilityElement *)self nodeRef];
      uint64_t StringRange = CGPDFTaggedNodeGetStringRange();
      uint64_t v62 = v22;
      unint64_t v63 = StringRange;
      double v23 = self;
      double v24 = [(AXPDFNodeElement *)v23 page];
      double v25 = objc_msgSend(v24, "selectionForRect:", v17, y, width, height);
      v64 = v24;
      unint64_t v26 = [v25 rangeAtIndex:0 onPage:v24];
      uint64_t v28 = v27;
      double v29 = [v25 string];
      if ([v29 length])
      {
        uint64_t v30 = 0;
        while ((objc_msgSend((id)_accessibilityInsertAnnotation__charsToRemove, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", v30)) & 1) != 0)
        {
          if (++v30 >= (unint64_t)[v29 length]) {
            goto LABEL_9;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          -[UICGPDFNodeAccessibilityElement _accessibilityInsertAnnotation:]();
        }
        LOBYTE(CopyWithStringRange) = 0;
        goto LABEL_34;
      }
LABEL_9:
      double v31 = [(UICGPDFNodeAccessibilityElement *)v23 accessibilityElements];
      uint64_t v61 = [v31 indexOfObject:v15];

      [(UICGPDFNodeAccessibilityElement *)v23 _axRemoveChild:v15];
      if (v28)
      {
        unint64_t v32 = v26 + v28;
      }
      else
      {
        v48 = objc_msgSend(v64, "selectionForRect:", x, y, v17 - x, height * 0.5);

        uint64_t v49 = [v48 rangeAtIndex:0 onPage:v64];
        unint64_t v26 = v49 + v50;
        unint64_t v32 = v49 + v50 + 1;
        double v25 = v48;
      }
      unint64_t v51 = v63;
      if (v26 <= v63)
      {
        uint64_t v55 = v61;
      }
      else
      {
        [v15 nodeRef];
        CopyWithuint64_t StringRange = (const void *)CGPDFTaggedNodeCreateCopyWithStringRange();
        if (!CopyWithStringRange) {
          goto LABEL_34;
        }
        v52 = [UICGPDFNodeAccessibilityElement alloc];
        v53 = [(AXPDFNodeElement *)v23 page];
        v54 = [(UICGPDFNodeAccessibilityElement *)v52 initWithAccessibilityContainer:v23 pdfNodeRef:CopyWithStringRange withPage:v53];

        CFRelease(CopyWithStringRange);
        uint64_t v55 = v61 + 1;
        -[UICGPDFNodeAccessibilityElement _axInsertChild:atIndex:](v23, "_axInsertChild:atIndex:", v54);

        unint64_t v51 = v63;
      }
      [(UICGPDFNodeAccessibilityElement *)v23 _axInsertChild:v4 atIndex:v55];
      if (v51 + v62 - 1 <= v32)
      {
LABEL_33:
        LOBYTE(CopyWithStringRange) = 1;
        goto LABEL_34;
      }
      [v15 nodeRef];
      CopyWithuint64_t StringRange = (const void *)CGPDFTaggedNodeCreateCopyWithStringRange();
      if (CopyWithStringRange)
      {
        uint64_t v56 = v55 + 1;
        v57 = [UICGPDFNodeAccessibilityElement alloc];
        v58 = [(AXPDFNodeElement *)v23 page];
        v59 = [(UICGPDFNodeAccessibilityElement *)v57 initWithAccessibilityContainer:v23 pdfNodeRef:CopyWithStringRange withPage:v58];

        CFRelease(CopyWithStringRange);
        [(UICGPDFNodeAccessibilityElement *)v23 _axInsertChild:v59 atIndex:v56];

        goto LABEL_33;
      }
LABEL_34:

      goto LABEL_35;
    }
    LOBYTE(CopyWithStringRange) = [v15 _accessibilityInsertAnnotation:v4];
  }
  else
  {
    v67.origin.double x = v7;
    v67.origin.double y = v9;
    v67.size.double width = v11;
    v67.size.double height = v13;
    double MinY = CGRectGetMinY(v67);
    uint64_t v34 = 0;
    if ([v5 count])
    {
      double v35 = (double)(unint64_t)MinY;
      double v36 = (double)(unint64_t)(v13 * 0.25 + v35);
      unsigned int v37 = 1;
      do
      {
        v38 = [v5 objectAtIndex:v34];
        [v38 accessibilityFrame];
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;

        if (v42 < v35)
        {
          double v45 = v42 + v44;
          BOOL v46 = v42 + v44 >= v36 && v40 <= v7;
          if (!v46) {
            break;
          }
        }
        uint64_t v34 = v37;
        BOOL v46 = objc_msgSend(v5, "count", v45) > (unint64_t)v37++;
      }
      while (v46);
    }
    [(UICGPDFNodeAccessibilityElement *)self _axInsertChild:v4 atIndex:v34];
    LOBYTE(CopyWithStringRange) = 1;
  }
LABEL_35:

  return (char)CopyWithStringRange;
}

uint64_t __66__UICGPDFNodeAccessibilityElement__accessibilityInsertAnnotation___block_invoke()
{
  _accessibilityInsertAnnotation__charsToRemove = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" _"];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityRemoveAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UICGPDFNodeAccessibilityElement *)self accessibilityElements];
  [v4 accessibilityFrame];
  -[UICGPDFNodeAccessibilityElement _axConvertBoundsFromScreenCoordinatesToPageView:](self, "_axConvertBoundsFromScreenCoordinatesToPageView:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if ([v5 containsObject:v4])
  {
    [(UICGPDFNodeAccessibilityElement *)self _axRemoveChild:v4];
    char v14 = 1;
  }
  else
  {
    double v15 = -[UICGPDFNodeAccessibilityElement _findOverlappingChild:children:](self, "_findOverlappingChild:children:", v5, v7, v9, v11, v13);
    double v16 = v15;
    if (v15) {
      char v14 = [v15 _accessibilityRemoveAnnotation:v4];
    }
    else {
      char v14 = 0;
    }
  }
  return v14;
}

- (void)_axInsertChild:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(UICGPDFNodeAccessibilityElement *)self cachedAXElements];
    [v7 insertObject:v6 atIndex:a4];

    [(UICGPDFNodeAccessibilityElement *)self setCachedAXElements:v7];
    [(UICGPDFNodeAccessibilityElement *)self _accessibilityRemoveValueForKey:@"StoredTraits"];
  }
}

- (void)_axRemoveChild:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(UICGPDFNodeAccessibilityElement *)self cachedAXElements];
    [v5 removeObject:v4];

    [(UICGPDFNodeAccessibilityElement *)self setCachedAXElements:v5];
    [(UICGPDFNodeAccessibilityElement *)self _accessibilityRemoveValueForKey:@"StoredTraits"];
  }
}

- (id)_findOverlappingChild:(CGRect)a3 children:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    double v12 = 0;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([v15 type] != 500
            || ([v15 accessibilityElements],
                double v16 = objc_claimAutoreleasedReturnValue(),
                uint64_t v17 = [v16 count],
                v16,
                v17))
          {
            [v15 bounds];
            v31.origin.CGFloat x = x;
            v31.origin.CGFloat y = y;
            v31.size.double width = width;
            v31.size.double height = height;
            CGRect v30 = CGRectIntersection(v29, v31);
            unint64_t v18 = (unint64_t)(v30.size.width * v30.size.height);
            if ((double)(unint64_t)(width * height) * 0.1 < (double)v18 && v11 < v18)
            {
              id v20 = v15;

              unint64_t v11 = v18;
              double v12 = v20;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)_paragraphLinksInNode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 cachedAXPDFOtherLinks];
  if (!v4)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    if ([v3 nodeRef])
    {
      if (CGPDFTaggedNodeGetType() != 506)
      {
        theArraCGFloat y = (const __CFArray *)CGPDFTaggedNodeGetParagraphLinks();
        if (theArray)
        {
          CFIndex Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            for (CFIndex i = 0; i != Count; ++i)
            {
              id v6 = CFArrayGetValueAtIndex(theArray, i);
              id v7 = (void *)[objc_alloc(MEMORY[0x263F811C0]) initWithAccessibilityContainer:v3];
              id v8 = [v6 objectForKeyedSubscript:@"RangeLength"];
              int v9 = [v8 intValue];
              uint64_t v10 = v9;

              unint64_t v11 = [v6 objectForKeyedSubscript:@"RangeLocation"];
              uint64_t v12 = (int)[v11 intValue];

              uint64_t v13 = [v3 accessibilityLabel];
              char v14 = v13;
              if (v9 && v12 + v9 <= (unint64_t)[v13 length])
              {
                double v15 = objc_msgSend(v14, "substringWithRange:", v12, v9);
                [v7 setAccessibilityLabel:v15];

                double v16 = [v6 objectForKeyedSubscript:@"URI"];
                [v7 setAccessibilityIdentifier:v16];
              }
              objc_msgSend(v7, "setRange:", v12, v10);
              uint64_t v17 = [v6 objectForKeyedSubscript:@"Rect"];
              unint64_t v18 = [v17 objectForKeyedSubscript:@"Height"];
              [v18 floatValue];
              double v20 = v19;

              double v21 = [v6 objectForKeyedSubscript:@"Rect"];
              long long v22 = [v21 objectForKeyedSubscript:@"Width"];
              [v22 floatValue];
              double v24 = v23;

              long long v25 = [v6 objectForKeyedSubscript:@"Rect"];
              unint64_t v26 = [v25 objectForKeyedSubscript:@"X"];
              [v26 floatValue];
              double v28 = v27;

              CGRect v29 = [v6 objectForKeyedSubscript:@"Rect"];
              CGRect v30 = [v29 objectForKeyedSubscript:@"Y"];
              [v30 floatValue];
              double v32 = v31;

              objc_msgSend(v3, "axConvertBoundsFromPageToScreenCoordinates:", v28, v32, v24, v20);
              v40[0] = MEMORY[0x263EF8330];
              v40[1] = 3221225472;
              v40[2] = __57__UICGPDFNodeAccessibilityElement__paragraphLinksInNode___block_invoke;
              v40[3] = &__block_descriptor_64_e36__CGRect__CGPoint_dd__CGSize_dd__8__0l;
              v40[4] = v33;
              v40[5] = v34;
              v40[6] = v35;
              v40[7] = v36;
              [v7 _setAccessibilityFrameBlock:v40];
              [v4 addObject:v7];
            }
          }
        }
      }
    }
    [v3 setCachedAXPDFOtherLinks:v4];
  }

  return v4;
}

double __57__UICGPDFNodeAccessibilityElement__paragraphLinksInNode___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)_findLinkChildrenNodesOfNode:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 nodeRef];
  id v6 = [MEMORY[0x263EFF980] array];
  if (v5 && CGPDFTaggedNodeGetType() == 506)
  {
    [v6 axSafelyAddObject:v4];
  }
  else
  {
    id v7 = [v4 accessibilityElements];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [(UICGPDFNodeAccessibilityElement *)self _findLinkChildrenNodesOfNode:v12];
            [v6 axSafelyAddObjectsFromArray:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v6;
}

- (id)_findCaptionChildrenNodesOfFigureNode:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [a3 accessibilityElements];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v10, "nodeRef", (void)v12);
          if (CGPDFTaggedNodeGetType() == 106) {
            [v4 axSafelyAddObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_findFigureChildrenNodesOfTableCellNode:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 nodeRef];
  if (CGPDFTaggedNodeGetType() == 700 && [v4 isAccessibilityElement])
  {
    v20[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  }
  else
  {
    uint64_t v6 = [v4 accessibilityElements];
    id v5 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v13 = -[UICGPDFNodeAccessibilityElement _findFigureChildrenNodesOfTableCellNode:](self, "_findFigureChildrenNodesOfTableCellNode:", v12, (void)v15);
            [v5 axSafelyAddObjectsFromArray:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v5;
}

- (id)_findTableCellNodesOfTableNode:(id)a3 withHeadersOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 nodeRef];
  int Type = CGPDFTaggedNodeGetType();
  if (v4)
  {
    if (Type == 402)
    {
      v26[0] = v6;
      uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v9 = (id *)v26;
LABEL_7:
      uint64_t v10 = [v8 arrayWithObjects:v9 count:1];
      goto LABEL_18;
    }
  }
  else if (Type == 402 || ([v6 nodeRef], CGPDFTaggedNodeGetType() == 403))
  {
    id v25 = v6;
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = &v25;
    goto LABEL_7;
  }
  unint64_t v11 = [v6 accessibilityElements];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = -[UICGPDFNodeAccessibilityElement _findTableCellNodesOfTableNode:withHeadersOnly:](self, "_findTableCellNodesOfTableNode:withHeadersOnly:", v17, v4, (void)v20);
          [v10 axSafelyAddObjectsFromArray:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

LABEL_18:

  return v10;
}

- (id)_findLabelChildNodeOfListItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [a3 accessibilityElements];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v7, "nodeRef", (void)v9);
          if (CGPDFTaggedNodeGetType() == 302)
          {
            id v4 = v7;
            goto LABEL_12;
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_findTOCIChildNodeOfNode:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (UICGPDFNodeAccessibilityElement *)a3;
  uint64_t v5 = v4;
  if (v4 == self
    || ([(UICGPDFNodeAccessibilityElement *)v4 nodeRef], CGPDFTaggedNodeGetType() != 108))
  {
    [(UICGPDFNodeAccessibilityElement *)v5 accessibilityElements];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = -[UICGPDFNodeAccessibilityElement _findTOCIChildNodeOfNode:](self, "_findTOCIChildNodeOfNode:", v12, (void)v15);
            if (v13)
            {
              id v6 = (UICGPDFNodeAccessibilityElement *)v13;
              goto LABEL_15;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v6 = 0;
LABEL_15:
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (unint64_t)_findTraitsForTableCellElements
{
  v10.receiver = self;
  v10.super_class = (Class)UICGPDFNodeAccessibilityElement;
  unint64_t v3 = [(UICGPDFNodeAccessibilityElement *)&v10 accessibilityTraits];
  id v4 = [(UICGPDFNodeAccessibilityElement *)self cachedAXFigureChildrenNodesOfTableCellNode];
  if (!v4)
  {
    id v4 = [(UICGPDFNodeAccessibilityElement *)self _findFigureChildrenNodesOfTableCellNode:self];
    uint64_t v5 = (void *)[v4 mutableCopy];
    [(UICGPDFNodeAccessibilityElement *)self setCachedAXFigureChildrenNodesOfTableCellNode:v5];
  }
  uint64_t v6 = [v4 count];
  uint64_t v7 = *MEMORY[0x263F1CF00];
  if (!v6) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 | v3;

  return v8;
}

- (CGPDFTaggedNode)nodeRef
{
  return self->_nodeRef;
}

- (void)setNodeRef:(CGPDFTaggedNode *)a3
{
  self->_nodeRef = a3;
}

- (NSMutableArray)cachedAXElements
{
  return self->_cachedAXElements;
}

- (void)setCachedAXElements:(id)a3
{
}

- (NSMutableArray)cachedAXPDFLinks
{
  return self->_cachedAXPDFLinks;
}

- (void)setCachedAXPDFLinks:(id)a3
{
}

- (NSMutableArray)cachedAXPDFOtherLinks
{
  return self->_cachedAXPDFOtherLinks;
}

- (void)setCachedAXPDFOtherLinks:(id)a3
{
}

- (NSMutableArray)cachedAXPDFLinkNodes
{
  return self->_cachedAXPDFLinkNodes;
}

- (void)setCachedAXPDFLinkNodes:(id)a3
{
}

- (NSMutableArray)cachedAXPDFTableCellNodes
{
  return self->_cachedAXPDFTableCellNodes;
}

- (void)setCachedAXPDFTableCellNodes:(id)a3
{
}

- (NSMutableArray)cachedAXFigureChildrenNodesOfTableCellNode
{
  return self->_cachedAXFigureChildrenNodesOfTableCellNode;
}

- (void)setCachedAXFigureChildrenNodesOfTableCellNode:(id)a3
{
}

- (NSMutableArray)cachedAXCaptionChildrenNodesOfFigureNode
{
  return self->_cachedAXCaptionChildrenNodesOfFigureNode;
}

- (void)setCachedAXCaptionChildrenNodesOfFigureNode:(id)a3
{
}

- (int64_t)listItemNumber
{
  return self->_listItemNumber;
}

- (void)setListItemNumber:(int64_t)a3
{
  self->_listItemNumber = a3;
}

- (NSString)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(id)a3
{
}

- (NSString)altText
{
  return self->_altText;
}

- (void)setAltText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_listStyle, 0);
  objc_storeStrong((id *)&self->_cachedAXCaptionChildrenNodesOfFigureNode, 0);
  objc_storeStrong((id *)&self->_cachedAXFigureChildrenNodesOfTableCellNode, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFTableCellNodes, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFLinkNodes, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFOtherLinks, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFLinks, 0);

  objc_storeStrong((id *)&self->_cachedAXElements, 0);
}

- (void)_accessibilityInsertAnnotation:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_2423BE000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "UICGPDFNodeAccessibilityElement: Obstructed string isn't whitespace or underscore", v0, 2u);
}

@end